#include "widgets/BaseWidget.h"

//used by journal and shops to handle scroll menus(?)
class WidgetChild0 : public BaseWidget{
    BaseWidget* scrollMenu;
};

struct WidgetChild0_Substruct{
    BaseWidget* unk0;
    BaseWidget* unk4;
    u8 bottom;
};