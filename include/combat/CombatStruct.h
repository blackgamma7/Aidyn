#include "inventory/GenericInventory.h"
#include "widgets/WidgetMenu.h"
#include "combat/substructA.h"
#include "combat/substructB.h"
#include "combat/CombatEntity.h"
#include "combat/encounterDat.h"
#include "chestdb.h"

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

// a very odd macro, repeated a few times
// might be part of a casting macro. float is calculated THRICE.
#define CombatInitMacro1(id,A,B)\
            if (0.0 < (gEntityDB->GetFloatC(id) * gEntityDB->GetScale(id))*2)\
          A = ((gEntityDB->GetFloatC(id) * gEntityDB->GetScale(id))*2)+0.5;\
        else A = -(0.5 - ((gEntityDB->GetFloatC(id) * gEntityDB->GetScale(id))*2));\
        B = (u8)A;\
        if (!A) B = 1;

//combatengine/combat.cpp

bool EntityCannotFight(ItemID id);
void memset_combat_struct(CombatStruct *);
voxelObject * get_refpoint_by_name(u32 param_1,u8 param_2,bool GOrE);
void Combat_GetSpawnPoint(CombatStruct *cEnt,u8 *posx,u8 *posz,u8 *rand,u8 param_5,int param_6,int param_7,u8 param_8);
void combatEnt_setup(CombatStruct *param_1,u8 index);
u16 count_enemies(EncounterDat *dat);
u8 find_sholeh(EncounterDat *dat);
void NOOP_800658a0(u8 players,u8 enemies);
u8 recount_enemy_party(EncounterDat *param_1,u16 param_2);
int look_for_flasks(void);
u16 Combat_CreatePartyMembers(u8 param_1);
uint Combat_CreateAlly(ItemID param_1,u16 param_2,u8 param_3);
void look_for_boss_shadow(ItemID param_1);
void Combat_CreateEnemies(u16 param_1,u8 param_2);
void encounter_id_check(EventFlag param_1);
void scoot_enemy_list(EncounterDat *param_1);
void Combat_InitEncounter(CombatStruct *param_1,EncounterDat *param_2);
bool Ofunc_800664ac(CombatStruct *param_1);
bool Ofunc_CombatLeaderDead(CombatStruct *param_1,s32 param_2);
bool some_combat_proximity_check(CombatStruct *param_1,ItemID param_2,float param_3,float param_4);
bool FUN_8006674c(CombatStruct *param_1,u32 param_2,u16 param_3,byte param_4,float *coordA,float *CoordB,uint param_7);
void FUN_800668e4(CombatStruct *param_1,u8 *outX,u8 *outY,u8 *param_4,u8 param_5,u8 param_6,
                 u32 param_7,u32 param_8,u8 param_9,ItemID id);
void func_settting_leader_dead_flag(CombatStruct *param_1);
void get_gear_drop(CombatStruct *param_1,Entity_Ram *param_2,Loot_RAM *param_3);
void get_exp_mod(CombatStruct *param_1,Loot_RAM *param_2,uint param_3);
void calc_loot(CombatStruct *param_1,byte param_2,Entity_Ram *param_3);
void add_globalLoot(CombatStruct *param_1,ItemID param_2);
void calc_combat_loot(CombatStruct *param_1);
void FUN_800675b0(CombatStruct *param_1);
void FUN_80067740(CombatStruct *param_1);
void copy_string_to_combat_textbox(CombatStruct *param_1,char *txt,uint param_3);
char * print_combat_textbox(CombatStruct *param_1,char *param_2,uint param_3);
void passto_combat_widget_print_func(CombatStruct *param_1);
void copy_to_textbox_1(CombatStruct *param_1);
void Ofunc_800678e8(CombatStruct *param_1);
void check_battlefeild_fleeing_refpoints(CombatStruct *param_1);
bool renderTicker_GreaterThan3(CombatStruct *param_1);