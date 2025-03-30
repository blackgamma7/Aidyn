#include "globals.h"
#define FILENAME "src/freequeue.cpp"

void InitFreeQueueHead(QueueStructA *q){
  if (queueHeadFreeFlag)
    CRASH("InitFreeQueueHead","called more than once");
  queueHeadFreeFlag = true;
  q->items = 0;
  CLEAR(q->array);
}

void AllocFreeQueueItem(QueueStructA *q,void **p,ushort type,ushort pri){
  QueueStructAItem *pQVar4 = q->array + q->items++;
  if (FREEQUEUE_QUEUESIZE <= q->items) CRASH("AllocFreeQueueItem","Too Many Items!\nIncrease FREEQUEUE_QUEUESIZE\n");
  if(type>FreeQueue_Borg12){
    char errBuff [152];
    sprintf(errBuff,"Unknown Type: %d\n",type);
    CRASH("AllocFreeQueueItem",errBuff);
  }
    pQVar4->pri = pri;
    pQVar4->BorgSwitch = type;
    pQVar4->BorgPointer = *p;
    *p = NULL;
}

void ProcessFreeQueue(QueueStructA *param_1){
  short sVar1;
  int iVar2;
  QueueStructAItem *pQVar3;
  QueueStructAItem *ppBVar4;
  int iVar5;
  
  iVar5 = 0;
  if (param_1->items) {
    if (param_1->items) {
      for(u16 i=0;i<FREEQUEUE_QUEUESIZE;i++) {
        ppBVar4 = &param_1->array[i];
        if (ppBVar4->pri == 0) {
          switch(ppBVar4->BorgSwitch) {
          case FreeQueue_Borg7:
            FUN_8009fca8((Borg7header *)ppBVar4->BorgPointer);
            break;
          case FreeQueue_AniDat:
            borganim_free((AnimationData *)ppBVar4->BorgPointer);
            break;
          case FreeQueue_Borg6:
            passto_borg_6_free((borg6header *)ppBVar4->BorgPointer);
            break;
          case FreeQueue_Borg1:
            borg1_free((Borg1header *)ppBVar4->BorgPointer);
            break;
          case FreeQueue_Borg8:
            borg8_free((Borg8header *)ppBVar4->BorgPointer);
            break;
          case FreeQueue_Borg13:
            passto_borg13_free((borg13header *)ppBVar4->BorgPointer);
            break;
          case FreeQueue_Widget:
            BaseWidget *w = (BaseWidget *)ppBVar4->BorgPointer;
            if (w) w->~BaseWidget();
            break;
          case FreeQueue_Other:
            HFREE(ppBVar4->BorgPointer,0xaa);
            break;
          case FreeQueue_Borg12:
            free_borg_12((Borg12Header *)ppBVar4->BorgPointer);
            break;
          default:
           char errBuff[144];
            sprintf(errBuff,"Unknown Item Type: %d",ppBVar4->BorgSwitch);
            CRASH("ProcessFreeQueue",errBuff);
          }
        }
        else {
          ppBVar4->pri--;
          pQVar3 = param_1->array + iVar5;
          pQVar3->BorgPointer = ppBVar4->BorgPointer;
          iVar5++;
          pQVar3->BorgSwitch = ppBVar4->BorgSwitch;
          pQVar3->pri = ppBVar4->pri;
        }
      }
    }
    param_1->items = (ushort)iVar5;
  }
}

