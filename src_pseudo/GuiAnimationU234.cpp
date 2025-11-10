#include "GuiAnimation.h"

GuiAnimatorS16::GuiAnimatorS16(s16 *obj,s16 *target,s32 param_4,GuiAnimatorStruct *param_5){
  this->unk0 = 0;
  this->spd = param_4;
  this->val = obj;
  this->unk=*param_5;
  this->f64Array[0] = *obj;
  this->f64Array[1] = *target;
}

GuiAnimatorS16::~GuiAnimatorS16(){
    *this->val=this->f64Array[1];
    GuiAnimator::~GuiAnimator();
}

s16 GuiAnimatorS16::vMethC(f32 param_2){
  float sinX = sinf(((this->unk).unk8 *
                           (((this->unk).unk20 + (double)param_2 * ((this->unk).unk28 - (this->unk).unk20)) -
                           (this->unk).unk10)));
  return (this->f64Array[0] +(this->f64Array[1] - this->f64Array[0]) *((this->unk).unk0 * (double)sinX + (this->unk).unk18));
}

GuiAnimatorU16::GuiAnimatorU16(u16 *param_2,u16 *param_3,s32 param_4,GuiAnimatorStruct *param_5){
  this->unk0 = 0;
  this->spd = param_4;
  this->val = param_2;
  this->unk=*param_5;
  this->f64Array[0] = *param_2;
  this->f64Array[1] = *param_3;
}

GuiAnimatorU16::~GuiAnimatorU16(){
    *this->val=this->f64Array[1];
    GuiAnimator::~GuiAnimator(); 
}

u32 GuiAnimatorU16::vMethB(f32 x){
  *this->val=this->vMethC(x);
 return *this->val;}

u16 GuiAnimatorU16::vMethC(f32 param_2){
  float sinX = sinf(((this->unk).unk8 *
                           (((this->unk).unk20 + (double)param_2 * ((this->unk).unk28 - (this->unk).unk20)) -
                           (this->unk).unk10)));
  return (this->f64Array[0] +(this->f64Array[1] - this->f64Array[0]) *((this->unk).unk0 * (double)sinX + (this->unk).unk18));
}

GuiAnimatorU8::GuiAnimatorU8(u8 *param_2,u8 *param_3,s32 param_4,GuiAnimatorStruct *param_5){
  this->unk0 = 0;
  this->spd = param_4;
  this->val = param_2;
  this->unk=*param_5;
  this->f64Array[0] = *param_2;
  this->f64Array[1] = *param_3;
}

GuiAnimatorU8::~GuiAnimatorU8(){
    *this->val=this->f64Array[1];
    GuiAnimator::~GuiAnimator();
}

u8 GuiAnimatorU8::vMethC(f32 x){
  float sinX = sinf(((this->unk).unk8 *
                           (((this->unk).unk20 + (double)x * ((this->unk).unk28 - (this->unk).unk20)) -
                           (this->unk).unk10)));
  return (this->f64Array[0] +(this->f64Array[1] - this->f64Array[0]) *((this->unk).unk0 * (double)sinX + (this->unk).unk18));
}

inline GuiAnimator::~GuiAnimator(){delete this;}


void GuiAnimator::vMethA(s32 param_2){

  if (this->unk0 < this->spd) {
    this->unk0+=param_2;
    if (this->spd < this->unk0) this->unk0 = this->spd;
    this->vMethB(this->unk0 / this->spd);
  }
}

u32 GuiAnimatorU8::vMethB(f32 x){
    u32 ret=this->vMethC(x);
    *this->val=ret;
    return ret;
}
u32 GuiAnimatorU16::vMethB(f32 x){
    u32 ret=this->vMethC(x);
    *this->val=ret;
    return ret;
}

u32 GuiAnimatorS16::vMethB(f32 x){
  *this->val=this->vMethC(x);
 return *this->val;}