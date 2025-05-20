#include "combat/CombatStruct.h"
#include "globals.h"

void init_combat_substruct(CombatSubstructA *param_1,u8 param_2){

  param_1->byteA = get_borg9_floatB_X_ShortA(param_2);
  u8 uVar1 = get_borg9_floatB_Y_ShortB(param_2);
  param_1->byteB = uVar1;
  param_1->byteD = uVar1 >> 1;
  param_1->byteC = param_1->byteA >> 1;
  param_1->short1 = (ushort)param_1->byteA * (ushort)uVar1;
  param_1->byteE = _sqrtf(SQ(param_1->byteA) +SQ(param_1->byteB));
  for(u32 i=0;i<100;i++) {
    CLEAR(param_1->array1[i]);
    CLEAR(param_1->array2[i]);
  }
  FUN_80067aa0(param_2,param_1,param_1->byteA,param_1->byteB);
}

void NOOP_80070c94(CombatSubstructA* x){}

char get_byte_A_min1(CombatSubstructA *param_1){return param_1->byteA - 1;}

char get_combatSubstruct_byte_B_min1(CombatSubstructA *param_1){return param_1->byteB - 1;}

char get_byte_E(CombatSubstructA *param_1){return param_1->byteE;}


int FUN_80070cc4(CombatSubstructA *param_1,u8 TargX,u8 TargY,u8 AtkX,byte AtkY){
  int iVar1 = 0x7f;
  if (!FUN_80070ee4(param_1,TargX,TargY,1)) {
    iVar1 = 0x7f;
    if (!FUN_80070ee4(param_1,AtkX,AtkY,1)) {
                  //??
      iVar1 = (int)(((param_1->array1[0][(uint)AtkY + (((uint)AtkX * 2 + (uint)AtkX) * 8 + (uint)AtkX) * 4] & 0x7f) -
                    (param_1->array1[0][(uint)TargY + (((uint)TargX * 2 + (uint)TargX) * 8 + (uint)TargX) * 4] & 0x7f)
                    ) * 0x1000000) >> 0x18;
    }
  }
  return iVar1;
}

bool FUN_80070dac(CombatSubstructA *param_1,u8 targX,u8 targY,u8 AtkX,u8 AtkY){
  return  FUN_80070cc4(param_1,targX,targY,AtkX,AtkY) < 2;
}

bool combat_substruct_lookup(CombatSubstructA *param_1,byte x,byte y,byte index){
  for(u8 i=i<y+index;i++) {
    for (u8 j = x; j < x + index; j++) {
      if ((!FUN_80070ee4(param_1,j,i,1)) && ((param_1->array1[j][i] & 0x80))) {
        return true;
      }
    }
  }
}


bool FUN_80070ee4(CombatSubstructA *param_1,char X,char Y,u8 param_4){
  for(s32 i=Y;i<Y+param_4;i++){
    for(s32 j=X;j<X+param_4;j++){
        if((j<0)||(i<0)||(param_1->byteA<=j)||(param_1->byteB<=i))
        return true;
    }
  }
  return false;
}


bool FUN_80070fa0(CombatSubstructA *param_1,u8 param_2,u8 param_3,u8 param_4){
  if (!FUN_80070ee4(param_1,param_2,param_3,param_4)) {
    return !combat_substruct_lookup(param_1,param_2,param_3,param_4);
  }
  return false;
}


bool FUN_8007102c(CombatSubstructA *param_1,u8 param_2,u8 param_3,u8 param_4,u8 param_5){
  return FUN_80070cc4(param_1,param_2,param_3,param_4,param_5) < 3;
}


bool FUN_8007105c(CombatSubstructA *param_1,byte X,byte Y,u8 param_4,u8 param_5)

