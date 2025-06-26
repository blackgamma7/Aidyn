#include "particle.h"
#include "heapN64.h"
#include "unkStructs.h"
#include "crash.h"
#include "sceneData.h"

#define FILENAME "../src/Particles.cpp"

void Particle::InitParticle(Particle_s *param_1,u16 param_2){  
  CLEAR(param_1);
  param_1->id = param_2;
  param_1->unk4 = param_2;
  param_1->unk6 = -1;
  param_1->unk8 = -1;
  (param_1->scale).y = 1.0f;
  (param_1->scale).x = 1.0f;
}

void Particle::InitParticles(ParticleHeadStruct *param_1){
  if (param_1->particleStructCount != -1) {
    for(s16 i=0;i<(param_1->particleStructCount + 1);i++) {
      param_1->particleindecies[i] = i;
      InitParticle(&param_1->particles[i],i);
    }
  }
  param_1->count1 = 0;
}

EnvProp gParticleEnvProps;
SpeedProperty gPartEmmiSpeedProp;
collisionTypeA gPartEmmiCollideA;

void Particle::InitEmmiter(ParticleEmmiter *param_1,u16 param_2){
  CLEAR(param_1);
  param_1->ID = param_2;
  set_collisionSphere(&param_1->collision,0.25,0.0,0.0,0.0,0.0,0.0,0.0);
  gParticleEnvProps.Speed = &gPartEmmiSpeedProp;
  gParticleEnvProps.colA = &gPartEmmiCollideA;
  init_collisionTypeA(&gPartEmmiCollideA);
  set_CollisionTypeB(&gPartEmmiSpeedProp);
  gPartEmmiSpeedProp.gravity.y = -0.006f;
  (param_1->collision).envProps = &gParticleEnvProps;
}

void Particle::InitEmmiters(ParticleHeadStruct *param_1){
  for(s16 i=0;i<ParticleEmmiMAX;i++) {
    param_1->emmitterIndecies[i] = i;
    InitEmmiter(&param_1->Emmiter[i],i);
  }
  param_1->count2 = 0;
}

void Particle::LoadTextures(ParticleHeadStruct *param_1,s16 count,s32 *textures){
  ALLOCS(param_1->ppTextures,count*sizeof(void**),167);
  param_1->TextureCount = count;
  if (0 < count) {
    for(s16 i=0;i<count;i++){
      if (textures[i] == -1) param_1->ppTextures[i] = NULL;
      else param_1->ppTextures[i] = (Borg1Header *)getBorgItem(textures[i]);
    }
  }
}


void Particle::FreeTextures(ParticleHeadStruct *param_1){
  if (0 < param_1->TextureCount) {
    for(s16 i=0;i<param_1->TextureCount;i++){
      if (param_1->ppTextures[i]) borg1_free(param_1->ppTextures[i]);
    }
  }
  param_1->TextureCount = 0;
  FREE(param_1->ppTextures,199);
}


void Particle::InitParticleHead(ParticleHeadStruct *head,Borg9Data *borg9,s16 partCount,u16 textCount,s32 *textureP){

  ALLOCS(head->Emmiter,ParticleEmmiMAX*sizeof(ParticleEmmiter),218);
  if (partCount >= ParticleMAX+1){
    char acStack_98 [152];
    sprintf(acStack_98,"Too Many Particles!!\nCall: %d - Max: %d\n",partCount,ParticleMAX);
    CRASH("InitParticleHead",acStack_98);
  }
  head->particleStructCount = partCount;
  ALLOCS(head->particles,(u16)(partCount+1)*sizeof(Particle_s),223);
  head->gray = 1.0f;
  InitEmmiters(head);
  InitParticles(head);
  LoadTextures(head,textCount,textureP);
  head->borg9dat = borg9;
  OSTime OVar3 = osGetTime();
  PartRand.SetSeed(udivdi3(CONCAT44((int)(OVar3 >> 0x20) << 6 | (uint)OVar3 >> 0x1a,(uint)OVar3 << 6),3000));
}

void Particle::FreeEmmiters(ParticleHeadStruct *param_1){
  HFREE(param_1->particles,0x106);
  HFREE(param_1->Emmiter,0x107);
  param_1->Emmiter = NULL;
  param_1->particles = NULL;
  FreeTextures(param_1);
}


