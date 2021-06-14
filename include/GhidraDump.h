typedef unsigned char   undefined;

typedef unsigned char    bool;
typedef unsigned char    byte;
typedef unsigned int    dword;
typedef long long    longlong;
typedef char    sbyte;
typedef unsigned char    uchar;
typedef unsigned int    uint;
typedef unsigned long    ulong;
typedef unsigned long long    ulonglong;
typedef unsigned char    undefined1;
typedef unsigned short    undefined2;
typedef unsigned int    undefined3;
typedef unsigned int    undefined4;
typedef unsigned long long    undefined8;
typedef unsigned short    ushort;
typedef unsigned short    word;
typedef struct astruct astruct, *Pastruct;

struct astruct {
    undefined4 unk0x0;
    undefined4 unk0x4;
    undefined4 unk0x8;
    undefined4 unk0xc;
    undefined4 unk0x10;
    undefined4 unk0x14;
    uint unk0x18;
    undefined4 unk0x1c;
    undefined4 unk0x20;
    undefined4 unk0x24;
    uint unk0x28;
    uint unk0x2c;
    undefined4 unk0x30;
    undefined4 unk0x34;
    uint unk0x38;
    undefined4 unk0x3c;
};

typedef struct astruct_12 astruct_12, *Pastruct_12;

typedef struct widgetStruct widgetStruct, *PwidgetStruct;

typedef struct dialougmode_substruct dialougmode_substruct, *Pdialougmode_substruct;

typedef struct borg_13_data borg_13_data, *Pborg_13_data;

typedef struct color color, *Pcolor;

typedef struct Borg_8_header Borg_8_header, *PBorg_8_header;

typedef struct WidgetMethods WidgetMethods, *PWidgetMethods;

typedef struct struct_3 struct_3, *Pstruct_3;

typedef struct borg_13_command borg_13_command, *Pborg_13_command;

typedef enum EventFlag {
    BuySpiceOffGnomes=45,
    EnterGweneria=788,
    FLAG_Cinematic1=3,
    FLAG_Cinematic2=569,
    FLAG_Cinematic3=590,
    FLAG_Cinematic4=601,
    FLAG_GoblinAmbush=978,
    FLAG_MeetShadow=9,
    FLAG_ShadowMerge=566,
    GotFirstItems=3612,
    KendallsHat=2255,
    KendallsHat_=10,
    MeetAlaron=5,
    NewJournalEntry=3617,
    Rain0=2319,
    Rain1=2320,
    _Darkside=3675,
    _DarksideGet=3676,
    _Slashing=3673,
    _SlashingGet=3674,
    _bingo=3694,
    _cheater=3693
} EventFlag;

typedef struct borgHeader borgHeader, *PborgHeader;

typedef struct Borg_8_dat Borg_8_dat, *PBorg_8_dat;

typedef uint u_int32_t;

typedef u_int32_t u32;

typedef struct Method Method, *PMethod;

typedef struct ItemID ItemID, *PItemID;

typedef enum borg13_commands {
    Add_party_member=47,
    CampFullHeal=54,
    End_scene=34,
    Fade_in=1,
    Get party size=30,
    Is in party?=23,
    add gold=36,
    add_item=38,
    battle_encounter?=45,
    best stat=27,
    check event flag=24,
    check flag get rand=25,
    clear event flag=33,
    crash game=49,
    get money?=31,
    give exp=56,
    is item in inv?=26,
    loadMonster=16,
    look_for_item=39,
    play sfx=43,
    remove_party_member=48,
    set event flag=32,
    set_2_floats=35,
    shop=44,
    take gold=37,
    this_char stat=29,
    train skill=46,
    worst stat=28
} borg13_commands;

typedef enum image_format {
    CI8=4,
    IA8=5,
    RBGA32=1,
    RGBA16=2
} image_format;

typedef ushort u_int16_t;

typedef u_int16_t u16;

typedef enum DBTypeEnum { /* Each Data category has an Id'ing byte */
    Amulet=19,
    Belt=14,
    Boots=15,
    Empty=0,
    Glove=11,
    Helmet=9,
    KeyItem=18,
    LootDrop=8,
    Misc_item=1,
    Ring=12,
    Scroll=17,
    Spell=3,
    UNK4=4,
    Weapon=7,
    armor=5,
    cloak=10,
    dialougeEntity=20,
    entity=2,
    potion=16,
    sheild=6,
    wand=13
} DBTypeEnum;

struct color {byte R,G,B,A;};

struct borgHeader {
    int index;
    undefined4 unk;
};

struct widgetStruct { /* Parent for all widgets */
    void * ptr0;
    void * ptr0x4;
    ulong (* UpButtonFunc)(void);
    ulong (* DownButtonFunc)(void);
    ulong (* LeftButtonFunc)(void);
    ulong (* RightButtonFunc)(void);
    ulong (* AbuttonFunc)(void);
    ulong (* BButtonFunc)(void);
    ulong (* StartButtonFunc)(void);
    ulong (* LButtonFunc)(void);
    ulong (* RButtonFunc)(void);
    ulong (* ZButtonFunc)(void);
    ulong (* CUpFunc)(void);
    ulong (* CDownFunc)(void);
    ulong (* CLeftFunc)(void);
    ulong (* CRightFunc)(void);
    void * prt0x40; /* changes for each widget type */
    struct widgetStruct * func_array_Arg;
    undefined4 unk0x48;
    struct widgetStruct * link0;
    struct widgetStruct * link1;
    struct widgetStruct * link2;
    struct color col;
    byte unk0x5c;
    byte unk0x5d;
    ushort unk0x5e;
    short x;
    short y;
    ushort unk0x64;
    ushort HMax;
    ushort unk0x68;
    ushort VMax;
    struct Borg_8_header * borg_8;
    byte byte0x70;
    u8 unk0x71;
    ushort imgWidth;
    ushort imgHeight;
    ushort unk0x76;
    struct WidgetMethods * methods;
};

struct ItemID { /* Data category byteswapped */
    enum DBTypeEnum type;
    byte ID;
};

struct struct_3 {
    byte unk0x0;
    u8 unk0x1;
    u8 unk0x2;
    u8 unk0x3;
    struct ItemID ent_ID;
    u8 unk0x6;
    u8 unk0x7;
    char * unk0x8;
};

struct borg_13_command {
    ushort val;
    enum borg13_commands com;
    u8 unk0x3[29];
    short text_marker;
    u8 unk0x22[2];
    ushort a;
    ushort b;
    byte index;
    byte c;
    u8 unk0x2a[7];
    byte bitmask;
    u8 unk0x32[6];
};

struct Method { /* Methods seem to have 4-byte padding, for some reason */
    u16 arg[2];
    ulong (* func)(void);
};

struct Borg_8_dat {
    enum image_format format;
    short height;
    short width;
    short PAL size;
    uint flags;
    int offset;
};

struct Borg_8_header {
    struct borgHeader index;
    struct Borg_8_dat dat;
};

struct borg_13_data {
    struct borg_13_command * commands_pointer;
    ushort[4] * actors;
    char * text;
    ushort ID;
    enum EventFlag flag;
    byte A;
    byte B;
    byte text_lines;
    byte ActorCount;
    byte start_func;
    byte C;
    byte pad[2];
};

struct WidgetMethods {
    u32 blank[2];
    struct Method freeWidget;
    struct Method getNumber;
    struct Method getHeight;
    struct Method GetWidth;
    struct Method handleSubstruct;
    struct Method link;
    struct Method unlink;
    struct Method unk_func_8;
    struct Method SetColor;
    struct Method Controlfunc;
    struct Method UpFunc;
    struct Method DownFunc;
    struct Method LeftFunc;
    struct Method RightFunc;
    struct Method AFunc;
    struct Method Bfunc;
    struct Method ZFunc;
    struct Method LFunc;
    struct Method RFunc;
    struct Method StartFunc;
    struct Method CUPFunc;
    struct Method CDownFunc;
    struct Method CLeftFunc;
    struct Method CRightFunc;
    struct Method unk0xc8;
};

struct dialougmode_substruct {
    struct struct_3 unkstruct[8];
    u8 unk0x60;
    u8 unk0x61;
    u8 unk0x62;
    u8 unk0x63;
    u8 unk0x64;
    u8 unk0x65;
    u8 unk0x66;
    u8 unk0x67;
    u8 unk0x68;
    u8 unk0x69;
    u8 unk0x6a;
    u8 unk0x6b;
    u8 unk0x6c;
    u8 unk0x6d;
    u8 unk0x6e;
    u8 unk0x6f;
    undefined4 actors;
    undefined2 unk0x74;
    u8 unk0x76;
    u8 unk0x77;
    u8 unk0x78;
    u8 unk0x79;
    u8 unk0x7a;
    u8 unk0x7b;
    u8 unk0x7c;
    u8 unk0x7d;
    u8 unk0x7e;
    u8 unk0x7f;
    u8 unk0x80;
    u8 unk0x81;
    u8 unk0x82;
    u8 unk0x83;
    u8 unk0x84;
    u8 unk0x85;
    u8 unk0x86;
    u8 unk0x87;
    u8 unk0x88;
    u8 unk0x89;
    u8 unk0x8a;
    u8 unk0x8b;
    u8 unk0x8c;
    u8 unk0x8d;
    u8 unk0x8e;
    u8 unk0x8f;
    u8 unk0x90;
    u8 unk0x91;
    u8 unk0x92;
    u8 unk0x93;
    u8 unk0x94;
    u8 unk0x95;
    u8 unk0x96;
    u8 unk0x97;
    u8 unk0x98;
    u8 unk0x99;
    u8 unk0x9a;
    u8 unk0x9b;
    u8 unk0x9c;
    u8 unk0x9d;
    u8 unk0x9e;
    u8 unk0x9f;
    u8 unk0xa0;
    u8 unk0xa1;
    u8 unk0xa2;
    u8 unk0xa3;
    u8 unk0xa4;
    u8 unk0xa5;
    u8 unk0xa6;
    u8 unk0xa7;
    u8 unk0xa8;
    u8 unk0xa9;
    u8 unk0xaa;
    u8 unk0xab;
    u8 unk0xac;
    u8 unk0xad;
    u8 unk0xae;
    u8 unk0xaf;
    u8 unk0xb0;
    u8 unk0xb1;
    u8 unk0xb2;
    u8 unk0xb3;
    u8 unk0xb4;
    u8 unk0xb5;
    u8 unk0xb6;
    u8 unk0xb7;
    u8 unk0xb8;
    u8 unk0xb9;
    u8 unk0xba;
    u8 unk0xbb;
    u8 unk0xbc;
    u8 unk0xbd;
    u8 unk0xbe;
    u8 unk0xbf;
    u8 unk0xc0;
    u8 unk0xc1;
    u8 unk0xc2;
    u8 unk0xc3;
    u8 unk0xc4;
    u8 unk0xc5;
    u8 unk0xc6;
    u8 unk0xc7;
    u8 unk0xc8;
    u8 unk0xc9;
    u8 unk0xca;
    u8 unk0xcb;
    u8 unk0xcc;
    u8 unk0xcd;
    u8 unk0xce;
    u8 unk0xcf;
    u8 unk0xd0;
    u8 unk0xd1;
    u8 unk0xd2;
    u8 unk0xd3;
    u8 unk0xd4;
    u8 unk0xd5;
    u8 unk0xd6;
    u8 unk0xd7;
    u8 unk0xd8;
    u8 unk0xd9;
    u8 unk0xda;
    u8 unk0xdb;
    u8 unk0xdc;
    u8 unk0xdd;
    u8 unk0xde;
    u8 unk0xdf;
    u8 unk0xe0;
    u8 unk0xe1;
    u8 unk0xe2;
    u8 unk0xe3;
    u8 unk0xe4;
    u8 unk0xe5;
    u8 unk0xe6;
    u8 unk0xe7;
    u8 unk0xe8;
    u8 unk0xe9;
    u8 unk0xea;
    u8 unk0xeb;
    u8 unk0xec;
    u8 unk0xed;
    u8 unk0xee;
    u8 unk0xef;
    ushort encounterEnemies[12];
    undefined2 unk0x108;
    undefined2 unk0x10a;
    ushort unk0x10c;
    ushort unk0x10e;
    char unk0x110;
    byte unk0x111;
    byte unk0x112;
    byte unk0x113;
    byte battlefeild;
    byte unk0x115;
    byte unk0x116;
    u8 unk0x117;
};

struct astruct_12 {
    u8 unk0x0;
    u8 unk0x1;
    u8 unk0x2;
    u8 unk0x3;
    struct widgetStruct * unk0x4;
    struct dialougmode_substruct * dialouge_substruct;
    undefined4 unk0xc;
    pointer unk0x10;
    struct borg_13_data * borg_13_dat;
    u8 unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
    undefined4 unk0x1c;
    undefined4 unk0x20;
    byte unk0x24;
    u8 unk0x25;
    u8 unk0x26;
    u8 unk0x27;
};

typedef struct astruct_13 astruct_13, *Pastruct_13;

struct astruct_13 {
    short unk0x0;
    short unk0x2;
    short unk0x4;
    undefined2 unk0x6;
    undefined2 unk0x8;
    undefined2 unk0xa;
    u8 unk0xc;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
};

typedef struct astruct_3 astruct_3, *Pastruct_3;

typedef float vec3[3];

struct astruct_3 {
    vec3 v3;
    short unk0xc;
    undefined2 unk0xe;
};

typedef struct astruct_4 astruct_4, *Pastruct_4;

struct astruct_4 {
    u8 unk0x0;
    u8 unk0x1;
    u8 unk0x2;
    u8 unk0x3;
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    u8 unk0x8;
    u8 unk0x9;
    u8 unk0xa;
    u8 unk0xb;
    u8 unk0xc;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
    u8 unk0x10;
    u8 unk0x11;
    u8 unk0x12;
    u8 unk0x13;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    u8 unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
    u8 unk0x1c;
    u8 unk0x1d;
    u8 unk0x1e;
    u8 unk0x1f;
    u8 unk0x20;
    u8 unk0x21;
    u8 unk0x22;
    u8 unk0x23;
    u8 unk0x24;
    u8 unk0x25;
    u8 unk0x26;
    u8 unk0x27;
    u8 unk0x28;
    u8 unk0x29;
    u8 unk0x2a;
    u8 unk0x2b;
    u8 unk0x2c;
    u8 unk0x2d;
    u8 unk0x2e;
    u8 unk0x2f;
    u8 unk0x30;
    u8 unk0x31;
    u8 unk0x32;
    u8 unk0x33;
    u8 unk0x34;
    u8 unk0x35;
    u8 unk0x36;
    u8 unk0x37;
    u8 unk0x38;
    u8 unk0x39;
    u8 unk0x3a;
    u8 unk0x3b;
    u8 unk0x3c;
    u8 unk0x3d;
    u8 unk0x3e;
    u8 unk0x3f;
    ushort unk0x40;
    ushort unk0x42;
};

typedef struct astruct_6 astruct_6, *Pastruct_6;

typedef struct playerData playerData, *PplayerData;

typedef struct Borg_7_header Borg_7_header, *PBorg_7_header;

typedef enum Borg7Enum { /* entity model data? */
    Alaron=9721,
    Arturo=9789,
    Baird=9851,
    Bandit=9900,
    Becan=10011,
    Blank=0,
    Candlestick=6234,
    ChaosSorceror=11958,
    ChaosTrooper=11906,
    Chaosslayer=12001,
    Donovan=10388,
    Gryphon=12436,
    Guard=10840,
    Jundarguard=10963,
    Keelin=11049,
    Kitarak=12576,
    Maninblueshirt=10160,
    Manintanshirt=10180,
    Ogre=12877,
    Rheda=11263,
    Shadow=11287,
    Ship=3523,
    Wraith=13364,
    Yeraza=11469,
    abrecan=9672,
    balloflight=7620,
    cauldron=3500,
    chaosscout=11830,
    chicken=12018,
    cyclops=12062,
    dryad=10460,
    giantbat=11594,
    goblin=12313,
    godric=10783,
    gratedsinkinggate=3289,
    horse=12616,
    jundarman=10988,
    jundarwoman=10937,
    king=10520,
    lich=13275,
    magicwaveeffect=7613,
    maninrockingchair=11073,
    oldbeardedman=10289,
    phelan=10248,
    pocho=12976,
    rocky magic pylon=3436,
    salamander=13048,
    sand worm=13076,
    scorpion=13127,
    sholeh=11370,
    skeleton=13162,
    whirling effect=7677,
    wind elemental=12134,
    wolf=13314,
    woman in blue dress=10140,
    woman in olive dress=10119,
    woman in red dress=10098,
    wyvern=13411,
    zombie=13449
} Borg7Enum;

typedef float Vec2[2];

typedef struct collisionStruct collisionStruct, *PcollisionStruct;

typedef struct vec7 vec7, *Pvec7;

typedef struct collisionTypeA collisionTypeA, *PcollisionTypeA;

typedef struct Button_hold Button_hold, *PButton_hold;

typedef enum BUTTON_aidyn { /* extension of Button definitions to include Analog */
    ANA_DOWN=262144,
    ANA_LEFT=65536,
    ANA_RIGHT=131072,
    ANA_UP=524288,
    A_BUTTON=32768,
    B_BUTTON=16384,
    C_DOWN=4,
    C_LEFT=2,
    C_RIGHT=1,
    C_UP=8,
    D_DOWN=1024,
    D_LEFT=512,
    D_RIGHT=256,
    D_UP=2048,
    L_BUTTON=32,
    R_BUTTON=16,
    START_BUTTON=4096,
    Z_BUTTON=8192
} BUTTON_aidyn;

typedef int s32;

typedef struct AnimationData AnimationData, *PAnimationData;

typedef struct borg_6_header borg_6_header, *Pborg_6_header;

typedef enum borg6Enum {
    Flycam_1=8668,
    Fycam_2=8670,
    flycam_3=8674,
    flycam_4=8676,
    flycam_5=8678,
    flycam_6=8680,
    intro_1=8729,
    intro_10=9043,
    intro_11=9052,
    intro_12=9105,
    intro_13=9147,
    intro_2=8812,
    intro_3=8850,
    intro_4=8857,
    intro_5=8864,
    intro_6=8918,
    intro_7=8941,
    intro_8=8955,
    intro_9=8988
} borg6Enum;

typedef struct controller_aidyn controller_aidyn, *Pcontroller_aidyn;

typedef struct Borg_5_header Borg_5_header, *PBorg_5_header;

typedef float vec4[4];

typedef struct ParticleHeadStruct ParticleHeadStruct, *PParticleHeadStruct;

typedef struct Borg_3 Borg_3, *PBorg_3;

typedef struct particleStruct particleStruct, *PparticleStruct;

typedef struct someParticleStruct someParticleStruct, *PsomeParticleStruct;

typedef struct Borg_9_data Borg_9_data, *PBorg_9_data;

typedef struct borg9_phys borg9_phys, *Pborg9_phys;

typedef union Voxel_u Voxel_u, *PVoxel_u;

typedef struct borg_9_struct borg_9_struct, *Pborg_9_struct;

typedef struct voxelHeader voxelHeader, *PvoxelHeader;

typedef struct ref_obj ref_obj, *Pref_obj;

typedef struct Audio_obj Audio_obj, *PAudio_obj;

typedef struct monsterparty_obj monsterparty_obj, *Pmonsterparty_obj;

typedef struct Scene_obj Scene_obj, *PScene_obj;

typedef struct light_obj light_obj, *Plight_obj;

typedef struct referncepoint_obj referncepoint_obj, *Preferncepoint_obj;

typedef struct teleport_obj teleport_obj, *Pteleport_obj;

typedef struct container_obj container_obj, *Pcontainer_obj;

typedef struct Dialoug_obj Dialoug_obj, *PDialoug_obj;

typedef struct trigger_obj trigger_obj, *Ptrigger_obj;

typedef struct camera_obj camera_obj, *Pcamera_obj;

typedef enum ref_obj_bitfeild {
    EXPPak=32,
    Used=512,
    no_expPak=64,
    tangible=8192,
    visible=32768
} ref_obj_bitfeild;

typedef enum Vobject {
    Audio=3,
    Camera=8,
    Code=12,
    Container=1,
    Dialouge=9,
    Light=2,
    MonsterParty=5,
    ReferencePoint=6,
    SavePoint=11,
    Scene=0,
    Teleporter=7,
    Trigger=10,
    WanderNode=4
} Vobject;

typedef struct audio_obj_dat audio_obj_dat, *Paudio_obj_dat;

typedef struct monsterparty_dat monsterparty_dat, *Pmonsterparty_dat;

typedef struct Scene_obj_dat Scene_obj_dat, *PScene_obj_dat;

typedef struct light_obj_dat light_obj_dat, *Plight_obj_dat;

typedef struct teleport_dat teleport_dat, *Pteleport_dat;

typedef struct container_Dat container_Dat, *Pcontainer_Dat;

typedef struct dialoug_dat dialoug_dat, *Pdialoug_dat;

typedef struct Trigger_dat Trigger_dat, *PTrigger_dat;

typedef enum Borg12Enum { /* Music/SFX */
    BORG12_CheatCorrect=1816,
    BORG12_CheatFail=1825,
    BORG12_CheatUnused=1824,
    BORG12_Intro_Exp=1586,
    BORG12_Intro_NoExp=1497,
    BORG12_chimeScale=1511,
    Bag Open?=1828,
    Chest Open=1833,
    Coins_jingle=1837,
    Creak open=1836,
    CursorChirp=1853,
    Explosion Bang=1831,
    Fire Crackle=1819,
    Heavy Whack=1871,
    Light Whack=1832,
    Medium Whack=1829,
    Menu_Scroll=1870,
    Menu_open=1869,
    Metal Klink=1792,
    Metal Knink 2=1793,
    Metal klink=1791,
    Tacet=0,
    Underwater_noise=1820,
    Waterfall=1817,
    coinJingle=1838,
    coughing=1865,
    cursor tick=1851,
    door Open?=1835,
    menu select=1857,
    rolling thunder=1822,
    thunderstorm=1823
} Borg12Enum;

typedef struct monsterpartyEntry monsterpartyEntry, *PmonsterpartyEntry;

typedef enum borg13Enum {
    BORG13_HelpMenu=1355,
    PassTheMarshmallows=6235,
    alarondies=1298,
    alarondies2=1299,
    alarondies3=1300,
    goblinambush=869,
    kingdies=1278
} borg13Enum;

typedef enum EnumMapDatA {
    Barrows=9,
    Battle=16,
    EhudUnder=12,
    GwenCastle=4,
    Interior=6,
    Overworld=0,
    Talewok=11,
    Ugairt=13,
    cave=7
} EnumMapDatA;

struct audio_obj_dat {
    enum Borg12Enum borg12Index;
    undefined4 unk0x4;
    float volume;
    ushort unk0xc;
    u8 unk0xe;
    u8 unk0xf;
    u8 unk0x10;
    u8 unk0x11;
    u8 unk0x12;
    u8 unk0x13;
    ushort soundType; /* bitfield 0x10 =bgm */
    ushort unk0x16;
    float volume_;
    undefined4 sfx_arg3;
    u32 unk0x20;
    u16 unk0x24;
    byte dcmIndex;
    u8 unk0x27;
    u8 unk0x28;
    u8 unk0x29;
    u8 unk0x2a;
    u8 unk0x2b;
    u8 unk0x2c;
    u8 unk0x2d;
    u8 unk0x2e;
    u8 unk0x2f;
    u8 unk0x30;
    u8 unk0x31;
    u8 unk0x32;
    u8 unk0x33;
    u8 unk0x34;
    u8 unk0x35;
    u8 unk0x36;
    u8 unk0x37;
    u8 unk0x38;
    u8 unk0x39;
    u8 unk0x3a;
    u8 unk0x3b;
    u8 unk0x3c;
    u8 unk0x3d;
    u8 unk0x3e;
    u8 unk0x3f;
    u8 unk0x40;
    u8 unk0x41;
    u8 unk0x42;
    u8 unk0x43;
};

struct voxelHeader { /* Header for Refernce objects (Voxels) */
    vec3 coords; /* Where is it */
    float size; /* how big is it */
    uint timestamp; /* when was it called */
    enum ref_obj_bitfeild Bitfeild; /* Flags for rendering */
    enum Vobject type; /* object type */
    short LinkID[2]; /* usually 0xFFFFFFFF (none) */
    undefined2 flagA; /* event flags */
    enum EventFlag flagB;
    enum EventFlag flagC;
    u8 unk0x22;
    u8 unk0x23;
    void * ptr0x24;
};

struct Audio_obj {
    struct voxelHeader header;
    struct audio_obj_dat dat;
};

struct monsterpartyEntry {
    struct ItemID enemyID;
    byte enemyAmmount;
    byte byte4;
};

struct monsterparty_dat {
    struct monsterpartyEntry enemyEntries[7];
    u8 unk0x1c;
    u8 unk0x1d;
    u8 unk0x1e;
    u8 unk0x1f;
    struct ItemID entityID;
    struct ItemID globalLoot;
    ushort unk0x24;
    u8 unk0x26;
    u8 unk0x27;
    ushort unk0x28;
    ushort totalsize;
    struct ItemID unk0x2c;
    undefined2 wanderNode;
    ushort flags;
    u8 unk0x32;
    u8 unk0x33;
    enum borg13Enum borg_13;
    u8 unk0x38;
    u8 unk0x39;
    u8 unk0x3a;
    u8 unk0x3b;
    u8 unk0x3c;
    u8 unk0x3d;
    u8 unk0x3e;
    u8 unk0x3f;
    u8 unk0x40;
    u8 unk0x41;
    u8 unk0x42;
    u8 unk0x43;
};

struct collisionStruct {
    float radius;
    vec3 position;
    vec3 velocity;
    ushort flags;
    short unk0x1e;
    vec3 vec3_0x20;
    vec3 vec3_0x2c;
    struct vec7 * env_props;
};

struct referncepoint_obj {
    struct voxelHeader header;
    short refPoint_ID;
    u8 unk0x2a;
    u8 unk0x2b;
    char name[16];
    vec3 position;
    u8 unk0x48;
    u8 unk0x49;
    u8 unk0x4a;
    u8 unk0x4b;
    u8 unk0x4c;
    u8 unk0x4d;
    u8 unk0x4e;
    u8 unk0x4f;
    u8 unk0x50;
    u8 unk0x51;
    u8 unk0x52;
    u8 unk0x53;
    u8 unk0x54;
    u8 unk0x55;
    u8 unk0x56;
    u8 unk0x57;
    u8 unk0x58;
    u8 unk0x59;
    u8 unk0x5a;
    u8 unk0x5b;
    u8 unk0x5c;
    u8 unk0x5d;
    u8 unk0x5e;
    u8 unk0x5f;
    u8 unk0x60;
    u8 unk0x61;
    u8 unk0x62;
    u8 unk0x63;
    u8 unk0x64;
    u8 unk0x65;
    u8 unk0x66;
    u8 unk0x67;
    u8 unk0x68;
    u8 unk0x69;
    u8 unk0x6a;
    u8 unk0x6b;
};

struct light_obj_dat {
    struct color color[3];
    ushort lightType; /* 0-3 are valid types */
    u8 unk0xe;
    u8 unk0xf;
    float f0;
    float f1;
    float f2;
    u8 unk0x1c;
    u8 unk0x1d;
    u8 unk0x1e;
    u8 unk0x1f;
    u8 unk0x20;
    u8 unk0x21;
    u8 unk0x22;
    u8 unk0x23;
    u8 unk0x24;
    u8 unk0x25;
    u8 unk0x26;
    u8 unk0x27;
    u8 unk0x28;
    u8 unk0x29;
    u8 unk0x2a;
    u8 unk0x2b;
    u8 unk0x2c;
    u8 unk0x2d;
    u8 unk0x2e;
    u8 unk0x2f;
    u8 unk0x30;
    u8 unk0x31;
    u8 unk0x32;
    u8 unk0x33;
    u8 unk0x34;
    u8 unk0x35;
    u8 unk0x36;
    u8 unk0x37;
    u8 unk0x38;
    u8 unk0x39;
    u8 unk0x3a;
    u8 unk0x3b;
    u8 unk0x3c;
    u8 unk0x3d;
    u8 unk0x3e;
    u8 unk0x3f;
    u8 unk0x40;
    u8 unk0x41;
    u8 unk0x42;
    u8 unk0x43;
};

