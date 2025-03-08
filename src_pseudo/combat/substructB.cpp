#include "combat/combatStruct.h"
#include "globals.h"

void giveCameratoThisPlayer(u8 X){
  if (gGlobals.playerDataArray[X]) 
    GiveCameraToPlayer(gGlobals.playerDataArray[X]);
}

void clear_ArrayA(CombatSubstructB *param_1){
  memset(param_1->arrayA,0,gCombatP->EntCount*sizeof(u32));
}

void clear_combat_substruc2(CombatSubstructB *param_1){
  param_1->entindex = 0;
  param_1->field4_0xa3 = 0;
  param_1->arrayBCount = 0;
  param_1->field6_0xa5 = 0;
  param_1->field8_0xa7 = 0;
  memset(param_1->arrayA,0,(uint)gCombatP->EntCount*sizeof(u32));
  memset(param_1->arrayB,0,(uint)gCombatP->EntCount*sizeof(u32));
  memset(param_1->arrayC,0,(uint)gCombatP->EntCount);
}



bool FUN_8007231c(CombatSubstructB *arg0,u8 param_2){
  if (arg0->arrayBCount < arg0->field6_0xa5) {
    if ((arg0->arrayA[param_2] != 0) && (arg0->arrayB[param_2] == 0)) {
      if (arg0->arrayBCount == 0) arg0->entindex = param_2;
      arg0->arrayB[param_2] = 1;
      arg0->arrayBCount = arg0->arrayBCount + 1;
      return true;
    }
  }
  return false;
}


bool clear_arrayB_entry(CombatSubstructB *param_1,u8 param_2){
  if (param_1->arrayB[param_2]) {
    param_1->arrayB[param_2] = 0;
    param_1->arrayBCount--;
    return true;
  }
  return false;
}


void FUN_800723b8(CombatSubstructB *param_1){
  if ((param_1->field4_0xa3 != 0)&&(gCombatP->EntCount)){
  for(u8 i=0;((i < gCombatP->EntCount) &&(param_1->arrayBCount < param_1->field6_0xa5));i++){
      if (param_1->arrayA[i]) {
        param_1->arrayB[i] = 1;
        param_1->entindex = i;
        param_1->arrayBCount++;
      }
  }
}
}

void FUN_80072454(CombatSubstructB *X,CombatEntity *Ent){
  clear_combat_substruc2(X);
  if (X->field3_0xa2 == 0) {
    if ((Ent->AtkType == 0) && (!Ent->Flag89())) return;
    FUN_800724f4(X,Ent);
  }
  else {
    if (Ent->charSheetP->spellSwitch == 0) return;
    FUN_800725b4(X,Ent);
  }
  FUN_800723b8(X);
  FUN_8007324c(X,Ent,(uint)X->entindex);
}

void FUN_800724f4(CombatSubstructB *param_1,CombatEntity *param_2){
  if (gCombatP->EntCount) {
    for(u8 i=0;i<gCombatP->EntCount;i++) {
      if (param_2->CanBeTargeted(&gCombatP->combatEnts[i],0)) {
        param_1->arrayA[i] = 1;
        param_1->field4_0xa3++;
      }
    }
  }
  param_1->field6_0xa5 = 1;
}

void FUN_800725b4(CombatSubstructB *param_1,CombatEntity *param_2){
  if (gCombatP->EntCount) {
    for(u8 i=0;i<gCombatP->EntCount;i++) {
      if (param_2->AIShouldCastMagic(&gCombatP->combatEnts[i])) {
        param_1->arrayA[i] = 1;
        param_1->field4_0xa3++;
      }
    }
  }
  u8 bVar2 = param_2->GetSpellTargetCount();
  param_1->field6_0xa5 = bVar2;
  if (bVar2 == gCombatP->EntCount)
    param_1->field6_0xa5 = param_1->field4_0xa3;
}


void FUN_80072698(CombatSubstructB *param_1,CombatEntity *param_2){
  
  u8 bVar1 = param_1->entindex;
  clear_combat_substruc2(param_1);
  FUN_800724f4(param_1,param_2);
  if (param_1->field4_0xa3) {
    FUN_8007294c(param_1,param_2);
    if (FUN_8007319c(param_1,param_2->TargetIndex)) {
      giveCameratoThisPlayer(param_1->entindex);
    }
    else {
      FUN_8007319c(param_1,(uint)bVar1);
      giveCameratoThisPlayer(param_1->entindex);
    }
  }
  return;
}


