#include "globals.h"

IntroMenu::IntroMenu():WidgetMenu(){InitMenu();}

#define DestructW(w)\
  if(w){\
  this->Unlink(w);\
  if(w)((BaseWidget*)w)->~BaseWidget();\
  w=NULL;\
}

IntroMenu::~IntroMenu() {
  IntroMenuSub *sub = IntroSub;
  DestructW(sub->StartMenu);
  DestructW(sub->inputMenu);
  DestructW(sub->config);
  DestructW(sub->pakDat);
  DestructW(sub->titleShadow);
  sub->PressStart = NULL;
  sub->unk1c = NULL;
  delete sub;
  this->substruct = NULL;
  if (this->unk80) {
    this->Unlink(this->unk80);
    FREEQW(this->unk80);
  }
  if (this->unk84) {
    this->Unlink(this->unk84);
    FREEQW(this->unk84);
  }
  WidgetMenu::~WidgetMenu();
}

#undef DestructW

void IntroMenu::InitMenu() {
  IntroMenuSub* sub = new IntroMenuSub;
  this->substruct = sub;
  Controller::GetDelay(0);
  sub->config = NULL;
  sub->inputMenu = NULL;
  sub->StartMenu = NULL;
  sub->pakDat = NULL;
  sub->titleShadow = NULL;
  sub->PressStart = NULL;
  sub->unk1c = NULL;
  sub->unk20 = NULL;
  this->alpha1 = 0;
  this->alpha0 = 0;
  this->blinkTimer = 0;
  this->pressStartVisible = 0;
  this->alphaDelta = 20;
  this->unk84 = NULL;
  this->unk80 = NULL;
  InitTitleCard();
  this->LeftButtonFunc = IntroMenu_LeftFunc;
  this->RightButtonFunc = IntroMenu_RightFunc;
  this->UpButtonFunc = IntroMenu_UpFunc;
  this->DownButtonFunc = IntroMenu_DownFunc;
  this->AButtonFunc = IntroMenu_AFunc;
  this->BButtonFunc = IntroMenu_BFunc;
  this->StartButtonFunc = IntroMenu_StartFunc;
  this->Tick();
}


Gfx * IntroMenu::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1) {
  WidgetOptionsConfig *pWVar2;
  Gfx *pGVar4;
  BaseWidget * pWVar1;
  BaseWidget * pBVar4;
  BaseWidget * pBVar5;
  IntroMenuSub *sub;
  
  sub = IntroSub;
  if (sub->menuState == IntroM_ConfigMenu) {
      OptionsConfigSubstruct *  configSub = (OptionsConfigSubstruct *)sub->config->substruct;
    if (configSub->renameOpen == false) {
      pBVar4 = this->unk80;
      if (configSub->nameEntry == NULL) {
        if (pBVar4 == NULL) {
          pBVar4 = this->unk84;
        }
        else {
          Utilities::SetAlpha(pBVar4,this->alpha1);
          pBVar4 = this->unk84;
        }
        if (pBVar4 == NULL) {
          pBVar4 = this->unk80;
        }
        else {
          Utilities::SetAlpha(pBVar4,sub->config->col.A);
          pBVar4 = this->unk80;
        }
      }
      else {
        if (pBVar4 == NULL) {
          pBVar4 = this->unk84;
        }
        else {
          Utilities::SetAlpha(pBVar4,(configSub->nameEntry->col).A);
          pBVar4 = this->unk84;
        }
        if (pBVar4 != NULL) {
          pWVar1 = sub->config;
          goto LAB_8004a404;
        }
        pBVar4 = this->unk80;
      }
    }
    else {
      if (this->unk80 == NULL) {
        pBVar4 = this->unk84;
      }
      else {
        Utilities::SetAlpha(this->unk80,sub->config->col.A);
        pBVar4 = this->unk84;
      }
      if (pBVar4 == NULL) {
        pBVar4 = this->unk80;
      }
      else {
        pWVar1 = configSub->nameEntry;
LAB_8004a404:
        Utilities::SetAlpha(pBVar4,pWVar1->col.A);
        pBVar4 = this->unk80;
      }
    }
    if (pBVar4) {
      g = pBVar4->Render(g,x0,y0,x1,y1);
      goto LAB_8004a488;
    }
  }
  else {
    if (this->unk80 == NULL) {
      pBVar5 = sub->unk20;
      goto LAB_8004a4cc;
    }
    Utilities::SetAlpha(this->unk80,this->alpha1);
LAB_8004a488:
    pBVar5 = this->unk80;
    if (pBVar5 == NULL) {
      pBVar5 = sub->unk20;
      goto LAB_8004a4cc;
    }
    if ((pBVar5->col).A != 0) {
      g = pBVar5->Render(g,x0,y0,x1,y1);
    }
  }
  pBVar5 = sub->unk20;
LAB_8004a4cc:
  if ((sub->unk20) && (this->alpha1)){
    sub->unk20->Tick();
    g = sub->unk20->Render(g,x0,y0,x1,y1);
  }
  if ((this->unk84) && ((this->unk84->col).A != 0)) {
    g = this->unk84->Render(g,x0,y0,x1,y1);
  }
  RENDERCHILDREN();
}

