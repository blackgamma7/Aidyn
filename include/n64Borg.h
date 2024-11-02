#include "mathN64.h"

/*"Borg" files are the art/level/cutscene assets of the game, in 15 different categories:
0-Unused, therefore, unknown. init/free code still ingame.
1-Textures. use some compression method.
2-Geometry data. conatins verts and ucode (primariliy G_TRI1)
3-Scene perspective data (fov,clipping planes, ect.)
4-3 floats, 8 more bytes. no clue what they're for
5-Model data. uses the aformentioned types.
6-animation data.
7-Actor models.
8-Images. used for UI, primarily. Easily viewable in Texture64 when extracted.
9-Map data. contains collision and object data
10-unused. refered internally in Debug as "CollisionMaterial"
11-DCM instrument for SFX and BGM
12-Sound/music.
13-Dialogue/cutscenes.
14-unused. refered internally in Debug as "GameState"*/

typedef enum Borg8Format {
    BORG8_RBGA32=1,
    BORG8_RGBA16=2,
    BORG8_CI8=4,
    BORG8_IA8=5,
    BORG8_CI4=7
} Borg8Format;

struct borgHeader {
    int index;
    u32 unk;
};

struct Borg8dat {
    u16 format;
    u16 Width;
    u16 Height;
    u16 PALSize;
    u16* palette; //for CI8/4
    void* offset;
};

struct Borg8header {
    struct borgHeader index;
    struct Borg8dat dat;
};

//borg 9 data structs.
struct Borg_9_data{
    vec3f floatsA; /* position? */
    vec2f floatsB; /* size? */
    u8 unk1[6]; /* seems unused */
    u8 byte0x1a;
    u8 byte0x1b;
    u16 shortA;
    u16 shortB;
    u8 unk[2];
    u16 Vertex_count;
    u16 borghpys_count;
    u16 unk0x26;
    u16 voxelCount;
    u16 unkStructCount;
    s16 * counting_pointer;
    s32 someint;
    s16 * pointer2;
    vec3f* Verticies;
    struct borg9_phys * phys_pointer;
    s32 someInt_2;
    voxelObject* ref_objs; 
    struct borg_9_struct * unkStructs;
};


struct borg9_phys { //collision faces
    vec3f * VertexEntries[3];
    vec3f vec3_0xc; //face normal?
    void * ptr_0x18;
    u16 unk0x1c; //flags?
    u16 GroundType; //for footstep noises
};

