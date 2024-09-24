#ifdef DEBUGVER
#define FILENAME "../gameclasses/entity.cpp"
#else
#define FILENAME ""
#endif


bool IsElemental(ItemID param_1){
  u8 lVar1;
  bool ret;
  
  if (param_1 >> 8 == 2) {
    Ivar1 = GetIDIndex(param_1);
    //Air, Earth, Fire Water Elementals
    if ((((lVar1 == 0xc2) || (lVar1 == 0xc4)) || (lVar1 == 0xc5)) || (lVar1 == 199)) {ret = true;}
    else {ret = lVar1 == 0xbf;} //firelord
  }
  else {ret = false;}
  return ret;}


ulong init_more_charSheet_data(CharSheet *param_1,Entity_Ram *param_2){
  u32 uVar1;
  inv_funcs *piVar2;
  Borg8Enum BVar3;
  Borg8header *pBVar4;
  Potion_effect **x;
  s32 iVar5;
  ulong uVar6;
  ItemID IVar7;
  
  param_1->portrait = get_borg_8(getEntityPortait(param_1->ID));
  x = (Potion_effect **)heapAlloc(0x1c,FILENAME,0xc1);
  param_1->potionEffects = x;
  memset(x,0,0x1c);
  iVar5 = CharStats::getBaseStat(param_1->Stats,STAT_LV);
  uVar1 = EXP_TNL[iVar5];
  param_1->weapons = NULL;
  param_1->EXP->total = uVar1;
  if (param_2->weapon[0] != (ItemID)0xffff) {EquipWeapon(param_1,param_2->weapon[0],0);}
  if (param_2->weapon[1] != (ItemID)0xffff) {
    if (param_1->weapons == NULL) {EquipWeapon(param_1,param_2->weapon[1],0);}
    else {
      piVar2 = gGlobals.party->inv->Functions;
      (*(piVar2->add_to_inv).func)((s32)gGlobals.party->inv->inv_slots + (s16)(piVar2->add_to_inv).arg[0] + -4,(ulonglong)(u16)param_2->weapon[1],1);
    }
  }
  IVar7 = param_2->weapon[2];
  uVar6 = 0xffffffff;
  if (IVar7 != (ItemID)0xffff) {
    if (param_1->weapons == NULL) {uVar6 = EquipWeapon(param_1,param_2->weapon[2],0);}
    else {
      piVar2 = gGlobals.party->inv->Functions;
      uVar6 = (*(piVar2->add_to_inv).func)((s32)gGlobals.party->inv->inv_slots +(s16)(piVar2->add_to_inv).arg[0] + -4,(ulonglong)(u16)param_2->weapon[2],1);
    }
  }
  return uVar6;
}



void equip_weapons(CharSheet *param_1,Entity_Ram *param_2){
  Potion_effect **x;
  
  x = (Potion_effect **)heapAlloc(0x1c,FILENAME,0xd8);
  param_1->potionEffects = x;
  memset(x,0,0x1c);
  param_1->weapons = NULL;
  if (param_2->weapon[2] != (ItemID)0xffff) {EquipWeapon(param_1,param_2->weapon[2],0);}
  if ((param_2->weapon[0] != (ItemID)0xffff) && (param_1->weapons == NULL)) {
    EquipWeapon(param_1,param_2->weapon[0],0);
  }
}


void equip_3_weapons(CharSheet *param_1,Entity_Ram *param_2){
  ItemID IVar1;
  
  param_1->weapons = NULL;
  if (param_2->weapon[0] != (ItemID)-1){EquipWeapon(param_1,param_2->weapon[0],0);}
  if (param_2->weapon[1] != (ItemID)-1){
    if (param_1->weapons == NULL) {EquipWeapon(param_1,param_2->weapon[1],0);}
  }
  if ((param_2->weapon[2] != (ItemID)-1) && (param_1->weapons == NULL)) {
    EquipWeapon(param_1,param_2->weapon[2],0);
  }
  return;
}


void create_CharSheet(CharSheet *param_1,ItemID param_2,u32 param_3){
  s16 sVar1;
  u8 bVar8;
  CharStats *stats;
  charExp *pcVar2;
  CharSkills *arg0;
  temp_armor **pptVar3;
  CharGear *pCVar4;
  spellbook *psVar5;
  s32 iVar6;
  Temp_spell *pTVar7;
  SpellEffect*x;
  s16 *psVar9;
  u32 uVar10;
  Entity_Ram *pEVar11;
  func *apcStack112 [4];
  
  memset(param_1,0,0x48);
  bVar8 = GetIDIndex(param_2);
  pEVar11 = EntityPointer->entities;
  param_1->ID = param_2;
  pEVar11 += bVar8;
  strlen(pEVar11->Name);
  param_1->name = pEVar11->Name;
  stats = (CharStats *)heapAlloc(0x1c,FILENAME,0x101);
  param_1->Stats = stats;
  CharStats:Init(stats,param_1->ID);
  pcVar2 = (charExp *)heapAlloc(0x10,FILENAME,0x104);
  param_1->EXP = pcVar2;
  init_charExp(pcVar2,param_1->ID);
  arg0 = (CharSkills *)heapAlloc(0x30,FILENAME,0x107);
  param_1->Skills = arg0;
  init_char_skills(arg0,param_1->ID);
  pptVar3 = (temp_armor **)heapAlloc(8,FILENAME,0x10a);
  param_1->armor = pptVar3;
  *pptVar3 = NULL;
  pptVar3[1] = NULL;
  if (pEVar11->armor != -1) Equip_Armor(param_1,pEVar11->armor,0);
  if (pEVar11->Sheild != -1) EquipSheild(param_1,pEVar11->Sheild,0);
  pCVar4 = (CharGear *)heapAlloc(8,FILENAME,0x111);
  param_1->pItemList = pCVar4;
  CharGear_Init(pCVar4,0xc);
  psVar5 = (spellbook *)heapAlloc(8,FILENAME,0x114);
  param_1->spellbook = psVar5;
  malloc_spell(psVar5,5);
  uVar10 = 0;
  iVar6 = 0;
  do {
    psVar9 = (s16 *)(&pEVar11->spells[0].type + iVar6);
    if (*psVar9 != -1) {
      pTVar7 = (Temp_spell *)heapAlloc(0x24,FILENAME,0x11a);
      sVar1 = *psVar9;
      *(Temp_spell **)(&param_1->spellbook->spells->id + uVar10 * 2) = pTVar7;
      create_temp_spell(pTVar7,sVar1,pEVar11->Spell_levels[uVar10]);
      param_1->spellbook->spell_count++;
    }
    uVar10++;
    iVar6 = uVar10 << 1;
  } while (uVar10 < 5);
  x = (SpellEffect*)heapAlloc(0x3c,FILENAME,0x11f);
  param_1->spellEffects = x;
  memset(x,0,0x3c);
  apcStack112[0] = PTR_init_more_charSheet_data_800e030c;
  apcStack112[1] = PTR_equip_weapons_800e0310;
  apcStack112[2] = blank_func;
  apcStack112[3] = PTR_equip_3_weapons_800e0318;
  (*apcStack112[param_3])(param_1,pEVar11);
  param_1->spellSwitch = 0;
  param_1->spellVal = 0xff;
}

void CharSheet_free(CharSheet *param_1){
  
  if (param_1->EXP) {
    HeapFree(param_1->EXP,FILENAME,0x142);
    param_1->EXP = NULL;
  }
  if (param_1->armor){
    if (param_1->armor[0]) {
      pssto_clear_weapon_effects(param_1->armor[0]);
      HeapFree(param_1->armor[0],FILENAME,0x14b);
      param_1->armor[0] = NULL;}
    if (param_1->armor[1]) {
      pssto_clear_weapon_effects(param_1->armor[1]);
      HeapFree(param_1->armor[1],FILENAME,0x152);
      param_1->armor[1] = NULL;
    }
    HeapFree(param_1->armor,FILENAME,0x156);
    param_1->armor = NULL;

  }
  if (param_1->weapons){
    passto_clear_weapon_effects(pTVar5);
    HeapFree(param_1->weapons,FILENAME,0x15d);
    param_1->weapons = NULL;
  }
  if (param_1->pItemList) {
    func_8007d7dc(param_1->pItemList);
    HeapFree(param_1->pItemList,FILENAME,0x15d);
    param_1->pItemList = NULL;
  }
  if (param_1->spellbook) {
    spellbok_free(param_1->spellbook);
    HeapFree(param_1->spellbook,FILENAME,0x164);
    param_1->spellbook = NULL;
  }
  if (peVar2){
    remove_effects(param_1);
    HeapFree(param_1->spellEffects,FILENAME,0x16b);
    param_1->spellEffects = NULL;
    
  }
  if (param_1->potionEffects) {
    clear_charsheet_potions(param_1);
    HeapFree(param_1->potionEffects,FILENAME,0x173);
    param_1->potionEffects = NULL;}
  if (param_1->portrait) {
    AllocFreeQueueItem(&queueStructA,&param_1->portrait,4,0);
    param_1->portrait = (Borg8header *)0x0;
  }
  if (param_1->Stats) {
    HeapFree(param_1->Stats,FILENAME,0x188);
    param_1->Stats = NULL;
  }
  if (param_1->Skills) {
    HeapFree(param_1->Skills,FILENAME,0x18e);
    param_1->Skills = NULL;
  }
}

char getHPMax(CharSheet *param_1){
  char ret;
  
  if (param_1->Stats == NULL) {ret = 0;}
  else {
    ret = CharStats::getBaseStat(param_1->Stats,STAT_END) + CharStats::getBaseStat(param_1->Stats,STAT_STAM)  + CharStats::getBaseStat(param_1->Stats,STAT_LV);}
  return ret;}

u32 getHPCurrent(CharSheet *param_1){
  u32 max;
  u32 ret = 0;
  if (param_1->Stats) {
    ret = CharStats::getModdedStat(param_1->Stats,STAT_END) + CharStats::getModdedStat(param_1->Stats,STAT_STAM) + CharStats::getModdedStat(param_1->Stats,STAT_LV);
    max = getHPMax(param_1);
    if (max < ret) {ret = max;}
  }
  return ret;
}

float getHPPercent(CharSheet *param_1){
  float ret=1.0f;
  if ((float)getHPCurrent(param_1) / (float)getHPMax(param_1) < 1.0f) {
    ret = (float)getHPCurrent(param_1) / (float)getHPMax(param_1);}
  return ret;}

