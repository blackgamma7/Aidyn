#include "n64Borg.h"

struct sundail_struct {
    Borg8header * Ring;
    Borg8header * Cross;
    Borg8header * MoonPhase0;
    Borg8header * MoonPhase1;
    Borg8header * MoonPhase2;
    Borg8header * MoonPhase3;
    Borg8header * MoonPhase4;
    Borg8header * MoonPhase5;
    Borg8header * SunBig;
    Borg8header * SunSmall;
    u8 moon;
    u8 sun;
    u8 align[2];
};

struct sundail_struct * gSundail;

namespace Sundail{
    void Init();
    Gfx* Draw(Gfx*);
    void ToggleSun(u8);
    void ToggleMoon(u8);
    void Free();

};