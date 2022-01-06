typedef struct IconDict IconDict, *PIconDict;

struct IconDict { /* array Proceeded by dictionary length */
    u16 key;
    enum Borg8Enum value:16;
};

bool GetItemImage(ItemID param_1,Borg8Enum *param_2){
  Borg8Enum BVar1;
  u32 uVar2;
  u32 uVar3;
  IconDict *pIVar4;
  char err[];
  
  
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
    uVar2 = 0;
    if (ItemIconCount != 0) {
      do {
        if (ItemIcons[uVar2].key == param_1) {
          *param_2 = (u32)ItemIcons[uVar2].value;
          return true;
        }
        uVar2++;
      } while (uVar2 < ItemIconCount);
    }
    sprintf(gGlobals.Text,"Using default image for %d\n",param_1);
    debug_queue(gGlobals.Text);
    BVar1 = QuestinmarkIcon;
    break;
  default:
    sprintf(&err,"GetItemImage() - unknown ID: %d, type = %d, index = %d",param_1,param_1 >> 8);
    assert("menuimages.cpp",&err);
  case 0x10:
    BVar1 = IconPotion;
  }
  *param_2 = BVar1;
  return true;
}

bool getAspectIcon(ASPECT param_1,Borg8Enum *param_2){
  u32 i = 0;
  if (aspectIconCount != 0) {
    do {
      if ((s16)param_1 == aspectIcons[i].key) {
        *param_2 = (u32)aspectIcons[i].value;
        return true;
      }
      i++;
    } while (i < aspectIconCount);
  }
  return false;
}

bool getSchoolIcon(MagicSchoolEnum param_1,Borg8Enum *param_2){
  u32 i = 0;
  if (SchoolIconCount != 0) {
    do {
      if ((s16)param_1 == SchoolIcons[i].key) {
        *param_2 = (u32)SchoolIcons[i].value;
        return true;
      }
      i++;
    } while (i < SchoolIconCount);
  }
  return false;
}

bool get_spell_icon(ItemID param_1,Borg8Enum *param_2){
  u8 bVar1;
  u32 uVar3;
  
  bVar1=0;
  if (param_1 >> 8 == 3) {bVar1 = get_spell_icon_id(param_1));}
  uVar3 = 0;
  if (iconDictSpellSymbolCount != 0) {
    pIVar2 = iconDictSpellSymbol;
    do {
      if (bVar1 == iconDictSpellSymbol[uVar3].key) {
        *param_2 = (u32)iconDictSpellSymbol[uVar3].value;
        return true;
      }
      uVar3++;
    } while (uVar3 < iconDictSpellSymbolCount);
  }
  return false;
}

bool get_spell_icons(ItemID param_1,Borg8Enum *param_2,Borg8Enum *param_3,Borg8Enum *param_4){
  u8 bVar2;
  Borg8Enum BVar1;
  bool bVar3;
  ASPECT cVar1;
  
  bVar2 = GetIDIndex(param_1);
  cVar1 = spell_pointer->spells[bvar2].aspect;
  if (cVar1 == SOLAR_MAGIC) {BVar1 = SolarAspectIcon;}
  else {
    if (cVar1 != LUNAR_MAGIC) goto LAB_8004cb5c;
    BVar1 = LunarAspectIcon;}
  *param_2 = BVar1;
LAB_8004cb5c:
  bVar3 = getSchoolIcon(spell_pointer->spells[bvar2].School,param_3);
  if (bVar3 == false) {bVar3 = false;}
  else {
    bVar3 = get_spell_icon(param_1,param_4);
    bVar3 = bVar3 != false;
  }
  return bVar3;
}

bool get_skill_icon(CHAR_SKILL param_1,Borg8Enum *param_2){
  u32 i = 0;
  if (SkillIconCount != 0) {
    do {
      if ((s16)param_1 == SkillIcons[i].key) {
        *param_2 = (u32)SkillIcons[i].value;
        return true;
      }
      i++;
    } while (i < SkillIconCount);
  }
  return false;
}
