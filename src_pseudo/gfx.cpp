#define FILENAME "./src/gfx.cpp"

#include "graphics.h"
#include "stringN64.h"
#include "heapN64.h"
#include "crash.h"

char* res_mode_string[3]={"Normal Resolution","High Resolution","32 Bit Color"};
ResolutionSettings res_colormode[3]={{320,240,0,16},{512,240,0,16},{320,240,0,32}};
gfxManager gGfxManager;


void Graphics::initGfx(OSSched *sched){
  byte bVar1;
  u8 uVar2;
  int iVar3;
  OSViMode *src;
  int iVar4;
  int iVar5;
  byte bVar7;
  uint uVar6;
  
  u32 dListSize = 0x3200*sizeof(Gfx);
  if (0x400000 < gMemCheckStruct.RamSize) dListSize = 0x6400*sizeof(Gfx);
  CLEAR(&gGfxManager);
  gGfxManager.DepthBuffer = (s16 *)gMemCheckStruct.DepthBuffer;
  gGfxManager.FrameBuffers[0] = gMemCheckStruct.FreameBuffers[0];
  gGfxManager.FrameBuffers[1] = gMemCheckStruct.FreameBuffers[1];
  gGfxManager.sched = sched;
  gGfxManager.GfxLists[0] = (Gfx *)HALLOC(dListSize,0xdc);
  gGfxManager.GfxLists[1] = (Gfx *)HALLOC(dListSize,0xdd);
  gGfxManager.outputBuff = HALLOC(0x400,0xde);
  gGfxManager.ouputbuffSize = HALLOC(0xc00,0xdf);
  gGfxManager.yieldData = HALLOC(0x1000,0xe0);
  gGfxManager.textfont = (u8 (*) [32])HALLOC(0xbc0,0xe4);
  gGfxManager.unk0x2c = (byte (*) [64])HALLOC(0x40,0xe5);
  if (osTvType == OS_TV_NTSC) src = osViModeTable + OS_VI_NTSC_LAN1;
  else if (osTvType == OS_TV_MPAL) src = osViModeTable + OS_VI_MPAL_LAN1;
  else if (osTvType == OS_TV_PAL) src = osViModeTable + OS_VI_PAL_LAN1;
  else CRASH("gfx.cpp, InitGfx()","TV Type not supported");
  COPY(&gGfxManager.osvimodeCustom,src);
  iVar5 = 0;
  uVar6 = 0;
  gGfxManager.osvimodeCustom.comRegs.width = 0x200;
  gGfxManager.osvimodeCustom.fldRegs[0].origin = 0x400;
  gGfxManager.osvimodeCustom.comRegs.xScale = 0x333;
  gGfxManager.taskMsgs[0].unkShort = 2;
  gGfxManager.taskMsgs[1].unkShort = 2;
  gGfxManager.ram_size = gMemCheckStruct.RamSize;
  gGfxManager.FramebufferSize[0] = gMemCheckStruct.MaxResolution1;
  gGfxManager.FramebufferSize[1] = gMemCheckStruct.MaxResolution0;
  iVar3 = 0;
  gGfxManager.dListSize = dListSize;
  do {
    bVar7 = 0;
    do {
      dListSize = 0;
      bVar7 += 1;
      bVar1 = gCrashFont[0][iVar3];
      iVar4 = iVar5;
      while( true ) {
        iVar5 = 0;
        if (((int)(uint)bVar1 >> (8 - dListSize & 0x1f) & 1U) != 0) {
          iVar5 = 0xf;
        }
        if ((dListSize & 1) == 0) {
          uVar2 = (u8)(iVar5 << 4);
          iVar5 = iVar4;
        }
        else {
          uVar2 = (byte)iVar5 | (*gGfxManager.textfont)[iVar4];
          iVar5 = iVar4 + 1;
        }
        (*gGfxManager.textfont)[iVar4] = uVar2;
        dListSize = dListSize + 1 & 0xff;
        if (7 < dListSize) break;
        bVar1 = gCrashFont[0][iVar3];
        iVar4 = iVar5;
      }
      iVar3 = iVar3 + 1;
    } while (bVar7 < 8);
    uVar6 = uVar6 + 1 & 0xff;
    iVar3 = uVar6 << 3;
  } while (uVar6 < 0x5e);
  memset(gGfxManager.unk0x2c,0xff,0x40);
  SetGfxMode(res_colormode[0].Hres,res_colormode[0].Vres,res_colormode[0].colorDepth);
  gGlobals.ResolutionSelect = 0;
  video_settings();
}

void Graphics::initGfx_2(void){
  osSpTaskYield();
  SetGfxMode(320,240,0x10);
  video_settings();
  osViBlack(true);
  gGfxManager.taskTicks = -1;}


void Graphics::SetGfxMode(u16 Hres,u16 Vres,u8 color){
  if (gGfxManager.ram_size <= 0x400000) { //huh, doesn't check the gExpPakFlag.
    if (((Hres != 320) || (Vres != 0xf0)) || (color != 16)) {
      CRASH("gfx.cpp, SetGfxMode()","Non expansion pak resolution not supported!");}
  }
  else {
    if ((((Hres != 320) || (Vres != 0xf0)) || ((color != 16 && (color != 32)))) &&
       (((Hres != 0x200 || (Vres != 0xf0)) || (color != 16)))) {
      CRASH("gfx.cpp, SetGfxMode()","Expansion pak resolution not supported!");}
  }
  gGfxManager.Hres[0] = Hres;
  gGfxManager.Vres[0] = Vres;
  gGfxManager.colordepth[0] = color;}

