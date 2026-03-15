/*
 * os_impl.cpp – Linux implementations of N64 libultra OS functions.
 *
 * Threading : pthreads
 * Timing    : CLOCK_MONOTONIC via clock_gettime()
 * Scheduler : background thread firing retrace messages at 60 Hz (NTSC)
 *             or 50 Hz (PAL / MPAL) via SDL2 performance counter.
 *
 * Unimplemented stubs log a single warning on first call and return a safe
 * default so the game can continue booting.
 */

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <cassert>
#include <time.h>
#include <unistd.h>
#include <signal.h>

/* Include the shim header that declares everything we implement. */
#include "../../ultra/include/2.0I/ultra64.h"
#include "../../ultra/include/2.0I/PR/sched.h"

/* =========================================================================
 * Global N64 state
 * ========================================================================= */
u32 osTvType = OS_TV_NTSC;  /* default; main() may override from args */

/* Simple VI mode table – only entries used by the game need to be populated.
 * Index meanings are defined by OS_VI_NTSC_LAN1 etc. in ultra64.h.        */
OSViMode osViModeTable[16] = {0};

/* =========================================================================
 * Helpers
 * ========================================================================= */
static void warn_once(const char *func) {
    static char seen[64][64];
    static int  count = 0;
    for (int i = 0; i < count; i++) {
        if (strcmp(seen[i], func) == 0) return;
    }
    if (count < 64) { strncpy(seen[count++], func, 63); }
    fprintf(stderr, "[ultra_shim] %s: stub called (first occurrence)\n", func);
}

/* =========================================================================
 * osInitialize / osUnmapTLBAll
 * ========================================================================= */
extern "C" void osInitialize(void) {
    /* Nothing needed on Linux – SDL_Init is called from main(). */
}

extern "C" void osUnmapTLBAll(void) {
    /* N64-specific TLB operation – no-op on Linux. */
}

/* =========================================================================
 * Threading
 *
 * OSThread wraps a pthread.  The N64 convention is:
 *   osCreateThread()  – configure (does not launch)
 *   osStartThread()   – launch
 *   osSetThreadPri()  – change priority
 *
 * We use a simple trampoline that casts the void* argument from the N64-
 * style entry (void fn(void*)) to the pthread signature (void* fn(void*)).
 * ========================================================================= */
struct ThreadTrampoline {
    void (*entry)(void *);
    void  *arg;
};

static void *thread_trampoline(void *p) {
    auto *t = static_cast<ThreadTrampoline *>(p);
    t->entry(t->arg);
    delete t;
    return nullptr;
}

extern "C" void osCreateThread(OSThread *t, OSId id, void (*entry)(void *),
                                void *arg, void *sp, OSPri pri) {
    memset(t, 0, sizeof(*t));
    t->id       = id;
    t->priority = pri;
    t->entry    = entry;
    t->arg      = arg;
    t->started  = 0;
    pthread_attr_init(&t->attr);
    pthread_attr_setdetachstate(&t->attr, PTHREAD_CREATE_JOINABLE);
    /* Stack pointer / size: the game allocates its own stacks.
     * We ignore sp and let the OS pick a stack for pthreads. */
    (void)sp;
}

extern "C" void osStartThread(OSThread *t) {
    if (t->started) return;
    t->started = 1;
    auto *tramp = new ThreadTrampoline{t->entry, t->arg};
    int rc = pthread_create(&t->thread, &t->attr, thread_trampoline, tramp);
    if (rc != 0) {
        fprintf(stderr, "[ultra_shim] osStartThread: pthread_create failed (%d)\n", rc);
        abort();
    }
}

extern "C" void osStopThread(OSThread *t) {
    warn_once("osStopThread");
    (void)t;
}

extern "C" void osDestroyThread(OSThread *t) {
    if (t->started) {
        pthread_cancel(t->thread);
        pthread_join(t->thread, nullptr);
        t->started = 0;
    }
    pthread_attr_destroy(&t->attr);
}

