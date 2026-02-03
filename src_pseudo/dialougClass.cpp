#include "globals.h"

DiaMenuSub::DiaMenuSub(WidgetHandler *handle,u8 a2,u8 a3){    
    SuperMenuClasses::Set();
    this->unk4 = NULL;
      switch(a2) {
      case 2:
      case 4:
        Init24(a3);
        return;
      case 0:
      case 1:
      case 3:
      default:
    this->Portrait = WigetB8Blank;
    this->PortraitBorder = WigetB8Blank;
    this->Background = WigetB8Blank;
    this->Gradient = WigetB8Blank;
    this->text = new WidgetText("",500);
    this->scrollMenu = new WidgetScrollMenu(9);
    Utilities::SetBorg8Dims(this->PortraitBorder,SuperMenuClasses::Add(BORG8_PortraitHighlight),false);
    Utilities::SetBorg8Dims(this->Background,SuperMenuClasses::Add(BORG8_Pixel),false);
    Utilities::SetBorg8Dims(this->Gradient,SuperMenuClasses::Add(BORG8_GradientC),false);
    this->Background->SetColor(COLOR_BLACK);
    this->Gradient->SetColor(COLOR_BLACK);
    this->Gradient->SetHeight(10);
    this->PortraitBorder->SetCoords(0x14,0xb4);
    this->Portrait->SetCoords(0x1a,0xba);
    InitDefault(a2);
  }
}

void DiaMenuSub::InitDefault(u8 param_2){
  BaseWidget *pBVar1;
  BaseWidget *pBVar2;
  ulong uVar4;
  u16 uVar5;
  u16 uVar6;
  
  if (true) {
    switch(param_2) {
    case 2:
    case 4:
      NOOP_8004e97c();
      return;
    }
  }
  pBVar1 = this->PortraitBorder;
  pBVar2 = this->Background;
  pBVar2->boundX1 = SCREEN_WIDTH;
  pBVar2->boundY0 = 0xb4;
  pBVar2->boundX0 = 0;
  uVar4 = this->PortraitBorder->GetHeight();
  pBVar1 = this->Background;
  pBVar1->boundY1 = (s16)uVar4 + 0xb4;
  pBVar1->SetCoords(pBVar1->boundX0,pBVar1->boundY0);
  pBVar1 = this->Background;
  pBVar1->SetWidth(pBVar1->boundX1 - pBVar1->boundX0);
  pBVar1 = this->Background;
  pBVar1->SetHeight(pBVar1->boundY1 - pBVar1->boundY0);
  uVar4 = this->PortraitBorder->GetWidth();
  pBVar1 = this->text;
  pBVar2 = this->Background;
  uVar5 = (s16)uVar4 + 0x1a;
  pBVar1->boundX0 = uVar5;
  pBVar1->boundX1 = pBVar2->boundX1 - 0x1a;
  uVar6 = pBVar2->boundY0 + 4;
  pBVar1->boundY0 = uVar6;
  pBVar1->boundY1 = pBVar2->boundY1 - 4;
  pBVar1->SetCoords(uVar5,uVar6);
  this->text->SetColor(200,200,200,0xff);
  pBVar1 = this->text;
  pBVar2 = this->scrollMenu;
  pBVar2->boundX0 = pBVar1->boundX0;
  pBVar2->boundX1 = pBVar1->boundX1;
  pBVar2->boundY0 = pBVar1->boundY0;
  pBVar2->boundY1 = pBVar1->boundY1;
  pBVar2->SetCoords(pBVar1->boundX0,pBVar1->boundY0);
  this->scrollMenu->SetWidth(this->scrollMenu->boundX1 - this->scrollMenu->boundX0);
  this->scrollMenu->SetColor(200,0xb4,100,0xff);
  Utilities::SetScrollMenuColors(this->scrollMenu,200,0xb4,100,0xff,0x32,0x2d,0x19,0x3f,0x18);
  ((WSMSub*)this->scrollMenu->substruct)->vSpace = 4;
}

DiaMenuSub::~DiaMenuSub(){
  SuperMenuClasses::Free();
  if (PortraitBorder) PortraitBorder->borg8 = NULL;
  if (Background) Background->borg8 = NULL;
  if (Gradient) Gradient->borg8 = NULL;
  if (Portrait) Portrait->borg8 = NULL;
}


