#include "widgets/BaseWidget.h"

// Widget used to list journal entries.
class WidgetScrollList : public BaseWidget{};

struct WidgetScrollList_Substruct {
    u8 unk0;
    u8 unk1; //set to 32, never read
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    BaseWidget** items;
    u8 itemMax;
    u8 itemHighlight;
    u8 itemCount;
};