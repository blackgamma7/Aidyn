#ifdef DEBUGVER
#define FILENAME "./src/heap.cpp"
#else
#define FILENAME ""
#endif

struct MemMon_struct {
    void * memRegionStart;
    void * memRegionNext;
    void * mamRegionMaxCurr;
    u32 memFreeMax;
    u32 memUsed;
    u32 memFree;
    u32 obj_count;
    u32 obj_count_2;
    u32 obj_free;
    u32 memFree_2;
    char text[256];
    u8 flag;
    u8 pad[7];
};

struct Heap_block_Debug{
    u32 size;
    char filname[24]; //ommited in retail version
}
extern struct MemMon_struct MemMonitor;

void Heap_init(void *X,u32 Y){
  uint uVar1;
  int iVar2;
  
  uVar1 = (uint)X & 7;
  if (uVar1 != 0) {
    X = (void *)((int)X + (8 - uVar1));
    Y = (Y - 8) + uVar1;
  }
  if ((Y & 7) != 0) {Y = Y - (Y & 7);}
  MemMonitor.memUsed = 0;
  MemMonitor.obj_count = 0;
  MemMonitor.obj_count_2 = 0;
  MemMonitor.obj_free = 0;
  MemMonitor.memRegionNext = (void *)0x0;
  MemMonitor.memRegionStart = X;
  MemMonitor.memFreeMax = Y;
  MemMonitor.memFree = Y;
  FUN_80098824((undefined4 *)X,5);
  MemMonitor.obj_count_2++;
  MemMonitor.obj_count++;
  MemMonitor.memFree -= 4;
  MemMonitor.memUsed+= 4;
  FUN_80098824((undefined4 *)((int)MemMonitor.memRegionStart + (MemMonitor.memFreeMax - 4)),5);
  iVar2 = (int)MemMonitor.memRegionStart + 4;
  MemMonitor.memFree-= 4;
  MemMonitor.obj_count++;
  MemMonitor.obj_count_2++;
  MemMonitor.memUsed+=4;
  FUN_800986f0(iVar2,MemMonitor.memFree);
  FUN_8009872c(iVar2);
  MemMonitor.obj_count++;
  MemMonitor.obj_free++;
  MemMonitor.memFree_2 = 0;
  MemMonitor.flag = 0;
  return;
}


void * Malloc(uint size,char *file,uint line){
  bool bVar1;
  uint uVar2;
  Heap_block_Debug *pHVar3;
  char *pcVar4;
  uint uVar5;
  Heap_block_Debug *pHVar6;
  void *ret;
  uint uVar7;
  
  if (size == 0) {
    ret = (void *)0x0;
  }
  else {
    uVar5 = size + 0x27 & 0xfffffff8;
    pHVar6 = (Heap_block_Debug *)0x0;
    uVar7 = 0xffffffff;
    bVar1 = false;
    pHVar3 = (Heap_block_Debug *)MemMonitor.memRegionNext;
    if (MemMonitor.memRegionNext != (void *)0x0) {
      do {
        uVar2 = get_heap_size(pHVar3);
        uVar2 = uVar2 & 0xfffffffe;
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
          pHVar3 = (Heap_block_Debug *)FUN_8009887c((char)pHVar3);
        }
      } while ((!bVar1) && (pHVar3 != (Heap_block_Debug *)0x0));
    }
    if (pHVar6 == (Heap_block_Debug *)0x0) {
      sprintf(MemMonitor.text,"%s %i\ncouldn't find %i free space!\n%i avail in %i blocks\n%i used in %i blocks",
      file,line,uVar5,MemMonitor.MemFree,MemMonitor.obj_free,MemMonitor.MemUsed,MemMonitor.obj_count_2);
      manualCrash("heap.cpp",MemMonitor.text);
    }
    malloc_update_mem_mon(pHVar6,uVar5);
    pcVar4 = remove_dir_slashes(file);
    sprintf(MemMonitor.text,"%s %i",pcVar4,line);
    strncpy(pHVar6->filename,MemMonitor.text,0x18);
    pHVar6->filename[0x17] = '\0';
    ret = pHVar6 + 1;
    MemMonitor.flag = 1;
  }
  return ret;
}

