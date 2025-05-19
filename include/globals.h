//#include "GhidraDump.h"
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
#include "freeQueue.h"
#include "spells.h"
#include "weather.h"
#include "cinematics.h"
#include "dialoug.h"
#include "widgets/PauseWidget.h"
#include "ZoneEngine.h"

#include "crash.h"
#include "heapN64.h"
#include "romcopy.h"
#include "eventFlag.h"

struct GlobalsSub { /* 0x800e6988 */
    ZoneDat ZoneDatMtx[3][3];
    Borg9data *borg9DatPointer;
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
    vec2f mapCellSize;
    vec2f playerPos2d;
    u16 mapDatA;
    u16 mapDatB;
    u16 mapDatC;
    WeatherStruct weather;
    PlayerHandler PlayerHandler;
    ParticleHeadStruct particleEmmiter;
    u8 unk718[128];
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
    flycamStruct flycamDat;
    mapFloatDat MapFloatDats[3][5];
    u16 unkCounter;
    u16 unk120e;
    u16 unkTimer;
    u8 unk1212[6];
};
struct EncounterDat { /* enemy encounter data */
    ItemID enemy_entities[12]; /* entitty id's of enemies */
    ItemID globalLoot; /* chestdb of guarunteed loot */
    u16 EncounterID;
    u8 field3_0x1c;
    undefined field4_0x1d;
    u16 VoxelIndex;
    u16 mapDatA;
    u16 MapSAhortA;
    u16 MapShortB;
    u8 collisionByte;
    u8 battlefield;
    u8 unk28;
    u8 BossShadow; /* fighting a Boss or the Shadow */
    u16 VoxelFlagA;
    u16 VoxelBitfield;
};

struct GlobalsAidyn { /* Globals structure of Aidyn Chronicles*/
    Random rngSeed; /* used for most rand funcs */
    int appstate;
    u32 ticker;
    float delta;
    u32 splashscreenFlag;
    Borg12Header *introMusic;
    u32 introMusicDatA;
    u32 introMusicDatB;
    u8 splashscreenSwitch;
    Borg8header *thqBorg8;
    Borg8header *h20Borg8;
    u8 align2c[8];
    uint splashscreenTimer;
    u8 splashScreenUnkA; /* written, never read */
    u16 splashScreenUnkB; /* written, never read */
    u16 splashScreenUnkC; /* written, never read */
    u16 splashScreenUnkD; /* written, never read */
    u8 screenFadeModeSwitch;
    u8 align41[15];
    wander_struct wander;
    player_char_struct playerCharStruct;
    GlobalsSub Sub;
    SFX_Struct SFXStruct;
    u8 combatBytes[4];
    EncounterDat EncounterDat;
    playerData *playerDataArray[12];
    u64 unk142c; /* unused */
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
    Borg8header *portraitBorder;
    u8 SomeCase;
    WidgetBarter *barterMenu;
    PauseWidget *BigAssMenu; /* Hey, that's what the devs called it */
    u8 cinematicReplay;
    u8 field47_0x14d1;
    u16 BackgroundTypeCopy;
    Borg8header *screenshot;
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
    DialougeClass *dialougStruct;
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
    u32 appfunc_dat;
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

extern u16 gDebugFlag;


extern u16 gExpPakFlag; //set when OsMemSize>4MB.
 GlobalsAidyn gGlobals;

//shorthand for RNG funcs.
#define RAND gGlobals.rngSeed
//many sprintfs use "gGlobals.text" as the buffer.
#define Gsprintf(fmt,...)  sprintf(gGlobals.text,fmt,__VA_ARGS__)
//many strings are called from the CommonStrings field, likely for localization purposes.
#define Cstring(name) gGlobals.CommonStrings[COMMONSTRING_##name]

#define PLAYSFX(b12,pan,vol,timer,time) PlayAudioSound(&gGlobals.SFXStruct,b12,pan,vol,timer,time)


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