#include "globals.h"


void Scene::MatrixASetPos(SceneData *param_1,float x,float y,float z){
  param_1->matrixA[3][0] = x;
  param_1->matrixA[3][1] = y;
  param_1->matrixA[3][2] = z;
}

void Scene::MatrixATranslate(SceneData *param_1,float x,float y,float z){
    param_1->matrixA[3][0] += x;
    param_1->matrixA[3][1] += y;
    param_1->matrixA[3][2] += z;
}

void Ofunc_800a7554(SceneData *param_1,float x,float y,float z){
  param_1->matrixA[3][0] = param_1->matrixA[3][0] +
       param_1->matrixA[0][0] * x + param_1->matrixA[1][0] * y + param_1->matrixA[2][0] * z;
  param_1->matrixA[3][1] = param_1->matrixA[3][1] +
       param_1->matrixA[0][1] * x + param_1->matrixA[1][1] * y + param_1->matrixA[2][1] * z;
  param_1->matrixA[3][2] = param_1->matrixA[3][2] +
      param_1->matrixA[0][2] * x + param_1->matrixA[1][2] * y + param_1->matrixA[2][2] * z;
}

void Scene::MatrixARotate(SceneData *param_1,float pitch,float roll,float yaw){
  MtxF temp;
  
  guRotateRPYF(&temp,roll,pitch,yaw);
  param_1->matrixA[0][0] = temp[0][0];
  param_1->matrixA[1][0] = temp[1][0];
  param_1->matrixA[2][0] = temp[2][0];
  param_1->matrixA[0][1] = temp[0][1];
  param_1->matrixA[1][1] = temp[1][1];
  param_1->matrixA[2][1] = temp[2][1];
  param_1->matrixA[0][2] = temp[0][2];
  param_1->matrixA[1][2] = temp[1][2];
  param_1->matrixA[2][2] = temp[2][2];
}


void Ofunc_800a7674(SceneData *param_1,float param_2,float param_3,float param_4){
  MtxF tempA;
  
  guRotateRPYF(&tempA,param_3,param_2,param_4);
  MtxF tempB = param_1->matrixA;
  some_other_matrix_math(&param_1->matrixA,&tempA,&tempB);
}

void Ofunc_800a76f0(SceneData *param_1,vec3f *param_2,float param_3){
  ofunc_sub_800acc40(&param_1->matrixA,param_2,param_3);
}

void Ofunc_800a770c(SceneData *param_1,vec3f *param_2,undefined4 param_3){
  MtxF tempA,tempB;
  ofunc_sub_800acc40(&tempA,param_2,param_3);
  tempB = param_1->matrixA;
  FUN_800ac2e8(&param_1->matrixA,&tempA,&tempB);
}

void Scene::MatrixANormalizeScale(SceneData *param_1,float x,float y,float z){
  (param_1->scalar).x = x;
  (param_1->scalar).y = y;
  (param_1->scalar).z = z;
  guNormalize(&param_1->matrixA[0][0],&param_1->matrixA[0][1],&param_1->matrixA[0][2]);
  guNormalize(&param_1->matrixA[1][0],&param_1->matrixA[1][1],&param_1->matrixA[1][2]);
  guNormalize(&param_1->matrixA[2][0],&param_1->matrixA[2][1],&param_1->matrixA[2][2]);
  matrix_scale(&param_1->matrixA,x,y,z);
}

void Scene::ScaleBodyPart(SceneData *param_1,float x,float y,float z){
  (param_1->scalar).x = x;
  (param_1->scalar).y = y;
  (param_1->scalar).z = z;
  matrix_scale(&param_1->matrixA,x,y,z);
}

void Scene::MatrixAAlign(SceneData *param_1,float x,float y,float z,float angle){
  MtxF temp;
  
  guAlignF(&temp,angle,x,y,z);
  param_1->matrixA[0][0] = temp[0][0];
  param_1->matrixA[1][0] = temp[1][0];
  param_1->matrixA[2][0] = temp[2][0];
  param_1->matrixA[0][1] = temp[0][1];
  param_1->matrixA[1][1] = temp[1][1];
  param_1->matrixA[2][1] = temp[2][1];
  param_1->matrixA[0][2] = temp[0][2];
  param_1->matrixA[1][2] = temp[1][2];
  param_1->matrixA[2][2] = temp[2][2];
}

