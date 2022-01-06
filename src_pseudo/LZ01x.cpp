//compession format largely used by text.

s64 decompress_LZ01(u8 *compDat,s32 compSize,u8 *OutDat,u8 **OutSize){
  u8 bVar1;
  s64 uVar2;
  u8 *pbVar2;
  u8 *pbVar3;
  u8 *pbVar4;
  u32 uVar5;
  u32 uVar6;
  u8 *pbVar7;
  
  *OutSize = NULL;
  pbVar2 = compDat + compSize;
  pbVar7 = OutDat;
  if (*compDat < 18) {
    bVar1 = *compDat;
    goto LAB_800a9d40;
  }
  uVar5 = *compDat - 17;
  compDat++;
  if (uVar5 < 4) goto LAB_800a9f90;
  do {
    bVar1 = *compDat;
    compDat++;
    uVar5--;
    *pbVar7 = bVar1;
    pbVar7++;
  } while (uVar5 != 0);
  bVar1 = *compDat;
LAB_800a9dcc:
  uVar5 = (u32)bVar1;
  pbVar4 = compDat + 1;
  if (0xf < uVar5) goto LAB_800a9e0c;
  compDat+= 2;
  pbVar3 = pbVar7 + (u32)*pbVar4 * -4 + (-0x801 - (u32)(bVar1 >> 2)) + 1;
  *pbVar7 = pbVar7[(u32)*pbVar4 * -4 + (-0x801 - (u32)(bVar1 >> 2))];
  bVar1 = *pbVar3;
  pbVar7++;
LAB_800a9f30:
  *pbVar7 = bVar1;
  pbVar7[1] = pbVar3[1];
  pbVar7+=2;
LAB_800a9f80:
  uVar5 = compDat[-2] & 3;
  if ((compDat[-2] & 3) == 0) {
    bVar1 = *compDat;
LAB_800a9d40:
    uVar5 = (u32)bVar1;
    pbVar4 = compDat + 1;
    if (uVar5 < 0x10) goto code_r0x800a9d4c;
  }
  else {
LAB_800a9f90:
    do {
      pbVar4 = compDat;
      uVar5--;
      *pbVar7 = *pbVar4;
      pbVar7++;
      compDat = pbVar4 + 1;
    } while (uVar5 != 0);
    uVar5 = (u32)pbVar4[1];
    pbVar4+= 2;
  }
LAB_800a9e0c:
  if (uVar5 < 0x40) {
    if (uVar5 < 0x20) {
      if (uVar5 < 0x10) goto LAB_800a9f14;
      uVar6 = uVar5 & 7;
      if (uVar6 == 0) {
        if (*pbVar4 == 0) {
          do {
            pbVar4++;
            uVar6+= 0xff;
          } while (*pbVar4 == 0);
          bVar1 = *pbVar4;
        }
        else {
          bVar1 = *pbVar4;
        }
        pbVar4++;
        uVar6+= 7 + (u32)bVar1;
      }
      compDat = pbVar4 + 2;
      if (pbVar7 + ((uVar5 & 8) * -0x800 - ((u32)(*pbVar4 >> 2) + (u32)pbVar4[1] * 0x40)) ==
          pbVar7) {
        *OutSize = pbVar7 + -(s32)OutDat;
        if (compDat == pbVar2) {uVar2 = 0;}
        else {
          uVar2 = -4;
          if (compDat < pbVar2) {uVar2 = -8;}
        }
        return uVar2;
      }
      pbVar4 = pbVar7 + ((uVar5 & 8) * -0x800 - ((u32)(*pbVar4 >> 2) + (u32)pbVar4[1] * 0x40)) +
               -0x4000;
    }
    else {
      uVar6 = uVar5 & 0x1f;
      if (uVar6 == 0) {
        if (*pbVar4 == 0) {
          do {
            pbVar4++;
            uVar6+= 0xff;
          } while (*pbVar4 == 0);
          bVar1 = *pbVar4;
        }
        else {
          bVar1 = *pbVar4;
        }
        pbVar4 = pbVar4 + 1;
        uVar6 = uVar6 + 0x1f + (u32)bVar1;
      }
      compDat = pbVar4 + 2;
      pbVar4 = pbVar7 + (-1 - ((u32)(*pbVar4 >> 2) + (u32)pbVar4[1] * 0x40));
    }
  }
  else {
    compDat = pbVar4 + 1;
    uVar6 = (uVar5 >> 5) - 1;
    pbVar4 = pbVar7 + (u32)*pbVar4 * -8 + (-1 - (uVar5 >> 2 & 7));
  }
  *pbVar7 = *pbVar4;
  pbVar3 = pbVar4 + 2;
  pbVar7[1] = pbVar4[1];
  pbVar7 = pbVar7 + 2;
  do {
    bVar1 = *pbVar3;
    pbVar3++;
    uVar6--;
    *pbVar7 = bVar1;
    pbVar7++;
  } while (uVar6 != 0);
  goto LAB_800a9f80;
LAB_800a9f14:
  pbVar3 = pbVar7 + (u32)*pbVar4 * -4 + (-1 - (uVar5 >> 2));
  bVar1 = *pbVar3;
  compDat = pbVar4 + 1;
  goto LAB_800a9f30;
code_r0x800a9d4c:
  if (uVar5 == 0) {
    if (*pbVar4 == 0) {
      do {
        pbVar4++;
        uVar5+= 0xff;
      } while (*pbVar4 == 0);
      bVar1 = *pbVar4;
    }
    else {bVar1 = *pbVar4;}
    pbVar4++;
    uVar5 += 0xf + (u32)bVar1;
    bVar1 = *pbVar4;
  }
  else {bVar1 = *pbVar4;}
  *pbVar7 = bVar1;
  pbVar7[1] = pbVar4[1];
  compDat = pbVar4 + 3;
  pbVar7[2] = pbVar4[2];
  pbVar7+= 3;
  do {
    bVar1 = *compDat;
    compDat++;
    uVar5--;
    *pbVar7 = bVar1;
    pbVar7++;
  } while (uVar5 != 0);
  bVar1 = *compDat;
  goto LAB_800a9dcc;
}