bool isDead(CharSheet *param_1){
  if (param_1->Stats == NULL) {return false;}
  else {return getHPCurrent(param_1) == 0;}

void damage_func(CharSheet *param_1,s16 dmg){
  s32 iVar1;
  char cVar2;
  u8 arg1;
  if (CharStats::getModdedStat(param_1->Stats,STAT_STAM) < dmg) {
    dmg -=CharStats::getModdedStat(stat,STAT_STAM);
    cVar2 = CharStats::getModdedStat(param_1->Stats,STAT_STAM);
    CharStats::addModdedStat(param_1->Stats,STAT_STAM,-cVar2);
    if (dmg < 1) {
      return;
    }
    iVar1 = ;
    if (CharStats::getModdedStat(param_1->Stats,STAT_END) < dmg) {
      CharStats::addModdedStat(param_1->Stats,STAT_END,-CharStats::getModdedStat(param_1->Stats,STAT_END));
      return;
    }
    arg1 = STAT_END;
  }
  else arg1 = STAT_STAM;
  CharStats::addModdedStat(param_1->Stats,arg1,-dmg);}

bool hasCheatDeath(CharSheet *param_1){
  SpellEffect*peVar1;
  u32 uVar2;
  
  uVar2 = 0;
  peVar1 = param_1->spellEffects;
  while( true ) {
    uVar2++;
    if ((peVar1->list[0]) && (peVar1->list[0]->index == cheatDeath)) break;
    peVar1 = (SpellEffect*)(peVar1->list + 1);
    if (0xe < uVar2) {
      return false;
    }
  }
  return true;
}

void func_checking_cheat_death(CharSheet *param_1,s16 param_2,CombatEntity *param_3){
  Temp_enchant *pTVar1;
  s32 lVar2;
  bool bVar5;
  CharStats *pCVar6;
  SpellEffect*peVar7;
  u32 uVar8;
  
  if (param_3) {
    if (CombatEnt_flag_2(param_3)) func_8006f2cc(param_3);
  }
  if (CharStats::getModdedStat(param_1->Stats,STAT_LV) < param_2) {
    CharStats::addModdedStat(param_1->Stats,STAT_LV,-CharStats::getModdedStat(param_1->Stats,STAT_LV));
    damage_func(param_1,param_2 - CharStats::getModdedStat(param_1->Stats,STAT_LV));
    uVar8 = 0;
    if (isDead(param_1)) {
      peVar7 = param_1->spellEffects;
      do {
        pTVar1 = peVar7->list[0];
        if ((pTVar1) && (pTVar1->index == cheatDeath)) {
          addHP(param_1,(s16)((s32)(char)pTVar1->unk0x3 << 1));
          clear_player_effect(param_1,uVar8,param_3);
          return;
        }
        uVar8 = uVar8 + 1;
        peVar7 = (SpellEffect*)(peVar7->list + 1);
      } while (uVar8 < 0xf);
      if (param_3) {clear_combatEnt_effects(param_3);}
      clear_charsheet_potions(param_1);
      if (!isDead(param_1)) {DoubleTap(param_1);}
    }
  }
  else {
    CharStats::addModdedStat(param_1->Stats,STAT_LV,-(char)param_2);
  }
  return;
}


void addHP(CharSheet *param_1,s16 param_2){
  u32 uVar3;
  u32 uVar4;
  
  uVar3 = (s32)param_2 & 0xffff;
  uVar4 = uVar3;
  if (CharStats::getModdedStat(param_1->Stats,STAT_END) < CharStats::getBaseStat(param_1->Stats,STAT_END)) {
    uVar4 = CharStats::getBaseStat(param_1->Stats,STAT_END) - CharStats::getModdedStat(param_1->Stats,STAT_END) & 0xff;
    if (uVar3 < uVar4) {
      uVar4 = 0;
      CharStats::addModdedStat(param_1->Stats,STAT_END,(char)uVar3);
    }
    else {
      CharStats::addModdedStat(param_1->Stats,STAT_END,(char)uVar4);
      uVar4 = uVar3 - uVar4;
    }
  }
  if (uVar4 != 0) {
    uVar3 = uVar4;
    if (CharStats::getModdedStat(param_1->Stats,STAT_STAM) < CharStats::getBaseStat(param_1->Stats,STAT_STAM)) {
      uVar3 = CharStats::getBaseStat(param_1->Stats,STAT_STAM) - CharStats::getModdedStat(param_1->Stats,STAT_STAM);
      if (uVar4 < uVar3) {
        uVar3 = 0;
        CharStats::addModdedStat(param_1->Stats,STAT_STAM,(char)uVar4);
      }
      else {
        CharStats::addModdedStat(param_1->Stats,STAT_STAM,(char)uVar3);
        uVar3 = uVar4 - uVar3;
      }
    }
    if (uVar3 != 0) {
      if (CharStats::getModdedStat(param_1->Stats,STAT_LV) < CharStats::getBaseStat(param_1->Stats,STAT_LV)) {
        uVar4 = CharStats::getBaseStat(param_1->Stats,STAT_LV) - CharStats::getModdedStat(param_1->Stats,STAT_LV);
        if (uVar3 < uVar4) {CharStats::addModdedStat(param_1->Stats,STAT_LV,(char)uVar3);}
        else {CharStats::addModdedStat(param_1->Stats,STAT_LV,(char)uVar4);}
      }
    }
  }
  return;
}

void calc_stamina_change(CharSheet *param_1,bool param_2){
  s32 iVar2;
  
  if (param_2 == false) {
    iVar2 = CharStats::getBaseStat(param_1->Stats,STAT_STAM); - CharStats::getModdedStat(param_1->Stats,STAT_STAM);
  }
  else {iVar2 = (s32)((float)CharStats::getBaseStat(param_1->Stats,STAT_STAM) * 0.8f) - CharStats::getModdedStat(param_1->Stats,STAT_STAM);}
  if (0 < iVar2 * 0x1000000 >> 0x18) {
    CharStats::addModdedStat(param_1->Stats,STAT_STAM,(char)((u32)(iVar2 * 0x1000000) >> 0x18));
  }
  return;
}

u8 ret0(void){return 0;}

bool NoSheildSkill(CharSheet *param_1){return getModdedSheild(param_1->Skills) == 0;}

u8 canEquipWeapon(CharSheet *param_1,ItemID param_2){
  u8 bVar2;
  s32 iVar1;
  char cVar3;
  weapon_ram *pcVar4;
  

  pcVar4 = weapon_pointer->weapons[GetIDIndex(param_2)];
  iVar1 = CharStats::getBaseStat(param_1->Stats,STAT_STR);
  bVar2 = 3;
  if (pcVar4->ReqSTR <= iVar1) {
    cVar3 = getModdedWeapon(param_1->Skills,pcVar4->Class);
    if (cVar3 == 0) {bVar2 = 1;}
    else {
      if (param_1->ID == (ItemID)(entityList[162] + 0x200)) { //Niesen
        bVar2 = 1;
        if (param_2 == (ItemID)(weaponList[66] + 0x700)) //archmage stafff
        {bVar2 = 0;}
      }
      else {bVar2 = 0;}
    }
  }
  return bVar2;
}


s32 something_with_gear_INT(CharSheet *param_1,ItemID param_2){
  Gear_RAM *pGVar1;
  s32 iVar3 = 1;
  if (func_8007d938(param_1->pItemList)) {
    iVar3 = search_item_array(param_2);
    pGVar1 = item_pointer->Gear;
    if (CharStats::getBaseStat(param_1->Stats,STAT_STR) < (s32)(u32)pGVar1[iVar3].STAT_STR) {iVar3 = 3;}
    else {
      iVar3 = (u32)(CharStats::getBaseStat(param_1->Stats,STAT_INT) < (s32)(u32)pGVar1[iVar3].s32) << 1;
    }
  }
  return iVar3;
}


void Equip_Armor(CharSheet *param_1,u16 param_2,u8 (*param_3) [2]){
  equip_armor_sheild(param_1,param_2,param_3,false);}

bool EquipSheild(CharSheet *param_1,u16 param_2,u8 (*param_3) [2]){
  bool uVar1 = NoSheildSkill(param_1);
  if (uVar1 == false) {
    equip_armor_sheild(param_1,param_2,param_3,true);
    uVar1 = false;}
  return uVar1;
}

u8 EquipWeapon(CharSheet *param_1,u16 param_2,u8 (*param_3) [2]){
  u8 bVar2;
  Temp_weapon *pTVar1;
  
  bVar2 = canEquipWeapon(param_1,param_2);
  if (bVar2 == 0) {
    pTVar1 = (Temp_weapon *)heapAlloc(0x2c,FILENAME,0x377);
    param_1->weapons = pTVar1;
    createTempWeapon(pTVar1,param_2);
    func_800784c8(param_1,param_1->weapons,param_3,0);
    bVar2 = 0;
  }
  return bVar2;
}

bool func_8007840c(CharSheet *param_1,u16 param_2,u8 (*param_3) [2]){
  CharGear *pCVar1;
  Temp_gear *pTVar2;
  bool lVar3;
  s32 iVar4;
  
  lVar3 = something_with_gear_INT(param_1,param_2);
  if (lVar3 == 0) {
    malloc_temp_gear(param_1->pItemList,param_2);
    pCVar1 = param_1->pItemList;
    iVar4 = func_8007daa8(pCVar1,param_2);
    pTVar2 = pCVar1->pItem[iVar4];
    func_800784c8(param_1,pTVar2,param_3,1);
    param_1->EXP->protection+= pTVar2->Protection;
    lVar3 = 0;
    param_1->EXP->damage+= pTVar2->Damage;
  }
  return lVar3;
}

void func_800784c8(CharSheet *param_1,Temp_weapon *param_2,u8 (*param_3) [2],s32 param_4){
  u8 (*pabVar1) [2];
  longlong lVar2;
  undefined uVar3;
  
  pabVar1 = param_2->SkillMod;
  if ((pabVar1) &&
     (lVar2 = capskillBaseMax(param_1->Skills,(*pabVar1)[0]), lVar2 != 0)) {
    some_moddedSkillCheck(param_1->Skills,(*pabVar1)[0],(*pabVar1)[1]);
  }
  if (param_3 == NULL) {param_3 = param_2->Stat;}
  else {
    if (param_2->Stat) {
      HeapFree(param_2->Stat,FILENAME);
    }
    param_2->Stat = param_3;
  }
  if (param_3) {
    if ((*param_3)[0] == 5) {
      param_1->spellSwitch = 0;
      goto LAB_8007859c;
    }
    uVar3 = func_8007b6bc(param_1,(*param_3)[0],(*param_3)[1]);
    if ((*param_3)[0] != STAT_END) {
      addtoModdedStats(param_1->Stats,(*param_3)[0],uVar3);
      param_1->spellSwitch = 0;
      goto LAB_8007859c;
    }
    addModdedStats_flag(param_1->Stats,STAT_END,uVar3);
  }
  param_1->spellSwitch = 0;
LAB_8007859c:
  if (param_4 != 0) {func_8007ad40(param_1,param_2);}
  return;
}

void equip_armor_sheild(CharSheet *param_1,u16 param_2,u8 (*param_3) [2],bool sheild){
  temp_armor *ptVar1;
  
  ptVar1 = (temp_armor *)heapAlloc(0x28,FILENAME,0x3df);
  param_1->armor[sheild] = ptVar1;
  make_temp_armor_3(ptVar1,param_2);
  func_800784c8(param_1,(Temp_weapon *)param_1->armor[sheild],param_3,1);
  addtoModdedStats(param_1->Stats,STAT_DEX,param_1->armor[sheild]->dex);
  some_moddedSkillCheck(param_1->Skills,Stealth,param_1->armor[sheild]->stealth);
}

void remove_chestArmor(CharSheet *param_1){remove_armor(param_1,0);}
void remove_sheild(CharSheet *param_1){remove_armor(param_1,1);}

void remove_armor(CharSheet *param_1,u8 param_2){
  if ((Temp_weapon *)param_1->armor[param_2]) {
    func_80078874(param_1,(Temp_weapon *)param_1->armor[param_2],true);
    subtractFromModdedStats(param_1->Stats,STAT_DEX,param_1->armor[param_2]->dex);
    some_moddedSkillCheck(param_1->Skills,Stealth,-param_1->armor[param_2]->stealth);
    pssto_clear_weapon_effects(param_1->armor[param_2]);
    HeapFree(param_1->armor[param_2],FILENAME);
    param_1->armor[param_2] = NULL;
  }
}

void unequp_weapons(CharSheet *param_1){
  if (param_1->weapons) {
    func_80078874(param_1,param_1->weapons,false);
    passto_clear_weapon_effects(param_1->weapons);
    HeapFree(param_1->weapons,FILENAME);
    param_1->weapons = NULL;
  }
}

void unequip_acc(CharSheet *param_1,u8 param_2){
  temp_gear *pTVar1;
  
  pTVar1 = param_1->pItemList->pItem[param_2];
  if (pTVar1) {
    func_80078874(param_1,(Temp_weapon *)pTVar1,true);
    param_1->EXP->protection-= pTVar1->Protection;
    param_1->EXP->damage-= pTVar1->damage;
    func_8007da24(param_1->pItemList,param_2);
  }
}

void func_80078874(CharSheet *param_1,Temp_weapon *param_2,bool param_3){
  Temp_enchant *pTVar1;
  longlong lVar2;
  undefined uVar3;
  u32 uVar4;
  SpellEffect*peVar5;
  u8 (*skilmod) [2];
  
  skilmod = param_2->SkillMod;
  if (skilmod == NULL) {
LAB_800788d0:
    skilmod = param_2->Stat;
  }
  else {
    lVar2 = capskillBaseMax(param_1->Skills,(*skilmod)[0]);
    if (lVar2 != 0) {
      some_moddedSkillCheck(param_1->Skills,(*skilmod)[0],-(*skilmod)[1]);
      goto LAB_800788d0;
    }
    skilmod = param_2->Stat;
  }
  if (skilmod) {
    if ((*skilmod)[0] == STAT_STAM) {
      param_1->spellSwitch = 0;
      goto LAB_8007893c;
    }
    uVar3 = func_8007b760(param_1,(*skilmod)[0],(*skilmod)[1]);
    if ((*skilmod)[0] != STAT_END) {
      subtractFromModdedStats(param_1->Stats,(*skilmod)[0],uVar3);
      param_1->spellSwitch = 0;
      goto LAB_8007893c;
    }
    SubtractModdedStats(param_1->Stats,STAT_END,uVar3);
  }
  param_1->spellSwitch = 0;
LAB_8007893c:
  if ((param_3) && (param_2->enchantment)) {
    uVar4 = 0;
    peVar5 = param_1->spellEffects;
    do {
      pTVar1 = peVar5->list[0];
      if (((pTVar1) && (pTVar1->index == param_2->enchantment->index)) &&
         (pTVar1->timer == -1)) {
        clear_player_effect(param_1,uVar4,NULL);
        return;
      }
      uVar4 = uVar4 + 1;
      peVar5 = (SpellEffect*)(peVar5->list + 1);
    } while (uVar4 < 0xf);
  }
  return;
}

void remove_all_equip(CharSheet *param_1){
  u32 i;
  
  unequp_weapons(param_1);
  remove_sheild(param_1);
  remove_chestArmor(param_1);
  
  if (param_1->pItemList->num_used != 0) {
    for(i = 0;i < param_1->pItemList->num_used;i++;){
      unequip_acc(param_1,i);
    }
  }

}

bool has_potion_effect(CharSheet *param_1,POTION param_2){
  u32 uVar2=0;
  Potion_effect *pPVar1;
  
  while ((pPVar1 = param_1->potionEffects[uVar2]), pPVar1 == NULL || (pPVar1->ID != param_2))) {
    uVar2++;
    if (6 < uVar2) {return false;}
  }
  return true;
}

