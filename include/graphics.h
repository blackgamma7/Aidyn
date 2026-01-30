#include "typedefs.h"

//struct sent to scheduler. used in appProc
struct GtaskMsg {
    u16 unkShort; //always 2
    OSScTask *task;
};


#define SCREEN_WIDTH  320 //standard screen width
#define SCREEN_CENTERW (SCREEN_WIDTH/2) //half of standard screen width
#define SCREEN_WIDTH_HI  512 //"Hi-Resolution" screen width
#define SCREEN_HEIGHT 240 //Height resolution is never changed.
#define SCREEN_CENTERH (SCREEN_HEIGHT/2) //half of screen height
#define FBCOUNT 2 //for data with one for each framebuffer
//for render params that are the entire screenspace
#define FULL_SCREENSPACE 0,0,SCREEN_WIDTH,SCREEN_HEIGHT
struct gfxManager {
    OSSched *sched;
    Gfx *GfxLists[FBCOUNT];
    void* outputBuff;
    void* ouputbuffSize;
    void* yieldData;
    void *FrameBuffers[FBCOUNT];
    u16 *DepthBuffer;
    u8 (*textfont)[8][4]; /* for debug text */
    u8 (*unkBlock)[8][8]; /* white 8x8 8-bit block */
    OSViMode osvimodeCustom;
    #if VER_NA11
    OSViMode osvimodeBuffer;
    #endif
    int unk0x7c; /* unused? */
    OSScTask tasks[FBCOUNT];
    GtaskMsg taskMsgs[FBCOUNT];
    Vp viewport;
    u32 ram_size;
    u32 FramebufferSize[FBCOUNT];
    u32 dListSize;
    u32 dListStartTime;
    u32 taskTime;
    u32 unkTime0;
    u32 unkTime1;
    u16 Hres[FBCOUNT];
    u16 Vres[FBCOUNT];
    u8 colordepth[FBCOUNT];
    u8 bufferChoice;
    s8 taskTicks;
    u8 unk0x19c; /* set to 0 after drawing letterbox */
};

//may need to move this to header for Borg8 properties.
#define RSPFUNC(g,flag) g=borg8DlistInit(g,flag,Graphics::GetHRes(),Graphics::GetVRes())
#define RSPFUNC6(g) RSPFUNC(g,6)
#define RSPFUNC5(g) RSPFUNC(g,5)

namespace Graphics{
void initGfx(OSSched *);
void initGfx_2();
void SetGfxMode(u16 ,u16 ,u8 );
void video_settings();
Gfx* StartGfxList();
Gfx* SomeOtherInit(Gfx *,u16 ,u16 ,u16 ,u16 ,u8 ,u8 ,u8 ,u8 );
Gfx* SetToFill(Gfx*);
Gfx* DebugDrawRect(Gfx *,u16 ,u16 ,u16 ,u16 ,u8 ,u8 ,u8 ,u8 );
Gfx* StartDisplay(Gfx *,u16 ,u16 ,u16 ,u16 );
Gfx* EndList(Gfx *);
u8 ResolutionCheck();
OSScTask* CreateTask(Gfx *,OSMesgQueue *);
void getTaskTime(GtaskMsg *);
u8 GetBufferChoice();
void* pickBuffer(void *,void *);
void* pickOtherBuffer(void *,void *);
void* GetFrameBuffer(u8 );
u16* GetDepthBuffer();
u32 FramebufferSize0();
u32 FramebufferSize1();
u32 GetHRes();
u32 GetVRes();
u32 GetColorDepth();
void getGfxLastFrame(void *pDest,u16 H,u16 V,u8 depth,u16 param_5,u16 param_6,u16 Hres,u16 Vres);
void passto_GetGfxLastFrame(void*,u16,u16,u8);
Gfx * DrawBlock(Gfx *gfx,u16 x0,u16 y0,u16 x1,u16 y1,u8 r,u8 g,u8 b,u8 a);
Gfx* DrawText(Gfx *,char *,u16,u16,u8,u8,u8,u8);
Gfx* DisplaySystemMonitor(Gfx *);
};

struct ResolutionSettings {
    u16 Hres;
    u16 Vres;
    u8 pad;
    u8 colorDepth;
};

char* res_mode_string[3]={"Normal Resolution","High Resolution","32 Bit Color"};
ResolutionSettings res_colormode[3]={
  {SCREEN_WIDTH,SCREEN_HEIGHT,0,16},
  {SCREEN_WIDTH_HI,SCREEN_HEIGHT,0,16},
  {SCREEN_WIDTH,SCREEN_HEIGHT,0,32}};