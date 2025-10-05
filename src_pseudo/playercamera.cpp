#include "globals.h"
#define FILENAME "./src/playerCamera.cpp"

voxelObject* cameraVoxelPointer=NULL;
vec3f* cameraVec3Ptr=NULL;
u16 camera_dat=0;

void set_camera_voxel_pointer(voxelObject *param_1,vec3f *param_2){
  cameraVec3Ptr = param_2;
  cameraVoxelPointer = param_1;
  camera_dat = 60;
  if (param_1 == NULL) camera_dat = 0;
}

void clear_camera_voxel_pointer(void){
  cameraVoxelPointer = NULL;
  cameraVec3Ptr = NULL;
  camera_dat = 0;
}

void passto_camera_init(Camera_struct *cam,Borg9Data *map,vec3f *pos,u16 dat){
  Camera::Init(cam,map,pos,dat);
  gGlobals.gameVars.camPtrArraySize = 0;
}

void clear_some_playerHandler_field(void){
  gGlobals.gameVars.PlayerHandler.cameraFocus = -1;
}

void FUN_80019ccc(playerData *param_1){
  if ((param_1->flags & ACTOR_ISPLAYER) != 0) {
    Actor::UnsetFlag(param_1,ACTOR_ISPLAYER);
    gGlobals.gameVars.PlayerHandler.cameraFocus = -1;
    clear_some_playerHandler_field();
  }
}

void GiveCameraToPlayer(playerData *param_1){
  if (param_1 == NULL) CRASH("GiveCameraToPlayer","Player Pointer is NULL!")
  if (gGlobals.gameVars.PlayerHandler.cameraFocus != -1) {
    FUN_80019ccc(gGlobals.gameVars.PlayerHandler.playerDats + gGlobals.gameVars.PlayerHandler.cameraFocus);
  }
  gGlobals.gameVars.camera.borg_9 = GetCollisionZone(param_1->zoneDatByte);
  gGlobals.gameVars.camera.unk58 = 0.0;
  gGlobals.gameVars.camera.unk48 = gGlobals.gameVars.camera.unk4c;
  Actor::SetFlag(param_1,ACTOR_ISPLAYER);
  gGlobals.gameVars.PlayerHandler.cameraFocus = param_1->ID;
  return;
}

void Camera::ApplyVelocity(Camera_struct *cam,vec3f *vel){
  (cam->collide).pos.x += vel->x;
  (cam->collide).pos.y += vel->y;
  (cam->collide).pos.z += vel->z;
  (cam->pos).x += vel->x;
  (cam->pos).y += vel->y;
  (cam->pos).z += vel->z;
  (cam->aim).x += vel->x;
  (cam->aim).y += vel->y;
  (cam->aim).z += vel->z;
  (cam->posTarget).x += vel->x;
  (cam->posTarget).y += vel->y;
  (cam->posTarget).z += vel->z;
  (cam->aimTarget).x += vel->x;
  (cam->aimTarget).y += vel->y;
  (cam->aimTarget).z += vel->z;
  (cam->unk70).x += vel->x;
  (cam->unk70).y += vel->y;
  (cam->unk70).z += vel->z;
}

void Camera::AddPosToList(vec3f *param_1){
  gGlobals.gameVars.camPtrArray[gGlobals.gameVars.camPtrArraySize++] = param_1;
}

void Camera::CopyPosAim(Camera_struct *param_1,u16 flag,vec3f *param_3){
  if ((flag & CamOBJ_CopyAim)) copyVec3(&param_1->aim,param_3);
  if ((flag & CamOBJ_CopyPos)) copyVec3(&param_1->pos,param_3);
}

void Camera::CopyPosAim2(Camera_struct *param_1,u16 flags,vec3f *param_3){
  if ((flags & CamOBJ_CopyAim)) copyVec3(param_3,&param_1->aim);
  if ((flags & CamOBJ_CopyPos)) copyVec3(param_3,&param_1->pos);
}

