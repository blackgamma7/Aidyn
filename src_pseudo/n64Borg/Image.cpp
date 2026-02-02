#include "n64Borg.h"
#include "crash.h"

#define FILENAME "./src/n64BorgImage.cpp"

float sImageHScale=1.0f;
float sImageVScale=1.0f;
u8 fade_texture[88]={0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0,0,0,0,0,0,0};

u8 borg8_func_b(void *param_1,void *param_2){return false;}


void borg8_func_a(Borg8Header *param_1){
  if (((param_1->dat).format == BORG8_CI8) || ((param_1->dat).format == BORG8_CI4))
    SetPointer(param_1,dat.palette);
  else (param_1->dat).palette = NULL;
  SetPointer(param_1,dat.offset);
}

void borg8_free_ofunc(Borg8Header *param_1){
  s32 iVar1 = get_memUsed();
  if (param_1->head.index == -1) HFREE(param_1,0x8f);
  else dec_borg_count(param_1->head.index);
  borg_mem[8]-= (iVar1 - get_memUsed());
  borg_count[8]--;
}

//load "Borg8" image
//@param index: index of image (see "BORG8_*" #defines)
//@returns Header of image
Borg8Header* loadBorg8(u32 index){
  setBorgFlag();
  return (Borg8Header *)getBorgItem(index);}


//gets called before almost every borg8 draw command
//@param gfx: display list
//@param flag: determines combine and render mode
//@param h: screen height
//@param w: screen width
//@returns display list changes
Gfx * borg8DlistInit(Gfx *gfx,byte flag,u16 h,u16 v){
  u32 word1;
  u32 word0;
  
  sImageHScale = h / (float)SCREEN_WIDTH;
  sImageVScale = v / (float)SCREEN_HEIGHT;
  gDPPipeSync(gfx++);
  gDPSetCycleType(gfx++,G_CYC_1CYCLE);
  gDPPipelineMode(gfx++,G_PM_1PRIMITIVE);
  gDPSetColorDither(gfx++,0);
  gDPSetAlphaDither(gfx++,0);
  gDPSetTexturePersp(gfx++,0);
  gDPSetTextureLOD(gfx++,0);
  gDPSetTextureFilter(gfx++,G_TF_BILERP);
  gDPSetTextureConvert(gfx++,G_TC_FILT);
  gDPSetTextureDetail(gfx++,0);
  gDPSetCombineKey(gfx++,0);
  gSPClearGeometryMode(gfx++,0);
  gSPTexture(gfx++,0,0,0,0,0);
  if (flag & 2){gDPSetRenderMode(gfx++,G_RM_XLU_SURF2,(G_BL_CLR_MEM<<22));}
  else {gDPSetRenderMode(gfx++,G_RM_OPA_SURF2,G_RM_PASS);}
  //Set combine (solid or alpha. Most times alpha)
  if ((flag & 4) == 0) {
    //gDPSetCombineLERP();
    word0 = 0xfcffffff;
    word1 = 0xfffcf279;
  }
  else {
    //gDPSetCombineLERP();
    word0 = 0xfc119623;
    word1 = 0xff2fffff;
  }
  Gfx* g= gfx++;
  g->words.w0 = word0;
  g->words.w1 = word1;
  return gfx;
}

