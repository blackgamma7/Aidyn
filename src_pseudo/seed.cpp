#define FILENAME "./src/seed.cpp"

#include "globals.h"

void* PTR_800e8f30=NULL;
void* osSched_stack=NULL;
u64 gInitThreadStack[105]={0};
OSThread init_thread={0};
OSScheduler gSched={0};


void bootproc(void){
  osInitialize();
  osUnmapTLBAll();
  osCreateThread(&init_thread,1,InitProc,NULL,&init_thread,1);
  osStartThread(&init_thread);
}

void InitProc(void* p){

  OSTime time;
  CLEAR(&gGlobals);
  crashthread_init(crash_handler,0,0x32,6);
  MemoryCheck((s32)romMain,&clear_end - &romMain);
  HeapInit(gMemCheckStruct.HeapStart,gMemCheckStruct.mem_free_allocated);
  ALLOCS(PTR_800e8f30,0x20,173);
  osCreatePiManager(PIMGR,&pimgr_qeue,PTR_800e8f30,8);
  ALLOCS(osSched_stack,0x2000,0xb1);
  if (osTvType == NTSC) osCreateScheduler(&gSched,osSched_stack + 0x2000,0xc,2,1);
  if (osTvType == PAL) osCreateScheduler(&gSched,osSched_stack + 0x2000,0xc,0x10,1);
  if (osTvType == MPAL) osCreateScheduler(&gSched,osSched_stack + 0x2000,0xc,0x1e,1);
  Graphics::initGfx(&gSched);
  audio_thread_init(&gSched,44100,11,5);
  DCM::Init();
  Controller::Init(&gSched,1,10,4);
  RomCopy::Init(9,3);
  SetBorgListing(&borg_listings,borg_files);
  time = osGetTime();
  RAND.SetSeed(udivdi3(CONCAT44((time >> 0x20) << 6 | time >> 0x1a,time << 6),3000));
  appInit(&gSched,8,2);
  osSetThreadPri(&init_thread,OS_PRIORITY_IDLE);
  while(1){}
}