#include "decompress.h"
#include "unkFuncs.h"
//compession format largely used by text.

//starts with abandoned code. May be related to compession function?

void * ret_a0(void *X){return X;}

int ofunc_sub_800a8ff8(void *x,u32 y) {
  void *pvVar1 = ret_a0(x);
  return (((int)pvVar1 + (y - 1)) / y) * y - (int)pvVar1;
}

bool IsNotZero(u32 X){return X!=0;}

//value stored seperately in .rodata from next 2 funcs.
char * Ofunc_get_1point06(){return "1.06";}

u32 Ofunc_get_0x1060(){return 0x1060;}

char * Ofunc_get_1point06_2(){return "1.06";}

char * ofunc_get_Nov_29_1999(){return "Nov 29 1999";}

char * Ofunc_get_1point06_3(){return "1.06";}

char * ofunc_get_Nov_29_1999_1(){return "Nov 29 1999";}

u32 Ofunc_800a908c(u32 param_1,u8 *param_2,u32 param_3) {
  u8 bVar16;
  u32 uVar17;
  int iVar18;
  int iVar19;
  int iVar20;
  int iVar21;
  int iVar22;
  int iVar23;
  int iVar24;
  int iVar25;
  int iVar26;
  int iVar27;
  int iVar28;
  int iVar29;
  int iVar30;
  int iVar31;
  int iVar32;
  u32 uVar33;
  u32 uVar34;
  
  uVar33 = param_1 & 0xffff;
  param_1 = param_1 >> 0x10;
  if (param_2 == NULL) return 1;
  else {
    uVar17 = param_1 << 0x10;
    if (param_3 != 0) {
      do {
        uVar17 = 0x15b0;
        if (param_3 < 0x15b0) uVar17 = param_3;
        param_3-= uVar17;
        for (; 16 <= (int)uVar17; uVar17-= 0x10) {

          iVar18 = uVar33 + param_2[0];
          iVar19 = iVar18 + param_2[1];
          iVar20 = iVar19 + param_2[2];
          iVar21 = iVar20 + param_2[3];
          iVar22 = iVar21 + param_2[4];
          iVar23 = iVar22 + param_2[5];
          iVar24 = iVar23 + param_2[6];
          iVar25 = iVar24 + param_2[7];
          iVar26 = iVar25 + param_2[8];
          iVar27 = iVar26 + param_2[9];
          iVar28 = iVar27 + param_2[10];
          iVar29 = iVar28 + param_2[11];
          iVar30 = iVar29 + param_2[12];
          iVar31 = iVar30 + param_2[13];
          iVar32 = iVar31 + param_2[14];
          uVar33 = iVar32 + param_2[15];
          param_2+=16;
          param_1+= iVar18 + iVar19 + iVar20 + iVar21 + iVar22 + iVar23 + iVar24 + iVar25
                    + iVar26 + iVar27 + iVar28 + iVar29 + iVar30 + iVar31 + iVar32 + uVar33;
        }
        uVar34 = (u32)((ulonglong)uVar33 * 0x80078071 >> 0x20);
        if (uVar17 != 0) {
          do {
            bVar16 = *param_2;
            param_2++;
            uVar17--;
            uVar33+= bVar16;
            param_1+= uVar33;
          } while (0 < (int)uVar17);
          uVar34 = (u32)((ulonglong)uVar33 * 0x80078071 >> 0x20);
        }
        uVar33 = uVar33 + (uVar34 >> 0xf) * -0xfff1;
        param_1 = param_1 % 0xfff1;
      } while (param_3 != 0);
      uVar17 = param_1 * 0x10000;
    }
    uVar17|= uVar33;
  }
  return uVar17;
}

//strncmp?
int ofunc_800a9250(u8 *param_1,u8 *param_2,int param_3) {

  while (param_3 != 0) {
    u8 bVar1 = *param_1;
    param_1++;
    if (bVar1 - *param_2 != 0) return bVar1 - *param_2;
    param_3--;
    param_2++;
  }
  return 0;
}

