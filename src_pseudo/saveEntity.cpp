#define FILENAME "./src/saveEntity.cpp"

#include "SaveEntity.h"

void SaveEntity::Init(void){
  ALLOCS(gSaveEntity,sizeof(CharSheet*)*SAVEENTSIZE,81);
  memset(gSaveEntity,0,sizeof(CharSheet*)*SAVEENTSIZE);
}


void SaveEntity::Free(void){

  for(u8 i=0;i<SAVEENTSIZE;i++) {
    if (gSaveEntity[i]) {
      Entity::Free(gSaveEntity[i]);
      FREE(gSaveEntity[i],111);
    }
  }
  FREE(gSaveEntity,116);
}

void SaveEntity::BenchParty(Party *param_1){
  CharSheet *pCVar1;
  CharSheet *pCVar2;
    
  IDK_NOOP();
  for(u8 iVar4=0;iVar4<4;iVar4++) {
    pCVar1 = param_1->Members[iVar4];
    if (pCVar1 == NULL) {
      pCVar1 = gSaveEntity[iVar4];
      if (pCVar1) {
        Entity::Free(pCVar1);
        gSaveEntity[iVar4] = NULL;
      }
    }
    else {
      pCVar2 = gSaveEntity[iVar4];
      if (pCVar2 == NULL) {gSaveEntity[iVar4] = InitEntity((pCVar1->ID);}
      else {
        if (pCVar2->ID != pCVar1->ID) {
          Entity::Free(pCVar2);
          Entity::Init(gSaveEntity[iVar4]),pCVar1->ID,3);
        }
      }
      SaveEntity::Copy(pCVar1,gSaveEntity[iVar4]);
      SaveEntity::BenchInSlot(pCVar1);
    }
  }
}

CharSheet * SaveEntity::GetMember(u16 x){
  IDK_NOOP();
  return gSaveEntity[x];
}

void SaveEntity::EraseEntry(u16 x){
  IDK_NOOP();
  if (gSaveEntity[x]) {
    Entity::Free(gSaveEntity[x]);
    FREE(gSaveEntity[x],205);
  }
}


void SaveEntity::LoadMember(CharSheet *param_1,u16 param_2){
  IDK_NOOP();
  EraseEntry(param_2);
  gSaveEntity[param_2] = param_1;
}



void SaveEntity::EraseEntityOfID(ItemID param_1){
  IDK_NOOP();
  for(u32 i=0;i<SAVEENTSIZE;i++) {
    if ((gSaveEntity[i]) &&(gSaveEntity[i]->ID == param_1)) {
      EraseEntry(i);
    }
  }
}

void SaveEntity::CopyMember(CharSheet *param_1){
  IDK_NOOP();
  u8 slot = GetSlot(param_1->ID);
  if ((slot) && (gSaveEntity[slot])) Copy(gSaveEntity[slot],param_1);
}

CharSheet * SaveEntity::InitEntity(ItemID param_1){
  CharSheet *pCVar1;
  ALLOC(pCVar1,294);
  Entity::Init(pCVar1,param_1,3);
  return pCVar1;
}


void SaveEntity::TransferArmor(CharSheet *param_1,CharSheet *param_2,u8 param_3){
  ArmorInstance *pAVar2;
  ArmorInstance *pAVar5;
  
  pAVar2 = param_1->armor[param_3];
  if (param_2->armor[param_3]) {
    ArmorInstance_ClearEffect(param_2->armor[param_3]);
    FREE(pAVar2,316);
  }
  if (pAVar2) {
    ALLOC(pAVar5,324);
    param_2->armor[param_3] = pAVar5;
    make_temp_armor_3(pAVar5,(pAVar2->base).id);
    if ((pAVar5->base).statMod){
      (pAVar5->base).statMod->mod = ((pAVar2->base).statMod)->mod;
    }
    if ((pAVar5->base).spellCharge) {
      (pAVar5->base).spellCharge->Charges = ((pAVar2->base).spellCharge)->Charges;
    }
  }
}


