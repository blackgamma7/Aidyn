#include "widgets/WidgetMenu.h"
#include "widgets/WidgetScrollMenu.h"

//May have controlled map objects by type, but does nothing in final debug.
class WidgetDebugDummyToggle:WidgetMenu{
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

u32 unused_bitfeild=0xFFFFFFAE;
BaseWidget* PTR_800e61e4=NULL;
char* On_or_off_strings[2]={"On","Off"};