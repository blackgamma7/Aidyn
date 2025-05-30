#include "globals.h"
#include "graphics.h"

u8 flycam_flag=false;
Borg6Header*  gFlycamBorg6P=NULL;
SceneData* gFlycamSceneP=NULL;
extern Flycam_entry gFlycamSequences[];
u16 flycam_counter=0;
u8 titleSceen_load_flag=TRUE;
u8 some_gamestart_flag=false;


void flycam_func(void){
  if (flycam_flag){
     flycam_counter = (flycam_counter + 1) % 6;
     //jumper pak - skip desert scene
     if ((flycam_counter == 4) && (!gExpPakFlag)) flycam_counter++;
  }
  gGlobals.Sub.mapDatA = 0;
  gGlobals.Sub.mapDatC = 0;
  gGlobals.Sub.mapShort1 = gFlycamSequences[flycam_counter].Deimos;
  gGlobals.Sub.mapShort2 = gFlycamSequences[flycam_counter].Phobos;
  gGlobals.Sub.flycamDat.shortC = gFlycamSequences[flycam_counter].a;
  gGlobals.Sub.flycamDat.ShortD = gFlycamSequences[flycam_counter].b;
  gGlobals.Sub.mapDatB = 0xffff;
  gGlobals.Sub.playerPos2d.x = 0.0;
  gGlobals.Sub.playerPos2d.y = 0.0;
  InitZoneEngine(2,0);
  gGlobals.brightness = 0.0;
  gGlobals.screenFadeMode = 2;
  gGlobals.screenFadeSpeed = (2.0/30);
  gFlycamBorg6P = get_borg_6(gFlycamSequences[flycam_counter].borg6);
  gFlycamSceneP = BorgAnimLoadScene(gFlycamBorg6P->dat->borg5);
  Scene_SetBorg6(gFlycamSceneP,gFlycamBorg6P);
  Scene::SetFlag10(gFlycamSceneP);
}


void set_title_screen(void){
  Controller::GetDelay(0);
  flycam_flag = 0;
  gGlobals.delta = 0.0;
  gGlobals.gameStartOption = 0;
  if (!gGlobals.titleScreen) gGlobals.titleScreen =  new IntroMenu();
  WHANDLE->AddWidget(gGlobals.titleScreen);
  flycam_func();
}

