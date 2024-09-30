#include "typedefs.h"
typedef enum event_flag_typeA {
    FLAG_LOG=0,
    FLAG_VAL=1,
    FLAG_CNT=2,
    FLAG_BIT=3,
    FLAG_INV=4
} event_flag_typeA;

typedef enum Event_flag_typeB {
    FLAG_AND=0,
    FLAG_IOR=1,
    FLAG_EOR=2,
    FLAG_NOT=3,
    FLAG_MSK=4,
    FLAG_EQU=5,
    FLAG_GRT=6,
    FLAG_LST=7,
    FLAG_NEQ=8,
    FLAG_INV=9
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
    struct Struct_State *States_pointer;
    struct Struct_State *other_pointer;
    undefined field6_0x10[12];
    int g;
    struct Struct_State states[5000]; //mostly BIT types - could be optimized as u8[]?
    struct Struct_State otherStates[970];
};
GameStateFunnel* gameStates;

typedef u16 EventFlag;

void Event_flag_stat(u8 param_1);