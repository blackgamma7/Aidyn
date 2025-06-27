#include "globals.h"
#include "menuImages.h"
struct IconDict { /* array Proceeded by dictionary length */
    u16 key;
    u16 value;
};

IconDict ItemIcons[]={
  {0x0100,BORG8_IconItemScroll},
  {0x0101,BORG8_IconItemAmoranth},
  {0x0102,BORG8_IconItemParchment},
  {0x0103,BORG8_IconItemParchment},
  {0x0104,BORG8_IconItemAsp},
  {0x0105,BORG8_IconItemParchment},
  {0x0106,BORG8_IconItemParchment},
  {0x0107,BORG8_IconItemParchment},
  {0x0108,BORG8_IconItemParchment},
  {0x0109,BORG8_IconItemParchment},
  {0x010a,BORG8_IconItemParchment},
  {0x010b,BORG8_IconItemParchment},
  {0x010c,BORG8_IconItemParchment},
  {0x010d,BORG8_IconItemParchment},
  {0x010e,BORG8_IconItemGem},
  {0x010f,BORG8_IconItemParchment},
  {0x0111,BORG8_IconItemSpice},
  {0x0112,BORG8_IconItemHerb},
  {0x0113,BORG8_IconItemGem},
  {0x0114,BORG8_IconItemParchment},
  {0x0119,BORG8_IconItemRemains},
  {0x011a,BORG8_IconItemParchment},
  {0x011b,BORG8_IconItemParchment},
  {0x011c,BORG8_IconItemParchment},
  {0x011d,BORG8_IconItemParchment},
  {0x011e,BORG8_IconItemParchment},
  {0x011f,BORG8_IconItemParchment},
  {0x0120,BORG8_IconItemParchment},
  {0x0121,BORG8_IconItemHide},
  {0x0122,BORG8_IconItemHide},
  {0x0123,BORG8_IconItemHide},
  {0x0124,BORG8_IconItemHide},
  {0x0500,BORG8_IconItemChestArmor3},
  {0x0501,BORG8_IconItemChestArmor3},
  {0x0502,BORG8_IconItemChestArmor3},
  {0x0503,BORG8_IconItemChestArmor2},
  {0x0504,BORG8_IconItemChestArmor4},
  {0x0505,BORG8_IconItemChestArmor4},
  {0x0506,BORG8_IconItemChestArmor4},
  {0x0507,BORG8_IconItemChestArmor3},
  {0x0508,BORG8_IconItemChestArmor3},
  {0x0509,BORG8_IconItemChestArmor3},
  {0x050a,BORG8_IconItemChestArmor2},
  {0x050b,BORG8_IconItemChestArmor2},
  {0x050c,BORG8_IconItemChestArmor2},
  {0x050d,BORG8_IconItemChestArmor2},
  {0x050e,BORG8_IconItemChestArmor4},
  {0x050f,BORG8_IconItemChestArmor4},
  {0x0510,BORG8_IconItemChestArmor4},
  {0x051c,BORG8_IconItemChestArmor2},
  {0x051e,BORG8_IconItemChestArmor3},
  {0x051f,BORG8_IconItemChestArmor3},
  {0x0520,BORG8_IconItemChestArmor3},
  {0x053d,BORG8_IconItemChestArmor3},
  {0x053f,BORG8_IconItemChestArmor4},
  {0x0541,BORG8_IconItemChestArmor4},
  {0x0611,BORG8_IconItemShield1},
  {0x0612,BORG8_IconItemShield1},
  {0x0613,BORG8_IconItemShield1},
  {0x0614,BORG8_IconItemShield1},
  {0x0615,BORG8_IconItemShield1},
  {0x0616,BORG8_IconItemShield1},
  {0x0617,BORG8_IconItemShield1},
  {0x0618,BORG8_IconItemShield1},
  {0x0619,BORG8_IconItemShield1},
  {0x061a,BORG8_IconItemShield1},
  {0x061b,BORG8_IconItemShield1},
  {0x061d,BORG8_IconItemShield1},
  {0x0621,BORG8_IconItemShield1},
  {0x0622,BORG8_IconItemShield1},
  {0x0623,BORG8_IconItemShield1},
  {0x063c,BORG8_IconItemShield1},
  {0x063e,BORG8_IconItemShield1},
  {0x0640,BORG8_IconItemShield1},
  {0x0642,BORG8_IconItemShield1},
  {0x0643,BORG8_IconItemShield1},
  {0x070f,BORG8_IconItemAxe},
  {0x0710,BORG8_IconItemAxe},
  {0x0711,BORG8_IconItemClub},
  {0x0712,BORG8_IconItemSicle},
  {0x0713,BORG8_IconItemAxe},
  {0x0714,BORG8_IconItemMace},
  {0x0715,BORG8_IconItemMace},
  {0x0716,BORG8_IconItemMace},
  {0x0717,BORG8_IconItemMace},
  {0x0718,BORG8_IconItemBowArrow},
  {0x0719,BORG8_IconItemBowArrow},
  {0x071a,BORG8_IconItemBowArrow},
  {0x071b,BORG8_IconItemStaff},
  {0x071c,BORG8_IconItemBowArrow},
  {0x071d,BORG8_IconItemThrowIron},
  {0x071e,BORG8_IconItemPike},
  {0x071f,BORG8_IconItemHalberd},
  {0x0720,BORG8_IconItemPike},
  {0x0721,BORG8_IconItemStaff2},
  {0x0725,BORG8_IconItemSword3},
  {0x0726,BORG8_IconItemSword},
  {0x0727,BORG8_IconItemSword3},
  {0x0728,BORG8_IconItemSword3},
  {0x0729,BORG8_IconItemSword2},
  {0x072a,BORG8_IconItemSword2},
  {0x072b,BORG8_IconItemSword2},
  {0x072c,BORG8_IconItemSword2},
  {0x072d,BORG8_IconItemSword2},
  {0x072f,BORG8_IconItemAxe},
  {0x0730,BORG8_IconItemPike},
  {0x0731,BORG8_IconItemSword2},
  {0x0734,BORG8_IconItemSword3},
  {0x0735,BORG8_IconItemStaff2},
  {0x0736,BORG8_IconItemAxe},
  {0x0737,BORG8_IconItemSicle},
  {0x0738,BORG8_IconItemSword3},
  {0x0739,BORG8_IconItemStaff2},
  {0x073a,BORG8_IconItemSword2},
  {0x073b,BORG8_IconItemAxe},
  {0x073c,BORG8_IconItemSword2},
  {0x073e,BORG8_IconItemStaff2},
  {0x073f,BORG8_IconItemMace},
  {0x074d,BORG8_IconSlotHurlstar},
  {0x074e,BORG8_IconItemClub},
  {0x0750,BORG8_IconItemSword},
  {0x0752,BORG8_IconItemSword2},
  {0x0753,BORG8_IconItemStaff2},
  {0x0754,BORG8_IconItemMace},
  {0x0755,BORG8_IconItemBowArrow},
  {0x0756,BORG8_IconItemSword2},
  {0x0757,BORG8_IconItemSword3},
  {0x0759,BORG8_IconItemSword2},
  {0x075a,BORG8_IconItemThrowIron},
  {0x075d,BORG8_IconItemStaff},
  {0x075e,BORG8_IconItemBowArrow},
  {0x075f,BORG8_IconItemBowArrow},
  {0x0760,BORG8_IconItemBowArrow},
  {0x0761,BORG8_IconItemMace},
  {0x0762,BORG8_IconItemAxe},
  {0x0763,BORG8_IconItemStaff},
  {0x0764,BORG8_IconItemStaff2},
  {0x0765,BORG8_IconItemSword},
  {0x0766,BORG8_IconItemStaff2},
  {0x0767,BORG8_IconItemLightreaver},
  {0x0768,BORG8_IconItemHockeyStick},
  {0x0900,BORG8_IconItemKendallHat},
  {0x0901,BORG8_IconItemLeatherHood},
  {0x0902,BORG8_IconItemLeatherHood},
  {0x0903,BORG8_IconItemLeatherHood},
  {0x0904,BORG8_IconItemLeatherHood},
  {0x0906,BORG8_IconItemBlueHat},
  {0x0926,BORG8_IconItemLeatherHood},
  {0x0a00,BORG8_IconItemCloakA},
  {0x0a01,BORG8_IconItemCloakA},
  {0x0a02,BORG8_IconItemCloakB},
  {0x0a28,BORG8_IconItemCloakC},
  {0x0b00,BORG8_IconItemLeatherGlove},
  {0x0b01,BORG8_IconItemLeatherGlove},
  {0x0b02,BORG8_IconItemLeatherGlove},
  {0x0b03,BORG8_IconItem2Pads},
  {0x0b04,BORG8_IconItem2Pads},
  {0x0b29,BORG8_IconItemLeatherGlove},
  {0x0c08,BORG8_IconItemRing1},
  {0x0c09,BORG8_IconItemRing1},
  {0x0c0a,BORG8_IconItemRing1},
  {0x0c1f,BORG8_IconItemRing1},
  {0x0c27,BORG8_IconItemRing1},
  {0x0c31,BORG8_IconItemRing2},
  {0x0d0b,BORG8_IconItemWand},
  {0x0d03,BORG8_IconItemHorn},
  {0x0d04,BORG8_IconItemHarp},
  {0x0d00,BORG8_IconItemSythe},
  {0x0d01,BORG8_IconItemGem2},
  {0x0d02,BORG8_IconItemStormbreaker},
  {0x0d7c,BORG8_IconItemWand},
  {0x0d05,BORG8_IconItemWand},
  {0x0d06,BORG8_IconItemWand},
  {0x0d07,BORG8_IconItemWand},
  {0x0d08,BORG8_IconItemWand},
  {0x0d09,BORG8_IconItemWand},
  {0x0d0a,BORG8_IconItemWand},
  {0x0d0c,BORG8_IconItemWand},
  {0x0d0d,BORG8_IconItemWand},
  {0x0d0e,BORG8_IconItemWand},
  {0x0d0f,BORG8_IconItemWand},
  {0x0d10,BORG8_IconItemWand},
  {0x0d11,BORG8_IconItemWand},
  {0x0d12,BORG8_IconItemWand},
  {0x0d13,BORG8_IconItemWand},
  {0x0d14,BORG8_IconItemWand},
  {0x0d15,BORG8_IconItemWand},
  {0x0d16,BORG8_IconItemWand},
  {0x0d17,BORG8_IconItemWand},
  {0x0d18,BORG8_IconItemWand},
  {0x0d19,BORG8_IconItemWand},
  {0x0d1a,BORG8_IconItemWand},
  {0x0d1b,BORG8_IconItemGem3},
  {0x0d1c,BORG8_IconItemGem3},
  {0x0d1d,BORG8_IconItemRope},
  {0x0e00,BORG8_IconItemCirclet},
  {0x0e01,BORG8_IconItemCirclet},
  {0x0e02,BORG8_IconItemCirclet},
  {0x0e07,BORG8_IconItemCirclet},
  {0x0f00,BORG8_IconItemBoot},
  {0x0f01,BORG8_IconItemBoot},
  {0x0f04,BORG8_IconItemBoot},
  {0x0f05,BORG8_IconItemBoot},
  {0x0f2A,BORG8_IconItemBoot},
  {0x1100,BORG8_IconItemScroll},
  {0x1101,BORG8_IconItemScroll},
  {0x1102,BORG8_IconItemScroll},
  {0x1103,BORG8_IconItemScroll},
  {0x1104,BORG8_IconItemScroll},
  {0x1105,BORG8_IconItemScroll},
  {0x1106,BORG8_IconItemScroll},
  {0x1107,BORG8_IconItemScroll},
  {0x1108,BORG8_IconItemScroll},
  {0x1109,BORG8_IconItemScroll},
  {0x110a,BORG8_IconItemScroll},
  {0x110b,BORG8_IconItemScroll},
  {0x110c,BORG8_IconItemScroll},
  {0x110d,BORG8_IconItemScroll},
  {0x110e,BORG8_IconItemScroll},
  {0x110f,BORG8_IconItemScroll},
  {0x1110,BORG8_IconItemScroll},
  {0x1111,BORG8_IconItemScroll},
  {0x112e,BORG8_IconItemScroll},
  {0x1132,BORG8_IconItemScroll},
  {0x1133,BORG8_IconItemScroll},
  {0x1134,BORG8_IconItemScroll},
  {0x1135,BORG8_IconItemScroll},
  {0x1136,BORG8_IconItemScroll},
  {0x1137,BORG8_IconItemScroll},
  {0x1138,BORG8_IconItemScroll},
  {0x1139,BORG8_IconItemScroll},
  {0x113a,BORG8_IconItemScroll},
  {0x113b,BORG8_IconItemScroll},
  {0x113c,BORG8_IconItemScroll},
  {0x113d,BORG8_IconItemScroll},
  {0x113e,BORG8_IconItemScroll},
  {0x113f,BORG8_IconItemScroll},
  {0x1140,BORG8_IconItemScroll},
  {0x1141,BORG8_IconItemScroll},
  {0x1142,BORG8_IconItemScroll},
  {0x1143,BORG8_IconItemScroll},
  {0x1144,BORG8_IconItemScroll},
  {0x1145,BORG8_IconItemScroll},
  {0x1146,BORG8_IconItemScroll},
  {0x1147,BORG8_IconItemScroll},
  {0x1148,BORG8_IconItemScroll},
  {0x1149,BORG8_IconItemScroll},
  {0x114a,BORG8_IconItemScroll},
  {0x114b,BORG8_IconItemScroll},
  {0x114c,BORG8_IconItemScroll},
  {0x114d,BORG8_IconItemScroll},
  {0x114e,BORG8_IconItemScroll},
  {0x114f,BORG8_IconItemScroll},
  {0x1150,BORG8_IconItemScroll},
  {0x1151,BORG8_IconItemScroll},
  {0x1152,BORG8_IconItemScroll},
  {0x1153,BORG8_IconItemScroll},
  {0x1154,BORG8_IconItemScroll},
  {0x1155,BORG8_IconItemScroll},
  {0x1156,BORG8_IconItemScroll},
  {0x1157,BORG8_IconItemScroll},
  {0x1158,BORG8_IconItemScroll},
  {0x1159,BORG8_IconItemScroll},
  {0x115a,BORG8_IconItemScroll},
  {0x115b,BORG8_IconItemScroll},
  {0x115c,BORG8_IconItemScroll},
  {0x115d,BORG8_IconItemScroll},
  {0x115e,BORG8_IconItemScroll},
  {0x115f,BORG8_IconItemScroll},
  {0x1200,BORG8_IconItemKey1},
  {0x1201,BORG8_IconItemKey2},
  {0x1202,BORG8_IconItemKey3},
  {0x1203,BORG8_IconItemKey3},
  {0x1204,BORG8_IconItemKey3},
  {0x1205,BORG8_IconItemKey1},
  {0x1206,BORG8_IconItemKey2},
  {0x1207,BORG8_IconItemKey2},
  {0x1307,BORG8_IconItemAmulet1},
  {0x1300,BORG8_IconItemAmulet4},
  {0x1301,BORG8_IconItemAmulet3},
  {0x1302,BORG8_IconItemAmulet2},
  {0x1303,BORG8_IconItemAmulet1},
  {0x1304,BORG8_IconItemAmulet1},
  {0x1305,BORG8_IconItemAmulet1},
  {0x1306,BORG8_IconItemAmulet1},
  {0x1309,BORG8_IconItemAmulet1},
  //TODO: replace "magic number" with ItemID enums
};
u32 ItemIconCount=(ARRAY_COUNT(ItemIcons));
IconDict SkillIcons[]={
  {SKILL_Alchemist, BORG8_IconSkAlchemist},
  {SKILL_Diplomat,  BORG8_IconSkDiplomat},
  {SKILL_Healer,    BORG8_IconSkHealer},
  {SKILL_Loremaster,BORG8_IconSkLoremaster},
  {SKILL_Mechanic,  BORG8_IconSkMechanic},
  {SKILL_Merchant,  BORG8_IconSkMerchant},
  {SKILL_Ranger,    BORG8_IconSkRanger},
  {SKILL_Stealth,   BORG8_IconSkStealth},
  {SKILL_Theif,     BORG8_IconSkTheif},
  {SKILL_Troubador, BORG8_IconSkTroubador},
  {SKILL_Warrior,   BORG8_IconSkWarrior},
  {SKILL_Wizard,    BORG8_IconSkWizard},
};
u32 SkillIconCount=ARRAY_COUNT(SkillIcons);
IconDict aspectIcons[]={
  {ASPECT_NONE, 0},
  {ASPECT_LUNAR,BORG8_IconAsLunar},
  {ASPECT_SOLAR,BORG8_IconAsSolar}
};
u32 aspectIconCount=ARRAY_COUNT(aspectIcons);
IconDict SchoolIcons[]={
  {SCHOOL_Chaos,     BORG8_IconSpell4},
  {SCHOOL_Elemental, BORG8_IconSpell0},
  {SCHOOL_Naming,    BORG8_IconSpell1},
  {SCHOOL_Necromancy,BORG8_IconSpell2},
  {SCHOOL_NONE,      0},
  {SCHOOL_Star,      BORG8_IconSpell3},
};
u32 SchoolIconCount=ARRAY_COUNT(SchoolIcons);
IconDict iconDictSpellSymbol[]={
  {0,0x1b1},
  {1,0x1ab},
  {2,0x1ae},
  {3,0x1ac},
  {4,0x1aa},
  {5,0x1ad},
  {6,0x1af},
  {7,0x1b0},
  {8,0x1b2},
};
u32 iconDictSpellSymbolCount=ARRAY_COUNT(iconDictSpellSymbol);

