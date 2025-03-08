#include "globals.h"

void InitLight_(voxelObject* light,vec3f *pos,float size,u16 type,float f1,Color32 colB,Color32 colC){
  CLEAR(light);
  (light->header).type = VOXEL_Light;
  (light->header).Bitfeild = VOXEL_Active;
  copyVec3(pos,&(light->header).pos);
  (light->light).lightType = type;
  (light->header).size = size;
  (light->light).cols[1] = colB;
  (light->light).cols[2] = colC;
  switch((light->light).lightType){
    case 0:
      (light->light).cols[0] = (light->light).cols[1];
      return;
    case 1:
    case 2:
    case 3:
     (light->light).f1 = f1;
     return;
    default:
      CRASH("InitLight","Unknown Light Type");
  }
}

void color_magnitude(Color32 *param_1,Color32 *param_2,float amp){
  CLAMP01(amp);
  param_2->R +=(param_1[1].R - param_1->R) * amp;
  param_2->G +=(param_1[1].G - param_1->G) * amp;
  param_2->B +=(param_1[1].B - param_1->B) * amp;
  param_2->A +=(param_1[1].A - param_1->A) * amp;
}

float FUN_80054ba4(float x,float y){
  if (x < 0.0) x += y;
  if (y < x) x -= y;
  return x;
}

void color_XOR(Color32 *colA,Color32 *colB){
  u8 temp = colA->R ^ colB->R;
  colA->R = temp;
  temp = colB->R ^ temp;
  colB->R = temp;
  colA->R = colA->R ^ temp;
  temp = colA->G ^ colB->G;
  colA->G = temp;
  temp = colB->G ^ temp;
  colB->G = temp;
  colA->G = colA->G ^ temp;
  temp = colA->B ^ colB->B;
  colA->B = temp;
  temp = colB->B ^ temp;
  colB->B = temp;
  colA->B = colA->B ^ temp;
  temp = colA->A ^ colB->A;
  colA->A = temp;
  temp = colB->A ^ temp;
  colB->A = temp;
  colA->A = colA->A ^ temp;
}

void tint_color_with_screenfade(Color32 *param_1,float fade){
  param_1->R*=fade;
  param_1->G*=fade;
  param_1->B*=fade;
  param_1->A*=fade;
}

void Ofunc_80054db0(voxelObject* param_1,u16 param_2){(param_1->header).Bitfeild |= param_2;}
void Ofunc_80054dc0(voxelObject* param_1,u16 param_2){(param_1->header).Bitfeild &= ~param_2;}


