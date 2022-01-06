#ifdef DEBUGVER
#define FILENAME "./src/gfx.cpp"
#else
#define FILENAME ""
#endif

struct gfxManager {
    OSSched * sched;
    void* unk0x4;
    void* unk0x8;
    void* unk0xc;
    void* unk0x10;
    void* unk0x14;
    void * FrameBuffers[2];
    void* DepthBuffer;
    void* unk0x24;
    void* unk0x28;
    OSViMode osvimodeCustom; //seems to be a second osViMode in 1.1.
    s32 unk0x7c;
    OSScTask tasks[2];
    u16 unk0x150;
    u16 unk0x152;
    u16 unk0x154;
    u8 unk0x156;
    u8 unk0x157;
    u16 unk0x158;
    u8 unk0x15a[6];
    u16 MoreResSettings[2][4]; /* H*2,V*2,511,0 */
    u32 ram_size;
    u32 FramebufferSize[2];
    u32 unk0x17c;
    u32 unk0x180;
    u32 someOtherTimer;
    u32 someTimers[2];
    u16 hres[2];
    u16 Vres[2];
    u8 colordepth[2];
    u8 vi_buffer_choice;
    s8 unk0x19b;
    u8 unk0x19c;
    u8 unk0x19d[3];
};

char* res_mode_string[3]={"Normal Resolution","High Resolution","32 Bit Color"};
ResolutionSettings res_colormode[3]={{320,240,0,16},{512,240,0,16},{320,240,0,32}};
gfxManager gfx_struct;

void gfx::initGfx(OSSched *param_1){
  u8 bVar1;
  s32 iVar2;
  OSViMode *r;
  s32 iVar3;
  s32 iVar4;
  u8 bVar6;
  u32 uVar5;
  u32 uVar7;
  
  uVar7 = 0x19000;
  if (0x400000 < gMemCheckStruct.RamSize) {uVar7 = 0x32000;}
  memset(&gfx_struct,0,0x1a0);
  gfx_struct.DepthBuffer = gMemCheckStruct.unk0x4;
  gfx_struct.FrameBuffers[0] = gMemCheckStruct.vi_buffer_pointers[0];
  gfx_struct.FrameBuffers[1] = gMemCheckStruct.vi_buffer_pointers[1];
  gfx_struct.sched = param_1;
  gfx_struct.unk0x4 = (undefined *)heapAlloc(uVar7,FILENAME,0xdc);
  gfx_struct.unk0x8 = (undefined *)heapAlloc(uVar7,FILENAME,0xdd);
  gfx_struct.unk0xc = (undefined *)heapAlloc(0x400,FILENAME,0xde);
  gfx_struct.unk0x10 = (undefined *)heapAlloc(0xc00,FILENAME,0xdf);
  gfx_struct.unk0x14 = (undefined *)heapAlloc(0x1000,FILENAME,0xe0);
  gfx_struct.unk0x24 = (undefined *)heapAlloc(0xbc0,FILENAME,0xe4);
  gfx_struct.unk0x28 = (undefined *)heapAlloc(0x40,FILENAME,0xe5);
  if (osTvType == NTSC) {r = osViModeTable + 2;}
  else if (osTvType == MPAL) {r = osViModeTable + 0x1e;}
  else {
      if (osTvType != PAL) {assert("gfx.cpp, InitGfx()","TV Type not supported");}
      r = osViModeTable + 0x10;
  }
  memcpy(&gfx_struct.osvimodeCustom,r,0x50);
  iVar4 = 0;
  uVar5 = 0;
  gfx_struct.osvimodeCustom.comRegs.width = 0x200;
  gfx_struct.osvimodeCustom.fldRegs[0].origin = 0x400;
  gfx_struct.osvimodeCustom.comRegs.xScale = 0x333;
  gfx_struct.unk0x150 = 2;
  gfx_struct.unk0x158 = 2;
  gfx_struct.ram_size = gMemCheckStruct.RamSize;
  gfx_struct.FramebufferSize[0] = gMemCheckStruct.MaxResolution1;
  gfx_struct.FramebufferSize[1] = gMemCheckStruct.MaxResolution0;
  iVar2 = 0;
  gfx_struct.unk0x17c = uVar7;
  do {
    bVar6 = 0;
    do {
      uVar7 = 0;
      bVar6++;
      bVar1 = BYTE_ARRAY_800e63a0[iVar2];
      iVar3 = iVar4;
      while( true ) {
        iVar4 = 0;
        if (((s32)(u32)bVar1 >> (8 - uVar7 & 0x1f) & 1U) != 0) {iVar4 = 0xf;}
        if ((uVar7 & 1) == 0) {
          bVar1 = (u8)(iVar4 << 4);
          iVar4 = iVar3;
        }
        else {
          bVar1 = (u8)iVar4 | gfx_struct.unk0x24[iVar3];
          iVar4 = iVar3 + 1;
        }
        gfx_struct.unk0x24[iVar3] = bVar1;
        uVar7++;
        if (7 < uVar7) break;
        bVar1 = BYTE_ARRAY_800e63a0[iVar2];
        iVar3 = iVar4;
      }
      iVar2++;
    } while (bVar6 < 8);
    uVar5++;
    iVar2 = uVar5 << 3;
  } while (uVar5 < 0x5e);
  memset(gfx_struct.unk0x28,0xff,0x40);
  SetGfxMode(res_colormode[0].Hres,res_colormode[0].Vres,res_colormode[0].colorDepth);
  gGlobals.ResolutionSelect = 0;
  video_settings();}

void gfx::initGfx_2(void){
  osSpTaskYield();
  SetGfxMode(0x140,0xf0,0x10);
  video_settings();
  osViBlack(true);
  gfx_struct.unk0x19b = -1;}


void gfx::SetGfxMode(u16 Hres,u16 Vres,u8 color){
  if (gfx_struct.ram_size < 0x400001) { //huh, doesn't check the EXpPakFlag.
    if (((Hres != 0x140) || (Vres != 0xf0)) || (color != 0x10)) {
      assert("gfx.cpp, SetGfxMode()","Non expansion pak resolution not supported!");}
  }
  else {
    if ((((Hres != 0x140) || (Vres != 0xf0)) || ((color != 0x10 && (color != 0x20)))) &&
       (((Hres != 0x200 || (Vres != 0xf0)) || (color != 0x10)))) {
      assert("gfx.cpp, SetGfxMode()","Expansion pak resolution not supported!");}
  }
  gfx_struct.hres[0] = Hres;
  gfx_struct.Vres[0] = Vres;
  gfx_struct.colordepth[0] = color;}

