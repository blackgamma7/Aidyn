#include "GhidraDump.h"
#include "collide.h"
#include "Controller.h"

typedef enum PLAYERDATA_Flags {
    ACTOR_ISPLAYER=1,
    ACTOR_2=2,
    ACTOR_4=4,
    ACTOR_WALKONLY=8,
    ACTOR_CANMOVE=0x10,
    ACTOR_CANROTATE=0x20,
    ACTOR_40=0x40,
    ACTOR_80=0x80,
    ACTOR_100=0x100,
    ACTOR_200=0x200,
    ACTOR_400=0x400,
    ACTOR_800=0x800,
    ACTOR_1000=0x1000,
    ACTOR_2000=0x2000,
    ACTOR_4000=0x4000
} PLAYERDATA_Flags;

//Main actor struct for entites moving n world
struct playerData {
    u16 ID;
    short removeFlag;
    Borg7header *locator_pointer;
    AnimationData *anidat;
    u32 borg7;
    u32 nextBorg7;
    short ani_type;
    undefined field7_0x16;
    undefined field8_0x17;
    short field9_0x18;
    undefined field10_0x1a;
    undefined field11_0x1b;
    undefined field12_0x1c;
    undefined field13_0x1d;
    u16 flags;
    vec2f facing;
    vec2f facingMirror;
    float interactRadiusA;
    float interactRadiusB;
    float combatRadius;
    vec3f vec3_0x3c;
    vec3f vec3_0x48;
    u32 field22_0x54;
    float field23_0x58;
    float unk5c;
    u16 field25_0x60;
    collisionSphere collision;
    vec3f positionMirror;
    EnvProp envprop;
    collisionTypeA colTypeA;
    SpeedProperty colTypeB;
    ushort Ground_type;
    ushort Ground_Type_New;
    short field35_0x104;
    undefined field36_0x106;
    undefined field37_0x107;
    float field38_0x108;
    float voxelReach; /* 100f default */
    vec3f voxelCoords;
    ControllerFull controller;
    u32 buttonMask;
    MoveQueueEntry moveQueue[16];
    short moveQueueIndex;
    ushort moveQueueIndex2;
    float aiDestDist;
    short aiTravelTime;
    undefined field48_0x25e;
    undefined field49_0x25f;
    vec2f aiDest;
    float wanderRadius;
    vec2f field52_0x26c;
    vec3f combat_vec3;
    float combatMoveSpeed;
    u32 unk284; /* unused? */
    PlaneObj shadow;
    u8 unused518[496];
    short field58_0x708;
    u8 visible_flag;
    u8 alaron_flag;
    char unk70c;
    u8 zoneDatByte;
    u8 unk70ee;
    undefined field64_0x70f;
    DCMSub2 dcmDat[2];
    short dcmDatIndex;
    ushort movement_;
    ushort spellUsed;
    undefined field69_0x72e;
    undefined field70_0x72f;
    attachmentNode attachmentNodes[3];
    ushort rangerWarrior;
    ItemID ent_ID;
    ushort Ent_index;
    undefined field75_0x75a;
    undefined field76_0x75b;
    float unk75c;
    float unk760;
    vec3f CombatTint; /* tint by combat effect */
    vec3f skyTint; /* tint from environmental light */
    char field81_0x77c;
};