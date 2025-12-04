#include "globals.h"

void InitLight_(voxelObject* vox,vec3f *pos,float size,u16 type,float f1,u32 colB,u32 colC){
  CLEAR(vox);
  vox->header.type = VOXEL_Light;
  vox->header.Bitfeild = VOXEL_Active;
  Vec3Copy(pos,&(vox->header).pos);
  vox->light.lightType = type;
  vox->header.size = size;
  vox->light.cols[1].W = colB;
  vox->light.cols[2].W = colC;
  switch(vox->light.lightType){
    case Light_Static:
      (vox->light).cols[0] = (vox->light).cols[1];
      return;
    case Light_Alternate:
    case Light_Sine:
    case Light_Random:
     vox->light.f1 = f1;
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

extern u16 light_count;
void InitLight(SceneData *scene,Borg9Data *borg9,vec3f *pos,voxelObject *lightObj,s16 count,
              s16 delta){
  for(s16 i=0;i<count;i++,lightObj++){
    if(((lightObj->header.type == VOXEL_Light) && (lightObj->header.Bitfeild & VOXEL_Active))){
     if(((lightObj->header).ptr0x24 == NULL || ((dynaLightEntry*)lightObj->header.ptr0x24)->timer < 1)){
      if(((lightObj->header).Bitfeild & VOXEL_FlagB) == 0 ||(!CheckCollision(borg9,&lightObj->header.pos,pos,(float)0.25,NULL,NULL,1))){
       float prox=Vec3Dist(pos,&lightObj->header.pos);
       float size=lightObj->header.size;
       if(prox<size){
        size=(size-prox)/prox;
        if(lightObj->header.timestamp<gGlobals.ticker){
         lightObj->header.timestamp=gGlobals.ticker;
         switch((lightObj->light).lightType){
              case Light_Static:{
                (lightObj->light).cols[0] = (lightObj->light).cols[1];
                break;
              }
              case Light_Alternate: {
              (lightObj->light).f0 +=(1.0 / ((lightObj->light).f1 * 30.0f)) * (float)delta;;
              if (1.0 < (lightObj->light).f0) color_XOR(&(lightObj->light).cols[1],&(lightObj->light).cols[2]);
              (lightObj->light).f0 = FUN_80054ba4((lightObj->light).f0,1.0f);
              color_magnitude((lightObj->light).cols + 1,(lightObj->light).cols,(lightObj->light).f0);
              break;
            }
            case Light_Sine: {
              (lightObj->light).f0 = ((lightObj->light).f0 +
                              (360.0 / ((lightObj->light).f1 * 60.0f)) *delta);
              float fVar11 = FUN_80054ba4((lightObj->light).f0,360.0f);
              float fVar16 = fVar11 * dtor;
              (lightObj->light).f0 = fVar11;
              color_magnitude((lightObj->light).cols + 1,(lightObj->light).cols,(__sinf(fVar16) + 1.0) * 0.5f);
              break;
            }
            case Light_Random:{
              float fVar15 = (lightObj->light).f1;
              float fVar16 = (lightObj->light).f0;
              float fVar17 = (lightObj->light).f2;
              float fVar18 = fVar16 - fVar17;
              float fVar11 = (float)delta;
              float fVar13 = (1.0 / (fVar15 * 60.0f)) * fVar11;
              if (fVar18 < 0.0) {
                if (fVar13 <= -fVar18) goto LAB_800550e8;
LAB_800550d0:
                (lightObj->light).f0 = fVar17;
                fVar11 = RAND.GetFloatRange(0.0,1.0);
                (lightObj->light).f2 = fVar11;
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
                (lightObj->light).f0 = fVar16;
              }
              color_magnitude((lightObj->light).cols + 1,(lightObj->light).cols,(lightObj->light).f0);
              break;
            }
            default:{
                Gsprintf("Unknown Light Type: %d\n",(lightObj->light).lightType);
                CRASH("InitLight",gGlobals.text);
            }
            }
          tint_color_with_screenfade((lightObj->light).cols,size);
          }
          vec3f v3Dist;
          if (((lightObj->header).Bitfeild & 1) == 0) Vec3Sub(&v3Dist,&lightObj->header.pos,pos);
          else Vec3Sub(&v3Dist,&gCamera.pos,pos);
          Vec3Normalize(&v3Dist);
          tint_color_with_screenfade((lightObj->light).cols,gGlobals.brightness);
          Scene::addLight(scene,size * 250.0f,v3Dist.x,v3Dist.y,v3Dist.z,
                     (lightObj->light).cols[0].R,(lightObj->light).cols[0].G,(lightObj->light).cols[0].B,
                     light_count);
        }
      }
     }
    }
   }
}

void light_init_func(playerData *param_1,SceneData *param_2,s16 param_3){
  Borg9Data *b9C = GetCollisionZone(param_1->zoneDatByte);
  if (b9C) {
    s16 x,y;
    vec3f* pos = &(param_1->collision).pos;
    getZonePositionShorts(b9C,pos,&x,&y);
    CollideSection *b9S = getCollideSection(b9C,x,y);
    if ((param_1->visible_flag) && (b9S->voxelSceneCount)) {
      for(s16 i=0;i<b9S->voxelSceneCount;i++){
        voxelObject* light = &b9C->voxelObjs[b9S->lightIndecies[i]];
        if ((light->header).type == VOXEL_Light) {
          InitLight(param_2,b9C,pos,light,1,param_3);
        }
      }
    }
  }
}

void passto_initLight(SceneData *param_1,Borg9Data *param_2,voxelObject *param_3,s16 param_4)
  {InitLight(param_1,param_2,&param_3->header.pos,param_2->voxelObjs,param_2->voxelObjCount,param_4);}

void passto_InitLight_2(DynamicLightHead *param_1,SceneData *param_2,voxelObject *param_3,s16 param_4)
  {InitLight(param_2,gGlobals.gameVars.borg9DatPointer,&param_3->header.pos,param_1->lights,16,param_4);}

void init_dynamic_light(DynamicLightHead *param_1){
  CLEAR(param_1);
  param_1->initFlag = 1;
  for(s16 i=0;i < 16;i++) {
    dynaLightEntry* p=&param_1->shortsA[i];
    param_1->lights[i].header.ptr0x24=(void*)p;
    p->index=i;
    param_1->shortsB[i]=i;
  }
}

void dynamic_lights_free_all(DynamicLightHead *param_1){
  param_1->initFlag = 0;
  for(s16 i=0;i<16;i++) {
    dynaLightEntry* p=(dynaLightEntry*)&param_1->lights[i].header.ptr0x24;
    if(p->active) {FreeDynamicLight(param_1,p->index);}
  }
}

//This only seems to be used with the exploding chest.
voxelObject*  AllocDynamicLight(DynamicLightHead *param_1,u16 param_2,vec3f *pos,float size,u16 type,
                 float f1,u32 colb,u32 colc){
  
  if (param_1->dynamicLightCount >= 0x10) CRASH("AllocDynamicLight","Out of Dynamic Lights");
    voxelObject* l = &param_1->lights[param_1->dynamicLightCount];
    dynaLightEntry* p=(dynaLightEntry*)(l->header).ptr0x24;
    param_1->dynamicLightCount++;
    p->active = true;
    p->lifespan = param_2;
    InitLight_(l,pos,size,type,f1,colb,colc);
    (l->header).ptr0x24 = p;
    return l;
}

void FreeDynamicLight(DynamicLightHead *param_1,s16 param_2){  
  dynaLightEntry* p=(dynaLightEntry*)param_1->lights[param_2].header.ptr0x24;
  if (param_1->dynamicLightCount < 1) CRASH("FreeDynamicLight","Trying to free too many lights!");
  p->lifespan = 0;
  p->active = 0;
  param_1->lights[param_2].header.Bitfeild = 0;
  param_1->shortsB[--param_1->dynamicLightCount] = param_2;
}

void DymanicLightTimers(DynamicLightHead *param_1,s16 delta){
  
  for(s16 i=0;i<16;i++) {
    dynaLightEntry* p=(dynaLightEntry*)param_1->lights[i].header.ptr0x24;
    if (p->active) {
      if (p->timer < 1) {
        if (0 < p->lifespan){
          p->lifespan-=delta;
          if(p->lifespan<1) FreeDynamicLight(param_1,p->index);
        }
      }
      else {
        p->timer-=delta;
        FLOOR(p->timer,0);
      }
    }
  }
}

