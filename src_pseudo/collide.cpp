#include "globals.h"


void FUN_800adae0(Borg9data *param_1,vec3f *position,vec3f *dist,float radius,s16 *param_5,s16 *param_6,short *param_7,s16 *param_8){
  short sVar1;
  float len;
  float fVar2;
  float fVar3;
  vec2f local_68;
  
  local_68.x = dist->x;
  local_68.y = dist->z;
  len = vec2Length(&local_68) + radius + 1.0f;
  fVar3 = (param_1->floatsB).x;
  *param_5 = (((position->x - (param_1->floatsA).x) - len) / fVar3);
  fVar2 = (param_1->floatsB).y;
  *param_6 = (((position->z - (param_1->floatsA).z) - len) / fVar2);
  *param_7 = (((position->x - (param_1->floatsA).x) + len) / fVar3);
  *param_8 = (((position->z - (param_1->floatsA).z) + len) / fVar2);
  if (*param_5 < 0) *param_5 = 0;
  if (*param_6 < 0) *param_6 = 0;
  if (*param_7 >= param_1->shortA)
    *param_7 = param_1->shortA - 1;
  if (param_1->shortB <= *param_8)
    *param_8 = param_1->shortB - 1;
}


void FUN_800adc44(Borg9data *param_1,collisionSphere *param_2,short *param_3,short *param_4,
                 short *param_5,short *param_6){
  float fVar2;
  float fVar3;
  float fVar4;
  vec2f avStack_60;
  
  avStack_60.x = (param_2->vel).x;
  avStack_60.y = (param_2->vel).z;
  fVar2 = vec2Length(&avStack_60) + param_2->radius + 1.0f;
  fVar4 = (param_1->floatsB).x;
  *param_3 = ((((param_2->pos).x - (param_1->floatsA).x) - fVar2) / fVar4);
  fVar3 = (param_1->floatsB).y;
  *param_4 = ((((param_2->pos).z - (param_1->floatsA).z) - fVar2) / fVar3);
  *param_5 = ((((param_2->pos).x - (param_1->floatsA).x) + fVar2) / fVar4);
  *param_6 = ((((param_2->pos).z - (param_1->floatsA).z) + fVar2) / fVar3);
  if (*param_3 < 0) *param_3 = 0;
  if (*param_4 < 0) *param_4 = 0;
  if (*param_5 >= param_1->shortA) *param_5 = param_1->shortA - 1;
  if (param_1->shortB <= *param_6) *param_6 = param_1->shortB - 1;
}



