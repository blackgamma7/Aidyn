#include "game.h"
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
  gGlobals.gameVars.mapDatA = 0;
  gGlobals.gameVars.mapDatC = 0;
  gGlobals.gameVars.mapShort1 = gFlycamSequences[flycam_counter].Deimos;
  gGlobals.gameVars.mapShort2 = gFlycamSequences[flycam_counter].Phobos;
  gGlobals.gameVars.flycamDat.shortC = gFlycamSequences[flycam_counter].a;
  gGlobals.gameVars.flycamDat.ShortD = gFlycamSequences[flycam_counter].b;
  gGlobals.gameVars.mapDatB = 0xffff;
  gGlobals.gameVars.playerPos2d.x = 0.0;
  gGlobals.gameVars.playerPos2d.y = 0.0;
  InitZoneEngine(GameMode_Title,0);
  gGlobals.brightness = 0.0;
  gGlobals.screenFadeMode = ScreenFade_In;
  gGlobals.screenFadeSpeed = (2.0/30);
  gFlycamBorg6P = loadBorg6(gFlycamSequences[flycam_counter].borg6);
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
  vec3f pos,rotXY,rotZ;
  
  apGStackX_0[0] = gfx;
  if (!gFlycamSceneP) {
    if ((gGlobals.QueueA.items == 0) && (gGlobals.brightness == 0.0)) {
      flycam_func();
      gGlobals.screenFadeMode = ScreenFade_In;
      gGlobals.screenFadeSpeed = 0.01f;
      gfx = apGStackX_0[0];
    }
  }
  else {
    Scene::SetSpeed(gFlycamSceneP,gGlobals.delta);
    Scene::Tick(gFlycamSceneP);
    if (((flycam_flag != false) ||
        (gFlycamSceneP->aniTime <
         (gFlycamSceneP->borg6->dat->aniLength - 100.0) -gGlobals.delta)) || 
         (gGlobals.brightness != 1.0)) {
      if ((gGlobals.screenFadeMode == ScreenFade_None) && (gGlobals.brightness == 0.0)) {
        FlyCamClear();
        return apGStackX_0[0];
      }
    }
    else {
      flycam_flag = true;
      gGlobals.screenFadeMode = ScreenFade_Out;
      gGlobals.screenFadeSpeed = 0.01f;
    }
    Scene::GetRotate(gFlycamSceneP,&pos,&rotXY,&rotZ);
    Flycam_UpdateCamera(&gGlobals.gameVars.flycamDat,&gCamera,&pos,&rotXY);
    if (FUN_8000ccc0()) {
      FreeZoneEngineMemory();
      no_TP_vec3 = 1;
      loadGameBorgScenes(gGlobals.gameVars.mapShort1,gGlobals.gameVars.mapShort2);
    }
    else handleZoneEngineFrame(apGStackX_0,(s16)(int)gGlobals.delta,NULL);
    gfx = apGStackX_0[0];
    if ((gGlobals.screenFadeMode == ScreenFade_None) && (gGlobals.brightness == 1.0f)) {
      flycam_flag = false;
    }
  }
  return gfx;
}

