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
  this->SetColor(0x82,0x50,0x50,0xff);
  this->scrollMenu = NULL;
  InitMenu();
}

void WidgetSkillTrain::InitMenu() {
  u16 uVar1;
  ushort uVar2;
  u32 uVar3;
  CharSkills *skills;
  byte bVar9;
  WidgetSkillInfo *pWVar7;
  u16 uVar8;
  int i;
  WSMSub *pvVar11;
  uint uVar11;
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
    uVar11 = (uint)pvVar5->highlight;
    uVar8 = pvVar5->unk10;
    uVar1 = pvVar5->field11_0x12;
    this->Unlink(this->scrollMenu);
    FREEQW(this->scrollMenu);
    this->scrollMenu = new WidgetFastScrollMenu(24);
    pvVar11 = (WSMSub *)this->scrollMenu;
    pvVar11->unk10 = uVar8;
    pvVar11->field11_0x12 = uVar1;
  }
  this->scrollMenu->SetSubstructColors(0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
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
    uVar2 = pvVar11->currentCount;
    if (uVar2 != 0) {
      if (uVar11 != 0) {
        if ((int)(uVar2 - 1) < (int)uVar11) {
          pvVar11->highlight = 0;
          pvVar11->field11_0x12 = 0;
          pvVar11->field14_0x16 = 0;
        }
        else {
          pvVar11->highlight = (u16)uVar11;
        }
      }
      this->Tick();
      this->scrollMenu->m8002ff30();
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

  if (gGlobals.SomeCase == 7) {
    BaseWidget *w =  this->scrollMenu->AFunc();
    if (w) w->AFunc();
    return NULL;
  }
  return this->scrollMenu->AFunc();
}


BaseWidget * WidgetSkillTrain::CDownFunc() {
  BaseWidget *w = this->scrollMenu->AFunc();
  if (w)
    WHANDLE->AddWidget(new WidgetItemDetail(PARTY->Members[this->partyPicker]->Skills,w->var5E));
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
  
  u16 type = param_2 >> 8;
  CharSkills *skills = PARTY->Members[this->partyPicker]->Skills;
  float discount=gGlobals.SomeCase==5?1.0f:0.8f;
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
  pDVar1->menus[pDVar1->menuIndex]->Purchase(param_2->var5E,param_2->var5C);
  return NULL;
}


void WidgetSkillTrain::Purchase(u16 param_2,u8 v) {
  CharSheet *pCVar1;
  CharSkills *skills;

  bool Shop;
  ushort type;
  byte bVar14;
  byte bVar15;
  short lvOld;
  short lvNew;
  char *pcVar10;

  u8 i;
  ushort subtype;
  
  type = param_2 >> 8;
  subtype = param_2 & 0xff;
  pCVar1 = PARTY->Members[this->partyPicker];
  Shop = gGlobals.SomeCase != 5;
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
    ppVar5->dollmenu->spells_widget->m80039b7c();
    ppVar5->dollmenu->spells_widget->m800396c8();
  }
  sprintf(Utilities::GetWidgetText(ppVar5->dollmenu->charStats_widget->GoldText),"%ld",PARTY->Gold);
  ppVar5->dollmenu->charStats_widget->Update(pCVar1);
}


void WidgetSkillTrain::Confirm(u16 param_2,u16 param_3) {
  CharSheet *pCVar1;
  CharSkills *skills;
  ushort type;
  uint uVar6;
  WidgetChild8 *pWVar7;
  BaseWidget *pBVar8;
  Color32 *txtCol;
  Color32 *bgCol;
  s8 skLv;
  float discount;
  uint teacherLV;
  int notOriana;
  uint afterBattle;
  
  discount = 0.8f;
  pCVar1 = PARTY->Members[this->partyPicker];
  teacherLV = (uint)param_3;
  skills = pCVar1->Skills;
  gold_train_price = 200;
  type = param_2 >> 8;
  exp_train_price = 0;
  notOriana = (int)shopkeepNotOriana();
  afterBattle = (uint)(gGlobals.SomeCase == 5);
  if (gGlobals.SomeCase == 5) discount = 1.0f;
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
    Color32 col1={COLOR_OFFWHITE};
    Color32 col2={COLOR_DARKGRAY_T};
    some_textbox_func(gGlobals.CommonStrings[0x201],0x96,&col1,&col2,true);
    return;
  }
  if ((int)teacherLV <= skLv) {
    Color32 col1={COLOR_OFFWHITE};
    Color32 col2={COLOR_DARKGRAY_T};
    some_textbox_func(gGlobals.CommonStrings[0x202],0x96,&col1,&col2,true);
    return;
  }
  if (SKILLMAXBASE <= skLv) {
    Color32 col1={COLOR_OFFWHITE};
    Color32 col2={COLOR_DARKGRAY_T};
    some_textbox_func(gGlobals.CommonStrings[0x203],0x96,&col1,&col2,true);
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
      pWVar7 = new WidgetChild8(2,gGlobals.text,0x96,&col1,&col2,0,0,0);
      pBVar8 = WClipTXT(gGlobals.CommonStrings[0x1f]);
      pBVar8->AButtonFunc = WST_AButtonFunc;
      pBVar8->var5E = param_2;
      pBVar8->var5C = this->partyPicker;
      pWVar7->AppendScrollMenu(pBVar8);
      pWVar7->AppendScrollMenu(WClipTXT(gGlobals.CommonStrings[0x20]));
      pWVar7->m8004de18();
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
  some_textbox_func(gGlobals.text,0x96,txtCol,bgCol,true);
}

u32 WidgetSkillTrain::GetNumber(){return WidgetN_Other;}