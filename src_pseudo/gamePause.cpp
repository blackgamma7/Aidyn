#include "game.h"
#include "combat/CombatStruct.h"
#include "QuestData.h"

u8 u8_800edb90=0;
u8 u8_800edb91=0;
u32 DAT_800edb94=0;
u8 some_screenfade_flag=true;
u8 u8_800edb99=0;

void FUN_8004fe00(void) {
  u8 bVar2;
  
  if (false) {
switchD_8004fe44_caseD_4:
    gGlobals.SomeCase = 7;
    bVar2 = gGlobals.pauseMenuSection;
  }
  else {
    switch(gGlobals.screenFadeModeSwitch) {
    case 3:
      bVar2 = 1;
      gGlobals.SomeCase = 3;
      break;
    default:
      goto switchD_8004fe44_caseD_4;
    case 5:
      bVar2 = 1;
      gGlobals.SomeCase = 4;
      break;
    case 6:
      bVar2 = 1;
      gGlobals.SomeCase = 5;
      break;
    case 7:
      bVar2 = 1;
      gGlobals.SomeCase = 6;
    }
  }
  if (gGlobals.unk14fc) bVar2 = 0;
  gGlobals.BigAssMenu = new PauseWidget(gGlobals.widgetHandler,bVar2);
}

bool set_screenshot_tint() {
  gGlobals.SomeCase = 0xe;
  if (0x80 < gGlobals.screenshotTint.R) {
    gGlobals.screenshotTint.G = 0x80;
    if (0x8a < gGlobals.screenshotTint.R) {
      gGlobals.screenshotTint.G = gGlobals.screenshotTint.R - 10;
    }
    gGlobals.screenshotTint.R = gGlobals.screenshotTint.B =gGlobals.screenshotTint.G;
    return false;
  }
  return true;
}


Gfx * draw_screenshot_background(Gfx *g,u8 state) {
  if (gGlobals.screenshot == NULL) {
    g = Graphics::SomeOtherInit(g,FULL_SCREENSPACE,0,0,0,0);
  }
  else if (((gGlobals.BigAssMenu == NULL) ||
           (WHANDLE->GetTail()!=gGlobals.BigAssMenu)) || (state != 3)) {
    RSPFUNC5(g);
    g = Borg8_DrawSimple(g,gGlobals.screenshot,0.0,0.0,1.0f,1.0f
                              ,gGlobals.screenshotTint.R,gGlobals.screenshotTint.G,
                              gGlobals.screenshotTint.B,gGlobals.screenshotTint.A);
  }
  else {
    g = Graphics::SomeOtherInit(g,FULL_SCREENSPACE,0,0,0,0);
    RSPFUNC5(g);
    g = N64BorgImageDraw(g,gGlobals.screenshot,0.0,0.0,0,0,Graphics::GetHRes(),40,1.0f,
                              1.0f,gGlobals.screenshotTint.R,gGlobals.screenshotTint.G,
                              gGlobals.screenshotTint.B,gGlobals.screenshotTint.A);
    g = N64BorgImageDraw(g,gGlobals.screenshot,0.0,(Graphics::GetVRes() - 40),0,
                              Graphics::GetVRes() - 40,Graphics::GetHRes(),Graphics::GetVRes(),
                              1.0f,1.0f,gGlobals.screenshotTint.R,
                              gGlobals.screenshotTint.G,gGlobals.screenshotTint.B,
                              gGlobals.screenshotTint.A);
  }
  return g;
}


u8 ScreenFadeMode_3(Gfx **GG) {
  short delta;
  Gfx *g;
  byte bVar6;
  ushort uVar3;
  ushort uVar4;
  vec3f *pos;
  byte bVar7;
  float fVar8;
  vec3f zeroPos;
  
  bVar7 = gGlobals.screenFadeModeSwitch;
  g = *GG;
  if ((some_screenfade_flag) && (set_screenshot_tint())) {
    FUN_8004fe00();
    some_screenfade_flag = false;
  }
  s16 delta = FUN_800505f4();
  g = Graphics::StartDisplay(g,FULL_SCREENSPACE);
  bVar6 = WHANDLE->Tick(delta);
  if (true) {
    switch(gGlobals.SomeCase) {
    case 0:
      u8_800edb99 = 1;
      bVar7 = 0;
      break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      g = draw_screenshot_background(g,bVar6);
      RSPFUNC6(g);
      g = WHANDLE->Render(g,FULL_SCREENSPACE);
      break;
    case 8:
    case 0xb:
      u8_800edb99 = 1;
      bVar7 = 1;
      break;
    case 9:
      bVar7 = 2;
      u8_800edb99 = 1;
      gGlobals.combatBytes[0] = gGlobals.combatBytes[1];
      if (gGlobals.unk14fc) {
        if (gGlobals.combatBytes[1] != 0x14) {
          gGlobals.combatBytes[0] = (byte)gGlobals.combatByteMirror;
        }
        goto LAB_800504ac;
      }
      break;
    case 10:
      bVar7 = 1;
      u8_800edb99 = 1;
      gGlobals.combatBytes[0] = 1;
      break;
    case 0xc:
      BaseWidget* pPVar2= WHANDLE->GetTail();
      if ((pPVar2 == gGlobals.BigAssMenu) && (pPVar2)) {
        g = draw_screenshot_background(g,bVar6);
        RSPFUNC6(g);
        g = WHANDLE->Render(g,FULL_SCREENSPACE);
      }
      else {
        gGlobals.BigAssMenu = NULL;
        gGlobals.screenFadeModeSwitch = 7;
        gGlobals.SomeCase = u8_800edb90;
        gGlobals.playerCharStruct.unkState = u8_800edb91;
        if (u8_800edb90 == 6) {
          bVar7 = 6;
          gGlobals.BigAssMenu = new PauseWidget(gGlobals.widgetHandler,1);
          WHANDLE->Tick(1);
          g = draw_screenshot_background(g,bVar6);
          RSPFUNC6(g);
          g = WHANDLE->Render(g,FULL_SCREENSPACE);
        }
      }
      break;
    case 0xd:
      u8_800edb99 = 1;
      bVar7 = 0xe;
      break;
    case 0xe:
      g = draw_screenshot_background(g,bVar6);
    }
  }
LAB_800504ac:
  g = N64Print::Draw(g,delta);
  pos = &zeroPos;
  zeroPos={0,0,0};
  if (gPlayer) pos = &gPlayer->collision.pos;
  if (gGlobals.gameVars.BGM) {
    DCM::Start(gGlobals.gameVars.BGMIndex,gGlobals.gameVars.BGMID,gGlobals.VolBGM*255.0f);
  }
  ProcessAudioBubbles(&gGlobals.SFXStruct,pos,1);
  if (u8_800edb99) {
    if (gGlobals.screenshot) {
        FREEQBP(gGlobals.screenshot->dat.offset);
        FREEQBP(gGlobals.screenshot);
    }
    QuestData::FreeSnapshot();
    func_clearing_shopkeep();
    some_screenfade_flag = true;
    u8_800edb99 = 0;
  }
  *GG = g;
  return bVar7;
}


