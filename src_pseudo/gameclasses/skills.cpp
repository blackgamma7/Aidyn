#include "globals.h"


void FloorSkill(s8*skills,u32 len){
  u32 i=0;
  if (len != 0) {
    for(i=0;i<len;i++) {
      FLOOR(skills[i],0);
    }
  }
  return;
}

void CharSkills::Init(ItemID id){
  u8 X;
  Entity_Ram *EntRam;
  
  EntRam = &gEntityDB->entities[GetIDIndex(id)];
  COPY(this->SkillBase,EntRam->Skills);
  COPY(this->SkillModded,EntRam->Skills);
  COPY(this->WeaponBase,EntRam->WeaponSkills);
  COPY(this->WeaponModded,EntRam->WeaponSkills);
  FloorSkill(this->SkillModded,0xc);
  FloorSkill(this->WeaponModded,0xb);
  this->ShieldBase = EntRam->sheildStat;
  X = EntRam->sheildStat;
  if (EntRam->sheildStat < 0) X = 0;
  this->ShieldModded = X;
}

void CharSkills::Save(SaveFile *save){
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Alchemist],4);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Diplomat],4);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Healer],4);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Loremaster],4);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Mechanic],4);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Merchant],4);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Ranger],4);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Stealth],4);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Theif],4);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Troubador],4);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Warrior],4);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Wizard],4);
  SaveParty::SaveBits(save,(int)this->WeaponBase[WEAPON_Hafted],4);
  SaveParty::SaveBits(save,(int)this->WeaponBase[WEAPON_Missle],4);
  SaveParty::SaveBits(save,(int)this->WeaponBase[WEAPON_Pole],4);
  SaveParty::SaveBits(save,(int)this->WeaponBase[WEAPON_Sword],4);
  SaveParty::SaveBits(save,(int)this->WeaponBase[WEAPON_Thrown],4);
  SaveParty::SaveBits(save,(int)this->ShieldBase,4);
}


u8 CharSkills::LoadOne(SaveFile *param_2,s8 skill){
  u8 auStack_48[] = {(u8)SaveParty::LoadBits(param_2,4),0xFF};
  return auStack_48[-((int)skill >> 0x1f)];
}


