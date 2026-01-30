#include "globals.h"
#include "romstring.h"
#include "gameStateMod.h"
#include "gameStateCheats.h"
#include "combat/CombatStruct.h"


char** commonstrings=NULL;
extern void* common_string_array;
//load CommonString RomString
void CommonStrings::Init(void){
  gGlobals.CommonStrings  = RomString::Load(common_string_array,0x2830);
  commonstrings = gGlobals.CommonStrings;
  encounterType_labels = &Cstring(EncounterRand);
  walking_labels = &Cstring(AniStop);
  element_labels =  &Cstring(ElementNone);
  Spell_error_labels = &Cstring(Ok05);
  skill_strings = &Cstring(SkillAlchemist);
  weapon_strings = &Cstring(WeaponBite);
  aspect_labels = &Cstring(AspectNone);
  magic_school_labels = &Cstring(SchoolChaos);
  Stat_labels = &Cstring(StatINT);
  humidity_labels = &Cstring(HumidNone);
  timeofday_labels = &Cstring(TimeOfDayDawn);
  moon_phase_labels = &Cstring(MoonPhaseDark);
  dark_storm_labels = &Cstring(StormDark);
  weekday_labels = &Cstring(DayMon);
  terrain_labels = gGlobals.CommonStrings + 0x14f;
  precip_labels = &Cstring(PrecipClear);
  ground_labels = &Cstring(Collide00);
  price_strings = &Cstring(PriceAppraise0);
  #if DEBUGVER
  debug_switch_labels = &Cstring(VoxelType0);
  boolean_labels = &Cstring(BoolFalse);
  cheatStatus_labels = &Cstring(CheatOption0);
  #endif
  task_failure_labels = gGlobals.CommonStrings + 0x58;
  equip_error_labels = gGlobals.CommonStrings + 0x5f;
  #if DEBUGVER
  on_off_labels = &Cstring(Off);
  debug_state_labels = &Cstring(DebugStates0);
  bool_labels = &Cstring(BoolFalse);
  #endif
}
//Free CommonString RomString
void CommonStrings::Free(void){
  if (gGlobals.CommonStrings) {
    RomString::Free(gGlobals.CommonStrings);
    commonstrings = NULL;
	#if DEBUGVER
    debug_switch_labels = NULL;
    boolean_labels = NULL;
    cheatStatus_labels = NULL;
	#endif
    task_failure_labels = NULL;
    equip_error_labels = NULL;
	#if DEBUGVER
    debug_state_labels = NULL;
	#endif
    gGlobals.CommonStrings = NULL;
	#if DEBUGVER
    on_off_labels = NULL;
    bool_labels = NULL;
	#endif
  }
}