void DiaMenuSub::Init24(u8 param_2){
  bool bVar3;
  BaseWidget *pBVar4;
  
  this->Background = WidgetBorg8At(NULL,0,FULL_SCREENSPACE);
  bVar3 = false;
  if (((param_2 == 12) || (param_2 == 10)) || (param_2 == 11)) bVar3 = true;
  if (bVar3) {
    this->text = NULL;
    this->shadText = new WidgetShadowText(" ",0x200);
    SetWidgetBounds(this->shadText,64,30,256,205);
    Utilities::SetTextWidgetBoundsX(this->shadText,this->shadText->boundX0,this->shadText->boundX1);
    this->shadText->SetColor(COLOR_BROWN1);
    this->shadText->SetCoords(64,30);
    this->shadText->boundX0 = 64;
  }
  else {
    this->text = new WidgetText(" ",0x200);
    this->text->SetColor(COLOR_BROWN1);
    SetWidgetBounds(this->text,0x40,0x1e,0x100,0xcd);
    this->text->SetCoords(0x40,0x1e);
    this->text->boundX0 = 0x40;
    if (param_2 == 4) this->text->boundX1-=16;
    this->shadText = NULL;
  }
  this->scrollMenu = Utilities::AddScrollMenu(NULL,9,0x4b,0x37,0x4b,0x37,0x100,0xcd,COLOR_BROWN1,0);
  this->PortraitBorder = NULL;
  this->Portrait = NULL;
  this->Gradient = NULL;
  ((WSMSub*)this->scrollMenu->substruct)->vSpace = 4;
}

void DiaMenuSub::NOOP_8004e97c(void){}

DialougeClass::DialougeClass(WidgetHandler *h){
  this->handler = h;
  this->unk0 = 0;
  this->unk1C = 0;
  this->inst = NULL;
  this->unk20 = 0;
  this->menu = NULL;
  this->unkC = 0;
  this->borg_13_dat = NULL;
}

bool DialougeClass::StartDialoug(Borg13Data *b13,dialougeInstance *param_3,u8 param_4,u8 param_5){  
  this->borg_13_dat = b13;
  this->unkC = 0;
  if (b13) {
    this->type = param_4;
    this->unk1C = 0;
    this->unk20 = 0;
    this->inst = param_3;
    #if DEBUGVER
    Gsprintf("StartDialog\n");
    N64Print::Print(gGlobals.text);
    #endif
    FUN_800b6cb8(this->inst,this->borg_13_dat,0);
    if (this->inst) {
      if (this->inst->borg13End) return false;
      LoadMenuSubstruct(param_5);
      if (this->unk20 == 0) {
        if (this->unkC == 0) {
          this->unkC = 1;
          this->handler->AddWidget(this->menu);
        }
        Controller::GetDelay(0);
        return Setup();
      }
      this->unkC = 0;
    }
  }
  return false;
}

bool DialougeClass::m8004ea94(BaseWidget *w){
  bool bVar2;
  
  if (this->unk20 == 0) {
    bVar2 = false;
    if (this->inst) {
      ClearScrollMenu();
      if (this->unk1C == 0) {
        dialougeInstance *pdVar1 = this->inst;
        if (pdVar1->unk110 == -1) FUN_800b6cb8(pdVar1,this->borg_13_dat,(char)w->varU16);
        else FUN_800b6cb8(pdVar1,this->borg_13_dat,pdVar1->unk110);
      }
      if (this->inst == NULL) bVar2 = false;
      else {
        if ((this->unkC == 0) && (this->unk20 == 0)) {
          this->unkC = 1;
          this->handler->AddWidget(this->menu);
        }
        bVar2 = Setup();
      }
    }
  }
  else {
    bVar2 = false;
    if (gDebugFlag) { //Not excluded in retail. Oops!
      some_debug_func_3();
      bVar2 = false;
    }
  }
  return bVar2;
}


void DialougeClass::LoadMenuSubstruct(u8 param_2){
  
  this->menu = new WidgetMenu();
  this->menu->substruct = new DiaMenuSub(this->handler,this->type,param_2);
  if (true) {
    switch(this->type) {
    case 2:
    case 4:
      BigBGDialoug(param_2);
      return;
    }
  }
  DiaMenuSub* sub = (DiaMenuSub*)this->menu->substruct;
  this->menu->Link(sub->Background);
  this->menu->Link(sub->Gradient);
  this->menu->Link(sub->PortraitBorder);
  this->menu->Link(sub->Portrait);
  this->menu->Link(sub->text);
  this->menu->Link(sub->scrollMenu);
}

