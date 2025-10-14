#include "globals.h"

//game.cpp

void init_DBs();
void clear_DBs();
void some_init_func();
void passto_clear_dbs();
u32 appState_1(Gfx **GG);
u8 func_loading_credits(Gfx **GG);


//gametrek.cpp

bool check_some_toggle();
void FUN_80024c54(short);
Gfx * ofunc_80024c90(Gfx *);
u8 screenFadeMode_1_9(Gfx **);
bool GetDelta_TickTrek(Gfx **);
bool isPaused();
void player_control_func(controller_aidyn *);
void small_debug_menu_check(controller_aidyn *);
void Ofunc_80025724(void *,u32 );
bool GetSnapshot_();
void some_flycam_dat_func(flycamStruct *,Camera_struct *,vec3f *,vec3f *);
Gfx * draw_hud_elements(Gfx *);
Gfx * zoneEngine_debug(Gfx *,u8);
void TickGameTime(byte );
void func_calling_orphaned_dat(byte);
Gfx * tick_trek_features(Gfx *,u8 );
void SetNewJounalEntry(s16);
void NewJournalEntryPopup();

void initGameTrek();
void clear_HUD_elements(short );

Gfx* tick_and_render_widgets(Gfx*);