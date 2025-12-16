#include "randClass.h"
//most the RNG funcs in the game, save for 2 in globals.cpp


//set seed for RNG object
void Random::SetSeed(u32 num){
  if (seed == 0) seed = 1;
  seed = num;
}

//shift and return seed for RNG object
u32 Random::ShiftSeed(){
  seed = seed * 0x19660d + 0x3c6ef35f;
  return seed;
}

u32 Random::MultiByB(s32 B){
 if (B == 0) return 0;
 else return udivdi3((B * ShiftSeed()),0x100000000);
}


//gives number between and including (a) and (b)
//identical to Random::Range()
u32 Random::func(u32 a,u32 b){
  u32 uVar2;
  
  if (a != b) {
    uVar2 = a;
    if (b < a) {
      uVar2 = b;
      b = a;
    }
    a = MultiByB((b - uVar2) + 1) + uVar2;
  }
  return a;}
//shift seed for RNG object
void Random::ofunc_shiftSeed(){seed = seed * 0x19660d + 0x3c6ef35f;}
//used in AllocPlayerAudio
u32 Random::randAudio(s32 arg1){
  u32 uVar1;
  
  if (arg1 == 0) return 0;
  if (arg1 < 0) {
    uVar1 = ShiftSeed();
    if (arg1 < 0) arg1 = -arg1;
    return -udivdi3((arg1 * uVar1),0x100000000);
  }
  else {
    uVar1 = ShiftSeed();
    if (arg1 < 0) arg1 = -arg1;
    return udivdi3((arg1 * uVar1),0x100000000);
  }
}
//gives number between and including (a) and (b)
//identical to Random::func()
s32 Random::Range(s32 a,s32 b){
  s32 iVar2;

  if (a != b) {
    iVar2 = a;
    if (b < a) {
      iVar2 = b;
      b = a;}
    a = MultiByB((b - iVar2) + 1) + iVar2;
  }
  return a;}
//returns random float in range of 0.0 and 1.0
float Random::GetFloat0To1(){
  s32 uVar1 = seed * 0x19660d + 0x3c6ef35f; //inline seed shift
  double dVar2 = (double)uVar1;
  
  seed = uVar1;
  return (float)dVar2 * (float)(1.0/0xFFFFFFFF); //2^-32
}
//returns random float in range of 0.0 and X
float Random::GetFloat0ToX(float f){
  if (f != 0.0) f *= GetFloat0To1();
  return f;}
//returns random float in range of a And b
float Random::GetFloatRange(float a,float b){
  float fVar2;
  
  if (a != b) {
    fVar2 = b;
    if (a <= b) {
      fVar2 = a;
      a = b;
    }
    a = GetFloat0To1() * (a - fVar2) + fVar2;
  }
  return a;}
//returns vec2 with values in range of 0 and multi
void Random::GetVec2(vec2f *v,float multi){
  v->x = GetFloatRange(-1.0f,1.0f);
  v->y = GetFloatRange(-1.0f,1.0f);
  if (v->x == 0.0) v->x = NORMALIZE_MIN;
  Vec2Normalize(v);
  Vec2Scale(v,multi);
}
//returns vec3 with values in range of 0 and multi
void Random::GetVec3(vec3f *v,float multi){
  v->x = GetFloatRange(-1.0f,1.0f);
  v->y = GetFloatRange(-1.0f,1.0f);
  v->z = GetFloatRange(-1.0f,1.0f);
  if (v->x == 0.0) v->x = NORMALIZE_MIN;
  Vec3Normalize(v);
  Vec3Scale(v,multi);
}
//returns vec4 with values in range of 0 and multi
void Random::GetVec4(vec4f *v,float multi){
  v->x = GetFloatRange(-1.0f,1.0f);
  v->y = GetFloatRange(-1.0f,1.0f);
  v->z = GetFloatRange(-1.0f,1.0f);
  v->w = GetFloatRange(-1.0f,1.0f);
  if (v->x == 0.0) v->x = NORMALIZE_MIN;
  Vec4Normalize(v);
  Vec4Scale(v,multi);
}
