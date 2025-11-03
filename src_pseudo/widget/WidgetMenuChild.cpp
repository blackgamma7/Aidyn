#include "widgets/WidgetChild6.h"
#include "widgets/Utilities.h"

void WidgetChild10::unk3() {
  
  s16 newX = this->posX - this->boundX0;
  if (newX) {
    this->posX = this->boundX0;
    Utilities::MoveWidget(this,newX,0);
  }
}

WidgetMenuChild::WidgetMenuChild(u16 x0,u16 y0,u16 x1,u16 y1):
WidgetMenu(){
  this->boundX1 = x1;
  this->boundY0 = y0;
  this->boundX0 = x0;
  this->field5_0x98 = 0;
  this->field6_0x9c = 0;
  this->field7_0xa0 = 0;
  this->boundY1 = y1;
}

WidgetMenuChild::~WidgetMenuChild(){
  FreeMenu();
  field4_0x88.~GuiAnimationManager();
  WidgetMenu::~WidgetMenu();
}

Gfx * WidgetMenuChild::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  if (this->field7_0xa0) {
    u16 rx0 = this->boundX0;
    u16 ry0 = this->boundY0;
    u16 rx1 = this->boundX1;
    u16 ry1 = this->boundY1;
    if (rx0 < x0) rx0 = x0;
    if (x1 < rx1) rx1 = x1;
    if (ry0 < y0) ry0 = y0;
    if (y1 < ry1) ry1 = y1;
    g = WidgetMenu::Render(g,rx0,ry0,rx1,ry1);
  }
  return g;
}

u8 WidgetMenuChild::Tick() {
  if(this->field2_0x80) this->field2_0x80->unk3();
  if (this->field3_0x84) this->field3_0x84->unk3();
  this->field4_0x88.Tick(1);
  if ((this->field3_0x84) && ((this->field4_0x88).present == 0)) {
    m80033020();
  }
  return WidgetMenu::Tick();
}


s32 WidgetMenuChild::AddChild10(WidgetChild10 *c6) {
  WidgetChild10 *pWVar1;
  int iVar3;
  
  if (c6 == NULL) {
    iVar3 = 0;
  }
  else {
    iVar3 = this->field6_0x9c;
    pWVar1 = this->field2_0x80;
    this->field6_0x9c++;
    if (pWVar1 == NULL) {
      this->field1_0x7c = c6;
      this->field2_0x80 = c6;
      c6->unk80 = NULL;
      c6->unk7c = NULL;
      this->Link(this->field2_0x80);
      this->field2_0x80->unk();
    }
    else {
      for (; pWVar1->unk80 != NULL; pWVar1 = pWVar1->unk80) {
      }
      pWVar1->unk80 = c6;
      c6->unk7c = pWVar1;
      c6->unk80 = NULL;
    }
  }
  return iVar3;
}

void WidgetMenuChild::FreeMenu() {
  WidgetChild10 *pWVar2;
  WidgetChild10 *pBVar3;
  WidgetChild10 *pBVar4;
  WidgetChild10 *pBVar5;
  
  if (this->field2_0x80) {
    this->field4_0x88.Clear();
    m80033020();
    this->field2_0x80->unk2();
    pWVar2 = this->field2_0x80->unk80;
    while (pBVar4 = pWVar2, pBVar4 != NULL) {
      pBVar4->unk7c = NULL;
      pWVar2 = pBVar4->unk80;
      if (pBVar4) this->field2_0x80->~WidgetChild10();
    }
    pBVar3 = this->field2_0x80->unk7c;
    while (pBVar5 = pBVar3, pBVar5 != NULL) {
      pBVar5->unk80 = NULL;
      pBVar3 = pBVar5->unk7c;
      if (pBVar5) pBVar5->~WidgetChild10();
    }
    this->Unlink(this->field2_0x80);
    pWVar2 = this->field2_0x80;
    if (pWVar2 != NULL)pWVar2->~WidgetChild10();
    this->field2_0x80 = NULL;
    this->field1_0x7c = NULL;
    this->field6_0x9c = 0;
    this->field7_0xa0 = 0;
  }
}

