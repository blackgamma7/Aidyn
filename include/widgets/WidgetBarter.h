#include "widgets/Utilities.h"
#include "widgets/WidgetTrainShop.h"

class WidgetBarter: public WidgetMenu{
    u8 partyPicker;
    undefined field2_0x7d;
    undefined field3_0x7e;
    undefined field4_0x7f;
    WidgetInvShop *field5_0x80;
    WidgetTrainShop *field6_0x84;
    WidgetTrainShop *description;
    u8 invType;
    undefined field9_0x8d;
    undefined field10_0x8e;
    undefined field11_0x8f;
    BaseWidget *background;
    WidgetClipText *goldText;
    u32 unk98;
};