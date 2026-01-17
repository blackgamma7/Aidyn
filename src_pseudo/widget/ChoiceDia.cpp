#include "widgets/CombatScrollMenu.h"
#include "globals.h"

extern void(*PTR_800ed504)(BaseWidget*);
extern void(*PTR_800edb70)(BaseWidget*);

void FUN_8004cfd0(BaseWidget *w){
  if (w) {
    WHANDLE->FreeWidget(w);
    w->~BaseWidget();
  }
}

WidgetChoiceDia::WidgetChoiceDia(u16 choices,char *msg,s16 *dims,u16 *dims2,s16 *dims3,Color32 *colA,Color32 *colB,u32 param_9)
 :WidgetMenu(){
  PTR_800edb70 = freeWidgetFunc;
  freeWidgetFunc = FUN_8004cfd0;
  SetImages(dims,0);
  this->TextWidget = Utilities::AddTextWidget3(this,msg,*dims2,dims2[1],dims2[2],dims2[3],colA->R,colA->G,colA->B,colA->A);
  this->scrollMenu = Utilities::AddScrollMenu(this,choices,*dims3,dims3[1],*dims3,dims3[1],dims3[2],dims3[3],colB->R,colB->G,colB->B,colB->A,0);
  this->unkac = param_9;
}

WidgetChoiceDia::WidgetChoiceDia(u16 choices,char *msg,u16 param_4,Color32 *colA,Color32 *colB,u32 param_7,u16 param_8,s16 param_9)
:WidgetMenu(){
    u16 uVar1;
    u16 x1;
    BaseWidget *pBVar2;
    u16 x0;
    s16 uStack_68 [4];
    
    PTR_800edb70 = freeWidgetFunc;
    uVar1 = param_4 >> 1;
    x0 = -uVar1 + SCREEN_CENTERW;
    x1 = uVar1 + SCREEN_CENTERW;
    freeWidgetFunc = FUN_8004cfd0;
    uStack_68[0] = x0 - param_9;
    uStack_68[2] = x1 + param_9;
    uStack_68[1] = 0;
    uStack_68[3] = SCREEN_HEIGHT;
    SetImages(uStack_68,0);
    uStack_68[0] = x0;
    uStack_68[2] = x1;
    this->TextWidget = Utilities::AddTextWidget3(this,msg,x0,uStack_68[1],x1,uStack_68[3],colA->R,colA->G,colA->B,colA->A);
    this->scrollMenu = Utilities::AddScrollMenu(this,choices,-uVar1 + 0x9f,0,-uVar1 + 0x9f,0,uVar1 + 0xa1,SCREEN_HEIGHT,colB->R,colB->G,colB->B,colB->A,0);;
    this->unka8 = param_8;
    this->unkaa = param_9;
    this->unkac = param_7;
}


WidgetChoiceDia::WidgetChoiceDia(u16 choices,u16 param_3,Color32 *colA,u32 param_5,u16 param_6)
 :WidgetMenu(){
    u16 uVar1;
    BaseWidget *pBVar2;
    s16 sx;
    s16 asStack_68 [4];
    PTR_800edb70 = freeWidgetFunc;
    uVar1 = param_3 >> 1;
    freeWidgetFunc = FUN_8004cfd0;
    asStack_68[0] = (-uVar1 + SCREEN_CENTERW) - param_6;
    asStack_68[2] = uVar1 + SCREEN_CENTERW + param_6;
    asStack_68[1] = 0;
    asStack_68[3] = SCREEN_HEIGHT;
    SetImages(asStack_68,0);
    sx = -uVar1 + 0x9f;
    this->TextWidget = NULL;
    this->unkac = param_5;
    this->unkaa = param_6;
    this->scrollMenu = Utilities::AddScrollMenu(this,choices,sx,0,sx,0,uVar1 + 0xa1,SCREEN_HEIGHT,colA->R,colA->G,colA->B,colA->A,0);
    this->unka8 = 0;
}
  