struct AnimationData {
    struct Borg_5_header * borg5;
    struct borg_6_header * borg6;
    struct AnimationData * link;
    u8 unk0xc;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
    u8 unk0x10;
    u8 unk0x11;
    u8 unk0x12;
    u8 unk0x13;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    u8 unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
    undefined4 unk0x1c;
    u8 unk0x20;
    u8 unk0x21;
    u8 unk0x22;
    u8 unk0x23;
    u8 unk0x24;
    u8 unk0x25;
    u8 unk0x26;
    u8 unk0x27;
    u8 unk0x28;
    u8 unk0x29;
    u8 unk0x2a;
    u8 unk0x2b;
    u8 unk0x2c;
    u8 unk0x2d;
    u8 unk0x2e;
    u8 unk0x2f;
    u8 unk0x30;
    u8 unk0x31;
    u8 unk0x32;
    u8 unk0x33;
    u8 unk0x34;
    u8 unk0x35;
    u8 unk0x36;
    u8 unk0x37;
    u8 unk0x38;
    u8 unk0x39;
    u8 unk0x3a;
    u8 unk0x3b;
    u8 unk0x3c;
    u8 unk0x3d;
    u8 unk0x3e;
    u8 unk0x3f;
    u8 unk0x40;
    u8 unk0x41;
    u8 unk0x42;
    u8 unk0x43;
    u8 unk0x44;
    u8 unk0x45;
    u8 unk0x46;
    u8 unk0x47;
    u8 unk0x48;
    u8 unk0x49;
    u8 unk0x4a;
    u8 unk0x4b;
    u8 unk0x4c;
    u8 unk0x4d;
    u8 unk0x4e;
    u8 unk0x4f;
    u8 unk0x50;
    u8 unk0x51;
    u8 unk0x52;
    u8 unk0x53;
    u8 unk0x54;
    u8 unk0x55;
    u8 unk0x56;
    u8 unk0x57;
    u8 unk0x58;
    u8 unk0x59;
    u8 unk0x5a;
    u8 unk0x5b;
    u8 unk0x5c;
    u8 unk0x5d;
    u8 unk0x5e;
    u8 unk0x5f;
    u8 unk0x60;
    u8 unk0x61;
    u8 unk0x62;
    u8 unk0x63;
    u8 unk0x64;
    u8 unk0x65;
    u8 unk0x66;
    u8 unk0x67;
    u8 unk0x68;
    u8 unk0x69;
    u8 unk0x6a;
    u8 unk0x6b;
    u8 unk0x6c;
    u8 unk0x6d;
    u8 unk0x6e;
    u8 unk0x6f;
    u8 unk0x70;
    u8 unk0x71;
    u8 unk0x72;
    u8 unk0x73;
    u8 unk0x74;
    u8 unk0x75;
    u8 unk0x76;
    u8 unk0x77;
    u8 unk0x78;
    u8 unk0x79;
    u8 unk0x7a;
    u8 unk0x7b;
    u8 unk0x7c;
    u8 unk0x7d;
    u8 unk0x7e;
    u8 unk0x7f;
    u8 unk0x80;
    u8 unk0x81;
    u8 unk0x82;
    u8 unk0x83;
    u8 unk0x84;
    u8 unk0x85;
    u8 unk0x86;
    u8 unk0x87;
    float matrixA[4][4];
    float matrixB[4][4];
    float matrixC[4][4];
    u8 unk0x148;
    u8 unk0x149;
    u8 unk0x14a;
    u8 unk0x14b;
    u8 unk0x14c;
    u8 unk0x14d;
    u8 unk0x14e;
    u8 unk0x14f;
    u8 unk0x150;
    u8 unk0x151;
    u8 unk0x152;
    u8 unk0x153;
    u8 unk0x154;
    u8 unk0x155;
    u8 unk0x156;
    u8 unk0x157;
    u8 unk0x158;
    u8 unk0x159;
    u8 unk0x15a;
    u8 unk0x15b;
    u8 unk0x15c;
    u8 unk0x15d;
    u8 unk0x15e;
    u8 unk0x15f;
    u8 unk0x160;
    u8 unk0x161;
    u8 unk0x162;
    u8 unk0x163;
    u8 unk0x164;
    u8 unk0x165;
    u8 unk0x166;
    u8 unk0x167;
    u8 unk0x168;
    u8 unk0x169;
    u8 unk0x16a;
    u8 unk0x16b;
    u8 unk0x16c;
    u8 unk0x16d;
    u8 unk0x16e;
    u8 unk0x16f;
    u8 unk0x170;
    u8 unk0x171;
    u8 unk0x172;
    u8 unk0x173;
    u8 unk0x174;
    u8 unk0x175;
    u8 unk0x176;
    u8 unk0x177;
    u8 unk0x178;
    u8 unk0x179;
    u8 unk0x17a;
    u8 unk0x17b;
    u8 unk0x17c;
    u8 unk0x17d;
    u8 unk0x17e;
    u8 unk0x17f;
    u8 unk0x180;
    u8 unk0x181;
    u8 unk0x182;
    u8 unk0x183;
    u8 unk0x184;
    u8 unk0x185;
    u8 unk0x186;
    u8 unk0x187;
    u8 unk0x188;
    u8 unk0x189;
    u8 unk0x18a;
    u8 unk0x18b;
    u8 unk0x18c;
    u8 unk0x18d;
    u8 unk0x18e;
    u8 unk0x18f;
    u8 unk0x190;
    u8 unk0x191;
    u8 unk0x192;
    u8 unk0x193;
    u8 unk0x194;
    u8 unk0x195;
    u8 unk0x196;
    u8 unk0x197;
    u8 unk0x198;
    u8 unk0x199;
    u8 unk0x19a;
    u8 unk0x19b;
    u8 unk0x19c;
    u8 unk0x19d;
    u8 unk0x19e;
    u8 unk0x19f;
    u8 unk0x1a0;
    u8 unk0x1a1;
    u8 unk0x1a2;
    u8 unk0x1a3;
    u8 unk0x1a4;
    u8 unk0x1a5;
    u8 unk0x1a6;
    u8 unk0x1a7;
    u8 unk0x1a8;
    u8 unk0x1a9;
    u8 unk0x1aa;
    u8 unk0x1ab;
    u8 unk0x1ac;
    u8 unk0x1ad;
    u8 unk0x1ae;
    u8 unk0x1af;
    u8 unk0x1b0;
    u8 unk0x1b1;
    u8 unk0x1b2;
    u8 unk0x1b3;
    u8 unk0x1b4;
    u8 unk0x1b5;
    u8 unk0x1b6;
    u8 unk0x1b7;
    u8 unk0x1b8;
    u8 unk0x1b9;
    u8 unk0x1ba;
    u8 unk0x1bb;
    u8 unk0x1bc;
    u8 unk0x1bd;
    u8 unk0x1be;
    u8 unk0x1bf;
    u8 unk0x1c0;
    u8 unk0x1c1;
    u8 unk0x1c2;
    u8 unk0x1c3;
    u8 unk0x1c4;
    u8 unk0x1c5;
    u8 unk0x1c6;
    u8 unk0x1c7;
    vec3 unk0x1c8;
    int locators[8];
    uint flags;
    undefined2 unk0x1f8;
    byte aniSpeed;
    byte unk0x1fb;
    vec4 colorFloats;
    int colorValA;
    int colorValB;
    struct color colorByte;
    byte unk0x218[7][16];
    struct color lightColors[4];
    uint maxDynamicLights; /* no more than 7 */
    uint unk0x29c;
    struct ParticleHeadStruct * unk0x2a0;
    undefined4 unk0x2a4;
    undefined4 unk0x2a8;
    byte unk0x2ac;
    char borg5_char[4];
    u8 unk0x2b1;
    u8 unk0x2b2;
    u8 unk0x2b3;
    u8 unk0x2b4;
    u8 unk0x2b5;
    u8 unk0x2b6;
    u8 unk0x2b7;
};

struct teleport_dat {
    enum EnumMapDatA MapDatA;
    ushort MapShort1;
    ushort MapShort2;
    ushort unk0x6;
    short trap_value;
    ushort trapBool16;
    ushort lock_lv;
    ushort refPoint_ID;
    undefined2 lock_flag;
    enum EventFlag lockpick_flag_2;
    undefined2 trap_flag;
    enum EventFlag flag_0x3e;
    enum EventFlag secrect_door_flag;
    ushort secretDoorVal;
    char name[16];
    u8 unk0x54[24];
};

struct teleport_obj {
    struct voxelHeader header;
    struct teleport_dat dat;
};

struct controller_aidyn { /* Controller input used by game */
    float joy_x;
    float joy_y;
    enum BUTTON_aidyn input;
    enum BUTTON_aidyn input_2;
};

struct Button_hold {
    struct controller_aidyn contAidyn;
    short DUp_hold;
    short DDown_hold;
    short DLeft_Hold;
    short DRight_hold;
    short Up_Hold;
    short Down_Hold;
    short Left_hold;
    short Right_Hold;
    short CUp_hold;
    short CDown_hold;
    short CLeft_hold;
    short CRight_Hold;
    short Start_Hold;
    short A_Hold;
    short B_Hold;
    short Z_Hold;
    ushort L_Hold;
    ushort R_Hold;
};

struct camera_obj {
    struct voxelHeader header;
    short refpoint_ID;
    ushort movementType;
    uint timestamp;
    vec3 vec3_A;
    vec3 vec3_b;
    vec3 vec3_C;
    float unk0x54;
    u8 unk0x58;
    u8 unk0x59;
    u8 unk0x5a;
    u8 unk0x5b;
    u8 unk0x5c;
    u8 unk0x5d;
    u8 unk0x5e;
    u8 unk0x5f;
    u8 unk0x60;
    u8 unk0x61;
    u8 unk0x62;
    u8 unk0x63;
    u8 unk0x64;
    u8 unk0x65;
    u8 unk0x66;
    u8 unk0x67;
    u8 unk0x68;
    u8 unk0x69;
    u8 unk0x6a;
    u8 unk0x6b;
};

struct Borg_5_header {
    u8 unk0x0;
    u8 unk0x1;
    u8 unk0x2;
    u8 unk0x3;
    undefined4 unk0x4;
    u8 unk0x8;
    u8 unk0x9;
    u8 unk0xa;
    u8 unk0xb;
    pointer unk0xc;
    int unk0x10;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    Vec2 unk0x18;
    int ani_texture_count;
    u8 unk0x24;
    u8 unk0x25;
    u8 unk0x26;
    u8 unk0x27;
    byte[64] * unk0x28;
    u8 unk0x2c;
    u8 unk0x2d;
    u8 unk0x2e;
    u8 unk0x2f;
    u8 * unk0x30;
    struct Borg_3 * borg3;
    u8 * unk0x38;
    u8 * locatorDat;
    u8 * unk0x40;
    u8 * unk0x44;
    u8 * unk0x48;
    u8 * unk0x4c;
};

struct collisionTypeA {
    float unk0x0;
    float unk0x4;
    float unk0x8;
    float unk0xc;
    float unk0x10;
    undefined2 unk0x14;
    u8 unk0x16;
    u8 unk0x17;
    float unk0x18;
    float unk0x1c;
    float unk0x20;
    float unk0x24;
};

struct vec7 {
    vec3 unk0x0;
    vec3 unk0xc;
    float unk0x18;
};

struct playerData {
    undefined2 ID;
    short removeFlag;
    struct Borg_7_header * locator_pointer;
    u8 unk0x8;
    u8 unk0x9;
    u8 unk0xa;
    u8 unk0xb;
    enum Borg7Enum borg7;
    int unk0x10;
    short ani_type;
    short previous_ani_type[4];
    short flags;
    Vec2 facing;
    Vec2 facingMirror;
    float scale_floatA;
    float scale_floatB;
    float unk0x38;
    vec3 vec3_0x3c;
    vec3 vec3_0x48;
    undefined4 unk0x54;
    float unk0x58;
    undefined4 unk0x5c;
    undefined2 unk0x60;
    u8 unk0x62;
    u8 unk0x63;
    struct collisionStruct collision;
    struct playerData * link;
    vec3 positionMirror;
    struct vec7 * vec7_pointer;
    struct collisionTypeA * unk0xb4;
    u8 unk0xb8;
    u8 unk0xb9;
    u8 unk0xba;
    u8 unk0xbb;
    struct collisionTypeA unk0xbc;
    struct vec7 vec7_;
    ushort Ground_type;
    ushort unk0x102;
    short unk0x104;
    u8 unk0x106;
    u8 unk0x107;
    float unk0x108;
    float voxelReach; /* 100f default */
    vec3 voxelCoords;
    struct Button_hold controller;
    enum BUTTON_aidyn buttonMask;
    struct astruct_3 unk0x154[16];
    short unk0x254;
    ushort index_0x256;
    float unk0x258;
    short unk0x25c;
    u8 unk0x25e;
    u8 unk0x25f;
    Vec2 XZ_vec2;
    float wanderRadius;
    Vec2 unk0x26c;
    vec3 combat_vec3;
    float combat_move_radius;
    u8 unk0x284;
    u8 unk0x285;
    u8 unk0x286;
    u8 unk0x287;
    undefined4 unk0x288;
    u8 unk0x28c;
    u8 unk0x28d;
    u8 unk0x28e;
    u8 unk0x28f;
    u8 unk0x290;
    u8 unk0x291;
    u8 unk0x292;
    u8 unk0x293;
    u8 unk0x294;
    u8 unk0x295;
    u8 unk0x296;
    u8 unk0x297;
    u8 unk0x298;
    u8 unk0x299;
    u8 unk0x29a;
    u8 unk0x29b;
    u8 unk0x29c;
    u8 unk0x29d;
    u8 unk0x29e;
    u8 unk0x29f;
    u8 unk0x2a0;
    u8 unk0x2a1;
    u8 unk0x2a2;
    u8 unk0x2a3;
    u8 unk0x2a4;
    u8 unk0x2a5;
    u8 unk0x2a6;
    u8 unk0x2a7;
    u8 unk0x2a8;
    u8 unk0x2a9;
    u8 unk0x2aa;
    u8 unk0x2ab;
    u8 unk0x2ac;
    u8 unk0x2ad;
    u8 unk0x2ae;
    u8 unk0x2af;
    u8 unk0x2b0;
    u8 unk0x2b1;
    u8 unk0x2b2;
    u8 unk0x2b3;
    u8 unk0x2b4;
    u8 unk0x2b5;
    u8 unk0x2b6;
    u8 unk0x2b7;
    u8 unk0x2b8;
    u8 unk0x2b9;
    u8 unk0x2ba;
    u8 unk0x2bb;
    u8 unk0x2bc;
    u8 unk0x2bd;
    u8 unk0x2be;
    u8 unk0x2bf;
    u8 unk0x2c0;
    u8 unk0x2c1;
    u8 unk0x2c2;
    u8 unk0x2c3;
    u8 unk0x2c4;
    u8 unk0x2c5;
    u8 unk0x2c6;
    u8 unk0x2c7;
    u8 unk0x2c8;
    u8 unk0x2c9;
    u8 unk0x2ca;
    u8 unk0x2cb;
    u8 unk0x2cc;
    u8 unk0x2cd;
    u8 unk0x2ce;
    u8 unk0x2cf;
    u8 unk0x2d0;
    u8 unk0x2d1;
    u8 unk0x2d2;
    u8 unk0x2d3;
    u8 unk0x2d4;
    u8 unk0x2d5;
    u8 unk0x2d6;
    u8 unk0x2d7;
    u8 unk0x2d8;
    u8 unk0x2d9;
    u8 unk0x2da;
    u8 unk0x2db;
    u8 unk0x2dc;
    u8 unk0x2dd;
    u8 unk0x2de;
    u8 unk0x2df;
    u8 unk0x2e0;
    u8 unk0x2e1;
    u8 unk0x2e2;
    u8 unk0x2e3;
    u8 unk0x2e4;
    u8 unk0x2e5;
    u8 unk0x2e6;
    u8 unk0x2e7;
    u8 unk0x2e8;
    u8 unk0x2e9;
    u8 unk0x2ea;
    u8 unk0x2eb;
    u8 unk0x2ec;
    u8 unk0x2ed;
    u8 unk0x2ee;
    u8 unk0x2ef;
    u8 unk0x2f0;
    u8 unk0x2f1;
    u8 unk0x2f2;
    u8 unk0x2f3;
    u8 unk0x2f4;
    u8 unk0x2f5;
    u8 unk0x2f6;
    u8 unk0x2f7;
    u8 unk0x2f8;
    u8 unk0x2f9;
    u8 unk0x2fa;
    u8 unk0x2fb;
    u8 unk0x2fc;
    u8 unk0x2fd;
    u8 unk0x2fe;
    u8 unk0x2ff;
    u8 unk0x300;
    u8 unk0x301;
    u8 unk0x302;
    u8 unk0x303;
    u8 unk0x304;
    u8 unk0x305;
    u8 unk0x306;
    u8 unk0x307;
    u8 unk0x308;
    u8 unk0x309;
    u8 unk0x30a;
    u8 unk0x30b;
    u8 unk0x30c;
    u8 unk0x30d;
    u8 unk0x30e;
    u8 unk0x30f;
    u8 unk0x310;
    u8 unk0x311;
    u8 unk0x312;
    u8 unk0x313;
    u8 unk0x314;
    u8 unk0x315;
    u8 unk0x316;
    u8 unk0x317;
    u8 unk0x318;
    u8 unk0x319;
    u8 unk0x31a;
    u8 unk0x31b;
    u8 unk0x31c;
    u8 unk0x31d;
    u8 unk0x31e;
    u8 unk0x31f;
    u8 unk0x320;
    u8 unk0x321;
    u8 unk0x322;
    u8 unk0x323;
    u8 unk0x324;
    u8 unk0x325;
    u8 unk0x326;
    u8 unk0x327;
    u8 unk0x328;
    u8 unk0x329;
    u8 unk0x32a;
    u8 unk0x32b;
    u8 unk0x32c;
    u8 unk0x32d;
    u8 unk0x32e;
    u8 unk0x32f;
    u8 unk0x330;
    u8 unk0x331;
    u8 unk0x332;
    u8 unk0x333;
    u8 unk0x334;
    u8 unk0x335;
    u8 unk0x336;
    u8 unk0x337;
    u8 unk0x338;
    u8 unk0x339;
    u8 unk0x33a;
    u8 unk0x33b;
    u8 unk0x33c;
    u8 unk0x33d;
    u8 unk0x33e;
    u8 unk0x33f;
    u8 unk0x340;
    u8 unk0x341;
    u8 unk0x342;
    u8 unk0x343;
    u8 unk0x344;
    u8 unk0x345;
    u8 unk0x346;
    u8 unk0x347;
    u8 unk0x348;
    u8 unk0x349;
    u8 unk0x34a;
    u8 unk0x34b;
    u8 unk0x34c;
    u8 unk0x34d;
    u8 unk0x34e;
    u8 unk0x34f;
    u8 unk0x350;
    u8 unk0x351;
    u8 unk0x352;
    u8 unk0x353;
    u8 unk0x354;
    u8 unk0x355;
    u8 unk0x356;
    u8 unk0x357;
    u8 unk0x358;
    u8 unk0x359;
    u8 unk0x35a;
    u8 unk0x35b;
    u8 unk0x35c;
    u8 unk0x35d;
    u8 unk0x35e;
    u8 unk0x35f;
    u8 unk0x360;
    u8 unk0x361;
    u8 unk0x362;
    u8 unk0x363;
    u8 unk0x364;
    u8 unk0x365;
    u8 unk0x366;
    u8 unk0x367;
    u8 unk0x368;
    u8 unk0x369;
    u8 unk0x36a;
    u8 unk0x36b;
    u8 unk0x36c;
    u8 unk0x36d;
    u8 unk0x36e;
    u8 unk0x36f;
    u8 unk0x370;
    u8 unk0x371;
    u8 unk0x372;
    u8 unk0x373;
    u8 unk0x374;
    u8 unk0x375;
    u8 unk0x376;
    u8 unk0x377;
    u8 unk0x378;
    u8 unk0x379;
    u8 unk0x37a;
    u8 unk0x37b;
    u8 unk0x37c;
    u8 unk0x37d;
    u8 unk0x37e;
    u8 unk0x37f;
    u8 unk0x380;
    u8 unk0x381;
    u8 unk0x382;
    u8 unk0x383;
    u8 unk0x384;
    u8 unk0x385;
    u8 unk0x386;
    u8 unk0x387;
    u8 unk0x388;
    u8 unk0x389;
    u8 unk0x38a;
    u8 unk0x38b;
    u8 unk0x38c;
    u8 unk0x38d;
    u8 unk0x38e;
    u8 unk0x38f;
    u8 unk0x390;
    u8 unk0x391;
    u8 unk0x392;
    u8 unk0x393;
    u8 unk0x394;
    u8 unk0x395;
    u8 unk0x396;
    u8 unk0x397;
    u8 unk0x398;
    u8 unk0x399;
    u8 unk0x39a;
    u8 unk0x39b;
    u8 unk0x39c;
    u8 unk0x39d;
    u8 unk0x39e;
    u8 unk0x39f;
    u8 unk0x3a0;
    u8 unk0x3a1;
    u8 unk0x3a2;
    u8 unk0x3a3;
    u8 unk0x3a4;
    u8 unk0x3a5;
    u8 unk0x3a6;
    u8 unk0x3a7;
    u8 unk0x3a8;
    u8 unk0x3a9;
    u8 unk0x3aa;
    u8 unk0x3ab;
    u8 unk0x3ac;
    u8 unk0x3ad;
    u8 unk0x3ae;
    u8 unk0x3af;
    u8 unk0x3b0;
    u8 unk0x3b1;
    u8 unk0x3b2;
    u8 unk0x3b3;
    u8 unk0x3b4;
    u8 unk0x3b5;
    u8 unk0x3b6;
    u8 unk0x3b7;
    u8 unk0x3b8;
    u8 unk0x3b9;
    u8 unk0x3ba;
    u8 unk0x3bb;
    u8 unk0x3bc;
    u8 unk0x3bd;
    u8 unk0x3be;
    u8 unk0x3bf;
    u8 unk0x3c0;
    u8 unk0x3c1;
    u8 unk0x3c2;
    u8 unk0x3c3;
    u8 unk0x3c4;
    u8 unk0x3c5;
    u8 unk0x3c6;
    u8 unk0x3c7;
    u8 unk0x3c8;
    u8 unk0x3c9;
    u8 unk0x3ca;
    u8 unk0x3cb;
    u8 unk0x3cc;
    u8 unk0x3cd;
    u8 unk0x3ce;
    u8 unk0x3cf;
    u8 unk0x3d0;
    u8 unk0x3d1;
    u8 unk0x3d2;
    u8 unk0x3d3;
    u8 unk0x3d4;
    u8 unk0x3d5;
    u8 unk0x3d6;
    u8 unk0x3d7;
    u8 unk0x3d8;
    u8 unk0x3d9;
    u8 unk0x3da;
    u8 unk0x3db;
    u8 unk0x3dc;
    u8 unk0x3dd;
    u8 unk0x3de;
    u8 unk0x3df;
    u8 unk0x3e0;
    u8 unk0x3e1;
    u8 unk0x3e2;
    u8 unk0x3e3;
    u8 unk0x3e4;
    u8 unk0x3e5;
    u8 unk0x3e6;
    u8 unk0x3e7;
    u8 unk0x3e8;
    u8 unk0x3e9;
    u8 unk0x3ea;
    u8 unk0x3eb;
    u8 unk0x3ec;
    u8 unk0x3ed;
    u8 unk0x3ee;
    u8 unk0x3ef;
    u8 unk0x3f0;
    u8 unk0x3f1;
    u8 unk0x3f2;
    u8 unk0x3f3;
    u8 unk0x3f4;
    u8 unk0x3f5;
    u8 unk0x3f6;
    u8 unk0x3f7;
    u8 unk0x3f8;
    u8 unk0x3f9;
    u8 unk0x3fa;
    u8 unk0x3fb;
    u8 unk0x3fc;
    u8 unk0x3fd;
    u8 unk0x3fe;
    u8 unk0x3ff;
    u8 unk0x400;
    u8 unk0x401;
    u8 unk0x402;
    u8 unk0x403;
    u8 unk0x404;
    u8 unk0x405;
    u8 unk0x406;
    u8 unk0x407;
    u8 unk0x408;
    u8 unk0x409;
    u8 unk0x40a;
    u8 unk0x40b;
    u8 unk0x40c;
    u8 unk0x40d;
    u8 unk0x40e;
    u8 unk0x40f;
    u8 unk0x410;
    u8 unk0x411;
    u8 unk0x412;
    u8 unk0x413;
    u8 unk0x414;
    u8 unk0x415;
    u8 unk0x416;
    u8 unk0x417;
    u8 unk0x418;
    u8 unk0x419;
    u8 unk0x41a;
    u8 unk0x41b;
    u8 unk0x41c;
    u8 unk0x41d;
    u8 unk0x41e;
    u8 unk0x41f;
    u8 unk0x420;
    u8 unk0x421;
    u8 unk0x422;
    u8 unk0x423;
    u8 unk0x424;
    u8 unk0x425;
    u8 unk0x426;
    u8 unk0x427;
    u8 unk0x428;
    u8 unk0x429;
    u8 unk0x42a;
    u8 unk0x42b;
    u8 unk0x42c;
    u8 unk0x42d;
    u8 unk0x42e;
    u8 unk0x42f;
    u8 unk0x430;
    u8 unk0x431;
    u8 unk0x432;
    u8 unk0x433;
    u8 unk0x434;
    u8 unk0x435;
    u8 unk0x436;
    u8 unk0x437;
    u8 unk0x438;
    u8 unk0x439;
    u8 unk0x43a;
    u8 unk0x43b;
    u8 unk0x43c;
    u8 unk0x43d;
    u8 unk0x43e;
    u8 unk0x43f;
    u8 unk0x440;
    u8 unk0x441;
    u8 unk0x442;
    u8 unk0x443;
    u8 unk0x444;
    u8 unk0x445;
    u8 unk0x446;
    u8 unk0x447;
    u8 unk0x448;
    u8 unk0x449;
    u8 unk0x44a;
    u8 unk0x44b;
    u8 unk0x44c;
    u8 unk0x44d;
    u8 unk0x44e;
    u8 unk0x44f;
    u8 unk0x450;
    u8 unk0x451;
    u8 unk0x452;
    u8 unk0x453;
    u8 unk0x454;
    u8 unk0x455;
    u8 unk0x456;
    u8 unk0x457;
    u8 unk0x458;
    u8 unk0x459;
    u8 unk0x45a;
    u8 unk0x45b;
    u8 unk0x45c;
    u8 unk0x45d;
    u8 unk0x45e;
    u8 unk0x45f;
    u8 unk0x460;
    u8 unk0x461;
    u8 unk0x462;
    u8 unk0x463;
    u8 unk0x464;
    u8 unk0x465;
    u8 unk0x466;
    u8 unk0x467;
    u8 unk0x468;
    u8 unk0x469;
    u8 unk0x46a;
    u8 unk0x46b;
    u8 unk0x46c;
    u8 unk0x46d;
    u8 unk0x46e;
    u8 unk0x46f;
    u8 unk0x470;
    u8 unk0x471;
    u8 unk0x472;
    u8 unk0x473;
    u8 unk0x474;
    u8 unk0x475;
    u8 unk0x476;
    u8 unk0x477;
    u8 unk0x478;
    u8 unk0x479;
    u8 unk0x47a;
    u8 unk0x47b;
    u8 unk0x47c;
    u8 unk0x47d;
    u8 unk0x47e;
    u8 unk0x47f;
    u8 unk0x480;
    u8 unk0x481;
    u8 unk0x482;
    u8 unk0x483;
    u8 unk0x484;
    u8 unk0x485;
    u8 unk0x486;
    u8 unk0x487;
    u8 unk0x488;
    u8 unk0x489;
    u8 unk0x48a;
    u8 unk0x48b;
    u8 unk0x48c;
    u8 unk0x48d;
    u8 unk0x48e;
    u8 unk0x48f;
    byte unk0x490[16];
    vec3 unk0x4a0;
    vec3 unk0x4ac;
    float unk0x4b8;
    u8 unk0x4bc;
    u8 unk0x4bd;
    u8 unk0x4be;
    u8 unk0x4bf;
    undefined2 unk0x4c0;
    u8 unk0x4c2;
    u8 unk0x4c3;
    u8 unk0x4c4;
    u8 unk0x4c5;
    u8 unk0x4c6;
    u8 unk0x4c7;
    u8 unk0x4c8;
    u8 unk0x4c9;
    u8 unk0x4ca;
    u8 unk0x4cb;
    u8 unk0x4cc;
    u8 unk0x4cd;
    u8 unk0x4ce;
    u8 unk0x4cf;
    u8 unk0x4d0;
    u8 unk0x4d1;
    u8 unk0x4d2;
    u8 unk0x4d3;
    u8 unk0x4d4;
    u8 unk0x4d5;
    u8 unk0x4d6;
    u8 unk0x4d7;
    u8 unk0x4d8;
    u8 unk0x4d9;
    u8 unk0x4da;
    u8 unk0x4db;
    u8 unk0x4dc;
    u8 unk0x4dd;
    u8 unk0x4de;
    u8 unk0x4df;
    u8 unk0x4e0;
    u8 unk0x4e1;
    u8 unk0x4e2;
    u8 unk0x4e3;
    u8 unk0x4e4;
    u8 unk0x4e5;
    u8 unk0x4e6;
    u8 unk0x4e7;
    u8 unk0x4e8;
    u8 unk0x4e9;
    u8 unk0x4ea;
    u8 unk0x4eb;
    u8 unk0x4ec;
    u8 unk0x4ed;
    u8 unk0x4ee;
    u8 unk0x4ef;
    u8 unk0x4f0;
    u8 unk0x4f1;
    u8 unk0x4f2;
    u8 unk0x4f3;
    u8 unk0x4f4;
    u8 unk0x4f5;
    u8 unk0x4f6;
    u8 unk0x4f7;
    u8 unk0x4f8;
    u8 unk0x4f9;
    u8 unk0x4fa;
    u8 unk0x4fb;
    u8 unk0x4fc;
    u8 unk0x4fd;
    u8 unk0x4fe;
    u8 unk0x4ff;
    u8 unk0x500;
    u8 unk0x501;
    u8 unk0x502;
    u8 unk0x503;
    u8 unk0x504;
    u8 unk0x505;
    u8 unk0x506;
    u8 unk0x507;
    u8 unk0x508;
    u8 unk0x509;
    u8 unk0x50a;
    u8 unk0x50b;
    u8 unk0x50c;
    u8 unk0x50d;
    u8 unk0x50e;
    u8 unk0x50f;
    u8 unk0x510;
    u8 unk0x511;
    u8 unk0x512;
    u8 unk0x513;
    u8 unk0x514;
    u8 unk0x515;
    u8 unk0x516;
    u8 unk0x517;
    u8 unk0x518;
    u8 unk0x519;
    u8 unk0x51a;
    u8 unk0x51b;
    u8 unk0x51c;
    u8 unk0x51d;
    u8 unk0x51e;
    u8 unk0x51f;
    u8 unk0x520;
    u8 unk0x521;
    u8 unk0x522;
    u8 unk0x523;
    u8 unk0x524;
    u8 unk0x525;
    u8 unk0x526;
    u8 unk0x527;
    u8 unk0x528;
    u8 unk0x529;
    u8 unk0x52a;
    u8 unk0x52b;
    u8 unk0x52c;
    u8 unk0x52d;
    u8 unk0x52e;
    u8 unk0x52f;
    u8 unk0x530;
    u8 unk0x531;
    u8 unk0x532;
    u8 unk0x533;
    u8 unk0x534;
    u8 unk0x535;
    u8 unk0x536;
    u8 unk0x537;
    u8 unk0x538;
    u8 unk0x539;
    u8 unk0x53a;
    u8 unk0x53b;
    u8 unk0x53c;
    u8 unk0x53d;
    u8 unk0x53e;
    u8 unk0x53f;
    u8 unk0x540;
    u8 unk0x541;
    u8 unk0x542;
    u8 unk0x543;
    u8 unk0x544;
    u8 unk0x545;
    u8 unk0x546;
    u8 unk0x547;
    u8 unk0x548;
    u8 unk0x549;
    u8 unk0x54a;
    u8 unk0x54b;
    u8 unk0x54c;
    u8 unk0x54d;
    u8 unk0x54e;
    u8 unk0x54f;
    u8 unk0x550;
    u8 unk0x551;
    u8 unk0x552;
    u8 unk0x553;
    u8 unk0x554;
    u8 unk0x555;
    u8 unk0x556;
    u8 unk0x557;
    u8 unk0x558;
    u8 unk0x559;
    u8 unk0x55a;
    u8 unk0x55b;
    u8 unk0x55c;
    u8 unk0x55d;
    u8 unk0x55e;
    u8 unk0x55f;
    u8 unk0x560;
    u8 unk0x561;
    u8 unk0x562;
    u8 unk0x563;
    u8 unk0x564;
    u8 unk0x565;
    u8 unk0x566;
    u8 unk0x567;
    u8 unk0x568;
    u8 unk0x569;
    u8 unk0x56a;
    u8 unk0x56b;
    u8 unk0x56c;
    u8 unk0x56d;
    u8 unk0x56e;
    u8 unk0x56f;
    u8 unk0x570;
    u8 unk0x571;
    u8 unk0x572;
    u8 unk0x573;
    u8 unk0x574;
    u8 unk0x575;
    u8 unk0x576;
    u8 unk0x577;
    u8 unk0x578;
    u8 unk0x579;
    u8 unk0x57a;
    u8 unk0x57b;
    u8 unk0x57c;
    u8 unk0x57d;
    u8 unk0x57e;
    u8 unk0x57f;
    u8 unk0x580;
    u8 unk0x581;
    u8 unk0x582;
    u8 unk0x583;
    u8 unk0x584;
    u8 unk0x585;
    u8 unk0x586;
    u8 unk0x587;
    u8 unk0x588;
    u8 unk0x589;
    u8 unk0x58a;
    u8 unk0x58b;
    u8 unk0x58c;
    u8 unk0x58d;
    u8 unk0x58e;
    u8 unk0x58f;
    u8 unk0x590;
    u8 unk0x591;
    u8 unk0x592;
    u8 unk0x593;
    u8 unk0x594;
    u8 unk0x595;
    u8 unk0x596;
    u8 unk0x597;
    u8 unk0x598;
    u8 unk0x599;
    u8 unk0x59a;
    u8 unk0x59b;
    u8 unk0x59c;
    u8 unk0x59d;
    u8 unk0x59e;
    u8 unk0x59f;
    u8 unk0x5a0;
    u8 unk0x5a1;
    u8 unk0x5a2;
    u8 unk0x5a3;
    u8 unk0x5a4;
    u8 unk0x5a5;
    u8 unk0x5a6;
    u8 unk0x5a7;
    u8 unk0x5a8;
    u8 unk0x5a9;
    u8 unk0x5aa;
    u8 unk0x5ab;
    u8 unk0x5ac;
    u8 unk0x5ad;
    u8 unk0x5ae;
    u8 unk0x5af;
    u8 unk0x5b0;
    u8 unk0x5b1;
    u8 unk0x5b2;
    u8 unk0x5b3;
    u8 unk0x5b4;
    u8 unk0x5b5;
    u8 unk0x5b6;
    u8 unk0x5b7;
    u8 unk0x5b8;
    u8 unk0x5b9;
    u8 unk0x5ba;
    u8 unk0x5bb;
    u8 unk0x5bc;
    u8 unk0x5bd;
    u8 unk0x5be;
    u8 unk0x5bf;
    u8 unk0x5c0;
    u8 unk0x5c1;
    u8 unk0x5c2;
    u8 unk0x5c3;
    u8 unk0x5c4;
    u8 unk0x5c5;
    u8 unk0x5c6;
    u8 unk0x5c7;
    u8 unk0x5c8;
    u8 unk0x5c9;
    u8 unk0x5ca;
    u8 unk0x5cb;
    u8 unk0x5cc;
    u8 unk0x5cd;
    u8 unk0x5ce;
    u8 unk0x5cf;
    u8 unk0x5d0;
    u8 unk0x5d1;
    u8 unk0x5d2;
    u8 unk0x5d3;
    u8 unk0x5d4;
    u8 unk0x5d5;
    u8 unk0x5d6;
    u8 unk0x5d7;
    u8 unk0x5d8;
    u8 unk0x5d9;
    u8 unk0x5da;
    u8 unk0x5db;
    u8 unk0x5dc;
    u8 unk0x5dd;
    u8 unk0x5de;
    u8 unk0x5df;
    u8 unk0x5e0;
    u8 unk0x5e1;
    u8 unk0x5e2;
    u8 unk0x5e3;
    u8 unk0x5e4;
    u8 unk0x5e5;
    u8 unk0x5e6;
    u8 unk0x5e7;
    u8 unk0x5e8;
    u8 unk0x5e9;
    u8 unk0x5ea;
    u8 unk0x5eb;
    u8 unk0x5ec;
    u8 unk0x5ed;
    u8 unk0x5ee;
    u8 unk0x5ef;
    u8 unk0x5f0;
    u8 unk0x5f1;
    u8 unk0x5f2;
    u8 unk0x5f3;
    u8 unk0x5f4;
    u8 unk0x5f5;
    u8 unk0x5f6;
    u8 unk0x5f7;
    u8 unk0x5f8;
    u8 unk0x5f9;
    u8 unk0x5fa;
    u8 unk0x5fb;
    u8 unk0x5fc;
    u8 unk0x5fd;
    u8 unk0x5fe;
    u8 unk0x5ff;
    u8 unk0x600;
    u8 unk0x601;
    u8 unk0x602;
    u8 unk0x603;
    u8 unk0x604;
    u8 unk0x605;
    u8 unk0x606;
    u8 unk0x607;
    u8 unk0x608;
    u8 unk0x609;
    u8 unk0x60a;
    u8 unk0x60b;
    u8 unk0x60c;
    u8 unk0x60d;
    u8 unk0x60e;
    u8 unk0x60f;
    u8 unk0x610;
    u8 unk0x611;
    u8 unk0x612;
    u8 unk0x613;
    u8 unk0x614;
    u8 unk0x615;
    u8 unk0x616;
    u8 unk0x617;
    u8 unk0x618;
    u8 unk0x619;
    u8 unk0x61a;
    u8 unk0x61b;
    u8 unk0x61c;
    u8 unk0x61d;
    u8 unk0x61e;
    u8 unk0x61f;
    u8 unk0x620;
    u8 unk0x621;
    u8 unk0x622;
    u8 unk0x623;
    u8 unk0x624;
    u8 unk0x625;
    u8 unk0x626;
    u8 unk0x627;
    u8 unk0x628;
    u8 unk0x629;
    u8 unk0x62a;
    u8 unk0x62b;
    u8 unk0x62c;
    u8 unk0x62d;
    u8 unk0x62e;
    u8 unk0x62f;
    u8 unk0x630;
    u8 unk0x631;
    u8 unk0x632;
    u8 unk0x633;
    u8 unk0x634;
    u8 unk0x635;
    u8 unk0x636;
    u8 unk0x637;
    u8 unk0x638;
    u8 unk0x639;
    u8 unk0x63a;
    u8 unk0x63b;
    u8 unk0x63c;
    u8 unk0x63d;
    u8 unk0x63e;
    u8 unk0x63f;
    u8 unk0x640;
    u8 unk0x641;
    u8 unk0x642;
    u8 unk0x643;
    u8 unk0x644;
    u8 unk0x645;
    u8 unk0x646;
    u8 unk0x647;
    u8 unk0x648;
    u8 unk0x649;
    u8 unk0x64a;
    u8 unk0x64b;
    u8 unk0x64c;
    u8 unk0x64d;
    u8 unk0x64e;
    u8 unk0x64f;
    u8 unk0x650;
    u8 unk0x651;
    u8 unk0x652;
    u8 unk0x653;
    u8 unk0x654;
    u8 unk0x655;
    u8 unk0x656;
    u8 unk0x657;
    u8 unk0x658;
    u8 unk0x659;
    u8 unk0x65a;
    u8 unk0x65b;
    u8 unk0x65c;
    u8 unk0x65d;
    u8 unk0x65e;
    u8 unk0x65f;
    u8 unk0x660;
    u8 unk0x661;
    u8 unk0x662;
    u8 unk0x663;
    u8 unk0x664;
    u8 unk0x665;
    u8 unk0x666;
    u8 unk0x667;
    u8 unk0x668;
    u8 unk0x669;
    u8 unk0x66a;
    u8 unk0x66b;
    u8 unk0x66c;
    u8 unk0x66d;
    u8 unk0x66e;
    u8 unk0x66f;
    u8 unk0x670;
    u8 unk0x671;
    u8 unk0x672;
    u8 unk0x673;
    u8 unk0x674;
    u8 unk0x675;
    u8 unk0x676;
    u8 unk0x677;
    u8 unk0x678;
    u8 unk0x679;
    u8 unk0x67a;
    u8 unk0x67b;
    u8 unk0x67c;
    u8 unk0x67d;
    u8 unk0x67e;
    u8 unk0x67f;
    u8 unk0x680;
    u8 unk0x681;
    u8 unk0x682;
    u8 unk0x683;
    u8 unk0x684;
    u8 unk0x685;
    u8 unk0x686;
    u8 unk0x687;
    u8 unk0x688;
    u8 unk0x689;
    u8 unk0x68a;
    u8 unk0x68b;
    u8 unk0x68c;
    u8 unk0x68d;
    u8 unk0x68e;
    u8 unk0x68f;
    u8 unk0x690;
    u8 unk0x691;
    u8 unk0x692;
    u8 unk0x693;
    u8 unk0x694;
    u8 unk0x695;
    u8 unk0x696;
    u8 unk0x697;
    u8 unk0x698;
    u8 unk0x699;
    u8 unk0x69a;
    u8 unk0x69b;
    u8 unk0x69c;
    u8 unk0x69d;
    u8 unk0x69e;
    u8 unk0x69f;
    u8 unk0x6a0;
    u8 unk0x6a1;
    u8 unk0x6a2;
    u8 unk0x6a3;
    u8 unk0x6a4;
    u8 unk0x6a5;
    u8 unk0x6a6;
    u8 unk0x6a7;
    u8 unk0x6a8;
    u8 unk0x6a9;
    u8 unk0x6aa;
    u8 unk0x6ab;
    u8 unk0x6ac;
    u8 unk0x6ad;
    u8 unk0x6ae;
    u8 unk0x6af;
    u8 unk0x6b0;
    u8 unk0x6b1;
    u8 unk0x6b2;
    u8 unk0x6b3;
    u8 unk0x6b4;
    u8 unk0x6b5;
    u8 unk0x6b6;
    u8 unk0x6b7;
    u8 unk0x6b8;
    u8 unk0x6b9;
    u8 unk0x6ba;
    u8 unk0x6bb;
    u8 unk0x6bc;
    u8 unk0x6bd;
    u8 unk0x6be;
    u8 unk0x6bf;
    u8 unk0x6c0;
    u8 unk0x6c1;
    u8 unk0x6c2;
    u8 unk0x6c3;
    u8 unk0x6c4;
    u8 unk0x6c5;
    u8 unk0x6c6;
    u8 unk0x6c7;
    u8 unk0x6c8;
    u8 unk0x6c9;
    u8 unk0x6ca;
    u8 unk0x6cb;
    u8 unk0x6cc;
    u8 unk0x6cd;
    u8 unk0x6ce;
    u8 unk0x6cf;
    u8 unk0x6d0;
    u8 unk0x6d1;
    u8 unk0x6d2;
    u8 unk0x6d3;
    u8 unk0x6d4;
    u8 unk0x6d5;
    u8 unk0x6d6;
    u8 unk0x6d7;
    u8 unk0x6d8;
    u8 unk0x6d9;
    u8 unk0x6da;
    u8 unk0x6db;
    u8 unk0x6dc;
    u8 unk0x6dd;
    u8 unk0x6de;
    u8 unk0x6df;
    u8 unk0x6e0;
    u8 unk0x6e1;
    u8 unk0x6e2;
    u8 unk0x6e3;
    u8 unk0x6e4;
    u8 unk0x6e5;
    u8 unk0x6e6;
    u8 unk0x6e7;
    u8 unk0x6e8;
    u8 unk0x6e9;
    u8 unk0x6ea;
    u8 unk0x6eb;
    u8 unk0x6ec;
    u8 unk0x6ed;
    u8 unk0x6ee;
    u8 unk0x6ef;
    u8 unk0x6f0;
    u8 unk0x6f1;
    u8 unk0x6f2;
    u8 unk0x6f3;
    u8 unk0x6f4;
    u8 unk0x6f5;
    u8 unk0x6f6;
    u8 unk0x6f7;
    u8 unk0x6f8;
    u8 unk0x6f9;
    u8 unk0x6fa;
    u8 unk0x6fb;
    u8 unk0x6fc;
    u8 unk0x6fd;
    u8 unk0x6fe;
    u8 unk0x6ff;
    u8 unk0x700;
    u8 unk0x701;
    u8 unk0x702;
    u8 unk0x703;
    u8 unk0x704;
    u8 unk0x705;
    u8 unk0x706;
    u8 unk0x707;
    short unk0x708;
    byte visible_flag?;
    bool alaron_flag;
    char unk0x70c;
    byte zoneDatByte;
    u8 unk0x70e;
    u8 unk0x70f;
    void * dcmDat[2][3];
    short unk0x728;
    ushort movement_;
    ushort spellUsed;
    u8 unk0x72e;
    u8 unk0x72f;
    u8 unk0x730;
    u8 unk0x731;
    u8 unk0x732;
    u8 unk0x733;
    u8 unk0x734;
    u8 unk0x735;
    u8 unk0x736;
    u8 unk0x737;
    u8 unk0x738;
    u8 unk0x739;
    u8 unk0x73a;
    u8 unk0x73b;
    u8 unk0x73c;
    u8 unk0x73d;
    u8 unk0x73e;
    u8 unk0x73f;
    u8 unk0x740;
    u8 unk0x741;
    u8 unk0x742;
    u8 unk0x743;
    u8 unk0x744;
    u8 unk0x745;
    u8 unk0x746;
    u8 unk0x747;
    u8 unk0x748;
    u8 unk0x749;
    u8 unk0x74a;
    u8 unk0x74b;
    u8 unk0x74c;
    u8 unk0x74d;
    u8 unk0x74e;
    u8 unk0x74f;
    u8 unk0x750;
    u8 unk0x751;
    u8 unk0x752;
    u8 unk0x753;
    ushort rangerWarrior;
    struct ItemID ent_ID;
    ushort Ent_index;
    u8 unk0x75a;
    u8 unk0x75b;
    float unk0x75c;
    float unk0x760;
    vec3 unk0x764;
    vec3 unk0x770;
    char unk0x77c;
    u8 unk0x77d;
    u8 unk0x77e;
    u8 unk0x77f;
};

