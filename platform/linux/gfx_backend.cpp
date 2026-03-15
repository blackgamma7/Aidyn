/*
 * gfx_backend.cpp – SDL2 + OpenGL rendering backend.
 *
 * Replaces the N64 RCP (RSP + RDP) graphics pipeline.
 *
 * The game builds N64 display lists (arrays of Gfx commands) and submits
 * them via Graphics::CreateTask() / osScScheduleTask().  On Linux:
 *
 *   1. We create an SDL2 window + OpenGL 3.3 Core context.
 *   2. Each submitted OSScTask carries a Gfx* display list pointer.
 *   3. GfxBackend::SubmitFrame() walks the display list and translates
 *      each command to an OpenGL call.  (Currently a skeleton – commands
 *      are logged/ignored until the full translator is implemented.)
 *   4. SDL_GL_SwapWindow() presents the result.
 *
 * Build dependency: SDL2, OpenGL (libGL), GLEW (or glad).
 *
 * This file is compiled only on Linux (PLATFORM_LINUX guard).
 */

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>

/* SDL2 */
#include <SDL2/SDL.h>

/* OpenGL */
#define GL_GLEXT_PROTOTYPES 1
#include <GL/gl.h>

#include "../../ultra/include/2.0I/ultra64.h"
#include "../../ultra/include/2.0I/PR/sched.h"

/* =========================================================================
 * Backend state
 * ========================================================================= */
namespace GfxBackend {

static SDL_Window   *sWindow   = nullptr;
static SDL_GLContext sGLCtx    = nullptr;
static int           sWidth    = 640;   /* 2× native 320 */
static int           sHeight   = 480;   /* 2× native 240 */
static bool          sRunning  = false;

/* VI (video interface) overrides from osViSetMode() */
static OSViMode *sCurrentMode  = nullptr;

/* =========================================================================
 * Init / Shutdown
 * ========================================================================= */
bool Init(int width, int height) {
    sWidth  = width;
    sHeight = height;

    /* ---- SDL_Init ---- */
    fprintf(stderr, "[gfx] SDL_Init(VIDEO | GAMECONTROLLER | AUDIO)...\n");
    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_GAMECONTROLLER | SDL_INIT_AUDIO) != 0) {
        fprintf(stderr, "[gfx] FATAL: SDL_Init failed: %s\n", SDL_GetError());
        return false;
    }
    fprintf(stderr, "[gfx]   SDL initialised OK\n");
    fprintf(stderr, "[gfx]   Video driver: %s\n", SDL_GetCurrentVideoDriver());

    /* ---- GL attributes ---- */
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 16);
    fprintf(stderr, "[gfx]   Requested: OpenGL 3.3 Core, double-buffered, depth=16\n");

    /* ---- Window ---- */
    fprintf(stderr, "[gfx] SDL_CreateWindow(%dx%d)...\n", width, height);
    sWindow = SDL_CreateWindow(
        "Aidyn Chronicles: The First Mage",
        SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        width, height,
        SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE);
    if (!sWindow) {
        fprintf(stderr, "[gfx] FATAL: SDL_CreateWindow failed: %s\n", SDL_GetError());
        SDL_Quit();
        return false;
    }
    fprintf(stderr, "[gfx]   Window created OK\n");

    /* ---- GL context ---- */
    fprintf(stderr, "[gfx] SDL_GL_CreateContext...\n");
    sGLCtx = SDL_GL_CreateContext(sWindow);
    if (!sGLCtx) {
        fprintf(stderr, "[gfx] FATAL: SDL_GL_CreateContext failed: %s\n", SDL_GetError());
        fprintf(stderr, "[gfx]   Hint: try SDL_VIDEODRIVER=x11 or =wayland\n");
        fprintf(stderr, "[gfx]   Hint: check that your GPU supports OpenGL 3.3\n");
        SDL_DestroyWindow(sWindow);
        SDL_Quit();
        return false;
    }
    fprintf(stderr, "[gfx]   GL context created OK\n");

    /* ---- Make current ---- */
    if (SDL_GL_MakeCurrent(sWindow, sGLCtx) != 0) {
        fprintf(stderr, "[gfx] FATAL: SDL_GL_MakeCurrent failed: %s\n", SDL_GetError());
        SDL_GL_DeleteContext(sGLCtx);
        SDL_DestroyWindow(sWindow);
        SDL_Quit();
        return false;
    }

    /* ---- VSync ---- */
    if (SDL_GL_SetSwapInterval(1) != 0) {
        fprintf(stderr, "[gfx]   VSync request failed: %s (continuing without vsync)\n",
                SDL_GetError());
    } else {
        fprintf(stderr, "[gfx]   VSync enabled\n");
    }

    /* ---- GL state ---- */
    glViewport(0, 0, width, height);
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glEnable(GL_DEPTH_TEST);

    /* ---- Verify with a test clear+swap ---- */
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    SDL_GL_SwapWindow(sWindow);

    sRunning = true;
    fprintf(stderr, "[gfx] OpenGL %s | GLSL %s | %s\n",
            (const char *)glGetString(GL_VERSION),
            (const char *)glGetString(GL_SHADING_LANGUAGE_VERSION),
            (const char *)glGetString(GL_RENDERER));
    fprintf(stderr, "[gfx] Ready (%dx%d)\n", width, height);
    return true;
}

