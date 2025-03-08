#include "Camera.h"
#include "stringN64.h"
#include "crash.h"

void camera_set_position(Camera_struct *CAM,vec3f *arg1){
  copyVec3(arg1,&CAM->pos);
  copyVec3(arg1,&CAM->posTarget);
}

void camera_set_aim(Camera_struct *CAM,vec3f *arg1){
  copyVec3(arg1,&CAM->aim);
  copyVec3(arg1,&CAM->aimTarget);
}

void camera_init(Camera_struct *param_1,Borg9data *map,vec3f *pos,u16 mode){
  CLEAR(param_1);
  param_1->unk7c = 1;
  param_1->unk7e = 3;
  param_1->unk80 = 0;
  (param_1->aim).z = 0.0;
  (param_1->aim).y = 0.0;
  (param_1->aim).x = 0.0;
  (param_1->aimTarget).x = 0.0;
  (param_1->aimTarget).y = 0.0;
  (param_1->aimTarget).z = 0.0;
  (param_1->unk70).x = 0.0;
  (param_1->unk70).y = 0.0;
  (param_1->unk70).z = 0.0;
  camera_set_position(param_1,pos);
  (param_1->rotationXZ).y = 0.0;
  (param_1->rotation).z = 0.0;
  (param_1->rotation).y = 0.0;
  param_1->unk50 = 0.0;
  param_1->unk82 = 1;
  param_1->unk84 = 0;
  param_1->camera_mode_prev = mode;
  param_1->camera_mode = mode;
  param_1->borg_9 = map;
  (param_1->rotationXZ).x = 1;
  (param_1->rotation).x = 1;
  param_1->unk5c = 5;
  param_1->unk60 = 5;
  param_1->camHeight = 1.05f;
  param_1->unk64 = 3.0f;
  param_1->unk4c = 15.0f;
  param_1->unk48 = 15.0f;
  param_1->unk54 = 45.0f;
  init_collisionTypeA(&param_1->colTypeA);
  set_CollisionTypeB(&param_1->colTypeB);
}

void camera_orient(Camera_struct *param_1){
  Vec3_sub(&param_1->rotation,&param_1->aim,&param_1->pos);
  setVec2(&param_1->rotationXZ,(param_1->rotation).x,(param_1->rotation).z);
  vec3_normalize(&param_1->rotation);
  vec2_normalize(&param_1->rotationXZ);
}
 
void camera_lerp(vec3f *arg,vec3f *target,float f){
  arg->x = arg->x - (arg->x - target->x) / f;
  arg->y = arg->y - (arg->y - target->y) / f;
  arg->z = arg->z - (arg->z - target->z) / f;
}

void camera_adjustAim(vec3f *aim0,vec3f *aim1,float arg2,s16 arg3,float arg4){
  float x;
  vec3f v3temp;
  
  if (0 < arg3) {
    for(s16 i=0;i<arg3;i++) {
      Vec3_sub(&v3temp,aim0,aim1);
      multiVec3(&v3temp,(float)(1.0 / (double)arg2));
      x = vec3_normalize(&v3temp);
      if (arg4 < x) x = arg4;
      multiVec3(&v3temp,x);
      Vec3_sub(aim0,aim0,&v3temp);
    }
  }
}

void set_camera_0x70(Camera_struct *CAM,vec3f *arg1){
  CAM->unk70.x = (*arg1).x;
  CAM->unk70.y = (*arg1).y + CAM->camHeight;
  CAM->unk7c = 0;
  CAM->unk70.z = (*arg1).z;
}

void FUN_800b04ec(Camera_struct *CAM){
  CAM->unk80 = 0;
  if (CAM->unk82) {
    CAM->unk58 = 0;
    CAM->unk48 = CAM->unk4c;
  }
}


void FUN_800b050c(Camera_struct *param_1,vec3f *param_2){
  
  if (param_1->unk48 < param_1->unk50) param_1->unk48 = param_1->unk50;
  if (param_1->unk54 < param_1->unk48) param_1->unk48 = param_1->unk54;
  param_2->x = (param_1->aim).x - (param_1->rotationXZ).x * param_1->unk5c;
  param_2->y = (param_1->aim).y + __sinf((180.0f - param_1->unk48) * dtor) * param_1->unk5c;
  param_2->z = (param_1->aim).z - (param_1->rotationXZ).y * param_1->unk5c;
}

