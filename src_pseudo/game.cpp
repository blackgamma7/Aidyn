#include "game.h"
#include "weapondb.h"
#include "widgets/credits.h"
#include "gameStateMod.h"
#include "armordb.h"
#include "chestdb.h"
#include "shopdb.h"
#include "dialougEnt.h"
#include "skyObjects.h"
#include "sky.h"
#include "SaveEntity.h"
#include "voxelChart.h"
#include "combat/CombatStruct.h"

#define FILENAME "./src/game.cpp"

u8 initdb_flag=true;
u8 cleardb_flag=false;
u8 DAT_800e9932=0;
u8 DAT_800e9933=1;
WidgetCredits* gCreditsWidget=NULL;


void init_DBs(void) {
  N64Print::Init(&gGlobals.DebugQueue);
  init_sfx_struct(&gGlobals.SFXStruct);
  ALLOC(gSpellDBp,122);
  ALLOC(gWeaponsDB,123);
  ALLOC(gItemDBp,124);
  ALLOC(gEntityDB,125);
  ALLOC(gArmorDBp,126);
  ALLOC(gChestDBp,127);
  ALLOC(gShopDBP,128);
  ALLOC(gDialogEntityDBp,129);
  gSpellDBp->Init();
  gWeaponsDB->Init();
  gItemDBp->Init();
  gEntityDB->Init();
  gArmorDBp->Init();
  gChestDBp->Init();
  gShopDBP->Init();
  gDialogEntityDBp->Init();
  load_gamestateFunnel();
  ALLOC(PARTY,144);
  PARTY->Init();
  SaveEntity::Init();
  PARTY->AddMember(IDEntInd(Alaron));
  PARTY->Gold=1;
  ALLOC(TerrainPointer,156);
  World::init(TerrainPointer);
  Calendar cal={0,6,2,12,0,0};
  World::SetTimeFromCalendar(TerrainPointer,&cal);
  MINIMAP.Init();
  gGlobals.screenshot = NULL;
  gGlobals.screenshotTint.R = 0xff;
  gGlobals.screenshotTint.G = 0xff;
  gGlobals.screenshotTint.B = 0xff;
  gGlobals.screenshotTint.A = 0xff;
  gGlobals.cinematicReplay = 0;
  gGlobals.unk14fc = false;
  gGlobals.pauseMenuSection = 0;
  gGlobals.shopInv = NULL;
  gGlobals.shopUnused = NULL;
  gGlobals.shopSkills = NULL;
  gGlobals.ShopSpells = NULL;
  Lensflare::Init();
  Skyobjects::Init();
  Clouds::Init();
  memset_voxelChart();
  load_potion_romstring();
}

void clear_DBs(void) {
#define FREEDB(db,line)db->Free();HFREE(db,line)
  N64Print::Free();
  sfx_struct_free(&gGlobals.SFXStruct);
  FREEDB(gDialogEntityDBp,227);
  FREEDB(gShopDBP,229);
  FREEDB(gChestDBp,231);
  FREEDB(gArmorDBp,233);
  FREEDB(gEntityDB,235);
  FREEDB(gItemDBp,237);
  FREEDB(gWeaponsDB,239);
  FREEDB(gSpellDBp,241);
  FREEDB(PARTY,245);
  PARTY = NULL;
  FREE(TerrainPointer,249);
  Lensflare::Free();
  Clouds::Free();
  Skyobjects::Free();
  clear_gamestatefunnel();
  SaveEntity::Free();
  MINIMAP.Free2();
  clear_potion_romstrings();
}

void some_init_func(void) {
  CLEAR(&gGlobals.playerCharStruct);
  CLEAR(&gGlobals.gameVars);
  init_DBs();
  gGlobals.gameStateA = 0xf;
  gGlobals.combatBytes[2] = false;
  gGlobals.screenFadeMode = ScreenFade_In;
  gGlobals.screenFadeSpeed = 0.0;
  gGlobals.brightness = 0.0;
  gGlobals.brightness2 = 0.0;
  set_dialougprecallback((DialogCallback)DialoguePreCallback);
  set_dialoug_func_b((DialogCallback2)DialogEvalCallback);
  set_dialoug_func_c((DialogCallback)DialogCallbackC);
}

void passto_clear_dbs(){clear_DBs();}


