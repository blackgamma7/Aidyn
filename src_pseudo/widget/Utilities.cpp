#include "widgets/Utilities.h"
#define FILENAME "./src/utilities.cpp"

//Get string from Text Widget
//@param w: widget to retrieve text
//@returns string of text widget
char * Utilities::GetWidgetText(BaseWidget *w){
  char** p;
  
  if (w->GetNumber() == WidgetN_Text)
    p = (char**)w->substruct;
  else if (w->GetNumber() == WidgetN_ClipText)
    p = (char**)w->substruct;
  else if (w->GetNumber() == WidgetN_ShadText)
    p = (char**)w->substruct;
  else return NULL;
  return *p;
}
//replace the text in a text Widget. Could be optimized.
//@param w: widget to replace text
//@param txt: new text
//@param realloc: if the memory for the text should be reallocated.
void Utilities::ChangeWidgetText(BaseWidget *w,char *txt,u8 realloc){
  WSTSub* sub; //enoungh similarites to structs to allow it.
  u16 len;  
  if ((w->GetNumber() != WidgetN_Text)&&
      (w->GetNumber() != WidgetN_ClipText)&&
      (w->GetNumber() != WidgetN_ShadText)) 
    return;
  if (w->GetNumber() == WidgetN_Text) {
    sub = (WSTSub *)w->substruct;
    if (realloc){
    HFREE(sub->txt,159);
    len = strlen(txt)+1;
    sub->len=len;
    ALLOCS(sub->txt,len,162);
    }
    sprintf(sub->txt,txt);
  }
  else if (w->GetNumber() == WidgetN_ClipText){
    sub = (WSTSub *)w->substruct;
    if (realloc){
    HFREE(sub->txt,174);
    len = strlen(txt)+1;
    sub->len = len;
    ALLOCS(sub->txt,len,177);
    }
    sprintf(sub->txt,txt);
  }
  else if (w->GetNumber() == WidgetN_ShadText){
    sub = (WSTSub *)w->substruct;
    if (realloc){
    HFREE(sub->txt,189);
    len = strlen(txt)+1;
    sub->len = len;
    ALLOCS(sub->txt,len,192);
    }
    sprintf(sub->txt,txt);
  }
}
//set x-axis bounds for text widgets
//@param w: widget to change
//@param x: boundx0
//@param y: boundx1
void Utilities::SetTextWidgetBoundsX(BaseWidget *w,u16 x,u16 y){
  WSTSub* sub;
  
  if (w->GetNumber() == WidgetN_Text) {
    w->boundX0 = x;
    w->boundX1 = y;
  }
  else {
  if (w->GetNumber() == WidgetN_ClipText)
      sub = (WSTSub *)w->substruct;
  else if (w->GetNumber() == WidgetN_ShadText)
      sub = (WSTSub *)w->substruct;
  else return;
  sub->X=x;
  sub->Y=y;
  }
}
//set x-axis bound for text widgets
//@param w: widget to change
//@param x: boundx0
void Utilities::SetTextWidgetBoundsX0(BaseWidget *w,u16 x){
    WSTSub *sub;
    
    if (w->GetNumber() == WidgetN_Text)
      w->boundX0 = x;
    else {
    if (w->GetNumber() == WidgetN_ClipText)
        sub = (WSTSub *)w->substruct;
    else if (w->GetNumber() == WidgetN_ShadText)
        sub = (WSTSub *)w->substruct;
    else return;
    sub->X = x;
    }
  }
//set x-axis bounds for text widgets
//@param w: widget to change
//@param y: boundx1
  void Utilities::SetTextWidgetBoundsX1(BaseWidget *w,u16 y){
    WSTSub *sub;
    
    if (w->GetNumber() == WidgetN_Text) {
      w->boundX1 = y;
    }
    else {
    if (w->GetNumber() == WidgetN_ClipText)
        sub = (WSTSub *)w->substruct;
    else if (w->GetNumber() == WidgetN_ShadText)
        sub = (WSTSub *)w->substruct;
    else return;
    sub->Y = y;
    }
  }

