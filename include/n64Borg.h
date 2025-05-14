#include "mathN64.h"
#include "Borgindecies.h"
#include "heapN64.h"
#include "graphics.h"

extern struct SceneData;
//TODO: Break into headers by borg type

/*"Borg" files are the art/level/cutscene assets of the game, in 15 different categories:
0-Unused, therefore, unknown. init/free code still ingame.
1-Textures. use some compression method.
2-Geometry data. contains verts and ucode (primariliy G_TRI1)
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

struct BorgListing {
    s16 Type; /* Borg type */
    s16 Compression; /* none,LZ01x,LZB */
    s32 compressed; /* size in ROM */
    s32 uncompressed; /* size in RAM */
    s32 Offset; /* index in in ROM DB */
};

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

struct voxelHeader {
    vec3f pos; /* Where is it */
    f32 size; /* how big is it */
    u32 timestamp; /* when was it called */
    u16 Bitfeild; /* Flags for rendering */
    u16 type; /* object type */
    short LinkID[2]; //index of linked voxel(s) (usually -1 aka none)
    u16 flagA; /* event flags */
    u16 flagB;
    u16 flagC;
    void *ptr0x24;
};

enum TreasureType{
 Loot_Chest, Loot_Bag, Loot_Box, Loot_Barrel, Loot_Herb, Loot_Spice, Loot_Gem, Loot_Misc
};

struct container_Dat {
    u32 unk0x0;
    float chestSize; /* seems identical to header.size */
    u16 openFlag;
    u16 explodeFlag;
    short trap_lv;
    u16 unk0x14;
    ItemID LootCat; /* chestdb id */
    u16 LootType; // uses TreasureType
    u8 LockLV[2];
    u16 Gold; /* money */
    ItemID item; /* static item */
    u16 unk1A; /* align? */
    short lootCatDrop[6][2]; /* populated with chestdb items */
    u8 field13_0x34[16]; //align?
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
    union{ //common enough union to abstract?
    Borg7header *b7;
    SceneData* sceneDat;
    };
};

struct Scene_obj_dat {
    SceneVoxelModel borgArray[3];
    vec3f rotation;
    vec3f scale;
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
    vec2f startCoords;
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
    u16 borg_13;
    u16 MapDatA;
    u16 MapShortA;
    u16 MapShortB;
    u16 RefPointID;
    u16 unk0xA;
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
    borgHeader head;
    union{
        void* bitmapA;
        u8* bitmapA8;
        u16* bitmapA16;
        Color32*  bitmapA32;
        };
    u8 *bitmapB;
    Borg1Data *dat;
};

//contains perspective data. Only 5 items, with the only 3 distince changes being the clipping planes.
struct Borg3Data{
    float unk0; //unused(?) apart from an orphaned getter/setter. always 0
    float fovy; //always 45
    float nearplane;
    float farplane;
    float unk10; //unused(?) apart from an orphaned getter/setter. always 1
    float aspect; // always 1.3333334 (4/3)
    s16 *unk18; //unused(?) apart from an orphaned setter
    Mtx *mtx_;
};

//Headered perspective data
struct Borg3Header {
    borgHeader head;
    u16 perspnorm[2];
    int *unkc;
    Borg3Data dat;
};

struct borg5substruct {
    u16 flag;
    u8 mtxOp;
    u8 tier;
    borg5substruct **links;
    u32 unk0x8;
    Mtx *mtxs;
    vec3f rot;
    vec3f pos;
    vec3f scale;
    vec3f unk; //used for mtxOp 1
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
        Borg3Header *borg3P;
        };
    union{
        s32* borg4i;
        void **borg4p;
    };
    union{
        s32* borg2i;
        Borg2header **borg2p;
    };
    union{
        s32* borg1i;
        Borg1header **borg1p;
    };
    void * aniTextures; //not used, but pointers still set (0x18 byte struct.) 
    u16 *borg1lookup;
    Borg5_particle **ParticleDat;
    u32 ParticleCount;
};

struct borg_9_struct {
    u16 *collideIndecies;
    void* unk4; //offset calculated, unused(?)
    u16 *lightIndecies;
    u16 collideCount;
    u16 field4_0xe; //unused?
    u16 voxelSceneCount;
    u16 field7_0x12; //align?
};
struct Borg9data {
    vec3f floatsA; /* position? */
    vec2f floatsB; /* size? */
    u8 unk1[6]; /* seems unused */
    u8 byte0x1a;
    u8 byte0x1b;
    u16 shortA;
    u16 shortB;
    u8 unk[4];
    u16 borghpys_count;
    u16 field9_0x26;
    u16 voxelObjCount;
    u16 unkStructCount;
    s16 *counting_pointer;
    void *someint;
    s16 *pointer2;
    vec3f *verts; //vertex data
    borg9_phys *phys_pointer;
    void* someInt_2; //(off)set, seems unused.
    voxelObject *voxelObjs;
    borg_9_struct *unkStructs;
};
struct Borg9header {
    u32 ID;
    u32 field1_0x4;
    Borg9data dat;
};

