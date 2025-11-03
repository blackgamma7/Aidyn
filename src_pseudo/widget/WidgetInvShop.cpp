#include "globals.h"
#include "quicksort.h"
#define FILENAME "./menus/submenuinventory.cpp"


u16 D_800ed560[]={DB_POTION,DB_WEAPON,DB_WAND,DB_AMULET,DB_RING,
    DB_HELMET,DB_CLOAK,DB_GLOVE,DB_BOOTS,DB_BELT,DB_ARMOR,DB_SHIELD,
    DB_KEYITEM,DB_MISC,0};
s32 FUN_8003c590(ItemInstance *param_1,ItemInstance *param_2) {
  ushort typeA;
  ushort typeB;
  int iVar3;
  u16 i;
  u16 uVar5;
  u16 uVar6;
  
  typeA = (ushort)param_1->id >> 8;
  typeB = (ushort)param_2->id >> 8;
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
  ItemInstance *pIVar3;
  ItemInstance *pIVar4;
  BaseWidget *uVar5;
  BaseWidget *uVar6;
  s32 sVar5;
  ushort uVar7;
  ushort uVar8;
  
  pIVar3 = (ItemInstance *)A[0]->ZFunc();
  pIVar4 = (ItemInstance *)B[0]->ZFunc();
  uVar5 = A[0]->AFunc();
  uVar6 = B[0]->AFunc();
  uVar8 = uVar5->varU16;
  uVar7 = uVar6->varU16;
  if (uVar8 == uVar7) sVar5 = FUN_8003c590(pIVar3,pIVar4);
  else {
    if (uVar8 < gPartyPicker) uVar8 = uVar8 + 4;
    if (uVar7 < gPartyPicker) uVar7 = uVar7 + 4;
    sVar5 = -1;
    if (uVar7 <= uVar8) sVar5 = 1;
  }
  return sVar5;
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
  this->SetColor(0x82,0x50,0x50,0xff);
  if(this->inventory!=gGlobals.shopInv){
    if((!this->dollMenu)&&(gGlobals.Shopkeep!=Item_NONE))
      this->TitleWidget=WidgetB8(0xeb);
    else this->TitleWidget=WidgetB8(BORG8_TitleInventory);
    this->TitleWidget->SetCoords(0x9e,0x51);
    this->Link(this->TitleWidget);
  }
  this->scrollMenu=NULL;
  InitMenu();
  Tick();
}

WidgetInvShop::~WidgetInvShop(){WidgetMenu::~WidgetMenu();}