u8 GetItemImage(ItemID id,u32 *index){
  u32 indexOut;

  switch(id >> 8) {
  case DB_MISC:
  case DB_ARMOR:
  case DB_SHIELD:
  case DB_WEAPON:
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
    if (ItemIconCount) {
      for(u32 i = 0;i < ItemIconCount;i++) {
        if (ItemIcons[i].key == id) {
          *index = ItemIcons[i].value;
          return true;
        } 
      }
    }
    Gsprintf("Using default image for %d\n",id);
    N64PRINT(gGlobals.text);
    indexOut = BORG8_IconItemUnk;
    break;
  case DB_POTION:
   indexOut = BORG8_IconItemPotion;
   break;
  #ifdef DEBUGVER
  default:
  char err[144];
    sprintf(err,"GetItemImage() - unknown ID: %d, type = %d, index = %d",id,id >> 8,id&0xFF);
    CRASH("menuimages.cpp",err);
  #endif
  }
  *index = indexOut;
  return true;
}

u8 getAspectIcon(u16 param_1,u32 *param_2){
  u16 i = 0;
  if (aspectIconCount) {
    for(i=0;i<aspectIconCount;i++) {
      if ((s16)param_1 == aspectIcons[i].key) {
        *param_2 = aspectIcons[i].value;
        return true;
      }
    }
  }
  return false;
}

