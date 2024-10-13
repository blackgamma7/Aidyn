#ifndef COMMONTYPES_H
#define COMMONTYPES_H

#define dtor 0.017453f
#define INT_MAX_f 2.14748365E9f
#define INT_MAX_d 2.14748365E9d
#define UINT_MAX_d 4.294967296E9d

#define ABS_macro(x) (if((float)x>=INT_MAX_f){x-=INT_MAX_f}) // may just be compiled casting.
#define LE(x) ((u16)x[0] + (u16)x[1] * 0x100) //for the byteswapping in ROM data
#define SQ(x) x*x


#define OFFWHITE {0xe1,0xe1,0xe1,0xff}
#define DARKGRAY {0x32,0x32,0x32,0xff}
#define DARKGRAY_T {0x32,0x32,0x32,0x96}
#define YELLOW_T {0xc8,0xc8,0,0xe1}

enum SCHOOL{
    SCHOOL_CHAOS,SCHOOL_ELEMENTAL,SCHOOL_NAMING,SCHOOL_NECROMANCY,SCHOOL_NONE,SCHOOL_STAR
};

enum DB_TYPE{
	EMPTY, MISC, ENTITY, SPELL, ARMOR, UNK4, SHIELD, WEAPON, CHEST, HELMET, CLOAK, GLOVE, RING, WAND, BELT, BOOTS, POTION, SCROLL, KEYITEM, AMULET, DIALOUGEENTITY
};
#endif