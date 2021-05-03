#define dtor 0.017453f
#define INT_MAX_f 2.14748365E9f
#define INT_MAX_d 2.14748365E9d
#define UINT_MAX_d 4.294967296E9d



#define ABS_macro(x) (if((float)x>=INT_MAX_f){x-=INT_MAX_f})
#define clear_macro(x) (memset(&x,0,sizeof(x)))
#define LE(x) ((ushort)x[0] + (ushort)x[1] * 0x100) //for the byteswapping in ROM data

struct{byte r,g,b,a;}color;

#define OFFWHITE {0xe1,0xe1,0xe1,0xff}
#define DARKGRAY {0x32,0x32,0x32,0xff}
#define DARKGRAY_T {0x32,0x32,0x32,0x96}
#define YELLOW_T {0xc8,0xc8,0,0xe1}

typedef float vec2[2];
typedef float vec3[3];
typedef float vec4[4];
typedef uint rspCom[2]; //placeholder type for Ucode instructions.

enum WEAPONCLASS{
	BITE, BREATH, CLAW, HAFTED, MISSLE, POLE, SPIT, STING, SWORD, THROWN, TUSK
};

enum ELEMENT{
	NONE, EARTH, SOLAR, PHYSICAL, NECROMANCY, FIRE, LUNAR, NAMING, WATER, MAGIC, AIR, STAR, ELEMENTAL, CHAOS, CUTTING, SMASHING, HOLY
};

enum ASPECT{NONE, LUNAR, SOLAR, SOLAR_MAGIC, LUNAR_MAGIC};

enum CHAR_STAT{INT, WIL, DEX, END, STR, STAM, LV, NONE=255};

enum CHAR_SKILL{
	ALCHEMIST, DIPLOMAT, HEALER, LOREMASTER, MECHANIC, MERCHANT, RANGER, STEALTH, THEIF, TROUBADOR, WARRIOR, WIZARD, NONE=255
};

enum DB_TYPE{
	EMPTY, MISC, ENTITY, SPELL, ARMOR, UNK4, SHIELD, WEAPON, CHEST, HELMET, CLOAK, GLOVE, RING, WAND, BELT, BOOTS, POTION, SCROLL, KEYITEM, AMULET, DIALOUGEENTITY
};

enum POTION{
	FIRE, INFERNO, SLEEP, ACID, HEALING, STAMINA, CURING, ANTIDOTE, RESTORE, STRENGTH, DEXTERITY, A, J, CLARITY, CHARISMA, DEFENCE, STEALTH
}; // A and J are ommited. couple funcs change "A" potions into healing potions automatically.




struct GlobalsSub {
    struct ZoneDat ZoneDatMtx[3][3];
    struct Borg_9_data * borg9DatPointer;
    void *[3] * zoneEnginePtr0;
    float[10] * zoneEnginePtr1;
    float[7] * zoneEnginePtr2;
    undefined2 zoneEngineInit;
    undefined2 align0x132;
    struct Camera_struct camera;
    pointer ptrArray0x250[16];
    undefined2 camInitFlag_;
    ushort mapShortA;
    ushort mapShortB;
    ushort mapShortAMirror;
    ushort mapShortBMirror;
    u8 unk0x29a;
    u8 unk0x29b;
    Vec2 mapCellSize;
    float SpawnX;
    float SpawnY;
    undefined2 mapDatA;
    undefined2 mapDatB;
    undefined2 mapDatC;
    undefined2 align0x2b2;
    struct weatherStruct weather;
    undefined3 align0x2d5;
    struct PlayerHandler PlayerHandler;
    struct ParticleHeadStruct particleEmmiter;
    byte unk0x692[262];  //nothing seems to use this area. wonder what it was for.
    struct dynamic_light_struct DynamicLights;
    struct teleport_obj * TP;
    vec3 * TPCoords;
    struct mapFloatDat mapFloatDatEntry;
    struct Borg_12_header * bgm;
    undefined4 bgmDat;
    byte bgmByte;
    u8 unk0xf39;
    undefined2 bgmTrack;
    undefined2 bgmQueue;
    undefined2 gamemodeType;
    struct flycamStruct flycam;
    struct mapFloatDat mapFloatDatArray[3][5];
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

struct GlobalsAidyn { /* Globals structure of Aidyn Chronicles v1.0 */
    uint rngSeed;
    int appState;
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
    u64 unk0x2c;
    uint splashscreenTimer;
    byte splashscreenUnkA;
    u8 unk0x39;
    ushort splashScreenUnkB;
    ushort splashScreenUnkC;
    ushort splashScreenUnkD;
    byte screenFadeModeSwitch;
    byte unk0x41[15];
    struct wander_struct wander;
    struct player_char_struct playerChar;
    struct GlobalsSub Sub;
    struct SFX_Struct SFXStruct; /* 4 bytes bigger in retail */
    byte combatBytes[4];
    struct EncounterDat EncounterDat;
    struct playerData * playerDataArray[12];
    u64 unk0x1430;
    vec3 unk0x1438;
    char ShadowIndex;
    char AlaronIndex;
    byte GoblinHitTally;
    u8 unk0x1447;
    uint exp_val;
    uint combatbyteMirror;
    struct SkyStruct sky;
    vec3 unk0x149c;
    u64 unk0x14a8;
    vec3 unk0x14b0;
    u64 unk0x14bc;
    struct Borg_8_header * portraitBorder;
    byte someCase;
    undefined3 unk0x14c9;
    void * unkPausePointer;
    struct pause_struct * bigassMenu; //hey, that's what the code calls it.
    byte unk0x14d4;
    byte unk0x14d5;
    undefined2 unk0x14d6;
    struct Borg_8_header * screenshot;
    struct color screenshotTint;
    short scrollLocation[2];
    struct spellbook * ShopSpells;
    u32 shopUnused; /* probably was stats */
    struct CharSkills * shopSkills;
    struct Inventory_struct * shopInv;
    struct ItemID Shopkeep;
    undefined2 align0x14f6;
    uint moneypile;
    byte unk0x14fc;
    undefined3 align0x14fd;
    u32 unk0x1500;
    byte unk0x1504;
    undefined3 align0x1505;
    struct widgetStruct * titleScreen;
    undefined4 unk0x150c;
    struct Minimap_struct minimap;
    byte unk0x15c0;
    undefined3 align0x15c1;
    struct astruct_12 * unk0x15c4;
    undefined4 unk0x15c8;
    struct CinematicStruct cinematic;
    struct PartyStruct * Party;
    byte ResolutionSelect;
    undefined3 align0x1601;
    struct FontStruct * font;
    struct WidgetHandler * widgetHandler;
    struct ScriptCamera_struct scriptcamera;
    struct QueueStructA QueueA;
    undefined2 align0x162a;
    struct QueueStructB QueueB;
    undefined2 unk0x202e;
    byte appstateBool;
    undefined3 align0x2031;
    u32 unk0x2034;
    byte DebugStatDisplay;
    undefined3 align0x2039;
    uint maptally;
    float screenfadeFloat;
    float acreenfadeFloat2;
    float screenFadeSpeed;
    undefined2 StoryShort;
    undefined2 align0x205e;
    char** CommonStrings;
    byte goblinAmbush; //set with the goblin ambush at the start of the game.
    undefined3 align0x2055;
    float VolSFX;
    float VolBGM;
    float cloudsFloat;
    struct Debug_queue DebugQueue; /* unused in retail */
    undefined2 align0x207a;
    char text[512]; //most sprintf's go here
};

extern s16 ExpPakFlag; //set when OsMemSize>4MB.
extern GlobalsAidyn gGlobals;
