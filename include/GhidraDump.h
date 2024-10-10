#include "typedefs.h"

typedef struct astruct astruct, *Pastruct;
typedef struct Borg11Data Borg11Data, *PBorg11Data;


struct astruct {
    struct Borg11Data *instrumentDat;
    u32 unk4;
    u32 unk8;
    undefined field3_0xc;
    undefined field4_0xd;
    undefined field5_0xe;
    u8 unkb;
};



typedef struct astruct_1 astruct_1, *Pastruct_1;

struct astruct_1 {
    undefined field0_0x0;
    undefined field1_0x1;
    undefined field2_0x2;
    undefined field3_0x3;
    ushort field4_0x4;
    ushort field5_0x6;
    u8 *field6_0x8;
};

typedef struct astruct_2 astruct_2, *Pastruct_2;


typedef struct borgHeader borgHeader, *PborgHeader;

typedef struct Borg8dat Borg8dat, *PBorg8dat;

typedef struct Method Method, *PMethod;


struct astruct_2 {
    struct BaseWidget *Widgetborg8A;
    struct BaseWidget *field1_0x4;
    struct BaseWidget *Widgetborg8B;
    struct BaseWidget *Widgetborg8C;
    undefined field4_0x10;
    undefined field5_0x11;
    undefined field6_0x12;
    undefined field7_0x13;
    undefined field8_0x14;
    undefined field9_0x15;
    undefined field10_0x16;
    undefined field11_0x17;
    struct BaseWidget *WidgetBorg8D;
    undefined field13_0x1c;
    undefined field14_0x1d;
    undefined field15_0x1e;
    undefined field16_0x1f;
    struct BaseWidget *text;
    struct BaseWidget *field18_0x24;
    struct BaseWidget *scrollMenu;
};

typedef struct astruct_6 astruct_6, *Pastruct_6;

typedef struct playerData playerData, *PplayerData;

typedef struct Borg7header Borg7header, *PBorg7header;

typedef struct AnimationData AnimationData, *PAnimationData;

typedef enum Borg7Enum { /* entity model data? */
    Blank=0,
    grated sinking gate=3289,
    rocky magic pylon=3436,
    cauldron=3500,
    Ship=3523,
    Candlestick=6234,
    magic wave effect=7613,
    ball of light=7620,
    whirling effect=7677,
    abrecan=9672,
    Alaron=9721,
    Arturo=9789,
    Baird=9851,
    Bandit=9900,
    Becan=10011,
    woman in red dress=10098,
    woman in olive dress=10119,
    woman in blue dress=10140,
    Man in blue shirt=10160,
    Man in tan shirt=10180,
    phelan=10248,
    old bearded man=10289,
    Donovan=10388,
    dryad=10460,
    king=10520,
    godric=10783,
    Guard=10840,
    jundar woman=10937,
    Jundar guard=10963,
    jundar man=10988,
    Keelin=11049,
    man in rocking chair=11073,
    Rheda=11263,
    Shadow=11287,
    sholeh=11370,
    Yeraza=11469,
    giant bat=11594,
    chaos scout=11830,
    Chaos Trooper=11906,
    Chaos Sorceror=11958,
    Chaos slayer=12001,
    chicken=12018,
    cyclops=12062,
    wind elemental=12134,
    goblin=12313,
    Gryphon=12436,
    Kitarak=12576,
    horse=12616,
    Ogre=12877,
    pocho=12976,
    salamander=13048,
    sand worm=13076,
    scorpion=13127,
    skeleton=13162,
    lich=13275,
    wolf=13314,
    Wraith=13364,
    wyvern=13411,
    zombie=13449
} Borg7Enum;

typedef struct collisionSphere collisionSphere, *PcollisionSphere;

typedef struct EnvProp EnvProp, *PEnvProp;

typedef struct collisionTypeA collisionTypeA, *PcollisionTypeA;

typedef struct SpeedProperty SpeedProperty, *PSpeedProperty;

typedef struct ControllerFull ControllerFull, *PControllerFull;

typedef struct MoveQueueEntry MoveQueueEntry, *PMoveQueueEntry;

typedef struct PlaneObj PlaneObj, *PPlaneObj;

typedef struct DCMSub2 DCMSub2, *PDCMSub2;

typedef struct attachmentNode attachmentNode, *PattachmentNode;

typedef ItemID ItemID, *PItemID;

typedef struct struct_1 struct_1, *Pstruct_1;

typedef struct struct_45 struct_45, *Pstruct_45;

typedef struct Borg7data Borg7data, *PBorg7data;

typedef struct AnidatStruct AnidatStruct, *PAnidatStruct;

typedef struct vec4f vec4f, *Pvec4f;

typedef struct AniLightData AniLightData, *PAniLightData;

typedef struct ParticleHeadStruct ParticleHeadStruct, *PParticleHeadStruct;



typedef struct Borg1header Borg1header, *PBorg1header;

typedef union Vtx Vtx, *PVtx;

typedef union Mtx Mtx, *PMtx;

typedef struct Borg1Data Borg1Data, *PBorg1Data;



typedef struct Borg12Header Borg12Header, *PBorg12Header;

typedef enum DBTypeEnum { /* Each Data category has an Id'ing byte */
    Empty=0,
    Misc_item=1,
    entity=2,
    Spell=3,
    UNK4=4,
    armor=5,
    sheild=6,
    Weapon=7,
    LootDrop=8,
    Helmet=9,
    cloak=10,
    Glove=11,
    Ring=12,
    wand=13,
    Belt=14,
    Boots=15,
    potion=16,
    Scroll=17,
    KeyItem=18,
    Amulet=19,
    dialougeEntity=20
} DBTypeEnum;

typedef struct borg6header borg6header, *Pborg6header;

typedef enum borg6Enum {
    Flycam_1=8668,
    Fycam_2=8670,
    flycam_3=8674,
    flycam_4=8676,
    flycam_5=8678,
    flycam_6=8680,
    intro_1=8729,
    intro_2=8812,
    intro_3=8850,
    intro_4=8857,
    intro_5=8864,
    intro_6=8918,
    intro_7=8941,
    intro_8=8955,
    intro_9=8988,
    intro_10=9043,
    intro_11=9052,
    intro_12=9105,
    intro_13=9147
} borg6Enum;

typedef struct Borg5header Borg5header, *PBorg5header;

typedef struct AniDatSubstruct AniDatSubstruct, *PAniDatSubstruct;

typedef struct Particle Particle, *PParticle;

typedef struct ParticleEmmiter ParticleEmmiter, *PParticleEmmiter;

typedef struct Borg9data Borg9data, *PBorg9data;

typedef struct Vtx_t Vtx_t, *PVtx_t;

typedef struct Vtx_tn Vtx_tn, *PVtx_tn;

typedef long Mtx_t[4][4];

typedef enum BORG1type {
    B1_RGBA16=0,
    B1_IA16=1,
    B1_CI8=2,
    B1_IA8=3,
    B1_CI4=5,
    B1_I4=7,
    B1_RGBA32=8
} BORG1type;

typedef struct Borg12Data Borg12Data, *PBorg12Data;

typedef struct Borg5data Borg5data, *PBorg5data;

typedef struct Borg5_particle Borg5_particle, *PBorg5_particle;

typedef struct borg9_phys borg9_phys, *Pborg9_phys;

typedef struct voxelObject voxelObject, *PvoxelObject;

typedef struct borg_9_struct borg_9_struct, *Pborg_9_struct;

typedef struct Borg11header Borg11header, *PBorg11header;

typedef struct Borg12Sub Borg12Sub, *PBorg12Sub;

typedef struct borg5substruct borg5substruct, *Pborg5substruct;

typedef struct Borg3Data Borg3Data, *PBorg3Data;

typedef struct borg2header borg2header, *Pborg2header;

typedef struct voxelHeader voxelHeader, *PvoxelHeader;

typedef union voxeldat voxeldat, *Pvoxeldat;

typedef struct LookAt LookAt, *PLookAt;

typedef union Gfx Gfx, *PGfx;

typedef struct borg2data borg2data, *Pborg2data;

typedef enum VoxelFllags {
    VOXEL_JumperPak=32,
    VOXEL_EXPPak=64,
    VOXEL_FlagC=128,
    VOXEL_Used=512,
    VOXEL_FlagB=4096,
    VOXEL_tangible=8192,
    VOXEL_Active=32768
} VoxelFllags;

typedef enum Vobject {
    VOXEL_Scene,
    VOXEL_Container,
    VOXEL_Light,
    VOXEL_Audio,
    VOXEL_WanderNode,
    VOXEL_MonsterParty,
    VOXEL_ReferencePoint,
    VOXEL_Teleporter,
    VOXEL_Camera,
    VOXEL_Dialouge,
    VOXEL_Trigger,
    VOXEL_SavePoint, /* unused */
    VOXEL_Code /* In game, but not really used */
} Vobject;

typedef enum EventFlags {
    FLAG_Cinematic1=3,
    FLAG_MeetAlaron=5,
    FLAG_MeetShadow=9,
    FLAG_KendallsHat_=10,
    FLAG_BuySpiceOffGnomes=45,
    FLAG_ShadowMerge=566,
    FLAG_Cinematic2=569,
    FLAG_Cinematic3=590,
    FLAG_Cinematic4=601,
    FLAG_EnterGweneria=788,
    FLAG_GoblinAmbush=978,
    FLAG_KendallsHat=2255,
    FLAG_Rain0=2319,
    FLAG_Rain1=2320,
    FLAG_GotFirstItems=3612,
    FLAG_NewJournalEntry=3617,
    FLAG__Slashing=3673,
    FLAG__SlashingGet=3674,
    FLAG__Darkside=3675,
    FLAG__DarksideGet=3676,
    FLAG__cheater=3693,
    FLAG__bingo=3694
} EventFlags;

typedef struct light_obj_dat light_obj_dat, *Plight_obj_dat;

typedef struct Scene_obj_dat Scene_obj_dat, *PScene_obj_dat;

typedef struct monsterparty_dat monsterparty_dat, *Pmonsterparty_dat;

typedef struct Wandernode_dat Wandernode_dat, *PWandernode_dat;

typedef struct teleport_dat teleport_dat, *Pteleport_dat;

typedef struct container_Dat container_Dat, *Pcontainer_Dat;

typedef struct Light_t Light_t, *PLight_t;

typedef struct Gwords Gwords, *PGwords;

typedef struct Gtri Gtri, *PGtri;

typedef struct SceneVoxelModel SceneVoxelModel, *PSceneVoxelModel;

typedef struct monsterpartyEntry monsterpartyEntry, *PmonsterpartyEntry;

typedef enum borg13Enum {
    goblin ambush=869,
    king dies=1278,
    alaron dies=1298,
    alaron dies 2=1299,
    alaron dies 3=1300,
    BORG13_HelpMenu=1355,
    BORG13_PassTheMarshmallows=6235
} borg13Enum;

typedef enum EnumMapDatA {
    MAPA_Overworld=0,
    MAPA_GwenCastle=4,
    MAPA_Interior=6,
    MAPA_cave=7,
    MAPA_Barrows=9,
    MAPA_Talewok=11,
    MAPA_EhudUnder=12,
    MAPA_Ugairt=13,
    MAPA_Battle=16
} EnumMapDatA;

typedef struct Tri Tri, *PTri;

struct light_obj_dat {
    Color32 cols[3];
    ushort lightType; /* 0-3 are valid types */
    u16 field2_0xe;
    float f0;
    float f1;
    float f2;
    u8 align[40];
};

struct AniLightData {
    undefined field0_0x0;
    undefined field1_0x1;
    undefined field2_0x2;
    undefined field3_0x3;
    Color32 col;
    u8 x;
    u8 y;
    u8 z;
    undefined field8_0xb;
    undefined field9_0xc;
    undefined field10_0xd;
    undefined field11_0xe;
    undefined field12_0xf;
};

struct AnidatStruct {
    struct Borg5header *borg5;
    struct borg6header *borg6;
    struct AnimationData *link;
    struct AniDatSubstruct *sub;
    void *unk10;
    u32 unk14;
};


struct AnimationData {
    struct AnidatStruct scene[5];
    undefined8 field1_0x78;
    undefined8 field2_0x80;
    MtxF matrixA;
    MtxF matrixB;
    MtxF matrixC;
    MtxF matrixD;
    MtxF matrixE;
    struct vec3f scalar;
    int locators[8];
    uint flags;
    u16 aniTime;
    u8 aniSpeed;
    u8 perspNormIndex;
    struct vec4f colorFloats;
    int colorValA;
    int colorValB;
    Color32 fogColor;
    struct AniLightData LightDatArray[7];
    Color32 lightColors[4];
    uint maxDynamicLights; /* no more than 7 */
    uint currDynamicLights;
    struct ParticleHeadStruct *particleHead;
    struct AnimationData *link2a4;
    struct AnimationData *link2a8;
    u8 unk2ac;
    char borg5_char[4];
    undefined field27_0x2b1;
    undefined field28_0x2b2;
    undefined field29_0x2b3;
    u32 unk2b4;
};

struct Light_t {
    u8 col[3];
    char pad1;
    u8 colc[3];
    char pad2;
    s8 dir[3];
    char pad3;
};

struct Tri { /* Triangle Face */
    uchar flag;
    uchar v[3];
};

union Mtx {
    Mtx_t m;
};

struct Particle {
    u16 id;
    u16 lifespan;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    ushort flags;
    struct vec3f pos;
    struct vec3f vel;
    struct vec2f scale;
    struct vec4f colorA;
    struct vec4f ColorB;
    struct vec3f vec_0x4c;
    float unk0x58;
    u32 unk0x5c; /* unused? */
    Mtx_t scaleMtx[2];
    Mtx_t translateMtx[2];
    union Mtx alignMtx;
};

struct voxelHeader { /* Header for Refernce objects (Voxels) */
    struct vec3f pos; /* Where is it */
    f32 size; /* how big is it */
    u32 timestamp; /* when was it called */
    u16 Bitfeild; /* Flags for rendering */
    u16 type; /* object type */
    short LinkID[2]; /* usually 0xFFFFFFFF (none) */
    u16 flagA; /* event flags */
    u16 flagB;
    u16 flagC;
    undefined field9_0x22;
    undefined field10_0x23;
    void *ptr0x24;
};

typedef struct{
    union {
        u16 s; //often loaded as short
        struct{
            u8 type; // from DB_TYPE
            u8 id;
        };
    };
}ItemID;






struct DCMSub2 {
    struct Borg12Header *borg12;
    u32 index;
    u8 id;
    undefined field3_0x9;
    undefined field4_0xa;
    undefined field5_0xb;
};

struct Borg5_particle {
    undefined field0_0x0;
    undefined field1_0x1;
    undefined field2_0x2;
    undefined field3_0x3;
    u16 field4_0x4;
    undefined field5_0x6;
    undefined field6_0x7;
    short field7_0x8;
    short field8_0xa;
    u16 field9_0xc;
    ushort field10_0xe;
    float field11_0x10;
    short field12_0x14;
    undefined field13_0x16;
    undefined field14_0x17;
    short field15_0x18;
    ushort field16_0x1a;
    struct vec3f pos;
    undefined field18_0x28;
    undefined field19_0x29;
    undefined field20_0x2a;
    undefined field21_0x2b;
    struct vec3f vel;
    undefined field23_0x38;
    undefined field24_0x39;
    undefined field25_0x3a;
    undefined field26_0x3b;
    undefined field27_0x3c;
    undefined field28_0x3d;
    undefined field29_0x3e;
    undefined field30_0x3f;
    undefined field31_0x40;
    undefined field32_0x41;
    undefined field33_0x42;
    undefined field34_0x43;
    struct vec4f colV;
    float field36_0x54;
    float field37_0x58;
    float field38_0x5c;
    float field39_0x60;
    float field40_0x64;
    float field41_0x68;
    float field42_0x6c;
    float field43_0x70;
    float field44_0x74;
    float field45_0x78;
    float field46_0x7c;
    float field47_0x80;
    undefined field48_0x84;
    undefined field49_0x85;
    undefined field50_0x86;
    undefined field51_0x87;
    undefined field52_0x88;
    undefined field53_0x89;
    undefined field54_0x8a;
    undefined field55_0x8b;
    undefined field56_0x8c;
    undefined field57_0x8d;
    undefined field58_0x8e;
    undefined field59_0x8f;
    undefined field60_0x90;
    undefined field61_0x91;
    undefined field62_0x92;
    undefined field63_0x93;
    float field64_0x94;
    undefined field65_0x98;
    undefined field66_0x99;
    undefined field67_0x9a;
    undefined field68_0x9b;
    float field69_0x9c;
    undefined field70_0xa0;
    undefined field71_0xa1;
    undefined field72_0xa2;
    undefined field73_0xa3;
    undefined field74_0xa4;
    undefined field75_0xa5;
    undefined field76_0xa6;
    undefined field77_0xa7;
    undefined field78_0xa8;
    undefined field79_0xa9;
    undefined field80_0xaa;
    undefined field81_0xab;
    undefined field82_0xac;
    undefined field83_0xad;
    undefined field84_0xae;
    undefined field85_0xaf;
    undefined field86_0xb0;
    undefined field87_0xb1;
    undefined field88_0xb2;
    undefined field89_0xb3;
    undefined field90_0xb4;
    undefined field91_0xb5;
    undefined field92_0xb6;
    undefined field93_0xb7;
    undefined field94_0xb8;
    undefined field95_0xb9;
    undefined field96_0xba;
    undefined field97_0xbb;
    undefined field98_0xbc;
    undefined field99_0xbd;
    undefined field100_0xbe;
    undefined field101_0xbf;
};

struct Borg9data {
    struct vec3f floatsA; /* position? */
    struct vec2f floatsB; /* size? */
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
    struct voxelObject *voxelObjs;
    struct borg_9_struct *unkStructs;
};

struct Vtx_tn {
    short ob[3];
    ushort flag;
    short tc[2];
    s8 n[3];
    u8 a;
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
    union Mtx *mtx_;
};

struct Gtri {
    int cmd:8;
    int pad:24;
    struct Tri tri;
};

struct Gwords {
    uint w0;
    uint w1;
};




struct astruct_6 {
    struct playerData *playerdat_;
    ushort short0x4;
    u8 byte0x5;
    undefined field3_0x7;
};

struct MoveQueueEntry {
    struct vec2f pos2d;
    float rad;
    short active;
    s16 flag;
};

struct Vtx_t {
    short ob[3];
    ushort flag;
    short tc[2];
    Color32 cn;
};

struct ParticleEmmiter {
    u16 ID;
    u16 lifespan;
    u16 lifespanemmiter;
    undefined field3_0x6;
    undefined field4_0x7;
    u16 unk8;
    short texture;
    u16 flags; /* 0x2000 = tangible */
    float height;
    struct Particle *particles;
    undefined field12_0x18;
    undefined field13_0x19;
    short field14_0x1a;
    u64 unk1c;
    struct vec3f pos;
    struct vec3f vel;
    u8 field18_0x3c[4];
    u32 field19_0x40;
    struct vec4f colvec4;
    struct vec4f field21_0x54;
    u8 unk0x64[340]; /* unused? */
    ulong (*unk1b8)(void); /* (Head,Emmiter) */
    ulong (*funcA)(void); /* (head) */
    ulong (*funcB)(void); /* (head,emmiter,particle) */
    struct Borg5_particle *dat1c4;
    struct ParticleEmmiter *link;
    struct AnimationData *aniDat;
    struct collisionSphere collision;
};

struct Borg12Sub {
    u32 channelCount;
    int instrument_count;
    int *unk10;
    void *unk14;
    struct astruct *ptr0x18;
    u8 *channelDat;
};

struct Borg12Data {
    struct Borg11header **instument_offset;
    u32 unk4;
    struct Borg12Sub sub;
};

struct attachmentNode {
    uint borg5;
    struct AnimationData *anidat;
    ushort index?;
    undefined field3_0xa;
    undefined field4_0xb;
};



struct Borg1header {
    int id;
    int field1_0x4;
    u8 *bitmapA;
    u8 *bitmapB;
    struct Borg1Data *dat;
};

union Vtx {
    struct Vtx_t v;
    struct Vtx_tn n;
    longlong force_Structure_alignment[2];
};