#define PI_f 3.141593f
void processVoxelCamera(vec3f *arg0,voxelObject *vox,Camera_struct *cam,float delta){
  short sVar1;
  bool bVar2;
  bool bVar3;
  bool bVar4;
  bool bVar6;
  vec3f *v3a;
  vec3f *v3b;
  float fVar7;
  float fVar8;
  double dVar9;
  vec3f afStack248;
  vec3f avStack_b8 [5];
  vec3f fStack120;
  
  bVar4 = false;
  if (((((vox->header).type == VOXEL_Camera) && ((vox->header).timestamp < gGlobals.ticker)) &&
      (((vox->header).Bitfeild & VOXEL_Active) != 0)) &&
     (vec3_proximity(arg0,&vox->header.pos) <= (vox->header).size)) {
    if (gGlobals.screenFadeModeSwitch == 0xc) {
      if (((vox->camera).CameraFlags & CamObj_M001f)){
        gGlobals.scriptcamera.counter0++;
      }
    }
    if (((vox->camera).CameraFlags & (CamOBJ_CopyPos|CamOBJ_CopyAim))) {
      Camera::SetMode(cam,2);
      if (((vox->camera).CameraFlags & CamObj_M001f) == 0) {
        sprintf(gGlobals.text,"No Movement Type!!\nFlags: %02x\n",(vox->camera).CameraFlags);
        Crash::ManualCrash("ProcessVoxelCamera",gGlobals.text);
      }
      v3a = &(vox->camera).vec3_b;
      v3b = &(vox->camera).vec3_C;
      if ((vox->camera).timestamp < gGlobals.ticker) {
        Camera::CopyPosAim(cam,(vox->camera).CameraFlags,&afStack248);
        copyVec3(&afStack248,v3a);
        sVar1 = (vox->camera).refpoint_ID;
        if (sVar1 == 0) {
          copyVec3(arg0,v3b);
          if (gGlobals.playerCharStruct.playerDat == NULL)
            (vox->camera).vec3_C.y = (float)((double)(vox->camera).vec3_C.y - 0.5);
          else (vox->camera).vec3_C.y -= (gGlobals.playerCharStruct.playerDat)->scaleRad;
          if (isDialougeMode()) (vox->camera).vec3_C.y = ((vox->camera).vec3_C.y + 0.5);
          else (vox->camera).vec3_C.y += cam->camHeight;
        }
        else copyVec3(&FindReferncePoint(gGlobals.gameVars.borg9DatPointer,sVar1)->header.pos,v3b);
        (vox->camera).unk0x54 = 0.0;
        if (((vox->camera).CameraFlags & CamOBJ_TrackOn)) {
          fStack120.x = arg0->x;
          fStack120.z = arg0->z;
          fStack120.y = arg0->y + cam->camHeight;
          Camera::SetAim(cam,&fStack120);
        }
        if (((vox->camera).CameraFlags & CamOBJ_MoveCut)) {
          copyVec3(v3b,v3a);
          Camera::CopyPosAim2(cam,(vox->camera).CameraFlags,v3b);
        }
        if (((vox->camera).CameraFlags & CamOBJ_MovePan)) {
          Vec3_sub(&afStack248,v3b,v3a);
          multiVec3(&afStack248,vec3_normalize(&afStack248) / (vox->camera).vec3_A.z);
          copyVec3(&afStack248,v3a);
          (vox->camera).unk0x54 = (vox->camera).vec3_A.z;
        }
      }
      bVar2 = 0.5 < vec3_proximity(v3a,v3b);
      bVar6 = ((vox->camera).CameraFlags & CamObj_M001f) != 0;
      if (((vox->camera).CameraFlags & CamOBJ_MovePan)){
        if (0.0 < (vox->camera).unk0x54) {
          (vox->camera).unk0x54 -= delta;
          Camera::CopyPosAim(cam,(vox->camera).CameraFlags,&afStack248);
          copyVec3(v3a,avStack_b8);
          multiVec3(avStack_b8,delta);
          vec3_sum(&afStack248,&afStack248,avStack_b8);
          Camera::CopyPosAim2(cam,(vox->camera).CameraFlags,&afStack248);
        }
        else bVar4 = bVar6 && bVar2;
      }
      fVar7 = PI_f;
      if (((vox->camera).CameraFlags & CamOBJ_MoveSine)){
        fVar8 = (vox->camera).unk0x54;
        if (fVar8 < PI_f) {
          fVar8 = fVar8 + (PI_f / (vox->camera).vec3_A.z) * delta;
          bVar3 = PI_f < fVar8;
          (vox->camera).unk0x54 = fVar8;
          if (bVar3) {
            (vox->camera).unk0x54 = fVar7;
          }
          Vec3_sub(&afStack248,v3b,v3a);
          multiVec3(&afStack248,-(vec3_normalize(&afStack248) * (__cosf((vox->camera).unk0x54) - 1.0f) * 0.5f));
          vec3_sum(&afStack248,&afStack248,v3a);
          Camera::CopyPosAim2(cam,(vox->camera).CameraFlags,&afStack248);
        }
        else {
          if (bVar6 && bVar2) bVar4 = true;
        }
      }
      if (((vox->camera).CameraFlags & CamOBJ_0008)){
        dVar9 = (double)(vox->camera).unk0x54;
        if (dVar9 < PiOver2) {
          fVar7 = (float)(dVar9 + (PiOver2 / (vox->camera).vec3_A.z) *
                                  (double)delta);
          bVar3 = PiOver2 < (double)fVar7;
          (vox->camera).unk0x54 = fVar7;
          if (bVar3) {
            (vox->camera).unk0x54 = (f32)PiOver2;
          }
          Vec3_sub(&afStack248,v3b,v3a);
          multiVec3(&afStack248,vec3_normalize(&afStack248) * 1.0f - __cosf((vox->camera).unk0x54));
          vec3_sum(&afStack248,&afStack248,v3a);
          Camera::CopyPosAim2(cam,(vox->camera).CameraFlags,&afStack248);
        }
        else {
          if (bVar6 && bVar2) bVar4 = true;
        }
      }
      if (((vox->camera).CameraFlags & CamOBJ_0010)) {
        dVar9 = (double)(vox->camera).unk0x54;
        if (dVar9 < PiOver2) {
          fVar7 = (float)(dVar9 + (PiOver2 / (double)(vox->camera).vec3_A.z) *
                                  (double)delta);
          bVar6 = PiOver2 < (double)fVar7;
          (vox->camera).unk0x54 = fVar7;
          if (bVar6) (vox->camera).unk0x54 = (f32)PiOver2;
          Vec3_sub(&afStack248,v3b,v3a);
          fVar7 = vec3_normalize(&afStack248);
          fVar8 = __sinf((vox->camera).unk0x54);
          multiVec3(&afStack248,fVar7 * fVar8);
          vec3_sum(&afStack248,&afStack248,v3a);
          Camera::CopyPosAim2(cam,(vox->camera).CameraFlags,&afStack248);
        }
        else if (bVar6 && bVar2) bVar4 = true;
      }
      if (bVar4) (vox->camera).timestamp = 0;
    }
    if (((vox->camera).CameraFlags & CamOBJ_TrackOn)) {
      copyVec3(arg0,&cam->aimTarget);
      (cam->aimTarget).y += cam->camHeight;
      Camera::AdjustAim(&cam->aim,&cam->aimTarget,24.0,delta,0.25f);
    }
    if (((vox->camera).CameraFlags & CamOBJ_0100)){
      fVar7 = (vox->camera).vec3_A.y;
      cam->unk5c = fVar7;
      if (fVar7 < cam->unk64) {
        cam->unk5c = cam->unk64;
      }
      cam->unk68 = 30;
    }
    if (((vox->camera).CameraFlags & CamOBJ_0200)) {
      cam->unk48 = (vox->camera).vec3_A.x;
      Camera::SetFeild70(cam,arg0);
    }
    if (((vox->camera).CameraFlags & (CamOBJ_CopyPos|CamOBJ_CopyAim))) {
      Camera::Orient(cam);
    }
    (vox->camera).timestamp = gGlobals.ticker + 2;
  }
}
#undef PI_f //digit length changes per function

