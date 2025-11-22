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
void FUN_80024c54(s16);
Gfx * ofunc_80024c90(Gfx *);
u8 screenFadeMode_1_9(Gfx **);
bool GetDelta_TickTrek(Gfx **);
bool isPaused();
void player_control_func(controller_aidyn *);
void small_debug_menu_check(controller_aidyn *);
void Ofunc_80025724(void (*param_1)(u32),u32 param_2);
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
void clear_HUD_elements(u16 );

Gfx* tick_and_render_widgets(Gfx*);

extern u32 gametrek_flag0;

u8 orphanedByte=0;
void(*orphanedfuncPointer)(u32)=NULL;
u32 OrphanedFuncArg=0;
s16 newestJournal=-1;
u32 some_ticker=0;
s16 some_toggle=0;
u8 gTrekUninitted=true;
u8 DAT_800e9aa7=0;
u8 gMemMakerFlag=false;
u16 gDelta=1;
u32 DAT_800e9aac=1;
u32 DAT_800e9ab0=0;
u16 DAT_800e9ab4=0;