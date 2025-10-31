#include "widgets/WidgetScrollArrows.h"
#include "widgets/WidgetArrayMenu.h"
#include "widgets/WidgetScrollMenu.h"
#include "widgets/WidgetScrollList.h"

WidgetScrollArrows::WidgetScrollArrows(BaseWidget *scroll,BaseWidget *arrowA,BaseWidget *arrowB,u16 h)
:BaseWidget(){
  WSA_Sub *sub = new WSA_Sub;
  this->scrollMenu = scroll;
  this->x = this->scrollMenu->x - arrowA->GetHeight();
  this->y = this->scrollMenu->y;
  this->width = arrowA->GetWidth();
  this->height = h;
  if (h == -1)
    this->height = this->scrollMenu->boundY1 - this->scrollMenu->boundY0;
  sub->arrowA = arrowA;
  sub->arrowB = arrowB;
  sub->bottom = 20;
  if (h) {
    sub->arrowA->SetCoords(this->x,this->y);
    sub->arrowB->SetCoords(this->x,(this->y + this->height) - sub->arrowB->GetHeight());
  }
  (sub->arrowA->col).A = 0;
  (sub->arrowB->col).A = 0;
  this->substruct = sub;
  this->state = 1;
}

WidgetScrollArrows::~WidgetScrollArrows() {
  WSA_Sub *sub = (WSA_Sub *)this->substruct;
  if (sub) {
    if (sub->arrowA) {
      sub->arrowA->~BaseWidget();
      sub->arrowA = NULL;
    }
    if (sub->arrowB) {
      sub->arrowB->~BaseWidget();
      sub->arrowB = NULL;
    }
    delete(sub);
    this->substruct = NULL;
  }
  BaseWidget::~BaseWidget();
}


Gfx * WidgetScrollArrows::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1) {
  WSA_Sub *sub = (WSA_Sub *)this->substruct;
  g = sub->arrowA->Render(g,x0,y0,x1,y1);
  g = sub->arrowB->Render(g,x0,y0,x1,y1);
  RENDERCHILDREN();
}


u8 WidgetScrollArrows::Tick() {
  WSA_Sub *sub = (WSA_Sub *)this->substruct;
  if (this->height) {
    sub->arrowA->SetCoords(this->x,this->y);
    sub->arrowB->SetCoords(this->x,(this->y + this->height) - (short)sub->arrowB->GetHeight());
  }
  BaseWidget **items = NULL;
  u32 index = 0;
  switch(this->scrollMenu->GetNumber()){
    case WidgetN_ScrollMenu:{
      WSMSub* lSub = (WSMSub*)this->scrollMenu->substruct;
      items = lSub->items;
      index = lSub->highlight;
      break;
    }
    case WidgetN_ScrollList:{
      WSLSub* lSub = (WSLSub*)this->scrollMenu->substruct;
      items = lSub->items;
      index = lSub->itemHighlight;
      break;
    }
    case WidgetN_ArrayMenu:{
      WAMSub* lSub = (WAMSub *)this->scrollMenu->substruct;
      items = lSub->entries;
      index = lSub->entryPos;
      break;
    }
  }
  if (items){
    if (index != 0) {
      BaseWidget *pBVar6 = items[index - 1];
      if ((*items)->y < this->scrollMenu->boundY0) {
        BaseWidget *pBVar5 = sub->arrowA;
        if ((pBVar5->col).A < (int)(0xff - (uint)sub->bottom)) {
          (pBVar5->col).A += sub->bottom;
        }
        else (pBVar5->col).A = 0xff;
      }
      else {
        BaseWidget *pBVar5 = sub->arrowA;
        if (sub->bottom < (pBVar5->col).A)
          (pBVar5->col).A -= sub->bottom;
        else (pBVar5->col).A = 0;
      }
      if (this->scrollMenu->boundY1 < (pBVar6->y + pBVar6->GetHeight())) {
        pBVar6 = sub->arrowB;
        if ((pBVar6->col).A < (0xff - (uint)sub->bottom))
          (pBVar6->col).A += sub->bottom;
        else (pBVar6->col).A = 0xff;
      }
      else {
        pBVar6 = sub->arrowB;
        if (sub->bottom < (pBVar6->col).A)
          (pBVar6->col).A-= sub->bottom;
        else (pBVar6->col).A = 0;
      }
    }
  }
  sub->arrowA->SetColor(this->col.R,this->col.G,this->col.B,
             ((float)((uint)(sub->arrowA->col).A * (this->col.A / 0xff)) * fadeFloatMirror));
  sub->arrowB->SetColor(this->col.R,this->col.G,this->col.B,
             ((float)((uint)(sub->arrowB->col).A * (this->col.A / 0xff)) * fadeFloatMirror));
  return TickChildren();
}

u32 WidgetScrollArrows::GetNumber(){return WidgetN_ScrollArrows;}