#include "globals.h"
#include "unkStructs.h"


void set_checktrigger_pointer(void *param_1){
  struct_unk_.check_trigger_func = param_1;
}


void collisiondat_add_velocity(collisionSphere *param_1,vec3f *accel){
  (param_1->vel).x += accel->x;
  (param_1->vel).y += accel->y;
  (param_1->vel).z += accel->z;
}

void collisiondat_sub_velocity(collisionSphere *param_1,vec3f *accel){
  (param_1->vel).x -= accel->x;
  (param_1->vel).y -= accel->y;
  (param_1->vel).z -= accel->z;
}


void collision_velocity_func(vec3f *vel,vec3f *param_2){
  float len;
  float fVar1;
  float fVar2;
  float fVar3;

  len = vec3_normalize(vel);
  fVar2 = vel->x * param_2->x + vel->y * param_2->y + vel->z * param_2->z;
  if (0.0 < fVar2) {
    vel->x *= len;
    vel->y *= len;
    vel->z *= len;
  }
  else {
    fVar1 = param_2->x * fVar2;
    vel->x -= (fVar1 + fVar1);
    fVar3 = param_2->y * fVar2;
    vel->y -= (fVar3 + fVar3);
    fVar2 = param_2->z * fVar2;
    vel->z -= (fVar2 + fVar2);
    vec3_normalize(vel);
    vel->x *= len;
    vel->y *= len;
    vel->z *= len;
  }
}



void vec3A_plusBMulC(vec3f *A,vec3f *B,float c){
  A->x = A->x + B->x * c;
  A->y = A->y + B->y * c;
  A->z = A->z + B->z * c;
}

bool FUN_800af578(collisionSphere *param_1,EnvProp *param_2,vec3f *param_3){
  bool bVar3;
  float fVar4;
  float fVar5;
  
  fVar5 = param_3->x;
  bVar3 = false;
  fVar4 = fVar5 * (param_1->polyNormal).x + param_3->y * (param_1->polyNormal).y +
          param_3->z * (param_1->polyNormal).z;
  if (fVar4 <= 0.0) fVar4 = -fVar4;
  if ((param_1->unk1e == 0) || (fVar4 < 0.9397)) {
    fVar4 = 1.0f - param_2->colA->unk0 * param_1->envProps->colA->unk0;
    if (fVar5 <= 0.0) fVar5 = -fVar5;
    (param_1->vel).x = (param_1->vel).x * (1.0f - fVar5 * fVar4);
    fVar5 = param_3->y;
    if (fVar5 <= 0.0) fVar5 = -fVar5;
    (param_1->vel).y = (param_1->vel).y * (1.0f - fVar5 * fVar4);
    fVar5 = param_3->z;
    if (fVar5 <= 0.0) fVar5 = -fVar5;
    (param_1->vel).z = (param_1->vel).z * (1.0f - fVar5 * fVar4);
    bVar3 = true;
  }
  fVar5 = param_2->colA->unk4 * param_1->envProps->colA->unk4;
  (param_1->vel).x *= fVar5;
  (param_1->vel).y *= fVar5;
  (param_1->vel).z *= fVar5;
  return bVar3;
}


void PerformCallback(short type,collisionSphere *param_2,borg9_phys *param_3){
  void *pfVar2;
  char acStack_48 [72];
  
  if ((param_2->flags & 0x1000) == 0) {
    switch(type){
        case 2:
          pfVar2 = param_2->envProps->colA->callbackB;
          break;
        case 1:
          pfVar2 = param_2->envProps->colA->callbackA;
          break;
        case 4:
          pfVar2 = param_2->envProps->colA->callbackC;
          break;
        case 8:
          pfVar2 = struct_unk_.check_trigger_func;
          break;
        default:
        sprintf(acStack_48,"Unknown callback: %d\n",type);
        CRASH("PerformCallback",acStack_48);
    }
    (*pfVar2)(param_2,param_3);
  }
}


void Ofunc_800af7ac(collisionSphere *collide,void *callback){
  collide->envProps->colA->callbackA = callback;
  collide->envProps->colA->flag|=1;
}

void Ofunc_800af7d0(collisionSphere *collide,void *callback){
  collide->envProps->colA->callbackB = callback;
  collide->envProps->colA->flag|=2;
}

void Ofunc_800af7f4(collisionSphere *collide,void *callback){
  collide->envProps->colA->callbackC = callback;
  collide->envProps->colA->flag|=4;
}


