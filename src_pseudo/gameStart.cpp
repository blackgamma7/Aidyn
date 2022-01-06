void flycam_func(void){
  u32 uVar1;
  
  if (((flycam_flag != 0) &&(uVar1 = (flycam_counter + 1) % 6, flycam_counter = (u16)uVar1, uVar1 == 4)) &&
     (ExpPakFlag == 0)) {flycam_counter++;}
  gGlobals.Sub.mapDatA = 0;
  gGlobals.Sub.mapDatC = 0;
  gGlobals.Sub.mapShort1 = flycam_sequences[flycam_counter].Deimos;
  gGlobals.Sub.mapShort2 = flycam_sequences[flycam_counter].Phobos;
  gGlobals.Sub.flycamDat.shortC = flycam_sequences[flycam_counter].a;
  gGlobals.Sub.flycamDat.ShortD = flycam_sequences[flycam_counter].b;
  gGlobals.Sub.mapDatB = 0xffff;
  gGlobals.Sub.unk0x2a4 = 0.0;
  gGlobals.Sub.unk0x2a8 = 0.0;
  InitZoneEngine(2,0);
  gGlobals.screenfadeFloat = 0.0;
  gGlobals.screenFadeMode = 2;
  gGlobals.screenFadeSpeed = 0.06666667f;
  flycam_borg6_ptr = get_borg_6(flycam_sequences[flycam_counter].borg6);
  flycam_AniDat_ptr = BorgAnimLoadScene(*(u32 *)flycam_borg6_ptr->unk0x20);
  func_8009f87c(flycam_AniDat_ptr,flycam_borg6_ptr);
  AniDat_Flags_OR_0x10(flycam_AniDat_ptr);
}

void set_title_screen(void){

  cont_delay(0);
  flycam_flag = 0;
  gGlobals.delay = 0.0;
  gGlobals.unk0x1500 = 0;
  if (gGlobals.titleScreen == NULL) gGlobals.titleScreen = title_sceen_widget(passToMalloc(0x8c));
  widgetHandler(gGlobals.widgetHandler,gGlobals.titleScreen);
  flycam_func();
}

