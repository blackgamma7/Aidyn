#include "globals.h"
#include "menuImages.h"
struct IconDict { /* array Proceeded by dictionary length */
    u16 key;
    u16 value;
};

IconDict ItemIcons[]={
  {Item_TxominLetter,BORG8_IconItemScroll},
  {Item_Amaranth,BORG8_IconItemAmoranth},
  {Item_OrianaLetter,BORG8_IconItemParchment},
  {Item_KitarakLetter,BORG8_IconItemParchment},
  {Item_RabisatAsp,BORG8_IconItemAsp},
  {Item_Map1,BORG8_IconItemParchment},
  {Item_Map2,BORG8_IconItemParchment},
  {Item_Map4,BORG8_IconItemParchment},
  {Item_Map5,BORG8_IconItemParchment},
  {Item_Map6,BORG8_IconItemParchment},
  {Item_Map7,BORG8_IconItemParchment},
  {Item_Map8,BORG8_IconItemParchment},
  {Item_Map9,BORG8_IconItemParchment},
  {Item_Map10,BORG8_IconItemParchment},
  {Item_Sapphire,BORG8_IconItemGem},
  {Item_Map11,BORG8_IconItemParchment},
  {Item_Spice,BORG8_IconItemSpice},
  {Item_Herb,BORG8_IconItemHerb},
  {Item_Gemstone,BORG8_IconItemGem},
  {Item_Map12,BORG8_IconItemParchment},
  {Item_CradawghBody,BORG8_IconItemRemains},
  {Item_Map13,BORG8_IconItemParchment},
  {Item_Map14,BORG8_IconItemParchment},
  {Item_Map15,BORG8_IconItemParchment},
  {Item_Map16,BORG8_IconItemParchment},
  {Item_GoblinMap,BORG8_IconItemParchment},
  {Item_Map17,BORG8_IconItemParchment},
  {Item_Map18,BORG8_IconItemParchment},
  {Item_HellhoundHide,BORG8_IconItemHide},
  {Item_DarkenbatHide,BORG8_IconItemHide},
  {Item_BeastHide,BORG8_IconItemHide},
  {Item_Chitlin,BORG8_IconItemHide},
  {Armor_Cloth,BORG8_IconItemChestArmor3},
  {Armor_Leather,BORG8_IconItemChestArmor3},
  {Armor_Scale,BORG8_IconItemChestArmor3},
  {Armor_Chain,BORG8_IconItemChestArmor2},
  {Armor_PartialPlate,BORG8_IconItemChestArmor4},
  {Armor_FullPlate,BORG8_IconItemChestArmor4},
  {Armor_ImprovedPlate,BORG8_IconItemChestArmor4},
  {Armor_EnchHide,BORG8_IconItemChestArmor3},
  {Armor_Dragon,BORG8_IconItemChestArmor3},
  {Armor_JundarLeather,BORG8_IconItemChestArmor3},
  {Armor_TalewokMail,BORG8_IconItemChestArmor2},
  {Armor_TerminorMail,BORG8_IconItemChestArmor2},
  {Armor_IdenScale,BORG8_IconItemChestArmor2},
  {Armor_PomeScale,BORG8_IconItemChestArmor2},
  {Armor_EnchPlate,BORG8_IconItemChestArmor4},
  {Armor_RoyalPlate,BORG8_IconItemChestArmor4},
  {Armor_Chaos,BORG8_IconItemChestArmor4},
  {Armor_Scorpion,BORG8_IconItemChestArmor2},
  {Armor_BeastHide,BORG8_IconItemChestArmor3},
  {Armor_Hellhound,BORG8_IconItemChestArmor3},
  {Armor_Darkenbat,BORG8_IconItemChestArmor3},
  {Armor_ChaosRobes,BORG8_IconItemChestArmor3},
  {Armor_Sheridan,BORG8_IconItemChestArmor4},
  {Armor_Irondrake,BORG8_IconItemChestArmor4},
  {Shield_Buckler,BORG8_IconItemShield1},
  {Shield_Small,BORG8_IconItemShield1},
  {Shield_Large,BORG8_IconItemShield1},
  {Shield_Kite,BORG8_IconItemShield1},
  {Shield_Tower,BORG8_IconItemShield1},
  {Shield_Heater,BORG8_IconItemShield1},
  {Shield_Bronze,BORG8_IconItemShield1},
  {Shield_Jundar,BORG8_IconItemShield1},
  {Shield_Spirit,BORG8_IconItemShield1},
  {Shield_Hoplite,BORG8_IconItemShield1},
  {Shield_Chaos,BORG8_IconItemShield1},
  {Shield_Scorpion,BORG8_IconItemShield1},
  {Shield_Sun,BORG8_IconItemShield1},
  {Shield_Moon,BORG8_IconItemShield1},
  {Shield_Turtle,BORG8_IconItemShield1},
  {Shield_Dryad,BORG8_IconItemShield1},
  {Shield_Sheridan,BORG8_IconItemShield1},
  {Shield_Stardrake,BORG8_IconItemShield1},
  {Shield_Wight,BORG8_IconItemShield1},
  {Shield_Crab,BORG8_IconItemShield1},
  {Weapon_BattleAxe,BORG8_IconItemAxe},
  {Weapon_BloodAxe,BORG8_IconItemAxe},
  {Weapon_Club,BORG8_IconItemClub},
  {Weapon_Sythe,BORG8_IconItemSicle},
  {Weapon_GreatAxe,BORG8_IconItemAxe},
  {Weapon_Mace,BORG8_IconItemMace},
  {Weapon_Maul,BORG8_IconItemMace},
  {Weapon_MorningStar,BORG8_IconItemMace},
  {Weapon_Warhammer,BORG8_IconItemMace},
  {Weapon_GreatBow,BORG8_IconItemBowArrow},
  {Weapon_HunterBow,BORG8_IconItemBowArrow},
  {Weapon_LongBow,BORG8_IconItemBowArrow},
  {Weapon_Spikes,BORG8_IconItemStaff},
  {Weapon_ShortBow,BORG8_IconItemBowArrow},
  {Weapon_ThrowingIron,BORG8_IconItemThrowIron},
  {Weapon_Pike,BORG8_IconItemPike},
  {Weapon_Poleaxe,BORG8_IconItemHalberd},
  {Weapon_Spear,BORG8_IconItemPike},
  {Weapon_Staff,BORG8_IconItemStaff2},
  {Weapon_Broadsword,BORG8_IconItemSword3},
  {Weapon_Dagger,BORG8_IconItemSword},
  {Weapon_ChaosSword,BORG8_IconItemSword3},
  {Weapon_Greatsword,BORG8_IconItemSword3},
  {Weapon_Longsword,BORG8_IconItemSword2},
  {Weapon_Gladius,BORG8_IconItemSword2},
  {Weapon_Sabre,BORG8_IconItemSword2},
  {Weapon_ShortSword,BORG8_IconItemSword2},
  {Weapon_Tanto,BORG8_IconItemSword2},
  {Weapon_Hatchet,BORG8_IconItemAxe},
  {Weapon_Javelin,BORG8_IconItemPike},
  {Weapon_ChaosFlameblade,BORG8_IconItemSword2},
  {Weapon_SwordLodin,BORG8_IconItemSword3},
  {Weapon_ArchmageStaff,BORG8_IconItemStaff2},
  {Weapon_GiantAxe,BORG8_IconItemAxe},
  {Weapon_ElishevaSythe,BORG8_IconItemSicle},
  {Weapon_Warfang,BORG8_IconItemSword3},
  {Weapon_EhudStaff,BORG8_IconItemStaff2},
  {Weapon_SwordTrahern,BORG8_IconItemSword2},
  {Weapon_LizardKingAxe,BORG8_IconItemAxe},
  {Weapon_IceStiletto,BORG8_IconItemSword2},
  {Weapon_StaffLugash,BORG8_IconItemStaff2},
  {Weapon_JesterMace,BORG8_IconItemMace},
  {Weapon_CyclopsHurlstar,BORG8_IconSlotHurlstar},
  {Weapon_CyclopsClub,BORG8_IconItemClub},
  {Weapon_StealthBlade,BORG8_IconItemSword},
  {Weapon_Sheridan,BORG8_IconItemSword2},
  {Weapon_ChaosSythe,BORG8_IconItemStaff2},
  {Weapon_ChaosMaul,BORG8_IconItemMace},
  {Weapon_HeartseekerBow,BORG8_IconItemBowArrow},
  {Weapon_EnchBlade,BORG8_IconItemSword2},
  {Weapon_FiredrakeFang,BORG8_IconItemSword3},
  {Weapon_SwordMight,BORG8_IconItemSword2},
  {Weapon_DragonFang,BORG8_IconItemThrowIron},
  {Weapon_PoisonDart,BORG8_IconItemStaff},
  {Weapon_ThunderBow,BORG8_IconItemBowArrow},
  {Weapon_SheildBow,BORG8_IconItemBowArrow},
  {Weapon_AccuracyBow,BORG8_IconItemBowArrow},
  {Weapon_GloryMace,BORG8_IconItemMace},
  {Weapon_SpellbreakerAxe,BORG8_IconItemAxe},
  {Weapon_DartDistance,BORG8_IconItemStaff},
  {Weapon_BreklorFirestaff,BORG8_IconItemStaff2},
  {Weapon_ThrowingKnife,BORG8_IconItemSword},
  {Weapon_IronwoodStaff,BORG8_IconItemStaff2},
  {Weapon_Lightreaver,BORG8_IconItemLightreaver},
  {Weapon_HockeyStick,BORG8_IconItemHockeyStick},
  {Helm_Kendal,BORG8_IconItemKendallHat},
  {Helm_Tempests,BORG8_IconItemLeatherHood},
  {Helm_Defence,BORG8_IconItemLeatherHood},
  {Helm_Wisdom,BORG8_IconItemLeatherHood},
  {Helm_Charisma,BORG8_IconItemLeatherHood},
  {Helm_Wizard,BORG8_IconItemBlueHat},
  {Helm_SpiritDrake,BORG8_IconItemLeatherHood},
  {Cloak_Leather,BORG8_IconItemCloakA},
  {Cloak_Phantom,BORG8_IconItemCloakA},
  {Cloak_Mirari,BORG8_IconItemCloakB},
  {Cloak_Nightdrake,BORG8_IconItemCloakC},
  {Glove_Healing,BORG8_IconItemLeatherGlove},
  {Glove_Tinker,BORG8_IconItemLeatherGlove},
  {Glove_Bard,BORG8_IconItemLeatherGlove},
  {Glove_Jundar,BORG8_IconItem2Pads},
  {Glove_Plate,BORG8_IconItem2Pads},
  {Glove_Stormdrake,BORG8_IconItemLeatherGlove},
  {Ring_Lunar,BORG8_IconItemRing1},
  {Ring_Witch,BORG8_IconItemRing1},
  {Ring_Ether,BORG8_IconItemRing1},
  {Ring_Healing,BORG8_IconItemRing1},
  {Ring_Magedrake,BORG8_IconItemRing1},
  {Ring_Namer,BORG8_IconItemRing2},
  {Wand_11,BORG8_IconItemWand},
  {Wand_HornKynon,BORG8_IconItemHorn},
  {Wand_HarpIgnore,BORG8_IconItemHarp},
  {Wand_Banner,BORG8_IconItemSythe},
  {Wand_MoonGem,BORG8_IconItemGem2},
  {Wand_Stormbreaker,BORG8_IconItemStormbreaker},
  {Wand_WallOfBones,BORG8_IconItemWand},
  {Wand_VsStar,BORG8_IconItemWand},
  {Wand_VsNecro,BORG8_IconItemWand},
  {Wand_VsNaming,BORG8_IconItemWand},
  {Wand_VsElement,BORG8_IconItemWand},
  {Wand_TapStamina,BORG8_IconItemWand},
  {Wand_Fireball,BORG8_IconItemWand},
  {Wand_Gravity,BORG8_IconItemWand},
  {Wand_Persuasion,BORG8_IconItemWand},
  {Wand_Shielding,BORG8_IconItemWand},
  {Wand_Light,BORG8_IconItemWand},
  {Wand_Darkness,BORG8_IconItemWand},
  {Wand_FrozenDoom,BORG8_IconItemWand},
  {Wand_CrushingDeath,BORG8_IconItemWand},
  {Wand_WebOfStarlight,BORG8_IconItemWand},
  {Wand_Starfire,BORG8_IconItemWand},
  {Wand_WraithTouch,BORG8_IconItemWand},
  {Wand_Lightning,BORG8_IconItemWand},
  {Wand_Acid,BORG8_IconItemWand},
  {Wand_Immolation,BORG8_IconItemWand},
  {Wand_Banishing,BORG8_IconItemWand},
  {Wand_Revival,BORG8_IconItemWand},
  {Wand_GemSensing,BORG8_IconItemGem3},
  {Wand_GemAspect,BORG8_IconItemGem3},
  {Wand_Rope,BORG8_IconItemRope},
  {Belt_Life,BORG8_IconItemBelt},
  {Belt_Teleport,BORG8_IconItemBelt},
  {Belt_Reflect,BORG8_IconItemBelt},
  {Belt_Mercenary,BORG8_IconItemBelt},
  {Boot_Woodsman,BORG8_IconItemBoot},
  {Boot_Adamant,BORG8_IconItemBoot},
  {Boot_Leather,BORG8_IconItemBoot},
  {Boot_Striding,BORG8_IconItemBoot},
  {Boot_Speed,BORG8_IconItemBoot},
  {Scroll_SenseAura,BORG8_IconItemScroll},
  {Scroll_Oriana,BORG8_IconItemScroll},
  {Scroll_Wind,BORG8_IconItemScroll},
  {Scroll_Endurance,BORG8_IconItemScroll},
  {Scroll_Weakness,BORG8_IconItemScroll},
  {Scroll_Teleport,BORG8_IconItemScroll},
  {Scroll_6,BORG8_IconItemScroll},
  {Scroll_Strength,BORG8_IconItemScroll},
  {Scroll_RemovePoison,BORG8_IconItemScroll},
  {Scroll_Lightning,BORG8_IconItemScroll},
  {Scroll_Immolation,BORG8_IconItemScroll},
  {Scroll_11,BORG8_IconItemScroll},
  {Scroll_Escape,BORG8_IconItemScroll},
  {Scroll_EarthSmite,BORG8_IconItemScroll},
  {Scroll_DragonFlames,BORG8_IconItemScroll},
  {Scroll_Debilitation,BORG8_IconItemScroll},
  {Scroll_ControlElem,BORG8_IconItemScroll},
  {Scroll_AirShield,BORG8_IconItemScroll},
  {Scroll_Lighthouse,BORG8_IconItemScroll},
  {Scroll_Fireball,BORG8_IconItemScroll},
  {Scroll_AcidBolt,BORG8_IconItemScroll},
  {Scroll_AuraOfDeath,BORG8_IconItemScroll},
  {Scroll_SolarWrath,BORG8_IconItemScroll},
  {Scroll_Banishing,BORG8_IconItemScroll},
  {Scroll_Brilliance,BORG8_IconItemScroll},
  {Scroll_Charming,BORG8_IconItemScroll},
  {Scroll_CheatDeath,BORG8_IconItemScroll},
  {Scroll_Command,BORG8_IconItemScroll},
  {Scroll_ControlMarquis,BORG8_IconItemScroll},
  {Scroll_ControlZombie,BORG8_IconItemScroll},
  {Scroll_CrushingDeath,BORG8_IconItemScroll},
  {Scroll_Darkness,BORG8_IconItemScroll},
  {Scroll_DetectMoonPhase,BORG8_IconItemScroll},
  {Scroll_DetectSunPhase,BORG8_IconItemScroll},
  {Scroll_DetectChaos,BORG8_IconItemScroll},
  {Scroll_DetectTraps,BORG8_IconItemScroll},
  {Scroll_Dexterity,BORG8_IconItemScroll},
  {Scroll_DispelElemental,BORG8_IconItemScroll},
  {Scroll_DispelNaming,BORG8_IconItemScroll},
  {Scroll_DispelNecro,BORG8_IconItemScroll},
  {Scroll_DispelStar,BORG8_IconItemScroll},
  {Scroll_Clumsiness,BORG8_IconItemScroll},
  {Scroll_FrozenDoom,BORG8_IconItemScroll},
  {Scroll_Haste,BORG8_IconItemScroll},
  {Scroll_KnowAspect,BORG8_IconItemScroll},
  {Scroll_Light,BORG8_IconItemScroll},
  {Scroll_Mirror,BORG8_IconItemScroll},
  {Scroll_Stupidity,BORG8_IconItemScroll},
  {Scroll_Opening,BORG8_IconItemScroll},
  {Scroll_Photosynth,BORG8_IconItemScroll},
  {Scroll_ShieldStarlight,BORG8_IconItemScroll},
  {Scroll_Exhaustion,BORG8_IconItemScroll},
  {Scroll_ShieldSpirit,BORG8_IconItemScroll},
  {Scroll_Stamina,BORG8_IconItemScroll},
  {Scroll_Stealth,BORG8_IconItemScroll},
  {Scroll_StellarGrav,BORG8_IconItemScroll},
  {Scroll_TapStamina,BORG8_IconItemScroll},
  {Scroll_Teleportation,BORG8_IconItemScroll},
  {Scroll_VsElemental,BORG8_IconItemScroll},
  {Scroll_VsNaming,BORG8_IconItemScroll},
  {Scroll_VsNecro,BORG8_IconItemScroll},
  {Scroll_VsStar,BORG8_IconItemScroll},
  {Scroll_WallOfBones,BORG8_IconItemScroll},
  {Scroll_WebOfStarlight,BORG8_IconItemScroll},
  {Scroll_Whitefire,BORG8_IconItemScroll},
  {Key_Bowden,BORG8_IconItemKey1},
  {Key_Black,BORG8_IconItemKey2},
  {Key_Skull,BORG8_IconItemKey3},
  {Key_Blood,BORG8_IconItemKey3},
  {Key_Bone,BORG8_IconItemKey3},
  {Key_Lighthouse,BORG8_IconItemKey1},
  {Key_lodin,BORG8_IconItemKey2},
  {Key_Dragon,BORG8_IconItemKey2},
  {Amulet_Pork,BORG8_IconItemAmulet1},
  {Amulet_Pandara,BORG8_IconItemAmulet4},
  {Amulet_Elisheva,BORG8_IconItemAmulet3},
  {Amulet_Shamsuk,BORG8_IconItemAmulet2},
  {Amulet_STGem,BORG8_IconItemAmulet1},
  {Amulet_Haste,BORG8_IconItemAmulet1},
  {Amulet_Shield,BORG8_IconItemAmulet1},
  {Amulet_Mirror,BORG8_IconItemAmulet1},
  {Amulet_Marquis,BORG8_IconItemAmulet1},
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
  if (getSchoolIcon(gSpellDBp->spells[bVar2].school,param_3) == false) return false;
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
