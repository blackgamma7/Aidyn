#include "commonTypes.h"


struct SaveFile{ //relevant bits are shoved together for MemPak save files(And a temp one created by Memmaker)
    u8* data;
    u32 size;
};


struct GlobalsSub {
    struct ZoneDat ZoneDatMtx[3][3];
    struct Borg_9_data * borg9DatPointer;
    void *[3] * zoneEnginePtr0;
    float[10] * zoneEnginePtr1;
    float[7] * zoneEnginePtr2;
    u16 zoneEngineInit;
    u16 align0x132;
    struct Camera_struct camera;
    pointer ptrArray0x250[16];
    u16 camInitFlag_;
    u16 mapShortA;
    u16 mapShortB;
    u16 mapShortAMirror;
    u16 mapShortBMirror;
    u8 unk0x29a;
    u8 unk0x29b;
    Vec2 mapCellSize;
    float SpawnX;
    float SpawnY;
    u16 mapDatA;
    u16 mapDatB;
    u16 mapDatC;
    u16 align0x2b2;
    struct weatherStruct weather;
    struct PlayerHandler PlayerHandler;
    struct ParticleHeadStruct particleEmmiter;
    u8 unk0x692[262];  //nothing seems to use this area. wonder what it was for.
    struct dynamic_light_struct DynamicLights;
    struct teleport_obj * TP;
    vec3 * TPCoords;
    struct mapFloatDat mapFloatDatEntry;
    struct Borg_12_header * bgm;
    s32 bgmDat;
    u8 bgmByte;
    u8 unk0xf39;
    u16 bgmTrack;
    u16 bgmQueue;
    u16 gamemodeType;
    struct flycamStruct flycam;
    struct mapFloatDat mapFloatDatArray[3][5];
    u16 unk0x120c;
    u16 unk0x120e;
    u16 unk0x1210;
    u8 unk0x1212;
    u8 unk0x1213;
    u8 unk0x1214;
    u8 unk0x1215;
    u8 unk0x1216;
    u8 unk0x1217;
};

struct GlobalsAidyn { /* Globals structure of Aidyn Chronicles v1.0 */
    u32 rngSeed;
    s32 appState;
    u32 ticker;
    float delay;
    s32 splashscreenFlag;
    struct Borg_12_header * introMusic;
    s32 introMusicDatA;
    s32 introMusicDatB;
    u8 splashscreenSwitch; //may be another substruct? (listed as gGlobals.titleSplashVars in alpha)
    u8 align0x21[3];
    struct Borg_8_header * thqBorg8;
    struct Borg_8_header * h20Borg8;
    u64 unk0x2c;
    u32 splashscreenTimer;
    u8 splashscreenUnkA;
    u8 unk0x39;
    u16 splashScreenUnkB;
    u16 splashScreenUnkC;
    u16 splashScreenUnkD;
    u8 screenFadeModeSwitch;
    u8 unk0x41[15];
    struct wander_struct wander;
    struct player_char_struct playerChar;
    struct GlobalsSub Sub;
    struct SFX_Struct SFXStruct; /* 4 bytes bigger in retail */
    u8 combatBytes[4];
    struct EncounterDat EncounterDat;
    struct playerData * playerDataArray[12];
    u64 unk0x1430;
    vec3 unk0x1438;
    char ShadowIndex;
    char AlaronIndex;
    u8 GoblinHitTally;
    u8 unk0x1447;
    u32 exp_val;
    u32 combatbyteMirror;
    struct SkyStruct sky;
    vec3 unk0x149c;
    u64 unk0x14a8;
    vec3 unk0x14b0;
    u64 unk0x14bc;
    struct Borg_8_header * portraitBorder;
    u8 someCase;
    u8 unk0x14c9[3];
    void * unkPausePointer;
    struct pause_struct * bigassMenu; //hey, that's what the code calls it.
    u8 unk0x14d4;
    u8 unk0x14d5;
    u16 unk0x14d6;
    struct Borg_8_header * screenshot;
    struct color32 screenshotTint;
    s16 scrollLocation[2];
    struct spellbook * ShopSpells;
    u32 shopUnused; /* probably was stats */
    struct CharSkills * shopSkills;
    struct Inventory_struct * shopInv;
    struct ItemID Shopkeep;
    u16 align0x14f6;
    u32 moneypile;
    u8 unk0x14fc;
    u8 align0x14fd[3];
    u32 unk0x1500;
    u8 unk0x1504;
    u8 align0x1505[3];
    struct widgetStruct * titleScreen;
    s32 unk0x150c;
    struct Minimap_struct minimap;
    u8 unk0x15c0;
    u8 align0x15c1[3];
    struct astruct_12 * unk0x15c4;
    s32 unk0x15c8;
    struct CinematicStruct cinematic;
    struct PartyStruct * Party;
    u8 ResolutionSelect;
    u8 align0x1601[3];
    struct FontStruct * font;
    struct WidgetHandler * widgetHandler;
    struct ScriptCamera_struct scriptcamera;
    struct QueueStructA QueueA;
    u16 align0x162a;
    struct QueueStructB QueueB;
    u16 unk0x202e;
    u8 appstateBool;
    u8 align0x2031[3];
    u32 unk0x2034;
    u8 DebugStatDisplay;
    u8 align0x2039[3];
    u32 maptally;
    float screenfadeFloat;
    float acreenfadeFloat2;
    float screenFadeSpeed;
    u16 screenFadeMode;
    u16 align0x205e;
    char** CommonStrings;
    u8 goblinAmbush; //set with the goblin ambush at the start of the game.
    u8 align0x2055[3];
    float VolSFX;
    float VolBGM;
    float cloudsFloat;
    struct Debug_queue DebugQueue; /* unused in retail */
    u16 align0x207a;
    char text[512]; //most sprintf's go here
};

extern u16 ExpPakFlag; //set when OsMemSize>4MB.
extern GlobalsAidyn gGlobals;
