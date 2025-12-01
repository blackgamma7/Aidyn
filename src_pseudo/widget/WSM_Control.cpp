#include "widgets/WidgetScrollMenu.h"

BaseWidget* WSM_UpFunc(BaseWidget*w0,BaseWidget*w1){
    s16 sVar3;
    WSMSub* sub = (WSMSub *)w1->substruct;
    if ((sub->numChoices)){
       BaseWidget* entry = sub->items[(u16)sub->highlight];
       if(entry) {
        entry->SetColor((w1->col).R,(w1->col).G,(w1->col).B,(w1->col).A);
        sVar3 = sub->highlight;
        if (sVar3 == 0) sVar3 = sub->numChoices;
        sub->highlight = sVar3 + -1;
        sub->items[sub->highlight]->SetColor((sub->col).R,(sub->col).G,(sub->col).B,(sub->col).A);
       }
    }
    return NULL;
}

BaseWidget* WSM_DownFunc(BaseWidget* w0,BaseWidget* w1){
    s16 sVar3;
    WSMSub* sub = (WSMSub *)w1->substruct;
    if ((sub->numChoices)){
       BaseWidget* entry = sub->items[(u16)sub->highlight];
       if(entry) {
        entry->SetColor((w1->col).R,(w1->col).G,(w1->col).B,(w1->col).A);
        sub->highlight++;
        if (sub->highlight > sub->numChoices) sub->highlight = 0;
        sub->items[sub->highlight]->SetColor((sub->col).R,(sub->col).G,(sub->col).B,(sub->col).A);
       }
    }
    return NULL;
  }

  BaseWidget* WSM_LeftFunc(BaseWidget*w0,BaseWidget*w1){return NULL;}
  BaseWidget* WSM_RightFunc(BaseWidget*w0,BaseWidget*w1){return NULL;}
  BaseWidget* WSM_AFunc(BaseWidget*w0,BaseWidget*w1){
    WSMSub* sub = (WSMSub *)w1->substruct;
    if(sub->numChoices) return sub->items[sub->highlight];
    return NULL;
  }