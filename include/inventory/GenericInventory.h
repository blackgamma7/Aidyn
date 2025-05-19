#include "inventory/IInventory.h"


#define GEN_CAPACITY 64
//Inventory class used by most item sources
class GenericInventory : public IInventory{
    public:
    Inventory_item inv_slots[GEN_CAPACITY];
    int quantity;
    void Reset();
    void Clear();
    void Load(SaveFile*);
    void Save(SaveFile*);
    s32 AddItem(ItemID,s32);
    s32 TakeItem(ItemID,s32);
    s32 GetQuantity();
    s32 GetMaxQuantity();
    s32 GetItemIndex(ItemID);
    Inventory_item* GetItemEntry(s32);
    s32 IncItemQuantity(s32 index, s32 ammount);
    s32 GetItemQuantity(s32 index);
    ~GenericInventory();
};