void Particle::UpdateParticle(ParticleHeadStruct *param_1,vec4f *col,u32 flag,s16 index,float delta){

  s32 iVar5 = index;
  s32 lVar4 = iVar5;
  if (lVar4 != -1) {
    do {
      Particle_s* part = &param_1->particles[index+lVar4];
      lVar4 = part->unk6;
      if ((flag & 0x8000) == 0) lVar4 = -1;
      float dScale = 1.0f;
      if ((flag & 0x40)) dScale = col->w;
      if ((flag & 0x800)) {
        part->ColorB.r+=col->x * delta * dScale;
        part->ColorB.g+=col->y * delta * dScale;
        part->ColorB.b+=col->z * delta * dScale;
        part->ColorB.a+=col->w * delta * dScale;
      }
      if (!(part->flags & 0x4000)) {
        if ((flag & 0x80)) {
          part->pos.x+=col->x * delta * dScale;
          part->pos.y+=col->y * delta * dScale;
          part->pos.z+=col->z * delta * dScale;
        }
        if ((flag & 0x100)) {
          part->vel.x+=col->x * delta * dScale;
          part->vel.y+=col->y * delta * dScale;
          part->vel.z+=col->z * delta * dScale;
        }
        if ((flag & 0x200)) {
          part->colorA.r+=col->x * delta * dScale;
          part->colorA.g+=col->y * delta * dScale;
          part->colorA.b+=col->z * delta * dScale;
          part->colorA.a+=col->w * delta * dScale;
          CIEL(part->colorA.r,1.0);
          CIEL(part->colorA.g,1.0);
          CIEL(part->colorA.b,1.0);
          CIEL(part->colorA.a,1.0);
          FLOOR(part->colorA.r,0.0);
          FLOOR(part->colorA.g,0.0);
          FLOOR(part->colorA.b,0.0);
          FLOOR(part->colorA.a,0.0);
        }
        if ((flag & 0x400)) {
          part->scale.x+=col->x * delta * dScale;
          part->scale.y+=col->y * delta * dScale;
          FLOOR(part->scale.y,0.0);
          FLOOR(part->scale.y,0.0);
        }
      }
    } while (lVar4 != -1);
  }
}

void Particle::ApplyVelocity(ParticleHeadStruct *param_1,ParticleEmmiter *param_2,short index,float delta){
  Particle_s *part = &param_1->particles[index];
  part->pos.x+=part->vel.x * delta;
  part->pos.y+=part->vel.y * delta;
  part->pos.z+=part->vel.z * delta;
  if ((param_2->flags & 0x4000)&&(part->pos.y < param_2->height)) {
    part->pos.y -= part->vel.y;
    part->vel.x *=.6;
    part->vel.y *=-6;
    part->vel.z *=.6;
  }
  if (((part->flags & 0x8000) == 0)&&(part->unk4 != -1)) UpdateParticle(param_1,&part->ColorB,part->flags,part->unk4,delta);
  else UpdateParticle(param_1,&part->ColorB,part->flags,param_2->particles->id,delta);
}


