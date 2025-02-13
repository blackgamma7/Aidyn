#include "globals.h"

#define FILENAME "../gameclasses/spell.cpp"



extern ItemID itemID_array[];
void TempSpell::Init(SpellInstance *S,ItemID ID,u8 RANK){
  S->level = RANK;
  S->base.id = ID;
  Spell_RAM *sRam = gLoadedSpells->spells[GetIDIndex(ID)];
  S->base.name = sRam->Name;
  S->school = sRam->School;
  S->damage = sRam->Damage;
  S->stamina = sRam->stamina;
  S->cast = sRam->CastedMagic;
  S->target = sRam->Target;
  S->wizard = sRam->WizardREQ;
  S->special = sRam->Aspect;
  S->range = sRam->Range;
  S->cost = sRam->ingredient;
  S->exp_modifyer = ((u16)sRam->EXP_Modifyer * 0x18 + (u16)sRam->EXP_Modifyer) * 2;
  S->base.statMod = 0;
  S->base.spellCharge = 0;
  S->aspect_flag = sRam->unk0x1f;
}

s32 TempSpell::GetExpPrice(SpellInstance *S){
  s32 i = S->level + 1;
  return SQ(i) * (u32)S->exp_modifyer;
  }

s32 TempSpell::GetGoldPrice(SpellInstance *param_1){
  if (param_1->level) return (param_1->level + 1) * 40;
  return 200;
  }

ItemID TempSpell::GetIngredient(SpellInstance *param_1){
  switch(param_1->cost){
  case SPELLUSE_Herb: return itemID_array[0x1f];
  case SPELLUSE_Spice: return itemID_array[0x1e];
  case SPELLUSE_Gemstone: return itemID_array[0x20];
  }
  return itemID_array[0x1f];
}


u8 TempSpell::IsBattleSpell(SpellInstance *param_1){

  if (true) {
    switch(GetIDIndex((param_1->base).id))
    case SPELLIND_Immolation:
    case SPELLIND_escape:
    case SPELLIND_AirSheild:
    case SPELLIND_ControlElem:
    case SPELLIND_debilitation:
    case SPELLIND_strength:
    case SPELLIND_teleportation:
    case SPELLIND_brilliance:
    case SPELLIND_stupidity:
    case SPELLIND_charming:
    case SPELLIND_controlMarquis:
    case SPELLIND_endurance:
    case SPELLIND_weakness:
    case SPELLIND_cheatDeath:
    case SPELLIND_AcidBolt:
    case SPELLIND_auraOfDeath:
    case SPELLIND_wraithTouch:
    case SPELLIND_controlZombies:
    case SPELLIND_darkness:
    case SPELLIND_haste:
    case SPELLIND_exhaustion:
    case SPELLIND_stamina:
    case SPELLIND_tapStamina:
    case SPELLIND_wallOfBones:
    case SPELLIND_spiritSheild:
    case SPELLIND_poison:
    case SPELLIND_mirror:
    case SPELLIND_vsElemental:
    case SPELLIND_vsNaming:
    case SPELLIND_vsNecromancy:
    case SPELLIND_vsStar:
    case SPELLIND_photosynthesis:
    case SPELLIND_solarWraith:
    case SPELLIND_starlightSheild:
    case SPELLIND_dexterity:
    case SPELLIND_clumsiness:
    case SPELLIND_frozenDoom:
    case SPELLIND_light:
    case SPELLIND_stellarGravity:
    case SPELLIND_webOfStarlight:
      return true;
  }
  return false;
}

//No clue what this was for.
u8 TempSpell::Ret1(SpellInstance *param_1){
  GetIDIndex(param_1->base.id);
  return 1;
}

u8 TempSpell::IsMaxRank(SpellInstance *param_1){return 9 < param_1->level;}

void TempEnchant::Init(Temp_enchant *Ench,u8 Index,u8 LV,u32 Timer,u8 UNK3,
                      u32 UNK4){
  Ench->lv = LV;
  Ench->index = Index;
  Ench->timer = Timer;
  Ench->varA = UNK3;
  Ench->varB = UNK4;
  Ench->SpellVisualIndex = 0xffff;
  Ench->school = gLoadedSpells->spells[Index].School;
}

