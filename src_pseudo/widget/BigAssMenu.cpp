#include "globals.h"



PauseWidget::PauseWidget(WidgetHandler *handle,u8 param_3):WidgetMenu(){
  BigAssMenu(handle,param_3);
}

PauseWidget::~PauseWidget(){
  pause_Substruct *sub = (pause_Substruct *)this->substruct;
  gGlobals.pauseMenuSection = sub->PauseMenuSection;
  if (sub->borg7) {
    FUN_8009fca8(sub->borg7);
    sub->borg7 = NULL;
    sub->sceneDat = NULL;
  }
  delete sub;
  this->substruct = NULL;
  this->Handler->FreeWidget(this);
  WidgetMenu::~WidgetMenu();
}

u32 PauseWidget::BigAssMenu(WidgetHandler *handle,u8 menu_section){
  bool bVar3;
  bool notCombat;
  float fVar5;
  u32 uVar6;
  pause_Substruct *sub;
  Borg7Header *pBVar7;
  BaseWidget *pBVar8;
  Borg8Header *b8;
  u32 uVar9;
  WidgetHandler *pWVar10;
  u32 borg12;
  
  this->Handler = handle;
  uVar6 = gGlobals.unk14fc;
  bVar3 = gGlobals.gameStateA == 6;
  notCombat = gGlobals.combatBytes[0] != CombatState_15;
  sub = new pause_Substruct;
  this->substruct = sub;
  sub->unk22 = 0;
  sub->unk24 = 0;
  sub->unk26 = 10;
  sub->PauseMenuSection = menu_section;
  sub->optionsMenu = NULL;
  sub->dollmenu = NULL;
  sub->calendar = NULL;
  sub->isScrolling = 0;
  pBVar7 = func_loading_borg7(BORG7_PauseMenu,&gGlobals.gameVars.particleHead);
  (sub->camPos).x = 0.0;
  (sub->camPos).z = 0.0;
  (sub->camPos).y = 27.0f;
  sub->borg7 = pBVar7;
  sub->sceneDat = pBVar7->sceneDat;
  Scene::SetNearFarPlanes(pBVar7->sceneDat,1.0,256.0);
  Scene::SetFlag8(sub->sceneDat);
  Scene::SetFlag10(sub->sceneDat);
  Scene::SetFlag4(sub->sceneDat);
  Scene::SetModelTint(sub->sceneDat,COLOR_WHITE);
  sub->backgroundImage = WigetB8Blank;
  sub->backgroundImage->SetColor(COLOR_WHITE);
  sub->backgroundImage->SetCoords(0,0);
  sub->backgroundImage->SetWidth(SCREEN_WIDTH);
  sub->backgroundImage->SetHeight(SCREEN_HEIGHT);
  sub->backgroundWidget = WidgetB8(pause_menu_borg8[menu_section]);
  sub->backgroundWidget->SetCoords(0,0);
  sub->backgroundWidget->SetColor(COLOR_WHITE);
  sub->backgroundWidget->SetWidth(SCREEN_WIDTH);
  sub->backgroundWidget->SetHeight(SCREEN_HEIGHT);
  this->Link(sub->backgroundWidget);
  this->Link(sub->backgroundImage);
  switch(menu_section){
    case 0:
    borg12 = 0x074d;
    gGlobals.scrollLocation[0] = SCREEN_WIDTH;
    gGlobals.scrollLocation[1] = SCREEN_WIDTH;
    sub->scrollSpeed = 27.0f;
    if (notCombat) {
      Borg7_SetAnimation(sub->borg7,0x16);
      goto LAB_80035e34;
    }
    break;
    case 1:
    borg12 = 0x074d;
    gGlobals.scrollLocation[0] = SCREEN_CENTERW;
    gGlobals.scrollLocation[1] = SCREEN_CENTERW;
    sub->scrollSpeed = 0.0;
    if (notCombat) {
      Borg7_SetAnimation(sub->borg7,10);
      goto LAB_80035e34;
    }
    break;
    case 2:
    borg12 = 0x074e;
    gGlobals.scrollLocation[0] = 0;
    gGlobals.scrollLocation[1] = -5;
    sub->scrollSpeed = -26.0f;
    if (notCombat) {
      Borg7_SetAnimation(sub->borg7,0x16);
      goto LAB_80035e34;
    }
    break;
    default:
      CRASH("BigAssMenu()","Unknown starting menu type");
  }
  Borg7_SetAnimation(sub->borg7,0);
LAB_80035e34:
  InitOptionsMenu();
  if (uVar6 == 0) {
    if (DefaultPauseState || CombatPauseState)
      BuildDollMenu(0);
    else BuildDollMenu(2);
    BuildCalendarMenu();
  }
  this->Handler->AddWidget(this);
  this->RButtonFunc = bigAssMenu_RFunc;
  this->handlerBool = 1;
  this->LeftButtonFunc = bigAssMenu_LeftFunc;
  this->RightButtonFunc = bigAssMenu_RightFunc;
  this->UpButtonFunc = bigAssMenu_UpFunc;
  this->DownButtonFunc = bigAssMenu_DownFunc;
  this->CLeftButtonFunc = bigAssMenu_CLeftFunc;
  this->CRightButtonFunc = bigAssMenu_CRightFunc;
  this->CUpButtonFunc = bigAssMenu_CUpFunc;
  this->CDownButtonFunc = bigAssMenu_CDownFunc;
  this->StartButtonFunc = bigAssMenu_StartFunc;
  this->AButtonFunc = bigAssMenu_AFunc;
  this->BButtonFunc = bigAssMenu_BFunc;
  this->LButtonFunc = bigAssMenu_LZFunc;
  this->ZButtonFunc = bigAssMenu_LZFunc;
  this->fadeOut = bigAssOpenCallback_1;
  this->fadeIn = bigAssOpenCallback;
  if (bVar3) this->fadeOut = PauseMenuClose2;
  else if (!notCombat) this->fadeIn = PauseMenuClose1;
  PlayAudioSound(&gGlobals.SFXStruct,borg12,0,1.0,0x3c,0);
  return Controller::GetDelay(0);
}


