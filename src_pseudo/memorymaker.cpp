#define FILENAME "./src/memorymaker.cpp"

#include "SaveEntity.h"
#include "QuestData.h"
#include "globals.h"

MemoryMakerStruct* gMemoryMaker=NULL;
//Memory management triggered with no Expansion Pak
void MemoryMaker::Init(void){
  if (!gExpPakFlag) ALLOC(gMemoryMaker,90);
}
//free "memoryMaker" save file
void MemoryMaker::Free(void){
  if (!gExpPakFlag) {FREE(gMemoryMaker,112);}
}
//unload certain features in memory if no expasion pak
void MemoryMaker::Unload(void){
  SaveDatPointers auStack80;
  
  if (!gExpPakFlag) {
    SaveEntity::BenchParty(PARTY);
    CLEAR(gMemoryMaker);
    QuestData::SetPointers(gMemoryMaker,&auStack80);
    QuestData::SaveToFile(&auStack80,false);
    clear_DBs();
    if (gGlobals.dialougStruct) FUN_8004f160(gGlobals.dialougStruct,3);
    gGlobals.dialougStruct = NULL;
    CommonStrings::Free();
  }
}
//load certain features back in memory if no expasion pak
void MemoryMaker::Reload(void){
  SaveDatPointers auStack72;
  
  if (!gExpPakFlag) {
    CommonStrings::Init();
    gGlobals.dialougStruct = Init_DialogStruct(new(0x28),WHANDLE);
    init_DBs();
    QuestData::SetPointers(gMemoryMaker,&auStack72);
    QuestData::LoadFile(&auStack72,false);
    CLEAR(gMemoryMaker);
  }
}
//unknown, unused
void MemoryMaker::NoopA(void){}
//unknown, unused
void MemoryMaker::NoopB(void){}