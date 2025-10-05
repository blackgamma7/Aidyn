#include "globals.h"
//Script for chest explosion particles (and the sole use of dynamic lighting)

extern voxelObject*  AllocDynamicLight(DynamicLightHead *param_1,u16 param_2,vec3f *pos,float size,u16 type,
                 float f1,Color32 colb,Color32 colc);

void chest_explode_particles(voxelObject *chest,float height,vec4f *color,u16 param_4,short param_5,short count
               ,float randHi,float randLo,float param_9,short addLight) {
  ParticleEmmiter *pEmmi = Particle::AllocParticleEmitter
                    (&gGlobals.gameVars.particleEmmiter,param_4,param_5,0,NULL,NULL,NULL,NULL,NULL);
  if (pEmmi) {
    Particle::SetEmmiterHeight(pEmmi,height);
    Particle_s *pPVar1 = pEmmi->particles;
    Particle::SetFlag(pPVar1,0x100);
    Particle::SetColorB(pPVar1,0.0,param_9,0.0,1.0f);
    pPVar1 = Particle::FUN_800b27cc(&gGlobals.gameVars.particleEmmiter,pEmmi,param_4);
    Particle::SetFlag(pPVar1,0x200);
    Particle::SetColorB(pPVar1,color->x,color->y,color->z,color->w);
    negVec4(&pPVar1->colorB);
    multiVec4(&pPVar1->colorB,Particle::OneOverLifespan(pPVar1));
    for(s16 i=0;i<count;i++){
        pPVar1 = Particle::FUN_800b277c(&gGlobals.gameVars.particleEmmiter,pEmmi,param_4);
        Particle::SetScale(pPVar1,0.25,0.25);
        Particle::SetPos(pPVar1,(chest->header).pos.x,(chest->header).pos.y,(chest->header).pos.z);
        Particle::SetColorA(pPVar1,color->x,color->y,color->z,color->w);
        RAND.GetVec3(&pPVar1->vel,RAND.GetFloatRange(randHi,randLo));
    }
    if (addLight) {
      AllocDynamicLight(&gGlobals.gameVars.DynamicLights,0x78,&chest->header.pos,10.0,1,4.0f,
                        (Color32)0xff800000,(Color32)0x0);
    }
  }
}

//these two seem to be for an unused rising smoke plume?

void ofunc_sub_8001ae04(ParticleHeadStruct *param_1,ParticleEmmiter *emmi) {
  Particle_s *p;
  vec3f *v3;
  vec3f *pos;
  float fVar1;
  float fVar2;
  
  pos = (vec3f *)emmi->object;
  if ((emmi->flags & 0x2000)) pos = &(emmi->collision).pos;
  p = Particle::FUN_800b277c(param_1,emmi,0x78);
  Particle::SetScale(p,0.25f,0.25f);
  Particle::SetPos(p,pos->x + (emmi->vel).x,pos->y + (emmi->vel).y,
                   pos->z + (emmi->vel).z);
  Particle::SetColorA(p,(emmi->colvec4).x,(emmi->colvec4).y,(emmi->colvec4).z,
                      (emmi->colvec4).w);
  RAND.GetVec3(&p->vel,RAND.GetFloatRange(0.01,0.02));
  vec3_sum(&p->vel,&TerrainPointer->windVelocity,&p->vel);
  fVar2 = pos->y + emmi->unk40;
  fVar1 = emmi->height;
  if (fVar2 <= emmi->height) {
    fVar1 = fVar2;
  }
  emmi->height = fVar1;
}


void Ofunc_8001af40(container_Dat *param_1,vec3f *param_2,vec4f *param_3,float param_4,
                   u16 param_5,short param_6,float param_7) {
  
  ParticleEmmiter *emmi = Particle::AllocParticleEmitter
                     (&gGlobals.gameVars.particleEmmiter,param_5,param_6,0,NULL,ofunc_sub_8001ae04,NULL,
                      param_1,NULL);
  if (emmi) {
    Particle::SetEmmiterHeight(emmi,(param_1->chestSize - 0.5));
    copyVec4(param_3,&emmi->colvec4);
    copyVec3(param_2,&emmi->vel);
    Particle_s *part = emmi->particles;
    emmi->unk40 = param_4;
    Particle::SetFlag(part,0x100);
    Particle::SetColorB(part,0.0,param_7,0.0,1.0f);
    part = Particle::FUN_800b27cc(&gGlobals.gameVars.particleEmmiter,emmi,param_5);
    Particle::SetFlag(part,0x200);
    Particle::SetColorB(part,param_3->x,param_3->y,param_3->z,param_3->w);
    multiVec4(&part->colorB,(-1.0f/120));
  }
}


void FUN_8001b0a8(ParticleHeadStruct *param_1,ParticleEmmiter *param_2) {
  Particle_s *p;
  vec3f *pos;
  vec4f v4;
  vec2f v2;
  voxelObject *obj;
  
  p = Particle::FUN_800b277c(param_1,param_2,param_2->unk1a);
  Particle::SetScale(p,0.1f,0.1f);
  vec3f *pos = &param_2->pos;
  if ((param_2->flags & 0x2000)) pos = &(param_2->collision).pos;
  voxelObject *obj = (voxelObject *)param_2->object;
  if (obj) {
    if (((dynaLightEntry*)(obj->header).ptr0x24)->active == 0) {
      param_2->object = NULL;
    }
    else copyVec3(pos,&obj->header.pos);
  }
  copyVec3(pos,&p->pos);
  RAND.GetVec2(&v2,RAND.GetFloat0ToX((param_2->vel).x));
  (p->pos).x += v2.x;
  (p->pos).z += v2.y;
  RAND.GetVec2(&v2,RAND.GetFloat0ToX((param_2->vel).z));
  Particle::SetVel(p,v2.x,RAND.GetFloat0ToX((param_2->vel).y / (float)(int)param_2->unk1a),v2.y);
  copyVec4(&param_2->colvec4,&p->colorA);
  v4.x = RAND.GetFloat0ToX((param_2->field20_0x54).x / (float)(int)param_2->unk1a);
  v4.y = RAND.GetFloat0ToX((param_2->field20_0x54).y / (float)(int)param_2->unk1a);
  v4.z = RAND.GetFloat0ToX((param_2->field20_0x54).z / (float)(int)param_2->unk1a);
  v4.w = RAND.GetFloat0ToX((param_2->field20_0x54).w / (float)(int)param_2->unk1a);
  copyVec4(&v4,&p->colorB);
  p->unk4 = p->id;
  Particle::SetFlag(p,0x200);
}