#define Borg11_Set 0x10 //always set
#define Borg11_8bit 0x4 //8-bit sound sample
#define Borg11_16BE 0x8 //16-bit BE sound sample

//PCM mono 44.1KHz sound samples
struct Borg11Data {
    u32 flag;
    u32 len;
    u32 samples;
    u8 *wav;
};

struct Borg11header {
    u32 index;
    u32 field1_0x4;
    Borg11Data *dat;
    void* p;
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
    astruct_3 *unk0x40;
    u32 unk0x44;
    u32 unk0x48;
    u32 unk0x4c;
};

struct Borg2header {
    borgHeader head;
    LookAt *lookat[2];
    MtxF someMtx;
    Gfx **dlist;
    u8* dlistSet;
    borg2data *dat;
};

struct Borg12Sub {
    u32 channelCount;//0x08 on file
    int instrument_count;//0x0C on file
    u32 dataSize;//0x10 on file
    u32 byteIndex;//0x14 on file
    astruct *ptr0x18;//0x18 on file
    u8 *channelDat;//0x1C on file
};

struct Borg12Data {
    union{
    u32* instrumentsI;
    Borg11header **intrumentsP;
    };
    u32 unk4;
    Borg12Sub sub;
};

struct Borg12Header {
    borgHeader head;
    Borg12Data *dat;
};

struct borg6Data{
    u32 borg5;
    s32 unk4;
    s32 unk8;
    s32 unkc;
};

struct borg6header {
    uint field0_0x0;
    uint field1_0x4;
    int field2_0x8;
    borg6header *link;
    u32 flag;
    SceneData *sceneDat;
    u32 flag2;
    float field7_0x1c;
    borg6Data *dat;
};

struct struct_45 {
    struct borg6header *anis[3];
    u32 indecies[3];
};

struct Borg1Data {
    u16 type;
    u16 flag;
    u8 Width;
    u8 Height;
    u8 lods;
    u8 iLace; //paramater for deinterlacing textures?
    Gfx *dList;
    u8 *bitmap;
    u16 * pallette;
};

struct astruct_3{
    u16 unk0[2];
    vec4f unk4;
};

struct Borg5header {
    borgHeader head;
    void *unk8;
    void *aniTextures;
    Borg5data dat;
};

struct Borg7data {
    u32 field0_0x0;
    int borg6_size;
    int field2_0x8;
    u32  borg6;
    undefined field4_0x10;
    undefined field5_0x11;
    undefined field6_0x12;
    undefined field7_0x13;
    undefined *unk14;
};

struct Borg7header {
    borgHeader head;
    SceneData *sceneDat;
    u16 currentAni;
    u16 field7_0xe;
    u16 field8_0x10;
    u16 field9_0x12;
    undefined field10_0x14;
    undefined field11_0x15;
    undefined field12_0x16;
    undefined field13_0x17;
    void **unk18;
    struct_1 *unk1c;
    vec3f unk20;
    vec3f unk2c;
    struct_45 unk38;
    Borg7data dat;
};

enum Borg9PhysFlags{
    B9Phys_0001=1,
    B9Phys_0002=2,
    B9Phys_EdgeA=4,
    B9Phys_EdgeB=8,
    B9Phys_EdgeC=0x10,
    B9Phys_EdgeMask=B9Phys_EdgeA|B9Phys_EdgeB|B9Phys_EdgeC,
    B9Phys_VertA=0x20,
    B9Phys_VertB=0x40,
    B9Phys_VertC=0x80,
    B9Phys_VertMask=B9Phys_VertA|B9Phys_VertB|B9Phys_VertC,
    B9Phys_0100=0x100,
    B9Phys_0200=0x200,
    B9Phys_0400=0x400,
    B9Phys_0800=0x800,
    B9Phys_1000=0x1000,
    B9Phys_2000=0x2000,
    B9Phys_4000=0x4000,
    B9Phys_8000=0x8000,
};


struct borg9_phys {
    vec3f *verts[3];
    vec3f normal;
    EnvProp *envProperty;
    u16 flags; // use Borg9PhysFlags
    u16 GroundType;
};


struct Borg13Op{
    u16 val;
    u8 com;
    u8 unk2; //align?
    u32 unk4; //unused?
};

struct borg13command {
    Borg13Op ops[4];
    s16 text_marker;
    undefined field32_0x22;
    undefined field33_0x23;
    u16 a;
    u16 b;
    u8 index;
    u8 c[8];
    u8 bitmask;
    undefined field46_0x32;
    undefined field47_0x33;
    u32 unk34;
};

