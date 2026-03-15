/*
 * ultra64.h - Linux native compatibility shim for N64 libultra SDK
 *
 * Replaces the N64 SDK headers so that game source code (src_pseudo/) can be
 * compiled natively on x86-64 Linux.  Actual implementations live in
 * platform/linux/os_impl.cpp and the other backend files.
 */
#pragma once

#include <stdint.h>
#include <stddef.h>
#include <string.h>

/* =========================================================================
 * Basic N64 integer types
 * ========================================================================= */
typedef uint8_t   u8;
typedef int8_t    s8;
typedef uint16_t  u16;
typedef int16_t   s16;
typedef uint32_t  u32;
typedef int32_t   s32;
typedef uint64_t  u64;
typedef int64_t   s64;
typedef float     f32;
typedef double    f64;
typedef u64       OSTime;
typedef s32       OSPri;
typedef u32       OSId;
typedef u32       OSEvent;

/* =========================================================================
 * TV / region
 * ========================================================================= */
#define OS_TV_PAL   0
#define OS_TV_NTSC  1
#define OS_TV_MPAL  2

extern u32 osTvType;

/* =========================================================================
 * Thread priorities
 * ========================================================================= */
#define OS_PRIORITY_IDLE      0
#define OS_PRIORITY_APPMAX    127
#define OS_PRIORITY_PIMGR     150
#define OS_PRIORITY_VIMGR     254
#define OS_PRIORITY_RMON      250

/* =========================================================================
 * Message queues
 * ========================================================================= */
typedef void *OSMesg;

#define OS_MESG_BLOCK    0
#define OS_MESG_NOBLOCK  1
#define OS_MESG_PRI_NORMAL 0
#define OS_MESG_PRI_HIGH   1

#ifdef __cplusplus
#include <mutex>
#include <condition_variable>
#include <queue>

struct OSMesgQueue {
    std::mutex              mtx;
    std::condition_variable cv;
    OSMesg                 *msgBuf;   /* caller-supplied ring buffer (unused on Linux but kept for ABI) */
    s32                     msgCount; /* capacity */
    std::queue<OSMesg>      msgs;
};

#else
/* C-visible opaque layout (must be at least as large as the C++ version) */
typedef struct {
    unsigned char opaque[128];
} OSMesgQueue;
#endif /* __cplusplus */

/* =========================================================================
 * I/O message (used by Pi manager DMA)
 * ========================================================================= */
typedef struct {
    OSMesg  hdr;
    u32     type;
    u32     pri;
    u32     devAddr;
    void   *vAddr;
    u32     nbytes;
    s32     status;
} OSIoMesg;

/* =========================================================================
 * OS Thread
 * ========================================================================= */
#include <pthread.h>

typedef struct OSThread_s {
    struct OSThread_s *next;
    OSPri              priority;
    OSId               id;
    pthread_t          thread;
    pthread_attr_t     attr;
    /* entry / arg stored so we can start later */
    void             (*entry)(void *);
    void              *arg;
    int                started;
} OSThread;

/* =========================================================================
 * Video interface (VI)
 * ========================================================================= */
typedef struct {
    struct {
        u32 type;
        u32 width;
        u32 burst;
        u32 vSync;
        u32 hSync;
        u32 leap;
        u32 hStart;
        u32 xScale;
        u32 vCurrent;
    } comRegs;
    struct {
        u32 origin;
        u32 yScale;
        u32 vStart;
        u32 vBurst;
        u32 vIntr;
        u32 vScale;
    } fldRegs[2];
} OSViMode;

/* Pre-defined VI mode table indices */
#define OS_VI_NTSC_LAN1  2
#define OS_VI_PAL_LAN1  10
#define OS_VI_MPAL_LAN1  6

extern OSViMode osViModeTable[];

/* =========================================================================
 * Graphics – Gfx display list command (64-bit word)
 *
 * On Linux these words are written to a buffer that the rendering backend
 * interprets.  The GBI macros below write minimal sentinel data so the
 * buffer is not empty, but actual OpenGL calls are driven by gfx_backend.cpp.
 * ========================================================================= */
typedef union {
    u64 force_structure_alignment;
    struct { u32 hi, lo; } w;
    struct {
        u8  cmd;
        u8  pad[3];
        u32 lo;
    } dma;
} Gfx;