void InitScriptCameras(ScriptCamera_struct *param_1){
  if (param_1->dataActive) CRASH("InitScriptCameras","Data already Active\n");
  param_1->dataActive = true;
  ALLOCS(param_1->cameras,8*sizeof(ScriptCam),567);
  param_1->cameraCount = 0;
  for(s16 i=0;i<8;i++){
    CLEAR(&param_1->cameras[i]);
    param_1->cameraIndecies[i]=i;
    param_1->cameras[i].index=i;
  }
}

void freeScriptCameras(ScriptCamera_struct *param_1){
  if (!param_1->dataActive) CRASH("FreeScriptCameras","Data is not Active!\n");
  for(s16 i=0;i<8;i++){
    freeScriptCamera(param_1,&param_1->cameras[i]);
  }
  param_1->dataActive = false;
  FREE(param_1->cameras,0x259);
}

ScriptCam * AllocScriptCamera(ScriptCamera_struct *param_1,ushort param_2){
  ScriptCam *x = param_1->cameras + (ushort)param_1->cameraIndecies[param_1->cameraCount++];
  if (7 < param_1->cameraCount) CRASH("AllocScriptCamera","No Free Cameras!\n");
  s16 tempInd = x->index;
  CLEAR(x);
  x->timer = param_2;
  x->active = false;
  (x->voxel).header.type = VOXEL_Camera;
  (x->voxel).camera.vec3_A.z = param_2;
  (x->voxel).header.Bitfeild = VOXEL_Active;
  x->index = tempInd;
  (x->voxel).header.size = 1000.0f;
  return x;
}

