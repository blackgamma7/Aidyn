#include "globals.h"
#include "combat/Visuals.h"
#define FILENAME "../gameclasses/spell.cpp"

void TempSpell::Init(SpellInstance *S,ItemID ID,u8 RANK){
  S->level = RANK;
  S->base.id = ID;
  SpellRAM *sRam = &gSpellDBp->spells[GETINDEX(ID)];
  S->base.name = sRam->name;
  S->school = sRam->school;
  S->damage = sRam->damage;
  S->stamina = sRam->stamina;
  S->cast = sRam->CastedMagic;
  S->target = sRam->target;
  S->wizard = sRam->wizard;
  S->special = sRam->Aspect;
  S->range = sRam->range;
  S->cost = sRam->ingredient;
  S->expMod = sRam->expMod * 50;
  S->base.statMod = 0;
  S->base.spellCharge = 0;
  S->aspect_flag = sRam->unk0x1f;
}

s32 TempSpell::GetExpPrice(SpellInstance *S){
  s32 i = S->level + 1;
  return SQ(i) * (u32)S->expMod;
  }

s32 TempSpell::GetGoldPrice(SpellInstance *param_1){
  if (param_1->level) return (param_1->level + 1) * 40;
  return 200;
  }

ItemID TempSpell::GetIngredient(SpellInstance *param_1){
  switch(param_1->cost){
  case SPELLUSE_Herb: return itemID_array[ItemInd_Herb];
  case SPELLUSE_Spice: return itemID_array[ItemInd_Spice];
  case SPELLUSE_Gemstone: return itemID_array[ItemInd_Gemstone];
  }
  return itemID_array[ItemInd_Herb];
}


u8 TempSpell::IsBattleSpell(SpellInstance *param_1){

  if (true) {
    switch(GETINDEX((param_1->base).id))
    case SPELLIND_Immolation:
    case SPELLIND_Escape:
    case SPELLIND_AirShield:
    case SPELLIND_ControlElem:
    case SPELLIND_debilitation:
    case SPELLIND_Strength:
    case SPELLIND_Teleportation:
    case SPELLIND_Brilliance:
    case SPELLIND_Stupidity:
    case SPELLIND_Charming:
    case SPELLIND_ControlMarquis:
    case SPELLIND_Endurance:
    case SPELLIND_Weakness:
    case SPELLIND_CheatDeath:
    case SPELLIND_AcidBolt:
    case SPELLIND_AuraOfDeath:
    case SPELLIND_WraithTouch:
    case SPELLIND_ControlZombies:
    case SPELLIND_Darkness:
    case SPELLIND_Haste:
    case SPELLIND_Exhaustion:
    case SPELLIND_Stamina:
    case SPELLIND_tapStamina:
    case SPELLIND_WallOfBones:
    case SPELLIND_SpiritShield:
    case SPELLIND_Poison:
    case SPELLIND_Mirror:
    case SPELLIND_VsElemental:
    case SPELLIND_VsNaming:
    case SPELLIND_VsNecromancy:
    case SPELLIND_VsStar:
    case SPELLIND_Photosynthesis:
    case SPELLIND_SolarWrath:
    case SPELLIND_StarlightShield:
    case SPELLIND_Dexterity:
    case SPELLIND_Clumsiness:
    case SPELLIND_FrozenDoom:
    case SPELLIND_Light:
    case SPELLIND_StellarGravity:
    case SPELLIND_WebOfStarlight:
      return true;
  }
  return false;
}

//No clue what this was for.
u8 TempSpell::Ret1(SpellInstance *param_1){
  GETINDEX(param_1->base.id);
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
  Ench->school = gSpellDBp->spells[Index].school;
}

void TempEnchant::StopSpellVisual(Temp_enchant *param_1){
  if ((param_1->SpellVisualIndex != 0xffff) && (gGlobals.screenFadeModeSwitch == 2))
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
  
  ALLOC(pTVar1,312);
  param_1->Spell = pTVar1;
  TempSpell::Init(pTVar1,IDSpell(SpellList[param_2]),param_4);
  param_1->Charges = param_3;
}

void Ofunc_80084200(SpellCharges *param_1){
  if (param_1->Spell) {
    param_1->Spell->base.RemoveStatSpell();
    FREE(param_1->Spell,328);
  }
}

void SpellBook::Reset(u8 entries){
  this->count = 0;
  this->spells = NULL;
  if (entries) {
    SpellInstance **x = (SpellInstance **)HALLOC(entries*sizeof(SpellInstance*),0x15a);
    this->spells = x;
    memset(x,0,entries*sizeof(SpellInstance*));
  }
}

void SpellBook::NewSpell(ItemID id,u8 rank){
  SpellInstance *pTVar2;
  u8 i;
  u16 tSpells [46] [2];
  
  u32 uVar1 = this->count;
  if ((uVar1) && (uVar1)) { //yes it seems to check twice
    for (i = 0;i < uVar1;i++) {
      //save learned spells before clearing and expanding spellbook.
      tSpells[i][0] = this->spells[i]->base.id;
      tSpells[i][1] = this->spells[i]->level;
    }
  }
  Clear();
  Reset(++this->count);
  
  if (0 < (this->count - 1)) {
    for (i = 0;i < (this->count - 1);i++) {
      ALLOC(pTVar2,409);
      this->spells[i] = pTVar2;
      TempSpell::Init(pTVar2,(ItemID)tSpells[i][0],tSpells[i][1]);
    }
  }
  ALLOCL(this->spells[i],413);
  TempSpell::Init(this->spells[i],id,rank);
}

u8 SpellBook::HaveSpell(ItemID ID,u8 *oIndex){
  
  if (!this->spells) return false;
  if (this->count) {
    for(u8 i = 0;i < this->count;i++) {
      SpellInstance * psVar1 = this->spells[i];
      if ((psVar1) && (psVar1->base.id == ID)) {
        *oIndex = i;
        return true;
      }
    }
  }
  return false;
}

void SpellBook::Clear(){
  if (this->spells) {
   for(u32 i=0;i<this->count;i++){
    if (this->spells[i]){
      this->spells[i]->base.RemoveStatSpell(); //could be skipped, no applciable pointers
      FREE(this->spells[i],493);
    }
   }
    FREE(this->spells,497);
  }
}
