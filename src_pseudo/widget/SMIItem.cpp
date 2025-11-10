#include "globals.h"
#include "menuImages.h"

SMIItem::SMIItem(ItemInstance *pObject,u8 q,u8 user):BaseWidget(){
  char buff [64];
  u32 borgInd;
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
  GetItemImage(pObject->id,&borgInd);
  sprintf(gGlobals.text,"Trying to load %s (%u), borg id = (%ld)",this->item->name,this->item->id,borgInd);
  this->ItemIcon = WidgetB8(borgInd);
  this->ItemIcon->SetWidth(12);
  this->ItemIcon->SetHeight(12);
  this->Link(this->ItemIcon);
  if (this->userIndex != 0xff) {
    this->userPortrait = WidgetB8PartyPort(this->userIndex);
    this->userPortrait->SetWidth(12);
    this->userPortrait->SetHeight(12);
    this->Link(this->userPortrait);
    this->userPortrait->varU16 = this->userIndex;
  }
  this->ItemName = WClipTXTSafe(this->item->name);
  this->ItemName->SetColor(COLOR_RED1);
  this->Link(this->ItemName);
  Utilities::SetTextWidgetBoundsX(this->ItemName,0,640);
  if (this->quantity) {
    sprintf(buff,"%d",this->quantity);
    this->QuantityText = WClipTXTSafe(buff);
    this->QuantityText->varU16 = this->quantity;
    this->QuantityText->SetColor(COLOR_RED1);
    this->Link(this->QuantityText);
  }
  this->varU16 = this->item->id;
}

SMIItem::~SMIItem(){BaseWidget::~BaseWidget();}

Gfx * SMIItem::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  if ((this->posY < (short)this->boundY1) &&
     ((short)this->boundY0 < (this->posY + 0x1c))) {
    g = this->RenderChildren(g,x0,y0,x1,y1);
  }
  return g;
}

u8 SMIItem::Tick(){
  if (this->ItemName) {
    if ((this->posY < (short)this->boundY1) &&((short)this->boundY0 < (this->posY + 0x1c))) {
      if(this->userPortrait) {
        this->userPortrait->SetCoords(this->posX,this->posY);
        this->userPortrait->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      }
      this->ItemIcon->SetCoords(this->posX + 0xd,this->posY);
      this->ItemIcon->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      if(this->QuantityText) {
        this->QuantityText->SetCoords(this->posX + 0x1a,this->posY);
        this->QuantityText->SetSomeBounds(this->boundY0,this->boundX0,this->boundX1,this->boundY1);
      }
      s16 nx=this->posX;
      this->unkX = this->posX + 130;
      if (this->QuantityText == NULL) nx += 30;
      else nx += 40;
      this->nameX = nx;
      this->ItemName->SetCoords(this->nameX,this->posY);
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


