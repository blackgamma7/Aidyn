#include "n64Borg.h"
#include "heapN64.h"
#define FILENAME "./src/n64BorgSample.cpp"

void borg11_func_a(Borg11Data *param_1){SetPointer(param_1,wav);}


u8 borg11_func_b(Borg11Header *param_1,Borg11Data *param_2){
  param_1->dat = param_2;
  return false;
}


void borg11_free(Borg11Header *param_1){
  u32 oldMem = get_memUsed();
  if (param_1->head.index == -1) HFREE(param_1->dat,125);
  else dec_borg_count(param_1->head.index);
  HFREE(param_1,132);
  borg_mem[11] = borg_mem[11] - (oldMem - get_memUsed());
  borg_count[11]--;
}


