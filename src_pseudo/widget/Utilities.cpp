#include "widgets/Utilities.h"
#define FILENAME "./src/utilities.cpp"


char * Utilities::GetWidgetText(BaseWidget *w){
  char** p;
  
  if (w->GetNumber() == 0)
    p = (char**)w->substruct;
  else if (w->GetNumber() == 1)
    p = (char**)w->substruct;
  else if (w->GetNumber() == 2)
    p = (char**)w->substruct;
  else return NULL;
  return *p;
}

void Utilities::ChangeWidgetText(BaseWidget *w,char *param_2,u8 param_3){
  void *pvVar2;
  u16 uVar3;
  char *pcVar4;
  uint line;
  undefined4 *puVar6;
  char **puVar5;
  
  //Todo:: clean up mess
  if (w->GetNumber() != 0) {
    if (w->GetNumber() != 1) {
      if (w->GetNumber() != 2) {
        return;
      }
    }
  }
  if (w->GetNumber() == 0) {
    puVar6 = (undefined4 *)w->substruct;
    if (!param_3) goto LAB_800bbcac;
    HFREE((void *)*puVar6,159);
    uVar3 = strlen(param_2);
    uVar3 += 1;
    *(short *)(puVar6 + 1) = (short)uVar3;
    line = 0xa2;
  }
  else {
    if (w->GetNumber() != 1) {
      if (w->GetNumber() != 2) return;
      puVar5 = (char **)w->substruct;
      if (param_3) {
        HFREE(*puVar5,189);
        uVar3 = strlen(param_2);
        *(short *)(puVar5 + 1) = (short)(uVar3 + 1);
        pcVar4 = (char *)HALLOC(uVar3 + 1,192);
        *puVar5 = pcVar4;
      }
      sprintf(*puVar5,param_2);
      return;
    }
    puVar6 = (undefined4 *)w->substruct;
    if (!param_3) goto LAB_800bbcac;
    HFREE((void *)*puVar6,0xae);
    uVar3 = strlen(param_2);
    uVar3 += 1;
    *(short *)(puVar6 + 1) = (short)uVar3;
    line = 0xb1;
  }
  pvVar2 = HALLOC(uVar3,line);
  (void*)*puVar6 = pvVar2;
LAB_800bbcac:
  sprintf((char *)*puVar6,param_2);
}

void Utilities::SetWidgetBoundsX(BaseWidget *w,u16 x,u16 y){
  void *pvVar1;
  
  if (w->GetNumber() == 0) {
    w->boundX0 = x;
    w->boundX1 = y;
  }
  else {
  if (w->GetNumber() == 1)
      pvVar1 = w->substruct;
  else if (w->GetNumber() == 2)
      pvVar1 = w->substruct;
  else return;
  *(u16 *)((int)pvVar1 + 0x10) = x;
  *(u16 *)((int)pvVar1 + 0x12) = y;
  }
}

void Utilities::SetWidgetBoundsX0(BaseWidget *w,u16 x){
    void *pvVar1;
    
    if (w->GetNumber() == 0) {
      w->boundX0 = x;
    }
    else {
    if (w->GetNumber() == 1)
        pvVar1 = w->substruct;
    else if (w->GetNumber() == 2)
        pvVar1 = w->substruct;
    else return;
    *(u16 *)((int)pvVar1 + 0x10) = x;
    }
  }
  
  void Utilities::SetWidgetBoundsX1(BaseWidget *w,u16 y){
    void *pvVar1;
    
    if (w->GetNumber() == 0) {
      w->boundX1 = y;
    }
    else {
    if (w->GetNumber() == 1)
        pvVar1 = w->substruct;
    else if (w->GetNumber() == 2)
        pvVar1 = w->substruct;
    else return;
    *(u16 *)((int)pvVar1 + 0x12) = y;
    }
  }

//set scale of widget? unused.
void Ofunc_800bbf28(BaseWidget *w,float param_2,float param_3){
  float *p;
  
  if (w->GetNumber() == 0)
    p = (float *)w->substruct;
  else if (w->GetNumber() == 1)
    p = (float *)w->substruct;
  else if (w->GetNumber() == 2)
    p = (float *)w->substruct;
  else return;
  p[2]=param_2;
  p[3]=param_3;
}

