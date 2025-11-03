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
    BaseWidget *pBVar1 = this->head->siblingR;
    this->head = pBVar1;
    if (pBVar1) pBVar1->siblingL = NULL;
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
  pBVar1 = pBStack_20->siblingR;
  if (false) goto switchD_800b7054_caseD_4;
  switch(bVar4) {
  case WidgetS_Init:
  case WidgetS_FadedIn:
    if (pBStack_20->RunFadeIn() == WidgetS_FadedIn){
      pBStack_20->SetState(WidgetS_Running);
      pBStack_20->Tick();
      bVar4 = pBStack_20->state;
      break;
    }
    else goto joined_r0x800b7018;
  case WidgetS_Running:
    pBStack_20->Tick();
    bVar4 = WidgetS_Running;
    break;
  case 4:
    goto switchD_800b7054_caseD_4;
  case WidgetS_Closing:
  case WidgetS_Closed:
    pBStack_20->RunFadeOut();
    bVar4 = WidgetS_Closed;
    if (uVar3 != 6) break;
    bVar4 = WidgetS_Closed;
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
    pBVar1 = pBVar1->siblingR;
  }
  pBVar1->SetState(WidgetS_Closing);
  return true;
}

BaseWidget * WidgetHandler::Control(ControllerFull *cont){
  BaseWidget *pBVar1 = this->tail;
  if ((pBVar1 == NULL) || (pBVar1->state != WidgetS_Running)) pBVar1 = NULL;
  else pBVar1 = pBVar1->Control(&cont->contAidyn);
  return pBVar1;
}


u8 WidgetHandler::AddWidget(BaseWidget *w){
  BaseWidget *pBVar1;
  
  if (w) {
    if (this->head == NULL) this->head = w;
    else {
      for (pBVar1 = this->tail; pBVar1 != NULL; pBVar1 = pBVar1->siblingL) {
        if (pBVar1 == w)
          CRASH("Widget already added to the handler","./src/widgethandler.cpp");
      }
      this->tail->siblingR = w;
      w->siblingL = this->tail;
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
    pBVar2 = pBVar1->siblingL;
    this->tail = pBVar2;
    if (!pBVar2) this->head = NULL;
    else pBVar2->siblingR = NULL;
    pBVar1->siblingL = NULL;
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
    pBVar1 = pBVar1->siblingR;
  }
  if (!pBVar1->siblingL) this->head = this->head->siblingR;
  else pBVar1->siblingL->siblingR = pBVar1->siblingR;
  if (!pBVar1->siblingR) this->tail = this->tail->siblingL;
  else pBVar1->siblingR->siblingL = pBVar1->siblingL;
  return true;
}

Gfx * WidgetHandler::Render(Gfx *g,u16 x0,u16 y0,u16 x1,u16 y1){
  BaseWidget *pBVar2 = this->head;
  if ((pBVar2) && (pBVar2->state != WidgetS_Closed)) {
    while( true ) {
      g = pBVar2->Render(g,x0,y0,x1,y1);
      pBVar2 = pBVar2->siblingR;
      if ((!pBVar2) || (pBVar2->state == WidgetS_Closed)) break;
    }
  }
  return g;
}