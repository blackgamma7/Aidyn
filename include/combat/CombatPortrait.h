#include "widgets/WidgetBorg8Combat.h"

struct CombatPortrait {
    WidgetBorg8Combat *basePortait; /* same as dialouge's */
    WidgetBorg8Combat *Overlay; /* crossbones */
    ItemID Owner;
    u8 cEntIndex;
    u8 unkb;
    u32 unkc;
    u8 blipIndex;
    u32 unk14;
};