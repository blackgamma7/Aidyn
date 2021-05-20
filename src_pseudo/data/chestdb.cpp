void chestdb_ofunc(loot_Pointer *param_1){
  Loot_RAM *pLVar1;
  undefined4 auStack16 [4];
  
  auStack16[0] = 0;
  load_db_array_size(&chestdb,param_1,auStack16);
  pLVar1 = (Loot_RAM *)
           Malloc(((uint)param_1->total * 0x1c + (uint)param_1->total) * 2,
                  FILENAME,0x36);
  param_1->lootCat = pLVar1;
  return;
}

void load_chestDB(loot_Pointer *param_1,uint param_2,int *param_3){
  int iVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  Loot_RAM *w;
  loot_ROM ROMtemp;
  
  iVar1 = *param_3;
  w = param_1->lootCat + param_2;
  RomCopy(&ROMtemp,chestdb + iVar1,sizeof(loot_ROM),1,FILENAME,0x47);
  memcpy(w,&ROMtemp,0x14);
  w->Is0 = '\0';
  w->ID = (ItemID)((ushort)ROMtemp.ID.ID + (ushort)ROMtemp.ID.Type * 0x100);
  w->Gold lo = (ushort)ROMtemp.goldLo[0] + (ushort)ROMtemp.goldLo[1] * 0x100;
  w->Gold Hi = (ushort)ROMtemp.goldHi[0] + (ushort)ROMtemp.goldHi[1] * 0x100;
  w->armorDrop = ROMtemp.armorDrop[0];
  w->sheildDrop = ROMtemp.armorDrop[1];
  memcpy(w->weaponDrop,ROMtemp.WeaponDrop,3);
  uVar6 = 0;
  w->reagentchance = ROMtemp.reagentPercent;
  w->reagentLlo = ROMtemp.reagentRange[0];
  w->reagentHi = ROMtemp.reagentRange[1];
  uVar2 = 0x22;
  do {
    uVar3 = uVar2+1;
    uVar4 = uVar3+1;
    uVar5 = uVar4+1;
    w->itemDrops[uVar6] =
         (ItemID)((ushort)(byte)ROMtemp.Name[uVar2] + (ushort)(byte)ROMtemp.Name[uVar3] * 0x100);
    w->itemDropChances[uVar6] = ROMtemp.Name[uVar4];
    uVar2 = uVar5;
    if (uVar6 < 2) {
      uVar3 = uVar5+1;
      uVar2 = uVar3+1;
      w->itemLo[uVar6] = ROMtemp.Name[uVar5];
      w->itemHi[uVar6] = ROMtemp.Name[uVar3];
    }
    uVar6 = uVar6+1;
  } while (uVar6 < 6);
  *param_3 = iVar1 + sizeof(loot_ROM);
}

void Ofunc_800748c4(loot_Pointer *param_1,ushort param_2){
  byte *pbVar1;
  uint uVar2;
  int aiStack16 [4];
  
  uVar2 = 0;
  if (param_1->total != 0) {
    pbVar1 = lootList;
    do {
      if (*pbVar1 == param_2) {
        aiStack16[0] = uVar2 * 0x38 + 4;
        load_chestDB(param_1,uVar2,aiStack16);
        return;
      }
      uVar2++;
      pbVar1 = lootList + uVar2;
    } while (uVar2 < param_1->total);
  }
  return;
}

uint item_chances(container_Dat *chest,byte *chance,u8 QLo,u8 Qhi,byte slot,short item,uint isMulti){

  short (*pasVar2) [2]; //item, quantity
  uint uVar4;
  
  uVar4 = slot;
  if ((chance != 0) && (globals::RollD(1,100) <= chance)){
    uVar4 = slot+1;
    pasVar2 = chest->lootCatDrop[slot]; 
    (*pasVar2)[1] = 1;
    (*pasVar2)[0] = item;
    if (isMulti) {(*pasVar2)[1] = (short)globals::rand_range(QLo,Qhi);}
  }
  return uVar4;
}

void get_chest_loot(loot_Pointer *param_1,container_Dat *param_2){
  byte bVar3;
  uint uVar1;
  byte *pbVar2;
  Loot_RAM *pcVar4;
  uint uVar4;
  
  uVar4 = 0;
  bVar3 = GetIDIndex(param_2->LootCat);
  pcVar4 = param_1->lootCat[bVar3];
  param_2->Gold = (ushort)(globals::rand_range(pcVar4->Gold lo,pcVar4->Gold Hi) << 1);
  uVar1 = globals::rand_range(0x1e,0x20); //spice, herb or gem
  uVar1 = item_chances(param_2,(byte *)(uint)pcVar4->reagentchance,(uint)pcVar4->reagentLlo,
                       (uint)pcVar4->reagentHi,0,itemID_array[uVar1],1);
  pbVar2 = pcVar4->itemDropChances;
  while( true ) {
    uVar1 = item_chances(param_2,(byte *)(uint)*pbVar2,pcVar4->itemLo[uVar4],
                         pcVar4->itemHi[uVar4],(char)uVar1,pcVar4->itemDrops[uVar4],
                         (uint)(uVar4 < 2));
    uVar4++;
    if (5 < uVar4) break;
    pbVar2 = pcVar4->itemDropChances + uVar4;
  }
}

void build_chestdb(loot_Pointer *param_1){
  Loot_RAM *pLVar1;
  uint uVar2;
  undefined4 auStack24 [6];
  
  auStack24[0] = 0;
  load_db_array_size(&chestdb,param_1,auStack24);
  pLVar1 = (Loot_RAM *)Malloc(((uint)param_1->total * 0x1c + (uint)param_1->total) * 2,FILENAME,0x165);
  param_1->lootCat = pLVar1;
  uVar2 = 0;
  if (param_1->total != 0) {
    do {load_chestDB(param_1,uVar2++,auStack24);} while (uVar2 < param_1->total);
  }
}

void Chestdb_free(loot_Pointer *param_1){Free(param_1->lootCat,FILENAME,0x173);}

