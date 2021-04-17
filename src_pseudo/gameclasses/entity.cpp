
bool IsElemental(ItemID param_1){
  byte lVar1;
  bool ret;
  
  if (param_1 >> 8 == 2) {
    Ivar1 = GetIDIndex(param_1);
    if ((((lVar1 == 0xc2) || (lVar1 == 0xc4)) || (lVar1 == 0xc5)) || (lVar1 == 199)) {
      ret = true;}
    else {ret = lVar1 == 0xbf;}
  }
  else {ret = false;}
  return ret;}


ulong init_more_charSheet_data(CharSheet *param_1,Entity_Ram *param_2){
  uint uVar1;
  inv_funcs *piVar2;
  Borg8Enum BVar3;
  Borg_8_header *pBVar4;
  Potion_effect **x;
  int iVar5;
  ulong uVar6;
  ItemID IVar7;
  
  BVar3 = getEntityPortait(param_1->ID);
  pBVar4 = get_borg_8(BVar3);
  param_1->portait = pBVar4;
  x = (Potion_effect **)Malloc(0x1c,s_../gameclasses/entity.cpp_800e02f0,0xc1);
  param_1->potion_effects = x;
  memset(x,0,0x1c);
  iVar5 = getBaseStat(param_1->Stats,Level);
  uVar1 = EXP_TNL[iVar5];
  param_1->weapons = (Temp_weapon *)0x0;
  param_1->EXP->total = uVar1;
  if (param_2->weapon[0] != (ItemID)0xffff) {
    EquipWeapon(param_1,param_2->weapon[0],0);
  }
  if (param_2->weapon[1] == (ItemID)0xffff) {
    IVar7 = param_2->weapon[2];
  }
  else {
    if (param_1->weapons == (Temp_weapon *)0x0) {
      EquipWeapon(param_1,param_2->weapon[1],0);
      IVar7 = param_2->weapon[2];
    }
    else {
      piVar2 = gGlobals.party->Inventory->Functions;
      (*(piVar2->add_to_inv).func)
                ((int)gGlobals.party->Inventory->inv_slots + (short)(piVar2->add_to_inv).arg[0] + -4
                 ,(ulonglong)(ushort)param_2->weapon[1],1);
      IVar7 = param_2->weapon[2];
    }
  }
  uVar6 = 0xffffffff;
  if (IVar7 != (ItemID)0xffff) {
    if (param_1->weapons == (Temp_weapon *)0x0) {
      uVar6 = EquipWeapon(param_1,param_2->weapon[2],0);
    }
    else {
      piVar2 = gGlobals.party->Inventory->Functions;
      uVar6 = (*(piVar2->add_to_inv).func)
                        ((int)gGlobals.party->Inventory->inv_slots +
                         (short)(piVar2->add_to_inv).arg[0] + -4,
                         (ulonglong)(ushort)param_2->weapon[2],1);
    }
  }
  return uVar6;
}



void equip_weapons(CharSheet *param_1,Entity_Ram *param_2){
  Potion_effect **x;
  
  x = (Potion_effect **)Malloc(0x1c,s_../gameclasses/entity.cpp_800e02f0,0xd8);
  param_1->potion_effects = x;
  memset(x,0,0x1c);
  param_1->weapons = (Temp_weapon *)0x0;
  if (param_2->weapon[2] != (ItemID)0xffff) {
    EquipWeapon(param_1,param_2->weapon[2],0);
  }
  if ((param_2->weapon[0] != (ItemID)0xffff) && (param_1->weapons == (Temp_weapon *)0x0)) {
    EquipWeapon(param_1,param_2->weapon[0],0);
  }
  return;
}


void equip_3_weapons(CharSheet *param_1,Entity_Ram *param_2){
  ItemID IVar1;
  
  param_1->weapons = null;
  if (param_2->weapon[0] != (ItemID)-1){EquipWeapon(param_1,param_2->weapon[0],0);}
  if (param_2->weapon[1] != (ItemID)-1){
    if (param_1->weapons == null) {EquipWeapon(param_1,param_2->weapon[1],0);}
  }
  if ((param_2->weapon[2] != (ItemID)-1) && (param_1->weapons == null)) {
    EquipWeapon(param_1,param_2->weapon[2],0);
  }
  return;
}


void create_CharSheet(CharSheet *param_1,ItemID param_2,uint param_3){
  short sVar1;
  byte bVar8;
  CharStats *stats;
  charExp *pcVar2;
  CharSkills *arg0;
  temp_armor **pptVar3;
  CharGear *pCVar4;
  spellbook *psVar5;
  int iVar6;
  Temp_spell *pTVar7;
  effects *x;
  short *psVar9;
  uint uVar10;
  Entity_Ram *pEVar11;
  func *apcStack112 [4];
  
  memset(param_1,0,0x48);
  bVar8 = GetIDIndex(param_2);
  pEVar11 = EntityPointer->entities;
  param_1->ID = param_2;
  pEVar11 += bVar8;
  strlen(pEVar11->Name);
  param_1->name = pEVar11->Name;
  stats = (CharStats *)Malloc(0x1c,s_../gameclasses/entity.cpp_800e02f0,0x101);
  param_1->Stats = stats;
  init_CharStats(stats,param_1->ID);
  pcVar2 = (charExp *)Malloc(0x10,s_../gameclasses/entity.cpp_800e02f0,0x104);
  param_1->EXP = pcVar2;
  init_charExp(pcVar2,param_1->ID);
  arg0 = (CharSkills *)Malloc(0x30,s_../gameclasses/entity.cpp_800e02f0,0x107);
  param_1->Skills = arg0;
  init_char_skills(arg0,param_1->ID);
  pptVar3 = (temp_armor **)Malloc(8,s_../gameclasses/entity.cpp_800e02f0,0x10a);
  param_1->armor = pptVar3;
  *pptVar3 = (temp_armor *)0x0;
  pptVar3[1] = (temp_armor *)0x0;
  if (pEVar11->Sheild != (ItemID)0xffff) {
    Equip_Armor(param_1,pEVar11->Sheild,0);
  }
  if (pEVar11->unk_0x60 != -1) {
    EquipSheild(param_1,pEVar11->unk_0x60,0);
  }
  pCVar4 = (CharGear *)Malloc(8,s_../gameclasses/entity.cpp_800e02f0,0x111);
  param_1->pItemList = pCVar4;
  create_unknown_charsheet_struct(pCVar4,0xc);
  psVar5 = (spellbook *)Malloc(8,s_../gameclasses/entity.cpp_800e02f0,0x114);
  param_1->spellbook = psVar5;
  malloc_spell(psVar5,5);
  uVar10 = 0;
  iVar6 = 0;
  do {
    psVar9 = (short *)(&pEVar11->spells[0].type + iVar6);
    if (*psVar9 != -1) {
      pTVar7 = (Temp_spell *)Malloc(0x24,s_../gameclasses/entity.cpp_800e02f0,0x11a);
      sVar1 = *psVar9;
      *(Temp_spell **)(&param_1->spellbook->spells->id + uVar10 * 2) = pTVar7;
      create_temp_spell(pTVar7,sVar1,pEVar11->Spell_levels[uVar10]);
      param_1->spellbook->spell_count = param_1->spellbook->spell_count + 1;
    }
    uVar10++;
    iVar6 = uVar10 << 1;
  } while (uVar10 < 5);
  x = (effects *)Malloc(0x3c,s_../gameclasses/entity.cpp_800e02f0,0x11f);
  param_1->effects = x;
  memset(x,0,0x3c);
  apcStack112[0] = PTR_init_more_charSheet_data_800e030c;
  apcStack112[1] = PTR_equip_weapons_800e0310;
  apcStack112[2] = blank_func;
  apcStack112[3] = PTR_equip_3_weapons_800e0318;
  (*apcStack112[param_3])(param_1,pEVar11);
  param_1->spellSwitch = 0;
  param_1->some_rand_val = 0xff;
}

