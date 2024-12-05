#include "inventory/IInventory.h"

u32 IInventory::HasItem(ItemID id){
    return this->GetItemIndex(id)!=-1;
}
extern ItemID key_item_ids[];
u32 IInventory::HasNoKeyItem(){
    for(u32 i=0;i<21;i++){
        if(this->GetItemIndex(key_item_ids[i])!=-1)return false;
    }
    return true;
}
