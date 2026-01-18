#include "collide.h"

bool FUN_800ae760(vec3f *param_1,borg9_phys *param_2){
  vec3f *pvVar1;
  float *pfVar2;
  float *pfVar3;
  float *pfVar4;
  float *pfVar5;
  int iVar6;
  float *pfVar7;
  float fVar8;
  float fVar9;
  float local_80 [5];
  float local_6c;
  float local_40;
  float local_3c;
  
  fVar9 = (param_2->normal).x;
  pfVar5 = local_80;
  pfVar7 = local_80;
  pfVar3 = local_80;
  pfVar4 = local_80;
  pfVar2 = local_80;
  if (fVar9 <= 0.0) fVar9 = -fVar9;
  fVar8 = (param_2->normal).y;
  if (0.0 < fVar8) {
    if (fVar9 <= fVar8) goto LAB_800ae888;
    fVar9 = (param_2->normal).x;
LAB_800ae7c0:
    if (fVar9 <= 0.0) fVar9 = -fVar9;
    fVar8 = (param_2->normal).z;
    if (fVar8 <= 0.0) fVar8 = -fVar8;
    if (fVar8 < fVar9) {
      pfVar7 = local_80 + 1;
      for(iVar6 = 2;-1 < iVar6;iVar6--) {
        pvVar1 = param_2->verts[0];
        param_2 = (borg9_phys *)(param_2->verts + 1);
        *pfVar5 = pvVar1->z;
        pfVar5 = pfVar5 + 2;
        *pfVar7 = pvVar1->y;
        pfVar7 = pfVar7 + 2;
      }
      local_40 = param_1->z;
    }
    else {
      pfVar5 = local_80 + 1;
      for(iVar6 = 2;-1 < iVar6;iVar6--) {
        pvVar1 = param_2->verts[0];
        param_2 = (borg9_phys *)(param_2->verts + 1);
        *pfVar7 = pvVar1->x;
        pfVar7 = pfVar7 + 2;
        *pfVar5 = pvVar1->y;
        pfVar5 = pfVar5 + 2;
      }
      local_40 = param_1->x;
    }
  }
  else {
    if (-fVar8 < fVar9) {
      fVar9 = (param_2->normal).x;
      goto LAB_800ae7c0;
    }
LAB_800ae888:
    if (fVar8 <= 0.0) {
      fVar8 = -fVar8;
    }
    fVar9 = (param_2->normal).z;
    if (fVar9 <= 0.0) {
      fVar9 = -fVar9;
    }
    if (fVar9 < fVar8) {
      pfVar5 = local_80 + 1;
      for(iVar6 = 2;-1 < iVar6;iVar6--) {
        pvVar1 = param_2->verts[0];
        param_2 = (borg9_phys *)(param_2->verts + 1);
        *pfVar3 = pvVar1->x;
        pfVar3 = pfVar3 + 2;
        *pfVar5 = pvVar1->z;
        pfVar5 = pfVar5 + 2;
      }
      local_40 = param_1->x;
      local_3c = param_1->z;
      goto LAB_800ae958;
    }
    pfVar5 = local_80 + 1;
    for(iVar6 = 2;-1 < iVar6;iVar6--) {
      pvVar1 = param_2->verts[0];
      param_2 = (borg9_phys *)(param_2->verts + 1);
      *pfVar4 = pvVar1->x;
      pfVar4 = pfVar4 + 2;
      *pfVar5 = pvVar1->y;
      pfVar5 = pfVar5 + 2;
    }
    local_40 = param_1->x;
  }
  local_3c = param_1->y;
LAB_800ae958:
  pfVar5 = local_80 + 1;
  iVar6 = 2;
  for(iVar6 = 2;-1 < iVar6;iVar6--) {
    *pfVar2 = *pfVar2 - local_40;
    pfVar2 = pfVar2 + 2;
    *pfVar5 = *pfVar5 - local_3c;
    pfVar5 = pfVar5 + 2;
  }
  if (local_80[0] * local_80[3] - local_80[2] * local_80[1] < 0.0) iVar6 = -1;
  else iVar6 = 1;
  if (local_80[2] * local_6c - local_80[4] * local_80[3] < 0.0) iVar6--;
  else iVar6++;
  if (local_80[4] * local_80[1] - local_80[0] * local_6c < 0.0) iVar6--;
  else iVar6++;
  if (iVar6 < 0) iVar6 = -iVar6;
  return iVar6 == 3;
}

bool FUN_800aea44(vec3f *pos,vec3f *vel,float spd,borg9_phys *param_4,float *param_5,vec3f *param_6){
  bool uVar2;
  float fVar1;
  float fVar2;
  float fVar3;
  vec3f fStack248;
  vec3f fStack184;
  vec3f avStack_78 [8];
  
  fStack248.x = (pos->x - (param_4->normal).x * spd) + vel->x;
  fStack248.y = (pos->y - (param_4->normal).y * spd) + vel->y;
  fStack248.z = (pos->z - (param_4->normal).z * spd) + vel->z;
  Vec3Sub(&fStack184,pos,param_4->verts[0]);
  Vec3Sub(avStack_78,&fStack248,param_4->verts[0]);
  fVar1 = Vec3Dot(&fStack184,&param_4->normal);
  fVar2 = Vec3Dot(avStack_78,&param_4->normal);
  *param_5 = fVar2;
  if (fVar1 < 0.0) {
    fVar3 = fVar1;
    if (fVar1 <= 0.0) fVar3 = -fVar1;
    if (spd < fVar3) return false;
  }
  uVar2 = false;
  if (fVar2 <= 0.0) {
    fVar2 = fVar1 + fVar2;
    if (fVar2 != 0.0) fVar2 = fVar1 / fVar2;
    param_6->x = pos->x + vel->x * fVar2;
    param_6->y = pos->y + vel->y * fVar2;
    param_6->z = pos->z + vel->z * fVar2;
    uVar2 = FUN_800ae760(param_6,param_4);
  }
  return uVar2;
}

