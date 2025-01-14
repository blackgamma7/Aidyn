#include "globals.h"
//char[8]* stat_labels ={"Intelligence","willpower","Dexterity","Endurance","Strength","Stamina","Level"};
s32 base_stat_cap[STATCOUNT] = {30,30,30,40,30,90,40};
s32 modded_stat_cap[STATCOUNT] = {40,40,40,50,40,120,40};
s32 stat_multiplier[STATCOUNT] = {12,12,24,12,12,4,500};

void CharStats::Init(CharStats_s *stats,ItemID ID){
  u8 index;
  Entity_Ram *Entram;
  
  index = GetIDIndex(ID);
  Entram = gEntityDB->entities;
  memcpy(stats,Entram[index].stats,6);
  stats->Base[STAT_LV] = Entram[index].Level;
  COPY(stats->health,stats);
  COPY(stats->Modded,stats);
  COPY(stats->magicMod,stats);
}

void Ofunc_NOOP_800845f4(void){}

void CharStats::Save(CharStats_s *param_1,SaveFile *param_2){
  SaveParty::SaveBits(param_2,(uint)param_1->Base[5],8);
  SaveParty::SaveBits(param_2,(uint)param_1->Base[3],6);
  SaveParty::SaveBits(param_2,(uint)param_1->Base[6],6);
  SaveParty::SaveBits(param_2,(uint)param_1->Base[1],5);
  SaveParty::SaveBits(param_2,(uint)param_1->Base[0],5);
  SaveParty::SaveBits(param_2,(uint)param_1->Base[4],5);
  SaveParty::SaveBits(param_2,(uint)param_1->Base[2],5);
  SaveParty::SaveBits(param_2,(int)param_1->health[5],8);
  SaveParty::SaveBits(param_2,(int)param_1->health[3],6);
  SaveParty::SaveBits(param_2,(int)param_1->health[6],6);
  SaveParty::SaveBits(param_2,(int)param_1->health[1],5);
  SaveParty::SaveBits(param_2,(int)param_1->health[0],5);
  SaveParty::SaveBits(param_2,(int)param_1->health[4],5);
  SaveParty::SaveBits(param_2,(int)param_1->health[2],5);
}

void CharStats::Load(CharStats_s *param_1,SaveFile *param_2){
  uint uVar1;
  
  uVar1 = SaveParty::LoadBits(param_2,8);
  param_1->Base[5] = (byte)uVar1;
  uVar1 = SaveParty::LoadBits(param_2,6);
  param_1->Base[3] = (byte)uVar1;
  uVar1 = SaveParty::LoadBits(param_2,6);
  param_1->Base[6] = (byte)uVar1;
  uVar1 = SaveParty::LoadBits(param_2,5);
  param_1->Base[1] = (byte)uVar1;
  uVar1 = SaveParty::LoadBits(param_2,5);
  param_1->Base[0] = (byte)uVar1;
  uVar1 = SaveParty::LoadBits(param_2,5);
  param_1->Base[4] = (byte)uVar1;
  uVar1 = SaveParty::LoadBits(param_2,5);
  param_1->Base[2] = (byte)uVar1;
  uVar1 = SaveParty::LoadBits(param_2,8);
  param_1->health[5] = (s8)uVar1;
  uVar1 = SaveParty::LoadBits(param_2,6);
  param_1->health[3] = (s8)uVar1;
  uVar1 = SaveParty::LoadBits(param_2,6);
  param_1->health[6] = (s8)uVar1;
  uVar1 = SaveParty::LoadBits(param_2,5);
  param_1->health[1] = (s8)uVar1;
  uVar1 = SaveParty::LoadBits(param_2,5);
  param_1->health[0] = (s8)uVar1;
  uVar1 = SaveParty::LoadBits(param_2,5);
  param_1->health[4] = (s8)uVar1;
  uVar1 = SaveParty::LoadBits(param_2,5);
  param_1->health[2] = (s8)uVar1;
  memcpy(param_1->magicMod,param_1,7);
  memcpy(param_1->Modded,param_1->health,7);
}

void CharStats::Copy(CharStats_s* A,CharStats_s* B){
  COPY(A->Base,B->Base);
  memcpy(A->health,B->health,7);
  memcpy(A->magicMod,B->magicMod,7);
  memcpy(A->Modded,B->Modded,7);
}

void CharStats::AddBase(CharStats_s* stats,u8 type,s8 mod){
  if (base_stat_cap[type] < (s32)stats->Base[type] + mod) {
    mod = base_stat_cap[type] - (u32)stats->Base[type];
  }
  stats->Base[type] += mod;
  stats->magicMod[type] += mod;
  addModdedHealth(stats,type,mod);
}

void CharStats::addModdedHealth(CharStats_s* stat,u8 type,s8 mod){
  stat->health[type] += mod;
  stat->Modded[type] += mod;
  if (mod) Event_flag_stat(type);
}

void CharStats::AddModdedMagic(CharStats_s* stat,u8 type,s8 mod){
  stat->magicMod[type] += mod;
  stat->Modded[type] += mod;
  Event_flag_stat(type);
}

void CharStats::SubModdedMagic(CharStats_s* stat,u8 type,s8 mod){
  stat->magicMod[type] -= mod;
  stat->Modded[type] -= mod;
  Event_flag_stat(type);
}

void CharStats::AddModded(CharStats_s* stat,u8 type,s8 mod){
  stat->Modded[type] += mod;}

void CharStats::SubModded(CharStats_s* stat,u8 type,s8 mod){
  stat->Modded[type] -= mod;}

s32 CharStats::getBase(CharStats_s* stats,u8 type){
  return capStatMax(stats,type,(u32)stats->magicMod[type],base_stat_cap);
}

s32 CharStats::getModded(CharStats_s* param_1,u8 type){
  return capStatMax(param_1,type,param_1->Modded[type],modded_stat_cap);}

s32 CharStats::GetTraningPrice(CharStats_s* param_1,u8 type){
  s32 next = param_1->Base[type] + 1;
  return SQ(next)* stat_multiplier[type];
}

u8 CharStats::isStatCapped(CharStats_s* param_1,u8 param_2){return base_stat_cap[param_2] <= param_1->Base[param_2];}

s32 CharStats::GetBase2(CharStats_s* param_1,u8 type){
  return capStatMax(param_1,type,(u32)param_1->Base[type],base_stat_cap);}

s32 CharStats::getBaseModDiff(CharStats_s* param_1,u8 type){
  return (s32)(param_1->Modded[type] - param_1->Base[type]);
}

s32 CharStats::capStatMax(CharStats_s* x, u8 type,s32 stat,s32 *caps){
  s32 i;
  
  if (stat < 0) i = 0;
  else {
    i = caps[type];
    if (stat <= i) return stat;
  }
  return i;
}

u8 CharStats::someStatCheck(CharStats_s* param_1,u8 param_2){
  return param_1->health[param_2] < param_1->Base[param_2];
}
