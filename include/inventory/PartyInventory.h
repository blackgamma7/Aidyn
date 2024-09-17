#include "inventory/IInventory.h"

#define PARTY_CAPACITY 252
//Inventory class used by the party.
class PartyInventory : virtual public IInventory{
    public:
        virtual ~PartyInventory();
        virtual void Reset();
        virtual void Clear();
        virtual void Load(SaveFile*);
        virtual void Save(SaveFile*);
        virtual s32 AddItem(ItemID id, s32 quantity);
        virtual s32 TakeItem(ItemID id, s32 quantity);
        virtual s32 GetQuantity(); //returns the current ammount of occupied slots
        virtual s32 GetMaxQuantity(); //returns the constant that determines the item array size.
        virtual s32 GetItemIndex(ItemID id); //returns index of item of id, or -1 if unavailable.
        virtual Inventory_item* GetItemEntry(s32 index);
        virtual s32 IncItemQuantity(s32 index, s32 ammount);
        virtual s32 GetItemQuantity(s32 index);
    private:
        Inventory_item inv_slots[PARTY_CAPACITY];
        int quantity;
        s32 AddKeyItem(ItemID id,s32 q);
        s32 AddKeyItem2(ItemID id,s32 q);
        s32 AddKeyEquipment(ItemID id,s32 q);
        s32 search_from_80_items(ItemID id);
        s32 key_item_flags(ItemID id);
        s32 Item_is_in_some_array(ItemID id);
        void Load80Items(SaveFile* sav);
        void LoadKeyItems(SaveFile* sav);
        void LoadLast15Items(SaveFile* sav);
        void Save80(SaveFile* sav);
        void SaveNoop(SaveFile* sav); //save the key items? made redundant by event flag check.
        void Save239(SaveFile* sav);
        void AddNewItem(int slot,ItemID item,s32 quant);
        int search_for_item_in_array(ItemID *array,byte size,ItemID query);
        void ChangeAspectPotions();
};