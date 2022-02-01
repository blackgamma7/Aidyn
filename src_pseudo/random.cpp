//most the RNG funcs in the game, save for 2 in globals.cpp

#define UINT_MAX_D 4.294967296E9

void Random::SetSeed(u32 *seed,u32 num){
  if (*seed == 0) *seed = 1;
  *seed = num;
}

u32 Random::ShiftSeed(u32 *seed){
  *seed = *seed * 0x19660d + 0x3c6ef35f;
  return seed;
}

u32 Random::MultiByB(u32 *seed,s32 B){
 if (B == 0) return 0;
 else return udivdi3((B * ShiftSeed(seed)),0x100000000);
}

u32 Random::func(u32 *seed,u32 a,u32 b){
  u32 uVar2;
  
  if (a != b) {
    uVar2 = a;
    if (b < a) {
      uVar2 = b;
      b = a;
    }
    a = MultiByB(seed,(b - uVar2) + 1) + uVar2;
  }
  return a;}

void Random::ofunc_shiftSeed(s32 *seed){*seed = *seed * 0x19660d + 0x3c6ef35f;}

u32 Random::randAudio(u32 *seed,s32 arg1){
  uint uVar1;
  
  if (arg1 == 0) return 0;
  if (arg1 < 0) {
    uVar1 = ShiftSeed(seed);
    if (arg1 < 0) arg1 = -arg1;
    return -udivdi3((arg1 * uVar1),0x100000000);
    //return -udivdi3((ulonglong)(uint)arg1 * (ulonglong)uVar1 & 0xffffffff |(ulonglong)((int)((ulonglong)(uint)arg1 * (ulonglong)uVar1 >> 0x20) +uVar1 * (arg1 >> 0x1f)) << 0x20,0x100000000);
  }
  else {
    uVar1 = ShiftSeed(seed);
    if (arg1 < 0) arg1 = -arg1;
    return udivdi3((arg1 * uVar1),0x100000000);
    //return udivdi3((ulonglong)(uint)arg1 * (ulonglong)uVar1 & 0xffffffff |(ulonglong)((int)((ulonglong)(uint)arg1 * (ulonglong)uVar1 >> 0x20) +uVar1 * (arg1 >> 0x1f)) << 0x20,0x100000000);
  }
}

s32 Random::range_(u32 *seed,s32 a,s32 b){
  s32 iVar2;

  if (a != b) {
    iVar2 = a;
    if (b < a) {
      iVar2 = b;
      b = a;}
    a = MultiByB(seed,(b - iVar2) + 1) + iVar2;
  }
  return a;}

float Random::GetFloat(u32 *seed){
  s32 uVar1 = *seed * 0x19660d + 0x3c6ef35f; //inline seed shift
  double dVar2 = (double)uVar1;
  
  *seed = uVar1;
  if (uVar1 < 0) dVar2+= UINT_MAX_D;
  return (float)dVar2 * *(float*)0x2F800000; //2^-32
}

float Random::GetFloat_multi(u32 *seed,float f){
  if (f != 0.0) f *= GetFloat(seed);
  return f;}

float Random::GetFloatRange(u32 *seed,float a,float b){
  float fVar2;
  
  if (a != b) {
    fVar2 = b;
    if (a <= b) {
      fVar2 = a;
      a = b;
    }
    a = GetFloat(seed) * (a - fVar2) + fVar2;
  }
  return a;}

void Random::GetVec2(u32 *seed,Vec2 *v2,float multi){
  (*v2)[0] = GetFloatRange(seed,-1.0f,1.0f);
  (*v2)[1] = GetFloatRange(seed,-1.0f,1.0f);
  if ((*v2)[0] == 0.0) (*v2)[0] = 1.0E-6f;
  vec2_normalize(v2);
  multiVec2(v2,multi);
}

void Random::GetVec3(u32 *seed,vec3 *v3,float multi){
  (*v3)[0] = GetFloatRange(seed,-1.0f,1.0f);
  (*v3)[1] = GetFloatRange(seed,-1.0f,1.0f);
  (*v3)[2] = GetFloatRange(seed,-1.0f,1.0f);
  if ((*v3)[0] == 0.0) (*v3)[0] = 1.0E-6f;
  vec3_normalize(v3);
  multiVec3(v3,multi);
}
void Random::GetVec4(u32 *seed,vec4 *v4,float multi){
  (*v4)[0] = GetFloatRange(seed,-1.0f,1.0f);
  (*v4)[1] = GetFloatRange(seed,-1.0f,1.0f);
  (*v4)[2] = GetFloatRange(seed,-1.0f,1.0f);
  (*v4)[3] = GetFloatRange(seed,-1.0f,1.0f);
  if ((*v4)[0] == 0.0) (*v4)[0] = 1.0E-6f;
  vec4_normalize(v4);
  multiVec4(v4,multi);
}
