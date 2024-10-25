#include "GhidraDump.h"
#include "CharStats.h"
#include "CharSkills.h"
#include "spells.h"
#include "itemId.h"

enum ENTITY_CATEGORY{
    ENTITY_GENERIC,
    ENTITY_HUMANOID,
    ENTITY_NAMED,
    ENTITY_PARTY,
    ENTITY_CHAOS,
    ENTITY_NATURAL
    };


struct Entity_ROM { /* Entity data stored in Rom */
    char name[20];
    char internalName[20];
    enum EntityCatEnum category; /* only checks for Chaos type */
    ItemID_ROM id;
    u8 unk0x2b; /* passed to ram 0x19 */
    enum AspectEnum Aspect;
    u8 trueName;
    u8 Heavy;
    u8 Alchemist; /* base skill lv's */
    u8 Diplomat; /* FF=Cannot learn */
    u8 Healer;
    u8 Loremaster;
    u8 Mechanic;
    u8 Merchant;
    u8 Ranger;
    u8 Stealth;
    u8 Theif;
    u8 Troubador;
    u8 Warrior;
    u8 Wizard;
    u8 Bite;
    u8 Breath;
    u8 Claw;
    u8 Hafted;
    u8 Missle;
    u8 Pole;
    u8 Spit;
    u8 Sting;
    u8 Sword;
    u8 Throw;
    u8 Tusk;
    u8 Intelligence; /* base Stat lv's */
    u8 Willpower;
    u8 Dexterity;
    u8 Endurance;
    u8 Strength;
    u8 Stamina;
    u8 morale;
    u8 Level;
    u8 unk0x4e;
    ItemID_ROM Weapons[3]; /* Endian swapped */
    u8 unk0x55;
    u8 unk0x56;
    ItemID_ROM spells[5]; /* endian Swapped */
    enum MagicSchoolEnum MagicSchool; /* Chaos=All Schools */
    u8 spell_levels[5];
    u8 unk0x67[9];
    ItemID_ROM Armor;
    u8 protection;
    ItemID_ROM sheild;
    u8 SheildSkill;
    enum ElementEnum ElementResist1;
    u8 ResistAmmount1; /* 100-(25*x) */
    enum ElementEnum ElementResist2;
    u8 ResistAmmount2; /* 100-(25*x) */
    u8 unk0x7a[8];
    u8 unk0x82[4];
    u8 EXP_X75; /* x50, then 1.5 on EXP func */
    u8 LootCategory;
};

struct Entity_Ram { /* entity data in Ram */
    ItemID ID;
    char Name[21];
    enum EntityCatEnum Category;
    enum CharSheetFlags unk0x18; /* 2 bits determined by rom0x2d */
    u8 rom0x2b;
    enum AspectEnum aspect;
    u8 Morale; //morale
    u8 Level;
    u8 BaseDamage; /* rom0x4d */
    enum MagicSchoolEnum School;
    u8 BaseProtect; /* sheild related? */
    u8 unk0x20; //deals with monster "vision." 10 or 0.
    u8 unk0x21;
    u8 Skills[12];
    u8 weaponProf[11];
    u8 stats[7];
    ItemID weapon[3];
    ItemID spells[5];
    u8 Spell_levels[5];
    u8 unk0x55[5]; // rom0x68. Unused
    u8 unk0x5a[4]; // rom0x6d. Unused.
    ItemID Armor;
    ItemID Sheild;
    s8 sheildStat;
    u8 Resist[2];
    u8 align[3];
    float resistAmmount[2];
    u16 FFs[4]; /* supposed to load something, but ends up blank. unused. */
    u8 unk0x78[4];
    u16 EXP;
    u8 loot_Category;
    u8 unk0x7f;
};

struct entity_info{
	u16 index;
	u32 Model; //index of "borg7 file.
	u32 portrait; //index of "borg8" file.
	float a;
	float b;
	float c;
	float scale; 
};

struct dialougeEntity_Info { /* extended data of Dialouge entities in RAM */
    u16 index;
    u32 model;
    u32 portrait;
    float a;
    float b;
};

struct resist_float { /* resistance and element when loaded into temp item */
    u8 element;
    float percent;
};

typedef enum CharSheetFlags {
    CHAR_TrueName=1,
    CHAR_IsHeavy=2,
    CHAR_IsSolar=4 //false for lunar aspect.
} CharSheetFlags;

struct charExp { /* data containing EXP, School, Aspect and more. */
    u8 rom0x2b; /* Ent_rom data 0x2b. dunno if used */
    u8 school;
    u8 protection;
    u8 damage; /* Not used in combat calc */
    uint total; /* for level up */
    uint spending; /* for training */
    u8 flags; // true name, heavy, aspect
};


struct Spellbook { /* pointer and count of spells */
    SpellInstance ** spells;
    u8 count;
};

#define GEARTOTAL 12
struct CharGear {
    GearInstance **pItem;
    u8 usedItems;
    u8 maxItems;
};

struct PotionEffect {
    enum PotionEnum ID;
    u8 power;
    u16 align;
    uint timer;
    u32 SpellVisualIndex;
};

#define MAGIC_FXMAX 15
#define POTION_FXMAX 7
struct CharSheet { /* Skills, stats and misc of Characters */
    ItemID ID;
    char *name; /* pointer to entityDB entry */
    u8 unk0x8[12]; //unused
    charExp *EXP;
    CharStats *Stats; /* base and modded stats of character */
    CharSkills *Skills; /* skill and weapon levels */
    ArmorInstance **armor;
    WeaponInstance *weapons;
    CharGear *pItemList;
    Spellbook *spellbook; /* list and count of known spells */
    u32 unk0x30; //unused
    Temp_enchant** effects;
    PotionEffect** potionEffects; //potion effects on character
    s8 spellVal;
    u8 spellSwitch;
    u8 currSpell;
    u32 unk0x40;
    Borg8header *portrait;
};


struct itemtype_func {
    u8 type;
    s32 unk;
    s32 (* function)(Party*,u8,ItemInstance,CharSheet);
};

struct EntityDB {
    u8 total;
    u8 catSizes[7];
    u8 unk[7];
    struct Entity_Ram *entities;
};

extern entity_info entity_info_array[222]; //organized alphabetically for some reason.
extern dialougeEntity_Info dailougEnt_info_array[32]; //same with this.
extern EntityDB* gEntityDB;
extern u8 entityList[221];

extern void Ofunc_entityDB(u8 *);
//TODO: reformat as class methods(?)
extern void load_entityDB(EntityDB*,u8,s32 *);
extern void build_entitydb(EntityDB *);
extern void entitydb_free(EntityDB *);
extern u32 getEntityPortait(EntityDB *,ItemID);
extern u32 get_ent_borg7(EntityDB *,ItemID);
extern char * ofunc_getEntityName(EntityDB *,ItemID);
extern float get_entity_ram_b(EntityDB*,ItemID);
extern float Ofunc_get_entity_ram_c(EntityDB*,ItemID);
extern float get_entity_2float_sum(EntityDB*,ItemID);
extern float sub_ent_2float_sum(EntityDB*,ItemID);
extern u8 some_entity_check(EntityDB*,ItemID);
extern float get_ent_float_a(EntityDB*,ItemID);
extern float ret_point4float(EntityDB*,ItemID);
extern u8 IsNotBoss(EntityDB*,ItemID);
extern float get_some_entity_dat(EntityDB*,ItemID);
extern float get_entity_scale(EntityDB*,ItemID);
