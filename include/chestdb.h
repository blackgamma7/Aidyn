#include "itemID.h"
#include "n64Borg.h"

struct loot_ROM { /* Loot Pools stored in ROM */
    char Name[20];
    ItemID_ROM ID;
    u8 goldLo[2]; /* Endians swapped */
    u8 goldHi[2]; /* Endians swapped */
    u8 armorDrop[2]; /* % armor/Sheild drop */
    u8 WeaponDrop[3]; /* % weapon drop */
    u8 reagentPercent;
    u8 reagentRange[2];
    ItemID_ROM item0;
    u8 item0chance;
    u8 item0quantity[2]; /* lo/hi range */
    ItemID_ROM item1;
    u8 item1chance;
    u8 item1quantity[2];
    ItemID_ROM item3;
    u8 item3chance;
    ItemID_ROM item4;
    u8 item4chance;
    ItemID_ROM item5;
    u8 item5chance;
    ItemID_ROM item6;
    u8 item6chance;
};

struct Loot_RAM { /* Chestdb loaded into RAM */
    char Name[21];
    char field2_0x15;
    ItemID ID;
    u16 GoldLo;
    u16 GoldHi;
    u8 armorDrop;
    u8 sheildDrop;
    u8 weaponDrop[3];
    u8 reagentchance;
    u8 reagentLlo;
    u8 reagentHi;
    ItemID itemDrops[6];
    u8 itemDropChances[6];
    u8 itemLo[2];
    u8 itemHi[2];
};

struct loot_Pointer {
    u8 total;
    Loot_RAM *lootCat;
};

extern loot_Pointer* gChestDBp;

extern u8 lootList[];//indecies of loot entries

void chestdb_ofunc(loot_Pointer *param_1);
void load_chestDB(loot_Pointer *param_1,u8 param_2,s32 *param_3);
void Ofunc_800748c4(loot_Pointer *param_1,u16 param_2);
u32 item_chances(container_Dat *chest,u8 chance,u8 QLo,u8 Qhi,u8 slot,s16 item,u32 isMulti);
void get_chest_loot(loot_Pointer *param_1,container_Dat *param_2);

