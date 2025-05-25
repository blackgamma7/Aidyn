#define FILENAME "./src/gfx.cpp"

#include "graphics.h"
#include "globals.h"
#include "memcheck.h"

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
gfxManager gGfxManager={0};

extern u8 gCrashFont[ASCIIRange][8];
//inialize graphic settings, alloc memory, load debug font.
void Graphics::initGfx(OSSched *sched){
  byte bVar1;
  u8 uVar2;
  int iVar3;
  OSViMode *src;
  int iVar4;
  int iVar5;
  byte bVar7;
  
  u32 k = 0x3200*sizeof(Gfx); //"k" doubles as for loop iterator
  //double dlist alloc if expansion pak detected
  if (0x400000 < gMemCheckStruct.RamSize) k = 0x6400*sizeof(Gfx);
  CLEAR(&gGfxManager);
  gGfxManager.DepthBuffer = (s16 *)gMemCheckStruct.DepthBuffer;
  gGfxManager.FrameBuffers[0] = gMemCheckStruct.FreameBuffers[0];
  gGfxManager.FrameBuffers[1] = gMemCheckStruct.FreameBuffers[1];
  gGfxManager.sched = sched;
  gGfxManager.GfxLists[0] = (Gfx *)HALLOC(k,0xdc);
  gGfxManager.GfxLists[1] = (Gfx *)HALLOC(k,0xdd);
  ALLOCS(gGfxManager.outputBuff,0x400,222);
  ALLOCS(gGfxManager.ouputbuffSize,0xc00,223);
  ALLOCS(gGfxManager.yieldData,0x1000,224);
  ALLOCS(gGfxManager.textfont,(4*8*ASCIIRange),228);
  ALLOCS(gGfxManager.unkBlock,8*8,229);
  if (osTvType == OS_TV_NTSC) src = osViModeTable + OS_VI_NTSC_LAN1;
  else if (osTvType == OS_TV_MPAL) src = osViModeTable + OS_VI_MPAL_LAN1;
  else if (osTvType == OS_TV_PAL) 
  #ifdef VER_NA11
  {COPY(&gGfxManager.osvimodeCustom,osViModeTable + OS_VI_PAL_LAN1);
    gfx_struct.osvimodeCustom.fldRegs[0].vScale = 0x280270;
    gfx_struct.osvimodeCustom.fldRegs[0].yScale = 0x346;
    COPY(&gfx_struct.osVimodeBuffer,&gfx_struct.osvimodeCustom);
    goto v11skip;
  }
  #else
       src = osViModeTable + OS_VI_PAL_LAN1;
  #endif
  else CRASH("gfx.cpp, InitGfx()","TV Type not supported");
  COPY(&gGfxManager.osvimodeCustom,src);
  v11skip: //kinda dirty hack, not sure mine or theirs.
  gGfxManager.osvimodeCustom.comRegs.width = 0x200;
  gGfxManager.osvimodeCustom.fldRegs[0].origin = 0x400;
  gGfxManager.osvimodeCustom.comRegs.xScale = 0x333;
  gGfxManager.taskMsgs[0].unkShort = 2;
  gGfxManager.taskMsgs[1].unkShort = 2;
  gGfxManager.ram_size = gMemCheckStruct.RamSize;
  gGfxManager.FramebufferSize[0] = gMemCheckStruct.MaxResolution1;
  gGfxManager.FramebufferSize[1] = gMemCheckStruct.MaxResolution0;
  iVar3 = 0;
  gGfxManager.dListSize = k;
  //make 1-bit font 4-bit
  for(u8 i=0;i<ASCIIRange;i++) { //char
    for(u8 j = 0;j < 8;j++) { //byte
      k = 0;
      bVar1 = gCrashFont[i][j];
      iVar4 = iVar5;
      for(k=0;k<8;k++) { //bit
        iVar5 = 0;
        if (((int)(uint)bVar1 >> (8 - k & 0x1f) & 1U) != 0) {
          iVar5 = 0xf;
        }
        if ((k & 1) == 0) {
          uVar2 = (u8)(iVar5 << 4);
        }
        else {
          uVar2 = (byte)iVar5 | gGfxManager.textfont[i][j][k/2];
        }
        gGfxManager.textfont[i][j][k/2] = uVar2;
      }
    }
  }
  memset(gGfxManager.unkBlock,0xff,8*8); //make a White block?
  SetGfxMode(res_colormode[0].Hres,res_colormode[0].Vres,res_colormode[0].colorDepth);
  gGlobals.ResolutionSelect = 0;
  video_settings();
}

void Graphics::initGfx_2(void){
  osSpTaskYield();
  SetGfxMode(SCREEN_WIDTH,SCREEN_HEIGHT,0x10);
  video_settings();
  osViBlack(true);
  gGfxManager.taskTicks = -1;}


void Graphics::SetGfxMode(u16 Hres,u16 Vres,u8 color){
  if (gGfxManager.ram_size <= 0x400000) { //huh, doesn't check the gExpPakFlag.
    if (((Hres != SCREEN_WIDTH) || (Vres != SCREEN_HEIGHT)) || (color != 16)) {
      CRASH("gfx.cpp, SetGfxMode()","Non expansion pak resolution not supported!");}
  }
  else {
    if ((((Hres != SCREEN_WIDTH) || (Vres != SCREEN_HEIGHT)) || ((color != 16 && (color != 32)))) &&
       (((Hres != SCREEN_WIDTH_HI || (Vres != SCREEN_HEIGHT)) || (color != 16)))) {
      CRASH("gfx.cpp, SetGfxMode()","Expansion pak resolution not supported!");}
  }
  gGfxManager.Hres[0] = Hres;
  gGfxManager.Vres[0] = Vres;
  gGfxManager.colordepth[0] = color;}

