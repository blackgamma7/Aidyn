#include "entity.h"
#include "inventory/PartyInventory.h"

#define MAXPARTY 4
class Party { /* holds party and inventory data */
    public:
    CharSheet *Members[MAXPARTY]; /* pointer to party members */
    PartyInventory *Inventory;
    u32 Gold; /* moneyz */
    u32 timeSneaking; //measures time in sneak pose % 5 minutes. 
    u32 timeWalking; //measures time walking % 30 minutes,
    u32 TimeRunning; //measures time running % 10 minutes.
    u8 PartySize; /* how big is the party? */
    
    void Init();
    void Free();
    void CheckFlags(ItemID,u8,u8);
    void CheckDeaths();
    u8 AddMember(ItemID);
    u8 isMemberUnequipped(u8);
    CharSheet* GetMemberById(ItemID);
    CharSheet* GetMemberById2(ItemID,u8*);
    void MoveCharSheet();
    s8 GetMemberIndex(ItemID id);
    void removeAliveMemberByID(ItemID);
    void RemoveAliveMember(s8);
    void RemoveAllMembers();
    u8 IsCharacterInParty(ItemID);
    void BringOutYourDead();
    void ScoochMembers();
    void StripMember(u8,u8);
    void RemoveMember(u8,u8);
    u8 HasEntity(CharSheet*);
    u32 GetAvgLevel();
    void ClearInventory();
    u8 GetEquipError2(u8);
    u8 CombatItemCheck1(CharSheet*,u8,ItemID);
    u8 GetEquipError(u8,char,ItemID*);
    bool UseScroll(u8,GearInstance *,CharSheet *);
    u8 RemoveGearFrom(u8,u8);
    u8 RemoveWeaponsFrom(u8);
    u8 RemoveArmorFrom(u8);
    u8 RemoveShieldFrom(u8);
    s32 DiplomatCheck();
    s32 LoremasterCheck();
    u32 UnusedLoremasterCheck();
    u8 ArmorCraftCheck(s8);
    u32 UnusedMechanicCheck(u8);
    float Barter(u8,u8);
    u8 AmbushDamage();
    u32 UnusedRangerCheck();
    u8 UnusedRangerCheck3();
    u8 GetMemberRangerIntStam(u8);
    


   u8 CraftArmor(char param_2,s16 param_3,ItemID material,u8 stam);
   u8 UnequipMemberItemOfID(s32 param_2,ItemID param_3);
};
//party pointer shorthand
#define PARTY gGlobals.party

char** equip_error_labels=NULL;
char** task_failure_labels=NULL;
struct itemtype_func {
    u8 type;
    s32 unk;
    u8 (* func)(Party*,u8,ItemInstance*,CharSheet*,ItemID*);
};