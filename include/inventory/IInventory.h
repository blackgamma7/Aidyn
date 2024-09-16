#include "GhidraDump.h"

//base interface for inventory system
class IInventory{
    public:
    virtual void Reset();
    virtual void Clear();
    virtual void Load(SaveFile*);
    virtual void Save(SaveFile*);
    virtual s32 AddItem(ItemID id, s32 quantity);
    virtual s32 TakeItem(ItemID id, s32 quantity);
    virtual s32 GetQuantity();
    virtual s32 GetMaxQuantity();
    virtual s16 GetItemIndex(ItemID id);
    virtual Inventory_item * GetItemEntry(u32 index);
    virtual s32 IncItemQuantity(s32 index, s32 ammount);
    virtual s32 GetItemQuantity(s32 index);
};