void Graphics::video_settings(void){
  memset(gGfxManager.FrameBuffers[0],0,gGfxManager.FramebufferSize[0] << 1);
  osViSwapBuffer(gGfxManager.FrameBuffers[0]);
  if (gGfxManager.Hres[0] == 320) {
    if (gGfxManager.colordepth[0] == 0x10) {
      if (osTvType == OS_TV_NTSC) osViSetMode(osViModeTable + 2);
      else if (osTvType == OS_TV_MPAL) osViSetMode(osViModeTable + 0x1e);
      else if (osTvType == OS_TV_PAL) osViSetMode(osViModeTable + 0x10);
      }
    else {
      if (osTvType == OS_TV_NTSC) osViSetMode(osViModeTable + 6);
      else if (osTvType == OS_TV_MPAL) osViSetMode(osViModeTable + 0x22);
      else if (osTvType == OS_TV_PAL) osViSetMode(osViModeTable + 0x14);
    }
  }
  else {osViSetMode(&gGfxManager.osvimodeCustom);}
  osViSetSpecialFeatures(OS_VI_GAMMA_OFF|OS_VI_DIVOT_OFF|OS_VI_DITHER_FILTER_ON);
  gGfxManager.MoreResSettings[0][0] = gGfxManager.Hres[0] << 1;
  gGfxManager.MoreResSettings[0][1] = gGfxManager.Vres[0] << 1;
  gGfxManager.MoreResSettings[0][2] = 0x1ff;
  gGfxManager.MoreResSettings[0][3] = 0;
  gGfxManager.MoreResSettings[1][0] = gGfxManager.Hres[0] << 1;
  gGfxManager.MoreResSettings[1][1] = gGfxManager.Vres[0] << 1;
  gGfxManager.MoreResSettings[1][2] = 0x1ff;
  gGfxManager.MoreResSettings[1][3] = 0;
  gGfxManager.Hres[1] = gGfxManager.Hres[0];
  gGfxManager.Vres[1] = gGfxManager.Vres[0];
  gGfxManager.colordepth[1] = gGfxManager.colordepth[0];}

//looks like ucode from here on out. needs susing out.
Gfx * Graphics::StartGfxList(void){
  uint uVar1;
  OSTime OVar2;
  u64 uVar3;
  Gfx *puVar1;
  
  puVar1 = gGfxManager.GfxLists[gGfxManager.bufferChoice];
  OVar2 = osGetTime();
  gGfxManager.dListStartTime = (uint)udivdi3(CONCAT44((int)(OVar2 >> 0x20) << 6 | (uint)OVar2 >> 0x1a,(uint)OVar2 << 6),3000);;
  OVar2 = osGetTime();
  gGfxManager.unkTime1 = (u32)udivdi3(CONCAT44((int)(OVar2 >> 0x20) << 6 | (uint)OVar2 >> 0x1a,(uint)OVar2 << 6),3000);
  (puVar1->words).w0 = 0xdb060000;
  (puVar1->words).w1 = 0;
                    // G_SETCIMG
  if (gGfxManager.colordepth[1] == 16) uVar1 = 0xff100000;
  else uVar1 = 0xff180000;
  puVar1[1].words.w0 = gGfxManager.Hres[1] - 1 & 0xfff | uVar1;
  *(void **)((int)puVar1 + 0xc) = gGfxManager.FrameBuffers[gGfxManager.bufferChoice];
  puVar1[2].words.w0 = 0xfe000000;
  *(s16 **)((int)puVar1 + 0x14) = gGfxManager.DepthBuffer;
  puVar1[3].words.w0 = 0xed000000;
  *(uint *)((int)puVar1 + 0x1c) =
       ((int)((float)(uint)gGfxManager.Hres[1] * 4.0f) & 0xfffU) << 0xc |
       (int)((float)(uint)gGfxManager.Vres[1] * 4.0f) & 0xfffU;
  puVar1[4].words.w0 = 0xdb040004;
  *(undefined4 *)((int)puVar1 + 0x24) = 3;
  *(undefined4 *)((int)puVar1 + 0x2c) = 3;
  puVar1[5].words.w0 = 0xdb04000c;
  puVar1[6].words.w0 = 0xdb040014;
  *(undefined4 *)((int)puVar1 + 0x34) = 0xfffd;
  puVar1[7].words.w0 = 0xdb04001c;
  *(undefined4 *)((int)puVar1 + 0x3c) = 0xfffd;
  puVar1[8].words.w0 = 0xdc080008;
  *(undefined4 *)((int)puVar1 + 0x44) = 0x800e6858;
  return puVar1 + 9;
}




Gfx * some_video_setting_init(Gfx *gfx,u16 param_2,u16 param_3,u16 param_4,ushort param_5,u8 r,u8 g,u8 b,u8 a){
  float fVar1;
  float fVar2;
  ushort uVar3;
  ushort uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  
  uVar4 = gGfxManager.Vres[1];
  uVar3 = gGfxManager.Hres[1];
  (gfx->words).w0 = 0xe7000000;
  fVar2 = 240.0f;
  fVar1 = 320.0f;
  (gfx->words).w1 = 0;
  gfx[1].words.w0 = 0xe3000a01;
  *(undefined4 *)((int)gfx + 0xc) = 0x300000;
  gfx[2].words.w0 = 0xe200001c;
  *(undefined4 *)((int)gfx + 0x14) = 0;
  uVar8 = (uint)(short)(int)((float)(uint)param_2 * ((float)(uint)uVar3 / fVar1));
  uVar7 = (uint)(short)(int)((float)(uint)param_3 * ((float)(uint)uVar4 / fVar2));
  if (gGfxManager.colordepth[1] == 16) gDPSetFillColor(gfx[3],GPACK_RGBA5551(r,g,b,a));
  else DPRGBColor(gfx[3],G_SETFILLCOLOR,r,g,b,a);
  uVar5 = (int)(short)(int)((float)(uint)param_4 * ((float)(uint)uVar3 / fVar1)) - 1;
  if ((int)uVar5 < 0) uVar5 = 0;
  uVar6 = (int)(short)(int)((float)(uint)param_5 * ((float)(uint)uVar4 / fVar2)) - 1;
  if ((int)uVar6 < 0) uVar6 = 0;
  gfx[4].words.w0 = (uVar5 & 0x3ff) << 0xe | (uVar6 & 0x3ff) << 2 | 0xf6000000;
  if ((int)uVar8 < 1) uVar8 = 0;
  else uVar8 = (uVar8 & 0x3ff) << 0xe;
  if (0 < (int)uVar7) uVar8 |= (uVar7 & 0x3ff) << 2;
  *(uint *)((int)gfx + 0x24) = uVar8;
  return gfx + 5;
}

