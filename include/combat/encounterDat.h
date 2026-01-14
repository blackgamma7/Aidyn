#include "itemID.h"

struct EncounterDat { /* enemy encounter data */
    ItemID enemy_entities[12]; /* entitty id's of enemies */
    ItemID globalLoot; /* chestdb of guarunteed loot */
    u16 EncounterID;
    u8 field3_0x1c;
    u8 field4_0x1d;
    u16 VoxelIndex;
    u16 mapDatA;
    u16 MapSAhortA;
    u16 MapShortB;
    u8 collisionByte;
    u8 battlefield;
    u8 aniByte; //use EncountAni. based on animation state before encounter
    u8 canFlee;
    u16 VoxelFlagA;
    u16 VoxelBitfield;
};
enum EncountAni{
    EncountAni_Default,
    EncountAni_Sneak,
    EncountAni_Walk,
    EncountAni_Run
};