void Scene::MatrixBPos(SceneData *param_1,float x,float y,float z){
  param_1->matrixB[3][0] = x;
  param_1->matrixB[3][1] = y;
  param_1->matrixB[3][2] = z;
}

void Scene::MatrixBTranslate(SceneData *param_1,float x,float y,float z){
    param_1->matrixB[3][0] += x;
    param_1->matrixB[3][1] += y;
    param_1->matrixB[3][2] += z;
}

void Ofunc_800a7920(SceneData *param_1,float x,float y,float z){
    param_1->matrixB[3][0] = param_1->matrixB[3][0] +
         param_1->matrixB[0][0] * x + param_1->matrixB[1][0] * y + param_1->matrixB[2][0] * z;
    param_1->matrixB[3][1] = param_1->matrixB[3][1] +
         param_1->matrixB[0][1] * x + param_1->matrixB[1][1] * y + param_1->matrixB[2][1] * z;
    param_1->matrixB[3][2] = param_1->matrixB[3][2] +
        param_1->matrixB[0][2] * x + param_1->matrixB[1][2] * y + param_1->matrixB[2][2] * z;
}

void Scene::MatrixBRotate(SceneData *param_1,float pitch,float roll,float yaw){
    MtxF temp;
    
    guRotateRPYF(&temp,roll,pitch,yaw);
    param_1->matrixB[0][0] = temp[0][0];
    param_1->matrixB[1][0] = temp[1][0];
    param_1->matrixB[2][0] = temp[2][0];
    param_1->matrixB[0][1] = temp[0][1];
    param_1->matrixB[1][1] = temp[1][1];
    param_1->matrixB[2][1] = temp[2][1];
    param_1->matrixB[0][2] = temp[0][2];
    param_1->matrixB[1][2] = temp[1][2];
    param_1->matrixB[2][2] = temp[2][2];
}


void Scene::MatrixBCopyTo(SceneData *param_1,MtxF *param_2){
  float fVar1;
  float fVar2;
  float fVar3;
  float (*pafVar4) [4];
  float (*pafVar5) [4];
  
  pafVar5 = param_1->matrixB;
  
  pafVar4 = param_2[1];
  do {
    fVar1 = (*(float (*) [4])(*param_2)[0])[1];
    fVar2 = (*(float (*) [4])(*param_2)[0])[2];
    fVar3 = (*(float (*) [4])(*param_2)[0])[3];
    (*pafVar5)[0] = (*(float (*) [4])(*param_2)[0])[0];
    (*pafVar5)[1] = fVar1;
    (*pafVar5)[2] = fVar2;
    (*pafVar5)[3] = fVar3;
    param_2 = (MtxF *)((int)param_2 + 0x10);
    pafVar5 = pafVar5 + 1;
  } while (param_2 != (MtxF *)pafVar4);
}

//unused, redundant
void Scene::SetFlag40_800a7af8(SceneData *param_1){param_1->flags|= SCENE_0040;}
//unused, redundant
void Scene::UnsetFlag40_800a7b08(SceneData *param_1){param_1->flags&= ~SCENE_0040;}

void Scene::SetFlag80(SceneData *param_1){param_1->flags|= SCENE_0080;}

void Scene::UnsetFlag80_800a7b2c(SceneData *param_1){param_1->flags&= ~SCENE_0080;}

borg5substruct * Ofunc_800a7b40(SceneData *param_1){
  if ((param_1->scene[0].borg5->dat).borg3P) 
    return (param_1->scene[0].borg5->dat).someSubstruct;
  return NULL;
}