//something about a scrollmenu item's vertical spacing?
void FUN_800bbfc8(BaseWidget *w,u16 param_2){
  switch (w->GetNumber()){
    case 9:
    *(u16 *)((int)w->substruct + 8) = param_2;
    break;
    case 8:
    ((WSMSub*)w->substruct)->field_0x22 = (u8)param_2;
    break;
    case 11:
    *(u8 *)((int)w->substruct + 0x13) = (u8)param_2;
    break;
  }
}

void Ofunc_800bc064(BaseWidget *w,u8 param_2){
    switch (w->GetNumber()){
        case 8:
        case 11:
        ((WSMSub*)w->substruct)->field0_0x0 = param_2;
        break;
      }
}

BaseWidget * Utilities::GetHighlightedEntry(BaseWidget *w){
  uint uVar2;
  BaseWidget **iVar3;
  
  if (w->GetNumber() == 9){
    uVar2 = (uint)*(u16 *)((int)w->substruct + 6);
    iVar3 = *(BaseWidget ***)(w->substruct);
  }
  else if (w->GetNumber() == 8){
    uVar2 = ((WSMSub*)w->substruct)->highlight;
    iVar3 = ((WSMSub*)w->substruct)->items;
  }
  else if (w->GetNumber() == 11){
    uVar2 = (uint)*(u8 *)((int)w->substruct + 0x11);
    iVar3 = *(BaseWidget ***)((int)w->substruct + 0xc);
  }
  else return NULL;
  return iVar3[uVar2];
}

u16 Utilities::GetHighlightIndex(BaseWidget *w){
  u16 uVar2;
  switch (w->GetNumber()){
    case 9:
    uVar2 = *(u16 *)((int)w->substruct + 6);
    break;
    case 8:
    uVar2 = ((WSMSub*)w->substruct)->highlight;
    break;
    case 11:
    uVar2 = (u16)*(u8 *)((int)w->substruct + 0x11);
    break;
    default:
    uVar2=0;
  }
  return uVar2;
}

void Utilities::SetScrollMenuColors(BaseWidget *w,u8 r0,u8 g0,u8 b0,u8 a0,u8 r1,u8 g1,u8 b1,u8 a1,u8 w0){
  if (w->GetNumber() == 8) {
    WSMSub *sub = (WSMSub *)w->substruct;
    sub->field1_0x1 = 1;
    (sub->col).R = r0;
    sub->reds[0] = r0;
    (sub->col).G = g0;
    sub->greens[0] = g0;
    (sub->col).B = b0;
    sub->blues[0] = b0;
    (sub->col).A = a0;
    sub->alphas[0] = a0;
    sub->reds[1] = r1;
    sub->greens[1] = g1;
    sub->blues[1] = b1;
    sub->blendA = w0;
    sub->blendB = 0;
    sub->alphas[1] = a1;
  }
}

void Ofunc_800bc300(BaseWidget *w,u16 param_2){
  short sVar1;
  BaseWidget **ppBVar2;
  ulong uVar3;
  int iVar4;
  BaseWidget **ppBVar5;
  u16 uVar6;
  u16 uVar7;
  WSMSub *pvVar2;
  
  uVar7 = param_2;
  if ((w->GetNumber() == 8) && (pvVar2 = (WSMSub *)w->substruct, uVar7 < (u16)pvVar2->currentCount))
  {
    iVar4 = (u16)pvVar2->currentCount - 1;
    if ((int)uVar7 < iVar4) {
      ppBVar2 = pvVar2->items;
      do {
        ppBVar5 = ppBVar2 + uVar7;
        uVar7++;
        *ppBVar5 = ppBVar5[1];
      } while ((int)uVar7 < iVar4);
    }
    sVar1 = pvVar2->currentCount;
    uVar6 = sVar1 - 1;
    pvVar2->items[uVar7] = NULL;
    pvVar2->currentCount = uVar6;
    if (uVar6 <= (u16)pvVar2->highlight) {
      pvVar2->highlight = sVar1 + -2;
    }
  }
}

void Utilities::ClearScrollMenu(BaseWidget *w){
  u16 uVar1;
  WSMSub *pvVar2 = (WSMSub *)w->substruct;
  uVar1 = pvVar2->currentCount;
  if (uVar1) {
    for(u16 i=0;i<uVar1;i++) {
      pvVar2->items[i] = NULL;
    }
  }
  pvVar2->currentCount = 0;
  pvVar2->highlight = 0;
}