//strncpy?
u8 * ofunc_800a9284(u8 *param_1,u8 *param_2,int param_3) {
  u8 uVar1;
  u8 *puVar2;
  
  if ((param_3 != 0) && (param_1 != param_2)) {
    uVar1 = *param_2;
    puVar2 = param_1;
    while( true ) {
      param_2++;
      param_3--;
      *puVar2 = uVar1;
      puVar2++;
      if (param_3 == 0) break;
      uVar1 = *param_2;
    }
    return param_1;
  }
  return param_1;
}

u8 * Ofunc_800a92bc(u8 *param_1,u8 *param_2,int param_3) {
  u8 uVar1;
  u8 *puVar2;
  u8 *puVar3;
  
  if ((param_3 != 0) && (param_1 != param_2)) {
    puVar2 = param_1;
    if (param_2 <= param_1) {
      puVar2 = param_1 + param_3;
      puVar3 = param_2 + param_3;
      do {
        puVar2--;
        puVar3--;
        param_3--;
        *puVar2 = *puVar3;
      } while (param_3 != 0);
      return param_1;
    }
    do {
      uVar1 = *param_2;
      param_2++;
      param_3--;
      *puVar2 = uVar1;
      puVar2++;
    } while (param_3 != 0);
    return param_1;
  }
  return param_1;
}

void memset_unused(u8 *param_1,u8 param_2,int param_3) {
  if (param_3 != 0) {
    do {
      *param_1 = param_2;
      param_3 = param_3 + -1;
      param_1 = param_1 + 1;
    } while (param_3 != 0);
  }
}

u32 ret1(){return 1;}

u32 ret1_800A9350(){return 1;}

bool ofunc_sub_800a9358(void) {
  u8 *puVar1;
  int iVar2;
  s32 *piVar3;
  s32 **puVar4;
  int iVar5;
  s32 *piVar6;
  u8 *puVar7;
  bool bVar8;
  s32 *piVar9;
  s32 iStack_a0;
  u8 auStack_9c [32];
  s32 auStack_7c [7];
  s32 aiStack_5f [3];
  u8 auStack_51 [49];
  s32 aiStack_20 [8];
  
  iVar5 = 0xf;
  puVar1 = auStack_51;
  do {
    *puVar1 = (char)iVar5;
    iVar5--;
    puVar1--;
  } while (-1 < iVar5);
  iVar5 = ofunc_sub_800a8ff8(&iStack_a0,4);
  piVar9 = (s32 *)((int)&iStack_a0 + iVar5);
  iVar2 = (int)piVar9 - (int)&iStack_a0;
  bVar8 = true;
  if (iVar2 < 0) bVar8 = false;
  if (3 < iVar2) bVar8 = false;
  memset_unused((u8 *)aiStack_20,0xff,4);
  if ((u16)aiStack_20[0] != -1) bVar8 = false;
  if (aiStack_20[0] != -1) bVar8 = false;
  if (aiStack_20[0] != -1) bVar8 = false;
  if (aiStack_20[0] != -1) bVar8 = false;
  if (bVar8) {
    iVar2 = 7;
    piVar3 = piVar9;
    piVar6 = piVar9;
    do {
      if (piVar3 != piVar6) bVar8 = false;
      piVar6++;
      iVar2--;
      piVar3++;
    } while (-1 < iVar2);
  }
  memset_unused((u8 *)aiStack_20,0,4);
  if (aiStack_20[0] != 0) {
    bVar8 = false;
  }
  if (aiStack_20[0] != 0) {
    bVar8 = false;
  }
  if (bVar8 == true) {
    iVar2 = 9;
    puVar4 = (s32 **)((int)auStack_7c + iVar5);
    do {
      *puVar4 = piVar9;
      iVar2 = iVar2 + -1;
      puVar4 = puVar4 + -1;
    } while (-1 < iVar2);
    memset_unused(auStack_9c + iVar5,0,32);
    if (*piVar9 != (s32)piVar9) {
      bVar8 = false;
    }
    puVar7 = auStack_9c + iVar5;
    iVar2 = 7;
    do {
      if (*(int *)puVar7 != 0) {
        bVar8 = false;
      }
      iVar2 = iVar2 + -1;
      puVar7 = puVar7 + 4;
    } while (-1 < iVar2);
    if (*(s32 **)((int)auStack_7c + iVar5) != piVar9) {
      bVar8 = false;
    }
    if (bVar8 == true) {
      iVar5 = ofunc_sub_800a8ff8(aiStack_5f,4);
      piVar9 = (s32 *)((int)aiStack_5f + iVar5);
      if (((u32)piVar9 & 3)) bVar8 = false;
      if (iVar5 == -1) bVar8 = false;
      if (piVar9 < aiStack_5f) bVar8 = false;
      if (4 < iVar5 + 1U) bVar8 = false;
      if (aiStack_5f + 1 <= piVar9) bVar8 = false;
      if (bVar8 == true) {
        if (*piVar9 == 0) bVar8 = false;
        if (*(int *)((int)aiStack_5f + iVar5 + 4) == 0) {
          bVar8 = false;
        }
      }
    }
  }
  return bVar8;
}


