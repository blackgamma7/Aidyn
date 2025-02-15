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
      AnimationData* aniDat;
      Borg7header *b7;
    };
    vec3f pos;
    vec3f loc3Pos;
    float field3_0x1c;
    u32 field4_0x20;
    u32 field5_0x24;
    uint flags;
    u16 field7_0x2c;
    u8 field8_0x2e;
    undefined field9_0x2f;
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
    int field7_0x1c;
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
ushort FUN_80095c04(playerData *,playerData *,u8,s32);
ushort SpellVisuals_InitEffect(playerData *,u32);
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

