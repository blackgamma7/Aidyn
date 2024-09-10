#include "widgets/WidgetClipText.h"

class SMStatItem : public BaseWidget{
    CharStats *stats;
    BaseWidget *field2_0x80; //unknown, doesn't seem to be set.
    WidgetClipText *baseLevel;
    WidgetClipText *modDiff;
    WidgetClipText *statName;
    u16 field6_0x90;
    u16 field7_0x92;
};