/* Fixed-point 4x4 matrix (N64 format: 16.16) */
typedef struct {
    s16 m[4][4];
    u16 f[4][4];
} Mtx, Mtx_t;

/* Viewport */
typedef struct {
    s16 vscale[4];
    s16 vtrans[4];
} Vp, Vp_t;

/* =========================================================================
 * Controller / Controller Pak
 * ========================================================================= */
#define MAXCONTROLLERS 4

/* Button bitmasks (matching N64 SDK) */
#define CONT_A        0x8000
#define CONT_B        0x4000
#define CONT_G        0x2000  /* Z trigger */
#define CONT_START    0x1000
#define CONT_UP       0x0800
#define CONT_DOWN     0x0400
#define CONT_LEFT     0x0200
#define CONT_RIGHT    0x0100
#define CONT_L        0x0020
#define CONT_R        0x0010
#define U_CBUTTONS    0x0008
#define D_CBUTTONS    0x0004
#define L_CBUTTONS    0x0002
#define R_CBUTTONS    0x0001

typedef struct {
    u16 type;
    u8  status;
    u8  errno_;
} OSContStatus;

typedef struct {
    u16 button;
    s8  stick_x;
    s8  stick_y;
    u8  errno_;
} OSContPad;

typedef struct {
    int channel;
    int initialized;
} OSPfs;

/* PFS error codes */
#define PFS_ERR_NOPACK      1
#define PFS_ERR_NEW_PACK    2
#define PFS_ERR_INCONSISTENT 3
#define PFS_ERR_BAD_DATA    5
#define PFS_ERR_ID_FATAL    6

/* =========================================================================
 * Audio types (ALSynth / libultra audio subsystem)
 *
 * The game uses the N64 audio library (alSynNew, ALPlayer, ALHeap, etc.).
 * On Linux these are all stubbed – the real audio backend (SDL_mixer or
 * OpenAL) is driven from audio_backend.cpp.
 * ========================================================================= */
typedef s32 ALMicroTime;

typedef struct {
    u8 *base;
    u8 *cur;
    s32 len;
    s32 count;
} ALHeap;

typedef struct {
    u8  type;
    u8  flags;
    u8  loopCount;
    u8  pad;
    u32 base;
    u32 len;
    /* loop / adpcm data omitted – not needed for stubs */
} ALWaveTable;

typedef struct {
    int id;
    int active;
    ALWaveTable *wavetable;
    s32  pitch;
    u8   vol;
    u8   pan;
} ALVoice;

typedef struct {
    int dummy;
} ALSynConfig;

typedef struct {
    /* Opaque stub – real implementation in audio_backend.cpp */
    int voiceCount;
    void *backend;
} ALSynth;

typedef struct {
    int dummy;
} ALGlobals;

typedef struct {
    ALMicroTime (*handler)(void *);
    void *node;
    ALGlobals *globals;
    int active;
} ALPlayer;

/* Acmd – RSP audio command (8 bytes, same as Gfx) */
typedef union {
    u64 force_structure_alignment;
    struct { u32 w0, w1; } words;
} Acmd;

/* Stubs */
typedef void (*ALVoiceHandler)(void *);

/* Wave types */
#define AL_ADPCM_WAVE  0
#define AL_RAW16_WAVE  1
#ifndef AL_RAW8_WAVE
#define AL_RAW8_WAVE   2
#endif

/* =========================================================================
 * GBI – Graphics Binary Interface macros
 *
 * All macros expand to a no-op pointer advance.  The real display list
 * format is N64-specific; on Linux we rely on the backend to render game
 * state through its own API rather than parsing the binary display list.
 *
 * Macros that *return* Gfx* (the functional API) just return gdl unchanged.
 * Macros that write via pointer (the statement API) just advance the pointer.
 * ========================================================================= */

/* Helper – write a stub command and advance */
#define _GBI_NOP(gdl) do { (gdl)->w.hi = 0; (gdl)->w.lo = 0; (gdl)++; } while(0)

/* --- Pipeline state --- */
#define gDPPipeSync(gdl)             _GBI_NOP(gdl)
#define gDPFullSync(gdl)             _GBI_NOP(gdl)
#define gDPTileSync(gdl)             _GBI_NOP(gdl)
#define gDPLoadSync(gdl)             _GBI_NOP(gdl)
#define gDPNoOp(gdl)                 _GBI_NOP(gdl)