//set scale of widget? unused.
void Ofunc_800bbf28(BaseWidget *w,float x,float y){
  WSTSub* sub;
  
  if (w->GetNumber() == WidgetN_Text)
    sub = (WSTSub *)w->substruct;
  else if (w->GetNumber() == WidgetN_ClipText)
    sub = (WSTSub *)w->substruct;
  else if (w->GetNumber() == WidgetN_ShadText)
    sub = (WSTSub *)w->substruct;
  else return;
  sub->scale.x=x;
  sub->scale.y=y;
}

//something about a scrollmenu item's vertical spacing?
void FUN_800bbfc8(BaseWidget *w,u16 param_2){
  switch (w->GetNumber()){
    case WidgetN_ArrayMenu:
    ((WAMSub*)w->substruct)->entryX=param_2;
    break;
    case WidgetN_ScrollMenu:
    ((WSMSub*)w->substruct)->unk22 = (u8)param_2;
    break;
    case WidgetN_ScrollList:
    ((WSLSub*)w->substruct)->unk13 = (u8)param_2;
    break;
  }
}

void Ofunc_800bc064(BaseWidget *w,u8 param_2){
    switch (w->GetNumber()){
        case WidgetN_ScrollMenu:
        case WidgetN_ScrollList:
        ((WSMSub*)w->substruct)->field0_0x0 = param_2;
        break;
      }
}
//Get Highlighted entry of an array Widget
//@param w: widget
BaseWidget * Utilities::GetHighlightedEntry(BaseWidget *w){
  uint ind;
  BaseWidget **wArr;
  
  if (w->GetNumber() == WidgetN_ArrayMenu){
    ind = ((WAMSub*)w->substruct)->entryPos;
    wArr = ((WAMSub*)w->substruct)->entries;
  }
  else if (w->GetNumber() == WidgetN_ScrollMenu){
    ind = ((WSMSub*)w->substruct)->highlight;
    wArr = ((WSMSub*)w->substruct)->items;
  }
  else if (w->GetNumber() == WidgetN_ScrollList){
    ind = ((WSLSub*)w->substruct)->itemHighlight;
    wArr = ((WSLSub*)w->substruct)->items;
  }
  else return NULL;
  return wArr[ind];
}

u16 Utilities::GetHighlightIndex(BaseWidget *w){
  u16 highlight;
  switch (w->GetNumber()){
    case WidgetN_ArrayMenu:
    highlight = ((WAMSub*)w->substruct)->entryPos;
    break;
    case WidgetN_ScrollMenu:
    highlight = ((WSMSub*)w->substruct)->highlight;
    break;
    case WidgetN_ScrollList:
    highlight = ((WSLSub*)w->substruct)->itemHighlight;
    break;
    default:
    highlight=0;
  }
  return highlight;
}

