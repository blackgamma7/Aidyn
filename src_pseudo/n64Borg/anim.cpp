#include "n64Borg.h"
#include "globals.h"

// script for models texturews and animations of Borg 1/2/5/6/7

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

u32 half(int x){
  u32 ret = x >> 1;
  if ((ret != 1) && ((ret & 1))) {
    ret -= 1;
  }
  return ret;
}


int getPow2(u32 x){
  int pow = -1;
  for(;x!=0;pow++){
    x = half(x);
  }
  return pow;
}

s32 FUN_8009d3b0(s32 param_1,s32 param_2){return getPow2(param_1 / param_2);}

Gfx * FUN_8009d3dc(Gfx *g,Borg1Header *b1,u8 bufferchoice){
  byte bVar1;
  u32 uVar3;
  u32 uVar5;
  
  if ((b1->dat->flag & B1_Interlaced)) {
    bVar1 = b1->dat->iLace;
    if ((bVar1 & 0xf) == 0) {
      if ((bVar1 & 0xf0)) {
        if (b1->dat->type < B1_CI8) deinterlace16(b1,(u32)(bVar1 >> 4));
        else deinterlace32(b1,(u32)(bVar1 >> 4));
        FUN_8009d7b0(b1);
        goto LAB_8009d4c0;
      }
    }
    bVar1 = b1->dat->iLace;
    uVar5 = (u32)(bVar1 >> 4);
    if (uVar5 == (bVar1 & 0xf)) {
      if (b1->dat->type < B1_CI8) deinterlace16(b1,uVar5);
      else deinterlace32(b1,uVar5);
      FUN_8009d7b0(b1);
      b1->dat->iLace&= 0xf;
    }
    else b1->dat->iLace+= 0x10;
  }
LAB_8009d4c0:
  if (b1->dat->dList == NULL) g = borganim_LoadTextureImage(g,b1);
  else gSPDisplayList(g++,osVirtualToPhysical(b1->dat->dList));
  PTR_800f32b4 = b1;
  return g;
}

void deinterlace32(Borg1Header *param_1,int param_2){
  byte bVar1;
  int iVar2;
  u16 uVar3;
  u32 uVar4;
  int iVar5;
  u32 i;
  u32 uVar6;
  int iVar7;
  int iVar8;
  Color32 *pCVar9;
  u32 uVar10;
  Color32 *pCVar11;
  u32 uVar12;
  Color32 *puVar14;
  
  pCVar11 = (Color32 *)param_1->bitmapA;
  if ((Color32 *)param_1->dat->bmp == pCVar11) {
    puVar14 = (Color32 *)param_1->bitmapB;
  }
  else {
    puVar14 = pCVar11;
    pCVar11 = (Color32 *)param_1->bitmapB;
  }
  i = 0;
  uVar12 = (u32)param_1->dat->Height;
  bVar1 = param_1->dat->Width;
  uVar10 = (u32)bVar1;
  if (uVar12 != 0) {
    iVar2 = 0;
    do {
      uVar6 = 0;
      if ((i & 1) == 0) {
        if (uVar10 != 0) {
          pCVar9 = puVar14 + iVar2;
          iVar5 = (u32)bVar1 + -param_2;
          iVar8 = 0x10000;
          do {
            uVar3 = (u16)iVar5;
            iVar5 += 1;
            iVar7 = iVar8 >> 0x10;
            *pCVar9 = pCVar11[iVar2 + (s16)(uVar3 & ~(u16)bVar1)];
            pCVar9 = pCVar9 + 1;
            iVar8 = iVar8 + 0x10000;
          } while (iVar7 < (int)uVar10);
        }
      }
      else if (uVar10 != 0) {
        iVar5 = (u32)bVar1 + -param_2;
        iVar8 = 0x10000;
        do {
          uVar3 = (u16)iVar5;
          iVar5 += 1;
          uVar4 = uVar6 ^ 2;
          uVar6 = iVar8 >> 0x10;
          puVar14[iVar2 + uVar4] = pCVar11[iVar2 + (s16)(uVar3 & ~(u16)bVar1 ^ 2)];
          iVar8 = iVar8 + 0x10000;
        } while ((int)uVar6 < (int)uVar10);
      }
      i = (int)((i + 1) * 0x10000) >> 0x10;
      iVar2 = i * bVar1;
    } while ((int)i < (int)uVar12);
  }
  return;
}

