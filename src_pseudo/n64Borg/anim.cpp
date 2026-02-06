#include "n64Borg.h"
#include "globals.h"

// script for models textures and animations of Borg 1/2/5/6/7

#define FILENAME "./src/borganim.cpp"

void* DAT_800f32b0=NULL;
Borg1Header* PTR_800f32b4=NULL;
Light gWhiteLight=gDefAmbient(0xff,0xff,0xff);
Light gBlackLight=gDefAmbient(0,0,0);
Gfx gDlist800f32d8[]={
    gsDPPipeSync(),
    gsDPSetTextureDetail(G_TD_SHARPEN),
    gsDPSetTextureLUT(G_TT_NONE),
    gsDPSetRenderMode(0x442038,G_RM_RA_ZB_OPA_SURF2), //TODO: decypher properly
    gsDPSetPrimColor(0,0,0,0,0,0),
    gsDPSetCombine(0xffffff,0xfe793c),//TODO: decypher properly
    gsDPSetAlphaCompare(0),
    gsDPSetDepthSource(0),
    gsDPSetAlphaDither(0),
    gsDPSetColorDither(0),
    gsDPSetCombineKey(0),
    gsDPSetTextureConvert(G_TC_FILT),
    gsDPSetTextureFilter(G_TF_BILERP),
    gsDPSetTextureLOD(G_TL_LOD),
    gsDPSetTextureLUT(0),
    gsDPSetTextureDetail(0),
    gsDPSetTexturePersp(G_TP_PERSP),
    gsSPClearGeometryMode(G_FOG|G_TEXTURE_GEN|G_TEXTURE_GEN_LINEAR),
    gsSPSetGeometryMode(G_ZBUFFER|G_SHADE|G_CULL_BACK|G_LIGHTING|G_SHADING_SMOOTH),
    gsSPEndDisplayList() 
};
vec3f vec3f_800f3378={0,0,100.0};
vec3f vec3f_800f3384={1.0,0,0.0};
u32 UINT_800f3390=false;
u32 UINT_800f3394=false;
Gfx sEndDL=gsSPEndDisplayList();
u8 D_800f33a0[0x30]={0};//far too big to be file break. Unknown.

MtxF MtxF_800f54b0,some_mtx,unused_matrix;
Random gBorg7Rand,gAniRandSeed;

void Ofunc_8009d250(){PTR_800f32b4 = NULL;}

void Ofunc_8009d25c(void* p){DAT_800f32b0 = p;}

//returns byte depth based on enum. (-1 for 4-bit)
s8 GetN64ImageDimension(u16 X){
  s8 ret;
  
  switch(X) {
  case B1_RGBA16:
  case B1_IA16:
    ret = 2;
    break;
  case B1_CI8:
  case B1_IA8:
  case B1_I8:
    ret = 1;
    break;
  case B1_CI4:
  case B1_IA4:
  case B1_I4:
    ret = -1;
    break;
  case B1_RGBA32:
    ret = 4;
    break;
  default:
    CRASH("GetN64ImageDimension","unknown image type");
  }
  return ret;
}
//get size of bitmap based on height(h) width(w) and depth(d) (if d=-1, treat as 4-bit)
int GetBitmapSize(int h,int w,s32 d){
  if (d == -1) {
    if (7 < h / 2) {
      return (h * w) / 2;
    }
  }
  else if (7 < h * d) {
    return h * w * d;
  }
  return w << 3;
}
//halve the value to the nearest even number
u32 half(int x){
  u32 ret = x >> 1;
  if ((ret != 1) && ((ret & 1))) ret--;
  return ret;
}
//get power of two by repeatedly halving number to 0.
int getPow2(u32 x){
  int pow = -1;
  for(;x!=0;pow++){
    x = half(x);
  }
  return pow;
}
//get power of two by repeatedly halving (x/y) number to 0.
s32 FUN_8009d3b0(s32 x,s32 y){return getPow2(x / y);}

Gfx * FUN_8009d3dc(Gfx *g,Borg1Header *b1,u8 bufferchoice){
  u8 bVar1;
  u32 uVar3;
  u32 uVar5;
  
  if ((b1->dat->flag & B1_Moving)) {
    bVar1 = b1->dat->move;
    if ((bVar1 & 0xf) == 0) {
      if ((bVar1 & 0xf0)) {
        if (b1->dat->type < B1_CI8) moveBitmap16(b1,(u32)(bVar1 >> 4));
        else moveBitmap32(b1,(u32)(bVar1 >> 4));
        FUN_8009d7b0(b1);
        goto LAB_8009d4c0;
      }
    }
    bVar1 = b1->dat->move;
    uVar5 = (u32)(bVar1 >> 4);
    if (uVar5 == (bVar1 & 0xf)) {
      if (b1->dat->type < B1_CI8) moveBitmap16(b1,uVar5);
      else moveBitmap32(b1,uVar5);
      FUN_8009d7b0(b1);
      b1->dat->move&= 0xf;
    }
    else b1->dat->move+= 0x10;
  }
LAB_8009d4c0:
  if (b1->dat->dList == NULL) g = borganim_LoadTextureImage(g,b1);
  else gSPDisplayList(g++,osVirtualToPhysical(b1->dat->dList));
  PTR_800f32b4 = b1;
  return g;
}

void moveBitmap32(Borg1Header *param_1,int param_2){
  u8 w;
  int iVar2;
  u16 uVar3;
  u32 uVar4;
  int iVar5;
  s16 i;
  u32 j;
  int iVar8;
  u32 *pCVar9;
  u32 w_;
  u32 *pCVar11;
  u32 h;
  u32 *puVar14;
  
  pCVar11 = (u32 *)param_1->bitmapA;
  if ((u32 *)param_1->dat->bmp == pCVar11) {
    puVar14 = (u32 *)param_1->bitmapB;
  }
  else {
    puVar14 = pCVar11;
    pCVar11 = (u32 *)param_1->bitmapB;
  }
  i = 0;
  h = (u32)param_1->dat->Height;
  w = param_1->dat->Width;
  w_ = (u32)w;
  if (h != 0) {
    iVar2 = 0;
    do {
      j = 0;
      if ((i & 1) == 0) {
        if (w_ != 0) {
          pCVar9 = puVar14 + iVar2;
          iVar5 = (u32)w + -param_2;
          for(s16 k=0;k<w_;k++,pCVar9++) {
            uVar3 = (u16)iVar5;
            iVar5 += 1;
            *pCVar9 = pCVar11[iVar2 + (s16)(uVar3 & ~(u16)w)];
          }
        }
      }
      else if (w_ != 0) { 
        iVar5 = (u32)w + -param_2;
        for(s16 j=0;j<w_;j++){
          uVar3 = (u16)iVar5;
          iVar5++;
          uVar4 = j ^ 2;
          puVar14[iVar2 + uVar4] = pCVar11[iVar2 + (s16)(uVar3 & ~(u16)w ^ 2)];
        }
      }
      i++;
      iVar2 = i * w;
    } while (i < h);
  }
  return;
}

void moveBitmap16(Borg1Header *param_1,int param_2){
  u8 bVar1;
  int iVar2;
  u16 uVar3;
  u32 uVar4;
  int iVar5;
  u32 j;
  int iVar6;
  int iVar7;
  u16 *puVar8;
  u32 uVar9;
  u16 *puVar12;
  u32 uVar10;
  u16 *puVar11;
  
  puVar12 = (u16 *)param_1->bitmapA;
  if ((u16 *)param_1->dat->bmp == puVar12) puVar11 = (u16 *)param_1->bitmapB;
  else {
    puVar11 = puVar12;
    puVar12 = (u16 *)param_1->bitmapB;
  }
  uVar10 = (u32)param_1->dat->Height;
  bVar1 = param_1->dat->Width;
  uVar9 = (u32)bVar1;
  for(s16 i=0,iVar2 = 0;i<i < uVar10;i++){
      if ((i & 1) == 0) {
        puVar8 = puVar11 + iVar2;
        iVar5 = (u32)bVar1 + -param_2;
        for(s16 j=0;j<uVar9;j++) {
            uVar3 = (u16)iVar5++;
            *puVar8 = puVar12[iVar2 + (s16)(uVar3 & ~(u16)bVar1)];
            puVar8++;
        }
      }
      else if (uVar9 != 0) { //compensate for odd rows' interleaving
        iVar5 = (u32)bVar1 + -param_2;
        for(s16 j=0;j<uVar9;j++) {
          uVar3 = (u16)iVar5++;
          uVar4 = j ^ 2;
          puVar11[iVar2 + uVar4] = puVar12[iVar2 + (s16)(uVar3 & ~(u16)bVar1 ^ 2)];
        }
      }
      iVar2 = i * bVar1;
  }
}

void FUN_8009d7b0(Borg1Header *param_1){
  if (param_1->dat->bmp == param_1->bitmapA)
    param_1->dat->bmp = param_1->bitmapB;
  else param_1->dat->bmp = (u8*)param_1->bitmapA;
}

Gfx * borganim_LoadTextureImage(Gfx *gfx,Borg1Header *param_2){
  u32 uVar1;
  s8 depth;
  int iVar4;
  u32 h;
  u32 w;
  s32 i;
  
  gDPPipeSync(gfx++);
  gDPTileSync(gfx++);
  gSPSegment(gfx++,0xb,osVirtualToPhysical(param_2->dat->bmp));
  gSPSegment(gfx++,0xc,osVirtualToPhysical(param_2->dat->pallette));
  u32 totalBmpSize = 0;//total size of all LOD's bitmaps
  depth = GetN64ImageDimension(param_2->dat->type);
  h = (u32)param_2->dat->Width;
  w = (u32)param_2->dat->Height;
  for(i=0;i<=param_2->dat->lods;i++){
      totalBmpSize += GetBitmapSize(h,w,depth);
      h = half(h);
      w = half(w);
  }
  if (B1_RGBA32 < param_2->dat->type) CRASH("borganim.cpp:LoadTextureImage","TEXTURE TYPE NOT SUPPORTED");
  iVar4 = totalBmpSize >> 1;
  switch(param_2->dat->type) {
  //seems the "gDPLoadTextureBlock*"and "gDPLoadTLUT_pal*" macro's got optimized together...
  case B1_RGBA16:
    break;
  case B1_IA16:
    break;
  case B1_CI8:
    h = iVar4 - 1;
    gDPSetTextureImage(gfx++,G_IM_FMT_CI,G_IM_SIZ_8b,1,SEGMENT_ADDR(0xb,0));
    gDPSetTile(gfx++, G_IM_FMT_CI, 0, 0, 0, G_TX_LOADTILE, 0, 0,0, 0, 0, 0, 0);
    gDPLoadSync(gfx++);
    gDPLoadBlock(gfx++,G_TX_LOADTILE,0,0,h,0);
    gDPPipeSync(gfx++);
    gSPSetOtherMode(gfx++,G_SETOTHERMODE_H,29/*?*/,2,G_TT_RGBA16);
    gDPLoadTLUT_pal256(gfx++,SEGMENT_ADDR(0xc,0));
    return gfx;
  case B1_IA8:
    break;
  case B1_I8:
    break;
  case B1_CI4:
    h = ((totalBmpSize << 1) >> 2) - 1;
    gDPSetTextureImage(gfx++,G_IM_FMT_CI,G_IM_SIZ_4b,1,SEGMENT_ADDR(0xb,0));
    gDPSetTile(gfx++, G_IM_FMT_CI, 0, 0, 0, G_TX_LOADTILE, 0, 0,0, 0, 0, 0, 0);
    gDPLoadSync(gfx++);
    gDPLoadBlock(gfx++,G_TX_LOADTILE,0,0,h,0);
    gDPPipeSync(gfx++);
    gSPSetOtherMode(gfx++,G_SETOTHERMODE_H,29/*?*/,2,G_TT_RGBA16);
    gDPLoadTLUT_pal16(gfx++,0,SEGMENT_ADDR(0xc,0));
    return gfx;
  default:
    iVar4 = (totalBmpSize << 1) >> 2;
    break;
  case B1_RGBA32:
    iVar4 = totalBmpSize >> 2;
    gDPSetTextureImage(gfx++,G_IM_FMT_RGBA,G_IM_SIZ_32b,1,SEGMENT_ADDR(0xb,0));
    gDPSetTile(gfx++, G_IM_FMT_RGBA, G_IM_SIZ_32b, 0, 0, G_TX_LOADTILE, 0, 0,0, 0, 0, 0, 0);
    goto LAB_8009db84;
  }
  gDPSetTextureImage(gfx++,G_IM_FMT_RGBA,G_IM_SIZ_16b,1,SEGMENT_ADDR(0xb,0));
  gDPSetTile(gfx++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, 0,0, 0, 0, 0, 0);
LAB_8009db84:
  w = iVar4 - 1;
  gDPLoadSync(gfx++);
  gDPLoadBlock(gfx++,G_TX_LOADTILE,0,0,w,0);
  gDPPipeSync(gfx++);
  gSPSetOtherMode(gfx++,G_SETOTHERMODE_H,29/*?*/,2,G_TT_NONE);
  return gfx;
}