void Utilities::SetScrollMenuColors(BaseWidget *w,u8 r0,u8 g0,u8 b0,u8 a0,u8 r1,u8 g1,u8 b1,u8 a1,u8 w0){
  if (w->GetNumber() == WidgetN_ScrollMenu) {
    WSMSub *sub = (WSMSub *)w->substruct;
    sub->blendSign = 1;
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
  s16 sVar1;
  BaseWidget **ppBVar2;
  ulong uVar3;
  int iVar4;
  BaseWidget **ppBVar5;
  u16 uVar6;
  u16 uVar7;
  WSMSub *sub;
  
  uVar7 = param_2;
  if ((w->GetNumber() == WidgetN_ScrollMenu) && (sub = (WSMSub *)w->substruct, uVar7 < (u16)sub->currentCount))
  {
    iVar4 = (u16)sub->currentCount - 1;
    if ((int)uVar7 < iVar4) {
      ppBVar2 = sub->items;
      do {
        ppBVar5 = ppBVar2 + uVar7;
        uVar7++;
        *ppBVar5 = ppBVar5[1];
      } while ((int)uVar7 < iVar4);
    }
    sVar1 = sub->currentCount;
    uVar6 = sVar1 - 1;
    sub->items[uVar7] = NULL;
    sub->currentCount = uVar6;
    if (uVar6 <= (u16)sub->highlight) {
      sub->highlight = sVar1 + -2;
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
  WSMSub *sub = (WSMSub *)w->substruct;
  if (sub->currentCount != 0) {
    for(u16 i=0;i<sub->currentCount;i++){
     BaseWidget *pBVar1 = sub->items[i];
      if (pBVar1) {
        pBVar1->~BaseWidget();
        sub->items[i] = NULL;
      }
    }
  }
  sub->currentCount = 0;
  sub->highlight = 0;
}

void Utilities::SetBorg8Dims(BaseWidget *w,Borg8Header *image,u8 replace){ 
  if ((image) && (w)) {
    if (replace) borg8_free(w->borg8);
    w->borg8 = image;
    w->SetWidth((image->dat).Width);
    w->SetHeight((image->dat).Height);
  }
}

void Utilities::SetWidgetBounds
               (BaseWidget *w,u16 param_2,u16 param_3,u16 param_4,u16 param_5){
  if (w) {
    BaseWidget *link = w->link3;
    w->boundX0 = param_2;
    w->boundX1 = param_4;
    w->boundY0 = param_3;
    w->boundY1 = param_5;
    for (; link != NULL; link = link->link2) {
      SetWidgetBounds(link,param_2,param_3,param_4,param_5);
    }
  }
}


void Utilities::SetTextWidgetBoundsX02(BaseWidget *w,u16 param_2){
  if (w) {
    BaseWidget *pBVar1 = w->link3;
    w->boundX0 = param_2;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetTextWidgetBoundsX02(pBVar1,param_2);
    }
  }
}

void Utilities::SetTextWidgetBoundsX12(BaseWidget *w,u16 param_2){
  if (w) {
    BaseWidget *pBVar1 = w->link3;
    w->boundX1 = param_2;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetTextWidgetBoundsX12(pBVar1,param_2);
    }
  }
}


void Utilities::SetWidgetBoundsY02(BaseWidget *w,u16 param_2){
  if (w) {
    BaseWidget *pBVar1 = w->link3;
    w->boundY0 = param_2;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetWidgetBoundsY02(pBVar1,param_2);
    }
  }
}


void Utilities::SetWidgetBoundsY12(BaseWidget *w,u16 param_2){  
  if (w) {
    BaseWidget *pBVar1 = w->link3;
    w->boundY1 = param_2;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetWidgetBoundsY12(pBVar1,param_2);
    }
  }
}

void Utilities::SetWidgetColor(BaseWidget *w,u8 r,u8 g,u8 b,u8 a){
  if (w) {
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
  if (w) {
    BaseWidget *pBVar1 = w->link3;
    (w->col).R = r;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetRed(pBVar1,r);
    }
  }
}
void Utilities::SetGreen(BaseWidget *w,u8 g){
  if (w) {
    BaseWidget *pBVar1 = w->link3;
    (w->col).G = g;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetGreen(pBVar1,g);
    }
  }
}


void Utilities::SetBlue(BaseWidget *w,u8 b){
  if (w) {
    BaseWidget *pBVar1 = w->link3;
    (w->col).B = b;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetBlue(pBVar1,b);
    }
  }
}


void Utilities::SetAlpha(BaseWidget *w,u8 a){
  if (w) {
    BaseWidget *pBVar1 = w->link3;
    (w->col).A = a;
    for (; pBVar1 != NULL; pBVar1 = pBVar1->link2) {
      SetAlpha(pBVar1,a);
    }
  }
}


void Utilities::MoveWidget(BaseWidget *w,s16 x,s16 y){
  if (!w) return;
  w->x = x + w->x;
  w->y = y + w->y;
  w->boundX0 = x + w->boundX0;
  w->boundX1 = x + w->boundX1;
  w->boundY0 = y + w->boundY0;
  w->boundY1 = y + w->boundY1;
  if ((w->GetNumber() == WidgetN_ClipText)||(w->GetNumber() == WidgetN_ShadText)) {
     WSTSub* sub = (WSTSub*)w->substruct;
     sub->X= x+sub->X;
     sub->Y= x+sub->Y;
  }
  BaseWidget *pBVar2 = w->link3;
  for (; pBVar2 != NULL; pBVar2 = pBVar2->link2) {
    MoveWidget(pBVar2,x,y);
  }
}

void Utilities::MoveWidget2(BaseWidget *w,s16 param_2,s16 param_3){
  MoveWidget(w,param_2 - w->x,param_3 - w->y);
}

