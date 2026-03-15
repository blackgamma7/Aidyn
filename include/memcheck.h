#pragma once
#include "typedefs.h"

struct MemCheck_struct {
    u32 ramstartVal;
    u16 *DepthBuffer;
    void *heapStart;
    void *frameBuffers[2];
    u32 RamSize;
    u32 ramVal0;
    u32 frameBufferSize0;
    u32 mem_free_allocated;
    u32 frameBufferSize1;
};
void MemoryCheck(uintptr_t ramstart,uintptr_t arg1);

extern MemCheck_struct gMemCheckStruct;
extern u16 gExpPakFlag;