u32* PTR_800f5650;
u32  DAT_800f3590=3;
u32  DAT_800f3594=1;
const u32 DAT_800e364c=1;
const u32 DAT_800e3650=2;
const u32 DAT_800e3654=0;

s32 ofunc_sub_800a95b0(void) {
  u32 uVar1;
  u32 uVar3;
  u32 uVar4;
  s32 sVar5;
  u8 *puVar6;
  bool bVar7;
  int iVar8;
  u32 uVar9;
  u32 **ppuVar10;
  ulonglong uVar11;
  u8 auStack_41 [65];
  
  uVar3 = ret1();
  uVar4 = ret1_800A9350();
  if ((uVar3 & 1 & uVar4) == 1) {
    iVar8 = 0xf;
    puVar6 = auStack_41;
    do {
      *puVar6 = (char)iVar8;
      iVar8 = iVar8 + -1;
      puVar6 = puVar6 + -1;
    } while (-1 < iVar8);
    uVar11 = 1;
    if (true) {
      uVar1 = DAT_800f3590;
      if (ret_some_bool()) {
        uVar11 = 0;
      }
      if (uVar11 == 1) {
        uVar9 = 0;
        if (DAT_800f3590 != 0) {
          ppuVar10 = &PTR_800f5650;
          do {
            *ppuVar10 = (u32 *)(uVar9 - 3);
            uVar9 = uVar9 + 1;
            ppuVar10 = ppuVar10 + 1;
          } while (uVar9 < uVar1);
        }
        if (ofunc_sub_800a96e0((int *)&PTR_800f5650)) {
          uVar11 = 0;
        }
        if (uVar11 == 1) {
          uVar11 = ofunc_sub_800a9358() & 1;
        }
      }
    }
    sVar5 = 0;
    if (uVar11 != 1) sVar5 = -1;
  }
  else sVar5 = -1;
  return sVar5;
}

bool ret_some_bool(){return DAT_800e364c == 0;}

bool ofunc_sub_800a96e0(int *param_1) {
  if (*param_1 == -3) {
    if (param_1[1] != -2) return true;
    if (param_1[2] == -1) return false;
  }
  return true;
}


