#include "itemID.h"

#pragma pack (push, 1) //struct is 1-byte aligned.
struct Weapon_ROM {
    char Name[21];
    ItemID_ROM ID;
    u8 WeaponType;
    u8 Required_Strength;
    u8 Hit;
    u8 damage;
    u8 Price[2]; /* endian swapped */
    u8 SpellLV;
    u8 Range;
    u8 Animation;
    u8 EXPMod;
    u8 Element;
    u8 aspect;
    u8 StatEnhanced;
    u8 StatAmmount;
    u8 enhanced;
    u8 ammount;
    ItemID_ROM Spell;
    u8 spellAmmount;
    u8 unk0x2a;
    ItemID_ROM Magic;
    u8 MagicAmmount;
    u8 ResistElement;
    u8 ResistPercent;
};
#pragma pack(pop)

struct weapon_ram { /* Weapon Data loaded into ram */
    ItemID ID;
    char name[22];
    u8 wepClass; /* Type of weapon (sword, breath, spit, etc.) */
    u8 ReqSTR;
    u8 Hit;
    u8 damage;
    u16 price; /* proper endian */
    u8 SpellLV;
    u8 Range; /* *(5/3) */
    u8 Animation; /* which use animation */
    u8 EXPMod; /* Lodin sword has set to 0x20 */
    u8 element;
    u8 aspect;
    u8 stat; /* Stat enhanced */
    u8 statMod;
    u8 Skill; /* skill enhanced (or stat) */
    u8 SkillMod;
    u8 spell;
    u8 spellAmmount;
    u8 ram0x2a;
    u8 spell2;
    u8 Spell2Ammount;
    u8 elementResist;
    float ResistPercent;
};

class WeaponDB {
    public:
    u8 Total;
    u8 Types[11];
    u8 Types2[11];
    u8 pad;
    weapon_ram *weapons;
    void Orphaned();
    void Load(u8 index,int *pos);
    void Init();
    void Free();
};

WeaponDB* gWeaponsDB=NULL;
extern u8 weaponList[];