WidgetChoiceDia::WidgetChoiceDia(u8 choices,u16 W,u16 H,u32 param_5,u16 param_6):WidgetMenu(){
  s16 sVar1;
  s16 sx;
  s16 asStack_68 [4];
  
  PTR_800edb70 = freeWidgetFunc;
  sVar1 = (s16)(W + 1 >> 1);
  freeWidgetFunc = FUN_8004cfd0;
  asStack_68[0] = (-sVar1 + SCREEN_CENTERW) - param_6;
  asStack_68[2] = sVar1 + SCREEN_CENTERW + param_6;
  asStack_68[1] = 0;
  asStack_68[3] = SCREEN_HEIGHT;
  SetImages(asStack_68,0);
  this->TextWidget = NULL;
  this->scrollMenu = new WidgetCombatScrollMenu(choices);
  this->scrollMenu->SetHeight(H);
  this->scrollMenu->SetWidth(W);
  sx = -sVar1 + 0x9f;
  this->scrollMenu->SetCoords(sx,0);
  SetWidgetBounds(this->scrollMenu,sx,0,sVar1 + 0xa1,H);
  Link(this->scrollMenu);
  this->unkac = param_5;
  this->unkaa = param_6;
  this->unka8 = 0;
}


WidgetChoiceDia::~WidgetChoiceDia(){
  BaseWidget *pBVar1;
  
  freeWidgetFunc = PTR_800edb70;
  PTR_800edb70 = NULL;
  FREEQB8(this->borg8WidgetB->borg8);
  FREEQB8(this->borg8WidgetC->borg8);
  FREEQB8(this->borg8WidgetD->borg8);
  FREEQB8(this->borg8WidgetE->borg8);
  FREEQB8(this->borg8WidgetF->borg8);
  FREEQB8(this->borg8WidgetG->borg8);
  FREEQB8(this->borg8WidgetH->borg8);
  FREEQB8(this->borg8WidgetI->borg8);
  FREEQB8(this->borg8WidgetA->borg8);

  if ((this->varU8 == 0xff) &&(pBVar1 = Utilities::GetHighlightedEntry(this->scrollMenu), pBVar1 != NULL)) {
        pBVar1->AFunc();
  }
  WidgetMenu::~WidgetMenu();
}

Gfx* WidgetChoiceDia::Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1){
    RSPFUNC6(g);
    return WidgetMenu::Render(g,x0,y0,x1,y1);
}

BaseWidget* WidgetChoiceDia::AFunc(){
    this->varU8=0xff;
    return this;
}

BaseWidget* WidgetChoiceDia::BFunc(){
    if(this->unkac){
        this->varU8=0;
        return this;
    }
    return NULL;
}

BaseWidget* WidgetChoiceDia::UpFunc(){
    this->scrollMenu->UpFunc();
    return NULL;
}

BaseWidget* WidgetChoiceDia::DownFunc(){
    this->scrollMenu->DownFunc();
    return NULL;
}

u8 WidgetChoiceDia::AppendScrollMenu(BaseWidget* w){
    return this->scrollMenu->Append(w);
}


