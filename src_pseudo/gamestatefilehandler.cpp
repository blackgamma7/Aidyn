#include "eventFlag.h"
#include "crash.h"
#include "stringN64.h"

void setBit(u8 *out,uint i,bool set,u8 *maskA,u8 *maskB){
  int iVar1;
  uint uVar2;
  
  uVar2 = i >> 3;
  iVar1 = i + uVar2 * -8;
  if (set) out[uVar2] |= maskA[iVar1];
  else  out[uVar2] &= maskB[iVar1];
}

bool getBit(u8 *stream,uint flag,u8 *mask){
  if (!stream) CRASH("Invalid stream passed to GetBit!","gamestatefilehandler.cpp");
  return (stream[flag >> 3] & mask[flag + (flag >> 3) * -8]) != 0;
}

void LoadGameState(GameStateFunnel *param_1,u8 *param_2){
  u32 i;
  u8 mask [8];
  for(i=0;i<8;i++){
    mask[i] = (u8)(1 << (i & 0x1f));
  }
  for(i=0;i<param_1->bitFlags;i++){
   param_1->States_pointer[i].Flag = getBit(param_2,i,mask);
  }
  set_gamestateFunnel_f(param_1);
}

void SaveGameState(GameStateFunnel *param_1,u8 *param_2){
  uint uVar1;
  byte *pbVar2;
  byte bVar3;
  byte *pbVar4;
  uint i;
  u8 auStack_98 [64];
  u8 auStack_58 [88];
  
  i = 0;
  do {
    pbVar2 = auStack_98 + i;
    uVar1 = i & 0x1f;
    pbVar4 = auStack_58 + i;
    i += 1;
    bVar3 = (byte)(1 << uVar1);
    *pbVar2 = bVar3;
    *pbVar4 = ~bVar3;
  } while (i < 8);
  i = param_1->bitFlags + 0x1f;
  if (false) { //?
    i = param_1->bitFlags + 0x3e;
  }
  memset(param_2,0,(i >> 5) << 2);
  i = 0;
  if (param_1->bitFlags != 0) {
    do {
      setBit(param_2,i,param_1->States_pointer[i].Flag != false,auStack_98,auStack_58);
      i += 1;
    } while (i < param_1->bitFlags);
  }
}