extern "C" void osSetThreadPri(OSThread *t, OSPri pri) {
    t->priority = pri;
    /* SCHED_OTHER doesn't support arbitrary priorities on Linux without
     * CAP_SYS_NICE.  We skip the actual syscall to avoid permission errors. */
}

extern "C" OSPri osGetThreadPri(OSThread *t) {
    return t->priority;
}

extern "C" OSId osGetThreadId(OSThread *t) {
    return t->id;
}

extern "C" OSThread *osGetCurrentThread(void) {
    warn_once("osGetCurrentThread");
    return nullptr;
}

/* =========================================================================
 * Message queues
 *
 * Implemented with a mutex + condition variable + std::queue inside the
 * OSMesgQueue struct (see ultra64.h).
 * ========================================================================= */
extern "C" void osCreateMesgQueue(OSMesgQueue *mq, OSMesg *buf, s32 count) {
    new (&mq->mtx)  std::mutex();
    new (&mq->cv)   std::condition_variable();
    new (&mq->msgs) std::queue<OSMesg>();
    mq->msgBuf   = buf;
    mq->msgCount = count;
}

extern "C" s32 osSendMesg(OSMesgQueue *mq, OSMesg msg, s32 flag) {
    std::unique_lock<std::mutex> lk(mq->mtx);
    if (flag == OS_MESG_NOBLOCK && (s32)mq->msgs.size() >= mq->msgCount) {
        return -1; /* queue full */
    }
    /* Blocking: wait until space available */
    while (flag == OS_MESG_BLOCK && (s32)mq->msgs.size() >= mq->msgCount) {
        mq->cv.wait(lk);
    }
    mq->msgs.push(msg);
    mq->cv.notify_all();
    return 0;
}

extern "C" s32 osRecvMesg(OSMesgQueue *mq, OSMesg *msg, s32 flag) {
    std::unique_lock<std::mutex> lk(mq->mtx);
    if (flag == OS_MESG_NOBLOCK && mq->msgs.empty()) {
        return -1; /* queue empty */
    }
    while (flag == OS_MESG_BLOCK && mq->msgs.empty()) {
        mq->cv.wait(lk);
    }
    if (mq->msgs.empty()) return -1;
    if (msg) *msg = mq->msgs.front();
    mq->msgs.pop();
    mq->cv.notify_all();
    return 0;
}

/* =========================================================================
 * Events
 * ========================================================================= */
extern "C" void osSetEventMesg(OSEvent e, OSMesgQueue *mq, OSMesg msg) {
    /* Event routing is not implemented – the game uses this mainly for the
     * SI (serial interface) done event from osContInit.  We fire it
     * immediately so Init functions don't block. */
    (void)e;
    osSendMesg(mq, msg, OS_MESG_NOBLOCK);
}

extern "C" s32 osAfterPreNMI(void) {
    return 0; /* not after a power-off event */
}

/* =========================================================================
 * PI Manager (ROM DMA) – replaced by file I/O in asset_loader.cpp
 * The manager "thread" is a stub; osPiStartDma is implemented there.
 * ========================================================================= */
extern "C" void osCreatePiManager(OSPri pri, OSMesgQueue *mq, OSMesg *buf, s32 count) {
    (void)pri;
    osCreateMesgQueue(mq, buf, count);
    /* No real thread needed – DMA is synchronous on Linux. */
}

/* =========================================================================
 * Cache operations – no-ops on Linux (cache coherency is automatic)
 * ========================================================================= */
extern "C" void osInvalDCache(void *vaddr, s32 nbytes) {
    (void)vaddr; (void)nbytes;
}
extern "C" void osWritebackDCache(void *vaddr, s32 nbytes) {
    (void)vaddr; (void)nbytes;
}
extern "C" void osWritebackDCacheAll(void) {}

/* =========================================================================
 * osGetTime – returns monotonic nanoseconds (approximating N64 46.875 MHz)
 * ========================================================================= */
