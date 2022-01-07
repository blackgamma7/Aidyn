//most the RNG funcs in the game, save for 2 in globals.cpp

#define UINT_MAX_D 4.294967296E9

void Random::setRNGSeed(u32 *seed,u32 num){
  if (*seed == 0) *seed = 1;
  *seed = num;
}

u32 Random::ShiftSeed(u32 *seed){
  *seed = *seed * 0x19660d + 0x3c6ef35f;
  return seed;
}

u32 Random::rand_0_to_B(u32 *seed,s32 B){
 if (B == 0) return 0;
  else return udivdi3((B * ShiftSeed(seed)),0x100000000);
}

u32 Random::rand_func(u32 *seed,u32 a,u32 b){
  u32 uVar2;
  
  if (a != b) {
    uVar2 = a;
    if (b < a) {
      uVar2 = b;
      b = a;
    }
    a = rand_0_to_B(seed,(b - uVar2) + 1) + uVar2;
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

s32 Random::rand_range_(u32 *seed,s32 a,s32 b){
  s32 iVar2;

  if (a != b) {
    iVar2 = a;
    if (b < a) {
      iVar2 = b;
      b = a;}
    a = Random::rand_0_to_B(seed,(b - iVar2) + 1) + iVar2;
  }
  return a;}

float Random::rand_float(u32 *seed){
  s32 uVar1 = *seed * 0x19660d + 0x3c6ef35f; //inline seed shift
  double dVar2 = (double)uVar1;
  
  *seed = uVar1;
  if (uVar1 < 0) dVar2+= UINT_MAX_d;
  return (float)dVar2 * 2.3283064E-10f; //2^-32
}

float Random::rand_float_multi(u32 *seed,float f){
  if (f != 0.0) f *= rand_float(seed);
  return f;}

float Random::rand_float_range(u32 *seed,float a,float b){
  float fVar2;
  
  if (a != b) {
    fVar2 = b;
    if (a <= b) {
      fVar2 = a;
      a = b;
    }
    a = rand_float(seed) * (a - fVar2) + fVar2;
  }
  return a;}

void Random::rand_vec2(u32 *seed,Vec2 *v2,float multi){
  (*v2)[0] = Random::rand_float_range(seed,-1.0f,1.0f);;
  (*v2)[1] = Random::rand_float_range(seed,-1.0f,1.0f);
  if ((*v2)[0] == 0.0) (*v2)[0] = 1.0E-6f;
  vec2_normalize(v2);
  multiVec2(v2,multi);
}

void Random::rand_vec3(u32 *seed,vec3 *v3,float multi){
  (*v3)[0] = Random::rand_float_range(seed,-1.0f,1.0f);
  (*v3)[1] = Random::rand_float_range(seed,-1.0f,1.0f);
  (*v3)[2] = Random::rand_float_range(seed,-1.0f,1.0f);
  if ((*v3)[0] == 0.0) (*v3)[0] = 1.0E-6f;
  vec3_normalize(v3);
  multiVec3(v3,multi);
}
void Random::Ofunc_rand_vec4(u32 *seed,vec4 *v4,float multi){
  (*v4)[0] = Random::rand_float_range(seed,-1.0f,1.0f);
  (*v4)[1] = Random::rand_float_range(seed,-1.0f,1.0f);
  (*v4)[2] = Random::rand_float_range(seed,-1.0f,1.0f);
  (*v4)[3] = Random::rand_float_range(seed,-1.0f,1.0f);
  if ((*v4)[0] == 0.0) (*v4)[0] = 1.0E-6f;
  vec4_normalize(v4);
  multiVec4(v4,multi);
}
