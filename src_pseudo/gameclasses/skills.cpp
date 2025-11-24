#include "globals.h"
char** skill_strings=NULL;
char** weapon_strings=NULL;

#ifdef DEBUGVER
char* sSkillsFilename="../gameclasses/skills.cpp";
#endif
//all skills in an array should be at or above 0.
void FloorSkill(s8*skills,u32 len){
  if (len) {
    for(u32 i=0;i<len;i++) {
      FLOOR(skills[i],0);
    }
  }
}

void CharSkills::Init(ItemID id){
  u8 X;
  EntityRAM *EntRam;
  
  EntRam = &gEntityDB->entities[GETINDEX(id)];
  COPY(this->SkillBase,EntRam->Skills);
  COPY(this->SkillModded,EntRam->Skills);
  COPY(this->WeaponBase,EntRam->weaponProf);
  COPY(this->WeaponModded,EntRam->weaponProf);
  FloorSkill(this->SkillModded,sizeof(SkillModded));
  FloorSkill(this->WeaponModded,sizeof(WeaponModded));
  this->ShieldBase = EntRam->sheildStat;
  X = EntRam->sheildStat;
  if (EntRam->sheildStat < 0) X = 0;
  this->ShieldModded = X;
}
//save all skill levels for party member (except enemy weapon proficencies.)
void CharSkills::Save(SaveFile *save){
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Alchemist],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Diplomat],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Healer],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Loremaster],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Mechanic],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Merchant],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Ranger],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Stealth],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Theif],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Troubador],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Warrior],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->SkillBase[SKILL_Wizard],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->WeaponBase[WEAPON_Hafted],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->WeaponBase[WEAPON_Missle],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->WeaponBase[WEAPON_Pole],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->WeaponBase[WEAPON_Sword],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->WeaponBase[WEAPON_Thrown],SaveBits_SkillLV);
  SaveParty::SaveBits(save,(int)this->ShieldBase,SaveBits_SkillLV);
}

//load a skill from a save file
u8 CharSkills::LoadOne(SaveFile *param_2,s8 skill){
  u8 auStack_48[] = {(u8)SaveParty::LoadBits(param_2,SaveBits_SkillLV),0xFF};
  return auStack_48[-((int)skill >> 0x1f)];
}

//load all skill levels for party member (except enemy weapon proficencies.)
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

  FloorSkill(this->SkillModded,sizeof(SkillModded));
  FloorSkill(this->WeaponModded,sizeof(WeaponModded));
  FLOOR(this->ShieldModded,0);
}

//copy skill levels between characters
void CharSkills::Copy(CharSkills *B){
  this->ShieldBase = B->ShieldBase;
  this->ShieldModded = B->ShieldModded;
  COPY(this->SkillBase,B);
  COPY(this->SkillModded,B->SkillModded);
  COPY(this->WeaponBase,B->WeaponBase);
  COPY(this->WeaponModded,B->WeaponModded);
}

