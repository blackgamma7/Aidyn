#include "widgets\WidgetMenu.h"


class WidgetScrollMenu : public BaseWidget{
public:
WidgetScrollMenu(u16 length);
Gfx * Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1);
u8 Tick();
u32 GetNumber();
u8 Append(BaseWidget* entry);
u8 Remove(BaseWidget* entry);
u8 SetFlags(u8 f);
};

//scroll menu substruct used by WidgetScrollMenu and WidgetFastScrollMenu
struct WSMSub {
    u8 field0_0x0;
    u8 field1_0x1;
    u8 reds[2];
    u8 blues[2];
    u8 greens[2];
    u8 alphas[2];
    u8 blendA;
    u8 blendB;
    Color32 col;
    u8 field13_0x10;
    u8 field14_0x11;
    u16 field11_0x12;
    u8 field16_0x14;
    u8 field17_0x15;
    u16 field14_0x16;
    BaseWidget** items;
    short field16_0x1c;
    u16 highlight;
    u16 currentCount;
    u8 field_0x22;
    u8 flag;
};

BaseWidget* WSM_UpFunc(BaseWidget*,BaseWidget*);
BaseWidget* WSM_DownFunc(BaseWidget*,BaseWidget*);
BaseWidget* WSM_AFunc(BaseWidget*,BaseWidget*);
BaseWidget* WSM_LeftFunc(BaseWidget*,BaseWidget*);
BaseWidget* WSM_RightFunc(BaseWidget*,BaseWidget*);