s32 Ofunc_800a971c(s32 param_1,s32 param_2,s32 param_3,s32 param_4,int param_5,int param_6,
                  int param_7,int param_8,int param_9,int param_10) {
  bool bVar1;
  s32 sVar2;
  
  DAT_800f3594 = 1;
  if (param_1 == 0) sVar2 = -1;
  else {
    bVar1 = false;
    if ((((((param_2 == -1) || (param_2 == 2)) && ((param_3 == -1 || (param_3 == 4)))) &&
         ((param_4 == -1 || (param_4 == 4)))) && ((param_5 == -1 || (param_5 == 4)))) &&
       (((((param_6 == -1 || (param_6 == 4)) && ((param_7 == -1 || (param_7 == 4)))) &&
         ((param_8 == -1 || (param_8 == 4)))) &&
        (((param_9 == -1 || (param_9 == 4)) && ((param_10 == -1 || (param_10 == 4)))))))) {
      bVar1 = true;
    }
    sVar2 = -1;
    if ((bVar1) && (!ofunc_sub_800a95b0())) {
      sVar2 = 0;
    }
  }
  return sVar2;
}


u8 * ofunc_sub_800a981c(u8 *param_1,int param_2,u8 *param_3,u8 **param_4,int param_5) {
  bool bVar1;
  char cVar2;
  u8 bVar4;
  int iVar3;
  u32 uVar5;
  u8 *pbVar6;
  u8 *puVar7;
  u8 *pbVar8;
  u8 *pbVar9;
  u32 uVar10;
  u32 uVar11;
  u8 *puVar12;
  u8 *pbVar13;
  
  pbVar9 = param_1 + 4;
  pbVar13 = param_1 + param_2;
  puVar12 = param_1;
  puVar7 = param_3;
LAB_800a9a88:
  bVar4 = pbVar9[3];
  pbVar8 = pbVar9;
  do {
    uVar11 = ((((u32)bVar4 << 6 ^ (u32)pbVar8[2]) << 5 ^ (u32)pbVar8[1]) << 5 ^ (u32)*pbVar8) *
             0x21 >> 5;
    uVar5 = uVar11 & 0x3fff;
    pbVar6 = *(u8 **)(uVar5 * 4 + param_5);
    iVar3 = uVar5 << 2;
    if (((pbVar6 < param_1) || (uVar10 = (int)pbVar8 - (int)pbVar6, uVar10 == 0)) ||
       (iVar3 = uVar5 << 2, 0xbfff < uVar10)) goto LAB_800a9b84;
    bVar1 = uVar10 < 0x801;
    if (bVar1) {
      bVar4 = *pbVar6;
LAB_800a9b54:
      iVar3 = uVar5 << 2;
      if ((bVar4 == *pbVar8) && (iVar3 = uVar5 << 2, pbVar6[1] == pbVar8[1])) {
        if (pbVar6[2] == pbVar8[2]) break;
LAB_800a9b80:
        iVar3 = uVar5 << 2;
      }
    }
    else {
      if (pbVar6[3] == bVar4) {
LAB_800a9b50:
        bVar4 = *pbVar6;
        goto LAB_800a9b54;
      }
      uVar5 = uVar11 & 0x7ff ^ 0x201f;
      pbVar6 = *(u8 **)(uVar5 * 4 + param_5);
      iVar3 = uVar5 << 2;
      if (param_1 <= pbVar6) {
        uVar10 = (int)pbVar8 - (int)pbVar6;
        if (uVar10 != 0) {
          iVar3 = uVar5 << 2;
          if ((uVar10 < 0xc000) &&
             ((bVar1 = uVar10 < 0x801, bVar1 || (iVar3 = uVar5 << 2, pbVar6[3] == bVar4))))
          goto LAB_800a9b50;
          goto LAB_800a9b84;
        }
        goto LAB_800a9b80;
      }
    }
LAB_800a9b84:
    *(u8 **)(iVar3 + param_5) = pbVar8;
    pbVar9 = puVar12;
    if (pbVar13 + -0xd <= pbVar8 + 1) goto LAB_800a9b9c;
    bVar4 = pbVar8[4];
    pbVar8 = pbVar8 + 1;
  } while( true );
  *(u8 **)(uVar5 * 4 + param_5) = pbVar8;
  uVar5 = (int)pbVar8 - (int)puVar12;
  if (0 < (int)uVar5) {
    if (uVar5 < 4) {
      puVar7[-2] = puVar7[-2] | (u8)uVar5;
    }
    else {
      if (uVar5 < 0x13) {
        *puVar7 = (u8)uVar5 - 3;
      }
      else {
        uVar11 = uVar5 - 0x12;
        while( true ) {
          *puVar7 = 0;
          puVar7 = puVar7 + 1;
          if (uVar11 < 0x100) break;
          uVar11 = uVar11 - 0xff;
        }
        *puVar7 = (u8)uVar11;
      }
      puVar7 = puVar7 + 1;
    }
    do {
      bVar4 = *puVar12;
      puVar12 = puVar12 + 1;
      uVar5 = uVar5 - 1;
      *puVar7 = bVar4;
      puVar7 = puVar7 + 1;
    } while (uVar5 != 0);
  }
  pbVar9 = pbVar8 + 4;
  if (((((pbVar6[3] == pbVar8[3]) && (bVar4 = *pbVar9, pbVar9 = pbVar8 + 5, pbVar6[4] == bVar4)) &&
       (bVar4 = *pbVar9, pbVar9 = pbVar8 + 6, pbVar6[5] == bVar4)) &&
      ((bVar4 = *pbVar9, pbVar9 = pbVar8 + 7, pbVar6[6] == bVar4 &&
       (bVar4 = *pbVar9, pbVar9 = pbVar8 + 8, pbVar6[7] == bVar4)))) &&
     (bVar4 = *pbVar9, pbVar9 = pbVar8 + 9, pbVar6[8] == bVar4)) {
    pbVar8 = pbVar6 + 9;
    if ((pbVar9 < pbVar13) && (pbVar6[9] == *pbVar9)) {
      do {
        pbVar9 = pbVar9 + 1;
        pbVar8 = pbVar8 + 1;
        if (pbVar13 <= pbVar9) break;
      } while (*pbVar8 == *pbVar9);
    }
    uVar5 = (int)pbVar9 - (int)puVar12;
    if (uVar10 < 0x4001) {
      uVar10 = uVar10 - 1;
      if (uVar5 < 0x22) {
        *puVar7 = (char)uVar5 - 2U | 0x20;
      }
      else {
        uVar5 = uVar5 - 0x21;
        bVar4 = 0x20;
LAB_800a9a40:
        *puVar7 = bVar4;
        for (; puVar7 = puVar7 + 1, 0xff < uVar5; uVar5 = uVar5 - 0xff) {
          *puVar7 = 0;
        }
        *puVar7 = (u8)uVar5;
      }
    }
    else {
      uVar10 = uVar10 - 0x4000;
      if (9 < uVar5) {
        uVar5 = uVar5 - 9;
        bVar4 = (u8)((uVar10 & 0x4000) >> 0xb) | 0x10;
        goto LAB_800a9a40;
      }
      *puVar7 = (u8)((uVar10 & 0x4000) >> 0xb) | (char)uVar5 - 2U | 0x10;
    }
  }
  else {
    pbVar9 = pbVar9 + -1;
    cVar2 = (char)pbVar9 - (char)puVar12;
    if (bVar1) {
      *puVar7 = (cVar2 + -1) * ' ' | (u8)((uVar10 - 1 & 7) << 2);
      pbVar8 = puVar7 + 1;
      bVar4 = (u8)(uVar10 - 1 >> 3);
      goto LAB_800a9a74;
    }
    bVar4 = cVar2 - 2;
    if (uVar10 < 0x4001) {
      uVar10 = uVar10 - 1;
      *puVar7 = bVar4 | 0x20;
    }
    else {
      uVar10 = uVar10 - 0x4000;
      *puVar7 = (u8)((uVar10 & 0x4000) >> 0xb) | bVar4 | 0x10;
    }
  }
  puVar7[1] = (u8)(uVar10 << 2);
  pbVar8 = puVar7 + 2;
  bVar4 = (u8)(uVar10 >> 6);
LAB_800a9a74:
  *pbVar8 = bVar4;
  puVar7 = pbVar8 + 1;
  puVar12 = pbVar9;
  if (pbVar13 + -0xd <= pbVar9) {
LAB_800a9b9c:
    *param_4 = puVar7 + -(int)param_3;
    return pbVar13 + -(int)pbVar9;
  }
  goto LAB_800a9a88;
}

