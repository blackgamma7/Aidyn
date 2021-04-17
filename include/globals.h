#define dtor 0.017453
#define INT_MAX_f 2.14748365E9
#define INT_MAX_d 2.14748365E9
#define UINT_MAX_d 4.294967296E9



#define ABS_macro(x) (if((float)x>=INT_MAX_f){x-=INT_MAX_f})
#define clear_macro(x) (memset(&x,0,sizeof(x)))

struct{
	byte r;
	byte g;
	byte b;
	byte a;
}Color;

#define OFFWHITE {0xe1,0xe1,0xe1,0xff}
#define DARKGRAY {0x32,0x32,0x32,0xff}


typedef float vec2[2];
typedef float vec3[3];
typedef float vec4[4];
typedef uint rspCom[2]; //placeholder type for Ucode instructions.


extern s16 SkillCheckSteps[22];
/*	{0h, 1Ah, 2Eh, 3Eh, 51h, 60h, 6Fh, 7Ah, 
	85h, 90h, 9Bh, A6h, B1h, BCh, C7h D2h,
	DDh, E8h, F3h, FFh 10Ah, 0h}*/
extern s16 ExpPakFlag; //set when OsMemSize>4MB.

enum WEAPONCLASS{
	BITE, BREATH, CLAW, HAFTED, MISSLE, POLE, SPIT, STING, SWORD, THROWN, TUSK
};

enum ELEMENT{
	NONE, EARTH, SOLAR, PHYSICAL, NECROMANCY, FIRE, LUNAR, NAMING, WATER, MAGIC, AIR, STAR, ELEMENTAL, CHAOS, CUTTING, SMASHING, HOLY
};

enum ASPECT{
	NONE, LUNAR, SOLAR, SOLAR_MAGIC, LUNAR_MAGIC
};

enum CHAR_STAT{
	INT, WIL, DEX, END, STR, STAM, LV, NONE=255
};

enum CHAR_SKILL{
	ALCHEMIST, DIPLOMAT, HEALER, LOREMASTER, MECHANIC, MERCHANT, RANGER, STEALTH, THEIF, TROUBADOR, WARRIOR, WIZARD, NONE=255
};

enum DB_TYPE{
	EMPTY, MISC, ENTITY, SPELL, ARMOR, UNK4, SHIELD, WEAPON, CHEST, HELMET, CLOAK, GLOVE, RING, WAND, BELT, BOOTS, POTION, SCROLL, KEYITEM, AMULET, DIALOUGEENTITY
};

enum POTION{
	FIRE, INFERNO, SLEEP, ACID, HEALING, STAMINA, CURING, ANTIDOTE, RESTORE, STRENGTH, DEXTERITY, A, J, CLARITY, CHARISMA, DEFENCE, STEALTH
}; // A and J are ommited. couple funcs change "A" potions into healing potions automatically.

