#include "collide.h"

typedef void(*ParticleFuncA)(ParticleHeadStruct*,ParticleEmmiter*);
typedef void(*ParticleFuncB)(ParticleHeadStruct*,ParticleEmmiter*);
typedef void(*ParticleFuncC)(ParticleHeadStruct*,ParticleEmmiter*,Particle_s*);

#define ParticleMAX 0x180 //max particles when expansion pack used
#define ParticleJ1 0x60 //max particles with jumper pak and gamemodeType 1
#define ParticleJ0 0x40 //max particles with jumper pak and gamemodeType 0
#define ParticleJ2 0x10 //max particles with jumper pak and gamemodeType 2
#define ParticleEmmiMAX 0x10 //max particle emmiters

struct Particle_s {
    u16 id;
    s16 lifespan;
    u16 unk4;
    s16 unk6;
    u16 unk8;
    u16 flags;
    vec3f pos;
    vec3f vel;
    vec2f scale;
    vec4f colorA;
    vec4f ColorB;
    vec4f vec_0x4c;
    u32 unk0x5c; /* unused? */
    Mtx scaleMtx[2];
    Mtx translateMtx[2];
    Mtx alignMtx;
};

struct ParticleEmmiter {
    u16 ID;
    u16 lifespan;
    u16 lifespanemmiter;
    s16 unk6;
    undefined field3_0x6;
    undefined field4_0x7;
    u16 unk8;
    short texture;
    u16 flags; /* 0x2000 = tangible */
    float height;
    Particle_s *particles;
    undefined field12_0x18;
    undefined field13_0x19;
    short unk1a;
    u64 unk1c;
    vec3f pos;
    vec3f vel;
    u8 field18_0x3c[4];
    u32 field19_0x40;
    vec4f colvec4;
    vec4f field20_0x54;
    u8 unk0x64[340]; /* unused? */
    ParticleFuncA funcA;
    ParticleFuncB funcB;
    ParticleFuncC funcC;
    void * object; //varies
    ParticleEmmiter *link;
    SceneData *sceneDat;
    collisionSphere collision;
};

struct ParticleHeadStruct {
    Particle_s *particles;
    short particleindecies[ParticleMAX+2];
    ParticleEmmiter *Emmiter;
    short emmitterIndecies[ParticleEmmiMAX];
    Borg1header **ppTextures;
    short TextureCount;
    undefined field6_0x332;
    undefined field7_0x333;
    float gray;
    Borg9data *borg9dat;
    u16 particleStructCount;
    u16 count1;
    s16 count2;
    u16 field13_0x342;
    u32 unk344;
    Mtx alignMtx[2];
};

struct Borg5_particle{
    u16 flag0;
    u16 flag2;
    u16 aniUsed;
    u16 unk6;
    s16 unk8;
    u16 field5_0xa;
    u16 lifespan;
    u16 flagE;
    float unk10;
    s16 unk14;
    s16 unk16;
    s16 texture;
    u16 count;
    vec3f pos;
    float randRangeA;
    vec3f pos2;
    float randRangeB;
    float randRangeC;
    u32 unk40;
    vec4f colVA;
    vec4f colVB;
    vec4f colVC;
    vec4f colVD;
    vec3f norm;
    float unk90;
    float unk94;
    float randRangeD;
    float unk9c;
    Color32 colRandLo;
    Color32 colRandHi;
    Color32 colBlend;
    u8 unkAc[20]; //unused?
};

namespace Particle{
    void InitParticle(Particle_s *,u16);
    void InitParticles(ParticleHeadStruct *);
    void InitEmmiter(ParticleEmmiter *,u16 );
    void InitEmmiters(ParticleHeadStruct *);
    void LoadTextures(ParticleHeadStruct *,s16 ,s32 *);
    void FreeTextures(ParticleHeadStruct *);
    void InitParticleHead(ParticleHeadStruct *head,Borg9data *borg9,s16 partCount,u16 textCount,s32 *textureP);
    void FreeEmmiters(ParticleHeadStruct *);
    void UpdateParticle(ParticleHeadStruct *param_1,vec4f *col,u32 flag,s16 index,float delta);
    void ApplyVelocity(ParticleHeadStruct *,ParticleEmmiter *,s16,float);
    void ProcessAndRenderParticleHead(Gfx **gg,ParticleHeadStruct *pPH,vec3f *param_3,s16 delta,u16 viBuff,u16 param_6);
    bool FUN_800b25e0(ParticleHeadStruct *,ParticleEmmiter *,Particle_s *);
    void FUN_800b266c(ParticleHeadStruct *,Particle_s *);
    Particle_s * FUN_800b26d8(ParticleHeadStruct *,u16);
    Particle_s * FUN_800b277c(ParticleHeadStruct *,ParticleEmmiter *,u16);
    Particle_s * FUN_800b27cc(ParticleHeadStruct *,ParticleEmmiter *,u16);
    void FUN_800b282c(ParticleHeadStruct *,Particle_s *);
    bool FUN_800b2890(ParticleHeadStruct *,ParticleEmmiter *,Particle_s *);
    ParticleEmmiter * AllocParticleEmitter(ParticleHeadStruct *,u16,s16 ,u16,ParticleFuncA,ParticleFuncB,ParticleFuncC,void *,ParticleEmmiter *);
    void FreeParticleEmitter(ParticleHeadStruct *,ParticleEmmiter *);
    void ResetEmmiter(ParticleHeadStruct *,ParticleEmmiter *);
    void FUN_800b2bc4(ParticleHeadStruct *);
    float OneOverLifespan(Particle_s *);
    void SetColorA(Particle_s *,float ,float ,float ,float);
    void SetPos(Particle_s *,float,float,float);
    void SetVel(Particle_s *,float,float,float);
    void SetScale(Particle_s *,float,float);
    void SetColorB(Particle_s *,float ,float ,float ,float);
    void SetFlag(Particle_s*,u16);
    void UnsetFlag(Particle_s*,u16);
    void SetEmmiterFlags(ParticleEmmiter*,u16);
    void UnsetEmmiterFlags(ParticleEmmiter*,u16);
    void SetEmmiterHeight(ParticleEmmiter *,float);
    void UnsetEmmiterFlag4000(ParticleEmmiter *);
    Gfx * FUN_800b2d34(Gfx *,ParticleHeadStruct *,vec3f *,u16);
    Gfx * FUN_800b2f9c(Gfx *,u16);
    void RenderParticles(Gfx **,ParticleHeadStruct *,Particle_s *,Borg1header *,u16);
    SceneData * GetLocatorScene(SceneData *,u16);
    ParticleEmmiter * FUN_800b3c18(ParticleHeadStruct *,SceneData *,Borg5_particle *);
    void UnsetSceneEmmiter(ParticleHeadStruct *,SceneData *);
    bool FUN_800b4030(ParticleHeadStruct *,SceneData *);
};

//used by PlaneObj as well. sets vertex data
void SetVtx(Vtx_t *v,float x,float y,float z,u16 flag,s16 U,s16 V,u8 R,u8 G,u8 B,u8 A);
void BorgParticleEmitterCallback(ParticleHeadStruct *,ParticleEmmiter *);
void BorgParticleEmitterB(ParticleHeadStruct *,ParticleEmmiter *);

void noop_800b40a4(u16,u16);
//found at the bottom of the .rodata section
void passto_noop_800b40a4();
#define PartRand struct_unk_.particleRngSeed //dunno why the RNG seed is in this multi-purpose struct...