#include "widgets/WidgetMenu.h"
#include "widgets/DollMenu.h"
#include "widgets/handler.h"
#include "widgets/optionsMenu.h"
#include "widgets/Calendar.h"

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
    void FreeFromHandler();
    void AddToHandler();
    Gfx* Render(Gfx*,u16,u16,u16,u16);
    u8 Tick();
    BaseWidget* Control(controller_aidyn*);
    u32 GetNumber();
};

//PauseWidget->substruct
struct pause_Substruct {
    WidgetOptionsMenu *optionsMenu;
    WidgetDollMenu *dollmenu;
    WidgetCalendar *calendar;
    BaseWidget *pauseMenuSections[3];
    BaseWidget *backgroundWidget;
    WidgetBorg8 *backgroundImage;
    u8 PauseMenuSection;
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

u8 bigAssOpenCallback_1(BaseWidget*);
u8 PauseMenuClose1(BaseWidget*);
u8 bigAssOpenCallback(BaseWidget*);
u8 PauseMenuClose2(BaseWidget*);

BaseWidget * bigAssMenu_LZFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_RFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_LeftFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_RightFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_UpFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_DownFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_CLeftFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_CRightFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_CUpFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_CDownFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_BFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_AFunc(BaseWidget *,BaseWidget *);
BaseWidget * bigAssMenu_StartFunc(BaseWidget *,BaseWidget *);