void Scene::LookAt(SceneData *ani,float posx,float posy,float poz,float aimx,float aimy,
    float aimz,float cx,float cy,float cz){
float length;
vec3f v3_0;
vec3f v3_1;
vec3f v3_2;

v3_0.x = posx - aimx;
v3_0.y = posy - aimy;
v3_0.z = poz - aimz;
guNormalize(&v3_0.x,&v3_0.y,&v3_0.z);
v3_1.x = cy * v3_0.z - cz * v3_0.y;
v3_1.y = cz * v3_0.x - cx * v3_0.z;
v3_1.z = cx * v3_0.y - cy * v3_0.x;
length = _sqrtf(v3_1.x * v3_1.x + v3_1.y * v3_1.y + v3_1.z * v3_1.z);
if (0.000001 <= length) {
  length = (float)(1.0 / (double)length);
  gAnimationLookatVec.y = v3_1.y * length;
  gAnimationLookatVec.x = v3_1.x * length;
  gAnimationLookatVec.z = v3_1.z * length;
}
v3_1.x = gAnimationLookatVec.x;
v3_1.y = gAnimationLookatVec.y;
v3_1.z = gAnimationLookatVec.z;
Vec3Cross(&v3_2,&v3_0,&v3_1);
ani->matrixB[3][0] = posx;
ani->matrixB[3][1] = posy;
ani->matrixB[3][2] = poz;
ani->matrixB[0][3] = 0.0;
ani->matrixB[1][3] = 0.0;
ani->matrixB[2][3] = 0.0;
ani->matrixB[0][0] = v3_1.x;
ani->matrixB[0][1] = v3_1.y;
ani->matrixB[0][2] = v3_1.z;
ani->matrixB[1][0] = v3_2.x;
ani->matrixB[1][1] = v3_2.y;
ani->matrixB[1][2] = v3_2.z;
ani->matrixB[2][0] = v3_0.x;
ani->matrixB[2][1] = v3_0.y;
ani->matrixB[2][2] = v3_0.z;
ani->matrixB[3][3] = 1.0;
}

void SceneSetCameraLookAt(SceneData *ani,float posx,float posy,float posz,float aimx,float aimy,float aimz){
  Scene::LookAt(ani,posx,posy,posz,aimx,aimy,aimz,0.0,1.0,0.0);
}

void Scene::SetFOV(SceneData *param_1,float param_2){
  Borg3Header *pBVar1 = ((param_1->scene[0].borg5)->dat).borg3P;
  if (pBVar1) pBVar1->dat.fovy = param_2;
}

float Scene::GetFOV(SceneData *param_1){
  Borg3Header *pBVar1 = ((param_1->scene[0].borg5)->dat).borg3P;
  float ret  = 75.0f;
  if (pBVar1) ret = pBVar1->dat.fovy;
  return ret;
}


void Scene::SetNearFarPlanes(SceneData *param_1,float near,float far){
  Borg3Header *pBVar1 = ((param_1->scene[0].borg5)->dat).borg3P;
  if (pBVar1) {
    pBVar1->dat.nearplane = near;
    pBVar1->dat.farplane = far;
  }
}

float Scene::GetFarplane(SceneData *param_1){
  Borg3Header *pBVar1 = ((param_1->scene[0].borg5)->dat).borg3P;
  float ret = 16000.0f;
  if (pBVar1) ret = pBVar1->dat.farplane;
  return ret;
}

float Scene::GetNearplane(SceneData *param_1){
    Borg3Header *pBVar1 = ((param_1->scene[0].borg5)->dat).borg3P;
    float ret = 16.0f;
    if (pBVar1) ret = pBVar1->dat.nearplane;
    return ret;
}


void Ofunc_800a7e4c(SceneData *param_1,float param_2){
    Borg3Header *pBVar1 = ((param_1->scene[0].borg5)->dat).borg3P;
    if (pBVar1) pBVar1->dat.unk10 = param_2;
  }
  
float Ofunc_800a7e68(SceneData *param_1){
    Borg3Header *pBVar1 = ((param_1->scene[0].borg5)->dat).borg3P;
    float ret = 0.0f;
    if (pBVar1) ret = pBVar1->dat.unk10;
    return ret;
}

void Scene::SetAspectRatio(SceneData *param_1,float param_2){
    Borg3Header *pBVar1 = ((param_1->scene[0].borg5)->dat).borg3P;
    if (pBVar1) pBVar1->dat.aspect = param_2;
  }