struct PlaneObj { /* used for damage numbers and shadows */
    struct Borg1header *borg1p;
    u32 unk4; /* unused */
    union Vtx verts[2][4];
    union Mtx transMtx[2];
    union Mtx alignMtx[2];
    union Mtx ScaleMtx[2];
    Color32 vertCols[4];
    struct vec3f pos;
    struct vec3f rot;
    struct vec2f scale; /* unused in mtx */
    u16 UScale;
    u16 unk23a;
    u32 unk23c; /* unused? */
    struct Borg1header Statborg1Head;
    struct Borg1Data datStatBorg1Data;
    u32 field15_0x268;
    struct vec3f statStartPos;
    struct vec2f unk278;
    float unk280;
    u32 statTime;
    s8 statAlphaDelta;
    u8 statAlpha;
    u8 statVisible;
    u32 unk28c; /* unused */
};


struct LookAt {
    struct Light_t l[2];
};

struct borg2data {
    int unk0x0;
    int dsplistcount;
    float scale;
    struct vec3f pos;
    struct vec3f rot; /* radians */
    Color32 unk0x24;
    u32 unk0x28; /* ^1&1? */
    union Gfx **dsplists;
    struct Vtx_t *vertlist;
    struct Vtx_t *vertlist2;
    u32 vertcount;
    int *unk0x3c;
    float (*unk0x40)[5]; /* posx,posy,posz,?,? unused */
    u32 unk0x44;
    u32 unk0x48;
    u32 unk0x4c;
};

union Gfx {
    struct Gwords words;
    struct Gtri tri;
};

struct ParticleHeadStruct {
    struct Particle *particles;
    short particleindecies[386];
    struct ParticleEmmiter *Emmiter;
    short emmitterIdecies[16];
    struct Borg1header **ppTextures;
    short TextureCount;
    undefined field6_0x332;
    undefined field7_0x333;
    float gray;
    struct Borg9data *borg9dat;
    u16 particleStructCount;
    ushort count1;
    ushort count2;
    u16 field13_0x342;
    u32 unk344;
    union Mtx alignMtx[2];
};

struct Borg5header {
    u32 field0_0x0;
    u32 field1_0x4;
    void *unk8;
    void *aniTextures;
    struct Borg5data dat;
};

struct struct_1 {
    struct astruct_1 *field0_0x0;
    struct borg6header *field1_0x4;
};

struct borg5substruct {
    u16 flag;
    u8 mtxOp;
    u8 tier?;
    struct borg5substruct **links;
    u32 unk0x8;
    union Mtx *mtxs;
    float yaw;
    float pitch;
    float roll;
    float x;
    float y;
    float z;
    float field12_0x28;
    float field13_0x2c;
    float field14_0x30;
    float field15_0x34;
    float field16_0x38;
    float field17_0x3c;
};

struct AniDatSubstruct {
    void *field0_0x0;
    void *field1_0x4;
    u32 field2_0x8;
    u16 field3_0xc;
    undefined field4_0xe;
    undefined field5_0xf;
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
    undefined *field8_0x14;
};

struct Borg7header {
    s32 index;
    undefined field1_0x4;
    undefined field2_0x5;
    undefined field3_0x6;
    undefined field4_0x7;
    struct AnimationData *aniDat;
    u16 currentAni;
    u16 field7_0xe;
    u16 field8_0x10;
    u16 field9_0x12;
    undefined field10_0x14;
    undefined field11_0x15;
    undefined field12_0x16;
    undefined field13_0x17;
    void **unk18;
    struct struct_1 *unk1c;
    struct vec3f unk20;
    struct vec3f unk2c;
    struct struct_45 unk38;
    struct Borg7data dat;
};

struct borg6header {
    uint field0_0x0;
    uint field1_0x4;
    int field2_0x8;
    struct borg6header *link;
    u32 flag;
    struct AnimationData *anidat;
    void *field6_0x18;
    float field7_0x1c;
    void *field8_0x20;
};

struct borg9_phys {
    struct vec3f *vertexpointers[3];
    struct vec3f normal;
    struct EnvProp *envProperty;
    ushort flags; /* 0x100 - need normalize */
    ushort GroundType;
};

typedef struct astruct_7 astruct_7, *Pastruct_7;

struct astruct_7 {
    u32 unk0;
    float unk4;
    struct Method *vTable;
    short *unkc;
    double *unk10;
    u32 unk14;
    double f64Array[7];
};

typedef struct astruct_8 astruct_8, *Pastruct_8;

typedef enum borg9Enum {
    Dryad Forest=4034,
    StartingMap=4059,
    oriana's hut=5266,
    Borg9_campfire=6236
} borg9Enum;

typedef struct Borg9header Borg9header, *PBorg9header;

struct Borg9header {
    enum borg9Enum ID;
    u32 field1_0x4;
    struct Borg9data dat;
};

struct astruct_8 {
    u32 field0_0x0;
    struct AnimationData *field1_0x4;
    enum borg9Enum ID;
    struct Borg9header *borg_9;
    uint borg_5;
    int field5_0x14;
    int tally;
    undefined field7_0x1c;
    u8 field8_0x1d;
};

typedef struct AttackVisualStruct3 AttackVisualStruct3, *PAttackVisualStruct3;

struct AttackVisualStruct3 {
    struct Borg7header *borg7;
    struct playerData *player;
    struct vec3f pos;
    u32 unk14;
    uint flag;
};

typedef struct CombatTurn CombatTurn, *PCombatTurn;

struct CombatTurn {
    u8 unk0;
    u8 unk1;
    undefined field2_0x2;
    undefined field3_0x3;
    uint unk4;
    u8 *arr;
};

typedef struct DCM_sub DCM_sub, *PDCM_sub;

struct DCM_sub {
    u32 id;
    u32 unk4;
    u16 pitch;
    u8 index;
    u8 field4_0xb;
    s8 vol;
    u8 pan;
    u8 unke;
    undefined field8_0xf;
};

typedef struct DialougeStruct DialougeStruct, *PDialougeStruct;

typedef struct dialougmode_substruct dialougmode_substruct, *Pdialougmode_substruct;

typedef struct WidgetHandler WidgetHandler, *PWidgetHandler;

typedef struct borg13data borg13data, *Pborg13data;

typedef struct struct_3 struct_3, *Pstruct_3;

typedef struct borg13command borg13command, *Pborg13command;

typedef enum borg13_commands {
    Fade_in=1,
    loadMonster=16,
    Is in party?=23,
    check event flag=24,
    check flag get rand=25,
    is item in inv?=26,
    best stat=27,
    worst stat=28,
    this_char stat=29,
    Get party size=30,
    get money?=31,
    set event flag=32,
    clear event flag=33,
    End_scene=34,
    set_2_floats=35,
    add gold=36,
    take gold=37,
    add_item=38,
    look_for_item=39,
    play sfx=43,
    shop=44,
    battle_encounter?=45,
    train skill=46,
    Add_party_member=47,
    remove_party_member=48,
    crash game=49,
    CampFullHeal=54,
    give exp=56
} borg13_commands;

struct WidgetHandler {
    struct BaseWidget *widgetA;
    struct BaseWidget *widgetB;
};

struct struct_3 {
    u8 field0_0x0;
    undefined field1_0x1;
    undefined field2_0x2;
    undefined field3_0x3;
    ItemID ent_ID;
    undefined field5_0x6;
    undefined field6_0x7;
    char *txt;
};

struct dialougmode_substruct {
    struct struct_3 unkstruct[8];
    undefined field1_0x60;
    undefined field2_0x61;
    undefined field3_0x62;
    undefined field4_0x63;
    undefined field5_0x64;
    undefined field6_0x65;
    undefined field7_0x66;
    undefined field8_0x67;
    undefined field9_0x68;
    undefined field10_0x69;
    undefined field11_0x6a;
    undefined field12_0x6b;
    undefined field13_0x6c;
    undefined field14_0x6d;
    undefined field15_0x6e;
    undefined field16_0x6f;
    struct playerData **actors;
    u16 actorCount;
    undefined field19_0x76;
    undefined field20_0x77;
    undefined field21_0x78;
    undefined field22_0x79;
    undefined field23_0x7a;
    undefined field24_0x7b;
    undefined field25_0x7c;
    undefined field26_0x7d;
    undefined field27_0x7e;
    undefined field28_0x7f;
    undefined field29_0x80;
    undefined field30_0x81;
    undefined field31_0x82;
    undefined field32_0x83;
    undefined field33_0x84;
    undefined field34_0x85;
    undefined field35_0x86;
    undefined field36_0x87;
    undefined field37_0x88;
    undefined field38_0x89;
    undefined field39_0x8a;
    undefined field40_0x8b;
    undefined field41_0x8c;
    undefined field42_0x8d;
    undefined field43_0x8e;
    undefined field44_0x8f;
    undefined field45_0x90;
    undefined field46_0x91;
    undefined field47_0x92;
    undefined field48_0x93;
    undefined field49_0x94;
    undefined field50_0x95;
    undefined field51_0x96;
    undefined field52_0x97;
    undefined field53_0x98;
    undefined field54_0x99;
    undefined field55_0x9a;
    undefined field56_0x9b;
    undefined field57_0x9c;
    undefined field58_0x9d;
    undefined field59_0x9e;
    undefined field60_0x9f;
    undefined field61_0xa0;
    undefined field62_0xa1;
    undefined field63_0xa2;
    undefined field64_0xa3;
    undefined field65_0xa4;
    undefined field66_0xa5;
    undefined field67_0xa6;
    undefined field68_0xa7;
    undefined field69_0xa8;
    undefined field70_0xa9;
    undefined field71_0xaa;
    undefined field72_0xab;
    undefined field73_0xac;
    undefined field74_0xad;
    undefined field75_0xae;
    undefined field76_0xaf;
    undefined field77_0xb0;
    undefined field78_0xb1;
    undefined field79_0xb2;
    undefined field80_0xb3;
    undefined field81_0xb4;
    undefined field82_0xb5;
    undefined field83_0xb6;
    undefined field84_0xb7;
    undefined field85_0xb8;
    undefined field86_0xb9;
    undefined field87_0xba;
    undefined field88_0xbb;
    undefined field89_0xbc;
    undefined field90_0xbd;
    undefined field91_0xbe;
    undefined field92_0xbf;
    undefined field93_0xc0;
    undefined field94_0xc1;
    undefined field95_0xc2;
    undefined field96_0xc3;
    undefined field97_0xc4;
    undefined field98_0xc5;
    undefined field99_0xc6;
    undefined field100_0xc7;
    undefined field101_0xc8;
    undefined field102_0xc9;
    undefined field103_0xca;
    undefined field104_0xcb;
    undefined field105_0xcc;
    undefined field106_0xcd;
    undefined field107_0xce;
    undefined field108_0xcf;
    undefined field109_0xd0;
    undefined field110_0xd1;
    undefined field111_0xd2;
    undefined field112_0xd3;
    undefined field113_0xd4;
    undefined field114_0xd5;
    undefined field115_0xd6;
    undefined field116_0xd7;
    undefined field117_0xd8;
    undefined field118_0xd9;
    undefined field119_0xda;
    undefined field120_0xdb;
    undefined field121_0xdc;
    undefined field122_0xdd;
    undefined field123_0xde;
    undefined field124_0xdf;
    undefined field125_0xe0;
    undefined field126_0xe1;
    undefined field127_0xe2;
    undefined field128_0xe3;
    undefined field129_0xe4;
    undefined field130_0xe5;
    undefined field131_0xe6;
    undefined field132_0xe7;
    undefined field133_0xe8;
    undefined field134_0xe9;
    undefined field135_0xea;
    undefined field136_0xeb;
    undefined field137_0xec;
    undefined field138_0xed;
    undefined field139_0xee;
    undefined field140_0xef;
    ushort encounterEnemies[12];
    u16 unk108;
    ItemID Entid;
    ushort RefpointID;
    ushort unk10e;
    char unk110;
    u8 unk111;
    u8 unk112;
    u8 unk113;
    u8 battlefeild;
    u8 unk115;
    u8 unk116;
    undefined field153_0x117;
};

struct borg13data {
    struct borg13command *commands_pointer;
    ushort (*actors)[4];
    char *text;
    ushort ID;
    u16 flag;
    u8 A;
    u8 B;
    u8 CmdCount;
    u8 ActorCount;
    u8 start_func;
    u8 C;
    u8 pad[2];
};

struct borg13command {
    ushort val;
    enum borg13_commands com;
    undefined field2_0x3;
    undefined field3_0x4;
    undefined field4_0x5;
    undefined field5_0x6;
    undefined field6_0x7;
    undefined field7_0x8;
    undefined field8_0x9;
    undefined field9_0xa;
    undefined field10_0xb;
    undefined field11_0xc;
    undefined field12_0xd;
    undefined field13_0xe;
    undefined field14_0xf;
    undefined field15_0x10;
    undefined field16_0x11;
    undefined field17_0x12;
    undefined field18_0x13;
    undefined field19_0x14;
    undefined field20_0x15;
    undefined field21_0x16;
    undefined field22_0x17;
    undefined field23_0x18;
    undefined field24_0x19;
    undefined field25_0x1a;
    undefined field26_0x1b;
    undefined field27_0x1c;
    undefined field28_0x1d;
    undefined field29_0x1e;
    undefined field30_0x1f;
    short text_marker;
    undefined field32_0x22;
    undefined field33_0x23;
    ushort a;
    ushort b;
    u8 index;
    u8 c;
    undefined field38_0x2a;
    undefined field39_0x2b;
    undefined field40_0x2c;
    undefined field41_0x2d;
    undefined field42_0x2e;
    undefined field43_0x2f;
    undefined field44_0x30;
    u8 bitmask;
    undefined field46_0x32;
    undefined field47_0x33;
    undefined field48_0x34;
    undefined field49_0x35;
    undefined field50_0x36;
    undefined field51_0x37;
};

struct DialougeStruct {
    u8 field0_0x0;
    undefined field1_0x1;
    undefined field2_0x2;
    undefined field3_0x3;
    struct BaseWidget *widgetMenu;
    struct dialougmode_substruct *dialouge_substruct;
    u32 field6_0xc;
    struct WidgetHandler *handler;
    struct borg13data *borg_13_dat;
    undefined field9_0x18;
    undefined field10_0x19;
    undefined field11_0x1a;
    undefined field12_0x1b;
    u32 field13_0x1c;
    u32 field14_0x20;
    u8 type;
    undefined field16_0x25;
    undefined field17_0x26;
    undefined field18_0x27;
};

typedef struct DollBarterConfirm DollBarterConfirm, *PDollBarterConfirm;

struct DollBarterConfirm {
    struct BaseWidget base;
    void* field1_0x7c;
    struct BaseWidget *field5_0x80;
    struct BaseWidget *field6_0x84;
    int field7_0x88;
    u8 field8_0x8c;
};

typedef struct InputWidgetSubStruct InputWidgetSubStruct, *PInputWidgetSubStruct;

struct InputWidgetSubStruct {
    struct BaseWidget *arrayMenu;
    char *output;
    char *entry;
    struct BaseWidget *cursor;
    u8 entryIndex;
};

typedef struct IntroMenuSub IntroMenuSub, *PIntroMenuSub;

typedef struct InputMenu InputMenu, *PInputMenu;

typedef struct WidgetContPakData WidgetContPakData, *PWidgetContPakData;

typedef struct SaveDatPointers SaveDatPointers, *PSaveDatPointers;

typedef struct WidgetMenuChild WidgetMenuChild, *PWidgetMenuChild;

typedef u8 PFS_ERR8;

typedef enum Borg8Enum { /* Sprites/Textures */
    BORG8_CompassWest=23,
    BORG8_CompassNorth=24,
    BORG8_CompassSouth=25,
    BORG8_CompassEast=26,
    BORG8_compassRing=27,
    BORG8_MainFont=29,
    BORG8_MapIconStart=30,
    long down arrow=213,
    BORG8_Spacer=215,
    BORG8_PauseBGOptions=216,
    BORG8_PauseBGStats=217,
    BORG8_PauseBGMap=218,
    BORG8_CurrDayMarker=220,
    BORG8_CampTitle=221,
    BORG8_LogoH2O=222,
    BORG8_PortraitHighlight=223,
    Parchment background=226,
    Parchment Background_2=227,
    Parchment shadow=228,
    Parchment Window 2=229,
    BORG8_TitleJournal=230,
    BORG8_TitleInventory=233,
    BORG8_TitleSkills=236,
    BORG8_TitleSpells=237,
    BORG8_TitleTrain=239,
    BORG8_TitleMenui=242,
    square highlight=243,
    66 px highligh 2=244,
    66 px highlight=245,
    map marker=246,
    BORG8_CONTROLLER_PAK=247,
    blank space?=248,
    BORG8_TitleEnterName=249,
    BORG8_TitleLicence=250,
    BORG8_WarningNoController=251,
    BORG8_WarningNoControllerPak=252,
    BORG8_TitleOptions=253,
    BORG8_TitlePause=254,
    BORG8_TitleSaveGame=255,
    BORG8_TitleTheater=256,
    BORG8_LogoTHQ=257,
    BORG8_TitlePressStart=258,
    Borg8_TitleCard=259,
    Borg8_TitleCardShadow=260,
    42 px box=261,
    BORG8_PortraitAbrecan=262,
    BORG8_PortraitAlaron=264,
    BORG8_PortraitBat=272,
    BORG8_PortraitBear=274,
    BORG8_PortraitChaosScout=284,
    BORG8_PortraitNPCMale1=293,
    BORG8_PortraitGoblin=318,
    BORG8_PortraitGodrik=320,
    BORG8_PortraitKeelin=335,
    BORG8_PortraitShadow=361,
    BORG8_PortraitSheridan=362,
    BORG8_PortraitCrossbone=365,
    BORG8_PortraitTentacle=366,
    BORG8_PortraitBanner=384,
    BORG8_PortraitSignpost=385,
    BORG8_JournalBG=386,
    BORG8_IconSkAlchemist=387,
    BORG8_IconSkDiplomat=388,
    BORG8_IconSkHealer=389,
    BORG8_IconSkLoremaster=390,
    BORG8_IconSkMechanic=391,
    BORG8_IconSkMerchant=392,
    BORG8_IconSkRanger=393,
    BORG8_IconSkStealth=394,
    BORG8_IconSkTheif=395,
    BORG8_IconSkTroubador=396,
    BORG8_IconSkWarrior=397,
    BORG8_IconSkWizard=398,
    BORG8_CloudA=399,
    BORG8_CloudB=400,
    BORG8_CloudC=401,
    Borg8_LensflareFilled=402,
    Borg8_LensflareRing=403,
    BORG8_MoonNew=404,
    BORG8_MoonCresent=405,
    BORG8_MoonQuarter=406,
    BORG8_MoonGibb=407,
    BORG8_MoonFull=408,
    pillar=409,
    Sun texture?=418,
    BORG8_IconAsLunar=419,
    BORG8_IconAsSolar=420,
    BORG8_IconSpell0=421,
    BORG8_IconSpell1=422,
    BORG8_IconSpell2=423,
    BORG8_IconSpell3=424,
    BORG8_IconSpell4=425,
    BORG8_IconSpell5=426,
    BORG8_IconSpell6=427,
    BORG8_IconSpell7=428,
    BORG8_IconSpell8=429,
    BORG8_IconSpell9=430,
    BORG8_IconSpell10=431,
    BORG8_IconSpell11=434,
    BORG8_SundailMoonA=436,
    BORG8_SundailMoonB=440,
    BORG8_SundaiCross=442,
    BORG8_GradientA=447,
    BORG8_GradientB=450,
    BORG8_GradientC=451,
    BORG8_Pixel=452,
    2 black pixels=453,
    28 px soft edge square=454,
    14px square=455,
    Gwen map overlay=457,
    galaxy swirl?=464,
    Fire effect?=3424,
    Some Face?=3514,
    musical notes=6842,
    BORG8_IconItemAmoranth=13756,
    BORG8_IconItemAmulet1=13757,
    BORG8_IconItemAmulet2=13758,
    BORG8_IconItemAmulet3=13759,
    BORG8_IconItemAmulet4=13760,
    BORG8_IconItemChestArmor1=13761,
    BORG8_IconItemCheatArmor2=13762,
    BORG8_IconItemCheastArmor3=13763,
    BORG8_IconItemCheastArmor4=13764,
    Axe=13765,
    Flag/sythe=13766,
    Circlet=13767,
    Cuccoon=13768,
    Boot icon=13769,
    Bow and arrow icon=13770,
    Cloack Icon=13771,
    green cloack icon=13772,
    purple cloack icon=13773,
    BORG8_IconItemClub=13774,
    BORG8_IconItemSword=13775,
    BORG8_IconItemStaff=13776,
    2 pad icon=13777,
    BORG8_IconItemGem=13778,
    BORG8_IconItemGem2=13779,
    BORG8_IconItemGem3=13780,
    BORG8_IconItemLeatherGlove=13781,
    BORG8_IconItemHarp=13782,
    BORG8_IconItemBlueHat=13783,
    BORG8_IconItemKendallHat=13784,
    BORG8_IconItemLeatherCloak=13785,
    BORG8_IconItemHerb=13786,
    BORG8_IconItemHide=13787,
    BORG8_IconItemUnk=13788,
    BORG8_IconItemKey1=13789,
    BORG8_IconItemKey2=13790,
    BORG8_IconItemKey3=13791,
    BORG8_IconItemHorn=13792,
    BORG8_IconItemMace=13793,
    BORG8_IconItemParchment=13794,
    BORG8_IconItemPike=13795,
    BORG8_IconItemPotion=13797,
    BORG8_IconItemScroll=13801,
    BORG8_IconItemSicle=13802,
    BORG8_IconItemShield1=13803,
    BORG8_IconItemStaff2=13805,
    BORG8_IconItemSword2=13806,
    BORG8_IconItemSword3=13807,
    BORG8_IconItemThrowIron=13808,
    BORG8_IconSlotCloak=13815,
    BORG8_IconSlotGlove=13816,
    BORG8_IconSlotHelmet=13817,
    BORG8_IconSlotShield=13823,
    BORG8_IconSlotStaff=13824,
    BORG8_IconSlotSword=13825,
    Spotlight?=13826,
    BORG8_BGBook2=13827,
    BORG8_BGPlaque=13828,
    BORG8_BGParchment=13829,
    BORG8_BGBookLeaf=13830,
    BORG8_BGBluPlaque=13831,
    BORG8_BGParchment2=13832,
    2 horizontal arrows=14166,
    BORG8_ExpPakYes=14168,
    BORG8_ExpPakNo=14169,
    Ritual=14171,
    crecent moon=14239,
    half moon=14240,
    PortSaidMarker=14270,
    Terminor Marker=14272,
    Ugarit Marker=14273,
    Borg8_PAL_Warning=14275,
    BORG8_PortraitMinotuar=14406,
    cyclops_Hurlstar=14422,
    BORG8_PortraitHorse=14423,
    up arrow=14544
} Borg8Enum;

