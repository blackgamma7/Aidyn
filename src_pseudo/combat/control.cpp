#include "combat/CombatStruct.h"
#include "combat/markers.h"
#include "globals.h"

u32 CombatPlayerTurnFlag=false;

u8 combat_controls(){
  CombatEntity *Ent;
  bool bVar1;
  bool bVar2;
  u8 bVar3;
  u8 delta;
  controller_aidyn *apcStack_20[4];
  
  bVar1 = false;
  delta = 0;
  while(Controller::GetInput(apcStack_20,0)) {
    bVar3 = delta + 1;
    delta = bVar3;
    if (((gGlobals.screenFadeMode == 0) && (!can_Combat_C_vert(apcStack_20[0]))) &&
       (bVar1 == false)) {
      bVar1 = combat_controls_caseSwitch(apcStack_20[0],bVar3);
      N64Print::Toggle(&gGlobals.DebugQueue,apcStack_20[0]);
    }
  }
  if (delta) {
    if (6 < delta) return 6;
    return delta;
  }
  if (CombatPlayerTurnFlag) {
    Ent = gCombatP->current_Ent;
    CombatPlayerTurnFlag = 0;
    if (Ent->aiP == NULL) {
      if (gGlobals.combatBytes[0] == 9) {
        CombatPlayerTurnFlag = 0;
        return 1;
      }
      if (gGlobals.combatBytes[0] == 0x12) {
        CombatPlayerTurnFlag = 0;
        return 1;
      }
      if (gGlobals.combatBytes[0] == 10) {
        CombatPlayerTurnFlag = 0;
        return 1;
      }
    }
    FUN_80072454(gCombatP->substruct2,Ent);
    FUN_80072454(gCombatP->substruct2 + 1,Ent);
  }
  return 1;
}

void FUN_8008d2cc(){
  bool bVar1 = gGlobals.combatBytes[0] == 9;
  cancel_combat_action();
  if (bVar1) gCombatP->current_Ent->ShowWeaponFlask();
}

void cancel_combat_action(){
  if (gGlobals.combatBytes[0] != 1) {
    gGlobals.combatBytes[0] = 1;
    gCombatP->current_Ent->UnsetFlag(COMBATENT_MEDIC);
    gCombatP->current_Ent->UnsetFlag(COMBATENT_HERBS);
    (gCombatP->SpellMarkerPos).x = gCombatP->current_Ent->GetCoordX();
    (gCombatP->SpellMarkerPos).y = gCombatP->current_Ent->GetCoordY();
    FUN_80072454(gCombatP->substruct2,gCombatP->current_Ent);
    FUN_80072454(gCombatP->substruct2 + 1,gCombatP->current_Ent);
    if (gGlobals.playerDataArray[gCombatP->current_Ent->index] != NULL) {
      GiveCameraToPlayer(gGlobals.playerDataArray[gCombatP->current_Ent->index]);
    }
  }
}

bool LZBStart_to_cancel_Turn(controller_aidyn *cont){
  bool bVar1;

  if (((cont->input & START_BUTTON) == 0) ||
     (bVar1 = renderTicker_GreaterThan3(gCombatP), !bVar1)) {
    bVar1 = false;
    if ((cont->input & (B_BUTTON|Z_BUTTON|L_BUTTON))) {
      cancel_combat_action();
      bVar1 = true;
    }
  }
  else {
    gCombatP->renderTicker = 0;
    setCombatCameraMode(0);
    if (gCombatP->current_Ent) giveCameratoThisPlayer(gCombatP->current_Ent->index);
    bVar1 = true;
    gGlobals.combatBytes[0] = 0xe;
    gGlobals.combatBytes[1] = 1;
    gGlobals.unk14fc = false;
  }
  return bVar1;
}


bool combat_control_press_start(controller_aidyn *cont){
  if (((cont->input & START_BUTTON)) && (renderTicker_GreaterThan3(gCombatP))
     ) {
    gCombatP->renderTicker = 0;
    FUN_800290a4();
    return true;
  }
  return false;
}


