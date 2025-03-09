#include "widgets/WidgetCombatTextbox.h"
#include "combat/CombatStruct.h"

void CombatTextboxWidget_Init(void){
  if (!gWidgetCombatTextboxP) {
    gWidgetCombatTextboxP =  new WidgetCombatTextbox();
    gCombatTextboxSpeaker=0;
  }
}

void CombatTextboxWidget_Free(void){
  if (gWidgetCombatTextboxP) {
    gWidgetCombatTextboxP->~WidgetCombatTextbox();
    gWidgetCombatTextboxP = NULL;
    gCombatTextboxSpeaker=0;
  }
}

Gfx * CombatTextboxWidget_Tick(Gfx *g,u8 delta){
  CharSheet *pCVar2;
  
  if (((gWidgetCombatTextboxP) && (gCombatP->current_Ent)) &&
     (pCVar2 = gCombatP->current_Ent->charSheetP, pCVar2 != NULL)) {
    ItemID IVar1 = pCVar2->ID;
    if (IVar1 != gCombatTextboxSpeaker) {
      gCombatTextboxSpeaker = IVar1;
      gWidgetCombatTextboxP->SetPortrait(gEntityDB->GetPortrait(IVar1));
    }
    for (s8 cVar5 = delta - 1; cVar5 != -1; cVar5--)
      gWidgetCombatTextboxP->Tick();
    g = gWidgetCombatTextboxP->Render(g,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
  }
  return g;
}

void CombatTextboxWidget_SetText(char *txt){gWidgetCombatTextboxP->SetText(txt);}

void CombatTextboxWidget_Lock(ItemID param_1){
  gWidgetCombatTextboxP->SetPortrait(gEntityDB->GetPortrait(param_1));
  gWidgetCombatTextboxP->Lock();
}

WidgetCombatTextbox::WidgetCombatTextbox():
  WidgetCinematicText({0,180,246,240},76,10,{OFFWHITE2},0){

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