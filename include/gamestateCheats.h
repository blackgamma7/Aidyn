#include "widgets\WidgetMenu.h"
#include "widgets\WidgetText.h"
#include "widgets\WidgetScrollMenu.h"

class WidgetGameStateCheats : public WidgetMenu {
    public:
    WidgetScrollMenu* ScrollA;
    WidgetScrollMenu* ScrollB;
    WidgetScrollMenu* ScrollC;
    WidgetGameStateCheats();
    ~WidgetGameStateCheats();
    BaseWidget* AFunc();
    BaseWidget* BFunc();
    BaseWidget* ZFunc();
    BaseWidget* UpFunc();
    BaseWidget* DownFunc();
};

u32 gamestate_cheats1=0;
u32 gamestate_cheats2=0;
char** debug_state_labels=NULL;
char** bool_labels=NULL;
char** on_off_labels=NULL;
u32 bitfeild_array[]={
    1<<0,1<<1,1<<2,1<<3,1<<4,1<<5,1<<6,1<<7,1<<8,1<<9,1<<10,
    1<<11,1<<12,1<<13,1<<14,1<<15,1<<16,1<<17,1<<18,1<<19,1<<20,
    1<<21,1<<22,1<<23,1<<24,1<<25,1<<26,1<<27,1<<28,1<<29,1<<30,
    1<<31
};

u8 gamestate_cheat_check1(u8 param_1);
u8 gamestate_cheat_check2(GameState_Cheat param_1);
void FUN_8003316c(WidgetGameStateCheats *param_1);

typedef enum GameState_Cheat { /* Set in big Debug Menu */
    STATECHEAT_All,
    STATECHEAT_appear,
    STATECHEAT_check,
    STATECHEAT_teleportLock,
    STATECHEAT_teletrap,
    STATECHEAT_teleportSecret,
    STATECHEAT_containerOpen,
    STATECHEAT_containerExplode,
    STATECHEAT_monsterCheck,
    STATECHEAT_dialougeTrigger,
    STATECHEAT_trigger,
    STATECHEAT_referenceObject
} GameState_Cheat;

#ifdef DEBUGVER
#define checkCheat(cheat) if(gamestate_cheat_check1(STATECHEAT_##cheat)) return gamestate_cheat_check2(STATECHEAT_##cheat)
#else
#define checkCheat(cheat) ;
#endif