u8 IntroMenu::Tick() {
  IntroMenuSub *sub = IntroSub;
  if((sub->unk1c)&&(this->alpha0!=0xff)) {
    if (this->alpha0 < (0xff - (u32)this->alphaDelta))
      this->alpha0+= this->alphaDelta;
    else this->alpha0 = 0xff;
    Utilities::SetAlpha(sub->unk1c,this->alpha0);
  }
  if (sub->unk20 == NULL) {
LAB_8004a65c:
    if (this->alpha1) {
      goto LAB_8004a6d0;
    }
  }
  else {
    if (this->alpha1) {
      if (this->alphaDelta < this->alpha1)
        this->alpha1-= this->alphaDelta;
      else this->alpha1 = 0;
      Utilities::SetAlpha(sub->unk20,this->alpha1);
      goto LAB_8004a65c;
    }
  }
  if ((sub->pakDat)&&(sub->pakDat == sub->unk20)) {
    sub->unk20 = NULL;
    sub->pakDat->~WidgetContPakData();
    sub->pakDat = NULL;
  }
  this->Unlink(this->unk80);
  FREEQW(this->unk80);
LAB_8004a6d0:
  if (sub->menuState == IntroM_StartGameMenu) BlinkTimer();
  return TickChildren();
}

void IntroMenu::BlinkTimer() {
  IntroMenuSub *pvVar1 = IntroSub;
  if(++this->blinkTimer>100) {
    this->blinkTimer = 70;
    this->pressStartVisible^= 1;
  }
  (pvVar1->PressStart->col).A *= this->pressStartVisible;
}

BaseWidget * IntroMenu_ShadowBG(s16 x0,s16 y0,s16 x1,s16 y1) {
  WidgetBorg8 *bg = WidgetB8(BORG8_Pixel);
  bg->SetCoords(x0,y0);
  s16 w = x1 - x0;
  bg->SetWidth(w);
  s16 h = y1 - y0;
  bg->SetHeight(h);
  WidgetBorg8 *elem = WidgetB8(BORG8_GradientRoundD);
  elem->SetCoords(x0,y0 - elem->GetHeight());
  elem->SetWidth(w);
  bg->Link(elem);
  elem = WidgetB8(BORG8_GradientC);
  elem->SetCoords(x0,y1);
  elem->SetWidth(w);
  bg->Link(elem);
  elem = WidgetB8(BORG8_GradientA);
  elem->SetCoords(x0 - elem->GetWidth(),y0);
  elem->SetHeight(h);
  bg->Link(elem);
  elem = WidgetB8(BORG8_GradientB);
  elem->SetCoords(x1,y0);
  elem->SetHeight(h);
  bg->Link(elem);
  elem = WidgetB8(BORG8_GradientRoundA);
  elem->SetCoords(x0 - elem->GetWidth(),y0 - elem->GetHeight());
  bg->Link(elem);
  elem = WidgetB8(BORG8_GradientRoundB);
  elem->SetCoords(x1,y0 - elem->GetHeight());
  bg->Link(elem);
  elem = WidgetB8(BORG8_GradientRoundD);
  elem->SetCoords(x0 - elem->GetWidth(),y1);
  bg->Link(elem);
  elem = WidgetB8(BORG8_GradientRoundC);
  elem->SetCoords(x1,y1);
  bg->Link(elem);
  Utilities::SetWidgetColor(bg,0,0,0,0xff);
  return bg;
}


