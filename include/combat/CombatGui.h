#include "widgets/WidgetBorg8Combat.h"

struct CombatPortrait {
    WidgetBorg8Combat *basePortait; /* same as dialouge's */
    WidgetBorg8Combat *Overlay; /* crossbones */
    ItemID Owner;
    u8 cEntIndex;
    u8 unkb;
    u32 unkc;
    u8 blipIndex;
    u32 unk14;
};

struct CombatRadarBlip {
    WidgetBorg8Combat *widget;
    short unk4;
    short unk6;
    short unk8;
    short unka;
    int unkc;
    u32 unk10;
    int unk14;
};

void combat_gui_init();
void combatgui_free();
Gfx * FUN_8008f6e4(Gfx *g,u8 delta);
void init_combatgui_struct(ItemID param_1,u8 param_2,u8 param_3);
void pass_to_draw_crossbones(ItemID param_1,char param_2);
void flee_draw_crossbones(ItemID param_1,char param_2);
void draw_crossbones_2(ItemID param_1,char param_2,u32 borgId,int param_4);
void draw_dead_crossbones(ItemID param_1);
void FUN_8008fb3c(u8 delta);
Gfx * FUN_8008fb64(Gfx *param_1,u8 param_2);
void make_combat_portrait(CombatPortrait *portrait,ItemID id,u8 count,u32 param_4);
void combat_gui_init_2(BaseWidget *param_1,u8 param_2,u8 param_3);
void draw_radar_blip(u16 param_1,BaseWidget *param_2,short param_3,short param_4,short param_5,
                    u32 param_6,short param_7,short param_8,u32 param_9,short param_10,u32 param_11);
WidgetBorg8Combat *
ConstructWidgetBorg8Combat(BaseWidget *parent,Borg8Header *img,short x,short y,u32 param_5);
u8 get_combat_gui_index_(int param_1);
void FUN_80090174(u8 param_1,CombatPortrait *param_2);
void FUN_80090404();
void FUN_800904c8();
void FUN_80090568();
void FUN_80090634();
void three_combat_gui_funcs();
Gfx * CombatDrawHealthbar(Gfx *g,u32 delta);
void draw_crossbone(CombatPortrait *param_1,u32 param_2);
