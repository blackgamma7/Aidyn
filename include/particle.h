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
    vec4f colorB;
    vec4f precipPos;
    u32 unk0x5c; /* unused? */
    Mtx scaleMtx[2];
    Mtx translateMtx[2];
    Mtx alignMtx;
};

enum ParticleFlag{
    PARTICLE_0001=1,
    PARTICLE_0002=2,
    PARTICLE_0004=4, //use object's align mtx instead of particle heads'
    PARTICLE_0008=8,
    PARTICLE_0010=0x10, //particle visibility?
    PARTICLE_0020=0X20,
    PARTICLE_0040=0X40, //use colorB(w) to scale change over time.
    PARTICLE_0080=0X80, //use colorB(x,y,z) to change position over time.
    PARTICLE_0100=0X100, //use colorB(x,y,z) to change velocity over time.
    PARTICLE_0200=0X200, //use colorB(x,y,z,w) to change colorA over time.
    PARTICLE_0400=0X400, //use colorB(x,y) to change scale over time.
    PARTICLE_0800=0X800, //use colorB(x,y,z,w) to change colorB over time.
    PARTICLE_1000=0X1000, //unused?
    PARTICLE_2000=0X2000, //unused?
    PARTICLE_4000=0X4000, //disable colorB's effects over time
    PARTICLE_8000=0X8000, //active flag?
};

struct ParticleEmmiter {
    u16 ID;
    s16 lifespan;
    u16 lifespanemmiter;
    s16 unk6;
    undefined field3_0x6;
    undefined field4_0x7;
    u16 count;
    s16 texture;
    u16 flags; //uses PartEmmiFlags
    float height;
    Particle_s *particles;
    undefined field12_0x18;
    undefined field13_0x19;
    s16 unk1a;
    u64 unk1c;
    vec3f pos;
    vec3f vel;
    u8 unk3c[4];//unused?
    float unk40;
    vec4f colvec4;
    vec4f randVec;
    u8 unk0x64[340]; /* unused? */
    ParticleFuncA funcA;
    ParticleFuncB funcB;
    ParticleFuncC funcC;
    void * object; //varies
    ParticleEmmiter *link;
    SceneData *sceneDat;
    collisionSphere collision;
};

enum PartEmmiFlags{
    PARTEMMI_0001=1, //free after timeout
    PARTEMMI_0002=2, //finite lifespan?
    PARTEMMI_0004=4,
    PARTEMMI_0008=8, //unused?
    PARTEMMI_0010=0x10, //unused?
    PARTEMMI_0020=0X20, //unused?
    PARTEMMI_0040=0X40, //unused?
    PARTEMMI_0080=0X80, //unused?
    PARTEMMI_0100=0X100, //unused?
    PARTEMMI_0200=0X200, //unused?
    PARTEMMI_0400=0X400, //unused?
    PARTEMMI_0800=0X800, //unused?
    PARTEMMI_1000=0X1000,
    PARTEMMI_2000=0X2000,  //use collision position
    PARTEMMI_4000=0X4000, //particles have max height
    PARTEMMI_8000=0X8000, //active?
};

struct ParticleHeadStruct {
    Particle_s *particles;
    s16 particleindecies[ParticleMAX+2];
    ParticleEmmiter *Emmiter;
    s16 emmitterIndecies[ParticleEmmiMAX];
    Borg1Header **ppTextures;
    s16 TextureCount;
    u8 unk322[2]; //align bytes?S
    float gray;
    Borg9Data *borg9dat;
    u16 particleStructCount;
    u16 count1;
    s16 count2;
    u16 field13_0x342;
    u32 unk344;
    Mtx alignMtx[2];
};

namespace Particle{
    void InitParticle(Particle_s *,u16);
    void InitParticles(ParticleHeadStruct *);
    void InitEmmiter(ParticleEmmiter *,u16 );
    void InitEmmiters(ParticleHeadStruct *);
    void LoadTextures(ParticleHeadStruct *,s16 ,s32 *);
    void FreeTextures(ParticleHeadStruct *);
    void InitParticleHead(ParticleHeadStruct *head,Borg9Data *borg9,s16 partCount,u16 textCount,s32 *textureP);
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
    ParticleEmmiter * AllocParticleEmitter(ParticleHeadStruct *head,s16 lifespan,s16 texture,u16 count,
            ParticleFuncA func__,ParticleFuncB initFunc,ParticleFuncC tickFunc,void *object,ParticleEmmiter *link);
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
    Gfx * GraphicsInit(Gfx *g,ParticleHeadStruct *pHead,vec3f *v,u16 buffChoice);
    Gfx * SetGeoMode(Gfx *,u16);
    void RenderParticles(Gfx **,ParticleHeadStruct *,Particle_s *,Borg1Header *,u16);
    SceneData * GetLocatorScene(SceneData *,u16);
    ParticleEmmiter * AllocBorg5Particle(ParticleHeadStruct *,SceneData *,Borg5_particle *);
    void UnsetSceneEmmiter(ParticleHeadStruct *,SceneData *);
    bool SceneHasEmmiter(ParticleHeadStruct *,SceneData *);
};
//shorthand for particle emmiter creatiom
#define NewParticleEmmiter(lifespan,texture,count,func__,initFunc,tickFunc,object,link)\
Particle::AllocParticleEmitter(&gGlobals.gameVars.particleEmmiter,lifespan,texture,count,func__,initFunc,tickFunc,object,link)

//used by PlaneObj as well. sets vertex data
void SetVtx(Vtx_t *v,float x,float y,float z,u16 flag,s16 U,s16 V,u8 R,u8 G,u8 B,u8 A);
void BorgParticleEmitterCallback(ParticleHeadStruct *,ParticleEmmiter *);
void BorgParticleEmitterB(ParticleHeadStruct *,ParticleEmmiter *);

void noop_800b40a4(u16,u16);
//found at the bottom of the .rodata section
void passto_noop_800b40a4();
#define PartRand struct_unk_.particleRngSeed //dunno why the RNG seed is in this multi-purpose struct...