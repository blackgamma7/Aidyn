#include "gamestateCheats.h"
#include "globals.h"
#include "widgets/Utilities.h"

void gamestste_cheats(void){
    freeWidgetFunc = FUN_8003316c;
    //constructor adds object to handler,and destructor removes it.
    //SHOULD be no need for return.
    new WidgetGameStateCheats(); 
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
  WHANDLE->AddWidget(this);
  WidgetBorg8At(this,435,0x14,0x14,300,0xdc);
  ScrollA = Utilities::AddScrollMenu(this,0xc,0x14,0x14,0x14,0x14,200,200,COLOR_WHITE,0);
  ScrollC = Utilities::AddScrollMenu(this,0xc,0xdc,0x14,0xdc,0x14,0x104,200,COLOR_WHITE,0);
  ScrollB = Utilities::AddScrollMenu(this,0xc,0x10e,0x14,0x10e,0x14,SCREEN_WIDTH,200,COLOR_WHITE,0);
  for(u8 i=0;i<12;i++) {
    char* txt;
    ScrollA->Append(WText(debug_state_labels[i]));
    txt = on_off_labels[0];
    if ((bitfeild_array[i] & gamestate_cheats1) != 0) txt = on_off_labels[1];
    ScrollC->Append(WText(txt));
    txt = bool_labels[0];
    if ((bitfeild_array[i] & gamestate_cheats2) != 0) txt = bool_labels[1];
    ScrollB->Append(WText(txt));
  }
}

WidgetGameStateCheats::~WidgetGameStateCheats(){
  WHANDLE->FreeWidget(this);
  WidgetMenu::~WidgetMenu();
}

BaseWidget* WidgetGameStateCheats::AFunc(){
  u8 bVar1;
  char *pcVar2;
  char **ppcVar3;
  WSMSub *pvVar1;
  
  pvVar1 = (WSMSub *)this->ScrollC->substruct;
  bVar1 = (u8)pvVar1->highlight;
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
  u8 bVar1;
  char *pcVar2;
  char **ppcVar3;
  WSMSub *pvVar1;
  
  pvVar1 = (WSMSub *)this->ScrollB->substruct;
  bVar1 = (u8)pvVar1->highlight;
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