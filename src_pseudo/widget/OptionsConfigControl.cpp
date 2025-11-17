#include "globals.h"

void selectResMode(u8 x) {
  if ((x != gGlobals.ResolutionSelect) && ((x == 0 || (gExpPakFlag)))) {
    gGlobals.ResolutionSelect = x;
    Graphics::SetGfxMode(res_colormode[x].Hres,res_colormode[x].Vres,res_colormode[x].colorDepth);
  }
}

void FUN_800499b8(BaseWidget *w) {
    ((OptionsConfigSubstruct*)w->substruct)->renameOpen = 0;}


u8 Options_RenameMenu(BaseWidget *w) {
  OptionsConfigSubstruct *sub = (OptionsConfigSubstruct *)w->substruct;
  (sub->renameOpen) = 1;
  if (sub->nameEntry == NULL) {
    sub->nameEntry = new InputMenu(PARTY->Members[0]->name);
    Utilities::MoveWidget2(sub->nameEntry,w->posX,w->posY);
  }
  else sub->nameEntry->SetCurrentName(PARTY->Members[0]->name);
  Utilities::SetAlpha(sub->nameEntry,0);
  return sub->nameEntry->Tick();
}

BaseWidget * options_func_Left(BaseWidget *w0,BaseWidget *w1) {
  byte bVar3;
  OptionsConfigSubstruct *sub = (OptionsConfigSubstruct *)w1->substruct;
  if ((sub->renameOpen)) return sub->nameEntry->LeftFunc();
  switch(sub->selected){
    case 0:{
      if (0.01f < gGlobals.VolSFX) gGlobals.VolSFX-=0.01f;
      else gGlobals.VolSFX = 0.0;
      break;
    }
    case 1:{
      if (0.01f < gGlobals.VolBGM) gGlobals.VolBGM-=0.01f;
      else gGlobals.VolBGM = 0.0;
      break;
    }
    case 2:{
    if ((gGlobals.ResolutionSelect != 0) &&
       (bVar3 = gGlobals.ResolutionSelect - 1, gExpPakFlag != 0)) {
      Utilities::ChangeWidgetText(sub->optionTitles[2],res_mode_string[bVar3],true);
      selectResMode(bVar3);
      PlayAudioSound(&gGlobals.SFXStruct,BORG12_CursorChirp,0,1.0,0x1e,0);
    }
    break;
    }
  }
  return NULL;
}

BaseWidget * options_func_Right(BaseWidget *w0,BaseWidget *w1) {
  byte bVar3;
  OptionsConfigSubstruct *sub = (OptionsConfigSubstruct *)w1->substruct;
  if ((sub->renameOpen)) return sub->nameEntry->RightFunc();
  switch(sub->selected){
    case 0:{
      if (0.99f > gGlobals.VolSFX) gGlobals.VolSFX+=0.01f;
      else gGlobals.VolSFX = 1.0;
      break;
    }
    case 1:{
      if (0.99f > gGlobals.VolBGM) gGlobals.VolBGM+=0.01f;
      else gGlobals.VolBGM = 1.0;
      break;
    }
    case 2:{
    if ((gGlobals.ResolutionSelect == 0) &&(gExpPakFlag)) {
      Utilities::ChangeWidgetText(sub->optionTitles[2],res_mode_string[1],true);
      selectResMode(1);
      PlayAudioSound(&gGlobals.SFXStruct,BORG12_CursorChirp,0,1.0,0x1e,0);
    }
    break;
    }
  }
  return NULL;
}


BaseWidget * options_func_Up(BaseWidget *w0,BaseWidget *w1) {
  u8 uVar1;
  u8 uVar4;
  OptionsConfigSubstruct *sub = (OptionsConfigSubstruct *)w1->substruct;
  if((sub->renameOpen)) return sub->nameEntry->UpFunc();
  else {
    if (sub->selected != 0) {
      sub->optionTitles[sub->selected]->SetColor((sub->red0),(sub->green0),(sub->blue0),(w1->col).A);
      uVar1 = sub->selected;
      uVar4 = uVar1 - 1;
      sub->selected = uVar4;
      if ((uVar4 == 2) && (gExpPakFlag == 0)) {
        sub->selected = uVar1 - 2;
      }
    }
  }
  return NULL;
}

BaseWidget * options_func_Down(BaseWidget* w0,BaseWidget *w1) {
  OptionsConfigSubstruct *sub = (OptionsConfigSubstruct *)w1->substruct;
  if((sub->renameOpen)) return sub->nameEntry->DownFunc();
  else {
    if (sub->selected < 3) {
      sub->optionTitles[sub->selected]->SetColor((sub->red0),(sub->green0),(sub->blue0),(w1->col).A);
      if (sub->optionTitles[sub->selected + 1]) sub->selected++;
      if ((sub->selected == 2) && (gExpPakFlag == 0)) {
        if (sub->optionTitles[sub->selected + 1] == NULL) {
          sub->selected--;
        }
        else sub->selected++;
      }
    }
  }
  return NULL;
}

BaseWidget * options_func_BButton(BaseWidget* w0,BaseWidget *w1){
  if(((OptionsConfigSubstruct*)w1->substruct)->renameOpen){
    if(((OptionsConfigSubstruct*)w1->substruct)->nameEntry->BFunc())
      FUN_800499b8(w1);
    return NULL;
  }
  else{
    w1->varU16=0;
    return w1;
  }
}

BaseWidget * options_func_AButton(BaseWidget *w0,BaseWidget *w1) {
  OptionsConfigSubstruct *sub = (OptionsConfigSubstruct *)w1->substruct;
  if ((sub->renameOpen) == 0) {
    if (sub->selected == 3) Options_RenameMenu(w1);
  }
  else {
    if (sub->nameEntry->AFunc()) FUN_800499b8(w1);
  }
  return NULL;
}

BaseWidget * options_func_StartButton(BaseWidget *w0,BaseWidget *w1) {
  OptionsConfigSubstruct *sub = (OptionsConfigSubstruct *)w1->substruct;
  if((sub->renameOpen)){
    if (sub->nameEntry->StartFunc()) FUN_800499b8(w1);
  }
  return NULL;
}

