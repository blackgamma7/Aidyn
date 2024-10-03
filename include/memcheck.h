#include "typedefs.h"

struct MemCheck_struct {
    u32 ramstartVal;
    s16 *DepthBuffer;
    void *heapStart;
    void *FreameBuffers[2];
    u32 RamSize;
    u32 ramVal0;
    u32 MaxResolution0;
    u32 mem_free_allocated;
    u32 MaxResolution1;
};

MemCheck_struct gMemCheckStruct={0};
u16 gExpPakFlag=0;