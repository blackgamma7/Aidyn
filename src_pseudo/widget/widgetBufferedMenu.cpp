#include "gamestatemod.h"
#include "globals.h"

WidgetBufferedMenu::WidgetBufferedMenu
          (GSMClass *obj,u16 visItems,u16 totalItems,u16 *bounds,s16 *titleBounds,
            Color32 *colA,Color32 *ColB,Color32 *colC,Color32 *colD):BaseWidget() {
  WidgetText *pBVar7 = this->textWidgets;
  s32 iVar8 = 19;
  do {
    *pBVar7=WidgetText(NULL,400);
    iVar8--;
    pBVar7++;
  } while (iVar8 != -1);
  this->titleWidget=WidgetText(NULL,400);
  if((!visItems)||(!totalItems)){
    CRASH("Can't create a buffered menu with nothing visible or nothing in it!",
                     "./menus/widgetbufferedmenu.cpp");
  }
  else {
    if (totalItems < visItems) {
      CRASH("Use a widgetscrollmenu if the number of visible items is less than the total number!",
                         "./menus/widgetbufferedmenu.cpp");
    }
    (this->titleWidget).boundX0 = titleBounds[0];
    (this->titleWidget).boundY0 = titleBounds[1];
    (this->titleWidget).boundX1 = titleBounds[2];
    (this->titleWidget).boundY1 = titleBounds[3];
    this->titleWidget.SetCoords(titleBounds[0],titleBounds[1]);
    this->titleWidget.SetColor(colA->R,colA->G,colA->B,colA->A);
    this->txtIn = Utilities::GetWidgetText(&this->titleWidget);
    this->posX = bounds[0];
    this->posY = bounds[1];
    this->boundX0 = bounds[0];
    this->boundY0 = bounds[1];
    this->boundX1 = bounds[2];
    this->boundY1 = bounds[3];
    this->width = bounds[2] - bounds[0];
    this->txtGetter = obj;
    this->unk80[0] = 10;
    this->unk92 = 0;
    this->unk96 = 0;
    this->unk80[1] = 1;
    this->height = bounds[3] - bounds[1];
    this->reds[0] = colC->R;
    this->reds[1] = colD->R;
    this->blues[0] = colC->G;
    this->blues[1] = colD->G;
    this->greens[0] = colC->B;
    this->greens[1] = colD->B;
    this->alphas[0] = colC->A;
    this->alphas[1] = colD->A;
    this->unk8a[1] = 0;
    this->unk8a[0] = 0x14;
    (this->col8C).R = 0;
    (this->col8C).G = 0;
    (this->col8C).B = 0;
    (this->col8C).A = 0;
    BaseWidget::SetColor(ColB->R,ColB->G,ColB->B,ColB->A);
    this->unka9e = 0;
    this->unka9f = 0;
    this->substruct = &this->txtGetter;
    this->listBottom = visItems;
    this->unka9c = 0;
    this->unka9a = totalItems;
    for(u8 i=0;i<visItems;i++){
        this->textWidgetsP[i]=&this->textWidgets[i];
    }
    UpdateTexts();
  }

}

WidgetBufferedMenu::~WidgetBufferedMenu() {
  BaseWidget *pBVar2;
  this->titleWidget.~WidgetText();
  if ((this != (WidgetBufferedMenu *)0xffffff68)/*?*/ &&
     (this->textWidgets != (BaseWidget *)this->textWidgetsP)) {
    WidgetText *pBVar2 = this->textWidgets + 0x13;
    do {
      pBVar2->~WidgetText();
      pBVar2--;
    } while (this->textWidgets != pBVar2);
  }
  BaseWidget::~BaseWidget();
}