void Utilities::ClearScrollMenu2(BaseWidget *w){
  WSMSub *pvVar1 = (WSMSub *)w->substruct;
  if (pvVar1->currentCount != 0) {
    for(u16 i=0;i<pvVar1->currentCount;i++){
     BaseWidget *pBVar1 = pvVar1->items[i];
      if (pBVar1) {
        pBVar1->~BaseWidget();
        pvVar1->items[i] = NULL;
      }
    }
  }
  pvVar1->currentCount = 0;
  pvVar1->highlight = 0;
}

void Utilities::SetBorg8Dims(BaseWidget *w,Borg8header *image,u8 replace){ 
  if ((image) && (w)) {
    if (replace) borg8_free(w->borg8);
    w->borg8 = image;
    w->SetWidth((image->dat).Width);
    w->SetHeight((image->dat).Height);
  }
}

void Utilities::SetWidgetBounds
               (BaseWidget *w,u16 param_2,u16 param_3,u16 param_4,u16 param_5){
  BaseWidget *pBVar1;
  
  if (w) {
    pBVar1 = w->link3;
    w->boundX0 = param_2;
    w->boundX1 = param_4;
    w->boundY0 = param_3;
    w->boundY1 = param_5;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetWidgetBounds(pBVar1,param_2,param_3,param_4,param_5);
    }
  }
}


void Utilities::SetWidgetBoundsX02(BaseWidget *w,u16 param_2){
  BaseWidget *pBVar1;
  
  if (w != NULL) {
    pBVar1 = w->link3;
    w->boundX0 = param_2;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetWidgetBoundsX02(pBVar1,param_2);
    }
  }
}

void Utilities::SetWidgetBoundsX12(BaseWidget *w,u16 param_2){
  BaseWidget *pBVar1;
  
  if (w != NULL) {
    pBVar1 = w->link3;
    w->boundX1 = param_2;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetWidgetBoundsX12(pBVar1,param_2);
    }
  }
  return;
}


void Utilities::SetWidgetBoundsY02(BaseWidget *w,u16 param_2)

{
  BaseWidget *pBVar1;
  
  if (w != NULL) {
    pBVar1 = w->link3;
    w->boundY0 = param_2;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetWidgetBoundsY02(pBVar1,param_2);
    }
  }
  return;
}


void Utilities::SetWidgetBoundsY12(BaseWidget *w,u16 param_2){  
  if (w != NULL) {
    BaseWidget *pBVar1 = w->link3;
    w->boundY1 = param_2;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetWidgetBoundsY12(pBVar1,param_2);
    }
  }
}

void Utilities::SetWidgetColor(BaseWidget *w,u8 r,u8 g,u8 b,u8 a){
  if (w != NULL) {
    BaseWidget *next = w->link3;
    (w->col).R = r;
    (w->col).G = g;
    (w->col).B = b;
    (w->col).A = a;
    for (; next != NULL; next = next->link2) {
      SetWidgetColor(next,r,g,b,a);
    }
  }
}



void Utilities::SetRed(BaseWidget *w,u8 r){
  BaseWidget *pBVar1;
  
  if (w != NULL) {
    pBVar1 = w->link3;
    (w->col).R = r;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetRed(pBVar1,r);
    }
  }
}
void Utilities::SetGreen(BaseWidget *w,u8 g){
  BaseWidget *pBVar1;
  
  if (w != NULL) {
    pBVar1 = w->link3;
    (w->col).G = g;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetGreen(pBVar1,g);
    }
  }
}


void Utilities::SetBlue(BaseWidget *w,u8 b){
  BaseWidget *pBVar1;
  
  if (w != NULL) {
    pBVar1 = w->link3;
    (w->col).B = b;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetBlue(pBVar1,b);
    }
  }
}


void Utilities::SetAlpha(BaseWidget *w,u8 a){
  BaseWidget *pBVar1;
  
  if (w) {
    pBVar1 = w->link3;
    (w->col).A = a;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetAlpha(pBVar1,a);
    }
  }
}