void WidgetChoiceDia::SetImages(s16 *bounds,u32 param_3){
  Borg8Header *pBVar1;
  WidgetBorg8 *pBVar2;
  s16 sVar3;
  u16 uVar4;
  
  this->borg8WidgetA = Utilities::AddBorg8Widget2(this,loadBorg8(BORG8_Pixel),*bounds,bounds[1],bounds[2],bounds[3]);
  pBVar1 = loadBorg8(BORG8_GradientC);
  this->borg8WidgetC = Utilities::AddBorg8Widget2(this,pBVar1,*bounds,bounds[1] - (pBVar1->dat).Height,bounds[2],bounds[1]);
  pBVar1 = loadBorg8(BORG8_GradientB);
  this->borg8WidgetE = Utilities::AddBorg8Widget2(this,pBVar1,*bounds,bounds[3],bounds[2],bounds[3] + (pBVar1->dat).Height);
  pBVar1 = loadBorg8(BORG8_GradientA);
  this->borg8WidgetB = Utilities::AddBorg8Widget2(this,pBVar1,(*bounds - (pBVar1->dat).Width) + -1,bounds[1],*bounds + -1,bounds[3]);
  pBVar1 = loadBorg8(BORG8_GradientD);
  uVar4 = (u16)(param_3 != 0);
  sVar3 = uVar4 + 1;
  pBVar2 = Utilities::AddBorg8Widget2
                     (this,pBVar1,bounds[2] + sVar3,bounds[1],
                      bounds[2] + (pBVar1->dat).Width + 1 + uVar4,bounds[3]);
  this->borg8WidgetD = pBVar2;
  pBVar1 = loadBorg8(BORG8_GradientRoundA);
  this->posX = (*bounds - (pBVar1->dat).Width) + -1;
  this->posY = bounds[1] - (pBVar1->dat).Height;
  pBVar2 = Utilities::AddBorg8Widget2
                     (this,pBVar1,(*bounds - (pBVar1->dat).Width) + -1,
                      bounds[1] - (pBVar1->dat).Height,*bounds + -1,bounds[1]);
  this->borg8WidgetF = pBVar2;
  pBVar1 = loadBorg8(BORG8_GradientRoundB);
  uVar4 = (u16)(param_3 != 0);
  pBVar2 = Utilities::AddBorg8Widget2
                     (this,pBVar1,bounds[2] + sVar3,bounds[1] - (pBVar1->dat).Height,
                      bounds[2] + (pBVar1->dat).Width + 1 + uVar4,bounds[1]);
  this->borg8WidgetG = pBVar2;
  pBVar1 = loadBorg8(BORG8_GradientRoundC);
  pBVar2 = Utilities::AddBorg8Widget2
                     (this,pBVar1,bounds[2] + sVar3,bounds[3],
                      bounds[2] + (pBVar1->dat).Width + 1 + uVar4,bounds[3] + (pBVar1->dat).Height
                     );
  this->borg8WidgetH = pBVar2;
  pBVar1 = loadBorg8(BORG8_GradientRoundD);
  pBVar2 = Utilities::AddBorg8Widget2
                     (this,pBVar1,(*bounds - (pBVar1->dat).Width) + -1,bounds[3],
                      *bounds + -1,bounds[3] + (pBVar1->dat).Height);
  this->borg8WidgetI = pBVar2;
  Utilities::SetWidgetColor(this,COLOR_BLACK);
  SetWidgetBounds(this->borg8WidgetB,FULL_SCREENSPACE);
  SetWidgetBounds(this->borg8WidgetC,FULL_SCREENSPACE);
  SetWidgetBounds(this->borg8WidgetD,FULL_SCREENSPACE);
  SetWidgetBounds(this->borg8WidgetE,FULL_SCREENSPACE);
  SetWidgetBounds(this->borg8WidgetF,FULL_SCREENSPACE);
  SetWidgetBounds(this->borg8WidgetG,FULL_SCREENSPACE);
  SetWidgetBounds(this->borg8WidgetH,FULL_SCREENSPACE);
  SetWidgetBounds(this->borg8WidgetI,FULL_SCREENSPACE);

}

void WidgetChoiceDia_moveX(BaseWidget *w,s16 x){
  w->SetWidth(w->GetWidth() + x);
  x >>= 1;
  w->boundX0-= x;
  w->posX-= x;
  w->boundX1+=x;
}

void WidgetChoiceDia::MoveX(s16 posX){
  WidgetChoiceDia_moveX(this->scrollMenu,posX);
  WidgetChoiceDia_moveX(this->borg8WidgetC,posX);
  WidgetChoiceDia_moveX(this->borg8WidgetE,posX);
  WidgetChoiceDia_moveX(this->borg8WidgetA,posX);
  s16 px = posX >> 1;
  Utilities::MoveWidget(this->borg8WidgetB,-px,0);
  Utilities::MoveWidget(this->borg8WidgetF,-px,0);
  Utilities::MoveWidget(this->borg8WidgetI,-px,0);
  Utilities::MoveWidget(this->borg8WidgetD,px,0);
  Utilities::MoveWidget(this->borg8WidgetG,px,0);
  Utilities::MoveWidget(this->borg8WidgetH,px,0);
}

