#include "widgets/WidgetBorg8.h"

WidgetBorg8::WidgetBorg8(Borg8Header* b8):BaseWidget(){
    borg8 = b8;
    if (!b8) {
      width = 32;
      height = 32;
    }
    else {
      width = (b8->dat).Width;
      height = (b8->dat).Height;
    }
    state = 1;
    substruct = NULL;
    x = (short)((int)(SCREEN_WIDTH - width) / 2);
    y = (short)((int)(SCREEN_HEIGHT - height) / 2);
}

WidgetBorg8::~WidgetBorg8(){
  if (borg8) {
    borg8_free(borg8);
    borg8 = NULL;
  }
  BaseWidget::~BaseWidget();
}


Gfx * WidgetBorg8::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  if (this->borg8) {
    s32 lVar16 = 0;
    s32 lVar17 = 0;
    s32 lVar10 = this->x;
    s32 lVar11 = this->y;
    s16 iHeight = (this->borg8->dat).Width;
    s16 iWidth = (this->borg8->dat).Height;
    s16 iVar14 = (this->width + this->x);
    s16 iVar8 = (this->height + this->y);
    float iScaleX = this->width / (this->borg8->dat).Width;
    float iScaleY = this->height / (this->borg8->dat).Height;
    u16 bx0 = this->boundX0;
    if (this->boundX0 < x0) bx0 = x0;
    u16 bx1 = this->boundX1;
    if (x1 < this->boundX1) bx1 = x1;
    u16 by0 = this->boundY0;
    if (this->boundY0 < y0) by0 = y0;
    u16 by1 = this->boundY1;
    if (y1 < this->boundY1) by1 = y1;
    if ((((bx0 <= iVar14) && (by0 <= iVar8)) && (lVar10 <= bx1)) && (lVar11 <= by1)) {
      if (lVar10 < bx0) {
        lVar16 = (bx0 - this->x) / iScaleX;
        lVar10 = bx0;
      }
      if (bx1 < iVar14) iHeight = (this->borg8->dat).Width - ((iVar14 - bx1) / iScaleX);
      if (lVar11 < by0) {
        lVar17 = (by0 - (int)this->y) / iScaleY;
        lVar11 = by0;
      }
      if (by1 < iVar8) iWidth = ((this->borg8->dat).Height - ((iVar8 - by1) / iScaleY));
      if (((lVar16 < iHeight) && (lVar17 < iWidth)) && (0.0 < (float)(this->col).A * fadeFloatMirror))
        g = N64BorgImageDraw(g,this->borg8,lVar10,lVar11,lVar16,lVar17,
                             (u16)iHeight,(u16)iWidth,iScaleX,iScaleY,col.R*fadeFloatMirror,
                             col.G*fadeFloatMirror,col.B*fadeFloatMirror,col.A*fadeFloatMirror);
    }
  }
  RENDERCHILDREN();
}

u8 WidgetBorg8::Tick(){return TickChildren();}
u32 WidgetBorg8::GetNumber(){return WidgetN_Borg8;}