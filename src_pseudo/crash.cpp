struct CrashManager{
    byte[2120] Stack;
    OSThread Thread;
    OSmesg Mesgs;
    OSMesgQueue MesgQ;
    undefined4 crash_func_arg;
    char[128] position;
    char[128] Cause;
    bool IsManualCrash;
    func* Func;
}

struct CrashManager CrashStruct;
void crashthread_init(func *arg0,undefined4 arg1,uint Pri,uint ID){
  memset(&CrashStruct,0,sizeof(CrashManager));
  CrashStruct.crash_func_arg = arg1;
  CrashStruct.Func = arg0;
  osCreateThread(&CrashStruct.Thread,ID,crashProc,NULL,&CrashStruct.Thread,Pri;
  osStartThread(&CrashStruct.Thread);}

void crashProc(void){
  OSMesg temp;

  crashMesgQueue();
  do {
    osRecvMesg(&CrashStruct.MesgQ,&temp,1);
    (*CrashStruct.Func)(&CrashStruct.crash_func_arg);
  } while( true );
}

void crashMesgQueue(void){
  osCreateMesgQueue(&CrashStruct.MesgQ,&CrashStruct.Mesgs,1);
  osSetEventMesg(FAULT,&CrashStruct.MesgQ,&_gp_1);
  CrashStruct.IsManualCrash = false;
}
#ifdef DEBUGVER
void assert(char *pos,char *cause){
  CrashStruct.IsManualCrash = true;
  strncpy(CrashStruct.position,pos,0x80);
  CrashStruct.position[127] = '\0';
  strncpy(CrashStruct.Cause,cause,0x80);
  CrashStruct.Cause[127] = '\0';
  osSendMesg(&CrashStruct.MesgQ,(OSMesg)0x1,0);
}
#else
void assert(void){
  CrashStruct.IsManualCrash = true;
  strncpy(CrashStruct.position,"RELEASE VERSION",0x80);
  CrashStruct.position[127] = '\0';
  strncpy(CrashStruct.Cause,"NO CRASH INFO",0x80);
  CrashStruct.Cause[127] = '\0';
  osSendMesg(&CrashStruct.MesgQ,(OSMesg)0x1,0);
}
#endif