u8 getSchoolIcon(u8 param_1,u32 *param_2){
  u16 i;
  if (SchoolIconCount) {
    for(i = 0;i < SchoolIconCount;i++) {
      if ((s16)param_1 == SchoolIcons[i].key) {
        *param_2 = SchoolIcons[i].value;
        return true;
      }
    }
  }
  return false;
}

u8 GetSpellIcon(ItemID param_1,u32 *param_2){
  u8 bVar1;
  u32 i;
  
  bVar1=0;
  if (param_1 >> 8 == DB_SPELL) bVar1 = gSpellDBp->GetIcon(param_1);
  if (iconDictSpellSymbolCount) {
    for(i=0;i<iconDictSpellSymbolCount;i++) {
      if (bVar1 == iconDictSpellSymbol[i].key) {
        *param_2 = (u32)iconDictSpellSymbol[i].value;
        return true;
      }
    }
  }
  return false;
}

u8 GetSpellIcons(ItemID param_1,u32 *param_2,u32 *param_3,u32 *param_4){
  u8 bVar2;
  u32 BVar1;
  u8 cVar1;
  
  bVar2 = GETINDEX(param_1);
  cVar1 = gSpellDBp->spells[bVar2].Aspect;
  if (cVar1 == 3) *param_2 = BORG8_IconAsSolar;
  else if (cVar1 == 4) *param_2 = BORG8_IconAsLunar;
  if (getSchoolIcon(gSpellDBp->spells[bVar2].School,param_3) == false) return false;
  else return GetSpellIcon(param_1,param_4) != false;
}

u8 GetSkillIcons(ItemID param_1,u32 *param_2){
  if (SkillIconCount) {
    for(u16 i=0;i < SkillIconCount;i++) {
      if (param_1 == SkillIcons[i].key) {
        *param_2 = SkillIcons[i].value;
        return true;
      }
    }
  }
  return false;
}