typedef enum VoxelFllags {
    VOXEL_JumperPak=0x20, //activate if no Expansion Pak
    VOXEL_EXPPak=0x40, //activate if Expansion Pak
    VOXEL_FlagC=0x80,
    VOXEL_Used=0x200,
    VOXEL_FlagB=0x1000,
    VOXEL_tangible=0x2000,
    VOXEL_Active=0x8000
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

struct voxelHeader { /* Header for Refernce objects (Voxels) */
    vec3f pos; /* Where is it */
    f32 size; /* how big is it */
    u32 timestamp; /* when was it called */
    u16 Bitfeild; /* Flags for rendering */
    u16 type; /* object type */
    short LinkID[2]; /* usually 0xFFFFFFFF (none) */
    u16 flagA; /* event flags */
    u16 flagB;
    u16 flagC;
    void *ptr0x24;
};

struct container_Dat {
    u32 unk0x0;
    float chestSize; /* seems identical to header.size */
    u16 openFlag;
    u16 explodeFlag;
    short trap_lv;
    u16 unk0x14;
    ItemID LootCat; /* chestdb id */
    u16 LootType;
    u8 LockLV[2];
    u16 Gold; /* money */
    ItemID item; /* static item */
    u16 unk1A; /* align? */
    short lootCatDrop[6][2]; /* populated with chestdb items */
    u8 field13_0x34[16];
};

struct teleport_dat {
    u16 MapDatA;
    u16 MapShort1;
    u16 MapShort2;
    u16 refPoint_Pos;
    short trap_value;
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
    undefined unk0x54[24]; /* align bytes */
};

struct SceneVoxelModel {
    float renderProx;
    u32 borgIndex;
    struct Borg7header *borgheader;
};

struct Scene_obj_dat {
    struct SceneVoxelModel borgArray[3];
    struct vec3f rotation;
    struct vec3f scale;
    Color32 tint;
    u16 BorgCount;
    u16 sceneflags;
};

struct monsterpartyEntry {
    ItemID enemyID;
    u8 min;
    u8 max;
};

struct monsterparty_dat {
    monsterpartyEntry enemyEntries[8];
    ItemID entityID;
    ItemID globalLoot;
    u16 field3_0x24;
    undefined field4_0x26;
    undefined field5_0x27;
    u16 field6_0x28;
    u16 totalsize;
    ItemID field8_0x2c;
    u16 wanderNode;
    u16 flags;
    undefined field11_0x32;
    undefined field12_0x33;
    u32 borg_13;
    u8 align[12];
};

struct Wandernode_dat {
    struct vec2f startCoords;
    float wanderradius;
    float PosRandom;
    float field3_0x10;
    u16 field4_0x14[2];
    u16 NodeSiblings[2];
    u8 field6_0x1c[40];
};

/* Sceneflags id'd
0001
0002
0004
0008
0010=use tinting.
0020=tint with sunlight
doesn't seem to use all 16 bits.*/


struct light_dat{
    Color32 cols[3]; //first seems to be used for blending.
    u16 lightType; //4 valid types. {static(use only cols[1]),alternating blend,sinewave blend,random blend}
    u16 pad;
    float f0; //blend factor, changes per type.
    float f1; //blend speed,bigger is slower
    float f2; //used in light type 3 for rng lerp.
    u8 align[40];
};

struct audio_obj_dat {
    u32 borg12Index;
    u32 unk0x4;
    float volume;
    u16 unk0xc;
    u8 unk0xe;
    u8 unk0xf;
    float unk0x10;
    u16 AudioFlags;
    //these are set in-game, it seems
    u16 unk0x16;
    float volume_;
    u32 sfx_arg3;
    u32 unk0x20;
    u16 unk0x24;
    u8 dcmIndex;
    u8 align[29];
};
/* AudioFlags id'd
0001=loop
0002
0004
0008=Don't diminish by distance
0010=BGM
doesn't seem to use all 16 bits.*/
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
    u16 unk0x28;
    u16 totalsize;
    ItemID unk0x2c; //usually mirror of entityID.
    u16 wanderNode; //index on map chunk.
    u16 monsterpartyFlags;
    u8 unk0x32;
    u8 unk0x33;
    u32 borg_13;
    u8 align[12];
};

struct referencepoint_dat{//used as locators for tp's, camera's dialouge scripts, spawners, ect.
    u16 refpointID;
    u16 pad;
    char name[16];
    vec3f position; //used in tp for facing?
    u8 align[36];
};



struct camera_dat {
    s16 refpoint_ID; //used as inital aim for camera.
    u16 CameraFlags; //bitfeild in need of later documentation.
    u32 timestamp;
    vec3f vec3_A;
    vec3f vec3_b;
    vec3f vec3_C;
    float unk0x54;
    u8 align[20];
};

struct dialoug_dat {
    ushort borg_13;
    ushort MapDatA;
    ushort MapShortA;
    ushort MapShortB;
    ushort RefPointID;
    ushort unk0xA;
    char name[56];
};

struct Trigger_dat {
    s16 triggertype; // 1,2,4 are valid
    u8 unk0x2;
    u8 unk0x3;
    u16 flagA;
    u16 flagB;
    u16 flagC;
    u16 unk0xa;
    s16 unk0xc;
    u8 unk0xe[6];
    u16 unk0x14;
    u16 unk0x16;
    u32 unk0x18;
    char name[16];
    u8 align[24];
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
        camera_dat camera;
        dialoug_dat dialoug;
        Trigger_dat trigger;
        u8 dat[68]; //"CODE" is usually blank, "SAVEPOINT" is never used (you can save anywhere.)
    };
};

typedef enum BORG1type {
    B1_RGBA16,
    B1_IA16,
    B1_CI8,
    B1_IA8,
    B1_UNK4,
    B1_CI4,
    B1_UNK6,
    B1_I4,
    B1_RGBA32
} BORG1type;


