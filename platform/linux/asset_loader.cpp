/*
 * asset_loader.cpp – Replace N64 ROM DMA with Linux file I/O.
 *
 * On N64 the game reads assets from the ROM cartridge via osPiStartDma().
 * On Linux we map virtual ROM addresses to a memory-mapped or file-based
 * asset store.
 *
 * Two modes are supported:
 *   1. ROM image mode  – the raw .z64 ROM is memory-mapped; DMA reads become
 *                        memcpy() from the mapped region.
 *   2. Extracted mode  – assets are extracted to disk by the splat toolchain;
 *                        reads are resolved via an address→file index.
 *
 * Start with mode 1 (ROM image), which requires zero preprocessing.
 *
 * Setup:
 *   Call AssetLoader::Init("path/to/baserom.debug.z64") from main().
 *   All subsequent osPiStartDma() calls will copy from the mapped ROM.
 *
 * Save files:
 *   Controller Pak saves are redirected to ~/.local/share/aidyn/save.dat
 */

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cerrno>
#include <cassert>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#include "../../ultra/include/2.0I/ultra64.h"
#include "../../ultra/include/2.0I/PR/sched.h"

/* =========================================================================
 * Asset loader state
 * ========================================================================= */
namespace AssetLoader {

static const u8 *sRomBase = nullptr;   /* mmap base of ROM image        */
static size_t    sRomSize = 0;         /* ROM file size in bytes         */
static int       sRomFd   = -1;


bool Init(const char *romPath) {
    sRomFd = open(romPath, O_RDONLY);
    if (sRomFd < 0) {
        fprintf(stderr, "[asset_loader] Cannot open ROM '%s': %s\n",
                romPath, strerror(errno));
        return false;
    }

    struct stat st;
    if (fstat(sRomFd, &st) < 0) {
        fprintf(stderr, "[asset_loader] fstat failed: %s\n", strerror(errno));
        close(sRomFd);
        sRomFd = -1;
        return false;
    }

    sRomSize = (size_t)st.st_size;
    sRomBase = (const u8 *)mmap(nullptr, sRomSize, PROT_READ, MAP_PRIVATE, sRomFd, 0);
    if (sRomBase == MAP_FAILED) {
        fprintf(stderr, "[asset_loader] mmap failed: %s\n", strerror(errno));
        close(sRomFd);
        sRomFd = -1;
        sRomBase = nullptr;
        return false;
    }

    fprintf(stderr, "[asset_loader] ROM mapped: %zu bytes from '%s'\n",
            sRomSize, romPath);
    return true;
}

void Shutdown() {
    if (sRomBase && sRomBase != MAP_FAILED) {
        munmap((void *)sRomBase, sRomSize);
        sRomBase = nullptr;
    }
    if (sRomFd >= 0) {
        close(sRomFd);
        sRomFd = -1;
    }
}

/*
 * DmaRead – copy bytes from the ROM image to virtual RAM.
 *
 * devAddr: ROM byte offset (physical address on N64 cart).
 * vAddr  : destination pointer in heap.
 * nbytes : number of bytes to copy.
 *
 * N64 ROM addresses typically start at 0x10000000 (PI bus base).
 * The game's linker script places ROM data at that base; we strip it.
 */
static constexpr u32 PI_ROM_BASE = 0x10000000u;

bool DmaRead(u32 devAddr, void *vAddr, u32 nbytes) {
    if (!sRomBase) {
        fprintf(stderr, "[asset_loader] DmaRead: ROM not initialised\n");
        return false;
    }

    /* Strip the PI bus base address to get a file offset */
    u32 offset = (devAddr >= PI_ROM_BASE) ? devAddr - PI_ROM_BASE : devAddr;

    if (offset + nbytes > sRomSize) {
        fprintf(stderr, "[asset_loader] DmaRead out of range: offset=0x%08X size=%u romSize=%zu\n",
                offset, nbytes, sRomSize);
        /* Partial copy with zero-pad for robustness */
        u32 avail = (offset < sRomSize) ? (u32)(sRomSize - offset) : 0;
        if (avail) memcpy(vAddr, sRomBase + offset, avail);
        memset((u8 *)vAddr + avail, 0, nbytes - avail);
        return false;
    }

    memcpy(vAddr, sRomBase + offset, nbytes);
    return true;
}

} /* namespace AssetLoader */

/* =========================================================================
 * osPiStartDma – called by RomCopy::RomCopy() to kick off a DMA transfer.
 *
 * On Linux we perform the copy synchronously and immediately post the
 * completion message.  This matches the "blocking" behaviour the game
 * depends on (it always waits on msgQ before using the data).
 * ========================================================================= */
extern "C" s32 osPiStartDma(OSIoMesg *mb, s32 pri, s32 dir,
                              u32 devAddr, void *vAddr, u32 nbytes,
                              OSMesgQueue *mq) {
    (void)pri;

    if (dir == 0 /* OS_READ */) {
        AssetLoader::DmaRead(devAddr, vAddr, nbytes);
    } else {
        /* ROM writes are not meaningful on Linux */
        fprintf(stderr, "[asset_loader] osPiStartDma: write to ROM ignored\n");
    }

    /* Post completion message – caller blocks on mq */
    if (mq && mb) {
        osSendMesg(mq, (OSMesg)mb, OS_MESG_NOBLOCK);
    }

    return 0;
}

/* =========================================================================
 * Save file helpers
 *
 * The game uses Controller Pak files for saves.  On Linux we redirect them
 * to a plain file in the user's home directory.
 * ========================================================================= */
namespace SaveFile {

static char sSavePath[512] = {};

static void ensure_dir(const char *path) {
    /* Create parent directory if it doesn't exist */
    char tmp[512];
    snprintf(tmp, sizeof(tmp), "%s", path);
    for (char *p = tmp + 1; *p; p++) {
        if (*p == '/') {
            *p = '\0';
            mkdir(tmp, 0755);
            *p = '/';
        }
    }
}

void Init() {
    const char *home = getenv("HOME");
    if (!home) home = "/tmp";
    snprintf(sSavePath, sizeof(sSavePath), "%s/.local/share/aidyn", home);
    ensure_dir(sSavePath);
    snprintf(sSavePath + strlen(sSavePath),
             sizeof(sSavePath) - strlen(sSavePath), "/save.dat");
}

bool Read(u32 offset, u8 *buf, u32 size) {
    FILE *f = fopen(sSavePath, "rb");
    if (!f) return false;
    fseek(f, offset, SEEK_SET);
    bool ok = (fread(buf, 1, size, f) == size);
    fclose(f);
    return ok;
}

bool Write(u32 offset, const u8 *buf, u32 size) {
    FILE *f = fopen(sSavePath, "r+b");
    if (!f) f = fopen(sSavePath, "wb");
    if (!f) return false;
    fseek(f, offset, SEEK_SET);
    bool ok = (fwrite(buf, 1, size, f) == size);
    fclose(f);
    return ok;
}

} /* namespace SaveFile */
