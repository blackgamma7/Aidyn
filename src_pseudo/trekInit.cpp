#include "globals.h"
#include "game.h"
#include "compass.h"
#include "portraits.h"


u32 gametrek_flag0=false;
u32 gametrek_flag1=true;

void initGameTrek(void) {
  gametrek_flag0 = true;
  if (gExpPakFlag) set_AnimCache(3);
  else set_AnimCache(1);
  gGlobals.playerCharStruct.show_portaits = 1;
  MINIMAP.Toggle(1);
  Compass::Init();
  Sundial::Init();
  Portraits::InitBorder();
  Gsprintf("GameTrekInit WanderHead\n");
  WanderHead(&gGlobals.wander,39);
  InitZoneEngine(GameMode_Trek,gGlobals.playerCharStruct.some_sound_var);
  gGlobals.playerCharStruct.unkState = 3;
  if (DAT_800ee978) {
    gGlobals.playerCharStruct.unkState = 7;
    DAT_800ee978 = 0;
  }
  gPlayer =
       Actor::AllocPlayer(gGlobals.playerCharStruct.collisionRadius,gGlobals.gameVars.playerPos2d.x,
                          10.0,gGlobals.gameVars.playerPos2d.y,gGlobals.playerCharStruct.player_form);
  gPlayer->isVisible = true;
  if (gGlobals.playerCharStruct.some_sound_var == 0) {
    Camera::SetPos(PHANDLE.camera,&gPlayer->collision.pos);
    Actor::CheckCollision(gPlayer,0.0,0,0);
    Vec3Copy(&gPlayer->collision.pos,&gCamera.aimTarget);
    Vec3Copy(&gPlayer->collision.pos,&gCamera.aim);
    gCamera.unk80 = 1;
  }
  else {
    gPlayer->facing.x=gGlobals.gameVars.MapFloatDatEntry.playerVec2.x;
    gPlayer->facing.y=gGlobals.gameVars.MapFloatDatEntry.playerVec2.y;
    gPlayer->facingMirror.x=gGlobals.gameVars.MapFloatDatEntry.playerVec2.x;
    gPlayer->facingMirror.y=gGlobals.gameVars.MapFloatDatEntry.playerVec2.y;
    gPlayer->collision.pos.x = gGlobals.gameVars.MapFloatDatEntry.playerVec3.x;
    gPlayer->collision.pos.y = gGlobals.gameVars.MapFloatDatEntry.playerVec3.y;
    gPlayer->collision.pos.z = gGlobals.gameVars.MapFloatDatEntry.playerVec3.z;
    Camera::SetPos(&gCamera,&gGlobals.gameVars.MapFloatDatEntry.cameraVec3);
    Camera::SetAim(&gCamera,&gPlayer->collision.pos);
  }
  GiveCameraToPlayer(gPlayer);
  gCamera.unk80 = 1;
  SaveEngineZone(gPlayer,&gGlobals.gameVars.MapFloatDatEntry);
  mapFloatDat_copy(&gGlobals.gameVars.MapFloatDatEntry);
  gGlobals.playerCharStruct.debugMenuUnused1 = NULL;
  gGlobals.playerCharStruct.debugMenuTP = NULL;
  gGlobals.playerCharStruct.debugMenuActor = NULL;
  gGlobals.playerCharStruct.debugMenuUnused0 = NULL;
  gGlobals.playerCharStruct.debugMenuEnemy = NULL;
  gGlobals.playerCharStruct.debugMenuArena = NULL;
  if (gametrek_flag1) {
    gGlobals.playerCharStruct.smallerDebugWindow = NULL;
    gametrek_flag1 = false;
  }
  gGlobals.playerCharStruct.text_window = NULL;
  gGlobals.playerCharStruct.some_sound_var = 1;
  if (gGlobals.playerCharStruct.unk10 != 0) {
    gGlobals.brightness = 0.0;
  }
  gGlobals.playerCharStruct.unk10 = 1;
  gGlobals.screenFadeMode = 2;
  gGlobals.screenFadeSpeed = (1.0f/30);
  N64PRINT("InitGameTrek() completed.\n");
}

void clear_HUD_elements(u16 param_1) {
  Process_queue_B(&gGlobals.QueueB,1);
  SaveEngineZone(gPlayer,&gGlobals.gameVars.MapFloatDatEntry);
  Compass::Free();
  Sundial::Free();
  Portraits::FreeBorder();
  Actor::FreePlayer(gPlayer);
  gPlayer = NULL;
  bool bVar1 = gGlobals.playerCharStruct.unkState == 0xb;
  if (param_1) bVar1 = false;
  FreeZoneEngine(bVar1);
  clear_sfx_entries(&gGlobals.SFXStruct,true);
  FreeAllWanderers(&gGlobals.wander);
  FreeWanderHead(&gGlobals.wander);
  Sky::SetBackgroundType(SkyType2,0,0.0);
  gPlayer = NULL; //again??
  gametrek_flag0 = 0;
}