Gfx * Ofunc_rspcode(Gfx *gfx,u16 param_2,u16 param_3,u16 param_4,ushort param_5,Color32 param_6){
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;

  gDPPipeSync(gfx++);
  gfx[1].words.w0 = 0xe3000a01;
  gfx[1].words.w1 = 0x300000;
  gfx[2].words.w0 = 0xe200001c;
  gfx[2].words.w1 = 0;
  gDPSetColor(&gfx[3],G_SETFILLCOLOR,param_6.W);
  uVar6 = param_4 * (gGfxManager.Hres[1] / 320.0f) - 1;
  uVar7 = param_2 * (gGfxManager.Hres[1] / 320.0f);
  uVar8 = param_3 * (gGfxManager.Vres[1] / 240.0f);
  uVar5 = param_5 * (gGfxManager.Vres[1] / 240.0f)- 1;
  gDPScisFillRectangle(&gfx[4],uVar6,uVar5,uVar7,uVar8);
  return gfx + 5;
}

Gfx * GsSetOtherMode_SysMon(Gfx *gfx){
  gDPPipeSync(&gfx[0]);
  gfx[1].words.w0 = 0xe3000a01;
  gfx[1].words.w1 = 0x300000;
  gfx[2].words.w0 = 0xe200001c;
  gfx[2].words.w1 = 0;
  return gfx + 3;
}

Gfx * debug::gsDisplaySystemMonitor_Fillrect(Gfx *gfx,u16 x0,u16 x1,u16 y0,u16 y1,u8 r,u8 g,u8 b,u8 a){
  int uVar1;
  int uVar2;
  int uVar4;
  int uVar5;
  ushort H;
  ushort V;
  
  V = gGfxManager.Vres[1];
  H = gGfxManager.hres[1];
  gDPPipeSync(gfx++);
  uVar5 = x0 * (H / 320.0f);
  uVar4 = x1 * (V / 240.0f);
  if (gGfxManager.colordepth[1] == 16) gDPSetFillColor(gfx[1],GPACK_RGBA5551(r,g,b,a));
  else DPRGBColor(gfx[1],G_SETFILLCOLOR,r,g,b,a);
  uVar1 = y0 * (H / 320.0f) - 1;
  uVar2 = y1 * (V / 240.0f) - 1;
  gDPScisFillRectangle(gfx[2],uVar5,uVar4,uVar1,uVar2);
  return gfx + 3;
}



Gfx* Graphics::func_80008f48(Gfx*gfx){
  gDPPipeSync(gfx++);
  gfx[1].words.w0 = 0xe3000a01;
  gfx[1].words.w1 = 0;
  gfx[2].words.w0 = 0xe200001c;
  gfx[2].words.w1 = 0x552078;
  return &gfx[3];
}


Gfx * Graphics::StartDisplay(Gfx *g,u16 x,u16 y,u16 h,u16 V){
  float fVar1;
  ushort uVar2;
  ushort uVar3;
  uint uVar7;
  int uVar4;
  int uVar5;
  int uVar6;
  int uVar8;
  float fVar8;
  
  uVar3 = gGfxManager.Vres[1];
  uVar2 = gGfxManager.hres[1];
  gDPPipeSync(g++);
  g[1].words.w0 = 0xe3000a01;
  *(undefined4 *)((int)g + 0xc) = 0x300000;
  g[2].words.w0 = 0xe200001c;
  *(undefined4 *)((int)g + 0x14) = 0;
  fVar1 = 240.0f;
  fVar8 = (float)(uint)uVar2 / 320.0f;
  g[3].words.w0 = gGfxManager.hres[1] - 1 & 0xfff | 0xff100000;
  *(s16 **)((int)g + 0x1c) = gGfxManager.DepthBuffer;
  g[4].words.w0 = 0xf7000000;
  *(undefined4 *)((int)g + 0x24) = 0xfffcfffc;
  uVar5 = (short)(int)((float)(uint)h * fVar8) + -1;
  uVar6 = (int)(short)(int)((float)(uint)x * fVar8);
  uVar8 = (int)(short)(int)((float)(uint)y * ((float)(uint)uVar3 / fVar1));
  if (uVar5 < 0) {
    uVar5 = 0;
  }
  uVar4 = (short)(int)((float)(uint)V * ((float)(uint)uVar3 / fVar1)) + -1;
  if (uVar4 < 0) {
    uVar4 = 0;
  }
  g[5].words.w0 = (uVar5 & 0x3ffU) << 0xe | (uVar4 & 0x3ffU) << 2 | 0xf6000000;
  if (uVar6 < 1) {
    uVar7 = 0;
  }
  else {
    uVar7 = (uVar6 & 0x3ffU) << 0xe;
  }
  if (0 < uVar8) {
    uVar7 |= (uVar8 & 0x3ffU) << 2;
  }
  *(uint *)((int)g + 0x2c) = uVar7;
  g[6].words.w0 = 0xe7000000;
  *(undefined4 *)((int)g + 0x34) = 0;
  if (gGfxManager.colordepth[1] == 0x10){
    gDPSetColorImage(&g[7],G_IM_FMT_RGBA,G_IM_SIZ_16b,gGfxManager.Hres[1],gGfxManager.FrameBuffers[gGfxManager.bufferChoice]);
  }
  else{
    gDPSetColorImage(&g[7],G_IM_FMT_RGBA,G_IM_SIZ_32b,gGfxManager.Hres[1],gGfxManager.FrameBuffers[gGfxManager.bufferChoice]);
  }
  return g + 8;
}



