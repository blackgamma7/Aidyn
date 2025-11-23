#include "PlayerData.h"

struct Wanderer {
    playerData *playerDat;
    vec2f start_position;
    float wanderRadius;
    float randVal;
    float nodeswapChance;
    u16 timer;
    u16 homenode;
    u16 noderelA;
    u16 noderelB;
    s16 isActive;
    s16 index;
    float percepDefault;//used when nearby player is idle. effected by stealth skill
    float percepSneak;//used when nearby player is in sneak state. effected by stealth skill
    float precepWalk;//used when nearby player is in walk state
    float perecpRun;//used when nearby player is in run state
    float percepMax;
    u16 flags;
    s16 perceptionsSet;
    u16 NoBorg13;
    u16 field19_0x3e;
    vec2f position;
    float size;
    int MapTally;
    u16 VoxelIndex;

};

struct WanderManager {
    Wanderer *wanderSubstructs;
    s16 wandererIndicies[39];
    u16 wanderers;
    s16 wanderersmax;
    u16 initalized;
};

float sneak_value(float point8);
Wanderer * findWandererFromPlayerName(s16 arg0);
void Ofunc_800124b4(playerData **param_1,vec3f *param_2);
void WanderHead(WanderManager *wander,s16 size);
void FreeWanderHead(WanderManager *param_1);
void look_for_monsterparties(WanderManager *param_1,Borg9Data *param_2,s32 param_3,byte param_4);
void AllocWanderer(WanderManager *param_1,s16 param_2,s32 param_3,u8 param_4);
void  FreeWanderer(WanderManager *param_1,Wanderer *param_2);
void FreeWandererFromZone(WanderManager *param_1,int param_2);
void FreeAllWanderers(WanderManager *param_1);
playerData * FUN_80012b44(WanderManager *param_1,Wanderer *param_2);
void WanderGetNextNode(WanderManager *param_1,Wanderer *param_2,s16 param_3);
void FUN_80012c58(WanderManager *param_1,Wanderer *param_2);
void FUN_80012d44(Wanderer *param_1);
void WanderSubstruct_setFlag1(Wanderer *param_1);
void WanderTick(WanderManager *param_1,s16 delta);