typedef enum CONT_STATUS {
    CONT_CARD_ON=1,
    CONT_CARD_PULL=2,
    CONT_ADDR_CRC_ER=4,
    CONT_EEPROM_BUSY=128
} CONT_STATUS;

typedef struct SaveDatStruct SaveDatStruct, *PSaveDatStruct;

typedef struct SavePartyHeader SavePartyHeader, *PSavePartyHeader;

typedef struct mapFloatDat mapFloatDat, *PmapFloatDat;

typedef struct unkGuiSubstruct unkGuiSubstruct, *PunkGuiSubstruct;

struct InputMenu {
    struct BaseWidget base;
    u16 unk7c;
    u16 field2_0x7e;
};

struct mapFloatDat {
    struct vec3f playerVec3;
    struct vec2f playerVec2;
    struct vec3f cameraVec3;
    u16 MapShort1;
    u16 MapShort2;
    enum EnumMapDatA mapDatA;
    u16 mapDatB;
    u16 mapDatC;
    u16 field8_0x2a;
};

struct SavePartyHeader {
    int time;
    ItemID party[4];
    char name[20];
};

struct SaveDatStruct {
    struct SavePartyHeader headerDat;
    undefined field1_0x20;
    undefined field2_0x21;
    undefined field3_0x22;
    undefined field4_0x23;
    undefined field5_0x24;
    undefined field6_0x25;
    undefined field7_0x26;
    undefined field8_0x27;
    undefined field9_0x28;
    undefined field10_0x29;
    undefined field11_0x2a;
    undefined field12_0x2b;
    undefined field13_0x2c;
    undefined field14_0x2d;
    undefined field15_0x2e;
    undefined field16_0x2f;
    undefined field17_0x30;
    undefined field18_0x31;
    undefined field19_0x32;
    undefined field20_0x33;
    undefined field21_0x34;
    undefined field22_0x35;
    undefined field23_0x36;
    undefined field24_0x37;
    undefined field25_0x38;
    undefined field26_0x39;
    undefined field27_0x3a;
    undefined field28_0x3b;
    undefined field29_0x3c;
    undefined field30_0x3d;
    undefined field31_0x3e;
    undefined field32_0x3f;
    struct mapFloatDat mapDat;
    undefined field34_0x6c;
    undefined field35_0x6d;
    undefined field36_0x6e;
    undefined field37_0x6f;
    undefined field38_0x70;
    undefined field39_0x71;
    undefined field40_0x72;
    undefined field41_0x73;
    undefined field42_0x74;
    undefined field43_0x75;
    undefined field44_0x76;
    undefined field45_0x77;
    undefined field46_0x78;
    undefined field47_0x79;
    undefined field48_0x7a;
    undefined field49_0x7b;
    undefined field50_0x7c;
    undefined field51_0x7d;
    undefined field52_0x7e;
    undefined field53_0x7f;
    u8 flags[640];
    u8 screenshot[4096];
    u8 minimap[64];
    u8 gameState[1984];
    u8 voxelChart[256]; /* last 2 bytes for checksum */
};

struct SaveDatPointers {
    struct SaveDatStruct *datStart;
    struct SavePartyHeader *savePartyHead;
    struct mapFloatDat *mapdata;
    u8 *EventFlags;
    u8 *gamestate;
    void *screenshot;
    u32 *minimap;
    u8 *voxelChart;
};

struct WidgetContPakData {
    struct BaseWidget base;
    struct SaveDatPointers saveDatsP[16];
    struct WidgetMenuChild *unk27c;
    struct BaseWidget *field3_0x280;
    ulong (*funcA)(void);
    ulong (*funcB)(void);
    u8 OtherState;
    PFS_ERR8 pfsErr; /* shortened to 1 byte */
    u8 saveSlot;
    u8 AidynSaveSlots;
    undefined field10_0x290;
    undefined field11_0x291;
    u16 unk292;
    u16 unk294;
    undefined field14_0x296;
    undefined field15_0x297;
    u32 borg8;
    struct BaseWidget *field17_0x29c;
    struct BaseWidget *unk2a0;
    undefined field19_0x2a4;
    Color32 col0;
    Color32 col1;
    Color32 col2;
    undefined field23_0x2b1;
    undefined field24_0x2b2;
    undefined field25_0x2b3;
    u32 unk2B4;
    enum CONT_STATUS contStatus;
    undefined field28_0x2b9;
    undefined field29_0x2ba;
    undefined field30_0x2bb;
    struct WidgetHandler widgetHandler;
    void *dataBuffer;
    s32 filenum;
};

struct IntroMenuSub {
    struct BaseWidget *StartGameMenu;
    undefined field1_0x4;
    undefined field2_0x5;
    undefined field3_0x6;
    undefined field4_0x7;
    struct InputMenu *inputMenu;
    undefined field6_0xc;
    undefined field7_0xd;
    undefined field8_0xe;
    undefined field9_0xf;
    struct WidgetContPakData *field10_0x10;
    struct BaseWidget *titleShadow;
    struct BaseWidget *PressStart;
    struct BaseWidget *field13_0x1c;
    struct BaseWidget *field14_0x20;
    u8 menuState;
    undefined field16_0x25;
    undefined field17_0x26;
    undefined field18_0x27;
};

struct unkGuiSubstruct {
    u32 field0_0x0;
    struct astruct_7 **ptr;
    u32 present;
    int size;
};

struct WidgetMenuChild {
    struct BaseWidget base;
    u32 field1_0x7c;
    struct BaseWidget *field2_0x80;
    struct BaseWidget *field3_0x84;
    struct unkGuiSubstruct field4_0x88;
    u32 field5_0x98;
    u32 field6_0x9c;
    u32 field7_0xa0;
};

typedef struct romcopy_struct romcopy_struct, *Promcopy_struct;

typedef void *OSMesg;

typedef struct OSMesgQueue OSMesgQueue, *POSMesgQueue;

typedef struct OSThread OSThread, *POSThread;

typedef enum enum_OSPri {
    IDLE=0,
    APPMAX=127,
    SIMGR=140,
    PIMGR=150,
    RMONSPIN=200,
    RMON=250,
    VIMGR=254,
    MAX=255
} enum_OSPri;

typedef enum OS_STATE {
    STOPPED=1,
    RUNNABLE=2,
    RUNNING=4,
    WAITING=8
} OS_STATE;

typedef s32 OSId;

typedef struct __OSThreadContext __OSThreadContext, *P__OSThreadContext;

typedef ulonglong u_int64_t;

typedef enum DEFINE_FPSR {
    FPCSR_RN=0,
    FPCSR_RZ=1,
    FPCSR_RP=2,
    FPCSR_RM=3,
    FPCSR_FI=4,
    FPCSR_FU=8,
    FPCSR_F0=16,
    FPCSR_FZ=32,
    FPCSR_FV=64,
    FPCSR_EI=128,
    FPCSR_EU=256,
    FPCSR_EO=512,
    FPCSR_EZ=1024,
    FPCSR_EV=2048,
    FPCSR_CI=4096,
    FPCSR_CU=8192,
    FPCSR_CO=16384,
    FPCSR_CZ=32768,
    FPCSR_CV=65536,
    FPCSR_CE=131072,
    FPCSR_C=8388608,
    FPCSR_FS=16777216
} DEFINE_FPSR;

typedef union __OSfp __OSfp, *P__OSfp;

struct OSMesgQueue {
    struct OSThread *mtqueue;
    struct OSThread *fullqueue;
    int validCount;
    int first;
    int msgCount;
    void *msg;
};

struct romcopy_struct {
    OSMesg msg;
    struct OSMesgQueue msgQ;
    void *VAddr;
    u32 devAddr;
    u32 Bytes;
};

union __OSfp {
    double d;
};

struct __OSThreadContext {
    u_int64_t at;
    u_int64_t v0;
    u_int64_t v1;
    u_int64_t a0;
    u_int64_t a1;
    u_int64_t a2;
    u_int64_t a3;
    u_int64_t t0;
    u_int64_t t1;
    u_int64_t t2;
    u_int64_t t3;
    u_int64_t t4;
    u_int64_t t5;
    u_int64_t t6;
    u_int64_t t7;
    u_int64_t s0;
    u_int64_t s1;
    u_int64_t s2;
    u_int64_t s3;
    u_int64_t s4;
    u_int64_t s5;
    u_int64_t s6;
    u_int64_t s7;
    u_int64_t t8;
    u_int64_t t9;
    u_int64_t gp;
    u_int64_t sp;
    u_int64_t s8;
    u_int64_t ra;
    u_int64_t lo;
    u_int64_t hi;
    u32 sr;
    u32 pc;
    u32 cause;
    u32 badvaddr;
    u32 rcp;
    enum DEFINE_FPSR fpsr;
    union __OSfp fp0;
    union __OSfp fp2;
    union __OSfp fp4;
    union __OSfp fp6;
    union __OSfp fp8;
    union __OSfp fp10;
    union __OSfp fp12;
    union __OSfp fp14;
    union __OSfp fp16;
    union __OSfp fp18;
    union __OSfp fp20;
    union __OSfp fp22;
    union __OSfp fp24;
    union __OSfp fp26;
    union __OSfp fp28;
    union __OSfp fp30;
};

struct OSThread {
    struct OSThread *Next;
    enum enum_OSPri Priority;
    struct OSThread **Queue;
    struct OSThread *tlnext;
    enum OS_STATE state;
    u16 flags;
    OSId id;
    int fp;
    u32 unk;
    struct __OSThreadContext context;
};

typedef struct SkySubstruct SkySubstruct, *PSkySubstruct;

struct SkySubstruct {
    struct Borg8header *Borg8;
    u32 height;
    u16 type;
};

typedef struct spellVisualsEntry spellVisualsEntry, *PspellVisualsEntry;

