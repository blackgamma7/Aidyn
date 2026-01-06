#include "globals.h"
#include "widgets/textPopup.h"
#include "widgets/menuPrompt.h"

BaseWidget * WidgetBarter::UpFunc() {
  this->description->scrollMenu->UpFunc();
  UpdateGoldText();
  return NULL;
}

BaseWidget * WidgetBarter::DownFunc() {
  this->description->scrollMenu->DownFunc();
  UpdateGoldText();
  return NULL;
}

BaseWidget * WidgetBarter::LeftFunc() {
  if(this->itemWidget->scrollMenu->AFunc()){
    this->description=this->itemWidget;
    this->itemWidget->scrollMenu->SetSubstructColors(0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
    this->unk84->scrollMenu->SetSubstructColors(0x82,0x50,0x50,0xff,0x82,0x50,0x50,0xff,1);
    UpdateGoldText();
  }
  return NULL;
}

BaseWidget * WidgetBarter::RightFunc() {
  this->description=this->itemWidget;
  this->description->scrollMenu->SetSubstructColors(0x82,0x50,0x50,0xff,0x82,0x50,0x50,0xff,1);
  this->unk84->scrollMenu->SetSubstructColors(0x82,0x50,0x50,0xff,0x82,0x50,0x50,0xff,1);
  UpdateGoldText();
  return NULL;
}

BaseWidget* WidgetBarter_ACallback(BaseWidget* param_1,BaseWidget *param_2) {
  setGlobalsPointer(param_2);
  return NULL;
}

BaseWidget * WidgetBarter::BFunc() {
  if (this->invType == 1) {
    if (gGlobals.shopInv->GetQuantity()) {
      if (gGlobals.shopInv->HasNoKeyItem()) {
        Color32 colA={COLOR_WHITE};
        Color32 colB={200,180,100,0xff};
        strcpy(gGlobals.text,Cstring(LeaveItemsConfirm));
        WidgetChoiceDia *pWVar2 =  new WidgetChoiceDia(2,gGlobals.text,0x96,&colA,&colB,0,0,0);
        WidgetClipText* pBVar3 = WClipTXT(Cstring(LeaveItemsYes));
        pBVar3->AButtonFunc = WidgetBarter_ACallback;
        pWVar2->AppendScrollMenu(pBVar3);
        pWVar2->AppendScrollMenu(WClipTXT(Cstring(LeaveItemsNo)));
        pWVar2->Update();
        WHANDLE->AddWidget(pWVar2);
      }
      else {
        TextPopup_New(Cstring(GetKeyItem),0x9b,0x28,0xff,0xff,0xff,0xff,0x96,1);
      }
    }
  }
  return NULL;
}

//common for this next func-show a popup using a common string, then return NULL.
#define BarterError(n)\
ErrPopup(Cstring(n));\
return NULL

BaseWidget* WidgetBarter::AFunc() {
  
  bool isShop = this->invType == 0;
  BaseWidget* uVar7 = this->description->scrollMenu->AFunc();
  if (uVar7 == NULL) {
    BarterError(LootNone);
  }
  else {
    s32 price = this->description->GetGoldPrice(uVar7->varU16);
    if (this->description == this->unk84) {
      if (price <= 1) {
        if (!isShop) {
         BarterError(ItemCantDrop);
        }
        else{
         BarterError(MerchantRefuse);
        }
      }
      else {
        if (uVar7->AFunc() == 0) {
          if (!isShop) price = 0;
          WHANDLE->AddWidget(new DollBarterConfirm(this->unk84,price));
          return 0;
        }
        if (isShop) {
          BarterError(UnequipToSell);
        }
        else {
          BarterError(UnequipToDrop);
        }
      }
    }
    else if ((isShop) && ((gGlobals.party)->Gold < price)) {
        BarterError(CantAfford);
    }
    else {
      s32 currQuant = 0;
      ItemID *pIVar7 = (ItemID *)uVar7->ZFunc();
      if (PARTY->Inventory->HasItem(*pIVar7)) {
        currQuant = PARTY->Inventory->GetItemQuantity(PARTY->Inventory->GetItemIndex(*pIVar7));
        if (currQuant>=99) {
            BarterError(ItemFull);
        }
      }
      s32 quantAdd = 1;
      if (!isShop) {
        BaseWidget* uVar9 = uVar7->BFunc();
        quantAdd = uVar9->varU16;
        if (99 - currQuant < uVar9->varU16) {
          quantAdd = 99 - currQuant;
        }
      }
      if (PARTY->Inventory->AddItem(*pIVar7,quantAdd)) {
        this->unk84->AddItem((u16)*pIVar7,quantAdd,0xff,NULL,0);
        this->unk84->SortB();
        this->unk84->m8003d674(*pIVar7,0xff);
        this->unk84->Tick();
        this->unk84->scrollMenu->Update();
        if (isShop) PARTY->Gold -= price;
        else {
          gGlobals.shopInv->IncItemQuantity(uVar7->varU8,-quantAdd);
          this->itemWidget->SetHighlight(*pIVar7,quantAdd,0xff);
          this->itemWidget->Tick();
          this->itemWidget->scrollMenu->Update();
        }
        if ((ITEMIDTYPE(*pIVar7) == DB_POTION) && (!getEventFlag(FLAG_GotFirstItems))) {
          setEventFlag(FLAG_GotFirstItems,true);
          WHANDLE->AddWidget(new WidgetMenuPrompt(Cstring(PotionFirstPrompt),0x17,0x46,130,80,80,0xff))
        }
        m80044a94();
        UpdateGoldText();
        sprintf(Utilities::GetWidgetText(PauseSub->dollmenu->charStats_widget->GoldText),"%ld",(gGlobals.party)->Gold);
        return 0;
      }
      else{
        BarterError(InventoryFull);
      }
    }
  }
}

BaseWidget* WidgetBarter::CUpFunc() {
  if ((this->description == this->itemWidget) && (this->invType != 1)) {
    BaseWidget* w = this->description->scrollMenu->AFunc();
    char* txt = PARTY->ApraisePrice(this->description->pricedItem,
                   this->description->GetGoldPrice(w->varU16));
    ErrPopup(txt);
  }
  return NULL;
}

BaseWidget* WidgetBarter::CDownFunc(){
    this->description->CDownFunc();
    return NULL;
}