struct borg13data {
    borg13command *commands_pointer;
    u16 (*actors)[4];
    char *text;
    u16 ID;
    u16 flag;
    u8 A;
    u8 B;
    u8 CmdCount;
    u8 ActorCount;
    u8 start_func;
    u8 C;
    u8 pad[2];
};

struct borg13header{
    borgHeader head;
    u32* unk8;
    u32 unkc;
    borg13data* dat;
};

//borgmain.cpp

void setBorgFlag(void);
void clearBorgFlag(void);
u32 Ofunc_getBorgTotal(void);
void SetBorgListing(void *,void *);
u8 decompressBorg(void *,u32 ,u8 *,u32 ,u32 );
s16 get_borg_listing_type(s32);
s16 GetBorgItemInfo(BorgListing *,s32);
borgHeader* get_borg_index_x4(s32);
borgHeader * getBorgItem(s32);
void FUN_800a2de0(void);
u8 get_borg_index_count(s32);
void dec_borg_count(s32);
void borg0_func_a(void**);
u8 borg0_func_b(void**,void*);
void Ofunc_borg0_free(void**);
void * Ofunc_getborg(s32);
void borg1_func_a(Borg1Data *);
u8 InitBorgTexture(Borg1header *,Borg1Data *);
void borg1_free(Borg1header *);
void borg2_func_a(borg2data *);
u8 borg2_func_b(Borg2header *,borg2data *);
void borg_2_free(Borg2header *);
void borg4_func_a(void*);
u8 borg4_func_b(void* x,void* y);
void Borg4_free(s32 *);
void borg3_func_a(Borg3Header *);
u8 borg3_func_b(void*, void* );
void borg5_func_a(Borg5header*);
u8 InitBorgScene(Borg5header *,void*);
void borg5_free(Borg5header *);
void borg6_func_a(borg6header*);
u8 borg6_func_b(borg6header *,void *);
void borg_6_free(borg6header *);
void borg7_func_a(Borg7header *);
u8 borg7_func_b(Borg7header *,Borg7data *);
void borg7_free(Borg7header *);
void set_AnimCache(u8 );

//n64borg/image.cpp

u8 borg8_func_b(void *,void *);
void borg8_func_a(Borg8header *);
void borg8_free_ofunc(s32 *);
Borg8header* loadBorg8(u32);
Gfx * borg8DlistInit(Gfx *,byte ,u16,u16);
Gfx * N64BorgImageDraw(Gfx *,Borg8header *,float ,float ,u16 ,u16 ,u16 ,u16 ,float ,float ,u8 ,u8 ,u8,u8);
Gfx* Borg8_DrawSimple(Gfx*,Borg8header *,float,float,float,float,u8,u8,u8,u8);
void borg8_free(Borg8header *);
Gfx * gsFadeInOut(Gfx *gfx,u16 x,u16 y,u16 H,u16 V,u8 R,u8 G,u8 B,u8 A);

//n64borg/collisionZone.cpp

u8 borg_9_func_b(void*,void*);
void * set_pointer_offset(void *A,void *B);
void borg9_func_a(Borg9header *);
void n64BorgCollisionZone_free(Borg9header *);
Borg9header * loadBorg9(u32);
void remove_borg_9(Borg9header *);

typedef void (*BorgFuncA)(void*);
typedef u8 (*BorgFuncB)(void*,void*);

u32 borgFlag=0;
BorgFuncA borg_funcs_a[]={
borg0_func_a,borg1_func_a,borg2_func_a,borg3_func_a,borg4_func_a,
borg5_func_a,borg6_func_a,borg7_func_a,borg8_func_a,borg9_func_a,
borg10_func_a,borg11_func_a,borg12_func_a,borg13_func_a,borg14_func_a
};
BorgFuncB borg_funcs_b[]={
borg0_func_b,InitBorgTexture,borg2_func_b,borg3_func_b,borg4_func_b,
InitBorgScene,borg6_func_b,borg7_func_b,borg8_func_b,borg9_func_b,
borg10_func_b,borg11_func_b,borg12_func_b,borg13_func_b,borg14_func_b
};

s32 gBorgHeaderSizes[15]= {8,16,88,16,8,16,32,80,8,8,8,8,8,16,8};
u8 animChache=3;
u32 borg_mem[15]={0};
u32 borg_count[15]={0};
borgHeader** borg_index_x4=0;
u8* borg_index_x1=0;
void* BorgListingPointer=0;
void* borgFilesPointer=0;
u32 borgTotal=0;


//macro used to adjust offsets in header
#define SetPointer(x,f) x->f= decltype(x->f)((u32)&x+(u32)x->f)
//same as SetPointer(), but makes sure there is an offset
#define CheckSetPointer(x,f) if(x->f) SetPointer(x,f)


