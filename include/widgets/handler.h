#include "widgets/BaseWidget.h"


class WidgetHandler{
    public:
    BaseWidget* head;
    BaseWidget* tail;
    u8 Init(FontStruct*);
    void Free(u32); //may just be destructor
    u8 Tick(u8);
    u8 StopWidget(BaseWidget*);
    BaseWidget * Control(ControllerFull *);
    u8 AddWidget(BaseWidget *);
    BaseWidget * RemoveWidget();
    BaseWidget * GetTail();
    u8 FreeWidget(BaseWidget *);
    Gfx* Render(Gfx*,u16,u16,u16,u16);
};

#define WHANDLE gGlobals.widgetHandler