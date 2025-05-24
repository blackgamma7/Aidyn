#include "unkGuiSubstruct.h"

UnkGuiClassU2::UnkGuiClassU2(s16 *param_2,s16 *param_3,s32 param_4,UnkGuiClassStruct *param_5){
  this->unk0 = 0;
  this->unk4 = param_4;
  this->val = param_2;
  this->unk=*param_5;
  this->f64Array[0] = *param_2;
  this->f64Array[1] = *param_3;
}

UnkGuiClassU2::~UnkGuiClassU2(){
    *this->val=this->f64Array[1];
    UnkGuiClass::~UnkGuiClass(); //gets inline'd.
}

short UnkGuiClassU2::vMethC(float param_2){
  float sinX = sinf(((this->unk).unk8 *
                           (((this->unk).unk20 + (double)param_2 * ((this->unk).unk28 - (this->unk).unk20)) -
                           (this->unk).unk10)));
  return (this->f64Array[0] +(this->f64Array[1] - this->f64Array[0]) *((this->unk).unk0 * (double)sinX + (this->unk).unk18));
}

UnkGuiClassU4::UnkGuiClassU4(u16 *param_2,u16 *param_3,s32 param_4,UnkGuiClassStruct *param_5){
  this->unk0 = 0;
  this->unk4 = param_4;
  this->val = param_2;
  this->unk=*param_5;
  this->f64Array[0] = *param_2;
  this->f64Array[1] = *param_3;
}

UnkGuiClassU4::~UnkGuiClassU4(){
    *this->val=this->f64Array[1];
    UnkGuiClass::~UnkGuiClass(); //gets inline'd.
}

u16 UnkGuiClassU4::vMethC(float param_2){
  float sinX = sinf(((this->unk).unk8 *
                           (((this->unk).unk20 + (double)param_2 * ((this->unk).unk28 - (this->unk).unk20)) -
                           (this->unk).unk10)));
  return (this->f64Array[0] +(this->f64Array[1] - this->f64Array[0]) *((this->unk).unk0 * (double)sinX + (this->unk).unk18));
}

UnkGuiClassU3::UnkGuiClassU3(u8 *param_2,u8 *param_3,s32 param_4,UnkGuiClassStruct *param_5){
  this->unk0 = 0;
  this->unk4 = param_4;
  this->val = param_2;
  this->unk=*param_5;
  this->f64Array[0] = *param_2;
  this->f64Array[1] = *param_3;
}

UnkGuiClassU3::~UnkGuiClassU3(){
    *this->val=this->f64Array[1];
    UnkGuiClass::~UnkGuiClass(); //gets inline'd.
}

u8 UnkGuiClassU3::vMethC(float param_2){
  float sinX = sinf(((this->unk).unk8 *
                           (((this->unk).unk20 + (double)param_2 * ((this->unk).unk28 - (this->unk).unk20)) -
                           (this->unk).unk10)));
  return (this->f64Array[0] +(this->f64Array[1] - this->f64Array[0]) *((this->unk).unk0 * (double)sinX + (this->unk).unk18));
}

UnkGuiClass::~UnkGuiClass(){delete this;}


void UnkGuiClass::vMethA(s32 param_2){

  if (this->unk0 < this->unk4) {
    this->unk0+=param_2;
    if (this->unk4 < this->unk0) this->unk0 = this->unk4;
    this->vMethB(this->unk0 / this->unk4);
  }
}

u32 UnkGuiClassU3::vMethB(f32 x){
    u32 ret=this->vMethC(x);
    *this->val=ret;
    return ret;
}
u32 UnkGuiClassU4::vMethB(f32 x){
    u32 ret=this->vMethC(x);
    *this->val=ret;
    return ret;
}
u32 UnkGuiClassU4::vMethB(f32 x){
    u32 ret=this->vMethC(x);
    *this->val=ret;
    return ret;
}
