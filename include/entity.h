enum ENTITY_CATEGORY{GENERIC, HUMANOID, NAMED, PARTY, CHAOS, NATURAL};

struct{
  char name[20];
  char nameInternal[20];	//unused in game, sometimes differs
  byte category;
  ItemID_ROM ID;
  byte unk0x2b;
  byte Aspect;
  byte unk0x2d[2];
  s8 Alchemist;	// base skill lv's
  s8 Diplomat;		// FF=Cannot learn
  s8 Healer;		//proably stored as Array,
  s8 Loremaster;	//but listed individually here for modding sake.
  s8 Mechanic;
  s8 Merchant;
  s8 Ranger;
  s8 Stealth;
  s8 Theif;
  s8 Troubador;
  s8 Warrior;
  s8 Wizard;
  s8 Bite;
  s8 Breath;
  s8 Claw;
  s8 Hafted;
  s8 Missle;
  s8 Pole;
  s8 Spit;
  s8 Sting;
  s8 Sword;
  s8 Throw;
  s8 Tusk;
  u8 Intelligence; // base Stat lv's
  u8 Willpower;
  u8 Dexterity;
  u8 Endurance;
  u8 Strength;
  u8 Stamina;
  u8 unk0x4c;
  u8 Level;
  u8 unk4;
  ItemID_ROM Weapons[3]; // Endian swapped
  u8 unk0x55;
  u8 unk0x56;
  ItemID_ROM spells[5]; // Endian Swapped
  u8 school; // Chaos=All Schools
  u8 spell_levels[5];
  u8 unk6[9];
  ItemID_ROM Armor;
  u8 protection;
  ItemID_ROM sheild;
  u8 SheildSkill;
  u8 ElementResist1;
  u8 ResistAmmount1; // 100-(25*x)
  u8 ElementResist2;
  u8 ResistAmmount2; // 100-(25*x)
  u8 unk0x7a[8];
  u8 unk0x82[4];
  u8 EXP_X75; // x50, then 1.5 on EXP func
  u8 Loot Category;
}Entity_ROM;

struct{ // entity data in Ram
  ItemID ID;
  char Name[21];
  byte Category;
  u8 unk2; // 2 bits set on load_entityDB.
  u8 unk1;
  byte aspect;
  u8 unk3; // something to do with dying?
  u8 Level;
  u8 unk4;
  byte school;
  u8 a_;
  u8 b; // made to float. for monster encountering
  u8 c; //unused? also made float
  u8 Skills[12]; //same order as Entity_ROM
  u8 WeaponSkill[11]; //seen as arrays by game.
  u8 stats[6];
  u8 unk_0x3f;
  ItemID weapon[3];
  ItemID spells[5];
  u8 Spell_levels[5];
  u8 _unk2[5];
  u8 unk_0x5a;
  u8 unk_0x5b;
  ItemID Armor;
  ItemID Sheild;
  short _unk;
  s8 sheildStat;
  u8 Resist[2];
  u8 unk_0x65[3]; // likely aligning
  float resistAmmount[2];
  u16 FFs[4]; //some DB Item was supposed to be loaded, but is always blank and never called.
  u8 unk0x78[4];
  u16 EXP;
  u8 loot_Category;
  u8 unk_0x7f;
}Entity_Ram;

struct{
   u8 size;
   u8 catSizes[7];
   u8 unk[7];
   u8 pad;
   Entity_Ram * entities;
}EntityPointer;


struct{
	u16 index;
	u8 align[2];
	uint Model; //index of "borg7 file.
	uint Portait; //index of "borg8" file.
	float a;
	float b;
	float c;
	float d; //scale for camera?
}entity_info;

struct{
	u16 index;
	u8 align[2];
	uint Model;
	uint Portait;
	float a;
	float b;
}dialougeEntity_Info;

struct resist_float { /* resistance and element when loaded into temp item */
    enum ElementEnum element;
    byte pad[3];
    float percent;
};

struct charExp { /* data containing EXP, School, Aspect and more. */
    byte rom0x2b; /* Ent_rom data 0x2b. dunno if used */
    enum MagicSchoolEnum school;
    byte protection; /* protecttion, looks like */
    byte damage; /* damage seems to be */
    uint total; /* for level up */
    uint spending; /* for training */
    enum CharSheetFlags flags; /* set for alaron? */
    byte f;
    byte g;
    byte h;
};