void Graphics::video_settings(void){
  memset(gGfxManager.FrameBuffers[0],0,gGfxManager.FramebufferSize[0] << 1);
  osViSwapBuffer(gGfxManager.FrameBuffers[0]);
  if (gGfxManager.Hres[0] == SCREEN_WIDTH) {
    if (gGfxManager.colordepth[0] == 0x10) {
      if (osTvType == OS_TV_NTSC) osViSetMode(osViModeTable + 2);
      else if (osTvType == OS_TV_MPAL) osViSetMode(osViModeTable + 0x1e);
      else if (osTvType == OS_TV_PAL)
      #ifdef VER_NA11
        osViSetMode(&gGfxManager.osvimodeCustom);
      #else
        osViSetMode(osViModeTable + 0x10);
      #endif
      }
    else {
      if (osTvType == OS_TV_NTSC) osViSetMode(osViModeTable + 6);
      else if (osTvType == OS_TV_MPAL) osViSetMode(osViModeTable + 0x22);
      else if (osTvType == OS_TV_PAL) osViSetMode(osViModeTable + 0x14);
    }
  }
  #ifdef VER_NA11
  else osViSetMode(&gGfxManager.osVimodeBuffer); // use second ViMode for HiRes mode
  #else
  else osViSetMode(&gGfxManager.osvimodeCustom);
  #endif
  osViSetSpecialFeatures(OS_VI_GAMMA_OFF|OS_VI_DIVOT_OFF|OS_VI_DITHER_FILTER_ON);
  gGfxManager.viewport.vp.vscale[0] = gGfxManager.Hres[0] << 1;
  gGfxManager.viewport.vp.vscale[1] = gGfxManager.Vres[0] << 1;
  gGfxManager.viewport.vp.vscale[2] = 0x1ff;
  gGfxManager.viewport.vp.vscale[3] = 0;
  gGfxManager.viewport.vp.vtrans[0] = gGfxManager.Hres[0] << 1;
  gGfxManager.viewport.vp.vtrans[1] = gGfxManager.Vres[0] << 1;
  gGfxManager.viewport.vp.vtrans[2] = 0x1ff;
  gGfxManager.viewport.vp.vtrans[3] = 0;
  gGfxManager.Hres[1] = gGfxManager.Hres[0];
  gGfxManager.Vres[1] = gGfxManager.Vres[0];
  gGfxManager.colordepth[1] = gGfxManager.colordepth[0];}

// adds Framebuffer, Depthbuffer, Scissor, clip, and viewport
Gfx * Graphics::StartGfxList(void){
  OSTime OVar2;

  Gfx* g = gGfxManager.GfxLists[gGfxManager.bufferChoice];
  OVar2 = osGetTime();
  gGfxManager.dListStartTime = (uint)udivdi3(CONCAT44((int)(OVar2 >> 0x20) << 6 | (uint)OVar2 >> 0x1a,(uint)OVar2 << 6),3000);
  OVar2 = osGetTime();
  gGfxManager.unkTime1 = (u32)udivdi3(CONCAT44((int)(OVar2 >> 0x20) << 6 | (uint)OVar2 >> 0x1a,(uint)OVar2 << 6),3000);
  gSPSegment(g++,0,0); //?
  if (gGfxManager.colordepth[1] == 16) {gDPSetColorImage(g++,G_IM_FMT_RGBA,G_IM_SIZ_16b,gGfxManager.Hres[1],gGfxManager.FrameBuffers[gGfxManager.bufferChoice]);}
  else {gDPSetColorImage(g++,G_IM_FMT_RGBA,G_IM_SIZ_32b,gGfxManager.Hres[1],gGfxManager.FrameBuffers[gGfxManager.bufferChoice]);}
  gDPSetDepthImage(g++,&gGfxManager.DepthBuffer)
  gDPSetScissor(g++,G_SC_NON_INTERLACE,0,0,gGfxManager.Hres[1],gGfxManager.Vres[1]);
  gSPClipRatio(g++,FRUSTRATIO_3);
  gSPViewport(g++,&gGfxManager.viewport);
  return g;
}

//draws colored Rectangle?
Gfx * Graphics::SomeOtherInit(Gfx *gfx,u16 x0,u16 y0,u16 x1,u16 y1,u8 r,u8 g,u8 b,u8 a){
  gDPPipeSync(gfx++);
  gDPSetCycleType(gfx++,G_CYC_FILL);
  gDPSetRenderMode(gfx++,0,0);
  if (gGfxManager.colordepth[1] == 16) {gDPSetFillColor(gfx++,GPACK_RGBA5551(r,g,b,a))}
  else {DPRGBColor(gfx++,G_SETFILLCOLOR,r,g,b,a);}
  gDPScisFillRectangle(gfx++,
    x0 * (gGfxManager.Hres[1] / SCREEN_WIDTH),
    y0 * (gGfxManager.Vres[1] / SCREEN_HEIGHT),
    x1 * (gGfxManager.Hres[1] / SCREEN_WIDTH) - 1,
    y1 * (gGfxManager.Vres[1] / SCREEN_HEIGHT) - 1);
  return gfx;
}