void CharSheet_free(CharSheet *param_1){
  CharGear *pCVar1;
  effects *peVar2;
  Potion_effect *pPVar3;
  Borg_8_header *pBVar4;
  Temp_weapon *pTVar5;
  spellbook *psVar6;
  
  if (param_1->EXP != (charExp *)0x0) {
    Free(param_1->EXP,s_../gameclasses/entity.cpp_800e02f0);
    param_1->EXP = (charExp *)0x0;
  }
  if (param_1->armor == (temp_armor **)0x0) {
    pTVar5 = param_1->weapons;
  }
  else {
    if (*param_1->armor != (temp_armor *)0x0) {
      pssto_clear_weapon_effects();
      Free(*param_1->armor,s_../gameclasses/entity.cpp_800e02f0);
      *param_1->armor = (temp_armor *)0x0;
    }
    if (param_1->armor[1] != (temp_armor *)0x0) {
      pssto_clear_weapon_effects();
      Free(param_1->armor[1],s_../gameclasses/entity.cpp_800e02f0);
      param_1->armor[1] = (temp_armor *)0x0;
    }
    Free(param_1->armor,s_../gameclasses/entity.cpp_800e02f0);
    param_1->armor = (temp_armor **)0x0;
    pTVar5 = param_1->weapons;
  }
  if (pTVar5 == (Temp_weapon *)0x0) {
    pCVar1 = param_1->pItemList;
  }
  else {
    passto_clear_weapon_effects(pTVar5);
    Free(param_1->weapons,s_../gameclasses/entity.cpp_800e02f0);
    param_1->weapons = (Temp_weapon *)0x0;
    pCVar1 = param_1->pItemList;
  }
  if (pCVar1 == (CharGear *)0x0) {
    psVar6 = param_1->spellbook;
  }
  else {
    FUN_8007d7dc();
    Free(param_1->pItemList,s_../gameclasses/entity.cpp_800e02f0);
    param_1->pItemList = (CharGear *)0x0;
    psVar6 = param_1->spellbook;
  }
  if (psVar6 == (spellbook *)0x0) {
    peVar2 = param_1->effects;
  }
  else {
    spellbok_free(psVar6);
    Free(param_1->spellbook,s_../gameclasses/entity.cpp_800e02f0);
    param_1->spellbook = (spellbook *)0x0;
    peVar2 = param_1->effects;
  }
  if (peVar2 == (effects *)0x0) {
    pPVar3 = (Potion_effect *)param_1->potion_effects;
  }
  else {
    remove_effects(param_1);
    Free(param_1->effects,s_../gameclasses/entity.cpp_800e02f0);
    param_1->effects = (effects *)0x0;
    pPVar3 = (Potion_effect *)param_1->potion_effects;
  }
  if (pPVar3 == (Potion_effect *)0x0) {
    pBVar4 = param_1->portait;
  }
  else {
    clear_charsheet_potions(param_1);
    Free(param_1->potion_effects,s_../gameclasses/entity.cpp_800e02f0);
    param_1->potion_effects = (Potion_effect **)0x0;
    pBVar4 = param_1->portait;
  }
  if (pBVar4 != (Borg_8_header *)0x0) {
    AllocFreeQueueItem(&queueStructA,&param_1->portait,4,0);
    param_1->portait = (Borg_8_header *)0x0;
  }
  if (param_1->Stats != (CharStats *)0x0) {
    Free(param_1->Stats,s_../gameclasses/entity.cpp_800e02f0);
    param_1->Stats = (CharStats *)0x0;
  }
  if (param_1->Skills != (CharSkills *)0x0) {
    Free(param_1->Skills,s_../gameclasses/entity.cpp_800e02f0);
    param_1->Skills = (CharSkills *)0x0;
  }
  return;
}

char getHPMax(CharSheet *param_1){
  char ret;
  
  if (param_1->Stats == null) {ret = 0;}
  else {
    ret = getBaseStat(param_1->Stats,END) + getBaseStat(param_1->Stats,STAM)  + getBaseStat(param_1->Stats,LV);}
  return ret;}

