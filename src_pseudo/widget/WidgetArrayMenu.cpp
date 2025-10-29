
#include "widgets/Utilities.h"
#define FILENAME "./src/widgetarraymenu.cpp"

BaseWidget * WAM_UpFunc(BaseWidget *param_1,BaseWidget *param_2){
  u16 uVar1;
  int iVar2;
  u16 uVar3;
  WAMSub *piVar2 = (WAMSub *)param_2->substruct;
  if (!piVar2->entryCount) return NULL;
  uVar3 = piVar2->entryPos;
  uVar1 = piVar2->entryY;
  iVar2 = (uint)uVar3 - (uint)uVar1;
  if (iVar2 < 0) {
    if ((uint)uVar3 + (uint)uVar1 < (uint)piVar2->entryCount) {
      do {
        uVar3 += uVar1;
      } while ((uint)uVar3 + (uint)uVar1 < (uint)piVar2->entryCount);
      piVar2->entryPos = uVar3;
    }
  }
  else {
    piVar2->entryPos = (u16)iVar2;
  }
  return piVar2->entries[piVar2->entryPos];
}

BaseWidget * WAM_DownFunc(BaseWidget* param_1,BaseWidget *param_2){
  u16 uVar1;
  uint uVar2;
  u16 uVar3;
  WAMSub *piVar2 = (WAMSub *)param_2->substruct;
  if (!piVar2->entryCount) return NULL;
    uVar3 = piVar2->entryPos;
    uVar1 = piVar2->entryY;
    uVar2 = (uint)uVar3 + (uint)uVar1;
    if (uVar2 < piVar2->entryCount) {
      piVar2->entryPos = (u16)uVar2;
    }
    else if (-1 < (int)((uint)uVar3 - (uint)uVar1)) {
      for (uVar3 -= uVar1; -1 < (int)((uint)uVar3 - (uint)uVar1); uVar3 -= uVar1) {
      }
      piVar2->entryPos = uVar3;
    }
    return piVar2->entries[piVar2->entryPos];
}

BaseWidget * WAM_LeftFunc(BaseWidget* param_1,BaseWidget *param_2){
  u16 uVar1;
  u16 uVar2;
  u16 uVar3;
  WAMSub *piVar3 = (WAMSub *)param_2->substruct;
  if (!piVar3->entryCount) return NULL;
    uVar1 = piVar3->entryPos;
    uVar2 = piVar3->entryY;

    uVar3 = uVar1 - 1;
    if ((uint)uVar1 % (uint)uVar2 == 0) {
      if ((int)((uint)uVar1 + (uint)uVar2 + -1) < (int)(uint)piVar3->entryCount) {
        uVar3 = uVar2 + (uVar1 - 1);
      }
      else {
        uVar3 = piVar3->entryCount - 1;
      }
    }
    piVar3->entryPos = uVar3;
    return piVar3->entries[piVar3->entryPos];
}

BaseWidget * WAM_RightFunc(BaseWidget* param_1,BaseWidget *param_2){
  u16 uVar1;
  uint uVar2;
  u16 uVar3;
  WAMSub *piVar2 = (WAMSub *)param_2->substruct;
  if (!piVar2->entryCount) return NULL;
    uVar1 = piVar2->entryPos;
    uVar2 = uVar1 + 1;
    if ((int)(uint)uVar1 < (int)(piVar2->entryCount - 1)) {
      uVar1 = piVar2->entryY;
      uVar3 = (u16)uVar2;
      if (uVar2 % (uint)uVar1 == 0) {
        piVar2->entryPos = uVar3 - uVar1;
      }
      else {
        piVar2->entryPos = uVar3;
      }
    }
    else {
      piVar2->entryPos = uVar1 - uVar1 % piVar2->entryY;
    }
    return piVar2->entries[piVar2->entryPos];
}

BaseWidget * WAM_AFunc(BaseWidget* param_1,BaseWidget *param_2){
  WAMSub *p = (WAMSub *)param_2->substruct;
  return p->entries[p->entryPos];
}

WidgetArrayMenu::WidgetArrayMenu(u16 len):BaseWidget(){
    u32 uVar2 =len;
    WAMSub* sub = new WAMSub;
    sub->entryY = 2;
    sub->entryX = 5;
    this->UpButtonFunc = WAM_UpFunc;
    this->DownButtonFunc = WAM_DownFunc;
    this->LeftButtonFunc = WAM_LeftFunc;
    sub->entryCount = 0;
    sub->entryCap = len;
    sub->entryPos = 0;
    sub->unk10 = 0;
    this->x = 0;
    this->y = 0;
    this->width = 0;
    this->height = 0;
    this->RightButtonFunc = WAM_RightFunc;
    this->AButtonFunc = WAM_AFunc;
    if (uVar2 == 0) sub->entries = NULL;
    else {
      BaseWidget** ppBVar1 = (BaseWidget **)HALLOC(len*sizeof(BaseWidget*),179);
      for (sub->entries = ppBVar1; uVar2 != 0; uVar2--) {
        *ppBVar1 = NULL;
        ppBVar1++;
      }
    }
    this->substruct = sub;
    this->state = 1;
}

