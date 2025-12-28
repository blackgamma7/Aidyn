#include "stringDecrypt.h"

//I would REALLY apprecaite help making sense of these bits.

#define stringKey {0x5f,0x35,0x3a,0x2c,0x2a,0x2c,0x5f,0x36,0x2c,0x5f,0x33,0x30,0x2d,0x3b,0x5e,0x7f};

u8 decrypt_sub_a(u8 arg0,u16 arg1){return (arg1 >> 7) + arg0 ^ 0x80;}
u8 decrypt_sub_b(u8 arg0,u8 arg1){return arg1 - arg0 ^ 2;}

void decrypt_func_a(u8 *key,u8 arg1,u16 arg2){
  u8 bVar2;
  u8 bVar3;
  u8 bVar4;
  
  bVar2 = decrypt_sub_a(arg1,arg2);
  bVar3 = decrypt_sub_b(arg1,arg2);
  for(s16 iVar1=0;iVar1<14;iVar1++) {
    switch ((iVar1 % 2)){
    case 0:
    bVar4 = bVar3 ^ bVar2 + key[iVar1];
      break;
    case 1:
    bVar4 = bVar2 ^ key[iVar1] - bVar3;
      break;
    }
    key[iVar1] = bVar4;
  }
}

void decrypt_ofunc_2(u8 *arg0,u8 *arg1,s32 arg2){
  u8 bVar1;
  s32 iVar2;
  u8 bVar3;
  u8 *pbVar4;
  s32 iVar5;
  s32 iVar6;
  u8 *pbVar7;
  s32 iVar8;
  s32 iVar9;
  
  iVar9 = 0;
  iVar6 = arg2 * 0x10000 + -0x10000 >> 0x10;
  if (iVar6 != -1) {
    iVar6 = iVar6 * 0x10000;
    do {
      iVar6 = iVar6 + -0x10000;
      iVar2 = iVar9;
      if (iVar9 < 0) {iVar2 = iVar9 + 0xf;}
      iVar8 = iVar9 + 1;
      bVar3 = *arg0;
      bVar1 = arg1[(iVar9 + (iVar2 >> 4) * -0x10) * 0x10000 >> 0x10];
      *arg0 = bVar3 + bVar1;
      iVar2 = iVar8;
      if (iVar8 < 0) {iVar2 = iVar9 + 0x10;}
      pbVar7 = arg1 + iVar8 + (iVar2 >> 4) * -0x10;
      iVar5 = iVar9 + 2;
      bVar3 = (bVar3 + bVar1) - *pbVar7;
      *arg0 = bVar3;
      iVar2 = iVar5;
      if (iVar5 < 0) {iVar2 = iVar9 + 0x11;}
      pbVar4 = arg1 + iVar5 + (iVar2 >> 4) * -0x10;
      bVar3 = bVar3 ^ *pbVar4;
      *arg0 = bVar3;
      arg0++;
      *pbVar7 = *pbVar7 ^ bVar3;
      bVar3 = (u8)iVar9;
      iVar9 = iVar8 * 0x10000 >> 0x10;
      *pbVar4 = *pbVar4 ^ bVar3;
    } while (iVar6 >> 0x10 != -1);
  }
  return;
}

void decrypt_func_b(u8 *arg0,u8 *arg1,s32 arg2){
  u8 bVar1;
  s32 iVar2;
  s32 iVar3;
  s16 iVar4;
  u8 *pbVar5;
  u8 bVar6;
  s16 iVar7;
  u8 *pbVar8;
  
  iVar4 = arg2 * 0x10000 + -0x10000 >> 0x10;
  iVar7 = 0;
  if (iVar4 != -1) {
    do {
      iVar4--;
      iVar3 = iVar7 + 2;
      bVar1 = *arg0;
      iVar2 = iVar3;
      if (iVar3 < 0) {
        iVar2 = iVar7 + 0x11;
      }
      pbVar8 = arg1 + iVar3 + (iVar2 >> 4) * -0x10;
      iVar3 = iVar7 + 1;
      bVar6 = bVar1 ^ *pbVar8;
      *arg0 = bVar6;
      iVar2 = iVar3;
      if (iVar3 < 0) {
        iVar2 = iVar7 + 0x10;
      }
      pbVar5 = arg1 + iVar3 + (iVar2 >> 4) * -0x10;
      bVar6 = bVar6 + *pbVar5;
      *arg0 = bVar6;
      iVar2 = iVar7;
      if (iVar7 < 0) {
        iVar2 = iVar7 + 0xf;
      }
      *arg0 = bVar6 - arg1[(iVar7 + (iVar2 >> 4) * -0x10) ];
      arg0++;
      *pbVar5 = bVar1 ^ *pbVar5;
      bVar1 = (u8)iVar7;
      iVar7 = iVar3 ;
      *pbVar8 = *pbVar8 ^ bVar1;
    } while (iVar4 != -1);
  }
  return;
}


u8 * Ofunc_decrypt(u8 *arg0,u8 arg1,char arg2,s16 arg3){
  u8 key[]= stringKey;
  for(u8 i = 0;i < 0x10;i++) key[i]^=0x7f;
  decrypt_func_a(key,arg1,arg2);
  decrypt_ofunc_2(arg0,key,(s32)arg3);
  return arg0;
}

char * decrypt_string(char *str,u8 arg1,u16 arg2,s16 arg3){
  u8 key[]= stringKey;
  for(u8 i = 0;i < 0x10;i++) key[i]^=0x7f;
  decrypt_func_a(key,arg1,arg2);
  decrypt_func_b((u8*)str,key,(s32)arg3);
  return str;
}
