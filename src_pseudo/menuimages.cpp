typedef struct IconDict IconDict, *PIconDict;

struct IconDict { /* array Proceeded by dictionary length */
    u16 key;
    enum Borg8Enum value:16;
};

u8 GetItemImage(ItemID param_1,Borg8Enum *param_2){
  Borg8Enum BVar1;
  u16 uVar2;
  char err[144];
  
  
  switch(param_1 >> 8) {
  case 1:
  case 5:
  case 6:
  case 7:
  case 9:
  case 10:
  case 0xb:
  case 0xc:
  case 0xd:
  case 0xe:
  case 0xf:
  case 0x11:
  case 0x12:
  case 0x13:
    if (ItemIconCount) {
      for(uVar2 = 0;uVar2 < ItemIconCount;uVar2++) {
        if (ItemIcons[uVar2].key == param_1) {
          *param_2 = ItemIcons[uVar2].value;
          return true;
        } 
      }
    }
    Gsprintf("Using default image for %d\n",param_1);
    N64Print::Print(gGlobals.Text);
    BVar1 = QuestinmarkIcon;
    break;
  default:
    sprintf(&err,"GetItemImage() - unknown ID: %d, type = %d, index = %d",param_1,param_1 >> 8,param_1&0xFF);
    CRASH("menuimages.cpp",&err);
  case 0x10:
    BVar1 = IconPotion;
  }
  *param_2 = BVar1;
  return true;
}

u8 getAspectIcon(ASPECT param_1,Borg8Enum *param_2){
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

u8 getSchoolIcon(MagicSchoolEnum param_1,Borg8Enum *param_2){
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

u8 GetSpellIcon(ItemID param_1,Borg8Enum *param_2){
  u8 bVar1;
  u32 i;
  
  bVar1=0;
  if (param_1 >> 8 == 3) bVar1 = get_spell_icon_id(param_1));
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

u8 GetSpellIcons(ItemID param_1,Borg8Enum *param_2,Borg8Enum *param_3,Borg8Enum *param_4){
  u8 bVar2;
  Borg8Enum BVar1;
  ASPECT cVar1;
  
  bVar2 = GetIDIndex(param_1);
  cVar1 = gLoadedSpells->spells[bVar2].aspect;
  if (cVar1 == SOLAR_MAGIC) *param_2 = SolarAspectIcon;
  else if (cVar1 == LUNAR_MAGIC) *param_2 = LunarAspectIcon;
  if (getSchoolIcon(gLoadedSpells->spells[bVar2].School,param_3) == false) return false;
  else return GetSpellIcon(param_1,param_4) != false;
}

u8 GetSkillIcons(CHAR_SKILL param_1,Borg8Enum *param_2){
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
