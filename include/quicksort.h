#include "randClass.h"
#include "stringN64.h"
#include "heapN64.h"
Random gQuicksortSeed;
void* gQuicksortTempP;

//compares items, then returns 0,1, or -1.
typedef int   (*Sorter)(void *,void *);

namespace Quicksort{
int Move(void *ToSort,int low,int hi,int EntrySize,Sorter SortFunc);
int Pick(void *ToSort,int low,int hi,int EntrySize,Sorter SortFunc);
void Run(void** ToSort,int low,int hi,int EntrySize,Sorter SortFunc);
void Sort(void** ToSort,uint ArraySize,uint EntrySize,Sorter SortFunc);
};

#define SWAP(A,B)\
      memcpy(gQuicksortTempP,A,EntrySize);\
      memcpy(A,B,EntrySize);\
      memcpy(B,gQuicksortTempP,EntrySize)