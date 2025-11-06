#include "globals.h"
#include "vobjects.h"
//Script for chest explosion particles (and the sole use of dynamic lighting)

#if 0 //for future LE porting
#define BoomColRed0 0x000080ff
#define BoomColRed1 0x00000060
#define BoomColYellow 0x0000ffff
#else
#define BoomColRed0 0xff800000
#define BoomColRed1 0x60000000
#define BoomColYellow 0xffff0000
#endif


void chest_explode_particles(voxelObject *chest,float height,vec4f *color,u16 param_4,short param_5,short count
               ,float randHi,float randLo,float param_9,short addLight) {
  ParticleEmmiter *pEmmi = Particle::AllocParticleEmitter
                    (&gGlobals.gameVars.particleEmmiter,param_4,param_5,0,NULL,NULL,NULL,NULL,NULL);
  if (pEmmi) {
    Particle::SetEmmiterHeight(pEmmi,height);
    Particle_s *pPVar1 = pEmmi->particles;
    Particle::SetFlag(pPVar1,PARTICLE_0100);
    Particle::SetColorB(pPVar1,0.0,param_9,0.0,1.0f);
    pPVar1 = Particle::FUN_800b27cc(&gGlobals.gameVars.particleEmmiter,pEmmi,param_4);
    Particle::SetFlag(pPVar1,PARTICLE_0200);
    Particle::SetColorB(pPVar1,color->x,color->y,color->z,color->w);
    Vec4Neg(&pPVar1->colorB);
    Vec4Scale(&pPVar1->colorB,Particle::OneOverLifespan(pPVar1));
    for(s16 i=0;i<count;i++){
        pPVar1 = Particle::FUN_800b277c(&gGlobals.gameVars.particleEmmiter,pEmmi,param_4);
        Particle::SetScale(pPVar1,0.25,0.25);
        Particle::SetPos(pPVar1,(chest->header).pos.x,(chest->header).pos.y,(chest->header).pos.z);
        Particle::SetColorA(pPVar1,color->x,color->y,color->z,color->w);
        RAND.GetVec3(&pPVar1->vel,RAND.GetFloatRange(randHi,randLo));
    }
    if (addLight) {
      AllocDynamicLight(&gGlobals.gameVars.DynamicLights,120,&chest->header.pos,10.0,1,4.0f,BoomColRed0,0x0);
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
  if ((emmi->flags & PARTEMMI_2000)) pos = &(emmi->collision).pos;
  p = Particle::FUN_800b277c(param_1,emmi,0x78);
  Particle::SetScale(p,0.25f,0.25f);
  Particle::SetPos(p,pos->x + (emmi->vel).x,pos->y + (emmi->vel).y,
                   pos->z + (emmi->vel).z);
  Particle::SetColorA(p,(emmi->colvec4).x,(emmi->colvec4).y,(emmi->colvec4).z,
                      (emmi->colvec4).w);
  RAND.GetVec3(&p->vel,RAND.GetFloatRange(0.01,0.02));
  Vec3Sum(&p->vel,&TerrainPointer->windVelocity,&p->vel);
  fVar2 = pos->y + emmi->unk40;
  fVar1 = emmi->height;
  if (fVar2 <= emmi->height) fVar1 = fVar2;
  emmi->height = fVar1;
}


void Ofunc_8001af40(container_Dat *param_1,vec3f *param_2,vec4f *param_3,float param_4,
                   u16 param_5,short param_6,float param_7) {
  
  ParticleEmmiter *emmi = Particle::AllocParticleEmitter
                     (&gGlobals.gameVars.particleEmmiter,param_5,param_6,0,NULL,ofunc_sub_8001ae04,NULL,
                      param_1,NULL);
  if (emmi) {
    Particle::SetEmmiterHeight(emmi,(param_1->chestSize - 0.5));
    Vec4Copy(param_3,&emmi->colvec4);
    Vec3Copy(param_2,&emmi->vel);
    Particle_s *part = emmi->particles;
    emmi->unk40 = param_4;
    Particle::SetFlag(part,PARTICLE_0100);
    Particle::SetColorB(part,0.0,param_7,0.0,1.0f);
    part = Particle::FUN_800b27cc(&gGlobals.gameVars.particleEmmiter,emmi,param_5);
    Particle::SetFlag(part,PARTICLE_0200);
    Particle::SetColorB(part,param_3->x,param_3->y,param_3->z,param_3->w);
    Vec4Scale(&part->colorB,(-1.0f/120));
  }
}


void FUN_8001b0a8(ParticleHeadStruct *head,ParticleEmmiter *emmi) {
  Particle_s *p;
  vec3f *pos;
  vec4f v4;
  vec2f v2;
  voxelObject *obj;
  
  p = Particle::FUN_800b277c(head,emmi,emmi->unk1a);
  Particle::SetScale(p,0.1f,0.1f);
  vec3f *pos = &emmi->pos;
  if ((emmi->flags & PARTEMMI_2000)) pos = &(emmi->collision).pos;
  voxelObject *obj = (voxelObject *)emmi->object;
  if (obj) {
    if (((dynaLightEntry*)(obj->header).ptr0x24)->active == 0) {
      emmi->object = NULL;
    }
    else Vec3Copy(pos,&obj->header.pos);
  }
  Vec3Copy(pos,&p->pos);
  RAND.GetVec2(&v2,RAND.GetFloat0ToX((emmi->vel).x));
  (p->pos).x += v2.x;
  (p->pos).z += v2.y;
  RAND.GetVec2(&v2,RAND.GetFloat0ToX((emmi->vel).z));
  Particle::SetVel(p,v2.x,RAND.GetFloat0ToX((emmi->vel).y / (float)(int)emmi->unk1a),v2.y);
  Vec4Copy(&emmi->colvec4,&p->colorA);
  v4.x = RAND.GetFloat0ToX((emmi->field20_0x54).x / (float)(int)emmi->unk1a);
  v4.y = RAND.GetFloat0ToX((emmi->field20_0x54).y / (float)(int)emmi->unk1a);
  v4.z = RAND.GetFloat0ToX((emmi->field20_0x54).z / (float)(int)emmi->unk1a);
  v4.w = RAND.GetFloat0ToX((emmi->field20_0x54).w / (float)(int)emmi->unk1a);
  Vec4Copy(&v4,&p->colorB);
  p->unk4 = p->id;
  Particle::SetFlag(p,PARTICLE_0200);
}


ParticleEmmiter *
FUN_8001b29c(vec3f *pos,u16 param_2,short param_3,u16 param_4,short param_5,float param_6
            ,vec4f *colA,vec4f *colC,vec4f *colB,vec3f *vel) {

  ParticleEmmiter *emmi = Particle::AllocParticleEmitter
                     (&gGlobals.gameVars.particleEmmiter,param_2,param_3,param_4,NULL,FUN_8001b0a8,NULL,NULL,NULL);
  if (emmi == NULL) emmi = NULL;
  else {
    Vec3Copy(pos,&emmi->pos);
    Vec4Copy(colA,&emmi->colvec4);
    Vec4Copy(colB,&emmi->field20_0x54);
    Vec3Copy(vel,&emmi->vel);
    Particle_s *part = emmi->particles;
    emmi->unk1a = param_5;
    Particle::SetFlag(part,PARTICLE_0100);
    Particle::SetColorB(part,0.0,6e-05f,0.0,1.0f);
    part = Particle::FUN_800b27cc(&gGlobals.gameVars.particleEmmiter,emmi,param_2);
    Particle::SetFlag(part,PARTICLE_0400);
    float gray = param_6 / param_5;
    Particle::SetColorB(part,gray,gray,gray,0.0);
    part = Particle::FUN_800b27cc(&gGlobals.gameVars.particleEmmiter,emmi,param_2);
    Particle::SetFlag(part,PARTICLE_0200);
    float dVar3 = -1.0 / param_5;
    Vec4Sub(&part->colorB,colA,colC);
    Vec4Scale(&part->colorB,dVar3);
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
  
  Vec4Set(&afStack560,1.0f,1.0f,0.0,1.0f);
  Vec4Set(&afStack496,0.5,0.0,0.0,0.0);
  Vec4Set(&afStack432,0.2,0.1,0.0,0.0);
  Vec3Set(&afStack304,0.05,0.4,0.0025);
  Vec3Set(&afStack368,0.25f,0.0,0.25f);
  pPVar1 = FUN_8001b29c(pos,param_3,2,0xfffe,0x78,param_2,&afStack560,&afStack496,&afStack432,
                        &afStack304);
  if (pPVar1) {
    if (moving) {
      Particle::SetEmmiterFlags(pPVar1,PARTEMMI_2000);
      Vec3Copy(pos,&(pPVar1->collision).pos);
      RAND.GetVec2(&local_70,0.036);
      Vec3Set(&(pPVar1->collision).vel,local_70.x,0.12,local_70.y);
    }
    pPVar1->object = AllocDynamicLight(&gGlobals.gameVars.DynamicLights,param_3,pos,5.0,3,0.75f,
                               BoomColRed1,BoomColYellow);
  }
}
void Ofunc_8001b688(vec3f *pos,vec2f *param_2,u16 param_3) {
  vec4f v4A [4];
  vec4f v4B [4];
  vec4f v4C [4];
  vec3f v3B [5];
  vec3f v3A [5];
  vec3f temp;
  
  Vec4Set(v4A,0.0,1.0f,0.8,1.0f);
  Vec4Set(v4B,0.4f,0.0,0.4f,0.0);
  Vec4Set(v4C,0.6,0.3,0.2,0.0);
  Vec3Set(v3A,0.5,1.0f,0.0);
  Vec3Set(v3B,0.0,0.0,0.0);
  Vec3Copy(pos,&temp);
  for(s16 i=0;i<12;i++){
    temp.x = (temp.x - param_2->x * 0.75);
    temp.z = (temp.z - param_2->y * 0.75);
    FUN_8001b29c(&temp,param_3,0,0,90,1.5f,v4A,v4B,v4C,v3A);
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
        Vec3Sum(&part->pos,&part->pos,param_2);
        if (gGlobals.gameVars.weather.rainParticles == emmi) {
          Vec3Sum((vec3f *)&part->vec_0x4c,(vec3f *)&part->vec_0x4c,param_2);
        }
        if (part->unk6 == -1) part = NULL;
        else part = param_1->particles + part->unk6;
      }
    }
  }
}

