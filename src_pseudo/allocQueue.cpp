#include "globals.h"

void memset_QueueStructB(QueueStructB *Q){
  Q->items = 0;
  CLEAR(&Q->array);
}

void NOOP_800d5d24(void){}//?

void AllocAllocQueueItem(QueueStructB *Q,void**p,void* param_3,int index,u16 type,u8 param_6){
  QueueStructBItem *entry = Q->array + Q->items++;
  if (ALLOCQUEUE_QUEUESIZE <= Q->items) CRASH("AllocAllocQueueItem","Too Many Items!\nIncrease ALLOCQUEUE_QUEUESIZE\n");
  if(type>=9){
    char acStack_120 [128];
    sprintf(acStack_120,"Unknown Type: %d\n",type);
    CRASH("AllocFreeQueueItem",acStack_120); //copy-paste oversight?
  }
  else{
    *p = NULL;
    entry->BorgSwitch = type;
    entry->field4_0xe = param_6;
    entry->pBorg = p;
    entry->field1_0x4 = param_3;
    entry->BorgIndex = index;
    if (0 < (int)(Q->items - 1)) {
      for(u16 i = 0;i<(Q->items - 1);i++){
        if (entry->pBorg == Q->array[i].pBorg){
          char acStack_a0 [160];
          sprintf(acStack_a0,"Alloc Item to same memory pointer.\n    Type: %d\nborgName: %d\n Pointer: %08x\n",
                      entry->BorgSwitch,entry->BorgIndex,*entry->pBorg);
          CRASH("AllocAllocQueueItem",acStack_a0);
        }
      }
    }
  }
}


void processAllocQueue(QueueStructBItem *param_1){
  void* p;
  if (param_1->BorgIndex) {
    switch(param_1->BorgSwitch) {
    case QueueType_Borg7:
      p = func_loading_borg7(param_1->BorgIndex,(ParticleHeadStruct *)param_1->field1_0x4);
      break;
    case QueueType_Scene:
      p = BorgAnimLoadScene(param_1->BorgIndex);
      break;
    case QueueType_Borg6:
      p = get_borg_6(param_1->BorgIndex);
      break;
    case QueueType_Borg1:
      p = getBorgItem(param_1->BorgIndex);
      break;
    case QueueType_Borg8:
      p = loadBorg8(param_1->BorgIndex);
      break;
    case QueueType_Borg13:
      p = get_borg13(param_1->BorgIndex);
      break;
    default:
      char acStack_88 [136];
      sprintf(acStack_88,"Unknown Item Type: %d",param_1->BorgSwitch);
      CRASH("ProcessAllocQueue",acStack_88);
    case QueueType_Other:
      CRASH("src/allocqueue.cpp","Generic allocations are not supported!");
      //y tho?
    case QueueType_Borg12:
      p = load_borg_12(param_1->BorgIndex);
    }
    *param_1->pBorg = p;
  }
}

u16 queue_b_flag=0;
void Process_queue_B(QueueStructB *param_1,short param_2){
  ushort uVar1;
  byte bVar2;
  undefined1 uVar3;
  int iVar4;
  short sVar5;
  QueueStructBItem *puVar5;
  QueueStructBItem *pQVar6;
  u16 i;
  uint uVar7;
  
  sVar5 = 0;
  uVar7 = (uint)param_1->items;
  if (queue_b_flag) queue_b_flag--;
  if (param_1->items != 0) {
    param_1->items = 0;
    i = 0;
    if (uVar7 != 0) {
      do {
        pQVar6 = &param_1->array[i];
        if ((param_2 != 0) || (pQVar6->field4_0xe == 0)) {
          sVar5 += 1;
          processAllocQueue(pQVar6);
          pQVar6->field4_0xe = 0;
          queue_b_flag = 3;
        }
        i++;
      } while (i < uVar7);
    }
    if ((sVar5 == 0) && (i = 0, queue_b_flag == 0)) {
      for (; i < uVar7; i++) {
        pQVar6 = param_1->array + i;
        if (pQVar6->field4_0xe != 0) {
          processAllocQueue(pQVar6);
          pQVar6->field4_0xe = 0;
          queue_b_flag = 3;
          break;
        }
      }
    }
    i = 0;
    if (uVar7 != 0) {
      iVar4 = 0;
      do {
        puVar5 = &param_1->array[i];
        if (puVar5->field4_0xe != 0) {
          uVar1 = param_1->items;
          param_1->items = uVar1 + 1;
          pQVar6 = param_1->array + uVar1;
          pQVar6->pBorg = puVar5->pBorg;
          pQVar6->field1_0x4 = puVar5->field1_0x4;
          pQVar6->BorgIndex = puVar5->BorgIndex;
          pQVar6->BorgSwitch = puVar5->BorgSwitch;
          pQVar6->field4_0xe = puVar5->field4_0xe;
          pQVar6->unkf = puVar5->unkf;
          if (param_1->items != i + 1) puVar5->field4_0xe = 0;
        }
        i++;
      } while (i < uVar7);
    }
  }
}