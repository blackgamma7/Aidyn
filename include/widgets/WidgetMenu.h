#include "widgets/BaseWidget.h"

// Menu Widget base class
class WidgetMenu : public BaseWidget {
    public:
    Gfx* Render(Gfx*, u16, u16, u16, u16);
    u8 Tick();
    u32 GetNumber();
};