void Particle::ProcessAndRenderParticleHead(Gfx **gg,ParticleHeadStruct *pPH,vec3f *param_3,s16 delta,u16 viBuff,u16 param_6){
  ushort uVar1;
  int iVar2;
  short sVar4;
  Particle_s *pPVar3;
  u16 uVar5;
  int iVar6;
  int i;
  ParticleEmmiter *pE;
  longlong lVar9;
  int delta_;
  char acStack_78 [64];
  Gfx *pGStack_38;
  uint uStack_34;
  int iStack_30;
  
  delta_ = (int)delta;
  iStack_30 = 0;
  uStack_34 = (uint)param_6;
  pGStack_38 = *gg;
  iVar2 = 0;
  for(s16 i=0;i<ParticleEmmiMAX;i++) {
    pE = &pPH->Emmiter[i];
    uVar1 = pE->flags;
    if ((pE->flags & 0x8000) == 0) {
LAB_800b2590:
      iVar2 = (i + 1) * 0x10000;
    }
    else if (uStack_34 == 0) {
      iVar2 = (i + 1) * 0x10000;
      if ((pE->flags & 0x1000) != 0) {
        sVar4 = pE->lifespanemmiter;
        goto LAB_800b2214;
      }
    }
    else {
      iVar2 = (i + 1) * 0x10000;
      if ((pE->flags & 0x1000) == 0) {
        sVar4 = pE->lifespanemmiter;
LAB_800b2214:
        if (0 < sVar4) {
          iVar2 = (uint)(ushort)pE->lifespanemmiter - delta_;
          pE->lifespanemmiter = (short)iVar2;
          if (iVar2 * 0x10000 < 0) {
            pE->lifespanemmiter = 0;
          }
          goto LAB_800b2590;
        }
        if (iStack_30 == 0) {
          iStack_30 = 1;
          pGStack_38 = FUN_800b2d34(pGStack_38,pPH,param_3,viBuff);
          pGStack_38 = FUN_800b2f9c(pGStack_38,(u16)uStack_34);
        }
        if (-1 < pE->lifespan) {
          if (pE->funcA) (*pE->funcA)(pPH,pE);
          if ((pE->flags & 0x2000)&&(pPH->borg9dat))
            ProcessCollisionSphere(pPH->borg9dat,&pE->collision,delta);
          if (!pPH->ppTextures[pE->texture])
            CRASH("../src/Particles.cpp","pPH->ppTextures[pE->texture] == NULL\nParticle emitter tried to use an discarded texture!");
          pGStack_38 = FUN_8009d3dc(pGStack_38,pPH->ppTextures[pE->texture],0);
          pGStack_38 = loadTextureImage(pGStack_38,pPH->ppTextures[pE->texture],NULL);
          iVar2 = (uint)(ushort)pE->lifespan - delta_;
          pE->lifespan = (short)iVar2;
          if (pE->funcB == NULL) {
LAB_800b23cc:
            pPVar3 = pE->particles;
          }
          else if (iVar2 * 0x10000 < 1) {
            pPVar3 = pE->particles;
          }
          else {
            if (0 < pE->unk6) {
                pE->unk6 -= delta;
              goto LAB_800b23cc;
            }
            pE->unk6 = pE->unk8;
            iVar2 = (int)(short)pE->unk8;
            if (iVar2 < 0) {
              if (iVar2 < 0) iVar2 = -iVar2;
              iVar6 = 0x10000;
              if (iVar2 < 1) goto LAB_800b23cc;
              do {
                (*pE->funcB)(pPH,pE);
                lVar9 = (longlong)(short)pE->unk8;
                iVar2 = iVar6 >> 0x10;
                if (lVar9 < 0) {
                  lVar9 = (longlong)-(int)(short)pE->unk8;
                }
                iVar6 += 0x10000;
              } while (iVar2 < lVar9);
              pPVar3 = pE->particles;
            }
            else {
              (*pE->funcB)(pPH,pE);
              pPVar3 = pE->particles;
            }
          }
          if (!pE->particles) CRASH("ProcessAndRenderParticleHead","We need a pE->pParticle!!");
          lVar9 = (longlong)(short)pE->particles->id;
          if (lVar9 == -1) {
            sVar4 = pE->lifespan;
          }
          else {
            do {
              if ((lVar9 < 0) || (pPH->particleStructCount < lVar9)) {
                sprintf(acStack_78,"Particle ERROR: %d, %d",pE->ID,lVar9);
                CRASH("ProcessAndRenderParticleHead",acStack_78);
              }
              pPVar3 = pPH->particles + (int)lVar9;
              if ((short)pPVar3->lifespan < 0) {
LAB_800b24c4:
                uVar5 = pPVar3->lifespan;
              }
              else {
                pPVar3->lifespan = pPVar3->lifespan - delta;
                ApplyVelocity(pPH,pE,(short)lVar9,(float)delta_);
                uVar5 = pPVar3->lifespan;
                if ((pPVar3->flags & 0x10) != 0) {
                  if (0 < (short)uVar5) {
                    if ((pPVar3->flags & 0x20) != 0) {
                      UnsetFlag(pPVar3,0x20);
                      uVar5 = pPVar3->lifespan;
                      goto LAB_800b24c8;
                    }
                    RenderParticles(&pGStack_38,pPH,pPVar3,pPH->ppTextures[pE->texture],viBuff);
                  }
                  goto LAB_800b24c4;
                }
              }
LAB_800b24c8:
              lVar9 = (longlong)pPVar3->unk6;
              if ((short)uVar5 < 1) {
                if ((pPVar3->flags & 2) != 0) {
                  UnsetFlag(pPVar3,0x10);
                  pPVar3->lifespan = 0;
                }
                if ((pPVar3->flags & 1) != 0) {
                  FUN_800b282c(pPH,pPVar3);
                }
              }
              else if ((pPVar3->id != pE->particles->id) && (pE->funcC != NULL)) {
                (*pE->funcC)(pPH,pE,pPVar3);
              }
            } while (lVar9 != -1);
            sVar4 = pE->lifespan;
          }
          iVar2 = (i + 1) * 0x10000;
          if (0 < sVar4) continue;
        }
        if ((pE->flags & 2)) pE->lifespan = 0;
        if ((pE->flags & 1)) FreeParticleEmitter(pPH,pE);
        goto LAB_800b2590;
      }
    }
  }
  *gg = pGStack_38;
}

bool Particle::FUN_800b25e0(ParticleHeadStruct *param_1,ParticleEmmiter *param_2,Particle_s *param_3){
  
  if (param_3->id != param_1->particleStructCount) {
    Particle_s *pPVar2 = param_2->particles;
    if (pPVar2 == NULL) {
      FUN_800b282c(param_1,param_3);
      return false;
    }
    param_3->unk6 = pPVar2->unk6;
    param_3->unk8 = pPVar2->id;
    pPVar2->unk6 = param_3->id;
    if (param_3->unk6 != -1) param_1->particles[param_3->unk6].unk8 =param_3->id;
  }
  return true;
}

void Particle::FUN_800b266c(ParticleHeadStruct *param_1,Particle_s *param_2){
  if (param_2->unk6 != -1)
    param_1->particles[param_2->unk6].unk8 =param_2->unk8;
  if (param_2->unk8 != -1)
    param_1->particles[param_2->unk8].unk6 =param_2->unk6;
  param_2->unk6 = -1;
  param_2->unk8 = -1;
}


