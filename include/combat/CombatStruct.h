#include "inventory/GenericInventory.h"
#include "widgets/WidgetMenu.h"
#include "combat/substructA.h"
#include "combat/control.h"
#include "combat/encounterDat.h"
#include "combat/CombatGui.h"
#include "combat/turn.h"
#include "chestdb.h"


struct CombatStruct { /* combat structure. needs more study */
    u8 partOfDay;
    u8 EntCount; //all entities at start of battle
    u8 EntsAlive; //all living entities
    u8 partyCount; //all party members
    u8 partyAlive; //remaining party members
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
    CombatTurn_s turn;
    CombatSubstructA substruct;  //used for AI calculation
    CombatSubstructB substruct2[2];//used for AI calculation
    GenericInventory *loot_pool; //items earned
    WidgetMenu* SenseAuraWidget; //displays "Sense Arua" data
    s32 waitTimer;
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
    u8 unk5338[260]; /* unused? */
    s32 reinforcmentsWillFlee;
    u32 hasFleeRefpoints;
    u8 potionPos[4];
    u32 renderTicker;
};

CombatStruct* gCombatP=NULL;
char** encounterType_labels=NULL;
char** walking_labels=NULL;
extern char* sFilenameCombatEngine;
char** element_labels=NULL;
extern u32 some_combat_flag_;
extern u16 DAT_800e9c14;

//refernce romstring loaded during combat
#define ComString(x) gCombatP->textArray[COMBATSTRING_##x]

//use gGlobals.text as sprintf buffer for combat string
#define CSprintf(x,...) Gsprintf(ComString(x),__VA_ARGS__)

// a very odd macro, repeated a few times
// might be part of a casting macro. float is calculated THRICE.
#define CombatInitMacro1(id,A,B)\
            if (0.0 < (gEntityDB->GetCollideRadius(id) * gEntityDB->GetScale(id))*2)\
          A = ((gEntityDB->GetCollideRadius(id) * gEntityDB->GetScale(id))*2)+0.5;\
        else A = -(0.5 - ((gEntityDB->GetCollideRadius(id) * gEntityDB->GetScale(id))*2));\
        B = (u8)A;\
        if (!A) B = 1;

void set_boss_flag();

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
u32 Combat_CreateAlly(ItemID param_1,u16 param_2,u8 param_3);
void look_for_boss_shadow(ItemID param_1);
void Combat_CreateEnemies(u16 param_1,u8 param_2);
void encounter_id_check(EventFlag param_1);
void scoot_enemy_list(EncounterDat *param_1);
void Combat_InitEncounter(CombatStruct *param_1,EncounterDat *param_2);
bool Ofunc_800664ac(CombatStruct *param_1);
bool Ofunc_CombatLeaderDead(CombatStruct *param_1,s32 param_2);
bool some_combat_proximity_check(CombatStruct *param_1,ItemID id,float x,float y);
bool FUN_8006674c(CombatStruct *param_1,u32 param_2,u16 param_3,u8 param_4,float *coordA,float *CoordB,u32 param_7);
void FUN_800668e4(CombatStruct *param_1,u8 *outX,u8 *outY,u8 *param_4,u8 param_5,u8 param_6,
                 u32 param_7,u32 param_8,u8 param_9,ItemID id);
void UpdateEnemyParty(CombatStruct *param_1);
void get_gear_drop(CombatStruct *param_1,EntityRAM *param_2,Loot_RAM *param_3);
void get_exp_mod(CombatStruct *param_1,Loot_RAM *param_2,u32 param_3);
void calc_loot(CombatStruct *param_1,u8 param_2,EntityRAM *param_3);
void add_globalLoot(CombatStruct *param_1,ItemID param_2);
void calc_combat_loot(CombatStruct *param_1);
void FUN_800675b0(CombatStruct *param_1);
void FUN_80067740(CombatStruct *param_1);
void copy_string_to_combat_textbox(CombatStruct *param_1,char *txt,u32 param_3);
char * print_combat_textbox(CombatStruct *param_1,char *param_2,u32 param_3);
char * copy_to_combat_textbox_2(CombatStruct *param_1,char *param_2,u32 param_3);
void passto_combat_widget_print_func(CombatStruct *param_1);
void copy_to_textbox_1(CombatStruct *param_1);
void Ofunc_800678e8(CombatStruct *param_1);
void check_battlefeild_fleeing_refpoints(CombatStruct *param_1);
bool renderTicker_GreaterThan3(CombatStruct *param_1);