//draws colored Rectangle?
Gfx * Ofunc_rspcode(Gfx *gfx,u16 param_2,u16 param_3,u16 param_4,u16 param_5,Color32 param_6){
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;

  gDPPipeSync(gfx++);
  gDPPipeSync(gfx++);
  gDPSetCycleType(gfx++,G_CYC_FILL);
  gDPSetRenderMode(gfx++,0,0);
  gDPSetColor(gfx++,G_SETFILLCOLOR,param_6.W);
  uVar6 = param_4 * (gGfxManager.Hres[1] / SCREEN_WIDTH) - 1;
  uVar7 = param_2 * (gGfxManager.Hres[1] / SCREEN_WIDTH);
  uVar8 = param_3 * (gGfxManager.Vres[1] / SCREEN_HEIGHT);
  uVar5 = param_5 * (gGfxManager.Vres[1] / SCREEN_HEIGHT)- 1;
  gDPScisFillRectangle(gfx++,uVar6,uVar5,uVar7,uVar8);
  return gfx;
}

Gfx * GsSetOtherMode_SysMon(Gfx *gfx){
  gDPPipeSync(gfx++);
  gDPSetCycleType(gfx++,G_CYC_FILL);
  gDPSetRenderMode(gfx++,0,0);
  return gfx;
}

//draws colored Rectangle for debug stats
Gfx * Graphics::DebugDrawRect(Gfx *gfx,u16 x0,u16 x1,u16 y0,u16 y1,u8 r,u8 g,u8 b,u8 a){
  gDPPipeSync(gfx++);
  if (gGfxManager.colordepth[1] == 16) {gDPSetFillColor(gfx++,GPACK_RGBA5551(r,g,b,a))}
  else {DPRGBColor(gfx++,G_SETFILLCOLOR,r,g,b,a)}
  gDPScisFillRectangle(gfx++,
  x0 * (gGfxManager.Hres[1] / SCREEN_WIDTH),
  x1 * (gGfxManager.Vres[1] / SCREEN_HEIGHT),
  y0 * (gGfxManager.Hres[1] / SCREEN_WIDTH) - 1,
  y1 * (gGfxManager.Vres[1] / SCREEN_HEIGHT) - 1);
  return gfx;
}

Gfx* Ofunc_80008f48(Gfx*gfx){
  gDPPipeSync(gfx++);
  gDPSetCycleType(gfx++,G_CYC_1CYCLE);
  gDPSetRenderMode(gfx++,0,0x552078);
  return gfx;
}


Gfx * Graphics::StartDisplay(Gfx *g,u16 x,u16 y,u16 h,u16 V){
  gDPPipeSync(g++);
  gDPSetCycleType(g++,G_CYC_FILL);
  gDPSetRenderMode(g++,0,0);
  gDPSetColorImage(g++,G_IM_FMT_RGBA,G_IM_SIZ_16b,gGfxManager.Hres[1],gGfxManager.DepthBuffer)
  gDPSetFillColor(g++,0xfffcfffc);
  gDPScisFillRectangle(g++,
    (h*(gGfxManager.Hres[1] / SCREEN_WIDTH))-1,
    V*(gGfxManager.Vres[1] / SCREEN_HEIGHT)-1,
    (x * gGfxManager.Hres[1] / SCREEN_WIDTH),
    y * (gGfxManager.Vres[1] / SCREEN_HEIGHT));
  gDPPipeSync(g++);
  if (gGfxManager.colordepth[1] == 0x10){
    gDPSetColorImage(g++,G_IM_FMT_RGBA,G_IM_SIZ_16b,gGfxManager.Hres[1],gGfxManager.FrameBuffers[gGfxManager.bufferChoice]);
  }
  else{
    gDPSetColorImage(g++,G_IM_FMT_RGBA,G_IM_SIZ_32b,gGfxManager.Hres[1],gGfxManager.FrameBuffers[gGfxManager.bufferChoice]);
  }
  return g;
}


//draws overscan "letterbox" and ends dlist
Gfx * Graphics::EndList(Gfx *gfx){
  u16 uVar1;
  uint uVar2;
  
  gDPPipeSync(gfx++);
  gDPSetCycleType(gfx++,G_CYC_FILL);
  gDPSetRenderMode(gfx++,0,0);
  //draw overscan bars around screen
  gDPSetFillColor(gfx++,0);
  if (gGfxManager.Hres[1] == SCREEN_WIDTH) {
    gDPFillRectangle(gfx++,15,0,0,0);
    gDPFillRectangle(gfx++,gGfxManager.Hres[1]-1,11,0,0);
    gDPFillRectangle(gfx++,gGfxManager.Hres[1]-1,gGfxManager.Vres[1]-1,gGfxManager.Hres[1]-16,0);
  }
  else {
    gDPFillRectangle(gfx++,19,gGfxManager.Vres[1]-1,0,0);
    gDPFillRectangle(gfx++,gGfxManager.Hres[1]-1,11,0,0);
    gDPFillRectangle(gfx++,gGfxManager.Hres[1]-1,gGfxManager.Vres[1]-1,gGfxManager.Hres[1]-20,0);
  }
  gDPFillRectangle(gfx++,gGfxManager.Hres[1]-1,gGfxManager.Vres[1]-1,0,gGfxManager.Vres[1]-12);
  gDPFullSync(gfx++);
  gSPEndDisplayList(gfx++);
  gGfxManager.unk0x19c = 0;
  osWritebackDCacheAll();
  return gfx;
}


u8 Graphics::ResolutionCheck(void){
  u8 bVar1;
  
  if (((gGfxManager.Hres[0] == gGfxManager.Hres[1]) && (gGfxManager.Vres[0] == gGfxManager.Vres[1]))
     && (gGfxManager.colordepth[0] == gGfxManager.colordepth[1])) {
    bVar1 = (byte)gGfxManager.taskTicks < 2;
  }
  else {
    bVar1 = false;
    if (gGfxManager.taskTicks == 0) {
      video_settings();
      bVar1 = true;
    }
  }
  return bVar1;
}

