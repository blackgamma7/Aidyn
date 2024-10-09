#ifdef DEBUGVER
#define FILENAME "./src/questdata.cpp"
#else
#define FILENAME ""
#endif


#include "savefiles.h"
#include "globals.h"
#include "QuestData.h"
#include "CRC.h"

namespace QuestData{
void Save(u8 *data){
  u8 i;
  float fVar5;
  float fVar6;
  SaveFile sav [1];
  WeatherTemp fStack96;
  
  SaveParty::Init(sav,data);
  SaveEntity::BenchParty(gGlobals.party);
  SaveParty::SaveInGameTime(sav);
  SaveParty::SaveGold(sav);
  SaveParty::SaveTimer(sav,gGlobals.party->TimeRunning);
  SaveParty::SaveTimer(sav,gGlobals.party->timeWalking);
  SaveParty::SaveTimer(sav,gGlobals.party->timeSneaking);
  SaveParty::SaveCharSheetEffects(sav,SaveEntity::GetMember(0));
  SaveParty::SaveAlaron(sav,SaveEntity::GetMember(0));
  for(i=1;i<4;i++) {SaveParty::SaveCharSheetEffects(sav,SaveEntity::GetMember(i));}
  for(;i<9;i++) {SaveParty::SaveCharSheet(sav,SaveEntity::GetMember(i));}
  gGlobals.party->Inventory->Save(sav);
  memcpy(&fStack96,&gWeatherTemp,0x10);
  fStack96.precipScale*=1000.0f;
  fStack96.fogFloat*=1000.0f;;
  fStack96.thunderFloat*=1000.0f;;
  SaveParty::SaveBits(sav,(s32)fStack96.precipScale,0x20);
  SaveParty::SaveBits(sav,(s32)fStack96.fogFloat,0x20);
  SaveParty::SaveBits(sav,(s32)fStack96.thunderFloat,0x20);
  SaveParty::SaveBits(sav,(uint)fStack96.precip,8);
  fVar5 = gGlobals.VolSFX * 1000.0f;
  fVar6 = gGlobals.VolBGM * 1000.0f;
  SaveParty::SaveBits(sav,(s32)fVar5,0x20);
  SaveParty::SaveBits(sav,(s32)fVar6,0x20);
  SaveParty::SaveBits(sav,(uint)gGlobals.ResolutionSelect,1);
}

void Load(u8 *param_1){
  PartyInventory *pPVar1;
  float fVar2;
  uint uVar3;
  CharSheet *pCVar4;
  uint uVar5;
  double dVar6;
  float fVar7;
  SaveFile aSStack_a8 [8];
  WeatherTemp aWStack_68;
  
  SaveParty::Init(aSStack_a8,param_1);
  SaveParty::LoadInGameTime(aSStack_a8);
  uVar5 = 1;
  Party::Free(gGlobals.party);
  Party::Init(gGlobals.party);
  gGlobals.party->Gold = SaveParty::LoadGold(aSStack_a8);
  gGlobals.party->TimeRunning = SaveParty::LoadTimer(aSStack_a8);
  gGlobals.party->timeWalking = SaveParty::LoadTimer(aSStack_a8);
  gGlobals.party->timeSneaking = SaveParty::LoadTimer(aSStack_a8);
  gGlobals.party->Members[0] = SaveParty::LoadCharSheetEffects(aSStack_a8);
  SaveParty::LoadAlaron(aSStack_a8,gGlobals.party->Members[0]);
  gGlobals.party->PartySize++;
  do {
    pCVar4 = SaveParty::LoadCharSheetEffects(aSStack_a8);
    gGlobals.party->Members[uVar5] = pCVar4;
    if (pCVar4 != NULL) {
      gGlobals.party->PartySize++;
    }
    uVar5 = uVar5 + 1 & 0xff;
  } while (uVar5 < 4);
  if (uVar5 < 9) {
    do {
      SaveEntity::LoadMember(SaveParty::LoadCharSheet(aSStack_a8),(u16)uVar5);
      uVar5 = uVar5 + 1 & 0xff;
    } while (uVar5 < 9);
  }
  gGlobals.party->Inventory->Load(aSStack_a8);
  aWStack_68.precipScale = (float)SaveParty::LoadBits(aSStack_a8,0x20);
  aWStack_68.fogFloat = (float)SaveParty::LoadBits(aSStack_a8,0x20);
  aWStack_68.thunderFloat = (float)SaveParty::LoadBits(aSStack_a8,0x20);
  uVar3 = SaveParty::LoadBits(aSStack_a8,8);
  aWStack_68.precipScale*=0.001f;
  aWStack_68.fogFloat*=0.001f;
  aWStack_68.thunderFloat*=0.001f;
  aWStack_68.precip = SaveParty::LoadBits(aSStack_a8,8);
  World::SetWithWeatherTemp(TerrainPointer,&aWStack_68);
  COPY(&gWeatherTemp,&aWStack_68);
  LoadedGameSaveFlag = 1;
  gGlobals.VolSFX = (float)SaveParty::LoadBits(aSStack_a8,0x20) * 0.001f;
  gGlobals.VolBGM = (float)SaveParty::LoadBits(aSStack_a8,0x20) * 0.001f;
  selectResMode((byte)SaveParty::LoadBits(aSStack_a8,1));
}

void SaveVoxelChart(byte *param_1){
  short *psVar1;
  byte *pbVar2;
  ushort uVar3;
  u16 uVar4;
  VoxelChartEntry *pVVar5;
  
  pVVar5 = voxelChart;
  uVar4 = 0;
  *param_1 = voxelChartIndex;
  param_1++;
  do {
    pbVar2 = voxelChartIndecies + uVar4;
    uVar4++;
    *param_1 = *pbVar2;
    param_1++;
  } while (uVar4 < 0x13);
  uVar3 = 0;
  do {
    psVar1 = &pVVar5->arg0;
    pVVar5 = (VoxelChartEntry *)((int)&pVVar5->arg0 + 1);
    uVar3 += 1;
    *param_1 = *(byte *)psVar1;
    param_1++;
  } while (uVar3 < 0xe4);
}

void LoadVoxelChart(byte *param_1){
  byte bVar1;
  byte *pbVar2;
  ushort uVar3;
  uint uVar4;
  VoxelChartEntry *pVVar5;
  
  pVVar5 = voxelChart;
  voxelChartIndex = *param_1;
  param_1 = param_1 + 1;
  uVar4 = 0;
  do {
    bVar1 = *param_1;
    param_1 = param_1 + 1;
    pbVar2 = voxelChartIndecies + uVar4;
    uVar4 = uVar4 + 1 & 0xffff;
    *pbVar2 = bVar1;
  } while (uVar4 < 0x13);
  uVar3 = 0;
  do {
    bVar1 = *param_1;
    param_1 = param_1 + 1;
    uVar3 += 1;
    *(byte *)&pVVar5->arg0 = bVar1;
    pVVar5 = (VoxelChartEntry *)((int)&pVVar5->arg0 + 1);
  } while (uVar3 < 0xe4);
}

u8 VerifyChecksum(uint *param_1){return CRC::VerifyChecksum(param_1,sizeof(*param_1));}

void CopySnapshot(void *param_1){
  if (gQuestdataSnapshot) memcpy(param_1,gQuestdataSnapshot,SNAPSHOT_SIZE);
}
void SaveItemID(ItemID *param_1,ItemID *param_2){
  if (param_2 != NULL) *param_1 = *param_2;
}

//saves Alaron's name, current playtime and party for savefile ID'ing
void SavePartyPlaytime(SavePartyHeader *param_1){
  char *c2;
  Party *pPVar1;
  CharSheet *pCVar2;
  int iVar3;
  uint uVar4;
  
  pPVar1 = gGlobals.party;
  uVar4 = 0;
  pCVar2 = Party::GetMemberById(gGlobals.party,gEntityDB->entities[0x99].ID);
  c2 = pCVar2->name;
  param_1->time = TerrainPointer->PlayTime;
  strcpy(param_1->name,c2);
  
   for(iVar3 = 0;iVar3<4;iVar3++){
    SaveItemID(param_1->party[iVar3],pPVar1->Members[iVar3]->ID);
  }
}
void CopyEngineZone(mapFloatDat *param_1,u8 copy){
  if (copy) {
    SaveEngineZone(gGlobals.playerCharStruct.playerDat,&gGlobals.Sub.MapFloatDatEntry);
    COPY(param_1,&gGlobals.Sub.MapFloatDatEntry);
  }
}

void SaveFile(SaveDatPointers *param_1,u8 param_2){
  SavePartyPlaytime(param_1->savePartyHead);
  CopyEngineZone(param_1->mapdata,param_2);
  SaveGameState(gameStates,param_1->EventFlags);
  MiniMap::Save((u8 *)param_1->minimap);
  Save(param_1->gamestate);
  SaveVoxelChart(param_1->voxelChart);
}

u8 InitSaveFile(SaveDatStruct *param_1){
  SaveDatPointers apuStack_48;
  
  SetPointers(param_1,&apuStack_48);
  CLEAR(param_1);
  SaveFile(&apuStack_48,true);
  CopySnapshot(apuStack_48.screenshot);
  CRC::SetChecksum(param_1,sizeof(*param_1));
}

void SetPointers(SaveDatStruct *param_1,SaveDatPointers *param_2){
  param_2->mapdata = &param_1->mapDat;
  param_2->EventFlags = param_1->flags;
  param_2->screenshot = param_1->screenshot;
  param_2->minimap = (u32 *)param_1->minimap;
  param_2->gamestate = param_1->gameState;
  param_2->datStart = param_1;
  param_2->savePartyHead = &param_1->headerDat;
  param_2->voxelChart = param_1->voxelChart;
}
//Overload? uses "memory maker" triggered by Jumper Pak.
void SetPointers(MemoryMakerStruct *param_1,SaveDatPointers *param_2){
  param_2->mapdata = &param_1->mapData;
  param_2->EventFlags = param_1->flags;
  param_2->minimap = (u32 *)param_1->minimapDat;
  param_2->gamestate = param_1->gameState;
  param_2->datStart = (SaveDatStruct *)param_1;
  param_2->savePartyHead = &param_1->header;
  param_2->voxelChart = param_1->voxelChart;
}


void LoadFile(SaveDatPointers *param_1,u8 param_2){
  memset_voxelChart();
  LoadGameState(gameStates,param_1->EventFlags);
  setEventFlag(FLAG_NewJournalEntry,false);
  Teleport(param_1->mapdata,param_2);
  MiniMap::Load(param_1->minimap);
  Load(param_1->gamestate);
  LoadVoxelChart(param_1->voxelChart);
  TerrainPointer->PlayTime = param_1->savePartyHead->time;
  if (param_2) {
    engineZone_flag = 0;
    gGlobals.playerCharStruct.some_sound_var = 1;
    param_1->mapdata->mapDatB = 0xffff;
    gGlobals.Sub.mapDatB = 0xffff;
    gGlobals.Sub.MapFloatDatEntry.mapDatB = 0xffff;
  }
}

u8 LoadFromMemPak(SaveDatStruct *param_1){
  SaveDatPointers aSStack_48;
  SetPointers(param_1,&aSStack_48);
  LoadFile(&aSStack_48,true);
  return true;
}

void TakeSnapshot(void){
  ushort h;
  ushort V;
  
  if (!gQuestdataSnapshot) {
    ALLOCS(gQuestdataSnapshot,SNAPSHOT_SIZE,648);
    h = Graphics::get_hres();
    V = Graphics::get_vres();
    Graphics::getGfxLastFrame(gQuestdataSnapshot,SNAPSHOT_H,SNAPSHOT_V,0x10,
               (h / 320.0f) * 80.0f,(V / 240.0f) * 60.0,(h / 320.0f) * 240.0,(V / 240.0f) * 180.0);
    CLEAR(&gWeatherTemp);
    World::GetWeatherTemp(TerrainPointer,&gWeatherTemp);
  }
}

void FreeSnapshot(void){
  FREEPTR(gQuestdataSnapshot,689);
}

void Teleport(mapFloatDat *param_1,u8 param_2){
  if (param_2) {
    COPY(&gGlobals.Sub.MapFloatDatEntry,param_1);
    gGlobals.playerCharStruct.some_sound_var = 1;
    if (gGlobals.playerCharStruct.playerDat) set_teleport_obj_loadgame(param_1->mapDatA,param_1->MapShort1,param_1->MapShort2,param_1);
  }
}

void SetWeather(void){
  if (LoadedGameSaveFlag) {
    LoadedGameSaveFlag = false;
    World::SetWithWeatherTemp(TerrainPointer,&gWeatherTemp);
  }
}

};