void PauseWidget::bigAssOpenCallback_2(){
  byte bVar1;
  bool bVar2;
  Borg7Header *pBVar3;
  u32 borg12;
  pause_Substruct *sub = (pause_Substruct *)this->substruct;
  bVar2 = BattleResultsState;
  sprintf(gGlobals.text,"isCombatLevelup = %d\n",bVar2);
  N64PRINT(gGlobals.text);
  switch(sub->PauseMenuSection){
    case 0:
    borg12 = 0x074e;
    if (!bVar2) {
LAB_800360bc:
      Borg7_SetAnimation(sub->borg7,11);
      goto LAB_800360dc;
    }
    break;
    case 1:
        borg12 = 0x074e;
    if (!bVar2) {
      Borg7_SetAnimation(sub->borg7,19);
      goto LAB_800360dc;
    }
    break;
    case 2:
        borg12 = 0x074d;
    if (!bVar2) {
      goto LAB_800360bc;
    }
    Borg7_SetAnimation(sub->borg7,0);
    break;
    default:
    CRASH("bigassOpenCallBack","unknown screen");
  }
LAB_800360dc:
  Borg7_TickAnimation(sub->borg7,1);
  PlayAudioSound(&gGlobals.SFXStruct,borg12,0,1.0,60,0);
  this->SetState(WidgetS_Closing);
}

void PauseWidget::InitOptionsMenu(){
  pause_Substruct *sub = (pause_Substruct *)this->substruct;
  sub->optionsMenu = new WidgetOptionsMenu();
  sub->optionsMenu->varU8 = 0;
  sub->pauseMenuSections[0] = sub->optionsMenu;
  if (gGlobals.cinematicReplay == 0) {
    sub->optionsMenu->InitMenu(0);
  }
  else {
    sub->optionsMenu->InitMenu(2);
    gGlobals.cinematicReplay = 0;
  }
  Utilities::MoveWidget(sub->optionsMenu,(u16)(byte)sub->PauseMenuSection * -SCREEN_WIDTH,0);
  sub->optionsMenu->Tick();
  this->Link(sub->optionsMenu);
}

void PauseWidget::BuildDollMenu(u8 param_2){;
  pause_Substruct *sub = (pause_Substruct *)this->substruct;
  sub->dollmenu = new WidgetDollMenu(0,param_2);
  sub->dollmenu->varU8 = 1;
  sub->pauseMenuSections[1] = sub->dollmenu;
  Utilities::MoveWidget(sub->dollmenu,(1 - (u16)sub->PauseMenuSection) * SCREEN_WIDTH,0);
  sub->dollmenu->Tick();
  this->Link(sub->dollmenu);
}

void PauseWidget::BuildCalendarMenu(){
  pause_Substruct *sub = (pause_Substruct *)this->substruct;
  sub->calendar = new WidgetCalendar();
  sub->calendar->varU8 = 2;
  sub->pauseMenuSections[2] = sub->calendar;
  Utilities::MoveWidget(sub->calendar,(2 - (u16)sub->PauseMenuSection) * SCREEN_WIDTH,0);
  sub->calendar->Tick();
  this->Link(sub->calendar);
}

void PauseWidget::FreeFromHandler(){
  if (this->handlerBool) {
    this->handlerBool = false;
    this->Handler->FreeWidget(this);
  }
}

void PauseWidget::AddToHandler(){
  if (!this->handlerBool) {
    this->handlerBool = true;
    this->Handler->AddWidget(this);
  }
}

