#include "romcopy.h"
#include "itemID.h"

u8 load_db_array_size(ArrayHeader *header,u8 *size,u32 *offset){;
  ArrayHeader temp;
  
  u8 ret = RomCopy::RomCopy(&temp,header + *offset,sizeof(ArrayHeader),1,"../data/dataGlobals.cpp",0x24);
  *size = temp.Size;
  *offset += sizeof(ArrayHeader);
  return ret;
}