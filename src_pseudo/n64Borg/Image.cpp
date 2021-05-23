float h_scale=1.0f
float V_scale=1.0f
byte fade_texture[88]={0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0,0,0,0,0,0,0}

bool borg8_func_b(void *param_1,void *param_2){return false;}

void borg8_func_a(Borg_8_header *param_1){
  image_format iVar1;
  
  iVar1 = (param_1->dat).format;
  if ((iVar1 == CI8) || (iVar1 == 7)) {
    (param_1->dat).flags = (int)&(param_1->dat).format + (param_1->dat).flags;
  }
  else {(param_1->dat).flags = 0;}
  (param_1->dat).offset = (int)&(param_1->dat).format + (param_1->dat).offset;
  return;
}

void borg8_free_ofunc(void *param_1){
  int iVar1 = get_memUsed();
  if (*param_1 == -1) {Free(param_1,FILENAME,0x8f);}
  else {dec_borg_count(*param_1);}
  borg_mem[8]-= (iVar1 - get_memUsed());
  borg_count[8]--;
}

Borg_8_header * get_borg_8(Borg8Enum param_1){
  setBorgFlag();
  return (Borg_8_header *)getBorgItem(param_1);}


//gets called before almost every draw command
rspCom * rsp_func(rspCom *param_1,byte param_2,ushort h,ushort v){
  u32 uVar1;
  u32 uVar2;
  
  h_scale = (float)h / 320.0f;
  V_scale = (float)v / 240.0f;
  (*param_1)[0] = 0xe7000000;
  (*param_1)[1] = 0;
  param_1[1][0] = 0xe3000a01;
  param_1[1][1] = 0;
  param_1[2][0] = 0xe3000800;
  param_1[2][1] = 0x800000;
  param_1[3][0] = 0xe3001801;
  param_1[3][1] = 0;
  param_1[4][0] = 0xe3001a01;
  param_1[4][1] = 0;
  param_1[5][0] = 0xe3000c00;
  param_1[5][1] = 0;
  param_1[6][0] = 0xe3000f00;
  param_1[6][1] = 0;
  param_1[7][0] = 0xe3001201;
  param_1[7][1] = 0x2000;
  param_1[8][1] = 0xc00;
  param_1[8][0] = 0xe3001402;
  param_1[9][0] = 0xe3000d01;
  param_1[9][1] = 0;
  param_1[10][0] = 0xe3001700;
  param_1[10][1] = 0;
  param_1[0xb][0] = 0xd9000000;
  param_1[0xb][1] = 0;
  param_1[0xc][0] = 0xd7000000;
  param_1[0xc][1] = 0;
  if ((param_2 & 2) == 0) {uVar1 = 0xf0a4000;}
  else {uVar1 = 0x504240;}
  param_1[0xd][0] = 0xe200001c;
  param_1[0xd][1] = uVar1;
  if ((param_2 & 4) == 0) {
    uVar2 = 0xfcffffff;
    uVar1 = 0xfffcf279;
  }
  else {
    uVar2 = 0xfc119623;
    uVar1 = 0xff2fffff;
  }
  param_1[0xe][0] = uVar2;
  param_1[0xe][1] = uVar1;
  return param_1[0xf];
}


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

rspCom * N64BorgImageDraw(rspCom *param_1,Borg_8_header *param_2,float param_3,float param_4,
                         ushort param_5,ushort param_6,ushort param_7,ushort param_8,float param_9,
                         float param_10,byte red,byte green,byte blue,byte alpha)

