#define FILENAME "./src/CRCTable.cpp"

#include "CRC.h"
#include "heapN64.h"

namespace CRCTable{
u32 addEntry(u32 index){
  uint uVar1;
  uint i;
  
  uVar1 = index << 0x18;
  for(i=0;i<8;i++) {
    if (!(uVar1 & 0x80000000)) uVar1 <<= 1;
    else uVar1 = uVar1 << 1 ^ CRC_POLY;
  }
  return uVar1;
}

void Init(void){
    u8 i;
  
  if (!gCRCTableP) {
    ALLOCS(gCRCTableP,(CRC_TABLESIZE*sizeof(u32)),79);
    for(i=0;i<(CRC_TABLESIZE-1);i++){
      gCRCTableP[i] = addEntry(i);
    }
    gCRCTableP[i] = addEntry(CRC_TABLESIZE-1);
  }
}

void Free(void){FREEPTR(gCRCTableP,99);}
};