void Free(void *X,char *cpp,int line){
  uint uVar1;
  Heap_block_Debug *pHVar2;
  uint uVar3;
  
  if (X != (void *)0x0) {
    if (((((uint)X & 7) != 0) || (X < MemMonitor.memRegionStart)) ||
       (pHVar2 = (Heap_block_Debug *)((int)X + -0x1c),
       (void *)((int)MemMonitor.memRegionStart + MemMonitor.memFreeMax) < X)) {
      sprintf(MemMonitor.text,"%s %i tried to free an invalid pointer 0x%08x",cpp,line,X);
      manualCrash("heap.cpp",MemMonitor.text);
    }
    uVar1 = get_heap_size(pHVar2);
    uVar3 = uVar1 & ~1;
    if ((((uVar1 & 6) != 0) || (uVar3 < 0x10)) || (MemMonitor.memFreeMax < uVar3)) {
      sprintf(MemMonitor.text,"%s %i tried to free a pointer with an invalid start tag! Owner: %24s",cpp,line,pHVar2.filename);
      manualCrash("heap.cpp",MemMonitor.text);}
    if ((FUN_80098848((char)pHVar2) & ~1) != uVar3) {
      sprintf(MemMonitor.text,"%s %i tried to free a pointer with an invalid end tag! Owner: %24s",
      cpp,line,pHVar2.filename);
      manualCrash("heap.cpp",MemMonitor.text);}
    if ((get_heap_size(pHVar2) & 1) == 0) {
      sprintf(MemMonitor.text,"%s %i tried to free a pointer that has already been freed!",cpp,line);
      manualCrash("heap.cpp",MemMonitor.text);}
    free_update_mem_mon(pHVar2);
    MemMonitor.flag = 1;
  }
  return;
}

uint Ofunc_80098200(void *param_1){return get_heap_size((Heap_block_Debug *)((int)param_1 + -4)) &-1;}
u32 Ofunc_get_MemFreeMax(void){return MemMonitor.memFreeMax;}
u32 get_memUsed(void){return MemMonitor.memUsed;}
u32 get_memFree(void){return MemMonitor.memFree;}
u32 Ofunc_get_objCount(void){return MemMonitor.obj_count;}
u32 get_obj_free(void){return MemMonitor.obj_free;}

uint get_memFree_2(void){
  uint uVar1;
  Heap_block_Debug *pHVar2;
  uint uVar3;
  
  if (MemMonitor.flag != 0) {
    uVar3 = 0;
    pHVar2 = (Heap_block_Debug *)MemMonitor.memRegionNext;
    if (MemMonitor.memRegionNext != (void *)0x0) {
      do {
        uVar1 = get_heap_size(pHVar2);
        if (uVar3 < (uVar1 & 0xfffffffe)) {
          uVar3 = uVar1 & 0xfffffffe;
        }
        pHVar2 = (Heap_block_Debug *)FUN_8009887c((char)pHVar2);
      } while (pHVar2 != (Heap_block_Debug *)0x0);
    }
    MemMonitor.flag = 0;
    MemMonitor.memFree_2 = uVar3;
  }
  return MemMonitor.memFree_2;
}
void print_mem_allocated(func *param_1,void *param_2){
  uint uVar2;
  ulonglong uVar1;
  uint uVar3;
  Heap_block_Debug *pHVar4;
  ulonglong uVar5;
  uint uVar6;
  uint uVar7;
  func *pfVar8;
  
  pfVar8 = param_1;
  strcpy(D_800f5490,"FREE");
  strcpy(D_800f54a0,"ALLOCATED");
  uVar7 = 0;
  uVar6 = MemMonitor.obj_count - 1;
  pHVar4 = (Heap_block_Debug *)MemMonitor.memRegionStart;
  do {
    uVar2 = get_heap_size(pHVar4);
    uVar5 = (longlong)(int)uVar2 & 0xfffffffffffffffe;
    uVar2 = get_heap_size(pHVar4);
    if ((uVar7 != 0) && (uVar7 != uVar6)) {
      uVar1 = FUN_80098848((char)pHVar4);
      uVar3 = FUN_80098848((char)pHVar4);
      if ((uVar2 & 1) == 0) {
        if (pfVar8 != (func *)0x0) {
          (*param_1)(param_2,"NA",uVar7,uVar5);
        }
      }
      else {
        if (pfVar8 != (func *)0x0) {
          (*param_1)(param_2,pHVar4->filename,uVar7,uVar5);
        }
      }
      if ((uVar1 & 0xfffffffffffffffe) != uVar5) {
        return;
      }
      if ((uVar3 & 1) != (uVar2 & 1)) {
        return;
      }
    }
    uVar7 = uVar7 + 1;
    pHVar4 = (Heap_block_Debug *)(pHVar4->filename + (int)uVar5 + -4);
    if (uVar6 < uVar7) {
      return;
    }
  } while( true );
}

