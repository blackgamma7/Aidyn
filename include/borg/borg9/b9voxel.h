#include "borg/borg7.h"
#include "itemID.h"

typedef enum VoxelFllags {
    VOXEL_JumperPak=0x20, //activate if no Expansion Pak
    VOXEL_EXPPak=0x40, //activate if Expansion Pak
    VOXEL_CheckFlagC=1<<7, //header.FlagC state ^ this bit
    VOXEL_Flag100=1<<8,
    VOXEL_Used=0x200,
    VOXEL_Flag400=0x400,
    VOXEL_Flag800=0x800,
    VOXEL_Flag1000=0x1000,
    VOXEL_Tangible=0x2000, //touching voxel activates it
    VOXEL_Flag4000=0x4000, //unknown
    VOXEL_Active=0x8000 //map object is active/visible
} VoxelFllags;


typedef enum Vobject {
    VOXEL_Scene, //Meshes/decal
    VOXEL_Container, //loot (chests, sacks, ingredient resources)
    VOXEL_Light, //dir.Light source
    VOXEL_Audio, //SFX/BGM source
    VOXEL_WanderNode, //NPC's use for pathfinding.
    VOXEL_MonsterParty, //NPC's and enemy encounters
    VOXEL_ReferencePoint, //used as locators for other objects
    VOXEL_Teleporter, // moves player when interacted (door, ladder, teleports)
    VOXEL_Camera, //dynamic camera changer,
    VOXEL_Dialouge, //cutscene/dialouge/literature trigger.
    VOXEL_Trigger, //can be several kinds of trigger
    VOXEL_SavePoint, // unused, but mentioned in text (can save anywhere.)
    VOXEL_Code // one in the corner of each map chunk. (unused?)
} Vobject;

struct voxelHeader {
    vec3f pos; /* Where is it */
    f32 size; /* how big is it */
    u32 timestamp; /* when was it called */
    u16 Bitfeild; /* Flags for rendering */
    u16 type; /* object type */
    s16 LinkID[2]; //index of linked voxel(s) (usually -1 aka none)
    u16 flagA; /* event flags */
    u16 flagB;
    u16 flagC;
    void *ptr0x24;//may be dynaLightEntry*. used exclusively by dynamic lights
};

enum TreasureType{
 Treasure_Chest, //should appear as a typical treasure chest
 Treasure_Bag, // should appear as a sack
 Treasure_Box, // should appear as a crate
 Treasure_Barrel, // should appear as a barrel.
 Treasure_Herb, // should appear as a clover patch. Gives only herbs based on Ranger skill
 Treasure_Spice, // should appear as a pepper plant. Gives only spices based on Ranger skill
 Treasure_Gem, // should appear as a gem vein. Gives only gemstones based on Ranger skill
 Treasure_Misc // custom model for loot.
};

struct container_Dat {
    u32 unk0x0;
    float chestSize; /* seems identical to header.size */
    u16 openFlag;
    u16 explodeFlag;
    s16 trap_lv;
    u16 unk0x14;
    ItemID LootCat; /* chestdb id */
    u16 LootType; // uses TreasureType
    u8 LockLV[2];
    u16 Gold; /* money */
    ItemID item; /* static item */
    u16 unk1A; /* align? */
    s16 lootCatDrop[6][2]; /* populated with chestdb items */
    u8 field13_0x34[16]; //align?
};

struct teleport_dat {
    u16 MapDatA;
    u16 MapShort1;
    u16 MapShort2;
    u16 refPoint_Pos;
    s16 trap_value;
    u16 trapBool16;
    u16 lock_lv;
    u16 refPoint_Cam;
    u16 lock_flag;
    u16 lockpick_flag_2;
    u16 TrapFlag;
    u16 trapDisarmFlag;
    u16 secrect_door_flag;
    u16 secretDoorVal; /* skill check */
    char name[16];
    u8 unk0x54[24]; /* align bytes */
};

struct SceneVoxelModel {
    float renderProx; //draw distance of model
    u32 borgIndex; // index of model
    union{ //common enough union to abstract?
    Borg7Header *b7; //used if SceneObj_B7 is set
    SceneData* sceneDat; //used if SceneObj_B7 is unset
    };
};

enum SceneObjFlag{
    SceneObj_0001=1,
    SceneObj_B7=2, //uses Borg7 index instead of Borg5
    SceneObj_0004=4,
    SceneObj_0008=8,
    SceneObj_Tint=0x10, //uses "tint" field
    SceneObj_Fullbright=0x20,
    SceneObj_0040=0x40,
};

struct Scene_obj_dat {
    SceneVoxelModel borgArray[3];
    vec3f rotation;
    vec3f scale;
    Color32 tint;
    u16 BorgCount;
    u16 sceneflags; //uses SceneObjFlag
};

struct monsterpartyEntry {
    ItemID enemyID;
    u8 min;
    u8 max;
};

struct Wandernode_dat {
    vec2f startCoords;
    float wanderradius;
    float PosRandom;
    float field3_0x10;
    u16 field4_0x14[2];
    u16 NodeSiblings[2];
    u8 field6_0x1c[40];
};

enum LightTypes{
    Light_Static, // light remains one color
    Light_Alternate, // light alternates between colors
    Light_Sine, // light changes color based on sine function
    Light_Random //light's color "flickers" between two values
};

