#include "titleScreen.h"
#include "wander.h"
#include "Camera.h"
#include "MiniMap.h"
#include "party.h"
#include "stringN64.h"
#include "randClass.h"
#include "N64Print.h"
#include "inventory\GenericInventory.h"
#include "PlayerData.h"
#include "n64Borg.h"
#include "world.h"
#include "sky.h"
#include "SFX.h"
#include "portraits.h"
#include "sundail.h"
#include "commonstrings.h"
#include "widgets/handler.h"
#include "graphics.h"
#include "allocQueue.h"
#include "spells.h"
#include "weather.h"
#include "cinematics.h"
#include "dialoug.h"
#include "widgets/PauseWidget.h"
#include "widgets/WidgetBarter.h"
#include "ZoneEngine.h"
#include "combat/encounterDat.h"
#include "itemDB.h"
#include "debug.h"

#include "crash.h"
#include "heapN64.h"
#include "romcopy.h"
#include "eventFlag.h"

struct GlobalsSub { /* 0x800e6988 in Debug version*/
    ZoneDat ZoneDatMtx[3][3];
    Borg9Data *borg9DatPointer;
    EnvProp *EnvProps;
    collisionTypeA *zoneEnginePtr1;
    SpeedProperty *zoneEnginePtr2;
    u16 zoneEngineInit;
    Camera_struct camera;
    vec3f *camPtrArray[16];
    u16 camPtrArraySize;
    u16 mapShort1;
    u16 mapShort2;
    u16 mapShort1Copy;
    u16 mapShort2Copy;
    vec2f mapCellSize; //size of each map chunk.
    vec2f playerPos2d;
    u16 mapDatA;
    u16 mapDatB;
    u16 mapDatC;
    WeatherStruct weather;
    PlayerHandler PlayerHandler;
    ParticleHeadStruct particleEmmiter;
    u8 unk718[128]; //unused?
    DynamicLightHead DynamicLights;
    voxelObject *refObjPointer;
    vec3f *tpVec3;
    mapFloatDat MapFloatDatEntry;
    Borg12Header *BGM;
    u32 BGMID;
    u8 BGMIndex;
    u16 Borg12Next;
    u16 Borg12Next2;
    u16 gamemodeType;
    flycamStruct flycamDat; //used for title screen flycam
    mapFloatDat MapFloatDats[15];
    u16 unkCounter;
    u16 unk120e;
    u16 unkTimer;
    u8 unk1212[6];
};

struct SpashVars{
    u32 flag;
    Borg12Header *introMusic;
    u32 introMusicDatA;
    u32 introMusicDatB;
    u8 state;
    Borg8Header *thqBorg8;
    Borg8Header *h20Borg8;
    u8 align2c[8];
    uint timer;
    u8 UnkA; /* written, never read */
    u16 UnkB; /* written, never read */
    u16 UnkC; /* written, never read */
    u16 UnkD; /* written, never read */
};

struct GlobalsAidyn { /* Globals structure of Aidyn Chronicles*/
    Random rngSeed; /* used for most rand funcs */
    int appstate;
    u32 ticker;
    float delta; //defined as (x/60) second, 1>=x<=6
    SpashVars titleSplashVars;
    u8 screenFadeModeSwitch;
    u8 align41[15];
    wander_struct wander;
    player_char_struct playerCharStruct;
    GlobalsSub gameVars;
    SFX_Struct SFXStruct;
    u8 combatBytes[4];
    EncounterDat EncounterDat;
    playerData *playerDataArray[14];
    vec3f combatCursorPos;
    s8 ShadowIndex;
    s8 AlaronIndex;
    u8 GoblinHitTally;
    uint expGained;
    uint combatByteMirror;
    SkyStruct sky;
    vec3f SunPos;
    u64 unk14a4;
    vec3f MoonPos;
    u64 unk14b8;
    Borg8Header *portraitBorder;
    u8 SomeCase;
    WidgetBarter *barterMenu;
    PauseWidget *BigAssMenu; /* Hey, that's what the devs called it */
    u8 cinematicReplay;
    u8 pauseMenuSection;
    u16 BackgroundTypeCopy;
    Borg8Header *screenshot;
    Color32 screenshotTint;
    short scrollLocation[2];
    SpellBook *ShopSpells;
    void* shopUnused; //a trainer for stats or Rituals?
    CharSkills *shopSkills;
    GenericInventory *shopInv;
    ItemID Shopkeep;
    u16 unk14f2;
    uint moneypile;
    u8 creditsByte;
    u32 unk14fc;
    u8 gameStartOption;
    IntroMenu *titleScreen;
    u32 unk1508; /* unused? */
    MiniMap minimap;
    u8 unk15bc; /* start of struct? */
    DialougeClass *diaClass;
    u32 unk15c4;
    CinematicStruct cinematic;
    Party *party;
    u8 ResolutionSelect;
    FontStruct *font;
    WidgetHandler *widgetHandler;
    ScriptCamera_struct scriptcamera;
    QueueStructA QueueA;
    u16 field79_0x1e26;
    QueueStructB QueueB;
    u16 field81_0x202a;
    u8 appstateBool;
    u32 lensFlareBool;
    u8 DebugStatDisplay;
    uint maptally;
    float brightness;
    float brightness2;
    float screenFadeSpeed;
    u16 screenFadeMode;
    u16 field92_0x204a;
    char** CommonStrings;
    u8 goblinAmbush;
    float VolSFX;
    float VolBGM;
    float cloudsFloat;
    N64PrintStruct DebugQueue;
    char text[512]; //text buffer used for sprintf's.
};

extern void(*freeWidgetFunc)(BaseWidget*);

extern u16 gDebugFlag;


extern u16 gExpPakFlag; //set when OsMemSize>4MB.
 GlobalsAidyn gGlobals;

extern OSMesg* PTR_800e8f30=NULL;
extern void* osSched_stack=NULL;
extern u64 gInitThreadStack[];
extern OSThread gInitThread;
extern OSSched gSched;
extern OSMesgQueue gPIManagerQueue;
extern void* appStack_mirror;
extern u16 doubleGlobalTickerFlag;

#define APPSTACKSIZE 6162
#define APPSTACKMASK 0x12345678

//shorthand for RNG funcs.
#define RAND gGlobals.rngSeed
//many sprintfs use "gGlobals.text" as the buffer.
#define Gsprintf(fmt,...)  sprintf(gGlobals.text,fmt,__VA_ARGS__)
//many strings are called from the CommonStrings field, likely for localization purposes.
#define Cstring(name) gGlobals.CommonStrings[COMMONSTRING_##name]

#define PLAYSFX(b12,pan,vol,timer,time) PlayAudioSound(&gGlobals.SFXStruct,b12,pan,vol,timer,time)

void appInit(OSSched *sched,u8 pri,u8 id);

void set_memUsedMirror(void);
s32 Ofunc_get_MemUsed_difference(void);
s32 Ofunc_get_MemUsed_difference_2(void);
u32 rand_range(u32 A,u32 B);
u16 RollD(u8 dice,u8 sides);
u32 some_skillcheck_calc(s16);
void get_battle_terrain(EncounterDat *param_1);
void battle_setup_func(voxelObject *param_1,u16 flag,u16 param_3);
void load_camp_ambush(void);
u32 AppendText(char *str1,char *str2,u8 len);