#include "inventory\PartyInventory.h"

PartyInventory::PartyInventory(){Reset();}
PartyInventory::~PartyInventory(){Clear();}
void PartyInventory::Reset(){
    CLEAR(inv_slots);
    quantity = 0;
}

void PartyInventory::Clear(){
    int i;
    for(i=0;i<PARTY_CAPACITY;i++){
        if(inv_slots[i].Quantity){
            inv_slots[i].Quantity=0;
            if(inv_slots[i].base.id.s)ItemInstance::RemoveStatSpell(inv_slots[i].base);
        }
    }
    this->Reset();
}
void PartyInventory::Load(SaveFile *sav){
  Inventory_item *pIVar2;
  uint i;
  
  this->Clear();
  for(i=0;i<0x80;i++) {
    inv_slots[i].Quantity = SaveParty::LoadBits(sav,8);
    if (inv_slots[i].Quantity == 0) {
      SaveParty::LoadItem(sav,NULL);
    }
    else {
      SaveParty::LoadItem(sav,inv_slots[i].base);
      quantity++;
    }
  }
  Load80Items(sav);
  LoadKeyItems(sav);
  LoadLast15Items(sav);
  ChangeAspectPotions();
}

void PartyInventory::Save(SaveFile *sav){
  Inventory_item *pTVar2;
  uint uVar1;
  
  uVar1 = 0;
  pTVar2 = this->inv_slots;
  for(i=0;i<0x80;i++){
    SaveParty::SaveBits(sav,pTVar2->Quantity,8);
    if (pTVar2->Quantity == 0) {
      SaveParty::SaveEquip(sav,NULL);
    }
    else {
      SaveParty::SaveEquip(sav,pTVar2->base);
    }
    pTVar2++;
  }
  Save80(sav);
  SaveNoop(sav);
  Save239(sav);
}

s32 PartyInventory::AddItem(ItemID id,s32 quantity){
  s32 index;
  bool bVar3;
  uint slot;
  //Turn "A" potions into Healing potions.
  if (id.s == 0x100b) id.s = 0x1004;
  index = this->GetItemIndex(id);
  if (index == -1) {
    bVar3 = true;
    if (!AddKeyItem(id,quantity)) {
      bVar3 = true;
      if (!AddKeyItem2(id,quantity)) {
        bVar3 = true;
        if (!AddKeyEquipment(id,quantity)) {
          for(slot=0;slot<0x80;slot++) {
            if (!inv_slots[slot].Quantity) {
              AddNewItem(slot,id,quantity);
              return true;
            }
          }
          bVar3 = false;
        }
      }
    }
  }
  else {
    this->IncItemQuantity(index,quantity);
    bVar3 = true;
  }
  return bVar3;
}

s32 PartyInventory::TakeItem(ItemID id,int q){
    s16 index = this->GetItemIndex(id);
    if(index!=-1)this->IncItemQuantity(index,-q);
    return (index!=-1);
}
s32 PartyInventory::GetQuantity(){return quantity;}
s32 PartyInventory::GetMaxQuantity(){return PARTY_CAPACITY;}
s32 PartyInventory::GetItemIndex(ItemID id){
    int i;
    for(i=0;i<PARTY_CAPACITY;i++){
        if(inv_slots[i].Quantity && inv_slots[i].base.id==id) return i;
    }
    return -1;
}
Inventory_item* PartyInventory::GetItemEntry(s32 slot){
  if ((slot != -1) && (inv_slots[slot].Quantity))
    return &inv_slots[slot];
  return NULL;
}

int PartyInventory::IncItemQuantity(int slot,int q){
  Inventory_item *item;
  
  if (slot != -1) {
    item = this->inv_slots + slot;
    if (0 < item->Quantity) {
      item->Quantity+=q;
      if (item->Quantity>=99) {
        item->Quantity = 99;
        return 99;
      }
      if (0 < item->Quantity) return item->Quantity;
      search_from_80_items((item->base).id);
      key_item_flags((item->base).id);
      Item_is_in_some_array((item->base).id);
      item->Quantity = 0;
      if ((item->base).id.s) {
        ItemInstance::RemoveStatSpell(&item->base);
      }
      quantity--;
      return item->Quantity;
    }
  }
  return 0;
}

s32 PartyInventory::GetItemQuantity(s32 slot){
  if (slot != -1) {
    return inv_slots[slot].Quantity;
  }
  return 0;
}

#define SLOTSEARCH(arr) int slot = search_for_item_in_array(arr,sizeof(arr)/sizeof(arr[0]),id)

ItemID D_800F1890[]=
  { 0x0111, 0x0112, 0x0113, 0x010e, 0x0121, 0x0122, 0x0123, 0x0124,
    0x1100, 0x1101, 0x1102, 0x1103, 0x1104, 0x1106, 0x1107, 0x1108,
    0x1109, 0x110a, 0x110b, 0x110c, 0x110d, 0x110e, 0x110f, 0x1110,
    0x1111, 0x112e, 0x1133, 0x1134, 0x1135, 0x1136, 0x1137, 0x1138,
    0x113b, 0x113c, 0x113d, 0x113e, 0x110e, 0x1143, 0x1144, 0x1145,
    0x1146, 0x1147, 0x1148, 0x1149, 0x114a, 0x114c, 0x114d, 0x114e,
    0x1150, 0x1151, 0x1152, 0x1153, 0x1154, 0x1155, 0x1156, 0x1157,
    0x1158, 0x1159, 0x115a, 0x115b, 0x115c, 0x115d, 0x115e, 0x115f,
    0x1000, 0x1001, 0x1002, 0x1003, 0x1004, 0x1005, 0x1006, 0x1007,
    0x1008, 0x1009, 0x100a, 0x100b, 0x100d, 0x100e, 0x100f, 0x1010 };

