#include "Entity.h"

struct potionRecipie {
    u8 ID;
    u8 spice;
    u8 herb;
    u8 gemstone;
    u8 alchemist;
    u8 unk;
    u8 pad;
};

potionRecipie Potionrecipies[15]={
    {POTION_FIRE,1,0,2,1,2,0},
    {POTION_INFERNO,3,0,3,4,6,0},
    {POTION_SLEEP,3,3,0,5,10,0},
    {POTION_ACID,2,0,3,5,10,0},
    {POTION_HEALING,0,3,0,1,2,0},
    {POTION_STAMINA,0,2,0,5,1,0},
    {POTION_CURING,2,3,0,3,6,0},
    {POTION_ANTIDOTE,3,2,0,3,4,0},
    {POTION_STRENGTH,0,2,2,2,4,0},
    {POTION_DEXTERITY,2,2,0,2,4,0},
    {POTION_CLARITY,3,0,0,3,5,0},
    {POTION_CHARISMA,2,1,1,2,4,0},
    {POTION_DEFENCE,0,0,2,2,5,0},
    {POTION_STEALTH,2,3,0,2,4,0},
    {POTION_RESTORE,2,0,2,3,10,0}
};