#include "widgets/WidgetBorg8.h"

//radar show friends/foes on battlefield.
class WidgetCombatRadar: public BaseWidget{
    public:
    WidgetBorg8* compass;
    s16 unk80;
    s8 unk82;
    WidgetCombatRadar();
    ~WidgetCombatRadar();
    u8 Tick();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    u32 GetNumber();
};

