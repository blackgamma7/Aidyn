#include "typedefs.h"
#include "itemIDList.h"

typedef u16 ItemID;

//ItemID endian swapped
typedef struct{
    union {
        u16 s; //often loaded as short
        struct{
            u8 id;
            u8 type; // from DB_TYPE
        };
    };
}ItemID_ROM; //LE version

struct ArrayHeader { /* ROM Db array Header */
    u8 Size; /* number of items in array */
    u8 unk[3]; //junk bytes
};

u8 load_db_array_size(ArrayHeader *header,u8 *size,u32 *offset);

typedef enum ElementEnum {
	ELEMENT_NONE, ELEMENT_EARTH, ELEMENT_SOLAR, ELEMENT_PHYSICAL, ELEMENT_NECROMANCY,
    ELEMENT_FIRE, ELEMENT_LUNAR, ELEMENT_NAMING, ELEMENT_WATER, ELEMENT_MAGIC,
    ELEMENT_AIR, ELEMENT_STAR, ELEMENT_ELEMENTAL, ELEMENT_CHAOS, ELEMENT_CUTTING, 
    ELEMENT_SMASHING, ELEMENT_HOLY
} ElementEnum;

typedef enum AspectEnum {
    ASPECT_NONE,
    ASPECT_LUNAR,
    ASPECT_SOLAR
} AspectEnum;

#define ITEMIDTYPE(x) x >> 8


u8 ItemIsMap(ItemID param_1);
int getIDIndex_sub(u8 *param_1,u8 total,u8 param_3);
u16 GetIDIndex(ItemID x,char* file, u32 line);
u16 search_item_array(ItemID param_1);
ItemID Ofunc_80075f9c(u8 index);
u16 Weapon_borg5_lookup(u8 index);
u16 GetWeaponBorg5(ItemID param_1);
u16 GetArmorBorg5(ItemID param_1);
u16 ItemBorg5Search(ItemID param_1);
u16 get_item_borg5(ItemID param_1);

//a leftover from older builds - two of the args were filename and line called.
//both were 0 by the final debug build. 
#define GETINDEX(x) GetIDIndex(x,NULL,0)