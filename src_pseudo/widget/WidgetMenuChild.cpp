#include "widgets/WidgetChild6.h"
#include "widgets/Utilities.h"

void WidgetSaveFile::unk3() {
  
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
  this->currFileIndex = 0;
  this->field6_0x9c = 0;
  this->canRender = false;
  this->boundY1 = y1;
}

WidgetMenuChild::~WidgetMenuChild(){
  FreeMenu();
  aniManage.~GuiAnimationManager();
  WidgetMenu::~WidgetMenu();
}

Gfx * WidgetMenuChild::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  if (this->canRender) {
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
  this->aniManage.Tick(1);
  if ((this->field3_0x84) && ((this->aniManage).present == 0)) {
    m80033020();
  }
  return WidgetMenu::Tick();
}


s32 WidgetMenuChild::AddFileWidget(WidgetSaveFile *c10) {
  WidgetSaveFile *pWVar1;
  int iVar3;
  
  if (c10 == NULL) {
    iVar3 = 0;
  }
  else {
    iVar3 = this->field6_0x9c;
    pWVar1 = this->field2_0x80;
    this->field6_0x9c++;
    if (pWVar1 == NULL) {
      this->field1_0x7c = c10;
      this->field2_0x80 = c10;
      c10->next = NULL;
      c10->prev = NULL;
      this->Link(this->field2_0x80);
      this->field2_0x80->unk();
    }
    else {
      for (; pWVar1->next != NULL; pWVar1 = pWVar1->next) {
      }
      pWVar1->next = c10;
      c10->prev = pWVar1;
      c10->next = NULL;
    }
  }
  return iVar3;
}

void WidgetMenuChild::FreeMenu() {
  WidgetSaveFile *pWVar2;
  WidgetSaveFile *pBVar3;
  WidgetSaveFile *pBVar4;
  WidgetSaveFile *pBVar5;
  
  if (this->field2_0x80) {
    this->aniManage.Clear();
    m80033020();
    this->field2_0x80->unk2();
    pWVar2 = this->field2_0x80->next;
    while (pBVar4 = pWVar2, pBVar4 != NULL) {
      pBVar4->prev = NULL;
      pWVar2 = pBVar4->next;
      if (pBVar4) this->field2_0x80->~WidgetSaveFile();
    }
    pBVar3 = this->field2_0x80->prev;
    while (pBVar5 = pBVar3, pBVar5 != NULL) {
      pBVar5->next = NULL;
      pBVar3 = pBVar5->prev;
      if (pBVar5) pBVar5->~WidgetSaveFile();
    }
    this->Unlink(this->field2_0x80);
    pWVar2 = this->field2_0x80;
    if (pWVar2 != NULL)pWVar2->~WidgetSaveFile();
    this->field2_0x80 = NULL;
    this->field1_0x7c = NULL;
    this->field6_0x9c = 0;
    this->canRender = false;
  }
}

void WidgetMenuChild::ShiftRight() {
  WidgetSaveFile *pWVar3;
  WidgetSaveFile *pWVar4;
  short asStack_20 [1];
  
  pWVar3 = this->field2_0x80;
  if ((pWVar3 != NULL) && (pWVar4 = pWVar3->next, pWVar4 != NULL)) {
    asStack_20[0] = this->field2_0x80->posX - (pWVar3->boundX1 - this->boundX0);
    this->aniManage.AddItem(new GuiAnimatorS16(&this->field2_0x80->posX,asStack_20,60,&double_array_1));
    this->field2_0x80 = pWVar4;
    this->field3_0x84 = this->field2_0x80;
    pWVar4->unk();
    this->Link(this->field2_0x80);
    Utilities::MoveWidget2(this->field2_0x80,this->boundX1,this->field2_0x80->posY);
    this->aniManage.AddItem(new GuiAnimatorS16(&this->field2_0x80->posX,&this->boundX0,60,&double_array_1));
    this->currFileIndex++;
  }
}

void WidgetMenuChild::ShiftLeft() {
  WidgetSaveFile *pWVar3;
  
  if ((this->field2_0x80 != NULL) &&
     (pWVar3 = this->field2_0x80->prev, pWVar3 != NULL)) {
    this->aniManage.AddItem(new GuiAnimatorS16(&this->field2_0x80->posX,&this->boundX1,60,&double_array_1));
    this->field2_0x80 = pWVar3;
    this->field3_0x84 = this->field2_0x80;
    pWVar3->unk();
    this->Link(this->field2_0x80);
    Utilities::MoveWidget2(this->field2_0x80,this->field2_0x80->posX * 2 - this->boundX1,this->field2_0x80->posY);
    this->aniManage.AddItem(new GuiAnimatorS16(&this->field2_0x80->posX,&this->boundX0,60,
                        &double_array_1));
    if (this->currFileIndex) this->currFileIndex--;
  }
}

WidgetSaveFile* WidgetMenuChild::m80032ef8(){return this->field2_0x80;}

bool WidgetMenuChild::m80032f00(){return this->field3_0x84!=NULL;}


void WidgetMenuChild::m80032f0c() {
  short sVar1;
  short sVar2;
  WidgetSaveFile *w;
  int iVar4;
  
  iVar4 = 0;
  if (this->field1_0x7c) {
    this->field2_0x80->unk2();
    this->Unlink(this->field2_0x80);
    sVar1 = this->boundX0;
    sVar2 = this->boundX1;
    w = this->field1_0x7c;
    for (; (w->next != NULL &&
           (Utilities::MoveWidget2(w,sVar1 + (sVar1 - sVar2),w->posY),
           iVar4 != this->currFileIndex)); iVar4++) {
      w = w->next;
    }
    this->currFileIndex = iVar4;
    this->field2_0x80 = w;
    w->unk();
    this->Link(this->field2_0x80);
    do {
      Utilities::MoveWidget2(w,this->boundX0,w->posY);
      w = w->next;
    }while (w);
    this->canRender = true;
  }
}

void WidgetMenuChild::SetIndex(s32 param_2) {this->currFileIndex = param_2;}


void WidgetMenuChild::m80033020() {
  if (this->field3_0x84) {
    this->field3_0x84->unk2();
    this->Unlink(this->field3_0x84);
    this->field3_0x84 = NULL;
  }
}

WidgetSaveFile::~WidgetSaveFile(){WidgetMenu::~WidgetMenu();}

WidgetSaveFile::WidgetSaveFile():WidgetMenu(){
  this->prev=NULL;
  this->next=NULL;
}