void CharSkills::LoadAll(SaveFile *sav){
 #define LoadSkill(x) \
     this->SkillBase[SKILL_##x]=this->SkillModded[SKILL_##x]=LoadOne(sav,this->SkillBase[SKILL_##x])

  LoadSkill(Alchemist);
  LoadSkill(Diplomat);
  LoadSkill(Healer);
  LoadSkill(Loremaster);
  LoadSkill(Mechanic);
  LoadSkill(Merchant);
  LoadSkill(Ranger);
  LoadSkill(Stealth);
  LoadSkill(Theif);
  LoadSkill(Troubador);
  LoadSkill(Warrior);
  LoadSkill(Wizard);

#define LoadWeapon(x) \
     this->WeaponBase[WEAPON_##x]=this->WeaponModded[WEAPON_##x]=LoadOne(sav,this->WeaponBase[WEAPON_##x])

  LoadWeapon(Hafted);
  LoadWeapon(Missle);
  LoadWeapon(Pole);
  LoadWeapon(Sword);
  LoadWeapon(Thrown);

  this->ShieldBase = this->ShieldModded= LoadOne(sav,this->ShieldBase);

  FloorSkill(this->SkillModded,0xc);
  FloorSkill(this->WeaponModded,0xb);
  FLOOR(this->ShieldModded,0);
}


void CharSkills::Copy(CharSkills *B){
  this->ShieldBase = B->ShieldBase;
  this->ShieldModded = B->ShieldModded;
  COPY(this->SkillBase,B);
  COPY(this->SkillModded,B->SkillModded);
  COPY(this->WeaponBase,B->WeaponBase);
  COPY(this->WeaponModded,B->WeaponModded);
}

u32 CharSkills::GetSkillXpMod(u8 arg1){
  s32 i = this->SkillBase[arg1] + 1;
  s32 skill_xp_multis[12]={1500,500,1000,750,500,7500,750,500,1000,1000,1000,1500};
  if (0xb < arg1) {
    CRASH("Skill overwrite","../gameclasses/skills.cpp");
  }
  return SQ(i) * skill_xp_multis[arg1];
}

u32 CharSkills::GetWeaponXpMod(u8 arg1){
  u32 i = this->WeaponBase[arg1] + 1;
  //0 value = enemy weapon classes
  u32 weapon_xp_multis[11]={0,0,0,400,600,400,0,0,600,400,0};

  if (10 <= arg1) CRASH("Weapon_XP_overflow","../gameclasses/skills.cpp");
  return SQ(i) * weapon_xp_multis[arg1];
}

u32 CharSkills::GetShieldXpPrice(){
  s32 iVar1 =this->ShieldBase + 1;
  return SQ(iVar1) * 500;
}

s32 GetSkillTrainGoldPrice(u8 x){
  if (x != 0) return (x + 1) * 40;
  return 200;
}

u32 CharSkills::GetGoldTrainPrice(u8 arg1){
  return GetSkillTrainGoldPrice(this->SkillBase[arg1]);
}

u32 CharSkills::GetWeaponGoldTrainPrice(u8 arg1){
  return GetSkillTrainGoldPrice(this->WeaponBase[arg1]);
}

u32 CharSkills::GetShieldGoldTrainPrice(){
  return GetSkillTrainGoldPrice(this->ShieldBase);
}

void AddToModdedSkill(s8* skills,s8 *modded,u8 arg2,s8 mod){
  if (-1 < skills[arg2]) modded[arg2]+= mod;
}

void AddToSkill(s8 *base,s8 *modded,u8 index,s8 arg3){
  byte bVar1;
  byte bVar2;
  int iVar3;
  s8 *pbVar4;
  
  iVar3 = (int)arg3;
  pbVar4 = (base + index);
  bVar1 = *pbVar4;
  if (10 < *pbVar4) bVar1 = 10;
  if (*pbVar4 != -1) {
    if (10 < *pbVar4 + iVar3) iVar3 = (10 - *pbVar4);
    iVar3 += *pbVar4;
    *pbVar4 = iVar3;
    if (iVar3< 0)
      CRASH("Wonky Skill Happening","../gameclasses/skills.cpp");
    bVar2 = *pbVar4;
    if (10 < *pbVar4) bVar2 = 10;
    AddToModdedSkill(base,modded,index,bVar2 - bVar1);
  }
}

void CharSkills::AddToBaseSkill(u8 arg1,u8 arg2){
  AddToSkill(this->SkillBase,this->SkillModded,arg1,arg2);
}

void CharSkills::AddToBaseWeapon(u8 arg1,u8 arg2){
  AddToSkill(this->WeaponBase,this->WeaponModded,arg1,arg2);
}

void CharSkills::AddToBaseShield(u8 param_2){
  AddToSkill(&this->ShieldBase,&this->ShieldModded,0,param_2);
}

extern void event_flag_skill_(s8);
void CharSkills::ModdedSkillAdd(u8 arg1,s8 arg2){
  s8 t = this->SkillModded[arg1];
  AddToModdedSkill(this->SkillBase,this->SkillModded,arg1,arg2);
  if (t != this->SkillModded[arg1]) event_flag_skill_(arg1);
}


void CharSkills::ModdedWeaponAdd(u8 param_2,s8 param_3){
  AddToModdedSkill(this->WeaponBase,this->WeaponModded,param_2,param_3);
}

s8 CapModdedSkillMax(s8 skill,s8 cap){
  if ((skill <= cap) && (cap = 0, -1 < skill)) cap = skill;
  return cap;
}

s8 CharSkills::capSkillBaseMax(u8 arg1){
  u8 b = this->SkillBase[arg1];
  if (SKILLMAXBASE < this->SkillBase[arg1]) b = SKILLMAXBASE;
  return b;
}

s8 CharSkills::capWeaponBaseMax(u8 arg1){
  u8 b = this->WeaponBase[arg1];
  if (SKILLMAXBASE < this->WeaponBase[arg1]) b = SKILLMAXBASE;
  return b;}

s8 CharSkills::capSheildBaseMax(){
  u8 b = this->ShieldBase;
  if (SKILLMAXBASE < this->ShieldBase) b = SKILLMAXBASE;
  return b;}

s8 CharSkills::getModdedSkill(u8 param_2){
  return CapModdedSkillMax(this->SkillModded[param_2],SKILLMAXMOD);}

s8 CharSkills::getModdedWeapon(u8 param_2){
  return CapModdedSkillMax(this->WeaponModded[param_2],SKILLMAXMOD);}

s8 CharSkills::getModdedSheild(){
  return CapModdedSkillMax(this->ShieldModded,SKILLMAXMOD);}

u8 CharSkills::isSkilOverLv10(u8 param_2){
  return SKILLMAXBASE <= this->SkillBase[param_2];}

u8 CharSkills::isWepSkillOverLv10(u8 param_2){
  return SKILLMAXBASE <= this->WeaponBase[param_2];}

u8 CharSkills::isSheildSkillOver10(){
  return SKILLMAXBASE <= this->ShieldBase;}