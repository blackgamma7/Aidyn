/*
 * sched.h - Linux compatibility shim for N64 OSSched (video scheduler)
 *
 * The N64 scheduler fires OS_SC_RETRACE_MSG at 60 Hz (NTSC) to synchronise
 * the game loop with the display.  On Linux we use SDL2's timer instead.
 * Actual implementation lives in platform/linux/os_impl.cpp.
 */
#pragma once

#include "../ultra64.h"

/* =========================================================================
 * Scheduler message types (sent to registered clients each V-sync)
 * ========================================================================= */
#define OS_SC_MAX_MESGS       8   /* maximum messages in scheduler queue */
#define OS_SC_RETRACE_MSG     1   /* vertical retrace (frame boundary) */
#define OS_SC_DONE_MSG        2   /* RSP/RDP task complete */
#define OS_SC_PRE_NMI_MSG     3   /* impending power-off */
#define OS_SC_RDP_DONE_MSG    4   /* RDP specifically finished */

/* =========================================================================
 * RSP task types
 * ========================================================================= */
#define M_GFXTASK   1
#define M_AUDTASK   2
#define M_NULTASK   3

/* =========================================================================
 * OSScTask – submitted to the scheduler for RSP execution.
 *
 * On Linux the RSP does not exist; the task is used as a signal that a
 * frame's display list is ready.  gfx_backend.cpp processes it.
 * ========================================================================= */

/* OSScTask state / flags */
#define OS_SC_NEEDS_RSP     0x0001
#define OS_SC_NEEDS_RDP     0x0002
#define OS_SC_LAST_TASK     0x0004
#define OS_SC_SWAPBUFFER    0x0008
#define OS_SC_RCP_MASK      0x000f
#define OS_SC_YIELD         0x0010
#define OS_SC_YIELDED       0x0020

/* OSTask – RSP task descriptor, accessed via OSScTask.list.t */
typedef struct {
    u32   type;
    u32   flags;
    u64  *ucode_boot;
    u32   ucode_boot_size;
    u64  *ucode;
    u32   ucode_size;
    u64  *ucode_data;
    u32   ucode_data_size;
    u64  *dram_stack;
    u32   dram_stack_size;
    u64  *output_buff;
    u64  *output_buff_size;
    u64  *data_ptr;
    u32   data_size;
    u64  *yield_data_ptr;
    u32   yield_data_size;
} OSTask;

typedef struct OSScTask_s {
    struct OSScTask_s *next;
    u32                state;
    u32                flags;
    void              *framebuffer;

    /* RSP task descriptor – game code accesses as .list.t.field */
    union {
        OSTask t;
    } list;

    OSMesgQueue *msgQ;
    OSMesg       msg;
    OSPri        pri;
    /* extra fields used by gfx.cpp */
    u32  startTime;
    u32  totalTime;
} OSScTask;

/* =========================================================================
 * OSScClient – game subsystem that subscribes to retrace events.
 * ========================================================================= */
typedef struct OSScClient_s {
    struct OSScClient_s *next;
    OSMesgQueue         *msgQ;
    OSMesg               msg;
} OSScClient;

/* =========================================================================
 * OSSched – the scheduler itself.
 *
 * On Linux the "scheduler" is a background thread that fires retrace events
 * at 60 Hz using SDL2's performance counter.
 * ========================================================================= */
typedef struct {
    OSThread   thread;
    OSMesgQueue mq;
    OSMesg     *msgBuf;

    /* Client list (protected by mutex inside os_impl.cpp) */
    OSScClient *clientList;

    /* Backend state */
    pthread_mutex_t  mutex;
    pthread_cond_t   retraceCond;
    volatile int     frameCount;
    volatile int     running;
    int              mode;       /* OS_VI_* index (used to pick NTSC/PAL timing) */
    int              numFields;  /* 1 = non-interlaced */
} OSSched;

/* =========================================================================
 * Scheduler API declarations
 * Implementations in platform/linux/os_impl.cpp
 * ========================================================================= */
#ifdef __cplusplus
extern "C" {
#endif

void      osCreateScheduler(OSSched *sc, void *stack, OSPri pri, u8 mode, u8 numFields);
void      osScAddClient(OSSched *sc, OSScClient *c, OSMesgQueue *mq);
void      osScRemoveClient(OSSched *sc, OSScClient *c);
OSScTask *osScGetTask(OSSched *sc);
OSMesgQueue *osScGetCmdQ(OSSched *sc);
void      osScScheduleTask(OSSched *sc, OSScTask *t);
void      osSpTaskYield(void);
void      osSpTaskYieldedQ(OSMesgQueue *mq);
void      osSpTaskLoad(OSScTask *t);
void      osSpTaskStartGo(OSScTask *t);

#ifdef __cplusplus
}
#endif