float Scene::GetAspectRatio(SceneData *param_1){
    Borg3Header *pBVar1 = ((param_1->scene[0].borg5)->dat).borg3P;
    float ret = 1.3f;
    if (pBVar1) ret = pBVar1->dat.aspect;
    return ret;
}

void Ofunc_800a7ec0(SceneData *param_1,float param_2,float param_3,float param_4,float param_5){
  Borg3Header *pBVar1 = ((param_1->scene[0].borg5)->dat).borg3P;
  if (pBVar1) {
    s16* psVar2 = pBVar1->dat.unk18;
    psVar2[4] = (s16)(int)(param_2 + param_4 + param_2 + param_4);
    psVar2[5] = (s16)(int)(param_3 + param_5 + param_3 + param_5);
    *psVar2 = (s16)(int)((param_4 - param_2) + (param_4 - param_2));
    psVar2[1] = (s16)(int)((param_5 - param_3) + (param_5 - param_3));
  }
}

void Ofunc_800a7f48(SceneData *param_1,float param_2){
    Borg3Header *pBVar1 = ((param_1->scene[0].borg5)->dat).borg3P;
    if (pBVar1) pBVar1->dat.unk10 = param_2;
}
  
void Scene::SetFlag4(SceneData *param_1){param_1->flags|=SCENE_0004;}

void Scene::UnsetFlag4(SceneData *param_1){param_1->flags&=~SCENE_0004;}

void Scene::SetFlag8(SceneData *param_1){param_1->flags|=SCENE_0008;}

void Scene::UnsetFlag8(SceneData *param_1){param_1->flags&=~SCENE_0008;}

void Scene::SetFlag10(SceneData *param_1){param_1->flags|=SCENE_0010;}

void Scene::UnsetFlag10(SceneData *param_1){param_1->flags&=~SCENE_0010;}

void Scene::SetFlag20(SceneData *param_1){param_1->flags|=SCENE_0020;}

void Scene::UnsetFlag20(SceneData *param_1){param_1->flags&=~SCENE_0020;}

void Scene::SetFlag40(SceneData *param_1){param_1->flags|=SCENE_0040;}

void Scene::UnsetFlag40(SceneData *param_1){param_1->flags&=~SCENE_0040;}

void Scene::SetFlag80(SceneData *param_1){param_1->flags|=SCENE_0080;}

void Scene::UnsetFlag80(SceneData *param_1){param_1->flags&=~SCENE_0080;}

void Scene::SetFlag200(SceneData *param_1){param_1->flags|=SCENE_0200;}

void Scene::UnsetFlag200(SceneData *param_1){param_1->flags&=~SCENE_0200;}

void Ofunc_800a8060(SceneData *param_1,u8 b){param_1->perspNormIndex=b&1;}

void Scene::SetSpeed(SceneData *param_1,u8 spd){param_1->aniSpeed = spd;}

borg5substruct * Scene::Ofunc_800a8098(SceneData *param_1,s32 param_2){
  return ((param_1->scene[0].borg5)->dat).someSubstruct + param_2;
}


void FUN_800a80ac(SceneData *ani,vec3f *out,int i){
  borg5substruct *pbVar1 = ((ani->scene[0].borg5)->dat).someSubstruct;
  out->x = pbVar1[i].pos.x;
  out->y = pbVar1[i].pos.y;
  out->z = pbVar1[i].pos.z;
}


void FUN_800a80d8(SceneData *param_1,vec3f *param_2,int param_3){
  borg5substruct *pbVar1 = ((param_1->scene[0].borg5)->dat).someSubstruct;
  pbVar1[param_3].pos.x = param_2->x;
  pbVar1[param_3].pos.y = param_2->y;
  pbVar1[param_3].pos.z = param_2->z;
}


void Ofunc_800a8104(SceneData *param_1,int param_2,float param_3){
  if (-1 < param_2) {
    Borg5Header *pBVar1 = param_1->scene[0].borg5;
    if (param_2 < (pBVar1->dat).borg2Count) {
      (pBVar1->dat).borg2p[param_2]->dat->alpha = param_3;
    }
  }
}

void Scene::SetFogFlag(SceneData *param_1){param_1->flags|= SCENE_0100;}

