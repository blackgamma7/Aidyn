#include "GhidraDump.h"

struct GtaskMsg {
    u16 unkShort;
    OSScTask *task;
};
#define FBCOUNT 2 //for data with one for each framebuffer
struct gfxManager {
    OSSched *sched;
    Gfx *GfxLists[2];
    void* outputBuff;
    void* ouputbuffSize;
    void* yieldData;
    void *FrameBuffers[2];
    s16 *DepthBuffer;
    u8 (*textfont)[32]; /* for debug text */
    u8 (*unk0x2c)[64]; /* white block? */
    OSViMode osvimodeCustom;
    int unk0x7c; /* unused? */
    OSScTask tasks[2];
    GtaskMsg taskMsgs[2];
    ushort MoreResSettings[2][4]; /* H*2,V*2,511,0 */
    uint ram_size;
    uint FramebufferSize[2];
    uint dListSize;
    uint dListStartTime;
    u32 taskTime;
    u32 unkTime0;
    u32 unkTime1;
    ushort hres[2];
    ushort Vres[2];
    u8 colordepth[2];
    u8 bufferChoice;
    s8 taskTicks;
    u8 unk0x19c; /* set to 0 after drawing letterbox */
};

#define RSPFUNC(g,flag) g=Graphics::SomeDListInit(g,flag,Graphics::get_hres(),Graphics::get_vres())
#define RSPFUNC6(g) RSPFUNC(g,6)
#define RSPFUNC5(g) RSPFUNC(g,5)