bool DialougeClass::Setup(){
  u8 bVar1;
  dialougeInstance *pdVar2;
  bool bVar5;
  s16 sVar6;
  u32 ind;
  char *c1;
  Borg8Header *image;
  ulong uVar7;
  BaseWidget *pBVar8;
  BaseWidget *entry;
  int iVar9;
  u16 uVar10;
  int iVar11;
  u16 uVar12;
  DiaMenuSub *sub;
  
  bVar5 = false;
  sub = (DiaMenuSub *)this->menu->substruct;
  if (this->inst->diags[1].next == 0xff) return false;
  sub->InitDefault(this->type);
  //case-switch? Needs untangled.
  if (this->type < 2) ;
  else {
    if (this->type != 3) {
      m8004f810();
      goto LAB_8004f0bc;
    }
  }
  if (this->unk1C == 0) {
    pdVar2 = this->inst;
    if ((pdVar2->diags[2].next != 0xff) && (pdVar2->diags[0].ent_ID == pdVar2->diags[1].ent_ID)) {
      bVar5 = true;
    }
    if (false) goto LAB_8004edd4; //??
    ind = gEntityDB->GetPortrait(this->inst->diags[0].ent_ID);
    char** cc= (char**)sub->text->substruct; //dirty hack to get substruct text
    strcpy(*cc,this->inst->diags[0].txt);
    if (gGlobals.DebugStatDisplay == 0) {
      look_for_dialouge_v_Num(*cc);
    }
    sub->text->varU16 = (u16)this->inst->diags[1].next;
  }
  else {
LAB_8004edd4:
    ind = gEntityDB->GetPortrait(IDEntInd(Alaron));
    strcpy(Utilities::GetWidgetText(sub->text)," ");
  }
  Utilities::SetBorg8Dims(sub->Portrait,SuperMenuClasses::Add(ind),false);
  uVar7 = sub->PortraitBorder->GetHeight();
  uVar12 = (s16)uVar7 + 0xb4;
  if (((this->inst->diags[2].next == 0xff) || (bVar5)) && (this->unk1C == 0)) {
LAB_8004ef58:
    pBVar8 = sub->text;
    pBVar8->boundY1 = uVar12 - 2;
    uVar7 = pBVar8->GetHeight();
    pBVar8 = sub->text;
    uVar10 = (pBVar8->boundY1 - uVar7) - 4;
    if (180 <= uVar10) uVar10 = 180;
    uVar12 = uVar10;
    pBVar8->boundY0 = (uVar10 + 4);
    pBVar8->SetCoords(pBVar8->boundX0,(uVar10 + 4));
    sub->text->SetColor(200,200,200,0xff);
    sub->PortraitBorder->SetCoords(0x14,sub->text->boundY0 - 4);
    sub->Portrait->SetCoords(0x1a,sub->PortraitBorder->posY + 6);
  }
  else {
    pBVar8 = sub->scrollMenu;
    pdVar2 = this->inst;
    uVar12 = sub->text->boundX0 + 10;
    pBVar8->posX = uVar12;
    pBVar8->boundX0 = uVar12;
    uVar12 = (s16)uVar7 + 0xb0;
    for(iVar11 = 1;this->inst->diags[iVar11+1].next != 0xff,iVar11 < 9;iVar11++) {
        entry = WText(this->inst->diags[iVar11].txt);
        bVar1 = this->inst->diags[iVar11+1].next;
        entry->varU8 = iVar11;
        entry->varU16 = bVar1;
        sub->scrollMenu->Append(entry);
    }
    sub->scrollMenu->Tick();
    pBVar8 = sub->scrollMenu;
    pBVar8->boundY1 = uVar12;
    uVar12 -= pBVar8->GetHeight();
    pBVar8 = sub->scrollMenu;
    pBVar8->boundY0 = uVar12;
    pBVar8->posY = uVar12;
    if (this->unk1C == 0) goto LAB_8004ef58;
  }
  sub->Background->boundY0 = uVar12;
  sub->Background->SetCoords(sub->Background->boundX0,uVar12);
  sub->Background->SetHeight(sub->Background->boundY1 - sub->Background->boundY0);
  sub->Gradient->SetCoords(sub->Background->posX,sub->Background->posY - sub->Gradient->GetHeight());
  sub->Gradient->SetWidth(sub->Background->GetWidth());
  if (bVar5) this->unk1C = 1;
  else this->unk1C = 0;
LAB_8004f0bc:
  this->menu->UpButtonFunc = Dialoug_UpButton;
  this->menu->DownButtonFunc = Dialoug_DownButton;
  this->menu->RightButtonFunc = Dialoug_RightButton;
  this->menu->LeftButtonFunc = Dialoug_LeftButton;
  this->menu->AButtonFunc = Dialoug_AButton;
  #if DEBUGVER
  if (gDebugFlag) this->menu->BButtonFunc = Dialoug_DebugEnd;
  #endif
  if (this->type == 4) this->menu->BButtonFunc = Dialoug_BButton;
  return true;
}