bool FUN_8008d4d0(controller_aidyn *cont){
  bool bVar2 = false;
  if (gCombatP->SenseAuraWidget) {
    if (cont->input == 0) bVar2 = false;
    else {
      gCombatP->SenseAuraWidget->SetState(WidgetS_Closing);
      gCombatP->SenseAuraWidget = NULL;
      gCombatP->current_Ent->EndTurn();
      bVar2 = true;
    }
  }
  return bVar2;
}

void FUN_8008d530(){
  if (!gCombatP->current_Ent->aiP) {
    gCombatP->current_Ent->EndTurn();
    CombatPlayerTurnFlag = 0;
  }
}

void FUN_8008d56c(void){
  SpellInstance *pSVar2;
  CombatEntity *pCVar1 = gCombatP->current_Ent;
  if (((!pCVar1->aiP) && (pCVar1->charSheetP)) &&
     (pSVar2 = Entity::GetSpell(pCVar1->charSheetP), pSVar2 != NULL)) {
    if ((pSVar2->aspect_flag & 0x10) == 0) {
      gGlobals.combatBytes[0] = 10;
      FUN_80072764(gCombatP->substruct2 + 1,pCVar1);
    }
    else gGlobals.combatBytes[0] = 0xb;
  }
}

void FUN_8008d5f8(void){
  clear_ArrayA(gCombatP->substruct2 + 1);
  clear_combat_substruc2(gCombatP->substruct2);
  bool bVar3 = false;
  for(u16 i=0;i<gCombatP->EntCount;i++){
    if (gCombatP->substruct2[1].arrayB[i]){
        gCombatP->some_index=i;
        bVar3=true;
    }
  }
  if (bVar3) {
    CombatEntity *pCVar1 = gCombatP->current_Ent;
    if (gGlobals.playerDataArray[pCVar1->index]){
      GiveCameraToPlayer(gGlobals.playerDataArray[pCVar1->index]);
    }
    pCVar1->charSheetP->spellVal = 0;
    if (gCombatP->some_index == pCVar1->index) gGlobals.combatBytes[0] = 6;
    else {
      pCVar1->FaceTarget((&gCombatP->combatEnts)[gCombatP->some_index]);
    }
  }
  else cancel_combat_action();
}

void FUN_8008d718(void){
  bool bVar2 = false;
  for(u16 i=0;i<gCombatP->EntCount;i++){
    if (gCombatP->substruct2[0].arrayB[i]){
        gCombatP->some_index=i;
        bVar2=true;
    }
  }
  if (bVar2) {
    clear_combat_substruc2(gCombatP->substruct2 + 1);
    clear_ArrayA(gCombatP->substruct2);
    CombatEntity *pCVar1 = gCombatP->current_Ent;
    if (gGlobals.playerDataArray[pCVar1->index] != NULL) {
      GiveCameraToPlayer(gGlobals.playerDataArray[pCVar1->index]);
    }
    if (gCombatP->some_index == pCVar1->index) gGlobals.combatBytes[0] = 6;
    else pCVar1->FaceTarget((&gCombatP->combatEnts)[gCombatP->some_index]);
  }
}

void FUN_8008d824(){
  CombatEntity *pCVar1 = gCombatP->current_Ent;
  clear_combat_substruc2(gCombatP->substruct2);
  clear_ArrayA(gCombatP->substruct2 + 1);
  bool bVar2 = false;
  for(u8 i=0;i<gCombatP->EntCount;i++){
    if (gCombatP->substruct2[1].arrayB[i]){
        gCombatP->some_index=i;
        bVar2=true;
    }
  }
  SpellInstance *pSVar3 = Entity::GetSpell(pCVar1->charSheetP);
  if (((pSVar3 == NULL) || ((pSVar3->base).id != IDSpell(SpellList[SPELLIND_teleportation]))) ||
     (some_combat_proximity_check(gCombatP,pCVar1->charSheetP->ID,(gCombatP->SpellMarkerPos).x,
                         (gCombatP->SpellMarkerPos).y))) {
    if (bVar2) {
      pCVar1->charSheetP->spellVal = 0;
      if (gCombatP->some_index == pCVar1->index) gGlobals.combatBytes[0] = 6;
      else pCVar1->FaceTarget((&gCombatP->combatEnts)[gCombatP->some_index]);
    }
    else cancel_combat_action();
  }
}