void gfx::video_settings(void){
  memset(gfx_struct.FrameBuffers[0],0,gfx_struct.FramebufferSize[0] << 1);
  osViSwapBuffer(gfx_struct.FrameBuffers[0]);
  if (gfx_struct.hres[0] == 0x140) {
    if (gfx_struct.colordepth[0] == 0x10) {
      if (osTvType == NTSC) {osViSetMode(osViModeTable + 2);}
      else if (osTvType == MPAL) {osViSetMode(osViModeTable + 0x1e);}
      else if (osTvType == PAL) {osViSetMode(osViModeTable + 0x10);}
      }
    else {
      if (osTvType == NTSC) {osViSetMode(osViModeTable + 6);}
      else if (osTvType == MPAL) {osViSetMode(osViModeTable + 0x22);}
      else if (osTvType == PAL) {osViSetMode(osViModeTable + 0x14);}
    }
  }
  else {osViSetMode(&gfx_struct.osvimodeCustom);}
  osViSetSpecialFeatures(GAMMA_OFF|DIVOT_OFF|DITHER_FILTER_ON);
  gfx_struct.MoreResSettings[0][0] = gfx_struct.hres[0] << 1;
  gfx_struct.MoreResSettings[0][1] = gfx_struct.Vres[0] << 1;
  gfx_struct.MoreResSettings[0][2] = 0x1ff;
  gfx_struct.MoreResSettings[0][3] = 0;
  gfx_struct.MoreResSettings[1][0] = gfx_struct.hres[0] << 1;
  gfx_struct.MoreResSettings[1][1] = gfx_struct.Vres[0] << 1;
  gfx_struct.MoreResSettings[1][2] = 0x1ff;
  gfx_struct.MoreResSettings[1][3] = 0;
  gfx_struct.hres[1] = gfx_struct.hres[0];
  gfx_struct.Vres[1] = gfx_struct.Vres[0];
  gfx_struct.colordepth[1] = gfx_struct.colordepth[0];}

//looks like ucode from here on out. needs susing out.
  s32 * gsStartGfxList(void){
  s32 *puVar1;
  u32 uVar2;
  OSTime OVar3;
  u64 uVar4;
  
  puVar1 = (s32 *)gfx_struct.FrameBuffers[gfx_struct.vi_buffer_choice - 5];
  OVar3 = osGetTime();
  gfx_struct.unk0x180 = (u32)udivdi3((s32)(OVar3 >> 0x20) << 6 | (u32)OVar3 >> 0x1a,(u32)OVar3 << 6,3000);
  OVar3 = osGetTime();
  uVar4 = udivdi3((s32)(OVar3 >> 0x20) << 6 | (u32)OVar3 >> 0x1a,(u32)OVar3 << 6,3000);
  gfx_struct.someTimers[1] = udivdi3((s32)(OVar3 >> 0x20) << 6 | (u32)OVar3 >> 0x1a,(u32)OVar3 << 6,3000)
  *puVar1 = 0xdb060000; //G_MOVEWORD
  puVar1[1] = 0;
  // G_SETCIMG
  if (gfx_struct.colordepth[1] == 0x10) uVar2 = 0xff100000;
  else uVar2 = 0xff180000;
  puVar1[2] = gfx_struct.hres[1] - 1 & 0xfff | uVar2;
  puVar1[3] = gfx_struct.FrameBuffers[gfx_struct.vi_buffer_choice];
  puVar1[4] = 0xfe000000; //G_SETZIMG
  puVar1[5] = gfx_struct.DepthBuffer;
  puVar1[6] = 0xed000000; //G_SETSCISSOR
  puVar1[7] = ((s32)((float)(u32)gfx_struct.hres[1] * 4.0f) & 0xfffU) << 0xc |
              (s32)((float)(u32)gfx_struct.Vres[1] * 4.0f) & 0xfffU;
  puVar1[8] = 0xdb040004; //G_MOVEWORD
  puVar1[9] = 3;
  puVar1[0xb] = 3;
  puVar1[10] = 0xdb04000c; //G_MOVEWORD
  puVar1[0xc] = 0xdb040014; //G_MOVEWORD
  puVar1[0xd] = 0xfffd;
  puVar1[0xe] = 0xdb04001c; //G_MOVEWORD
  puVar1[0xf] = 0xfffd;
  puVar1[0x10] = 0xdc080008; //G_MOVEMEM
  puVar1[0x11] = 0x800e6858; //gfx_struct.MoreResSettings[1]
  return puVar1 + 0x12;
}

Gfx* some_video_setting_init(Gfx*param_1,u32 param_2,u32 param_3,u32 param_4,u16 param_5,
 u8 param_6,u8 param_7,u8 param_8,u8 param_9){
  float fVar1;
  float fVar2;
  u16 uVar3;
  u16 uVar4;
  u32 uVar5;
  u32 uVar6;
  u32 uVar7;
  u32 uVar8;
  
  uVar4 = gfx_struct.Vres[1];
  uVar3 = gfx_struct.hres[1];
  (*param_1)[0] = 0xe7000000;
  fVar2 = 240.0f;
  fVar1 = 320.0f;
  (*param_1)[1] = 0;
  param_1[1][0] = 0xe3000a01; //G_SetOtherMode
  param_1[1][1] = 0x300000;
  param_1[2][0] = 0xe200001c;
  param_1[2][1] = 0;
  uVar8 = param_2 * (uVar3 / fVar1)));
  uVar7 = param_3 * (uVar4 / fVar2)));
  //G_FILLRECT
  if (gfx_struct.colordepth[1] == 0x10) {
    param_1[3][0] = 0xf7000000; 
    uVar5 = (param_6 & 0xf8) << 8 | (param_7 & 0xf8) << 3 | param_8 >> 2 & 0x3e | param_9 & 1;
    param_1[3][1] = uVar5 << 0x10 | uVar5;
  }
  else {
    param_1[3][0] = 0xf7000000;
    param_1[3][1] = (u32)param_6 << 0x18 | (u32)param_7 << 0x10 | (u32)param_8 << 8 | (u32)param_9;
  }
  uVar5 = (s32)param_4 * ((float)(u32)uVar3 / fVar1)) - 1;
  if ((s32)uVar5 < 0) {uVar5 = 0;}
  uVar6 = (s32)param_5 * ((float)(u32)uVar4 / fVar2)) - 1;
  if ((s32)uVar6 < 0) {uVar6 = 0;}
  param_1[4][0] = (uVar5 & 0x3ff) << 0xe | (uVar6 & 0x3ff) << 2 | 0xf6000000; //G_FillRect
  if ((s32)uVar8 < 1) {uVar8 = 0;}
  else {uVar8 = (uVar8 & 0x3ff) << 0xe;}
  if (0 < (s32)uVar7) {uVar8 = uVar8 | (uVar7 & 0x3ff) << 2;}
  param_1[4][1] = uVar8;
  return param_1[5];
}