Gfx * loadTextureImage(Gfx *gfx,Borg1Header *b1,Borg2Struct *param_3){
  u32 masks;
  u32 maskt;
  u32 shifts;
  u32 shiftt;
  int iVar10;
  u32 uVar11;
  u32 uVar12;
  u32 x;
  u32 uVar13;
  u16 flag;
  Gfx *pGVar15;
  Gfx *pGVar16;
  u32 line;
  u32 cms;
  u32 i;
  u32 tmem;
  u32 cmt;
  u32 lrt;
  
  if (!param_3) flag = 0;
  else flag = param_3->flags;
  gDPPipeSync(gfx++);
  gDPTileSync(gfx++);
  u16 b1Flag = b1->dat->flag;
  if ((b1Flag & B1_TDDetail) == 0) {
    if ((b1Flag & B1_TDSharpen) == 0) {
        gDPSetTextureDetail(gfx++,G_TD_CLAMP);
      goto LAB_8009dd14;
    }
    uVar12 = G_TD_SHARPEN;
  }
  else uVar12 = G_TD_DETAIL;
  gDPSetTextureDetail(gfx++,uVar12);
LAB_8009dd14:
  if (b1->dat->lods <= 0) {gDPSetTextureLOD(gfx++,G_TL_TILE);}
  else {gDPSetTextureLOD(gfx++,G_TL_LOD);}
  cmt = G_TX_CLAMP;
  cms = (u32)((flag & B2S_ClampY) == 0) << 1;
  if ((flag & B2S_XMirror)) cms |= G_TX_MIRROR;
  if ((flag & B2S_YNoMirror)) cmt |= G_TX_NOMIRROR;
  if ((flag & B2S_YMirror)) cmt |= G_TX_MIRROR;
  Borg1Data *b1Dat = b1->dat;
  x = (u32)b1Dat->Width;
  tmem = 0;
  lrt = (u32)b1Dat->Height;
  for(i=0;i<b1Dat->lods;i++){
    u8 fmt,siz;//1st word of macro got cmd, size, and format optimised together for each case...
    masks = getPow2(x);
    maskt = getPow2(lrt);
    shifts = FUN_8009d3b0((u32)b1Dat->Width,x);
    shiftt = FUN_8009d3b0((u32)b1Dat->Height,lrt);
    switch(b1->dat->type) {
    case B1_RGBA16:
      if ((int)x < 4) iVar10 = 4 - x;
      else {
        iVar10 = 4 - (x & 3);
        if ((x & 3) == 0) iVar10 = 0;
      }
      line = (int)(x + iVar10) >> 2;
      fmt=G_IM_FMT_RGBA;
      siz=G_IM_SIZ_16b;
      break;
    case B1_IA16:
      if ((int)x < 4) {
        iVar10 = 4 - x;
      }
      else {
        iVar10 = 4 - (x & 3);
        if ((x & 3) == 0) iVar10 = 0;
      }
      line = (int)(x + iVar10) >> 2;
      fmt=G_IM_FMT_IA;
      siz=G_IM_SIZ_16b;
      break;
    case B1_CI8:
      if ((int)x < 8) {
        iVar10 = 8 - x;
      }
      else {
        iVar10 = 8 - (x & 7);
        if ((x & 7) == 0) iVar10 = 0;
      }
      line = (int)(x + iVar10) >> 3;
      fmt=G_IM_FMT_CI;
      siz=G_IM_SIZ_8b;
      break;
    case B1_IA8:
      if ((int)x < 8) iVar10 = 8 - x;
      else {
        iVar10 = 8 - (x & 7);
        if ((x & 7) == 0) iVar10 = 0;
      }
      line = (int)(x + iVar10) >> 3;
      fmt=G_IM_FMT_IA;
      siz=G_IM_SIZ_8b;
      break;
    case B1_I8:
      if ((int)x < 8) iVar10 = 8 - x;
      else {
        iVar10 = 8 - (x & 7);
        if ((x & 7) == 0) iVar10 = 0;
      }
      line = (int)(x + iVar10) >> 3;
      fmt=G_IM_FMT_I;
      siz=G_IM_SIZ_8b;
      break;
    case B1_CI4:
      if ((int)x < 0x10) iVar10 = 0x10 - x;
      else {
        iVar10 = 0x10 - (x & 0xf);
        if ((x & 0xf) == 0) iVar10 = 0;
      }
      line = (int)(x + iVar10) >> 4;
      fmt=G_IM_FMT_CI;
      siz=G_IM_SIZ_4b;
      break;
    case B1_IA4:
      if ((int)x < 0x10) iVar10 = 0x10 - x;
      else {
        iVar10 = 0x10 - (x & 0xf);
        if ((x & 0xf) == 0) iVar10 = 0;
      }
      line = (int)(x + iVar10) >> 4;
      fmt=G_IM_FMT_IA;
      siz=G_IM_SIZ_4b;
      break;
    case B1_I4:
      if ((int)x < 0x10) iVar10 = 0x10 - x;
      else {
        iVar10 = 0x10 - (x & 0xf);
        if ((x & 0xf) == 0) iVar10 = 0;
      }
      line = (int)(x + iVar10) >> 4;
      fmt=G_IM_FMT_I;
      siz=G_IM_SIZ_4b;
      break;
    case B1_RGBA32:
      if ((int)x < 2) iVar10 = 2 - x;
      else {
        iVar10 = 2 - (x & 1);
        if ((x & 1) == 0) iVar10 = 0;
      }
      line = (int)(x + iVar10) >> 2;
      fmt=G_IM_FMT_RGBA;
      siz=G_IM_SIZ_32b;
      break;
    default: //yeah, I'm not sure which function is which.
      CRASH("borganim.cpp:LoadTextureImage","TEXTURE TYPE NOT SUPPORTED");
    }
    gDPSetTile(gfx++,fmt,siz,line,tmem,i,0,cmt,maskt,shiftt,cms,masks,shifts);
    gDPSetTileSize(gfx++,i,0,0,x-1,(lrt-1)*4);
    tmem += line * lrt;
    x = half(x);
    lrt = half(lrt);
  }
  return gfx;
}

//TODO: Redo once relevant data is better understood(?)
Gfx * Ofunc_8009e228(Gfx *g,SceneData *param_2,int param_3){
  Gfx *pGVar1;
  u32 uVar2;
  void *pvVar3;
  int iVar4;
  u32 *puVar5;
  
  if (*(int *)((int)param_2->unk58 + 0x3c) == 0) {
    gSPSegment(g++,0xA,osVirtualToPhysical(*(void **)((int)param_2->unk58 + 0x34)));
  }
  else {
    gSPSegment(g++,0xA,osVirtualToPhysical(*(void **)((int)(void *)((int)param_2->unk58 + param_3 * 4) + 0x34)));
  }
  pvVar3 = param_2->unk58;
  puVar5 = *(u32 **)((int)pvVar3 + 0x2c);
  for (iVar4 = *(int *)((int)pvVar3 + 4); iVar4 != 0; iVar4 += -1) {
    gSPDisplayList(g++,osVirtualToPhysical((void *)*puVar5));
    pvVar3 = (void *)*puVar5;
    puVar5++;
  }
  return g;
}

#define DtoR_f 0.017453292f //a few more decimals used for these funcs.

void Borg5Transform_op0(Borg5Transform *t,MtxF *mf){
  float sinx;
  float siny;
  float sinz;

  float cosx;
  float cosy;
  float cosz;
  
  cosy = (t->rot).x * DtoR_f;
  cosx = (t->rot).y * DtoR_f;
  cosz = (t->rot).z * DtoR_f;
  sinx = __sinf(cosx);
  cosx = __cosf(cosx);
  siny = __sinf(cosy);
  cosy = __cosf(cosy);
  sinz = __sinf(cosz);
  cosz = __cosf(cosz);
  (*mf)[2][1] = -sinx * (t->scale).z;
  (*mf)[0][0] = (cosy * cosz + siny * sinx * sinz) * (t->scale).x;
  (*mf)[1][0] = (-cosy * sinz + siny * sinx * cosz) * (t->scale).y;
  (*mf)[1][2] = (siny * sinz + cosy * sinx * cosz) * (t->scale).y;
  (*mf)[2][0] = siny * cosx * (t->scale).z;
  (*mf)[0][1] = cosx * sinz * (t->scale).x;
  (*mf)[1][1] = cosx * cosz * (t->scale).y;
  (*mf)[0][2] = (-siny * cosz + cosy * sinx * sinz) * (t->scale).x;
  (*mf)[2][2] = cosy * cosx * (t->scale).z;
  (*mf)[3][0] = (t->pos).x;
  (*mf)[3][1] = (t->pos).y;
  (*mf)[3][2] = (t->pos).z;
  (*mf)[0][3] = 1.0f;
  (*mf)[1][3] = 1.0f;
  (*mf)[2][3] = 1.0f;
  (*mf)[3][3] = 1.0f;
}

void Borg5Transform_op1(Borg5Transform *t,MtxF *mf){
  float sinx = __sinf((t->rot).x * DtoR_f);
  float cosx = __cosf((t->rot).x * DtoR_f);
  float siny = __sinf((t->rot).y * DtoR_f);
  float cosy = __cosf((t->rot).y * DtoR_f);
  float sinz = __sinf((t->rot).z * DtoR_f);
  float cosz = __cosf((t->rot).z * DtoR_f);
  float fVar8 = cosz * cosy * (t->scale).x;
  float fVar5 = sinz * cosy * (t->scale).x;
  float fVar4 = (-sinz * cosx + cosz * siny * sinx) * (t->scale).y;
  float fVar6 = (sinz * sinx + cosz * siny * cosx) * (t->scale).z;
  float fVar15 = cosy * sinx * (t->scale).y;
  float fVar13 = cosy * cosx * (t->scale).z;
  float fVar7 = (cosz * cosx + sinz * siny * sinx) * (t->scale).y;
  (*mf)[0][2] = -siny * (t->scale).x;
  (*mf)[0][0] = fVar8;
  (*mf)[0][1] = fVar5;
  (*mf)[1][0] = fVar4;
  float fVar9 = (-cosz * sinx + sinz * siny * cosx) * (t->scale).z;
  (*mf)[2][0] = fVar6;
  (*mf)[1][2] = fVar15;
  (*mf)[2][2] = fVar13;
  (*mf)[1][1] = fVar7;
  (*mf)[2][1] = fVar9;
  (*mf)[3][0] = (t->pos).x - (fVar8 * (t->pivot).x + fVar4 * (t->pivot).y + fVar6 * (t->pivot).z);
  (*mf)[3][1] = (t->pos).y - (fVar5 * (t->pivot).x + fVar7 * (t->pivot).y + fVar9 * (t->pivot).z);
  (*mf)[3][2] = (t->pos).z - (-siny * (t->scale).x * (t->pivot).x + fVar15 * (t->pivot).y + fVar13 * (t->pivot).z);
  (*mf)[0][3] = 1.0;
  (*mf)[1][3] = 1.0;
  (*mf)[2][3] = 1.0;
  (*mf)[3][3] = 1.0;
}