u32 appState_1(Gfx **GG) {
  u32 uVar1;
  u32 uVar2;
  u32 uVar3;
  
  if (initdb_flag) {
    some_init_func();
    initdb_flag = false;
  }
  uVar2 = 1;
  FLOOR(gGlobals.delta,1.0f);
  switch (gGlobals.screenFadeMode){
  case ScreenFade_None: break;
  case ScreenFade_Out:{
        gGlobals.brightness-= gGlobals.screenFadeSpeed * gGlobals.delta;
        if (gGlobals.brightness <= 0.0) {
          gGlobals.brightness = 0.0;
          DAT_800e9932 = DAT_800e9932 + 1;
          if (2 < DAT_800e9932) {
            DAT_800e9932 = 0;
            gGlobals.screenFadeMode = ScreenFade_None;
          }
        }
        break;
      }
  case ScreenFade_In:{
        gGlobals.brightness+= gGlobals.screenFadeSpeed * gGlobals.delta;
code_r0x80023c48:
    if (1.0f <= gGlobals.brightness) {
      gGlobals.brightness = 1.0f;
      gGlobals.screenFadeMode = ScreenFade_None;
    }
    break;
  }
  case ScreenFade_3:{
      gGlobals.brightness2+= gGlobals.screenFadeSpeed * gGlobals.delta;
      gGlobals.brightness = gGlobals.brightness2;
      if (gGlobals.brightness2 <= 0.0) {
        gGlobals.brightness = -gGlobals.brightness2;
      }
      goto code_r0x80023c48;
    }
  default:
    Gsprintf("screenFadeMode is unknown: %d\n",gGlobals.screenFadeMode);
    CRASH("game.cpp",gGlobals.text);
  }
  fadeFloatMirror = gGlobals.brightness;
  gGlobals.gameVars.particleHead.gray = gGlobals.brightness;
  if (true) {
    switch(gGlobals.gameStateA) {
    case 1:
    case 9:
      gGlobals.gameStateA = GameStateA_1_9(GG);
      break;
    case 2:
      gGlobals.gameStateA = GameStateA_2(GG);
      break;
    case 3:
      gGlobals.gameStateA = GameStateA_3(GG);
      if (gGlobals.gameStateA != 2) {
        if (gGlobals.gameStateA != 1) break;
        gGlobals.gameStateA = 2;
        gGlobals.combatBytes[0] = CombatState_16;
      }
      break;
    case 5:
    case 6:
    case 7:
    case 8:
      gGlobals.gameStateA = GameStateA_3(GG);
      break;
    case 10:
      gGlobals.gameStateA = GameStateA_10(GG);
      break;
    case 0xc:
      gGlobals.gameStateA = GameStateA_12(GG);
      break;
    case 0xe:
      gGlobals.gameStateA = Cinematic::Tick(GG);
      break;
    case 0xf:
      gGlobals.gameStateA = gameStart(GG);
      break;
    case 0x11:
      gGlobals.gameStateA = appState_2(GG);
      break;
    case 0x13:
      gGlobals.gameStateA = func_loading_credits(GG);
    }
  }
LAB_80023d98:
  if (TerrainPointer) World::AddPlayTime(TerrainPointer,gGlobals.delta);  
  if (gGlobals.gameStateA == 0) {
    cleardb_flag = true;
    uVar2 = 0;
  }
  if (cleardb_flag) {
    passto_clear_dbs();
    initdb_flag = true;
    cleardb_flag = false;
  }
  return uVar2;
}

u8 func_loading_credits(Gfx **GG) {
  u8 ret;
  u32 delta;
  ControllerFull *local_28;
  
  if (DAT_800e9933) {
    if ((0.0 < (double)gGlobals.brightness) &&
       (gGlobals.screenFadeMode == ScreenFade_None)) {
      gGlobals.screenFadeMode = ScreenFade_Out;
      return 0x13;
    }
    gGlobals.screenFadeMode = ScreenFade_In;
    gCreditsWidget = new WidgetCredits();
    WHANDLE->AddWidget(gCreditsWidget);
    DAT_800e9933 = false;
  }
  if (gCreditsWidget == NULL) {
    ret = 0x13;
  }
  else {
    delta = 0;
    while (Controller::GetInput((controller_aidyn **)local_28,0)) {
      delta++;
      WHANDLE->Control(local_28);
    }
    DeltaCap(delta);
    gGlobals.delta = delta;
    *GG = DrawRectangle(*GG,FULL_SCREENSPACE,0,0,0,0);
    *GG = Graphics::StartDisplay(*GG,FULL_SCREENSPACE);
    *GG = tick_and_render_widgets(*GG);
    ret = 0x13;
    if (gCreditsWidget->creditState == 4) {
      gCreditsWidget->SetState(WidgetS_Closing);
      DAT_800e9933 = 1;
      if (gGlobals.creditsByte == 1) ret = 9;
      else {
        ret = 0;
        if ((gGlobals.creditsByte < 2) && (gGlobals.creditsByte == 0)) {
          ret = 0xf;
        }
      }
      gCreditsWidget = NULL;
    }
  }
  return ret;
}