void FUN_800b05d0(Camera_struct *CAM,vec3f *Arg1,vec3f *Arg2){
  float sine = __sinf(CAM->unk58 * dtor);
  float cosine = __cosf(CAM->unk58 * dtor);
  float fVar3 = cosine * (*Arg2).x + sine * (*Arg2).z;
  (*Arg1).x = fVar3;
  (*Arg1).z = cosine * (*Arg2).z - sine * (*Arg2).x;
  (*Arg1).x = CAM->aim.x + fVar3 * CAM->unk5c;
  (*Arg1).y = CAM->aim.y + __sinf((180.0f - CAM->unk48) * dtor) * CAM->unk5c;
  (*Arg1).z = CAM->aim.z + (*Arg1).z * CAM->unk5c;}

void ProcessGameCamera_mode1(Camera_struct *CAM,vec3f *arg1,vec3f *arg2,s16 arg3,float arg4,
               float arg5,s32 arg6,s32 arg7,float arg8,float arg9,
               float arg10,float arg11,float arg12,float arg13,s16 arg14,
               s16 arg15){
  s32 iVar2;
  vec3f *aim1;
  float fVar3;
  vec2f fStack656;
  vec2f afStack592;
  vec2f fStack528;
  vec3f fStack464;
  vec3f afStack400;
  vec3f fStack336;
  vec3f fStack272;
  vec3f afStack208;
  vec3f afStack144;
  
  fStack336 = CAM->pos;
  copyVec3(arg1,&CAM->aimTarget);
  CAM->aimTarget.y+= CAM->camHeight;
  camera_adjustAim(&CAM->aim,&CAM->aimTarget,arg10,arg3,arg12);
  if (CAM->holdCamera == 0) {
    if (arg15 != 0) CAM->posTarget.y = CAM->aimTarget.y + arg8;
    aim1 = &CAM->posTarget;
    camera_adjustAim(&CAM->pos,aim1,arg11,arg3,arg13);
    setVec2(&fStack656,CAM->aimTarget.x,CAM->aimTarget.z);
    setVec2(&afStack592,CAM->posTarget.x,CAM->posTarget.z);
    Vec2_Sub(&fStack528,&afStack592,&fStack656);
    fVar3 = vec2_normalize(&fStack528);
    if (arg15 != 0) {
      if (fVar3 < arg4) setVec3(aim1,fStack656.x + arg4 * fStack528.x,CAM->posTarget.y,fStack656.y + arg4 * fStack528.y);
      if (arg5 < fVar3) setVec3(aim1,fStack656.x + arg5 * fStack528.x,CAM->posTarget.y,fStack656.y + arg5 * fStack528.y);      
    }

    Vec3_sub(&fStack272,&CAM->pos,&CAM->aim);
    fStack272.y = 0.0;
    if (vec3_normalize(&fStack272) < arg4) {
      CAM->pos.x = CAM->aim.x + fStack272.x * arg4;
      CAM->pos.z = CAM->aim.z + fStack272.z * arg4;
    }
    if (CheckCollision(CAM->borg_9,&fStack336,&CAM->pos,0.25f,&fStack464,&afStack400,1)) {
      multiVec3(&afStack400,0.25f);
      vec3_sum(&fStack464,&fStack464,&afStack400);
      CAM->pos = fStack464;
    }
    if (arg14 != 0) {
      Vec3_sub(&CAM->pos,&CAM->pos,&CAM->aim);
      Vec3_sub(aim1,aim1,&CAM->aim);
      FUN_800ab23c(&CAM->pos,aim1,(float)(s32)arg3 * dtor);
      vec3_sum(&CAM->pos,&CAM->pos,&CAM->aim);
      vec3_sum(aim1,aim1,&CAM->aim);
    }
    if ((CAM->unk84 != 0) &&
       (iVar2 = (u32)(u16)CAM->unk84 - (s32)arg3, CAM->unk84 = (s16)iVar2
       , iVar2 * 0x10000 < 0)) {
      CAM->unk84 = 0;
    }
    if ((((arg15 != 0) && (CAM->unk84 == 0)) &&
        (vec3_proximity(&CAM->pos,aim1) < 1.0f)) &&
       (CheckCollision(CAM->borg_9,&CAM->aim,aim1,0.25f,NULL,NULL,1))) {
      CAM->unk84 = 300;
      setVec2(&fStack528,arg2->x,arg2->z);
      vec2_normalize(&fStack528);
      setVec3(&afStack208,fStack656.x + arg9 * fStack528.x,CAM->posTarget.y,
              fStack656.y + arg9 * fStack528.y);
      if (CheckCollision(CAM->borg_9,&CAM->aim,&afStack208,fVar3,&afStack144,NULL,1))
        copyVec3(&afStack144,aim1);
      else copyVec3(&afStack208,aim1);
    }
    camera_orient(CAM);
  }
  else FUN_800b0fac(CAM,arg2,arg3,arg9,arg6,arg7);
}


