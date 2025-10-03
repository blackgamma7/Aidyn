#include "widgets\BaseWidget.h"

BaseWidget::BaseWidget(){
  this->col.R = 0xff;
  this->col.G = 0xff;
  this->col.B = 0xff;
  this->col.A = 0xff;
  this->boundX1 = SCREEN_WIDTH;
  this->substruct = NULL;
  this->height = 0;
  this->width = 0;
  this->x = 0;
  this->y = 0;
  this->borg8 = NULL;
  this->var5C = 0;
  this->var5E = 0;
  this->boundY0 = 0;
  this->boundX0 = 0;
  this->boundY1 = SCREEN_HEIGHT;
  this->link0 = NULL;
  this->link1 = NULL;
  this->link2 = NULL;
  this->link3 = NULL;
  this->link4 = NULL;
  this->UpButtonFunc = NULL;
  this->DownButtonFunc = NULL;
  this->LeftButtonFunc = NULL;
  this->RightButtonFunc = NULL;
  this->AButtonFunc = NULL;
  this->BButtonFunc = NULL;
  this->StartButtonFunc = NULL;
  this->LButtonFunc = NULL;
  this->RButtonFunc = NULL;
  this->ZButtonFunc = NULL;
  this->CUpButtonFunc = NULL;
  this->CDownButtonFunc = NULL;
  this->CLeftButtonFunc = NULL;
  this->CRightButtonFunc = NULL;
  this->state = 1;
  this->fadeIn = NULL;
  this->fadeOut = NULL;
}

BaseWidget::~BaseWidget(){
  FreeChildren();
  delete this;
}

//set screenspace coords for widget
void BaseWidget::SetCoords(s16 X,s16 Y){
  this->x = X;
  this->y = Y;
}

void BaseWidget::SetWidth(u16 w){this->width=w;}
u16 BaseWidget::GetWidth(){return this->width;}
void BaseWidget::SetHeight(u16 h){this->height=h;}
u16 BaseWidget::GetHeight(){return this->height;}
void BaseWidget::SetColor(u8 r, u8 g, u8 b, u8 a){
  this->col.R = r;
  this->col.G = g;
  this->col.B = b;
  this->col.A = a;
}
//replace current borg8 with (b8), resize widget to (b8) if (fit)
void BaseWidget::SetBorg8(Borg8Header *b8,u8 fit){
  if (borg8) borg8_free(borg8);
  borg8 = b8;
  if ((fit) && (b8)) {
    this->width = (b8->dat).Width;
    this->height = (b8->dat).Height;
  }
}

void BaseWidget::SetSomeBounds(u16 Y0,u16 X0, u16 X1, u16 Y1){
  this->boundY0 = Y0;
  this->boundX0 = X0;
  this->boundX1 = X1;
  this->boundY1 = Y1;
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
  u32 buttons;
  
  buttons = input->input;
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
      buttons |= BVar1;
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
  if ((buttons & START_BUTTON)) return this->StartFunc();
  if ((buttons & A_BUTTON)) return this->AFunc();
  if ((buttons & B_BUTTON)) return this->BFunc();
  if ((buttons & D_UP)) return this->UpFunc();
  if ((buttons & D_DOWN)) return this->DownFunc();
  if ((buttons & D_LEFT)) return this->LeftFunc();
  if ((buttons & D_RIGHT)) return this->RightFunc();
  if ((buttons & ANA_UP)) return this->UpFunc();
  if ((buttons & ANA_DOWN)) return this->DownFunc();
  if ((buttons & ANA_LEFT)) return this->LeftFunc();
  if ((buttons & ANA_RIGHT)) return this->RightFunc();
  if ((buttons & Z_TRIG)) return this->ZFunc();
  if ((buttons & L_TRIG)) return this->LFunc();
  if ((buttons & R_TRIG)) return this->RFunc();
  if ((buttons & U_CBUTTONS)) return this->CUPFunc();
  if ((buttons & D_CBUTTONS)) return this->CDownFunc();
  if ((buttons & L_CBUTTONS)) return this->CLeftFunc();
  if ((buttons & R_CBUTTONS)) return this->CRightFunc();
  return NULL;
}


Gfx * BaseWidget::RenderChildren(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  for (BaseWidget *w = this->link3; w != NULL; w = w->link2) {g = w->Render(g,x0,y0,x1,y1);}
  return g;
}

void BaseWidget::FreeChildren(){
  while(1) {
    BaseWidget *w = this->link3;
    while(1) {
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
  }
}

u8 BaseWidget::TickChildren(){
for (BaseWidget *w = this->link3; w != NULL; w = w->link2) {w->Tick();}
  return false;
}

u32 BaseWidget::RunFunc0(){
  if (this->state - 1 < 2) {
    if ((fadeIn == NULL) || (this->state != 1)) this->state = 2;
    else (*fadeIn)(this);
  }
  return RunFunc0Children();
}
u32 BaseWidget::RunFunc0Children(){
    u32 ret = this->state;
    for (BaseWidget *w = this->link3; w != NULL; w = w->link2) {
        if(w->RunFunc0()==1)ret=1;
        }
    return ret;
}

u32 BaseWidget::RunFunc1(){
  if (this->state - 5 < 2) {
    if ((fadeOut == NULL) || (this->state != 5)) this->state = 6;
    else (*fadeOut)(this);
  }
  return RunFunc1Children();
}

u32 BaseWidget::RunFunc1Children(){
    u32 ret = this->state;
    for (BaseWidget *w = this->link3; w != NULL; w = w->link2) {
        if(w->RunFunc1()==5)ret=5;
        }
    return ret;
}

void BaseWidget::SetState(u8 newState){
  this->state = newState;
  for (BaseWidget *w = this->link3; w != NULL; w = w->link2) {w->SetState(newState);}
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
  BaseWidget *w = this->link3;
  while(1) {
    if (w == NULL) return false;
    if (w == other) break;
    w = w->link2;
  }
  if (this->link3 == w) this->link3 = w->link2;
  if (this->link4 == w) this->link4 = w->link1;
  if (w->link1) w->link1->link2 = w->link2;
  if (w->link2) w->link2->link1 = w->link1;
  w->link0 = NULL;
  w->link1 = NULL;
  w->link2 = NULL;
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