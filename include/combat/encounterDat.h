#include "itemID.h"

struct EncounterDat { /* enemy encounter data */
    ItemID enemy_entities[12]; /* entitty id's of enemies */
    ItemID globalLoot; /* chestdb of guarunteed loot */
    u16 EncounterID;
    u8 field3_0x1c;
    undefined field4_0x1d;
    u16 VoxelIndex;
    u16 mapDatA;
    u16 MapSAhortA;
    u16 MapShortB;
    u8 collisionByte;
    u8 battlefield;
    u8 unk28;
    u8 BossShadow; /* fighting a Boss or the Shadow */
    u16 VoxelFlagA;
    u16 VoxelBitfield;
};
