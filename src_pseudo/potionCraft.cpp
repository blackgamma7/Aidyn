typedef struct potionRecipie potionRecipie, *PpotionRecipie;
struct potionRecipie {
    enum PotionEnum ID;
    byte spice;
    byte herb;
    byte gemstone;
    byte alchemist;
    byte unk;
    byte pad;
};

potionRecipie Potionrecipies[15]={
    {FIRE,1,0,2,1,2,0},
    {INFERNO,3,0,3,4,6,0},
    {SLEEP,3,3,0,5,10,0},
    {ACID,2,0,3,5,10,0},
    {HEALING,0,3,0,1,2,0},
    {STAMINA,0,2,0,5,1,0},
    {CURING,2,3,0,3,6,0},
    {ANTIDOTE,3,2,0,3,4,0},
    {STRENGTH,0,2,2,2,4,0},
    {DEXTERITY,2,2,0,2,4,0},
    {CLARITY,3,0,0,3,5,0},
    {CHARISMA,2,1,1,2,4,0},
    {DEFENCE,0,0,2,2,5,0},
    {STEALTH,2,3,0,2,4,0},
    {RESTORE,2,0,2,3,10,0}
};