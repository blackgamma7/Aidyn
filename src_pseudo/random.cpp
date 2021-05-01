//most the RNG funcs in the game, save for 2 in globals.cpp

#define UINT_MAX_D 4.294967296E9

void setRNGSeed(uint *seed,u64 num){
  if (*seed == 0) *seed = 1;
  *seed = (uint)num;}

uint ShiftSeed(int *seed){
  *seed = *seed * 0x19660d + 0x3c6ef35f;
  return (uint)seed;}

uint rand_0_to_B(int *seed,int B){
  uint uVar1;
  uint ret;
  
  if (B == 0) {ret = 0;}
  else {
    uVar1 = ShiftSeed(seed);
    ret=(uint)udivdi3((uint)B * uVar1 >> 0x20),(uint)B * uVar1),1,0);
  }
  return ret;}

uint rand_func(uint *seed,uint a,uint b){
  uint uVar1;
  uint uVar2;
  
  if (a != b) {
    uVar2 = a;
    if (b < a) {
      uVar2 = b;
      b = a;
    }
    a = rand_0_to_B(seed,(b - uVar2) + 1) + uVar2;
  }
  return a;}

void ofunc_shiftSeed(int *seed){*seed = *seed * 0x19660d + 0x3c6ef35f;}

uint randAudio(uint *seed,int arg1){
  uint uVar1;
  u64 uVar2;
  
  if (arg1 == 0) {uVar1 = 0;}
  else {
    if (arg1 < 0) {
      uVar1 = ShiftSeed((int *)seed);
      if (arg1 < 0) {arg1 = -arg1;}
      uVar2 = udivdi3((uint)arg1 * uVar1 >> 0x20) +
                      uVar1 * (arg1 >> 0x1f),(u32)((ulonglong)(uint)arg1 * (ulonglong)uVar1)
                      ,1,0);
      uVar1 = -(int)uVar2;
    }
    else {
      uVar1 = ShiftSeed((int *)seed);
      if (arg1 < 0) {arg1 = -arg1;}
      uVar2 = udivdi3((uint)arg1 * uVar1 >> 0x20) +
                      uVar1 * (arg1 >> 0x1f),(u32)((ulonglong)(uint)arg1 * (ulonglong)uVar1),
                      1,0);
      uVar1 = (uint)uVar2;
    }
  }
  return uVar1;}

int rand_range_(uint *seed,int a,int b){
  int iVar2;

  if (a != b) {
    iVar2 = a;
    if (b < a) {
      iVar2 = b;
      b = a;}
    a = rand_0_to_B(seed,(b - iVar2) + 1) + iVar2;
  }
  return a;}

float rand_float(uint *seed){
  int uVar1 = *seed * 0x19660d + 0x3c6ef35f;
  double dVar2 = (double)uVar1;
  
  *seed = uVar1;
  if (uVar1 < 0) {dVar2+= UINT_MAX_d;}
  return (float)dVar2 * 2.3283064E-10f;}

float rand_float_multi(uint *seed,float f){
  if (f != 0.0) {f *= rand_float(seed);}
  return f;}

float rand_float_range(uint *seed,float a,float b){
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

void rand_vec2(uint *seed,Vec2 *v2,float multi){
  (*v2)[0] = rand_float_range(seed,-1.0f,1.0f);;
  (*v2)[1] = rand_float_range(seed,-1.0f,1.0f);
  if ((*v2)[0] == 0.0) {(*v2)[0] = 1.0E-6f;}
  vec2_normalize(v2);
  multiVec2(v2,multi);}

void rand_vec3(uint *seed,vec3 *v3,float multi){
  (*v3)[0] = rand_float_range(seed,-1.0f,1.0f);
  (*v3)[1] = rand_float_range(seed,-1.0f,1.0f);
  (*v3)[2] = rand_float_range(seed,-1.0f,1.0f);
  if ((*v3)[0] == 0.0) {(*v3)[0] = 1.0E-6f;}
  vec3_normalize(v3);
  multiVec3(v3,multi);}

void Ofunc_rand_vec4(uint *seed,vec4 *v4,float multi){
  (*v4)[0] = rand_float_range(seed,-1.0f,1.0f);
  (*v4)[1] = rand_float_range(seed,-1.0f,1.0f);
  (*v4)[2] = rand_float_range(seed,-1.0f,1.0f);
  (*v4)[3] = rand_float_range(seed,-1.0f,1.0f);
  if ((*v4)[0] == 0.0) {(*v4)[0] = 1.0E-6f;}
  vec4_normalize(v4);
  multiVec4(v4,multi);}