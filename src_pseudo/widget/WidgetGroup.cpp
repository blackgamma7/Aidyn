#include "widgets/widgetGroup.h"
#include "globals.h"

#define FILENAME "./menus/widgetgroup.cpp"
WidgetGroup::WidgetGroup(u16 max):BaseWidget(){
  this->group = NULL;
  this->groupMax = max;
  this->groupCount = 0;
  this->ticked = 0;
  if (max == 0) this->groupMax = 1;
  ALLOCS(this->group,this->groupMax*sizeof(WidgetGroupItem),46);
  memset(this->group,0,this->groupMax * sizeof(WidgetGroupItem));
}

WidgetGroup::~WidgetGroup(){
    if (this->groupCount) {
        for(u16 i=0;i<this->groupCount;i++) {
          BaseWidget* w = this->group[i].w;
          if ((w) && (w->borg8)) {
            FREEQB8(w->borg8);
            w->borg8 = NULL;
          }
          w=this->group[i].w;
          if (w) w->~BaseWidget();
        }
      }
    HFREE(this->group,78);
    BaseWidget::~BaseWidget();
}

u32 WidgetGroup::GetNumber(){return 12;}

u8 WidgetGroup::Tick(){
  this->ticked = true;
  if (this->groupCount) {
    for(u16 i=0;i<this->groupCount;i++) {
        WidgetGroupItem* gi=&this->group[i];

      gi->w->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      gi->w->SetCoords(this->x + gi->w->x,this->y + gi->w->y);
      if (gi->unk8){
        gi->w->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
      }
     gi->w->Tick();
    }
  }
  return TickChildren();
}

Gfx* WidgetGroup::Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1){
    if(!this->ticked) this->Tick();
    this->ticked=false;
    if (this->groupCount) {
        for(u16 i=0;i<this->groupCount;i++) {
            g=this->group[i].w->Render(g,x0,y0,x1,y1);
        }
    }
    RENDERCHILDREN();
}

u16 WidgetGroup::GetWidth(){
    this->width=0;
    if (this->groupCount) {
        for(u16 i=0;i<this->groupCount;i++) {
            u16 w=this->group[i].w->GetWidth();
            if(this->width<w)this->width=w;
        }
    }
    return this->width;
}

u16 WidgetGroup::GetHeight(){
    this->height=0;
    if (this->groupCount) {
        for(u16 i=0;i<this->groupCount;i++) {
            u16 h=this->group[i].w->GetHeight();
            if(this->height<h)this->height=h;
        }
    }
    return this->height;
}

BaseWidget * WidgetGroup::GetEntry(u16 entry){
  if (entry < (ushort)this->groupCount)
    return this->group[entry].w;
  return NULL;
}

void WidgetGroup::AddToGroup(BaseWidget *w,u16 px,u16 py,u32 pz){
  if (this->groupCount < this->groupMax) {
    WidgetGroupItem *gi = this->group + this->groupCount++;
    gi->w = w;
    gi->x = px;
    gi->y = py;
    gi->unk8 = pz;
  }
}


void WidgetGroup::Remove(BaseWidget *w){
  BaseWidget *pBVar1;
  uint uVar2;
  uint uVar3;
  ushort uVar4;
  
  if (w) {
    uVar2 = (uint)(ushort)this->groupCount;
    u16 uVar5 = 0;
    if (uVar2 != 0) {
      pBVar1 = this->group->w;
      uVar3 = 1;
      while ((pBVar1 != w && (uVar5 = uVar3 & 0xffff, uVar5 < uVar2))) {
        pBVar1 = this->group[uVar5].w;
        uVar3 = uVar5 + 1;
      }
    }
    if (uVar5 != uVar2) {
      pBVar1 = this->group[uVar5].w;
      if (pBVar1) pBVar1->~BaseWidget();
      if (uVar5 < --this->groupCount) {
        for(;uVar5<this->groupCount;uVar5++) {
          memcpy(this->group + uVar5,this->group + uVar5 + 1,0xc);
        }
      }
      memset(this->group + (ushort)this->groupCount,0,sizeof(WidgetGroupItem));
    }
  }
}


void WidgetGroup::Move(u16 entry,u16 px,u16 py){
  this->group[entry].x+= px;
  this->group[entry].y+= py;
}

