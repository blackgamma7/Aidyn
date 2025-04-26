#include "romstring.h"
#include "romcopy.h"
#include "decompress.h"
#define FILENAME "./src/romstrings.cpp"

extern void some_string_func(char*);

namespace  Romstring{
    char ** Load(void *romAddr,uint size){
  byte bVar1;
  ushort *OutDat;
  u8 *dest;
  char **ppcVar2;
  ushort *puVar3;
  uint uVar4;
  ushort auStack_68 [32];
  u32 auStack_28;
  ROMCOPYS(auStack_68,romAddr,8,0x36);
  ALLOCS(OutDat,auStack_68[0],0x3c);
  ALLOCS(dest,size,0x3f);
  ROMCOPYS(dest,romAddr,size,0x42);
  auStack_28 = 0;
  decompress_LZ01(dest + 2,size,(u8 *)OutDat,&auStack_28);
  HFREE(dest,0x4a);
  puVar3 = OutDat + 1;
  auStack_28 = (u32)*OutDat;
  ALLOCS(ppcVar2,auStack_28*sizeof(char*),0x55);
  if (auStack_28 != 0) {
    for(u16 i=0;i<auStack_28;i++) {
      bVar1 = *(byte *)puVar3;
      ppcVar2[i] = (char *)((int)puVar3 + 1);
      decrypt_string((char *)((int)puVar3 + 1),0x10,0x103,(ushort)bVar1);
      some_string_func(ppcVar2[i]);
      puVar3 = (ushort *)((int)puVar3 + bVar1 + 1);
    }
  }
  return ppcVar2;
}
void Free(char **param_1){
  HFREE(*param_1 + -3,0x79);
  HFREE(param_1,0x7a);
}

}