#include "mathN64.h"
#include "widgets\BaseWidget.h"


/*
typedef enum Borg7Enum { // entity model data? 
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

*/

struct astruct_6 {
    playerData *playerdat_;
    u16 short0x4;
    u8 byte0x5;
    undefined field3_0x7;
};


typedef struct AttackVisualStruct3 AttackVisualStruct3, *PAttackVisualStruct3;

struct AttackVisualStruct3 {
    Borg7Header *borg7;
    playerData *player;
    vec3f pos;
    u32 unk14;
    uint flag;
};

typedef struct DollBarterConfirm DollBarterConfirm, *PDollBarterConfirm;

struct DollBarterConfirm {
    BaseWidget base;
    void* field1_0x7c;
    BaseWidget *field5_0x80;
    BaseWidget *field6_0x84;
    int field7_0x88;
    u8 field8_0x8c;
};

typedef struct InputWidgetSubStruct InputWidgetSubStruct, *PInputWidgetSubStruct;

struct InputWidgetSubStruct {
    BaseWidget *arrayMenu;
    char *output;
    char *entry;
    BaseWidget *cursor;
    u8 entryIndex;
};

typedef struct SavePartyHeader SavePartyHeader, *PSavePartyHeader;

struct InputMenu {
    BaseWidget base;
    u16 unk7c;
    u16 field2_0x7e;
};



struct WidgetOptionsSubstruct {
    BaseWidget *ScrollMenu;
    BaseWidget *theatreMenu;
    BaseWidget *optionsConfig;
    u32 field3_0xc;
    BaseWidget *unk10;
    BaseWidget *unk14;
    u8 field6_0x18;
};

/*
typedef enum Borg12Enum { // Music/SFX 
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
*/

typedef struct CombatAi_command CombatAi_command, *PCombatAi_command;

struct CombatAi_command {
    ulong (*cmd)(void);
    uint unk;
};

typedef struct CombatTargetVisuals_struct CombatTargetVisuals_struct, *PCombatTargetVisuals_struct;

struct CombatTargetVisuals_struct {
    astruct_6 *pointer;
    uint entCount;
};

typedef struct DialougEnt_RAM DialougEnt_RAM, *PDialougEnt_RAM;

struct DialougEnt_RAM {
    ItemID ID;
    char name[22];
    u8 a; /* unused, set to 0 */
    u8 b;
};


typedef struct shop_ram shop_ram, *Pshop_ram;

struct shop_ram {
    ItemID shopkeep; /* entity running shop */
    u16 stock[23]; /* items */
    u8 multi[3][20];
};


struct ArrayHeader { /* ROM Db array Header */
    u8 Size; /* number of items in array */
    u8 unk[3]; //junk bytes
};

struct DialougeEntity_ROM { /* Dialouge entity in ROM */
    char name[22];
    ItemID_ROM ID;
};

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

typedef struct BaseWidgetPause BaseWidgetPause, *PBaseWidgetPause;

typedef struct WidgetCalendar WidgetCalendar, *PWidgetCalendar;

typedef struct WidgetMenuWorldMap WidgetMenuWorldMap, *PWidgetMenuWorldMap;

typedef struct struct_4 struct_4, *Pstruct_4;

struct WidgetCalendar {
    BaseWidget base;
    WidgetMenuWorldMap *map;
    Color32 col0;
    Color32 col1;
    u8 waveTint;
    u8 waveAmmount; /* inverts if waveTint is 0 or 20 */
    u8 dayofMonth;
    u8 weekofMonth;
    u8 monthVal;
    BaseWidget *DayMarker;
    BaseWidget *monthTitle;
};

typedef struct ControllerPakSliders ControllerPakSliders, *PControllerPakSliders;




typedef struct Widget_Skills Widget_Skills, *PWidget_Skills;

