#include "globals.h"
#include "widgets/theatreMenu.h"


WidgetOptionsMenu::WidgetOptionsMenu():WidgetMenu(){}

WidgetOptionsMenu::~WidgetOptionsMenu(){
  WidgetOptionsSubstruct *sub = (WidgetOptionsSubstruct *)this->substruct;
  if (sub->ScrollMenu) {
    BaseWidget::Unlink(sub->ScrollMenu);
    if (sub->ScrollMenu)sub->ScrollMenu->~WidgetScrollMenu();
    sub->ScrollMenu = NULL;
  }
  if (sub->theatreMenu){
    BaseWidget::Unlink(sub->theatreMenu);
    if (sub->theatreMenu) sub->theatreMenu->~BaseWidget();
    sub->theatreMenu = NULL;
  }
  if(sub->optionsConfig) {
    BaseWidget::Unlink(sub->optionsConfig);
    if (sub->optionsConfig) sub->optionsConfig->~WidgetOptionsConfig();
  }
  if (sub->contPakWidget) {
    BaseWidget::Unlink(sub->contPakWidget);
    if (sub->contPakWidget) sub->contPakWidget->~BaseWidget();
    sub->contPakWidget = NULL;;
  }
  sub->unk10 = NULL;
  sub->unk14 = NULL;
  delete(sub);
  this->substruct = NULL;
  WidgetMenu::~WidgetMenu();
}

u32 WidgetOptionsMenu::InitMenu(u8 sel){
  WidgetOptionsSubstruct *sub = new WidgetOptionsSubstruct;
  this->substruct = sub;
  sub->selected = sel;
  sub->unk10 = NULL;
  sub->ScrollMenu = NULL;
  sub->contPakWidget = 0;
  sub->optionsConfig = NULL;
  sub->theatreMenu = NULL;
  sub->unk14 = NULL;
  this->alpha1 = 0;
  this->alpha0 = 0;
  switch (sel){
    case 0: MakeScrollList();break;
    case 1: InitConfigMenu();break;
    case 2: InitTheatreMenu();break;
    case 3: ContPakLoad();break;
  }
  this->alpha0 = 0xff;
  Utilities::SetAlpha(sub->unk10,0xff);
  this->LeftButtonFunc = WidgetOptions_Left;
  this->RightButtonFunc = WidgetOptions_Right;
  this->UpButtonFunc = WidgetOptions_Up;
  this->DownButtonFunc = WidgetOptions_Down;
  this->AButtonFunc = PauseMenuSelectCallback;
  this->BButtonFunc = WidgetOptions_BButton;
  this->StartButtonFunc = WidgetOptions_StartButton;
  return Controller::GetDelay(0);
}


Gfx * WidgetOptionsMenu::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  BaseWidget *pBVar1;
  BaseWidget *pBVar3;
  
  WidgetOptionsSubstruct *sub = (WidgetOptionsSubstruct *)this->substruct;
  if (sub->unk14){
    if (this->alpha1) {
       sub->unk14->Tick();
      g = sub->unk14->Render(g,x0,y0,x1,y1);
      RENDERCHILDREN();
    }
  }
  pBVar1 = sub->contPakWidget;
  if (((pBVar1) && (pBVar3 = sub->unk14, pBVar3 == pBVar1)) && (this->state == WidgetS_Running)){
    if (pBVar3) {
      pBVar3->~BaseWidget();
    }
    sub->contPakWidget = NULL;
    sub->unk14 = NULL;
    gOptionsMenuContPak = 0;
  }
RENDERCHILDREN();
}

u8 WidgetOptionsMenu::Tick(){
  WidgetOptionsSubstruct *sub = (WidgetOptionsSubstruct *)this->substruct;
  if (sub->unk10){
    if (this->alpha0 != 0xff) {
      if (195 <= this->alpha0) this->alpha0=0xff;
      else this->alpha0+=60;
      Utilities::SetAlpha(sub->unk10,this->alpha0);
    }
  }
  if (sub->unk14) {
    if (this->alpha1) {
      if (this->alpha1 <= 60) this->alpha1 = 0;
      else this->alpha1-=60;
      Utilities::SetAlpha(sub->unk14,this->alpha1);
    }
  }
  return TickChildren();
}