void FUN_8007272c(CombatSubstructB *param_1,CombatEntity *param_2){
  FUN_80072698(param_1,param_2);
  if (param_1->field4_0xa3 != 0) {
    FUN_80072eb4(param_1,param_1->entindex);
  }
}

void FUN_80072764(CombatSubstructB *param_1,CombatEntity *param_2){
  
  clear_combat_substruc2(param_1);
  FUN_800725b4(param_1,param_2);
  if (param_1->field4_0xa3 != 0) {
    if (param_2->GetSpellTargetCount() < 2) {
      FUN_8007294c(param_1,param_2);
      FUN_8007319c(param_1,param_2->TargetIndex);
    }
    else if (param_1->field4_0xa3 < param_1->field6_0xa5)
      FUN_800723b8(param_1);
    else FUN_80072f80(param_1,param_2);
  }
}

void ofunc_NOOP(){}

void FUN_80072810(CombatSubstructB *param_1,s8 param_2){
  if ((param_1->field4_0xa3) && (gCombatP->current_Ent)) {
    FUN_80072ef0(param_1,param_2);
    giveCameratoThisPlayer(param_1->entindex);
  }
}

void FUN_80072864(CombatSubstructB *param_1,s8 param_2){
  if (param_1->field4_0xa3) {
    if (param_1->field4_0xa3 < 2) FUN_800723b8(param_1);
    else FUN_80072ef0(param_1,param_2);
    FUN_80072eb4(param_1,param_1->entindex);
  }
}

void FUN_800728c4(CombatSubstructB *param_1,s8 param_2){
  if ((((param_1->field4_0xa3) && (gCombatP->current_Ent)) &&
      (gCombatP->current_Ent->GetSpellTargetCount()<2)) &&
     (param_1->field4_0xa3 != 1)) {
    FUN_80072ef0(param_1,param_2);
    giveCameratoThisPlayer(param_1->entindex);
  }
}

void Ofunc_80072944(){}

