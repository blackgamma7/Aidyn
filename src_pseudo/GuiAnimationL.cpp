#include "GuiAnimation.h"
#include "globals.h"

GuiAnimatorL::GuiAnimatorL(GuiAnimator *l,BaseWidget *widget){
  this->unk0 = 0.0;
  this->link = l;
  this->w = widget;
  this->spd = 1.0;
}

GuiAnimatorL::~GuiAnimatorL(){
  if (this->link) {
    this->link->~GuiAnimator();
    this->link = NULL;
  }
  GuiAnimatorF::~GuiAnimatorF();//inline'd.
}


void GuiAnimatorL::m80046ac4(){
  if (this->w){
    BaseWidget *pBVar2 = this->w->link0;
    if (pBVar2 != NULL) pBVar2->Unlink(this->w);
    FREEQW(this->w);
    this->w = NULL;
  }
  if (this->link) {
    this->link->~GuiAnimator();
    this->link = NULL;
  }
  this->unk0 = this->spd;
}

void GuiAnimatorL::vMethA(s32 x){
  if (this->link->unk0 < this->link->spd)
    this->link->vMethA(x);
  else m80046ac4();
}

GuiAnimatorF::~GuiAnimatorF(){delete this;}


void GuiAnimatorF::vMethA(s32 x){
  if (this->unk0 < this->spd) {
    this->unk0 +=x;
    if (this->spd < this->unk0)
      this->unk0 = this->spd;
    this->vMethB(this->unk0 / this->spd);
  }
}

u32 GuiAnimatorL::vMethB(f32 x){}
