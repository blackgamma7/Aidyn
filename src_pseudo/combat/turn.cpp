#include "combat/CombatStruct.h"
#include "globals.h"
#include "widgets/WidgetCombatTextbox.h"
#include "combat/markers.h"
#define FILENAME "../combatengine/turn.cpp"

void CombatTurn::FreeArray(CombatTurn_s *param_1) {FREEPTR(param_1->arr,0x29);}


void CombatTurn::Init(CombatTurn_s *param_1) {
  byte bVar7;
  u8 uVar4;
  u8 dexType3s;
  int *piVar8;
  u8 dexType1s;
  int dexType2A [32];
  int dexType3A [32];
  int dexType1A [32];
  int dexType0A [32];
  
  u8 uVar11 = 0;
  u8 uVar5 = 0;
  u8 dexType0s = 0;
  u8 dexType2s = 0;
  u8 bVar1 = gCombatP->EntCount;
  u32 uVar12 = (u32)bVar1;
  u8 i = 0;
  gCombatP->EnemiesAlive = 0;
  gCombatP->partyAlive = 0;
  gCombatP->EntsAlive = 0;
  u8 uVar9 = (u32)gCombatP->EntCount << 2;
  memset(dexType2A,0,uVar9);
  memset(dexType3A,0,uVar9);
  memset(dexType1A,0,uVar9);
  memset(dexType0A,0,uVar9);
  for(;i<uVar12;i++){
      CombatEntity *cEnt = (&gCombatP->combatEnts)[i];
      if (((cEnt) && (!Entity::isDead(cEnt->charSheetP))) &&(!cEnt->Flag6())) {
        gCombatP->EntsAlive++;
        if (i < gCombatP->partyCount)
          gCombatP->partyAlive++;
        else gCombatP->EnemiesAlive++;
        if (cEnt->Flag1()) {
          switch (cEnt->DEXCheck()){
          case 0:
            if(param_1->unk4){
                dexType0A[i] = 1;
                dexType0s++;
            }
            break;
          case 1:{
            dexType1A[i] = 1;
            dexType1s++;
            break;
          }
          case 2:{
              dexType2s++;
              dexType2A[i] = 1;
              break;
          }
          case 3:{
            dexType1s++;
            dexType3s++;
            dexType3A[i] = 1;
            dexType1A[i] = 1;
          }
          default:
            break;
          }
        }
      }
    }
  uVar9 = dexType0s + dexType1s + dexType2s + dexType3s;
  i = uVar9;
  if (i == 0) {
    param_1->unk1 = 0;
    param_1->unk0 = 0;
  }
  else {
    ALLOCS(param_1->arr,i,0xfb);
    memset(param_1->arr,0,i);
    i = 0;//not sure what "i" is used for after - inc'ed but not saved.
    while (dexType0s) {
      uVar4 = rand_range(0,bVar1 - 1);
      if (dexType0A[uVar4]) {
        dexType0s--;
        param_1->arr[i] = uVar4;
        dexType0A[uVar4] = 0;
        i++;
      }
    }
    dexType0s = 0;
    while (dexType2s) {
      uVar4 = rand_range(0,uVar12 - 1);
      if (dexType2A[uVar4]) {
        dexType2s--;
        param_1->arr[i] = uVar4;
        dexType2A[uVar4] = 0;
        i++;
      }
    }
    while (dexType3s) {
      uVar4 = rand_range(0,uVar12 - 1);
      if (dexType3A[uVar4] != 0) {
        dexType3s--;
        param_1->arr[i] = uVar4;
        dexType3A[uVar4] = 0;
        i++;
      }
    }
    while (dexType1s) {
      dexType3s = rand_range(0,uVar12 - 1);
      if (dexType1A[dexType3s]) {
        dexType1s++;
        param_1->arr[i] = (u8)dexType3s;
        dexType1A[dexType3s]=0;
        i++;
      }
    }
    param_1->unk0 = (byte)uVar9;
    param_1->unk1 = 0;
    gCombatP->current_Ent = (&gCombatP->combatEnts)[*param_1->arr];
  }
}

void CombatTurn::FUN_800737b4(CombatEntity *cEnt) {
  if (((!Entity::isDead(cEnt->charSheetP)) && (!cEnt->Flag6())) &&
     (gGlobals.playerDataArray[cEnt->index]))
    Actor::UnsetFlag4(gGlobals.playerDataArray[cEnt->index]);
}

