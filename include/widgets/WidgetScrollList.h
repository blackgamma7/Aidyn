#include "widgets/BaseWidget.h"

// Widget used to list journal entries.
class WidgetScrollList : public BaseWidget{
    public:
    WidgetScrollList(u8 length);
    ~WidgetScrollList();
    Gfx* Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1);
    u8 Tick();
    u8 AddEntry(BaseWidget *entry);
    u8 RemoveEntry(BaseWidget *entry);
    u32 GetNumber();
};
//substruct for WidgetScrollList
struct WSLSub {
    u8 unk0;
    u8 unk1; //set to 32, never read
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    BaseWidget** items;
    u8 itemMax;
    u8 itemHighlight;
    u8 itemCount;
    u8 unk13;
};

BaseWidget* WSL_UpFunc(BaseWidget*,BaseWidget*);
BaseWidget* WSL_DownFunc(BaseWidget*,BaseWidget*);
BaseWidget* WSL_AFunc(BaseWidget*,BaseWidget*);
BaseWidget* WSL_LeftFunc(BaseWidget*,BaseWidget*);
BaseWidget* WSL_RightFunc(BaseWidget*,BaseWidget*);