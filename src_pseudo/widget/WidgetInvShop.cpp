#include "globals.h"
#include "quicksort.h"
#define FILENAME "./menus/submenuinventory.cpp"


u16 D_800ed560[]={DB_POTION,DB_WEAPON,DB_WAND,DB_AMULET,DB_RING,
    DB_HELMET,DB_CLOAK,DB_GLOVE,DB_BOOTS,DB_BELT,DB_ARMOR,DB_SHIELD,
    DB_KEYITEM,DB_MISC,0};
s32 FUN_8003c590(ItemInstance *param_1,ItemInstance *param_2) {
  u16 typeA;
  u16 typeB;
  int iVar3;
  u16 i;
  u16 uVar5;
  u16 uVar6;
  
  typeA = (u16)ITEMIDTYPE(param_1->id);
  typeB = (u16)ITEMIDTYPE(param_2->id);
  uVar6 = 0xffff;
  if (typeA == typeB) { //sort alphabetically if same type.
    iVar3 = strcmp(param_1->name,param_2->name);
  }
  else {
    uVar5 = 0xffff;
    i = 0;
    if (D_800ed560[0] != 0) {
      iVar3 = 0;
      do {
        while( true ) {
          if (typeA == D_800ed560[i]) uVar6 = i;
          if (typeB == D_800ed560[i]) uVar5 = i;
          i++;
          if (D_800ed560[i] == 0) goto LAB_8003c624;
          if (uVar6 != 0xffff) break;
        }
      } while (uVar5 == 0xffff);
    }
LAB_8003c624:
    iVar3 = -1;
    if (uVar5 <= uVar6) {
      iVar3 = 1;
    }
  }
  return iVar3;
}

s32 FUN_8003c640(BaseWidget **A,BaseWidget **B){
    return FUN_8003c590((ItemInstance*)A[0]->ZFunc(),(ItemInstance*)B[0]->ZFunc());
}


s32 FUN_8003c69c(BaseWidget **A,BaseWidget **B) {
  s32 ret;
  
  ItemInstance *pIVar3 = (ItemInstance *)A[0]->ZFunc();
  ItemInstance *pIVar4 = (ItemInstance *)B[0]->ZFunc();
  BaseWidget* uVar5 = A[0]->AFunc();
  BaseWidget* uVar6 = B[0]->AFunc();
  u16 uVar8 = uVar5->varU16;
  u16 uVar7 = uVar6->varU16;
  if (uVar8 == uVar7) ret = FUN_8003c590(pIVar3,pIVar4);
  else {
    if (uVar8 < gPartyPicker) uVar8+=4;
    if (uVar7 < gPartyPicker) uVar7+=4;
    ret = -1;
    if (uVar7 <= uVar8) ret = 1;
  }
  return ret;
}

s32 FUN_8003c78c(BaseWidget **param_1,BaseWidget **param_2) {
  BaseWidget * uVar3;
  BaseWidget * uVar4;
  s32 sVar6;
  
  uVar3 = param_1[0]->AFunc();
  uVar4 = param_2[0]->AFunc();
  if (uVar3 == 0) {
    if (uVar4 == 0) {
      return FUN_8003c640(param_1,param_2);
    }
  }
  else if (uVar4) {
    return FUN_8003c69c(param_1,param_2);
  }
  sVar6 = -1;
  if (uVar4) sVar6 = 1;
  return sVar6;
}

WidgetInvShop::WidgetInvShop(IInventory*inv,DollEquipmentMenu*doll)
 :WidgetTrainShop(){
  this->inventory=inv;
  this->dollMenu=doll;
  this->partyPicker=gPartyPicker;
  this->SetColor(COLOR_RED1);
  if(this->inventory!=gGlobals.shopInv){
    if((!this->dollMenu)&&(gGlobals.Shopkeep!=Item_NONE))
      this->TitleWidget=WidgetB8(BORG8_TitleSell);
    else this->TitleWidget=WidgetB8(BORG8_TitleInventory);
    this->TitleWidget->SetCoords(158,81);
    this->Link(this->TitleWidget);
  }
  this->scrollMenu=NULL;
  InitMenu();
  Tick();
}

WidgetInvShop::~WidgetInvShop(){WidgetMenu::~WidgetMenu();}