short CollideCollisionSphereWithVoxelPolys(collisionSphere *collider,borg_9_struct *param_2,borg9_phys *param_3){
  ushort uVar1;
  ushort uVar2;
  bool bVar3;
  double dVar4;
  bool bVar6;
  bool bVar7;
  short sVar5;
  vec3f *A;
  vec3f *vel;
  vec3f *B;
  int iVar8;
  int iVar9;
  borg9_phys *pbVar10;
  borg9_phys *pbVar11;
  short sVar12;
  int iVar13;
  float fVar14;
  float fVar15;
  vec3f fStack224;
  vec3f fStack160;
  vec3f fStack96;
  
  dVar4 = 0.005;
  iVar13 = 0;
  fStack96.y = 0.0;
  fStack96.z = 0.0;
  sVar12 = 0;
  if (param_2->collideCount) {
    do {
      pbVar11 = param_3 + (ushort)param_2->collideIndecies[iVar13];
      if (((collider->flags & 0x200) == 0) || ((pbVar11->flags & 0x200) == 0)) {
        bVar3 = false;
        bVar7 = (pbVar11->flags & 1);
        if ((pbVar11->flags & 0x100)) {
          NormalizeTri(&pbVar11->normal,pbVar11->vertexpointers[0],pbVar11->vertexpointers[1],
                       pbVar11->vertexpointers[2]);
        }
        fVar15 = collider->radius;
        fVar14 = collider->envProps->colA->unk8 + pbVar11->envProperty->colA->unk8;
        if ((pbVar11->flags & 0x2000)) {
          fVar14 = 0.0;
        }
        bVar6 = FUN_800aea44(&collider->pos,&collider->vel,fVar15 + fVar14,pbVar11,&fStack96.x,&fStack160);
        A = &collider->pos;
        vel = &collider->vel;
        if (bVar6) {
          if ((0.0 < fVar14) && (-fStack96.x < fVar14)) {
            CRASH("physics.cpp","Floater");
          }
          if (bVar7) {
            if ((sVar12) && ((collider->envProps->colA->flag & 1))) {
              PerformCallback(1,collider,pbVar11);
            }
          }
          else {
            B = &pbVar11->normal;
            fStack96.x = fStack96.x + fVar14;
            collision_velocity_func(vel,B);
            vec3A_plusBMulC(A,B,-fStack96.x);
            bVar7 = FUN_800af578(collider,pbVar11->envProperty,B);
            (collider->unk2c).x = fStack160.x;
            (collider->unk2c).y = fStack160.y;
            (collider->unk2c).z = fStack160.z;
            (collider->polyNormal).x = (pbVar11->normal).x;
            (collider->polyNormal).y = (pbVar11->normal).y;
            (collider->polyNormal).z = (pbVar11->normal).z;
            if ((bVar7) && ((collider->envProps->colA->flag & 1))) {
              PerformCallback(1,collider,pbVar11);
            }
            sVar12 = 1;
          }
          bVar3 = true;
LAB_800afe60:
          if (bVar3) {
LAB_800afe6c:
            if ((pbVar11->flags & 2)){
              collider->envProps->Speed = pbVar11->envProperty->Speed;
            }
            if ((pbVar11->flags & 0x1000)) {
              PerformCallback(8,collider,pbVar11);
            }
          }
        }
        else if (!bVar7) {
          fVar15 = fStack96.x - fVar15;
          if (fVar15 <= 0.0) {
            fVar15 = -fVar15;
          }
          if ((double)fVar15 < dVar4) {
            if (collider->unk1e) {
              sVar12 = 1;
            }
          }
          if ((pbVar11->flags & 0x1c)) {
            fVar15 = collider->radius;
            iVar8 = 0;
            do {
              if (iVar8 == 1) {
                fStack96.y = (float)(pbVar11->flags & 0x10);
              }
              else if (iVar8 < 2) {
                if (iVar8) {
LAB_800afb44:
                  CRASH("CollideCollisionSphereWithVoxelPolys","Unknown Edge");
                }
                fStack96.y = (float)(pbVar11->flags & 4);
              }
              else {
                if (iVar8 != 2) goto LAB_800afb44;
                fStack96.y = (float)(pbVar11->flags & 8);
              }
              if (fStack96.y) {
                if (FUN_800aede8(collider,fVar15,pbVar11->vertexpointers[iVar8],pbVar11->vertexpointers[(iVar8 + 1) % 3],&fStack96,&fStack224)) {
                  collision_velocity_func(vel,&fStack224);
                  vec3A_plusBMulC(A,&fStack224,fStack96.x - collider->radius);
                  bVar7 = FUN_800af578(collider,pbVar11->envProperty,&fStack224);
                  (collider->unk2c).x = fStack160.x;
                  (collider->unk2c).y = fStack160.y;
                  (collider->unk2c).z = fStack160.z;
                  (collider->polyNormal).x = fStack224.x;
                  (collider->polyNormal).y = fStack224.y;
                  (collider->polyNormal).z = fStack224.z;
                  if ((bVar7) && ((collider->envProps->colA->flag & 1))) {
                    PerformCallback(1,collider,pbVar11);
                  }
                  sVar12 = 1;
                  bVar3 = true;
                  break;
                }
                fVar14 = fStack96.x - fVar15;
                if (fVar14 <= 0.0) {
                  fVar14 = -fVar14;
                }
                if (((double)fVar14 < dVar4) && (collider->unk1e)) {
                  sVar12 = 1;
                }
              }
              iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
            } while (iVar8 < 3);
          }
          if (!bVar3) {
            if ((pbVar11->flags & 0xe0)) {
              fVar15 = collider->radius;
              iVar9 = 0;
              iVar8 = 0x10000;
              pbVar10 = pbVar11;
              do {
                if (iVar9 == 1) {
                  fStack96.z = (float)(pbVar11->flags & 0x40);
                }
                else if (iVar9 < 2) {
                  if (iVar9) {
LAB_800afd30:
                    CRASH("CollideCollisionSphereWithVoxelPolys","Unknown Vertex");
                  }
                  fStack96.z = (float)(pbVar11->flags & 0x20);
                }
                else {
                  if (iVar9 != 2) goto LAB_800afd30;
                  fStack96.z = (float)(pbVar11->flags & 0x80);
                }
                if (fStack96.z) {
                  if (FUN_800af050(collider,fVar15,pbVar10->vertexpointers[0],0,&fStack96,&fStack224,&fStack160)) {
                    collision_velocity_func(vel,&fStack224);
                    vec3A_plusBMulC(A,&fStack224,fStack96.x - fVar15);
                    bVar7 = FUN_800af578(collider,pbVar11->envProperty,&fStack224);
                    (collider->unk2c).x = fStack160.x;
                    (collider->unk2c).y = fStack160.y;
                    (collider->unk2c).z = fStack160.z;
                    (collider->polyNormal).x = (pbVar11->normal).x;
                    (collider->polyNormal).y = (pbVar11->normal).y;
                    (collider->polyNormal).z = (pbVar11->normal).z;
                    if ((bVar7) && ((collider->envProps->colA->flag & 1))) {
                      PerformCallback(1,collider,pbVar11);
                    }
                    sVar12 = 1;
                    bVar3 = true;
                    break;
                  }
                  fVar14 = fStack96.x - fVar15;
                  if (fVar14 <= 0.0) {
                    fVar14 = -fVar14;
                  }
                  if (((double)fVar14 < dVar4) && (collider->unk1e)) {
                    sVar12 = 1;
                  }
                }
                iVar9 = iVar8 >> 0x10;
                pbVar10 = (borg9_phys *)(pbVar10->vertexpointers + 1);
                iVar8 = iVar8 + 0x10000;
              } while (iVar9 < 3);
            }
            goto LAB_800afe60;
          }
          goto LAB_800afe6c;
        }
      }
      iVar13 = (int)(short)((short)iVar13 + 1);
    } while (iVar13 < (int)(uint)(ushort)param_2->collideCount);
  }
  sVar5 = collider->unk1e;
  if (sVar12) {
    if ((collider->unk1e) && ((collider->envProps->colA->flag & 2))) {
      PerformCallback(2,collider,NULL);
    }
    if (sVar12) goto LAB_800aff30;
  }
  if ((collider->unk1e) && ((collider->envProps->colA->flag & 4))) {
    PerformCallback(4,collider,NULL);
  }
LAB_800aff30:
  collider->unk1e+= sVar12;
  return sVar12;
}

