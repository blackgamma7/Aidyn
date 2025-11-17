#include "widgets/WidgetScrollMenu.h"

#define FILENAME "./menus/widgetfastscrollmenu.cpp"

WidgetFastScrollMenu::WidgetFastScrollMenu(u16 length):BaseWidget(){
  WSMSub* sub = new WSMSub;
  sub->unk12 = 0;
  sub->blendSign = 1;
  sub->highlight = 0;
  sub->maxCount = length;
  sub->currentCount = 0;
  sub->unk22 = 0;
  if(length) {
    BaseWidget** list=(BaseWidget**)HALLOC(length*sizeof(BaseWidget*),42);
    sub->items=list;
    for (; length != 0; length--) {
      *list = NULL;
      list++;
    }
  }
  else sub->items=NULL;
  this->substruct=sub;
}


WidgetFastScrollMenu::~WidgetFastScrollMenu(){
  WSMSub *sub = (WSMSub *)this->substruct;
  if (sub) {
    if (sub->currentCount != 0) {
        for(u32 i=0;i<sub->currentCount;i++){
          DestructWidget(sub->items[i])
        }
    }
    FREEPTR(sub->items,72);
    delete(sub);
    this->substruct = NULL;
  }
  BaseWidget::~BaseWidget();
}

Gfx * WidgetFastScrollMenu::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  WSMSub *sub = (WSMSub *)this->substruct;
  if (sub->currentCount != 0) {
    for(u32 i=0;i<sub->currentCount;i++){
      if ((this->col).A != 0xff) {
        sub->items[i]->col.A=this->col.A;
        sub->items[i]->Tick();
      }
      g = sub->items[i]->Render(g,x0,y0,x1,y1);
    }
  }
  RENDERCHILDREN();
}


u8 WidgetFastScrollMenu::Tick(){
  WSMSub *sub = (WSMSub *)this->substruct;
  if ((sub->items) && (sub->currentCount)) {
    if (sub->highlight >= sub->currentCount) {
      sub->highlight = sub->currentCount - 1;
    }
    BaseWidget*highlighted = sub->items[sub->highlight];
    if (highlighted->posX != this->posX)
      AdjustItemsX();
    if ((highlighted->posY < this->boundY0) || (this->boundY1 <= highlighted->posY))
      m8002ff30();
    sub->blendB+=sub->blendSign;
    if ((sub->blendB == '\0') || ((sub->blendA - 1) <= sub->blendB)) {
      sub->blendSign = -sub->blendSign;
    }
    sub->col.R = sub->reds[0] + (sub->reds[1]-sub->reds[0])/sub->blendA;
    sub->col.G = sub->greens[0] + (sub->greens[1]-sub->greens[0])/sub->blendA;
    sub->col.B = sub->blues[0] + (sub->blues[1]-sub->blues[0])/sub->blendA;
    sub->col.A = ((s16)(sub->alphas[0]+(sub->alphas[1]-sub->alphas[0])/sub->blendA*sub->blendB))*(this->col.A/255.0f);
    highlighted->SetColor((sub->col).R,(sub->col).G,(sub->col).B,(sub->col).A);
    highlighted->Tick();
  }
  return BaseWidget::TickChildren();
}

void WidgetFastScrollMenu::AdjustItemsX(){
  WSMSub *sub = (WSMSub *)this->substruct;
  if ((sub->items) && (sub->currentCount)) {
    BaseWidget* w = *sub->items;
    u16 h = w->GetHeight();
    u16 i;
    for (i = sub->highlight; i != 0; i--) {
      if ((sub->items[i]->posY + h) < this->boundY0)
      {
        if (i != 0) {
          goto LAB_8002fe90;
        }
        break;
      }
      w = sub->items[i];
      w->posX = this->posX;
      w->boundX0 = this->boundX0;
      w->Tick();
    }
    w = sub->items[i];
    w->posX = this->posX;
    w->boundX0 = this->boundX0;
    w->Tick();
LAB_8002fe90:
    i = sub->highlight + 1;
    if (i < sub->currentCount) {
      while (sub->items[i]->posY <= (short)this->boundY1) {
        w = sub->items[i];
        w->posX = this->posX;
        w->boundX0 = this->boundX0;
        w->Tick();
        i++;
        if (sub->currentCount <= i) {
          return;
        }
      }
    }
  }
}