void WidgetInvShop::InitMenu() {
  bool bVar5;
  u16 *tempList;
  byte bVar11;
  int iVar12;
  u16 count;
  u16 i;
  
  this->partyPicker = gPartyPicker;
  if (this->scrollMenu == NULL) {
    this->pricedItem = 0;
    this->scrollMenu = new WidgetFastScrollMenu(this->inventory->GetMaxQuantity() + PARTY->PartySize * 0xf);
    WSMSub *scrollSub=(WSMSub*)this->scrollMenu->substruct;
    this->scrollMenu->SetColors(0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
    this->Link(this->scrollMenu);
    SetArrows();
    if (this->inventory != gGlobals.shopInv){ //add party's equip to list
        for(u8 i=0;i< PARTY->PartySize;i++){
          count = (this->partyPicker + i) % (u32)PARTY->PartySize;
          bVar11 = (byte)count;
          if (PARTY->Members[count]->weapons)
            this->scrollMenu->Append(new SMIItem(&PARTY->Members[count]->weapons->base,1,bVar11));
          if (PARTY->Members[count]->armor[0])
            this->scrollMenu->Append(new SMIItem(&PARTY->Members[count]->armor[0]->base,1,bVar11));
          if (PARTY->Members[count]->armor[1])
            this->scrollMenu->Append(new SMIItem(&PARTY->Members[count]->armor[1]->base,1,bVar11));
          CharGear *pCVar4 = PARTY->Members[count]->pItemList;
          for(count=0;count<pCVar4->usedItems,count<15;count++){
            if(pCVar4->pItem[count]){
            SMIItem* entry =new SMIItem(&pCVar4->pItem[count]->base,1,bVar11);
            this->scrollMenu->Append(entry);
            entry->varU16=count;
            }
          }
        }
    }
    this->inventorySize = scrollSub->numChoices;
    ALLOCS(tempList, this->inventory->GetQuantity()*sizeof(u16),341);
    s32 max;
    for(i=0,count=0,max=this->inventory->GetMaxQuantity();i<max;i++){
      if (this->inventory->GetItemEntry(i))
          tempList[count++]=i;
      }
    if (count != this->inventory->GetQuantity())
        CRASH("Numbers don't match","SMInventory.cpp");
    for(i=0;i<count;i++){
        ItemInstance *item = &this->inventory->GetItemEntry(tempList[i])->base;
        if (item) {
          bVar11 =this->inventory->GetItemQuantity(tempList[i]);
          if ((bVar5) && (gGlobals.Shopkeep != (ItemID)0xffff)) {
            bVar11 = 0;
          }
          SMIItem *pSVar9 = new SMIItem(item,bVar11,0xff);
          this->scrollMenu->Append(pSVar9);
          pSVar9->varU8 = tempList[i];
        }
    }
    HFREE(tempList,395);
    if (scrollSub->numChoices) {
      QSort(scrollSub->items,scrollSub->numChoices,FUN_8003c78c);
      this->Tick();
      this->scrollMenu->Update();
    }
  }
  else this->scrollMenu->Update();
}

u32 WidgetInvShop::unk(){return 0;}

Gfx* WidgetInvShop::Render(Gfx*g,u16 x0,u16 y0, u16 x1,u16 y1){RENDERCHILDREN();}

u8 WidgetInvShop::Tick(){
    WidgetTrainShop::Tick();
    return TickChildren();}

void WidgetInvShop::Confirm(u16 a, u16 b){}

void WidgetInvShop::Purchase(u16 a, u8 b){}

s32 WidgetInvShop::GetExpPrice(u16 x){return 0;}

u32 WidgetInvShop::GetGoldPrice(u16 index) {
  u16 uVar1;
  BaseWidget *pBVar2;
  bool shopMenu;
  u32 ret;
  float fVar8;
  
  pBVar2 = this->scrollMenu;
  BaseWidget *uVar5 = this->scrollMenu->AFunc();
  shopMenu = this->inventory == gGlobals.shopInv;
  if (uVar5 == NULL) return 0;
  else {
    ItemInstance *item=(ItemInstance *)uVar5->ZFunc();
    uVar1 = item->price;
    if (shopMenu) fVar8 = gBarterFloat * (uVar1*2);
    else fVar8 = (float)uVar1 * (1.0f - gBarterFloat) * 0.5f;
    ret = (u16)fVar8;
    this->pricedItem = item;
  }
  return ret;
}

u8 WidgetInvShop::SetHighlight(ItemID param_2,u8 param_3,u8 param_4) {
  u16 i;
  WSMSub *sub = (WSMSub *)(this->scrollMenu)->substruct;
  if (param_4 == 0xff) {
    if (this->inventorySize < sub->numChoices) {
        for(i=this->inventorySize;i<sub->numChoices;i++){
         if ((ItemID)sub->items[i]->varU16 == param_2) {
          sub->highlight = (u16)i;
          return TakeItem(param_3);
         }
        }
    }
  }
  else {
    for(i=0;i<this->inventorySize;i++){
        BaseWidget * uVar2 = sub->items[i]->AFunc();
        if ((uVar2->varU16 == param_4) && (sub->items[i]->varU16 == param_2)) {
          sub->highlight = (u16)i;
          return TakeItem(param_3);
        }
    }
  }
  return false;
}

bool WidgetInvShop::TakeItem(u8 quant) {
  BaseWidget **ppBVar2;
  BaseWidget **ppBVar7;
  BaseWidget *apBStack_20;
  
  if (quant) {
    WSMSub *pvVar2 = (WSMSub *)(this->scrollMenu)->substruct;
    apBStack_20 = pvVar2->items[pvVar2->highlight];
    BaseWidget *pBVar3 = apBStack_20->BFunc();
    if (pBVar3->varU16 < quant) pBVar3->varU16 = quant;
    pBVar3->varU16-=quant;
    if (pBVar3->varU16 == 0) {
      if (apBStack_20->AFunc()) this->inventorySize--;
      FREEQW(apBStack_20);
      u16 i = pvVar2->highlight;
      s32 max = pvVar2->numChoices - 1;
      for(;i < max;i++){
        ppBVar2[i]=ppBVar2[i+1];
      }
      pvVar2->numChoices--;
    }
    else {
      char buff [64];
      sprintf(buff,"%d",pBVar3->varU16);
      Utilities::ChangeWidgetText(pBVar3,buff,true);
    }
  }
  return true;
}

bool WidgetInvShop::NewItem(ItemInstance *param_2,u8 param_3,u8 param_4) {
  this->scrollMenu->Append(new SMIItem(param_2,param_3,param_4));
  if (param_4 != 0xff) this->inventorySize++;
  return true;
}

bool WidgetInvShop::AddItem(u16 param_2,u8 param_3,u8 param_4,char *script,u16 line){
  ItemInstance *pObject;
  WSMSub *scrollSub = (WSMSub *)this->scrollMenu->substruct;
  if (param_4 == 0xff) {
    s32 uVar3 = this->inventory->GetItemIndex(param_2);
    if (uVar3 == -1) CRASH("SMI::AddItem","Couldn't find inventory index");
    pObject = &this->inventory->GetItemEntry(uVar3)->base;
    if (pObject == NULL) CRASH("SMI::AddItem","pObject == NULL");
    uVar3 = this->inventory->GetItemQuantity(uVar3);
    if (1 < uVar3) {
      if (scrollSub->numChoices == 0) CRASH("SMI::AddItem","numChoices == 0 when it shouldn't be.");
      for(s32 i = scrollSub->numChoices - 1;i-1>=0;i--){
            ItemInstance * x=(ItemInstance*)scrollSub->items[i]->ZFunc();
          if (x->id == param_2) {
            char acStack_68 [104];
            BaseWidget *pBVar7 = scrollSub->items[i]->BFunc();
            sprintf(acStack_68,"%ld",uVar3);
            Utilities::ChangeWidgetText(pBVar7,acStack_68,true);
            pBVar7->varU16 = (u16)uVar3;
            return true;
          }
        }
    }
  }
  else {
    pObject = Entity::HasItemEquipped(PARTY->Members[param_4],(ItemID)param_2);
    Gsprintf("Failed to find %d\nCalled from %s - %d",param_2,script,line);
    if (pObject == NULL) CRASH("SMI::AddItem",gGlobals.text);
  }
  NewItem(pObject,param_3,param_4);
  return true;
}

void WidgetInvShop::SortA() {
  if (this->inventorySize) {
    QSort(((WSMSub*)this->scrollMenu->substruct)->items,this->inventorySize,FUN_8003c69c);
    this->Tick();
    this->scrollMenu->Update();
  }
}

void WidgetInvShop::SortB(){
    QSort(((WSMSub*)this->scrollMenu->substruct)->items,this->inventorySize,FUN_8003c78c);
}

bool WidgetInvShop::m8003d674(u16 param_2,u8 param_3) {
  u16 i;
  WSMSub *sub = (WSMSub *)this->scrollMenu->substruct;
  if (param_3 == 0xff) {
    if (this->inventorySize < sub->numChoices) {
      for(i = this->inventorySize;i < sub->numChoices;i++){
        if (sub->items[i]->varU16 == param_2) {
          sub->highlight = i;
          return true;
        }
      }
      return false;
    }
  }
  else {
    for(i=0;i<this->inventorySize;i++){
        if ((sub->items[i]->BFunc()->varU16 == (u16)param_3) && (sub->items[i]->varU16 == param_2)) {
          sub->highlight = i;
          return true;
        }
    }
  }
  return false;
}

u32 WidgetInvShop::GetNumber(){return WidgetN_Other;}