void IntroMenu::InitTitleCard() {
  BaseWidget *pBVar2;
  IntroMenuSub *sub = (IntroMenuSub *)this->substruct;
  sub->unk20 = sub->unk1c;
  if (sub->unk1c) {
    this->Unlink(sub->unk1c);
    sub->unk1c = NULL;
  }
  if (sub->titleShadow == NULL) {
    sub->titleShadow = WidgetB8(Borg8_TitleCardShadow);
    sub->titleShadow->SetCoords((SCREEN_CENTERW-14) - (sub->titleShadow->GetWidth() >> 1),
        110 - (sub->titleShadow->GetHeight() >> 1));
    (sub->titleShadow->col).A = 0;
    pBVar2 = WidgetB8(Borg8_TitleCard);
    pBVar2->SetCoords(SCREEN_CENTERW - (short)(sub->titleShadow->GetWidth() >> 1),
       110 - (sub->titleShadow->GetHeight() >> 1));
    (pBVar2->col).A = 0;
    sub->titleShadow->Link(pBVar2);
  }
  if (sub->PressStart == NULL) {
    sub->PressStart = WidgetB8(BORG8_TitlePressStart);
    sub->PressStart->SetCoords(SCREEN_CENTERW - (sub->titleShadow->GetWidth() >> 1),
               sub->titleShadow->posY + sub->titleShadow->GetHeight() + 5);
    (sub->PressStart->col).A = 0;
    sub->titleShadow->Link(sub->PressStart);
  }
  sub->menuState = 0;
  sub->unk1c = sub->titleShadow;
  this->Link(sub->titleShadow);
  this->alpha0 = 0;
  Utilities::SetAlpha(sub->unk1c,0);
  this->alpha1 = 0;
  if (sub->unk20){
    Utilities::SetAlpha(sub->unk20,0);
  }
  if(this->unk80) {
    this->Unlink(this->unk80);
    FREEQW(this->unk80);
    pBVar2 = this->unk84;
  }
  this->unk80 = this->unk84;
  this->Unlink(this->unk84);
}

void IntroMenu::ShowStartGameMenu() {
  BaseWidget *pBVar4;
  BaseWidget *pBVar5;
  IntroMenuSub *piVar3;
  
  IntroMenuSub *piVar3 = IntroSub;
  pBVar4 = piVar3->unk1c;
  piVar3->unk20 = pBVar4;
  if (piVar3->unk1c) {
    this->Unlink(piVar3->unk1c);
    piVar3->unk1c = NULL;
  }
  if (piVar3->StartMenu == NULL) {
    piVar3->StartMenu = StartGameMenu();
    piVar3->StartMenu->SetColor(COLOR_OFFWHITE);
  }
  pBVar4 = piVar3->StartMenu;
  s16 sVar1 = piVar3->StartMenu->posX;
  s16 sVar2 = piVar3->StartMenu->posY;
  this->unk80 = this->unk84;
  this->unk84 = IntroMenu_ShadowBG(sVar1 + -0x42,sVar2 + -0x30,sVar1 + 0x42,sVar2 + 0x76);
  piVar3->menuState = IntroM_processIntoMenu;
  piVar3->unk1c = piVar3->StartMenu;
  this->Link(piVar3->StartMenu);
  this->alpha0 = 0;
  Utilities::SetAlpha(piVar3->unk1c,0);
  this->alpha1 = 0xff;
  if (piVar3->unk20)Utilities::SetAlpha(piVar3->unk20,0xff);
}

void IntroMenu::InitOptionsMenu() {
  s16 sVar1;
  IntroMenuSub *pvVar1 = IntroSub;
  pvVar1->unk20 = pvVar1->unk1c;
  if (pvVar1->unk1c != NULL) {
    this->Unlink(pvVar1->unk1c);
    pvVar1->unk1c = NULL;
  }
  if (pvVar1->config == NULL) {
    pvVar1->config = new WidgetOptionsConfig(false);
    ((OptionsConfigSubstruct *)pvVar1->config->substruct)->unk33=15;
  }
  OptionsConfigSubstruct *piVar3 = (OptionsConfigSubstruct *)pvVar1->config->substruct;
  BaseWidget *pBVar5 = piVar3->AudioTitle;
  this->unk80 = this->unk84;
  sVar1 = pBVar5->posX;
  pBVar5 = IntroMenu_ShadowBG(sVar1 + -0x10,pBVar5->posY + -0x28,sVar1 + 0xc0,
                              piVar3->optionTitles[2]->posY + 0x14);
  this->unk84 = pBVar5;
  pvVar1->menuState = IntroM_ConfigMenu;
  pvVar1->unk1c = pvVar1->config;
  this->Link(pvVar1->config);
  this->alpha0 = 0;
  Utilities::SetAlpha(pvVar1->unk1c,0);
  this->alpha1 = 0xff;
  if (pvVar1->unk20 != NULL) {
    Utilities::SetAlpha(pvVar1->unk20,0xff);
  }
  return;
}