void malloc_update_mem_mon(Heap_block_Debug *param_1,int param_2){
  uint uVar1;
  int iVar2;
  
  uVar1 = get_heap_size(param_1);
  iVar2 = (uVar1 & 0xfffffffe) - param_2;
  if (iVar2 == 0) {
    FUN_800986f0(param_1,param_2 | 1);
    FUN_800987a8(param_1);
    MemMonitor.obj_count_2++;
    MemMonitor.obj_free--;
  }
  else {
    FUN_800986f0(param_1,param_2 | 1);
    FUN_800987a8(param_1);
    MemMonitor.obj_count_2++;
    MemMonitor.obj_free--;
    FUN_800986f0(param_1+param_2,iVar2);
    FUN_8009872c(param_1+param_2);
    MemMonitor.obj_count++;
    MemMonitor.obj_free++;
  }
  MemMonitor.memUsed+= param_2;
  MemMonitor.memFree-= param_2;
  return;
}

void free_update_mem_mon(Heap_block_Debug *param_1)

{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  Heap_block_Debug *pHVar6;
  Heap_block_Debug *pHVar7;
  uint uVar8;
  
  uVar1 = get_heap_size(param_1);
  uVar1 = uVar1 & 0xfffffffe;
  uVar2 = get_heap_size((Heap_block_Debug *)(param_1[-1].filename + 0x14));
  uVar3 = get_heap_size((Heap_block_Debug *)(param_1[-1].filename + 0x14));
  pHVar7 = (Heap_block_Debug *)(param_1->filename + (uVar1 - 4));
  uVar4 = get_heap_size(pHVar7);
  uVar5 = get_heap_size(pHVar7);
  pHVar6 = (Heap_block_Debug *)((int)param_1 - (uVar3 & 0xfffffffe));
  uVar8 = uVar1;
  if ((uVar2 & 1) == 0) {
    FUN_800987a8(pHVar6);
    uVar8 = uVar1 + (uVar3 & 0xfffffffe);
    MemMonitor.obj_count--;
    MemMonitor.obj_free--;
    param_1 = pHVar6;
  }
  if ((uVar4 & 1) == 0) {
    FUN_800987a8(pHVar7);
    uVar8 = uVar8 + (uVar5 & 0xfffffffe);
    MemMonitor.obj_count--;
    MemMonitor.obj_free--;
  }
  FUN_800986f0(param_1,uVar8);
  FUN_8009872c(param_1);
  MemMonitor.memUsed-= uVar1;
  MemMonitor.memFree+= uVar1;
  MemMonitor.obj_count_2--;
  MemMonitor.obj_free++;
  return;
}

