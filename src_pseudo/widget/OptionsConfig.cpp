#include "globals.h"

WidgetOptionsConfig::WidgetOptionsConfig(u8 fromPause):WidgetMenu() {InitMenu(fromPause);}

WidgetOptionsConfig::~WidgetOptionsConfig() {
  OptionsConfigSubstruct *sub = (OptionsConfigSubstruct *)this->substruct;
  DestructWidget(sub->nameEntry)
  delete sub;
  this->substruct = NULL;
  DestructWidget(this->SFXSlider)
  DestructWidget(this->BGMSlider)
  WidgetMenu::~WidgetMenu();
}

void WidgetOptionsConfig::InitMenu(u8 fromPause) {
  
  OptionsConfigSubstruct *sub = new OptionsConfigSubstruct;
  bool fromTitle = !fromPause;
  this->substruct = sub;
  if (fromTitle) {
    (sub->red1) = 0xe1;
    (sub->red0) = 0xe1;
    this->col.R = 0xe1;
    (sub->green1) = 0xe1;
    (sub->green0) = 0xe1;
    this->col.G = 0xe1;
    (sub->blue1) = 0xe1;
    (sub->blue0) = 0xe1;
    this->col.B = 0xe1;
    (sub->alpha0) = 0xff;
  }
  else {
    (sub->red0) = 0x82;
    this->col.R = 0x82;
    (sub->green0) = 0x50;
    this->col.G = 0x50;
    (sub->blue0) = 0x50;
    this->col.B = 0x50;
    (sub->red1) = 0x67;
    (sub->green1) = 0x46;
    (sub->blue1) = 60;
    (sub->alpha0) = 0xff;
  }
  sub->unk30 = 0;
  s16 currY = 40;
  sub->unk31 = 0;
  sub->unk32 = 1;
  sub->unk33 = 20;
  if (fromTitle) currY = 50;
  sub->selected = 0;
  sub->nameEntry = NULL;
  (sub->renameOpen) = 0;
  sub->TitleImage = WidgetB8(BORG8_TitleOptions);
  sub->TitleImage->SetCoords(SCREEN_CENTERW - (sub->TitleImage->GetWidth() >> 1),currY);
  this->Link(sub->TitleImage);
  this->SFXSlider = WidgetB8(BORG8_Spacer);
  this->BGMSlider = WidgetB8(BORG8_Spacer);
  this->BGMSlider->SetColor((sub->red0),(sub->green0),(sub->blue0),(sub->alpha0));
  this->SFXSlider->SetColor((sub->red0),(sub->green0),(sub->blue0),(sub->alpha0));
  currY+= sub->TitleImage->GetHeight() + 10;
  sub->AudioTitle = WClipTXT(gGlobals.CommonStrings[0xa3]);
  sub->AudioTitle->SetCoords(72,currY);
  sub->AudioTitle->SetColor((sub->red1),(sub->green1),(sub->blue1),(sub->alpha0));
  currY += sub->AudioTitle->GetHeight() + 4;
  sub->optionTitles[0] = WClipTXT(gGlobals.CommonStrings[0xa4]);
  sub->optionTitles[0]->SetCoords(88,currY);
  sub->optionTitles[0]->SetColor((sub->red0),(sub->green0),(sub->blue0),(sub->alpha0));
  currY += 4 + sub->optionTitles[0]->GetHeight() + this->SFXSlider->GetHeight();
  sub->optionTitles[1] = WClipTXT(gGlobals.CommonStrings[0xa5]);
  sub->optionTitles[1]->SetCoords(0x58,currY);
  sub->optionTitles[1]->SetColor((sub->red0),(sub->green0),(sub->blue0),(sub->alpha0));
  currY += 4 + sub->optionTitles[1]->GetHeight() + this->BGMSlider->GetHeight();
  sub->GraphicsTitle = WClipTXT(gGlobals.CommonStrings[0xa6]);
  sub->GraphicsTitle->SetCoords(0x48,currY);
  sub->GraphicsTitle->SetColor((sub->red1),(sub->green1),(sub->blue1),(sub->alpha0));
  currY += sub->GraphicsTitle->GetHeight() + 2;
  sub->optionTitles[2] = WClipTXT(res_mode_string[gGlobals.ResolutionSelect]);
  if (!gExpPakFlag) sub->optionTitles[2]->SetColor(0x60,0x60,0x60,0xff);
  else
    sub->optionTitles[2]->SetColor((sub->red0),(sub->green0),(sub->blue0),(sub->alpha0));
  sub->optionTitles[2]->SetCoords(0x58,currY);
  currY += sub->optionTitles[2]->GetHeight() + 4;
  if (fromTitle) {
    sub->GameTitle = NULL;
    sub->optionTitles[3] = NULL;
  }
  else {
    sub->GameTitle = WClipTXT(gGlobals.CommonStrings[0xaa]);
    sub->GameTitle->SetCoords(72,currY);
    sub->GameTitle->SetColor((sub->red1),(sub->green1),(sub->blue1),(sub->alpha0));
    sub->optionTitles[3] = WClipTXT(gGlobals.CommonStrings[0xab]);
    sub->optionTitles[3]->SetCoords(0x58,currY+sub->GameTitle->GetHeight()+2);
    sub->optionTitles[3]->SetColor((sub->red0),(sub->green0),(sub->blue0),(sub->alpha0));
  }
  this->LeftButtonFunc = options_func_Left;
  this->RightButtonFunc = options_func_Right;
  this->UpButtonFunc = options_func_Up;
  this->DownButtonFunc = options_func_Down;
  this->AButtonFunc = options_func_AButton;
  this->BButtonFunc = options_func_BButton;
  this->StartButtonFunc = options_func_StartButton;
  this->Link(sub->AudioTitle);
  if (sub->GameTitle) this->Link(sub->GameTitle);
  this->Link(sub->GraphicsTitle);
  for(u8 i=0;i<4;i++){
    if (sub->optionTitles[i]) this->Link(sub->optionTitles[i]);
  }
  Controller::GetDelay(0);
}