struct light_dat{
    Color32 cols[3]; //first seems to be used for blending.
    u16 lightType; //use LightTypes enum
    u16 pad;
    float f0; //blend factor, changes per type.
    float f1; //blend speed,bigger is slower
    float f2; //used in light type 3 for rng lerp.
    u8 align[40];
};

struct dynaLightEntry{
    s16 index;
    s16 active;
    s16 lifespan;
    s16 timer;
};
struct DynamicLightHead {
    voxelObject lights[16];
    dynaLightEntry shortsA[16];
    s16 shortsB[16];
    s16 dynamicLightCount;
    s16 initFlag;
};

enum VoxAudioFlags{
    VoxAudio_0001=1, //repeat sound?
    VoxAudio_0002=2, //if set, repeat sound for between (randA) and (randB) seconds
    VoxAudio_0004=4, //don't fade volume based on delta
    VoxAudio_0008=8, //don't pan sound based on camera
    VoxAudio_BGM=0x10, //treat as BGM, use applicable volume setting
};

struct audio_obj_dat {
    u32 borg12Index;
    u32 unk0x4;
    float volume;
    float randA;
    float randB;
    u16 soundFlag; //uses VoxAudioFlags
    
    //these are set in-game, it seems

    u16 unk16;
    float volumeFade;
    u32 pan;
    s32 dcmId;
    u16 unk24;
    u8 dcmIndex;
};

struct wandernode_dat{
    vec2f startCoords;
    float wanderRadius;
	float randVal;
	float NodeChangeChance;
	u16 Timer; //frame ticks before changing nodes.
    u16 nodeflags; //only first 3 bits used, it seems.
    u16 NodeSiblings[2]; //indecies of sibling nodes on map chunk.
    u8 align[40];
};
struct monsterparty_dat {
    struct monsterpartyEntry enemyEntries[8];
    ItemID entityID; //avatar of party or NPC
    ItemID globalLoot;
    u16 wandererIndex;
    u8 unk0x26;
    u8 unk0x27;
    u16 minsize;
    u16 maxsize;
    ItemID unk0x2c; //usually mirror of entityID.
    u16 wanderNode; //index on map chunk.
    u16 flags;
    u8 unk0x32;
    u8 unk0x33;
    u32 borg_13;
};

struct referencepoint_dat{//used as locators for tp's, camera's dialouge scripts, spawners, ect.
    u16 refpointID;
    u16 pad;
    char name[16];
    vec3f position; //used in tp for facing?
    u8 align[36];
};

enum CamObjFlags{
    CamOBJ_MoveCut=1, //instantly change camera angle
    CamOBJ_MovePan=2,
    CamOBJ_MoveSine=4,
    CamOBJ_0008=8,
    CamOBJ_0010=0x10,
    CamObj_M001f=CamOBJ_0010|CamOBJ_0008|CamOBJ_MoveSine|CamOBJ_MovePan|CamOBJ_MoveCut,
    CamOBJ_0020=0x20,
    CamOBJ_0040=0x40,
    CamOBJ_0080=0x80,
    CamOBJ_0100=0x100,
    CamOBJ_0200=0x200,
    CamOBJ_0400=0x400,
    CamOBJ_0800=0x800,
    CamOBJ_1000=0x1000,
    CamOBJ_TrackOn=0x2000,
    CamOBJ_CopyAim=0x4000, //copy target of camera
    CamOBJ_CopyPos=0x8000, //copy posittion of camera
};

struct voxelCamera {
    s16 refpoint_ID; //used as inital aim for camera.
    u16 CameraFlags; //uses CamObjFlags
    u32 timestamp;
    vec3f vec3_A;
    vec3f vec3_b;
    vec3f vec3_C;
    float unk0x54;
    u8 align[20];
};

struct dialoug_dat {
    u16 borg_13;
    u16 MapDatA;
    u16 MapShortA;
    u16 MapShortB;
    u16 RefPointID;
    u16 unk0xA;
    char name[56];
};

enum VObject_Triggers{
    VTrigger_0,//unused?
    VTrigger_SetFlag, //set flag (trigger.flagA)
    VTrigger_ChangeAni, //changed linked Voxel's Borg7 animation to (trigger.flagA)
    VTrigger_3, //unused. checked in case-switch with no effect
    VTrigger_BorgPhys, //if (borgphys->groundType>>5&0x7f==trigger.flagA),borgphys->flags=borgphys->flags&(trigger.flagB)|(trigger.flagC)
    VTrigger_5, //unused. checked in case-switch with no effect
};

struct Trigger_dat {
    s16 triggertype; // uses VObject_Triggers
    u8 unk0x2;
    u8 unk0x3;
    u16 flagA;
    u16 flagB;
    u16 flagC;
};

struct voxelObject {
    voxelHeader header;
    union{
        Scene_obj_dat scene;
        container_Dat container;
        light_dat light;
        audio_obj_dat audio;
        wandernode_dat wander;
        monsterparty_dat monster;
        referencepoint_dat refpoint;
        teleport_dat teleport;
        voxelCamera camera;
        dialoug_dat dialoug;
        Trigger_dat trigger;
        u8 dat[68]; //"CODE" is usually blank, "SAVEPOINT" is never used (you can save anywhere.)
    };
};