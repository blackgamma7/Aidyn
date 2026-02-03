#include "widgets/WidgetTrainShop.h"
#include "widgets/ItemDetails.h"
#include "widgets/Utilities.h"
#include "widgets/textPopup.h"
#include "globals.h"

s32 gold_train_price=200;
s32 exp_train_price=0;

WidgetSkillTrain::WidgetSkillTrain(u8 istrainer):WidgetTrainShop() {
  this->isTraining = istrainer;
  this->partyPicker = gPartyPicker;
  if (!istrainer) {
    this->TitleWidget = WidgetB8(BORG8_TitleSkills);
    this->TitleWidget->SetCoords(0x9e,0x51);
    this->Link(this->TitleWidget);
  }
  this->SetColor(COLOR_RED1);
  this->scrollMenu = NULL;
  InitMenu();
}

void WidgetSkillTrain::InitMenu() {
  u16 uVar1;
  u16 uVar2;
  u32 uVar3;
  CharSkills *skills;
  u8 bVar9;
  WidgetSkillInfo *pWVar7;
  u16 uVar8;
  int i;
  WSMSub *pvVar11;
  u32 uVar11;
  WSMSub *pvVar5;
  
  uVar3 = this->isTraining;
  this->partyPicker = gPartyPicker;
  skills = gGlobals.shopSkills;
  if (!this->isTraining) skills = PARTY->Members[this->partyPicker]->Skills;
  uVar11 = 0;
  if (this->scrollMenu == NULL) {
    this->scrollMenu = new WidgetFastScrollMenu(24);
    pvVar11 = (WSMSub *)this->scrollMenu->substruct;
  }
  else {
    pvVar5 = (WSMSub *)this->scrollMenu->substruct;
    uVar11 = (u32)pvVar5->highlight;
    uVar8 = pvVar5->XOff;
    uVar1 = pvVar5->yOff;
    this->Unlink(this->scrollMenu);
    FREEQW(this->scrollMenu);
    this->scrollMenu = new WidgetFastScrollMenu(24);
    pvVar11 = (WSMSub *)this->scrollMenu;
    pvVar11->XOff = uVar8;
    pvVar11->yOff = uVar1;
  }
  this->scrollMenu->SetColors(0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
  this->Link(this->scrollMenu);
  this->SetArrows();
  if (skills) {
    for(i=0;i<12;i++) {
      if (0 < skills->capSkillBaseMax(i))
       this->scrollMenu->Append(new WidgetSkillInfo(skills,i,0));
    }
    for(i=0;i<11;i++) {
      if (0 < skills->capWeaponBaseMax(i))
        this->scrollMenu->Append(new WidgetSkillInfo(skills,i,1));
    }
    if (skills->capSheildBaseMax() > 0){
      this->scrollMenu->Append(new WidgetSkillInfo(skills,skills->capSheildBaseMax(),2));
    }
    uVar2 = pvVar11->numChoices;
    if (uVar2 != 0) {
      if (uVar11 != 0) {
        if ((int)(uVar2 - 1) < (int)uVar11) {
          pvVar11->highlight = 0;
          pvVar11->yOff = 0;
          pvVar11->unk16 = 0;
        }
        else {
          pvVar11->highlight = (u16)uVar11;
        }
      }
      this->Tick();
      this->scrollMenu->Update();
    }
  }
}

 WidgetSkillTrain::~WidgetSkillTrain(){WidgetMenu::~WidgetMenu();}

 u32 WidgetSkillTrain::unk(){return 0;}

 Gfx* WidgetSkillTrain::Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1){RENDERCHILDREN();}

 u8 WidgetSkillTrain::Tick(){
    WidgetTrainShop::Tick();
    return TickChildren();
 }

 
BaseWidget * WidgetSkillTrain::AFunc() {

  if (DefaultPauseState) {
    BaseWidget *w =  this->scrollMenu->AFunc();
    if (w) w->AFunc();
    return NULL;
  }
  return this->scrollMenu->AFunc();
}


BaseWidget * WidgetSkillTrain::CDownFunc() {
  BaseWidget *w = this->scrollMenu->AFunc();
  if (w)
    WHANDLE->AddWidget(new WidgetItemDetail(PARTY->Members[this->partyPicker]->Skills,w->varU16));
  return NULL;
}

u32 WidgetSkillTrain::GetGoldPrice(u16 param_2) {
  CharSkills *skills;
  u16 type;
  u32 price;
  
  type = param_2 >> 8;
  skills = PARTY->Members[this->partyPicker]->Skills;
  switch(type){
    case 0:price = skills->GetGoldTrainPrice(param_2 & 0xff);break;
    case 1:price = skills->GetWeaponGoldTrainPrice(param_2 & 0xff);break;
    case 2:price = skills->GetShieldGoldTrainPrice();break;
    default:price=0;
  }
  return price;
}

