#include "globals.h"

u32 gOptionsMenuContPak=false;

WidgetOptionsMenu::WidgetOptionsMenu():WidgetMenu(){}

WidgetOptionsMenu::~WidgetOptionsMenu(){
  WidgetOptionsSubstruct *sub = (WidgetOptionsSubstruct *)this->substruct;
  if (sub->ScrollMenu) {
    this->Unlink(sub->ScrollMenu);
    if (sub->ScrollMenu)sub->ScrollMenu->~BaseWidget();
    sub->ScrollMenu = NULL;
  }
  if (sub->theatreMenu){
    this->Unlink(sub->theatreMenu);
    if (sub->theatreMenu) sub->theatreMenu->~BaseWidget();
    sub->theatreMenu = NULL;
  }
  if(sub->optionsConfig) {
    this->Unlink(sub->optionsConfig);
    if (sub->optionsConfig) sub->optionsConfig->~BaseWidget();
  }
  if (sub->unkc) {
    this->Unlink(sub->unkc);
    if (sub->unkc) sub->unkc->~BaseWidget();
    sub->unkc = NULL;;
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
  sub->unkc = 0;
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
  pBVar1 = sub->unkc;
  if (((pBVar1) && (pBVar3 = sub->unk14, pBVar3 == pBVar1)) && (this->state == 3)){
    if (pBVar3) {
      pBVar3->~BaseWidget();
    }
    sub->unkc = NULL;
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


void WidgetOptionsMenu::MakeScrollList(WidgetOptionsMenu *this)

{
  WidgetMethods *pWVar1;
  BaseWidget *pBVar2;
  Borg8Header *pBVar3;
  ulong uVar4;
  BaseWidget *pBVar5;
  BaseWidget *pBVar6;
  ulong uVar7;
  WidgetOptionsSubstruct *sub;
  
  sub = (WidgetOptionsSubstruct *)this->substruct;
  pBVar2 = sub->unk10;
  sub->unk14 = pBVar2;
  if (pBVar2 != NULL) {
    pWVar1 = this->vTable;
    (*(pWVar1->Unlink).func)
              ((BaseWidget *)((int)&this->fadeIn + (int)*(short *)&(pWVar1->Unlink).arg),
               pBVar2);
    sub->unk10 = NULL;
  }
  pBVar2 = sub->ScrollMenu;
  if (pBVar2 == NULL) {
    pBVar2 = (BaseWidget *)new(0x7c);
    pBVar2 = WidgetScrollMenu::WidgetScrollMenu(pBVar2,6);
    sub->ScrollMenu = pBVar2;
    pBVar2 = (BaseWidget *)new(0x7c);
    pBVar3 = loadBorg8(BORG8_TitleMenui);
    pBVar2 = WidgetBorg8::WidgetBorg8(pBVar2,pBVar3);
    uVar4 = (*(pBVar2->vTable->GetWidth).func)
                      ((int)&pBVar2->fadeIn + (int)*(short *)&(pBVar2->vTable->GetWidth).arg);
    BaseWidget::SetCoords(pBVar2,0xa0 - (short)(uVar4 >> 1),0x46);
    pWVar1 = sub->ScrollMenu->vTable;
    (*(pWVar1->Link).func)
              ((int)&sub->ScrollMenu->fadeIn + (int)*(short *)&(pWVar1->Link).arg,pBVar2);
    pBVar5 = (BaseWidget *)new(0x7c);
    pBVar3 = loadBorg8(0x3757);
    pBVar5 = WidgetBorg8::WidgetBorg8(pBVar5,pBVar3);
    BaseWidget::SetCoords(pBVar5,0xaa,0xcc);
    (*(pBVar5->vTable->SetColor).func)
              ((int)&pBVar5->fadeIn + (int)*(short *)&(pBVar5->vTable->SetColor).arg,0x82,0x50,0x50,
               0xff);
    pWVar1 = sub->ScrollMenu->vTable;
    (*(pWVar1->Link).func)
              ((int)&sub->ScrollMenu->fadeIn + (int)*(short *)&(pWVar1->Link).arg,pBVar5);
    if (gGlobals.screenFadeModeSwitch != 3) {
      pBVar5 = (BaseWidget *)new(0x7c);
      pBVar6 = WidgetClipText::WidgetClipText(pBVar5,gGlobals.CommonStrings[0xa0],400);
      pBVar5 = sub->ScrollMenu;
      pBVar6->var5E = 0xa0;
      WidgetScrollMenu::Append(pBVar5,pBVar6);
      pBVar5 = (BaseWidget *)new(0x7c);
      pBVar6 = WidgetClipText::WidgetClipText(pBVar5,gGlobals.CommonStrings[0x179],400);
      pBVar5 = sub->ScrollMenu;
      pBVar6->var5E = 0x179;
      WidgetScrollMenu::Append(pBVar5,pBVar6);
    }
    pBVar5 = (BaseWidget *)new(0x7c);
    pBVar6 = WidgetClipText::WidgetClipText(pBVar5,gGlobals.CommonStrings[0xa1],400);
    pBVar5 = sub->ScrollMenu;
    pBVar6->var5E = 0xa1;
    WidgetScrollMenu::Append(pBVar5,pBVar6);
    if (gGlobals.screenFadeModeSwitch == 3) {
      if ((gGlobals.EncounterDat.BossShadow != 0) && (gGlobals.combatBytes[0] == 0xe)) {
        pBVar5 = (BaseWidget *)new(0x7c);
        pBVar6 = WidgetClipText::WidgetClipText(pBVar5,gGlobals.CommonStrings[0x17a],400);
        pBVar5 = sub->ScrollMenu;
        pBVar6->var5E = 0x17a;
        WidgetScrollMenu::Append(pBVar5,pBVar6);
      }
    }
    else {
      pBVar5 = (BaseWidget *)new(0x7c);
      pBVar6 = WidgetClipText::WidgetClipText(pBVar5,gGlobals.CommonStrings[0xa2],400);
      pBVar5 = sub->ScrollMenu;
      pBVar6->var5E = 0xa2;
      WidgetScrollMenu::Append(pBVar5,pBVar6);
      pBVar5 = (BaseWidget *)new(0x7c);
      pBVar6 = WidgetClipText::WidgetClipText(pBVar5,s_Credits_800dd220,400);
      pBVar5 = sub->ScrollMenu;
      pBVar6->var5E = 9999;
      WidgetScrollMenu::Append(pBVar5,pBVar6);
      pBVar5 = (BaseWidget *)new(0x7c);
      pBVar6 = WidgetClipText::WidgetClipText(pBVar5,gGlobals.CommonStrings[0xad],400);
      pBVar5 = sub->ScrollMenu;
      pBVar6->var5E = 0xad;
      WidgetScrollMenu::Append(pBVar5,pBVar6);
    }
    BaseWidget::SetCoords(sub->ScrollMenu,0xa0,0x6e);
    FUN_800bbfc8(sub->ScrollMenu,5);
    WidgetScrollMenu::SetFlags(sub->ScrollMenu,4);
    pWVar1 = sub->ScrollMenu->vTable;
    (*(pWVar1->SetColor).func)
              ((int)&sub->ScrollMenu->fadeIn + (int)*(short *)&(pWVar1->SetColor).arg,0x82,0x50,0x50
               ,0xff);
    Utilities::SetScrollMenuColors(sub->ScrollMenu,0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
    pWVar1 = sub->ScrollMenu->vTable;
    (*(pWVar1->Tick).func)((int)&sub->ScrollMenu->fadeIn + (int)*(short *)&(pWVar1->Tick).arg);
    uVar4 = (*(pBVar2->vTable->getHeight).func)
                      ((int)&pBVar2->fadeIn + (int)*(short *)&(pBVar2->vTable->getHeight).arg);
    pWVar1 = sub->ScrollMenu->vTable;
    uVar7 = (*(pWVar1->getHeight).func)
                      ((int)&sub->ScrollMenu->fadeIn + (int)*(short *)&(pWVar1->getHeight).arg);
    pBVar2->y = (short)((int)(SCREEN_HEIGHT - (uVar4 + uVar7 + 0x10 & 0xffff)) / 2);
    uVar4 = (*(pBVar2->vTable->getHeight).func)
                      ((int)&pBVar2->fadeIn + (int)*(short *)&(pBVar2->vTable->getHeight).arg);
    sub->ScrollMenu->y = pBVar2->y + (short)uVar4 + 0x10;
    pBVar2 = sub->ScrollMenu;
    sub->unk18 = 0;
  }
  else {
    sub->unk18 = 0;
  }
  pWVar1 = this->vTable;
  sub->unk10 = pBVar2;
  (*(pWVar1->Link).func)((int)&this->fadeIn + (int)*(short *)&(pWVar1->Link).arg,pBVar2);
  this->alpha0 = 0;
  Utilities::SetAlpha(sub->unk10,0);
  this->alpha1 = 0xff;
  if (sub->unk14 != NULL) {
    Utilities::SetAlpha(sub->unk14,0xff);
  }
  return;
}


void WidgetOptionsMenu::InitConfigMenu(WidgetOptionsMenu *this)

{
  WidgetMethods *pWVar1;
  void *pvVar2;
  BaseWidget *pBVar3;
  WidgetOptionsSubstruct *iVar1;
  
  iVar1 = (WidgetOptionsSubstruct *)this->substruct;
  iVar1->unk14 = iVar1->unk10;
  if (iVar1->unk10 != NULL) {
    pWVar1 = this->vTable;
    (*(pWVar1->Unlink).func)((int)&this->fadeIn + (int)*(short *)&(pWVar1->Unlink).arg);
    iVar1->unk10 = NULL;
  }
  if (iVar1->optionsConfig == NULL) {
    pvVar2 = new(0x84);
    pBVar3 = (BaseWidget *)WidgetOptionsConfig::WidgetOptionsConfig(pvVar2,1);
    iVar1->optionsConfig = pBVar3;
    Utilities::MoveWidget(pBVar3,0x19,0);
    pBVar3 = iVar1->optionsConfig;
  }
  else {
    pBVar3 = iVar1->optionsConfig;
  }
  iVar1->unk18 = 1;
  pWVar1 = this->vTable;
  iVar1->unk10 = pBVar3;
  (*(pWVar1->Link).func)((int)&this->fadeIn + (int)*(short *)&(pWVar1->Link).arg,pBVar3);
  this->alpha0 = 0;
  Utilities::SetAlpha(iVar1->unk10,0);
  this->alpha1 = 0xff;
  if (iVar1->unk14 != NULL) {
    Utilities::SetAlpha(iVar1->unk14,0xff);
  }
  return;
}


void WidgetOptionsMenu::InitTheatreMenu(WidgetOptionsMenu *param_1)

{
  WidgetMethods *pWVar1;
  BaseWidget *pBVar2;
  WidgetOptionsSubstruct *iVar1;
  
  iVar1 = (WidgetOptionsSubstruct *)this->substruct;
  iVar1->unk14 = iVar1->unk10;
  if (iVar1->theatreMenu == NULL) {
    pBVar2 = (BaseWidget *)new(0x7c);
    pBVar2 = TheatreMenu::TheatreMenu(pBVar2);
    iVar1->theatreMenu = pBVar2;
    Utilities::SetScrollMenuColors(iVar1->theatreMenu,0x67,0x46,0x3c,0xfa,0x67,0x46,0x3c,0,0x18);
  }
  pWVar1 = this->vTable;
  (*(pWVar1->Unlink).func)
            ((int)&this->fadeIn + (int)*(short *)&(pWVar1->Unlink).arg,iVar1->unk10);
  iVar1->unk18 = 2;
  pWVar1 = this->vTable;
  iVar1->unk10 = iVar1->theatreMenu;
  (*(pWVar1->Link).func)
            ((int)&this->fadeIn + (int)*(short *)&(pWVar1->Link).arg,iVar1->theatreMenu);
  this->alpha0 = 0;
  Utilities::SetAlpha(iVar1->unk10,0);
  this->alpha1 = 0xff;
  if (iVar1->unk14) Utilities::SetAlpha(iVar1->unk14,0xff);
}

void FUN_800477a0(void){
  pause_Substruct *sub;
  WidgetOptionsMenu *p;
  
  if (((gGlobals.BigAssMenu != NULL) &&
      (sub = (pause_Substruct *)gGlobals.BigAssMenu->substruct, sub != NULL)) &&
     (p = sub->optionsMenu, p != NULL)) {
    p->MakeScrollList();
    PlayAudioSound(&gGlobals.SFXStruct,0x741,0,1.0,0x3c,0);
  }
}


void WidgetOptionsMenu::ContPakLoad(WidgetOptionsMenu *param_1)

{
  WidgetMethods *pWVar1;
  WidgetContPakData *pWVar2;
  BaseWidget *pBVar3;
  Color32 uStack208;
  Color32 uStack144;
  Color32 uStack80;
  OptionsConfigSubstruct *pvVar1;
  
  pvVar1 = (OptionsConfigSubstruct *)this->substruct;
  pWVar1 = this->vTable;
  pvVar1->optionTitles[2] = pvVar1->optionTitles[1];
  (*(pWVar1->Unlink).func)
            ((int)&this->fadeIn + (int)*(short *)&(pWVar1->Unlink).arg,
             pvVar1->optionTitles[1]);
  pBVar3 = pvVar1->optionTitles[0];
  if (pBVar3 == NULL) {
    uStack208.R = 0x82;
    uStack208.G = 0x50;
    uStack208.B = 0x50;
    uStack208.A = 0xff;
    uStack144.R = 0x44;
    uStack144.B = 0x22;
    uStack144.G = 0x2a;
    uStack80.R = 0x97;
    uStack80.B = 0xbf;
    uStack80.G = 0x8d;
    uStack144.A = 0xff;
    uStack80.A = 0xff;
    pWVar2 = WContPakData_Load(0x43,0x18,FUN_80050868,FUN_800477a0,&uStack208,&uStack144,
                               (Color32)&uStack80);
    pvVar1->optionTitles[0] = &pWVar2->base;
    pBVar3 = pvVar1->optionTitles[0];
  }
  *(undefined1 *)(pvVar1->optionTitles + 3) = 3;
  pWVar1 = this->vTable;
  pvVar1->optionTitles[1] = pBVar3;
  (*(pWVar1->Link).func)((int)&this->fadeIn + (int)*(short *)&(pWVar1->Link).arg,pBVar3);
  this->alpha0 = 0;
  Utilities::SetAlpha(pvVar1->optionTitles[1],0);
  this->alpha1 = 0xff;
  if (pvVar1->optionTitles[2] != NULL) {
    Utilities::SetAlpha(pvVar1->optionTitles[2],0xff);
  }
  gOptionsMenuContPak = 1;
  return;
}

void WidgetOptionsMenu::ContPakSave(WidgetOptionsMenu *param_1)

{
  WidgetMethods *pWVar1;
  WidgetContPakData *pWVar2;
  BaseWidget *pBVar3;
  Color32 aCStack_d0 [16];
  Color32 acStack144;
  Color32 acStack80;
  WidgetOptionsSubstruct *pvVar1;
  
  pvVar1 = (WidgetOptionsSubstruct *)this->substruct;
  pWVar1 = this->vTable;
  pvVar1->unk14 = pvVar1->unk10;
  (*(pWVar1->Unlink).func)
            ((int)&this->fadeIn + (int)*(short *)&(pWVar1->Unlink).arg,pvVar1->unk10);
  pBVar3 = pvVar1->unkc;
  if (pBVar3 == NULL) {
    aCStack_d0[0].R = 0x82;
    aCStack_d0[0].G = 0x50;
    aCStack_d0[0].B = 0x50;
    aCStack_d0[0].A = 0xff;
    acStack144.R = 0x44;
    acStack144.B = 0x22;
    acStack144.G = 0x2a;
    acStack80.R = 0x97;
    acStack80.B = 0xbf;
    acStack80.G = 0x8d;
    acStack144.A = 0xff;
    acStack80.A = 0xff;
    pvVar1->unkc = WContPakData_Save(0x43,0x18,FUN_800477a0,aCStack_d0,&acStack144,&acStack80);
    pBVar3 = pvVar1->unkc;
  }
  pvVar1->unk18 = 3;
  pWVar1 = this->vTable;
  pvVar1->unk10 = pBVar3;
  (*(pWVar1->Link).func)((int)&this->fadeIn + (int)*(short *)&(pWVar1->Link).arg,pBVar3);
  this->alpha0 = 0;
  Utilities::SetAlpha(pvVar1->unk10,0);
  this->alpha1 = 0xff;
  if (pvVar1->unk14) Utilities::SetAlpha(pvVar1->unk14,0xff);
  gOptionsMenuContPak = 1;
}

u32 WidgetOptionsMenu::GetNumber(){return WidgetN_Other;}