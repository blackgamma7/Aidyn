#include "combat/CombatEntity.h"

struct CombatSubstructB {
    int arrayA[18];
    int arrayB[18];
    u8 arrayC[18];
    char field3_0xa2;
    u8 field4_0xa3;
    u8 arrayBCount;
    u8 field6_0xa5;
    char entindex;
    u8 field8_0xa7;
};



void giveCameratoThisPlayer(u8);

//combine into class methods?
//Definitely rename once better understood.

void init_combat_substruct2(CombatSubstructB *,s8);
void NOOP_80072228(CombatSubstructB *);
void clear_substruct2_arrayB(CombatSubstructB *);
void clear_ArrayA(CombatSubstructB *);
void clear_combat_substruc2(CombatSubstructB *);
bool FUN_8007231c(CombatSubstructB *,u8 );
bool clear_arrayB_entry(CombatSubstructB *,u8);
void FUN_800723b8(CombatSubstructB *);
void FUN_80072454(CombatSubstructB *,CombatEntity *);
void FUN_800724f4(CombatSubstructB *,CombatEntity *);
void FUN_800725b4(CombatSubstructB *,CombatEntity *);
void FUN_80072698(CombatSubstructB *,CombatEntity *);
void FUN_8007272c(CombatSubstructB *);
void FUN_80072764(CombatSubstructB *,CombatEntity *);
void ofunc_NOOP(void);
void FUN_80072810(CombatSubstructB *,s8);
void FUN_80072864(CombatSubstructB *,s8);
void FUN_800728c4(CombatSubstructB *,s8);
void Ofunc_80072944(void);
void FUN_8007294c(CombatSubstructB *,CombatEntity*);
void FUN_80072eb4(CombatSubstructB *,u8);
bool FUN_80072ef0(CombatSubstructB *,s8);
void FUN_80072f80(CombatSubstructB *,CombatEntity*);
bool FUN_8007319c(CombatSubstructB *,s32);
void FUN_8007324c(CombatSubstructB *,CombatEntity*,s32);
bool FUN_800732a0(CombatSubstructB *,s32);


