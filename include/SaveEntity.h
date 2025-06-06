#include "party.h"
#include "heapN64.h"

CharSheet** gSaveEntity=0;
#define SAVEENTSIZE 9

namespace SaveEntity{
    void Init();
    void Free();
    void BenchParty(Party *);
    CharSheet* GetMember(u16 x);
    void EraseEntry(u16 x);
    void LoadMember(CharSheet *,u16);
    void EraseEntityOfID(ItemID);
    void CopyMember(CharSheet *);
    CharSheet * InitEntity(ItemID param_1);
    void TransferArmor(CharSheet *,CharSheet *,u8);
    void TransferWeapons(CharSheet *param_1,CharSheet *param_2);
    void TransferGear(CharSheet *param_1,CharSheet *param_2,u8 param_3);
    void TransferSpells(CharSheet *param_1,CharSheet *param_2);
    char * Copy(CharSheet *param_1,CharSheet *param_2);
    void BenchInSlot(CharSheet *param_1);
    u8 GetSlot(ItemID param_1);
    void IDK_NOOP();
    
};