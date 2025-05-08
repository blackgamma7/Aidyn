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
    u8 EntCount;
    u8 EntsAlive;
    u8 playerCount;
    u8 playersAlive;
    u8 enemyCount;
    u8 EnemiesAlive;
    u8 enemy_index;
    u32 firstKill;
    s32 leaderDead;
    u8 leaderIndex;
    u8 leaderMorale;
    u8 flask_byte;
    u8 TroubadorLV;
    u8 some_index;
    vec2f SpellMarkerPos;
    u32 gold_pool;
    u32 EXP_pool;
    EncounterDat *encounter_dat;
    CombatEntity *current_Ent;
    CombatTurn turn;
    CombatSubstructA substruct;
    CombatSubstructB substruct2[2];
    GenericInventory *loot_pool;
    WidgetMenu* SenseAuraWidget;
    u32 waitTimer;
    char** textArray; //loaded rommstring refernced in macros
    char textboxes[3][256];
    u32 TextboxFlag;
    u32 TurnCount;
    u32 AniTimer;
    CombatEntity *combatEnts;
    u32 unk52d4;
    CharSheet *CharSheets;
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