//Build dlist for rendering Borg8
//@param g display list
//@param borg8 image
//@param x x position
//@param y y position
//@param xOff x position offset
//@param yOff y position offset
//@param h horizontal
//@param v vertical
//@param xScale horizontal scale
//@param yScale vertical scale
//@param red red
//@param green green
//@param blue blue
//@param alpha alpha
//@returns display list change
Gfx * N64BorgImageDraw(Gfx *g,Borg8Header *borg8,float x,float y,u16 xOff,u16 yOff,u16 h,u16 v,
                      float xScale,float yScale,u8 red,u8 green,u8 blue,u8 alpha) {
  u16 uVar1;
  s16 dsdx16;
  u32 uVar4;
  int fmt;
  int iVar6;
  u32 uVar7;
  u32 uVar8;
  int iVar9;
  u32 uVar12;
  u32 iters;
  int iVar14;
  u32 uVar15;
  u32 uVar16;
  u32 vVis;
  u32 uVar18;
  u32 uVar19;
  u32 uVar20;
  u32 xOff32;
  u32 uVar22;
  u32 i;
  u32 hVis;
  u32 uVar27;
  s16 sVar28;
  int iVar29;
  float fVar30;
  int iVar31;
  s32 dsdx;
  float fVar33;
  float fVar36;
  double dVar34;
  double dVar35;
  float fVar37;
  float imgXScale;
  float imgYScale;
  u32 dtdy;
  short dtdy16;
  
  imgXScale = xScale * sImageHScale;
  void*BMP = (borg8->dat).offset;
  imgYScale = yScale * sImageVScale;
  hVis = (u32)h - (u32)xOff;
  fVar36 = x * sImageHScale;
  uVar1 = (borg8->dat).Width;
  gDPPipeSync(g++);
  gDPSetPrimColor(g++,0,0,red,green,blue,alpha);
  uVar16 = (u32)yOff;
  fVar33 = 4.0f;
  vVis = (u32)v - (u32)yOff;
  fVar37 = y * sImageVScale * 4.0f;
  iVar29 = (int)((float)(int)hVis * imgXScale * 4.0f);
  iVar31 = (int)(fVar36 * 4.0f);
  dsdx = (int)(1024.0f / imgXScale);
  dtdy = (u32)(1024.0f / imgYScale);
  if (8 < ((borg8->dat).format - BORG8_RBGA32))
    CRASH("N64BorgImage.cpp N64BorgImageDraw","Image type was  not recognized.");
  xOff32 = (u32)xOff;
  uVar20 = (u32)xOff;
  dsdx16 = (s16)dsdx;
  dtdy16 = (s16)dtdy;
  sVar28 = (s16)iVar31;
  switch((borg8->dat).format) {
  case BORG8_RBGA32:
    if ((int)hVis < 2) fmt = 2 - hVis;
    else {
      fmt = 2 - (hVis & 1);
      if ((hVis & 1) == 0) fmt = 0;
    }
    iters = (hVis + fmt) * 4;
    uVar22 = 0x1000 / iters - 1;
    iters = vVis / uVar22;
    vVis = vVis - iters * uVar22;
    if (vVis == 0) {
      iters--;
      vVis = uVar22;
    }
    dVar35 = (double)(int)uVar22;
    i = 0;
    dVar34 = (double)(int)vVis;
    gSPSetOtherMode(g++,G_SETOTHERMODE_H,29/*?*/,2,G_TT_NONE);
    fVar33 = (float)dVar35 * imgYScale * 4.0f;
    uVar4 = (u32)sVar28;
    u16 currYoff=yOff;
    for(i=0;i<iters;i++){
      currYoff+=uVar22;
      Borg8LoadTextureBlock(g++,BMP,G_IM_FMT_RGBA,G_IM_SIZ_32b,borg8->dat.Width,hVis,xOff,yOff,currYoff,uVar22);
      gSPScisTextureRectangle(g++, sVar28, fVar37, (iVar31 + iVar29), (fVar37 + fVar33), 0, 0, 0, dsdx16, dtdy16);
      fVar37+= fVar33;
    }
    Borg8LoadTextureBlock(g++,BMP,G_IM_FMT_RGBA,G_IM_SIZ_32b,borg8->dat.Width,hVis,xOff,yOff,yOff,vVis - 1);
    gSPScisTextureRectangle(g++, sVar28, fVar37, (iVar31 + iVar29), (fVar37 + (float)dVar34 * imgYScale * 4.0f),
     0, 0, 0, dsdx16, dtdy16);
    break;
  case BORG8_RGBA16:
  case BORG8_IA16:
    if ((int)hVis < 4) fmt = 4 - hVis;
    else {
      fmt = 4 - (hVis & 3);
      if ((hVis & 3) == 0) fmt = 0;
    }
    iters = (hVis + fmt) * 2;
    uVar22 = 0x1000 / iters - 1;
    iters = vVis / uVar22;
    vVis = vVis - iters * uVar22;
    if (vVis == 0) {
      iters = iters - 1;
      vVis = uVar22;
    }
    fVar30 = (float)(int)uVar22 * imgYScale * 4.0f;
    fmt = G_IM_FMT_IA;
    if ((borg8->dat).format == BORG8_RGBA16) {
      fmt = G_IM_FMT_RGBA;
    }
    dVar35 = (double)(int)vVis;
    gSPSetOtherMode(g++,G_SETOTHERMODE_H,29/*?*/,2,G_TT_NONE);
    uVar4 = (u32)sVar28;
    u16 currYoff=yOff;
    for(i=0;i<iters;i++){
      currYoff+=uVar22;
      Borg8LoadTextureBlock(g++,BMP,fmt,G_IM_SIZ_16b,borg8->dat.Width,hVis,xOff,yOff,currYoff,uVar22);
      gSPScisTextureRectangle(g++, sVar28, fVar37, (iVar31 + iVar29), (fVar37 + fVar30), 0, 0, 0, dsdx16, dtdy16);
      fVar37+= fVar30;
    }
    Borg8LoadTextureBlock(g++,BMP,fmt,G_IM_SIZ_16b,borg8->dat.Width,hVis,xOff,yOff,yOff,vVis - 1);
    gSPScisTextureRectangle(g++, sVar28, fVar37, (iVar31 + iVar29), (fVar37 + (float)dVar35 * imgYScale * 4.0f),
     0, 0, 0, dsdx16, dtdy16);
    break;
  default:
    if ((int)hVis < 8) {
      fmt = 8 - hVis;
    }
    else {
      fmt = 8 - (hVis & 7);
      if ((hVis & 7) == 0) {
        fmt = 0;
      }
    }
    if ((borg8->dat).format == BORG8_CI8) iters = 0x800;
    else iters = 0x1000;
    uVar22 = iters / (hVis + fmt) - 1;
    iters = vVis / uVar22;
    vVis = vVis - iters * uVar22;
    if (vVis == 0) {
      iters = iters - 1;
      vVis = uVar22;
    }
    fVar30 = (float)(int)uVar22;
    fVar30 = fVar30 * imgYScale * 4.0f;
    if ((borg8->dat).format == BORG8_CI8) {
      fmt = G_IM_FMT_CI;
      gSPSetOtherMode(g++,G_SETOTHERMODE_H,29/*?*/,2,G_TT_RGBA16);
      gDPLoadTLUT_pal256(g++,(borg8->dat).palette);
      gDPLoadSync(g++);
    }
    else {
      fmt = G_IM_FMT_I;
      if ((borg8->dat).format == BORG8_IA8) {
        fmt = G_IM_FMT_IA;
      }
      gSPSetOtherMode(g++,G_SETOTHERMODE_H,29/*?*/,2,G_TT_NONE);
    }
    dVar35 = (double)(int)vVis;
    uVar4 = (u32)sVar28;
    u16 currYoff=yOff;
    for(i=0;i<iters;i++){
      currYoff+=uVar22;
      Borg8LoadTextureBlock(g++,BMP,fmt,G_IM_SIZ_8b,borg8->dat.Width,hVis,xOff,yOff,currYoff,uVar22);
      gSPScisTextureRectangle(g++, sVar28, fVar37, (iVar31 + iVar29), (fVar37 + fVar30), 0, 0, 0, dsdx16, dtdy16);
      fVar37+= fVar30;
    }
    Borg8LoadTextureBlock(g++,BMP,fmt,G_IM_SIZ_8b,borg8->dat.Width,hVis,xOff,yOff,yOff,vVis - 1);
    gSPScisTextureRectangle(g++, sVar28, fVar37, (iVar31 + iVar29), (fVar37 + (float)dVar35 * imgYScale * 4.0f),
     0, 0, 0, dsdx16, dtdy16);
    break;
  case BORG8_CI4:
  case BORG8_IA4:
  case BORG8_I4:
    if ((int)hVis < 0x10) {
      fmt = 0x10 - hVis;
    }
    else {
      fmt = 0x10 - (hVis & 0xf);
      if ((hVis & 0xf) == 0) {
        fmt = 0;
      }
    }
    iters = hVis + fmt >> 1;
    if ((borg8->dat).format == BORG8_CI4) uVar22 = 0x800;
    else uVar22 = 0x1000;
    uVar22 = uVar22 / iters - 1;
    iters = vVis / uVar22;
    vVis = vVis - iters * uVar22;
    if (vVis == 0) {
      iters--;
      vVis = uVar22;
    }
    fVar30 = (float)(int)uVar22;
    fVar30 = fVar30 * imgYScale * 4.0f;
    if ((borg8->dat).format == BORG8_CI4) {
      fmt = G_IM_FMT_CI;
      gSPSetOtherMode(g++,G_SETOTHERMODE_H,29/*?*/,2,G_TT_RGBA16);
      gDPLoadTLUT_pal256(g++,(borg8->dat).palette);//not pal16?
      gDPLoadSync(g++);
    }
    else {
      fmt = G_IM_FMT_I;
      if ((borg8->dat).format == BORG8_IA4) {
        fmt = G_IM_FMT_IA;
      }
      gSPSetOtherMode(g++,G_SETOTHERMODE_H,29/*?*/,2,G_TT_NONE);
    }
    iVar6 = xOff - 1;
    dVar35 = (double)(int)vVis;
    uVar4 = (u32)sVar28;
    u16 currYoff=yOff;
    for(i=0;i<iters;i++){
      currYoff+=uVar22;
      Borg8LoadTextureBlock(g++,BMP,fmt,G_IM_SIZ_4b,borg8->dat.Width>>1,hVis,xOff,yOff,currYoff,uVar22);
      gSPScisTextureRectangle(g++, sVar28, fVar37, (iVar31 + iVar29), (fVar37 + fVar30), 0, 0, 0, dsdx16, dtdy16);
      fVar37+= fVar30;
    }
    Borg8LoadTextureBlock(g++,BMP,fmt,G_IM_SIZ_4b,borg8->dat.Width>>1,hVis,xOff,yOff,yOff,vVis - 1);
    gSPScisTextureRectangle(g++, sVar28, fVar37, (iVar31 + iVar29), (fVar37 + (float)dVar35 * imgYScale * 4.0f),
     0, 0, 0, dsdx16, dtdy16);
     break;
  }
  return g;
}


