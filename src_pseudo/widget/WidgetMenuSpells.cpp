#include "globals.h"

WidgetMenuSpells::WidgetMenuSpells(DollMenuLists * param_2,u8 param_3):WidgetMenu()
{InitMenu(param_2,param_3);}

WidgetMenuSpells::~WidgetMenuSpells() {
  if (gGlobals.shopSkills) {
    delete gGlobals.shopSkills;
    gGlobals.shopSkills = NULL;
  }
  if (gGlobals.ShopSpells) {
    gGlobals.ShopSpells->Clear();
    delete gGlobals.ShopSpells;
    gGlobals.ShopSpells = NULL;
  }
  this->aniHandle.~GuiAnimationManager();
  WidgetMenu::~WidgetMenu();
}

void WidgetMenuSpells::InitMenu(DollMenuLists *list,u8 sel) {
  this->lists = list;
  this->selected = sel;
  this->count = 0;
  this->partyPicker = gPartyPicker;
  WidgetBorg8* pBVar3 = WidgetB8(0xe4);
  pBVar3->SetCoords(5,0x3c);
  this->Link(pBVar3);
  this->background = WidgetB8(0xe2);
  this->background->SetCoords(0,58);
  this->Link(this->background);
  pBVar3 = WidgetB8(BORG8_TitleTrain);
  pBVar3->SetCoords(90 - (s16)(pBVar3->GetWidth() >> 1),86 - (s16)pBVar3->GetHeight());
  this->Link(pBVar3);
  this->spells = new WidgetSpellTrain(true);
  this->SpellSkills[this->count++] = this->spells;
  this->Link(this->spells);
  this->skills = new WidgetSkillTrain(true);
  this->SpellSkills[this->count++] = this->skills;
  this->Link(this->skills);
  this->SpellSkills[this->selected]->SetCoords(20,88);
  if (this->count <= this->selected) this->selected = 0;
  for(u32 i = 0;i<this->count;i++){
      if (i != this->selected) this->SpellSkills[i]->SetCoords(-120,88);
      this->SpellSkills[i]->boundX0 = 20;
      this->SpellSkills[i]->boundX1 = 157;
      this->SpellSkills[i]->boundY0 = 88;
      this->SpellSkills[i]->boundY1 = 166;
      this->SpellSkills[i]->Tick();
      this->SpellSkills[i]->scrollMenu->Update();
  }
  this->expCost = new WidgetClipText(NULL,20);
  this->expCost->SetColor(COLOR_RED1);
  this->expCost->SetCoords(30,0xa9);
  this->Link(this->expCost);
  this->expRemain = new WidgetClipText(NULL,20);
  this->expRemain->SetColor(COLOR_RED1);
  this->expRemain->SetCoords(30,this->expCost->posY + this->expCost->GetHeight());
  this->Link(this->expRemain);
  this->goldCost = new WidgetClipText(NULL,20);
  this->goldCost->SetColor(COLOR_RED1);
  this->goldCost->SetCoords(30,this->expRemain->posY + this->expRemain->GetHeight());
  this->Link(this->goldCost);
  GetPrices();
}

void WidgetMenuSpells::GetPrices() {
  BaseWidget* uVar3=this->SpellSkills[this->selected]->AFunc();
  this->partyPicker = gPartyPicker;
  if (!uVar3) {
    sprintf(Utilities::GetWidgetText(this->expCost)," ");
    sprintf(Utilities::GetWidgetText(this->goldCost)," ");
  }
  else {
    s32 exp = this->lists->menus[this->lists->menuIndex]->GetExpPrice(uVar3->varU16);
    s32 gold = this->lists->menus[this->lists->menuIndex]->GetGoldPrice(uVar3->varU16);
    if (exp == -1)
      sprintf(Utilities::GetWidgetText(this->expCost),gGlobals.CommonStrings[0x1ed]);
    else
      sprintf(Utilities::GetWidgetText(this->expCost),gGlobals.CommonStrings[0x1ee],exp);
    if (gGlobals.playerCharStruct.current_shopkeep == IDEntInd(EntInd_Oriana))
      sprintf(Utilities::GetWidgetText(this->goldCost)," ");
    else sprintf(Utilities::GetWidgetText(this->goldCost),gGlobals.CommonStrings[0x208],gold);
  }
  sprintf(Utilities::GetWidgetText(this->expRemain),gGlobals.CommonStrings[0x1ef],
              PARTY->Members[this->partyPicker]->EXP->spending);
}

Gfx * WidgetMenuSpells::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1) {
  SlimFont;
  g = RenderChildren(g,x0,y0,x1,y1);
  NormalFont;
  return g;
}

u8 WidgetMenuSpells::Tick() {
  SlimFont;
  this->aniHandle.Tick(1);
  u8 bVar1 = TickChildren();
  NormalFont;
  return bVar1;
}

u32 WidgetMenuSpells::isAnimating() {return this->aniHandle.present;}

void WidgetMenuSpells::setPartyPicker() {this->partyPicker = gPartyPicker;}

void WidgetMenuSpells::DHorizontal(u8 dir) {
  u8 uVar2;
  s16 asStack_28 [20];
  
  if (!isAnimating()) {
    s16 sVar6 = 140;
    if (dir == 0) {
      uVar2 = ((u32)this->selected + (u32)this->count + 1) % (u32)this->count;
    }
    else {
      uVar2 = (int)((u32)this->selected + (u32)this->count + -1) % (int)(u32)this->count;
      sVar6 = -140;
    }
    this->SpellSkills[uVar2]->posX = 20 - sVar6;
    this->aniHandle.AddItem(new GuiAnimatorS16(&this->SpellSkills[uVar2]->posX,
                        &this->SpellSkills[this->selected]->posX,20,
                        &double_array_0));
    asStack_28[0] = sVar6 + this->SpellSkills[this->selected]->posX;
    this->aniHandle.AddItem(new GuiAnimatorS16(&this->SpellSkills[this->selected]->posX,asStack_28,20,&double_array_0));
    this->selected = (byte)uVar2;
    GetPrices();
    SetHighlight();
  }
}

void WidgetMenuSpells::SetHighlight() {
  u16 h;
  
  WSMSub *sub = (WSMSub *)this->SpellSkills[this->selected]->scrollMenu->substruct;
  BaseWidget *w = this->lists->menus[this->lists->menuIndex]->scrollMenu->AFunc();
  if (w) {
    w->SetColor(COLOR_RED1);
    w->Tick();
  }
  if (sub->numChoices == 0) h = -1;
  else h = sub->items[sub->highlight]->varU16;
  this->lists->menus[this->lists->menuIndex]->SetHighlight(h);
}

u32 WidgetMenuSpells::GetNumber(){return WidgetN_Other;}