void Borg5Transform_op2(Borg5Transform *t,MtxF *mf){  
  float sinx = __sinf(-(t->rot).x * DtoR_f);
  float cosx = __cosf(-(t->rot).x * DtoR_f);
  float siny = __sinf(-(t->rot).y * DtoR_f);
  float cosy = __cosf(-(t->rot).y * DtoR_f);
  float sinz = __sinf(-(t->rot).z * DtoR_f);
  float cosz = __cosf(-(t->rot).z * DtoR_f);
  (*mf)[0][2] = sinx;
  (*mf)[2][2] = cosx * cosy;
  (*mf)[0][0] = cosz * cosx;
  (*mf)[0][1] = -sinz * cosx;
  (*mf)[1][2] = -cosx * siny;
  (*mf)[1][0] = sinz * cosy + cosz * sinx * siny;
  (*mf)[2][0] = sinz * siny - cosz * sinx * cosy;
  (*mf)[1][1] = cosz * cosy - sinz * sinx * siny;
  (*mf)[2][1] = cosz * siny + sinz * sinx * cosy;
  (*mf)[3][0] = (t->pos).x;
  (*mf)[3][1] = (t->pos).y;
  (*mf)[3][2] = (t->pos).z;
  (*mf)[0][3] = (t->scale).x;
  (*mf)[1][3] = (t->scale).y;
  (*mf)[2][3] = (t->scale).z;
  (*mf)[3][3] = 1.0f;
}

void some_matrix_func(MtxF *mf,float posX,float posY,float posZ,float posX2,float posY2,
                     float posZ2,float param_8,float param_9,float param_10){
  float fVar1;
  vec3f distNorm,fStack184,crossProd;
  
  distNorm.x = posX - posX2;
  distNorm.y = posY - posY2;
  distNorm.z = posZ - posZ2;
  guNormalize(&distNorm.x,&distNorm.y,&distNorm.z);
  fStack184.x = param_9 * distNorm.z - param_10 * distNorm.y;
  fStack184.y = param_10 * distNorm.x - param_8 * distNorm.z;
  fStack184.z = param_8 * distNorm.y - param_9 * distNorm.x;
  fVar1 = _sqrtf(SQ(fStack184.x) + SQ(fStack184.y)+SQ(fStack184.z));
  if (0.000001 <= fVar1) {
    fVar1 = 1.0 / fVar1;
    vec3f_800f3384.y = fStack184.y * fVar1;
    vec3f_800f3384.x = fStack184.x * fVar1;
    vec3f_800f3384.z = fStack184.z * fVar1;
  }
  fStack184.x = vec3f_800f3384.x;
  fStack184.y = vec3f_800f3384.y;
  fStack184.z = vec3f_800f3384.z;
  Vec3Cross(&crossProd,&distNorm,&fStack184);
  (*mf)[3][0] = posX;
  (*mf)[3][1] = posY;
  (*mf)[3][2] = posZ;
  (*mf)[0][3] = 0.0;
  (*mf)[1][3] = 0.0;
  (*mf)[2][3] = 0.0;
  (*mf)[0][0] = fStack184.x;
  (*mf)[0][1] = fStack184.y;
  (*mf)[0][2] = fStack184.z;
  (*mf)[1][0] = crossProd.x;
  (*mf)[1][1] = crossProd.y;
  (*mf)[1][2] = crossProd.z;
  (*mf)[2][0] = distNorm.x;
  (*mf)[2][1] = distNorm.y;
  (*mf)[2][2] = distNorm.z;
  (*mf)[3][3] = 1.0f;
}

void Borg5Transform_op3(Borg5Transform *t,MtxF *param_2){
  vec3f outV,inV;
  MtxF rotMtx;
  
  inV.x = 0.0;
  inV.y = 0.0;
  inV.z = 1.0f;
  guRotateRPYF(&rotMtx,(t->rot).y,(t->rot).x,0.0);
  MtxXFMF(&outV,&rotMtx,&inV);
  (*param_2)[0][3] = 1.0f;
  (*param_2)[1][3] = 1.0f;
  (*param_2)[2][3] = 1.0f;
  (*param_2)[3][3] = 1.0f;
  (*param_2)[0][0] = 0.0;
  (*param_2)[0][1] = 0.0;
  (*param_2)[0][2] = 0.0;
  (*param_2)[1][0] = 0.0;
  (*param_2)[1][1] = 0.0;
  (*param_2)[1][2] = 0.0;
  (*param_2)[3][0] = 0.0;
  (*param_2)[3][1] = 0.0;
  (*param_2)[3][2] = 0.0;
  (*param_2)[2][0] = outV.x;
  (*param_2)[2][1] = outV.y;
  (*param_2)[2][2] = outV.z;
}


void Borg5Transform_op4(Borg5Transform *t,MtxF *param_2){
  float fVar1;
  float fVar2;
  float fVar3;
  vec3f fStack232;
  vec3f fStack168;
  MtxF afStack104;
  
  fStack232.x = 0.0;
  fStack232.y = 0.0;
  fStack232.z = 1.0f;
  guRotateRPYF(&afStack104,(t->rot).y,(t->rot).x,0.0);
  MtxXFMF(&fStack168,&afStack104,&fStack232);
  fStack232.x = 0.0;
  fVar3 = (t->pos).x - fStack168.x;
  fStack232.y = 1.0f;
  fStack232.z = 0.0;
  fVar2 = (t->pos).y - fStack168.y;
  fVar1 = (t->pos).z - fStack168.z;
  guRotateRPYF(&afStack104,0.0,0.0,(t->rot).z);
  MtxXFMF(&fStack168,&afStack104,&fStack232);
  some_matrix_func(param_2,(t->pos).x,(t->pos).y,(t->pos).z,
    fVar3,fVar2,fVar1,fStack168.x,fStack168.y,fStack168.z);
}


void Borg5Transform_ops(Borg5Transform *t,MtxF *param_2){
  switch(t->mtxOp) {
  case 0:
    Borg5Transform_op0(t,param_2);break;
  case 1:
    Borg5Transform_op1(t,param_2);break;
  case 2:
    Borg5Transform_op2(t,param_2);break;
  case 3:
    Borg5Transform_op3(t,param_2);break;
  case 4:
    Borg5Transform_op4(t,param_2);
  }
}


void FUN_8009ed9c(MtxF *in,MtxF *out){
  (*out)[0][0] = (*in)[0][0] * (*in)[0][3];
  (*out)[0][1] = (*in)[0][1] * (*in)[0][3];
  (*out)[0][2] = (*in)[0][2] * (*in)[0][3];
  (*out)[1][0] = (*in)[1][0] * (*in)[1][3];
  (*out)[1][1] = (*in)[1][1] * (*in)[1][3];
  (*out)[1][2] = (*in)[1][2] * (*in)[1][3];
  (*out)[2][0] = (*in)[2][0] * (*in)[2][3];
  (*out)[2][1] = (*in)[2][1] * (*in)[2][3];
  (*out)[2][2] = (*in)[2][2] * (*in)[2][3];
  (*out)[3][0] = (*in)[3][0];
  (*out)[3][1] = (*in)[3][1];
  (*out)[0][3] = 0.0;
  (*out)[1][3] = 0.0;
  (*out)[2][3] = 0.0;
  (*out)[3][2] = (*in)[3][2];
  (*out)[3][3] = 1.0;

}
//copy mtxf(if different) and set pos to {1,1,1}
void FUN_8009ee48(MtxF *in,MtxF *out){
  if (out != in) {MTXCPY(*out,*in);}
  (*out)[0][3] = 1.0f;
  (*out)[1][3] = 1.0f;
  (*out)[2][3] = 1.0f;
}


void FUN_8009ee98(Borg5Transform *t,MtxF *param_2){
  Borg5Transform *pbVar1;
  u32 uVar2;
  Borg5Transform **ppbVar3;
  MtxF auStack80;
  
  Borg5Transform_ops(t,&MtxF_800f54b0);
  some_matrix_func_1(&auStack80,param_2,&MtxF_800f54b0);
  FUN_8009ed9c(&auStack80,t->unkStruct->mfs + 1);
  ppbVar3 = t->links;
  uVar2 = (u32)t->tier;
  t->flag = t->flag & ~2 | 0x10;
  pbVar1 = *ppbVar3;
  while(uVar2){
      uVar2--;
      ppbVar3++;
      FUN_8009ee98(pbVar1,&auStack80);
      pbVar1 = *ppbVar3;
    }
}

void FUN_8009ef34(SceneData *param_1){
  if (!(param_1->flags & SCENE_0004)) {guMtxIdentF(&some_mtx);}
  else {MTXCPY(some_mtx,param_1->matrixA);}
  FUN_8009f060(param_1,&some_mtx);
  param_1->sceneTicked = true;
}


void Ofunc_8009efd0(SceneData *param_1,MtxF *param_2){
  if (!(param_1->flags & SCENE_0004)) {MTXCPY(unused_matrix,*param_2);}
  else ofunc_sub_800abd94(&unused_matrix,param_2,&param_1->matrixA);
  FUN_8009f060(param_1,&unused_matrix);
}

