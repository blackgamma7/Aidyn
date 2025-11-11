#include "globals.h"

u32 DAT_800ed540=true;

u8 bigAssOpenCallback_1(BaseWidget *w) {
  byte bVar1;
  ushort uVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  pause_Substruct *sub = (pause_Substruct *)w->substruct;
  if (!sub->isScrolling) {
    iVar6 = 0;
    uVar2 = sub->sceneDat->aniTime;
    switch(sub->PauseMenuSection){
        case 0:
         uVar3 = 8;
         iVar5 = 36;
         iVar6 = SCREEN_WIDTH;
         iVar4 = SCREEN_WIDTH;
         break;
        case 1:
         uVar3 = 36;
         iVar5 = 55;
         iVar6 = (SCREEN_WIDTH/2);
         iVar4 = (SCREEN_WIDTH/2);
        break;
        case 2:
         uVar3 = 6;
         iVar5 = 35;
         iVar4 = -5;
         break;
        default:
         CRASH("bigassOpenCallBack","unknown screen");
    }
    gGlobals.scrollLocation[0] = (short)iVar6;
    gGlobals.scrollLocation[1] = (short)iVar4;
    if (uVar3 < uVar2) {
      gGlobals.scrollLocation[0] +=
           (short)(int)(((float)-iVar6 / (float)(int)(iVar5 - uVar3)) * (float)(int)(uVar2 - uVar3))
      ;
      gGlobals.scrollLocation[1] +=
           (int)(((float)(SCREEN_WIDTH - iVar4) / (float)(int)(iVar5 - uVar3)) *
                       (float)(int)(uVar2 - uVar3));
      if (sub->borg7->unk1c->b6->dat->aniLength <= (int)(uint)uVar2)
        w->state = 2;
    }
    FUN_800a0304(sub->borg7,1);
    Scene::MatrixASetPos(sub->sceneDat,sub->scrollSpeed,0.0,0.0);
    Scene::LookAt(sub->sceneDat,(sub->camPos).x,(sub->camPos).y,(sub->camPos).z,0.0,
                  -100.0f,0.0,0.0,0.0,-1.0f);
  }
  return w->state;
}

u8 PauseMenuClose1(BaseWidget *param_1) {
  byte bVar4;
  pause_Substruct *sub = (pause_Substruct *)param_1->substruct;
  if (!sub->isScrolling) {
    gGlobals.scrollLocation[0] = 0;
    gGlobals.scrollLocation[1] = SCREEN_WIDTH;
    bVar4 = sub->dollmenu->lists->col.A;
    if (!DAT_800ed540) {
      if (bVar4 < 195) bVar4+=60;
      else {
        bVar4 = 0xff;
        param_1->state = 2;
        DAT_800ed540 = true;
      }
    }
    else {
      bVar4 = 0;
      DAT_800ed540 = false;
    }
    Utilities::SetAlpha(sub->dollmenu->lists,bVar4);
    sub->dollmenu->lists->Tick();
    Utilities::SetAlpha(sub->dollmenu->barter_widget,bVar4);
    sub->dollmenu->barter_widget->Tick();
  }
  return param_1->state;
}


byte bigAssOpenCallback(BaseWidget *param_1) {
  byte bVar1;
  ushort uVar2;
  pause_Substruct *sub;
  bool bVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  
  sub = (pause_Substruct *)param_1->substruct;
  if (!sub->isScrolling) {
    iVar8 = 0;
    iVar7 = 0;
    uVar2 = sub->sceneDat->aniTime;
        switch(sub->PauseMenuSection){
        case 0:
         uVar5 = 1;
         iVar6 = 31;
         iVar8 = SCREEN_WIDTH;
         iVar7 = SCREEN_WIDTH;
         break;
        case 1:
         uVar5 = 1;
         iVar6 = 14;
         iVar8 = (SCREEN_WIDTH/2);
         iVar7 = (SCREEN_WIDTH/2);
        break;
        case 2:
         uVar5 = 2;
         iVar6 = 32;
         break;
        default:
         CRASH("bigassOpenCallBack","unknown screen");
    }
    gGlobals.scrollLocation[0] = 0;
    gGlobals.scrollLocation[1] = SCREEN_WIDTH;
    if (uVar5 < uVar2) {
      gGlobals.scrollLocation[0] =
           (short)(int)(((float)iVar8 / (float)(int)(iVar6 - uVar5)) * (float)(int)(uVar2 - uVar5));
      gGlobals.scrollLocation[1] =
           (short)(int)(((float)(iVar7 + -SCREEN_WIDTH) / (float)(int)(iVar6 - uVar5)) *
                       (float)(int)(uVar2 - uVar5)) + SCREEN_WIDTH;
      if (sub->borg7->unk1c->b6->dat->aniLength <= (int)(uint)uVar2) {
        if (gGlobals.screenFadeModeSwitch - 6 < 2) {
          gGlobals.screenshotTint.B = 0xff;
          gGlobals.screenshotTint.G = 0xff;
          gGlobals.screenshotTint.R = 0xff;
        }
        bVar4 = 0xf4 < gGlobals.screenshotTint.R;
        if (gGlobals.screenshotTint.R == 0xff) param_1->state = 6;
        else {
          gGlobals.screenshotTint.R = gGlobals.screenshotTint.R + 10;
          if (bVar4) {
            gGlobals.screenshotTint.R = 0xff;
          }
          gGlobals.screenshotTint.G = gGlobals.screenshotTint.R;
          gGlobals.screenshotTint.B = gGlobals.screenshotTint.R;
        }
        goto LAB_80036d24;
      }
    }
    FUN_800a0304(sub->borg7,1);
    Scene::MatrixASetPos(sub->sceneDat,sub->scrollSpeed,0.0,0.0);
    Scene::LookAt(sub->sceneDat,(sub->camPos).x,(sub->camPos).y,(sub->camPos).z,0.0,
                  -100.0f,0.0,0.0,0.0,-1.0f);
  }
LAB_80036d24:
  return param_1->state;
}

