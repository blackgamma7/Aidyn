#include "compass.h"
#include "skyObjects.h"
#include "vobjects.h"
#include "memaker.h"
#include "game.h"
#include "QuestData.h"

#define FILENAME "./src/gametrek.cpp"

bool check_some_toggle(void) {return some_toggle != -1;}

void FUN_80024c54(s16 param_1) {
  if (some_toggle == -1) {
    gGlobals.screenFadeMode = ScreenFade_Out;
    gGlobals.screenFadeSpeed = (1.0f/30);
    some_toggle = param_1;
  }
}

Gfx * ofunc_80024c90(Gfx *param_1) {
  bool bVar2;
  Gfx *pGVar1;
  int iVar3;
  controller_aidyn *apcStack_20 [8];
  
  iVar3 = 0;
  apcStack_20[0] = NULL;
  while( Controller::GetInput(apcStack_20,0) ) {iVar3++;}
  CLAMP(iVar3,1,6);
  gGlobals.delta = (float)iVar3;
  return tick_trek_features(param_1,(u8)iVar3);
}

u8 Trek_GameState(Gfx **GG) {
  bool bVar1;
  u8 ret;
  controller_aidyn *pcStack_30;
  Gfx *gfxTemp [11];
  
  ret = GameStateA_1;
  gfxTemp[0] = *GG;
  if (gTrekUninitted) {
    some_ticker = 0;
    if (gGlobals.screenshot != NULL) {
      FREEQBP(gGlobals.screenshot->dat.offset);
      FREEQBP(gGlobals.screenshot);
    }
    if (gMemMakerFlag) {
      gMemMakerFlag = false;
      MemoryMaker::Unload();
      MemoryMaker::Reload();
    }
    initGameTrek();
    gTrekUninitted = false;
    some_toggle = -1;
    QuestData::SetWeather();
  }
  if ((((gGlobals.playerCharStruct.gameStateB == GameStateB_3) && (!check_some_toggle())) &&
      (gGlobals.screenFadeMode == ScreenFade_None)) && (FUN_8000ccc0())) {
    gGlobals.playerCharStruct.gameStateB = GameStateB_15;
  }
  if (gGlobals.gameStateA == GameStateA_9) {
    if (DAT_800e9aac) {
      gGlobals.brightness = 0.0;
      DAT_800e9aac = false;
      gGlobals.screenFadeMode = ScreenFade_In;
      gGlobals.screenFadeSpeed = (1.0f/30);
      Sky::SetBackgroundType(gGlobals.BackgroundTypeCopy,gGlobals.gameVars.weather.skyBgdat,0.0);
    }
    if (gGlobals.screenFadeMode == ScreenFade_None) {
      gGlobals.playerCharStruct.gameStateB = GameStateB_8;
      DAT_800e9aac = true;
    }
    else {
      ret = GameStateA_9;
      gGlobals.playerCharStruct.gameStateB = GameStateB_3;
    }
  }
  if (false) goto switchD_80024ecc_caseD_1;
  switch(gGlobals.playerCharStruct.gameStateB) {
  case GameStateB_0:
    DAT_800e9aa7 = true;
    ret = GameStateA_0;
    break;
  case GameStateB_2:
    DAT_800e9aa7 = true;
    ret = GameStateA_Combat;
    break;
  case GameStateB_3:
    gDelta = 0;
    if (gGlobals.gameStateA == GameStateA_9) {
      while (Controller::GetInput(&pcStack_30,0)) {
        gDelta++;
      }
    }
    else {
      while (Controller::GetInput(&pcStack_30,0)) {
        small_debug_menu_check(pcStack_30);
        gDelta++;
      }
    }
    if (gDelta < 1) gDelta = 1;
    if (*(u8*)&gDelta >= 6) gDelta = 6;
    gGlobals.delta = (float)(u8)gDelta;
    gfxTemp[0] = tick_trek_features(gfxTemp[0],(u8)gDelta);
    break;
  case GameStateB_4:
    DAT_800e9aa7 = true;
    break;
  case GameStateB_5:
  case GameStateB_6:
  case GameStateB_7:
  case GameStateB_8:
    if (DAT_800e9ab0 == 0) {
      FreeZoneEngineMemory();
      DAT_800e9ab0 = 1;
    }
    if (gGlobals.QueueA.items) break;
    GetSnapshot_();
    gGlobals.BackgroundTypeCopy = gGlobals.sky.Type;
    if (gGlobals.playerCharStruct.gameStateB == GameStateB_6) {
      ret = GameStateA_6;
    }
    else if (gGlobals.playerCharStruct.gameStateB < GameStateB_7) {
      ret = GameStateA_8;
      if (gGlobals.playerCharStruct.gameStateB == GameStateB_5) {
        ret = GameStateA_5;
      }
    }
    else {
      ret = GameStateA_8;
      if (gGlobals.playerCharStruct.gameStateB == GameStateB_7) {
        ret = GameStateA_7;
      }
    }
    some_ticker = 0;
    DAT_800e9ab0 = 0;
    break;
  case GameStateB_9:
    DAT_800e9aa7 = true;
    ret = GameStateA_GSM;
    break;
  case GameStateB_10:
    DAT_800e9aa7 = true;
    ret = GameStateA_11;
    break;
  case GameStateB_11:
    DAT_800e9aa7 = true;
    ret = GameStateA_Dialog;
    break;
  case GameStateB_12:
    ret = GameStateA_13;
    break;
  case GameStateB_13:
    DAT_800e9aa7 = true;
    ret = GameStateA_13;
    break;
  case GameStateB_14:
    gGlobals.playerCharStruct.gameStateB = GameStateB_3;
    break;
  case GameStateB_15:
    gGlobals.playerCharStruct.unk10 = 0;
    gGlobals.playerCharStruct.mapLoadBool = 1;
    DAT_800e9aa7 = true;
    gMemMakerFlag = true;
    break;
  case GameStateB_16:
    DAT_800e9aa7 = true;
    ret = GameStateA_ContPak;
    break;
  case GameStateB_17:
    checking_camping_safety();
    break;
  case GameStateB_18:
    dialoug_func(BORG13_HelpMenu,0,0,0,0,0x7fff);// load help menu
    break;
  case GameStateB_19:
    gDelta = 0;
    while (Controller::GetInput(&pcStack_30,0)) {gDelta++;}
    if (gDelta < 1) gDelta = 1;
    if (*(u8*)&gDelta >= 6) gDelta = 6;
    gGlobals.delta = (float)(u8)gDelta;
    gfxTemp[0] = tick_trek_features(gfxTemp[0],(u8)gDelta);
    gGlobals.playerCharStruct.gameStateB = GameStateB_7;
    break;
  case GameStateB_22:
    if (!GetDelta_TickTrek(gfxTemp)) {
      gGlobals.playerCharStruct.gameStateB = GameStateB_23;
    }
    break;
  case GameStateB_23:
    DAT_800e9aa7 = true;
    ret = GameStateA_Cinematic;
    break;
  case GameStateB_25:
    ret = GameStateA_Credits;
  }
switchD_80024ecc_caseD_1:
  if ((some_toggle != -1) && (gGlobals.screenFadeMode == ScreenFade_None)) {
    gGlobals.playerCharStruct.gameStateB = (u8)some_toggle;
    some_toggle = -1;
  }
  if (DAT_800e9aa7) {
    Process_queue_B(&gGlobals.QueueB,1);
    clear_HUD_elements(0);
    gTrekUninitted = true;
    DAT_800e9aa7 = false;
  }
  *GG = gfxTemp[0];
  some_ticker++;
  return ret;
}