void WidgetChoiceDia::SetHighlight(u16 h){
  WSMSub *sub = (WSMSub *)this->scrollMenu->substruct;
  if (sub) {
    if (h < sub->numChoices) sub->highlight = h;
    else sub->highlight = sub->numChoices - 1;
  }
}


void WidgetChoiceDia::Update(){
  u16 uVar1;
  BaseWidget *pBVar2;
  BaseWidget *pBVar4;
  s16 sVar5;
  s16 sVar6;
  u16 uVar7;
  u16 uVar8;
  s16 sVar9;
  u16 uVar10;
  

  if(this->TextWidget)this->TextWidget->Tick();
  this->scrollMenu->Tick();
  pBVar2 = this->TextWidget;
  uVar7 = 0;
  if (this->TextWidget) uVar7 = this->TextWidget->GetHeight();
  uVar8 = this->scrollMenu->GetHeight();
  if (this->scrollMenu->boundY1 < uVar8)
    uVar8 = this->scrollMenu->boundY1;
  uVar10 = 120 - (u16)((uVar8 + uVar7 + this->unka8 + (u32)this->unkaa * 2) >> 1);
  sVar6 = uVar10 - this->unkaa;
  if (this->TextWidget) {
    this->TextWidget->boundY1 = uVar10 + (s16)uVar7;
    this->TextWidget->posY = uVar10;
    this->TextWidget->boundY0 = uVar10;
  }
  pBVar2 = this->scrollMenu;
  pBVar2->posY = uVar10;
  pBVar2->boundY0 = uVar10;
  if (this->TextWidget) {
    uVar10 = this->TextWidget->boundY1 + this->unka8;
    this->TextWidget->posY = uVar10;
    this->TextWidget->boundY0 = uVar10;
  }
  pBVar2 = this->borg8WidgetA;
  uVar10 = (s16)uVar8 + this->scrollMenu->boundY0;
  this->scrollMenu->boundY1 = uVar10;
  uVar1 = this->unkaa;
  this->borg8WidgetA->posY = sVar6;
  sVar5 = uVar10 + uVar1;
  sVar9 = sVar5 - sVar6;
  this->borg8WidgetA->SetHeight(sVar9);
  pBVar2 = this->borg8WidgetB;
  pBVar2->posY = sVar6;
  this->borg8WidgetB->SetHeight(sVar9);
  uVar7 =this->borg8WidgetC->GetHeight();
  pBVar2 = this->borg8WidgetD;
  this->borg8WidgetC->posY = sVar6 - (s16)uVar7;
  pBVar2->posY = sVar6;
  this->borg8WidgetD->SetHeight(sVar9);
  pBVar2 = this->borg8WidgetF;
  this->borg8WidgetE->posY = sVar5;
  uVar7 = pBVar2->GetHeight();
  pBVar2 = this->borg8WidgetG;
  this->borg8WidgetF->posY = sVar6 - (s16)uVar7;
  uVar7 = pBVar2->GetHeight();
  pBVar2 = this->borg8WidgetH;
  pBVar4 = this->borg8WidgetI;
  this->borg8WidgetG->posY = sVar6 - (s16)uVar7;
  pBVar2->posY = sVar5;
  pBVar4->posY = sVar5;
  this->Tick();
}

void Ofunc_8004e048(BaseWidget *w,s16 x,s16 y){
  Utilities::MoveWidget(w,x - w->posX,y - w->posY);
  w->Tick();
}

void WidgetChoiceDia::m8004e0b0(Color32 *c){
    this->borg8WidgetA->SetColor(c->R,c->G,c->B,c->A);
}
