#include "freeQueue.h" //reruse enums for datatype

#define ALLOCQUEUE_QUEUESIZE 0x20
struct QueueStructBItem {
    void **pBorg;
    void* field1_0x4;
    int BorgIndex;
    u16 BorgSwitch;
    u8 field4_0xe;
    u8 unkf;
};

struct QueueStructB {
    QueueStructBItem array[ALLOCQUEUE_QUEUESIZE];
    u16 items;
};

void memset_QueueStructB(QueueStructB *);
void NOOP_800d5d24();
void AllocAllocQueueItem(QueueStructB *Q,void**p,void* param_3,int index,u16 type,u8 param_6);
void processAllocQueue(QueueStructBItem *param_1);
void Process_queue_B(QueueStructB *param_1,s16 param_2);
