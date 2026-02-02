#include "borg/borg11.h"

struct Borg12Sub {
    u32 channelCount;//0x08 on file
    int instrument_count;//0x0C on file
    u32 dataSize;//0x10 on file
    u32 byteIndex;//0x14 on file
    struct dcmStruct2 *ptr0x18;//0x18 on file
    u8 *channelDat;//0x1C on file
};

struct Borg12Data {
    union{
    u32* instrumentsI;
    Borg11Header **intrumentsP;
    };
    u32 unk4;
    Borg12Sub sub;
};

struct Borg12Header {
    borgHeader head;
    Borg12Data *dat;
};

//n64borg/DCMModule.cpp

void borg12_func_a(Borg12Data *);
u8 borg12_func_b(Borg12Header *,Borg12Data *);
void n64BorgDCMModule_free(Borg12Header *);
Borg12Header * loadBorg12(u32 index);
void free_borg_12(Borg12Header *p);