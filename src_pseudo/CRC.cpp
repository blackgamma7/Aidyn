#include "CRC.h"
#include "crash.h"

namespace CRC{
uint CalculateCheckSum32(void *dat,u32 size){
  uint uVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  
  uVar4 = 0;
  if (!dat) CRASH("A null pointer was passed to CalculateCheckSum32!","CRC.cpp");
  if (!gCRCTableP) CRASH("The crc table was not initialized!","CRC.cpp");
  iVar3 = (size >> 2) - 1;
  uVar1 = 0;
  if (iVar3 != -1) {
    uVar1 = *dat;
    while( true ) {
      dat = (void *)((int)dat + 4);
      uVar2 = 0;
      iVar3 += -1;
      do {
        uVar2 += 1;
        uVar4 = (uVar4 << 8 | uVar1 >> 0x18) ^ gCRCTableP[uVar4 >> 0x18];
        uVar1 = uVar1 << 8;
      } while (uVar2 < 4);
      uVar1 = uVar4;
      if (iVar3 == -1) break;
      uVar1 = *dat;
    }
  }
  return uVar1;
}

u8 VerifyChecksum(void *dat,uint size){
  int *piVar1 = (int *)((int)dat + ((size & 0xfffffffc) - 4));
  *piVar1 -=8;
  return (!CalculateCheckSum32(dat,size));
}

void SetChecksum(void *dat,uint size){
  int *piVar2 = (int *)((int)dat + ((size & 0xfffffffc) - 4));
  *piVar2 = 0;
  *piVar2 = CalculateCheckSum32(dat,size) + 8;
}

};