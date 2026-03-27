#include "combat/substructA.h"

void FUN_800718f0(CombatSubstructA *param_1,u8 param_2,u8 *param_3,u8 *param_4) {
  s8 s8_ARRAY_800dfd60[]={0,1,1,1,0,-1,-1,-1};
  s8 s8_ARRAY_800dfd68[]={-1,-1,0,1,1,1,0,-1};
  *param_3 += s8_ARRAY_800dfd60[param_2];
  *param_4 += s8_ARRAY_800dfd68[param_2];
}


s32 FUN_80071974(CombatSubstructA *param_1,s8 param_2,s8 param_3,s16 param_4,u8 *param_5) {
  u8 *puVar1;
  bool bVar2;
  s16 iVar3;
  u8 *puVar4;
  s16 iVar5;
  u8 *puVar6;
  s16 iVar7,iVar8,iVar9;
  u8 bVar10;
  u8 uStack_38;
  u8 auStack_37 [3];
  int iStack_34;
  u8 *puStack_30;
  
  iVar8 = (int)param_4;
  iVar7 = 0;
  if (0 < iVar8 + -1) {
    puStack_30 = auStack_37;
    do {
      bVar2 = false;
      bVar10 = 0;
      iVar9 = iVar8 + -1;
      iStack_34 = iVar7 << 1;
      do {
        uStack_38 = param_2;
        auStack_37[0] = param_3;
        FUN_800718f0(param_1,bVar10,&uStack_38,(u8*)puStack_30);
        iVar3 = (int)(short)iVar9;
        if (iVar7 < iVar3) {
          iVar5 = iVar7 * 0x10000;
LAB_80071a28:
          if ((param_5[iVar3 * 2] != uStack_38) || ((param_5 + iVar3 * 2)[1] != auStack_37[0]))
          goto LAB_80071abc;
          iVar9 = (iVar3 - iVar7);
          iVar8 = (iVar8 - iVar9);
          if (iVar7 < iVar8) {
            puVar6 = param_5 + iVar7 * 2 + iVar9 * 2;
            puVar4 = param_5 + iVar7 * 2;
            do {
              iVar5++;
              *puVar4 = *puVar6;
              puVar1++;
              puVar6+=2;
              puVar4[1] = *puVar1;
              puVar4+=2;
            } while (iVar5 < iVar8);
          }
          bVar2 = true;
          iVar9 = iVar8 + -1;
        }
LAB_80071ad0:
        bVar10++;
      } while ((!bVar2) && (bVar10 < 8));
      iVar7++;
      param_2 = param_5[iStack_34];
      param_3 = (param_5 + iStack_34)[1];
    } while (iVar7 < iVar9);
  }
  return iVar8;
LAB_80071abc:
  iVar3--;
  if (iVar3 <= iVar7) goto LAB_80071ad0;
  goto LAB_80071a28;
}

int FUN_80071b3c(CombatSubstructA *param_1,s8 param_2,s8 param_3,s16 param_4,u8 *param_5)
{
  u8 *puVar1;
  u8 x1;
  u8 y1;
  s16 iVar2;
  u32 uVar3;
  u32 uVar4;
  s16 iVar5;
  u8 *puVar6;
  int iVar7;
  u8 *pbVar8;
  u8 *puVar9;
  s16 iVar10;
  
  iVar10 = 0;
  iVar2 = FUN_80071974(param_1,param_2,param_3,param_4,param_5);
  if (0 < iVar2 + -1) {
    do {
      iVar7 = iVar10 * 2;
      x1 = param_5[iVar7];
      y1 = (param_5 + iVar7)[1];
      uVar3 = FUN_800720f8(param_1,param_2,param_3,x1,y1);
      iVar5 = iVar10;
      while (iVar5 < iVar2 + -1) {
        uVar4 = FUN_800720f8(param_1,x1,y1,param_5[iVar5 * 2 + 2],param_5[iVar5 * 2 + 3]);
        if (uVar3 != uVar4) break;
        iVar5++;
        pbVar8 = param_5 + iVar5 * 2;
        uVar3 = FUN_800720f8(param_1,x1,y1,*pbVar8,pbVar8[1]);
        x1 = *pbVar8;
        y1 = pbVar8[1];
      }
      iVar2 = (iVar2 + (iVar10 - iVar5));
      if (iVar10 < iVar2) {
        puVar6 = param_5 + iVar5 * 2;
        iVar5 = iVar10;
        puVar9 = param_5 + iVar10 * 2;
        do {
          iVar5++;
          *puVar9 = *puVar6;
          puVar1 = puVar6 + 1;
          puVar6 = puVar6 + 2;
          puVar9[1] = *puVar1;
          puVar9 = puVar9 + 2;
        } while (iVar5 < iVar2);
      }
      iVar10++;
      param_2 = param_5[iVar7];
      param_3 = (param_5 + iVar7)[1];
    } while (iVar10 < iVar2 + -1);
  }
  return iVar2;
}