// sets OSSCTask paramaters
GtaskMsg* Graphics::CreateTask(Gfx *glist,OSMesgQueue *param_2)
//ghidra did NOT like this function, for some reason.
{
  GtaskMsg *pOVar5 =&gGfxManager.taskMsgs[gGfxManager.bufferChoice];
  gGfxManager.tasks[gGfxManager.bufferChoice] = *pOVar5->task;
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.type = M_GFXTASK;
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.flags = 0;
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.data_ptr=(u64*)gGfxManager.GfxLists[gGfxManager.bufferChoice];
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.ucode_boot = (u64*)rspbootTextStart;
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.ucode_boot_size = sizeof(rspbootTextStart);
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.ucode = (u64*)gspF3DEX2_fifoTextStart;
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.ucode_size = 0x1000;
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.ucode_data = (u64*)gspF3DEX2_fifoDataStart;
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.ucode_data_size = 0x800;
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.data_size = (s32)&glist - (s32)gGfxManager.GfxLists[gGfxManager.bufferChoice];
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.dram_stack_size = 0x400;
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.dram_stack = (u64*)gGfxManager.outputBuff;
  pOVar5->task = NULL;
  gGfxManager.tasks[gGfxManager.bufferChoice].state = 0;
  gGfxManager.tasks[gGfxManager.bufferChoice].msgQ = param_2;
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.output_buff = (u64*)gGfxManager.yieldData;
  gGfxManager.tasks[gGfxManager.bufferChoice].flags = OS_SC_NEEDS_RDP|OS_SC_NEEDS_RSP|OS_SC_LAST_TASK|OS_SC_SWAPBUFFER;
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.output_buff_size = (u64*)(&gGfxManager.yieldData + 0x1000);
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.yield_data_size = 0xc00;
  gGfxManager.tasks[gGfxManager.bufferChoice].list.t.yield_data_ptr = (u64*)gGfxManager.ouputbuffSize;
  gGfxManager.tasks[gGfxManager.bufferChoice].msg = &gGfxManager.taskMsgs[gGfxManager.bufferChoice];
  gGfxManager.tasks[gGfxManager.bufferChoice].framebuffer =gGfxManager.FrameBuffers[gGfxManager.bufferChoice];
  gGfxManager.tasks[gGfxManager.bufferChoice].startTime = 0;
  gGfxManager.tasks[gGfxManager.bufferChoice].totalTime = 0;
  gGfxManager.taskTicks++;
  gGfxManager.bufferChoice^= 1;
  return pOVar5;
}

void Graphics::getTaskTime(GtaskMsg *t){
  gGfxManager.taskTime = udivdi3(CONCAT44(*(int *)&t->task->totalTime << 6 | *(uint *)((int)&t->task->totalTime + 4) >> 0x1a,*(uint *)((int)&t->task->totalTime + 4) << 6),3000);
  gGfxManager.taskTicks--;
}

u8 Graphics::GetBufferChoice(void){return gGfxManager.bufferChoice;}


void * Graphics::pickBuffer(void *A,void *B){
  if (gGfxManager.bufferChoice == 0) B = A;
  return B;}

void * Graphics::pickOtherBuffer(void *A,void *B){
  if (gGfxManager.bufferChoice == 0) A = B;
  return A;}

void * Graphics::GetFrameBuffer(u8 param_1){return gGfxManager.FrameBuffers[param_1];}
s16 * Graphics::GetDepthBuffer(void){return gGfxManager.DepthBuffer;}

u32 Graphics::FramebufferSize0(void){return gGfxManager.FramebufferSize[0];}
u32 Graphics::FramebufferSize1(void){return gGfxManager.FramebufferSize[1];}
u32 Graphics::get_hres(void){return gGfxManager.Hres[1];}
u32 Graphics::get_vres(void){return gGfxManager.Vres[1];}
u32 Graphics::get_colorDepth(void){return gGfxManager.colordepth[1];}

