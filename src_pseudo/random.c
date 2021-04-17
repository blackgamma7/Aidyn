#define UINT_MAX_D 4.294967296E9

void setRNGSeed(uint *seed,u64 num){
  if (*seed == 0) *seed = 1;
  *seed = (uint)num;
  return;
}

uint ShiftSeed(int *seed){
  uint uVar1;
  
  uVar1 = *seed * 0x19660d + 0x3c6ef35f;
  *seed = uVar1;
  return uVar1;
}

uint rand_0_to_B(int *seed,int B){
  uint uVar1;
  uint ret;
  
  if (B == 0) {
    ret = 0;
  }
  else {
    uVar1 = ShiftSeed(seed);
    udivdi3((uint)B * uVar1 >> 0x20),(uint)B * uVar1),1,0);
  }
  return ret;
}

uint rand_func(uint *seed,uint a,uint b){
  uint uVar1;
  uint uVar2;
  
  if (a != b) {
    uVar2 = a;
    if (b < a) {
      uVar2 = b;
      b = a;
    }
    uVar1 = rand_0_to_B(seed,(b - uVar2) + 1);
    a = uVar1 + uVar2;
  }
  return a;
}

void ofunc_shiftSeed(int *seed){
  *seed = *seed * 0x19660d + 0x3c6ef35f;
  return;
}

uint randAudio(uint *seed,int param_2){
  uint uVar1;
  u64 uVar2;
  
  if (param_2 == 0) {
    uVar1 = 0;
  }
  else {
    if (param_2 < 0) {
      uVar1 = ShiftSeed((int *)seed);
      if (param_2 < 0) {
        param_2 = -param_2;
      }
      uVar2 = udivdi3((uint)param_2 * uVar1 >> 0x20) +
                      uVar1 * (param_2 >> 0x1f),(u32)((ulonglong)(uint)param_2 * (ulonglong)uVar1)
                      ,1,0);
      uVar1 = -(int)uVar2;
    }
    else {
      uVar1 = ShiftSeed((int *)seed);
      if (param_2 < 0) {
        param_2 = -param_2;
      }
      uVar2 = udivdi3((uint)param_2 * uVar1 >> 0x20) +
                      uVar1 * (param_2 >> 0x1f),(u32)((ulonglong)(uint)param_2 * (ulonglong)uVar1),
                      1,0);
      uVar1 = (uint)uVar2;
    }
  }
  return uVar1;
}

int rand_range_(uint *seed,int a,int b){
  uint uVar1;
  int iVar2;
  
  if (a != b) {
    iVar2 = a;
    if (b < a) {
      iVar2 = b;
      b = a;
    }
    uVar1 = rand_0_to_B(seed,(b - iVar2) + 1);
    a = uVar1 + iVar2;
  }
  return a;
}

float rand_float(uint *param_1)

{
  uint uVar1;
  double dVar2;
  
  uVar1 = *param_1 * 0x19660d + 0x3c6ef35f;
  dVar2 = (double)uVar1;
  *param_1 = uVar1;
  if ((int)uVar1 < 0) {
    dVar2 = dVar2 + UINT_MAX_d;
  }
  return (float)dVar2 * 2.3283064E-10f;
}

float rand_float_multi(uint *seed,float f)

{
  float fVar1;
  
  if (f != 0.0) {
    fVar1 = rand_float(seed);
    f = fVar1 * f;
  }
  return f;
}

float rand_float_range(uint *seed,float a,float b){
  float fVar1;
  float fVar2;
  
  if (a != b) {
    fVar2 = b;
    if (a <= b) {
      fVar2 = a;
      a = b;
    }
    fVar1 = rand_float(seed);
    a = fVar1 * (a - fVar2) + fVar2;
  }
  return a;
}

void rand_vec2(uint *param_1,Vec2 *param_2,float param_3)

{
  float fVar1;
  float fVar2;
  float fVar3;
  
  fVar1 = rand_float_range(param_1,-1.0f,1.0f);
  (*param_2)[0] = fVar1;
  fVar2 = rand_float_range(param_1,-1.0f,1.0f);
  fVar3 = (*param_2)[0];
  (*param_2)[1] = fVar2;
  if (fVar3 == 0.0) {
    (*param_2)[0] = 1.0E-6f;
  }
  vec2_normalize(param_2);
  multiVec2(param_2,param_3);
  return;
}

void rand_vec3(uint *seed,vec3 *v3,float multi)

{
  float fVar1;
  float fVar2;
  float fVar3;
  
  fVar1 = rand_float_range(seed,-1.0f,1.0f);
  (*v3)[0] = fVar1;
  fVar1 = rand_float_range(seed,-1.0f,1.0f);
  (*v3)[1] = fVar1;
  fVar2 = rand_float_range(seed,-1.0f,1.0f);
  fVar3 = (*v3)[0];
  (*v3)[2] = fVar2;
  if (fVar3 == 0.0) {
    (*v3)[0] = 1.0E-6f;
  }
  vec3_normalize(v3);
  multiVec3(v3,multi);
  return;
}

void Ofunc_rand_vec4(uint *seed,vec4 *v4,float mult)

{
  float fVar1;
  float fVar2;
  float fVar3;
  
  fVar1 = rand_float_range(seed,-1.0f,1.0f);
  (*v4)[0] = fVar1;
  fVar1 = rand_float_range(seed,-1.0f,1.0f);
  (*v4)[1] = fVar1;
  fVar1 = rand_float_range(seed,-1.0f,1.0f);
  (*v4)[2] = fVar1;
  fVar2 = rand_float_range(seed,-1.0f,1.0f);
  fVar3 = (*v4)[0];
  (*v4)[3] = fVar2;
  if (fVar3 == 0.0) {
    (*v4)[0] = 1.0E-6f;
  }
  vec4_normalize(v4);
  multiVec4(v4,mult);
  return;
}