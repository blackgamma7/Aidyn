#ifdef DEBUGVER
#define FILENAME "./src/memorymaker.cpp"
#else
#define FILENAME ""
#endif

#include "QuestData.h"

MemoryMakerStruct* gMemoryMaker=NULL;
//Memory management triggered with no Expansion Pak
void MemoryMaker::Init(void){
  if (!gExpPakFlag) ALLOC(gMemoryMaker,90);
}

void MemoryMaker::Free(void){
  if (!gExpPakFlag) {FREE(gMemoryMaker,112);}
}

void MemoryMaker::Unload(void){
  SaveDatPointers auStack80;
  
  if (!gExpPakFlag) {
    SaveEntity::BenchParty(gGlobals.party);
    CLEAR(gMemoryMaker);
    QuestData::SetPointers(gMemoryMaker,&auStack80);
    QuestData::SaveToFile(&auStack80,false);
    clear_DBs();
    if (gGlobals.dialougStruct) FUN_8004f160(gGlobals.dialougStruct,3);
    gGlobals.dialougStruct = NULL;
    CommonStrings::Free();
  }
}

void MemoryMaker::Reload(void){
  SaveDatPointers auStack72;
  
  if (!gExpPakFlag) {
    CommonStrings::Init();
    gGlobals.dialougStruct = init_some_Struct(new(0x28),gGlobals.widgetHandler);
    init_DBs();
    QuestData::SetPointers(gMemoryMaker,&auStack72);
    QuestData::LoadFile(&auStack72,false);
    CLEAR(gMemoryMaker);
  }
}

void MemoryMaker::NoopA(void){}
void MemoryMaker::NoopB(void){}