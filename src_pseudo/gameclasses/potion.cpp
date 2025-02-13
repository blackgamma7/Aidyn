#include "globals.h"

void PotionEffect::Init(u8 ID_,u8 pow,u32 t){
  ID = ID_;
  power = pow;
  timer = t;
  SpellVisualIndex = -1;
}

void PotionEffect::RemoveSpellVisual(){
  if ((SpellVisualIndex != -1) && (gGlobals.screenFadeModeSwitch == 2)) {
    FUN_8009420c(SpellVisualIndex);
  }
}

//decrement timer by (mag*delta) or 10 in-game seconds if mag is 0
//return true if expired
bool PotionEffect::DecTimer(u16 mag,int delta){
  if (timer == 0) return true;
  if (mag == 0) {
    if (timer <= SECONDS(10)) timer = 0;
    else timer-= SECONDS(10);
  }
  else if (mag * delta < timer) timer-= mag * delta;
  else timer = 0;
  return false;
}


void load_potion_romstring(void){potion_names = func_romStrings(RomstringPotion,0x100);}

void clear_potion_romstrings(void){free_romstring(potion_names);}

//there's an identical one of these elsewhere. (file break?)
void SetStatMod2(StatMod *param_1,u8 stat,s8 mod){
  param_1->stat = stat;
  param_1->mod = mod;
}
