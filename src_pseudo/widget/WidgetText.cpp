#include "widgets/WidgetText.h"
#include "heapN64.h"

#define FILENAME "./src/widgettext.cpp"

WidgetText::WidgetText(char *str,u16 len):BaseWidget(){
  widgetTextSubstruct *ppcVar2;
  uint size = (uint)len;
  ppcVar2 = new widgetTextSubstruct;
  ppcVar2->scalex = 1.0f;
  ppcVar2->scaley = 1.0f;
  if (len < 2) size = 2;
  ALLOCS(ppcVar2->str,size,36);
  if (!str) sprintf(ppcVar2->str," ");
  else sprintf(ppcVar2->str,str);
  substruct = ppcVar2;
  SetState(1);
  width = 0;
  height = 0;
  SetCoords(0x50,0x1e);
  SetColor(0xe1,0xe1,0xe1,0xff);
}

WidgetText::~WidgetText(){
  widgetTextSubstruct *ppvVar1 = (widgetTextSubstruct *)substruct;
  if (ppvVar1) {
    if (ppvVar1->str) HFREE(ppvVar1->str,65);
    delete ppvVar1;
  }
}


Gfx * WidgetText::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  FontStruct *pFVar1;
  Gfx *pGVar2;
  int iVar3;
  u16 uVar4;
  s32 lVar5;
  s32 lVar6;
  s32 lVar7;
  s32 lVar8;
  Gfx *apGStackX_4;
  widgetTextSubstruct *ppcVar1;
  
  pFVar1 = font_pointer;
  apGStackX_4 = g;
  if (font_pointer == NULL) RENDERCHILDREN();
  else {
    lVar6 = this->boundX0;
    if (this->boundX0 < x0) lVar6 = x0;
    lVar8 = this->boundX1;
    if (x1 < this->boundX1) lVar8 = x1;
    lVar5 = this->boundY0;
    if (this->boundY0 < y0) lVar5 = y0;
    lVar7 = this->boundY1;
    if (y1 < this->boundY1) lVar7 = y1;
    uVar4 = 0;
    ppcVar1 = (widgetTextSubstruct *)this->substruct;
    (font_pointer->col).R = this->col.R *fadeFloatMirror;
    (font_pointer->col).G = this->col.G *fadeFloatMirror;
    (font_pointer->col).B = this->col.B *fadeFloatMirror;
    (font_pointer->col).A = this->col.A *fadeFloatMirror;
    if (0.0 < (this->col).A * fadeFloatMirror) {
      uVar4 = passto_display_text_func_A(font_pointer,apGStackX_4,ppcVar1->str,this->x,this->y,
              lVar6,lVar5,lVar8,lVar7,ppcVar1->scalex,ppcVar1->scaley);
    }
    BaseWidget::SetHeight(uVar4);
    return RenderChildren(apGStackX_4,x0,y0,x1,y1);
  }
}

u16 WidgetText::GetWidth(){
  uint uVar1;
  u16 uVar2;
  uint uVar3;
  widgetTextSubstruct *ppvVar1 = (widgetTextSubstruct *)substruct;
  uVar1 = get_text_kerning(font_pointer,ppvVar1->str,ppvVar1->scalex);
  uVar2 = 0;
  if (boundX1 < boundX0) width = 0;
  else {
    uVar3 = boundX1 - boundX0;
    if (uVar3 < uVar1) uVar1 = uVar3;
    uVar2 = (u16)uVar1;
    width = uVar2;
  }
  return uVar2;
}

u16 WidgetText::GetHeight(){
  widgetTextSubstruct *ppcVar1 = (widgetTextSubstruct *)substruct;
  height = (u16)Font_GetHeight(font_pointer,ppcVar1->str,x,(int)(short)boundX1,
                         ppcVar1->scalex,ppcVar1->scaley);
  return height;
}

u8 WidgetText::Tick(){return TickChildren();}

u8 WidgetText::Modify(char *newStr,u8 b){
  u16 length;
  widgetTextSubstruct *ppcVar1 = (widgetTextSubstruct *)substruct;
  length = strlen(newStr);
  if (ppcVar1->len < (int)(length + 1)) {
    if (b) {
      HFREE(ppcVar1->str,173);
      length = strlen(newStr);
      ppcVar1->len = (length + 1);
      ALLOCS(ppcVar1->str,length + 1,176);
      strcpy(ppcVar1->str,newStr);
      return true;
    }
    else return false;
  }
  else {
    sprintf(ppcVar1->str,newStr);
    return true;
  }
}
u32 WidgetText::GetNumber(){return 0;}


