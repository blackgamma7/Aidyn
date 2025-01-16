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