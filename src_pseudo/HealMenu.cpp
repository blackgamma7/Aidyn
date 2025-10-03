#include "crafting/healer.h"
#include "widgets/widgetGroup.h"
#include "globals.h"

bool MakeHealerMenu(byte param_1) {
  if (gHealerWidget) CRASH("Healer Task Menu already initialized","MakeHealerMenu");
  gHealerWidget = new WidgetMenuHealer(param_1);
  return WHANDLE->AddWidget(gHealerWidget);
}

BaseWidget* WidgetMenuHealer_LayOnHands(BaseWidget*w0,BaseWidget*w1){
    gHealerWidget->LayOnHands();
    return NULL;
}

BaseWidget* WidgetMenuHealer_AFuncHerbs(BaseWidget*w0,BaseWidget*w1){
    gHealerWidget->HealWithHerbs();
    return NULL;
}

BaseWidget* WidgetMenuHealer_Restore(BaseWidget*w0,BaseWidget*w1){
    gHealerWidget->Restore();
    return NULL;
}

BaseWidget* WidgetMenuHealer_LayOnHands2(BaseWidget*w0,BaseWidget*w1){
    gHealerWidget->PrintHealing(w1->var5E);
    return NULL;
}

BaseWidget* WidgetMenuHealer_AFuncHerbs2(BaseWidget*w0,BaseWidget*w1){
    gHealerWidget->PrintHerbHealing(w1->var5E);
    return NULL;
}

BaseWidget* WidgetMenuHealer_Restore2(BaseWidget*w0,BaseWidget*w1){
    gHealerWidget->PrintRestore(w1->var5E);
    return NULL;
}


BaseWidget * WidgetMenuHealer_HealingFunc2(BaseWidget *w0,BaseWidget *w1) {
  gHealerWidget->HealingFunc2(w1->var5E,w1->var5C);
  return NULL;
}