struct effects {
    struct Temp_enchant * list[15];
};

struct spellbook { /* pointer and count of spells */
    struct Temp_spell * spells;
    byte spell_count;
};

struct CharSkills { /* Skill and weapon levels. Also sheild. */
    byte Skill_base[12];
    byte Weapon_Base[11];
    byte Sheild_Base;
    byte Skill_modded[12];
    byte Weapon_modded[11];
    byte Sheild_modded;
};

struct CharSheet { /* Skills, stats and misc of Characters */
    struct ItemID ID;
    char a;
    char b;
    char * name; /* pointer to entityDB entry */
    char d;
    byte lv;
    byte pad[10];
    struct charExp * EXP;
    struct CharStats * Stats; /* base and modded stats of character */
    struct CharSkills * Skills; /* skill and weapon levels */
    struct temp_armor * * armor;
    struct Temp_weapon * weapons;
    struct CharGear * pItemList;
    struct spellbook * spellbook; /* list and count of known spells */
    undefined4 unk0x30;
    struct effects * effects; /* spell effects on character */
    struct Potion_effect * * potion_effects;
    byte some_rand_val;
    byte spellSwitch;
    byte currSpell;
    u8 unk0x3f;
    u8 unk0x40;
    u8 unk0x41;
    u8 unk0x42;
    u8 unk0x43;
    struct Borg_8_header * portait;
};

struct CombatEntity {
    vec4 unk0x0;
    uint unk0x10;
    undefined2 unk0x14;
    u8 unk0x16;
    u8 unk0x17;
    undefined2 unk0x18;
    undefined2 unk0x1a;
    undefined2 unk0x1c;
    ushort unk0x1e;
    byte index;
    byte move_length;
    u8 unk0x22;
    u8 unk0x23;
    u8 unk0x24;
    byte unk0x25;
    u8 unk0x26;
    enum PotionEnum item;
    byte unk0x28;
    byte damage;
    u8 unk0x2a;
    u8 unk0x2b;
    enum Struct_char_flags flags;
    u8 unk0x2e;
    u8 unk0x2f;
    struct resist_float resists[2];
    struct CharSheet * CharSheet;
    struct combat_ai * combat_ai_pointer;
    float E[3];
    u8 unk0x54;
    u8 unk0x55;
    u8 unk0x56;
    u8 unk0x57;
    u8 unk0x58;
    u8 unk0x59;
    u8 unk0x5a;
    u8 unk0x5b;
    u8 unk0x5c;
    u8 unk0x5d;
    u8 unk0x5e;
    u8 unk0x5f;
    u8 unk0x60;
    u8 unk0x61;
    u8 unk0x62;
    u8 unk0x63;
    float scale?[10];
};

typedef struct itemtype_func itemtype_func, *Pitemtype_func;

struct itemtype_func {
    enum DBTypeEnum type;
    byte pad[3];
    undefined4 unk;
    ulong (* function)(void);
};


extern entity_info entity_info_array[222]; //organized alphabetically for some reason.
extern dialougeEntity_Info dailougEnt_info_array[32]; //same with this.
extern EntityPointer* EntPointer;
extern u8 entityList[221];

extern void Ofunc_entityDB(byte *);
extern ItemID swap_endian(ShortLE*);
extern void load_entityDB(EntityPointer*,byte,int *);
extern void build_entitydb(EntityPointer *);
extern void entitydb_free(EntityPointer *);
extern uint getEntityPortait(EntityPointer *,ItemID);
extern uint get_ent_borg7(EntityPointer *,ItemID);
extern char * ofunc_getEntityName(EntityPointer *,ItemID);
extern float get_entity_ram_b(EntityPointer *,ItemID);
extern float Ofunc_get_entity_ram_c(EntityPointer *,ItemID);
extern float get_entity_2float_sum(EntityPointer *,ItemID);
extern float sub_ent_2float_sum(EntityPointer *,ItemID);
extern u8 some_entity_check(EntityPointer *,ItemID);
extern float get_ent_float_a(EntityPointer *,ItemID);
extern float ret_point4float(EntityPointer *,ItemID);
extern bool IsNotBoss(EntityPointer *,ItemID);
extern float get_some_entity_dat(EntityPointer *,ItemID);
extern float get_entity_scale(EntityPointer *,ItemID);