bool FUN_800aec1c(vec3f *param_1,vec3f *param_2,float param_3,borg9_phys *param_4,float *param_5,vec3f *param_6){
  bool bVar1;
  float fVar2;
  float fVar3;
  vec3f local_128;
  vec3f local_e8;
  vec3f avStack_a8 [5];
  vec3f avStack_68 [8];
  
  local_128.x = param_1->x - (param_4->normal).x * param_3;
  local_128.y = param_1->y - (param_4->normal).y * param_3;
  local_128.z = param_1->z - (param_4->normal).z * param_3;
  local_e8.x = local_128.x + param_2->x;
  local_e8.y = local_128.y + param_2->y;
  local_e8.z = local_128.z + param_2->z;
  Vec3Sub(avStack_a8,&local_128,param_4->verts[0]);
  Vec3Sub(avStack_68,&local_e8,param_4->verts[0]);
  fVar2 = Vec3Dot(avStack_a8,&param_4->normal);
  fVar3 = Vec3Dot(avStack_68,&param_4->normal);
  *param_5 = fVar3;
  if ((fVar2 < 0.0) || (0.0 < fVar3)) return false;
  else {
    if (fVar3 < 0.0) fVar3 = fVar2 - fVar3;
    else fVar3 = fVar2 + fVar3;
    if (0.0 < fVar3) {
      if (fVar2 < 0.0) fVar2 = -fVar2;
      fVar3 = fVar2 / fVar3;
    }
    param_6->x = local_128.x + param_2->x * fVar3;
    param_6->y = local_128.y + param_2->y * fVar3;
    param_6->z = local_128.z + param_2->z * fVar3;
    return FUN_800ae760(param_6,param_4);
  }
}

bool FUN_800aede8(collisionSphere *param_1,float param_2,vec3f *param_3,vec3f *param_4,float *param_5,vec3f *param_6){
  bool bVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  vec3f afStack392;
  vec3f afStack328;
  vec3f afStack264;
  vec3f fStack200;
  vec3f fStack136;
  
  Vec3Copy(&param_1->vel,&afStack392);
  Vec3Normalize(&afStack392);
  Vec3Scale(&afStack392,param_2);
  Vec3Sum(&afStack392,&afStack392,&param_1->pos);
  Vec3Sub(&afStack328,param_3,&param_1->pos);
  Vec3Sub(&afStack264,&afStack392,&param_1->pos);
  Vec3Sub(&fStack200,param_4,param_3);
  fVar2 = Vec3Dot(&afStack264,&fStack200);
  fVar3 = Vec3Dot(&afStack264,&afStack264);
  fVar4 = Vec3Dot(&fStack200,&fStack200);
  fVar4 = fVar4 * fVar3 - fVar2 * fVar2;
  if (fVar4 < 0.0) bVar1 = -fVar4 < NORMALIZE_MIN;
  else bVar1 = fVar4 < NORMALIZE_MIN;
  if (bVar1) return false;
  fVar5 = Vec3Dot(&afStack328,&afStack264);
  fVar6 = Vec3Dot(&afStack328,&fStack200);
  fVar4 = (fVar5 * fVar2 - fVar6 * fVar3) / fVar4;
  fVar3 = (fVar5 + fVar2 * fVar4) / fVar3;
  if (0.0 <= fVar4) {
    if (1.0f < fVar4) return false;
    if (fVar3 < 0.0) return false;
    if (1.0f < fVar3) return false;
    fStack136.x = param_3->x + fVar3 * fStack200.x;
    fStack136.y = param_3->y + fVar3 * fStack200.y;
    fStack136.z = param_3->z + fVar3 * fStack200.z;
    Vec3Sub(param_6,&fStack136,&param_1->pos);
    fVar2 = Vec3Normalize(param_6);
    *param_5 = fVar2;
    if (fVar2 < param_2) return true;
  }
  return false;
}

bool FUN_800af050(collisionSphere *param_1,float param_2,vec3f *param_3,float param_4,float *length,vec3f *dist,vec3f *outVel){  
  Vec3Sub(dist,param_3,&param_1->pos);
  *length = Vec3Normalize(dist) - param_4;
  if (*length <= param_2) {
    outVel->x = (param_1->pos).x + dist->x * *length;
    outVel->y = (param_1->pos).y + dist->y * *length;
    outVel->z = (param_1->pos).z + dist->z * *length;
  }
  return *length <= param_2;
}

bool FUN_800af120(collisionSphere *param_1,float param_2,vec3f *pos,float param_4,float *param_5,vec3f *param_6,vec3f *param_7){
  Vec3Sub(param_6,pos,&param_1->pos);
  param_6->y = 0.0;
  *param_5 = Vec3Normalize(param_6) - param_4;
  if (*param_5 <= param_2) {
    param_7->x = (param_1->pos).x + param_6->x * *param_5;
    param_7->y = (param_1->pos).y + param_6->y * *param_5;
    param_7->z = (param_1->pos).z + param_6->z * *param_5;
  }
  return *param_5 <= param_2;
}

