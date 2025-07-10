#include "PlayerData.h"

struct wander_substruct {
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
    short index;
    float percepDefault;//used when nearby player is idle. effected by stealth skill
    float percepSneak;//used when nearby player is in sneak state. effected by stealth skill
    float precepWalk;//used when nearby player is in walk state
    float perecpRun;//used when nearby player is in walk state
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

struct wander_struct {
    wander_substruct *wanderSubstructs;
    short wandererIndicies[39];
    u16 wanderers;
    short wanderersmax;
    u16 initalized;
};

float sneak_value(float point8);
wander_substruct * findWandererFromPlayerName(s16 arg0);
void Ofunc_800124b4(playerData **param_1,vec3f *param_2);
void WanderHead(wander_struct *wander,short size);
void wander_free(wander_struct *param_1);
void look_for_monsterparties(wander_struct *param_1,Borg9Data *param_2,s32 param_3,byte param_4);
void AllocWanderer(wander_struct *param_1,s16 param_2,s32 param_3,u8 param_4);
void  FreeWanderer(wander_struct *param_1,wander_substruct *param_2);
void FreeWandererFromZone(wander_struct *param_1,int param_2);
void FreeAllWanderers(wander_struct *param_1);
playerData * FUN_80012b44(wander_struct *param_1,wander_substruct *param_2);
void WanderGetNextNode(wander_struct *param_1,wander_substruct *param_2,short param_3);
void FUN_80012c58(wander_struct *param_1,wander_substruct *param_2);
void FUN_80012d44(wander_substruct *param_1);
void WanderSubstruct_setFlag1(wander_substruct *param_1);
void WanderTick(wander_struct *param_1,short delta);
