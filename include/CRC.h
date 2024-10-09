#include "typedefs.h"

u32* gCRCTableP;
//"magic number" polynomial
#define CRC_POLY 0x4c11db7
#define CRC_TABLESIZE 0x100

namespace CRC{
    u32 CalculateCheckSum32(void *dat,u32 size);
    u8 VerifyChecksum(void *dat,u32 size);
    void SetChecksum(void *dat,u32 size);
};

namespace CRCTable{
    u32 addEntry(u32 index);
    void Init(void);
    void Free(void);
};