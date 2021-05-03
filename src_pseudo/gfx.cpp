struct gfx_struct {
    struct OSSched * sched;
    pointer unk0x4;
    pointer unk0x8;
    pointer unk0xc;
    pointer unk0x10;
    pointer unk0x14;
    void * FrameBuffers[2];
    pointer DepthBuffer;
    pointer unk0x24;
    pointer unk0x28;
    struct OSViMode osvimodeCustom; //seems to be a second osViMode in 1.1.
    int unk0x7c;
    struct OSScTask tasks[2];
    ushort unk0x150;
    ushort unk0x152;
    ushort unk0x154;
    u8 unk0x156;
    u8 unk0x157;
    ushort unk0x158;
    byte unk0x15a[6];
    ushort MoreResSettings[2][4]; /* H*2,V*2,511,0 */
    uint ram_size;
    uint FramebufferSize[2];
    uint unk0x17c;
    uint unk0x180;
    uint someOtherTimer;
    uint someTimers[2];
    ushort hres[2];
    ushort Vres[2];
    byte colordepth[2];
    byte vi_buffer_choice;
    s8 unk0x19b;
    byte unk0x19c;
    byte unk0x19d[3];
};

char* res_mode_string[3]={"Normal Resolution","High Resolution","32 Bit Color"};
ResolutionSettings res_colormode[3]={{320,240,0,16},{512,240,0,16},{320,240,0,32}};
gfxManager gfx_struct;

