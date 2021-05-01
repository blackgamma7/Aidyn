bool intro_music_flag=true;
bool NOOP_flag=false;

void load_intro_music(void){
  Borg12Enum BVar1;
  byte abStack24 [4];
  int aiStack20 [5];
  
  gGlobals.splashscreenFlag = 1; //setting this to 0 skips splashscreens
  BVar1 = Intro_NoExp; //aka credit music
  if (ExpPakFlag != 0) {BVar1 = Intro_Exp;}
  gGlobals.introMusic = load_borg_12(BVar1);
  DCM_func(abStack24,aiStack20,(uint *)((int)(gGlobals.introMusic)->field_0x8 + 8),0xa5,0x80,1,0xffffffff,0);
  gGlobals.introMusicDatA = (uint)abStack24[0];
  gGlobals.introMusicDatB = aiStack20[0];
}

bool appstate_0(undefined4 *param_1){
  while (widgethandler_get_widgetB(gGlobals.widgetHandler) != 0) {
    FUN_800b6fdc(gGlobals.widgetHandler,1);
  }
  if (intro_music_flag) {
    load_intro_music();
    intro_music_flag = false;
  }
  if (gGlobals.splashscreenFlag == 1) {gGlobals.splashscreenFlag = (int)show_splash_screens(param_1);}
  if (gGlobals.splashscreenFlag == 0;) {NOOP_flag = true;}
  if (NOOP_flag) {
    noop_intromusic();
    intro_music_flag = true;
    NOOP_flag = false;
  }
  return bVar2;
}

void noop_intromusic(void){}