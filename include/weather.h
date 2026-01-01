#include "particle.h"

struct WeatherStruct {
    u16 rainShortA;
    u16 rainShortB;
    float timer;
    u32 unk8;
    float fogTime;
    u16 skyBgdat;
    ParticleEmmiter *rainParticles;
    Borg12Header *Sfx;
    s32 sfxID;
    u8 sfxIndex;
};

namespace Weather{
    void Init(WeatherStruct*);
    void Free(WeatherStruct*);
    void AlignParticle(Particle_s *,vec3f *,vec3f *);
    void PrecipParticleFuncC(ParticleHeadStruct *,ParticleEmmiter *,Particle_s *);
    void RainParticleFunc(ParticleHeadStruct *,ParticleEmmiter *);
    void PrecipParticleFuncB(ParticleHeadStruct *,ParticleEmmiter *);
    ParticleEmmiter * AllocPrecipParticles(vec3f *,vec3f *,vec4f *,s16 ,s16 ,void*);
    void RemoveSFX(WeatherStruct *);
    void ProcessWeather(WeatherStruct *W ,s16 delta);
    
}