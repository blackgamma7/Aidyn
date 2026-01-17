#include "globals.h"
#include "widgets/WidgetTrainShop.h"
#include "widgets/ItemDetails.h"
#include "widgets/textPopup.h"

s32 stat_EXP_price=0;

WidgetStatTrain::WidgetStatTrain():WidgetTrainShop() {
  BaseWidget *pBVar1;

  this->partyPicker = gPartyPicker;
  this->TitleWidget = WidgetB8(BORG8_TitleStats);
  this->TitleWidget->SetCoords(0x9e,0x51);
  this->Link(this->TitleWidget);
  this->SetColor(COLOR_RED1);
  this->scrollMenu = NULL;
  this->expToSpendT = WClipTXT(gGlobals.CommonStrings[0x1fa]);
  this->Link(this->expToSpendT);
  Utilities::SetTextWidgetBoundsX(this->expToSpendT,0,640);
  this->expSpending = WClipTXT("000000000000");
  this->Link(this->expSpending);
  this->expRemaining = WClipTXT(gGlobals.CommonStrings[0x1fa]);
  this->Link(this->expRemaining);
  Utilities::SetTextWidgetBoundsX(this->expRemaining,0,640);
  this->expTotal = WClipTXT("000000000000");
  this->Link(this->expTotal);
  this->expTNL = WClipTXT(gGlobals.CommonStrings[0x1fc]);
  this->Link(this->expTNL);
  Utilities::SetTextWidgetBoundsX(this->expTNL,0,640);
  this->expPrice = WClipTXT("0000000000000");
  this->Link(this->expPrice);
  InitMenu();
}

WidgetStatTrain::~WidgetStatTrain(){WidgetMenu::~WidgetMenu();}

void WidgetStatTrain::InitMenu() {
  u16 uVar1;
  u16 uVar2;
  u16 uVar3;
  CharSheet *pCVar4;
  CharStats_s *pStats;
  byte bVar6;
  BaseWidget *pBVar7;
  u32 uVar12;
  int i;
  WSMSub *sub;
  u32 uVar14;
  WSMSub *pvVar14;
  
  bVar6 = gPartyPicker;
  uVar14 = 0;
  this->partyPicker = gPartyPicker;
  pCVar4 = PARTY->Members[gPartyPicker];
  pBVar7 = this->scrollMenu;
  CharStats_s *pStats = pCVar4->Stats;
  if (this->scrollMenu == NULL) {
    this->scrollMenu = new WidgetFastScrollMenu(STAT_TOTAL);
    sub=(WSMSub *)this->scrollMenu->substruct;
  }
  else {
    pvVar14 = (WSMSub *)this->scrollMenu->substruct;
    uVar14 = pvVar14->highlight;
    uVar1 = pvVar14->XOff;
    uVar2 = pvVar14->yOff;
    this->Unlink(this->scrollMenu);
    FREEQW(this->scrollMenu);
    this->scrollMenu = new WidgetFastScrollMenu(STAT_TOTAL);
    sub=(WSMSub *)this->scrollMenu->substruct;
    sub->XOff = uVar1;
    sub->yOff = uVar2;
  }
  this->scrollMenu->SetColors(0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
  this->Link(this->scrollMenu);
  for(i=0;i<STAT_TOTAL;i++) {
    if (i != STAT_LV) this->scrollMenu->Append(new SMStatItem(pStats,i));
  }
  uVar3 = sub->numChoices;
  uVar12 = uVar3;
  if (uVar3 != 0) {
    if (uVar14 != 0) {
      if ((int)(uVar3 - 1) < (int)uVar14) {
        sub->highlight = (u16)(uVar3 - 1);
      }
      else sub->highlight = (u16)uVar14;
    }
    sprintf(Utilities::GetWidgetText(this->expSpending),"%ld",pCVar4->EXP->spending);
    sprintf(Utilities::GetWidgetText(this->expTotal),"%ld",pCVar4->EXP->total);
    s32 TNL = Entity::GetEXPTNL(pCVar4);
    if (TNL == -1) 
      sprintf(Utilities::GetWidgetText(this->expPrice),gGlobals.CommonStrings[0x1fd]);
    else
      sprintf(Utilities::GetWidgetText(this->expPrice),"%ld",TNL - pCVar4->EXP->total);
    this->Tick();
    this->scrollMenu->Update();
  }
}

u32 WidgetStatTrain::unk(){return 0;}

Gfx* WidgetStatTrain::Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1){RENDERCHILDREN();}