Gfx* Ofunc_rspcode(Gfx*param_1,u32 param_2,u32 param_3,u32 param_4,u16 param_5,
                      u32 param_6){
  float fVar1;
  float fVar2;
  u16 uVar3;
  u16 uVar4;
  u32 uVar5;
  u32 uVar6;
  u32 uVar7;
  u32 uVar8;
  
  uVar4 = gfx_struct.Vres[1];
  uVar3 = gfx_struct.hres[1];
  (*param_1)[0] = 0xe7000000; //G_RDPPIPESYNC
  (*param_1)[1] = 0;
  param_1[1][1] = 0x300000;
  fVar1 = 320.0f;
  param_1[1][0] = 0xe3000a01; //G_Setothermode
  param_1[2][0] = 0xe200001c;
  param_1[2][1] = 0;
  fVar2 = 240.0f;
  param_1[3][0] = 0xf7000000; //G_SETFILLCOLOR
  param_1[3][1] = param_6;
  uVar6 = (s32)(s16)(s32)((float)(param_4 & 0xffff) * ((float)(u32)uVar3 / fVar1)) - 1;
  uVar7 = SEXT24((s16)(s32)((float)(param_2 & 0xffff) * ((float)(u32)uVar3 / fVar1)));
  uVar8 = SEXT24((s16)(s32)((float)(param_3 & 0xffff) * ((float)(u32)uVar4 / fVar2)));
  if ((s32)uVar6 < 0) {uVar6 = 0;}
  uVar5 = (s32)(s16)(s32)((float)(u32)param_5 * ((float)(u32)uVar4 / fVar2)) - 1;
  if ((s32)uVar5 < 0) {uVar5 = 0;}
  param_1[4][0] = (uVar6 & 0x3ff) << 0xe | (uVar5 & 0x3ff) << 2 | 0xf6000000; //G_FILLRECT
  if ((s32)uVar7 < 1) {uVar6 = 0;}
  else {uVar6 = (uVar7 & 0x3ff) << 0xe;}
  if (0 < (s32)uVar8) {uVar6 = uVar6 | (uVar8 & 0x3ff) << 2;}
  param_1[4][1] = uVar6;
  return param_1[5];
}

Gfx* GsSetOtherMode_SysMon(Gfx*param_1){
  (*param_1)[0] = 0xe7000000;
  (*param_1)[1] = 0;
  param_1[1][1] = 0x300000;
  param_1[1][0] = 0xe3000a01;
  param_1[2][0] = 0xe200001c;
  param_1[2][1] = 0;
  return param_1[3];
}

Gfx* debug::gsDisplaySystemMonitor_Fillrect(Gfx*cmd,u16 x1,u16 y1,u16 x2,u16 y2,u8 R,u8 G,u8 B,u8 A){
  s32 uVar1;
  u32 uVar2;
  s32 uVar3;
  u32 uVar4;
  u16 H;
  float HScale;
  u16 V;
  float VScale;
  
  V = gfx_struct.Vres[1];
  H = gfx_struct.hres[1];
  VScale = 240.0f;
  HScale = 320.0f;
  (*cmd)[0] = 0xe7000000;
  (*cmd)[1] = 0;
  uVar4 = x1 * (H / HScale);
  uVar3 = y1 * (V / VScale);
  // G_SETFILLCOLOR
  if (gfx_struct.colordepth[1] == 0x10) {
    cmd[1][0] = 0xf7000000;
    uVar1 = (R & 0xf8) << 8 | (G & 0xf8) << 3 | B >> 2 & 0x3e | A & 1;
    cmd[1][1] = uVar1 << 0x10 | uVar1;
  }
  else {
    cmd[1][0] = 0xf7000000;
    cmd[1][1] = (u32)R << 0x18 | (u32)G << 0x10 | (u32)B << 8 | (u32)A;
  }
  uVar1 = x2 * (H / HScale)) - 1;
  if ((uVar1 < 0) {uVar1 = 0;}
  uVar2 = y2 * (V / VScale)) - 1;
  if (uVar2 < 0) {uVar2 = 0;}
  cmd[2][0] = (uVar1 & 0x3ff) << 0xe | (uVar2 & 0x3ff) << 2 | 0xf6000000; //G_FILLRECT
  if (uVar4 < 1) {uVar4 = 0;}
  else {uVar4 = (uVar4 & 0x3ff) << 0xe;}
  if (0 < uVar3) {uVar4 = uVar4 | (uVar3 & 0x3ff) << 2;}
  cmd[2][1] = uVar4;
  return (s32 *)cmd[3];
}

Gfx* gfx::func_80008f48(Gfx*param_1){
  (*param_1)[0] = 0xe7000000;
  (*param_1)[1] = 0;
  param_1[1][0] = 0xe3000a01;
  param_1[1][1] = 0;
  param_1[2][0] = 0xe200001c;
  param_1[2][1] = 0x552078;
  return param_1[3];
}

