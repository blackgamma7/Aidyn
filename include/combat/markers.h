#include "combat/CombatEntity.h"
#include "n64Borg.h"

vec3f sMarkerTempV3A,sMarkerTempV3B,sMarkerTempV3C,sMarkerTempV3D;

struct CombatMarker {
    SceneData* borg;
    vec3f coords;
    float alpha;
    s32 time;
    u8 active;
    //3 align bytes
};
vec2f CombatMarkerVec2={0,1.0};
CombatMarker* gCombatMarkers=NULL;
Borg9Data* mapmarker_borg9=NULL;

#define MARKERMAX 20

#define CMarkSet 1  //marker is set
#define CMarkYAvg 0x80 //marker fought with map collision

namespace CombatMarkers{
    u8 SetMarker(Borg9Data *mapDat,vec3f *pos,float radius,u16 iter);
    u8 Init();
    void Create(CombatEntity *param_1);
    s8 SetCount(float range);
    Gfx * RenderMarkers(Gfx *G,u16 delta);
    void Tick(CombatMarker *param_1,u16 delta);
    Gfx * RenderMarker(Gfx *param_1,CombatMarker *param_2);
    void Free(void);
};