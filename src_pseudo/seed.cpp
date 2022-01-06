#ifdef DEBUGVER
#define FILENAME "./src/seed.cpp"
#else
#define FILENAME ""
#endif

void bootproc(void){
  osInitialize();
  osUnmapTLBAll();
  osCreateThread(&init_thread,1,InitProc,null,&init_thread,1);
  osStartThread(&init_thread);
}

void InitProc(void){
  u32 uVar1;
  ulonglong uVar2;
  OSTime time;
  u64 uVar3;
  
  memset(&gGlobals,0,0x2278);
  crashthread_init(crash_handler,0,0x32,6);
  lookforExpansionPak((s32)romMain,&clear_end - &romMain);
  Heap_init(gMemCheckStruct.HeapStart,gMemCheckStruct.mem_free_allocated);
  PTR_800e8f30 = (OSMesg *)heapAlloc(0x20,FILENAME,0xad);
  osCreatePiManager(PIMGR,&pimgr_qeue,PTR_800e8f30,8);
  osSched_stack = (undefined *)heapAlloc(0x2000,FILENAME,0xb1);
  if (osTvType == NTSC) osCreateScheduler(&Sched,osSched_stack + 0x2000,0xc,2,1);
  if (osTvType == PAL) osCreateScheduler(&Sched,osSched_stack + 0x2000,0xc,0x10,1);
  if (osTvType == MPAL) osCreateScheduler(&Sched,osSched_stack + 0x2000,0xc,0x1e,1);
  gfx::initGfx(&Sched);
  audio_thread_init(&Sched,0xac44,0xb,5);
  dcm_init();
  init_controller_thread(&Sched,1,10,4);
  init_romcopy_thread(9,3);
  set_borg_mem_things(&borg_listings,borg_files);
  time = osGetTime();
  Random::setRNGSeed(&gGlobals,udivdi3(CONCAT44((time >> 0x20) << 6 | time >> 0x1a,time << 6),3000));
  app_cpp_func(&Sched,8,2);
  osSetThreadPri(&init_thread,IDLE);
  do {} while(1);
}