struct Borg_7_header {
    s32 index;
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    struct AnimationData * aniDat;
    undefined2 unk0xc;
    undefined2 unk0xe;
    undefined2 unk0x10;
    undefined2 unk0x12;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    struct borg_6_header * borg_pointer;
    void * unk0x1c;
    vec3 unk0x20;
    vec3 unk0x2c;
    struct borg_6_header * unk0x38;
    u8 unk0x3c;
    u8 unk0x3d;
    u8 unk0x3e;
    u8 unk0x3f;
    u8 unk0x40;
    u8 unk0x41;
    u8 unk0x42;
    u8 unk0x43;
    undefined4 unk0x44;
    u8 unk0x48;
    u8 unk0x49;
    u8 unk0x4a;
    u8 unk0x4b;
    u8 unk0x4c;
    u8 unk0x4d;
    u8 unk0x4e;
    u8 unk0x4f;
    u32 unk0x50;
    int borg6_size;
    int unk0x58;
    enum borg6Enum borg6;
    u8 unk0x60;
    u8 unk0x61;
    u8 unk0x62;
    u8 unk0x63;
    u8 * unk0x64;
};

struct borg_6_header {
    uint unk0x0;
    uint unk0x4;
    int unk0x8;
    undefined4 unk0xc;
    undefined4 unk0x10;
    void * unk0x14;
    undefined4 unk0x18;
    float unk0x1c;
    uint unk0x20;
};

struct container_Dat {
    undefined4 unk0x0;
    float chest_size;
    enum EventFlag open_flag;
    enum EventFlag explode_flag;
    short trap_lv;
    ushort unk0x14;
    struct ItemID LootCat; /* chestdb id */
    ushort LootType;
    undefined2 unk0x14;
    ushort Gold; /* money */
    struct ItemID item; /* static item */
    ushort unk0x1a;
    short lootCatDrop[6][2]; /* populated with chestdb items */
    u8 unk0x34;
    u8 unk0x35;
    u8 unk0x36;
    u8 unk0x37;
    u8 unk0x38;
    u8 unk0x39;
    u8 unk0x3a;
    u8 unk0x3b;
    u8 unk0x3c;
    u8 unk0x3d;
    u8 unk0x3e;
    u8 unk0x3f;
    u8 unk0x40;
    u8 unk0x41;
    u8 unk0x42;
    u8 unk0x43;
};

struct container_obj {
    struct voxelHeader header;
    struct container_Dat dat;
};

struct dialoug_dat {
    ushort borg_13;
    ushort unk0x2;
    ushort unk0x4;
    ushort unk0x6;
    ushort unk0x8;
    u8 unk0xa;
    u8 unk0xb;
    ushort unk0xc;
    u8 unk0xe;
    u8 unk0xf;
    u8 unk0x10;
    u8 unk0x11;
    u8 unk0x12;
    u8 unk0x13;
    ushort unk0x14;
    ushort unk0x16;
    u8 unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
    char name[16];
    u8 unk0x2c;
    u8 unk0x2d;
    u8 unk0x2e;
    u8 unk0x2f;
    u8 unk0x30;
    u8 unk0x31;
    u8 unk0x32;
    u8 unk0x33;
    u8 unk0x34;
    u8 unk0x35;
    u8 unk0x36;
    u8 unk0x37;
    u8 unk0x38;
    u8 unk0x39;
    u8 unk0x3a;
    u8 unk0x3b;
    u8 unk0x3c;
    u8 unk0x3d;
    u8 unk0x3e;
    u8 unk0x3f;
    u8 unk0x40;
    u8 unk0x41;
    u8 unk0x42;
    u8 unk0x43;
};

struct Dialoug_obj {
    struct voxelHeader header;
    struct dialoug_dat dat;
};

struct Scene_obj_dat {
    float unk0x0;
    undefined4 unk0x4;
    struct Borg_7_header * unk0x8;
    u8 unk0xc;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
    uint borg5_index;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    u8 unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
    u8 unk0x1c;
    u8 unk0x1d;
    u8 unk0x1e;
    u8 unk0x1f;
    u8 unk0x20;
    u8 unk0x21;
    u8 unk0x22;
    u8 unk0x23;
    u8 unk0x24;
    u8 unk0x25;
    u8 unk0x26;
    u8 unk0x27;
    u8 unk0x28;
    u8 unk0x29;
    u8 unk0x2a;
    u8 unk0x2b;
    float unk0x2c;
    u8 unk0x30;
    u8 unk0x31;
    u8 unk0x32;
    u8 unk0x33;
    vec3 unk0x34;
    ushort unk0x40;
    ushort unk0x42;
};

struct Scene_obj {
    struct voxelHeader header;
    struct Scene_obj_dat dat;
};

struct monsterparty_obj {
    struct voxelHeader header;
    struct monsterparty_dat dat;
};

struct Trigger_dat {
    short triggertype; /* 1,2,4 are unique. */
    u8 unk0x2;
    u8 unk0x3;
    enum EventFlag flagA;
    enum EventFlag flagB;
    enum EventFlag flagC;
    u8 unk0xa;
    u8 unk0xb;
    ushort unk0xc;
    u8 unk0xe;
    u8 unk0xf;
    u8 unk0x10;
    u8 unk0x11;
    u8 unk0x12;
    u8 unk0x13;
    ushort unk0x14;
    ushort unk0x16;
    u8 unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
    char name[16];
    u8 unk0x2c;
    u8 unk0x2d;
    u8 unk0x2e;
    u8 unk0x2f;
    u8 unk0x30;
    u8 unk0x31;
    u8 unk0x32;
    u8 unk0x33;
    u8 unk0x34;
    u8 unk0x35;
    u8 unk0x36;
    u8 unk0x37;
    u8 unk0x38;
    u8 unk0x39;
    u8 unk0x3a;
    u8 unk0x3b;
    u8 unk0x3c;
    u8 unk0x3d;
    u8 unk0x3e;
    u8 unk0x3f;
    u8 unk0x40;
    u8 unk0x41;
    u8 unk0x42;
    u8 unk0x43;
};

struct trigger_obj {
    struct voxelHeader header;
    struct Trigger_dat dat;
};

struct ref_obj {
    struct voxelHeader header;
    byte data[68];
};

struct light_obj {
    struct voxelHeader header;
    struct light_obj_dat data;
};

union Voxel_u {
    struct ref_obj BaseRef;
    struct Audio_obj audio;
    struct monsterparty_obj monster;
    struct Scene_obj SCene;
    struct light_obj Light;
    struct referncepoint_obj refpoint;
    struct teleport_obj teleport;
    struct container_obj container;
    struct Dialoug_obj dialoug;
    struct trigger_obj trigger;
    struct camera_obj camera;
};

struct Borg_9_data {
    vec3 floatsA; /* position? */
    Vec2 floatsB; /* size? */
    byte unk1[6]; /* seems unused */
    byte byte0x1a;
    byte byte0x1b;
    ushort shortA;
    ushort shortB;
    byte unk[4];
    ushort borghpys_count;
    ushort unk0x26;
    ushort ref_obj_count;
    ushort unkStructCount;
    short * counting_pointer;
    int someint;
    short * pointer2;
    float * floats_pointer;
    struct borg9_phys * phys_pointer;
    int someInt_2;
    union Voxel_u * ref_objs;
    struct borg_9_struct * unkStructs;
};

struct borg_9_struct {
    void * unk0x0;
    uint unk0x4;
    void * unk0x8;
    undefined2 unk0xc;
    u8 unk0xe;
    u8 unk0xf;
    ushort unk0x10;
    u8 unk0x12;
    u8 unk0x13;
};

struct ParticleHeadStruct {
    struct particleStruct * unk0x0;
    short unk0x4[386];
    struct someParticleStruct * unk0x308;
    short unk0x30c[16];
    struct Borg_8_header * * ppTextures;
    short count0;
    u8 unk0x332;
    u8 unk0x333;
    float unk0x334;
    struct Borg_9_data * borg9dat;
    ushort particleStructCount;
    ushort count1;
    ushort count2;
};

struct Borg_3 {
    undefined4 index;
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    u8 unk0x8;
    u8 unk0x9;
    u8 unk0xa;
    u8 unk0xb;
    u8 unk0xc;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
    float unk0x10;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    u8 unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
    u8 unk0x1c;
    u8 unk0x1d;
    u8 unk0x1e;
    u8 unk0x1f;
    u8 unk0x20;
    u8 unk0x21;
    u8 unk0x22;
    u8 unk0x23;
    u8 unk0x24;
    u8 unk0x25;
    u8 unk0x26;
    u8 unk0x27;
    int unk0x28;
    int unk0x2c;
};

struct particleStruct {
    undefined2 unk0x0;
    undefined2 unk0x2;
    undefined2 unk0x4;
    undefined2 unk0x6;
    undefined2 unk0x8;
    ushort flags;
    vec3 origin;
    vec3 unk0x18;
    float unk0x24;
    float unk0x28;
    vec4 vec4_0x2c;
    vec4 vec4_0x3c;
    vec3 unk0x4c;
    u8 unk0x58[328];
};

struct astruct_6 {
    struct playerData * playerdat_;
    ushort short0x4;
    byte byte0x5;
    u8 unk0x7;
};

struct someParticleStruct {
    undefined2 ID;
    undefined2 unk0x2;
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    undefined2 unk0x8;
    short unk0xa;
    undefined2 unk0xc;
    u8 unk0xe;
    u8 unk0xf;
    u8 unk0x10;
    u8 unk0x11;
    u8 unk0x12;
    u8 unk0x13;
    struct particleStruct * particle;
    u8 unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
    u8 unk0x1c;
    u8 unk0x1d;
    u8 unk0x1e;
    u8 unk0x1f;
    u8 unk0x20;
    u8 unk0x21;
    u8 unk0x22;
    u8 unk0x23;
    u8 unk0x24;
    u8 unk0x25;
    u8 unk0x26;
    u8 unk0x27;
    u8 unk0x28;
    u8 unk0x29;
    u8 unk0x2a;
    u8 unk0x2b;
    u8 unk0x2c;
    u8 unk0x2d;
    u8 unk0x2e;
    u8 unk0x2f;
    vec3 unk0x30;
    u8 unk0x3c;
    u8 unk0x3d;
    u8 unk0x3e;
    u8 unk0x3f;
    u8 unk0x40;
    u8 unk0x41;
    u8 unk0x42;
    u8 unk0x43;
    vec4 unk0x44;
    u8 unk0x54;
    u8 unk0x55;
    u8 unk0x56;
    u8 unk0x57;
    u8 unk0x58;
    u8 unk0x59;
    u8 unk0x5a;
    u8 unk0x5b;
    u8 unk0x5c;
    u8 unk0x5d;
    u8 unk0x5e;
    u8 unk0x5f;
    u8 unk0x60;
    u8 unk0x61;
    u8 unk0x62;
    u8 unk0x63;
    u8 unk0x64;
    u8 unk0x65;
    u8 unk0x66;
    u8 unk0x67;
    u8 unk0x68;
    u8 unk0x69;
    u8 unk0x6a;
    u8 unk0x6b;
    u8 unk0x6c;
    u8 unk0x6d;
    u8 unk0x6e;
    u8 unk0x6f;
    u8 unk0x70;
    u8 unk0x71;
    u8 unk0x72;
    u8 unk0x73;
    u8 unk0x74;
    u8 unk0x75;
    u8 unk0x76;
    u8 unk0x77;
    u8 unk0x78;
    u8 unk0x79;
    u8 unk0x7a;
    u8 unk0x7b;
    u8 unk0x7c;
    u8 unk0x7d;
    u8 unk0x7e;
    u8 unk0x7f;
    u8 unk0x80;
    u8 unk0x81;
    u8 unk0x82;
    u8 unk0x83;
    u8 unk0x84;
    u8 unk0x85;
    u8 unk0x86;
    u8 unk0x87;
    u8 unk0x88;
    u8 unk0x89;
    u8 unk0x8a;
    u8 unk0x8b;
    u8 unk0x8c;
    u8 unk0x8d;
    u8 unk0x8e;
    u8 unk0x8f;
    u8 unk0x90;
    u8 unk0x91;
    u8 unk0x92;
    u8 unk0x93;
    u8 unk0x94;
    u8 unk0x95;
    u8 unk0x96;
    u8 unk0x97;
    u8 unk0x98;
    u8 unk0x99;
    u8 unk0x9a;
    u8 unk0x9b;
    u8 unk0x9c;
    u8 unk0x9d;
    u8 unk0x9e;
    u8 unk0x9f;
    u8 unk0xa0;
    u8 unk0xa1;
    u8 unk0xa2;
    u8 unk0xa3;
    u8 unk0xa4;
    u8 unk0xa5;
    u8 unk0xa6;
    u8 unk0xa7;
    u8 unk0xa8;
    u8 unk0xa9;
    u8 unk0xaa;
    u8 unk0xab;
    u8 unk0xac;
    u8 unk0xad;
    u8 unk0xae;
    u8 unk0xaf;
    u8 unk0xb0;
    u8 unk0xb1;
    u8 unk0xb2;
    u8 unk0xb3;
    u8 unk0xb4;
    u8 unk0xb5;
    u8 unk0xb6;
    u8 unk0xb7;
    u8 unk0xb8;
    u8 unk0xb9;
    u8 unk0xba;
    u8 unk0xbb;
    u8 unk0xbc;
    u8 unk0xbd;
    u8 unk0xbe;
    u8 unk0xbf;
    u8 unk0xc0;
    u8 unk0xc1;
    u8 unk0xc2;
    u8 unk0xc3;
    u8 unk0xc4;
    u8 unk0xc5;
    u8 unk0xc6;
    u8 unk0xc7;
    u8 unk0xc8;
    u8 unk0xc9;
    u8 unk0xca;
    u8 unk0xcb;
    u8 unk0xcc;
    u8 unk0xcd;
    u8 unk0xce;
    u8 unk0xcf;
    u8 unk0xd0;
    u8 unk0xd1;
    u8 unk0xd2;
    u8 unk0xd3;
    u8 unk0xd4;
    u8 unk0xd5;
    u8 unk0xd6;
    u8 unk0xd7;
    u8 unk0xd8;
    u8 unk0xd9;
    u8 unk0xda;
    u8 unk0xdb;
    u8 unk0xdc;
    u8 unk0xdd;
    u8 unk0xde;
    u8 unk0xdf;
    u8 unk0xe0;
    u8 unk0xe1;
    u8 unk0xe2;
    u8 unk0xe3;
    u8 unk0xe4;
    u8 unk0xe5;
    u8 unk0xe6;
    u8 unk0xe7;
    u8 unk0xe8;
    u8 unk0xe9;
    u8 unk0xea;
    u8 unk0xeb;
    u8 unk0xec;
    u8 unk0xed;
    u8 unk0xee;
    u8 unk0xef;
    u8 unk0xf0;
    u8 unk0xf1;
    u8 unk0xf2;
    u8 unk0xf3;
    u8 unk0xf4;
    u8 unk0xf5;
    u8 unk0xf6;
    u8 unk0xf7;
    u8 unk0xf8;
    u8 unk0xf9;
    u8 unk0xfa;
    u8 unk0xfb;
    u8 unk0xfc;
    u8 unk0xfd;
    u8 unk0xfe;
    u8 unk0xff;
    u8 unk0x100;
    u8 unk0x101;
    u8 unk0x102;
    u8 unk0x103;
    u8 unk0x104;
    u8 unk0x105;
    u8 unk0x106;
    u8 unk0x107;
    u8 unk0x108;
    u8 unk0x109;
    u8 unk0x10a;
    u8 unk0x10b;
    u8 unk0x10c;
    u8 unk0x10d;
    u8 unk0x10e;
    u8 unk0x10f;
    u8 unk0x110;
    u8 unk0x111;
    u8 unk0x112;
    u8 unk0x113;
    u8 unk0x114;
    u8 unk0x115;
    u8 unk0x116;
    u8 unk0x117;
    u8 unk0x118;
    u8 unk0x119;
    u8 unk0x11a;
    u8 unk0x11b;
    u8 unk0x11c;
    u8 unk0x11d;
    u8 unk0x11e;
    u8 unk0x11f;
    u8 unk0x120;
    u8 unk0x121;
    u8 unk0x122;
    u8 unk0x123;
    u8 unk0x124;
    u8 unk0x125;
    u8 unk0x126;
    u8 unk0x127;
    u8 unk0x128;
    u8 unk0x129;
    u8 unk0x12a;
    u8 unk0x12b;
    u8 unk0x12c;
    u8 unk0x12d;
    u8 unk0x12e;
    u8 unk0x12f;
    u8 unk0x130;
    u8 unk0x131;
    u8 unk0x132;
    u8 unk0x133;
    u8 unk0x134;
    u8 unk0x135;
    u8 unk0x136;
    u8 unk0x137;
    u8 unk0x138;
    u8 unk0x139;
    u8 unk0x13a;
    u8 unk0x13b;
    u8 unk0x13c;
    u8 unk0x13d;
    u8 unk0x13e;
    u8 unk0x13f;
    u8 unk0x140;
    u8 unk0x141;
    u8 unk0x142;
    u8 unk0x143;
    u8 unk0x144;
    u8 unk0x145;
    u8 unk0x146;
    u8 unk0x147;
    u8 unk0x148;
    u8 unk0x149;
    u8 unk0x14a;
    u8 unk0x14b;
    u8 unk0x14c;
    u8 unk0x14d;
    u8 unk0x14e;
    u8 unk0x14f;
    u8 unk0x150;
    u8 unk0x151;
    u8 unk0x152;
    u8 unk0x153;
    u8 unk0x154;
    u8 unk0x155;
    u8 unk0x156;
    u8 unk0x157;
    u8 unk0x158;
    u8 unk0x159;
    u8 unk0x15a;
    u8 unk0x15b;
    u8 unk0x15c;
    u8 unk0x15d;
    u8 unk0x15e;
    u8 unk0x15f;
    u8 unk0x160;
    u8 unk0x161;
    u8 unk0x162;
    u8 unk0x163;
    u8 unk0x164;
    u8 unk0x165;
    u8 unk0x166;
    u8 unk0x167;
    u8 unk0x168;
    u8 unk0x169;
    u8 unk0x16a;
    u8 unk0x16b;
    u8 unk0x16c;
    u8 unk0x16d;
    u8 unk0x16e;
    u8 unk0x16f;
    u8 unk0x170;
    u8 unk0x171;
    u8 unk0x172;
    u8 unk0x173;
    u8 unk0x174;
    u8 unk0x175;
    u8 unk0x176;
    u8 unk0x177;
    u8 unk0x178;
    u8 unk0x179;
    u8 unk0x17a;
    u8 unk0x17b;
    u8 unk0x17c;
    u8 unk0x17d;
    u8 unk0x17e;
    u8 unk0x17f;
    u8 unk0x180;
    u8 unk0x181;
    u8 unk0x182;
    u8 unk0x183;
    u8 unk0x184;
    u8 unk0x185;
    u8 unk0x186;
    u8 unk0x187;
    u8 unk0x188;
    u8 unk0x189;
    u8 unk0x18a;
    u8 unk0x18b;
    u8 unk0x18c;
    u8 unk0x18d;
    u8 unk0x18e;
    u8 unk0x18f;
    u8 unk0x190;
    u8 unk0x191;
    u8 unk0x192;
    u8 unk0x193;
    u8 unk0x194;
    u8 unk0x195;
    u8 unk0x196;
    u8 unk0x197;
    u8 unk0x198;
    u8 unk0x199;
    u8 unk0x19a;
    u8 unk0x19b;
    u8 unk0x19c;
    u8 unk0x19d;
    u8 unk0x19e;
    u8 unk0x19f;
    u8 unk0x1a0;
    u8 unk0x1a1;
    u8 unk0x1a2;
    u8 unk0x1a3;
    u8 unk0x1a4;
    u8 unk0x1a5;
    u8 unk0x1a6;
    u8 unk0x1a7;
    u8 unk0x1a8;
    u8 unk0x1a9;
    u8 unk0x1aa;
    u8 unk0x1ab;
    u8 unk0x1ac;
    u8 unk0x1ad;
    u8 unk0x1ae;
    u8 unk0x1af;
    u8 unk0x1b0;
    u8 unk0x1b1;
    u8 unk0x1b2;
    u8 unk0x1b3;
    u8 unk0x1b4;
    u8 unk0x1b5;
    u8 unk0x1b6;
    u8 unk0x1b7;
    undefined4 unk0x1b8;
    ulong (* funcA)(void);
    ulong (* funcB)(void);
    undefined4 unk0x1c4;
    undefined4 unk0x1c8;
    u8 unk0x1cc;
    u8 unk0x1cd;
    u8 unk0x1ce;
    u8 unk0x1cf;
    struct collisionStruct collision;
    u8 unk0x20c;
    u8 unk0x20d;
    u8 unk0x20e;
    u8 unk0x20f;
};

