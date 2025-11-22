#include "widgets/Utilities.h"

#define FILENAME "./src/widgetscrolllist.cpp"

BaseWidget * WSL_DownFunc(BaseWidget *w0,BaseWidget *w1) {
  s16 h;
  
  WSLSub *sub = (WSLSub *)w1->substruct;
  if ((sub->yCurr == sub->yTarget) &&(sub->itemHighlight < (sub->itemCount - 1))) {
    while( true ) {
      sub->itemHighlight++;
      h = (sub->items[sub->itemHighlight]->posY + sub->items[sub->itemHighlight]->GetHeight());
      if (w1->boundY1 < h ) break;
      if ((sub->itemCount - 1) <= sub->itemHighlight) return NULL;
    }
    sub->yTarget-= (h - w1->boundY1);
    h = ((w1->boundY1 - w1->boundY0) - w1->GetHeight());
    if (sub->yTarget < h) sub->yTarget = h;
  }
  return NULL;
}


BaseWidget * WSL_UpFunc(BaseWidget * w0,BaseWidget *w1) {
  s16 h;
  WSLSub *sub = (WSLSub *)w1->substruct;
  if (sub->yCurr != sub->yTarget) return 0;
  if (sub->itemHighlight != 0) {
    while( true ) {
      sub->itemHighlight--;
      if (sub->items[sub->itemHighlight]->posY < w1->boundY0) break;
      if (sub->itemHighlight == 0) return 0;
    }
    h = sub->yTarget +(w1->boundY0 - sub->items[sub->itemHighlight]->posY);
    sub->yTarget = (u16)h;
    if (h < 1) return 0;
    sub->yTarget = 0;
  }
  return 0;
}

BaseWidget * WSL_LeftFunc(BaseWidget * w0,BaseWidget *w1){return NULL;}
BaseWidget * WSL_RightFunc(BaseWidget * w0,BaseWidget *w1){return NULL;}
BaseWidget * WSL_AFunc(BaseWidget * w0,BaseWidget *w1){return w1;}

WidgetScrollList::WidgetScrollList(u8 len):BaseWidget() {
  u32 uVar2;
  
  uVar2 = (u32)len;
  WSLSub *sub = new WSLSub;
  this->posX = 0;
  this->posY = 0;
  this->width = 0;
  this->height = 0;
  sub->scrollSpeed = 5;
  sub->unk1 = 0x20;
  this->UpButtonFunc = WSL_UpFunc;
  this->DownButtonFunc = WSL_DownFunc;
  this->AButtonFunc = WSL_AFunc;
  sub->yCurr = 0;
  sub->yTarget = 0;
  this->LeftButtonFunc = WSL_LeftFunc;
  this->RightButtonFunc = WSL_RightFunc;
  this->fadeIn = NULL;
  this->fadeOut = NULL;
  sub->itemHighlight = 0;
  sub->itemMax = len;
  sub->itemCount = 0;
  sub->vSpace = 0;
  if (uVar2 == 0) sub->items = NULL;
  else {
    BaseWidget **wArr = (BaseWidget **)HALLOC(len << 2,134);
    sub->items = wArr;
    for (; uVar2 != 0; uVar2--) {
      *wArr = NULL;
      wArr++;
    }
  }
  this->substruct = sub;
  this->SetState(WidgetS_Init);
}


WidgetScrollList::~WidgetScrollList() {
  WSLSub *sub;
  
  sub = (WSLSub *)this->substruct;
  if (sub) {
    for(s32 i=0;i<sub->itemCount;i++){
      DestructWidget(sub->items[i])
    }
    FREEPTR(sub->items,169);
    delete sub;
    this->substruct = NULL;
  }
  BaseWidget::~BaseWidget();
}


Gfx * WidgetScrollList::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1) {
  WSLSub * sub = (WSLSub *)this->substruct;
    for(s32 i=0;i<sub->itemCount;i++){
        if(sub->items[i])
            g= sub->items[i]->Render(g,x0,y0,x1,y1);
    }
  RENDERCHILDREN();
}


