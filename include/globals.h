#include "GhidraDump.h"
#include "Camera.h"
#include "MiniMap.h"
#include "party.h"
#include "stringN64.h"


struct SaveFile{ //relevant bits are shoved together for MemPak save files(And a temp one created by Memmaker)
    u8* data;
    u32 size;
};


struct GlobalsSub { /* 0x800e6988 */
    struct ZoneDat ZoneDatMtx[3][3];
    struct Borg9data *borg9DatPointer;
    struct EnvProp *EnvProps;
    struct collisionTypeA *zoneEnginePtr1;
    struct SpeedProperty *zoneEnginePtr2;
    u16 zoneEngineInit;
    Camera_struct camera;
    vec3f *camPtrArray[16];
    u16 camPtrArraySize;
    ushort mapShort1;
    ushort mapShort2;
    ushort mapShort1Copy;
    ushort mapShort2Copy;
    vec2f mapCellSize;
    vec2f playerPos2d;
    u16 mapDatA;
    u16 mapDatB;
    u16 mapDatC;
    Weather weather;
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

struct GlobalsAidyn { /* Globals structure of Aidyn Chronicles*/
    uint rngSeed; /* used for most rand funcs */
    int appstate;
    uint ticker;
    float delta;
    u32 splashscreenFlag;
    struct Borg12Header *introMusic;
    u32 introMusicDatA;
    u32 introMusicDatB;
    u8 splashscreenSwitch;
    struct Borg8header *thqBorg8;
    struct Borg8header *h20Borg8;
    u8 align2c[8];
    uint splashscreenTimer;
    u8 splashScreenUnkA; /* written, never read */
    u16 splashScreenUnkB; /* written, never read */
    u16 splashScreenUnkC; /* written, never read */
    u16 splashScreenUnkD; /* written, never read */
    u8 screenFadeModeSwitch;
    u8 align41[15];
    struct wander_struct wander;
    struct player_char_struct playerCharStruct;
    struct GlobalsSub Sub;
    struct SFX_Struct SFXStruct;
    u8 combatBytes[4];
    struct EncounterDat EncounterDat;
    struct playerData *playerDataArray[12];
    u64 unk142c; /* unused */
    struct vec3f combatCursorPos;
    s8 ShadowIndex;
    s8 AlaronIndex;
    u8 GoblinHitTally;
    uint expGained;
    uint combatByteMirror;
    struct SkyStruct sky;
    struct vec3f SunPos;
    u64 unk14a4;
    struct vec3f MoonPos;
    u64 unk14b8;
    struct Borg8header *portraitBorder;
    u8 SomeCase;
    struct WidgetBarter *barterMenu;
    struct PauseWidget *BigAssMenu; /* Hey, that's what the devs called it */
    u8 umk14d0;
    u8 field47_0x14d1;
    u16 BackgroundTypeCopy;
    struct Borg8header *screenshot;
    struct Color32 screenshotTint;
    short scrollLocation[2];
    struct Spellbook *ShopSpells;
    u32 shopUnused; /* probably was stats */
    struct CharSkills *shopSkills;
    struct GenericInventory *shopInv;
    struct ItemID Shopkeep;
    u16 unk14f2;
    uint moneypile;
    u8 creditsByte;
    u32 unk14fc;
    u8 gameStartOption;
    struct IntroMenu *titleScreen;
    u32 unk1508; /* unused? */
    MiniMap minimap;
    u8 unk15bc; /* start of struct? */
    DialougeStruct *dialougStruct;
    u32 unk15c4;
    struct CinematicStruct cinematic;
    struct Party *Party;
    u8 ResolutionSelect;
    struct FontStruct *font;
    struct WidgetHandler *widgetHandler;
    struct ScriptCamera_struct scriptcamera;
    struct QueueStructA QueueA;
    u16 field79_0x1e26;
    struct QueueStructB QueueB;
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
    char** CommonStrings;  // Dummied struct shows id'd strings
    u8 goblinAmbush;
    float VolSFX;
    float VolBGM;
    float cloudsFloat;
    N64Print DebugQueue;
    char text[512]; //text buffer used for sprintf's.
};

extern u16 ExpPakFlag; //set when OsMemSize>4MB.
extern GlobalsAidyn gGlobals;