/* --- Display list control --- */
#define gSPNoOp(gdl)                 _GBI_NOP(gdl)
#define gSPEndDisplayList(gdl)       _GBI_NOP(gdl)
#define gSPDisplayList(gdl, dl)      _GBI_NOP(gdl)
#define gSPBranchList(gdl, dl)       _GBI_NOP(gdl)

/* --- Matrix --- */
#define gSPMatrix(gdl, m, p)         _GBI_NOP(gdl)
#define gSPPopMatrix(gdl, p)         _GBI_NOP(gdl)
#define gSPLoadMatrix(gdl, m)        _GBI_NOP(gdl)
#define gSPInsertMatrix(gdl, ...)    _GBI_NOP(gdl)
#define gSPForceMatrix(gdl, mptr)    _GBI_NOP(gdl)

/* --- Viewport --- */
#define gSPViewport(gdl, vp)         _GBI_NOP(gdl)

/* --- Vertex / triangle --- */
#define gSPVertex(gdl, v, n, idx)    _GBI_NOP(gdl)
#define gSP1Triangle(gdl, ...)       _GBI_NOP(gdl)
#define gSP2Triangles(gdl, ...)      _GBI_NOP(gdl)
#define gSP4Triangles(gdl, ...)      _GBI_NOP(gdl)
#define gSPModifyVertex(gdl, ...)    _GBI_NOP(gdl)

/* --- Lighting --- */
#define gSPSetLights0(gdl, l)        _GBI_NOP(gdl)
#define gSPSetLights1(gdl, l)        _GBI_NOP(gdl)
#define gSPSetLights2(gdl, l)        _GBI_NOP(gdl)
#define gSPNumLights(gdl, n)         _GBI_NOP(gdl)
#define gSPLight(gdl, l, n)          _GBI_NOP(gdl)
#define gSPLookAt(gdl, ...)          _GBI_NOP(gdl)

/* --- Geometry mode --- */
#define gSPSetGeometryMode(gdl, m)   _GBI_NOP(gdl)
#define gSPClearGeometryMode(gdl,m)  _GBI_NOP(gdl)
#define gSPLoadGeometryMode(gdl, m)  _GBI_NOP(gdl)

/* --- Texture --- */
#define gSPTexture(gdl, s, t, l, tile, on) _GBI_NOP(gdl)
#define gDPSetTextureImage(gdl, ...)  _GBI_NOP(gdl)
#define gDPSetTile(gdl, ...)          _GBI_NOP(gdl)
#define gDPLoadTile(gdl, ...)         _GBI_NOP(gdl)
#define gDPSetTileSize(gdl, ...)      _GBI_NOP(gdl)
#define gDPLoadBlock(gdl, ...)        _GBI_NOP(gdl)
#define gDPLoadTextureBlock(gdl, ...)          _GBI_NOP(gdl)
#define gDPLoadTextureBlock_4b(gdl, ...)       _GBI_NOP(gdl)
#define gDPLoadTextureTile(gdl, ...)           _GBI_NOP(gdl)
#define gDPLoadTextureTile_4b(gdl, ...)        _GBI_NOP(gdl)
#define gDPSetTextureLUT(gdl, mode)            _GBI_NOP(gdl)
#define gDPLoadTLUT_pal16(gdl, pal, dram)      _GBI_NOP(gdl)
#define gDPLoadTLUT_pal256(gdl, dram)          _GBI_NOP(gdl)

/* --- Combiner / render mode --- */
#define gDPSetCombineMode(gdl, a, b)           _GBI_NOP(gdl)
#define gDPSetCombineLERP(gdl, ...)            _GBI_NOP(gdl)
#define gDPSetRenderMode(gdl, a, b)            _GBI_NOP(gdl)
#define gDPSetAlphaCompare(gdl, c)             _GBI_NOP(gdl)
#define gDPSetDepthSource(gdl, src)            _GBI_NOP(gdl)
#define gDPSetDepthImage(gdl, img)             _GBI_NOP(gdl)
#define gDPSetColorImage(gdl, fmt, siz, w, img) _GBI_NOP(gdl)