void FUN_8007294c(CombatSubstructB *param_1,CombatEntity *param_2){
  byte bVar1;
  playerData *ppVar2;
  int iVar3;
  u8 uVar4;
  byte *pbVar5;
  float *pfVar6;
  u8 uVar7;
  u8 uVar8;
  float fVar9;
  float fVar10;
  vec2f avStack_270 [8];
  vec2f avStack_230 [8];
  vec2f afStack496;
  float afStack_1b0 [4] [14];
  byte abStack_b0 [64];
  byte abStack_70 [4] [14];
  
  if (param_1->field4_0xa3 == 1) {
    FUN_800723b8(param_1);
    giveCameratoThisPlayer(param_1->entindex);
  }
  else {
    ppVar2 = gGlobals.playerDataArray[param_2->index];
    setVec2(avStack_270,(ppVar2->collision).pos.x,(ppVar2->collision).pos.z);
    setVec2(avStack_230,avStack_270[0].x + (ppVar2->facing).x,avStack_270[0].y + (ppVar2->facing).y)
    ;
    memset(abStack_b0,0,4);
    if (param_1->arrayA[param_2->index] != 0) {
      afStack_1b0[0][0] = 0.0;
      abStack_70[0][0] = param_2->index;
      abStack_b0[0] = abStack_b0[0] + 1;
    }
    
    if (gCombatP->EntCount != 0) {
      for(uVar8 = 0;uVar8 < gCombatP->EntCount;uVar8++) {
        if ((param_1->arrayA[uVar8]) && (uVar8 != param_2->index)) {
          ppVar2 = gGlobals.playerDataArray[uVar8];
          setVec2(&afStack496,ppVar2->collision.pos.x,ppVar2->collision.pos.z);
          fVar9 = big_vec2_math_func(avStack_270,avStack_230,&afStack496);
          fVar10 = three_vec2_proximities(avStack_270,avStack_230,&afStack496);
          uVar4 = (uint)(fVar10 <= 0.0) | (uint)(fVar9 <= 0.0) << 1;
          pbVar5 = abStack_b0 + uVar4;
          bVar1 = *pbVar5;
          afStack_1b0[uVar4][bVar1] = fVar9;
          if (fVar9 <= 0.0) {
            afStack_1b0[uVar4][bVar1] = -fVar9;
          }
          abStack_70[uVar4][*pbVar5++] = (byte)uVar8;
        }
      }
    }
    uVar8 = 0;
    do {
      uVar4 = 0;
      if (abStack_b0[uVar8] != 0) {
        do {
          uVar7 = uVar4 + 1;
          if (uVar4 < abStack_b0[uVar8]) {
            pfVar6 = afStack_1b0[uVar8] + uVar4;
            pbVar5 = abStack_70[uVar8] + uVar4;
            do {
              fVar10 = afStack_1b0[uVar8][uVar4];
              fVar9 = *pfVar6;
              if (fVar9 <= fVar10) {
                bVar1 = abStack_70[uVar8][uVar4];
                afStack_1b0[uVar8][uVar4] = fVar9;
                abStack_70[uVar8][uVar4] = *pbVar5;
                *pfVar6 = fVar10;
                *pbVar5 = bVar1;
              }
              uVar4++;
            } while (uVar4 < abStack_b0[uVar8]);
          }
          uVar4 = uVar7 & 0xff;
        } while (uVar4 < abStack_b0[uVar8]);
      }
      uVar8++;
    } while (uVar8 < 2);
    for (; uVar8 < 4; uVar8++) {
      uVar4 = 0;
      if (abStack_b0[uVar8] != 0) {
        bVar1 = abStack_b0[uVar8];
        while( true ) {
          uVar7 = uVar4 + 1;
          if (uVar4 < bVar1) {
            pfVar6 = afStack_1b0[uVar8] + uVar4;
            pbVar5 = abStack_70[uVar8] + uVar4;
            do {
              fVar10 = afStack_1b0[uVar8][uVar4];
              fVar9 = *pfVar6;
              if (fVar10 <= fVar9) {
                bVar1 = abStack_70[uVar8][uVar4];
                afStack_1b0[uVar8][uVar4] = fVar9;
                abStack_70[uVar8][uVar4] = *pbVar5;
                *pfVar6 = fVar10;
                *pbVar5 = bVar1;
              }
              uVar4++;
            } while (uVar4 < abStack_b0[uVar8]);
          }
          pbVar5 = abStack_b0 + uVar8;
          uVar4 = uVar7 & 0xff;
          if (*pbVar5 <= uVar4) break;
          bVar1 = *pbVar5;
        }
      }
    }
    uVar4 = 0;
    uVar7 = 0;
    uVar8 = uVar4;
    if (abStack_b0[0] != 0) {
      do {
        uVar4 = uVar8 + 1 & 0xff;
        pbVar5 = abStack_70[0] + uVar7++;
        param_1->arrayC[uVar8] = *pbVar5;
        uVar8 = uVar4;
      } while (uVar7 < abStack_b0[0]);
    }
    uVar7 = 0;
    uVar8 = uVar4;
    if (abStack_b0[2] != 0) {
      do {
        uVar4 = uVar8 + 1 & 0xff;
        pbVar5 = abStack_70[2] + uVar7++;
        param_1->arrayC[uVar8] = *pbVar5;
        uVar8 = uVar4;
      } while (uVar7 < abStack_b0[2]);
    }
    uVar7 = 0;
    uVar8 = uVar4;
    if (abStack_b0[3] != 0) {
      do {
        uVar4 = uVar8 + 1 & 0xff;
        pbVar5 = abStack_70[3] + uVar7++;
        param_1->arrayC[uVar8] = *pbVar5;
        uVar8 = uVar4;
      } while (uVar7 < abStack_b0[3]);
    }
    uVar8 = 0;
    if (abStack_b0[1] != 0) {
      do {
        pbVar5 = abStack_70[1] + uVar8++;
        param_1->arrayC[uVar4++] = *pbVar5;
      } while (uVar8 < abStack_b0[1]);
    }
    param_1->field8_0xa7 = 0;
    param_1->entindex = param_1->arrayC[0];
    FUN_8007231c(param_1,param_1->arrayC[0]);
    giveCameratoThisPlayer(param_1->entindex);
  }
}


void FUN_80072eb4(CombatSubstructB *param_1,u8 param_2){
  playerData* p= gGlobals.playerDataArray[param_2];
  if (p) {
    (gCombatP->SpellMarkerPos).x = p->collision.pos.x;
    (gCombatP->SpellMarkerPos).y = p->collision.pos.z;
  }
}


bool FUN_80072ef0(CombatSubstructB *param_1,char param_2){
  u8 uVar1;
  bool bVar2;
  int iVar3;
  
  bVar2 = true;
  if (param_1->field4_0xa3 != 1) {
    clear_arrayB_entry(param_1,param_1->entindex);
    iVar3 = (uint)param_1->field8_0xa7 + (int)param_2;
    if (iVar3 < 0) {
      iVar3 = param_1->field4_0xa3 - 1;
    }
    else if ((int)(uint)param_1->field4_0xa3 <= iVar3) {
      iVar3 = 0;
    }
    uVar1 = param_1->arrayC[iVar3];
    param_1->entindex = uVar1;
    bVar2 = FUN_8007231c(param_1,uVar1);
    param_1->field8_0xa7 = (byte)iVar3;
  }
  return bVar2;
}


