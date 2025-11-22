#include "n64Borg.h"

struct sundail_struct {
    Borg8Header * Ring;
    Borg8Header * Cross;
    Borg8Header * MoonPhase0;
    Borg8Header * MoonPhase1;
    Borg8Header * MoonPhase2;
    Borg8Header * MoonPhase3;
    Borg8Header * MoonPhase4;
    Borg8Header * MoonPhase5;
    Borg8Header * SunBig;
    Borg8Header * SunSmall;
    u8 moon;
    u8 sun;
    u8 align[2];
};

struct sundail_struct * gSundail;

namespace Sundial{
    void Init();
    Gfx* Draw(Gfx*);
    void ToggleSun(u8);
    void ToggleMoon(u8);
    void Free();
};