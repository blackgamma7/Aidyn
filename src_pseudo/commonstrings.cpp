void load_commonstrings(void){
  commonstrings = func_romStrings(common_string_array,0x2830);
  #ifdef DEBUGVER
  debug_switch_labels = (char **)((s32)commonstrings + 0xbc);
  boolean_labels = (char **)((s32)commonstrings + 0x74);
  cheatStatus_labels = (char **)((s32)commonstrings + 0x98);
  #endif
  gglobals.CommonStrings = (char **)commonstrings;
  ground_labels = (char **)((s32)commonstrings + 0x568);
  #ifdef DEBUGVER
  debug_state_labels = (char **)((s32)commonstrings + 0x1ac);
  bool_labels = (char **)((s32)commonstrings + 0x74);
  on_off_labels = (char **)((s32)commonstrings + 0x1dc);
  #endif
  encounterType_labels = (char **)((s32)commonstrings + 0x3a8);
  walking_labels = (char **)((s32)commonstrings + 0x3b4);
  element_labels = (char **)((s32)commonstrings + 0x3c4);
  spell_error_labels = (char **)((s32)commonstrings + 0x408);
  equip_error_labels = (char **)((s32)commonstrings + 0x17c);
  task_failure_labels = (char **)((s32)commonstrings + 0x160);
  price_strings = (char **)((s32)commonstrings + 0x600);
  skill_strings = (char **)((s32)commonstrings + 0x43c);
  weapon_strings = (char **)((s32)commonstrings + 0x46c);
  aspect_labels = (char **)((s32)commonstrings + 0x498);
  magic_school_labels = (char **)((s32)commonstrings + 0x4a4);
  Stat_labels = (char **)((s32)commonstrings + 0x4bc);
  humidity_labels = (char **)((s32)commonstrings + 0x4d8);
  timeofDay_labels = (char **)((s32)commonstrings + 0x4e4);
  moon_phase_labels = (char **)((s32)commonstrings + 0x4f8);
  dark_strorm_labels = (char **)((s32)commonstrings + 0x508);
  weekday_labels = (char **)((s32)commonstrings + 0x520);
  terrain_labels = (char **)((s32)commonstrings + 0x53c);
  precip_labels = (char **)((s32)commonstrings + 0x55c);
  return;
}

void clear_commonstrings(void){
  if (gglobals.CommonStrings) {
    free_romstring(gglobals.CommonStrings);
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
    commonstringsmirror = NULL;
	#ifdef DEBUGVER
    on_off_labels = NULL;
    bool_labels = NULL;
	#endif
  }
  return;
}