{
  int iVar1;
  byte bVar2;
  bool bVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  byte y;
  int iVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  uint uVar13;
  uint uVar14;
  float fVar15;
  float fVar16;
  
  uVar6 = (uint)X;
  uVar7 = (uint)Y;
  uVar14 = (uint)param_4;
  iVar8 = (int)(((uint)X - (uint)param_4) * 0x1000000) >> 0x18;
  iVar5 = (int)(((uint)Y - (uint)param_5) * 0x1000000) >> 0x18;
  if ((iVar8 != 0) || (iVar5 != 0)) {
    iVar4 = iVar8;
    if (iVar8 < 0) {
      iVar4 = -iVar8;
    }
    iVar1 = iVar5;
    if (iVar5 < 0) {
      iVar1 = -iVar5;
    }
    if (iVar1 < iVar4) {
      iVar4 = -1;
      if (iVar8 < 0) {
        iVar4 = 1;
      }
      uVar10 = (int)((uVar6 + iVar4) * 0x1000000) >> 0x18;
      if ((int)uVar10 < (int)uVar14) {
        uVar13 = uVar6;
        iVar1 = (uVar10 + iVar4) * 0x1000000;
        while( true ) {
          bVar2 = (byte)(int)((float)iVar5 / (float)iVar8) * (float)(int)uVar10 +
                   ((float)Y - ((float)iVar5 / (float)iVar8) * (float)uVar6);
          if (FUN_80070ee4(param_1,(byte)uVar10,bVar2,1)) return false;
          uVar11 = uVar10 & 0xff;
          uVar9 = (int)fVar15 & 0xff;
          if ((combat_substruct_lookup(param_1,(byte)uVar10,bVar2,1)) && (FUN_80070dac(param_1,uVar11,uVar9,uVar14,param_5))) {
            return false;
          }
          if ((!FUN_80070dac(param_1,uVar13,uVar7,uVar11,bVar2)) && (FUN_80070dac(param_1,uVar13,uVar7,uVar14,param_5))) break;
          uVar10 = iVar1 >> 0x18;
          uVar13 = uVar11;
          iVar1 = iVar1 + iVar4 * 0x1000000;
          uVar7 = uVar9;
          if ((int)uVar14 <= (int)uVar10) {
            return true;
          }
        }
        return false;
      }
    }
    else {
      iVar4 = -1;
      if (iVar5 < 0) iVar4 = 1;
      uVar10 = (int)((uVar7 + iVar4) * 0x1000000) >> 0x18;
      if ((int)uVar10 < (int)(uint)param_5) {
        uVar13 = uVar6;
        uVar9 = uVar7;
        iVar1 = (uVar10 + iVar4) * 0x1000000;
        do {
          bVar2 = (byte)(int)((float)iVar8 / (float)iVar5) * (float)(int)uVar10 +
                   ((float)uVar6 - ((float)iVar8 / (float)iVar5) * (float)uVar7);
          y = (byte)uVar10;
          bVar3 = FUN_80070ee4(param_1,bVar2,y,1);
          if (FUN_80070ee4(param_1,bVar2,y,1)) return false;
          uVar12 = (int)fVar16 & 0xff;
          uVar11 = uVar10 & 0xff;
          bVar3 = combat_substruct_lookup(param_1,bVar2,y,1);
          if ((combat_substruct_lookup(param_1,bVar2,y,1)) && (FUN_80070dac(param_1,uVar12,uVar11,uVar14,param_5))) {
            return false;
          }
          if ((!FUN_80070dac(param_1,uVar13,uVar9,uVar12,y)) && (FUN_80070dac(param_1,uVar13,uVar9,uVar14,param_5))) {
            return false;
          }
          uVar10 = iVar1 >> 0x18;
          uVar13 = uVar12;
          uVar9 = uVar11;
          iVar1 = iVar1 + iVar4 * 0x1000000;
        } while ((int)uVar10 < (int)(uint)param_5);
      }
    }
  }
  return true;
}


void FUN_800713fc(CombatSubstructA *param_1,u8 X,u8 Y,u8 param_4){
  if (!FUN_80070ee4(param_1,X,Y,param_4)) {
    for(u8 i=Y;i<Y+param_4;i++){
        for (u8 j = X; j < X + param_4; j++){
            param_1->array1[j][i]|=0x80;
        }
    }
  }
}

void FUN_800714d0(CombatSubstructA *param_1,u8 X,u8 Y,u8 param_4){
  if (!FUN_80070ee4(param_1,X,Y,param_4)) {
    for(u8 i=Y;i<Y+param_4;i++){
        for (u8 j = X; j < X + param_4; j++){
            param_1->array1[j][i]&=~0x80;
        }
    }
  }
}

void FUN_800715a4(CombatSubstructA *param_1){
  FUN_80067aa0(gCombatP->encounter_dat->battlefield,param_1,param_1->byteA,param_1->byteB);
}


void FUN_800715d8(CombatSubstructA *param_1){
  FUN_800715a4(param_1);
  if (gCombatP->EntCount) {
    for(u8 i = 0;i < gCombatP->EntCount;i++) {
      CombatEntity *pCVar1 = &gCombatP->combatEnts[i];
      //if an entity is alive and in play
      if ((!Entity::isDead(pCVar1->charSheetP)) && (!pCVar1->Flag6())) {
        FUN_800713fc(param_1,pCVar1->GetCoordXU8(),pCVar1->GetCoordYU8(),pCVar1->unk23);
      }
    }
  }
}


bool FUN_800716b4(CombatSubstructA *param_1,vec3f *param_2,vec3f *param_3,u8 param_4,u8 param_5)

{
  CombatEntity *pCVar1;
  playerData *ppVar2;
  uint i;
  float fVar5;
  float fVar6;
  vec3f afStack320;
  vec3f afStack256;
  vec3f fStack192;
  vec3f afStack128;
  
  Vec3_sub(&afStack320,param_3,param_2);
  copyVec3(&afStack320,&afStack256);
  float fVar5=vec3_normalize(&afStack256);
  if (1.0E-6f < fVar5) {
    if (CheckCollision(&gGlobals.Sub.ZoneDatMtx[1][1].mapPointer->dat,param_2,param_3,0.1,&afStack128,NULL,0)) {
      return false;
    }
    if (gCombatP->EntCount != 0) {
      for(u8 i = 0;i < gCombatP->EntCount;i++){
        if ((((i != param_4) && (i != param_5)) &&
            (pCVar1 = (&gCombatP->combatEnts)[i], pCVar1 != NULL)) &&
           ((!Entity::isDead(pCVar1->charSheetP) &&(!pCVar1->Flag6())))) {
          playerData *ppVar2 = gGlobals.playerDataArray[i];
          copyVec3(&(ppVar2->collision).pos,&afStack128);
          Vec3_sub(&fStack192,&afStack128,param_2);
          fVar6 = vec3_dot(&afStack320,&fStack192);
          if (fVar6 != 0.0) {
            multiVec3(&afStack256,fVar6 / fVar5);
            vec3_sum(&fStack192,&afStack256,param_2);
            if (vec3_proximity(&fStack192,&afStack128) <= (ppVar2->collision).radius)
              return false;
            multiVec3(&afStack256,1.0f / (fVar6 / fVar5));
          }
        }

      }
    }
  }
  return true;
}