bool CombatTurn::FUN_8007381c(CombatTurn_s *param_1) {
  CombatEntity *cEnt;
  CharSheet *Ent;
  bool bVar2;
  bool ret;
  int iVar1;
  u32 i;
  
  
  ret = true;
  if (!shadow_combat_func()) {
    for(i=0;i<gCombatP->EntCount;i++){
        cEnt = (&gCombatP->combatEnts)[i];
        if (((cEnt) && (cEnt->charSheetP)) &&
           (cEnt->charSheetP->Stats)) {
          if (cEnt->Flag2()) {
            iVar1 = CharStats::getModded(cEnt->charSheetP->Stats,STAT_STAM);
            if (CharStats::getModded(cEnt->charSheetP->Stats,STAT_STAM) < 1)
              cEnt->TroubadourEnd();
            else CharStats::addModdedHealth(cEnt->charSheetP->Stats,STAT_STAM,-1);
          }
          cEnt->numMoves = 0;
          cEnt->UnsetFlag(COMBATENT_FLAG3);
          Entity::IncEffects(Ent,cEnt,1);
        }
    }
    PARTY->DecRitualTimers(0,1);
    func_settting_leader_dead_flag(gCombatP);
    FreeArray(param_1);
    param_1->unk4^=1;
    Init(param_1);
    ret = false;
  }
  return ret;
}

void CombatTurn::PartyDead(CombatTurn_s *param_1) {
  gGlobals.combatBytes[0] = CombatState_13;
  combat_func_if_alaron_dead();
  if ((gCombatP->current_Ent) &&
     (copy_string_to_combat_textbox(gCombatP,ComString(PartyKO),0),
     gGlobals.goblinAmbush)) {
    CombatTextboxWidget_SetText(ComString(PlotPoison));
    CombatTextboxWidget_Lock(IDEntInd(Alaron));
  }
}

void CombatTurn::EnemiesDead(CombatTurn_s *param_1) {
  set_boss_flag();
  calc_combat_loot(gCombatP);
  gGlobals.combatBytes[0] = CombatState_12;
  gGlobals.screenFadeMode = 1;
  if ((gCombatP->current_Ent) &&
    (gCombatP->encounter_dat->EncounterID != FLAG_GoblinAmbush))
    copy_string_to_combat_textbox(gCombatP,ComString(PartyWins),0);
}

void CombatTurn::CountFighters(CombatTurn_s *param_1) {
  gCombatP->EnemiesAlive=gCombatP->partyAlive=gCombatP->EntsAlive = 0;
  for(u32 i=0;i<gCombatP->EntCount;i++) {
      CombatEntity *cEnt = &gCombatP->combatEnts[i];
      if ((((cEnt) && (!cEnt->Flag6())) &&(cEnt->Flag1())) &&(!Entity::isDead(cEnt->charSheetP))) {
        gCombatP->EntsAlive++;
        if (cEnt->Flag4()) gCombatP->EnemiesAlive++;
        else gCombatP->partyAlive++;
      }
  }
}

bool CombatTurn::IsBattleOver(CombatTurn_s *param_1) {
  bool ret;
  if (gCombatP->partyAlive == 0) {
    PartyDead(param_1);
    ret = true;
  }
  else {
    ret = false;
    if (gCombatP->EnemiesAlive == 0) {
      EnemiesDead(param_1);
      ret = true;
    }
  }
  return ret;
}

