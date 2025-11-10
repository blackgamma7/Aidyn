#include "crafting/potion.h"
#include "widgets/ItemDetails.h"
#include "globals.h"

void makePotionMenu(u32 partyInd){
    WHANDLE->AddWidget(new WidgetPotionCraft(partyInd));
}

potionRecipie* get_potion_recipie(u8 ind){
    for(u32 i=0;i<ARRAY_COUNT(potionRecipies);i++){
        if(potionRecipies[i].ID==ind) return &potionRecipies[i];
    }
    return NULL;
}

bool check_potion_ingredient(u8 q, u16 ind){
    bool ret=true;
    if(q){
        s32 iInd=PARTY->Inventory->GetItemIndex(itemID_array[ind]);
        if(iInd==-1) ret=false;
        else ret = q <= PARTY->Inventory->GetItemQuantity(iInd);
    }
    return ret;
}


bool check_potion_ingredients(potionRecipie *rec) {
  bool ret = false;
  if (check_potion_ingredient(rec->gemstone,ItemInd_Gemstone)) {
    if (check_potion_ingredient(rec->herb,ItemInd_Herb)) {
      ret = check_potion_ingredient(rec->spice,ItemInd_Spice);
    }
    else ret = false;
  }
  return ret;
}

WidgetPotionCraft::WidgetPotionCraft(u32 partyind):WidgetCrafting(partyind){
  WidgetText* Wtxt=Utilities::AddTextWidget(this,Cstring(AlchemyMain),0x17,0x46,COLOR_RED1);
  Wtxt->SetCoords(93-(Wtxt->GetWidth()>>1),Wtxt->posY);
  s16 by0 = Wtxt->GetHeight()+70;
  this->scrollMenu=Utilities::AddScrollMenu(this,0xf,0x17,by0,0x17,by0,0xa3,by0 + 0x7a,COLOR_RED1,0);
  Utilities::SetScrollMenuColors(this->scrollMenu,0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
  s8 alch= PARTY->Members[this->partyIndex]->Skills->getModdedSkill(SKILL_Alchemist);
  for(u32 i=0;i<ARRAY_COUNT(potionRecipies);i++) {
    if (potionRecipies[i].alchemist <= alch) {
      Wtxt= WTextSafe(potion_names[potionRecipies[i].ID]);
      this->scrollMenu->Append(Wtxt);
      Wtxt->varU16 = i;
    }
  }
}

BaseWidget* WidgetPotionCraft::AFunc(){
  char *apcStack_98 [2];
  char *pcStack_58;
  char *pcStack_54;
  
  if (this->scrollMenu == NULL) {
    this->SetState(WidgetS_Closing);
    return NULL;
  }
  potionRecipie *recipie = potionRecipies + (byte)Utilities::GetHighlightedEntry(this->scrollMenu)->varU16;
  bool success = false;
  if (!check_potion_ingredients(recipie)) {
    this->TextPopup(NotEnoughString(recipie->ID));
    return NULL;
  }
  s32 invInd=PARTY->Inventory->GetItemIndex(IDPotion(recipie->ID));
  if ((invInd== -1)||(PARTY->Inventory->GetItemQuantity(invInd) < 99)) {
    success = PARTY->CraftPotion(this->partyIndex,recipie->ID);
  }
  pcStack_58 = FailString(recipie->ID);
  pcStack_54 = CraftedString(recipie->ID);
  apcStack_98[1] = pcStack_54;
  apcStack_98[0] = pcStack_58;
  this->TextPopup(apcStack_98[success]);
  return NULL;
}

BaseWidget * WidgetPotionCraft::CDownFunc() {
  if (this->scrollMenu) {
    ItemInstance pot;
    pot.InitItem(IDPotion(potionRecipies[
      Utilities::GetHighlightedEntry(this->scrollMenu)->varU16].ID));
    WHANDLE->AddWidget(new WidgetItemDetail(&pot));
    pot.RemoveStatSpell();
  }
  return NULL;
}

char * WidgetPotionCraft::FailString(u8 pot) {
  char *msg [2];  
  
  msg[0] = Cstring(AlchemyFlaskFail);
  msg[1] = Cstring(AlchemyPotionFail);
  return msg[pot < POTION_HEALING];
}

char * WidgetPotionCraft::CraftedString(u8 pot) {
  char *msg [2];
  
  msg[0] = Cstring(AlchemyFlaskSuccess);
  msg[1] = Cstring(AlchemyPotionSuccess);
  return msg[pot < POTION_HEALING];
}

char * WidgetPotionCraft::NotEnoughString(u8 pot) {
  char *msg [2];
  
  msg[0] = Cstring(AlchemyFlaskComponents);
  msg[1] = Cstring(AlchemyPotionComponents);
  return msg[pot < POTION_HEALING];
}

WidgetPotionCraft::~WidgetPotionCraft(){
    WidgetMenu::~WidgetMenu();
}