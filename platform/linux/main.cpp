/*
 * main.cpp – Linux native entry point for Aidyn Chronicles.
 *
 * Replaces the N64 boot sequence (bootproc → InitProc in seed.cpp).
 *
 * Startup sequence:
 *   1. Parse command-line arguments (ROM path, options)
 *   2. Initialise SDL2 + OpenGL window (GfxBackend::Init)
 *   3. Memory-map the ROM for DMA reads (AssetLoader::Init)
 *   4. Set up save-file redirection (SaveFile::Init)
 *   5. Initialise audio (AudioBackend::Init)
 *   6. Initialise input (InputBackend::Init)
 *   7. Call the game's InitProc() — equivalent of the N64 boot thread
 *   8. Run the SDL event loop until the window closes
 *
 * The game's InitProc (in src_pseudo/seed.cpp) sets up the scheduler,
 * graphics, audio and controller subsystems then calls appInit() which
 * drives the main game loop.  On N64 InitProc runs on its own thread;
 * here we launch it on a dedicated pthread so SDL events can be pumped
 * from the main thread.
 */

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <pthread.h>
#include <SDL2/SDL.h>

#include "../../ultra/include/2.0I/ultra64.h"
#include "../../ultra/include/2.0I/PR/sched.h"

/* =========================================================================
 * Forward declarations for backend namespaces
 * ========================================================================= */
namespace GfxBackend   { bool Init(int w, int h); void Shutdown(); bool PollEvents(); }
namespace AudioBackend { bool Init(int freq);      void Shutdown(); }
namespace InputBackend { void Init(); void Shutdown(); bool ProcessEvent(const SDL_Event *ev); }
namespace AssetLoader  { bool Init(const char *rom); void Shutdown(); }
namespace SaveFile     { void Init(); }

/* =========================================================================
 * Game entry point (defined in src_pseudo/seed.cpp, compiled into game lib)
 * ========================================================================= */
extern "C" void InitProc(void *arg);  /* The game's initialisation thread */

/* =========================================================================
 * Configuration
 * ========================================================================= */
struct Config {
    const char *romPath;
    int         width;
    int         height;
    int         audioFreq;
    bool        fullscreen;
    bool        pal;
};

static Config gConfig = {
    .romPath   = "baserom.debug.z64",
    .width     = 640,
    .height    = 480,
    .audioFreq = 44100,
    .fullscreen= false,
    .pal       = false,
};

static void print_usage(const char *argv0) {
    fprintf(stderr,
        "Usage: %s [options] [rom_file]\n"
        "  --width  N      Window width  (default 640)\n"
        "  --height N      Window height (default 480)\n"
        "  --fullscreen    Fullscreen mode\n"
        "  --pal           Run at 50 Hz (PAL timing)\n"
        "  --freq   N      Audio sample rate (default 44100)\n"
        "  -h / --help     Show this message\n",
        argv0);
}

static bool parse_args(int argc, char **argv) {
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--help") == 0 || strcmp(argv[i], "-h") == 0) {
            print_usage(argv[0]);
            return false;
        } else if (strcmp(argv[i], "--width") == 0 && i + 1 < argc) {
            gConfig.width = atoi(argv[++i]);
        } else if (strcmp(argv[i], "--height") == 0 && i + 1 < argc) {
            gConfig.height = atoi(argv[++i]);
        } else if (strcmp(argv[i], "--freq") == 0 && i + 1 < argc) {
            gConfig.audioFreq = atoi(argv[++i]);
        } else if (strcmp(argv[i], "--fullscreen") == 0) {
            gConfig.fullscreen = true;
        } else if (strcmp(argv[i], "--pal") == 0) {
            gConfig.pal = true;
        } else if (argv[i][0] != '-') {
            gConfig.romPath = argv[i];
        } else {
            fprintf(stderr, "Unknown option: %s\n", argv[i]);
            print_usage(argv[0]);
            return false;
        }
    }
    return true;
}

/* =========================================================================
 * Game thread
 *
 * InitProc() never returns on N64 (it ends with while(1){}).  On Linux
 * we run it on this dedicated thread so that the main thread can keep
 * pumping SDL events.
 * ========================================================================= */
static pthread_t gGameThread;
static volatile bool gGameRunning = false;

static void *game_thread(void *) {
    gGameRunning = true;
    InitProc(nullptr);
    gGameRunning = false;
    return nullptr;
}

/* =========================================================================
 * Heap / memory check stubs
 *
 * MemoryCheck() on N64 measures actual RDRAM and sets up framebuffers.
 * On Linux we provide generous fixed values and let the game's heap
 * allocator (HeapInit / HALLOC) use system malloc via the heapN64 shim.
 * ========================================================================= */

/* These symbols are referenced by seed.cpp / memcheck.h */
extern "C" {
    extern void MemoryCheck(uintptr_t ramstart, uintptr_t size);
    extern void HeapInit(void *start, size_t size);
}

/* Linker symbols that seed.cpp expects to exist */
void *romMain  = nullptr;  /* start of "ROM code" – not meaningful on Linux */
void *clear_end = nullptr; /* end of BSS */

/* =========================================================================
 * main()
 * ========================================================================= */
int main(int argc, char **argv) {
    if (!parse_args(argc, argv)) return 1;

    /* Set TV type based on --pal flag */
    osTvType = gConfig.pal ? OS_TV_PAL : OS_TV_NTSC;

    /* 1. Graphics window */
    if (!GfxBackend::Init(gConfig.width, gConfig.height)) {
        fprintf(stderr, "[main] Failed to initialise graphics.\n");
        return 1;
    }

    /* 2. ROM asset loader */
    if (!AssetLoader::Init(gConfig.romPath)) {
        fprintf(stderr, "[main] Failed to load ROM '%s'.\n"
                        "       Provide the baserom as the first argument.\n",
                gConfig.romPath);
        /* Allow running without ROM for testing the boot sequence */
    }

    /* 3. Save files */
    SaveFile::Init();

    /* 4. Audio */
    AudioBackend::Init(gConfig.audioFreq);

    /* 5. Input */
    InputBackend::Init();

    /* 6. Launch game thread */
    pthread_create(&gGameThread, nullptr, game_thread, nullptr);

    /* 7. SDL event loop (main thread only) */
    while (GfxBackend::PollEvents() && gGameRunning) {
        SDL_Event ev;
        /* PollEvents() already drained the queue; check residual events */
        while (SDL_PollEvent(&ev)) {
            if (!InputBackend::ProcessEvent(&ev)) {
                if (ev.type == SDL_QUIT) goto done;
            }
        }
        /* Small sleep to avoid spinning at 100% CPU between vsync wakeups */
        SDL_Delay(1);
    }

done:
    /* Signal game to stop and wait for thread */
    gGameRunning = false;
    pthread_cancel(gGameThread);
    pthread_join(gGameThread, nullptr);

    InputBackend::Shutdown();
    AudioBackend::Shutdown();
    AssetLoader::Shutdown();
    GfxBackend::Shutdown();

    return 0;
}