void CombatTurn::StartTurn(CombatTurn_s *param_1,CombatEntity *param_2,u8 param_3) {

  playerData *pDat = gGlobals.playerDataArray[param_2->index];
  if (pDat) {
    GiveCameraToPlayer(pDat);
    Camera::SetFeild70(&gGlobals.gameVars.camera,&(pDat->collision).pos);
  }
                    
  if ((param_2->flags & COMBATENT_BENCH)) {
    CSprintf(XJoins,param_2->charSheetP->name);
    param_2->UnsetFlag(COMBATENT_BENCH);
  }
  else CSprintf(XsTurn,param_2->charSheetP->name);
  if (param_2->Flag2()) CSprintf(TroubContinue,param_2->charSheetP->name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  param_2->UpdatePosition();
  param_2->Coord2IsCoord();
  CombatMarkers::Create(param_2);
  param_2->m8006f448();
  if (param_2->aiP){
    if ((param_2->aiP->flags & AIFlag_08)) {
      if (gCombatP->leaderDead)
        CombatAI::DebateFleeing(param_2,true);
      else
        CombatAI::DebateFleeing(param_2,param_3 != gCombatP->leaderIndex);
      gGlobals.combatBytes[0] = CombatState_8;
      gGlobals.combatBytes[1] = CombatState_8;
      if (CombatAI::IsAlly(param_2->aiP)) return;
      FUN_80072454(gCombatP->substruct2,param_2);
      FUN_80072454(gCombatP->substruct2 + 1,param_2);
      return;
    }
  }
  if (param_2->AtkType == ATKT_Potion) {
    s32 ind = PARTY->Inventory->GetItemIndex(IDPotion(param_2->item));
    if (ind == -1) {
      param_2->AtkType = 0;
      param_2->itemIndex = 0;
      u8 uVar6 = PARTY->GetMemberIndex(param_2->charSheetP->ID);
      if (uVar6 != 0xff) PARTY->RemoveWeaponsFrom(uVar6);
      param_2->ShowWeaponSheild();
    }
    param_2->itemIndex=ind;
  }
  FUN_80072454(gCombatP->substruct2,param_2);
  FUN_80072454(gCombatP->substruct2 + 1,param_2);
  gGlobals.combatBytes[1] = CombatState_1;
  gGlobals.combatBytes[0] = CombatState_1;
}


void CombatTurn::FUN_80073e3c(CombatTurn_s *param_1) {
  CombatEntity *pCVar1;
  bool bVar2;
  byte bVar3;
  bool bVar4;
  float fVar5;
  
  clear_camera_playerdata_focus();
  if (1 < gGlobals.combatBytes[0] - CombatState_12) {
    if (Entity::isDead((gGlobals.party)->Members[0]))
      combat_func_if_alaron_dead();
    else {
      FUN_800737b4(gCombatP->current_Ent);
      while( true ) {
        while( true ) {
          while( true ) {
            if ((++param_1->unk1>=param_1->unk0) && (FUN_8007381c(param_1))) {
              return;
            }
            CountFighters(param_1);
            bVar2 = false;
            if (gCombatP->enemy_index < 0xc) {
              bVar2 = gCombatP->encounter_dat->enemy_entities[gCombatP->enemy_index] != (ItemID)0x0;
            }
            if (bVar2) {
              gCombatP->EntsAlive++;
              gCombatP->EnemiesAlive++;
            }
            if (IsBattleOver(param_1)) return;
            if (bVar2) {
              gCombatP->EntsAlive--;
              gCombatP->EnemiesAlive--;
            }
            gCombatP->current_Ent = (&gCombatP->combatEnts)[param_1->arr[param_1->unk1]];
            gCombatP->current_Ent->SetMovementRange();
            gCombatP->current_Ent->Coord2IsCoord();
            gCombatP->current_Ent->UpdateMoveFlag();
            if (!Entity::isDead(pCVar1->charSheetP)) break;
          }
          if (gCombatP->current_Ent->Flag1()) break;
        }
        if (!gCombatP->current_Ent->Flag6()) break;
      }
      (gCombatP->SpellMarkerPos).x = gCombatP->current_Ent->GetCoordX();
      (gCombatP->SpellMarkerPos).y = gCombatP->current_Ent->GetCoordY();
      FUN_80074054(param_1);
      StartTurn(param_1,gCombatP->current_Ent,param_1->unk1);
      World::Lapse10Seconds(TerrainPointer);
      if (gCombatP->reinforcmentsWillFlee) {
        CombatTextboxWidget_SetText(ComString(ReinforceFlee));
      }
    }
  }
}

void CombatTurn::FUN_80074054(CombatTurn_s *param_1) {
  for(u32 i=0;i<gCombatP->EntCount;i++){
    CombatEntity *cEnt = (&gCombatP->combatEnts)[i];
    if (cEnt) {
      cEnt->UpdatePosition();
      cEnt->damage = 0;
      cEnt->Healing = 0;
      if (gGlobals.playerDataArray[i])
        Actor::UnsetFlag(gGlobals.playerDataArray[i],ACTOR_800|ACTOR_400);
      }
  }
}

