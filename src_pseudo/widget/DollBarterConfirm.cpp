#include "globals.h"

DollBarterConfirm::~DollBarterConfirm(){WidgetMenu::~WidgetMenu();}

DollBarterConfirm::DollBarterConfirm(WidgetInvShop *shop,u32 sellPrice):WidgetMenu() {
  u16 uVar1;
  PartyInventory *pPVar3;
  bool bVar5;
  short y;
  u32 uVar6;
  BaseWidget *uVar8;
  ulong uVar7;
  WidgetClipText *pBVar9;
  WidgetClipText *pBVar10;
  int iVar11;
  ulong uVar12;
  u8 *pbVar13;
  u8 bVar14;
  char buff [256];
  
  this->currShop = shop;
  this->salePrice = sellPrice;
  uVar8 = shop->scrollMenu->AFunc();
  if (uVar8->AFunc()) CRASH("dollbarterconfirm.cpp","Tried to sell/drop an equipped item!");
  ItemInstance* item = (ItemInstance*)uVar8->ZFunc();
  if (item == NULL) CRASH("No Item!","DollBarterConfirm");
  uVar1 = item->id;
  this->varU16 = uVar1;
  this->varU8 = PARTY->Inventory->GetItemIndex(uVar1);
  this->quant = PARTY->Inventory->GetItemQuantity(this->varU8);
  if (!this->salePrice) sprintf(buff,Cstring(DropXConfirm),item->name);
  else sprintf(buff,Cstring(SellYForX),this->salePrice,item->name);
  pBVar9 = WClipTXT(buff);
  Utilities::SetTextWidgetBoundsX(pBVar9,0x50,0xf0);
  this->scroll = new WidgetScrollMenu(6);
  this->scroll->SetColor(200,0xb4,100,0xff);
  if (!this->salePrice) sprintf(buff,gGlobals.CommonStrings[0x1da]);
  else sprintf(buff,gGlobals.CommonStrings[0x1d9]);
  pBVar10 = WClipTXT(buff);
  this->scroll->Append(pBVar10);
  pBVar10->varU8 = 0;
  if (this->quant == 1) {
    if (!this->salePrice) strcpy(buff,gGlobals.CommonStrings[0x1dc]);
    else strcpy(buff,gGlobals.CommonStrings[0x1db]);
    pBVar10 = WClipTXT(buff);
    this->scroll->Append(pBVar10);
    bVar14 = 1;
  }
  else {
    u8 bundles[]={1,5,10,20,0};
    for(u8 i=0; bundles[i]!=0 && bundles[i]<this->quant ; i++){
        if (this->salePrice) sprintf(buff,Cstring(SellXMany),bundles[i]);
        else sprintf(buff,Cstring(DropXMany),bundles[i]);
        WidgetClipText* cTxt=WClipTXT(buff);
        this->scroll->Append(cTxt);
        cTxt->varU8=bundles[i];
    }
    if (!this->salePrice) strcpy(buff,Cstring(DropAll));
    else strcpy(buff,Cstring(SellAll));
    pBVar10 = WClipTXT(buff);
    this->scroll->Append(pBVar10);
    bVar14 = this->quant;
  }
  pBVar10->varU8 = bVar14;
  this->scroll->Tick();
  u16 uVar16 = pBVar9->GetHeight() + this->scroll->GetHeight() + 8;
  u16 i = (int)(SCREEN_WIDTH - uVar16) / 2;
  y = (short)i;
  this->bg = IntroMenu_ShadowBG(0x50,y + -4,SCREEN_WIDTH,(i + uVar16 + 4));
  pBVar9->SetCoords(0x50,y);
  this->scroll->SetCoords(0x50,y + pBVar9->GetHeight() + 8);
  BaseWidget::Link(this->bg);
  BaseWidget::Link(pBVar9);
  BaseWidget::Link(this->scroll);
}

Gfx* DollBarterConfirm::Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1){
    RENDERCHILDREN();
}

u8 DollBarterConfirm::Tick(){return TickChildren();}

BaseWidget* DollBarterConfirm::UpFunc(){return this->scroll->UpFunc();}

BaseWidget* DollBarterConfirm::DownFunc(){return this->scroll->DownFunc();}

BaseWidget* DollBarterConfirm::AFunc() {
  pause_Substruct* pSub = PauseSub;
  BaseWidget* w = this->scroll->AFunc();
  if (w->varU8){
    PARTY->Inventory->TakeItem(this->varU16,w->varU8);
    ItemID id = (ItemID)this->varU16;
    (gGlobals.party)->Gold += this->salePrice * (uint)w->varU8;
    pSub->dollmenu->lists->invMenu->SetHighlight(id,w->varU8,0xff);
    pSub->dollmenu->lists->invMenu->Tick();
    pSub->dollmenu->lists->invMenu->scrollMenu->Update();
  }
  sprintf(Utilities::GetWidgetText(pSub->dollmenu->charStats_widget->GoldText),"%ld",(gGlobals.party)->Gold);
  pSub->dollmenu->barter_widget->m80044a94();
  pSub->dollmenu->barter_widget->UpdateGoldText();
  this->SetState(WidgetS_Closed);
  return 0;
}

u32 DollBarterConfirm::GetNumber(){return WidgetN_Other;}