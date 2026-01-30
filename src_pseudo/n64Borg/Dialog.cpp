#include "n64Borg.h"
#include "heapN64.h"
#define FILENAME "./src/n64BorgDialog.cpp"


u8 borg13_func_b(Borg13Header *param_1,Borg13Data *param_2){
  param_1->dat = param_2;
  if (param_2->ActorCount){
    ALLOCS(param_1->unk8,(u32)param_2->ActorCount << 2,91);
    memset(param_1->unk8,0,(u32)param_1->dat->ActorCount << 2);
  }
  else param_1->unk8 = NULL;
  return 0;
}

void borg13_func_a(Borg13Data *param_1){
  SetPointer(param_1,commands_pointer);
  SetPointer(param_1,actors);
  SetPointer(param_1,text);
}

void borg13_free(Borg13Header *param_1){
  s32 oldMem = get_memUsed();
  if ((param_1->head).index == -1) HFREE(param_1->dat,149);
  else dec_borg_count((param_1->head).index);
  if (param_1->dat->ActorCount) HFREE(param_1->unk8,158);
  HFREE(param_1,161);
  borg_mem[13]-= (oldMem - get_memUsed());
  borg_count[13]--;
}

Borg13Header * loadBorg13(u32 param_1){
  clearBorgFlag();
  return (Borg13Header *)getBorgItem(param_1);
}

void passto_borg13_free(Borg13Header *param_1){borg13_free(param_1);}