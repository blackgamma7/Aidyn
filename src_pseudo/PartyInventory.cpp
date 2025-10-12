#include "inventory\PartyInventory.h"
#include "eventFlag.h"

PartyInventory::PartyInventory(){Reset();}
PartyInventory::~PartyInventory(){Clear();IInventory::~IInventory();}
void PartyInventory::Reset(){
    CLEAR(inv_slots);
    quantity = 0;
}

void PartyInventory::Clear(){
    for(u32 i=0;i<PARTY_CAPACITY;i++){
        if(inv_slots[i].Quantity){
            inv_slots[i].Quantity=0;
            if(inv_slots[i].base.id)inv_slots[i].base.RemoveStatSpell();
        }
    }
    Reset();
}
void PartyInventory::Load(SaveFile *sav){
  Inventory_item *pIVar2;
  uint i;
  
  Clear();
  for(i=0;i<0x80;i++) {
    inv_slots[i].Quantity = SaveParty::LoadBits(sav,8);
    if (inv_slots[i].Quantity == 0) {
      SaveParty::LoadItem(sav,NULL);
    }
    else {
      SaveParty::LoadItem(sav,&inv_slots[i].base);
      quantity++;
    }
  }
  Load80Items(sav);
  LoadKeyItems(sav);
  LoadLast15Items(sav);
  ChangeAspectPotions();
}

void PartyInventory::Save(SaveFile *sav){
  Inventory_item *pTVar2 = this->inv_slots;
  for(u32 i=0;i<0x80;i++){
    SaveParty::SaveBits(sav,pTVar2->Quantity,8);
    if (pTVar2->Quantity == 0) {
      SaveParty::SaveItem(sav,NULL);
    }
    else {
      SaveParty::SaveItem(sav,&pTVar2->base);
    }
    pTVar2++;
  }
  Save80(sav);
  SaveNoop(sav);
  Save239(sav);
}

