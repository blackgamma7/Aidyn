#include "widgets/WidgetMenu.h"
#include "widgets/DollMenu.h"
#include "widgets/handler.h"

//Widget showing pause menu aka "BigAssMenu"
class PauseWidget: public WidgetMenu{
    public:
    u32 handlerBool;
    WidgetHandler* Handler;
    PauseWidget(WidgetHandler*,u8);
    ~PauseWidget();
    u32 BigAssMenu(WidgetHandler*,u8);
    void bigAssOpenCallback_2();
    void InitOptionsMenu();
    void BuildDollMenu(u8);
    void BuildCalendarMenu();
    void m8003636c();
    void m8003639c();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    u8 Tick();
    BaseWidget* Control(controller_aidyn*);
    u32 GetNumber();
};

//PauseWidget->substruct
struct pause_Substruct {
    struct WidgetOptionsMenu *optionsMenu;
    WidgetDollMenu *dollmenu;
    struct WidgetCalendar *calendar;
    BaseWidget *pauseMenuSections[3];
    BaseWidget *backgroundWidget;
    BaseWidget *field5_0x1c;
    char PauseMenuSection;
    s16 unk22;
    s16 unk24;
    s16 unk26;
    SceneData *sceneDat;
    float scrollSpeed;
    Borg7Header *borg7;
    vec3f camPos;
    float scrollfloat;
    u8 unk44[8];
    u32 takeInput;
};

#define PauseSub ((pause_Substruct*)gGlobals.BigAssMenu->substruct)

u8 bigAssOpenCallback_1(PauseWidget*);
u8 PauseMenuClose1(PauseWidget*);
u8 bigAssOpenCallback(PauseWidget*);
u8 PauseMenuClose2(PauseWidget*);

BaseWidget * bigAssMenu_LZFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_RFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_LeftFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_RightFunc(BaseWidget *,BaseWidget *);
