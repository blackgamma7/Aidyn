bool intro_music_flag=true;
bool NOOP_flag=false;

void load_intro_music(void){
  Borg12Enum BVar1;
  u8 abStack24 [4];
  s32 aiStack20 [5];
  
  gGlobals.splashscreenFlag = 1; //setting this to 0 skips splashscreens
  BVar1 = BORG12_Intro_NoExp; //aka credit music
  if (gExpPakFlag) BVar1 = BORG12_Intro_Exp;
  gGlobals.introMusic = load_borg_12(BVar1);
  DCM_func(abStack24,aiStack20,(u32 *)((s32)(gGlobals.introMusic)->unk0x8 + 8),0xa5,0x80,1,0xffffffff,0);
  gGlobals.introMusicDatA = (u32)abStack24[0];
  gGlobals.introMusicDatB = aiStack20[0];
}

bool appstate_0(s32 *param_1){
  while (widgethandler_get_widgetB(gGlobals.widgetHandler) != 0) {
    FUN_800b6fdc(gGlobals.widgetHandler,1);
  }
  if (intro_music_flag) {
    load_intro_music();
    intro_music_flag = false;
  }
  if (gGlobals.splashscreenFlag == 1) gGlobals.splashscreenFlag = (s32)TitleSplash::Show(param_1);
  if (gGlobals.splashscreenFlag == 0;) NOOP_flag = true;
  if (NOOP_flag) {
    noop_intromusic();
    intro_music_flag = true;
    NOOP_flag = false;
  }
  return bVar2;
}

void noop_intromusic(void){}