u8 WidgetStatTrain::Tick() {
  WidgetTrainShop::Tick();
  this->expSpending->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
  this->expToSpendT->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
  this->expTotal->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
  this->expRemaining->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
  this->expPrice->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
  this->expTNL->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
  this->expToSpendT->SetCoords(this->posX,this->posY + this->scrollMenu->GetHeight() + 4);
  this->expSpending->SetCoords(this->posX + this->expToSpendT->GetWidth() + 4,this->expToSpendT->posY);
  this->expRemaining->SetCoords(this->posX,this->expSpending->posY + this->expSpending->GetHeight());
  this->expTotal->SetCoords(this->expSpending->posX,this->expRemaining->posY);
  this->expTNL->SetCoords(this->posX,this->expTotal->posY + this->expTotal->GetHeight());
  this->expPrice->SetCoords(this->expSpending->posX,this->expTNL->posY);
  Utilities::SetWidgetBounds(this->expSpending,this->boundX0,this->boundY0,this->boundX1,this->boundY1);
  Utilities::SetWidgetBounds(this->expToSpendT,this->boundX0,this->boundY0,this->boundX1,this->boundY1);
  Utilities::SetWidgetBounds(this->expTotal,this->boundX0,this->boundY0,this->boundX1,this->boundY1);
  Utilities::SetWidgetBounds(this->expRemaining,this->boundX0,this->boundY0,this->boundX1,this->boundY1);
  Utilities::SetWidgetBounds(this->expPrice,this->boundX0,this->boundY0,this->boundX1,this->boundY1);
  Utilities::SetWidgetBounds(this->expTNL,this->boundX0,this->boundY0,this->boundX1,this->boundY1);
  return this->TickChildren();
}

BaseWidget * WidgetStatTrain::AFunc() {return this->scrollMenu->AFunc();}


BaseWidget* WidgetStatTrain::CDownFunc() {
  BaseWidget* w=this->scrollMenu->AFunc();
  if (w) WHANDLE->AddWidget(new WidgetItemDetail((u16)w->varU8));
  return NULL;
}

u32 WidgetStatTrain::GetGoldPrice(u16 x){return 0;}


s32 WidgetStatTrain::GetExpPrice(u16 x) {
  s32 ret;
  BaseWidget* w=this->scrollMenu->AFunc();
  if(w){
    CharStats_s* st=PARTY->Members[this->partyPicker]->Stats;
    ret=-1;
    if(!CharStats::isStatCapped(st,w->varU8))
      ret=CharStats::GetTraningPrice(st,w->varU8);
  }
  else ret=0;
  return ret;
}

void WidgetStatTrain::Purchase(u16 unk,u8 statInd){
  CharSheet *chara = PARTY->Members[this->partyPicker];
  CharStats_s *stats = chara->Stats;
  u8 oldBase = CharStats::GetBase2(stats,statInd);
  if (CharStats::isStatCapped(stats,statInd)) {
    ErrPopup(gGlobals.CommonStrings[0x1fe]);
  }
  else {
    CharStats::AddBase(stats,statInd,1);
    if (CharStats::GetBase2(stats,statInd) == oldBase) {
      ErrPopup(gGlobals.CommonStrings[0x1fe]);
    }
    else {
      pause_Substruct *pSub = (pause_Substruct *)gGlobals.BigAssMenu->substruct;
      chara->EXP->spending-= stat_EXP_price;
      pSub->dollmenu->lists->UpdateMenus(this->partyPicker);
      pSub->dollmenu->lists->ShowEXPCosts();
      pSub->dollmenu->charStats_widget->Update(chara);
    }
  }
}

void WidgetStatTrain::Confirm(u16 x, u16 y) {
  CharSheet *pCVar3;
  CharStats_s *pCVar4;
  WidgetChoiceDia *pWVar6;
  BaseWidget *pBVar7;
 
  pCVar3 = PARTY->Members[this->partyPicker];
  BaseWidget* w = this->scrollMenu->AFunc();
  if (w) {
    pCVar4 = pCVar3->Stats;
    stat_EXP_price = CharStats::GetTraningPrice(pCVar4,w->varU8);
    if (CharStats::isStatCapped(pCVar4,w->varU8)) {
      ErrPopup(gGlobals.CommonStrings[0x1fe]);
    }
    else if (pCVar3->EXP->spending < stat_EXP_price) {
      Gsprintf(gGlobals.CommonStrings[0x1ff],stat_EXP_price);
      ErrPopup(gGlobals.text);
    }
    else {
      Color32 col1={COLOR_WHITE};
      Color32 col2={200,180,100,0xff};
      Gsprintf(gGlobals.CommonStrings[0x200],stat_EXP_price);
      pWVar6 = new WidgetChoiceDia(2,gGlobals.text,0x96,col1,col2,0,0,0);
      pBVar7 = WClipTXT(gGlobals.CommonStrings[0x1f]);
      pBVar7->AButtonFunc = WST_AButtonFunc;
      pBVar7->varU8 = w->varU8;
      pBVar7->varU16 = this->partyPicker;
      pWVar6->AppendScrollMenu(pBVar7);
      pBVar7 = WClipTXT(gGlobals.CommonStrings[0x20]);
      pWVar6->AppendScrollMenu(pBVar7);
      pWVar6->Update();
      WHANDLE->AddWidget(pWVar6);
    }
  }
}

u32 WidgetStatTrain::GetNumber(){return WidgetN_Other;}