s32 WidgetSkillTrain::GetExpPrice(u16 param_2) {
  s32 price;
  
  u16 type = ITEMIDTYPE(param_2);
  CharSkills *skills = PARTY->Members[this->partyPicker]->Skills;
  float discount=gGlobals.pauseMenuState==PauseMenuState_AfterBattle?1.0f:0.8f;
  switch(type){
    case 0:{
        if(skills->isSkillCapped(param_2 & 0xff)) return -1;
        price=skills->GetSkillXpMod(param_2 & 0xff)*discount;
        break;
    }
    case 1:{
        if(skills->isWeaponCapped(param_2 & 0xff)) return -1;
        price=skills->GetWeaponXpMod(param_2 & 0xff)*discount;
        break;
    }
    case 2:{
        if(skills->isShieldCapped()) return -1;
        price=skills->GetShieldXpPrice()*discount;
        break;
    }
    default: price=0;
  }
  return price;
}

BaseWidget * WST_AButtonFunc(BaseWidget *param_1,BaseWidget *param_2) {
  pause_Substruct* sub=PauseSub;
  DollMenuLists *pDVar1 = sub->dollmenu->lists;
  pDVar1->menus[pDVar1->menuIndex]->Purchase(param_2->varU16,param_2->varU8);
  return NULL;
}

void WidgetSkillTrain::Purchase(u16 param_2,u8 v) {
  CharSheet *pCVar1;
  CharSkills *skills;

  bool Shop;
  u16 type;
  u8 bVar14;
  u8 bVar15;
  s16 lvOld;
  s16 lvNew;
  char *pcVar10;

  u8 i;
  u16 subtype;
  
  type = param_2 >> 8;
  subtype = param_2 & 0xff;
  pCVar1 = PARTY->Members[this->partyPicker];
  Shop = gGlobals.pauseMenuState != 5;
  skills = pCVar1->Skills;
  switch(type){
    case 0:{
      if(skills->isSkillCapped(subtype)) return;
      lvOld = skills->capSkillBaseMax(subtype);
      skills->AddToBaseSkill(subtype,1);
      lvNew = skills->capSkillBaseMax(subtype);
      if (lvNew == lvOld) return;
      if (lvOld == 0) {//apply equip skill buffs if skill unlocked.
      if((pCVar1->weapons)&&(pCVar1->weapons->SkillMod)&&(
          pCVar1->weapons->SkillMod->stat==subtype)){
        skills->ModdedSkillAdd(subtype,pCVar1->weapons->SkillMod->mod);
      }
      for(i=0;i<2;i++){
        if((pCVar1->armor[i])&&(pCVar1->armor[i]->skillmod)&&
        (pCVar1->armor[i]->skillmod->stat==subtype)){
            skills->ModdedSkillAdd(subtype,pCVar1->armor[i]->skillmod->mod);
        }
      }
      for(i=0;i<12;i++){
        if((pCVar1->pItemList->pItem[i])&&(pCVar1->pItemList->pItem[i]->skillMod)&&
        (pCVar1->pItemList->pItem[i]->skillMod->stat==subtype)){
            skills->ModdedSkillAdd(subtype,pCVar1->pItemList->pItem[i]->skillMod->stat);
        }
      }
    }
      break;
    }
    case 1:{
      if(skills->isWeaponCapped(subtype)) return;
      lvOld = skills->capWeaponBaseMax(subtype);
      skills->AddToBaseWeapon(subtype,1);
      lvNew = skills->capWeaponBaseMax(subtype);
      if (lvNew == lvOld) return;
      break;
    }
    case 2:{
      if(skills->isShieldCapped()) return;
      lvOld = skills->capSheildBaseMax();
      skills->AddToBaseShield(1);
      lvNew = skills->capSheildBaseMax();
      if (lvNew == lvOld) return;
      break;
    }
  }
  pCVar1->EXP->spending-= exp_train_price;
  if (Shop) PARTY->Gold-=gold_train_price;
  pause_Substruct *ppVar5 = PauseSub;
  ppVar5->dollmenu->lists->UpdateMenus(this->partyPicker);
  if (!ppVar5->dollmenu->spells_widget)
    ppVar5->dollmenu->lists->ShowEXPCosts();
  else {
    ppVar5->dollmenu->spells_widget->SetHighlight();
    ppVar5->dollmenu->spells_widget->GetPrices();
  }
  sprintf(Utilities::GetWidgetText(ppVar5->dollmenu->charStats_widget->GoldText),"%ld",PARTY->Gold);
  ppVar5->dollmenu->charStats_widget->Update(pCVar1);
}


