#define FILENAME "./src/questdata.cpp"

#include "QuestData.h"
#include "SaveEntity.h"
#include "SaveParty.h"
#include "voxelChart.h"
#include "CRC.h"

namespace QuestData{
void Save(u8 *data){
  u8 i;
  float fVar5;
  float fVar6;
  SaveFile sav;
  WeatherTemp fStack96;
  
  SaveParty::Init(&sav,data);
  SaveEntity::BenchParty(PARTY);
  SaveParty::SaveInGameTime(&sav);
  SaveParty::SaveGold(&sav);
  SaveParty::SaveTimer(&sav,PARTY->TimeRunning);
  SaveParty::SaveTimer(&sav,PARTY->timeWalking);
  SaveParty::SaveTimer(&sav,PARTY->timeSneaking);
  SaveParty::SaveCharSheetEffects(&sav,SaveEntity::GetMember(0));
  SaveParty::SaveAlaron(&sav,SaveEntity::GetMember(0));
  for(i=1;i<4;i++) {SaveParty::SaveCharSheetEffects(&sav,SaveEntity::GetMember(i));}
  for(;i<9;i++) {SaveParty::SaveCharSheet(&sav,SaveEntity::GetMember(i));}
  PARTY->Inventory->Save(&sav);
  memcpy(&fStack96,&gWeatherTemp,16);
  fStack96.PrecipScale*=1000.0f;
  fStack96.FogFloat*=1000.0f;
  fStack96.ThunderFloat*=1000.0f;
  SaveParty::SaveBits(&sav,(s32)fStack96.PrecipScale,SaveBits_Float);
  SaveParty::SaveBits(&sav,(s32)fStack96.FogFloat,SaveBits_Float);
  SaveParty::SaveBits(&sav,(s32)fStack96.ThunderFloat,SaveBits_Float);
  SaveParty::SaveBits(&sav,(uint)fStack96.precip,SaveBits_Byte);
  fVar5 = gGlobals.VolSFX * 1000.0f;
  fVar6 = gGlobals.VolBGM * 1000.0f;
  SaveParty::SaveBits(&sav,(s32)fVar5,SaveBits_Float);
  SaveParty::SaveBits(&sav,(s32)fVar6,SaveBits_Float);
  SaveParty::SaveBits(&sav,(uint)gGlobals.ResolutionSelect,SaveBits_Bool);
}

void Load(u8 *data){
  PartyInventory *pPVar1;
  float fVar2;
  u8 i;
  CharSheet *pCVar4;
  u8 uVar5;
  double dVar6;
  float fVar7;
  SaveFile sav;
  WeatherTemp aWStack_68;
  
  SaveParty::Init(&sav,data);
  SaveParty::LoadInGameTime(&sav);
  uVar5 = 1;
  PARTY->Free();
  PARTY->Init();
  PARTY->Gold = SaveParty::LoadGold(&sav);
  PARTY->TimeRunning = SaveParty::LoadTimer(&sav);
  PARTY->timeWalking = SaveParty::LoadTimer(&sav);
  PARTY->timeSneaking = SaveParty::LoadTimer(&sav);
  PARTY->Members[0] = SaveParty::LoadCharSheetEffects(&sav);
  SaveParty::LoadAlaron(&sav,PARTY->Members[0]);
  PARTY->PartySize++;
  for(i=1;i<MAXPARTY;i++) {
    PARTY->Members[i] = SaveParty::LoadCharSheetEffects(&sav);
    if (PARTY->Members[i]) PARTY->PartySize++;
  }
  for(;i<9;i++){SaveEntity::LoadMember(SaveParty::LoadCharSheet(&sav),(u16)i);}
  PARTY->Inventory->Load(&sav);
  aWStack_68.PrecipScale = (float)SaveParty::LoadBits(&sav,SaveBits_Float);
  aWStack_68.FogFloat = (float)SaveParty::LoadBits(&sav,SaveBits_Float);
  aWStack_68.ThunderFloat = (float)SaveParty::LoadBits(&sav,SaveBits_Float);
  aWStack_68.PrecipScale*=(1.0f/1000); 
  aWStack_68.FogFloat*=(1.0f/1000);
  aWStack_68.ThunderFloat*=(1.0f/1000);
  aWStack_68.precip = SaveParty::LoadBits(&sav,8);
  World::SetWithWeatherTemp(TerrainPointer,&aWStack_68);
  COPY(&gWeatherTemp,&aWStack_68);
  LoadedGameSaveFlag = 1;
  gGlobals.VolSFX = (float)SaveParty::LoadBits(&sav,SaveBits_Float) * (1.0f/1000);
  gGlobals.VolBGM = (float)SaveParty::LoadBits(&sav,SaveBits_Float) * (1.0f/1000);
  selectResMode((byte)SaveParty::LoadBits(&sav,SaveBits_Bool));
}

void SaveVoxelChart(byte *param_1){
  *param_1=voxelChartIndex;
  param_1++;
  for(u16 i=0;i<sizeof(voxelChartIndecies);i++,param_1++){
    *param_1=voxelChartIndecies[i];
  }
  for(u16 j=0;j<sizeof(voxelChart);j++,param_1++) {
    *param_1=((u8*)&voxelChart)[j];
  }
}

void LoadVoxelChart(byte *param_1){
  voxelChartIndex = *param_1;
  param_1++;
  for(u16 i=0;i<sizeof(voxelChartIndecies);i++,param_1++){
    voxelChartIndecies[i]=*param_1;
  }
  for(u16 j=0;j<sizeof(voxelChart);j++,param_1++) {
    ((u8*)&voxelChart)[j]=*param_1;
  }
}

u8 VerifyChecksum(SaveDatStruct *p){return CRC::VerifyChecksum(p,sizeof(*p));}

void CopySnapshot(void *param_1){
  if (gQuestdataSnapshot) memcpy(param_1,gQuestdataSnapshot,SNAPSHOT_SIZE);
}
void SaveItemID(ItemID *param_1,ItemID *param_2){
  if (param_2) *param_1 = *param_2;
}

//saves Alaron's name, current playtime and party for savefile ID'ing
void SavePartyPlaytime(SavePartyHeader *param_1){
  char *c2;
  CharSheet *pCVar2;
  int iVar3;
  uint uVar4;
  
  uVar4 = 0;
  pCVar2 = PARTY->GetMemberById(gEntityDB->entities[EntInd_Alaron].ID);
  c2 = pCVar2->name;
  param_1->time = TerrainPointer->PlayTime;
  strcpy(param_1->name,c2);
  
   for(iVar3 = 0;iVar3<4;iVar3++){
    SaveItemID(&param_1->party[iVar3],&PARTY->Members[iVar3]->ID);
  }
}
void CopyEngineZone(mapFloatDat *param_1,u8 copy){
  if (copy) {
    SaveEngineZone(gPlayer,&gGlobals.gameVars.MapFloatDatEntry);
    COPY(param_1,&gGlobals.gameVars.MapFloatDatEntry);
  }
}

void SaveToFile(SaveDatPointers *param_1,u8 param_2){
  SavePartyPlaytime(param_1->savePartyHead);
  CopyEngineZone(param_1->mapdata,param_2);
  SaveGameState(gameStates,param_1->EventFlags);
  Minimap_Save((u8 *)param_1->minimap);
  Save(param_1->gamestate);
  SaveVoxelChart(param_1->voxelChart);
}

u8 InitSaveFile(SaveDatStruct *param_1){
  SaveDatPointers apuStack_48;
  
  SetPointers(param_1,&apuStack_48);
  CLEAR(param_1);
  SaveToFile(&apuStack_48,true);
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
  Minimap_Load((u8*)param_1->minimap);
  Load(param_1->gamestate);
  LoadVoxelChart(param_1->voxelChart);
  TerrainPointer->PlayTime = param_1->savePartyHead->time;
  if (param_2) {
    engineZone_flag = 0;
    gGlobals.playerCharStruct.some_sound_var = 1;
    param_1->mapdata->mapDatB = 0xffff;
    gGlobals.gameVars.mapDatB = 0xffff;
    gGlobals.gameVars.MapFloatDatEntry.mapDatB = 0xffff;
  }
}

u8 LoadFromMemPak(SaveDatStruct *param_1){
  SaveDatPointers aSStack_48;
  SetPointers(param_1,&aSStack_48);
  LoadFile(&aSStack_48,true);
  return true;
}

void TakeSnapshot(void){
  if (!gQuestdataSnapshot) {
    ALLOCS(gQuestdataSnapshot,SNAPSHOT_SIZE,648);
    u16 h = Graphics::GetHRes();
    u16 V = Graphics::GetVRes();
    Graphics::getGfxLastFrame(gQuestdataSnapshot,SNAPSHOT_H,SNAPSHOT_V,0x10,
               (h / SCREEN_WIDTH) * 80.0f,(V / SCREEN_HEIGHT) * 60.0,(h / SCREEN_WIDTH) * SCREEN_HEIGHT,(V / SCREEN_HEIGHT) * 180.0);
    CLEAR(&gWeatherTemp);
    World::GetWeatherTemp(TerrainPointer,&gWeatherTemp);
  }
}

void FreeSnapshot(void){
  FREEPTR(gQuestdataSnapshot,689);
}

void Teleport(mapFloatDat *param_1,u8 param_2){
  if (param_2) {
    COPY(&gGlobals.gameVars.MapFloatDatEntry,param_1);
    gGlobals.playerCharStruct.some_sound_var = 1;
    if (gPlayer) set_teleport_obj_loadgame(param_1->mapDatA,param_1->MapShort1,param_1->MapShort2,param_1);
  }
}

void SetWeather(void){
  if (LoadedGameSaveFlag) {
    LoadedGameSaveFlag = false;
    World::SetWithWeatherTemp(TerrainPointer,&gWeatherTemp);
  }
}

};