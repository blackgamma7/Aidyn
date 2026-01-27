#include "widgets/WidgetMenu.h"
#include "widgets/WidgetScrollMenu.h"

//May have controlled map objects by type, but does nothing in final debug.
class WidgetDebugDummyToggle:public WidgetMenu{
    public:
    WidgetScrollMenu* scrollMenu;
    WidgetDebugDummyToggle();
    ~WidgetDebugDummyToggle();
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    u8 Tick();
};

void OpenUnusedDebugToggle();