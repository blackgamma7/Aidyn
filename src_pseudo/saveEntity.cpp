CharSheet*[9]* gSaveEntity //looks to be the "bench" for party members

void saveentity_init(void){
  gSaveEntity = (CharSheet *(*) [9])heapAlloc(0x24,FILENAME,0x51);
  CLEAR(gSaveEntity);
}


void saveentity_free(void){
  u32 i;
  
  i = 0;
  for(i=0;i<9;i++) {
    if ((*gSaveEntity)[i]) {
      CharSheet_free((*gSaveEntity)[i]);
      HeapFree((*gSaveEntity)[i],FILENAME,0x6f);
      (*gSaveEntity)[i] = NULL;
    }
  }
  HeapFree(gSaveEntity,FILENAME,0x74);
  gSaveEntity = NULL;
}

void move_party_to_saveEnt(PartyStruct *param_1){
  CharSheet *pCVar1;
  CharSheet *pCVar2;
  s32 uVar3;
  s32 iVar4;

  
  saveEnt_noop();
  uVar5 = 0;
  while( true ) {
    pCVar1 = param_1->Party[iVar4];
    if (pCVar1 == NULL) {
      pCVar1 = gSaveEntity[iVar4];
      if (pCVar1) {
        CharSheet_free(pCVar1);
        gSaveEntity[iVar4] = NULL;
      }
    }
    else {
      pCVar2 = gSaveEntity[iVar4];
      if (pCVar2 == NULL) {gSaveEntity[iVar4] = saveEnt_create_charSheet(pCVar1->ID);}
      else {
        if (pCVar2->ID != pCVar1->ID) {
          CharSheet_free(pCVar2);
          create_CharSheet(gSaveEntity[iVar4]),pCVar1->ID,3);
        }
      }
      copyCharSheet(pCVar1,gSaveEntity[iVar4]);
      caseSwitch_copy_char_2(pCVar1);
    }
    iVar4++;
    if (3 < iVar4) break;
  }
}

CharSheet * saveEnt_get_entry(s16 x){
  saveEnt_noop();
  return (*gSaveEntity)[x];
}

void saveEnt_free_entry(s16 x){
  saveEnt_noop();
  if ((*gSaveEntity)[x]) {
    CharSheet_free((*gSaveEntity)[x]);
    HeapFree((*gSaveEntity)[x],FILENAME,0xcd);
    (*gSaveEntity)[x] = NULL;
  }
}

void saveEnt_loadEntry(CharSheet *param_1,s16 param_2){
  saveEnt_noop();
  saveEnt_free_entry(param_2);
  (*gSaveEntity)[param_2] = param_1;
}

void saveent_deadMember(ItemID param_1){
  s16 i;
  
  saveEnt_noop();
  for(i=0;i<9;i++) {
    if (((*gSaveEntity)[i]) &&((*gSaveEntity)[i]->ID == param_1)) {
      saveEnt_free_entry(i);
    }
  }
}

void caseSwitch_copy_char(CharSheet *param_1){
  u8 bVar1;
  
  saveEnt_noop();
  bVar1 = party_member_caseSwitch(param_1->ID);
  if ((bVar1 != 0)&&((*gSaveEntity)[bVar1])) copyCharSheet((*gSaveEntity)[bVar1],param_1);
}

CharSheet * saveEnt_create_charSheet(ItemID param_1){
  CharSheet *pCVar1;
  
  pCVar1 = (CharSheet *)heapAlloc(0x48,FILENAME,0x126);
  create_CharSheet(pCVar1,param_1,3);
  return pCVar1;
}


void saveEntity_func_2(CharSheet *param_1,CharSheet *param_2,u8 param_3){
  ItemID IVar1;
  temp_armor *ptVar2;
  SpellCharges *pSVar3;
  temp_armor *ptVar4;
  
  ptVar4 = param_2->armor[param_3];
  ptVar2 = param_1->armor[param_3];
  if (ptVar4) {
    pssto_clear_weapon_effects(ptVar4);
    HeapFree(ptVar4,FILENAME,0x13c);
    param_2->armor[param_3] = NULL;
  }
  if (ptVar2) {
    ptVar4 = (temp_armor *)heapAlloc(0x28,FILENAME,0x144);
    IVar1 = ptVar2->id;
    param_2->armor[param_3] = ptVar4;
    make_temp_armor_3(ptVar4,IVar1);
    if (ptVar4->statMod)(*ptVar4->statMod)[1] = (*ptVar2->statMod)[1];
    if (ptVar4->spell) ptVar4->spell->Charges = ptVar2->spell->Charges;
  }

}

