#include "itemID.h"

#pragma pack (push, 1) //struct is 1-byte aligned.
struct ArmorRom { /* Armour data in Rom */
    char name[23];
    ItemID_ROM id;
    u8 slot;
    u8 Defence;
    u8 protection;
    u8 dex;
    u8 unk0x1d;
    u8 stealth;
    u8 price[2]; /* endian swapped */
    u8 expBonus;
    u8 aspect;
    u8 stat;
    s8 statNum;
    u8 skill;
    u8 skillNum;
    ItemID_ROM spell;
    u8 SpellLV;
    u8 unk0x2a;
    ItemID_ROM magic;
    u8 magicLV;
    u8 Element;
    u8 ElementResist;
};
#pragma pack(pop)

struct ArmorRam {
    ItemID ID;
    char name[24];
    u8 slot;
    u8 defence;
    u8 protection;
    u8 dex;
    u8 rom0x1d;
    u8 stealth;
    u16 price;
    u8 expBonus;
    u8 aspect;
    u8 stat;
    s8 statNum;
    u8 skill;
    s8 skillNum;
    u8 spell;
    u8 spellLV;
    u8 SpellCharge; /* 10 for stardrake */
    u8 magic;
    u8 magicLV;
    u8 element;
    float resistpercent;
};

class ArmorDB {
    public:
    u8 armors;
    u8 sheilds;
    u8 total;
    u8 pad;
    ArmorRam *Armor;
    void Orphaned();
    void Load(u8 index, u32*pos);
    void Orphaned2(u8);
    void Init();
    void Free();
    u32 GetBorg5(ItemID id);
};
ArmorDB* gArmorDBp=NULL;

extern u8 ArmorList[];

u8 getRomEquipSpell(ItemID id);
