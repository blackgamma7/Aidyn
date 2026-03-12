#include "widgets/WidgetCrafting.h"
#include "widgets/ItemDetails.h"
#include "widgets/textPopup.h"
#include "globals.h"


BaseWidget * WidgetCrafting_ClosePopup(BaseWidget *param_1,BaseWidget *param_2) {
  BaseWidget *w = (BaseWidget *)param_2->substruct;
  w->BFunc();
  param_2->SetState(WidgetS_Closing);
  return NULL;
}

WidgetCrafting::WidgetCrafting(u32 param_2):WidgetMenu() {
  this->scrollMenu = NULL;
  WidgetMenuPopup(this);
}

u8 WidgetCrafting::Tick(){
    SlimFont;
    u8 ret=BaseWidget::TickChildren();
    NormalFont;
    return ret;
}

Gfx * WidgetCrafting::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1) {
  SlimFont;
  Gfx*pGVar1 = BaseWidget::RenderChildren(g,x0,y0,x1,y1);
  NormalFont;
  return pGVar1;
}

BaseWidget * WidgetCrafting::BFunc() {
  PlayAudioSound(&gGlobals.SFXStruct,0x074e,0,1.0,0x3c,0);
  BaseWidget::SetState(5);
  return NULL;
}

BaseWidget * WidgetCrafting::UpFunc(){
    if(this->scrollMenu)
     this->scrollMenu->UpFunc();
    return NULL;
}

BaseWidget * WidgetCrafting::DownFunc(){
    if(this->scrollMenu)
     this->scrollMenu->DownFunc();
    return NULL;
}

void WidgetCrafting::TextPopup(char *txt) {
  pause_Substruct *ppVar1;
  WidgetDollMenu *pWVar2;
  u16 uVar7;
  BaseWidget *pBVar8;
  
  if (Font::GetWidth(gGlobals.font,txt) < 0x97)
    uVar7 = Font::GetWidth(gGlobals.font,txt);
  else uVar7 = 0x96;
  pBVar8 = TextPopup_New(txt,uVar7 + 0x10,
     Font::GetHeight(gGlobals.font,txt,0,uVar7) + 10,COLOR_OFFWHITE,0xff,true);
  pBVar8->substruct = this;
  ppVar1 = PauseSub;
  pBVar8->AButtonFunc = WidgetCrafting_ClosePopup;
  pBVar8->BButtonFunc = WidgetCrafting_ClosePopup;
  if ((ppVar1 != NULL) && (pWVar2 = ppVar1->dollmenu, pWVar2 != NULL)) {
    if (pWVar2->charStats_widget){
      pWVar2->charStats_widget->Update(PARTY->Members[this->partyIndex]);
    }
    if (pWVar2->lists) {
      pWVar2->lists->invMenu->InitMenu();
      pWVar2->lists->statMenu->InitMenu();
    }
  }
}

WidgetCrafting::~WidgetCrafting() {
  WidgetMenu::~WidgetMenu();
}