bool GetDelta_TickTrek(Gfx **GG) {
  u32 delta = 0;
  controller_aidyn *cont = NULL;
  DAT_800e9ab4++;
  while (Controller::GetInput(&cont,0)) {delta++;}
  DeltaCap(delta);
  gGlobals.delta = (float)delta;
  *GG = tick_trek_features(*GG,(u8)delta);
  if (DAT_800e9ab4 < 10) {
    DAT_800e9ab4 = 0;
    return false;
  }
  return true;
}

bool isPaused(void) {
  if ((((((gGlobals.playerCharStruct.smallerDebugWindow == NULL) &&
         (gGlobals.playerCharStruct.debugMenuTP == NULL)) &&
        (gGlobals.playerCharStruct.debugMenuActor == NULL)) &&
       ((gGlobals.playerCharStruct.debugMenuUnused0 == NULL &&
        (gGlobals.playerCharStruct.debugMenuEnemy == NULL)))) &&
      ((gGlobals.playerCharStruct.debugMenuArena == NULL &&
       ((gGlobals.playerCharStruct.debugMenuUnused1 == NULL && ((gGlobals.diaClass)->menu == NULL))))))
     && ((gGlobals.playerCharStruct.text_window == NULL &&
         ((PTR_800ed504 == NULL && (freeWidgetFunc == NULL)))))) {
    return false;
  }
  return true;
}

