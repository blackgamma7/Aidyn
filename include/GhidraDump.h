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
typedef struct astruct_12 astruct_12, *Pastruct_12;

typedef struct widgetStruct widgetStruct, *PwidgetStruct;

typedef struct dialougmode_substruct dialougmode_substruct, *Pdialougmode_substruct;

typedef struct borg_13_data borg_13_data, *Pborg_13_data;

typedef struct color color, *Pcolor;

typedef struct Borg_8_header Borg_8_header, *PBorg_8_header;

typedef struct WidgetMethods WidgetMethods, *PWidgetMethods;

typedef struct struct_3 struct_3, *Pstruct_3;

typedef struct borg_13_command borg_13_command, *Pborg_13_command;

typedef enum Event_flag_offset {
    !Slashing=3673,
    First Chest=1902,
    !bingo=3694,
    MeetAlaron=5,
    goblinAmbush=978,
    Rain1=2320,
    Rain0=2319,
    !Darkside=3675,
    flag_with_alaron?=590,
    First Chest_=1901,
    mergedwithshadow?=566,
    New Journal Entry?=3617,
    Got First Items?=3612,
    !Slashing get=3674,
    EnteredGwen=788,
    KendallsHat=10,
    ShadMergeCinematic=569,
    unsafeToCamp=5004,
    !Darkside get=3676,
    FirstMeetShadow=9,
    EndingCinematic=601,
    BuySpiceOffGnomes=45,
    FirstCinematic=3,
    Roo NameCinematic=590,
    Kendall's Hat?=2255,
    !cheater=3693
} Event_flag_offset;

typedef struct borgHeader borgHeader, *PborgHeader;

typedef struct Borg_8_dat Borg_8_dat, *PBorg_8_dat;

typedef uint u_int32_t;

typedef u_int32_t u32;

typedef struct Method Method, *PMethod;

typedef struct ItemID ItemID, *PItemID;

typedef enum borg13_commands {
    Get party size=30,
    crash game=49,
    take gold=37,
    Fade_in=1,
    shop=44,
    Is in party?=23,
    End_scene=34,
    give exp=56,
    check flag get rand=25,
    set_2_floats=35,
    remove_party_member=48,
    train skill=46,
    clear event flag=33,
    add_item=38,
    get money?=31,
    set event flag=32,
    add gold=36,
    look_for_item=39,
    Add_party_member=47,
    is item in inv?=26,
    best stat=27,
    loadMonster=16,
    battle_encounter?=45,
    worst stat=28,
    check event flag=24,
    play sfx=43,
    this_char stat=29
} borg13_commands;

typedef enum image_format {
    IA8=5,
    CI8=4,
    RBGA32=1,
    RGBA16=2
} image_format;

typedef ushort u_int16_t;

typedef u_int16_t u16;

typedef enum DBTypeEnum { /* Each Data category has an Id'ing byte */
    Glove=11,
    potion=16,
    UNK4=4,
    Scroll=17,
    KeyItem=18,
    dialougeEntity=20,
    LootDrop=8,
    Spell=3,
    Weapon=7,
    Empty=0,
    Amulet=19,
    Helmet=9,
    armor=5,
    Belt=14,
    cloak=10,
    Ring=12,
    Boots=15,
    sheild=6,
    wand=13,
    entity=2,
    Misc_item=1
} DBTypeEnum;

struct color {
    byte R;
    byte G;
    byte B;
    byte A;
};

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
    ushort text_marker;
    u8 unk0x22[2];
    ushort a;
    ushort b;
    byte index;
    byte c;
    u8 unk0x2a[7];
    byte bitmask;
    u8 unk0x32[6];
};

