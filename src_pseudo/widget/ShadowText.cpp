#include "widgets/ShadowText.h"
#define FILENAME "./src/widgetshadowtext.cpp"

WidgetShadowText::WidgetShadowText(char *TXT,u16 len):BaseWidget(){
  char *pcVar2;

  WSTSub *sub = new WSTSub;;
  sub->Y = SCREEN_WIDTH;
  (sub->col).A = 0xff;
  sub->unk1c = 1;
  sub->X = 0;
  sub->XOff = 0;
  sub->YOff = 0;
  (sub->col).R = 0;
  (sub->col).G = 0;
  (sub->col).B = 0;
  (sub->scale).x = 1.0;
  (sub->scale).y = 1.0;
  if ((len == 400) && (len = 0x14, TXT != NULL)) {
    len = strlen(TXT) + 1;
  }
  if (len < 2) len = 2;
  ALLOCS(pcVar2,len,0x3c);
  sub->txt = pcVar2;
  if (TXT == NULL) sprintf(pcVar2," ");
  else sprintf(pcVar2,TXT);
  this->substruct = sub;
  SetState(1);
  this->width = 0;
  this->height = 0;
  SetCoords(80,30);
  SetColor(COLOR_OFFWHITE);
}

WidgetShadowText::~WidgetShadowText(){
  WSTSub *sub = (WSTSub *)substruct;
  if (sub) {
    if (sub->txt) HFREE(sub->txt,0x5b);
    delete sub;
    substruct = NULL;
  }
  BaseWidget::~BaseWidget();
}


Gfx * WidgetShadowText::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  FontStruct *pFVar1;
  Gfx *pGVar2;
  int iVar3;
  s16 lVar5;
  s16 lVar6;
  s16 lVar7;
  s16 lVar8;
  Gfx *apGStackX_4 [3];
  WSTSub *sub;
  u16 uVar4;
  
  pFVar1 = font_pointer;
  apGStackX_4[0] = g;
  if (font_pointer == NULL) pGVar2 = RenderChildren(g,x0,y0,x1,y1);
  else {
    lVar6 = this->boundX0;
    if (this->boundX0 < x0) lVar6 = x0;
    lVar8 = this->boundX1;
    if (x1 < this->boundX1) lVar8 = x1;
    lVar5 = this->boundY0;
    if (this->boundY0 < y0) lVar5 = y0;
    lVar7 = this->boundY1;
    if (y1 < this->boundY1) lVar7 = y1;
    sub = (WSTSub *)this->substruct;
    uVar4 = 0;            //!?
    if ((sub->unk1c) && (*(u32*)sub->XOff!= 0)) {
      uVar4 = 0;
      if (0.0 < (float)(((sub->col).A * col.A) / 255) * fadeFloatMirror) {
        (font_pointer->col).R = sub->col.R*fadeFloatMirror;
        (font_pointer->col).G = sub->col.G*fadeFloatMirror;
        (font_pointer->col).B = sub->col.B*fadeFloatMirror;
        (font_pointer->col).A = ((sub->col.A*col.A)/255)*fadeFloatMirror;
        uVar4 = Font::PrintMain(font_pointer,apGStackX_4,sub->txt,
                                    this->x + sub->XOff,this->y + sub->YOff,
                                    sub->X + sub->XOff,sub->Y + sub->XOff,lVar6 + sub->XOff,
                                    lVar5 + sub->YOff,lVar8 + sub->XOff,lVar7 + sub->YOff,
                                    (sub->scale).x,(sub->scale).y);
      }
    }
    if (0.0 < fadeFloatMirror * 255.0f) {
      (font_pointer->col).R = col.R*fadeFloatMirror;
      (font_pointer->col).G = col.G*fadeFloatMirror;
      (font_pointer->col).B = col.B*fadeFloatMirror;
      (font_pointer->col).A = fadeFloatMirror*255.0f;
      uVar4 = Font::PrintMain(font_pointer,apGStackX_4,sub->txt,this->x,this->y,sub->X
                                  ,sub->Y,lVar6,lVar5,lVar8,lVar7,(sub->scale).x
                                  ,(sub->scale).y);
    }
    SetHeight(uVar4);
    pGVar2 = RenderChildren(apGStackX_4[0],x0,y0,x1,y1);
  }
  return pGVar2;
}

u16 WidgetShadowText::GetWidth(){
  uint uVar1;
  u16 uVar2;
  uint uVar3;
  WSTSub *sub = (WSTSub *)substruct;
  uVar1 = Font::GetWidthScaled(font_pointer,sub->txt,(sub->scale).x);
  uVar2 = 0;
  if (sub->Y < sub->X) width = 0;
  else {
    uVar3 = sub->Y - sub->X;
    if (uVar3 < uVar1) uVar1 = uVar3;
    uVar2 = sub->XOff;
    if (uVar2 < 0) uVar2 = -uVar2;
    uVar2 = uVar1 + uVar2;
    width = uVar2;
  }
  return uVar2;
}

u16 WidgetShadowText::GetHeight(){
  int iVar1;
  u16 uVar2;
  WSTSub *sub = (WSTSub *)substruct;
  iVar1 = Font::GetHeightScaled(font_pointer,sub->txt,sub->X,sub->Y,(sub->scale).x,(sub->scale).y);
  uVar2 = sub->YOff;
  if (uVar2 < 0) uVar2 = -uVar2;
  uVar2 = iVar1 + uVar2;
  height = uVar2;
  return uVar2;
}

u8 WidgetShadowText::Tick(){return TickChildren();}

u8 WidgetShadowText::ChangeText(char *txt,u8 replace){
  u16 len;
    u8 bVar2;
  char *c1;
  WSTSub *sub;
  
  sub = (WSTSub *)substruct;
  if (sub->len < (strlen(txt) + 1)) {
    if (replace) {
      HFREE(sub->txt,0xee);
      len = strlen(txt);
      sub->len = (u16)(len + 1);
      ALLOCS(c1,len + 1,0xf1);
      sub->txt = c1;
      strcpy(c1,txt);
      bVar2 = true;
    }
    else bVar2 = false;
  }
  else {
    sprintf(sub->txt,txt);
    bVar2 = true;
  }
  return bVar2;
}

u32 WidgetShadowText::GetNumber(){return WidgetN_ShadText;}