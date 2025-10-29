#include "widgets/WidgetScrollMenu.h"
#include "widgets/Utilities.h"
#define FILENAME "./src/widgetscrollmenu.cpp"


WidgetScrollMenu::WidgetScrollMenu(u16 length):BaseWidget(){
    WSMSub *puVar1 = new WSMSub;
    this->x = 0;
    this->y = 0;
    this->width = 0;
    this->height = 0;
    puVar1->field0_0x0 = 10;
    puVar1->flag = 1;
    puVar1->blendSign = 1;
    puVar1->reds[0] = 100;
    puVar1->greens[0] = 100;
    puVar1->blues[0] = 100;
    puVar1->alphas[0] = 100;
    puVar1->blendA = 0x14;
    (puVar1->col).R = 0xe1;
    (puVar1->col).G = 0xe1;
    (puVar1->col).B = 0xe1;
    (puVar1->col).A = 0xe1;
    puVar1->reds[1] = 0xff;
    puVar1->greens[1] = 0xff;
    puVar1->blues[1] = 0xff;
    puVar1->alphas[1] = 0xff;
    puVar1->field11_0x12 = 0;
    puVar1->field14_0x16 = 0;
    puVar1->blendB = 0;
    this->boundY1 = SCREEN_HEIGHT;
    this->boundX1 = SCREEN_WIDTH;
    this->UpButtonFunc = WSM_UpFunc;
    this->DownButtonFunc = WSM_DownFunc;
    this->AButtonFunc = WSM_AFunc;
    this->boundY0 = 0;
    this->boundX0 = 0;
    this->LeftButtonFunc = WSM_LeftFunc;
    this->RightButtonFunc = WSM_RightFunc;
    this->fadeIn = NULL;
    this->fadeOut = NULL;
    puVar1->highlight = 0;
    puVar1->maxCount = length;
    puVar1->currentCount = 0;
    puVar1->unk22 = 0;
    if (length == 0) puVar1->items = NULL;
    else {
      BaseWidget** ppBVar1= (BaseWidget**)HALLOC(length*sizeof(BaseWidget*),89);
      puVar1->items = ppBVar1;
      for (u32 i= length; i != 0; i--) {
        *ppBVar1 = NULL;
        ppBVar1++;
      }
    }
    this->substruct = puVar1;
    SetState(1);
}
WidgetScrollMenu::~WidgetScrollMenu(){
  
  WSMSub *pvVar1 = (WSMSub *)this->substruct;
  if (pvVar1) {
    if (pvVar1->currentCount) {
      for(u32 i=0;i<pvVar1->currentCount;i++) {
        if (pvVar1->items[i]) {
          pvVar1->items[i]->~BaseWidget();
          pvVar1->items[i] = NULL;
        }
      }
    }
    FREEPTR(pvVar1->items,124)
    delete pvVar1;
    this->substruct = NULL;
  }
}

Gfx * WidgetScrollMenu::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  WSMSub *pvVar1 = (WSMSub *)this->substruct;
  if (pvVar1->currentCount) {
    for(u32 i=0;i<pvVar1->currentCount;i++) {
      if (pvVar1->items[i]) {
        g=pvVar1->items[i]->Render(g,x0,y0,x1,y1);
      }
    }
  }
  RENDERCHILDREN();
}

