


void bottom_modded_skill(char *skills,u32 len){
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
  
  EntRam = EntityPointer->entities[GetIDIndex(id)];
  memcpy(arg0,EntRam->Skills,0xc);
  memcpy(arg0->Skill_modded,EntRam->Skills,0xc);
  memcpy(arg0->Weapon_Base,EntRam->weaponProf,0xb);
  memcpy(arg0->Weapon_modded,EntRam->weaponProf,0xb);
  bottom_modded_skill(arg0->Skill_modded,0xc);
  bottom_modded_skill(arg0->Weapon_modded,0xb);
  arg0->Sheild_Base = EntRam->sheildStat;
  X = EntRam->sheildStat;
  if (EntRam->sheildStat < 0) {X = 0;}
  arg0->Sheild_modded = X;
}

//3 save/ load  funcs here.


void CopyCharSkills(CharSkills *A,CharSkills *B){
  A->Sheild_Base = B->Sheild_Base;
  A->Sheild_modded = B->Sheild_modded;
  memcpy(A,B,0xc);
  memcpy(A->Skill_modded,B->Skill_modded,0xc);
  memcpy(A->Weapon_Base,B->Weapon_Base,0xb);
  memcpy(A->Weapon_modded,B->Weapon_modded,0xb);
}

s32 get_skill_xp_multi(CharSkills *skills,u8 arg1){
  s32 i = skills->Skill_base[arg1] + 1;
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
  u32 i = skills->Weapon_Base[arg1] + 1;
  u32 weapon_xp_multis[11]={0,0,0,400,600,400,0,0,600,400,0};
  //0 value = enemy weapon classes
  if (0xb < arg1) {
    #ifdef DEBUGVER
    CRASH("Weapon_XP_overflow","../gameclasses/skills.cpp");
    #else
    CRASH();
    #endif
  }
  return i * i * weapon_xp_multis[arg1];
}

s32 sheild_xp_check(CharSkills *arg0){
  s32 iVar1 =(char)arg0->Sheild_Base + 1;
  return iVar1 * iVar1 * 500;
}

s32 get_200_or_1plusx_28(u8 arg0){
  if (arg0 != 0) return (arg0 + 1) * 40;
  return 200;
}


u32 get_skill_gold_train_price(CharSkills *skills,u8 arg1){
  return get_200_or_1plusx_28(skills->Skill_base[arg1]);
}

u32 get_selected_weaponskill_price(CharSkills *skills,u8 arg1){
  return get_200_or_1plusx_28(skills->Weapon_base[arg1]);
}


void check_baseskill_minus1(char* skills,char *modded,u8 arg2,char mod){
  if (-1 < skills[arg2]) modded[arg2]+= mod;
  return;
}

void Wonky_skill_check(Char* *skills,char *arg1,u8 arg2,char arg3){
  u8 bVar1;
  u8 bVar2;
  s32 iVar3;
  s8 *pbVar4;
  
  iVar3 = (s32)arg3;
  pbVar4 = skills[arg2];
  bVar1 = *pbVar4;
  if (10 < *pbVar4) {bVar1 = 10;}
  if ((char)bVar1 != -1) {
    if (10 < *pbVar4 + iVar3) {iVar3 = (s32)((10 - (u32)*pbVar4) * 0x1000000) >> 0x18;}
    iVar3+= (u32)*pbVar4;
    *pbVar4 = (u8)iVar3;
    if (iVar3 * 0x1000000 < 0) 
      {CRASH("Wonky Skill Happening","../gameclasses/skills.cpp");}
    bVar2 = *pbVar4;
    if (10 < *pbVar4) {bVar2 = 10;}
    check_baseskill_minus1(skills,arg1,arg2,(char)((u32)((bVar2 - bVar1) * 0x1000000) >> 0x18));
  }
  return;
}

void wonky_baseskill_check(CharSkills *skills,u8 arg1,u8 arg2){
  Wonky_skill_check((char *)skills,(char *)skills->Skill_modded,arg1,arg2);
}

void wonky_weapon_check(CharSkills *skills,u8 arg1,u8 arg2){
  Wonky_skill_check((char *)skills->Weapon_Base,(char *)skills->Weapon_modded,arg1,arg2);
}

void wonky_sheild_check(CharSkills *param_1,u8 param_2){
  Wonky_skill_check((char *)&param_1->Sheild_Base,(char *)&param_1->Sheild_modded,0,param_2);
}


void some_moddedSkillCheck(CharSkills *arg0,u8 arg1,s8 arg2){
  u8 bVar1;
  u8 *pbVar2 = arg0->Skill_modded[arg1];
  bVar1 = *pbVar2;
  check_baseskill_minus1(arg0,(char *)arg0->Skill_modded,arg1,arg2);
  if (bVar1 != *pbVar2) {event_flag_skill_(arg1);}
}

void FUN_80083cc8(CharSkills *param_1,u8 param_2){
  check_baseskill_minus1((char *)&param_1->Sheild_Base,(char *)&param_1->Sheild_modded,0,param_2);
}

char CapModdedSkillMax(char skill,char cap){
  if ((skill <= cap) && (cap = 0, -1 < skill)) cap = skill;
  return cap;
}

u8 capskillBaseMax(CharSkills *skills,u8 arg1){
  u8 b = skills->Skill_base[arg1];
  if (10 < (char)skills->Skill_base[arg1]) b = 10;
  return b;
}

u8 capWeaponBaseMax(CharSkills *skills,u8 arg1){
  u8 b = skills->Weapon_base[arg1];
  if (10 < (char)skills->Weapon_base[arg1]) b = 10;
  return b;}

u8 capSheildBaseMax(CharSkills *skills){
  u8 b = skills->Sheild_Base;
  if (10 < (char)skills->Sheild_Base) b = 10;
  return b;}

char getModdedSkill(CharSkills *param_1,u8 param_2){
  return CapModdedSkillMax(param_1->Skill_modded[param_2],15);}

char getModdedWeapon(CharSkills *param_1,u8 param_2){
  return CapModdedSkillMax(param_1->Weapon_modded[param_2],15);}

char getModdedSheild(CharSkills *param_1){
  return CapModdedSkillMax(param_1->Sheild_modded,15);}

bool isSkilOverLv10(CharSkills *param_1,u8 param_2){
  return 10 < (char)param_1->Skill_base[param_2];}

bool isWepSkillOverLv10(CharSkills *param_1,u8 param_2){
  return 10 < (char)param_1->Weapon_base[param_2];}

bool isSheildSkillOver10(CharSkills *param_1){
  return 10 < (char)param_1->Sheild_Base;}