u8 WidgetScrollList::Tick() {
  s16 sVar9;
  s16 iVar8;
  WSLSub *sub = (WSLSub *)this->substruct;
  iVar8 = 0;
  sVar9 = 0;
  if (sub->items) {
    for(s32 i=0;i<sub->itemCount;i++){
      BaseWidget *entry = sub->items[i];
      entry->boundX0 = this->boundX0;
      entry->boundX1 = this->boundX1;
      entry->boundY0 = this->boundY0;
      entry->boundY1 = this->boundY1;
      if (entry->GetNumber() == WidgetN_ClipText)
        Utilities::SetTextWidgetBoundsX(entry,this->boundX0,this->boundX1);
      else if (entry->GetNumber() == WidgetN_ShadText)
        Utilities::SetTextWidgetBoundsX(entry,this->boundX0,this->boundX1);
      entry->SetCoords(this->posX,this->posY + (s16)iVar8 + sub->yCurr);
      (entry->col).A = (this->col).A;
      iVar8+= entry->GetHeight() + sub->vSpace;
      sVar9 = (s16)iVar8;
    }
  }
  this->SetHeight(sVar9 - (u16)sub->vSpace);
  if (sub->XTarget < sub->XCurr) {
    sub->XCurr-=sub->scrollSpeed;
    if (sub->XCurr < sub->XTarget) sub->XCurr = sub->XTarget;
  }
  else {
    if (sub->XCurr < sub->XTarget) {
      sub->XCurr+=sub->scrollSpeed;
      if(sub->XTarget < sub->XCurr)sub->XCurr = sub->XTarget;
    }
  }
  if (sub->yTarget < sub->yCurr) {
    sub->yCurr-=sub->scrollSpeed;
    if (sub->yCurr < sub->yTarget) sub->yCurr = sub->yTarget;
  }
  else {
    if (sub->yTarget > sub->yCurr){
    sub->yCurr+=sub->scrollSpeed;
    if (sub->yTarget < sub->yCurr) sub->yCurr = sub->yTarget;
    }
  }
  return TickChildren();
}

u8 WidgetScrollList::AddEntry(BaseWidget *entry) {
  WSLSub *sub = (WSLSub *)this->substruct;
  if (sub->itemCount < sub->itemMax) {
    entry->boundX0 = this->boundX0;
    entry->boundX1 = this->boundX1;
    entry->boundY0 = this->boundY0;
    entry->boundY1 = this->boundY1;
    (entry->col).A = 0;
    sub->items[sub->itemCount++] = entry;
    return true;
  }
  return false;
}

u8 WidgetScrollList::RemoveEntry(BaseWidget *entry) {
  u32 uVar1;
  BaseWidget **ppBVar2;
  int iVar3;
  WSLSub *sub = (WSLSub *)this->substruct;
  uVar1 = (u32)sub->itemCount;
  iVar3 = 0;
  if (uVar1 != 0) {
    ppBVar2 = sub->items;
    if (*ppBVar2 == entry) {
LAB_800bb4b4:
      if (iVar3 < (int)uVar1) {
        if (iVar3 < (int)(uVar1 - 1)) {
          ppBVar2 = sub->items + iVar3;
          do {
            iVar3 = iVar3 + 1;
            *ppBVar2 = ppBVar2[1];
            ppBVar2 = ppBVar2 + 1;
          } while (iVar3 < (int)(sub->itemCount - 1));
        }
        sub->items[iVar3] = NULL;
        sub->itemCount--;
        return true;
      }
    }
    else {
      for (iVar3 = 1; ppBVar2++, iVar3 < (int)uVar1; iVar3++) {
        if (*ppBVar2 == entry) goto LAB_800bb4b4;
      }
    }
  }
  return false;
}

u32 WidgetScrollList::GetNumber(){return WidgetN_ScrollList;}