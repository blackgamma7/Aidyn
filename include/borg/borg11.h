#include "borg/borgHead.h"

#define BORG11_Set 0x10 //always set
#define BORG11_8bit 0x4 //8-bit sound sample
#define BORG11_16BE 0x8 //16-bit BE sound sample

//PCM mono 44.1KHz sound samples
struct Borg11Data {
    u32 flag; //uses BORG11_* #defines.
    u32 len;
    u32 samples;
    u8 *wav;
};

struct Borg11Header {
    borgHeader head;
    Borg11Data *dat;
};

//n64borg/Sample.cpp

void borg11_func_a(Borg11Data *);
u8 borg11_func_b(Borg11Header *,Borg11Data *);
void borg11_free(Borg11Header *);
Borg11Header * loadBorg11(u32);
void passto_borg11_free(Borg11Header *);