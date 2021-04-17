void load_commonstrings(void){
  commonstrings = func_romStrings(common_string_array,0x2830);
  #ifdef DEBUGVER
  debug_switch_labels = (char **)((int)commonstrings + 0xbc);
  boolean_labels = (char **)((int)commonstrings + 0x74);
  cheatStatus_labels = (char **)((int)commonstrings + 0x98);
  #endif
  gglobals.CommonStrings = (char **)commonstrings;
  ground_labels = (char **)((int)commonstrings + 0x568);
  #ifdef DEBUGVER
  debug_state_labels = (char **)((int)commonstrings + 0x1ac);
  bool_labels = (char **)((int)commonstrings + 0x74);
  on_off_labels = (char **)((int)commonstrings + 0x1dc);
  #endif
  encounterType_labels = (char **)((int)commonstrings + 0x3a8);
  walking_labels = (char **)((int)commonstrings + 0x3b4);
  element_labels = (char **)((int)commonstrings + 0x3c4);
  spell_error_labels = (char **)((int)commonstrings + 0x408);
  equip_error_labels = (char **)((int)commonstrings + 0x17c);
  task_failure_labels = (char **)((int)commonstrings + 0x160);
  price_strings = (char **)((int)commonstrings + 0x600);
  skill_strings = (char **)((int)commonstrings + 0x43c);
  weapon_strings = (char **)((int)commonstrings + 0x46c);
  aspect_labels = (char **)((int)commonstrings + 0x498);
  magic_school_labels = (char **)((int)commonstrings + 0x4a4);
  Stat_labels = (char **)((int)commonstrings + 0x4bc);
  humidity_labels = (char **)((int)commonstrings + 0x4d8);
  timeofDay_labels = (char **)((int)commonstrings + 0x4e4);
  moon_phase_labels = (char **)((int)commonstrings + 0x4f8);
  dark_strorm_labels = (char **)((int)commonstrings + 0x508);
  weekday_labels = (char **)((int)commonstrings + 0x520);
  terrain_labels = (char **)((int)commonstrings + 0x53c);
  precip_labels = (char **)((int)commonstrings + 0x55c);
  return;
}

void clear_commonstrings(void){
  if (gglobals.CommonStrings) {
    free_romstring(gglobals.CommonStrings);
    commonstrings = null;
	#ifdef DEBUGVER
    debug_switch_labels = null;
    boolean_labels = null;
    cheatStatus_labels = null;
	#endif
    task_failure_labels = null;
    equip_error_labels = null;
	#ifdef DEBUGVER
    debug_state_labels = null;
	#endif
    commonstringsmirror = null;
	#ifdef DEBUGVER
    on_off_labels = null;
    bool_labels = null;
	#endif
  }
  return;
}
