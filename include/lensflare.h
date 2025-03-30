#include "n64Borg.h"

struct lensflare_data {
    u8 dat0;
    float f0;
    float f1;
    Color32 col;
};

lensflare_data gLensFlareData[];
vec2f gLensFlarePos={0};
Borg8header** gLensflare=NULL;

u8 lensflare_bss;

namespace Lensflare{
    void Init();
    void Free();
    Gfx* Render(Gfx*);
};