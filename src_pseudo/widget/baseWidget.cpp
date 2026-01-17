#include "widgets/BaseWidget.h"

BaseWidget::BaseWidget(){
  this->col={COLOR_WHITE};
  this->boundX1 = SCREEN_WIDTH;
  this->substruct = NULL;
  this->height = 0;
  this->width = 0;
  this->posX = 0;
  this->posY = 0;
  this->borg8 = NULL;
  this->varU8 = 0;
  this->varU16 = 0;
  this->boundY0 = 0;
  this->boundX0 = 0;
  this->boundY1 = SCREEN_HEIGHT;
  this->parent = NULL;
  this->siblingL = NULL;
  this->siblingR = NULL;
  this->child = NULL;
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
  this->state = WidgetS_Init;
  this->fadeIn = NULL;
  this->fadeOut = NULL;
}

BaseWidget::~BaseWidget(){
  FreeChildren();
  delete this;
}

//set screenspace coords for widget
void BaseWidget::SetCoords(s16 X,s16 Y){
  this->posX = X;
  this->posY = Y;
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

void BaseWidget::GetSomeBounds(s32* Y0,s32* X0, s32* X1, s32* Y1){
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
  if ((buttons & U_CBUTTONS)) return this->CUpFunc();
  if ((buttons & D_CBUTTONS)) return this->CDownFunc();
  if ((buttons & L_CBUTTONS)) return this->CLeftFunc();
  if ((buttons & R_CBUTTONS)) return this->CRightFunc();
  return NULL;
}


Gfx * BaseWidget::RenderChildren(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  for (BaseWidget *w = this->child; w != NULL; w = w->siblingR) {g = w->Render(g,x0,y0,x1,y1);}
  return g;
}

void BaseWidget::FreeChildren(){
  while(1) {
    BaseWidget *w = this->child;
    while(1) {
      if (w == NULL) {
        this->link4 = NULL;
        this->child = NULL;
        return;
      }
      this->child = this->child->siblingR;
      if (w == NULL) break;
      w->~BaseWidget();
      w = this->child;
    }
  }
}

u8 BaseWidget::TickChildren(){
for (BaseWidget *w = this->child; w != NULL; w = w->siblingR) {w->Tick();}
  return false;
}

u32 BaseWidget::RunFadeIn(){
  if (this->state - 1 < 2) {
    if ((fadeIn == NULL) || (this->state != 1)) this->state = WidgetS_FadedIn;
    else (*fadeIn)(this);
  }
  return RunFadeInChildren();
}
u32 BaseWidget::RunFadeInChildren(){
    u32 ret = this->state;
    for (BaseWidget *w = this->child; w != NULL; w = w->siblingR) {
        if(w->RunFadeIn()==1)ret=1;
        }
    return ret;
}

u32 BaseWidget::RunFadeOut(){
  if (this->state - 5 < 2) {
    if ((fadeOut == NULL) || (this->state != WidgetS_Closing)) this->state = WidgetS_Closed;
    else (*fadeOut)(this);
  }
  return RunFadeOutChildren();
}

u32 BaseWidget::RunFadeOutChildren(){
    u32 ret = this->state;
    for (BaseWidget *w = this->child; w != NULL; w = w->siblingR) {
        if(w->RunFadeOut()==WidgetS_Closing)ret=WidgetS_Closing;
        }
    return ret;
}

void BaseWidget::SetState(u8 newState){
  this->state = newState;
  for (BaseWidget *w = this->child; w != NULL; w = w->siblingR) {w->SetState(newState);}
}

u8 BaseWidget::Link(BaseWidget *other){  
  if (this->child == NULL) {
    this->child = other;
    this->link4 = other;
    other->parent = this;
    this->child->siblingL = NULL;
    this->child->siblingR = NULL;
  }
  else {
    this->link4->siblingR = other;
    other->siblingR = NULL;
    other->siblingL = this->link4;
    this->link4 = other;
    other->parent = this;
  }
  return true;
}

u8 BaseWidget::Unlink(BaseWidget *other){
  BaseWidget *w = this->child;
  while(1) {
    if (w == NULL) return false;
    if (w == other) break;
    w = w->siblingR;
  }
  if (this->child == w) this->child = w->siblingR;
  if (this->link4 == w) this->link4 = w->siblingL;
  if (w->siblingL) w->siblingL->siblingR = w->siblingR;
  if (w->siblingR) w->siblingR->siblingL = w->siblingL;
  w->parent = NULL;
  w->siblingL = NULL;
  w->siblingR = NULL;
  return true;
}

#define buttonMacro(name)\
        if(##name##ButtonFunc) return (##name##ButtonFunc)(parent,this);\
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
BaseWidget* BaseWidget::CUpFunc(){buttonMacro(CUp)}
BaseWidget* BaseWidget::CDownFunc(){buttonMacro(CDown)}
BaseWidget* BaseWidget::CLeftFunc(){buttonMacro(CLeft)}
BaseWidget* BaseWidget::CRightFunc(){buttonMacro(CRight)}