void deinterlace16(Borg1Header *param_1,int param_2){
  byte bVar1;
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
  for(s16 i=0;i<i < uVar10;i++){
    iVar2 = 0;
      j = 0;
      if ((i & 1) == 0) {
        puVar8 = puVar11 + iVar2;
        iVar5 = (u32)bVar1 + -param_2;
        for(s16 j=0;j<uVar9;j++) {
          
            uVar3 = (u16)iVar5++;
            *puVar8 = puVar12[iVar2 + (s16)(uVar3 & ~(u16)bVar1)];
            puVar8++;
        }
      }
      else if (uVar9 != 0) {
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
  s8 sVar6;
  int iVar4;
  u32 h;
  u32 w;
  Gfx *pauVar9;
  int iVar10;
  s32 i;
  u8 BVar1;
  Borg1Data *pBVar2;
  
  gDPPipeSync(gfx++);
  gDPTileSync(gfx++);
  gSPSegment(gfx++,11,osVirtualToPhysical(param_2->dat->bmp));
  gSPSegment(gfx++,12,osVirtualToPhysical(param_2->dat->pallette));
  iVar10 = 0;
  sVar6 = GetN64ImageDimension(param_2->dat->type);
  i = 0;
  pBVar2 = param_2->dat;
  h = (u32)pBVar2->Width;
  w = (u32)pBVar2->Height;
  if (-1 < pBVar2->lods) {
    do {
      iVar4 = GetBitmapSize(h,w,(int)sVar6);
      iVar10 += iVar4;
      h = half(h);
      w = half(w);
      i++;
    } while (i <= param_2->dat->lods);
  }
  BVar1 = param_2->dat->type;
  if (B1_RGBA32 < param_2->dat->type) {
    CRASH("borganim.cpp:LoadTextureImage","TEXTURE TYPE NOT SUPPORTED");
  }
  iVar4 = iVar10 >> 1;
  switch(param_2->dat->type) {
  case B1_RGBA16:
    break;
  case B1_IA16:
    break;
  case B1_CI8:
    h = iVar4 - 1;
    (pauVar9->words).w0 = 0xfd100000;
    *(undefined4 *)((int)gfx + 0x24) = 0xb000000;
    gfx[5].words.w0 = 0xf5100000;
    *(undefined4 *)((int)gfx + 0x2c) = 0x7000000;
    gfx[6].words.w0 = 0xe6000000;
    *(undefined4 *)((int)gfx + 0x34) = 0;
    gfx[7].words.w0 = 0xf3000000;
    if (0x7ff < (int)h) {
      h = 0x7ff;
    }
    w = 0x73f0000;
    goto LAB_8009dadc;
  case B1_IA8:
    break;
  case B1_I8:
    break;
  case B1_CI4:
    h = ((iVar10 << 1) >> 2) - 1;
    (pauVar9->words).w0 = 0xfd100000;
    *(undefined4 *)((int)gfx + 0x24) = 0xb000000;
    gfx[5].words.w0 = 0xf5100000;
    *(undefined4 *)((int)gfx + 0x2c) = 0x7000000;
    gfx[6].words.w0 = 0xe6000000;
    *(undefined4 *)((int)gfx + 0x34) = 0;
    gfx[7].words.w0 = 0xf3000000;
    if (0x7ff < (int)h) {
      h = 0x7ff;
    }
    w = 0x7030000;
LAB_8009dadc:
    *(u32 *)((int)gfx + 0x3c) = (h & 0xfff) << 0xc | 0x7000000;
    gfx[8].words.w0 = 0xe7000000;
    *(undefined4 *)((int)gfx + 0x44) = 0;
    *(undefined4 *)((int)gfx + 0x4c) = 0x8000;
    gfx[9].words.w0 = 0xe3001001;
    gfx[10].words.w0 = 0xfd100000;
    *(undefined4 *)((int)gfx + 0x54) = 0xc000000;
    gfx[0xb].words.w0 = 0xe8000000;
    *(undefined4 *)((int)gfx + 0x5c) = 0;
    gfx[0xc].words.w0 = 0xf5000100;
    *(undefined4 *)((int)gfx + 100) = 0x7000000;
    gfx[0xd].words.w0 = 0xe6000000;
    *(undefined4 *)((int)gfx + 0x6c) = 0;
    gfx[0xe].words.w0 = 0xf0000000;
    *(u32 *)((int)gfx + 0x74) = w | 0xc000;
    gfx[0xf].words.w0 = 0xe7000000;
    *(undefined4 *)((int)gfx + 0x7c) = 0;
    return gfx + 0x10;
  default:
    iVar4 = (iVar10 << 1) >> 2;
    break;
  case B1_RGBA32:
    iVar4 = iVar10 >> 2;
    (pauVar9->words).w0 = 0xfd180000;
    h = 0xf5180000;
    goto LAB_8009db84;
  }
  (pauVar9->words).w0 = 0xfd100000;
  h = 0xf5100000;
LAB_8009db84:
  w = iVar4 - 1;
  *(undefined4 *)((int)gfx + 0x24) = 0xb000000;
  gfx[5].words.w0 = h;
  *(undefined4 *)((int)gfx + 0x2c) = 0x7000000;
  gfx[6].words.w0 = 0xe6000000;
  *(undefined4 *)((int)gfx + 0x34) = 0;
                    // gDPLoadBlock
  gfx[7].words.w0 = 0xf3000000;
  if (0x7ff < (int)w) {
    w = 0x7ff;
  }
  *(u32 *)((int)gfx + 0x3c) = (w & 0xfff) << 0xc | 0x7000000;
  gfx[8].words.w0 = 0xe7000000;
  *(undefined4 *)((int)gfx + 0x44) = 0;
  gfx[9].words.w0 = 0xe3001001;
  *(undefined4 *)((int)gfx + 0x4c) = 0;
  return gfx + 10;
}

Gfx * loadTextureImage(Gfx *gfx,Borg1Header *param_2,astruct_3 *param_3){
  s8 sVar1;
  byte bVar2;
  byte bVar3;
  Borg1Data *pBVar5;
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
  else flag = param_3->flags[1];
  gDPPipeSync(gfx++);
  gDPTileSync(gfx++);
  u16 b1Flag = param_2->dat->flag;
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
  if (param_2->dat->lods <= 0) {gDPSetTextureLOD(gfx++,0);}
  else {gDPSetTextureLOD(gfx++,G_TL_LOD);}
  cmt = G_TX_CLAMP;
  cms = (u32)((flag & B1_Wrap) == 0) << 1;
  if ((flag & B1_XMirror)) cms |= G_TX_MIRROR;
  if ((flag & B1_YNoMirror)) cmt |= G_TX_NOMIRROR;
  if ((flag & B1_YMirror)) cmt |= G_TX_MIRROR;
  pBVar5 = param_2->dat;
  bVar2 = pBVar5->Width;
  x = (u32)bVar2;
  tmem = 0;
  bVar3 = pBVar5->Height;
  i = 0;
  sVar1 = pBVar5->lods;
  lrt = (u32)bVar3;
  if (-1 < sVar1) {
    do { 
      u8 fmt,siz;//1st word of macro got cmd, size, and format optimised together for each case...
      masks = getPow2(x);
      maskt = getPow2(lrt);
      shifts = FUN_8009d3b0((u32)bVar2,x);
      shiftt = FUN_8009d3b0((u32)bVar3,lrt);
      switch(param_2->dat->type) {
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
          if ((x & 1) == 0) {
            iVar10 = 0;
          }
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
      i++;
    } while ((int)i <= (int)sVar1);
  }
  return gfx;
}

//TODO: Redo once relevant data is better understood
Gfx * Ofunc_8009e228(Gfx *param_1,SceneData *param_2,int param_3){
  Gfx *pGVar1;
  u32 uVar2;
  void *pvVar3;
  int iVar4;
  undefined4 *puVar5;
  
  if (*(int *)((int)param_2->scene[3].unk10 + 0x3c) == 0) {
    (param_1->words).w0 = 0xdb060028;
    pvVar3 = param_2->scene[3].unk10;
  }
  else {
    (param_1->words).w0 = 0xdb060028;
    pvVar3 = (void *)((int)param_2->scene[3].unk10 + param_3 * 4);
  }
  uVar2 = osVirtualToPhysical(*(void **)((int)pvVar3 + 0x34));
  (param_1->words).w1 = uVar2;
  pvVar3 = param_2->scene[3].unk10;
  puVar5 = *(undefined4 **)((int)pvVar3 + 0x2c);
  pGVar1 = param_1 + 1;
  for (iVar4 = *(int *)((int)pvVar3 + 4); iVar4 != 0; iVar4 += -1) {
    gSPDisplayList(pGVar1++,osVirtualToPhysical((void *)*puVar5));
    pvVar3 = (void *)*puVar5;
    puVar5++;
  }
  return pGVar1;
}

#define DtoR_f 0.017453292f //a few more decimals used for these funcs.

void Borg5Sub_op0(borg5substruct *param_1,MtxF *mf){
  float sinx;
  float siny;
  float sinz;

  float cosx;
  float cosy;
  float cosz;
  
  cosy = (param_1->rot).x * DtoR_f;
  cosx = (param_1->rot).y * DtoR_f;
  cosz = (param_1->rot).z * DtoR_f;
  sinx = __sinf(cosx);
  cosx = __cosf(cosx);
  siny = __sinf(cosy);
  cosy = __cosf(cosy);
  sinz = __sinf(cosz);
  cosz = __cosf(cosz);
  (*mf)[2][1] = -sinx * (param_1->scale).z;
  (*mf)[0][0] = (cosy * cosz + siny * sinx * sinz) * (param_1->scale).x;
  (*mf)[1][0] = (-cosy * sinz + siny * sinx * cosz) * (param_1->scale).y;
  (*mf)[1][2] = (siny * sinz + cosy * sinx * cosz) * (param_1->scale).y;
  (*mf)[2][0] = siny * cosx * (param_1->scale).z;
  (*mf)[0][1] = cosx * sinz * (param_1->scale).x;
  (*mf)[1][1] = cosx * cosz * (param_1->scale).y;
  (*mf)[0][2] = (-siny * cosz + cosy * sinx * sinz) * (param_1->scale).x;
  (*mf)[2][2] = cosy * cosx * (param_1->scale).z;
  (*mf)[3][0] = (param_1->pos).x;
  (*mf)[3][1] = (param_1->pos).y;
  (*mf)[3][2] = (param_1->pos).z;
  (*mf)[0][3] = 1.0f;
  (*mf)[1][3] = 1.0f;
  (*mf)[2][3] = 1.0f;
  (*mf)[3][3] = 1.0f;
}

void Borg5Sub_op1(borg5substruct *param_1,MtxF *mf){
  float sinx = __sinf((param_1->rot).x * DtoR_f);
  float cosx = __cosf((param_1->rot).x * DtoR_f);
  float siny = __sinf((param_1->rot).y * DtoR_f);
  float cosy = __cosf((param_1->rot).y * DtoR_f);
  float sinz = __sinf((param_1->rot).z * DtoR_f);
  float cosz = __cosf((param_1->rot).z * DtoR_f);
  float fVar8 = cosz * cosy * (param_1->scale).x;
  float fVar5 = sinz * cosy * (param_1->scale).x;
  float fVar4 = (-sinz * cosx + cosz * siny * sinx) * (param_1->scale).y;
  float fVar6 = (sinz * sinx + cosz * siny * cosx) * (param_1->scale).z;
  float fVar15 = cosy * sinx * (param_1->scale).y;
  float fVar13 = cosy * cosx * (param_1->scale).z;
  float fVar7 = (cosz * cosx + sinz * siny * sinx) * (param_1->scale).y;
  (*mf)[0][2] = -siny * (param_1->scale).x;
  (*mf)[0][0] = fVar8;
  (*mf)[0][1] = fVar5;
  (*mf)[1][0] = fVar4;
  float fVar9 = (-cosz * sinx + sinz * siny * cosx) * (param_1->scale).z;
  (*mf)[2][0] = fVar6;
  (*mf)[1][2] = fVar15;
  (*mf)[2][2] = fVar13;
  (*mf)[1][1] = fVar7;
  (*mf)[2][1] = fVar9;
  (*mf)[3][0] = (param_1->pos).x - (fVar8 * (param_1->pivot).x + fVar4 * (param_1->pivot).y + fVar6 * (param_1->pivot).z);
  (*mf)[3][1] = (param_1->pos).y - (fVar5 * (param_1->pivot).x + fVar7 * (param_1->pivot).y + fVar9 * (param_1->pivot).z);
  (*mf)[3][2] = (param_1->pos).z - (-siny * (param_1->scale).x * (param_1->pivot).x + fVar15 * (param_1->pivot).y + fVar13 * (param_1->pivot).z);
  (*mf)[0][3] = 1.0;
  (*mf)[1][3] = 1.0;
  (*mf)[2][3] = 1.0;
  (*mf)[3][3] = 1.0;
}


void Borg5Sub_op2(borg5substruct *param_1,MtxF *param_2){  
  float sinx = __sinf(-(param_1->rot).x * DtoR_f);
  float cosx = __cosf(-(param_1->rot).x * DtoR_f);
  float siny = __sinf(-(param_1->rot).y * DtoR_f);
  float cosy = __cosf(-(param_1->rot).y * DtoR_f);
  float sinz = __sinf(-(param_1->rot).z * DtoR_f);
  float cosz = __cosf(-(param_1->rot).z * DtoR_f);
  (*param_2)[0][2] = sinx;
  (*param_2)[2][2] = cosx * cosy;
  (*param_2)[0][0] = cosz * cosx;
  (*param_2)[0][1] = -sinz * cosx;
  (*param_2)[1][2] = -cosx * siny;
  (*param_2)[1][0] = sinz * cosy + cosz * sinx * siny;
  (*param_2)[2][0] = sinz * siny - cosz * sinx * cosy;
  (*param_2)[1][1] = cosz * cosy - sinz * sinx * siny;
  (*param_2)[2][1] = cosz * siny + sinz * sinx * cosy;
  (*param_2)[3][0] = (param_1->pos).x;
  (*param_2)[3][1] = (param_1->pos).y;
  (*param_2)[3][2] = (param_1->pos).z;
  (*param_2)[0][3] = (param_1->scale).x;
  (*param_2)[1][3] = (param_1->scale).y;
  (*param_2)[2][3] = (param_1->scale).z;
  (*param_2)[3][3] = 1.0f;
}

void some_matrix_func(MtxF *param_1,float posX,float posY,float posZ,float param_5,float param_6,
                     float param_7,float param_8,float param_9,float param_10){
  float fVar1;
  vec3f fStack248;
  vec3f fStack184;
  vec3f fStack120;
  
  fStack248.x = posX - param_5;
  fStack248.y = posY - param_6;
  fStack248.z = posZ - param_7;
  guNormalize(&fStack248.x,&fStack248.y,&fStack248.z);
  fStack184.x = param_9 * fStack248.z - param_10 * fStack248.y;
  fStack184.y = param_10 * fStack248.x - param_8 * fStack248.z;
  fStack184.z = param_8 * fStack248.y - param_9 * fStack248.x;
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
  Vec3Cross(&fStack120,&fStack248,&fStack184);
  (*param_1)[3][0] = posX;
  (*param_1)[3][1] = posY;
  (*param_1)[3][2] = posZ;
  (*param_1)[0][3] = 0.0;
  (*param_1)[1][3] = 0.0;
  (*param_1)[2][3] = 0.0;
  (*param_1)[0][0] = fStack184.x;
  (*param_1)[0][1] = fStack184.y;
  (*param_1)[0][2] = fStack184.z;
  (*param_1)[1][0] = fStack120.x;
  (*param_1)[1][1] = fStack120.y;
  (*param_1)[1][2] = fStack120.z;
  (*param_1)[2][0] = fStack248.x;
  (*param_1)[2][1] = fStack248.y;
  (*param_1)[2][2] = fStack248.z;
  (*param_1)[3][3] = 1.0f;
}

void Borg5Sub_op3(borg5substruct *param_1,MtxF *param_2){
  vec3f outV;
  vec3f inV;
  MtxF rotMtx;
  
  inV.x = 0.0;
  inV.y = 0.0;
  inV.z = 1.0f;
  guRotateRPYF(&rotMtx,(param_1->rot).y,(param_1->rot).x,0.0);
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


void Borg5Sub_op4(borg5substruct *param_1,MtxF *param_2){
  float fVar1;
  float fVar2;
  float fVar3;
  vec3f fStack232;
  vec3f fStack168;
  MtxF afStack104;
  
  fStack232.x = 0.0;
  fStack232.y = 0.0;
  fStack232.z = 1.0f;
  guRotateRPYF(&afStack104,(param_1->rot).y,(param_1->rot).x,0.0);
  MtxXFMF(&fStack168,&afStack104,&fStack232);
  fStack232.x = 0.0;
  fVar3 = (param_1->pos).x - fStack168.x;
  fStack232.y = 1.0f;
  fStack232.z = 0.0;
  fVar2 = (param_1->pos).y - fStack168.y;
  fVar1 = (param_1->pos).z - fStack168.z;
  guRotateRPYF(&afStack104,0.0,0.0,(param_1->rot).z);
  MtxXFMF(&fStack168,&afStack104,&fStack232);
  some_matrix_func(param_2,(param_1->pos).x,(param_1->pos).y,(param_1->pos).z,
    fVar3,fVar2,fVar1,fStack168.x,fStack168.y,fStack168.z);
}


void Borg5Sub_ops(borg5substruct *param_1,MtxF *param_2){
  switch(param_1->mtxOp) {
  case 0:
    Borg5Sub_op0(param_1,param_2);break;
  case 1:
    Borg5Sub_op1(param_1,param_2);break;
  case 2:
    Borg5Sub_op2(param_1,param_2);break;
  case 3:
    Borg5Sub_op3(param_1,param_2);break;
  case 4:
    Borg5Sub_op4(param_1,param_2);
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
  if (out != in) {*out=*in;} //copy mtxf
  (*out)[0][3] = 1.0f;
  (*out)[1][3] = 1.0f;
  (*out)[2][3] = 1.0f;
}


void FUN_8009ee98(borg5substruct *param_1,MtxF *param_2){
  borg5substruct *pbVar1;
  u32 uVar2;
  borg5substruct **ppbVar3;
  MtxF auStack80;
  
  Borg5Sub_ops(param_1,&MtxF_800f54b0);
  some_matrix_func_1(&auStack80,param_2,&MtxF_800f54b0);
  FUN_8009ed9c(&auStack80,param_1->unkStruct->mfs + 1);
  ppbVar3 = param_1->links;
  uVar2 = (u32)param_1->tier;
  param_1->flag = param_1->flag & ~2 | 0x10;
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
  else {some_mtx=param_1->matrixA;}
  FUN_8009f060(param_1,&some_mtx);
  param_1->sceneTicked = true;
}


void Ofunc_8009efd0(SceneData *param_1,MtxF *param_2){
  if (!(param_1->flags & SCENE_0004)) {unused_matrix=*param_2;}
  else ofunc_sub_800abd94(&unused_matrix,param_2,&param_1->matrixA);
  FUN_8009f060(param_1,&unused_matrix);
}

void FUN_8009f060(SceneData *param_1,MtxF *param_2){
  float fVar1;
  Borg5Struct2 *pBVar3;
  Borg3Header *pBVar4;
  float (*pafVar5) [4];
  MtxF *paafVar6;
  float (*pafVar7) [4];
  MtxF *paafVar8;
  MtxF *paafVar9;
  int iVar10;
  int iVar11;
  borg5substruct *pbVar12;
  borg5substruct *pbVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  MtxF mf0;
  MtxF mf1;
  MtxF mf2;
  MtxF mf3;
  MtxF mf5;
  MtxF mf6;
  Borg5Data *pBStack_40;
  float (*pafStack_3c) [4];
  float (*pafStack_38) [4];
  
  pafVar5 = mf0;
  pafVar7 = param_2[1];
  pBStack_40 = &(param_1->scene[0].borg5)->dat;
  do {
    fVar1 = (*(float (*) [4])(*param_2)[0])[1];
    fVar14 = (*(float (*) [4])(*param_2)[0])[2];
    fVar15 = (*(float (*) [4])(*param_2)[0])[3];
    (*pafVar5)[0] = (*(float (*) [4])(*param_2)[0])[0];
    (*pafVar5)[1] = fVar1;
    (*pafVar5)[2] = fVar14;
    (*pafVar5)[3] = fVar15;
    param_2 = (MtxF *)((int)param_2 + 0x10);
    pafVar5 = pafVar5 + 1;
  } while (param_2 != (MtxF *)pafVar7);
  FUN_8009ee48(&mf0,&mf0);
  pbVar12 = pBStack_40->someSubstruct;
  iVar11 = pBStack_40->substructCount;
  if (pBStack_40->borg3P) {
    if ((param_1->flags & SCENE_0040) == 0) {
      if ((param_1->flags & SCENE_0008) == 0) {
        if ((param_1->flags & SCENE_0010) == 0) {
          Borg5Sub_ops(pbVar12,&mf2);
          some_matrix_func_1(&mf5,&mf0,&mf2);
        }
        else {
          Borg5Sub_ops(pbVar12,&param_1->matrixB);
          FUN_8009ee48(&param_1->matrixB,&mf5);
        }
      }
      else if ((param_1->flags & SCENE_0010) == 0) {
        Borg5Sub_ops(pbVar12,&mf2);
        FUN_8009ee48(&param_1->matrixB,&mf1);
        some_matrix_func_1(&mf5,&mf2,&mf1);
      }
      else {
        FUN_8009ee48(&param_1->matrixB,&mf5);
      }
      pafVar5 = param_1->matrixB;
      FUN_8009ed9c(&mf5,pbVar12->unkStruct->mfs + 1);
      pafStack_38 = param_1->matrixE;
      pafStack_3c = (float (*) [4])&pBStack_40;
      pBVar3 = pbVar12->unkStruct;
      paafVar9 = pBVar3->mfs;
      paafVar6 = pBVar3->mfs + 1;
      do {
        fVar1 = (*paafVar6)[0][1];
        fVar14 = (*paafVar6)[0][2];
        fVar15 = (*paafVar6)[0][3];
        (*paafVar9)[0][0] = (*paafVar6)[0][0];
        (*paafVar9)[0][1] = fVar1;
        (*paafVar9)[0][2] = fVar14;
        (*paafVar9)[0][3] = fVar15;
        paafVar6 = (MtxF *)(*paafVar6 + 1);
        paafVar9 = (MtxF *)(*paafVar9 + 1);
      } while ((Mtx *)paafVar6 != &pBVar3->unk100);
      pBVar3 = pbVar12->unkStruct;
      paafVar6 = pBVar3->mfs;
      do {
        fVar1 = (*paafVar6)[0][1];
        fVar14 = (*paafVar6)[0][2];
        fVar15 = (*paafVar6)[0][3];
        (*pafVar5)[0] = (*paafVar6)[0][0];
        (*pafVar5)[1] = fVar1;
        (*pafVar5)[2] = fVar14;
        (*pafVar5)[3] = fVar15;
        paafVar6 = (MtxF *)(*paafVar6 + 1);
        pafVar5 = pafVar5 + 1;
      } while (paafVar6 != pBVar3->mfs + 1);
      FUN_800ab880(pbVar12->unkStruct->mfs + 1,&param_1->matrixC);
      pBVar3 = pbVar12->unkStruct;
      pBVar3->mfs[0][3][0] = pBVar3->mfs[0][3][0] * 16.0f;
      pBVar3->mfs[0][3][1] = pBVar3->mfs[0][3][1] * 16.0f;
      pBVar3->mfs[0][3][2] = pBVar3->mfs[0][3][2] * 16.0f;
      FUN_800ab880(pBVar3->mfs,&param_1->matrixD);
      pBVar4 = pBStack_40->borg3P;
      pbVar12->flag |= 2;
      guPerspectiveF(&mf6,pBVar4->perspnorm + param_1->perspNormIndex,(pBVar4->dat).fovy,
                    (pBVar4->dat).aspect,
                    (pBVar4->dat).nearplane * 16.0f,(pBVar4->dat).farplane * 16.0f,2.0);
      pafVar5 = pafStack_38;
      pafVar7 = mf6;
      do {
        fVar1 = (*(float (*) [4])*pafVar7)[1];
        fVar14 = (*(float (*) [4])*pafVar7)[2];
        fVar15 = (*(float (*) [4])*pafVar7)[3];
        (*pafVar5)[0] = (*(float (*) [4])*pafVar7)[0];
        (*pafVar5)[1] = fVar1;
        (*pafVar5)[2] = fVar14;
        (*pafVar5)[3] = fVar15;
        pafVar7 = pafVar7 + 1;
        pafVar5 = pafVar5 + 1;
      } while (pafVar7 != pafStack_3c);
      some_other_matrix_math(&mf3,&mf6,&param_1->matrixD);
      if ((param_1->flags & SCENE_4000) == 0) guMtxF2L(&mf3,(pBVar4->dat).mtx_[param_1->perspNormIndex]);
      else guMtxF2L(&mf6,&(pBVar4->dat).mtx_[param_1->perspNormIndex]);
    }
    pbVar12++;
    iVar11--;
  }
  iVar10 = pBStack_40->borg4Count + -1;
  if ((pBStack_40->borg4Count != 0) && (iVar10 != 0)) {
    pbVar13 = pbVar12;
    do {
      if ((param_1->flags & SCENE_0020) == 0) {
        Borg5Sub_ops(pbVar13,&mf2);
        some_matrix_func_1(&mf3,&mf0,&mf2);
      }
      else Borg5Sub_ops(pbVar13,&mf3);
      pbVar12++;
      iVar11--;
      FUN_8009ed9c(&mf3,pbVar13->unkStruct->mfs);
      iVar10--;
      paafVar8 = pbVar13->unkStruct->mfs + 1;
      paafVar9 = pbVar13->unkStruct->mfs;
      paafVar6 = paafVar8;
      do {
        fVar1 = (*paafVar9)[0][1];
        fVar14 = (*paafVar9)[0][2];
        fVar15 = (*paafVar9)[0][3];
        (*paafVar6)[0][0] = (*paafVar9)[0][0];
        (*paafVar6)[0][1] = fVar1;
        (*paafVar6)[0][2] = fVar14;
        (*paafVar6)[0][3] = fVar15;
        paafVar9 = (MtxF *)(*paafVar9 + 1);
        paafVar6 = (MtxF *)(*paafVar6 + 1);
      } while (paafVar9 != paafVar8);
      pbVar13->flag = pbVar13->flag | 2;
      pbVar13 = pbVar12;
    } while (iVar10 != 0);
  }
  for (; iVar11 != 0; iVar11--,pbVar12++) {
    if ((pbVar12->flag & 0x100) != 0) FUN_8009ee98(pbVar12,&mf0);
  }
}


void Ofunc_8009f4e0(SceneData *param_1){
  Borg5Header *pBVar2;
  borg5substruct *pbVar3;
  int iVar4;
  
  pBVar2 = param_1->scene[0].borg5;
  pbVar3 = (pBVar2->dat).someSubstruct;
  iVar4 = (pBVar2->dat).substructCount;
  if (0 < iVar4) {
    do {
      if ((pbVar3->flag & 2)) {
        guMtxF2L(pbVar3->unkStruct->mfs,&pbVar3->unkStruct->mtxs[param_1->perspNormIndex]);
      }
      iVar4--;
      pbVar3++;
    } while (iVar4 != 0);
  }
}
void Ofunc_8009f554(SceneData *param_1,vec3f *param_2){
  Borg5Header *pBVar1;
  Borg5Struct2 *pBVar2;
  borg5substruct *pbVar4;
  int iVar5;  
  pBVar1 = param_1->scene[0].borg5;
  pbVar4 = (pBVar1->dat).someSubstruct;
  iVar5 = (pBVar1->dat).substructCount;
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
  Borg5Header *pBVar1 = param_1->scene[0].borg5;
  borg5substruct *pbVar4 = (pBVar1->dat).someSubstruct;
  for (s32 i = (pBVar1->dat).substructCount; i != 0; i--,pbVar4++) {
    Borg5Struct2 *pBVar2 = pbVar4->unkStruct;
    (pBVar2->unk17c).x = pBVar2->mfs[1][3][0] - (pBVar2->unk170).x;
    (pBVar2->unk17c).y = pBVar2->mfs[1][3][1] - (pBVar2->unk170).y;
    (pBVar2->unk17c).z = pBVar2->mfs[1][3][2] - (pBVar2->unk170).z;
  }
}

void Ofunc_8009f664(SceneData *param_1){
  borg5substruct *pbVar4 = (param_1->scene[0].borg5->dat).someSubstruct;
  for (s32 i = (param_1->scene[0].borg5->dat).substructCount; i != 0; i--) {
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
  Borg6Sub *pBVar2;
  u32 uVar3;
  void *pvVar4;
  int iVar5;
  Borg5Header *pbVar6;
  void *bDat;
  borg5substruct *pbVar7;
  Borg6Struct *pBVar8;
  int iVar9;
  
  if ((param_2 != NULL) && ((param_2->flag & 1) == 0)) {
    pBVar8 = param_2->structDat;
    uVar1 = param_2->dat->subCount;
    param_2->unk8 = param_1;
    for(iVar9 = 0;iVar9<uVar1;iVar9++,pBVar8++){
        pBVar2 = pBVar8->sub;
        pbVar6 = (Borg5Header *)getLoadedBorg(pBVar2->borg5);
        uVar3 = pBVar2->unk4;
        if (uVar3 == 1) {
          pbVar7 = ((param_1->scene[0].borg5)->dat).someSubstruct + (int)pBVar8->unk10;
          pBVar8->unk10 = pbVar7;
          pBVar2->borg5 = (u32)pbVar7;
        }
        else {
          if (1 < (int)uVar3) {
            if (uVar3 == 2) {
              pvVar4 = pBVar8->unk10;
              iVar5 = pbVar6[1].head.unk;
              pBVar2->borg5 = (u32)pbVar6;
              pBVar8->unk10 = (void *)(*(int *)(iVar5 + 0x40) + (int)pvVar4 * 0x14 + 4);
            }
            else if (uVar3 == 3) {
              pBVar2->borg5 = (u32)pbVar6;
            }
            continue;
          }
          if (uVar3) continue;
          switch(get_borg_listing_type(pBVar2->borg5)) {
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
          pBVar2->borg5 = (u32)pbVar6;
        }
      }
    param_2->flag |= 1;
  }
}


void Scene_SetBorg6(SceneData *scene,Borg6Header *b6){
  Borg6Header *pBVar1;
  
  if ((b6->flag & 1) == 0) {
    FUN_8009f6b4(scene,b6);
  }
  pBVar1 = scene->scene[0].borg6;
  if (pBVar1 == NULL) {
    scene->scene[0].borg6 = b6;
  }
  else {
    b6->link2 = pBVar1;
    (scene->scene[0].borg6)->link = b6;
    scene->scene[0].borg6 = b6;
  }
  return;
}

void unlinkBorg6(Borg6Header *param_1){
  SceneData *pSVar1;
  Borg6Header *pBVar2;
  
  if ((param_1 != NULL) && (pSVar1 = param_1->unk8, pSVar1 != NULL)) {
    if (param_1->link == NULL) {
      pBVar2 = param_1->link2;
    }
    else {
      param_1->link->link2 = param_1->link2;
      pBVar2 = param_1->link2;
    }
    if (pBVar2 == NULL) {
      pBVar2 = pSVar1->scene[0].borg6;
    }
    else {
      pBVar2->link = param_1->link;
      pBVar2 = pSVar1->scene[0].borg6;
    }
    if (param_1 == pBVar2) {
      pSVar1->scene[0].borg6 = param_1->link2;
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
  
  Borg3Header *pBVar1 = (param_1->dat).borg3P;
  if (pBVar1) {
    (pBVar1->dat).unk18[4] = (s16)((param_2 + param_4) / 2);
    (pBVar1->dat).unk18[5] = (s16)((param_3 + param_5) / 2);
    if (param_2 < param_4) iVar2 = param_4 - param_2;
    else iVar2 = param_2 - param_4;
    *(pBVar1->dat).unk18 = (s16)(iVar2 / 2);
    if (param_3 < param_5) iVar2 = param_5 - param_3;
    else iVar2 = param_3 - param_5;
    (pBVar1->dat).unk18[1] = (s16)(iVar2 / 2);
  }
}

void FUN_8009f9d0(SceneData *param_1,s16 *param_2){
  Borg3Header *pBVar1 = ((param_1->scene[0].borg5)->dat).borg3P;
  if (pBVar1) (pBVar1->dat).unk18 = param_2;
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
  ret->scene[0].borg5 = b5;
  if (b5 == NULL) {
    HFREE(ret,2779);
    CRASH("BorgAnimLoadScene","GetBorgItem failed");
  }
  ret->sceneTicked = false;
  ret->flags = 0;
  ret->perspNormIndex = 0;
  ret->aniTime = 1;
  ret->aniSpeed = 0;
  ret->scene[0].borg6 = NULL;
  guMtxIdentF(&ret->matrixA);
  guMtxIdentF(&ret->matrixB);
  (ret->colorFloats).x = 1.0f;
  (ret->colorFloats).y = 1.0f;
  (ret->colorFloats).z = 1.0f;
  (ret->colorFloats).w = 1.0f;
  CLEAR(&ret->DirLights);
  CLEAR(&ret->envLight);
  pBVar1 = ret->scene[0].borg5;
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
  borg5_free(param_1->scene[0].borg5);
  HFREE(param_1,2870);
}

Borg6Header * get_borg_6(int param_1){
  clearBorgFlag();
  return (Borg6Header *)getBorgItem(param_1);
}

void passto_borg_6_free(Borg6Header *param_1){borg_6_free(param_1);}

Borg7Header * func_loading_borg7(u32 index,ParticleHeadStruct *param_2){
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
  int iVar2;
  int iVar3;
  u16 *puVar4;
  
  if (param_1->sceneDat){
    Particle::UnsetSceneEmmiter(param_1->sceneDat->particleHead,param_1->sceneDat);
  }
  iVar3 = 0;
  if (0 < (param_1->dat).subCount) {
    puVar4 = &(param_1->dat).sub[0].flag;
    do {
      if ((*puVar4 & 2) != 0) {
        unlinkBorg6(param_1->unk18[iVar3].b6);
      }
      iVar3 += 1;
      puVar4 = puVar4 + 6;
    } while (iVar3 < (param_1->dat).subCount);
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

void takeBranch(Borg7Header *param_1,b7SubSub *param_2){
  Borg7Sub *pBVar1;
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
  struct_45 *psVar11;
  
  if (3 < animChache) CRASH("TakeBranch","AnimCache out of range");
  FUN_8009fd98(param_1);
  bVar9 = false;
  uVar10 = 0;
  param_1->unk1c->b6 = NULL;
  pBVar1 = param_1->unk18[param_2->unk3].sub;
  psVar11 = &param_1->unk38;
  param_1->unk1c = param_1->unk18 + param_2->unk3;
  index = pBVar1->borg6;
  if (animChache != 0) {
    puVar7 = (param_1->unk38).indecies;
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
    (param_1->unk38).indecies[0] = index;
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
  Borg7Sub *pBVar1 = param_1->unk1c->sub;
  b7SubSub *pbVar2 = pBVar1->p;
  for(s32 i=pBVar1->subSubCount;param_2 != pbVar2->ani;i--,pbVar2++) {
    if(!i) return; //animation was not in range.
  }
  param_1->currentAni = param_2;
}

bool FUN_800a00d0(Borg7Header *param_1){
  int rand;
  vec3f scenePos;
  
  if (!UINT_800f3390) UINT_800f3390 = true; //?
  bool bVar3 = false;
  Borg7Sub *pBVar2 = param_1->unk1c->sub;
  if (Borg7_AnimationExpired(param_1)) {
    b7SubSub *pbVar9 = pBVar2->p;
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
    b7SubSub *pbVar10 = pBVar2->p;
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

bool Borg7_TickAnimation(Borg7Header *param_1,int delta){
  Borg7Sub *pBVar1;
  u32 i_00;
  bool bVar2;
  bool bVar4;
  int rand;
  s16 sVar3;
  s32 lVar5;
  b7SubSub *pbVar6;
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
          if ((param_1->currentAni == (u16)pbVar6->ani) && ((pbVar6->flag & 1) != 0)) {
            rand -= (u32)pbVar6->unk1;
            if (rand < 1) {
              bVar2 = true;
              takeBranch(param_1,pbVar6);
              goto LAB_800a046c;
            }
            pbVar6++;
          }
          else {
            pbVar6++;
          }
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
      sVar3 = 2;
      if (bVar2) {
LAB_800a053c:
        param_1->unk12 = sVar3;
      }
      else if (param_1->unk12 != 0) {
        sVar3 = param_1->unk12 + -1;
        goto LAB_800a053c;
      }
      (param_1->unk20).x = local_60.x;
      (param_1->unk20).y = local_60.y;
      (param_1->unk20).z = local_60.z;
    } while (i < delta);
  }
  return bVar2;
}

u16 Borg7_GetAniTime(Borg7Header *param_1){return param_1->sceneDat->aniTime;}


void Borg7_StartParticles(Borg7Header *param_1){
  u32 count = ((param_1->sceneDat->scene[0].borg5)->dat).ParticleCount;
  if (((count != 0) && (param_1->sceneDat->particleHead))) {
    for(u32 i=0;i<count;i++) {
      SceneData *scene = param_1->sceneDat;
      Borg5_particle *dat = scene->scene[0].borg5->dat.ParticleDat[i];
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
    if (((param_2->sceneDat->flags & SCENE_0040) == 0) && (((param_2->sceneDat->scene[0].borg5)->dat).borg3P)) {
      g = gsAnimationDataMtx(g,param_2->sceneDat);
    }
    g = BorgAnimDrawSceneRaw(g,param_2->sceneDat);
    FUN_800a80d8(param_2->sceneDat,&avStack_50,(param_2->dat).unk0);
  }
  return g;
}
//TODO: Redo once relevant data is better understood
void FUN_800a0714(SceneDatSubstruct *param_1){
  float *pfVar1;
  s32 uVar2;
  s32 uVar3;
  u32 *puVar4;
  u32 *puVar5;
  u32 uVar6;
  
  puVar5 = (u32 *)param_1->unk8;
  param_1->unk4 = param_1->unk0->unk4;
  pfVar1 = param_1->unk0->unk4;
  param_1->unkc = 1;
  uVar3 = *(s16 *)((int)pfVar1 + 2);
  puVar4 = *(u32 *)pfVar1[1];
  while (uVar3 != 0) {
    uVar2 = uVar3 & 1;
    uVar3 >>=1;
    if (uVar2 != 0) {
      uVar6 = *puVar4;
      puVar4++;
      *puVar5 = uVar6;
    }
    puVar5++;
  }
  return;
}


void FUN_800a0764(SceneDatStruct *param_1,float param_2){
  if ((param_1->borg5->head).unk == 1) FUN_800a0800(param_1,param_2);
  else FUN_800a07b0(param_1,param_2);
}

//TODO: Redo once relevant data is better understood
void FUN_800a07b0(SceneDatStruct *param_1,float param_2){
  void **ppvVar1;
  u32 uVar2;
  void *pvVar3;
  float *pfVar4;
  SceneDatSubstruct *pSVar5;
  
  pSVar5 = param_1->sub;
  pvVar3 = param_1->borg5->aniTextures;
  pfVar4 = (float *)param_1->unk10;
  while (pvVar3 != NULL) {
    uVar2 = (u32)pvVar3 & 1;
    pvVar3 = (void *)((int)pvVar3 >> 1);
    if (uVar2 != 0) {
      ppvVar1 = &pSVar5->unk8;
      pSVar5++;
      *pfVar4+= **ppvVar1 * param_2;
    }
    pfVar4++;
  }
}

//TODO: Redo once relevant data is better understood
void FUN_800a0800(SceneDatStruct *param_1,float param_2){
  void **ppvVar1;
  float *pfVar2;
  vec3f *pvVar3;
  vec3f *pvVar4;
  vec3f *pvVar5;
  void *pvVar6;
  SceneDatSubstruct *pSVar7;
  int iVar8;
  borg5substruct *pvVar2;
  
  iVar8 = 3;
  pvVar2 = (borg5substruct *)param_1->unk10;
  pSVar7 = param_1->sub;
  pvVar5 = &pvVar2->rot;
  pvVar6 = param_1->borg5->aniTextures;
  pvVar4 = &pvVar2->unkStruct->unk158;
  pvVar3 = &pvVar2->unkStruct->unk164;
  do {
    iVar8 += -1;
    if (((u32)pvVar6 & 1) != 0) {
      pfVar2 = (float *)pSVar7->unk8;
      pvVar5->x = pvVar5->x + *pfVar2 * param_2;
      pvVar4->x = pvVar4->x + pfVar2[1] * param_2;
      pSVar7 = pSVar7 + 1;
      pvVar3->x = pvVar3->x + pfVar2[2] * param_2;
    }
    pvVar6 = (void *)((int)pvVar6 >> 1);
    pvVar5 = (vec3f *)&pvVar5->y;
    pvVar4 = (vec3f *)&pvVar4->y;
    pvVar3 = (vec3f *)&pvVar3->y;
  } while (iVar8 != 0);
  iVar8 = 3;
  pvVar4 = &pvVar2->unkStruct->unk140;
  pvVar3 = &pvVar2->unkStruct->unk14c;
  do {
    iVar8 += -1;
    if (((u32)pvVar6 & 1) != 0) {
      pfVar2 = (float *)pSVar7->unk8;
      pvVar5->x += *pfVar2 * param_2;
      pvVar4->x += pfVar2[1] * param_2;
      pvVar3->x += pfVar2[2] * param_2;
      pSVar7++;
    }
    pvVar6 = (void *)((int)pvVar6 >> 1);
    pvVar5 = (vec3f *)((int)pvVar5 + 4);
    pvVar4 = (vec3f *)&pvVar4->y;
    pvVar3 = (vec3f *)&pvVar3->y;
  } while (iVar8 != 0);
  iVar8 = 3;
  do {
    iVar8 += -1;
    if (((u32)pvVar6 & 1) != 0) {
      ppvVar1 = &pSVar7->unk8;
      pSVar7 = pSVar7 + 1;
      pvVar5->x = pvVar5->x + **ppvVar1 * param_2;
    }
    pvVar6 = (void *)((int)pvVar6 >> 1);
    pvVar5 = (vec3f *)((int)pvVar5 + 4);
  } while (iVar8 != 0);
  return;
}
//TODO: Redo once relevant data is better understood
void FUN_800a0940(Borg6Struct *param_1){
  Borg6Sub *pBVar1;
  borg5substruct *puVar2;
  u32 uVar2;
  Borg5Struct2 *iVar1;
  
  pBVar1 = param_1->sub;
  puVar2 = (borg5substruct *)param_1->unk10;
  if (pBVar1->unk4 == 1) {
    iVar1 = puVar2->unkStruct;
    puVar2 = (borg5substruct *)&puVar2->rot;
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
    pBVar1 = param_1->sub;
  }
  for (uVar2 = pBVar1->unkc; uVar2 != 0; uVar2 = (int)uVar2 >> 1) {
    if ((uVar2 & 1) != 0) {
      puVar2->flag = 0;
      puVar2->mtxOp = 0;
      puVar2->tier = 0;
    }
    puVar2 = (borg5substruct *)&puVar2->links;
  }
  return;
}

void FUN_800a09c0(Borg6Struct *param_1) {
  SceneDatSubstruct *pSVar2 = param_1->unkc;
  for (u32 uVar1 = param_1->sub->subCount; uVar1 != 0; uVar1--) {
    FUN_800a0714(pSVar2);
    pSVar2++;
  }
}

void FUN_800a0a08(SceneData *param_1) {
  u32 uVar2;
  Borg6Struct *pBVar3;
  Borg6Header *pBVar4;
  
  pBVar4 = param_1->scene[0].borg6;
  param_1->aniTime = 1;
  if (pBVar4) {
    while( true ) {
      pBVar3 = pBVar4->structDat;
      for (uVar2 = pBVar4->dat->subCount; uVar2 != 0; uVar2--) {
        FUN_800a09c0(pBVar3);
        pBVar3++;
      }
      pBVar4 = pBVar4->link2;
      if (pBVar4 == NULL) break;
    }
  }
  return;
}

//progress animation 1/60 second tick
//TODO: Redo once relevant data is better understood.
void FUN_800a0a74(Borg6Struct *param_1){
  Borg6SubSub *pBVar1;
  void *pvVar2;
  float *pfVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  u16 uVar6;
  int iVar7;
  SceneDatSubstruct *pSVar8;
  u32 uVar9;
  undefined4 uVar10;
  
  uVar9 = param_1->sub->subCount;
  pSVar8 = (SceneDatSubstruct *)param_1->unkc;
joined_r0x800a0a8c:
  if (uVar9 == 0) {
    return;
  }
  pBVar1 = pSVar8->unk0;
  if (pSVar8->unkc != pBVar1->unk0) {
    pvVar2 = pSVar8->unk4;
    if (*(s16 *)((int)pvVar2 + 8) == pSVar8->unkc) {
      puVar4 = (undefined4 *)pSVar8->unk8;
      iVar7 = 4;
      pSVar8->unk4 = (s16 *)((int)pvVar2 + 8);
      uVar6 = *(u16 *)((int)pvVar2 + 10);
      puVar5 = *(undefined4 **)((int)pvVar2 + 0xc);
      do {
        if ((uVar6 & 1) != 0) {
          if (iVar7 != 0) goto LAB_800a0b40;
          pvVar2 = pSVar8->unk4;
          goto LAB_800a0b6c;
        }
        puVar4 = puVar4 + 1;
        iVar7 += -1;
        uVar6 = (s16)uVar6 >> 1;
      } while (iVar7 != 0);
    }
    goto LAB_800a0b68;
  }
  iVar7 = pBVar1->unk8;
  if (iVar7 == 1) {
LAB_800a0ad8:
    FUN_800a0714(pSVar8);
  }
  else if (iVar7 < 2) {
    if (iVar7 == 0) goto LAB_800a0ad8;
  }
  else if (iVar7 == 2) goto LAB_800a0ad8;
  goto LAB_800a0bd8;
LAB_800a0b40:
  do {
    if ((uVar6 & 1) == 0) {
      *puVar4 = 0;
    }
    else {
      uVar10 = *puVar5;
      puVar5 = puVar5 + 1;
      *puVar4 = uVar10;
    }
    puVar4 = puVar4 + 1;
    iVar7 += -1;
    uVar6 = (s16)uVar6 >> 1;
  } while (iVar7 != 0);
LAB_800a0b68:
  pvVar2 = pSVar8->unk4;
LAB_800a0b6c:
  pfVar3 = (float *)pSVar8->unk8;
  uVar6 = *(u16 *)((int)pvVar2 + 2);
  if (((uVar6 & 2) != 0) && (*pfVar3 = *pfVar3 + pfVar3[1], (uVar6 & 4) != 0)) {
    pfVar3[1] = pfVar3[1] + pfVar3[2];
    if ((uVar6 & 8) != 0) {
      pfVar3[2] = pfVar3[2] + pfVar3[3];
    }
  }
  pSVar8->unkc = pSVar8->unkc + 1;
LAB_800a0bd8:
  pSVar8 = pSVar8 + 1;
  uVar9 -= 1;
  goto joined_r0x800a0a8c;
}

void Scene::Tick(SceneData *param_1){
  byte bVar1;
  Borg6Data *pBVar2;
  Borg6Struct *pBVar3;
  SceneDatStruct *pSVar4;
  u32 i;
  Borg6Header *pBVar5;
  u32 uVar6;
  float fVar7;
  ulonglong unaff_f22;
  
  if ((param_1->aniSpeed != 0) && (pBVar5 = param_1->scene[0].borg6, pBVar5 != NULL)) {
    pBVar2 = pBVar5->dat;
    while( true ) {
      uVar6 = pBVar2->subCount;
      pBVar3 = pBVar5->structDat;
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
    pBVar5 = param_1->scene[0].borg6;
    if (pBVar5){
      fVar7 = pBVar5->unk1c;
      while( true ) {
        if ((double)fVar7 != (double)(unaff_f22 & 0xffffffff00000000)){//?
          pSVar4 = (SceneDatStruct *)pBVar5->structDat;
          for (uVar6 = pBVar5->dat->subCount; uVar6 != 0; uVar6--) {
            FUN_800a0764(pSVar4,pBVar5->unk1c);
            pSVar4++;
          }
        }
        pBVar5 = pBVar5->link2;
        if (pBVar5 == NULL) break;
      }
    }
    param_1->aniTime+= (u16)param_1->aniSpeed;
  }
}

void Ofunc_800a0d30(Borg6Header *param_1,int param_2){
  Borg6Struct *pBVar1;
  int iVar2;
  u32 uVar3;
  
  uVar3 = param_1->dat->subCount;
  pBVar1 = param_1->structDat;
  while (uVar3 != 0) {
    uVar3 -= 1;
    iVar2 = param_2;
    if (param_2 != 0) {
      do {
        FUN_800a0a74(pBVar1);
        iVar2 += -1;
      } while (iVar2 != 0);
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
    borg5substruct*b5Sub;
    Borg2Header*b2;
    Borg1Header*b1;
    astruct_3*unk14;
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
  u32 flag = *(u32 *)(unkAnimStructB.unk14)->flags;
  if (!(flag & 0x200)) geoMode = G_SHADE|G_ZBUFFER;
  if ((flag & 0x10))geoMode |= G_SHADING_SMOOTH;
  if ((flag & 4)) geoMode |= G_CULL_BACK;
  if (!(flag & 8)) geoMode |= G_LIGHTING;
  if (!unkAnimStructB.b1) {gDPSetCombine(g++,0xfffe03,0xff0e79ff);}
  else {
    if ((flag & 1) == 0) {
      if (((unkAnimStructB.b1)->dat->flag & B1_TDDetail) == 0) {
        uVar6 = (unkAnimStructB.b1)->dat->lods;
      }
      else uVar6 = (unkAnimStructB.b1)->dat->lods - 1;
      gSPTexture(g++,0x8000,0x8000,uVar6,0,2);
    }
    else {
      geoMode|=((flag & 2) != 0)?G_TEXTURE_GEN|G_TEXTURE_GEN_LINEAR:G_TEXTURE_GEN;
      gSPTexture(g++,(unkAnimStructB.b1)->dat->Width<<6,(unkAnimStructB.b1)->dat->Height<<6,
        (unkAnimStructB.b1->dat->lods ),0,2);
    }                         //should still equal G_TF_AVERAGE or G_TF_POINT
    gDPSetTextureFilter(g++,((flag & 0x80) == 0) << (G_MDSFT_TEXTFILT+1));
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
    r = (int)(((unkAnimStructB.scene)->colorFloats).r * ((unkAnimStructB.unk14)->unk4).r *
             255.0f) ;
    g = (int)(((unkAnimStructB.scene)->colorFloats).g * ((unkAnimStructB.unk14)->unk4).g *
             255.0f);
    b = (int)(((unkAnimStructB.scene)->colorFloats).b * ((unkAnimStructB.unk14)->unk4).b *
             255.0f);
    a = (int)(((unkAnimStructB.scene)->colorFloats).a *
              (1.0f - ((unkAnimStructB.unk14)->unk4).a) *
              (1.0f - (unkAnimStructB.b2)->dat->alpha) * 255.0f);
    c1 = 0x112078;
    if (255 <= a) goto LAB_800a1428;
  }
  else {
    r = ((unkAnimStructB.scene)->colorFloats).r * 255.0f;
    g = ((unkAnimStructB.scene)->colorFloats).g * 255.0f;
    b = ((unkAnimStructB.scene)->colorFloats).b * 255.0f;
    a = ((unkAnimStructB.scene)->colorFloats).a *
            (1.0f - ((unkAnimStructB.unk14)->unk4).a) *
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

void Ofunc_800a1548(vec3f *param_1){
  vec3f_800f3378.x = param_1->x;
  vec3f_800f3378.y = param_1->y;
  vec3f_800f3378.z = param_1->z;
}

Gfx * gsAnimationDataMtx(Gfx *G,SceneData *param_2){
  Borg5Header *pBVar1;
  Borg3Header *pBVar2;
  u32 uVar4;
  
  pBVar1 = param_2->scene[0].borg5;
  uVar4 = param_2->perspNormIndex & 1;
  if ((pBVar1->dat).borg3P) {
    vec3f_800f3378.x = param_2->matrixB[3][0];
    vec3f_800f3378.y = param_2->matrixB[3][1];
    vec3f_800f3378.z = param_2->matrixB[3][2];
    pBVar2 = (pBVar1->dat).borg3P;
    gSPMatrix(G++,(u32)((pBVar2->dat).mtx_ + uVar4),G_MTX_PROJECTION|G_MTX_LOAD);
    gSPPerspNormalize(G++,(u32)pBVar2->perspnorm[uVar4]);
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
  undefined1 *puVar14;
  Borg4Header **ppBVar15;
  float (*pafVar16) [4];
  u32 uVar17;
  u32 uVar18;
  Borg4Header **ppBVar19;
  int iVar20;
  int iVar21;
  float (*mf) [4] [4];
  int i;
  int iVar22;
  borg5substruct *pbVar23;
  u16 *puVar24;
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  undefined1 uVar32;
  float fVar30;
  float fVar33;
  float fVar34;
  float fVar35;
  float fVar36;
  float fVar37;
  float fStack_1c0;
  float fStack_1bc;
  vec3f fStack384;
  float afStack320 [4] [4];
  char errBuff [128];
  Mtx_t auStack128;
  
  fVar30 = 1.0f;
  pBVar1 = param_2->scene[0].borg5;
  unkAnimStructB.b2 = NULL;
  unkAnimStructB.b1 = NULL;
  unkAnimStructB.unk14 = NULL;
  unkAnimStructB.b5 = &pBVar1->dat;
  pbVar23 = (pBVar1->dat).someSubstruct;
  uVar17 = param_2->perspNormIndex & 1;
  if ((pBVar1->dat).borg3P) pbVar23++;
  iVar22 = 0;
  unkAnimStructB.scene = param_2;
  if ((param_2->flags & SCENE_8000) == 0) {
    i = (pBVar1->dat).borg4Count;
    if (((param_2->flags & SCENE_0080) == 0) && (i != 0)) {
      ppBVar19 = unkAnimStructB.unk1c;
      ppBVar15 = (pBVar1->dat).borg4p;
      iVar20 = uVar17 * 0x10;
      do {
        iVar21 = iVar22;
        pBVar2 = pbVar23->unkStruct;
        fStack_1c0 = (pbVar23->scale).x;
        if ((fVar30 < fStack_1c0) || (0.0 <= fStack_1c0)) {
          if (fVar30 < fStack_1c0) {
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
        pLVar4[uVar17].dir[0]=pBVar2->mfs[1][2][0] *90.0f;
        pLVar4[uVar17].dir[1]=pBVar2->mfs[1][2][1] *90.0f;
        pLVar4[uVar17].dir[2]=pBVar2->mfs[1][2][2] *90.0f;
        pLVar4[uVar17].col[0]=pLVar4[uVar17].colc[0]=fVar26*255.0f;
        pLVar4[uVar17].col[1]=pLVar4[uVar17].colc[1]=fVar27*255.0f;
        pLVar4[uVar17].col[2]=pLVar4[uVar17].colc[2]=fVar28*255.0f;
        pBVar3 = *ppBVar15;
        ppBVar15++;
        pbVar23++;
        iVar22 = iVar21 + 1;
        *ppBVar19 = pBVar3;
        ppBVar19 = ppBVar19 + 1;
      } while (i != 0);
      i = (unkAnimStructB.b5)->borg4Count;
      if (i == 1) {
        gSPLight(g++,(u32)&pLVar4[uVar17],2);
        gSPLight(g++,(u32)&gBlackLight,1);
        pGVar12 = g;
      }
      else {
        ppBVar15 = (unkAnimStructB.b5)->borg4p;
        pGVar12 = g;
        if (i != 0) {
          u8 ind=1;
          do {
            pBVar3=*ppBVar15;
            gSPLight(g++,(u32)&pBVar3->dat->l[uVar17],ind);
            i--;
            ind++;
            ppBVar15++;
            g = pGVar12;
          } while (i != 0);
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
    i = 0;
    s32 aiStack512[]={1,2,3,4,5,6,7};
    if (0 < (int)param_2->currLights) {
      do {
        gSPLight(g++,&(unkAnimStructB.scene)->DirLights[i],i+1);
      } while (i < (int)(unkAnimStructB.scene)->currLights);
    }
    gSPLight(g++,&(unkAnimStructB.scene)->envLight,i+1);
    gSPNumLights(g++,aiStack512[i + -1]);
    (unkAnimStructB.scene)->currLights = 0;
    pGVar10 = g;
  }
switchD_800a1cc4_caseD_8:
  if (iVar22 < 8) {
    ppBVar15 = unkAnimStructB.unk1c + iVar22;
    do {
      *ppBVar15 = NULL;
      iVar22++;
      ppBVar15++;
    } while (iVar22 < 8);
  }
  pGVar10 = FUN_800a0e60(pGVar10);
  iVar22 = (unkAnimStructB.b5)->unk0x14;
  puVar24 = (unkAnimStructB.b5)->borg1lookup;
  fVar30 = 1.0f;
  do {
    if (iVar22 == 0) {
      param_2->sceneTicked = false;
      param_2->perspNormIndex^= 1;
      unkAnimStructB.b5 = NULL;
      return pGVar10;
    }
    uVar18 = *puVar24 & 0xff;
    pGVar12 = pGVar10;
    switch((int)((u32)*puVar24 << 0x10) >> 0x18) {
    case 1:
      if (uVar18 == 0xff) {
        pGVar12 = pGVar10 + 1;
        unkAnimStructB.b1 = NULL;
        gSPTexture(pGVar10++,0,0,0,0,0);
      }
      else {
        unkAnimStructB.b1 = (unkAnimStructB.b5)->borg1p[uVar18];
        pGVar12 = FUN_8009d3dc(pGVar10,unkAnimStructB.b1,(u8)uVar17);
      }
      break;
    case 2:
      pbVar23 = (unkAnimStructB.b5)->someSubstruct + uVar18;
      pGVar12 = pGVar10 + 1;
      unkAnimStructB.b5Sub = pbVar23;
      if ((pbVar23->flag & 2) == 0) {
        pBVar2 = pbVar23->unkStruct;
        mf = pBVar2->mfs;
        if ((pbVar23->flag & 0x200) == 0) {
          *pBVar2->mfs=*pBVar2->mfs + 1;
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
        memcpy(pBVar8->someMtx,mf,0x40);
        guMtxF2L(mf,&unkAnimStructB.b5Sub->unkStruct->mtxs[uVar17]);
        (unkAnimStructB.b5Sub)->flag |= 2;
      }
      gSPMatrix(pGVar10,(u32)((unkAnimStructB.b5Sub)->unkStruct->mtxs + uVar17),G_MTX_LOAD);
      break;
    case 3:
      CRASH("BorgAnimDrawSceneRaw()","We are not using animated textures on this project :)");
    case 4:
      unkAnimStructB.b2 = (unkAnimStructB.b5)->borg2p[uVar18];
      gSPSegment(pGVar10++,10,osVirtualToPhysical((unkAnimStructB.b2)->dat->vertlist2));
      gSPSegment(pGVar10++,14,osVirtualToPhysical((unkAnimStructB.b2)->dat->vertlist));
      pGVar12 = pGVar10;
      break;
    case 5:
      pBVar5 = (unkAnimStructB.b2)->dat;
      pGVar6 = pBVar5->dsplists[uVar18];
      if (((pGVar6) &&
          ((((pGVar6->words).w0 != sEndDL.words.w0 || ((pGVar6->words).w1 != sEndDL.words.w1)) &&
           (((pBVar5->unk0x28 ^ 1) & 1))))) &&
         (((unkAnimStructB.unk14 = pBVar5->unk0x40 + uVar18, unkAnimStructB.unk14 != NULL &&
           (pBVar5->alpha < fVar30)) && (((unkAnimStructB.unk14)->unk4).a < fVar30)))) {
        if (pBVar5->dsplistcount <= (int)uVar18) {
          sprintf(errBuff,"INVALID BORG SCENE\nop >= n op: %i n: %i",pBVar5->dsplistcount,uVar18);
          CRASH("./src/borganim.cpp",errBuff);
        }
        if ((unkAnimStructB.b2)->dlistSet[uVar18]) {
          pGVar12 = setStaticMode((unkAnimStructB.b2)->dlist[uVar18]);
          gSPEndDisplayList(pGVar12++);
          (unkAnimStructB.b2)->dlistSet[uVar18] = 0;
        }
        gSPDisplayList(pGVar10++,osVirtualToPhysical((unkAnimStructB.b2)->dlist[uVar18]));
        pGVar12 = FUN_800a1184(pGVar10);
        pGVar10 = pGVar12;
        if ((*(u32 *)(unkAnimStructB.unk14)->flags & 1) != 0) {
          guLookAtReflect(&auStack128,(unkAnimStructB.b2)->lookat[0] + uVar17,
                              param_2->matrixB[3][0],param_2->matrixB[3][1],param_2->matrixB[3][2],
                              (unkAnimStructB.b5Sub)->unkStruct->mfs[1][3][0],
                              (unkAnimStructB.b5Sub)->unkStruct->mfs[1][3][1],
                              (unkAnimStructB.b5Sub)->unkStruct->mfs[1][3][2],0.0,fVar30,0.0);
          gSPLookAt(pGVar12++,(unkAnimStructB.b2)->lookat[uVar17]);
          pGVar10 = pGVar12;
        }
        pGVar12 = pGVar10 + 1;
        gSPDisplayList(pGVar10++,osVirtualToPhysical(pGVar6));
      }
    }
    iVar22--;
    puVar24 = puVar24 + 1;
    pGVar10 = pGVar12;
    fVar30 = 1.0f;
  } while( true );
}

void NOOP_800a2448(void *x){}

Gfx * ret_A0(Gfx *g){return g;}
