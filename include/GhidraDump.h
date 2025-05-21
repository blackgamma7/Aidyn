#include "mathN64.h"
#include "widgets\BaseWidget.h"

struct astruct_1 {
    undefined field0_0x0;
    undefined field1_0x1;
    undefined field2_0x2;
    undefined field3_0x3;
    u16 field4_0x4;
    u16 field5_0x6;
    u8 *field6_0x8;
};

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


typedef struct struct_1 struct_1, *Pstruct_1;

typedef struct struct_45 struct_45, *Pstruct_45;

typedef struct Borg7data Borg7data, *PBorg7data;

typedef struct Borg12Header Borg12Header, *PBorg12Header;






struct astruct_6 {
    playerData *playerdat_;
    u16 short0x4;
    u8 byte0x5;
    undefined field3_0x7;
};



struct struct_1 {
    astruct_1 *field0_0x0;
    borg6header *field1_0x4;
};

/*
typedef enum borg9Enum {
    Dryad Forest=4034,
    StartingMap=4059,
    oriana's hut=5266,
    Borg9_campfire=6236
} borg9Enum;
*/



typedef struct AttackVisualStruct3 AttackVisualStruct3, *PAttackVisualStruct3;

struct AttackVisualStruct3 {
    Borg7header *borg7;
    playerData *player;
    vec3f pos;
    u32 unk14;
    uint flag;
};

typedef struct dialougmode_substruct dialougmode_substruct, *Pdialougmode_substruct;



