#ifndef COMMONTYPES_H
#define COMMONTYPES_H

#define dtor 0.017453f
#define INT_MAX_f 2.14748365E9f
#define INT_MAX_d 2.14748365E9d
#define UINT_MAX_d 4.294967296E9d

typedef signed char            s8;
typedef unsigned char          u8;
typedef signed short int       s16;
typedef unsigned short int     u16;
typedef signed int             s32;
typedef unsigned int           u32;
typedef signed long long int   s64;
typedef unsigned long long int u64;

typedef float  f32;
typedef double f64;



#define ABS_macro(x) (if((float)x>=INT_MAX_f){x-=INT_MAX_f}) // may just be compiled casting.
#define LE(x) ((u16)x[0] + (u16)x[1] * 0x100) //for the byteswapping in ROM data
#define SQ(x) x*x


#define OFFWHITE {0xe1,0xe1,0xe1,0xff}
#define DARKGRAY {0x32,0x32,0x32,0xff}
#define DARKGRAY_T {0x32,0x32,0x32,0x96}
#define YELLOW_T {0xc8,0xc8,0,0xe1}


enum ELEMENT{
	ELEMENT_NONE, ELEMENT_EARTH, ELEMENT_SOLAR, ELEMENT_PHYSICAL, ELEMENT_NECROMANCY,
    ELEMENT_FIRE, ELEMENT_LUNAR, ELEMENT_NAMING, ELEMENT_WATER, ELEMENT_MAGIC,
    ELEMENT_AIR, ELEMENT_STAR, ELEMENT_ELEMENTAL, ELEMENT_CHAOS, ELEMENT_CUTTING, 
    ELEMENT_SMASHING, ELEMENT_HOLY
};
enum SCHOOL{
    SCHOOL_CHAOS,SCHOOL_ELEMENTAL,SCHOOL_NAMING,SCHOOL_NECROMANCY,SCHOOL_NONE,SCHOOL_STAR
};

enum CHAR_SKILL{
	SKILL_ALCHEMIST, SKILL_DIPLOMAT, SKILL_HEALER, SKILL_LOREMASTER,
    SKILL_MECHANIC, SKILL_MERCHANT, SKILL_RANGER, SKILL_STEALTH,
    SKILL_THEIF, SKILL_TROUBADOR, SKILL_WARRIOR, SKILL_WIZARD, SKILL_NONE=255
};

enum DB_TYPE{
	EMPTY, MISC, ENTITY, SPELL, ARMOR, UNK4, SHIELD, WEAPON, CHEST, HELMET, CLOAK, GLOVE, RING, WAND, BELT, BOOTS, POTION, SCROLL, KEYITEM, AMULET, DIALOUGEENTITY
};
typedef struct{
    union {
        u16 s; //often loaded as short
        struct{
            u8 type; // from DB_TYPE
            u8 id;
        };
    };
}ItemID;

typedef struct{
    union {
        u16 s; //often loaded as short
        struct{
            u8 id;
            u8 type; // from DB_TYPE
        };
    };
}ItemID_ROM; //LE version

#define ITEMIDTYPE(x) x.s>>8

enum POTION{
	POTION_FIRE,
    POTION_INFERNO,
    POTION_SLEEP,
    POTION_ACID,
    POTION_HEALING,
    POTION_STAMINA,
    POTION_CURING,
    POTION_ANTIDOTE,
    POTION_RESTORE,
    POTION_STRENGTH,
    POTION_DEXTERITY,
    POTION_ASPECT, //listed as "A"
    POTION_JUMPING, //listed as "J"
    POTION_CLARITY,
    POTION_CHARISMA,
    POTION_DEFENCE,
    POTION_STEALTH
}; // POTION_ASPECT and POTION_JUMPING are ommited. couple funcs change "A" potions into healing potions automatically.
#endif