u8 PauseMenuClose2(BaseWidget *param_1) {
  byte bVar3;
  pause_Substruct *sub = (pause_Substruct *)param_1->substruct;
  if (!sub->isScrolling) {
    bVar3 = sub->dollmenu->lists->col.A;
    if (bVar3 < 0x3d) {
      bVar3 = 0;
      param_1->state = 6;
    }
    else bVar3-=60;
    Utilities::SetAlpha(sub->dollmenu->lists,bVar3);
    sub->dollmenu->lists->Tick();
  }
  return param_1->state;
}

BaseWidget * bigAssMenu_LZFunc(BaseWidget *param_1,BaseWidget *w1) {
  u8 uVar1;
  pause_Substruct *sub;
  WidgetOptionsSubstruct * piVar3;
  BaseWidget *pBVar4;
  bool bVar6;
  Borg8Header *b8;
  
  if ((gGlobals.SomeCase == 7) || (gGlobals.SomeCase == 3)) {
    sub = (pause_Substruct *)w1->substruct;
    if ((sub->PauseMenuSection != 0) && (!sub->isScrolling)) {
      if (sub->PauseMenuSection == 1) {
        if (sub->dollmenu->IsAnimated()) return NULL;
      }
      if ((sub->PauseMenuSection != 0) ||
         (piVar3 = (WidgetOptionsSubstruct *)sub->optionsMenu->substruct,
         piVar3->unk10 == piVar3->ScrollMenu)) {
        sub->unk24 = SCREEN_WIDTH;
        sub->backgroundImage->SetBorg8(loadBorg8((uint)pause_menu_borg8[sub->PauseMenuSection--]),false);
        sub->backgroundImage->SetCoords(-SCREEN_WIDTH,0);
        sub->scrollfloat =
             (scroll_floats[sub->PauseMenuSection] - sub->scrollSpeed) /
             (float)(((int)sub->unk24 - (int)sub->unk22) / (int)sub->unk26);
        sub->pauseMenuSections[sub->PauseMenuSection]->Tick();
        sub->isScrolling = true;
        PLAYSFX(0x7d4,0,1.0,120,0);
      }
    }
  }
  return NULL;
}

BaseWidget* bigAssMenu_RFunc(BaseWidget* param_1,BaseWidget *w1) {
  u8 uVar1;
  pause_Substruct *sub;
  BaseWidget *pBVar4;
  WidgetOptionsSubstruct* opSub;
  int iVar6;
  bool bVar7;
  Borg8Header *b8;
  
  if (((gGlobals.SomeCase == 7) || (gGlobals.SomeCase == 3)) && (gGlobals.unk14fc == 0)) {
    sub = (pause_Substruct *)w1->substruct;
    if (sub->PauseMenuSection != 2) {
      if (gGlobals.SomeCase == 3) {
        if (sub->PauseMenuSection == 1) return 0;
      }
      if (!sub->isScrolling) {
        if (sub->PauseMenuSection == 1) {
          if (sub->dollmenu->IsAnimated()) return 0;
        }
        if ((sub->PauseMenuSection != 0) ||
           (opSub = (WidgetOptionsSubstruct *)sub->optionsMenu->substruct,
         opSub->unk10 == opSub->ScrollMenu)) {
            sub->PauseMenuSection++;
          sub->unk24 = -SCREEN_WIDTH;
          sub->backgroundImage->SetBorg8(loadBorg8((uint)pause_menu_borg8[sub->PauseMenuSection]),false);
          sub->backgroundImage->SetCoords(SCREEN_WIDTH,0);
          sub->scrollfloat =
               -(scroll_floats[sub->PauseMenuSection] - sub->scrollSpeed) /
               (float)(((int)sub->unk24 - (int)sub->unk22) / (int)sub->unk26);
          sub->pauseMenuSections[sub->PauseMenuSection]->Tick();
          sub->calendar->map->pieceAlpha = 0;
          sub->isScrolling = true;
          PLAYSFX(0x7d4,0,1.0,0x78,0);
        }
      }
    }
  }
  return 0;
}