//copies the FB for pause BG and savegame screenshot
void Graphics::getGfxLastFrame(void *pDest,u16 H,u16 V,u8 depth,u16 param_5,u16 param_6,u16 Hres,u16 Vres){
  u16 uVar1;
  void *fb;
  u32 uVar3;
  s32 iVar4;
  float fVar5;
  u8 bVar6;
  float fVar7;
  float fVar8;
  u16 uVar9;
  u8 bVar10;
  u32 uVar11;
  undefined uVar12;
  u8 bVar13;
  ulonglong uVar14;
  s32 iVar15;
  u8 bVar16;
  ulonglong uVar17;
  u32 uVar18;
  u8 bVar19;
  Color32 *puVar20;
  u16 *puVar21;
  undefined *puVar22;
  u32 uVar23;
  ulonglong H_;
  u32 uVar24;
  u32 uVar25;
  ulonglong V_;
  float fVar26;
  float fVar27;
  float fVar28;
  float fVar29;
  
  bVar10 = gGfxManager.colordepth[1];
  uVar9 = gGfxManager.Hres[1];
  uVar11 = 0;
  H_ = (s16)H;
  V_ = (s16)V;
  if ((pDest == NULL) ||
     ((((depth != 32 && (depth != 16)) && (depth != 8)) && (depth != 4)))) {
    CRASH("gfx.cpp, GetGfxLastFrame()","pDest_ == NULL || depth_ != 32 || depth_ != 16 || depth_ != 8 || depth_ != 4");}
  fb = gGfxManager.FrameBuffers[gGfxManager.bufferChoice];
  if ((depth == 8) || (depth == 4)) {
    bVar6 = 2;
    uVar11 = 0xff;
  }
  else {bVar6 = 1;}
  uVar25 = 0;
  bVar19 = 0;
  if (bVar6 != 0) {
    do {
      uVar14 = 0;
      bVar13 = bVar19 + 1;
      if (V_ != 0) {
        uVar24 = (u32)H_;
        fVar29 = (float)(u32)param_6;
        do {
          fVar8 = 31.0f;
          fVar7 = 255.0f;
          fVar28 = (float)(u32)param_5;
          uVar17 = 0;
          fVar27 = (float)(u32)Hres - fVar28;
          iVar15 = (s32)uVar14;
          uVar14 = SEXT48(iVar15 + 1);
          if (H_ != 0) {
            iVar4 = iVar15 * uVar24;
            puVar22 = pDest + iVar4;
            iVar15 = iVar15 * (uVar24 >> 1);
            puVar21 = (u16 *)(pDest + iVar4 * 2);
            puVar20 = (Color32 *)(pDest + iVar4 * 4);
            uVar23 = uVar11;
            do {
              uVar18 = (u32)uVar17;
              uVar11 = uVar23;
              if (bVar10 == 0x20) {
                fVar26 = fVar29;
                if (INT_MAX_f <= fVar29) {fVar26 = fVar29 - INT_MAX_f;}
                fVar5 = fVar28;
                if (INT_MAX_f <= fVar28) {fVar5 = fVar28 - INT_MAX_f;}
                uVar3 = *(u32 *)(((s32)fVar26 * (u32)uVar9 + (s32)fVar5) * 4 + (s32)fb);
                if (depth == 0x20) {*puVar20.W = uVar3 | 0xff;}
                else {
                  if (depth == 0x10) {
                    *puVar21 = (u16)((uVar3 >> 0x1b) << 0xb) | (u16)(uVar3 >> 0xd) & 0x7c0 |
                               (u16)(uVar3 >> 10) & 0x3e | 1;
                  }
                  else {
                    if (depth == 8) {
                      uVar11 = ((uVar3 >> 0x18) + (uVar3 >> 0x10) + (uVar3 >> 8) & 0xff) / 3;
                      if (bVar19 == 0) {
LAB_80009c10:
                        if (uVar25 < uVar11) {uVar25 = uVar11;}
                        if (uVar23 <= uVar11) {uVar11 = uVar23;}
                      }
                      else {
                        fVar26 = ((float)(uVar11 - uVar23) / (float)(uVar25 - uVar23)) * fVar7;
                        if (fVar26 < INT_MAX_f) {
                          *puVar22 = (char)(s32)fVar26;
                          uVar11 = uVar23;
                        }
                        else {
                          *puVar22 = (char)(s32)(fVar26 - INT_MAX_f);
                          uVar11 = uVar23;
                        }
                      }
                    }
                    else {
                      uVar11 = ((uVar3 >> 0x18) + (uVar3 >> 0x10) + (uVar3 >> 8) & 0xff) / 3;
                      if (bVar19 == 0) goto LAB_80009c10;
                      fVar26 = ((float)(uVar11 - uVar23) / (float)(uVar25 - uVar23)) * fVar7;
                      if (INT_MAX_f <= fVar26) {fVar26-= INT_MAX_f;}
                      uVar11 = ((s32)fVar26 & 0xffU) >> 4;
                      bVar16 = (u8)uVar11;
                      if ((uVar17 & 1) != 0) goto LAB_80009c94;
LAB_80009cb4:
                      pDest[iVar15 + (uVar18 >> 1)] = (char)(uVar11 << 4);
                      uVar11 = uVar23;
                    }
                  }
                }
              }
              else {
                fVar26 = fVar29;
                if (INT_MAX_f <= fVar29) {fVar26 = fVar29 - INT_MAX_f;}
                fVar5 = fVar28;
                if (INT_MAX_f <= fVar28) {fVar5 = fVar28 - INT_MAX_f;}
                uVar1 = *(u16 *)(((s32)fVar26 * (u32)uVar9 + (s32)fVar5) * 2 + (s32)fb);
                if (depth == 32) {
                  *puVar20 = (u32)(uVar1 >> 0xb) << 0x1b | (uVar1 >> 6 & 0x1f) << 0x13 |
                             (uVar1 & 0x3e) << 10 | 0xff;
                }
                else {
                  if (depth == 16) {*puVar21 = uVar1 | 1;}
                  else {
                    if (depth == 8) {
                      uVar11 = ((u32)(uVar1 >> 0xb) + (uVar1 >> 6 & 0x1f) + (uVar1 >> 1 & 0x1f)) /
                               3;
                      if (bVar19 == 0) goto LAB_80009c10;
                      fVar26 = ((float)(uVar11 - uVar23) / (float)(uVar25 - uVar23)) * fVar8;
                      if (fVar26 < INT_MAX_f) {uVar12 = (undefined)((s32)fVar26 << 3);}
                      else {uVar12 = (undefined)((s32)(fVar26 - INT_MAX_f) << 3);}
                      *puVar22 = uVar12;
                      uVar11 = uVar23;
                    }
                    else {
                      uVar11 = ((u32)(uVar1 >> 0xb) + (uVar1 >> 6 & 0x1f) + (uVar1 >> 1 & 0x1f)) / 3;
                      if (bVar19 == 0) goto LAB_80009c10;
                      fVar26 = ((float)(uVar11 - uVar23) / (float)(uVar25 - uVar23)) * fVar8;
                      if (INT_MAX_f <= fVar26) {fVar26-= INT_MAX_f;}
                      uVar11 = ((s32)fVar26 & 0xffU) >> 1;
                      bVar16 = (u8)uVar11;
                      if ((uVar17 & 1) == 0) goto LAB_80009cb4;
LAB_80009c94:
                      pDest[iVar15 + (uVar18 >> 1)] = bVar16 | pDest[iVar15 + (uVar18 >> 1)];
                      uVar11 = uVar23;
                    }
                  }
                }
              }
              puVar22++;
              puVar21++;
              puVar20++;
              uVar17 = SEXT48((s32)(uVar18 + 1));
              fVar28 = fVar28 + fVar27 / (float)uVar24;
              uVar23 = uVar11;
            } while (uVar17 < H_);
          }
          fVar29 += ((float)(u32)Vres - (float)(u32)param_6) / (float)(s32)V_;
        } while (uVar14 < V_);
      }
      bVar19 = bVar13;
    } while (bVar13 < bVar6);
  }
  return;
}

