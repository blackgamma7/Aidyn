#include "globals.h"

WidgetDollMenu::WidgetDollMenu(u8 param_2,u8 param_3):WidgetMenu() {
    InitMenu(param_2,param_3);}


u32 WidgetDollMenu::InitMenu(u8 param_2,u8 param_3) {

  this->spells_widget = NULL;
  this->itemslots_widget = NULL;
  this->barter_widget = NULL;
  while(!PARTY->Members[gPartyPicker]){
    if(!gPartyPicker)  CRASH("DollMenu::InitMenu","Party member not found.");
    gPartyPicker--;
  }
    this->portraits = new DollMenuPortraits(PARTY,PARTY->PartySize,gPartyPicker);
    this->Link(this->portraits);
    this->charStats_widget = new WidgetHealthGold(PARTY->Members[gPartyPicker]);
    this->Link(portraits);
    if (DefaultPauseState || CombatPauseState) {
      this->itemslots_widget = new DollEquipmentMenu(PARTY->Members[gPartyPicker]);
      this->Link(this->itemslots_widget);
    }
    this->lists = new DollMenuLists(this->itemslots_widget,param_3);
    this->Link(this->lists);
    if (gGlobals.pauseMenuState == PauseMenuState_Train) {
      this->spells_widget = new WidgetMenuSpells(this->lists,1);
      this->Link(spells_widget);
    }
    if (BarterPauseState) {
      this->barter_widget = new WidgetBarter(this->lists->invMenu,gGlobals.Shopkeep);
      this->Link(barter_widget);
    }
    if (this->spells_widget) this->spells_widget->SetHighlight();
    if (DefaultPauseState) {
      WidgetBorg8 *w = WidgetB8(BORG8_SliderArrowLR);
      w->SetColor(COLOR_RED1);
      w->SetCoords(126,207);
      this->Link(w);
    }
    else if (CombatPauseState) {
      WidgetBorg8 *w = WidgetB8(BORG8_SliderArrowL);
      w->SetColor(COLOR_RED1);
      w->SetCoords(126,207);
      this->Link(w);
    }
  return Controller::GetDelay(0);
}

Gfx * WidgetDollMenu::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1) {
  if (gOptionsMenuContPak == 0) g = RenderChildren(g,x0,y0,x1,y1);
  return g;
}

u8 WidgetDollMenu::Tick() {
  if (gOptionsMenuContPak == 0) return TickChildren();
  else return WidgetS_Running;
}


bool WidgetDollMenu::IsAnimated() {
  if ((this->portraits->AnimationCount() == 0) && ((this->charStats_widget->unk90).present == 0)) {
    if (this->itemslots_widget) {
      if ((this->itemslots_widget->unk7c).present != 0) {
        return true;
      }
    }
    if (((this->spells_widget == NULL) || (this->spells_widget->isAnimating() == 0)) &&
       (this->lists->m80038bc0() == 0)) {
      return false;
    }
  }
  return true;
}


void WidgetDollMenu::CHorizontal(u8 dir) {
  if ((!IsAnimated()) && (1 < PARTY->PartySize)) {
    if (dir == 0) gPartyPicker = gPartyPicker+1 % PARTY->PartySize;
    else if (dir == 1) gPartyPicker = gPartyPicker-1 % PARTY->PartySize;
    this->portraits->SchoolAspectIcons(dir);
    this->charStats_widget->Update(PARTY->Members[gPartyPicker]);
    this->lists->UpdateMenus(gPartyPicker);
    if (this->lists->invMenu) this->lists->invMenu->SortA();
    if (this->itemslots_widget)
      this->itemslots_widget->GetSlotIcons(PARTY->Members[gPartyPicker]);
    if (this->spells_widget) {
      this->spells_widget->SetHighlight();
      this->spells_widget->GetPrices();
    }
    this->lists->ShowEXPCosts();
    PlayAudioSound(&gGlobals.SFXStruct,0x739,0,1.0,0x3c,0);
  }
}

u32 WidgetDollMenu::GetNumber(){return WidgetN_Other;}