DialougeClass::~DialougeClass(){
  if (menu) {
    ClearScrollMenu();
    FreeWidgets();
  }
  delete this;
}

void DialougeClass::ClearScrollMenu(){
  Utilities::ClearScrollMenu2(((DiaMenuSub*)menu->substruct)->scrollMenu);
}

void DialougeClass::FreeWidgets(){
  if (this->menu) {
    DiaMenuSub * pDVar1 = (DiaMenuSub *)this->menu->substruct;
    if (pDVar1) pDVar1->~DiaMenuSub();
    handler->FreeWidget(this->menu);
    if (this->menu) this->menu->~WidgetMenu();
    this->menu = NULL;
    this->inst = NULL;
    this->unkC = 1;
  }
}

void DialougeClass::SetUnk20(){unk20=true;}

bool DialougeClass::m8004f264(){
  dialougeInstance *pdVar1;
  bool ret = false;
  if ((((this->unk20) && (pdVar1 = this->inst, pdVar1 != NULL)) &&
      (this->borg_13_dat != NULL)) && (ret = false, pdVar1->borg13End == 0)) {
    this->unk20 = false;
    ret = false;
    if (pdVar1->unk110 != -1) {
      FUN_800b6cb8(pdVar1,this->borg_13_dat,pdVar1->unk110);
      ret = false;
      if (((!this->unk20) && (pdVar1 = this->inst, pdVar1 != NULL)) &&
         (ret = false, pdVar1->borg13End == 0)) {
        if ((this->unkC == 0) && (pdVar1->unk110 == -1)) {
          this->unkC = 1;
          handler->AddWidget(this->menu);
        }
        ret = Setup();
      }
    }
  }
  return ret;
}