extern "C" OSTime osGetTime(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    /* Return in units of N64 CPU cycles (46.875 MHz).
     * cycles = ns * 46.875e6 / 1e9 = ns * 46875 / 1000000  */
    return (OSTime)ts.tv_sec * 46875000ULL
         + (OSTime)ts.tv_nsec * 46875ULL / 1000000ULL;
}

/* =========================================================================
 * osGetMemSize – returns total RAM size; on Linux report 8 MB (expansion pak)
 * ========================================================================= */
extern "C" u32 osGetMemSize(void) {
    return 0x800000; /* 8 MB */
}

/* =========================================================================
 * udivdi3 – 64-bit unsigned division helper used by TIME_USEC macro
 * ========================================================================= */
extern "C" u32 udivdi3(u64 a, u64 b) {
    if (b == 0) return 0;
    return (u32)(a / b);
}

/* =========================================================================
 * Video interface stubs
 * osViSetMode / osViBlack / osViSwapBuffer are handled by gfx_backend.cpp.
 * Declare weak stubs here so the linker is satisfied even without the backend.
 * ========================================================================= */
extern "C" __attribute__((weak)) void osViSetMode(OSViMode *mode)   { (void)mode; }
extern "C" __attribute__((weak)) void osViBlack(u8 active)          { (void)active; }
extern "C" __attribute__((weak)) void osViSetYScale(float scale)    { (void)scale; }
extern "C" __attribute__((weak)) void osViSwapBuffer(void *buffer)  { (void)buffer; }
extern "C" __attribute__((weak)) void osViSetEvent(OSMesgQueue *mq, OSMesg msg, u32 rc) {
    (void)mq; (void)msg; (void)rc;
}
extern "C" __attribute__((weak)) void osCreateViManager(OSPri pri) { (void)pri; }
extern "C" __attribute__((weak)) void osViSetSpecialFeatures(u32 features) { (void)features; }

/* =========================================================================
 * OSSched – 60/50 Hz retrace scheduler
 *
 * A background pthread fires OS_SC_RETRACE_MSG to all registered clients
 * at the appropriate frame rate.  The game loop blocks on osRecvMesg() on
 * the client queue and advances one frame per message received.
 * ========================================================================= */
struct SchedContext {
    OSSched *sc;
};

static long sched_frame_ns(OSSched *sc) {
    /* PAL/MPAL run at 50 Hz, NTSC at 60 Hz */
    if (sc->mode == OS_VI_PAL_LAN1 || sc->mode == OS_VI_MPAL_LAN1)
        return 1000000000L / 50;
    return 1000000000L / 60;
}

static void *sched_thread(void *arg) {
    auto *ctx = static_cast<SchedContext *>(arg);
    OSSched *sc = ctx->sc;
    delete ctx;

    struct timespec next, now;
    clock_gettime(CLOCK_MONOTONIC, &next);

    while (sc->running) {
        /* Advance target by one frame period */
        long frame_ns = sched_frame_ns(sc);
        next.tv_nsec += frame_ns;
        if (next.tv_nsec >= 1000000000L) {
            next.tv_sec++;
            next.tv_nsec -= 1000000000L;
        }

        /* Sleep until target */
        clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &next, nullptr);

        /* Fire retrace message to all registered clients */
        pthread_mutex_lock(&sc->mutex);
        sc->frameCount++;
        OSScClient *c = sc->clientList;
        while (c) {
            osSendMesg(c->msgQ, c->msg, OS_MESG_NOBLOCK);
            c = c->next;
        }
        pthread_mutex_unlock(&sc->mutex);
    }
    return nullptr;
}

extern "C" void osCreateScheduler(OSSched *sc, void *stack, OSPri pri, u8 mode, u8 numFields) {
    (void)stack; (void)pri;
    memset(sc, 0, sizeof(*sc));
    sc->mode       = mode;
    sc->numFields  = numFields;
    sc->running    = 1;
    sc->clientList = nullptr;
    pthread_mutex_init(&sc->mutex, nullptr);
    pthread_cond_init(&sc->retraceCond, nullptr);

    /* Start the scheduler thread */
    auto *ctx = new SchedContext{sc};
    osCreateThread(&sc->thread, 0xFE, nullptr, nullptr, nullptr, pri);
    /* Use pthread directly since entry is our sched_thread */
    pthread_create(&sc->thread.thread, nullptr, sched_thread, ctx);
    sc->thread.started = 1;
}