struct spellVisualsEntry {
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

typedef struct SpellVisualsEntry2 SpellVisualsEntry2, *PSpellVisualsEntry2;

struct SpellVisualsEntry2 {
    struct playerData *playerDat;
    uint flags;
    s16 field2_0x8;
    s16 timer;
    short field4_0xc;
    short field5_0xe;
    s16 unk10;
    undefined field7_0x12;
    undefined field8_0x13;
};

typedef struct UnkAudioStruct UnkAudioStruct, *PUnkAudioStruct;

struct UnkAudioStruct {
    ushort field0_0x0;
    u8 field1_0x2;
    u8 randVal;
    u8 field3_0x4[4];
};

typedef struct WidgetArrayMenu_substruct WidgetArrayMenu_substruct, *PWidgetArrayMenu_substruct;

struct WidgetArrayMenu_substruct {
    struct BaseWidget **entries;
    u16 entryCap;
    u16 entryPos;
    u16 field3_0x8;
    u16 entryY;
    u16 entryCount;
    undefined field6_0xe;
    undefined field7_0xf;
    u16 field8_0x10;
};

typedef struct WidgetFastScrollMenuSubstruct WidgetFastScrollMenuSubstruct, *PWidgetFastScrollMenuSubstruct;

struct WidgetFastScrollMenuSubstruct {
    undefined field0_0x0;
    undefined field1_0x1;
    Color32 colA;
    Color32 colB;
    undefined field4_0xa;
    undefined field5_0xb;
    Color32 colC;
    undefined field7_0x10;
    undefined field8_0x11;
    u16 field9_0x12;
    undefined field10_0x14;
    undefined field11_0x15;
    undefined field12_0x16;
    undefined field13_0x17;
    struct BaseWidget **items;
    ushort maxItems;
    u16 itemHighlighhted;
    u16 ItemTotal;
    undefined field18_0x22;
    undefined field19_0x23;
};


struct WidgetOptionsSubstruct {
    struct BaseWidget *ScrollMenu;
    struct BaseWidget *theatreMenu;
    struct BaseWidget *optionsConfig;
    u32 field3_0xc;
    struct BaseWidget *unk10;
    struct BaseWidget *unk14;
    u8 field6_0x18;
};

typedef struct WidgetScrollList_Substruct WidgetScrollList_Substruct, *PWidgetScrollList_Substruct;

struct WidgetScrollList_Substruct {
    undefined field0_0x0;
    undefined field1_0x1;
    undefined field2_0x2;
    undefined field3_0x3;
    u16 field4_0x4;
    undefined field5_0x6;
    undefined field6_0x7;
    u16 field7_0x8;
    undefined field8_0xa;
    undefined field9_0xb;
    struct BaseWidget **items;
    u8 itemMax;
    undefined field12_0x11;
    u8 itemCount;
    undefined field14_0x13;
};

typedef struct WidgetSubstruct8 WidgetSubstruct8, *PWidgetSubstruct8;

struct WidgetSubstruct8 { /* If widget->GetNumber returns 8 */
    u8 field0_0x0;
    u8 field1_0x1;
    u8 r[2];
    u8 g[2];
    u8 b[2];
    u8 a[2];
    u8 field6_0xa;
    u8 field7_0xb;
    u8 field8_0xc;
    u8 field9_0xd;
    u8 field10_0xe;
    u8 field11_0xf;
};



typedef struct WidgetSubstruct_Shadowtext WidgetSubstruct_Shadowtext, *PWidgetSubstruct_Shadowtext;

struct WidgetSubstruct_Shadowtext {
    char *txt;
    undefined field1_0x4;
    undefined field2_0x5;
    undefined field3_0x6;
    undefined field4_0x7;
    char *field5_0x8;
    char *field6_0xc;
    u16 field7_0x10;
    u16 field8_0x12;
    u16 field9_0x14;
    u16 field10_0x16;
    undefined field11_0x18;
    undefined field12_0x19;
    undefined field13_0x1a;
    undefined field14_0x1b;
    u32 field15_0x1c;
};

typedef enum Borg12Enum { /* Music/SFX */
    Tacet=0,
    BORG12_Intro_NoExp=1497,
    BORG12_chimeScale=1511,
    BORG12_Intro_Exp=1586,
    Metal klink=1791,
    Metal Klink=1792,
    Metal Knink 2=1793,
    BORG12_CheatCorrect=1816,
    Waterfall=1817,
    Fire Crackle=1819,
    Underwater_noise=1820,
    rolling thunder=1822,
    thunderstorm=1823,
    BORG12_CheatUnused=1824,
    BORG12_CheatFail=1825,
    Bag Open?=1828,
    Medium Whack=1829,
    Explosion Bang=1831,
    Light Whack=1832,
    Chest Open=1833,
    door Open?=1835,
    Creak open=1836,
    Coins_jingle=1837,
    coinJingle=1838,
    cursor tick=1851,
    CursorChirp=1853,
    menu select=1857,
    coughing=1865,
    Menu_open=1869,
    Menu_Scroll=1870,
    Heavy Whack=1871
} Borg12Enum;

typedef struct borg13header borg13header, *Pborg13header;

struct borg13header {
    enum borg13Enum ID;
    int field1_0x4;
    void *field2_0x8;
    undefined field3_0xc;
    undefined field4_0xd;
    undefined field5_0xe;
    undefined field6_0xf;
    struct borg13data *borg13_dat;
    undefined field8_0x14;
    undefined field9_0x15;
    undefined field10_0x16;
    undefined field11_0x17;
};

typedef enum Borg1Formats {
    RGBA16=0,
    IA16=1,
    CI8=2,
    IA8=3,
    CI4=5,
    RGBA32=8
} Borg1Formats;

typedef struct borg_short borg_short, *Pborg_short;

struct borg_short {
    enum borg13Enum borg_13;
    u16 pad;
    short some_num;
};

typedef struct combat_aiscore combat_aiscore, *Pcombat_aiscore;


typedef enum PotionEnum {
    POTION_FIRE=0,
    POTION_INFERNO=1,
    POTION_SLEEP=2,
    POTION_ACID=3,
    POTION_HEALING=4,
    POTION_STAMINA=5,
    POTION_CURING=6,
    POTION_ANTIDOTE=7,
    POTION_RESTORE=8,
    POTION_STRENGTH=9,
    POTION_DEXTERITY=10,
    POTION_ASPECT=11,
    POTION_JUMP=12,
    POTION_CLARITY=13,
    POTION_CHARISMA=14,
    POTION_DEFENCE=15,
    POTION_STEALTH=16
} PotionEnum;

typedef struct resist_float resist_float, *Presist_float;

typedef CharSheet[9]* saveEntity;

typedef struct CombatAIInfo CombatAIInfo, *PCombatAIInfo;

typedef enum ElementEnum {
    ELEMENT_NONE=0,
    ELEMENT_Earth=1,
    ELEMENT_Solar=2,
    ELEMENT_Physical=3,
    ELEMENT_Necromany=4,
    ELEMENT_Fire=5,
    ELEMENT_Lunar=6,
    ELEMENT_Naming=7,
    ELEMENT_Water=8,
    ELEMENT_Magic=9,
    ELEMENT_Air=10,
    ELEMENT_Star=11,
    ELEMENT_Elemental=12,
    ELEMENT_Chaos=13,
    ELEMENT_Cutting=14,
    ELEMENT_Smashing=15,
    ELEMENT_Holy=16
} ElementEnum;

typedef struct ArmorInstance ArmorInstance, *PArmorInstance;

typedef struct WeaponInstance WeaponInstance, *PWeaponInstance;

typedef struct CharGear CharGear, *PCharGear;

typedef struct Spellbook Spellbook, *PSpellbook;

typedef struct effects effects, *Peffects;

typedef struct PotionEffect PotionEffect, *PPotionEffect;

typedef enum SpellEnum {
    SPELLIND_Immolation,
    SPELLIND_escape,
    SPELLIND_removePoison,
    SPELLIND_AirSheild,
    SPELLIND_ControlElem,
    SPELLIND_debilitation,
    SPELLIND_DragonFlames,
    SPELLIND_EarthSmite,
    SPELLIND_fireball,
    SPELLIND_lightning,
    SPELLIND_strength,
    SPELLIND_wind,
    SPELLIND_teleportation,
    SPELLIND_brilliance,
    SPELLIND_stupidity,
    SPELLIND_banishing,
    SPELLIND_charming,
    SPELLIND_controlMarquis,
    SPELLIND_detectingTraps,
    SPELLIND_endurance,
    SPELLIND_opening,
    SPELLIND_senseAura,
    SPELLIND_weakness,
    SPELLIND_cheatDeath,
    SPELLIND_AcidBolt,
    SPELLIND_auraOfDeath,
    SPELLIND_wraithTouch,
    SPELLIND_controlZombies,
    SPELLIND_crushingDeath,
    SPELLIND_darkness,
    SPELLIND_haste,
    SPELLIND_exhaustion,
    SPELLIND_stamina,
    SPELLIND_tapStamina,
    SPELLIND_wallOfBones,
    SPELLIND_spiritSheild,
    SPELLIND_poison,
    SPELLIND_mirror,
    SPELLIND_vsElemental,
    SPELLIND_vsNaming,
    SPELLIND_vsNecromancy,
    SPELLIND_vsStar,
    SPELLIND_dispelElemental,
    SPELLIND_dispelNaming,
    SPELLIND_dispelNecro,
    SPELLIND_dispelStar,
    SPELLIND_photosynthesis,
    SPELLIND_solarWraith,
    SPELLIND_starlightSheild,
    SPELLIND_detectMoonPhase,
    SPELLIND_detectSunPhase,
    SPELLIND_dexterity,
    SPELLIND_clumsiness,
    SPELLIND_frozenDoom,
    SPELLIND_light,
    SPELLIND_stealth,
    SPELLIND_stellarGravity,
    SPELLIND_webOfStarlight,
    SPELLIND_whitefire,
    SPELLIND_NONE=255
} SpellEnum;

typedef enum MagicSchoolEnum {
    SCHOOL_Chaos,
    SCHOOL_Elemental,
    SCHOOL_Naming,
    SCHOOL_Necromancy,
    SCHOOL_NONE,
    SCHOOL_Star
} MagicSchoolEnum;



typedef struct ItemInstance ItemInstance, *PItemInstance;

typedef struct Temp_enchant Temp_enchant, *PTemp_enchant;

typedef struct GearInstance GearInstance, *PGearInstance;

typedef struct SpellInstance SpellInstance, *PSpellInstance;

typedef enum AspectEnum {
    ASPECT_NONE=0,
    ASPECT_LUNAR=1,
    ASPECT_SOLAR=2
} AspectEnum;

typedef struct StatMod StatMod, *PStatMod;

typedef struct SpellCharges SpellCharges, *PSpellCharges;

typedef enum MagicCastedEnum {
    MCAST_SELF=0,
    MCAST_ONE=1,
    MCAST_ALL=2,
    MCAST_RANK=3
} MagicCastedEnum;

typedef enum MagicTargetEnum {
    outside_Combat=0,
    Party_in_Area=1,
    Enemy_in_Area=2,
    All_in_Area=3,
    Target_All=4
} MagicTargetEnum;

typedef enum MagicSpecial {
    Magic_TrueName=1,
    Magic_IsHeavy=2,
    Magic_SolarAspect=3,
    MagicLunarAspect=4
} MagicSpecial;

typedef enum MigicCostEnum {
    SPELLUSE_NONE=0,
    SPELLUSE_Spice=1,
    SPELLUSE_Herb=2,
    SPELLUSE_Gemstone=3
} MigicCostEnum;

struct ItemInstance {
    ItemID id;
    u16 field1_0x2;
    char *name;
    enum AspectEnum aspect;
    u8 field4_0x9;
    u16 price;
    struct StatMod *statMod;
    struct SpellCharges *spellCharge;
};



struct PotionEffect {
    enum PotionEnum ID;
    u8 power;
    u16 align;
    uint timer;
    u32 SpellVisualIndex;
};

struct combat_aiscore {
    u8 spell_pri;
    u8 x;
    u8 y;
    u8 unk0x3;
    struct CombatEntity *combatEnt;
};

struct resist_float { /* resistance and element when loaded into temp item */
    enum ElementEnum element;
    float percent;
};

struct effects {
    struct Temp_enchant *list[15];
};





struct StatMod {
    s8 stat;
    s8 mod;
};



struct SpellCharges {
    struct SpellInstance *Spell;
    u8 Charges;
};

struct ArmorInstance {
    struct ItemInstance base;
    u8 unk14;
    u8 unk15;
    undefined field3_0x16;
    u8 rom0x1d;
    u8 (*skillmod)[2];
    struct Temp_enchant *enchantment;
    struct resist_float *resist;
    u8 DEF;
    u8 Protect;
    u8 dex;
    u8 stealth;
};

struct GearInstance {
    struct ItemInstance base;
    u8 damage;
    u8 Protection;
    u8 STR;
    u8 INT;
    u8 (*skillMod)[2];
    void *enchantment;
    struct resist_float *resist;
};

struct CombatAIInfo {
    struct WeaponInstance *weapon;
    char unk1;
    char entIndex;
    u8 morale; /* morale? */
    char unk7;
    u8 command;
    u8 flags;
    enum SpellEnum spells[8];
    u8 unk12;
    u8 unk13; /* length of array at gCombatP-> 0x5320 */
    struct CombatEntity *combatEnt;
    int unk18;
};




struct WeaponInstance {
    struct ItemInstance base;
    char unk14;
    char unk15;
    u8 unk16;
    u8 reqStr;
    StatMod *SkillMod;
    struct Temp_enchant *enchantment;
    struct resist_float *resist;
    enum WeaponClassEnum weaponType;
    u8 hit;
    u8 damage;
    u8 range;
    u8 animation;
    enum ElementEnum element;
    undefined field14_0x2a;
    undefined field15_0x2b;
};

struct Temp_enchant {
    enum SpellEnum index;
    u8 lv;
    enum MagicSchoolEnum school;
    u8 varA;
    u32 varB;
    uint timer;
    u32 unkc; /* unused */
    u32 unk10; /* unused */
    u32 SpellVisualIndex;
};

typedef struct combat_substruct combat_substruct, *Pcombat_substruct;

struct combat_substruct {
    u8 array1[100][100];
    u8 array2[100][100];
    ushort short1;
    u8 byteA;
    u8 byteB;
    u8 byteC;
    u8 byteD;
    char byteE;
    undefined field8_0x4e27;
};

typedef struct combat_substruct_2 combat_substruct_2, *Pcombat_substruct_2;

struct combat_substruct_2 {
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

typedef struct CombatAi_command CombatAi_command, *PCombatAi_command;

struct CombatAi_command {
    ulong (*cmd)(void);
    uint unk;
};

typedef struct CombatAttackVisuals_struct CombatAttackVisuals_struct, *PCombatAttackVisuals_struct;

struct CombatAttackVisuals_struct {
    struct AttackVisualStruct3 *p;
    u8 *bytearray;
    u8 iFreeVisual;

};

typedef struct CombatMarker CombatMarker, *PCombatMarker;

struct CombatMarker {
    struct AnimationData *borg;
    struct vec3f coords;
    float alpha;
    int time;
    u8 active;
};





typedef struct CombatRadarBlip CombatRadarBlip, *PCombatRadarBlip;

struct CombatRadarBlip {
    struct WidgetBorg8Combat *widget;
    short unk4;
    short unk6;
    short unk8;
    short unka;
    int unkc;
    u32 unk10;
    int unk14;
};

typedef struct CombatStatIndicatorHandler CombatStatIndicatorHandler, *PCombatStatIndicatorHandler;

struct CombatStatIndicatorHandler {
    struct Borg1Data *borg1Digits[10];
    struct PlaneObj *Indicators;
    u8 *array;
    u8 index;
    u8 pad[3];
};
/*
typedef struct combatStrings combatStrings, *PcombatStrings;

struct combatStrings {
    char *begins action;
    char *party fless;
    char *party wins;
    char *space;
    char *they heal;
    char *they gain 1 hp;
    char *they gain HP;
    char *they failed heal;
    char *they avoid;
    char *they attack;
    char *they hit;
    char *crit attack;
    char *they lose  hp;
    char *they lose1HP;
    char *they miss;
    char *potion already used;
    char *potion worked;
    char *potion failed;
    char *potion full stamina;
    char *they miss_;
    char *they died;
    char *potion Exploded;
    char *No Spell Available;
    char *not enough spell ingredients;
    char *not enough Stam for Spell;
    char *they failed spell;
    char *they resist spell;
    char *they cast spell;
    char *spell was cast;
    char *I'M POISONED!!!;
    char *they flee;
    char *they join battle;
    char *shadow's vortex;
    char *they rest;
    char *they swap weapons;
    char *x's details;
    char *field36_0x90;
    char *field37_0x94;
    char *field38_0x98;
    char *field39_0x9c;
    char *field40_0xa0;
    char *field41_0xa4;
    char *field42_0xa8;
    char *field43_0xac;
    char *field44_0xb0;
    char *field45_0xb4;
    char *field46_0xb8;
    char *field47_0xbc;
    char *already performing;
    char *too tired to perform;
    char *they failed troubador;
    char *they perform;
    char *they still perform;
    char *enemy wins by default;
    char *flee_d;
    char *s_u_c;
    char *(string);
    char *they fail;
    char *they're banished;
    char *enemy reinforcments flee;
    char *Shadow dissipates;
    char *good;
    char *bad;
    char *Cheated Death;
    char *field64_0x100;
};
*/

typedef struct EncounterDat EncounterDat, *PEncounterDat;

typedef struct GenericInventory GenericInventory, *PGenericInventory;

typedef struct inv_funcs inv_funcs, *Pinv_funcs;

typedef struct Inventory_item Inventory_item, *PInventory_item;




struct EncounterDat { /* enemy encounter data */
    ItemID enemy_entities[12]; /* entitty id's of enemies */
    ItemID globalLoot; /* chestdb of guarunteed loot */
    u16 EncounterID;
    u8 field3_0x1c;
    undefined field4_0x1d;
    ushort VoxelIndex;
    u16 mapDatA;
    u16 MapSAhortA;
    u16 MapShortB;
    u8 collisionByte;
    u8 battlefield;
    u8 unk28;
    u8 BossShadow; /* fighting a Boss or the Shadow */
    u16 VoxelFlagA;
    enum VoxelFllags VoxelBitfield;
};


typedef struct CombatTargetVisuals_struct CombatTargetVisuals_struct, *PCombatTargetVisuals_struct;

struct CombatTargetVisuals_struct {
    struct astruct_6 *pointer;
    uint entCount;
};

typedef struct WidgetChild4 WidgetChild4, *PWidgetChild4;


typedef struct WidgetStatTrain WidgetStatTrain, *PWidgetStatTrain;


struct WidgetChild4 {
    struct BaseWidget base;
    struct WidgetTrainShop *stattrainwidget[4];
    u32 field2_0x8c;
    u8 field3_0x90;
    u8 partyPicker;
    u8 field5_0x92;
    undefined field6_0x93;
    struct WidgetTrainShop *field7_0x94;
    struct WidgetTrainShop *field8_0x98;
    u32 field9_0x9c;
    struct WidgetStatTrain *stats;
    undefined field11_0xa4;
    undefined field12_0xa5;
    undefined field13_0xa6;
    undefined field14_0xa7;
    struct BaseWidget *field15_0xa8;
    struct BaseWidget *field16_0xac;
    struct unkGuiSubstruct field17_0xb0;
};

struct WidgetStatTrain {
    struct WidgetTrainShop base;
    struct BaseWidget *clipText90;
    struct BaseWidget *xepRemaining;
    struct BaseWidget *field3_0x98;
    struct BaseWidget *field4_0x9c;
    undefined field5_0xa0;
    undefined field6_0xa1;
    undefined field7_0xa2;
    undefined field8_0xa3;
};

typedef struct armour_RAM armour_RAM, *Parmour_RAM;

struct armour_RAM {
    ItemID ID;
    char name[23];
    u8 is0;
    u8 slot;
    u8 defence;
    u8 protection;
    u8 dex;
    u8 rom0x1d;
    u8 stealth;
    ushort price;
    u8 expBonus;
    enum AspectEnum aspect;
    enum StatEnum stat;
    char statNum;
    enum SkillEnum skill;
    char skillNum;
    enum SpellEnum spell;
    u8 spellLV;
    u8 SpellCharge; /* 10 for stardrake */
    enum SpellEnum magic;
    u8 magic LV;
    enum ElementEnum element;
    u16 align;
    float resist percent;
};

typedef struct DialougEnt_RAM DialougEnt_RAM, *PDialougEnt_RAM;

struct DialougEnt_RAM {
    ItemID ID;
    char name[22];
    u8 a; /* unused, set to 0 */
    u8 b;
};

typedef struct Entity_Ram Entity_Ram, *PEntity_Ram;

typedef enum EntityCatEnum { /* Entity Categories */
    Generic_NPC=0,
    Humanoid=1,
    Named_NPC=2,
    Party_Character=3,
    Chaos_Enemy=5,
    Natural_Enemy=6
} EntityCatEnum;

struct Entity_Ram { /* entity data in Ram */
    ItemID ID;
    char Name[21];
    enum EntityCatEnum Category;
    enum CharSheetFlags unk0x18; /* 2 bits determined by rom0x2d */
    u8 rom0x2b;
    enum AspectEnum aspect;
    u8 morale; /* something to do with dying? */
    u8 Level;
    u8 BaseDamage; /* rom0x4e */
    enum MagicSchoolEnum School;
    u8 BaseProtect; /* sheild related? */
    u8 unk0x20; /* made to float */
    u8 unk0x21;
    u8 Skills[12];
    u8 WeaponSkills[11];
    u8 stats[7];
    ItemID weapon[3];
    ItemID spells[5];
    u8 Spell_levels[5];
    u8 unk_0x55[5]; /* rom0x68 */
    u8 unk_0x5a[4]; /* rom0x6d */
    ItemID Armor;
    ItemID Sheild;
    s8 sheildStat;
    enum ElementEnum Resist[2];
    u8 align[3];
    float resistAmmount[2];
    ushort FFs[4]; /* supposed to load something, but ends up blank */
    u8 unk0x78[4];
    ushort EXP;
    u8 loot_Category;
    undefined field31_0x7f;
};

typedef struct Gear_RAM Gear_RAM, *PGear_RAM;

struct Gear_RAM {
    ItemID ID;
    char name[20];
    u8 is 0;
    u8 field3_0x17;
    ushort exp_multi;
    u8 damage;
    u8 Protection;
    u8 STR;
    u8 INT;
    ushort price;
    enum AspectEnum aspect;
    enum StatEnum stat;
    u8 StatMod;
    enum SkillEnum skill;
    u8 SkillMod;
    u8 spell;
    u8 spellVal1;
    u8 spellVal2;
    u8 magic;
    u8 magicAmmount;
    enum ElementEnum elementResist;
    undefined field21_0x2b;
    float ResistPercent;
};

typedef struct Loot_RAM Loot_RAM, *PLoot_RAM;

struct Loot_RAM { /* Chestdb loaded into RAM */
    char Name[20];
    char Is0;
    char field2_0x15;
    ItemID ID;
    ushort GoldLo;
    ushort GoldHi;
    u8 armorDrop;
    u8 sheildDrop;
    u8 weaponDrop[3];
    u8 reagentchance;
    u8 reagentLlo;
    u8 reagentHi;
    ItemID itemDrops[6];
    u8 itemDropChances[6];
    u8 itemLo[2];
    u8 itemHi[2];
};

typedef struct shop_ram shop_ram, *Pshop_ram;

struct shop_ram {
    ItemID shopkeep; /* entity running shop */
    ushort stock[23]; /* items */
    u8 multi[3][20];
};

typedef struct Spell_RAM Spell_RAM, *PSpell_RAM;

struct Spell_RAM {
    ItemID Id;
    char Name[24];
    enum MagicSchoolEnum School;
    u8 Damage;
    u8 stamina;
    enum MagicCastedEnum CastedMagic;
    enum MagicTargetEnum Target;
    u8 unk0x1f;
    u8 WizardREQ;
    enum AspectEnum Aspect;
    u8 Range;
    enum MigicCostEnum ingredient;
    u8 EXP_Modifyer;
    undefined field13_0x25;
};

typedef struct weapon_ram weapon_ram, *Pweapon_ram;

struct weapon_ram { /* Weapon Data loaded into ram */
    ItemID ID;
    char name[22];
    enum WeaponClassEnum Class; /* Type of weapon (sword, breath, spit, etc.) */
    u8 ReqSTR;
    u8 Hit;
    u8 damage;
    ushort price; /* proper endian */
    u8 SpellLV;
    u8 Range; /* *(5/3) */
    u8 Animation; /* which use animation */
    u8 EXPMod; /* Lodin sword has set to 0x20 */
    enum ElementEnum element;
    enum AspectEnum aspect;
    enum StatEnum stat; /* Stat enhanced */
    u8 statMod;
    enum SkillEnum Skill; /* skill enhanced (or stat) */
    u8 SkillMod;
    enum SpellEnum spell;
    u8 spellAmmount;
    u8 ram0x2a;
    enum SpellEnum spell2;
    u8 Spell2Ammount;
    enum ElementEnum elementResist;
    u16 align;
    float ResistPercent;
};

typedef struct Armour_ROM Armour_ROM, *PArmour_ROM;

typedef ItemID_ROM ItemID_ROM, *PItemID_ROM;


ItemID_ROM {
    u8 ID;
    enum DBTypeEnum Type;
};

struct Armour_ROM { /* Armour data in Rom */
    char name[23];
    ItemID_ROM id;
    u8 slot;
    u8 Defence;
    u8 protection;
    u8 dex;
    u8 unk0x1d;
    u8 stealth;
    u8 price[2]; /* endian swapped */
    u8 expBonus;
    enum AspectEnum aspect;
    enum StatEnum stat;
    char statNum;
    enum SkillEnum skill;
    char skillNum;
    ItemID_ROM spell;
    u8 SpellLV;
    u8 unk0x2a;
    ItemID_ROM magic;
    u8 magicLV;
    enum ElementEnum Element;
    u8 ElementResist;
};

typedef struct ArrayHeader ArrayHeader, *PArrayHeader;

struct ArrayHeader { /* ROM Db array Header */
    u8 Size; /* number of items in array */
    u8 unk[3]; //junk bytes
};

typedef struct DialougeEntity_ROM DialougeEntity_ROM, *PDialougeEntity_ROM;

struct DialougeEntity_ROM { /* Dialouge entity in ROM */
    char name[22];
    ItemID_ROM ID;
};


typedef struct Gear_Rom Gear_Rom, *PGear_Rom;

struct Gear_Rom { /* Gear/item data stored in rom */
    char name[20];
    ItemID_ROM ID;
    u8 ExpMulti[2];
    u8 damage;
    u8 Protection;
    u8 required_STR;
    u8 Required_INT;
    u8 price[2]; /* Endian reversed */
    enum AspectEnum Aspect;
    enum StatEnum stat;
    s8 statMod;
    enum SkillEnum Skill; /* Can also modify Stat */
    s8 SkillMod;
    ItemID_ROM Spell;
    u8 spellvalue;
    u8 SpellValue2;
    ItemID_ROM Magic;
    u8 MagicAmmount;
    enum ElementEnum ElementResist;
    u8 ResistPercent; /* 100-(25*x) */
};

typedef struct loot_ROM loot_ROM, *Ploot_ROM;

struct loot_ROM { /* Loot Pools stored in ROM */
    char Name[20];
    ItemID_ROM ID;
    u8 goldLo[2]; /* Endians swapped */
    u8 goldHi[2]; /* Endians swapped */
    u8 armorDrop[2]; /* % armor/Sheild drop */
    u8 WeaponDrop[3]; /* % weapon drop */
    u8 reagentPercent;
    u8 reagentRange[2];
    ItemID_ROM item0;
    u8 item0chance;
    u8 item0quantity[2]; /* lo/hi range */
    ItemID_ROM item1;
    u8 item1chance;
    u8 item1quantity[2];
    ItemID_ROM item3;
    u8 item3chance;
    ItemID_ROM item4;
    u8 item4chance;
    ItemID_ROM item5;
    u8 item5chance;
    ItemID_ROM item6;
    u8 item6chance;
};

typedef struct shop_ROM shop_ROM, *Pshop_ROM;

typedef struct ShopItem ShopItem, *PShopItem;

typedef struct price_mod price_mod, *Pprice_mod;

typedef enum Price_multi {
    PRICE_HALF,
    PRICE_25OFF,
    PRICE_FULL,
    PRICE_25UP,
    PRICE_HALFUP,
    PRICE_DOUBLE,
    PRICE_TRIPLE,
    PRICE_5X
} Price_multi;

struct price_mod {
    u8 unk;
    enum Price_multi multi;
    u8 unk_;
};

struct ShopItem { /* Shop Item listing with 3 mystery bytes */
    ItemID_ROM item;
    struct price_mod mod;
};

struct shop_ROM { /* Shop Data in Rom */
    ItemID_ROM EntityID; /* Which entity runs the shop */
    struct ShopItem longItem[20]; /* each entry has 3 mystery bytes */
    ItemID_ROM shortItem[3]; /* these do not. */
};

typedef struct Spell_ROM Spell_ROM, *PSpell_ROM;

struct Spell_ROM { /* Spell Data in ROM */
    char Name[23];
    ItemID_ROM ID;
    enum MagicSchoolEnum School;
    u8 Damage;
    u8 StaminaCost;
    enum MagicCastedEnum TargetAmmount;
    enum MagicTargetEnum Target;
    u8 unk0x1e; /* ram 0x1f */
    u8 WizardRequired;
    enum AspectEnum Aspect;
    u8 Range;
    enum MigicCostEnum Ingredient;
    u8 EXP_Modifyer;
};

typedef struct Weapon_ROM Weapon_ROM, *PWeapon_ROM;

struct Weapon_ROM {
    char Name[21];
    ItemID_ROM ID;
    enum WeaponClassEnum WeaponType;
    u8 Required_Strength;
    u8 Hit;
    u8 damage;
    u8 Price[2]; /* endian swapped */
    u8 SpellLV;
    u8 Range;
    u8 Animation;
    u8 EXPMod;
    enum ElementEnum Element;
    enum AspectEnum aspect;
    enum StatEnum StatEnhanced;
    u8 StatAmmount;
    enum SkillEnum enhanced;
    u8 ammount;
    ItemID_ROM Spell;
    u8 spellAmmount;
    u8 unk0x2a;
    ItemID_ROM Magic;
    u8 MagicAmmount;
    enum ElementEnum ResistElement;
    u8 ResistPercent;
};

typedef union EquipInstance EquipInstance, *PEquipInstance;

typedef struct PotionInstance PotionInstance, *PPotionInstance;

struct PotionInstance {
    struct ItemInstance base;
};

union EquipInstance {
    struct WeaponInstance W;
    struct GearInstance G;
    struct PotionInstance P;
    struct ArmorInstance A;
    struct SpellInstance S;
};

typedef struct dialougeEntity_Info dialougeEntity_Info, *PdialougeEntity_Info;



typedef struct entity_info entity_info, *Pentity_info;

struct entity_info { /* extended data of entities in RAM */
    u16 Index; /* Index in RAM */
    u32 Model; /* model Character uses */
    u32 Portait; /* Portait Character uses */
    float a;
    float b;
    float c;
    float scale;
};

typedef struct __OSBlockInfo __OSBlockInfo, *P__OSBlockInfo;

struct __OSBlockInfo {
    u32 errStatus;
    void *dramAddr;
    void *C2Addr;
    u32 sectorSize;
    u32 C1ErrNum;
    u32 C1ErrSector[4];
};

typedef struct __OSContReadFormat __OSContReadFormat, *P__OSContReadFormat;

struct __OSContReadFormat {
    u8 dummy;
    u8 txsize;
    u8 rxsize;
    u8 cmd;
    u16 button;
    s8 stick_x;
    s8 stick_y;
};

typedef struct __OSInode __OSInode, *P__OSInode;

typedef union __OSInodeUnit __OSInodeUnit, *P__OSInodeUnit;

union __OSInodeUnit {
    u8 inode_t[2];
    u16 ipage;
};

struct __OSInode {
    union __OSInodeUnit inode_page[128];
};

typedef struct __OSPackId __OSPackId, *P__OSPackId;

struct __OSPackId {
    u32 repaired;
    u32 random;
    u64 serial_mid;
    u64 serial_low;
    u16 deviceid;
    u8 banks;
    u8 version;
    u16 checksum;
    u16 inverted_checksum;
};

typedef struct __OSTranxInfo __OSTranxInfo, *P__OSTranxInfo;

struct __OSTranxInfo {
    u32 cmdType;
    u16 transferMode;
    u16 blockNum;
    int SectorNum;
    u32 devAddr;
    u32 bmCtlShadow;
    u32 seqCtlShadow;
    struct __OSBlockInfo block[2];
};

typedef struct __OSViContext __OSViContext, *P__OSViContext;

typedef struct OSViMode OSViMode, *POSViMode;

typedef struct __OSViScale __OSViScale, *P__OSViScale;

typedef struct OSViCommonRegs OSViCommonRegs, *POSViCommonRegs;

typedef struct OSViFieldRegs OSViFieldRegs, *POSViFieldRegs;

typedef float f32;

typedef enum VI_CTRL {
    TYPE_16=2,
    TYPE_32=3,
    GAMMA_DITHER_ON=4,
    GAMMA_ON=8,
    DIVOT_ON=16,
    SERRATE_ON=64,
    ANTIALIAS_MASK=768,
    DITHER_FILTER_ON=4096
} VI_CTRL;

struct __OSViScale {
    f32 factor;
    u16 offset;
    undefined field2_0x6;
    undefined field3_0x7;
    u32 scale;
};

struct __OSViContext {
    u16 scale;
    u16 retraceCount;
    void *framep;
    struct OSViMode *modep;
    u32 control;
    struct OSMesgQueue *msgq;
    OSMesg msg;
    struct __OSViScale x;
    struct __OSViScale y;
};

struct OSViCommonRegs {
    enum VI_CTRL ctrl;
    u32 width;
    u32 burst;
    u32 vSync;
    u32 hSync;
    u32 leap;
    u32 hStart;
    u32 xScale;
    u32 vCurrent;
};

struct OSViFieldRegs {
    u32 origin;
    u32 yScale;
    u32 vScale;
    u32 vBurst;
    u32 vIntr;
};

struct OSViMode {
    u8 type;
    undefined field1_0x1;
    undefined field2_0x2;
    undefined field3_0x3;
    struct OSViCommonRegs comRegs;
    struct OSViFieldRegs fldRegs[2];
};

typedef struct _Pft _Pft, *P_Pft;

//typedef ulong size_t;

struct _Pft {
    longlong v;
    char *s;
    int n0;
    int nz0;
    int n1;
    int nz1;
    int n2;
    int nz2;
    int prec;
    int width;
    size_t nchar;
    uint flags;
    char qual;
};

typedef struct Aadpcm Aadpcm, *PAadpcm;

struct Aadpcm {
    int cmd:8;
    int flags:8;
    int gain:16;
    int addr;
};

typedef union Acmd Acmd, *PAcmd;

union Acmd {
    struct Aadpcm adpcm;
    longlong force_union_align;
};

typedef short ADPCM_STATE[16];

typedef struct ALADPCMBook ALADPCMBook, *PALADPCMBook;

struct ALADPCMBook {
    s32 order;
    s32 npredictors;
    s16 book[1];
};

typedef struct ALADPCMFilter ALADPCMFilter, *PALADPCMFilter;

typedef struct ALfilter ALfilter, *PALfilter;

typedef struct ALADPCMloop ALADPCMloop, *PALADPCMloop;

typedef struct ALWaveTable ALWaveTable, *PALWaveTable;

typedef union waveInfo waveInfo, *PwaveInfo;

typedef struct ALADPCMWaveInfo ALADPCMWaveInfo, *PALADPCMWaveInfo;

typedef struct ALRAWWaveInfo ALRAWWaveInfo, *PALRAWWaveInfo;

typedef struct ALRawLoop ALRawLoop, *PALRawLoop;

struct ALfilter {
    struct ALfilter *source;
    ulong (*handler)(void);
    ulong (*setParam)(void);
    short inp;
    short outp;
    int type;
};

struct ALADPCMloop {
    u32 start;
    u32 end;
    u32 count;
    ADPCM_STATE state;
};

struct ALADPCMFilter {
    struct ALfilter filter;
    ADPCM_STATE state[2];
    struct ALADPCMloop loop;
    struct ALWaveTable *table;
    s32 booksize;
    ulong (*dma)(void);
    s32 current;
    s32 sample;
    s32 lastsam;
    s32 first;
    s32 memim;
    s32 dramstart;
};

struct ALRAWWaveInfo {
    struct ALRawLoop *loop;
};

struct ALADPCMWaveInfo {
    struct ALADPCMloop *loop;
    struct ALADPCMBook *book;
};

union waveInfo {
    struct ALADPCMWaveInfo adpcmwave;
    struct ALRAWWaveInfo rawWave;
};

struct ALWaveTable {
    u8 *base;
    s32 ln;
    u8 type;
    u8 flags;
    union waveInfo waveInfo;
};

struct ALRawLoop {
    u32 start;
    u32 end;
    u32 count;
};


typedef struct ALAuxBus ALAuxBus, *PALAuxBus;

typedef struct ALfx ALfx, *PALfx;

struct ALfx {
    struct ALfilter filter;
    s16 *base;
    s16 *input;
    u32 Length;
    void *delay;
    u8 section_count;
    ulong (*paramHdl)(void);
};

struct ALAuxBus {
    struct ALfilter filter;
    s32 SourceCount;
    s32 maxSources;
    struct ALfilter **sources;
    struct ALfx fx;
};

typedef struct ALEnvelope ALEnvelope, *PALEnvelope;

typedef s32 ALMicroTime;

struct ALEnvelope {
    ALMicroTime attackTime;
    ALMicroTime DecayTime;
    ALMicroTime releaseTime;
    u8 attackVolume;
    u8 decayVolume;
};

typedef struct ALEnvMixer ALEnvMixer, *PALEnvMixer;

typedef short ENVMIX_STATE[40];

typedef struct ALParam ALParam, *PALParam;

struct ALParam {
    s32 delta;
    s16 type;
    undefined field2_0x6;
    undefined field3_0x7;
    u32 data[4];
};

struct ALEnvMixer {
    struct ALfilter filter;
    ENVMIX_STATE *state;
    s16 pan;
    s16 volume;
    s16 cvoll;
    s16 cvolr;
    s16 dryamt;
    s16 wetamt;
    u16 lratl;
    s16 lratm;
    s16 ltgt;
    u16 rratl;
    s16 rratm;
    s16 rtgt;
    s32 delta;
    s32 segend;
    s32 first;
    struct ALParam *ctrlfirst;
    struct ALParam *ctrltail;
    struct ALfilter **sources;
    s32 motion;
};

typedef enum ALFxId {
    AL_FX_NONE=0,
    AL_FX_SMALLROOM=1,
    AL_FX_BIGROOM=2,
    AL_FX_CHORUS=3,
    AL_FX_FLANGE=4,
    AL_FX_ECHO=5,
    AL_FX_CUSTOM=6
} ALFxId;

typedef struct ALGlobals ALGlobals, *PALGlobals;

typedef struct ALSynth ALSynth, *PALSynth;

typedef struct ALPlayer ALPlayer, *PALPlayer;

typedef struct ALLink ALLink, *PALLink;

typedef struct ALHeap ALHeap, *PALHeap;

struct ALHeap {
    u8 *base;
    u8 *curr;
    s32 len;
    s32 count;
};

struct ALLink {
    struct ALLink *next;
    struct ALLink *prev;
};

struct ALSynth {
    struct ALPlayer *head;
    struct ALLink pFreeList;
    struct ALLink pAllocList;
    struct ALLink pLameList;
    s32 paramSamples;
    s32 curSamples;
    void *Dma;
    struct ALHeap *heap;
    void* paramlist;
    void* mainBus;
    void* auxBus;
    void* outputfilter;
    s32 numPVoices;
    s32 maxAuxVoixes;
    s32 outputRate;
    s32 maxOutSamples;
};

struct ALGlobals {
    struct ALSynth drvr;
};

struct ALPlayer {
    struct ALPlayer *next;
    void *clientData;
    void *handler; /* voice handler for player */
    ALMicroTime calltime;
    s32 samplesLeft;
};

typedef struct ALKeyMap ALKeyMap, *PALKeyMap;

struct ALKeyMap {
    u8 velocityMin;
    u8 velocityMax;
    u8 keyMin;
    u8 keyMax;
    u8 keyBase;
    s8 detune;
};

typedef u8 ALPan;


typedef struct ALResampler ALResampler, *PALResampler;

typedef short RESAMPLE_STATE[16];

struct ALResampler {
    struct ALfilter fliter;
    RESAMPLE_STATE *state;
    float ratio;
    s32 upitch;
    float delta;
    s32 first;
    struct ALParam *ctrllist;
    struct ALParam *ctrltail;
    s32 motion;
};

typedef struct ALSound ALSound, *PALSound;

struct ALSound {
    struct ALEnvelope *envelope;
    struct ALKeyMap *keyMap;
    struct ALWaveTable *waveTable;
    ALPan samplePan;
    u8 sampleVolume;
    u8 flags;
};

typedef struct ALSynConfig ALSynConfig, *PALSynConfig;

struct ALSynConfig {
    s32 maxVVoices;
    s32 maxPVoices;
    s32 maxUpdates;
    s32 maxFXbusses;
    void *dmaproc;
    struct ALHeap *heap;
    s32 outputrate;
    enum ALFxId fxType;
    s32 *params;
};

typedef struct ALVoice ALVoice, *PALVoice;

typedef struct PVoice PVoice, *PPVoice;

struct PVoice {
    struct ALLink node;
    struct ALVoice *vvoice;
    void *rspcode;
    struct ALfilter *sourceKnob;
    struct ALfilter *channelKnob;
    struct ALADPCMFilter decoder;
    struct ALResampler resampler;
    struct ALEnvMixer envmixer;
};

struct ALVoice {
    struct ALLink node;
    struct PVoice *pvoice;
    struct ALWaveTable *table;
    void *clientPrivate;
    s16 state;
    s16 priority;
    s16 fxBus;
    s16 UnityPitch;
};

typedef struct ALVoiceConfig ALVoiceConfig, *PALVoiceConfig;

struct ALVoiceConfig {
    s16 priority;
    s16 fxBus;
    u8 unityPitch;
};

typedef struct ALVoiceState ALVoiceState, *PALVoiceState;

struct ALVoiceState {
    struct ALVoice voice;
    struct ALSound *sound;
    ALMicroTime envEndTime;
    float pitch;
    float vibrato;
    u8 envgain;
    u8 channel;
    u8 key;
    u8 velocity;
    u8 envPhase;
    u8 phase;
    u8 tremelo;
    u8 flags;
};

typedef enum CONT_ERROR {
    CONT_COLLISION_ERROR=1,
    CONT_FRAME_ERROR=2,
    CONT_OVERRUN_ERROR=4,
    CONT_NO_RESPONSE_ERROR=8
} CONT_ERROR;

typedef enum CONT_TYPE {
    CONT_ABSOLUTE=1,
    CONT_RELATIVE=2,
    CONT_JOYPORT=4,
    CONT_TYPE_NORMAL=5,
    CONT_TYPE_MASK=7943,
    CONT_EEP16K=16384,
    CONT_EEPROM=32768
} CONT_TYPE;

typedef struct KKHeader KKHeader, *PKKHeader;

struct KKHeader {
    int length;
    char code;
    char type;
    short error;
    char rev;
    char method;
    short unused;
};

typedef struct N64_BootStrap N64_BootStrap, *PN64_BootStrap;

typedef enum OsTv {
    OS_TV_PAL,
    OS_TV_NTSC,
    OS_TV_MPAL
} OsTv;



typedef enum OS_EVENT {
    OS_EVENT_SW1,
    OS_EVENT_SW2,
    OS_EVENT_CART,
    OS_EVENT_COUNTER,
    OS_EVENT_SP,
    OS_EVENT_SI,
    OS_EVENT_AI,
    OS_EVENT_VI,
    OS_EVENT_PI,
    OS_EVENT_DP,
    OS_EVENT_CPU_BREAK,
    OS_EVENT_SP_BREAK,
    OS_EVENT_FAULT,
    OS_EVENT_THREADSTATUS,
    OS_EVENT_PRENMI,
    RDB_READ_DONE,
    RDB_LOG_DONE,
    RDB_DATA_DONE,
    RDB_REQ_RANDOM,
    RDB_FREE_RANDOM,
    RDB_DBG_DONE,
    RDB_FLUSH_PROF,
    RDB_ACK_PROF
} OS_EVENT;

typedef enum OS_VI_Clock {
    VI_PAL_CLOCK=48628316,
    VI_NTSC_CLOCK=48681812,
    VI_MPAL_CLOCK=49656530
} OS_VI_Clock;

typedef enum OS_VI_SPECIAL {
    OS_VI_GAMMA_ON=1,
    OS_VI_GAMMA_OFF=2,
    OS_VI_DITHER_OFF=4,
    OS_VI_DITHER_ON=8,
    OS_VI_DIVOT_ON=16,
    OS_VI_DIVOT_OFF=32,
    OS_VI_DITHER_FILTER_ON=64,
    OS_VI_DITHER_FILTER_OFF=128
} OS_VI_SPECIAL;

typedef struct OSContPad OSContPad, *POSContPad;

struct OSContPad { /* Inputs For n64 Controller */
    u16 button;
    s8 stick_x;
    s8 stick_y;
    enum CONT_ERROR errno;
    u8 pad;
};

typedef struct OSContStatus OSContStatus, *POSContStatus;

struct OSContStatus {
    enum CONT_TYPE type;
    enum CONT_STATUS status;
    enum CONT_ERROR errno;
};

typedef struct OSDevMgr OSDevMgr, *POSDevMgr;

struct OSDevMgr {
    s32 active;
    struct OSThread *thread;
    struct OSMesgQueue *cmdQueue;
    struct OSMesgQueue *evtQueue;
    struct OSMesgQueue *acsQueue;
    s32 *dma;
    s32 *edma;
};

typedef struct OSIoMesg OSIoMesg, *POSIoMesg;

typedef struct OSIoMesgHdr OSIoMesgHdr, *POSIoMesgHdr;

struct OSIoMesgHdr {
    u16 type;
    u8 pri;
    u8 status;
    struct OSMesgQueue *retQueue;
};

struct OSIoMesg {
    struct OSIoMesgHdr hdr;
    void *dramAddr;
    u32 devAddr;
    u32 size;
    void *pihandle;
};

typedef struct OSPfs OSPfs, *POSPfs;

struct OSPfs {
    int status;
    struct OSMesgQueue *queue;
    int channel;
    u8 id[32];
    u8 label[32];
    int version;
    int dir_size;
    int inode_table;
    int minode_table;
    int dir_table;
    int inode_start_page;
    u8 banks;
    u8 activebank;
};

typedef struct OSPfsState OSPfsState, *POSPfsState;

struct OSPfsState {
    u32 file_size;
    u32 game_code;
    u16 company_code;
    char ext_name[4];
    char game_name[16];
};

typedef struct OSPifRam OSPifRam, *POSPifRam;

struct OSPifRam {
    u32 ramarray[15];
    u32 pifstatus;
};

typedef struct OSPIHandle OSPIHandle, *POSPIHandle;

struct OSPIHandle {
    struct OSPIHandle *next;
    u8 type;
    u8 latency;
    u8 pageSize;
    u8 relDuration;
    u8 pulse;
    u8 domain;
    u32 baseAddress;
    u32 speed;
    struct __OSTranxInfo transferInfo;
};

typedef s32 OSPri;

typedef struct OSScClient OSScClient, *POSScClient;

struct OSScClient {
    struct OSScClient *next;
    struct OSMesgQueue *msgQ;
};

typedef struct OSSched OSSched, *POSSched;

typedef struct OSScMsg OSScMsg, *POSScMsg;

typedef struct OSScTask OSScTask, *POSScTask;

typedef enum OS_SC_FLAG {
    OS_SC_NEEDS_RDP=1,
    OS_SC_NEEDS_RSP=2,
    OS_SC_RCP_MASK=3,
    OS_SC_DRAM_DLIST=4,
    OS_SC_TYPE_MASK=7,
    OS_SC_PARALLEL_TASK=16,
    YEILD=16,
    OS_SC_LAST_TASK=32,
    YEILDED=32,
    OS_SC_SWAPBUFFER=64
} OS_SC_FLAG;

typedef struct OSTask_t OSTask_t, *POSTask_t;

typedef u64 OSTime;

typedef enum TASKTYPE {
    M_GFXTASK=1,
    M_AUDTASK=2,
    M_VIDTASK=3,
    M_HVQTASK=6,
    M_HVQMTASK=7
} TASKTYPE;

struct OSTask_t {
    enum TASKTYPE Type;
    u32 flags;
    u64 *ucode_boot;
    u32 ucode_boot_size;
    u64 *ucode;
    u32 ucode_size;
    u64 *ucode_data;
    u32 ucode_data_size;
    u64 *dram_stack;
    u32 dram_stack_size;
    u64 *output_buff;
    u64 *output_buff_size;
    u64 *data_ptr;
    u32 data_size;
    u64 *yeild_data_ptr;
    u32 yeild_data_size;
};

struct OSScTask {
    struct OSScTask *next;
    u32 state;
    u32 flags;
    void *framebuffer;
    struct OSTask list;
    struct OSMesgQueue *msgQ;
    OSMesg msg;
    OSTime startTime;
    OSTime totalTime;
};

struct OSScMsg {
    short type;
    char misc[30];
};

struct OSSched {
    struct OSScMsg retraceMsg;
    struct OSScMsg prenmiMsg;
    struct OSMesgQueue interruptQ;
    OSMesg intBuff[8];
    struct OSMesgQueue cmdQ;
    OSMesg cmdmsgBuff[8];
    struct OSThread thread;
    struct OSScClient *clientlist;
    struct OSScTask *audioListHead;
    struct OSScTask *gfxListHead;
    struct OSScTask *audioListTail;
    struct OSScTask *gfxListTail;
    struct OSScTask *curRSPTask;
    struct OSScTask *curRDPTask;
    u32 frameCount;
    s32 doAudio;
};

typedef union OSTask OSTask, *POSTask;

union OSTask {
    struct OSTask_t t;
    longlong field1[8];
};

typedef struct OSTimer OSTimer, *POSTimer;

struct OSTimer {
    struct OSTimer *next;
    struct OSTimer *prev;
    OSTime interval;
    OSTime value;
    struct OSMesgQueue *mq;
    OSMesg msg;
};

typedef enum PFS_ERR {
    PFS_OK=0,
    PFS_ERR_NOPACK=1,
    PFS_ERR_NEW_PACK=2,
    PFS_ERR_INCONSISTENT=3,
    PFS_ERR_CONTRFAIL=4,
    PFS_ERR_INVALID=5,
    PFS_ERR_BAD_DATA=6,
    PFS_DATA_FULL=7,
    PFS_DIR_FULL=8,
    PFS_ERR_EXIST=9,
    PFS_ERR_ID_FATAL=10,
    PFS_ERR_DEVICE=11,
    PFS_ERR_NO_GBCART=12,
    PFS_ERR_NEW_GBCART=13
} PFS_ERR;

typedef enum PI_STATUS_ {
    DMA_BUSY=1,
    IO_BUSY=2,
    ERROR=4
} PI_STATUS_;

typedef struct printf_struct printf_struct, *Pprintf_struct;

struct printf_struct {
    undefined8 value;
    char *buff;
    int n0;
    int num_leading_zeros;
    int part2_len;
    int num_mid_zeros;
    int part3_len;
    int num_trailing_zeros;
    int precision;
    int width;
    uint size;
    uint flags;
    char length;
};


typedef void *__gnuc_va_list;

typedef __gnuc_va_list va_list;

typedef struct lldiv_t lldiv_t, *Plldiv_t;

struct lldiv_t {
    longlong quot;
    longlong rem;
};

typedef struct Audio_obj Audio_obj, *PAudio_obj;

typedef struct audio_obj_dat audio_obj_dat, *Paudio_obj_dat;

struct audio_obj_dat {
    enum Borg12Enum borg12Index;
    u32 field1_0x4;
    float volume;
    float randA;
    float randB;
    ushort soundFlag; /* bitfield {2=randLoop,0x10=bgm} */
    ushort unk16; /* align */
    float volumeFade;
    u32 pan;
    u32 dcmId;
    u16 unk24;
    u8 dcmIndex;
    undefined field12_0x27;
    undefined8 field13_0x28;
    undefined8 field14_0x30;
    undefined8 field15_0x38;
    u32 field16_0x40;
};

struct Audio_obj {
    struct voxelHeader header;
    struct audio_obj_dat audio;
};

typedef struct camera_obj camera_obj, *Pcamera_obj;

typedef struct Camera_obj_dat Camera_obj_dat, *PCamera_obj_dat;

struct Camera_obj_dat {
    short refpoint_ID;
    ushort CameraFlags;
    uint timestamp;
    struct vec3f vec3_A;
    struct vec3f vec3_b;
    struct vec3f vec3_C;
    float unk0x54;
    u8 unk0x58[20];
};


typedef struct BaseWidgetPause BaseWidgetPause, *PBaseWidgetPause;

typedef struct pause_Substruct pause_Substruct, *Ppause_Substruct;

typedef struct WidgetCalendar WidgetCalendar, *PWidgetCalendar;

typedef struct WidgetHealthGold WidgetHealthGold, *PWidgetHealthGold;

typedef struct DollEquipmentMenu DollEquipmentMenu, *PDollEquipmentMenu;

typedef struct WidgetBarter WidgetBarter, *PWidgetBarter;

typedef struct WidgetMenuWorldMap WidgetMenuWorldMap, *PWidgetMenuWorldMap;

typedef struct struct_4 struct_4, *Pstruct_4;

struct WidgetBarter {
    struct BaseWidget base; /* 0x5e=Merchant */
    u8 partyPicker;
    undefined field2_0x7d;
    undefined field3_0x7e;
    undefined field4_0x7f;
    struct WidgetTrainShop *field5_0x80;
    struct WidgetTrainShop *field6_0x84;
    struct WidgetTrainShop *description;
    u8 invType;
    undefined field9_0x8d;
    undefined field10_0x8e;
    undefined field11_0x8f;
    struct BaseWidget *background;
    struct BaseWidget *goldText;
    undefined field14_0x98;
    undefined field15_0x99;
    undefined field16_0x9a;
    undefined field17_0x9b;
};

struct DollEquipmentMenu {
    struct BaseWidget base;
    struct unkGuiSubstruct unkStruct;
    undefined field2_0x8c;
    undefined field3_0x8d;
    undefined field4_0x8e;
    undefined field5_0x8f;
    struct BaseWidget *icons[15];
    ItemID icon_item_ids[15];
    undefined field8_0xea;
    undefined field9_0xeb;
};

struct pause_Substruct {
    struct WidgetOptionsMenu *optionsMenu;
    struct WidgetDollMenu *dollmenu;
    struct WidgetCalendar *calendar;
    struct BaseWidget *pauseMenuSections[3];
    struct BaseWidget *backgroundWidget;
    struct BaseWidget *field5_0x1c;
    char PauseMenuSection;
    undefined field7_0x21;
    s16 unk22;
    s16 unk24;
    s16 unk26;
    struct AnimationData *aniDat;
    float scrollSpeed;
    struct Borg7header *borg7;
    struct vec3f camPos;
    float scrollfloat;
    undefined field16_0x44;
    undefined field17_0x45;
    undefined field18_0x46;
    undefined field19_0x47;
    undefined field20_0x48;
    undefined field21_0x49;
    undefined field22_0x4a;
    undefined field23_0x4b;
    u32 takeInput;
};

struct WidgetHealthGold {
    struct BaseWidget base;
    struct BaseWidget *Level_widget;
    struct BaseWidget *gold_widget;
    struct BaseWidget *CurrHP_Widget;
    struct BaseWidget *MaxHP_widget;
    struct BaseWidget *borg8_widget;
    struct unkGuiSubstruct field6_0x90;
    short HpPercent;
    undefined field8_0xa2;
    undefined field9_0xa3;
};

struct WidgetCalendar {
    struct BaseWidget base;
    struct WidgetMenuWorldMap *map;
    Color32 col0;
    Color32 col1;
    u8 waveTint;
    u8 waveAmmount; /* inverts if waveTint is 0 or 20 */
    u8 dayofMonth;
    u8 weekofMonth;
    u8 monthVal;
    struct BaseWidget *DayMarker;
    struct BaseWidget *monthTitle;
};

typedef struct ControllerPakSliders ControllerPakSliders, *PControllerPakSliders;

struct ControllerPakSliders {
    struct BaseWidget base;
    u32 field1_0x7c;
    u32 field2_0x80;
    struct SaveDatPointers *saveDat;
    struct BaseWidget *screenshotWidget;
    struct Borg8header *screenshotBorg8;
    struct BaseWidget *PlayerName;
    struct BaseWidget *TimePlayed;
    u32 isEntrySet;
    struct BaseWidget *PartyPortraits[4];
    u16 unkBounds[4];
    Color32 unkCol;
    struct BaseWidget *arrows;
};

typedef struct IntroMenu IntroMenu, *PIntroMenu;

struct IntroMenu {
    struct BaseWidget base;
    u8 alphaDelta;
    u8 blinkTimer;
    u8 alpha0;
    u8 alpha1;
    struct BaseWidget *field5_0x80;
    struct BaseWidget *field6_0x84;
    u8 pressStartVisible;
};



typedef struct Widget_Skills Widget_Skills, *PWidget_Skills;

struct Widget_Skills {
    struct BaseWidget base;
    struct CharSkills *skills;
    struct BaseWidget *skillIcon;
    struct BaseWidget *skillVal;
    struct BaseWidget *skillmod;
    struct BaseWidget *skilltext;
    u16 field6_0x90;
    u16 field7_0x92;
};

typedef struct widget_text widget_text, *Pwidget_text;

struct widget_text {
    char *txt;
    u32 unk;
    float f1;
    float f2;
};

typedef struct WidgetChild3 WidgetChild3, *PWidgetChild3;

struct WidgetChild3 {
    struct BaseWidget base;
    struct BaseWidget *title_widget;
    struct BaseWidget *field2_0x80;
    undefined field3_0x84;
    undefined field4_0x85;
    undefined field5_0x86;
    undefined field6_0x87;
    u8 partyPicker;
    undefined field8_0x89;
    undefined field9_0x8a;
    undefined field10_0x8b;
    u32 field11_0x8c;
    undefined field12_0x90;
    undefined field13_0x91;
    undefined field14_0x92;
    undefined field15_0x93;
    undefined field16_0x94;
    undefined field17_0x95;
    undefined field18_0x96;
    undefined field19_0x97;
    undefined field20_0x98;
    undefined field21_0x99;
    undefined field22_0x9a;
    undefined field23_0x9b;
};


typedef struct WidgetGameStateCheats WidgetGameStateCheats, *PWidgetGameStateCheats;

struct WidgetGameStateCheats {
    struct BaseWidget base;
    struct BaseWidget *scrollA;
    struct BaseWidget *scrollB;
    struct BaseWidget *scrollC;
};

typedef struct widgetGroup widgetGroup, *PwidgetGroup;

typedef struct WidgetGroupItem WidgetGroupItem, *PWidgetGroupItem;

struct WidgetGroupItem {
    struct BaseWidget *w;
    u16 x;
    u16 y;
    u32 unk8;
};

struct widgetGroup {
    struct BaseWidget base;
    struct WidgetGroupItem *group;
    u16 groupMax;
    u16 groupCount;
    u32 field4_0x84;
};

typedef struct WidgetMethodsContPakData WidgetMethodsContPakData, *PWidgetMethodsContPakData;

struct WidgetMethodsContPakData { /* extra methods of WidgetContPakData class */
    struct WidgetMethods base;
    struct Method NewSaveFile;
    struct Method LoadSaveFile;
    struct Method field3_0xe0;
    struct Method field4_0xe8;
    struct Method field5_0xf0;
    struct Method WriteSaveFile;
    struct Method field7_0x100;
    struct Method field8_0x108;
};


typedef struct __OSDir __OSDir, *P__OSDir;

struct __OSDir {
    u32 game_code;
    u16 company_code;
    union __OSInodeUnit start_page;
    u8 status;
    s8 reserved;
    u16 data_sum;
    u8 ext_name[4];
    u8 game_name[16];
};

typedef struct ALLoadFilter ALLoadFilter, *PALLoadFilter;

struct ALLoadFilter {
    struct ALfilter filter;
    ADPCM_STATE *state;
    ADPCM_STATE *lstate;
    struct ALRawLoop loop;
    struct ALWaveTable *table;
    s32 bookSize;
    ulong (*dma)(void);
    void *dmaState;
    s32 sample;
    s32 lastsam;
    s32 first;
    s32 memin;
};

typedef enum AniFlags {
    ANIDAT_USEMTX=4,
    ANIDAT_FLAG8=8,
    ANIDAT_FLAG10=16,
    ANIDAT_FLAG20=32,
    ANIDAT_FLAG40=64,
    ANIDAT_FLAG80=128,
    ANIFLAG_DYNLIGHT=32768
} AniFlags;

typedef struct App_manager App_manager, *PApp_manager;

struct App_manager {
    struct OSSched *sched;
    struct OSMesgQueue *MesgQ;
    OSMesg *Mesg;
    int *stack;
    struct OSThread Thread;
    struct OSMesgQueue MesgQ2;
    struct OSScClient client;
};

typedef struct ArmorCraftRecipie ArmorCraftRecipie, *PArmorCraftRecipie;

struct ArmorCraftRecipie {
    ushort item; /* gear in ram */
    u8 armor; /* armor in ram */
    u8 stam; /* hp used */
    u8 Mechanic; /* mechanic needed */
    u8 pad; /* i dunno */
};

typedef struct ArmorPointer ArmorPointer, *PArmorPointer;

struct ArmorPointer {
    u8 armors;
    u8 sheilds;
    u8 total;
    u8 pad;
    struct armour_RAM *Armor;
};

typedef struct Audio_manager Audio_manager, *PAudio_manager;

typedef struct Voice_Aidyn Voice_Aidyn, *PVoice_Aidyn;

typedef enum VoiceFlag {
    VOICE_STOP=2,
    VOICE_SETPITCH=8,
    VOICE_SETVOL=16,
    VOICE_SETPAN=32
} VoiceFlag;

struct Audio_manager {
    struct ALPlayer ALPLAYER;
    struct ALHeap ALHEAP;
    struct ALSynth ALSYNTH;
    void *ThreadStack;
    OSMesg *OsMsgPtr0x74;
    struct OSSched *OSSched;
    union Acmd *ACMDList;
    struct Voice_Aidyn *voicesAidyn;
    s16 *buffer_pointers[3];
    void *scaleBufferA;
    u32 scaleBufferB;
    u8 *indecies;
    u32 unk9c;
    struct OSThread Thread;
    struct OSScClient Client;
    struct OSScTask Task;
    u16 taskMsg;
    u8 unk0x2c2[30];
    OSMesg OSmesg0x2e0;
    struct OSMesgQueue mesgQ;
    struct OSMesgQueue mesgQ_2;
    struct OSMesgQueue *MesgQ_3;
    s32 AudiolistCount;
    u32 VoicesUsedTotal;
    u16 frequency;
    u16 audioLength;
    u16 unk0x324;
    u16 audioLengthMin;
    u16 bufferSize;
    u8 VoicesUsed;
    undefined1 audio_tally;
    s8 buffer_choice;
    undefined1 AudioListBool;
    undefined field33_0x32e;
    undefined field34_0x32f;
};

struct Voice_Aidyn {
    struct ALVoice voice;
    struct ALWaveTable wavetable;
    struct Borg11Data *instrumentData;
    uint id;
    u32 unk0x38;
    u32 waveTableLength;
    u32 loopEnd;
    ushort pitch;
    u8 loopCount;
    u8 isActive;
    u8 vol;
    u8 pan;
    enum VoiceFlag flag;
    u8 unk0x4b;
};

typedef struct audio_substruct_2 audio_substruct_2, *Paudio_substruct_2;

typedef struct SoundStructA SoundStructA, *PSoundStructA;

struct audio_substruct_2 {
    ushort index;
    short timer;
    u16 field2_0x4;
    undefined field3_0x6;
    undefined field4_0x7;
    struct Audio_obj voxel;
    struct SoundStructA *soundStruct;
};

struct SoundStructA {
    struct vec3f worldPos;
    int mapTally;
    s16 index;
    u8 zoneDatByte;
    u8 unk13;
    u16 timer;
    ushort flag;
    struct Borg12Header *borg12;
    struct Audio_obj *voxel;
    struct audio_obj_dat *voxelDat;
};

typedef struct audiokey_struct audiokey_struct, *Paudiokey_struct;

struct audiokey_struct {
    u8 (*a)[4];
    void* b;
    void* c;
    u8 d[1277][4];
};


typedef struct BorgListing BorgListing, *PBorgListing;

struct BorgListing {
    short Type; /* Borg type */
    short Compression; /* none,LZ01x,LZB */
    int compressed; /* size in ROM */
    int uncompressed; /* size in RAM */
    int Offset; /* index in in ROM DB */
};

typedef struct BREAKINFO BREAKINFO, *PBREAKINFO;

struct BREAKINFO {
    u32 *breakAddress;
    u32 oldInstruction;
};


typedef struct Calendar Calendar, *PCalendar;

struct Calendar { /* Timestruct->Ingame_time as x */
    u8 month; /* x / 0x114db000 */
    u8 week; /* (x % 0x114db000)/0x229b600 day: */
    u8 day; /* (x % 0x229b600) / 0x4f1a00 */
    u8 hour; /* (x % 0x4f1a00 >> 6) / 0xd2f */
    u8 minute; /* (x + ((x >> 6) / 0xd2f) * -0x34bc0) / 3600 */
    u8 second; /* (x % 3600) / 60 */
};

typedef struct Camera_struct Camera_struct, *PCamera_struct;



typedef struct cinematic_dat_pointers cinematic_dat_pointers, *Pcinematic_dat_pointers;

struct cinematic_dat_pointers {
    u32  *borg6;
    u16 *flags;
    enum Borg12Enum *borg12;
    float (*planes)[2];
};

typedef enum CinematicEnum {
    Cinematic_opening=0,
    Cinematic_Shadow=1,
    Cinematic_Roog=2,
    Cinematic_End=3
} CinematicEnum;

typedef struct CinematicFade CinematicFade, *PCinematicFade;

struct CinematicFade {
    u8 index;
    u8 fadeType; /* none,black,white,red */
    ushort runtime; /* div 2 */
    ushort fadeTime; /* div 2 */
    short exitTime;
};

typedef struct CinematicStruct CinematicStruct, *PCinematicStruct;

typedef enum enum_cinematic_switch {
    get_CinematicDat=0,
    Load_world_map=1,
    set_CreditsByte=2,
    Alaron_Truename=3,
    From_CinematicMenu=4
} enum_cinematic_switch;

struct CinematicStruct {
    struct AnimationData *AniDat;
    struct borg6header *Borg6;
    struct Borg12Header *BGM;
    u16 *SeqenceFlags;
    float (*clippingPlanes)[2];
    u32  *borg6enums;
    enum Borg12Enum *borg12enums;
    u16 tally;
    u16 scene_switch;
    u16 Bstart;
    enum enum_cinematic_switch switch_;
    u32 some_cinematic_tally;
    u32 some_cinematic_dat;
    undefined1 field13_0x2c;
};

typedef struct cinematictext_struct cinematictext_struct, *Pcinematictext_struct;

struct cinematictext_struct {
    int showCaptionTimer;
    struct WigetCinematicText *widget;
    void* field2_0x8;
    ushort (*shortsPointer)[3];
    ushort field4_0x10;
    ushort caption_scene_max;
    ushort caption_index;
    ushort runtime;
    ushort captionTime;
    char nextCaption[256];
    char AlaronName[256]; /* yeah, for just the player name */
    ushort pad;
};

typedef struct CityMarkers CityMarkers, *PCityMarkers;

struct CityMarkers {
    u16 borg;
    ushort x;
    ushort y;
};

typedef struct cloudStruct cloudStruct, *PcloudStruct;

struct cloudStruct {
    u8 index;
    struct vec3f v3;
    u32 unused;
    Color32 col;
    float f3;
};
// Strings loaded in by stringDB
/*
typedef struct CommonStringArray CommonStringArray, *PCommonStringArray;

struct CommonStringArray {
    char *Chest;
    char *Bag;
    char *Box;
    char *Barrel;
    char *Herbs;
    char *Spices;
    char *Gem Stones;
    char *Treasure Pile;
    char *Failed to pick lock;
    char *Failed To disarm trap;
    char *Failed To Fix;
    char *Failed to estimate size of party;
    char *Failed to change monster reaction;
    char *Party Member Too Weak;
    char *Task not Completed;
    char *field15_0x3c;
    char *field16_0x40;
    char *field17_0x44;
    char *field18_0x48;
    char *field19_0x4c;
    char *field20_0x50;
    char *field21_0x54;
    char *field22_0x58;
    char *field23_0x5c;
    char *field24_0x60;
    char *field25_0x64;
    char *field26_0x68;
    char *field27_0x6c;
    char *field28_0x70;
    char *false;
    char *true;
    char *yes_;
    char *no;
    char *field33_0x84;
    char *field34_0x88;
    char *Please Connect controller?;
    char *field36_0x90;
    char *field37_0x94;
    char *field38_0x98;
    char *field39_0x9c;
    char *field40_0xa0;
    char *field41_0xa4;
    char *field42_0xa8;
    char *field43_0xac;
    char *field44_0xb0;
    char *field45_0xb4;
    char *field46_0xb8;
    char *SCENE;
    char *CONTAINER;
    char *LIGHT;
    char *AUDIO;
    char *WANDERNODE;
    char *PARTY;
    char *REFPOINT;
    char *TELEPORTER;
    char *CAMERA;
    char *DIALOUGE;
    char *TRIGGER;
    char *SAVEPOINT;
    char *CODE;
    char *NUMOBJECTS;
    char *field61_0xf4;
    char *field62_0xf8;
    char *field63_0xfc;
    char *field64_0x100;
    char *field65_0x104;
    char *field66_0x108;
    char *field67_0x10c;
    char *field68_0x110;
    char *field69_0x114;
    char *field70_0x118;
    char *field71_0x11c;
    char *field72_0x120;
    char *field73_0x124;
    char *field74_0x128;
    char *field75_0x12c;
    char *field76_0x130;
    char *field77_0x134;
    char *field78_0x138;
    char *field79_0x13c;
    char *field80_0x140;
    char *field81_0x144;
    char *field82_0x148;
    char *field83_0x14c;
    char *field84_0x150;
    char *field85_0x154;
    char *field86_0x158;
    char *field87_0x15c;
    char *Party member too weak;
    char *No luck, task not completed;
    char *Task completed sucessfully;
    char *Don't have proper components;
    char *party member already healed;
    char *Stats already at max;
    char *Need more practice in that skill;
    char *ok;
    char *Item Cannot Be Equipped;
    char *field97_0x184;
    char *field98_0x188;
    char *field99_0x18c;
    char *field100_0x190;
    char *field101_0x194;
    char *field102_0x198;
    char *field103_0x19c;
    char *field104_0x1a0;
    char *field105_0x1a4;
    char *field106_0x1a8;
    char *field107_0x1ac;
    char *field108_0x1b0;
    char *field109_0x1b4;
    char *field110_0x1b8;
    char *field111_0x1bc;
    char *field112_0x1c0;
    char *field113_0x1c4;
    char *field114_0x1c8;
    char *field115_0x1cc;
    char *field116_0x1d0;
    char *field117_0x1d4;
    char *field118_0x1d8;
    char *field119_0x1dc;
    char *field120_0x1e0;
    char *field121_0x1e4;
    char *field122_0x1e8;
    char *field123_0x1ec;
    char *field124_0x1f0;
    char *field125_0x1f4;
    char *field126_0x1f8;
    char *field127_0x1fc;
    char *field128_0x200;
    char *field129_0x204;
    char *field130_0x208;
    char *field131_0x20c;
    char *field132_0x210;
    char *field133_0x214;
    char *Cut to Camera;
    char *Sine to Camera;
    char *angle to;
    char *pan to;
    char *On;
    char *Cut to POV;
    char *field140_0x230;
    char *field141_0x234;
    char *field142_0x238;
    char *On POV;
    char *Face;
    char *Track on;
    char *Fade;
    char *Blooming Season;
    char *Late Blooming Season;
    char *Earth Season;
    char *Late Earth Season;
    char *Summer Season;
    char *Late Summer Season;
    char *Golden Season;
    char *Late Golden Season;
    char *Fall Season;
    char *Late Fall Season;
    char *Winter Season;
    char *Late Winter Season;
    char *New Game;
    char *Load Game;
    char *Options;
    char *Theater;
    char *Audio;
    char *Sound;
    char *Music;
    char *Graphics;
    char *Normal Resolution;
    char *high Resolution;
    char *32 bit color;
    char *GAME;
    char *RENAME CHARACTER;
    char *No Cinematics yet;
    char *Help;
    char *New cont pak found;
    char *retry with old cont pak;
    char *continue__;
    char *field177_0x2c4;
    char *field178_0x2c8;
    char *field179_0x2cc;
    char *field180_0x2d0;
    char *field181_0x2d4;
    char *Retry;
    char *field183_0x2dc;
    char *controller pak is full;
    char *manage controller pak;
    char *continue without saving__;
    char *field187_0x2ec;
    char *field188_0x2f0;
    char *game saved is corrupt;
    char *field190_0x2f8;
    char *field191_0x2fc;
    char *field192_0x300;
    char *field193_0x304;
    char *field194_0x308;
    char *field195_0x30c;
    char *field196_0x310;
    char *field197_0x314;
    char *field198_0x318;
    char *field199_0x31c;
    char *field200_0x320;
    char *field201_0x324;
    char *field202_0x328;
    char *field203_0x32c;
    char *continue without saving_;
    char *delete game note?;
    char *yes;
    char *All Game States;
    char *field208_0x340;
    char *field209_0x344;
    char *field210_0x348;
    char *field211_0x34c;
    char *field212_0x350;
    char *field213_0x354;
    char *field214_0x358;
    char *field215_0x35c;
    char *field216_0x360;
    char *field217_0x364;
    char *field218_0x368;
    char *field219_0x36c;
    char *field220_0x370;
    char *field221_0x374;
    char *field222_0x378;
    char *field223_0x37c;
    char *field224_0x380;
    char *field225_0x384;
    char *field226_0x388;
    char *field227_0x38c;
    char *field228_0x390;
    char *field229_0x394;
    char *field230_0x398;
    char *field231_0x39c;
    char *field232_0x3a0;
    char *field233_0x3a4;
    char *Random;
    char *Sneak;
    char *Ambush;
    char *Stop;
    char *Sneak_;
    char *Walk;
    char *Run;
    char *None;
    char *Earth;
    char *Solar;
    char *Physical;
    char *Necromancy;
    char *Fire;
    char *Lunar;
    char *Naming;
    char *Water;
    char *Magic;
    char *Air;
    char *Star;
    char *Ok;
    char *You cannot Cast that spell now;
    char *Spell can only be cast in the day;
    char *Spell can only be cast in the night;
    char *field257_0x404;
    char *field258_0x408;
    char *field259_0x40c;
    char *field260_0x410;
    char *field261_0x414;
    char *field262_0x418;
    char *field263_0x41c;
    char *field264_0x420;
    char *field265_0x424;
    char *field266_0x428;
    char *field267_0x42c;
    char *field268_0x430;
    char *field269_0x434;
    char *field270_0x438;
    char *field271_0x43c;
    char *field272_0x440;
    char *field273_0x444;
    char *field274_0x448;
    char *field275_0x44c;
    char *field276_0x450;
    char *field277_0x454;
    char *field278_0x458;
    char *field279_0x45c;
    char *field280_0x460;
    char *field281_0x464;
    char *field282_0x468;
    char *Bite;
    char *field284_0x470;
    char *field285_0x474;
    char *field286_0x478;
    char *field287_0x47c;
    char *field288_0x480;
    char *field289_0x484;
    char *field290_0x488;
    char *field291_0x48c;
    char *field292_0x490;
    char *field293_0x494;
    char *field294_0x498;
    char *field295_0x49c;
    char *field296_0x4a0;
    char *field297_0x4a4;
    char *field298_0x4a8;
    char *field299_0x4ac;
    char *field300_0x4b0;
    char *field301_0x4b4;
    char *field302_0x4b8;
    char *field303_0x4bc;
    char *field304_0x4c0;
    char *field305_0x4c4;
    char *field306_0x4c8;
    char *field307_0x4cc;
    char *field308_0x4d0;
    char *field309_0x4d4;
    char *Clear;
    char *Fog;
    char *Rain;
    char *Dawn;
    char *Morning;
    char *Afternoon;
    char *Night;
    char *Dark;
    char *Half;
    char *Full;
    char *Dark_;
    char *Strom;
    char *Earth_;
    char *Fire_;
    char *Light_;
    char *Water_;
    char *Clear_;
    char *field327_0x51c;
    char *Moonday;
    char *Tuesday;
    char *Weirday;
    char *Thorsday;
    char *Fryday;
    char *Saturnday;
    char *Sunday;
    char *Rough;
    char *Forest;
    char *Desert;
    char *Marsh;
    char *Mountains;
    char *Barrow;
    char *Sea;
    char *field342_0x558;
    char *None_;
    char *Rain_;
    char *Snow;
    char *Default_;
    char *Collision on Player and Camera;
    char *field348_0x570;
    char *field349_0x574;
    char *field350_0x578;
    char *field351_0x57c;
    char *field352_0x580;
    char *field353_0x584;
    char *field354_0x588;
    char *field355_0x58c;
    char *field356_0x590;
    char *field357_0x594;
    char *field358_0x598;
    char *field359_0x59c;
    char *field360_0x5a0;
    char *field361_0x5a4;
    char *field362_0x5a8;
    char *field363_0x5ac;
    char *field364_0x5b0;
    char *field365_0x5b4;
    char *field366_0x5b8;
    char *field367_0x5bc;
    char *field368_0x5c0;
    char *field369_0x5c4;
    char *field370_0x5c8;
    char *field371_0x5cc;
    char *field372_0x5d0;
    char *field373_0x5d4;
    char *field374_0x5d8;
    char *InvalidId;
    char *Bad Data;
    char *Save Game;
    char *Flee;
    char *discovered secret door;
    char *field380_0x5f0;
    char *field381_0x5f4;
    char *field382_0x5f8;
    char *field383_0x5fc;
    char *This is Highway Robbery!;
    char *Ouch! That's pretty expensive;
    char *That's a bit more than the usual price;
    char *The price is about what you expect;
    char *This is less than you expect topay;
    char *This is a really good price;
    char *What an Amazing Bargain!;
    char *Name_;
    char *Not Enough Pages on Controller Pak;
    char *There are still not enough pages to save;
    char *Controller Pak is still Full;
    char *field395_0x62c;
    char *continue_;
    char *field397_0x634;
    char *field398_0x638;
    char *field399_0x63c;
    char *field400_0x640;
    char *error reading controller pak;
    char *continue without saving;
    char *field403_0x64c;
    char *insert new controller pak;
    char *field405_0x654;
    char *field406_0x658;
    char *field407_0x65c;
    char *field408_0x660;
    char *empty;
    char *field410_0x668;
    char *field411_0x66c;
    char *controller pak is corrupt;
    char *controller pak is damaged;
    char *are you sure you wish to overWrite?;
    char *overwrite;
    char *field416_0x680;
    char *Error Reading Controllerpak;
    char *field418_0x688;
    char *field419_0x68c;
    char *field420_0x690;
    char *field421_0x694;
    char *field422_0x698;
    char *field423_0x69c;
    char *field424_0x6a0;
    char *field425_0x6a4;
    char *field426_0x6a8;
    char *field427_0x6ac;
    char *field428_0x6b0;
    char *Trap disarmed;
    char *slightly;
    char *field431_0x6bc;
    char *field432_0x6c0;
    char *there's a dangerous trap;
    char *field434_0x6c8;
    char *trap exploded;
    char *someone in party is invalid;
    char *shadow's prescence prevents healing;
    char *X failed the task;
    char *X already at max health;
    char *X heals Y by Z;
    char *only wizards can learn spells;
    char *they already know that spell;
    char *need higher wizard to know that spell;
    char *wrong school for spell;
    char *char learned spell;
    char *hp restored by x;
    char *party couldn't pick lock;
    char *far;
    char *a little;
    char *definietly;
    char *lock beyon ability to pick;
    char *too weak to pick;
    char *sucessfully picks lock;
    char *field454_0x718;
    char *field455_0x71c;
    char *made potion;
    char *not enough potion components;
    char *field458_0x728;
    char *made flask;
    char *not enough flask components;
    char *you do not have the components to make armor;
    char *field462_0x738;
    char *you failed to make armor;
    char *armor sucessfully created;
    char *healer tasks;
    char *lay on hands;
    char *heal with herbs;
    char *restore;
    char *health curr / max;
    char *already max hp;
    char *field471_0x75c;
    char *field472_0x760;
    char *field473_0x764;
    char *field474_0x768;
    char *field475_0x76c;
    char *field476_0x770;
    char *field477_0x774;
    char *field478_0x778;
    char *field479_0x77c;
    char *field480_0x780;
    char *Hours:;
    char *you just picked up gold;
    char *field483_0x78c;
    char *field484_0x790;
    char *leave items behind?;
    char *no, changed my mind;
    char *yes, leave it;
    char *to use the potion...;
    char *cannot be equipped until their turn;
    char *cannot be removed until their turn;
    char *Party gained EXP;
    char *field492_0x7b0;
    char *EXP cost Max;
    char *EXP Cost;
    char *EXP remaining;
    char *No Journal entries;
    char *learned first spell;
    char *only wizards can learn magic;
    char *field499_0x7cc;
    char *field500_0x7d0;
    char *field501_0x7d4;
    char *field502_0x7d8;
    char *field503_0x7dc;
    char *field504_0x7e0;
    char *field505_0x7e4;
    char *Xp remaining;
    char *Total XP;
    char *Next Level;
    char *MAX;
    char *You caonnt train stat further;
    char *you need X XP to train this status;
    char *Train this for X XP?;
    char *You cannot learn this skill;
    char *cannot teach skill further;
    char *cannot train skill further;
    char *field516_0x810;
    char *field517_0x814;
    char *train for Xp and Gold;
    char *train for Xp;
    char *gold cost X;
    char *you got a potion!;
    char *Nothing there;
    char *you cannot afford that;
    char *you cannot hold any more;
    char *party inventory's full;
    char *I don't want that;
    char *you cannot drop that;
    char *you must unequip to sell;
    char *you must unequip to drop;
    char *Found X gold;
    char *value: X;
    char *you feel like you need something here;
    char *min. Wiz rank;
    char *field534_0x858;
    char *field535_0x85c;
    char *Aspect;
    char *min.Str;
    char *BaseHit;
    char *Damage;
    char *spell battery;
    char *Magic_;
    char *Spell_;
    char *Resists;
    char *protection;
    char *field545_0x884;
    char *field546_0x888;
    char *field547_0x88c;
    char *field548_0x890;
    char *field549_0x894;
    char *Min. Int;
    char *charges;
    char *Cannot train spell further;
    char *Create New Save;
    char *the x can only be weilded by Y;
};
*/
typedef struct ContPakWidget ContPakWidget, *PContPakWidget;

struct ContPakWidget {
    struct BaseWidget base;
    u32 field1_0x7c;
    struct BaseWidget *wiget_link;
    u8 field3_0x84;
    PFS_ERR8 pfserr;
    u8 field5_0x86;
    char field6_0x87;
    u32 field7_0x88;
    struct WidgetHandler handler;
    enum CONT_STATUS contStat;
    undefined field10_0x95;
    undefined field11_0x96;
    undefined field12_0x97;
};

typedef struct crash_DatString crash_DatString, *Pcrash_DatString;

struct crash_DatString {
    uint ANDMask;
    uint Value;
    char *String;
};



typedef struct DCM_struct DCM_struct, *PDCM_struct;

struct DCM_struct {
    struct DCM_sub *ptr0;
    struct Borg12Sub *borg12;
    int unk8;
    u32 unkc;
    u32 byteIndex;
    u32 id;
    u8 active;
    u8 unk19;
    u8 unk20;
    u8 vol;
    u8 pan;
    u8 unk1d;
    u8 unk1e;
    undefined field13_0x1f;
};

typedef struct DCMManager DCMManager, *PDCMManager;

struct DCMManager {
    struct ALPlayer ALplayer;
    struct DCM_struct *DCMStructPointer;
    u8 *pointer_B;
    u32 Tally;
    u8 index;
};

typedef struct DebugCharChanger DebugCharChanger, *PDebugCharChanger;

struct DebugCharChanger {
    u32 borg7;
    float f;
    char *label;
};

typedef struct DebugMapLabel DebugMapLabel, *PDebugMapLabel;

struct DebugMapLabel {
    enum EnumMapDatA a;
    ushort b;
    ushort c;
    char *label;
};

typedef struct DialoigEntPointer DialoigEntPointer, *PDialoigEntPointer;

struct DialoigEntPointer {
    u8 total;
    struct DialougEnt_RAM *ents;
};

typedef struct dialougemode_struct dialougemode_struct, *Pdialougemode_struct;

typedef struct wander_substruct wander_substruct, *Pwander_substruct;

struct dialougemode_struct {
    ulong (*funcs0[5])(void);
    ulong (*funcs1[5])(void);
    ulong (*funcs2[5])(void);
    ulong (*funcs3[5])(void);
    ulong (*funcs4[5])(void);
    ulong (*unk0x64[5])(void);
    struct wander_substruct *Wanderers;
    u16 Unk0x7C;
    undefined field8_0x7e;
    undefined field9_0x7f;
    u8 *partySkillLvls; /* one for each skill */
    struct borg13data *borg13_dat;
    struct playerData *playerDat;
    enum borg13Enum borg13;
    u32 field14_0x90;
    u16 RefPointID;
    u16 mapDatA;
    u16 mapShort1;
    u16 mapShort2;
    u16 unk9c;
    undefined field20_0x9e;
    undefined field21_0x9f;
    int field22_0xa0;
    undefined field23_0xa4;
    undefined field24_0xa5;
    undefined field25_0xa6;
    undefined field26_0xa7;
    undefined field27_0xa8;
    undefined field28_0xa9;
    u8 func_index;
    u8 field30_0xab;
    u8 field31_0xac;
    u8 field32_0xad;
    undefined field33_0xae;
    undefined field34_0xaf;
    int camp_flag;
    struct dialougmode_substruct some_substruct;
};

struct wander_substruct {
    struct playerData *playerDat;
    struct vec2f start_position;
    float wanderRadius;
    float randVal;
    float nodeswapChance;
    ushort timer;
    u16 homenode;
    u16 noderelA;
    u16 noderelB;
    s16 isActive;
    short field10_0x22;
    float senseValA;
    float senseValB;
    float unk2c;
    float unk30;
    float unk34;
    u16 flags;
    s16 bool3a;
    u16 NoBorg13;
    u16 field19_0x3e;
    struct vec2f position;
    float size;
    int MapTally;
    u16 VoxelIndex;
    undefined field24_0x52;
    undefined field25_0x53;
};

typedef struct DynamicLightHead DynamicLightHead, *PDynamicLightHead;

struct DynamicLightHead {
    struct light_obj lights[16];
    short shortsA[16][4];
    short shortsB[16];
    short dynamicLightCount;
    s16 initFlag;
};

typedef struct encounter_rom_dat encounter_rom_dat, *Pencounter_rom_dat;

struct encounter_rom_dat {
    struct monsterpartyEntry entries[2];
};

typedef enum enum_someCase {
    CombatLevelUp=5
} enum_someCase;

typedef struct event_flag_array event_flag_array, *Pevent_flag_array;

struct event_flag_array {
    u16 to;
    u16 from;
    short val;
    u8 skill_stat;
    u8 pad;
};



typedef struct fileState_aidyn fileState_aidyn, *PfileState_aidyn;

struct fileState_aidyn {
    ushort filesize;
    u16 comp_code;
    u32 game_code;
    char game_name[16];
    u8 field4_0x18;
    char ext_name[4];
};

typedef struct flag_cinematic flag_cinematic, *Pflag_cinematic;

struct flag_cinematic {
    u16 flag;
    enum CinematicEnum cinematic;
    u8 pad;
};

typedef struct Flycam_entry Flycam_entry, *PFlycam_entry;

struct Flycam_entry { /* data entry for titlescreen flycam */
    u32  borg6;
    undefined field1_0x4;
    undefined field2_0x5;
    ushort a;
    undefined field4_0x8;
    undefined field5_0x9;
    ushort b;
    undefined field7_0xc;
    undefined field8_0xd;
    ushort Deimos;
    undefined field10_0x10;
    undefined field11_0x11;
    ushort Phobos;
};

typedef struct flycamStruct flycamStruct, *PflycamStruct;

struct flycamStruct {
    struct vec3f vec3_0;
    struct vec3f vec3_1;
    struct vec3f Position;
    struct vec3f Aim;
    short shortA;
    short shortB;
    short shortC;
    short ShortD;
};

typedef struct FontFace FontFace, *PFontFace;

struct FontFace {
    u32 borg8;
    u8 rows;
    u8 cols;
    undefined field3_0x6;
    undefined field4_0x7;
};

typedef struct FontStruct FontStruct, *PFontStruct;

struct FontStruct {
    void *borg8_index;
    struct Borg8header *pointerA;
    char field2_0x8;
    u8 field3_0x9;
    char field4_0xa;
    undefined field5_0xb;
    u16 field6_0xc;
    short Font_Height;
    u16 field8_0x10;
    u16 field9_0x12;
    float kerningMulti;
    u16 *pointerb;
    Color32 col;
};


typedef struct GameStateFunnel GameStateFunnel, *PGameStateFunnel;

typedef struct Struct_State Struct_State, *PStruct_State;



typedef struct Gear_Pointer Gear_Pointer, *PGear_Pointer;

struct Gear_Pointer {
    u8 total;
    u8 totalPerGear[11];
    u8 unk1[12];
    struct Gear_RAM *Gear;
};

typedef struct wander_struct wander_struct, *Pwander_struct;

typedef struct player_char_struct player_char_struct, *Pplayer_char_struct;

typedef struct SFX_Struct SFX_Struct, *PSFX_Struct;

typedef struct SkyStruct SkyStruct, *PSkyStruct;

typedef struct PauseWidget PauseWidget, *PPauseWidget;

typedef struct MiniMap MiniMap, *PMiniMap;

typedef struct Party Party, *PParty;

typedef struct ScriptCamera_struct ScriptCamera_struct, *PScriptCamera_struct;

typedef struct QueueStructA QueueStructA, *PQueueStructA;

typedef struct QueueStructB QueueStructB, *PQueueStructB;

typedef struct N64Print N64Print, *PN64Print;

typedef struct ZoneDat ZoneDat, *PZoneDat;

typedef struct Weather Weather, *PWeather;

typedef struct PlayerHandler PlayerHandler, *PPlayerHandler;

typedef struct PartyInventory PartyInventory, *PPartyInventory;

typedef struct ScriptCam ScriptCam, *PScriptCam;

typedef struct QueueStructAItem QueueStructAItem, *PQueueStructAItem;

typedef struct QueueStructBItem QueueStructBItem, *PQueueStructBItem;

struct PlayerHandler {
    short max_player;
    u16 initFlag;
    struct Camera_struct *camera;
    short cameraFocus;
    undefined field4_0xa;
    undefined field5_0xb;
    struct playerData *playerDats;
    s16 unk10[40];
    short playerCount;
    ushort counter;
    float float_0x64;
    float float_0x68;
    struct Borg1header *shadowTexture;
    u32 field13_0x70;
    struct audiokey_struct *audiokey;
};

struct wander_struct {
    struct wander_substruct *wanderSubstructs;
    short wandererIndicies[39];
    ushort wanderers;
    short wanderersmax;
    u16 initalized;
};

struct player_char_struct {
    struct playerData *playerDat;
    enum Borg7Enum player_form;
    float collisionRadius;
    u16 show_portaits;
    u16 some_sound_var;
    u16 unk10;
    undefined field6_0x12;
    undefined field7_0x13;
    struct BaseWidget *smallerDebugWindow;
    struct BaseWidget *debugMenuTP;
    struct BaseWidget *debugMenuActor;
    u32 debugMenuUnused0;
    struct BaseWidget *debugMenuEnemy;
    struct BaseWidget *debugMenuArena;
    u32 debugMenuUnused1;
    struct BaseWidget *text_window;
    u8 unkState;
    undefined field17_0x35;
    ItemID current_shopkeep;
};



struct ZoneDat {
    int borg5_ID;
    struct AnimationData *anidat0x4;
    enum borg9Enum borg9_id;
    struct Borg9header *mapPointer;
    uint unk0x10;
    struct AnimationData *aniDat0x14;
    uint MapTally;
    u8 alpha;
    u8 index; /* BCD of mtxIndex */
    u8 flag;
    u8 unk1f;
};

struct Weather {
    ushort rainShortA;
    ushort rainShortB;
    float timer;
    u32 unk8;
    float fogTime;
    u16 skyBgdat;
    undefined field6_0x12;
    undefined field7_0x13;
    struct ParticleEmmiter *rainParticles;
    struct Borg12Header *Sfx;
    u32 sfxID;
    u8 sfxIndex;
};


struct QueueStructAItem {
    void* BorgPointer;
    short BorgSwitch;
    short field2_0x6;
};

struct QueueStructA {
    struct QueueStructAItem array[256];
    ushort items;
};

struct ScriptCamera_struct {
    struct ScriptCam *cameras; /* 0x7c size */
    short cameraIndecies[8];
    ushort cameraCount; /* up to 8 */
    short dataActive;
    short counter0;
    short counter1;
};

struct QueueStructBItem {
    void *pBorg;
    int field1_0x4;
    int BorgIndex;
    ushort BorgSwitch;
    u8 field4_0xe;
    undefined field5_0xf;
};

struct QueueStructB {
    struct QueueStructBItem array[32];
    ushort items;
};

struct SFX_Struct {
    struct SoundStructA *pointerA; /* 80 entries */
    ushort shortArrayA[80];
    u16 pointerAIndex;
    undefined field3_0xa6;
    undefined field4_0xa7;
    struct audio_substruct_2 *pointerB; /* 16 entries */
    ushort shortArrayB[16];
    ushort pointerBIndex;
    u16 field8_0xce;
};

struct SkyStruct {
    u16 Type; /* no more than 5 */
    struct SkySubstruct obj4;
    struct SkySubstruct obj10;
    Color32 *gradient;
    Color32 colors[5];
    float gray;
    float grayDelta;
    float lensFlareVal;
    float unk40;
    float unk44;
    float unk48;
};



struct ScriptCam {
    short field0_0x0;
    short field1_0x2;
    ushort field2_0x4;
    short flag;
    struct vec3f *aim;
    float field5_0xc;
    struct camera_obj voxel;
};

struct PauseWidget {
    struct BaseWidgetPause base;
    u32 unk0x7c;
    struct WidgetHandler *Handler;
};



typedef struct IconDict IconDict, *PIconDict;

struct IconDict { /* array Proceeded by dictionary length */
    ushort key;
    u16 value;
};

typedef struct Item_Icon Item_Icon, *PItem_Icon;

struct Item_Icon {
    ItemID id;
    u16 icon;
};

typedef struct itemtype_func itemtype_func, *Pitemtype_func;

struct itemtype_func {
    u8 type;
    u32 unk;
    ulong (*function)(void);
};

typedef struct KKBufferEvent KKBufferEvent, *PKKBufferEvent;

struct KKBufferEvent {
    struct KKHeader header;
    s32 object;
    u8 buffer[240];
};

typedef struct lensflare_data lensflare_data, *Plensflare_data;

struct lensflare_data {
    u8 dat0;
    float f0;
    float f1;
    Color32 col;
};

typedef struct locatorStruct locatorStruct, *PlocatorStruct;

struct locatorStruct {
    undefined field0_0x0;
    undefined field1_0x1;
    undefined field2_0x2;
    undefined field3_0x3;
    undefined field4_0x4;
    undefined field5_0x5;
    undefined field6_0x6;
    undefined field7_0x7;
    struct AnimationData *locators;
    undefined field9_0xc;
    undefined field10_0xd;
    undefined field11_0xe;
    undefined field12_0xf;
    undefined field13_0x10;
    undefined field14_0x11;
    undefined field15_0x12;
    undefined field16_0x13;
    undefined field17_0x14;
    undefined field18_0x15;
    undefined field19_0x16;
    undefined field20_0x17;
    undefined field21_0x18;
    undefined field22_0x19;
    undefined field23_0x1a;
    undefined field24_0x1b;
    int field25_0x1c;
    undefined field26_0x20;
    undefined field27_0x21;
    undefined field28_0x22;
    undefined field29_0x23;
    undefined field30_0x24;
    undefined field31_0x25;
    undefined field32_0x26;
    undefined field33_0x27;
    undefined field34_0x28;
    undefined field35_0x29;
    undefined field36_0x2a;
    undefined field37_0x2b;
    undefined field38_0x2c;
    undefined field39_0x2d;
    undefined field40_0x2e;
    undefined field41_0x2f;
    undefined field42_0x30;
    undefined field43_0x31;
    undefined field44_0x32;
    undefined field45_0x33;
    float field46_0x34;
};

typedef struct loot_Pointer loot_Pointer, *Ploot_Pointer;

struct loot_Pointer {
    u8 total;
    struct Loot_RAM *lootCat;
};

typedef struct mapDataList mapDataList, *PmapDataList;

struct mapDataList {
    ushort mapShortA;
    ushort MapShortB;
    u16 borg5;
    ushort borg6;
    u16 borg9;
    u16 terrian;
};

typedef struct MapEventFlag MapEventFlag, *PMapEventFlag;

struct MapEventFlag {
    uint MapShortA;
    uint MapShortB;
    uint flag;
};



typedef enum OS_IO_DIRECTION { /* read/write directions for DMA's */
    OS_READ,
    OS_WRITE,
    OS_OTHERS
} OS_IO_DIRECTION;


typedef struct potionRecipie potionRecipie, *PpotionRecipie;

struct potionRecipie {
    u8 ID;
    u8 spice;
    u8 herb;
    u8 gemstone;
    u8 alchemist;
    u8 unk;
};

typedef enum PRECIPITATION {
    PRECIP_CLEAR,
    PRECIP_RAIN,
    PRECIP_SNOW
} PRECIPITATION;

typedef struct ResolutionSettings ResolutionSettings, *PResolutionSettings;

struct ResolutionSettings {
    ushort Hres;
    ushort Vres;
    u8 pad;
    u8 colorDepth;
};


typedef struct RomstringController RomstringController, *PRomstringController;
//Placeholder struct for romstrings. to replace with char** and enums.
/*
struct RomstringController {
    char *continue w/o saving;
    char *cont pak full;
    char *not enough pages;
    char *error reading;
    char *retry;
    char *insert new controllerpak;
    char *game needs cont pak;
    char *cont w/o saving;
    char *retry new pak;
    char *manage cont pak;
    char *new cont pak detected;
    char *continue;
    char *contpak corrupt;
    char *contpak damaged;
    char *insert new pak(retry);
    char *repair;
    char *repair ok;
    char *repair fail;
    char *insert new pak;
    char *unsupported device;
    char *insert cont pak;
};
*/



typedef struct shop_pointer shop_pointer, *Pshop_pointer;

struct shop_pointer {
    u8 total; /* number of shops */
    struct shop_ram *shops; /* shops' listing */
};

typedef byte ShortLE[2];

typedef struct SkyobjectStruct SkyobjectStruct, *PSkyobjectStruct;

struct SkyobjectStruct {
    u8 byte0;
    float f0;
    float f1;
    float f2;
    Color32 col;
};

typedef enum SP_STATUS_WRITE {
    SP_CLR_HALT=1,
    SP_SET_HALT=2,
    SP_CLR_BROKE=4,
    SP_CLR_INTR=8,
    SP_SET_INTR=16,
    SP_CLR_SSTEP=32,
    SP_SET_SSTEP=64,
    SP_CLR_INTR_BREAK=128,
    SP_SET_INTR_BREAK=256,
    SP_CLR_YEILD=512,
    SP_SET_YEILD=1024,
    SP_CLR_YEILDED=2048,
    SP_SET_YEILDED=4096,
    SP_CLR_TASKDONE=8192,
    SP_SET_TASKDONE=16384,
    SP_CLR_RSPSIGNAL=32768,
    SP_SET_RSPSIGNAL=65536,
    SP_CLR_CPUSIGNAL=131072,
    SP_SET_CPUSIGNAL=262144,
    SP_CLR_SIG5=524288,
    SP_SET_SIG5=1048576,
    SP_CLR_SIG6=2097152,
    SP_SET_SIG6=4194304,
    SP_CLR_SIG7=8388608,
    SP_SET_SIG7=16777216
} SP_STATUS_WRITE;

typedef struct spells_pointer spells_pointer, *Pspells_pointer;

struct spells_pointer {
    u8 Total;
    u8 Schools[6];
    u8 schools2[6];
    u8 field3_0xd[3];
    struct Spell_RAM *spells;
};

typedef struct SpellVisuals1 SpellVisuals1, *PSpellVisuals1;

struct SpellVisuals1 {
    struct Borg7header *field0_0x0;
    struct vec3f pos;
    struct vec3f loc3Pos;
    float field3_0x1c;
    enum Borg7Enum field4_0x20;
    u32 field5_0x24;
    uint flags;
    u16 field7_0x2c;
    u8 field8_0x2e;
    undefined field9_0x2f;
};

typedef struct SpellVisuals_struct SpellVisuals_struct, *PSpellVisuals_struct;

struct SpellVisuals_struct {
    struct spellVisualsEntry *ptr0; /* 64 entries */
    struct SpellVisuals1 *ptr1; /* 128 entries */
    struct SpellVisualsEntry2 *ptr2; /* 16 entries */
    short *indecies0; /* 64 indecies */
    short *indecies1; /* 128 indecies */
    short *indecies2; /* 16 indecies */
    float field6_0x18;
    int field7_0x1c;
    uint lifeTime;
    ushort field9_0x24;
    u16 field10_0x26;
    u16 ptr0Count;
    u16 ptr1count;
    u16 prt2count;
    u16 field14_0x2e;
    undefined1 field15_0x30;
};

typedef struct StringCheat StringCheat, *PStringCheat;

struct StringCheat { /* struct used for cheat functions */
    char *code;
    u32 (*cheat)(void);
};

struct struct_A {
    struct AnimationData *anidat;
    u16 flags;
    undefined field2_0x6;
    undefined field3_0x7;
};

typedef struct struct_5 struct_5, *Pstruct_5;

struct struct_5 {
    struct Borg5header *borg5;
    struct borg6header *borg6;
    struct AnimationData *link;
    struct AniDatSubstruct *substruct;
};

typedef struct sundail_struct sundail_struct, *Psundail_struct;

struct sundail_struct {
    struct Borg8header *Ring;
    struct Borg8header *Cross;
    struct Borg8header *MoonPhase0;
    struct Borg8header *MoonPhase1;
    struct Borg8header *MoonPhase2;
    struct Borg8header *MoonPhase3;
    struct Borg8header *MoonPhase4;
    struct Borg8header *MoonPhase5;
    struct Borg8header *SunBig;
    struct Borg8header *SunSmall;
    u8 moon;
    u8 sun;
};



typedef struct VoxelChartEntry VoxelChartEntry, *PVoxelChartEntry;

struct VoxelChartEntry {
    short arg0;
    u8 bool0x2;
    u8 arg7;
    u8 MapDatA;
    u8 MapShortA;
    u8 MapShortB;
    u8 type; /* VOBJECT */
    u32 unk0x8;
};

typedef struct weapon_pointer weapon_pointer, *Pweapon_pointer;

struct weapon_pointer {
    u8 Total;
    u8 Types[11];
    u8 Types2[11];
    u8 pad;
    struct weapon_ram *weapons;
};


typedef struct WidgetArmorCraft WidgetArmorCraft, *PWidgetArmorCraft;

struct WidgetArmorCraft {
    struct WidgetCrafting base;
};

typedef struct WidgetBufferedMenu WidgetBufferedMenu, *PWidgetBufferedMenu;

struct WidgetBufferedMenu {
    struct BaseWidget base;
    undefined field1_0x7c;
    undefined field2_0x7d;
    undefined field3_0x7e;
    undefined field4_0x7f;
    undefined field5_0x80;
    undefined field6_0x81;
    undefined field7_0x82;
    undefined field8_0x83;
    undefined field9_0x84;
    undefined field10_0x85;
    undefined field11_0x86;
    undefined field12_0x87;
    undefined field13_0x88;
    undefined field14_0x89;
    undefined field15_0x8a;
    undefined field16_0x8b;
    undefined field17_0x8c;
    undefined field18_0x8d;
    undefined field19_0x8e;
    undefined field20_0x8f;
    undefined field21_0x90;
    undefined field22_0x91;
    undefined field23_0x92;
    undefined field24_0x93;
    undefined field25_0x94;
    undefined field26_0x95;
    undefined field27_0x96;
    undefined field28_0x97;
    struct BaseWidget textWidgets[20];
    struct BaseWidget *field30_0xa48[20];
    undefined field31_0xa98;
    undefined field32_0xa99;
    undefined field33_0xa9a;
    undefined field34_0xa9b;
    undefined field35_0xa9c;
    undefined field36_0xa9d;
    undefined field37_0xa9e;
    undefined field38_0xa9f;
    struct BaseWidget titleWidget;
    undefined field40_0xb1c;
    undefined field41_0xb1d;
    undefined field42_0xb1e;
    undefined field43_0xb1f;
};

typedef struct WidgetCameraDebug WidgetCameraDebug, *PWidgetCameraDebug;

struct WidgetCameraDebug {
    struct BaseWidget base;
    struct BaseWidget *field1_0x7c;
    u16 refPointBase;
    u16 field3_0x82;
    undefined field4_0x84;
    undefined field5_0x85;
    undefined field6_0x86;
    undefined field7_0x87;
    u16 field8_0x88;
    undefined field9_0x8a;
    undefined field10_0x8b;
    undefined field11_0x8c;
    undefined field12_0x8d;
    u16 field13_0x8e;
    undefined field14_0x90;
    undefined field15_0x91;
    undefined field16_0x92;
    undefined field17_0x93;
    u16 field18_0x94;
    undefined field19_0x96;
    undefined field20_0x97;
    undefined field21_0x98;
    undefined field22_0x99;
    u16 field23_0x9a;
    undefined field24_0x9c;
    undefined field25_0x9d;
    undefined field26_0x9e;
    undefined field27_0x9f;
    u16 field28_0xa0;
    undefined field29_0xa2;
    undefined field30_0xa3;
    undefined field31_0xa4;
    undefined field32_0xa5;
    u16 field33_0xa6;
    undefined field34_0xa8;
    undefined field35_0xa9;
    undefined field36_0xaa;
    undefined field37_0xab;
    u16 field38_0xac;
    undefined field39_0xae;
    undefined field40_0xaf;
    undefined field41_0xb0;
    undefined field42_0xb1;
    u16 field43_0xb2;
    undefined field44_0xb4;
    undefined field45_0xb5;
    undefined field46_0xb6;
    undefined field47_0xb7;
    u16 field48_0xb8;
    undefined field49_0xba;
    undefined field50_0xbb;
    undefined field51_0xbc;
    undefined field52_0xbd;
    u16 field53_0xbe;
    undefined field54_0xc0;
    undefined field55_0xc1;
    undefined field56_0xc2;
    undefined field57_0xc3;
    u16 field58_0xc4;
    undefined field59_0xc6;
    undefined field60_0xc7;
    undefined field61_0xc8;
    undefined field62_0xc9;
    undefined field63_0xca;
    undefined field64_0xcb;
    undefined field65_0xcc;
    undefined field66_0xcd;
    undefined field67_0xce;
    undefined field68_0xcf;
    undefined field69_0xd0;
    undefined field70_0xd1;
    undefined field71_0xd2;
    undefined field72_0xd3;
    undefined field73_0xd4;
    undefined field74_0xd5;
    undefined field75_0xd6;
    undefined field76_0xd7;
};

typedef struct WidgetCombatActions WidgetCombatActions, *PWidgetCombatActions;

struct WidgetCombatActions {
    struct WidgetChild8 base;
    struct WidgetChild0 *unkb0;
};

typedef struct WidgetCombatRadar WidgetCombatRadar, *PWidgetCombatRadar;

struct WidgetCombatRadar {
    struct BaseWidget base;
    struct BaseWidget *compass;
    s16 field2_0x80;
    s16 field3_0x82;
};

typedef struct widgetCredits widgetCredits, *PwidgetCredits;

struct widgetCredits {
    struct BaseWidget base;
    u8 creditState;
    undefined field2_0x7d;
    undefined field3_0x7e;
    undefined field4_0x7f;
    struct BaseWidget *field5_0x80;
    struct BaseWidget *clipText;
    u8 field7_0x88;
    u8 field8_0x89;
    u8 field9_0x8a;
    undefined field10_0x8b;
    struct Borg12Header *bgm;
    u8 *indecies0;
    u8 *indecies1;
    float BGMVol;
    float SFXVol;
};

typedef struct WidgetDebugBig WidgetDebugBig, *PWidgetDebugBig;

struct WidgetDebugBig {
    struct BaseWidget base;
    struct BaseWidget *scrollMenu;
};

typedef struct WidgetMenuHealer WidgetMenuHealer, *PWidgetMenuHealer;

struct WidgetMenuHealer {
    struct WidgetCrafting base;
    struct BaseWidget *textBox;
};

typedef struct WidgetSpellEntry WidgetSpellEntry, *PWidgetSpellEntry;

struct WidgetSpellEntry {
    struct BaseWidget base;
    struct SpellInstance *spell;
    struct BaseWidget *aspectIcon;
    struct BaseWidget *SchoolIcon;
    struct BaseWidget *SpellIcon;
    struct BaseWidget *SpelllRank;
    struct BaseWidget *SpellName;
    u16 field7_0x94;
    u16 field8_0x96;
};

typedef struct WidgetSpellTrain WidgetSpellTrain, *PWidgetSpellTrain;

struct WidgetSpellTrain {
    struct WidgetTrainShop base;
};

typedef struct WorldMapPiece WorldMapPiece, *PWorldMapPiece;

struct WorldMapPiece {
    u16 eventFlag;
    u16 mapBorg8;
    u16 x;
    u16 y;
};

