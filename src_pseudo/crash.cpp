#include "crash.h"
#include "stringN64.h"


struct CrashManager gCrashManager={0};
namespace Crash{
void InitProc(void (*handle)(CrashSub*),void* arg1,u8 Pri,u16 ID){
  CLEAR(&gCrashManager);
  gCrashManager.sub.var0 = (u32)arg1;
  gCrashManager.Func = handle;
  osCreateThread(&gCrashManager.Thread,ID,CrashProc,NULL,&gCrashManager.Thread,Pri);
  osStartThread(&gCrashManager.Thread);}

void CrashProc(void* x){
  OSMesg temp;

  InitEventMesg();
  while(1) {
    osRecvMesg(&gCrashManager.MesgQ,&temp,1);
    (*gCrashManager.Func)(&gCrashManager.sub);
  }
}

void InitEventMesg(void){
  osCreateMesgQueue(&gCrashManager.MesgQ,&gCrashManager.Mesgs,1);
  osSetEventMesg(OS_EVENT_FAULT,&gCrashManager.MesgQ,(OSMesg)1);
  gCrashManager.sub.IsManualCrash = false;
}

#if DEBUGVER
void ManualCrash(char *pos,char *cause){
  gCrashManager.sub.IsManualCrash = true;
  STRCPYSafe(gCrashManager.sub.position,pos);
  STRCPYSafe(gCrashManager.sub.Cause,cause);
  osSendMesg(&gCrashManager.MesgQ,(OSMesg)1,0);
}
#else
void ManualCrash(void){
  gCrashManager.IsManualCrash = true;
  STRCPYSafe(gCrashManager.sub.position,"RELEASE VERSION");
  STRCPYSafe(gCrashManager.sub.Cause,"NO CRASH INFO");
  osSendMesg(&gCrashManager.MesgQ,(OSMesg)1,0);
}
#endif
}