ParticleEmmiter *
FUN_8001b29c(vec3f *param_1,u16 param_2,short param_3,u16 param_4,short param_5,float param_6
            ,vec4f *param_7,vec4f *param_8,vec4f *param_9,vec3f *param_10) {

  ParticleEmmiter *emmi = Particle::AllocParticleEmitter
                     (&gGlobals.gameVars.particleEmmiter,param_2,param_3,param_4,NULL,FUN_8001b0a8,NULL,NULL,NULL);
  if (emmi == NULL) emmi = NULL;
  else {
    copyVec3(param_1,&emmi->pos);
    copyVec4(param_7,&emmi->colvec4);
    copyVec4(param_9,&emmi->field20_0x54);
    copyVec3(param_10,&emmi->vel);
    Particle_s *part = emmi->particles;
    emmi->unk1a = param_5;
    Particle::SetFlag(part,0x100);
    Particle::SetColorB(part,0.0,6e-05,0.0,1.0f);
    part = Particle::FUN_800b27cc(&gGlobals.gameVars.particleEmmiter,emmi,param_2);
    Particle::SetFlag(part,0x400);
    float gray = param_6 / param_5;
    Particle::SetColorB(part,gray,gray,gray,0.0);
    part = Particle::FUN_800b27cc(&gGlobals.gameVars.particleEmmiter,emmi,param_2);
    Particle::SetFlag(part,0x200);
    float dVar3 = -1.0 / param_5;
    Vec4_sub(&part->colorB,param_7,param_8);
    multiVec4(&part->colorB,dVar3);
  }
  return emmi;
}

void alloc_explosion_light(vec3f *pos,float param_2,u16 param_3,bool moving) {
  ParticleEmmiter *pPVar1;
  vec4f afStack560;
  vec4f afStack496;
  vec4f afStack432;
  vec3f afStack368;
  vec3f afStack304;
  vec2f local_70;
  
  setVec4(&afStack560,1.0f,1.0f,0.0,1.0f);
  setVec4(&afStack496,0.5,0.0,0.0,0.0);
  setVec4(&afStack432,0.2,0.1,0.0,0.0);
  setVec3(&afStack304,0.05,0.4,0.0025);
  setVec3(&afStack368,0.25f,0.0,0.25f);
  pPVar1 = FUN_8001b29c(pos,param_3,2,0xfffe,0x78,param_2,&afStack560,&afStack496,&afStack432,
                        &afStack304);
  if (pPVar1) {
    if (moving) {
      Particle::SetEmmiterFlags(pPVar1,0x2000);
      copyVec3(pos,&(pPVar1->collision).pos);
      RAND.GetVec2(&local_70,0.036);
      setVec3(&(pPVar1->collision).vel,local_70.x,0.12,local_70.y);
    }
    pPVar1->object = AllocDynamicLight(&gGlobals.gameVars.DynamicLights,param_3,pos,5.0,3,0.75f,
                               (Color32)0x60000000,(Color32)0xffff0000);
  }
}
void Ofunc_8001b688(vec3f *pos,vec2f *param_2,u16 param_3) {
  vec4f v4A [4];
  vec4f v4B [4];
  vec4f v4C [4];
  vec3f v3B [5];
  vec3f v3A [5];
  vec3f local_88;
  
  setVec4(v4A,0.0,1.0f,0.8,1.0f);
  setVec4(v4B,0.4f,0.0,0.4f,0.0);
  setVec4(v4C,0.6,0.3,0.2,0.0);
  setVec3(v3A,0.5,1.0f,0.0);
  setVec3(v3B,0.0,0.0,0.0);
  copyVec3(pos,&local_88);
  for(s16 i=0;i<12;i++){
    local_88.x = (local_88.x - param_2->x * 0.75);
    local_88.z = (local_88.z - param_2->y * 0.75);
    FUN_8001b29c(&local_88,param_3,0,0,90,1.5f,v4A,v4B,v4C,v3A);
  }
}

void UNK_NOOP(void *param_1,u16 param_2){
    u8 unk[0x130]; //the only remaining instructions are allocating this ammount to stack.
}

void FUN_8001b888(ParticleHeadStruct *param_1,vec3f *param_2) {
  for(s16 i=0;i<ParticleEmmiMAX;i++){
    ParticleEmmiter *emmi = &param_1->Emmiter[i];
    Particle_s *part = emmi->particles;
    if (0 < emmi->lifespan) {
      while (part) {
        vec3_sum(&part->pos,&part->pos,param_2);
        if (gGlobals.gameVars.weather.rainParticles == emmi) {
          vec3_sum((vec3f *)&part->vec_0x4c,(vec3f *)&part->vec_0x4c,param_2);
        }
        if (part->unk6 == -1) part = NULL;
        else part = param_1->particles + part->unk6;
      }
    }
  }
}