struct borg9_phys {
    struct voxelHeader * voxelPointers[3];
    vec3 vec3_0xc;
    u8 * ptr_0x18;
    ushort shortA;
    ushort shortB;
};

typedef struct astruct_7 astruct_7, *Pastruct_7;

struct astruct_7 {
    undefined4 unk0x0;
    float unk0x4;
    struct Method * unk0x8;
    short * unk0xc;
    double * unk0x10;
    undefined4 unk0x14;
    double unk0x18;
    double unk0x20;
    double unk0x28;
    double unk0x30;
    double unk0x38;
    double unk0x40;
    double unk0x48;
};

typedef struct astruct_8 astruct_8, *Pastruct_8;

typedef enum borg9Enum {
    StartingMap=4059,
    campfire=6236,
    oriana's hut=5266
} borg9Enum;

typedef struct Borg_9_header Borg_9_header, *PBorg_9_header;

struct Borg_9_header {
    enum borg9Enum ID;
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    struct Borg_9_data dat;
};

struct astruct_8 {
    undefined4 unk0x0;
    struct AnimationData * unk0x4;
    enum borg9Enum ID;
    struct Borg_9_header * borg_9;
    uint borg_5;
    int unk0x14;
    int tally;
    u8 unk0x1c;
    byte unk0x1d;
};

typedef struct DCM_sub DCM_sub, *PDCM_sub;

typedef sbyte s8;

struct DCM_sub {
    undefined4 unk0x0;
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    u8 unk0x8;
    u8 unk0x9;
    byte index;
    u8 unk0xb;
    s8 unk0xc;
    byte pan;
    byte unk0xe;
    u8 unk0xf;
};

typedef struct Heap_block_Debug Heap_block_Debug, *PHeap_block_Debug;

struct Heap_block_Debug {
    uint size;
    char filename[24];
};

typedef struct romcopy_struct romcopy_struct, *Promcopy_struct;

typedef void * OSMesg;

typedef struct OSMesgQueue OSMesgQueue, *POSMesgQueue;

typedef struct OSThread OSThread, *POSThread;

typedef enum enum_OSPri {
    APPMAX=127,
    IDLE=0,
    MAX=255,
    PIMGR=150,
    RMON=250,
    RMONSPIN=200,
    SIMGR=140,
    VIMGR=254
} enum_OSPri;

typedef enum OS_STATE {
    RUNNABLE=2,
    RUNNING=4,
    STOPPED=1,
    WAITING=8
} OS_STATE;

typedef s32 OSId;

typedef struct __OSThreadContext __OSThreadContext, *P__OSThreadContext;

typedef ulonglong u_int64_t;

typedef enum DEFINE_FPSR {
    C=8388608,
    CE=131072,
    CI=4096,
    CO=16384,
    CU=8192,
    CV=65536,
    CZ=32768,
    EI=128,
    EO=512,
    EU=256,
    EV=2048,
    EZ=1024,
    F0=16,
    FI=4,
    FS=16777216,
    FU=8,
    FV=64,
    FZ=32,
    RM=3,
    RN=0,
    RP=2,
    RZ=1
} DEFINE_FPSR;

struct romcopy_struct {
    OSMesg msg;
    struct OSMesgQueue msgQ;
    void * VAddr;
    u32 devAddr;
    u32 Bytes;
};

typedef struct spellVisualsEntry spellVisualsEntry, *PspellVisualsEntry;

struct spellVisualsEntry {
    int SpellID;
    uint flags;
    u16 unk0x8;
    undefined2 unk0xa;
    undefined2 unk0xc;
    undefined2 unk0xe;
    undefined2 unk0x10;
    u8 unk0x12;
    u8 unk0x13;
};

typedef struct SpellVisualsEntry2 SpellVisualsEntry2, *PSpellVisualsEntry2;

typedef short s16;

struct SpellVisualsEntry2 {
    struct playerData * playerDat;
    uint unk0x4;
    s16 unk0x8;
    undefined2 unk0xa;
    short unk0xc;
    u8 unk0xe;
    u8 unk0xf;
    u8 unk0x10;
    u8 unk0x11;
    u8 unk0x12;
    u8 unk0x13;
};

typedef struct WidgetSubstruct8 WidgetSubstruct8, *PWidgetSubstruct8;

struct WidgetSubstruct8 { /* If widget->GetNumber returns 8 */
    byte unk0x0;
    byte unk0x1;
    byte r[2];
    byte g[2];
    byte b[2];
    byte a[2];
    byte unk0xa;
    byte unk0xb;
    byte unk0xc;
    byte unk0xd;
    byte unk0xe;
    byte unk0xf;
};

typedef enum Borg8Enum { /* Sprites/Textures */
    1 pixel?=452,
    10 px Circled Cross=434,
    14px square=455,
    16 px circle=403,
    16 px filled circle=402,
    16 px gradient=450,
    16px gradient=451,
    2 black pixels=453,
    2 horizontal arrows=14166,
    2 pad icon=13777,
    24 px octagon=160,
    28 px soft edge square=454,
    3_4_moon=407,
    42 px box=261,
    66 px highligh 2=244,
    66 px highlight=245,
    Alaron Portait=264,
    Amulet=13757,
    Axe=13765,
    BORG8_CONTROLLER_PAK=247,
    BORG8_CompassEast=26,
    BORG8_CompassNorth=24,
    BORG8_CompassSouth=25,
    BORG8_CompassWest=23,
    BORG8_ENTER_NAME=249,
    BORG8_LicencedByNintendo=250,
    BORG8_compassRing=27,
    Bear portait=274,
    Blue plaque bg=13831,
    Book BG 2=13827,
    Book background=386,
    Boot icon=13769,
    Borg8_PAL_Warning=14275,
    Bow and arrow icon=13770,
    CAMP=221,
    Chaos Scout Portait=284,
    Circlet=13767,
    Cloack Icon=13771,
    Cloud=399,
    Corner gradient=447,
    Crossbone overlay=365,
    Cuccoon=13768,
    CurrDayMarker=220,
    Diplomat icon=388,
    Expansion Pak detected=14168,
    Fire effect?=3424,
    Flag/sythe=13766,
    Giant bat portrait=272,
    Goblin portait=318,
    Godrik portrait=320,
    Gwen Castle Warp gate=161,
    Gwen map overlay=457,
    H2o logo=222,
    Heart Amulet=13759,
    Horse potrait=14423,
    INVENTORY=233,
    IconPotion=13797,
    JOURNAL=230,
    Kendalls hat icon=13784,
    MENU=242,
    Main Font=29,
    Middle-aged male citizen portait=293,
    Minotuar portait=14406,
    No Expansion pak=14169,
    OPTIONS=253,
    PAUSE=254,
    PRESS START=258,
    Parchment BG 2=13832,
    Parchment Background_2=227,
    Parchment Window 2=229,
    Parchment background=226,
    Parchment bg=13829,
    Parchment shadow=228,
    Pause Menu Calender Map=218,
    Pause Menu status=217,
    PortSaidMarker=14270,
    QuestinmarkIcon=13788,
    Ritual=14171,
    SAVE GAME=255,
    SKILLS=236,
    SPELLS=237,
    Shadow portait=361,
    Sheild slot icon=13823,
    Sheridan Portait=362,
    Signpost portait=385,
    Some Face?=3514,
    Spacer=215,
    Spotlight?=13826,
    Square highlight 52=223,
    Staff Slot Icon=13824,
    Start of Map icons=30,
    Sun texture?=418,
    Sundail Cross=442,
    Sundail Moon=440,
    Sword Icon 2=13807,
    Sword slot icon=13825,
    THEATER=256,
    THQ logo=257,
    TRAIN=239,
    Tentacle portait=366,
    Terminor Marker=14272,
    Title Card=259,
    Title Card Shadow=260,
    Ugarit Marker=14273,
    Warning_No_Controller=251,
    Warning_No_Controller_Pak=252,
    abrecan portait=262,
    alchemist icon=387,
    banner portait=384,
    blank space?=248,
    blood drop=423,
    blue hat icon=13783,
    butterfly amulet=13760,
    chrome pendant=13758,
    cloak slot icon=13815,
    cloud 2=400,
    cloud 3=401,
    club icon=13774,
    crecent moon=14239,
    crystal ball icon=13779,
    cyclops_Hurlstar=14422,
    first qarter=406,
    full chestplate=13763,
    full metal chestplate=13764,
    full_moon=408,
    galaxy swirl?=464,
    gemstone icon=13778,
    glove slot icon=13816,
    gradient circle=422,
    green cloack icon=13772,
    green crystal ball icon=13780,
    half moon=14240,
    harp icon=13782,
    healer icon=389,
    helmet slot icon=13817,
    herb icon=13786,
    hide icon=13787,
    horizontal hourglass=426,
    hourglass=421,
    keelin portrait=335,
    key icon=13789,
    key icon 2=13790,
    key icon 3=13791,
    leafy book bg=13830,
    leather breastplate=13761,
    leather glove icon=13781,
    leather hood icon=13785,
    long down arrow=213,
    loremaster icon=390,
    lunar aspect=419,
    mace icon=13793,
    map marker=246,
    mechanic icon=391,
    merchant icon=392,
    metal breastplate=13762,
    musical notes=6842,
    new moon=404,
    parchment icon=13794,
    pause menu bg 2=216,
    pike icon=13795,
    pillar=409,
    pinwheel fruit?=13756,
    plaque BG=13828,
    purple cloack icon=13773,
    ranger icon=393,
    round sheild icon=13803,
    scroll icon=13801,
    sicle icon=13802,
    skull=425,
    snake/horn?=13792,
    solar aspect=420,
    square highlight=243,
    staff icon=13776,
    staff icon 2=13805,
    star=424,
    stealth icon=394,
    sundail moon quarter=436,
    sword icon=13806,
    swrord icon=13775,
    theif icon=395,
    throwing iron icon=13808,
    troubador icon=396,
    up arrow=14544,
    warrior icon=397,
    waxing crecent=405,
    white 10px funnel=428,
    white 10px inversion=430,
    white 10px rings=429,
    white 10px sphere=427,
    white 10x chain=431,
    white ring=127,
    wizard icon=398
} Borg8Enum;

typedef struct Borg_11_header Borg_11_header, *PBorg_11_header;

struct Borg_11_header {
    undefined4 index;
    undefined4 unk0x4;
    void * dat;
    u8 * pointer;
};

typedef struct Borg_12_header Borg_12_header, *PBorg_12_header;

struct Borg_12_header {
    int * instument_offset;
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    void * unk0x8;
    int instrument_count;
    int * other_offset;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    int unk0x18;
    int unk0x1c;
};

typedef struct borg_13_header borg_13_header, *Pborg_13_header;

struct borg_13_header {
    enum borg13Enum ID;
    int unk0x4;
    void * unk0x8;
    u8 unk0xc;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
    struct borg_13_data * borg13_dat;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
};

typedef struct Borg_1_Header Borg_1_Header, *PBorg_1_Header;

struct Borg_1_Header {
    int unk0x0;
    undefined4 unk0x4;
    int unk0x8;
    void * unk0xc;
    ushort * unk0x10;
};

typedef struct borg_2_header borg_2_header, *Pborg_2_header;

struct borg_2_header {
    u8 unk0x0;
    u8 unk0x1;
    u8 unk0x2;
    u8 unk0x3;
    int unk0x4;
    undefined4 unk0x8;
    undefined4 unk0xc;
    float[4][4] * unk0x10;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    u8 unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
    u8 unk0x1c;
    u8 unk0x1d;
    u8 unk0x1e;
    u8 unk0x1f;
    u8 unk0x20;
    u8 unk0x21;
    u8 unk0x22;
    u8 unk0x23;
    u8 unk0x24;
    u8 unk0x25;
    u8 unk0x26;
    u8 unk0x27;
    u8 unk0x28;
    u8 unk0x29;
    u8 unk0x2a;
    u8 unk0x2b;
    int * unk0x2c;
    int unk0x30;
    int unk0x34;
    u8 unk0x38;
    u8 unk0x39;
    u8 unk0x3a;
    u8 unk0x3b;
    int * unk0x3c;
    int unk0x40;
    u8 unk0x44;
    u8 unk0x45;
    u8 unk0x46;
    u8 unk0x47;
    u8 unk0x48;
    u8 unk0x49;
    u8 unk0x4a;
    u8 unk0x4b;
    u8 unk0x4c;
    u8 unk0x4d;
    u8 unk0x4e;
    u8 unk0x4f;
    void * unk0x50;
    void * unk0x54;
    int unk0x58;
};

typedef struct borg_short borg_short, *Pborg_short;

struct borg_short {
    enum borg13Enum borg_13;
    u16 pad;
    short some_num;
};

typedef struct combat_aiscore combat_aiscore, *Pcombat_aiscore;

typedef struct CombatEntity CombatEntity, *PCombatEntity;

typedef byte u8;


typedef enum Struct_char_flags {
    flag1=1,
    flag10=512,
    flag11=1024,
    flag12=2048,
    flag13=4096,
    flag14=8192,
    flag15=16384,
    flag16=32768,
    flag2=2,
    flag3=4,
    flag4=8,
    flag5=16,
    flag6=32,
    flag7=64,
    flag8=128,
    flag9=256
} Struct_char_flags;

typedef struct resist_float resist_float, *Presist_float;

typedef struct CharSheet CharSheet, *PCharSheet;

typedef struct combat_ai combat_ai, *Pcombat_ai;

typedef struct charExp charExp, *PcharExp;

typedef struct CharStats CharStats, *PCharStats;

typedef struct CharSkills CharSkills, *PCharSkills;

typedef struct temp_armor temp_armor, *Ptemp_armor;

typedef struct Temp_weapon Temp_weapon, *PTemp_weapon;

typedef struct CharGear CharGear, *PCharGear;

typedef struct spellbook spellbook, *Pspellbook;

typedef struct effects effects, *Peffects;

typedef struct Potion_effect Potion_effect, *PPotion_effect;

typedef enum MagicSchoolEnum {
    Chaos=0,
    Elemental=1,
    NONE=4,
    Naming=2,
    Necromancy=3,
    Star=5
} MagicSchoolEnum;

typedef enum CharSheetFlags {
    IsSolar=4,
    Protag=1
} CharSheetFlags;

typedef enum AspectEnum {
    LUNAR=1,
    LUNAR_MAGIC=4,
    NONE=0,
    SOLAR=2,
    SOLAR_MAGIC=3
} AspectEnum;

typedef struct SpellCharges SpellCharges, *PSpellCharges;

typedef struct Temp_enchant Temp_enchant, *PTemp_enchant;

typedef enum WeaponClassEnum {
    Bite=0,
    Breath=1,
    Claw=2,
    Hafted=3,
    Missle=4,
    Pole=5,
    Spit=6,
    Sting=7,
    Sword=8,
    Thrown=9,
    Tusk=10
} WeaponClassEnum;

typedef struct temp_gear temp_gear, *Ptemp_gear;

typedef struct Temp_spell Temp_spell, *PTemp_spell;

typedef enum SpellEnum {
    AcidBolt=24,
    AirSheild=3,
    ControlElem=4,
    DragonFlames=6,
    EarthSmite=7,
    Immolation=0,
    NONE=255,
    auraOfDeath=25,
    banishing=15,
    brilliance=13,
    charming=16,
    cheatDeath=23,
    clumsiness=52,
    controlMarquis=17,
    controlZombies=27,
    crushingDeath=28,
    darkness=29,
    debilitation=5,
    detectMoonPhase=49,
    detectSunPhase=50,
    detectingTraps=18,
    dexterity=51,
    dispelElemental=42,
    dispelNaming=43,
    dispelNecro=44,
    dispelStar=45,
    endurance=19,
    escape=1,
    exhaustion=31,
    fireball=8,
    frozenDoom=53,
    haste=30,
    light=54,
    lightning=9,
    mirror=37,
    opening=20,
    photosynthesis=46,
    poison=36,
    removePoison=2,
    senseAura=21,
    solarWraith=47,
    spiritSheild=35,
    stamina=32,
    starlightSheild=48,
    stealth=55,
    stellarGravity=56,
    strength=10,
    stupidity=14,
    tapStamina=33,
    teleportation=12,
    vsElemental=38,
    vsNaming=39,
    vsNecromancy=40,
    vsStar=41,
    wallOfBones=34,
    weakness=22,
    webOfStarlight=57,
    whitefire=58,
    wind=11,
    wraithTouch=26
} SpellEnum;

typedef enum MagicCastedEnum {
    ALL=2,
    ONE=1,
    RANK=3,
    SELF=0
} MagicCastedEnum;

typedef enum MagicTargetEnum {
    All=4,
    All_in_Area=3,
    Enemy_in_Area=2,
    Party_in_Area=1,
    outside_Combat=0
} MagicTargetEnum;

typedef enum MigicCostEnum {
    Gemstone=3,
    Herb=2,
    NONE=0,
    Spice=1
} MigicCostEnum;

struct CharGear {
    struct temp_gear * * pItem;
    char num_used;
    byte unk0x5;
    u8 unk0x6;
    u8 unk0x7;
};

struct Temp_spell { /* spell data loaded into character. */
    struct ItemID id;
    u8 unk0x2;
    u8 unk0x3;
    char * name;
    u8 unk0x8;
    u8 unk0x9;
    u8 unk0xa;
    u8 unk0xb;
    undefined4 a;
    undefined4 b;
    byte level;
    enum MagicSchoolEnum school;
    byte damage;
    byte stamina;
    enum MagicCastedEnum cast;
    enum MagicTargetEnum target;
    byte wizard;
    enum AspectEnum aspect;
    byte range;
    enum MigicCostEnum cost;
    ushort exp_modifyer;
    byte aspect_flag; /* ram0x1f */
    u8 unk0x21;
    u8 unk0x22;
    u8 unk0x23;
};

struct combat_aiscore {
    byte spell_pri;
    byte x;
    byte y;
    byte unk0x3;
    struct CombatEntity * combatEnt;
};

struct resist_float { /* resistance and element when loaded into temp item */
    enum ElementEnum element;
    byte pad[3];
    float percent;
};

struct CharSkills { /* Skill and weapon levels. Also sheild. */
    byte Skill_base[12];
    byte Weapon_Base[11];
    byte Sheild_Base;
    byte Skill_modded[12];
    byte Weapon_modded[11];
    byte Sheild_modded;
};

struct CombatEntity {
    Vec2 coord;
    Vec2 coord2;
    uint unk0x10;
    s8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    Vec2 unk0x18;
    byte index;
    byte move_length;
    u8 unk0x22;
    byte unk0x23;
    byte unk0x24;
    byte rangeMulti;
    byte unk0x26;
    enum PotionEnum item;
    byte unk0x28;
    byte damage;
    byte unk0x2a;
    u8 unk0x2b;
    enum Struct_char_flags flags;
    u8 unk0x2e;
    u8 unk0x2f;
    struct resist_float resists[2];
    struct CharSheet * CharSheet;
    struct combat_ai * combat_ai_pointer;
    float E[3];
    u8 unk0x54;
    u8 unk0x55;
    u8 unk0x56;
    u8 unk0x57;
    u8 unk0x58;
    u8 unk0x59;
    u8 unk0x5a;
    u8 unk0x5b;
    u8 unk0x5c;
    u8 unk0x5d;
    u8 unk0x5e;
    u8 unk0x5f;
    u8 unk0x60;
    u8 unk0x61;
    u8 unk0x62;
    u8 unk0x63;
    u8 unk0x64;
    u8 unk0x65;
    u8 unk0x66;
    u8 unk0x67;
    u8 unk0x68;
    u8 unk0x69;
    u8 unk0x6a;
    u8 unk0x6b;
    u8 unk0x6c;
    u8 unk0x6d;
    u8 unk0x6e;
    u8 unk0x6f;
    u8 unk0x70;
    u8 unk0x71;
    u8 unk0x72;
    u8 unk0x73;
    u8 unk0x74;
    u8 unk0x75;
    u8 unk0x76;
    u8 unk0x77;
    u8 unk0x78;
    u8 unk0x79;
    u8 unk0x7a;
    u8 unk0x7b;
    u8 unk0x7c;
    u8 unk0x7d;
    u8 unk0x7e;
    u8 unk0x7f;
    u8 unk0x80;
    u8 unk0x81;
    u8 unk0x82;
    u8 unk0x83;
    undefined4 notboss;
    byte unk0x88;
    byte unk0x89;
    byte throwingFlag;
    u8 unk0x8b;
};

struct spellbook { /* pointer and count of spells */
    struct Temp_spell * spells;
    byte spell_count;
};

struct SpellCharges {
    struct Temp_spell * Spell;
    byte Charges;
    byte align[3];
};

struct temp_armor {
    struct ItemID id;
    u8 unk0x2;
    u8 unk0x3;
    char * name;
    enum AspectEnum aspect;
    u8 unk0x9;
    ushort price;
    byte[2] * statMod;
    struct SpellCharges * spell;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    byte unk1;
    byte[2] * skillmod;
    struct Temp_enchant * enchantment;
    struct resist_float * resist;
    byte DEF;
    byte Protect;
    byte dex;
    byte stealth;
    u8 unk0x28;
    u8 unk0x29;
    u8 unk0x2a;
    u8 unk0x2b;
};

struct Potion_effect {
    enum PotionEnum ID;
    byte unk1;
    byte pad[2];
    uint timer;
    undefined4 unk2;
};

struct CharSheet { /* Skills, stats and misc of Characters */
    struct ItemID ID;
    char a;
    char b;
    char * name; /* pointer to entityDB entry */
    char d;
    byte lv?;
    byte pad[10];
    struct charExp * EXP;
    struct CharStats * Stats; /* base and modded stats of character */
    struct CharSkills * Skills; /* skill and weapon levels */
    struct temp_armor * * armor;
    struct Temp_weapon * weapons;
    struct CharGear * pItemList;
    struct spellbook * spellbook; /* list and count of known spells */
    undefined4 unk0x30;
    struct effects * effects; /* spell effects on character */
    struct Potion_effect * * potion_effects;
    byte some_rand_val;
    byte spellSwitch;
    byte currSpell;
    u8 unk0x3f;
    u8 unk0x40;
    u8 unk0x41;
    u8 unk0x42;
    u8 unk0x43;
    struct Borg_8_header * portait;
};

struct charExp { /* data containing EXP, School, Aspect and more. */
    byte rom0x2b; /* Ent_rom data 0x2b. dunno if used */
    enum MagicSchoolEnum school;
    byte protection; /* protection, looks like */
    byte damage; /* damage seems to be */
    uint total; /* for level up */
    uint spending; /* for training */
    enum CharSheetFlags flags; /* set for alaron and aspect */
    byte f;
    byte g;
    byte h;
};

struct Temp_weapon {
    struct ItemID id;
    u8 unk0x2;
    u8 unk0x3;
    char * name;
    enum AspectEnum aspect;
    u8 unk0x9;
    ushort price;
    byte[2] * Stat;
    struct SpellCharges * spell;
    char unk0x14;
    char unk0x15;
    u8 unk0x16;
    byte req Str;
    byte[2] * SkillMod;
    struct Temp_enchant * enchantment;
    struct resist_float * resist;
    enum WeaponClassEnum weaponType;
    byte hit;
    byte damage;
    byte range;
    byte animation;
    enum ElementEnum element;
    u8 unk0x2a;
    u8 unk0x2b;
};

struct temp_gear {
    struct ItemID id;
    u8 unk0x2;
    u8 unk0x3;
    char * name;
    enum AspectEnum aspect;
    u8 unk0x9;
    ushort price;
    byte[2] * statmod;
    struct SpellCharges * pSpell;
    byte damage;
    byte Protection;
    byte STR;
    byte INT;
    byte[2] * skillMod;
    void * unk0x1c;
    struct resist_float * resist;
};

struct effects {
    struct Temp_enchant * list[15];
};

struct Temp_enchant {
    enum SpellEnum index;
    byte lv;
    enum MagicSchoolEnum school;
    byte unk0x3;
    undefined4 unk0x4;
    uint timer;
    u8 unk0xc;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
    u8 unk0x10;
    u8 unk0x11;
    u8 unk0x12;
    u8 unk0x13;
    undefined4 unk0x14;
};

struct CharStats { /* Stat Arrays of Party Members */
    byte Base_Stats[7]; /* init'd or pirchased stat points */
    byte statArray2[7];
    byte statArray3[7];
    byte Modded_Stats[7]; /* modded by equipment, spells, ect. */
};

