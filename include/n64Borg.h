#include "mathN64.h"
#include "Borgindecies.h"
#include "heapN64.h"
#include "graphics.h"
#include "itemID.h"

extern struct SceneData;
//TODO: Break into headers by borg type

/*"Borg" files are the art/level/cutscene assets of the game, in 15 different categories:
0-Unused, therefore, unknown. init/free code still ingame.
1-Textures. use some compression method.
2-Geometry data. contains verts and ucode (primariliy G_TRI1)
3-Scene perspective data (fov,clipping planes, ect.)
4-seems to be light object data
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

enum CompressType{
    Compress_None, //no compression, as is
    Compress_LZ01x, //used by text in ROM
    Compress_LZB   //used by most of Borg assets.
};

struct BorgListing {
    s16 Type; /* Borg type */
    s16 Compression; //uses CompressType.
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

struct Borg8Data {
    u16 format;
    u16 Width;
    u16 Height;
    u16 unk06;
    u16* palette; //for CI8/4
    void* offset; //offset to bitmap
};

struct Borg8Header {
    borgHeader head;
    Borg8Data dat;
};

typedef enum VoxelFllags {
    VOXEL_JumperPak=0x20, //activate if no Expansion Pak
    VOXEL_EXPPak=0x40, //activate if Expansion Pak
    VOXEL_FlagC=0x80,
    VOXEL_Used=0x200,
    VOXEL_FlagB=0x1000,
    VOXEL_tangible=0x2000,
    VOXEL_Active=0x8000 //map object is active/visible
} VoxelFllags;

typedef enum EnumMapDatA {
    MAPA_Overworld,
    MAPA_GoblinCamp,
    MAPA_PortSaiid,
    MAPA_Lighthouse,
    MAPA_GwerniaCastle,
    MAPA_GwerniaInterior,
    MAPA_Interior,
    MAPA_Erromon,
    MAPA_8,
    MAPA_Barrows,
    MAPA_RoogCave,
    MAPA_JundarInteriors,
    MAPA_EhudUnder,
    MAPA_Ugairt,
    MAPA_Ugairt2,
    MAPA_ChoasIsle,
    MAPA_Battle,
    MAPA_Misc,
} EnumMapDatA;

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
    void *ptr0x24;
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

typedef enum BORG1type {
    B1_RGBA16,
    B1_IA16,
    B1_CI8,
    B1_IA8,
    B1_I8,
    B1_CI4,
    B1_IA4,
    B1_I4,
    B1_RGBA32
} BORG1type;

enum Borg1Flag{
    B1_Flag20 =0x20,
    B1_TDDetail=0x40,
    B1_TDSharpen=0x80,
    B1_Procedural=0x100,
    B1_Interlaced=0x200,
};

struct Borg1Data {
    u16 type;
    u16 flag;
    u8 Width;
    u8 Height;
    u8 lods;
    u8 iLace; //paramater for deinterlacing textures?
    Gfx *dList;
    u8 *bmp;
    u16 * pallette;
    u32 unk14; //unused, always 0. bmp offset always past it.
};