void Shutdown() {
    fprintf(stderr, "[gfx] Shutdown: deleting GL context...\n");
    if (sGLCtx)  SDL_GL_DeleteContext(sGLCtx);
    fprintf(stderr, "[gfx] Shutdown: destroying window...\n");
    if (sWindow) SDL_DestroyWindow(sWindow);
    fprintf(stderr, "[gfx] Shutdown: SDL_Quit...\n");
    SDL_Quit();
    sGLCtx  = nullptr;
    sWindow = nullptr;
    sRunning = false;
    fprintf(stderr, "[gfx] Shutdown complete\n");
}

bool IsRunning() { return sRunning; }

/* =========================================================================
 * Event pump – call once per frame from the main thread.
 * Returns false when the user closes the window.
 * ========================================================================= */
bool PollEvents() {
    SDL_Event ev;
    while (SDL_PollEvent(&ev)) {
        switch (ev.type) {
        case SDL_QUIT:
            sRunning = false;
            return false;
        case SDL_WINDOWEVENT:
            if (ev.window.event == SDL_WINDOWEVENT_RESIZED) {
                sWidth  = ev.window.data1;
                sHeight = ev.window.data2;
                glViewport(0, 0, sWidth, sHeight);
            }
            break;
        default:
            break;
        }
    }
    return sRunning;
}

/* =========================================================================
 * Display list processing
 *
 * GBI command opcodes (upper byte of Gfx.w.hi).  Only the opcodes actually
 * used by F3DEX2 are listed.  The full set is ~50 commands.
 * ========================================================================= */
/* GBI opcode enum – use GBI_ prefix to avoid collisions with ultra64.h macros */
enum GbiCmd : u8 {
    GBI_SPNOOP        = 0x00,
    GBI_MTX           = 0x01,
    GBI_MOVEMEM       = 0x03,
    GBI_VTX           = 0x04,
    GBI_DL            = 0x06,
    GBI_ENDDL         = 0xB8,
    GBI_CULLDL        = 0xBE,
    GBI_MOVEWORD      = 0xBC,
    GBI_TEXTURE       = 0xBB,
    GBI_POPMTX        = 0xBA,
    GBI_GEOMETRYMODE  = 0xB9,
    GBI_TRI1          = 0xBF,
    GBI_TRI2          = 0xB1,
    GBI_QUAD          = 0xB5,
    GBI_RDPPIPESYNC   = 0xE7,
    GBI_RDPFULLSYNC   = 0xE9,
    GBI_SETSCISSOR    = 0xED,
    GBI_SETOTHERMODE_L= 0xE2,
    GBI_SETOTHERMODE_H= 0xE3,
    GBI_TEXRECT       = 0xE4,
    GBI_TEXRECTFLIP   = 0xE5,
    GBI_RDPLOADSYNC   = 0xE6,
    GBI_RDPTILESYNC   = 0xE8,
    GBI_LOADBLOCK     = 0xF3,
    GBI_LOADTLUT      = 0xF0,
    GBI_SETTILESIZE   = 0xF2,
    GBI_LOADTILE      = 0xF4,
    GBI_SETTILE       = 0xF5,
    GBI_FILLRECT      = 0xF6,
    GBI_SETFILLCOLOR  = 0xF7,
    GBI_SETFOGCOLOR   = 0xF8,
    GBI_SETBLENDCOLOR = 0xF9,
    GBI_SETPRIMCOLOR  = 0xFA,
    GBI_SETENVCOLOR   = 0xFB,
    GBI_SETCOMBINE    = 0xFC,
    GBI_SETTIMG       = 0xFD,
    GBI_SETZIMG       = 0xFE,
    GBI_SETCIMG       = 0xFF,
};

/*
 * SubmitFrame – translate a display list to OpenGL calls.
 *
 * This is currently a "log and skip" skeleton.  Each command is detected and
 * ignored with a comment indicating where real GL code should go.  Fill these
 * in incrementally as the port matures.
 */
