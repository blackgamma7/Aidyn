#include "inventory/GenericInventory.h"
#include "crash.h"
extern u8 weaponList[];

u32 IInventory::HasItem(ItemID id){
    return this->GetItemIndex(id)!=-1;
}
ItemID key_item_ids[]={
    0x0100,0x0101,0x0119,0x0541,0x0640,0x0734,0x0757,0x0926,0x0a28,0x0b29,0x0c27,0x0d03,0x0d02,
  0x112e,0x1201,0x1202,0x1202,0x1203,0x1204,0x1205,0x1207};
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
  if((weaponList[0x20] | 0x700) == id) return false;
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
#ifdef DEBUGVER
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
      #ifdef DEBUGVER
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