void initGfx(OSSched *param_1){
  byte bVar1;
  int iVar2;
  OSViMode *r;
  int iVar3;
  int iVar4;
  byte bVar6;
  uint uVar5;
  uint uVar7;
  
  uVar7 = 0x19000;
  if (0x400000 < memCheckStruct.RamSize) {uVar7 = 0x32000;}
  memset(&gfx_struct,0,0x1a0);
  gfx_struct.DepthBuffer = memCheckStruct.unk0x4;
  gfx_struct.FrameBuffers[0] = memCheckStruct.vi_buffer_pointers[0];
  gfx_struct.FrameBuffers[1] = memCheckStruct.vi_buffer_pointers[1];
  gfx_struct.sched = param_1;
  gfx_struct.unk0x4 = (undefined *)Malloc(uVar7,s_./src/gfx.cpp_800d7ca4,0xdc);
  gfx_struct.unk0x8 = (undefined *)Malloc(uVar7,s_./src/gfx.cpp_800d7ca4,0xdd);
  gfx_struct.unk0xc = (undefined *)Malloc(0x400,s_./src/gfx.cpp_800d7ca4,0xde);
  gfx_struct.unk0x10 = (undefined *)Malloc(0xc00,s_./src/gfx.cpp_800d7ca4,0xdf);
  gfx_struct.unk0x14 = (undefined *)Malloc(0x1000,s_./src/gfx.cpp_800d7ca4,0xe0);
  gfx_struct.unk0x24 = (undefined *)Malloc(0xbc0,s_./src/gfx.cpp_800d7ca4,0xe4);
  gfx_struct.unk0x28 = (undefined *)Malloc(0x40,s_./src/gfx.cpp_800d7ca4,0xe5);
  if (osTvType == NTSC) {r = osViModeTable + 2;}
  else if (osTvType == MPAL) {r = osViModeTable + 0x1e;}
  else {
      if (osTvType != PAL) {manualCrash("gfx.cpp, InitGfx()","TV Type not supported");}
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
  gfx_struct.ram_size = memCheckStruct.RamSize;
  gfx_struct.FramebufferSize[0] = memCheckStruct.MaxResolution1;
  gfx_struct.FramebufferSize[1] = memCheckStruct.MaxResolution0;
  iVar2 = 0;
  gfx_struct.unk0x17c = uVar7;
  do {
    bVar6 = 0;
    do {
      uVar7 = 0;
      bVar6 = bVar6 + 1;
      bVar1 = BYTE_ARRAY_800e63a0[iVar2];
      iVar3 = iVar4;
      while( true ) {
        iVar4 = 0;
        if (((int)(uint)bVar1 >> (8 - uVar7 & 0x1f) & 1U) != 0) {
          iVar4 = 0xf;
        }
        if ((uVar7 & 1) == 0) {
          bVar1 = (byte)(iVar4 << 4);
          iVar4 = iVar3;
        }
        else {
          bVar1 = (byte)iVar4 | gfx_struct.unk0x24[iVar3];
          iVar4 = iVar3 + 1;
        }
        gfx_struct.unk0x24[iVar3] = bVar1;
        uVar7 = uVar7 + 1 & 0xff;
        if (7 < uVar7) break;
        bVar1 = BYTE_ARRAY_800e63a0[iVar2];
        iVar3 = iVar4;
      }
      iVar2 = iVar2 + 1;
    } while (bVar6 < 8);
    uVar5 = uVar5 + 1 & 0xff;
    iVar2 = uVar5 << 3;
  } while (uVar5 < 0x5e);
  memset(gfx_struct.unk0x28,0xff,0x40);
  SetGfxMode(res_colormode[0].Hres,res_colormode[0].Vres,res_colormode[0].colorDepth);
  gGlobals.ResolutionSelect = 0;
  video_settings();}

void initGfx_2(void){
  osSpTaskYield();
  SetGfxMode(0x140,0xf0,0x10);
  video_settings();
  osViBlack(true);
  gfx_struct.unk0x19b = -1;}


void SetGfxMode(ushort Hres,ushort Vres,byte color){
  if (gfx_struct.ram_size < 0x400001) { //huh, doesn't check the EXpPakFlag.
    if (((Hres != 0x140) || (Vres != 0xf0)) || (color != 0x10)) {
      manualCrash("gfx.cpp, SetGfxMode()","Expansion pak resolution not supported!");}
  }
  else {
    if ((((Hres != 0x140) || (Vres != 0xf0)) || ((color != 0x10 && (color != 0x20)))) &&
       (((Hres != 0x200 || (Vres != 0xf0)) || (color != 0x10)))) {
      manualCrash("gfx.cpp, SetGfxMode()","Expansion pak resolution not supported!");}
  }
  gfx_struct.hres[0] = Hres;
  gfx_struct.Vres[0] = Vres;
  gfx_struct.colordepth[0] = color;}

void video_settings(void){
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
  undefined4 * gsStartGfxList(void){
  undefined4 *puVar1;
  uint uVar2;
  OSTime OVar3;
  u64 uVar4;
  
  puVar1 = (undefined4 *)gfx_struct.FrameBuffers[gfx_struct.vi_buffer_choice - 5];
  OVar3 = osGetTime();
  uVar4 = udivdi3((int)(OVar3 >> 0x20) << 6 | (uint)OVar3 >> 0x1a,(uint)OVar3 << 6,0,3000);
  gfx_struct.unk0x180 = (uint)uVar4;
  OVar3 = osGetTime();
  uVar4 = udivdi3((int)(OVar3 >> 0x20) << 6 | (uint)OVar3 >> 0x1a,(uint)OVar3 << 6,0,3000);
  gfx_struct.someTimers[1] = (uint)uVar4;
  *puVar1 = 0xdb060000;
  puVar1[1] = 0;
                    /* G_SETCIMG */
  if (gfx_struct.colordepth[1] == 0x10) {
    uVar2 = 0xff100000;
  }
  else {
    uVar2 = 0xff180000;
  }
  puVar1[2] = gfx_struct.hres[1] - 1 & 0xfff | uVar2;
  puVar1[3] = gfx_struct.FrameBuffers[gfx_struct.vi_buffer_choice];
  puVar1[4] = 0xfe000000;
  puVar1[5] = gfx_struct.DepthBuffer;
  puVar1[6] = 0xed000000;
  puVar1[7] = ((int)((float)(uint)gfx_struct.hres[1] * 4.0f) & 0xfffU) << 0xc |
              (int)((float)(uint)gfx_struct.Vres[1] * 4.0f) & 0xfffU;
  puVar1[8] = 0xdb040004;
  puVar1[9] = 3;
  puVar1[0xb] = 3;
  puVar1[10] = 0xdb04000c;
  puVar1[0xc] = 0xdb040014;
  puVar1[0xd] = 0xfffd;
  puVar1[0xe] = 0xdb04001c;
  puVar1[0xf] = 0xfffd;
  puVar1[0x10] = 0xdc080008;
  puVar1[0x11] = 0x800e6858;
  return puVar1 + 0x12;
}

rspCom * some_video_setting_init
                   (rspCom *param_1,uint param_2,uint param_3,uint param_4,ushort param_5,
                   byte param_6,byte param_7,byte param_8,byte param_9)

{
  float fVar1;
  float fVar2;
  ushort uVar3;
  ushort uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  
  uVar4 = gfx_struct.Vres[1];
  uVar3 = gfx_struct.hres[1];
  (*param_1)[0] = 0xe7000000;
  fVar2 = 240.0f;
  fVar1 = 320.0f;
  (*param_1)[1] = 0;
  param_1[1][0] = 0xe3000a01;
  param_1[1][1] = 0x300000;
  param_1[2][0] = 0xe200001c;
  param_1[2][1] = 0;
  uVar8 = SEXT24((short)(int)((float)(param_2 & 0xffff) * ((float)(uint)uVar3 / fVar1)));
  uVar7 = SEXT24((short)(int)((float)(param_3 & 0xffff) * ((float)(uint)uVar4 / fVar2)));
  if (gfx_struct.colordepth[1] == 0x10) {
    param_1[3][0] = 0xf7000000;
    uVar5 = (param_6 & 0xf8) << 8 | (param_7 & 0xf8) << 3 | param_8 >> 2 & 0x3e | param_9 & 1;
    param_1[3][1] = uVar5 << 0x10 | uVar5;
  }
  else {
    param_1[3][0] = 0xf7000000;
    param_1[3][1] =
         (uint)param_6 << 0x18 | (uint)param_7 << 0x10 | (uint)param_8 << 8 | (uint)param_9;
  }
  uVar5 = (int)(short)(int)((float)(param_4 & 0xffff) * ((float)(uint)uVar3 / fVar1)) - 1;
  if ((int)uVar5 < 0) {uVar5 = 0;}
  uVar6 = (int)(short)(int)((float)(uint)param_5 * ((float)(uint)uVar4 / fVar2)) - 1;
  if ((int)uVar6 < 0) {uVar6 = 0;}
  param_1[4][0] = (uVar5 & 0x3ff) << 0xe | (uVar6 & 0x3ff) << 2 | 0xf6000000;
  if ((int)uVar8 < 1) {uVar8 = 0;}
  else {uVar8 = (uVar8 & 0x3ff) << 0xe;}
  if (0 < (int)uVar7) {uVar8 = uVar8 | (uVar7 & 0x3ff) << 2;}
  param_1[4][1] = uVar8;
  return param_1[5];
}

rspCom * Ofunc_rspcode(rspCom *param_1,uint param_2,uint param_3,uint param_4,ushort param_5,
                      u32 param_6){
  float fVar1;
  float fVar2;
  ushort uVar3;
  ushort uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  
  uVar4 = gfx_struct.Vres[1];
  uVar3 = gfx_struct.hres[1];
  (*param_1)[0] = 0xe7000000;
  (*param_1)[1] = 0;
  param_1[1][1] = 0x300000;
  fVar1 = 320.0f;
  param_1[1][0] = 0xe3000a01;
  param_1[2][0] = 0xe200001c;
  param_1[2][1] = 0;
  fVar2 = 240.0f;
  param_1[3][0] = 0xf7000000;
  param_1[3][1] = param_6;
  uVar6 = (int)(short)(int)((float)(param_4 & 0xffff) * ((float)(uint)uVar3 / fVar1)) - 1;
  uVar7 = SEXT24((short)(int)((float)(param_2 & 0xffff) * ((float)(uint)uVar3 / fVar1)));
  uVar8 = SEXT24((short)(int)((float)(param_3 & 0xffff) * ((float)(uint)uVar4 / fVar2)));
  if ((int)uVar6 < 0) {
    uVar6 = 0;
  }
  uVar5 = (int)(short)(int)((float)(uint)param_5 * ((float)(uint)uVar4 / fVar2)) - 1;
  if ((int)uVar5 < 0) {
    uVar5 = 0;
  }
  param_1[4][0] = (uVar6 & 0x3ff) << 0xe | (uVar5 & 0x3ff) << 2 | 0xf6000000;
  if ((int)uVar7 < 1) {
    uVar6 = 0;
  }
  else {
    uVar6 = (uVar7 & 0x3ff) << 0xe;
  }
  if (0 < (int)uVar8) {
    uVar6 = uVar6 | (uVar8 & 0x3ff) << 2;
  }
  param_1[4][1] = uVar6;
  return param_1[5];
}

rspCom * GsSetOtherMode_SysMon(rspCom *param_1){
  (*param_1)[0] = 0xe7000000;
  (*param_1)[1] = 0;
  param_1[1][1] = 0x300000;
  param_1[1][0] = 0xe3000a01;
  param_1[2][0] = 0xe200001c;
  param_1[2][1] = 0;
  return param_1[3];
}

undefined4 *
debug::gsDisplaySystemMonitor_Fillrect
          (rspCom *cmd,ushort x1,ushort y1,ushort x2,ushort y2,u8 R,u8 G,u8 B,u8 A){
  uint uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  ushort H;
  float HScale;
  ushort V;
  float VScale;
  
  V = gfx_struct.Vres[1];
  H = gfx_struct.hres[1];
  VScale = 240.0f;
  HScale = 320.0f;
  (*cmd)[0] = 0xe7000000;
  (*cmd)[1] = 0;
  uVar4 = SEXT24((short)(int)((float)((int)(short)x1 & 0xffff) * ((float)(uint)H / HScale)));
  uVar3 = SEXT24((short)(int)((float)((int)(short)y1 & 0xffff) * ((float)(uint)V / VScale)));
                    /* G_SETFILLCOLOR */
  if (gfx_struct.colordepth[1] == 0x10) {
    cmd[1][0] = 0xf7000000;
    uVar1 = (R & 0xf8) << 8 | (G & 0xf8) << 3 | B >> 2 & 0x3e | A & 1;
    cmd[1][1] = uVar1 << 0x10 | uVar1;
  }
  else {
    cmd[1][0] = 0xf7000000;
    cmd[1][1] = (uint)R << 0x18 | (uint)G << 0x10 | (uint)B << 8 | (uint)A;
  }
  uVar1 = (int)(short)(int)((float)((int)(short)x2 & 0xffff) * ((float)(uint)H / HScale)) - 1;
  if ((int)uVar1 < 0) {
    uVar1 = 0;
  }
  uVar2 = (int)(short)(int)((float)(uint)y2 * ((float)(uint)V / VScale)) - 1;
  if ((int)uVar2 < 0) {
    uVar2 = 0;
  }
  cmd[2][0] = (uVar1 & 0x3ff) << 0xe | (uVar2 & 0x3ff) << 2 | 0xf6000000;
  if ((int)uVar4 < 1) {
    uVar4 = 0;
  }
  else {
    uVar4 = (uVar4 & 0x3ff) << 0xe;
  }
  if (0 < (int)uVar3) {
    uVar4 = uVar4 | (uVar3 & 0x3ff) << 2;
  }
  cmd[2][1] = uVar4;
  return (undefined4 *)cmd[3];
}

rspCom * func_80008f48(rspCom *param_1){
  (*param_1)[0] = 0xe7000000;
  (*param_1)[1] = 0;
  param_1[1][0] = 0xe3000a01;
  param_1[1][1] = 0;
  param_1[2][0] = 0xe200001c;
  param_1[2][1] = 0x552078;
  return param_1[3];
}

rspCom * some_rsp_func(rspCom *param_1,uint param_2,uint param_3,uint h,ushort V)

{
  float fVar1;
  ushort uVar2;
  ushort uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  float fVar8;
  
  uVar3 = gfx_struct.Vres[1];
  uVar2 = gfx_struct.hres[1];
  (*param_1)[0] = 0xe7000000;
  (*param_1)[1] = 0;
  param_1[1][0] = 0xe3000a01;
  param_1[1][1] = 0x300000;
  param_1[2][0] = 0xe200001c;
  param_1[2][1] = 0;
  fVar1 = 240.0f;
  fVar8 = (float)(uint)uVar2 / 320.0f;
  param_1[3][0] = gfx_struct.hres[1] - 1 & 0xfff | 0xff100000;
  param_1[3][1] = (u32)gfx_struct.DepthBuffer;
  param_1[4][0] = 0xf7000000;
  param_1[4][1] = 0xfffcfffc;
  uVar5 = (int)(short)(int)((float)(h & 0xffff) * fVar8) - 1;
  uVar6 = SEXT24((short)(int)((float)(param_2 & 0xffff) * fVar8));
  uVar7 = SEXT24((short)(int)((float)(param_3 & 0xffff) * ((float)(uint)uVar3 / fVar1)));
  if ((int)uVar5 < 0) {
    uVar5 = 0;
  }
  uVar4 = (int)(short)(int)((float)(uint)V * ((float)(uint)uVar3 / fVar1)) - 1;
  if ((int)uVar4 < 0) {
    uVar4 = 0;
  }
  param_1[5][0] = (uVar5 & 0x3ff) << 0xe | (uVar4 & 0x3ff) << 2 | 0xf6000000;
  if ((int)uVar6 < 1) {
    uVar5 = 0;
  }
  else {
    uVar5 = (uVar6 & 0x3ff) << 0xe;
  }
  if (0 < (int)uVar7) {
    uVar5 = uVar5 | (uVar7 & 0x3ff) << 2;
  }
  param_1[5][1] = uVar5;
  param_1[6][0] = 0xe7000000;
  param_1[6][1] = 0;
  if (gfx_struct.colordepth[1] == 0x10) {
    uVar5 = 0xff100000;
  }
  else {
    uVar5 = 0xff180000;
  }
  param_1[7][0] = gfx_struct.hres[1] - 1 & 0xfff | uVar5;
  param_1[7][1] = (u32)gfx_struct.FrameBuffers[gfx_struct.vi_buffer_choice];
  return param_1[8];
}

rspCom * gsDrawScreenRects(rspCom *param_1){
  ushort uVar1;
  uint uVar2;
  
  (*param_1)[0] = 0xe7000000;
  (*param_1)[1] = 0;
  param_1[1][1] = 0x300000;
  param_1[1][0] = 0xe3000a01;
  param_1[2][0] = 0xe200001c;
  param_1[2][1] = 0;
  param_1[3][0] = 0xf7000000;
  param_1[3][1] = 0;
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
  param_1[8][0] = 0xe9000000;
  param_1[8][1] = 0;
  param_1[9][0] = 0xdf000000;
  param_1[9][1] = 0;
  gfx_struct.unk0x19c = 0;
  osWritebackDCacheAll();
  return param_1[10];
}

bool resolution_mirror_check(void){
  bool bVar1;
  
  if (((gfx_struct.hres[0] == gfx_struct.hres[1]) && (gfx_struct.Vres[0] == gfx_struct.Vres[1])) &&
     (gfx_struct.colordepth[0] == gfx_struct.colordepth[1])) {
    bVar1 = (byte)gfx_struct.unk0x19b < 2;
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

void func_swapping_framebuffer_(int dat_size,OSMesgQueue *param_2)
//ghidra did NOT like this function, for some reason.
{
  void *pvVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  OSScTask *pOVar5;
  
  iVar3 = (uint)gfx_struct.vi_buffer_choice * 0xc + (uint)gfx_struct.vi_buffer_choice;
  iVar4 = iVar3 * 8;
  pOVar5 =gfx_struct.tasks[iVar3].next;
  *(OSScTask **)(gfx_struct.unk0x15a + (uint)gfx_struct.vi_buffer_choice * 8 + -6) = pOVar5;
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
  gfx_struct.tasks[iVar4].list.data_size = dat_size - (int)pvVar1;
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
       (OSMesg)((uint)gfx_struct.vi_buffer_choice * 8 + -0x7ff197b8);
  gfx_struct.tasks[iVar3].framebuffer =
       gfx_struct.FrameBuffers[gfx_struct.vi_buffer_choice];
  gfx_struct.tasks[iVar3].startTime = 0;
  gfx_struct.tasks[iVar3].totalTime = 0;
  gfx_struct.vi_buffer_choice = gfx_struct.vi_buffer_choice ^ 1;
  gfx_struct.unk0x19b++;
  return;
}

void func_800095f0(void *param_1){ //no clue what the arg is.
  uint uVar1;
  u64 uVar2;
  
  uVar1 = *(uint *)(*(int *)((int)param_1 + 4) + 100);
  uVar2 = udivdi3(*(int *)(*(int *)((int)param_1 + 4) + 0x60) << 6 | uVar1 >> 0x1a,uVar1 << 6,0,3000);
  gfx_struct.someOtherTimer = (uint)uVar2;
  gfx_struct.unk0x19b--;
}

byte get_vi_buffer_choice(void){return gfx_struct.vi_buffer_choice;}


void * func_80009658(void *param_1,void *param_2){
  if (gfx_struct.vi_buffer_choice == 0) {param_2 = param_1;}
  return param_2;}

void * func_80009674(void *param_1,void *param_2){
  if (gfx_struct.vi_buffer_choice == 0) {param_1 = param_2;}
  return param_1;}

void * get_vi_buffer(byte param_1){return gfx_struct.FrameBuffers[param_1];}

undefined * get_depthBuffer(void){return gfx_struct.DepthBuffer;}

uint get_FramebufferSize1(void){return gfx_struct.FramebufferSize[0];}
uint get_FramebufferSize2(void){return gfx_struct.FramebufferSize[1];}
uint get_hres(void){return gfx_struct.hres[1];}
uint get_vres(void){return gfx_struct.Vres[1];}
uint get_colorDepth(void){return gfx_struct.colordepth[1];}

void getGfxLastFrame(undefined *pDest,ushort H,ushort V,byte depth,ushort param_5,ushort param_6,
                    ushort Hres,ushort Vres)

{
  ushort uVar1;
  void *pvVar2;
  uint uVar3;
  int iVar4;
  float fVar5;
  byte bVar6;
  float fVar7;
  float fVar8;
  ushort uVar9;
  byte bVar10;
  uint uVar11;
  undefined uVar12;
  byte bVar13;
  ulonglong uVar14;
  int iVar15;
  byte bVar16;
  ulonglong uVar17;
  uint uVar18;
  byte bVar19;
  uint *puVar20;
  ushort *puVar21;
  undefined *puVar22;
  uint uVar23;
  ulonglong H_;
  uint uVar24;
  uint uVar25;
  ulonglong V_;
  float fVar26;
  float fVar27;
  float fVar28;
  float fVar29;
  
  bVar10 = gfx_struct.colordepth[1];
  uVar9 = gfx_struct.hres[1];
  uVar11 = 0;
  H_ = (longlong)(short)H & 0xffff;
  V_ = (longlong)(short)V & 0xffff;
  if ((pDest == (undefined *)0x0) ||
     ((((depth != 0x20 && (depth != 0x10)) && (depth != 8)) && (depth != 4)))) {
    manualCrash("gfx.cpp, GetGfxLastFrame()",
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
        uVar24 = (uint)H_;
        fVar29 = (float)(uint)param_6;
        do {
          fVar8 = 31.0f;
          fVar7 = 255.0f;
          fVar28 = (float)(uint)param_5;
          uVar17 = 0;
          fVar27 = (float)(uint)Hres - fVar28;
          iVar15 = (int)uVar14;
          uVar14 = SEXT48(iVar15 + 1);
          if (H_ != 0) {
            iVar4 = iVar15 * uVar24;
            puVar22 = pDest + iVar4;
            iVar15 = iVar15 * (uVar24 >> 1);
            puVar21 = (ushort *)(pDest + iVar4 * 2);
            puVar20 = (uint *)(pDest + iVar4 * 4);
            uVar23 = uVar11;
            do {
              uVar18 = (uint)uVar17;
              uVar11 = uVar23;
              if (bVar10 == 0x20) {
                fVar26 = fVar29;
                if (INT_MAX_f <= fVar29) {fVar26 = fVar29 - INT_MAX_f;}
                fVar5 = fVar28;
                if (INT_MAX_f <= fVar28) {fVar5 = fVar28 - INT_MAX_f;}
                uVar3 = *(uint *)(((int)fVar26 * (uint)uVar9 + (int)fVar5) * 4 + (int)pvVar2);
                if (depth == 0x20) {
                  *puVar20 = uVar3 | 0xff;
                }
                else {
                  if (depth == 0x10) {
                    *puVar21 = (ushort)((uVar3 >> 0x1b) << 0xb) | (ushort)(uVar3 >> 0xd) & 0x7c0 |
                               (ushort)(uVar3 >> 10) & 0x3e | 1;
                  }
                  else {
                    if (depth == 8) {
                      uVar11 = ((uVar3 >> 0x18) + (uVar3 >> 0x10) + (uVar3 >> 8) & 0xff) / 3;
                      if (bVar19 == 0) {
LAB_80009c10:
                        if (uVar25 < uVar11) {
                          uVar25 = uVar11;
                        }
                        if (uVar23 <= uVar11) {
                          uVar11 = uVar23;
                        }
                      }
                      else {
                        fVar26 = ((float)(uVar11 - uVar23) / (float)(uVar25 - uVar23)) * fVar7;
                        if (fVar26 < INT_MAX_f) {
                          *puVar22 = (char)(int)fVar26;
                          uVar11 = uVar23;
                        }
                        else {
                          *puVar22 = (char)(int)(fVar26 - INT_MAX_f);
                          uVar11 = uVar23;
                        }
                      }
                    }
                    else {
                      uVar11 = ((uVar3 >> 0x18) + (uVar3 >> 0x10) + (uVar3 >> 8) & 0xff) / 3;
                      if (bVar19 == 0) goto LAB_80009c10;
                      fVar26 = ((float)(uVar11 - uVar23) / (float)(uVar25 - uVar23)) * fVar7;
                      if (INT_MAX_f <= fVar26) {
                        fVar26 = fVar26 - INT_MAX_f;
                      }
                      uVar11 = ((int)fVar26 & 0xffU) >> 4;
                      bVar16 = (byte)uVar11;
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
                uVar1 = *(ushort *)(((int)fVar26 * (uint)uVar9 + (int)fVar5) * 2 + (int)pvVar2);
                if (depth == 0x20) {
                  *puVar20 = (uint)(uVar1 >> 0xb) << 0x1b | (uVar1 >> 6 & 0x1f) << 0x13 |
                             (uVar1 & 0x3e) << 10 | 0xff;
                }
                else {
                  if (depth == 0x10) {
                    *puVar21 = uVar1 | 1;
                  }
                  else {
                    if (depth == 8) {
                      uVar11 = ((uint)(uVar1 >> 0xb) + (uVar1 >> 6 & 0x1f) + (uVar1 >> 1 & 0x1f)) /
                               3;
                      if (bVar19 == 0) goto LAB_80009c10;
                      fVar26 = ((float)(uVar11 - uVar23) / (float)(uVar25 - uVar23)) * fVar8;
                      if (fVar26 < INT_MAX_f) {
                        uVar12 = (undefined)((int)fVar26 << 3);
                      }
                      else {
                        uVar12 = (undefined)((int)(fVar26 - INT_MAX_f) << 3);
                      }
                      *puVar22 = uVar12;
                      uVar11 = uVar23;
                    }
                    else {
                      uVar11 = ((uint)(uVar1 >> 0xb) + (uVar1 >> 6 & 0x1f) + (uVar1 >> 1 & 0x1f)) /
                               3;
                      if (bVar19 == 0) goto LAB_80009c10;
                      fVar26 = ((float)(uVar11 - uVar23) / (float)(uVar25 - uVar23)) * fVar8;
                      if (INT_MAX_f <= fVar26) {
                        fVar26 = fVar26 - INT_MAX_f;
                      }
                      uVar11 = ((int)fVar26 & 0xffU) >> 1;
                      bVar16 = (byte)uVar11;
                      if ((uVar17 & 1) == 0) goto LAB_80009cb4;
LAB_80009c94:
                      pDest[iVar15 + (uVar18 >> 1)] = bVar16 | pDest[iVar15 + (uVar18 >> 1)];
                      uVar11 = uVar23;
                    }
                  }
                }
              }
              puVar22 = puVar22 + 1;
              puVar21 = puVar21 + 1;
              puVar20 = puVar20 + 1;
              uVar17 = SEXT48((int)(uVar18 + 1));
              fVar28 = fVar28 + fVar27 / (float)uVar24;
              uVar23 = uVar11;
            } while (uVar17 < H_);
          }
          fVar29 = fVar29 + ((float)(uint)Vres - (float)(uint)param_6) / (float)(int)V_;
        } while (uVar14 < V_);
      }
      bVar19 = bVar13;
    } while (bVar13 < bVar6);
  }
  return;
}
void passto_GetGfxLastFrame(undefined *param_1,ushort param_2,ushort param_3,byte param_4){
  getGfxLastFrame(param_1,param_2,param_3,param_4,0,0,gfx_struct.hres[1],gfx_struct.Vres[1]);}

undefined4 *
func_80009d7c(rspCom *param_1,uint param_2,uint param_3,uint param_4,ushort param_5,byte param_6,
              byte param_7,byte param_8,byte param_9){
  uint uVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  uint uVar7;
  int iVar8;
  int iVar9;
  float fVar10;
  float fVar11;
  
  fVar10 = 320.0f;
  uVar1 = (uint)gfx_struct.hres[1];
  uVar7 = (uint)gfx_struct.Vres[1];
  (*param_1)[0] = 0xe7000000;
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
  param_1[0xe][1] =
       (uint)param_6 << 0x18 | (uint)param_7 << 0x10 | (uint)param_8 << 8 | (uint)param_9;
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
  iVar9 = (int)(short)(int)((float)(param_2 & 0xffff) * ((float)uVar1 / fVar10));
  iVar6 = (int)(short)(int)((float)(param_3 & 0xffff) * ((float)uVar7 / 240.0f));
  iVar3 = (int)(short)(int)((float)(param_4 & 0xffff) * ((float)uVar1 / fVar10));
  iVar4 = (int)(short)(int)((float)(uint)param_5 * ((float)uVar7 / 240.0f));
  fVar10 = (8.0f / (float)(iVar3 - iVar9)) * 1024.0f;
  fVar11 = (8.0f / (float)(iVar4 - iVar6)) * 1024.0f;
  param_1[0x16][1] = 0x70070;
  iVar8 = (int)(short)(int)fVar10;
  uVar1 = (iVar3 << 0x12) >> 0x10;
  uVar7 = SEXT24((short)(int)fVar11);
  if ((int)uVar1 < 1) {
    uVar1 = 0xe4000000;
  }
  else {
    uVar1 = (uVar1 & 0xfff) << 0xc | 0xe4000000;
  }
  uVar2 = (iVar4 << 0x12) >> 0x10;
  if (0 < (int)uVar2) {
    uVar1 = uVar1 | uVar2 & 0xfff;
  }
  param_1[0x17][0] = uVar1;
  uVar1 = (iVar9 << 0x12) >> 0x10;
  if ((int)uVar1 < 1) {
    uVar2 = 0;
  }
  else {
    uVar2 = (uVar1 & 0xfff) << 0xc;
  }
  uVar5 = (iVar6 << 0x12) >> 0x10;
  if (0 < (int)uVar5) {
    uVar2 = uVar2 | uVar5 & 0xfff;
  }
  param_1[0x17][1] = uVar2;
  param_1[0x18][0] = 0xe1000000;
  if ((int)uVar1 < 0) {
    iVar3 = (int)(uVar1 * iVar8) >> 7;
    if (iVar8 < 0) {
      if (iVar3 < 0) {
        iVar3 = 0;
      }
    }
    else {
      if (0 < iVar3) {
        iVar3 = 0;
      }
    }
    uVar1 = iVar3 * -0x10000;
  }
  else {
    uVar1 = 0;
  }
  if (iVar6 << 2 < 0) {
    if ((int)uVar7 < 0) {
      iVar3 = (int)(uVar5 * uVar7) >> 7;
      if (iVar3 < 0) {
        iVar3 = 0;
      }
    }
    else {
      iVar3 = (int)(uVar5 * uVar7) >> 7;
      if (0 < iVar3) {
        iVar3 = 0;
      }
    }
    uVar1 = uVar1 | -iVar3 & 0xffffU;
  }
  param_1[0x18][1] = uVar1;
  param_1[0x19][0] = 0xf1000000;
  param_1[0x19][1] = iVar8 << 0x10 | uVar7 & 0xffff;
  return (undefined4 *)param_1[0x1a];
}


undefined4 *
some_debug_print
          (rspCom *param_1,char *param_2,uint param_3,uint param_4,byte param_5,byte param_6,
          byte param_7,byte param_8){
  char cVar1;
  rspCom *pauVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  u32 uVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  int iVar11;
  rspCom *pauVar12;
  float fVar13;
  float fVar14;
  
  fVar13 = INT_MAX_f;
  fVar14 = 320.0f;
  (*param_1)[0] = 0xe7000000;
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
  param_1[6][1] = 0x2000;
  param_1[7][1] = 0xc00;
  param_1[7][0] = 0xe3001402;
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
  param_1[0xe][1] =
       (uint)param_5 << 0x18 | (uint)param_6 << 0x10 | (uint)param_7 << 8 | (uint)param_8;
  param_1[0xf][0] = 0xe3001001;
  param_1[0xf][1] = 0;
  fVar14 = (float)(param_3 & 0xffff) * ((float)(uint)gfx_struct.hres[1] / fVar14);
  if (fVar13 <= fVar14) {fVar14-= fVar13;}
  fVar13 = (float)(param_4 & 0xffff) * ((float)(uint)gfx_struct.Vres[1] / 240.0f);
  uVar8 = (int)fVar14 & 0xffff;
  if (INT_MAX_f <= fVar13) {fVar13-= INT_MAX_f;}
  uVar10 = (int)fVar13 & 0xffff;
  iVar11 = 0;
  cVar1 = *param_2;
  pauVar2 = param_1[0x10];
  uVar9 = uVar8;
  while (cVar1 != 0) {
    if (cVar1 == 10) {
      uVar10+= 10;
      uVar9 = uVar8;
      pauVar12 = pauVar2;
    }
    else {
      if (gfx_struct.hres[1] <= uVar9) {
        uVar10+=10;
        uVar9 = uVar8;
      }
      (*pauVar2)[0] = 0xfd680003;
      (*pauVar2)[1] = (u32)(gfx_struct.unk0x24 + (uint)(byte)(cVar1 - 0x20) * 0x20);
      pauVar2[1][0] = 0xf5680400;
      pauVar2[1][1] = 0x7080200;
      pauVar2[2][0] = 0xe6000000;
      pauVar2[2][1] = 0;
      pauVar2[3][0] = 0xf4000000;
      pauVar2[3][1] = 0x7038070;
      pauVar2[4][0] = 0xe7000000;
      pauVar2[4][1] = 0;
      pauVar2[5][0] = 0xf5600400;
      pauVar2[5][1] = 0x80200;
      pauVar2[6][0] = 0xf2000000;
      uVar3 = (int)((uVar9 + 8) * 0x40000) >> 0x10;
      pauVar2[6][1] = 0x70070;
      if ((int)uVar3 < 1) {uVar3 = 0xe4000000;}
      else {uVar3 = (uVar3 & 0xfff) << 0xc | 0xe4000000;}
      uVar4 = (int)((uVar10 + 8) * 0x40000) >> 0x10;
      if (0 < (int)uVar4) {uVar3 = uVar3 | uVar4 & 0xfff;}
      pauVar2[7][0] = uVar3;
      uVar3 = (int)(uVar9 << 0x12) >> 0x10;
      if ((int)uVar3 < 1) {uVar4 = 0;}
      else {uVar4 = (uVar3 & 0xfff) << 0xc;}
      uVar7 = (int)(uVar10 << 0x12) >> 0x10;
      if (0 < (int)uVar7) {uVar4 = uVar4 | uVar7 & 0xfff;}
      pauVar2[7][1] = uVar4;
      pauVar2[8][0] = 0xe1000000;
      if ((int)uVar3 < 0) {
        iVar5 = uVar3 << 3;
        if (0 < iVar5) {iVar5 = 0;}
        uVar6 = iVar5 * -0x10000;
      }
      else {uVar6 = 0;}
      pauVar12 = pauVar2[10];
      uVar9 +=8;
      pauVar2[8][1] = uVar6;
      pauVar2[9][0] = 0xf1000000;
      pauVar2[9][1] = 0x4000400;
    }
    iVar11++;
    cVar1 = param_2[iVar11];
    pauVar2 = pauVar12;
  }
  return (undefined4 *)pauVar2;
}


rspCom * DisplaySystemMonitor(rspCom *param_1){
  void *pvVar1;
  ushort uVar2;
  u32 uVar3;
  u32 uVar4;
  u32 uVar5;
  u32 uVar6;
  u32 uVar7;
  u32 uVar8;
  int iVar9;
  int iVar10;
  rspCom *pauVar11;
  uint uVar12;
  uint uVar13;
  uint uVar14;
  byte bVar15;
  ushort uVar16;
  uint ntscPalVar;
  double dVar17;
  float fVar18;
  float fVar19;
  double dVar20;
  short sVar21;
  double dVar22;
  OSTime OVar23;
  u64 uVar24;
  u8 R;
  u8 G;
  
  uVar7 = memCheckStruct.mem_free_allocated;
  uVar6 = memCheckStruct.MaxResolution0;
  uVar4 = memCheckStruct.ramVal0;
  uVar3 = memCheckStruct.RamSize;
  iVar9 = get_memUsed();
  uVar8 = memCheckStruct.MaxResolution1;
  uVar5 = memCheckStruct.ramVal0;
  pvVar1 = gfx_struct.FrameBuffers[gfx_struct.vi_buffer_choice - 5];
  iVar10 = get_memUsed();
  OVar23 = osGetTime();
  uVar24 = udivdi3((int)(OVar23 >> 0x20) << 6 | (uint)OVar23 >> 0x1a,(uint)OVar23 << 6,0,3000);
  gfx_struct.someTimers[0] = (int)uVar24 - gfx_struct.someTimers[0];
  OVar23 = osGetTime();
  uVar24 = udivdi3((int)(OVar23 >> 0x20) << 6 | (uint)OVar23 >> 0x1a,(uint)OVar23 << 6,0,3000);
  gfx_struct.unk0x180 = (int)uVar24 - gfx_struct.unk0x180;
  if ((osTvType == NTSC) || (osTvType == MPAL)) {ntscPalVar = 0x14585;}
  else {
    if (osTvType != PAL) {manualCrash("gfx.cpp, DisplaySystemMonitor()","Unknown osTvType");}
    ntscPalVar = 100000;
  }
  uVar13 = ntscPalVar;
  if (gfx_struct.someOtherTimer < ntscPalVar) {uVar13 = gfx_struct.someOtherTimer;}
  uVar14 = ntscPalVar;
  if (gfx_struct.unk0x180 < ntscPalVar) {uVar14 = gfx_struct.unk0x180;}
  uVar12 = ntscPalVar;
  if (gfx_struct.someTimers[0] < ntscPalVar) {uVar12 = gfx_struct.someTimers[0];}
  gfx_struct.unk0x180 = uVar14;
  gfx_struct.someOtherTimer = uVar13;
  gfx_struct.someTimers[0] = uVar12;
  pauVar11 = (rspCom *)GsSetOtherMode_SysMon(param_1);
  dVar20 = (double)(uVar4 * 0x118);
  if ((int)(uVar4 * 0x118) < 0) {dVar20+= UINT_MAX_d;}
  dVar22 = (double)uVar3;
  dVar17 = dVar22;
  if ((int)uVar3 < 0) {dVar17 = dVar22 + UINT_MAX_d;}
  fVar18 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (INT_MAX_f <= fVar18) {fVar18-= INT_MAX_f;}
  uVar16 = (short)(int)fVar18 + 0x14;
  pauVar11 = (rspCom *)gsDisplaySystemMonitor_Fillrect(pauVar11,0x14,0x14,uVar16,0x16,0,0,0xff,0xff)
  ;
  dVar20 = (double)(uVar6 * 0x118);
  if ((int)(uVar6 * 0x118) < 0) {dVar20+= UINT_MAX_d;}
  dVar17 = dVar22;
  if ((int)uVar3 < 0) {dVar17 = dVar22 + UINT_MAX_d;}
  fVar18 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (INT_MAX_f <= fVar18) {fVar18 = fVar18 - INT_MAX_f;}
  uVar2 = uVar16 + (short)(int)fVar18;
  pauVar11 = (rspCom *)
             gsDisplaySystemMonitor_Fillrect(pauVar11,uVar16,0x14,uVar2,0x16,0,0,0xff,0xff);
  dVar20 = (double)(uVar7 * 0x118);
  if ((int)(uVar7 * 0x118) < 0) {dVar20+= UINT_MAX_d;}
  dVar17 = dVar22;
  if ((int)uVar3 < 0) {dVar17 = dVar22 + UINT_MAX_d;}
  fVar18 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (INT_MAX_f <= fVar18) {fVar18-= INT_MAX_f;}
  pauVar11 = (rspCom *)
             gsDisplaySystemMonitor_Fillrect
                       (pauVar11,uVar2,0x14,uVar2 + (short)(int)fVar18,0x16,0,0,0,0xff);
  dVar20 = (double)(iVar9 * 0x118);
  if (iVar9 * 0x118 < 0) {dVar20+= UINT_MAX_d;}
  dVar17 = dVar22;
  if ((int)uVar3 < 0) {dVar17 = dVar22 + UINT_MAX_d;}
  fVar19 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (fVar19 < INT_MAX_f) {sVar21 = (short)(int)fVar19;}
  else {sVar21 = (short)(int)(fVar19 - INT_MAX_f);}
  if (uVar5 + iVar10 + 0x4b400 < 0x400000) {R = 0;G = 0xff;}
  else {R = 0xff;G = 0;}
  pauVar11 = (rspCom *)
             gsDisplaySystemMonitor_Fillrect(pauVar11,uVar2,0x14,uVar2 + sVar21,0x16,R,G,0,0xff);
  uVar2 = uVar2 + (short)(int)fVar18;
  dVar20 = (double)(uVar8 * 0x118);
  if ((int)(uVar8 * 0x118) < 0) {dVar20 = dVar20 + UINT_MAX_d;}
  if ((int)uVar3 < 0) {dVar22 = dVar22 + UINT_MAX_d;}
  fVar18 = (float)dVar20 / (float)dVar22 + 0.5f;
  if (fVar18 < INT_MAX_f) {sVar21 = (short)(int)fVar18;}
  else {sVar21 = (short)(int)(fVar18 - INT_MAX_f);}
  pauVar11 = (rspCom *)
             gsDisplaySystemMonitor_Fillrect(pauVar11,uVar2,0x14,uVar2 + sVar21,0x16,0,0,0xff,0xff);
  iVar9 = (int)((int)param_1 - (int)pvVar1) * 0x118;
  dVar20 = (double)iVar9;
  if (iVar9 < 0) {
    dVar20 = dVar20 + UINT_MAX_d;
  }
  dVar17 = (double)gfx_struct.unk0x17c;
  if ((int)gfx_struct.unk0x17c < 0) {
    dVar17 = dVar17 + UINT_MAX_d;
  }
  fVar18 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (fVar18 < INT_MAX_f) {
    sVar21 = (short)(int)fVar18;
  }
  else {
    sVar21 = (short)(int)(fVar18 - INT_MAX_f);
  }
  pauVar11 = (rspCom *)
             gsDisplaySystemMonitor_Fillrect(pauVar11,0x14,0x18,sVar21 + 0x14U,0x1a,0,0xff,0,0xff);
  pauVar11 = (rspCom *)
             gsDisplaySystemMonitor_Fillrect(pauVar11,sVar21 + 0x14U,0x18,300,0x1a,0,0,0,0xff);
  dVar20 = (double)(gfx_struct.someTimers[0] * 0x118);
  if ((int)(gfx_struct.someTimers[0] * 0x118) < 0) {
    dVar20 = dVar20 + UINT_MAX_d;
  }
  dVar17 = (double)ntscPalVar;
  fVar18 = (float)dVar20 / (float)ntscPalVar + 0.5f;
  if (fVar18 < INT_MAX_f) {
    sVar21 = (short)(int)fVar18;
  }
  else {
    sVar21 = (short)(int)(fVar18 - INT_MAX_f);
  }
  pauVar11 = (rspCom *)
             gsDisplaySystemMonitor_Fillrect(pauVar11,0x14,0x1c,sVar21 + 0x14,0x1e,0xff,0xff,0,0xff)
  ;
  dVar20 = (double)(gfx_struct.someOtherTimer * 0x118);
  if ((int)(gfx_struct.someOtherTimer * 0x118) < 0) {dVar20+= UINT_MAX_d;}
  fVar18 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (fVar18 < INT_MAX_f) {sVar21 = (short)(int)fVar18;}
  else {sVar21 = (short)(int)(fVar18 - INT_MAX_f);}
  pauVar11 = (rspCom *)
             gsDisplaySystemMonitor_Fillrect(pauVar11,0x14,0x20,sVar21 + 0x14,0x22,0,0xff,0xff,0xff)
  ;
  dVar20 = (double)(gfx_struct.unk0x180 * 0x118);
  if ((int)(gfx_struct.unk0x180 * 0x118) < 0) {dVar20+= UINT_MAX_d;}
  fVar18 = (float)dVar20 / (float)dVar17 + 0.5f;
  if (fVar18 < INT_MAX_f) {sVar21 = (short)(int)fVar18;}
  else {sVar21 = (short)(int)(fVar18 - INT_MAX_f);}
  pauVar11 = (rspCom *)
             gsDisplaySystemMonitor_Fillrect(pauVar11,0x14,0x24,sVar21 + 0x14,0x26,0xff,0,0xff,0xff)
  ;
  uVar16 = 0x14;
  bVar15 = 0;
  do {
    pauVar11 = (rspCom *)
               gsDisplaySystemMonitor_Fillrect
                         (pauVar11,uVar16,0x1c,uVar16 + 2,0x28,bVar15 * '3',~(bVar15 * '3'),0,0xff);
    uVar16+= 0x38;
    bVar15++;
  } while (bVar15 < 6);
  OVar23 = osGetTime();
  uVar24 = udivdi3((int)(OVar23 >> 0x20) << 6 | (uint)OVar23 >> 0x1a,(uint)OVar23 << 6,0,3000);
  gfx_struct.someTimers[0] = (uint)uVar24;
  return pauVar11;
}

