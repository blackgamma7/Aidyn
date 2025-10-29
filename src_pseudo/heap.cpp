#define FILENAME "./src/heap.cpp"


#include "heapN64.h"
#include "crash.h"

#define Msprintf(fmt,...) sprintf(gMemMonitor.text,fmt,__VA_ARGS__)
#ifdef DEBUGVER
#define HeapCrash(l,fmt,...) Msprintf(fmt,__VA_ARGS__); CRASH("heap.cpp",gMemMonitor.text)
#else
#define HeapCrash(l,fmt,...) Msprintf("%d",l); CRASH("heap.cpp",gMemMonitor.text)
#endif

void HeapInit(void *X,size_t Y){
  u32 uVar1;
  void* iVar2;
  
  uVar1 = (u32)X & 7;
  if (uVar1 != 0) {
    X = (void *)((s32)X + (8 - uVar1));
    Y = (Y - 8) + uVar1;
  }
  if ((Y & 7) != 0) Y -= (Y & 7);
  gMemMonitor.memUsed = 0;
  gMemMonitor.obj_count = 0;
  gMemMonitor.obj_count_2 = 0;
  gMemMonitor.obj_free = 0;
  gMemMonitor.memRegionNext = NULL;
  gMemMonitor.memRegionStart = X;
  gMemMonitor.memFreeMax = Y;
  gMemMonitor.memFree = Y;
  FUN_80098824((s32 *)X,5);
  gMemMonitor.obj_count_2++;
  gMemMonitor.obj_count++;
  gMemMonitor.memFree -= 4;
  gMemMonitor.memUsed+= 4;
  FUN_80098824((s32 *)((s32)gMemMonitor.memRegionStart + (gMemMonitor.memFreeMax - 4)),5);
  iVar2 = &gMemMonitor.memRegionStart + 4;
  gMemMonitor.memFree-= 4;
  gMemMonitor.obj_count++;
  gMemMonitor.obj_count_2++;
  gMemMonitor.memUsed+=4;
  FUN_800986f0(iVar2,gMemMonitor.memFree);
  FUN_8009872c(iVar2);
  gMemMonitor.obj_count++;
  gMemMonitor.obj_free++;
  gMemMonitor.memFree_2 = 0;
  gMemMonitor.flag = 0;
}


void * HeapAlloc(size_t size,char *file,u32 line){
  u8 bVar1;
  u32 uVar2;
  HeapBlock *pHVar3;
  char *pcVar4;
  u32 uVar5;
  HeapBlock *pHVar6;
  void *ret;
  u32 uVar7;
  
  if (size == 0) return NULL;
  else {
    uVar5 = size + 0x27 & 0xfffffff8;
    pHVar6 = NULL;
    uVar7 = 0xffffffff;
    bVar1 = false;
    pHVar3 = (HeapBlock *)gMemMonitor.memRegionNext;
    if (gMemMonitor.memRegionNext) {
      do {
        uVar2 = get_heap_size(pHVar3);
        uVar2 = uVar2 & ~1;
        if (uVar2 == uVar5) {
          bVar1 = true;
          uVar7 = uVar5;
          pHVar6 = pHVar3;
        }
        else {
          if ((uVar5 + 0x20 <= uVar2) && (uVar2 - uVar5 < uVar7)) {
            uVar7 = uVar2;
            pHVar6 = pHVar3;
          }
          pHVar3 = (HeapBlock *)FUN_8009887c(pHVar3);
        }
      } while ((!bVar1) && (pHVar3));
    }
    if (pHVar6 == NULL) {
      HeapCrash(386,"%s %i\ncouldn't find %i free space!\n%i avail in %i blocks\n%i used in %i blocks",
        file,line,uVar5,gMemMonitor.memFree,gMemMonitor.obj_free,gMemMonitor.memUsed,gMemMonitor.obj_count_2);
    }
    malloc_update_mem_mon(pHVar6,uVar5);
    #ifdef DEBUGVER
    Msprintf("%s %i",remove_dir_slashes(file),line);
    STRCPYSafe(pHVar6->filename,gMemMonitor.text);
    #endif
    ret = pHVar6 + 1;
    gMemMonitor.flag = 1;
  }
  return ret;
}

void HeapFree(void *X,char *cpp,u32 line){
  u32 uVar1;
  HeapBlock *pHVar2;
  u32 uVar3;
  
  if (X) {
    if (((((u32)X & 7) != 0) || (X < gMemMonitor.memRegionStart)) ||
       (pHVar2 = (HeapBlock *)((s32)X + -(sizeof(HeapBlock))),
       (void *)((s32)gMemMonitor.memRegionStart + gMemMonitor.memFreeMax) < X)) {
      HeapCrash(441,"%s %i tried to free an invalid pointer 0x%08x",cpp,line,X);
    }
    uVar1 = get_heap_size(pHVar2);
    uVar3 = uVar1 & ~1;
    if ((((uVar1 & 6) != 0) || (uVar3 < 0x10)) || (gMemMonitor.memFreeMax < uVar3)) 
      {HeapCrash(468,"%s %i tried to free a pointer with an invalid start tag! Owner: %24s",cpp,line,pHVar2->filename);}
    if ((FUN_80098848((void**)pHVar2) & ~1) != uVar3) 
      {HeapCrash(485,"%s %i tried to free a pointer with an invalid end tag! Owner: %24s",cpp,line,pHVar2->filename);}
    if ((get_heap_size(pHVar2) & 1) == 0) {HeapCrash(502,"%s %i tried to free a pointer that has already been freed!",cpp,line);}
    free_update_mem_mon(pHVar2);
    gMemMonitor.flag = 1;
  }
}