void combat_control_case_9(controller_aidyn *cont){
  if (LZBStart_to_cancel_Turn(cont)) gCombatP->current_Ent->ShowWeaponFlask();
  else if ((cont->input & A_BUTTON) == 0) {
    FUN_8008dac0(cont->input,gCombatP->substruct2,gCombatP->current_Ent);
  }
  else FUN_8008d718();
}

void FUN_8008d9d4(CombatSubstructB *param_1,CombatEntity *param_2){
  CombatEntity *pCVar1;
  vec2f fStack88;
  if ((param_1->spellTargetCount < 2) &&
     (pCVar1 = (&gCombatP->combatEnts)[param_1->entindex], pCVar1 != param_2)) {
    fStack88.x = param_2->GetCoordX() - pCVar1->GetCoordX();
    fStack88.y = param_2->GetCoordY() - pCVar1->GetCoordY();
    Vec2Normalize(&fStack88);
    Actor::SetFacing(gGlobals.playerDataArray[param_2->index],fStack88.x,fStack88.y);
    if (gGlobals.playerDataArray[pCVar1->index])
      GiveCameraToPlayer(gGlobals.playerDataArray[pCVar1->index]);
  }
}

void FUN_8008dac0(u32 button,CombatSubstructB *cont,CombatEntity* param_3){
  bool left = (button & (ANA_LEFT|D_LEFT)) != 0;
  if (left) FUN_80072810(gCombatP->substruct2,1);
  bool right = (button & (ANA_RIGHT|D_RIGHT)) != 0;
  if (right) FUN_80072810(gCombatP->substruct2,-1);
  if (right || left) FUN_8008d9d4(cont,param_3);
  return;
}

void combat_control_case_0xa(controller_aidyn *cont){
  if (!LZBStart_to_cancel_Turn(cont)) {
    if ((cont->input & A_BUTTON)) FUN_8008d5f8();
    else {
      bool left = (cont->input & (ANA_LEFT|D_LEFT)) != 0;
      if (left) FUN_800728c4(gCombatP->substruct2 + 1,1);
      bool right = (cont->input & (ANA_RIGHT|D_RIGHT)) != 0;
      if (right) FUN_800728c4(gCombatP->substruct2 + 1,-1);
      if (right || left) FUN_8008d9d4(gCombatP->substruct2 + 1,gCombatP->current_Ent);
    }
  }
}

bool adjust_camera_joystick(controller_aidyn *cont,vec2f *param_2){
  vec2f fStack160;
  vec2f fStack_60;
  
  float x = -cont->joy_x;
  float y = cont->joy_y;
  bool ret = false;
  if ((x != 0.0) || (y != 0.0)) {
    CLEAR(&fStack160);
    CLEAR(&fStack_60);
    fStack160.x = ((PHANDLE.camera)->rotationXZ).x;
    fStack160.y = ((PHANDLE.camera)->rotationXZ).y;
    Vec2Normalize(&fStack160);
    fStack_60.y = -fStack160.x;
    fStack_60.x = fStack160.y;
    param_2->x = x * fStack160.y + y * fStack160.x;
    param_2->y = x * fStack_60.y + y * fStack160.y;
    Vec2Normalize(param_2);
    ret = true;
  }
  return ret;
}