void FUN_8009f060(SceneData *param_1,MtxF *param_2){
  float fVar1;
  Borg5Struct2 *pBVar3;
  ;
  float (*pafVar5) [4];
  MtxF *paafVar6;
  float (*pafVar7) [4];
  MtxF *paafVar8;
  MtxF *paafVar9;
  int iVar10;
  int iVar11;
  Borg5Transform *pbVar12;
  Borg5Transform *pbVar13;
  MtxF mf0;
  MtxF mf1;
  MtxF mf2;
  MtxF mf3;
  MtxF mf5;
  MtxF mf6;
  
  pafVar5 = mf0;
  pafVar7 = param_2[1];
  Borg5Data *pBStack_40 = &(param_1->borg5)->dat;
  MTXCPY(mf0,*param_2);
  FUN_8009ee48(&mf0,&mf0);
  pbVar12 = pBStack_40->transforms;
  iVar11 = pBStack_40->transformCount;
  if (pBStack_40->borg3P) {
    if ((param_1->flags & SCENE_0040) == 0) {
      if ((param_1->flags & SCENE_0008) == 0) {
        if ((param_1->flags & SCENE_0010) == 0) {
          Borg5Transform_ops(pbVar12,&mf2);
          some_matrix_func_1(&mf5,&mf0,&mf2);
        }
        else {
          Borg5Transform_ops(pbVar12,&param_1->matrixB);
          FUN_8009ee48(&param_1->matrixB,&mf5);
        }
      }
      else if ((param_1->flags & SCENE_0010) == 0) {
        Borg5Transform_ops(pbVar12,&mf2);
        FUN_8009ee48(&param_1->matrixB,&mf1);
        some_matrix_func_1(&mf5,&mf2,&mf1);
      }
      else {
        FUN_8009ee48(&param_1->matrixB,&mf5);
      }
      FUN_8009ed9c(&mf5,pbVar12->unkStruct->mfs + 1);
      MTXCPY(pbVar12->unkStruct->mfs[0],pbVar12->unkStruct->mfs[1]);
      MTXCPY(param_1->matrixB,pbVar12->unkStruct->mfs[0]);
      FUN_800ab880(pbVar12->unkStruct->mfs + 1,&param_1->matrixC);
      pBVar3 = pbVar12->unkStruct;
      pBVar3->mfs[0][3][0] *= 16.0f;
      pBVar3->mfs[0][3][1] *= 16.0f;
      pBVar3->mfs[0][3][2] *= 16.0f;
      FUN_800ab880(pBVar3->mfs,&param_1->matrixD);
      Borg3Header *b3 = pBStack_40->borg3P;
      pbVar12->flag |= 2;
      guPerspectiveF(&mf6,b3->perspnorm + param_1->perspNormIndex,b3->dat.fovy,
                      b3->dat.aspect,b3->dat.nearplane * 16.0f,b3->dat.farplane * 16.0f,2.0);
      MTXCPY(param_1->matrixE,mf6);
      some_other_matrix_math(&mf3,&mf6,&param_1->matrixD);
      if ((param_1->flags & SCENE_4000) == 0) guMtxF2L(&mf3,(b3->dat).mtx_[param_1->perspNormIndex]);
      else guMtxF2L(&mf6,&(b3->dat).mtx_[param_1->perspNormIndex]);
    }
    pbVar12++;
    iVar11--;
  }
  iVar10 = pBStack_40->borg4Count + -1;
  if ((pBStack_40->borg4Count != 0) && (iVar10 != 0)) {
    pbVar13 = pbVar12;
    do {
      if ((param_1->flags & SCENE_0020) == 0) {
        Borg5Transform_ops(pbVar13,&mf2);
        some_matrix_func_1(&mf3,&mf0,&mf2);
      }
      else Borg5Transform_ops(pbVar13,&mf3);
      pbVar12++;
      iVar11--;
      FUN_8009ed9c(&mf3,pbVar13->unkStruct->mfs);
      iVar10--;
      MTXCPY(pbVar13->unkStruct->mfs[1],pbVar13->unkStruct->mfs[0]);
      pbVar13->flag |= 2;
      pbVar13 = pbVar12;
    } while (iVar10 != 0);
  }
  for (; iVar11 != 0; iVar11--,pbVar12++) {
    if ((pbVar12->flag & 0x100)) FUN_8009ee98(pbVar12,&mf0);
  }
}


void Ofunc_8009f4e0(SceneData *param_1){
  Borg5Header *pBVar2;
  Borg5Transform *pbVar3;
  int i;
  
  pBVar2 = param_1->borg5;
  pbVar3 = (pBVar2->dat).transforms;
  i = (pBVar2->dat).transformCount;
  if (0 < i) {
    do {
      if ((pbVar3->flag & 2)) {
        guMtxF2L(pbVar3->unkStruct->mfs,&pbVar3->unkStruct->mtxs[param_1->perspNormIndex]);
      }
      i--;
      pbVar3++;
    } while (i != 0);
  }
}
void Ofunc_8009f554(SceneData *param_1,vec3f *param_2){
  Borg5Header *pBVar1;
  Borg5Struct2 *pBVar2;
  Borg5Transform *pbVar4;
  int iVar5;  
  pBVar1 = param_1->borg5;
  pbVar4 = (pBVar1->dat).transforms;
  iVar5 = (pBVar1->dat).transformCount;
  if (0 < iVar5) {
    do {
      iVar5--;
      if ((pbVar4->flag & 2)) {
        Borg5Struct2 *pBVar2 = pbVar4->unkStruct;
        pBVar2->mfs[1][3][0] += param_2->x;
        pBVar2->mfs[1][3][1] += param_2->y;
        pBVar2->mfs[1][3][2] += param_2->z;
        pBVar2->mfs[0][3][0] += param_2->x * 16.0f;
        pBVar2->mfs[0][3][1] += param_2->y * 16.0f;
        pBVar2->mfs[0][3][2] += param_2->z * 16.0f;
      }
      pbVar4++;
    } while (iVar5 != 0);
  }

}

void Ofunc_8009f608(SceneData *param_1){
  Borg5Header *pBVar1 = param_1->borg5;
  Borg5Transform *pbVar4 = (pBVar1->dat).transforms;
  for (s32 i = (pBVar1->dat).transformCount; i != 0; i--,pbVar4++) {
    Borg5Struct2 *pBVar2 = pbVar4->unkStruct;
    (pBVar2->unk17c).x = pBVar2->mfs[1][3][0] - (pBVar2->unk170).x;
    (pBVar2->unk17c).y = pBVar2->mfs[1][3][1] - (pBVar2->unk170).y;
    (pBVar2->unk17c).z = pBVar2->mfs[1][3][2] - (pBVar2->unk170).z;
  }
}

void Ofunc_8009f664(SceneData *param_1){
  Borg5Transform *pbVar4 = (param_1->borg5->dat).transforms;
  for (s32 i = (param_1->borg5->dat).transformCount; i != 0; i--) {
    (pbVar4->unkStruct->unk17c).x = 0.0;
    (pbVar4->unkStruct->unk17c).y = 0.0;
    (pbVar4->unkStruct->unk17c).z = 0.0;
    (pbVar4->unkStruct->unk170).x = pbVar4->unkStruct->mfs[1][3][0];
    (pbVar4->unkStruct->unk170).y = pbVar4->unkStruct->mfs[1][3][1];
    (pbVar4->unkStruct->unk170).z = pbVar4->unkStruct->mfs[1][3][2];
    pbVar4++;
  }
}

void FUN_8009f6b4(SceneData *param_1,Borg6Header *param_2){
  u32 uVar1;
  Borg6Struct1 *pBVar2;
  void *pvVar4;
  int iVar5;
  Borg5Header *pbVar6;
  void *bDat;
  Borg5Transform *pbVar7;
  Borg6Struct4 *pBVar8;
  
  if ((param_2) && ((param_2->flag & 1) == 0)) {
    pBVar8 = param_2->struct4;
    uVar1 = param_2->dat->struct1Count;
    param_2->sceneDat = param_1;
    for(s32 i = 0;i<uVar1;i++,pBVar8++){
        pBVar2 = pBVar8->struct1;
        pbVar6 = (Borg5Header *)getLoadedBorg(pBVar2->borgInd);
        switch(pBVar2->type){
          case 0:{
            switch(get_borg_listing_type(pBVar2->borgInd)) {
            case 0:
              bDat = (void *)((int)pBVar8->unk10 + sizeof(borgHeader));
              break;
            case 1:
              bDat = ((Borg1Header*)pBVar8->unk10)->dat;
              break;
            case 2:
              bDat = ((Borg2Header*)pBVar8->unk10)->dat;
              break;
            case 3:
              bDat = &((Borg3Header*)pBVar8->unk10)->dat;
              break;
            case 4:
              bDat = &((Borg4Header*)pBVar8->unk10)->dat;
              break;
            case 5:
              bDat = &((Borg5Header*)pBVar8->unk10)->dat;
              break;
            case 6:
              bDat = ((Borg6Header*)pBVar8->unk10)->dat;
              break;
            default:
              goto switchD_8009f784_caseD_7;
            }
            pBVar8->unk10 = (void *)((int)bDat + (int)pbVar6);
switchD_8009f784_caseD_7:
            pBVar2->borgInd = (u32)pbVar6;
            break;
          }
          case 1:{
            pbVar7 = ((param_1->borg5)->dat).transforms + (int)pBVar8->unk10;
            pBVar8->unk10 = pbVar7;
            pBVar2->borgInd = (u32)pbVar7;
            break;
          }
          case 2:{
            pvVar4 = pBVar8->unk10;
            iVar5 = pbVar6[1].head.unk; //???
            pBVar2->borgInd = (u32)pbVar6;
            pBVar8->unk10 = (void *)(*(int *)(iVar5 + 0x40) + (int)pvVar4 * 0x14 + 4);
            break;
          }
          case 3:{
            pBVar2->borgInd = (u32)pbVar6;
            break;
          }
        }
      }
    param_2->flag |= 1;
  }
}

void Scene_SetBorg6(SceneData *scene,Borg6Header *b6){
  if ((b6->flag & 1) == 0) {
    FUN_8009f6b4(scene,b6);
  }
  Borg6Header *pBVar1 = scene->borg6;
  if (pBVar1 == NULL) {
    scene->borg6 = b6;
  }
  else {
    b6->link2 = pBVar1;
    (scene->borg6)->link = b6;
    scene->borg6 = b6;
  }
}

void unlinkBorg6(Borg6Header *param_1){
  SceneData *pSVar1;
  Borg6Header *pBVar2;
  
  if ((param_1 != NULL) && (pSVar1 = param_1->sceneDat, pSVar1 != NULL)) {
    if (param_1->link == NULL) {
      pBVar2 = param_1->link2;
    }
    else {
      param_1->link->link2 = param_1->link2;
      pBVar2 = param_1->link2;
    }
    if (pBVar2 == NULL) {
      pBVar2 = pSVar1->borg6;
    }
    else {
      pBVar2->link = param_1->link;
      pBVar2 = pSVar1->borg6;
    }
    if (param_1 == pBVar2) {
      pSVar1->borg6 = param_1->link2;
      param_1->link2 = NULL;
    }
    else {
      param_1->link2 = NULL;
    }
    param_1->link = NULL;
  }
  return;
}

void Ofunc_8009f938(Borg5Header *param_1,s32 param_2,int param_3,s32 param_4,int param_5){
  int iVar2;
  
  Borg3Header *b3 = param_1->dat.borg3P;
  if (b3) {
    (b3->dat).viewportP->vp.vtrans[0] = ((param_2 + param_4) / 2);
    (b3->dat).viewportP->vp.vtrans[1] = ((param_3 + param_5) / 2);
    if (param_2 < param_4) iVar2 = param_4 - param_2;
    else iVar2 = param_2 - param_4;
    (b3->dat).viewportP->vp.vscale[0] = (iVar2 / 2);
    if (param_3 < param_5) iVar2 = param_5 - param_3;
    else iVar2 = param_3 - param_5;
    (b3->dat).viewportP->vp.vscale[1] = (iVar2 / 2);
  }
}

void FUN_8009f9d0(SceneData *param_1,Vp *param_2){
  Borg3Header *b3 = param_1->borg5->dat.borg3P;
  if (b3) (b3->dat).viewportP = param_2;
}

SceneData * BorgAnimLoadScene(u32 borg_5){
  Borg5Header *pBVar1;
  bool bVar2;
  SceneData *ret;
  Borg5Header *b5;
  Borg2Header **ppBVar4;
  int j;
  
  ALLOC(ret,2759);
  CLEAR(ret);
  ret->locatorScene1 = NULL;
  ret->locatorScene2 = NULL;
  setBorgFlag();
  b5 = (Borg5Header *)getBorgItem(borg_5);
  ret->borg5 = b5;
  if (b5 == NULL) {
    HFREE(ret,2779);
    CRASH("BorgAnimLoadScene","GetBorgItem failed");
  }
  ret->sceneTicked = false;
  ret->flags = 0;
  ret->perspNormIndex = 0;
  ret->aniTime = 1;
  ret->aniSpeed = 0;
  ret->borg6 = NULL;
  guMtxIdentF(&ret->matrixA);
  guMtxIdentF(&ret->matrixB);
  (ret->colorFloats).x = 1.0f;
  (ret->colorFloats).y = 1.0f;
  (ret->colorFloats).z = 1.0f;
  (ret->colorFloats).w = 1.0f;
  CLEAR(&ret->DirLights);
  CLEAR(&ret->envLight);
  pBVar1 = ret->borg5;
  ret->maxLights = 0;
  ret->currLights = 0;
  for(u8 i=0;i<7;i++){
    bVar2 = false;
    j = 0;
    if (0 < (pBVar1->dat).borg2Count) {
      ppBVar4 = (pBVar1->dat).borg2p;
      while( true ) {
        if ((ppBVar4[j]->dat->unk0x24).A == i) {
          bVar2 = true;
        }
        else j++;
        if (bVar2) goto LAB_8009fb4c;
        if ((pBVar1->dat).borg2Count <= j) break;
        ppBVar4 = (pBVar1->dat).borg2p;
      }
    }
    if (bVar2) {
LAB_8009fb4c:
      ret->locators[i] = j;
    }
    else ret->locators[i] = -1;
  }
  (ret->scalar).x = 1.0;
  (ret->scalar).y = 1.0;
  (ret->scalar).z = 1.0;
  sprintf(ret->borg5_char,"%i",borg_5);
  return ret;
}