BaseWidget * bigAssMenu_LeftFunc(BaseWidget *param_1,BaseWidget *w1) {
  pause_Substruct *sub = (pause_Substruct *)w1->substruct;
  if (!sub->isScrolling) {
    if (sub->PauseMenuSection == 1) {
      if (sub->dollmenu->IsAnimated()) return NULL;
    }
    sub->pauseMenuSections[sub->PauseMenuSection]->LeftFunc();
  }
  return NULL;
}

BaseWidget * bigAssMenu_RightFunc(BaseWidget *param_1,BaseWidget *w1) {
  pause_Substruct *sub = (pause_Substruct *)w1->substruct;
  if (!sub->isScrolling) {
    if (sub->PauseMenuSection == 1) {
      if (sub->dollmenu->IsAnimated()) return NULL;
    }
    sub->pauseMenuSections[sub->PauseMenuSection]->RightFunc();
  }
  return NULL;
}

BaseWidget * bigAssMenu_UpFunc(BaseWidget *param_1,BaseWidget *w1) {
  pause_Substruct *sub = (pause_Substruct *)w1->substruct;
  if (!sub->isScrolling) {
    if (sub->PauseMenuSection == 1) {
      if (sub->dollmenu->IsAnimated()) return NULL;
    }
    sub->pauseMenuSections[sub->PauseMenuSection]->UpFunc();
    PLAYSFX(0x73b,0,1.0,30,0);
  }
  return NULL;
}

BaseWidget * bigAssMenu_DownFunc(BaseWidget *param_1,BaseWidget *w1) {
  pause_Substruct *sub = (pause_Substruct *)w1->substruct;
  if (!sub->isScrolling) {
    if (sub->PauseMenuSection == 1) {
      if (sub->dollmenu->IsAnimated()) return NULL;
    }
    sub->pauseMenuSections[sub->PauseMenuSection]->DownFunc();
    PLAYSFX(0x73b,0,1.0,30,0);
  }
  return NULL;
}

BaseWidget * bigAssMenu_CLeftFunc(BaseWidget *param_1,BaseWidget *w1) {
  pause_Substruct *sub = (pause_Substruct *)w1->substruct;
  if (!sub->isScrolling) 
    sub->pauseMenuSections[sub->PauseMenuSection]->CLeftFunc();
  return NULL;
}

BaseWidget * bigAssMenu_CRightFunc(BaseWidget *param_1,BaseWidget *w1) {
  pause_Substruct *sub = (pause_Substruct *)w1->substruct;
  if (!sub->isScrolling) 
    sub->pauseMenuSections[sub->PauseMenuSection]->CRightFunc();
  return NULL;
}

BaseWidget * bigAssMenu_CUpFunc(BaseWidget *param_1,BaseWidget *w1) {
  pause_Substruct *sub = (pause_Substruct *)w1->substruct;
  if (!sub->isScrolling) 
    sub->pauseMenuSections[sub->PauseMenuSection]->CUpFunc();
  return NULL;
}

BaseWidget * bigAssMenu_CDownFunc(BaseWidget *param_1,BaseWidget *w1) {
  pause_Substruct *sub = (pause_Substruct *)w1->substruct;
  if (!sub->isScrolling) 
    sub->pauseMenuSections[sub->PauseMenuSection]->CDownFunc();
  return NULL;
}

BaseWidget * bigAssMenu_BFunc(BaseWidget * param_1,BaseWidget *w1) {
  pause_Substruct *sub = (pause_Substruct *)w1->substruct;
  BaseWidget *ret = NULL;
  if ((!sub->isScrolling) && (ret = NULL, sub->borg7->currentAni == 0)) {
    ret = sub->pauseMenuSections[sub->PauseMenuSection]->BFunc();
    if (ret) ret->varU16 = 0;
    PLAYSFX(0x741,0,1.0,60,0);
  }
  return ret;
}

BaseWidget * bigAssMenu_AFunc(BaseWidget * param_1,BaseWidget *w1) {
  pause_Substruct *sub = (pause_Substruct *)w1->substruct;
  BaseWidget *ret = NULL;
  if ((!sub->isScrolling) && (ret = NULL, sub->borg7->currentAni == 0)) {
    ret = sub->pauseMenuSections[sub->PauseMenuSection]->BFunc();
    PLAYSFX(0x741,0,1.0,60,0);
  }
  return ret;
}

BaseWidget * bigAssMenu_StartFunc(BaseWidget * param_1,BaseWidget *w1) {
  pause_Substruct *sub = (pause_Substruct *)w1->substruct;
  BaseWidget *ret = NULL;
  if ((!sub->isScrolling) && (ret = NULL, sub->borg7->currentAni == 0)) {
    ret = sub->pauseMenuSections[sub->PauseMenuSection]->StartFunc();
    if ((ret)&&(sub->PauseMenuSection!=2)) ret->varU16 = 0;
    PLAYSFX(0x741,0,1.0,60,0);
  }
  return ret;
}