extern "C" void osScAddClient(OSSched *sc, OSScClient *c, OSMesgQueue *mq) {
    pthread_mutex_lock(&sc->mutex);
    c->msgQ  = mq;
    c->msg   = (OSMesg)0;
    c->next  = sc->clientList;
    sc->clientList = c;
    pthread_mutex_unlock(&sc->mutex);
}

extern "C" void osScRemoveClient(OSSched *sc, OSScClient *c) {
    pthread_mutex_lock(&sc->mutex);
    OSScClient **pp = &sc->clientList;
    while (*pp) {
        if (*pp == c) { *pp = c->next; break; }
        pp = &(*pp)->next;
    }
    c->next = nullptr;
    pthread_mutex_unlock(&sc->mutex);
}

extern "C" OSMesgQueue *osScGetCmdQ(OSSched *sc) {
    return &sc->mq;
}

extern "C" OSScTask *osScGetTask(OSSched *sc) {
    warn_once("osScGetTask");
    (void)sc;
    return nullptr;
}

extern "C" void osScScheduleTask(OSSched *sc, OSScTask *t) {
    /* On Linux, rendering happens inline rather than through RSP tasks.
     * Mark the task done immediately and send the completion message. */
    (void)sc;
    if (t && t->msgQ) {
        osSendMesg(t->msgQ, t->msg, OS_MESG_NOBLOCK);
    }
}

extern "C" void osSpTaskYield(void)             {}
extern "C" void osSpTaskYieldedQ(OSMesgQueue *) {}
extern "C" void osSpTaskLoad(OSScTask *)        {}
extern "C" void osSpTaskStartGo(OSScTask *)     {}

/* =========================================================================
 * Controller – stub implementation.
 * Real input is read via SDL2 in input_backend.cpp; these stubs prevent
 * link errors from code paths that call the raw OS API.
 * ========================================================================= */
extern "C" s32 osContInit(OSMesgQueue *mq, u8 *bitpattern, OSContStatus *data) {
    (void)mq;
    *bitpattern = 0x01; /* port 0 connected */
    if (data) memset(data, 0, sizeof(OSContStatus) * MAXCONTROLLERS);
    return 0;
}

extern "C" s32 osContStartReadData(OSMesgQueue *mq) {
    (void)mq;
    return 0;
}

extern "C" void osContGetReadData(OSContPad *data) {
    if (data) memset(data, 0, sizeof(OSContPad) * MAXCONTROLLERS);
}

extern "C" s32 osContSetCh(u8 ch) { (void)ch; return 0; }
extern "C" s32 osContStartQuery(OSMesgQueue *mq) { (void)mq; return 0; }
extern "C" void osContGetQuery(OSContStatus *data) {
    if (data) memset(data, 0, sizeof(OSContStatus) * MAXCONTROLLERS);
}

/* Controller Pak / rumble stubs */
extern "C" s32 osMotorInit(OSMesgQueue *mq, OSPfs *pfs, s32 channel) {
    (void)mq; (void)channel;
    pfs->channel = channel;
    pfs->initialized = 0;
    return PFS_ERR_NOPACK;
}
extern "C" s32 osMotorStart(OSPfs *pfs) { (void)pfs; return 0; }
extern "C" s32 osMotorStop(OSPfs *pfs)  { (void)pfs; return 0; }

extern "C" s32 osPfsInitPak(OSMesgQueue *mq, OSPfs *pfs, s32 channel) {
    (void)mq;
    pfs->channel = channel;
    pfs->initialized = 0;
    return PFS_ERR_NOPACK; /* no physical pak; saves go to disk in asset_loader */
}

extern "C" s32 osPfsFindFile(OSPfs *pfs, u8 company, u8 game, u8 *nlist, u8 *area, s32 *num) {
    (void)pfs; (void)company; (void)game; (void)nlist; (void)area;
    if (num) *num = 0;
    return PFS_ERR_NOPACK;
}

