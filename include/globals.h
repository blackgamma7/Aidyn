#include "titleScreen.h"
#include "wander.h"
#include "Camera.h"
#include "MiniMap.h"
#include "party.h"
#include "stringN64.h"
#include "randClass.h"
#include "N64Print.h"
#include "inventory/GenericInventory.h"
#include "PlayerData.h"
#include "n64Borg.h"
#include "world.h"
#include "sky.h"
#include "SFX.h"
#include "portraits.h"
#include "sundial.h"
#include "commonstrings.h"
#include "widgets/handler.h"
#include "graphics.h"
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

extern void*romMain; //start of code
extern void*clear_end;//end of .bss

//used in measuring size of initial(only) segment code
#define CODESIZE ((&clear_end - &romMain) + 0x400)

enum GameModeType{
    GameMode_Trek, //roaming the world
    GameMode_Combat, //in-battle
    GameMode_Title //attract mode/flycam
};
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
    s16 mapShort1;
    s16 mapShort2;
    s16 mapShort1Copy;
    s16 mapShort2Copy;
    vec2f mapCellSize; //size of each map chunk.
    vec2f playerPos2d;
    u16 mapDatA;
    u16 mapDatB;
    u16 mapDatC;
    WeatherStruct weather;
    PlayerHandler PlayerHandler;
    ParticleHeadStruct particleHead;
    u8 unk718[128]; //unused?
    DynamicLightHead DynamicLights;
    voxelObject *teleVox;
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
    u16 mapDatFloatInd;
    u16 unk120e;
    s16 savePosTimer; //every 2 seconds, try to save player position
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
    u32 timer;
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
    WanderManager wander;
    player_char_struct playerCharStruct;
    GlobalsSub gameVars;
    SFX_Struct SFXStruct;
    u8 combatBytes[4];
    EncounterDat EncounterDat;
    playerData *playerDataArray[14]; //combat actors 
    vec3f combatCursorPos;
    s8 ShadowIndex;
    s8 AlaronIndex;
    u8 GoblinHitTally; //counts ambush hits Alaron can take before KO
    u32 expGained;
    u32 combatByteMirror;
    SkyStruct sky;
    vec3f SunPos;
    u8 unk14a4[8];
    vec3f MoonPos;
    u8 unk14b8[8];
    Borg8Header *portraitBorder;
    u8 SomeCase;
    BaseWidget *barterMenu;
    PauseWidget *BigAssMenu; /* Hey, that's what the devs called it */
    u8 cinematicReplay;
    u8 pauseMenuSection;
    u16 BackgroundTypeCopy;
    Borg8Header *screenshot;
    Color32 screenshotTint;
    s16 scrollLocation[2];
    SpellBook *ShopSpells;
    void* shopUnused; //a trainer for stats or Rituals?
    CharSkills *shopSkills;
    GenericInventory *shopInv;
    ItemID Shopkeep;
    u16 unk14f2;
    u32 moneypile;
    u8 creditsByte; //1= from menu, 2=from end of game.
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
    u32 maptally;
    float brightness;
    float brightness2;
    float screenFadeSpeed;
    u16 screenFadeMode;
    u16 field92_0x204a;
    char** CommonStrings;
    u8 goblinAmbush; //set true if combat enconter is goblin ambush at start
    float VolSFX;
    float VolBGM;
    float cloudsFloat;
    N64PrintStruct DebugQueue;
    char text[0x200]; //text buffer used for sprintf's.
};

//state indecies used by gGlobals.combatBytes[0:1] 
enum CombatStates{
  CombatState_0,
  CombatState_1,
  CombatState_2,
  CombatState_3,
  CombatState_4,
  CombatState_5,
  CombatState_6,
  CombatState_7,
  CombatState_8,
  CombatState_9,
  CombatState_10,
  CombatState_11,
  CombatState_12,
  CombatState_13,
  CombatState_14,
  CombatState_15,
  CombatState_16,
  CombatState_17,
  CombatState_18,
  CombatState_19,
  CombatState_20,
  CombatState_21,
  CombatState_22,
  CombatState_23,
  CombatState_24,
  CombatState_25,
  CombatState_26,
  CombatState_27,
  CombatState_28,
  CombatState_29,
  CombatState_30,
  CombatState_31,
};

extern void(*freeWidgetFunc)(BaseWidget*);
extern BaseWidget* PTR_800ed504;


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

Gfx* tick_and_render_widgets(Gfx*);