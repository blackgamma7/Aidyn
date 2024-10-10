#define FILENAME "./src/seed.cpp"

#include "globals.h"

void bootproc(void){
  osInitialize();
  osUnmapTLBAll();
  osCreateThread(&init_thread,1,InitProc,NULL,&init_thread,1);
  osStartThread(&init_thread);
}

void InitProc(void){

  OSTime time;
  CLEAR(&gGlobals);
  crashthread_init(crash_handler,0,0x32,6);
  MemoryCheck((s32)romMain,&clear_end - &romMain);
  HeapInit(gMemCheckStruct.HeapStart,gMemCheckStruct.mem_free_allocated);
  ALLOCS(PTR_800e8f30,0x20,173);
  osCreatePiManager(PIMGR,&pimgr_qeue,PTR_800e8f30,8);
  ALLOCS(osSched_stack,0x2000,0xb1);
  if (osTvType == NTSC) osCreateScheduler(&Sched,osSched_stack + 0x2000,0xc,2,1);
  if (osTvType == PAL) osCreateScheduler(&Sched,osSched_stack + 0x2000,0xc,0x10,1);
  if (osTvType == MPAL) osCreateScheduler(&Sched,osSched_stack + 0x2000,0xc,0x1e,1);
  Graphics::initGfx(&Sched);
  audio_thread_init(&Sched,44100,11,5);
  DCM::Init();
  Controller::Init(&Sched,1,10,4);
  RomCopy::Init(9,3);
  SetBorgListing(&borg_listings,borg_files);
  time = osGetTime();
  RAND.SetSeed(udivdi3(CONCAT44((time >> 0x20) << 6 | time >> 0x1a,time << 6),3000));
  appInit(&Sched,8,2);
  osSetThreadPri(&init_thread,IDLE);
  while(1){}
}