//unused borg type. Here for completion sake.
#include "n64Borg.h"
#include "heapN64.h"
#define FILENAME "./src/n64BorgCollisionMaterial.cpp"
u8 borg10_func_b(void *x,void *y){return false;}
void borg10_func_a(void *x){}

void borg_10_free(s32 *arg0){
  s32 iVar1 = get_memUsed();
  if (*arg0 == -1) HFREE(arg0,0x7b);
  else dec_borg_count(*arg0);
  borg_mem[10]-= (iVar1 - get_memUsed());
  borg_count[10]--;
  }

void * get_borg_10(s32 arg0){
  clearBorgFlag();
  return getBorgItem(arg0);}

void passto_borg_10_free(s32 *arg0){borg_10_free(arg0);}
