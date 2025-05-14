#include "widgets\BaseWidget.h"

BaseWidget::BaseWidget(){
  col.R = 0xff;
  col.G = 0xff;
  col.B = 0xff;
  col.A = 0xff;
  boundX1 = SCREEN_WIDTH;
  substruct = NULL;
  height = 0;
  width = 0;
  x = 0;
  y = 0;
  borg8 = NULL;
  var5C = 0;
  var5E = 0;
  boundY0 = 0;
  boundX0 = 0;
  boundY1 = SCREEN_HEIGHT;
  link0 = NULL;
  link1 = NULL;
  link2 = NULL;
  link3 = NULL;
  link4 = NULL;
  UpButtonFunc = NULL;
  DownButtonFunc = NULL;
  LeftButtonFunc = NULL;
  RightButtonFunc = NULL;
  AButtonFunc = NULL;
  BButtonFunc = NULL;
  StartButtonFunc = NULL;
  LButtonFunc = NULL;
  RButtonFunc = NULL;
  ZButtonFunc = NULL;
  CUpButtonFunc = NULL;
  CDownButtonFunc = NULL;
  CLeftButtonFunc = NULL;
  CRightButtonFunc = NULL;
  state = 1;
  fadeIn = NULL;
  fadeOut = NULL;
}

BaseWidget::~BaseWidget(){FreeChildren();}

//set screenspace coords for widget
void BaseWidget::SetCoords(s16 X,s16 Y){
  this->x = X;
  this->y = Y;
}

void BaseWidget::SetWidth(u16 w){width=w;}
u16 BaseWidget::GetWidth(){return width;}
void BaseWidget::SetHeight(u16 h){height=h;}
u16 BaseWidget::GetHeight(){return height;}
void BaseWidget::SetColor(u8 r, u8 g, u8 b, u8 a){
  col.R = r;
  col.G = g;
  col.B = b;
  col.A = a;
}
//replace current borg8 with (b8), resize widget to (b8) if (fit)
void BaseWidget::SetBorg8(Borg8header *b8,u8 fit){
  if (borg8) borg8_free(borg8);
  borg8 = b8;
  if ((fit) && (b8)) {
    width = (b8->dat).Width;
    height = (b8->dat).Height;
  }
}

void BaseWidget::SetSomeBounds(u16 Y0,u16 X0, u16 X1, u16 Y1){
  boundY0 = Y0;
  boundX0 = X0;
  boundX1 = X1;
  boundY1 = Y1;
}
void BaseWidget::GetSomeBounds(u16* Y0,u16* X0, u16* X1, u16* Y1){
  *Y0 = boundY0;
  *X0 = boundX0;
  *X1 = boundX1;
  *Y1 = boundY1;
}

BaseWidget * BaseWidget::Control(controller_aidyn *input){
  u32 BVar1;
  char cVar2;
  u32 BVar3;
  BaseWidget *pBVar4;
  int iVar6;
  u32 BVar7;
  
  BVar7 = input->input;
  if (widget_control_dat == 0) {
    widget_control_buttons = input->input_2;
    widget_control_dat = 1;
  }
  BVar1 = input->input_2;
  if ((BVar1 & ~(C_DOWN|C_UP|D_RIGHT|D_LEFT|D_DOWN|D_UP|ANA_LEFT|ANA_RIGHT|ANA_DOWN|ANA_UP)) == 0) {
    cVar2 = 30;
    BVar3 = BVar1;
    if ((widget_control_buttons == BVar1) &&
       (cVar2 = widget_control_timer + -1, BVar3 = widget_control_buttons,
       (char)(widget_control_timer + -1) == 0)) {
      BVar7 |= BVar1;
      cVar2 = 5;
    }
  }
  else {
    widget_control_buttons = 0;
    cVar2 = 30;
    BVar3 = widget_control_buttons;
  }
  widget_control_buttons = BVar3;
  widget_control_timer = cVar2;
  if ((BVar7 & START_BUTTON)) return this->StartFunc();
  if ((BVar7 & A_BUTTON)) return this->AFunc();
  if ((BVar7 & B_BUTTON)) return this->BFunc();
  if ((BVar7 & D_UP)) return this->UpFunc();
  if ((BVar7 & D_DOWN)) return this->DownFunc();
  if ((BVar7 & D_LEFT)) return this->LeftFunc();
  if ((BVar7 & D_RIGHT)) return this->RightFunc();
  if ((BVar7 & ANA_UP)) return this->UpFunc();
  if ((BVar7 & ANA_DOWN)) return this->DownFunc();
  if ((BVar7 & ANA_LEFT)) return this->LeftFunc();
  if ((BVar7 & ANA_RIGHT)) return this->RightFunc();
  if ((BVar7 & Z_TRIG)) return this->ZFunc();
  if ((BVar7 & L_TRIG)) return this->LFunc();
  if ((BVar7 & R_TRIG)) return this->RFunc();
  if ((BVar7 & U_CBUTTONS)) return this->CUPFunc();
  if ((BVar7 & D_CBUTTONS)) return this->CDownFunc();
  if ((BVar7 & L_CBUTTONS)) return this->CLeftFunc();
  if ((BVar7 & R_CBUTTONS)) return this->CRightFunc();
  return NULL;
}


