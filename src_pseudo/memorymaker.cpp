#ifdef DEBUGVER
#define FILENAME "./src/memorymaker.cpp"
#else
#define FILENAME ""
#endif
memMakerStruct* memmaker_pointer;  //seems to be similar to the save data structure.
//Memory management triggered with no Expansion Pak
void MemoryMaker::Init(void){
  if (ExpPakFlag == 0) {
    memmaker_pointer = (memMakerStruct *)heapAlloc(0xc00,FILENAME,0x5a);
  }
}

void MemoryMaker::Free(void){
  if (ExpPakFlag == 0) {
    HeapFree(memmaker_pointer,FILENAME,0x70);
    memmaker_pointer = NULL;
  }
}

void MemoryMaker::Unload(void){
  u8 auStack80 [80];
  
  if (ExpPakFlag == 0) {
    move_party_to_saveEnt(gGlobals.party);
    memset(memmaker_pointer,0,0xc00);
    memMaker_sub(memmaker_pointer,auStack80);
    func_8001e034(auStack80,false);
    clear_DBs();
    if (some_struct_pointer) func_8004f160(some_struct_pointer,3);
    some_struct_pointer = NULL;
    CommonStrings::Free();
  }
}

void MemoryMaker::Reload(void){
  u8 auStack72 [72];
  
  if (ExpPakFlag == 0) {
    CommonStrings::Init();
    some_struct_pointer = init_some_Struct(passToMalloc(0x28),widget::widget_handler_pointer);
    init_DBs();
    memMaker_sub(memmaker_pointer,auStack72);
    some_loadgame_func(auStack72,0);
    memset(memmaker_pointer,0,0xc00);
  }
}

void MemoryMaker::NoopA(void){}
void MemoryMaker::NoopB(void){}