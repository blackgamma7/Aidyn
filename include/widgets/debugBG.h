#include "widgets/BaseWidget.h"

class WidgetDebugBG: public BaseWidget{
    public:
    WidgetDebugBG();
    WidgetDebugBG(u8,u8,u8,u8);
    ~WidgetDebugBG();
    Gfx * Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
    u8 Tick();
    u32 GetNumber();
};