extern "C" s32 osPfsAllocateFile(OSPfs *pfs, u8 company, u8 game, u8 *note, u8 *ext,
                                  s32 length, s32 *file) {
    (void)pfs; (void)company; (void)game; (void)note; (void)ext; (void)length;
    if (file) *file = 0;
    return PFS_ERR_NOPACK;
}

extern "C" s32 osPfsReadWriteFile(OSPfs *pfs, s32 file, u8 flag, s32 offset,
                                   s32 size, u8 *data) {
    (void)pfs; (void)file; (void)flag; (void)offset; (void)size; (void)data;
    return PFS_ERR_NOPACK;
}

extern "C" s32 osPfsDeleteFile(OSPfs *pfs, u8 company, u8 game, u8 *gn, u8 *en) {
    (void)pfs; (void)company; (void)game; (void)gn; (void)en;
    return PFS_ERR_NOPACK;
}

extern "C" s32 osPfsFileState(OSPfs *pfs, s32 file, OSPfsState *state) {
    (void)pfs; (void)file;
    if (state) memset(state, 0, sizeof(OSPfsState));
    return PFS_ERR_NOPACK;
}

extern "C" s32 osPfsRepairId(OSPfs *pfs) { (void)pfs; return 0; }

extern "C" s32 osPfsFreeBlocks(OSPfs *pfs, s32 *freeBlocks) {
    (void)pfs;
    if (freeBlocks) *freeBlocks = 0;
    return 0;
}

extern "C" s32 osPfsIsPlug(OSMesgQueue *mq, u8 *pattern) {
    (void)mq;
    if (pattern) *pattern = 0;
    return 0;
}

extern "C" s32 osGbpakInit(OSMesgQueue *mq, OSPfs *pfs, int channel) {
    (void)mq;
    pfs->channel = channel;
    pfs->initialized = 0;
    return -1; /* no GB Pak */
}

/* =========================================================================
 * Audio stubs
 * Real implementation in audio_backend.cpp
 * ========================================================================= */
extern "C" void alHeapInit(ALHeap *hp, u8 *base, s32 len) {
    hp->base = base; hp->cur = base; hp->len = len; hp->count = 0;
}
extern "C" void *alHeapAlloc(ALHeap *hp, s32 num, s32 size) {
    s32 bytes = num * size;
    if (hp->cur + bytes > hp->base + hp->len) {
        fprintf(stderr, "[audio] alHeapAlloc: out of memory\n");
        return nullptr;
    }
    void *p = hp->cur;
    hp->cur += bytes;
    hp->count++;
    return p;
}
extern "C" void alSynNew(ALSynth *s, ALHeap *hp, ALSynConfig *config) {
    (void)hp; (void)config;
    memset(s, 0, sizeof(*s));
}
extern "C" void alSynDelete(ALSynth *s)                             { (void)s; }
extern "C" void alSynAddPlayer(ALSynth *s, ALPlayer *p)             { (void)s; (void)p; }
extern "C" void alSynRemovePlayer(ALSynth *s, ALPlayer *p)          { (void)s; (void)p; }
extern "C" void alInit(ALGlobals *g, ALSynConfig *c)                { (void)g; (void)c; }
extern "C" s32  alSynAllocVoice(ALSynth *s, ALVoice *v, ALVoiceConfig *c) {
    (void)s; (void)c;
    memset(v, 0, sizeof(*v));
    return 0;
}
extern "C" void alSynFreeVoice(ALSynth *s, ALVoice *v)              { (void)s; (void)v; }
extern "C" void alSynStartVoice(ALSynth *s, ALVoice *v)             { (void)s; (void)v; }
extern "C" void alSynStartVoiceParams(ALSynth *s, ALVoice *v, ALWaveTable *t,
    f32 pitch, s16 vol, ALPan pan, u8 flag, ALMicroTime time)
    { (void)s;(void)v;(void)t;(void)pitch;(void)vol;(void)pan;(void)flag;(void)time; }