Particle_s * Particle::FUN_800b26d8(ParticleHeadStruct *pHead,u16 lifespan){
  int iVar2;
  Particle_s *pPVar3;
  
  if (pHead->count1 == pHead->particleStructCount)
    iVar2 = (short)pHead->count1 * 0xd;
  else
    iVar2 = pHead->particleindecies[pHead->count1++];
  pPVar3 = &pHead->particles[iVar2];
  InitParticle(pPVar3,pPVar3->id);
  pPVar3->flags = 0x31;
  pPVar3->lifespan = lifespan;
  return pPVar3;
}

Particle_s * Particle::FUN_800b277c(ParticleHeadStruct *pHead,ParticleEmmiter *pEmmi,u16 lifespan){
  Particle_s *pPVar1 = FUN_800b26d8(pHead,lifespan);
  FUN_800b25e0(pHead,pEmmi,pPVar1);
  return pPVar1;
}

Particle_s * Particle::FUN_800b27cc(ParticleHeadStruct *param_1,ParticleEmmiter *param_2,u16 param_3){
  Particle_s *pPVar1 = FUN_800b26d8(param_1,param_3);
  pPVar1->flags = 0xc00a;
  FUN_800b25e0(param_1,param_2,pPVar1);
  return pPVar1;
}

void Particle::FUN_800b282c(ParticleHeadStruct *param_1,Particle_s *param_2){
  FUN_800b266c(param_1,param_2);
  if (param_2->id != param_1->particleStructCount)
    param_1->particleindecies[--param_1->count1] = param_2->id;
  param_2->flags = 0;
  param_2->lifespan = 0;
}

bool Particle::FUN_800b2890(ParticleHeadStruct *param_1,ParticleEmmiter *param_2,Particle_s *param_3){
  FUN_800b266c(param_1,param_3);
  return FUN_800b25e0(param_1,param_2,param_3);
}


ParticleEmmiter *
Particle::AllocParticleEmitter(ParticleHeadStruct *param_1,u16 lifespan,short texture,u16 param_4,
            ParticleFuncA func__,ParticleFuncB initFunc,ParticleFuncC tickFunc,void *object,ParticleEmmiter *link){
  Particle_s *pPVar2;
  ParticleEmmiter *paVar3;
  
  if ((param_1->count2 < ParticleEmmiMAX) &&
     (pPVar2 = FUN_800b26d8(param_1,lifespan), pPVar2->id != param_1->particleStructCount)) {
    paVar3 = &param_1->Emmiter[param_1->emmitterIndecies[param_1->count2++]];
    InitEmmiter(paVar3,paVar3->ID);
    paVar3->lifespan = lifespan;
    paVar3->flags = 0x8007;
    paVar3->unk8 = param_4;
    paVar3->funcA = func__;
    paVar3->funcB = initFunc;
    paVar3->funcC = tickFunc;
    paVar3->object = object;
    paVar3->texture = texture;
    paVar3->link = link;
    if ((texture < 0) || (param_1->TextureCount <= texture)) {
      char acStack_a0 [160];
      sprintf(acStack_a0,"Invalid Texture: %d\nRange: 0 - %d\n",texture,param_1->TextureCount - 1);
      CRASH("AllocParticleEmitter",acStack_a0);
    }
    paVar3->particles = pPVar2;
    pPVar2->flags = 0xc00a;
  }
  else paVar3 = NULL;
  return paVar3;
}


void Particle::FreeParticleEmitter(ParticleHeadStruct *param_1,ParticleEmmiter *param_2){
  short sVar1;
  int iVar2;
  ushort uVar4;
  longlong lVar5;
  
  if ((param_2->flags & 4)) {
    sVar1 = param_2->particles[0].unk6;
    while (sVar1 != -1){
      if (!param_1->particles[sVar1].flags&8) return;
      sVar1 = param_1->particles[sVar1].unk6;
    }
  }
  if (param_2->particles) {
    sVar1 = param_2->particles[0].unk6;
    while (sVar1 != -1) {
      iVar2 = (int)sVar1;
      sVar1 = param_1->particles[iVar2].unk6;
      FUN_800b282c(param_1,param_1->particles + iVar2);
    }
    FUN_800b282c(param_1,param_2->particles);
  }
  param_2->particles = NULL;
  param_1->emmitterIndecies[--param_1->count2] =param_2->ID;
  param_2->lifespan = 0;
  param_2->flags = 0;
  if (param_1->count2<0) CRASH("FreeParticleEmitter","free'd below 0!!");
}

void Particle::ResetEmmiter(ParticleHeadStruct *param_1,ParticleEmmiter *param_2){
  UnsetEmmiterFlags(param_2,4);
  FreeParticleEmitter(param_1,param_2);
}

void Particle::FUN_800b2bc4(ParticleHeadStruct *param_1){
  for(u16 i=0;i<ParticleEmmiMAX;i++) {
    ParticleEmmiter *pPVar2 = &param_1->Emmiter[i];
    if (0 < pPVar2->lifespan)
      ResetEmmiter(param_1,pPVar2);
  }
}

float Particle::OneOverLifespan(Particle_s *param_1){return 1.0f / (param_1->lifespan + -1);}