bool FUN_8008dcfc(controller_aidyn *cont,u16 param_2){
  CombatEntity *pCVar1;
  playerData *ppVar2;
  CombatStruct *pCVar3;
  bool bVar5;
  int iVar4;
  float x;
  float fVar7;
  float y;
  vec2f fStack280;
  vec2f fStack152;
  vec2f fStack88;
  
  pCVar1 = gCombatP->current_Ent;
  memset(&fStack280,0,8);
  if (adjust_camera_joystick(cont,&fStack280)) {
    Vec2Scale(&fStack280,0.8);
    x = (gCombatP->SpellMarkerPos).x + fStack280.x;
    y = (gCombatP->SpellMarkerPos).y + fStack280.y;
    fVar7 = x;
    if ((float)get_byte_A_min1(&gCombatP->substruct) <= x) {
      fVar7 = (float)get_byte_A_min1(&gCombatP->substruct);
    }
    if (0.0 <= fVar7) {
      if ((float)get_byte_A_min1(&gCombatP->substruct) <= x) {
        x = (float)get_byte_A_min1(&gCombatP->substruct);
      }
    }
    else {
      x = 0.0;
    }
    fVar7 = y;
    if (get_combatSubstruct_byte_B_min1(&gCombatP->substruct) <= y) {
      fVar7 = get_combatSubstruct_byte_B_min1(&gCombatP->substruct);
    }
    if (0.0 <= fVar7) {
      if (get_combatSubstruct_byte_B_min1(&gCombatP->substruct) <= y) {
        y = get_combatSubstruct_byte_B_min1(&gCombatP->substruct);
      }
    }
    else y = 0.0;
    if ((x == (gCombatP->SpellMarkerPos).x) && (y == (gCombatP->SpellMarkerPos).y)) {
      return false;
    }
    ppVar2 = gGlobals.playerDataArray[pCVar1->index];
    if (ppVar2 != NULL) {
      Vec2Set(&fStack88,(ppVar2->collision).pos.x,(ppVar2->collision).pos.z);
      Vec2Set(&fStack152,x - fStack88.x,y - fStack88.y);
      fVar7 = Vec2Normalize(&fStack152);
      if (fVar7 < 0.0) bVar5 = fVar7 < (float)param_2;
      else bVar5 = (float)param_2 < fVar7;
      if (bVar5) fVar7 = (float)param_2;
      Vec2Scale(&fStack152,fVar7);
      pCVar3 = gCombatP;
      (gCombatP->SpellMarkerPos).x = fStack152.x + fStack88.x;
      (pCVar3->SpellMarkerPos).y = fStack152.y + fStack88.y;
      return true;
    }
  }
  return false;
}

void combat_control_case_0xb(controller_aidyn *cont,s8 param_2){
  if (!LZBStart_to_cancel_Turn(cont)) {
    if ((cont->input & A_BUTTON))FUN_8008d824();
    else {
      if (param_2 == 1) {
        CombatEntity *Ent = gCombatP->current_Ent;
        SpellInstance *pSVar1 = Entity::GetSpell(Ent->charSheetP);
        if (FUN_8008dcfc(cont,(u16)(u8)(pSVar1->range * Entity::CheckSpellWizard(Ent->charSheetP,pSVar1)))) {
          FUN_80072454(gCombatP->substruct2 + 1,Ent);
        }
      }
    }
  }
}

void FUN_8008e0c4(CombatSubstructB *param_1){
  vec2f markerPos,playerPos;
  
  //why copy? 
  Vec2Set(&markerPos,(gCombatP->SpellMarkerPos).x,(gCombatP->SpellMarkerPos).y);
  clear_substruct2_arrayB(param_1);
  param_1->arrayBCount = 0;
  float proxMin=2.0f;
  for(u16 i=0;i<gCombatP->EntCount;i++){
    if(param_1->arrayA[i]){
      CombatEntity* cEnt=&gCombatP->combatEnts[i];
      if((cEnt)&&(gGlobals.playerDataArray[cEnt->index])){
        Vec2Set(&playerPos,
          (gGlobals.playerDataArray[cEnt->index]->collision).pos.x,
          (gGlobals.playerDataArray[cEnt->index]->collision).pos.z);
          float fVar6=Vec2Dist(&playerPos,&markerPos);
          if ((fVar6 <= 1.0f) && (fVar6 <= proxMin)) {
          clear_substruct2_arrayB(param_1);
          param_1->arrayB[i] = true;
          param_1->arrayBCount = 1;
          proxMin = fVar6;
        }
      }
    }
  }
}

