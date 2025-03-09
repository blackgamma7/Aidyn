#include "globals.h"
#include "graphics.h"

u8 flycam_flag=false;
borg6header*  flycam_borg6_ptr=NULL;
AnimationData* flycam_AniDat_ptr=NULL;
extern Flycam_entry flycam_sequences[];
u16 flycam_counter=0;
u8 titlescreen_load_flag=false;
u8 some_gamestart_flag=false;


void flycam_func(void){
  if (flycam_flag){
     flycam_counter = (flycam_counter + 1) % 6;
     //jumper pak - skip desert scene
     if ((flycam_counter == 4) && (!gExpPakFlag)) flycam_counter++;
  }
  gGlobals.Sub.mapDatA = 0;
  gGlobals.Sub.mapDatC = 0;
  gGlobals.Sub.mapShort1 = flycam_sequences[flycam_counter].Deimos;
  gGlobals.Sub.mapShort2 = flycam_sequences[flycam_counter].Phobos;
  gGlobals.Sub.flycamDat.shortC = flycam_sequences[flycam_counter].a;
  gGlobals.Sub.flycamDat.ShortD = flycam_sequences[flycam_counter].b;
  gGlobals.Sub.mapDatB = 0xffff;
  gGlobals.Sub.playerPos2d.x = 0.0;
  gGlobals.Sub.playerPos2d.y = 0.0;
  ZoneEngine::InitZoneEngine(2,0);
  gGlobals.brightness = 0.0;
  gGlobals.screenFadeMode = 2;
  gGlobals.screenFadeSpeed = (2.0/30);
  flycam_borg6_ptr = get_borg_6(flycam_sequences[flycam_counter].borg6);
  flycam_AniDat_ptr = BorgAnimLoadScene(*flycam_borg6_ptr->field8_0x20);
  AniDat_SetBorg6(flycam_AniDat_ptr,flycam_borg6_ptr);
  Animation::SetFlag10(flycam_AniDat_ptr);
}


void set_title_screen(void){
  Controller::GetDelay(0);
  flycam_flag = 0;
  gGlobals.delta = 0.0;
  gGlobals.gameStartOption = 0;
  if (!gGlobals.titleScreen) gGlobals.titleScreen =  new IntroMenu();
  WHANDLE->AddWidget(&gGlobals.titleScreen);
  flycam_func();
}

Gfx * Flycam::Render(Gfx *gfx){
  u8 bVar1;
  Gfx *apGStackX_0 [4];
  vec3f afStack216;
  vec3f afStack152;
  vec3f afStack88;
  
  apGStackX_0[0] = gfx;
  if (!flycam_AniDat_ptr) {
    if ((gGlobals.QueueA.items == 0) && (gGlobals.brightness == 0.0)) {
      flycam_func();
      gGlobals.screenFadeMode = 2;
      gGlobals.screenFadeSpeed = 0.01f;
      gfx = apGStackX_0[0];
    }
  }
  else {
    Animation::SetSpeed(flycam_AniDat_ptr,(char)(int)gGlobals.delta);
    Animation::Tick(flycam_AniDat_ptr);
    if (((flycam_flag != '\0') ||
        (flycam_AniDat_ptr->aniTime <
         ((flycam_AniDat_ptr->scene[0].borg6)->field8_0x20 + 0xc) -100.0) - (double)gGlobals.delta)) ||
       (gGlobals.brightness != 1.0)) {
      if ((gGlobals.screenFadeMode == 0) && (gGlobals.brightness == 0.0)) {
        clear_flycam();
        return apGStackX_0[0];
      }
    }
    else {
      flycam_flag = true;
      gGlobals.screenFadeMode = 1;
      gGlobals.screenFadeSpeed = 0.01f;
    }
    Animation::Rotate(flycam_AniDat_ptr,&afStack216,&afStack152,&afStack88);
    some_flycam_dat_func(&gGlobals.Sub.flycamDat,&gGlobals.Sub.camera,&afStack216,&afStack152);
    if (FUN_8000ccc0()) {
      FreeZoneEngineMemory();
      no_TP_vec3 = 1;
      loadGameBorgScenes(gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
    }
    else handleZoneEngineFrame(apGStackX_0,gGlobals.delta,NULL);
    gfx = apGStackX_0[0];
    if ((gGlobals.screenFadeMode == 0) && (gGlobals.brightness == 1.0f)) {
      flycam_flag = false;
    }
  }
  return gfx;
}