struct Method { // Methods seem to have 4-byte padding, for some reason
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
    enum Event_flag_offset flag;
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

typedef struct astruct_3 astruct_3, *Pastruct_3;

typedef float vec3[3];

struct astruct_3 {
    vec3 v3;
    short unk0xc;
    undefined2 unk0xe;
};

typedef struct astruct_4 astruct_4, *Pastruct_4;

typedef enum Borg12Enum { // music, sfx
    Fire Crackle=1819,
    Metal Knink 2=1793,
    Waterfall=1817,
    Metal klink=1791,
    chime scale=1511,
    Coins_jingle=1837,
    Cheat Correct=1816,
    door Open?=1835,
    cursor tick=1851,
    Heavy Whack=1871,
    coughing=1865,
    Creak open=1836,
    rolling thunder=1822,
    Bag Open?=1828,
    Medium Whack=1829,
    coin jingle=1838,
    Explosion Bang=1831,
    Menu_Scroll=1870,
    Intro_Exp=1586,
    Cheat Fail=1825,
    Menu_open=1869,
    Cursor chirp=1853,
    Tacet=0,
    Chest Open=1833,
    Metal Klink=1792,
    menu select=1857,
    Cheat not used=1824,
    Intro_NoExp=1497,
    thunderstorm=1823,
    Underwater_noise=1820,
    Light Whack=1832
} Borg12Enum;

struct astruct_4 {
    u8 unk0x0;
    u8 unk0x1;
    short unk0x2;
    undefined2 unk0x4;
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
    float unk0x14;
    u8 unk0x18;
    u8 unk0x19;
    u8 unk0x1a;
    u8 unk0x1b;
    u8 unk0x1c;
    u8 unk0x1d;
    undefined2 unk0x1e;
    u8 unk0x20;
    u8 unk0x21;
    u8 unk0x22;
    u8 unk0x23;
    u8 unk0x24;
    u8 unk0x25;
    u8 unk0x26;
    u8 unk0x27;
    undefined2 unk0x28;
    u8 unk0x2a;
    u8 unk0x2b;
    u8 unk0x2c;
    u8 unk0x2d;
    u8 unk0x2e;
    u8 unk0x2f;
    enum Borg12Enum unk0x30;
    undefined4 unk0x34;
    undefined4 unk0x38;
    u8 unk0x3c;
    u8 unk0x3d;
    u8 unk0x3e;
    u8 unk0x3f;
    u8 unk0x40;
    u8 unk0x41;
    u8 unk0x42;
    u8 unk0x43;
    undefined2 unk0x44;
    u8 unk0x46;
    u8 unk0x47;
    float unk0x48;
    undefined4 unk0x4c;
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
    int unk0x74;
};

typedef struct astruct_6 astruct_6, *Pastruct_6;

typedef struct playerData playerData, *PplayerData;

typedef struct Borg_7_header Borg_7_header, *PBorg_7_header;

typedef enum Borg7Enum { /* entity model data? */
    jundar woman=10937,
    phelan=10248,
    Ogre=12877,
    magic wave effect=7613,
    lich=13275,
    Alaron=9721,
    skeleton=13162,
    Candlestick=6234,
    pocho=12976,
    ball of light=7620,
    Guard=10840,
    godric=10783,
    Chaos Trooper=11906,
    Donovan=10388,
    king=10520,
    Arturo=9789,
    Jundar guard=10963,
    rocky magic pylon=3436,
    horse=12616,
    sand worm=13076,
    Rheda=11263,
    dryad=10460,
    old bearded man=10289,
    Keelin=11049,
    chaos scout=11830,
    sholeh=11370,
    Man in tan shirt=10180,
    chicken=12018,
    woman in olive dress=10119,
    Man in blue shirt=10160,
    Shadow=11287,
    wind elemental=12134,
    salamander=13048,
    Chaos slayer=12001,
    grated sinking gate=3289,
    woman in red dress=10098,
    jundar man=10988,
    abrecan=9672,
    Baird=9851,
    zombie=13449,
    cyclops=12062,
    goblin=12313,
    Becan=10011,
    scorpion=13127,
    Blank=0,
    man in rocking chair=11073,
    Yeraza=11469,
    Kitarak=12576,
    Gryphon=12436,
    wolf=13314,
    Bandit=9900,
    woman in blue dress=10140,
    giant bat=11594,
    Chaos Sorceror=11958,
    cauldron=3500,
    whirling effect=7677,
    Ship=3523,
    wyvern=13411,
    Wraith=13364
} Borg7Enum;

typedef float Vec2[2];

typedef struct collisionStruct collisionStruct, *PcollisionStruct;

typedef struct vec7 vec7, *Pvec7;

typedef struct collisionTypeA collisionTypeA, *PcollisionTypeA;

typedef struct Button_hold Button_hold, *PButton_hold;

typedef enum BUTTON_aidyn { /* extension of Button definitions to include Analog */
    A_BUTTON=32768,
    ANA_RIGHT=131072,
    C_RIGHT=1,
    D_LEFT=512,
    D_RIGHT=256,
    C_UP=8,
    ANA_LEFT=65536,
    C_LEFT=2,
    C_DOWN=4,
    ANA_UP=524288,
    START_BUTTON=4096,
    ANA_DOWN=262144,
    D_UP=2048,
    D_DOWN=1024,
    Z_BUTTON=8192,
    R_BUTTON=16,
    L_BUTTON=32,
    B_BUTTON=16384
} BUTTON_aidyn;

typedef int s32;

typedef struct AnimationData AnimationData, *PAnimationData;

typedef struct borg_6_header borg_6_header, *Pborg_6_header;

typedef enum borg6Enum {
    Fycam_2=8670,
    Flycam_1=8668,
    intro_13=9147,
    intro_12=9105,
    flycam_3=8674,
    intro_2=8812,
    flycam_4=8676,
    intro_1=8729,
    flycam_5=8678,
    intro_11=9052,
    flycam_6=8680,
    intro_10=9043,
    intro_6=8918,
    intro_5=8864,
    intro_4=8857,
    intro_3=8850,
    intro_9=8988,
    intro_8=8955,
    intro_7=8941
} borg6Enum;

typedef struct controller_aidyn controller_aidyn, *Pcontroller_aidyn;

typedef struct Borg_5_header Borg_5_header, *PBorg_5_header;

typedef float vec4[4];

typedef struct Borg_3 Borg_3, *PBorg_3;

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
    byte unk_0x218[7][16];
    struct color lightColors[4];
    uint maxDynamicLights; /* no more than 7 */
    uint unk0x29c;
    u8 unk0x2a0;
    u8 unk0x2a1;
    u8 unk0x2a2;
    u8 unk0x2a3;
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
    u8 * unk0x28;
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
    u8 unk0x58;
    u8 unk0x59;
    u8 unk0x5a;
    u8 unk0x5b;
    undefined4 unk0x5c;
    u8 unk0x60;
    u8 unk0x61;
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
    struct astruct_3 unk_0x154[16];
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
    float unk0x770;
    float unk0x774;
    float unk0x778;
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
    pointer unk0x1c;
    undefined4 unk0x20;
    undefined4 unk0x24;
    undefined4 unk0x28;
    undefined4 unk0x2c;
    undefined4 unk0x30;
    undefined4 unk0x34;
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
    u8 unk0x50;
    u8 unk0x51;
    u8 unk0x52;
    u8 unk0x53;
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

struct astruct_6 {
    struct playerData * unk0x0;
    ushort unk0x4;
    byte unk0x6;
    u8 unk0x7;
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

typedef struct astruct_9 astruct_9, *Pastruct_9;



struct astruct_9 {
    enum POTION unk0x0;
    enum POTION unk0x1;
    u8 unk0x2;
    u8 unk0x3;
    undefined4 unk0x4;
    undefined4 unk0x8;
};

typedef struct borg9_phys borg9_phys, *Pborg9_phys;

struct borg9_phys {
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
    vec3 vec3_0xc;
    u8 * ptr_0x18;
    ushort shortA;
    ushort shortB;
};

typedef struct combat_ai combat_ai, *Pcombat_ai;

typedef struct CombatEntity CombatEntity, *PCombatEntity;

typedef enum Struct_char_flags {
    flag12=2048,
    flag11=1024,
    flag9=256,
    flag14=8192,
    flag8=128,
    flag13=4096,
    flag7=64,
    flag6=32,
    flag5=16,
    flag10=512,
    flag4=8,
    flag3=4,
    flag2=2,
    flag1=1,
    flag16=32768,
    flag15=16384
} Struct_char_flags;

typedef struct resist_float resist_float, *Presist_float;

typedef struct CharSheet CharSheet, *PCharSheet;


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
    Necromancy=3,
    Star=5,
    NONE=4,
    Naming=2,
    Elemental=1
} MagicSchoolEnum;

typedef enum CharSheetFlags {
    Protag=1,
    IsSolar=4
} CharSheetFlags;

typedef enum ASPECT {
    Solar_magic=3,
    Lunar=1,
    Solar=2,
    Lunar_magic=4,
    NONE=0
} ASPECT;

typedef struct Temp_spell Temp_spell, *PTemp_spell;

typedef struct Temp_enchant Temp_enchant, *PTemp_enchant;

typedef enum WeaponClassEnum {
    Sword=8,
    Breath=1,
    Hafted=3,
    Sting=7,
    Bite=0,
    Missle=4,
    Pole=5,
    Thrown=9,
    Tusk=10,
    Claw=2,
    Spit=6
} WeaponClassEnum;

typedef struct temp_gear temp_gear, *Ptemp_gear;

typedef enum MagicCastedEnum {
    ALL=2,
    ONE=1,
    SELF=0,
    RANK=3
} MagicCastedEnum;

typedef enum MagicTargetEnum {
    All=4,
    All_in_Area=3,
    outside_Combat=0,
    Party_in_Area=1,
    Enemy_in_Area=2
} MagicTargetEnum;

typedef enum MigicCostEnum {
    Gemstone=3,
    Spice=1,
    NONE=0,
    Herb=2
} MigicCostEnum;

typedef enum SpellEnum {
    controlZombies=27,
    strength=10,
    stamina=32,
    stellarGravity=56,
    dispelNaming=43,
    detectingTraps=18,
    AcidBolt=24,
    removePoison=2,
    photosynthesis=46,
    tapStamina=33,
    stealth=55,
    vsElemental=38,
    darkness=29,
    NONE=255,
    wallOfBones=34,
    lightning=9,
    controlMarquis=17,
    teleportation=12,
    detectMoonPhase=49,
    brilliance=13,
    detectSunPhase=50,
    solarWraith=47,
    dispelStar=45,
    light=54,
    DragonFlames=6,
    whitefire=58,
    charming=16,
    webOfStarlight=57,
    wind=11,
    clumsiness=52,
    mirror=37,
    cheatDeath=23,
    ControlElem=4,
    endurance=19,
    Immolation=0,
    weakness=22,
    dispelNecro=44,
    banishing=15,
    starlightSheild=48,
    senseAura=21,
    escape=1,
    fireball=8,
    dispelElemental=42,
    stupidity=14,
    wraithTouch=26,
    poison=36,
    exhaustion=31,
    haste=30,
    opening=20,
    spiritSheild=35,
    dexterity=51,
    vsNecromancy=40,
    AirSheild=3,
    auraOfDeath=25,
    frozenDoom=53,
    vsStar=41,
    EarthSmite=7,
    debilitation=5,
    crushingDeath=28,
    vsNaming=39
} SpellEnum;

struct CharGear {
    struct temp_gear * * pItem;
    char num_used;
    char unk0x5;
    u8 unk0x6;
    u8 unk0x7;
};

struct Potion_effect {
    enum POTION ID;
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
    byte lv;
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
    enum ASPECT aspect;
    byte range;
    enum MigicCostEnum cost;
    ushort exp_modifyer;
    byte aspect_flag; /* ram0x1f */
    u8 unk0x21;
    u8 unk0x22;
    u8 unk0x23;
};

struct resist_float { /* resistance and element when loaded into temp item */
    enum ELEMENT element;
    byte pad[3];
    float percent;
};

struct charExp { /* data containing EXP, School, Aspect and more. */
    byte rom0x2b; /* Ent_rom data 0x2b. dunno if used */
    enum MagicSchoolEnum school;
    byte protection; /* protecttion, looks like */
    byte damage; /* damage seems to be */
    uint total; /* for level up */
    uint spending; /* for training */
    enum CharSheetFlags flags; /* set for alaron? */
    byte f;
    byte g;
    byte h;
};



struct Temp_weapon {
    struct ItemID id;
    u8 unk0x2;
    u8 unk0x3;
    char * name;
    enum ASPECT aspect;
    u8 unk0x9;
    ushort price;
    byte[2] * Stat;
    struct Temp_spell * spell;
    char unk0x14;
    char unk0x15;
    u8 unk0x16;
    byte req Str;
    byte[2] * SkillMod;
    struct Temp_enchant * enchantment;
    struct resist_float * resist;
    enum WeaponClassEnum weapon type;
    byte hit;
    byte damage;
    byte range;
    byte animation;
    enum ELEMENT element;
    u8 unk0x2a;
    u8 unk0x2b;
};

struct CombatEntity {
    vec4 unk0x0;
    uint unk0x10;
    undefined2 unk0x14;
    u8 unk0x16;
    u8 unk0x17;
    undefined2 unk0x18;
    undefined2 unk0x1a;
    undefined2 unk0x1c;
    ushort unk0x1e;
    byte index;
    byte move_length;
    u8 unk0x22;
    u8 unk0x23;
    u8 unk0x24;
    byte unk0x25;
    u8 unk0x26;
    enum POTION item?;
    byte unk0x28;
    byte damage;
    u8 unk0x2a;
    u8 unk0x2b;
    enum Struct_char_flags flags?;
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
    float scale?[10];
};

struct temp_gear {
    struct ItemID id;
    u8 unk0x2;
    u8 unk0x3;
    char * name;
    enum ASPECT aspect;
    u8 unk0x9;
    ushort price;
    byte[2] * statmod;
    struct Temp_spell * pSpell;
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

struct spellbook { /* pointer and count of spells */
    struct Temp_spell * spells;
    byte spell_count;
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
    byte unk0x6;
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

struct temp_armor {
    struct ItemID id;
    u8 unk0x2;
    u8 unk0x3;
    char * name;
    enum ASPECT aspect;
    u8 unk0x9;
    ushort price;
    byte[2] * statMod;
    struct Temp_spell * spell;
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

typedef struct particleStruct particleStruct, *PparticleStruct;

struct particleStruct {
    undefined2 unk0x0;
    undefined2 unk0x2;
    undefined2 unk0x4;
    undefined2 unk0x6;
    undefined2 unk0x8;
    ushort flags;
    vec3 unk0xc;
    vec3 unk0x18;
    float unk0x24;
    float unk0x28;
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
    vec3 unk0x4c;
    u8 unk0x58[328];
};

typedef struct romcopy_struct romcopy_struct, *Promcopy_struct;


typedef enum enum_OSPri {
    SIMGR=140,
    APPMAX=127,
    MAX=255,
    IDLE=0,
    PIMGR=150,
    VIMGR=254,
    RMON=250,
    RMONSPIN=200
} enum_OSPri;



struct romcopy_struct {
    OSMesg msg;
    struct OSMesgQueue msgQ;
    void * VAddr;
    u32 devAddr;
    u32 Bytes;
};

typedef struct Some_char_sheet_struct Some_char_sheet_struct, *PSome_char_sheet_struct;

struct Some_char_sheet_struct {
    struct temp_gear * * pItem;
    char unk0x4;
    char unk0x5;
    u8 unk0x6;
    u8 unk0x7;
};

typedef struct someParticleStruct someParticleStruct, *PsomeParticleStruct;

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
    ulong (* unk0x1bc)(void);
    undefined4 unk0x1c0;
    undefined4 unk0x1c4;
    undefined4 unk0x1c8;
    u8 unk0x1cc;
    u8 unk0x1cd;
    u8 unk0x1ce;
    u8 unk0x1cf;
    u8 unk0x1d0;
    u8 unk0x1d1;
    u8 unk0x1d2;
    u8 unk0x1d3;
    u8 unk0x1d4;
    u8 unk0x1d5;
    u8 unk0x1d6;
    u8 unk0x1d7;
    u8 unk0x1d8;
    u8 unk0x1d9;
    u8 unk0x1da;
    u8 unk0x1db;
    u8 unk0x1dc;
    u8 unk0x1dd;
    u8 unk0x1de;
    u8 unk0x1df;
    u8 unk0x1e0;
    u8 unk0x1e1;
    u8 unk0x1e2;
    u8 unk0x1e3;
    u8 unk0x1e4;
    u8 unk0x1e5;
    u8 unk0x1e6;
    u8 unk0x1e7;
    u8 unk0x1e8;
    u8 unk0x1e9;
    u8 unk0x1ea;
    u8 unk0x1eb;
    u8 unk0x1ec;
    u8 unk0x1ed;
    u8 unk0x1ee;
    u8 unk0x1ef;
    u8 unk0x1f0;
    u8 unk0x1f1;
    u8 unk0x1f2;
    u8 unk0x1f3;
    u8 unk0x1f4;
    u8 unk0x1f5;
    u8 unk0x1f6;
    u8 unk0x1f7;
    u8 unk0x1f8;
    u8 unk0x1f9;
    u8 unk0x1fa;
    u8 unk0x1fb;
    u8 unk0x1fc;
    u8 unk0x1fd;
    u8 unk0x1fe;
    u8 unk0x1ff;
    u8 unk0x200;
    u8 unk0x201;
    u8 unk0x202;
    u8 unk0x203;
    u8 unk0x204;
    u8 unk0x205;
    u8 unk0x206;
    u8 unk0x207;
    u8 unk0x208;
    u8 unk0x209;
    u8 unk0x20a;
    u8 unk0x20b;
    u8 unk0x20c;
    u8 unk0x20d;
    u8 unk0x20e;
    u8 unk0x20f;
};

typedef struct Temp_Armor Temp_Armor, *PTemp_Armor;

struct Temp_Armor {
    struct ItemID unk0x0;
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
    byte unk1;
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
    byte defence;
    byte protection;
    byte dex;
    byte stealth;
};

typedef enum borg13Enum {
    king dies=1278,
    Help menu=1355,
    goblin ambush=869,
    alaron dies=1298,
    alaron dies 2=1299,
    alaron dies 3=1300
} borg13Enum;

typedef enum Borg8Enum { /* Sprites/Textures */
    butterfly amulet=13760,
    Diplomat icon=388,
    healer icon=389,
    Sundail Cross=442,
    white 10px funnel=428,
    leafy book bg=13830,
    chrome pendant=13758,
    66 px highlight=245,
    leather glove icon=13781,
    Middle-aged male citizen portait=293,
    pause menu bg 2=216,
    Gwen map overlay=457,
    leather breastplate=13761,
    hourglass=421,
    long down arrow=213,
    ranger icon=393,
    cyclops_Hurlstar=14422,
    new moon=404,
    Square highlight 52=223,
    Goblin portait=318,
    10 px Circled Cross=434,
    blue hat icon=13783,
    Sword Icon 2=13807,
    Terminor Marker=14272,
    Tentacle portait=366,
    JOURNAL=230,
    2 pad icon=13777,
    white 10px sphere=427,
    parchment icon=13794,
    galaxy swirl?=464,
    musical notes=6842,
    OPTIONS=253,
    TRAIN=239,
    pinwheel fruit?=13756,
    keelin portrait=335,
    16 px circle=403,
    sword icon=13806,
    pillar=409,
    round sheild icon=13803,
    white ring=127,
    CONTROLLER PAK=247,
    Parchment background=226,
    Warning_No_Controller=251,
    square highlight=243,
    glove slot icon=13816,
    IconPotion=13797,
    Pause Menu Calender Map=218,
    metal breastplate=13762,
    PAUSE=254,
    theif icon=395,
    white 10px inversion=430,
    QuestinmarkIcon=13788,
    staff icon 2=13805,
    Cuccoon=13768,
    sundail moon quarter=436,
    Godrik portrait=320,
    Licenced by Nintendo=250,
    blood drop=423,
    Book BG 2=13827,
    Book background=386,
    THQ logo=257,
    troubador icon=396,
    16 px gradient=450,
    2 black pixels=453,
    SPELLS=237,
    Corner gradient=447,
    Gwen Castle Warp gate=161,
    Heart Amulet=13759,
    star=424,
    Compass north=24,
    stealth icon=394,
    Giant bat portrait=272,
    Circlet=13767,
    Minotuar portait=14406,
    banner portait=384,
    solar aspect=420,
    Sundail Moon=440,
    PRESS START=258,
    full metal chestplate=13764,
    alchemist icon=387,
    Signpost portait=385,
    wizard icon=398,
    Spotlight?=13826,
    scroll icon=13801,
    Bow and arrow icon=13770,
    map marker=246,
    blank space?=248,
    28 px soft edge square=454,
    compass ring=27,
    Alaron Portait=264,
    MENU=242,
    Shadow portait=361,
    club icon=13774,
    horizontal hourglass=426,
    Some Face?=3514,
    warrior icon=397,
    Warning_No_Controller_Pak=252,
    Title Card=259,
    half moon=14240,
    Parchment Window 2=229,
    throwing iron icon=13808,
    H2o logo=222,
    up arrow=14544,
    CurrDayMarker=220,
    Cloack Icon=13771,
    Sun texture?=418,
    INVENTORY=233,
    Sheild slot icon=13823,
    Parchment bg=13829,
    herb icon=13786,
    key icon 3=13791,
    key icon 2=13790,
    ENTER NAME=249,
    Horse potrait=14423,
    CAMP=221,
    Flag/sythe=13766,
    cloud 2=400,
    Parchment BG 2=13832,
    THEATER=256,
    Chaos Scout Portait=284,
    Kendall's hat icon=13784,
    SKILLS=236,
    Ritual=14171,
    mace icon=13793,
    crystal ball icon=13779,
    staff icon=13776,
    Title Card Shadow=260,
    abrecan portait=262,
    purple cloack icon=13773,
    Blue plaque bg=13831,
    cloud 3=401,
    pike icon=13795,
    2 horizontal arrows=14166,
    Parchment shadow=228,
    Spacer=215,
    loremaster icon=390,
    plaque BG=13828,
    1 pixel?=452,
    full chestplate=13763,
    Main Font=29,
    full_moon=408,
    Pause Menu status=217,
    harp icon=13782,
    mechanic icon=391,
    Parchment Background_2=227,
    gradient circle=422,
    merchant icon=392,
    snake/horn?=13792,
    sicle icon=13802,
    This game is not designed for use on this system=14275,
    crecent moon=14239,
    Ugarit Marker=14273,
    Bear portait=274,
    Boot icon=13769,
    Crossbone overlay=365,
    66 px highligh 2=244,
    Staff Slot Icon=13824,
    leather hood icon=13785,
    cloak slot icon=13815,
    3_4_moon=407,
    waxing crecent=405,
    14px square=455,
    No Expansion pak=14169,
    PortSaidMarker=14270,
    lunar aspect=419,
    green crystal ball icon=13780,
    first qarter=406,
    24 px octagon=160,
    white 10x chain=431,
    skull=425,
    Sheridan Portait=362,
    helmet slot icon=13817,
    SAVE GAME=255,
    16 px filled circle=402,
    42 px box=261,
    green cloack icon=13772,
    gemstone icon=13778,
    16px gradient=451,
    Expansion Pak detected=14168,
    Start of Map icons=30,
    Fire effect?=3424,
    Axe=13765,
    hide icon=13787,
    Amulet=13757,
    Cloud=399,
    Sword slot icon=13825,
    key icon=13789,
    white 10px rings=429,
    swrord icon=13775
} Borg8Enum;

typedef enum borg9Enum {
    StartingMap=4059,
    oriana's hut=5266,
    campfire=6236
} borg9Enum;

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
    u8 unk0x8;
    u8 unk0x9;
    u8 unk0xa;
    u8 unk0xb;
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

typedef struct Borg_4 Borg_4, *PBorg_4;

struct Borg_4 {
    float floats[3];
    byte blank?[8];
};

typedef struct Borg_9_data Borg_9_data, *PBorg_9_data;

typedef struct ref_obj ref_obj, *Pref_obj;

typedef struct borg_9_struct borg_9_struct, *Pborg_9_struct;

typedef struct voxelHeader voxelHeader, *PvoxelHeader;

typedef enum ref_obj_bitfeild {
    EXPPak=32,
    visible=32768,
    Used=512,
    no_expPak=64,
    tangible=8192
} ref_obj_bitfeild;

typedef enum Vobject {
    Teleporter=7,
    SavePoint=11,
    Scene=0,
    MonsterParty=5,
    Code=12,
    Container=1,
    Trigger=10,
    ReferencePoint=6,
    Light=2,
    WanderNode=4,
    Camera=8,
    Audio=3,
    Dialouge=9
} Vobject;

struct voxelHeader { /* Header for Refernce objects (Voxels) */
    vec3 coords; /* Where is it */
    float size; /* how big is it */
    uint timestamp; /* when was it called */
    enum ref_obj_bitfeild Bitfeild; /* Flags for rendering */
    enum Vobject type; /* object type */
    short Link ID[2]; /* usually 0xFFFFFFFF (none) */
    undefined2 flagA; /* event flags */
    enum Event_flag_offset flagB;
    enum Event_flag_offset flagC;
    u8 unk0x22;
    u8 unk0x23;
    void * ptr0x24;
};

struct ref_obj {
    struct voxelHeader header;
    byte data[68];
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
    struct ref_obj * ref_objs;
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

typedef struct Borg_9_header Borg_9_header, *PBorg_9_header;

struct Borg_9_header {
    enum borg9Enum ID;
    u8 unk0x4;
    u8 unk0x5;
    u8 unk0x6;
    u8 unk0x7;
    struct Borg_9_data dat;
};

typedef struct borg_short borg_short, *Pborg_short;

struct borg_short {
    enum borg13Enum borg_13;
    u16 pad;
    short some_num;
};

typedef struct combat_aiscore combat_aiscore, *Pcombat_aiscore;

struct combat_aiscore {
    byte spell_pri;
    byte x;
    byte y;
    byte unk0x3;
    struct CombatEntity * combatEnt;
};

typedef struct combat_marker combat_marker, *Pcombat_marker;

struct combat_marker {
    struct Borg_5_header * borg;
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
    byte unk0xa4;
    byte unk0xa5;
    char unk0xa6;
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

typedef struct DialougEnt_RAM DialougEnt_RAM, *PDialougEnt_RAM;

struct DialougEnt_RAM {
    struct ItemID ID;
    char name[22];
    byte a; /* unused, set to 0 */
    byte b;
};

typedef struct Gear_RAM Gear_RAM, *PGear_RAM;

typedef enum CHAR_STAT {
    STR=4,
    DEX=2,
    END=3,
    LV=6,
    WIL=1,
    STAM=5,
    NONE=255,
    INT=0
} CHAR_STAT;

typedef enum CHAR_SKILL {
    Mechanic=4,
    Ranger=6,
    Warrior=10,
    Troubadour=9,
    Healer=2,
    Alchemist=0,
    Diplomat=1,
    Merchant=5,
    Stealth=7,
    Loremaster=3,
    NONE=255,
    Wizard=11,
    Theif=8
} CHAR_SKILL;

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
    enum ASPECT aspect;
    enum CHAR_STAT stat;
    byte Stat modifyer;
    enum CHAR_SKILL skill;
    byte skill modifier;
    byte spell;
    byte spell value;
    byte spell value 2;
    byte magic;
    byte magic ammount;
    enum ELEMENT element resist;
    u8 unk0x2b;
    float Resist percent;
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
    struct ItemID spell_id;
    char Name[23];
    byte Is_0;
    enum MagicSchoolEnum School;
    byte Damage;
    byte stamina;
    enum MagicCastedEnum CastedMagic;
    enum MagicTargetEnum Target;
    byte unk0x1f;
    byte WizardREQ;
    enum ASPECT Aspect;
    byte Range;
    enum MigicCostEnum ingredient;
    byte EXP_Modifyer;
    u8 unk0x25;
};

typedef struct Armour_ROM Armour_ROM, *PArmour_ROM;

typedef struct ItemID_ROM ItemID_ROM, *PItemID_ROM;

typedef enum ResistEnum { /* converted to float (1-(.25*x)) */
    -25=5,
    0=4,
    -100=8,
    100=0,
    25=3,
    -6275=255,
    -50=6,
    -75=7,
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
    enum ASPECT aspect;
    enum CHAR_STAT stat;
    char statNum;
    enum CHAR_SKILL skill;
    char skillNum;
    struct ItemID_ROM spell;
    byte SpellLV;
    byte unk0x2a;
    struct ItemID_ROM magic;
    byte magicLV;
    enum ELEMENT Element;
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

typedef enum EntityCatEnum { /* Entity Categories */
    Generic_NPC=0,
    Named_NPC=2,
    Chaos_Enemy=5,
    Natural_Enemy=6,
    Humanoid=1,
    Party_Character=3
} EntityCatEnum;

struct Entity_ROM { /* Entity data stored in Rom */
    char name[20];
    char internalName[20];
    enum EntityCatEnum category; /* only checks for Chaos type */
    struct ItemID_ROM id;
    byte unk0x2b; /* passed to ram 0x19 */
    enum ASPECT Aspect;
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
    enum ELEMENT ElementResist1;
    enum ResistEnum ResistAmmount1; /* 100-(25*x) */
    enum ELEMENT ElementResist2;
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
    enum ASPECT Aspect;
    enum CHAR_STAT stat;
    byte statMod;
    enum CHAR_SKILL Skill; /* Can also modify Stat */
    byte SkillMod;
    struct ItemID_ROM Spell;
    byte spell value;
    byte Spell VAlue 2;
    struct ItemID_ROM Magic;
    byte Magic ammount;
    enum ELEMENT Element Resist;
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
    x.75=1,
    x1.5=4,
    x1=2,
    x1.25=3,
    x2=5,
    x3=6,
    x5=7,
    x.5=0
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
    enum ASPECT Aspect;
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
    enum ELEMENT Element;
    enum ASPECT aspect;
    enum CHAR_STAT Stat enhanced;
    byte Stat Ammount;
    enum CHAR_SKILL Skill/stat enhanced;
    byte skill/stat ammount;
    struct ItemID_ROM Spell;
    byte spell Ammount;
    byte unk0x2a;
    struct ItemID_ROM Magic;
    byte Magic Ammount;
    enum ELEMENT Resist element;
    enum ResistEnum Resist percent;
};

typedef sbyte s8;

struct Entity_Ram { /* entity data in Ram */
    struct ItemID ID;
    char Name[21];
    enum EntityCatEnum Category;
    byte unk0x18; /* 2 bits determined by rom0x2d */
    byte rom0x2b;
    enum ASPECT aspect;
    byte rom0x4c; /* something to do with dying? */
    byte Level;
    byte rom0x4d;
    enum MagicSchoolEnum Magic school;
    byte unk0x1f; /* sheild related? */
    byte unk0x20; /* made to float */
    byte unk0x21;
    byte Skills[12];
    byte Weapon prof[11];
    byte stats[7];
    struct ItemID weapon[3];
    struct ItemID spells[5];
    byte Spell_levels[5];
    byte unk_0x55[5]; /* rom0x68 */
    ushort unk_0x5a; /* rom0x6d */
    struct ItemID Armor;
    struct ItemID Sheild;
    short unk_0x60;
    s8 sheildStat;
    enum ELEMENT Resist[2];
    byte align[3];
    float resist ammount[2];
    ushort FFs[4]; /* supposed to load something, but ends up blank */
    byte unk0x78[4];
    ushort EXP;
    byte loot_Category;
    u8 unk0x7f;
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
    byte EXPMod?; /* Lodin sword has set to 0x20 */
    enum ELEMENT element;
    enum ASPECT aspect;
    enum CHAR_STAT stat; /* Stat enhanced */
    byte stat ammount;
    enum CHAR_SKILL skill/stat enhanced; /* skill enhanced (or stat) */
    byte skill/stat ammount;
    enum SpellEnum spell 1;
    byte spell ammount;
    byte 0x2a in ram;
    enum SpellEnum spell 2;
    byte magic ammount;
    enum ELEMENT elementResist;
    undefined2 align;
    float ResistPercent;
};

typedef enum CONT_STATUS {
    CONT_CARD_PULL=2,
    CONT_ADDR_CRC_ER=4,
    CONT_EEPROM_BUSY=128,
    CONT_CARD_ON=1
} CONT_STATUS;



typedef struct Audio_obj Audio_obj, *PAudio_obj;

typedef struct audio_obj_dat audio_obj_dat, *Paudio_obj_dat;

struct audio_obj_dat {
    enum Borg12Enum index;
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

struct Audio_obj {
    struct voxelHeader header;
    struct audio_obj_dat dat;
};

typedef struct camera_obj camera_obj, *Pcamera_obj;

struct camera_obj {
    struct voxelHeader header;
    byte unk0x6[6];
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

typedef struct container_Dat container_Dat, *Pcontainer_Dat;

struct container_Dat {
    undefined4 unk0x0;
    float chest_size;
    enum Event_flag_offset open_flag;
    enum Event_flag_offset explode_flag;
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

typedef struct container_obj container_obj, *Pcontainer_obj;

struct container_obj {
    struct voxelHeader header;
    struct container_Dat dat;
};

typedef struct dialoug_dat dialoug_dat, *Pdialoug_dat;

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

typedef struct Dialoug_obj Dialoug_obj, *PDialoug_obj;

struct Dialoug_obj {
    struct voxelHeader header;
    struct dialoug_dat dat;
};

typedef struct light_obj light_obj, *Plight_obj;

typedef struct light_obj_dat light_obj_dat, *Plight_obj_dat;

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

struct light_obj {
    struct voxelHeader header;
    struct light_obj_dat data;
};

typedef struct monsterparty_dat monsterparty_dat, *Pmonsterparty_dat;

struct monsterparty_dat {
    struct ItemID enemyID;
    byte unk0x2;
    byte unk0x3;
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
    struct ItemID entityID;
    struct ItemID globalLoot;
    ushort unk0x24;
    u8 unk0x26;
    u8 unk0x27;
    u8 unk0x28;
    u8 unk0x29;
    u8 unk0x2a;
    byte RangerWarriorMulti;
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

typedef struct monsterparty_obj monsterparty_obj, *Pmonsterparty_obj;

struct monsterparty_obj {
    struct voxelHeader header;
    struct monsterparty_dat dat;
};

typedef struct referncepoint_obj referncepoint_obj, *Preferncepoint_obj;

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

typedef struct Scene_obj Scene_obj, *PScene_obj;

struct Scene_obj {
    struct voxelHeader header;
    u8 unk0x28;
    u8 unk0x29;
    u8 unk0x2a;
    u8 unk0x2b;
    undefined4 unk0x2c;
    struct Borg_7_header * unk0x30;
    u8 unk0x34;
    u8 unk0x35;
    u8 unk0x36;
    u8 unk0x37;
    uint borg5_index;
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
    vec3 unk0x58;
    u8 unk0x64;
    u8 unk0x65;
    u8 unk0x66;
    u8 unk0x67;
    ushort unk0x68;
    ushort unk0x6a;
};

typedef struct Scene_obj_dat Scene_obj_dat, *PScene_obj_dat;

struct Scene_obj_dat {
    u8 unk0x0;
    u8 unk0x1;
    u8 unk0x2;
    u8 unk0x3;
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
    u8 unk0x2c;
    u8 unk0x2d;
    u8 unk0x2e;
    u8 unk0x2f;
    vec3 unk0x30;
    u8 unk0x3c;
    u8 unk0x3d;
    u8 unk0x3e;
    u8 unk0x3f;
    ushort unk0x40;
    ushort unk0x42;
};

typedef struct teleport_dat teleport_dat, *Pteleport_dat;

typedef enum EnumMapDatA {
    Barrows=9,
    GwenCastle=4,
    cave=7,
    Battle=16,
    Overworld=0,
    Ugairt=13,
    Interior=6,
    EhudUnder=12,
    Talewok=11
} EnumMapDatA;

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
    enum Event_flag_offset lockpick_flag_2;
    undefined2 trap_flag;
    enum Event_flag_offset flag_0x3e;
    enum Event_flag_offset secrect_door_flag;
    ushort secretDoorVal;
    char name[16];
    u8 unk0x54[24];
};

typedef struct teleport_obj teleport_obj, *Pteleport_obj;

struct teleport_obj {
    struct voxelHeader header;
    struct teleport_dat dat;
};

typedef struct trigger_obj trigger_obj, *Ptrigger_obj;

struct trigger_obj {
    struct voxelHeader header;
    short triggertype; /* 1,2,4 are unique. */
    u8 unk0x2a;
    u8 unk0x2b;
    enum Event_flag_offset flagA;
    undefined2 unk0x2e;
    undefined2 unk0x30;
    u8 unk0x32;
    u8 unk0x33;
    ushort unk0x34;
    u8 unk0x36;
    u8 unk0x37;
    u8 unk0x38;
    u8 unk0x39;
    u8 unk0x3a;
    u8 unk0x3b;
    ushort unk0x3c;
    ushort unk0x3e;
    u8 unk0x40;
    u8 unk0x41;
    u8 unk0x42;
    u8 unk0x43;
    char name[16];
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

typedef union Voxel_u Voxel_u, *PVoxel_u;

union Voxel_u {
    struct ref_obj BaseRef;
    struct Audio_obj audio;
    struct monsterparty_obj monster;
    struct Scene_obj SCene;
    struct light_obj Light;
    struct referncepoint_obj refpoint;
    struct teleport_obj teleport;
    struct Dialoug_obj dialoug;
    struct trigger_obj trigger;
    struct camera_obj camera;
};

typedef struct Pause_Widget_struct Pause_Widget_struct, *PPause_Widget_struct;

typedef struct pause_Substruct pause_Substruct, *Ppause_Substruct;

typedef struct widget_dollmenu widget_dollmenu, *Pwidget_dollmenu;

typedef struct widget_calendar widget_calendar, *Pwidget_calendar;

typedef struct widget_character_stats widget_character_stats, *Pwidget_character_stats;

typedef struct widget_itemslots widget_itemslots, *Pwidget_itemslots;

typedef struct widget_barter widget_barter, *Pwidget_barter;

typedef struct widget_worldmap widget_worldmap, *Pwidget_worldmap;

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
    undefined4 takeInput;
};

struct widget_worldmap {
    struct widgetStruct base;
    struct color col0;
    struct color col1;
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

struct WorldMapPiece {
    enum Event_flag_offset eventFlag;
    enum Borg8Enum mapBorg8:16;
    ushort x;
    ushort y;
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

struct widget_dollmenu {
    struct widgetStruct base;
    struct widgetStruct * unk0x7c;
    struct widget_character_stats * charStats_widget;
    struct widget_itemslots * itemslots_widget;
    struct widget_child_3 * unk0x88;
    struct widget_barter * barter_widget;
    struct widgetStruct * unk0x90;
};

struct widget_calendar {
    struct widgetStruct base;
    struct widget_worldmap * map;
    struct color col0;
    struct color col1;
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

typedef struct WidgetHandler WidgetHandler, *PWidgetHandler;

struct WidgetHandler {
    struct widgetStruct * widgetA;
    struct widgetStruct * widgetB;
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

typedef struct armour_RAM armour_RAM, *Parmour_RAM;

struct armour_RAM {
    struct ItemID ID;
    char Name[23];
    byte is 0;
    byte slot;
    byte defence;
    byte protection;
    byte dex;
    byte rom0x1d;
    byte stealth;
    ushort price;
    byte expBonus;
    enum ASPECT aspect;
    enum CHAR_STAT stat;
    char statNum;
    enum CHAR_SKILL skill;
    char skillNum;
    enum SpellEnum spell;
    byte spellLV;
    byte rom0x2a; /* 10 for stardrake */
    enum SpellEnum magic;
    byte magic LV;
    enum ELEMENT element;
    u16 align;
    float resist percent;
};

struct ArmorPointer {
    byte armors;
    byte sheilds;
    byte total;
    byte pad;
    struct armour_RAM * Armor;
};

typedef struct audio_substruct_2 audio_substruct_2, *Paudio_substruct_2;

typedef struct some_sound_struct some_sound_struct, *Psome_sound_struct;

struct audio_substruct_2 {
    ushort index;
    short unk0x2;
    undefined2 unk0x4;
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
    struct some_sound_struct * soundStruct;
};

struct some_sound_struct {
    vec3 unk0x0;
    int mapTally;
    undefined2 unk0x10;
    byte zoneDatByte;
    char unk0x13;
    u8 unk0x14;
    u8 unk0x15;
    ushort unk0x16;
    int unk0x18;
    u8 unk0x1c;
    u8 unk0x1d;
    u8 unk0x1e;
    u8 unk0x1f;
    struct Borg_12_header * borg12;
};

typedef struct audiokey_struct audiokey_struct, *Paudiokey_struct;

struct audiokey_struct {
    byte[4] * a;
    pointer b;
    pointer c;
    byte d[1277][4];
};

typedef struct battle_id_flag battle_id_flag, *Pbattle_id_flag;

struct battle_id_flag {
    short id;
    short flag;
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



typedef struct cinematic_dat_pointers cinematic_dat_pointers, *Pcinematic_dat_pointers;

struct cinematic_dat_pointers {
    enum borg6Enum * borg6;
    pointer unknown;
    enum Borg12Enum * borg12;
    float[2] * floats;
};

typedef enum CinematicEnum {
    Rooghah Naming=2,
    Shadow Self Merge=1,
    Coronation of Alaron=3,
    Gabiron's Search=0
} CinematicEnum;

typedef struct CinematicStruct CinematicStruct, *PCinematicStruct;

typedef enum enum_cinematic_switch {
    Load_world_map=1,
    get_jipo=0,
    get_jipo_=4,
    set_brearb=2,
    check_alaron_attr=3
} enum_cinematic_switch;

struct CinematicStruct {
    struct AnimationData * AniDat;
    struct borg_6_header * Borg6;
    struct Borg_12_header * BGM;
    enum Event_flag_offset * cinematic_dat_seq;
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

typedef struct CityMarkers CityMarkers, *PCityMarkers;

struct CityMarkers {
    enum Borg8Enum borg:16;
    ushort x;
    ushort y;
};

typedef struct cloudStruct cloudStruct, *PcloudStruct;

struct cloudStruct {
    byte bytes[4];
    float f0;
    float f1;
    float f2;
    undefined4 unused;
    struct color col;
    float f3;
};

typedef struct CombatStruct CombatStruct, *PCombatStruct;

typedef struct EncounterDat EncounterDat, *PEncounterDat;

typedef struct Inventory_struct Inventory_struct, *PInventory_struct;

typedef struct inv_funcs inv_funcs, *Pinv_funcs;

typedef struct Inventory_item Inventory_item, *PInventory_item;

struct EncounterDat { /* enemy encounter data */
    struct ItemID enemy_entities[12]; /* entitty id's of enemies */
    struct ItemID globalLoot; /* chestdb of guarunteed loot */
    enum Event_flag_offset EncounterID;
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
    enum Event_flag_offset VoxelFlagA;
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
    byte unk0x11;
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
    undefined4 unk0x5448;
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

typedef struct CommonStringArray CommonStringArray, *PCommonStringArray;

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
    char * unk0x280;
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
    char * unk0x5dc;
    char * unk0x5e0;
    char * unk0x5e4;
    char * unk0x5e8;
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
    char * unk0x684;
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
    char * party inventory's full;
    char * I don't want that;
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
    u8 unk0x1bc;
    u8 unk0x1bd;
    u8 unk0x1be;
    u8 unk0x1bf;
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

typedef struct CrashStruct CrashStruct, *PCrashStruct;

struct CrashStruct {
    byte Stack[2120];
    struct OSThread Thread;
    u8 unk0x9f4;
    u8 unk0x9f5;
    u8 unk0x9f6;
    u8 unk0x9f7;
    OSMesg Mesgs;
    struct OSMesgQueue MesgQ;
    void* crash_func_arg;
    char position[128];
    char Cause[128];
    bool IsManualCrash;
    u8 unk0xb19;
    u8 unk0xb1a;
    u8 unk0xb1b;
    ulong (* Func)(void);
};

typedef struct Credits_struct Credits_struct, *PCredits_struct;

struct Credits_struct {
    struct widgetStruct unk0x0;
    byte unk0x7c;
    u8 unk0x7d;
    u8 unk0x7e;
    u8 unk0x7f;
    u8 unk0x80;
    u8 unk0x81;
    u8 unk0x82;
    u8 unk0x83;
    pointer unk0x84;
    byte unk0x88;
    u8 unk0x89;
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
    float unk0x98;
    float unk0x9c;
};

typedef struct Debug_queue Debug_queue, *PDebug_queue;

struct Debug_queue {
    char * * text;
    vec3 color;
    float timer;
    short ShortA;
};

typedef struct DialoigEntPointer DialoigEntPointer, *PDialoigEntPointer;

struct DialoigEntPointer {
    byte total;
    byte pad[3];
    struct DialougEnt_RAM * ents;
};

typedef struct dynamic_light_struct dynamic_light_struct, *Pdynamic_light_struct;

struct dynamic_light_struct {
	struct light_obj lights[16];
    short ShortsA[16][4];
    short ShortsB[16];
    short dynamicLightCount;
    undefined2 unk0x762;
};

typedef struct EntityPointer EntityPointer, *PEntityPointer;

struct EntityPointer {
    byte total;
    byte catSizes[7];
    byte unk[7];
    byte pad;
    struct Entity_Ram * entities;
};

typedef struct equiptype_func equiptype_func, *Pequiptype_func;

struct equiptype_func {
    enum DBTypeEnum type;
    byte pad[7];
    ulong (* func)(void);
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
    pointer pointer A;
    char unk0x8;
    byte unk0x9;
    char unk0xa;
    u8 unk0xb;
    undefined2 unk0xc;
    short Font_Height;
    undefined2 unk0x10;
    undefined2 unk0x12;
    float float0x14;
    pointer pointer B;
    struct color col;
};

typedef struct GameStateFunnel GameStateFunnel, *PGameStateFunnel;

typedef struct Struct_State Struct_State, *PStruct_State;





typedef struct Gear_Pointer Gear_Pointer, *PGear_Pointer;

struct Gear_Pointer {
    byte total;
    byte totalPerGear[11];
    byte unk1[12];
    struct Gear_RAM * Gear;
};




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

typedef struct wander_substruct wander_substruct, *Pwander_substruct;

typedef struct ZoneDat ZoneDat, *PZoneDat;

typedef struct weatherStruct weatherStruct, *PweatherStruct;

typedef struct PlayerHandler PlayerHandler, *PPlayerHandler;

typedef struct ParticleHeadStruct ParticleHeadStruct, *PParticleHeadStruct;

typedef struct mapFloatDat mapFloatDat, *PmapFloatDat;

typedef struct MinimapSec_dat MinimapSec_dat, *PMinimapSec_dat;

typedef struct ScriptCam ScriptCam, *PScriptCam;

typedef struct QueueStructAItem QueueStructAItem, *PQueueStructAItem;

typedef struct QueueStructBItem QueueStructBItem, *PQueueStructBItem;

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

struct ZoneDat {
    int unk_0x0;
    struct AnimationData * unk0x4;
    enum borg9Enum borg9_id;
    struct Borg_9_header * mapPointer;
    uint borg5_ID;
    struct AnimationData * unk0x14;
    uint MapTally;
    byte unk0x1c;
    byte mapshortSum;
    byte unk0x1e;
    u8 unk0x1f;
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
    undefined2 unk0x10;
    u8 unk0x12;
    u8 unk0x13;
    int unk0x14;
    struct Borg_12_header * unk0x18;
    ushort unk0x1c;
    u8 unk0x1e;
    u8 unk0x1f;
    byte SfxByte;
};

struct PlayerHandler {
    short playerMax;
    u8 unk0x2;
    u8 unk0x3;
    struct Camera_struct * camera;
    short unk0x8;
    u8 unk0xa;
    u8 unk0xb;
    struct playerData * playerDats;
    ushort unk0x10[40];
    ushort playerCount;
    ushort counter;
    float float_0x64;
    float float_0x68;
    pointer unk0x6c;
    u8 unk0x70;
    u8 unk0x71;
    u8 unk0x72;
    u8 unk0x73;
    struct audiokey_struct * audiokey;
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


struct Minimap_struct {
    uint unk0x0;
    uint ShowMinimap;
    bool B_buttonToggle;
    byte unk0x9;
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

struct SFX_Struct {
    struct some_sound_struct * pointerA; /* 80 entries +2 in retail */
    ushort shortArrayA[82];
    undefined2 pointerAIndex;
    u8 unk0xaa;
    u8 unk0xab;
    struct audio_substruct_2 * pointerB; /* 16 entries */
    ushort shortArrayB[16];
    ushort pointerBIndex;
    undefined2 unk0xd2;
};

struct wander_struct {
    struct wander_substruct * wanderSubstructs;
    short wandererIndicies[39];
    ushort wanderers;
    short wanderersmax;
    undefined2 unk0x56;
};

struct SkyStruct {
    undefined2 BackgroundType; /* no more than 5 */
    u8 unk0x2;
    u8 unk0x3;
    struct Borg_8_header * unk0x4;
    pointer unk0x8;
    undefined2 unk0xc;
    u8 unk0xe;
    u8 unk0xf;
    struct Borg_8_header * unk0x10;
    pointer unk0x14;
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

struct QueueStructAItem {
    pointer BorgPointer;
    short BorgSwitch;
    short unk0x6;
};

struct QueueStructA {
    struct QueueStructAItem array[256];
    ushort items;
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

struct MinimapSec_dat {
    ushort mapshort1;
    ushort mapshort2;
    ushort unk0x4;
    ushort checked;
    enum Borg8Enum borg8:16;
    short x;
    short y;
};

struct ScriptCam {
    short unk0x0;
    short unk0x2;
    ushort unk0x4;
    short unk0x6;
    vec3 * unk0x8;
    float unk0xc;
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
};

struct pause_struct {
    struct Pause_Widget_struct widget;
    undefined4 unk0x7c;
    struct WidgetHandler * Handler;
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





typedef struct inventory_slot inventory_slot, *Pinventory_slot;

typedef union Temp_equip Temp_equip, *PTemp_equip;

typedef struct Temp_potion Temp_potion, *PTemp_potion;

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

typedef struct Item_Icon Item_Icon, *PItem_Icon;

struct Item_Icon {
    struct ItemID id;
    enum Borg8Enum icon:16;
};



typedef struct lensflare_data lensflare_data, *Plensflare_data;

struct lensflare_data {
    undefined1 unk0x0;
    u8 unk0x1;
    u8 unk0x2;
    u8 unk0x3;
    float unk0x4;
    float unk0x8;
    struct color unk0xc;
};

typedef struct loot_Pointer loot_Pointer, *Ploot_Pointer;

struct loot_Pointer {
    byte total;
    byte pad[3];
    struct Loot_RAM * lootCat;
};

typedef struct magic_icon magic_icon, *Pmagic_icon;

struct magic_icon {
    short unk0x0;
    enum Borg8Enum unk0x2:16;
};

typedef struct map_struct? map_struct?, *Pmap_struct?;

struct map_struct? {
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
    ushort unk0x24;
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
    ushort unk0x30;
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
    int unk0x3c;
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
    int unk0x4c;
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
    enum Event_flag_offset flag;
    enum Borg8Enum borg8;
};



typedef enum PFS_ERR8 {
    NEW_PAK=2,
    DIR_FULL=8,
    NOPACK=1,
    BAD_DATA=6,
    ID_FATAL=10,
    FILE_EXIST=9,
    ERR_DEVICE=11,
    DATA_FULL=7,
    CONTRFAIL=4,
    OK=0,
    INVALID=5,
    INCONSISTENT=3
} PFS_ERR8; //same as default, here for organization purpose





typedef enum PRECIPITATION {
    RAIN=1,
    SNOW=2,
    CLEAR=0
} PRECIPITATION;

typedef struct ResolutionSettings ResolutionSettings, *PResolutionSettings;

struct ResolutionSettings {
    ushort Hres;
    ushort Vres;
    byte pad;
    byte colorDepth;
};


typedef struct School_icon School_icon, *PSchool_icon;

struct School_icon { /* disctionary of scool and icon */
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

typedef struct spells_pointer spells_pointer, *Pspells_pointer;

struct spells_pointer {
    byte Total;
    byte Schools[6];
    byte schools2[6];
    byte unk0xd[3];
    struct Spell_RAM * spells;
};

typedef struct StringCheat StringCheat, *PStringCheat;

struct StringCheat { /* struct used for cheat functions */
    char * code;
    ulong (* cheat)(void);
};

typedef struct struct_borg_5? struct_borg_5?, *Pstruct_borg_5?;

struct struct_borg_5? {
    byte unk0x0;
    u8 unk0x1;
    u8 unk0x2;
    byte unk0x3;
    byte unk0x4;
    byte unk0x5;
    byte unk0x6;
    byte unk0x7;
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
    float unk0x1c8;
    float unk0x1cc;
    float unk0x1d0;
    u8 unk0x1d4;
    u8 unk0x1d5;
    u8 unk0x1d6;
    u8 unk0x1d7;
    u8 unk0x1d8;
    u8 unk0x1d9;
    u8 unk0x1da;
    u8 unk0x1db;
    u8 unk0x1dc;
    u8 unk0x1dd;
    u8 unk0x1de;
    u8 unk0x1df;
    u8 unk0x1e0;
    u8 unk0x1e1;
    u8 unk0x1e2;
    u8 unk0x1e3;
    u8 unk0x1e4;
    u8 unk0x1e5;
    u8 unk0x1e6;
    u8 unk0x1e7;
    u8 unk0x1e8;
    u8 unk0x1e9;
    u8 unk0x1ea;
    u8 unk0x1eb;
    u8 unk0x1ec;
    u8 unk0x1ed;
    u8 unk0x1ee;
    u8 unk0x1ef;
    u8 unk0x1f0;
    u8 unk0x1f1;
    u8 unk0x1f2;
    u8 unk0x1f3;
    uint a;
    undefined2 b;
    u8 unk0x1fa;
    byte g;
    float f1;
    float f2;
    float f3;
    float f4;
    u8 unk0x20c;
    u8 unk0x20d;
    u8 unk0x20e;
    u8 unk0x20f;
    u8 unk0x210;
    u8 unk0x211;
    u8 unk0x212;
    u8 unk0x213;
    u8 unk0x214;
    u8 unk0x215;
    u8 unk0x216;
    u8 unk0x217;
    u8 unk0x218;
    u8 unk0x219;
    u8 unk0x21a;
    u8 unk0x21b;
    u8 unk0x21c;
    u8 unk0x21d;
    u8 unk0x21e;
    u8 unk0x21f;
    u8 unk0x220;
    u8 unk0x221;
    u8 unk0x222;
    u8 unk0x223;
    u8 unk0x224;
    u8 unk0x225;
    u8 unk0x226;
    u8 unk0x227;
    u8 unk0x228;
    u8 unk0x229;
    u8 unk0x22a;
    u8 unk0x22b;
    u8 unk0x22c;
    u8 unk0x22d;
    u8 unk0x22e;
    u8 unk0x22f;
    u8 unk0x230;
    u8 unk0x231;
    u8 unk0x232;
    u8 unk0x233;
    u8 unk0x234;
    u8 unk0x235;
    u8 unk0x236;
    u8 unk0x237;
    u8 unk0x238;
    u8 unk0x239;
    u8 unk0x23a;
    u8 unk0x23b;
    u8 unk0x23c;
    u8 unk0x23d;
    u8 unk0x23e;
    u8 unk0x23f;
    u8 unk0x240;
    u8 unk0x241;
    u8 unk0x242;
    u8 unk0x243;
    u8 unk0x244;
    u8 unk0x245;
    u8 unk0x246;
    u8 unk0x247;
    u8 unk0x248;
    u8 unk0x249;
    u8 unk0x24a;
    u8 unk0x24b;
    u8 unk0x24c;
    u8 unk0x24d;
    u8 unk0x24e;
    u8 unk0x24f;
    u8 unk0x250;
    u8 unk0x251;
    u8 unk0x252;
    u8 unk0x253;
    u8 unk0x254;
    u8 unk0x255;
    u8 unk0x256;
    u8 unk0x257;
    u8 unk0x258;
    u8 unk0x259;
    u8 unk0x25a;
    u8 unk0x25b;
    u8 unk0x25c;
    u8 unk0x25d;
    u8 unk0x25e;
    u8 unk0x25f;
    u8 unk0x260;
    u8 unk0x261;
    u8 unk0x262;
    u8 unk0x263;
    u8 unk0x264;
    u8 unk0x265;
    u8 unk0x266;
    u8 unk0x267;
    u8 unk0x268;
    u8 unk0x269;
    u8 unk0x26a;
    u8 unk0x26b;
    u8 unk0x26c;
    u8 unk0x26d;
    u8 unk0x26e;
    u8 unk0x26f;
    u8 unk0x270;
    u8 unk0x271;
    u8 unk0x272;
    u8 unk0x273;
    u8 unk0x274;
    u8 unk0x275;
    u8 unk0x276;
    u8 unk0x277;
    u8 unk0x278;
    u8 unk0x279;
    u8 unk0x27a;
    u8 unk0x27b;
    u8 unk0x27c;
    u8 unk0x27d;
    u8 unk0x27e;
    u8 unk0x27f;
    u8 unk0x280;
    u8 unk0x281;
    u8 unk0x282;
    u8 unk0x283;
    u8 unk0x284;
    u8 unk0x285;
    u8 unk0x286;
    u8 unk0x287;
    u8 unk0x288;
    u8 unk0x289;
    u8 unk0x28a;
    u8 unk0x28b;
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
    undefined4 unk0x298;
    undefined4 unk0x29c;
    u8 unk0x2a0;
    u8 unk0x2a1;
    u8 unk0x2a2;
    u8 unk0x2a3;
    undefined4 unk0x2a4;
    undefined4 unk0x2a8;
    byte unk0x2ac;
    char unk0x2ad;
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
};

typedef struct struct_borg_scene? struct_borg_scene?, *Pstruct_borg_scene?;

struct struct_borg_scene? {
    pointer 30 pointers?[30];
    struct CombatEntity * a;
    ushort unk0x7c;
    u8 unk0x7e;
    u8 unk0x7f;
    pointer g;
    struct borg_13_header * w;
    int unk0x88;
    undefined4 unk0x8c;
    int unk0x90;
    undefined2 unk0x94;
    byte unk0x96;
    u8 unk0x97;
    byte unk0x98;
    u8 unk0x99;
    byte unk0x9a;
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
    byte bool?;
    u8 unk0xa9;
    byte unk0xaa;
    byte unk0xab;
    u8 unk0xac;
    u8 unk0xad;
    u8 unk0xae;
    u8 unk0xaf;
    u8 unk0xb0;
    u8 unk0xb1;
    u8 unk0xb2;
    u8 unk0xb3;
    pointer vvv;
    struct ItemID unk0xb8;
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
    struct ItemID entity_list?[12];
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
    byte unk0x1c6;
    byte unk0x1c7;
    byte unk0x1c8;
    u8 unk0x1c9;
    u8 unk0x1ca;
    u8 unk0x1cb;
};


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

typedef struct widget_contPakData widget_contPakData, *Pwidget_contPakData;

struct widget_contPakData {
    struct widgetStruct base;
    byte substruct[16][32];
    undefined4 unk0x27c;
    undefined4 unk0x280;
    undefined4 unk0x284;
    undefined4 unk0x288;
    byte unk0x28c;
    enum PFS_ERR8 pfsErr;
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
    void * unk0x2c4;
    undefined4 unk0x2c8;
};

