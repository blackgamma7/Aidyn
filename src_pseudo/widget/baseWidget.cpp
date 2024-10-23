#include "widgets\BaseWidget.h"

BaseWidget::BaseWidget(){
  col.R = 0xff;
  col.G = 0xff;
  col.B = 0xff;
  col.A = 0xff;
  boundX1 = 320;
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
  boundY1 = 240;
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

void BaseWidget::SetCoords(short x,short y){
  this->x = x;
  this->y = y;
}
void BaseWidget::SetWidth(ushort w){width=w;}
u16 BaseWidget::GetWidth(){return width;}
void BaseWidget::SetHeight(ushort h){height=h;}
u16 BaseWidget::GetHeight(){return height;}
void BaseWidget::SetColor(u8 r, u8 g, u8 b, u8 a){
  col.R = r;
  col.G = g;
  col.B = b;
  col.A = a;
}
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
  func *pfVar5;
  
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
  if ((BVar7 & START_BUTTON) == 0) {
    if ((BVar7 & A_BUTTON) == 0) {
      if ((BVar7 & B_BUTTON) == 0) {
        if ((BVar7 & D_UP) == 0) {
          if ((BVar7 & D_DOWN) == 0) {
            if ((BVar7 & D_LEFT) == 0) {
              if ((BVar7 & D_RIGHT) == 0) {
                if ((BVar7 & ANA_UP) == 0) {
                  if ((BVar7 & ANA_DOWN) == 0) {
                    if ((BVar7 & ANA_LEFT) == 0) {
                      if ((BVar7 & ANA_RIGHT) == 0) {
                        if ((BVar7 & Z_BUTTON) == 0) {
                          if ((BVar7 & L_BUTTON) == 0) {
                            if ((BVar7 & R_BUTTON) == 0) {
                              if ((BVar7 & C_UP) == 0) {
                                if ((BVar7 & C_DOWN) == 0) {
                                  if ((BVar7 & C_LEFT) == 0) {
                                    if ((BVar7 & C_RIGHT) == 0) {
                                      return NULL;
                                    }
                                    iVar6 = (int)*(short *)&(param_1->vTable->CRightFunc).arg;
                                    pfVar5 = (param_1->vTable->CRightFunc).func;
                                  }
                                  else {
                                    iVar6 = (int)*(short *)&(param_1->vTable->CLeftFunc).arg;
                                    pfVar5 = (param_1->vTable->CLeftFunc).func;
                                  }
                                }
                                else {
                                  iVar6 = (int)*(short *)&(param_1->vTable->CDownFunc).arg;
                                  pfVar5 = (param_1->vTable->CDownFunc).func;
                                }
                              }
                              else {
                                iVar6 = (int)*(short *)&(param_1->vTable->CUPFunc).arg;
                                pfVar5 = (param_1->vTable->CUPFunc).func;
                              }
                            }
                            else {
                              iVar6 = (int)*(short *)&(param_1->vTable->RFunc).arg;
                              pfVar5 = (param_1->vTable->RFunc).func;
                            }
                          }
                          else {
                            iVar6 = (int)*(short *)&(param_1->vTable->LFunc).arg;
                            pfVar5 = (param_1->vTable->LFunc).func;
                          }
                        }
                        else {
                          iVar6 = (int)*(short *)&(param_1->vTable->ZFunc).arg;
                          pfVar5 = (param_1->vTable->ZFunc).func;
                        }
                      }
                      else {
                        iVar6 = (int)*(short *)&(param_1->vTable->RightFunc).arg;
                        pfVar5 = (param_1->vTable->RightFunc).func;
                      }
                    }
                    else {
                      iVar6 = (int)*(short *)&(param_1->vTable->LeftFunc).arg;
                      pfVar5 = (param_1->vTable->LeftFunc).func;
                    }
                  }
                  else {
                    iVar6 = (int)*(short *)&(param_1->vTable->DownFunc).arg;
                    pfVar5 = (param_1->vTable->DownFunc).func;
                  }
                }
                else {
                  iVar6 = (int)*(short *)&(param_1->vTable->UpFunc).arg;
                  pfVar5 = (param_1->vTable->UpFunc).func;
                }
              }
              else {
                iVar6 = (int)*(short *)&(param_1->vTable->RightFunc).arg;
                pfVar5 = (param_1->vTable->RightFunc).func;
              }
            }
            else {
              iVar6 = (int)*(short *)&(param_1->vTable->LeftFunc).arg;
              pfVar5 = (param_1->vTable->LeftFunc).func;
            }
          }
          else {
            iVar6 = (int)*(short *)&(param_1->vTable->DownFunc).arg;
            pfVar5 = (param_1->vTable->DownFunc).func;
          }
        }
        else {
          iVar6 = (int)*(short *)&(param_1->vTable->UpFunc).arg;
          pfVar5 = (param_1->vTable->UpFunc).func;
        }
      }
      else {
        iVar6 = (int)*(short *)&(param_1->vTable->Bfunc).arg;
        pfVar5 = (param_1->vTable->Bfunc).func;
      }
    }
    else {
      iVar6 = (int)*(short *)&(param_1->vTable->AFunc).arg;
      pfVar5 = (param_1->vTable->AFunc).func;
    }
  }
  else {
    iVar6 = (int)*(short *)&(param_1->vTable->StartFunc).arg;
    pfVar5 = (param_1->vTable->StartFunc).func;
  }
  pBVar4 = (BaseWidget *)(*pfVar5)((int)&param_1->fadeIn + iVar6);
  return pBVar4;
}


Gfx * BaseWidget::RenderChildren(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  for (BaseWidget *pBVar1 = link3; pBVar1 != NULL; pBVar1 = pBVar1->link2) {g = pBVar1->Render(g,x0,y0,x1,y1);}
  return g;
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
        if(!##name##ButtonFunc) return (BaseWidget*)NULL;\
        return (##name##ButtonFunc)(link0,this);

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