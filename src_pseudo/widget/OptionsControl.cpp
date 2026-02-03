#include "globals.h"

BaseWidget* WidgetOptions_Left(BaseWidget* w0,BaseWidget* w1){
    return((WidgetOptionsSubstruct*)w1->substruct)->unk10->LeftFunc();
}

BaseWidget* WidgetOptions_Right(BaseWidget* w0,BaseWidget* w1){
    return((WidgetOptionsSubstruct*)w1->substruct)->unk10->RightFunc();
}

BaseWidget* WidgetOptions_Up(BaseWidget* w0,BaseWidget* w1){
    return((WidgetOptionsSubstruct*)w1->substruct)->unk10->UpFunc();
}

BaseWidget* WidgetOptions_Down(BaseWidget* w0,BaseWidget* w1){
    return((WidgetOptionsSubstruct*)w1->substruct)->unk10->DownFunc();
}


BaseWidget * WidgetOptions_BButton(BaseWidget *w0,BaseWidget *w1) {
  pause_Substruct *ppVar3;
  BaseWidget *uVar4;
  WidgetOptionsSubstruct *iVar2;
  
  iVar2 = (WidgetOptionsSubstruct *)w1->substruct;
  ppVar3 = PauseSub;
  uVar4 = iVar2->unk10->BFunc();
  switch(iVar2->selected){
    case 0:{
      freeWidgetFunc = NULL;
      return w1;
    }
    case 1:
    case 2:
    case 3:{
        if(uVar4)ppVar3->optionsMenu->MakeScrollList();
    }
    default: return NULL;
  }
}

BaseWidget * PauseMenuSelectCallback(BaseWidget *w0,BaseWidget *w1) {
  u8 bVar1;
  pause_Substruct *ppVar4;
  BaseWidget *pBVar5;
  WidgetOptionsSubstruct *iVar3;
  
  iVar3 = (WidgetOptionsSubstruct *)w1->substruct;
  ppVar4 = PauseSub;
  pBVar5 = iVar3->unk10->AFunc();
  switch (iVar3->selected){
    case 0:{
      pBVar5 = w1;
    switch(pBVar5->varU16){
        case OptionN_Config:{
            ppVar4->optionsMenu->InitConfigMenu();
            pBVar5 = NULL;
            break;
        }
        case OptionN_LoadGame:{
            ppVar4->optionsMenu->ContPakLoad();
            pBVar5 = NULL;
            break;
        }
        case OptionN_SaveGame:{
            ppVar4->optionsMenu->ContPakSave();
            pBVar5 = NULL;
            break;
        }
        case OptionN_Theatre:{
            ppVar4->optionsMenu->InitTheatreMenu();
            pBVar5 = NULL;
            break;
        }
        case OptionN_Flee:{
            gGlobals.combatBytes[1] = CombatState_20;
            break;
        }
        case OptionN_Help:{
            w1->varU16 = 3;
            break;
        }
        case OptionN_Credits:{
           gGlobals.creditsByte = 1;
           w1->varU16 = 5;
           break;
        }
        default:CRASH("pauseMenuSelectCallBack","Unknown pausemenu choice.");
    }
    break;
    }
    case 1:
    case 2:
    case 3:
    pBVar5=NULL; break;
    default:
    CRASH("pauseMenuSelectCallBack","Unknown pause menu state");
  }
  return pBVar5;
}


BaseWidget * WidgetOptions_StartButton(BaseWidget *w0,BaseWidget *w1) {
  BaseWidget *pBVar2;
  WidgetOptionsSubstruct *sub;
  pause_Substruct *pSub;
  
  sub = (WidgetOptionsSubstruct *)w1->substruct;
  pSub = PauseSub;
  if (sub->selected) {
    pBVar2 = sub->unk10->StartFunc();
    if (sub->selected == 1) {
      if (pBVar2 == NULL) return NULL;
    }
    else if (sub->selected != 2) {
      return pBVar2;
    }
    pSub->optionsMenu->MakeScrollList();
    w1 = NULL;
  }
  return w1;
}