int FUN_800505f4(void) {
  BaseWidget *w;
  bool bVar2;
  int delta;
  controller_aidyn *apCStack_20;
  
  delta = 0;
  if (DAT_800edb94) {
    FUN_800508b4(4);
    DAT_800edb94 = 0;
    gGlobals.SomeCase = 0xc;
    gGlobals.barterMenu = gGlobals.BigAssMenu;
  }
  if (gGlobals.SomeCase == 0xc) {
    return 1;
  }
  UINT_800ed580 = false;
  do {//TODO: refactor ugly while loop
    while( true ) {
      if (!Controller::GetInput(&apCStack_20,0)) {
        if (delta < 1) delta = 1;
        if (6 < delta) delta = 6;
        gGlobals.delta = (float)delta;
        return delta;
      }
      w = WHANDLE->Control((ControllerFull *)apCStack_20);
      if (w) break;
LAB_80050770:
      delta++;
    }
    if (freeWidgetFunc == NULL) {
      u8_800edb91 = gGlobals.playerCharStruct.unkState;
      switch(gGlobals.SomeCase) {
      case 3:
        u8_800edb90 = 9;
        gGlobals.BigAssMenu->bigAssOpenCallback_2();
        break;
      case 4:
        u8_800edb91 = 3;
        u8_800edb90 = 10;
        gGlobals.BigAssMenu->bigAssOpenCallback_2();
        break;
      case 5:
        u8_800edb90 = 6;
        gGlobals.BigAssMenu->bigAssOpenCallback_2();
        gGlobals.combatBytes[0] = 0xf;
        gGlobals.screenFadeModeSwitch = 7;
        break;
      case 6:
        setGlobalsPointer(w);
        break;
      case 7:
        FUN_800508b4(w->varU16);
      }
      gGlobals.SomeCase = 0xc;
      gGlobals.barterMenu = w;
      goto LAB_80050770;
    }
    (*freeWidgetFunc)(w);
  } while( true );
}

void func_clearing_shopkeep(void) {
  if ((!some_combat_flag_) && (!gametrek_flag0))
     clear_sfx_entries(&gGlobals.SFXStruct,true);
  gOptionsMenuContPak = 0;
  gGlobals.playerCharStruct.current_shopkeep=0;
  if (!DAT_800e9c14) {
    no_TP_vec3 = 1;
    loadGameBorgScenes(gGlobals.gameVars.mapShort1,gGlobals.gameVars.mapShort2);
  }
  gGlobals.unk14fc = false;
  freeWidgetFunc = NULL;
}

void FUN_80050868(void) {
  DAT_800edb94 = true;
  PlayAudioSound(&gGlobals.SFXStruct,0x740,0,1.0,60,0);
  Sky::ResetColors();
}

void FUN_800508b4(u16 param_1) {
  switch(param_1) {
  case 1:
    u8_800edb91 = 0x11;
    u8_800edb90 = 8;
    break;
  case 2:
    u8_800edb91 = 0x16;
    u8_800edb90 = 10;
    break;
  case 3:
    u8_800edb91 = 0x12;
    u8_800edb90 = 0xb;
    break;
  case 4:
    u8_800edb91 = 4;
    u8_800edb90 = 10;
    break;
  case 5:
    u8_800edb91 = 0x19;
    u8_800edb90 = 10;
    break;
  default:
    u8_800edb91 = 3;
    u8_800edb90 = 10;
    break;
  }

  gGlobals.BigAssMenu->bigAssOpenCallback_2();
}

void setGlobalsPointer(BaseWidget *param_1) {
  u8_800edb91 = 3;
  u8_800edb90 = 10;
  gGlobals.BigAssMenu->bigAssOpenCallback_2();
  gGlobals.barterMenu = param_1;
  gGlobals.SomeCase = 0xc;
}

void passto_getSnapshot(){GetSnapshot_();}

void set_shopkeep_skills(CharSkills *sk,SpellBook *sp) {
  GetSnapshot_();
  gGlobals.ShopSpells = sp;
  gGlobals.shopSkills = sk;
}

void build_loot_menu(GenericInventory *loot,int gold,ItemID keep) {
  if (gGlobals.screenshot == NULL) GetSnapshot_();
  gGlobals.shopInv = loot;
  gGlobals.Shopkeep = keep;
  gGlobals.moneypile = gold;
  if (keep == Item_NONE) PARTY->Gold+= gold;
}