WidgetMenuHealer::WidgetMenuHealer(u32 partyInd):WidgetCrafting(partyInd){
  this->textBox = Utilities::AddTextWidget(this, gGlobals.CommonStrings[0x1d1],0x17,0x46,0x82,0x50,0x50,0xff);
  this->textBox->SetCoords(0x5d-(this->textBox->GetWidth()>>1),this->textBox->y);
  s16 by0 = this->textBox->GetHeight()+0x46;
  this->scrollMenu = Utilities::AddScrollMenu(this,3,0x17,by0,0x17,by0,0xa3,by0 + 0x75,0x82,0x50,0x50,0xff,0);
  Utilities::SetScrollMenuColors(this->scrollMenu,0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
  WidgetText* pBVar2 = WTextSafe(gGlobals.CommonStrings[0x1d2]);
  this->scrollMenu->Append(pBVar2);
  pBVar2->AButtonFunc = WidgetMenuHealer_LayOnHands;
  pBVar2 = WTextSafe(gGlobals.CommonStrings[0x1d3]);
  this->scrollMenu->Append(pBVar2);
  pBVar2->AButtonFunc = WidgetMenuHealer_AFuncHerbs;
  pBVar2 = WTextSafe(gGlobals.CommonStrings[0x1d4]);
  this->scrollMenu->Append(pBVar2);
  pBVar2->AButtonFunc = WidgetMenuHealer_Restore;
}

BaseWidget * WidgetMenuHealer::AFunc(){
    if(!this->scrollMenu) this->SetState(5);
    else{
        BaseWidget* w=Utilities::GetHighlightedEntry(this->scrollMenu);
        if(w) w->AFunc();
    }
    return NULL;
}

BaseWidget* WidgetMenuHealer::BFunc(){
    gHealerWidget=NULL;
    return WidgetCrafting::BFunc();
}

void WidgetMenuHealer::LayOnHands() {
  ClearText();
  this->textBox = Utilities::AddTextWidget(this,gGlobals.CommonStrings[0x1d2],0x17,0x46,0x82,0x50,0x50,0xff);
  this->textBox->SetCoords(0x5d-(this->textBox->GetWidth()>>1),this->textBox->y);
  s16 by0 = this->textBox->GetHeight()+0x46;
  this->scrollMenu = Utilities::AddScrollMenu(this,4,0x17,by0,0x17,by0,0xa3,by0 + 0x75,0x82,0x50,0x50,0xff,0);;
  Utilities::SetScrollMenuColors(this->scrollMenu,0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
  for(u32 i=0;i<MAXPARTY;i++) {
    CharSheet *chara = PARTY->Members[i];
    if (((chara) && (!Entity::isDead(chara))) && (i != this->partyIndex)) {
      ShowHealedMember(chara,(ushort)i,WidgetMenuHealer_LayOnHands2);
    }
  }
}

void WidgetMenuHealer::HealWithHerbs() {
  ClearText();
  this->textBox = Utilities::AddTextWidget(this,gGlobals.CommonStrings[0x1d3],0x17,0x46,0x82,0x50,0x50,0xff);
  this->textBox->SetCoords(0x5d-(this->textBox->GetWidth()>>1),this->textBox->y);
  s16 by0 = this->textBox->GetHeight()+0x46;
  this->scrollMenu = Utilities::AddScrollMenu(this,4,0x17,by0,0x17,by0,0xa3,by0 + 0x75,0x82,0x50,0x50,0xff,0);;
  Utilities::SetScrollMenuColors(this->scrollMenu,0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
  for(u32 i=0;i<MAXPARTY;i++) {
    CharSheet *chara = PARTY->Members[i];
    if ((chara) && (!Entity::isDead(chara))) {
      ShowHealedMember(chara,(ushort)i,WidgetMenuHealer_AFuncHerbs2);
    }
  }
}

void WidgetMenuHealer::Restore() {
  ClearText();
  this->textBox = Utilities::AddTextWidget(this,gGlobals.CommonStrings[0x1d4],0x17,0x46,0x82,0x50,0x50,0xff);
  this->textBox->SetCoords(0x5d-(this->textBox->GetWidth()>>1),this->textBox->y);
  s16 by0 = this->textBox->GetHeight()+0x46;
  this->scrollMenu = Utilities::AddScrollMenu(this,4,0x17,by0,0x17,by0,0xa3,by0 + 0x75,0x82,0x50,0x50,0xff,0);;
  Utilities::SetScrollMenuColors(this->scrollMenu,0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
  for(u32 i=0;i<MAXPARTY;i++) {
    CharSheet *chara = PARTY->Members[i];
    if ((chara) && (!Entity::isDead(chara))) {
      ShowHealedMember(chara,(ushort)i,WidgetMenuHealer_Restore2);
    }
  }
}

void WidgetMenuHealer::ShowHealedMember(CharSheet* chara,u16 var,BaseWidget*(func)(BaseWidget*,BaseWidget*)){
  char buff [296];
  if (chara) {
    WidgetGroup* group = new WidgetGroup(3);
    WidgetBorg8* portrait = WidgetB8Port(chara->ID);
    portrait->SetWidth(25);
    portrait->SetHeight(25);
    group->AddToGroup(portrait,0,0,0);
    WidgetText* name=WTextSafe(chara->name);
    group->AddToGroup(name,portrait->GetWidth()+2,0,1);
    sprintf(buff,gGlobals.CommonStrings[0x1d5],Entity::getHPCurrent(chara),Entity::getHPMax(chara));
    WidgetText* hp=WTextSafe(buff);
    group->AddToGroup(hp,portrait->GetWidth(),name->GetHeight()+5,1);
    group->SetColor(0x82,0x50,0x50,0xff);
    this->scrollMenu->Append(group);
    group->AButtonFunc = func;
    group->var5E = var;
  }
}

void WidgetMenuHealer::PrintHealing(u8 val){
    this->TextPopup(PARTY->PrintHeal(this->partyIndex,val));
}

void WidgetMenuHealer::PrintHerbHealing(u8 val){
    this->TextPopup(PARTY->HerbHeal(this->partyIndex,val));
}

void WidgetMenuHealer::PrintRestore(u8 val) {
  ClearText();
  this->textBox=Utilities::AddTextWidget(this,gGlobals.CommonStrings[0x1d4],0x17,0x46,0x82,0x50,0x50,0xff);
  this->textBox->SetCoords(0x5d-(this->textBox->GetWidth()>>1),this->textBox->y);
  s16 by0 = this->textBox->GetHeight()+0x46;
  this->scrollMenu = Utilities::AddScrollMenu(this,7,0x17,by0,0x17,by0,0xa3,by0 + 0x75,0x82,0x50,0x50,0xff,0);
  Utilities::SetScrollMenuColors(this->scrollMenu,0x44,0x2a,0x22,0xff,0x97,0x8d,0xbf,0xff,0x14);
  PrintStat(STAT_INT,val);
  PrintStat(STAT_WIL,val);
  PrintStat(STAT_DEX,val);
  PrintStat(STAT_END,val);
  PrintStat(STAT_STR,val);
  PrintStat(STAT_STAM,val);
}

void WidgetMenuHealer::HealingFunc2(u8 stat,u8 val){
    this->TextPopup(PARTY->HealingFunc2(this->partyIndex,val,stat));
}

void WidgetMenuHealer::ClearText() {  
  if(this->textBox){
    this->Unlink(this->textBox);
    if(this->textBox)this->textBox->~BaseWidget();
    this->textBox=NULL;
  }
  if(this->scrollMenu){
    this->Unlink(this->scrollMenu);
    if(this->scrollMenu)this->scrollMenu->~WidgetScrollMenu();
    this->scrollMenu=NULL;
  }
}

void WidgetMenuHealer::PrintStat(u8 stat, u8 val){
    WidgetText* txt=WTextSafe(Stat_labels[stat]);
    txt->var5C=val;
    txt->var5E=stat;
    txt->AButtonFunc=WidgetMenuHealer_HealingFunc2;
    this->scrollMenu->Append(txt);
}

WidgetMenuHealer::~WidgetMenuHealer(){
    WidgetMenu::~WidgetMenu();
}