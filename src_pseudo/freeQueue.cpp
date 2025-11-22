#include "globals.h"
#define FILENAME "src/freequeue.cpp"

void InitFreeQueueHead(QueueStructA *q){
  if (queueHeadFreeFlag)
    CRASH("InitFreeQueueHead","called more than once");
  queueHeadFreeFlag = true;
  q->items = 0;
  CLEAR(q->array);
}

void AllocFreeQueueItem(QueueStructA *q,void **p,u16 type,u16 pri){
  QueueStructAItem *entry = q->array + q->items++;
  if (FREEQUEUE_QUEUESIZE <= q->items) CRASH("AllocFreeQueueItem","Too Many Items!\nIncrease FREEQUEUE_QUEUESIZE\n");
  if(type>QueueType_Borg12){
    #ifdef DEBUGVER
    char errBuff [152];
    sprintf(errBuff,"Unknown Type: %d\n",type);
    CRASH("AllocFreeQueueItem",errBuff);
    #else
    CRASH("","");
    #endif
  }
    entry->pri = pri;
    entry->BorgSwitch = type;
    entry->BorgPointer = *p;
    *p = NULL;
}

void ProcessFreeQueue(QueueStructA *param_1){
  s16 sVar1;
  int iVar2;
  QueueStructAItem *next;
  QueueStructAItem *entry;
  int iVar5;
  
  iVar5 = 0;
  if (param_1->items) {
    if (param_1->items) {
      for(u16 i=0;i<FREEQUEUE_QUEUESIZE;i++) {
        entry = &param_1->array[i];
        if (entry->pri == 0) {
          switch(entry->BorgSwitch) {
          case QueueType_Borg7:
            FUN_8009fca8((Borg7Header *)entry->BorgPointer);
            break;
          case QueueType_Scene:
            borganim_free((SceneData *)entry->BorgPointer);
            break;
          case QueueType_Borg6:
            passto_borg_6_free((Borg6Header *)entry->BorgPointer);
            break;
          case QueueType_Borg1:
            borg1_free((Borg1Header *)entry->BorgPointer);
            break;
          case QueueType_Borg8:
            borg8_free((Borg8Header *)entry->BorgPointer);
            break;
          case QueueType_Borg13:
            passto_borg13_free((Borg13Header *)entry->BorgPointer);
            break;
          case QueueType_Widget:
            BaseWidget *w = (BaseWidget *)entry->BorgPointer;
            if (w) w->~BaseWidget();
            break;
          case QueueType_Other:
            HFREE(entry->BorgPointer,170);
            break;
          case QueueType_Borg12:
            free_borg_12((Borg12Header *)entry->BorgPointer);
            break;
          default:
          #ifdef DEBUGVER
           char errBuff[144];
            sprintf(errBuff,"Unknown Item Type: %d",entry->BorgSwitch);
            CRASH("ProcessFreeQueue",errBuff);
            #else
            CRASH("","");
            #endif
          }
        }
        else {
          entry->pri--;
          next = param_1->array + iVar5;
          next->BorgPointer = entry->BorgPointer;
          iVar5++;
          next->BorgSwitch = entry->BorgSwitch;
          next->pri = entry->pri;
        }
      }
    }
    param_1->items = (u16)iVar5;
  }
}