extern "C" void alSynStopVoice(ALSynth *s, ALVoice *v)              { (void)s; (void)v; }
extern "C" void alSynSetVol(ALSynth *s, ALVoice *v, s16 vol, ALMicroTime time)
    { (void)s; (void)v; (void)vol; (void)time; }
extern "C" void alSynSetPitch(ALSynth *s, ALVoice *v, f32 pitch)    { (void)s; (void)v; (void)pitch; }
extern "C" void alSynSetPan(ALSynth *s, ALVoice *v, u8 pan)         { (void)s; (void)v; (void)pan; }
extern "C" void alClose(ALGlobals *s)                                { (void)s; }
extern "C" Acmd *alAudioFrame(Acmd *list, s32 *cnt, s16 *buf, u32 len)
    { (void)list;(void)buf;(void)len; if(cnt)*cnt=0; return list; }
extern "C" u32  osAiSetFrequency(u32 freq)                           { return freq; }
extern "C" void osAiSetNextBuffer(s16 *buf, u32 len)                 { (void)buf; (void)len; }
extern "C" u32  osAiGetLength(void)                                  { return 0; }

/* RSP microcode binary stubs (N64-specific; unused on Linux) */
u8 rspbootTextStart[4]       = {0};
u8 aspMainTextStart[4]       = {0};
u8 aspMainDataStart[4]       = {0};
u8 gspF3DEX2_fifoTextStart[4]= {0};
u8 gspF3DEX2_fifoDataStart[4]= {0};

/* =========================================================================
 * Math functions (used by mathN64.h and GBI code)
 * ========================================================================= */
#include <cmath>

extern "C" float _sqrtf(float x)         { return sqrtf(x); }
extern "C" float __sinf(float x) noexcept { return sinf(x); }
extern "C" float __cosf(float x) noexcept { return cosf(x); }

/* ---- guMtx* implementations ---- */

/* Convert float[4][4] to N64 fixed-point Mtx */
extern "C" void guMtxF2L(float mf[4][4], Mtx *m) {
    for (int r = 0; r < 4; r++) {
        for (int c = 0; c < 4; c++) {
            float v = mf[r][c];
            s32   fixed = (s32)(v * 65536.0f);
            m->m[r][c] = (s16)(fixed >> 16);
            m->f[r][c] = (u16)(fixed & 0xFFFF);
        }
    }
}

extern "C" void guMtxL2F(float mf[4][4], Mtx *m) {
    for (int r = 0; r < 4; r++) {
        for (int c = 0; c < 4; c++) {
            mf[r][c] = (float)m->m[r][c] + (float)m->f[r][c] / 65536.0f;
        }
    }
}

static void identity4(float m[4][4]) {
    memset(m, 0, 16 * sizeof(float));
    m[0][0] = m[1][1] = m[2][2] = m[3][3] = 1.0f;
}

extern "C" void guMtxIdent(Mtx *m) {
    float f[4][4]; identity4(f); guMtxF2L(f, m);
}

extern "C" void guMtxIdentF(float mf[4][4]) { identity4(mf); }

static void mul4(float r[4][4], const float a[4][4], const float b[4][4]) {
    float tmp[4][4] = {};
    for (int i = 0; i < 4; i++)
        for (int j = 0; j < 4; j++)
            for (int k = 0; k < 4; k++)
                tmp[i][j] += a[i][k] * b[k][j];
    memcpy(r, tmp, 16 * sizeof(float));
}

extern "C" void guMtxCatF(float mf[4][4], float nf[4][4], float rf[4][4]) {
    mul4(rf, mf, nf);
}

extern "C" void guMtxCatL(Mtx *m, Mtx *n, Mtx *r) {
    float mf[4][4], nf[4][4], rf[4][4];
    guMtxL2F(mf, m); guMtxL2F(nf, n);
    mul4(rf, mf, nf);
    guMtxF2L(rf, r);
}

