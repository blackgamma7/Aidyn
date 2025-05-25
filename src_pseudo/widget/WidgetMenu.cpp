#include "widgets/WidgetMenu.h"

WidgetMenu::WidgetMenu():BaseWidget(){
    x=0;
    y=0;
    width=0;
    height=0;
    substruct=NULL;
    state=1;
}

WidgetMenu::~WidgetMenu(){BaseWidget::~BaseWidget();}

Gfx* WidgetMenu::Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1){
    RENDERCHILDREN();
}

u8 WidgetMenu::Tick(){
    TickChildren();
}

u32 WidgetMenu::GetNumber(){return WidgetN_Menu;}