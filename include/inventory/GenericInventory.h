#include "inventory/IInventory.h"


#define GEN_CAPACITY 64
//Inventory class used by most item sources
class GenericInventory : public IInventory{
    Inventory_item inv_slots[GEN_CAPACITY];
    int quantity;
};