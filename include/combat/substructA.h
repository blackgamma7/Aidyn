#include "mathN64.h"

//struct found in main "CombatStruct". needs more study.
struct CombatSubstructA {
    u8 array1[100][100];
    u8 array2[100][100];
    u16 short1;
    u8 byteA;
    u8 byteB;
    u8 byteC;
    u8 byteD;
    char byteE;
    u8 field8_0x4e27;
};

//combine into class methods?
//Definitely rename once better understood.

void init_combat_substruct(CombatSubstructA*,u8);
void NOOP_80070c94(CombatSubstructA*);
char get_byte_A_min1(CombatSubstructA*);
char get_combatSubstruct_byte_B_min1(CombatSubstructA*);
char get_byte_E(CombatSubstructA*);
int FUN_80070cc4(CombatSubstructA*,u8,u8,u8,u8);
bool FUN_80070dac(CombatSubstructA*,u8,u8,u8,u8);
bool combat_substruct_lookup(CombatSubstructA*,u8,u8,u8);
bool FUN_80070ee4(CombatSubstructA*,u8,u8,u8);
bool FUN_80070fa0(CombatSubstructA*,u8,u8,u8);
bool FUN_8007102c(CombatSubstructA*,u8,u8,u8,u8);
bool FUN_8007105c(CombatSubstructA*,u8,u8,u8,u8);
void FUN_800713fc(CombatSubstructA*,u8,u8,u8);
void FUN_800714d0(CombatSubstructA*,u8,u8,u8);
void FUN_800715a4(CombatSubstructA*);
void FUN_800715d8(CombatSubstructA*);
bool FUN_800716b4(CombatSubstructA*,vec3f*,vec3f*,u8,u8);
void FUN_800718f0(CombatSubstructA *,u8,s8*,s8*);
int FUN_80071974(CombatSubstructA *,s8,s8,s16,u8*);
bool FUN_80071d2c(CombatSubstructA *,u8,u8,u8,u8,s16*,u8);
uint FUN_80071e84(CombatSubstructA *,u16*);
uint FUN_80071ec4(CombatSubstructA *,u8,u8,u8,u8,u8,u8(*) [2]);
void Ofunc_8007216c(CombatSubstructA *,u8*,u8*,u8,u8);

#define unk800714d0(CEnt) FUN_800714d0(&gCombatP->substruct,CEnt->GetCoordXU8(),CEnt->GetCoordYU8(),CEnt->unk23)