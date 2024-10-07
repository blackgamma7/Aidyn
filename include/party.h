#include "entity.h"
#include "inventory/PartyInventory.h"

#define MAXPARTY 4
class Party { /* holds party and inventory data */
    public:
    CharSheet *Members[MAXPARTY]; /* pointer to party members */
    PartyInventory *Inventory;
    u32 Gold; /* moneyz */
    u32 timeSneaking;
    u32 timeWalking;
    u32 TimeRunning;
    u8 PartySize; /* how big is the party? */
};