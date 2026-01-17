#include "widgets/WidgetChild6.h"
#include "globals.h"
#define FILENAME "./src/controllerpaksliders.cpp"

ControllerPakSliders::ControllerPakSliders(SaveDatPointers *dat,s16 *bounds,Color32 *color):WidgetSaveFile(){

  this->saveDat = dat;
  this->screenshotWidget = NULL;
  this->screenshotBorg8 = NULL;
  this->PlayerName = NULL;
  this->TimePlayed = NULL;
  this->isEntrySet = 0;
  this->PartyPortraits[0] = NULL;
  this->PartyPortraits[1] = NULL;
  this->PartyPortraits[2] = NULL;
  this->PartyPortraits[3] = NULL;
  this->unkBounds[0] = bounds[0];
  this->unkBounds[1] = bounds[1];
  this->unkBounds[2] = bounds[2];
  this->unkBounds[3] = bounds[3];
  this->childCol.R = color->R;
  this->childCol.G = color->G;
  this->childCol.B = color->B;
  this->childCol.A = color->A;
  this->arrows = NULL;
  SetWidgetBounds(this,this->unkBounds[0],this->unkBounds[1],this->unkBounds[2],this->unkBounds[3]);
  this->SetCoords(this->unkBounds[0],this->unkBounds[1]);
}

ControllerPakSliders::~ControllerPakSliders(){
    Free();
    WidgetMenu::~WidgetMenu();
}


Gfx * ControllerPakSliders::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  Gfx *pGVar1;
  
  if (this->isEntrySet == 0) {
    pGVar1 = WidgetMenu::Render(g,x0,y0,x1,y1);
  }
  else {
    this->screenshotWidget->borg8 = this->screenshotBorg8;
    pGVar1 = WidgetMenu::Render(g,x0,y0,x1,y1);
    this->screenshotWidget->borg8 = NULL;
  }
  return pGVar1;
}

void ControllerPakSliders::unk(){
  u32 BVar1;
  
  SetEntry();
  if (this->next == 0) {
    if (this->prev != 0) {
      SetArrow(BORG8_SliderArrowL,116,77);
    }
  }
  else {
    if (this->prev == 0) BVar1 = BORG8_SliderArrowR;
    else BVar1 = BORG8_SliderArrowLR;
    SetArrow(BVar1,116,77);
  }
}

void ControllerPakSliders::unk2(){}

WidgetBorg8 * ControllerPakSliders::GetPortrait(int param_2){
  WidgetBorg8*pBVar6;
  ItemID IVar1 = this->saveDat->savePartyHead->party[param_2];
  if (!IVar1) pBVar6 = NULL;
  else {
    s16 bx0 = this->boundX0;
    s16 by0 = this->boundY0;
    s16 portraitBounds [4] [4];
    portraitBounds[0][0] = bx0 + 6;
    portraitBounds[0][1] = by0 + 0x6d;
    portraitBounds[0][2] = bx0 + 0x2e;
    portraitBounds[0][3] = by0 + 0x95;
    portraitBounds[1][0] = bx0 + 0x3d;
    portraitBounds[1][2] = bx0 + 0x65;
    portraitBounds[2][0] = bx0 + 0x74;
    portraitBounds[2][2] = bx0 + 0x9c;
    portraitBounds[3][0] = bx0 + 0xab;
    portraitBounds[3][2] = bx0 + 0xd3;
    portraitBounds[1][1] = portraitBounds[0][1];
    portraitBounds[1][3] = portraitBounds[0][3];
    portraitBounds[2][1] = portraitBounds[0][1];
    portraitBounds[2][3] = portraitBounds[0][3];
    portraitBounds[3][1] = portraitBounds[0][1];
    portraitBounds[3][3] = portraitBounds[0][3];
    pBVar6 = WidgetB8Port(IVar1);
    pBVar6->SetWidth(40);
    pBVar6->SetHeight(40);
    SetWidgetBounds(pBVar6,portraitBounds[param_2][0],portraitBounds[param_2][1],portraitBounds[param_2][2],
                    portraitBounds[param_2][3]);
    pBVar6->SetCoords(portraitBounds[param_2][0],portraitBounds[param_2][1]);
    this->Link(pBVar6);
  }
  return pBVar6;
}


