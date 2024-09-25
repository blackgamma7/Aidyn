

void create_temp_spell(Temp_spell *S,ItemID ID,u8 RANK){
  Spell_RAM *pSVar2;
  
  S->level = RANK;
  S->id = ID;
  pSVar2 = gLoadedSpells->spells[GetIDIndex(ID)];
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
  S->exp_modifyer = ((u16)pSVar2->EXP_Modifyer * 0x18 + (u16)pSVar2->EXP_Modifyer) * 2;
  S->a = 0;
  S->b = 0;
  S->aspect_flag = pSVar2->unk0x1f;
}

s32 get_spell_exp_price(Temp_spell *S){
  s32 i = S->level + 1;
  return i * i * (u32)S->exp_modifyer;}

s32 get_spell_gold_price(Temp_spell *param_1){
  if (param_1->level) return (param_1->level + 1) * 40;
  return 200;
  }

ItemID get_spell_ingredient(Temp_spell *param_1){
  if (param_1->cost == Herb) return itemID_array[31];
  else if (param_1->cost == Spice) return itemID_array[30];
  else if (param_1->cost == Gemstone) return itemID_array[32];
  return itemID_array[30]; //default to spice
}

bool FUN_80083ff4(Temp_spell *param_1){
  
  switch(GetIDIndex(param_1->id)) {
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
    return true;
  default:
    return false;
  }

}

u8 Ofunc_8008404c(Temp_spell *param_1){
  GetIDIndex(param_1->id);
  return 1;
}

bool SpellLevelMaxed(Temp_spell *param_1){return 9 < param_1->level;}

void CreateTempEnchant(Temp_enchant *Ench,SpellEnum Index,u8 LV,u32 Timer,u8 UNK3,s32 UNK4){
  Ench->lv = LV;
  Ench->index = Index;
  Ench->timer = Timer;
  Ench->unk0x3 = UNK3;
  Ench->unk0x4 = UNK4;
  Ench->unk0x14 = -1;
  Ench->school = gLoadedSpells->spells[Index].School;
}

void FUN_800840dc(Temp_enchant *param_1){
  if ((param_1->unk0x14 != -1) && (gGlobals.screenFadeModeSwitch == 2)) {
    FUN_80095f6c(param_1->unk0x14);}
}

bool inc_effect_timer(Temp_enchant *param_1,u16 param_2,s32 param_3){
  u32 uVar1;
  u32 uVar2;
  
  uVar1 = param_1->timer;
  if (uVar1 != -1) {
    if (uVar1 == 0) return true;
    uVar2 = param_2 * param_3;
    if (param_2 == 0) {
      if (uVar1 <= 600) param_1->timer = 0;
      else param_1->timer -= 600;
    }
    else {
      if (uVar2 < uVar1) param_1->timer -= uVar2;
      else param_1->timer = 0;
    }
  }
  return false;
}

void malloc_equip_spell(SpellCharges *param_1,u8 param_2,u8 param_3,u8 param_4){
  Temp_spell *pTVar1;
  
  pTVar1 = (Temp_spell *)heapAlloc(0x24,FILENAME,0x138);
  param_1->Spell = pTVar1;
  create_temp_spell(pTVar1,(ItemID)(SpellList[param_2] | 0x300),param_4);
  param_1->Charges = param_3;
}

void Ofunc_80084200(Temp_spell **param_1){ //probably wrong type
  if (*param_1 ) {
    clear_temp_Stat_spell((Temp_weapon *)*param_1);
    HeapFree(*param_1,FILENAME,0x148);
    *param_1 = NULL;
  }
}

void malloc_spell(spellbook *param_1,u8 max){
  Temp_spell *x;
  u32 size;
  
  param_1->spell_count = 0;
  param_1->spells = NULL;
  if (max) {
    size = max<< 2;
    x = (Temp_spell *)heapAlloc(size,FILENAME,0x15a);
    param_1->spells = x;
    memset(x,0,size);
  }
}

void learn_spell(spellbook *param_1,ItemID param_2,u8 param_3){
  u32 uVar1;
  Temp_spell *pTVar2;
  u8 uVar3;
  u32 uVar4;
  u16 aIStack544 [46] [2];
  Temp_spell *pIVar1;
  
  uVar1 = (u32)param_1->spell_count;
  if ((uVar1 != 0) && (uVar1 != 0)) { //yes it seems to check twice
    pTVar2 = param_1->spells;
    uVar3 = 0;
    for (uVar3 = 0;uVar4 < uVar1;uVar3++) {
      pIVar1 = pTVar2[uVar3];
      aIStack544[uVar3] = (u16)pIVar1->id;
      aIStack544[uVar3][1] = (u16)pIVar1->level;
    } while (uVar4 < uVar1);
  }
  spellbok_free(param_1);
  malloc_spell(param_1,param_1->spell_count++);
  
  if (0 < (param_1->spell_count - 1)) {
    for (uVar3 = 0;uVar3 < (param_1->spell_count - 1);uVar3++) {
      pTVar2 = (Temp_spell *)heapAlloc(0x24,FILENAME,0x199);
      param_1->spells->[uVar3] = pTVar2;
      create_temp_spell(pTVar2,*(ItemID *)aIStack544[uVar3],*(u8 *)((s32)aIStack544[uVar3] + 3));
    }
  }
  pTVar2 = (Temp_spell *)heapAlloc(0x24,FILENAME,0x19d);
  param_1->spells[uVar3] = pTVar2;
  create_temp_spell(pTVar2,param_2,param_3);
}

bool knows_spell(spellbook *param_1,ItemID param_2,u8 *param_3){
  u32 uVar2;
  Temp_spell *psVar1;
  
  if (param_1->spells == NULL) return false;
  
  if (param_1->spell_count != 0) {
    for(uVar2 = 0;uVar2 < param_1->spell_count;uVar2++) {
      psVar1 = param_1->spells[uVar2];
      if ((psVar1) && (psVar1->id == param_2)) {
        *param_3 = (char)uVar2;
        return true;
      }
    }
  }
  return false;
}

void spellbok_free(spellbook *param_1){
  u32 uVar3 = 0;
  if (param_1->spells) {
    if (param_1->spell_count != 0) {
      while( true ) {
        if param_1->spells[uVar3]){
          clear_temp_Stat_spell(param_1->spells[uVar3]); //could be skipped, no applciable pointers
          HeapFree(param_1->spells[uVar3],FILENAME,0x1ed);
          param_1->spells[uVar3] = NULL;
        }
        if (param_1->spell_count <= ++uVar3) break;
      }
    }
    HeapFree(param_1->spells,FILENAME,0x1f1);
    param_1->spells = NULL;
  }
}