void Particle::SetColorA(Particle_s *param_1,float r,float g,float b,float a){
  (param_1->colorA).x = r;
  (param_1->colorA).y = g;
  (param_1->colorA).z = b;
  (param_1->colorA).w = a;
}

void Particle::SetPos(Particle_s *param_1,float x,float y,float z){
  (param_1->pos).x = x;
  (param_1->pos).y = y;
  (param_1->pos).z = z;
}

void Particle::SetVel(Particle_s *param_1,float x,float y,float z){
  (param_1->vel).x = x;
  (param_1->vel).y = y;
  (param_1->vel).z = z;
}

void Particle::SetScale(Particle_s *p,float x,float y){
  (p->scale).x = x;
  (p->scale).y = y;
}


void Particle::SetColorB(Particle_s *param_1,float r,float g,float b,float a){
  (param_1->ColorB).x = r;
  (param_1->ColorB).y = g;
  (param_1->ColorB).z = b;
  (param_1->ColorB).w = a;
}

void Particle::SetFlag(Particle_s *part,u16 flag){part->flags|= flag;}

void Particle::UnsetFlag(Particle_s *param_1,ushort param_2){param_1->flags &= ~param_2;}

void Particle::SetEmmiterFlags(ParticleEmmiter *param_1,ushort param_2){param_1->flags|= param_2;}

void Particle::UnsetEmmiterFlags(ParticleEmmiter *param_1,ushort param_2){param_1->flags&=~param_2;}


void Particle::SetEmmiterHeight(ParticleEmmiter *param_1,float param_2){
  param_1->height = param_2;
  SetEmmiterFlags(param_1,0x4000);
}

void Particle::UnsetEmmiterFlag4000(ParticleEmmiter *param_1){UnsetEmmiterFlags(param_1,0x4000);}

Gfx * Particle::FUN_800b2d34(Gfx *g,ParticleHeadStruct *param_2,vec3f *v,u16 buffChoice){
  guAlign(&param_2->alignMtx[buffChoice],0.0,v->x + NORMALIZE_MIN,v->y,v->z);
  (g->words).w0 = 0xe7000000;
  (g->words).w1 = 0;
  g[1].words.w0 = 0xe3000a01;
  *(undefined4 *)((int)g + 0xc) = 0;
  g[2].words.w0 = 0xe3000800;
  *(undefined4 *)((int)g + 0x14) = 0;
  g[3].words.w0 = 0xe200001c;
  *(undefined4 *)((int)g + 0x1c) = 0x504a50;
  g[4].words.w0 = 0xfc121824;
  *(undefined4 *)((int)g + 0x24) = 0xff33ffff;
  g[5].words.w0 = 0xe3001700;
  *(undefined4 *)((int)g + 0x2c) = 0;
  g[6].words.w0 = 0xe3001801;
  *(undefined4 *)((int)g + 0x34) = 0x80;
  g[7].words.w0 = 0xe2001e01;
  *(undefined4 *)((int)g + 0x3c) = 0;
  g[8].words.w0 = 0xe3001a01;
  *(undefined4 *)((int)g + 0x44) = 0;
  g[9].words.w0 = 0xe3000f00;
  *(undefined4 *)((int)g + 0x4c) = 0;
  g[10].words.w0 = 0xe3001001;
  *(undefined4 *)((int)g + 0x54) = 0;
  *(undefined4 *)((int)g + 0x5c) = 0xc00;
  g[0xb].words.w0 = 0xe3001402;
  *(undefined4 *)((int)g + 100) = 0x2000;
  g[0xc].words.w0 = 0xe3001201;
  g[0xd].words.w0 = 0xe3000c00;
  *(undefined4 *)((int)g + 0x6c) = 0x80000;
  g[0xe].words.w0 = 0xe3000d01;
  *(undefined4 *)((int)g + 0x74) = 0;
  g[0xf].words.w0 = 0xd7000002;
  *(undefined4 *)((int)g + 0x7c) = 0x80008000;
  return g + 0x10;
}

Gfx * Particle::FUN_800b2f9c(Gfx *param_1,u16 param_2){
  (param_1->words).w0 = 0xd9000000;
  (param_1->words).w1 = 0;
  if (param_2 == 0) {
    *(undefined4 *)((int)param_1 + 0xc) = 0x200004;
    param_1[1].words.w0 = 0xd9ffffff;
    param_1[2].words.w0 = 0xe2001d00;
    *(undefined4 *)((int)param_1 + 0x14) = 4;
  }
  else {
    param_1[1].words.w0 = 0xd9ffffff;
    *(undefined4 *)((int)param_1 + 0xc) = 0x200005;
    param_1[2].words.w0 = 0xe2001d00;
    *(undefined4 *)((int)param_1 + 0x14) = 0;
  }
  return param_1 + 3;
}

Vtx gParticleVerts[4];

