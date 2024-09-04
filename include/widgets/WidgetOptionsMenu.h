#include "widgets/WidgetMenu.h"

class WidgetOptionsMenu : public WidgetMenu{
    byte alpha0;
    byte alpha1;
    u16 unk7e; // may be align
};


struct WidgetOptionsSubstruct {
    BaseWidget *ScrollMenu;
    BaseWidget *theatreMenu;
    BaseWidget *optionsConfig;
    u32 unkc;
    BaseWidget *unk10;
    BaseWidget *unk14;
    u8 unk18;
};