Gfx* gfxc::some_rsp_func(Gfx*param_1,u32 param_2,u32 param_3,u32 h,u16 V){
  float fVar1;
  u16 uVar2;
  u16 uVar3;
  s32 uVar4;
  s32 uVar5;
  s32 uVar6;
  u32 uVar7;
  float fVar8;
  
  uVar3 = gfx_struct.Vres[1];
  uVar2 = gfx_struct.hres[1];
  (*param_1)[0] = 0xe7000000; //G_RDPPIPESYNC
  (*param_1)[1] = 0;
  param_1[1][0] = 0xe3000a01;
  param_1[1][1] = 0x300000;
  param_1[2][0] = 0xe200001c;
  param_1[2][1] = 0;
  fVar1 = 240.0f;
  fVar8 = (float)(u32)uVar2 / 320.0f;
  param_1[3][0] = gfx_struct.hres[1] - 1 & 0xfff | 0xff100000; //G_SETCIMG
  param_1[3][1] = (u32)gfx_struct.DepthBuffer;
  param_1[4][0] = 0xf7000000; //G_SETFILLCOLOR
  param_1[4][1] = 0xfffcfffc;
  uVar5 = (h * fVar8) - 1;
  uVar6 = (s16)(s32)((float)(param_2) * fVar8);
  uVar7 = (s16)(s32)((float)(param_3) * ((float)(u32)uVar3 / fVar1));
  if (uVar5 < 0) {uVar5 = 0;}
  uVar4 = V * (uVar3 / fVar1) - 1;
  if (uVar4 < 0) {uVar4 = 0;}
  param_1[5][0] = (uVar5 & 0x3ff) << 0xe | (uVar4 & 0x3ff) << 2 | 0xf6000000; //G_FILLRECT
  if (uVar6 < 1) {uVar5 = 0;}
  else {uVar5 = (uVar6 & 0x3ff) << 0xe;}
  if (0 < uVar7) {uVar5 = uVar5 | (uVar7 & 0x3ff) << 2;}
  param_1[5][1] = uVar5;
  param_1[6][0] = 0xe7000000; //G_RDPPIPESYNC
  param_1[6][1] = 0;
  if (gfx_struct.colordepth[1] == 0x10) {uVar5 = 0xff100000;}
  else {uVar5 = 0xff180000;}
  param_1[7][0] = gfx_struct.hres[1] - 1 & 0xfff | uVar5;
  param_1[7][1] = (u32)gfx_struct.FrameBuffers[gfx_struct.vi_buffer_choice];
  return param_1[8];
}

Gfx* gfx::gsDrawScreenRects(Gfx*param_1){ //seems to draw the overscan border.
  u16 uVar1;
  u32 uVar2;
  
  (*param_1)[0] = 0xe7000000; //G_RDPPIPESYNC
  (*param_1)[1] = 0;
  param_1[1][1] = 0x300000;
  param_1[1][0] = 0xe3000a01; //G_SetOtherMode_H
  param_1[2][0] = 0xe200001c; //G_SetOtherMode_L
  param_1[2][1] = 0;
  param_1[3][0] = 0xf7000000; //G_SETFILLCOLOR
  param_1[3][1] = 0;  //black background
  uVar1 = gfx_struct.Vres[1];
  if (gfx_struct.hres[1] == 0x140) {
    param_1[4][1] = 0;
    param_1[4][0] = (uVar1 - 1 & 0x3ff) << 2 | 0xf603c000;
    uVar1 = gfx_struct.hres[1];
    param_1[5][1] = 0;
    param_1[5][0] = (uVar1 - 1 & 0x3ff) << 0xe | 0xf600002c;
    param_1[6][0] =
         (gfx_struct.hres[1] - 1 & 0x3ff) << 0xe |
         (gfx_struct.Vres[1] - 1 & 0x3ff) << 2 | 0xf6000000;
    uVar2 = gfx_struct.hres[1] - 0x10;
  }
  else {
    param_1[4][1] = 0;
    param_1[4][0] = (uVar1 - 1 & 0x3ff) << 2 | 0xf604c000;
    uVar1 = gfx_struct.hres[1];
    param_1[5][1] = 0;
    param_1[5][0] = (uVar1 - 1 & 0x3ff) << 0xe | 0xf600002c;
    param_1[6][0] =
         (gfx_struct.hres[1] - 1 & 0x3ff) << 0xe |
         (gfx_struct.Vres[1] - 1 & 0x3ff) << 2 | 0xf6000000;
    uVar2 = gfx_struct.hres[1] - 0x14;
  }
  param_1[6][1] = (uVar2 & 0x3ff) << 0xe;
  param_1[7][0] =
       (gfx_struct.hres[1] - 1 & 0x3ff) << 0xe | (gfx_struct.Vres[1] - 1 & 0x3ff) << 2 | 0xf6000000;
  param_1[7][1] = (gfx_struct.Vres[1] - 0xc & 0x3ff) << 2;
  param_1[8][0] = 0xe9000000; //G_RDPFULLSYNC
  param_1[8][1] = 0;
  param_1[9][0] = 0xdf000000; //G_RDPFULLSYNC
  param_1[9][1] = 0;
  gfx_struct.unk0x19c = 0;
  osWritebackDCacheAll();
  return param_1[10];
}

bool resolution_mirror_check(void){
  bool bVar1;
  
  if (((gfx_struct.hres[0] == gfx_struct.hres[1]) && (gfx_struct.Vres[0] == gfx_struct.Vres[1])) &&
     (gfx_struct.colordepth[0] == gfx_struct.colordepth[1])) {
    bVar1 = (u8)gfx_struct.unk0x19b < 2;
  }
  else {
    bVar1 = false;
    if (gfx_struct.unk0x19b == 0) {
      video_settings();
      bVar1 = true;
    }
  }
  return bVar1;
}