void SetVtx(Vtx_t *v,float x,float y,float z,u16 flag,s16 U,s16 V,u8 R,u8 G,u8 B,u8 A){
  v->flag = flag;
  v->tc[0] = U;
  v->tc[1] = V;
  v->cn[0] = R;
  v->cn[1] = G;
  v->cn[2] = B;
  v->cn[3] = A;
  v->ob[0] = x*16.f;
  v->ob[1] = y*16.0f;
  v->ob[2] = z*16.0f;
}

void Particle::RenderParticles(Gfx **gg,ParticleHeadStruct *phead,Particle_s *part,Borg1Header *texture,ushort framebuff){
Mtx *pMVar2;
Color32 color;
vec4f fStack128;
Gfx *g;

g = *gg;
if (struct_unk_.vertsNeedSet) {
struct_unk_.vertsNeedSet = 0;
SetVtx(&gParticleVerts[0].v,-353.55f,353.55f,0.0,0,0,0x400,0xff,0xff,0xff,0xff);
SetVtx(&gParticleVerts[1].v,353.55f,353.55f,0.0,0,0x400,0x400,0xff,0xff,0xff,0xff);
SetVtx(&gParticleVerts[2].v,-353.55f,-353.55f,0.0,0,0,0,0xff,0xff,0xff,0xff);
SetVtx(&gParticleVerts[3].v,353.55f,-353.55f,0.0,0,0x400,0,0xff,0xff,0xff,0xff);
}
fStack128.x = (part->colorA).x;
fStack128.y = (part->colorA).y;
fStack128.z = (part->colorA).z;
fStack128.w = (part->colorA).w;
if (phead->gray < 1.0f) multiVec4(&fStack128,phead->gray);
color.R = fStack128.r * 255.0f;
color.G = fStack128.g * 255.0f;
color.B = fStack128.b * 255.0f;
color.A = fStack128.a * 255.0f;

guScale(&part->scaleMtx[framebuff],((part->scale).x * 0.001),((part->scale).y * 0.001),0.0);
guTranslate(part->translateMtx + framebuff,(part->pos).x * 16.0f,(part->pos).y * 16.0f,(part->pos).z * 16.0f);
gSPMatrix(g++,(part->translateMtx + framebuff),G_MTX_PUSH);
if ((part->flags & 4) == 0) pMVar2 = phead->alignMtx + framebuff;
else pMVar2 = &part->alignMtx;
gSPMatrix(g++,pMVar2,G_MTX_LOAD|G_MTX_PUSH);
gSPMatrix(g++,(part->scaleMtx + framebuff),G_MTX_LOAD|G_MTX_PUSH);
if (texture == NULL) CRASH("../src/Particles.cpp","Particle without texture!");
gSPVertex(g++,gParticleVerts,4,8);
//uses F3dEX macros(?) why not use SetVtx()?
gDma1p(g++, G_MODIFYVTX, G_MWO_POINT_RGBA , 0, color.W);
gDma1p(g++, G_MODIFYVTX, G_MWO_POINT_ST , 0, texture->dat->Height << 5);
gDma1p(g++, G_MODIFYVTX, G_MWO_POINT_RGBA , 2, color.W);
gDma1p(g++, G_MODIFYVTX, G_MWO_POINT_ST , 2, texture->dat->Width << 21|texture->dat->Height << 5);
gDma1p(g++, G_MODIFYVTX, G_MWO_POINT_RGBA , 4, color.W);
gDma1p(g++, G_MODIFYVTX, G_MWO_POINT_ST , 4, 0);
gDma1p(g++, G_MODIFYVTX, G_MWO_POINT_RGBA , 6, color.W);
gDma1p(g++, G_MODIFYVTX, G_MWO_POINT_ST , 6, texture->dat->Width << 21);
//VERY dirty gSP2Triangles() hack
g->words.w0=(_SHIFTL(G_TRI2, 24, 8),_SHIFTL((0)*2,16,8)|_SHIFTL((1)*2,8,8)|_SHIFTL((2)*2,0,8));
g->words.w1=(_SHIFTL((2)*2,16,8)|_SHIFTL((1)*2,8,8)|_SHIFTL((3)*2,0,8));
g++;
*gg = g;
}

SceneData * GetLocatorScene(SceneData *pRet,u16 param_2){
  switch(param_2){
    case 1:
    pRet = pRet->link2a4;
    break;
    case 0:
    break;
    case 2:
    pRet = pRet->link2a8;
    break;
    default:
    char acStack_110 [128];
    sprintf(acStack_110,"GetLocatorScene:\nInvalid locatorScene: %d",param_2);
    CRASH(FILENAME,acStack_110);
  }
  if(!pRet){
  char acStack_90 [144];
  sprintf(acStack_90,"GetLocatorScene:\npRet == NULL locatorScene: %d",param_2);
  CRASH(FILENAME,acStack_90);
  }
return pRet;
}



void BorgParticleEmitterCallback(ParticleHeadStruct *param_1,ParticleEmmiter *param_2)

