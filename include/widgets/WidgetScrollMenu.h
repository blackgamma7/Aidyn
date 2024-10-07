#include "widgets\WidgetMenu.h"


class WidgetScrollMenu : public WidgetMenu{
public:
WidgetScrollMenu(u32 length);
u8 Append(BaseWidget* entry);
u8 Remove(BaseWidget* entry);
};

struct WidgetScrollMenuSubstruct {
    u8 field0_0x0;
    u8 field1_0x1;
    u8 field2_0x2;
    undefined field3_0x3;
    u8 field4_0x4;
    undefined field5_0x5;
    undefined field6_0x6;
    undefined field7_0x7;
    undefined field8_0x8;
    undefined field9_0x9;
    undefined field10_0xa;
    undefined field11_0xb;
    Color32 col;
    undefined field13_0x10;
    undefined field14_0x11;
    u16 field15_0x12;
    undefined field16_0x14;
    undefined field17_0x15;
    u16 field18_0x16;
    BaseWidget** items;
    short field20_0x1c;
    u16 field21_0x1e;
    u16 field22_0x20;
    undefined field23_0x22;
    undefined field24_0x23;
};