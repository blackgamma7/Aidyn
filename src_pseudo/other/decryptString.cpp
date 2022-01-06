//I would REALLY apprecaite help making sense of these bits.
const u8 stringKey[16]=
{0x5f,0x35,0x3a,0x2c,0x2a,0x2c,0x5f,0x36,0x2c,0x5f,0x33,0x30,0x2d,0x3b,0x5e,0x7f};

u8 decrypt_sub_a(char arg0,char arg1){return (arg1 >> 7) + arg0 ^ 0x80;}
u8 decrypt_sub_b(char arg0,char arg1){return arg1 - arg0 ^ 2;}

void decrypt_func_a(u8 *key,char arg1,char arg2){
  u8 bVar2;
  u8 bVar3;
  s32 iVar1;
  u8 bVar4;
  s32 iVar5;
  
  bVar2 = decrypt_sub_a(arg1,arg2);
  bVar3 = decrypt_sub_b(arg1,arg2);
  iVar1 = 0;
  iVar5 = 0x10000;
  do {
    iVar1 = (iVar1 % 2) * 0x10000 >> 0x10;
    if (iVar1 == 0) {
      bVar4 = bVar3 ^ bVar2 + *key;
LAB_800d56b0:
      *key = bVar4;
    }
    else {
      if (iVar1 == 1) {
        bVar4 = bVar2 ^ *key - bVar3;
        goto LAB_800d56b0;
      }
    }
    iVar1 = iVar5 >> 0x10;
    key++;
    iVar5+= 0x10000;
    if (0xf < iVar1) {
      return;
    }
  } while( true );
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
  s32 iVar4;
  u8 *pbVar5;
  u8 bVar6;
  s32 iVar7;
  u8 *pbVar8;
  
  iVar4 = arg2 * 0x10000 + -0x10000 >> 0x10;
  iVar7 = 0;
  if (iVar4 != -1) {
    iVar4 = iVar4 * 0x10000;
    do {
      iVar4 = iVar4 + -0x10000;
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
      *arg0 = bVar6 - arg1[(iVar7 + (iVar2 >> 4) * -0x10) * 0x10000 >> 0x10];
      arg0++;
      *pbVar5 = bVar1 ^ *pbVar5;
      bVar1 = (u8)iVar7;
      iVar7 = iVar3 * 0x10000 >> 0x10;
      *pbVar8 = *pbVar8 ^ bVar1;
    } while (iVar4 >> 0x10 != -1);
  }
  return;
}


u8 * Ofunc_decrypt(u8 *arg0,u8 arg1,char arg2,s16 arg3){
  u32 uVar2;
  u8 uStack80 [16];
  uStack80= stringKey;
  for(uVar2 = 0;uVar2 < 0x10;uVar2++) uStack80[uVar2]^=0x7f;
  decrypt_func_a(uStack80,arg1,arg2);
  decrypt_ofunc_2(arg0,uStack80,(s32)arg3);
  return arg0;
}

char * decrypt_string(u8 *arg0,u8 arg1,char arg2,s16 arg3){
  u32 uVar2;
  u8 uStack80 [16];
  uStack80= stringKey;
  for(uVar2 = 0;uVar2 < 0x10;uVar2++) uStack80[uVar2]^=0x7f;
  decrypt_func_a(uStack80,arg1,arg2);
  decrypt_func_b(arg0,uStack80,(s32)arg3);
  return (char*)arg0;
}