u32 FUN_80098200(void *param_1){return get_heap_size((HeapBlock *)((s32)param_1 + -4)) &-1;}
u32 Ofunc_get_MemFreeMax(void){return gMemMonitor.memFreeMax;}
u32 get_memUsed(void){return gMemMonitor.memUsed;}
u32 get_memFree(void){return gMemMonitor.memFree;}
u32 Ofunc_get_objCount(void){return gMemMonitor.obj_count;}
u32 get_obj_free(void){return gMemMonitor.obj_free;}

u32 get_memFree_2(void){
  u32 uVar1;
  HeapBlock *pHVar2;
  u32 uVar3;
  
  if (gMemMonitor.flag != 0) {
    uVar3 = 0;
    pHVar2 = (HeapBlock *)gMemMonitor.memRegionNext;
    if (gMemMonitor.memRegionNext) {
      do {
        uVar1 = get_heap_size(pHVar2);
        if (uVar3 < (uVar1 & ~1)) {
          uVar3 = uVar1 & ~1;
        }
        pHVar2 = (HeapBlock *)FUN_8009887c(pHVar2);
      } while (pHVar2);
    }
    gMemMonitor.flag = 0;
    gMemMonitor.memFree_2 = uVar3;
  }
  return gMemMonitor.memFree_2;
}
#ifdef DEBUGVER
char D_800f5490[16];
char D_800f54a0[16];
void print_mem_allocated(void *param_1,void *param_2){
  u32 uVar2;
  ulonglong uVar1;
  u32 uVar3;
  HeapBlock *pHVar4;
  ulonglong uVar5;
  u32 uVar6;
  u32 uVar7;
  void *pfVar8;
  
  pfVar8 = param_1;
  strcpy(D_800f5490,"FREE");
  strcpy(D_800f54a0,"ALLOCATED");
  uVar7 = 0;
  uVar6 = gMemMonitor.obj_count - 1;
  pHVar4 = (HeapBlock *)gMemMonitor.memRegionStart;
  for(uVar7=0;uVar6<uVar7;uVar7++) {
    uVar5 = get_heap_size(pHVar4) & ~1;
    uVar2 = get_heap_size(pHVar4);
    if ((uVar7 != 0) && (uVar7 != uVar6)) {
      uVar1 = FUN_80098848((void**)pHVar4);
      uVar3 = FUN_80098848((void**)pHVar4);
      if ((uVar2 & 1) == 0) {
        if (pfVar8) (*param_1)(param_2,"NA",uVar7,uVar5);
      }
      else {
        if (pfVar8) (*param_1)(param_2,pHVar4->filename,uVar7,uVar5);
      }
      if ((uVar1 & ~1) != uVar5) return;
      if ((uVar3 & 1) != (uVar2 & 1)) return;
    }
    pHVar4 = (HeapBlock *)(pHVar4->filename + (s32)uVar5 + -4);
  }
}
#else
void print_mem_allocated(void *param_1,void *param_2){}
#endif

void malloc_update_mem_mon(HeapBlock *param_1,u32 param_2){
  u32 uVar1;
  s32 iVar2;
  
  uVar1 = get_heap_size(param_1);
  iVar2 = (uVar1 & ~1) - param_2;
  if (iVar2 == 0) {
    FUN_800986f0(param_1,param_2 | 1);
    FUN_800987a8(param_1);
    gMemMonitor.obj_count_2++;
    gMemMonitor.obj_free--;
  }
  else {
    FUN_800986f0(param_1,param_2 | 1);
    FUN_800987a8(param_1);
    gMemMonitor.obj_count_2++;
    gMemMonitor.obj_free--;
    FUN_800986f0(param_1+param_2,iVar2);
    FUN_8009872c(param_1+param_2);
    gMemMonitor.obj_count++;
    gMemMonitor.obj_free++;
  }
  gMemMonitor.memUsed+= param_2;
  gMemMonitor.memFree-= param_2;
}

