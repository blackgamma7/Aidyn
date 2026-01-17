#include "widgets/CombatScrollMenu.h"
#include "globals.h"
#include "combat/CombatStruct.h"
#include "quicksort.h"

s8 gCombatSkillSelections[]={-1,-1,-1,-1};

WidgetCombatSkills* InitCombatSkillsMenu(u8 *spells,bool troub,bool hands,bool herbs){
    return new WidgetCombatSkills(spells,troub,hands,herbs);
}

WidgetGroup *
char_func_icon(char *str,BaseWidget::buttonFunc AFunc,u16 param_3,u8 param_4,Color32 *col,u32 borg8,u16 height){  
  WidgetGroup *wg = new WidgetGroup(2);
  if (borg8) wg->AddToGroup(WidgetB8(borg8),0,0,false);
  WidgetText* wt = WTextSafe(str);
  wg->AddToGroup(wt,height + 5,(height >> 1) - (s16)(wt->GetHeight() >> 1),true);
  wg->SetColor(col->R,col->G,col->B,col->A);
  wg->AButtonFunc = AFunc;
  wg->varU8 = param_4;
  wg->varU16 = param_3;
  return wg;
}

u16 MaxWidgetWidth(BaseWidget *w,u16 wMax){
    if(wMax<=w->GetWidth())wMax=w->GetWidth();
    return wMax;
}

int find_char_in_party(CharSheet *param_1){
    if(param_1){
        for(u32 i=0;i<4;i++){
            if(PARTY->Members[i]==param_1) return i;
        }
    }
    return -1;
}

void init_combatSkillValues(void){
for(u32 i=0;i<4;i++){gCombatSkillSelections[i]=-1;}
}

BaseWidget * FUN_800920d8(BaseWidget *param_1,BaseWidget *param_2){
  CharSheet *pCVar1 = gCombatP->current_Ent->charSheetP;
  if (pCVar1->spellbook->spells[param_2->varU8] != NULL) {
    pCVar1->spellSwitch = 1;
    pCVar1->currSpell = param_2->varU8;
    FUN_8008d56c();
  }
  return NULL;
}

BaseWidget * Troubador_perform(BaseWidget *param_1,BaseWidget *param_2){
  gGlobals.combatBytes[0] = 0x19;
  FUN_80072454(gCombatP->substruct2,gCombatP->current_Ent);
  return NULL;
}

BaseWidget * combat_layOnHands(BaseWidget *w0,BaseWidget *w1){
  CombatEntity *ent = gCombatP->current_Ent;
  ent->UnsetFlag(COMBATENT_MEDIC);
  ent->UnsetFlag(COMBATENT_HERBS);
  ent->m8006f8a0();
  gGlobals.combatBytes[0] = 9;
  FUN_80072698(gCombatP->substruct2,ent);
  return NULL;
}

BaseWidget * combat_healWithHerbs(BaseWidget *w0,BaseWidget *w1){
  CombatEntity *ent = gCombatP->current_Ent;
  ent->UnsetFlag(COMBATENT_MEDIC);
  ent->UnsetFlag(COMBATENT_HERBS);
  ent->m8006f8bc();
  gGlobals.combatBytes[0] = 9;
  FUN_80072698(gCombatP->substruct2,ent);
  return NULL;
}

int CombatSortItemsByName(CombatMenuSpell *param_1,CombatMenuSpell *param_2){
  return strcmp((param_1->spellP->base).name,(param_2->spellP->base).name);
}

int FUN_80092270(u8 *param_1,CombatMenuSpell *param_2,CharSheet *param_3){
  SpellInstance *pSVar2;
  int iVar5=0;
  if (param_3->spellbook->count != 0) {
    for(u16 i=0;i<param_3->spellbook->count;i++){
      if ((param_1[i] != 0) && (pSVar2 = param_3->spellbook->spells[i], pSVar2 != NULL)) {
        param_2->index = i;
        param_2->spellP = pSVar2;
        param_2++;
        iVar5++;
      }
    }
  }
  return iVar5;
}

