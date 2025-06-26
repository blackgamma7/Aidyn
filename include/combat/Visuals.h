#include "PlayerData.h"

struct SpellVisualTypeA {
    u32 SpellID;
    uint flags;
    u16 field2_0x8;
    u16 field3_0xa;
    u16 field4_0xc;
    u16 field5_0xe;
    u16 field6_0x10;
    undefined field7_0x12;
    undefined field8_0x13;
};
struct SpellVisualTypeB {
    union{
      SceneData* SceneDat;
      Borg7Header *b7;
    };
    vec3f pos; //position of effect
    vec3f loc3Pos; //position of Locator#3
    float height; //height of associated entity
    u32 borg5Index;
    u32 memNeeded; //estimated memory required for effect
    u32 flags;
    u16 field7_0x2c;
    u8 spellID;
};
struct SpellVisualTypeC {
    playerData *playerDat;
    uint flags;
    s16 field2_0x8;
    s16 timer;
    short field4_0xc;
    short field5_0xe;
    s16 unk10;
    undefined field7_0x12;
    undefined field8_0x13;
};

#define SpellVisCountA 64
#define SpellVisCountB 128
#define SpellVisCountC 16
struct SpellVisuals_struct {
    SpellVisualTypeA *ptr0; 
    SpellVisualTypeB *ptr1; 
    SpellVisualTypeC *ptr2; 
    short *indecies0; 
    short *indecies1; 
    short *indecies2; 
    float field6_0x18;
    int lifespan;
    uint lifeTime;
    u16 field9_0x24;
    u16 field10_0x26;
    u16 ptr0Count;
    u16 ptr1count;
    u16 prt2count;
    u16 field14_0x2e;
    undefined1 field15_0x30;
};

s32 s32_800f1d90=0;
u8 DAT_800f1d94=5;
SpellVisuals_struct SpellVisuals={0};

//rename with "CombatSpellVisuals" namespasce?

void InitSpellVisuals();
void FUN_8009468c(void);
void FUN_800946dc(int);
void clear_SpellVisuals_ptr0_entry(s16);
u16 FUN_800949fc(playerData *);
void FUN_80094b24(short);
void spellvisuals_petrify(short);
void spellvisuals_petrify_2(short );
void FUN_80094c58(short,short);
uint FUN_80094cd0(short);
void FUN_80094e6c(short);
void FUN_80094f40(short);
short FUN_80094fdc(u16,u8,u8);
void FUN_800952c8(short,short,short);
void FUN_800953a8(short);
void FUN_80095414(short);
void processSpellVisuals(uint );
Gfx * FUN_80095a24(Gfx *);
void FUN_80095ad8(short);
u16 FUN_80095c04(playerData *,playerData *,u8,s32);
u16 SpellVisuals_InitEffect(playerData *,u32);
Gfx * FUN_80095f1c(Gfx *,u16);
void FUN_80095f6c(int);
void FUN_80096048(playerData *);
void combatspellvisuals_free(void);

u32 ret0_80096300(void);
s32 FUN_80096308(u8,u32 *);
bool some_spellEnum_bool(u8);
s32 get_spell_borg7(u8 ,u32*);
s32 FUN_80096640(u8 ,u32 *);
s32 FUN_80096800(u8,u32 *);
s32 FUN_800968c4(u8,u32 *);
bool Ofunc_80096928(int);
void noop_800969a4(void);

//CombatPotionEffect.cpp

void NOOP_800941E0();
u16 InitPotionEffect(playerData *param_1,u8 param_2);
Gfx * ret_a0_80094204(Gfx *g);
void FUN_8009420c(int param_1);
void FUN_80094228(playerData *param_1);
void NOOP_80094244();

struct CombatTargetVisual {
    playerData *playerdat_;
    u16 time;
    u8 byte0x5;
    u8 field3_0x7;
};

struct CombatTargetVisualsHandler {
    CombatTargetVisual *pointer;
    u32 entCount;
};

namespace CombatTargetVisuals{
    CombatTargetVisual *Init();
    void Render(bool param_1,short param_2);
    void Free();
}

struct AttackVisualStruct3 {
    Borg7Header *borg7;
    playerData *player;
    vec3f pos;
    u32 unk14;
    uint flag;
};
//Attack visual effects. Initalized, freed, Render func called, but nothing calls Add() to use them. Essentialy unused.
namespace CombatAttackVisuals{
    void Init();
    void Add(playerData *target,u32 param_2);
    Gfx * Render(Gfx *g,uint delta);
    void FreePlayer(playerData *param_1);
    void Free();
    u32 GetAttackActor(u32 param_1);
};