void WidgetInvShop::InitMenu() {
  GenericInventory *pGVar3;
  CharGear *pCVar4;
  GearInstance *pObject;
  bool bVar5;
  BaseWidget *pBVar6;
  ulong uVar7;
  u16 *tempList;
  ulong uVar8;
  ItemInstance *pObject_00;
  SMIItem *pSVar9;
  GearInstance **ppGVar10;
  byte bVar11;
  int iVar12;
  u16 uVar13;
  u16 i;
  WSMSub *pvVar2;
  
  pBVar6 = this->scrollMenu;
  this->partyPicker = gPartyPicker;
  pGVar3 = gGlobals.shopInv;
  if (this->scrollMenu == NULL) {
    this->unk8c = 0;
    this->scrollMenu = new WidgetFastScrollMenu(this->inventory->GetMaxQuantity() + (gGlobals.party)->PartySize * 0xf);
    this->scrollMenu->SetSubstructColors(0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
    this->Link(this->scrollMenu);
    SetArrows();
    if (this->inventory != gGlobals.shopInv){ //add party's equip to list
        for(u8 i=0;i< PARTY->PartySize;i++){
          uVar13 = (this->partyPicker + i) % (uint)(gGlobals.party)->PartySize;
          bVar11 = (byte)uVar13;
          if ((gGlobals.party)->Members[uVar13]->weapons)
            this->scrollMenu->Append(new SMIItem(&(gGlobals.party)->Members[uVar13]->weapons->base,1,bVar11));
          if (gGlobals.party->Members[uVar13]->armor[0])
            this->scrollMenu->Append(new SMIItem(&(gGlobals.party)->Members[uVar13]->armor[0]->base,1,bVar11));
          if (gGlobals.party->Members[uVar13]->armor[1])
            this->scrollMenu->Append(new SMIItem(&(gGlobals.party)->Members[uVar13]->armor[1]->base,1,bVar11));
          pCVar4 = (gGlobals.party)->Members[uVar13]->pItemList;
          for(uVar13=0;uVar13<pCVar4->usedItems,uVar13<15;uVar13++){
            if(pCVar4->pItem[uVar13])
            SMIItem* entry =new SMIItem(&pCVar4->pItem[uVar13]->base,1,bVar11);
            this->scrollMenu->Append(entry);
            entry->var5C=uVar13;
          }
        }
    }
    this->unk98 = pvVar2->currentCount;
    ALLOCS(tempList, this->inventory->GetQuantity()<<1,0x155);
    i = 0;
    uVar13 = 0;
    uVar7 = this->inventory->GetMaxQuantity();
    if (uVar7){
      while( true ) {
        if (this->inventory->GetItemEntry(i))
          tempList[uVar13++]=i;
        i++;
        if (uVar7 <= i) break;
      }
    }
    if (uVar13 != this->inventory->GetQuantity())
        CRASH("Numbers don't match","SMInventory.cpp");
    for(i=0;i<uVar13;uVar13++){
        pObject_00 = &this->inventory->GetItemEntry(tempList[i])->base;
        if (pObject_00) {
          bVar11 =this->inventory->GetItemQuantity(tempList[i]);
          if ((bVar5) && (gGlobals.Shopkeep != (ItemID)0xffff)) {
            bVar11 = 0;
          }
          pSVar9 = new SMIItem(pObject_00,bVar11,0xff);
          this->scrollMenu->Append(pSVar9);
          pSVar9->varU8 = tempList[i];
        }
    }
    HFREE(tempList,395);
    if (pvVar2->currentCount != 0) {
      QSort(pvVar2->items,pvVar2->currentCount,FUN_8003c78c);
      this->Tick();
      this->scrollMenu->m8002ff30();
    }
  }
  else this->scrollMenu->m8002ff30();
}

u32 WidgetInvShop::unk(){return 0;}

Gfx* WidgetInvShop::Render(Gfx*g,u16 x0,u16 y0, u16 x1,u16 y1){RENDERCHILDREN();}

u8 WidgetInvShop::Tick(){
    WidgetTrainShop::Tick();
    return TickChildren();}

void WidgetInvShop::Confirm(u16 a, u16 b){}

s32 WidgetInvShop::GetExpPrice(u16 x){return 0;}

extern float gBarterFloat;

u32 WidgetInvShop::GetGoldPrice(u16 index) {
  ushort uVar1;
  BaseWidget *pBVar2;
  bool shopMenu;
  BaseWidget *uVar5;
  ItemInstance *uVar6;
  uint ret;
  float fVar8;
  
  pBVar2 = this->scrollMenu;
  uVar5 = this->scrollMenu->AFunc();
  shopMenu = this->inventory == gGlobals.shopInv;
  if (uVar5 == NULL) return 0;
  else {
    uVar6=(ItemInstance *)uVar5->ZFunc();
    uVar1 = uVar6->price;
    if (shopMenu) {
      fVar8 = gBarterFloat * (uVar1*2);
    }
    else {
      fVar8 = (float)uVar1 * (1.0f - gBarterFloat) * 0.5f;
    }
    ret = (u16)fVar8;
    this->unk8c = uVar6;
  }
  return ret;
}

u8 WidgetInvShop::SetHighlight(ItemID param_2,u8 param_3,u8 param_4) {
  u16 i;
  WSMSub *sub = (WSMSub *)(this->scrollMenu)->substruct;
  if (param_4 == 0xff) {
    if (this->unk98 < sub->currentCount) {
        for(i=this->unk98;i<sub->currentCount;i++){
         if ((ItemID)sub->items[i]->varU16 == param_2) {
          sub->highlight = (u16)i;
          return m8003d194(param_3);
         }
        }
    }
  }
  else {
    for(i=0;i<this->unk98;i++){
        BaseWidget * uVar2 = sub->items[i]->AFunc();
        if ((uVar2->varU16 == param_4) && (sub->items[i]->varU16 == param_2)) {
          sub->highlight = (u16)i;
          return m8003d194(param_3);
        }
    }
  }
  return false;
}

bool WidgetInvShop::m8003d194(u8 param_2) {
  u16 uVar1;
  BaseWidget **ppBVar2;
  BaseWidget *pBVar3;
  ushort uVar5;
  ulong uVar4;
  int iVar6;
  BaseWidget **ppBVar7;
  u16 uVar8;
  char acStack_60 [64];
  BaseWidget *apBStack_20 [8];
  WSMSub *pvVar2;
  
  if (param_2) {
    pvVar2 = (WSMSub *)(this->scrollMenu)->substruct;
    apBStack_20[0] = pvVar2->items[pvVar2->highlight];
    pBVar3 = apBStack_20[0]->BFunc();
    if (pBVar3->varU16 < param_2) pBVar3->varU16 = param_2;
    pBVar3->varU16-=param_2;
    if (pBVar3->varU16 == 0) {
      if (apBStack_20[0]->AFunc()) this->unk98--;
      FREEQW(apBStack_20[0]);
      uVar8 = (uint)pvVar2->highlight;
      iVar6 = pvVar2->currentCount - 1;
      if ((int)uVar8 < iVar6) {
        ppBVar2 = pvVar2->items;
        do {
          ppBVar7 = ppBVar2 + uVar8;
          uVar8++;
          *ppBVar7 = ppBVar7[1];
        } while ((int)uVar8 < iVar6);
      }
      pvVar2->currentCount--;
    }
    else {
      sprintf(acStack_60,"%d",pBVar3->varU16);
      Utilities::ChangeWidgetText(pBVar3,acStack_60,true);
    }
  }
  return true;
}

bool WidgetInvShop::NewItem(ItemInstance *param_2,u8 param_3,u8 param_4) {
  this->scrollMenu->Append(new SMIItem(param_2,param_3,param_4));
  if (param_4 != 0xff) this->unk98++;
  return true;
}

bool WidgetInvShop::AddItem(u16 param_2,u8 param_3,u8 param_4,char *script,u16 line){
  s32 uVar3;
  ItemInstance *pIVar4;
  BaseWidget **ppBVar5;
  ushort *puVar6;
  BaseWidget *pBVar7;
  int i;
  char acStack_68 [104];
  WSMSub *pvVar1 = (WSMSub *)this->scrollMenu->substruct;
  if (param_4 == 0xff) {
    uVar3 = this->inventory->GetItemIndex(param_2);
    if (uVar3 == -1) CRASH("SMI::AddItem","Couldn't find inventory index");
    pIVar4 = &this->inventory->GetItemEntry(uVar3)->base;
    if (pIVar4 == NULL) CRASH("SMI::AddItem","pObject == NULL");
    uVar3 = this->inventory->GetItemQuantity(uVar3);
    if (1 < uVar3) {
      i = pvVar1->currentCount - 1;
      if (pvVar1->currentCount == 0) CRASH("SMI::AddItem","numChoices == 0 when it shouldn't be.");
      if (-1 < i) {
        ppBVar5 = pvVar1->items;
        while( true ) {
            ItemInstance * x=(ItemInstance*)ppBVar5[i]->ZFunc();
          if (x->id == param_2) {
            pBVar7 = pvVar1->items[i]->BFunc();
            sprintf(acStack_68,"%ld",uVar3);
            Utilities::ChangeWidgetText(pBVar7,acStack_68,true);
            pBVar7->varU16 = (ushort)uVar3;
            return true;
          }
          if (i + -1 < 0) break;
          ppBVar5 = pvVar1->items;
          i--;
        }
      }
    }
  }
  else {
    pIVar4 = Entity::HasItemEquipped((gGlobals.party)->Members[param_4],(ItemID)param_2);
    Gsprintf("Failed to find %d\nCalled from %s - %d",param_2,script,line);
    if (pIVar4 == NULL) CRASH("SMI::AddItem",gGlobals.text);
  }
  NewItem(pIVar4,param_3,param_4);
  return true;
}

void WidgetInvShop::SortA() {
  if (this->unk98) {
    QSort(((WSMSub*)this->scrollMenu->substruct)->items,this->unk98,FUN_8003c69c);
    this->Tick();
    this->scrollMenu->m8002ff30();
  }
}

void WidgetInvShop::SortB(){
    QSort(((WSMSub*)this->scrollMenu->substruct)->items,this->unk98,FUN_8003c78c);
}


bool WidgetInvShop::m8003d674(u16 param_2,u8 param_3) {
  BaseWidget *pBVar1;
  ulong uVar2;
  BaseWidget **ppBVar3;
  u16 i;
  WSMSub *sub;
  
  sub = (WSMSub *)this->scrollMenu->substruct;
  if (param_3 == 0xff) {
    if (this->unk98 < sub->currentCount) {
      i = this->unk98;
      do {
        if (sub->items[i]->varU16 == param_2) {
          sub->highlight = i;
          return true;
        }
        i++;
      } while (i < sub->currentCount);
      return false;
    }
  }
  else {
    for(i=0;i<this->unk98;i++){
        if ((sub->items[i]->BFunc()->varU16 == (ushort)param_3) && (pBVar1->varU16 == param_2)) {
          sub->highlight = i;
          return true;
        }
    }
  }
  return false;
}

u32 WidgetInvShop::GetNumber(){return WidgetN_Other;}