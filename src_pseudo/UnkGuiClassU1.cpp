#include "unkGuiSubstruct.h"

s16 UnkGuiClassBlip::vMethC(f32 x){
    return (this->unk10 + (this->unk14 - this->unk10) * x);
}

u8 UnkGuiClassCB::vMethC(f32 x){
    return (this->unk10 + (this->unk14 - this->unk10) * x);
}

void UnkGuiClassU1::vMethA(s32 n){
  float fVar4 = unk0;
  float fVar3 = unk4;
  if (fVar4 < fVar3) {
    fVar4+= n;
    unk0 = fVar4;
    if (fVar3 < fVar4) unk0 = fVar3;
    vMethB(unk0 /unk4);
  }
}
UnkGuiClassBlip::~UnkGuiClassBlip(){}
UnkGuiClassCB::~UnkGuiClassCB(){}

//gets unrolled when called
UnkGuiClassBlip::UnkGuiClassBlip(s16 *param_2,short *param_3,s32 param_4){
  this->unk0 = 0;
  this->unk4 = param_4;
  this->unkc = param_2;
  this->unk10 = *param_2;
  this->unk14 = *param_3;
}
//gets unrolled when called
UnkGuiClassCB::UnkGuiClassCB(u8 *param_2,u8 *param_3,s32 param_4){
  unk0 = 0;
  unk4 = param_4;
  unkc = param_2;
  unk10 = *param_2;
  unk14 = (float)*param_3;
}
u32 UnkGuiClassCB::vMethB(f32 x){
  u32 ret=vMethC(x);
  *unkc=ret;
  return ret;
}

u32 UnkGuiClassBlip::vMethB(f32 x){
    u32 ret=vMethC(x);
    *unkc=ret;
    return ret;
}
UnkGuiClassU1::~UnkGuiClassU1(){}