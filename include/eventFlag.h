#pragma once
#include "typedefs.h"
#include "Flagindecies.h"

typedef enum event_flag_typeA {
    FLAG_LOG,
    FLAG_VAL,
    FLAG_CNT,
    FLAG_BIT,
    FLAG_INVA
} event_flag_typeA;

typedef enum Event_flag_typeB {
    FLAG_AND,
    FLAG_IOR,
    FLAG_EOR,
    FLAG_NOT,
    FLAG_MSK,
    FLAG_EQU,
    FLAG_GRT,
    FLAG_LST,
    FLAG_NEQ,
    FLAG_INVB
} Event_flag_typeB;

struct Struct_State {
    u16 shortA;
    u16 shortB; //index at GameStateFunnel.other_pointer
    u8 type; //uses event_flag_typeA
    u8 command; //uses Event_flag_typeB
    u8 Flag;
    u8 length;
};

struct GameStateFunnel { /* used for event flags and whatnot */
    u16 flagTotal; //all (valid) state entries in struct
    u16 flagCountB; //length of unklist
    u16 bitFlags; //number of (mostly) BIT type flags
    u16 flag;
    Struct_State *States_pointer; //first 5001 are BIT types - could be optimized as u8*?
    u16 *other_pointer; //set to &unklist.
    u16* unk10; //blank, unused, save one orphaned func
    u32 unk14[2];
    int g;// inital non-zero value. unused.
    Struct_State states[5001]; //mostly BIT types - could be optimized as u8[]?
    Struct_State otherStates[626]; //flags that are not simply BIT types
    u16 unklist[1372];
};

struct event_flag_array {
    u16 to;
    u16 from;
    s16 val;
    u8 skill_stat;
};

extern GameStateFunnel* gameStates;
extern event_flag_array eventflagArrayStats[];
extern event_flag_array eventflagArraySkills[];

#if DEBUGVER
extern char eventflag_types1[][4];
extern char eventflag_types2[][4];
#endif

typedef u16 EventFlag;

//gameStateFunnel.cpp

void Event_flag_stat(u8 param_1);
void set_flag_array(EventFlag param_1,EventFlag param_2,u16 param_3);
s32 find_event_flag_array_index(char param_1,event_flag_array *param_2,u8 param_3);
void SetFlagArray_on_Time(u8 ToD,u8 Day,u8 week,u8 month);
void set_weather_flags(u8 x);
void set_terrain_flags(u8 x);
void Passto_State_typeA_branch(EventFlag param_1);

u8 load_gamestateFunnel();
u8 clear_gamestatefunnel();
void setEventFlag(u16 flag,u8 state);
u8 getEventFlag(u16 flag);

#if DEBUGVER
u8 Get_eventFlagCheck(u16 flag);
#endif

//gamestatefilehandler.cpp

void setBit(u8 *out,u32 i,bool set,u8 *maskA,u8 *maskB);
bool getBit(u8 *stream,u32 flag,u8 *mask);
void LoadGameState(GameStateFunnel *param_1,u8 *param_2);
void SaveGameState(GameStateFunnel *param_1,u8 *param_2);

//gamestatelib.cpp

void setGSF_pointers(GameStateFunnel*);
u16  gameStateBitmask(GameStateFunnel *param_1,Struct_State *param_2);
s16 gamestate_func_with_ANDgate(u16 param_1);
void GameStateCrash(char *txt);
void ProcessGameStates(GameStateFunnel *param_1);
void set_gamestateFunnel_f(GameStateFunnel *param_1);
void set_journalentry_flag(GameStateFunnel *param_1,EventFlag flag,u16 bit);
u8 get_eventFlag_(GameStateFunnel *param_1,EventFlag param_2);
u8 get_EventFlag(GameStateFunnel *param_1,EventFlag param_2);
Struct_State * get_struct_state(GameStateFunnel *param_1,EventFlag param_2);

