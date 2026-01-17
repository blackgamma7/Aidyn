#include "itemID.h"
//for use in the "generic/" scripts

struct Temp_enchant {
    u8 index;
    u8 lv;
    u8 school;
    u8 varA;
    u32 varB;
    u32 timer;
    u32 unkc; /* unused */
    u32 unk10; /* unused */
    u32 SpellVisualIndex;
};

struct ElemResist { /* resistance and element when loaded into temp item */
    u8 element;
    float percent;
};

struct StatMod {
    s8 stat;
    s8 mod;
};
void SetStatMod(StatMod *param_1, u8 stat, s8 mod);

class ItemInstance {
    public:
    ItemID id;
    u16 field1_0x2;
    char *name;
    u8 aspect;
    u8 field4_0x9;
    u16 price;
    StatMod *statMod;
    SpellCharges *spellCharge;
    void InitItem(ItemID );
    void RemoveStatSpell();
    void InitArmor(ItemID);
    void InitWeapon(ItemID);
    void InitPotion(ItemID);
    void InitGear(ItemID);
    u16 GetPrice();
    void SetMagicCharges(s8);
};

struct WeaponInstance {
    ItemInstance base;
    char unk14;
    char unk15;
    u8 unk16;
    u8 reqStr;
    StatMod *SkillMod;
    Temp_enchant *enchantment;
    ElemResist *resist;
    u8 weaponType;
    u8 hit;
    u8 damage;
    u8 range;
    u8 animation;
    u8 element;
    u8 field14_0x2a;
    u8 field15_0x2b;
};
struct SpellInstance{
    ItemInstance base;
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
    u16 expMod;
    u8 aspect_flag;
};

struct SpellCharges {
    SpellInstance *Spell;
    u8 Charges;
};

struct ArmorInstance {
    ItemInstance base;
    u8 unk14;
    u8 unk15;
    u8 field3_0x16;
    u8 rom0x1d;
    StatMod* skillmod;
    Temp_enchant *enchantment;
    ElemResist *resist;
    u8 DEF;
    u8 Protect;
    u8 dex;
    u8 stealth;
};

struct GearInstance {
    ItemInstance base;
    u8 damage;
    u8 Protection;
    u8 STR;
    u8 INT;
    StatMod* skillMod;
    Temp_enchant *enchantment;
    ElemResist *resist;
};

union EquipInstance {
    WeaponInstance W;
    GearInstance G;
    ItemInstance P;
    ArmorInstance A;
    SpellInstance S;
};

void make_temp_item(GearInstance *item,ItemID id);
void clear_weapon_effects(WeaponInstance *param_1);
void make_temp_armor_2(ArmorInstance *param_1);
void make_temp_weapon_2(WeaponInstance *param_1);
void make_GearInstance_2(GearInstance *param_1);
void pass_to_make_temp_potion(ItemInstance *param_1);

void make_temp_armor_3(ArmorInstance *param_1,ItemID param_2);
void ArmorInstance_ClearEffect(ArmorInstance *param_1);

void createTempWeapon(WeaponInstance *w,ItemID id);
void passto_clear_weapon_effects(WeaponInstance *w);
bool isBreathSpitOrSpikes(WeaponInstance *w);
