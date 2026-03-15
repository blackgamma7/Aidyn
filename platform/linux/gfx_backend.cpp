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

/* SDL2 */
#include <SDL2/SDL.h>

/* OpenGL – use GLEW or define GL_GLEXT_PROTOTYPES before including gl.h */
#define GL_GLEXT_PROTOTYPES 1
#include <GL/gl.h>
#include <GL/glu.h>

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

    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_GAMECONTROLLER | SDL_INIT_AUDIO) != 0) {
        fprintf(stderr, "[gfx] SDL_Init failed: %s\n", SDL_GetError());
        return false;
    }

    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 16);

    sWindow = SDL_CreateWindow(
        "Aidyn Chronicles: The First Mage",
        SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        width, height,
        SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE);
    if (!sWindow) {
        fprintf(stderr, "[gfx] SDL_CreateWindow failed: %s\n", SDL_GetError());
        SDL_Quit();
        return false;
    }

    sGLCtx = SDL_GL_CreateContext(sWindow);
    if (!sGLCtx) {
        fprintf(stderr, "[gfx] SDL_GL_CreateContext failed: %s\n", SDL_GetError());
        SDL_DestroyWindow(sWindow);
        SDL_Quit();
        return false;
    }

    SDL_GL_SetSwapInterval(1); /* vsync */

    glViewport(0, 0, width, height);
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glEnable(GL_DEPTH_TEST);

    sRunning = true;
    fprintf(stderr, "[gfx] OpenGL %s ready (%dx%d)\n",
            (const char *)glGetString(GL_VERSION), width, height);
    return true;
}

void Shutdown() {
    if (sGLCtx)  SDL_GL_DeleteContext(sGLCtx);
    if (sWindow) SDL_DestroyWindow(sWindow);
    SDL_Quit();
    sGLCtx  = nullptr;
    sWindow = nullptr;
    sRunning = false;
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
enum GbiCmd : u8 {
    G_SPNOOP        = 0x00,
    G_MTX           = 0x01,
    G_MOVEMEM       = 0x03,
    G_VTX           = 0x04,
    G_DL            = 0x06,
    G_ENDDL         = 0xB8,
    G_CULLDL        = 0xBE,
    G_MOVEWORD      = 0xBC,
    G_TEXTURE       = 0xBB,
    G_POPMTX        = 0xBA,
    G_GEOMETRYMODE  = 0xB9,
    G_TRI1          = 0xBF,
    G_TRI2          = 0xB1,
    G_QUAD          = 0xB5,
    G_LINE3D        = 0xB9,
    G_RDPPIPESYNC   = 0xE7,
    G_RDPFULLSYNC   = 0xE9,
    G_SETSCISSOR    = 0xED,
    G_SETOTHERMODE_L= 0xE2,
    G_SETOTHERMODE_H= 0xE3,
    G_TEXRECT       = 0xE4,
    G_TEXRECTFLIP   = 0xE5,
    G_RDPLOADSYNC   = 0xE6,
    G_RDPTILESYNC   = 0xE8,
    G_LOADBLOCK     = 0xF3,
    G_LOADTLUT      = 0xF0,
    G_SETTILESIZE   = 0xF2,
    G_LOADTILE      = 0xF4,
    G_SETTILE       = 0xF5,
    G_FILLRECT      = 0xF6,
    G_SETFILLCOLOR  = 0xF7,
    G_SETFOGCOLOR   = 0xF8,
    G_SETBLENDCOLOR = 0xF9,
    G_SETPRIMCOLOR  = 0xFA,
    G_SETENVCOLOR   = 0xFB,
    G_SETCOMBINE    = 0xFC,
    G_SETTIMG       = 0xFD,
    G_SETZIMG       = 0xFE,
    G_SETCIMG       = 0xFF,
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
        case G_SPNOOP:
        case G_RDPPIPESYNC:
        case G_RDPFULLSYNC:
        case G_RDPLOADSYNC:
        case G_RDPTILESYNC:
            /* sync / noop – nothing to do */
            break;

        case G_ENDDL:
            return; /* end of display list */

        case G_DL: {
            /* Call sub-display list */
            uintptr_t addr = (uintptr_t)dl->w.lo;
            const Gfx *subdl = reinterpret_cast<const Gfx *>(addr);
            bool branch = (dl->w.hi >> 16) & 0xFF; /* 1 = branch (replace), 0 = call */
            process_display_list(subdl, depth + 1);
            if (branch) return;
            break;
        }

        case G_MTX:
            /* TODO: push/load/multiply matrix onto GL matrix stack */
            break;

        case G_POPMTX:
            /* TODO: pop matrix stack */
            break;

        case G_GEOMETRYMODE:
            /* TODO: map N64 geometry mode flags to glEnable/glDisable */
            break;

        case G_VTX:
            /* TODO: upload vertex data to a vertex buffer */
            break;

        case G_TRI1:
        case G_TRI2:
        case G_QUAD:
            /* TODO: draw triangles from the loaded vertex buffer */
            break;

        case G_TEXTURE:
            /* TODO: set texture scale / enable */
            break;

        case G_SETTIMG:
            /* TODO: set the source texture image pointer */
            break;

        case G_SETTILE:
            /* TODO: configure tile descriptor */
            break;

        case G_LOADBLOCK:
        case G_LOADTILE:
            /* TODO: upload texture data to GL */
            break;

        case G_SETTILESIZE:
            /* TODO: set tile UV extents */
            break;

        case G_LOADTLUT:
            /* TODO: load colour palette */
            break;

        case G_SETCOMBINE:
            /* TODO: translate N64 combiner to GLSL shader */
            break;

        case G_SETOTHERMODE_L:
        case G_SETOTHERMODE_H:
            /* TODO: map render / blend modes */
            break;

        case G_SETSCISSOR:
            /* TODO: glScissor */
            break;

        case G_FILLRECT: {
            /* Draw a filled rectangle – used for clears / UI boxes.
             * Extract coords from the command word:
             *   hi[23:12] = XH, hi[11:0] = YH  (right/bottom, 2-frac bits)
             *   lo[23:12] = XL, lo[11:0] = YL  (left/top)
             */
            /* TODO: implement with a fullscreen-quad shader */
            break;
        }

        case G_SETFILLCOLOR:
            /* TODO: store fill colour for subsequent G_FILLRECT */
            break;

        case G_SETFOGCOLOR:
            /* TODO: glFog equivalent */
            break;

        case G_SETBLENDCOLOR:
        case G_SETENVCOLOR:
        case G_SETPRIMCOLOR:
            /* TODO: pass colour to shader uniforms */
            break;

        case G_TEXRECT:
        case G_TEXRECTFLIP:
            /* TODO: textured rectangle (2D sprite blit) */
            break;

        case G_CULLDL:
            /* TODO: frustum cull check */
            break;

        case G_MOVEMEM:
        case G_MOVEWORD:
            /* TODO: move data into RSP DMEM – map to appropriate state */
            break;

        default:
            /* Unknown command – ignore */
            break;
        }

        dl++;
    }
}

void SubmitFrame(OSScTask *task) {
    if (!task) return;

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    /* Walk the display list attached to the task */
    if (task->list.data_ptr) {
        process_display_list(task->list.data_ptr);
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
