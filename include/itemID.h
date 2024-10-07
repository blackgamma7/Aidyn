#include "typedefs.h"

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


u8 ItemIsMap(ItemID param_1);
int getIDIndex_sub(char *param_1,u8 total,char param_3);
u16 GetIDIndex(ItemID x);
u16 search_item_array(ItemID param_1);
ItemID Ofunc_80075f9c(byte param_1);