//compession format of most art assets

s64 decompress_LZB(byte *compDat,uint CompSize,byte *OutDat,int *outSize){
  byte *pbVar1;
  uint uVar2;
  uint uVar3;
  s64 uVar4;
  uint uVar5 = 0;
  uint uVar6 = 0;
  int iVar7 = 1;
  uint uVar8;
  int iVar9 = 0;
  
  do {
    while( true ) {
      uVar5 <<= 1;
      if ((uVar5 & 0xff) == 0) break;
      if ((uVar5 >> 8 & 1) == 0) {
        iVar7 = 1;
        goto LAB_800aa428;
      }
LAB_800aa3e8:
      pbVar1 = compDat + uVar6;
      uVar6++;
      iVar9++;
      *OutDat = *pbVar1;
      OutDat++;
    }
    pbVar1 = compDat + uVar6;
    uVar5 = (uint)*pbVar1 * 2 + 1;
    uVar6++;
    if ((uint)*pbVar1 * 2 >> 8 != 0) goto LAB_800aa3e8;
    iVar7 = 1;
LAB_800aa428:
    do {
      while( true ) {
        uVar5 = uVar5 << 1;
        if ((uVar5 & 0xff) == 0) {
          pbVar1 = compDat + uVar6;
          uVar6++;
          uVar5 = (uint)*pbVar1 * 2 + 1;
          uVar3 = (uint)*pbVar1 * 2 >> 8;
        }
        else {
          uVar3 = uVar5 >> 8 & 1;
        }
        iVar7 = iVar7 * 2 + uVar3;
        uVar5 <<= 1;
        if ((uVar5 & 0xff) == 0) break;
        if ((uVar5 >> 8 & 1) != 0) goto LAB_800aa478;
      }
      pbVar1 = compDat + uVar6;
      uVar5 = (uint)*pbVar1 * 2 + 1;
      uVar6++;
    } while ((uint)*pbVar1 * 2 >> 8 == 0);
LAB_800aa478:
    if (iVar7 != 2) {
      iVar7 = (iVar7 + -3) * 0x100 + (uint)compDat[uVar6];
      uVar6++;
      if (iVar7 == -1) {
        *outSize = iVar9;
        if (uVar6 == CompSize) {
          uVar4 = 0;
        }
        else {
          uVar4 = -0xc9;
          if (uVar6 < CompSize) {
            uVar4 = -0xcd;
          }
        }
        return uVar4;
      }
      uVar8 = iVar7 + 1;
    }
    uVar5 = uVar5 << 1;
    if ((uVar5 & 0xff) == 0) {
      pbVar1 = compDat + uVar6;
      uVar6++;
      uVar5 = (uint)*pbVar1 * 2 + 1;
      uVar3 = (uint)*pbVar1 * 2 >> 8;
    }
    else {uVar3 = uVar5 >> 8 & 1;}
    uVar5 = uVar5 << 1;
    if ((uVar5 & 0xff) == 0) {
      pbVar1 = compDat + uVar6;
      uVar6++;
      uVar5 = (uint)*pbVar1 * 2 + 1;
      uVar2 = (uint)*pbVar1 * 2 >> 8;
    }
    else {uVar2 = uVar5 >> 8 & 1;}
    iVar7 = uVar3 * 2 + uVar2;
    if (iVar7 == 0) {
      iVar7 = 1;
      do {
        while( true ) {
          uVar5 = uVar5 << 1;
          if ((uVar5 & 0xff) == 0) {
            pbVar1 = compDat + uVar6;
            uVar6++;
            uVar5 = (uint)*pbVar1 * 2 + 1;
            uVar3 = (uint)*pbVar1 * 2 >> 8;
          }
          else {uVar3 = uVar5 >> 8 & 1;}
          iVar7 = iVar7 * 2 + uVar3;
          uVar5 = uVar5 << 1;
          if ((uVar5 & 0xff) == 0) break;
          if ((uVar5 >> 8 & 1) != 0) goto LAB_800aa598;
        }
        pbVar1 = compDat + uVar6;
        uVar5 = (uint)*pbVar1 * 2 + 1;
        uVar6++;
      } while ((uint)*pbVar1 * 2 >> 8 == 0);
LAB_800aa598:
      iVar7+=2;
    }
    iVar7+= (uVar8 < 0xd01 ^ 1);
    pbVar1 = OutDat + -uVar8;
    iVar9++;
    *OutDat = *pbVar1;
    OutDat++;
    do {
      pbVar1++;
      iVar9++;
      iVar7--;
      *OutDat = *pbVar1;
      OutDat++;
    } while (iVar7 != 0);
  } while( true );
}

