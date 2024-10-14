#include "mathN64.h"
#include "Controller.h"

//struct for displayed debug messages 
struct N64PrintStruct {
    char *text;
    vec4f color; //0-1 RGBA
    short ShortA;
};

namespace N64Print{
    void UnkA(s32,u16);
    void UnkB(void);
    void Toggle(N64PrintStruct*,controller_aidyn*);
    void Clear(void);
    void Init(N64PrintStruct*);
    void Free(void);
    char* CleanText(char *,char ,s16 );
    void PrintCheck(char *x);
    #ifdef DEBUGVER
    void Print(char *);
    #else
    void Print();
    #endif
    Gfx* Draw(Gfx*gfx,s16 param_2);
};

N64PrintStruct* gN64PrintP;
u16 show_debug_queue;
u16 ofunc_value;