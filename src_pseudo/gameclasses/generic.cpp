#include "globals.h"
#include "weapondb.h"
#include "armordb.h"
#define FILENAME "../gameclasses/generic.cpp"

void ItemInstance::InitItem(ItemID param_2){
  u16 type = ITEMIDTYPE(param_2);
  if ((type == DB_ARMOR) || (type == DB_SHIELD)) InitArmor(param_2);
  else if (type == DB_WEAPON) InitWeapon(param_2);
  else if (type == DB_POTION) InitPotion(param_2);
  else InitGear(param_2);
}

void ItemInstance::RemoveStatSpell(){
  FREEPTR(this->statMod,110);
  FREEPTR(this->spellCharge,116);
}

void ItemInstance::InitArmor(ItemID param_2){
  CLEAR(this);
  u8 bVar4 = GETINDEX(param_2);
  this->id = param_2;
  ArmorRam *pcVar5 = &gArmorDBp->Armor[bVar4];
  this->name = pcVar5->name;
  this->aspect = pcVar5->aspect;
  this->price = pcVar5->price;
  if (pcVar5->stat != STAT_NONE) {
    ALLOC(this->statMod,144);
    SetStatMod(this->statMod,pcVar5->stat,pcVar5->statNum);
  }
  if (pcVar5->spell != SpellInd_NONE) {
    ALLOC(this->spellCharge,150);
    malloc_equip_spell(this->spellCharge,pcVar5->spell,pcVar5->spellLV,pcVar5->SpellCharge);
  }
}

void ItemInstance::InitWeapon(ItemID param_2){
  CLEAR(this);
  u8 bVar4 = GETINDEX(param_2);
  this->id = param_2;
  WeaponRam *pcVar5 = &gWeaponsDB->weapons[bVar4];
  this->name = pcVar5->name;
  this->aspect = pcVar5->aspect;
  this->price = pcVar5->price;
  if (pcVar5->stat != STAT_NONE) {
    ALLOC(this->statMod,0xb2);
    SetStatMod(this->statMod,pcVar5->stat,pcVar5->statMod);
  }
  if (pcVar5->spell != SpellInd_NONE) {
    ALLOC(this->spellCharge,0xb8);
    malloc_equip_spell(this->spellCharge,pcVar5->spell,pcVar5->spellAmmount,pcVar5->SpellLV);
  }
}

u16 potion_prices[17]=
{250,1000,200,500,50,300,200,200,2500,500,500,500,0,300,300,500,500};

void ItemInstance::InitPotion(ItemID id){
  char **ppcVar2;
  u8 bVar3;
  
  CLEAR(this);
  u8 index = GETINDEX(id);
  this->id = id;
  this->price = potion_prices[bVar3];
  this->name = potion_names[bVar3];
}

void ItemInstance::InitGear(ItemID param_2){
  s32 iVar1;
  Gear_RAM *pGVar4;
  
  CLEAR(this);
  iVar1 = search_item_array(param_2);
  pGVar4 = gItemDBp->Gear;
  this->id = param_2;
  pGVar4+= iVar1;
  this->name = pGVar4->name;
  this->aspect = pGVar4->aspect;
  this->price = pGVar4->price;
  if (pGVar4->stat) {
    ALLOC(this->statMod,232);
    SetStatMod(this->statMod,pGVar4->stat,pGVar4->StatMod);
  }
  if (pGVar4->spell != 0xff) {
    ALLOC(this->spellCharge,238);
    malloc_equip_spell(this->spellCharge,pGVar4->spell,pGVar4->spellVal1,pGVar4->spellVal2);
  }
}

u16 ItemInstance::GetPrice(){
  u16 ret;
  u32 type;
  
  type = (u32)(ITEMIDTYPE(this->id));
  if (type - DB_ARMOR < 2)
    ret = gArmorDBp->Armor[GETINDEX(this->id)].price;
  else if (type == DB_WEAPON)
    ret = gWeaponsDB->weapons[GETINDEX(this->id)].price;
  else if (type == DB_POTION)
    ret = potion_prices[GETINDEX(this->id)];
  else ret = gItemDBp->Gear[search_item_array(this->id)].price;
  return ret;
}

void  ItemInstance::SetMagicCharges(s8 param_2){
  if ((param_2 != -1) && (this->spellCharge)) this->spellCharge->Charges = param_2;}