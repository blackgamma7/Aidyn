#include "gamestateCheats.h"
#include "stringN64.h"


WidgetGameStateCheats * gamestste_cheats(void){
    freeWidgetFunc = FUN_8003316c;
    return new WidgetGameStateCheats();
}

u8 gamestate_cheat_check1(u8 param_1){
  return (gamestate_cheats1 & bitfeild_array[param_1]) != 0;
}

u8 gamestate_cheat_check2(GameState_Cheat param_1){
  return (gamestate_cheats2 & bitfeild_array[param_1]) != 0;
}

void FUN_8003316c(WidgetGameStateCheats *param_1){
  if (param_1) param_1->~WidgetGameStateCheats();
  freeWidgetFunc = NULL;
}

WidgetGameStateCheats::WidgetGameStateCheats():WidgetMenu(){
  WidgetHandler::AddWidget(gGlobals.widgetHandler,this);
  WidgetBorg8At(this,435,0x14,0x14,300,0xdc);
  ScrollA = widgetscrollmenu_init_2(this,0xc,0x14,0x14,0x14,0x14,200,200,0xff,0xff,0xff,0xff,0);
  ScrollC = widgetscrollmenu_init_2(this,0xc,0xdc,0x14,0xdc,0x14,0x104,200,0xff,0xff,0xff,0xff,0);
  ScrollB = widgetscrollmenu_init_2(this,0xc,0x10e,0x14,0x10e,0x14,0x140,200,0xff,0xff,0xff,0xff,0);
  for(u8 i=0;i<12;i++) {
    char* txt;
    ScrollA->Append(new WidgetText(debug_state_labels[i],400));
    txt = on_off_labels[0];
    if ((bitfeild_array[i] & gamestate_cheats1) != 0) txt = on_off_labels[1];
    ScrollC->Append(new WidgetText(txt,400));
    txt = bool_labels[0];
    if ((bitfeild_array[i] & gamestate_cheats2) != 0) txt = bool_labels[1];
    ScrollB->Append(new WidgetText(txt,400));
  }
}

WidgetGameStateCheats::~WidgetGameStateCheats(){
  WidgetHandler::FreeWidget(gGlobals.widgetHandler,this);
}

BaseWidget* WidgetGameStateCheats::AFunc(){
  byte bVar1;
  char *pcVar2;
  char **ppcVar3;
  WidgetScrollMenuSubstruct *pvVar1;
  
  pvVar1 = (WidgetScrollMenuSubstruct *)this->ScrollC->substruct;
  bVar1 = *(byte *)((int)&pvVar1->field17_0x1e + 1);
  gamestate_cheats1 ^= bitfeild_array[bVar1];
  pcVar2 = Utilities::GetWidgetText(pvVar1->items[bVar1]);
  ppcVar3 = on_off_labels;
  if ((bitfeild_array[bVar1] & gamestate_cheats1) != 0) {
    ppcVar3 = on_off_labels + 1;
  }
  sprintf(pcVar2,*ppcVar3);
  return NULL;
}

BaseWidget* WidgetGameStateCheats::ZFunc(){
  byte bVar1;
  char *pcVar2;
  char **ppcVar3;
  WidgetScrollMenuSubstruct *pvVar1;
  
  pvVar1 = (WidgetScrollMenuSubstruct *)this->ScrollB->substruct;
  bVar1 = *(byte *)((int)&pvVar1->field17_0x1e + 1);
  gamestate_cheats2 ^= bitfeild_array[bVar1];
  pcVar2 = Utilities::GetWidgetText(pvVar1->items[bVar1]);
  ppcVar3 = bool_labels;
  if ((bitfeild_array[bVar1] & gamestate_cheats2) != 0) {
    ppcVar3 = bool_labels + 1;
  }
  sprintf(pcVar2,*ppcVar3);
  return NULL;
}
BaseWidget* WidgetGameStateCheats::BFunc(){return this;}

BaseWidget* WidgetGameStateCheats::UpFunc(){  
  ScrollA->UpFunc();
  ScrollC->UpFunc();
  ScrollB->UpFunc();
  return NULL;
}

BaseWidget* WidgetGameStateCheats::DownFunc(){  
  ScrollA->DownFunc();
  ScrollC->DownFunc();
  ScrollB->DownFunc();
  return NULL;
}