Gfx* PauseWidget::Render(Gfx* g, u16 x0,u16 y0, u16 x1, u16 y1){
    g=RenderChildren(g,gGlobals.scrollLocation[0],y0,gGlobals.scrollLocation[1],y1);
    g=Borg7_Render(g,((pause_Substruct*)this->substruct)->borg7);
    RSPFUNC6(g);
    return g;
}

u8 PauseWidget::Tick(){
  s16 sVar1;
  BaseWidget *pBVar2;
  int iVar3;
  bool bVar4;
  s16 lVar5;
  SceneData *pSVar6;
  u32 uVar7;
  s16 varX;
  float fVar8;
  pause_Substruct *sub;
  
  sub = (pause_Substruct *)this->substruct;
  lVar5 = sub->unk22;
  sVar1 = sub->unk24;
  if (lVar5 == sVar1) {
    fVar8 = scroll_floats[sub->PauseMenuSection];
    sub->isScrolling = 0;
  }
  else {
    varX = 0;
    if (lVar5 < sVar1) {
      varX = sub->unk26;
      if ((int)sVar1 - (int)varX < lVar5) {
        varX = sub->unk24 - sub->unk22;
        sub->unk22 = sub->unk24;
      }
      else sub->unk22+= sub->unk26;
      sub->backgroundImage->SetCoords(sub->unk22 + -SCREEN_WIDTH,0);
    }
    if (sub->unk24 < sub->unk22) {
      if (sub->unk22 < (sub->unk24 + sub->unk26)) {
        sub->unk22 = sub->unk24;
        varX = 0;
      }
      else {
        sub->unk22 -= sub->unk26;
        varX = -sub->unk26;
      }
      sub->backgroundImage->SetCoords(sub->unk22 + SCREEN_WIDTH,0);
    }
    for(u8 i=0;i<3;i++){Utilities::MoveWidget(sub->pauseMenuSections[i],varX,0);}
    sub->backgroundWidget->SetCoords(sub->unk22,0);
    if (sub->unk22 == sub->unk24) {
      sub->backgroundWidget->SetBorg8(sub->backgroundImage->borg8,true);
      pBVar2 = sub->backgroundWidget;
      sub->unk24 = 0;
      sub->unk22 = 0;
      sub->backgroundImage->borg8 = NULL;
      sub->backgroundWidget->SetCoords(0,0);
      fVar8 = sub->scrollSpeed;
    }
    fVar8+= sub->scrollfloat;
  }
  sub->scrollSpeed = fVar8;
  if (!gOptionsMenuContPak) Borg7_TickAnimation(sub->borg7,1);
  Scene::MatrixASetPos(sub->sceneDat,sub->scrollSpeed,0.0,0.0);
  Scene::LookAt(sub->sceneDat,(sub->camPos).x,(sub->camPos).y,(sub->camPos).z,0.0,-100.0f,0.0,0.0,0.0,-1.0f);
  return TickChildren();
}

BaseWidget * PauseWidget::Control(controller_aidyn *cont) {
  pause_Substruct *ppVar1;
  BaseWidget *pBVar2;
  BaseWidget *pBVar3;
  WidgetOptionsSubstruct *pvVar2;
  
  ppVar1 = (pause_Substruct *)this->substruct;
  pvVar2 = (WidgetOptionsSubstruct *)ppVar1->optionsMenu->substruct;
  pBVar3 = pvVar2->contPakWidget;
  if (pBVar3 == NULL) {
    pBVar3 = BaseWidget::Control(cont);
    if ((pBVar3 == NULL) && (pBVar3 = NULL, ppVar1->PauseMenuSection == 0)) {
      if (((cont->held & (ANA_LEFT|D_LEFT)) == 0) ||
         (((pBVar3 = pvVar2->optionsConfig, pBVar3 == NULL ||
           (((OptionsConfigSubstruct*)pBVar2->substruct)->renameOpen)) ||
          (1 < ((OptionsConfigSubstruct*)pBVar2->substruct)->selected)))) {
        pBVar3 = NULL;
        if (((cont->held & (ANA_RIGHT|D_RIGHT)) != 0) &&
           (pBVar2 = pvVar2->optionsConfig, pBVar2 != NULL)) {
          pBVar3 = NULL;
          if ((!((OptionsConfigSubstruct*)pBVar2->substruct)->renameOpen) &&
             (pBVar3 = NULL, ((OptionsConfigSubstruct*)pBVar2->substruct)->selected < 2)) {
            pBVar3 = pvVar2->optionsConfig->RightFunc();
          }
        }
      }
      else pBVar3 = pvVar2->optionsConfig->LeftFunc();
    }
  }
  else pBVar3 = pBVar3->Control(cont);
  return pBVar3;
}

u32 PauseWidget::GetNumber(){return WidgetN_Other;}