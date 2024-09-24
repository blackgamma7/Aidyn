

void camera_set_position(Camera_struct *CAM,vec3f *arg1){
  copyVec3(arg1,CAM->coord);
  copyVec3(arg1,CAM->coord_mirror);
}

void camera_set_aim(Camera_struct *CAM,vec3f *arg1){
  copyVec3(arg1,CAM->aim);
  copyVec3(arg1,CAM->aim_mirror);
}

void camera_init(Camera_struct *CAM,Borg_9_data *map,vec3f *pos,u16 mode){
  memset(CAM,0,sizeof(Camera_struct);
  CAM->unk0x7c = 1;
  CAM->unk0x7e = 3;
  CAM->unk0x80 = 0;
  CAM->aim = {0.0,0.0,0.0};
  CAM->aim_mirror = {0.0,0.0,0.0};
  CAM->unk0x70 = {0.0,0.0,0.0};
  camera_set_position(CAM,pos);
  CAM->XZ_orient[1] = 0.0;
  CAM->rotation[2] = 0.0;
  CAM->rotation[1] = 0.0;
  CAM->unk0x50 = 0.0;
  CAM->unk0x82 = 1;
  CAM->unk0x84 = 0;
  CAM->camera_mode_prev = mode;
  CAM->camera_mode = mode;
  CAM->borg_9 = map;
  CAM->XZ_orient[0] = 1.0;
  CAM->rotation[0] = 1.0;
  CAM->unk0x5c = 5.0;
  CAM->unk0x60 = 5.0;
  CAM->camHeight = 1.05;
  CAM->unk0x64 = 3.0;
  CAM->unk0x4c = 15.0;
  CAM->float0x48 = 15.0;
  CAM->unk0x54 = 45.0;
  init_unkstruck_42(&CAM->substruct);
  set_vec7(&CAM->vec7);
}

void camera_orient(Camera_struct *arg0){
  Vec3_sub(arg0->rotation,arg0->aim,arg0);
  setVec2(arg0->XZ_orient,arg0->rotation[0],arg0->rotation[2]);
  vec3_normalize(arg0->rotation);
  vec2_normalize(arg0->XZ_orient);
}
 
void camera_lerp(vec3f *arg,vec3f *mirror,float f){
  (*arg)[0] -= ((*arg)[0] - (*mirror)[0]) / f;
  (*arg)[1] -= ((*arg)[1] - (*mirror)[1]) / f;
  (*arg)[2] -= ((*arg)[2] - (*mirror)[2]) / f;
}

void adust_camera_aim(vec3f *aim0,vec3f *aim1,float arg2,s16 arg3,float arg4){
  s32 iVar1;
  s32 iVar2;
  float x;
  vec3f v3temp;
  
  if (0 < arg3) {
    iVar2 = 0x10000;
    do {
      iVar1 = iVar2 >> 0x10;
      Vec3_sub(v3temp,aim0,aim1);
      multiVec3(v3temp,(float)(1.0d / (double)arg2));
      x = vec3_normalize(v3temp);
      if ((arg4 < x) {x = arg4;}
      multiVec3(v3temp,x);
      Vec3_sub(aim0,aim0,v3temp);
      iVar2 = iVar2 + 0x10000;
    } while (iVar1 < arg3);
  }
}

void set_camera_0x70(Camera_struct *arg0,vec3f *arg1){
  arg0->unk0x70[0] = (*arg1)[0];
  arg0->unk0x70[1] = (*arg1)[1] + arg0->camHeight;
  arg0->unk0x7c = 0;
  arg0->unk0x70[2] = (*arg1)[2];
}

void func_800b04ec(Camera_struct *arg0){
  arg0->unk0x80 = 0;
  if (arg0->unk0x82 != 0) {
    arg0->unk0x58 = 0;
    arg0->float0x48 = arg0->unk0x4c;
  }
}

void func_800b050c(Camera_struct *arg0,vec3f *arg1){
  if (arg0->float0x48 < arg0->unk0x50) {arg0->float0x48 = arg0->unk0x50;}
  if (arg0->unk0x54 < arg0->float0x48) {arg0->float0x48 = arg0->unk0x54;}
  (*arg1)[0] = arg0->aim[0] - arg0->XZ_orient[0] * arg0->unk0x5c;
  (*arg1)[1] = arg0->aim[1] + __sinf((180.0f - arg0->float0x48) * dtor) * arg0->unk0x5c;
  (*arg1)[2] = arg0->aim[2] - arg0->XZ_orient[1] * arg0->unk0x5c;
}

void func_800b05d0(Camera_struct *CAM,vec3f *Arg1,vec3f *Arg2){
  float fVar1 = __sinf((float)CAM->unk0x58 * dtor);
  float fVar2 = __cosf((float)CAM->unk0x58 * dtor);
  float fVar3 = fVar2 * (*Arg2)[0] + fVar1 * (*Arg2)[2];
  (*Arg1)[0] = fVar3;
  (*Arg1)[2] = fVar2 * (*Arg2)[2] - fVar1 * (*Arg2)[0];
  (*Arg1)[0] = CAM->aim[0] + fVar3 * CAM->unk0x5c;
  (*Arg1)[1] = CAM->aim[1] + __sinf((180.0f - CAM->float0x48) * dtor) * CAM->unk0x5c;
  (*Arg1)[2] = CAM->aim[2] + (*Arg1)[2] * CAM->unk0x5c;}

void ProcessGameCamera_mode1(Camera_struct *arg0,vec3f *arg1,float *arg2,s16 arg3,float arg4,
               float arg5,s32 arg6,s32 arg7,float arg8,float arg9,
               float arg10,float arg11,float arg12,float arg13,s16 arg14,
               s16 arg15){
  s32 iVar2;
  vec3f *c;
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
  
  fStack336 = arg0->coord;
  copyVec3(arg1,arg0->aim_mirror);
  arg0->aim_mirror[1]+= arg0->camHeight;
  adust_camera_aim(arg0->aim,arg0->aim_mirror,arg10,arg3,arg12);
  if (arg0->holdCamera == 0) {
    if (arg15 != 0) {arg0->coord_mirror[1] = arg0->aim_mirror[1] + arg8;}
    aim1 = arg0->coord_mirror;
    adust_camera_aim(arg0,aim1,arg11,arg3,arg13);
    setVec2(fStack656,arg0->aim_mirror[0],arg0->aim_mirror[2]);
    setVec2(afStack592,arg0->coord_mirror[0],arg0->coord_mirror[2]);
    Vec2_Sub(fStack528,afStack592,fStack656);
    fVar3 = vec2_normalize(fStack528);
    if (arg15 != 0) {
      if (fVar3 < arg4) {setVec3(aim1,fStack656[0] + arg4 * fStack528[0],arg0->coord_mirror[1],fStack656[1] + arg4 * fStack528[1]);
      }
      if (arg5 < fVar3) {setVec3(aim1,fStack656[0] + arg5 * fStack528[0],arg0->coord_mirror[1],fStack656[1] + arg5 * fStack528[1]);
      }
    }
    c = arg0->aim;
    Vec3_sub(fStack272,arg0,c);
    fStack272[1] = 0.0;
    if (vec3_normalize(fStack272) < arg4) {
      arg0->coord[0] = arg0->aim[0] + fStack272[0] * arg4;
      arg0->coord[2] = arg0->aim[2] + fStack272[2] * arg4;
    }
    if (func_800adf78(arg0->borg_9,fStack336,arg0,0.25f,fStack464,afStack400,1)) {
      multiVec3(afStack400,0.25f);
      vec3_sum(fStack464,fStack464,afStack400);
      arg0->coord = fStack464;
    }
    if (arg14 != 0) {
      Vec3_sub(arg0,arg0,c);
      Vec3_sub(aim1,aim1,c);
      func_800ab23c(arg0,aim1,(float)(s32)arg3 * dtor);
      vec3_sum(arg0,arg0,c);
      vec3_sum(aim1,aim1,c);
    }
    if ((arg0->unk0x84 != 0) &&
       (iVar2 = (u32)(u16)arg0->unk0x84 - (s32)arg3, arg0->unk0x84 = (s16)iVar2
       , iVar2 * 0x10000 < 0)) {
      arg0->unk0x84 = 0;
    }
    if ((((arg15 != 0) && (arg0->unk0x84 == 0)) &&
        (get_vec3_proximity(arg0,aim1) < 1.0f)) &&
       (func_800adf78(arg0->borg_9,c,aim1,0.25f,NULL,NULL,1))) {
      arg0->unk0x84 = 300;
      setVec2(fStack528,*arg2,arg2[2]);
      vec2_normalize(fStack528);
      setVec3(afStack208,fStack656[0] + arg9 * fStack528[0],arg0->coord_mirror[1],
              fStack656[1] + arg9 * fStack528[1]);
      if (func_800adf78(arg0->borg_9,c,afStack208,fVar3,afStack144,NULL,1)) copyVec3(afStack144,aim1);
      else copyVec3(afStack208,aim1);
    }
    camera_orient(arg0);
  }
  else func_800b0fac(arg0,arg2,arg3,arg9,arg6,arg7);
}

void ProcessGameCamera_mode0(Camera_struct *arg0,vec3f *arg1,vec3f *arg2,s16 arg3,s16 arg4){
  s16 sVar1;
  s32 iVar3;
  u16 uVar4;
  longlong lVar2;
  vec3f *aim0;
  vec3f *aim0_00;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  vec3f afStack240;
  vec3f fStack176;
  vec3f fStack112;
  
  fStack112 = arg0->coord;
  fVar8 = 0.0;
  if (arg0->unk0x68 != 0) {
    iVar3 = (u32)(u16)arg0->unk0x68 - (s32)arg3;
    arg0->unk0x68 = (s16)iVar3;
    if (0 < iVar3 * 0x10000) {
      sVar1 = arg0->holdCamera;
      goto LAB_800b0be4;
    }
    arg0->unk0x68 = 0;
    arg0->unk0x5c = arg0->unk0x60;
  }
  sVar1 = arg0->holdCamera;
LAB_800b0be4:
  if (sVar1 == 0) {
    aim0_00 = arg0->aim;
    arg0->aim_mirror[0] = (*arg1)[0];
    arg0->aim_mirror[1] = (*arg1)[1] + arg0->camHeight;
    arg0->aim_mirror[2] = (*arg1)[2];
    adust_camera_aim(aim0_00,arg0->aim_mirror,12.0,arg3,5.0f);
    Vec3_sub(fStack176,arg0->aim_mirror,arg0->unk0x70);
    fVar5 = vec3Length(fStack176);
    if ((float)(s32)(s16)arg0->unk0x7e < fVar5) {
      arg0->unk0x7c = 1;
    }
    if (0.25d < (double)fVar5) {
      func_800b04ec(arg0);
      arg0->unk0x7c = 0;
    }
    camera_orient(arg0);
    aim0 = arg0->coord_mirror;
    func_800b050c(arg0,aim0);
    func_800b05d0(arg0,afStack240,arg2);
    if (arg0->unk0x7c == 0) {
      fVar5 = (((float)(s32)(s16)arg0->unk0x7e - fVar5) /
              (float)(s32)(s16)arg0->unk0x7e) * 128.0f + 16.0f;
      if (fVar5 < 16.0f) {
        fVar5 = 16.0f;
      }
      uVar4 = arg0->unk0x80;
    }
    else {
      uVar4 = arg0->unk0x80;
      fVar5 = 16.0f;
    }
    if (((uVar4 != 0) &&
        (fVar6 = get_vec3_proximity(aim0,afStack240), fVar5 = 5.0f,
        (double)fVar6 < 0.5d)) &&
       (uVar4 = arg0->unk0x80 - 1, arg0->unk0x80 = uVar4, (s32)((u32)uVar4 << 0x10) < 1
       )) {
      func_800b04ec(arg0);
    }
    fVar6 = 5.0f;
    adust_camera_aim(aim0,afStack240,fVar5,arg3,5.0f);
    Vec3_sub(fStack176,arg0,aim0_00);
    fStack176[1] = 0.0;
    fVar5 = vec3_normalize(fStack176);
    fVar7 = arg0->unk0x64;
    if (fVar5 < fVar7) {
      fVar5 = arg0->aim[2];
      arg0->coord[0] = arg0->aim[0] + fStack176[0] * fVar7;
      arg0->coord[2] = fVar5 + fStack176[2] * fVar7;
    }
    if (0.0 < fVar8) {
      Vec3_sub(arg0,arg0,aim0_00);
      Vec3_sub(aim0,aim0,aim0_00);
      func_800ab23c(arg0,aim0,fVar8 * (float)(s32)arg3);
      vec3_sum(arg0,arg0,aim0_00);
      vec3_sum(aim0,aim0,aim0_00);
    }
    adust_camera_aim(arg0,aim0,16.0,arg3,fVar6);
    if (((s16)arg0->unk0x80 < 2) && (arg4 != 0)) {
      if (func_800adf78(arg0->borg_9,arg0,aim0_00,0.25,NULL,NULL,0)) {
        arg0->unk0x82 = 0;
      }
      else arg0->unk0x82 = 1;
    }
    if (((func_800adf78(arg0->borg_9,fStack112,arg0,0.25,NULL,NULL,1)) && (arg0->unk0x80 == 1)) && (arg0->unk0x82 != 0)) {
      func_800b04ec(arg0);
    }
    camera_orient(arg0);
  }
  else {
    if (sVar1 != 2) {
      arg0->float0x48 = 0.0;
    }
    copyVec3(arg1,arg0->aim_mirror);
    arg0->aim_mirror[1] += arg0->camHeight;
    adust_camera_aim(arg0->aim,arg0->aim_mirror,16.0,arg3,0.25f);
    func_800b0fac(arg0,arg2,arg3,arg0->unk0x5c,0,5.0f);
  }
}


void func_800b0fac(Camera_struct *CAM,s32 param_2,s16 param_3,float param_4,float param_5,
                 float param_6){
  bool bVar1;
  u32 uVar2;
  float fVar4;
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
    CAM->coord_mirror = CAM->coord;
  }
  if (CAM->holdCamera == 3) {
    CAM->holdCamera = 0;
    CAM->coord_mirror = CAM->coord;
  }
  Vec3_sub(fStack504,CAM,CAM->aim);
  fStack504[1] = 0.0;
  fVar4 = vec3_normalize(fStack504);
  if (0 < param_3) {
    for(uVar2=0;uVar<param_3;uVar2++) {
      fVar4 = (float)((double)fVar4 - (double)(fVar4 - param_4) * 0.03125d);
    }
  }
  Vec3_sub(fStack504,CAM->coord_mirror,CAM->aim);
  setVec2(fStack184,fStack504[0],fStack504[2]);
  vec2_normalize(fStack184);
  RotVec2(fStack184,(float)CAM->unk0x58);
  multiVec2(fStack184,fVar4);
  setVec3(CAM,fStack184[0] + CAM->aim[0],CAM->coord_mirror[1],fStack184[1] + CAM->aim[2]);

  if (func_800adf78(CAM->borg_9,CAM->aim,CAM,0.25,afStack312,afStack248,1)){
    multiVec3(afStack248,-0.25);
    vec3_sum(afStack312,afStack312,afStack248);
    Vec3_sub(fStack504,afStack312,CAM->aim);
    setVec2(afStack120,fStack504[0],fStack504[2]);
    fVar4 = (float)((double)fVar4 - (double)(fVar4 - vec2Length(afStack120)) * 0.125d);
    vec2_normalize(fStack184);
    multiVec2(fStack184,fVar4);
    setVec3(CAM,fStack184[0] + CAM->aim[0],CAM->coord_mirror[1],fStack184[1] + CAM->aim[2]);
  }
  setVec2(fStack440,CAM->aim[0],CAM->aim[2]);
  setVec2(afStack376,CAM->coord[0],CAM->coord[2]);
  Vec2_Sub(fStack184,afStack376,fStack440);
  if ((double)vec2_normalize(fStack184); < 0.5d) {
    setVec3(CAM,(float)((double)fStack440[0] + (double)fStack184[0] * 0.5d),
            CAM->coord[1],(float)((double)fStack440[1] + (double)fStack184[1] * 0.5d));
  }
  fVar5 = CAM->coord[1] + CAM->float0x48 / 10.0f;
  fVar6 = CAM->aim[1] + param_5;
  CAM->coord[1] = fVar5;
  if (fVar5 < fVar6) {
    CAM->coord[1] = fVar6;
    CAM->float0x48 = (fVar6 - CAM->coord_mirror[1]) * 10.0f;
  }
  fVar5 = CAM->aim[1] + param_6;
  if (fVar5 < CAM->coord[1]) {
    CAM->coord[1] = fVar5;
    CAM->float0x48 = (fVar5 - CAM->coord_mirror[1]) * 10.0f;
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

void ProcessGameCamera(Camera_struct *cam,vec3f *param_2,s32 param_3,s16 param_4,
                      u16 param_5){
  u16 uVar1;
  char acStack72 [72];
  
  uVar1 = cam->camera_mode;
  if (uVar1 == 1) {ProcessGameCamera_mode1(cam,param_2,param_3,param_4,2.0f,4.0f,0.5f,
               2.5f,1.5f,3.0f,16.0f,
               32.0f,0.25f,0.1f,1,1);
  }
  else {
    if (uVar1 < 2) {
      if (uVar1 != 0) {
crash:
        sprintf(acStack72,s_Unknown_Mode:_%d_800e38c4,(u32)cam->camera_mode);
        Crash::ManualCrash(s_ProcessGameCamera_800e38d8,acStack72);
      }
      ProcessGameCamera_mode0(cam,param_2,param_3,param_4,param_5);
    }
    else {
      if (uVar1 == 2) {
        NOOP_800b134c(cam);
        revert_camera_mode(cam);
      }
      else {
        if (uVar1 != 3) goto crash;
      }
    }
  }
  return;
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
  vec3f afStack136;
  float fVar11;
  
  
  if (1 < numFoci) {
    fVar11 = (param_5 - 8.0f) * 0.5f;
    if ((s32)(fVar11 * 100.0f) == ((s32)(fVar11 * 100.0f) / 9000) * 9000)fVar11 += 1.0f;
    uVar10 = (ulonglong)(u32)fVar11;
    setVec3(afStack136,0.0,0.0,0.0);
    fVar11 = (float)numFoci;
    uVar8 = (ulonglong)(u32)fVar11;
    iVar4 = 0x10000;
    ppafVar3 = var_c;
    if (0 < numFoci) {
      do {
        vec3_sum(afStack136,afStack136,*ppafVar3);
        fVar11 = (float)uVar8;
        iVar1 = iVar4 >> 0x10;
        iVar4 = iVar4 + 0x10000;
        ppafVar3 = ppafVar3 + 1;
      } while (iVar1 < numFoci);
    }
    iVar1 = 0;
    iVar2 = 0;
    uVar8 = 0;
    iVar4 = 0;
    multiVec3(afStack136,(float)(1.0d / (double)fVar11));
    fVar11 = (float)uVar10;
    uVar9 = uVar8 & 0xffffffff;
    if (0 < numFoci) {
      iVar6 = 0x10000;
      ppafVar3 = var_c;
      do {
        fVar7 = get_vec3_proximity(afStack136,*ppafVar3);
        fVar11 = (float)uVar10;
        if ((float)uVar8 < fVar7) {
          uVar9 = uVar8 & 0xffffffff;
          uVar8 = (ulonglong)(u32)fVar7;
          iVar4 = iVar1;
          iVar1 = iVar2;
        }
        else {
          if ((float)uVar9 < fVar7) {
            uVar9 = (ulonglong)(u32)fVar7;
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
    Vec3_sub(afStack136,param_1,*ppafVar3);
    if (0.0 < afStack136[2]) afStack136[2] = -afStack136[2];
    (*param_2)[0] = afStack136[2];
    if (afStack136[0] <= 0.0) afStack136[0] = -afStack136[0];
    (*param_2)[1] = afStack136[0];
    vec2_normalize(param_2);
    get_vec3_proximity(param_1,*ppafVar3);
    fVar11 = fVar11 * DtoR_f;
    __sinf(fVar11);
    __cosf(fVar11);
    return;
  }
  Crash::ManualCrash("../src/camera.cpp","numFoci < 2");
}

