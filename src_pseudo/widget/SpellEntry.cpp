#include "widgets/DollMenu.h"
#include "widgets/Utilities.h"

WidgetSpellEntry::WidgetSpellEntry(SpellInstance *param_2):BaseWidget(){
  this->unk94 = 0;
  this->unk96 = 0;
  this->spell = param_2;
  this->aspectIcon = NULL;
  this->SchoolIcon = NULL;
  this->SpellIcon = NULL;
  this->SpelllRank = NULL;
  this->SpellName = NULL;
  u32 aspect = 0;
  u32 school = 0;
  u32 icon = 0;
  GetSpellIcons(param_2->base.id,&aspect,&school,&icon);
  if (aspect) {
    this->aspectIcon = WidgetB8(aspect);
    BaseWidget::Link(this->aspectIcon);
  }
  if (school) {
    this->SchoolIcon = WidgetB8(school);
    BaseWidget::Link(this->SchoolIcon);
  }
  if (icon) {
    this->SpellIcon = WidgetB8(icon);
    BaseWidget::Link(this->SchoolIcon);
  }
  this->SpellName = WClipTXTSafe((this->spell->base).name);
  this->SpellName->SetColor(COLOR_RED1);
  BaseWidget::Link(this->SpellName);
  char buff [64];
  sprintf(buff,"%d",this->spell->level);
  this->SpelllRank = WClipTXTSafe(buff);
  this->SpelllRank->SetColor(COLOR_RED1);
  this->SpelllRank->varU16 = (u16)this->spell->level;
  BaseWidget::Link(this->SpelllRank);
}

WidgetSpellEntry::~WidgetSpellEntry(){BaseWidget::~BaseWidget();}

Gfx * WidgetSpellEntry::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){RENDERCHILDREN();}

u8 WidgetSpellEntry::Tick() {
  s16 y;
  s16 sVar1;
  s16 x;
  BaseWidget *pBVar4;
  
  if (this->SpellName) {
    if (this->aspectIcon){
      this->aspectIcon->SetCoords(this->posX,this->posY);
      this->aspectIcon->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      (this->aspectIcon->col).A = this->col.A;
    }
    if (this->SchoolIcon){
      this->SchoolIcon->SetCoords(this->posX + 0xc,this->posY);
      this->SchoolIcon->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,
                 this->boundY1);
      (this->SchoolIcon->col).A = this->col.A;
    }
    if (this->SpellIcon){
      this->SpellIcon->SetCoords(this->posX + 0x18,this->posY);
      this->SpellIcon->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      (this->SpellIcon->col).A = this->col.A;
    }
    this->SpelllRank->SetCoords(this->posX + 0x24,this->posY);
    this->SpelllRank->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
    (this->SpelllRank->col).A = this->col.A;
    sVar1 = this->posX;
    y = this->posY;
    x = sVar1 + 0x32;
    this->unk96 = sVar1 + 0x8c;
    this->unk94 = x;
    this->SpellName->SetCoords(x,y);
    Utilities::SetTextWidgetBoundsX(this->SpellName,this->unk94,this->unk96);
    this->SpellName->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
    this->SpellName->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
  }
  return TickChildren();
}

u16 WidgetSpellEntry::GetWidth() {
  if (this->SpellName) return this->boundX1 - this->boundX0;
  return 0;
}

u16 WidgetSpellEntry::GetHeight() {return 13;}

BaseWidget * WidgetSpellEntry::AFunc() {return this->SpelllRank;}

u32 WidgetSpellEntry::GetNumber() {return WidgetN_Other;}