/* --- Fill / primitive color --- */
#define gDPSetFillColor(gdl, c)                _GBI_NOP(gdl)
#define gDPSetFogColor(gdl, r, g, b, a)        _GBI_NOP(gdl)
#define gDPSetBlendColor(gdl, r, g, b, a)      _GBI_NOP(gdl)
#define gDPSetPrimColor(gdl, m, l, r, g, b, a) _GBI_NOP(gdl)
#define gDPSetEnvColor(gdl, r, g, b, a)        _GBI_NOP(gdl)
#define gDPFillRectangle(gdl, xl, yl, xh, yh)  _GBI_NOP(gdl)
#define gDPScisFillRectangle(gdl, ...)          _GBI_NOP(gdl)
#define gDPSetScissor(gdl, ...)                 _GBI_NOP(gdl)
#define gDPSetPrimDepth(gdl, ...)               _GBI_NOP(gdl)

/* --- Fog --- */
#define gSPFogPosition(gdl, min, max)           _GBI_NOP(gdl)
#define gSPSetFog(gdl, ...)                     _GBI_NOP(gdl)

/* --- Segment --- */
#define gSPSegment(gdl, seg, base)              _GBI_NOP(gdl)

/* --- Other --- */
#define gSPClipRatio(gdl, r)                    _GBI_NOP(gdl)
#define gSPPerspNormalize(gdl, s)               _GBI_NOP(gdl)
#define gSPCullDisplayList(gdl, vstart, vend)   _GBI_NOP(gdl)
#define gSPBranchLessZraw(gdl, ...)             _GBI_NOP(gdl)
#define gSPBranchLessZ(gdl, ...)                _GBI_NOP(gdl)

/* Combiner macro constants (not meaningful on Linux) */
#define G_CC_MODULATEI       0,0,0,0,0,0,0,0
#define G_CC_MODULATEIA      0,0,0,0,0,0,0,0
#define G_CC_DECALRGB        0,0,0,0,0,0,0,0
#define G_CC_DECALRGBA       0,0,0,0,0,0,0,0
#define G_CC_BLENDI          0,0,0,0,0,0,0,0
#define G_CC_PRIMITIVE       0,0,0,0,0,0,0,0
#define G_CC_SHADE           0,0,0,0,0,0,0,0
#define G_CC_ADDRGB          0,0,0,0,0,0,0,0
#define G_CC_TRILERP         0,0,0,0,0,0,0,0
#define G_CC_INTERFERENCE    0,0,0,0,0,0,0,0

/* Render mode constants */
#define G_RM_OPA_SURF           0
#define G_RM_AA_OPA_SURF        0
#define G_RM_RA_OPA_SURF        0
#define G_RM_ZB_OPA_SURF        0
#define G_RM_AA_ZB_OPA_SURF     0
#define G_RM_AA_ZB_OPA_DECAL    0
#define G_RM_AA_ZB_OPA_INTER    0
#define G_RM_AA_ZB_TEX_EDGE     0
#define G_RM_AA_ZB_XLU_SURF     0
#define G_RM_AA_ZB_XLU_DECAL    0
#define G_RM_AA_ZB_XLU_INTER    0
#define G_RM_FOG_SHADE_A        0
#define G_RM_FOG_PRIM_A         0
#define G_RM_PASS               0
#define G_RM_NOOP               0
#define G_RM_VISCVG             0
#define G_RM_OPA_CI             0
#define G_RM_XLU_SURF           0
#define G_RM_CLD_SURF           0
#define G_RM_TEX_EDGE           0
#define G_RM_PCK_RGBA           0
#define G_RM_2                  0
#define G_RM_OPA_SURF2          0
#define G_RM_AA_OPA_SURF2       0
#define G_RM_RA_OPA_SURF2       0
#define G_RM_ZB_OPA_SURF2       0
#define G_RM_AA_ZB_OPA_SURF2    0
#define G_RM_AA_ZB_OPA_DECAL2   0
#define G_RM_AA_ZB_OPA_INTER2   0
#define G_RM_AA_ZB_TEX_EDGE2    0
#define G_RM_AA_ZB_XLU_SURF2    0
#define G_RM_AA_ZB_XLU_DECAL2   0
#define G_RM_AA_ZB_XLU_INTER2   0
#define G_RM_FOG_SHADE_A2       0
#define G_RM_FOG_PRIM_A2        0
#define G_RM_PASS2              0
#define G_RM_NOOP2              0

