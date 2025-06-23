#include "GuiAnimation.h"

s16 GuiAnimatorBlip::vMethC(f32 x){
    return (this->unk10 + (this->unk14 - this->unk10) * x);
}

u8 GuiAnimatorCB::vMethC(f32 x){
    return (this->unk10 + (this->unk14 - this->unk10) * x);
}

void GuiAnimatorU1::vMethA(s32 n){
  float fVar4 = this->unk0;
  float fVar3 = this->spd;
  if (fVar4 < fVar3) {
    fVar4+= n;
    this->unk0 = fVar4;
    if (fVar3 < fVar4) this->unk0 = fVar3;
    vMethB(this->unk0 /this->spd);
  }
}
GuiAnimatorBlip::~GuiAnimatorBlip(){}
GuiAnimatorCB::~GuiAnimatorCB(){}

//gets unrolled when called
GuiAnimatorBlip::GuiAnimatorBlip(s16 *param_2,short *param_3,f32 param_4){
  this->unk0 = 0;
  this->spd = param_4;
  this->unkc = param_2;
  this->unk10 = *param_2;
  this->unk14 = *param_3;
}
//gets unrolled when called
GuiAnimatorCB::GuiAnimatorCB(u8 *param_2,u8 *param_3,f32 param_4){
  unk0 = 0;
  spd = param_4;
  unkc = param_2;
  unk10 = *param_2;
  unk14 = (float)*param_3;
}
u32 GuiAnimatorCB::vMethB(f32 x){
  u32 ret=vMethC(x);
  *unkc=ret;
  return ret;
}

u32 GuiAnimatorBlip::vMethB(f32 x){
    u32 ret=vMethC(x);
    *unkc=ret;
    return ret;
}
GuiAnimatorU1::~GuiAnimatorU1(){}