#include "globals.h"


void bottom_modded_skill(s8*skills,u32 len){
  u32 i=0;
  if (len != 0) {
    do {
      if (*skills < 0) {*skills = 0;}
      i++;
      skills++;
    } while (i < len);
  }
  return;
}

void init_char_skills(CharSkills *arg0,ItemID id){
  u8 X;
  Entity_Ram *EntRam;
  
  EntRam = &gEntityDB->entities[GetIDIndex(id)];
  COPY(arg0->SkillBase,EntRam->Skills);
  COPY(arg0->SkillModded,EntRam->Skills);
  COPY(arg0->WeaponBase,EntRam->WeaponSkills);
  COPY(arg0->WeaponModded,EntRam->WeaponSkills);
  bottom_modded_skill(arg0->SkillModded,0xc);
  bottom_modded_skill(arg0->WeaponModded,0xb);
  arg0->ShieldBase = EntRam->sheildStat;
  X = EntRam->sheildStat;
  if (EntRam->sheildStat < 0) X = 0;
  arg0->ShieldModded = X;
}

//3 save/ load  funcs here.


void CopyCharSkills(CharSkills *A,CharSkills *B){
  A->ShieldBase = B->ShieldBase;
  A->ShieldModded = B->ShieldModded;
  COPY(A->SkillBase,B);
  COPY(A->SkillModded,B->SkillModded);
  COPY(A->WeaponBase,B->WeaponBase);
  COPY(A->WeaponModded,B->WeaponModded);
}

s32 get_skill_xp_multi(CharSkills *skills,u8 arg1){
  s32 i = skills->SkillBase[arg1] + 1;
  s32 skill_xp_multis[12]={1500,500,1000,750,500,7500,750,500,1000,1000,1000,1500};
  if (0xb < arg1) {
    #ifdef DEBUGVER
    CRASH("Skill overwrite","../gameclasses/skills.cpp");
    #else
    CRASH();
    #endif
  }
  return i * i * skill_xp_multis[arg1];
}

u32 Weapon_XP_check(CharSkills *skills,u8 arg1){
  u32 i = skills->WeaponBase[arg1] + 1;
  u32 weapon_xp_multis[11]={0,0,0,400,600,400,0,0,600,400,0};
  //0 value = enemy weapon classes
  if (10 <= arg1)
    CRASH("Weapon_XP_overflow","../gameclasses/skills.cpp");
  return SQ(i) * weapon_xp_multis[arg1];
}

s32 CharSkills::GetShieldXpPrice(CharSkills *arg0){
  s32 iVar1 =arg0->ShieldBase + 1;
  return SQ(iVar1) * 500;
}

s32 GetSkillTrainGoldPrice(u8 arg0){
  if (arg0 != 0) return (arg0 + 1) * 40;
  return 200;
}

u32 CharSkills::GetGoldTrainPrice(CharSkills *skills,u8 arg1){
  return GetSkillTrainGoldPrice(skills->SkillBase[arg1]);
}

u32 CharSkills::GetWeaponGoldTrainPrice(CharSkills *skills,u8 arg1){
  return GetSkillTrainGoldPrice(skills->WeaponBase[arg1]);
}

u32 CharSkills::GetShieldGoldTrainPrice(CharSkills *param_1){
  return GetSkillTrainGoldPrice(param_1->ShieldBase);
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

void wonky_baseskill_check(CharSkills *skills,u8 arg1,u8 arg2){
  AddToSkill(skills->SkillBase,skills->SkillModded,arg1,arg2);
}

void wonky_weapon_check(CharSkills *skills,u8 arg1,u8 arg2){
  AddToSkill(skills->WeaponBase,skills->WeaponModded,arg1,arg2);
}

void wonky_sheild_check(CharSkills *param_1,u8 param_2){
  AddToSkill(&param_1->ShieldBase,&param_1->ShieldModded,0,param_2);
}


void CharSkills::ModdedSkillAdd(CharSkills *arg0,u8 arg1,s8 arg2){
  u8 bVar1;
  u8 *pbVar2 = arg0->SkillModded[arg1];
  bVar1 = *pbVar2;
  AddToModded(arg0,(char *)arg0->SkillModded,arg1,arg2);
  if (bVar1 != *pbVar2) {event_flag_skill_(arg1);}
}


void CharSkills::ModdedWeaponAdd(CharSkills *param_1,u8 param_2,s8 param_3){
  AddToModded(param_1->WeaponBase,param_1->WeaponModded,param_2,param_3);
}

s8 CharSkills::CapModdedSkillMax(char skill,char cap){
  if ((skill <= cap) && (cap = 0, -1 < skill)) cap = skill;
  return cap;
}

s8 CharSkills::capskillBaseMax(CharSkills *skills,u8 arg1){
  u8 b = skills->SkillBase[arg1];
  if (10 < skills->SkillBase[arg1]) b = 10;
  return b;
}

s8 CharSkills::capWeaponBaseMax(CharSkills *skills,u8 arg1){
  u8 b = skills->WeaponBase[arg1];
  if (10 < skills->WeaponBase[arg1]) b = 10;
  return b;}

s8 CharSkills::capSheildBaseMax(CharSkills *skills){
  u8 b = skills->ShieldBase;
  if (10 < skills->ShieldBase) b = 10;
  return b;}

s8 CharSkills::getModdedSkill(CharSkills *param_1,u8 param_2){
  return CapModdedSkillMax(param_1->SkillModded[param_2],15);}

s8 CharSkills::getModdedWeapon(CharSkills *param_1,u8 param_2){
  return CapModdedSkillMax(param_1->WeaponModded[param_2],15);}

s8 CharSkills::getModdedSheild(CharSkills *param_1){
  return CapModdedSkillMax(param_1->ShieldModded,15);}

u8 CharSkills::isSkilOverLv10(CharSkills *param_1,u8 param_2){
  return 10 <= param_1->SkillBase[param_2];}

u8 CharSkills::isWepSkillOverLv10(CharSkills *param_1,u8 param_2){
  return 10 <= param_1->WeaponBase[param_2];}

u8 CharSkills::isSheildSkillOver10(CharSkills *param_1){
  return 10 <= param_1->ShieldBase;}