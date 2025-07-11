#include "globals.h"

u16 pause_menu_borg8[]={BORG8_PauseMenuA,BORG8_PauseMenuB,BORG8_PauseMenuC};
float scroll_floats[]={27.0,0,-26.0,0};

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
  delete(sub);
  this->substruct = NULL;
  this->Handler->FreeWidget(this);
  WidgetMenu::~WidgetMenu();
}


u32 PauseWidget::BigAssMenu(WidgetHandler *param_2,byte menu_section){
  bool bVar3;
  bool bVar4;
  float fVar5;
  u32 uVar6;
  pause_Substruct *sub;
  Borg7Header *pBVar7;
  BaseWidget *pBVar8;
  Borg8Header *b8;
  u32 uVar9;
  WidgetHandler *pWVar10;
  u32 borg12;
  
  this->Handler = param_2;
  uVar6 = gGlobals.unk14fc;
  bVar3 = gGlobals.screenFadeModeSwitch == 6;
  bVar4 = gGlobals.combatBytes[0] != 0xf;
  sub = new pause_Substruct;
  this->substruct = sub;
  sub->unk22 = 0;
  sub->unk24 = 0;
  sub->unk26 = 10;
  sub->PauseMenuSection = menu_section;
  sub->optionsMenu = NULL;
  sub->dollmenu = NULL;
  sub->calendar = NULL;
  sub->takeInput = 0;
  pBVar7 = func_loading_borg7(BORG7_PauseMenu,&gGlobals.Sub.particleEmmiter);
  (sub->camPos).x = 0.0;
  (sub->camPos).z = 0.0;
  (sub->camPos).y = 27.0f;
  sub->borg7 = pBVar7;
  sub->sceneDat = pBVar7->sceneDat;
  Scene::SetNearFarPlanes(pBVar7->sceneDat,1.0,256.0);
  Scene::SetFlag8(sub->sceneDat);
  Scene::SetFlag10(sub->sceneDat);
  Scene::SetFlag4(sub->sceneDat);
  Scene::SetModelTint(sub->sceneDat,0xff,0xff,0xff,0xff);
  sub->backgroundImage = WigetB8Blank;
  sub->backgroundImage->SetColor(0xff,0xff,0xff,0xff);
  sub->backgroundImage->SetCoords(0,0);
  sub->backgroundImage->SetWidth(SCREEN_WIDTH);
  sub->backgroundImage->SetHeight(SCREEN_HEIGHT);
  sub->backgroundWidget = WidgetB8(pause_menu_borg8[menu_section]);
  sub->backgroundWidget->SetCoords(0,0);
  sub->backgroundWidget->SetColor(0xff,0xff,0xff,0xff);
  sub->backgroundWidget->SetWidth(SCREEN_WIDTH);
  sub->backgroundWidget->SetHeight(SCREEN_HEIGHT);
  this->Link(sub->backgroundWidget);
  this->Link(sub->backgroundImage);
  switch(menu_section){
    case 0:
    borg12 = Menu_open;
    gGlobals.scrollLocation[0] = SCREEN_WIDTH;
    gGlobals.scrollLocation[1] = SCREEN_WIDTH;
    sub->scrollSpeed = 27.0f;
    if (bVar4) {
      pBVar7 = sub->borg7;
LAB_80035e18:
      FUN_800a0090(pBVar7,0x16);
      goto LAB_80035e34;
    }
    break;
    case 1:
    borg12 = Menu_open;
    gGlobals.scrollLocation[0] = 0xa0;
    gGlobals.scrollLocation[1] = 0xa0;
    sub->scrollSpeed = 0.0;
    if (bVar4) {
      FUN_800a0090(sub->borg7,10);
      goto LAB_80035e34;
    }
    break;
    case 2:
    borg12 = Menu_Scroll;
    gGlobals.scrollLocation[0] = 0;
    gGlobals.scrollLocation[1] = -5;
    sub->scrollSpeed = -26.0f;
    if (bVar4) {
      pBVar7 = sub->borg7;
      goto LAB_80035e18;
    }
    break;
    default:
    CRASH("BigAssMenu()","Unknown starting menu type");
  }
  FUN_800a0090(sub->borg7,0);
LAB_80035e34:
  InitOptionsMenu();
  if (uVar6 == 0) {
    if ((gGlobals.SomeCase == 7) || (gGlobals.SomeCase == 3))
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
  this->CLeftFunc = bigAssMenu_CLeftFunc;
  this->CRightFunc = FUN_800373a0;
  this->CUpFunc = FUN_800373ec;
  this->CDownFunc = bigAssMenu_CDownFunc;
  this->StartButtonFunc = BigAssMenu_StartFunc;
  this->AbuttonFunc = bigassMenu_AFunc;
  this->BButtonFunc = bigAssMenu_BFunc;
  this->LButtonFunc = bigAssMenu_LZFunc;
  this->ZButtonFunc = bigAssMenu_LZFunc;
  this->fadeOut = bigAssOpenCallback_1;
  this->fadeIn = bigAssOpenCallback;
  if (bVar3) this->fadeOut = PauseMenuClose2;
  else if (!bVar4) this->fadeIn = PauseMenuClose1;
  PlayAudioSound(&gGlobals.SFXStruct,borg12,0,1.0,0x3c,0);
  return Controller::GetDelay(0);
}


void PauseWidget::bigAssOpenCallback_2(){
  byte bVar1;
  bool bVar2;
  Borg7Header *pBVar3;
  u32 borg12;
  pause_Substruct *sub = (pause_Substruct *)this->substruct;
  bVar2 = gGlobals.SomeCase == 5;
  sprintf(gGlobals.text,"isCombatLevelup = %d\n",bVar2);
  N64Print::Print(gGlobals.text);
  switch(sub->PauseMenuSection){
    case 0:
    borg12 = Menu_Scroll;
    if (!bVar2) {
LAB_800360bc:
      FUN_800a0090(sub->borg7,11);
      goto LAB_800360dc;
    }
    break;
    case 1:
        borg12 = Menu_Scroll;
    if (!bVar2) {
      FUN_800a0090(sub->borg7,19);
      goto LAB_800360dc;
    }
    break;
    case 2:
        borg12 = Menu_open;
    if (!bVar2) {
      goto LAB_800360bc;
    }
    FUN_800a0090(sub->borg7,0);
    break;
    default:
    CRASH("bigassOpenCallBack","unknown screen");
  }
LAB_800360dc:
  FUN_800a0304(sub->borg7,1);
  PlayAudioSound(&gGlobals.SFXStruct,borg12,0,1.0,60,0);
  this->SetState(5);
}

void PauseWidget::InitOptionsMenu(){
  pause_Substruct *sub = (pause_Substruct *)this->substruct;
  sub->optionsMenu = new WidgetOptionsMenu();
  sub->optionsMenu->var5C = 0;
  sub->pauseMenuSections[0] = sub->optionsMenu;
  if (gGlobals.cinematicReplay == 0) {
    sub->optionsMenu->InitMenu(0);
  }
  else {
    sub->optionsMenu->InitMenu(2);
    gGlobals.cinematicReplay = 0;
  }
  Utilities::MoveWidget(sub->optionsMenu,(ushort)(byte)sub->PauseMenuSection * -SCREEN_WIDTH,0);
  sub->optionsMenu->Tick();
  this->Link(sub->optionsMenu);
}

void PauseWidget::BuildDollMenu(u8 param_2){;
  pause_Substruct *sub = (pause_Substruct *)this->substruct;
  sub->dollmenu = new WidgetDollMenu(0,param_2);
  sub->dollmenu->var5C = 1;
  sub->pauseMenuSections[1] = sub->dollmenu;
  Utilities::MoveWidget(sub->dollmenu,(1 - (ushort)sub->PauseMenuSection) * SCREEN_WIDTH,0);
  sub->dollmenu->Tick();
  this->Link(sub->dollmenu);
}

void PauseWidget::BuildCalendarMenu(){
  pause_Substruct *sub = (pause_Substruct *)this->substruct;
  sub->calendar = new WidgetCalendar();
  sub->calendar->var5C = 2;
  sub->pauseMenuSections[2] = sub->calendar;
  Utilities::MoveWidget(sub->calendar,(2 - (ushort)sub->PauseMenuSection) * SCREEN_WIDTH,0);
  sub->calendar->Tick();
  this->Link(sub->calendar);
  return;
}

void PauseWidget::m8003636c(){
  if (this->handlerBool != 0) {
    this->handlerBool = 0;
    this->Handler->FreeWidget(this);
  }
}

void PauseWidget::m8003639c(){
  if (this->handlerBool == 0) {
    this->handlerBool = 1;
    this->Handler->AddWidget(this);
  }
}

Gfx* PauseWidget::Render(Gfx* g, u16 x0,u16 y0, u16 x1, u16 y1){
    g=RenderChildren(g,gGlobals.scrollLocation[0],y0,gGlobals.scrollLocation[1],y1);
    g=BorgAnimDrawSceneLinked(g,((pause_Substruct*)this->substruct)->borg7);
    RSPFUNC6(g);
    return g;
}

u8 PauseWidget::Tick(){
  short sVar1;
  BaseWidget *pBVar2;
  int iVar3;
  bool bVar4;
  longlong lVar5;
  SceneData *pSVar6;
  uint uVar7;
  short x;
  float fVar8;
  pause_Substruct *sub;
  
  sub = (pause_Substruct *)this->substruct;
  lVar5 = sub->unk22;
  sVar1 = sub->unk24;
  if (lVar5 == sVar1) {
    fVar8 = scroll_floats[sub->PauseMenuSection];
    sub->takeInput = 0;
  }
  else {
    x = 0;
    if (lVar5 < sVar1) {
      x = sub->unk26;
      if ((int)sVar1 - (int)x < lVar5) {
        x = sub->unk24 - sub->unk22;
        sub->unk22 = sub->unk24;
      }
      else sub->unk22+= sub->unk26;
      sub->backgroundImage->SetCoords(sub->unk22 + -SCREEN_WIDTH,0);
    }
    if (sub->unk24 < sub->unk22) {
      if (sub->unk22 < (sub->unk24 + sub->unk26)) {
        sub->unk22 = sub->unk24;
        x = 0;
      }
      else {
        sub->unk22 -= sub->unk26;
        x = -sub->unk26;
      }
      sub->backgroundImage->SetCoords(sub->unk22 + SCREEN_WIDTH,0);
    }
    for(u8 i=0;i<3;i++){Utilities::MoveWidget(sub->pauseMenuSections[i],x,0);}
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
    fVar8 = fVar8 + sub->scrollfloat;
  }
  sub->scrollSpeed = fVar8;
  if (DAT_800ed620 == 0) FUN_800a0304(sub->borg7,1);
  Scene::MatrixASetPos(sub->sceneDat,sub->scrollSpeed,0.0,0.0);
  Scene::LookAt(sub->sceneDat,(sub->camPos).x,(sub->camPos).y,(sub->camPos).z,0.0,-100.0f,0.0,0.0,0.0,-1.0f);
  return TickChildren();
}

