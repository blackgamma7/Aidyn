#include "globals.h"
#include "armordb.h"
#include "weapondb.h"

#define FILENAME "../gameclasses/item.cpp"

void make_temp_item(GearInstance *item,ItemID id) {
  CLEAR(item); //sizeof fits gear instance
  (item->base).id = id;
  u16 type = (u16)ITEMIDTYPE(id);

  //case-switch?
  if (type == 7) {
    make_temp_weapon_2((WeaponInstance*)item);
  }
  else {
    if (type < 8) {
      if (4 < type) {
        make_temp_armor_2((ArmorInstance*)item);
        return;
      }
    }
    else if (type == 0x10) {
      pass_to_make_temp_potion((ItemInstance*)item);
      return;
    }
    make_GearInstance_2(item);
  }
}

void clear_weapon_effects(WeaponInstance *param_1) {
  param_1->base.RemoveStatSpell();
  FREEPTR(param_1->SkillMod,79);
  if (param_1->enchantment){
    TempEnchant::StopSpellVisual(param_1->enchantment);
    FREE(param_1->enchantment,86);
  }
  FREEPTR(param_1->resist,92)
}

void make_temp_armor_2(ArmorInstance *param_1) {
  param_1->base.InitArmor((param_1->base).id);
  ArmorRam *aRam = &gArmorDBp->Armor[GETINDEX((param_1->base).id)];
  if (aRam->skill != SKILL_NONE) {
    ALLOC(param_1->skillmod,116);
    SetStatMod2(param_1->skillmod,aRam->skill,aRam->skillNum);
  }
  if (aRam->magic != SpellInd_NONE) {
    ALLOC(param_1->enchantment,123);
    TempEnchant::Init(param_1->enchantment,aRam->magic,aRam->magicLV,-1,aRam->magicLV,0);
  }
  if (aRam->element != ELEMENT_NONE) {
    ALLOC(param_1->resist,130);
    param_1->resist->element = aRam->element;
    param_1->resist->percent = aRam->resistpercent;
  }
}

void make_temp_weapon_2(WeaponInstance *param_1) {
  param_1->base.InitWeapon((param_1->base).id);
  WeaponRam *wRam = &gWeaponsDB->weapons[GETINDEX((param_1->base).id)];
  if (wRam->Skill != SKILL_NONE) {
    ALLOC(param_1->SkillMod,0x9b);
    SetStatMod2(param_1->SkillMod,wRam->Skill,wRam->SkillMod);
  }
  if (wRam->spell2 != SpellInd_NONE) {
    ALLOC(param_1->enchantment,162);
    TempEnchant::Init(param_1->enchantment,wRam->spell2,wRam->Spell2Ammount,-1,wRam->Spell2Ammount,0);
  }
  if (wRam->elementResist != ELEMENT_NONE) {
    ALLOC(param_1->resist,169);
    param_1->resist->element = wRam->elementResist;
    param_1->resist->percent = wRam->ResistPercent;
  }
}

void make_GearInstance_2(GearInstance *param_1) {
  param_1->base.InitGear((param_1->base).id);
  s16 uVar4 = search_item_array((param_1->base).id);
  Gear_RAM *pGVar1 = gItemDBp->Gear;
  param_1->damage = pGVar1[uVar4].damage;
  param_1->Protection = pGVar1[uVar4].Protection;
  param_1->STR = pGVar1[uVar4].INT;
  param_1->INT = pGVar1[uVar4].STR;
  if (pGVar1[uVar4].skill != SKILL_NONE) {
    ALLOC(param_1->skillMod,0xc6);
    SetStatMod2(param_1->skillMod,pGVar1[uVar4].skill,pGVar1[uVar4].SkillMod);
  }
  if (pGVar1[uVar4].magic != 0xff) {
    ALLOC(param_1->enchantment,205);
    TempEnchant::Init(param_1->enchantment,pGVar1[uVar4].magic,pGVar1[uVar4].magicAmmount,-1,
                      pGVar1[uVar4].magicAmmount,0);
  }
  if (pGVar1[uVar4].elementResist != ELEMENT_NONE) {
    ALLOC(param_1->resist,212);
    param_1->resist->element = pGVar1[uVar4].elementResist;
    param_1->resist->percent = pGVar1[uVar4].ResistPercent;
  }
}

void pass_to_make_temp_potion(ItemInstance *param_1) {param_1->InitPotion(param_1->id);}

void CharGear::Init(u8 slots) {
  this->usedItems = 0;
  this->maxItems = slots;
  ALLOCS(this->pItem,slots*sizeof(GearInstance*),243);
  memset(this->pItem,0,slots*sizeof(GearInstance*));
}

void CharGear::Free(){
  if (this->pItem != NULL) {
    for(u32 i=0;i<this->maxItems;i++){
      if(this->pItem[i]) {
        clear_weapon_effects((WeaponInstance *)this->pItem[i]);
        FREE(this->pItem[i],268);
        }
    }
    FREE(this->pItem,273);
  }
}

bool CharGear::AddItem(ItemID id) {
  bool ret = false;
  if (HasRoom()) {
    s32 index = FindFreeSlot();
    if (index == -1) ret = false;
    else {
      ALLOCL(this->pItem[index],294);
      make_temp_item(this->pItem[index],id);
      ret = true;
      this->usedItems++;
    }
  }
  return ret;
}

bool CharGear::HasRoom() {
  if (this->pItem == NULL) return false;
  else if (this->usedItems == this->maxItems)return false;
  else return FindFreeSlot() != -1;
}

s32 CharGear::FindFreeSlot() {
  for(u32 i=0;i<this->maxItems;i++){
    if(!this->pItem[i])return i;
  }
  return -1;
}

ItemID CharGear::GetEquippedOfType(u8 param_2,s32 param_3) {
  if (!this->usedItems) return 0;
  for(u32 i=0;i<this->maxItems;i++){
    if((this->pItem[i])&&(ITEMIDTYPE(this->pItem[i]->base.id)==param_2)){
        if(!--param_3)return this->pItem[i]->base.id;
    }
  }
  return 0;
}

void CharGear::RemoveItem(u8 slot) {
  if (this->pItem) {
    if (this->pItem[slot] != NULL) {
      clear_weapon_effects((WeaponInstance*)this->pItem[slot]);
      HFREE(this->pItem[slot],389);
      this->pItem[slot] = NULL;
      this->usedItems--;
    }
  }
}

u16 CharGear::GetSlotByID(ItemID id) {
  if (this->pItem == NULL) return -1;
  for(u8 i=0;i<this->maxItems;i++){
    if((this->pItem[i])&&(this->pItem[i]->base.id==id))return i;
  }
  return -1;
}

