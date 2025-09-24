#include "vobjects.h"
#include "globals.h"


u16 FUN_80005d60(wander_substruct **w) {
  wander_substruct *pwVar1;
  bool bVar2;
  u16 uVar2;
  voxelObject *pvVar3;
  playerData *ppVar4;
  playerData *player;
  
  player = gGlobals.playerCharStruct.playerDat;
  bVar2 = gGlobals.playerCharStruct.playerDat == NULL;
  *w = NULL;
  if ((bVar2) || (player->unk104 == -1)) {
    uVar2 = -1;
  }
  else {
    ppVar4 = gGlobals.Sub.PlayerHandler.playerDats + player->unk104;
    uVar2 = -1;
    if (ppVar4->removeFlag) {
      pwVar1 = findWandererFromPlayerName(ppVar4->ID);
      uVar2 = -1;
      if (pwVar1) {
        pvVar3 = &gGlobals.Sub.borg9DatPointer->voxelObjs[pwVar1->VoxelIndex];
        uVar2 = -1;
        if ((pvVar3) &&
           (player->unk108 <= ppVar4->scaleRad + player->scaleRad + 0.5f)) {
          uVar2 = -1;
          if (Voxel_CheckProc(pvVar3,gGlobals.playerCharStruct.playerDat)) {
            uVar2 = pwVar1->VoxelIndex;
            *w = pwVar1;
          }
        }
      }
    }
  }
  return uVar2;
}

float func_checking_monsterparty(voxelObject *v,vec3f *po) {
  if ((v->header).type == VOXEL_MonsterParty)
    return (gGlobals.playerCharStruct.playerDat)->unk108;
  return vec3_proximity(&v->header.pos,po);
}

void monsterparty_setvec2(voxelObject *v,vec2f *pos) {
  short sVar1;
  
  setVec2(pos,(v->header).pos.x,(v->header).pos.z);
  if ((((v->header).type == VOXEL_MonsterParty) && (gGlobals.playerCharStruct.playerDat != NULL)) &&
     (sVar1 = (gGlobals.playerCharStruct.playerDat)->unk104, sVar1 != -1)) {
    setVec2(pos,gGlobals.Sub.PlayerHandler.playerDats[sVar1].collision.pos.x,
            gGlobals.Sub.PlayerHandler.playerDats[sVar1].collision.pos.z);
  }
}

void obj_ref_func(void) {
  u16 VVar1;
  float fVar2;
  playerData *ppVar3;
  Borg9Data *pBVar4;
  bool bVar9;
  CollideSection *pbVar5;
  u16 uVar7;
  ushort uVar8;
  uint uVar6;
  short puVar7;
  Vobject VVar10;
  voxelObject *pvVar11;
  ushort *puVar12;
  voxelObject *v;
  uint uVar13;
  uint i;
  uint uVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  float fVar19;
  s16 sStack_168;
  s16 asStack_166 [3];
  u16 voxInds [32];
  vec2f afStack288;
  vec2f afStack224;
  vec2f auStack160;
  wander_substruct *pwStack_60;
  vec3f *pvStack_5c;
  uint uStack_58;
  
  if (gGlobals.screenFadeMode) return;
  pBVar4 = gGlobals.Sub.borg9DatPointer;
  ppVar3 = gGlobals.playerCharStruct.playerDat;
  if (check_some_toggle()) return;
  if (gGlobals.playerCharStruct.playerDat == NULL) return;
  if (gGlobals.Sub.borg9DatPointer == NULL) return;
  pvStack_5c = &((gGlobals.playerCharStruct.playerDat)->collision).pos;
  sStack_168 = 0;
  asStack_166[0] = 0;
  getZonePositionShorts(gGlobals.Sub.borg9DatPointer,pvStack_5c,&sStack_168,asStack_166);
  pbVar5 = getCollideSection(pBVar4,sStack_168,asStack_166[0]);
  uVar14 = 0;
  if (pbVar5 == NULL) return;
  uVar7 = FUN_80005d60(&pwStack_60);
  if ((uVar7 != 0xffff) &&(!pBVar4->voxelObjs[uVar7].monster.flags&4)) {
    fVar18 = ((gGlobals.playerCharStruct.playerDat)->collision).pos.y -
             (pwStack_60->playerDat->collision).pos.y;
    if((fVar18>0&&fVar18<2.0)||fVar18<-2.0f){
    uVar14 = 1;
    voxInds[0] = uVar7;
  }
  }
LAB_800060a0:
  uVar13 = 0;
  i = uVar14;
  if (pbVar5->voxelSceneCount != 0) {
    do {
      uVar14 = i;
      if (i == 0x10) {
LAB_8000613c:
        uVar6 = (uint)pbVar5->voxelSceneCount;
      }
      else {
        uVar8 = pbVar5->lightIndecies[uVar13];
        pvVar11 = (voxelObject *)((int)pBVar4->voxelObjs + ((uint)uVar8 * 0x1c - (uint)uVar8) * 4);
        VVar1 = (pvVar11->header).Bitfeild;
        if ((VVar1 & VOXEL_tangible) == 0) {
          if ((VVar1 & VOXEL_Active)){
            if ((pvVar11->header).timestamp <= gGlobals.ticker) {
              if (Voxel_CheckProc(pvVar11,ppVar3)) {
                uVar14 = i + 1 & 0xffff;
                voxInds[i] = uVar8;
              }
              goto LAB_8000613c;
            }
          }
        }
      }
      uVar13++;
      i = uVar14;
    } while (uVar13 < pbVar5->voxelSceneCount);
  }
  if (uVar14) {
    if (uVar14 == 1) {
      run_voxelFuncs0(&pBVar4->voxelObjs[voxInds[0]],voxInds[0],0);
    }
    else {
      fVar18 = 0.0;
      setVec2(&afStack288,pvStack_5c->x,pvStack_5c->z);
      for(i=0;i<uVar14;i++){
        pvVar11 = &pBVar4->voxelObjs[voxInds[i]];
        if ((pvVar11) &&
         (fVar15 = func_checking_monsterparty(pvVar11,pvStack_5c), fVar18 <= fVar15)) {
        fVar18 = fVar15;
        }
      }
      fVar2 = 0.5f;
      fVar15 = 1.0f;
      i = 0;
      fVar19 = 0.0;
      pvVar11 = NULL;
      uStack_58 = 0x7fff;
      for(i=0;i<uVar14;i++){
          v = &pBVar4->voxelObjs[voxInds[i]];
          if (v) {
            fVar16 = func_checking_monsterparty(v,pvStack_5c);
            monsterparty_setvec2(v,&auStack160);
            Vec2_Sub(&afStack224,&afStack288,&auStack160);
            vec2_normalize(&afStack224);
            fVar17 = vec2_dot(&afStack224,&ppVar3->facing);
            fVar16 = (fVar18 - fVar16) / fVar18 + (fVar17 + fVar15) * fVar2;
            if (fVar19 <= fVar16) {
              uStack_58 = (uint)*puVar12;
              fVar19 = fVar16;
              pvVar11 = v;
            }
          }
      }
      if (pvVar11) {
        run_voxelFuncs0(pvVar11,(u16)uStack_58,(u16)0);
        if ((pvVar11->header).type == VOXEL_Container) 
          ppVar3->ani_type = 0xb;
        if ((pvVar11->header).type == VOXEL_Teleporter)
          ppVar3->ani_type = 0x13;
      }
    }
  }
}