void ProcessGameCamera_mode0(Camera_struct *param_1,vec3f *param_2,vec3f *param_3,short param_4,short param_5){
  short sVar1;
  int iVar2;
  u16 uVar3;
  bool bVar4;
  vec3f *A;
  vec3f *aim0;
  float fVar5;
  float fVar6;
  float fVar7;
  vec3f afStack240;
  vec3f fStack176;
  vec3f fStack112;
  
  fStack112.x = (param_1->pos).x;
  fStack112.y = (param_1->pos).y;
  fStack112.z = (param_1->pos).z;
  if (param_1->unk68) {
    iVar2 = (uint)(u16)param_1->unk68 - (int)param_4;
    param_1->unk68 = (short)iVar2;
    if (0 < iVar2 * 0x10000) {
      goto LAB_800b0be4;
    }
    param_1->unk68 = 0;
    param_1->unk5c = param_1->unk60;
  }
LAB_800b0be4:
  if (param_1->holdCamera == 0) {
    aim0 = &param_1->aim;
    (param_1->aimTarget).x = param_2->x;
    (param_1->aimTarget).y = param_2->y + param_1->camHeight;
    (param_1->aimTarget).z = param_2->z;
    camera_adjustAim(aim0,&param_1->aimTarget,12.0,param_4,5.0f);
    Vec3_sub(&fStack176,&param_1->aimTarget,&param_1->unk70);
    fVar5 = vec3Length(&fStack176);
    if (param_1->unk7e < fVar5) {
      param_1->unk7c = 1;
    }
    if (0.25 < fVar5) {
      FUN_800b04ec(param_1);
      param_1->unk7c = 0;
    }
    camera_orient(param_1);
    A = &param_1->posTarget;
    FUN_800b050c(param_1,A);
    FUN_800b05d0(param_1,&afStack240,param_3);
    if (param_1->unk7c == 0) {
      fVar5 = ((param_1->unk7e - fVar5) / param_1->unk7e) *
              128.0f + 16.0f;
      if (fVar5 < 16.0f) {
        fVar5 = 16.0f;
      }
      uVar3 = param_1->unk80;
    }
    else {
      uVar3 = param_1->unk80;
      fVar5 = 16.0f;
    }
    if (((uVar3 != 0) &&
        (fVar6 = vec3_proximity(A,&afStack240), fVar5 = 5.0f,
        fVar6 < 0.5)) &&
       (uVar3 = param_1->unk80 - 1, param_1->unk80 = uVar3, (int)((uint)uVar3 << 0x10) < 1)) {
      FUN_800b04ec(param_1);
    }
    fVar6 = 5.0f;
    camera_adjustAim(A,&afStack240,fVar5,param_4,5.0f);
    Vec3_sub(&fStack176,&param_1->pos,aim0);
    fStack176.y = 0.0;
    fVar5 = vec3_normalize(&fStack176);
    fVar7 = param_1->unk64;
    if (fVar5 < fVar7) {
      fVar5 = (param_1->aim).z;
      (param_1->pos).x = (param_1->aim).x + fStack176.x * fVar7;
      (param_1->pos).z = fVar5 + fStack176.z * fVar7;
    }
    if (false) {//?
      Vec3_sub(&param_1->pos,&param_1->pos,aim0);
      Vec3_sub(A,A,aim0);
      FUN_800ab23c(&param_1->pos,A,(float)(int)param_4 * 0.0);//?
      vec3_sum(&param_1->pos,&param_1->pos,aim0);
      vec3_sum(A,A,aim0);
    }
    camera_adjustAim(&param_1->pos,A,16.0,param_4,fVar6);
    if (((short)param_1->unk80 < 2) && (param_5 != 0)) {
      bVar4 = CheckCollision(param_1->borg_9,&param_1->pos,aim0,0.25,NULL,NULL,0);
      if (bVar4) {
        param_1->unk82 = 0;
      }
      else {
        param_1->unk82 = 1;
      }
    }
    if (((CheckCollision(param_1->borg_9,&fStack112,&param_1->pos,0.25,NULL,NULL,1)) && (param_1->unk80 == 1)) 
       && (param_1->unk82 != 0)) {
      FUN_800b04ec(param_1);
    }
    camera_orient(param_1);
  }
  else {
    if (param_1->holdCamera != 2) param_1->unk48 = 0.0;
    copyVec3(param_2,&param_1->aimTarget);
    fVar5 = 0.25f;
    (param_1->aimTarget).y = (param_1->aimTarget).y + param_1->camHeight;
    camera_adjustAim(&param_1->aim,&param_1->aimTarget,16.0,param_4,fVar5);
    FUN_800b0fac(param_1,param_3,param_4,param_1->unk5c,0,5.0f);
  }
}




