#ifdef DEBUGVER
#define FILENAME "./src/memorymaker.cpp"
#else
#define FILENAME ""
#endif
memMakerStruct* memmaker_pointer;  //seems to be similar to the save data structure.
//Memory management triggered with no Expansion Pak
void memorymaker_init(void){
  if (ExpPakFlag == 0) {
    memmaker_pointer = (memMakerStruct *)Malloc(0xc00,FILENAME,0x5a);
  }
}

void ofunc_memmaker_free(void){
  if (ExpPakFlag == 0) {
    Free(memmaker_pointer,FILENAME,0x70);
    memmaker_pointer = null;
  }
}

void memmaker_func_A(void){
  undefined auStack80 [80];
  
  if (ExpPakFlag == 0) {
    move_party_to_saveEnt(gGlobals.party);
    memset(memmaker_pointer,0,0xc00);
    memMaker_sub(memmaker_pointer,auStack80);
    func_8001e034(auStack80,false);
    clear_DBs();
    if (some_struct_pointer != (astruct_12 *)0x0) {
      func_8004f160(some_struct_pointer,3);
    }
    some_struct_pointer = (astruct_12 *)0x0;
    clear_commonstrings();
  }
}

void memmaker_func_B(void){
  astruct_12 *paVar1;
  undefined auStack72 [72];
  
  if (ExpPakFlag == 0) {
    load_commonstrings();
    paVar1 = (astruct_12 *)passToMalloc(0x28);
    some_struct_pointer = init_some_Struct(paVar1,widget::widget_handler_pointer);
    init_DBs();
    memMaker_sub(memmaker_pointer,auStack72);
    some_loadgame_func(auStack72,0);
    memset(memmaker_pointer,0,0xc00);
  }
}

void ofunc_noop(void){}
void ofunc_noop_(void){}