//get Exp price for improving skill
u32 CharSkills::GetSkillXpMod(u8 arg1){
  s32 i = this->SkillBase[arg1] + 1;
  s32 skill_xp_multis[]={1500,500,1000,750,500,7500,750,500,1000,1000,1000,1500};
  #ifdef DEBUGVER
  if (SKILL_Total < arg1) CRASH("Skill overwrite",sSkillsFilename);
  #endif
  return SQ(i) * skill_xp_multis[arg1];
}
//get Exp price for improving weapon skill
u32 CharSkills::GetWeaponXpMod(u8 arg1){
  u32 i = this->WeaponBase[arg1] + 1;
  //0 value = enemy weapon classes
  u32 weapon_xp_multis[]={0,0,0,400,600,400,0,0,600,400,0};
#ifdef DEBUGVER
  if (WEAPON_Total < arg1) CRASH("Weapon_XP_overflow",sSkillsFilename);
#endif
  return SQ(i) * weapon_xp_multis[arg1];
}
//get Exp price for improving shield skill
u32 CharSkills::GetShieldXpPrice(){
  s32 iVar1 =this->ShieldBase + 1;
  return SQ(iVar1) * 500;
}
//get Gold price for improving skill
s32 GetSkillTrainGoldPrice(u8 x){
  if (x != 0) return (x + 1) * 40;
  return 200;
}
//get Gold price for improving skill
u32 CharSkills::GetGoldTrainPrice(u8 arg1){
  return GetSkillTrainGoldPrice(this->SkillBase[arg1]);
}
//get Gold price for improving weapon skill
u32 CharSkills::GetWeaponGoldTrainPrice(u8 arg1){
  return GetSkillTrainGoldPrice(this->WeaponBase[arg1]);
}
//get Gold price for improving shield skill
u32 CharSkills::GetShieldGoldTrainPrice(){
  return GetSkillTrainGoldPrice(this->ShieldBase);
}
//modify a skill level(modded[arg2]) by(mod) if applicable(skills[arg2]>-1)
void AddToModdedSkill(s8* skills,s8 *modded,u8 arg2,s8 mod){
  if (-1 < skills[arg2]) modded[arg2]+= mod;
}
//modify a skill level(modded[arg2]) by(mod) if applicable(skills[arg2]>-1,modded[arg2]=mod<=10)
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
    #ifdef DEBUGVER
    if (iVar3< 0) CRASH("Wonky Skill Happening",sSkillsFilename);
    #endif
    bVar2 = *pbVar4;
    if (10 < *pbVar4) bVar2 = 10;
    AddToModdedSkill(base,modded,index,bVar2 - bVar1);
  }
}
//mod Base Skill level(arg1) by (mod)
void CharSkills::AddToBaseSkill(u8 arg1,u8 mod){
  AddToSkill(this->SkillBase,this->SkillModded,arg1,mod);
}
//mod Base weapon Skill level(arg1) by (mod)
void CharSkills::AddToBaseWeapon(u8 arg1,u8 mod){
  AddToSkill(this->WeaponBase,this->WeaponModded,arg1,mod);
}
//mod Base shield Skill level by (mod)
void CharSkills::AddToBaseShield(u8 mod){
  AddToSkill(&this->ShieldBase,&this->ShieldModded,0,mod);
}

extern void event_flag_skill_(s8);
void CharSkills::ModdedSkillAdd(u8 sk,s8 mod){
  s8 t = this->SkillModded[sk];
  AddToModdedSkill(this->SkillBase,this->SkillModded,sk,mod);
  if (t != this->SkillModded[sk]) event_flag_skill_(sk);
}

void CharSkills::ModdedWeaponAdd(u8 sk,s8 mod){
  AddToModdedSkill(this->WeaponBase,this->WeaponModded,sk,mod);
}
void CharSkills::ModdedShieldAdd(s8 mod){
  AddToModdedSkill(&this->ShieldBase,&this->ShieldModded,0,mod);
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
//get skill level +/- buffs/debuffs from spells/equip
s8 CharSkills::getModdedSkill(u8 param_2){
  return CapModdedSkillMax(this->SkillModded[param_2],SKILLMAXMOD);}
//get weapon skill level +/- buffs/debuffs from spells/equip
s8 CharSkills::getModdedWeapon(u8 param_2){
  return CapModdedSkillMax(this->WeaponModded[param_2],SKILLMAXMOD);}
//get shield skill level +/- buffs/debuffs from spells/equip
s8 CharSkills::getModdedSheild(){
  return CapModdedSkillMax(this->ShieldModded,SKILLMAXMOD);}
//is skill capped?
u8 CharSkills::isSkillCapped(u8 param_2){
  return SKILLMAXBASE <= this->SkillBase[param_2];}
//is weapon skill capped?
u8 CharSkills::isWeaponCapped(u8 param_2){
  return SKILLMAXBASE <= this->WeaponBase[param_2];}
//is shield skill capped?
u8 CharSkills::isShieldCapped(){
  return SKILLMAXBASE <= this->ShieldBase;}