WidgetCombatSkills::WidgetCombatSkills(u8 *spells,bool troub,bool hands,int herbs):
WidgetChoiceDia(62,120,gExpPakFlag?95:55,0,0){
  WidgetGroup *pWVar4;
  u16 wMax;
  u32 ArraySize;
  int iVar5;
  u16 H;
  u32 i;
  CombatMenuSpell *ToSort;
  Color32 col1;
  Color32 col2;
  CombatMenuSpell local_230 [64];
  u32 local_30;
  CharSheet *local_2c;
  
  wMax = 120;
  local_2c = gCombatP->current_Ent->charSheetP;
  col1.R = 0;
  col1.G = 0x80;
  col1.B = 0xe1;
  col1.A = 0xe1;
  col2.R = 0xe1;
  col2.G = 0x50;
  col2.B = 0x50;
  col2.A = 0xe1;
  //load an unload a skill icon to get its size
  Borg8Header *pBVar3 = loadBorg8(BORG8_IconSkTroubador);
  u16 iconSize = (pBVar3->dat).Width;
  borg8_free(pBVar3);
  if (hands) {
    pWVar4 = char_func_icon("Lay On Hands",combat_layOnHands,0,0,&col1,BORG8_IconSkHealer,iconSize);
    wMax = MaxWidgetWidth(pWVar4,120);
    AppendScrollMenu(pWVar4);
  }
  if (herbs) {
    pWVar4 = char_func_icon("Heal With Herbs",combat_healWithHerbs,0,0,&col1,BORG8_IconSkHealer,iconSize);
    wMax = MaxWidgetWidth(pWVar4,wMax);
    AppendScrollMenu(pWVar4);
  }
  if (troub) {
    pWVar4 = char_func_icon("Perform",Troubador_perform,0,0,&col1,BORG8_IconSkTroubador,iconSize);
    wMax = MaxWidgetWidth(pWVar4,wMax);
    AppendScrollMenu(pWVar4);
  }
  ToSort = local_230;
  ArraySize = FUN_80092270(spells,ToSort,local_2c);
  QSort(ToSort,ArraySize,CombatSortItemsByName);
  local_30 = 0;
  if (ArraySize != 0) {
    for(u32 i=0;i<ArraySize;i++){
      SpellInstance *iVar1 = ToSort[i].spellP;
      if (iVar1) {
        getSchoolIcon(iVar1->school,&local_30);
        pWVar4 = char_func_icon((iVar1->base).name,FUN_800920d8,0,(u8)local_230[i].index,&col2,local_30,iconSize);
        wMax = MaxWidgetWidth(pWVar4,wMax);
        AppendScrollMenu(pWVar4);
      }
    }
  }
  Utilities::SetArrayVSpace(this->scrollMenu,3);
  Update();
  iVar5 = find_char_in_party(local_2c);
  WidgetBorg8* pBVar6 = WidgetB8(BORG8_ScrollBarArrowUp);
  WidgetBorg8* pBVar7 = WidgetB8(BORG8_ScrollBarArrowDown);
  pBVar6->SetCoords(this->scrollMenu->posX + -8,(this->scrollMenu->posY - (s16)pBVar6->GetHeight()) -2);
  pBVar7->SetCoords(this->scrollMenu->posX + -8,this->scrollMenu->boundY1 + 2);
  this->arrows =new WidgetScrollArrows(this->scrollMenu,pBVar6,pBVar7,0);
  this->arrows->SetColor(COLOR_WHITE);
  this->scrollMenu->Link(this->arrows);
  s8 lVar11 = gCombatSkillSelections[iVar5];
  if (lVar11 != -1) {
    WSMSub* s = (WSMSub*)this->scrollMenu->substruct;
    s8 lVar10 = s->numChoices-1;
    if (lVar10 < lVar11) lVar11 = lVar10;
    s->highlight=lVar11;
    this->scrollMenu->Tick();
    s->yOff=s->unk16;
  }
}

WidgetCombatSkills::~WidgetCombatSkills(){
  Utilities::GetHighlightedEntry(this->scrollMenu)->AFunc();
  gCombatSkillSelections[find_char_in_party(gCombatP->current_Ent->charSheetP)] = (u8)((WSMSub*)this->scrollMenu->substruct)->highlight;
  this->varU8 = 0;
  this->scrollMenu->Unlink(this->arrows);
  WidgetChoiceDia::~WidgetChoiceDia();
}

BaseWidget* WidgetCombatSkills::AFunc(){return NULL;}
BaseWidget* WidgetCombatSkills::BFunc(){return NULL;}