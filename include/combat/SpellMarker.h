#include "GhidraDump.h"

AnimationData* gCombatSpellMarker=NULL;
float CombatCurrentEnt_Y=0.0;

namespace CombatSpellMarker{
    Gfx * Render(Gfx *g,AnimationData *aniDat,vec3f *rotate,vec3f *pos,vec3f *scale,u8 alpha,Color32 col);
    void Init(void);
    void Free(void);
    Gfx * Tick(Gfx *g,u8 delta,u8 range,Color32 col);
}