void getZonePositionShorts(Borg9data *param_1,vec3f *position,s16 *param_3,s16 *param_4){
  short sVar1;
  
  *param_3 = ((position->x - (param_1->floatsA).x) / (param_1->floatsB).x);
  sVar1 = (((position->z - (param_1->floatsA).z) / (param_1->floatsB).y);
  *param_4 = sVar1;
  if (*param_3 < 0) *param_4 = 0;
  else {
    if (*param_3 < param_1->shortA) {
      if (sVar1 < 0) {
        *param_4 = 0;
        goto LAB_800ade1c;
      }
      if (sVar1 < param_1->shortB) return;
    }
    *param_4 = 0;
  }
LAB_800ade1c:
  *param_3 = 0;
}

bool FUN_800ade28(Borg9data *mapdat,vec3f *pos,short *xout,short *zout){
  *xout = ((pos->x - (mapdat->floatsA).x) / (mapdat->floatsB).x);
  *zout = ((pos->z - (mapdat->floatsA).z) / (mapdat->floatsB).y);
  if ((((-1 < *xout) && (*xout < mapdat->shortA)) &&
      (-1 < *zout)) && (*zout < mapdat->shortB)) {
    return true;
  }
  return false;
}


bool Ofunc_800adeb0(Borg9data *param_1,collisionSphere *s,vec3f *v){
  vec3f temp;
  
  (s->vel).x = v->x - (s->pos).x;
  (s->vel).y = v->y - (s->pos).y;
  (s->vel).z = v->z - (s->pos).z;
  temp.x = v->x;
  temp.y = v->y;
  temp.z = v->z;
  ProcessCollisionSphere(param_1,s,1);
  v->x = (s->pos).x;
  v->y = (s->pos).y;
  v->z = (s->pos).z;
  (s->vel).x = 0.0;
  (s->vel).y = 0.0;
  (s->vel).z = 0.0;
  return NORMALIZE_MIN < vec3_proximity(v,&temp);
}

bool CheckCollision(Borg9data *borgDat,vec3f *posA,vec3f *posB,float radius,vec3f *outPos,
                   vec3f *outRot,short param_7){
  int iVar1;
  borg_9_struct *pbVar2;
  bool bVar3;
  int iVar4;
  int iVar5;
  borg9_phys *pbVar7;
  int iVar8;
  float fVar10;
  vec3f dist;
  vec3f avStack_88 [5];
  s16 sStack_48 [4];
  undefined auStack_40 [4];
  int iStack_3c;
  
  iStack_3c = (int)param_7;
  if (outPos) setVec3(outPos,0.0,0.0,0.0);
  if (outRot) setVec3(outRot,0.0,0.0,0.0);
  if (borgDat) {
    Vec3_sub(&dist,posB,posA);
    FUN_800adae0(borgDat,posA,&dist,radius,sStack_48,sStack_48 + 1,sStack_48 + 2,sStack_48 + 3);
    s16 lVar9 = sStack_48[0];
    if (sStack_48[2] < lVar9) return false;
    for(;lVar9 <= sStack_48[2];lVar9++) {
      s16 lVar6=sStack_48[1];
      if (lVar6 <= sStack_48[3]) {
        for(;lVar6 <= sStack_48[3];lVar6++) {
          pbVar2 = borg9_get_unkStruct(borgDat,lVar9,lVar6);
          if (pbVar2->collideCount) {
            for(s16 iVar5=0;iVar5 < pbVar2->collideCount;iVar5++) {
              pbVar7 = borgDat->phys_pointer + (ushort)pbVar2->collideIndecies[iVar5];
              if ((iStack_3c == 0) || (!(pbVar7->flags & 0x200))) {
                if (vec3_dot(&dist,&pbVar7->normal) <= 0.0) {
                  if (FUN_800aec1c(posA,&dist,radius,pbVar7,auStack_40,avStack_88)) {
                    if (outPos) copyVec3(avStack_88,outPos);
                    if (outRot) copyVec3(&pbVar7->normal,outRot);
                    return true;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return false;
}


bool processPlayers_sub(Borg9data *param_1,vec3f *playerPos,vec3f *playposMinY,float point5,
                       vec3f *outpos,vec3f *outNorm){
  int iVar1;
  borg_9_struct *pbVar2;
  uint uVar3;
  bool bVar4;
  int iVar5;
  int iVar6;
  longlong lVar7;
  uint uVar8;
  uint uVar9;
  borg9_phys *pbVar10;
  int iVar11;
  longlong lVar12;
  vec3f len;
  vec3f afStack136;
  short sStack_48;
  short sStack_46;
  short sStack_44;
  short sStack_42;
  undefined auStack_40 [8];
  uint uStack_38;
  uint uStack_34;
  
  if (outpos) setVec3(outpos,0.0,0.0,0.0);
  if (outNorm) setVec3(outNorm,0.0,0.0,0.0);
  Vec3_sub(&len,playposMinY,playerPos);
  FUN_800adae0(param_1,playerPos,&len,point5,&sStack_48,&sStack_46,&sStack_44,&sStack_42);
  lVar12 = (longlong)sStack_48;
  if (lVar12 <= sStack_44) {
    iVar5 = sStack_48 * 0x10000;
    do {
      iVar5 += 0x10000;
      lVar7 = (longlong)sStack_46;
      if (lVar7 <= sStack_42) {
        iVar1 = sStack_46 * 0x10000;
        do {
          iVar1 += 0x10000;
          pbVar2 = borg9_get_unkStruct(param_1,(short)lVar12,(short)lVar7);
          iVar6 = 0;
          if (pbVar2->collideCount != 0) {
            uVar9 = 1;
            uVar8 = 2;
            iVar11 = 0x10000;
            do {
              pbVar10 = param_1->phys_pointer + (ushort)pbVar2->collideIndecies[iVar6];
              uVar3 = pbVar10->GroundType & 0x1f;
              if ((uVar3 != uVar9) && (uVar3 != uVar8)) {
                uStack_38 = uVar8;
                uStack_34 = uVar9;
                uVar8 = uStack_38;
                uVar9 = uStack_34;
                if (FUN_800aec1c(playerPos,&len,point5,pbVar10,auStack_40,&afStack136)) {
                  if (outpos) copyVec3(&afStack136,outpos);
                  if (outNorm != NULL) copyVec3(&pbVar10->normal,outNorm);
                  return true;
                }
              }
              iVar6 = iVar11 >> 0x10;
              iVar11 += 0x10000;
            } while (iVar6 < (int)(uint)(ushort)pbVar2->collideCount);
          }
          lVar7 = (longlong)(iVar1 >> 0x10);
        } while (lVar7 <= sStack_42);
      }
      lVar12 = (longlong)(iVar5 >> 0x10);
    } while (lVar12 <= sStack_44);
  }
  return false;
}




void ProcessCollisionSphere(Borg9data *map,collisionSphere *coliide,short delta){
  int iVar1;
  int iVar2;
  borg_9_struct *pbVar3;
  s16 lVar4;
  s16 lVar5;
  int iVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  float fVar12;
  double dVar13;
  vec3f fStack120;
  short sStack_38;
  short sStack_36;
  short sStack_34;
  short asStack_32 [21];
  
  iVar6 = (int)delta;
  if (!coliide->envProps->Speed)CRASH("ProcessCollisionSphere","No Environment Properties Found on Sphere");
  else {
    if (!(coliide->flags & 0x8000)) {
      fStack120.x = (coliide->pos).x;
      if (((((1000.0f <= fStack120.x) || (fStack120.x <= -1000.0f)) ||
           (fStack120.y = (coliide->pos).y, 1000.0f <= fStack120.y)) ||
          ((fStack120.y <= -1000.0f ||
           (fStack120.z = (coliide->pos).z, 1000.0f <= fStack120.z)))) ||
         (fStack120.z <= -1000.0f)) {
        coliide->flags|= 0x8000;
      }
      else {
        if (0 < iVar6) {
          for(s16 i=0;i<iVar6;i++) {
            collisiondat_add_velocity(coliide,&coliide->envProps->Speed->gravity);
            collisiondat_add_velocity(coliide,&coliide->envProps->Speed->Accel);
            fVar7 = coliide->envProps->Speed->velScale;
            fVar9 = (coliide->vel).x * fVar7;
            fVar11 = (coliide->vel).y * fVar7;
            fVar12 = (coliide->pos).x;
            fVar7 = (coliide->vel).z * fVar7;
            fVar8 = (coliide->pos).y;
            (coliide->vel).x = fVar9;
            fVar10 = (coliide->pos).z;
            (coliide->vel).y = fVar11;
            (coliide->vel).z = fVar7;
            (coliide->pos).x = fVar12 + fVar9;
            (coliide->pos).y = fVar8 + fVar11;
            (coliide->pos).z = fVar10 + fVar7;
          }
        }
        if (!(coliide->flags & 0x4000)) {
          FUN_800adc44(map,coliide,&sStack_38,&sStack_36,&sStack_34,asStack_32);
          lVar5 = sStack_38;
          coliide->unk1e = 0;
          if (lVar5 <= sStack_34) {
            for(;lVar5 <= sStack_34;lVar5++) {
              lVar4 = sStack_36;
              if (lVar4 <= asStack_32[0]) {
                for(;lVar4 <= asStack_32[0];lVar4++) {
                  CollideCollisionSphereWithVoxelPolys(coliide,borg9_get_unkStruct(map,lVar5,lVar4),map->phys_pointer);
                }
              }
            }
          }
          if (coliide->unk1e) {
            dVar13 = iVar6 * 0.006;
            if ((vec3Length(&coliide->vel) < dVar13) &&(vec3_proximity(&fStack120,&coliide->pos) < dVar13)) {
              (coliide->vel).x = 0.0;
              (coliide->vel).y = 0.0;
              (coliide->vel).z = 0.0;
              (coliide->pos).x = fStack120.x;
              (coliide->pos).y = fStack120.y;
              (coliide->pos).z = fStack120.z;
            }
          }
        }
      }
    }
  }
}