void borganim_free(SceneData *param_1){
  borg5_free(param_1->borg5);
  HFREE(param_1,2870);
}

Borg6Header * loadBorg6(int param_1){
  clearBorgFlag();
  return (Borg6Header *)getBorgItem(param_1);
}

void passto_borg_6_free(Borg6Header *param_1){borg_6_free(param_1);}

Borg7Header * loadBorg7(u32 index,ParticleHeadStruct *param_2){
  setBorgFlag();
  Borg7Header *ret = (Borg7Header *)getBorgItem(index);
  if ((ret->dat).subCount){
    ret->sceneDat = BorgAnimLoadScene(ret->unk18->b6->dat->borg5);
  }
  ret->sceneDat->particleHead = param_2;
  Borg7_StartParticles(ret);
  return ret;
}

void FUN_8009fca8(Borg7Header *param_1){
  if (param_1->sceneDat)
    Particle::UnsetSceneEmmiter(param_1->sceneDat->particleHead,param_1->sceneDat);
  for(s32 i=0;i<param_1->dat.subCount;i++){
    if(param_1->dat.sub[i].flag&2) unlinkBorg6(param_1->unk18[i].b6);
  }
  borganim_free(param_1->sceneDat);
  borg7_free(param_1);
}

void FUN_8009fd40(Borg7Header *param_1){
  if ((param_1->unk1c->sub->flag & 2) == 0) {
    Scene_SetBorg6(param_1->sceneDat,param_1->unk1c->b6);
    param_1->unk1c->sub->flag|= 2;
  }
}

void FUN_8009fd98(Borg7Header *param_1){
  if ((param_1->unk1c->sub->flag & 2) != 0) {
    unlinkBorg6(param_1->unk1c->b6);
    param_1->unk1c->sub->flag&=~2;
  }
}

void FUN_8009fdec(Borg7Header *param_1){FUN_800a0a08(param_1->sceneDat);}

void takeBranch(Borg7Header *param_1,Borg7Struct2 *param_2){
  Borg7Struct1 *pBVar1;
  u32 index;
  struct_1 *psVar2;
  u32 bVar3;
  int iVar4;
  int iVar5;
  Borg6Header *pBVar6;
  u32 *puVar7;
  Borg6Header **ppBVar8;
  bool bVar9;
  u32 uVar10;
  Borg7AnimChache *psVar11;
  
  if (3 < animChache) CRASH("TakeBranch","AnimCache out of range");
  FUN_8009fd98(param_1);
  bVar9 = false;
  uVar10 = 0;
  param_1->unk1c->b6 = NULL;
  pBVar1 = param_1->unk18[param_2->unk3].sub;
  psVar11 = &param_1->aniChache;
  param_1->unk1c = param_1->unk18 + param_2->unk3;
  index = pBVar1->borg6;
  if (animChache != 0) {
    puVar7 = (param_1->aniChache).indecies;
    bVar3 = *puVar7;
    while( true ) {
      if (bVar3 == index) bVar9 = true;
      else {
        puVar7++;
        uVar10++;
      }
      if (bVar9) goto LAB_8009ffd4;
      if (animChache <= uVar10) break;
      bVar3 = *puVar7;
    }
  }
  if (bVar9) {
LAB_8009ffd4:
    param_1->unk1c->b6 = psVar11->anis[uVar10];
  }
  else {
    if (psVar11->anis[animChache - 1] != NULL) {
      iVar4 = get_memUsed();
      borg_6_free(psVar11->anis[animChache - 1]);
      iVar5 = get_memUsed();
      psVar11->anis[animChache - 1] = NULL;
      borg_mem[7] -= iVar5 - iVar4;
      psVar11->anis[animChache + 2] = NULL;
    }
    iVar4 = animChache - 1;
    if (iVar4 != 0) {
      ppBVar8 = psVar11->anis + (animChache - 1);
      do {
        iVar4--;
        *ppBVar8 = ppBVar8[-1];
        ppBVar8[3] = ppBVar8[2];
        ppBVar8 = ppBVar8 + -1;
      } while (iVar4 != 0);
    }
    clearBorgFlag();
    iVar4 = get_memUsed();

    psVar11->anis[0] = (Borg6Header *)getBorgItem(index);
    iVar5 = get_memUsed();
    psVar2 = param_1->unk1c;
    (param_1->aniChache).indecies[0] = index;
    borg_mem[7] += iVar5 - iVar4;
    psVar2->b6 = psVar11->anis[0];
  }
  FUN_8009fd40(param_1);
  FUN_8009fdec(param_1);
}

void animate_borg7(Borg7Header *param_1){
  if ((param_1->unk1c->sub->flag & 2) == 0) FUN_8009fd40(param_1);
  Scene::SetSpeed(param_1->sceneDat,1);
}

bool Borg7_AnimationExpired(Borg7Header *param_1){
  return param_1->unk1c->b6->dat->aniLength <= param_1->sceneDat->aniTime;
}

void FUN_800a0088(){}

void Borg7_SetAnimation(Borg7Header *param_1,u16 param_2){
  Borg7Struct1 *pBVar1 = param_1->unk1c->sub;
  Borg7Struct2 *pbVar2 = pBVar1->p;
  for(s32 i=pBVar1->subSubCount;param_2 != pbVar2->ani;i--,pbVar2++) {
    if(!i) return; //animation was not in range.
  }
  param_1->currentAni = param_2;
}

//Advance Borg7's animation by 1 tick
bool FUN_800a00d0(Borg7Header *param_1){
  int rand;
  vec3f scenePos;
  
  if (!UINT_800f3390) UINT_800f3390 = true; //?
  bool bVar3 = false;
  Borg7Struct1 *pBVar2 = param_1->unk1c->sub;
  if (Borg7_AnimationExpired(param_1)) {
    Borg7Struct2 *pbVar9 = pBVar2->p;
    rand = gBorg7Rand.Range(0,99);
    bool bVar6 = false;
    for (s32 i = pBVar2->subSubCount; i != 0;i--,pbVar9++) {
      if ((param_1->currentAni == (u16)pbVar9->ani)||(pbVar9->ani == 0xff)) {
        rand -= (u32)pbVar9->unk1;
        if (rand < 1) {
          bVar3 = true;
          takeBranch(param_1,pbVar9);
          bVar6 = true;
          break;
        }
      }
    }
    if (!bVar6) {
      bVar3 = true;
      FUN_8009fdec(param_1);
    }
LAB_800a0220:
    Borg7_StartParticles(param_1);
  }
  else if (param_1->prevAni == param_1->currentAni) {
    animate_borg7(param_1);
    Scene::Tick(param_1->sceneDat);
  }
  else {
    Borg7Struct2 *pbVar10 = pBVar2->p;
    rand = gBorg7Rand.Range(0,99);
    for(s16 i=pBVar2->subSubCount;i!=0;i--,pbVar10++){
      if (param_1->currentAni == pbVar10->ani) {
        if ((pBVar2->p->flag & 1)){
          rand -= pbVar10->unk1;
          if (rand < 1) {
            bVar3 = true;
            takeBranch(param_1,pbVar10);
            goto LAB_800a0220;
          }
        }
      }
    }
  }
  param_1->prevAni = param_1->currentAni;
  param_1->currentAni = param_1->nextAni;
  FUN_800a80ac(param_1->sceneDat,&scenePos,(param_1->dat).unk0);
  if ((param_1->unk12 == 0)&&(!bVar3)) {
    (param_1->unk2c).x = scenePos.x - (param_1->unk20).x;
    (param_1->unk2c).y = scenePos.y - (param_1->unk20).y;
    (param_1->unk2c).z = scenePos.z - (param_1->unk20).z;
  }
  else {
    (param_1->unk2c).x = 0.0;
    (param_1->unk2c).y = 0.0;
    (param_1->unk2c).z = 0.0;
  }
  if (!bVar3) {
    if (param_1->unk12 == 0) param_1->unk12=2;
    else param_1->unk12--;
  }
  (param_1->unk20).x = scenePos.x;
  (param_1->unk20).y = scenePos.y;
  (param_1->unk20).z = scenePos.z;
  return bVar3;
}

//Advance Borg7's animation by (delta) ticks
bool Borg7_TickAnimation(Borg7Header *param_1,int delta){
  Borg7Struct1 *pBVar1;
  u32 i_00;
  bool bVar2;
  bool bVar4;
  int rand;
  s32 lVar5;
  Borg7Struct2 *pbVar6;
  int i;
  vec3f local_60;
  
  if (!UINT_800f3394) UINT_800f3394 = true; //?
  i = 0;
  bVar2 = false;
  pBVar1 = param_1->unk1c->sub;
  if (0 < delta) {
    do {
      if (Borg7_AnimationExpired(param_1)) {
        pbVar6 = pBVar1->p;
        rand = gAniRandSeed.Range(0,99);
        bVar4 = false;
        for (lVar5 =pBVar1->subSubCount; lVar5 != 0;lVar5--) {
          if ((param_1->currentAni == (u16)pbVar6->ani) || (pbVar6->ani == 0xff)) {
            rand -= (u32)pbVar6->unk1;
            if (rand < 1) {
              bVar2 = true;
              takeBranch(param_1,pbVar6);
              bVar4 = true;
              break;
            }
          }
          pbVar6++;
        }
        if (!bVar4) {
          bVar2 = true;
          FUN_8009fdec(param_1);
        }
LAB_800a046c:
        Borg7_StartParticles(param_1);
      }
      else if (param_1->prevAni == param_1->currentAni) {
        if ((param_1->unk1c->sub->flag & 2) == 0) {
          FUN_8009fd40(param_1);
        }
        Scene::SetSpeed(param_1->sceneDat,1);
        Scene::Tick(param_1->sceneDat);
      }
      else {
        pbVar6 = pBVar1->p;
        rand = gAniRandSeed.Range(0,99);
        lVar5 = pBVar1->subSubCount;
        while (lVar5 != 0) {
          lVar5--;
          if ((param_1->currentAni == (u16)pbVar6->ani) && ((pbVar6->flag & 1))) {
            rand -= (u32)pbVar6->unk1;
            if (rand < 1) {
              bVar2 = true;
              takeBranch(param_1,pbVar6);
              goto LAB_800a046c;
            }
          }
          pbVar6++;
        }
      }
      i++;
      i_00 = (param_1->dat).unk0;
      param_1->prevAni = param_1->currentAni;
      param_1->currentAni = param_1->nextAni;
      FUN_800a80ac(param_1->sceneDat,&local_60,i_00);
      if ((param_1->unk12 == 0)&&(!bVar2)) {
        (param_1->unk2c).x = local_60.x - (param_1->unk20).x;
        (param_1->unk2c).y = local_60.y - (param_1->unk20).y;
        (param_1->unk2c).z = local_60.z - (param_1->unk20).z;
      }
      else {
        (param_1->unk2c).x = 0.0;
        (param_1->unk2c).y = 0.0;
        (param_1->unk2c).z = 0.0;
      }
      if (bVar2) param_1->unk12 = 2;
      else if (param_1->unk12) param_1->unk12--;
      (param_1->unk20).x = local_60.x;
      (param_1->unk20).y = local_60.y;
      (param_1->unk20).z = local_60.z;
    } while (i < delta);
  }
  return bVar2;
}

