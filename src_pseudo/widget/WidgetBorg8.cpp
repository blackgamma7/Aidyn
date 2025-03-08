#include "widgets/WidgetBorg8.h"

WidgetBorg8::WidgetBorg8(Borg8header* b8):BaseWidget(){
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
    //todo:fix this mess of casting
    byte bVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  Borg8header *pBVar6;
  Gfx *pGVar7;
  int iVar8;
  longlong lVar9;
  longlong lVar10;
  longlong lVar11;
  longlong lVar12;
  longlong lVar13;
  int iVar14;
  longlong lVar15;
  longlong height;
  longlong width;
  longlong lVar16;
  longlong lVar17;
  float red;
  float green;
  float blue;
  float alpha;
  float scaleX;
  float scaleY;

  pBVar6 = this->borg8;
  if (pBVar6) {
    lVar16 = 0;
    lVar17 = 0;
    sVar2 = this->x;
    lVar10 = (longlong)sVar2;
    sVar3 = this->y;
    lVar11 = (longlong)sVar3;
    sVar4 = (pBVar6->dat).Width;
    height = (longlong)sVar4;
    sVar5 = (pBVar6->dat).Height;
    width = (longlong)sVar5;
    iVar14 = (int)(((uint)this->width + (int)sVar2) * 0x10000) >> 0x10;
    iVar8 = (int)(((uint)this->height + (int)sVar3) * 0x10000) >> 0x10;
    scaleX = this->width / (pBVar6->dat).Width;
    scaleY = this->height / (pBVar6->dat).Height;
    lVar9 = this->boundX0;
    if (this->boundX0 < x0) lVar9 = x0;
    lVar12 = this->boundX1;
    if (x1 < this->boundX1) lVar12 = x1;
    lVar13 = this->boundY0;
    if (this->boundY0 < y0) lVar13 = y0;
    lVar15 = this->boundY1;
    if (y1 < this->boundY1) lVar15 = y1;
    if ((((lVar9 <= iVar14) && (lVar13 <= iVar8)) && (lVar10 <= lVar12)) && (lVar11 <= lVar15)) {
      if (lVar10 < lVar9) {
        lVar16 = (int)((float)((int)lVar9 - (int)sVar2) / scaleX);
        lVar10 = lVar9;
      }
      if (lVar12 < iVar14) {
        height = (longlong)
                 (((int)sVar4 - (int)((float)(iVar14 - (int)lVar12) / scaleX)) * 0x10000 >> 0x10);
      }
      if (lVar11 < lVar13) {
        lVar17 = (int)((float)((int)lVar13 - (int)sVar3) / scaleY);
        lVar11 = lVar13;
      }
      if (lVar15 < iVar8) {
        width = (longlong)
                (((int)sVar5 - (int)((float)(iVar8 - (int)lVar15) / scaleY)) * 0x10000 >> 0x10);
      }
      if (((lVar16 < height) && (lVar17 < width)) && (0.0 < (float)(this->col).A * fadeFloatMirror))
      {
        g = N64BorgImageDraw(g,this->borg8,(float)(int)lVar10,(float)(int)lVar11,(short)lVar16,
                             (short)lVar17,(u16)height,(u16)width,scaleX,scaleY,col.R*fadeFloatMirror,
                             col.G*fadeFloatMirror,col.B*fadeFloatMirror,col.A*fadeFloatMirror);
      }
    }
  }
  RENDERCHILDREN();
}

u8 WidgetBorg8::Tick(){return TickChildren();}
u32 WidgetBorg8::GetNumber(){return 4;}