u32 gQuicksortSeed;
void* gQuicksortTempP;
#ifdef DEBUGVER
#define FILENAME "../src/quicksort.cpp"
#else
#define FILENAME ""
#endif

int Quicksort::Move(void *ToSort,int low,int hi,int EntrySize,func *SortFunc){
  void **ppvVar2;
  void *pvVar3;
  int iVar4;
  void *r;
  int iVar5;
  void *r_00;
  int iVar6;
  int iVar7;
  
  iVar4 = hi + 1;
  iVar5 = low + -1;
  iVar7 = iVar4 * EntrySize;
  iVar6 = iVar5 * EntrySize;
  ppvVar2 = (void **)((int)ToSort + low * EntrySize);
  r_00 = (void *)(iVar7 + (int)ToSort);
  r = (void *)(iVar6 + (int)ToSort);
  while(1) {
    pvVar3 = (void *)((int)ToSort + iVar6);
    do {
      pvVar3 = (void *)((int)pvVar3 + EntrySize);
      if (iVar5 == hi) break;
      r = (void *)((int)r + EntrySize);
      iVar6+= EntrySize;
      iVar5++;
    } while ((*SortFunc)(pvVar3,ppvVar2) == -1);
    pvVar3 = (void *)((int)ToSort + iVar7);
    do {
      pvVar3 = (void *)((int)pvVar3 - EntrySize);
      if (iVar4 == 0) break;
      r_00 = (void *)((int)r_00 + -EntrySize);
      iVar7-=EntrySize;
      iVar4--;
    } while ((*SortFunc)(pvVar3,ppvVar2) == 1);
    if (iVar4 <= iVar5) return iVar4;
    memcpy(QuicksortTempP,r,EntrySize);
    memcpy(r,r_00,EntrySize);
    memcpy(r_00,QuicksortTempP,EntrySize);
  }
}


int Quicksort::Pick(void *param_1,int Lo,int Hi,int EntrySize,func *param_5){
  void *A;
  void *B;
  
  A = (void *)((int)param_1 + Random::range_(&gQuicksortSeed,Lo,Hi) * EntrySize);
  B = (void *)((int)param_1 + Lo * EntrySize);
  memcpy(QuicksortTempP,r,EntrySize);
  memcpy(A,B,EntrySize);
  memcpy(B,QuicksortTempP,EntrySize);
  return Move(param_1,Lo,Hi,EntrySize,param_5);
}


void Quicksort::Run(void **ToSort,int low,int hi,int EntrySize,func *Sortfunc){
  s32 uVar1;
  int hi_00;
  void *r;
  void **r_00;
  void *r_01;
  
  if (low == hi + -2) {
    r_00 = (void **)((int)ToSort + low * EntrySize);
    r = (void *)((int)r_00 + EntrySize);
    r_01 = (void *)((int)r + EntrySize);
    if ((*Sortfunc)(r_00,r) == 1) {
      memcpy(QuicksortTempP,r_00,EntrySize);
      memcpy(r_00,r,EntrySize);
      memcpy(r,QuicksortTempP,EntrySize);
    }
    if ((*Sortfunc)(r,r_01) == 1) {
      memcpy(QuicksortTempP,r,EntrySize);
      memcpy(r,r_01,EntrySize);
      memcpy(r_01,QuicksortTempP,EntrySize);
    }
    uVar1 = (*Sortfunc)(r_00,r);
  }
  else {
    if (low != hi + -1) {
      if (hi <= low) return;
      hi_00 = Pick(ToSort,low,hi,EntrySize,Sortfunc);
      Run(ToSort,low,hi_00,EntrySize,Sortfunc);
      Run(ToSort,hi_00 + 1,hi,EntrySize,Sortfunc);
      return;
    }
    r_00 = (void **)((int)ToSort + low * EntrySize);
    r = (void *)((int)r_00 + EntrySize);
    uVar1 = (*Sortfunc)(r_00,r);
  }
  if (uVar1 == 1) {
    memcpy(QuicksortTempP,r_00,EntrySize);
    memcpy(r_00,r,EntrySize);
    memcpy(r,QuicksortTempP,EntrySize);
  }
  return;
}

void Quicksort::Sort(void *ToSort,uint ArraySize,uint EntrySize,func *SortFunc){
  QuicksortTempP = HeapAlloc(EntrySize,FILENAME,0x106);
  if (ArraySize) Run(ToSort,0,ArraySize - 1,EntrySize,SortFunc);
  HeapFree(QuicksortTempP,FILENAME,0x10b);
}