void TempEnchant::StopSpellVisual(Temp_enchant *param_1){
  if ((param_1->SpellVisualIndex != -1) && (gGlobals.screenFadeModeSwitch == 2))
    FUN_80095f6c(param_1->SpellVisualIndex);
}

u8 TempEnchant::IncTimer(Temp_enchant *param_1,u16 daySpeed,int delta){
  u32 uVar1;
  u32 uVar2;
  
  uVar1 = param_1->timer;
  if (uVar1 != -1) {
    if (uVar1 == 0) return true;
    uVar2 = daySpeed * delta;
    if (daySpeed == 0) {
      if (uVar1 <= SECONDS(10)) param_1->timer = 0;
      else param_1->timer -= SECONDS(10);
    }
    else {
      if (uVar2 < uVar1) param_1->timer -= uVar2;
      else param_1->timer = 0;
    }
  }
  return false;
}

void malloc_equip_spell(SpellCharges *param_1,u8 param_2,u8 param_3,u8 param_4){
  SpellInstance *pTVar1;
  
  ALLOC(pTVar1,0x138);
  param_1->Spell = pTVar1;
  TempSpell::Init(pTVar1,(ItemID)(SpellList[param_2] | 0x300),param_4);
  param_1->Charges = param_3;
}

void Ofunc_80084200(SpellInstance **param_1){ //probably wrong type
  if (*param_1 ) {
    ItemInstance::RemoveStatSpell(param_1->base);
    HFREE(*param_1,0x148);
    *param_1 = NULL;
  }
}


void SpellBook::Reset(Spellbook *param_1,u8 entries){
  param_1->count = 0;
  param_1->spells = NULL;
  if (entries) {
    SpellInstance **x = (SpellInstance **)HALLOC(entries*sizeof(SpellInstance*),0x15a);
    param_1->spells = x;
    memset(x,0,entries*sizeof(SpellInstance*));
  }
}



void SpellBook::NewSpell(Spellbook *param_1,ItemID id,u8 rank){
  u32 uVar1;
  SpellInstance *pTVar2;
  u8 i;
  u32 uVar4;
  u16 tSpells [46] [2];
  
  uVar1 = param_1->count;
  if ((uVar1) && (uVar1)) { //yes it seems to check twice
    for (i = 0;uVar4 < uVar1;i++) {
      tSpells[i][0] = param_1->spells[i]->base.id.s;
      tSpells[i][1] = param_1->spells[i]->level;
    }
  }
  Clear(param_1);
  Reset(param_1,++param_1->count);
  
  if (0 < (param_1->count - 1)) {
    for (i = 0;i < (param_1->count - 1);i++) {
      ALLOC(pTVar2,0x199);
      param_1->spells[i] = pTVar2;
      TempSpell::Init(pTVar2,*(ItemID *)tSpells[i],*(u8 *)((s32)tSpells[i] + 3));
    }
  }
  ALLOCL(param_1->spells[i],0x19d);
  TempSpell::Init(pTVar2,id,rank);
}

u8 SpellBook::HaveSpell(Spellbook *param_1,ItemID ID,u8 *oIndex){
  
  if (!param_1->spells) return false;
  if (param_1->count) {
    for(u8 i = 0;i < param_1->count;i++) {
      SpellInstance * psVar1 = param_1->spells[i];
      if ((psVar1) && (psVar1->base.id == ID)) {
        *oIndex = i;
        return true;
      }
    }
  }
  return false;
}

void SpellBook::Clear(Spellbook *param_1){
  u32 uVar3 = 0;
  if (param_1->spells) {
    if (param_1->count != 0) {
      while( true ) {
        if (param_1->spells[uVar3]){
          ItemInstance::RemoveStatSpell(param_1->spells[uVar3]); //could be skipped, no applciable pointers
          FREE(param_1->spells[uVar3],0x1ed);
        }
        if (param_1->count <= ++uVar3) break;
      }
    }
    FREE(param_1->spells,0x1f1);
  }
}
