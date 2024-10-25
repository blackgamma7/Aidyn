#include "typedefs.h"
#include "crash.h"
#include "stringN64.h"

struct romcopy_struct{
    OSMesg msg;
    OSMesgQueue msgQ;
    void* VAddr;
    u32 devAddr;
    u32 bytes;
};

struct RomcopyManageStruct{
    void* stack;
    OSMesg* mesgPointer;
    romcopy_struct* dmaStructs;
    u8* dmaIndicies;
    OSThread Thread;
    OSMesgQueue mesgQ0x1c0;
    OSMesg mesg0x1d8;
    OSMesgQueue mesgQ0x1dc;
    u8 flag;
};

namespace RomCopy{
  void Init(OSPri pri,u32 id);
  void proc(void*);
  void InitQueue(void);
  u8 RomCopy(void *dest,void *source,u32 len,u32 type,char *cpp,u32 line);
  u8 Cancel(u8 arg0,u8 arg1);
};

#define ROMCOPYS(dst,src,size,line) RomCopy::RomCopy(dst,src,size,1,FILENAME,line)