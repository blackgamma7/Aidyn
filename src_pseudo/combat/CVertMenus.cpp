#include "combat/CombatStruct.h"
#include "widgets/CombatScrollMenu.h"
#include "globals.h"
#include "textPopup.h"

BaseWidget* gCombatCVertMenu=NULL;

extern BaseWidget * combat_text_No_use(char *param_1);

void init_combatSkill_itemValues(){
  init_combatSkillValues();
  init_combatItemValues();
}

void NOOP_80091404(){}

bool can_Combat_C_vert(controller_aidyn *cont){
  if (true) {//?
    switch(gGlobals.combatBytes[0]) {
    case 1:
    case 9:
    case 10:
    case 0xb:
    case 0x12:
    case 0x19:
      return combat_C_Up_Down(cont);
    }
  }
  return false;
}

void combat_control_case_0x16(controller_aidyn *cont){
  gCombatCVertMenu->Control(cont);
  if (((cont->input_2 | cont->input) & C_DOWN) == 0) Combat_CloseCVertMenu();
}

void combat_control_case_0x17(controller_aidyn *cont){
  gCombatCVertMenu->Control(cont);
  if (((cont->input_2 | cont->input) & C_UP) == 0) Combat_CloseCVertMenu();
}

Gfx * Combat_RenderCVertMenu(Gfx *G,u16 delta){
  if ((gCombatCVertMenu) &&
     (!FUN_80091dfc(gGlobals.widgetHandler,gCombatCVertMenu))) {
    RSPFUNC6(G);
    G = gCombatCVertMenu->Render(G,FULL_SCREENSPACE);
  }
  return G;
}

bool combat_C_Up_Down(controller_aidyn *cont){
  bool ret;
  
  if ((cont->input & C_UP) == 0) {
    ret = false;
    if ((cont->input & C_DOWN)) {
      combat_menu_C_down();
      ret = true;
    }
  }
  else {
    Combat_menu_C_Up();
    ret = true;
  }
  return ret;
}


void Combat_menu_C_Up(){
  bool bVar2;
  s32 asStack_e8 [32];
  u8 abStack_68 [64];
  s32 iStack_28;
  s32 iStack_24;
  s32 aiStack_20 [8];
  
  bVar2 = false;
  FUN_8008d2cc();
  gGlobals.combatBytes[0] = 0x17;
  if ((hasUsablePotions(asStack_e8)) || (gear_has_spell(&iStack_28,&iStack_24,aiStack_20,abStack_68))) {
    bVar2 = true;
  }
  if (bVar2) {
    gCombatCVertMenu = LoadCombatItems(iStack_28,iStack_24,aiStack_20[0],abStack_68,asStack_e8);
    gCombatCVertMenu->Tick();
  }
  else gCombatCVertMenu =combat_text_No_use("No potions or item spells available");
  if (gGlobals.playerDataArray[gCombatP->current_Ent->index])
    gGlobals.playerDataArray[gCombatP->current_Ent->index]->ani_type = 0;
}

void combat_menu_C_down(){
  bool bVar2;
  bool bVar4;
  s32 lVar3;
  u8 spells [64];
  bVar2 = false;
  s32 troub = 0;
  s32 hands = 0;
  s32 herbs = 0;
  FUN_8008d2cc();
  gGlobals.combatBytes[0] = 0x16;
  bVar4 = can_perform_or_heal(&troub,&hands,&herbs);
  lVar3 = can_use_spell(spells);
  if (bVar4) bVar2 = true;
  else if (lVar3) bVar2 = true;
  if (bVar2) {
    gCombatCVertMenu = InitCombatSkillsMenu(spells,troub,hands,herbs);
    gCombatCVertMenu->Tick();
  }
  else gCombatCVertMenu = combat_text_No_use("No spells or skills available");
  if (gGlobals.playerDataArray[gCombatP->current_Ent->index]) {
    gGlobals.playerDataArray[gCombatP->current_Ent->index]->ani_type = 0;
  }
}

void Combat_CloseCVertMenu(){
  gGlobals.combatBytes[0] = 1;
  if (FUN_80091dfc(gGlobals.widgetHandler,gCombatCVertMenu)) gCombatCVertMenu->SetState(WidgetS_Closing);
  else if (gCombatCVertMenu) gCombatCVertMenu->~BaseWidget();
  gCombatCVertMenu = NULL;
}

