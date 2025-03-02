typedef struct IconDict IconDict, *PIconDict;
#include "globals.h"

struct IconDict { /* array Proceeded by dictionary length */
    u16 key;
    u16 value;
};

u8 GetItemImage(ItemID param_1,u32 *param_2){
  u32 BVar1;
  u16 uVar2;
  char err[144];
  
  
  switch(param_1 >> 8) {
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
      for(uVar2 = 0;uVar2 < ItemIconCount;uVar2++) {
        if (ItemIcons[uVar2].key == param_1) {
          *param_2 = ItemIcons[uVar2].value;
          return true;
        } 
      }
    }
    Gsprintf("Using default image for %d\n",param_1);
    N64Print::Print(gGlobals.text);
    BVar1 = QuestinmarkIcon;
    break;
  default:
    sprintf(err,"GetItemImage() - unknown ID: %d, type = %d, index = %d",param_1,param_1 >> 8,param_1&0xFF);
    CRASH("menuimages.cpp",err);
  case DB_POTION:
    BVar1 = IconPotion;
  }
  *param_2 = BVar1;
  return true;
}

u8 getAspectIcon(u8 param_1,u32 *param_2){
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
  if (param_1 >> 8 == DB_SPELL) bVar1 = get_spell_icon_id(param_1));
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
  
  bVar2 = GetIDIndex(param_1);
  cVar1 = gLoadedSpells->spells[bVar2].aspect;
  if (cVar1 == SOLAR_MAGIC) *param_2 = SolarAspectIcon;
  else if (cVar1 == LUNAR_MAGIC) *param_2 = LunarAspectIcon;
  if (getSchoolIcon(gLoadedSpells->spells[bVar2].School,param_3) == false) return false;
  else return GetSpellIcon(param_1,param_4) != false;
}

u8 GetSkillIcons(u8 param_1,u32 *param_2){
  if (SkillIconCount) {
    for(i=0;i < SkillIconCount;i++) {
      if ((s16)param_1 == SkillIcons[i].key) {
        *param_2 = SkillIcons[i].value;
        return true;
      }
    }
  }
  return false;
}