void Scene::UnsetFogFlag(SceneData *param_1){param_1->flags&=~SCENE_0100;}

void Scene::SetFogColor(SceneData *param_1,s32 R,s32 G,s32 B,s32 A){
  CLAMP(R,0,255);
  CLAMP(G,0,255);
  CLAMP(B,0,255);
  CLAMP(A,0,255);
  (param_1->fogColor).R = R;
  (param_1->fogColor).G = G;
  (param_1->fogColor).B = B;
  (param_1->fogColor).A = A;
}

void Scene::SetFogPlane(SceneData *param_1,s32 fog,s32 farplane){
  CLAMP(fog,0,1000);
  CLAMP(farplane,0,1000);
  s32 iVar1 = farplane; // redo as dec?
  if (fog == farplane) {
    if (farplane - 1 < 0) {
      iVar1 = farplane + 1;
      param_1->fogMin = farplane;
    }
    else param_1->fogMin = farplane - 1;
  }
  else param_1->fogMin = fog;
  param_1->fogMax = iVar1;
}


void Ofunc_800a821c(SceneData *param_1,int param_2,int param_3,vec4f *param_4){
  astruct_3 *paVar1 = ((param_1->scene[0].borg5)->dat).borg2p[param_2]->dat->unk0x40;
  paVar1[param_3].unk4.x = param_4->x;
  paVar1[param_3].unk4.y = param_4->y;
  paVar1[param_3].unk4.z = param_4->z;
  if ((double)param_4->w != (double)0)
    paVar1[param_3].unk4.w = (float)(1.0 - (double)param_4->w);
  else paVar1[param_3].unk4.w = 1.0;
}

void Scene::SetFlag4000(SceneData *param_1){param_1->flags|=SCENE_4000;}

void Scene::UnsetFlag4000(SceneData *param_1){param_1->flags&=~SCENE_4000;}

void Scene::SetModelTint(SceneData *scene,u8 r,u8 g,u8 b,u8 a){
  (scene->colorFloats).r = (float)r / 255.0f;
  (scene->colorFloats).g = (float)g / 255.0f;
  (scene->colorFloats).b = (float)b / 255.0f;
  (scene->colorFloats).a = (float)a / 255.0f;
}

void Scene::SetLightData(SceneData *param_1){
  param_1->maxDynamicLights = 7;
  (param_1->envLight.l).col[0] = 0xff;
  (param_1->envLight.l).col[1] = 0xff;
  (param_1->envLight.l).col[2] = 0xff;
  (param_1->envLight.l).colc[0] = 0xff;
  (param_1->envLight.l).colc[1] = 0xff;
  (param_1->envLight.l).colc[2] = 0xff;
  param_1->currDynamicLights = 0;
  (param_1->envLight.l).pad1 = 0;
  (param_1->envLight.l).pad2 = 0;
  (param_1->envLight.l).dir[0] = 0;
  (param_1->envLight.l).dir[1] = 0;
  (param_1->envLight.l).dir[2] = 0;
  (param_1->envLight.l).pad3 = 0;
  param_1->flags = param_1->flags & ~SCENE_0080 | SCENE_8000;
}

void Scene::SceneSetMaxDynamicDirLights(SceneData *param_1,byte max){
  if (max > 7)
    CRASH("scenes.cpp, SceneSetMaxDynamicDirLights()","Max is larger than hardware limit of 7!"); 
  param_1->maxDynamicLights = (u32)max;
}

int Scene::LengthSquared(byte A,byte B,byte C){
  return SQ((u32)A)+SQ((u32)B)+SQ((u32)C);
}