void FUN_800986f0(undefined8 param_1,undefined8 param_2){
  FUN_80098824((undefined4 *)param_1,(int)param_2);
  FUN_8009882c(param_1,param_2);
  return;
}

void FUN_8009872c(void *param_1){
  void *pvVar1;
  void *pvVar2;
  
  pvVar1 = MemMonitor.memRegionNext;
  FUN_80098864((char)param_1,0);
  FUN_8009886c((char)param_1,pvVar1);
  pvVar2 = param_1;
  if (pvVar1 != (void *)0x0) {
    FUN_80098864((char)pvVar1,param_1);
    pvVar2 = MemMonitor.mamRegionMaxCurr;
  }
  MemMonitor.mamRegionMaxCurr = pvVar2;
  MemMonitor.memRegionNext = param_1;
  return;
}

void FUN_800987a8(undefined param_1){
  void *pvVar1;
  longlong lVar2;
  void *pvVar3;
  
  lVar2 = FUN_80098874(param_1);
  pvVar3 = (void *)FUN_8009887c(param_1);
  pvVar1 = pvVar3;
  if (lVar2 != 0) {
    FUN_8009886c((char)lVar2,pvVar3);
    pvVar1 = MemMonitor.memRegionNext;
  }
  MemMonitor.memRegionNext = pvVar1;
  pvVar1 = (void *)lVar2;
  if (pvVar3 != (void *)0x0) {
    FUN_80098864((char)pvVar3,(void *)lVar2);
    pvVar1 = MemMonitor.mamRegionMaxCurr;
  }
  MemMonitor.mamRegionMaxCurr = pvVar1;
  return;
}

void FUN_80098824(undefined4 *param_1,undefined4 param_2){*param_1 = param_2;}

void FUN_8009882c(int param_1,uint param_2){
  *(uint *)((param_2 & 0xfffffffe) + param_1 + -4) = param_2;}

uint get_heap_size(Heap_block_Debug *param_1){return param_1->size;}

undefined4 FUN_80098848(char param_1){
  return *(undefined4 *)((int)(uint *)(int)param_1 + ((*(uint *)(int)param_1 & 0xfffffffe) - 4));}

void FUN_80098864(void *param_1,undefined4 param_2){
  *(undefined4 *)((int)param_1 + 4) = param_2;
}


void FUN_8009886c(char param_1,undefined4 param_2){
  *(undefined4 *)(param_1 + 8) = param_2;
}
undefined4 FUN_80098874(char param_1){
  return *(undefined4 *)(param_1 + 4);
}

s32 FUN_8009887c(char param_1){return *(s32 *)(param_1 + 8);}

uint Ofunc_80098884(void){
  uint uVar1;
  Heap_block_Debug *pHVar2;
  uint uVar3;
  
  uVar3 = 0;
  pHVar2 = (Heap_block_Debug *)MemMonitor.memRegionNext;
  if (MemMonitor.memRegionNext != (void *)0x0) {
    do {
      uVar1 = get_heap_size(pHVar2);
      if (uVar3 < (uVar1 & 0xfffffffe)) {
        uVar3 = uVar1 & 0xfffffffe;
      }
      pHVar2 = (Heap_block_Debug *)FUN_8009887c((char)pHVar2);
    } while (pHVar2 != (Heap_block_Debug *)0x0);
  }
  return uVar3;
}

char * remove_dir_slashes(char *param_1){
  char  cVar1 = *param_1;
  char pcVar2 = param_1;
  while (cVar1 != '\0') {
    if ((*param_1 == '\\') || (*param_1 == '/')) {
      pcVar2 = param_1 + 1;
    }
    param_1++;
    cVar1 = *param_1;
  }
  return pcVar2;
}

void ofunc_LISBN_called_free(void){manualCrash("heap.cpp","LIBSN called free?");}

void * passToMalloc(uint size){return Malloc(size,FILENAME,0x473);}

void passToFree(void *param_1){Free(param_1,FILENAME,0x47e);}