u16 Borg7_GetAniTime(Borg7Header *param_1){return param_1->sceneDat->aniTime;}

void Borg7_StartParticles(Borg7Header *param_1){
  u32 count = ((param_1->sceneDat->borg5)->dat).ParticleCount;
  if (((count != 0) && (param_1->sceneDat->particleHead))) {
    for(u32 i=0;i<count;i++) {
      SceneData *scene = param_1->sceneDat;
      Borg5_particle *dat = scene->borg5->dat.ParticleDat[i];
      if (((dat->flagE & B5PART_0020)) &&
         (dat->aniUsed == param_1->currentAni)) {
        Particle::AllocBorg5Particle(scene->particleHead,scene,dat);
      }
    }
  }
}

vec3f vec3f_800f5580;
Gfx * Borg7_Render(Gfx *g,Borg7Header *param_2){
  vec3f avStack_50;
  vec3f_800f5580={0,0,0};
  if (param_2->sceneDat) {
    FUN_800a80ac(param_2->sceneDat,&avStack_50,(param_2->dat).unk0);
    FUN_800a80d8(param_2->sceneDat,&vec3f_800f5580,(param_2->dat).unk0);
    FUN_8009ef34(param_2->sceneDat);
    if (((param_2->sceneDat->flags & SCENE_0040) == 0) && (param_2->sceneDat->borg5->dat.borg3P)) {
      g = gsAnimationDataMtx(g,param_2->sceneDat);
    }
    g = BorgAnimDrawSceneRaw(g,param_2->sceneDat);
    FUN_800a80d8(param_2->sceneDat,&avStack_50,(param_2->dat).unk0);
  }
  return g;
}
//TODO: Redo once relevant data is better understood
void FUN_800a0714(Borg6Struct5 *param_1){

  float* puVar5 = (float *)param_1->unk8;
  param_1->struct3 = param_1->struct2->struct3;
  Borg6Struct3* x = param_1->struct2->struct3;
  param_1->unkc = 1;
  u32 uVar3 = x->unk2;
  float* puVar4 = x->unk4;
  while (uVar3 != 0) {
    u32 uVar2 = uVar3 & 1;
    uVar3 >>=1;
    if (uVar2 != 0) {
      float f = *puVar4;
      puVar4++;
      *puVar5 = f;
    }
    puVar5++;
  }
}

void FUN_800a0764(Borg6Struct4 *param_1,float param_2) {
  if (param_1->struct1->type == 1) FUN_800a0800(param_1,param_2);
  else FUN_800a07b0(param_1,param_2);
}

//TODO: Redo once relevant data is better understood
void FUN_800a07b0(Borg6Struct4 *param_1,float param_2) {
  float **ppfVar1;
  uint uVar2;
  uint uVar3;
  float *pfVar4;
  Borg6Struct5 *pSVar5;
  
  pSVar5 = param_1->struct5;
  uVar3 = param_1->struct1->unkc;
  pfVar4 = (float *)param_1->unk10;
  while (uVar3 != 0) {
    uVar2 = uVar3 & 1;
    uVar3 = (int)uVar3 >> 1;
    if (uVar2 != 0) {
      ppfVar1 = &pSVar5->unk8;
      pSVar5++;
      *pfVar4+= **ppfVar1 * param_2;
    }
    pfVar4++;
  }
}

//TODO: Redo once relevant data is better understood
void FUN_800a0800(Borg6Struct4 *param_1,float param_2) {
  float **ppfVar1;
  float *pfVar2;
  vec3f *pvVar3;
  vec3f *pvVar4;
  vec3f *pvVar5;
  u32 uVar6;
  Borg6Struct5 *pSVar7;
  int iVar8;
  Borg5Transform *pvVar2;
  
  iVar8 = 3;
  pvVar2 = (Borg5Transform *)param_1->unk10;
  pSVar7 = param_1->struct5;
  pvVar5 = &pvVar2->rot;
  uVar6 = param_1->struct1->unkc;
  pvVar4 = &pvVar2->unkStruct->unk158;
  pvVar3 = &pvVar2->unkStruct->unk164;
  do {
    iVar8 = iVar8 + -1;
    if ((uVar6 & 1) != 0) {
      pfVar2 = pSVar7->unk8;
      pvVar5->x = pvVar5->x + *pfVar2 * param_2;
      pvVar4->x = pvVar4->x + pfVar2[1] * param_2;
      pSVar7 = pSVar7 + 1;
      pvVar3->x = pvVar3->x + pfVar2[2] * param_2;
    }
    uVar6 = (int)uVar6 >> 1;
    pvVar5 = (vec3f *)&pvVar5->y;
    pvVar4 = (vec3f *)&pvVar4->y;
    pvVar3 = (vec3f *)&pvVar3->y;
  } while (iVar8 != 0);
  iVar8 = 3;
  pvVar4 = &pvVar2->unkStruct->unk140;
  pvVar3 = &pvVar2->unkStruct->unk14c;
  do {
    iVar8 = iVar8 + -1;
    if ((uVar6 & 1) != 0) {
      pfVar2 = pSVar7->unk8;
      pvVar5->x+= *pfVar2 * param_2;
      pvVar4->x+= pfVar2[1] * param_2;
      pvVar3->x+=pfVar2[2] * param_2;
      pSVar7++;
    }
    uVar6 = (int)uVar6 >> 1;
    pvVar5 = (vec3f *)((int)pvVar5 + 4);
    pvVar4 = (vec3f *)&pvVar4->y;
    pvVar3 = (vec3f *)&pvVar3->y;
  } while (iVar8 != 0);
  iVar8 = 3;
  do {
    iVar8 = iVar8 + -1;
    if ((uVar6 & 1) != 0) {
      ppfVar1 = &pSVar7->unk8;
      pSVar7 = pSVar7 + 1;
      pvVar5->x = pvVar5->x + **ppfVar1 * param_2;
    }
    uVar6 = (int)uVar6 >> 1;
    pvVar5 = (vec3f *)((int)pvVar5 + 4);
  } while (iVar8 != 0);
}
//TODO: Redo once relevant data is better understood
void FUN_800a0940(Borg6Struct4 *param_1){
  Borg6Struct1 *pBVar1;
  Borg5Transform *puVar2;
  u32 uVar2;
  Borg5Struct2 *iVar1;
  
  pBVar1 = param_1->struct1;
  puVar2 = (Borg5Transform *)param_1->unk10;
  if (pBVar1->type == 1) {
    iVar1 = puVar2->unkStruct;
    puVar2 = (Borg5Transform *)&puVar2->rot;
    iVar1->unk140.x = 0;
    iVar1->unk140.y = 0;
    iVar1->unk140.z = 0;
    iVar1->unk14c.x = 0;
    iVar1->unk14c.y = 0;
    iVar1->unk14c.z = 0;
    iVar1->unk158.x = 0;
    iVar1->unk158.y = 0;
    iVar1->unk158.z = 0;
    iVar1->unk164.x = 0;
    iVar1->unk164.y = 0;
    iVar1->unk164.z = 0;
    pBVar1 = param_1->struct1;
  }
  for (uVar2 = pBVar1->unkc; uVar2 != 0; uVar2 = (int)uVar2 >> 1) {
    if ((uVar2 & 1) != 0) {
      puVar2->flag = 0;
      puVar2->mtxOp = 0;
      puVar2->tier = 0;
    }
    puVar2 = (Borg5Transform *)&puVar2->links;
  }
  return;
}

void FUN_800a09c0(Borg6Struct4 *param_1) {
  Borg6Struct5 *pSVar2 = param_1->struct5;
  for (u32 uVar1 = param_1->struct1->struct2Count; uVar1 != 0; uVar1--) {
    FUN_800a0714(pSVar2);
    pSVar2++;
  }
}

void FUN_800a0a08(SceneData *param_1) {
  Borg6Header *pBVar4 = param_1->borg6;
  param_1->aniTime = 1;
  if (pBVar4) {
    while( true ) {
      Borg6Struct4 *pBVar3 = pBVar4->struct4;
      for (u32 i = pBVar4->dat->struct1Count; i != 0; i--) {
        FUN_800a09c0(pBVar3);
        pBVar3++;
      }
      pBVar4 = pBVar4->link2;
      if (pBVar4 == NULL) break;
    }
  }
}

//progress animation 1/60 second tick
//TODO: Redo once relevant data is better understood.
void FUN_800a0a74(Borg6Struct4 *param_1) {
  u16 uVar1;
  Borg6Struct3 *pBVar2;
  float *pfVar3;
  float *pfVar4;
  u16 uVar5;
  int iVar6;
  Borg6Struct5 *pSVar7;
  u32 i;

  for (i=param_1->struct1->struct2Count,pSVar7 = param_1->struct5;i!=0;pSVar7++,i--){
   if (pSVar7->unkc != pSVar7->struct2->unk0) {
    pBVar2 = pSVar7->struct3;
    if (pBVar2[1].unk0 == pSVar7->unkc) {
      pfVar3 = pSVar7->unk8;
      iVar6 = 4;
      pSVar7->struct3 = pBVar2 + 1;
      uVar5 = pBVar2[1].unk2;
      pfVar4 = pBVar2[1].unk4;
      do {
        if ((uVar5 & 1)) {
          if (iVar6 != 0) goto LAB_800a0b40;
          goto LAB_800a0b68;
        }
        pfVar3++;
        iVar6--;
        uVar5 >>= 1;
      } while (iVar6 != 0);
    }
    goto LAB_800a0b68;
   }
   switch(pSVar7->struct2->unk8){
    case 0:
    case 1:
    case 2:
    FUN_800a0714(pSVar7);
   }
   continue;
LAB_800a0b40:
   do {
    if ((uVar5 & 1) == 0) *pfVar3 = 0.0;
    else {
      *pfVar3 = *pfVar4;
      pfVar4++;
    }
    pfVar3++;
    iVar6--;
    uVar5 >>=1;
   } while (iVar6 != 0);
LAB_800a0b68:
   pBVar2 = pSVar7->struct3;
   pfVar3 = pSVar7->unk8;
   uVar1 = pBVar2->unk2;
   if(uVar1&2){
    *pfVar3+= pfVar3[1];
    if(uVar1&4){
     pfVar3[1]+= pfVar3[2];  
     if(uVar1&8)pfVar3[2]+= pfVar3[3];
    }
   }
   pSVar7->unkc++;
  };
}

void Scene::Tick(SceneData *param_1){
  u8 bVar1;
  Borg6Data *pBVar2;
  Borg6Struct4 *pBVar3;
  u32 i;
  Borg6Header *pBVar5;
  u32 uVar6;
  
  if ((param_1->aniSpeed != 0) && (pBVar5 = param_1->borg6, pBVar5 != NULL)) {
    pBVar2 = pBVar5->dat;
    while( true ) {
      uVar6 = pBVar2->struct1Count;
      pBVar3 = pBVar5->struct4;
      while (uVar6 != 0) {
        uVar6--;
        for (i = (u32)param_1->aniSpeed; i != 0; i--) {
          FUN_800a0a74(pBVar3);
        }
        FUN_800a0940(pBVar3);
        pBVar3++;
      }
      pBVar5 = pBVar5->link2;
      if (pBVar5 == NULL) break;
      pBVar2 = pBVar5->dat;
    }
    pBVar5 = param_1->borg6;
    if (pBVar5){
      while( true ) {
        if (pBVar5->unk1c != 0.0){
          Borg6Struct4 *pSVar4 = pBVar5->struct4;
          for (uVar6 = pBVar5->dat->struct1Count; uVar6 != 0; uVar6--) {
            FUN_800a0764(pSVar4,pBVar5->unk1c);
            pSVar4++;
          }
        }
        pBVar5 = pBVar5->link2;
        if (pBVar5 == NULL) break;
      }
    }
    param_1->aniTime+= param_1->aniSpeed;
  }
}