struct DialougeStruct {
    u8 field0_0x0;
    undefined field1_0x1;
    undefined field2_0x2;
    undefined field3_0x3;
    BaseWidget *widgetMenu;
    dialougmode_substruct *dialouge_substruct;
    u32 field6_0xc;
    WidgetHandler *handler;
    borg13data *borg_13_dat;
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


typedef u8 PFS_ERR8;

typedef enum Borg8Enum { /* Sprites/Textures */
    BORG8_CompassWest=23,
    //BORG8_CompassNorth=24,
    BORG8_CompassSouth=25,
    BORG8_CompassEast=26,
    BORG8_compassRing=27,
    //BORG8_MainFont=29,
    BORG8_MapIconStart=30,
    //long down arrow=213,
    //BORG8_Spacer=215,
    BORG8_PauseBGOptions=216,
    BORG8_PauseBGStats=217,
    BORG8_PauseBGMap=218,
    BORG8_CurrDayMarker=220,
    BORG8_CampTitle=221,
    BORG8_LogoH2O=222,
    BORG8_PortraitHighlight=223,
    //Parchment background=226,
   // Parchment Background_2=227,
    //Parchment shadow=228,
    //Parchment Window 2=229,
    BORG8_TitleJournal=230,
    BORG8_TitleInventory=233,
    BORG8_TitleSkills=236,
    BORG8_TitleSpells=237,
    BORG8_TitleTrain=239,
    BORG8_TitleMenui=242,
    //square highlight=243,
    //66 px highligh 2=244,
    //66 px highlight=245,
    //map marker=246,
    BORG8_CONTROLLER_PAK=247,
    //blank space?=248,
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
    //42 px box=261,
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
    //Sun texture?=418,
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
    //2 black pixels=453,
    //28 px soft edge square=454,
    //14px square=455,
    //Gwen map overlay=457,
    //galaxy swirl?=464,
    //Fire effect?=3424,
    //Some Face?=3514,
    //musical notes=6842,
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
    //Flag/sythe=13766,
    Circlet=13767,
    Cuccoon=13768,
    //Boot icon=13769,
    //Bow and arrow icon=13770,
    //Cloack Icon=13771,
    //green cloack icon=13772,
    //purple cloack icon=13773,
    BORG8_IconItemClub=13774,
    BORG8_IconItemSword=13775,
    BORG8_IconItemStaff=13776,
    //2 pad icon=13777,
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
    BORG8_IconItemKey3=13791, //icon for the unused Blood/bone/skull/black keys
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
    //Spotlight?=13826,
    BORG8_BGBook2=13827,
    BORG8_BGPlaque=13828,
    BORG8_BGParchment=13829,
    BORG8_BGBookLeaf=13830,
    BORG8_BGBluPlaque=13831,
    BORG8_BGParchment2=13832,
    //2 horizontal arrows=14166,
    BORG8_ExpPakYes=14168,
    BORG8_ExpPakNo=14169,
    Ritual=14171,
    //crecent moon=14239,
    //half moon=14240,
    PortSaidMarker=14270,
    //Terminor Marker=14272,
    //Ugarit Marker=14273,
    Borg8_PAL_Warning=14275,
    BORG8_PortraitMinotuar=14406,
    cyclops_Hurlstar=14422,
    BORG8_PortraitHorse=14423,
    //up arrow=14544
} Borg8Enum;

typedef struct SaveDatStruct SaveDatStruct, *PSaveDatStruct;

typedef struct SavePartyHeader SavePartyHeader, *PSavePartyHeader;

struct InputMenu {
    BaseWidget base;
    u16 unk7c;
    u16 field2_0x7e;
};


struct IntroMenuSub {
    BaseWidget *StartGameMenu;
    undefined field1_0x4;
    undefined field2_0x5;
    undefined field3_0x6;
    undefined field4_0x7;
    InputMenu *inputMenu;
    undefined field6_0xc;
    undefined field7_0xd;
    undefined field8_0xe;
    undefined field9_0xf;
    WidgetContPakData *field10_0x10;
    BaseWidget *titleShadow;
    BaseWidget *PressStart;
    BaseWidget *field13_0x1c;
    BaseWidget *field14_0x20;
    u8 menuState;
    undefined field16_0x25;
    undefined field17_0x26;
    undefined field18_0x27;
};


struct WidgetMenuChild {
    BaseWidget base;
    u32 field1_0x7c;
    BaseWidget *field2_0x80;
    BaseWidget *field3_0x84;
    UnkGuiSubstruct field4_0x88;
    u32 field5_0x98;
    u32 field6_0x9c;
    u32 field7_0xa0;
};

typedef struct romcopy_struct romcopy_struct, *Promcopy_struct;

struct WidgetOptionsSubstruct {
    BaseWidget *ScrollMenu;
    BaseWidget *theatreMenu;
    BaseWidget *optionsConfig;
    u32 field3_0xc;
    BaseWidget *unk10;
    BaseWidget *unk14;
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
    BaseWidget **items;
    u8 itemMax;
    undefined field12_0x11;
    u8 itemCount;
    undefined field14_0x13;
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

typedef struct borg_short borg_short, *Pborg_short;

struct borg_short {
    enum borg13Enum borg_13;
    u16 pad;
    short some_num;
};

typedef struct combat_aiscore combat_aiscore, *Pcombat_aiscore;



typedef struct resist_float resist_float, *Presist_float;



typedef struct CharGear CharGear, *PCharGear;


typedef struct StatMod StatMod, *PStatMod;

typedef struct SpellCharges SpellCharges, *PSpellCharges;





typedef struct CombatAi_command CombatAi_command, *PCombatAi_command;

struct CombatAi_command {
    ulong (*cmd)(void);
    uint unk;
};



typedef struct CombatRadarBlip CombatRadarBlip, *PCombatRadarBlip;

struct CombatRadarBlip {
    WidgetBorg8Combat *widget;
    short unk4;
    short unk6;
    short unk8;
    short unka;
    int unkc;
    u32 unk10;
    int unk14;
};

typedef struct CombatTargetVisuals_struct CombatTargetVisuals_struct, *PCombatTargetVisuals_struct;

struct CombatTargetVisuals_struct {
    astruct_6 *pointer;
    uint entCount;
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
    u16 price;
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


typedef struct Gear_RAM Gear_RAM, *PGear_RAM;

struct Gear_RAM {
    ItemID ID;
    char name[20];
    u8 is 0;
    u8 field3_0x17;
    u16 exp_multi;
    u8 damage;
    u8 Protection;
    u8 STR;
    u8 INT;
    u16 price;
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


typedef struct shop_ram shop_ram, *Pshop_ram;

struct shop_ram {
    ItemID shopkeep; /* entity running shop */
    u16 stock[23]; /* items */
    u8 multi[3][20];
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

struct ArrayHeader { /* ROM Db array Header */
    u8 Size; /* number of items in array */
    u8 unk[3]; //junk bytes
};

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

typedef struct WidgetBarter WidgetBarter, *PWidgetBarter;

typedef struct WidgetMenuWorldMap WidgetMenuWorldMap, *PWidgetMenuWorldMap;

typedef struct struct_4 struct_4, *Pstruct_4;

struct WidgetBarter {
    BaseWidget base; /* 0x5e=Merchant */
    u8 partyPicker;
    undefined field2_0x7d;
    undefined field3_0x7e;
    undefined field4_0x7f;
    WidgetTrainShop *field5_0x80;
    WidgetTrainShop *field6_0x84;
    WidgetTrainShop *description;
    u8 invType;
    undefined field9_0x8d;
    undefined field10_0x8e;
    undefined field11_0x8f;
    BaseWidget *background;
    BaseWidget *goldText;
    undefined field14_0x98;
    undefined field15_0x99;
    undefined field16_0x9a;
    undefined field17_0x9b;
};


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

struct ControllerPakSliders {
    BaseWidget base;
    u32 field1_0x7c;
    u32 field2_0x80;
    SaveDatPointers *saveDat;
    BaseWidget *screenshotWidget;
    Borg8header *screenshotBorg8;
    BaseWidget *PlayerName;
    BaseWidget *TimePlayed;
    u32 isEntrySet;
    BaseWidget *PartyPortraits[4];
    u16 unkBounds[4];
    Color32 unkCol;
    BaseWidget *arrows;
};



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

typedef struct App_manager App_manager, *PApp_manager;

struct App_manager {
    OSSched *sched;
    OSMesgQueue *MesgQ;
    OSMesg *Mesg;
    int *stack;
    OSThread Thread;
    OSMesgQueue MesgQ2;
    OSScClient client;
};

typedef struct ArmorCraftRecipie ArmorCraftRecipie, *PArmorCraftRecipie;

struct ArmorCraftRecipie {
    u16 item; /* gear in ram */
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
    armour_RAM *Armor;
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



typedef struct DCM_struct DCM_struct, *PDCM_struct;



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

typedef struct dialougemode_struct dialougemode_struct, *Pdialougemode_struct;

struct dialougemode_struct {
    ulong (*funcs0[5])(void);
    ulong (*funcs1[5])(void);
    ulong (*funcs2[5])(void);
    ulong (*funcs3[5])(void);
    ulong (*funcs4[5])(void);
    ulong (*unk0x64[5])(void);
    wander_substruct *Wanderers;
    u16 Unk0x7C;
    undefined field8_0x7e;
    undefined field9_0x7f;
    u8 *partySkillLvls; /* one for each skill */
    borg13data *borg13_dat;
    playerData *playerDat;
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
    dialougmode_substruct some_substruct;
};





typedef struct encounter_rom_dat encounter_rom_dat, *Pencounter_rom_dat;

struct encounter_rom_dat {
    monsterpartyEntry entries[2];
};

typedef enum enum_someCase {
    CombatLevelUp=5
} enum_someCase;



typedef struct fileState_aidyn fileState_aidyn, *PfileState_aidyn;

struct fileState_aidyn {
    u16 filesize;
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



typedef struct FontFace FontFace, *PFontFace;

struct FontFace {
    u32 borg8;
    u8 rows;
    u8 cols;
    undefined field3_0x6;
    undefined field4_0x7;
};



typedef struct GameStateFunnel GameStateFunnel, *PGameStateFunnel;

typedef struct Struct_State Struct_State, *PStruct_State;



typedef struct Gear_Pointer Gear_Pointer, *PGear_Pointer;

struct Gear_Pointer {
    u8 total;
    u8 totalPerGear[11];
    u8 unk1[12];
    Gear_RAM *Gear;
};


typedef struct MiniMap MiniMap, *PMiniMap;

typedef struct ScriptCamera_struct ScriptCamera_struct, *PScriptCamera_struct;

typedef struct QueueStructB QueueStructB, *PQueueStructB;

typedef struct PlayerHandler PlayerHandler, *PPlayerHandler;

typedef struct PartyInventory PartyInventory, *PPartyInventory;

typedef struct ScriptCam ScriptCam, *PScriptCam;

typedef struct QueueStructBItem QueueStructBItem, *PQueueStructBItem;







struct ScriptCamera_struct {
    ScriptCam *cameras; /* 0x7c size */
    short cameraIndecies[8];
    u16 cameraCount; /* up to 8 */
    short dataActive;
    short counter0;
    short counter1;
};

struct QueueStructBItem {
    void *pBorg;
    int field1_0x4;
    int BorgIndex;
    u16 BorgSwitch;
    u8 field4_0xe;
    undefined field5_0xf;
};

struct QueueStructB {
    QueueStructBItem array[32];
    u16 items;
};


struct ScriptCam {
    short field0_0x0;
    short field1_0x2;
    u16 field2_0x4;
    short flag;
    vec3f *aim;
    float field5_0xc;
    camera_obj voxel;
};



typedef struct IconDict IconDict, *PIconDict;

struct IconDict { /* array Proceeded by dictionary length */
    u16 key;
    u16 value;
};

typedef struct Item_Icon Item_Icon, *PItem_Icon;

struct Item_Icon {
    ItemID id;
    u16 icon;
};


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

typedef struct ResolutionSettings ResolutionSettings, *PResolutionSettings;

struct ResolutionSettings {
    u16 Hres;
    u16 Vres;
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

