#include "widgets/BaseWidget.h"

//used by journal and shops to handle scroll menus(?)
class WidgetScrollArrows : public BaseWidget{
    public:
    BaseWidget* scrollMenu;
    WidgetScrollArrows(BaseWidget *scroll,BaseWidget *arrowA,BaseWidget *arrowB,u16 h);
    ~WidgetScrollArrows();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    u8 Tick();
    u32 GetNumber();
};

struct WSA_Sub{
    BaseWidget* arrowA;
    BaseWidget* arrowB;
    u8 bottom;
};