u8 WidgetBufferedMenu::Tick(){
  short sVar12;
  u16 uVar13;
  u8 uVar19;
  int iVar16;
  ulong uVar18;
  bool bVar20;
  uint uVar22;
  u16 uVar24;
  int iVar23;
  
  uVar22 = (uint)(u16)this->unka9c + this->unka9e;
  if (this->unka9a <= uVar22) {
    uVar22-= this->unka9a;
  }
  GSMClass* ppfVar14=this->txtGetter;
  ppfVar14->vMethC(uVar22,this->txtIn);
  uVar19 = this->unk8a[1] + this->unk80[1];
  this->unk8a[1] = uVar19;
  iVar23 = 0;
  uVar24 = 0;
  if ((uVar19 == 0) || ((int)(this->unk8a[0] - 1) <= (int)(uint)this->unk8a[1])) {
    this->unk80[1] = -this->unk80[1];
  }
  uVar22 = 0;
  (this->col8C).R =
    this->reds[0] + (((uint)this->reds[1] - (uint)this->reds[0]) / (uint)this->unk8a[0]) * this->unk8a[1];
  (this->col8C).G = 
    this->greens[0] + (((uint)this->greens[1] - (uint)this->greens[0]) / (uint)this->unk8a[0]) * this->unk8a[1];
  (this->col8C).B = 
    this->blues[0] + (((uint)this->blues[1] - (uint)this->blues[0]) / (uint)this->unk8a[0]) * this->unk8a[1];
  (this->col8C).A =
       this->alphas[0] + (((uint)this->alphas[1] - (uint)this->alphas[0]) / (uint)this->unk8a[0]) * this->unk8a[1];
  for (u8 uVar22 = 0;uVar22 < this->listBottom;uVar22++) {
    WidgetText*pBVar15 = this->textWidgetsP[uVar22];
    pBVar15->boundX0 = this->boundX0;
    pBVar15->boundX1 = this->boundX1;
    pBVar15->boundY0 = this->boundY0;
    pBVar15->boundY1 = this->boundY1;
    pBVar15->SetCoords(this->posX,this->posY + (short)iVar23 + this->unk92);
    pBVar15->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
    s16 uVar17 = pBVar15->GetHeight();
    iVar23+= pBVar15->GetHeight() + this->unka9e;
    uVar24 = (s16)iVar23;
    if (uVar22 == this->unka9e) {
      sVar12 = pBVar15->posY;
        iVar16 = (int)sVar12 + uVar17;
        if ((this->boundY1 < iVar16) &&
           (this->unk92 == this->unk96)) {
          this->unk96 -=(s16)(iVar16 - this->boundY1);
        }
        if ((sVar12 < this->boundY0) && (this->unk92 == this->unk96)) {
          this->unk96 =(short)(this->boundY0 - sVar12) +this->unk96;
        }
        pBVar15->SetColor(this->col8C.R,this->col8C.G,this->col8C.B,this->col8C.A);
    }
  }
  this->SetHeight(uVar24);
  if (this->unk94 < this->unk90) {
    iVar23 = (u16)this->unk90 - (uint)this->unk80[0];
    this->unk90 = (s16)iVar23;
    bVar20=iVar23<this->unk94;
LAB_80031b0c:
    if (bVar20) {
      this->unk90 = this->unk94;
    }
  }
  else {
    if (this->unk90 < this->unk94) {
      iVar23 = this->unk90 + this->unk80[0];
      this->unk90 = (s16)iVar23;
      bVar20 = this->unk94 < iVar23;
      goto LAB_80031b0c;
    }
  }
  if (this->unk96 < this->unk92) {
    iVar23 = this->unk92 - this->unk80[0];
    this->unk92 = (s16)iVar23;
    bVar20 = iVar23 < this->unk96;
  }
  else {
    if (this->unk96 <= this->unk92) goto LAB_80031b74;
    iVar23 = this->unk92 + this->unk80[0];
    this->unk92 = (s16)iVar23;
    bVar20 = this->unk96 < iVar23;
  }
  if (bVar20) {
    this->unk92 = this->unk96;
  }
LAB_80031b74:
  return TickChildren();
}

