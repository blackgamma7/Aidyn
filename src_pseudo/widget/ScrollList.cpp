#include "widgets/Utilities.h"

#define FILENAME "./src/widgetscrolllist.cpp"

BaseWidget * WSL_DownFunc(BaseWidget *param_1,BaseWidget *param_2) {
  s16 h;
  
  WSLSub *sub = (WSLSub *)param_2->substruct;
  if ((sub->unk4 == sub->unk8) &&(sub->itemHighlight < (sub->itemCount - 1))) {
    u8 hl = sub->itemHighlight;
    while( true ) {
      sub->itemHighlight = hl + 1;
      h = (sub->items[sub->itemHighlight]->y + sub->items[(hl + 1)]->GetHeight());
      if (param_2->boundY1 < h ) break;
      if ((sub->itemCount - 1) <= sub->itemHighlight) {
        return NULL;
      }
      hl = sub->itemHighlight;
    }
    sub->unk8-= (h - param_2->boundY1);
    h = ((param_2->boundY1 - param_2->boundY0) - param_2->GetHeight());
    if (sub->unk8 < h) sub->unk8 = h;
  }
  return NULL;
}


BaseWidget * WSL_UpFunc(BaseWidget * param_1,BaseWidget *param_2) {
  s16 iVar1;
  u8 bVar3 ;
  WSLSub *sub = (WSLSub *)param_2->substruct;
  if (sub->unk4 != sub->unk8) return 0;
  if (sub->itemHighlight != 0) {
    u8 uVar2 = sub->itemHighlight;
    while( true ) {
      bVar3 = uVar2 - 1;
      sub->itemHighlight = bVar3;
      if (sub->items[bVar3]->y < param_2->boundY0) break;
      if (bVar3 == 0) return 0;
      uVar2 = sub->itemHighlight;
    }
    iVar1 = sub->unk8 +(param_2->boundY0 - sub->items[bVar3]->y);
    sub->unk8 = (u16)iVar1;
    if (iVar1 < 1) return 0;
    sub->unk8 = 0;
  }
  return 0;
}

BaseWidget * WSL_LeftFunc(BaseWidget * param_1,BaseWidget *param_2){return NULL;}
BaseWidget * WSL_RightFunc(BaseWidget * param_1,BaseWidget *param_2){return NULL;}
BaseWidget * WSL_AFunc(BaseWidget * param_1,BaseWidget *param_2){return param_2;}

WidgetScrollList::WidgetScrollList(u8 len):BaseWidget() {
  uint uVar2;
  
  uVar2 = (uint)len;
  WSLSub *sub = new WSLSub;
  this->x = 0;
  this->y = 0;
  this->width = 0;
  this->height = 0;
  sub->unk0 = 5;
  sub->unk1 = 0x20;
  this->UpButtonFunc = WSL_UpFunc;
  this->DownButtonFunc = WSL_DownFunc;
  this->AButtonFunc = WSL_AFunc;
  sub->unk4 = 0;
  sub->unk8 = 0;
  this->LeftButtonFunc = WSL_LeftFunc;
  this->RightButtonFunc = WSL_RightFunc;
  this->fadeIn = NULL;
  this->fadeOut = NULL;
  sub->itemHighlight = 0;
  sub->itemMax = len;
  sub->itemCount = 0;
  sub->unk13 = 0;
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
  this->SetState(1);
}


WidgetScrollList::~WidgetScrollList() {
  WSLSub *sub;
  
  sub = (WSLSub *)this->substruct;
  if (sub) {
    for(s32 i=0;i<sub->itemCount;i++){
        if(sub->items[i]){
            sub->items[i]->~BaseWidget();
            sub->items[i]=NULL;
        }
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
  u16 uVar1;
  bool bVar5;
  s16 lVar6;
  short sVar9;
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
      entry->SetCoords(this->x,this->y + (short)iVar8 + sub->unk4);
      (entry->col).A = (this->col).A;
      iVar8+= entry->GetHeight() + sub->unk13;
      sVar9 = (short)iVar8;
    }
  }
  this->SetHeight(sVar9 - (ushort)sub->unk13);
  lVar6 = sub->unk6;
  if (lVar6 < sub->unk2) {
    iVar8 = (uint)sub->unk2 - (uint)sub->unk0;
    sub->unk2 = (u16)iVar8;
    bVar5 = iVar8 < lVar6;
LAB_800bb374:
    if (bVar5) {
      sub->unk2 = sub->unk6;
    }
    uVar1 = sub->unk4;
  }
  else {
    if ((short)sub->unk2 < lVar6) {
      iVar8 = (uint)sub->unk2 + (uint)sub->unk0;
      sub->unk2 = (u16)iVar8;
      bVar5 = lVar6 < iVar8;
      goto LAB_800bb374;
    }
    uVar1 = sub->unk4;
  }
  lVar6 = sub->unk8;
  if (lVar6 < uVar1) {
    iVar8 = (uint)sub->unk4 - (uint)sub->unk0;
    sub->unk4 = (u16)iVar8;
    bVar5 = iVar8 < lVar6;
  }
  else {
    if (lVar6 <= (short)uVar1) goto LAB_800bb3dc;
    iVar8 = (uint)sub->unk4 + (uint)sub->unk0;
    sub->unk4 = (u16)iVar8;
    bVar5 = lVar6 < iVar8;
  }
  if (bVar5) sub->unk4 = sub->unk8;
LAB_800bb3dc:
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
  uint uVar1;
  BaseWidget **ppBVar2;
  int iVar3;
  WSLSub *sub = (WSLSub *)this->substruct;
  uVar1 = (uint)sub->itemCount;
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