extern "C" void guTranslateF(float mf[4][4], float x, float y, float z) {
    identity4(mf);
    mf[0][3] = x; mf[1][3] = y; mf[2][3] = z;
}

extern "C" void guTranslate(Mtx *m, float x, float y, float z) {
    float f[4][4]; guTranslateF(f, x, y, z); guMtxF2L(f, m);
}

extern "C" void guScaleF(float mf[4][4], float x, float y, float z) {
    identity4(mf);
    mf[0][0] = x; mf[1][1] = y; mf[2][2] = z;
}

extern "C" void guScale(Mtx *m, float x, float y, float z) {
    float f[4][4]; guScaleF(f, x, y, z); guMtxF2L(f, m);
}

extern "C" void guRotateF(float mf[4][4], float a, float x, float y, float z) {
    float rad = a * (float)(3.14159265358979323846 / 180.0);
    float c = cosf(rad), s = sinf(rad), t = 1.0f - c;
    float len = sqrtf(x*x + y*y + z*z);
    if (len > 1e-6f) { x /= len; y /= len; z /= len; }
    identity4(mf);
    mf[0][0] = t*x*x+c;   mf[0][1] = t*x*y-s*z; mf[0][2] = t*x*z+s*y;
    mf[1][0] = t*x*y+s*z; mf[1][1] = t*y*y+c;   mf[1][2] = t*y*z-s*x;
    mf[2][0] = t*x*z-s*y; mf[2][1] = t*y*z+s*x; mf[2][2] = t*z*z+c;
}

extern "C" void guRotate(Mtx *m, float a, float x, float y, float z) {
    float f[4][4]; guRotateF(f, a, x, y, z); guMtxF2L(f, m);
}

extern "C" void guRotateRPYF(float mf[4][4], float r, float p, float y_) {
    float R[4][4], P[4][4], Y[4][4], tmp[4][4];
    guRotateF(R, r, 1,0,0);
    guRotateF(P, p, 0,1,0);
    guRotateF(Y, y_, 0,0,1);
    mul4(tmp, Y, P);
    mul4(mf, tmp, R);
}

extern "C" void guRotateRPY(Mtx *m, float r, float p, float y_) {
    float f[4][4]; guRotateRPYF(f, r, p, y_); guMtxF2L(f, m);
}

extern "C" void guOrthoF(float mf[4][4], float l, float r, float b, float t, float n, float f, float s) {
    identity4(mf);
    mf[0][0] = 2.0f/(r-l)*s;
    mf[1][1] = 2.0f/(t-b)*s;
    mf[2][2] = -2.0f/(f-n)*s;
    mf[0][3] = -(r+l)/(r-l);
    mf[1][3] = -(t+b)/(t-b);
    mf[2][3] = -(f+n)/(f-n);
}

extern "C" void guOrtho(Mtx *m, float l, float r, float b, float t, float n, float f, float s) {
    float mf[4][4]; guOrthoF(mf, l, r, b, t, n, f, s); guMtxF2L(mf, m);
}

extern "C" void guFrustumF(float mf[4][4], float l, float r, float b, float t, float n, float f, float s) {
    identity4(mf);
    mf[0][0] = 2.0f*n/(r-l)*s;
    mf[1][1] = 2.0f*n/(t-b)*s;
    mf[0][2] = (r+l)/(r-l);
    mf[1][2] = (t+b)/(t-b);
    mf[2][2] = -(f+n)/(f-n)*s;
    mf[2][3] = -2.0f*f*n/(f-n)*s;
    mf[3][2] = -1.0f;
    mf[3][3] = 0.0f;
}

extern "C" void guFrustum(Mtx *m, float l, float r, float b, float t, float n, float f, float s) {
    float mf[4][4]; guFrustumF(mf, l, r, b, t, n, f, s); guMtxF2L(mf, m);
}

extern "C" void guPerspectiveF(float mf[4][4], u16 *perspNorm, float fovy, float aspect,
                                float near, float far, float scale) {
    float top   = near * tanf(fovy * (float)(3.14159265358979323846 / 360.0));
    float right = top * aspect;
    guFrustumF(mf, -right, right, -top, top, near, far, scale);
    if (perspNorm) *perspNorm = 0xFFFF;
}

