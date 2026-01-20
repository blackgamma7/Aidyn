#define FILENAME "./src/gfx.cpp"

#include "graphics.h"
#include "globals.h"
#include "memcheck.h"

gfxManager gGfxManager={0};

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
  gGfxManager.DepthBuffer = gMemCheckStruct.DepthBuffer;
  gGfxManager.FrameBuffers[0] = gMemCheckStruct.frameBuffers[0];
  gGfxManager.FrameBuffers[1] = gMemCheckStruct.frameBuffers[1];
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
  #if VER_NA11||EUVER
  {COPY(&gGfxManager.osvimodeBuffer,osViModeTable + OS_VI_PAL_LAN1);
    gfx_struct.osvimodeBuffer.fldRegs[0].vScale = 0x280270;
    gfx_struct.osvimodeBuffer.fldRegs[0].yScale = 0x346;
    COPY(&gfx_struct.osVimodeBuffer,&gfx_struct.osvimodeBuffer);
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
  gGfxManager.FramebufferSize[0] = gMemCheckStruct.frameBufferSize1;
  gGfxManager.FramebufferSize[1] = gMemCheckStruct.frameBufferSize0;
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
        if (((int)(u32)bVar1 >> (8 - k & 0x1f) & 1U) != 0) {
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
  #ifndef EUVER
  SetGfxMode(SCREEN_WIDTH,SCREEN_HEIGHT,0x10);
  video_settings();
  #else
  osViSetYScale(1.0f);
  #endif
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
      if (osTvType == OS_TV_NTSC) osViSetMode(osViModeTable + OS_VI_NTSC_LAN1);
      else if (osTvType == OS_TV_MPAL) osViSetMode(osViModeTable + OS_VI_MPAL_LAN1);
      else if (osTvType == OS_TV_PAL)
      #ifdef VER_NA11
        osViSetMode(&gGfxManager.osvimodeBuffer);
      #else
        osViSetMode(osViModeTable + OS_VI_PAL_LAN1);
      #endif
      }
    else {
      if (osTvType == OS_TV_NTSC) osViSetMode(osViModeTable + OS_VI_NTSC_LAN2);
      else if (osTvType == OS_TV_MPAL) osViSetMode(osViModeTable + OS_VI_MPAL_LAN2);
      else if (osTvType == OS_TV_PAL) osViSetMode(osViModeTable + OS_VI_PAL_LAN2);
    }
  }
  else osViSetMode(&gGfxManager.osvimodeCustom);
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
  gGfxManager.dListStartTime = TIME_USEC;
  gGfxManager.unkTime1 = TIME_USEC;
  gSPSegment(g++,0,0); //?
  if (gGfxManager.colordepth[1] == 16) {gDPSetColorImage(g++,G_IM_FMT_RGBA,G_IM_SIZ_16b,gGfxManager.Hres[1],gGfxManager.FrameBuffers[gGfxManager.bufferChoice]);}
  else {gDPSetColorImage(g++,G_IM_FMT_RGBA,G_IM_SIZ_32b,gGfxManager.Hres[1],gGfxManager.FrameBuffers[gGfxManager.bufferChoice]);}
  gDPSetDepthImage(g++,&gGfxManager.DepthBuffer);
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
  if (gGfxManager.colordepth[1] == 16) {gDPSetFillColor(gfx++,GPACK_RGBA5551(r,g,b,a));}
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
  u32 uVar5;
  u32 uVar6;
  u32 uVar7;
  u32 uVar8;

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

Gfx * Graphics::SetToFill(Gfx *gfx){
  gDPPipeSync(gfx++);
  gDPSetCycleType(gfx++,G_CYC_FILL);
  gDPSetRenderMode(gfx++,0,0);
  return gfx;
}

