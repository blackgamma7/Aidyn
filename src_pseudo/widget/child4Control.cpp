#include "globals.h"

//yeah, this class has a file break for the control methods

BaseWidget* WidgetChild4::UpFunc(){
    this->menus[this->menuIndex]->UpFunc();
    ShowEXPCosts();
    return NULL;
}

BaseWidget* WidgetChild4::DownFunc(){
    this->menus[this->menuIndex]->DownFunc();
    ShowEXPCosts();
    return NULL;
}

BaseWidget* WidgetChild4::LeftFunc(){
    m80038c60(0);
    return NULL;
}

BaseWidget* WidgetChild4::RightFunc(){
    m80038c60(1);
    return NULL;
}

BaseWidget* WidgetChild4::AFunc(){
    BaseWidget*w =this->menus[this->menuIndex]->AFunc();
    if((w)&&(gGlobals.SomeCase == 5))
    this->menus[this->menuIndex]->Confirm(w->var5E,0xff);
    return NULL;
}

BaseWidget* WidgetChild4::CDownFunc(){
    this->menus[this->menuIndex]->CDownFunc();
    return NULL;
}