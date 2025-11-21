#include "combat/CombatEntity.h"

struct CombatTurn_s {
    u8 unk0;
    u8 unk1;
    u8 unk2[2]; //align?
    u32 unk4;
    u8 *arr;
};

//redo as class? FUN_800737b4 seems the only odd one out.
namespace CombatTurn{
    void FreeArray(CombatTurn_s*);
    void Init(CombatTurn_s*);
    void FUN_800737b4(CombatEntity*);
    bool FUN_8007381c(CombatTurn_s*);
    void PartyDead(CombatTurn_s*);
    void EnemiesDead(CombatTurn_s*);
    void CountFighters(CombatTurn_s*);
    bool IsBattleOver(CombatTurn_s*);
    void StartTurn(CombatTurn_s*,CombatEntity *,u8);
    void FUN_80073e3c(CombatTurn_s*);
    void FUN_80074054(CombatTurn_s*);
};