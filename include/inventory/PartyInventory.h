#include "inventory/IInventory.h"

#define PARTY_CAPACITY 252
//Inventory class used by the party.
class PartyInventory :public IInventory{
    Inventory_item inv_slots[PARTY_CAPACITY];
    int quantity;
};