void func_calling_orphaned_dat(byte param_1) {
  if ((orphanedByte) && (--orphanedByte == 0)) {
    (*orphanedfuncPointer)(OrphanedFuncArg);
    orphanedfuncPointer = NULL;
  }
}

void player_control_func(controller_aidyn *cont) {
  u32 BVar1;
  
  if (gGlobals.playerCharStruct.gameStateB != GameStateB_3) return;
  if (gGlobals.screenFadeMode != ScreenFade_None) return;
#ifdef DEBUGVER
  if ((((cont->held & R_BUTTON)) && ((cont->pressed & A_BUTTON))) &&
     (gGlobals.minimap.active != 0)) {
    gGlobals.minimap.ToggleShowAll();
    return;
  }
#endif
  Actor::Move(gPlayer,cont);
  N64Print::Toggle(&gGlobals.DebugQueue,cont);
#ifdef DEBUGVER
  if(gDebugFlag) {
    if((cont->pressed & START_BUTTON)&&(cont->held & L_BUTTON)){
      init_big_debug_menu();
      cont->pressed&= ~START_BUTTON;
    }
  }
#endif  
  if ((cont->pressed & START_BUTTON)){
    if (gGlobals.playerCharStruct.smallerDebugWindow == NULL) {
      if (gPlayer) {
        (gPlayer)->ani_type = 0;
      }
      if ((cont->held & Z_BUTTON) == 0) {
        if (some_ticker < 2) return;
      }
#ifdef DEBUGVER
      else if (gDebugFlag) {
        smaller_debug_menu();
        return;
      }
#endif
      gGlobals.playerCharStruct.gameStateB = GameStateB_8;
      return;
    }
  }
  if (cont->pressed&A_BUTTON) obj_ref_func();
}

void small_debug_menu_check(controller_aidyn *param_1) {
  if ((gGlobals.screenFadeMode == ScreenFade_None) && (!check_some_toggle())) {
    bool bVar2 = isPaused();
    BaseWidget *w = WHANDLE->Control((ControllerFull *)param_1);
    bool bVar3 = isPaused();
    if ((bVar3) || (bVar2)) {
      if (w == NULL) {
        if ((gGlobals.diaClass)->menu == NULL) {
          (gPlayer)->ani_type = 0;
        }
      }
      #ifdef DEBUGVER
      else if (gGlobals.playerCharStruct.smallerDebugWindow)
        debug_combat_options(w);
      else if (gGlobals.playerCharStruct.debugMenuTP)
        DebugTeleport(w);
      else if (gGlobals.playerCharStruct.debugMenuActor)
        DebugChangeForm(w);
      else if (gGlobals.playerCharStruct.debugMenuEnemy)
        DebugSingleEnemyFight(w);
      else if (gGlobals.playerCharStruct.debugMenuArena)
        set_debug_combat_battlefeild(w);
      #endif
      else if(freeWidgetFunc) freeWidgetFunc(w);
      else if (gGlobals.diaClass->menu) run_dialougemode_funcs2();
    }
    else player_control_func(param_1);
  }
}