void FUN_800b0fac(Camera_struct *CAM,vec3f* param_2,short param_3,float param_4,float param_5,float param_6){
  float fVar4;
  double dVar3;
  float fVar5;
  float fVar6;
  vec3f fStack504;
  vec2f fStack440;
  vec2f afStack376;
  vec3f afStack312;
  vec3f afStack248;
  vec2f fStack184;
  vec2f afStack120;
  
  if (CAM->holdCamera == 1) {
    CAM->holdCamera = 2;
    (CAM->posTarget).x = (CAM->pos).x;
    (CAM->posTarget).y = (CAM->pos).y;
    (CAM->posTarget).z = (CAM->pos).z;
  }
  if (CAM->holdCamera == 3) {
    CAM->holdCamera = 0;
    (CAM->posTarget).x = (CAM->pos).x;
    (CAM->posTarget).y = (CAM->pos).y;
    (CAM->posTarget).z = (CAM->pos).z;
  }
  Vec3_sub(&fStack504,&CAM->pos,&CAM->aim);
  fStack504.y = 0.0;
  fVar4 = vec3_normalize(&fStack504);
  for(u16 i=0;i<param_3;i++){
      fVar4 = (fVar4 - (fVar4 - param_4) * (1.0/32));
    }
  Vec3_sub(&fStack504,&CAM->posTarget,&CAM->aim);
  setVec2(&fStack184,fStack504.x,fStack504.z);
  vec2_normalize(&fStack184);
  RotVec2(&fStack184,CAM->unk58);
  multiVec2(&fStack184,fVar4);
  setVec3(&CAM->pos,fStack184.x + (CAM->aim).x,(CAM->posTarget).y,fStack184.y + (CAM->aim).z);
  if (CheckCollision(CAM->borg_9,&CAM->aim,&CAM->pos,0.25,&afStack312,&afStack248,1)) {
    multiVec3(&afStack248,-0.25);
    vec3_sum(&afStack312,&afStack312,&afStack248);
    Vec3_sub(&fStack504,&afStack312,&CAM->aim);
    setVec2(&afStack120,fStack504.x,fStack504.z);
    dVar3 = (double)(fVar4 - vec2Length(&afStack120)) * (1.0/8);
    vec2_normalize(&fStack184);
    multiVec2(&fStack184,(fVar4 - dVar3));
    setVec3(&CAM->pos,fStack184.x + (CAM->aim).x,(CAM->posTarget).y,fStack184.y + (CAM->aim).z);
  }
  setVec2(&fStack440,(CAM->aim).x,(CAM->aim).z);
  setVec2(&afStack376,(CAM->pos).x,(CAM->pos).z);
  Vec2_Sub(&fStack184,&afStack376,&fStack440);
  if (vec2_normalize(&fStack184) < 0.5) {
    setVec3(&CAM->pos,fStack440.x + fStack184.x * .5,
         (CAM->pos).y,fStack440.y + fStack184.y * .5);
  }
  fVar5 = (CAM->pos).y + CAM->unk48 /10.0f;
  fVar6 = (CAM->aim).y + param_5;
  (CAM->pos).y = fVar5;
  if (fVar5 < fVar6) {
    (CAM->pos).y = fVar6;
    CAM->unk48 = (fVar6 - (CAM->posTarget).y) * 10.0f;
  }
  fVar5 = (CAM->aim).y + param_6;
  if (fVar5 < (CAM->pos).y) {
    (CAM->pos).y = fVar5;
    CAM->unk48 = (fVar5 - (CAM->posTarget).y) * 10.0f;
  }
  camera_orient(CAM);
}