u8 gameStart(Gfx**GG){
  Gfx*gfx;
  u32 uVar2;
  vec3f *pos;
  u8 bVar3;
  float fVar4;
  u32 uVar5;
  u8 V;
  WeatherTemp w;
  vec3f fStack104;
  
  bVar3 = gGlobals.screenFadeModeSwitch;
  gfx = *GG;
  if (titleSceen_load_flag) {
    set_title_screen();
    titleSceen_load_flag = false;
  }
  check_input_7();
  gfx = Sky::RenderSky(gfx,gGlobals.delta);
  gfx = Graphics::StartDisplay(gfx,0,0,320,240);
  if (gGlobals.Sub.gamemodeType == 2) {
    w.precip = PRECIP_CLEAR;
    w.PrecipScale = 0.0;
    w.FogFloat = 0.0;
    w.ThunderFloat = 0.0;
    World::SetWithWeatherTemp(TerrainPointer,&w);
  }
  if (((gGlobals.gameStartOption == 0) ||
      ((gGlobals.gameStartOption == 1 && (0.0 < gGlobals.brightness)))) ||
     ((gGlobals.gameStartOption == 2 && (gGlobals.screenFadeMode != 0)))) {
    gfx = Flycam::Render(gfx);
    if (flycam_flag) fadeFloatMirror = 1.0f;
    RSPFUNC6(gfx);

    for(uVar2=0;uVar2<gGlobals.delta;uVar2++) {WHANDLE->Tick(1);}
    gfx = WHANDLE->Render(gfx,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
    gfx = N64Print::Draw(gfx,1);
  }
  pos = &fStack104;
  if (gGlobals.gameStartOption == 1) {
    if (gGlobals.brightness == 0.0) {
      some_gamestart_flag = true;
      bVar3 = 0xe;
      load_cinematic(Cinematic_opening,CSwitch_WorldMap,1);
    }
  }
  else {
    if (((1 < gGlobals.gameStartOption) && (gGlobals.gameStartOption == 2)) &&
       (gGlobals.screenFadeMode == 0)) {
      some_gamestart_flag = true;
      bVar3 = 1;
    }
  }
  fStack104={0};
  if (gGlobals.playerCharStruct.playerDat) pos = &((gGlobals.playerCharStruct.playerDat)->collision).pos;
  if (gGlobals.introMusic) {
    DCM::Start((u8)gGlobals.introMusicDatA,gGlobals.introMusicDatB,gGlobals.VolBGM * 255.0);
  }
  Gsprintf("ProcessAudioBubbles - Intro menu handler\n");
  ProcessAudioBubbles(&gGlobals.SFXStruct,pos,1);
  if (some_gamestart_flag) {
    start_intermediate_game();
    some_gamestart_flag = false;
    titleSceen_load_flag = true;
  }
  *GG = gfx;
  return bVar3;
}

void check_input_7(void){
  BaseWidget *pBVar1;
  u8 bVar2;
  u16 uVar3;
  ControllerFull *apCStack_20;
  
  uVar3 = 0;
  while (Controller::GetInput(&apCStack_20,0)) {
    uVar3++;
    pBVar1 = WHANDLE->Control((ControllerFull *)apCStack_20);
    if (pBVar1) {
      if (freeWidgetFunc == NULL) {
        if (true) {
          switch(*(undefined *)((int)((gGlobals.titleScreen)->substruct + 0x24)) {
          case 6:
            gGlobals.screenFadeMode = 1;
            gGlobals.gameStartOption = 1;
            gGlobals.screenFadeSpeed = 0.05f;
            break;
          case 7:
          case 8:
          case 9:
            gGlobals.screenFadeMode = 1;
            gGlobals.gameStartOption = 2;
            gGlobals.screenFadeSpeed = 0.05f;
            break;
          case 0xb:
            IntroMenu::ShowContPakMenu(gGlobals.titleScreen);
          }
        }
      }
      else (*freeWidgetFunc)(pBVar1);
    }
  }
  gGlobals.delta = (float)uVar3;
}


void clear_flycam(void){
  FreeZoneEngine(0);
  clear_sfx_entries(&gGlobals.SFXStruct,1);
  unlinkBorg6(flycam_borg6_ptr);
  FREEQANI(&flycam_AniDat_ptr);
  FREEQB6(&flycam_borg6_ptr);
}

void start_intermediate_game(void){
  u8 cVar1 = 9;
  if (gGlobals.titleScreen) {
    cVar1 = *(u8 *)((s32)(gGlobals.titleScreen)->substruct + 0x24);
    WHANDLE->FreeWidget(gGlobals.titleScreen);
    FREEQW(&gGlobals.titleScreen);
    gGlobals.titleScreen = NULL;
  }
  clear_flycam();
  if (cVar1 == 7) { //Intermediate game - skip intro, start in erromon
    gGlobals.Sub.mapDatA = debugMapLabels[5].a;
    gGlobals.Sub.mapDatB = debugMapLabels[5].b;
    gGlobals.Sub.mapDatC = debugMapLabels[5].c;
  }
  else { //Start game - skip intro cinematic.
    gGlobals.Sub.MapFloatDatEntry.mapDatB = 0xffff;
    gGlobals.Sub.mapDatA = debugMapLabels[0].a;
    gGlobals.Sub.mapDatB = debugMapLabels[0].b;
    gGlobals.Sub.mapDatC = debugMapLabels[0].c;
  }
  gGlobals.playerCharStruct.player_form = debugCharacters[0].borg7;
  gGlobals.playerCharStruct.collisionRadius = debugCharacters[0].f;
  DCM::Remove((byte)gGlobals.introMusicDatA,gGlobals.introMusicDatB);
  FREEQB12(&gGlobals.introMusic);
}
