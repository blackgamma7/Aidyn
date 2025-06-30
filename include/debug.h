#include "widgets/Utilities.h"
#include "itemInstances.h"

struct DebugMapLabel {
    u16 a;
    u16 b;
    u16 c;
    char *label;
};

extern DebugMapLabel debugMapLabels[];

struct DebugCharChanger {
    u32 borg7;
    float f;
    char *label;
};

extern DebugCharChanger debugCharacters[];

class WidgetDebugBig: public WidgetMenu {
    public:
    WidgetScrollMenu *scrollMenu;
    void ExecOption();
    WidgetDebugBig();
    ~WidgetDebugBig();
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    void AddEntry(u16);
    void ExecOption(BaseWidget*);
};

extern u32 gZoneEngineHide;
extern WidgetDebugBig* WidgetDebugBigPointer;
extern void(*debug_menu_funcs[])(void);
void init_big_debug_menu();
void WDBBigExecOption(BaseWidget *param_1);
void debug_gamestatefunnel();
void debug_clear_inventory();
void toggle_enemies_hostile();
void toggle_only_tp_active();
void bad_ref_obj_hunt();
void load_credits_instead();
void debug_accessDB();
void debug_freeDBMenu(BaseWidget *param_1);

//only vTable ,control methods and destructor remaining.
class UnkWidget: public WidgetMenu{
    public:
    WidgetScrollMenu* scrollMenu;
    ~UnkWidget();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
};

class WidgetItemDBItem :public UnkWidget{
    public:
    WidgetItemDBItem(u16);
    ~WidgetItemDBItem();
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    void Append(char*,ItemID);
};
class WidgetItemDB: public UnkWidget{
    public:
    u32 unk80;
    WidgetItemDB();
    ~WidgetItemDB();
    BaseWidget* AFunc();
    BaseWidget* BFunc();
};

struct WidgetCameraDebugSub{
    u16 stringIndex;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
};

class WidgetCameraDebug: public WidgetMenu {
    public:
    BaseWidget *scrollMenu;
    u16 currRefpoint;
    WidgetCameraDebugSub Arr[14];
    undefined field75_0xd6;
    undefined field76_0xd7;
    WidgetCameraDebug();
    ~WidgetCameraDebug();
    BaseWidget* AFunc();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    BaseWidget* CUpFunc();
    BaseWidget* CDownFunc();

};
class WidgetCDMenuB: public WidgetMenu{
    WidgetText* txt;
    u16 val;
    u8 cmd;
    u8 b;
    WidgetCDMenuB(u8 C, u8 B,u16 V);
    ~WidgetCDMenuB();
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    BaseWidget* CUpFunc();
    BaseWidget* CDownFunc();
};
class WidgetCDMenuActor: public WidgetMenu{
    WidgetScrollMenu* scrollMenu;
    u8 val;
    u8 cmd;
    WidgetCDMenuActor(u8 CMD, u8 VAL);
    ~WidgetCDMenuActor();
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
    BaseWidget* CUpFunc();
    BaseWidget* CDownFunc();
};


//debug Small menu options

BaseWidget * SmallerDebugWidgetUpFunc(BaseWidget *param_1,BaseWidget *param_2);
BaseWidget * SmallerDebugWidgetLeftFunc(BaseWidget *param_1,BaseWidget *param_2);
BaseWidget * SmallerDebugWidgetDownFunc(BaseWidget *param_1,BaseWidget *param_2);
BaseWidget * SmallerDebugWidgetRightFunc(BaseWidget *param_1,BaseWidget *param_2);
BaseWidget * SmallerDebugWidgetAFunc(BaseWidget *param_1,BaseWidget *param_2);
BaseWidget * SmallerDebugWidget_ret_a1(BaseWidget *param_1,BaseWidget *param_2);
BaseWidget * DebugTerrainChangePlus(BaseWidget * param_1,BaseWidget *param_2);
BaseWidget * DebugTerrainChangeMinus(BaseWidget * param_1,BaseWidget *param_2);

void smaller_debug_menu();
void debug_combat_options(BaseWidget *param_1);
bool create_enemy_list();
void DebugSingleEnemyFight(BaseWidget *param_1);
bool DebugCombatSelectArena();
void set_debug_combat_battlefeild(BaseWidget *param_1);
bool change_actor_menu();
void DebugChangeForm(BaseWidget *param_1);
bool DebugTeleportMenu();
void DebugTeleport(BaseWidget *param_1);