void Graphics::passto_GetGfxLastFrame(void *iOut,u16 w,u16 h,u8 d){
  getGfxLastFrame(iOut,w,h,d,0,0,gGfxManager.Hres[1],gGfxManager.Vres[1]);}

//print a monochrome block on the screen. Unused.
Gfx * Graphics::DrawBlock(Gfx *gfx,u16 x0,u16 y0,u16 x1,u16 y1,u8 r,u8 g,u8 b,u8 a){

  gDPPipeSync(gfx++);
  gDPSetCycleType(gfx++,G_CYC_1CYCLE);
  gDPPipelineMode(gfx++,G_PM_1PRIMITIVE);
  gDPSetColorDither(gfx++,G_CD_MAGICSQ);
  gDPSetTexturePersp(gfx++,G_TP_NONE);
  gDPSetTextureLOD(gfx++,G_TL_TILE);
  gDPSetTextureFilter(gfx++,G_TF_POINT);
  gDPSetTextureConvert(gfx++,G_TC_FILT);
  gDPSetTextureDetail(gfx++,G_TD_CLAMP);
  gDPSetCombineKey(gfx++,0);
  gSPLoadGeometryMode(gfx++,0);
  gSPTexture(gfx++,0,0,0,G_TX_RENDERTILE,G_OFF);
  gDPSetRenderMode(gfx++,0x504240,0);
  gDPSetCombine(gfx++,0x119623,0xff2fffff);
  gDPSetPrimColor(gfx++,0,0,r,g,b,a);
  gDPSetTextureLUT(gfx++,G_TT_NONE);
  gDPLoadTextureBlock(gfx++,gGfxManager.unkBlock,G_IM_FMT_IA,G_IM_SIZ_8b,8,8,0,2,2,0,0,0,0);
  /*
  gfx[0x10].words.w0 = 0xfd680007;
  gfx[0x10].words.w1 = (u32)&gGfxManager.unkBlock;
  gfx[0x11].words.w0 = 0xf5680800;
  gfx[0x11].words.w1 = 0x7080200;
  gfx[0x12].words.w0 = 0xe6000000;
  gfx[0x12].words.w1 = 0;
  gfx[0x13].words.w0 = 0xf4000000;
  gfx[0x13].words.w1 = 0x7070070;
  gfx[0x14].words.w0 = 0xe7000000;
  gfx[0x14].words.w1 = 0;
  gfx[0x15].words.w0 = 0xf5680800;
  gfx[0x15].words.w1 = 0x80200;
  gfx[0x16].words.w0 = 0xf2000000;
  gfx[0x16].words.w1 = 0x70070;*/
  s32 iVar8 = ((float)x0 * ((float)gGfxManager.Hres[1] / SCREEN_WIDTH));
  s32 iVar6 = ((float)y0 * ((float)gGfxManager.Vres[1] / SCREEN_HEIGHT));
  s32 iVar3 = ((float)x1 * ((float)gGfxManager.Hres[1] / SCREEN_WIDTH));
  s32 iVar4 = ((float)y1 * ((float)gGfxManager.Vres[1] / SCREEN_HEIGHT));
  f32 fVar10 = (8.0f / (float)(iVar3 - iVar8)) * 1024.0f;
  f32 fVar11 = (8.0f / (float)(iVar4 - iVar6)) * 1024.0f;
  
  gSPScisTextureRectangle(gfx++,iVar8,iVar6,iVar3,iVar4,0,0,0,fVar10,fVar11);
  return gfx;
}

//Draw Debug text string
Gfx * Graphics::DrawText(Gfx *gfx,char *txt,u16 X,u16 Y,u8 red,u8 green,u8 blue,u8 alpha){
  gDPPipeSync(gfx++);
  gDPSetCycleType(gfx++,G_CYC_1CYCLE);
  gDPPipelineMode(gfx++,G_PM_1PRIMITIVE);
  gDPSetColorDither(gfx++,G_CD_MAGICSQ);
  gDPSetTexturePersp(gfx++,G_TP_NONE);
  gDPSetTextureLOD(gfx++,G_TL_TILE);
  gDPSetTextureFilter(gfx++,G_TF_BILERP);
  gDPSetTextureConvert(gfx++,G_TC_FILT);
  gDPSetTextureDetail(gfx++,G_TD_CLAMP);
  gDPSetCombineKey(gfx++,0);
  gSPLoadGeometryMode(gfx++,0);
  gSPTexture(gfx++,0,0,0,G_TX_RENDERTILE,G_OFF);
  gDPSetRenderMode(gfx++,0x504240,0);
  gDPSetCombine(gfx++,0x119623,0xff2fffff);
  gDPSetPrimColor(gfx++,0,0,red,green,blue,alpha);
  gDPSetTextureLUT(gfx++,G_TT_NONE);
  u16 xStart = (int)X * ((float)gGfxManager.Hres[1] / SCREEN_WIDTH);
  u32 yOff = Y * ((float)gGfxManager.Vres[1] / SCREEN_HEIGHT);
  s32 i = 0;
  char c = *txt;
  u16 xOff = xStart;
  while (c) {
    if (c == '\n') {
      yOff+=10;
      xOff = xStart;
    }
    else {
      if (gGfxManager.Hres[1] <= xOff) {
        yOff+=10;
        xOff = xStart;
      }
      gDPLoadTextureBlock(gfx++,gGfxManager.textfont[(c - ' ')],G_IM_FMT_IA,G_IM_SIZ_4b,8,8,0,
        2,2,0,0,0,0);
        /*in case I'm wrong...
      gDPSetTextureImage(pGVar2++,G_IM_FMT_IA,G_IM_SIZ_4b,4,gGfxManager.textfont[(cVar1 - ' ')]);
      pGVar2[1].words.w0 = 0xf5680400;
      pGVar2[1].words.w1 = 0x7080200;
      gDPLoadSync(pGVar2[2]);
      pGVar2[3].words.w0 = 0xf4000000;
      pGVar2[3].words.w1 = 0x7038070;
      gDPPipeSync(pGVar2[4]);
      pGVar2[5].words.w0 = 0xf5600400;
      pGVar2[5].words.w1 = 0x80200;
      pGVar2[6].words.w0 = 0xf2000000;
      pGVar2[6].words.w1 = 0x70070;*/
      gSPScisTextureRectangle(gfx++,xOff,yOff,(xOff + 8),(yOff + 8),0,0,0,0x400,0x400);
      xOff+=8;
    }
    c = txt[++i];
  }
  return gfx;
}

