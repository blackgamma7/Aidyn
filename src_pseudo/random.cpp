#include "randClass.h"
//most the RNG funcs in the game, save for 2 in globals.cpp

#define UINT_MAX_D 4.294967296E9

void Random::SetSeed(u32 num){
  if (seed == 0) seed = 1;
  seed = num;
}

u32 Random::ShiftSeed(){
  seed = seed * 0x19660d + 0x3c6ef35f;
  return seed;
}

u32 Random::MultiByB(s32 B){
 if (B == 0) return 0;
 else return udivdi3((B * ShiftSeed()),0x100000000);
}

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

void Random::ofunc_shiftSeed(){seed = seed * 0x19660d + 0x3c6ef35f;}

u32 Random::randAudio(s32 arg1){
  uint uVar1;
  
  if (arg1 == 0) return 0;
  if (arg1 < 0) {
    uVar1 = ShiftSeed();
    if (arg1 < 0) arg1 = -arg1;
    return -udivdi3((arg1 * uVar1),0x100000000);
    //return -udivdi3((ulonglong)(uint)arg1 * (ulonglong)uVar1 & 0xffffffff |(ulonglong)((int)((ulonglong)(uint)arg1 * (ulonglong)uVar1 >> 0x20) +uVar1 * (arg1 >> 0x1f)) << 0x20,0x100000000);
  }
  else {
    uVar1 = ShiftSeed();
    if (arg1 < 0) arg1 = -arg1;
    return udivdi3((arg1 * uVar1),0x100000000);
    //return udivdi3((ulonglong)(uint)arg1 * (ulonglong)uVar1 & 0xffffffff |(ulonglong)((int)((ulonglong)(uint)arg1 * (ulonglong)uVar1 >> 0x20) +uVar1 * (arg1 >> 0x1f)) << 0x20,0x100000000);
  }
}

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

float Random::GetFloat(){
  s32 uVar1 = seed * 0x19660d + 0x3c6ef35f; //inline seed shift
  double dVar2 = (double)uVar1;
  
  seed = uVar1;
  if (uVar1 < 0) dVar2+= UINT_MAX_D;
  return (float)dVar2 * *(float*)0x2F800000; //2^-32
}

float Random::GetFloat_multi(float f){
  if (f != 0.0) f *= GetFloat();
  return f;}

float Random::GetFloatRange(float a,float b){
  float fVar2;
  
  if (a != b) {
    fVar2 = b;
    if (a <= b) {
      fVar2 = a;
      a = b;
    }
    a = GetFloat() * (a - fVar2) + fVar2;
  }
  return a;}

void Random::GetVec2(vec2f *v,float multi){
  v->x = GetFloatRange(-1.0f,1.0f);
  v->y = GetFloatRange(-1.0f,1.0f);
  if (v->x == 0.0) v->x = 1.0E-6f;
  vec2_normalize(v);
  multiVec2(v,multi);
}

void Random::GetVec3(vec3f *v,float multi){
  v->x = GetFloatRange(-1.0f,1.0f);
  v->y = GetFloatRange(-1.0f,1.0f);
  v->z = GetFloatRange(-1.0f,1.0f);
  if (v->x == 0.0) v->x = 1.0E-6f;
  vec3_normalize(v);
  multiVec3(v,multi);
}
void Random::GetVec4(vec4f *v,float multi){
  v->x = GetFloatRange(-1.0f,1.0f);
  v->y = GetFloatRange(-1.0f,1.0f);
  v->z = GetFloatRange(-1.0f,1.0f);
  v->w = GetFloatRange(-1.0f,1.0f);
  if (v->x == 0.0) v->x = 1.0E-6f;
  vec4_normalize(v);
  multiVec4(v,multi);
}