//simplified wrapper for N64BorgImageDraw()
//@param gfx: display list
//@param borg8: image
//@param x: x position
//@param x: x position
//@param Hscale: horizontal scale
//@param Vscale: vertical scale
//@param R: red
//@param G: green
//@param B: blue
//@param A: alpha
//@returns display list change
Gfx* Borg8_DrawSimple(Gfx*g,Borg8Header *borg8,float x,float y,float Hscale,
                   float Vscale,u8 R,u8 G,u8 B,u8 A){
  return 
    N64BorgImageDraw(g,borg8,x,y,0,0,(borg8->dat).Width,(borg8->dat).Height,Hscale,Vscale,R,G,B,A);
}

void borg8_free(Borg8Header *param_1){
  s32 iVar1 = get_memUsed();
  if ((param_1->head).index == -1) HFREE(param_1,0x24f);
  else dec_borg_count((param_1->head).index);
  borg_mem[8]-= (iVar1 - get_memUsed());
  borg_count[8]--;
}
//another function to draw a rectangle
//@param gfx: display list
//@param x: x position
//@param x: x position
//@param H: height
//@param W: width
//@param R: red
//@param G: green
//@param B: blue
//@param A: alpha
//@returns display list changes
Gfx * DrawRectangle(Gfx *gfx,u16 x,u16 y,u16 H,u16 V,u8 R,u8 G,u8 B,u8 A){
  int sicsH;
  int sicsY;
  int sicsV;
  int dsdx;
  int sicsX;
  u32 dtdy;
  

  gDPLoadSync(gfx++);
  gDPSetPrimColor(gfx++,0,0,R,G,B,A);
  gDPSetTextureLUT(gfx++,0);
  gDPLoadTextureBlock(gfx++,fade_texture,G_IM_FMT_I,G_IM_SIZ_4b,8,8,0,0,2,2,0,0,0);
  sicsX = (x * sImageHScale);
  sicsY = (y * sImageVScale);
  sicsH = ((float)H * sImageHScale);
  sicsV = ((float)V * sImageVScale);
  dsdx = ((8.0f / (float)(sicsH - sicsX)) * 1024.0f);
  dtdy = ((8.0f / (float)(sicsV - sicsY)) * 1024.0f);
  gSPScisTextureRectangle(gfx++,sicsX,sicsY,sicsH,sicsV,0,0,0,dsdx,dtdy);
  return gfx;
}

