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
GameStateFunnel* gameStates;

typedef u16 EventFlag;

void Event_flag_stat(u8 param_1);

void setEventFlag(u16,u8);
u8 getEventFlag(u16);