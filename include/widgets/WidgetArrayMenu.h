#include "widgets\BaseWidget.h"

//WidgetArrayMenu's substruct
struct WAMSub {
    BaseWidget **entries;
    u16 entryCap;
    u16 entryPos;
    u16 vSpace;
    u16 rowSize;
    u16 entryCount;
    u8 unke[2];
    u16 yOff; //vertical offset for menu. default 0.
};

//2d Array of items. used for name entry.
class WidgetArrayMenu: public BaseWidget{
    public:
    WidgetArrayMenu(u16);
    ~WidgetArrayMenu();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    u8 Tick();
    u8 AddEntry(BaseWidget*);
    u8 RemoveEntry(BaseWidget*);
    u32 GetNumber();
};