Gfx * Graphics::EndList(Gfx *gfx){
  ushort uVar1;
  uint uVar2;
  
  gDPPipeSync(gfx++);
  gfx[1].words.w0 = 0xe3000a01;
  *(undefined4 *)((int)gfx + 0xc) = 0x300000;
  gfx[2].words.w0 = 0xe200001c;
  *(undefined4 *)((int)gfx + 0x14) = 0;
  gfx[3].words.w0 = 0xf7000000;
  *(undefined4 *)((int)gfx + 0x1c) = 0;
  uVar1 = gGfxManager.Vres[1];
  if (gGfxManager.hres[1] == 0x140) {
    *(undefined4 *)((int)gfx + 0x24) = 0;
    gfx[4].words.w0 = (uVar1 - 1 & 0x3ff) << 2 | 0xf603c000;
    uVar1 = gGfxManager.hres[1];
    *(undefined4 *)((int)gfx + 0x2c) = 0;
    gfx[5].words.w0 = (uVar1 - 1 & 0x3ff) << 0xe | 0xf600002c;
    gfx[6].words.w0 =
         (gGfxManager.hres[1] - 1 & 0x3ff) << 0xe |
         (gGfxManager.Vres[1] - 1 & 0x3ff) << 2 | 0xf6000000;
    uVar2 = gGfxManager.hres[1] - 0x10;
  }
  else {
    *(undefined4 *)((int)gfx + 0x24) = 0;
    gfx[4].words.w0 = (uVar1 - 1 & 0x3ff) << 2 | 0xf604c000;
    uVar1 = gGfxManager.hres[1];
    *(undefined4 *)((int)gfx + 0x2c) = 0;
    gfx[5].words.w0 = (uVar1 - 1 & 0x3ff) << 0xe | 0xf600002c;
    gfx[6].words.w0 =
         (gGfxManager.hres[1] - 1 & 0x3ff) << 0xe |
         (gGfxManager.Vres[1] - 1 & 0x3ff) << 2 | 0xf6000000;
    uVar2 = gGfxManager.hres[1] - 0x14;
  }
  *(uint *)((int)gfx + 0x34) = (uVar2 & 0x3ff) << 0xe;
  gfx[7].words.w0 =
       (gGfxManager.hres[1] - 1 & 0x3ff) << 0xe |
       (gGfxManager.Vres[1] - 1 & 0x3ff) << 2 | 0xf6000000;
  *(uint *)((int)gfx + 0x3c) = (gGfxManager.Vres[1] - 0xc & 0x3ff) << 2;
  gDPFullSync(&gfx[8]);
  gSPEndDisplayList(&gfx[9]);
  gGfxManager.unk0x19c = 0;
  osWritebackDCacheAll();
  return gfx + 10;
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

GtaskMsg * Graphics::CreateTask(Gfx *glist,OSMesgQueue *param_2)
//ghidra did NOT like this function, for some reason.
{
  void *pvVar1;
  void *puVar2;
  s32 iVar3;
  s32 iVar4;
  OSScTask *pOVar5;
  
  iVar3 = (u32)gGfxManager.bufferChoice * 0xc + (u32)gGfxManager.bufferChoice;
  iVar4 = iVar3 * 8;
  pOVar5 =gGfxManager.tasks[iVar3].next;
  *(OSScTask **)(gGfxManager.unk0x15a + (u32)gGfxManager.bufferChoice * 8 + -6) = pOVar5;
  gGfxManager.tasks[iVar4].list.t.type = 1;
  gGfxManager.tasks[iVar4].list.t.flags = 0;
  gGfxManager.tasks[iVar4].list.t.data_ptr=gGfxManager.GfxLists[gGfxManager.bufferChoice];
  pvVar1 = gGfxManager.GfxLists[gGfxManager.bufferChoice];
  gGfxManager.tasks[iVar4].list.t.ucode_boot = rspbootTextStart;
  gGfxManager.tasks[iVar4].list.t.ucode_boot_size = 0xd0;
  gGfxManager.tasks[iVar4].list.t.ucode = gspF3DEX2_fifoTextStart;
  gGfxManager.tasks[iVar4].list.t.ucode_size = 0x1000;
  gGfxManager.tasks[iVar4].list.t.ucode_data = gspF3DEX2_fifoDataStart;
  gGfxManager.tasks[iVar4].list.t.ucode_data_size = 0x800;
  gGfxManager.tasks[iVar4].list.t.data_size = glist - (s32)gGfxManager.GfxLists[gGfxManager.bufferChoice];
  puVar2 = gGfxManager.outputBuff;
  gGfxManager.tasks[iVar3].list.t.dram_stack_size = 0x400;
  gGfxManager.tasks[iVar3].list.t.dram_stack = puVar2;
  puVar2 = gGfxManager.yieldData;
  pOVar5->next = NULL;
  gGfxManager.tasks[iVar3].state = 0;
  gGfxManager.tasks[iVar3].msgQ = param_2;
  gGfxManager.tasks[iVar3].list.t.output_buff = puVar2;
  puVar2 = gGfxManager.yieldData;
  gGfxManager.tasks[iVar3].flags = OS_SC_NEEDS_RDP|OS_SC_NEEDS_RSP|OS_SC_LAST_TASK|OS_SC_SWAPBUFFER;
  gGfxManager.tasks[iVar3].list.t.output_buff_size = puVar2 + 0x1000;
  puVar2 = gGfxManager.ouputbuffSize;
  gGfxManager.tasks[iVar3].list + iVar4 + 0x3c) = 0xc00;
  gGfxManager.tasks[iVar3].list.t.yield_data_ptr = puVar2;
  gGfxManager.tasks[iVar3].msg = &gGfxManager.taskMsgs[gGfxManager.bufferChoice];
  gGfxManager.tasks[iVar3].framebuffer =gGfxManager.FrameBuffers[gGfxManager.bufferChoice];
  gGfxManager.tasks[iVar3].startTime = 0;
  gGfxManager.tasks[iVar3].totalTime = 0;
  gGfxManager.bufferChoice^= 1;
  gGfxManager.taskTicks++;
  return pOVar5;
}

