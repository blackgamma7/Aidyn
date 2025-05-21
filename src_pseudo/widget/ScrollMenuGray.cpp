#include "widgets/WidgetScrollMenu.h"
#include "crash.h"

WidgetScrollMenuGray::WidgetScrollMenuGray(u16 length,Color32* colP)
:WidgetScrollMenu(length){
    unk80.W=colP->W;
    UpButtonFunc=WSMG_ScrollUp;
    DownButtonFunc=WSMG_ScrollDown;
}

u8 WidgetScrollMenuGray::Tick(){
  this->width = this->boundX1 - this->boundX0;
  this->height = this->boundY1 - this->boundY0;
  u8 uVar3 = WidgetScrollMenu::Tick();
  WSMSub* sub = (WSMSub *)this->substruct;
  if ((sub->items == NULL) || (sub->currentCount == 0)) {
    return uVar3;
  }
  for(u16 i=0;i<sub->currentCount;i++){
    BaseWidget* w =sub->items[i];
    if(w->var5C==1)w->SetColor(unk80.R,unk80.G,unk80.B,unk80.A);
  }
  return uVar3;
}

bool WidgetScrollMenuGray::Append(BaseWidget *w,byte val){
  bool ret=WidgetScrollMenu::Append(w);
  if (ret) w->var5C = val;
  return ret;
}

void WidgetScrollMenuGray::SetHighlight(){
  WSMSub* sub = (WSMSub *)this->substruct;
  if ((ushort)sub->currentCount != 0) {
    for(u16 i=0;i<sub->currentCount;i++){
        if(sub->items[i]->var5C!=1){
            sub->highlight=i;
            return;
        }
    }
  }
  sub->highlight=0;
}

void WidgetScrollMenuGray::SetChoice(u16 param_2){
  WSMSub *sub = (WSMSub *)this->substruct;
  if (sub->currentCount != 0) {
    if (sub->items[sub->highlight]) {
      BaseWidget* w = sub->items[sub->highlight];
      w->SetColor(this->col.R,this->col.G,this->col.B,this->col.A);
      s16 iVar9 = sub->highlight;
      do {
        iVar9+=param_2;
        if (iVar9 < 0) iVar9 = sub->currentCount - 1;
        if (sub->currentCount <= iVar9) iVar9 = 0;
        if (sub->items[iVar9] == NULL) {
          CRASH("NULL choice found in widgetscrollmenugray",
                             "./menus/widgetscrollmenugray.cpp");
        }
        w = sub->items[iVar9];
        if (w->var5C != 1) {
          sub->highlight = (s16)iVar9;
          w->SetColor(sub->col.R,sub->col.G,sub->col.B,sub->col.A);
          return;
        }
      } while (iVar9 != sub->highlight);
    }
  }
}

BaseWidget* WSMG_ScrollUp(BaseWidget* param_1,BaseWidget *w){
    WidgetScrollMenuGray* wg= (WidgetScrollMenuGray*)w;
    wg->SetChoice(-1);
  return NULL;
}

BaseWidget* WSMG_ScrollDown(BaseWidget* param_1,BaseWidget *w){
    WidgetScrollMenuGray* wg= (WidgetScrollMenuGray*)w;
    wg->SetChoice(1);
  return NULL;
}

WidgetScrollMenuGray* WSMG_Init(BaseWidget *bw,u16 len,s16 x,s16 y,u16 bx0,u16 by0,u16 bx1,ushort by1,u8 r,u8 g,u8 b,u8 a,u32 setCols,Color32 *col){
  WidgetScrollMenuGray *w = new WidgetScrollMenuGray(len,col);
  w->SetCoords(x,y);
  w->boundX0 = bx0;
  w->boundX1 = bx1;
  w->boundY1 = by1;
  w->boundY0 = by0;
  w->SetColor(r,g,b,a);
  if (bw) bw->Link(w);
  if (setCols) {
    WSMSub *sub = (WSMSub *)w->substruct;
    sub->reds[1] = r;
    sub->reds[0] = r;
    sub->greens[1] = g;
    sub->greens[0] = g;
    sub->blues[1] = b;
    sub->blues[0] = b;
    sub->alphas[1] = a;
    sub->alphas[0] = a;
  }
  return w;
}

WidgetScrollMenuGray::~WidgetScrollMenuGray(){WidgetScrollMenu::~WidgetScrollMenu();}

