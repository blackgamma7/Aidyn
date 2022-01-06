enum ENTITY_CATEGORY{GENERIC, HUMANOID, NAMED, PARTY, CHAOS, NATURAL};

struct{
  char name[20];
  char nameInternal[20];	//unused in game, sometimes differs
  u8 category;
  ItemID_ROM ID;
  u8 unk0x2b;
  u8 Aspect;
  u8 unk0x2d[2]; //{True Name, Unknown}
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
  u8 unk0x7a[8]; //unused
  u8 unk0x82[4]; //unused
  u8 EXP_X75; // x50, then 1.5 on EXP func
  u8 Loot Category;
}Entity_ROM;

struct Entity_Ram { /* entity data in Ram */
    struct ItemID ID;
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
    u8 Weapon prof[11];
    u8 stats[7];
    struct ItemID weapon[3];
    struct ItemID spells[5];
    u8 Spell_levels[5];
    u8 unk0x55[5]; // rom0x68. Unused
    u8 unk0x5a[4]; // rom0x6d. Unused.
    struct ItemID Armor;
    struct ItemID Sheild;
    s8 sheildStat;
    enum ElementEnum Resist[2];
    u8 align[3];
    float resistAmmount[2];
    u16 FFs[4]; /* supposed to load something, but ends up blank. unused. */
    u8 unk0x78[4];
    u16 EXP;
    u8 loot_Category;
    u8 unk0x7f;
};

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
	u32 Model; //index of "borg7 file.
	u32 portrait; //index of "borg8" file.
	float a;
	float b;
	float c;
	float scale; 
}entity_info;

struct{
	u16 index;
	u8 align[2];
	u32 Model;
	u32 portrait;
	float a;
	float scale;
}dialougeEntity_Info;

struct resist_float { /* resistance and element when loaded into temp item */
    enum ELEMENT element;
    u8 pad[3];
    float percent;
};

struct charExp { /* data containing EXP, School, Aspect and more. */
    u8 rom0x2b; /* Ent_rom data 0x2b. dunno if used */
    enum MagicSchoolEnum school;
    u8 protection; /* protecttion, looks like */
    u8 damage; /* damage seems to be */
    u32 total; /* for level up */
    u32 spending; /* for training */
    enum CharSheetFlags flags; /* aspect, heavy, true name */
    u8 pad[3];
};


struct effects {
    struct Temp_enchant * list[15];
};

struct spellbook { /* pointer and count of spells */
    struct Temp_spell * spells;
    u8 spell_count;
};

struct CharSkills { /* Skill and weapon levels. Also sheild. */
    u8 Skill_base[12];
    u8 Weapon_Base[11];
    u8 Sheild_Base;
    u8 Skill_modded[12];
    u8 Weapon_modded[11];
    u8 Sheild_modded;
};

struct CharSheet { /* Skills, stats and misc of Characters */
    struct ItemID ID;
    char a;
    char b;
    char * name; /* pointer to entityDB entry */
    char d;
    u8 lv;
    u8 pad[10];
    struct charExp * EXP;
    struct CharStats * Stats; /* base and modded stats of character */
    struct CharSkills * Skills; /* skill and weapon levels */
    struct temp_armor * * armor;
    struct Temp_weapon * weapons;
    struct CharGear * pItemList;
    struct spellbook * spellbook; /* list and count of known spells */
    s32 unk0x30;
    struct effects * effects; /* spell effects on character */
    struct Potion_effect * * potion_effects;
    u8 some_rand_val;
    u8 spellSwitch;
    u8 currSpell;
    u8 unk0x3f[5];
    struct Borg_8_header * portrait;
};

struct CombatEntity {
    vec4 unk0x0;
    u32 unk0x10;
    u16 unk0x14;
    u8 unk0x16;
    u8 unk0x17;
    u16 unk0x18;
    u16 unk0x1a;
    u16 unk0x1c;
    u16 unk0x1e;
    u8 index;
    u8 move_length;
    u8 unk0x22;
    u8 unk0x23;
    u8 unk0x24;
    u8 unk0x25;
    u8 unk0x26;
    enum POTION item;
    u8 unk0x28;
    u8 damage;
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
    u8 pad[3];
    s32 unk;
    ulong (* function)(void);
};


extern entity_info entity_info_array[222]; //organized alphabetically for some reason.
extern dialougeEntity_Info dailougEnt_info_array[32]; //same with this.
extern EntityPointer* EntPointer;
extern u8 entityList[221];

extern void Ofunc_entityDB(u8 *);
extern ItemID swap_endian(ShortLE*);
extern void load_entityDB(EntityPointer*,u8,s32 *);
extern void build_entitydb(EntityPointer *);
extern void entitydb_free(EntityPointer *);
extern u32 getEntityPortait(EntityPointer *,ItemID);
extern u32 get_ent_borg7(EntityPointer *,ItemID);
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
