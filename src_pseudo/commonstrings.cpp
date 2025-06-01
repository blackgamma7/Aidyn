#include "globals.h"
#include "romstring.h"
#include "combat/CombatStruct.h"
//TODO: add the other pointers to their appropriate scripts
extern char** spell_error_labels;
extern char** debug_switch_labels;
extern char** debug_switch_labels;
extern char** cheatStatus_labels;
extern char** task_failue_labels;
extern char** on_off_labels;
extern char**   debug_state_labels;
extern char** boolean_labels;
extern char** bool_labels;

//load CommonString RomString
char** commonstrings=NULL;
void CommonStrings::Init(void){
  gGlobals.CommonStrings  = RomString::Load(common_string_array,0x2830);
  commonstrings = gGlobals.CommonStrings;
  encounterType_labels = gGlobals.CommonStrings + 0xea;
  walking_labels = gGlobals.CommonStrings + 0xed;
  element_labels = gGlobals.CommonStrings + 0xf1;
  spell_error_labels = gGlobals.CommonStrings + 0x102;
  skill_strings = gGlobals.CommonStrings + 0x10f;
  weapon_strings = gGlobals.CommonStrings + 0x11b;
  aspect_labels = gGlobals.CommonStrings + 0x126;
  magic_school_labels = gGlobals.CommonStrings + 0x129;
  Stat_labels = gGlobals.CommonStrings + 0x12f;
  humidity_labels = gGlobals.CommonStrings + 0x136;
  timeofday_labels = gGlobals.CommonStrings + 0x139;
  moon_phase_labels = gGlobals.CommonStrings + 0x13e;
  dark_storm_labels = gGlobals.CommonStrings + 0x142;
  weekday_labels = gGlobals.CommonStrings + 0x148;
  terrain_labels = gGlobals.CommonStrings + 0x14f;
  precip_labels = gGlobals.CommonStrings + 0x157;
  ground_labels = gGlobals.CommonStrings + 0x15a;
  price_strings = gGlobals.CommonStrings + 0x180;
  #ifdef DEBUGVER
  debug_switch_labels = gGlobals.CommonStrings + 0x2f;
  boolean_labels = gGlobals.CommonStrings + 0x1d;
  cheatStatus_labels = gGlobals.CommonStrings + 0x26;
  #endif
  task_failue_labels = gGlobals.CommonStrings + 0x58;
  equip_error_labels = gGlobals.CommonStrings + 0x5f;
  #ifdef DEBUGVER
  on_off_labels = gGlobals.CommonStrings + 0x77;
  debug_state_labels = gGlobals.CommonStrings + 0x6b;
  bool_labels = gGlobals.CommonStrings + 0x1d;
  #endif
}
//Free CommonString RomString
void CommonStrings::Free(void){
  if (gGlobals.CommonStrings) {
    RomString::Free(gGlobals.CommonStrings);
    commonstrings = NULL;
	#ifdef DEBUGVER
    debug_switch_labels = NULL;
    boolean_labels = NULL;
    cheatStatus_labels = NULL;
	#endif
    task_failure_labels = NULL;
    equip_error_labels = NULL;
	#ifdef DEBUGVER
    debug_state_labels = NULL;
	#endif
    gGlobals.CommonStrings = NULL;
	#ifdef DEBUGVER
    on_off_labels = NULL;
    bool_labels = NULL;
	#endif
  }
}