extern "C" void guPerspective(Mtx *m, u16 *perspNorm, float fovy, float aspect,
                               float near, float far, float scale) {
    float mf[4][4]; guPerspectiveF(mf, perspNorm, fovy, aspect, near, far, scale);
    guMtxF2L(mf, m);
}

extern "C" void guLookAtF(float mf[4][4], float xE, float yE, float zE,
                           float xA, float yA, float zA, float xU, float yU, float zU) {
    float fx = xA-xE, fy = yA-yE, fz = zA-zE;
    float fl = sqrtf(fx*fx+fy*fy+fz*fz);
    if (fl>1e-6f){fx/=fl;fy/=fl;fz/=fl;}
    float sx = fy*zU-fz*yU, sy = fz*xU-fx*zU, sz = fx*yU-fy*xU;
    float sl = sqrtf(sx*sx+sy*sy+sz*sz);
    if (sl>1e-6f){sx/=sl;sy/=sl;sz/=sl;}
    float ux = sy*fz-sz*fy, uy = sz*fx-sx*fz, uz = sx*fy-sy*fx;
    identity4(mf);
    mf[0][0]=sx; mf[0][1]=sy; mf[0][2]=sz; mf[0][3]=-(sx*xE+sy*yE+sz*zE);
    mf[1][0]=ux; mf[1][1]=uy; mf[1][2]=uz; mf[1][3]=-(ux*xE+uy*yE+uz*zE);
    mf[2][0]=-fx;mf[2][1]=-fy;mf[2][2]=-fz;mf[2][3]=(fx*xE+fy*yE+fz*zE);
}

extern "C" void guLookAt(Mtx *m, float xE, float yE, float zE,
                          float xA, float yA, float zA, float xU, float yU, float zU) {
    float mf[4][4];
    guLookAtF(mf, xE, yE, zE, xA, yA, zA, xU, yU, zU);
    guMtxF2L(mf, m);
}

extern "C" void guAlignF(float mf[4][4], float heading, float pitch, float roll, float bank) {
    (void)heading; (void)pitch; (void)roll; (void)bank;
    identity4(mf); /* stub: real guAlignF builds rotation matrix */
}
extern "C" void guAlign(Mtx *m, float heading, float pitch, float roll, float bank) {
    float mf[4][4]; guAlignF(mf, heading, pitch, roll, bank); guMtxF2L(mf, m);
}
extern "C" void guMtxXFMF(float mf[4][4], float x, float y, float z, float *ox, float *oy, float *oz) {
    *ox = mf[0][0]*x + mf[1][0]*y + mf[2][0]*z + mf[3][0];
    *oy = mf[0][1]*x + mf[1][1]*y + mf[2][1]*z + mf[3][1];
    *oz = mf[0][2]*x + mf[1][2]*y + mf[2][2]*z + mf[3][2];
}

extern "C" void guVec3f(float x, float y, float z, void *v) {
    float *f = (float *)v;
    f[0]=x; f[1]=y; f[2]=z;
}

extern "C" void guVec3fNormalize(float *v) {
    float l = sqrtf(v[0]*v[0]+v[1]*v[1]+v[2]*v[2]);
    if (l>1e-6f){v[0]/=l;v[1]/=l;v[2]/=l;}
}
extern "C" void guNormalize(float *x, float *y, float *z) {
    float l = sqrtf((*x)*(*x)+(*y)*(*y)+(*z)*(*z));
    if (l>1e-6f){*x/=l;*y/=l;*z/=l;}
}

extern "C" void guVec3fTransform(void *dst_, Mtx *m, void *src_) {
    float *d = (float*)dst_, *s = (float*)src_;
    float mf[4][4]; guMtxL2F(mf, m);
    for (int i=0;i<3;i++) {
        d[i] = mf[i][0]*s[0]+mf[i][1]*s[1]+mf[i][2]*s[2]+mf[i][3];
    }
}
