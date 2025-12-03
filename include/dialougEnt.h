#include "itemID.h"

struct DialougeEntity_ROM { /* Dialouge entity in ROM */
    char name[22];
    ItemID_ROM ID;
};
struct DialougEnt_RAM {
    ItemID ID;
    char name[23];
    u8 b;
};

class DialogEntityDB {
    public:
    u8 total;
    DialougEnt_RAM *ents;
    void Orphaned();
    void Load(u8, u32*);
    void Init();
    void Free();
};
struct dialougeEntity_Info { /* extended data of Dialouge entities in RAM */
    u16 index;
    u32 model;
    u32 portrait;
    float a;
    float b;
};
DialogEntityDB* gDialogEntityDBp;
extern u8 DialougEntList[];