void IntroMenu::NamePlayer() {
  IntroMenuSub *sub = IntroSub;
  sub->unk20 = sub->unk1c;
  if (sub->unk1c) {
    this->Unlink(sub->unk1c);
    sub->unk1c=NULL;
  }
  if (sub->inputMenu == NULL) {
    sub->inputMenu = new InputMenu(PARTY->Members[0]->name);
  }
  else sub->inputMenu->SetCurrentName(PARTY->Members[0]->name);
  BaseWidget *iVar2 = ((InputWidgetSubStruct*)sub->inputMenu->substruct)->arrayMenu;
  this->unk80 = this->unk84;
  this->unk84 = IntroMenu_ShadowBG(iVar2->posX + -8,43,
                              ((float)(iVar2->posX + -8) +(float)(((int)iVar2->boundX1 - (int)iVar2->boundX0) + 8)),179);
  sub->menuState = IntroM_NameEntry;
  sub->unk1c = sub->inputMenu;
  this->Link(sub->inputMenu);
  this->alpha0 = 0;
  Utilities::SetAlpha(sub->unk1c,0);
  this->alpha1 = 0xff;
  if (sub->unk20 != NULL) {
    Utilities::SetAlpha(sub->unk20,0xff);
  }
}

void FUN_8004b1f8(void) {
  gGlobals.gameStartOption = 2;
  gGlobals.screenFadeMode = 1;
  gGlobals.screenFadeSpeed = (1.0f/20);
}

void IntroMenu_ExitContPakMenu(void) {gGlobals.titleScreen->ShowStartGameMenu();}

void IntroMenu::ShowContPakMenu() {
  BaseWidget *pBVar2;
  WidgetContPakData *pWVar3;
  BaseWidget *pBVar4;
  IntroMenuSub *sub = IntroSub;
  sub->unk20 = sub->unk1c;
  if (sub->unk1c != NULL) {
    this->Unlink(sub->unk1c);
    sub->unk1c = NULL;
  }
  sub->menuState = IntroM_ContPakMenu;
  if (sub->pakDat == NULL) {
    Color32 col0={COLOR_OFFWHITE};
    Color32 col1={100,100,100,100};
    Color32 col2={COLOR_WHITE};
    sub->pakDat = WContPakData_Load(51,24,FUN_8004b1f8,IntroMenu_ExitContPakMenu,&col0,
                               &col1,&col2);
  }
  sub->unk1c = sub->pakDat;
  this->Link(sub->pakDat);
  this->unk80 = this->unk84;
  pBVar4 = IntroMenu_ShadowBG(51,24,270,216);
  this->alpha0 = 0;
  this->unk84 = pBVar4;
  Utilities::SetAlpha(sub->unk1c,0);
  this->alpha1 = 0xff;
  if (sub->unk20) Utilities::SetAlpha(sub->unk20,0xff);
}


WidgetScrollMenu * IntroMenu::StartGameMenu() {
  WidgetScrollMenu *scroll = new WidgetScrollMenu(7);
  WidgetBorg8 *title = WidgetB8(BORG8_TitleMenui);
  title->SetCoords(SCREEN_CENTERW - (title->GetWidth() >> 1),50);
  scroll->SetCoords(SCREEN_CENTERW,90);
  scroll->Link(title);
  scroll->StartButtonFunc = scroll->AButtonFunc;
  scroll->Append(WText(gGlobals.CommonStrings[0x9f]));
  scroll->Append(WText(gGlobals.CommonStrings[0xa0]));
  scroll->Append(WText(gGlobals.CommonStrings[0xa1]));
  #ifdef DEBUGVER
  if (gDebugFlag) {
    scroll->Append(WText("Start Game"));
    scroll->Append(WText("Intermediate Game"));
  }
  #endif
  ((WSMSub*)scroll->substruct)->vSpace=8;
  scroll->SetFlags(4);
  return scroll;
}