{
  ushort uVar1;
  image_format iVar2;
  u32 uVar3;
  short sVar10;
  uint uVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  uint uVar12;
  uint uVar13;
  int iVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  uint uVar19;
  uint uVar20;
  uint uVar21;
  uint uVar22;
  uint uVar23;
  rspCom *pauVar24;
  rspCom *pauVar25;
  uint uVar26;
  uint uVar27;
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
  uint uStack56;
  short sVar11;
  
  fVar37 = V_scale;
  fVar30 = 4.0f;
  fVar38 = param_9 * h_scale;
  uVar3 = (param_2->dat).offset;
  fVar39 = param_10 * V_scale;
  uVar26 = (uint)param_7 - (uint)param_5;
  fVar36 = param_3 * h_scale;
  uVar1 = (param_2->dat).height;
  (*param_1)[0] = 0xe7000000;
  (*param_1)[1] = 0;
  param_1[1][0] = 0xfa000000;
  uVar16 = (uint)param_6;
  param_1[1][1] = (uint)red << 0x18 | (uint)green << 0x10 | (uint)blue << 8 | (uint)alpha;
  fVar33 = 4.0f;
  uVar17 = (uint)param_8 - (uint)param_6;
  fVar37 = param_4 * fVar37 * fVar30;
  iVar29 = (int)((float)uVar26 * fVar38 * fVar30);
  iVar31 = (int)(fVar36 * fVar30);
  iVar32 = (int)(1024.0f / fVar38);
  iVar2 = (param_2->dat).format;
  uStack56 = (uint)(1024.0f / fVar39);
  pauVar24 = param_1[2];
  if (8 < iVar2) {assert("N64BorgImage.cpp N64BorgImageDraw","Image type was  not recognized.");}
  uVar15 = (uint)uVar1;
  uVar21 = (uint)param_5;
  uVar20 = (uint)param_5;
  sVar10 = (short)iVar32;
  sVar11 = (short)uStack56;
  sVar28 = (short)iVar31;
  switch(iVar2) {
  case RBGA32:
    if ((int)uVar26 < 2) {iVar5 = 2 - uVar26;}
    else {
      iVar5 = 2 - (uVar26 & 1);
      if ((uVar26 & 1) == 0) {iVar5 = 0;}
    }
    uVar13 = (uVar26 + iVar5) * 4;
    if (uVar13 == 0) {
      trap(7);
    }
    uVar22 = 0x1000 / uVar13 - 1;
    uVar13 = uVar17 / uVar22;
    if (uVar22 == 0) {
      trap(7);
    }
    uVar17 = uVar17 - uVar13 * uVar22;
    if (uVar17 == 0) {
      uVar13--;
      uVar17 = uVar22;
    }
    dVar35 = (double)uVar22;
    if ((int)uVar22 < 0) {dVar35+= UINT_MAX_d;
    }
    pauVar25 = param_1[3];
    uVar23 = 0;
    dVar34 = (double)uVar17;
    (*pauVar24)[0] = 0xe3001001;
    fVar33 = (float)dVar35 * fVar39 * fVar33;
    param_1[2][1] = 0;
    uVar4 = SEXT24(sVar28);
    if (uVar13 != 0) {
      uVar8 = (uVar21 - 1) + uVar26;
      uVar12 = ((int)((uVar8 - uVar20) * 2 + 9) >> 3 & 0x1ffU) << 9 | 0xf5180000;
      uVar19 = (uVar8 & 0x3ff) << 0xe;
      uVar27 = (uVar21 << 2 & 0xfff) << 0xc;
      uVar18 = (iVar31 + iVar29) * 0x10000 >> 0x10;
      uVar8 = uVar16;
      pauVar24 = pauVar25;
      do {
        uVar16 = uVar8 + uVar22;
        (*pauVar24)[0] = uVar15 - 1 & 0xfff | 0xfd180000;
        (*pauVar24)[1] = uVar3;
        uVar7 = uVar16 * 4 & 0xfff;
        pauVar24[1][1] = 0x7080200;
        pauVar24[1][0] = uVar12;
        uVar8 = (uVar8 & 0x3ff) << 2;
        pauVar24[2][0] = 0xe6000000;
        pauVar24[2][1] = 0;
        pauVar24[3][0] = uVar27 | uVar8 | 0xf4000000;
        pauVar24[3][1] = uVar19 | uVar7 | 0x7000000;
        pauVar24[4][0] = 0xe7000000;
        pauVar24[4][1] = 0;
        pauVar24[5][1] = 0x80200;
        pauVar24[5][0] = uVar12;
        pauVar24[6][0] = uVar27 | uVar8 | 0xf2000000;
        pauVar24[6][1] = uVar19 | uVar7;
        pauVar24[7][0] = 0xf2000000;
        pauVar24[7][1] = (uVar26 - 1 & 0x3ff) << 0xe | uVar22 * 4 & 0xfff;
        if ((int)uVar18 < 1) {uVar8 = 0xe4000000;}
        else {uVar8 = (uVar18 & 0xfff) << 0xc | 0xe4000000;}
        uVar7 = SEXT24((short)(int)(fVar37 + fVar33));
        if (0 < (int)uVar7) {uVar8 = uVar8 | uVar7 & 0xfff;}
        pauVar24[8][0] = uVar8;
        if ((int)uVar4 < 1) {uVar8 = 0;}
        else {uVar8 = (uVar4 & 0xfff) << 0xc;}
        if (0 < (short)(int)fVar37) {
          uVar8 = uVar8 | (int)(short)(int)fVar37 & 0xfffU;
        }
        pauVar24[8][1] = uVar8;
        pauVar24[9][0] = 0xe1000000;
        if ((int)uVar4 < 0) {
          iVar5 = (int)(uVar4 * (int)sVar10) >> 7;
          if (sVar10 < 0) {
            if (iVar5 < 0) {
              iVar5 = 0;
            }
          }
          else {
            if (0 < iVar5) {
              iVar5 = 0;
            }
          }
          uVar8 = iVar5 * -0x10000;
        }
        else {
          uVar8 = 0;
        }
        if ((int)fVar37 < 0) {
          iVar6 = (int)sVar11;
          iVar5 = (int)(short)(int)fVar37;
          if (iVar6 < 0) {
            iVar5*= iVar6 >> 7;
            if (iVar5 < 0) {iVar5 = 0;}
          }
          else {
            iVar5*= iVar6 >> 7;
            if (0 < iVar5) {
              iVar5 = 0;
            }
          }
          uVar8 = uVar8 | -iVar5 & 0xffffU;
        }
        pauVar25 = pauVar24[0xb];
        uVar23 = uVar23 + 1;
        pauVar24[9][1] = uVar8;
        pauVar24[10][0] = 0xf1000000;
        pauVar24[10][1] = iVar32 << 0x10 | uStack56 & 0xffff;
        fVar37 = fVar37 + fVar33;
        uVar8 = uVar16;
        pauVar24 = pauVar25;
      } while (uVar23 < uVar13);
    }
    fVar30 = 4.0f;
    if ((int)uVar17 < 0) {dVar34+= UINT_MAX_d;}
    (*pauVar25)[0] = uVar15 - 1 & 0xfff | 0xfd180000;
    (*pauVar25)[1] = uVar3;
    pauVar25[1][1] = 0x7080200;
    uVar13 = (uVar21 - 1) + uVar26;
    uVar15 = ((int)((uVar13 - uVar20) * 2 + 9) >> 3 & 0x1ffU) << 9 | 0xf5180000;
    pauVar25[1][0] = uVar15;
    pauVar25[2][0] = 0xe6000000;
    pauVar25[2][1] = 0;
    uVar22 = (uVar16 & 0x3ff) << 2;
    uVar20 = (uVar13 & 0x3ff) << 0xe;
    uVar21 = (uVar21 << 2 & 0xfff) << 0xc;
    uVar16 = ((uVar16 - 1) + uVar17) * 4 & 0xfff;
    pauVar25[3][0] = uVar21 | uVar22 | 0xf4000000;
    pauVar25[3][1] = uVar20 | uVar16 | 0x7000000;
    pauVar25[4][0] = 0xe7000000;
    pauVar25[4][1] = 0;
    pauVar25[5][0] = uVar15;
    pauVar25[5][1] = 0x80200;
    pauVar25[6][0] = uVar21 | uVar22 | 0xf2000000;
    pauVar25[6][1] = uVar20 | uVar16;
    pauVar25[7][0] = 0xf2000000;
    pauVar25[7][1] = (uVar26 - 1 & 0x3ff) << 0xe | (uVar17 - 1 & 0x3ff) << 2;
    uVar17 = SEXT24((short)(iVar31 + iVar29));
    pauVar24 = pauVar25[9];
    if ((int)uVar17 < 1) {uVar17 = 0xe4000000;}
    else {uVar17 = (uVar17 & 0xfff) << 0xc | 0xe4000000;}
    uVar16 = SEXT24((short)(int)(fVar37 + (float)dVar34 * fVar39 * fVar30));
    if (0 < (int)uVar16) {uVar17|= uVar16 & 0xfff;}
    pauVar25[8][0] = uVar17;
    if ((int)uVar4 < 1) {uVar17 = 0;}
    else {uVar17 = (uVar4 & 0xfff) << 0xc;}
    if (0 < (short)(int)fVar37) {
      uVar17 = uVar17 | (int)(short)(int)fVar37 & 0xfffU;
    }
    pauVar25[8][1] = uVar17;
    (*pauVar24)[0] = 0xe1000000;
    pauVar25 = pauVar25[10];
    if ((int)uVar4 < 0) {
      iVar29 = (int)(uVar4 * (int)sVar10) >> 7;
      if (sVar10 < 0) {
        if (iVar29 < 0) {iVar29 = 0;}
      }
      else {
        if (0 < iVar29) {iVar29 = 0;}
      }
      uVar17 = iVar29 * -0x10000;
    }
    else {uVar17 = 0;}
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
  case RGBA16:
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
    if (uVar13 == 0) {
      trap(7);
    }
    uVar22 = 0x1000 / uVar13 - 1;
    uVar13 = uVar17 / uVar22;
    if (uVar22 == 0) {
      trap(7);
    }
    uVar17-= uVar13 * uVar22;
    if (uVar17 == 0) {
      uVar13--;
      uVar17 = uVar22;
    }
    if ((int)uVar22 < 0) {
      fVar30 = (float)uVar22 + UINT_MAX_d);
    }
    else {fVar30 = (float)uVar22;}
    fVar30 = fVar30 * fVar39 * 4.0f;
    iVar5 = 3;
    if ((param_2->dat).format == RGBA16) {
      iVar5 = 0;
    }
    pauVar25 = param_1[3];
    uVar23 = 0;
    dVar35 = (double)uVar17;
    (*pauVar24)[0] = 0xe3001001;
    param_1[2][1] = 0;
    uVar4 = SEXT24(sVar28);
    if (uVar13 != 0) {
      uVar8 = (uVar21 - 1) + uVar26;
      uVar18 = iVar5 << 0x15 | ((int)((uVar8 - uVar20) * 2 + 9) >> 3 & 0x1ffU) << 9 | 0xf5100000;
      uVar27 = (uVar21 << 2 & 0xfff) << 0xc;
      uVar19 = (uVar8 & 0x3ff) << 0xe;
      uVar12 = (iVar31 + iVar29) * 0x10000 >> 0x10;
      uVar8 = uVar16;
      pauVar24 = pauVar25;
      do {
        uVar16 = uVar8 + uVar22;
        (*pauVar24)[0] = iVar5 << 0x15 | uVar15 - 1 & 0xfff | 0xfd100000;
        (*pauVar24)[1] = uVar3;
        uVar7 = uVar16 * 4 & 0xfff;
        pauVar24[1][1] = 0x7080200;
        pauVar24[1][0] = uVar18;
        uVar8 = (uVar8 & 0x3ff) << 2;
        pauVar24[2][0] = 0xe6000000;
        pauVar24[2][1] = 0;
        pauVar24[3][0] = uVar27 | uVar8 | 0xf4000000;
        pauVar24[3][1] = uVar19 | uVar7 | 0x7000000;
        pauVar24[4][0] = 0xe7000000;
        pauVar24[4][1] = 0;
        pauVar24[5][1] = 0x80200;
        pauVar24[5][0] = uVar18;
        pauVar24[6][0] = uVar27 | uVar8 | 0xf2000000;
        pauVar24[6][1] = uVar19 | uVar7;
        pauVar24[7][0] = 0xf2000000;
        pauVar24[7][1] = (uVar26 - 1 & 0x3ff) << 0xe | uVar22 * 4 & 0xfff;
        if ((int)uVar12 < 1) {
          uVar8 = 0xe4000000;
        }
        else {
          uVar8 = (uVar12 & 0xfff) << 0xc | 0xe4000000;
        }
        uVar7 = SEXT24((short)(int)(fVar37 + fVar30));
        if (0 < (int)uVar7) {
          uVar8 = uVar8 | uVar7 & 0xfff;
        }
        pauVar24[8][0] = uVar8;
        if ((int)uVar4 < 1) {
          uVar8 = 0;
        }
        else {
          uVar8 = (uVar4 & 0xfff) << 0xc;
        }
        if (0 < (short)(int)fVar37) {
          uVar8 = uVar8 | (int)(short)(int)fVar37 & 0xfffU;
        }
        pauVar24[8][1] = uVar8;
        pauVar24[9][0] = 0xe1000000;
        if ((int)uVar4 < 0) {
          iVar6 = (int)(uVar4 * (int)sVar10) >> 7;
          if (sVar10 < 0) {
            if (iVar6 < 0) {
              iVar6 = 0;
            }
          }
          else {
            if (0 < iVar6) {iVar6 = 0;}
          }
          uVar8 = iVar6 * -0x10000;
        }
        else {uVar8 = 0;}
        if ((int)fVar37 < 0) {
          iVar9 = (int)sVar11;
          iVar6 = (int)(short)(int)fVar37;
          if (iVar9 < 0) {
            iVar6 = iVar6 * iVar9 >> 7;
            if (iVar6 < 0) {iVar6 = 0;}
          }
          else {
            iVar6*= iVar9 >> 7;
            if (0 < iVar6) {iVar6 = 0;}
          }
          uVar8 = uVar8 | -iVar6 & 0xffffU;
        }
        pauVar25 = pauVar24[0xb];
        uVar23 = uVar23 + 1;
        pauVar24[9][1] = uVar8;
        pauVar24[10][0] = 0xf1000000;
        pauVar24[10][1] = iVar32 << 0x10 | uStack56 & 0xffff;
        fVar37+= fVar30;
        uVar8 = uVar16;
        pauVar24 = pauVar25;
      } while (uVar23 < uVar13);
    }
    fVar30 = 4.0f;
    if ((int)uVar17 < 0) {
      dVar35+= UINT_MAX_d;
    }
    (*pauVar25)[0] = iVar5 << 0x15 | uVar15 - 1 & 0xfff | 0xfd100000;
    (*pauVar25)[1] = uVar3;
    uVar13 = (uVar16 & 0x3ff) << 2;
    pauVar25[1][1] = 0x7080200;
    uVar16 = ((uVar16 - 1) + uVar17) * 4 & 0xfff;
    uVar15 = (uVar21 - 1) + uVar26;
    uVar22 = iVar5 << 0x15 | ((int)((uVar15 - uVar20) * 2 + 9) >> 3 & 0x1ffU) << 9 | 0xf5100000;
    pauVar25[1][0] = uVar22;
    pauVar25[2][0] = 0xe6000000;
    pauVar25[2][1] = 0;
    uVar15 = (uVar15 & 0x3ff) << 0xe;
    uVar20 = (uVar21 << 2 & 0xfff) << 0xc;
    pauVar25[3][0] = uVar20 | uVar13 | 0xf4000000;
    pauVar25[3][1] = uVar15 | uVar16 | 0x7000000;
    pauVar25[4][0] = 0xe7000000;
    pauVar25[4][1] = 0;
    pauVar25[5][0] = uVar22;
    pauVar25[5][1] = 0x80200;
    pauVar25[6][0] = uVar20 | uVar13 | 0xf2000000;
    pauVar25[6][1] = uVar15 | uVar16;
    pauVar25[7][0] = 0xf2000000;
    pauVar25[7][1] = (uVar26 - 1 & 0x3ff) << 0xe | (uVar17 - 1 & 0x3ff) << 2;
    uVar17 = SEXT24((short)(iVar31 + iVar29));
    pauVar24 = pauVar25[9];
    if ((int)uVar17 < 1) {uVar17 = 0xe4000000;}
    else {
      uVar17 = (uVar17 & 0xfff) << 0xc | 0xe4000000;
    }
    uVar16 = SEXT24((short)(int)(fVar37 + (float)dVar35 * fVar39 * fVar30));
    if (0 < (int)uVar16) {
      uVar17 = uVar17 | uVar16 & 0xfff;
    }
    pauVar25[8][0] = uVar17;
    if ((int)uVar4 < 1) {
      uVar17 = 0;
    }
    else {
      uVar17 = (uVar4 & 0xfff) << 0xc;
    }
    if (0 < (short)(int)fVar37) {
      uVar17 = uVar17 | (int)(short)(int)fVar37 & 0xfffU;
    }
    pauVar25[8][1] = uVar17;
    (*pauVar24)[0] = 0xe1000000;
    pauVar25 = pauVar25[10];
    if ((int)uVar4 < 0) {
      iVar29 = (int)(uVar4 * (int)sVar10) >> 7;
      if (sVar10 < 0) {
        if (iVar29 < 0) {
          iVar29 = 0;
        }
      }
      else {
        if (0 < iVar29) {
          iVar29 = 0;
        }
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
    iVar2 = (param_2->dat).format;
    if (iVar2 == CI8) {
      uVar13 = 0x800;
    }
    else {
      uVar13 = 0x1000;
    }
    if (uVar26 + iVar5 == 0) {
      trap(7);
    }
    uVar22 = uVar13 / (uVar26 + iVar5) - 1;
    uVar13 = uVar17 / uVar22;
    if (uVar22 == 0) {
      trap(7);
    }
    uVar17 = uVar17 - uVar13 * uVar22;
    if (uVar17 == 0) {
      uVar13 = uVar13 - 1;
      uVar17 = uVar22;
    }
    if ((int)uVar22 < 0) {
      fVar30 = (float)((double)uVar22 + UINT_MAX_d);
    }
    else {
      fVar30 = (float)uVar22;
    }
    fVar30 = fVar30 * fVar39 * 4.0f;
    if (iVar2 == CI8) {
      iVar5 = 2;
      (*pauVar24)[0] = 0xe3001001;
      param_1[2][1] = 0x8000;
      pauVar25 = param_1[10];
      param_1[3][0] = 0xfd100000;
      param_1[3][1] = (param_2->dat).flags;
      param_1[4][0] = 0xe8000000;
      param_1[4][1] = 0;
      param_1[5][1] = 0x7000000;
      param_1[5][0] = 0xf5000100;
      param_1[6][0] = 0xe6000000;
      param_1[6][1] = 0;
      param_1[7][0] = 0xf0000000;
      param_1[7][1] = 0x73fc000;
      param_1[8][0] = 0xe7000000;
      param_1[8][1] = 0;
      param_1[9][0] = 0xe6000000;
      param_1[9][1] = 0;
    }
    else {
      iVar5 = 4;
      if (iVar2 == IA8) {
        iVar5 = 3;
      }
      pauVar25 = param_1[3];
      (*pauVar24)[0] = 0xe3001001;
      param_1[2][1] = 0;
    }
    uVar23 = 0;
    dVar35 = (double)uVar17;
    uVar4 = SEXT24(sVar28);
    if (uVar13 != 0) {
      uVar8 = (uVar21 - 1) + uVar26;
      uVar18 = iVar5 << 0x15 | ((int)((uVar8 - uVar20) + 8) >> 3 & 0x1ffU) << 9 | 0xf5080000;
      uVar19 = (uVar8 & 0x3ff) << 0xe;
      uVar27 = (uVar21 << 2 & 0xfff) << 0xc;
      uVar12 = (iVar31 + iVar29) * 0x10000 >> 0x10;
      uVar8 = uVar16;
      pauVar24 = pauVar25;
      do {
        uVar16 = uVar8 + uVar22;
        (*pauVar24)[0] = iVar5 << 0x15 | uVar15 - 1 & 0xfff | 0xfd080000;
        (*pauVar24)[1] = uVar3;
        uVar7 = uVar16 * 4 & 0xfff;
        pauVar24[1][1] = 0x7080200;
        pauVar24[1][0] = uVar18;
        uVar8 = (uVar8 & 0x3ff) << 2;
        pauVar24[2][0] = 0xe6000000;
        pauVar24[2][1] = 0;
        pauVar24[3][0] = uVar27 | uVar8 | 0xf4000000;
        pauVar24[3][1] = uVar19 | uVar7 | 0x7000000;
        pauVar24[4][0] = 0xe7000000;
        pauVar24[4][1] = 0;
        pauVar24[5][1] = 0x80200;
        pauVar24[5][0] = uVar18;
        pauVar24[6][0] = uVar27 | uVar8 | 0xf2000000;
        pauVar24[6][1] = uVar19 | uVar7;
        pauVar24[7][0] = 0xf2000000;
        pauVar24[7][1] = (uVar26 - 1 & 0x3ff) << 0xe | uVar22 * 4 & 0xfff;
        if ((int)uVar12 < 1) {
          uVar8 = 0xe4000000;
        }
        else {
          uVar8 = (uVar12 & 0xfff) << 0xc | 0xe4000000;
        }
        uVar7 = SEXT24((short)(int)(fVar37 + fVar30));
        if (0 < (int)uVar7) {
          uVar8 = uVar8 | uVar7 & 0xfff;
        }
        pauVar24[8][0] = uVar8;
        if ((int)uVar4 < 1) {
          uVar8 = 0;
        }
        else {
          uVar8 = (uVar4 & 0xfff) << 0xc;
        }
        if (0 < (short)(int)fVar37) {
          uVar8 = uVar8 | (int)(short)(int)fVar37 & 0xfffU;
        }
        pauVar24[8][1] = uVar8;
        pauVar24[9][0] = 0xe1000000;
        if ((int)uVar4 < 0) {
          iVar6 = (int)(uVar4 * (int)sVar10) >> 7;
          if (sVar10 < 0) {
            if (iVar6 < 0) {
              iVar6 = 0;
            }
          }
          else {
            if (0 < iVar6) {
              iVar6 = 0;
            }
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
          uVar8 = uVar8 | -iVar6 & 0xffffU;
        }
        pauVar25 = pauVar24[0xb];
        uVar23 = uVar23 + 1;
        pauVar24[9][1] = uVar8;
        pauVar24[10][0] = 0xf1000000;
        pauVar24[10][1] = iVar32 << 0x10 | uStack56 & 0xffff;
        fVar37 = fVar37 + fVar30;
        uVar8 = uVar16;
        pauVar24 = pauVar25;
      } while (uVar23 < uVar13);
    }
    fVar30 = 4.0f;
    if ((int)uVar17 < 0) {
      dVar35 = dVar35 + UINT_MAX_d;
    }
    (*pauVar25)[0] = iVar5 << 0x15 | uVar15 - 1 & 0xfff | 0xfd080000;
    (*pauVar25)[1] = uVar3;
    uVar13 = (uVar16 & 0x3ff) << 2;
    pauVar25[1][1] = 0x7080200;
    uVar16 = ((uVar16 - 1) + uVar17) * 4 & 0xfff;
    uVar15 = (uVar21 - 1) + uVar26;
    uVar22 = iVar5 << 0x15 | ((int)((uVar15 - uVar20) + 8) >> 3 & 0x1ffU) << 9 | 0xf5080000;
    pauVar25[1][0] = uVar22;
    pauVar25[2][0] = 0xe6000000;
    pauVar25[2][1] = 0;
    uVar15 = (uVar15 & 0x3ff) << 0xe;
    uVar20 = (uVar21 << 2 & 0xfff) << 0xc;
    pauVar25[3][0] = uVar20 | uVar13 | 0xf4000000;
    pauVar25[3][1] = uVar15 | uVar16 | 0x7000000;
    pauVar25[4][0] = 0xe7000000;
    pauVar25[4][1] = 0;
    pauVar25[5][0] = uVar22;
    pauVar25[5][1] = 0x80200;
    pauVar25[6][0] = uVar20 | uVar13 | 0xf2000000;
    pauVar25[6][1] = uVar15 | uVar16;
    pauVar25[7][0] = 0xf2000000;
    pauVar25[7][1] = (uVar26 - 1 & 0x3ff) << 0xe | (uVar17 - 1 & 0x3ff) << 2;
    uVar17 = SEXT24((short)(iVar31 + iVar29));
    pauVar24 = pauVar25[9];
    if ((int)uVar17 < 1) {
      uVar17 = 0xe4000000;
    }
    else {
      uVar17 = (uVar17 & 0xfff) << 0xc | 0xe4000000;
    }
    uVar16 = SEXT24((short)(int)(fVar37 + (float)dVar35 * fVar39 * fVar30));
    if (0 < (int)uVar16) {
      uVar17 = uVar17 | uVar16 & 0xfff;
    }
    pauVar25[8][0] = uVar17;
    if ((int)uVar4 < 1) {
      uVar17 = 0;
    }
    else {
      uVar17 = (uVar4 & 0xfff) << 0xc;
    }
    if (0 < (short)(int)fVar37) {
      uVar17 = uVar17 | (int)(short)(int)fVar37 & 0xfffU;
    }
    pauVar25[8][1] = uVar17;
    (*pauVar24)[0] = 0xe1000000;
    pauVar25 = pauVar25[10];
    if ((int)uVar4 < 0) {
      iVar29 = (int)(uVar4 * (int)sVar10) >> 7;
      if (sVar10 < 0) {
        if (iVar29 < 0) {
          iVar29 = 0;
        }
      }
      else {
        if (0 < iVar29) {
          iVar29 = 0;
        }
      }
      uVar17 = iVar29 * -0x10000;
    }
    else {uVar17 = 0;}
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
  case 7:
  case 8:
  case 9:
    if ((int)uVar26 < 0x10) {
      iVar5 = 0x10 - uVar26;
    }
    else {
      iVar5 = 0x10 - (uVar26 & 0xf);
      if ((uVar26 & 0xf) == 0) {iVar5 = 0;}
    }
    iVar2 = (param_2->dat).format;
    uVar13 = uVar26 + iVar5 >> 1;
    if (iVar2 == 7) {uVar22 = 0x800;}
    else {uVar22 = 0x1000;}
    if (uVar13 == 0) {
      trap(7);
    }
    uVar22 = uVar22 / uVar13 - 1;
    uVar13 = uVar17 / uVar22;
    if (uVar22 == 0) {
      trap(7);
    }
    uVar17-= uVar13 * uVar22;
    if (uVar17 == 0) {
      uVar13 = uVar13 - 1;
      uVar17 = uVar22;
    }
    if ((int)uVar22 < 0) {fVar30 = (float)((double)uVar22 + UINT_MAX_d);}
    else {fVar30 = (float)uVar22;}
    fVar30 = fVar30 * fVar39 * 4.0f;
    if (iVar2 == 7) {
      iVar5 = 2;
      (*pauVar24)[0] = 0xe3001001;
      param_1[2][1] = 0x8000;
      pauVar25 = param_1[10];
      param_1[3][0] = 0xfd100000;
      param_1[3][1] = (param_2->dat).flags;
      param_1[4][0] = 0xe8000000;
      param_1[4][1] = 0;
      param_1[5][1] = 0x7000000;
      param_1[5][0] = 0xf5000100;
      param_1[6][0] = 0xe6000000;
      param_1[6][1] = 0;
      param_1[7][0] = 0xf0000000;
      param_1[7][1] = 0x703c000;
      param_1[8][0] = 0xe7000000;
      param_1[8][1] = 0;
      param_1[9][0] = 0xe6000000;
      param_1[9][1] = 0;
    }
    else {
      iVar5 = 4;
      if (iVar2 == 8) {iVar5 = 3;}
      pauVar25 = param_1[3];
      (*pauVar24)[0] = 0xe3001001;
      param_1[2][1] = 0;
    }
    uVar23 = 0;
    iVar6 = param_5 - 1;
    dVar35 = (double)uVar17;
    uVar4 = SEXT24(sVar28);
    if (uVar13 != 0) {
      uVar19 = iVar5 << 0x15;
      uVar18 = iVar6 + uVar26;
      uVar12 = (((int)((uVar18 - uVar20) + 1) >> 1) + 7 >> 3 & 0x1ffU) << 9;
      uVar27 = (iVar31 + iVar29) * 0x10000 >> 0x10;
      uVar8 = uVar16;
      pauVar24 = pauVar25;
      do {
        uVar16 = uVar8 + uVar22;
        (*pauVar24)[0] = uVar19 | ((int)uVar15 >> 1) - 1U & 0xfff | 0xfd080000;
        (*pauVar24)[1] = uVar3;
        uVar7 = uVar16 * 4 & 0xfff;
        pauVar24[1][1] = 0x7080200;
        pauVar24[1][0] = uVar19 | uVar12 | 0xf5080000;
        uVar8 = (uVar8 & 0x3ff) << 2;
        pauVar24[2][0] = 0xe6000000;
        pauVar24[2][1] = 0;
        pauVar24[3][0] = (uVar21 << 1 & 0xfff) << 0xc | uVar8 | 0xf4000000;
        pauVar24[3][1] = (uVar18 & 0x7ff) << 0xd | uVar7 | 0x7000000;
        pauVar24[4][0] = 0xe7000000;
        pauVar24[4][1] = 0;
        pauVar24[5][1] = 0x80200;
        pauVar24[5][0] = uVar19 | uVar12 | 0xf5000000;
        pauVar24[6][0] = (uVar21 << 2 & 0xfff) << 0xc | uVar8 | 0xf2000000;
        pauVar24[6][1] = (uVar18 & 0x3ff) << 0xe | uVar7;
        pauVar24[7][0] = 0xf2000000;
        pauVar24[7][1] = (uVar26 - 1 & 0x3ff) << 0xe | uVar22 * 4 & 0xfff;
        if ((int)uVar27 < 1) {
          uVar8 = 0xe4000000;
        }
        else {
          uVar8 = (uVar27 & 0xfff) << 0xc | 0xe4000000;
        }
        uVar7 = SEXT24((short)(int)(fVar37 + fVar30));
        if (0 < (int)uVar7) {
          uVar8 = uVar8 | uVar7 & 0xfff;
        }
        pauVar24[8][0] = uVar8;
        if ((int)uVar4 < 1) {uVar8 = 0;}
        else {
          uVar8 = (uVar4 & 0xfff) << 0xc;
        }
        if (0 < (short)(int)fVar37) {
          uVar8 = uVar8 | (int)(short)(int)fVar37 & 0xfffU;
        }
        pauVar24[8][1] = uVar8;
        pauVar24[9][0] = 0xe1000000;
        if ((int)uVar4 < 0) {
          iVar9 = (int)(uVar4 * (int)sVar10) >> 7;
          if (sVar10 < 0) {
            if (iVar9 < 0) {iVar9 = 0;}
          }
          else {
            if (0 < iVar9) {iVar9 = 0;}
          }
          uVar8 = iVar9 * -0x10000;
        }
        else {uVar8 = 0;}
        if ((int)fVar37 < 0) {
          iVar14 = (int)sVar11;
          iVar9 = (int)(short)(int)fVar37;
          if (iVar14 < 0) {
            iVar9 = iVar9 * iVar14 >> 7;
            if (iVar9 < 0) {iVar9 = 0;}
          }
          else {
            iVar9 = iVar9 * iVar14 >> 7;
            if (0 < iVar9) {
              iVar9 = 0;
            }
          }
          uVar8 = uVar8 | -iVar9 & 0xffffU;
        }
        pauVar25 = pauVar24[0xb];
        uVar23 = uVar23 + 1;
        pauVar24[9][1] = uVar8;
        pauVar24[10][0] = 0xf1000000;
        pauVar24[10][1] = iVar32 << 0x10 | uStack56 & 0xffff;
        fVar37 = fVar37 + fVar30;
        uVar8 = uVar16;
        pauVar24 = pauVar25;
      } while (uVar23 < uVar13);
    }
    fVar30 = 4.0f;
    if ((int)uVar17 < 0) {
      dVar35 = dVar35 + UINT_MAX_d;
    }
    uVar22 = iVar5 << 0x15;
    (*pauVar25)[0] = uVar22 | ((int)uVar15 >> 1) - 1U & 0xfff | 0xfd080000;
    (*pauVar25)[1] = uVar3;
    pauVar25[1][1] = 0x7080200;
    uVar13 = iVar6 + uVar26;
    uVar15 = (((int)((uVar13 - uVar20) + 1) >> 1) + 7 >> 3 & 0x1ffU) << 9;
    pauVar25[1][0] = uVar22 | uVar15 | 0xf5080000;
    pauVar25[2][0] = 0xe6000000;
    pauVar25[2][1] = 0;
    uVar20 = (uVar16 & 0x3ff) << 2;
    pauVar25[3][0] = (uVar21 << 1 & 0xfff) << 0xc | uVar20 | 0xf4000000;
    uVar16 = ((uVar16 - 1) + uVar17) * 4 & 0xfff;
    pauVar25[3][1] = (uVar13 & 0x7ff) << 0xd | uVar16 | 0x7000000;
    pauVar25[4][0] = 0xe7000000;
    pauVar25[4][1] = 0;
    pauVar25[5][0] = uVar22 | uVar15 | 0xf5000000;
    pauVar25[5][1] = 0x80200;
    pauVar25[6][1] = (uVar13 & 0x3ff) << 0xe | uVar16;
    pauVar25[6][0] = (uVar21 << 2 & 0xfff) << 0xc | uVar20 | 0xf2000000;
    pauVar25[7][0] = 0xf2000000;
    pauVar25[7][1] = (uVar26 - 1 & 0x3ff) << 0xe | (uVar17 - 1 & 0x3ff) << 2;
    uVar17 = SEXT24((short)(iVar31 + iVar29));
    pauVar24 = pauVar25[9];
    if ((int)uVar17 < 1) {
      uVar17 = 0xe4000000;
    }
    else {
      uVar17 = (uVar17 & 0xfff) << 0xc | 0xe4000000;
    }
    uVar16 = SEXT24((short)(int)(fVar37 + (float)dVar35 * fVar39 * fVar30));
    if (0 < (int)uVar16) {
      uVar17 = uVar17 | uVar16 & 0xfff;
    }
    pauVar25[8][0] = uVar17;
    if ((int)uVar4 < 1) {
      uVar17 = 0;
    }
    else {
      uVar17 = (uVar4 & 0xfff) << 0xc;
    }
    if (0 < (short)(int)fVar37) {
      uVar17 = uVar17 | (int)(short)(int)fVar37 & 0xfffU;
    }
    pauVar25[8][1] = uVar17;
    (*pauVar24)[0] = 0xe1000000;
    pauVar25 = pauVar25[10];
    if ((int)uVar4 < 0) {
      iVar29 = (int)(uVar4 * (int)sVar10) >> 7;
      if (sVar10 < 0) {
        if (iVar29 < 0) {
          iVar29 = 0;
        }
      }
      else {
        if (0 < iVar29) {
          iVar29 = 0;
        }
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
  }
  uVar17 = uVar17 | uVar16 & 0xffff;
LAB_800a662c:
  uStack56 = uStack56 & 0xffff;
  (*pauVar24)[1] = uVar17;
  (*pauVar25)[0] = 0xf1000000;
  (*pauVar25)[1] = iVar32 << 0x10 | uStack56;
  return pauVar25[1];
}

rspCom * pass_to_borg_image_draw(rspCom *param_1,Borg_8_header *borg8,float param_3,float param_4,float Hscale,
                   float Vscale,u8 red,u8 green,u8 blue,u8 Alpha){
  return N64BorgImageDraw(param_1,borg8,param_3,param_4,0,0,(borg8->dat).height,
                             (borg8->dat).width,Hscale,Vscale,red,green,blue,Alpha);}

void borg8_free(Borg_8_header *param_1){
  int iVar1;
  int iVar2;
  
  iVar1 = get_memUsed();
  iVar2 = (param_1->index).index;
  if (iVar2 == -1) {Free(param_1,FILENAME,0x24f);}
  else {dec_borg_count(iVar2);}
  iVar2 = get_memUsed();
  borg_mem[8]-= (iVar1 - iVar2);
  borg_count[8]--;
}

rspCom * gsFadeInOut(rspCom *param_1,uint param_2,uint param_3,uint H,ushort V,byte R,byte G,byte B,
                    byte A){
  float fVar1;
  float fVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  int iVar11;
  
  fVar2 = V_scale;
  fVar1 = h_scale;
  (*param_1)[0] = 0xe7000000;
  (*param_1)[1] = 0;
  param_1[1][0] = 0xfa000000;
  param_1[1][1] = (uint)R << 0x18 | (uint)G << 0x10 | (uint)B << 8 | (uint)A;
  param_1[2][0] = 0xe3001001;
  param_1[2][1] = 0;
  param_1[3][1] = (u32)fade_texture;
  param_1[3][0] = 0xfd680007;
  param_1[4][0] = 0xf5680800;
  param_1[4][1] = 0x7080200;
  param_1[5][0] = 0xe6000000;
  param_1[5][1] = 0;
  param_1[6][0] = 0xf4000000;
  param_1[6][1] = 0x7070070;
  param_1[7][0] = 0xe7000000;
  param_1[7][1] = 0;
  param_1[8][0] = 0xf5680800;
  param_1[8][1] = 0x80200;
  param_1[9][0] = 0xf2000000;
  iVar11 = (int)(short)(int)((float)(param_2 & 0xffff) * fVar1);
  iVar7 = (int)(short)(int)((float)(param_3 & 0xffff) * fVar2);
  param_1[9][1] = 0x70070;
  iVar5 = (int)(short)(int)((float)(H & 0xffff) * fVar1);
  iVar8 = (int)(short)(int)((float)(uint)V * fVar2);
  iVar10 = (int)(short)(int)((8.0f / (float)(iVar5 - iVar11)) * 1024.0f);
  uVar3 = (iVar5 << 0x12) >> 0x10;
  uVar9 = SEXT24((short)(int)((8.0f / (float)(iVar8 - iVar7)) * 1024.0f));
  if ((int)uVar3 < 1) {
    uVar3 = 0xe4000000;
  }
  else {
    uVar3 = (uVar3 & 0xfff) << 0xc | 0xe4000000;
  }
  uVar4 = (iVar8 << 0x12) >> 0x10;
  if (0 < (int)uVar4) {
    uVar3 = uVar3 | uVar4 & 0xfff;
  }
  param_1[10][0] = uVar3;
  uVar3 = (iVar11 << 0x12) >> 0x10;
  if ((int)uVar3 < 1) {uVar4 = 0;}
  else {
    uVar4 = (uVar3 & 0xfff) << 0xc;
  }
  uVar6 = (iVar7 << 0x12) >> 0x10;
  if (0 < (int)uVar6) {
    uVar4 = uVar4 | uVar6 & 0xfff;
  }
  param_1[10][1] = uVar4;
  param_1[0xb][0] = 0xe1000000;
  if ((int)uVar3 < 0) {
    iVar5 = (int)(uVar3 * iVar10) >> 7;
    if (iVar10 < 0) {
      if (iVar5 < 0) {iVar5 = 0;}
    }
    else {
      if (0 < iVar5) {iVar5 = 0;}
    }
    uVar3 = iVar5 * -0x10000;
  }
  else {uVar3 = 0;}
  if (iVar7 << 2 < 0) {
    if ((int)uVar9 < 0) {
      iVar5 = (int)(uVar6 * uVar9) >> 7;
      if (iVar5 < 0) {iVar5 = 0;}
    }
    else {
      iVar5 = (int)(uVar6 * uVar9) >> 7;
      if (0 < iVar5) {iVar5 = 0;}
    }
    uVar3 = uVar3 | -iVar5 & 0xffffU;
  }
  param_1[0xb][1] = uVar3;
  param_1[0xc][0] = 0xf1000000;
  param_1[0xc][1] = iVar10 << 0x10 | uVar9 & 0xffff;
  return param_1[0xd];
}