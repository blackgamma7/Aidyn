#include "widgets/WidgetMenu.h"
#include "widgets/DollMenu.h"
#include "widgets/handler.h"
#include "widgets/optionsMenu.h"
#include "widgets/Calendar.h"

u16 pause_menu_borg8[]={BORG8_PauseMenuA,BORG8_PauseMenuB,BORG8_PauseMenuC};
float scroll_floats[]={27.0,0,-26.0,0};
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
    u32 isScrolling;
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

void InitPauseMenu(void);
bool set_screenshot_tint(void);
Gfx * draw_screenshot_background(Gfx *g,u8 state);
u8 ScreenFadeMode_3(Gfx **GG);
int FUN_800505f4();
void func_clearing_shopkeep(void);
void FUN_80050868(void);
void FUN_800508b4(u16 x);
void setGlobalsPointer(BaseWidget*);
void passto_getSnapshot();
void set_shopkeep_skills(CharSkills *sk,SpellBook *sp);
void build_loot_menu(GenericInventory *loot,int gold,ItemID keep);