void WidgetFastScrollMenu::m8002ff30(){
  WSMSub *sub = (WSMSub *)this->substruct;
  if ((sub->items != NULL) && (sub->currentCount != 0)) {
    BaseWidget*w = sub->items[sub->highlight];
    u16 h = w->GetHeight();
    s32 iVar4 = this->posY + sub->unk12 + h * sub->highlight;
    if (this->boundY1 < (int)(iVar4 + h))
      sub->unk12 -= ((short)(iVar4 + h) - this->boundY1);
    if (iVar4 < this->boundY0)
      sub->unk12 += (this->boundY0 - (short)iVar4);
    if (sub->currentCount) {
      for(u32 i=0,iVar4=0;i<sub->currentCount;i++) {
        w = sub->items[i];
        w->boundX0 = this->boundX0;
        w->boundX1 = this->boundX1;
        w->boundY0 = this->boundY0;
        w->boundY1 = this->boundY1;
        w->SetCoords(this->posX,this->posY + sub->unk12 + (short)iVar4);
        if (i == sub->highlight) w->SetColor(sub->col.R,sub->col.G,sub->col.B,sub->col.A);
        else w->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
        iVar4+=h;
        w->Tick();
      }
    }
  }
}

u8 WidgetFastScrollMenu::Append(BaseWidget *w){
  WSMSub *sub = (WSMSub *)this->substruct;
  sub->items[sub->currentCount++] = w;
  return true;
}

BaseWidget* WidgetFastScrollMenu::UpFunc(){
  WSMSub *sub = (WSMSub *)this->substruct;
  if (sub->currentCount != 0) {
    u16 uVar1 = sub->highlight;
    if (sub->items[sub->highlight]) {
      if (uVar1 == 0) {
        uVar1 = sub->currentCount;
      }
      sub->highlight = uVar1 - 1;
    }
    m8002ff30();
  }
  return NULL;
}

BaseWidget* WidgetFastScrollMenu::DownFunc(){
  WSMSub *sub = (WSMSub *)this->substruct;
  if (sub->currentCount != 0) {
    u16 uVar1 = sub->highlight + 1;
    if ((sub->items[sub->highlight] != NULL) &&
       (sub->highlight = uVar1, sub->currentCount <= uVar1)) {
      sub->highlight = 0;
    }
    m8002ff30();
  }
  return NULL;
}

BaseWidget * WidgetFastScrollMenu::AFunc(){
  WSMSub *sub = (WSMSub *)this->substruct;
  if (sub->currentCount) return sub->items[sub->highlight];
  return NULL;
}

u16 WidgetFastScrollMenu::GetHeight(){
  WSMSub *sub = (WSMSub *)this->substruct;
  if (sub->items){
    if (sub->currentCount == 0) return 0;
    return sub->currentCount * sub->items[0]->GetHeight();
  }
  return 0;
}

void WidgetFastScrollMenu::SetSubstructColors(u8 r,u8 g,u8 b,u8 a,u8 r1,u8 g1,u8 b1,u8 a1,u8 param_10){
  WSMSub *sub = (WSMSub *)this->substruct;
  sub->blendSign = 1;
  (sub->col).R = r;
  sub->reds[0] = r;
  (sub->col).G = g;
  sub->greens[0] = g;
  (sub->col).B = b;
  sub->blues[0] = b;
  (sub->col).A = a;
  sub->alphas[0] = a;
  sub->reds[1] = r1;
  sub->greens[1] = g1;
  sub->blues[1] = b1;
  sub->alphas[1] = a1;
  sub->blendA = param_10;
  sub->blendB = 0;
}

u32 WidgetFastScrollMenu::GetNumber(){return WidgetN_ScrollMenu;}




