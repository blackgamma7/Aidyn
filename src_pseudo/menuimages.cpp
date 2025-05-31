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
  //TODO: finish. 286 entries.
};
u32 ItemIconCount=ARRAY_COUNT(ItemIcons);
IconDict SkillIcons[]={
  {SKILL_Alchemist,BORG8_IconSkAlchemist},
  {SKILL_Diplomat,BORG8_IconSkDiplomat},
  {SKILL_Healer,BORG8_IconSkHealer},
  {SKILL_Loremaster,BORG8_IconSkLoremaster},
  {SKILL_Mechanic,BORG8_IconSkMechanic},
  {SKILL_Merchant,BORG8_IconSkMerchant},
  {SKILL_Ranger,BORG8_IconSkRanger},
  {SKILL_Stealth,BORG8_IconSkStealth},
  {SKILL_Theif,BORG8_IconSkTheif},
  {SKILL_Troubador,BORG8_IconSkTroubador},
  {SKILL_Warrior,BORG8_IconSkWarrior},
  {SKILL_Wizard,BORG8_IconSkWizard},
};
u32 SkillIconCount=ARRAY_COUNT(SkillIcons);
IconDict aspectIcons[]={
  {ASPECT_NONE,0},
  {ASPECT_LUNAR,BORG8_IconAsLunar},
  {ASPECT_SOLAR,BORG8_IconAsSolar}
};
u32 aspectIconCount=ARRAY_COUNT(aspectIcons);
IconDict SchoolIcons[]={
  {SCHOOL_Chaos,BORG8_IconSpell4},
  {SCHOOL_Elemental,BORG8_IconSpell0},
  {SCHOOL_Naming,BORG8_IconSpell1},
  {SCHOOL_Necromancy,BORG8_IconSpell2},
  {SCHOOL_NONE,0},
  {SCHOOL_Star,BORG8_IconSpell3},
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
  if (param_1 >> 8 == DB_SPELL) bVar1 = get_spell_icon_id(gLoadedSpells,param_1));
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
  cVar1 = gLoadedSpells->spells[bVar2].aspect;
  if (cVar1 == SOLAR_MAGIC) *param_2 = BORG8_IconAsSolar;
  else if (cVar1 == LUNAR_MAGIC) *param_2 = BORG8_IconAsLunar;
  if (getSchoolIcon(gLoadedSpells->spells[bVar2].School,param_3) == false) return false;
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
