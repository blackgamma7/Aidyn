CharSheet*[9]* saveentity_pointer //looks to be the "bench" for party members

void saveentity_init(void){
  saveentity_pointer = (CharSheet *(*) [9])Malloc(0x24,FILENAME,0x51);
  memset(saveentity_pointer,0,0x24);
}


void saveentity_free(void){
  uint uVar1;
  
  uVar1 = 0;
  do {
    if ((*saveentity_pointer)[uVar1] != NULL) {
      CharSheet_free((*saveentity_pointer)[uVar1]);
      Free((*saveentity_pointer)[uVar1],FILENAME,0x6f);
      (*saveentity_pointer)[uVar1] = NULL;
    }
    uVar1++;
  } while (uVar1 < 9);
  Free(saveentity_pointer,FILENAME,0x74);
  saveentity_pointer = (CharSheet *(*) [9])0x0;
  return;
}

void move_party_to_saveEnt(PartyStruct *param_1){
  CharSheet *pCVar1;
  CharSheet *pCVar2;
  undefined4 uVar3;
  int iVar4;

  
  saveEnt_noop();
  uVar5 = 0;
  while( true ) {
    pCVar1 = param_1->Party[iVar4];
    if (pCVar1 == NULL) {
      pCVar1 = saveentity_pointer[iVar4];
      if (pCVar1 != NULL) {
        CharSheet_free(pCVar1);
        saveentity_pointer[iVar4] = NULL;
      }
    }
    else {
      pCVar2 = saveentity_pointer[iVar4];
      if (pCVar2 == NULL) {saveentity_pointer[iVar4] = saveEnt_create_charSheet(pCVar1->ID);}
      else {
        if (pCVar2->ID != pCVar1->ID) {
          CharSheet_free(pCVar2);
          create_CharSheet(saveentity_pointer[iVar4]),pCVar1->ID,3);
        }
      }
      copyCharSheet(pCVar1,saveentity_pointer[iVar4]);
      caseSwitch_copy_char_2(pCVar1);
    }
    iVar4++;
    if (3 < iVar4) break;
  }
}

CharSheet * saveEnt_get_entry(short x){
  saveEnt_noop();
  return (*saveentity_pointer)[x];
}

void saveEnt_free_entry(short x){
  saveEnt_noop();
  if ((*saveentity_pointer)[x] != NULL) {
    CharSheet_free((*saveentity_pointer)[x]);
    Free((*saveentity_pointer)[x],FILENAME,0xcd);
    (*saveentity_pointer)[x] = NULL;
  }
}

void saveEnt_loadEntry(CharSheet *param_1,short param_2){
  saveEnt_noop();
  saveEnt_free_entry(param_2);
  (*saveentity_pointer)[param_2] = param_1;
}

void saveent_deadMember(ItemID param_1){
  short uVar1;
  
  saveEnt_noop();
  uVar1 = 0;
  do {
    if (((*saveentity_pointer)[uVar1] != NULL) &&
       ((*saveentity_pointer)[uVar1]->ID == param_1)) {
      saveEnt_free_entry(uVar1);
    }
    uVar1++;
  } while (uVar1 < 9);
}

void caseSwitch_copy_char(CharSheet *param_1){
  byte bVar1;
  
  saveEnt_noop();
  bVar1 = party_member_caseSwitch(param_1->ID);
  if ((bVar1 != 0)&&((*saveentity_pointer)[bVar1] != NULL)) {copyCharSheet((*saveentity_pointer)[bVar1],param_1);}
  return;
}

CharSheet * saveEnt_create_charSheet(ItemID param_1){
  CharSheet *pCVar1;
  
  pCVar1 = (CharSheet *)Malloc(0x48,FILENAME,0x126);
  create_CharSheet(pCVar1,param_1,3);
  return pCVar1;
}


void saveEntity_func_2(CharSheet *param_1,CharSheet *param_2,byte param_3){
  ItemID IVar1;
  temp_armor *ptVar2;
  SpellCharges *pSVar3;
  temp_armor *ptVar4;
  
  ptVar4 = param_2->armor[param_3];
  ptVar2 = param_1->armor[param_3];
  if (ptVar4 != (temp_armor *)0x0) {
    pssto_clear_weapon_effects(ptVar4);
    Free(ptVar4,FILENAME,0x13c);
    param_2->armor[param_3] = (temp_armor *)0x0;
  }
  if (ptVar2 != (temp_armor *)0x0) {
    ptVar4 = (temp_armor *)Malloc(0x28,FILENAME,0x144);
    IVar1 = ptVar2->id;
    param_2->armor[param_3] = ptVar4;
    make_temp_armor_3(ptVar4,IVar1);
    if (ptVar4->statMod != (byte (*) [2])0x0){(*ptVar4->statMod)[1] = (*ptVar2->statMod)[1];}
    if (ptVar4->spell != (SpellCharges *)0x0) {ptVar4->spell->Charges = ptVar2->spell->Charges;}
  }
  return;
}

void saveEntity_func(CharSheet *param_1,CharSheet *param_2){
  ItemID IVar1;
  Temp_weapon *pTVar2;
  SpellCharges *pSVar3;
  Temp_weapon *pTVar4;
  
  pTVar4 = param_2->weapons;
  pTVar2 = param_1->weapons;
  if (pTVar4 != (Temp_weapon *)0x0) {
    passto_clear_weapon_effects(pTVar4);
    Free(pTVar4,FILENAME,0x160);
    param_2->weapons = (Temp_weapon *)0x0;
  }
  if (pTVar2 != (Temp_weapon *)0x0) {
    pTVar4 = (Temp_weapon *)Malloc(0x2c,FILENAME,0x168);
    IVar1 = pTVar2->id;
    param_2->weapons = pTVar4;
    createTempWeapon(pTVar4,IVar1);
    if (pTVar4->Stat != (byte (*) [2])0x0) {(*pTVar4->Stat)[1] = (*pTVar2->Stat)[1];}
    if (pTVar4->spell != (SpellCharges *)0x0) {pTVar4->spell->Charges = pTVar2->spell->Charges;}
  }
  return;
}