s32 PartyInventory::AddItem(ItemID id,s32 quantity){
  s32 index;
  u8 bVar3;
  uint slot;
  //Turn "A" potions into Healing potions.
  if (id == Potion_Aspect) id = Potion_Healing;
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

s32 PartyInventory::TakeItem(ItemID id,s32 q){
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

s32 PartyInventory::IncItemQuantity(s32 slot,s32 q){  
  if (slot != -1) {
    Inventory_item *item = this->inv_slots + slot;
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
      if ((item->base).id) {
        item->base.RemoveStatSpell();
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

#define SLOTSEARCH(arr) int slot =SearchArray(arr,ARRAY_COUNT(arr),id)
//Array of 80 items that occupy select slots in inv_slots[128-207]
ItemID D_800F1890[]={
  Item_Spice, Item_Herb, Item_Gemstone, Item_Sulphur, Item_HellhoundHide,
  Item_DarkenbatHide, Item_BeastHide, Item_Chitlin,
  Scroll_SenseAura, Scroll_Oriana, Scroll_Wind, Scroll_Endurance, Scroll_Weakness,
  Scroll_6, Scroll_Strength, Scroll_RemovePoison,Scroll_Lightning, Scroll_Immolation,
  Scroll_11, Scroll_Escape, Scroll_EarthSmite, Scroll_DragonFlames, Scroll_Debilitation, Scroll_ControlElem,
  Scroll_AirShield, Scroll_Lighthouse, Scroll_AcidBolt, Scroll_AuraOfDeath,
  Scroll_SolarWrath, Scroll_Banishing, Scroll_Brilliance, 0x1138,
  0x113b, 0x113c, 0x113d, 0x113e, 0x110e, 0x1143, 0x1144, 0x1145,
  0x1146, 0x1147, 0x1148, 0x1149, 0x114a, 0x114c, 0x114d, 0x114e,
  0x1150, 0x1151, 0x1152, 0x1153, 0x1154, 0x1155, 0x1156, 0x1157,
  0x1158, 0x1159, 0x115a, 0x115b, 0x115c, 0x115d, 0x115e, 0x115f,
  Potion_Fire, Potion_Inferno, Potion_Sleep, Potion_Acid, Potion_Healing,
  Potion_Stamina, Potion_Curing, Potion_Antidote, Potion_Restore, Potion_Strength,
  Potion_Dexterity, Potion_Aspect, Potion_Jumping, Potion_Clarity, Potion_Defence, Potion_Steath };

s32 PartyInventory::AddKeyItem(ItemID id,s32 q){
  SLOTSEARCH(D_800F1890);
  if (slot != -1) AddNewItem(slot + 0x80,id,q);
  return slot != -1;
}

u16 key_item_flags_1[]={
  FLAG_HasTxominLetter,FLAG_HasAmaranth,FLAG_HasOrianaLetter,
  FLAG_HasMap1,FLAG_HasMap2,FLAG_HasMap4,FLAG_HasMap5,FLAG_HasMap6,
  FLAG_HasMap7,FLAG_HasMap8,FLAG_HasMap9,FLAG_HasMap10,FLAG_HasMap11,
  FLAG_HasMap12,FLAG_HasCradawghBody,FLAG_HasMap13,FLAG_HasMap14,
  FLAG_HasMap15,FLAG_HasMap16,FLAG_HasMapGoblin,FLAG_HasMap17,FLAG_HasMap18,
  FLAG_HasBowdenKey,FLAG_HasBlackKey,FLAG_HasSkullKey,FLAG_HasBloodKey,FLAG_HasBoneKey,
  FLAG_HasLighthouseKey,FLAG_HasLodinKey,FLAG_HasDragonKey,FLAG_HasRabisatAsp};
//Array of 31 Key items that occupy select slots in inv_slots[208-239]
ItemID key_item_array_2[]={
  Item_TxominLetter, Item_Amaranth, Item_OrianaLetter,
  Item_Map1, Item_Map2, Item_Map4, Item_Map5, Item_Map6,
  Item_Map7, Item_Map8, Item_Map9, Item_Map10, Item_Map11,
  Item_Map12, Item_CradawghBody, Item_Map13, Item_Map14, 
  Item_Map15, Item_Map16, Item_GoblinMap, Item_Map17, Item_Map18,
  Key_Bowden, Key_Black, Key_Skull, Key_Blood, Key_Bone,
  Key_Lighthouse, Key_lodin, Key_Dragon, Item_RabisatAsp };
// this array is for map items to reveal their respective region in the pause menu.
u16 key_item_flags_2[]={ 
    0, 0, 0,
    FLAG_Map1, FLAG_Map2, FLAG_Map4, FLAG_Map5, FLAG_Map6,
    FLAG_Map7, FLAG_Map8,FLAG_Map9, FLAG_Map10, FLAG_Map11,
    //BUG: Map 13's flag and Cradawgh's non-flag are swapped.
    FLAG_Map12, FLAG_Map13, 0, FLAG_Map14, 
    FLAG_Map15, FLAG_Map16, FLAG_MapGoblin, FLAG_Map17, FLAG_Map18,
    0,0,0,0,0,0,0,0,0};
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
    0x0541, 0x0640, 0x0734, 0x0757, Helm_SpiritDrake,
    Cloak_Nightdrake, Glove_Stormdrake, Ring_Magedrake, Wand_HornKynon, 
    Wand_Banner, Wand_Stormbreaker, Amulet_Pandara, Glove_Plate};

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
        if(inv_slots[i+239].base.id){
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
        if(inv_slots[i+239].Quantity)SaveParty::SaveItem(sav,&inv_slots[i+239].base);
        else SaveParty::SaveItem(sav,NULL);
    }
}
void PartyInventory::AddNewItem(int slot,ItemID id,s32 quant){
  Inventory_item *item = inv_slots + slot;
  item->base.InitItem(id);
  item->Quantity = quant;
  quantity++;
}
//search for the index of (query) in (array), which is (size) long
int PartyInventory::SearchArray(ItemID *array,u8 size,ItemID query){
  for(s32 i=0;i<size;i++){
      if (array[i] == query) return i;
  }
  return -1;
}
//don't use "A" potions - change them to healing potions
void PartyInventory::ChangeAspectPotions(){
    s32 index = this->GetItemIndex(Potion_Aspect);
    if(index!=-1){
        Inventory_item* i = &inv_slots[index];
        this->AddItem((Potion_Healing),i->Quantity);
        this->TakeItem(i->base.id,i->Quantity);
    }
}

