void create_temp_spell(Temp_spell *S,ItemID ID,byte RANK){
  Spell_RAM *pSVar2;
  
  S->level = RANK;
  S->id = ID;
  pSVar2 = spell_pointer->spells[GetIDIndex(ID)];
  S->name = pSVar2->Name;
  S->school = pSVar2->School;
  S->damage = pSVar2->Damage;
  S->stamina = pSVar2->stamina;
  S->cast = pSVar2->CastedMagic;
  S->target = pSVar2->Target;
  S->wizard = pSVar2->WizardREQ;
  S->aspect = pSVar2->Aspect;
  S->range = pSVar2->Range;
  S->cost = pSVar2->ingredient;
  S->exp_modifyer = ((ushort)pSVar2->EXP_Modifyer * 0x18 + (ushort)pSVar2->EXP_Modifyer) * 2;
  S->a = 0;
  S->b = 0;
  S->aspect_flag = pSVar2->unk0x1f;
}

int get_spell_exp_price(Temp_spell *S){
  int i = S->level + 1;
  return i * i * (uint)S->exp_modifyer;}

int get_spell_gold_price(Temp_spell *param_1){
  if (param_1->level != 0) {return (param_1->level + 1) * 40;}
  return 200;}

ItemID get_spell_ingredient(Temp_spell *param_1){
  if (param_1->cost == Herb) {return itemID_array[31];}
  else if (param_1->cost == Spice) {return itemID_array[30];}
  else if (param_1->cost == Gemstone) {return itemID_array[32];}
  return itemID_array[30]; //default to spice
}

bool func_80083ff4(ItemID *param_1){
  bool bVar1;
  
  switch((SpellEnum)GetIDIndex(*param_1)) {
  case Immolation:
  case escape:
  case AirSheild:
  case ControlElem:
  case debilitation:
  case strength:
  case teleportation:
  case brilliance:
  case stupidity:
  case charming:
  case controlMarquis:
  case endurance:
  case weakness:
  case cheatDeath:
  case AcidBolt:
  case auraOfDeath:
  case wraithTouch:
  case controlZombies:
  case darkness:
  case haste:
  case exhaustion:
  case stamina:
  case tapStamina:
  case wallOfBones:
  case spiritSheild:
  case poison:
  case mirror:
  case vsElemental:
  case vsNaming:
  case vsNecromancy:
  case vsStar:
  case photosynthesis:
  case solarWraith:
  case starlightSheild:
  case dexterity:
  case clumsiness:
  case frozenDoom:
  case light:
  case stellarGravity:
  case webOfStarlight:
    bVar1 = true;
    break;
  default:
    bVar1 = false;
  }
  return bVar1;
}

u8 Ofunc_8008404c(ItemID *param_1){
  GetIDIndex(*param_1);
  return 1;
}

bool SpellLevelMaxed(Temp_spell *param_1){return 9 < param_1->level;}

void CreateTempEnchant(Temp_enchant *Ench,SpellEnum Index,byte LV,uint Timer,byte UNK3,undefined4 UNK4){
  Ench->lv = LV;
  Ench->index = Index;
  Ench->timer = Timer;
  Ench->unk0x3 = UNK3;
  Ench->unk0x4 = UNK4;
  Ench->unk0x14 = 0xffff;
  Ench->school = spell_pointer->spells[Index].School;
}

void func_800840dc(Temp_enchant *param_1){
  if ((param_1->unk0x14 != 0xffff) && (gGlobals.screenFadeModeSwitch == 2)) {
    func_80095f6c(param_1->unk0x14);}
}

bool inc_effect_timer(Temp_enchant *param_1,u16 param_2,int param_3){
  uint uVar1;
  uint uVar2;
  
  uVar1 = param_1->timer;
  if (uVar1 != 0xffffffff) {
    if (uVar1 == 0) {return true;}
    uVar2 = param_2 * param_3;
    if (param_2 == 0) {
      if (uVar1 < 601) {param_1->timer = 0;}
      else {param_1->timer = uVar1 - 600;}
    }
    else {
      if (uVar2 < uVar1) {param_1->timer = uVar1 - uVar2;}
      else {param_1->timer = 0;}
    }
  }
  return false;
}

