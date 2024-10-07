#include "decompress.h"
//compession format largely used by text.


s32 decompress_LZ01(u8 *compDat,u32 compSize,u8 *OutDat,u32 *OutSize){
  byte bVar1;
  s32 sVar2;
  byte *pbVar3;
  byte *pbVar4;
  byte *pbVar5;
  uint uVar6;
  int iVar7;
  uint uVar8;
  byte *pbVar9;
  
  *OutSize = 0;
  pbVar3 = compDat + compSize;
  pbVar9 = OutDat;
  if (*compDat < 0x12) {
    bVar1 = *compDat;
    goto LAB_800a9d40;
  }
  uVar6 = *compDat - 0x11;
  compDat++;
  if (uVar6 < 4) goto LAB_800a9f90;
  do {
    bVar1 = *compDat;
    compDat++;
    uVar6 -= 1;
    *pbVar9 = bVar1;
    pbVar9 = pbVar9 + 1;
  } while (uVar6 != 0);
  bVar1 = *compDat;
LAB_800a9dcc:
  uVar6 = (uint)bVar1;
  pbVar5 = compDat + 1;
  if (0xf < uVar6) goto LAB_800a9e0c;
  compDat = compDat + 2;
  pbVar4 = pbVar9 + (uint)*pbVar5 * -4 + (-0x801 - (uint)(bVar1 >> 2)) + 1;
  *pbVar9 = pbVar9[(uint)*pbVar5 * -4 + (-0x801 - (uint)(bVar1 >> 2))];
  bVar1 = *pbVar4;
  pbVar9 = pbVar9 + 1;
LAB_800a9f30:
  *pbVar9 = bVar1;
  pbVar9[1] = pbVar4[1];
  pbVar9 = pbVar9 + 2;
LAB_800a9f80:
  uVar6 = compDat[-2] & 3;
  if ((compDat[-2] & 3) == 0) {
    bVar1 = *compDat;
LAB_800a9d40:
    uVar6 = (uint)bVar1;
    pbVar5 = compDat + 1;
    if (uVar6 < 0x10) goto code_r0x800a9d4c;
  }
  else {
LAB_800a9f90:
    do {
      pbVar5 = compDat;
      uVar6 -= 1;
      *pbVar9++ = *pbVar5;
      compDat = pbVar5 + 1;
    } while (uVar6 != 0);
    uVar6 = (uint)pbVar5[1];
    pbVar5 = pbVar5 + 2;
  }
LAB_800a9e0c:
  if (uVar6 < 0x40) {
    if (uVar6 < 0x20) {
      if (uVar6 < 0x10) goto LAB_800a9f14;
      uVar8 = uVar6 & 7;
      if (uVar8 == 0) {
        iVar7 = 0;
        if (*pbVar5 == 0) {
          do {
            pbVar5 = pbVar5 + 1;
            iVar7 += 0xff;
          } while (*pbVar5 == 0);
          bVar1 = *pbVar5;
        }
        else {
          bVar1 = *pbVar5;
          iVar7 = 0;
        }
        pbVar5 = pbVar5 + 1;
        uVar8 = iVar7 + 7 + (uint)bVar1;
      }
      compDat = pbVar5 + 2;
      if (pbVar9 + ((uVar6 & 8) * -0x800 - ((uint)(*pbVar5 >> 2) + (uint)pbVar5[1] * 0x40)) ==
          pbVar9) {
        *OutSize = (int)pbVar9 - (int)OutDat;
        if (compDat == pbVar3) {
          sVar2 = 0;
        }
        else {
          sVar2 = -4;
          if (compDat < pbVar3) {
            sVar2 = -8;
          }
        }
        return sVar2;
      }
      pbVar5 = pbVar9 + ((uVar6 & 8) * -0x800 - ((uint)(*pbVar5 >> 2) + (uint)pbVar5[1] * 0x40)) +
               -0x4000;
    }
    else {
      uVar8 = uVar6 & 0x1f;
      if (uVar8 == 0) {
        iVar7 = 0;
        if (*pbVar5 == 0) {
          do {
            pbVar5 = pbVar5 + 1;
            iVar7 += 0xff;
          } while (*pbVar5 == 0);
          bVar1 = *pbVar5;
        }
        else {
          bVar1 = *pbVar5;
          iVar7 = 0;
        }
        pbVar5 = pbVar5 + 1;
        uVar8 = iVar7 + 0x1f + (uint)bVar1;
      }
      compDat = pbVar5 + 2;
      pbVar5 = pbVar9 + (-1 - ((uint)(*pbVar5 >> 2) + (uint)pbVar5[1] * 0x40));
    }
  }
  else {
    compDat = pbVar5 + 1;
    uVar8 = (uVar6 >> 5) - 1;
    pbVar5 = pbVar9 + (uint)*pbVar5 * -8 + (-1 - (uVar6 >> 2 & 7));
  }
  *pbVar9 = *pbVar5;
  pbVar4 = pbVar5 + 2;
  pbVar9[1] = pbVar5[1];
  pbVar9 = pbVar9 + 2;
  do {
    bVar1 = *pbVar4;
    pbVar4 = pbVar4 + 1;
    uVar8 -= 1;
    *pbVar9 = bVar1;
    pbVar9 = pbVar9 + 1;
  } while (uVar8 != 0);
  goto LAB_800a9f80;
LAB_800a9f14:
  pbVar4 = pbVar9 + (uint)*pbVar5 * -4 + (-1 - (uVar6 >> 2));
  bVar1 = *pbVar4;
  compDat = pbVar5 + 1;
  goto LAB_800a9f30;
code_r0x800a9d4c:
  if (uVar6 == 0) {
    iVar7 = 0;
    if (*pbVar5 == 0) {
      do {
        pbVar5 = pbVar5 + 1;
        iVar7 += 0xff;
      } while (*pbVar5 == 0);
      bVar1 = *pbVar5;
    }
    else {
      bVar1 = *pbVar5;
      iVar7 = 0;
    }
    pbVar5 = pbVar5 + 1;
    uVar6 = iVar7 + 0xf + (uint)bVar1;
    bVar1 = *pbVar5;
  }
  else {
    bVar1 = *pbVar5;
  }
  *pbVar9 = bVar1;
  pbVar9[1] = pbVar5[1];
  compDat = pbVar5 + 3;
  pbVar9[2] = pbVar5[2];
  pbVar9 = pbVar9 + 3;
  do {
    bVar1 = *compDat;
    compDat = compDat + 1;
    uVar6 -= 1;
    *pbVar9 = bVar1;
    pbVar9 = pbVar9 + 1;
  } while (uVar6 != 0);
  bVar1 = *compDat;
  goto LAB_800a9dcc;
}


