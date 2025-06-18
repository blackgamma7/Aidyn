#include "globals.h"
#include "combat/CombatStruct.h"


void ShadowMergeBoost(int param_1){
 
  CharSheet *alaron = PARTY->Members[0];
  CharSheet *shadow = gCombatP->combatEnts[param_1].charSheetP;
  CharStats::AddBase(alaron->Stats,STAT_STR,6);
  CharStats::AddBase(alaron->Stats,STAT_INT,3);
  CharStats::AddBase(alaron->Stats,STAT_WIL,3);
  CharStats::AddBase(alaron->Stats,STAT_END,3);
  CharStats::AddBase(alaron->Stats,STAT_STAM,10);
  alaron->EXP->protection+= 5;
  u8 i;
  s16 mod;
  for(i=0;i<SKILLCOUNT;i++){
    if (shadow->Skills->getModdedSkill(i)) {
      mod = (shadow->Skills->capSkillBaseMax(i) - alaron->Skills->capSkillBaseMax(i));
      if (mod < 1) mod = 2;
      alaron->Skills->AddToBaseSkill(i,mod);
    }
  }
  for(i=0;i<WEAPONCOUNT;i++){
    if (shadow->Skills->getModdedWeapon(i)) {
      mod = (shadow->Skills->capWeaponBaseMax(i) - alaron->Skills->capWeaponBaseMax(i));
      if (mod < 1) mod = 2;
      alaron->Skills->AddToBaseWeapon(i,mod);
    }
  }
  //bug? shouldn't it check if there ARE skill points in shield?
  if (!shadow->Skills->getModdedSheild()) {
    mod = (shadow->Skills->capSheildBaseMax() - alaron->Skills->capSheildBaseMax());
    if (mod < 1) mod = 2;
    alaron->Skills->AddToBaseShield(mod);
  }
  for(i=0;i<shadow->spellbook->count;i++){
      SpellInstance* pSVar1 = shadow->spellbook->spells[i];
      if (pSVar1 != NULL) {
        u8 index;
        if (alaron->spellbook->HaveSpell((pSVar1->base).id,&index)) {
          SpellInstance* pSVar2 = alaron->spellbook->spells[index];
          mod = (pSVar1->level - pSVar2->level);
          if (mod < 1) mod = 2;
          mod = pSVar2->level + mod;
          if (10 < mod) mod = 10;
          pSVar2->level = mod;
        }
        else alaron->spellbook->NewSpell((pSVar1->base).id,pSVar1->level);
      }
  }
  setEventFlag(FLAG_ShadowMerge,true);
}

