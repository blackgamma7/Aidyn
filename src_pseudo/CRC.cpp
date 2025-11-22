#include "CRC.h"
#include "crash.h"

namespace CRC{
u32 CalculateCheckSum32(void *dat,u32 size){
  u32 uVar1;
  u32 uVar2;
  int iVar3;
  u32 uVar4;
  
  uVar4 = 0;
  if (!dat) CRASH("A null pointer was passed to CalculateCheckSum32!","CRC.cpp");
  if (!gCRCTableP) CRASH("The crc table was not initialized!","CRC.cpp");
  iVar3 = (size >> 2) - 1;
  uVar1 = 0;
  while (iVar3 != -1) {
    uVar1 = *(u32*)dat;
      dat = (void *)((int)dat + 4);
      iVar3--;
      for(uVar2=0;uVar2 < 4;uVar2++){
        uVar4 = (uVar4 << 8 | uVar1 >> 0x18) ^ gCRCTableP[uVar4 >> 0x18];
        uVar1 = uVar1 << 8;
      }
      uVar1 = uVar4;
  }
  return uVar1;
}

u8 VerifyChecksum(void *dat,u32 size){
  int *piVar1 = (int *)((int)dat + ((size & ~3) - 4));
  *piVar1 -=8;
  return (!CalculateCheckSum32(dat,size));
}

void SetChecksum(void *dat,u32 size){
  int *piVar2 = (int *)((int)dat + ((size & ~3) - 4));
  *piVar2 = 0;
  *piVar2 = CalculateCheckSum32(dat,size) + 8;
}

};