s32 LZ01_func_2(byte *param_1,int param_2,byte *param_3,byte **param_4){
  byte *pbVar1;
  byte bVar2;
  s32 sVar3;
  byte *pbVar4;
  byte *pbVar5;
  byte *pbVar6;
  uint uVar7;
  int iVar8;
  uint uVar9;
  byte *pbVar10;
  
  pbVar1 = *param_4;
  pbVar4 = param_1 + param_2;
  *param_4 = 0;
  pbVar10 = param_3;
  if (*param_1 < 0x12) goto LAB_800aa318;
  uVar7 = *param_1 - 0x11;
  pbVar6 = param_1 + 1;
  if (uVar7 < 4) goto LAB_800aa2e8;
  do {
    bVar2 = *pbVar6;
    pbVar6 = pbVar6 + 1;
    uVar7 -= 1;
    *pbVar10 = bVar2;
    pbVar10 = pbVar10 + 1;
  } while (uVar7 != 0);
  bVar2 = *pbVar6;
LAB_800aa0c8:
  uVar7 = (uint)bVar2;
  param_1 = pbVar6 + 1;
  if (0xf < uVar7) goto LAB_800aa138;
  pbVar5 = pbVar10 + (uint)*param_1 * -4 + (-0x801 - (uint)(bVar2 >> 2));
  param_1 = pbVar6 + 2;
  if (pbVar5 < param_3) {
LAB_800aa374:
    pbVar5 = pbVar10 + -(int)param_3;
LAB_800aa378:
    *param_4 = pbVar5;
    return -6;
  }
  pbVar6 = pbVar10 + -(int)param_3;
  if ((uint)((int)(param_3 + (int)pbVar1) - (int)pbVar10) < 3) {
LAB_800aa368:
    *param_4 = pbVar6;
    return -5;
  }
  *pbVar10 = *pbVar5;
  pbVar10[1] = pbVar5[1];
  pbVar10[2] = pbVar5[2];
  pbVar10 = pbVar10 + 3;
LAB_800aa2d8:
  uVar7 = param_1[-2] & 3;
  pbVar6 = param_1;
  if ((param_1[-2] & 3) == 0) {
LAB_800aa318:
    if (pbVar4 <= param_1) {
      *param_4 = pbVar10 + -(int)param_3;
      return -7;
    }
    uVar7 = (uint)*param_1;
    param_1 = param_1 + 1;
    if (uVar7 < 0x10) goto code_r0x800aa044;
  }
  else {
LAB_800aa2e8:
    do {
      pbVar5 = pbVar6;
      uVar7 -= 1;
      *pbVar10 = *pbVar5;
      pbVar10 = pbVar10 + 1;
      pbVar6 = pbVar5 + 1;
    } while (uVar7 != 0);
    uVar7 = (uint)pbVar5[1];
    param_1 = pbVar5 + 2;
    if (pbVar4 <= param_1) goto LAB_800aa318;
  }
LAB_800aa138:
  if (uVar7 < 0x40) {
    if (0x1f < uVar7) {
      uVar9 = uVar7 & 0x1f;
      if (uVar9 == 0) {
        iVar8 = 0;
        while( true ) {
          pbVar6 = pbVar10 + -(int)param_3;
          if (pbVar4 == param_1) goto LAB_800aa35c;
          if (*param_1 != 0) break;
          iVar8 += 0xff;
          param_1 = param_1 + 1;
        }
        bVar2 = *param_1;
        param_1 = param_1 + 1;
        uVar9 = iVar8 + 0x1f + (uint)bVar2;
      }
      bVar2 = *param_1;
      pbVar6 = param_1 + 1;
      param_1 = param_1 + 2;
      pbVar6 = pbVar10 + (-1 - ((uint)(bVar2 >> 2) + (uint)*pbVar6 * 0x40));
      goto LAB_800aa294;
    }
    if (0xf < uVar7) {
      uVar9 = uVar7 & 7;
      if (uVar9 == 0) {
        iVar8 = 0;
        while( true ) {
          pbVar6 = pbVar10 + -(int)param_3;
          if (pbVar4 == param_1) goto LAB_800aa35c;
          if (*param_1 != 0) break;
          iVar8 += 0xff;
          param_1 = param_1 + 1;
        }
        bVar2 = *param_1;
        param_1 = param_1 + 1;
        uVar9 = iVar8 + 7 + (uint)bVar2;
      }
      bVar2 = *param_1;
      pbVar6 = param_1 + 1;
      param_1 = param_1 + 2;
      if (pbVar10 + ((uVar7 & 8) * -0x800 - ((uint)(bVar2 >> 2) + (uint)*pbVar6 * 0x40)) == pbVar10)
      {
        *param_4 = pbVar10 + -(int)param_3;
        if (param_1 == pbVar4) {
          sVar3 = 0;
        }
        else {
          sVar3 = -4;
          if (param_1 < pbVar4) {
            sVar3 = -8;
          }
        }
        return sVar3;
      }
      pbVar6 = pbVar10 + ((uVar7 & 8) * -0x800 - ((uint)(bVar2 >> 2) + (uint)*pbVar6 * 0x40)) +
               -0x4000;
      goto LAB_800aa294;
    }
    pbVar5 = pbVar10 + (uint)*param_1 * -4 + (-1 - (uVar7 >> 2));
    param_1 = param_1 + 1;
    if (pbVar5 < param_3) goto LAB_800aa374;
    pbVar6 = pbVar10 + -(int)param_3;
    if ((uint)((int)(param_3 + (int)pbVar1) - (int)pbVar10) < 2) goto LAB_800aa368;
    *pbVar10 = *pbVar5;
    pbVar10[1] = pbVar5[1];
    pbVar10 = pbVar10 + 2;
  }
  else {
    bVar2 = *param_1;
    param_1 = param_1 + 1;
    uVar9 = (uVar7 >> 5) - 1;
    pbVar6 = pbVar10 + (uint)bVar2 * -8 + (-1 - (uVar7 >> 2 & 7));
LAB_800aa294:
    pbVar5 = pbVar10 + -(int)param_3;
    if (pbVar6 < param_3) goto LAB_800aa378;
    *pbVar10 = *pbVar6;
    pbVar5 = pbVar6 + 2;
    pbVar10[1] = pbVar6[1];
    pbVar10 = pbVar10 + 2;
    do {
      bVar2 = *pbVar5;
      pbVar5 = pbVar5 + 1;
      uVar9 -= 1;
      *pbVar10 = bVar2;
      pbVar10 = pbVar10 + 1;
    } while (uVar9 != 0);
  }
  goto LAB_800aa2d8;
code_r0x800aa044:
  if (uVar7 == 0) {
    iVar8 = 0;
    do {
      pbVar6 = pbVar10 + -(int)param_3;
      if (pbVar4 == param_1) {
LAB_800aa35c:
        *param_4 = pbVar6;
        return -4;
      }
      if (*param_1 != 0) goto code_r0x800aa06c;
      iVar8 += 0xff;
      param_1 = param_1 + 1;
    } while( true );
  }
  bVar2 = *param_1;
LAB_800aa080:
  *pbVar10 = bVar2;
  pbVar10[1] = param_1[1];
  pbVar6 = param_1 + 3;
  pbVar10[2] = param_1[2];
  pbVar10 = pbVar10 + 3;
  do {
    bVar2 = *pbVar6;
    pbVar6 = pbVar6 + 1;
    uVar7 -= 1;
    *pbVar10 = bVar2;
    pbVar10 = pbVar10 + 1;
  } while (uVar7 != 0);
  bVar2 = *pbVar6;
  goto LAB_800aa0c8;
code_r0x800aa06c:
  bVar2 = *param_1;
  param_1 = param_1 + 1;
  uVar7 = iVar8 + 0xf + (uint)bVar2;
  bVar2 = *param_1;
  goto LAB_800aa080;
}

