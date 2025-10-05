#include "widgets/handler.h"
#include "crash.h"
#include "freeQueue.h"

FontStruct* PTR_800f36e0=NULL;
QueueStructA*queue_struct_pointer=NULL;

u8 WidgetHandler::Init(FontStruct *param_2){
  PTR_800f36e0 = param_2;
  head = NULL;
  tail = NULL;
  font_pointer = param_2;
  return true;
}

void WidgetHandler::Free(u32 flag){

  BaseWidget *w = this->head;
  while (w) {
    BaseWidget *pBVar1 = this->head->link2;
    this->head = pBVar1;
    if (pBVar1) pBVar1->link1 = NULL;
    AllocFreeQueueItem(queue_struct_pointer,(void**)&w,QueueType_Widget,0);
    w = this->head;
  }
  if ((flag & 1)) delete this;
}


u8 WidgetHandler::Tick(u8 delta){
  BaseWidget *pBVar1;
  u8 uVar3;
  byte bVar4;
  byte bVar5;
  BaseWidget *pBStack_20;
  
  bVar5 = 0;
  bVar4 = 0;
  pBVar1 = this->head;
  if (delta == 0) return 0;
joined_r0x800b7018:
  while (pBStack_20 = pBVar1, pBStack_20 == NULL) {
    if (bVar4 == 6) return 6;
    bVar5++;
    pBVar1 = pBStack_20;
    if (delta <= bVar5) return bVar4;
  }
  bVar4 = pBStack_20->state;
  pBVar1 = pBStack_20->link2;
  if (false) goto switchD_800b7054_caseD_4;
  switch(bVar4) {
  case 1:
  case 2:
    if (pBStack_20->RunFadeIn() != 2) goto joined_r0x800b7018;
    pBStack_20->SetState(3);
    pBStack_20->Tick();
    bVar4 = pBStack_20->state;
    break;
  case 3:
    pBStack_20->Tick();
    bVar4 = 3;
    break;
  case 5:
  case 6:
    pBStack_20->RunFadeOut();
    bVar4 = 5;
    if (uVar3 != 6) break;
    bVar4 = 6;
    FreeWidget(pBStack_20);
    AllocFreeQueueItem(queue_struct_pointer,(void**)&pBStack_20,QueueType_Widget,0);
    goto joined_r0x800b7018;
  }
switchD_800b7054_caseD_4:
  goto joined_r0x800b7018;
}

u8 WidgetHandler::StopWidget(BaseWidget *w){
  BaseWidget *pBVar1 = this->head;
  while(1) {
    if (!pBVar1) return false;
    if (pBVar1 == w) break;
    pBVar1 = pBVar1->link2;
  }
  pBVar1->SetState(5);
  return true;
}

BaseWidget * WidgetHandler::Control(ControllerFull *cont){
  BaseWidget *pBVar1 = this->tail;
  if ((pBVar1 == NULL) || (pBVar1->state != 3)) pBVar1 = NULL;
  else pBVar1 = pBVar1->Control(&cont->contAidyn);
  return pBVar1;
}


u8 WidgetHandler::AddWidget(BaseWidget *w){
  BaseWidget *pBVar1;
  
  if (w) {
    if (this->head == NULL) this->head = w;
    else {
      for (pBVar1 = this->tail; pBVar1 != NULL; pBVar1 = pBVar1->link1) {
        if (pBVar1 == w)
          CRASH("Widget already added to the handler","./src/widgethandler.cpp");
      }
      this->tail->link2 = w;
      w->link1 = this->tail;
    }
    this->tail = w;
  }
  return true;
}


BaseWidget * WidgetHandler::RemoveWidget(){
  BaseWidget *pBVar1;
  BaseWidget *pBVar2;
  
  pBVar1 = this->tail;
  if (pBVar1) {
    pBVar2 = pBVar1->link1;
    this->tail = pBVar2;
    if (!pBVar2) this->head = NULL;
    else pBVar2->link2 = NULL;
    pBVar1->link1 = NULL;
    return pBVar1;
  }
  return NULL;
}

BaseWidget * WidgetHandler::GetTail(){return tail;}


u8 WidgetHandler::FreeWidget(BaseWidget *param_2){
  BaseWidget *pBVar1 = this->head;
  while(1) {
    if (!pBVar1) return false;
    if (pBVar1 == param_2) break;
    pBVar1 = pBVar1->link2;
  }
  if (!pBVar1->link1) this->head = this->head->link2;
  else pBVar1->link1->link2 = pBVar1->link2;
  if (!pBVar1->link2) this->tail = this->tail->link1;
  else pBVar1->link2->link1 = pBVar1->link1;
  return true;
}

Gfx * WidgetHandler::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  BaseWidget *pBVar2 = this->head;
  if ((pBVar2) && (pBVar2->state != 6)) {
    while( true ) {
      g = pBVar2->Render(g,x0,y0,x1,y1);
      pBVar2 = pBVar2->link2;
      if ((!pBVar2) || (pBVar2->state == 6)) break;
    }
  }
  return g;
}