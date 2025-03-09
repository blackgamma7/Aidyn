#include "widgets\BaseWidget.h"

//WidgetArrayMenu's substruct
struct WAMSub {
    BaseWidget **entries;
    u16 entryCap;
    u16 entryPos;
    u16 entryX;
    u16 entryY;
    u16 entryCount;
    undefined field6_0xe;
    undefined field7_0xf;
    u16 unk10;
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

