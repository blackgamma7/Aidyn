#include "globals.h"
#define FILENAME "../gameclasses/generic.cpp"


void CharExp::Init(ItemID id){
  u8 bVar1;
  u8 bVar3;
  u8 bVar4;
  Entity_Ram *pEVar5;
  
  bVar3 = GetIDIndex(id);
  pEVar5 = gEntityDB->entities + bVar3;
  this->rom0x2b = pEVar5->rom0x2b; //seems unused
  this->school = pEVar5->School;
  this->protection = pEVar5->BaseProtect;
  this->total = 0;
  this->spending = 0;
  this->damage = pEVar5->BaseDamage;
  this->flags = pEVar5->unk0x18;
  if (pEVar5->aspect == ASPECT_SOLAR) this->flags |= CHAR_IsSolar;
  //is alaron "Named" yet?
  if ((bVar3 == 0x99) && (getEventFlag(FLAG_Cinematic2))) this->flags |= CHAR_TrueName;
}

u8 CharExp::GetAspect(){return (flags & CHAR_IsSolar) ? ASPECT_SOLAR:ASPECT_LUNAR;}

//file break?

void ItemInstance::InitItem(ItemID param_2){
  ushort uVar1 = (ushort)param_2 >> 8;
  if ((uVar1 == DB_ARMOR) || (uVar1 == DB_SHIELD)) InitArmor(param_2);
  else if (uVar1 == DB_WEAPON) InitWeapon(param_2);
  else if (uVar1 == DB_POTION) InitPotion(param_2);
  else InitGear(param_2);
}


void ItemInstance::RemoveStatSpell(){
  FREEPTR(this->statMod,110);
  FREEPTR(this->spellCharge,116);
}

void ItemInstance::InitArmor(ItemID param_2){
  armour_RAM *paVar1;
  u8 bVar4;
  SpellInstance *pTVar3;
  armour_RAM *pcVar5;
  
  CLEAR(this);
  bVar4 = GetIDIndex(param_2);
  this->id = param_2;
  pcVar5 = armour_pointer->Armor[bVar4];
  this->name = pcVar5->name;
  this->aspect = pcVar5->aspect;
  this->price = pcVar5->price;
  if (pcVar5->stat != STAT_NONE) {
    ALLOC(this->statMod,0x90);
    SetStatMod(this->statMod,pcVar5->stat,pcVar5->statNum);
  }
  if (pcVar5->spell != SPELLIND_NONE) {
    ALLOC(this->spellCharge,0x96);
    malloc_equip_spell(pTVar3,pcVar5->spell,pcVar5->spellLV,pcVar5->rom0x2a);
  }
  return;
}

void ItemInstance::InitWeapon(ItemID param_2){
  weapon_ram *pwVar1;
  u8 bVar4;
  u8 (*pabVar2) [2];
  SpellInstance *pTVar3;
  weapon_ram *pcVar5;
  
  CLEAR(this);
  bVar4 = GetIDIndex(param_2);
  this->id = param_2;
  pcVar5 = gWeaponsDB->weapons[bVar4];
  this->name = pcVar5->name;
  this->aspect = pcVar5->aspect;
  this->price = pcVar5->price;
  if (pcVar5->stat != STAT_NONE) {
    ALLOC(this->statMod,0xb2);
    SetStatMod(this->statMod,pcVar5->stat,pcVar5->statMod);
  }
  if (pcVar5->spell != SPELLIND_NONE) {
    pTVar3 = (SpellInstance *)HeapAlloc(8,FILENAME,0xb8);
    this->spell = pTVar3;
    malloc_equip_spell(pTVar3,pcVar5->spell,pcVar5->spellAmmount,pcVar5->SpellLV);
  }
  return;
}

u16 potion_prices[17]=
{250,1000,200,500,50,300,200,200,2500,500,500,500,0,300,300,500,500};

void ItemInstance::InitPotion(ItemID param_2){
  char *pcVar1;
  char **ppcVar2;
  u8 bVar3;
  
  CLEAR(this);
  bVar3 = GetIDIndex(param_2);
  ppcVar2 = potion_names;
  this->id = param_2;
  pcVar1 = ppcVar2[bVar3];
  this->price = potion_prices[bVar3];
  this->name = pcVar1;
}

void ItemInstance::InitGear(ItemID param_2){
  s32 iVar1;
  Gear_RAM *pGVar4;
  
  CLEAR(this);
  iVar1 = search_item_array(param_2);
  pGVar4 = item_pointer->Gear;
  this->id = param_2;
  pGVar4+= iVar1;
  this->name = pGVar4->name;
  this->aspect = pGVar4->aspect;
  this->price = pGVar4->price;
  if (pGVar4->stat) {
    ALLOC(this->statMod,0xe8);
    SetStatMod(this->statMod,pGVar4->stat,pGVar4->StatMod);
  }
  if (pGVar4->spell != 0xff) {
    ALLOC(this->spellCharge,0xee);
    malloc_equip_spell(this->spellCharge,pGVar4->spell,pGVar4->spellVal1,pGVar4->spellVal2);
  }
  return;
}

u16 ItemInstance::GetPrice(){
  u16 uVar2;
  u32 uVar4;
  
  uVar4 = (u32)((u16)this->id >> 8);
  if (uVar4 - 5 < 2) {
    uVar2 = armour_pointer->Armor[GetIDIndex(this->id)].price;
  }
  else if (uVar4 == DB_WEAPON) {
    uVar2 = gWeaponsDB->weapons[GetIDIndex(this->id)].price;
    }
  else if (uVar4 == DB_POTION) {
    uVar2 = potion_prices[GetIDIndex(this->id)];
   }
  else {
    uVar2 = item_pointer->Gear[search_item_array(this->id)].price;
    }
  return uVar2;
}

void  ItemInstance::SetMagicCharges(s8 param_2){
  if ((param_2 != -1) && (this->spellCharge)) this->spellCharge->Charges = param_2;}