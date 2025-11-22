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
  //gDPSetRenderMode()
  if ((flag & 2) == 0) word1 =0xf0a4000;
  else word1 = (G_RM_XLU_SURF2|0x400000);
  gDPSetRenderMode(gfx++,word1,0);
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

//{gDPLoadTextureBlock();gSPScisTextureRectangle();} seems very common. Combine into own macro?

Gfx * N64BorgImageDraw(Gfx *g,Borg8Header *borg8,float x,float y,u16 param_5,
                      u16 param_6,u16 h,u16 v,float hScale,float vScale,u8 red,u8 green,
                      u8 blue,u8 alpha){
  u16 uVar1;
  u16 iVar2;
  void *pvVar3;
  short sVar10;
  u32 uVar4;
  int iVar5;
  int iVar6;
  u32 uVar7;
  u32 uVar8;
  int iVar9;
  u32 uVar12;
  u32 uVar13;
  int iVar14;
  u32 uVar15;
  u32 uVar16;
  u32 uVar17;
  u32 uVar18;
  u32 uVar19;
  u32 uVar20;
  u32 uVar21;
  u32 uVar22;
  u32 uVar23;
  Gfx *pGVar24;
  Gfx *pGVar25;
  u32 uVar26;
  u32 uVar27;
  short sVar28;
  int iVar29;
  float fVar30;
  int iVar31;
  int iVar32;
  float fVar33;
  float fVar36;
  double dVar34;
  double dVar35;
  float fVar37;
  float fVar38;
  float fVar39;
  u32 uStack_38;
  short sVar11;
  
  fVar37 = sImageVScale;
  fVar30 = 4.0f;
  fVar38 = hScale * sImageHScale;
  pvVar3 = (borg8->dat).offset;
  fVar39 = vScale * sImageVScale;
  uVar26 = (u32)h - (u32)param_5;
  fVar36 = x * sImageHScale;
  uVar1 = (borg8->dat).Width;
  gDPPipeSync(g++);
  gDPSetPrimColor(g++,0,0,red,green,blue,alpha);
  fVar33 = 4.0f;
  uVar17 = (u32)v - (u32)param_6;
  fVar37 = y * fVar37 * fVar30;
  iVar29 = (int)((float)uVar26 * fVar38 * fVar30);
  iVar31 = (int)(fVar36 * fVar30);
  iVar32 = (int)(1024.0f / fVar38);
  iVar2 = (borg8->dat).format;
  uStack_38 = (u32)(1024.0f / fVar39);
  pGVar24 = g;
  if (8 < (borg8->dat).format)CRASH("N64BorgImage.cpp N64BorgImageDraw","Image type was  not recognized.");
  uVar15 = (u32)uVar1;
  uVar21 = (u32)param_5;
  uVar20 = (u32)param_5;
  sVar10 = (short)iVar32;
  sVar11 = (short)uStack_38;
  sVar28 = (short)iVar31;
  switch((borg8->dat).format) {
  case BORG8_RBGA32:
    if ((int)uVar26 < 2) {
      iVar5 = 2 - uVar26;
    }
    else {
      iVar5 = 2 - (uVar26 & 1);
      if ((uVar26 & 1) == 0) {
        iVar5 = 0;
      }
    }
    uVar13 = (uVar26 + iVar5) * 4;
    uVar22 = 0x1000 / uVar13 - 1;
    uVar13 = uVar17 / uVar22;
    uVar17 -= uVar13 * uVar22;
    if (uVar17 == 0) {
      uVar13 -= 1;
      uVar17 = uVar22;
    }
    dVar35 = (double)uVar22;
    if ((int)uVar22 < 0) {
      dVar35 = dVar35 + UINT_MAX_d;
    }
    pGVar25 = g + 3;
    uVar23 = 0;
    dVar34 = (double)uVar17;
    gDPSetTextureLUT(g++,0);
    fVar33 = (float)dVar35 * fVar39 * fVar33;
    uVar4 = (u32)sVar28;
    if (uVar13 != 0) {
      uVar8 = (uVar21 - 1) + uVar26;
      uVar12 = ((int)((uVar8 - uVar20) * 2 + 9) >> 3 & 0x1ffU) << 9 | 0xf5180000;
      uVar19 = (uVar8 & 0x3ff) << 0xe;
      uVar27 = (uVar21 << 2 & 0xfff) << 0xc;
      uVar18 = (iVar31 + iVar29) * 0x10000 >> 0x10;
      uVar8 = uVar16;
      pGVar24 = pGVar25;
      do {
        gDPLoadTextureBlock(pGVar24++,pvVar3,0,G_IM_SIZ_32b,uVar26,uVar22,0/*?*/,
          2,2,0,0,0,0);
        gSPScisTextureRectangle(pGVar24++,uVar4,fVar37,uVar18,(fVar37 + fVar33),
        0,0/*?*/,0/*?*/,iVar32,uStack_38)
      } while (uVar23 < uVar13);
    }
    fVar30 = 4.0f;
    if ((int)uVar17 < 0) {
      dVar34 = dVar34 + UINT_MAX_d;
    }
    (pGVar25->words).w0 = uVar15 - 1 & 0xfff | 0xfd180000;
    (pGVar25->words).w1 = (u32)pvVar3;
    *(undefined4 *)((int)pGVar25 + 0xc) = 0x7080200;
    uVar13 = (uVar21 - 1) + uVar26;
    uVar15 = ((int)((uVar13 - uVar20) * 2 + 9) >> 3 & 0x1ffU) << 9 | 0xf5180000;
    pGVar25[1].words.w0 = uVar15;
    gDPLoadSync(&pGVar25[2]);
    gDPLoadTile(&pGVar25[3],7,uVar16,uVar13,uVar21,uVar17);
    gDPLoadSync(&pGVar25[4]);
    pGVar25[5].words.w0 = uVar15;
    *(undefined4 *)((int)pGVar25 + 0x2c) = 0x80200;
    pGVar25[6].words.w0 = uVar21 | uVar22 | 0xf2000000;
    *(u32 *)((int)pGVar25 + 0x34) = uVar20 | uVar16;
    pGVar25[7].words.w0 = 0xf2000000;
    *(u32 *)((int)pGVar25 + 0x3c) = (uVar26 - 1 & 0x3ff) << 0xe | (uVar17 - 1 & 0x3ff) << 2;
    uVar17 = (u32)(short)(iVar31 + iVar29);
    pGVar24 = pGVar25 + 9;
    if ((int)uVar17 < 1) {
      uVar17 = 0xe4000000;
    }
    else {
      uVar17 = (uVar17 & 0xfff) << 0xc | 0xe4000000;
    }
    uVar16 = (u32)(short)(int)(fVar37 + (float)dVar34 * fVar39 * fVar30);
    if (0 < (int)uVar16) {
      uVar17 |= uVar16 & 0xfff;
    }
    pGVar25[8].words.w0 = uVar17;
    if ((int)uVar4 < 1) {
      uVar17 = 0;
    }
    else {
      uVar17 = (uVar4 & 0xfff) << 0xc;
    }
    if (0 < (short)(int)fVar37) {
      uVar17 |= (int)(short)(int)fVar37 & 0xfffU;
    }
    *(u32 *)((int)pGVar25 + 0x44) = uVar17;
    (pGVar24->words).w0 = 0xe1000000;
    pGVar25 = pGVar25 + 10;
    if ((int)uVar4 < 0) {
      iVar29 = (int)(uVar4 * (int)sVar10) >> 7;
      if (sVar10 < 0) {
        if (iVar29 < 0) {
          iVar29 = 0;
        }
      }
      else if (0 < iVar29) {
        iVar29 = 0;
      }
      uVar17 = iVar29 * -0x10000;
    }
    else {
      uVar17 = 0;
    }
    if (-1 < (int)fVar37) goto LAB_800a662c;
    iVar29 = (int)fVar37 << 0x10;
    if (sVar11 < 0) {
      iVar29 = (iVar29 >> 0x10) * (int)sVar11 >> 7;
      if (-1 < iVar29) {
        uVar16 = -iVar29;
        break;
      }
      iVar29 = 0;
    }
    else {
LAB_800a6608:
      iVar29 = (iVar29 >> 0x10) * (int)sVar11 >> 7;
      if (0 < iVar29) {
        iVar29 = 0;
      }
    }
LAB_800a6620:
    uVar16 = -iVar29;
    break;
  case BORG8_RGBA16:
  case 3:
    if ((int)uVar26 < 4) {
      iVar5 = 4 - uVar26;
    }
    else {
      iVar5 = 4 - (uVar26 & 3);
      if ((uVar26 & 3) == 0) {
        iVar5 = 0;
      }
    }
    uVar13 = (uVar26 + iVar5) * 2;

    uVar22 = 0x1000 / uVar13 - 1;
    uVar13 = uVar17 / uVar22;

    uVar17 -= uVar13 * uVar22;
    if (uVar17 == 0) {
      uVar13 -= 1;
      uVar17 = uVar22;
    }
    if ((int)uVar22 < 0) {
      fVar30 = (float)((double)uVar22 + UINT_MAX_d);
    }
    else {
      fVar30 = (float)uVar22;
    }
    fVar30 = fVar30 * fVar39 * 4.0f;
    iVar5 = 3;
    if ((borg8->dat).format == BORG8_RGBA16) iVar5 = 0;
    pGVar25 = g + 3;
    uVar23 = 0;
    dVar35 = (double)uVar17;
    gDPSetColorDither(pGVar24,0);
    uVar4 = (u32)sVar28;
    if (uVar13 != 0) {
      uVar8 = (uVar21 - 1) + uVar26;
      uVar18 = iVar5 << 0x15 | ((int)((uVar8 - uVar20) * 2 + 9) >> 3 & 0x1ffU) << 9 | 0xf5100000;
      uVar27 = (uVar21 << 2 & 0xfff) << 0xc;
      uVar19 = (uVar8 & 0x3ff) << 0xe;
      uVar12 = (iVar31 + iVar29);
      uVar8 = uVar16;
      pGVar24 = pGVar25;
      for(uVar23 = 0;uVar23 < uVar13;uVar23++) {
//may be wrong.
        gDPLoadTextureTile(pGVar24++,pvVar3,iVar5,G_IM_SIZ_16b,uVar15,0,
        uVar21,uVar8,uVar26-1,uVar22,0,2,2,0,0,0,0);        
        /*uVar16 = uVar8 + uVar22;
        (pGVar24->words).w0 = iVar5 << 0x15 | uVar15 - 1 & 0xfff | 0xfd100000;
        (pGVar24->words).w1 = (uint)pvVar3;
        uVar7 = uVar16 * 4 & 0xfff;
        *(undefined4 *)((int)pGVar24 + 0xc) = 0x7080200;
        pGVar24[1].words.w0 = uVar18;
        uVar8 = (uVar8 & 0x3ff) << 2;
        gDPLoadSync(pGVar24++);
        pGVar24[3].words.w0 = uVar27 | uVar8 | 0xf4000000;
        *(uint *)((int)pGVar24 + 0x1c) = uVar19 | uVar7 | 0x7000000;
        gDPPipeSync(pGVar24++);
        *(undefined4 *)((int)pGVar24 + 0x2c) = 0x80200;
        pGVar24[5].words.w0 = uVar18;
        pGVar24[6].words.w0 = uVar27 | uVar8 | 0xf2000000;
        *(uint *)((int)pGVar24 + 0x34) = uVar19 | uVar7;
        pGVar24[7].words.w0 = 0xf2000000;
        *(uint *)((int)pGVar24 + 0x3c) = (uVar26 - 1 & 0x3ff) << 0xe | uVar22 * 4 & 0xfff;*/
gSPScisTextureRectangle(pGVar24++,uVar4,fVar37,uVar12,(fVar37 + fVar30),0,0,0,iVar32,uStack_38);
      }
    }
    fVar30 = 4.0f;
    if ((int)uVar17 < 0) {
      dVar35 = dVar35 + UINT_MAX_d;
    }
    (pGVar25->words).w0 = iVar5 << 0x15 | uVar15 - 1 & 0xfff | 0xfd100000;
    (pGVar25->words).w1 = (u32)pvVar3;
    uVar13 = (uVar16 & 0x3ff) << 2;
    *(undefined4 *)((int)pGVar25 + 0xc) = 0x7080200;
    uVar16 = ((uVar16 - 1) + uVar17) * 4 & 0xfff;
    uVar15 = (uVar21 - 1) + uVar26;
    uVar22 = iVar5 << 0x15 | ((int)((uVar15 - uVar20) * 2 + 9) >> 3 & 0x1ffU) << 9 | 0xf5100000;
    pGVar25[1].words.w0 = uVar22;
    pGVar25[2].words.w0 = 0xe6000000;
    *(undefined4 *)((int)pGVar25 + 0x14) = 0;
    uVar15 = (uVar15 & 0x3ff) << 0xe;
    uVar20 = (uVar21 << 2 & 0xfff) << 0xc;
    pGVar25[3].words.w0 = uVar20 | uVar13 | 0xf4000000;
    *(u32 *)((int)pGVar25 + 0x1c) = uVar15 | uVar16 | 0x7000000;
    pGVar25[4].words.w0 = 0xe7000000;
    *(undefined4 *)((int)pGVar25 + 0x24) = 0;
    pGVar25[5].words.w0 = uVar22;
    *(undefined4 *)((int)pGVar25 + 0x2c) = 0x80200;
    pGVar25[6].words.w0 = uVar20 | uVar13 | 0xf2000000;
    *(u32 *)((int)pGVar25 + 0x34) = uVar15 | uVar16;
    pGVar25[7].words.w0 = 0xf2000000;
    *(u32 *)((int)pGVar25 + 0x3c) = (uVar26 - 1 & 0x3ff) << 0xe | (uVar17 - 1 & 0x3ff) << 2;
    uVar17 = (u32)(short)(iVar31 + iVar29);
    pGVar24 = pGVar25 + 9;
    if ((int)uVar17 < 1) {
      uVar17 = 0xe4000000;
    }
    else {
      uVar17 = (uVar17 & 0xfff) << 0xc | 0xe4000000;
    }
    uVar16 = (u32)(short)(int)(fVar37 + (float)dVar35 * fVar39 * fVar30);
    if (0 < (int)uVar16) {
      uVar17 |= uVar16 & 0xfff;
    }
    pGVar25[8].words.w0 = uVar17;
    if ((int)uVar4 < 1) {
      uVar17 = 0;
    }
    else {
      uVar17 = (uVar4 & 0xfff) << 0xc;
    }
    if (0 < (short)(int)fVar37) {
      uVar17 |= (int)(short)(int)fVar37 & 0xfffU;
    }
    *(u32 *)((int)pGVar25 + 0x44) = uVar17;
    (pGVar24->words).w0 = 0xe1000000;
    pGVar25 = pGVar25 + 10;
    if ((int)uVar4 < 0) {
      iVar29 = (int)(uVar4 * (int)sVar10) >> 7;
      if (sVar10 < 0) {
        if (iVar29 < 0) {
          iVar29 = 0;
        }
      }
      else if (0 < iVar29) {
        iVar29 = 0;
      }
      uVar17 = iVar29 * -0x10000;
    }
    else {
      uVar17 = 0;
    }
    if (-1 < (int)fVar37) goto LAB_800a662c;
    iVar29 = (int)fVar37 << 0x10;
    if (-1 < sVar11) goto LAB_800a6608;
    iVar29 = (iVar29 >> 0x10) * (int)sVar11 >> 7;
    if (iVar29 < 0) {
      iVar29 = 0;
      goto LAB_800a6620;
    }
    uVar16 = -iVar29;
    break;
  default:
    if ((int)uVar26 < 8) {
      iVar5 = 8 - uVar26;
    }
    else {
      iVar5 = 8 - (uVar26 & 7);
      if ((uVar26 & 7) == 0) {
        iVar5 = 0;
      }
    }
    iVar2 = (borg8->dat).format;
    if (iVar2 == BORG8_CI8) {
      uVar13 = 0x800;
    }
    else {
      uVar13 = 0x1000;
    }

    uVar22 = uVar13 / (uVar26 + iVar5) - 1;
    uVar13 = uVar17 / uVar22;

    uVar17 -= uVar13 * uVar22;
    if (uVar17 == 0) {
      uVar13 -= 1;
      uVar17 = uVar22;
    }
    fVar30 = (float)uVar22 * fVar39 * 4.0f;
    if (iVar2 == BORG8_CI8) {
      iVar5 = 2;
      gDPSetTextureLUT(pGVar24,G_TT_RGBA16);
      pGVar25 = g + 10;
      gDPLoadTLUT_pal256(g++,(borg8->dat).palette);
    }
    else {
      iVar5 = 4;
      if (iVar2 == BORG8_IA8) {
        iVar5 = 3;
      }
      pGVar25 = g + 3;
      gDPSetTextureLUT(pGVar24,0);
    }
    uVar23 = 0;
    dVar35 = (double)uVar17;
    uVar4 = (u32)sVar28;
    if (uVar13 != 0) {
      uVar8 = (uVar21 - 1) + uVar26;
      uVar18 = iVar5 << 0x15 | ((int)((uVar8 - uVar20) + 8) >> 3 & 0x1ffU) << 9 | 0xf5080000;
      uVar19 = (uVar8 & 0x3ff) << 0xe;
      uVar27 = (uVar21 << 2 & 0xfff) << 0xc;
      uVar12 = (iVar31 + iVar29) * 0x10000 >> 0x10;
      uVar8 = uVar16;
      pGVar24 = pGVar25;
      do {
        uVar16 = uVar8 + uVar22;
        (pGVar24->words).w0 = iVar5 << 0x15 | uVar15 - 1 & 0xfff | 0xfd080000;
        (pGVar24->words).w1 = (u32)pvVar3;
        uVar7 = uVar16 * 4 & 0xfff;
        *(undefined4 *)((int)pGVar24 + 0xc) = 0x7080200;
        pGVar24[1].words.w0 = uVar18;
        uVar8 = (uVar8 & 0x3ff) << 2;
        pGVar24[2].words.w0 = 0xe6000000;
        *(undefined4 *)((int)pGVar24 + 0x14) = 0;
        pGVar24[3].words.w0 = uVar27 | uVar8 | 0xf4000000;
        *(u32 *)((int)pGVar24 + 0x1c) = uVar19 | uVar7 | 0x7000000;
        pGVar24[4].words.w0 = 0xe7000000;
        *(undefined4 *)((int)pGVar24 + 0x24) = 0;
        *(undefined4 *)((int)pGVar24 + 0x2c) = 0x80200;
        pGVar24[5].words.w0 = uVar18;
        pGVar24[6].words.w0 = uVar27 | uVar8 | 0xf2000000;
        *(u32 *)((int)pGVar24 + 0x34) = uVar19 | uVar7;
        pGVar24[7].words.w0 = 0xf2000000;
        *(u32 *)((int)pGVar24 + 0x3c) = (uVar26 - 1 & 0x3ff) << 0xe | uVar22 * 4 & 0xfff;
        if ((int)uVar12 < 1) {
          uVar8 = 0xe4000000;
        }
        else {
          uVar8 = (uVar12 & 0xfff) << 0xc | 0xe4000000;
        }
        uVar7 = (u32)(short)(int)(fVar37 + fVar30);
        if (0 < (int)uVar7) {
          uVar8 |= uVar7 & 0xfff;
        }
        pGVar24[8].words.w0 = uVar8;
        if ((int)uVar4 < 1) {
          uVar8 = 0;
        }
        else {
          uVar8 = (uVar4 & 0xfff) << 0xc;
        }
        if (0 < (short)(int)fVar37) {
          uVar8 |= (int)(short)(int)fVar37 & 0xfffU;
        }
        *(u32 *)((int)pGVar24 + 0x44) = uVar8;
        pGVar24[9].words.w0 = 0xe1000000;
        if ((int)uVar4 < 0) {
          iVar6 = (int)(uVar4 * (int)sVar10) >> 7;
          if (sVar10 < 0) {
            if (iVar6 < 0) {
              iVar6 = 0;
            }
          }
          else if (0 < iVar6) {
            iVar6 = 0;
          }
          uVar8 = iVar6 * -0x10000;
        }
        else {
          uVar8 = 0;
        }
        if ((int)fVar37 < 0) {
          iVar9 = (int)sVar11;
          iVar6 = (int)(short)(int)fVar37;
          if (iVar9 < 0) {
            iVar6 = iVar6 * iVar9 >> 7;
            if (iVar6 < 0) {
              iVar6 = 0;
            }
          }
          else {
            iVar6 = iVar6 * iVar9 >> 7;
            if (0 < iVar6) {
              iVar6 = 0;
            }
          }
          uVar8 |= -iVar6 & 0xffffU;
        }
        pGVar25 = pGVar24 + 0xb;
        uVar23 += 1;
        *(u32 *)((int)pGVar24 + 0x4c) = uVar8;
        pGVar24[10].words.w0 = 0xf1000000;
        *(u32 *)((int)pGVar24 + 0x54) = iVar32 << 0x10 | uStack_38 & 0xffff;
        fVar37 = fVar37 + fVar30;
        uVar8 = uVar16;
        pGVar24 = pGVar25;
      } while (uVar23 < uVar13);
    }
    fVar30 = 4.0f;
    if ((int)uVar17 < 0) {
      dVar35 = dVar35 + UINT_MAX_d;
    }
    (pGVar25->words).w0 = iVar5 << 0x15 | uVar15 - 1 & 0xfff | 0xfd080000;
    (pGVar25->words).w1 = (u32)pvVar3;
    uVar13 = (uVar16 & 0x3ff) << 2;
    *(undefined4 *)((int)pGVar25 + 0xc) = 0x7080200;
    uVar16 = ((uVar16 - 1) + uVar17) * 4 & 0xfff;
    uVar15 = (uVar21 - 1) + uVar26;
    uVar22 = iVar5 << 0x15 | ((int)((uVar15 - uVar20) + 8) >> 3 & 0x1ffU) << 9 | 0xf5080000;
    pGVar25[1].words.w0 = uVar22;
    pGVar25[2].words.w0 = 0xe6000000;
    *(undefined4 *)((int)pGVar25 + 0x14) = 0;
    uVar15 = (uVar15 & 0x3ff) << 0xe;
    uVar20 = (uVar21 << 2 & 0xfff) << 0xc;
    pGVar25[3].words.w0 = uVar20 | uVar13 | 0xf4000000;
    *(u32 *)((int)pGVar25 + 0x1c) = uVar15 | uVar16 | 0x7000000;
    pGVar25[4].words.w0 = 0xe7000000;
    *(undefined4 *)((int)pGVar25 + 0x24) = 0;
    pGVar25[5].words.w0 = uVar22;
    *(undefined4 *)((int)pGVar25 + 0x2c) = 0x80200;
    pGVar25[6].words.w0 = uVar20 | uVar13 | 0xf2000000;
    *(u32 *)((int)pGVar25 + 0x34) = uVar15 | uVar16;
    pGVar25[7].words.w0 = 0xf2000000;
    *(u32 *)((int)pGVar25 + 0x3c) = (uVar26 - 1 & 0x3ff) << 0xe | (uVar17 - 1 & 0x3ff) << 2;
    uVar17 = (u32)(short)(iVar31 + iVar29);
    pGVar24 = pGVar25 + 9;
    if ((int)uVar17 < 1) {
      uVar17 = 0xe4000000;
    }
    else {
      uVar17 = (uVar17 & 0xfff) << 0xc | 0xe4000000;
    }
    uVar16 = (u32)(short)(int)(fVar37 + (float)dVar35 * fVar39 * fVar30);
    if (0 < (int)uVar16) {
      uVar17 |= uVar16 & 0xfff;
    }
    pGVar25[8].words.w0 = uVar17;
    if ((int)uVar4 < 1) {
      uVar17 = 0;
    }
    else {
      uVar17 = (uVar4 & 0xfff) << 0xc;
    }
    if (0 < (short)(int)fVar37) {
      uVar17 |= (int)(short)(int)fVar37 & 0xfffU;
    }
    *(u32 *)((int)pGVar25 + 0x44) = uVar17;
    (pGVar24->words).w0 = 0xe1000000;
    pGVar25 = pGVar25 + 10;
    if ((int)uVar4 < 0) {
      iVar29 = (int)(uVar4 * (int)sVar10) >> 7;
      if (sVar10 < 0) {
        if (iVar29 < 0) {
          iVar29 = 0;
        }
      }
      else if (0 < iVar29) {
        iVar29 = 0;
      }
      uVar17 = iVar29 * -0x10000;
    }
    else {
      uVar17 = 0;
    }
    if (-1 < (int)fVar37) goto LAB_800a662c;
    iVar29 = (int)fVar37 << 0x10;
    if (-1 < sVar11) goto LAB_800a6608;
    iVar29 = (iVar29 >> 0x10) * (int)sVar11 >> 7;
    if (iVar29 < 0) {
      iVar29 = 0;
      goto LAB_800a6620;
    }
    uVar16 = -iVar29;
    break;
  case BORG8_CI4:
  case 8:
  case 9:
    if ((int)uVar26 < 0x10) {
      iVar5 = 0x10 - uVar26;
    }
    else {
      iVar5 = 0x10 - (uVar26 & 0xf);
      if ((uVar26 & 0xf) == 0) {
        iVar5 = 0;
      }
    }
    iVar2 = (borg8->dat).format;
    uVar13 = uVar26 + iVar5 >> 1;
    if (iVar2 == BORG8_CI4) {
      uVar22 = 0x800;
    }
    else {
      uVar22 = 0x1000;
    }

    uVar22 = uVar22 / uVar13 - 1;
    uVar13 = uVar17 / uVar22;

    uVar17 -= uVar13 * uVar22;
    if (uVar17 == 0) {
      uVar13 -= 1;
      uVar17 = uVar22;
    }
    if ((int)uVar22 < 0) {
      fVar30 = (float)((double)uVar22 + UINT_MAX_d);
    }
    else {
      fVar30 = (float)uVar22;
    }
    fVar30 = fVar30 * fVar39 * 4.0f;
    if (iVar2 == BORG8_CI4) {
      iVar5 = 2;
      gDPSetTextureLUT(g++,G_TT_RGBA16);
      gDPLoadTLUT(g++,0x1c10,0x100,(borg8->dat).palette);
      gDPLoadSync(g++);
    }
    else {
      iVar5 = 4;
      if (iVar2 == 8) {
        iVar5 = 3;
      }
      pGVar25 = g + 3;
      (pGVar24->words).w0 = 0xe3001001;
      *(undefined4 *)((int)g + 0x14) = 0;
    }
    uVar23 = 0;
    iVar6 = param_5 - 1;
    dVar35 = (double)uVar17;
    uVar4 = (u32)sVar28;
    if (uVar13 != 0) {
      uVar19 = iVar5 << 0x15;
      uVar18 = iVar6 + uVar26;
      uVar12 = (((int)((uVar18 - uVar20) + 1) >> 1) + 7 >> 3 & 0x1ffU) << 9;
      uVar27 = (iVar31 + iVar29) * 0x10000 >> 0x10;
      uVar8 = uVar16;
      pGVar24 = pGVar25;
      do {
        uVar16 = uVar8 + uVar22;
        (pGVar24->words).w0 = uVar19 | ((int)uVar15 >> 1) - 1U & 0xfff | 0xfd080000;
        (pGVar24->words).w1 = (u32)pvVar3;
        uVar7 = uVar16 * 4 & 0xfff;
        *(undefined4 *)((int)pGVar24 + 0xc) = 0x7080200;
        pGVar24[1].words.w0 = uVar19 | uVar12 | 0xf5080000;
        uVar8 = (uVar8 & 0x3ff) << 2;
        pGVar24[2].words.w0 = 0xe6000000;
        *(undefined4 *)((int)pGVar24 + 0x14) = 0;
        pGVar24[3].words.w0 = (uVar21 << 1 & 0xfff) << 0xc | uVar8 | 0xf4000000;
        *(u32 *)((int)pGVar24 + 0x1c) = (uVar18 & 0x7ff) << 0xd | uVar7 | 0x7000000;
        pGVar24[4].words.w0 = 0xe7000000;
        *(undefined4 *)((int)pGVar24 + 0x24) = 0;
        *(undefined4 *)((int)pGVar24 + 0x2c) = 0x80200;
        pGVar24[5].words.w0 = uVar19 | uVar12 | 0xf5000000;
        pGVar24[6].words.w0 = (uVar21 << 2 & 0xfff) << 0xc | uVar8 | 0xf2000000;
        *(u32 *)((int)pGVar24 + 0x34) = (uVar18 & 0x3ff) << 0xe | uVar7;
        pGVar24[7].words.w0 = 0xf2000000;
        *(u32 *)((int)pGVar24 + 0x3c) = (uVar26 - 1 & 0x3ff) << 0xe | uVar22 * 4 & 0xfff;
        if ((int)uVar27 < 1) {
          uVar8 = 0xe4000000;
        }
        else {
          uVar8 = (uVar27 & 0xfff) << 0xc | 0xe4000000;
        }
        uVar7 = (u32)(short)(int)(fVar37 + fVar30);
        if (0 < (int)uVar7) {
          uVar8 |= uVar7 & 0xfff;
        }
        pGVar24[8].words.w0 = uVar8;
        if ((int)uVar4 < 1) {
          uVar8 = 0;
        }
        else {
          uVar8 = (uVar4 & 0xfff) << 0xc;
        }
        if (0 < (short)(int)fVar37) {
          uVar8 |= (int)(short)(int)fVar37 & 0xfffU;
        }
        *(u32 *)((int)pGVar24 + 0x44) = uVar8;
        pGVar24[9].words.w0 = 0xe1000000;
        if ((int)uVar4 < 0) {
          iVar9 = (int)(uVar4 * (int)sVar10) >> 7;
          if (sVar10 < 0) {
            if (iVar9 < 0) {
              iVar9 = 0;
            }
          }
          else if (0 < iVar9) {
            iVar9 = 0;
          }
          uVar8 = iVar9 * -0x10000;
        }
        else {
          uVar8 = 0;
        }
        if ((int)fVar37 < 0) {
          iVar14 = (int)sVar11;
          iVar9 = (int)(short)(int)fVar37;
          if (iVar14 < 0) {
            iVar9 = iVar9 * iVar14 >> 7;
            if (iVar9 < 0) {
              iVar9 = 0;
            }
          }
          else {
            iVar9 = iVar9 * iVar14 >> 7;
            if (0 < iVar9) {
              iVar9 = 0;
            }
          }
          uVar8 |= -iVar9 & 0xffffU;
        }
        pGVar25 = pGVar24 + 0xb;
        uVar23 += 1;
        *(u32 *)((int)pGVar24 + 0x4c) = uVar8;
        pGVar24[10].words.w0 = 0xf1000000;
        *(u32 *)((int)pGVar24 + 0x54) = iVar32 << 0x10 | uStack_38 & 0xffff;
        fVar37 = fVar37 + fVar30;
        uVar8 = uVar16;
        pGVar24 = pGVar25;
      } while (uVar23 < uVar13);
    }
    fVar30 = 4.0f;
    if ((int)uVar17 < 0) {
      dVar35 = dVar35 + UINT_MAX_d;
    }
    uVar22 = iVar5 << 0x15;
    (pGVar25->words).w0 = uVar22 | ((int)uVar15 >> 1) - 1U & 0xfff | 0xfd080000;
    (pGVar25->words).w1 = (u32)pvVar3;
    *(undefined4 *)((int)pGVar25 + 0xc) = 0x7080200;
    uVar13 = iVar6 + uVar26;
    uVar15 = (((int)((uVar13 - uVar20) + 1) >> 1) + 7 >> 3 & 0x1ffU) << 9;
    pGVar25[1].words.w0 = uVar22 | uVar15 | 0xf5080000;
    pGVar25[2].words.w0 = 0xe6000000;
    *(undefined4 *)((int)pGVar25 + 0x14) = 0;
    uVar20 = (uVar16 & 0x3ff) << 2;
    pGVar25[3].words.w0 = (uVar21 << 1 & 0xfff) << 0xc | uVar20 | 0xf4000000;
    uVar16 = ((uVar16 - 1) + uVar17) * 4 & 0xfff;
    *(u32 *)((int)pGVar25 + 0x1c) = (uVar13 & 0x7ff) << 0xd | uVar16 | 0x7000000;
    pGVar25[4].words.w0 = 0xe7000000;
    *(undefined4 *)((int)pGVar25 + 0x24) = 0;
    pGVar25[5].words.w0 = uVar22 | uVar15 | 0xf5000000;
    *(undefined4 *)((int)pGVar25 + 0x2c) = 0x80200;
    *(u32 *)((int)pGVar25 + 0x34) = (uVar13 & 0x3ff) << 0xe | uVar16;
    pGVar25[6].words.w0 = (uVar21 << 2 & 0xfff) << 0xc | uVar20 | 0xf2000000;
    pGVar25[7].words.w0 = 0xf2000000;
    *(u32 *)((int)pGVar25 + 0x3c) = (uVar26 - 1 & 0x3ff) << 0xe | (uVar17 - 1 & 0x3ff) << 2;
    uVar17 = (u32)(short)(iVar31 + iVar29);
    pGVar24 = pGVar25 + 9;
    if ((int)uVar17 < 1) {
      uVar17 = 0xe4000000;
    }
    else {
      uVar17 = (uVar17 & 0xfff) << 0xc | 0xe4000000;
    }
    uVar16 = (u32)(short)(int)(fVar37 + (float)dVar35 * fVar39 * fVar30);
    if (0 < (int)uVar16) {
      uVar17 |= uVar16 & 0xfff;
    }
    pGVar25[8].words.w0 = uVar17;
    if ((int)uVar4 < 1) {
      uVar17 = 0;
    }
    else {
      uVar17 = (uVar4 & 0xfff) << 0xc;
    }
    if (0 < (short)(int)fVar37) {
      uVar17 |= (int)(short)(int)fVar37 & 0xfffU;
    }
    *(u32 *)((int)pGVar25 + 0x44) = uVar17;
    (pGVar24->words).w0 = 0xe1000000;
    pGVar25 = pGVar25 + 10;
    if ((int)uVar4 < 0) {
      iVar29 = (int)(uVar4 * (int)sVar10) >> 7;
      if (sVar10 < 0) {
        if (iVar29 < 0) iVar29 = 0;
      }
      else if (0 < iVar29) iVar29 = 0;
      uVar17 = iVar29 * -0x10000;
    }
    else {
      uVar17 = 0;
    }
    if (-1 < (int)fVar37) goto LAB_800a662c;
    iVar29 = (int)fVar37 << 0x10;
    if (-1 < sVar11) goto LAB_800a6608;
    iVar29 = (iVar29 >> 0x10) * (int)sVar11 >> 7;
    if (iVar29 < 0) {
      iVar29 = 0;
      goto LAB_800a6620;
    }
    uVar16 = -iVar29;
  }
  uVar17 |= uVar16 & 0xffff;
LAB_800a662c:
  uStack_38 &= 0xffff;
  (pGVar24->words).w1 = uVar17;
  (pGVar25->words).w0 = 0xf1000000;
  (pGVar25->words).w1 = iVar32 << 0x10 | uStack_38;
  return pGVar25 + 1;
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

