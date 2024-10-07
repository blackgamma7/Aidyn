#include "itemID.h"

enum PRICE_MULTI{HALF, QUARTER_OFF, FULL, QUARTER_PLUS, HALF_PLUS, DOUBLE, TRIPLE, FIVE_X};

struct price_mod {
   u8 unk0;
   u8 multi;
   u8 unk2;
};

struct ShopItem { // Shop Item listing with 3 mystery bytes
    ItemID_ROM item;
    struct price_mod mod;
};

struct shop_ROM { // Shop Data in Rom
    ItemID_ROM shopkeep; // Which entity runs the shop
    struct ShopItem longItem[20]; // each entry has 3 mystery bytes
    ItemID_ROM shortItem[3]; // these do not.
};

struct{
	ItemID shopkeep;
	itemID stock[23];
	u8[3][20] multi; //2d array gets rotated awkwardly, for some reason. multi[1][x] is price multiplier.
}shop_ram;

struct{
	u8 total;
	u8 pad[3];
	shop_ram* shops;
}shop_pointer;

void loadShopDB(shop_pointer *param_1,u32 param_2,s32 *param_3);
void build_shopDB(shop_pointer *param_1);
void Shopdb_free(shop_pointer *param_1);