void ControllerPakSliders::SetEntry(){
  if (this->isEntrySet == 0) {
    ALLOC(this->screenshotBorg8,131);
    CLEAR(this->screenshotBorg8);
    (this->screenshotBorg8->dat).Width = 60;
    (this->screenshotBorg8->dat).Height = 32;
    (this->screenshotBorg8->dat).format = BORG8_RGBA16;
    (this->screenshotBorg8->dat).offset = this->saveDat->screenshot;
    this->screenshotWidget = WigetB8Blank;
    this->screenshotWidget->SetWidth(104);
    this->screenshotWidget->SetHeight(78);
    SetWidgetBounds(this->screenshotWidget,this->boundX0 + 6,
                    this->boundY0 + 0x1c,this->boundX1,this->boundY1);
    this->screenshotWidget->SetCoords(this->boundX0 + 6,this->boundY0 + 28);
    this->Link(this->screenshotWidget);
    this->PlayerName = Utilities::AddClipTextWidget(this,this->saveDat->savePartyHead->name,
                        this->boundX0 + 116,this->boundY0 + 87,this->boundX1,this->boundY1,256);
    this->PlayerName->SetColor((this->childCol).R,(this->childCol).G,(this->childCol).B,(this->childCol).A);
    u32 time = this->saveDat->savePartyHead->time;
    Gsprintf(Cstring(HoursXYZ),time / (HOURS(1)),
                (time % (HOURS(1))) / MINUTES(1),(time % MINUTES(1)) / SECONDS(1));
    this->TimePlayed = Utilities::AddClipTextWidget(this,gGlobals.text,this->boundX0 + 116,
                        this->boundY0 + 98,this->boundX1,this->boundY1,256);
    this->TimePlayed->SetColor((this->childCol).R,(this->childCol).G,(this->childCol).B,(this->childCol).A);
    this->PartyPortraits[0] = GetPortrait(0);
    this->PartyPortraits[1] = GetPortrait(1);
    this->PartyPortraits[2] = GetPortrait(2);
    this->PartyPortraits[3] = GetPortrait(3);
    this->isEntrySet = true;
  }
}

void ControllerPakSliders::Free(){
  if (this->isEntrySet) {
    FREE(this->screenshotBorg8,174);
    this->screenshotBorg8 = NULL;
    this->Unlink(this->screenshotWidget);
    if (this->screenshotWidget) this->screenshotWidget->~WidgetBorg8();
    this->screenshotWidget = NULL;
    this->Unlink(this->PlayerName);
    if (this->PlayerName) this->PlayerName->~WidgetClipText();
    this->PlayerName = NULL;
    this->Unlink(this->TimePlayed);
    if (this->TimePlayed) this->TimePlayed->~WidgetClipText();
    this->TimePlayed = NULL;
    if (this->PartyPortraits[0]) {
      this->Unlink(this->PartyPortraits[0]);
      FREEQB8(this->PartyPortraits[0]->borg8);
      if (this->PartyPortraits[0]) this->PartyPortraits[0]->~WidgetBorg8();
      this->PartyPortraits[0] = NULL;
    }
    if (this->PartyPortraits[1]) {
      this->Unlink(this->PartyPortraits[1]);
      FREEQB8(this->PartyPortraits[1]->borg8);
      if (this->PartyPortraits[1]) this->PartyPortraits[1]->~WidgetBorg8();
      this->PartyPortraits[1] = NULL;
    }
    if (this->PartyPortraits[2]) {
      this->Unlink(this->PartyPortraits[2]);
      FREEQB8(this->PartyPortraits[2]->borg8);
      if (this->PartyPortraits[2]) this->PartyPortraits[2]->~WidgetBorg8();
      this->PartyPortraits[2] = NULL;
    }
    if (this->PartyPortraits[3]) {
      this->Unlink(this->PartyPortraits[3]);
      FREEQB8(this->PartyPortraits[3]->borg8);
      if (this->PartyPortraits[3]) this->PartyPortraits[3]->~WidgetBorg8();
      this->PartyPortraits[0] = NULL; //copy-paste oversight?
    }
    if(this->arrows) {
      this->Unlink(this->arrows);
      free_borg8_widget(this->arrows);
      if (this->arrows) this->arrows->~WidgetBorg8();
      this->arrows = NULL;
    }
    this->isEntrySet = 0;
  }
}

void ControllerPakSliders::SetArrow(u32 index,s16 x,s16 y){
  if (this->arrows == NULL) {
    this->arrows = Utilities::AddBorg8Widget(this,loadBorg8(index),x + this->boundX0,y + this->boundY0);
    this->arrows->SetColor((this->childCol).R,(this->childCol).G,(this->childCol).B,(this->childCol).A);
    SetWidgetBounds(this->arrows,this->boundX0,this->boundY0,this->boundX1,this->boundY1);
  }
}