void free_update_mem_mon(HeapBlock *param_1){
  u32 uVar1;
  u32 uVar2;
  u32 uVar3;
  u32 uVar4;
  u32 uVar5;
  HeapBlock *pHVar6;
  HeapBlock *pHVar7;
  u32 uVar8;
  
  uVar1 = get_heap_size(param_1);
  uVar1 = uVar1 & ~1;
  uVar2 = get_heap_size((HeapBlock *)(param_1[-1].filename + 0x14));
  uVar3 = get_heap_size((HeapBlock *)(param_1[-1].filename + 0x14));
  pHVar7 = (HeapBlock *)(param_1->filename + (uVar1 - 4));
  uVar4 = get_heap_size(pHVar7);
  uVar5 = get_heap_size(pHVar7);
  pHVar6 = (HeapBlock *)((s32)param_1 - (uVar3 & ~1));
  uVar8 = uVar1;
  if ((uVar2 & 1) == 0) {
    FUN_800987a8(pHVar6);
    uVar8 = uVar1 + (uVar3 & ~1);
    gMemMonitor.obj_count--;
    gMemMonitor.obj_free--;
    param_1 = pHVar6;
  }
  if ((uVar4 & 1) == 0) {
    FUN_800987a8(pHVar7);
    uVar8 = uVar8 + (uVar5 & ~1);
    gMemMonitor.obj_count--;
    gMemMonitor.obj_free--;
  }
  FUN_800986f0(param_1,uVar8);
  FUN_8009872c(param_1);
  gMemMonitor.memUsed-= uVar1;
  gMemMonitor.memFree+= uVar1;
  gMemMonitor.obj_count_2--;
  gMemMonitor.obj_free++;
}

void FUN_800986f0(void* param_1,s32 param_2){
  FUN_80098824((s32 *)param_1,param_2);
  FUN_8009882c(param_1,param_2);
}

void FUN_8009872c(void *param_1){
  void *pvVar1;
  void *pvVar2;
  
  pvVar1 = gMemMonitor.memRegionNext;
  FUN_80098864(param_1,0);
  FUN_8009886c(param_1,(s32)pvVar1);
  pvVar2 = param_1;
  if (pvVar1) {
    FUN_80098864(pvVar1,(s32)param_1);
    pvVar2 = gMemMonitor.memRegionMaxCurr;
  }
  gMemMonitor.memRegionMaxCurr = pvVar2;
  gMemMonitor.memRegionNext = param_1;
}

void FUN_800987a8(HeapBlock* param_1){
  void *pvVar1;
  void *pvVar3;
  
  s32 lVar2 = FUN_80098874(param_1);
  pvVar3 = (void *)FUN_8009887c(param_1);
  pvVar1 = pvVar3;
  if (lVar2) {
    FUN_8009886c((void*)lVar2,(s32)pvVar3);
    pvVar1 = gMemMonitor.memRegionNext;
  }
  gMemMonitor.memRegionNext = pvVar1;
  pvVar1 = (void *)lVar2;
  if (pvVar3) {
    FUN_80098864(pvVar3,lVar2);
    pvVar1 = gMemMonitor.memRegionMaxCurr;
  }
  gMemMonitor.memRegionMaxCurr = pvVar1;
}

void FUN_80098824(s32 *param_1,s32 param_2){*param_1 = param_2;}

void FUN_8009882c(s32 param_1,u32 param_2){
  *(u32 *)((param_2 & ~1) + param_1 + -4) = param_2;}

u32 get_heap_size(HeapBlock *param_1){return param_1->size;}

s32  FUN_80098848(void **param_1) {
  return *(s32 *)((int)param_1 + (((uint)*param_1 & 0xfffffffe) - 4));
}

void FUN_80098864(void *param_1,s32 param_2){
  *(s32 *)((s32)param_1 + 4) = param_2;
}


void FUN_8009886c(void* param_1,s32 param_2){
  *(s32 *)((int)param_1 + 8) = param_2;
}
s32 FUN_80098874(void* param_1){
  return *(s32*)((int)param_1 + 4);
}

s32 FUN_8009887c(HeapBlock* param_1){return *(s32 *)(param_1 + 8);}

u32 FUN_80098884(void){
  u32 uVar1;
  HeapBlock *pHVar2;
  u32 uVar3;
  
  uVar3 = 0;
  pHVar2 = (HeapBlock *)gMemMonitor.memRegionNext;
  if (gMemMonitor.memRegionNext) {
    do {
      uVar1 = get_heap_size(pHVar2);
      if (uVar3 < (uVar1 & ~1)) uVar3 = uVar1 & ~1;
      pHVar2 = (HeapBlock *)FUN_8009887c(pHVar2);
    } while (pHVar2);
  }
  return uVar3;
}

char * remove_dir_slashes(char *str){
  char *pcVar2 = str;
  while (*str) {
    if ((*str == '\\') || (*str == '/')) {
      pcVar2 = str + 1;
    }
    str++;
  }
  return pcVar2;
}


void ofunc_LISBN_called_free(void){CRASH("heap.cpp","LIBSN called free?");}
void* operator new(size_t size){return HALLOC((u32)size,1139);}
void operator delete(void* x){HFREE(x,1150);}