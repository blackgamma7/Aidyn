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
  if (partCount > ParticleMAX){
    char acStack_98 [152];
    sprintf(acStack_98,"Too Many Particles!!\nCall: %d - Max: %d\n",partCount,ParticleMAX);
    CRASH("InitParticleHead",acStack_98);
  }
  head->particleStructCount = partCount;
  ALLOCS(head->particles,(u16)(partCount+1)*sizeof(Particle_s),223);
  head->gray = 1.0f;
  Particle::InitEmmiters(head);
  Particle::InitParticles(head);
  Particle::LoadTextures(head,textCount,textureP);
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


void Particle::UpdateParticle(ParticleHeadStruct *head,vec4f *col,u32 flag,s16 index,float delta){

  s32 iVar5 = index;
  s32 lVar4 = iVar5;
  if (lVar4 != -1) {
    do {
      Particle_s* part = &head->particles[index+lVar4];
      lVar4 = part->unk6;
      if (!(flag & PARTICLE_8000)) lVar4 = -1;
      float dScale = 1.0f;
      if ((flag & PARTICLE_0040)) dScale = col->w;
      if ((flag & PARTICLE_0800)) {
        part->colorB.r+=col->x * delta * dScale;
        part->colorB.g+=col->y * delta * dScale;
        part->colorB.b+=col->z * delta * dScale;
        part->colorB.a+=col->w * delta * dScale;
      }
      if (!(part->flags & PARTICLE_4000)) {
        if ((flag & PARTICLE_0080)) {
          part->pos.x+=col->x * delta * dScale;
          part->pos.y+=col->y * delta * dScale;
          part->pos.z+=col->z * delta * dScale;
        }
        if ((flag & PARTICLE_0100)) {
          part->vel.x+=col->x * delta * dScale;
          part->vel.y+=col->y * delta * dScale;
          part->vel.z+=col->z * delta * dScale;
        }
        if ((flag & PARTICLE_0200)) {
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
        if ((flag & PARTICLE_0400)) {
          part->scale.x+=col->x * delta * dScale;
          part->scale.y+=col->y * delta * dScale;
          FLOOR(part->scale.y,0.0);
          FLOOR(part->scale.y,0.0);
        }
      }
    } while (lVar4 != -1);
  }
}

void Particle::ApplyVelocity(ParticleHeadStruct *head,ParticleEmmiter *emmi,s16 index,float delta){
  Particle_s *part = &head->particles[index];
  part->pos.x+=part->vel.x * delta;
  part->pos.y+=part->vel.y * delta;
  part->pos.z+=part->vel.z * delta;
  if ((emmi->flags & PARTEMMI_4000)&&(part->pos.y < emmi->height)) {
    part->pos.y -= part->vel.y;
    part->vel.x *=.6;
    part->vel.y *=-.6;
    part->vel.z *=.6;
  }
  if (((part->flags & PARTICLE_8000) == 0)&&(part->unk4 != -1)) UpdateParticle(head,&part->colorB,part->flags,part->unk4,delta);
  else UpdateParticle(head,&part->colorB,part->flags,emmi->particles->id,delta);
}


void Particle::ProcessAndRenderParticleHead(Gfx **gg,ParticleHeadStruct *pPH,vec3f *param_3,s16 delta,u16 viBuff,u16 param_6){
  int iVar2;
  short sVar4;
  Particle_s *pPVar3;
  u16 uVar5;
  int iVar6;
  int i;
  ParticleEmmiter *pE;
  s16 lVar9;
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
    if ((pE->flags & PARTEMMI_8000) == 0) {
LAB_800b2590:
      iVar2 = (i + 1) * 0x10000;
    }
    else if (uStack_34 == 0) {
      iVar2 = (i + 1) * 0x10000;
      if ((pE->flags & PARTEMMI_1000)) {
        goto LAB_800b2214;
      }
    }
    else {
      iVar2 = (i + 1) * 0x10000;
      if ((pE->flags & PARTEMMI_1000) == 0) {
LAB_800b2214:
        if (0 < pE->lifespanemmiter) {
          pE->lifespanemmiter -=delta_;
          if (pE->lifespanemmiter < 0) pE->lifespanemmiter = 0;
          goto LAB_800b2590;
        }
        if (iStack_30 == 0) {
          iStack_30 = 1;
          pGStack_38 = GraphicsInit(pGStack_38,pPH,param_3,viBuff);
          pGStack_38 = SetGeoMode(pGStack_38,(u16)uStack_34);
        }
        if (-1 < pE->lifespan) {
          if (pE->funcA) (*pE->funcA)(pPH,pE);
          if ((pE->flags & PARTEMMI_2000)&&(pPH->borg9dat))
            ProcessCollisionSphere(pPH->borg9dat,&pE->collision,delta);
          if (!pPH->ppTextures[pE->texture])
            CRASH("../src/Particles.cpp","pPH->ppTextures[pE->texture] == NULL\nParticle emitter tried to use an discarded texture!");
          pGStack_38 = FUN_8009d3dc(pGStack_38,pPH->ppTextures[pE->texture],0);
          pGStack_38 = loadTextureImage(pGStack_38,pPH->ppTextures[pE->texture],NULL);
          pE->lifespan -=delta_;
          if (pE->funcB == NULL) {
LAB_800b23cc:
          }
          else if (pE->lifespan >= 1){
            if (0 < pE->unk6) {
                pE->unk6 -= delta;
              goto LAB_800b23cc;
            }
            pE->unk6 = pE->count;
            iVar2 = (int)(short)pE->count;
            if (iVar2 < 0) {
              if (iVar2 < 0) iVar2 = -iVar2;
              iVar6 = 0x10000;
              if (iVar2 < 1) goto LAB_800b23cc;
              do {
                (*pE->funcB)(pPH,pE);
                lVar9 = pE->count;
                iVar2 = iVar6 >> 0x10;
                if (lVar9 < 0) {
                  lVar9 = -(int)(short)pE->count;
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
          lVar9 = pE->particles->id;
          if (lVar9 != -1) {
            do {
              if ((lVar9 < 0) || (pPH->particleStructCount < lVar9)) {
                sprintf(acStack_78,"Particle ERROR: %d, %d",pE->ID,lVar9);
                CRASH("ProcessAndRenderParticleHead",acStack_78);
              }
              pPVar3 = pPH->particles + (int)lVar9;
              if ((short)pPVar3->lifespan < 0) {
LAB_800b24c4:
              }
              else {
                pPVar3->lifespan-= delta;
                ApplyVelocity(pPH,pE,(short)lVar9,(float)delta_);
                if ((pPVar3->flags & PARTICLE_0010)) {
                  if (0 < (short)pPVar3->lifespan) {
                    if ((pPVar3->flags & PARTICLE_0020)) {
                      UnsetFlag(pPVar3,PARTICLE_0020);
                      goto LAB_800b24c8;
                    }
                    RenderParticles(&pGStack_38,pPH,pPVar3,pPH->ppTextures[pE->texture],viBuff);
                  }
                  goto LAB_800b24c4;
                }
              }
LAB_800b24c8:
              lVar9 = pPVar3->unk6;
              if ((short)pPVar3->lifespan < 1) {
                if ((pPVar3->flags & PARTICLE_0002)) {
                  UnsetFlag(pPVar3,PARTICLE_0010);
                  pPVar3->lifespan = 0;
                }
                if ((pPVar3->flags & PARTICLE_0001)) {
                  FUN_800b282c(pPH,pPVar3);
                }
              }
              else if ((pPVar3->id != pE->particles->id) && (pE->funcC)) {
                (*pE->funcC)(pPH,pE,pPVar3);
              }
            } while (lVar9 != -1);
          }
          iVar2 = (i + 1) * 0x10000;
          if (0 < pE->lifespan) continue;
        }
        if ((pE->flags & PARTEMMI_0002)) pE->lifespan = 0;
        if ((pE->flags & PARTEMMI_0001)) FreeParticleEmitter(pPH,pE);
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

void Particle::FUN_800b266c(ParticleHeadStruct *pHead,Particle_s *part){
  if (part->unk6 != -1)
    pHead->particles[part->unk6].unk8 =part->unk8;
  if (part->unk8 != -1)
    pHead->particles[part->unk8].unk6 =part->unk6;
  part->unk6 = -1;
  part->unk8 = -1;
}


Particle_s * Particle::FUN_800b26d8(ParticleHeadStruct *pHead,u16 lifespan){
  int iVar2;
  if (pHead->count1 == pHead->particleStructCount)
    iVar2 = (short)pHead->count1 * 0xd;
  else
    iVar2 = pHead->particleindecies[pHead->count1++];
  Particle_s *part = &pHead->particles[iVar2];
  InitParticle(part,part->id);
  part->flags = PARTICLE_0020|PARTICLE_0010|PARTICLE_0001;
  part->lifespan = lifespan;
  return part;
}

Particle_s * Particle::FUN_800b277c(ParticleHeadStruct *pHead,ParticleEmmiter *pEmmi,u16 lifespan){
  Particle_s *pPVar1 = FUN_800b26d8(pHead,lifespan);
  FUN_800b25e0(pHead,pEmmi,pPVar1);
  return pPVar1;
}

Particle_s * Particle::FUN_800b27cc(ParticleHeadStruct *param_1,ParticleEmmiter *param_2,u16 param_3){
  Particle_s *pPVar1 = FUN_800b26d8(param_1,param_3);
  pPVar1->flags = (PARTICLE_8000|PARTICLE_4000|PARTICLE_0008|PARTICLE_0002);
  FUN_800b25e0(param_1,param_2,pPVar1);
  return pPVar1;
}

void Particle::FUN_800b282c(ParticleHeadStruct *head,Particle_s *part){
  FUN_800b266c(head,part);
  if (part->id != head->particleStructCount)
    head->particleindecies[--head->count1] = part->id;
  part->flags = 0;
  part->lifespan = 0;
}

bool Particle::FUN_800b2890(ParticleHeadStruct *head,ParticleEmmiter *emmi,Particle_s *part){
  FUN_800b266c(head,part);
  return FUN_800b25e0(head,emmi,part);
}


ParticleEmmiter *
Particle::AllocParticleEmitter(ParticleHeadStruct *head,s16 lifespan,s16 texture,u16 count,
            ParticleFuncA func__,ParticleFuncB initFunc,ParticleFuncC tickFunc,void *object,ParticleEmmiter *link){
  Particle_s *part;
  ParticleEmmiter *emmi;
  
  if ((head->count2 < ParticleEmmiMAX) &&
     (part = FUN_800b26d8(head,lifespan), part->id != head->particleStructCount)) {
    emmi = &head->Emmiter[head->emmitterIndecies[head->count2++]];
    InitEmmiter(emmi,emmi->ID);
    emmi->lifespan = lifespan;
    emmi->flags = (PARTEMMI_8000|PARTEMMI_0004|PARTEMMI_0002|PARTEMMI_0001);
    emmi->count = count;
    emmi->funcA = func__;
    emmi->funcB = initFunc;
    emmi->funcC = tickFunc;
    emmi->object = object;
    emmi->texture = texture;
    emmi->link = link;
    if ((texture < 0) || (head->TextureCount <= texture)) {
      #ifdef DEBUGVER
      char errBuff [160];
      sprintf(errBuff,"Invalid Texture: %d\nRange: 0 - %d\n",texture,head->TextureCount - 1);
      CRASH("AllocParticleEmitter",errBuff);
      #else
      CRASH("","");
      #endif
    }
    emmi->particles = part;
    part->flags = (PARTICLE_8000|PARTICLE_4000|PARTICLE_0008|PARTICLE_0002);
  }
  else emmi = NULL;
  return emmi;
}

void Particle::FreeParticleEmitter(ParticleHeadStruct *head,ParticleEmmiter *emmi){
  short sVar1;
  int iVar2;
  ushort uVar4;
  longlong lVar5;
  
  if ((emmi->flags & PARTEMMI_0004)) {
    sVar1 = emmi->particles[0].unk6;
    while (sVar1 != -1){
      if (!head->particles[sVar1].flags & PARTICLE_0008) return;
      sVar1 = head->particles[sVar1].unk6;
    }
  }
  if (emmi->particles) {
    sVar1 = emmi->particles[0].unk6;
    while (sVar1 != -1) {
      iVar2 = (int)sVar1;
      sVar1 = head->particles[iVar2].unk6;
      FUN_800b282c(head,head->particles + iVar2);
    }
    FUN_800b282c(head,emmi->particles);
  }
  emmi->particles = NULL;
  head->emmitterIndecies[--head->count2] =emmi->ID;
  emmi->lifespan = 0;
  emmi->flags = 0;
  #ifdef DEBUGVER
  if (head->count2<0) CRASH("FreeParticleEmitter","free'd below 0!!");
  #endif
}

void Particle::ResetEmmiter(ParticleHeadStruct *head,ParticleEmmiter *param_2){
  UnsetEmmiterFlags(param_2,PARTEMMI_0004);
  FreeParticleEmitter(head,param_2);
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
  (param_1->colorB).x = r;
  (param_1->colorB).y = g;
  (param_1->colorB).z = b;
  (param_1->colorB).w = a;
}

void Particle::SetFlag(Particle_s *part,u16 flag){part->flags|= flag;}

void Particle::UnsetFlag(Particle_s *param_1,ushort param_2){param_1->flags &= ~param_2;}

void Particle::SetEmmiterFlags(ParticleEmmiter *param_1,ushort param_2){param_1->flags|= param_2;}

void Particle::UnsetEmmiterFlags(ParticleEmmiter *param_1,ushort param_2){param_1->flags&=~param_2;}

void Particle::SetEmmiterHeight(ParticleEmmiter *emmi,float param_2){
  emmi->height = param_2;
  SetEmmiterFlags(emmi,PARTEMMI_4000);
}

void Particle::UnsetEmmiterFlag4000(ParticleEmmiter *emmi){UnsetEmmiterFlags(emmi,PARTEMMI_4000);}

Gfx * Particle::GraphicsInit(Gfx *g,ParticleHeadStruct *pHead,vec3f *v,u16 buffChoice){
  guAlign(&pHead->alignMtx[buffChoice],0.0,v->x + NORMALIZE_MIN,v->y,v->z);
  gDPPipeSync(g++);
  gDPSetCycleType(g++,0);
  gDPPipelineMode(g++,0);
  gDPSetRenderMode(g++,0x504a50,0);
  gDPSetCombine(g++,0x121824,0xff33ffff);
  gDPSetCombineKey(g++,0);
  gDPSetColorDither(g++,G_CD_NOISE);
  gDPSetAlphaCompare(g++,0);
  gDPSetAlphaDither(g++,0);
  gDPSetTextureLOD(g++,0);
  gDPSetTextureLUT(g++,0);
  gDPSetTextureConvert(g++,G_TC_FILT);
  gDPSetTextureFilter(g++,G_TF_BILERP);
  gDPSetTextureLUT(g++,G_TT_RGBA16);
  gDPSetTextureDetail(g++,0);
  gSPTexture(g++,0x8000,0x8000,0,G_TX_RENDERTILE,G_ON);
  return g;
}

Gfx * Particle::SetGeoMode(Gfx *g,u16 zBuff){
  gSPSetGeometryMode(g++,0);
  if(zBuff){
    gSPLoadGeometryMode(g++,G_SHADING_SMOOTH|G_SHADE|G_ZBUFFER);
    gDPSetDepthSource(g++,G_ZS_PIXEL);
  }
  else{
    gSPLoadGeometryMode(g++,G_SHADING_SMOOTH|G_SHADE);
    gDPSetDepthSource(g++,G_ZS_PRIM);
  }
  return g;
}

Vtx gParticleVerts[4];

void SetVtx(Vtx_t *vx,float x,float y,float z,u16 flag,s16 U,s16 V,u8 R,u8 G,u8 B,u8 A){
  vx->flag = flag;
  vx->tc[0] = U;
  vx->tc[1] = V;
  vx->cn[0] = R;
  vx->cn[1] = G;
  vx->cn[2] = B;
  vx->cn[3] = A;
  vx->ob[0] = x*16.f;
  vx->ob[1] = y*16.0f;
  vx->ob[2] = z*16.0f;
}

void Particle::RenderParticles(Gfx **gg,ParticleHeadStruct *phead,Particle_s *part,Borg1Header *texture,ushort framebuff){
Mtx *pMVar2;
Color32 color;
vec4f tempV4;
Gfx *g = *gg;
if (struct_unk_.vertsNeedSet) {
  struct_unk_.vertsNeedSet = false;
  SetVtx(&gParticleVerts[0].v,-353.55f,353.55f,0.0,0,0,0x400,COLOR_WHITE);
  SetVtx(&gParticleVerts[1].v,353.55f,353.55f,0.0,0,0x400,0x400,COLOR_WHITE);
  SetVtx(&gParticleVerts[2].v,-353.55f,-353.55f,0.0,0,0,0,COLOR_WHITE);
  SetVtx(&gParticleVerts[3].v,353.55f,-353.55f,0.0,0,0x400,0,COLOR_WHITE);
}
tempV4.x = (part->colorA).x;
tempV4.y = (part->colorA).y;
tempV4.z = (part->colorA).z;
tempV4.w = (part->colorA).w;
if (phead->gray < 1.0f) Vec4Scale(&tempV4,phead->gray);
color.R = tempV4.r * 255.0f;
color.G = tempV4.g * 255.0f;
color.B = tempV4.b * 255.0f;
color.A = tempV4.a * 255.0f;

guScale(&part->scaleMtx[framebuff],((part->scale).x * 0.001),((part->scale).y * 0.001),0.0);
guTranslate(part->translateMtx + framebuff,(part->pos).x * 16.0f,(part->pos).y * 16.0f,(part->pos).z * 16.0f);
gSPMatrix(g++,(part->translateMtx + framebuff),G_MTX_PUSH);
if ((part->flags & PARTICLE_0004) == 0) pMVar2 = phead->alignMtx + framebuff;
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
    pRet = pRet->locatorScene1;
    break;
    case 0:
    break;
    case 2:
    pRet = pRet->locatorScene2;
    break;
    default:
    #ifdef DEBUGVER
    char acStack_110 [128];
    sprintf(acStack_110,"GetLocatorScene:\nInvalid locatorScene: %d",param_2);
    CRASH(FILENAME,acStack_110);
    #else
    CRASH("","");
    #endif
  }
  if(!pRet){
    #ifdef DEBUGVER
  char acStack_90 [144];
  sprintf(acStack_90,"GetLocatorScene:\npRet == NULL locatorScene: %d",param_2);
  CRASH(FILENAME,acStack_90);
  #else
  CRASH("","");
  #endif
  }
return pRet;
}



void BorgParticleEmitterCallback(ParticleHeadStruct *head,ParticleEmmiter *emmi)

{
  SceneData *pSVar1;
  SceneData *scene;
  uint uVar4;
  Borg5_particle *puVar2;
  
  scene = emmi->sceneDat;
  puVar2 = (Borg5_particle *)emmi->object;
  if (scene == NULL) CRASH("BorgParticleEmitterCallback","No Scene attached to emmiter!");
  pSVar1 = GetLocatorScene(scene,(u16)(((ushort)puVar2->locator0 & 0x180) >> 7));
  uVar4 = (ushort)puVar2->locator0 & 7;
  if (Scene::SceneGetLocatorPos(pSVar1,&puVar2->pos,uVar4)) {
    if ((puVar2->flagE & B5PART_0010)) Scene::SceneGetLocatorNorm(pSVar1,&puVar2->norm,uVar4);
    if ((puVar2->flagE & B5PART_2000)) {
      scene = GetLocatorScene(scene,(u16)(((ushort)puVar2->locator1 & 0x180) >> 7));
      Scene::SceneGetLocatorPos(scene,&puVar2->pos2,(ushort)puVar2->locator1 & 7);
    }
  }
  else {
    Vec3Set(&puVar2->pos,0.0,0.0,0.0);
    Vec3Set(&puVar2->norm,0.0,1.0f,0.0);
    Vec3Set(&puVar2->pos2,1.0,1.0,1.0);
    emmi->lifespan = 0;
  }
}

void BorgParticleEmitterB(ParticleHeadStruct *pHead,ParticleEmmiter *param_2){
  vec3f v3Temp;
  vec4f v4Temp;
  Borg5_particle *pvVar2 = (Borg5_particle *)param_2->object;
  Particle_s *p = Particle::FUN_800b277c(pHead,param_2,pvVar2->partLifespan2);
  if ((pvVar2->flagE & B5PART_0008))PartRand.GetVec3(&v3Temp,pvVar2->randRangeA);
  else PartRand.GetVec3(&v3Temp,PartRand.GetFloatRange(0,pvVar2->randRangeA));
  if ((pvVar2->flagE & B5PART_0200)) Vec3Sum(&p->pos,&(param_2->collision).pos,&v3Temp);
  else Vec3Sum(&p->pos,&pvVar2->pos,&v3Temp);
  PartRand.GetVec3(&p->vel,pvVar2->randRangeC);
  v3Temp.x = (pvVar2->norm).x * pvVar2->speed;
  v3Temp.y = (pvVar2->norm).y * pvVar2->speed;
  v3Temp.z = (pvVar2->norm).z * pvVar2->speed;
  Vec3Sum(&p->vel,&p->vel,&v3Temp);
  Vec3Scale(&p->vel,0.006);
  float scale = PartRand.GetFloatRange(pvVar2->scaleRangeLo,pvVar2->scaleRangeHi);
  Particle::SetScale(p,scale,scale);
  (p->colorA).r = PartRand.GetFloatRange(((pvVar2->colRandLo).R / 255.0),((pvVar2->colRandHi).R / 255.0));
  (p->colorA).g = PartRand.GetFloatRange(((pvVar2->colRandLo).G / 255.0),((pvVar2->colRandHi).G / 255.0));
  (p->colorA).b = PartRand.GetFloatRange(((pvVar2->colRandLo).B / 255.0),((pvVar2->colRandHi).B / 255.0));
  (p->colorA).a = PartRand.GetFloatRange(((pvVar2->colRandLo).A / 255.0),((pvVar2->colRandHi).A / 255.0));
  if ((pvVar2->flagE & B5PART_2000)) {
    if ((pvVar2->flagE & B5PART_0004))PartRand.GetVec3(&v3Temp,pvVar2->randRangeB);
    else PartRand.GetVec3(&v3Temp,PartRand.GetFloatRange(0,pvVar2->randRangeB));
    Vec3Sum(&v3Temp,&v3Temp,&pvVar2->pos2);
    Vec3Sub(&v3Temp,&v3Temp,&p->pos);
    Vec3Scale(&v3Temp,(float)(1.0 / (double)(int)p->lifespan));
    Vec3Sum(&p->vel,&p->vel,&v3Temp);
  }
  if ((pvVar2->flagE & B5PART_4000)) {
    v4Temp.x = ((pvVar2->colBlend).R / 255.0);
    v4Temp.y = ((pvVar2->colBlend).G / 255.0);
    v4Temp.z = ((pvVar2->colBlend).B / 255.0);
    v4Temp.w = ((pvVar2->colBlend).A / 255.0);
    Vec4Sub(&p->colorB,&v4Temp,&p->colorA);
    Vec4Scale(&p->colorB,(float)(1.0 / (double)(int)p->lifespan));
    p->unk4 = p->id;
    Particle::SetFlag(p,PARTICLE_0200);
  }
}


ParticleEmmiter *
Particle::AllocBorg5Particle(ParticleHeadStruct *pHead,SceneData *scene,Borg5_particle *dat){
  u16 uVar1;
  ParticleEmmiter *pEmmi;
  Particle_s *pPVar2;
  vec3f *res;
  float fVar4;
  
  if (dat->partLifespan < 1) return NULL;
  if (dat->partLifespan2 < 1) return NULL;
  pEmmi = AllocParticleEmitter(pHead,dat->partLifespan,dat->texture,dat->unk14,
           BorgParticleEmitterCallback,NULL,NULL,dat,NULL);
  if (pEmmi == NULL) return NULL;
  pEmmi->sceneDat = scene;
  if (dat->unk14 != 0) {
    pEmmi->funcB = BorgParticleEmitterB;
  }
  pEmmi->lifespanemmiter = dat->emmiLifespan;
  if ((dat->flagE & B5PART_0001))SetEmmiterHeight(pEmmi,0.0);
  SetFlag(pEmmi->particles,PARTICLE_0100|PARTICLE_0040);
  SetColorB(pEmmi->particles,(dat->colVA).x,(dat->colVA).y,(dat->colVA).z,(dat->colVA).w);
  Vec3Scale((vec3f *)&pEmmi->particles->colorB,0.006f);
  if ((dat->flagE & B5PART_1000)){
    pPVar2 = FUN_800b277c(pHead,pEmmi,dat->partLifespan);
    if (pPVar2 == NULL) goto freeAndReturnNULL;
    SetFlag(pPVar2,PARTICLE_0800);
    UnsetFlag(pPVar2,PARTICLE_0010);
    pPVar2->unk4 = pEmmi->particles->id;
    SetColorB(pPVar2,(dat->colVB).x,(dat->colVB).y,(dat->colVB).z,(dat->colVB).w);
    Vec3Scale((vec3f *)&pPVar2->colorB,0.006f);
  }
  if ((dat->flagE & B5PART_0800)) {
    pPVar2 = FUN_800b27cc(pHead,pEmmi,dat->partLifespan);
    if (pPVar2 == NULL) goto freeAndReturnNULL;
    uVar1 = pPVar2->id;
    SetFlag(pPVar2,PARTICLE_0100|PARTICLE_0040);
    SetColorB(pPVar2,(dat->colVC).x,(dat->colVC).y,(dat->colVC).z,(dat->colVC).w);
    Vec3Scale((vec3f *)&pPVar2->colorB,0.006f);
    if ((dat->flagE & B5PART_0400)){
      pPVar2 = FUN_800b277c(pHead,pEmmi,dat->partLifespan);
      if (pPVar2 == NULL) goto freeAndReturnNULL;
      SetFlag(pPVar2,PARTICLE_0800);
      UnsetFlag(pPVar2,PARTICLE_0010);
      pPVar2->unk4 = uVar1;
      SetColorB(pPVar2,(dat->colVD).x,(dat->colVD).y,(dat->colVD).z,(dat->colVD).w);
      Vec3Scale((vec3f *)&pPVar2->colorB,0.006f);
    }
  }
  if ((dat->flagE & B5PART_8000)) {
    pPVar2 = FUN_800b27cc(pHead,pEmmi,dat->partLifespan);
    if (pPVar2 == NULL) {
freeAndReturnNULL:
      FreeParticleEmitter(pHead,pEmmi);
      return NULL;
    }
    SetFlag(pPVar2,PARTICLE_0400);
    fVar4 = (dat->scaleValC - dat->scaleRangeLo) / (float)dat->partLifespan2;
    SetColorB(pPVar2,fVar4,fVar4,fVar4,0.0);
  }
  if ((dat->flagE & B5PART_0200)) {
    SetEmmiterFlags(pEmmi,PARTEMMI_2000);
    Vec3Copy(&dat->pos,&(pEmmi->collision).pos);
    res = &(pEmmi->collision).vel;
    Vec3Sub(res,&dat->pos,&dat->pos2);
    Vec3Normalize(res);
    Vec3Scale(res,(dat->emmiSpeed * 0.006));
  }
  BorgParticleEmitterCallback(pHead,pEmmi);
  for(u16 i=0;i<dat->count;i++){
    BorgParticleEmitterB(pHead,pEmmi);
  }
  return pEmmi;
}


void Particle::UnsetSceneEmmiter(ParticleHeadStruct *param_1,SceneData *param_2){
  if (((param_1) && (param_2)) && (param_1->Emmiter)) {
    for(u16 i=0;i<ParticleEmmiMAX;i++) {
        ParticleEmmiter *pPVar2 =&param_1->Emmiter[i];
      if (((pPVar2->flags & PARTEMMI_8000)) && (param_2 == pPVar2->sceneDat))
        ResetEmmiter(param_1,pPVar2);
    }
  }
}

bool Particle::SceneHasEmmiter(ParticleHeadStruct *param_1,SceneData *param_2){
  if ((param_1) && (param_2)) {
    ParticleEmmiter *pPVar1 = param_1->Emmiter;
    if (pPVar1) {
      for(u16 i=0;i<ParticleEmmiMAX;i++){
        if((pPVar1[i].flags & PARTEMMI_8000)&&(param_2 ==pPVar1[i].sceneDat)) return true;
      }
    }
  }
  return false;
}

void noop_800b40a4(u16 x,u16 y){}

void passto_noop_800b40a4(){noop_800b40a4(1,0xffff);}