bool hasUsablePotions(s32 *list){
  bool ret = false;
  u32 i;
  for(i=0;i<17;i++){list[i] = -1;}
  u32 quant = PARTY->Inventory->GetMaxQuantity();
  for(i=0;i<quant;i++){
    Inventory_item* pIVar4 = PARTY->Inventory->GetItemEntry(i);
    u8 index;
    if ((((pIVar4) && (pIVar4->base.id >> 8 == DB_POTION)) &&
        (index = GETINDEX(pIVar4->base.id), 3 < index)) && (index != POTION_STEALTH)) {
      if (gCombatP->current_Ent->CanUsePotion(index)) {
        ret = true;
        list[index] = i;
      }
    }
  }
  return ret;
}

bool gear_has_spell(s32 *wep,s32 *armor,s32 *shield,u8 *gear){
  CharSheet *pCVar2;
  *wep = 0;
  *armor = 0;
  *shield = 0;
  CharSheet *pCVar2 = gCombatP->current_Ent->charSheetP;
  memset(gear,0,0xc);
  bool wepSpell = equip_has_spell(&pCVar2->weapons->base);
  if (wepSpell) *wep = true;
  bool ArmSpell = equip_has_spell(&pCVar2->armor[0]->base);
  if (ArmSpell) *armor = true;
  bool shSpell = equip_has_spell(&pCVar2->armor[1]->base);
  if (shSpell) *shield = true;
  bool ret = (shSpell) || ((ArmSpell) || (wepSpell));
  for(u32 i=0;i<12;i++) {
    if (equip_has_spell(&pCVar2->pItemList->pItem[i]->base)) {
      ret = true;
      gear[i] = true;
    }
  }
  return ret;
}

bool can_perform_or_heal(s32 *troub,s32 *hands,s32 *herb){
  *troub = false;
  *hands = false;
  *herb = false;
  s8 hasTroub = gCombatP->current_Ent->charSheetP->Skills->getModdedSkill(SKILL_Troubador);
  if (hasTroub) *troub = true;
  bool hasHands = Entity::HealHandsCheck(gCombatP->current_Ent->charSheetP);
  if (hasHands) *hands = true;
  bool hasHerbs = Entity::HealHerbsCheck(gCombatP->current_Ent->charSheetP);
  if (hasHerbs) *herb = true;
  return (hasHerbs) || ((hasHands) || (hasTroub));
}

u8 can_use_spell(u8 *param_1){ 
  memset(param_1,0,SPELLIND_TOTAL);
  SpellBook *book = gCombatP->current_Ent->charSheetP->spellbook;
  u8 ret = false;
  if ((book == NULL) || (book->count == 0)) return false;
  for(u32 i=0;i<book->count;i++){
    SpellInstance* sp=book->spells[i];
    if(sp){
      if((sp->cost==SPELLUSE_NONE)||(PARTY->Inventory->HasItem(TempSpell::GetIngredient(sp)))){
        if ((TerrainPointer->partOfDay == TIME_NIGHT) &&
          (GETINDEX((sp->base).id) == SPELLIND_photosynthesis)) continue;
        ret = true;
        param_1[i] = true;
      }
    }
  }
  return ret;
}

bool equip_has_spell(ItemInstance *item){
  if ((item)&&(item->spellCharge)) return item->spellCharge->Charges != 0;
  return false;
}

BaseWidget * combat_text_No_use(char *param_1){
  Color32 colA={COLOR_OFFWHITE};
  Color32 colB={50,50,50,150};
  BaseWidget *w = some_textbox_func(param_1,0x96,&colA,&colB,true);
  w->AButtonFunc = NULL;
  w->BButtonFunc = NULL;
  w->CDownButtonFunc = NULL;
  w->CUpButtonFunc = NULL;
  return w;
}

bool FUN_80091dfc(WidgetHandler *handle,BaseWidget *wTarget){
  BaseWidget *w = handle->head;
  while(1) {
    if (w == NULL) return false;
    if (w == wTarget) return true;
    w = w->siblingR;
  }
}