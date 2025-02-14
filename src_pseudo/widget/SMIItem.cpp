#include "widgets/SMIItem.h"
#include "globals.h"

SMIItem::SMIItem(EquipInstance *pObject,u8 q,u8 user):BaseWidget(){
  char acStack_60 [64];
  u32 local_20;
  this->item = pObject;
  this->quantity = q;
  this->userIndex = user;
  this->userPortait = NULL;
  this->ItemIcon = NULL;
  this->QuantityTtx = NULL;
  this->ItemName = NULL;
  this->nameX = 0;
  this->unkx = 0;
  if (pObject == NULL) CRASH("SMIItem.cpp","pObject is NULL");
  GetItemImage((pObject->W).base.id,&local_20);
  sprintf(gGlobals.text,"Trying to load %s (%u), borg id = (%ld)",(this->item->W).base.name,(this->item->W).base.id,local_20[0]);
  this->ItemIcon = new WidgetBorg8(loadBorg8(local_20));
  this->ItemIcon->SetWidth(12);
  this->ItemIcon->SetHeight(12);
  this->Link(this->ItemIcon);
  if (this->userIndex != 0xff) {
    this->userPortait = new WidgetBorg8(loadBorg8(getEntityPortrait(gEntityDB,(gGlobals.party)->Members[this->userIndex]->ID)));
    this->userPortait->SetWidth(0xc);
    this->userPortait->SetHeight(0xc);
    this->Link(this->userPortait);
    this->userPortait->var5E = this->userIndex;
  }
  this->ItemName = new WidgetClipText((this->item->W).base.name,strlen((this->item->W).base.name) + 1);
  this->ItemName->SetColor(0x82,0x50,0x50,0xff);
  this->Link(this->ItemName);
  Utilities::SetWidgetBoundsXY0(this->ItemName,0,640);
  if (this->quantity) {
    sprintf(acStack_60,"%d",this->quantity);
    this->QuantityTtx = new WidgetClipText(acStack_60,strlen(acStack_60) + 1);
    this->QuantityTtx->var5E = this->quantity;
    this->QuantityTtx->SetColor(0x82,0x50,0x50,0xff);
    this->Link(this->QuantityTtx);
  }
  this->var5E = (this->item->W).base.id.s;
}

SMIItem::~SMIItem():~BaseWidget(){}


Gfx * SMIItem::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  if ((this->y < (short)this->boundY1) &&
     ((short)this->boundY0 < (this->y + 0x1c))) {
    g = this->RenderChildren(g,x0,y0,x1,y1);
  }
  return g;
}

u8 SMIItem::Tick(){
  short sVar2;
  
  if (this->ItemName) {
    if ((this->y < (short)this->boundY1) &&((short)this->boundY0 < (this->y + 0x1c))) {
      if(this->userPortait) {
        this->userPortait->SetCoords(this->x,this->y);
        this->userPortait->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      }
      this->ItemIcon->SetCoords(this->x + 0xd,this->y);
      this->ItemIcon->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      if(this->QuantityTtx) {
        this->QuantityTtx->SetCoords(this->x + 0x1a,this->y);
        this->QuantityTtx->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      }
      sVar2=this->x;
      this->unkx = this->x + 130;
      if (this->QuantityTtx == NULL) sVar2 += 30;
      else sVar2 += 40;
      this->nameX = sVar2;
      this->ItemName->SetCoords(this->nameX,this->y);
      this->ItemName->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
      this->ItemName->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
    }
  }
  return TickChildren();
}

u16 SMIItem::GetWidth(){return (boundX1-boundX0);}
u16 SMIItem::GetHeight(){return 13;}
BaseWidget * SMIItem::AFunc(){return userPortait;}
BaseWidget * SMIItem::BFunc(){return QuantityTtx;}
BaseWidget * SMIItem::ZFunc(){return (BaseWidget*)item;}
u32 SMIItem::GetNumber(){return 12;}


