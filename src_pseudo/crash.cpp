#include "crash.h"
#include "stringN64.h"


struct CrashManager gCrashManager;
namespace Crash{
void InitProc(void *arg0,void* arg1,u8 Pri,u16 ID){
  CLEAR(&gCrashManager);
  gCrashManager.crash_func_arg = arg1;
  gCrashManager.Func = arg0;
  osCreateThread(&gCrashManager.Thread,ID,CrashProc,NULL,&gCrashManager.Thread,Pri;
  osStartThread(&gCrashManager.Thread);}

void CrashProc(void* x){
  OSMesg temp;

  InitEventMesg();
  while(1) {
    osRecvMesg(&gCrashManager.MesgQ,&temp,1);
    (*gCrashManager.Func)(&gCrashManager.crash_func_arg);
  }
}

void InitEventMesg(void){
  osCreateMesgQueue(&gCrashManager.MesgQ,&gCrashManager.Mesgs,1);
  osSetEventMesg(OS_EVENT_FAULT,&gCrashManager.MesgQ,(OSMesg)1);
  gCrashManager.IsManualCrash = false;
}

#ifdef DEBUGVER
void ManualCrash(char *pos,char *cause){
  gCrashManager.IsManualCrash = true;
  STRCPYSafe(gCrashManager.position,pos);
  STRCPYSafe(gCrashManager.Cause,cause);
  osSendMesg(&gCrashManager.MesgQ,(OSMesg)1,0);
}
#else
void ManualCrash(void){
  gCrashManager.IsManualCrash = true;
  STRCPYSafe(gCrashManager.position,"RELEASE VERSION");
  STRCPYSafe(gCrashManager.Cause,"NO CRASH INFO");
  osSendMesg(&gCrashManager.MesgQ,(OSMesg)1,0);
}
#endif
}