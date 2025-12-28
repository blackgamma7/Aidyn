#include "globals.h"


void FUN_800adae0(Borg9Data *param_1,vec3f *position,vec3f *dist,float radius,s16 *param_5,s16 *param_6,s16 *param_7,s16 *param_8){
  float len;
  vec2f local_68;
  
  local_68.x = dist->x;
  local_68.y = dist->z;
  len = Vec2Length(&local_68) + radius + 1.0f;
  *param_5 = (((position->x - (param_1->floatsA).x) - len) / (param_1->floatsB).x);
  *param_6 = (((position->z - (param_1->floatsA).z) - len) / (param_1->floatsB).y);
  *param_7 = (((position->x - (param_1->floatsA).x) + len) / (param_1->floatsB).x);
  *param_8 = (((position->z - (param_1->floatsA).z) + len) / (param_1->floatsB).y);
  if (*param_5 < 0) *param_5 = 0;
  if (*param_6 < 0) *param_6 = 0;
  if (*param_7 >= param_1->shortA)
    *param_7 = param_1->shortA - 1;
  if (param_1->shortB <= *param_8)
    *param_8 = param_1->shortB - 1;
}


void FUN_800adc44(Borg9Data *param_1,collisionSphere *param_2,s16 *param_3,s16 *param_4,
                 s16 *param_5,s16 *param_6){
  float fVar2;
  float fVar3;
  float fVar4;
  vec2f avStack_60;
  
  avStack_60.x = (param_2->vel).x;
  avStack_60.y = (param_2->vel).z;
  fVar2 = Vec2Length(&avStack_60) + param_2->radius + 1.0f;
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



void getZonePositionShorts(Borg9Data *param_1,vec3f *position,s16 *param_3,s16 *param_4){
  *param_3 = ((position->x - (param_1->floatsA).x) / (param_1->floatsB).x);
  *param_4 = ((position->z - (param_1->floatsA).z) / (param_1->floatsB).y);
  if (*param_3 < 0) *param_4 = 0;
  else {
    if (*param_3 < param_1->shortA) {
      if (*param_4 < 0) {
        *param_4 = 0;
        goto LAB_800ade1c;
      }
      if (*param_4 < param_1->shortB) return;
    }
    *param_4 = 0;
  }
LAB_800ade1c:
  *param_3 = 0;
}

bool FUN_800ade28(Borg9Data *mapdat,vec3f *pos,s16 *xout,s16 *zout){
  *xout = ((pos->x - (mapdat->floatsA).x) / (mapdat->floatsB).x);
  *zout = ((pos->z - (mapdat->floatsA).z) / (mapdat->floatsB).y);
  if ((((-1 < *xout) && (*xout < mapdat->shortA)) &&
      (-1 < *zout)) && (*zout < mapdat->shortB)) {
    return true;
  }
  return false;
}


bool Ofunc_800adeb0(Borg9Data *param_1,collisionSphere *s,vec3f *v){
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
  return NORMALIZE_MIN < Vec3Dist(v,&temp);
}

bool CheckCollision(Borg9Data *borgDat,vec3f *posA,vec3f *posB,float radius,vec3f *outPos,
                   vec3f *outRot,s16 param_7){
  int iVar1;
  CollideSection *pbVar2;
  bool bVar3;
  int iVar4;
  int iVar5;
  borg9_phys *pbVar7;
  int iVar8;
  float fVar10;
  vec3f dist;
  vec3f avStack_88 [5];
  s16 sStack_48 [4];
  float auStack_40;
  int iStack_3c;
  
  iStack_3c = (int)param_7;
  if (outPos) Vec3Set(outPos,0.0,0.0,0.0);
  if (outRot) Vec3Set(outRot,0.0,0.0,0.0);
  if (borgDat) {
    Vec3Sub(&dist,posB,posA);
    FUN_800adae0(borgDat,posA,&dist,radius,sStack_48,sStack_48 + 1,sStack_48 + 2,sStack_48 + 3);
    s16 i = sStack_48[0];
    if (sStack_48[2] < i) return false;
    for(;i <= sStack_48[2];i++) {
      s16 j=sStack_48[1];
      if (j <= sStack_48[3]) {
        for(;j <= sStack_48[3];j++) {
          pbVar2 = getCollideSection(borgDat,i,j);
          if (pbVar2->collideCount) {
            for(s16 iVar5=0;iVar5 < pbVar2->collideCount;iVar5++) {
              pbVar7 = borgDat->phys_pointer + (u16)pbVar2->collideIndecies[iVar5];
              if ((iStack_3c == 0) || (!(pbVar7->flags & B9Phys_0200))) {
                if (Vec3Dot(&dist,&pbVar7->normal) <= 0.0) {
                  if (FUN_800aec1c(posA,&dist,radius,pbVar7,&auStack_40,avStack_88)) {
                    if (outPos) Vec3Copy(avStack_88,outPos);
                    if (outRot) Vec3Copy(&pbVar7->normal,outRot);
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


bool processPlayers_sub(Borg9Data *param_1,vec3f *playerPos,vec3f *playposMinY,float point5,
                       vec3f *outpos,vec3f *outNorm){
  CollideSection *pbVar2;
  u32 uVar3;
  u32 uVar8;
  u32 uVar9;
  borg9_phys *pbVar10;
  vec3f len;
  vec3f afStack136;
  s16 sStack_48;
  s16 sStack_46;
  s16 sStack_44;
  s16 sStack_42;
  float auStack_40;
  u32 uStack_38;
  u32 uStack_34;
  
  if (outpos) Vec3Set(outpos,0.0,0.0,0.0);
  if (outNorm) Vec3Set(outNorm,0.0,0.0,0.0);
  Vec3Sub(&len,playposMinY,playerPos);
  FUN_800adae0(param_1,playerPos,&len,point5,&sStack_48,&sStack_46,&sStack_44,&sStack_42);
    for(s16 i = sStack_48;i<sStack_44;i++) {
      for(s16 j = sStack_46;j<sStack_42;j++) {
          pbVar2 = getCollideSection(param_1,i,j);
          s16 k = 0;
          if (pbVar2->collideCount != 0) {
            uVar9 = 1;
            uVar8 = 2;
            for(;k<pbVar2->collideCount;k++) {
              pbVar10 = param_1->phys_pointer + (u16)pbVar2->collideIndecies[k];
              uVar3 = pbVar10->GroundType & 0x1f;
              if ((uVar3 != uVar9) && (uVar3 != uVar8)) {
                uStack_38 = uVar8;
                uStack_34 = uVar9;
                uVar8 = uStack_38;
                uVar9 = uStack_34;
                if (FUN_800aec1c(playerPos,&len,point5,pbVar10,&auStack_40,&afStack136)) {
                  if (outpos) Vec3Copy(&afStack136,outpos);
                  if (outNorm) Vec3Copy(&pbVar10->normal,outNorm);
                  return true;
                }
              }
            }
          }
        }
    }
  return false;
}

void ProcessCollisionSphere(Borg9Data *map,collisionSphere *coliide,s16 delta){
  int iVar1;
  int iVar2;
  CollideSection *pbVar3;
  s16 lVar4;
  s16 lVar5;
  double dVar13;
  vec3f fStack120;
  s16 sStack_38;
  s16 sStack_36;
  s16 sStack_34;
  s16 asStack_32;
  
  if (!coliide->envProps->Speed) {CRASH("ProcessCollisionSphere","No Environment Properties Found on Sphere");}
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
        for(s16 i=0;i<delta;i++) {
            collisiondat_add_velocity(coliide,&coliide->envProps->Speed->gravity);
            collisiondat_add_velocity(coliide,&coliide->envProps->Speed->Accel);
            (coliide->vel).x *=coliide->envProps->Speed->velScale;
            (coliide->vel).y *=coliide->envProps->Speed->velScale;
            (coliide->vel).z *=coliide->envProps->Speed->velScale;
            (coliide->pos).x += (coliide->vel).x;
            (coliide->pos).y += (coliide->vel).y;
            (coliide->pos).z += (coliide->vel).z;
        }
        if (!(coliide->flags & 0x4000)) {
          FUN_800adc44(map,coliide,&sStack_38,&sStack_36,&sStack_34,&asStack_32);
          lVar5 = sStack_38;
          coliide->unk1e = 0;
          if (lVar5 <= sStack_34) {
            for(;lVar5 <= sStack_34;lVar5++) {
              lVar4 = sStack_36;
              if (lVar4 <= asStack_32) {
                for(;lVar4 <= asStack_32;lVar4++) {
                  CollideCollisionSphereWithVoxelPolys(coliide,getCollideSection(map,lVar5,lVar4),map->phys_pointer);
                }
              }
            }
          }
          if (coliide->unk1e) {
            dVar13 = delta * 0.006;
            if ((Vec3Length(&coliide->vel) < dVar13) &&(Vec3Dist(&fStack120,&coliide->pos) < dVar13)) {
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