WidgetDebugBG * Utilities::DebugBackground(BaseWidget *wP,s16 x,s16 y,u16 h,u16 w,u8 r,u8 g,u8 b,u8 a){
  WidgetDebugBG* BG = new WidgetDebugBG();
  BG->SetCoords(x,y);
  BG->SetWidth(h);
  BG->SetHeight(w);
  BG->SetColor(r,g,b,a);
  if (wP) wP->Link(BG);
  return BG;
}

WidgetText * Utilities::AddTextWidget(BaseWidget *w,char *str,s16 x,s16 y,u8 r,u8 g,u8 b,u8 a){
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
  SetTextWidgetBoundsX(pBVar1,bX0,bX1);
  if (w) w->Link(pBVar1);
  return pBVar1;
}

WidgetArrayMenu *Utilities::AddWidgetArrayMenu(BaseWidget *w,u16 len,u8 param_3,s16 x,s16 y,u16 x0,u16 x1,u16 y0,u16 y1,u8 r,u8 g,u8 b,u8 a){
  WidgetArrayMenu *ret = new WidgetArrayMenu(len);
  ((WAMSub*)ret->substruct)->entryY=param_3;
  ret->SetCoords(x,y);
  ret->boundX0 = x0;
  ret->boundX1 = y0;
  ret->boundY0 = x1;
  ret->boundY1 = y1;
  ret->SetColor(r,g,b,a);
  if (w) w->Link(ret);
  return ret;
}

//Creates and returns a parented WidgetBorg8 at a given screenspace position
//@param w: parent widget
//@param b8: borg8header to use
//@param x: x position
//@param y: y position
//@returns WidgetBorg8 pointer
WidgetBorg8 * Utilities::AddBorg8Widget(BaseWidget *w,Borg8Header *b8,s16 x,s16 y){
  WidgetBorg8 *pBVar1 = new WidgetBorg8(b8);
  if (pBVar1 == NULL) pBVar1 = NULL;
  else {
    pBVar1->SetCoords(x,y);
    if (w) w->Link(pBVar1);
  }
  return pBVar1;
}
//Creates and returns a parented WidgetBorg8 at a given screenspace position and size
//@param w: parent widget
//@param b8: borg8header to use
//@param x0: top-left position
//@param y0: top-right position
//@param x0: bottom-left position
//@param y0: bottom-right position
//@returns WidgetBorg8 pointer
WidgetBorg8 * Utilities::AddBorg8Widget2(BaseWidget *w,Borg8Header *b8,s16 x0,s16 y0,s16 x1,s16 y1){
  WidgetBorg8 *pBVar1 = AddBorg8Widget(w,b8,x0,y0);
  if (pBVar1 == NULL) pBVar1 = NULL;
  else {
    pBVar1->SetWidth((x1 - x0) + 1);
    pBVar1->SetHeight((y1 - y0) + 1);
  }
  return pBVar1;
}
//Creates and Returns a parented Scroll menu widget with given paramaters
//@param w: widget to parent.
//@param length: max expected entries
//@param x: x position
//@param y: y position
//@param bx0: boundX0
//@param by0: boundY0
//@param bx1: boundX1
//@param by1: boundY1
//@param r: red
//@param g: green
//@param b: blue
//@param a: alpha
//@param setColors: use colors for subtruct
//@returns array menu
WidgetScrollMenu* Utilities::AddScrollMenu(BaseWidget *w,u16 length,s16 x,s16 y,u16 bx0,u16 by0,u16 bx1,u16 by1,u8 r,u8 g,u8 b,u8 a,s32 setColors){
WidgetScrollMenu* ret = new WidgetScrollMenu(length);
ret->SetCoords(x,y);
ret->boundX0 = bx0;
ret->boundX1 = bx1;
ret->boundY1 = by1;
ret->boundY0 = by0;
ret->SetColor(r,g,b,a);
if (w) w->Link(ret);
if (setColors) {
  WSMSub *sub = (WSMSub *)ret->substruct;
  sub->reds[1] = r;
  sub->reds[0] = r;
  sub->greens[1] = g;
  sub->greens[0] = g;
  sub->blues[1] = b;
  sub->blues[0] = b;
  sub->alphas[1] = a;
  sub->alphas[0] = a;
}
return ret;
}