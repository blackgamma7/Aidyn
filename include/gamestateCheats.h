#pragma once
#include "widgets/WidgetMenu.h"
#include "widgets/WidgetText.h"
#include "widgets/WidgetScrollMenu.h"

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

extern u32 gamestate_cheats1;
extern u32 gamestate_cheats2;
extern char** debug_state_labels;
extern char** bool_labels;
extern char** on_off_labels;
extern u32 bitfeild_array[];

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

void gamestste_cheats(void);
u8 gamestate_cheat_check1(u8 param_1);
u8 gamestate_cheat_check2(GameState_Cheat param_1);
void FUN_8003316c(WidgetGameStateCheats *param_1);

#if DEBUGVER
#define checkCheat(cheat) if(gamestate_cheat_check1(STATECHEAT_##cheat)) return gamestate_cheat_check2(STATECHEAT_##cheat)
#else
#define checkCheat(cheat) ;
#endif