struct combat_ai {
    u8 unk0x0;
    u8 unk0x1;
    u8 unk0x2;
    u8 unk0x3;
    char unk0x4;
    char entIndex;
    byte morale;
    char unk0x7;
    byte command;
    byte unk0x9;
    byte unk0xa;
    byte unk0xb;
    byte unk0xc;
    byte unk0xd;
    byte unk0xe;
    byte unk0xf;
    byte unk0x10;
    byte unk0x11;
    byte unk0x12;
    byte unk0x13;
    struct CombatEntity * combatEnt;
    int unk0x18;
};

typedef struct combat_marker combat_marker, *Pcombat_marker;

struct combat_marker {
    struct AnimationData * borg;
    vec3 coords;
    float unk0x10;
    int unk0x14;
    byte unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
};

typedef struct combat_substruct combat_substruct, *Pcombat_substruct;

struct combat_substruct {
    byte array1[100][100];
    byte array2[100][100];
    ushort short1;
    byte byteA;
    byte byteB;
    byte byteC;
    byte byteD;
    char byteE;
    u8 unk0x4e27;
};

typedef struct combat_substruct_2 combat_substruct_2, *Pcombat_substruct_2;

struct combat_substruct_2 {
    int arrayA[18];
    int arrayB[18];
    byte arrayC[18];
    char unk0xa2;
    byte unk0xa3;
    byte arrayBCount;
    byte unk0xa5;
    char entindex;
    byte unk0xa7;
};

typedef struct CombatAi_command CombatAi_command, *PCombatAi_command;

struct CombatAi_command {
    ulong (* cmd)(void);
    uint unk;
};

typedef struct CombatAttackVisuals_struct CombatAttackVisuals_struct, *PCombatAttackVisuals_struct;

struct CombatAttackVisuals_struct {
    pointer pointer;
    byte * bytearray;
    undefined1 iFreeVisual;
    byte pad[3];
};

typedef struct combatGui_struct combatGui_struct, *PcombatGui_struct;

struct combatGui_struct {
    struct widgetStruct * unk0x0;
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    struct ItemID unk0x8;
    byte unk0xa;
    byte unk0xb;
    undefined4 unk0xc;
    u8 unk0x10;
    u8 unk0x11;
    u8 unk0x12;
    u8 unk0x13;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
};

typedef struct combatGui_struct_2 combatGui_struct_2, *PcombatGui_struct_2;

struct combatGui_struct_2 {
    struct widgetStruct * unk0x0;
    short unk0x4;
    short unk0x6;
    short unk0x8;
    short unk0xa;
    int unk0xc;
    undefined4 unk0x10;
    int unk0x14;
};

typedef struct CombatStatIndicator_struct CombatStatIndicator_struct, *PCombatStatIndicator_struct;

struct CombatStatIndicator_struct {
    struct Borg_1_Header * borg1_array[10];
    pointer pointer;
    byte * array;
    byte index;
    byte pad[3];
};

typedef struct combatStrings combatStrings, *PcombatStrings;
/*
struct combatStrings {
    char * begins action;
    char * party fless;
    char * party wins;
    char * space;
    char * they heal;
    char * they gain 1 hp;
    char * they gain HP;
    char * they failed heal;
    char * they avoid;
    char * they attack;
    char * they hit;
    char * crit attack;
    char * they lose  hp;
    char * they lose1HP;
    char * they miss;
    char * potion already used;
    char * potion worked;
    char * potion failed;
    char * potion full stamina;
    char * they miss_;
    char * they died;
    char * potion Exploded;
    char * No Spell Available;
    char * not enough spell ingredients;
    char * not enough Stam for Spell;
    char * they failed spell;
    char * they resist spell;
    char * they cast spell;
    char * spell was cast;
    char * I'M POISONED!!!;
    char * they flee;
    char * they join battle;
    char * shadow's vortex;
    char * they rest;
    char * they swap weapons;
    char * x's details;
    char * unk0x90;
    char * unk0x94;
    char * unk0x98;
    char * unk0x9c;
    char * unk0xa0;
    char * unk0xa4;
    char * unk0xa8;
    char * unk0xac;
    char * unk0xb0;
    char * unk0xb4;
    char * unk0xb8;
    char * unk0xbc;
    char * already performing;
    char * too tired to perform;
    char * they failed troubador;
    char * they perform;
    char * they still perform;
    char * enemy wins by default;
    char * flee_d;
    char * s_u_c;
    char * (string);
    char * they fail;
    char * they're banished;
    char * enemy reinforcments flee;
    char * Shadow dissipates;
    char * good;
    char * bad;
    char * Cheated Death;
    char * unk0x100;
};*/

typedef struct CombatStruct CombatStruct, *PCombatStruct;

typedef struct EncounterDat EncounterDat, *PEncounterDat;

typedef struct Inventory_struct Inventory_struct, *PInventory_struct;

typedef struct inv_funcs inv_funcs, *Pinv_funcs;

typedef struct Inventory_item Inventory_item, *PInventory_item;

typedef ulonglong u64;

struct EncounterDat { /* enemy encounter data */
    struct ItemID enemy_entities[12]; /* entitty id's of enemies */
    struct ItemID globalLoot; /* chestdb of guarunteed loot */
    enum EventFlag EncounterID;
    byte unk0x1c;
    u8 unk0x1d;
    ushort VoxelIndex;
    undefined2 mapDatA;
    undefined2 MapSAhortA;
    undefined2 MapShortB;
    byte collisionByte;
    byte battlefield;
    byte unk0x28;
    byte BossShadow; /* fighting a Boss or the Shadow */
    enum EventFlag VoxelFlagA;
    u8 unk0x2c;
    u8 unk0x2d;
    u8 unk0x2e;
    u8 unk0x2f;
};

struct inv_funcs {
    u64 blank;
    struct Method unk0x8;
    struct Method clear_inventory;
    struct Method clear_item;
    struct Method unk0x20;
    struct Method unk0x28;
    struct Method add_to_inv;
    struct Method get_some_bool;
    struct Method get_inv_quant;
    struct Method get_inv_max;
    struct Method get_inv_index;
    struct Method get_inv_slot;
    struct Method search;
    struct Method some_getter;
};

struct CombatStruct { /* combat structure. needs more study */
    u8 unk0x0;
    byte EntCount;
    byte unk0x2;
    byte playerCount;
    byte playersAlive;
    byte enemyCount;
    byte EnemiesAlive;
    byte enemy_index;
    undefined4 unk0x8;
    int leaderDead;
    byte leaderIndex;
    byte leaderMorale;
    byte flask_byte;
    byte unk0x13;
    byte some_index;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    float floatA;
    float floatB;
    uint gold pool;
    uint EXP_pool;
    struct EncounterDat * encounter_dat;
    struct CombatEntity * current_Ent;
    pointer combatTurn;
    undefined4 unk0x34;
    pointer pointer_0x38;
    struct combat_substruct substruct;
    struct combat_substruct_2 substruct2[2];
    struct Inventory_struct * loot_pool;
    struct widgetStruct * widget0x4fb8;
    undefined4 unk0x4fbc;
    struct combatStrings * textArray;
    char textboxes[3][256];
    undefined4 unk0x52c4;
    undefined4 unk0x52c8;
    undefined4 unk0x52cc;
    struct CombatEntity * combatEnts;
    pointer pointer_r;
    struct CharSheet * CharSheets;
    u8 unk0x52dc;
    u8 unk0x52dd;
    u8 unk0x52de;
    u8 unk0x52df;
    u8 unk0x52e0;
    u8 unk0x52e1;
    u8 unk0x52e2;
    u8 unk0x52e3;
    u8 unk0x52e4;
    u8 unk0x52e5;
    u8 unk0x52e6;
    u8 unk0x52e7;
    u8 unk0x52e8;
    u8 unk0x52e9;
    u8 unk0x52ea;
    u8 unk0x52eb;
    u8 unk0x52ec;
    u8 unk0x52ed;
    u8 unk0x52ee;
    u8 unk0x52ef;
    u8 unk0x52f0;
    u8 unk0x52f1;
    u8 unk0x52f2;
    u8 unk0x52f3;
    u8 unk0x52f4;
    u8 unk0x52f5;
    u8 unk0x52f6;
    u8 unk0x52f7;
    u8 unk0x52f8;
    u8 unk0x52f9;
    u8 unk0x52fa;
    u8 unk0x52fb;
    u8 unk0x52fc;
    u8 unk0x52fd;
    u8 unk0x52fe;
    u8 unk0x52ff;
    u8 unk0x5300;
    u8 unk0x5301;
    u8 unk0x5302;
    u8 unk0x5303;
    u8 unk0x5304;
    u8 unk0x5305;
    u8 unk0x5306;
    u8 unk0x5307;
    u8 unk0x5308;
    u8 unk0x5309;
    u8 unk0x530a;
    u8 unk0x530b;
    u8 unk0x530c;
    u8 unk0x530d;
    u8 unk0x530e;
    u8 unk0x530f;
    u8 unk0x5310;
    u8 unk0x5311;
    u8 unk0x5312;
    u8 unk0x5313;
    u8 unk0x5314;
    u8 unk0x5315;
    u8 unk0x5316;
    u8 unk0x5317;
    undefined8 entity_XY; /* vec2 here */
    byte unk0x5320; /* first 2 entries */
    byte unk0x5321; /* in array of 2byte(?) entries */
    u8 unk0x5322;
    u8 unk0x5323;
    u8 unk0x5324;
    u8 unk0x5325;
    u8 unk0x5326;
    u8 unk0x5327;
    u8 unk0x5328;
    u8 unk0x5329;
    u8 unk0x532a;
    u8 unk0x532b;
    u8 unk0x532c;
    u8 unk0x532d;
    u8 unk0x532e;
    u8 unk0x532f;
    u8 unk0x5330;
    u8 unk0x5331;
    u8 unk0x5332;
    u8 unk0x5333;
    u8 unk0x5334;
    u8 unk0x5335;
    u8 unk0x5336;
    u8 unk0x5337;
    u8 unk0x5338;
    u8 unk0x5339;
    u8 unk0x533a;
    u8 unk0x533b;
    u8 unk0x533c;
    u8 unk0x533d;
    u8 unk0x533e;
    u8 unk0x533f;
    u8 unk0x5340;
    u8 unk0x5341;
    u8 unk0x5342;
    u8 unk0x5343;
    u8 unk0x5344;
    u8 unk0x5345;
    u8 unk0x5346;
    u8 unk0x5347;
    u8 unk0x5348;
    u8 unk0x5349;
    u8 unk0x534a;
    u8 unk0x534b;
    u8 unk0x534c;
    u8 unk0x534d;
    u8 unk0x534e;
    u8 unk0x534f;
    u8 unk0x5350;
    u8 unk0x5351;
    u8 unk0x5352;
    u8 unk0x5353;
    u8 unk0x5354;
    u8 unk0x5355;
    u8 unk0x5356;
    u8 unk0x5357;
    u8 unk0x5358;
    u8 unk0x5359;
    u8 unk0x535a;
    u8 unk0x535b;
    u8 unk0x535c;
    u8 unk0x535d;
    u8 unk0x535e;
    u8 unk0x535f;
    u8 unk0x5360;
    u8 unk0x5361;
    u8 unk0x5362;
    u8 unk0x5363;
    u8 unk0x5364;
    u8 unk0x5365;
    u8 unk0x5366;
    u8 unk0x5367;
    u8 unk0x5368;
    u8 unk0x5369;
    u8 unk0x536a;
    u8 unk0x536b;
    u8 unk0x536c;
    u8 unk0x536d;
    u8 unk0x536e;
    u8 unk0x536f;
    u8 unk0x5370;
    u8 unk0x5371;
    u8 unk0x5372;
    u8 unk0x5373;
    u8 unk0x5374;
    u8 unk0x5375;
    u8 unk0x5376;
    u8 unk0x5377;
    u8 unk0x5378;
    u8 unk0x5379;
    u8 unk0x537a;
    u8 unk0x537b;
    u8 unk0x537c;
    u8 unk0x537d;
    u8 unk0x537e;
    u8 unk0x537f;
    u8 unk0x5380;
    u8 unk0x5381;
    u8 unk0x5382;
    u8 unk0x5383;
    u8 unk0x5384;
    u8 unk0x5385;
    u8 unk0x5386;
    u8 unk0x5387;
    u8 unk0x5388;
    u8 unk0x5389;
    u8 unk0x538a;
    u8 unk0x538b;
    u8 unk0x538c;
    u8 unk0x538d;
    u8 unk0x538e;
    u8 unk0x538f;
    u8 unk0x5390;
    u8 unk0x5391;
    u8 unk0x5392;
    u8 unk0x5393;
    u8 unk0x5394;
    u8 unk0x5395;
    u8 unk0x5396;
    u8 unk0x5397;
    u8 unk0x5398;
    u8 unk0x5399;
    u8 unk0x539a;
    u8 unk0x539b;
    u8 unk0x539c;
    u8 unk0x539d;
    u8 unk0x539e;
    u8 unk0x539f;
    u8 unk0x53a0;
    u8 unk0x53a1;
    u8 unk0x53a2;
    u8 unk0x53a3;
    u8 unk0x53a4;
    u8 unk0x53a5;
    u8 unk0x53a6;
    u8 unk0x53a7;
    u8 unk0x53a8;
    u8 unk0x53a9;
    u8 unk0x53aa;
    u8 unk0x53ab;
    u8 unk0x53ac;
    u8 unk0x53ad;
    u8 unk0x53ae;
    u8 unk0x53af;
    u8 unk0x53b0;
    u8 unk0x53b1;
    u8 unk0x53b2;
    u8 unk0x53b3;
    u8 unk0x53b4;
    u8 unk0x53b5;
    u8 unk0x53b6;
    u8 unk0x53b7;
    u8 unk0x53b8;
    u8 unk0x53b9;
    u8 unk0x53ba;
    u8 unk0x53bb;
    u8 unk0x53bc;
    u8 unk0x53bd;
    u8 unk0x53be;
    u8 unk0x53bf;
    u8 unk0x53c0;
    u8 unk0x53c1;
    u8 unk0x53c2;
    u8 unk0x53c3;
    u8 unk0x53c4;
    u8 unk0x53c5;
    u8 unk0x53c6;
    u8 unk0x53c7;
    u8 unk0x53c8;
    u8 unk0x53c9;
    u8 unk0x53ca;
    u8 unk0x53cb;
    u8 unk0x53cc;
    u8 unk0x53cd;
    u8 unk0x53ce;
    u8 unk0x53cf;
    u8 unk0x53d0;
    u8 unk0x53d1;
    u8 unk0x53d2;
    u8 unk0x53d3;
    u8 unk0x53d4;
    u8 unk0x53d5;
    u8 unk0x53d6;
    u8 unk0x53d7;
    u8 unk0x53d8;
    u8 unk0x53d9;
    u8 unk0x53da;
    u8 unk0x53db;
    u8 unk0x53dc;
    u8 unk0x53dd;
    u8 unk0x53de;
    u8 unk0x53df;
    u8 unk0x53e0;
    u8 unk0x53e1;
    u8 unk0x53e2;
    u8 unk0x53e3;
    u8 unk0x53e4;
    u8 unk0x53e5;
    u8 unk0x53e6;
    u8 unk0x53e7;
    u8 unk0x53e8;
    u8 unk0x53e9;
    u8 unk0x53ea;
    u8 unk0x53eb;
    u8 unk0x53ec;
    u8 unk0x53ed;
    u8 unk0x53ee;
    u8 unk0x53ef;
    u8 unk0x53f0;
    u8 unk0x53f1;
    u8 unk0x53f2;
    u8 unk0x53f3;
    u8 unk0x53f4;
    u8 unk0x53f5;
    u8 unk0x53f6;
    u8 unk0x53f7;
    u8 unk0x53f8;
    u8 unk0x53f9;
    u8 unk0x53fa;
    u8 unk0x53fb;
    u8 unk0x53fc;
    u8 unk0x53fd;
    u8 unk0x53fe;
    u8 unk0x53ff;
    u8 unk0x5400;
    u8 unk0x5401;
    u8 unk0x5402;
    u8 unk0x5403;
    u8 unk0x5404;
    u8 unk0x5405;
    u8 unk0x5406;
    u8 unk0x5407;
    u8 unk0x5408;
    u8 unk0x5409;
    u8 unk0x540a;
    u8 unk0x540b;
    u8 unk0x540c;
    u8 unk0x540d;
    u8 unk0x540e;
    u8 unk0x540f;
    u8 unk0x5410;
    u8 unk0x5411;
    u8 unk0x5412;
    u8 unk0x5413;
    u8 unk0x5414;
    u8 unk0x5415;
    u8 unk0x5416;
    u8 unk0x5417;
    u8 unk0x5418;
    u8 unk0x5419;
    u8 unk0x541a;
    u8 unk0x541b;
    u8 unk0x541c;
    u8 unk0x541d;
    u8 unk0x541e;
    u8 unk0x541f;
    u8 unk0x5420;
    u8 unk0x5421;
    u8 unk0x5422;
    u8 unk0x5423;
    u8 unk0x5424;
    u8 unk0x5425;
    u8 unk0x5426;
    u8 unk0x5427;
    u8 unk0x5428;
    u8 unk0x5429;
    u8 unk0x542a;
    u8 unk0x542b;
    u8 unk0x542c;
    u8 unk0x542d;
    u8 unk0x542e;
    u8 unk0x542f;
    u8 unk0x5430;
    u8 unk0x5431;
    u8 unk0x5432;
    u8 unk0x5433;
    u8 unk0x5434;
    u8 unk0x5435;
    u8 unk0x5436;
    u8 unk0x5437;
    u8 unk0x5438;
    u8 unk0x5439;
    u8 unk0x543a;
    u8 unk0x543b;
    undefined4 reinforcments_flee_flag;
    int refpoints_flee_flag;
    byte unk0x5444[4];
    undefined4 renderTicker;
};

struct Inventory_item {
    struct ItemID ID;
    u8 unk0x2;
    u8 unk0x3;
    u8 * * item data;
    u8 unk0x8;
    u8 unk0x9;
    u8 unk0xa;
    u8 unk0xb;
    pointer pointer?;
    undefined4 unk0x10;
    undefined4 Quantity?;
};

struct Inventory_struct {
    struct inv_funcs * Functions;
    struct Inventory_item inv_slots[252];
    int quantity;
};

typedef struct CombatTargetVisuals_struct CombatTargetVisuals_struct, *PCombatTargetVisuals_struct;

struct CombatTargetVisuals_struct {
    struct astruct_6 * pointer;
    uint entCount;
};

typedef struct widget_child_3 widget_child_3, *Pwidget_child_3;

typedef struct widget_child_2 widget_child_2, *Pwidget_child_2;

typedef struct unkGuiSubstruct unkGuiSubstruct, *PunkGuiSubstruct;

struct unkGuiSubstruct {
    undefined4 unk0x0;
    struct astruct_7 * * ptr;
    undefined4 present;
    int size;
};

struct widget_child_3 {
    struct widgetStruct base;
    struct widgetStruct * unk0x7c[4];
    undefined4 unk0x8c;
    byte unk0x90;
    byte partyPicker;
    byte unk0x92;
    u8 unk0x93;
    undefined4 unk0x94;
    struct widget_child_2 * unk0x98;
    undefined4 unk0x9c;
    undefined4 unk0xa0;
    u8 unk0xa4;
    u8 unk0xa5;
    u8 unk0xa6;
    u8 unk0xa7;
    struct widgetStruct * unk0xa8;
    struct widgetStruct * unk0xac;
    struct unkGuiSubstruct unk0xb0;
};

struct widget_child_2 {
    struct widgetStruct base;
    struct widgetStruct * title_widget;
    struct widgetStruct * unk0x80;
    u8 unk0x84;
    u8 unk0x85;
    u8 unk0x86;
    u8 unk0x87;
    byte partyPicker;
    u8 unk0x89;
    u8 unk0x8a;
    u8 unk0x8b;
    undefined4 unk0x8c;
    u8 unk0x90;
    u8 unk0x91;
    u8 unk0x92;
    u8 unk0x93;
    u8 unk0x94;
    u8 unk0x95;
    u8 unk0x96;
    u8 unk0x97;
    u8 unk0x98;
    u8 unk0x99;
    u8 unk0x9a;
    u8 unk0x9b;
};

typedef struct armour_RAM armour_RAM, *Parmour_RAM;

typedef enum StatEnum {
    DEX=2,
    END=3,
    INT=0,
    LV=6,
    NONE=255,
    STAM=5,
    STR=4,
    WIL=1
} StatEnum;

typedef enum SkillEnum {
    Alchemist=0,
    Diplomat=1,
    Healer=2,
    Loremaster=3,
    Mechanic=4,
    Merchant=5,
    NONE=255,
    Ranger=6,
    Stealth=7,
    Theif=8,
    Troubadour=9,
    Warrior=10,
    Wizard=11
} SkillEnum;

struct armour_RAM {
    struct ItemID ID;
    char name[23];
    byte is0;
    byte slot;
    byte defence;
    byte protection;
    byte dex;
    byte rom0x1d;
    byte stealth;
    ushort price;
    byte expBonus;
    enum AspectEnum aspect;
    enum StatEnum stat;
    char statNum;
    enum SkillEnum skill;
    char skillNum;
    enum SpellEnum spell;
    byte spellLV;
    byte SpellCharge; /* 10 for stardrake */
    enum SpellEnum magic;
    byte magic LV;
    enum ElementEnum element;
    u16 align;
    float resist percent;
};

typedef struct DialougEnt_RAM DialougEnt_RAM, *PDialougEnt_RAM;

struct DialougEnt_RAM {
    struct ItemID ID;
    char name[22];
    byte a; /* unused, set to 0 */
    byte b;
};

typedef struct Entity_Ram Entity_Ram, *PEntity_Ram;

typedef enum EntityCatEnum { /* Entity Categories */
    Chaos_Enemy=5,
    Generic_NPC=0,
    Humanoid=1,
    Named_NPC=2,
    Natural_Enemy=6,
    Party_Character=3
} EntityCatEnum;

struct Entity_Ram { /* entity data in Ram */
    struct ItemID ID;
    char Name[21];
    enum EntityCatEnum Category;
    enum CharSheetFlags unk0x18; /* 2 bits determined by rom0x2d */
    byte rom0x2b;
    enum AspectEnum aspect;
    byte Morale; /* something to do with dying? */
    byte Level;
    byte BaseDamage; /* rom0x4d */
    enum MagicSchoolEnum School;
    byte BaseProtect; /* sheild related? */
    byte unk0x20; /* made to float */
    byte unk0x21;
    byte Skills[12];
    byte Weapon prof[11];
    byte stats[7];
    struct ItemID weapon[3];
    struct ItemID spells[5];
    byte Spell_levels[5];
    byte unk0x55[5]; /* rom0x68 */
    ushort unk0x5a; /* rom0x6d */
    ushort unk0x5c;
    struct ItemID Armor;
    struct ItemID Sheild;
    s8 sheildStat;
    enum ElementEnum Resist[2];
    byte align[3];
    float resistAmmount[2];
    ushort FFs[4]; /* supposed to load something, but ends up blank */
    byte unk0x78[4];
    ushort EXP;
    byte loot_Category;
    u8 unk0x7f;
};

typedef struct Gear_RAM Gear_RAM, *PGear_RAM;

struct Gear_RAM {
    struct ItemID ID;
    char name[20];
    byte is 0;
    byte unk0x17;
    ushort exp_multi;
    byte damage;
    byte Protection;
    byte STR;
    byte INT;
    ushort price;
    enum AspectEnum aspect;
    enum StatEnum stat;
    byte StatMod;
    enum SkillEnum skill;
    byte SkillMod;
    byte spell;
    byte spellVal1;
    byte spellVal2;
    byte magic;
    byte magicAmmount;
    enum ElementEnum elementResist;
    u8 unk0x2b;
    float ResistPercent;
};

typedef struct Loot_RAM Loot_RAM, *PLoot_RAM;

struct Loot_RAM { /* Chestdb loaded into RAM */
    char Name[20];
    char Is0;
    char unk0x15;
    struct ItemID ID;
    ushort Gold lo;
    ushort Gold Hi;
    byte armorDrop;
    byte sheildDrop;
    byte weaponDrop[3];
    byte reagentchance;
    byte reagentLlo;
    byte reagentHi;
    struct ItemID itemDrops[6];
    byte itemDropChances[6];
    byte itemLo[2];
    byte itemHi[2];
};

typedef struct shop_ram shop_ram, *Pshop_ram;

struct shop_ram {
    struct ItemID shopkeep; /* entity running shop */
    ushort stock[23]; /* items */
    byte multi[3][20];
};

typedef struct Spell_RAM Spell_RAM, *PSpell_RAM;

struct Spell_RAM {
    struct ItemID Iid;
    char Name[23];
    byte Is_0;
    enum MagicSchoolEnum School;
    byte Damage;
    byte stamina;
    enum MagicCastedEnum CastedMagic;
    enum MagicTargetEnum Target;
    byte unk0x1f;
    byte WizardREQ;
    enum AspectEnum Aspect;
    byte Range;
    enum MigicCostEnum ingredient;
    byte EXP_Modifyer;
    u8 unk0x25;
};

typedef struct weapon_ram weapon_ram, *Pweapon_ram;

struct weapon_ram { /* Weapon Data loaded into ram */
    struct ItemID ID;
    char name[22];
    enum WeaponClassEnum Class; /* Type of weapon (sword, breath, spit, etc.) */
    byte ReqSTR;
    byte Hit;
    byte damage;
    ushort price; /* proper endian */
    byte SpellLV;
    byte Range; /* *(5/3) */
    byte Animation; /* which use animation */
    byte EXPMod; /* Lodin sword has set to 0x20 */
    enum ElementEnum element;
    enum AspectEnum aspect;
    enum StatEnum stat; /* Stat enhanced */
    byte statMod;
    enum SkillEnum Skill; /* skill enhanced (or stat) */
    byte SkillMod;
    enum SpellEnum spell;
    byte spellAmmount;
    byte ram0x2a;
    enum SpellEnum spell2;
    byte Spell2Ammount;
    enum ElementEnum elementResist;
    undefined2 align;
    float ResistPercent;
};

typedef struct Armour_ROM Armour_ROM, *PArmour_ROM;

typedef struct ItemID_ROM ItemID_ROM, *PItemID_ROM;

typedef enum ResistEnum { /* converted to float (1-(.25*x)) */
    -100=8,
    -25=5,
    -50=6,
    -6275=255,
    -75=7,
    0=4,
    100=0,
    25=3,
    50=2,
    75=1
} ResistEnum;

struct ItemID_ROM {
    byte ID;
    enum DBTypeEnum Type;
};

struct Armour_ROM { /* Armour data in Rom */
    char name[23];
    struct ItemID_ROM id;
    byte slot;
    byte Defence;
    byte protection;
    byte dex;
    byte unk0x1d;
    byte stealth;
    byte price[2]; /* endian swapped */
    byte expBonus;
    enum AspectEnum aspect;
    enum StatEnum stat;
    char statNum;
    enum SkillEnum skill;
    char skillNum;
    struct ItemID_ROM spell;
    byte SpellLV;
    byte unk0x2a;
    struct ItemID_ROM magic;
    byte magicLV;
    enum ElementEnum Element;
    enum ResistEnum ElementResist;
};

typedef struct ArrayHeader ArrayHeader, *PArrayHeader;

struct ArrayHeader { /* ROM Db array Header */
    byte Size; /* number of items in array */
    byte unk[3];
};

typedef struct DialougeEntity_ROM DialougeEntity_ROM, *PDialougeEntity_ROM;

struct DialougeEntity_ROM { /* Dialouge entity in ROM */
    char name[22];
    struct ItemID_ROM ID;
};

typedef struct Entity_ROM Entity_ROM, *PEntity_ROM;

struct Entity_ROM { /* Entity data stored in Rom */
    char name[20];
    char internalName[20];
    enum EntityCatEnum category; /* only checks for Chaos type */
    struct ItemID_ROM id;
    byte unk0x2b; /* passed to ram 0x19 */
    enum AspectEnum Aspect;
    byte unk0x2d[2]; /* sets 2 bits at ram0x18 */
    byte Alchemist; /* base skill lv's */
    byte Diplomat; /* FF=Cannot learn */
    byte Healer;
    byte Loremaster;
    byte Mechanic;
    byte Merchant;
    byte Ranger;
    byte Stealth;
    byte Theif;
    byte Troubador;
    byte Warrior;
    byte Wizard;
    byte Bite;
    byte Breath;
    byte Claw;
    byte Hafted;
    byte Missle;
    byte Pole;
    byte Spit;
    byte Sting;
    byte Sword;
    byte Throw;
    byte Tusk;
    byte Intelligence; /* base Stat lv's */
    byte Willpower;
    byte Dexterity;
    byte Endurance;
    byte Strength;
    byte Stamina;
    byte unk0x4c;
    byte Level;
    byte unk0x4e;
    struct ItemID_ROM Weapons[3]; /* Endian swapped */
    byte unk0x55;
    byte unk0x56;
    struct ItemID_ROM spells[5]; /* endian Swapped */
    enum MagicSchoolEnum Magic School; /* Chaos=All Schools */
    byte spell_levels[5];
    byte unk0x67[9];
    struct ItemID_ROM Armor;
    byte protection;
    struct ItemID_ROM sheild;
    byte SheildSkill;
    enum ElementEnum ElementResist1;
    enum ResistEnum ResistAmmount1; /* 100-(25*x) */
    enum ElementEnum ElementResist2;
    enum ResistEnum ResistAmmount2; /* 100-(25*x) */
    byte unk0x7a[8];
    byte unk0x82[4];
    byte EXP_X75; /* x50, then 1.5 on EXP func */
    byte Loot Category;
};

typedef struct Gear_Rom Gear_Rom, *PGear_Rom;

struct Gear_Rom { /* Gear/item data stored in rom */
    char name[20];
    struct ItemID_ROM ID;
    byte some id[2];
    byte damage;
    byte Protection;
    byte required_STR;
    byte Required_INT;
    byte price[2]; /* Endian reversed */
    enum AspectEnum Aspect;
    enum StatEnum stat;
    byte statMod;
    enum SkillEnum Skill; /* Can also modify Stat */
    byte SkillMod;
    struct ItemID_ROM Spell;
    byte spell value;
    byte Spell VAlue 2;
    struct ItemID_ROM Magic;
    byte Magic ammount;
    enum ElementEnum Element Resist;
    enum ResistEnum Resist percent; /* 100-(25*x) */
};