void Ofunc_800a0d30(Borg6Header *param_1,int param_2){
  Borg6Struct4 *pBVar1;
  int j;
  u32 i;
  
  i = param_1->dat->struct1Count;
  pBVar1 = param_1->struct4;
  while (i != 0) {
    i--;
    j = param_2;
    if (param_2 != 0) {
      do {
        FUN_800a0a74(pBVar1);
        j--;
      } while (j != 0);
    }
  }
}

Gfx * BorgAnimDrawScene(Gfx *param_1,SceneData *param_2){
  if (!param_2->sceneTicked) {
    Scene::Tick(param_2);
    FUN_8009ef34(param_2);
  }
  return BorgAnimDrawSceneRaw(param_1,param_2);
}

void FUN_800a0df4(SceneData *param_1){
  if (!param_1->sceneTicked) {
    Scene::Tick(param_1);
    FUN_8009ef34(param_1);
  }
}

//?
void Ofunc_800a0e30(void){
  for(u32 i=0;i<4;i++){
    for (u32 j=1;j<4;j++) {}
  }
}

struct unkAnimStruct{
    SceneData* scene;
    Borg5Data* b5;
    Borg5Transform*b5Trans;
    Borg2Header*b2;
    Borg1Header*b1;
    Borg2Struct*unk14;
    Borg4Header* unk1c[8];
    //repeated settings for gDlist800f32d8?
    u32 unk3c,unk40,unk44; 
    Color32 unk48;
    u32 unk4c,unk50,unk54;
    u64 unk58;
};

unkAnimStruct unkAnimStructA,unkAnimStructB;


Gfx * FUN_800a0e60(Gfx *G){
  unkAnimStructB.unk40 = G_FOG|G_TEXTURE_GEN|G_TEXTURE_GEN_LINEAR;
  unkAnimStructB.unk3c = G_ZBUFFER|G_SHADE|G_CULL_BACK|G_LIGHTING|G_SHADING_SMOOTH;
  unkAnimStructB.unk48.R = 0;
  unkAnimStructB.unk48.G = 0;
  unkAnimStructB.unk48.B = 0;
  unkAnimStructB.unk48.A = 0;
  unkAnimStructB.unk4c = 0;
  unkAnimStructB.unk50 = 0x442038;
  unkAnimStructB.unk54 = G_RM_RA_ZB_OPA_SURF2;
  unkAnimStructB.b1 = NULL;
  unkAnimStructB.unk44 = 0x2000;
  gSPDisplayList(G++,gDlist800f32d8);
  unkAnimStructA=unkAnimStructB;
  return G;
}


Gfx * setStaticMode(Gfx *g){
  u32 uVar6;
  if (!g) {CRASH("./src/borganim.cpp","SetStaticMode() !g");}
  u32 geoMode = G_SHADE;
  u32 flag = (unkAnimStructB.unk14)->flags;
  if (!(flag & B2S_NoZBuff)) geoMode = G_SHADE|G_ZBUFFER;
  if ((flag & B2S_SmoothShade))geoMode |= G_SHADING_SMOOTH;
  if ((flag & B2S_CullBack)) geoMode |= G_CULL_BACK;
  if (!(flag & B2S_Lighting)) geoMode |= G_LIGHTING;
  if (!unkAnimStructB.b1) {gDPSetCombine(g++,0xfffe03,0xff0e79ff);}
  else {
    if ((flag & B2S_0001) == 0) {
      if (((unkAnimStructB.b1)->dat->flag & B1_TDDetail) == 0) {
        uVar6 = (unkAnimStructB.b1)->dat->lods;
      }
      else uVar6 = (unkAnimStructB.b1)->dat->lods - 1;
      gSPTexture(g++,0x8000,0x8000,uVar6,0,2);
    }
    else {
      geoMode|=((flag & B2S_LinText) != 0)?G_TEXTURE_GEN|G_TEXTURE_GEN_LINEAR:G_TEXTURE_GEN;
      gSPTexture(g++,(unkAnimStructB.b1)->dat->Width<<6,(unkAnimStructB.b1)->dat->Height<<6,
        unkAnimStructB.b1->dat->lods,0,G_ON);
    }                         //should still equal G_TF_BILERP or G_TF_POINT
    gDPSetTextureFilter(g++,((flag & B2S_TextFilt) == 0) << (G_MDSFT_TEXTFILT+1));
    gDPSetCombine(g++,0x127e03,0xff0ff3ff);
    g = loadTextureImage(g,unkAnimStructB.b1,unkAnimStructB.unk14);
  }

  gSPLoadGeometryMode(g++,0);
  gSPSetGeometryMode(g++,geoMode);
  gDPSetCycleType(g++,G_CYC_2CYCLE);
  unkAnimStructA=unkAnimStructB;
  return g;
}

Gfx * FUN_800a1184(Gfx *gfx){
  u16 BVar1;
  int iVar2;
  u32 c1; //TODO: replace vals with proper #defines
  u8 r,g,b,a;
  u32 c0;
  
  c0 = G_RM_PASS;
  if (unkAnimStructB.b1 == NULL) {
    r = (int)(((unkAnimStructB.scene)->colorFloats).r * ((unkAnimStructB.unk14)->tint).r *
             255.0f) ;
    g = (int)(((unkAnimStructB.scene)->colorFloats).g * ((unkAnimStructB.unk14)->tint).g *
             255.0f);
    b = (int)(((unkAnimStructB.scene)->colorFloats).b * ((unkAnimStructB.unk14)->tint).b *
             255.0f);
    a = (int)(((unkAnimStructB.scene)->colorFloats).a *
              (1.0f - ((unkAnimStructB.unk14)->tint).a) *
              (1.0f - (unkAnimStructB.b2)->dat->alpha) * 255.0f);
    c1 = 0x112078;
    if (255 <= a) goto LAB_800a1428;
  }
  else {
    r = ((unkAnimStructB.scene)->colorFloats).r * 255.0f;
    g = ((unkAnimStructB.scene)->colorFloats).g * 255.0f;
    b = ((unkAnimStructB.scene)->colorFloats).b * 255.0f;
    a = ((unkAnimStructB.scene)->colorFloats).a *
            (1.0f - ((unkAnimStructB.unk14)->tint).a) *
            (1.0f - (unkAnimStructB.b2)->dat->alpha) * 255.0f;
    if (a>=0xff) {
      if (((unkAnimStructB.b1)->dat->flag & B1_Flag20) == 0) {
        c1 = 0x112078;
        goto LAB_800a1428;
      }
      BVar1 = (unkAnimStructB.b1)->dat->type;
      if (((BVar1 != B1_IA16) && (BVar1 != B1_IA8)) && (BVar1 != B1_RGBA32)) {
        c1 = 0x113078;
        goto LAB_800a1428;
      }
    }
  }
  c1 = 0x1049d8;
LAB_800a1428:
  if (((unkAnimStructB.scene)->flags & SCENE_0100)) {
    gSPSetGeometryMode(gfx++,G_FOG);
    gDPSetFogColor(gfx++,unkAnimStructB.scene->fogColor.R,unkAnimStructB.scene->fogColor.G,
      unkAnimStructB.scene->fogColor.B,unkAnimStructB.scene->fogColor.A);
    gSPFogPosition(gfx++,unkAnimStructB.scene->fogMin,unkAnimStructB.scene->fogMax);
    c0 = G_RM_FOG_SHADE_A;
  }
  gDPSetRenderMode(gfx++,c0,c1);
  gDPSetPrimColor(gfx++,0,0,r,g,b,a);
  return gfx;
}

void Ofunc_800a1548(vec3f *v){
  vec3f_800f3378.x = v->x;
  vec3f_800f3378.y = v->y;
  vec3f_800f3378.z = v->z;
}

Gfx * gsAnimationDataMtx(Gfx *G,SceneData *param_2){

  u32 ind = param_2->perspNormIndex & 1;
  if (param_2->borg5->dat.borg3P) {
    vec3f_800f3378.x = param_2->matrixB[3][0];
    vec3f_800f3378.y = param_2->matrixB[3][1];
    vec3f_800f3378.z = param_2->matrixB[3][2];
    Borg3Header *b3 = param_2->borg5->dat.borg3P;
    gSPMatrix(G++,(b3->dat.mtx_ + ind),G_MTX_PROJECTION|G_MTX_LOAD|G_MTX_NOPUSH);
    gSPPerspNormalize(G++,b3->perspnorm[ind]);
  }
  return G;
}

