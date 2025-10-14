#include "shopdb.h"
#include "heapN64.h"
#include "romcopy.h"
#define FILENAME "../data/shopdb.cpp"

extern ArrayHeader shopdb;

void ShopDB::Orphaned() {
  u32 auStack_10 = 0;
  load_db_array_size(&shopdb,&this->total,&auStack_10);
  ALLOCS(this->shops,this->total*sizeof(shop_ram),54);
}

void ShopDB::Load(u8 index,u32 *pos) {
  shop_ROM fromROM;
  
  shop_ram *toRam = this->shops + index;
  ROMCOPYS(&fromROM,(void*)((u32)&shopdb+*pos),sizeof(shop_ROM),71);
  toRam->shopkeep =(fromROM.shopkeep.id|fromROM.shopkeep.type<<8);
  u8 romPos = 2; //dirty hack, not sure mine or theirs
  for(u8 i=0;i<23;i++) {
    toRam->stock[i] = (ItemID)(((u8*)&fromROM)[romPos++]|((u8*)&fromROM)[romPos++]<<8);
    if (i < 20) {
      toRam->multi[0][i] = ((u8*)&fromROM)[romPos++];
      toRam->multi[1][i] = ((u8*)&fromROM)[romPos++];
      toRam->multi[2][i] = ((u8*)&fromROM)[romPos++];
    }
  }
  *pos+=sizeof(shop_ROM);
}

void ShopDB::Init() {
  u32 auStack_18= 0;
  load_db_array_size(&shopdb,&this->total,&auStack_18);
  ALLOCS(this->shops,this->total*sizeof(shop_ram),116);
  for(u8 i=0;i<this->total;i++){Load(i,&auStack_18);}
}

void ShopDB::Free(){HFREE(this->shops,132);}