void Graphics::getTaskTime(GtaskMsg *t){
  gGfxManager.taskTime = udivdi3(CONCAT44(*(int *)&t->task->totalTime << 6 | *(uint *)((int)&t->task->totalTime + 4) >> 0x1a,*(uint *)((int)&t->task->totalTime + 4) << 6),3000);
  gGfxManager.taskTicks--;
}

u8 Graphics::GetBufferChoice(void){return gGfxManager.bufferChoice;}

void * Graphics::pickBuffer(void *param_1,void *param_2){
  if (gGfxManager.bufferChoice == 0) {param_2 = param_1;}
  return param_2;}

void * Graphics::pickOtherBuffer(void *param_1,void *param_2){
  if (gGfxManager.bufferChoice == 0) {param_1 = param_2;}
  return param_1;}

void * Graphics::GetFrameBuffer(u8 param_1){return gGfxManager.FrameBuffers[param_1];}
s16 * Graphics::GetDepthBuffer(void){return gGfxManager.DepthBuffer;}

u32 Graphics::FramebufferSize0(void){return gGfxManager.FramebufferSize[0];}
u32 Graphics::FramebufferSize1(void){return gGfxManager.FramebufferSize[1];}
u32 Graphics::get_hres(void){return gGfxManager.Hres[1];}
u32 Graphics::get_vres(void){return gGfxManager.Vres[1];}
u32 Graphics::get_colorDepth(void){return gGfxManager.colordepth[1];}

