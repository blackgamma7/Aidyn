#include "n64Borg.h"
namespace Portraits{
    u16 screen_bottom=SCREEN_HEIGHT;
    void InitBorder();
    u8 CheckPos(u8 param_1);
    Gfx* Draw(Gfx*,u8);
    void BlendColors(Color32*,Color32*,float);
    Gfx* DrawParty(Gfx*,u8,Color32*);
    void FreeBorder();
};