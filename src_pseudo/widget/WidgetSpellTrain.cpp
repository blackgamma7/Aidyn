#include "globals.h"
#include "widgets/ItemDetails.h"
#include "widgets/textPopup.h"
#include "widgets/menuPrompt.h"

s32 exp_magic_price=0;
s32 gold_magic_price=0;

WidgetSpellTrain::WidgetSpellTrain(bool hideTitle):WidgetTrainShop() {
  this->isTraining = hideTitle;
  this->partyPicker = gPartyPicker;
  if (hideTitle) this->TitleWidget = NULL;
  else {
    this->TitleWidget = WidgetB8(BORG8_TitleSpells);
    this->TitleWidget->SetCoords(158,81);
    this->Link(this->TitleWidget);
  }
  BaseWidget::SetColor(COLOR_RED1);
  this->scrollMenu = NULL;
  InitMenu();
}

WidgetSpellTrain::~WidgetSpellTrain(){
  WidgetMenu::~WidgetMenu();
}

void WidgetSpellTrain::InitMenu() {
  u16 uVar1;
  u16 uVar2;
  u16 uVar3;
  ItemID IVar4;
  u32 uVar5;
  BaseWidget *pBVar9;
  SpellInstance **ppSVar11;
  WSMSub *pvVar13;
  u32 count;
  u32 uVar14;
  WSMSub *pvVar8;
  
  count = 0;
  this->partyPicker = gPartyPicker;
  SpellBook *spells = gGlobals.ShopSpells;
  if (!this->isTraining)
    spells = PARTY->Members[this->partyPicker]->spellbook;
  if (spells) count = (u32)spells->count;
  pBVar9 = this->scrollMenu;
  uVar14 = 0;
  if (this->scrollMenu == NULL) {
    this->scrollMenu = new WidgetFastScrollMenu(count);
    pvVar13 = (WSMSub *)this->scrollMenu->substruct;
  }
  else {
    pvVar8 = (WSMSub *)this->scrollMenu->substruct;
    uVar14 = (u32)pvVar8->highlight;
    uVar1 = pvVar8->XOff;
    uVar2 = pvVar8->yOff;
    this->Unlink(this->scrollMenu);
    FREEQW(this->scrollMenu);
    this->scrollMenu = new WidgetFastScrollMenu(count);
    pvVar13 = (WSMSub *)this->scrollMenu->substruct;
    pvVar13->XOff = uVar1;
    pvVar13->yOff = uVar2;
  }
  this->scrollMenu->SetColors(0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
  this->Link(this->scrollMenu);
  WidgetTrainShop::SetArrows();
  for(u32 i=0;i<count;i++){
   SpellInstance *spell = spells->spells[i];
   if (spell) {
    WidgetSpellEntry *entry=new WidgetSpellEntry(spell);
    this->scrollMenu->Append(entry);
    entry->varU8 = i;
    entry->varU16 = (spell->base).id;
   }
  }
  uVar3 = pvVar13->numChoices;
  if (uVar3 != 0) {
    if (uVar14 != 0) {
      if ((int)(uVar3 - 1) < (int)uVar14) {
        pvVar13->highlight = 0;
        pvVar13->yOff = 0;
        pvVar13->unk16 = 0;
      }
      else pvVar13->highlight = (u16)uVar14;
    }
    this->Tick();
    this->scrollMenu->Update();
  }
}

u32 WidgetSpellTrain::unk(){return 0;}

Gfx* WidgetSpellTrain::Render(Gfx* g, u16 x0,u16 y0, u16 x1, u16 y1){RENDERCHILDREN();}

u8 WidgetSpellTrain::Tick(){
  WidgetTrainShop::Tick();
  return TickChildren();
}

BaseWidget* WidgetSpellTrain::AFunc(){
    this->scrollMenu->AFunc();
    return NULL;
}


BaseWidget* WidgetSpellTrain::CDownFunc() {
  SpellBook *pSVar4;
  u8 abStack_20 [32];
  
  CharSheet *pCVar3 = PARTY->Members[this->partyPicker];
  BaseWidget *uVar6 = this->scrollMenu->AFunc();
  if (uVar6) {
    if (this->isTraining == 0) {
      pCVar3->spellbook->HaveSpell(uVar6->varU16,abStack_20);
      pSVar4 = pCVar3->spellbook;
    }
    else {
      gGlobals.ShopSpells->HaveSpell(uVar6->varU16,abStack_20);
      pSVar4 = gGlobals.ShopSpells;
    }
    SpellInstance *pSVar5 = pSVar4->spells[abStack_20[0]];
    if (pSVar5) WHANDLE->AddWidget(new WidgetItemDetail(pSVar5));
  }
  return NULL;
}


u32 WidgetSpellTrain::GetGoldPrice(u16 id) {
  CharSheet *pCVar1;
  u32 uVar2;
  u8 abStack_10 [16];
  
  pCVar1 = PARTY->Members[this->partyPicker];
  if (pCVar1->spellbook->HaveSpell(id,abStack_10)) {
    uVar2 = TempSpell::GetGoldPrice(pCVar1->spellbook->spells[abStack_10[0]]);
  }
  else uVar2 = 200;
  return uVar2;
}

s32 WidgetSpellTrain::GetExpPrice(u16 id) {
  SpellInstance *pSVar3;
  s32 price;
  u8 abStack_20 [24];
  
  CharSheet *pCVar2 = PARTY->Members[this->partyPicker];
  float fVar7 = 0.8f;
  if (BattleResultsState) fVar7 = 1.0f;
  if (gGlobals.ShopSpells->HaveSpell(id,abStack_20)) {
    pSVar3 = pCVar2->spellbook->spells[abStack_20[0]];
    price = TempSpell::GetExpPrice(pSVar3) * fVar7;
    if (TempSpell::IsMaxRank(pSVar3)) price = -1;
  }
  else {
    gGlobals.ShopSpells->HaveSpell(id,abStack_20);
    pSVar3 = (gGlobals.ShopSpells)->spells[abStack_20[0]];
    u8 bVar1 = pSVar3->level;
    pSVar3->level = 0;
    price = TempSpell::GetExpPrice(pSVar3) * fVar7;
    pSVar3->level = bVar1;
  }
  return price;
}

bool shopkeepNotOriana(void) {
  return gGlobals.playerCharStruct.current_shopkeep != IDEntInd(Oriana);}

void WidgetSpellTrain::Purchase(u16 param_2,u8 x) {
  CharSheet *pCVar1;
  SpellBook *spellbook;
  SpellInstance *pSVar2;
  WidgetMenuSpells *spells;
  WidgetDollMenu *pWVar4;
  bool bVar9;
  bool bVar10;
  void *pvVar7;
  BaseWidget *pBVar8;
  u8 auStack_b0 [8];

  bool newSpell = false;
  pCVar1 = PARTY->Members[this->partyPicker];
  spellbook = pCVar1->spellbook;
  auStack_b0[0] = 0;
  bVar10 = gGlobals.pauseMenuState != PauseMenuState_AfterBattle;
  if (pCVar1->spellbook->HaveSpell(param_2,auStack_b0)) {
    pSVar2 = spellbook->spells[auStack_b0[0]];
    if (TempSpell::IsMaxRank(pSVar2)) {
      ErrPopup(gGlobals.CommonStrings[552]);
      return;
    }
    pSVar2->level++;
  }
  else {
    newSpell = true;
    pCVar1->spellbook->NewSpell(param_2,1);
  }
  pCVar1->EXP->spending -= exp_magic_price;
  if (bVar10) PARTY->Gold-= gold_magic_price;
  pause_Substruct *ppVar3 = PauseSub;
  ppVar3->dollmenu->lists->UpdateMenus(this->partyPicker);
  if (ppVar3->dollmenu->spells_widget == NULL) {
    ppVar3->dollmenu->lists->ShowEXPCosts();
  }
  else {
    ppVar3->dollmenu->spells_widget->SetHighlight();
    ppVar3->dollmenu->spells_widget->GetPrices();
  }
  sprintf(Utilities::GetWidgetText(ppVar3->dollmenu->charStats_widget->GoldText),"%ld",PARTY->Gold);
  ppVar3->dollmenu->charStats_widget->Update(pCVar1);
  if ((newSpell) && (!getEventFlag(FLAG_LearnedFirstSpell))) {
    setEventFlag(FLAG_LearnedFirstSpell,true);
    WHANDLE->AddWidget(new WidgetMenuPrompt(gGlobals.CommonStrings[497],23,70,COLOR_RED1));
  }
}

void WidgetSpellTrain::Confirm(u16 id,u16 lv) {
  CharSheet *pCVar2;
  bool bVar6;
  int iVar3;
  float fVar9;
  float discount;
  double dVar11;
  u8 abStack_3c0 [8];
  int notOriana;
  
  gold_magic_price = 0;
  exp_magic_price = 0;
  pCVar2 = PARTY->Members[this->partyPicker];
  notOriana = shopkeepNotOriana();
  s8 wiz = pCVar2->Skills->capSkillBaseMax(SKILL_Wizard);
  if (wiz == -1) {
    ErrPopup(gGlobals.CommonStrings[498]);
    return;
  }
  bool afterBattle=BattleResultsState;
  float discount = 0.8f;
  if (afterBattle) discount = 1.0f;
  if (pCVar2->spellbook->HaveSpell(id,abStack_3c0)) {
    SpellInstance *sp1 = pCVar2->spellbook->spells[abStack_3c0[0]];
    if (lv <= sp1->level) {
      ErrPopup(gGlobals.CommonStrings[499]);
      return;
    }
    if (TempSpell::IsMaxRank(sp1)) {
      ErrPopup(gGlobals.CommonStrings[552]);
      return;
    }
    gold_magic_price = TempSpell::GetGoldPrice(sp1);
    exp_magic_price = (float)TempSpell::GetExpPrice(sp1)*discount;
  }
  else {
    gGlobals.ShopSpells->HaveSpell(id,abStack_3c0);
    SpellInstance *sp0 = (gGlobals.ShopSpells)->spells[abStack_3c0[0]];
    if (wiz < sp0->wizard) {
      ErrPopup(gGlobals.CommonStrings[500]);
      return;
    }
    u8 school = pCVar2->EXP->school;
    if (((school != SCHOOL_Chaos) && (sp0->school != SCHOOL_NONE)) && (school != sp0->school)) {
      ErrPopup(gGlobals.CommonStrings[0x1f5]);
      return;
    }
    gold_magic_price = 200;
    wiz = sp0->level;
    sp0->level = 0;
    exp_magic_price = (float)TempSpell::GetExpPrice(sp0) * discount;
    sp0->level = wiz;
  }
  if (!notOriana) gold_magic_price = 0;
  if (afterBattle) {
    if (exp_magic_price <= pCVar2->EXP->spending) {
      gold_magic_price = 0;
      goto confirmPurchase;
    }
    Gsprintf(gGlobals.CommonStrings[0x1f7]);
  }
  else {
    if ((exp_magic_price <= pCVar2->EXP->spending) && (gold_magic_price <= PARTY->Gold))
    {
confirmPurchase:
      if (gold_magic_price == 0) Gsprintf(gGlobals.CommonStrings[0x1f9],exp_magic_price);
      else Gsprintf(gGlobals.CommonStrings[0x1f8],exp_magic_price,gold_magic_price);
      Color32 aCStack_78={200,180,100,0xff};
      Color32 aCStack_b8={COLOR_WHITE};
      WidgetChoiceDia *pWVar4 = new WidgetChoiceDia(2,gGlobals.text,150,&aCStack_b8,&aCStack_78,0,0,0);
      WidgetClipText* pBVar5 = WClipTXT(gGlobals.CommonStrings[31]);
      pBVar5->AButtonFunc = WST_AButtonFunc;
      pBVar5->varU16 = (u16)id;
      pBVar5->varU8 = abStack_3c0[0];
      pWVar4->AppendScrollMenu(pBVar5);
      pWVar4->AppendScrollMenu(WClipTXT(gGlobals.CommonStrings[32]));
      pWVar4->Update();
      WHANDLE->AddWidget(pWVar4);
      return;
    }
    if (!notOriana) Gsprintf(Cstring(SpellExpGCost),exp_magic_price);
    else Gsprintf(Cstring(SpellExpGCost),exp_magic_price,gold_magic_price);
  }
  ErrPopup(gGlobals.text);
}
//replace character in string? unused.
void Ofunc_8004134c(char *str,char ch0,char ch1) {
  while (*str) {
    if (*str == ch0) *str = ch1;
    str++;
  }
}

u32 WidgetSpellTrain::GetNumber(){return WidgetN_Other;}