Gfx * BorgAnimDrawSceneRaw(Gfx *g,SceneData *param_2){
  Borg5Header *pBVar1;
  Borg5Struct2 *pBVar2;
  Borg4Header *pBVar3;
  Light_t *pLVar4;
  Borg2Data *pBVar5;
  Gfx *pGVar6;
  SceneData *pSVar7;
  Borg2Header *pBVar8;
  u32 uVar9;
  Gfx *pGVar10;
  MtxF *paafVar11;
  Gfx *pGVar12;
  u32 uVar13;
  u8 *puVar14;
  Borg4Header **ppBVar15;
  float (*pafVar16) [4];
  u32 normInd;
  u32 val;
  Borg4Header **ppBVar19;
  int iVar20;
  int iVar21;
  float (*mf) [4] [4];
  int i,j;
  Borg5Transform *pbVar23;
  u16 *instructs;
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  float fStack_1c0;
  float fStack_1bc;
  vec3f fStack384;
  float afStack320 [4] [4];
  Mtx_t auStack128;
  
  pBVar1 = param_2->borg5;
  unkAnimStructB.b2 = NULL;
  unkAnimStructB.b1 = NULL;
  unkAnimStructB.unk14 = NULL;
  unkAnimStructB.b5 = &pBVar1->dat;
  pbVar23 = (pBVar1->dat).transforms;
  normInd = param_2->perspNormIndex & 1;
  if (pBVar1->dat.borg3P) pbVar23++;
  i = 0;
  unkAnimStructB.scene = param_2;
  if ((param_2->flags & SCENE_8000) == 0) {
    j = (pBVar1->dat).borg4Count;
    if (((param_2->flags & SCENE_0080) == 0) && (i != 0)) {
      ppBVar19 = unkAnimStructB.unk1c;
      ppBVar15 = (pBVar1->dat).borg4p;
      iVar20 = normInd * 0x10;
      do {
        iVar21 = j;
        pBVar2 = pbVar23->unkStruct;
        fStack_1c0 = (pbVar23->scale).x;
        if ((1.0f < fStack_1c0) || (0.0 <= fStack_1c0)) {
          if (1.0f < fStack_1c0) {
            fStack_1c0 = 1.0f;
          }
        }
        else {
          fStack_1c0 = 0.0;
        }
        fVar25 = (pbVar23->scale).y;
        fStack_1bc = 1.0f;
        if (fVar25 <= 1.0f) {
          if (fVar25 < 0.0) {
            fStack_1bc = 0.0;
          }
          else {
            fStack_1bc = fVar25;
            if (1.0f < fVar25) {
              fStack_1bc = 1.0f;
            }
          }
        }
        fVar26 = (pbVar23->scale).z;
        fVar25 = 1.0f;
        if (fVar26 <= 1.0f) {
          if (0.0 <= fVar26) {
            fVar25 = fVar26;
            if (1.0f < fVar26) fVar25 = 1.0f;
          }
          else fVar25 = 0.0;
        }
        pBVar3 = *ppBVar15;
        fStack_1c0 = pBVar3->dat->red * fStack_1c0;
        if ((1.0f <= fStack_1c0) || (0.0 <= fStack_1c0)) {
          fVar26 = 1.0f;
          if (fStack_1c0 < 1.0f) fVar26 = fStack_1c0;
        }
        else fVar26 = 0.0;
        fStack_1bc = pBVar3->dat->green * fStack_1bc;
        if ((1.0f <= fStack_1bc) || (0.0 <= fStack_1bc)) {
          fVar27 = 1.0f;
          if (fStack_1bc < 1.0f) fVar27 = fStack_1bc;
        }
        else fVar27 = 0.0;
        fVar25 = pBVar3->dat->blue * fVar25;
        if ((1.0f <= fVar25) || (0.0 <= fVar25)) {
          fVar28 = 1.0f;
          if (fVar25 < 1.0f) fVar28 = fVar25;
        }
        else fVar28 = 0.0;
        pLVar4 = &pBVar3->dat->l->l;
        pLVar4[normInd].dir[0]=pBVar2->mfs[1][2][0] *90.0f;
        pLVar4[normInd].dir[1]=pBVar2->mfs[1][2][1] *90.0f;
        pLVar4[normInd].dir[2]=pBVar2->mfs[1][2][2] *90.0f;
        pLVar4[normInd].col[0]=pLVar4[normInd].colc[0]=fVar26*255.0f;
        pLVar4[normInd].col[1]=pLVar4[normInd].colc[1]=fVar27*255.0f;
        pLVar4[normInd].col[2]=pLVar4[normInd].colc[2]=fVar28*255.0f;
        pBVar3 = *ppBVar15;
        ppBVar15++;
        pbVar23++;
        i = iVar21 + 1;
        *ppBVar19 = pBVar3;
        ppBVar19 = ppBVar19 + 1;
      } while (j != 0);
      j = (unkAnimStructB.b5)->borg4Count;
      if (j == 1) {
        gSPLight(g++,(u32)&pLVar4[normInd],2);
        gSPLight(g++,(u32)&gBlackLight,1);
        pGVar12 = g;
      }
      else {
        ppBVar15 = (unkAnimStructB.b5)->borg4p;
        pGVar12 = g;
        if (j != 0) {
          u8 ind=1;
          do {
            pBVar3=*ppBVar15;
            gSPLight(g++,(u32)&pBVar3->dat->l[normInd],ind);
            j--;
            ind++;
            ppBVar15++;
            g = pGVar12;
          } while (j != 0);
        }
      }
      pGVar10 = pGVar12;
      switch(iVar21) {
      case 0:
        gSPNumLights(pGVar10++,1);
        break;
      case 1:
        gSPNumLights(pGVar10++,1);
        break;
      case 2:
        gSPNumLights(pGVar10++,2);
        break;
      case 3:
        gSPNumLights(pGVar10++,3);
        break;
      case 4:
        gSPNumLights(pGVar10++,4);
        break;
      case 5:
        gSPNumLights(pGVar10++,5);
        break;
      case 6:
        gSPNumLights(pGVar10++,6);
        break;
      case 7:
        gSPNumLights(pGVar10++,7);
        break;
      default:
        goto switchD_800a1cc4_caseD_8;
      }
    }
    else {
        gSPLight(pGVar10++,(u32)&gBlackLight,1);
        gSPLight(pGVar10++,(u32)&gWhiteLight,2);
        gSPNumLights(pGVar10++,1);
    }
  }
  else if (param_2->currLights == 0) {
    gSPLight(g++,(u32)&gBlackLight,1);
    gSPLight(g++,(u32)&(unkAnimStructB.scene)->envLight,2);
    gSPNumLights(g++,1);
    pGVar10 = g;
  }
  else {
    j = 0;
    s32 aiStack512[]={1,2,3,4,5,6,7};
    if (0 < (int)param_2->currLights) {
      do {
        gSPLight(g++,&(unkAnimStructB.scene)->DirLights[i],j+1);
        j++;
      } while (j < (int)(unkAnimStructB.scene)->currLights);
    }
    gSPLight(g++,&(unkAnimStructB.scene)->envLight,j+1);
    gSPNumLights(g++,aiStack512[j + -1]);
    (unkAnimStructB.scene)->currLights = 0;
    pGVar10 = g;
  }
switchD_800a1cc4_caseD_8:
  if (i < 8) {
    ppBVar15 = unkAnimStructB.unk1c + i;
    do {
      *ppBVar15 = NULL;
      i++;
      ppBVar15++;
    } while (i < 8);
  }
  pGVar10 = FUN_800a0e60(pGVar10);
  for(i=(unkAnimStructB.b5)->instructionCount,instructs = (unkAnimStructB.b5)->instructions;
     i!=0;i--,instructs++,pGVar10 = pGVar12){
    val = *instructs & 0xff;
    pGVar12 = pGVar10;
    switch((int)((u32)*instructs << 0x10) >> 0x18) {
    case B5INST_LOADTEXTURE:
      if (val == 0xff) {
        pGVar12 = pGVar10 + 1;
        unkAnimStructB.b1 = NULL;
        gSPTexture(pGVar10++,0,0,0,0,0);
      }
      else {
        unkAnimStructB.b1 = (unkAnimStructB.b5)->borg1p[val];
        pGVar12 = FUN_8009d3dc(pGVar10,unkAnimStructB.b1,(u8)normInd);
      }
      break;
    case B5INST_MATRIX:
      pbVar23 = (unkAnimStructB.b5)->transforms + val;
      pGVar12 = pGVar10 + 1;
      unkAnimStructB.b5Trans = pbVar23;
      if ((pbVar23->flag & 2) == 0) {
        pBVar2 = pbVar23->unkStruct;
        mf = pBVar2->mfs;
        if ((pbVar23->flag & 0x200) == 0) {
          MTXCPY(pBVar2->mfs[0],pBVar2->mfs[1]);
        }
        else {
          fStack384.x = pBVar2->mfs[1][3][0] - vec3f_800f3378.x;
          fStack384.y = pBVar2->mfs[1][3][1] - vec3f_800f3378.y;
          fStack384.z = pBVar2->mfs[1][3][2] - vec3f_800f3378.z;
          Vec3Normalize(&fStack384);
          guAlignF(&afStack320,(pbVar23->rot).z,fStack384.x,fStack384.y,fStack384.z);
          CLEAR(&mf);
          pSVar7 = unkAnimStructB.scene;
          pBVar2->mfs[0][0][0] = (pbVar23->scale).x * unkAnimStructB.scene->scalar.x;
          pBVar2->mfs[0][1][1] = (pbVar23->scale).y * unkAnimStructB.scene->scalar.y;
          pBVar2->mfs[0][2][2] = (pbVar23->scale).z * unkAnimStructB.scene->scalar.z;
          pBVar2->mfs[0][3][0] = pBVar2->mfs[1][3][0];
          pBVar2->mfs[0][3][1] = pBVar2->mfs[1][3][1];
          pBVar2->mfs[0][3][3] = 1.0f;
          pBVar2->mfs[0][3][2] = pBVar2->mfs[1][3][2];
          guMtxCatF(&afStack320,mf,mf);
        }
        pBVar8 = unkAnimStructB.b2;
        pBVar2->mfs[0][3][2] *= 16.0f;
        pBVar2->mfs[0][3][0] *= 16.0f;
        pBVar2->mfs[0][3][1] *= 16.0f;
        (*mf)[0][0] *= (unkAnimStructB.b2)->dat->scale;
        pBVar2->mfs[0][1][0] *= (unkAnimStructB.b2)->dat->scale;
        pBVar2->mfs[0][2][0] *= (unkAnimStructB.b2)->dat->scale;
        pBVar2->mfs[0][0][1] *= (unkAnimStructB.b2)->dat->scale;
        pBVar2->mfs[0][1][1] *= (unkAnimStructB.b2)->dat->scale;
        pBVar2->mfs[0][2][1] *= (unkAnimStructB.b2)->dat->scale;
        pBVar2->mfs[0][0][2] *= (unkAnimStructB.b2)->dat->scale;
        pBVar2->mfs[0][1][2] *= (unkAnimStructB.b2)->dat->scale;
        pBVar2->mfs[0][2][2] *= (unkAnimStructB.b2)->dat->scale;
        COPY(pBVar8->someMtx,mf);
        guMtxF2L(mf,&unkAnimStructB.b5Trans->unkStruct->mtxs[normInd]);
        (unkAnimStructB.b5Trans)->flag |= 2;
      }
      gSPMatrix(pGVar10,unkAnimStructB.b5Trans->unkStruct->mtxs + normInd,G_MTX_LOAD);
      break;
    case B5INST_ANITEXTURE:
      CRASH("BorgAnimDrawSceneRaw()","We are not using animated textures on this project :)");
      break;
    case B5INST_LOADVERTS:
      unkAnimStructB.b2 = unkAnimStructB.b5->borg2p[val];
      gSPSegment(pGVar10++,0xa,osVirtualToPhysical(unkAnimStructB.b2->dat->vertlist2));
      gSPSegment(pGVar10++,0xe,osVirtualToPhysical(unkAnimStructB.b2->dat->vertlist));
      pGVar12 = pGVar10;
      break;
    case B5INST_B2DLIST:
      pBVar5 = (unkAnimStructB.b2)->dat;
      pGVar6 = pBVar5->dsplists[val];
      if (((pGVar6) &&
          ((((pGVar6->words).w0 != sEndDL.words.w0 || ((pGVar6->words).w1 != sEndDL.words.w1)) &&
           (((pBVar5->unk0x28 ^ 1) & 1))))) &&
         (((unkAnimStructB.unk14 = pBVar5->unk0x40 + val, unkAnimStructB.unk14 != NULL &&
           (pBVar5->alpha < 1.0f)) && (((unkAnimStructB.unk14)->tint).a < 1.0f)))) {
        if (pBVar5->dsplistcount <= (int)val) {
          #if DEBUGVER
          char errBuff [128];
          sprintf(errBuff,"INVALID BORG SCENE\nop >= n op: %i n: %i",pBVar5->dsplistcount,val);
          #endif
          CRASH("./src/borganim.cpp",errBuff);
        }
        if ((unkAnimStructB.b2)->dlistSet[val]) {
          gSPEndDisplayList(setStaticMode((unkAnimStructB.b2)->dlist[val]));
          (unkAnimStructB.b2)->dlistSet[val] = 0;
        }
        gSPDisplayList(pGVar10++,osVirtualToPhysical((unkAnimStructB.b2)->dlist[val]));
        pGVar12 = FUN_800a1184(pGVar10);
        pGVar10 = pGVar12;
        if (unkAnimStructB.unk14->flags & B2S_0001) {
          guLookAtReflect(&auStack128,unkAnimStructB.b2->lookat[normInd],
                              param_2->matrixB[3][0],param_2->matrixB[3][1],param_2->matrixB[3][2],
                              unkAnimStructB.b5Trans->unkStruct->mfs[1][3][0],
                              unkAnimStructB.b5Trans->unkStruct->mfs[1][3][1],
                              unkAnimStructB.b5Trans->unkStruct->mfs[1][3][2],0.0,1.0f,0.0);
          gSPLookAt(pGVar12++,unkAnimStructB.b2->lookat[normInd]);
          pGVar10 = pGVar12;
        }
        pGVar12 = pGVar10 + 1;
        gSPDisplayList(pGVar10++,osVirtualToPhysical(pGVar6));
      }
    }
  }
  param_2->sceneTicked = false;
  param_2->perspNormIndex^= 1;
  unkAnimStructB.b5 = NULL;
  return pGVar10;
}

void NOOP_800a2448(void *x){}

Gfx * ret_A0(Gfx *g){return g;}