//draws colored Rectangle for debug stats
Gfx * Graphics::DebugDrawRect(Gfx *gfx,u16 x0,u16 x1,u16 y0,u16 y1,u8 r,u8 g,u8 b,u8 a){
  gDPPipeSync(gfx++);
  if (gGfxManager.colordepth[1] == 16) {gDPSetFillColor(gfx++,GPACK_RGBA5551(r,g,b,a));}
  else {DPRGBColor(gfx++,G_SETFILLCOLOR,r,g,b,a);}
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
  gDPSetColorImage(g++,G_IM_FMT_RGBA,G_IM_SIZ_16b,gGfxManager.Hres[1],gGfxManager.DepthBuffer);
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
  u32 uVar2;
  #ifndef EUVER
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
  #else //later versions used more ucode to draw overscan border
  gfx=borg8DlistInit(gfx,6,gGfxManager.Hres[1],gGfxManager.Vres[1]);
  gfx = DrawRectangle(gfx,0,0,18,SCREEN_HEIGHT,COLOR_BLACK);
  gfx = DrawRectangle(gfx,0,0,SCREEN_WIDTH,12,COLOR_BLACK);
  gfx = DrawRectangle(gfx,(SCREEN_WIDTH-18),0,SCREEN_WIDTH,SCREEN_HEIGHT,COLOR_BLACK);
  gfx = DrawRectangle(gfx,0,(SCREEN_HEIGHT-12),SCREEN_WIDTH,SCREEN_HEIGHT,COLOR_BLACK);
  #endif
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
OSScTask* Graphics::CreateTask(Gfx *glist,OSMesgQueue *param_2){
  OSScTask *pOVar5 =&gGfxManager.tasks[gGfxManager.bufferChoice];
  gGfxManager.taskMsgs[gGfxManager.bufferChoice].task = pOVar5;
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
  pOVar5->next = NULL;
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
  gGfxManager.taskTime = OS_CYCLES_TO_USEC(t->task->totalTime);
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
u16 * Graphics::GetDepthBuffer(void){return gGfxManager.DepthBuffer;}

u32 Graphics::FramebufferSize0(void){return gGfxManager.FramebufferSize[0];}
u32 Graphics::FramebufferSize1(void){return gGfxManager.FramebufferSize[1];}
u32 Graphics::GetHRes(void){return gGfxManager.Hres[1];}
u32 Graphics::GetVRes(void){return gGfxManager.Vres[1];}
u32 Graphics::GetColorDepth(void){return gGfxManager.colordepth[1];}

//copies the FB for pause BG and savegame screenshot

void Graphics::getGfxLastFrame
               (void *pDest,u16 H,u16 V,u8 depth,u16 param_5,u16 param_6,u16 Hres,u16 Vres) {
  u16 uVar1;
  void *pvVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  float fVar6;
  byte bVar7;
  float fVar8;
  float fVar9;
  u16 uVar10;
  byte bVar11;
  uint uVar12;
  u8 uVar13;
  byte i;
  byte *pbVar14;
  uint uVar16;
  byte bVar17;
  uint k;
  byte bVar19;
  uint *dest32;
  u16 *dest16;
  u8 *dest8;
  uint uVar23;
  uint j;
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  
  bVar11 = gGfxManager.colordepth[1];
  uVar10 = gGfxManager.Hres[1];
  uVar12 = 0;
  if ((pDest == NULL) || ((((depth != 0x20 && (depth != 0x10)) && (depth != 8)) && (depth != 4)))) {
    CRASH("gfx.cpp, GetGfxLastFrame()",
        "pDest_ == NULL || depth_ != 32 || depth_ != 16 || depth_ != 8 || depth_ != 4");
  }
  pvVar2 = gGfxManager.FrameBuffers[gGfxManager.bufferChoice];
  if ((depth == 8) || (depth == 4)) {
    bVar7 = 2;
    uVar12 = 0xff;
  }
  else bVar7 = 1;
  uVar23 = 0;
  bVar19 = 0;
  if (bVar7) {
    do {
      i = bVar19 + 1;
      if (V != 0) {
        fVar28 = (float)param_6;
        uVar16 = 0;
        do {
          fVar9 = 31.0f;
          fVar8 = 255.0f;
          fVar27 = (float)param_5;
          k = 0;
          fVar26 = (float)Hres - fVar27;
          j = uVar16 + 1;
          if (H != 0) {
            iVar4 = uVar16 * H;
            dest8 = (u8 *)(iVar4 + (int)pDest);
            iVar5 = uVar16 * (H >> 1);
            dest16 = (u16 *)(iVar4 * 2 + (int)pDest);
            dest32 = (uint *)(iVar4 * 4 + (int)pDest);
            uVar16 = uVar12;
            do {
              uVar12 = uVar16;
              if (bVar11 == 0x20) {
                uVar3 = *(uint *)(((int)fVar28 * (uint)uVar10 + (int)fVar27) * 4 + (int)pvVar2);
                if (depth == 0x20) {
                  *dest32 = uVar3 | 0xff;
                }
                else if (depth == 0x10) {
                  *dest16 = (u16)((uVar3 >> 0x1b) << 0xb) | (u16)(uVar3 >> 0xd) & 0x7c0 |
                             (u16)(uVar3 >> 10) & 0x3e | 1;
                }
                else if (depth == 8) {
                  uVar12 = ((uVar3 >> 0x18) + (uVar3 >> 0x10) + (uVar3 >> 8) & 0xff) / 3;
                  if (bVar19 == 0) {
LAB_80009c10:
                    if (uVar23 < uVar12) uVar23 = uVar12;
                    if (uVar16 <= uVar12) uVar12 = uVar16;
                  }
                  else {
                    *dest8 = (u8)((float)(int)(uVar12 - uVar16) / (float)(int)(uVar23 - uVar16)) * fVar8;
                    uVar12 = uVar16;
                  }
                }
                else {
                  uVar12 = (u8)((uVar3 >> 0x18) + (uVar3 >> 0x10) + (uVar3 >> 8)) / 3;
                  if (bVar19 == 0) goto LAB_80009c10;
                  uVar12 = (u8)((uVar12 - uVar16) / (uVar23 - uVar16) * fVar8) >> 4;
                  bVar17 = (byte)uVar12;
                  if ((k & 1) != 0) goto LAB_80009c94;
LAB_80009cb4:
                  *(char *)((int)pDest + iVar5 + (k >> 1)) = (char)(uVar12 << 4);
                  uVar12 = uVar16;
                }
              }
              else {
                uVar1 = *(u16 *)(((int)fVar28 * (uint)uVar10 + (int)fVar27) * 2 + (int)pvVar2);
                if (depth == 0x20) {
                  *dest32 = (uint)(uVar1 >> 0xb) << 0x1b | (uVar1 >> 6 & 0x1f) << 0x13 |
                             (uVar1 & 0x3e) << 10 | 0xff;
                }
                else if (depth == 0x10) {
                  *dest16 = uVar1 | 1;
                }
                else if (depth == 8) {
                  uVar12 = ((uint)(uVar1 >> 0xb) + (uVar1 >> 6 & 0x1f) + (uVar1 >> 1 & 0x1f)) / 3;
                  if (bVar19 == 0) goto LAB_80009c10;
                  *dest8 = ((uVar12 - uVar16) / (uVar23 - uVar16)) * fVar9;
                  uVar12 = uVar16;
                }
                else {
                  uVar12 = ((uint)(uVar1 >> 0xb) + (uVar1 >> 6 & 0x1f) + (uVar1 >> 1 & 0x1f)) / 3;
                  if (bVar19 == 0) goto LAB_80009c10;
                  uVar12 = (u8)(((uVar12 - uVar16) / (uVar23 - uVar16)) * fVar9) >> 1;
                  bVar17 = (byte)uVar12;
                  if ((k & 1) == 0) goto LAB_80009cb4;
LAB_80009c94:
                  pbVar14 = (byte *)((int)pDest + iVar5 + (k >> 1));
                  *pbVar14 = bVar17 | *pbVar14;
                  uVar12 = uVar16;
                }
              }
              dest8 = dest8 + 1;
              dest16 = dest16 + 1;
              dest32 = dest32 + 1;
              k = k + 1;
              fVar27 = fVar27 + fVar26 / (float)H;
              uVar16 = uVar12;
            } while (k < H);
          }
          fVar28 = fVar28 + ((float)Vres - (float)param_6) / (float)V;
          uVar16 = j;
        } while (j < V);
      }
      bVar19 = i;
    } while (i < bVar7);
  }
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
  u32 uVar11;
  u32 uVar12;
  u32 uVar13;
  u16 uVar15;
  u32 ntscPalVar; //5000000 / refersh rate
  double dVar16;
  float fVar17;
  double dVar18;
  s16 sVar19;
  s16 sVar20;
  u64 uVar23;
  u8 R;
  u8 G;
  
  uVar5 = gMemCheckStruct.mem_free_allocated;
  uVar4 = gMemCheckStruct.frameBufferSize0;
  uVar2 = gMemCheckStruct.ramVal0;
  uVar1 = gMemCheckStruct.RamSize;
  iVar7 = get_memUsed();
  uVar6 = gMemCheckStruct.frameBufferSize1;
  uVar3 = gMemCheckStruct.ramVal0;
  pGVar10 = gGfxManager.GfxLists[gGfxManager.bufferChoice];
  iVar8 = get_memUsed();
  gGfxManager.unkTime0 = (int)TIME_USEC - gGfxManager.unkTime0;
  gGfxManager.dListStartTime = (int)TIME_USEC - gGfxManager.dListStartTime;
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
  pGVar9 = Graphics::SetToFill(g);
  uVar15 = ((float)(gMemCheckStruct.ramVal0 * 280) / (float)gMemCheckStruct.RamSize + 0.5f) + 20;
  pGVar9 = DebugDrawRect(pGVar9,0x14,0x14,uVar15,0x16,0,0,0xff,0xff);
  x2 = uVar15 + (s16)((double)(uVar4 * 280)/uVar1);
  pGVar9 = DebugDrawRect(pGVar9,uVar15,0x14,x2,0x16,0,0,0xff,0xff);
  sVar19 = (double)(uVar5 * 280)/uVar1;
  pGVar9 = DebugDrawRect(pGVar9,x2,0x14,x2 + sVar19,0x16,COLOR_BLACK);
  sVar20 = ((float)(iVar7 * 280) / (float)uVar1);
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
  sVar20=((double)(uVar6 * 280)/(double)uVar1);
  pGVar9 = DebugDrawRect(pGVar9,x2 + sVar19,0x14,x2 + sVar19 + sVar20,0x16,0,0,0xff,0xff);
  sVar19=(float)(((uintptr_t)g - (uintptr_t)pGVar10) * 280)/(float)gGfxManager.dListSize;
  pGVar10 = DebugDrawRect(pGVar9,0x14,0x18,sVar19 + 0x14U,0x1a,0,0xff,0,0xff);
  pGVar10 = DebugDrawRect(pGVar10,sVar19 + 0x14U,0x18,300,0x1a,COLOR_BLACK);
  sVar19 = (float)(gGfxManager.unkTime0 * 280) / (float)ntscPalVar + 0.5f;
  pGVar10 = DebugDrawRect(pGVar10,0x14,0x1c,sVar19 + 0x14,0x1e,0xff,0xff,0,0xff);
  sVar19 = (float)(gGfxManager.taskTime * 280) / (float)ntscPalVar + 0.5f;
  pGVar10 = DebugDrawRect(pGVar10,0x14,0x20,sVar19 + 0x14,0x22,0,0xff,0xff,0xff);
  sVar19 = (float)(gGfxManager.dListStartTime * 280) / (float)ntscPalVar + 0.5f;
  pGVar10 = DebugDrawRect(pGVar10,0x14,0x24,sVar19 + 20,0x26,0xff,0,0xff,0xff);
  for(u8 i=0,uVar15 = 20;i<6;uVar15 += 56,i++) {
    pGVar10 = DebugDrawRect(pGVar10,uVar15,28,uVar15 + 2,40,i * 51,~(i * 51),0,0xff);
  }
  gGfxManager.unkTime0 = TIME_USEC;
  return pGVar10;
}