{
  SceneData *pSVar1;
  SceneData *scene;
  uint uVar4;
  Borg5_particle *puVar2;
  
  scene = param_2->sceneDat;
  puVar2 = (Borg5_particle *)param_2->object;
  if (scene == NULL) CRASH("BorgParticleEmitterCallback","No Scene attached to emmiter!");
  pSVar1 = GetLocatorScene(scene,(u16)(((ushort)puVar2->flag0 & 0x180) >> 7));
  uVar4 = (ushort)puVar2->flag0 & 7;
  if (Scene::SceneGetLocatorPos(pSVar1,&puVar2->pos,uVar4)) {
    if ((puVar2->flagE & 0x10)) Scene::SceneGetLocatorNorm(pSVar1,&puVar2->norm,uVar4);
    if ((puVar2->flagE & 0x2000)) {
      scene = GetLocatorScene(scene,(u16)(((ushort)puVar2->flag2 & 0x180) >> 7));
      Scene::SceneGetLocatorPos(scene,&puVar2->pos2,(ushort)puVar2->flag2 & 7);
    }
  }
  else {
    setVec3(&puVar2->pos,0.0,0.0,0.0);
    setVec3(&puVar2->norm,0.0,1.0f,0.0);
    setVec3(&puVar2->pos2,1.0,1.0,1.0);
    param_2->lifespan = 0;
  }
}


void BorgParticleEmitterB(ParticleHeadStruct *param_1,ParticleEmmiter *param_2){
  vec3f v3Temp;
  vec4f v4Temp;
  Borg5_particle *pvVar2 = (Borg5_particle *)param_2->object;
  Particle_s *p = Particle::FUN_800b277c(param_1,param_2,pvVar2->field5_0xa);
  if ((pvVar2->flagE & 8) == 0)
    PartRand.GetVec3(&v3Temp,PartRand.GetFloatRange(0,pvVar2->randRangeA));
  else PartRand.GetVec3(&v3Temp,pvVar2->randRangeA);
  if ((pvVar2->flagE & 0x200) == 0) {
    vec3_sum(&p->pos,&pvVar2->pos,&v3Temp);
  }
  else {
    vec3_sum(&p->pos,&(param_2->collision).pos,&v3Temp);
  }
  PartRand.GetVec3(&p->vel,pvVar2->randRangeC);
  v3Temp.x = (pvVar2->norm).x * pvVar2->unk90;
  v3Temp.y = (pvVar2->norm).y * pvVar2->unk90;
  v3Temp.z = (pvVar2->norm).z * pvVar2->unk90;
  vec3_sum(&p->vel,&p->vel,&v3Temp);
  multiVec3(&p->vel,0.006);
  float scale = PartRand.GetFloatRange(pvVar2->unk94,pvVar2->randRangeD);
  Particle::SetScale(p,scale,scale);
  (p->colorA).r = PartRand.GetFloatRange(((pvVar2->colRandLo).R / 255.0),((pvVar2->colRandHi).R / 255.0));
  (p->colorA).g = PartRand.GetFloatRange(((pvVar2->colRandLo).G / 255.0),((pvVar2->colRandHi).G / 255.0));
  (p->colorA).b = PartRand.GetFloatRange(((pvVar2->colRandLo).B / 255.0),((pvVar2->colRandHi).B / 255.0));
  (p->colorA).a = PartRand.GetFloatRange(((pvVar2->colRandLo).A / 255.0),((pvVar2->colRandHi).A / 255.0));
  if ((pvVar2->flagE & 0x2000) != 0) {
    if ((pvVar2->flagE & 4) == 0)
      PartRand.GetVec3(&v3Temp,PartRand.GetFloatRange(0,pvVar2->randRangeB));
    else PartRand.GetVec3(&v3Temp,pvVar2->randRangeB);
    vec3_sum(&v3Temp,&v3Temp,&pvVar2->pos2);
    Vec3_sub(&v3Temp,&v3Temp,&p->pos);
    multiVec3(&v3Temp,(float)(1.0 / (double)(int)p->lifespan));
    vec3_sum(&p->vel,&p->vel,&v3Temp);
  }
  if ((pvVar2->flagE & 0x4000)) {
    v4Temp.x = ((pvVar2->colBlend).R / 255.0);
    v4Temp.y = ((pvVar2->colBlend).G / 255.0);
    v4Temp.z = ((pvVar2->colBlend).B / 255.0);
    v4Temp.w = ((pvVar2->colBlend).A / 255.0);
    Vec4_sub(&p->ColorB,&v4Temp,&p->colorA);
    multiVec4(&p->ColorB,(float)(1.0 / (double)(int)p->lifespan));
    p->unk4 = p->id;
    Particle::SetFlag(p,0x200);
  }
}