void gfx::func_swapping_framebuffer_(s32 dat_size,OSMesgQueue *param_2)
//ghidra did NOT like this function, for some reason.
{
  void *pvVar1;
  undefined *puVar2;
  s32 iVar3;
  s32 iVar4;
  OSScTask *pOVar5;
  
  iVar3 = (u32)gfx_struct.vi_buffer_choice * 0xc + (u32)gfx_struct.vi_buffer_choice;
  iVar4 = iVar3 * 8;
  pOVar5 =gfx_struct.tasks[iVar3].next;
  *(OSScTask **)(gfx_struct.unk0x15a + (u32)gfx_struct.vi_buffer_choice * 8 + -6) = pOVar5;
  gfx_struct.tasks[iVar4].list.Type = 1;
  gfx_struct.tasks[iVar4].list.flags = 0;
  gfx_struct.tasks[iVar4].list.data_ptr=
       gfx_struct.FrameBuffers[gfx_struct.vi_buffer_choice - 5];
  pvVar1 = gfx_struct.FrameBuffers[gfx_struct.vi_buffer_choice - 5];
  gfx_struct.tasks[iVar4].list.ucode_boot = rspbootTextStart;
  gfx_struct.tasks[iVar4].list.ucode_boot_size = 0xd0;
  gfx_struct.tasks[iVar4].list.ucode = gspF3DEX2_fifoTextStart;
  gfx_struct.tasks[iVar4].list.ucode_size = 0x1000;
  gfx_struct.tasks[iVar4].list.ucode_data = gspF3DEX2_fifoDataStart;
  gfx_struct.tasks[iVar4].list.ucode_data_size = 0x800;
  gfx_struct.tasks[iVar4].list.data_size = dat_size - (s32)pvVar1;
  puVar2 = gfx_struct.unk0xc;
  gfx_struct.tasks[iVar3].list.dram_stack_size = 0x400;
  gfx_struct.tasks[iVar3].list.dram_stack = puVar2;
  puVar2 = gfx_struct.unk0x14;
  pOVar5->next = (OSScTask *)0x0;
  gfx_struct.tasks[iVar3].state = 0;
  gfx_struct.tasks[iVar3].msgQ = param_2;
  gfx_struct.tasks[iVar3].list.output_buff = puVar2;
  puVar2 = gfx_struct.unk0x14;
  gfx_struct.tasks[ivar3].flags = RCP_MASK|LAST_TASK|SWAPBUFFER;
  gfx_struct.tasks[iVar3].list.output_buff_size = puVar2 + 0x1000;
  puVar2 = gfx_struct.unk0x10;
  gfx_struct.tasks[iVar3].list + iVar4 + 0x3c) = 0xc00;
  gfx_struct.tasks[iVar3].list.yeild_data_ptr = puVar2;
  (&gfx_struct.tasks[iVar3].msg) =
       (OSMesg)((u32)gfx_struct.vi_buffer_choice * 8 + -0x7ff197b8);
  gfx_struct.tasks[iVar3].framebuffer =
       gfx_struct.FrameBuffers[gfx_struct.vi_buffer_choice];
  gfx_struct.tasks[iVar3].startTime = 0;
  gfx_struct.tasks[iVar3].totalTime = 0;
  gfx_struct.vi_buffer_choice = gfx_struct.vi_buffer_choice ^ 1;
  gfx_struct.unk0x19b++;
}

void gfx::func_800095f0(void *param_1){ //no clue what the arg is. orphaned func.
  u32 uVar1;
  u64 uVar2;
  
  uVar1 = *(u32 *)(*(s32 *)((s32)param_1 + 4) + 100);
  uVar2 = udivdi3(*(s32 *)(*(s32 *)((s32)param_1 + 4) + 0x60) << 6 | uVar1 >> 0x1a,uVar1 << 6,0,3000);
  gfx_struct.someOtherTimer = (u32)uVar2;
  gfx_struct.unk0x19b--;
}

u8 gfx::get_vi_buffer_choice(void){return gfx_struct.vi_buffer_choice;}

void * gfx::func_80009658(void *param_1,void *param_2){
  if (gfx_struct.vi_buffer_choice == 0) {param_2 = param_1;}
  return param_2;}

void * gfx::func_80009674(void *param_1,void *param_2){
  if (gfx_struct.vi_buffer_choice == 0) {param_1 = param_2;}
  return param_1;}

void * gfx::get_vi_buffer(u8 param_1){return gfx_struct.FrameBuffers[param_1];}

undefined * gfx::get_depthBuffer(void){return gfx_struct.DepthBuffer;}

u32 gfx::get_FramebufferSize1(void){return gfx_struct.FramebufferSize[0];}
u32 gfx::get_FramebufferSize2(void){return gfx_struct.FramebufferSize[1];}
u32 gfx::get_hres(void){return gfx_struct.hres[1];}
u32 gfx::get_vres(void){return gfx_struct.Vres[1];}
u32 gfx::get_colorDepth(void){return gfx_struct.colordepth[1];}

