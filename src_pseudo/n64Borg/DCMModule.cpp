#include "SFX.h"

#define FILENAME "./src/n64BorgDCMModule.cpp"

void borg12_func_a(Borg12Data *param_1) {
  Borg11Data *pBVar1;
  u32 uVar3;
  Borg11Header *pBVar4;
  u32 i;
  u32 uVar6;
  SetPointer(param_1,instrumentsI);
  SetPointer(param_1,sub.ptr0x18);
  SetPointer(param_1,sub.channelDat);
  for(u32 i=0;i<(param_1->sub).instrument_count;i++){
    Borg11Header *pBVar4 = get_borg_11(param_1->instrumentsI[i]);
    param_1->intrumentsP[i] = pBVar4;
    (param_1->sub).ptr0x18[i].instrumentDat = pBVar4->dat;
  }
}

u8 borg12_func_b(Borg12Header *param_1,Borg12Data *param_2) {
  param_1->dat = param_2;
  return 0;
}

void n64BorgDCMModule_free(Borg12Header *param_1) {
  u32 count;
  u32 i;
  
  int oldMem = get_memUsed();
  if ((param_1->head).index == -1) {
    count = (param_1->dat->sub).instrument_count;
      for(i=0;i<count;i++){
        passto_borg11_free(param_1->dat->intrumentsP[i]);
      }
    HFREE(param_1->dat,0xa6);
  }
  else {
    if (get_borg_index_count((param_1->head).index) == 1) {
      count = (param_1->dat->sub).instrument_count;
      for(i=0;i<count;i++){
        passto_borg11_free(param_1->dat->intrumentsP[i]);
      }
    }
    dec_borg_count((param_1->head).index);
  }
  HFREE(param_1,0xb9);
  borg_mem[0xc]-= (oldMem - get_memUsed());
  borg_count[0xc]--;
}

Borg12Header * load_borg_12(u32 param_1) {
  clearBorgFlag();
  return (Borg12Header *)getBorgItem(param_1);
}

void free_borg_12(Borg12Header *param_1) {
  n64BorgDCMModule_free(param_1);
}

