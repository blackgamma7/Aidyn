#include "widgets/WidgetMenu.h"
#include "widgets/WidgetBorg8.h"

class WidgetCinematicText: public WidgetMenu{
    public:
    BaseWidget* text;
    BaseWidget* field2_0x80;
    BaseWidget* gradient;
    ushort dimensions[4];
    short field5_0x90;
    short field6_0x92;
    u32 field7_0x94;
    void SetText(char* txt);
};