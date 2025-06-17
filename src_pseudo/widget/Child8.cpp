#include "widgets/CombatScrollMenu.h"
#include "globals.h"

extern void(*freeWidgetFunc)(BaseWidget*);
extern void(*PTR_800ed504)(BaseWidget*);
extern void(*PTR_800edb70)(BaseWidget*);

void FUN_8004cfd0(BaseWidget *w){
  if (w) {
    WHANDLE->FreeWidget(w);
    w->~BaseWidget();
  }
}


WidgetChild8::WidgetChild8(u16 choices,char *msg,s16 *dims,u16 *dims2,short *dims3,Color32 *colA,Color32 *colB,u32 param_9)
 :WidgetMenu(){
  PTR_800edb70 = freeWidgetFunc;
  freeWidgetFunc = FUN_8004cfd0;
  SetImages(dims,0);
  this->TextWidget = Utilities::AddTextWidget3(this,msg,*dims2,dims2[1],dims2[2],dims2[3],colA->R,colA->G,colA->B,colA->A);
  this->scrollMenu = Utilities::AddScrollMenu(this,choices,*dims3,dims3[1],*dims3,dims3[1],dims3[2],dims3[3],colB->R,colB->G,colB->B,colB->A,0);
  this->unkac = param_9;
}

WidgetChild8::WidgetChild8(u16 choices,char *msg,u16 param_4,Color32 *colA,Color32 *colB,u32 param_7,u16 param_8,short param_9)
:WidgetMenu(){
    ushort uVar1;
    u16 x1;
    BaseWidget *pBVar2;
    u16 x0;
    s16 uStack_68 [4];
    
    PTR_800edb70 = freeWidgetFunc;
    uVar1 = param_4 >> 1;
    x0 = -uVar1 + 0xa0;
    x1 = uVar1 + 0xa0;
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


WidgetChild8::WidgetChild8(u16 choices,u16 param_3,Color32 *colA,u32 param_5,u16 param_6)
 :WidgetMenu(){
    ushort uVar1;
    BaseWidget *pBVar2;
    s16 sx;
    s16 asStack_68 [4];
    PTR_800edb70 = freeWidgetFunc;
    uVar1 = param_3 >> 1;
    freeWidgetFunc = FUN_8004cfd0;
    asStack_68[0] = (-uVar1 + 0xa0) - param_6;
    asStack_68[2] = uVar1 + 0xa0 + param_6;
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
  
WidgetChild8::WidgetChild8(u8 choices,u16 W,u16 H,u32 param_5,u16 param_6):WidgetMenu(){
  short sVar1;
  short sx;
  short asStack_68 [4];
  
  PTR_800edb70 = freeWidgetFunc;
  sVar1 = (short)(W + 1 >> 1);
  freeWidgetFunc = FUN_8004cfd0;
  asStack_68[0] = (-sVar1 + 0xa0) - param_6;
  asStack_68[2] = sVar1 + 0xa0 + param_6;
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


WidgetChild8::~WidgetChild8(){
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

  if ((this->var5C == 0xff) &&(pBVar1 = Utilities::GetHighlightedEntry(this->scrollMenu), pBVar1 != NULL)) {
        pBVar1->AFunc();
  }
  WidgetMenu::~WidgetMenu();
}

Gfx* WidgetChild8::Render(Gfx* g, u16 x0, u16 y0, u16 x1, u16 y1){
    RSPFUNC6(g);
    return WidgetMenu::Render(g,x0,y0,x1,y1);
}

BaseWidget* WidgetChild8::AFunc(){
    this->var5C=0xff;
    return this;
}

BaseWidget* WidgetChild8::BFunc(){
    if(this->unkac){
        this->var5C=0;
        return this;
    }
    return NULL;
}

BaseWidget* WidgetChild8::UpFunc(){
    this->scrollMenu->UpFunc();
    return NULL;
}

BaseWidget* WidgetChild8::DownFunc(){
    this->scrollMenu->DownFunc();
    return NULL;
}

u8 WidgetChild8::AppendScrollMenu(BaseWidget* w){
    return this->scrollMenu->Append(w);
}


void WidgetChild8::SetImages(short *param_2,u32 param_3){
  Borg8Header *pBVar1;
  WidgetBorg8 *pBVar2;
  short sVar3;
  ushort uVar4;
  
  this->borg8WidgetA = Utilities::AddBorg8Widget2(this,loadBorg8(BORG8_Pixel),*param_2,param_2[1],param_2[2],param_2[3]);
  pBVar1 = loadBorg8(BORG8_GradientC);
  this->borg8WidgetC = Utilities::AddBorg8Widget2(this,pBVar1,*param_2,param_2[1] - (pBVar1->dat).Height,param_2[2],param_2[1]);
  pBVar1 = loadBorg8(BORG8_GradientB);
  this->borg8WidgetE = Utilities::AddBorg8Widget2(this,pBVar1,*param_2,param_2[3],param_2[2],param_2[3] + (pBVar1->dat).Height);
  pBVar1 = loadBorg8(0x1c0);
  this->borg8WidgetB = Utilities::AddBorg8Widget2(this,pBVar1,(*param_2 - (pBVar1->dat).Width) + -1,param_2[1],*param_2 + -1,param_2[3]);
  pBVar1 = loadBorg8(0x1c1);
  uVar4 = (ushort)(param_3 != 0);
  sVar3 = uVar4 + 1;
  pBVar2 = Utilities::AddBorg8Widget2
                     (this,pBVar1,param_2[2] + sVar3,param_2[1],
                      param_2[2] + (pBVar1->dat).Width + 1 + uVar4,param_2[3]);
  this->borg8WidgetD = pBVar2;
  pBVar1 = loadBorg8(0x1bc);
  this->x = (*param_2 - (pBVar1->dat).Width) + -1;
  this->y = param_2[1] - (pBVar1->dat).Height;
  pBVar2 = Utilities::AddBorg8Widget2
                     (this,pBVar1,(*param_2 - (pBVar1->dat).Width) + -1,
                      param_2[1] - (pBVar1->dat).Height,*param_2 + -1,param_2[1]);
  this->borg8WidgetF = pBVar2;
  pBVar1 = loadBorg8(0x1bd);
  uVar4 = (ushort)(param_3 != 0);
  pBVar2 = Utilities::AddBorg8Widget2
                     (this,pBVar1,param_2[2] + sVar3,param_2[1] - (pBVar1->dat).Height,
                      param_2[2] + (pBVar1->dat).Width + 1 + uVar4,param_2[1]);
  this->borg8WidgetG = pBVar2;
  pBVar1 = loadBorg8(0x1be);
  pBVar2 = Utilities::AddBorg8Widget2
                     (this,pBVar1,param_2[2] + sVar3,param_2[3],
                      param_2[2] + (pBVar1->dat).Width + 1 + uVar4,param_2[3] + (pBVar1->dat).Height
                     );
  this->borg8WidgetH = pBVar2;
  pBVar1 = loadBorg8(BORG8_GradientA);
  pBVar2 = Utilities::AddBorg8Widget2
                     (this,pBVar1,(*param_2 - (pBVar1->dat).Width) + -1,param_2[3],
                      *param_2 + -1,param_2[3] + (pBVar1->dat).Height);
  this->borg8WidgetI = pBVar2;
  Utilities::SetWidgetColor(this,COLOR_BLACK);
  SetWidgetBounds(this->borg8WidgetB,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
  SetWidgetBounds(this->borg8WidgetC,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
  SetWidgetBounds(this->borg8WidgetD,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
  SetWidgetBounds(this->borg8WidgetE,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
  SetWidgetBounds(this->borg8WidgetF,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
  SetWidgetBounds(this->borg8WidgetG,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
  SetWidgetBounds(this->borg8WidgetH,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
  SetWidgetBounds(this->borg8WidgetI,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);

}

void WidgetChild8_moveX(BaseWidget *w,s16 x){
  w->SetWidth(w->GetWidth() + x);
  x >>= 1;
  w->boundX0-= x;
  w->x-= x;
  w->boundX1+=x;
}

void WidgetChild8::MoveX(short posX){
  WidgetChild8_moveX(this->scrollMenu,posX);
  WidgetChild8_moveX(this->borg8WidgetC,posX);
  WidgetChild8_moveX(this->borg8WidgetE,posX);
  WidgetChild8_moveX(this->borg8WidgetA,posX);
  s16 px = posX >> 1;
  Utilities::MoveWidget(this->borg8WidgetB,-px,0);
  Utilities::MoveWidget(this->borg8WidgetF,-px,0);
  Utilities::MoveWidget(this->borg8WidgetI,-px,0);
  Utilities::MoveWidget(this->borg8WidgetD,px,0);
  Utilities::MoveWidget(this->borg8WidgetG,px,0);
  Utilities::MoveWidget(this->borg8WidgetH,px,0);
}

void WidgetChild8::SetHighlight(ushort h){
  WSMSub *sub = (WSMSub *)this->scrollMenu->substruct;
  if (sub) {
    if (h < sub->currentCount) sub->highlight = h;
    else sub->highlight = sub->currentCount - 1;
  }
}


void WidgetChild8::m8004de18(){
  u16 uVar1;
  BaseWidget *pBVar2;
  BaseWidget *pBVar4;
  short sVar5;
  short sVar6;
  u16 uVar7;
  u16 uVar8;
  short sVar9;
  u16 uVar10;
  

  if(this->TextWidget)this->TextWidget->Tick();
  this->scrollMenu->Tick();
  pBVar2 = this->TextWidget;
  uVar7 = 0;
  if (this->TextWidget) uVar7 = this->TextWidget->GetHeight();
  uVar8 = this->scrollMenu->GetHeight();
  if (this->scrollMenu->boundY1 < uVar8)
    uVar8 = this->scrollMenu->boundY1;
  uVar10 = 0x78 - (u16)((uVar8 + uVar7 + this->unka8 + (uint)this->unkaa * 2) >> 1)
  ;
  sVar6 = uVar10 - this->unkaa;
  if (this->TextWidget) {
    this->TextWidget->boundY1 = uVar10 + (short)uVar7;
    this->TextWidget->y = uVar10;
    this->TextWidget->boundY0 = uVar10;
  }
  pBVar2 = this->scrollMenu;
  pBVar2->y = uVar10;
  pBVar2->boundY0 = uVar10;
  if (this->TextWidget) {
    uVar10 = this->TextWidget->boundY1 + this->unka8;
    this->TextWidget->y = uVar10;
    this->TextWidget->boundY0 = uVar10;
  }
  pBVar2 = this->borg8WidgetA;
  uVar10 = (short)uVar8 + this->scrollMenu->boundY0;
  this->scrollMenu->boundY1 = uVar10;
  uVar1 = this->unkaa;
  this->borg8WidgetA->y = sVar6;
  sVar5 = uVar10 + uVar1;
  sVar9 = sVar5 - sVar6;
  this->borg8WidgetA->SetHeight(sVar9);
  pBVar2 = this->borg8WidgetB;
  pBVar2->y = sVar6;
  this->borg8WidgetB->SetHeight(sVar9);
  uVar7 =this->borg8WidgetC->GetHeight();
  pBVar2 = this->borg8WidgetD;
  this->borg8WidgetC->y = sVar6 - (short)uVar7;
  pBVar2->y = sVar6;
  this->borg8WidgetD->SetHeight(sVar9);
  pBVar2 = this->borg8WidgetF;
  this->borg8WidgetE->y = sVar5;
  uVar7 = pBVar2->GetHeight();
  pBVar2 = this->borg8WidgetG;
  this->borg8WidgetF->y = sVar6 - (short)uVar7;
  uVar7 = pBVar2->GetHeight();
  pBVar2 = this->borg8WidgetH;
  pBVar4 = this->borg8WidgetI;
  this->borg8WidgetG->y = sVar6 - (short)uVar7;
  pBVar2->y = sVar5;
  pBVar4->y = sVar5;
  this->Tick();
}

void Ofunc_8004e048(BaseWidget *w,short x,short y){
  Utilities::MoveWidget(w,x - w->x,y - w->y);
  w->Tick();
}

void WidgetChild8::m8004e0b0(Color32 *c){
    this->borg8WidgetA->SetColor(c->R,c->G,c->B,c->A);
}