Gfx* other_flycam_func(float param_1,float param_2,Gfx*param_3){
  vec3 afStack216;
  vec3 afStack152;
  vec3 afStack88;
  
  if (flycam_AniDat_ptr == NULL) {
    if ((gGlobals.QueueA.items == 0) && (gGlobals.screenfadeFloat == 0.0)) {
      flycam_func();
      gGlobals.screenFadeMode = 2;
      gGlobals.screenFadeSpeed = 0.01f;
    }
  }
  else {
    set_animation_speed(flycam_AniDat_ptr,gGlobals.delay);
    func_800a0bf8(flycam_AniDat_ptr);
    if (((flycam_flag != 0) ||
        ((double)(u32)flycam_AniDat_ptr->aniTime <
         ((double)*(s32 *)(flycam_AniDat_ptr->borg6->unk0x20 + 0xc) - 100.0d) -
         (double)gGlobals.delay)) || ((double)gGlobals.screenfadeFloat != 1.0d)) {
      if ((gGlobals.screenFadeMode == 0) && (gGlobals.screenfadeFloat == 0.0)) {
        clear_flycam();
        return param_3;
      }
    }
    else {
      flycam_flag = 1;
      gGlobals.screenFadeMode = 1;
      gGlobals.screenFadeSpeed = 0.01f;
    }
    anidat_rotation_func(flycam_AniDat_ptr,afStack216,afStack152,afStack88);
    some_flycam_dat_func(&gGlobals.Sub.flycamDat,&gGlobals.Sub.camera,afStack216,afStack152)
    ;

    if (!func_8000ccc0()) {
      handleZoneEngineFrame((Gfx*)register0x000000ec,(s16)(s32)gGlobals.delay,(playerData *)0x0,param_1,param_2);
    }
    else {
      FreeZoneEngineMemory();
      no_TP_vec3 = 1;
      loadGameBorgScenes(param_1,param_2,gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
    }
    if ((gGlobals.screenFadeMode == 0) && (gGlobals.screenfadeFloat == 1.0f)) {flycam_flag = 0;}
  }
  return param_3;
}


u8 gameStart(Gfx**param_1){
  Gfx*pauVar1;
  u32 uVar2;
  vec3 *pos;
  u8 bVar3;
  float fVar4;
  u32 uVar5;
  u8 V;
  float in_f12;
  float in_f14;
  WeatherTemp aaStack168;
  vec3 fStack104;
  
  bVar3 = gGlobals.screenFadeModeSwitch;
  pauVar1 = *param_1;
  if (titleSceen_load_flag) {
    set_title_screen();
    titleSceen_load_flag = false;
  }
  check_input_7();
  pauVar1 = RenderSky(pauVar1,(s16)(s32)gGlobals.delay);
  pauVar1 = some_rsp_func(pauVar1,0,0,0x140,0xf0);
  if (gGlobals.Sub.gamemodeType == 2) {
    aaStack168.precip = CLEAR;
    aaStack168.PrecipScale = 0.0;
    aaStack168.FogFloat = 0.0;
    aaStack168.ThunderFloat = 0.0;
    set_with_WeatherTemp(TerrainPointer,&aaStack168);
  }
  if (((gGlobals.unk0x1500 == 0) ||
      ((gGlobals.unk0x1500 == 1 && (0.0 < gGlobals.screenfadeFloat)))) ||
     ((gGlobals.unk0x1500 == 2 && (gGlobals.screenFadeMode != 0)))) {
    pauVar1 = other_flycam_func(in_f12,in_f14,pauVar1);
    if (flycam_flag) {fadeFloatMirror = 1.0f;}
    pauVar1 = rsp_func(pauVar1,6,gfx::get_hres(),gfx::get_vres());
    uVar2 = 0;
    while( true ) {
      if (gGlobals.delay < INT_MAX_f) {uVar5 = (u32)gGlobals.delay;}
      else {uVar5 = (s32)(gGlobals.delay - INT_MAX_f) | 0x80000000;}
      if (uVar5 <= uVar2) break;
      uVar2++;
      tick_widgets(gGlobals.widgetHandler,1);
    }
    pauVar1 = (Gfx*)render_widgets(gGlobals.widgetHandler,pauVar1,0,0);
    pauVar1 = debug::func_with_debug_queue(pauVar1,1);
  }
  pos = fStack104;
  if (gGlobals.unk0x1500 == 1) {
    if (gGlobals.screenfadeFloat == 0.0) {
      some_gamestart_flag = true;
      bVar3 = 0xe;
      load_cinematic(Cinematic_opening,Load_world_map,1);
    }
  }
  else {
    if (((1 < gGlobals.unk0x1500) && (gGlobals.unk0x1500 == 2)) &&
       (gGlobals.screenFadeMode == 0)) {
      some_gamestart_flag = true;
      bVar3 = 1;
    }
  }
  fStack104={0.0,0.0,0.0};
  if (gGlobals.playerCharStruct.playerDat) {pos = ((gGlobals.playerCharStruct.playerDat)->collision).position;}
  if (gGlobals.introMusic) {
    fVar4 = gGlobals.VolBGM * 255.0f;
    if (fVar4 < INT_MAX_f) {V = (u8)fVar4;}
    else {V = (u8)(fVar4 - INT_MAX_f);}
    some_music_func((u32)(u8)gGlobals.introMusicDatA,gGlobals.introMusicDatB,V);
  }
  sprintf(gGlobals.text,"ProcessAudioBubbles - Intro menu handler\n");
  ProcessAudioBubbles(&gGlobals.SFXStruct,pos,1);
  if (some_gamestart_flag) {
    start_intermediate_game();
    some_gamestart_flag = false;
    titleSceen_load_flag = true;
  }
  *param_1 = pauVar1;
  return bVar3;
}

void check_input_7(void){
  bool bVar2;
  u16 uVar3;
  Button_hold *pBStack32;
  
  uVar3 = 0;
  while (get_cont_aidyn(&pBStack32,0)) {
    uVar3++;
    if (run_widget_control_func(gGlobals.widgetHandler,pBStack32) != 0) {
      if (freeWidgetFunc == NULL) {
        switch(*(undefined *)((s32)(gGlobals.titleScreen)->prt0x40 + 0x24)) {
        case 6:
          gGlobals.screenFadeMode = 1;
          gGlobals.unk0x1500 = 1;
          gGlobals.screenFadeSpeed = 0.05f;
          break;
        case 7:
        case 8:
        case 9:
          gGlobals.screenFadeMode = 1;
          gGlobals.unk0x1500 = 2;
          gGlobals.screenFadeSpeed = 0.05f;
          break;
        case 0xb:
          func_8004b248(gGlobals.titleScreen);
        }
      }
      else {
        (*freeWidgetFunc)();
      }
    }
  }
  gGlobals.delay = (float)uVar3;
}

void clear_flycam(void){
  FreeZoneEngine(0);
  clear_sfx_entries(&gGlobals.SFXStruct,1);
  clear_borg6(flycam_borg6_ptr);
  AllocFreeQueueItem(&gGlobals.QueueA,&flycam_AniDat_ptr,1,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&flycam_borg6_ptr,2,0);
}

void start_intermediate_game(void){
  u8 cVar1 = 9;
  if (gGlobals.titleScreen) {
    cVar1 = *(u8 *)((s32)(gGlobals.titleScreen)->prt0x40 + 0x24);
    func_800b72cc(gGlobals.widgetHandler,gGlobals.titleScreen);
    AllocFreeQueueItem(&gGlobals.QueueA,&gGlobals.titleScreen,6,0);
    gGlobals.titleScreen = NULL;
  }
  clear_flycam();
  if (cVar1 == 7) { //Intermediate game
    gGlobals.Sub.mapDatA = debug::debugMapLabels[5].a;
    gGlobals.Sub.mapDatB = debug::debugMapLabels[5].b;
    gGlobals.Sub.mapDatC = debug::debugMapLabels[5].c;
  }
  else { //Start game
    gGlobals.Sub.MapFloatDatEntry.mapDatB = 0xffff;
    gGlobals.Sub.mapDatA = debug::debugMapLabels[0].a;
    gGlobals.Sub.mapDatB = debug::debugMapLabels[0].b;
    gGlobals.Sub.mapDatC = debug::debugMapLabels[0].c;
  }
  gGlobals.playerCharStruct.player_form = debugCharacters[0].borg7; 
  gGlobals.playerCharStruct.collisionRadius = debugCharacters[0].f;
  dcm_remove_func((u8)gGlobals.introMusicDatA,gGlobals.introMusicDatB);
  AllocFreeQueueItem(&gGlobals.QueueA,&gGlobals.introMusic,8,0);
}