void NOOP_800b134c(Camera_struct *c){}

void set_camera_mode(Camera_struct *cam,u16 mode){
  if (cam->camera_mode != mode) {
    cam->camera_mode_prev = cam->camera_mode;
    cam->camera_mode = mode;
  }
}

void revert_camera_mode(Camera_struct *c){c->camera_mode = c->camera_mode_prev;}

void ProcessGameCamera(Camera_struct *cam,vec3f *param_2,vec3f* param_3,s16 param_4,
                      u16 param_5){

  char buff [72];
  
  switch (cam->camera_mode){
  case 0:
    ProcessGameCamera_mode0(cam,param_2,param_3,param_4,param_5);
    break;
  case 1:
    ProcessGameCamera_mode1(cam,param_2,param_3,param_4,2.0f,4.0f,0.5f,
                            2.5f,1.5f,3.0f,16.0f,32.0f,0.25f,0.1f,1,1);
    break;
  case 2:
    NOOP_800b134c(cam);
    revert_camera_mode(cam);
    break;
  case 3: return;
  default:
  #ifdef DEBUGVER
    sprintf(buff,"Unknown Mode: %d",(u32)cam->camera_mode);
    CRASH("ProcessGameCamera",buff);
    #else
    CRASH("ProcessGameCamera",buff);
    #endif
  }
}

void some_camera_func(vec3f *param_1,vec2f *param_2,vec3f **var_c,s16 numFoci,float param_5){
  s32 iVar1;
  s32 iVar2;
  vec3f **ppafVar3;
  s32 iVar4;
  s32 iVar6;
  float fVar7;
  ulonglong uVar8;
  ulonglong uVar9;
  ulonglong uVar10;
  vec3f v3Temp;
  float fVar11;
  
  
  if (numFoci < 2) CRASH("../src/camera.cpp","numFoci < 2");
    fVar11 = (param_5 - 8.0f) * 0.5f;
    if ((s32)(fVar11 * 100.0f) == ((s32)(fVar11 * 100.0f) / 9000) * 9000)fVar11 += 1.0f;
    uVar10 = fVar11;
    setVec3(&v3Temp,0.0,0.0,0.0);
    fVar11 = (float)numFoci;
    uVar8 = fVar11;
    iVar4 = 0x10000;
    ppafVar3 = var_c;
    if (0 < numFoci) {
      for(s16 i=0;i<numFoci;i++) {
        vec3_sum(&v3Temp,&v3Temp,var_c[i]);
        fVar11 = (float)uVar8;
      }
    }
    iVar1 = 0;
    iVar2 = 0;
    uVar8 = 0;
    iVar4 = 0;
    multiVec3(&v3Temp,(float)(1.0 / fVar11));
    fVar11 = (float)uVar10;
    uVar9 = uVar8 & 0xffffffff;
    if (0 < numFoci) {
      iVar6 = 0x10000;
      ppafVar3 = var_c;
      do {
        fVar7 = vec3_proximity(&v3Temp,*ppafVar3);
        fVar11 = (float)uVar10;
        if ((float)uVar8 < fVar7) {
          uVar9 = uVar8 & 0xffffffff;
          uVar8 = fVar7;
          iVar4 = iVar1;
          iVar1 = iVar2;
        }
        else {
          if ((float)uVar9 < fVar7) {
            uVar9 = fVar7;
            iVar4 = iVar2;
          }
        }
        iVar2 = iVar6 >> 0x10;
        ppafVar3++;
        iVar6 = iVar6 + 0x10000;
      } while (iVar2 < numFoci);
    }
    ppafVar3 = var_c + iVar1;
    vec3_sum(param_1,*ppafVar3,var_c[iVar4]);
    multiVec3(param_1,0.5);
    Vec3_sub(&v3Temp,param_1,*ppafVar3);
    if (0.0 < v3Temp.z) v3Temp.z = -v3Temp.z;
    (*param_2).x = v3Temp.z;
    if (v3Temp.x <= 0.0) v3Temp.x = -v3Temp.x;
    (*param_2).y = v3Temp.x;
    vec2_normalize(param_2);
    vec3_proximity(param_1,*ppafVar3);
    fVar11 *= dtor;
    __sinf(fVar11);
    __cosf(fVar11);
}

