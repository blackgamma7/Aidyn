#include "widgets/WidgetTrainShop.h"
#include "globals.h"


WidgetSkillInfo::WidgetSkillInfo(CharSkills *sk,u16 subType,u8 type):BaseWidget() {
  short mod;
  u16 baseLV;
  char buff [64];
  u32 borgInd;

  baseLV = 0;
  mod = 0;
  this->skills = sk;
  this->skillIcon = NULL;
  this->skillVal = NULL;
  this->skillText = NULL;
  this->skillMod = NULL;
  this->unk90 = 0;
  this->unk92 = 0;
  this->varU8 = subType;
  this->varU16 = subType| (u16)(type<<8);
  switch(type){
    case 0:{
      GetSkillIcons(subType,&borgInd);
      this->skillIcon = WidgetB8(borgInd);
      this->skillText = WClipTXTSafe(skill_strings[subType]);
      baseLV=this->skills->capSkillBaseMax(subType);
      mod = (short)this->skills->getModdedSkill(subType)-baseLV;
        break;
    }
    case 1:{
        this->skillText = WClipTXTSafe(weapon_strings[subType]);
        baseLV=this->skills->capWeaponBaseMax(subType);
        mod=this->skills->getModdedWeapon(subType)-baseLV;
        break;
    }
    case 2:{
        this->skillText = WClipTXTSafe("Shield");
        baseLV=this->skills->capSheildBaseMax();
        mod=this->skills->getModdedSheild()-baseLV;
        break;
    }
  }
  if(this->skillIcon) this->Link(this->skillIcon);
  this->skillText->SetColor(0x82,0x50,0x50,0xff);
  this->Link(this->skillText);
  sprintf(buff,"%d",baseLV);
  this->skillVal=WClipTXTSafe(buff);
  this->skillVal->varU16=baseLV;
  this->skillVal->SetColor(0x82,0x50,0x50,0xff);
  this->Link(this->skillVal);
  if (mod) {
    u8 txtRed,txtGreen;
    txtRed = 0;
    if (mod < 0) {
      txtRed = 0x80;
      txtGreen = 0;
      sprintf(buff,"(%d)",mod);
    }
    else {
      txtGreen = 0x80;
      sprintf(buff,"(+%d)",mod);
    }
    this->skillMod = WClipTXTSafe(buff);
    this->skillMod->SetColor(txtRed,txtGreen,0,0xff);
    this->skillMod->varU16 = mod;
    this->Link(this->skillMod);
  }
  get_crafting_menu(this->skillVal,subType,type);
}

WidgetSkillInfo::~WidgetSkillInfo(){BaseWidget::~BaseWidget();}

Gfx* WidgetSkillInfo::Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1){RENDERCHILDREN();}

u8 WidgetSkillInfo::Tick() {
  if (this->skillText) {
    if(this->skillIcon) {
      this->skillIcon->SetCoords(this->posX,this->posY);
      this->skillIcon->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      (this->skillIcon->col).A = this->col.A;
    }
    if(this->skillMod) {
      this->skillMod->SetCoords(this->posX + 95,this->posY);
      this->skillMod->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      (this->skillMod->col).A = this->col.A;
    }
    this->skillVal->SetCoords(this->posX + 79,this->posY);
    this->skillVal->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
    (this->skillVal->col).A = this->col.A;
    this->unk92 = this->posX + 140;
    this->unk90 = this->posX+12;
    this->skillText->SetCoords(this->posX+12,this->posY);
    Utilities::SetTextWidgetBoundsX(this->skillText,this->unk90,this->unk92);
    this->skillText->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
    this->skillText->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
  }
  return TickChildren();
}

u16 WidgetSkillInfo::GetWidth() {
  if (this->skillText) return this->boundX1 - this->boundX0;
  return 0;
}

u16 WidgetSkillInfo::GetHeight(){return 13;}

BaseWidget * WidgetSkillInfo::AFunc() {
  if (gGlobals.SomeCase == 7) { //run the crafting menu if available
    this->skillVal->AFunc();
    return NULL;
  }
  return this->skillVal;
}

void get_crafting_menu(BaseWidget *w,u16 sk,u8 type) {
  if ((w) && (type == 0)) {
    switch(sk){
        case SKILL_Alchemist:
        w->AButtonFunc = passto_makePotionMenu;return;
        case SKILL_Healer:
        w->AButtonFunc = passto_makeHealerMenu;return;
        case SKILL_Mechanic:
        w->AButtonFunc = passto_makeArmorMenu;return;
    }
  }
}

extern bool makePotionMenu(u8);
extern bool MakeHealerMenu(u8);
extern bool makeArmorMenu(u8);

BaseWidget* passto_makePotionMenu(BaseWidget *w0,BaseWidget *w1){
    makePotionMenu(gPartyPicker);
    return NULL;
}
BaseWidget* passto_makeHealerMenu(BaseWidget *w0,BaseWidget *w1){
    MakeHealerMenu(gPartyPicker);
    return NULL;
}
BaseWidget* passto_makeArmorMenu(BaseWidget *w0,BaseWidget *w1){
    makeArmorMenu(gPartyPicker);
    return NULL;
}

u32 WidgetSkillInfo::GetNumber(){return WidgetN_Other;}