void WidgetOptionsMenu::MakeScrollList(){
  BaseWidget *pBVar2;
  BaseWidget *pBVar5;
  WidgetClipText *txt;
  ulong uVar7;
  WidgetOptionsSubstruct *sub;
  
  sub = (WidgetOptionsSubstruct *)this->substruct;
  pBVar2 = sub->unk10;
  sub->unk14 = pBVar2;
  if (pBVar2) {
    this->Unlink(pBVar2);
    sub->unk10 = NULL;
  }
  pBVar2 = sub->ScrollMenu;
  if (pBVar2 == NULL) {
    sub->ScrollMenu = new WidgetScrollMenu(6);
    pBVar2 = WidgetB8(BORG8_TitleMenui);
    pBVar2->SetCoords(SCREEN_CENTERW-(pBVar2->GetWidth()/2),0x46);
    sub->ScrollMenu->Link(pBVar2);
    pBVar5 = WidgetB8(BORG8_SliderArrowR);
    pBVar5->SetCoords(170,204);
    pBVar5->SetColor(COLOR_RED1);
    sub->ScrollMenu->Link(pBVar5);
    if (gGlobals.screenFadeModeSwitch != 3) {
      txt = WClipTXT(Cstring(OptionsLoadGame));
      txt->varU16 = OptionN_LoadGame;
      sub->ScrollMenu->Append(txt);
      txt = WClipTXT(Cstring(OptionsSaveGame));
      txt->varU16 = OptionN_SaveGame;
      sub->ScrollMenu->Append(txt);
    }
    txt = WClipTXT(Cstring(OptionsOptions));
    txt->varU16 = OptionN_Config;
    sub->ScrollMenu->Append(txt);
    if (gGlobals.screenFadeModeSwitch == 3) {
      if ((gGlobals.EncounterDat.canFlee) && (gGlobals.combatBytes[0] == 0xe)) {
        txt = WClipTXT(Cstring(OptionsFlee));
        txt->varU16 = OptionN_Flee;
        sub->ScrollMenu->Append(txt);
      }
    }
    else {
      txt = WClipTXT(Cstring(OptionsTheatre));
      txt->varU16 = OptionN_Theatre;
      sub->ScrollMenu->Append(txt);
      txt = WClipTXT("Credits");
      txt->varU16 = OptionN_Credits;
      sub->ScrollMenu->Append(txt);
      txt = WClipTXT(Cstring(OptionsHelp));
      txt->varU16 = OptionN_Help;
      sub->ScrollMenu->Append(txt);
    }
    sub->ScrollMenu->SetCoords(SCREEN_CENTERW,110);
    Utilities::SetArrayVSpace(sub->ScrollMenu,5);
    sub->ScrollMenu->SetFlags(4);
    sub->ScrollMenu->SetColor(COLOR_RED1);
    Utilities::SetScrollMenuColors(sub->ScrollMenu,0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
    sub->ScrollMenu->Tick();
    pBVar2->posY = (s16)((int)(SCREEN_HEIGHT - (u16)(pBVar2->GetHeight() + sub->ScrollMenu->GetHeight() + 0x10)) / 2);
    sub->ScrollMenu->posY = pBVar2->posY + (s16)pBVar2->GetHeight() + 0x10;
    pBVar2 = sub->ScrollMenu;
  }
  sub->selected = 0;
  sub->unk10 = pBVar2;
  this->Link(pBVar2);
  this->alpha0 = 0;
  Utilities::SetAlpha(sub->unk10,0);
  this->alpha1 = 0xff;
  if (sub->unk14 != NULL) Utilities::SetAlpha(sub->unk14,0xff);
}

void WidgetOptionsMenu::InitConfigMenu(){
  WidgetOptionsSubstruct *sub = (WidgetOptionsSubstruct *)this->substruct;
  sub->unk14 = sub->unk10;
  if (sub->unk10) {
    this->Unlink(sub->unk10);
    sub->unk10 = NULL;
  }
  if (!sub->optionsConfig) {
    sub->optionsConfig = new WidgetOptionsConfig(true);
    Utilities::MoveWidget(sub->optionsConfig,25,0);
  }
  sub->selected = 1;
  sub->unk10 = sub->optionsConfig;
  this->Link(sub->optionsConfig);
  this->alpha0 = 0;
  Utilities::SetAlpha(sub->unk10,0);
  this->alpha1 = 0xff;
  if (sub->unk14) Utilities::SetAlpha(sub->unk14,0xff);
}

void WidgetOptionsMenu::InitTheatreMenu(){
  BaseWidget *pBVar2;
  WidgetOptionsSubstruct *sub;
  
  sub = (WidgetOptionsSubstruct *)this->substruct;
  sub->unk14 = sub->unk10;
  if (sub->theatreMenu == NULL) {
    sub->theatreMenu = new TheatreMenu();
    Utilities::SetScrollMenuColors(sub->theatreMenu,0x67,0x46,0x3c,0xfa,0x67,0x46,0x3c,0,0x18);
  }
  this->Unlink(sub->unk10);
  sub->selected = 2;
  sub->unk10 = sub->theatreMenu;
  this->Link(sub->theatreMenu);
  this->alpha0 = 0;
  Utilities::SetAlpha(sub->unk10,0);
  this->alpha1 = 0xff;
  if (sub->unk14) Utilities::SetAlpha(sub->unk14,0xff);
}

void FUN_800477a0(void){
  pause_Substruct *sub;
  WidgetOptionsMenu *p;
  
  if (((gGlobals.BigAssMenu != NULL) &&
      (sub = PauseSub, sub != NULL)) &&
     (p = sub->optionsMenu, p != NULL)) {
    p->MakeScrollList();
    PlayAudioSound(&gGlobals.SFXStruct,0x741,0,1.0,0x3c,0);
  }
}

void WidgetOptionsMenu::ContPakLoad(){
  WidgetOptionsSubstruct *sub = (WidgetOptionsSubstruct *)this->substruct;
  sub->unk14 = sub->unk10;
  this->Unlink(sub->unk10);
  if (!sub->contPakWidget) {
    Color32 col0={COLOR_RED1};
    Color32 col1={0x44,0x22,0x2a,0xff};
    Color32 col2= {0x97,0xbf,0x8d,0xff};
    sub->contPakWidget = WContPakData_Load(0x43,0x18,FUN_80050868,FUN_800477a0,&col0,&col1,&col2);
  }
  sub->selected = 3;
  sub->unk10 = sub->contPakWidget;
  this->Link(sub->contPakWidget);
  this->alpha0 = 0;
  Utilities::SetAlpha(sub->unk10,0);
  this->alpha1 = 0xff;
  if (sub->unk14) Utilities::SetAlpha(sub->unk14,0xff);
  gOptionsMenuContPak = 1;
}

void WidgetOptionsMenu::ContPakSave(){
  WidgetContPakData *pWVar2;
  BaseWidget *pBVar3;
  Color32 aCStack_d0;
  Color32 acStack144;
  Color32 acStack80;
  WidgetOptionsSubstruct *pvVar1;
  
  pvVar1 = (WidgetOptionsSubstruct *)this->substruct;
  pvVar1->unk14 = pvVar1->unk10;
  this->Unlink(pvVar1->unk10);
  if (!pvVar1->contPakWidget) {
    Color32 col0={COLOR_RED1};
    Color32 col1={0x44,0x22,0x2a,0xff};
    Color32 col2= {0x97,0xbf,0x8d,0xff};
    pvVar1->contPakWidget = WContPakData_Save(0x43,0x18,FUN_800477a0,&col0,&col1,&col2);
  }
  pvVar1->selected = 3;
  pvVar1->unk10 = pvVar1->contPakWidget;
  this->Link(pvVar1->contPakWidget);
  this->alpha0 = 0;
  Utilities::SetAlpha(pvVar1->unk10,0);
  this->alpha1 = 0xff;
  if (pvVar1->unk14) Utilities::SetAlpha(pvVar1->unk14,0xff);
  gOptionsMenuContPak = 1;
}

u32 WidgetOptionsMenu::GetNumber(){return WidgetN_Other;}