s64 LZ01_func_2(u8 *param_1,s32 param_2,u8 *param_3,u8 **param_4){
  u8 *pbVar1;
  u8 bVar2;
  s64 sVar3;
  u8 *pbVar4;
  u8 *pbVar5;
  u8 *pbVar6;
  u32 uVar7;
  u32 uVar8;
  u8 *pbVar9;
  
  pbVar1 = *param_4;
  pbVar4 = param_1 + param_2;
  *param_4 = (u8 *)0x0;
  pbVar9 = param_3;
  if (*param_1 < 0x12) goto LAB_800aa318;
  uVar7 = *param_1 - 0x11;
  pbVar6 = param_1 + 1;
  if (uVar7 < 4) goto LAB_800aa2e8;
  do {
    bVar2 = *pbVar6;
    pbVar6 = pbVar6 + 1;
    uVar7 = uVar7 - 1;
    *pbVar9 = bVar2;
    pbVar9 = pbVar9 + 1;
  } while (uVar7 != 0);
  bVar2 = *pbVar6;
LAB_800aa0c8:
  uVar7 = (u32)bVar2;
  param_1 = pbVar6 + 1;
  if (0xf < uVar7) goto LAB_800aa138;
  pbVar5 = pbVar9 + (u32)*param_1 * -4 + (-0x801 - (u32)(bVar2 >> 2));
  param_1 = pbVar6 + 2;
  if (pbVar5 < param_3) {
LAB_800aa374:
    pbVar5 = pbVar9 + -(s32)param_3;
LAB_800aa378:
    *param_4 = pbVar5;
    return -6;
  }
  pbVar6 = pbVar9 + -(s32)param_3;
  if (param_3 + (s32)pbVar1 + -(s32)pbVar9 < (u8 *)0x3) {
LAB_800aa368:
    *param_4 = pbVar6;
    return -5;
  }
  *pbVar9 = *pbVar5;
  pbVar9[1] = pbVar5[1];
  pbVar9[2] = pbVar5[2];
  pbVar9 = pbVar9 + 3;
LAB_800aa2d8:
  uVar7 = param_1[-2] & 3;
  pbVar6 = param_1;
  if ((param_1[-2] & 3) == 0) {
LAB_800aa318:
    if (pbVar4 <= param_1) {
      *param_4 = pbVar9 + -(s32)param_3;
      return -7;
    }
    uVar7 = (u32)*param_1;
    param_1 = param_1 + 1;
    if (uVar7 < 0x10) goto code_r0x800aa044;
  }
  else {
LAB_800aa2e8:
    do {
      pbVar5 = pbVar6;
      uVar7 = uVar7 - 1;
      *pbVar9 = *pbVar5;
      pbVar9 = pbVar9 + 1;
      pbVar6 = pbVar5 + 1;
    } while (uVar7 != 0);
    uVar7 = (u32)pbVar5[1];
    param_1 = pbVar5 + 2;
    if (pbVar4 <= param_1) goto LAB_800aa318;
  }
LAB_800aa138:
  if (uVar7 < 0x40) {
    if (0x1f < uVar7) {
      uVar8 = uVar7 & 0x1f;
      if (uVar8 == 0) {
        while( true ) {
          pbVar6 = pbVar9 + -(s32)param_3;
          if (pbVar4 == param_1) goto LAB_800aa35c;
          if (*param_1 != 0) break;
          uVar8 = uVar8 + 0xff;
          param_1 = param_1 + 1;
        }
        bVar2 = *param_1;
        param_1 = param_1 + 1;
        uVar8 = uVar8 + 0x1f + (u32)bVar2;
      }
      bVar2 = *param_1;
      pbVar6 = param_1 + 1;
      param_1 = param_1 + 2;
      pbVar6 = pbVar9 + (-1 - ((u32)(bVar2 >> 2) + (u32)*pbVar6 * 0x40));
      goto LAB_800aa294;
    }
    if (0xf < uVar7) {
      uVar8 = uVar7 & 7;
      if (uVar8 == 0) {
        while( true ) {
          pbVar6 = pbVar9 + -(s32)param_3;
          if (pbVar4 == param_1) goto LAB_800aa35c;
          if (*param_1 != 0) break;
          uVar8 = uVar8 + 0xff;
          param_1 = param_1 + 1;
        }
        bVar2 = *param_1;
        param_1 = param_1 + 1;
        uVar8 = uVar8 + 7 + (u32)bVar2;
      }
      bVar2 = *param_1;
      pbVar6 = param_1 + 1;
      param_1 = param_1 + 2;
      if (pbVar9 + ((uVar7 & 8) * -0x800 - ((u32)(bVar2 >> 2) + (u32)*pbVar6 * 0x40)) == pbVar9) {
        *param_4 = pbVar9 + -(s32)param_3;
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
      pbVar6 = pbVar9 + ((uVar7 & 8) * -0x800 - ((u32)(bVar2 >> 2) + (u32)*pbVar6 * 0x40)) +
               -0x4000;
      goto LAB_800aa294;
    }
    pbVar5 = pbVar9 + (u32)*param_1 * -4 + (-1 - (uVar7 >> 2));
    param_1 = param_1 + 1;
    if (pbVar5 < param_3) goto LAB_800aa374;
    pbVar6 = pbVar9 + -(s32)param_3;
    if (param_3 + (s32)pbVar1 + -(s32)pbVar9 < (u8 *)0x2) goto LAB_800aa368;
    *pbVar9 = *pbVar5;
    pbVar9[1] = pbVar5[1];
    pbVar9 = pbVar9 + 2;
  }
  else {
    bVar2 = *param_1;
    param_1 = param_1 + 1;
    uVar8 = (uVar7 >> 5) - 1;
    pbVar6 = pbVar9 + (u32)bVar2 * -8 + (-1 - (uVar7 >> 2 & 7));
LAB_800aa294:
    pbVar5 = pbVar9 + -(s32)param_3;
    if (pbVar6 < param_3) goto LAB_800aa378;
    *pbVar9 = *pbVar6;
    pbVar5 = pbVar6 + 2;
    pbVar9[1] = pbVar6[1];
    pbVar9 = pbVar9 + 2;
    do {
      bVar2 = *pbVar5;
      pbVar5 = pbVar5 + 1;
      uVar8 = uVar8 - 1;
      *pbVar9 = bVar2;
      pbVar9 = pbVar9 + 1;
    } while (uVar8 != 0);
  }
  goto LAB_800aa2d8;
code_r0x800aa044:
  if (uVar7 == 0) {
    do {
      pbVar6 = pbVar9 + -(s32)param_3;
      if (pbVar4 == param_1) {
LAB_800aa35c:
        *param_4 = pbVar6;
        return -4;
      }
      if (*param_1 != 0) goto code_r0x800aa06c;
      uVar7 = uVar7 + 0xff;
      param_1 = param_1 + 1;
    } while( true );
  }
  bVar2 = *param_1;
LAB_800aa080:
  *pbVar9 = bVar2;
  pbVar9[1] = param_1[1];
  pbVar6 = param_1 + 3;
  pbVar9[2] = param_1[2];
  pbVar9 = pbVar9 + 3;
  do {
    bVar2 = *pbVar6;
    pbVar6 = pbVar6 + 1;
    uVar7 = uVar7 - 1;
    *pbVar9 = bVar2;
    pbVar9 = pbVar9 + 1;
  } while (uVar7 != 0);
  bVar2 = *pbVar6;
  goto LAB_800aa0c8;
code_r0x800aa06c:
  bVar2 = *param_1;
  param_1 = param_1 + 1;
  uVar7 = uVar7 + 0xf + (u32)bVar2;
  bVar2 = *param_1;
  goto LAB_800aa080;
}