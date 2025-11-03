#include "widgets/BaseWidget.h"

struct WidgetGroupItem {
    BaseWidget *w;
    u16 x;
    u16 y;
    u32 tint;
};

class WidgetGroup:public BaseWidget {
    public:
    WidgetGroupItem *group;
    u16 groupMax;
    u16 groupCount;
    u32 ticked;
    WidgetGroup(u16 max);
    ~WidgetGroup();
    u32 GetNumber();
    u8 Tick();
    Gfx* Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1);
    u16 GetWidth();
    u16 GetHeight();
    BaseWidget* GetEntry(u16);
    void AddToGroup(BaseWidget *w,u16 px,u16 py,u32 tint);
    void Remove(BaseWidget *w);
    void Move(u16 entry, u16 px,u16 py);
};