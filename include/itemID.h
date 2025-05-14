#include "typedefs.h"
#include "itemIDList.h"

typedef u16 ItemID;

typedef struct{
    union {
        u16 s; //often loaded as short
        struct{
            u8 id;
            u8 type; // from DB_TYPE
        };
    };
}ItemID_ROM; //LE version

typedef enum ElementEnum {
	ELEMENT_NONE, ELEMENT_EARTH, ELEMENT_SOLAR, ELEMENT_PHYSICAL, ELEMENT_NECROMANCY,
    ELEMENT_FIRE, ELEMENT_LUNAR, ELEMENT_NAMING, ELEMENT_WATER, ELEMENT_MAGIC,
    ELEMENT_AIR, ELEMENT_STAR, ELEMENT_ELEMENTAL, ELEMENT_CHAOS, ELEMENT_CUTTING, 
    ELEMENT_SMASHING, ELEMENT_HOLY
} ElementEnum;



#define ITEMIDTYPE(x) x >> 8


u8 ItemIsMap(ItemID param_1);
int getIDIndex_sub(char *param_1,u8 total,char param_3);
u16 GetIDIndex(ItemID x);
u16 search_item_array(ItemID param_1);