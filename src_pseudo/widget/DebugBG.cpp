#include "widgets/DebugBG.h"

WidgetDebugBG::WidgetDebugBG():BaseWidget(){
    //makes then destroys a copy?!?
    WidgetDebugBG wtf= WidgetDebugBG(0,0,0,250);
    wtf.~WidgetDebugBG();
}

WidgetDebugBG::WidgetDebugBG(u8 r,u8 g, u8 b, u8 a):BaseWidget(){
  this->width = 0x20;
  this->height = 0x20;
  this->x = 144;
  this->y = 104;
  this->SetColor(r,g,b,a);
}

WidgetDebugBG::~WidgetDebugBG(){BaseWidget::~BaseWidget();}


Gfx * WidgetDebugBG::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  s16 lVar3;
  s16 lVar4;
  s16 lVar5;
  s16 lVar6;
  s16 lVar7;
  s16 lVar8;
  s16 lVar9;
  s16 lVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  
  lVar4 = this->x;
  lVar10 = this->y;
  lVar3 = this->height + this->y;
  lVar5 = this->width + (int)this->x;
  lVar6 = this->boundX0;
  if (this->boundX0 < (int)x0) lVar6 = (int)x0;
  lVar8 = this->boundX1;
  if (x1 < this->boundX1) lVar8 = x1;
  lVar7 = this->boundY0;
  if (this->boundY0 < (int)y0) lVar7 = (int)y0;
  lVar9 = this->boundY1;
  if (y1 < this->boundY1) lVar9 = y1;
  if ((((lVar6 <= lVar5) && (lVar7 <= lVar3)) && (lVar4 <= lVar8)) && (lVar10 <= lVar9)) {
    if (lVar4 < lVar6) lVar4 = lVar6;
    if (lVar10 < lVar7) lVar10 = lVar7;
    if (lVar8 < lVar5) lVar5 = lVar8;
    if (lVar9 < lVar3) lVar3 = lVar9;
    if (lVar4 == lVar5) lVar5++;
    if (lVar10 == lVar3) lVar3++;
    if (0.0 < (float)(this->col).A * fadeFloatMirror) {
      g = gsFadeInOut(g,(u16)lVar4,(u16)lVar10,(u16)lVar5,(u16)lVar3,
        col.R*fadeFloatMirror,col.G*fadeFloatMirror,col.B*fadeFloatMirror,col.A*fadeFloatMirror);
    }
  }
  RENDERCHILDREN();
}

u8 WidgetDebugBG::Tick(){TickChildren();}

u32 WidgetDebugBG::GetNumber(){return 5;}