void Ofunc_80025724(void (*param_1)(u32),u32 param_2) {
  orphanedfuncPointer = param_1;
  OrphanedFuncArg = param_2;
  orphanedByte = 3;
}

bool GetSnapshot_(void) {
  if (gGlobals.screenshot == NULL) {
    if (get_memFree_2() < 40) return false;
    ALLOC(gGlobals.screenshot,972);
    if (get_memFree_2() > (SCREEN_HEIGHT*SCREEN_WIDTH*2)+0x10) {
     gGlobals.screenshot->dat.Height = SCREEN_HEIGHT;
     gGlobals.screenshot->dat.Width = SCREEN_WIDTH;
     gGlobals.screenshot->dat.palette = NULL;
     gGlobals.screenshot->dat.unk06 = 0;
     gGlobals.screenshot->dat.format = BORG8_RGBA16;
     gGlobals.screenshot->dat.offset = HALLOC((SCREEN_HEIGHT*SCREEN_WIDTH*2),986);
    }
    else{
      FREE(gGlobals.screenshot,990);
      return false;
    }
  }
  Graphics::passto_GetGfxLastFrame(((gGlobals.screenshot)->dat).offset,SCREEN_WIDTH,SCREEN_HEIGHT,0x10);
  QuestData::TakeSnapshot();
  N64PRINT("GetSnapShot()\n");
  return true;
}

void Flycam_UpdateCamera(flycamStruct *fly,Camera_struct *cam,vec3f *pos,vec3f *rotXY) {
  s16 sVar1;
  s16 sVar2;
  u16 uVar3;
  s16 iVar4;
  s16 iVar5;
  float fVar6;
  float fVar9;
  float fVar10;
  vec3f newpos;
  vec3f v2;
  
  sVar1 = fly->shortA;
  sVar2 = fly->shortB;
  Vec3Copy(pos,&fly->posTarget);
  Vec3Copy(rotXY,&fly->aimTarget);
  iVar4 = (fly->aimTarget.x / gGlobals.gameVars.mapCellSize.x);
  fVar10 = (float)iVar4;
  fVar6 = fVar10 * gGlobals.gameVars.mapCellSize.x;
  (fly->aim).y = (fly->aimTarget).y;
  (fly->aim).x = fly->aimTarget.x - fVar6;
  iVar5 = ((fly->aimTarget).z / gGlobals.gameVars.mapCellSize.y);
  fVar9 = (float)iVar5;
  (fly->aim).z = (fly->aimTarget).z - fVar9 * gGlobals.gameVars.mapCellSize.y;
  fVar10 = fVar10 * gGlobals.gameVars.mapCellSize.x;
  (fly->pos).y = (fly->posTarget).y;
  (fly->pos).x = (fly->posTarget).x - fVar10;
  iVar4+= (u32)fly->shortC;
  fly->shortA = (s16)iVar4;
  iVar5+= (u32)(u16)fly->ShortD;
  fly->shortB = (s16)iVar5;
  (fly->pos).z = (fly->posTarget).z - fVar9 * gGlobals.gameVars.mapCellSize.y;
  if (((iVar4) != sVar1) ||
     ((iVar5) != sVar2)) {
    CLEAR(&v2);
    newpos.x = (float)((int)sVar1 - (int)fly->shortA) * gGlobals.gameVars.mapCellSize.x;
    newpos.z = (float)((int)sVar2 - (int)fly->shortB) * gGlobals.gameVars.mapCellSize.y;
    newpos.y = v2.y;//? y pos of 0?
    v2.x = newpos.x;
    v2.z = newpos.z;
    set_teleport_obj_A(gGlobals.gameVars.mapDatA,fly->shortA,fly->shortB,&newpos);
  }
  if (cam) {
    Camera::SetAim(cam,&fly->aim);
    Camera::SetPos(cam,&fly->pos);
    Vec3Sub(&cam->rotation,&fly->aim,&fly->pos);
    Vec2Set(&cam->rotationXZ,(cam->rotation).x,(cam->rotation).z);
    Vec3Normalize(&cam->rotation);
    Vec2Normalize(&cam->rotationXZ);
  }
}