void Utilities::MoveWidget(BaseWidget *w,short x,short y){
  void *pvVar1;
  BaseWidget *pBVar2;
  ulong uVar3;
  
  if (!w) return;
  w->x = x + w->x;
  w->y = y + w->y;
  w->boundX0 = x + w->boundX0;
  w->boundX1 = x + w->boundX1;
  w->boundY0 = y + w->boundY0;
  w->boundY1 = y + w->boundY1;
  if ((w->GetNumber() == 1)||(w->GetNumber() == 2)) {
    pvVar1 = w->substruct;
    *(short *)((int)pvVar1 + 0x10) = x + *(short *)((int)pvVar1 + 0x10);
    *(short *)((int)pvVar1 + 0x12) = x + *(short *)((int)pvVar1 + 0x12);
  }
  pBVar2 = w->link3;
  for (; pBVar2 != NULL; pBVar2 = pBVar2->link2) {
    MoveWidget(pBVar2,x,y);
  }
}

void Utilities::MoveWidget2(BaseWidget *w,short param_2,short param_3){
  MoveWidget(w,param_2 - w->x,param_3 - w->y);
}

BaseWidget * Utilities::DebugBackground(BaseWidget *w,short x,short y,u16 h,u16 w,u8 r,u8 g,u8 b,u8 a){
  BaseWidget* pBVar1 = new wigdetUnk0();
  pBVar1->SetCoords(x,y);
  pBVar1->SetWidth(h);
  pBVar1->SetHeight(w);
  pBVar1->SetColor(r,g,b,a);
  if (w) w->Link(pBVar1);
  return pBVar1;
}

WidgetText * Utilities::AddTextWidget(BaseWidget *w,char *str,short x,short y,u8 r,u8 g,u8 b,u8 a){
  WidgetText*pBVar1 = WText(str);
  pBVar1->SetCoords(x,y);
  pBVar1->SetColor(r,g,b,a);
  if (w) w->Link(pBVar1);
  return pBVar1;
}

WidgetText * Utilities::AddTextWidget2(BaseWidget *w,char *str,u16 x0,u16 y0,u16 x1,u16 y1){
  WidgetText*pBVar1 = WText(str);
  pBVar1->boundX0 = x0;
  pBVar1->boundY0 = y0;
  pBVar1->boundX1 = x1;
  pBVar1->boundY1 = y1;
  pBVar1->SetCoords(x0,y0);
  if (w) w->Link(pBVar1);
  return pBVar1;
}

WidgetText * Utilities::AddTextWidget3(BaseWidget *w,char *str,u16 x0,u16 y0,u16 x1,u16 y1,u8 r,u8 g, u8 b, u8 a){
    WidgetText*pBVar1 = WText(str);
    pBVar1->SetCoords(x0,y0);
    pBVar1->boundX0 = x0;
    pBVar1->boundY0 = y0;
    pBVar1->boundX1 = x1;
    pBVar1->boundY1 = y1;
    pBVar1->SetColor(r,g,b,a);
    if (w) w->Link(pBVar1);
    return pBVar1;
}

WidgetClipText *
Utilities::AddClipTextWidget(BaseWidget *w,char *txt,u16 bX0,u16 bY0,u16 bX1,u16 bY1,u16 len){
  WidgetClipText* pBVar1 = new WidgetClipText(txt,len);
  pBVar1->SetCoords(bX0,bY0);
  pBVar1->boundX0 = bX0;
  pBVar1->boundY0 = bY0;
  pBVar1->boundX1 = bX1;
  pBVar1->boundY1 = bY1;
  SetWidgetBoundsX(pBVar1,bX0,bX1);
  if (w) w->Link(pBVar1);
  return pBVar1;
}

BaseWidget *
Utilities::AddWidgetArrayMenu(BaseWidget *w,u16 len,u8 param_3,short x,short y,u16 x0,
          u16 x1,u16 y0,u16 y1,u8 r,u8 g,u8 b,u8 a){
  BaseWidget *pBVar1 = new WidgetArrayMenu(len);
  *(u16 *)((int)pBVar1->substruct + 10) = (u16)param_3;
  pBVar1->SetCoords(x,y);
  pBVar1->boundX0 = x0;
  pBVar1->boundX1 = y0;
  pBVar1->boundY0 = x1;
  pBVar1->boundY1 = y1;
  pBVar1->SetColor(r,g,b,a);
  if (w) w->Link(pBVar1);
  return pBVar1;
}