void Buffing_potion_effect(CharSheet *param_1,POTION param_2,u8 param_3,u32 param_4){
  Potion_effect *pPVar1;
  u32 uVar2;
  CharSkills *arg0;
  u8 uVar3;
  CHAR_SKILL arg1;
  
  
  uVar2 = 0;
  while (param_1->potionEffects[uVar2]) {
    if (6 < uVar2 + 1) {return;}
    pPVar1 = (Potion_effect *)param_1->potionEffects;
    uVar2++;
  }
  pPVar1 = (Potion_effect *)heapAlloc(0xc,FILENAME,0x4a1);
  param_1->potionEffects[uVar2] = pPVar1;
  make_charsheet_potion(pPVar1,param_2,param_3,param_4);
  switch(param_2) {
  case POTION_STRENGTH:
    uVar3 = STAT_STR;
    goto LAB_80078b24;
  case POTION_DEXTERITY:
    uVar3 = STAT_DEX;
LAB_80078b24:
    mod_stats(param_1,uVar3,10);
    return;
  default:
    goto LAB_80078b74;
  case POTION_CLARITY:
    arg1 = SKILL_LOREMASTER;
    break;
  case POTION_CHARISMA:
    arg1 = Diplomat;
    break;
  case POTION_STEALTH:
    arg1 = Stealth;
  }
  some_moddedSkillCheck(param_1->Skills,arg1,3);
LAB_80078b74:
  return;
}

void remove_potion_effect(CharSheet *param_1,u8 param_2){
  CharSkills *arg0;
  u8 SVar1;
  CHAR_SKILL arg1;
  
  if (param_1->potionEffects[param_2] == NULL) {return;}
  switch(param_1->potionEffects[param_2]->ID) {
  case POTION_STRENGTH:
    SVar1 = STAT_STR;
    break;
  case POTION_DEXTERITY:
    SVar1 = STAT_DEX;
    break;
  default:
    goto Lab_return;
  case POTION_CLARITY:
    arg0 = param_1->Skills;
    arg1 = SKILL_LOREMASTER;
    goto remove_skill_buff;
  case POTION_CHARISMA:
    arg0 = param_1->Skills;
    arg1 = Diplomat;
remove_skill_buff:
    some_moddedSkillCheck(arg0,arg1,-3);
    return;
  case POTION_STEALTH:
    some_moddedSkillCheck(param_1->Skills,Stealth,-3);
    goto Lab_return;
  }
  remove_stat_buff(param_1,SVar1,10);
Lab_return:
  return;
}

bool inc_charsheet_potion(CharSheet *param_1,bool Trekking,u8 param_3){
  Potion_effect **paVar3;
  u32 uVar2;
  u32 uVar3;
    
  if (!isDead(param_1)) {
    uVar3 = 0;
    paVar3 = param_1->potionEffects;
    while( true ) {
      if (paVar3[uVar3]) {
        if (!Trekking) {uVar2 = 0;}
        else {uVar2 = (u32)TerrainPointer->a;}
        if (check_charsheet_potion_timer(paVar3[uVar3],uVar2,param_3)) {clear_charsheet_potion(param_1,uVar3);}}
      uVar3++;
      if (6 < uVar3) break;
      paVar3 = param_1->potionEffects;
    }
  }
  return false;
}


void clear_charsheet_potion(CharSheet *param_1,u32 param_2){
  if (param_1->potionEffects[param_2]) {
    remove_potion_effect(param_1,param_2);
    func_with_potion_unk2(param_1->potionEffects[param_2]);
    HeapFree(param_1->potionEffects[param_2],FILENAME,0x50b);
    param_1->potionEffects[param_2] = NULL;
  }
}

void clear_exhaustion(CharSheet *param_1){
  SpellEffect*peVar1;
  u32 uVar2;
  
  uVar2 = 0;
  peVar1 = param_1->spellEffects;
  while( true ) {
    if ((peVar1->list[uVar2]) && (peVar1->list[uVar2]->index == exhaustion))
    {clear_player_effect(param_1,uVar2,NULL);}
    uVar2++;
    if (0xe < uVar2) break;
  }
  calc_stamina_change(param_1,false);
}


bool can_use_potion(CharSheet *param_1,POTION param_2,char *param_3){
  u32 uVar1;
  s32 iVar2;
  s32 iVar3;
  bool bVar4;
  bool bVar6;
  SpellEffect*peVar5;
  char *c2;
  u32 uVar6;
  
  switch(param_2) {
  case POTION_HEALING:
  case POTION_CURING:
    if (param_3) {strcpy(param_3,"That potion cannot be used right now.");}
    bVar6 = getHPCurrent(param_1) != getHPMax(param_1);
    break;
  case POTION_STAMINA:
    uVar6 = 0;
    peVar5 = param_1->spellEffects;
    do {
      uVar6++;
      if ((peVar5->list[0]) && (peVar5->list[0]->index == exhaustion)) {
        return true;
      }
      peVar5 = (SpellEffect*)(peVar5->list + 1);
    } while (uVar6 < 0xf);
    if (param_3) {strcpy(param_3,"That potion cannot be used right now.");}
    bVar6 = CharStats::getModdedStat(param_1->Stats,STAT_STAM) < CharStats::getBaseStat(param_1->Stats,STAT_STAM);
    break;
  case POTION_ANTIDOTE:
    uVar6 = 0;
    peVar5 = param_1->spellEffects;
    do {
      uVar6++;
      if ((peVar5->list[0]) && (peVar5->list[0]->index == poison)) {
        return true;
      }
      peVar5 = (SpellEffect*)(peVar5->list + 1);
    } while (uVar6 < 0xf);
    if (param_3) {
      c2 = "That potion cannot be used right now.";
LAB_80078fb4:
      strcpy(param_3,c2);}
    goto LAB_80078fbc;
  case POTION_RESTORE:
    uVar6 = 0;
    peVar5 = param_1->spellEffects;
    while( true ) {
      bVar4 = IsDebuffSpell(param_1,(SpellEnum)peVar5->list[uVar6]);
      uVar6++;
      if (bVar4) break;
      if (0xe < uVar6) {
        if (param_3 == NULL) goto LAB_80078fbc;
        c2 = "That potion cannot be used right now.";
        goto LAB_80078fb4;
      }
      peVar5 = param_1->spellEffects;
    }
    bVar6 = true;
    break;
  case POTION_STRENGTH:
  case POTION_DEXTERITY:
  case POTION_CLARITY:
  case POTION_CHARISMA:
  case POTION_DEFENCE:
  case POTION_STEALTH:
    if (param_3) {strcpy(param_3,"That potion cannot be used right now.");}
    bVar6 = (bool)(has_potion_effect(param_1,param_2) ^ 1);
    break;
  default:
    if (param_3) {
      c2 = s_That_potion_cannot_be_used_in_Tr_800e0390;
      goto LAB_80078fb4;}
LAB_80078fbc:
    bVar6 = false;}
  return bVar6;}