u8 WidgetScrollMenu::Tick(){
  byte bVar1;
  byte bVar4;
  short sVar9;
  BaseWidget *entry;
  char cVar15;
  ulong uVar13;
  int iVar14;
  bool bVar16;
  BaseWidget **ppBVar17;
  short sVar18;
  u16 uVar19;
  uint i;
  int iVar21;
  byte bVar23;
  WSMSub *pvVar5 = (WSMSub *)this->substruct;
  iVar21 = 0;
  sVar18 = 0;
  if (pvVar5->items) {
    cVar15 = pvVar5->blendB + pvVar5->blendSign;
    pvVar5->blendB = cVar15;
    if ((cVar15 == 0) ||
       ((pvVar5->blendA - 1) <= pvVar5->blendB)) {
      pvVar5->blendSign = -pvVar5->blendSign;
    }
    bVar1 = pvVar5->blendA;
    bVar4 = pvVar5->blendB;
    (pvVar5->col).R = pvVar5->reds[0] + ((pvVar5->reds[1] - pvVar5->reds[0]) / bVar1) * bVar4;
    (pvVar5->col).G = pvVar5->greens[0] + ((pvVar5->greens[1] - pvVar5->greens[0]) / bVar1) * bVar4;
    (pvVar5->col).B = pvVar5->blues[0] + ((pvVar5->blues[1] - pvVar5->blues[0]) / bVar1) * bVar4;
    (pvVar5->col).A = (s16)(((pvVar5->alphas[0] +(pvVar5->alphas[1] - pvVar5->alphas[0]) /bVar1) * bVar4)) *
    ((float)(this->col).A / 255.0f);
    if (pvVar5->currentCount) {
      for(i=0;i<pvVar5->currentCount;i++) {
        entry = pvVar5->items[i];
        entry->boundX0 = this->boundX0;
        entry->boundX1 = this->boundX1;
        entry->boundY0 = this->boundY0;
        entry->boundY1 = this->boundY1;
        if ((pvVar5->flag & 1) == 0) {
          if ((pvVar5->flag & 2) != 0) {
            sVar9 = this->y;
            sVar18 = this->x - entry->GetWidth();
            goto LAB_800b9fb0;
          }
          entry->SetCoords(this->x - (short)(entry->GetWidth() >> 1),this->y + (short)iVar21 + pvVar5->field11_0x12);
        }
        else {
          sVar18 = this->x;
          sVar9 = this->y;
LAB_800b9fb0:
          entry->SetCoords(sVar18,sVar9 + (short)iVar21 + pvVar5->field11_0x12);
        }
        if ((entry->GetNumber() == WidgetN_ClipText)||(entry->GetNumber() == WidgetN_ShadText)) {
          Utilities::SetTextWidgetBoundsX(entry,this->boundX0,this->boundX1);
        }
        uVar13= entry->GetHeight();
        iVar21 += uVar13 + (byte)pvVar5->unk22;
        sVar18 = (short)iVar21;
        if (i == pvVar5->highlight) {
          sVar9 = entry->y;
          if ((pvVar5->flag & 8) == 0) {
            if (this->boundY1 < (sVar9 + uVar13)) {
              pvVar5->field11_0x12-= (sVar9 + uVar13) - this->boundY1;
            }
            if (sVar9 < this->boundY0) {
              pvVar5->field11_0x12+= (this->boundY0 - sVar9);
            }
          }
          else {
            pvVar5->field11_0x12+= (this->y - (sVar9 + (uVar13 / 2)));
          }
          entry->SetColor((pvVar5->col).R,(pvVar5->col).G,(pvVar5->col).B,(pvVar5->col).A);
          if (entry->GetNumber() == WidgetN_ShadText) {
            ((WSTSub*)entry->substruct)->unk1c=0;
          }
          entry->Tick();
        }
        else {
          entry->SetColor((this->col).R,(this->col).G,(this->col).B,(this->col).A);
          if (entry->GetNumber() == WidgetN_ShadText) {
            ((WSTSub*)entry->substruct)->unk1c=1;
          }
          entry->Tick();
        }
      }
    }
  }
  SetHeight(sVar18 - (u16)(byte)pvVar5->unk22);
  return TickChildren();
}

u8 WidgetScrollMenu::Append(BaseWidget *entry){
  WSMSub *pvVar2 = (WSMSub *)substruct;
  entry->boundX0 = this->boundX0;
  entry->boundX1 = this->boundX1;
  entry->boundY0 = this->boundY0;
  entry->boundY1 = this->boundY1;
  entry->Tick();
  pvVar2->items[pvVar2->currentCount++] = entry;
  return true;
}

u8 WidgetScrollMenu::Remove(BaseWidget *entry){
  short sVar1;
  uint uVar2;
  BaseWidget **ppBVar3;
  int iVar4;
  int iVar5;
  WSMSub *pvVar2 = (WSMSub *)this->substruct;
  uVar2 = pvVar2->currentCount;
  iVar5 = 0;
  if (uVar2 != 0) {
    ppBVar3 = pvVar2->items;
    if (*ppBVar3 == entry) {
LAB_800ba2e0:
      if (iVar5 < (int)uVar2) {
        iVar4 = iVar5;
        if (iVar5 < (int)(uVar2 - 1)) {
          ppBVar3 = pvVar2->items + iVar5;
          for(iVar5 = (pvVar2->currentCount - 1) - iVar5;iVar5!=0;iVar5--) {
            *ppBVar3 = ppBVar3[1];
            ppBVar3++;
          }
        }
        pvVar2->items[pvVar2->currentCount--] = NULL;
        return true;
      }
    }
    else {
      for (iVar5 = 1; ppBVar3++, iVar5 < (int)uVar2; iVar5++) {
        if (*ppBVar3 == entry) goto LAB_800ba2e0;
      }
    }
  }
  return false;
}


u8 WidgetScrollMenu::SetFlags(u8 f){
    ((WSMSub *)substruct)->flag=f;
}

u32 WidgetScrollMenu::GetNumber(){return WidgetN_ScrollMenu;}