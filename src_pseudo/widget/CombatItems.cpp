#include "widgets/CombatScrollMenu.h"
#include "globals.h"
#include "combat/CombatStruct.h"
#include "quicksort.h"

s8 gCombatItemSelections[]={-1,-1,-1,-1};

WidgetCombatItems * LoadCombatItems(s32 showWeapon,s32 showShield,s32 ShowArmor,u8 *gear,s32 *potions){
  return new WidgetCombatItems(showWeapon,ShowArmor,showShield,gear,potions);
}

BaseWidget * FUN_80092894(BaseWidget *param_1,BaseWidget *param_2){
  CombatEntity *pCVar1 = gCombatP->current_Ent;
  FUN_8006f8d8(pCVar1,param_2->var5E,param_2->var5C);
  gGlobals.combatBytes[0] = 9;
  FUN_8007272c(gCombatP->substruct2,pCVar1);
  return NULL;
}

BaseWidget * FUN_80092894(BaseWidget *param_1,BaseWidget *param_2){
    gCombatP->current_Ent->charSheetP->spellSwitch=param_2->var5E;
    gCombatP->current_Ent->charSheetP->currSpell=param_2->var5C;
    FUN_8008d56c();
    return NULL;
}

WidgetCombatItems::WidgetCombatItems(s32 showWeapon,s32 showShield,s32 ShowArmor,u8 *gear,s32 *potions):
WidgetChild8(32,120,gExpPakFlag?95:55,0,0){
  ushort iconSize;
  CombatEntity *pCVar1;
  CharSheet *pCVar2;
  Borg8Header *pBVar5;
  WidgetGroup *w;
  u16 wMax;
  int iVar6;
  BaseWidget *pBVar7;
  BaseWidget *pBVar8;
  ulong uVar9;
  WidgetChild0 *pWVar10;
  longlong lVar11;
  longlong lVar12;
  uint i;
  Color32 aCStack_68 [26];
  
  wMax = 0x78;
  i = 0;
  pCVar1 = gCombatP->current_Ent;
  pCVar2 = pCVar1->charSheetP;
  aCStack_68[0].R = 0;
  aCStack_68[0].G = 200;
  aCStack_68[0].B = 0;
  aCStack_68[0].A = 0xe1;
  pBVar5 = loadBorg8(BORG8_IconItemPotion);
  u16 iconSize = (pBVar5->dat).Width;
  borg8_free(pBVar5);
  for(i=0;i<POTION_STEALTH+1;i++){
    if (potions[i] != -1) {
      w = char_func_icon(potion_names[i],FUN_80092894,(short)i + 0x1000,(char)potions[i],
                         aCStack_68,BORG8_IconItemPotion,iconSize);
      wMax = MaxWidgetWidth(w,wMax);
      AppendScrollMenu(w);
    }
  }
  if (showWeapon)
    wMax = AddItem(&pCVar2->weapons->base,FUN_800928f8,4,0,wMax,iconSize);
  if (showShield)
    wMax = AddItem(&pCVar2->armor[1]->base,FUN_800928f8,3,0,wMax,iconSize);
  if (ShowArmor)
    wMax = AddItem(&(*pCVar2->armor)->base,FUN_800928f8,2,0,wMax,iconSize);
  for(i=0;i<GEARTOTAL;i++){
    if (gear[i] != 0) {
      wMax = AddItem(&pCVar2->pItemList->pItem[i]->base,FUN_800928f8,5,(char)i,wMax,iconSize);
    }
  }
  FUN_800bbfc8(this->scrollMenu,3);
  m8004de18();
  iVar6 = find_char_in_party(pCVar2);
  WidgetBorg8* pBVar6 = WidgetB8(0x38D0);
  WidgetBorg8* pBVar7 = WidgetB8(0x38CF);
  pBVar6->SetCoords(this->scrollMenu->x + -8,(this->scrollMenu->y - (short)pBVar6->GetHeight()) -2);
  pBVar7->SetCoords(this->scrollMenu->x + -8,this->scrollMenu->boundY1 + 2);
  this->wc0 =new WidgetChild0(this->scrollMenu,pBVar6,pBVar7,0);
  this->wc0->SetColor(COLOR_WHITE);
  this->scrollMenu->Link(this->wc0);
  s8 lVar11 = gCombatItemSelections[iVar6];
  if (lVar11 != -1) {
    WSMSub* s = (WSMSub*)this->scrollMenu->substruct;
    s8 lVar10 = s->currentCount-1;
    if (lVar10 < lVar11) lVar11 = lVar10;
    s->highlight=lVar11;
    this->scrollMenu->Tick();
    s->field11_0x12=s->field14_0x16;
  }
}

WidgetCombatItems::~WidgetCombatItems(){
  Utilities::GetHighlightedEntry(this->scrollMenu)->AFunc();
  gCombatItemSelections[find_char_in_party(gCombatP->current_Ent->charSheetP)] = (u8)((WSMSub*)this->scrollMenu->substruct)->highlight;
  this->var5C = 0;
  this->scrollMenu->Unlink(this->wc0);
  WidgetChild8::~WidgetChild8();
}

BaseWidget* WidgetCombatItems::AFunc(){return NULL;}
BaseWidget* WidgetCombatItems::BFunc(){return NULL;}


u16 WidgetCombatItems::AddItem(ItemInstance *param_2,BaseWidget *(*UseFunc)(BaseWidget*,BaseWidget*),u16 param_4,u8 param_5,u16 param_6,u16 param_7){
  SpellCharges *pSVar1;
  SpellInstance *pSVar2;
  WidgetGroup *w;
  Color32 uStack104;
  u32 BStack_28;
  u32 aEStack40;
  
  if ((((param_2 != NULL) && (pSVar1 = param_2->spellCharge, pSVar1 != NULL)) &&
      (pSVar1->Charges != 0)) && (pSVar2 = pSVar1->Spell, pSVar2 != NULL)) {
    BStack_28 = 0;
    GetItemImage(param_2->id,&BStack_28);
    uStack104.R = 200;
    uStack104.G = 200;
    uStack104.B = 0;
    uStack104.A = 0xe1;
    w = char_func_icon((pSVar2->base).name,UseFunc,param_4,param_5,&uStack104,BStack_28,param_7);
    param_6 = MaxWidgetWidth(w,param_6);
    AppendScrollMenu(w);
  }
  return param_6;
}

