#include "globals.h"
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
#include "game.h"

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
  PARTY->AddMember(IDEntInd(EntInd_Alaron));
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
  gGlobals.screenFadeModeSwitch = 0xf;
  gGlobals.combatBytes[2] = 0;
  gGlobals.screenFadeMode = 2;
  gGlobals.screenFadeSpeed = 0.0;
  gGlobals.brightness = 0.0;
  gGlobals.brightness2 = 0.0;
  set_dialougprecallback(DialoguePreCallback);
  set_dialoug_func_b(DialogEvalCallback);
  set_dialoug_func_c(DialogCallbackC);
}

void passto_clear_dbs(){clear_DBs();}


u32 appState_1(Gfx **GG) {
  u32 uVar1;
  u32 uVar2;
  uint uVar3;
  
  if (initdb_flag) {
    some_init_func();
    initdb_flag = false;
  }
  uVar2 = 1;
  FLOOR(gGlobals.delta,1.0f);
  //TODO: refactor as Case-switch
  if (gGlobals.screenFadeMode == 2) {
    gGlobals.brightness+= gGlobals.screenFadeSpeed * gGlobals.delta;
code_r0x80023c48:
    if (1.0f <= gGlobals.brightness) {
      gGlobals.brightness = 1.0f;
      gGlobals.screenFadeMode = 0;
    }
  }
  else {
    if (gGlobals.screenFadeMode < 3) {
      if (gGlobals.screenFadeMode == 1) {
        gGlobals.brightness-= gGlobals.screenFadeSpeed * gGlobals.delta;
        if (gGlobals.brightness <= 0.0) {
          gGlobals.brightness = 0.0;
          DAT_800e9932 = DAT_800e9932 + 1;
          if (2 < DAT_800e9932) {
            DAT_800e9932 = 0;
            gGlobals.screenFadeMode = 0;
          }
        }
        goto LAB_80023c90;
      }
    }
    else if (gGlobals.screenFadeMode == 3) {
      gGlobals.brightness+= gGlobals.screenFadeSpeed * gGlobals.delta;
      gGlobals.brightness = gGlobals.brightness2;
      if (gGlobals.brightness2 <= 0.0) {
        gGlobals.brightness = -gGlobals.brightness2;
      }
      goto code_r0x80023c48;
    }
    if (gGlobals.screenFadeMode) {
      Gsprintf("screenFadeMode is unknown: %d\n",gGlobals.screenFadeMode);
      CRASH("game.cpp",gGlobals.text);
    }
  }
LAB_80023c90:
  fadeFloatMirror = gGlobals.brightness;
  gGlobals.gameVars.particleEmmiter.gray = gGlobals.brightness;
  if (true) {
    switch(gGlobals.screenFadeModeSwitch) {
    case 1:
    case 9:
      gGlobals.screenFadeModeSwitch = screenFadeMode_1_9(GG);
      break;
    case 2:
      gGlobals.screenFadeModeSwitch = ScreenFadeMode_2(GG);
      break;
    case 3:
      gGlobals.screenFadeModeSwitch = ScreenFadeMode_3(GG);
      if (gGlobals.screenFadeModeSwitch != 2) {
        if (gGlobals.screenFadeModeSwitch != 1) break;
        gGlobals.screenFadeModeSwitch = 2;
        gGlobals.combatBytes[0] = 0x10;
      }
      break;
    case 5:
    case 6:
    case 7:
    case 8:
      gGlobals.screenFadeModeSwitch = ScreenFadeMode_3(GG);
      break;
    case 10:
      gGlobals.screenFadeModeSwitch = ScreenFademode_10(GG);
      break;
    case 0xc:
      gGlobals.screenFadeModeSwitch = ScreenFadeMode_12(GG);
      break;
    case 0xe:
      gGlobals.screenFadeModeSwitch = Cinematic::Tick(GG);
      break;
    case 0xf:
      gGlobals.screenFadeModeSwitch = gameStart(GG);
      break;
    case 0x11:
      gGlobals.screenFadeModeSwitch = appState_2(GG);
      break;
    case 0x13:
      gGlobals.screenFadeModeSwitch = func_loading_credits(GG);
    }
  }
LAB_80023d98:
  if (TerrainPointer) {
    World::AddPlayTime(TerrainPointer,gGlobals.delta);
  }
  if (gGlobals.screenFadeModeSwitch == 0) {
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
  u8 uVar2;
  bool bVar3;
  Gfx *pGVar1;
  uint delta;
  ulonglong in_f2; //??
  ControllerFull *local_28 [10];
  
  if (DAT_800e9933) {
    if (((double)(in_f2 & 0xffffffff00000000) < (double)gGlobals.brightness) &&
       (gGlobals.screenFadeMode == 0)) {
      gGlobals.screenFadeMode = 1;
      return 0x13;
    }
    gGlobals.screenFadeMode = 2;
    gCreditsWidget = new WidgetCredits();
    WHANDLE->AddWidget(gCreditsWidget);
    DAT_800e9933 = false;
  }
  if (gCreditsWidget == NULL) {
    uVar2 = 0x13;
  }
  else {
    delta = 0;
    while (Controller::GetInput((controller_aidyn **)local_28,0)) {
      delta++;
      WHANDLE->Control(local_28[0]);
    }
    DeltaCap(delta);
    gGlobals.delta = delta;
    *GG = DrawRectangle(*GG,FULL_SCREENSPACE,0,0,0,0);
    *GG = Graphics::StartDisplay(*GG,FULL_SCREENSPACE);
    *GG = tick_and_render_widgets(*GG);
    uVar2 = 0x13;
    if (gCreditsWidget->creditState == 4) {
      gCreditsWidget->SetState(WidgetS_Closing);
      DAT_800e9933 = 1;
      if (gGlobals.creditsByte == 1) uVar2 = 9;
      else {
        uVar2 = 0;
        if ((gGlobals.creditsByte < 2) && (gGlobals.creditsByte == 0)) {
          uVar2 = 0xf;
        }
      }
      gCreditsWidget = NULL;
    }
  }
  return uVar2;
}

