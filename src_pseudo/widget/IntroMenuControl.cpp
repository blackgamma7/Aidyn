#include "globals.h"

#define IntroWSub ((IntroMenuSub*)w1->substruct)

BaseWidget * IntroMenu_LeftFunc(BaseWidget * w0,BaseWidget *w1) {
  return IntroWSub->unk1c->LeftFunc();
}

BaseWidget * IntroMenu_Rightunc(BaseWidget * w0,BaseWidget *w1) {
  return IntroWSub->unk1c->RightFunc();
}

BaseWidget * IntroMenu_UpFunc(BaseWidget * w0,BaseWidget *w1) {
  PLAYSFX(0x73b,0,1.0,30,0);
  return IntroWSub->unk1c->UpFunc();
}

BaseWidget * IntroMenu_DownFunc(BaseWidget * w0,BaseWidget *w1) {
  PLAYSFX(0x73b,0,1.0,30,0);
  return IntroWSub->unk1c->DownFunc();
}

BaseWidget * IntroMenu_BFunc(BaseWidget * w0,BaseWidget *w1) {
  IntroMenuSub *sub = IntroWSub;
  BaseWidget *w = sub->unk1c->BFunc();
  PLAYSFX(0x741,0,1.0,60,0);
  switch(sub->menuState) {
  case IntroM_processIntoMenu:
    break;
  case IntroM_NameEntry:
    if (w == NULL) return w1;
  case IntroM_StartGameMenu:
    gGlobals.titleScreen->ShowStartGameMenu();
    break;
  case IntroM_ContPakMenu:
    gGlobals.titleScreen->ShowStartGameMenu();
    w1 = w;
    break;
  case IntroM_ConfigMenu:
    gGlobals.titleScreen->CloseConfig(w);
    break;
  default:
    w1 = NULL;
  }
  return w1;
}

BaseWidget * IntroMenu_StartFunc(BaseWidget* w0,BaseWidget *w1) {
  IntroMenuSub *sub = IntroWSub;
  BaseWidget *w = sub->unk1c->StartFunc();
  if (false) {
switchD_8004bb7c_caseD_3:
    w1 = NULL;
  }
  else {
    switch(sub->menuState) {
    case 0:
      gGlobals.titleScreen->ShowStartGameMenu();
      break;
    case IntroM_processIntoMenu:
      gGlobals.titleScreen->ProcessIntroMenu(w);
      break;
    case IntroM_NameEntry:
      gGlobals.titleScreen->ConfirmName(w);
      break;
    default:
      goto switchD_8004bb7c_caseD_3;
    case IntroM_ConfigMenu:
      gGlobals.titleScreen->CloseConfig(w);
    }
    PLAYSFX(0x740,0,1.0,60,0);
  }
  return w1;
}


BaseWidget * IntroMenu_AFunc(BaseWidget * w0,BaseWidget *w1) {
  IntroMenuSub *sub = IntroWSub;
  BaseWidget *w = sub->unk1c->AFunc();
  switch(sub->menuState) {
  case 0:
    gGlobals.titleScreen->ShowStartGameMenu();
    break;
  case IntroM_processIntoMenu:
    gGlobals.titleScreen->ProcessIntroMenu(w);
    break;
  case IntroM_NameEntry:
    gGlobals.titleScreen->ConfirmName(w);
    break;
  case IntroM_ContPakMenu:
    sub->menuState = IntroM_State10;
    return w;
  case IntroM_ConfigMenu:
    gGlobals.titleScreen->CloseConfig(w);
    break;
  default:
    return NULL;
  }
  PLAYSFX(0x740,0,1.0,60,0);
  return w1;
}