Gfx * WidgetOptionsConfig::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1) {
  u8 bVar1;
  u8 bVar2;
  u8 bVar3;
  s16 sVar4;
  s16 tempBX1;
  OptionsConfigSubstruct *sub;
  
  sub = (OptionsConfigSubstruct *)this->substruct;
  if (sub->nameEntry) {
    Utilities::MoveWidget2(sub->nameEntry,this->posX,this->posY);
    g = sub->nameEntry->Render(g,x0,y0,x1,y1);
  }
  (this->SFXSlider->col).A = this->col.A;
  this->SFXSlider->SetCoords(sub->optionTitles[0]->posY,(sub->optionTitles[0]->posY + sub->optionTitles[0]->GetHeight()));
  this->SFXSlider->SetColor(100,100,100,(this->col.A >> 2));
  g = this->SFXSlider->Render(g,x0,y0,x1,y1);
  tempBX1 = this->SFXSlider->boundX1;
  this->SFXSlider->boundX1 = this->SFXSlider->posX + (this->SFXSlider->GetWidth()*gGlobals.VolSFX);
  this->SFXSlider->SetColor((sub->red0),(sub->green0),(sub->blue0),this->col.A);
  g = this->SFXSlider->Render(g,x0,y0,x1,y1);
  this->SFXSlider->boundX1 = tempBX1;
  (this->BGMSlider->col).A = this->col.A;
  this->BGMSlider->SetCoords(sub->optionTitles[1]->posX,sub->optionTitles[1]->posY+sub->optionTitles[1]->GetHeight());
  this->BGMSlider->SetColor(100,100,100,(this->col.A >> 2));
  g = this->BGMSlider->Render(g,x0,y0,x1,y1);
  tempBX1 = this->BGMSlider->boundX1;
  this->BGMSlider->boundX1 = this->BGMSlider->posX + (this->BGMSlider->GetWidth()*gGlobals.VolBGM);
  this->BGMSlider->SetColor((sub->red0),(sub->green0),(sub->blue0),this->col.A);
  g = this->BGMSlider->Render(g,x0,y0,x1,y1);
  this->BGMSlider->boundX1 = tempBX1;
  this->col.R =(sub->red0) + (((u32)(sub->red1) - (u32)(sub->red0)) / (int)sub->unk33) *
               sub->unk31;
  this->col.G =(sub->green0) + (((u32)(sub->green1) - (u32)(sub->green0)) / (int)sub->unk33) *
               sub->unk31;
  this->col.B =(sub->blue0) + (((u32)(sub->blue1) - (u32)(sub->blue0)) / (int)sub->unk33) *
               sub->unk31;
  bVar1 = sub->unk33;
  u32 uVar14 = (sub->alpha0);
  bVar2 = sub->unk31;
  u32 uVar13 = bVar2 + sub->unk32;
  sub->unk31 = uVar13;
  uVar13 = uVar13 & 0xff;
  if ((uVar13 == 0) || (uVar13 == bVar1)) {sub->unk32 = -sub->unk32;}
  sub->optionTitles[sub->selected]->SetColor(this->col.R,
             this->col.G,this->col.B,
             (uVar14 + ((int)(sub->unk30 - uVar14) / (int)(u32)bVar1) * (u32)bVar2 & 0xff) *
             (this->col.A / 0xff));
  RENDERCHILDREN();
}

 u8 WidgetOptionsConfig::Tick() {
  u8 uVar1;
  BaseWidget *pBVar2;
  u8 bVar3;
  u8 bVar5;
  OptionsConfigSubstruct *sub;
  
  sub = (OptionsConfigSubstruct *)this->substruct;
  if (sub->nameEntry) sub->nameEntry->Tick();
  if ((sub->renameOpen) == 0) {
    if (sub->nameEntry){
      bVar3 = (sub->nameEntry->col).A;
      if ((sub->nameEntry->col).A <= 60) {
        if ((sub->nameEntry->col).A == 0) {
            this->Unlink(sub->nameEntry);
          if (sub->nameEntry) sub->nameEntry->~InputMenu();
          sub->nameEntry = NULL;
        }
        else {
          (sub->nameEntry->col).A = 0;
          Utilities::SetAlpha(sub->nameEntry,0);
        }
      }
      else {
        (sub->nameEntry->col).A -= 60;
        Utilities::SetAlpha(sub->nameEntry,(sub->nameEntry->col).A);
      }
    }
    bVar3 = (this->col).A + 60;
    if (0xc2 < bVar5) {
      (this->col).A = 0xff;
      Utilities::SetAlpha(this,0xff);
      goto LAB_80049914;
    }
  }
  else {
    bVar3 = (sub->nameEntry->col).A;
    if (bVar3 < 0xc3) {
      (sub->nameEntry->col).A = bVar3 + 60;
      Utilities::SetAlpha(sub->nameEntry,(sub->nameEntry->col).A);
    }
    else {
      (sub->nameEntry->col).A = 0xff;
      Utilities::SetAlpha(sub->nameEntry,(sub->nameEntry->col).A);
    }
    bVar3 = (this->col).A;
    if (bVar3 < 0x3d) {
      (this->col).A = 0;
      Utilities::SetAlpha(this,0);
      goto LAB_80049914;
    }
    bVar3-= 60;
  }
  (this->col).A = bVar3;
  Utilities::SetAlpha(this,bVar3);
LAB_80049914:
  return this->TickChildren();
}

u32 WidgetOptionsConfig::GetNumber(){return WidgetN_Other;}