s16 Scene::addDynamicLight(SceneData *param_1,s8 param_2,float X,float Y,float Z,u8 red,u8 green,u8 blue,s16 index){
  u32 uVar3;
  u32 uVar4;
  int iVar5;
  Light_t *pLVar6;
  s16 sVar7;
  s32 lVar10;
  s32 lVar11;
  s8 sVar14;
  int iVar9;
  
  uVar3 = param_1->currDynamicLights;
  if (param_1->currDynamicLights < param_1->maxDynamicLights) {
    sVar7 = (s16)param_1->currDynamicLights++;
  }
  else {
    //messy for-loop decomp. replace the furthest light object with the newest.
    lVar10 = -1;
    uVar3 = LengthSquared(red,green,blue);
    iVar9 = (int)index;
    s16 i = iVar9;
    if (i < (s16)param_1->maxDynamicLights) {
      pLVar6 = &param_1->DirLights[i].l;
      lVar11 = lVar10;
      for(;i<param_1->maxDynamicLights;i++){
        uVar4 = LengthSquared(pLVar6->colc[0],pLVar6->colc[1],pLVar6->colc[2]);
        lVar10 = i;
        if (uVar3 <= uVar4) {
          lVar10 = lVar11;
          uVar4 = uVar3;
        }
        uVar3 = uVar4;
        pLVar6++;
        lVar11 = lVar10;
      }
    }
    sVar7 = (s16)lVar10;
    if (lVar10 < 0) return -1;
    uVar3 = (u32)lVar10;
  }
  pLVar6 = &param_1->DirLights[uVar3].l;
  pLVar6->col[0] = 0;
  pLVar6->col[1] = 0;
  pLVar6->col[2] = 0;
  pLVar6->pad1 = 0;
  pLVar6->colc[0] = red;
  pLVar6->colc[1] = green;
  pLVar6->pad2 = 0;
  pLVar6->colc[2] = blue;
  pLVar6->dir[0] = X*120.0;
  pLVar6->dir[1] = Y*120.0;
  pLVar6->dir[1] = Z*120.0;
  pLVar6->pad3 = 0;
  return sVar7;
}

void Scene::SetLightColors(SceneData *param_1,u8 r,u8 g,u8 b){
  (param_1->envLight.l).col[0] = r;
  (param_1->envLight.l).col[1] = g;
  (param_1->envLight.l).col[2] = b;
  (param_1->envLight.l).pad1 = 0;
  (param_1->envLight.l).colc[0] = r;
  (param_1->envLight.l).colc[1] = g;
  (param_1->envLight.l).colc[2] = b;
  (param_1->envLight.l).pad2 = 0;
  (param_1->envLight.l).dir[0] = 0;
  (param_1->envLight.l).dir[1] = 0;
  (param_1->envLight.l).dir[2] = 0;
  (param_1->envLight.l).pad3 = 0;
}

bool Scene::HasLocator(SceneData *param_1,s32 param_2){
  if (param_2 < 8) return param_1->locators[param_2] != -1;
  return false;
}

bool Scene::SceneGetLocatorMtx(SceneData *ani,MtxF *mf,s32 i){
  MtxF afStack344;
  MtxF afStack280;
  MtxF afStack216;
  
  if (MAX_LOCATORS >= i){
  if (ani->locators[i] == -1){
    char errBuff [152];
    sprintf(errBuff,"Locator: %d is undefined for %s!\n",i,ani->borg5_char);
    CRASH("scene.cpp, SceneGetLocatorMtx()",errBuff);
  }
  else {
    Borg2Header *pbVar1 = ((ani->scene[0].borg5)->dat).borg2p[ani->locators[i]];
    guMtxIdentF(&afStack344);
    Borg2Data *pbVar2 = pbVar1->dat;
    guRotateRPYF(&afStack344,(pbVar2->rot).x * RadInDeg_f,
                     (pbVar2->rot).y * RadInDeg_f,
                     (pbVar2->rot).z * RadInDeg_f);
    guMtxIdentF(&afStack280);
    pbVar2 = pbVar1->dat;
    afStack280[3][0] = (pbVar2->pos).x;
    afStack280[3][1] = (pbVar2->pos).y;
    afStack280[3][2] = (pbVar2->pos).z;
    guMtxIdentF(mf);
    some_other_matrix_math(&afStack216,&afStack280,&afStack344);
    some_other_matrix_math(mf,&pbVar1->someMtx,&afStack216);
    (*mf)[0][0] /= pbVar1->dat->scale;
    (*mf)[1][0] /= pbVar1->dat->scale;
    (*mf)[2][0] /= pbVar1->dat->scale;
    (*mf)[0][1] /= pbVar1->dat->scale;
    (*mf)[1][1] /= pbVar1->dat->scale;
    (*mf)[2][1] /= pbVar1->dat->scale;
    (*mf)[0][2] /= pbVar1->dat->scale;
    (*mf)[1][2] /= pbVar1->dat->scale;
    (*mf)[3][0] *= (float)(1.0/16);
    (*mf)[3][1] *= (float)(1.0/16);
    (*mf)[2][2] /= pbVar1->dat->scale;
    (*mf)[3][2] *= (float)(1.0/16);
    return true;
  }
}
CRASH("scene.cpp, SceneGetLocatorMtx()","Locator is greater than MAX_LOCATORS");
}