static void process_display_list(const Gfx *dl, int depth = 0) {
    if (!dl || depth > 16) return; /* guard against infinite recursion */

    for (;;) {
        u8 cmd = (u8)(dl->w.hi >> 24);

        switch ((GbiCmd)cmd) {
        case GBI_SPNOOP:
        case GBI_RDPPIPESYNC:
        case GBI_RDPFULLSYNC:
        case GBI_RDPLOADSYNC:
        case GBI_RDPTILESYNC:
            /* sync / noop – nothing to do */
            break;

        case GBI_ENDDL:
            return; /* end of display list */

        case GBI_DL: {
            /* Call sub-display list */
            uintptr_t addr = (uintptr_t)dl->w.lo;
            const Gfx *subdl = reinterpret_cast<const Gfx *>(addr);
            bool branch = (dl->w.hi >> 16) & 0xFF; /* 1 = branch (replace), 0 = call */
            process_display_list(subdl, depth + 1);
            if (branch) return;
            break;
        }

        case GBI_MTX:
            /* TODO: push/load/multiply matrix onto GL matrix stack */
            break;

        case GBI_POPMTX:
            /* TODO: pop matrix stack */
            break;

        case GBI_GEOMETRYMODE:
            /* TODO: map N64 geometry mode flags to glEnable/glDisable */
            break;

        case GBI_VTX:
            /* TODO: upload vertex data to a vertex buffer */
            break;

        case GBI_TRI1:
        case GBI_TRI2:
        case GBI_QUAD:
            /* TODO: draw triangles from the loaded vertex buffer */
            break;

        case GBI_TEXTURE:
            /* TODO: set texture scale / enable */
            break;

        case GBI_SETTIMG:
            /* TODO: set the source texture image pointer */
            break;

        case GBI_SETTILE:
            /* TODO: configure tile descriptor */
            break;

        case GBI_LOADBLOCK:
        case GBI_LOADTILE:
            /* TODO: upload texture data to GL */
            break;

        case GBI_SETTILESIZE:
            /* TODO: set tile UV extents */
            break;

        case GBI_LOADTLUT:
            /* TODO: load colour palette */
            break;

        case GBI_SETCOMBINE:
            /* TODO: translate N64 combiner to GLSL shader */
            break;

        case GBI_SETOTHERMODE_L:
        case GBI_SETOTHERMODE_H:
            /* TODO: map render / blend modes */
            break;

        case GBI_SETSCISSOR:
            /* TODO: glScissor */
            break;

        case GBI_FILLRECT: {
            /* Draw a filled rectangle – used for clears / UI boxes.
             * Extract coords from the command word:
             *   hi[23:12] = XH, hi[11:0] = YH  (right/bottom, 2-frac bits)
             *   lo[23:12] = XL, lo[11:0] = YL  (left/top)
             */
            /* TODO: implement with a fullscreen-quad shader */
            break;
        }

        case GBI_SETFILLCOLOR:
            /* TODO: store fill colour for subsequent G_FILLRECT */
            break;

        case GBI_SETFOGCOLOR:
            /* TODO: glFog equivalent */
            break;

        case GBI_SETBLENDCOLOR:
        case GBI_SETENVCOLOR:
        case GBI_SETPRIMCOLOR:
            /* TODO: pass colour to shader uniforms */
            break;

        case GBI_TEXRECT:
        case GBI_TEXRECTFLIP:
            /* TODO: textured rectangle (2D sprite blit) */
            break;

        case GBI_CULLDL:
            /* TODO: frustum cull check */
            break;

        case GBI_MOVEMEM:
        case GBI_MOVEWORD:
            /* TODO: move data into RSP DMEM – map to appropriate state */
            break;

        default:
            /* Unknown command – ignore */
            break;
        }

        dl++;
    }
}

/* =========================================================================
 * StubFrame – minimal render for testing the window+GL pipeline.
 *
 * Clears to a slowly cycling dark colour and swaps.  If you see the colour
 * change, the GL context, vsync, and swap chain are all working.
 * ========================================================================= */
void StubFrame(unsigned long frameCount) {
    /* Cycle through dark blue → dark teal → dark purple very slowly */
    float t = (float)(frameCount % 600) / 600.0f;
    float r = 0.02f + 0.03f * sinf(t * 6.2832f);
    float g = 0.02f + 0.03f * sinf(t * 6.2832f + 2.094f);
    float b = 0.08f + 0.06f * sinf(t * 6.2832f + 4.189f);
    glClearColor(r, g, b, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    SDL_GL_SwapWindow(sWindow);
}

void SubmitFrame(OSScTask *task) {
    if (!task) return;

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    /* Walk the display list attached to the task */
    if (task->list.t.data_ptr) {
        process_display_list((Gfx*)task->list.t.data_ptr);
    }

    SDL_GL_SwapWindow(sWindow);
}

/* =========================================================================
 * osVi* implementations (strong definitions override os_impl.cpp weak ones)
 * ========================================================================= */
extern "C" void osViSetMode(OSViMode *mode) {
    sCurrentMode = mode;
    /* The game sets up 320×240 or 512×240; we always render at sWidth×sHeight */
}

extern "C" void osViBlack(u8 active) {
    if (active) {
        glClearColor(0,0,0,1);
        glClear(GL_COLOR_BUFFER_BIT);
        if (sWindow) SDL_GL_SwapWindow(sWindow);
    }
}

extern "C" void osViSetYScale(float scale) { (void)scale; }

extern "C" void osViSwapBuffer(void *buffer) {
    /* The game sometimes calls this directly; swap now. */
    (void)buffer;
    if (sWindow) SDL_GL_SwapWindow(sWindow);
}

} /* namespace GfxBackend */
