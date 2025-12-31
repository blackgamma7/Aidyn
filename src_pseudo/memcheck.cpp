#include "memcheck.h"

void MemoryCheck(uintptr_t ramstart,uintptr_t arg1){
  u32 mem = osGetMemSize();
  gMemCheckStruct.RamSize = mem;
  gMemCheckStruct.ramVal0 = arg1;
  if (mem > 0x400000) {
    gMemCheckStruct.frameBufferSize0 = (320)*(240)*4;
    gMemCheckStruct.frameBufferSize1 = (320)*(240)*4;
    gExpPakFlag=true;
  }
  else {
    gMemCheckStruct.frameBufferSize0 = (320)*(240)*2;
    gMemCheckStruct.frameBufferSize1 = (320)*(240)*2;
    gExpPakFlag=false;
  }
  gMemCheckStruct.DepthBuffer = (u16 *)((ramstart + arg1 & ~0x3f) + 0x40);
  gMemCheckStruct.frameBuffers[0] =
       (void *)((uintptr_t)mem - (gMemCheckStruct.frameBufferSize1 * 2 + -0x80000000));
  gMemCheckStruct.heapStart = gMemCheckStruct.DepthBuffer + gMemCheckStruct.frameBufferSize0;
  gMemCheckStruct.ramstartVal = ramstart;
  gMemCheckStruct.frameBuffers[1] =
       (void *)((uintptr_t)gMemCheckStruct.frameBuffers[0] + gMemCheckStruct.frameBufferSize1);
  gMemCheckStruct.mem_free_allocated =
       (u32)((uintptr_t)gMemCheckStruct.frameBuffers[0] - (uintptr_t)gMemCheckStruct.heapStart);
}
