#include "globals.h"
#include "menuImages.h"

SMIItem::SMIItem(ItemInstance *pObject,u8 q,u8 user):BaseWidget(){
  char acStack_60 [64];
  u32 local_20;
  this->item = pObject;
  this->quantity = q;
  this->userIndex = user;
  this->userPortrait = NULL;
  this->ItemIcon = NULL;
  this->QuantityText = NULL;
  this->ItemName = NULL;
  this->nameX = 0;
  this->unkX = 0;
  if (pObject == NULL) CRASH("SMIItem.cpp","pObject is NULL");
  GetItemImage(pObject->id,&local_20);
  sprintf(gGlobals.text,"Trying to load %s (%u), borg id = (%ld)",this->item->name,this->item->id,local_20);
  this->ItemIcon = WidgetB8(local_20);
  this->ItemIcon->SetWidth(12);
  this->ItemIcon->SetHeight(12);
  this->Link(this->ItemIcon);
  if (this->userIndex != 0xff) {
    this->userPortrait = WidgetB8PartyPort(this->userIndex);
    this->userPortrait->SetWidth(12);
    this->userPortrait->SetHeight(12);
    this->Link(this->userPortrait);
    this->userPortrait->var5E = this->userIndex;
  }
  this->ItemName = WClipTXTSafe(this->item->name);
  this->ItemName->SetColor(0x82,0x50,0x50,0xff);
  this->Link(this->ItemName);
  Utilities::SetWidgetBoundsX(this->ItemName,0,640);
  if (this->quantity) {
    sprintf(acStack_60,"%d",this->quantity);
    this->QuantityText = WClipTXTSafe(acStack_60);
    this->QuantityText->var5E = this->quantity;
    this->QuantityText->SetColor(0x82,0x50,0x50,0xff);
    this->Link(this->QuantityText);
  }
  this->var5E = this->item->id;
}

SMIItem::~SMIItem(){BaseWidget::~BaseWidget();}

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
      if(this->userPortrait) {
        this->userPortrait->SetCoords(this->x,this->y);
        this->userPortrait->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      }
      this->ItemIcon->SetCoords(this->x + 0xd,this->y);
      this->ItemIcon->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      if(this->QuantityText) {
        this->QuantityText->SetCoords(this->x + 0x1a,this->y);
        this->QuantityText->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      }
      sVar2=this->x;
      this->unkX = this->x + 130;
      if (this->QuantityText == NULL) sVar2 += 30;
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
BaseWidget * SMIItem::AFunc(){return userPortrait;}
BaseWidget * SMIItem::BFunc(){return QuantityText;}
BaseWidget * SMIItem::ZFunc(){return (BaseWidget*)item;}
u32 SMIItem::GetNumber(){return WidgetN_Other;}


