#include "GhidraDump.h"
#include "savefiles.h"

//base interface for inventory system
class IInventory{
    public:
    virtual ~IInventory(){};
    virtual void Reset(){};
    virtual void Clear(){};
    virtual void Load(SaveFile*){};
    virtual void Save(SaveFile*){};
    virtual s32 AddItem(ItemID id, s32 quantity){};
    virtual s32 TakeItem(ItemID id, s32 quantity){};
    virtual s32 GetQuantity(){}; //returns the current ammount of occupied slots
    virtual s32 GetMaxQuantity(){}; //returns the constant that determines the item array size.
    virtual s32 GetItemIndex(ItemID id){}; //returns index of item of id, or -1 if unavailable.
    virtual Inventory_item * GetItemEntry(s32 index){};
    virtual s32 IncItemQuantity(s32 index, s32 ammount){};
    virtual s32 GetItemQuantity(s32 index){};
    u32 HasItem(ItemID x);
    u32 HasNoKeyItem();
};

struct Inventory_item {
    ItemInstance base;
    s32 Quantity;
};