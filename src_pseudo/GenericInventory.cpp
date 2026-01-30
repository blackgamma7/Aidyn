#include "inventory/GenericInventory.h"
#include "weapondb.h"
#include "crash.h"


u32 IInventory::HasItem(ItemID id){
    return this->GetItemIndex(id)!=-1;
}
ItemID key_item_ids[]={
    Item_TxominLetter,Item_Amaranth,Item_CradawghBody,Armor_Irondrake,
    Shield_Stardrake,Weapon_SwordLodin,Weapon_FiredrakeFang,Helm_SpiritDrake,
    Cloak_Nightdrake,Glove_Stormdrake,Ring_Magedrake,Wand_HornKynon,Wand_Stormbreaker,
    Scroll_Lighthouse,Key_Black,Key_Skull,Key_Blood,
    Key_Bone,Key_Lighthouse,Key_lodin,Key_Dragon};
u32 IInventory::HasNoKeyItem(){
    for(u32 i=0;i<ARRAY_COUNT(key_item_ids);i++){
        if(this->GetItemIndex(key_item_ids[i])!=-1)return false;
    }
    return true;
}

GenericInventory::GenericInventory(){this->Reset();}

GenericInventory::~GenericInventory(){
    this->Clear();
    IInventory::~IInventory();//this got inline'd
}

void GenericInventory::Reset(){
    CLEAR(this->inv_slots);
    this->quantity=0;
}
void GenericInventory::Clear(){
    for(u32 i=0;i<GEN_CAPACITY;i++){
        if(this->inv_slots[i].Quantity){
            this->inv_slots[i].Quantity=0;
            if(this->inv_slots[i].base.id)this->inv_slots[i].base.RemoveStatSpell();
        }
    }
    this->quantity=0;
}

void GenericInventory::Save(SaveFile*){}

void GenericInventory::Load(SaveFile*){}

s32 GenericInventory::AddItem(ItemID id,s32 q){
  // don't add cyclops club
  if(IDWeapon(weaponList[WeaponInd_CyclopsClub]) == id) return false;
  // don't add aspect potions, make them healing instead.
  if (id == Potion_Aspect) id = Potion_Healing;
  s32 index =this->GetItemIndex(id);
  if (index != -1) {
       this->IncItemQuantity(index,q);
      return true;
  }
  for(u32 i=0;i<GEN_CAPACITY;i++){
    if (this->inv_slots[i].Quantity == 0) {
      this->inv_slots[i].base.InitItem(id);
      this->inv_slots[i].Quantity=q;
      this->quantity++;
      return true;
    }
  }
  return false;
}

s32 GenericInventory::TakeItem(ItemID id,s32 q){
    s32 index = this->GetItemIndex(id);
    if(index!=-1)this->IncItemQuantity(index,-q);
    return (index!=-1);
}

s32 GenericInventory::GetQuantity(){return this->quantity;}

s32 GenericInventory::GetMaxQuantity(){return GEN_CAPACITY;}

s32 GenericInventory::GetItemIndex(ItemID id){
    for(u32 i=0;i<GEN_CAPACITY;i++){
        if((this->inv_slots[i].Quantity)&&(this->inv_slots[i].base.id==id))
        return i;
    }
    return -1;
}


Inventory_item * GenericInventory::GetItemEntry(s32 index){
  if ((index != -1) && (0 < this->inv_slots[index].Quantity))
    return this->inv_slots + index;
  return NULL;
}
#if DEBUGVER
char* sFilenameGI="../gameclasses/genericinventory.cpp";
#endif
s32 GenericInventory::IncItemQuantity(s32 slot,s32 q){
  if (slot != -1) {
    Inventory_item *entry = this->inv_slots + slot;
    s32 newq = entry->Quantity + q;
    if (0 < entry->Quantity) {
      entry->Quantity = newq;
      if (99 <= newq) {
        entry->Quantity = 99;
        return 99;
      }
      if (0 < newq) return entry->Quantity;
      entry->Quantity = 0;
      if ((entry->base).id) entry->base.RemoveStatSpell();
      if (this->quantity) {
        this->quantity--;
        return entry->Quantity;
      }
      #if DEBUGVER
      CRASH("Invalid Inventory",sFilenameGI);
      #endif
    }
  }
  return 0;
}

s32 GenericInventory::GetItemQuantity(s32 index){
  if (index != -1)
    return this->inv_slots[(int)index].Quantity;
  return 0;
}

IInventory::~IInventory(){delete this;}