#include "globals.h"

u16 ProcessWeatherFlag=0;

namespace Weather{
void Init(WeatherStruct* W){CLEAR(W);}
    
void Free(WeatherStruct* W){RemoveSFX(W);}

void AlignParticle(Particle_s *part,vec3f *pos,vec3f *rot){
  vec3f temp={rot->x,rot->y,rot->z};
  multiVec3(&temp,0.05);
  Particle::SetFlag(part,4);
  guAlign(&part->alignMtx,0.0,rot->x + 1.0E-6f,rot->y,rot->z);
  copyVec3(pos,&part->pos);
  vec3_sum(&part->pos,&part->pos,&temp);
  multiVec2(&part->scale,3.0);
  copyVec4(&part->colorA,&part->ColorB);
  multiVec4(&part->ColorB,-0.008333334);
  part->lifespan = 120;
}

void FUN_800228e8(ParticleHeadStruct *param_1,ParticleEmmiter *param_2,Particle_s *param_3){
  float fVar2;
  vec3f posA;
  vec3f posB;
  vec3f fStack152;
  vec3f afStack88;
  
  Vec3_sub(&fStack152,&param_3->pos,(vec3f *)&param_3->vec_0x4c);
  fVar2 = SQ(fStack152.x)+ SQ(fStack152.y) + SQ(fStack152.z);
  if (fVar2 < (param_3->vec_0x4c).w)
    (param_3->vec_0x4c).w = fVar2;
  else {
    posA.x = (param_3->pos).x;
    posA.z = (param_3->pos).z;
    posB.y = (param_3->pos).y - 5.0f;
    posA.y = (param_3->pos).y + 5.0f;
    posB.x = posA.x;
    posB.z = posA.z;
    if ((CheckCollision(gGlobals.Sub.borg9DatPointer,&posA,&posB,0.1,&fStack152,&afStack88,1))
      && (Particle::FUN_800b2890(param_1,param_2->link,param_3)))
      AlignParticle(param_3,&fStack152,&afStack88);
  }
}


void FUN_80022a24(ParticleHeadStruct *param_1,ParticleEmmiter *param_2){
  ParticleEmmiter *pPVar1;
  bool bVar2;
  Particle_s *p;
  float fVar3;
  vec3f posA;
  vec3f posB;
  vec2f avStack_e0 [8];
  vec3f pos [5];
  vec3f rot [8];
  vec3f *pfVar2;
  
  pPVar1 = param_2->link;
  pfVar2 = (vec3f *)pPVar1->object;
  RAND.GetVec2(avStack_e0,RAND.GetFloatRange(0.01,(pPVar1->field20_0x54).x * 0.5f));
  posA.x = pfVar2->x + (pPVar1->vel).x + avStack_e0[0].x;
  posA.z = pfVar2->z + (pPVar1->vel).z + avStack_e0[0].y;
  posA.y = pfVar2->y + (pPVar1->vel).y + 50.0f;
  posB.y = pfVar2->y + (pPVar1->vel).y - 50.0f;
  posB.x = posA.x;
  posB.z = posA.z;
  if (CheckCollision(gGlobals.Sub.borg9DatPointer,&posA,&posB,0.1,pos,rot,0)) {
    Particle_s *p = Particle::FUN_800b277c(param_1,param_2,0x78);
    Particle::SetScale(p,0.25f,0.25f);
    copyVec4(&pPVar1->colvec4,&p->colorA);
    Particle::SetFlag(p,0x200);
    copyVec4(&p->colorA,&p->ColorB);
    multiVec4(&p->ColorB,(float)(-0.75 / pPVar1->unk1a));
    AlignParticle(p,pos,rot);
  }
}


void FUN_80022bf4(ParticleHeadStruct *param_1,ParticleEmmiter *param_2){
  short lifespan;
  Particle_s *p;
  vec3f afStack216;
  vec3f fStack152;
  vec2f fStack88;
  vec3f *pfVar1;
  
  lifespan = param_2->unk1a;
  pfVar1 = (vec3f *)param_2->object;
  p = Particle::FUN_800b277c(param_1,param_2,lifespan);
  Particle::SetScale(p,0.25f,0.25f);
  RAND.GetVec2(&fStack88,RAND.GetFloatRange(0.01,(param_2->field20_0x54).x));
  Particle::SetPos(p,pfVar1->x + (param_2->vel).x + fStack88.x,pfVar1->y + (param_2->vel).y,
                   pfVar1->z + (param_2->vel).z + fStack88.y);
  copyVec3((vec3f *)&param_2->particles->ColorB,&afStack216);
  multiVec3(&afStack216,(float)(int)lifespan);
  vec3_sum(&afStack216,&afStack216,&p->pos);
  if (CheckCollision(gGlobals.Sub.borg9DatPointer,&p->pos,&afStack216,0.1,&fStack152,NULL,1))
    setVec4(&p->vec_0x4c,fStack152.x,fStack152.y,fStack152.z,100000.0f);
  else
    setVec4(&p->vec_0x4c,0.0,-1000.0,0.0,100000.0f);
  copyVec4(&param_2->colvec4,&p->colorA);
  Particle::SetFlag(p,0x200);
  copyVec4(&p->colorA,&p->ColorB);
  multiVec4(&p->ColorB,(float)(-0.75 / lifespan));
}

ParticleEmmiter *AllocPrecipParticles(vec3f *aim,vec3f *vel,vec4f *col,short param_4,short param_5,void *param_6){
  ParticleEmmiter *link;
  ParticleEmmiter *pPVar1;
  
  link = Particle::AllocParticleEmitter(&gGlobals.Sub.particleEmmiter,0x3c,param_5,0,NULL,param_6,NULL,NULL,NULL);
  pPVar1 = NULL;
  if (link) {
    Particle::SetColorB(link->particles,-(1.0f/120),-(1.0f/120),-(1.0f/120),0.0);
    Particle::SetFlag(link->particles,0x400);
    pPVar1 = Particle::AllocParticleEmitter(&gGlobals.Sub.particleEmmiter,60,param_4,0,NULL,FUN_80022bf4,FUN_800228e8,aim,link);
    if (pPVar1 == NULL) {
      Particle::ResetEmmiter(&gGlobals.Sub.particleEmmiter,link);
      pPVar1 = NULL;
    }
    else {
      link->link = pPVar1;
      copyVec4(col,&pPVar1->colvec4);
      copyVec3(vel,&pPVar1->vel);
      Particle::SetFlag(pPVar1->particles,0x80);
    }
  }
  return pPVar1;
}

void RemoveSFX(WeatherStruct *W){
  if (W->Sfx) {
    DCM::Remove(W->sfxIndex,W->sfxID);
    FREEQB12(W->sfxIndex);
  }
}

void ProcessWeather(WeatherStruct *W,short delta){
  //TODO: clean up mess of GOTO's
  u8 PVar1;
  Particle_s *pPVar2;
  Borg12Data *pBVar3;
  bool bVar4;
  TerrainStruct *pTVar5;
  ushort uVar8;
  ParticleEmmiter *pPVar6;
  Borg12Header *pBVar7;
  short sVar9;
  ushort uVar11;
  void *pcVar12;
  u16 uVar13;
  int iVar14;
  double dVar15;
  float fVar16;
  double dVar17;
  float fVar18;
  float fVar19;
  vec3f precipVel;
  vec4f precipCol;
  
  iVar14 = (int)delta;
  bVar4 = gGlobals.sky.Type == 4;
  PVar1 = TerrainPointer->rainByte;
  W->rainShortA = TerrainPointer->rainByte;
  if (W->rainShortB != TerrainPointer->rainByte) {
    W->rainParticles = NULL;
  }
  if (W->timer <= 0.0) {
    W->rainShortB = W->rainShortA;
    RemoveSFX(W);
  }
  uVar8 = W->rainShortA;
  if (W->rainShortA == 0) {
    if (ProcessWeatherFlag){
      ProcessWeatherFlag = 0;
      Sky::SetBackgroundType(gGlobals.sky.Type,gGlobals.Sub.weather.skyBgdat,600.0);
    }
  }
  pPVar6 = W->rainParticles;
  if ((W->rainShortB == W->rainShortA) && (W->rainShortB)) {
    if (pPVar6 == NULL) {
      if (!bVar4) {
        pcVar12 = NULL;
        ProcessWeatherFlag = 1;
        precipVel.x = 0.0;
        precipVel.z = 0.0;
        precipVel.y = 7.0f;
        switch(W->rainShortB){
          case 1:
          sVar9 = 4;
          uVar13 = 0x10;
          Sky::SetBackgroundType(gGlobals.sky.Type,2,600.0);
          pcVar12 = FUN_80022a24;
          precipCol={0.546875,0.7421875,0.8203125,0.8};
          break;
          case 2:
          sVar9 = 0;
          Sky::SetBackgroundType(gGlobals.sky.Type,2,600.0);
          uVar13 = 0;
          precipCol={1.0,1.0,1.0,1.0};
          break;
          default:
          CRASH("weather.cpp::ProcessWeather","Unknown Precipitation Type");
        }
        W->rainParticles = AllocPrecipParticles(&gGlobals.Sub.camera.aim,&precipVel,&precipCol,sVar9,uVar13,pcVar12);
        pPVar6 = W->rainParticles;
      }
      goto LAB_80023160;
    }
LAB_80023168:

    (pPVar6->field20_0x54).x = 20.0f;
    (W->rainParticles->vel).x = gGlobals.Sub.camera.rotationXZ.x * 5.0f;
    (W->rainParticles->vel).z = gGlobals.Sub.camera.rotationXZ.y * 5.0f;
    pTVar5 = TerrainPointer;
    fVar16 = 7.0f;
    (W->rainParticles->vel).y = 7.0f - (W->timer - 2.0f);
    (W->rainParticles->particles->ColorB).x = (pTVar5->windVelocity).x;
    (W->rainParticles->particles->ColorB).y = (pTVar5->windVelocity).y;
    (W->rainParticles->particles->ColorB).z = (pTVar5->windVelocity).z;
    if (W->rainShortB == 1) {
      pPVar2 = W->rainParticles->particles;
      (pPVar2->ColorB).y = (float)((double)(pPVar2->ColorB).y + -0.075);
      pPVar6 = W->rainParticles;
      fVar16 = 6.0f - W->timer * 4.0f;
      pPVar6->unk1a = SCREEN_HEIGHT;
      sVar9 = (short)(int)fVar16;
      pPVar6->unk8 = sVar9;
      if (pPVar6->link) {
        pPVar6->link->unk8 = sVar9 + -2;
      }
LAB_80023308:
      goto LAB_8002330c;
    }
    if (W->rainShortB == 2) {
      dVar17 = (double)W->timer * 0.02;
      pPVar6 = W->rainParticles;
      pPVar6->unk8 = (short)(int)(6.0f - W->timer * fVar16);
      fVar16 = 60.0f;
      pPVar2 = pPVar6->particles;
      (pPVar2->ColorB).y = (float)((double)(pPVar2->ColorB).y - (dVar17 + 0.03));
      W->rainParticles->unk1a = (short)(int)(360.0f - W->timer * 60.0);
      goto LAB_80023308;
    }
    uVar11 = W->rainShortA;
  }
  else {
LAB_80023160:
    if (pPVar6 != NULL) goto LAB_80023168;
LAB_8002330c:
  }
  if (W->rainShortB == W->rainShortA) {
    if (W->rainShortB) {
      pPVar6 = W->rainParticles;
      if (pPVar6) {
        pPVar6->lifespan = 300;
        if (pPVar6->link) pPVar6->link->lifespan = 300;
      }
      if (W->timer < TerrainPointer->PrecipScale)
        W->timer = (float)((double)W->timer + (double)delta *  (1.0/300));
      else W->timer = TerrainPointer->PrecipScale;
      CIEL(W->timer,1.0f);
    }
  }
  else {
    W->timer = (float)((double)W->timer - (double)delta *  (1.0/300));
    FLOOR(W->timer,0);
  }
  pBVar7 = W->Sfx;
  if (bVar4) {
LAB_8002343c:
    if (pBVar7 == NULL) goto LAB_80023514;
  }
  else if (!pBVar7) {
    if (W->rainShortB == 1) {
      pBVar7 = load_borg_12(0x71B);
      pBVar3 = pBVar7->dat;
      W->Sfx = pBVar7;
      DCM::Add(&W->sfxIndex,&W->sfxID,&pBVar3->sub,0,0x80,1,-1,0);
    }
    goto LAB_8002343c;
  }
  if (!bVar4) {
    u16 uVar10 = W->timer * 1.5 * 255.0;
    if (0xff < uVar10) uVar10 = 0xff;
    DCM::Start(W->sfxIndex,W->sfxID,uVar10 * gGlobals.VolSFX);
  }
LAB_80023514:
  fVar19 = W->fogTime;
  fVar18 = TerrainPointer->FogFloat;
  fVar16 = fVar19 - fVar18;
  IABS(fVar16);
  if (fVar16 < 0.01) W->fogTime = fVar18;
  else {
    if (fVar19 < fVar18) {
      dVar15 = (double)fVar19 + (double)delta * (1.0/900);
    }
    else {
      dVar15 = (double)fVar19 - (double)delta * (1.0/900);
    }
    W->fogTime = (float)dVar15;
  }
  if (bVar4) {
    if (W->rainParticles) {
      pPVar6 = W->rainParticles->link;
      if (pPVar6) {
        Particle::ResetEmmiter(&gGlobals.Sub.particleEmmiter,pPVar6);
        W->rainParticles->link = NULL;
      }
      Particle::ResetEmmiter(&gGlobals.Sub.particleEmmiter,W->rainParticles);
      W->rainParticles = NULL;
    }
    RemoveSFX(W);
    W->fogTime = 0.0;
  }
}
};