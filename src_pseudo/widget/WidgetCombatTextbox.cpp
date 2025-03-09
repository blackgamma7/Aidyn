#include "widgets/WidgetCombatTextbox.h"

WidgetCombatTextbox::WidgetCombatTextbox():
  WidgetCinematicText({0,180,246,240},76,10,{OFFWHITE2},0){
  Borg8header *pBVar1;
  BaseWidget *pBVar2;
  

  this->locked = false;
  this->portraitBG = Utilities::AddBorg8Widget(this,loadBorg8(BORG8_PortraitHighlight),0x14,0xae);
  this->speakerPortrait = new WidgetBorg8(NULL);
  this->speakerPortrait->SetCoords(0x1a,0xb4);
  this->Link(this->speakerPortrait);
  this->speakerId = 0;
}

WidgetCombatTextbox::~WidgetCombatTextbox(){
  free_borg8_widget(portraitBG);
  free_borg8_widget(speakerPortrait);
  WidgetCinematicText::~WidgetCinematicText();
}

void WidgetCombatTextbox::SetPortrait(u32 param_2){  
  if ((!locked) && (param_2 != speakerId)) {
    speakerId = param_2;
    free_borg8_widget(speakerPortrait);
    Borg8header *pBVar2 = loadBorg8(param_2);
    speakerPortrait->borg8 = pBVar2;
    speakerPortrait->SetWidth(pBVar2->dat.Width);
    speakerPortrait->SetHeight(pBVar2->dat.Height);
  }
}

void WidgetCombatTextbox::SetText(char *txt){
  if (!locked) WidgetCinematicText::SetText(txt);
}
void WidgetCombatTextbox::Lock(){locked=true;}