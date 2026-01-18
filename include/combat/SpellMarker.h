#include "SceneData.h"

SceneData* gCombatSpellMarker=NULL;
float CombatCurrentEnt_Y=0.0;

namespace CombatSpellMarker{
    Gfx * Render(Gfx *g,SceneData *sceneDat,vec3f *rotate,vec3f *pos,vec3f *scale,u8 alpha,u32 col);
    void Init(void);
    void Free(void);
    Gfx * Tick(Gfx *g,u8 delta,u8 range,u32 col);
}