void WidgetSkillTrain::Confirm(u16 param_2,u16 param_3) {
  CharSheet *pCVar1;
  CharSkills *skills;
  u16 type;
  u32 uVar6;
  WidgetChoiceDia *pWVar7;
  BaseWidget *pBVar8;
  Color32 *txtCol;
  Color32 *bgCol;
  s8 skLv;
  float discount;
  u32 teacherLV;
  int notOriana;
  u32 afterBattle;
  
  discount = 0.8f;
  pCVar1 = PARTY->Members[this->partyPicker];
  teacherLV = (u32)param_3;
  skills = pCVar1->Skills;
  gold_train_price = 200;
  type = param_2 >> 8;
  exp_train_price = 0;
  notOriana = (int)shopkeepNotOriana();
  afterBattle = (u32)BattleResultsState;
  if (BattleResultsState) discount = 1.0f;
  switch(type){
    case 0:{
     skLv=skills->capSkillBaseMax(param_2 & 0xff);
     if(0<skLv) gold_train_price = skills->GetGoldTrainPrice(param_2 & 0xff);
     exp_train_price=skills->GetSkillXpMod(param_2 & 0xff)*discount;
     break;
    }
    case 1:{
     skLv=skills->capWeaponBaseMax(param_2 & 0xff);
     if(0<skLv) gold_train_price = skills->GetWeaponGoldTrainPrice(param_2 & 0xff);
     exp_train_price=skills->GetWeaponXpMod(param_2 & 0xff)*discount;
     break;
    }
    case 2:{
     skLv=skills->capSheildBaseMax();
     if(0<skLv) gold_train_price = skills->GetShieldGoldTrainPrice();
     exp_train_price=skills->GetShieldXpPrice()*discount;
     break;
    }
   default:{
    gold_train_price = 200;
    exp_train_price = 0;
    return;}
  }
  if (skLv == -1) {
    ErrPopup(gGlobals.CommonStrings[0x201]);
    return;
  }
  if ((int)teacherLV <= skLv) {
    ErrPopup(gGlobals.CommonStrings[0x202]);
    return;
  }
  if (SKILLMAXBASE <= skLv) {
    ErrPopup(gGlobals.CommonStrings[0x203]);
    return;
  }
  if (!notOriana) gold_train_price = 0;
  if (!afterBattle) {
    if ((exp_train_price <= pCVar1->EXP->spending) && (gold_train_price <= PARTY->Gold)) {
LAB_8003fd14:
      if (gold_train_price == 0) Gsprintf(gGlobals.CommonStrings[0x207],exp_train_price);
      else Gsprintf(gGlobals.CommonStrings[0x206],exp_train_price,gold_train_price);
      Color32 col1={COLOR_WHITE};
      Color32 col2={200,180,100,0xff};
      pWVar7 = new WidgetChoiceDia(2,gGlobals.text,0x96,&col1,&col2,0,0,0);
      pBVar8 = WClipTXT(gGlobals.CommonStrings[0x1f]);
      pBVar8->AButtonFunc = WST_AButtonFunc;
      pBVar8->varU16 = param_2;
      pBVar8->varU8 = this->partyPicker;
      pWVar7->AppendScrollMenu(pBVar8);
      pWVar7->AppendScrollMenu(WClipTXT(gGlobals.CommonStrings[0x20]));
      pWVar7->Update();
      WHANDLE->AddWidget(pWVar7);
    }
    if (gold_train_price == 0) {
      Gsprintf(gGlobals.CommonStrings[0x205]);
    }
    else Gsprintf(gGlobals.CommonStrings[0x204]);
    Color32 aCStack_1c0,aCStack_180;
    txtCol = &aCStack_1c0;
    bgCol = &aCStack_180;
    aCStack_1c0={COLOR_OFFWHITE};
    aCStack_180={COLOR_DARKGRAY_T};
  }
  else {
    if (exp_train_price <= pCVar1->EXP->spending) {
      gold_train_price = 0;
      goto LAB_8003fd14;
    }
    Gsprintf(gGlobals.CommonStrings[0x205]);
    Color32 aCStack_140,aCStack_100;
    txtCol = &aCStack_140;
    bgCol = &aCStack_100;
    aCStack_140={COLOR_OFFWHITE};
    aCStack_100={COLOR_DARKGRAY_T};
  }
  TextBox_Centered(gGlobals.text,150,txtCol,bgCol,true);
}

u32 WidgetSkillTrain::GetNumber(){return WidgetN_Other;}