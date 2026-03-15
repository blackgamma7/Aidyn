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
#include <SDL2/SDL.h>

#include "../../ultra/include/2.0I/ultra64.h"
#include "../../ultra/include/2.0I/PR/sched.h"

/* =========================================================================
 * Forward declarations for backend namespaces
 * ========================================================================= */
namespace GfxBackend   { bool Init(int w, int h); void Shutdown(); bool PollEvents(); void StubFrame(unsigned long frameCount); }
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
    bool        noAudio;
    bool        noRom;
};

static Config gConfig = {
    .romPath   = "baserom.debug.z64",
    .width     = 640,
    .height    = 480,
    .audioFreq = 44100,
    .fullscreen= false,
    .pal       = false,
    .noAudio   = false,
    .noRom     = false,
};

static void print_usage(const char *argv0) {
    fprintf(stderr,
        "Usage: %s [options] [rom_file]\n"
        "  --width  N      Window width  (default 640)\n"
        "  --height N      Window height (default 480)\n"
        "  --fullscreen    Fullscreen mode\n"
        "  --pal           Run at 50 Hz (PAL timing)\n"
        "  --freq   N      Audio sample rate (default 44100)\n"
        "  --no-audio      Skip audio initialisation\n"
        "  --no-rom        Skip ROM loading (window-only test)\n"
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
        } else if (strcmp(argv[i], "--no-audio") == 0) {
            gConfig.noAudio = true;
        } else if (strcmp(argv[i], "--no-rom") == 0) {
            gConfig.noRom = true;
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
    fprintf(stderr, "========================================\n");
    fprintf(stderr, "[boot] Aidyn Chronicles – Linux native\n");
    fprintf(stderr, "========================================\n");

    fprintf(stderr, "[boot] [1/8] Parsing command-line args...\n");
    if (!parse_args(argc, argv)) return 1;
    fprintf(stderr, "[boot]        %dx%d %s | audio=%s | rom=%s\n",
            gConfig.width, gConfig.height,
            gConfig.pal ? "PAL" : "NTSC",
            gConfig.noAudio ? "DISABLED" : "enabled",
            gConfig.noRom   ? "DISABLED" : gConfig.romPath);

    /* Set TV type based on --pal flag */
    osTvType = gConfig.pal ? OS_TV_PAL : OS_TV_NTSC;

    /* 1. Graphics window */
    fprintf(stderr, "[boot] [2/8] Initialising SDL2 + OpenGL window...\n");
    if (!GfxBackend::Init(gConfig.width, gConfig.height)) {
        fprintf(stderr, "[boot] FATAL: Failed to initialise graphics.\n");
        return 1;
    }
    fprintf(stderr, "[boot]        Window + GL context created OK\n");

    /* 2. ROM asset loader */
    bool romLoaded = false;
    if (gConfig.noRom) {
        fprintf(stderr, "[boot] [3/8] ROM loading SKIPPED (--no-rom)\n");
    } else {
        fprintf(stderr, "[boot] [3/8] Loading ROM '%s'...\n", gConfig.romPath);
        romLoaded = AssetLoader::Init(gConfig.romPath);
        if (!romLoaded) {
            fprintf(stderr, "[boot]        ROM load failed – continuing without ROM\n");
            fprintf(stderr, "[boot]        (provide baserom as first argument, or use --no-rom)\n");
        }
    }

    /* 3. Save files */
    fprintf(stderr, "[boot] [4/8] Initialising save file redirection...\n");
    SaveFile::Init();

    /* 4. Audio */
    if (gConfig.noAudio) {
        fprintf(stderr, "[boot] [5/8] Audio SKIPPED (--no-audio)\n");
    } else {
        fprintf(stderr, "[boot] [5/8] Initialising audio (%d Hz)...\n", gConfig.audioFreq);
        if (!AudioBackend::Init(gConfig.audioFreq)) {
            fprintf(stderr, "[boot]        Audio init failed – continuing without audio\n");
        }
    }

    /* 5. Input */
    fprintf(stderr, "[boot] [6/8] Initialising input...\n");
    InputBackend::Init();
    fprintf(stderr, "[boot]        Input ready\n");

    /* Decide whether to launch game thread or run in stub mode.
     * Stub mode: stable window at ~60 FPS with no game logic.
     * Useful for verifying the SDL+GL pipeline works on a new system. */
    const bool stubMode = gConfig.noRom && !romLoaded;

    if (stubMode) {
        /* ---- Stub mode: stable window at ~60 FPS, no game logic ---- */
        fprintf(stderr, "[boot] [7/8] Stub mode – no game thread (ROM not loaded)\n");
        fprintf(stderr, "[boot] [8/8] Entering stub render loop\n");
        fprintf(stderr, "[boot]        Press ESC or close window to exit\n");
        fprintf(stderr, "========================================\n");
        fprintf(stderr, "[stub] Running – black window + vsync\n");

        unsigned long frameCount = 0;
        Uint32 lastTick = SDL_GetTicks();
        Uint32 fpsTimer = lastTick;

        while (GfxBackend::PollEvents()) {
            /* Check for ESC key or quit events */
            SDL_Event ev;
            while (SDL_PollEvent(&ev)) {
                if (ev.type == SDL_QUIT) goto done;
                if (ev.type == SDL_KEYDOWN && ev.key.keysym.sym == SDLK_ESCAPE) goto done;
                InputBackend::ProcessEvent(&ev);
            }

            /* Minimal render: clear to dark blue so you know GL is alive */
            GfxBackend::StubFrame(frameCount);
            frameCount++;

            /* Print FPS every 5 seconds */
            Uint32 now = SDL_GetTicks();
            if (now - fpsTimer >= 5000) {
                float fps = (float)(frameCount * 1000) / (float)(now - lastTick);
                fprintf(stderr, "[stub] Frame %lu | %.1f FPS\n", frameCount, fps);
                fpsTimer = now;
            }
        }
    } else {
        /* ---- Normal mode: launch game thread ---- */
        fprintf(stderr, "[boot] [7/8] Launching game thread (InitProc)...\n");
        pthread_create(&gGameThread, nullptr, game_thread, nullptr);
        fprintf(stderr, "[boot] [8/8] Entering SDL event loop\n");
        fprintf(stderr, "========================================\n");

        while (GfxBackend::PollEvents() && gGameRunning) {
            SDL_Event ev;
            while (SDL_PollEvent(&ev)) {
                if (!InputBackend::ProcessEvent(&ev)) {
                    if (ev.type == SDL_QUIT) goto done;
                }
            }
            SDL_Delay(1);
        }
    }

done:
    fprintf(stderr, "========================================\n");
    fprintf(stderr, "[shutdown] Cleaning up...\n");

    /* Signal game to stop and wait for thread */
    if (!stubMode) {
        gGameRunning = false;
        pthread_cancel(gGameThread);
        pthread_join(gGameThread, nullptr);
        fprintf(stderr, "[shutdown] Game thread joined\n");
    }

    fprintf(stderr, "[shutdown] Input...\n");
    InputBackend::Shutdown();
    if (!gConfig.noAudio) {
        fprintf(stderr, "[shutdown] Audio...\n");
        AudioBackend::Shutdown();
    }
    if (!gConfig.noRom) {
        fprintf(stderr, "[shutdown] Assets...\n");
        AssetLoader::Shutdown();
    }
    fprintf(stderr, "[shutdown] Graphics...\n");
    GfxBackend::Shutdown();
    fprintf(stderr, "[shutdown] Done. Goodbye.\n");
    fprintf(stderr, "========================================\n");

    return 0;
}
