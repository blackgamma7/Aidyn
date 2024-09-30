#include "typedefs.h"
#include "GhidraDump.h"

typedef struct CrashManager CrashManager, *PCrashManager;

struct CrashManager {
    u8 Stack[2120];
    struct OSThread Thread;
    OSMesg Mesgs;
    struct OSMesgQueue MesgQ;
    u32 crash_func_arg;
    char position[128];
    char Cause[128];
    u8 IsManualCrash;
    void (*Func)(void*);
};


namespace Crash{
    void InitProc(void* arg0,void* arg1,u8 ri,u16 ID);
    void CrashProc(void* x);
    void InitEventMesg(void);
    #ifdef DEBUGVER
    void ManualCrash(char *pos,char *cause);
    #else
    void ManualCrash(void);
    #endif
}

#ifdef DEBUGVER
//differentiate between debug and retail crash versions.
#define CRASH(pos, cause) Crash::ManualCrash(pos, cause);
#else
#define CRASH(pos, cause) Crash::ManualCrash();
#endif