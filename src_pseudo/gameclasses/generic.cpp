enum CharSheetFlags{
    IsSolar=1,
    Heavy=2,
    TrueName=4,
};

void init_charExp(charExp *param_1,ItemID param_2){
  u8 bVar1;
  u8 bVar3;
  u8 bVar4;
  Entity_Ram *pEVar5;
  
  bVar3 = GetIDIndex(param_2);
  pEVar5 = gEntityDB->entities + bVar3;
  param_1->rom0x2b = pEVar5->rom0x2b; //seems unused
  param_1->school = pEVar5->School;
  param_1->protection = pEVar5->BaseProtect;
  param_1->total = 0;
  param_1->spending = 0;
  param_1->damage = pEVar5->BaseDamage;
  param_1->flags = pEVar5->unk0x18;
  if (pEVar5->aspect == SOLAR) param_1->flags |= IsSolar;
  //is alaron "Named"
  if ((bVar3 == 0x99) && (getEventFlag(FLAG_Cinematic3))) param_1->flags |= TrueName;
}

ASPECT GetCharAspect(charExp *param_1){
  ASPECT AVar1 = SOLAR;
  if ((param_1->flags & IsSolar) == 0) {AVar1 = LUNAR;}
  return AVar1;}

void temp_item_check(Temp_equip *param_1,ItemID param_2){
  u8 uVar1 = param_2 >> 8;
  if ((uVar1 == 5) || (uVar1 == 6)) {make_temp_armor((temp_armor *)param_1,param_2);}
  else if (uVar1 == 7) {make_temp_weapon((Temp_weapon *)param_1,param_2);}
  else if (uVar1 == 0x10) {make_temp_potion((Temp_potion *)param_1,param_2);}
  else {make_GearInstance((GearInstance *)param_1,param_2);}
}

void clear_temp_Stat_spell(Temp_weapon *param_1){
  if (param_1->Stat) {
    HeapFree(param_1->Stat,FILENAME,0x6e);
    param_1->Stat = NULL;
  }
  if (param_1->spell) {
    HeapFree(param_1->spell,FILENAME,0x74);
    param_1->spell = NULL;
  }
}

void make_temp_armor(temp_armor *param_1,ItemID param_2){
  armour_RAM *paVar1;
  u8 bVar4;
  u8 (*pabVar2) [2];
  Temp_spell *pTVar3;
  armour_RAM *pcVar5;
  
  memset(param_1,0,0x14);
  bVar4 = GetIDIndex(param_2);
  param_1->id = param_2;
  pcVar5 = armour_pointer->Armor[bVar4];
  param_1->name = pcVar5->name;
  param_1->aspect = pcVar5->aspect;
  param_1->price = pcVar5->price;
  if (pcVar5->stat != NONE) {
    pabVar2 = (u8 (*) [2])HeapAlloc(2,FILENAME,0x90);
    param_1->statMod = pabVar2;
    make_2byte_array(pabVar2,pcVar5->stat,pcVar5->statNum);
  }
  if (pcVar5->spell != NONE) {
    pTVar3 = (Temp_spell *)HeapAlloc(8,FILENAME,0x96);
    param_1->spell = pTVar3;
    malloc_equip_spell(pTVar3,pcVar5->spell,pcVar5->spellLV,pcVar5->rom0x2a);
  }
  return;
}

void make_temp_weapon(Temp_weapon *param_1,ItemID param_2){
  weapon_ram *pwVar1;
  u8 bVar4;
  u8 (*pabVar2) [2];
  Temp_spell *pTVar3;
  weapon_ram *pcVar5;
  
  memset(param_1,0,0x14);
  bVar4 = GetIDIndex(param_2);
  param_1->id = param_2;
  pcVar5 = gWeaponsDB->weapons[bVar4];
  param_1->name = pcVar5->name;
  param_1->aspect = pcVar5->aspect;
  param_1->price = pcVar5->price;
  if (pcVar5->stat != NONE) {
    pabVar2 = (u8 (*) [2])HeapAlloc(2,FILENAME,0xb2);
    param_1->Stat = pabVar2;
    make_2byte_array(pabVar2,pcVar5->stat,pcVar5->statMod);
  }
  if (pcVar5->spell != NONE) {
    pTVar3 = (Temp_spell *)HeapAlloc(8,FILENAME,0xb8);
    param_1->spell = pTVar3;
    malloc_equip_spell(pTVar3,pcVar5->spell,pcVar5->spellAmmount,pcVar5->SpellLV);
  }
  return;
}

u16 potion_prices[17]=
{250,1000,200,500,50,300,200,200,2500,500,500,500,0,300,300,500,500};

void make_temp_potion(Temp_potion *param_1,ItemID param_2){
  char *pcVar1;
  char **ppcVar2;
  u8 bVar3;
  
  memset(param_1,0,0x14);
  bVar3 = GetIDIndex(param_2);
  ppcVar2 = potion_names;
  param_1->id = param_2;
  pcVar1 = ppcVar2[bVar3];
  param_1->price = potion_prices[bVar3];
  param_1->name = pcVar1;
}

void make_GearInstance(GearInstance *param_1,ItemID param_2){
  s32 iVar1;
  u8 (*pabVar2) [2];
  Temp_spell *pTVar3;
  Gear_RAM *pGVar4;
  
  memset(param_1,0,0x14);
  iVar1 = search_item_array(param_2);
  pGVar4 = item_pointer->Gear;
  param_1->id = param_2;
  pGVar4+= iVar1;
  param_1->name = pGVar4->name;
  param_1->aspect = pGVar4->aspect;
  param_1->price = pGVar4->price;
  if (pGVar4->stat) {
    pabVar2 = (u8 (*) [2])HeapAlloc(2,FILENAME,0xe8);
    param_1->statmod = pabVar2;
    make_2byte_array(pabVar2,pGVar4->stat,pGVar4->StatMod);
  }
  if (pGVar4->spell != 0xff) {
    pTVar3 = (Temp_spell *)HeapAlloc(8,FILENAME,0xee);
    param_1->pSpell = pTVar3;
    malloc_equip_spell(pTVar3,pGVar4->spell,pGVar4->spellVal1,pGVar4->spellVal2);
  }
  return;
}

u16 GetItemPrice(ItemID *param_1){
  u16 uVar2;
  u32 uVar4;
  
  uVar4 = (u32)((u16)*param_1 >> 8);
  if (uVar4 - 5 < 2) {
    uVar2 = armour_pointer->Armor[GetIDIndex(*param_1)].price;
  }
  else if (uVar4 == 7) {
    uVar2 = gWeaponsDB->weapons[GetIDIndex(*param_1)].price;
    }
  else if (uVar4 == 0x10) {
    uVar2 = potion_prices[GetIDIndex(*param_1)];
   }
  else {
    uVar2 = item_pointer->Gear[search_item_array(*param_1)].price;
    }
  return uVar2;
}

void  SetMagicCharges(Temp_weapon *param_1,s8 param_2){
  if ((param_2 != -1) && (param_1->spell)) param_1->spell->Charges = param_2;}