struct Borg1Header {
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

//contains perspective data. Only 5 items, with the only 3 distinct changes being the clipping planes.
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
//lighting data
struct Borg4Data{
    float unk0;
    float red;
    float green;
    float blue;
    Light* l;
    s16 unk14;
    s16 unk16;
};

struct Borg4Header {
    borgHeader head;
    Borg4Data* dat;
};

struct Borg5Struct2{
    Mtx mtxs[2];
    MtxF mfs[2];
    //much of what below this is unread or unused.
    u8 unk100[0x40]; //may be an Mtx(F) unused(?)
    vec3f unk140;
    vec3f unk14c;
    vec3f unk158; //set to 0 in InitBorgScene, never read(?)
    vec3f unk164; //set to 0 in InitBorgScene, never read(?)
    vec3f unk170; //used in orphaned functions.
    vec3f unk17c; //used in orphaned functions.
};
//unused as a case-switch error says. pointers are still set if there are any.
struct Borg5AniTexture{
    u8 unk0[16];
    void* p;
    u8 unk14[4];
};
struct borg5substruct {
    u16 flag;
    u8 mtxOp;
    u8 tier;
    borg5substruct **links;
    u32 unk0x8;
    Borg5Struct2* unkStruct;
    vec3f rot;
    vec3f pos;
    vec3f scale;
    vec3f pivot; //used for mtxOp 1
};
struct Borg5_particle{
    u16 locator0;
    u16 locator1;
    u16 aniUsed;
    u16 unk6;
    s16 partLifespan;
    s16 partLifespan2;
    u16 emmiLifespan;
    u16 flagE;//uses Borg5PartFlag
    float emmiSpeed;
    s16 unk14;
    s16 unk16;
    s16 texture;
    u16 count;
    vec3f pos;
    float randRangeA;
    vec3f pos2;
    float randRangeB;
    float randRangeC;
    u32 unk40;
    vec4f colVA;
    vec4f colVB;
    vec4f colVC;
    vec4f colVD;
    vec3f norm;
    float speed;
    float scaleRangeLo;
    float scaleRangeHi;
    float scaleValC;
    Color32 colRandLo;
    Color32 colRandHi;
    Color32 colBlend;
    u8 unkAc[20]; //unused?
};
enum Borg5PartFlag{
    B5PART_0001=0x1, //particle emmiter has height of 0.
    B5PART_0002=0x2, //unused?
    B5PART_0004=0x4, //use randRangeB for velocity range when set, 0 to randRangeB when unset
    B5PART_0008=0x8, //use randRangeA for position range when set, 0 to randRangeA when unset
    B5PART_0010=0x10, //get locator normal when set.
    B5PART_0020=0x20,
    B5PART_0040=0x40, //unused?
    B5PART_0080=0x80, //unused?
    B5PART_0100=0x100, //unused?
    B5PART_0200=0x200, //emmiter's collision position is used.
    B5PART_0400=0x400, //color colVD is used for ColorB to set particles' colorB.
    B5PART_0800=0x800, //color colVC is used for ColorB to set particles' velocity.
    B5PART_1000=0x1000, //color colVB is used for ColorB to set particles' colorB.
    B5PART_2000=0x2000, //get locator position and check B5PART_0004 when set.
    B5PART_4000=0x4000, //use colBlend to set particles' colorA
    B5PART_8000=0x8000, //use (scaleValC - scaleRangeLo) / partLifespan2 to mod particles' scale.
};
struct Borg5Data {
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
        Borg4Header **borg4p;
    };
    union{
        s32* borg2i;
        Borg2Header **borg2p;
    };
    union{
        s32* borg1i;
        Borg1Header **borg1p;
    };
    void * aniTextures; //not used, but pointers still set (0x18 byte struct.) 
    u16 *borg1lookup;
    Borg5_particle **ParticleDat;
    u32 ParticleCount;
};