bool Scene::SceneGetLocatorPos(SceneData *pScene,vec3f *pos,s32 param_3){
  Borg2Data *pbVar2;
  float fVar3;
  float fVar4;
  char acStack_90 [144];
  
  if (!pScene) CRASH("scene.cpp, SceneGetLocatorPos()","!pScene");
  if (MAX_LOCATORS < param_3) CRASH("scene.cpp, SceneGetLocatorPos()","Locator is greater than MAX_LOCATORS");
  if (pScene->locators[param_3] == -1) { //if you force roog into a fight, it will crash here.
    sprintf(acStack_90,"Locator: %d is undefined for %s!\n",param_3,pScene->borg5_char);
    CRASH("scene.cpp, SceneGetLocatorPos()",acStack_90);
  }
  Borg2Header *pModel = ((pScene->scene[0].borg5)->dat).borg2p[pScene->locators[param_3]];
  if (!pModel) CRASH("scene.cpp, SceneGetLocatorPos()","!pModel");
  pbVar2 = pModel->dat;
  guMtxXFMF(&pModel->someMtx,(pbVar2->pos).x,(pbVar2->pos).y,(pbVar2->pos).z,&pos->x,&pos->y,&pos->z);
  pos->x *= (float)(1.0/16);
  pos->y *= (float)(1.0/16);
  pos->z *= (float)(1.0/16);
  return true;
}

bool Scene::SceneGetLocatorNorm(SceneData *param_1,vec3f *out,s32 param_3){
  Borg2Header *pBVar1;
  Borg2Data *pbVar2;
  MtxF tempA,tempB;

  
  if (MAX_LOCATORS < param_3) CRASH("scene.cpp, SceneGetLocatorNorm()","Locator is greater than MAX_LOCATORS");
  if (param_1->locators[param_3] == -1) {
    char errBuff [144];
    sprintf(errBuff,"Locator: %d is undefined for %s!\n",param_3,param_1->borg5_char);
    CRASH("scene.cpp, SceneGetLocatorNorm()",errBuff);
  }
  Borg2Header *pBVar1 = ((param_1->scene[0].borg5)->dat).borg2p[param_1->locators[param_3]];
  guMtxIdentF(&tempA);
  pbVar2 = pBVar1->dat;
  guRotateRPYF(&tempA,(pbVar2->rot).x * RadInDeg_f,
                   (pbVar2->rot).y * RadInDeg_f,
                   (pbVar2->rot).z * RadInDeg_f);
  guMtxIdentF(&tempB);
  some_other_matrix_math(&tempB,&pBVar1->someMtx,&tempA);
  tempB[3][0] = 0.0;
  tempB[3][1] = 0.0;
  tempB[3][2] = 0.0;
  tempB[0][0] /=pBVar1->dat->scale;
  tempB[1][0] /=pBVar1->dat->scale;
  tempB[2][0] /=pBVar1->dat->scale;
  tempB[0][1] /=pBVar1->dat->scale;
  tempB[1][1] /=pBVar1->dat->scale;
  tempB[2][1] /=pBVar1->dat->scale;
  tempB[0][2] /=pBVar1->dat->scale;
  tempB[1][2] /=pBVar1->dat->scale;
  tempB[2][2] /=pBVar1->dat->scale;
  guMtxXFMF(&tempB,0.0,1.0f,0.0,&out->x,&out->y,&out->z);
  if (out->x == 0.0)out->x=1.0E-4f;
  if (out->y == 0.0)out->y=1.0E-4f;
  if (out->z == 0.0)out->z=1.0E-4f;
  return true;
}