void DialougeClass::BigBGDialoug(u8 BG){
  u8 b1;
  Borg8Header *pBVar2;
  u8 g1;
  u32 ind;
  BaseWidget *pBVar3;
  u8 r1;
  WSTSub *pvVar4;
  DiaMenuSub *pvVar1;
  WSTSub *pvVar2;
  WSTSub *pvVar3;
  
  pvVar1 = (DiaMenuSub *)this->menu->substruct;
  switch(BG) {
  case 0:
  case 5:
  case 6:
  case 7:
  case 8:
    ind = BORG8_JournalBG;
    break;
  case 1:
    Utilities::SetBorg8Dims(pvVar1->Background,SuperMenuClasses::Add(BORG8_BGBookLeaf),false);
    pvVar1->text->SetColor(COLOR_GREENDARK);
    pvVar1->scrollMenu->SetColor(COLOR_GREENDARK);
    g1 = 99;
    r1 = 0xbd;
    b1 = 0xcd;
    goto LAB_8004f548;
  case 2:
    Utilities::SetBorg8Dims(pvVar1->Background,SuperMenuClasses::Add(BORG8_BGBook2),false);
    pvVar1->text->SetColor(0,0x29,0x44,0xff);
    pvVar1->scrollMenu->SetColor(0,0x29,0x44,0xff);
    g1 = 0xa2;
    r1 = 0xad;
    b1 = 0x33;
    goto LAB_8004f548;
  case 3:
    ind = BORG8_BGParchment;
    break;
  case 4:
    ind = BORG8_BGParchment2;
    break;
  case 9:
    ind = BORG8_BGParchment2;
    break;
  case 10:
    Utilities::SetBorg8Dims(pvVar1->Background,SuperMenuClasses::Add(0x3602),false);//spotlight
    pvVar1->shadText->SetColor(COLOR_BLACK2);
    pvVar1->scrollMenu->SetColor(COLOR_BLACK2);
    pvVar4 = (WSTSub *)pvVar1->shadText->substruct;
    pvVar4->XOff = 1;
    pvVar4->YOff = -1;
    (pvVar4->col).R = 0xd9;
    (pvVar4->col).G = 0xd1;
    (pvVar4->col).A = 0xb1;
    (pvVar4->col).B = 0xcc;
    Utilities::SetScrollMenuColors(pvVar1->scrollMenu,0xe,0,0x3d,0xff,0xfe,0xfe,0xde,0xff,0x14);
    pBVar3 = this->menu;
    goto LAB_8004f784;
  case 0xb:
    Utilities::SetBorg8Dims(pvVar1->Background,SuperMenuClasses::Add(BORG8_BGBluPlaque),false);
    pvVar1->shadText->SetColor(COLOR_BLACK);
    pvVar1->scrollMenu->SetColor(COLOR_BLACK);
    pvVar3 = (WSTSub *)pvVar1->shadText->substruct;
    pvVar3->XOff = 1;
    pvVar3->YOff = 1;
    (pvVar3->col).R = 0xe6;
    (pvVar3->col).G = 0xe1;
    (pvVar3->col).B = 0xdd;
    (pvVar3->col).A = 0xb1;
    Utilities::SetScrollMenuColors(pvVar1->scrollMenu,0x85,0xd,0xd,0xff,0xe2,0x90,0x3f,0xff,0x14);
    pBVar3 = this->menu;
    goto LAB_8004f784;
  case 0xc:
    Utilities::SetBorg8Dims(pvVar1->Background,SuperMenuClasses::Add(BORG8_BGPlaque),false);
    pvVar1->shadText->SetColor(0x41,0x1b,0,0xff);
    pvVar1->scrollMenu->SetColor(0x41,0x1b,0,0xff);
    pvVar2 = (WSTSub *)pvVar1->shadText->substruct;
    pvVar2->XOff = 1;
    pvVar2->YOff = 1;
    (pvVar2->col).G = 0xf2;
    (pvVar2->col).A = 0xcc;
    (pvVar2->col).B = 0xa6;
    g1 = 0x80;
    (pvVar2->col).R = 0xff;
    r1 = 0xdc;
    b1 = 0x1e;
LAB_8004f548:
    Utilities::SetScrollMenuColors(pvVar1->scrollMenu,0,0,0,0xff,r1,g1,b1,0xff,0x14);
    goto LAB_8004f784;
  default:
    Utilities::SetBorg8Dims(pvVar1->Background,SuperMenuClasses::Add(BORG8_JournalBG),false);
    goto LAB_8004f784;
  }
  Utilities::SetBorg8Dims(pvVar1->Background,SuperMenuClasses::Add(ind),false);
LAB_8004f784:
  this->menu->Link(pvVar1->Background);
  if (pvVar1->text == NULL) this->menu->Link(pvVar1->shadText);
  else this->menu->Link(pvVar1->text);
  this->menu->Link(pvVar1->scrollMenu);
}

