#include "inventory/GenericInventory.h"
#include "widgets/WidgetMenu.h"
#include "combat/substructA.h"
#include "combat/substructB.h"
#include "combat/CombatEntity.h"

struct CombatTurn {
    u8 unk0;
    u8 unk1;
    undefined field2_0x2;
    undefined field3_0x3;
    uint unk4;
    u8 *arr;
};

struct CombatStruct { /* combat structure. needs more study */
    u8 partOfDay;
    u8 EntCount; //all entities at start of battle
    u8 EntsAlive; //all living entities
    u8 playerCount; //all party members
    u8 playersAlive; //remaining party members
    u8 enemyCount; //enemies
    u8 EnemiesAlive; //remaining enemies
    u8 enemy_index;
    u32 firstKill; //set with battle's first deayj
    s32 leaderDead; //leader has been killed
    u8 leaderIndex; //index of leader's Combat Enitity
    u8 leaderMorale; //morale of leader
    u8 flask_byte; // byte when using flask
    u8 TroubadorLV; //troubadour-modified value
    u8 some_index;
    vec2f SpellMarkerPos; //XZ coords for spell cursor
    u32 gold_pool; //gold earned
    u32 EXP_pool; //experience earned
    EncounterDat *encounter_dat;
    CombatEntity *current_Ent; //entity currently taking turn.
    CombatTurn turn;
    CombatSubstructA substruct;  //used for AI calculation
    CombatSubstructB substruct2[2];//used for AI calculation
    GenericInventory *loot_pool; //items earned
    WidgetMenu* SenseAuraWidget; //displays "Sense Arua" data
    u32 waitTimer;
    char** textArray; //loaded romstring refernced in macros. use COMBATSTRING_* enums
    char textboxes[3][256]; //buffers for combat text
    u32 TextboxFlag;
    u32 TurnCount;
    u32 AniTimer;
    CombatEntity *combatEnts; //data on combatents
    void* unk52d4; //unused?
    CharSheet *CharSheets;//data on combatents
    u8 unk52dc[60]; /* unused */
    vec2f entity_XY;
    u8 unk5320[12][2];
    u8 unk5338[256]; /* unused? */
    u32 field100_0x5438; //unused?
    s32 reinforcmentsWillFlee;
    u32 hasFleeRefpoints;
    u8 potionPos[4];
    u32 renderTicker;
};

extern CombatStruct* gCombatP;

//refernce romstring loaded during combat
#define ComString(x) gCombatP->textArray[COMBATSTRING_##x]

//use gGlobals.text as sprintf buffer for combat string
#define CSprintf(x,...) Gsprintf(ComString(x),__VA_ARGS__)