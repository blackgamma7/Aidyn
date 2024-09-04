#include "widgets/WidgetMenu.h"
#include "widgets/WidgetBorg8.h"
#include "widgets/WidgetClipText.h"

class WidgetMenuChild2 : public WidgetMenu {
u8 partySize;
u8 selectedMember;
WidgetBorg8* portraits[4];
WidgetClipText* names[4];
u8 unka0[0x10]; // another widget of party details?
WidgetBorg8* aspectIcon;
WidgetBorg8* schoolIcon;
unkGuiSubstruct unkb8;
};