ParticleEmmiter *
Particle::FUN_800b3c18(ParticleHeadStruct *param_1,SceneData *scene,Borg5_particle *dat){
  u16 uVar1;
  ParticleEmmiter *pEmmi;
  ushort uVar3;
  Particle_s *pPVar2;
  vec3f *res;
  float fVar4;
  
  if (dat->unk8 < 1) return NULL;
  if ((short)dat->field5_0xa < 1) return NULL;
  pEmmi = AllocParticleEmitter(param_1,dat->unk8,dat->texture,dat->unk14,
           BorgParticleEmitterCallback,NULL,NULL,dat,NULL);
  if (pEmmi == NULL) return NULL;
  pEmmi->sceneDat = scene;
  if (dat->unk14 != 0) {
    pEmmi->funcB = BorgParticleEmitterB;
  }
  pEmmi->lifespanemmiter = dat->lifespan;
  if ((dat->flagE & 1)){
    SetEmmiterHeight(pEmmi,0.0);
  }
  SetFlag(pEmmi->particles,0x140);
  fVar4 = 0.006f;
  SetColorB(pEmmi->particles,(dat->colVA).x,(dat->colVA).y,(dat->colVA).z,(dat->colVA).w);
  multiVec3((vec3f *)&pEmmi->particles->ColorB,0.006f);
  if ((dat->flagE & 0x1000) == 0){
    pPVar2 = FUN_800b277c(param_1,pEmmi,dat->unk8);
    if (pPVar2 == NULL) goto LAB_800b3e80;
    SetFlag(pPVar2,0x800);
    UnsetFlag(pPVar2,0x10);
    pPVar2->unk4 = pEmmi->particles->id;
    SetColorB(pPVar2,(dat->colVB).x,(dat->colVB).y,(dat->colVB).z,(dat->colVB).w);
    multiVec3((vec3f *)&pPVar2->ColorB,0.006f);
  }
  if ((dat->flagE & 0x800)) {
    pPVar2 = FUN_800b27cc(param_1,pEmmi,dat->unk8);
    if (pPVar2 == NULL) goto LAB_800b3e80;
    uVar1 = pPVar2->id;
    SetFlag(pPVar2,0x140);
    fVar4 = 0.006f;
    SetColorB(pPVar2,(dat->colVC).x,(dat->colVC).y,(dat->colVC).z,(dat->colVC).w);
    multiVec3((vec3f *)&pPVar2->ColorB,0.006f);
    if ((dat->flagE & 0x400)){
      pPVar2 = FUN_800b277c(param_1,pEmmi,dat->unk8);
      if (pPVar2 == NULL) goto LAB_800b3e80;
      SetFlag(pPVar2,0x800);
      UnsetFlag(pPVar2,0x10);
      pPVar2->unk4 = uVar1;
      SetColorB(pPVar2,(dat->colVD).x,(dat->colVD).y,(dat->colVD).z,(dat->colVD).w);
      multiVec3((vec3f *)&pPVar2->ColorB,0.006f);
    }
  }
  if ((dat->flagE & 0x8000)) {
    pPVar2 = FUN_800b27cc(param_1,pEmmi,dat->unk8);
    if (pPVar2 == NULL) {
LAB_800b3e80:
      FreeParticleEmitter(param_1,pEmmi);
      return NULL;
    }
    SetFlag(pPVar2,0x400);
    fVar4 = (dat->unk9c - dat->unk94) / (float)dat->field5_0xa;
    SetColorB(pPVar2,fVar4,fVar4,fVar4,0.0);
  }
  if ((dat->flagE & 0x200) != 0) {
    SetEmmiterFlags(pEmmi,0x2000);
    copyVec3(&dat->pos,&(pEmmi->collision).pos);
    res = &(pEmmi->collision).vel;
    Vec3_sub(res,&dat->pos,&dat->pos2);
    vec3_normalize(res);
    multiVec3(res,(float)((double)dat->unk10 * 0.006));
  }
  BorgParticleEmitterCallback(param_1,pEmmi);
  uVar3 = 0;
  if (dat->count != 0) {
    do {
      BorgParticleEmitterB(param_1,pEmmi);
      uVar3 += 1;
    } while (uVar3 < dat->count);
    return pEmmi;
  }
  return pEmmi;
}


void Particle::UnsetSceneEmmiter(ParticleHeadStruct *param_1,SceneData *param_2){
  if (((param_1) && (param_2)) && (param_1->Emmiter)) {
    for(u16 i=0;i<ParticleEmmiMAX;i++) {
        ParticleEmmiter *pPVar2 =&param_1->Emmiter[i];
      if (((pPVar2->flags & 0x8000)) && (param_2 == pPVar2->sceneDat))
        ResetEmmiter(param_1,pPVar2);
    }
  }
}


bool Particle::FUN_800b4030(ParticleHeadStruct *param_1,SceneData *param_2){
  if ((param_1) && (param_2)) {
    ParticleEmmiter *pPVar1 = param_1->Emmiter;
    if (pPVar1) {
      for(u16 i=0;i<ParticleEmmiMAX;i++){
        if((pPVar1[i].flags & 0x8000)&&(param_2 ==pPVar1[i].sceneDat)) return true;
      }
    }
  }
  return false;
}

void noop_800b40a4(u16 x,u16 y){}

void passto_noop_800b40a4(){noop_800b40a4(1,0xffff);}