//copies the FB for BG and savegame screenshot
void getGfxLastFrame(undefined *pDest,u16 H,u16 V,u8 depth,u16 param_5,u16 param_6,
                    u16 Hres,u16 Vres){
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
  
  bVar10 = gfx_struct.colordepth[1];
  uVar9 = gfx_struct.hres[1];
  uVar11 = 0;
  H_ = (longlong)(s16)H;
  V_ = (longlong)(s16)V;
  if ((pDest == NULL) ||
     ((((depth != 32 && (depth != 16)) && (depth != 8)) && (depth != 4)))) {
    assert("gfx.cpp, GetGfxLastFrame()",
    "pDest_ == NULL || depth_ != 32 || depth_ != 16 || depth_ != 8 || depth_ != 4");}
  pvVar2 = gfx_struct.FrameBuffers[gfx_struct.vi_buffer_choice];
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
void gfx::passto_GetGfxLastFrame(undefined *param_1,u16 param_2,u16 param_3,u8 param_4){
  getGfxLastFrame(param_1,param_2,param_3,param_4,0,0,gfx_struct.hres[1],gfx_struct.Vres[1]);}

s32 *
gfx::func_80009d7c(Gfx*param_1,u32 param_2,u32 param_3,u32 param_4,u16 param_5,u8 param_6,
              u8 param_7,u8 param_8,u8 param_9){
  u32 uVar1;
  u32 uVar2;
  s32 iVar3;
  s32 iVar4;
  u32 uVar5;
  s32 iVar6;
  u32 uVar7;
  s32 iVar8;
  s32 iVar9;
  float fVar10;
  float fVar11;
  
  uVar1 = (u32)gfx_struct.hres[1];
  uVar7 = (u32)gfx_struct.Vres[1];
  (*param_1)[0] = 0xe7000000; //G_RDPPIPESYNC
  (*param_1)[1] = 0;
  param_1[1][0] = 0xe3000a01;
  param_1[1][1] = 0;
  param_1[2][0] = 0xe3000800;
  param_1[2][1] = 0x800000;
  param_1[3][0] = 0xe3001801;
  param_1[3][1] = 0;
  param_1[4][0] = 0xe3000c00;
  param_1[4][1] = 0;
  param_1[5][0] = 0xe3000f00;
  param_1[5][1] = 0;
  param_1[6][0] = 0xe3001201;
  param_1[6][1] = 0;
  param_1[7][0] = 0xe3001402;
  param_1[7][1] = 0xc00;
  param_1[8][0] = 0xe3000d01;
  param_1[8][1] = 0;
  param_1[9][0] = 0xe3001700;
  param_1[9][1] = 0;
  param_1[10][0] = 0xd9000000;
  param_1[10][1] = 0;
  param_1[0xb][0] = 0xd7000000;
  param_1[0xb][1] = 0;
  param_1[0xc][0] = 0xe200001c;
  param_1[0xc][1] = 0x504240;
  param_1[0xd][0] = 0xfc119623;
  param_1[0xd][1] = 0xff2fffff;
  param_1[0xe][0] = 0xfa000000;
  param_1[0xe][1] =(u32)param_6 << 0x18 | (u32)param_7 << 0x10 | (u32)param_8 << 8 | (u32)param_9;
  param_1[0xf][0] = 0xe3001001;
  param_1[0xf][1] = 0;
  param_1[0x10][0] = 0xfd680007;
  param_1[0x10][1] = (u32)gfx_struct.unk0x28;
  param_1[0x11][0] = 0xf5680800;
  param_1[0x11][1] = 0x7080200;
  param_1[0x12][0] = 0xe6000000;
  param_1[0x12][1] = 0;
  param_1[0x13][0] = 0xf4000000;
  param_1[0x13][1] = 0x7070070;
  param_1[0x14][0] = 0xe7000000;
  param_1[0x14][1] = 0;
  param_1[0x15][0] = 0xf5680800;
  param_1[0x15][1] = 0x80200;
  param_1[0x16][0] = 0xf2000000;
  iVar9 = (s32)((float)param_2 * ((float)uVar1 / 320.0f));
  iVar6 = (s32)((float)param_3 * ((float)uVar7 / 240.0f));
  iVar3 = (s32)((float)param_4 * ((float)uVar1 / 320.0f));
  iVar4 = (s32)((float)param_5 * ((float)uVar7 / 240.0f));
  fVar10 = (8.0f / (float)(iVar3 - iVar9)) * 1024.0f;
  fVar11 = (8.0f / (float)(iVar4 - iVar6)) * 1024.0f;
  param_1[0x16][1] = 0x70070;
  iVar8 = (s32)(s16)(s32)fVar10;
  uVar1 = (iVar3 << 0x12) >> 0x10;
  uVar7 = SEXT24((s16)(s32)fVar11);
  if ((s32)uVar1 < 1) {uVar1 = 0xe4000000;}
  else {uVar1 = (uVar1 & 0xfff) << 0xc | 0xe4000000;}
  uVar2 = (iVar4 << 0x12) >> 0x10;
  if (0 < (s32)uVar2) {uVar1 |= uVar2;}
  param_1[0x17][0] = uVar1;
  uVar1 = (iVar9 << 0x12) >> 0x10;
  if ((s32)uVar1 < 1) {uVar2 = 0;}
  else {uVar2 = (uVar1 & 0xfff) << 0xc;}
  uVar5 = (iVar6 << 0x12) >> 0x10;
  if (0 < (s32)uVar5) {uVar2 = uVar2 | uVar5 & 0xfff;}
  param_1[0x17][1] = uVar2;
  param_1[0x18][0] = 0xe1000000;
  if ((s32)uVar1 < 0) {
    iVar3 = (s32)(uVar1 * iVar8) >> 7;
    if (iVar8 < 0) {
      if (iVar3 < 0) {iVar3 = 0;}
    }
    else if (0 < iVar3) {iVar3 = 0;}
    uVar1 = iVar3 * -0x10000;
  }
  else {uVar1 = 0;}
  if (iVar6 << 2 < 0) {
    if ((s32)uVar7 < 0) {
      iVar3 = (s32)(uVar5 * uVar7) >> 7;
      if (iVar3 < 0) {iVar3 = 0;}
    }
    else {
      iVar3 = (s32)(uVar5 * uVar7) >> 7;
      if (0 < iVar3) {iVar3 = 0;}
    }
    uVar1 |= -iVar3 & 0xffffU;
  }
  param_1[0x18][1] = uVar1;
  param_1[0x19][0] = 0xf1000000;
  param_1[0x19][1] = iVar8 << 0x10 | uVar7 & 0xffff;
  return (s32 *)param_1[0x1a];
}


Gfx* debug::some_debug_print(Gfx*rsp,char *txt,u32 X,u32 Y,u8 red,u8 green,u8 blue,u8 alpha){
  char cVar1;
  Gfx*pauVar2;
  u32 uVar4;
  u32 uVar6;
  s32 iVar7;
  u32 uVar8;
  s32 uVar3;
  s32 uVar5;
  u32 uVar9;
  u32 uVar10;
  s32 uVar11;
  s32 iVar11;
  Gfx*pauVar12;
  float fVar13;
  float fVar14;
  
  fVar13 = INT_MAX_f;
  (*rsp)[0] = 0xe7000000; //G_RDPPIPESYNC
  (*rsp)[1] = 0;
  rsp[1][0] = 0xe3000a01; //G_SetOtherMode_H
  rsp[1][1] = 0;
  rsp[2][0] = 0xe3000800; 
  rsp[2][1] = 0x800000;
  rsp[3][0] = 0xe3001801;
  rsp[3][1] = 0;
  rsp[4][0] = 0xe3000c00;
  rsp[4][1] = 0;
  rsp[5][0] = 0xe3000f00;
  rsp[5][1] = 0;
  rsp[6][0] = 0xe3001201;
  rsp[6][1] = 0x2000;
  rsp[7][1] = 0xc00;
  rsp[7][0] = 0xe3001402;
  rsp[8][0] = 0xe3000d01;
  rsp[8][1] = 0;
  rsp[9][0] = 0xe3001700;
  rsp[9][1] = 0;
  rsp[10][0] = 0xd9000000; //G_GEOMETRYMODE
  rsp[10][1] = 0;
  rsp[0xb][0] = 0xd7000000; //G_TEXTURE
  rsp[0xb][1] = 0;
  rsp[0xc][0] = 0xe200001c; //G_SetOtherMode_L
  rsp[0xc][1] = 0x504240;
  rsp[0xd][0] = 0xfc119623; //G_SETCOMBINE
  rsp[0xd][1] = 0xff2fffff;
  rsp[0xe][0] = 0xfa000000; //G_SETPRIMCOLOR
  rsp[0xe][1] = (u32)red << 0x18 | (u32)green << 0x10 | (u32)blue << 8 | (u32)alpha;
  rsp[0xf][0] = 0xe3001001;
  rsp[0xf][1] = 0;
  fVar14 = (float)(X & 0xffff) * ((float)(u32)gfx_struct.hres[1] / 320.0f);
  if (fVar13 <= fVar14) {fVar14-= fVar13;}
  fVar13 = (float)(Y & 0xffff) * ((float)(u32)gfx_struct.Vres[1] / 240.0f);
  uVar9 = (s32)fVar14 & 0xffff;
  if (INT_MAX_f <= fVar13) {fVar13-= INT_MAX_f;}
  uVar11 = (s32)fVar13 & 0xffff;
  iVar11 = 0;
  cVar1 = *txt;
  pauVar2 = rsp[0x10];
  uVar10 = uVar9;
  while (cVar1 != 0) {
    if (cVar1 == '\n') {
      uVar11+=10;
      uVar10 = uVar9;
      pauVar12 = pauVar2;
    }
    else {
      if (gfx_struct.hres[1] <= uVar10) {
        uVar11+=10;
        uVar10 = uVar9;
      }
      (*pauVar2)[0] = 0xfd680003;  //G_SETTIMG
      (*pauVar2)[1] = (u32)(gfx_struct.unk0x24 + (u32)(u8)(cVar1 - 0x20) * 0x20);
      pauVar2[1][0] = 0xf5680400; //G_SETTILE
      pauVar2[1][1] = 0x7080200;
      pauVar2[2][0] = 0xe6000000; //G_RDPLOADSYNC
      pauVar2[2][1] = 0;
      pauVar2[3][0] = 0xf4000000; //G_LOADTILE
      pauVar2[3][1] = 0x7038070;
      pauVar2[4][0] = 0xe7000000;
      pauVar2[4][1] = 0;
      pauVar2[5][0] = 0xf5600400;
      pauVar2[5][1] = 0x80200;
      pauVar2[6][0] = 0xf2000000;
      uVar4 = (s32)((uVar10 + 8) * 0x40000) >> 0x10;
      pauVar2[6][1] = 0x70070;
      if ((s32)uVar4 < 1) {uVar4 = 0xe4000000;}
      else {uVar4 = (uVar4 & 0xfff) << 0xc | 0xe4000000;}
      uVar6 = (uVar11 + 8) * 0x40000 >> 0x10;
      if (0 < (s32)uVar6) {uVar4 |= uVar6 & 0xfff;}
      pauVar2[7][0] = uVar4;
      uVar3 = (s32)(uVar10 << 0x12) >> 0x10;
      if (uVar3 < 1) {uVar4 = 0;}
      else {uVar4 = (uVar3 & 0xfffU) << 0xc;}
      uVar5 = (uVar11 << 0x12) >> 0x10;
      if (0 < uVar5) {uVar4 = uVar4 | uVar5 & 0xfffU;}
      pauVar2[7][1] = uVar4;
      pauVar2[8][0] = 0xe1000000;
      if (uVar3 < 0) {
        iVar7 = uVar3 << 3;
        if (0 < iVar7) {
          iVar7 = 0;
        }
        uVar8 = iVar7 * -0x10000;
      }
      else {uVar8 = 0;}
      pauVar12 = pauVar2[10];
      uVar10+=8;
      pauVar2[8][1] = uVar8;
      pauVar2[9][0] = 0xf1000000;
      pauVar2[9][1] = 0x4000400;
    }
    iVar11++;
    cVar1 = txt[iVar11];
    pauVar2 = pauVar12;
  }
  return pauVar2;
}



Gfx* gfx::DisplaySystemMonitor(Gfx*param_1){
  void *pvVar1;
  u16 uVar2;
  u32 uVar3;
  u32 uVar4;
  u32 uVar5;
  u32 uVar6;
  u32 uVar7;
  u32 uVar8;
  s32 iVar9;
  s32 iVar10;
  Gfx*pauVar11;
  u32 uVar12;
  u32 uVar13;
  u32 uVar14;
  u8 bVar15;
  u16 uVar16;
  u32 ntscPalVar;
  double dVar17;
  float fVar18;
  float fVar19;
  double dVar20;
  s16 sVar21;
  double dVar22;
  OSTime OVar23;
  u64 uVar24;
  u8 R;
  u8 G;
  
  uVar7 = gMemCheckStruct.mem_free_allocated;
  uVar6 = gMemCheckStruct.MaxResolution0;
  uVar4 = gMemCheckStruct.ramVal0;
  uVar3 = gMemCheckStruct.RamSize;
  iVar9 = get_memUsed();
  uVar8 = gMemCheckStruct.MaxResolution1;
  uVar5 = gMemCheckStruct.ramVal0;
  pvVar1 = gfx_struct.FrameBuffers[gfx_struct.vi_buffer_choice - 5];
  iVar10 = get_memUsed();
  OVar23 = osGetTime();
  gfx_struct.someTimers[0] = (s32)udivdi3((s32)(OVar23 >> 0x20) << 6 | (u32)OVar23 >> 0x1a,(u32)OVar23 << 6,3000) - gfx_struct.someTimers[0];
  OVar23 = osGetTime();
  gfx_struct.unk0x180 = (s32)udivdi3((s32)(OVar23 >> 0x20) << 6 | (u32)OVar23 >> 0x1a,(u32)OVar23 << 6,3000) - gfx_struct.unk0x180;
  if ((osTvType == NTSC) || (osTvType == MPAL)) {ntscPalVar = 0x14585;}
  else {
    if (osTvType != PAL) {assert("gfx.cpp, DisplaySystemMonitor()","Unknown osTvType");}
    ntscPalVar = 100000;
  }
  uVar13 = ntscPalVar;
  if (gfx_struct.someOtherTimer < ntscPalVar) uVar13 = gfx_struct.someOtherTimer;
  uVar14 = ntscPalVar;
  if (gfx_struct.unk0x180 < ntscPalVar) uVar14 = gfx_struct.unk0x180;
  uVar12 = ntscPalVar;
  if (gfx_struct.someTimers[0] < ntscPalVar) uVar12 = gfx_struct.someTimers[0];
  gfx_struct.unk0x180 = uVar14;
  gfx_struct.someOtherTimer = uVar13;
  gfx_struct.someTimers[0] = uVar12;
  pauVar11 = GsSetOtherMode_SysMon(param_1);
  dVar20 = (double)(uVar4 * 0x118);
  if ((s32)(uVar4 * 0x118) < 0) {dVar20+= UINT_MAX_d;}
  dVar22 = (double)uVar3;
  dVar17 = dVar22;
  if ((s32)uVar3 < 0) {dVar17 = dVar22 + UINT_MAX_d;}
  fVar18 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (INT_MAX_f <= fVar18) {fVar18-= INT_MAX_f;}
  uVar16 = (s16)(s32)fVar18 + 0x14;
  pauVar11 = gsDisplaySystemMonitor_Fillrect(pauVar11,0x14,0x14,uVar16,0x16,0,0,0xff,0xff);
  dVar20 = (double)(uVar6 * 0x118);
  if ((s32)(uVar6 * 0x118) < 0) {dVar20+= UINT_MAX_d;}
  dVar17 = dVar22;
  if ((s32)uVar3 < 0) {dVar17 = dVar22 + UINT_MAX_d;}
  fVar18 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (INT_MAX_f <= fVar18) {fVar18-= INT_MAX_f;}
  uVar2 = uVar16 + (s16)(s32)fVar18;
  pauVar11 = gsDisplaySystemMonitor_Fillrect(pauVar11,uVar16,0x14,uVar2,0x16,0,0,0xff,0xff);
  dVar20 = (double)(uVar7 * 0x118);
  if ((s32)(uVar7 * 0x118) < 0) {dVar20+= UINT_MAX_d;}
  dVar17 = dVar22;
  if ((s32)uVar3 < 0) {dVar17 = dVar22 + UINT_MAX_d;}
  fVar18 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (INT_MAX_f <= fVar18) {fVar18-= INT_MAX_f;}
  pauVar11 = gsDisplaySystemMonitor_Fillrect(pauVar11,uVar2,0x14,uVar2 + (s16)(s32)fVar18,0x16,0,0,0,0xff);
  dVar20 = (double)(iVar9 * 0x118);
  if (iVar9 * 0x118 < 0) {dVar20+= UINT_MAX_d;}
  dVar17 = dVar22;
  if ((s32)uVar3 < 0) {dVar17 = dVar22 + UINT_MAX_d;}
  fVar19 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (fVar19 < INT_MAX_f) {sVar21 = (s16)(s32)fVar19;}
  else {sVar21 = (s16)(s32)(fVar19 - INT_MAX_f);}
  if (uVar5 + iVar10 + 0x4b400 < 0x400000) {R = 0;G = 0xff;}
  else {R = 0xff;G = 0;} //turn mem usage red if using EXPPak mem.
  pauVar11 = gsDisplaySystemMonitor_Fillrect(pauVar11,uVar2,0x14,uVar2 + sVar21,0x16,R,G,0,0xff);
  uVar2 = uVar2 + (s16)(s32)fVar18;
  dVar20 = (double)(uVar8 * 0x118);
  if ((s32)(uVar8 * 0x118) < 0) {dVar20 = dVar20 + UINT_MAX_d;}
  if ((s32)uVar3 < 0) {dVar22 = dVar22 + UINT_MAX_d;}
  fVar18 = (float)dVar20 / (float)dVar22 + 0.5f;
  if (fVar18 < INT_MAX_f) {sVar21 = (s16)(s32)fVar18;}
  else {sVar21 = (s16)(s32)(fVar18 - INT_MAX_f);}
  pauVar11 = gsDisplaySystemMonitor_Fillrect(pauVar11,uVar2,0x14,uVar2 + sVar21,0x16,0,0,0xff,0xff);
  iVar9 = (s32)((s32)param_1 - (s32)pvVar1) * 0x118;
  dVar20 = (double)iVar9;
  if (iVar9 < 0) {dVar20+= UINT_MAX_d;}
  dVar17 = (double)gfx_struct.unk0x17c;
  if ((s32)gfx_struct.unk0x17c < 0) {dVar17+= UINT_MAX_d;}
  fVar18 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (fVar18 < INT_MAX_f) {sVar21 = (s16)(s32)fVar18;}
  else {sVar21 = (s16)(s32)(fVar18 - INT_MAX_f);}
  pauVar11 = gsDisplaySystemMonitor_Fillrect(pauVar11,0x14,0x18,sVar21 + 0x14U,0x1a,0,0xff,0,0xff);
  pauVar11 = gsDisplaySystemMonitor_Fillrect(pauVar11,sVar21 + 0x14U,0x18,300,0x1a,0,0,0,0xff);
  dVar20 = (double)(gfx_struct.someTimers[0] * 0x118);
  if ((s32)(gfx_struct.someTimers[0] * 0x118) < 0) {dVar20 += UINT_MAX_d;}
  dVar17 = (double)ntscPalVar;
  fVar18 = (float)dVar20 / (float)ntscPalVar + 0.5f;
  if (fVar18 < INT_MAX_f) {sVar21 = (s16)(s32)fVar18;}
  else {sVar21 = (s16)(s32)(fVar18 - INT_MAX_f);}
  pauVar11 = gsDisplaySystemMonitor_Fillrect(pauVar11,0x14,0x1c,sVar21 + 0x14,0x1e,0xff,0xff,0,0xff);
  dVar20 = (double)(gfx_struct.someOtherTimer * 0x118);
  if ((s32)(gfx_struct.someOtherTimer * 0x118) < 0) {dVar20+= UINT_MAX_d;}
  fVar18 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (fVar18 < INT_MAX_f) {sVar21 = (s16)(s32)fVar18;}
  else {sVar21 = (s16)(s32)(fVar18 - INT_MAX_f);}
  pauVar11 = gsDisplaySystemMonitor_Fillrect(pauVar11,0x14,0x20,sVar21 + 0x14,0x22,0,0xff,0xff,0xff);
  dVar20 = (double)(gfx_struct.unk0x180 * 0x118);
  if ((s32)(gfx_struct.unk0x180 * 0x118) < 0) {dVar20+= UINT_MAX_d;}
  fVar18 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (fVar18 < INT_MAX_f) {sVar21 = (s16)(s32)fVar18;}
  else {sVar21 = (s16)(s32)(fVar18 - INT_MAX_f);}
  pauVar11 = gsDisplaySystemMonitor_Fillrect(pauVar11,0x14,0x24,sVar21 + 0x14,0x26,0xff,0,0xff,0xff);
  uVar16 = 0x14;
  bVar15 = 0;
  do { //makes green-to-red bars on cpu-usage gauge
    pauVar11 = gsDisplaySystemMonitor_Fillrect(pauVar11,uVar16,0x1c,uVar16 + 2,0x28,bVar15 * '3',~(bVar15 * '3'),0,0xff);
    uVar16+= 0x38;
    bVar15++;
  } while (bVar15 < 6);
  OVar23 = osGetTime();
  gfx_struct.someTimers[0] = (u32)udivdi3((s32)(OVar23 >> 0x20) << 6 | (u32)OVar23 >> 0x1a,(u32)OVar23 << 6,3000);
  return pauVar11;
}

