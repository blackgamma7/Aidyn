#include "commonTypes.h"

typedef struct {
    u8[2120] Stack;
    OSThread Thread;
    OSmesg Mesgs;
    OSMesgQueue MesgQ;
    s32 crash_func_arg;
    char[128] position;
    char[128] Cause;
    bool IsManualCrash;
    void (*Func)(void*);
}CrashManager;

struct CrashManager gCrashManager;

void crashthread_init(void *arg0,s32 arg1,u32 Pri,u32 ID){
  memset(&gCrashManager,0,sizeof(CrashManager));
  gCrashManager.crash_func_arg = arg1;
  gCrashManager.Func = arg0;
  osCreateThread(&gCrashManager.Thread,ID,crashProc,NULL,&gCrashManager.Thread,Pri;
  osStartThread(&gCrashManager.Thread);}

void crashProc(void){
  OSMesg temp;

  crashMesgQueue();
  do {
    osRecvMesg(&gCrashManager.MesgQ,&temp,1);
    (*gCrashManager.Func)(&gCrashManager.crash_func_arg);
  } while( true );
}

void crashMesgQueue(void){
  osCreateMesgQueue(&gCrashManager.MesgQ,&gCrashManager.Mesgs,1);
  osSetEventMesg(OS_EVENT_FAULT,&gCrashManager.MesgQ,(OSmesg)1);
  gCrashManager.IsManualCrash = false;
}
#ifdef DEBUGVER
void Crash::ManualCrash(char *pos,char *cause){
  gCrashManager.IsManualCrash = true;
  strncpy(gCrashManager.position,pos,0x80);
  gCrashManager.position[127] = 0;
  strncpy(gCrashManager.Cause,cause,0x80);
  gCrashManager.Cause[127] = 0;
  osSendMesg(&gCrashManager.MesgQ,(OSMesg)1,0);
}
#else
void Crash::ManualCrash(void){
  gCrashManager.IsManualCrash = true;
  strncpy(gCrashManager.position,"RELEASE VERSION",0x80);
  gCrashManager.position[127] = 0;
  strncpy(gCrashManager.Cause,"NO CRASH INFO",0x80);
  gCrashManager.Cause[127] = 0;
  osSendMesg(&gCrashManager.MesgQ,(OSMesg)0x1,0);
}
#endif