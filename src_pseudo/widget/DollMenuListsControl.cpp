#include "globals.h"

//yeah, this class has a file break for the control methods

BaseWidget* DollMenuLists::UpFunc(){
    this->menus[this->menuIndex]->UpFunc();
    ShowEXPCosts();
    return NULL;
}

BaseWidget* DollMenuLists::DownFunc(){
    this->menus[this->menuIndex]->DownFunc();
    ShowEXPCosts();
    return NULL;
}

BaseWidget* DollMenuLists::LeftFunc(){
    LRToggle(0);
    return NULL;
}

BaseWidget* DollMenuLists::RightFunc(){
    LRToggle(1);
    return NULL;
}

BaseWidget* DollMenuLists::AFunc(){
    BaseWidget*w =this->menus[this->menuIndex]->AFunc();
    if((w)&&(gGlobals.SomeCase == 5))
    this->menus[this->menuIndex]->Confirm(w->var5E,0xff);
    return NULL;
}

BaseWidget* DollMenuLists::CDownFunc(){
    this->menus[this->menuIndex]->CDownFunc();
    return NULL;
}