


void bottom_modded_skill(char *skills,uint len){
  uint i=0;
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
  byte index;
  Entity_Ram *EntRam;
  
  index = GetIDIndex(id);
  EntRam = EntityPointer->entities[index];
  memcpy(arg0,EntRam->Skills,0xc);
  memcpy(arg0->Skill_modded,EntRam->Skills,0xc);
  memcpy(arg0->Weapon_Base,EntRam->Weapon prof,0xb);
  memcpy(arg0->Weapon_modded,EntRam->Weapon prof,0xb);
  bottom_modded_skill(arg0->Skill_modded,0xc);
  bottom_modded_skill(arg0->Weapon_modded,0xb);
  arg0->Sheild_Base = EntRam->sheildStat;
  index = EntRam->sheildStat;
  if (EntRam->sheildStat < 0) {index = 0;}
  arg0->Sheild_modded = index;
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

int get_skill_xp_multi(CharSkills *skills,CHAR_SKILL arg1){
  int i = skills->Skill_base[arg1] + 1;
  //uses some  macro that ghidra "tries its best" interpreting.
  //just rewiting that from scratch. or ignoring it.
  int skill_xp_multis[12]={1500,500,1000,750,500,7500,750,500,1000,1000,1000,1500};
  if (0xb < arg1) {
    #ifdef DEBUGVER
    assert("Skill overwrite","../gameclasses/skills.cpp");
    #else
    assert();
    #endif
  }
  return i * i * skill_xp_multis[arg1];
}

uint Weapon_XP_check(CharSkills *skills,WeaponClassEnum arg1){
  uint i = skills->Weapon_Base[arg1] + 1;
  uint weapon_xp_multis[11]={0,0,0,400,600,400,0,0,600,400,0};
  //0 value = enemy weapon classes
  if (0xb < arg1) {
    #ifdef DEBUGVER
    assert("Weapon_XP_overflow","../gameclasses/skills.cpp");
    #else
    assert();
    #endif
  }
  return i * i * weapon_xp_multis[arg1];
}

int sheild_xp_check(CharSkills *arg0){
  int iVar1 =(char)arg0->Sheild_Base + 1;
  return iVar1 * iVar1 * 500;
}

int get_200_or_1plusx_28(byte arg0){
  if (arg0 != 0) return (arg0 + 1) * 0x28;
  return 200;
}


uint get_skill_gold_train_price(CharSkills *skills,CHAR_SKILL arg1){
  return get_200_or_1plusx_28(skills->Skill_base[arg1]);
}

uint get_selected_weaponskill_price(CharSkills *skills,WeaponClassEnum arg1){
  return get_200_or_1plusx_28(skills->Weapon_base[arg1]);
}


void check_baseskill_minus1(char* skills,char *modded,CHAR_SKILL arg2,char mod){
  if (-1 < skills[arg2]) modded[arg2]+= mod;
  return;
}

void Wonky_skill_check(Char* *skills,char *arg1,CHAR_SKILL arg2,char arg3){
  byte bVar1;
  byte bVar2;
  int iVar3;
  byte *pbVar4;
  
  iVar3 = (int)arg3;
  pbVar4 = skills[arg2];
  bVar1 = *pbVar4;
  if (10 < (char)*pbVar4) {
    bVar1 = 10;
  }
  if ((char)bVar1 != -1) {
    if (10 < (char)*pbVar4 + iVar3) {
      iVar3 = (int)((10 - (uint)*pbVar4) * 0x1000000) >> 0x18;
    }
    iVar3 = iVar3 + (uint)*pbVar4;
    *pbVar4 = (byte)iVar3;
    if (iVar3 * 0x1000000 < 0) {
      assert("Wonky Skill Happening","../gameclasses/skills.cpp");
    }
    bVar2 = *pbVar4;
    if (10 < (char)*pbVar4) {
      bVar2 = 10;
    }
    check_baseskill_minus1
              (skills,arg1,arg2,
               (char)((uint)(((int)(char)bVar2 - (int)(char)bVar1) * 0x1000000) >> 0x18));
  }
  return;
}

void wonky_baseskill_check(CharSkills *skills,CHAR_SKILL arg1,undefined1 arg2){
  Wonky_skill_check((char *)skills,(char *)skills->Skill_modded,arg1,arg2);
}

void wonky_weapon_check(CharSkills *skills,WeaponClassEnum arg1,undefined1 arg2){
  Wonky_skill_check((char *)skills->Weapon_Base,(char *)skills->Weapon_modded,arg1,arg2);
}

void wonky_sheild_check(CharSkills *param_1,undefined1 param_2){
  Wonky_skill_check((char *)&param_1->Sheild_Base,(char *)&param_1->Sheild_modded,'\0',param_2);
}


void some_moddedSkillCheck(CharSkills *arg0,CHAR_SKILL arg1,s8 arg2){
  byte bVar1;
  byte *pbVar2 = arg0->Skill_modded[arg1];
  bVar1 = *pbVar2;
  check_baseskill_minus1(arg0,(char *)arg0->Skill_modded,arg1,arg2);
  if (bVar1 != *pbVar2) {event_flag_skill_(arg1);}
}

void func_80083cc8(CharSkills *param_1,undefined1 param_2){
  check_baseskill_minus1((char *)&param_1->Sheild_Base,(char *)&param_1->Sheild_modded,0,param_2);
}

char CapModdedSkillMax(char skill,char cap){
  if ((skill <= cap) && (cap = 0, -1 < skill)) cap = skill;
  return cap;
}

byte capskillBaseMax(CharSkills *skills,CHAR_SKILL arg1){
  byte b = skills->Skill_base[arg1];
  if (10 < (char)skills->Skill_base[arg1]) b = 10;
  return b;
}

byte capWeaponBaseMax(CharSkills *skills,WeaponClassEnum arg1){
  byte b = skills->Weapon_base[arg1];
  if (10 < (char)skills->Weapon_base[arg1]) b = 10;
  return b;}

byte capSheildBaseMax(CharSkills *skills){
  byte b = skills->Sheild_Base;
  if (10 < (char)skills->Sheild_Base) b = 10;
  return b;}

char getModdedSkill(CharSkills *param_1,CHAR_SKILL param_2){
  return CapModdedSkillMax(param_1->Skill_modded[param_2],15);}

char getModdedWeapon(CharSkills *param_1,WeaponClassEnum param_2){
  return CapModdedSkillMax(param_1->Weapon_modded[param_2],15);}

char getModdedSheild(CharSkills *param_1){
  return CapModdedSkillMax(param_1->Sheild_modded,15);}

bool isSkilOverLv10(CharSkills *param_1,CHAR_SKILL param_2){
  return 10 < (char)param_1->Skill_base[param_2];}

bool isWepSkillOverLv10(CharSkills *param_1,WeaponClassEnum param_2){
  return 10 < (char)param_1->Weapon_base[param_2];}

bool isSheildSkillOver10(CharSkills *param_1){
  return 10 < (char)param_1->Sheild_Base;}