struct Widget_Skills {
    BaseWidget base;
    CharSkills *skills;
    BaseWidget *skillIcon;
    BaseWidget *skillVal;
    BaseWidget *skillmod;
    BaseWidget *skilltext;
    u16 field6_0x90;
    u16 field7_0x92;
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



typedef struct ArmorCraftRecipie ArmorCraftRecipie, *PArmorCraftRecipie;

struct ArmorCraftRecipie {
    u16 item; /* gear in ram */
    u8 armor; /* armor in ram */
    u8 stam; /* hp used */
    u8 Mechanic; /* mechanic needed */
    u8 pad; /* i dunno */
};



typedef struct CityMarkers CityMarkers, *PCityMarkers;

struct CityMarkers {
    u16 borg;
    u16 x;
    u16 y;
};


typedef struct crash_DatString crash_DatString, *Pcrash_DatString;

struct crash_DatString {
    uint ANDMask;
    uint Value;
    char *String;
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
    u16 b;
    u16 c;
    char *label;
};

typedef struct DialoigEntPointer DialoigEntPointer, *PDialoigEntPointer;

struct DialoigEntPointer {
    u8 total;
    DialougEnt_RAM *ents;
};

typedef struct encounter_rom_dat encounter_rom_dat, *Pencounter_rom_dat;

struct encounter_rom_dat {
    monsterpartyEntry entries[2];
};

typedef enum enum_someCase {
    CombatLevelUp=5
} enum_someCase;

typedef struct MiniMap MiniMap, *PMiniMap;

typedef struct KKBufferEvent KKBufferEvent, *PKKBufferEvent;

struct KKHeader {
    int length;
    char code;
    char type;
    short error;
    char rev;
    char method;
    short unused;
};

struct KKBufferEvent {
    KKHeader header;
    s32 object;
    u8 buffer[240];
};


typedef struct mapDataList mapDataList, *PmapDataList;

struct mapDataList {
    u16 mapShortA;
    u16 MapShortB;
    u16 borg5;
    u16 borg6;
    u16 borg9;
    u16 terrian;
};

typedef struct MapEventFlag MapEventFlag, *PMapEventFlag;

struct MapEventFlag {
    uint MapShortA;
    uint MapShortB;
    uint flag;
};

typedef struct potionRecipie potionRecipie, *PpotionRecipie;

struct potionRecipie {
    u8 ID;
    u8 spice;
    u8 herb;
    u8 gemstone;
    u8 alchemist;
    u8 unk; //stamina needed
    u8 unk2; //used for another skillcheck. always 0, so always passes
};


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
    shop_ram *shops; /* shops' listing */
};


typedef struct spells_pointer spells_pointer, *Pspells_pointer;

struct spells_pointer {
    u8 Total;
    u8 Schools[6];
    u8 schools2[6];
    u8 field3_0xd[3];
    Spell_RAM *spells;
};

typedef struct WidgetArmorCraft WidgetArmorCraft, *PWidgetArmorCraft;

struct WidgetArmorCraft {
    WidgetCrafting base;
};

typedef struct WidgetCameraDebug WidgetCameraDebug, *PWidgetCameraDebug;

struct WidgetCameraDebugSub{
    u16 stringIndex;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
};

struct WidgetCameraDebug {
    BaseWidget base;
    BaseWidget *scrollMenu;
    u16 currRefpoint;
    WidgetCameraDebugSub Arr[14];
    undefined field75_0xd6;
    undefined field76_0xd7;
};


typedef struct widgetCredits widgetCredits, *PwidgetCredits;

struct widgetCredits {
    BaseWidget base;
    u8 creditState;
    undefined field2_0x7d;
    undefined field3_0x7e;
    undefined field4_0x7f;
    BaseWidget *field5_0x80;
    BaseWidget *clipText;
    u8 field7_0x88;
    u8 field8_0x89;
    u8 field9_0x8a;
    undefined field10_0x8b;
    Borg12Header *bgm;
    u8 *indecies0;
    u8 *indecies1;
    float BGMVol;
    float SFXVol;
};

typedef struct WidgetDebugBig WidgetDebugBig, *PWidgetDebugBig;

struct WidgetDebugBig {
    BaseWidget base;
    BaseWidget *scrollMenu;
};

typedef struct WidgetMenuHealer WidgetMenuHealer, *PWidgetMenuHealer;

struct WidgetMenuHealer {
    WidgetCrafting base;
    BaseWidget *textBox;
};

typedef struct WorldMapPiece WorldMapPiece, *PWorldMapPiece;

struct WorldMapPiece {
    u16 eventFlag;
    u16 mapBorg8;
    u16 x;
    u16 y;
};