bool clear_debuff_spells(CharSheet *param_1){
  bool bVar1;
  SpellEffect*peVar2;
  u32 uVar3;
  bool bVar4;
  
  bVar4 = false;
  uVar3 = 0;
  peVar2 = param_1->spellEffects;
  while( true ) {
    bVar1 = IsDebuffSpell(param_1,(SpellEnum)peVar2->list[uVar3]);
    if (bVar1) {
      clear_player_effect(param_1,uVar3,NULL);
      bVar4 = true;
    }
    uVar3++;
    if (0xe < uVar3) break;}
  return bVar4;
}

bool potionEffects(CharSheet *param_1,u8 param_2,POTION param_3,char *param_4){
  inv_funcs *piVar1;
  bool bVar2;
  
  if (!can_use_potion(param_1,param_3,param_4)) {bVar2 = false;}
  else {
    switch(param_3) {
    case POTION_HEALING:
      potion_heal(param_1,0xf,0x19);
      break;
    case POTION_STAMINA:
      clear_exhaustion(param_1);
      break;
    case POTION_CURING:
      potion_heal(param_1,0x28,0x3c);
      break;
    case POTION_ANTIDOTE:
      ApplySpellEffect(param_1,removePoison,0,0,0xff,0);
      break;
    case POTION_RESTORE:
      clear_debuff_spells(param_1);
      break;
    case POTION_STRENGTH:
    case POTION_DEXTERITY:
    case POTION_JUMPING:
    case POTION_CLARITY:
    case POTION_CHARISMA:
    case POTION_DEFENCE:
    case POTION_STEALTH:
      Buffing_potion_effect(param_1,param_3,0,648000);
    }
    piVar1 = gGlobals.party->inv->Functions;
    (*(piVar1->search).func)
              ((s32)gGlobals.party->inv->inv_slots + (s16)(piVar1->search).arg[0] + -4,
               param_2,-1);
    bVar2 = true;
  }
  return bVar2;
}

bool IsNotAffected(CharSheet *param_1,SpellEnum param_2){
  SpellEffect*peVar1;
  u32 uVar2;
  
  uVar2 = 0;
  peVar1 = param_1->spellEffects;
  while( true ) {
    uVar2++;
    if ((peVar1->list[0]) && (peVar1->list[0]->index == param_2)) break;
    peVar1 = (SpellEffect*)(peVar1->list + 1);
    if (0xe < uVar2) {
      return false;
    }
  }
  return true;
}

u8 ret1_800791c8(void){return 1;}

 s32 print_element_resist(resist_float *param_1,char *param_2,char *param_3,u32 param_4){
  u32 uVar1= param_4;
  char *pcVar2;
  
  if (param_1->element != NONE) {
    pcVar2 = "Immune to %s";
    if (0.0 < param_1->percent) {pcVar2 = "Resistant to %s";}
    if (2.0f <= param_1->percent) {pcVar2 = "Vulnerable to %s";}
    sprintf(param_3,pcVar2,element_labels[param_1->element]);
    uVar1 = append_SenseAura_text(param_2,param_3,param_4);
  }
  return uVar1;
}

void senseAura(CombatEntity *target,u8 level){
  CharSheet *pCVar1;
  u32 uVar3;
  undefined8 uVar2;
  s32 iVar4;
  resist_float *prVar6;
  u32 uVar7;
  char acStack1064 [832];
  char acStack232 [64];
  color32 col1;
  color32 col2;
  
  pCVar1 = target->charSheetP;
  sprintf(acStack1064,"%s\n",pCVar1->name);
  uVar3 = strlen(acStack1064);
  if (level != 0) {
    strcpy(acStack232,"Follower");
    if ((target->index == gCombatP->leaderIndex) && (gCombatP->leaderDead == 0)) {
      strcpy(acStack232,"Leader");}
    uVar3 = append_SenseAura_text(acStack1064,acStack232,uVar3);
  }
  if (2 < level) {
    sprintf(acStack232,"%d_Total_Hitpoints",getHPMax(pCVar1));
    uVar3 = append_SenseAura_text(acStack1064,acStack232,uVar3);
  }
  if (4 < level) {
    sprintf(acStack232,"Level_%lu",CharStats::getBaseStat(pCVar1->Stats,STAT_LV));
    uVar3 = append_SenseAura_text(acStack1064,acStack232,uVar3);
  }
  if (6 < level) {
    prVar6 = target->resists;
    for(uVar7 = 0;uVar7 < 2;uVar7++) {
      uVar3 = print_element_resist(prVar6++,acStack1064,acStack232,uVar3);
    }
  }
  if (8 < level) {
    sprintf(acStack232,"Total Armor Protection %d",get_protection_level(target,false));
    uVar3 = append_SenseAura_text(acStack1064,acStack232,uVar3);
  }
  col1 = OFFWHITE;
  col2 = DARKGRAY_T;
  gCombatP->Widget0x4fb8 = some_textbox_func(acStack1064,(s16)(uVar3 << 3) - (s16)uVar3,&col1,&col2,1);
}

s32 find_free_effect_slot(CharSheet *param_1){
  SpellEffect*peVar1;
  s32 iVar2;
  
  iVar2 = 0;
  peVar1 = param_1->spellEffects;
  do {
    if (peVar1->list[0] == NULL) {return iVar2;}
    iVar2++;
    peVar1 = (SpellEffect*)(peVar1->list + 1);
  } while (iVar2 < 0xf);
  return -1;
}


s16 ApplySpellEffect(CharSheet *param_1,SpellEnum param_2,u8 Lv,s32 param_4,u8 param_5,CombatEntity *param_6){
  combat_ai *pcVar1;
  bool bVar2;
  longlong lVar3;
  u32 uVar5;
  bool bVar10;
  s32 iVar6;
  bool bVar11;
  longlong lVar4;
  s16 sVar8;
  Temp_enchant *pTVar7;
  Temp_enchant **ppTVar12;
  CharStats *stat;
  u8 SVar13;
  undefined uVar14;
  s32 iVar15;
  u32 Lv;
  u32 uVar16;
  s32 uVar17;
  s32 uVar18;
  s32 uVar19;
  u8 bVar9;
  
  uVar18 = 0;
  uVar17 = 0;
  bVar2 = true;
  uVar16 = 0;
  bVar9 = GetIDIndex(param_1->ID);
  lVar3 = (longlong)(char)bVar9;
  uVar5 = find_free_effect_slot(param_1);
  bVar10 = IsNotAffected(param_1,param_2);
  if (bVar10 == false) {uVar16 = ~uVar5 >> 0x1f;}
  sVar8 = (s16)uVar5;
  uVar19 = uVar18;
  bVar10 = bVar2;
  switch(param_2) {
  case Immolation:
  case AcidBolt:
  case poison:
  case stellarGravity:
    if (uVar16 != 0) {uVar19 = 1;}
    break;
  case escape:
    bVar10 = false;
    if ((param_6) &&
       (uVar19 = uVar17, bVar10 = false, encounter_dat.BossShadow != 0)) {
      combat_escape_func(param_6);
      bVar10 = false;
    }
    break;
  case removePoison:
    RemovePoison(param_1,param_6,param_5);
    uVar19 = uVar17;
    bVar10 = false;
    break;
  case AirSheild:
  case spiritSheild:
  case starlightSheild:
    if (uVar16 != 0) {param_1->EXP->protection+= (char)(Lv << 1);}
    break;
  case ControlElem:
    uVar19 = uVar17;
    bVar10 = true;
    if (((uVar16 == 0) || (param_6 == NULL)) ||
       (bVar11 = IsElemental(param_1->ID), uVar19 = uVar18, bVar10 = bVar2, bVar11 == false)) break;
    goto control_magic;
  case debilitation:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = STAT_STR;
    goto lower_stat;
  case strength:
    if (uVar16 == 0) break;
    SVar13 = STAT_STR;
    uVar14 = (undefined)((Lv << 0x19) >> 0x18);
    goto mod_stat;
  case teleportation:
    teleportation_spell(param_1,param_6);
    uVar19 = uVar17;
    bVar10 = false;
    break;
  case brilliance:
    if (uVar16 == 0) break;
    SVar13 = s32;
    uVar14 = (undefined)((Lv << 0x19) >> 0x18);
    goto mod_stat;
  case stupidity:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = s32;
    goto lower_stat;
  case charming:
    uVar19 = uVar17;
    bVar10 = true;
    if ((uVar16 == 0) || (param_6 == NULL)) break;
    goto control_magic;
  case controlMarquis:
    uVar19 = uVar17;
    bVar10 = true;
    if ((uVar16 == 0) ||
       (lVar4 = 0xaa, uVar19 = uVar18, bVar10 = bVar2, param_6 == NULL)) break;
LAB_800798b0:
    uVar19 = uVar17;
    bVar10 = true;
    if (lVar3 != lVar4) break;
    goto control_magic;
  case endurance:
    if (uVar16 == 0) break;
    SVar13 = STAT_END;
    uVar14 = (undefined)((Lv << 0x19) >> 0x18);
    goto mod_stat;
  case senseAura:
    bVar10 = false;
    if (param_6) {
      senseAura(param_6,(char)Lv);
      uVar19 = uVar17;
      bVar10 = false;
    }
    break;
  case weakness:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = STAT_END;
    goto lower_stat;
  case auraOfDeath:
  case solarWraith:
    bVar10 = true;
    uVar19 = uVar17;
    if (((uVar16 != 0) && (uVar16 = 0, param_6)) &&
       (param_6->aiP)) {
      uVar16 = 1;
      bVar9 = pcVar1->morale;
      if (bVar9 < Lv) {Lv = (u32)bVar9;}
      pcVar1->morale-= (char)Lv;
      param_6->aiP->flags|= 2;
      uVar19 = 1;
      bVar10 = bVar2;
    }
    break;
  case wraithTouch:
    if (uVar16 != 0) {
      Wraith_touch(param_1,uVar5);
      return sVar8;
    }
    break;
  case controlZombies:
    uVar19 = uVar17;
    bVar10 = true;
    if ((uVar16 == 0) || (uVar19 = uVar18, bVar10 = bVar2, param_6 == NULL)) break;
    lVar4 = 0xb6;
    if (lVar3 != 0xbe) goto LAB_800798b0;
control_magic:
    bVar9 = ret1_800791c8();
    uVar19 = uVar18;
    bVar10 = bVar2;
    if (bVar9 != 0) {
      CombatEnt_XOR_flags(param_6,flag4);
      uVar19 = 1;
      bVar10 = true;
    }
    break;
  case darkness:
  case light:
    if (uVar16 != 0) {
      darkness_light_spell(param_1,param_2);
      uVar19 = uVar17;
      bVar10 = true;
    }
    break;
  case exhaustion:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = STAT_STAM;
    goto lower_stat;
  case stamina:
    if (uVar16 == 0) break;
    SVar13 = STAT_STAM;
    goto lower_stat;
  case tapStamina:
    iVar15 = Lv << 1;
    if (uVar16 != 0) {
      iVar6 = CharStats::getModdedStat(param_1->Stats,STAT_STAM);
      stat = param_1->Stats;
      if (iVar6 < iVar15) {
        iVar15 = CharStats::getModdedStat(stat,STAT_STAM);
        stat = param_1->Stats;
      }
      CharStats::addModdedStat(stat,STAT_STAM,-(char)iVar15);
      uVar19 = 1;
      bVar10 = true;
    }
    break;
  case wallOfBones:
  case frozenDoom:
  case webOfStarlight:
    if (lVar3 == 0xac) {return -1;} //Fail with shadow
    uVar19 = uVar17;
    bVar10 = true;
    if ((uVar16 != 0) && (param_6)) {
      CombatEnt_NAND_flags(param_6,flag1);
      uVar19 = 1;
      bVar10 = true;
    }
    break;
  case mirror:
    uVar19 = uVar17;
    bVar10 = true;
    if ((param_6) && (uVar19 = uVar18, bVar10 = bVar2, uVar16 != 0)) {param_6->unk0x28+= (char)Lv * 3;}
    break;
  case dispelElemental:
  case dispelNaming:
  case dispelNecro:
  case dispelStar:
    dispel_magic(param_1,(char)param_6,param_2,param_5);
    uVar19 = uVar17;
    bVar10 = false;
    break;
  case detectMoonPhase:
    uVar19 = uVar17;
    bVar10 = true;
    if (uVar16 != 0) {
      xor_sundail_moon(1);
      bVar10 = true;
    }
    break;
  case detectSunPhase:
    uVar19 = uVar17;
    bVar10 = true;
    if (uVar16 != 0) {
      xor_sundail_sun(1);
      bVar10 = true;
    }
    break;
  case dexterity:
    if (uVar16 == 0) break;
    SVar13 = STAT_DEX;
    uVar14 = (undefined)((Lv << 0x19) >> 0x18);
    goto mod_stat;
  case clumsiness:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = STAT_DEX;
lower_stat:
    uVar14 = (undefined)(Lv * -0x2000000 >> 0x18);
mod_stat:
    mod_stats(param_1,SVar13,uVar14);
    uVar19 = uVar18;
    bVar10 = true;
    break;
  case stealth:
    if (uVar16 != 0) {
      some_moddedSkillCheck(param_1->Skills,Stealth,(s8)(Lv * 0x6000000 >> 0x18));
      uVar19 = uVar17;
      bVar10 = true;
    }
  }
  if (bVar10) {
    if (uVar16 == 0) {sVar8 = -1;}
    else {
      pTVar7 = (Temp_enchant *)heapAlloc(0x18,FILENAME,0x809);
      ppTVar12 = param_1->spellEffects->list + uVar5;
      *ppTVar12 = pTVar7;
      CreateTempEnchant(*ppTVar12,param_2,(char)Lv,param_4,param_5,uVar19);
    }
  }
  else {sVar8 = -1;}
  return sVar8;
}