//Show debug statistics
Gfx * Graphics::DisplaySystemMonitor(Gfx *g){
  u16 x2;
  u32 uVar1;
  u32 uVar2;
  u32 uVar3;
  u32 uVar4;
  u32 uVar5;
  u32 uVar6;
  int iVar7;
  int iVar8;
  Gfx *pGVar9;
  Gfx *pGVar10;
  uint uVar11;
  uint uVar12;
  uint uVar13;
  u16 uVar15;
  uint ntscPalVar; //5000000 / refersh rate
  double dVar16;
  float fVar17;
  double dVar18;
  short sVar19;
  short sVar20;
  double dVar21;
  OSTime OVar22;
  u64 uVar23;
  u8 R;
  u8 G;
  
  uVar5 = gMemCheckStruct.mem_free_allocated;
  uVar4 = gMemCheckStruct.MaxResolution0;
  uVar2 = gMemCheckStruct.ramVal0;
  uVar1 = gMemCheckStruct.RamSize;
  iVar7 = get_memUsed();
  uVar6 = gMemCheckStruct.MaxResolution1;
  uVar3 = gMemCheckStruct.ramVal0;
  pGVar10 = gGfxManager.GfxLists[gGfxManager.bufferChoice];
  iVar8 = get_memUsed();
  OVar22 = osGetTime();
  uVar23 = udivdi3(CONCAT44((int)(OVar22 >> 0x20) << 6 | (uint)OVar22 >> 0x1a,(uint)OVar22 << 6),
                   3000);
  gGfxManager.unkTime0 = (int)uVar23 - gGfxManager.unkTime0;
  OVar22 = osGetTime();
  uVar23 = udivdi3(CONCAT44((int)(OVar22 >> 0x20) << 6 | (uint)OVar22 >> 0x1a,(uint)OVar22 << 6),
                   3000);
  gGfxManager.dListStartTime = (int)uVar23 - gGfxManager.dListStartTime;
  if ((osTvType == OS_TV_NTSC) || (osTvType == OS_TV_MPAL)) ntscPalVar = (5000000/60);
  else if (osTvType == OS_TV_PAL) ntscPalVar = (5000000/50);
  else CRASH("gfx.cpp, DisplaySystemMonitor()","Unknown osTvType");
  uVar12 = ntscPalVar;
  if (gGfxManager.taskTime < ntscPalVar) uVar12 = gGfxManager.taskTime;
  uVar13 = ntscPalVar;
  if (gGfxManager.dListStartTime < ntscPalVar) uVar13 = gGfxManager.dListStartTime;
  uVar11 = ntscPalVar;
  if (gGfxManager.unkTime0 < ntscPalVar) uVar11 = gGfxManager.unkTime0;
  gGfxManager.dListStartTime = uVar13;
  gGfxManager.taskTime = uVar12;
  gGfxManager.unkTime0 = uVar11;
  pGVar9 = GsSetOtherMode_SysMon(g);
  uVar15 = ((float)(gMemCheckStruct.ramVal0 * 0x118) / (float)gMemCheckStruct.RamSize + 0.5f) + 20;
  pGVar9 = DebugDrawRect(pGVar9,0x14,0x14,uVar15,0x16,0,0,0xff,0xff);
  dVar18 = (double)(uVar4 * 0x118);
  if ((int)(uVar4 * 0x118) < 0) {
    dVar18 = dVar18 + UINT_MAX_d;
  }
  dVar16 = dVar21;
  if ((int)uVar1 < 0) {
    dVar16 = dVar21 + UINT_MAX_d;
  }
  fVar17 = (float)dVar18 / (float)dVar16 + 0.5f;
  if (INT_MAX_f <= fVar17) {
    fVar17 = fVar17 - INT_MAX_f;
  }
  x2 = uVar15 + (short)(int)fVar17;
  pGVar9 = DebugDrawRect(pGVar9,uVar15,0x14,x2,0x16,0,0,0xff,0xff);
  dVar18 = (double)(uVar5 * 0x118);
  if ((int)(uVar5 * 0x118) < 0) {
    dVar18 = dVar18 + UINT_MAX_d;
  }
  dVar16 = dVar21;
  if ((int)uVar1 < 0) {
    dVar16 = dVar21 + UINT_MAX_d;
  }
  fVar17 = (float)dVar18 / (float)dVar16 + 0.5f;
  if (fVar17 < INT_MAX_f) {
    sVar19 = (short)(int)fVar17;
  }
  else {
    sVar19 = (short)(int)(fVar17 - INT_MAX_f);
  }
  pGVar9 = DebugDrawRect(pGVar9,x2,0x14,x2 + sVar19,0x16,0,0,0,0xff);
  dVar18 = (double)(iVar7 * 280);
  dVar16 = dVar21;
  if ((int)uVar1 < 0) {
    dVar16 = dVar21 + UINT_MAX_d;
  }
  fVar17 = (float)(iVar7 * 280) / (float)dVar16 + 0.5f;
    sVar20 = (short)(int)(fVar17 - INT_MAX_f);
  //color rect red if using Expansion Pak memory
  if (uVar3 + iVar8 + 0x4b400/*Boot section size?*/ < 0x400000) {
    R = 0;
    G = 0xff;
  }
  else {
    R = 0xff;
    G = 0;
  }
  pGVar9 = DebugDrawRect(pGVar9,x2,0x14,x2 + sVar20,0x16,R,G,0,0xff);
  dVar18 = (double)(uVar6 * 0x118);
  if ((int)(uVar6 * 0x118) < 0) {
    dVar18 = dVar18 + UINT_MAX_d;
  }
  if ((int)uVar1 < 0) {
    dVar21 = dVar21 + UINT_MAX_d;
  }
  fVar17 = (float)dVar18 / (float)dVar21 + 0.5f;
  if (fVar17 < INT_MAX_f) {
    sVar20 = (short)(int)fVar17;
  }
  else {
    sVar20 = (short)(int)(fVar17 - INT_MAX_f);
  }
  pGVar9 = DebugDrawRect(pGVar9,x2 + sVar19,0x14,x2 + sVar19 + sVar20,0x16,0,0,0xff,0xff);
  iVar7 = ((int)g - (int)pGVar10) * 0x118;
  dVar18 = (double)iVar7;
  if (iVar7 < 0) {
    dVar18 = dVar18 + UINT_MAX_d;
  }
  dVar16 = (double)gGfxManager.dListSize;
  if ((int)gGfxManager.dListSize < 0) {
    dVar16 = dVar16 + UINT_MAX_d;
  }
  fVar17 = (float)dVar18 / (float)dVar16 + 0.5f;
  if (fVar17 < INT_MAX_f) {
    sVar19 = (short)(int)fVar17;
  }
  else {
    sVar19 = (short)(int)(fVar17 - INT_MAX_f);
  }
  pGVar10 = DebugDrawRect(pGVar9,0x14,0x18,sVar19 + 0x14U,0x1a,0,0xff,0,0xff);
  pGVar10 = DebugDrawRect(pGVar10,sVar19 + 0x14U,0x18,300,0x1a,0,0,0,0xff);
  dVar18 = (double)(gGfxManager.unkTime0 * 0x118);
  if ((int)(gGfxManager.unkTime0 * 0x118) < 0) {
    dVar18 = dVar18 + UINT_MAX_d;
  }
  dVar21 = (double)ntscPalVar;
  dVar16 = dVar21;
  if (false) {
    dVar16 = dVar21 + UINT_MAX_d;
  }
  fVar17 = (float)dVar18 / (float)dVar16 + 0.5f;
  if (fVar17 < INT_MAX_f) {
    sVar19 = (short)(int)fVar17;
  }
  else {
    sVar19 = (short)(int)(fVar17 - INT_MAX_f);
  }
  pGVar10 = DebugDrawRect(pGVar10,0x14,0x1c,sVar19 + 0x14,0x1e,0xff,0xff,0,0xff);
  dVar18 = (double)(gGfxManager.taskTime * 0x118);
  if ((int)(gGfxManager.taskTime * 0x118) < 0) {
    dVar18 = dVar18 + UINT_MAX_d;
  }
  dVar16 = dVar21;
  if (false) {
    dVar16 = dVar21 + UINT_MAX_d;
  }
  fVar17 = (float)dVar18 / (float)dVar16 + 0.5f;
  if (fVar17 < INT_MAX_f) {
    sVar19 = (short)(int)fVar17;
  }
  else {
    sVar19 = (short)(int)(fVar17 - INT_MAX_f);
  }
  pGVar10 = DebugDrawRect(pGVar10,0x14,0x20,sVar19 + 0x14,0x22,0,0xff,0xff,0xff);
  dVar18 = (double)(gGfxManager.dListStartTime * 0x118);
  if ((int)(gGfxManager.dListStartTime * 0x118) < 0) {
    dVar18 = dVar18 + UINT_MAX_d;
  }
  if (false) {
    dVar21 = dVar21 + UINT_MAX_d;
  }
  sVar19 = (float)(gGfxManager.dListStartTime * 0x118) / (float)ntscPalVar + 0.5f;
  pGVar10 = DebugDrawRect(pGVar10,0x14,0x24,sVar19 + 20,0x26,0xff,0,0xff,0xff);
  for(u8 i=0,uVar15 = 20;i<6;uVar15 += 56,i++) {
    pGVar10 = DebugDrawRect(pGVar10,uVar15,28,uVar15 + 2,40,i * 51,~(i * 51),0,0xff);
  }
  OVar22 = osGetTime();
  gGfxManager.unkTime0 = udivdi3(CONCAT44((int)(OVar22 >> 0x20) << 6 | (uint)OVar22 >> 0x1a,(uint)OVar22 << 6),3000);
  return pGVar10;
}