void FUN_80072f80(CombatSubstructB *param_1,CombatEntity *param_2)

{
  byte bVar1;
  playerData *ppVar2;
  uint uVar3;
  int iVar4;
  byte *pbVar5;
  u8 uVar6;
  u8 uVar7;
  u8 uVar8;
  float fVar9;
  float fVar10;
  vec2f avStack_128 [8];
  byte abStack_e8 [64];
  float afStack_a8 [16];
  vec2f avStack_68 [13];
  
  ppVar2 = gGlobals.playerDataArray[param_2->index];
  if (ppVar2) {
    setVec2(avStack_128,(ppVar2->collision).pos.x,(ppVar2->collision).pos.z);
    uVar8 = 0;
    uVar7 = 0;
    if (gCombatP->EntCount != 0) {
      iVar4 = 0;
      for(uVar7=0;uVar7 < gCombatP->EntCount;uVar7++) {
        if (param_1->arrayA[uVar7]){
          playerData* p= gGlobals.playerDataArray[uVar7];
          if(p){
          setVec2(avStack_68,p->collision.pos.x,p->collision.pos.z);
          afStack_a8[uVar8] = vec2_proximity(avStack_68,avStack_128);
          abStack_e8[uVar8++] = uVar7;
        }
        }
      }
    }
    uVar7 = 0;
    if (uVar8 != 0) {
      uVar3 = 1;
      do {
        uVar6 = uVar3 & 0xff;
         for(uVar6 = uVar3;uVar6 < uVar8;uVar6++) {
            fVar10 = afStack_a8[uVar6];
            fVar9 = afStack_a8[uVar7];
            if (fVar10 <= fVar9) {
              bVar1 = abStack_e8[uVar6];
              afStack_a8[uVar6] = fVar9;
              abStack_e8[uVar6] = abStack_e8[uVar7];
              afStack_a8[uVar7] = fVar10;
              abStack_e8[uVar7] = bVar1;
            }
        }
        uVar7 = uVar3 & 0xff;
        uVar3 = uVar7 + 1;
      } while (uVar7 < uVar8);
    }
    uVar7 = 0;
    if ((param_1->field6_0xa5 != 0) && (uVar8 != 0)) {
      pbVar5 = abStack_e8;
      do {
        bVar1 = *pbVar5;
        param_1->arrayBCount = param_1->arrayBCount + 1;
        param_1->arrayB[bVar1] = 1;
        uVar7++;
        if (param_1->field6_0xa5 <= uVar7) return;
        pbVar5 = abStack_e8 + uVar7;
      } while (uVar7 < uVar8);
    }
  }
}


bool FUN_8007319c(CombatSubstructB *param_1,s32 index){
  bool bVar1;
  uint i;
  
  if ((index < 0) || (param_1->arrayA[index] == 0)) bVar1 = false;
  else {
    bVar1 = true;
    if (param_1->arrayB[index] == 0) {
      clear_arrayB_entry(param_1,param_1->entindex);
      i = 0;
      if ((param_1->field4_0xa3 != 0) && ((uint)param_1->arrayC[0] != index)) {
        for (i = 1; (i < param_1->field4_0xa3 && ((uint)param_1->arrayC[i] != index)); i++) {
        }
      }
      param_1->field8_0xa7 = (byte)i;
      param_1->entindex = (char)index;
      FUN_8007231c(param_1,param_1->entindex);
      bVar1 = true;
    }
  }
  return bVar1;
}


bool FUN_8007324c(CombatSubstructB *param_1,CombatEntity *param_2,s32 param_3){
  bool bVar1 = param_1->field6_0xa5 < 2;
  if ((bVar1) && (bVar1 = FUN_800732a0(param_1,param_2->TargetIndex), !bVar1)) {
    bVar1 = FUN_800732a0(param_1,param_3);
  }
  return bVar1;
}



bool FUN_800732a0(CombatSubstructB *param_1,s32 param_2){
  bool bVar1 = false;
  if (-1 < param_2) {
    if (param_1->arrayA[param_2] == 0) bVar1 = false;
    else {
      bVar1 = true;
      if (param_2 != param_1->entindex) {
        clear_arrayB_entry(param_1,param_1->entindex);
        param_1->entindex = (char)param_2;
        FUN_8007231c(param_1,param_1->entindex);
        bVar1 = true;
      }
    }
  }
  return bVar1;
}


