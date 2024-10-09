#ifdef DEBUGVER
#define FILENAME "./src/widgetcliptext.cpp"
#else
#define FILENAME ""
#endif

#include "widgets\WidgetClipText.h"
#include "stringN64.h"
#include "heapN64.h"
#include "crash.h"

WidgetClipText::WidgetClipText(char *str,u16 len):BaseWidget(){

  WidgetSubstruct_ClipText *sub = new WidgetSubstruct_ClipText;
  sub->unk12 = 0x140;
  sub->unk10 = 0;
  sub->scaleX = 1;
  sub->scaleY = 1;
  if ((len == 400) && (len = 20, str != NULL)) {len = strlen(str)+1;}
  if (len < 2) len = 2;
  sub->str = (char *)heapAlloc(len,FILENAME,50);
  if (!str) sprintf(sub->str," ");
  else sprintf(sub->str,str);
  substruct = sub;
  state = 1;
  width = 0;
  height = 0;
  SetCoords(80,30);
  SetColor(0xe1,0xe1,0xe1,0xff);
}

WidgetClipText::~WidgetClipText(){
  WidgetSubstruct_ClipText *ppvVar1 = (WidgetSubstruct_ClipText *)substruct;
  if (ppvVar1) {
    if (ppvVar1->str) HeapFree(ppvVar1->str,FILENAME,83);
    delete(ppvVar1);
    this->substruct = NULL;
  }
}

Gfx * WidgetClipText::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  FontStruct *pFVar1;
  int iVar2;
  s32 lVar4;
  s32 lVar5;
  s32 lVar6;
  s32 lVar7;
  float fVar8;
  Gfx* GStackX_4;
  WidgetSubstruct_ClipText *ppcVar1;
  
  lVar4 = boundX0;
  if (boundX0 < x0) lVar4 = x0;
  lVar6 = boundX1;
  if (x1 < boundX1) lVar6 = x1;
  lVar7 = boundY0;
  if (boundY0 < y0) lVar7 = y0;
  lVar5 = boundY1;
  if (y1 < boundY1) lVar5 = y1;
  iVar2 = 0;
  ppcVar1 = (WidgetSubstruct_ClipText *)substruct;
  GStackX_4 = g;
  if (((lVar6 < this->x) || (ppcVar1->unk12 < lVar4)) || (lVar5 < this->y)) RENDERCHILDREN();
  else {
    (font_pointer->col).R = (this->col).R * fadeFloatMirror;
    (font_pointer->col).G = (this->col).G * fadeFloatMirror;
    (font_pointer->col).B = (this->col).B * fadeFloatMirror;
    (font_pointer->col).A = (this->col).A * fadeFloatMirror;
    if (0.0 < (float)(this->col).A * fadeFloatMirror) {
      iVar2 = display_text_func_A(font_pointer,&GStackX_4,ppcVar1->str,this->x,this->y,
                                  ppcVar1->unk10,ppcVar1->unk12,lVar4,lVar7,lVar6,
                                  lVar5,ppcVar1->scaleX,ppcVar1->scaleY);
    }
    SetHeight(iVar2);
    RENDERCHILDREN();
  }
}

u16 WidgetClipText::GetWidth(){
  uint uVar1;
  u16 uVar2;
  uint uVar3;
  WidgetSubstruct_ClipText *ppbVar1 = (WidgetSubstruct_ClipText *)substruct;
  uVar1 = get_text_kerning(font_pointer,ppbVar1->str,ppbVar1->scaleX);
  uVar2 = 0;
  if (ppbVar1->unk12 < ppbVar1->unk10) this->width = 0;
  else {
    uVar3 = ppbVar1->unk12 - ppbVar1->unk10;
    if (uVar3 < uVar1) uVar1 = uVar3;
    uVar2 = (u16)uVar1;
    this->width = uVar2;
  }
  return uVar2;
}

u16 WidgetClipText::GetHeight(){
  WidgetSubstruct_ClipText *ppbVar1 = (WidgetSubstruct_ClipText *)this->substruct;
  u16 h = Font_GetHeight(font_pointer,ppbVar1->str,ppbVar1->unk10,ppbVar1->unk12,ppbVar1->scaleX,ppbVar1->scaleY);
  this->height = h;
  return h;
}

u8 WidgetClipText::Tick(){return TickChildren();}

u8 WidgetClipText::SetText(char *str,u8 b){
  WidgetSubstruct_ClipText *ppcVar1 = (WidgetSubstruct_ClipText *)this->substruct;
  u16 len = strlen(str);
  if (ppcVar1->maxLen < (len + 1)) {
    if (!b) CRASH("WidgetClipText::SetText()","Unable to set text.  String is too long.");
    HeapFree(ppcVar1->str,FILENAME,195);
    len = strlen(str);
    ppcVar1->maxLen = (len + 1);
    ppcVar1->str = (char *)heapAlloc(len + 1,FILENAME,198);
    strcpy(ppcVar1->str,str);
  }
  else sprintf(ppcVar1->str,str);
  return true;
}

u32 WidgetClipText::GetNumber(){return 1;}