Gfx * WidgetBufferedMenu::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1) {
  Gfx *pGVar2 = BaseWidget::RenderChildren(g,x0,y0,x1,y1);
  for(u8 i=0;i<this->listBottom;i++){
    pGVar2=this->textWidgetsP[i]->Render(pGVar2,x0,y0,x1,y1);
  }
  return this->titleWidget.Render(pGVar2,x0,y0,x1,y1);
}

BaseWidget* WidgetBufferedMenu::Control(controller_aidyn* cont){
    if(cont->held&L_BUTTON){
        if(cont->pressed&C_UP) return this->LCUp();
        if(cont->pressed&C_DOWN) return this->LCDown();
    }
    return BaseWidget::Control(cont);
}


BaseWidget * WidgetBufferedMenu::UpFunc() {
  this->textWidgetsP[this->unka9e]->SetColor(
    this->col.R,this->col.G,this->col.B,this->col.A);
  if (this->unka9e == 0) {
    if (this->unka9c == 0) {
      this->unka9c = this->unka9a;
    }
    this->unka9c--;
    UpdateTexts();
  }
  else {
    this->unka9e--;
    this->textWidgetsP[this->unka9e]->SetColor(
        this->col8C.R,this->col8C.G,this->col8C.B,this->col8C.A);
  }
  return NULL;
}

BaseWidget * WidgetBufferedMenu::DownFunc() {
  this->textWidgetsP[this->unka9e]->SetColor(
    this->col.R,this->col.G,this->col.B,this->col.A);
  this->unka9e++;
  if(this->unka9e<this->listBottom){
   this->textWidgetsP[this->unka9e]->SetColor(
    this->col8C.R,this->col8C.G,this->col8C.B,this->col8C.A);
  }
  else{
    this->unka9e=this->listBottom-1;
    this->unka9c++;
    if(this->unka9c==this->unka9a)this->unka9c=0;
    UpdateTexts();
  }
  return NULL;
}

BaseWidget * WidgetBufferedMenu::CLeftFunc(){
  this->unka9c=0;
  UpdateTexts();
  return NULL;
}

BaseWidget * WidgetBufferedMenu::CRightFunc(){
  this->unka9c=this->unka9a-this->listBottom;
  UpdateTexts();
  return NULL;
}

BaseWidget * WidgetBufferedMenu::CUpFunc() {
  if (this->unka9c < this->listBottom)
    this->unka9c = this->unka9a - (this->listBottom - this->unka9c);
  else this->unka9c = this->unka9c - this->listBottom;
  UpdateTexts();
  return NULL;
}

BaseWidget * WidgetBufferedMenu::CDownFunc() {
  this->unka9c + this->listBottom;
  this->unka9c = this->unka9c + this->listBottom;
  if (this->unka9a < this->unka9c) {
    this->unka9c -= this->unka9a;
  }
  UpdateTexts();
  return NULL;
}


BaseWidget * WidgetBufferedMenu::AFunc() {
  WidgetText* t = this->textWidgetsP[this->unka9e];
  this->txtGetter->vMethB(t->varU16,Utilities::GetWidgetText(t));
  UpdateTexts();
  return NULL;
}

BaseWidget * WidgetBufferedMenu::BFunc(){return this;}

BaseWidget * WidgetBufferedMenu::LCUp() {
  if (this->unka9c < 500) this->unka9c = 0;
  else this->unka9c-= 500;
  UpdateTexts();
  return NULL;
}

BaseWidget * WidgetBufferedMenu::LCDown() {
  this->unka9c+= 500;
  return NULL;
}

void WidgetBufferedMenu::UpdateTexts() {
  u8 i = 0;
  u16 j = this->unka9c;
  if (this->listBottom != 0) {
    do {
      if (this->unka9a <= j) j-= this->unka9a;
      this->txtGetter->vMethA(j,Utilities::GetWidgetText(this->textWidgetsP[i]));
      i++;
      this->textWidgetsP[i]->varU16 = j++;
    } while (i < this->listBottom);
  }
}

u32 WidgetBufferedMenu::GetNumber(){return WidgetN_BufferedMenu;}