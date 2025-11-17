#include "widgets/Utilities.h"
#include "globals.h"

BaseWidget * ofunc_icon_or_portrait(BaseWidget *parent,ItemID ID,u16 H,u16 W,u8 type) {
  u32 aBStack_20 [8];
  
  Borg8Header *b8 = NULL;
  if (ID) {
    if (type == 0) GetItemImage(ID,aBStack_20);
    else if (type == 1) {
      aBStack_20[0] = gEntityDB->GetPortrait(ID);
    }
    b8 = loadBorg8(aBStack_20[0]);
  }
  BaseWidget *ret = new WidgetBorg8(b8);
  ret->varU16 = ID;
  ret->SetWidth(H);
  ret->SetHeight(W);
  if (parent) parent->Link(ret);
  return ret;
}

BaseWidget * WidgetBorg8At(BaseWidget *parent,u16 Index,s16 X,s16 Y,s16 H,s16 W) {
  Borg8Header *b8 = NULL;
  if (Index) b8 = loadBorg8(Index);
  BaseWidget *ret = new WidgetBorg8(b8);
  if (ret == NULL) ret = NULL;
  else {
    ret->SetCoords(X,Y);
    ret->SetWidth((H - X) + 1);
    ret->SetHeight((W - Y) + 1);
    if (parent) parent->Link(ret);
  }
  return ret;
}

BaseWidget * FUN_8004ce14(BaseWidget *parent,u16 x0,u16 y0,u16 x1,u16 y1,u8 r,u8 g,u8 b,u8 a) {
  BaseWidget *ret = Utilities::DebugBackground(parent,x0,y0,x1 - x0,y1 - y0,r,g,b,a);
  ret->SetSomeBounds(y0,x0,x1,y1);
  return ret;
}

void Ofunc_8004cec0(BaseWidget *w,Color32 *param_2,Color32 *param_3,u8 param_4) {
  if (w->GetNumber() == WidgetN_ScrollMenu) {
    WSMSub *sub = (WSMSub *)w->substruct;
    sub->blendSign = 1;
    sub->reds[0] = param_2->R;
    sub->greens[0] = param_2->G;
    sub->blues[0] = param_2->B;
    sub->alphas[0] = param_2->A;
    sub->reds[1] = param_3->R;
    sub->greens[1] = param_3->G;
    sub->blues[1] = param_3->B;
    sub->alphas[1] = param_3->A;
    (sub->col).R = param_2->R;
    (sub->col).G = param_2->G;
    (sub->col).B = param_2->B;
    sub->blendA = param_4;
    sub->blendB = 0;
    (sub->col).A = param_2->A;
  }
}

