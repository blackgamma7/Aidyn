#include "typedefs.h"

struct QueueStructAItem {
    void* BorgPointer;
    short BorgSwitch;
    short pri;
};
#define FREEQUEUE_QUEUESIZE 0x100
struct QueueStructA {
    QueueStructAItem array[FREEQUEUE_QUEUESIZE];
    u16 items;
};

u16 queueHeadFreeFlag=false;

enum QueueTypes{
    QueueType_Borg7,
    QueueType_Scene,
    QueueType_Borg6,
    QueueType_Borg1,
    QueueType_Borg8,
    QueueType_Borg13,
    QueueType_Widget,
    QueueType_Other,
    QueueType_Borg12,
};

#define FREEQ(p,type) AllocFreeQueueItem(&gGlobals.QueueA,(void**)&p,QueueType_##type,0)
#define FREEQB7(p) FREEQ(p,Borg7) //Add Borg7 item to free queue
#define FREEQSCENE(p) FREEQ(p,Scene) //Add scene item to free queue
#define FREEQB6(p) FREEQ(p,Borg6) //Add Borg6 item to free queue
#define FREEQB1(p) FREEQ(p,Borg1) //Add Borg1 item to free queue
#define FREEQB8(p) FREEQ(p,Borg8) //Add Borg8 item to free queue
#define FREEQB13(p) FREEQ(p,Borg13) //Add Borg13 item to free queue
#define FREEQW(p) FREEQ(p,Widget) //Add widget to free queue
#define FREEQBP(p) FREEQ(p,Other) //Add some alloc'd item to free queue
#define FREEQB12(p) FREEQ(p,Borg12) //Add Borg12 item to free queue


void InitFreeQueueHead(QueueStructA *);
void NOOP_800d6194();
void AllocFreeQueueItem(QueueStructA *,void **,u16 ,u16 );
void ProcessFreeQueue(QueueStructA *);