struct Borg1header {
    int id;
    int field1_0x4;
    union{
        void* bitmapA;
        u8* bitmapA8;
        u16* bitmapA16;
        Color32*  bitmapA32;
        };
    u8 *bitmapB;
    Borg1Data *dat;
};

struct Borg3Data {
    u32 index;
    u8 unk4[4];
    u16 perspnorm[2];
    int *unkc;
    float unk10;
    float fovy;
    float nearplane;
    float farplane;
    float unk20;
    float aspect;
    s16 *unk28;
    Mtx *mtx_;
};

struct Borg5data {
    s32 substructCount;
    s32 borg4Count;
    s32 borg2Count;
    u32 borg1Count;
    s32 aniTextureCount;
    u32 unk0x14;
    borg5substruct *someSubstruct;
    u32 unused1c; //at least, unused according to Ghidra.
    void* unused20; //pointer to unused data?
    union{
        s32 borg3i;
        Borg3Data *borg3P;
        };
    u32 *borg4Indecies;
    borg2header **borg2Indecies;
    Borg1header **borg1Indecies;
    void * aniTextures; //not used, but pointers still set (0x18 byte struct.) 
    u16 *borg1lookup;
    Borg5_particle **ParticleDat;
    u32 ParticleCount;
};

struct borg_9_struct {
    short *shorts;
    uint unk4;
    void *unk8;
    u16 field3_0xc;
    undefined field4_0xe;
    undefined field5_0xf;
    ushort voxelSceneCount;
    undefined field7_0x12;
    undefined field8_0x13;
};
struct Borg9data {
    vec3f floatsA; /* position? */
    vec2f floatsB; /* size? */
    u8 unk1[6]; /* seems unused */
    u8 byte0x1a;
    u8 byte0x1b;
    ushort shortA;
    ushort shortB;
    u8 unk[4];
    ushort borghpys_count;
    ushort field9_0x26;
    ushort voxelObjCount;
    ushort unkStructCount;
    short *counting_pointer;
    void *someint;
    short *pointer2;
    float *floats_pointer;
    struct borg9_phys *phys_pointer;
    int someInt_2;
    voxelObject *voxelObjs;
    borg_9_struct *unkStructs;
};

struct Borg11Data {
    u32 flag;
    u32 len;
    u32 unk8;
    u8 *wav;
};

struct Borg11header {
    u32 index;
    u32 field1_0x4;
    Borg11Data *dat;
    void *pointer;
};

struct borg2header {
    s32 index;
    s32 field1_0x4;
    struct LookAt *lookat[2];
    MtxF someMtx;
    Gfx **dlist;
    u8* unk54;
    struct borg2data *dat;
};

struct Borg12Data {
    Borg11header **instument_offset;
    u32 unk4;
    Borg12Sub sub;
};

struct Borg12Header {
    u32 field0_0x0;
    u32 field1_0x4;
    Borg12Data *dat;
};

struct borg6header {
    uint field0_0x0;
    uint field1_0x4;
    int field2_0x8;
    borg6header *link;
    u32 flag;
    AnimationData *anidat;
    void *field6_0x18;
    float field7_0x1c;
    void *field8_0x20;
};

struct struct_45 {
    struct borg6header *anis[3];
    u32 indecies[3];
};

struct Borg1Data {
    u16 type;
    u16 flag;
    u8 height;
    u8 width;
    u8 IlaceLvs;
    u8 unk7;
    Gfx *dList;
    u8 *bitmap;
    u16 * pallette;
};
struct borg2data {
    int unk0x0;
    int dsplistcount;
    float scale;
    vec3f pos;
    vec3f rot; /* radians */
    Color32 unk0x24;
    u32 unk0x28; /* ^1&1? */
    Gfx **dsplists;
    Vtx_t *vertlist;
    Vtx_t *vertlist2;
    u32 vertcount;
    int *unk0x3c;
    float (*unk0x40)[5]; /* posx,posy,posz,?,? unused */
    u32 unk0x44;
    u32 unk0x48;
    u32 unk0x4c;
};
//macro used to adjust offsets in header
#define SetPointer(x,f) x->f= decltype(x->f)((u32)&x+(u32)x->f)
//same as SetPointer(), but makes sure there is an offset
#define CheckSetPointer(x,f) if(x->f) SetPointer(x,f)