#include "mathN64.h"
#include "GhidraDump.h"

struct N64PrintStruct {
    char *text;
    vec4f color;
    short ShortA;
};

namespace N64Print{
    void UnkA(s32 param_1,u16 param_2);
    void UnkB(void);
    void Toggle(N64PrintStruct *param_1,controller_aidyn *param_2);
    void Clear(void);
    void Init(N64PrintStruct *param_1);
    void Free(void);
    char* CleanText(char *param_1,char param_2,s16 param_3);
    void PrintCheck(char *x);
    #ifdef DEBUGVER
    void Print(char *param_1);
    #else
    void Print();
    #endif
    Gfx* Draw(Gfx*gfx,s16 param_2);
};

N64PrintStruct* gN64PrintP;
u16 show_debug_queue;
u16 ofunc_value;