bool Scene::SceneGetLocatorAlign(SceneData *param_1,vec3f *out,u32 param_3)

{
  Borg2Header *pBVar1;
  Borg2Data *pbVar2;
  float fVar3;
  MtxF mtxA,mtxB;
  
  
  if (MAX_LOCATORS < (int)param_3)// oops, copy-paste oversight
         CRASH("scene.cpp, SceneGetLocatorNorm()","Locator is greater than MAX_LOCATORS");
  if (param_1->locators[param_3] == -1) {
    char errrBuff [144];
    sprintf(errrBuff,"Locator: %d is undefined for %s!\n",param_3,param_1->borg5_char);
    CRASH("scene.cpp, SceneGetLocatorAlign()",errrBuff);
  }
  pBVar1 = ((param_1->scene[0].borg5)->dat).borg2p[param_1->locators[param_3]];
  guMtxIdentF(&mtxA);
  pbVar2 = pBVar1->dat;
  guRotateRPYF(&mtxA,(pbVar2->rot).x * RadInDeg_f,(pbVar2->rot).y * RadInDeg_f,(pbVar2->rot).z * RadInDeg_f);
  guMtxIdentF(&mtxB);
  some_other_matrix_math(&mtxB,&pBVar1->someMtx,&mtxA);
  mtxB[3][0] = 0.0;
  mtxB[3][1] = 0.0;
  mtxB[3][2] = 0.0;
  mtxB[0][0] /=pBVar1->dat->scale;
  mtxB[1][0] /=pBVar1->dat->scale;
  mtxB[2][0] /=pBVar1->dat->scale;
  mtxB[0][1] /=pBVar1->dat->scale;
  mtxB[1][1] /=pBVar1->dat->scale;
  mtxB[2][1] /=pBVar1->dat->scale;
  mtxB[0][2] /=pBVar1->dat->scale;
  mtxB[1][2] /=pBVar1->dat->scale;
  mtxB[2][2] /=pBVar1->dat->scale;
  guMtxXFMF(&mtxB,0.0,0.0,-1.0f,&out->x,&out->y,&out->z);
  if (out->x == 0.0)out->x=1.0E-4f;
  if (out->y == 0.0)out->y=1.0E-4f;
  if (out->z == 0.0)out->z=1.0E-4f;
  return true;
}

void Scene::CopyMatrixA(SceneData *param_1,MtxF* param_2){COPY(param_1->matrixA,param_2);}

void Scene::SetParticleHead(SceneData *param_1,ParticleHeadStruct *param_2){param_1->particleHead = param_2;}

void Ofunc_800a8e80(SceneData *param_1,SceneData *param_2){param_1->locatorScene1 = param_2;}

void Ofunc_800a8e88(SceneData *param_1,SceneData *param_2){param_1->locatorScene2 = param_2;}

bool Scene::Rotate(SceneData *param_1,vec3f *posOut,vec3f *aimOut,vec3f *param_4)

{
  borg5substruct *pbVar1;
  MtxF mf;
  vec3f v3A,v3b;
  
  pbVar1 = ((param_1->scene[0].borg5)->dat).someSubstruct;
  if (pbVar1) {
    posOut->x = (pbVar1->pos).x;
    posOut->y = (pbVar1->pos).y;
    posOut->z = (pbVar1->pos).z;
    v3A.x = 0.0;
    v3A.y = 0.0;
    v3A.z = 1.0;
    guRotateRPYF(&mf,(pbVar1->rot).y,(pbVar1->rot).x,0.0);
    MtxXFMF(&v3b,&mf,&v3A);
    aimOut->x = posOut->x - v3b.x;
    aimOut->y = posOut->y - v3b.y;
    v3A.x = 0.0;
    v3A.y = 1.0;
    v3A.z = 0.0;
    aimOut->z = posOut->z - v3b.z;
    guRotateRPYF(&mf,0.0,0.0,(pbVar1->rot).z);
    MtxXFMF(&v3b,&mf,&v3A);
    param_4->x = v3b.x;
    param_4->y = v3b.y;
    param_4->z = v3b.z;
  }
  return pbVar1 != NULL;
}