WidgetBlankFile::WidgetBlankFile(char *txt,u16 (*param_3) [4],Color32 *param_4,u16 param_5,u16 param_6):WidgetSaveFile(){

  this->clipTxt = NULL;
  this->str = txt;
  this->newBoundX0 = (*param_3)[0];
  this->newBoundY0 = (*param_3)[1];
  this->newBoundX1 = (*param_3)[2];
  this->newBoundY1 = (*param_3)[3];
  (this->col94).R = param_4->R;
  (this->col94).G = param_4->G;
  (this->col94).B = param_4->B;
  (this->col94).A = param_4->A;
  this->field10_0x98 = param_5;
  this->field11_0x9a = param_6;
  this->arrows = 0;
  SetWidgetBounds(this,this->newBoundX0,this->newBoundY0,this->newBoundX1,this->newBoundY1);
  this->SetCoords(this->newBoundX0,this->newBoundY0);
}


WidgetBlankFile::~WidgetBlankFile(){
  Free();
  WidgetMenu::~WidgetMenu();
}

void WidgetBlankFile::unk(){
  SetEntry();
  if (this->next == NULL) {
    if (this->prev != NULL) SetArrow(BORG8_SliderArrowL);
  }
  else if (this->prev == NULL)
    SetArrow(BORG8_SliderArrowR);
  else SetArrow(BORG8_SliderArrowLR);
}

void WidgetBlankFile::unk2(){
  if (this->next == NULL) {
    if (this->prev != NULL) SetArrow(BORG8_SliderArrowL);
  }
  else if (this->prev == NULL)
    SetArrow(BORG8_SliderArrowR);
  else SetArrow(BORG8_SliderArrowLR);
}

void WidgetBlankFile::SetEntry(){
  if ((this->clipTxt == NULL) && (this->str)) {
    this->clipTxt = Utilities::AddClipTextWidget(this,this->str,0,0,150,1000,strlen(this->str) + 1);;
    this->clipTxt->SetColor(this->col94.R,this->col94.G,this->col94.B,this->col94.A);
    this->clipTxt->Tick();
    s16 uVar9 = this->clipTxt->GetHeight();
    s16 uVar10 = this->clipTxt->GetWidth();
    s16 sVar12 = this->boundY0;
    s16 sVar11 = (s16)(((int)this->boundX1 - (int)this->boundX0) + 1 >> 1) -
             (s16)((int)(uVar10 + 1) >> 1);
    this->clipTxt->posX = this->field10_0x98 + this->boundX0 + sVar11;
    this->clipTxt->boundX0 = this->clipTxt->posX;
    sVar12 = this->field11_0x9a +
             this->boundY0 +
             ((s16)(((int)this->boundY1 - (int)this->boundY0) + 1 >> 1) - (s16)((int)(uVar9 + 1) >> 1));
    this->clipTxt->posY = sVar12;
    this->clipTxt->boundY0 = this->clipTxt->posY;
    this->clipTxt->boundX1 -= sVar11;
    Utilities::SetTextWidgetBoundsX(this->clipTxt,this->clipTxt->posX,this->clipTxt->boundX1);
  }

}

void WidgetBlankFile::Free(){
  if (this->clipTxt){
    this->Unlink(this->clipTxt);
    if (this->clipTxt) this->clipTxt->~BaseWidget();
    this->clipTxt = NULL;
  }
  if (this->arrows) {
    this->Unlink(this->arrows);
    free_borg8_widget(this->arrows);
    if (this->arrows) this->arrows->~WidgetBorg8();
    this->arrows = NULL;
  }
}

void WidgetBlankFile::SetArrow(u32 param_2){
  if (this->arrows == NULL) {
    this->arrows = Utilities::AddBorg8Widget(this,loadBorg8(param_2),0,0);
    this->arrows->SetColor(this->col94.R,this->col94.G,this->col94.B,this->col94.A);
    this->arrows->SetCoords(
               (this->clipTxt->posX + (this->clipTxt->GetWidth() >> 1)) - (this->arrows->GetWidth() >> 1),
               (this->clipTxt->posY - this->arrows->GetHeight()) + -2);
    SetWidgetBounds(this->arrows,this->arrows->posX,this->arrows->posY,
        this->arrows->posX + (s16)this->arrows->GetWidth(),
        this->arrows->posY + (s16)this->arrows->GetHeight());
  }
}