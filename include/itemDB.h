#include "itemInstances.h"
#pragma pack (push, 1) //struct is 1-byte aligned.
/* Gear/item data stored in rom */
struct Gear_Rom {
    char name[20];
    ItemID_ROM ID;
    u8 ExpMulti[2];/* Endian reversed */
    u8 damage;
    u8 Protection;
    u8 required_STR;
    u8 Required_INT;
    u8 price[2]; /* Endian reversed */
    u8 Aspect;
    u8 stat;
    s8 statMod;
    u8 Skill;
    s8 SkillMod;
    ItemID_ROM Spell;
    u8 spellvalue;
    u8 SpellValue2;
    ItemID_ROM Magic;
    u8 MagicAmmount;
    u8 ElementResist;
    u8 ResistPercent; /* 100-(25*x) */
};
#pragma pack(pop)
//Items that exclude weapons, armour and potions
struct Gear_RAM {
    ItemID ID;
    char name[21];
    u8 field3_0x17; //align?
    u16 exp_multi;
    u8 damage;
    u8 Protection;
    u8 STR;
    u8 INT;
    u16 price;
    u8 aspect;
    u8 stat;
    u8 StatMod;
    u8 skill;
    u8 SkillMod;
    u8 spell;
    u8 spellVal1;
    u8 spellVal2;
    u8 magic;
    u8 magicAmmount;
    u8 elementResist;
    u8 field21_0x2b;
    float ResistPercent;
};

class ItemDB {
    public:
    u8 total;
    u8 totalPerGear[11];
    u8 unk1[12];
    Gear_RAM *Gear;
    void Orphaned();
    void LoadItem(u8 index,int *pos);
    void Init();
    void Free();
};
ItemDB* gItemDBp=NULL;
extern u8 itemID_array[];