void InitLight(AnimationData *aniDat,Borg9data *borg9,vec3f *pos,voxelObject *light,s16 count,
              s16 delta){
  u16 VVar1;
  u16 uVar2;
  void *pvVar3;
  bool bVar6;
  Color32 *pCVar7;
  Color32 *pCVar8;
  Color32 *pCVar9;
  Color32 *pCVar10;
  Color32 *colA;
  Color32 *colB;
  float fVar11;
  float fVar12;
  float fVar13;
  s8 sVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  vec3f local_90 [5];
  int count_;
  int delta_;
  s16 i;
  Color32 *local_44;
  

  i = 0;
  count_ = (int)count;
  delta_ = (int)delta;
  if (0 < count) {
    pCVar10 = (light->light).cols;
    pCVar9 = (light->light).cols + 1;
    colB = (light->light).cols + 2;
    pCVar8 = pCVar10;
    pCVar7 = pCVar9;
    colA = pCVar9;
    local_44 = pCVar10;
    do {
      if (((((light->header).type == VOXEL_Light) &&
           (((light->header).Bitfeild & VOXEL_Active))) &&
          ((pvVar3 = (light->header).ptr0x24, pvVar3 == NULL || (*(short *)((int)pvVar3 + 6) < 1))))
         && ((((light->header).Bitfeild & VOXEL_FlagB) == 0 ||
             (!CheckCollision(borg9,&light->header.pos,pos,(float)0.25,NULL,NULL,1))))) {
        fVar11 = vec3_proximity(pos,&light->header.pos);
        fVar12 = (light->header).size;
        if (fVar11 < fVar12) {
          fVar12 = (fVar12 - fVar11) / fVar12;
          if ((light->header).timestamp < gGlobals.ticker) {
            (light->header).timestamp = gGlobals.ticker;
            switch((light->light).lightType){
            case 1: {
              fVar11 = (light->light).f0 +
                       (1.0 / ((light->light).f1 * 30.0f)) * (float)delta_;
              (light->light).f0 = fVar11;
              if (1.0 < fVar11) color_XOR(colA,colB);
              (light->light).f0 = FUN_80054ba4((light->light).f0,1.0f);
              color_magnitude((light->light).cols + 1,local_44,(light->light).f0);
              break;
            }
            case 0:{
              (light->light).cols[0] = (light->light).cols[1];
              break;
            }
            case 2: {
              fVar16 = (float)((double)(light->light).f0 +
                              (360.0 / (double)((light->light).f1 * 60.0f)) *
                              (double)delta_);
              (light->light).f0 = fVar16;
              fVar11 = FUN_80054ba4(fVar16,360.0f);
              fVar16 = fVar11 * dtor;
              (light->light).f0 = fVar11;
              color_magnitude(pCVar7,pCVar8,(__sinf(fVar16) + 1.0) * 0.5f);
              break;
            }
            case 3:{
              fVar15 = (light->light).f1;
              fVar16 = (light->light).f0;
              fVar17 = (light->light).f2;
              fVar18 = fVar16 - fVar17;
              fVar11 = (float)delta_;
              fVar13 = (1.0 / (fVar15 * 60.0f)) * fVar11;
              if (fVar18 < 0.0) {
                if (fVar13 <= -fVar18) goto LAB_800550e8;
LAB_800550d0:
                (light->light).f0 = fVar17;
                fVar11 = RAND.GetFloatRange(0.0,1.0);
                (light->light).f2 = fVar11;
              }
              else {
                if (fVar18 < fVar13) goto LAB_800550d0;
LAB_800550e8:
                if (fVar17 < fVar16) {
                  fVar16 -= (1.0 / (fVar15 * 60.0f)) * fVar11;
                }
                else {
                  fVar16 += (1.0 / (fVar15 * 60.0f)) * fVar11;
                }
                (light->light).f0 = fVar16;
              }
              color_magnitude(pCVar9,pCVar10,(light->light).f0);
              break;
            }
            default:{
                Gsprintf("Unknown Light Type: %d\n",(light->light).lightType);
                CRASH("InitLight",gGlobals.text);
            }
            }
            tint_color_with_screenfade((light->light).cols,fVar12);
          }
          if (((light->header).Bitfeild & 1) == 0) {
            Vec3_sub(local_90,&light->header.pos,pos);
          }
          else {
            Vec3_sub(local_90,&gGlobals.Sub.camera.pos,pos);
          }
          vec3_normalize(local_90);
          tint_color_with_screenfade((light->light).cols,gGlobals.brightness);

          Animation::addDynamicLight(aniDat,fVar12 * 250.0f,local_90[0].x,local_90[0].y,local_90[0].z,
                     (light->light).cols[0].R,(light->light).cols[0].G,(light->light).cols[0].B,
                     light_count);
        }
      }
      pCVar10 = pCVar10 + 0x1b;
      pCVar9 = pCVar9 + 0x1b;
      pCVar8 = pCVar8 + 0x1b;
      pCVar7 = pCVar7 + 0x1b;
      colB = colB + 0x1b;
      colA = colA + 0x1b;
      light = light + 1;
      local_44 = local_44 + 0x1b;
      i++;
    } while (i < count_);
  }
  return;
}

void light_init_func(playerData *param_1,AnimationData *param_2,s16 param_3){
  
  
  Borg9data *b9C = GetCollisionZone(param_1->zoneDatByte);
  if (b9C) {
    s16 x,y;
    vec3f* pos = &(param_1->collision).pos;
    getZonePositionShorts(b9C,pos,&x,&y);
    borg_9_struct *b9S = borg9_get_unkStruct(b9C,x,y);
    if ((param_1->visible_flag) && (b9S->lightCount)) {
      for(s16 i=0;i<b9S->lightCount;i++){
        voxelObject* light = &b9C->voxelObjs[b9S->lightIndecies[i]];
        if ((light->header).type == VOXEL_Light) {
          InitLight(param_2,b9C,pos,light,1,param_3);
        }
      }
    }
  }
}