typedef struct loot_ROM loot_ROM, *Ploot_ROM;

struct loot_ROM { /* Loot Pools stored in ROM */
    char Name[20];
    struct ItemID_ROM ID;
    byte goldLo[2]; /* Endians swapped */
    byte goldHi[2]; /* Endians swapped */
    byte armorDrop[2]; /* % armor/Sheild drop */
    byte WeaponDrop[3]; /* % weapon drop */
    byte reagentPercent;
    byte reagentRange[2];
    struct ItemID_ROM item0;
    byte item0chance;
    byte item0quantity[2]; /* lo/hi range */
    struct ItemID_ROM item1;
    byte item1chance;
    byte item1quantity[2];
    struct ItemID_ROM item3;
    byte item3chance;
    struct ItemID_ROM item4;
    byte item4chance;
    struct ItemID_ROM item5;
    byte item5chance;
    struct ItemID_ROM item6;
    byte item6chance;
};

typedef struct shop_ROM shop_ROM, *Pshop_ROM;

typedef struct ShopItem ShopItem, *PShopItem;

typedef struct price_mod price_mod, *Pprice_mod;

typedef enum Price_multi {
    x.5=0,
    x.75=1,
    x1=2,
    x1.25=3,
    x1.5=4,
    x2=5,
    x3=6,
    x5=7
} Price_multi;

struct price_mod {
    byte unk;
    enum Price_multi multi;
    byte unk_;
};

struct ShopItem { /* Shop Item listing with 3 mystery bytes */
    struct ItemID_ROM item;
    struct price_mod mod;
};

struct shop_ROM { /* Shop Data in Rom */
    struct ItemID_ROM EntityID; /* Which entity runs the shop */
    struct ShopItem longItem[20]; /* each entry has 3 mystery bytes */
    struct ItemID_ROM shortItem[3]; /* these do not. */
};

typedef struct Spell_ROM Spell_ROM, *PSpell_ROM;

struct Spell_ROM { /* Spell Data in ROM */
    char Name[23];
    struct ItemID_ROM ID;
    enum MagicSchoolEnum School;
    byte Damage;
    byte Stamina Cost;
    enum MagicCastedEnum Target Ammount;
    enum MagicTargetEnum Target;
    byte unk0x1e; /* ram 0x1f */
    byte Wizard Required;
    enum AspectEnum Aspect;
    byte Range;
    enum MigicCostEnum Ingredient;
    byte EXP_Modifyer;
};

typedef struct Weapon_ROM Weapon_ROM, *PWeapon_ROM;

struct Weapon_ROM {
    char Name[21];
    struct ItemID_ROM ID;
    enum WeaponClassEnum Weapon Type;
    byte Required_Strength;
    byte Hit;
    byte damage;
    byte Price[2]; /* endian swapped */
    byte SpellLV;
    byte Range;
    byte Animation;
    byte EXPMod;
    enum ElementEnum Element;
    enum AspectEnum aspect;
    enum StatEnum Stat enhanced;
    byte Stat Ammount;
    enum SkillEnum Skill/stat enhanced;
    byte skill/stat ammount;
    struct ItemID_ROM Spell;
    byte spell Ammount;
    byte unk0x2a;
    struct ItemID_ROM Magic;
    byte Magic Ammount;
    enum ElementEnum Resist element;
    enum ResistEnum Resist percent;
};

typedef union Temp_equip Temp_equip, *PTemp_equip;

typedef struct Temp_potion Temp_potion, *PTemp_potion;

struct Temp_potion {
    struct ItemID id;
    byte unk0x2;
    byte unk0x3;
    char * name;
    u8 unk0x8;
    u8 unk0x9;
    ushort price;
    u8 unk0xc;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
    u8 unk0x10;
    u8 unk0x11;
    u8 unk0x12;
    u8 unk0x13;
};

union Temp_equip {
    struct Temp_weapon W;
    struct temp_gear G;
    struct Temp_potion P;
    struct temp_armor A;
};

typedef struct dialougeEntity_Info dialougeEntity_Info, *PdialougeEntity_Info;

struct dialougeEntity_Info { /* extended data of Dialouge entities in RAM */
    short index;
    u8 unk0x2;
    u8 unk0x3;
    enum Borg7Enum model;
    enum Borg8Enum portrait;
    float a;
    float b;
};

typedef struct entity_info entity_info, *Pentity_info;

struct entity_info { /* extended data of entities in RAM */
    word Index; /* Index in RAM */
    u8 unk0x2;
    u8 unk0x3;
    enum Borg7Enum Model; /* model Character uses */
    enum Borg8Enum Portait; /* Portait Character uses */
    float a;
    float b;
    float c;
    float d; /* scale? */
};


typedef enum BUTTON_ENUM {
    A=32768,
    B=16384,
    C_DOWN=4,
    C_LEFT=2,
    C_RIGHT=1,
    C_UP=8,
    D_DOWN=1024,
    D_LEFT=512,
    D_RIGHT=256,
    D_UP=2048,
    L=32,
    R=16,
    START=4096,
    Z=8192
} BUTTON_ENUM;

typedef enum CONT_ERROR {
    CONT_COLLISION_ERROR=1,
    CONT_FRAME_ERROR=2,
    CONT_NO_RESPONSE_ERROR=8,
    CONT_OVERRUN_ERROR=4
} CONT_ERROR;

typedef enum CONT_STATUS {
    CONT_ADDR_CRC_ER=4,
    CONT_CARD_ON=1,
    CONT_CARD_PULL=2,
    CONT_EEPROM_BUSY=128
} CONT_STATUS;

typedef enum CONT_TYPE {
    CONT_ABSOLUTE=1,
    CONT_EEP16K=16384,
    CONT_EEPROM=32768,
    CONT_JOYPORT=4,
    CONT_RELATIVE=2,
    CONT_TYPE_MASK=7943,
    CONT_TYPE_NORMAL=5
} CONT_TYPE;


typedef enum N64 Media {
    64DD=68,
    64DD Expansion=69,
    Aleck64 cart=90,
    Cart Expansion=67,
    Standard Cart=78
} N64 Media;

typedef enum N64 Region {
    Asia (NTSC)=65,
    Austrailia=85,
    Beta=55,
    Brazil=66,
    Canada=78,
    China=67,
    Dutch=72,
    Europe=80,
    Europe_X=88,
    Europe_Y=89,
    France=70,
    Gateway 64 (NTSC)=71,
    Gateway 64 (PAL)=76,
    Germany=68,
    Italy=73,
    Japan=74,
    Korea=75,
    North America=69,
    Scandanavia=87,
    Spain=83
} N64 Region;

typedef struct N64_BootStrap N64_BootStrap, *PN64_BootStrap;

typedef enum OsTv {
    MPAL=2,
    NTSC=1,
    PAL=0
} OsTv;



struct N64_BootStrap {
    enum OsTv NTSC_PAL; /* 0=PAL,1=NTSC,2=MPAL */
    uint Cart_DD; /* 0=cart,1=DD */
    pointer RomBase; /* b0000000 for cart a6000000 for dd */
    uint ResetType; /* 0=cold,1=NMI,2=boot disk */
    enum CIC_versions CICID; /* 6101 and 6102 =0 */
    uint Version;
    uint MemSize; /* RDRam Space */
    uint NMIBuffer[16]; /* Keep after Reset */
};

typedef struct N64_Header N64_Header, *PN64_Header;

struct N64_Header {
    dword Magic;
    dword Clock;
    pointer Load Address;
    dword Release;
    dword CRC1;
    dword CRC2;
    dword Unknown 5;
    dword Unknown 6;
    char Game Title[20];
    dword Zeroed;
    word Zeroed;
    byte Zeroed;
    enum N64 Media Media;
    char Game Code[2];
    enum N64 Region Region;
    byte Mask ROM Version;
};

typedef enum OS_EVENT {
    AI=6,
    CART=2,
    COUNTER=3,
    CPU_BREAK=10,
    DP=9,
    FAULT=12,
    PI=8,
    PRENMI=14,
    RDB_ACK_PROF=22,
    RDB_DATA_DONE=17,
    RDB_DBG_DONE=20,
    RDB_FLUSH_PROF=21,
    RDB_FREE_RANDOM=19,
    RDB_LOG_DONE=16,
    RDB_READ_DONE=15,
    RDB_REQ_RANDOM=18,
    SI=5,
    SP=4,
    SP_BREAK=11,
    SW1=0,
    SW2=1,
    THREADSTATUS=13,
    VI=7
} OS_EVENT;

typedef enum OS_VI_Clock {
    MPAL=48628316,
    NTSC=48681812,
    PAL=49656530
} OS_VI_Clock;

typedef enum OS_VI_SPECIAL {
    DITHER_FILTER_OFF=128,
    DITHER_FILTER_ON=64,
    DITHER_OFF=4,
    DITHER_ON=8,
    DIVOT_OFF=32,
    DIVOT_ON=16,
    GAMMA_OFF=2,
    GAMMA_ON=1
} OS_VI_SPECIAL;

typedef struct OSContPad OSContPad, *POSContPad;

struct OSContPad { /* Inputs For n64 Controller */
    enum BUTTON_ENUM button;
    s8 stick_x;
    s8 stick_y;
    enum CONT_ERROR errno;
    byte pad;
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
    struct OSThread * thread;
    struct OSMesgQueue * cmdQueue;
    struct OSMesgQueue * evtQueue;
    struct OSMesgQueue * acsQueue;
    s32 * dma;
    s32 * edma;
};

typedef struct OSIoMesg OSIoMesg, *POSIoMesg;

typedef struct OSIoMesgHdr OSIoMesgHdr, *POSIoMesgHdr;

struct OSIoMesgHdr {
    u16 type;
    u8 pri;
    u8 status;
    struct OSMesgQueue * retQueue;
};

struct OSIoMesg {
    struct OSIoMesgHdr hdr;
    void * dramAddr;
    u32 devAddr;
    u32 size;
    void * pihandle;
};

typedef struct OSPfs OSPfs, *POSPfs;

struct OSPfs {
    int status;
    struct OSMesgQueue * queue;
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
    struct OSPIHandle * next;
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
    struct OSScClient * next;
    struct OSMesgQueue * msgQ;
};

typedef struct OSSched OSSched, *POSSched;

typedef struct OSScMsg OSScMsg, *POSScMsg;

typedef struct OSScTask OSScTask, *POSScTask;

typedef enum OS_SC_FLAG {
    DRAM_LIST=4,
    LAST_TASK=32,
    NEEDS_RDP=1,
    NEEDS_RSP=2,
    PARALLEL_TASK=16,
    RCP_MASK=3,
    SWAPBUFFER=64,
    TYPE_MASK=7,
    YEILD=16,
    YEILDED=32
} OS_SC_FLAG;

typedef struct OSTask_t OSTask_t, *POSTask_t;

typedef u64 OSTime;

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
    struct OSScClient * clientlist;
    struct OSScTask * audioListHead;
    struct OSScTask * gfxListHead;
    struct OSScTask * audioListTail;
    struct OSScTask * gfxListTail;
    struct OSScTask * curRSPTask;
    struct OSScTask * curRDPTask;
    u32 frameCount;
    s32 doAudio;
};

struct OSTask_t {
    u32 Type;
    u32 flags;
    u64 * ucode_boot;
    u32 ucode_boot_size;
    u64 * ucode;
    u32 ucode_size;
    u64 * ucode_data;
    u32 ucode_data_size;
    u64 * dram_stack;
    u32 dram_stack_size;
    u64 * output_buff;
    u64 * output_buff_size;
    u64 * data_ptr;
    u32 data_size;
    u64 * yeild_data_ptr;
    u32 yeild_data_size;
};

struct OSScTask {
    struct OSScTask * next;
    u32 state;
    enum OS_SC_FLAG flags;
    void * framebuffer;
    struct OSTask_t list;
    struct OSMesgQueue * msgQ;
    OSMesg msg;
    OSTime startTime;
    OSTime totalTime;
};

typedef union OSTask OSTask, *POSTask;

union OSTask {
    struct OSTask_t t;
    longlong field1[8];
};

typedef struct OSTimer OSTimer, *POSTimer;

struct OSTimer {
    struct OSTimer * next;
    struct OSTimer * prev;
    OSTime interval;
    OSTime value;
    struct OSMesgQueue * mq;
    OSMesg msg;
};

typedef enum PFS_ERR {
    BAD_DATA=6,
    CONTRFAIL=4,
    DATA_FULL=7,
    DIR_FULL=8,
    ERR_DEVICE=11,
    FILE_EXIST=9,
    ID_FATAL=10,
    INCONSISTENT=3,
    INVALID=5,
    NEW_PAK=2,
    NOPACK=1,
    OK=0
} PFS_ERR;

typedef enum PI_STATUS_ {
    DMA_BUSY=1,
    ERROR=4,
    IO_BUSY=2
} PI_STATUS_;

typedef struct printf_struct printf_struct, *Pprintf_struct;