void ReverseSpellEffect(CharSheet *param_1,u8 param_2,CombatEntity *param_3){
  Temp_enchant *pTVar1;
  bool bVar2;
  u8 SVar3;
  char cVar4;
  u8 bVar5;
  combat_ai *iVar2;
  
  pTVar1 = param_1->spellEffects->list[param_2];
  if (pTVar1 == NULL) {return;}
  switch(pTVar1->index) {
  case AirSheild:
    param_1->EXP->protection-= pTVar1->lv * 2;
    break;
  case ControlElem:
  case charming:
  case controlMarquis:
  case controlZombies:
    if (param_3) {
      if (!CombatEnt_flag_5(param_3)) {CombatEnt_NAND_flags(param_3,flag4);}
      else {CombatEnt_OR_flags(param_3,flag4);}
    }
    break;
  case debilitation:
    bVar5 = pTVar1->lv;
    SVar3 = STAT_STR;
    goto LAB_80079c10;
  case strength:
    SVar3 = STAT_STR;
    cVar4 = (char)(((u32)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case wind:
    TerrainPointer->windByte = 1;
    break;
  case brilliance:
    SVar3 = s32;
    cVar4 = (char)(((u32)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case stupidity:
    bVar5 = pTVar1->lv;
    SVar3 = s32;
    goto LAB_80079c10;
  case endurance:
    SVar3 = STAT_END;
    cVar4 = (char)(((u32)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case weakness:
    bVar5 = pTVar1->lv;
    SVar3 = STAT_END;
    goto LAB_80079c10;
  case auraOfDeath:
  case solarWraith:
    if ((param_3) &&
       (param_3->aiP)) {iVar2->morale+= pTVar1->lv;}
    break;
  case wraithTouch:
    SVar3 = pTVar1->unk0x3;
    cVar4 = -pTVar1->lv;
    goto LAB_80079c18;
  case darkness:
  case light:
    dec_dayNightMagic(TerrainPointer);
    TerrainPointer->partOfDay = *(TimeOfDay *)gCombatP;
    break;
  case exhaustion:
    bVar5 = pTVar1->lv;
    SVar3 = STAT_STAM;
    goto LAB_80079c10;
  case stamina:
    SVar3 = STAT_STAM;
    cVar4 = (char)(((u32)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case wallOfBones:
  case frozenDoom:
  case webOfStarlight:
    if (param_3) {CombatEnt_OR_flags(param_3,flag1);}
    break;
  case spiritSheild:
  case starlightSheild:
    param_1->EXP->protection-= pTVar1->lv;
    break;
  case dexterity:
    SVar3 = STAT_DEX;
    cVar4 = (char)(((u32)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case clumsiness:
    bVar5 = pTVar1->lv;
    SVar3 = STAT_DEX;
LAB_80079c10:
    cVar4 = bVar5 * -2;
LAB_80079c18:
    remove_stat_buff(param_1,SVar3,cVar4);
    break;
  case stealth:
    some_moddedSkillCheck(param_1->Skills,Stealth,pTVar1->lv * -6);
  }
  return;
}

s32 func_incrementing_enchantments(CharSheet *param_1,CombatEntity *param_2,s32 param_3){
  SpellEnum SVar1;
  Temp_enchant *pTVar2;
  bool bVar7;
  s32 iVar4;
  u32 uVar5;
  u32 uVar6;
  SpellEffect*peVar8;
  u8 dice;
  u32 uVar9;
  s32 iVar10;
  s32 iVar11;
  
  if (isDead(param_1) return 0;
  iVar10 = 0;
  iVar11 = 0;
  uVar9 = 0;
  peVar8 = param_1->spellEffects;
  do {
    pTVar2 = peVar8->list[uVar9];
    if (pTVar2) {
      uVar5 = 0;
      if (param_2 == NULL) {uVar5 = (u32)TerrainPointer->a;}
      if (!inc_effect_timer(pTVar2,uVar5,param_3)) {
        SVar1 = pTVar2->index;
        uVar5 = 0;
        if (SVar1 == poison) {
          uVar6 = (u32)(pTVar2->lv >> 1);
          if (CharStats::getModdedStat(param_1->Stats,STAT_END) < uVar6) {uVar6 = CharStats::getModdedStat(param_1->Stats,STAT_END);}
          if (getHPCurrent(param_1) < uVar6) goto LAB_80079e7c;
          iVar10+= uVar6;
          uVar5 = 0;
          CharStats::addModdedStat(param_1->Stats,STAT_END,-(char)uVar6);
        }
        else {
          if (SVar1 < mirror) {
            if (SVar1 == Immolation) {dice = 1;}
            else {
              dice = 1;
              if (SVar1 != AcidBolt) goto LAB_80079e48;
            }
RollDoT:
            uVar5 = RollD(dice,6);
          }
          else {
            if (SVar1 == photosynthesis) {
              if (TerrainPointer->partOfDay == NIGHT) goto LAB_80079e7c;
              addHP(param_1,pTVar2->unk0x3 << 0x18 >> 0x18));
              iVar11+= (char)pTVar2->unk0x3;
            }
            else if (SVar1 == webOfStarlight) {
              iVar4 = CharStats::getModdedStat(param_1->Stats,STAT_STR);
              uVar5 = RollD(1,100);
              if ((iVar4 * 2 <= (s32)uVar5) ||
                 (some_skillcheck_calc((s32)((iVar4 * 2 - uVar5) * 0x10000) >> 0x10) == 0)) {
                 dice = 2;
                 goto RollDoT;
                }
                clear_player_effect(param_1,uVar9 & 0xff,param_2);
                uVar5 = 0;
              }
          }
        }
LAB_80079e48:
        if ((uVar5 != 0) && ( uVar5 <= getHPCurrent(param_1))) {
          func_checking_cheat_death(param_1,(s16)uVar5,param_2);
          iVar10+= uVar5;
        }
      }
      else clear_player_effect(param_1,uVar9,param_2);
    }
LAB_80079e7c:
    uVar9++;
    if (0xe < uVar9) {
      if (iVar11 == 0) {return iVar10;}
      check_dead_from_DoT(param_1,0,iVar11,param_2);
      return iVar10;
    }
    peVar8 = param_1->spellEffects;
  } while( true );
}

Temp_spell * getSpell(CharSheet *param_1){
  temp_armor *ptVar1;
  temp_armor **pptVar2;
  temp_armor *iVar6;
  temp_armor *patVar4;
  
  switch(param_1->spellSwitch) {
  case 1:
    #ifdef DEBUGVER
    if (param_1->spellbook == NULL) {Crash::ManualCrash("No spell list (Entity::GetSpell())",*FILENAME);}
    if (param_1->spellbook->spells == NULL) {Crash::ManualCrash("No pSpellList->pSpell[] (Entity::GetSpell())",*FILENAME);}
    #endif
    return param_1->spellbook->spells[param_1->currSpell];
  case 2:
    #ifdef DEBUGVER
    if (param_1->armor == NULL) {Crash::ManualCrash("No armor (Entity::GetSpell())",*FILENAME);}
    if (*param_1->armor[0] == NULL) {Crash::ManualCrash("No pArmor[0] (Entity::GetSpell())",*FILENAME);}
    if ((*param_1->armor[0])->spell == NULL) {Crash::ManualCrash("No pArmor[0]->pSpell (Entity::GetSpell())",*FILENAME);}
    #endif
    pptVar2 = param_1->armor[0];
    break;
  case 3:
    #ifdef DEBUGVER
    if (param_1->armor == NULL) {Crash::ManualCrash("No armor (Entity::GetSpell())",*FILENAME);}
    if (param_1->armor[1] == NULL) {Crash::ManualCrash("No pArmor[1] (Entity::GetSpell())",*FILENAME);}
    if (param_1->armor[1]->spell == NULL) {Crash::ManualCrash("No pArmor[1]->pSpell (Entity::GetSpell())",*FILENAME);}
    #endif
    ptVar1 = param_1->armor[1];
    goto RetSpell;
  case 4:
    #ifdef DEBUGVER
    if (param_1->weapons == NULL) {Crash::ManualCrash("No weapon (Entity::GetSpell())",*FILENAME);}
    if (param_1->weapons->spell == NULL) {Crash::ManualCrash("No pWeapon->pSpell (Entity::GetSpell())",*FILENAME);}
    #endif
    return param_1->weapons->spell;
  case 5:
    #ifdef DEBUGVER
    if (param_1->pItemList == NULL) {Crash::ManualCrash("No pItemList (Entity::GetSpell())",*FILENAME);}
    if (param_1->pItemList->pItem == NULL) {Crash::ManualCrash("No pItemList->pItem[] (Entity::GetSpell())",*FILENAME);}
    if (param_1->pItemList->pItem[param_1->currSpell]->pSpell == NULL) {Crash::ManualCrash("No pItemList->pItem[currSpell]->pSpell (Entity::GetSpell())",*FILENAME);}
    #endif
    pptVar2 = (temp_armor **)(param_1->pItemList->pItem + param_1->currSpell);
    break;
  default:
    return NULL;
  }
  ptVar1 = *pptVar2;
RetSpell:
  return *(Temp_spell **)ptVar1->spell;
}
//2 extra args, no clue what for
Temp_spell * passto_getSpell(CharSheet *param_1,s16 unk1,void *unk2){
  Temp_spell* ret = NULL;
  if (param_1->spellSwitch < 6) ret = getSpell(param_1);
  return ret;
}

undefined some_equip_spell_charges(CharSheet *param_1){
  temp_armor *ptVar1;
  temp_armor **pptVar2;
  
  switch(param_1->spellSwitch) {
  case 1:
    return 1;
  case 2:
    pptVar2 = param_1->armor;
    break;
  case 3:
    ptVar1 = param_1->armor[1];
    goto LAB_8007a1d8;
  case 4:
    return param_1->weapons->spell->Charges;
  case 5:
    pptVar2 = (temp_armor **)(param_1->pItemList->pItem + param_1->currSpell);
    break;
  default:
    return 0;
  }
  ptVar1 = *pptVar2;
LAB_8007a1d8:
  return  ptVar1->spell->Charges;
}

void dec_item_spell_uses(CharSheet *param_1){
  temp_gear *ptVar1;
  u16 uVar3;
  
  if (param_1->spellSwitch == 5) {
    ptVar1 = param_1->pItemList->pItem[param_1->currSpell];
    uVar3 = (u16)ptVar1->id >> 8;
    if ((uVar3 == 0x11) || (uVar3 == 0xd)) ptVar1->pSpell->Charges--;
  }
}



u8 check_spell_wizard(CharSheet *param_1,Temp_spell *param_2){
  u8 bVar2;
  
  if (param_2) {
    bVar2 = param_1->spellSwitch;
    if (bVar2 == 1) {
      if (getModdedSkill(param_1->Skills,SKILL_WIZARD) <= param_2->level)
         return getModdedSkill(param_1->Skills,SKILL_WIZARD);
      return param_2->level;
    }
    if (bVar2 != 0) {
      if (5 < bVar2) return 0;
      return param_2->level;
    }
  }
  return 0;
}

s32 spell_stamina_subtract(Charsheet* ch,Temp_spell *param_1,u8 param_2){
  s32 uVar1 = param_1->stamina - param_2);
  if (uVar1 < 1) uVar1 = 1;
  return uVar1;
}

bool Test_equip_Stamina(CharSheet *param_1,s16 param_2){
  s32 iVar1 = Equip_Stamina(param_1,param_2,0);
  if (iVar1 == 0) Equip_Stamina(param_1,param_2,1);
  return iVar1 == 0;}

s32 Equip_Stamina(CharSheet *param_1,s16 stam,u8 param_3){
  s32 iVar1;
  s32 iVar2;
  CharGear *pCVar3;
  u32 uVar4;
  s32 iVar5;
  
  iVar1 = add_Equip_Stamina(param_1,(temp_armor *)param_1->weapons,stam,param_3);
  iVar1 = add_Equip_Stamina(param_1,*(temp_armor **)param_1->armor,(s16)iVar1,param_3);
  iVar1 = add_Equip_Stamina(param_1,param_1->armor[1],(s16)iVar1,param_3);
  pCVar3 = param_1->pItemList;
  
  if (pCVar3->num_used != 0) {
    for(uVar4 = 0;uVar4 < pCVar3->num_used;uVar4++;) {
      iVar1 = add_Equip_Stamina((temp_armor *)pCVar3->pItem[uVar4],(s16)iVar1,param_3);

    }
  }
  if (iVar1 < 1) iVar5 = 0;
  else {
    iVar2 = CharStats::getModdedStat(param_1->Stats,STAT_STAM);
    iVar5 = (iVar1 - (s16)iVar2) * 0x10000 >> 0x10;
    if (iVar5 < 0) {
      if (param_3 != 0) {CharStats::addModdedStat(param_1->Stats,STAT_STAM,-(char)iVar1);}
      iVar5 = 0;
    }
    else {
      if (param_3 != 0) {CharStats::addModdedStat(param_1->Stats,STAT_STAM,-(char)iVar2);}
    }
  }
  return iVar5;
}

s32 add_Equip_Stamina(charSheet* c,temp_armor *param_1,s16 param_2,u8 param_3){
  u8 (*pabVar1) [2];
  s32 iVar2;
  s32 iVar3;
  
  iVar2 = (s32)param_2;
  if (iVar2 == 0) return 0;
  if ((((param_1) && (pabVar1 = param_1->statMod, pabVar1))
    && ((*pabVar1)[0] == 5)) && ((*pabVar1)[1] != 0)) {
    iVar2 = (iVar2 - (char)(*pabVar1)[1]) * 0x10000;
    iVar3 = iVar2 >> 0x10;
    if (iVar3 < 0) {
      if (param_3) {
        (*pabVar1)[1] = -(char)((u32)iVar2 >> 0x10);
      }
      iVar3 = 0;
    }
    else {
      if (param_3) {(*pabVar1)[1] = 0;}
    }
    return iVar3;
  }
  return iVar2;
}

void camp_healing(CharSheet *param_1,float param_2,u32 param_3){
  s32 iVar1;
  u32 uVar2;
  temp_gear *ptVar3;
  u16 uVar4;
  float fVar5;
  
  iVar1 = getHPMax(param_1);
  fVar5 = (float)iVar1 * param_2;
  if (INT_MAX_f <= fVar5) {fVar5-= INT_MAX_f;}
  uVar2 = getHPCurrent(param_1);
  uVar2 = iVar1 - getHPCurrent(param_1)
  uVar4 = (s16)((s32)fVar5);
  if (uVar2 < ((s32)fVar5)) {uVar4 = (s16)uVar2;}
  addHP(param_1,uVar4);
  tick_potion_enchantment_timers(param_1,NULL,param_3);
  multi_equip_StamMod(param_1->weapons,param_2);
  multi_equip_StamMod(*(Temp_weapon **)param_1->armor,param_2);
  multi_equip_StamMod((Temp_weapon *)param_1->armor[1],param_2);
  uVar2 = 0;
  if (param_1->pItemList->num_used != 0) {
    ptVar3 = (temp_gear *)param_1->pItemList->pItem;
    while( true ) {
      multi_equip_StamMod(*(Temp_weapon **)((s32)ptVar3 + uVar2 * 4),param_2);
      uVar2 = uVar2 + 1;
      if ((u8)param_1->pItemList->num_used <= uVar2) break;
      ptVar3 = (temp_gear *)param_1->pItemList->pItem;
    }
  }
}

u8 check_spell_aspect_tod(CharSheet* c,Temp_spell *sp){
  u8 bVar1;
  ASPECT AVar2 = sp->aspect;
  if (AVar2 == (LUNAR|LUNAR_MAGIC)) {
    if (TerrainPointer->partOfDay == NIGHT) return 3;
  }
  if (AVar2 == (SOLAR|LUNAR_MAGIC)) {
    bVar1 = 4;
    if (TerrainPointer->partOfDay == NIGHT) bVar1 = 0;
  }
  else bVar1 = 0;
  return bVar1;
}

u8 CheckTargetSpellAspect(CharSheet *param_1,Temp_spell *param_2){
  ASPECT AVar1;
  u8 bVar2;
  
  bVar2 = 0;
  AVar1 = param_2->aspect;
  if (AVar1 == LUNAR) {
    if (((param_1->EXP->flags ^ TrueName) & TrueName) != 0) {bVar2 = 7;}
  }
  if (AVar1 == SOLAR) {
    if ((param_1->EXP->flags & 2) == 0) {bVar2 = 8;}
  }
  if (AVar1 == SOLAR_MAGIC) {
    AVar1 = GetCharAspect(param_1->EXP);
    if (AVar1 != SOLAR) {bVar2 = 9;}
    AVar1 = param_2->aspect;
  }
  else {AVar1 = param_2->aspect;}
  if ((AVar1 == LUNAR_MAGIC) && (GetCharAspect(param_1->EXP) != LUNAR)) {bVar2 = 10;}
  return bVar2;
}

void check_dead_from_DoT(CharSheet *param_1,s16 param_2,s16 param_3,CombatEntity *param_4){
  playerData *ppVar1;
  bool bVar2;
  
  if ((param_4) &&
     (ppVar1 = gGlobals.playerDataArray[param_4->index], ppVar1)) {
    Print_damage_healing(ppVar1,param_2,param_3,isDead(param_1),param_1);
    if (isDead(param_1)) {
      func_seeking_sholeh(param_4);
      some_death_func_B(ppVar1,(u32)param_4->index,param_4);
    }
  }
  return;
}

void tick_potion_enchantment_timers(CharSheet *param_1,CombatEntity *param_2,u32 param_3){
  bool bVar2;
  s16 sVar1;
  
  bVar2 = inc_charsheet_potion(param_1,param_2 == NULL,param_3);
  sVar1 = func_incrementing_enchantments(param_1,param_2,param_3);
  check_dead_from_DoT(param_1,bVar2 + sVar1,0,param_2);
  return;
}

///IDK what this was... Unused.
bool func_8007a8cc(ItemID param_1,u32 param_2){
  u8 bVar1;
  u8 bVar2;
  
  bVar2 = GetIDIndex(param_1);
  bVar1 = (weapon_pointer->Types + ((param_2 & 0xff) - 1))[0xc];
  return bVar1 <= bVar2 && bVar2 <= bVar1 + (weapon_pointer->Types + ((param_2 & 0xff) - 1))[1] + -1) & 0xffU);
}


void giveExp(CharSheet *param_1,s32 param_2){
  charExp *pcVar1;
  float fVar4 = (float)param_2 * 1.5f; //rom value  * 50 * 1.5 = 75 exp gains
  pcVar1 = param_1->EXP;
  pcVar1->spending += (s32)fVar4;
  pcVar1->total += (s32)fVar4;
  CharStats:::AddBase(param_1->Stats,STAT_LV,get_level(param_1) - CharStats::getBaseStat(param_1->Stats,STAT_LV));
}

//above, but no spending exp or STAT_LV up
void exp_multi_1point5(CharSheet *param_1,s32 param_2){param_1->EXP->total+= (s32)((float)param_2 * 1.5f);}

u16 potion_heal(CharSheet *param_1,u16 Hi,u16 Lo){

  u16 uVar3;
  float fVar4;
  
  if ((gGlobals.screenFadeModeSwitch != 2) || (uVar3 = 0, gGlobals.ShadowIndex == -1)) {
    fVar4 = (float)globals::rand_range(Hi,Lo) / 100.0f;
    fVar4 *= (float)getHPMax(param_1)
    if (fVar4 < INT_MAX_f) {uVar3 = (u16)fVar4;}
    else {uVar3 = (u16)(fVar4 - INT_MAX_f);}
    addHP(param_1,uVar3);
  }
  return uVar3;
}

void remove_effects(CharSheet *param_1){
  SpellEffect*peVar1;
  u32 uVar2;
  
  if (param_1->spellEffects != (SpellEffect*)0x0) {
    peVar1 = param_1->spellEffects;
    uVar2 = 0;
    while( true ) {
      if (peVar1->list[uVar2]) {
        func_800840dc(peVar1->list[uVar2]);
        HeapFree(param_1->spellEffects->list[uVar2],FILENAME,0xc25);
        param_1->spellEffects->list[uVar2] = NULL;
      }
      if (0xe < uVar2 + 1) break;
      peVar1 = param_1->spellEffects;
      uVar2++;
    }
  }
  return;
}

void clear_charsheet_potions(CharSheet *param_1){
  u32 i;
  if (param_1->potionEffects) {
    for(i=0;i<7;i++) {
      clear_charsheet_potion(param_1,i);
    }
  }
}

u32 get_level(CharSheet *param_1){
  u32 *puVar1;
  u32 uVar2;
  
  uVar2 = 0;
  puVar1 = EXP_TNL;
  do {
    if (param_1->EXP->total < *puVar1) {return uVar2 - 1;}
    uVar2++;
    puVar1++;
  } while (uVar2 < 41);
  return 40;
}

s32 get_EXP_TNL(CharSheet *param_1){
  u16 lv = get_level(param_1) + 1;
  if (lv == 41)return -1;
  return EXP_TNL[lv];
}

void clear_equip_enchantments_(CharSheet *param_1){
  CharGear *pCVar1;
  SpellEffect*peVar2;
  Temp_weapon **ppTVar3;
  Potion_effect **paVar4;
  u32 uVar4;
  
  uVar4 = 0;
  paVar4 = param_1->potionEffects;
  while( true ) {
    if ((paVar4[uVar4]) && (paVar4[uVar4]->ID != POTION_STEALTH)) {
      clear_charsheet_potion(param_1,uVar4 & 0xff);
    }
    uVar4++;
    if (6 < uVar4) break;
    paVar4 = param_1->potionEffects;
  }
  uVar4 = 0;
  peVar2 = param_1->spellEffects;
  while( true ) {
    if (peVar2->list[uVar4]) {clear_player_effect(param_1,uVar4,NULL);}
    uVar4++;
    if (0xe < uVar4) break;
    peVar2 = param_1->spellEffects;
  }
  func_8007ad40(param_1,*(Temp_weapon **)param_1->armor);
  uVar4 = 0;
  func_8007ad40(param_1,(Temp_weapon *)param_1->armor[1]);
  pCVar1 = param_1->pItemList;
  while( true ) {
    ppTVar3 = (Temp_weapon **)(pCVar1->pItem + uVar4);
    uVar4++;
    func_8007ad40(param_1,*ppTVar3);
    if (0xb < uVar4) break;
    pCVar1 = param_1->pItemList;
  }
  return;
}

void func_8007ad40(CharSheet *param_1,Temp_weapon *param_2){
  Temp_enchant *pTVar1;
  
  if (((param_2) &&
      (pTVar1 = param_2->enchantment, pTVar1)) &&
     (pTVar1->timer == -1)) {
    ApplySpellEffect(param_1,pTVar1->index,(u32)pTVar1->lv,pTVar1->timer,pTVar1->unk0x3,NULL);
  }
  return;
}

void teleportation_spell(CharSheet* ch,CombatEntity *param_1){
  float fVar3;
  u8 bVar4;
  u8 bVar5;
  
  if (param_1) {
    fVar3 = gCombatP->floatA;
    if (fVar3 < INT_MAX_f) {bVar4 = (u8)(s32)fVar3;}
    else {bVar4 = (u8)(s32)(fVar3 - INT_MAX_f);}
    fVar3 = gCombatP->FogFloat;
    if (fVar3 < INT_MAX_f) {bVar5 = (u8)(s32)fVar3;}
    else {bVar5 = (u8)(s32)(fVar3 - INT_MAX_f);}
    if (!combat_substruct_lookup(&gCombatP->substruct,bVar4,bVar5,param_1->unk0x23)) {
      set_combatEnt_x_y(param_1,gCombatP->floatA,gCombatP->FogFloat);
      func_800737b4(param_1);
      teleport_spell_sub(param_1);
    }
  }
  return;
}

void RemovePoison(CharSheet *param_1,CombatEntity *param_2,u8 param_3){
  Temp_enchant *pTVar1;
  SpellEffect*peVar2;
  u32 uVar3;
  
  uVar3 = 0;
  peVar2 = param_1->spellEffects;
  while( true ) {
    pTVar1 = peVar2->list[uVar3];
    if (((pTVar1) && (pTVar1->index == poison)) &&
       (pTVar1->unk0x3 < param_3))) {
      clear_player_effect(param_1,uVar3,param_2);
    }
    uVar3++;
    if (0xe < uVar3) break;
  }
  return;
}

void Wraith_touch(CharSheet *param_1,CombatEntity* cEnt,u8 num,u32 param_2){
  u8 SVar1;
  char uVar2;
  Temp_enchant *pTVar3;
  Temp_enchant **ppTVar4;
  u8 wraithTouch_stats [4]={s32,STAT_WIL,STAT_DEX,STAT_STR};
  
  SVar1 = wraithTouch_stats[RollD(1,4)];
  uVar2 = RollD(2,6);
  addModdedStats_flag(param_1->Stats,SVar1,-uVar2);
  pTVar3 = (Temp_enchant *)heapAlloc(0x18,FILENAME,0xcec);
  ppTVar4 = param_1->spellEffects->list + param_2;
  *ppTVar4 = pTVar3;
  CreateTempEnchant(*ppTVar4,wraithTouch,uVar2,-1,SVar1,1);
}

void darkness_light_spell(CharSheet *param_1,SpellEnum param_2){
  CombatEntity *pCVar1;
  Temp_enchant *pTVar2;
  TimeOfDay TVar3;
  s32 iVar4;
  u32 uVar5;
  u32 uVar6;
  SpellEnum SVar7;
  CombatEntity *iVar3;
  
  SVar7 = darkness;
  if (param_2 == darkness) {SVar7 = light;}
  uVar6 = 0;
  if (gCombatP->EntCount != 0) {
    do {
      pCVar1 = &gCombatP->combatEnts[uVar6];
      uVar6++;
      if (pCVar1) {
        uVar5 = 0;
        while (uVar5 < 0xf) {
          pTVar2 = pCVar1->charSheetP->spellEffects->list[uVar5];
          if (pTVar2 == NULL) {uVar5++;}
          else {
            if (pTVar2->index == SVar7) {
              clear_player_effect(pCVar1->charSheetP,uVar5,pCVar1);
              break;
            }
            uVar5++;
          }
        }
      }
    } while (uVar6 < gCombatP->EntCount);
  }
  inc_dayNightMagic(TerrainPointer);
  if (param_2 == darkness) {TVar3 = NIGHT;}
  else {TVar3 = MIDDAY;}
  TerrainPointer->partOfDay = TVar3;
  return;
}

bool dispel_magic(CharSheet *param_1,char param_2,u8 param_3,u8 param_4){
  Temp_enchant *pTVar1;
  bool bVar2;
  SpellEffect*peVar3;
  u32 uVar4;
  s32 iVar5;
  u32 uVar6;
  MagicSchoolEnum MVar7;
  
  MVar7 = Chaos;
  if (param_3 == dispelNaming) MVar7 = SCHOOL_NAMING;
  else if (param_3 == dispelElemental) MVar7 = SCHOOL_ELEMENTAL;
  else if (param_3 == dispelNecro) MVar7 = SCHOOL_NECROMANCY;
  else if (param_3 == dispelStar) MVar7 = SCHOOL_STAR;
  iVar5 = 0;
  uVar4 = 0;
  uVar6 = 0;
  peVar3 = param_1->spellEffects;
  do {
    pTVar1 = peVar3->list[0];
    uVar6++;
    if ((pTVar1) && (pTVar1->school == MVar7)) {
      iVar5++;
      uVar4 += (s32)(char)pTVar1->unk0x3;
    }
    peVar3 = (SpellEffect*)(peVar3->list + 1);
  } while (uVar6 < 0xf);
  if ((iVar5 == 0) || (uVar6 = 0, ((s32)param_4) * iVar5 < uVar4)) {
    bVar2 = false;
  }
  else {
    peVar3 = param_1->spellEffects;
    while( true ) {
      if ((peVar3->list[uVar6]) && (peVar3->list[uVar6]->school == MVar7)) {
        clear_player_effect(param_1,uVar6 & 0xff,(CombatEntity *)(s32)param_2);
      }
      uVar6++;
      if (0xe < uVar6) break;
      peVar3 = param_1->spellEffects;
    }
    bVar2 = true;
  }
  return bVar2;
}

void DoubleTap(CharSheet *param_1){
  if (CharStats::getModdedStat(param_1->Stats,STAT_END) != 0)
    CharStats::addModdedStat(param_1->Stats,STAT_END,-CharStats::getModdedStat(pCVar2,STAT_END));
  if (CharStats::getModdedStat(param_1->Stats,STAT_STAM) != 0)
    CharStats::addModdedStat(param_1->Stats,STAT_STAM,-CharStats::getModdedStat(pCVar2,STAT_STAM));
  if (CharStats::getModdedStat(param_1->Stats,STAT_LV) != 0)
    CharStats::addModdedStat(param_1->Stats,STAT_LV,-CharStats::getModdedStat(pCVar2,STAT_LV));
}

bool check_healer_stam(CharSheet *param_1){
  char cVar2;
  s32 iVar1;
  bool bVar3;
  s32 iVar4;
  
  cVar2 = getModdedSkill(param_1->Skills,SKILL_HEALER);
  if (cVar2 == 0) {bVar3 = false;}
  else {
    iVar1 = CharStats::getModdedStat(param_1->Stats,STAT_STAM);
    iVar4 = 11 - cVar2;
    if (iVar4 < 1) {iVar4 = 1;}
    bVar3 = iVar4 <= iVar1;
  }
  return bVar3;
}

bool check_healer_herb_stam(CharSheet *param_1){
  u8 cVar2;
  bool bVar3;
  s32 iVar1;
  s32 iVar4;
  
  cVar2 = getModdedSkill(param_1->Skills,SKILL_HEALER);
  bVar3 = false;
  if (cVar2 != 0) {
    if (!has_item_func((gGlobals.Party)->inv,itemID_array[31])) {bVar3 = false;}
    else {
      iVar1 = CharStats::getModdedStat(param_1->Stats,STAT_STAM);
      iVar4 = 5 - cVar2;
      if (iVar4 < 1) {iVar4 = 1;}
      bVar3 = iVar4 <= iVar1;
    }
  }
  return bVar3;
}

bool ofunc_check_trouador(CharSheet *param_1){
  char cVar2;
  s32 iVar1;
  bool bVar3;
  s32 iVar4;
  
  cVar2 = getModdedSkill(param_1->Skills,Troubadour);
  if (cVar2 == 0) {bVar3 = false;}
  else {
    iVar1 = CharStats::getModdedStat(param_1->Stats,STAT_STAM);
    iVar4 = 3 - cVar2;
    if (iVar4 < 1) {iVar4 = 1;}
    bVar3 = iVar4 <= iVar1;
  }
  return bVar3;
}

Temp_weapon * Has_Item_equipped_character(CharSheet *param_1,ItemID param_2){
  CharGear *pCVar1;
  temp_gear *ptVar2;
  Temp_weapon *pTVar3;
  u32 uVar4;
  u32 uVar5;
  
  uVar4 = (s32)param_2 & 0xffff;
  uVar5 = uVar4 >> 8;
  if (uVar5 == 6) {pTVar3 = (Temp_weapon *)param_1->armor[1];}
  else {
    if (uVar5 < 7) {
      if (uVar5 != 5) {
        pCVar1 = param_1->pItemList;
LAB_8007b4b0:
        uVar5 = 0;
        if (pCVar1->num_used == 0) {
          return NULL;
        }
        ptVar2 = (temp_gear *)pCVar1->pItem;
        while ((pTVar3 = *(Temp_weapon **)((s32)ptVar2 + uVar5 * 4), pTVar3 == NULL ||
               ((u16)pTVar3->id != uVar4))) {
          uVar5 = uVar5 + 1;
          if ((u8)pCVar1->num_used <= uVar5) {
            return NULL;
          }
          ptVar2 = (temp_gear *)pCVar1->pItem;
        }
        return pTVar3;
      }
      pTVar3 = *(Temp_weapon **)param_1->armor;
    }
    else {
      if (uVar5 != 7) {
        pCVar1 = param_1->pItemList;
        goto LAB_8007b4b0;
      }
      pTVar3 = param_1->weapons;
    }
  }
  if ((pTVar3) && ((u16)pTVar3->id == uVar4)) {
    return pTVar3;
  }
  return NULL;
}

bool Ofunc_boolStaminaForSpell(CharSheet *param_1,Temp_spell *param_2){
  if (param_2) return spell_stamina_subtract(param_1,param_2,check_spell_wizard(param_1,param_2)) <= CharStats::getModdedStat(param_1->Stats,STAT_STAM);
  return false;
}

void malloc_enchant(CharSheet *param_1,SpellEnum param_2,u8 param_3,u8 param_4,u32 timer,s32 param_6){
  Temp_enchant *pTVar2;
  Temp_enchant **ppTVar5;
  u32 uVar6;
  s32 iVar8;
  

  uVar6 = 0;
  while( true ) {
    if (param_1->spellEffects->list[uVar6] == NULL) {
      pTVar2 = (Temp_enchant *)heapAlloc(0x18,FILENAME,0xde3);
      ppTVar5 = param_1->spellEffects->list + uVar6;
      *ppTVar5 = pTVar2;
      CreateTempEnchant(*ppTVar5,param_2,(char)param_3,timer,param_4,0);
      if (param_6 == 0) {
        iVar8 = param_3 * 2;
        if (CharStats::getBaseStat(param_1->Stats,STAT_STAM) < iVar8 + CharStats::getModdedStat(param_1->Stats,STAT_STAM)) {
          iVar8 = CharStats::getBaseStat(param_1->Stats,STAT_STAM) - CharStats::getModdedStat(param_1->Stats,STAT_STAM);
        }
        CharStats::addModdedStat(param_1->Stats,STAT_STAM,(char)iVar8);
      }
      else {mod_stats(param_1,STAT_STAM,(char)((param_3 << 0x19) >> 0x18));}
      return;
    }
    if (0xe < uVar6 + 1) break;
    uVar6++;
  }
  return;
}

s32 func_8007b6bc(CharSheet *param_1,u8 param_2,char param_3){
  s32 iVar1;
  u8 SVar3;
  s32 iVar4;
  
  iVar4 = (s32)param_3;
  if (param_2 == STAT_LV) {
    iVar1 = CharStats::getModdedStat(param_1->Stats,STAT_END);
    if (iVar1 != 0) {return iVar4;}
    SVar3 = STAT_LV;
  }
  else {
    if (param_2 != STAT_END) {return iVar4;}
    SVar3 = STAT_END;
  }
  iVar1 = CharStats::getModdedStat(param_1->Stats,SVar3);
  if ((s32)(char)iVar1 <= -iVar4) {
    iVar4 = (1 - (char)iVar1) * 0x1000000 >> 0x18;
  }
  return iVar4;
}

s32 func_8007b760(CharSheet *param_1,u8 param_2,char param_3){
  s32 iVar1;
  u8 SVar3;
  s32 iVar4;
  
  iVar4 = (s32)param_3;
  if (param_2 == STAT_LV) {
    iVar1 = CharStats::getModdedStat(param_1->Stats,STAT_END);
    if (iVar1 != 0) {return iVar4;}
    SVar3 = STAT_LV;
  }
  else {
    if (param_2 != STAT_END) {return iVar4;}
    SVar3 = STAT_END;
  }
  iVar1 = CharStats::getModdedStat(param_1->Stats,SVar3);
  if ((char)iVar1 <= iVar4) {
    iVar4 = ((char)iVar1 - 1) * 0x1000000 >> 0x18;
  }
  return iVar4;
}


void mod_stats(CharSheet *param_1,u8 param_2,u8 param_3){
  if (!isDead(param_1)) {
    addModdedStats_flag(param_1->Stats,param_2,func_8007b6bc(param_1,param_2,param_3));
  }
}


void remove_stat_buff(CharSheet *param_1,u8 param_2,u8 param_3){
  if (!isDead(param_1)) {
    SubtractModdedStats(param_1->Stats,param_2,func_8007b760(param_1,param_2,param_3));
  }
}

void clear_player_effect(CharSheet *param_1,u32 param_2,CombatEntity *param_3){
  if (param_1->spellEffects->list[param_2]) {
    ReverseSpellEffect(param_1,param_2,param_3);
    func_800840dc(param_1->spellEffects->list[param_2]);
    HeapFree(param_1->spellEffects->list[param_2],FILENAME,0xe7a);
    param_1->spellEffects->list[param_2] = NULL;
  }
}


bool IsDebuffSpell(CharSheet* c,SpellEnum param_1){
  char cVar1;
  SpellEnum *pSVar2;
  SpellEnum debuffSpells [7]=
  {wraithTouch,debilitation,weakness,exhaustion,stupidity,clumsiness,NONE};
  
  pSVar2 = debuffSpells;
  if (param_1 != Immolation) {
    if (debuffSpells[0] != NONE) {
      do {
        cVar1 = *pSVar2++;
        if (param_1 == cVar1) {return true;}
      } while (*pSVar2 != -1);
    }
  }
  return false;
}

u8 get_some_armor_stat(CharSheet *param_1,ItemID param_2){
  u8 bVar2 = 0;
  if (param_1->armor[1]) {bVar2 = param_1->armor[1]->DEF;}
  if (((param_2 != 0) && (param_2 >> 8 == 6)) && (!NoSheildSkill(param_1))) {
    bVar2 = armour_pointer->Armor[GetIDIndex(param_2)].defence;}
  return bVar2;
}

s32 some_armor_func(CharSheet *param_1,ItemID param_2){
  u8 bVar2;
  bool bVar3;
  temp_armor **pptVar4;
  temp_armor *ptVar5;
  u32 uVar6;
  s32 iVar7;
  s32 iVar8;
  
  iVar7 = 0;
  uVar6 = 0;
  pptVar4 = param_1->armor;
  do {
    uVar6++;
    if (*pptVar4) {iVar7+= (u32)(*pptVar4)->Protect;}
    pptVar4++;
  } while (uVar6 < 2);
  if (param_2 != 0) {
    bVar2 = GetIDIndex(param_2));
    iVar8 = 0;
    if (param_2 >> 8 == 5) {
      if (ret0()) {return iVar7;}
    }
    else {
      if (param_2 >> 8 != 6) {return iVar7;}
      if (NoSheildSkill(param_1)) {return iVar7;}
      iVar8 = 1;
    }
    if (*(temp_armor **)((s32)(temp_armor *)param_1->armor + iVar8 * 4)) {
      iVar7-= (u32)(*(temp_armor **)((s32)(temp_armor *)param_1->armor + iVar8 * 4))->Protect;
    }
    iVar7+= armour_pointer->Armor[bVar2].protection;
  }
  return iVar7;
}