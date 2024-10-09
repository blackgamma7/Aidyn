#include "typedefs.h"
#include "globals.h"

struct MemoryMakerStruct { /* same as SaveDatStruct, but no Screenshot */
    struct SavePartyHeader header;
    u8 field1_0x20[32];
    struct mapFloatDat mapData;
    u8 field34_0x6c[20];
    u8 flags[640];
    u8 minimapDat[64];
    u8 gameState[1984];
    u8 voxelChart[256];
};

//only ran if there is no Expansion pak (aka gExpPakFlag is 0)
namespace MemoryMaker{
void Init(void);
void Free(void);
void Unload(void);
void Reload(void);
void NoopA(void);
void NoopB(void);    
};
