#include "globals.h"

WidgetTrainShop::WidgetTrainShop():WidgetMenu(){
  this->TitleWidget = NULL;
  this->scrollMenu = NULL;
  this->arrows = NULL;
  this->partyPicker = 0;
}

BaseWidget* WidgetTrainShop::SetHighlight(u16 h){
  u16 uVar1;
  u16 uVar2;
  BaseWidget *ret;
  WSMSub *sub = (WSMSub *)this->scrollMenu->substruct;
  BaseWidget *ret = NULL;
  if (sub->numChoices != 0) {
    ret = *sub->items;
    if (ret->varU16 == h) sub->highlight = 0;
    else {
      uVar2 = 1;
      do {
        uVar1 = uVar2;
        uVar2 = uVar1;
        ret = NULL;
        if (sub->numChoices <= uVar2) goto LAB_80037dd4;
        ret = sub->items[uVar2++];
      } while (ret->varU16 != h);
      sub->highlight = (u16)uVar1;
    }
  }
LAB_80037dd4:
  if (!ret)
    Utilities::SetScrollMenuColors(this->scrollMenu,COLOR_RED1,COLOR_RED1,1);
  else
    Utilities::SetScrollMenuColors(this->scrollMenu,0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
  return ret;
}

BaseWidget * WidgetTrainShop::UpFunc(){return this->scrollMenu->UpFunc();}

BaseWidget * WidgetTrainShop::DownFunc(){return this->scrollMenu->DownFunc();}

u8 WidgetTrainShop::Tick(){
  this->scrollMenu->SetCoords(this->posX,this->posY);
  this->scrollMenu->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
  BaseWidget*pBVar2 = this->scrollMenu;
  BaseWidget*pBVar3 = this->TitleWidget;
  this->scrollMenu->boundX0 = this->boundX0;
  this->scrollMenu->boundY0 = this->boundY0;
  this->scrollMenu->boundY1 = this->boundY1;
  this->scrollMenu->boundX1 = this->boundX1;
  if (this->TitleWidget) {
    pBVar3->boundX0 = this->boundX0 + 10;
    pBVar3->boundX1 = this->boundX1;
    this->TitleWidget->posX = this->posX - (pBVar3->GetWidth() >> 1) + -70;
  }
  if (this->arrows) {
    BaseWidget**puVar4 = (BaseWidget**)this->arrows->substruct;
    pBVar2 = puVar4[0];
    pBVar3 = puVar4[1];
    pBVar2->SetCoords(this->scrollMenu->posX + 0xf,this->scrollMenu->posY + -0xd);
    pBVar2->boundX0 = this->boundX0;
    pBVar2->boundX1 = this->boundX1;
    pBVar3->SetCoords(this->scrollMenu->posX + (this->scrollMenu->boundX1 - this->scrollMenu->boundX0) + -0xf,
          this->scrollMenu->posY + -0xd);
    pBVar3->boundX0 = this->boundX0;
    pBVar3->boundX1 = this->boundX1;
  }
  return TickChildren();
}

void WidgetTrainShop::SetArrows(){
  if(this->scrollMenu){
    this->arrows=new WidgetScrollArrows(this->scrollMenu,WidgetB8(BORG8_ScrollBarArrowUp),WidgetB8(BORG8_ScrollBarArrowDown),0);
    this->arrows->SetColor(COLOR_OFFWHITE);
    this->scrollMenu->Link(this->arrows);
  }
}

WidgetTrainShop::~WidgetTrainShop(){WidgetMenu::~WidgetMenu();}

u32 WidgetTrainShop::GetNumber(){return WidgetN_Other;}