void combat_control_case_0x12(controller_aidyn *cont,u8 param_2){
  bool bVar1;
  CombatEntity *pCVar3;
  playerData *ppVar4;
  
  if (!LZBStart_to_cancel_Turn(cont)) {
    u32 button = cont->input;
    if ((button & A_BUTTON) == 0) {
      bool notCLeft = (button & C_LEFT) == 0;
      pCVar3 = gCombatP->current_Ent;
      if (!notCLeft) FUN_80072864(gCombatP->substruct2,1);
      bool notCRight = (button & C_RIGHT) == 0;
      if (!notCRight) FUN_80072864(gCombatP->substruct2,-1);
      if (notCRight && notCLeft) {
        if (param_2 == 1) {
          if (FUN_8008dcfc(cont,(u16)pCVar3->m80069114())) {
            FUN_8008e0c4(gCombatP->substruct2);
          }
        }
      }
      else {
        FUN_8008d9d4(gCombatP->substruct2,pCVar3);
        ppVar4 = gGlobals.playerDataArray
                 [(&gCombatP->combatEnts)[gCombatP->substruct2[0].entindex]->index];
        if (ppVar4) {
          (gCombatP->SpellMarkerPos).x = (ppVar4->collision).pos.x;
          (gCombatP->SpellMarkerPos).y = (ppVar4->collision).pos.z;
        }
      }
    }
    else FUN_8008d718();
  }
}

void movement_checking_shadow(CombatEntity *param_1,playerData *param_2){
  bool bVar1;
  float fVar2;
  float fVar3;
  
  if (((param_1->moveRange != 1) && (gGlobals.ShadowIndex != -1)) &&
     (IsNearShadow(param_1))) {
    param_1->SetMovementRange();
    Actor::SetCombatMove(param_2,&(param_2->collision).pos,(float)param_1->moveRange);
    fVar2 = param_1->GetCoord2X();
    fVar3 = param_1->GetCoord2Y();
    param_1->SetCoords2((param_2->collision).pos.x,(param_2->collision).pos.z);
    CombatMarkers::Create(param_1);
    param_1->SetCoords2(fVar2,fVar3);
  }
}

bool combat_control_case_1(controller_aidyn *cont){
  CombatEntity *Ent;
  playerData *p;
  
  if (((cont->input & START_BUTTON)) && (renderTicker_GreaterThan3(gCombatP))) {
    gCombatP->renderTicker = 0;
    setCombatCameraMode(0);
    gGlobals.combatBytes[0] = 0xe;
    return true;
  }
  Ent = gCombatP->current_Ent;
  if (Ent->aiP == NULL) {
    p = gGlobals.playerDataArray[Ent->index];
    if (((cont->input & C_UP) == 0) && (p != NULL)) Actor::Move(p,cont);
    Ent->m80068924();
    if ((cont->input_2 & R_BUTTON)) return false;
    if ((cont->joy_x != 0.0) || (cont->joy_y != 0.0)) {
      movement_checking_shadow(Ent,p);
      return false;
    }
    if (((cont->input & A_BUTTON) != 0) &&
       (FUN_80072454(gCombatP->substruct2,Ent), gCombatP->substruct2[0].spellTargetMax != 0)) {
      gGlobals.combatBytes[0] = 9;
      if ((Ent->throwingFlag != 0) && (!Ent->Flag89())) {
        gGlobals.combatBytes[0] = 0x12;
        FUN_8007272c(gCombatP->substruct2,Ent);
        return false;
      }
      FUN_80072698(gCombatP->substruct2,Ent);
      if (gGlobals.playerDataArray[(u8)gCombatP->substruct2[0].entindex] == NULL) {
        return false;
      }
      GiveCameraToPlayer(gGlobals.playerDataArray[(u8)gCombatP->substruct2[0].entindex]);
      return false;
    }
    if ((cont->input & (Z_BUTTON|L_BUTTON)) == 0) {
      return false;
    }
    FUN_8008d530();
  }
  else gGlobals.combatBytes[0] = 8;
  return false;
}

