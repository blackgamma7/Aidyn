#include "widgets/BaseWidget.h"
#include "font.h"


class WidgetHandler{
    private:
    BaseWidget* head;
    BaseWidget* tail;
    public:
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