Gfx * RenderFlycam(Gfx *gfx){
  bool bVar1;
  Gfx *apGStackX_0 [4];
  vec3f afStack216;
  vec3f afStack152;
  vec3f afStack88;
  
  apGStackX_0[0] = gfx;
  if (!gFlycamSceneP) {
    if ((gGlobals.QueueA.items == 0) && (gGlobals.brightness == 0.0)) {
      flycam_func();
      gGlobals.screenFadeMode = 2;
      gGlobals.screenFadeSpeed = 0.01f;
      gfx = apGStackX_0[0];
    }
  }
  else {
    Scene::SetSpeed(gFlycamSceneP,gGlobals.delta);
    Scene::Tick(gFlycamSceneP);
    if (((flycam_flag != false) ||
        (gFlycamSceneP->aniTime <
         ((gFlycamSceneP->scene[0].borg6)->dat->aniLength - 100.0) -
         gGlobals.delta)) || (gGlobals.brightness != 1.0)) {
      if ((gGlobals.screenFadeMode == 0) && (gGlobals.brightness == 0.0)) {
        FlyCamClear();
        return apGStackX_0[0];
      }
    }
    else {
      flycam_flag = true;
      gGlobals.screenFadeMode = 1;
      gGlobals.screenFadeSpeed = 0.01f;
    }
    Scene::Rotate(gFlycamSceneP,&afStack216,&afStack152,&afStack88);
    some_flycam_dat_func(&gGlobals.Sub.flycamDat,&gGlobals.Sub.camera,&afStack216,&afStack152);
    if (FUN_8000ccc0()) {
      FreeZoneEngineMemory();
      no_TP_vec3 = 1;
      loadGameBorgScenes(gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
    }
    else handleZoneEngineFrame(apGStackX_0,(short)(int)gGlobals.delta,NULL);
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
  TitleScreenInput();
  gfx = Sky::RenderSky(gfx,gGlobals.delta);
  gfx = Graphics::StartDisplay(gfx,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
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
    gfx = RenderFlycam(gfx);
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
      Cinematic::Load(Cinematic_opening,CSwitch_WorldMap,1);
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

void TitleScreenInput(void){
  BaseWidget *pBVar1;
  u8 bVar2;
  u16 uVar3;
  ControllerFull *cont;
  
  uVar3 = 0;
  while (Controller::GetInput(&cont,0)) {
    uVar3++;
    pBVar1 = WHANDLE->Control(cont);
    if (pBVar1) {
      if (freeWidgetFunc == NULL) {
        if (true) {//?
          switch(((IntroMenuSub*)gGlobals.titleScreen->substruct)->menuState) {
          case IntroM_NewGame:
            gGlobals.screenFadeMode = 1;
            gGlobals.gameStartOption = 1;
            gGlobals.screenFadeSpeed = 0.05f;
            break;
          #ifdef DEBUGVER //two debug cases skipped. also causes compiler to not generate jumptable
          case IntroM_IntermediateGame:
          case IntroM_AdvancedGame:
          #endif
          case IntroM_StartGame:
            gGlobals.screenFadeMode = 1;
            gGlobals.gameStartOption = 2;
            gGlobals.screenFadeSpeed = 0.05f;
            break;
          case IntroM_LoadGame:
          gGlobals.titleScreen->ShowContPakMenu();
          }
        }
      }
      else (*freeWidgetFunc)(pBVar1);
    }
  }
  gGlobals.delta = (float)uVar3;
}


void FlyCamClear(void){
  FreeZoneEngine(0);
  clear_sfx_entries(&gGlobals.SFXStruct,1);
  unlinkBorg6(gFlycamBorg6P);
  FREEQSCENE(gFlycamSceneP);
  FREEQB6(gFlycamBorg6P);
}

void start_intermediate_game(void){
  u8 cVar1 = IntroM_StartGame;
  if (gGlobals.titleScreen) {
    cVar1 = ((IntroMenuSub*)gGlobals.titleScreen->substruct)->menuState;
    WHANDLE->FreeWidget(gGlobals.titleScreen);
    FREEQW(gGlobals.titleScreen);
    gGlobals.titleScreen = NULL;
  }
  FlyCamClear();
  if (cVar1 == IntroM_IntermediateGame) { //Intermediate game - skip intro, start in erromon
    #ifdef DEBUGVER
    gGlobals.Sub.mapDatA = debugMapLabels[5].a;
    gGlobals.Sub.mapDatB = debugMapLabels[5].b;
    gGlobals.Sub.mapDatC = debugMapLabels[5].c;
    #else
    gGlobals.Sub.mapDatB=10;
    #endif
  }
  else { //Start game - skip intro cinematic.
    #ifdef DEBUGVER
    gGlobals.Sub.MapFloatDatEntry.mapDatB = 0xffff;
    gGlobals.Sub.mapDatA = debugMapLabels[0].a;
    gGlobals.Sub.mapDatB = debugMapLabels[0].b;
    gGlobals.Sub.mapDatC = debugMapLabels[0].c;
    #else
    gGlobals.Sub.MapFloatDatEntry.mapDatB = 0xffff;
    gGlobals.Sub.mapDatB =0;
    #endif
  }
  #ifdef DEBUGVER
  gGlobals.playerCharStruct.player_form = debugCharacters[0].borg7;
  gGlobals.playerCharStruct.collisionRadius = debugCharacters[0].f;
  #else
  gGlobals.Sub.mapDatC =0;
  gGlobals.Sub.mapDatA =0;
  gGlobals.playerCharStruct.player_form=BORG7_Alaron;
  gGlobals.playerCharStruct.collisionRadius = 0.5f
  #endif
  DCM::Remove((byte)gGlobals.introMusicDatA,gGlobals.introMusicDatB);
  FREEQB12(gGlobals.introMusic);
}