void saveEntity_func(CharSheet *param_1,CharSheet *param_2){
  ItemID IVar1;
  Temp_weapon *pTVar2;
  SpellCharges *pSVar3;
  Temp_weapon *pTVar4;
  
  pTVar4 = param_2->weapons;
  pTVar2 = param_1->weapons;
  if (pTVar4) {
    passto_clear_weapon_effects(pTVar4);
    HeapFree(pTVar4,FILENAME,0x160);
    param_2->weapons = NULL;
  }
  if (pTVar2) {
    pTVar4 = (Temp_weapon *)heapAlloc(0x2c,FILENAME,0x168);
    IVar1 = pTVar2->id;
    param_2->weapons = pTVar4;
    createTempWeapon(pTVar4,IVar1);
    if (pTVar4->Stat) (*pTVar4->Stat)[1] = (*pTVar2->Stat)[1];
    if (pTVar4->spell) pTVar4->spell->Charges = pTVar2->spell->Charges;
  }
  return;
}


void FUN_8001c250(CharSheet *param_1,CharSheet *param_2,u8 param_3){
  ItemID IVar1;
  CharGear *pCVar2;
  Temp_weapon *X;
  temp_gear *ptVar3;
  temp_gear *pTVar5;
  

  pCVar2 = param_2->pItemList;
  X = (Temp_weapon *)pCVar2->pItem[param_3];
  ptVar3 = param_1->pItemList->pItem[param_3];
  if (X) {
    clear_weapon_effects(X);
    HeapFree(X,FILENAME,0x185);
    pCVar2->pItem[param_3] = NULL;
    pCVar2->num_used--;
  }
  if (ptVar3) {
    pTVar5 = heapAlloc(0x24,FILENAME,400);
    IVar1 = ptVar3->id;
    pCVar2->pItem[param_3] = pTVar5;
    make_temp_item((Temp_equip *)pTVar5,IVar1);
    if (pTVar5->statmod) (*pTVar5->statmod)[1] = (*ptVar3->statmod)[1];
    if (pTVar5->pSpell) pTVar5->pSpell->Charges = ptVar3->pSpell->Charges;
    pCVar2->num_used++;
  }
  return;
}

void copy_spellbook(CharSheet *param_1,CharSheet *param_2){
  ItemID ID;
  spellbook *psVar1;
  spellbook *psVar2;
  Temp_spell *pTVar3;
  u32 uVar4;
  Temp_spell *pIVar2;
  
  psVar1 = param_1->spellbook;
  if (psVar1) {
    psVar2 = param_2->spellbook;
    if (psVar2) {
      spellbok_free(psVar2);
      HeapFree(psVar2,FILENAME,0x1b3);
      param_2->spellbook = NULL;
    }
    psVar2 = (spellbook *)heapAlloc(8,FILENAME,0x1b8);
    param_2->spellbook = psVar2;
    malloc_spell(psVar2,(u32)psVar1->spell_count);
    uVar4 = 0;
    if (psVar1->spell_count != 0) {
      pTVar3 = psVar1->spells;
      while( true ) {
        pIVar2 = *(Temp_spell **)(&pTVar3->id + uVar4 * 2);
        if (pIVar2) {
          pTVar3 = (Temp_spell *)heapAlloc(0x24,FILENAME,0x1c4);
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
  u32 i;

  param_2->EXP->total = param_1->EXP->total;
  param_2->EXP->spending = param_1->EXP->spending;
  copyCharStats(param_2->Stats,param_1->Stats);
  CopyCharSkills(param_2->Skills,param_1->Skills);
  for(i=0;i<2;i++) saveEntity_func_2(param_1,param_2,i);
  saveEntity_func(param_1,param_2);
  for(i=0;i<12;i++) FUN_8001c250(param_1,param_2,i);
  copy_spellbook(param_1,param_2);
  return strcpy(param_2->name,param_1->name);
}


void caseSwitch_copy_char_2(CharSheet *param_1){
  ItemID IVar1;
  u8 bVar3;
  CharSheet *pCVar2;
  u32 uVar4;
  
  IVar1 = param_1->ID;
  bVar3 = party_member_caseSwitch(IVar1);
  uVar4 = (s32)(char)bVar3 & 0xff;
  if (uVar4 != 0) {
    if ((*gSaveEntity)[uVar4] == NULL) {(*gSaveEntity)[uVar4] = saveEnt_create_charSheet(IVar1)}
    copyCharSheet(param_1,(*gSaveEntity)[uVar4]);
  }
  return;
}

u8 party_member_caseSwitch(ItemID param_1){
  u8 bVar1;
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