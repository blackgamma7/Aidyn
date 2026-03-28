#include "globals.h"
#include "widgets/textPopup.h"
#include "widgets/itemDetails.h"
#include "crafting/armor.h"

void makeArmorMenu(u32 param_1) {
  if (CanMakeArmor(param_1)) {
    WHANDLE->AddWidget(new WidgetArmorCraft(param_1));
  }
  else {
    ErrPopup(Cstring(ArmorcraftComponents));
  }
}

bool CanMakeArmor(u32 param_1) {
  CharSheet *chara = (gGlobals.party)->Members[param_1];
  if (chara) {
    for(u32 i=0;i<ARRAY_COUNT(ArmorRecipies);i++){
        ArmorCraftRecipie *pAVar5 = &ArmorRecipies[i];
      if ((PARTY->Inventory->HasItem(gItemDBp->Gear[pAVar5->item].ID)) &&
         pAVar5->Mechanic <= chara->Skills->capSkillBaseMax(SKILL_Mechanic)) {
        return true;
      }
    }
  }
  return false;
}

WidgetArmorCraft::WidgetArmorCraft(u32 partyind):WidgetCrafting(partyind) {
  WidgetText *pBVar3 = Utilities::AddTextWidget(this,Cstring(ArmorcraftMain),0x17,0x46,COLOR_RED1);
  pBVar3->SetCoords(93 - (pBVar3->GetWidth() >> 1),pBVar3->posY);
  s16 by0 = (pBVar3->GetHeight() + 70);
  this->scrollMenu = Utilities::AddScrollMenu(this,5,0x17,by0,0x17,by0,0xa3,by0 + 0x75,COLOR_RED1,0);
  Utilities::SetScrollMenuColors(this->scrollMenu,COLOR_BROWN2,COLOR_PURPLE1,0x14);
  CharSheet *chara = PARTY->Members[partyind];
  for(u32 i=0;i<ARRAY_COUNT(ArmorRecipies);i++){
    ArmorCraftRecipie * r=&ArmorRecipies[i];
    if ((PARTY->Inventory->HasItem(gItemDBp->Gear[r->item].ID)) &&
       (r->Mechanic <= chara->Skills->capSkillBaseMax(SKILL_Mechanic))) {
      pBVar3 = WTextSafe(gArmorDBp->Armor[r->armor].name);
      this->scrollMenu->Append(pBVar3);
      pBVar3->varU16 = (u16)i;
    }
  }
}

BaseWidget * WidgetArmorCraft::AFunc() {
  
  WidgetScrollMenu* scroll = this->scrollMenu;
  if (scroll == NULL) this->SetState(WidgetS_Closing);
  else {
    u8 index = Utilities::GetHighlightedEntry(scroll)->varU16;
    bool succeded = PARTY->CraftArmor(this->partyIndex,gArmorDBp->Armor[index].ID,
                     gItemDBp->Gear[ArmorRecipies[index].item].ID,ArmorRecipies[index].stam);
    char* apcStack144[2] = {Cstring(ArmorcraftFail),Cstring(ArmorcraftSuccess)};
    this->TextPopup(apcStack144[succeded]);
  }
  return NULL;
}

BaseWidget * WidgetArmorCraft::CDownFunc() {
  ArmorInstance AStack_48;
  
  if (this->scrollMenu) {
    u8 index = Utilities::GetHighlightedEntry(this->scrollMenu)->varU16;
    make_temp_armor_3(&AStack_48,gArmorDBp->Armor[index].ID);
    WHANDLE->AddWidget(new WidgetItemDetail(&AStack_48));
    ArmorInstance_ClearEffect(&AStack_48);
  }
  return NULL;
}

WidgetArmorCraft::~WidgetArmorCraft(){WidgetMenu::~WidgetMenu();}
