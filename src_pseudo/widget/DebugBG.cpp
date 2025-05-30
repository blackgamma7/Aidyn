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
  s16 px0 = this->x;
  s16 py0 = this->y;
  s16 py1 = this->height + this->y;
  s16 px1 = this->width + (int)this->x;
  s16 bx0 = this->boundX0;
  if (this->boundX0 < (int)x0) bx0 = x0;
  s16 bx1 = this->boundX1;
  if (x1 < this->boundX1) bx1 = x1;
  s16 by0 = this->boundY0;
  if (this->boundY0 < (int)y0) by0 = y0;
  s16 by1 = this->boundY1;
  if (y1 < this->boundY1) by1 = y1;
  if ((((bx0 <= x1) && (by0 <= y1)) && (x0 <= bx1)) && (y0 <= by1)) {
    FLOOR(px0,bx0);
    FLOOR(py0,by0);
    CIEL(px1,bx1);
    CIEL(py1,by1);
    if (px0 == px1) px1++;
    if (py0 == py1) py1++;
    if (0.0 < (float)(this->col).A * fadeFloatMirror) {
      g = DrawRectangle(g,px0,py0,px1,py1,col.R*fadeFloatMirror,col.G*fadeFloatMirror,col.B*fadeFloatMirror,col.A*fadeFloatMirror);
    }
  }
  RENDERCHILDREN();
}

u8 WidgetDebugBG::Tick(){TickChildren();}

u32 WidgetDebugBG::GetNumber(){return 5;}