//a section of map collsion indecies - saves on calulating for entire map.
struct CollideSection {
    u16 *collideIndecies;
    void* unk4; //offset calculated, unused(?)
    u16 *lightIndecies;
    u16 collideCount;
    u16 field4_0xe; //unused?
    u16 voxelSceneCount;
    u16 field7_0x12; //align?
};
struct Borg9Data {
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
    u16 collideSectionCount;
    s16 *collideCount;
    void *someint;
    s16 *lightCount;
    vec3f *verts; //vertex data
    borg9_phys *phys_pointer;
    void* someInt_2; //(off)set, seems unused.
    voxelObject *voxelObjs;
    CollideSection *collideSections;
};
struct Borg9Header {
    borgHeader head;
    Borg9Data dat;
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

struct Borg11Header {
    borgHeader head;
    Borg11Data *dat;
};

enum Borg2StructFlags{
    B2S_0001=1,
    B2S_LinText=2, //set GeometryMode G_TEXTURE_GEN_LINEAR
    B2S_CullBack=4, //set GeometryMode G_CULL_BACK
    B2S_Lighting=8, //set GeometryMode G_LIGHTING
    B2S_SmoothShade=0x10, //set GeometryMode G_SHADING_SMOOTH
    B2S_0020=0x20, //unused?
    B2S_0040=0x40, //unused?
    B2S_TextFilt=0x80, //set GeometryMode G_TF_BILERP(unset) or G_TF_POINT(set)
    B2S_0100=0x100, //unused?
    B2S_NoZBuff=0x200, //if unset, set GeometryMode G_SHADE|G_ZBUFFER
    B2S_0400=0x400, //unused?
    B2S_0800=0x800, //unused?
    B2S_Wrap=0x1000, //unused?
    B2S_YNoMirror=0x2000, //don't mirror UV on Y axis
    B2S_XMirror=0x4000, //mirror UV on X axis
    B2S_YMirror=0x8000 //mirror UV on Y axis
};

//Struct that determines properties of Borg2's Borg1's
struct Borg2Struct{
    u32 flags;
    vec4f tint;
};

struct Borg2Data {
    float alpha; //inverted - 0=opaque, 1=transparent.
    int dsplistcount;
    float scale;
    vec3f pos;
    vec3f rot; /* radians */
    Color32 unk0x24; //might not be color, only "alpha" read as scene index.
    u32 unk0x28; /* ^1&1? */
    Gfx **dsplists;
    Vtx_t *vertlist;
    Vtx_t *vertlist2;
    u32 vertcount;
    int *unk0x3c;
    Borg2Struct *unk0x40;
    u32 unk0x44;
    u32 unk0x48;
    u32 unk0x4c;
};

struct Borg2Header {
    borgHeader head;
    LookAt *lookat[2];
    MtxF someMtx;
    Gfx **dlist;
    u8* dlistSet;
    Borg2Data *dat;
};

struct Borg12Sub {
    u32 channelCount;//0x08 on file
    int instrument_count;//0x0C on file
    u32 dataSize;//0x10 on file
    u32 byteIndex;//0x14 on file
    struct dcmStruct2 *ptr0x18;//0x18 on file
    u8 *channelDat;//0x1C on file
};

struct Borg12Data {
    union{
    u32* instrumentsI;
    Borg11Header **intrumentsP;
    };
    u32 unk4;
    Borg12Sub sub;
};

struct Borg12Header {
    borgHeader head;
    Borg12Data *dat;
};
struct Borg6SubSub{
    s16 unk0;
    s16 unk2;
    float*unk4;
    s32 unk8;
    float*unkc;
};
struct Borg6Sub{
    u32 borg5;
    u32 unk4;
    void* unk8;
    u32 unkc;
    u32 subCount;
    Borg6SubSub* sub;
};
struct Borg6Data{
    u32 borg5;
    s32 subCount;
    Borg6Sub* sub;
    s32 aniLength;
};
struct Borg6Struct{
    Borg6Sub* sub;
    u32 unk4;
    u32 unk8;
    void* unkc;
    void* unk10;
    u32 unk14;
};
struct Borg6Header {
    borgHeader head;
    SceneData* unk8;
    Borg6Header *link;
    Borg6Header * link2;
    Borg6Struct *structDat;
    u32 flag;
    float unk1c; //always 1.0(?)
    Borg6Data *dat;
};

struct struct_45 {
    struct Borg6Header *anis[3];
    u32 indecies[3];
};



struct Borg5Header {
    borgHeader head;
    void *allocedDat;
    void *aniTextures;
    Borg5Data dat;
};

struct b7SubSub{
    u8 ani;
    u8 unk1;
    u8 flag;
    u8 unk3;
};

struct Borg7Sub{
    u32 borg6;
    u16 flag;
    u16 subSubCount;
    b7SubSub* p;
};

struct Borg7Data {
    u32 unk0;
    int subCount;
    int unk8;
    Borg7Sub sub[1]; //acually Borg7Sub[subCount]
};

struct struct_1 {
    Borg7Sub *sub;
    Borg6Header *b6;
};

struct Borg7Header {
    borgHeader head;
    SceneData *sceneDat;
    u16 currentAni;
    u16 prevAni;
    u16 nextAni;
    u16 unk12;
    u32 unk14;
    struct_1*unk18;
    struct_1 *unk1c;
    vec3f unk20;
    vec3f unk2c; //z axis used for moving playerData based on 2d normal and scale
    struct_45 unk38;
    Borg7Data dat;
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
    struct EnvProp *envProperty;
    u16 flags; // use Borg9PhysFlags
    u16 GroundType;
};

enum B13_Commands{
    B13Com_SetEnt=3, //set dislougmode_substruct->EntId to (val)
    B13Com_CameraCutTo, //instantly move camera to reference point
    B13Com_CutToPOV,//instantly move camera to actor
    B13Com_CameraOn, //point camera to reference point
    B13Com_CameraOnPOV, //point camera to actor
    B13Com_CameraAngleTo, //move camera to focus on reference point
    B13Com_CameraAngleToPOV, //point camera to actor
    B13Com_CameraPanTo, //move camera to focus on reference point
    B13Com_CameraPanToPOV, //point camera to actor
    B13Com_CameraSineTo, //move camera to focus on reference point
    B13Com_CameraSineToPOV, //point camera to actor
    B13Com_CameraTrackOn,
    B13Com_15,
    B13Com_LoadMonster,
    B13Com_SetActorFacing, //actor moves to face ref obj
    B13Com_CreateActor, //creates actor
    B13Com_19,
    B13Com_SetCollideByte,
    B13Com_SetBattlefield,
    B13Com_setAniByte,
    B13Com_CheckMemberInParty, //is member (val) in party?
    B13Com_CheckEventFlag,  //is event flag (val) set?
    B13Com_CheckPartySkill, //get highest level of (val). if flag 3717 is set then it's randRange(0,21)
    B13Com_CheckForItem, //if the party has (val)
    B13Com_CheckBestStat,//get highest stat of (val) in party
    B13Com_CheckWorstStat,//get lowest stat of (val) in party
    B13Com_CheckMemberStat, //get dialougmode_substruct->Entid stat of (val)
    B13Com_CheckPartySize, //get size of current party
    B13Com_CheckPartyGoldU16, //get 16-bit value of party's Gold
    B13Com_SetFlag, //set Event flag (val)
    B13Com_UnsetFlag, //unset Event flag (val)
    B13Com_EndDialoug, //end dialouge
    B13Com_Fade35, //fade out
    B13Com_AddGold, //add ((u16)val) gold to party
    B13Com_TakeGold, //remove ((u16)val) gold from party
    B13Com_AddItem, //add item of ID (val) to party
    B13Com_TakeItem, //remove item of ID (val) to party. Crash if you don't have it.
    B13Com_ActorWalk, //dialougmode_substruct->Entid walks to ref obj (val)
    B13Com_ActorRun,//dialougmode_substruct->Entid runs to ref obj (val)
    B13Com_ApplyStimulus,
    B13Com_PlaySFX, //plays sfx dialoug_SFX[val]
    B13Com_Shop, // start the shopping menu
    B13Com_Battle, //start combat
    B13Com_Train, // start the training menu
    B13Com_AddMember, //add member if ItemID (val)
    B13Com_RemoveMember, //remove member if ItemID (val) without killing them
    B13Com_Unimplemented49, //unimplemented, triggers crash
    B13Com_RandDialog, //display a random dialoug from borg13(val)
    B13Com_ShowItem, //attach a model of itemID(val) on dialougmode_substruct->Entid
    B13Com_HideItem,//remove item model from dialougmode_substruct->Entid
    B13Com_53,
    B13Com_CampHeal,//fully heal party, lapse 8 hours
    B13Com_55,
    B13Com_AddExp,//add (val*1.5) exp points to dialougmode_substruct->Entid
    B13Com_57, //set some timer?
    B13Com_58,
    B13Com_59,
    B13Com_60,
};

struct Borg13Op{
    u16 val;
    u8 com; //uses B13_Commands
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

struct Borg13Data {
    borg13command *commands_pointer;
    u16 (*actors)[4];
    char *text;
    u16 ID;
    u16 flag;
    u16 baseTextSize;
    u8 CmdCount;
    u8 ActorCount;
    u8 start_func;
    u8 libraryType;
    u8 pad[2];
};

struct Borg13Header{
    borgHeader head;
    u32* unk8;
    u32 unkc;
    Borg13Data* dat;
};

//borgmain.cpp

void setBorgFlag(void);
void clearBorgFlag(void);
u32 Ofunc_getBorgTotal(void);
void SetBorgListing(void *,void *);
u8 decompressBorg(void *,u32 ,u8 *,u32 ,u32 );
s16 get_borg_listing_type(s32);
s16 GetBorgItemInfo(BorgListing *,s32);
borgHeader* getLoadedBorg(s32);
borgHeader * getBorgItem(s32);
void FUN_800a2de0(void);
u8 get_borg_index_count(s32);
void dec_borg_count(s32);
void borg0_func_a(void**);
u8 borg0_func_b(void**,void*);
void Ofunc_borg0_free(void**);
void * Ofunc_getborg(s32);
void borg1_func_a(Borg1Data *);
u8 InitBorgTexture(Borg1Header *,Borg1Data *);
void borg1_free(Borg1Header *);
void borg2_func_a(Borg2Data *);
u8 borg2_func_b(Borg2Header *,Borg2Data *);
void borg_2_free(Borg2Header *);
void borg4_func_a(void*);
u8 borg4_func_b(void* x,void* y);
void Borg4_free(borgHeader *);
void borg3_func_a(Borg3Header *);
u8 borg3_func_b(void*, void* );
void borg5_func_a(Borg5Header*);
u8 InitBorgScene(Borg5Header *,void*);
void borg5_free(Borg5Header *);
void borg6_func_a(Borg6Header*);
u8 borg6_func_b(Borg6Header *,Borg6Data *);
void borg_6_free(Borg6Header *);
void borg7_func_a(Borg7Header *);
u8 borg7_func_b(Borg7Header *,Borg7Data *);
void borg7_free(Borg7Header *);
void set_AnimCache(u8 );

//n64borg/image.cpp

u8 borg8_func_b(void *,void *);
void borg8_func_a(Borg8Header *);
void borg8_free_ofunc(Borg8Header *);
Borg8Header* loadBorg8(u32);
Gfx * borg8DlistInit(Gfx *,byte ,u16,u16);
Gfx * N64BorgImageDraw(Gfx *,Borg8Header *,float ,float ,u16 ,u16 ,u16 ,u16 ,float ,float ,u8 ,u8 ,u8,u8);
Gfx* Borg8_DrawSimple(Gfx*g,Borg8Header *borg8,float x,float y,float Hscale,float Vscale,u8 R,u8 G,u8 B,u8 A);
void borg8_free(Borg8Header *);
Gfx * DrawRectangle(Gfx *gfx,u16 x,u16 y,u16 H,u16 V,u8 R,u8 G,u8 B,u8 A);

//n64borg/collisionZone.cpp

u8 borg9_func_b(void*,void*);
void * set_pointer_offset(void *A,void *B);
void borg9_func_a(Borg9Header *);
void n64BorgCollisionZone_free(Borg9Header *);
Borg9Header * loadBorg9(u32);
void remove_borg_9(Borg9Header *);

//n64borg/DCMModule.cpp

void borg12_func_a(Borg12Data *);
u8 borg12_func_b(Borg12Header *,Borg12Data *);
void n64BorgDCMModule_free(Borg12Header *);
Borg12Header * load_borg_12(u32 index);
void free_borg_12(Borg12Header *p);

//n64borg/CollisionMaterial.cpp

u8 borg10_func_b(void *x,void *y);
void borg10_func_a(void *x);
void borg_10_free(s32 *arg0);
void * get_borg_10(s32 arg0);
void passto_borg_10_free(s32 *arg0);

//n64borg/Sample.cpp

void borg11_func_a(Borg11Data *);
u8 borg11_func_b(Borg11Header *,Borg11Data *);
void borg11_free(Borg11Header *);
Borg11Header * get_borg_11(u32);
void passto_borg11_free(Borg11Header *);

//n64borg/Dialog.cpp

u8 borg13_func_b(Borg13Header *,Borg13Data *);
void borg13_func_a(Borg13Data *);
void borg13_free(Borg13Header *);
Borg13Header * get_borg13(u32);
void passto_borg13_free(Borg13Header *);

//n64borg/GameStates.cpp

u8 borg14_func_b(void *x,s32 y);
void borg14_func_a(void *arg0);
void ofunc_borg14_free(s32 *arg0);
void * get_borg_14(s32 arg0);
void passto_borg_14_free(s32 *arg0);

//n64borg/anim.cpp

void Ofunc_8009d250();
void Ofunc_8009d25c(void* p);
s8 GetN64ImageDimension(u16 X);
int GetBitmapSize(int h,int w,s32 d);
u32 half(int x);
int getPow2(u32);
s32 FUN_8009d3b0(s32 param_1,s32 param_2);
Gfx * FUN_8009d3dc(Gfx *param_1,Borg1Header *b1,u8 bufferchoice);
void deinterlace32(Borg1Header *param_1,int param_2);
void deinterlace16(Borg1Header *param_1,int param_2);
void FUN_8009d7b0(Borg1Header *param_1);
Gfx * borganim_LoadTextureImage(Gfx *gfx,Borg1Header *param_2);
Gfx * loadTextureImage(Gfx *gfx,Borg1Header *param_2,Borg2Struct *param_3);
Gfx * Ofunc_8009e228(Gfx *param_1,SceneData *param_2,int param_3);
void Borg5Sub_op0(borg5substruct *param_1,MtxF *mf);
void Borg5Sub_op1(borg5substruct *param_1,MtxF *mf);
void Borg5Sub_op2(borg5substruct *param_1,MtxF *mf);
void Borg5Sub_op3(borg5substruct *param_1,MtxF *mf);
void Borg5Sub_op4(borg5substruct *param_1,MtxF *mf);
void Borg5Sub_ops(borg5substruct *param_1,MtxF *mf);
void FUN_8009ed9c(MtxF *in,MtxF *out);
void FUN_8009ee48(MtxF *in,MtxF *out);
void FUN_8009ee98(borg5substruct *param_1,MtxF *param_2);
void FUN_8009ef34(SceneData *param_1);
void Ofunc_8009efd0(SceneData *param_1,MtxF *param_2);
void FUN_8009f060(SceneData *param_1,MtxF *param_2);
void Ofunc_8009f4e0(SceneData *param_1);
void Ofunc_8009f554(SceneData *param_1,vec3f *param_2);
void Ofunc_8009f608(SceneData *param_1);
void Ofunc_8009f664(SceneData *param_1);
void FUN_8009f6b4(SceneData *param_1,Borg6Header *param_2);
void Scene_SetBorg6(SceneData *scene,Borg6Header *b6);
void unlinkBorg6(Borg6Header *param_1);
void Ofunc_8009f938(Borg5Header *param_1,s32 param_2,int param_3,s32 param_4,int param_5);
void FUN_8009f9d0(SceneData *param_1,s16 *param_2);
SceneData * BorgAnimLoadScene(u32 borg_5);
void borganim_free(SceneData *param_1);
Borg6Header * get_borg_6(int index);
void passto_borg_6_free(Borg6Header *param_1);
Borg7Header * func_loading_borg7(u32 index,struct ParticleHeadStruct *pHead);
void FUN_8009fca8(Borg7Header *param_1);
void FUN_8009fd40(Borg7Header *param_1);
void FUN_8009fd98(Borg7Header *param_1);
void FUN_8009fdec(Borg7Header *param_1);
void takeBranch(Borg7Header *param_1,b7SubSub *param_2);
void animate_borg7(Borg7Header *param_1);
bool Borg7_AnimationExpired(Borg7Header *param_1);
void FUN_800a0088();
void Borg7_SetAnimation(Borg7Header *param_1,u16 param_2);
bool FUN_800a00d0(Borg7Header *param_1);
bool Borg7_TickAnimation(Borg7Header *param_1,int delta);
u16 Borg7_GetAniTime(Borg7Header *param_1);
void Borg7_StartParticles(Borg7Header *param_1);
Gfx * Borg7_Render(Gfx *g,Borg7Header *param_2);
void FUN_800a0714(struct SceneDatSubstruct *param_1);
void FUN_800a0764(struct SceneDatStruct *param_1,float param_2);
void FUN_800a07b0(struct SceneDatStruct *param_1,float param_2);
void FUN_800a0800(struct SceneDatStruct *param_1,float param_2);
void FUN_800a0940(Borg6Struct *param_1);
void FUN_800a09c0(Borg6Struct *param_1);
void FUN_800a0a08(SceneData *param_1);
void FUN_800a0a74(Borg6Struct *param_1);
void Ofunc_800a0d30(Borg6Header *param_1,int param_2);
Gfx * BorgAnimDrawScene(Gfx *g,SceneData *scene);
void FUN_800a0df4(SceneData *param_1);
void Ofunc_800a0e30(void);
Gfx * FUN_800a0e60(Gfx *G);
Gfx * setStaticMode(Gfx *g);
Gfx * FUN_800a1184(Gfx *gfx);
void Ofunc_800a1548(vec3f *param_1);
Gfx * gsAnimationDataMtx(Gfx *G,SceneData *param_2);
Gfx * BorgAnimDrawSceneRaw(Gfx *g,SceneData *param_2);
void NOOP_800a2448(void *x);
Gfx * ret_A0(Gfx *g);


typedef void (*BorgFuncA)(void*);
typedef u8 (*BorgFuncB)(void*,void*);

u32 borgFlag=0;
BorgFuncA borg_funcs_a[]={
(BorgFuncA)borg0_func_a,(BorgFuncA)borg1_func_a,(BorgFuncA)borg2_func_a,
(BorgFuncA)borg3_func_a,(BorgFuncA)borg4_func_a,(BorgFuncA)borg5_func_a,
(BorgFuncA)borg6_func_a,(BorgFuncA)borg7_func_a,(BorgFuncA)borg8_func_a,
(BorgFuncA)borg9_func_a,(BorgFuncA)borg10_func_a,(BorgFuncA)borg11_func_a,
(BorgFuncA)borg12_func_a,(BorgFuncA)borg13_func_a,(BorgFuncA)borg14_func_a
};
BorgFuncB borg_funcs_b[]={
(BorgFuncB)borg0_func_b,(BorgFuncB)InitBorgTexture,(BorgFuncB)borg2_func_b,
(BorgFuncB)borg3_func_b,(BorgFuncB)borg4_func_b,(BorgFuncB)InitBorgScene,
(BorgFuncB)borg6_func_b,(BorgFuncB)borg7_func_b,(BorgFuncB)borg8_func_b,
(BorgFuncB)borg9_func_b,(BorgFuncB)borg10_func_b,(BorgFuncB)borg11_func_b,
(BorgFuncB)borg12_func_b,(BorgFuncB)borg13_func_b,(BorgFuncB)borg14_func_b
};
//for header sizes that use pointer to data
#define BorgHSize(x) (sizeof(Borg##x##Header)-sizeof(Borg##x##Data*))
//for header sizes that use copy of data
#define BorgHSize2(x) (sizeof(Borg##x##Header)-sizeof(Borg##x##Data))
//sizeof(BorgXHeader)-sizeof(BorgXData* or BorgXData)
s32 gBorgHeaderSizes[15]= {
    sizeof(borgHeader),BorgHSize(1),BorgHSize(2),BorgHSize2(3),
    sizeof(borgHeader),BorgHSize2(5),BorgHSize(6),BorgHSize2(7),
    BorgHSize(8),BorgHSize2(9),sizeof(borgHeader),BorgHSize(11),
    BorgHSize(12),BorgHSize(13),sizeof(borgHeader)};
u8 animChache=3;
u32 borg_mem[15]={0};
u32 borg_count[15]={0};
borgHeader** gBorgpointers=NULL;
u8* gBorgBytes=0;
void* BorgListingPointer=0;
void* borgFilesPointer=0;
u32 borgTotal=0;


//macro used to adjust offsets in header
#define SetPointer(x,f) x->f= decltype(x->f)((size_t)&x+(size_t)x->f)
//same as SetPointer(), but makes sure there is an offset
#define CheckSetPointer(x,f) if(x->f) SetPointer(x,f)


