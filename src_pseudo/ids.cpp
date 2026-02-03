#include "itemDB.h"
#include "entity.h"
#include "crash.h"
#include "armordb.h"
#include "chestdb.h"
#include "weapondb.h"
#include "dialougEnt.h"

u8 ItemIsMap(ItemID id){
    if(ITEMIDTYPE(id)==DB_MISC){
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
  u8 *entriesP;
  u8 total;
  u32 uVar3;
  
  
  uVar3 = (u16)IDInd(x);
  uVar1 = -1;
  if (false) goto switchD_80075e2c_caseD_4;
  switch(ITEMIDTYPE(x)) {
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
  uVar1 = getIDIndex_sub(entriesP,total,IDInd(x));
switchD_80075e2c_caseD_4:
  if (uVar1 != -1) return (u8)uVar1;
  char txtBuff [144];
  sprintf(txtBuff,"Invalid id %d (%d)\nMay need to re-compile\nType = %d\n",
           x,uVar3,ITEMIDTYPE(x));
  CRASH("GetIdIndex (ids.cpp)",txtBuff);
}

u16 search_item_array(ItemID param_1){ 
  if (true) {
    switch(ITEMIDTYPE(param_1)) {
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
    WeaponInd_SpellbreakerAxe, WeaponInd_GiantAxe,       WeaponInd_LizardKingAxe,   WeaponInd_BloodAxe,
    WeaponInd_GloryMace,       WeaponInd_MorningStar,    WeaponInd_JesterMace,      WeaponInd_Mace,
    WeaponInd_ChaosFlameblade, WeaponInd_ChaosMaul,      WeaponInd_ElishevaSythe,   WeaponInd_Sythe,
    WeaponInd_ChaosSythe,      WeaponInd_BattleAxe,      WeaponInd_Club,            WeaponInd_Maul,
    WeaponInd_GreatAxe,        WeaponInd_Warhammer,      WeaponInd_AccuracyBow,     WeaponInd_ThunderBow,
    WeaponInd_LongBow,         WeaponInd_ShieldBow,      WeaponInd_HunterBow,       WeaponInd_HeartseekerBow,
    WeaponInd_GreatBow,        WeaponInd_ShortBow,       WeaponInd_ThrowingIron,    WeaponInd_DragonFang,
    WeaponInd_ChaosStaff,      WeaponInd_ChaosDeathwing, WeaponInd_BreklorFirestaff,WeaponInd_LugashStaff,
    WeaponInd_Staff,           WeaponInd_EhudStaff,      WeaponInd_ArchmageStaff,   WeaponInd_Pike,
    WeaponInd_Poleaxe,         WeaponInd_Spear,          WeaponInd_SwordMight,      WeaponInd_EnchBlade,
    WeaponInd_FiredrakeFang,   WeaponInd_IceStiletto,    WeaponInd_SwordTrahern,    WeaponInd_Warfang,
    WeaponInd_SwordLodin,      WeaponInd_StealthBlade,   WeaponInd_Dagger,          WeaponInd_Sheridan,
    WeaponInd_Broadsword,      WeaponInd_ChaosSword,     WeaponInd_Greatsword,      WeaponInd_Longsword,
    WeaponInd_Gladius,         WeaponInd_Sabre,          WeaponInd_Tanto,           WeaponInd_ShortSword,
    WeaponInd_CyclopsHurlstar, WeaponInd_DartDistance,   WeaponInd_PoisonDart,      WeaponInd_Hatchet,
    WeaponInd_Javelin,         WeaponInd_ThrowingKnife,  WeaponInd_IronwoodStaff,   WeaponInd_Lightreaver,
    WeaponInd_HockeyStick,     WeaponInd_CyclopsClub,    0xff,                      0};

u16 Weapon_borg5_lookup(u8 index){
  u16 weapon_borg5_ID[]={
    BORG5_WeaponSpellbreakerAxe, BORG5_WeaponGiantAxe,       BORG5_WeaponLizardKingAxe,   BORG5_WeaponBloodAxe,
    BORG5_WeaponGloryMace,       BORG5_WeaponMorningStar,    BORG5_WeaponJesterMace,      BORG5_WeaponMace,
    BORG5_WeaponChaosFlameblade, BORG5_WeaponChaosMaul,      BORG5_WeaponElishevaSythe,   BORG5_WeaponSythe,
    BORG5_WeaponChaosSythe,      BORG5_WeaponBattleAxe,      BORG5_WeaponClub,            BORG5_WeaponMaul,
    BORG5_WeaponGreatAxe,        BORG5_WeaponWarhammer,      BORG5_WeaponAccuracyBow,     BORG5_WeaponThunderBow,
    BORG5_WeaponLongBow,         BORG5_WeaponShieldBow,      BORG5_WeaponHunterBow,       BORG5_WeaponHeartseekerBow,
    BORG5_WeaponGreatBow,        BORG5_WeaponShortBow,       BORG5_WeaponThrowingIron,    BORG5_WeaponDragonFang,
    BORG5_WeaponChaosStaff,      BORG5_WeaponChaosStaff,     BORG5_WeaponBreklorFirestaff,BORG5_WeaponLugashStaff,
    BORG5_WeaponStaff,           BORG5_WeaponEhudStaff,      BORG5_WeaponArchmageStaff,   BORG5_WeaponPike,
    BORG5_WeaponPoleaxe,         BORG5_WeaponSpear,          BORG5_WeaponSwordMight,      BORG5_WeaponEnchBlade,
    BORG5_WeaponFiredrakeFang,   BORG5_WeaponIceStiletto,    BORG5_WeaponSwordTrahern,    BORG5_WeaponWarfang,
    BORG5_WeaponSwordLodin,      BORG5_WeaponStealthBlade,   BORG5_WeaponDagger,          BORG5_WeaponSheridan,
    BORG5_WeaponBroadsword,      BORG5_WeaponChaosSword,     BORG5_WeaponGreatsword,      BORG5_WeaponLongsword,
    BORG5_WeaponGladius,         BORG5_WeaponSabre,          BORG5_WeaponTanto,           BORG5_WeaponShortSword,
    BORG5_WeaponCyclopsHurlstar, BORG5_WeaponDartDistance,   BORG5_WeaponPoisonDart,      BORG5_WeaponHatchet,
    BORG5_WeaponJavelin,         BORG5_WeaponThrowingKnife,  BORG5_WeaponIronWoodStaff,   BORG5_WeaponLightreaver,
    BORG5_WeaponHockeyStick,     BORG5_WeaponCyclopsCulb,    -1,                          0};
  for(u16 i=0;weapons_with_borg5[i]!=0xFF;i++){
    if(weapons_with_borg5[i]==index)return weapon_borg5_ID[i];
  }
 return -1;
}

u16 GetWeaponBorg5(ItemID param_1){
    return Weapon_borg5_lookup(GETINDEX(param_1));
}


u16 GetArmorBorg5(ItemID param_1){
  u32 uVar1;
  u32 uVar2;
  
  uVar1 = gArmorDBp->GetBorg5(param_1);
  uVar2 = -1;
  if (uVar1 != BORG5_ShieldNONE) uVar2 = uVar1;
  return uVar2;
}

u16 D_800f14d4[]={
  ItemInd_LetterTxomin,ItemInd_Banner,ItemInd_HornKynon,
  ItemInd_HelmKendal,ItemInd_Stormbreaker,ItemInd_AmuletHaste,-1};
u16 ItemBorg5Search(ItemID param_1){  
  u16 uVar1 = search_item_array(param_1);
  u16 itemBorgs[]={
    BORG5_LetterTxomin,BORG5_GwerniaBannerItem,BORG5_HornKynon,
    BORG5_HatKendall,BORG5_Stormbreaker,BORG5_HasteAmulet,-1};
  for(u16 i=0;D_800f14d4[i]!=-1;i++){
    if(D_800f14d4[i]==uVar1) return itemBorgs[i];
  }
  return -1;
}

u16 get_item_borg5(ItemID param_1){
  if(ITEMIDTYPE(param_1)<=DB_DIALOUGEENTITY){
    u16(*modelGetters[])(ItemID)={
      NULL,ItemBorg5Search,NULL,NULL,NULL,GetArmorBorg5,GetArmorBorg5,
      GetWeaponBorg5,NULL,ItemBorg5Search,ItemBorg5Search,ItemBorg5Search,ItemBorg5Search,
      ItemBorg5Search,ItemBorg5Search,ItemBorg5Search,NULL,ItemBorg5Search,ItemBorg5Search,
      ItemBorg5Search,NULL};
      if(modelGetters[ITEMIDTYPE(param_1)])return modelGetters[ITEMIDTYPE(param_1)](param_1);
  };
  return -1;
}