void FUN_8001c250(CharSheet *param_1,CharSheet *param_2,byte param_3){
  ItemID IVar1;
  CharGear *pCVar2;
  Temp_weapon *X;
  temp_gear *ptVar3;
  temp_gear *pTVar5;
  

  pCVar2 = param_2->pItemList;
  X = (Temp_weapon *)pCVar2->pItem[param_3];
  ptVar3 = param_1->pItemList->pItem[param_3];
  if (X != (Temp_weapon *)0x0) {
    clear_weapon_effects(X);
    Free(X,FILENAME,0x185);
    pCVar2->pItem[param_3] = (temp_gear *)0x0;
    pCVar2->num_used--;
  }
  if (ptVar3 != (temp_gear *)0x0) {
    pTVar5 = (temp_gear *)Malloc(0x24,FILENAME,400);
    IVar1 = ptVar3->id;
    pCVar2->pItem[param_3] = pTVar5;
    make_temp_item((Temp_equip *)pTVar5,IVar1);
    if (pTVar5->statmod != (byte (*) [2])0x0) {(*pTVar5->statmod)[1] = (*ptVar3->statmod)[1];}
    if (pTVar5->pSpell != (SpellCharges *)0x0){pTVar5->pSpell->Charges = ptVar3->pSpell->Charges;}
    pCVar2->num_used++;
  }
  return;
}

void copy_spellbook(CharSheet *param_1,CharSheet *param_2){
  ItemID ID;
  spellbook *psVar1;
  spellbook *psVar2;
  Temp_spell *pTVar3;
  uint uVar4;
  Temp_spell *pIVar2;
  
  psVar1 = param_1->spellbook;
  if (psVar1 != (spellbook *)0x0) {
    psVar2 = param_2->spellbook;
    if (psVar2 != (spellbook *)0x0) {
      spellbok_free(psVar2);
      Free(psVar2,FILENAME,0x1b3);
      param_2->spellbook = (spellbook *)0x0;
    }
    psVar2 = (spellbook *)Malloc(8,FILENAME,0x1b8);
    param_2->spellbook = psVar2;
    malloc_spell(psVar2,(uint)psVar1->spell_count);
    uVar4 = 0;
    if (psVar1->spell_count != 0) {
      pTVar3 = psVar1->spells;
      while( true ) {
        pIVar2 = *(Temp_spell **)(&pTVar3->id + uVar4 * 2);
        if (pIVar2 != (Temp_spell *)0x0) {
          pTVar3 = (Temp_spell *)Malloc(0x24,FILENAME,0x1c4);
          ID = pIVar2->id;
          *(Temp_spell **)(&psVar2->spells->id + uVar4 * 2) = pTVar3;
          create_temp_spell(pTVar3,ID,pIVar2->level);
        }
        uVar4++;
        if (psVar1->spell_count <= uVar4) break;
        pTVar3 = psVar1->spells;
      }
    }
    psVar2->spell_count = psVar1->spell_count;
  }
  return;
}

char * copyCharSheet(CharSheet *param_1,CharSheet *param_2){
  charExp *pcVar1;
  charExp *pcVar2;
  CharStats *A;
  CharStats *B;
  char *pcVar3;
  uint uVar4;
  
  pcVar1 = param_1->EXP;
  pcVar2 = param_2->EXP;
  A = param_2->Stats;
  B = param_1->Stats;
  pcVar2->total = pcVar1->total;
  pcVar2->spending = pcVar1->spending;
  copyCharStats(A,B);
  uVar4 = 0;
  CopyCharSkills(param_2->Skills,param_1->Skills);
  do {
    saveEntity_func_2(param_1,param_2,uVar4);
    uVar4++;
  } while (uVar4 < 2);
  saveEntity_func(param_1,param_2);
  uVar4 = 0;
  do {
    FUN_8001c250(param_1,param_2,uVar4);
    uVar4++;
  } while (uVar4 < 0xc);
  copy_spellbook(param_1,param_2);
  pcVar3 = strcpy(param_2->name,param_1->name);
  return pcVar3;
}


void caseSwitch_copy_char_2(CharSheet *param_1){
  ItemID IVar1;
  byte bVar3;
  CharSheet *pCVar2;
  uint uVar4;
  
  IVar1 = param_1->ID;
  bVar3 = party_member_caseSwitch(IVar1);
  uVar4 = (int)(char)bVar3 & 0xff;
  if (uVar4 != 0) {
    if ((*saveentity_pointer)[uVar4] == NULL) {(*saveentity_pointer)[uVar4] = saveEnt_create_charSheet(IVar1)}
    copyCharSheet(param_1,(*saveentity_pointer)[uVar4]);
  }
  return;
}

byte party_member_caseSwitch(ItemID param_1){
  byte bVar1;
  switch(GetIDIndex(param_1)) {
  case 0x98:
    bVar1 = 4;
    break;
  default:
    bVar1 = 0;
    break;
  case 0x9a:
    bVar1 = 5;
    break;
  case 0x9c:
    bVar1 = 6;
    break;
  case 0xa0:
    bVar1 = 7;
    break;
  case 0xa1:
    bVar1 = 8;
  }
  return bVar1;
}

void saveEnt_noop(void){}