void passto_initLight(AnimationData *param_1,Borg9data *param_2,voxelObject *param_3,s16 param_4)
  {InitLight(param_1,param_2,&param_3->header.pos,param_2->voxelObjs,param_2->voxelObjCount,param_4);}

void passto_InitLight_2(DynamicLightHead *param_1,AnimationData *param_2,voxelObject *param_3,s16 param_4)
  {InitLight(param_2,gGlobals.Sub.borg9DatPointer,&param_3->header.pos,param_1->lights,16,param_4);}

void init_dynamic_light(DynamicLightHead *param_1){
  s16 (*pasVar1) [4];
  s16 (*pasVar2) [4];
  s16 (*ppasVar3) [4];
  s16 iVar3;
  s16 *psVar5;
  
  CLEAR(param_1);
  iVar3 = 0;
  ppasVar3 = (s16 (*) [4])&param_1->lights[0].header.ptr0x24;
  pasVar1 = param_1->shortsA;
  param_1->initFlag = 1;
  psVar5 = param_1->shortsB;
  pasVar2 = pasVar1;
  for(iVar3=0;iVar3 < 0x10;iVar3++) {
    *(s16 (**) [4])*ppasVar3 = pasVar2;
    ppasVar3 = (s16 (*) [4])(ppasVar3[0xd] + 2);
    pasVar2 = pasVar2[1];
    param_1->shortsB[iVar3] = (s16)iVar3;
    (*pasVar1)[0] = (s16)iVar3;
    pasVar1 = pasVar1[1];
    psVar5++;
  }
}

void dynamic_lights_free_all(DynamicLightHead *param_1){
  void **ppvVar2 = &param_1->lights[0].header.ptr0x24;
  param_1->initFlag = 0;
  for(s16 iVar1=0;iVar1<16;iVar1++) {
    if (*(s16 *)((s32)*ppvVar2 + 2) != 0) {FreeDynamicLight(param_1,(s16)*ppvVar2);}
    ppvVar2 = ppvVar2 + 0x1b;
  }
  return;
}

//This only seems to be used with the exploding chest.
voxelObject*  AllocDynamicLight(DynamicLightHead *param_1,u16 param_2,vec3f *pos,float size,u16 type,
                 float f1,Color32 colb,Color32 colc){
  
  if (param_1->dynamicLightCount >= 0x10) CRASH("AllocDynamicLight","Out of Dynamic Lights");
    voxelObject* l = param_1->lights[param_1->dynamicLightCount];
    void *v = (l->header).ptr0x24;
    param_1->dynamicLightCount++;
    *(u16 *)((s32)v + 2) = 1;
    *(u16 *)((s32)v + 4) = param_2;
    InitLight_(l,pos,size,type,f1,colb,colc);
    (l->header).ptr0x24 = v;
    return l;
}

void FreeDynamicLight(DynamicLightHead *param_1,s16 param_2){  
  void *pvVar1 = param_1->lights[param_2].header.ptr0x24;
  if (param_1->dynamicLightCount < 1) CRASH("FreeDynamicLight","Trying to free too many lights!");
  *(u16 *)((s32)pvVar1 + 4) = 0;
  *(u16 *)((s32)pvVar1 + 2) = 0;
  param_1->lights[param_2].header.Bitfeild = 0;
  param_1->shortsB[--param_1->dynamicLightCount] = param_2;
}

void FUN_800556f4(DynamicLightHead *param_1,s16 param_2){
  u16 *puVar1;
  s32 iVar2;
  void **ppvVar3;
  s32 iVar4;
  
  for(s16 iVar2=0;iVar2<16;iVar2++) {
    void **ppvVar3 = &param_1->lights[iVar2].header.ptr0x24;
    puVar1 = (u16 *)*ppvVar3;
    if (puVar1[1] != 0) {
      if ((s16)puVar1[3] < 1) {
        if ((0 < (s16)puVar1[2]) &&
           (iVar2 = (u32)(u16)puVar1[2] - (s32)param_2, puVar1[2] = (s16)iVar2,
           iVar2 * 0x10000 < 1)) {
          FreeDynamicLight(param_1,*puVar1);
        }
      }
      else {
        iVar2 = (u32)(u16)puVar1[3] - (s32)param_2;
        puVar1[3] = (s16)iVar2;
        if (iVar2 * 0x10000 < 0) {puVar1[3] = 0;}
      }
    }
  }
}