uint getHPCurrent(CharSheet *param_1){
  uint max;
  uint ret = 0;
  if (param_1->Stats != null) {
    ret = getModdedStat(param_1->Stats,END) + getModdedStat(param_1->Stats,STAM) + getModdedStat(param_1->Stats,LV);
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
  bool ret;

  if (param_1->Stats == null) {ret = false;}
  else {ret = getHPCurrent(param_1) == 0;}
  return ret;}

void damage_func(CharSheet *param_1,short dmg){
  int iVar1;
  char cVar2;
  CharStats *stat;
  StatEnum arg1;
  
  iVar1 = getModdedStat(param_1->Stats,STAM);
  stat = param_1->Stats;
  if (iVar1 < dmg) {
    iVar1 = getModdedStat(stat,STAM);
    dmg = (dmg - iVar1) * 0x10000 >> 0x10;
    cVar2 = getModdedStat(param_1->Stats,STAM);
    addModdedStat(param_1->Stats,STAM,-cVar2);
    if (dmg < 1) {
      return;
    }
    iVar1 = getModdedStat(param_1->Stats,END);
    stat = param_1->Stats;
    if (iVar1 < dmg) {
      cVar2 = getModdedStat(stat,END);
      addModdedStat(param_1->Stats,END,-cVar2);
      return;
    }
    arg1 = END;
  }
  else {arg1 = STAM;}
  addModdedStat(stat,arg1,-(char)dmg);}

bool hasCheatDeath(CharSheet *param_1){
  effects *peVar1;
  uint uVar2;
  
  uVar2 = 0;
  peVar1 = param_1->effects;
  while( true ) {
    uVar2++;
    if ((peVar1->list[0] != (Temp_enchant *)0x0) && (peVar1->list[0]->index == cheatDeath)) break;
    peVar1 = (effects *)(peVar1->list + 1);
    if (0xe < uVar2) {
      return false;
    }
  }
  return true;
}

void func_checking_cheat_death(CharSheet *param_1,short param_2,CombatEntity *param_3){
  Temp_enchant *pTVar1;
  int lVar2;
  short sVar3;
  char cVar4;
  bool bVar5;
  CharStats *pCVar6;
  effects *peVar7;
  uint uVar8;
  
  if (param_3 != (CombatEntity *)0x0) {
    lVar2 = CombatEnt_flag_2(param_3);
    if (lVar2 == 0) {
      pCVar6 = param_1->Stats;
      goto LAB_80077df0;
    }
    FUN_8006f2cc(param_3);
  }
  pCVar6 = param_1->Stats;
LAB_80077df0:
  sVar3 = getModdedStat(pCVar6,LV);
  if (sVar3 < param_2) {
    sVar3 = getModdedStat(param_1->Stats,LV);
    cVar4 = getModdedStat(param_1->Stats,LV);
    addModdedStat(param_1->Stats,LV,-cVar4);
    damage_func(param_1,param_2 - sVar3);
    bVar5 = isDead(param_1);
    uVar8 = 0;
    if (bVar5 != false) {
      peVar7 = param_1->effects;
      do {
        pTVar1 = peVar7->list[0];
        if ((pTVar1 != (Temp_enchant *)0x0) && (pTVar1->index == cheatDeath)) {
          addHP(param_1,(short)((int)(char)pTVar1->field_0x3 << 1));
          clear_player_effect(param_1,uVar8 & 0xff,param_3);
          return;
        }
        uVar8 = uVar8 + 1;
        peVar7 = (effects *)(peVar7->list + 1);
      } while (uVar8 < 0xf);
      if (param_3 != (CombatEntity *)0x0) {
        clear_combatEnt_effects(param_3);
      }
      clear_charsheet_potions(param_1);
      bVar5 = isDead(param_1);
      if (bVar5 == false) {
        FUN_8007b23c(param_1);
      }
    }
  }
  else {
    addModdedStat(param_1->Stats,LV,-(char)param_2);
  }
  return;
}


void addHP(CharSheet *param_1,short param_2){
  int iVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  
  uVar3 = (int)param_2 & 0xffff;
  iVar1 = getModdedStat(param_1->Stats,END);
  iVar2 = getBaseStat(param_1->Stats,END);
  uVar4 = uVar3;
  if (iVar1 < iVar2) {
    iVar1 = getBaseStat(param_1->Stats,END);
    iVar2 = getModdedStat(param_1->Stats,END);
    uVar4 = iVar1 - iVar2 & 0xff;
    if (uVar3 < uVar4) {
      uVar4 = 0;
      addModdedStat(param_1->Stats,END,(char)uVar3);
    }
    else {
      addModdedStat(param_1->Stats,END,(char)uVar4);
      uVar4 = uVar3 - uVar4;
    }
  }
  if (uVar4 != 0) {
    iVar1 = getModdedStat(param_1->Stats,STAM);
    iVar2 = getBaseStat(param_1->Stats,STAM);
    uVar3 = uVar4;
    if (iVar1 < iVar2) {
      iVar1 = getBaseStat(param_1->Stats,STAM);
      iVar2 = getModdedStat(param_1->Stats,STAM);
      uVar3 = iVar1 - iVar2;
      if (uVar4 < uVar3) {
        uVar3 = 0;
        addModdedStat(param_1->Stats,STAM,(char)uVar4);
      }
      else {
        addModdedStat(param_1->Stats,STAM,(char)uVar3);
        uVar3 = uVar4 - uVar3;
      }
    }
    if (uVar3 != 0) {
      iVar1 = getModdedStat(param_1->Stats,LV);
      iVar2 = getBaseStat(param_1->Stats,LV);
      if (iVar1 < iVar2) {
        iVar1 = getBaseStat(param_1->Stats,LV);
        iVar2 = getModdedStat(param_1->Stats,LV);
        uVar4 = iVar1 - iVar2;
        if (uVar3 < uVar4) {
          addModdedStat(param_1->Stats,LV,(char)uVar3);
        }
        else {
          addModdedStat(param_1->Stats,LV,(char)uVar4);
        }
      }
    }
  }
  return;
}

void calc_stamina_change(CharSheet *param_1,bool param_2){
  int iVar2;
  
  if (param_2 == false) {
    iVar2 = getBaseStat(param_1->Stats,STAM); - getModdedStat(param_1->Stats,STAM);
  }
  else {iVar2 = (int)((float)getBaseStat(param_1->Stats,STAM) * 0.8f) - getModdedStat(param_1->Stats,STAM);}
  if (0 < iVar2 * 0x1000000 >> 0x18) {
    addModdedStat(param_1->Stats,STAM,(char)((uint)(iVar2 * 0x1000000) >> 0x18));
  }
  return;
}

byte ret0(void){return 0;}

bool NoSheildSkill(CharSheet *param_1){return getModdedSheild(param_1->Skills) == 0;}

byte canEquipWeapon(CharSheet *param_1,ItemID param_2){
  byte bVar2;
  int iVar1;
  char cVar3;
  weapon_ram *pcVar4;
  
  bVar2 = GetIDIndex(param_2);
  pcVar4 = weapon_pointer->weapons[bVar2];
  iVar1 = getBaseStat(param_1->Stats,STR);
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


int something_with_gear_INT(CharSheet *param_1,ItemID param_2){
  Gear_RAM *pGVar1;
  int iVar3 = 1;
  if (FUN_8007d938(param_1->pItemList)) {
    iVar3 = search_item_array(param_2);
    pGVar1 = item_pointer->Gear;
    if (getBaseStat(param_1->Stats,STR) < (int)(uint)pGVar1[iVar3].STR) {iVar3 = 3;}
    else {
      iVar3 = (uint)(getBaseStat(param_1->Stats,INT) < (int)(uint)pGVar1[iVar3].INT) << 1;
    }
  }
  return iVar3;
}


void Equip_Armor(CharSheet *param_1,undefined2 param_2,byte (*param_3) [2]){
  equip_armor_sheild(param_1,param_2,param_3,false);}

bool EquipSheild(CharSheet *param_1,undefined2 param_2,byte (*param_3) [2]){
  bool uVar1 = NoSheildSkill(param_1);
  if (uVar1 == false) {
    equip_armor_sheild(param_1,param_2,param_3,true);
    uVar1 = false;}
  return uVar1;
}

byte EquipWeapon(CharSheet *param_1,undefined2 param_2,byte (*param_3) [2]){
  byte bVar2;
  Temp_weapon *pTVar1;
  
  bVar2 = canEquipWeapon(param_1,param_2);
  if (bVar2 == 0) {
    pTVar1 = (Temp_weapon *)Malloc(0x2c,s_../gameclasses/entity.cpp_800e02f0,0x377);
    param_1->weapons = pTVar1;
    createTempWeapon(pTVar1,param_2);
    FUN_800784c8(param_1,param_1->weapons,param_3,0);
    bVar2 = 0;
  }
  return bVar2;
}

bool FUN_8007840c(CharSheet *param_1,undefined2 param_2,byte (*param_3) [2]){
  CharGear *pCVar1;
  Temp_gear *pTVar2;
  bool lVar3;
  int iVar4;
  
  lVar3 = something_with_gear_INT(param_1,param_2);
  if (lVar3 == 0) {
    malloc_temp_gear(param_1->pItemList,param_2);
    pCVar1 = param_1->pItemList;
    iVar4 = FUN_8007daa8(pCVar1,param_2);
    pTVar2 = pCVar1->pItem[iVar4];
    FUN_800784c8(param_1,pTVar2,param_3,1);
    param_1->EXP->protection+= pTVar2->Protection;
    lVar3 = 0;
    param_1->EXP->damage+= pTVar2->Damage;
  }
  return lVar3;
}

void FUN_800784c8(CharSheet *param_1,Temp_weapon *param_2,byte (*param_3) [2],int param_4){
  byte (*pabVar1) [2];
  longlong lVar2;
  undefined uVar3;
  
  pabVar1 = param_2->SkillMod;
  if ((pabVar1 != (byte (*) [2])0x0) &&
     (lVar2 = capskillBaseMax(param_1->Skills,(*pabVar1)[0]), lVar2 != 0)) {
    some_moddedSkillCheck(param_1->Skills,(*pabVar1)[0],(*pabVar1)[1]);
  }
  if (param_3 == (byte (*) [2])0x0) {
    param_3 = param_2->Stat;
  }
  else {
    if (param_2->Stat != (byte (*) [2])0x0) {
      Free(param_2->Stat,s_../gameclasses/entity.cpp_800e02f0);
    }
    param_2->Stat = param_3;
  }
  if (param_3 != (byte (*) [2])0x0) {
    if ((*param_3)[0] == 5) {
      param_1->spellSwitch = 0;
      goto LAB_8007859c;
    }
    uVar3 = FUN_8007b6bc(param_1,(*param_3)[0],(*param_3)[1]);
    if ((*param_3)[0] != END) {
      addtoModdedStats(param_1->Stats,(*param_3)[0],uVar3);
      param_1->spellSwitch = 0;
      goto LAB_8007859c;
    }
    addModdedStats_flag(param_1->Stats,END,uVar3);
  }
  param_1->spellSwitch = 0;
LAB_8007859c:
  if (param_4 != 0) {
    FUN_8007ad40(param_1,param_2);
  }
  return;
}

void equip_armor_sheild(CharSheet *param_1,undefined2 param_2,byte (*param_3) [2],bool sheild){
  temp_armor *ptVar1;
  
  ptVar1 = (temp_armor *)Malloc(0x28,s_../gameclasses/entity.cpp_800e02f0,0x3df);
  param_1->armor[sheild] = ptVar1;
  make_temp_armor_3(ptVar1,param_2);
  FUN_800784c8(param_1,(Temp_weapon *)param_1->armor[sheild],param_3,1);
  addtoModdedStats(param_1->Stats,DEX,param_1->armor[sheild]->dex);
  some_moddedSkillCheck(param_1->Skills,Stealth,param_1->armor[sheild]->stealth);
}

void remove_chestArmor(CharSheet *param_1){remove_armor(param_1,0);}
void remove_sheild(CharSheet *param_1){remove_armor(param_1,1);}

void remove_armor(CharSheet *param_1,byte param_2){
  if ((Temp_weapon *)param_1->armor[param_2] != null) {
    FUN_80078874(param_1,(Temp_weapon *)param_1->armor[param_2],true);
    subtractFromModdedStats(param_1->Stats,DEX,param_1->armor[param_2]->dex);
    some_moddedSkillCheck(param_1->Skills,Stealth,-param_1->armor[param_2]->stealth);
    pssto_clear_weapon_effects(param_1->armor[param_2]);
    Free(param_1->armor[param_2],s_../gameclasses/entity.cpp_800e02f0);
    param_1->armor[param_2] = null;
  }
}

void unequp_weapons(CharSheet *param_1){
  if (param_1->weapons != (Temp_weapon *)0x0) {
    FUN_80078874(param_1,param_1->weapons,false);
    passto_clear_weapon_effects(param_1->weapons);
    Free(param_1->weapons,s_../gameclasses/entity.cpp_800e02f0);
    param_1->weapons = (Temp_weapon *)0x0;
  }
}

void unequip_acc(CharSheet *param_1,byte param_2){
  temp_gear *pTVar1;
  
  pTVar1 = param_1->pItemList->pItem[param_2];
  if (pTVar1 != null) {
    FUN_80078874(param_1,(Temp_weapon *)pTVar1,true);
    param_1->EXP->protection-= pTVar1->Protection;
    param_1->EXP->damage-= pTVar1->damage;
    FUN_8007da24(param_1->pItemList,param_2);
  }
}

void FUN_80078874(CharSheet *param_1,Temp_weapon *param_2,bool param_3){
  Temp_enchant *pTVar1;
  longlong lVar2;
  undefined uVar3;
  uint uVar4;
  effects *peVar5;
  byte (*skilmod) [2];
  
  skilmod = param_2->SkillMod;
  if (skilmod == (byte (*) [2])0x0) {
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
  if (skilmod != (byte (*) [2])0x0) {
    if ((*skilmod)[0] == STAM) {
      param_1->spellSwitch = 0;
      goto LAB_8007893c;
    }
    uVar3 = FUN_8007b760(param_1,(*skilmod)[0],(*skilmod)[1]);
    if ((*skilmod)[0] != END) {
      subtractFromModdedStats(param_1->Stats,(*skilmod)[0],uVar3);
      param_1->spellSwitch = 0;
      goto LAB_8007893c;
    }
    SubtractModdedStats(param_1->Stats,3,uVar3);
  }
  param_1->spellSwitch = 0;
LAB_8007893c:
  if ((param_3 != false) && (param_2->enchantment != (Temp_enchant *)0x0)) {
    uVar4 = 0;
    peVar5 = param_1->effects;
    do {
      pTVar1 = peVar5->list[0];
      if (((pTVar1 != (Temp_enchant *)0x0) && (pTVar1->index == param_2->enchantment->index)) &&
         (pTVar1->timer == -1)) {
        clear_player_effect(param_1,uVar4,(CombatEntity *)0x0);
        return;
      }
      uVar4 = uVar4 + 1;
      peVar5 = (effects *)(peVar5->list + 1);
    } while (uVar4 < 0xf);
  }
  return;
}

void remove_all_equip(CharSheet *param_1){
  uint uVar1;
  
  unequp_weapons(param_1);
  remove_sheild(param_1);
  remove_chestArmor(param_1);
  uVar1 = 0;
  if (param_1->pItemList->num_used != 0) {
    do {
      unequip_acc(param_1,uVar1);
      uVar1++;
    } while (uVar1 < param_1->pItemList->num_used);
  }
  return;
}

bool has_potion_effect(CharSheet *param_1,PotionEnum param_2){
  uint uVar2=0;
  Potion_effect *pPVar1;
  
  while ((pPVar1 = param_1->potion_effects[uVar2]), pPVar1 == null || (pPVar1->ID != param_2))) {
    uVar2++;
    if (6 < uVar2) {return false;}
  }
  return true;
}

void Buffing_potion_effect(CharSheet *param_1,PotionEnum param_2,byte param_3,uint param_4){
  Potion_effect *pPVar1;
  uint uVar2;
  CharSkills *arg0;
  StatEnum uVar3;
  SkillEnum arg1;
  
  
  uVar2 = 0;
  while (param_1->potion_effects[uVar2] != (Potion_effect *)0x0) {
    if (6 < uVar2 + 1) {return;}
    pPVar1 = (Potion_effect *)param_1->potion_effects;
    uVar2++;
  }
  pPVar1 = (Potion_effect *)Malloc(0xc,s_../gameclasses/entity.cpp_800e02f0,0x4a1);
  param_1->potion_effects[uVar2] = pPVar1;
  make_charsheet_potion(pPVar1,param_2,param_3,param_4);
  switch(param_2) {
  case STRENGTH:
    uVar3 = STR;
    goto LAB_80078b24;
  case DEXTERITY:
    uVar3 = DEX;
LAB_80078b24:
    mod_stats(param_1,uVar3,10);
    return;
  default:
    goto LAB_80078b74;
  case CLARITY:
    arg1 = Loremaster;
    break;
  case CHARISMA:
    arg1 = Diplomat;
    break;
  case STEALTH:
    arg1 = Stealth;
  }
  some_moddedSkillCheck(param_1->Skills,arg1,3);
LAB_80078b74:
  return;
}

void remove_potion_effect(CharSheet *param_1,byte param_2){
  CharSkills *arg0;
  StatEnum SVar1;
  SkillEnum arg1;
  
  if (param_1->potion_effects[param_2] == null) {return;}
  switch(param_1->potion_effects[param_2]->ID) {
  case STRENGTH:
    SVar1 = STR;
    break;
  case DEXTERITY:
    SVar1 = DEX;
    break;
  default:
    goto Lab_return;
  case CLARITY:
    arg0 = param_1->Skills;
    arg1 = Loremaster;
    goto remove_skill_buff;
  case CHARISMA:
    arg0 = param_1->Skills;
    arg1 = Diplomat;
remove_skill_buff:
    some_moddedSkillCheck(arg0,arg1,-3);
    return;
  case STEALTH:
    some_moddedSkillCheck(param_1->Skills,Stealth,-3);
    goto Lab_return;
  }
  remove_stat_buff(param_1,SVar1,10);
Lab_return:
  return;
}

bool inc_charsheet_potion(CharSheet *param_1,bool param_2,byte param_3){
  Potion_effect **paVar3;
  uint uVar2;
  uint uVar3;
    
  if (!isDead(param_1)) {
    uVar3 = 0;
    paVar3 = param_1->potion_effects;
    while( true ) {
      if (paVar3[uVar3] != (Potion_effect *)0x0) {
        if (param_2 == false) {uVar2 = 0;}
        else {uVar2 = (uint)TerrainPointer->a;}
        if (check_charsheet_potion_timer(paVar3[uVar3],uVar2,param_3)) {
          clear_charsheet_potion(param_1,uVar3);}
      }
      uVar3++;
      if (6 < uVar3) break;
      paVar3 = param_1->potion_effects;
    }
  }
  return false;
}


void clear_charsheet_potion(CharSheet *param_1,uint param_2)

{
  uint uVar1;
  
  uVar1 = param_2 & 0xff;
  if (param_1->potion_effects[uVar1] != (Potion_effect *)0x0) {
    remove_potion_effect(param_1,uVar1);
    func_with_potion_unk2(param_1->potion_effects[uVar1]);
    Free(param_1->potion_effects[uVar1],s_../gameclasses/entity.cpp_800e02f0);
    param_1->potion_effects[uVar1] = (Potion_effect *)0x0;
  }
  return;
}

void clear_exhaustion(CharSheet *param_1){
  effects *peVar1;
  uint uVar2;
  
  uVar2 = 0;
  peVar1 = param_1->effects;
  while( true ) {
    if ((peVar1->list[uVar2] != null) && (peVar1->list[uVar2]->index == exhaustion))
    {clear_player_effect(param_1,uVar2,null);}
    uVar2++;
    if (0xe < uVar2) break;
  }
  calc_stamina_change(param_1,false);
  return;
}


bool can_use_potion(CharSheet *param_1,PotionEnum param_2,char *param_3){
  uint uVar1;
  int iVar2;
  int iVar3;
  bool bVar4;
  bool bVar6;
  effects *peVar5;
  char *c2;
  uint uVar6;
  
  switch(param_2) {
  case HEALING:
  case CURING:
    if (param_3 != null) {strcpy(param_3,s_That_potion_cannot_be_used_right_800e0368);}
    bVar6 = getHPCurrent(param_1) != getHPMax(param_1);
    break;
  case STAMINA:
    uVar6 = 0;
    peVar5 = param_1->effects;
    do {
      uVar6++;
      if ((peVar5->list[0] != (Temp_enchant *)0x0) && (peVar5->list[0]->index == exhaustion)) {
        return true;
      }
      peVar5 = (effects *)(peVar5->list + 1);
    } while (uVar6 < 0xf);
    if (param_3 != (char *)0x0) {strcpy(param_3,s_That_potion_cannot_be_used_right_800e0368);}
    bVar6 = getModdedStat(param_1->Stats,STAM) < getBaseStat(param_1->Stats,STAM);
    break;
  case ANTIDOTE:
    uVar6 = 0;
    peVar5 = param_1->effects;
    do {
      uVar6 = uVar6 + 1;
      if ((peVar5->list[0] != (Temp_enchant *)0x0) && (peVar5->list[0]->index == poison)) {
        return true;
      }
      peVar5 = (effects *)(peVar5->list + 1);
    } while (uVar6 < 0xf);
    if (param_3 != (char *)0x0) {
      c2 = s_That_potion_cannot_be_used_right_800e0368;
LAB_80078fb4:
      strcpy(param_3,c2);}
    goto LAB_80078fbc;
  case RESTORE:
    uVar6 = 0;
    peVar5 = param_1->effects;
    while( true ) {
      bVar4 = IsDebuffSpell((SpellEnum)peVar5->list[uVar6]);
      uVar6++;
      if (bVar4 != false) break;
      if (0xe < uVar6) {
        if (param_3 == (char *)0x0) goto LAB_80078fbc;
        c2 = s_That_potion_cannot_be_used_right_800e0368;
        goto LAB_80078fb4;
      }
      peVar5 = param_1->effects;
    }
    bVar6 = true;
    break;
  case STRENGTH:
  case DEXTERITY:
  case CLARITY:
  case CHARISMA:
  case DEFENCE:
  case STEALTH:
    if (param_3 != (char *)0x0) {strcpy(param_3,s_That_potion_cannot_be_used_right_800e0368);}
    bVar6 = (bool)(has_potion_effect(param_1,param_2) ^ 1);
    break;
  default:
    if (param_3 != (char *)0x0) {
      c2 = s_That_potion_cannot_be_used_in_Tr_800e0390;
      goto LAB_80078fb4;}
LAB_80078fbc:
    bVar6 = false;}
  return bVar6;}

bool clear_debuff_spells(CharSheet *param_1){
  bool bVar1;
  effects *peVar2;
  uint uVar3;
  bool bVar4;
  
  bVar4 = false;
  uVar3 = 0;
  peVar2 = param_1->effects;
  while( true ) {
    bVar1 = IsDebuffSpell((SpellEnum)peVar2->list[uVar3]);
    if (bVar1 != false) {
      clear_player_effect(param_1,uVar3,null);
      bVar4 = true;
    }
    uVar3++;
    if (0xe < uVar3) break;}
  return bVar4;
}

bool potion_effects(CharSheet *param_1,byte param_2,PotionEnum param_3,char *param_4){
  inv_funcs *piVar1;
  bool bVar2;
  
  if (!can_use_potion(param_1,param_3,param_4)) {bVar2 = false;}
  else {
    switch(param_3) {
    case HEALING:
      potion_heal(param_1,0xf,0x19);
      break;
    case STAMINA:
      clear_exhaustion(param_1);
      break;
    case CURING:
      potion_heal(param_1,0x28,0x3c);
      break;
    case ANTIDOTE:
      Effect_CaseSwitch_add(param_1,removePoison,0,0,0xff,0);
      break;
    case RESTORE:
      clear_debuff_spells(param_1);
      break;
    case STRENGTH:
    case DEXTERITY:
    case J:
    case CLARITY:
    case CHARISMA:
    case DEFENCE:
    case STEALTH:
      Buffing_potion_effect(param_1,param_3,0,0x9e340);
    }
    piVar1 = gGlobals.party->Inventory->Functions;
    (*(piVar1->search).func)
              ((int)gGlobals.party->Inventory->inv_slots + (short)(piVar1->search).arg[0] + -4,
               param_2,-1);
    bVar2 = true;
  }
  return bVar2;
}

bool IsNotAffected(CharSheet *param_1,SpellEnum param_2){
  effects *peVar1;
  uint uVar2;
  
  uVar2 = 0;
  peVar1 = param_1->effects;
  while( true ) {
    uVar2++;
    if ((peVar1->list[0] != (Temp_enchant *)0x0) && (peVar1->list[0]->index == param_2)) break;
    peVar1 = (effects *)(peVar1->list + 1);
    if (0xe < uVar2) {
      return false;
    }
  }
  return true;
}

byte ret1_800791c8(void){return 1;}

 int print_element_resist(resist_float *param_1,char *param_2,char *param_3,uint param_4){
  uint uVar1= param_4;
  char *pcVar2;
  
  if (param_1->element != NONE) {
    pcVar2 = "Immune_to_%s";
    if (0.0 < param_1->percent) {pcVar2 = "Resistant_to_%s";}
    if (2.0f <= param_1->percent) {pcVar2 = "Vulnerable_to_%s";}
    os::sprintf(param_3,pcVar2,element_labels[param_1->element]);
    uVar1 = append_SenseAura_text(param_2,param_3,param_4);
  }
  return uVar1;
}

void senseAura(CombatEntity *target,byte level)

{
  CharSheet *pCVar1;
  uint uVar3;
  undefined8 uVar2;
  int iVar4;
  widgetStruct *pwVar5;
  resist_float *prVar6;
  uint uVar7;
  char acStack1064 [832];
  char acStack232 [64];
  color col1;
  color col2;
  
  pCVar1 = target->CharSheet;
  os::sprintf(acStack1064,"%s\n",pCVar1->name);
  uVar3 = strlen(acStack1064);
  if (level != 0) {
    strcpy(acStack232,"Follower");
    if ((target->index == gGlobals.Combat->leaderIndex) && (gGlobals.Combat->leaderDead == 0)) {
      strcpy(acStack232,"Leader");}
    uVar3 = append_SenseAura_text(acStack1064,acStack232,uVar3);
  }
  if (2 < level) {
    os::sprintf(acStack232,"%d_Total_Hitpoints",getHPMax(pCVar1));
    uVar3 = append_SenseAura_text(acStack1064,acStack232,uVar3);
  }
  if (4 < level) {
    os::sprintf(acStack232,"Level_%lu",getBaseStat(pCVar1->Stats,LV));
    uVar3 = append_SenseAura_text(acStack1064,acStack232,uVar3);
  }
  if (6 < level) {
    uVar7 = 0;
    prVar6 = target->resists;
    do {
      uVar3 = print_element_resist(prVar6,acStack1064,acStack232,uVar3);
      uVar7++;
      prVar6++;
    } while (uVar7 < 2);
  }
  if (8 < level) {
    os::sprintf(acStack232,"Total Armor Protection %d",get_protection_level(target,false));
    uVar3 = append_SenseAura_text(acStack1064,acStack232,uVar3);
  }
  col1 = OFFWHITE;
  col2.R = 0x32;
  col2.G = 0x32;
  col2.B = 0x32;
  col2.A = 0x96;
  pwVar5 = some_textbox_func(acStack1064,(short)(uVar3 << 3) - (short)uVar3,&col1,&col2,1);
  gGlobals.Combat->Widget0x4fb8 = pwVar5;
  return;
}

int find_free_effect_slot(CharSheet *param_1){
  effects *peVar1;
  int iVar2;
  
  iVar2 = 0;
  peVar1 = param_1->effects;
  do {
    if (peVar1->list[0] == (Temp_enchant *)0x0) {
      return iVar2;
    }
    iVar2 = iVar2 + 1;
    peVar1 = (effects *)(peVar1->list + 1);
  } while (iVar2 < 0xf);
  return -1;
}


short Effect_CaseSwitch_add
                (CharSheet *param_1,SpellEnum param_2,byte Lv,undefined4 param_4,byte param_5,
                CombatEntity *param_6){
  combat_ai *pcVar1;
  bool bVar2;
  longlong lVar3;
  uint uVar5;
  bool bVar10;
  int iVar6;
  bool bVar11;
  longlong lVar4;
  short sVar8;
  Temp_enchant *pTVar7;
  Temp_enchant **ppTVar12;
  CharStats *stat;
  StatEnum SVar13;
  undefined uVar14;
  int iVar15;
  uint Lv;
  uint uVar16;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  byte bVar9;
  
  uVar18 = 0;
  uVar17 = 0;
  bVar2 = true;
  uVar16 = 0;
  bVar9 = GetIDIndex(param_1->ID);
  lVar3 = (longlong)(char)bVar9;
  uVar5 = find_free_effect_slot(param_1);
  bVar10 = IsNotAffected(param_1,param_2);
  if (bVar10 == false) {uVar16 = ~uVar5 >> 0x1f;}
  sVar8 = (short)uVar5;
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
    if ((param_6 != (CombatEntity *)0x0) &&
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
    if (uVar16 != 0) {
      param_1->EXP->protection = param_1->EXP->protection + (char)(Lv << 1);
    }
    break;
  case ControlElem:
    uVar19 = uVar17;
    bVar10 = true;
    if (((uVar16 == 0) || (param_6 == (CombatEntity *)0x0)) ||
       (bVar11 = IsElemental(param_1->ID), uVar19 = uVar18, bVar10 = bVar2, bVar11 == false)) break;
    goto control_magic;
  case debilitation:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = STR;
    goto lower_stat;
  case strength:
    if (uVar16 == 0) break;
    SVar13 = STR;
    uVar14 = (undefined)((Lv << 0x19) >> 0x18);
    goto mod_stat;
  case teleportation:
    teleportation_spell(param_6);
    uVar19 = uVar17;
    bVar10 = false;
    break;
  case brilliance:
    if (uVar16 == 0) break;
    SVar13 = INT;
    uVar14 = (undefined)((Lv << 0x19) >> 0x18);
    goto mod_stat;
  case stupidity:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = INT;
    goto lower_stat;
  case charming:
    uVar19 = uVar17;
    bVar10 = true;
    if ((uVar16 == 0) || (param_6 == (CombatEntity *)0x0)) break;
    goto control_magic;
  case controlMarquis:
    uVar19 = uVar17;
    bVar10 = true;
    if ((uVar16 == 0) ||
       (lVar4 = 0xaa, uVar19 = uVar18, bVar10 = bVar2, param_6 == (CombatEntity *)0x0)) break;
LAB_800798b0:
    uVar19 = uVar17;
    bVar10 = true;
    if (lVar3 != lVar4) break;
    goto control_magic;
  case endurance:
    if (uVar16 == 0) break;
    SVar13 = END;
    uVar14 = (undefined)((Lv << 0x19) >> 0x18);
    goto mod_stat;
  case senseAura:
    bVar10 = false;
    if (param_6 != (CombatEntity *)0x0) {
      senseAura(param_6,(char)Lv);
      uVar19 = uVar17;
      bVar10 = false;
    }
    break;
  case weakness:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = END;
    goto lower_stat;
  case auraOfDeath:
  case solarWraith:
    bVar10 = true;
    uVar19 = uVar17;
    if (((uVar16 != 0) && (uVar16 = 0, param_6 != (CombatEntity *)0x0)) &&
       (pcVar1 = param_6->combat_ai_pointer, pcVar1 != (combat_ai *)0x0)) {
      uVar16 = 1;
      bVar9 = pcVar1->field_0x6;
      if (bVar9 < Lv) {
        Lv = (uint)bVar9;
      }
      pcVar1->field_0x6 = bVar9 - (char)Lv;
      param_6->combat_ai_pointer->field_0x9 = param_6->combat_ai_pointer->field_0x9 | 2;
      uVar19 = 1;
      bVar10 = bVar2;
    }
    break;
  case wraithTouch:
    if (uVar16 != 0) {
      Wraith_touch(param_1,uVar5 & 0xff);
      return sVar8;
    }
    break;
  case controlZombies:
    uVar19 = uVar17;
    bVar10 = true;
    if ((uVar16 == 0) || (uVar19 = uVar18, bVar10 = bVar2, param_6 == (CombatEntity *)0x0)) break;
    lVar4 = 0xb6;
    if (lVar3 != 0xbe) goto LAB_800798b0;
control_magic:
    bVar9 = ret1_800791c8();
    uVar19 = uVar18;
    bVar10 = bVar2;
    if (bVar9 != 0) {
      CombatEnt_XOR_flags(param_6,flag5);
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
    SVar13 = STAM;
    goto lower_stat;
  case stamina:
    if (uVar16 == 0) break;
    SVar13 = STAM;
    goto lower_stat;
  case tapStamina:
    iVar15 = Lv << 1;
    if (uVar16 != 0) {
      iVar6 = getModdedStat(param_1->Stats,STAM);
      stat = param_1->Stats;
      if (iVar6 < iVar15) {
        iVar15 = getModdedStat(stat,STAM);
        stat = param_1->Stats;
      }
      addModdedStat(stat,STAM,-(char)iVar15);
      uVar19 = 1;
      bVar10 = true;
    }
    break;
  case wallOfBones:
  case frozenDoom:
  case webOfStarlight:
                    /* fail with Shadow */
    if (lVar3 == 0xac) {
      return -1;
    }
    uVar19 = uVar17;
    bVar10 = true;
    if ((uVar16 != 0) && (param_6 != (CombatEntity *)0x0)) {
      CombatEnt_NAND_flags(param_6,flag2);
      uVar19 = 1;
      bVar10 = true;
    }
    break;
  case mirror:
    uVar19 = uVar17;
    bVar10 = true;
    if ((param_6 != (CombatEntity *)0x0) && (uVar19 = uVar18, bVar10 = bVar2, uVar16 != 0)) {
      param_6->field_0x28 = param_6->field_0x28 + (char)Lv * '\x03';
    }
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
    SVar13 = DEX;
    uVar14 = (undefined)((Lv << 0x19) >> 0x18);
    goto mod_stat;
  case clumsiness:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = DEX;
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
    if (uVar16 == 0) {
      sVar8 = -1;
    }
    else {
      pTVar7 = (Temp_enchant *)Malloc(0x18,s_../gameclasses/entity.cpp_800e02f0,0x809);
      ppTVar12 = param_1->effects->list + uVar5;
      *ppTVar12 = pTVar7;
      CreateTempEnchant(*ppTVar12,param_2,(char)Lv,param_4,param_5,uVar19);
    }
  }
  else {
    sVar8 = -1;
  }
  return sVar8;
}


void Effect_CaseSwitch_Remove(CharSheet *param_1,uint param_2,CombatEntity *param_3){
  Temp_enchant *pTVar1;
  bool bVar2;
  StatEnum SVar3;
  char cVar4;
  byte bVar5;
  combat_ai *iVar2;
  
  pTVar1 = param_1->effects->list[param_2 & 0xff];
  if (pTVar1 == (Temp_enchant *)0x0) {
    return;
  }
  switch(pTVar1->index) {
  case AirSheild:
    param_1->EXP->protection = param_1->EXP->protection + pTVar1->lv * -2;
    break;
  case ControlElem:
  case charming:
  case controlMarquis:
  case controlZombies:
    if (param_3 != (CombatEntity *)0x0) {
      bVar2 = CombatEnt_flag_5(param_3);
      if (bVar2 == false) {
        CombatEnt_NAND_flags(param_3,flag5);
      }
      else {
        CombatEnt_OR_flags(param_3,flag5);
      }
    }
    break;
  case debilitation:
    bVar5 = pTVar1->lv;
    SVar3 = STR;
    goto LAB_80079c10;
  case strength:
    SVar3 = STR;
    cVar4 = (char)(((uint)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case wind:
    TerrainPointer->windByte = 1;
    break;
  case brilliance:
    SVar3 = INT;
    cVar4 = (char)(((uint)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case stupidity:
    bVar5 = pTVar1->lv;
    SVar3 = INT;
    goto LAB_80079c10;
  case endurance:
    SVar3 = END;
    cVar4 = (char)(((uint)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case weakness:
    bVar5 = pTVar1->lv;
    SVar3 = END;
    goto LAB_80079c10;
  case auraOfDeath:
  case solarWraith:
    if ((param_3 != (CombatEntity *)0x0) &&
       (iVar2 = param_3->combat_ai_pointer, iVar2 != (combat_ai *)0x0)) {
      iVar2->field_0x6 = iVar2->field_0x6 + pTVar1->lv;
    }
    break;
  case wraithTouch:
    SVar3 = pTVar1->field_0x3;
    cVar4 = -pTVar1->lv;
    goto LAB_80079c18;
  case darkness:
  case light:
    dec_dayNightMagic(TerrainPointer);
    TerrainPointer->partOfDay = *(TimeOfDay *)gGlobals.Combat;
    break;
  case exhaustion:
    bVar5 = pTVar1->lv;
    SVar3 = STAM;
    goto LAB_80079c10;
  case stamina:
    SVar3 = STAM;
    cVar4 = (char)(((uint)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case wallOfBones:
  case frozenDoom:
  case webOfStarlight:
    if (param_3 != (CombatEntity *)0x0) {
      CombatEnt_OR_flags(param_3,flag2);
    }
    break;
  case spiritSheild:
  case starlightSheild:
    param_1->EXP->protection-= pTVar1->lv;
    break;
  case dexterity:
    SVar3 = DEX;
    cVar4 = (char)(((uint)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case clumsiness:
    bVar5 = pTVar1->lv;
    SVar3 = DEX;
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