void malloc_equip_spell(SpellCharges *param_1,uint param_2,byte param_3,byte param_4){
  Temp_spell *pTVar1;
  
  pTVar1 = (Temp_spell *)Malloc(0x24,FILENAME,0x138);
  param_1->Spell = pTVar1;
  create_temp_spell(pTVar1,(ItemID)(SpellList[param_2 & 0xff] | 0x300),param_4);
  param_1->Charges = param_3;
}

void Ofunc_80084200(Temp_spell **param_1){ //probably wrong type
  if ((Temp_weapon *)*param_1 != (Temp_weapon *)0x0) {
    clear_temp_Stat_spell((Temp_weapon *)*param_1);
    Free(*param_1,FILENAME,0x148);
    *param_1 = NULL;
  }
}

void malloc_spell(spellbook *param_1,u8 param_2){
  Temp_spell *x;
  uint size;
  
  param_1->spell_count = 0;
  param_1->spells = NULL;
  if (param_2) {
    size = param_2<< 2;
    x = (Temp_spell *)Malloc(size,FILENAME,0x15a);
    param_1->spells = x;
    memset(x,0,size);
  }
}

void learn_spell(spellbook *param_1,ItemID param_2,byte param_3){
  uint uVar1;
  Temp_spell *pTVar2;
  uint uVar3;
  uint uVar4;
  u16 aIStack544 [46] [2];
  Temp_spell *pIVar1;
  
  uVar1 = (uint)param_1->spell_count;
  if ((uVar1 != 0) && (uVar1 != 0)) {
    pTVar2 = param_1->spells;
    uVar3 = 0;
    do {
      uVar4 = uVar3 + 1 & 0xff;
      pIVar1 = pTVar2[uVar3];
      aIStack544[uVar3] = (u16)pIVar1->id;
      aIStack544[uVar3][1] = (u16)pIVar1->level;
      uVar3 = uVar4;
    } while (uVar4 < uVar1);
  }
  uVar1 = param_1->spell_count + 1;
  uVar3 = uVar1 & 0xff;
  spellbok_free(param_1);
  malloc_spell(param_1,uVar3);
  param_1->spell_count = (byte)uVar3;
  
  if (0 < (uVar1 - 1)) {
    for (uVar3 = 0;uVar3 < (param_1->spell_count - 1);uVar3++) {
      pTVar2 = (Temp_spell *)Malloc(0x24,FILENAME,0x199);
      param_1->spells->[uVar3] = pTVar2;
      create_temp_spell(pTVar2,*(ItemID *)aIStack544[uVar3],*(byte *)((int)aIStack544[uVar3] + 3));
    }
  }
  pTVar2 = (Temp_spell *)Malloc(0x24,FILENAME,0x19d);
  param_1->spells[uVar3] = pTVar2;
  create_temp_spell(pTVar2,param_2,param_3);
}

bool knows_spell(spellbook *param_1,ItemID param_2,undefined *param_3){
  uint uVar2;
  Temp_spell *psVar1;
  
  if (param_1->spells == NULL) return false;
  
  if (param_1->spell_count != 0) {
    for(uVar2 = 0;uVar2 < param_1->spell_count;uVar2++) {
      psVar1 = param_1->spells[uVar2];
      if ((psVar1 != NULL) && (psVar1->id == param_2)) {
        *param_3 = (char)uVar2;
        return true;
      }
    }
  }
  return false;
}

void spellbok_free(spellbook *param_1){
  uint uVar3 = 0;
  if (param_1->spells) {
    if (param_1->spell_count != 0) {
      while( true ) {
        if param_1->spells[uVar3]){
          clear_temp_Stat_spell(param_1->spells[uVar3]); //could be skipped, no applciable pointers
          Free(param_1->spells[uVar3],FILENAME,0x1ed);
          param_1->spells[uVar3] = NULL;
        }
        if (param_1->spell_count <= ++uVar3) break;
      }
    }
    Free(param_1->spells,FILENAME,0x1f1);
    param_1->spells = NULL;
  }
}