//two unused funcs below (16/32 bit versions?)
s64 LZB_func_2(byte *param_1,uint param_2,byte *param_3,int *param_4){
  byte bVar1;
  s64 uVar2;
  byte *pbVar2;
  byte *pbVar3;
  uint uVar4;
  uint uVar5;
  byte *pbVar6;
  int iVar7;
  uint uVar8;
  uint uVar9;
  int iVar10;
  
  uVar4 = 0;
  uVar9 = 0;
  iVar10 = 0;
  uVar8 = 1;
  pbVar6 = param_1;
  do {
    while( true ) {
      uVar4 = uVar4 << 1;
      if ((uVar4 & 0xffff) != 0) break;
      pbVar2 = pbVar6 + 2;
      uVar4 = ((uint)*pbVar6 + (uint)pbVar6[1] * 0x100) * 2 + 1;
      uVar9+= 2;
      pbVar6 = pbVar2;
      if ((uVar4 >> 0x10 & 1) != 0) {
        bVar1 = *pbVar2;
        goto LAB_800aa674;
      }
LAB_800aa690:
      iVar7 = 1;
      pbVar2 = param_1 + uVar9;
      do {
        uVar4 = uVar4 << 1;
        pbVar3 = pbVar2;
        if ((uVar4 & 0xffff) == 0) {
          pbVar3 = pbVar2 + 2;
          pbVar6+= 2;
          uVar9+= 2;
          uVar4 = ((uint)*pbVar2 + (uint)pbVar2[1] * 0x100) * 2 + 1;
        }
        iVar7 = iVar7 * 2 + (uVar4 >> 0x10 & 1);
        uVar4 = uVar4 << 1;
        pbVar2 = pbVar3;
        if ((uVar4 & 0xffff) == 0) {
          pbVar2 = pbVar3 + 2;
          pbVar6+= 2;
          uVar9+= 2;
          uVar4 = ((uint)*pbVar3 + (uint)pbVar3[1] * 0x100) * 2 + 1;
        }
      } while ((uVar4 >> 0x10 & 1) == 0);
      if (iVar7 != 2) {
        bVar1 = *pbVar6;
        pbVar6++;
        iVar7 = (iVar7 + -3) * 0x100 + (uint)bVar1;
        uVar9++;
        if (iVar7 == -1) {
          *param_4 = iVar10;
          if (uVar9 == param_2) {
            uVar2 = 0;
          }
          else {
            uVar2 = -0xc9;
            if (uVar9 < param_2) {
              uVar2 = -0xcd;
            }
          }
          return uVar2;
        }
        uVar8 = iVar7 + 1;
      }
      uVar5 = uVar4 << 1;
      pbVar2 = pbVar6;
      if ((uVar5 & 0xffff) == 0) {
        pbVar2 = pbVar6 + 2;
        uVar9+=2;
        uVar5 = ((uint)*pbVar6 + (uint)pbVar6[1] * 0x100) * 2 + 1;
      }
      uVar4 = uVar5 << 1;
      pbVar6 = pbVar2;
      if ((uVar4 & 0xffff) == 0) {
        pbVar6 = pbVar2 + 2;
        uVar9+= 2;
        uVar4 = ((uint)*pbVar2 + (uint)pbVar2[1] * 0x100) * 2 + 1;
      }
      iVar7 = (uVar5 >> 0x10 & 1) * 2 + (uVar4 >> 0x10 & 1);
      if (iVar7 == 0) {
        iVar7 = 1;
        do {
          uVar4 = uVar4 << 1;
          pbVar2 = pbVar6;
          if ((uVar4 & 0xffff) == 0) {
            pbVar2 = pbVar6 + 2;
            uVar9+= 2;
            uVar4 = ((uint)*pbVar6 + (uint)pbVar6[1] * 0x100) * 2 + 1;
          }
          iVar7 = iVar7 * 2 + (uVar4 >> 0x10 & 1);
          uVar4 = uVar4 << 1;
          pbVar6 = pbVar2;
          if ((uVar4 & 0xffff) == 0) {
            pbVar6 = pbVar2 + 2;
            uVar9+= 2;
            uVar4 = ((uint)*pbVar2 + (uint)pbVar2[1] * 0x100) * 2 + 1;
          }
        } while ((uVar4 >> 0x10 & 1) == 0);
        iVar7+= 2;
      }
      iVar7+= (uVar8 < 0xd01 ^ 1);
      pbVar2 = param_3 + -uVar8;
      iVar10++;
      *param_3 = *pbVar2;
      param_3++;
      do {
        pbVar2 = pbVar2 + 1;
        iVar10++;
        iVar7--;
        *param_3 = *pbVar2;
        param_3++;
      } while (iVar7 != 0);
    }
    if ((uVar4 >> 0x10 & 1) == 0) goto LAB_800aa690;
    bVar1 = *pbVar6;
    pbVar2 = pbVar6;
LAB_800aa674:
    pbVar6 = pbVar2 + 1;
    uVar9++;
    iVar10++;
    *param_3 = bVar1;
    param_3++;
  } while( true );
}