void freeScriptCamera(ScriptCamera_struct *param_1,ScriptCam *param_2){
  if (param_2->active) {
    if ((param_2->flag & 1)) clear_some_playerHandler_field();
    param_1->cameraIndecies[--param_1->cameraCount] = param_2->index;
    param_2->active = false;
    if (((param_2->flag & 2)) && (param_1->cameraCount == 0)) {
      clear_some_playerHandler_field();
    }
  }
}
extern s16 some_toggle;
void ProcessScriptCamera(ScriptCamera_struct *param_1,float delta){
  short sVar1;
  int iVar2;
  uint uVar3;
  vec3f *arg0;
  vec3f afStack112;
  
  sVar1 = param_1->counter0;
  param_1->counter0 = 0;
  param_1->counter1 = sVar1;
  sprintf(gGlobals.text,"ProcessScriptCameras");
  if (param_1->dataActive != 0) {
    for(s16 i=0;i<8;i++){
      ScriptCam *sCam = &param_1->cameras[i];
      if (sCam->active != 0) {
        if (gGlobals.screenFadeModeSwitch == 0xc) param_1->counter0++;
        if (sCam->aim) {
          setVec3(&afStack112,sCam->aim->x,sCam->aim->y + sCam->height,sCam->aim->z);
          sCam->aim = &afStack112;
        }
        processVoxelCamera(arg0,&sCam->voxel,&gGlobals.gameVars.camera,delta);
        sCam->timer -=delta;
        if ((s16)sCam->timer < 1) freeScriptCamera(param_1,sCam);
      }
    }
    if (some_toggle != -1) camera_dat = 0;
    if (camera_dat) {
      camera_dat-=delta;
      if ((s16)camera_dat < 0) camera_dat = 0;
      if (cameraVoxelPointer)
        processVoxelCamera(cameraVec3Ptr,cameraVoxelPointer,&gGlobals.gameVars.camera,delta);
    }
    sprintf(gGlobals.text,"FINISHED ProcessScriptCameras");
  }
}