void SaveEntity::TransferWeapons(CharSheet *param_1,CharSheet *param_2){
  ItemID IVar1;
  WeaponInstance *pWVar2;
  StatMod *pSVar3;
  SpellCharges *pSVar4;
  WeaponInstance *pWVar5;
  
  pWVar5 = param_2->weapons;
  pWVar2 = param_1->weapons;
  if (pWVar5) {
    passto_clear_weapon_effects(pWVar5);
    FREE(pWVar5,352);
  }
  if (pWVar2) {
    ALLOC(pWVar5,360);
    param_2->weapons = pWVar5;
    createTempWeapon(pWVar5,pWVar2->base).id);
    if ((pWVar5->base).statMod)
      pWVar5->base.statMod->mod = ((pWVar2->base).statMod)->mod;
    if ((pWVar5->base).spellCharge)
      (pWVar5->base).spellCharge->Charges = ((pWVar2->base).spellCharge)->Charges;
  }
}

void SaveEntity::TransferGear(CharSheet *param_1,CharSheet *param_2,u8 param_3){
  CharGear *pCVar2;
  WeaponInstance *X;
  GearInstance *pGVar3;
  GearInstance *pTVar5;
  
  pCVar2 = param_2->pItemList;
  X = (WeaponInstance *)pCVar2->pItem[param_3];
  pGVar3 = param_1->pItemList->pItem[param_3];
  if (pCVar2->pItem[param_3]) {
    clear_weapon_effects(pCVar2->pItem[param_3]);
    FREE(X,389);
    pCVar2->usedItems--;
  }
  if (pGVar3) {
    ALLOC(pTVar5,400);
    pCVar2->pItem[param_3] = pTVar5;
    make_temp_item((EquipInstance *)pTVar5,(pGVar3->base).id);
    if ((pTVar5->base).statMod){
      (pTVar5->base).statMod->mod = ((pGVar3->base).statMod)->mod;
    }
    if ((pTVar5->base).spellCharge){
      (pTVar5->base).spellCharge->Charges = ((pGVar3->base).spellCharge)->Charges;
    }
    pCVar2->usedItems++;
  }

}


void SaveEntity::TransferSpells(CharSheet *param_1,CharSheet *param_2){
  Spellbook *pSVar1;
  Spellbook *pSVar2;
  SpellInstance *pSVar4;
  uint uVar5;
  SpellInstance *pIVar2;
  
  pSVar1 = param_1->spellbook;
  if (pSVar1 != NULL) {
    pSVar2 = param_2->spellbook;
    if (pSVar2 != NULL) {
      Spellbook::Clear(pSVar2);
      FREE(pSVar2,0x1b3);
    }
    ALLOC(pSVar2,440);
    param_2->spellbook = pSVar2;
    Spellbook::Reset(pSVar2,pSVar1->count);
    if (pSVar1->count != 0) {
      for(u8 uVar5=0;uVar5<pSVar1->count;uVar5++) {
        pIVar2 = pSVar1->spells[uVar5];
        if (pIVar2 != NULL) {
          ALLOC(pSVar4.452);
          pSVar2->spells[uVar5] = pSVar4;
          TempSpell::Init(pSVar4,(pIVar2->base).id,pIVar2->level);
        }
      }
    }
    pSVar2->count = pSVar1->count;
  }
}

char * SaveEntity::Copy(CharSheet *param_1,CharSheet *param_2){
  u8 i;

  param_2->EXP->total = param_1->EXP->total;
  param_2->EXP->spending = param_1->EXP->spending;
  CharStats:::Copy(param_2->Stats,param_1->Stats);
  CharSkills::Copy(param_2->Skills,param_1->Skills);
  for(i=0;i<2;i++) TransferArmor(param_1,param_2,i);
  TransferWeapons(param_1,param_2);
  for(i=0;i<12;i++) TransferGear(param_1,param_2,i);
  TransferSpells(param_1,param_2);
  return strcpy(param_2->name,param_1->name);
}


void SaveEntity::BenchInSlot(CharSheet *param_1){
  u8 slot = GetSlot(param_1->ID);
  if (slot) {
    if (!gSaveEntity[slot]) gSaveEntity[slot] = InitEntity(param_1->ID);
    Copy(param_1,gSaveEntity[slot]);
  }
}

u8 SaveEntity::GetSlot(ItemID param_1){
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

void SaveEntity::IDK_NOOP(void){}