void combat_control_case_5(controller_aidyn *cont){
  playerData *ppVar1;
  if ((((!combat_control_press_start(cont)) && ((cont->input & A_BUTTON))) && (gCombatP->current_Ent)) &&
     ((ppVar1 = gGlobals.playerDataArray[gCombatP->current_Ent->index], ppVar1 != NULL &&
      ((ppVar1->flags & ACTOR_CANMOVE) != 0)))) {
    FUN_80019b08(ppVar1);
  }
}

void combat_control_case_6(controller_aidyn *cont,u8 x){
  if (!combat_control_press_start(cont)){
    CombatEntity *pCVar1=gCombatP->current_Ent;
    if((pCVar1)&&(gGlobals.playerDataArray[pCVar1->index])&&(gGlobals.playerDataArray[pCVar1->index]->flags & ACTOR_CANROTATE))
    pCVar1->SetPlayerRotate();
  }
}

bool RZBA_end_combat(controller_aidyn *cont){
  u32 BVar1 = cont->input_2;
  if (((BVar1 & R_BUTTON) != 0) && (BVar1 != 0)) {
    if ((BVar1 & (A_BUTTON|Z_BUTTON)) != (A_BUTTON|Z_BUTTON)) {
      return false;
    }
    if (((cont->input & B_BUTTON) != 0) && (true)) {
      switch(gGlobals.combatBytes[0]) {
      case 0:
      case 9:
      case 10:
      case 0xb:
      case 0xc:
      case 0xd:
      case 0xe:
      case 0xf:
      case 0x10:
      case 0x11:
      case 0x12:
      case 0x14:
      case 0x15:
      case 0x16:
      case 0x17:
      case 0x1f:
        return true;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 0x13:
      case 0x18:
        CombatTurn::EnemiesDead(&gCombatP->turn);
        return true;
      }
    }
  }
  return false;
}

void combat_control_case_0x19(controller_aidyn *cont){
  if ((!LZBStart_to_cancel_Turn(cont)) && ((cont->input & A_BUTTON))) {
    gCombatP->current_Ent->Troubadour();
  }
}

bool combat_controls_caseSwitch(controller_aidyn *cont,u8 param_2){
  CombatEntity *pCVar1;
  
  CombatPlayerTurnFlag = 1;
  if (RZBA_end_combat(cont)) return false;
  if ((cont->input & C_LEFT) != 0) gCombatGuiUnusedToggle ^= 1;
  if (gCombatP->reinforcmentsWillFlee != 0) goto switchD_8008e894_caseD_0;
  if (FUN_8008d4d0(cont)) return false;
  if (false) goto switchD_8008e894_caseD_0;
  switch(gGlobals.combatBytes[0]) {
  case 1:
    return combat_control_case_1(cont);
  case 2:
  case 3:
  case 4:
  case 7:
  case 8:
  case 0x18:
  case 0x1a:
    if ((((!combat_control_press_start(cont)) && (pCVar1 = gCombatP->current_Ent, pCVar1 != NULL)) && (pCVar1->aiP != NULL)) &&
       (((cont->input_2 & R_BUTTON) != 0 && ((cont->input & A_BUTTON) != 0)))) {
      pCVar1->EndTurn();
    }
    break;
  case 5:
    combat_control_case_5(cont);
    break;
  case 6:
    combat_control_case_6(cont,param_2);
    break;
  case 9:
    combat_control_case_9(cont);
    break;
  case 10:
    combat_control_case_0xa(cont);
    break;
  case 0xb:
    combat_control_case_0xb(cont,param_2);
    break;
  case 0x12:
    combat_control_case_0x12(cont,param_2);
    break;
  case 0x16:
    combat_control_case_0x16(cont);
    break;
  case 0x17:
    combat_control_case_0x17(cont);
    break;
  case 0x19:
    combat_control_case_0x19(cont);
  default:
switchD_8008e894_caseD_0:
  }
  return false;
}