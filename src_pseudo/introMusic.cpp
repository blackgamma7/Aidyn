#include "globals.h"
#include "titlesplash.h"

u8 intro_music_flag=true;
u8 NOOP_flag=false;

void load_intro_music(){
  u32 BVar1;
  byte abStack_18;
  s32 aiStack_14;
  
  gGlobals.splashscreenFlag = 1;
  BVar1 = BORG12_Intro_NoExp;
  if (gExpPakFlag) BVar1 = BORG12_Intro_Exp;
  gGlobals.introMusic = load_borg_12(BVar1);
  DCM::Add(&abStack_18,&aiStack_14,&(gGlobals.introMusic)->dat->sub,0xa5,0x80,1,-1,0);
  gGlobals.introMusicDatA = abStack_18;
  gGlobals.introMusicDatB = aiStack_14;
}

s32 appState_0(Gfx **param_1){
  u8 bVar2;
  
  while (WHANDLE->GetTail()) WHANDLE->Tick(1);
  if (intro_music_flag) {
    load_intro_music();
    intro_music_flag = false;
  }
  if (gGlobals.splashscreenFlag == 1) {
    bVar2 = TitleSplash::Show(param_1);
    gGlobals.splashscreenFlag = (int)bVar2;
  }
  bVar2 = gGlobals.splashscreenFlag == 0;
  if (bVar2) NOOP_flag = true;
  if (NOOP_flag) {
    noop_intromusic();
    intro_music_flag = true;
    NOOP_flag = false;
  }
  return (s32)bVar2;
}

void noop_intromusic(){}