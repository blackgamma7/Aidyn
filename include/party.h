#include "entity.h"
#include "inventory/PartyInventory.h"

#define MAXPARTY 4
class Party { /* holds party and inventory data */
    public:
    struct CharSheet *Members[MAXPARTY]; /* pointer to party members */
    struct PartyInventory *Inventory;
    uint Gold; /* moneyz */
    uint timeSneaking;
    uint timeWalking;
    uint TimeRunning;
    u8 PartySize; /* how big is the party? */
}