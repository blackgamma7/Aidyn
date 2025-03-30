#define FILENAME "./src/seed.cpp"

#include "globals.h"
#include "memcheck.h"

OSMesg* PTR_800e8f30=NULL;
void* osSched_stack=NULL;
u64 gInitThreadStack[105]={0};
OSThread gInitThread={0};
OSSched gSched={0};
OSMesgQueue pimgr_qeue={0};



void bootproc(void){
  osInitialize();
  osUnmapTLBAll();
  osCreateThread(&gInitThread,1,InitProc,NULL,&gInitThreadStack+sizeof(gInitThreadStack),1);
  osStartThread(&gInitThread);
}

void InitProc(void* p){
  CLEAR(&gGlobals);
  Crash::InitProc(crash_handler,0,0x32,6);
  MemoryCheck((s32)romMain,&clear_end - &romMain);
  HeapInit(gMemCheckStruct.heapStart,gMemCheckStruct.mem_free_allocated);
  ALLOCS(PTR_800e8f30,sizeof(OSMesg)*8,173);
  osCreatePiManager(OS_PRIORITY_PIMGR,&pimgr_qeue,PTR_800e8f30,8);
  ALLOCS(osSched_stack,0x2000,0xb1);
  if (osTvType == OS_TV_NTSC) osCreateScheduler(&gSched,(void *)((int)osSched_stack + 0x2000),0xc,2,1);
  if (osTvType == OS_TV_PAL) osCreateScheduler(&gSched,(void *)((int)osSched_stack + 0x2000),0xc,0x10,1);
  if (osTvType == OS_TV_MPAL) osCreateScheduler(&gSched,(void *)((int)osSched_stack + 0x2000),0xc,0x1e,1);
  Graphics::initGfx(&gSched);
  audio_thread_init(&gSched,44100,11,5);
  DCM::Init();
  Controller::Init(&gSched,1,10,4);
  RomCopy::Init(9,3);
  SetBorgListing(&borg_listings,borg_files);
  OSTime time = osGetTime();
  RAND.SetSeed(udivdi3(CONCAT44((time >> 0x20) << 6 | time >> 0x1a,time << 6),3000));
  appInit(&gSched,8,2);
  osSetThreadPri(&gInitThread,OS_PRIORITY_IDLE);
  while(1){}
}