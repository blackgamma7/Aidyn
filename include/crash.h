#include "typedefs.h"

typedef struct CrashManager CrashManager, *PCrashManager;

struct CrashSub{
    u32 var0;
    char position[128];
    char Cause[128];
    u8 IsManualCrash;
};

struct CrashManager {
    u8 Stack[2120];
    OSThread Thread;
    OSMesg Mesgs;
    OSMesgQueue MesgQ;
    CrashSub sub;
    void (*Func)(CrashSub*);
};

namespace Crash{
    void InitProc(void (*handle)(CrashSub*),void* arg1,u8 Pri,u16 ID);
    void CrashProc(void* x);
    void InitEventMesg(void);
    #if DEBUGVER
    void ManualCrash(char *pos,char *cause);
    #else
    void ManualCrash(void);
    #endif
}

//functions used for crashed state (add to Crash namespace later?)

typedef u16 CrashBuff[300][400]; //framebuffer used in "crash" mode
//address is +0x20 past .bss in retail, +0x30 past .bss in debug

void Crash_SetFrame(CrashBuff *,u16);
u16 crash_strlen(char *);
void crash_text(CrashSub *,CrashBuff *);
void Ofunc_80006a4c(u16 *,u32 *);
int strlenX8(char *);
void crash_print_2(CrashBuff *,char *,u32,u16,u16);
void FUN_80006c6c(void *,u8 *,u8 *,u8 *);
void crash_text_2(CrashSub *,CrashBuff*);
//extern Ofunc_8000729c(CrashBuff *,u16,u16,void *,void *,void *,void *,void *,void *,void *,void *);
void stack_dump(CrashSub *,CrashBuff *);
void crash_handler(CrashSub *);
void heap_error(CrashBuff*,char*,s32,int,int,int,int,s32,int);
void heap_walk(CrashSub *,CrashBuff *);
void crash_print(CrashBuff *,char *,u16,u16,u8,u8,u8);
extern u8 gCrashFont[][8];

//differentiate between debug and retail crash versions.
#if DEBUGVER
#define CRASH(pos, cause) Crash::ManualCrash(pos, cause);
#else
#define CRASH(pos, cause) Crash::ManualCrash();
#endif