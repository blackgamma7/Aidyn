#include "globals.h"

WidgetBarter::~WidgetBarter() {
  if (gGlobals.shopInv) {
    gGlobals.shopInv->~GenericInventory();
    gGlobals.shopInv = NULL;
  }
  WidgetMenu::~WidgetMenu();
}

WidgetBarter::WidgetBarter(WidgetTrainShop *shop,ItemID merchantID):WidgetMenu() {
  this->unk84 = (WidgetInvShop*)shop;
  this->varU16 = (u16)merchantID;
  this->itemWidget = NULL;
  this->description = NULL;
  this->partyPicker = gPartyPicker;
  Gsprintf("barter id = %d\n",merchantID);
  if (this->varU16 == 0xffff) {
    this->invType = 1;
    gBarterFloat = 0.0;
  }
  else {
    ItemID x = (ItemID)this->varU16;
    this->invType = 0;
    u8 bVar7 = GETINDEX(this->varU16);
    gBarterFloat = PARTY->Barter(gEntityDB->entities[bVar7].stats[STAT_INT],
                                 gEntityDB->entities[bVar7].Skills[SKILL_Merchant]);
  }
  WidgetBorg8 *pBVar2 = WidgetB8(BORG8_BarterBGShadow);
  pBVar2->SetCoords(20,62);
  pBVar2->SetCoords(5,60); //?!? this negates the first(?)
  BaseWidget::Link(pBVar2);
  this->background = WidgetB8(BORG8_BarterBG);
  this->background->SetCoords(20,62);
  this->background->SetCoords(0,58);//?!? this negates the first(?)
  BaseWidget::Link(this->background);
  pBVar2 = WidgetB8(this->invType==1?BORG8_TitleTreasure:BORG8_TitleBuy);
  pBVar2->SetCoords(90 - (pBVar2->GetWidth() >> 1),0x55 - pBVar2->GetHeight());
  BaseWidget::Link(pBVar2);
  this->itemWidget = new WidgetInvShop(gGlobals.shopInv,NULL);
  this->itemWidget->SetCoords(20,88);
  BaseWidget::Link(this->itemWidget);
  this->goldText = new WidgetClipText(NULL,10);
  this->goldText->SetColor(0x82,0x50,0x50,0xff);
  this->goldText->SetCoords(0x1e,0xa9);
  BaseWidget::Link(this->goldText);
  this->itemWidget->boundX0 = 0x14;
  this->itemWidget->boundX1 = 0x9d;
  this->itemWidget->boundY0 = 0x58;
  this->itemWidget->boundY1 = 0xa6;
  if (this->itemWidget->scrollMenu->AFunc() == 0) {
    this->description = this->unk84;
    this->itemWidget->scrollMenu->SetColors(0x82,0x50,0x50,0xff,0x82,0x50,0x50,0xff,1);
    this->unk84->scrollMenu->SetColors(0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,20);
  }
  else {
    this->description = this->itemWidget;
    this->itemWidget->scrollMenu->SetColors(0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,20);
    this->unk84->scrollMenu->SetColors(0x82,0x50,0x50,0xff,0x82,0x50,0x50,0xff,1);
  }
  if ((this->invType == 1) && (gGlobals.moneypile))
    PlayAudioSound(&gGlobals.SFXStruct,BORG12_CoinJingle,0,gGlobals.VolSFX,300,0x3c);
  UpdateGoldText();
  this->itemWidget->Tick();
  this->itemWidget->scrollMenu->Update();
  this->itemWidget->SetArrows();
}

void WidgetBarter::UpdateGoldText() {
  BaseWidget* item = this->description->scrollMenu->AFunc();
  this->partyPicker = gPartyPicker;
  if (this->invType == 1) {
    Gsprintf(Cstring(FoundXGold),gGlobals.moneypile);
    Utilities::ChangeWidgetText(this->goldText,gGlobals.text,true);
  }
  else if (item == NULL) {
    sprintf(Utilities::GetWidgetText(this->goldText)," ");
  }
  else {
    s32 price = this->description->GetGoldPrice(item->varU16);
    sprintf(Utilities::GetWidgetText(this->goldText),Cstring(ItemGoldValue),price);
  }
}

Gfx * WidgetBarter::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1) {
  SlimFont;
  g = RenderChildren(g,x0,y0,x1,y1);
  NormalFont;
  return g;
}

u8 WidgetBarter::Tick() {
  SlimFont;
  u8 ret =TickChildren();
  NormalFont;
  return ret;
}

u32 FUN_80044a8c() {return 0;} //likely another method. Unused.

void WidgetBarter::m80044a94() {
  this->partyPicker = gPartyPicker;
  if (this->invType == 1) {
    this->itemWidget->InitMenu();
    if ((this->description == this->itemWidget)&&(!this->description->scrollMenu->AFunc())) {
      this->RightFunc();
    }
  }
  this->unk84->InitMenu();
  if (this->description == this->itemWidget) {
    this->itemWidget->scrollMenu->SetColors(0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,20);
    this->unk84->scrollMenu->SetColors(0x82,0x50,0x50,0xff,0x82,0x50,0x50,0xff,1);
  }
  else {
    this->itemWidget->scrollMenu->SetColors(0x82,0x50,0x50,0xff,0x82,0x50,0x50,0xff,1);
    this->unk84->scrollMenu->SetColors(0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,20);
  }
}

u32 WidgetBarter::GetNumber(){return WidgetN_Other;}