s32 PartyInventory::AddKeyItem(ItemID id,s32 q){
  SLOTSEARCH(D_800F1890);
  if (slot != -1) AddNewItem(slot + 0x80,id,q);
  return slot != -1;
}

u16 key_item_flags_1[]={
    3403,3404,3405,3406,3407,3408,3409,3410,3411,3412,3413,3414,3415,
    3416,3417,3418,3419,3420,3421,3422,3423,3424,3435,3426,3427,3428,
    3429,3430,3431,3432,0x195};
ItemID key_item_array_2[]={
    0x0100, 0x0101, 0x0102, 0x0105, 0x0106, 0x0107, 0x0108, 0x0109,
    0x010a, 0x010b, 0x010c, 0x010d, 0x010f, 0x0114, 0x0119, 0x011a,
    0x011b, 0x011c, 0x011d, 0x011e, 0x011f, 0x0120, 0x1200, 0x1201,
    0x1202, 0x1203, 0x1204, 0x1205, 0x1206, 0x1207, 0x0104 };
// this array is for map items to reveal their respective region in the pause menu.
u16 key_item_flags_2[]={ 
    0, 0, 0, 788, 789, 790, 791, 792, 793, 794,
    795, 796, 797, 798, 799, 0, 800, 801, 802,
    803, 804, 805, 0,0,0,0,0,0,0,0,0};
s32 PartyInventory::AddKeyItem2(ItemID id,s32 q){
    SLOTSEARCH(key_item_array_2);
    if(slot!=-1){
        setEventFlag(key_item_flags_2[slot],true);
        AddNewItem(slot + 0xd0,id,q);
        setEventFlag(key_item_flags_1[slot],true);
    }
    return(slot!=-1);
}
ItemID D_800F19F0[]={
    0x0541, 0x0640, 0x0734, 0x0757, 0x0926, 0x0a28, 0x0b29, 0x0c27,
    0x0d03, 0x0d00, 0x0d02, 0x1300, 0x0b04};

s32 PartyInventory::AddKeyEquipment(ItemID id,s32 q){
  SLOTSEARCH(D_800F19F0);
  if (slot != -1) AddNewItem(slot + 239,id,q);
  return slot != -1;
}

s32 PartyInventory::search_from_80_items(ItemID id){
    SLOTSEARCH(D_800F1890);
    return (slot!=-1);
}
s32 PartyInventory::key_item_flags(ItemID id){
    SLOTSEARCH(key_item_array_2);
    if(slot!=-1)setEventFlag(key_item_flags_1[slot],false);
    return (slot!=-1);
}

s32 PartyInventory::Item_is_in_some_array(ItemID id){
    SLOTSEARCH(D_800F19F0);
    return (slot!=-1);
}

void PartyInventory::Load80Items(SaveFile* sav){
    for(int i=0;i<80;i++){
        int quant = SaveParty::LoadBits(sav,8);
        if(quant)AddNewItem(i+0x80,D_800F1890[i],quant);
    }
}

void PartyInventory::LoadKeyItems(SaveFile* sav){
    for(int i=0;i<31;i++){
        if(getEventFlag(key_item_flags_1[i]))AddNewItem(i + 0xd0,key_item_array_2[i],1);
    }
}
void PartyInventory::LoadLast15Items(SaveFile *sav){
    for(int i=0;i<13;i++){
        SaveParty::LoadItem(sav,&inv_slots[i+239].base);
        if(inv_slots[i+239].base.id.s){
            inv_slots[i+239].Quantity=1;
            quantity++;
        }
    }
}
void PartyInventory::Save80(SaveFile *sav){
    for(int i=0;i<79;i++){
        SaveParty::SaveBits(sav,inv_slots[0x80+i].Quantity,8);
    }
}

void PartyInventory::SaveNoop(SaveFile* sav){}

void PartyInventory::Save239(SaveFile *sav){
    int i;
    for(i=0;i<12;i++){
        if(inv_slots[i+239].Quantity)SaveParty::SaveEquip(sav,&inv_slots[i+239].base);
        else SaveParty::SaveEquip(sav,NULL);
    }
}
void PartyInventory::AddNewItem(int slot,ItemID id,s32 quant){
  Inventory_item *item = inv_slots + slot;
  ItemInstance::InitItem((EquipInstance *)item->base,id);
  item->Quantity = quant;
  quantity++;
}

int PartyInventory::search_for_item_in_array(ItemID *array,u8 size,ItemID query){
  int i;
  for(i=0;i<size;i++){
      if (array[i].s == query.s) return i;
  }
  return -1;
}
//don't use "A" potions - change them to healing potions
void PartyInventory::ChangeAspectPotions(){
    s32 index = this->GetItemIndex((0x100B));
    if(index!=-1){
        Inventory_item* i = &inv_slots[index];
        this->AddItem((0x1004),i->Quantity);
        this->TakeItem(i->base.id,i->Quantity);
    }
}