u32 Ofunc_800a9bb8(u8 *param_1,u8 *param_2,u8 *param_3,u8 **param_4,u32 param_5) {
  u8 bVar1;
  u8 *pbVar2;
  u8 *pbVar3;
  u8 *pbVar4;
  u8 *pbVar5;
  
  pbVar5 = param_2;
  pbVar2 = param_3;
  if ((u8 *)0xd < param_2) {
    pbVar5 = ofunc_sub_800a981c(param_1,(int)param_2,param_3,param_4,param_5);
    pbVar2 = param_3 + (int)*param_4;
  }
  if (pbVar5 == NULL) goto LAB_800a9ca8;
  pbVar3 = param_1 + (int)param_2 + -(int)pbVar5;
  bVar1 = (u8)pbVar5;
  if ((pbVar2 == param_3) && (pbVar5 < (u8 *)0xef)) {
    *pbVar2 = bVar1 + 0x11;
LAB_800a9c8c:
    pbVar2 = pbVar2 + 1;
  }
  else {
    if ((u8 *)0x3 < pbVar5) {
      if (pbVar5 < (u8 *)0x13) {
        *pbVar2 = bVar1 - 3;
      }
      else {
        pbVar4 = pbVar5 + -0x12;
        while( true ) {
          *pbVar2 = 0;
          pbVar2 = pbVar2 + 1;
          if (pbVar4 < (u8 *)0x100) break;
          pbVar4 = pbVar4 + -0xff;
        }
        *pbVar2 = (u8)pbVar4;
      }
      goto LAB_800a9c8c;
    }
    pbVar2[-2] = pbVar2[-2] | bVar1;
  }
  do {
    bVar1 = *pbVar3;
    pbVar3++;
    pbVar5--;
    *pbVar2 = bVar1;
    pbVar2++;
  } while (pbVar5 != NULL);
LAB_800a9ca8:
  *pbVar2 = 0x11;
  pbVar2[1] = 0;
  pbVar2[2] = 0;
  *param_4 = pbVar2 + (3 - (int)param_3);
  return 0;
}