/* Geometry mode flags */
#define G_ZBUFFER           0x00000001
#define G_SHADE             0x00000004
#define G_FOG               0x00010000
#define G_LIGHTING          0x00020000
#define G_TEXTURE_GEN       0x00040000
#define G_TEXTURE_GEN_LINEAR 0x00080000
#define G_LOD               0x00100000
#define G_SHADING_SMOOTH    0x00200000
#define G_CULL_FRONT        0x00000200
#define G_CULL_BACK         0x00000400
#define G_CULL_BOTH         (G_CULL_FRONT|G_CULL_BACK)
#define G_CLIPPING          0x00800000

/* Matrix parameter flags */
#define G_MTX_MODELVIEW     0x00
#define G_MTX_PROJECTION    0x04
#define G_MTX_MUL           0x00
#define G_MTX_LOAD          0x02
#define G_MTX_NOPUSH        0x00
#define G_MTX_PUSH          0x01

/* Texture image formats */
#define G_IM_FMT_RGBA   0
#define G_IM_FMT_YUV    1
#define G_IM_FMT_CI     2
#define G_IM_FMT_IA     3
#define G_IM_FMT_I      4

/* Texture image component sizes */
#define G_IM_SIZ_4b   0
#define G_IM_SIZ_8b   1
#define G_IM_SIZ_16b  2
#define G_IM_SIZ_32b  3

/* Tile numbers */
#define G_TX_RENDERTILE 0
#define G_TX_LOADTILE   7
#define G_TX_NOMIRROR   0
#define G_TX_WRAP       0
#define G_TX_MIRROR     0x1
#define G_TX_CLAMP      0x2
#define G_TX_NOMASK     0
#define G_TX_NOLOD      0

/* =========================================================================
 * Math stubs (N64 gu* functions)
 * Actual implementations in os_impl.cpp using standard math.
 * ========================================================================= */
