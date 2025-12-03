#include "itemDB.h"
#include "entity.h"
#include "crash.h"
#include "armordb.h"
#include "chestdb.h"
#include "weapondb.h"
#include "dialougEnt.h"

u8 ItemIsMap(ItemID id){
    if(id>>8==1){
        u16 MapItemIds[]={5,6,7,8,9,10,11,12,13,14,15,20,21,23,32,0};
        for(u8 i=0;MapItemIds[i]!=0;i++){
            if((id&0xFF)==MapItemIds[i]) return true;
        }
    }
  return false;
}


int getIDIndex_sub(u8 *list,u8 total,u8 id){
  for(u32 i=0;i<total;i++){
    if(list[i]==id) return i;
  }
  return -1;
}

u16 GetIDIndex(ItemID x,char* file, u32 line){
  s32 uVar1;
  u8 *totalP;
  byte *entriesP;
  u8 total;
  u32 uVar3;
  
  
  uVar3 = (u16)x & 0xff;
  uVar1 = -1;
  if (false) goto switchD_80075e2c_caseD_4;
  switch((u32)((u16)x >> 8)) {
  case DB_ENTITY:
    entriesP = entityList;
    totalP = &gEntityDB->total;
    break;
  case DB_SPELL:
    entriesP = SpellList;
    totalP = &gSpellDBp->Total;
    break;
  default:
    goto switchD_80075e2c_caseD_4;
  case DB_ARMOR:
  case DB_SHIELD:
    entriesP = ArmorList;
    total = gArmorDBp->total;
    goto LAB_80075eb0;
  case DB_WEAPON:
    entriesP = weaponList;
    totalP = &gWeaponsDB->Total;
    break;
  case DB_CHEST:
    entriesP = lootList;
    totalP = &gChestDBp->total;
    break;
  case DB_POTION:
  case 21: //?
  case 22: //?
  case 23: //?
  case 24: //?
    uVar1 = uVar3;
    goto switchD_80075e2c_caseD_4;
  case DB_DIALOUGEENTITY:
    entriesP = DialougEntList;
    totalP = &gDialogEntityDBp->total;
    break;
  }
  total = *totalP;
LAB_80075eb0:
  uVar1 = getIDIndex_sub(entriesP,total,x&0xFF);
switchD_80075e2c_caseD_4:
  if (uVar1 != -1) return (byte)uVar1;
  char txtBuff [144];
  sprintf(txtBuff,"Invalid id %d (%d)\nMay need to re-compile\nType = %d\n",
           x,uVar3,(x >> 8));
  CRASH("GetIdIndex (ids.cpp)",txtBuff);
}

u16 search_item_array(ItemID param_1){ 
  if (true) {
    switch(param_1 >> 8) {
    case DB_MISC:
    case DB_HELMET:
    case DB_CLOAK:
    case DB_GLOVE:
    case DB_RING:
    case DB_WAND:
    case DB_BELT:
    case DB_BOOTS:
    case DB_SCROLL:
    case DB_KEYITEM:
    case DB_AMULET:
      for(u16 i=0;i<gItemDBp->total;i++){
        if(itemID_array[i]==param_1)return i;
      }
    }
  }
  return 0;
}

ItemID Ofunc_80075f9c(u8 index){
    for(u16 i=0;i<gItemDBp->total;i++){
        if((u8)itemID_array[i]==index)return itemID_array[i];
    }
    return -1;
}
u8 weapons_with_borg5[]={
    0x21,0x28,0x26,0x2a,0x22,0x30,0x23,0x2e,0x24,0x25,0x27,0x2c,0x32,0x29,0x2b,0x2f,0x2d,
    0x31,0x35,0x37,0x3b,0x36,0x3a,0x38,0x39,0x3c,0x5f,0x5e,0x3e,0x33,0x3f,0x40,0x45,0x41,
    0x42,0x43,0x34,0x44,0x4c,0x4f,0x50,0x51,0x52,0x53,0x54,0x4d,0x56,0x4e,0x55,0x57,0x58,
    0x59,0x5a,0x5b,0x5d,0x5c,0x61,0x62,0x63,0x65,0x66,0x60,0x3d,0x4b,0x1f,0x20,0xff,0};
u16 Weapon_borg5_lookup(u8 index){
    //TODO: ID borg5 indecies and replace here.
    u16 weapon_borg5_ID[]={
      0x3545,0x34C7,0x34EC,0x34B6,0x3513,0x34D7,0x3504,0x34D4,0x349A,0x34B8,0x34AC,0x34E1,
      0x34BB,0x34B4,0x34C1,0x34D6,0x34C9,0x34EF,0x3491,0x3496,0x34D2,0x3494,0x34CF,0x34F4,
      0x34CA,0x34E3,0x34A8,0x354B,0x34BD,0x34BD,0x3498,0x350F,0x34E8,0x34AA,0x348D,0x34D9,
      0x34DD,0x34E6,0x349C,0x34AE,0x34B0,0x34FE,0x354F,0x3551,0x34A2,0x34A0,0x34C2,0x3519,
      0x34B5,0x34BF,0x34CC,0x34D3,0x34F1,0x34DF,0x3547,0x34E5,0x349E,0x34A5,0x34DB,0x34CD,
      0x34D1,0x354D,BORG5_WeaponLightreaver,0x350D,BORG5_WeaponHockeyStick,0x34C1,-1,0};
    for(u16 i=0;weapons_with_borg5[i]!=0xFF;i++){
        if(weapons_with_borg5[i]==index)return weapon_borg5_ID[i];
    }
    return-1;
}

u16 GetWeaponBorg5(ItemID param_1){
    return Weapon_borg5_lookup(GETINDEX(param_1));
}


u16 GetArmorBorg5(ItemID param_1){
  u32 uVar1;
  u32 uVar2;
  
  uVar1 = gArmorDBp->GetBorg5(param_1);
  uVar2 = -1;
  if (uVar1 != 0x38f9) uVar2 = uVar1;
  return uVar2;
}

u16 D_800f14d4[]={0x16,0x55,0x59,0x29,0x57,0xc2,-1};
u16 ItemBorg5Search(ItemID param_1){  
  u16 uVar1 = search_item_array(param_1);
  u16 uStack72[]={0xcce,0x9D0,0x34FB,0x3502,0x3553,0x3517,-1};
  for(u16 i=0;D_800f14d4[i]!=0xffff;i++){
    if(D_800f14d4[i]==uVar1) return uStack72[i];
  }
  return -1;
}

u16 get_item_borg5(ItemID param_1){
  if(param_1>>8<=DB_DIALOUGEENTITY){
    u16(*modelGetters[])(ItemID)={
      NULL,ItemBorg5Search,NULL,NULL,NULL,GetArmorBorg5,GetArmorBorg5,
      GetWeaponBorg5,NULL,ItemBorg5Search,ItemBorg5Search,ItemBorg5Search,ItemBorg5Search,
      ItemBorg5Search,ItemBorg5Search,ItemBorg5Search,NULL,ItemBorg5Search,ItemBorg5Search,
      ItemBorg5Search,NULL};
      if(modelGetters[param_1>>8])return modelGetters[param_1>>8](param_1);
  };
  return -1;
}