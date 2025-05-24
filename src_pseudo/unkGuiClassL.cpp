#include "unkGuiSubstruct.h"
#include "globals.h"

UnkGuiClassL::UnkGuiClassL(UnkGuiClass *l,BaseWidget *widget){
  this->unk0 = 0.0;
  this->link = l;
  this->w = widget;
  this->unk4 = 1.0;
}

UnkGuiClassL::~UnkGuiClassL(){
  if (this->link) {
    this->link->~UnkGuiClass();
    this->link = NULL;
  }
  UnkGuiClassF::~UnkGuiClassF();//inline'd.
}


void UnkGuiClassL::m80046ac4(){
  if (this->w){
    BaseWidget *pBVar2 = this->w->link0;
    if (pBVar2 != NULL) pBVar2->Unlink(this->w);
    FREEQW(this->w);
    this->w = NULL;
  }
  if (this->link) {
    this->link->~UnkGuiClass();
    this->link = NULL;
  }
  this->unk0 = this->unk4;
}

void UnkGuiClassL::vMethA(s32 x){
  if (this->link->unk0 < this->link->unk4)
    this->link->vMethA(x);
  else m80046ac4();
}

UnkGuiClassF::~UnkGuiClassF(){delete this;}


void UnkGuiClassF::vMethA(s32 x){
  if (this->unk0 < this->unk4) {
    this->unk0 +=x;
    if (this->unk4 < this->unk0)
      this->unk0 = this->unk4;
    this->vMethB(this->unk0 / this->unk4);
  }
}

u32 UnkGuiClassL::vMethB(f32 x){}
