#include "globals.h"
#include "compass.h"
#include "vobjects.h"
#include "memaker.h"

#define FILENAME "./src/gametrek.cpp"

u8 orphanedByte=0;
void(*orphanedfuncPointer)(u32)=NULL;
u32 OrphanedFuncArg=0;
s16 newestJournal=-1;
u32 some_ticker=0;
s16 some_toggle=0;
u8 gTrekUninitted=true;
u8 DAT_800e9aa7=0;
u8 gMemMakerFlag=false;
u16 gDelta=1;
u32 DAT_800e9aac=1;
u32 DAT_800e9ab0=0;

bool check_some_toggle(void) {return some_toggle != -1;}

void FUN_80024c54(short param_1) {
  if (some_toggle == -1) {
    gGlobals.screenFadeMode = 1;
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

u8 screenFadeMode_1_9(Gfx **param_1) {
  bool bVar1;
  u8 uVar2;
  controller_aidyn *pcStack_30;
  Gfx *apGStack_2c [11];
  
  uVar2 = 1;
  apGStack_2c[0] = *param_1;
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
  if ((((gGlobals.playerCharStruct.unkState == 3) && (!check_some_toggle())) &&
      (gGlobals.screenFadeMode == 0)) && (FUN_8000ccc0())) {
    gGlobals.playerCharStruct.unkState = 0xf;
  }
  if (gGlobals.screenFadeModeSwitch == 9) {
    if (DAT_800e9aac != 0) {
      gGlobals.brightness = 0.0;
      DAT_800e9aac = 0;
      gGlobals.screenFadeMode = 2;
      gGlobals.screenFadeSpeed = (1.0f/30);
      Sky::SetBackgroundType(gGlobals.BackgroundTypeCopy,gGlobals.gameVars.weather.skyBgdat,0.0);
    }
    if (gGlobals.screenFadeMode == 0) {
      gGlobals.playerCharStruct.unkState = 8;
      DAT_800e9aac = 1;
    }
    else {
      uVar2 = 9;
      gGlobals.playerCharStruct.unkState = 3;
    }
  }
  if (false) goto switchD_80024ecc_caseD_1;
  switch(gGlobals.playerCharStruct.unkState) {
  case 0:
    DAT_800e9aa7 = '\x01';
    uVar2 = 0;
    break;
  case 2:
    DAT_800e9aa7 = '\x01';
    uVar2 = 2;
    break;
  case 3:
    gDelta = 0;
    if (gGlobals.screenFadeModeSwitch == 9) {
      while (bVar1 = Controller::GetInput(&pcStack_30,0), bVar1) {
        gDelta++;
      }
    }
    else {
      while (bVar1 = Controller::GetInput(&pcStack_30,0), bVar1) {
        small_debug_menu_check(pcStack_30);
        gDelta++;
      }
    }
    if (gDelta < 1) {
      gDelta = 1;
    }
    if (gDelta < 7) {
    }
    else {
      gDelta = 6;
    }
    gGlobals.delta = (float)(u8)gDelta;
    apGStack_2c[0] = tick_trek_features(apGStack_2c[0],(u8)gDelta);
    break;
  case 4:
    DAT_800e9aa7 = '\x01';
    break;
  case 5:
  case 6:
  case 7:
  case 8:
    if (DAT_800e9ab0 == 0) {
      FreeZoneEngineMemory();
      DAT_800e9ab0 = 1;
    }
    if (gGlobals.QueueA.items != 0) goto LAB_80025208;
    GetSnapshot_();
    gGlobals.BackgroundTypeCopy = gGlobals.sky.Type;
    if (gGlobals.playerCharStruct.unkState == 6) {
      uVar2 = 6;
    }
    else if (gGlobals.playerCharStruct.unkState < 7) {
      uVar2 = 8;
      if (gGlobals.playerCharStruct.unkState == 5) {
        uVar2 = 5;
      }
    }
    else {
      uVar2 = 8;
      if (gGlobals.playerCharStruct.unkState == 7) {
        uVar2 = 7;
      }
    }
    some_ticker = 0;
    DAT_800e9ab0 = 0;
    break;
  case 9:
    DAT_800e9aa7 = '\x01';
    uVar2 = 10;
    break;
  case 10:
    DAT_800e9aa7 = '\x01';
    uVar2 = 0xb;
    break;
  case 0xb:
    DAT_800e9aa7 = '\x01';
    uVar2 = 0xc;
    break;
  case 0xc:
    goto switchD_80024ecc_caseD_c;
  case 0xd:
    DAT_800e9aa7 = '\x01';
    goto switchD_80024ecc_caseD_c;
  case 0xe:
    gGlobals.playerCharStruct.unkState = 3;
    break;
  case 0xf:
    gGlobals.playerCharStruct.unk10 = 0;
    gGlobals.playerCharStruct.some_sound_var = 1;
    DAT_800e9aa7 = '\x01';
    gMemMakerFlag = true;
    break;
  case 0x10:
    DAT_800e9aa7 = '\x01';
    uVar2 = 0x11;
    break;
  case 0x11:
    checking_camping_safety();
    goto LAB_80025208;
  case 0x12:
    dialoug_func(BORG13_HelpMenu,0,0,0,0,0x7fff);// load help menu
    goto LAB_80025208;
  case 0x13:
    gDelta = 0;
    while (bVar1 = Controller::GetInput(&pcStack_30,0), bVar1) {
      gDelta++;
    }
    if (gDelta < 1) {
      gDelta = 1;
    }
    if (gDelta < 7) {}
    else {
      gDelta = 6;
    }
    gGlobals.delta = (float)(int)gDelta;
    apGStack_2c[0] = tick_trek_features(apGStack_2c[0],(u8)gDelta);
    gGlobals.playerCharStruct.unkState = 7;
    break;
  case 0x16:
    if (!GetDelta_TickTrek(apGStack_2c)) {
      gGlobals.playerCharStruct.unkState = 0x17;
    }
    goto LAB_80025208;
  case 0x17:
    DAT_800e9aa7 = '\x01';
    uVar2 = 0xe;
    break;
  case 0x19:
    uVar2 = 0x13;
  }
switchD_80024ecc_caseD_1:
LAB_80025208:
  if ((some_toggle != -1) && (gGlobals.screenFadeMode == 0)) {
    gGlobals.playerCharStruct.unkState = (u8)some_toggle;
    some_toggle = -1;
  }
  if (DAT_800e9aa7 != '\0') {
    Process_queue_B(&gGlobals.QueueB,1);
    clear_HUD_elements(0);
    gTrekUninitted = true;
    DAT_800e9aa7 = '\0';
  }
  *param_1 = apGStack_2c[0];
  some_ticker = some_ticker + 1;
  return uVar2;
switchD_80024ecc_caseD_c:
  uVar2 = 0xd;
  goto switchD_80024ecc_caseD_1;
}

extern u32 DAT_800e9ab4;
bool GetDelta_TickTrek(Gfx **param_1) {
  bool bVar2;
  Gfx *pGVar1;
  uint delay;
  double dVar3;
  controller_aidyn *apcStack_20 [8];
  
  delay = 0;
  apcStack_20[0] = NULL;
  DAT_800e9ab4++;
  while (Controller::GetInput(apcStack_20,0)) {
    delay++;
  }
  DeltaCap(delay);
  gGlobals.delta = (float)delay;
  pGVar1 = tick_trek_features(*param_1,(u8)delay);
  *param_1 = pGVar1;
  if (DAT_800e9ab4 < 10) {
    DAT_800e9ab4 = 0;
    bVar2 = false;
  }
  else bVar2 = true;
  return bVar2;
}



extern BaseWidget* PTR_800ed504;
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
  
  if (gGlobals.playerCharStruct.unkState != 3) return;
  if (gGlobals.screenFadeMode != 0) return;
#ifdef DEBUGVER
  if ((((cont->input_2 & R_BUTTON)) && ((cont->input & A_BUTTON))) &&
     (gGlobals.minimap.active != 0)) {
    gGlobals.minimap.ToggleShowAll();
    return;
  }
#endif
  Actor::Move(gGlobals.playerCharStruct.playerDat,cont);
  N64Print::Toggle(&gGlobals.DebugQueue,cont);
#ifdef DEBUGVER
  if(gDebugFlag) {
    if((cont->input & START_BUTTON)&&(cont->input_2 & L_BUTTON)){
      init_big_debug_menu();
      cont->input&= ~START_BUTTON;
    }
  }
#endif  
  if ((cont->input & START_BUTTON)){
    if (gGlobals.playerCharStruct.smallerDebugWindow == NULL) {
      if (gGlobals.playerCharStruct.playerDat) {
        (gGlobals.playerCharStruct.playerDat)->ani_type = 0;
      }
      if ((cont->input_2 & Z_BUTTON) == 0) {
        if (some_ticker < 2) return;
      }
#ifdef DEBUGVER
      else if (gDebugFlag) {
        smaller_debug_menu();
        return;
      }
#endif
      gGlobals.playerCharStruct.unkState = 8;
      return;
    }
  }
  if (cont->input&A_BUTTON) obj_ref_func();
}

void small_debug_menu_check(controller_aidyn *param_1) {
  if ((gGlobals.screenFadeMode == 0) && (!check_some_toggle())) {
    bool bVar2 = isPaused();
    BaseWidget *w = WHANDLE->Control((ControllerFull *)param_1);
    bool bVar3 = isPaused();
    if ((bVar3) || (bVar2)) {
      if (w == NULL) {
        if ((gGlobals.diaClass)->menu == NULL) {
          (gGlobals.playerCharStruct.playerDat)->ani_type = 0;
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
     gGlobals.screenshot->dat.PALSize = 0;
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

void some_flycam_dat_func(flycamStruct *fly,Camera_struct *cam,vec3f *param_3,vec3f *param_4) {
  short sVar1;
  short sVar2;
  ushort uVar3;
  s16 iVar4;
  s16 iVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  vec3f fStack160;
  vec3f fStack96;
  
  sVar1 = fly->shortA;
  sVar2 = fly->shortB;
  copyVec3(param_3,&fly->posTarget);
  copyVec3(param_4,&fly->aimTarget);
  fVar8 = gGlobals.gameVars.mapCellSize.y;
  fVar9 = (fly->aimTarget).x;
  iVar4 = (fVar9 / gGlobals.gameVars.mapCellSize.x);
  fVar10 = (float)iVar4;
  fVar6 = fVar10 * gGlobals.gameVars.mapCellSize.x;
  fVar7 = (fly->aimTarget).z;
  (fly->aim).y = (fly->aimTarget).y;
  (fly->aim).x = fVar9 - fVar6;
  iVar5 = (fVar7 / fVar8);
  fVar9 = (float)iVar5;
  (fly->aim).z = fVar7 - fVar9 * gGlobals.gameVars.mapCellSize.y;
  fVar10 = fVar10 * gGlobals.gameVars.mapCellSize.x;
  uVar3 = fly->shortC;
  fVar8 = (fly->posTarget).x;
  (fly->pos).y = (fly->posTarget).y;
  (fly->pos).x = fVar8 - fVar10;
  fVar8 = gGlobals.gameVars.mapCellSize.y;
  iVar4+= (uint)uVar3;
  fly->shortA = (short)iVar4;
  fVar6 = (fly->posTarget).z;
  iVar5 = iVar5 + (uint)(ushort)fly->ShortD;
  fly->shortB = (short)iVar5;
  (fly->pos).z = fVar6 - fVar9 * fVar8;
  if (((iVar4) != sVar1) ||
     ((iVar5) != sVar2)) {
    CLEAR(&fStack96);
    fStack160.x = (float)((int)sVar1 - (int)fly->shortA) * gGlobals.gameVars.mapCellSize.x;
    fStack160.z = (float)((int)sVar2 - (int)fly->shortB) * gGlobals.gameVars.mapCellSize.y;
    fStack160.y = fStack96.y;
    fStack96.x = fStack160.x;
    fStack96.z = fStack160.z;
    set_teleport_obj_A(gGlobals.gameVars.mapDatA,fly->shortA,fly->shortB,&fStack160);
  }
  if (cam) {
    Camera::SetAim(cam,&fly->aim);
    Camera::SetPos(cam,&fly->pos);
    Vec3_sub(&cam->rotation,&fly->aim,&fly->pos);
    setVec2(&cam->rotationXZ,(cam->rotation).x,(cam->rotation).z);
    vec3_normalize(&cam->rotation);
    vec2_normalize(&cam->rotationXZ);
  }
}

Gfx * draw_hud_elements(Gfx *gfx) {
  if ((gGlobals.diaClass)->menu == NULL) {
    gfx = Portraits::Draw(Sundial::Draw(gfx),gGlobals.playerCharStruct.show_portaits);
    if ((gGlobals.minimap.active == 0) ||
       (gGlobals.minimap.Update(((gGlobals.playerCharStruct.playerDat)->collision).pos.x,
                        ((gGlobals.playerCharStruct.playerDat)->collision).pos.y,
                        ((gGlobals.playerCharStruct.playerDat)->collision).pos.z),
       gGlobals.minimap.ShowMinimap == 0)) {
      if (gGlobals.sky.Type == 3) {
        gfx = Compass::Draw(gfx,&gGlobals.gameVars.camera.rotationXZ);
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
    handleZoneEngineFrame(&gTemp,delta,gGlobals.playerCharStruct.playerDat);
    g = gTemp;
  }
  else if (gZoneEngineHide == 0) {
    handleZoneEngineFrame(&gTemp,delta,gGlobals.playerCharStruct.playerDat);
    g = gTemp;
  }
  return g;
}
#endif

void TickGameTime(byte delta) {  
  if (!isPaused()) {
    World::IncGameTime(TerrainPointer,(uint)delta);
    for(u16 i=0;i<MAXPARTY;i++) {
      CharSheet *Ent = PARTY->Members[i];
      if (Ent) Entity::IncEffects(Ent,NULL,(uint)delta);
    }
    PARTY->DecRitualTimers(1,delta);
    PARTY->TickMoveCounters(delta);
  }
}

Gfx * tick_trek_features(Gfx *param_1,u8 delta) {
  Gfx *gTemp;

  if (((gGlobals.playerCharStruct.unkState != 5) && (gGlobals.playerCharStruct.unkState != 7)) &&
     (gGlobals.playerCharStruct.unkState != 2)) {
    gTemp = Graphics::StartDisplay(param_1,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
    #ifdef DEBUGVER
    gTemp = zoneEngine_debug(gTemp,delta);
    #else
    handleZoneEngineFrame(&gTemp,delta,gGlobals.playerCharStruct.playerDat);
    #endif
    fadeFloatMirror = gGlobals.brightness;
    gTemp = Lensflare::Render(gTemp);
    gTemp = draw_hud_elements(gTemp);
    gTemp = N64Print::Draw(gTemp,(ushort)delta);
    param_1 = tick_and_render_widgets(gTemp);
    if (!isPaused()) WanderTick(&gGlobals.wander,(ushort)delta);
    run_dialougemode_funcs1();
    TickGameTime(delta);
    func_calling_orphaned_dat(delta);
    NewJournalEntryPopup();
  }
  return param_1;
}

void SetNewJounalEntry(s16 param_1) {newestJournal = param_1;}

void NewJournalEntryPopup(void) {
  if ((((gGlobals.screenFadeMode == 0) && (some_toggle == -1)) && (bVar1 = isPaused(), !bVar1)) &&
     ((gGlobals.playerCharStruct.unkState == 3 &&
      #ifdef DEBUGVER //yeah, no clue why this discrepancy...
      (Get_eventFlagCheck(FLAG_NewJournalEntry)))))
      #else
      (getEventFlag(FLAG_NewJournalEntry)))))
      #endif
      {
    setEventFlag(FLAG_NewJournalEntry,false);
    textbox_func("A new journal entry has been added.");
  }
}