//src/gamecombat.cpp aka combat/gameCombat.cpp

void Combat_SetHideMarkers(u32 param_1);
void Set_keelover_aniType(playerData *param_1);
void Print_damage_healing(playerData *PDAT,s16 DMG,s16 Healing,bool isdead,CharSheet *param_5);
Gfx * FUN_80027aa8(Gfx *param_1);
Gfx * FUN_80027bf0(Gfx *g,u16 delta,CharSheet *param_3);
Gfx * Combat_Render(Gfx *gfx,s16 delta);
u8 CombatStateFunc_0(Gfx **GG,u16 delta);
bool FUN_80027eb0(Gfx **GG,u16 param_2);
u8 CombatStateFunc_2(Gfx **GG,u16 delta);
void func_keel_over_after_ambush(CombatEntity *param_1,playerData *param_2);
void FUN_80028180();
u8 CombatStateFunc_3(Gfx **GG,u16 delta);
void Combat_ActorDeath(playerData *param_1,u8 param_2,CombatEntity *param_3);
void FUN_800284d4();
u8 CombatStateFunc_4(Gfx** GG,u16 delta);
u8 CombatStateFunc_5(Gfx **GG,u16 delta);
u8 CombatStateFunc_6(Gfx **GG,u16 delta);
u8 CombatStateFunc_7(Gfx **GG,u16 delta);
u8 CombatStateFunc_8(Gfx **GG,u16 delta);
u8 CombatStateFunc_12(Gfx **GG,u16 delta);
u8 CombatStateFunc_13(Gfx **GG,u16 delta);
u8 CombatStateFunc_14(Gfx **GG,u16 delta);
u8 CombatStateFunc_16(Gfx **GG,u16 delta);
u8 CombatStateFunc_17(Gfx **GG,u16 delta);
u8 CombatStateFunc_18(Gfx **GG,u16 delta);
u8 CombatStateFunc_19(Gfx **GG,u16 delta);
u8 CombatStateFunc_20(Gfx **GG,u16 delta);
u8 CombatStateFunc_21(Gfx **GG,u16 delta);
u8 CombatStateFunc_22(Gfx **GG,u16 delta);
u8 CombatStateFunc_23(Gfx **GG,u16 delta);
u8 CombatStateFunc_1(Gfx **GG,u16 delta);
u8 CombatStateFunc_24(Gfx **param_1,u16 delta);
u8 CombatStateFunc_26(Gfx **GG,u16 delta);
void FUN_800290a4();
u8 CombatStateFunc_27(Gfx **GG,u16 delta);
u8 CombatStateFunc_28(Gfx **GG,u16 delta);
u8 CombatStateFunc_31(Gfx **GG,u16 delta);
bool fleeing_reinforcements_func();
u8 Combat_GameState(Gfx **GG);
void combat_start_turn_();
void init_combat_struct();
void clear_combat_func();
void refersh_terrain_check_anidat_alaronMerge();
void FUN_80029ba8();
void gamecombat_weapon_func();
void random_enemy_generator();
void clear_alaron_shadow_indices();
void alaron_shadow_merge_attempt();
void shadow_merge_cinematic();
void merge_no_horn();
void set_shadow_index(s8 param_1);
void set_alaron_index(s8 param_1);
void clear_shadow_index();
void clear_alaron_index();
bool HasHornOfKynon();
bool shadow_combat_func();
bool IsCEntInRange(CombatEntity *entA,CombatEntity *entB,float f);
bool IsShadowNearAnyone(CombatEntity *shadow);
bool IsNearShadow(CombatEntity *param_1);
void Combat_AlaronDown();
void Combat_InitGameOver();
void combat_byte_0x1a();
void Combat_GoblinAmbushKO();

void ShadowMergeBoost(int shadInd);

s8 FUN_80090cd0(playerData *param_1);
ItemID get_some_weapon_id(playerData *param_1);
ItemID Ofunc_80090da0(playerData *param_1);
ItemID Ofunc_80090e04(playerData *param_1);
u16 FUN_80090e68(playerData *param_1);