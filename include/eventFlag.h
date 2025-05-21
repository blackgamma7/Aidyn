#include "typedefs.h"
#include "Flagindecies.h"

typedef enum event_flag_typeA {
    FLAG_LOG,
    FLAG_VAL,
    FLAG_CNT,
    FLAG_BIT,
    FLAG_INV
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
    FLAG_INV
} Event_flag_typeB;

struct Struct_State {
    u16 shortA;
    u16 shortB;
    u8 type;
    u8 command;
    u8 Flag;
    u8 byte7;
};

struct GameStateFunnel { /* used for event flags and whatnot */
    u16 a;
    u16 b;
    u16 flag_count;
    u16 f;
    Struct_State *States_pointer; //mostly BIT types - could be optimized as u8*?
    Struct_State *other_pointer;
    u8 field6_0x10[12];
    int g;
    Struct_State states[5000]; //mostly BIT types - could be optimized as u8[]?
    Struct_State otherStates[970];
};

struct event_flag_array {
    u16 to;
    u16 from;
    s16 val;
    u8 skill_stat;
};
event_flag_array eventflagArrayStats[]={
    {0x915,0x919,0,STAT_INT},{0x91A,0x91E,0,STAT_WIL},{0x91F,0x923,0,STAT_END},
    {0x924,0x928,0,STAT_DEX},{0x929,0x92d,0,STAT_STR}
};
event_flag_array eventflagArraySkills[]={
    {0x92e,0x9323,0,SKILL_Mechanic},{0x938,0x93C,0,SKILL_Loremaster},{0x93d,0x941,0,SKILL_Wizard},
    //Large blank space below, may be from proceeding script instead.
    {0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},
    {0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},
};

GameStateFunnel* gameStates=NULL;


typedef u16 EventFlag;

//gameStateFunnel.cpp

void Event_flag_stat(u8 param_1);
void set_flag_array(EventFlag param_1,EventFlag param_2,u16 param_3);
s32 find_event_flag_array_index(char param_1,event_flag_array *param_2,u8 param_3);


void setEventFlag(u16 flag,u8 state);
u8 getEventFlag(u16 flag);

//gamestatefilehandler.cpp

void setBit(u8 *out,uint i,bool set,u8 *maskA,u8 *maskB);
bool getBit(u8 *stream,uint flag,u8 *mask);
void LoadGameState(GameStateFunnel *param_1,u8 *param_2);
void SaveGameState(GameStateFunnel *param_1,u8 *param_2);

//gamestatelib.cpp

void setGSF_pointers(GameStateFunnel*);
u16  gameStateBitmask(GameStateFunnel *param_1,Struct_State *param_2);
short gamestate_func_with_ANDgate(ushort param_1);
void GameStateCrash(char *txt);
void ProcessGameStates(GameStateFunnel *param_1);
void set_gamestateFunnel_f(GameStateFunnel *param_1);
void set_journalentry_flag(GameStateFunnel *param_1,EventFlag flag,u16 bit);
byte get_eventFlag_(GameStateFunnel *param_1,EventFlag param_2);
bool get_EventFlag(GameStateFunnel *param_1,EventFlag param_2);
Struct_State * get_struct_state(GameStateFunnel *param_1,EventFlag param_2);

