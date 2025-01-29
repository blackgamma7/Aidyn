#include "memcheck.h"

void MemoryCheck(s32 ramstart,s32 arg1){
  u32 mem = osGetMemSize();
  if (mem <= 0x400000) {
    gMemCheckStruct.MaxResolution0 = (320)*(240)*2;
    gMemCheckStruct.MaxResolution1 = (320)*(240)*2;
  }
  else {
    gMemCheckStruct.MaxResolution0 = (320)*(240)*4;
    gMemCheckStruct.MaxResolution1 = (320)*(240)*4;
  }
  gExpPakFlag = (u16)(mem > 0x400000);
  gMemCheckStruct.DepthBuffer = (undefined *)((ramstart + arg1 & 0xffffffc0U) + 0x40);
  gMemCheckStruct.FreameBuffers[0] =
       (void *)((u32)mem - (gMemCheckStruct.MaxResolution1 * 2 + -0x80000000));
  gMemCheckStruct.HeapStart = gMemCheckStruct.DepthBuffer + gMemCheckStruct.MaxResolution0;
  gMemCheckStruct.ramstartVal = ramstart;
  gMemCheckStruct.FreameBuffers[1] =
       (void *)((s32)gMemCheckStruct.FreameBuffers[0] + gMemCheckStruct.MaxResolution1);
  gMemCheckStruct.RamSize = mem;
  gMemCheckStruct.ramVal0 = arg1;
  gMemCheckStruct.mem_free_allocated =
       (u32)((s32)gMemCheckStruct.FreameBuffers[0] - (s32)gMemCheckStruct.HeapStart);
}