Gfx * draw_hud_elements(Gfx *gfx) {
  if ((gGlobals.diaClass)->menu == NULL) {
    gfx = Portraits::Draw(Sundial::Draw(gfx),gGlobals.playerCharStruct.show_portaits);
    if ((gGlobals.minimap.active == 0) ||
       (gGlobals.minimap.Update(gPlayer->collision.pos.x,gPlayer->collision.pos.y,gPlayer->collision.pos.z),
       gGlobals.minimap.ShowMinimap == 0)) {
      if (gGlobals.sky.Type == SkyTypeOutdoor) {
        gfx = Compass::Draw(gfx,&gCamera.rotationXZ);
      }
    }
    else gfx = gGlobals.minimap.Render(gfx);
  }
  return gfx;
}

#ifdef DEBUGVER
Gfx * zoneEngine_debug(Gfx *g,u8 delta) {
  Gfx *gTemp = g;
  if (gDebugFlag == 0) {
    handleZoneEngineFrame(&gTemp,delta,gPlayer);
    g = gTemp;
  }
  else if (gZoneEngineHide == 0) {
    handleZoneEngineFrame(&gTemp,delta,gPlayer);
    g = gTemp;
  }
  return g;
}
#endif

void TickGameTime(byte delta) {  
  if (!isPaused()) {
    World::IncGameTime(TerrainPointer,(u32)delta);
    for(u16 i=0;i<MAXPARTY;i++) {
      CharSheet *Ent = PARTY->Members[i];
      if (Ent) Entity::IncEffects(Ent,NULL,(u32)delta);
    }
    PARTY->DecRitualTimers(1,delta);
    PARTY->TickMoveCounters(delta);
  }
}

Gfx * tick_trek_features(Gfx *param_1,u8 delta) {
  ;

  if (((gGlobals.playerCharStruct.gameStateB != GameStateB_5) && (gGlobals.playerCharStruct.gameStateB != GameStateB_7)) &&
     (gGlobals.playerCharStruct.gameStateB != GameStateB_2)) {
    Gfx *gTemp = Graphics::StartDisplay(param_1,FULL_SCREENSPACE);
    #ifdef DEBUGVER
    gTemp = zoneEngine_debug(gTemp,delta);
    #else
    handleZoneEngineFrame(&gTemp,delta,gPlayer);
    #endif
    fadeFloatMirror = gGlobals.brightness;
    gTemp = Lensflare::Render(gTemp);
    gTemp = draw_hud_elements(gTemp);
    gTemp = N64Print::Draw(gTemp,(u16)delta);
    param_1 = tick_and_render_widgets(gTemp);
    if (!isPaused()) WanderTick(&gGlobals.wander,(u16)delta);
    run_dialougemode_funcs1();
    TickGameTime(delta);
    func_calling_orphaned_dat(delta);
    NewJournalEntryPopup();
  }
  return param_1;
}

void SetNewJounalEntry(s16 param_1) {newestJournal = param_1;}

void NewJournalEntryPopup(void) {
  if ((((gGlobals.screenFadeMode == ScreenFade_None) && (some_toggle == -1))
      && (!isPaused())) &&((gGlobals.playerCharStruct.gameStateB == GameStateB_3 &&
      #ifdef DEBUGVER //yeah, no clue why this discrepancy...
      (Get_eventFlagCheck(FLAG_NewJournalEntry)))))
      #else
      (getEventFlag(FLAG_NewJournalEntry)))))
      #endif
      {
    setEventFlag(FLAG_NewJournalEntry,false);
    TrekTextPopup("A new journal entry has been added.");
  }
}