struct printf_struct {
    undefined8 value;
    char * buff;
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

typedef longlong s64;

typedef enum SP_STATUS_READ {
    BROKE=2,
    DMA_BUSY=4,
    DMA_FULL=8,
    HALT=1,
    INTR_BREAK=64,
    IO_FULL=16,
    SIG0=128,
    SIG1=256,
    SIG2=512,
    SIG3=1024,
    SIG4=2048,
    SIG5=4096,
    SIG6=8192,
    SIG7=16384,
    SSTEP=32
} SP_STATUS_READ;

typedef struct PI_STATUS PI_STATUS, *PPI_STATUS;

struct PI_STATUS {
    bool R:DMA W:Reset Controller:1;
    bool R:I/O W:Clear Intr:1;
    bool R:Error:1;
    u8 unk0x1;
    u8 unk0x2;
    u8 unk0x3;
};

typedef void * __gnuc_va_list;

typedef __gnuc_va_list va_list;

typedef struct lldiv_t lldiv_t, *Plldiv_t;

struct lldiv_t {
    longlong quot;
    longlong rem;
};

typedef struct cinematictext_widget cinematictext_widget, *Pcinematictext_widget;

struct cinematictext_widget {
    struct widgetStruct base;
    struct widgetStruct * unk0x7c;
    struct widgetStruct * unk0x80;
    int unk0x84;
    ushort dimensions[4];
    short unk0x90;
    short unk0x92;
    undefined4 unk0x94;
};

typedef struct journal_widget journal_widget, *Pjournal_widget;

struct journal_widget {
    struct widgetStruct widget;
    struct widgetStruct * wiget_pointer;
    u8 unk0x80;
    u8 unk0x81;
    u8 unk0x82;
    u8 unk0x83;
    u8 unk0x84;
    u8 unk0x85;
    u8 unk0x86;
    u8 unk0x87;
    u8 unk0x88;
    u8 unk0x89;
    u8 unk0x8a;
    u8 unk0x8b;
    struct widgetStruct * background;
};

typedef struct Pause_Widget_struct Pause_Widget_struct, *PPause_Widget_struct;

typedef struct pause_Substruct pause_Substruct, *Ppause_Substruct;

typedef struct widget_dollmenu widget_dollmenu, *Pwidget_dollmenu;

typedef struct widget_calendar widget_calendar, *Pwidget_calendar;

typedef struct widget_character_stats widget_character_stats, *Pwidget_character_stats;

typedef struct widget_itemslots widget_itemslots, *Pwidget_itemslots;

typedef struct widget_barter widget_barter, *Pwidget_barter;

typedef struct widget_menu_worldmap widget_menu_worldmap, *Pwidget_menu_worldmap;

typedef struct WorldMapPiece WorldMapPiece, *PWorldMapPiece;

struct Pause_Widget_struct {
    ulong (* bigassOpenCallback)(void);
    ulong (* bigassOpenCallback_1)(void);
    ulong (* upfunc)(void);
    ulong (* downfunc)(void);
    ulong (* leftfunc)(void);
    ulong (* rightfunc)(void);
    ulong (* Afunc)(void);
    ulong (* Bfunc)(void);
    ulong (* StartFunc)(void);
    ulong (* Lfunc)(void);
    ulong (* Rfunc)(void);
    ulong (* Zfunc)(void);
    ulong (* CUpfunc)(void);
    ulong (* CDownFunc)(void);
    ulong (* CleftFunc)(void);
    ulong (* CrightFunc)(void);
    struct pause_Substruct * substruct;
    undefined4 unk0x44;
    undefined4 unk0x48;
    undefined4 unk0x4c;
    struct widgetStruct * link1;
    struct widgetStruct * link2;
    struct color color;
    byte unk0x5c;
    u8 unk0x5d;
    undefined2 unk0x5e;
    short x;
    short y;
    undefined2 unk0x64;
    undefined2 unk0x66;
    undefined2 unk0x68;
    undefined2 unk0x6a;
    struct Borg_8_header * borg_8;
    byte unk0x70;
    u8 unk0x71;
    ushort imgWidth;
    ushort imgHeight;
    u8 unk0x76;
    u8 unk0x77;
    struct WidgetMethods * methods;
};

struct WorldMapPiece {
    enum EventFlag eventFlag;
    enum Borg8Enum mapBorg8:16;
    ushort x;
    ushort y;
};

struct widget_itemslots {
    struct widgetStruct base;
    struct unkGuiSubstruct unkStruct;
    u8 unk0x8c;
    u8 unk0x8d;
    u8 unk0x8e;
    u8 unk0x8f;
    struct widgetStruct * icons[15];
    struct ItemID icon_item_ids[15];
    u8 unk0xea;
    u8 unk0xeb;
};

struct widget_character_stats {
    struct widgetStruct base;
    struct widgetStruct * Level_widget;
    struct widgetStruct * gold_widget;
    struct widgetStruct * CurrHP_Widget;
    struct widgetStruct * MaxHP_widget;
    struct widgetStruct * borg8_widget;
    struct unkGuiSubstruct unk0x90;
    short HpPercent;
    u8 unk0xa2;
    u8 unk0xa3;
};

struct widget_menu_worldmap {
    struct widgetStruct base;
    byte unk0x7c;
    byte unk0x7d;
    byte unk0x7e;
    byte unk0x7f;
    struct color col;
    byte unk0x84;
    byte unk0x85;
    byte unk0x86;
    u8 unk0x87;
    struct widgetStruct * Marker;
    struct WorldMapPiece * mappiceptr;
    undefined2 mappieceCount;
    u8 unk0x92;
    u8 unk0x93;
};

struct pause_Substruct {
    struct widgetStruct * unk0x0;
    struct widget_dollmenu * dollmenu;
    struct widget_calendar * calendar;
    struct widgetStruct * pauseMenuSections[3];
    struct widgetStruct * backgroundWidget;
    struct widgetStruct * unk0x1c;
    char PauseMenuSection;
    u8 unk0x21;
    undefined2 unk0x22;
    undefined2 unk0x24;
    undefined2 unk0x26;
    struct AnimationData * unk0x28;
    float scrollSpeed;
    struct Borg_7_header * unk0x30;
    undefined4 unk0x34;
    float unk0x38;
    undefined4 unk0x3c;
    float scrollfloat;
    u8 unk0x44;
    u8 unk0x45;
    u8 unk0x46;
    u8 unk0x47;
    u8 unk0x48;
    u8 unk0x49;
    u8 unk0x4a;
    u8 unk0x4b;
    undefined4 takeInput;
};

struct widget_barter {
    struct widgetStruct base; /* 0x5e=Merchant */
    byte partyPicker;
    u8 unk0x7d;
    u8 unk0x7e;
    u8 unk0x7f;
    struct widget_child_2 * unk0x80;
    undefined4 unk0x84;
    undefined4 unk0x88;
    byte unk0x8c;
    u8 unk0x8d;
    u8 unk0x8e;
    u8 unk0x8f;
    struct widgetStruct * background;
    struct widgetStruct * blanktext;
    u8 unk0x98;
    u8 unk0x99;
    u8 unk0x9a;
    u8 unk0x9b;
};

struct widget_dollmenu {
    struct widgetStruct base;
    struct widgetStruct * unk0x7c;
    struct widget_character_stats * charStats_widget;
    struct widget_itemslots * itemslots_widget;
    struct widget_child_3 * unk0x88;
    struct widget_barter * barter_widget;
    undefined4 unk0x90;
};

struct widget_calendar {
    struct widgetStruct base;
    struct widget_menu_worldmap * map;
    byte unk0x80;
    byte unk0x81;
    byte unk0x82;
    byte unk0x83;
    struct color col;
    byte unk0x88;
    byte unk0x89;
    byte dayofMonth;
    byte weekofMonth;
    byte monthVal;
    u8 unk0x8d;
    u8 unk0x8e;
    u8 unk0x8f;
    struct widgetStruct * DayMarker;
    struct widgetStruct * monthTitle;
};

typedef struct portrait_frame_widget portrait_frame_widget, *Pportrait_frame_widget;

struct portrait_frame_widget {
    struct widgetStruct base;
    struct widgetStruct * unk0x7c;
    struct widgetStruct * unk0x80;
    struct widgetStruct * unk0x84;
    u8 unk0x88;
    u8 unk0x89;
    undefined2 unk0x8a;
    u8 unk0x8c;
    u8 unk0x8d;
    undefined2 unk0x8e;
    undefined2 unk0x90;
    undefined2 unk0x92;
    undefined4 unk0x94;
    struct widgetStruct * unk0x98;
    u8 unk0x9c;
    u8 unk0x9d;
    u8 unk0x9e;
    u8 unk0x9f;
    enum Borg8Enum unk0xa0;
    int unk0xa4;
};

typedef struct Widget_child_1 Widget_child_1, *PWidget_child_1;

struct Widget_child_1 {
    struct widgetStruct base;
    undefined4 unk0x7c;
    undefined4 unk0x80;
    undefined4 unk0x84;
    undefined4 unk0x88;
    undefined4 unk0x8c;
    undefined4 unk0x90;
    undefined4 unk0x94;
    undefined4 unk0x98;
    undefined4 unk0x9c;
    undefined4 unk0xa0;
    undefined4 unk0xa4;
    undefined4 unk0xa8;
    undefined2 unk0xac[4];
    undefined1 unk0xb4[4];
    undefined4 unk0xb8;
};

typedef struct widget_child_4 widget_child_4, *Pwidget_child_4;

struct widget_child_4 {
    struct widgetStruct base;
    union Temp_equip * item_id;
    byte unk0x80;
    byte unk0x81;
    u8 unk0x82;
    u8 unk0x83;
    struct widgetStruct * Portait_widget;
    struct widgetStruct * item_icon_widget;
    struct widgetStruct * unk0x8c;
    struct widgetStruct * item_name_widget;
    undefined2 unk0x94;
    undefined2 unk0x96;
};

typedef struct widget_Method_Ext widget_Method_Ext, *Pwidget_Method_Ext;

struct widget_Method_Ext {
    struct WidgetMethods base;
    struct Method unk0xd0;
    struct Method unk0xd8;
    struct Method unk0xe0;
    struct Method unk0xe8;
    struct Method unk0xf0;
};

typedef struct widget_methods_contpakData widget_methods_contpakData, *Pwidget_methods_contpakData;

struct widget_methods_contpakData {
    struct WidgetMethods base;
    struct Method unk0xd0;
    struct Method unk0xd8;
    struct Method unk0xe0;
    struct Method unk0xe8;
    struct Method unk0xf0;
    struct Method unk0xf8;
    struct Method unk0x100;
    struct Method unk0x108;
};

typedef struct widget_text widget_text, *Pwidget_text;

struct widget_text {
    char * txt;
    undefined4 unk;
    float f1;
    float f2;
};

typedef struct WidgetHandler WidgetHandler, *PWidgetHandler;

struct WidgetHandler {
    struct widgetStruct * widgetA;
    struct widgetStruct * widgetB;
};

typedef struct App_manager App_manager, *PApp_manager;

struct App_manager {
    struct OSSched * sched;
    struct OSMesgQueue * MesgQ;
    OSMesg * Mesg;
    int * stack;
    struct OSThread Thread;
    struct OSMesgQueue MesgQ2;
    struct OSScClient client;
};

typedef struct ArmorCraftRecipie ArmorCraftRecipie, *PArmorCraftRecipie;

struct ArmorCraftRecipie {
    ushort item; /* gear in ram */
    byte armor; /* armor in ram */
    byte stam; /* hp used */
    byte Mechanic; /* mechanic needed */
    byte pad; /* i dunno */
};

typedef struct ArmorPointer ArmorPointer, *PArmorPointer;

struct ArmorPointer {
    byte armors;
    byte sheilds;
    byte total;
    byte pad;
    struct armour_RAM * Armor;
};

typedef struct Audio_manager Audio_manager, *PAudio_manager;

typedef struct Voice_Aidyn Voice_Aidyn, *PVoice_Aidyn;

struct Audio_manager {
    struct ALPlayer ALPLAYER;
    struct ALHeap ALHEAP;
    struct ALSynth ALSYNTH;
    void * ThreadStack;
    OSMesg * OsMsgPtr0x74;
    struct OSSched * OSSched;
    union Acmd * ACMDList;
    struct Voice_Aidyn * voicesAidyn;
    void * * buffer_pointers;
    undefined4 unk0x88;
    u8 unk0x8c;
    u8 unk0x8d;
    u8 unk0x8e;
    u8 unk0x8f;
    void * heap0x90;
    undefined4 heap0x90Mirror;
    pointer unk0x98;
    u8 unk0x9c;
    u8 unk0x9d;
    u8 unk0x9e;
    u8 unk0x9f;
    struct OSThread Thread;
    struct OSScClient Client;
    struct OSScTask Task;
    undefined2 taskMsg;
    byte unk0x2c2[30];
    OSMesg OSmesg0x2e0;
    struct OSMesgQueue mesgQ;
    struct OSMesgQueue mesgQ_2;
    struct OSMesgQueue * MesgQ_3;
    s32 AudiolistCount;
    undefined4 unk0x31c;
    undefined2 some_audio_thread_dat;
    undefined2 audioLength;
    undefined2 unk0x324;
    undefined2 unk0x326;
    undefined2 unk0x328;
    byte Voices_AidynCount;
    undefined1 audio_tally;
    s8 buffer_choice;
    undefined1 AudioListBool;
    u8 unk0x32e;
    u8 unk0x32f;
};

struct Voice_Aidyn {
    struct ALVoice voice;
    struct ALWaveTable wavetable;
    u8 unk0x2e;
    u8 unk0x2f;
    undefined4 unk0x30;
    uint unk0x34;
    u8 unk0x38;
    u8 unk0x39;
    u8 unk0x3a;
    u8 unk0x3b;
    undefined4 unk0x3c;
    undefined4 unk0x40;
    ushort pitch;
    byte unk0x46;
    byte unk0x47;
    byte vol;
    byte pan;
    byte unk0x4a;
    byte unk0x4b;
};

typedef struct audio_substruct_2 audio_substruct_2, *Paudio_substruct_2;

typedef struct SoundStructA SoundStructA, *PSoundStructA;

struct audio_substruct_2 {
    ushort index;
    short unk0x2;
    undefined2 unk0x4;
    u8 unk0x6;
    u8 unk0x7;
    struct Audio_obj voxel;
    struct SoundStructA * soundStruct;
};

struct SoundStructA {
    vec3 v3_0x0;
    int mapTally;
    undefined2 unk0x10;
    byte zoneDatByte;
    char unk0x13;
    u16 unk0x14;
    ushort unk0x16;
    struct Borg_12_header * borg12;
    struct Audio_obj * voxel;
    struct audio_obj_dat * voxelDat;
};

typedef struct audiokey_struct audiokey_struct, *Paudiokey_struct;

struct audiokey_struct {
    byte[4] * a;
    pointer b;
    pointer c;
    byte d[1277][4];
};

typedef struct BorgListing BorgListing, *PBorgListing;

struct BorgListing {
    short Type; /* Borg type */
    short Compression; /* none,LZ01x,LZB */
    int compressed; /* size in ROM */
    int uncompressed; /* size in RAM */
    int Offset; /* index in in ROM DB */
};

typedef struct Calendar Calendar, *PCalendar;

struct Calendar { /* Timestruct->Ingame_time as x */
    byte month; /* x / 0x114db000 */
    byte week; /* (x % 0x114db000)/0x229b600 day: */
    byte day; /* (x % 0x229b600) / 0x4f1a00 */
    byte hour; /* (x % 0x4f1a00 >> 6) / 0xd2f */
    byte minute; /* (x + ((x >> 6) / 0xd2f) * -0x34bc0) / 0xe10 */
    byte second; /* (x % 0xe10) / 0x3c */
};

typedef struct camera_debug_menu camera_debug_menu, *Pcamera_debug_menu;

struct camera_debug_menu {
    struct widgetStruct base;
    struct widgetStruct * unk0x7c;
    undefined2 unk0x80;
    undefined2 unk0x82;
    u8 unk0x84;
    u8 unk0x85;
    u8 unk0x86;
    u8 unk0x87;
    undefined2 unk0x88;
    u8 unk0x8a;
    u8 unk0x8b;
    u8 unk0x8c;
    u8 unk0x8d;
    undefined2 unk0x8e;
    u8 unk0x90;
    u8 unk0x91;
    u8 unk0x92;
    u8 unk0x93;
    undefined2 unk0x94;
    u8 unk0x96;
    u8 unk0x97;
    u8 unk0x98;
    u8 unk0x99;
    undefined2 unk0x9a;
    u8 unk0x9c;
    u8 unk0x9d;
    u8 unk0x9e;
    u8 unk0x9f;
    undefined2 unk0xa0;
    u8 unk0xa2;
    u8 unk0xa3;
    u8 unk0xa4;
    u8 unk0xa5;
    undefined2 unk0xa6;
    u8 unk0xa8;
    u8 unk0xa9;
    u8 unk0xaa;
    u8 unk0xab;
    undefined2 unk0xac;
    u8 unk0xae;
    u8 unk0xaf;
    u8 unk0xb0;
    u8 unk0xb1;
    undefined2 unk0xb2;
    u8 unk0xb4;
    u8 unk0xb5;
    u8 unk0xb6;
    u8 unk0xb7;
    undefined2 unk0xb8;
    u8 unk0xba;
    u8 unk0xbb;
    u8 unk0xbc;
    u8 unk0xbd;
    undefined2 unk0xbe;
    u8 unk0xc0;
    u8 unk0xc1;
    u8 unk0xc2;
    u8 unk0xc3;
    undefined2 unk0xc4;
    u8 unk0xc6;
    u8 unk0xc7;
    u8 unk0xc8;
    u8 unk0xc9;
    u8 unk0xca;
    u8 unk0xcb;
    u8 unk0xcc;
    u8 unk0xcd;
    u8 unk0xce;
    u8 unk0xcf;
    u8 unk0xd0;
    u8 unk0xd1;
    u8 unk0xd2;
    u8 unk0xd3;
    u8 unk0xd4;
    u8 unk0xd5;
    u8 unk0xd6;
    u8 unk0xd7;
};

typedef struct Camera_struct Camera_struct, *PCamera_struct;

struct Camera_struct {
    vec3 coord;
    vec3 aim;
    vec3 coord_mirror;
    vec3 aim_mirror;
    Vec2 XZ_orient;
    vec3 rotation;
    ushort camera_mode_prev;
    ushort camera_mode;
    float float0x48;
    float unk0x4c;
    float unk0x50;
    float unk0x54;
    uint unk0x58;
    float unk0x5c;
    float unk0x60;
    float unk0x64;
    short unk0x68;
    undefined2 holdCamera;
    float camHeight;
    vec3 unk0x70;
    ushort unk0x7c;
    undefined2 unk0x7e;
    ushort unk0x80;
    ushort unk0x82;
    undefined2 unk0x84;
    u8 unk0x86;
    u8 unk0x87;
    struct Borg_9_data * borg_9;
    u8 unk0x8c;
    u8 unk0x8d;
    u8 unk0x8e;
    u8 unk0x8f;
    vec3 unk0x90;
    byte pad[60]; /* unused data */
    struct collisionTypeA substruct; /* unused struct */
    struct vec7 vec7; /* unused float array */
};

typedef struct cinematic_dat_pointers cinematic_dat_pointers, *Pcinematic_dat_pointers;

struct cinematic_dat_pointers {
    enum borg6Enum * borg6;
    pointer unknown;
    enum Borg12Enum * borg12;
    float[2] * floats;
};

typedef enum CinematicEnum {
    Cinematic_End=3,
    Cinematic_Roog=2,
    Cinematic_Shadow=1,
    Cinematic_opening=0
} CinematicEnum;

typedef struct CinematicFade CinematicFade, *PCinematicFade;

struct CinematicFade {
    byte index;
    byte fadeType; /* none,black,white,red */
    ushort runtime; /* div 2 */
    ushort fadeTime; /* div 2 */
    short exitTime;
};

typedef struct CinematicStruct CinematicStruct, *PCinematicStruct;

typedef enum enum_cinematic_switch {
    Load_world_map=1,
    check_alaron_attr=3,
    get_jipo=0,
    get_jipo_=4,
    set_brearb=2
} enum_cinematic_switch;

struct CinematicStruct {
    struct AnimationData * AniDat;
    struct borg_6_header * Borg6;
    struct Borg_12_header * BGM;
    enum EventFlag * cinematic_dat_seq;
    float[2] * floatPairs;
    enum borg6Enum * borg6enums;
    enum Borg12Enum * borg12enums;
    undefined2 tally;
    undefined2 scene_switch;
    undefined2 Bstart;
    enum enum_cinematic_switch switch;
    undefined4 some_cinematic_tally;
    undefined4 some_cinematic_dat;
    undefined1 unk0x2c;
    byte pad[3];
};

typedef struct cinematictext_struct cinematictext_struct, *Pcinematictext_struct;

struct cinematictext_struct {
    int showCaptionTimer;
    struct cinematictext_widget * widget;
    pointer unk0x8;
    ushort[3] * shortsPointer;
    ushort unk0x10;
    ushort caption_scene_max;
    ushort caption_index;
    ushort runtime;
    ushort captionTime;
    char nextCaption[256];
    char AlaronName[256]; /* yeah, for just the player name */
    ushort pad;
};

typedef struct CityMarkers CityMarkers, *PCityMarkers;

struct CityMarkers { //markers on map labeling city
    enum Borg8Enum borg:16;
    ushort x;
    ushort y;
};

typedef struct cloudStruct cloudStruct, *PcloudStruct;

struct cloudStruct {
    byte dat0;
    undefined3 align;
    float f0;
    float f1;
    float f2;
    undefined4 unused;
    struct color col;
    float f3;
};

typedef struct CommonStringArray CommonStringArray, *PCommonStringArray;
/*
struct CommonStringArray {
    char * Chest;
    char * Bag;
    char * Box;
    char * Barrel;
    char * Herbs;
    char * Spices;
    char * Gem Stones;
    char * Treasure Pile;
    char * Failed to pick lock;
    char * Failed To disarm trap;
    char * Failed To Fix;
    char * Failed to estimate size of party;
    char * Failed to change monster reaction;
    char * Party Member Too Weak;
    char * Task not Completed;
    char * unk0x3c;
    char * unk0x40;
    char * unk0x44;
    char * unk0x48;
    char * unk0x4c;
    char * unk0x50;
    char * unk0x54;
    char * unk0x58;
    char * unk0x5c;
    char * unk0x60;
    char * unk0x64;
    char * unk0x68;
    char * unk0x6c;
    char * unk0x70;
    char * false;
    char * true;
    char * yes_;
    char * no;
    char * unk0x84;
    char * unk0x88;
    char * Please Connect controller?;
    char * unk0x90;
    char * unk0x94;
    char * unk0x98;
    char * unk0x9c;
    char * unk0xa0;
    char * unk0xa4;
    char * unk0xa8;
    char * unk0xac;
    char * unk0xb0;
    char * unk0xb4;
    char * unk0xb8;
    char * SCENE;
    char * CONTAINER;
    char * LIGHT;
    char * AUDIO;
    char * WANDERNODE;
    char * PARTY;
    char * REFPOINT;
    char * TELEPORTER;
    char * CAMERA;
    char * DIALOUGE;
    char * TRIGGER;
    char * SAVEPOINT;
    char * CODE;
    char * NUMOBJECTS;
    char * unk0xf4;
    char * unk0xf8;
    char * unk0xfc;
    char * unk0x100;
    char * unk0x104;
    char * unk0x108;
    char * unk0x10c;
    char * unk0x110;
    char * unk0x114;
    char * unk0x118;
    char * unk0x11c;
    char * unk0x120;
    char * unk0x124;
    char * unk0x128;
    char * unk0x12c;
    char * unk0x130;
    char * unk0x134;
    char * unk0x138;
    char * unk0x13c;
    char * unk0x140;
    char * unk0x144;
    char * unk0x148;
    char * unk0x14c;
    char * unk0x150;
    char * unk0x154;
    char * unk0x158;
    char * unk0x15c;
    char * Party member too weak;
    char * No luck, task not completed;
    char * Task completed sucessfully;
    char * Don't have proper components;
    char * party member already healed;
    char * Stats already at max;
    char * Need more practice in that skill;
    char * ok;
    char * Item Cannot Be Equipped;
    char * unk0x184;
    char * unk0x188;
    char * unk0x18c;
    char * unk0x190;
    char * unk0x194;
    char * unk0x198;
    char * unk0x19c;
    char * unk0x1a0;
    char * unk0x1a4;
    char * unk0x1a8;
    char * unk0x1ac;
    char * unk0x1b0;
    char * unk0x1b4;
    char * unk0x1b8;
    char * unk0x1bc;
    char * unk0x1c0;
    char * unk0x1c4;
    char * unk0x1c8;
    char * unk0x1cc;
    char * unk0x1d0;
    char * unk0x1d4;
    char * unk0x1d8;
    char * unk0x1dc;
    char * unk0x1e0;
    char * unk0x1e4;
    char * unk0x1e8;
    char * unk0x1ec;
    char * unk0x1f0;
    char * unk0x1f4;
    char * unk0x1f8;
    char * unk0x1fc;
    char * unk0x200;
    char * unk0x204;
    char * unk0x208;
    char * unk0x20c;
    char * unk0x210;
    char * unk0x214;
    char * Cut to Camera;
    char * Sine to Camera;
    char * angle to;
    char * pan to;
    char * On;
    char * Cut to POV;
    char * unk0x230;
    char * unk0x234;
    char * unk0x238;
    char * On POV;
    char * Face;
    char * Track on;
    char * Fade;
    char * Blooming Season;
    char * Late Blooming Season;
    char * Earth Season;
    char * Late Earth Season;
    char * Summer Season;
    char * Late Summer Season;
    char * Golden Season;
    char * Late Golden Season;
    char * Fall Season;
    char * Late Fall Season;
    char * Winter Season;
    char * Late Winter Season;
    char * New Game;
    char * Load Game;
    char * Options;
    char * Theater;
    char * Audio;
    char * Sound;
    char * Music;
    char * Graphics;
    char * Normal Resolution;
    char * high Resolution;
    char * 32 bit color;
    char * GAME;
    char * RENAME CHARACTER;
    char * No Cinematics yet;
    char * Help;
    char * New cont pak found;
    char * retry with old cont pak;
    char * continue__;
    char * unk0x2c4;
    char * unk0x2c8;
    char * unk0x2cc;
    char * unk0x2d0;
    char * unk0x2d4;
    char * Retry;
    char * unk0x2dc;
    char * controller pak is full;
    char * manage controller pak;
    char * continue without saving__;
    char * unk0x2ec;
    char * unk0x2f0;
    char * game saved is corrupt;
    char * unk0x2f8;
    char * unk0x2fc;
    char * unk0x300;
    char * unk0x304;
    char * unk0x308;
    char * unk0x30c;
    char * unk0x310;
    char * unk0x314;
    char * unk0x318;
    char * unk0x31c;
    char * unk0x320;
    char * unk0x324;
    char * unk0x328;
    char * unk0x32c;
    char * continue without saving_;
    char * delete game note?;
    char * yes;
    char * All Game States;
    char * unk0x340;
    char * unk0x344;
    char * unk0x348;
    char * unk0x34c;
    char * unk0x350;
    char * unk0x354;
    char * unk0x358;
    char * unk0x35c;
    char * unk0x360;
    char * unk0x364;
    char * unk0x368;
    char * unk0x36c;
    char * unk0x370;
    char * unk0x374;
    char * unk0x378;
    char * unk0x37c;
    char * unk0x380;
    char * unk0x384;
    char * unk0x388;
    char * unk0x38c;
    char * unk0x390;
    char * unk0x394;
    char * unk0x398;
    char * unk0x39c;
    char * unk0x3a0;
    char * unk0x3a4;
    char * Random;
    char * Sneak;
    char * Ambush;
    char * Stop;
    char * Sneak_;
    char * Walk;
    char * Run;
    char * None;
    char * Earth;
    char * Solar;
    char * Physical;
    char * Necromancy;
    char * Fire;
    char * Lunar;
    char * Naming;
    char * Water;
    char * Magic;
    char * Air;
    char * Star;
    char * Ok;
    char * You cannot Cast that spell now;
    char * Spell can only be cast in the day;
    char * Spell can only be cast in the night;
    char * unk0x404;
    char * unk0x408;
    char * unk0x40c;
    char * unk0x410;
    char * unk0x414;
    char * unk0x418;
    char * unk0x41c;
    char * unk0x420;
    char * unk0x424;
    char * unk0x428;
    char * unk0x42c;
    char * unk0x430;
    char * unk0x434;
    char * unk0x438;
    char * unk0x43c;
    char * unk0x440;
    char * unk0x444;
    char * unk0x448;
    char * unk0x44c;
    char * unk0x450;
    char * unk0x454;
    char * unk0x458;
    char * unk0x45c;
    char * unk0x460;
    char * unk0x464;
    char * unk0x468;
    char * Bite;
    char * unk0x470;
    char * unk0x474;
    char * unk0x478;
    char * unk0x47c;
    char * unk0x480;
    char * unk0x484;
    char * unk0x488;
    char * unk0x48c;
    char * unk0x490;
    char * unk0x494;
    char * unk0x498;
    char * unk0x49c;
    char * unk0x4a0;
    char * unk0x4a4;
    char * unk0x4a8;
    char * unk0x4ac;
    char * unk0x4b0;
    char * unk0x4b4;
    char * unk0x4b8;
    char * unk0x4bc;
    char * unk0x4c0;
    char * unk0x4c4;
    char * unk0x4c8;
    char * unk0x4cc;
    char * unk0x4d0;
    char * unk0x4d4;
    char * Clear;
    char * Fog;
    char * Rain;
    char * Dawn;
    char * Morning;
    char * Afternoon;
    char * Night;
    char * Dark;
    char * Half;
    char * Full;
    char * Dark_;
    char * Strom;
    char * Earth_;
    char * Fire_;
    char * Light_;
    char * Water_;
    char * Clear_;
    char * unk0x51c;
    char * Moonday;
    char * Tuesday;
    char * Weirday;
    char * Thorsday;
    char * Fryday;
    char * Saturnday;
    char * Sunday;
    char * Rough;
    char * Forest;
    char * Desert;
    char * Marsh;
    char * Mountains;
    char * Barrow;
    char * Sea;
    char * unk0x558;
    char * None_;
    char * Rain_;
    char * Snow;
    char * Default_;
    char * Collision on Player and Camera;
    char * unk0x570;
    char * unk0x574;
    char * unk0x578;
    char * unk0x57c;
    char * unk0x580;
    char * unk0x584;
    char * unk0x588;
    char * unk0x58c;
    char * unk0x590;
    char * unk0x594;
    char * unk0x598;
    char * unk0x59c;
    char * unk0x5a0;
    char * unk0x5a4;
    char * unk0x5a8;
    char * unk0x5ac;
    char * unk0x5b0;
    char * unk0x5b4;
    char * unk0x5b8;
    char * unk0x5bc;
    char * unk0x5c0;
    char * unk0x5c4;
    char * unk0x5c8;
    char * unk0x5cc;
    char * unk0x5d0;
    char * unk0x5d4;
    char * unk0x5d8;
    char * InvalidId;
    char * Bad Data;
    char * Save Game;
    char * Flee;
    char * discovered secret door;
    char * unk0x5f0;
    char * unk0x5f4;
    char * unk0x5f8;
    char * unk0x5fc;
    char * This is Highway Robbery!;
    char * Ouch! That's pretty expensive;
    char * That's a bit more than the usual price;
    char * The price is about what you expect;
    char * This is less than you expect topay;
    char * This is a really good price;
    char * What an Amazing Bargain!;
    char * Name_;
    char * Not Enough Pages on Controller Pak;
    char * There are still not enough pages to save;
    char * Controller Pak is still Full;
    char * unk0x62c;
    char * continue_;
    char * unk0x634;
    char * unk0x638;
    char * unk0x63c;
    char * unk0x640;
    char * error reading controller pak;
    char * continue without saving;
    char * unk0x64c;
    char * insert new controller pak;
    char * unk0x654;
    char * unk0x658;
    char * unk0x65c;
    char * unk0x660;
    char * empty;
    char * unk0x668;
    char * unk0x66c;
    char * controller pak is corrupt;
    char * controller pak is damaged;
    char * are you sure you wish to overWrite?;
    char * overwrite;
    char * unk0x680;
    char * Error Reading Controllerpak;
    char * unk0x688;
    char * unk0x68c;
    char * unk0x690;
    char * unk0x694;
    char * unk0x698;
    char * unk0x69c;
    char * unk0x6a0;
    char * unk0x6a4;
    char * unk0x6a8;
    char * unk0x6ac;
    char * unk0x6b0;
    char * Trap disarmed;
    char * slightly;
    char * unk0x6bc;
    char * unk0x6c0;
    char * there's a dangerous trap;
    char * unk0x6c8;
    char * trap exploded;
    char * someone in party is invalid;
    char * shadow's prescence prevents healing;
    char * X failed the task;
    char * X already at max health;
    char * X heals Y by Z;
    char * only wizards can learn spells;
    char * they already know that spell;
    char * need higher wizard to know that spell;
    char * wrong school for spell;
    char * char learned spell;
    char * hp restored by x;
    char * party couldn't pick lock;
    char * far;
    char * a little;
    char * definietly;
    char * lock beyon ability to pick;
    char * too weak to pick;
    char * sucessfully picks lock;
    char * unk0x718;
    char * unk0x71c;
    char * made potion;
    char * not enough potion components;
    char * unk0x728;
    char * made flask;
    char * not enough flask components;
    char * you do not have the components to make armor;
    char * unk0x738;
    char * you failed to make armor;
    char * armor sucessfully created;
    char * healer tasks;
    char * lay on hands;
    char * heal with herbs;
    char * restore;
    char * health curr / max;
    char * already max hp;
    char * unk0x75c;
    char * unk0x760;
    char * unk0x764;
    char * unk0x768;
    char * unk0x76c;
    char * unk0x770;
    char * unk0x774;
    char * unk0x778;
    char * unk0x77c;
    char * unk0x780;
    char * Hours:;
    char * you just picked up gold;
    char * unk0x78c;
    char * unk0x790;
    char * leave items behind?;
    char * no, changed my mind;
    char * yes, leave it;
    char * unk0x7a0;
    char * unk0x7a4;
    char * unk0x7a8;
    char * Party gained EXP;
    char * unk0x7b0;
    char * EXP cost Max;
    char * EXP Cost;
    char * EXP remaining;
    char * No Journal entries;
    char * learned first spell;
    char * only wizards can learn magic;
    char * unk0x7cc;
    char * unk0x7d0;
    char * unk0x7d4;
    char * unk0x7d8;
    char * unk0x7dc;
    char * unk0x7e0;
    char * unk0x7e4;
    char * Xp remaining;
    char * Total XP;
    char * Next Level;
    char * MAX;
    char * You caonnt train stat further;
    char * you need X XP to train this status;
    char * Train this for X XP?;
    char * You cannot learn this skill;
    char * cannot teach skill further;
    char * cannot train skill further;
    char * unk0x810;
    char * unk0x814;
    char * train for Xp and Gold;
    char * train for Xp;
    char * unk0x820;
    char * you got a potion!;
    char * Nothing there;
    char * you cannot afford that;
    char * you cannot hold any more;
    char * party inventorys full;
    char * I dont want that;
    char * you cannot drop that;
    char * you must unequip to sell;
    char * you must unequip to drop;
    char * Found X gold;
    char * value: X;
    char * you feel like you need something here;
    char * min. Wiz rank;
    char * unk0x858;
    char * unk0x85c;
    char * Aspect;
    char * min.Str;
    char * BaseHit;
    char * Damage;
    char * spell battery;
    char * Magic_;
    char * Spell_;
    char * Resists;
    char * protection;
    char * unk0x884;
    char * unk0x888;
    char * unk0x88c;
    char * unk0x890;
    char * unk0x894;
    char * Min. Int;
    char * unk0x89c;
    char * unk0x8a0;
    char * unk0x8a4;
    char * unk0x8a8;
};
*/
typedef struct Compass_struct Compass_struct, *PCompass_struct;

struct Compass_struct {
    struct Borg_8_header * ring;
    byte pad[4];
    struct Borg_8_header * N;
    struct Borg_8_header * S;
    struct Borg_8_header * E;
    struct Borg_8_header * W;
};

typedef struct ContManageStruct ContManageStruct, *PContManageStruct;

typedef struct controllerBuffer controllerBuffer, *PcontrollerBuffer;

struct controllerBuffer { /* buffer of controller inputs */
    struct Button_hold * inputlog;
    struct OSPfs pfs;
    byte pad[2];
    float hori;
    float vert;
    byte latest;
    byte next;
    char ContGet;
    bool ContRead;
};

struct ContManageStruct {
    pointer thread_stack;
    OSMesg * osmesgPointer;
    struct OSSched * ossched;
    struct controllerBuffer * BufferPointer;
    struct OSThread Thread;
    struct OSScClient client;
    OSMesg mesg0;
    OSMesg mesg1;
    struct OSMesgQueue controller_queue_2;
    struct OSMesgQueue si_megQ;
    struct OSMesgQueue contMesgQ;
    uint Timer;
    u8 ports;
};

typedef struct crash_DatString crash_DatString, *Pcrash_DatString;

struct crash_DatString {
    uint ANDMask;
    uint Value;
    char * String;
};

typedef struct CrashManager CrashManager, *PCrashManager;

struct CrashManager {
    byte Stack[2120];
    struct OSThread Thread;
    OSMesg Mesgs;
    struct OSMesgQueue MesgQ;
    undefined4 crash_func_arg;
    char position[128];
    char Cause[128];
    bool IsManualCrash;
    u8 unk0xb19;
    u8 unk0xb1a;
    u8 unk0xb1b;
    ulong (* Func)(void);
};

typedef struct DCM_struct DCM_struct, *PDCM_struct;

struct DCM_struct {
    struct DCM_sub * ptr0; /* 0x200 struct */
    void * ptr1;
    int unk0x8;
    undefined4 unk0xc;
    undefined4 unk0x10;
    u32 tally_;
    char unk0x18;
    byte unk0x19;
    byte unk0x1a;
    byte vol;
    byte unk0x1c;
    byte unk0x1d;
    byte unk0x1e;
    u8 unk0x1f;
};

typedef struct DCMManager DCMManager, *PDCMManager;

struct DCMManager {
    struct ALPlayer ALplayer;
    struct DCM_struct * DCMStructPointer;
    byte * pointer_B;
    u32 Tally;
    byte index;
};

typedef struct Debug_queue Debug_queue, *PDebug_queue;

struct Debug_queue {
    char * * text;
    vec3 color;
    float timer;
    short ShortA;
};

typedef struct DebugCharChanger DebugCharChanger, *PDebugCharChanger;

struct DebugCharChanger {
    enum Borg7Enum borg7;
    float float;
    char * label;
};

typedef struct DebugMapLabel DebugMapLabel, *PDebugMapLabel;

struct DebugMapLabel {
    enum EnumMapDatA a;
    ushort b;
    ushort c;
    short pad;
    char * label;
};

typedef struct DialoigEntPointer DialoigEntPointer, *PDialoigEntPointer;

struct DialoigEntPointer {
    byte total;
    byte pad[3];
    struct DialougEnt_RAM * ents;
};

typedef struct dialougemode_struct dialougemode_struct, *Pdialougemode_struct;

typedef struct wander_substruct wander_substruct, *Pwander_substruct;

struct dialougemode_struct {
    ulong (* funcs0[5])(void);
    ulong (* funcs1[5])(void);
    ulong (* funcs2[5])(void);
    ulong (* funcs3[5])(void);
    ulong (* funcs4[5])(void);
    ulong (* funcs5[5])(void);
    struct wander_substruct * playerDatas;
    undefined2 unk0x7c;
    u8 unk0x7e;
    u8 unk0x7f;
    void * ptr0x80;
    struct borg_13_data * borg13_dat;
    struct playerData * unk0x88;
    enum borg13Enum borg13;
    undefined4 unk0x90;
    undefined2 unk0x94;
    undefined2 mapDatA;
    undefined2 mapShort1;
    undefined2 mapShort2;
    u8 unk0x9c;
    u8 unk0x9d;
    u8 unk0x9e;
    u8 unk0x9f;
    int unk0xa0;
    u8 unk0xa4;
    u8 unk0xa5;
    u8 unk0xa6;
    u8 unk0xa7;
    u8 unk0xa8;
    u8 unk0xa9;
    byte func_index;
    byte unk0xab;
    byte unk0xac;
    u8 unk0xad;
    u8 unk0xae;
    u8 unk0xaf;
    int camp_flag;
    struct dialougmode_substruct some_substruct;
};

struct wander_substruct {
    struct playerData * playerDat;
    Vec2 start_position;
    float wanderRadius;
    float randVal;
    float unk0x14;
    ushort timer;
    undefined2 homenode;
    undefined2 unk0x1c;
    undefined2 unk0x1e;
    undefined2 unk0x20;
    short unk0x22;
    float senseValA;
    float senseValB;
    float unk0x2c;
    float unk0x30;
    float unk0x34;
    ushort unk0x38;
    undefined2 unk0x3a;
    undefined2 NoBorg13;
    undefined2 unk0x3e;
    Vec2 position;
    float size;
    struct playerData * target_playerDat;
    undefined2 VoxelIndex;
    u8 unk0x52;
    u8 unk0x53;
};

typedef struct dynamic_light_struct dynamic_light_struct, *Pdynamic_light_struct;

struct dynamic_light_struct {
    struct light_obj lights[16];
    short shortsA[16][4];
    short shortsB[16];
    short dynamicLightCount;
    undefined2 unk0x762;
};

typedef struct encounter_rom_dat encounter_rom_dat, *Pencounter_rom_dat;

struct encounter_rom_dat {
    struct monsterpartyEntry entries[2];
};

typedef struct EntityPointer EntityPointer, *PEntityPointer;

struct EntityPointer {
    byte total;
    byte catSizes[7];
    byte unk[7];
    byte pad;
    struct Entity_Ram * entities;
};

typedef enum enum_someCase {
    CombatLevelUp=5
} enum_someCase;

typedef struct event_flag_array event_flag_array, *Pevent_flag_array;

struct event_flag_array {
    enum EventFlag to;
    enum EventFlag from;
    short val;
    byte skill_stat;
    byte pad;
};

typedef enum event_flag_typeA {
    BIT=3,
    CNT=2,
    INV=4,
    LOG=0,
    VAL=1
} event_flag_typeA;

typedef enum Event_flag_typeB {
    AND=0,
    EOR=2,
    EQU=5,
    GRT=6,
    INV=9,
    IOR=1,
    LST=7,
    MSK=4,
    NEQ=8,
    NOT=3
} Event_flag_typeB;

typedef struct fileState_aidyn fileState_aidyn, *PfileState_aidyn;

struct fileState_aidyn {
    ushort filesize;
    u16 comp_code;
    u32 game_code;
    char game_name[16];
    byte unk0x18;
    char ext_name[4];
    byte align[3];
};

typedef struct flag_cinematic flag_cinematic, *Pflag_cinematic;

struct flag_cinematic {
    enum EventFlag flag;
    enum CinematicEnum cinematic;
    byte pad;
};

typedef struct Flycam_entry Flycam_entry, *PFlycam_entry;

struct Flycam_entry { /* data entry for titlescreen flycam */
    enum borg6Enum borg6;
    u8 unk0x4;
    u8 unk0x5;
    ushort a;
    u8 unk0x8;
    u8 unk0x9;
    ushort b;
    u8 unk0xc;
    u8 unk0xd;
    ushort Deimos;
    u8 unk0x10;
    u8 unk0x11;
    ushort Phobos;
};

typedef struct flycamStruct flycamStruct, *PflycamStruct;

struct flycamStruct {
    vec3 vec3_0;
    vec3 vec3_1;
    vec3 Position;
    vec3 Aim;
    short shortA;
    short shortB;
    short shortC;
    short ShortD;
};

typedef struct fontface_struct fontface_struct, *Pfontface_struct;

struct fontface_struct {
    enum Borg8Enum font_face;
    undefined1 a;
    undefined1 b;
    u8 unk0x6;
    u8 unk0x7;
};

typedef struct FontStruct FontStruct, *PFontStruct;

struct FontStruct {
    struct fontface_struct * borg8_index;
    struct Borg_8_header * pointer A;
    char unk0x8;
    byte unk0x9;
    char unk0xa;
    u8 unk0xb;
    undefined2 unk0xc;
    short Font_Height;
    undefined2 unk0x10;
    undefined2 unk0x12;
    float kerningMulti;
    pointer pointer B;
    struct color col;
};

typedef enum GameState_Cheat { /* Set in big Debug Menu */
    All,appear,check,teleportLock,teletrap,teleportSecret,containerOpen,containerExplode,
    monsterCheck,dialougeTrigger,trigger,referenceObject
} GameState_Cheat;

typedef struct GameStateFunnel GameStateFunnel, *PGameStateFunnel;

typedef struct Struct_State Struct_State, *PStruct_State;

struct Struct_State {
    ushort shortA;
    ushort shortB;
    enum event_flag_typeA type;
    enum Event_flag_typeB command;
    bool Flag;
    byte byte7;
};

struct GameStateFunnel { /* used for event flags and whatnot */
    ushort a;
    ushort b;
    ushort flag_count;
    undefined2 f;
    struct Struct_State * States_pointer;
    struct Struct_State * other_pointer;
    int u[3];
    int g;
    struct Struct_State states[5000];
    struct Struct_State otherStates[970];
};

typedef struct Gear_Pointer Gear_Pointer, *PGear_Pointer;

struct Gear_Pointer {
    byte total;
    byte totalPerGear[11];
    byte unk1[12];
    struct Gear_RAM * Gear;
};

typedef struct gfxManager gfxManager, *PgfxManager;

struct gfxManager {
    struct OSSched * sched;
    pointer unk0x4;
    pointer unk0x8;
    pointer unk0xc;
    pointer unk0x10;
    pointer unk0x14;
    void * FrameBuffers[2];
    pointer DepthBuffer;
    pointer unk0x24;
    pointer unk0x28;
    struct OSViMode osvimodeCustom;
    int unk0x7c;
    struct OSScTask tasks[2];
    ushort unk0x150;
    ushort unk0x152;
    ushort unk0x154;
    u8 unk0x156;
    u8 unk0x157;
    ushort unk0x158;
    byte unk0x15a[6];
    ushort MoreResSettings[2][4]; /* H*2,V*2,511,0 */
    uint ram_size;
    uint FramebufferSize[2];
    uint unk0x17c;
    uint unk0x180;
    uint someOtherTimer;
    uint someTimers[2];
    ushort hres[2];
    ushort Vres[2];
    byte colordepth[2];
    byte vi_buffer_choice;
    s8 unk0x19b;
    byte unk0x19c;
    byte unk0x19d[3];
};

typedef struct GlobalsAidynDebug GlobalsAidynDebug, *PGlobalsAidynDebug;

typedef struct wander_struct wander_struct, *Pwander_struct;

typedef struct player_char_struct player_char_struct, *Pplayer_char_struct;

typedef struct GlobalsSub GlobalsSub, *PGlobalsSub;

typedef struct SFX_Struct SFX_Struct, *PSFX_Struct;

typedef struct SkyStruct SkyStruct, *PSkyStruct;

typedef struct pause_struct pause_struct, *Ppause_struct;

typedef struct Minimap_struct Minimap_struct, *PMinimap_struct;

typedef struct PartyStruct PartyStruct, *PPartyStruct;

typedef struct ScriptCamera_struct ScriptCamera_struct, *PScriptCamera_struct;

typedef struct QueueStructA QueueStructA, *PQueueStructA;

typedef struct QueueStructB QueueStructB, *PQueueStructB;

typedef struct ZoneDat ZoneDat, *PZoneDat;

typedef struct weatherStruct weatherStruct, *PweatherStruct;

typedef struct PlayerHandler PlayerHandler, *PPlayerHandler;

typedef struct mapFloatDat mapFloatDat, *PmapFloatDat;

typedef struct MinimapSec_dat MinimapSec_dat, *PMinimapSec_dat;

typedef struct ScriptCam ScriptCam, *PScriptCam;

typedef struct QueueStructAItem QueueStructAItem, *PQueueStructAItem;

typedef struct QueueStructBItem QueueStructBItem, *PQueueStructBItem;

struct PlayerHandler {
    short max_player;
    u8 unk0x2;
    u8 unk0x3;
    struct Camera_struct * camera;
    short unk0x8;
    u8 unk0xa;
    u8 unk0xb;
    struct playerData * playerDats;
    ushort unk0x10[40];
    short playerCount;
    ushort counter;
    float float_0x64;
    float float_0x68;
    struct Borg_1_Header * unk0x6c;
    u8 unk0x70;
    u8 unk0x71;
    u8 unk0x72;
    u8 unk0x73;
    struct audiokey_struct * audiokey;
};

struct MinimapSec_dat {
    ushort mapshort1;
    ushort mapshort2;
    ushort unk0x4;
    ushort checked;
    enum Borg8Enum borg8:16;
    short x;
    short y;
};

struct wander_struct {
    struct wander_substruct * wanderSubstructs;
    short wandererIndicies[39];
    ushort wanderers;
    short wanderersmax;
    undefined2 unk0x56;
};

struct weatherStruct {
    ushort rainShortA;
    ushort rainShortB;
    float unk0x4;
    u8 unk0x8;
    u8 unk0x9;
    u8 unk0xa;
    u8 unk0xb;
    float unk0xc;
    undefined2 skyBgdat;
    u8 unk0x12;
    u8 unk0x13;
    int unk0x14;
    struct Borg_12_header * Sfx;
    ushort unk0x1c;
    u8 unk0x1e;
    u8 unk0x1f;
    byte SfxByte;
};

struct mapFloatDat {
    vec3 playerVec3;
    Vec2 playerVec2;
    vec3 cameraVec3;
    ushort MapShort1;
    ushort MapShort2;
    enum EnumMapDatA mapDatA;
    undefined2 mapDatB;
    undefined2 mapDatC;
    undefined2 unk0x2a;
};

struct ZoneDat {
    int unk0x0;
    struct AnimationData * anidat0x4;
    enum borg9Enum borg9_id;
    struct Borg_9_header * mapPointer;
    uint borg5_ID;
    struct AnimationData * aniDat0x14;
    uint MapTally;
    byte unk0x1c;
    byte mapshortSum;
    byte unk0x1e;
    u8 unk0x1f;
};

struct GlobalsSub { /* 0x800e6988 */
    struct ZoneDat ZoneDatMtx[9]; /* actually [3][3] */
    struct Borg_9_data * borg9DatPointer;
    void *[3] * zoneEnginePtr0;
    float[10] * zoneEnginePtr1;
    float[7] * zoneEnginePtr2;
    undefined2 zoneEngineInit;
    u8 unk0x132;
    u8 unk0x133;
    struct Camera_struct camera;
    pointer unk0x250[16];
    undefined2 camInitFlag_;
    ushort mapShort1;
    ushort mapShort2;
    ushort unk0x296;
    ushort unk0x298;
    u8 unk0x29a;
    u8 unk0x29b;
    Vec2 mapCellSize;
    float unk0x2a4;
    float unk0x2a8;
    undefined2 mapDatA;
    undefined2 mapDatB;
    undefined2 mapDatC;
    u8 unk0x2b2;
    u8 unk0x2b3;
    struct weatherStruct weatherDat;
    u8 unk0x2d5;
    u8 unk0x2d6;
    u8 unk0x2d7;
    struct PlayerHandler PlayerHandler;
    struct ParticleHeadStruct particleEmmiter;
    byte unk0x692[262];
    struct dynamic_light_struct DynamicLights;
    struct ref_obj * refObjPointer;
    vec3 * unk0xf00;
    struct mapFloatDat MapFloatDatEntry;
    struct Borg_12_header * BGM;
    undefined4 BGMDatA;
    byte BGMDatB;
    u8 unk0xf39;
    u16 BGMIndex;
    u16 BGMQueue;
    undefined2 gamemodeType;
    struct flycamStruct flycamDat;
    struct mapFloatDat MapFloatDats[3][5];
    undefined2 unk0x120c;
    undefined2 unk0x120e;
    undefined2 unk0x1210;
    u8 unk0x1212;
    u8 unk0x1213;
    u8 unk0x1214;
    u8 unk0x1215;
    u8 unk0x1216;
    u8 unk0x1217;
};

struct player_char_struct {
    struct playerData * playerDat;
    enum Borg7Enum player_form;
    float collisionRadius;
    undefined2 show_portaits;
    undefined2 some_sound_var;
    undefined2 unk0x10;
    u8 unk0x12;
    u8 unk0x13;
    struct widgetStruct * smallerDebugWindow;
    struct widgetStruct * debugMenuTP;
    struct widgetStruct * debugMenuActor;
    undefined4 debugMenuUnused0;
    struct widgetStruct * debugMenuEnemy;
    struct widgetStruct * debugMenuArena;
    undefined4 debugMenuUnused1;
    struct widgetStruct * text_window;
    undefined1 camping_var;
    u8 unk0x35;
    struct ItemID current_shopkeep;
};

struct QueueStructBItem {
    void * pBorg;
    int unk0x4;
    int BorgIndex;
    ushort BorgSwitch;
    byte unk0xe;
    u8 unk0xf;
};

struct QueueStructB {
    struct QueueStructBItem array[32];
    ushort items;
};

struct SkyStruct {
    undefined2 BackgroundType; /* no more than 5 */
    u8 unk0x2;
    u8 unk0x3;
    struct Borg_8_header * borg8_0x4;
    pointer unk0x8;
    undefined2 unk0xc;
    u8 unk0xe;
    u8 unk0xf;
    struct Borg_8_header * borg8_0x10;
    void * unk0x14;
    undefined2 unk0x18;
    u8 unk0x1a;
    u8 unk0x1b;
    pointer ptr_0x1c;
    struct color colors[5];
    float unk0x34;
    float unk0x38;
    float unk0x3c;
    float unk0x40;
    float unk0x44;
    float unk0x48;
};

struct ScriptCamera_struct {
    struct ScriptCam * cameras; /* 0x7c size */
    short cameraIndecies[8];
    ushort cameraCount; /* up to 8 */
    short dataActive;
    short counter0;
    short counter1;
};

struct Minimap_struct {
    uint active;
    uint ShowMinimap;
    bool B_buttonToggle;
    byte ShowAll;
    byte unk0xa[2];
    vec3 savedPlayerPos;
    struct widgetStruct * widget_0x18;
    struct widgetStruct * widget_0x1c;
    struct widgetStruct * widget_0x20;
    struct widgetStruct * widget_0x24;
    struct widgetStruct * ptr_0x28;
    undefined4 unk0x2c;
    undefined4 unk0x30;
    undefined4 unk0x34;
    undefined4 unk0x38;
    undefined2 unk0x3c;
    undefined2 unk0x3e;
    struct MinimapSec_dat * mapdat_;
    undefined4 unk0x44;
    float unk0x48;
    float unk0x4c;
    float unk0x50;
    float unk0x54;
    float unk0x58;
    float unk0x5c;
    ushort mapshorts[2];
    float floatX;
    float floatY;
    float mapScale;
    float unk0x70;
    float unk0x74;
    float mapX;
    float unk0x7c;
    float unk0x80;
    float mapY;
    float unk0x88;
    float unk0x8c;
    float unk0x90;
    float unk0x94;
    undefined4 unk0x98;
    float unk0x9c;
    float unk0xa0;
    float unk0xa4;
    short unk0xa8;
    short unk0xaa;
    ushort unk0xac;
    ushort unk0xae;
};

struct SFX_Struct {
    struct SoundStructA * pointerA; /* 80 entries, +2 in retail */
    ushort shortArrayA[80];
    undefined2 pointerAIndex;
    u8 unk0xa6;
    u8 unk0xa7;
    struct audio_substruct_2 * pointerB; /* 16 entries */
    ushort shortArrayB[16];
    ushort pointerBIndex;
    undefined2 unk0xce;
};

struct QueueStructAItem {
    pointer BorgPointer;
    short BorgSwitch;
    short unk0x6;
};

struct QueueStructA {
    struct QueueStructAItem array[256];
    ushort items;
};

struct GlobalsAidynDebug { /* Globals structure of Aidyn Chronicles Debug */
    uint rngSeed;
    int appstate;
    uint ticker;
    float delay;
    undefined4 splashscreenFlag;
    struct Borg_12_header * introMusic;
    undefined4 introMusicDatA;
    undefined4 introMusicDatB;
    byte splashscreenSwitch;
    byte align0x21[3];
    struct Borg_8_header * thqBorg8;
    struct Borg_8_header * h20Borg8;
    byte align0x2c[8];
    uint splashscreenTimer;
    byte splashScreenUnkA;
    u8 unk0x39;
    ushort splashScreenUnkB;
    ushort splashScreenUnkC;
    ushort splashScreenUnkD;
    byte screenFadeModeSwitch;
    byte unk0x41[15];
    struct wander_struct wander;
    struct player_char_struct playerCharStruct;
    struct GlobalsSub Sub; /* 0x800e6988 */
    struct SFX_Struct SFXStruct;
    byte combatBytes[4];
    struct EncounterDat EncounterDat;
    struct playerData * playerDataArray[12];
    u64 unk0x142c;
    vec3 unk0x1434;
    s8 ShadowIndex;
    s8 AlaronIndex;
    byte GoblinHitTally;
    u8 unk0x1443;
    uint exp_val;
    uint combatByteMirror;
    struct SkyStruct sky;
    vec3 SunVec3;
    u64 unk0x14a4;
    vec3 MoonVec3;
    u64 unk0x14b8;
    struct Borg_8_header * portraitBorder;
    byte SomeCase;
    undefined3 unk0x14c5;
    void * unkPausePointer;
    struct pause_struct * BigAssMenu; /* Hey, that's what the devs called it */
    byte unk0x14d0;
    byte unk0x14d1;
    undefined2 unk0x14d2;
    struct Borg_8_header * screenshot;
    struct color screenshotTint;
    short scrollLocation[2];
    struct spellbook * ShopSpells;
    u32 shopUnused; /* probably was stats */
    struct CharSkills * shopSkills;
    struct Inventory_struct * shopInv;
    struct ItemID Shopkeep;
    undefined2 unk0x14f2;
    uint moneypile;
    byte creditsByte;
    undefined3 unk0x14f9;
    u32 unk0x14fc;
    byte unk0x1500;
    undefined3 unk0x1501;
    struct widgetStruct * titleScreen;
    undefined4 unk0x1508;
    struct Minimap_struct minimap;
    byte unk0x15bc;
    undefined3 unk0x15bd;
    struct astruct_12 * unk0x15c0;
    undefined4 unk0x15c4;
    struct CinematicStruct cinematicStruct;
    struct PartyStruct * Party;
    byte ResolutionSelect;
    undefined3 unk0x15fd;
    struct FontStruct * font;
    struct WidgetHandler * widgetHandler;
    struct ScriptCamera_struct scriptcamera;
    struct QueueStructA QueueA;
    undefined2 unk0x1e26;
    struct QueueStructB QueueB;
    undefined2 unk0x202a;
    byte appstateBool;
    undefined3 unk0x202d;
    u32 appfunc_dat;
    byte DebugStatDisplay;
    undefined3 unk0x2035;
    uint maptally;
    float screenfadeFloat;
    float acreenfadeFloat2;
    float screenFadeSpeed;
    undefined2 screenFadeMode;
    undefined2 unk0x204a;
    struct CommonStringArray * CommonStrings;
    byte goblinAmbush;
    undefined3 unk0x2051;
    float VolSFX;
    float VolBGM;
    float cloudsFloat;
    struct Debug_queue DebugQueue;
    undefined2 unk0x2076;
    char text[512];
};

struct PartyStruct { /* holds party and inventory data */
    struct CharSheet * Party[4]; /* pointer to party members */
    struct Inventory_struct * Inventory;
    uint Gold; /* moneyz */
    uint timeSneaking;
    uint timeWalking;
    uint TimeRunning;
    byte PartySize; /* how big is the party? */
    byte pad[3];
};

struct ScriptCam {
    short unk0x0;
    short unk0x2;
    ushort unk0x4;
    short unk0x6;
    vec3 * unk0x8;
    float unk0xc;
    struct camera_obj voxel;
};

struct pause_struct {
    struct Pause_Widget_struct widget;
    undefined4 unk0x7c;
    struct WidgetHandler * Handler;
};

typedef struct IconDict IconDict, *PIconDict;

struct IconDict { /* array Proceeded by dictionary length */
    ushort key;
    enum Borg8Enum value:16;
};


typedef struct inventory_slot inventory_slot, *Pinventory_slot;

struct inventory_slot {
    union Temp_equip * itemPointer;
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    u8 unk0x8;
    u8 unk0x9;
    u8 unk0xa;
    u8 unk0xb;
    u8 unk0xc;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
    int unk0x10;
    int quant;
};

typedef struct Item_Icon Item_Icon, *PItem_Icon;

struct Item_Icon {
    struct ItemID id;
    enum Borg8Enum icon:16;
};

typedef struct itemtype_func itemtype_func, *Pitemtype_func;

struct itemtype_func {
    byte type;
    u8 unk0x1;
    u8 unk0x2;
    u8 unk0x3;
    undefined4 unk;
    ulong (* function)(void);
};

typedef struct lensflare_data lensflare_data, *Plensflare_data;

struct lensflare_data {
    byte dat0;
    undefined3 align;
    float f0;
    float f1;
    struct color col;
};

typedef struct locatorStruct locatorStruct, *PlocatorStruct;

struct locatorStruct {
    u8 unk0x0;
    u8 unk0x1;
    u8 unk0x2;
    u8 unk0x3;
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    struct AnimationData * locators;
    u8 unk0xc;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
    u8 unk0x10;
    u8 unk0x11;
    u8 unk0x12;
    u8 unk0x13;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    u8 unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
    int unk0x1c;
    u8 unk0x20;
    u8 unk0x21;
    u8 unk0x22;
    u8 unk0x23;
    u8 unk0x24;
    u8 unk0x25;
    u8 unk0x26;
    u8 unk0x27;
    u8 unk0x28;
    u8 unk0x29;
    u8 unk0x2a;
    u8 unk0x2b;
    u8 unk0x2c;
    u8 unk0x2d;
    u8 unk0x2e;
    u8 unk0x2f;
    u8 unk0x30;
    u8 unk0x31;
    u8 unk0x32;
    u8 unk0x33;
    float unk0x34;
};

typedef struct loot_Pointer loot_Pointer, *Ploot_Pointer;

struct loot_Pointer {
    byte total;
    byte pad[3];
    struct Loot_RAM * lootCat;
};

typedef struct mapDataList mapDataList, *PmapDataList;

struct mapDataList {
    ushort mapShortA;
    ushort MapShortB;
    short borg_5;
    short unk;
    short borg_9;
    byte someVar;
    byte terrian;
};

typedef struct MapEventFlag MapEventFlag, *PMapEventFlag;

struct MapEventFlag {
    uint MapShortA;
    uint MapShortB;
    uint flag;
};

typedef struct MemCheck_struct MemCheck_struct, *PMemCheck_struct;

struct MemCheck_struct {
    u32 ramstartVal;
    void * GfxStart;
    void * heapStart;
    void * vi_buffer_pointers[2];
    u32 RamSize;
    u32 ramVal0;
    u32 MaxResolution0;
    u32 mem_free_allocated;
    u32 MaxResolution1;
};

typedef struct memMakerStruct memMakerStruct, *PmemMakerStruct;

struct memMakerStruct {
    u8 unk[3072]; /* no patience to know how this works */
};

typedef struct MemMon_struct MemMon_struct, *PMemMon_struct;

struct MemMon_struct {
    void * memRegionStart;
    void * memRegionNext;
    void * mamRegionMaxCurr;
    u32 memFreeMax;
    u32 memUsed;
    u32 memFree;
    u32 obj_count;
    u32 obj_count_2;
    u32 obj_free;
    uint memFree_2;
    char text[256];
    byte flag;
    byte pad[7];
};

typedef struct minimap_dat_2 minimap_dat_2, *Pminimap_dat_2;

struct minimap_dat_2 {
    ushort unk0x0;
    enum EventFlag flag;
    enum Borg8Enum borg8;
};

typedef struct OsPifRamCont OsPifRamCont, *POsPifRamCont;

struct OsPifRamCont {
    struct __OSContReadFormat unk0x0[4];
    s32 unk0x20[7];
    u32 pifstatus;
};

typedef enum PFS_ERR8 {
    BAD_DATA=6,
    CONTRFAIL=4,
    DATA_FULL=7,
    DIR_FULL=8,
    ERR_DEVICE=11,
    FILE_EXIST=9,
    ID_FATAL=10,
    INCONSISTENT=3,
    INVALID=5,
    NEW_PAK=2,
    NOPACK=1,
    OK=0
} PFS_ERR8;

typedef pointer pointerTypedef;

typedef struct potionRecipie potionRecipie, *PpotionRecipie;

struct potionRecipie {
    enum PotionEnum ID;
    byte spice;
    byte herb;
    byte gemstone;
    byte alchemist;
    byte unk;
    byte pad;
};

typedef enum PRECIPITATION {CLEAR,RAIN,SNOW} PRECIPITATION;

typedef struct ResolutionSettings ResolutionSettings, *PResolutionSettings;

struct ResolutionSettings {
    ushort Hres;
    ushort Vres;
    byte pad;
    byte colorDepth;
};

typedef struct RomcopyManageStruct RomcopyManageStruct, *PRomcopyManageStruct;

struct RomcopyManageStruct {
    pointer stack;
    OSMesg * mesgPointer;
    struct romcopy_struct * dmaStructs;
    u8 * dmaIndicies;
    struct OSThread Thread;
    struct OSMesgQueue mesgQ0x1c0;
    OSMesg mesg0x1d8;
    struct OSMesgQueue mesgQ0x1dc;
    u8 flag;
};

typedef struct RomstringController RomstringController, *PRomstringController;

struct RomstringController { //romstrings should probly be remade as char*[#define]
    char * continue w/o saving;
    char * cont pak full;
    char * not enough pages;
    char * error reading;
    char * retry;
    char * insert new controllerpak;
    char * game needs cont pak;
    char * cont w/o saving;
    char * retry new pak;
    char * manage cont pak;
    char * new cont pak detected;
    char * continue;
    char * contpak corrupt;
    char * contpak damaged;
    char * insert new pak(retry);
    char * repair;
    char * repair ok;
    char * repair fail;
    char * insert new pak;
    char * unsupported device;
    char * insert cont pak;
};

typedef u32 rspCom[2];

typedef struct School_icon School_icon, *PSchool_icon;

struct School_icon { /* dictionary of school and icon */
    byte unk0x0;
    enum MagicSchoolEnum school;
    enum Borg8Enum icon:16;
};

typedef struct shop_pointer shop_pointer, *Pshop_pointer;

struct shop_pointer {
    byte total; /* number of shops */
    byte padding[3];
    struct shop_ram * shops; /* shops' listing */
};

typedef byte ShortLE[2];

typedef struct skill_icon skill_icon, *Pskill_icon;

struct skill_icon { /* disctionary of scool and icon */
    byte unk0x0;
    enum SkillEnum skill;
    enum Borg8Enum icon:16;
};

typedef struct SkyobjectStruct SkyobjectStruct, *PSkyobjectStruct;

struct SkyobjectStruct {
    byte bytes[4];
    float f0;
    float f1;
    float f2;
    struct color col;
};

typedef enum SP_STATUS_WRITE {
    CLR_BROKE=4,
    CLR_CPUSIGNAL=131072,
    CLR_HALT=1,
    CLR_INTR=8,
    CLR_INTR_BREAK=128,
    CLR_RSPSIGNAL=32768,
    CLR_SIG5=524288,
    CLR_SIG6=2097152,
    CLR_SIG7=8388608,
    CLR_SSTEP=32,
    CLR_TASKDONE=8192,
    CLR_YEILD=512,
    CLR_YEILDED=2048,
    SET_CPUSIGNAL=262144,
    SET_HALT=2,
    SET_INTR=16,
    SET_INTR_BREAK=256,
    SET_RSPSIGNAL=65536,
    SET_SIG5=1048576,
    SET_SIG6=4194304,
    SET_SIG7=16777216,
    SET_SSTEP=64,
    SET_TASKDONE=16384,
    SET_YEILD=1024,
    SET_YEILDED=4096
} SP_STATUS_WRITE;

typedef struct spells_pointer spells_pointer, *Pspells_pointer;

struct spells_pointer {
    byte Total;
    byte Schools[6];
    byte schools2[6];
    byte unk0xd[3];
    struct Spell_RAM * spells;
};

typedef struct SpellVisuals_struct SpellVisuals_struct, *PSpellVisuals_struct;

typedef struct struct_unk_1 struct_unk_1, *Pstruct_unk_1;

struct SpellVisuals_struct {
    struct spellVisualsEntry * ptr0; /* 64 entries */
    struct struct_unk_1 * ptr1; /* 128 entries */
    struct SpellVisualsEntry2 * ptr2; /* 16 entries */
    short * indecies0; /* 64 indecies */
    short * indecies1; /* 128 indecies */
    short * indecies2; /* 16 indecies */
    float unk0x18;
    int unk0x1c;
    uint unk0x20;
    ushort unk0x24;
    undefined2 unk0x26;
    undefined2 ptr0Count;
    undefined2 ptr1count;
    undefined2 prt2count;
    undefined2 unk0x2e;
    undefined1 unk0x30;
    byte pad[3];
};

struct struct_unk_1 {
    u8 * unk0x0;
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    u8 unk0x8;
    u8 unk0x9;
    u8 unk0xa;
    u8 unk0xb;
    u8 unk0xc;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
    u8 unk0x10;
    u8 unk0x11;
    u8 unk0x12;
    u8 unk0x13;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    u8 unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
    u8 unk0x1c;
    u8 unk0x1d;
    u8 unk0x1e;
    u8 unk0x1f;
    u8 unk0x20;
    u8 unk0x21;
    u8 unk0x22;
    u8 unk0x23;
    u8 unk0x24;
    u8 unk0x25;
    u8 unk0x26;
    u8 unk0x27;
    uint unk0x28;
    u8 unk0x2c;
    u8 unk0x2d;
    byte unk0x2e;
    u8 unk0x2f;
};

typedef struct StringCheat StringCheat, *PStringCheat;

struct StringCheat { /* struct used for cheat functions */
    char * code;
    ulong (* cheat)(void);
};

typedef struct struct struct, *Pstruct;

struct struct {
    struct AnimationData * anidat;
    u16 flags;
    u8 unk0x6;
    u8 unk0x7;
};

typedef struct struct_saveEntity struct_saveEntity, *Pstruct_saveEntity;

struct struct_saveEntity {
    u8 unk0x0;
    u8 unk0x1;
    u8 unk0x2;
    u8 unk0x3;
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    u8 unk0x8;
    u8 unk0x9;
    u8 unk0xa;
    u8 unk0xb;
    u8 unk0xc;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
    u8 unk0x10;
    u8 unk0x11;
    u8 unk0x12;
    u8 unk0x13;
    u8 unk0x14;
    u8 unk0x15;
    u8 unk0x16;
    u8 unk0x17;
    u8 unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
    u8 unk0x1c;
    u8 unk0x1d;
    u8 unk0x1e;
    u8 unk0x1f;
    u8 unk0x20;
    u8 unk0x21;
    u8 unk0x22;
    u8 unk0x23;
};

typedef struct struct_unk struct_unk, *Pstruct_unk;

struct struct_unk {
    ulong (* check_trigger_func)(void);
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    u8 unk0x8;
    u8 unk0x9;
    u8 unk0xa;
    u8 unk0xb;
    u8 unk0xc;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
    uint particleRngSeed;
    undefined2 particle_func_flag;
    undefined8 unk0x16;
    undefined2 unk0x1e;
    byte textKerning[108];
};

typedef struct sundail_struct sundail_struct, *Psundail_struct;

struct sundail_struct {
    struct Borg_8_header * Ring;
    struct Borg_8_header * Cross;
    struct Borg_8_header * MoonPhase0;
    struct Borg_8_header * MoonPhase1;
    struct Borg_8_header * MoonPhase2;
    struct Borg_8_header * MoonPhase3;
    struct Borg_8_header * MoonPhase4;
    struct Borg_8_header * MoonPhase5;
    struct Borg_8_header * SunBig;
    struct Borg_8_header * SunSmall;
    byte moon;
    byte sun;
    byte align[2];
};

typedef struct TerrainStruct TerrainStruct, *PTerrainStruct;

typedef enum TimeOfDay {
    AFTERNOON=2,
    EVENING=3,
    MIDDAY=1,
    MORNING=0,
    NIGHT=4
} TimeOfDay;

struct TerrainStruct {
    ushort a; /* set to 72 (0x48) */
    enum TimeOfDay partOfDay; /* 21-6 night, 6-9 morning, 9-12 midday, 12-17 afternoon, 17-21 evening */
    byte moonPhases; /* ranges from 0-3 */
    char windByte;
    char DayNightMagic;
    enum PRECIPITATION rainByte; /* clear, rain, snow */
    char unused;
    float weatherFloatA;
    float weatherFloatB;
    float weatherFloatC;
    vec3 coords; /* Wind velocity */
    uint InGameTime; /* measured in seconds * 60 */
    byte terrain; /* detemines terrain? */
    byte pad[3];
    float TimeOfDayFloat;
    float float0x2c;
    float float0x30;
    int PlayTime;
};

typedef unsigned short    wchar16;
typedef struct VoxelChartEntry VoxelChartEntry, *PVoxelChartEntry;

struct VoxelChartEntry {
    short arg0;
    bool bool0x2;
    byte arg7;
    byte MapDatA;
    byte MapShortA;
    byte MapShortB;
    byte type; /* VOBJECT */
    undefined4 unk0x8;
};

typedef struct weapon_pointer weapon_pointer, *Pweapon_pointer;

struct weapon_pointer {
    byte Total;
    byte Types[11];
    byte Types2[11];
    byte pad;
    struct weapon_ram * weapons;
};

typedef struct WeatherTemp WeatherTemp, *PWeatherTemp;

struct WeatherTemp {
    float floatA;
    float floatB;
    float floatC;
    enum PRECIPITATION precip;
    u8 unk0xd;
    u8 unk0xe;
    u8 unk0xf;
};

typedef struct widget_contpak widget_contpak, *Pwidget_contpak;

struct widget_contpak {
    struct widgetStruct base;
    undefined4 unk0x7c;
    struct widgetStruct * wiget_link;
    byte unk0x84;
    enum PFS_ERR8 pfserr;
    byte unk0x86;
    char unk0x87;
    undefined4 unk0x88;
    struct WidgetHandler handler;
    enum CONT_STATUS contStat;
    u8 unk0x95;
    u8 unk0x96;
    u8 unk0x97;
};

typedef struct widget_contPakData widget_contPakData, *Pwidget_contPakData;

struct widget_contPakData {
    struct widgetStruct base;
    byte substruct[16][32];
    undefined4 unk0x27c;
    undefined4 unk0x280;
    undefined4 unk0x284;
    undefined4 unk0x288;
    byte unk0x28c;
    enum PFS_ERR8 pfsErr; /* shortened to 1 byte */
    u8 unk0x28e;
    byte unk0x28f;
    u8 unk0x290;
    u8 unk0x291;
    undefined2 unk0x292;
    undefined2 unk0x294;
    u8 unk0x296;
    u8 unk0x297;
    enum Borg8Enum borg8;
    undefined4 unk0x29c;
    struct widgetStruct * unk0x2a0;
    u8 unk0x2a4;
    struct color col0;
    struct color col1;
    struct color col2;
    u8 unk0x2b1;
    u8 unk0x2b2;
    u8 unk0x2b3;
    undefined4 unk0x2b4;
    enum CONT_STATUS contStatus;
    u8 unk0x2b9;
    u8 unk0x2ba;
    u8 unk0x2bb;
    struct WidgetHandler widgetHandler;
    void * dataBuffer;
    s32 unk0x2c8;
};

typedef struct widget_Credits widget_Credits, *Pwidget_Credits;

struct widget_Credits {
    struct widgetStruct base;
    byte unk0x7c;
    u8 unk0x7d;
    u8 unk0x7e;
    u8 unk0x7f;
    u8 unk0x80;
    u8 unk0x81;
    u8 unk0x82;
    u8 unk0x83;
    struct widgetStruct * unk0x84;
    byte unk0x88;
    byte unk0x89;
    byte unk0x8a;
    u8 unk0x8b;
    struct Borg_12_header * bgm;
    u8 unk0x90;
    u8 unk0x91;
    u8 unk0x92;
    u8 unk0x93;
    u8 unk0x94;
    u8 unk0x95;
    u8 unk0x96;
    u8 unk0x97;
    float BGMVol;
    float SFXVol;
};

typedef struct WidgetDebugBig WidgetDebugBig, *PWidgetDebugBig;

struct WidgetDebugBig {
    struct widgetStruct base;
    struct widgetStruct * extra;
};

