#pragma once

#include "borg/borgHead.h"

//lighting data
struct Borg4Data{
    float unk0;
    float red;
    float green;
    float blue;
    Light* l;
    u8 unk14[4]; // garbage bytes?
};

struct Borg4Header {
    borgHeader head;
    Borg4Data* dat;
};