void IntroMenu::ProcessIntroMenu(BaseWidget *txt) {
  widgetTextSubstruct *txtSub = (widgetTextSubstruct *)txt->substruct;
  IntroMenuSub *sub = IntroSub;
  if(strcmp(txtSub->str,gGlobals.CommonStrings[0x9f]) == 0) NamePlayer();
  #ifdef DEBUGVER
  else if(strcmp(txtSub->str,"Start Game")==0)sub->menuState = IntroM_StartGame;
  else if(strcmp(txtSub->str,"Intermediate Game")==0)sub->menuState = IntroM_IntermediateGame;
  else if(strcmp(txtSub->str,"Advanced Game")==0)sub->menuState = IntroM_AdvancedGame;
  #endif
  else if(strcmp(txtSub->str,gGlobals.CommonStrings[0xa1]) == 0) InitOptionsMenu();
  else if(strcmp(txtSub->str,gGlobals.CommonStrings[0xa0]) == 0) sub->menuState = IntroM_LoadGame;
  else CRASH("IntroMenu::ProcessIntroMenu()","Unknown scroll menu item");
}


void IntroMenu::ConfirmName(BaseWidget *param_2) {
  if (param_2) {
    if (param_2->varU8 == 0) ShowStartGameMenu();
    else (IntroSub)->menuState=IntroM_NewGame;
  }
}

void Ofunc_NOOP_8004b6a4(){}


void IntroMenu::CloseConfig(BaseWidget *w) {
  if (w == NULL) {
    OptionsConfigSubstruct *piVar1 = (OptionsConfigSubstruct*)IntroSub->config->substruct;
    this->unk80 = this->unk84;
    s16 x0,y0,sVar3,y1;
    y0 = 0x2b;
    if (!piVar1->renameOpen) {
      sVar3 = piVar1->AudioTitle->posX;
      x0 = sVar3 + -0x10;
      y0 = piVar1->AudioTitle->posY + -0x28;
      sVar3 = sVar3 + 0xc0;
      y1 = piVar1->optionTitles[2]->posY + 0x14;
    }
    else {
      BaseWidget* w1 = ((InputWidgetSubStruct*)piVar1->nameEntry->substruct)->arrayMenu;
      y1 = 0xb3;
      x0 = (w1->posX) + -8;
      sVar3 = (w1->posX + -8) + ((w1->boundX1 - w1->boundX0) + 8);
    }
    this->unk84 = IntroMenu_ShadowBG(x0,y0,sVar3,y1);
  }
  else ShowStartGameMenu();
}

BaseWidget * IntroMenu::Control(controller_aidyn *param_2) {
  u8 uVar1;
  WidgetOptionsConfig *pWVar4;
  BaseWidget *pBVar5;
  IntroMenuSub *pvVar2;
  OptionsConfigSubstruct *pvVar5;
  OptionsConfigSubstruct *pvVar6;
  
  pvVar2 = IntroSub;
  if ((this->alpha0 == 0xff) && (this->alpha1 == 0)) {
    if (pvVar2->config) {
      uVar1 = pvVar2->config->col.A;
      if ((uVar1 != 0) && (uVar1 != 0xff)) {
        return NULL;
      }
    }
    if (pvVar2->pakDat) return pvVar2->pakDat->Control(param_2);
    pBVar5 = BaseWidget::Control(param_2);
    if (pBVar5 != NULL) return pBVar5;
    if (pvVar2->menuState != IntroM_ConfigMenu) return NULL;
    if (((((param_2->input_2 & (ANA_LEFT|D_LEFT)) != 0) && (pWVar4 = pvVar2->config, pWVar4 != NULL)
         ) && (pvVar5 = (OptionsConfigSubstruct *)pWVar4->substruct,
              pvVar5->renameOpen == false)) && (pvVar5->selected < 2)) {
      return pWVar4->LeftFunc();
    }
    if ((param_2->input_2 & (ANA_RIGHT|D_RIGHT)) != 0) {
      pWVar4 = pvVar2->config;
      if (pWVar4 == NULL) return NULL;
      pvVar6 = (OptionsConfigSubstruct *)pWVar4->substruct;
      if (pvVar6->renameOpen == false) {
        if (pvVar6->selected < 2) {
          return pWVar4->RightFunc();
        }
        return NULL;
      }
      return NULL;
    }
  }
  return NULL;
}

u32 IntroMenu::GetNumber(){return WidgetN_Other;}