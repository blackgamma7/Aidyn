

void camera_set_position(Camera_struct *CAM,vec3 *arg1){
  copyVec3(arg1,(vec3 *)CAM);
  copyVec3(arg1,(vec3 *)CAM->coord_mirror);
  return;
}

void camera_set_aim(Camera_struct *CAM,vec3 *arg1){
  copyVec3(arg1,(vec3 *)CAM->aim);
  copyVec3(arg1,(vec3 *)CAM->aim_mirror);
  return;
}

void camera_init(Camera_struct *CAM,Borg_9_data *map,vec3 *pos,ushort mode){
  memset(CAM,0,sizeof(Camera_struct);
  CAM->field_0x7c = 1;
  CAM->field_0x7e = 3;
  CAM->field_0x80 = 0;
  CAM->aim = {0.0,0.0,0.0};
  CAM->aim_mirror = {0.0,0.0,0.0};
  CAM->field_0x70 = {0.0,0.0,0.0};
  camera_set_position(CAM,pos);
  CAM->XZ_orient[1] = 0.0;
  CAM->rotation[2] = 0.0;
  CAM->rotation[1] = 0.0;
  CAM->field_0x50 = 0.0;
  CAM->field_0x82 = 1;
  CAM->field_0x84 = 0;
  CAM->camera_mode_prev = mode;
  CAM->camera_mode = mode;
  CAM->borg_9 = map;
  CAM->XZ_orient[0] = 1.0;
  CAM->rotation[0] = 1.0;
  CAM->field_0x5c = 5.0;
  CAM->field_0x60 = 5.0;
  CAM->camHeight = 1.05;
  CAM->field_0x64 = 3.0;
  CAM->field_0x4c = 15.0;
  CAM->float0x48 = 15.0;
  CAM->field_0x54 = 45.0;
  init_unkstruck_42(&CAM->substruct);
  set_vec7(&CAM->vec7);
}

void camera_orient(Camera_struct *arg0){
  Vec3_sub((vec3 *)arg0->rotation,(vec3 *)arg0->aim,(vec3 *)arg0);
  setVec2((Vec2 *)arg0->XZ_orient,arg0->rotation[0],arg0->rotation[2]);
  vec3_normalize((vec3 *)arg0->rotation);
  vec2_normalize((Vec2 *)arg0->XZ_orient);
}
 
void camera_lerp(vec3 *arg,vec3 *mirror,float f){
  (*arg)[0] -= ((*arg)[0] - (*mirror)[0]) / f;
  (*arg)[1] -= ((*arg)[1] - (*mirror)[1]) / f;
  (*arg)[2] -= ((*arg)[2] - (*mirror)[2]) / f;
}

void adust_camera_aim(vec3 *aim0,vec3 *aim1,float arg2,short arg3,float arg4){
  int iVar1;
  int iVar2;
  float x;
  vec3 v3temp;
  
  if (0 < arg3) {
    iVar2 = 0x10000;
    do {
      iVar1 = iVar2 >> 0x10;
      Vec3_sub((vec3 *)v3temp,aim0,aim1);
      multiVec3((vec3 *)v3temp,(float)(1.0d / (double)arg2));
      x = vec3_normalize((vec3 *)v3temp);
      if ((arg4 < x) {x = arg4;}
      multiVec3((vec3 *)v3temp,x);
      Vec3_sub(aim0,aim0,(vec3 *)v3temp);
      iVar2 = iVar2 + 0x10000;
    } while (iVar1 < arg3);
  }
}

void set_camera_0x70(Camera_struct *arg0,vec3 *arg1){
  arg0->field_0x70[0] = (*arg1)[0];
  arg0->field_0x70[1] = (*arg1)[1] + arg0->camHeight;
  arg0->field_0x7c = 0;
  arg0->field_0x70[2] = (*arg1)[2];
}

void func_800b04ec(Camera_struct *arg0){
  arg0->field_0x80 = 0;
  if (arg0->field_0x82 != 0) {
    arg0->field_0x58 = 0;
    arg0->float0x48 = arg0->field_0x4c;
  }
}

void func_800b050c(Camera_struct *arg0,vec3 *arg1){
  float fVar1;
  if (arg0->float0x48 < arg0->field_0x50) {arg0->float0x48 = arg0->field_0x50;}
  if (arg0->field_0x54 < arg0->float0x48) {arg0->float0x48 = arg0->field_0x54;}
  (*arg1)[0] = arg0->aim[0] - arg0->XZ_orient[0] * arg0->field_0x5c;
  fVar1 = __sinf((180.0f - arg0->float0x48) * dtor);
  (*arg1)[1] = arg0->aim[1] + fVar1 * arg0->field_0x5c;
  (*arg1)[2] = arg0->aim[2] - arg0->XZ_orient[1] * arg0->field_0x5c;
  return;
}

void func_800b05d0(Camera_struct *CAM,vec3 *Arg1,vec3 *Arg2){
  float fVar1 = __sinf((float)CAM->field_0x58 * dtor);
  float fVar2 = __cosf((float)CAM->field_0x58 * dtor);
  float fVar3 = fVar2 * (*Arg2)[0] + fVar1 * (*Arg2)[2];
  (*Arg1)[0] = fVar3;
  (*Arg1)[2] = fVar2 * (*Arg2)[2] - fVar1 * (*Arg2)[0];
  (*Arg1)[0] = CAM->aim[0] + fVar3 * CAM->field_0x5c;
  fVar1 = __sinf((180.0f - CAM->float0x48) * dtor);
  (*Arg1)[1] = CAM->aim[1] + fVar1 * CAM->field_0x5c;
  (*Arg1)[2] = CAM->aim[2] + (*Arg1)[2] * CAM->field_0x5c;}

void ProcessGameCamera_mode1
               (Camera_struct *arg0,vec3 *arg1,float *arg2,short arg3,float arg4,
               float arg5,undefined4 arg6,undefined4 arg7,float arg8,float arg9,
               float arg10,float arg11,float arg12,float arg13,short arg14,
               short arg15){
  bool lVar1;
  int iVar2;
  vec3 *c;
  vec3 *aim1;
  float fVar3;
  Vec2 fStack656;
  Vec2 afStack592;
  Vec2 fStack528;
  vec3 fStack464;
  vec3 afStack400;
  vec3 fStack336;
  vec3 fStack272;
  vec3 afStack208;
  vec3 afStack144;
  
  fStack336 = arg0->coord;
  copyVec3(arg1,(vec3 *)arg0->aim_mirror);
  arg0->aim_mirror[1]+= arg0->camHeight;
  adust_camera_aim((vec3 *)arg0->aim,(vec3 *)arg0->aim_mirror,arg10,arg3,arg12);
  if (arg0->holdCamera == 0) {
    if (arg15 != 0) {
      arg0->coord_mirror[1] = arg0->aim_mirror[1] + arg8;
    }
    aim1 = (vec3 *)arg0->coord_mirror;
    adust_camera_aim((vec3 *)arg0,aim1,arg11,arg3,arg13);
    setVec2((Vec2 *)fStack656,arg0->aim_mirror[0],arg0->aim_mirror[2]);
    setVec2((Vec2 *)afStack592,arg0->coord_mirror[0],arg0->coord_mirror[2]);
    Vec2_Sub((Vec2 *)fStack528,(Vec2 *)afStack592,(Vec2 *)fStack656);
    fVar3 = vec2_normalize((Vec2 *)fStack528);
    if (arg15 != 0) {
      if (fVar3 < arg4) {
        setVec3(aim1,fStack656[0] + arg4 * fStack528[0],arg0->coord_mirror[1],
                fStack656[1] + arg4 * fStack528[1]);
      }
      if (arg5 < fVar3) {
        setVec3(aim1,fStack656[0] + arg5 * fStack528[0],arg0->coord_mirror[1],
                fStack656[1] + arg5 * fStack528[1]);
      }
    }
    c = (vec3 *)arg0->aim;
    Vec3_sub((vec3 *)fStack272,(vec3 *)arg0,c);
    fStack272[1] = 0.0;
    fVar3 = vec3_normalize((vec3 *)fStack272);
    if (fVar3 < arg4) {
      fVar3 = arg0->aim[2];
      arg0->coord[0] = arg0->aim[0] + fStack272[0] * arg4;
      arg0->coord[2] = fVar3 + fStack272[2] * arg4;
    }
    lVar1 = func_800adf78(arg0->borg_9,(vec3 *)fStack336,(vec3 *)arg0,0.25f,
                         (vec3 *)fStack464,(vec3 *)afStack400,1);
    if (lVar1 != 0) {
      multiVec3((vec3 *)afStack400,0.25f);
      vec3_sum((vec3 *)fStack464,(vec3 *)fStack464,(vec3 *)afStack400);
      arg0->coord = fStack464;
    }
    if (arg14 != 0) {
      Vec3_sub((vec3 *)arg0,(vec3 *)arg0,c);
      Vec3_sub(aim1,aim1,c);
      func_800ab23c((vec3 *)arg0,aim1,(float)(int)arg3 * dtor);
      vec3_sum((vec3 *)arg0,(vec3 *)arg0,c);
      vec3_sum(aim1,aim1,c);
    }
    if ((arg0->field_0x84 != 0) &&
       (iVar2 = (uint)(ushort)arg0->field_0x84 - (int)arg3, arg0->field_0x84 = (short)iVar2
       , iVar2 * 0x10000 < 0)) {
      arg0->field_0x84 = 0;
    }
    if ((((arg15 != 0) && (arg0->field_0x84 == 0)) &&
        (get_vec3_proximity((vec3 *)arg0,aim1) < 1.0f)) &&
       (func_800adf78(arg0->borg_9,c,aim1,0.25f,null,null,1))) {
      arg0->field_0x84 = 300;
      setVec2((Vec2 *)fStack528,*arg2,arg2[2]);
      vec2_normalize((Vec2 *)fStack528);
      setVec3((vec3 *)afStack208,fStack656[0] + arg9 * fStack528[0],arg0->coord_mirror[1],
              fStack656[1] + arg9 * fStack528[1]);
      lVar1 = func_800adf78(arg0->borg_9,c,(vec3 *)afStack208,fVar3,(vec3 *)afStack144,null
                           ,1);
      if (lVar1 == 0) {copyVec3((vec3 *)afStack208,aim1);}
      else {copyVec3((vec3 *)afStack144,aim1);}
    }
    camera_orient(arg0);
  }
  else {func_800b0fac(arg0,arg2,arg3,arg9,arg6,arg7);}
  return;
}

void ProcessGameCamera_mode0
               (Camera_struct *arg0,vec3 *arg1,vec3 *arg2,short arg3,short arg4){
  short sVar1;
  int iVar3;
  ushort uVar4;
  longlong lVar2;
  vec3 *aim0;
  vec3 *aim0_00;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  vec3 afStack240;
  vec3 fStack176;
  vec3 fStack112;
  
  fStack112 = arg0->coord;
  fVar8 = 0.0;
  if (arg0->field_0x68 != 0) {
    iVar3 = (uint)(ushort)arg0->field_0x68 - (int)arg3;
    arg0->field_0x68 = (short)iVar3;
    if (0 < iVar3 * 0x10000) {
      sVar1 = arg0->holdCamera;
      goto LAB_800b0be4;
    }
    arg0->field_0x68 = 0;
    arg0->field_0x5c = arg0->field_0x60;
  }
  sVar1 = arg0->holdCamera;
LAB_800b0be4:
  if (sVar1 == 0) {
    aim0_00 = (vec3 *)arg0->aim;
    arg0->aim_mirror[0] = (*arg1)[0];
    arg0->aim_mirror[1] = (*arg1)[1] + arg0->camHeight;
    arg0->aim_mirror[2] = (*arg1)[2];
    adust_camera_aim(aim0_00,(vec3 *)arg0->aim_mirror,12.0,arg3,5.0f);
    Vec3_sub((vec3 *)fStack176,(vec3 *)arg0->aim_mirror,(vec3 *)arg0->field_0x70);
    fVar5 = vec3Length((vec3 *)fStack176);
    if ((float)(int)(short)arg0->field_0x7e < fVar5) {
      arg0->field_0x7c = 1;
    }
    if (0.25d < (double)fVar5) {
      func_800b04ec(arg0);
      arg0->field_0x7c = 0;
    }
    camera_orient(arg0);
    aim0 = (vec3 *)arg0->coord_mirror;
    func_800b050c(arg0,aim0);
    func_800b05d0(arg0,(vec3 *)afStack240,arg2);
    if (arg0->field_0x7c == 0) {
      fVar5 = (((float)(int)(short)arg0->field_0x7e - fVar5) /
              (float)(int)(short)arg0->field_0x7e) * 128.0f + 16.0f;
      if (fVar5 < 16.0f) {
        fVar5 = 16.0f;
      }
      uVar4 = arg0->field_0x80;
    }
    else {
      uVar4 = arg0->field_0x80;
      fVar5 = 16.0f;
    }
    if (((uVar4 != 0) &&
        (fVar6 = get_vec3_proximity(aim0,(vec3 *)afStack240), fVar5 = 5.0f,
        (double)fVar6 < 0.5d)) &&
       (uVar4 = arg0->field_0x80 - 1, arg0->field_0x80 = uVar4, (int)((uint)uVar4 << 0x10) < 1
       )) {
      func_800b04ec(arg0);
    }
    fVar6 = 5.0f;
    adust_camera_aim(aim0,(vec3 *)afStack240,fVar5,arg3,5.0f);
    Vec3_sub((vec3 *)fStack176,(vec3 *)arg0,aim0_00);
    fStack176[1] = 0.0;
    fVar5 = vec3_normalize((vec3 *)fStack176);
    fVar7 = arg0->field_0x64;
    if (fVar5 < fVar7) {
      fVar5 = arg0->aim[2];
      arg0->coord[0] = arg0->aim[0] + fStack176[0] * fVar7;
      arg0->coord[2] = fVar5 + fStack176[2] * fVar7;
    }
    if (0.0 < fVar8) {
      Vec3_sub((vec3 *)arg0,(vec3 *)arg0,aim0_00);
      Vec3_sub(aim0,aim0,aim0_00);
      func_800ab23c((vec3 *)arg0,aim0,fVar8 * (float)(int)arg3);
      vec3_sum((vec3 *)arg0,(vec3 *)arg0,aim0_00);
      vec3_sum(aim0,aim0,aim0_00);
    }
    adust_camera_aim((vec3 *)arg0,aim0,16.0,arg3,fVar6);
    if (((short)arg0->field_0x80 < 2) && (arg4 != 0)) {
      lVar2 = func_800adf78(arg0->borg_9,(vec3 *)arg0,aim0_00,0.25,null,null,0);
      if (lVar2 == 0) {
        arg0->field_0x82 = 1;
      }
      else {
        arg0->field_0x82 = 0;
      }
    }
    lVar2 = func_800adf78(arg0->borg_9,(vec3 *)fStack112,(vec3 *)arg0,0.25,null,
                         null,1);
    if (((lVar2 != 0) && (arg0->field_0x80 == 1)) && (arg0->field_0x82 != 0)) {
      func_800b04ec(arg0);
    }
    camera_orient(arg0);
  }
  else {
    if (sVar1 != 2) {
      arg0->float0x48 = 0.0;
    }
    copyVec3(arg1,(vec3 *)arg0->aim_mirror);
    arg0->aim_mirror[1] += arg0->camHeight;
    adust_camera_aim((vec3 *)arg0->aim,(vec3 *)arg0->aim_mirror,16.0,arg3,0.25f);
    func_800b0fac(arg0,arg2,arg3,arg0->field_0x5c,0,5.0f);
  }
  return;
}


void func_800b0fac(Camera_struct *CAM,undefined4 param_2,short param_3,float param_4,float param_5,
                 float param_6){
  bool bVar1;
  uint uVar2;
  float fVar4;
  float fVar5;
  float fVar6;
  vec3 fStack504;
  Vec2 fStack440;
  Vec2 afStack376;
  vec3 afStack312;
  vec3 afStack248;
  Vec2 fStack184;
  Vec2 afStack120;
  
  if (CAM->holdCamera == 1) {
    CAM->holdCamera = 2;
    CAM->coord_mirror = CAM->coord;
  }
  if (CAM->holdCamera == 3) {
    CAM->holdCamera = 0;
    CAM->coord_mirror = CAM->coord;
  }
  Vec3_sub((vec3 *)fStack504,(vec3 *)CAM,CAM->aim);
  fStack504[1] = 0.0;
  fVar4 = vec3_normalize((vec3 *)fStack504);
  uVar2 = 0;
  if (0 < param_3) {
    do {
      uVar2++;
      fVar4 = (float)((double)fVar4 - (double)(fVar4 - param_4) * 0.03125d);
    } while ((int)uVar2 < (int)param_3);
  }
  Vec3_sub((vec3 *)fStack504,(vec3 *)CAM->coord_mirror,CAM->aim);
  setVec2((Vec2 *)fStack184,fStack504[0],fStack504[2]);
  vec2_normalize((Vec2 *)fStack184);
  some_trig_func((Vec2 *)fStack184,(float)CAM->field_0x58);
  multiVec2((Vec2 *)fStack184,fVar4);
  setVec3((vec3 *)CAM,fStack184[0] + CAM->aim[0],CAM->coord_mirror[1],fStack184[1] + CAM->aim[2]);

  if (func_800adf78(CAM->borg_9,CAM->aim,(vec3 *)CAM,0.25,(vec3 *)afStack312,(vec3 *)afStack248,1)){
    multiVec3((vec3 *)afStack248,-0.25);
    vec3_sum((vec3 *)afStack312,(vec3 *)afStack312,(vec3 *)afStack248);
    Vec3_sub((vec3 *)fStack504,(vec3 *)afStack312,CAM->aim);
    setVec2((Vec2 *)afStack120,fStack504[0],fStack504[2]);
    fVar5 = vec2Length((Vec2 *)afStack120);
    fVar4 = (float)((double)fVar4 - (double)(fVar4 - fVar5) * 0.125d);
    vec2_normalize((Vec2 *)fStack184);
    multiVec2((Vec2 *)fStack184,fVar4);
    setVec3((vec3 *)CAM,fStack184[0] + CAM->aim[0],CAM->coord_mirror[1],fStack184[1] + CAM->aim[2]);
  }
  setVec2((Vec2 *)fStack440,CAM->aim[0],CAM->aim[2]);
  setVec2((Vec2 *)afStack376,CAM->coord[0],CAM->coord[2]);
  Vec2_Sub((Vec2 *)fStack184,(Vec2 *)afStack376,(Vec2 *)fStack440);
  if ((double)vec2_normalize((Vec2 *)fStack184); < 0.5d) {
    setVec3((vec3 *)CAM,(float)((double)fStack440[0] + (double)fStack184[0] * 0.5d),
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
  return;
}

void NOOP_800b134c(Camera_struct *c){}

void set_camera_mode(Camera_struct *cam,ushort mode){
  if (cam->camera_mode != mode) {
    cam->camera_mode_prev = cam->camera_mode;
    cam->camera_mode = mode;
  }
  return;
}


void revert_camera_mode(Camera_struct *c){c->camera_mode = c->camera_mode_prev;}

void ProcessGameCamera(Camera_struct *cam,vec3 *param_2,undefined4 param_3,short param_4,
                      undefined2 param_5){
  ushort uVar1;
  char acStack72 [72];
  
  uVar1 = cam->camera_mode;
  if (uVar1 == 1) {
    ProcessGameCamera_mode1
              (cam,param_2,param_3,param_4,2.0f,4.0f,0.5f,
               2.5f,1.5f,3.0f,16.0f,
               32.0f,0.25f,0.1f,1,1);
  }
  else {
    if (uVar1 < 2) {
      if (uVar1 != 0) {
crash:
        sprintf(acStack72,s_Unknown_Mode:_%d_800e38c4,(uint)cam->camera_mode);
        manualCrash(s_ProcessGameCamera_800e38d8,acStack72);
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

void some_camera_func(vec3 *param_1,Vec2 *param_2,vec3 **var_c,short numFoci,float param_5){
  int iVar1;
  int iVar2;
  vec3 **ppafVar3;
  int iVar4;
  int iVar6;
  float fVar7;
  ulonglong uVar8;
  ulonglong uVar9;
  ulonglong uVar10;
  vec3 afStack136;
  float fVar11;
  
  
  if (1 < numFoci) {
    fVar11 = (param_5 - 8.0f) * 0.5f;
    if ((int)(fVar11 * 100.0f) == ((int)(fVar11 * 100.0f) / 9000) * 9000)
    {
      fVar11 += 1.0f;
    }
    uVar10 = (ulonglong)(uint)fVar11;
    setVec3((vec3 *)afStack136,0.0,0.0,0.0);
    fVar11 = (float)numFoci;
    uVar8 = (ulonglong)(uint)fVar11;
    iVar4 = 0x10000;
    ppafVar3 = var_c;
    if (0 < numFoci) {
      do {
        vec3_sum((vec3 *)afStack136,(vec3 *)afStack136,*ppafVar3);
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
    multiVec3((vec3 *)afStack136,(float)(1.0d / (double)fVar11));
    fVar11 = (float)uVar10;
    uVar9 = uVar8 & 0xffffffff;
    if (0 < numFoci) {
      iVar6 = 0x10000;
      ppafVar3 = var_c;
      do {
        fVar7 = get_vec3_proximity((vec3 *)afStack136,*ppafVar3);
        fVar11 = (float)uVar10;
        if ((float)uVar8 < fVar7) {
          uVar9 = uVar8 & 0xffffffff;
          uVar8 = (ulonglong)(uint)fVar7;
          iVar4 = iVar1;
          iVar1 = iVar2;
        }
        else {
          if ((float)uVar9 < fVar7) {
            uVar9 = (ulonglong)(uint)fVar7;
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
    Vec3_sub((vec3 *)afStack136,param_1,*ppafVar3);
    if (0.0 < afStack136[2]) {
      afStack136[2] = -afStack136[2];
    }
    (*param_2)[0] = afStack136[2];
    if (afStack136[0] <= 0.0) {
      afStack136[0] = -afStack136[0];
    }
    (*param_2)[1] = afStack136[0];
    vec2_normalize(param_2);
    get_vec3_proximity(param_1,*ppafVar3);
    fVar11 = fVar11 * DtoR_f;
    __sinf(fVar11);
    __cosf(fVar11);
    return;
  }
  manualCrash("../src/camera.cpp","numFoci < 2");
}