Gfx * BaseWidget::RenderChildren(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  for (BaseWidget *pBVar1 = link3; pBVar1 != NULL; pBVar1 = pBVar1->link2) {g = pBVar1->Render(g,x0,y0,x1,y1);}
  return g;
}

void BaseWidget::FreeChildren(){
  do {
    BaseWidget *w = this->link3;
    while( true ) {
      if (w == NULL) {
        this->link4 = NULL;
        this->link3 = NULL;
        return;
      }
      this->link3 = this->link3->link2;
      if (w == NULL) break;
      w->~BaseWidget();
      w = this->link3;
    }
  } while( true );
}

u8 BaseWidget::TickChildren(){
for (BaseWidget *pBVar1 = link3; pBVar1 != NULL; pBVar1 = pBVar1->link2) {pBVar1->Tick();}
  return false;
}

u32 BaseWidget::RunFunc0(){
  if (state - 1 < 2) {
    if ((fadeIn == NULL) || (state != 1)) state = 2;
    else (*fadeIn)(this);
  }
  return RunFunc0Children();
}
u32 BaseWidget::RunFunc0Children(){
    u32 ret = state;
    for (BaseWidget *pBVar1 = link3; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
        if(pBVar1->RunFunc0()==1)ret=1;
        }
    return ret;
}

u32 BaseWidget::RunFunc1(){
  if (state - 5 < 2) {
    if ((fadeOut == NULL) || (state != 5)) state = 6;
    else (*fadeOut)(this);
  }
  return RunFunc1Children();
}

u32 BaseWidget::RunFunc1Children(){
    u32 ret = state;
    for (BaseWidget *pBVar1 = link3; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
        if(pBVar1->RunFunc1()==5)ret=5;
        }
    return ret;
}

void BaseWidget::SetState(u8 state){
  this->state = state;
  for (BaseWidget *pBVar1 = link3; pBVar1 != NULL; pBVar1 = pBVar1->link2) {pBVar1->SetState(state);}
}

u8 BaseWidget::Link(BaseWidget *other){  
  if (this->link3 == NULL) {
    this->link3 = other;
    this->link4 = other;
    other->link0 = this;
    this->link3->link1 = NULL;
    this->link3->link2 = NULL;
  }
  else {
    this->link4->link2 = other;
    other->link2 = NULL;
    other->link1 = this->link4;
    this->link4 = other;
    other->link0 = this;
  }
  return true;
}

u8 BaseWidget::Unlink(BaseWidget *other){
  BaseWidget *pBVar1 = this->link3;
  while( true ) {
    if (pBVar1 == NULL) return false;
    if (pBVar1 == other) break;
    pBVar1 = pBVar1->link2;
  }
  if (this->link3 == pBVar1) this->link3 = pBVar1->link2;
  if (this->link4 == pBVar1) this->link4 = pBVar1->link1;
  if (pBVar1->link1) pBVar1->link1->link2 = pBVar1->link2;
  if (pBVar1->link2) pBVar1->link2->link1 = pBVar1->link1;
  pBVar1->link0 = NULL;
  pBVar1->link1 = NULL;
  pBVar1->link2 = NULL;
  return true;
}

#define buttonMacro(name)\
        if(##name##ButtonFunc) return (##name##ButtonFunc)(link0,this);\
        return (BaseWidget*)NULL;\

BaseWidget* BaseWidget::UpFunc(){buttonMacro(Up)}
BaseWidget* BaseWidget::DownFunc(){buttonMacro(Down)}
BaseWidget* BaseWidget::LeftFunc(){buttonMacro(Left)}
BaseWidget* BaseWidget::RightFunc(){buttonMacro(Right)}
BaseWidget* BaseWidget::AFunc(){buttonMacro(A)}
BaseWidget* BaseWidget::BFunc(){buttonMacro(Right)}
BaseWidget* BaseWidget::ZFunc(){buttonMacro(Z)}
BaseWidget* BaseWidget::LFunc(){buttonMacro(L)}
BaseWidget* BaseWidget::RFunc(){buttonMacro(R)}
BaseWidget* BaseWidget::StartFunc(){buttonMacro(Start)}
BaseWidget* BaseWidget::CUPFunc(){buttonMacro(CUp)}
BaseWidget* BaseWidget::CDownFunc(){buttonMacro(CDown)}
BaseWidget* BaseWidget::CLeftFunc(){buttonMacro(CLeft)}
BaseWidget* BaseWidget::CRightFunc(){buttonMacro(CRight)}