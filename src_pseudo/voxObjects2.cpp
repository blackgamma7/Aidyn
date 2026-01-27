#include "vobjects.h"
#include "game.h"


u16 FUN_80005d60(Wanderer **w) {
  u16 ret;
  playerData *player = gPlayer;
  *w = NULL;
  if ((gPlayer == NULL) || (player->index == -1)) {
    ret = -1;
  }
  else {
    playerData *pDat = PHANDLE.playerDats + player->index;
    ret = -1;
    if (pDat->state) {
      Wanderer *wander = findWandererFromPlayerName(pDat->ID);
      ret = -1;
      if (wander) {
        voxelObject *vox = &gGlobals.gameVars.borg9DatPointer->voxelObjs[wander->VoxelIndex];
        ret = -1;
        if ((vox) &&
           (player->unk108 <= (pDat->scaleRad)*2 + 0.5f)) {
          ret = -1;
          if (Voxel_CheckProc(vox,gPlayer)) {
            ret = wander->VoxelIndex;
            *w = wander;
          }
        }
      }
    }
  }
  return ret;
}

float func_checking_monsterparty(voxelObject *v,vec3f *po) {
  if ((v->header).type == VOXEL_MonsterParty)
    return (gPlayer)->unk108;
  return Vec3Dist(&v->header.pos,po);
}

void Voxel_Get2DPos(voxelObject *v,vec2f *pos) {
  s16 sVar1;
  
  Vec2Set(pos,(v->header).pos.x,(v->header).pos.z);
  if ((((v->header).type == VOXEL_MonsterParty) && (gPlayer != NULL)) &&
     (sVar1 = gPlayer->index, sVar1 != -1)) {
    Vec2Set(pos,PHANDLE.playerDats[sVar1].collision.pos.x,
            PHANDLE.playerDats[sVar1].collision.pos.z);
  }
}

void obj_ref_func(void) {
  u16 VVar1;
  playerData *ppVar3;
  Borg9Data *pBVar4;
  bool bVar9;
  CollideSection *pbVar5;
  u16 uVar7;
  u16 uVar8;
  u32 uVar6;
  s16 puVar7;
  Vobject VVar10;
  voxelObject *pvVar11;
  u16 *puVar12;
  voxelObject *v;
  u32 uVar13;
  u16 i;
  u16 uVar14;
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
  Wanderer *pwStack_60;
  vec3f *pvStack_5c;
  u32 uStack_58;
  
  if (gGlobals.screenFadeMode) return;
  pBVar4 = gGlobals.gameVars.borg9DatPointer;
  ppVar3 = gPlayer;
  if (check_some_toggle()) return;
  if (gPlayer == NULL) return;
  if (gGlobals.gameVars.borg9DatPointer == NULL) return;
  pvStack_5c = &((gPlayer)->collision).pos;
  sStack_168 = 0;
  asStack_166[0] = 0;
  getZonePositionShorts(gGlobals.gameVars.borg9DatPointer,pvStack_5c,&sStack_168,asStack_166);
  pbVar5 = getCollideSection(pBVar4,sStack_168,asStack_166[0]);
  uVar14 = 0;
  if (pbVar5 == NULL) return;
  uVar7 = FUN_80005d60(&pwStack_60);
  if ((uVar7 != 0xffff) &&(!pBVar4->voxelObjs[uVar7].monster.flags&4)) {
    fVar18 = ((gPlayer)->collision).pos.y -
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
      }
      else {
        uVar8 = pbVar5->voxelIndecies[uVar13];
        pvVar11 = &pBVar4->voxelObjs[uVar8];
        VVar1 = (pvVar11->header).Bitfeild;
        if ((VVar1 & VOXEL_tangible) == 0) {
          if ((VVar1 & VOXEL_Active)){
            if ((pvVar11->header).timestamp <= gGlobals.ticker) {
              if (Voxel_CheckProc(pvVar11,ppVar3)) {
                uVar14 = i + 1;
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
    if (uVar14 == 1) {//only one in range, use it.
      run_voxelFuncs0(&pBVar4->voxelObjs[voxInds[0]],voxInds[0],0);
    }
    else {
      fVar18 = 0.0;
      Vec2Set(&afStack288,pvStack_5c->x,pvStack_5c->z);
      for(i=0;i<uVar14;i++){
        pvVar11 = &pBVar4->voxelObjs[voxInds[i]];
        if ((pvVar11) &&
         (fVar15 = func_checking_monsterparty(pvVar11,pvStack_5c), fVar18 <= fVar15)) {
        fVar18 = fVar15;
        }
      }
      fVar19 = 0.0;
      pvVar11 = NULL;
      uStack_58 = 0x7fff;
      for(i=0;i<uVar14;i++){
          v = &pBVar4->voxelObjs[voxInds[i]];
          if (v) {
            fVar16 = func_checking_monsterparty(v,pvStack_5c);
            Voxel_Get2DPos(v,&auStack160);
            Vec2Sub(&afStack224,&afStack288,&auStack160);
            Vec2Normalize(&afStack224);
            fVar16 = (fVar18 - fVar16) / fVar18 + 
               (Vec2Dot(&afStack224,&ppVar3->facing) + 1.0) * 0.5;
            if (fVar19 <= fVar16) {
              uStack_58 = voxInds[i];
              fVar19 = fVar16;
              pvVar11 = v;
            }
          }
      }
      if (pvVar11) {
        run_voxelFuncs0(pvVar11,(u16)uStack_58,(u16)0);
        if ((pvVar11->header).type == VOXEL_Container) 
          ppVar3->ani_type = AniType_11;
        if ((pvVar11->header).type == VOXEL_Teleporter)
          ppVar3->ani_type = AniType_19;
      }
    }
  }
}

