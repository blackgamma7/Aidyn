#include "typedefs.h"
#include "stringN64.h"

struct SaveFile {
    u8* dat;
    u32 pos;
};

namespace SaveParty{
    void Init(SaveFile *save,u8 *dat);
    void SaveBits(SaveFile *sav,u32 dat,uint bits);
    u32 LoadBits(SaveFile *save,u32 bits);
    void Advance(SaveFile *sav,u32 bits);
    u32 RShift(u32 x,u8 shifts);
    u32 GetBit(u8 *arr,u32 x);
    void WriteData(u8 *dat,u32 filesize,u32 size);
    void GetData(u32 *dat,uint shift,int bits);

};

struct SavePartyHeader {
    int time;
    ItemID party[4];
    char name[20];
};

struct mapFloatDat {
    vec3f playerVec3;
    vec2f playerVec2;
    vec3f cameraVec3;
    u16 MapShort1;
    u16 MapShort2;
    u8 mapDatA;
    u16 mapDatB;
    u16 mapDatC;
    u16 field8_0x2a;
};

struct SaveDatStruct {
    SavePartyHeader headerDat;
    u8 field1_0x20[0x20];
    mapFloatDat mapDat;
    u8 field34_0x6c[20];
    u8 flags[640];
    u8 screenshot[4096];
    u8 minimap[64];
    u8 gameState[1984];
    u8 voxelChart[256]; /* last 4 bytes for checksum */
};

struct SaveDatPointers {
    SaveDatStruct *datStart;
    SavePartyHeader *savePartyHead;
    mapFloatDat *mapdata;
    u8 *EventFlags;
    u8 *gamestate;
    void *screenshot;
    u32 *minimap;
    u8 *voxelChart;
};