bool Ofunc_800aff7c(collisionSphere *param_1,collisionSphere *param_2){
  bool bVar2;
  vec3f afStack152;
  vec3f avStack_58;
  float afStack_18;
  
  bVar2 = false;
  if (((FUN_800af050(param_1,param_1->radius,&param_2->pos,param_2->radius,&afStack_18,&afStack152,&avStack_58)) && (bVar2 = true, (param_1->flags & 1) == 0)) &&
     (bVar2 = true, (param_2->flags & 1) == 0)) {
    collision_velocity_func(&param_1->vel,&afStack152);
    vec3A_plusBMulC(&param_1->pos,&afStack152,afStack_18 - param_1->radius);
    FUN_800af578(param_1,param_2->envProps,&afStack152);
    bVar2 = true;
  }
  return bVar2;
}

bool FUN_800b003c(collisionSphere *param_1,float param_2,collisionSphere *param_3,float param_4,float *param_5){
  bool bVar1;
  vec3f afStack176;
  vec3f avStack_70;
  float afStack_30;
  
  if (FUN_800af120(param_1,param_1->radius * param_2,&param_3->pos,param_3->radius * param_4,&afStack_30,&afStack176,&avStack_70)) {
    if ((param_1->flags & 1)) return true;
    if ((param_3->flags & 1)) return true;
    collision_velocity_func(&param_1->vel,&afStack176);
    vec3A_plusBMulC(&param_1->pos,&afStack176,afStack_30 - param_1->radius * param_2);
    FUN_800af578(param_1,param_3->envProps,&afStack176);
    afStack_30 += param_3->radius * param_4;
    bVar1 = true;
  }
  else {
    afStack_30 += param_3->radius * param_2;
    bVar1 = false;
  }
  *param_5 = afStack_30;
  return bVar1;
}
