#include "globals.h"

BaseWidget* Dialoug_UpButton(BaseWidget*A,BaseWidget*B){
    WidgetScrollMenu * scroll= ((DiaMenuSub *)B->substruct)->scrollMenu;
    if((!scroll)||(!((WSMSub*)scroll->substruct)->numChoices))return NULL;
    return scroll->UpFunc();
}

BaseWidget* Dialoug_DownButton(BaseWidget*A,BaseWidget*B){
    WidgetScrollMenu * scroll= ((DiaMenuSub *)B->substruct)->scrollMenu;
    if((!scroll)||(!((WSMSub*)scroll->substruct)->numChoices))return NULL;
    return scroll->DownFunc();
}


BaseWidget * Dialog_AButton(BaseWidget*A,BaseWidget *param_2){
  DiaMenuSub *sub = (DiaMenuSub *)param_2->substruct;
  BaseWidget *pBVar2 = sub->text;
  if (!pBVar2)  pBVar2 = sub->shadText;
  WidgetScrollMenu * scroll = sub->scrollMenu;
  if ((scroll) && (((WSMSub*)scroll->substruct)->numChoices)) {
    pBVar2 = scroll->AFunc();
  }
  return pBVar2;
}
#if DEBUGVER
//in debug version press B to prematurley end the dialoug.
BaseWidget * Dialoug_DebugEnd(BaseWidget*A,BaseWidget*B){
  DialogCallbackC((gGlobals.diaClass)->inst,borg_13_pointer->dat,B13Com_EndDialoug,0);
  return NULL;
}
#endif

BaseWidget * Dialog_BButton(BaseWidget *param_1,BaseWidget *param_2){
  BaseWidget *wRet;
  
  DiaMenuSub *sub = (DiaMenuSub *)param_2->substruct;
  wRet = sub->text;
  if (wRet == NULL) wRet = sub->shadText;
  if (sub->scrollMenu) {
    WSMSub *pvVar3 = (WSMSub *)sub->scrollMenu->substruct;
    if (pvVar3->numChoices) {
      return pvVar3->items[pvVar3->numChoices - 1];
    }
    return wRet;
  }
  return wRet;
}