//the above could be cut out for ports and recomps.

s32 decompress_LZ01(u8 *compDat,u32 compSize,u8 *OutDat,u32 *OutSize){
  u8 bVar1;
  s32 sVar2;
  u8 *pbVar3;
  u8 *pbVar4;
  u8 *pbVar5;
  u32 uVar6;
  int iVar7;
  u32 uVar8;
  u8 *pbVar9;
  
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
  uVar6 = (u32)bVar1;
  pbVar5 = compDat + 1;
  if (0xf < uVar6) goto LAB_800a9e0c;
  compDat = compDat + 2;
  pbVar4 = pbVar9 + (u32)*pbVar5 * -4 + (-0x801 - (u32)(bVar1 >> 2)) + 1;
  *pbVar9 = pbVar9[(u32)*pbVar5 * -4 + (-0x801 - (u32)(bVar1 >> 2))];
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
    uVar6 = (u32)bVar1;
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
    uVar6 = (u32)pbVar5[1];
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
        uVar8 = iVar7 + 7 + (u32)bVar1;
      }
      compDat = pbVar5 + 2;
      if (pbVar9 + ((uVar6 & 8) * -0x800 - ((u32)(*pbVar5 >> 2) + (u32)pbVar5[1] * 0x40)) ==
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
      pbVar5 = pbVar9 + ((uVar6 & 8) * -0x800 - ((u32)(*pbVar5 >> 2) + (u32)pbVar5[1] * 0x40)) +
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
        uVar8 = iVar7 + 0x1f + (u32)bVar1;
      }
      compDat = pbVar5 + 2;
      pbVar5 = pbVar9 + (-1 - ((u32)(*pbVar5 >> 2) + (u32)pbVar5[1] * 0x40));
    }
  }
  else {
    compDat = pbVar5 + 1;
    uVar8 = (uVar6 >> 5) - 1;
    pbVar5 = pbVar9 + (u32)*pbVar5 * -8 + (-1 - (uVar6 >> 2 & 7));
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
  pbVar4 = pbVar9 + (u32)*pbVar5 * -4 + (-1 - (uVar6 >> 2));
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
    uVar6 = iVar7 + 0xf + (u32)bVar1;
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


s32 LZ01_func_2(u8 *param_1,int param_2,u8 *param_3,u8 **param_4){
  u8 *pbVar1;
  u8 bVar2;
  s32 sVar3;
  u8 *pbVar4;
  u8 *pbVar5;
  u8 *pbVar6;
  u32 uVar7;
  int iVar8;
  u32 uVar9;
  u8 *pbVar10;
  
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
  uVar7 = (u32)bVar2;
  param_1 = pbVar6 + 1;
  if (0xf < uVar7) goto LAB_800aa138;
  pbVar5 = pbVar10 + (u32)*param_1 * -4 + (-0x801 - (u32)(bVar2 >> 2));
  param_1 = pbVar6 + 2;
  if (pbVar5 < param_3) {
LAB_800aa374:
    pbVar5 = pbVar10 + -(int)param_3;
LAB_800aa378:
    *param_4 = pbVar5;
    return -6;
  }
  pbVar6 = pbVar10 + -(int)param_3;
  if ((u32)((int)(param_3 + (int)pbVar1) - (int)pbVar10) < 3) {
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
    uVar7 = (u32)*param_1;
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
    uVar7 = (u32)pbVar5[1];
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
        uVar9 = iVar8 + 0x1f + (u32)bVar2;
      }
      bVar2 = *param_1;
      pbVar6 = param_1 + 1;
      param_1 = param_1 + 2;
      pbVar6 = pbVar10 + (-1 - ((u32)(bVar2 >> 2) + (u32)*pbVar6 * 0x40));
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
        uVar9 = iVar8 + 7 + (u32)bVar2;
      }
      bVar2 = *param_1;
      pbVar6 = param_1 + 1;
      param_1 = param_1 + 2;
      if (pbVar10 + ((uVar7 & 8) * -0x800 - ((u32)(bVar2 >> 2) + (u32)*pbVar6 * 0x40)) == pbVar10)
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
      pbVar6 = pbVar10 + ((uVar7 & 8) * -0x800 - ((u32)(bVar2 >> 2) + (u32)*pbVar6 * 0x40)) +
               -0x4000;
      goto LAB_800aa294;
    }
    pbVar5 = pbVar10 + (u32)*param_1 * -4 + (-1 - (uVar7 >> 2));
    param_1 = param_1 + 1;
    if (pbVar5 < param_3) goto LAB_800aa374;
    pbVar6 = pbVar10 + -(int)param_3;
    if ((u32)((int)(param_3 + (int)pbVar1) - (int)pbVar10) < 2) goto LAB_800aa368;
    *pbVar10 = *pbVar5;
    pbVar10[1] = pbVar5[1];
    pbVar10 = pbVar10 + 2;
  }
  else {
    bVar2 = *param_1;
    param_1 = param_1 + 1;
    uVar9 = (uVar7 >> 5) - 1;
    pbVar6 = pbVar10 + (u32)bVar2 * -8 + (-1 - (uVar7 >> 2 & 7));
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
  uVar7 = iVar8 + 0xf + (u32)bVar2;
  bVar2 = *param_1;
  goto LAB_800aa080;
}