#ifdef __cplusplus
extern "C" {
#endif

void guMtxF2L(float mf[4][4], Mtx *m);
void guMtxL2F(float mf[4][4], Mtx *m);
void guMtxIdent(Mtx *m);
void guMtxIdentF(float mf[4][4]);
void guMtxCatF(float mf[4][4], float nf[4][4], float rf[4][4]);
void guMtxCatL(Mtx *m, Mtx *n, Mtx *r);
void guOrthoF(float mf[4][4], float l, float r, float b, float t, float n, float f, float s);
void guOrtho(Mtx *m, float l, float r, float b, float t, float n, float f, float s);
void guFrustumF(float mf[4][4], float l, float r, float b, float t, float n, float f, float s);
void guFrustum(Mtx *m, float l, float r, float b, float t, float n, float f, float s);
void guPerspectiveF(float mf[4][4], u16 *perspNorm, float fovy, float aspect, float near, float far, float scale);
void guPerspective(Mtx *m, u16 *perspNorm, float fovy, float aspect, float near, float far, float scale);
void guTranslateF(float mf[4][4], float x, float y, float z);
void guTranslate(Mtx *m, float x, float y, float z);
void guScaleF(float mf[4][4], float x, float y, float z);
void guScale(Mtx *m, float x, float y, float z);
void guRotateF(float mf[4][4], float a, float x, float y, float z);
void guRotate(Mtx *m, float a, float x, float y, float z);
void guRotateRPYF(float mf[4][4], float r, float p, float y_);
void guRotateRPY(Mtx *m, float r, float p, float y_);
void guLookAtF(float mf[4][4], float xEye, float yEye, float zEye,
               float xAt, float yAt, float zAt, float xUp, float yUp, float zUp);
void guLookAt(Mtx *m, float xEye, float yEye, float zEye,
              float xAt, float yAt, float zAt, float xUp, float yUp, float zUp);
void guVec3f(float x, float y, float z, void *v);
void guVec3fNormalize(float *v);
void guVec3fTransform(void *dst, Mtx *m, void *src);

/* =========================================================================
 * OS function declarations
 * Implementations in platform/linux/os_impl.cpp
 * ========================================================================= */
void    osInitialize(void);
void    osUnmapTLBAll(void);

void    osCreateThread(OSThread *t, OSId id, void (*entry)(void *), void *arg, void *sp, OSPri pri);
void    osStartThread(OSThread *t);
void    osStopThread(OSThread *t);
void    osDestroyThread(OSThread *t);
void    osSetThreadPri(OSThread *t, OSPri pri);
OSPri   osGetThreadPri(OSThread *t);
OSId    osGetThreadId(OSThread *t);
OSThread *osGetCurrentThread(void);

void    osCreateMesgQueue(OSMesgQueue *mq, OSMesg *buf, s32 count);
s32     osSendMesg(OSMesgQueue *mq, OSMesg msg, s32 flag);
s32     osRecvMesg(OSMesgQueue *mq, OSMesg *msg, s32 flag);

void    osSetEventMesg(OSEvent e, OSMesgQueue *mq, OSMesg msg);
s32     osAfterPreNMI(void);

void    osCreatePiManager(OSPri pri, OSMesgQueue *mq, OSMesg *buf, s32 count);
s32     osPiStartDma(OSIoMesg *mb, s32 pri, s32 dir, u32 devAddr, void *vAddr, u32 nbytes, OSMesgQueue *mq);
void    osInvalDCache(void *vaddr, s32 nbytes);
void    osWritebackDCache(void *vaddr, s32 nbytes);
void    osWritebackDCacheAll(void);

OSTime  osGetTime(void);

void    osViSetMode(OSViMode *mode);
void    osViBlack(u8 active);
void    osViSetYScale(float scale);
void    osViSwapBuffer(void *buffer);
void    osViSetEvent(OSMesgQueue *mq, OSMesg msg, u32 retraceCount);

s32     osContInit(OSMesgQueue *mq, u8 *bitpattern, OSContStatus *data);
s32     osContStartReadData(OSMesgQueue *mq);
void    osContGetReadData(OSContPad *data);
s32     osContSetCh(u8 ch);

s32     osMotorInit(OSMesgQueue *mq, OSPfs *pfs, s32 channel);
s32     osMotorStart(OSPfs *pfs);
s32     osMotorStop(OSPfs *pfs);
s32     osPfsInitPak(OSMesgQueue *mq, OSPfs *pfs, s32 channel);
s32     osPfsFindFile(OSPfs *pfs, u8 company, u8 game, u8 *nlist, u8 *area, s32 *num);
s32     osPfsAllocateFile(OSPfs *pfs, u8 company, u8 game, u8 *note, u8 *ext, s32 length, s32 *file);
s32     osPfsReadWriteFile(OSPfs *pfs, s32 file, u8 flag, s32 offset, s32 size, u8 *data);
s32     osPfsDeleteFile(OSPfs *pfs, u8 company, u8 game, u8 *gameNote, u8 *extNote);
s32     osPfsIsPlug(OSMesgQueue *mq, u8 *pattern);

s32     osGbpakInit(OSMesgQueue *mq, OSPfs *pfs, int channel);

/* Audio stubs */
void    alHeapInit(ALHeap *hp, u8 *base, s32 len);
void   *alHeapAlloc(ALHeap *hp, s32 num, s32 size);
void    alSynNew(ALSynth *s, ALHeap *hp, ALSynConfig *config);
void    alSynDelete(ALSynth *s);
void    alSynAddPlayer(ALSynth *s, ALPlayer *p);
void    alSynRemovePlayer(ALSynth *s, ALPlayer *p);
s32     alSynAllocVoice(ALSynth *s, ALVoice *v, ALWaveTable *t);
void    alSynFreeVoice(ALSynth *s, ALVoice *v);
void    alSynStartVoice(ALSynth *s, ALVoice *v);
void    alSynStopVoice(ALSynth *s, ALVoice *v);
void    alSynSetVol(ALSynth *s, ALVoice *v, s16 vol);
void    alSynSetPitch(ALSynth *s, ALVoice *v, f32 pitch);
void    alSynSetPan(ALSynth *s, ALVoice *v, u8 pan);
void    alClose(ALSynth *s);

/* udivdi3 – used by TIME_USEC / TIME_NSEC macros */
u64     udivdi3(u64 a, u64 b);

/* Math shims */
float   _sqrtf(float x);
float   __sinf(float x);
float   __cosf(float x);

#ifdef __cplusplus
}
#endif /* __cplusplus */

/* =========================================================================
 * CLEAR / COPY helpers used throughout game code
 * ========================================================================= */
#ifndef CLEAR
#define CLEAR(x)  (memset((x), 0, sizeof(*(x))))
#endif
#ifndef COPY
#define COPY(dst, src) (memcpy((dst), (src), sizeof(*(dst))))
#endif
