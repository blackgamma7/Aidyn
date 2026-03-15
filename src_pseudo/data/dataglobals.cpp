#include "romcopy.h"
#include "itemID.h"

u8 load_db_array_size(void *header,void *size,u32 *offset){
  ArrayHeader temp;
  ArrayHeader *hdr = (ArrayHeader *)((u8*)header + *offset);
  u8 ret = RomCopy::RomCopy(&temp,hdr,sizeof(ArrayHeader),1,"../data/dataGlobals.cpp",0x24);
  *(u8*)size = temp.Size;
  *offset += sizeof(ArrayHeader);
  return ret;
}