#include "romcopy.h"
#include "chestdb.h"
#include "globals.h"

#define FILENAME "../data/chestdb.cpp"

extern u8 itemID_array[];

void chestdb_ofunc(loot_Pointer *param_1){
  Loot_RAM *pLVar1;
  s32 auStack16 [4];
  
  auStack16[0] = 0;
  load_db_array_size(&chestdb,param_1,auStack16);
  ALLOCS(param_1->lootCat,param_1->total *sizeof(Loot_RAM),0x36);
}

void load_chestDB(loot_Pointer *param_1,u8 param_2,s32 *param_3){
  s32 iVar1;
  u32 uVar2;
  u32 uVar3;
  u32 uVar4;
  u32 uVar5;
  u32 uVar6;
  Loot_RAM *w;
  loot_ROM ROMtemp;
  
  iVar1 = *param_3;
  w = param_1->lootCat + param_2;
  ROMCOPYS(&ROMtemp,chestdb + iVar1,sizeof(loot_ROM),0x47);
  memcpy(w,&ROMtemp,20);
  w->Name[20] = 0;
  //swap endians
  w->ID = (ItemID)((u16)ROMtemp.ID.ID + (u16)ROMtemp.ID.Type * 0x100);
  w->GoldLo = (u16)ROMtemp.goldLo[0] + (u16)ROMtemp.goldLo[1] * 0x100;
  w->GoldHi = (u16)ROMtemp.goldHi[0] + (u16)ROMtemp.goldHi[1] * 0x100;
  w->armorDrop = ROMtemp.armorDrop[0];
  w->sheildDrop = ROMtemp.armorDrop[1];
  memcpy(w->weaponDrop,ROMtemp.WeaponDrop,3);
  uVar6 = 0;
  w->reagentchance = ROMtemp.reagentPercent;
  w->reagentLlo = ROMtemp.reagentRange[0];
  w->reagentHi = ROMtemp.reagentRange[1];
  uVar2 = 0x22;
  for(uVar6=0;uVar6 < 6;uVar6++) {
    uVar3 = uVar2+1;
    uVar4 = uVar3+1;
    uVar5 = uVar4+1;
    w->itemDrops[uVar6] =(ItemID)((u16)(u8)ROMtemp.Name[uVar2] + (u16)(u8)ROMtemp.Name[uVar3] * 0x100);
    w->itemDropChances[uVar6] = ROMtemp.Name[uVar4];
    uVar2 = uVar5;
    if (uVar6 < 2) {
      uVar3 = uVar5+1;
      uVar2 = uVar3+1;
      w->itemLo[uVar6] = ROMtemp.Name[uVar5];
      w->itemHi[uVar6] = ROMtemp.Name[uVar3];
    }
  }
  *param_3 = iVar1 + sizeof(loot_ROM);
}

void Ofunc_800748c4(loot_Pointer *param_1,u16 param_2){
  u8 *pbVar1;
  u32 uVar2;
  s32 aiStack16 [4];
  
  uVar2 = 0;
  if (param_1->total) {
    pbVar1 = lootList;
    do {
      if (*pbVar1 == param_2) {
        aiStack16[0] = uVar2 * sizeof(Loot_RAM);
        load_chestDB(param_1,uVar2,aiStack16);
        return;
      }
      uVar2++;
      pbVar1 = lootList + uVar2;
    } while (uVar2 < param_1->total);
  }
  return;
}

u32 item_chances(container_Dat *chest,u8 chance,u8 QLo,u8 Qhi,u8 slot,s16 item,u32 isMulti){

  s16 (*pasVar2) [2]; //item, quantity
  u32 uVar4;
  
  uVar4 = slot;
  if ((chance) && (RollD(1,100) <= chance)){
    uVar4 = slot+1;
    pasVar2 = &chest->lootCatDrop[slot]; 
    (*pasVar2)[1] = 1;
    (*pasVar2)[0] = item;
    if (isMulti) {(*pasVar2)[1] = (s16)rand_range(QLo,Qhi);}
  }
  return uVar4;
}

void get_chest_loot(loot_Pointer *param_1,container_Dat *param_2){
  u8 bVar3;
  u32 uVar1;
  Loot_RAM *pcVar4 = &param_1->lootCat[GetIDIndex(param_2->LootCat)];
  param_2->Gold = (u16)(rand_range(pcVar4->GoldLo,pcVar4->GoldHi) << 1);
  uVar1 = item_chances(param_2,pcVar4->reagentchance,pcVar4->reagentLlo,
                       pcVar4->reagentHi,0,itemID_array[rand_range(0x1e,0x20)],1);
  for(u16 i=0;i<6;i++) {
    uVar1 = item_chances(param_2,pcVar4->itemDropChances[i],pcVar4->itemLo[i],
                         pcVar4->itemHi[i],uVar1,pcVar4->itemDrops[i],
                         (i < 2));
  }
}

void build_chestdb(loot_Pointer *param_1){
  u32 uVar2;
  s32 auStack24 [6];
  
  auStack24[0] = 0;
  load_db_array_size(&chestdb,param_1,auStack24);
  ALLOCS(param_1->lootCat,param_1->total*sizeof(Loot_RAM),0x165);
  uVar2 = 0;
  if (param_1->total != 0) {
    do {load_chestDB(param_1,uVar2++,auStack24);} while (uVar2 < param_1->total);
  }
}

void Chestdb_free(loot_Pointer *param_1){HFREE(param_1->lootCat,371);}

