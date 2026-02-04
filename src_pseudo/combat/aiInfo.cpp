#include "globals.h"
#include "combat/CombatEntity.h"

#define FILENAME "../combatengine/aiInfo.cpp"

bool CombatAI::IsBoss(u8 param_1) {
  if (true) {
    switch(param_1) {
    case EntInd_NightBoss3:
    case EntInd_NightBoss2:
    case EntInd_NightBoss1:
    case EntInd_BanditBoss3:
    case EntInd_BanditBoss2:
    case EntInd_BanditBoss:
    case EntInd_ChaosMjr:
    case EntInd_Kitarak:
    case EntInd_LizardManBoss:
    case EntInd_Pochanargat:
    case EntInd_Ehud:
    case EntInd_Lugash:
    case EntInd_Wight:
      return true;
    }
  }
  return false;
}

void CombatAI::Init(CombatAIInfo *info,ItemID id,CombatEntity *cEnt) {
  ItemID IVar1;
  SpellCharges *pSVar4;
  WeaponInstance *pWVar5;
  u8 SVar8;
  int intStat;
  bool bVar9;
  u8 i;
  CharSheet *chara;
  
  u8 eInd = GETINDEX(id);
  info->unk18 = 0;
  info->weapon = NULL;
  if ((gEntityDB->entities[eInd].weapon[2] != (ItemID)0xffff) &&
     (gEntityDB->entities[eInd].weapon[0] != (ItemID)0xffff)) {
    ALLOC(pWVar5,99);
    IVar1 = gEntityDB->entities[eInd].weapon[0];
    info->weapon = pWVar5;
    createTempWeapon(pWVar5,IVar1);
  }
  bVar9 = false;
  i = 0;
  info->entIndex = -1;
  info->morale = gEntityDB->entities[eInd].morale;
  chara = cEnt->charSheetP;
  for(;i<5;i++) {
    if (chara->spellbook->spells[i] == NULL) {
      info->spells[i] = SpellInd_NONE;
    }
    else {
      bVar9 = true;
      SVar8 = GETINDEX((chara->spellbook->spells[i]->base).id);
      info->spells[i] = SVar8;
    }
  }
  if ((chara->armor[0] == NULL) || (pSVar4 = chara->armor[0]->base.spellCharge, pSVar4 == NULL)) {
    SVar8 = SpellInd_NONE;
  }
  else {
    bVar9 = true;
    SVar8 = GETINDEX((pSVar4->Spell->base).id);
  }
  info->spells[i] = SVar8;
  i++;
  if ((chara->armor[1] == NULL) || (pSVar4 = chara->armor[1]->base.spellCharge, pSVar4 == NULL)) {
    SVar8 = SpellInd_NONE;
  }
  else {
    bVar9 = true;
    SVar8 = GETINDEX((pSVar4->Spell->base).id);
  }
  info->spells[i] = SVar8;
  i++;
  pWVar5 = chara->weapons;
  intStat = CharStats::getBase(chara->Stats,STAT_INT);
  if (pWVar5 == NULL) {
    info->command = 5;
    info->spells[i] = SpellInd_NONE;
    info->unk1 = 2;
  }
  else {
    pSVar4 = (pWVar5->base).spellCharge;
    if(pSVar4) {
      bVar9 = true;
      info->spells[i] = GETINDEX((pSVar4->Spell->base).id);
    }
    else info->spells[i] = SpellInd_NONE;
    if (pWVar5->range == 0) {
      if (!bVar9) {
        if (intStat < 0xf) info->command = 0;
        else info->command = 1;
        info->unk1 = 1;
        goto LAB_80064ec0;
      }
      bVar9 = IsBoss(eInd);
      eInd = 9;
      if (!bVar9) {
        eInd = 6;
      }
    }
    else {
      if (!bVar9) {
        bVar9 = isBreathSpitOrSpikes(pWVar5);
        eInd = 4;
        if ((!bVar9) && (eInd = 3, intStat < 0xf)) {
          eInd = 2;
        }
        info->command = eInd;
        info->unk1 = 1;
        goto LAB_80064ec0;
      }
      bVar9 = IsBoss(eInd);
      eInd = 10;
      if (!bVar9) {
        bVar9 = isBreathSpitOrSpikes(pWVar5);
        eInd = 8;
        if (!bVar9) eInd = 7;
      }
    }
    info->command = eInd;
    info->unk1 = 2;
  }
LAB_80064ec0:
  info->combatEnt = cEnt;
  info->flags = AIFlag_08;
  info->unk12 = 0xff;
  info->unk13 = 0;
  info->unk7 = info->unk1;
}

void CombatAI::Free(CombatAIInfo *info) {
  if (info->weapon) {
    passto_clear_weapon_effects(info->weapon);
    FREE(info->weapon,318);
  }
}