void WidgetMenuChild::m80032c98() {
  WidgetChild10 *pWVar3;
  WidgetChild10 *pWVar4;
  short asStack_20 [1];
  
  pWVar3 = this->field2_0x80;
  if ((pWVar3 != NULL) && (pWVar4 = pWVar3->unk80, pWVar4 != NULL)) {
    asStack_20[0] = this->field2_0x80->posX - (pWVar3->boundX1 - this->boundX0);
    this->field4_0x88.AddItem(new GuiAnimatorU2(&this->field2_0x80->posX,asStack_20,60,&double_array_1));
    this->field2_0x80 = pWVar4;
    this->field3_0x84 = this->field2_0x80;
    pWVar4->unk();
    this->Link(this->field2_0x80);
    Utilities::MoveWidget2(this->field2_0x80,this->boundX1,this->field2_0x80->posY);
    this->field4_0x88.AddItem(new GuiAnimatorU2(&this->field2_0x80->posX,&this->boundX0,60,&double_array_1));
    this->field5_0x98++;
  }
}

void WidgetMenuChild::m80032dc4() {
  WidgetChild10 *pWVar3;
  
  if ((this->field2_0x80 != NULL) &&
     (pWVar3 = this->field2_0x80->unk7c, pWVar3 != NULL)) {
    this->field4_0x88.AddItem(new GuiAnimatorU2(&this->field2_0x80->posX,&this->boundX1,0x3c,
                        &double_array_1));
    this->field2_0x80 = pWVar3;
    this->field3_0x84 = this->field2_0x80;
    pWVar3->unk();
    this->Link(this->field2_0x80);
    Utilities::MoveWidget2(this->field2_0x80,this->field2_0x80->posX * 2 - this->boundX1,this->field2_0x80->posY);
    this->field4_0x88.AddItem(new GuiAnimatorU2(&this->field2_0x80->posX,&this->boundX0,60,
                        &double_array_1));
    if (this->field5_0x98 != 0) {
      this->field5_0x98--;
    }
  }
}

WidgetChild10* WidgetMenuChild::m80032ef8(){return this->field2_0x80;}

bool WidgetMenuChild::m80032f00(){return this->field3_0x84!=NULL;}


void WidgetMenuChild::m80032f0c() {
  short sVar1;
  short sVar2;
  WidgetChild10 *w;
  int iVar4;
  
  iVar4 = 0;
  if (this->field1_0x7c != NULL) {
    this->field2_0x80->unk2();
    this->Unlink(this->field2_0x80);
    sVar1 = this->boundX0;
    sVar2 = this->boundX1;
    w = this->field1_0x7c;
    for (; (w->unk80 != NULL &&
           (Utilities::MoveWidget2(w,sVar1 + (sVar1 - sVar2),w->posY),
           iVar4 != this->field5_0x98)); iVar4++) {
      w = w->unk80;
    }
    this->field5_0x98 = iVar4;
    this->field2_0x80 = w;
    w->unk();
    this->Link(this->field2_0x80);
    while( true ) {
      Utilities::MoveWidget2(w,this->boundX0,w->posY);
      w = w->unk80;
      if (w == NULL) break;
    }
    this->field7_0xa0 = 1;
  }
}

void WidgetMenuChild::m80033018(s32 param_2) {this->field5_0x98 = param_2;}


void WidgetMenuChild::m80033020() {
  if (this->field3_0x84) {
    this->field3_0x84->unk2();
    this->Unlink(this->field3_0x84);
    this->field3_0x84 = NULL;
  }
}

WidgetChild10::~WidgetChild10(){WidgetMenu::~WidgetMenu();}

WidgetChild10::WidgetChild10():WidgetMenu(){
  this->unk7c=NULL;
  this->unk80=NULL;
}