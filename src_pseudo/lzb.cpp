#include "decompress.h"
//compession format of most art assets

s32 decompress_LZB(u8 *compDat,u32 CompSize,u8 *OutDat,u32 *outSize){
  u8 *pbVar1;
  u32 uVar2;
  u32 uVar3;
  s32 errOut;
  u32 uVar5 = 0;
  u32 uVar6 = 0;
  s32 iVar7 = 1;
  u32 uVar8;
  s32 iVar9 = 0;
  
  do {
    while( true ) {
      uVar5 <<= 1;
      if ((uVar5 & 0xff) == 0) break;
      if ((uVar5 >> 8 & 1) == 0) {
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
    uVar5 = (u32)*pbVar1 * 2 + 1;
    uVar6++;
    if ((u32)*pbVar1 * 2 >> 8 != 0) goto LAB_800aa3e8;
LAB_800aa428:
    iVar7 = 1;
    do {
      while( true ) {
        uVar5<<= 1;
        if ((uVar5 & 0xff) == 0) {
          pbVar1 = compDat + uVar6;
          uVar6++;
          uVar5 = (u32)*pbVar1 * 2 + 1;
          uVar3 = (u32)*pbVar1 * 2 >> 8;
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
      uVar5 = (u32)*pbVar1 * 2 + 1;
      uVar6++;
    } while ((u32)*pbVar1 * 2 >> 8 == 0);
LAB_800aa478:
    if (iVar7 != 2) {
      iVar7 = (iVar7 + -3) * 0x100 + (u32)compDat[uVar6];
      uVar6++;
      if (iVar7 == -1) {
        *outSize = iVar9;
        if (uVar6 == CompSize) {
          errOut = 0;
        }
        else {
          errOut = -0xc9;
          if (uVar6 < CompSize) {
            errOut = -0xcd;
          }
        }
        return errOut;
      }
      uVar8 = iVar7 + 1;
    }
    uVar5 <<= 1;
    if ((uVar5 & 0xff) == 0) {
      pbVar1 = compDat + uVar6;
      uVar6++;
      uVar5 = (u32)*pbVar1 * 2 + 1;
      uVar3 = (u32)*pbVar1 * 2 >> 8;
    }
    else {uVar3 = uVar5 >> 8 & 1;}
    uVar5 = uVar5 << 1;
    if ((uVar5 & 0xff) == 0) {
      pbVar1 = compDat + uVar6;
      uVar6++;
      uVar5 = (u32)*pbVar1 * 2 + 1;
      uVar2 = (u32)*pbVar1 * 2 >> 8;
    }
    else {uVar2 = uVar5 >> 8 & 1;}
    iVar7 = uVar3 * 2 + uVar2;
    if (iVar7 == 0) {
      iVar7 = 1;
      do {
        while( true ) {
          uVar5 <<= 1;
          if ((uVar5 & 0xff) == 0) {
            pbVar1 = compDat + uVar6;
            uVar6++;
            uVar5 = (u32)*pbVar1 * 2 + 1;
            uVar3 = (u32)*pbVar1 * 2 >> 8;
          }
          else {uVar3 = uVar5 >> 8 & 1;}
          iVar7 = iVar7 * 2 + uVar3;
          uVar5 <<= 1;
          if ((uVar5 & 0xff) == 0) break;
          if ((uVar5 >> 8 & 1) != 0) goto LAB_800aa598;
        }
        pbVar1 = compDat + uVar6;
        uVar5 = (u32)*pbVar1 * 2 + 1;
        uVar6++;
      } while ((u32)*pbVar1 * 2 >> 8 == 0);
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
s32 LZB_func_2(u8 *param_1,u32 param_2,u8 *param_3,s32 *param_4){
  u8 bVar1;
  s32 uVar2;
  u8 *pbVar2;
  u8 *pbVar3;
  u32 uVar4;
  u32 uVar5;
  u8 *pbVar6;
  s32 iVar7;
  u32 uVar8;
  u32 uVar9;
  s32 iVar10;
  
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
      uVar4 = ((u32)*pbVar6 + (u32)pbVar6[1] * 0x100) * 2 + 1;
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
          uVar4 = ((u32)*pbVar2 + (u32)pbVar2[1] * 0x100) * 2 + 1;
        }
        iVar7 = iVar7 * 2 + (uVar4 >> 0x10 & 1);
        uVar4 = uVar4 << 1;
        pbVar2 = pbVar3;
        if ((uVar4 & 0xffff) == 0) {
          pbVar2 = pbVar3 + 2;
          pbVar6+= 2;
          uVar9+= 2;
          uVar4 = ((u32)*pbVar3 + (u32)pbVar3[1] * 0x100) * 2 + 1;
        }
      } while ((uVar4 >> 0x10 & 1) == 0);
      if (iVar7 != 2) {
        bVar1 = *pbVar6;
        pbVar6++;
        iVar7 = (iVar7 + -3) * 0x100 + (u32)bVar1;
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
        uVar5 = ((u32)*pbVar6 + (u32)pbVar6[1] * 0x100) * 2 + 1;
      }
      uVar4 = uVar5 << 1;
      pbVar6 = pbVar2;
      if ((uVar4 & 0xffff) == 0) {
        pbVar6 = pbVar2 + 2;
        uVar9+= 2;
        uVar4 = ((u32)*pbVar2 + (u32)pbVar2[1] * 0x100) * 2 + 1;
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
            uVar4 = ((u32)*pbVar6 + (u32)pbVar6[1] * 0x100) * 2 + 1;
          }
          iVar7 = iVar7 * 2 + (uVar4 >> 0x10 & 1);
          uVar4 = uVar4 << 1;
          pbVar6 = pbVar2;
          if ((uVar4 & 0xffff) == 0) {
            pbVar6 = pbVar2 + 2;
            uVar9+= 2;
            uVar4 = ((u32)*pbVar2 + (u32)pbVar2[1] * 0x100) * 2 + 1;
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

s32 LZB_func_3(u8 *param_1,u32 param_2,u8 *param_3,s32 *param_4){
  u8 *pbVar1;
  u8 *pbVar2;
  u8 *pbVar3;
  u8 bVar4;
  u8 bVar5;
  s32 uVar6;
  u32 uVar7;
  u8 *pbVar8;
  u32 uVar9;
  u8 *pbVar10;
  u32 uVar11;
  u32 uVar12;
  s32 iVar13;
  u32 uVar14;
  u32 uVar15;
  s32 iVar16;
  
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
      uVar7 = (u32)bVar5 + (u32)*pbVar8 * 0x100 + (u32)*pbVar1 * 0x10000 +
              (u32)*pbVar2 * 0x1000000;
      uVar15 = uVar15 + 4;
      if ((s32)uVar7 < 0) {
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
            uVar7 = (u32)bVar5 + (u32)*pbVar1 * 0x100 + (u32)*pbVar2 * 0x10000 +
                    (u32)*pbVar3 * 0x1000000;
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
        uVar7 = (u32)bVar5 + (u32)*pbVar1 * 0x100 + (u32)*pbVar2 * 0x10000 +
                (u32)*pbVar3 * 0x1000000;
        uVar15 = uVar15 + 4;
      } while (-1 < (s32)uVar7);
LAB_800aaa0c:
      if (iVar13 != 2) {
        bVar5 = *pbVar10;
        pbVar10 = pbVar10 + 1;
        iVar13 = (iVar13 + -3) * 0x100 + (u32)bVar5;
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
        uVar7 = (u32)bVar5 + (u32)*pbVar8 * 0x100 + (u32)*pbVar1 * 0x10000 +
                (u32)*pbVar2 * 0x1000000;
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
        uVar7 = (u32)bVar5 + (u32)*pbVar8 * 0x100 + (u32)*pbVar1 * 0x10000 +
                (u32)*pbVar2 * 0x1000000;
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
              uVar7 = (u32)bVar5 + (u32)*pbVar8 * 0x100 + (u32)*pbVar1 * 0x10000 +
                      (u32)*pbVar2 * 0x1000000;
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
          uVar7 = (u32)bVar5 + (u32)*pbVar8 * 0x100 + (u32)*pbVar1 * 0x10000 +
                  (u32)*pbVar2 * 0x1000000;
          uVar15 = uVar15 + 4;
        } while (-1 < (s32)uVar7);
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
