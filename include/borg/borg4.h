#include "borg/borgHead.h"

//lighting data
struct Borg4Data{
    float unk0;
    float red;
    float green;
    float blue;
    Light* l;
    s16 unk14;
    s16 unk16;
};

struct Borg4Header {
    borgHeader head;
    Borg4Data* dat;
};