s64 LZB_func_3(byte *param_1,uint param_2,byte *param_3,int *param_4){
  byte *pbVar1;
  byte *pbVar2;
  byte *pbVar3;
  bool bVar4;
  byte bVar5;
  s64 uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  byte *pbVar10;
  uint uVar11;
  uint uVar12;
  int iVar13;
  uint uVar14;
  uint uVar15;
  int iVar16;
  
  uVar11 = 0;
  uVar7 = 0;
  uVar15 = 0;
  iVar16 = 0;
  uVar14 = 1;
  pbVar10 = param_1;
  do {
    while (bVar4 = uVar11 == 0, uVar11 = uVar11 - 1, bVar4) {
      uVar11 = 0x1f;
      bVar5 = *pbVar10;
      pbVar8 = pbVar10 + 1;
      pbVar1 = pbVar10 + 2;
      pbVar2 = pbVar10 + 3;
      pbVar10 = pbVar10 + 4;
      uVar7 = (uint)bVar5 + (uint)*pbVar8 * 0x100 + (uint)*pbVar1 * 0x10000 +
              (uint)*pbVar2 * 0x1000000;
      uVar15 = uVar15 + 4;
      if ((int)uVar7 < 0) {
        bVar5 = *pbVar10;
        goto LAB_800aa93c;
      }
LAB_800aa958:
      iVar13 = 1;
      pbVar8 = param_1 + uVar15;
      do {
        while( true ) {
          if (uVar11 == 0) {
            uVar11 = 0x1f;
            bVar5 = *pbVar8;
            pbVar1 = pbVar8 + 1;
            pbVar2 = pbVar8 + 2;
            pbVar3 = pbVar8 + 3;
            pbVar8 = pbVar8 + 4;
            pbVar10 = pbVar10 + 4;
            uVar15 = uVar15 + 4;
            uVar7 = (uint)bVar5 + (uint)*pbVar1 * 0x100 + (uint)*pbVar2 * 0x10000 +
                    (uint)*pbVar3 * 0x1000000;
            uVar12 = uVar7 >> 0x1f;
          }
          else {
            uVar11 = uVar11 - 1;
            uVar12 = uVar7 >> (uVar11 & 0x1f) & 1;
          }
          iVar13 = iVar13 * 2 + uVar12;
          if (uVar11 == 0) break;
          uVar11 = uVar11 - 1;
          if ((uVar7 >> (uVar11 & 0x1f) & 1) != 0) goto LAB_800aaa0c;
        }
        uVar11 = 0x1f;
        bVar5 = *pbVar8;
        pbVar1 = pbVar8 + 1;
        pbVar2 = pbVar8 + 2;
        pbVar3 = pbVar8 + 3;
        pbVar8 = pbVar8 + 4;
        pbVar10 = pbVar10 + 4;
        uVar7 = (uint)bVar5 + (uint)*pbVar1 * 0x100 + (uint)*pbVar2 * 0x10000 +
                (uint)*pbVar3 * 0x1000000;
        uVar15 = uVar15 + 4;
      } while (-1 < (int)uVar7);
LAB_800aaa0c:
      if (iVar13 != 2) {
        bVar5 = *pbVar10;
        pbVar10 = pbVar10 + 1;
        iVar13 = (iVar13 + -3) * 0x100 + (uint)bVar5;
        uVar15 = uVar15 + 1;
        if (iVar13 == -1) {
          *param_4 = iVar16;
          if (uVar15 == param_2) {
            uVar6 = 0;
          }
          else {
            uVar6 = -0xc9;
            if (uVar15 < param_2) {
              uVar6 = -0xcd;
            }
          }
          return uVar6;
        }
        uVar14 = iVar13 + 1;
      }
      uVar12 = uVar11 - 1;
      if (uVar11 == 0) {
        uVar12 = 0x1f;
        bVar5 = *pbVar10;
        pbVar8 = pbVar10 + 1;
        pbVar1 = pbVar10 + 2;
        pbVar2 = pbVar10 + 3;
        pbVar10 = pbVar10 + 4;
        uVar15 = uVar15 + 4;
        uVar7 = (uint)bVar5 + (uint)*pbVar8 * 0x100 + (uint)*pbVar1 * 0x10000 +
                (uint)*pbVar2 * 0x1000000;
        uVar9 = uVar7 >> 0x1f;
      }
      else {
        uVar9 = uVar7 >> (uVar12 & 0x1f) & 1;
      }
      if (uVar12 == 0) {
        uVar11 = 0x1f;
        bVar5 = *pbVar10;
        pbVar8 = pbVar10 + 1;
        pbVar1 = pbVar10 + 2;
        pbVar2 = pbVar10 + 3;
        pbVar10 = pbVar10 + 4;
        uVar15 = uVar15 + 4;
        uVar7 = (uint)bVar5 + (uint)*pbVar8 * 0x100 + (uint)*pbVar1 * 0x10000 +
                (uint)*pbVar2 * 0x1000000;
        uVar12 = uVar7 >> 0x1f;
      }
      else {
        uVar11 = uVar12 - 1;
        uVar12 = uVar7 >> (uVar11 & 0x1f) & 1;
      }
      iVar13 = uVar9 * 2 + uVar12;
      if (iVar13 == 0) {
        iVar13 = 1;
        do {
          while( true ) {
            if (uVar11 == 0) {
              uVar11 = 0x1f;
              bVar5 = *pbVar10;
              pbVar8 = pbVar10 + 1;
              pbVar1 = pbVar10 + 2;
              pbVar2 = pbVar10 + 3;
              pbVar10 = pbVar10 + 4;
              uVar15 = uVar15 + 4;
              uVar7 = (uint)bVar5 + (uint)*pbVar8 * 0x100 + (uint)*pbVar1 * 0x10000 +
                      (uint)*pbVar2 * 0x1000000;
              uVar12 = uVar7 >> 0x1f;
            }
            else {
              uVar11 = uVar11 - 1;
              uVar12 = uVar7 >> (uVar11 & 0x1f) & 1;
            }
            iVar13 = iVar13 * 2 + uVar12;
            if (uVar11 == 0) break;
            uVar11 = uVar11 - 1;
            if ((uVar7 >> (uVar11 & 0x1f) & 1) != 0) goto LAB_800aab98;
          }
          uVar11 = 0x1f;
          bVar5 = *pbVar10;
          pbVar8 = pbVar10 + 1;
          pbVar1 = pbVar10 + 2;
          pbVar2 = pbVar10 + 3;
          pbVar10 = pbVar10 + 4;
          uVar7 = (uint)bVar5 + (uint)*pbVar8 * 0x100 + (uint)*pbVar1 * 0x10000 +
                  (uint)*pbVar2 * 0x1000000;
          uVar15 = uVar15 + 4;
        } while (-1 < (int)uVar7);
LAB_800aab98:
        iVar13 = iVar13 + 2;
      }
      iVar13 = iVar13 + (uVar14 < 0xd01 ^ 1);
      pbVar8 = param_3 + -uVar14;
      iVar16 = iVar16 + 1;
      *param_3 = *pbVar8;
      param_3 = param_3 + 1;
      do {
        pbVar8 = pbVar8 + 1;
        iVar16 = iVar16 + 1;
        iVar13 = iVar13 + -1;
        *param_3 = *pbVar8;
        param_3 = param_3 + 1;
      } while (iVar13 != 0);
    }
    if ((uVar7 >> (uVar11 & 0x1f) & 1) == 0) goto LAB_800aa958;
    bVar5 = *pbVar10;
LAB_800aa93c:
    pbVar10 = pbVar10 + 1;
    uVar15 = uVar15 + 1;
    iVar16 = iVar16 + 1;
    *param_3 = bVar5;
    param_3 = param_3 + 1;
  } while( true );
}
