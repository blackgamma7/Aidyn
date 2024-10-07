#include "itemID.h"

struct   { /* spell data loaded into character. */
    struct ItemInstance base;
    u8 level;
    u8 school;
    u8 damage;
    u8 stamina;
    u8 cast;
    u8 target;
    u8 wizard;
    u8 special;
    u8 range;
    u8 cost;
    u16 exp_modifyer;
    u8 aspect_flag; /* ram0x1f */
};
