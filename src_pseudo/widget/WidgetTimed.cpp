#include "widgets/ContPakData.h"


WidgetTimed::WidgetTimed(u32 t, buttonFunc param_3):WidgetMenu() {
  this->AButtonFunc = param_3;
  this->timer = t;
}

WidgetTimed::~WidgetTimed() {
  this->AFunc();
  WidgetMenu::~WidgetMenu();
}

u8 WidgetTimed::Tick() {  
  if (this->timer == 0) {
    this->SetState(WidgetS_Closing);
  }
  else this->timer--;
  return WidgetMenu::Tick();
}

BaseWidget* WidgetTimed::Control(controller_aidyn* cont){return NULL;}

