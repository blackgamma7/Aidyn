#include "globals.h"
#include "widgets/WidgetTrainShop.h"


SMStatItem::SMStatItem(CharStats_s *pStats,u16 statInd):BaseWidget() {
  
  char buff [96];
  
  this->stats = pStats;
  this->unk80 = NULL;
  this->baseLevel = NULL;
  this->modDiff = NULL;
  this->statName = NULL;
  this->unk90 = 0;
  this->unk92 = 0;
  if (pStats == NULL) CRASH("SMStatItem","pStats is NULL");
  this->statName = WClipTXTSafe(Stat_labels[statInd]);
  this->statName->SetColor(0x82,0x50,0x50,0xff);
  this->Link(this->statName);
  u16 uVar3 = (u16)CharStats::GetBase2(this->stats,statInd);
  sprintf(buff,"%d",uVar3);
  this->baseLevel = WClipTXTSafe(buff);
  this->baseLevel->var5E = (ushort)uVar3;
  this->baseLevel->SetColor(0x82,0x50,0x50,0xff);
  this->Link(this->baseLevel);
  u16 diff = CharStats::getBaseModDiff(this->stats,statInd);
  if (diff == 0) this->var5C = statInd;
  else {
    u8 red,green;
    red = 0;
    if ((short)diff < 0) {
      red = 0x80;
      green = 0;
      sprintf(buff,"(%d)",diff);
    }
    else {
      green = 0x80;
      sprintf(buff,"(+%d)",diff);
    }
    this->modDiff = WClipTXTSafe(buff);
    this->modDiff->SetColor(red,green,0,0xff);
    this->modDiff->var5E = diff;
    this->Link(this->modDiff);
    this->var5C = statInd;
  }
}

SMStatItem::~SMStatItem(){BaseWidget::~BaseWidget();}

Gfx* SMStatItem::Render(Gfx*g,u16 x0,u16 y0, u16 x1, u16 y1){RENDERCHILDREN();}

u8 SMStatItem::Tick() {
  if (this->statName) {
    if(this->unk80) {
      this->unk80->SetCoords(this->x,this->y);
      this->unk80->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      this->unk80->col.A = this->col.A;
    }
    if(this->modDiff){
      this->modDiff->SetCoords(this->x + 100,this->y);
      this->modDiff->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      this->modDiff->col.A = this->col.A;
    }
    this->baseLevel->SetCoords(this->x + 0x4f,this->y);
    this->baseLevel->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
    this->baseLevel->col.A = this->col.A;
    this->unk92 = this->x + 0x8c;
    this->unk90 = this->x;
    this->statName->SetCoords(this->x,this->y);
    //this seems redundant - overwritten 2 lines later.
    Utilities::SetTextWidgetBoundsX(this->statName,this->unk90,this->unk92);
    this->statName->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
    this->statName->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
  }
  return TickChildren();
}

u16 SMStatItem::GetWidth(){
  if(this->statName) return this->boundX1-this->boundX0;
  return 0;
}

u16 SMStatItem::GetHeight(){return 11;}

BaseWidget* SMStatItem::AFunc(){return this->baseLevel;}

u32 SMStatItem::GetNumber(){return WidgetN_Other;}