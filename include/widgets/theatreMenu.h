#include "widgets/Utilities.h"

class TheatreMenu:public WidgetMenu{
    public:
    TheatreMenu();
    ~TheatreMenu();
    void InitMenu();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    u8 Tick();
    void AddAvailableCinematics(char*);
    void LoadOptionStrings();
    u32 GetNumber();
};
struct TMSub{
    WidgetScrollMenu* scroll;
};

BaseWidget* TheatreMenu_LeftFunc(BaseWidget*,BaseWidget*);
BaseWidget* TheatreMenu_RightFunc(BaseWidget*,BaseWidget*);
BaseWidget* TheatreMenu_UpFunc(BaseWidget*,BaseWidget*);
BaseWidget* TheatreMenu_DownFunc(BaseWidget*,BaseWidget*);
BaseWidget* TheatreMenu_BFunc(BaseWidget*,BaseWidget*);
BaseWidget* TheatreMenu_AFunc(BaseWidget*,BaseWidget*);
BaseWidget* TheatreMenu_LeftFunc(BaseWidget*,BaseWidget*);
BaseWidget * choose_cinematic(BaseWidget *,BaseWidget *);
BaseWidget* TheatreMenu_StartFunc(BaseWidget*,BaseWidget*);

struct theatreFlag{
    u16 flag;
    u8 cinematic;
    u8 pad;
};