void DialougeClass::m8004f810(){
  u8 bVar1;
  BaseWidget *pBVar2;
  BaseWidget *pBVar3;
  int iVar8;
  WSTSub *pvVar4;
  WSTSub *pvVar3;
  DiaMenuSub *pvVar2;
  s16 sVar6;
  
  pvVar2 = (DiaMenuSub *)this->menu->substruct;
  if ((this->inst->diags[2].next != 0xff)) {
    for(iVar8=1;(this->inst->diags[iVar8+2].next != 0xff) && (8 >= iVar8);iVar8++){
      if (pvVar2->text == NULL) {
        pBVar3 = new WidgetShadowText(this->inst->diags[iVar8].txt,400);
        pBVar3->varU8 = (u8)iVar8;
        pBVar3->varU16 = this->inst->diags[iVar8+1].next;
        pvVar2->scrollMenu->Append(pBVar3);
        pvVar3 = (WSTSub *)pvVar2->shadText->substruct;
        pvVar4 = (WSTSub *)pBVar3->substruct;
        pvVar4->XOff = pvVar3->XOff;
        pvVar4->YOff = pvVar3->YOff;
        (pvVar4->col).R = (pvVar3->col).R;
        (pvVar4->col).G = (pvVar3->col).G;
        (pvVar4->col).B = (pvVar3->col).B;
        (pvVar4->col).A = (pvVar3->col).A;
      }
      else {
        pBVar3 = WText(this->inst->diags[iVar8].txt);
        pBVar3->varU8 = iVar8;
        pBVar3->varU16 = this->inst->diags[iVar8+1].next;
        pvVar2->scrollMenu->Append(pBVar3);
      }
    }
  }
  if (pvVar2->text == NULL) {
    strcpy(Utilities::GetWidgetText(pvVar2->shadText),this->inst->diags[0].txt);
  }
  else {
    strcpy(Utilities::GetWidgetText(pvVar2->text),this->inst->diags[0].txt);
  }
  #if DEBUGVER //can toggle if "V####" is shown at start of text
  if (gGlobals.DebugStatDisplay == 0) {
    #endif
    if (pvVar2->text == NULL)
      look_for_dialouge_v_Num(Utilities::GetWidgetText(pvVar2->shadText));
    else
      look_for_dialouge_v_Num(Utilities::GetWidgetText(pvVar2->text));
  #if DEBUGVER
    }
    #endif
  if (pvVar2->text == NULL) {
    pBVar2 = pvVar2->shadText;
    pBVar2->varU16 = (u16)this->inst->diags[1].next;
    sVar6 = pBVar2->GetHeight();
    pBVar2 = pvVar2->shadText;
  }
  else {
    pBVar2->varU16 = (u16)this->inst->diags[1].next;
    sVar6 = pBVar2->GetHeight();
    pBVar2 = pvVar2->text;
  }
  pvVar2->scrollMenu->posY = pBVar2->posY + sVar6 + 4;
  return;
}

void ofunc_sub_dialouge(DialougeClass *param_1,Borg13Data *param_2){param_1->borg_13_dat = param_2;}

//Borg13 text starts with a "V####". This trims that out.
void look_for_dialouge_v_Num(char *param_1){
  char cVar1;
  bool bVar2;
  u32 len;
  char *pcVar3;
  u8 *pbVar4;
  int iVar5;
  int iVar6;
  char *pcVar7;
  int iVar8;
  
  bVar2 = false;
  len = strlen(param_1);
  iVar5 = 0;
  if (*param_1 == ' ') {
    for (iVar5 = 1; param_1[iVar5] == ' '; iVar5 += 1) {
    }
  }
  iVar8 = (len + 1) - iVar5;
  iVar6 = 0;
  if (0 < iVar8) {
    pcVar7 = param_1 + iVar5;
    do {
      cVar1 = *pcVar7;
      pcVar7 = pcVar7 + 1;
      pcVar3 = param_1 + iVar6;
      iVar6 += 1;
      *pcVar3 = cVar1;
    } while (iVar6 < iVar8);
  }
  if ((*param_1 == 'v') || (*param_1 == 'V')) {
    iVar5 = 1;
    pbVar4 = (u8 *)(param_1 + 1);
    do {
      if (9 < *pbVar4 - '0') {
        return;
      }
      iVar5 += 1;
      pbVar4 = (u8 *)(param_1 + iVar5);
    } while (iVar5 < 5);
    bVar2 = true;
  }
  iVar5 = len - 4;
  if ((bVar2) && (pcVar7 = param_1, 0 < iVar5)) {
    do {
      iVar5 += -1;
      *pcVar7 = pcVar7[5];
      pcVar7 = pcVar7 + 1;
    } while (iVar5 != 0);
  }
  iVar5 = 0;
  if (*param_1 == ' ') {
    for (iVar5 = 1; param_1[iVar5] == ' '; iVar5 += 1) {
    }
  }
  iVar8 = (len + 1) - iVar5;
  iVar6 = 0;
  if (0 < iVar8) {
    pcVar7 = param_1 + iVar5;
    do {
      cVar1 = *pcVar7;
      pcVar7 = pcVar7 + 1;
      pcVar3 = param_1 + iVar6;
      iVar6 += 1;
      *pcVar3 = cVar1;
    } while (iVar6 < iVar8);
  }
  return;
}