#include "typedefs.h"

struct GtaskMsg {
    u16 unkShort;
    OSScTask *task;
};
#define FBCOUNT 2 //for data with one for each framebuffer
struct gfxManager {
    OSSched *sched;
    Gfx *GfxLists[FBCOUNT];
    void* outputBuff;
    void* ouputbuffSize;
    void* yieldData;
    void *FrameBuffers[FBCOUNT];
    s16 *DepthBuffer;
    u8 (*textfont)[32]; /* for debug text */
    u8 (*unk0x2c)[64]; /* white block? */
    OSViMode osvimodeCustom;
    int unk0x7c; /* unused? */
    OSScTask tasks[FBCOUNT];
    GtaskMsg taskMsgs[FBCOUNT];
    ushort MoreResSettings[FBCOUNT][4]; /* H*2,V*2,511,0 */
    uint ram_size;
    uint FramebufferSize[FBCOUNT];
    uint dListSize;
    uint dListStartTime;
    u32 taskTime;
    u32 unkTime0;
    u32 unkTime1;
    ushort Hres[FBCOUNT];
    ushort Vres[FBCOUNT];
    u8 colordepth[FBCOUNT];
    u8 bufferChoice;
    s8 taskTicks;
    u8 unk0x19c; /* set to 0 after drawing letterbox */
};

//may need to move this to header for Borg8 properties.
#define RSPFUNC(g,flag) g=borg8DlistInit(g,flag,Graphics::get_hres(),Graphics::get_vres())
#define RSPFUNC6(g) RSPFUNC(g,6)
#define RSPFUNC5(g) RSPFUNC(g,5)

namespace Graphics{
void initGfx(OSSched *);
void initGfx_2();
void SetGfxMode(u16 ,u16 ,u8 );
void video_settings();
Gfx* StartGfxList();
Gfx* SomeOtherInit(Gfx *,u16 ,u16 ,u16 ,ushort ,u8 ,u8 ,u8 ,u8 );
Gfx* DebugDrawRect(Gfx *,u16 ,u16 ,u16 ,u16 ,u8 ,u8 ,u8 ,u8 );
Gfx* StartDisplay(Gfx *,u16 ,u16 ,u16 ,u16 );
Gfx* EndList(Gfx *);
u8 ResolutionCheck();
GtaskMsg* CreateTask(Gfx *,OSMesgQueue *);
void getTaskTime(GtaskMsg *);
u8 GetBufferChoice();
void* pickBuffer(void *,void *);
void* pickOtherBuffer(void *,void *);
void* GetFrameBuffer(u8 );
s16* GetDepthBuffer();
u32 FramebufferSize0();
u32 FramebufferSize1();
u32 get_hres();
u32 get_vres();
u32 get_colorDepth();
void passto_GetGfxLastFrame(void*,u16,u16,u8);
Gfx* DrawText(Gfx *,char *,u16 ,u16 ,u8 ,u8,u8,u8);
Gfx* DisplaySystemMonitor(Gfx *);
};
void getGfxLastFrame(void *pDest,u16 H,u16 V,u8 depth,u16 param_5,u16 param_6,u16 Hres,u16 Vres);