bool FUN_80071d2c(CombatSubstructA *param_1,u8 param_2,u8 param_3,u8 param_4,u8 param_5,
                 s16 *param_6,u8 param_7) {
  u32 uVar3;
  bool bVar4;
  s8 bStack_30 [2];
  
  bVar4 = true;
  uVar3 = 0;
  do {
    bStack_30[0] = param_2;
    bStack_30[1] = param_3;
    FUN_800718f0(param_1,(u8)uVar3,(u8*)&bStack_30[0],(u8*)&bStack_30[1]);
    *param_6 = -1;
    if (((FUN_80070fa0(param_1,bStack_30[0],bStack_30[1],param_7)) &&
        (param_1->array2[bStack_30[0]][bStack_30[1]] == 0)
        ) && (FUN_8007102c(param_1,param_2,param_3,bStack_30[0],bStack_30[1]))) {
      bVar4 = false;
      *param_6 = sub_square_add_(bStack_30[0],bStack_30[1],param_4,param_5);
      param_6[1] = (s16)uVar3;
    }
    uVar3++;
    param_6+= 2;
  } while (uVar3 < 8);
  return bVar4;
}

u32 FUN_80071e84(CombatSubstructA *param_1,u16 *param_2) {
  u32 uVar1;
  u16 uVar2;
  u16 *puVar3;
  u32 uVar4;
  
  uVar4 = 0;
  uVar2 = *param_2;
  uVar1 = 1;
  puVar3 = param_2 + 2;
  do {
    if (*puVar3 < uVar2) {
      uVar2 = *puVar3;
      uVar4 = uVar1;
    }
    uVar1++;
    puVar3+= 2;
  } while (uVar1 < 8);
  return uVar4;
}

u32 FUN_80071ec4(CombatSubstructA *param_1,u8 param_2,u8 param_3,u8 param_4,u8 param_5,
                 u8 param_6,u8 *param_7) {
  u8 bVar1;
  s16 i;
  u16 abStack_6d [8] [2];
  s8 uStack_30 [2];
  
  i = 0;
  uStack_30[0] = param_2;
  uStack_30[1] = param_3;
  for(i=0;i<param_1->byteA;i++){
    memset(param_1->array2[i],0,param_1->byteB);
  }
  FUN_800714d0(param_1,param_2,param_3,param_6);
  FUN_800714d0(param_1,param_4,param_5,param_6);
  i = 0;
  do {
    if (uStack_30[0] == param_4) {
      if (uStack_30[1] == param_5) {
LAB_80072088:
        FUN_800715d8(param_1);
        if (i != (u8)param_1->byteE) {
          if (i == 0) i = 0;
          else i = FUN_80071b3c(param_1,param_2,param_3,i,param_7);
        }
        return i;
      }
    }
    if (param_1->byteE <= i) goto LAB_80072088;
    if (FUN_80071d2c(param_1,uStack_30[0],uStack_30[1],param_4,param_5,(s16 *)abStack_6d,
                         param_6)) {
      if (i == 0) i = (u32)(u8)param_1->byteE;
      else i--;
    }
    else {
      u32 uVar2 = FUN_80071e84(param_1,abStack_6d[0]);
      FUN_800718f0(param_1,(u8)abStack_6d[uVar2][1],(u8*)&uStack_30[0],(u8*)&uStack_30[1]);
      param_7[i+1] = uStack_30[1];
      param_7[i] = uStack_30[0];
      param_1->array2[uStack_30[0]][uStack_30[1]] = 1;
      i++;
    }
  } while( true );
}


u32 FUN_800720f8(CombatSubstructA *param_1,u8 x0,u8 y0,u8 x1,u8 y1) {
  u32 ret = 0;
  if (x0 < x1) {
    ret = 3;
    if ((y1 <= y0) && (ret = 2, y1 < y0)) {
      ret = 1;
    }
  }
  else if (x1 < x0) {
    ret = 5;
    if ((y1 <= y0) && (ret = 6, y1 < y0)) {
      ret = 7;
    }
  }
  else if (y1 > y0) {
    ret = 4;
  }
  return ret;
}

void Ofunc_8007216c(void *param_1,u8 *param_2,u8 *param_3,u8 param_4,u8 param_5) {
  s8 cVar1;
  u8 bVar2;
  u8 bVar3;
  
  bVar2 = *param_2;
  bVar3 = *param_3;
  if (bVar2 < param_4) cVar1 = 1;
  else {
    cVar1 = -1;
    if (bVar2 <= param_4) goto LAB_8007219c;
  }
  bVar2 = bVar2 + cVar1;
LAB_8007219c:
  cVar1 = 1;
  if ((bVar3 < param_5) || (cVar1 = -1, param_5 < bVar3)) {
    bVar3 = bVar3 + cVar1;
  }
  *param_2 = bVar2;
  *param_3 = bVar3;
  return;
}