WidgetArrayMenu::~WidgetArrayMenu(){
  WAMSub *sub = (WAMSub *)substruct;
  if (sub) {
    if (sub->entryCap) {
      for(u32 i=0;i<sub->entryCap;i++) {
        BaseWidget* entry = sub->entries[i];
        if (entry) {
          entry->~BaseWidget();
          sub->entries[i] = NULL;
        }
      }
    }
    HFREE(sub->entries,212);
    delete(sub);
    substruct = NULL;
  }
  BaseWidget::~BaseWidget();
}

Gfx * WidgetArrayMenu::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
    WAMSub *sub = (WAMSub *)substruct;
    if (sub->entryCap) {
        for(u32 i=0;i<sub->entryCap;i++) {
          BaseWidget* entry = sub->entries[i];
          if (entry) {
            g= entry->Render(g,x0,y0,x1,y1);
          }
        }
      }
      RENDERCHILDREN();
}
u8 WidgetArrayMenu::Tick() {
u16 uVar1;
u16 uVar2;
u16 uVar3;
u16 uVar4;
BaseWidget *pBVar5;
ulong uVar7;
ulong uVar8;
bool bVar9;
BaseWidget **ppBVar10;
u16 x;
int iVar11;
WAMSub *sub = (WAMSub *)this->substruct;
uVar1 = this->boundX1;
uVar2 = this->boundX0;
uVar3 = sub->entryY;
if (sub->entries) {
  pBVar5 = *sub->entries;
  iVar11 = 0;
  uVar7 = pBVar5->GetHeight();
  uVar4 = sub->entryX;
  if (sub->entryCount) {
    for(iVar11 = 0;iVar11<sub->entryCount;iVar11++) {
      pBVar5 = sub->entries[iVar11];
      pBVar5->boundX0 = this->boundX0;
      pBVar5->boundX1 = this->boundX1;
      pBVar5->boundY0 = this->boundY0;
      pBVar5->boundY1 = this->boundY1;
      pBVar5->SetColor(col.R,col.G,col.B,col.A);
      if ((pBVar5->GetNumber() == 1)||(pBVar5->GetNumber() == 2))
        Utilities::SetTextWidgetBoundsX(pBVar5,this->boundX0,this->boundX1);

      pBVar5->SetCoords(this->x + (short)(iVar11 % (int)(uint)uVar3) *
                                  (short)(((int)(short)uVar1 - (int)(short)uVar2) /
                                         (int)(uint)uVar3),
                 this->y + sub->unk10 +
                 (short)(iVar11 / (int)(uint)uVar3) * (uVar4 + (short)uVar7));

    }
  }
}
return TickChildren();
}

u8 WidgetArrayMenu::AddEntry(BaseWidget *entry){;
  WAMSub *sub = (WAMSub *)this->substruct;
  u8 bVar2 = sub->entryCount < sub->entryCap;
  if (bVar2) {
    entry->boundX0 = this->boundX0;
    entry->boundX1 = this->boundX1;
    entry->boundY0 = this->boundY0;
    entry->boundY1 = this->boundY1;
    entry->Tick();
    sub->entries[sub->entryCount++] = entry;
  }
  return bVar2;
}


u8 WidgetArrayMenu::RemoveEntry(BaseWidget *entry){
  u16 uVar1;
  uint uVar2;
  BaseWidget **ppBVar3;
  int iVar4;
  int iVar5;
  WAMSub *sub;
  
  sub = (WAMSub *)substruct;
  uVar2 = (uint)sub->entryCount;
  iVar5 = 0;
  if (uVar2 != 0) {
    ppBVar3 = sub->entries;
    if (*ppBVar3 == entry) {
LAB_800bacc4:
      if (iVar5 < (int)uVar2) {
        iVar4 = iVar5;
        if (iVar5 < (int)(uVar2 - 1)) {
          ppBVar3 = sub->entries + iVar5;
          iVar4 = sub->entryCount - 1;
          iVar5 = iVar4 - iVar5;
          do {
            iVar5--;
            *ppBVar3 = ppBVar3[1];
            ppBVar3++;
          } while (iVar5 != 0);
        }
        uVar1 = sub->entryCount;
        sub->entries[iVar4] = NULL;
        sub->entryCount = uVar1 - 1;
        return true;
      }
    }
    else {
      for (iVar5 = 1; ppBVar3++, iVar5 < (int)uVar2; iVar5++) {
        if (*ppBVar3 == entry) goto LAB_800bacc4;
      }
    }
  }
  return false;
}

u32 WidgetArrayMenu::GetNumber(){return WidgetN_ArrayMenu;}