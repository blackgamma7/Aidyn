#include "collide.h"

typedef void(*ParticleFuncA)(ParticleHeadStruct*,ParticleEmmiter*);
typedef void(*ParticleFuncB)(ParticleHeadStruct*);
typedef void(*ParticleFuncC)(ParticleHeadStruct*,ParticleEmmiter*,Particle_s*);

#define ParticleMAX 0x180 //max particles when expansion pack used
#define ParticleJ1 0x60 //max particles with jumper pak and gamemodeType 1
#define ParticleJ0 0x40 //max particles with jumper pak and gamemodeType 0
#define ParticleJ2 0x10 //max particles with jumper pak and gamemodeType 2
#define ParticleEmmiMAX 0x10 //max particle emmiters

struct Particle_s {
    u16 id;
    u16 lifespan;
    u16 unk4;
    u16 unk6;
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
    undefined field3_0x6;
    undefined field4_0x7;
    u16 unk8;
    short texture;
    u16 flags; /* 0x2000 = tangible */
    float height;
    Particle_s *particles;
    undefined field12_0x18;
    undefined field13_0x19;
    short field14_0x1a;
    u64 unk1c;
    vec3f pos;
    vec3f vel;
    u8 field18_0x3c[4];
    u32 field19_0x40;
    vec4f colvec4;
    vec4f field21_0x54;
    u8 unk0x64[340]; /* unused? */
    ParticleFuncA funcA;
    ParticleFuncB funcB;
    ParticleFuncC funcC;
    void *dobject; //varies
    ParticleEmmiter *link;
    SceneData *sceneDat;
    collisionSphere collision;
};

struct ParticleHeadStruct {
    Particle_s *particles;
    short particleindecies[ParticleMAX+2];
    ParticleEmmiter *Emmiter;
    short emmitterIdecies[ParticleEmmiMAX];
    Borg1header **ppTextures;
    short TextureCount;
    undefined field6_0x332;
    undefined field7_0x333;
    float gray;
    Borg9data *borg9dat;
    u16 particleStructCount;
    u16 count1;
    u16 count2;
    u16 field13_0x342;
    u32 unk344;
    Mtx alignMtx[2];
};