u8 gameStart(Gfx**GG){
  Gfx*gfx;
  u32 uVar2;
  vec3f *pos;
  u8 ret;
  float fVar4;
  u32 uVar5;
  u8 V;
  WeatherTemp w;
  vec3f fStack104;
  
  ret = gGlobals.gameStateA;
  gfx = *GG;
  if (titleSceen_load_flag) {
    set_title_screen();
    titleSceen_load_flag = false;
  }
  TitleScreenInput();
  gfx = Sky::RenderSky(gfx,gGlobals.delta);
  gfx = Graphics::StartDisplay(gfx,FULL_SCREENSPACE);
  if (gGlobals.gameVars.gamemodeType == GameMode_Title) {
    w.precip = PRECIP_CLEAR;
    w.PrecipScale = 0.0;
    w.FogFloat = 0.0;
    w.ThunderFloat = 0.0;
    World::SetWithWeatherTemp(TerrainPointer,&w);
  }
  if (((gGlobals.gameStartOption == 0) ||
      ((gGlobals.gameStartOption == 1 && (0.0 < gGlobals.brightness)))) ||
     ((gGlobals.gameStartOption == 2 && (gGlobals.screenFadeMode != ScreenFade_None)))) {
    gfx = RenderFlycam(gfx);
    if (flycam_flag) fadeFloatMirror = 1.0f;
    RSPFUNC6(gfx);

    for(uVar2=0;uVar2<gGlobals.delta;uVar2++) {WHANDLE->Tick(1);}
    gfx = WHANDLE->Render(gfx,FULL_SCREENSPACE);
    gfx = N64Print::Draw(gfx,1);
  }
  pos = &fStack104;
  if (gGlobals.gameStartOption == 1) {
    if (gGlobals.brightness == 0.0) {
      some_gamestart_flag = true;
      ret = GameStateA_Cinematic;
      Cinematic::Load(Cinematic_opening,CSwitch_WorldMap,GameStateA_1);
    }
  }
  else {
    if (((1 < gGlobals.gameStartOption) && (gGlobals.gameStartOption == 2)) &&
       (gGlobals.screenFadeMode == ScreenFade_None)) {
      some_gamestart_flag = true;
      ret = GameStateA_1;
    }
  }
  fStack104={0};
  if (gPlayer) pos = &gPlayer->collision.pos;
  if (gGlobals.titleSplashVars.introMusic) {
    DCM::Start((u8)gGlobals.titleSplashVars.introMusicDatA,gGlobals.titleSplashVars.introMusicDatB,gGlobals.VolBGM * 255.0);
  }
  Gsprintf("ProcessAudioBubbles - Intro menu handler\n");
  ProcessAudioBubbles(&gGlobals.SFXStruct,pos,1);
  if (some_gamestart_flag) {
    start_intermediate_game();
    some_gamestart_flag = false;
    titleSceen_load_flag = true;
  }
  *GG = gfx;
  return ret;
}

void TitleScreenInput(void){
  BaseWidget *pBVar1;
  u8 bVar2;
  u16 uVar3;
  ControllerFull *cont;
  
  uVar3 = 0;
  while (Controller::GetInput((controller_aidyn**)&cont,0)) {
    uVar3++;
    pBVar1 = WHANDLE->Control(cont);
    if (pBVar1) {
      if (freeWidgetFunc == NULL) {
        if (true) {//?
          switch(((IntroMenuSub*)gGlobals.titleScreen->substruct)->menuState) {
          case IntroM_NewGame:
            gGlobals.screenFadeMode = ScreenFade_Out;
            gGlobals.gameStartOption = 1;
            gGlobals.screenFadeSpeed = 0.05f;
            break;
          #if DEBUGVER //two debug cases skipped. also causes compiler to not generate jumptable
          case IntroM_IntermediateGame:
          case IntroM_AdvancedGame:
          #endif
          case IntroM_StartGame:
            gGlobals.screenFadeMode = ScreenFade_Out;
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
    #if DEBUGVER
    gGlobals.gameVars.mapDatA = debugMapLabels[5].a;
    gGlobals.gameVars.mapDatB = debugMapLabels[5].b;
    gGlobals.gameVars.mapDatC = debugMapLabels[5].c;
    #else
    gGlobals.gameVars.mapDatB=10;
    #endif
  }
  else { //Start game - skip intro cinematic.
    gGlobals.gameVars.MapFloatDatEntry.mapDatB = 0xffff;
    #if DEBUGVER
    gGlobals.gameVars.mapDatA = debugMapLabels[0].a;
    gGlobals.gameVars.mapDatB = debugMapLabels[0].b;
    gGlobals.gameVars.mapDatC = debugMapLabels[0].c;
    #else
    gGlobals.gameVars.mapDatB =0;
    #endif
  }
  #if DEBUGVER
  gGlobals.playerCharStruct.player_form = debugCharacters[0].borg7;
  gGlobals.playerCharStruct.collisionRadius = debugCharacters[0].f;
  #else
  gGlobals.gameVars.mapDatC =0;
  gGlobals.gameVars.mapDatA =0;
  gGlobals.playerCharStruct.player_form=BORG7_Alaron;
  gGlobals.playerCharStruct.collisionRadius = 0.5f
  #endif
  DCM::Remove((byte)gGlobals.titleSplashVars.introMusicDatA,gGlobals.titleSplashVars.introMusicDatB);
  FREEQB12(gGlobals.titleSplashVars.introMusic);
}
