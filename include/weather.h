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
    u32 sfxID;
    u8 sfxIndex;
};

namespace Weather{
    void Init(WeatherStruct*);
    void Free(WeatherStruct*);
    void AlignParticle(Particle_s *,vec3f *,vec3f *);
    void FUN_800228e8(ParticleHeadStruct *,ParticleEmmiter *,Particle_s *);
    void FUN_80022a24(ParticleHeadStruct *,ParticleEmmiter *);
    void FUN_80022bf4(ParticleHeadStruct *,ParticleEmmiter *);
    ParticleEmmiter * AllocPrecipParticles(vec3f *,vec3f *,vec4f *,s16 ,s16 ,void*);
    void RemoveSFX(WeatherStruct *);
    void ProcessWeather(WeatherStruct *W ,s16 delta);
    
}