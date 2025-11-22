#include "romstring.h"
#include "romcopy.h"
#include "decompress.h"
#include "heapN64.h"
#define FILENAME "./src/romstrings.cpp"

extern void some_string_func(char*);

namespace  RomString{
char ** Load(void *romAddr,size_t size){
  byte bVar1;
  ushort *OutDat;
  u8 *dest;
  char **ret;
  ushort *puVar3;
  u32 uVar4;
  ushort auStack_68;
  u32 auStack_28;
  ROMCOPYS(&auStack_68,romAddr,8,54);
  ALLOCS(OutDat,auStack_68,60);
  ALLOCS(dest,size,63);
  ROMCOPYS(dest,romAddr,size,66);
  auStack_28 = 0;
  decompress_LZ01(dest + 2,size,(u8 *)OutDat,&auStack_28);
  HFREE(dest,0x4a);
  puVar3 = OutDat + 1;
  auStack_28 = (u32)*OutDat;
  ALLOCS(ret,auStack_28*sizeof(char*),85);
  if (auStack_28 != 0) {
    for(u16 i=0;i<auStack_28;i++) {
      bVar1 = *(byte *)puVar3;
      ret[i] = (char *)((int)puVar3 + 1);
      decrypt_string((char *)((int)puVar3 + 1),0x10,0x103,(ushort)bVar1);
      some_string_func(ret[i]);
      puVar3 = (ushort *)((int)puVar3 + bVar1 + 1);
    }
  }
  return ret;
}
void Free(char **txt){
  HFREE(*txt + -3,121);
  HFREE(txt,122);
}

}