//copies the FB for BG and savegame screenshot
void getGfxLastFrame(undefined *pDest,u16 H,u16 V,u8 depth,u16 param_5,u16 param_6,u16 Hres,u16 Vres){
  u16 uVar1;
  void *pvVar2;
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
  u32 *puVar20;
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
  H_ = (longlong)(s16)H;
  V_ = (longlong)(s16)V;
  if ((pDest == NULL) ||
     ((((depth != 32 && (depth != 16)) && (depth != 8)) && (depth != 4)))) {
    CRASH("gfx.cpp, GetGfxLastFrame()","pDest_ == NULL || depth_ != 32 || depth_ != 16 || depth_ != 8 || depth_ != 4");}
  pvVar2 = gGfxManager.FrameBuffers[gGfxManager.bufferChoice];
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
            puVar20 = (u32 *)(pDest + iVar4 * 4);
            uVar23 = uVar11;
            do {
              uVar18 = (u32)uVar17;
              uVar11 = uVar23;
              if (bVar10 == 0x20) {
                fVar26 = fVar29;
                if (INT_MAX_f <= fVar29) {fVar26 = fVar29 - INT_MAX_f;}
                fVar5 = fVar28;
                if (INT_MAX_f <= fVar28) {fVar5 = fVar28 - INT_MAX_f;}
                uVar3 = *(u32 *)(((s32)fVar26 * (u32)uVar9 + (s32)fVar5) * 4 + (s32)pvVar2);
                if (depth == 0x20) {*puVar20 = uVar3 | 0xff;}
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
                uVar1 = *(u16 *)(((s32)fVar26 * (u32)uVar9 + (s32)fVar5) * 2 + (s32)pvVar2);
                if (depth == 0x20) {
                  *puVar20 = (u32)(uVar1 >> 0xb) << 0x1b | (uVar1 >> 6 & 0x1f) << 0x13 |
                             (uVar1 & 0x3e) << 10 | 0xff;
                }
                else {
                  if (depth == 0x10) {*puVar21 = uVar1 | 1;}
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
void Graphics::passto_GetGfxLastFrame(undefined *param_1,u16 param_2,u16 param_3,u8 param_4){
  getGfxLastFrame(param_1,param_2,param_3,param_4,0,0,gGfxManager.Hres[1],gGfxManager.Vres[1]);}


Gfx * Ofunc_80009d7c(Gfx *gfx,u16 param_2,u16 param_3,u16 param_4,ushort param_5,byte r,byte g,
                    byte b,byte a){
  uint uVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  float fVar10;
  float fVar11;
  
  fVar10 = 320.0f;
  uVar1 = (uint)gGfxManager.hres[1];
  uVar9 = (uint)gGfxManager.Vres[1];
  gDPPipeSync(gfx++);
  gfx[1].words.w0 = 0xe3000a01;
  *(undefined4 *)((int)gfx + 0xc) = 0;
  gfx[2].words.w0 = 0xe3000800;
  *(undefined4 *)((int)gfx + 0x14) = 0x800000;
  gfx[3].words.w0 = 0xe3001801;
  *(undefined4 *)((int)gfx + 0x1c) = 0;
  gfx[4].words.w0 = 0xe3000c00;
  *(undefined4 *)((int)gfx + 0x24) = 0;
  gfx[5].words.w0 = 0xe3000f00;
  *(undefined4 *)((int)gfx + 0x2c) = 0;
  gfx[6].words.w0 = 0xe3001201;
  *(undefined4 *)((int)gfx + 0x34) = 0;
  gfx[7].words.w0 = 0xe3001402;
  *(undefined4 *)((int)gfx + 0x3c) = 0xc00;
  gfx[8].words.w0 = 0xe3000d01;
  *(undefined4 *)((int)gfx + 0x44) = 0;
  gfx[9].words.w0 = 0xe3001700;
  *(undefined4 *)((int)gfx + 0x4c) = 0;
  gfx[10].words.w0 = 0xd9000000;
  *(undefined4 *)((int)gfx + 0x54) = 0;
  gfx[0xb].words.w0 = 0xd7000000;
  *(undefined4 *)((int)gfx + 0x5c) = 0;
  gfx[0xc].words.w0 = 0xe200001c;
  *(undefined4 *)((int)gfx + 100) = 0x504240;
  gfx[0xd].words.w0 = 0xfc119623;
  *(undefined4 *)((int)gfx + 0x6c) = 0xff2fffff;
  gfx[0xe].words.w0 = 0xfa000000;
  *(uint *)((int)gfx + 0x74) = (uint)r << 0x18 | (uint)g << 0x10 | (uint)b << 8 | (uint)a;
  gfx[0xf].words.w0 = 0xe3001001;
  *(undefined4 *)((int)gfx + 0x7c) = 0;
  gfx[0x10].words.w0 = 0xfd680007;
  *(byte (**) [64])((int)gfx + 0x84) = gGfxManager.unk0x2c;
  gfx[0x11].words.w0 = 0xf5680800;
  *(undefined4 *)((int)gfx + 0x8c) = 0x7080200;
  gfx[0x12].words.w0 = 0xe6000000;
  *(undefined4 *)((int)gfx + 0x94) = 0;
  gfx[0x13].words.w0 = 0xf4000000;
  *(undefined4 *)((int)gfx + 0x9c) = 0x7070070;
  gfx[0x14].words.w0 = 0xe7000000;
  *(undefined4 *)((int)gfx + 0xa4) = 0;
  gfx[0x15].words.w0 = 0xf5680800;
  *(undefined4 *)((int)gfx + 0xac) = 0x80200;
  gfx[0x16].words.w0 = 0xf2000000;
  iVar8 = (int)(short)(int)((float)(uint)param_2 * ((float)uVar1 / fVar10));
  iVar6 = (int)(short)(int)((float)(uint)param_3 * ((float)uVar9 / 240.0f));
  iVar3 = (int)(short)(int)((float)(uint)param_4 * ((float)uVar1 / fVar10));
  iVar4 = (int)(short)(int)((float)(uint)param_5 * ((float)uVar9 / 240.0f));
  fVar10 = (8.0f / (float)(iVar3 - iVar8)) * 1024.0f;
  fVar11 = (8.0f / (float)(iVar4 - iVar6)) * 1024.0f;
  *(undefined4 *)((int)gfx + 0xb4) = 0x70070;
  iVar7 = (int)(short)(int)fVar10;
  uVar9 = (uint)fVar11;
  uVar1 = (iVar3 << 0x12) >> 0x10;
  iVar3 = (int)(short)uVar9;
  if ((int)uVar1 < 1) {
    uVar1 = 0xe4000000;
  }
  else {
    uVar1 = (uVar1 & 0xfff) << 0xc | 0xe4000000;
  }
  uVar2 = (iVar4 << 0x12) >> 0x10;
  if (0 < (int)uVar2) {
    uVar1 |= uVar2 & 0xfff;
  }
  gfx[0x17].words.w0 = uVar1;
  uVar1 = (iVar8 << 0x12) >> 0x10;
  if ((int)uVar1 < 1) {
    uVar2 = 0;
  }
  else {
    uVar2 = (uVar1 & 0xfff) << 0xc;
  }
  uVar5 = (iVar6 << 0x12) >> 0x10;
  if (0 < (int)uVar5) {
    uVar2 |= uVar5 & 0xfff;
  }
  *(uint *)((int)gfx + 0xbc) = uVar2;
  gfx[0x18].words.w0 = 0xe1000000;
  if ((int)uVar1 < 0) {
    iVar4 = (int)(uVar1 * iVar7) >> 7;
    if (iVar7 < 0) {
      if (iVar4 < 0) {
        iVar4 = 0;
      }
    }
    else if (0 < iVar4) {
      iVar4 = 0;
    }
    uVar1 = iVar4 * -0x10000;
  }
  else {
    uVar1 = 0;
  }
  if (iVar6 << 2 < 0) {
    if (iVar3 < 0) {
      iVar3 = (int)(uVar5 * iVar3) >> 7;
      if (iVar3 < 0) {
        iVar3 = 0;
      }
    }
    else {
      iVar3 = (int)(uVar5 * iVar3) >> 7;
      if (0 < iVar3) {
        iVar3 = 0;
      }
    }
    uVar1 |= -iVar3 & 0xffffU;
  }
  *(uint *)((int)gfx + 0xc4) = uVar1;
  gfx[0x19].words.w0 = 0xf1000000;
  *(uint *)((int)gfx + 0xcc) = iVar7 << 0x10 | uVar9 & 0xffff;
  return gfx + 0x1a;
}

Gfx * Graphics::DrawText(Gfx *gfx,char *txt,uint X,uint Y,u8 red,u8 green,u8 blue,u8 alpha){
  char cVar1;
  Gfx *pGVar2;
  uint uVar4;
  uint uVar6;
  int iVar7;
  int uVar3;
  int uVar5;
  uint uVar8;
  uint uVar9;
  int uVar11;
  int iVar10;
  Gfx *pGVar11;
  float fVar12;
  float fVar13;
  
  fVar12 = INT_MAX_f;
  fVar13 = 320.0f;
  gDPPipeSync(gfx++);
  gfx[1].words.w0 = 0xe3000a01;
  *(undefined4 *)((int)gfx + 0xc) = 0;
  gfx[2].words.w0 = 0xe3000800;
  *(undefined4 *)((int)gfx + 0x14) = 0x800000;
  gfx[3].words.w0 = 0xe3001801;
  *(undefined4 *)((int)gfx + 0x1c) = 0;
  gfx[4].words.w0 = 0xe3000c00;
  *(undefined4 *)((int)gfx + 0x24) = 0;
  gfx[5].words.w0 = 0xe3000f00;
  *(undefined4 *)((int)gfx + 0x2c) = 0;
  gfx[6].words.w0 = 0xe3001201;
  *(undefined4 *)((int)gfx + 0x34) = 0x2000;
  *(undefined4 *)((int)gfx + 0x3c) = 0xc00;
  gfx[7].words.w0 = 0xe3001402;
  gfx[8].words.w0 = 0xe3000d01;
  *(undefined4 *)((int)gfx + 0x44) = 0;
  gfx[9].words.w0 = 0xe3001700;
  *(undefined4 *)((int)gfx + 0x4c) = 0;
  gfx[10].words.w0 = 0xd9000000;
  *(undefined4 *)((int)gfx + 0x54) = 0;
  gfx[0xb].words.w0 = 0xd7000000;
  *(undefined4 *)((int)gfx + 0x5c) = 0;
  gfx[0xc].words.w0 = 0xe200001c;
  *(undefined4 *)((int)gfx + 100) = 0x504240;
  gfx[0xd].words.w0 = 0xfc119623;
  *(undefined4 *)((int)gfx + 0x6c) = 0xff2fffff;
  gfx[0xe].words.w0 = 0xfa000000;
  *(uint *)((int)gfx + 0x74) =
       (uint)red << 0x18 | (uint)green << 0x10 | (uint)blue << 8 | (uint)alpha;
  gfx[0xf].words.w0 = 0xe3001001;
  *(undefined4 *)((int)gfx + 0x7c) = 0;
  fVar13 = (float)(X & 0xffff) * ((float)(uint)gGfxManager.hres[1] / fVar13);
  if (fVar12 <= fVar13) {
    fVar13 = fVar13 - fVar12;
  }
  fVar12 = (float)(Y & 0xffff) * ((float)(uint)gGfxManager.Vres[1] / 240.0f);
  uVar8 = (int)fVar13 & 0xffff;
  if (INT_MAX_f <= fVar12) {
    fVar12 = fVar12 - INT_MAX_f;
  }
  uVar11 = (int)fVar12 & 0xffff;
  iVar10 = 0;
  cVar1 = *txt;
  pGVar2 = gfx + 0x10;
  uVar9 = uVar8;
  while (cVar1 != '\0') {
    if (cVar1 == '\n') {
      uVar11 = uVar11 + 10U & 0xffff;
      uVar9 = uVar8;
      pGVar11 = pGVar2;
    }
    else {
      if (gGfxManager.hres[1] <= uVar9) {
        uVar11 = uVar11 + 10U & 0xffff;
        uVar9 = uVar8;
      }
      (pGVar2->words).w0 = 0xfd680003;
      (pGVar2->words).w1 = (uint)(gGfxManager.textfont + (byte)(cVar1 - 0x20));
      pGVar2[1].words.w0 = 0xf5680400;
      *(undefined4 *)((int)pGVar2 + 0xc) = 0x7080200;
      pGVar2[2].words.w0 = 0xe6000000;
      *(undefined4 *)((int)pGVar2 + 0x14) = 0;
      pGVar2[3].words.w0 = 0xf4000000;
      *(undefined4 *)((int)pGVar2 + 0x1c) = 0x7038070;
      pGVar2[4].words.w0 = 0xe7000000;
      *(undefined4 *)((int)pGVar2 + 0x24) = 0;
      pGVar2[5].words.w0 = 0xf5600400;
      *(undefined4 *)((int)pGVar2 + 0x2c) = 0x80200;
      pGVar2[6].words.w0 = 0xf2000000;
      uVar4 = (int)((uVar9 + 8) * 0x40000) >> 0x10;
      *(undefined4 *)((int)pGVar2 + 0x34) = 0x70070;
      if ((int)uVar4 < 1) {
        uVar4 = 0xe4000000;
      }
      else {
        uVar4 = (uVar4 & 0xfff) << 0xc | 0xe4000000;
      }
      uVar6 = (uVar11 + 8) * 0x40000 >> 0x10;
      if (0 < (int)uVar6) {
        uVar4 |= uVar6 & 0xfff;
      }
      pGVar2[7].words.w0 = uVar4;
      uVar3 = (int)(uVar9 << 0x12) >> 0x10;
      if (uVar3 < 1) {
        uVar4 = 0;
      }
      else {
        uVar4 = (uVar3 & 0xfffU) << 0xc;
      }
      uVar5 = (uVar11 << 0x12) >> 0x10;
      if (0 < uVar5) {
        uVar4 |= uVar5 & 0xfffU;
      }
      *(uint *)((int)pGVar2 + 0x3c) = uVar4;
      pGVar2[8].words.w0 = 0xe1000000;
      if (uVar3 < 0) {
        iVar7 = uVar3 << 3;
        if (0 < iVar7) {
          iVar7 = 0;
        }
        uVar4 = iVar7 * -0x10000;
      }
      else {
        uVar4 = 0;
      }
      if (false) {
        iVar7 = (uVar11 << 0x12) >> 0xd;
        if (0 < iVar7) {
          iVar7 = 0;
        }
        uVar4 |= -iVar7 & 0xffffU;
      }
      pGVar11 = pGVar2 + 10;
      uVar9 = uVar9 + 8 & 0xffff;
      *(uint *)((int)pGVar2 + 0x44) = uVar4;
      pGVar2[9].words.w0 = 0xf1000000;
      *(undefined4 *)((int)pGVar2 + 0x4c) = 0x4000400;
    }
    iVar10 += 1;
    pGVar2 = pGVar11;
    cVar1 = txt[iVar10];
  }
  return pGVar2;
}

Gfx * debug::DisplaySystemMonitor(Gfx *gfx){
  ushort x2;
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
  byte bVar14;
  ushort uVar15;
  uint ntscPalVar;
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
  if ((osTvType == NTSC) || (osTvType == MPAL)) {
    ntscPalVar = 0x14585;
  }
  else {
    if (osTvType != PAL) CRASH("gfx.cpp, DisplaySystemMonitor()","Unknown osTvType");
    ntscPalVar = 100000;
  }
  uVar12 = ntscPalVar;
  if (gGfxManager.taskTime < ntscPalVar) uVar12 = gGfxManager.taskTime;
  uVar13 = ntscPalVar;
  if (gGfxManager.dListStartTime < ntscPalVar) uVar13 = gGfxManager.dListStartTime;
  uVar11 = ntscPalVar;
  if (gGfxManager.unkTime0 < ntscPalVar) uVar11 = gGfxManager.unkTime0;
  gGfxManager.dListStartTime = uVar13;
  gGfxManager.taskTime = uVar12;
  gGfxManager.unkTime0 = uVar11;
  pGVar9 = GsSetOtherMode_SysMon(gfx);
  dVar18 = (double)(uVar2 * 0x118);
  if ((int)(uVar2 * 0x118) < 0) {
    dVar18 = dVar18 + UINT_MAX_d;
  }
  dVar21 = (double)uVar1;
  dVar16 = dVar21;
  if ((int)uVar1 < 0) {
    dVar16 = dVar21 + UINT_MAX_d;
  }
  fVar17 = (float)dVar18 / (float)dVar16 + 0.5f;
  if (INT_MAX_f <= fVar17) {
    fVar17 = fVar17 - INT_MAX_f;
  }
  uVar15 = (short)(int)fVar17 + 0x14;
  pGVar9 = gsDisplaySystemMonitor_Fillrect(pGVar9,0x14,0x14,uVar15,0x16,0,0,0xff,0xff);
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
  pGVar9 = gsDisplaySystemMonitor_Fillrect(pGVar9,uVar15,0x14,x2,0x16,0,0,0xff,0xff);
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
  pGVar9 = gsDisplaySystemMonitor_Fillrect(pGVar9,x2,0x14,x2 + sVar19,0x16,0,0,0,0xff);
  dVar18 = (double)(iVar7 * 0x118);
  if (iVar7 * 0x118 < 0) {
    dVar18 = dVar18 + UINT_MAX_d;
  }
  dVar16 = dVar21;
  if ((int)uVar1 < 0) {
    dVar16 = dVar21 + UINT_MAX_d;
  }
  fVar17 = (float)dVar18 / (float)dVar16 + 0.5f;
  if (fVar17 < INT_MAX_f) {
    sVar20 = (short)(int)fVar17;
  }
  else {
    sVar20 = (short)(int)(fVar17 - INT_MAX_f);
  }
  if (uVar3 + iVar8 + 0x4b400 < 0x400000) {
    R = 0;
    G = 0xff;
  }
  else {
    R = 0xff;
    G = 0;
  }
  pGVar9 = gsDisplaySystemMonitor_Fillrect(pGVar9,x2,0x14,x2 + sVar20,0x16,R,G,0,0xff);
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
  pGVar9 = gsDisplaySystemMonitor_Fillrect
                     (pGVar9,x2 + sVar19,0x14,x2 + sVar19 + sVar20,0x16,0,0,0xff,0xff);
  iVar7 = ((int)gfx - (int)pGVar10) * 0x118;
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
  pGVar10 = gsDisplaySystemMonitor_Fillrect(pGVar9,0x14,0x18,sVar19 + 0x14U,0x1a,0,0xff,0,0xff);
  pGVar10 = gsDisplaySystemMonitor_Fillrect(pGVar10,sVar19 + 0x14U,0x18,300,0x1a,0,0,0,0xff);
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
  pGVar10 = gsDisplaySystemMonitor_Fillrect(pGVar10,0x14,0x1c,sVar19 + 0x14,0x1e,0xff,0xff,0,0xff);
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
  pGVar10 = gsDisplaySystemMonitor_Fillrect(pGVar10,0x14,0x20,sVar19 + 0x14,0x22,0,0xff,0xff,0xff);
  dVar18 = (double)(gGfxManager.dListStartTime * 0x118);
  if ((int)(gGfxManager.dListStartTime * 0x118) < 0) {
    dVar18 = dVar18 + UINT_MAX_d;
  }
  if (false) {
    dVar21 = dVar21 + UINT_MAX_d;
  }
  fVar17 = (float)dVar18 / (float)dVar21 + 0.5f;
  if (fVar17 < INT_MAX_f) {
    sVar19 = (short)(int)fVar17;
  }
  else {
    sVar19 = (short)(int)(fVar17 - INT_MAX_f);
  }
  pGVar10 = gsDisplaySystemMonitor_Fillrect(pGVar10,0x14,0x24,sVar19 + 0x14,0x26,0xff,0,0xff,0xff);
  uVar15 = 0x14;
  bVar14 = 0;
  do {
    pGVar10 = gsDisplaySystemMonitor_Fillrect
                        (pGVar10,uVar15,0x1c,uVar15 + 2,0x28,bVar14 * 51,~(bVar14 * 51),0,0xff);
    uVar15 += 0x38;
    bVar14 += 1;
  } while (bVar14 < 6);
  OVar22 = osGetTime();
  gGfxManager.unkTime0 = (u32)udivdi3(CONCAT44((int)(OVar22 >> 0x20) << 6 | (uint)OVar22 >> 0x1a,(uint)OVar22 << 6),
                   3000);;
  return pGVar10;
}



