#include "globals.h"

u16 ProcessWeatherFlag=0;

namespace Weather{
void Init(WeatherStruct* W){CLEAR(W);}
    
void Free(WeatherStruct* W){RemoveSFX(W);}

void AlignParticle(Particle_s *part,vec3f *pos,vec3f *rot){
  vec3f temp={rot->x,rot->y,rot->z};
  Vec3Scale(&temp,0.05);
  Particle::SetFlag(part,PARTICLE_0004);
  guAlign(&part->alignMtx,0.0,rot->x + 1.0E-6f,rot->y,rot->z);
  Vec3Copy(pos,&part->pos);
  Vec3Sum(&part->pos,&part->pos,&temp);
  Vec2Scale(&part->scale,3.0);
  Vec4Copy(&part->colorA,&part->colorB);
  Vec4Scale(&part->colorB,-(1.0f/120));
  part->lifespan = 120;
}

void PrecipParticleFuncC(ParticleHeadStruct *head,ParticleEmmiter *emmi,Particle_s *part){
  float fVar2;
  vec3f posA,posB,dist,rot;
  
  Vec3Sub(&dist,&part->pos,(vec3f *)&part->precipPos);
  fVar2 = SQ(dist.x)+ SQ(dist.y) + SQ(dist.z);
  if (fVar2 < (part->precipPos).w)
    (part->precipPos).w = fVar2;
  else {
    posA.x = (part->pos).x;
    posA.z = (part->pos).z;
    posB.y = (part->pos).y - 5.0f;
    posA.y = (part->pos).y + 5.0f;
    posB.x = posA.x;
    posB.z = posA.z;
    if ((CheckCollision(gGlobals.gameVars.borg9DatPointer,&posA,&posB,0.1,&dist,&rot,1))
      && (Particle::FUN_800b2890(head,emmi->link,part)))
      AlignParticle(part,&dist,&rot);
  }
}

void RainParticleFunc(ParticleHeadStruct *head,ParticleEmmiter *emmi){
  ParticleEmmiter *pPVar1;
  bool bVar2;
  Particle_s *p;
  float fVar3;
  vec3f posA;
  vec3f posB;
  vec2f randV2;
  vec3f pos;
  vec3f rot;
  vec3f *pfVar2;
  
  pPVar1 = emmi->link;
  pfVar2 = (vec3f *)pPVar1->object;
  RAND.GetVec2(&randV2,RAND.GetFloatRange(0.01,(pPVar1->randVec).x * 0.5f));
  posA.x = pfVar2->x + (pPVar1->vel).x + randV2.x;
  posA.z = pfVar2->z + (pPVar1->vel).z + randV2.y;
  posA.y = pfVar2->y + (pPVar1->vel).y + 50.0f;
  posB.y = pfVar2->y + (pPVar1->vel).y - 50.0f;
  posB.x = posA.x;
  posB.z = posA.z;
  if (CheckCollision(gGlobals.gameVars.borg9DatPointer,&posA,&posB,0.1,&pos,&rot,0)) {
    Particle_s *p = Particle::FUN_800b277c(head,emmi,120);
    Particle::SetScale(p,0.25f,0.25f);
    Vec4Copy(&pPVar1->colvec4,&p->colorA);
    Particle::SetFlag(p,PARTICLE_0200);
    Vec4Copy(&p->colorA,&p->colorB);
    Vec4Scale(&p->colorB,(float)(-0.75 / pPVar1->unk1a));
    AlignParticle(p,&pos,&rot);
  }
}


void PrecipParticleFuncB(ParticleHeadStruct *pHead,ParticleEmmiter *pEmmi){
  short lifespan;
  Particle_s *p;
  vec3f afStack216;
  vec3f collidePos;
  vec2f randPos;
  vec3f *pfVar1;
  
  lifespan = pEmmi->unk1a;
  pfVar1 = (vec3f *)pEmmi->object;
  p = Particle::FUN_800b277c(pHead,pEmmi,lifespan);
  Particle::SetScale(p,0.25f,0.25f);
  RAND.GetVec2(&randPos,RAND.GetFloatRange(0.01,(pEmmi->randVec).x));
  Particle::SetPos(p,pfVar1->x + (pEmmi->vel).x + randPos.x,pfVar1->y + (pEmmi->vel).y,
                   pfVar1->z + (pEmmi->vel).z + randPos.y);
  Vec3Copy((vec3f *)&pEmmi->particles->colorB,&afStack216);
  Vec3Scale(&afStack216,(float)(int)lifespan);
  Vec3Sum(&afStack216,&afStack216,&p->pos);
  if (CheckCollision(gGlobals.gameVars.borg9DatPointer,&p->pos,&afStack216,0.1,&collidePos,NULL,1))
    Vec4Set(&p->precipPos,collidePos.x,collidePos.y,collidePos.z,100000.0f);
  else
    Vec4Set(&p->precipPos,0.0,-1000.0,0.0,100000.0f);
  Vec4Copy(&pEmmi->colvec4,&p->colorA);
  Particle::SetFlag(p,PARTICLE_0200);
  Vec4Copy(&p->colorA,&p->colorB);
  Vec4Scale(&p->colorB,(float)(-0.75 / lifespan));
}

ParticleEmmiter *AllocPrecipParticles(vec3f *aim,vec3f *vel,vec4f *col,short textureA,short textureB,void *param_6){
  ParticleEmmiter *emmi = NewParticleEmmiter(60,textureB,0,NULL,param_6,NULL,NULL,NULL);
  ParticleEmmiter *ret = NULL;
  if (emmi) {
    Particle::SetColorB(emmi->particles,-(1.0f/120),-(1.0f/120),-(1.0f/120),0.0);
    Particle::SetFlag(emmi->particles,PARTICLE_0400);
    ret = NewParticleEmmiter(60,textureA,0,NULL,PrecipParticleFuncB,PrecipParticleFuncC,aim,emmi);
    if (!ret) {
      Particle::ResetEmmiter(&gGlobals.gameVars.particleEmmiter,emmi);
      return NULL;
    }
    else {
      emmi->link = ret;
      Vec4Copy(col,&ret->colvec4);
      Vec3Copy(vel,&ret->vel);
      Particle::SetFlag(ret->particles,PARTICLE_0080);
    }
  }
  return ret;
}

void RemoveSFX(WeatherStruct *W){
  if (W->Sfx) {
    DCM::Remove(W->sfxIndex,W->sfxID);
    FREEQB12(W->sfxIndex);
  }
}

void ProcessWeather(WeatherStruct *W,short delta){
  //TODO: clean up mess of GOTO's
  ushort uVar8;
  
  void *pcVar12;
  float fVar16;

  
  bool sky4 = gGlobals.sky.Type == SkyType4;
  W->rainShortA = TerrainPointer->rainByte;
  if (W->rainShortB != TerrainPointer->rainByte) W->rainParticles = NULL;
  if (W->timer <= 0.0) {
    W->rainShortB = W->rainShortA;
    RemoveSFX(W);
  }
  if (W->rainShortA == PRECIP_CLEAR) {
    if (ProcessWeatherFlag){
      ProcessWeatherFlag = false;
      Sky::SetBackgroundType(gGlobals.sky.Type,gGlobals.gameVars.weather.skyBgdat,600.0);
    }
  }
  if ((W->rainShortB == W->rainShortA) && (W->rainShortB)) {
    if (W->rainParticles == NULL) {
      if (!sky4) {
        pcVar12 = NULL;
        ProcessWeatherFlag = true;
        vec3f precipVel={0,0,7.0f};
        vec4f precipCol;
        u16 uVar13;
        short sVar9;
        switch(W->rainShortB){
          case PRECIP_RAIN:
           sVar9 = 4;
           uVar13 = 0x10;
           Sky::SetBackgroundType(gGlobals.sky.Type,2,600.0);
           pcVar12 = RainParticleFunc;
           precipCol={0.546875,0.7421875,0.8203125,0.8};
           break;
          case PRECIP_SNOW:
           sVar9 = 0;
           Sky::SetBackgroundType(gGlobals.sky.Type,2,600.0);
           uVar13 = 0;
           precipCol={1.0,1.0,1.0,1.0};
           break;
          default:
           CRASH("weather.cpp::ProcessWeather","Unknown Precipitation Type");
        }
        W->rainParticles = AllocPrecipParticles(&gCamera.aim,&precipVel,&precipCol,sVar9,uVar13,pcVar12);
      }
      goto LAB_80023160;
    }
LAB_80023168:
    (W->rainParticles->randVec).x = 20.0f;
    (W->rainParticles->vel).x = gCamera.rotationXZ.x * 5.0f;
    (W->rainParticles->vel).z = gCamera.rotationXZ.y * 5.0f;
    (W->rainParticles->vel).y = 7.0f - (W->timer - 2.0f);
    (W->rainParticles->particles->colorB).x = (TerrainPointer->windVelocity).x;
    (W->rainParticles->particles->colorB).y = (TerrainPointer->windVelocity).y;
    (W->rainParticles->particles->colorB).z = (TerrainPointer->windVelocity).z;
    if (W->rainShortB == PRECIP_RAIN) {
      (W->rainParticles->particles->colorB).y -=0.075;
      fVar16 = 6.0f - W->timer * 4.0f;
      W->rainParticles->unk1a = SCREEN_HEIGHT;
      sVar9 = (short)(int)fVar16;
      W->rainParticles->count = sVar9;
      if (W->rainParticles->link) {
        W->rainParticles->link->count = sVar9 + -2;
      }
LAB_80023308:
      goto LAB_8002330c;
    }
    if (W->rainShortB == PRECIP_SNOW) {
      W->rainParticles->count = (short)(int)(6.0f - W->timer * 7.0f);
      (W->rainParticles->particles->colorB).y -= ((W->timer * 0.02) + 0.03);
      W->rainParticles->unk1a = (short)(int)(360.0f - W->timer * 60.0);
      goto LAB_80023308;
    }
  }
  else {
LAB_80023160:
    if (W->rainParticles) goto LAB_80023168;
LAB_8002330c:
  }
  if (W->rainShortB == W->rainShortA) {
    if (W->rainShortB) {
      if (W->rainParticles) {
        W->rainParticles->lifespan = 300;
        if (W->rainParticles->link) W->rainParticles->link->lifespan = 300;
      }
      if (W->timer < TerrainPointer->PrecipScale)
        W->timer += (double)delta * (1.0/300);
      else W->timer = TerrainPointer->PrecipScale;
      CIEL(W->timer,1.0f);
    }
  }
  else {
    W->timer-= (double)delta *  (1.0/300);
    FLOOR(W->timer,0);
  }
  if (sky4) {
LAB_8002343c:
    if (W->Sfx == NULL) goto LAB_80023514;
  }
  else if (!W->Sfx) {
    if (W->rainShortB == PRECIP_RAIN) {
      W->Sfx = load_borg_12(0x71B);
      DCM::Add(&W->sfxIndex,&W->sfxID,&W->Sfx->dat->sub,0,0x80,1,-1,0);
    }
    goto LAB_8002343c;
  }
  if (!sky4) {
    u16 uVar10 = W->timer * 1.5 * 255.0;
    if (0xff < uVar10) uVar10 = 0xff;
    DCM::Start(W->sfxIndex,W->sfxID,uVar10 * gGlobals.VolSFX);
  }
LAB_80023514:
  fVar16 = W->fogTime - TerrainPointer->FogFloat;
  IABS(fVar16);
  if (fVar16 < 0.01) W->fogTime = TerrainPointer->FogFloat;
  else {
    if (W->fogTime < TerrainPointer->FogFloat)
      W->fogTime+= (double)delta * (1.0/900);
    else W->fogTime-= (double)delta * (1.0/900);
  }
  if (sky4) {
    if (W->rainParticles) {
      if (W->rainParticles->link) {
        Particle::ResetEmmiter(&gGlobals.gameVars.particleEmmiter,W->rainParticles->link);
        W->rainParticles->link = NULL;
      }
      Particle::ResetEmmiter(&gGlobals.gameVars.particleEmmiter,W->rainParticles);
      W->rainParticles = NULL;
    }
    RemoveSFX(W);
    W->fogTime = 0.0;
  }
}
};