#include "globals.h"

BaseWidget * WidgetMenuSpells::UpFunc() {
  this->SpellSkills[this->selected]->UpFunc();
  SetHighlight();
  GetPrices();
  return NULL;
}

BaseWidget * WidgetMenuSpells::DownFunc() {
  this->SpellSkills[this->selected]->DownFunc();
  SetHighlight();
  GetPrices();
  return NULL;
}

BaseWidget * WidgetMenuSpells::LeftFunc(){
    DHorizontal(0);
    return NULL;
}

BaseWidget * WidgetMenuSpells::RightFunc(){
    DHorizontal(1);
    return NULL;
}

BaseWidget * WidgetMenuSpells::AFunc() {
  pause_Substruct *ppVar3 = PauseSub;
  BaseWidget *uVar5 = this->SpellSkills[this->selected]->AFunc();
  if (uVar5) {
    BaseWidget *uVar6 = uVar5->AFunc();
    ppVar3->dollmenu->lists->menus[ppVar3->dollmenu->lists->menuIndex]->Confirm(
        uVar5->varU16,uVar6->varU16);
  }
  return NULL;
}

BaseWidget * WidgetMenuSpells::BFunc() {
  this->SpellSkills[this->selected]->CDownFunc();
  return NULL;
}



