#include "mathN64.h"

//RNG functions, with a seed field.
class Random{
private:
u32 seed;
public:
void SetSeed(u32 num);
u32 ShiftSeed();
u32 MultiByB(s32 B);
u32 func(u32 a,u32 b);
void ofunc_shiftSeed();
u32 randAudio(s32 arg1);
s32 Range(s32 a,s32 b);
float GetFloat0To1();
float GetFloat0ToX(float f);
float GetFloatRange(float a,float b);
void GetVec2(vec2f *v,float multi);
void GetVec3(vec3f *v,float multi);
void GetVec4(vec4f *v,float multi);
};