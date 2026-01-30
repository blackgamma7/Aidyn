#include "combat/CombatStruct.h"
#include "combat/SpellMarker.h"
#include "globals.h"

namespace CombatSpellMarker{
  Gfx * Render(Gfx *g,SceneData *scene,vec3f *rotate,vec3f *pos,vec3f *scale,u8 alpha,u32 col){
  
    Scene::MatrixARotate(scene,rotate->x,rotate->y,rotate->z);
    Scene::MatrixASetPos(scene,pos->x,pos->y,pos->z);
    Scene::MatrixANormalizeScale(scene,scale->x,scale->y,scale->z);
    SetSceneColors(scene,alpha,0,col);
    return BorgAnimDrawScene(g,scene);
  }
  void Init(void){
    gCombatSpellMarker = NULL;
    CombatCurrentEnt_Y = 0.0;
    if (((gCombatP) && (gCombatP->current_Ent)) && (gGlobals.combatActors[gCombatP->current_Ent->index])) 
      CombatCurrentEnt_Y = (gGlobals.combatActors[gCombatP->current_Ent->index]->collision).pos.y;
  }
  void Free(void){
    if (gCombatSpellMarker) FREEQSCENE(gCombatSpellMarker);
  }
  Gfx * Tick(Gfx *g,u8 delta,u8 range,u32 col){
    vec3f posA,posB,outPos,scale,rotate;
  
    if (!gCombatSpellMarker) gCombatSpellMarker = load_borg_5_func(BORG5_SpellMarker);
    Vec3Set(&posA,(gCombatP->SpellMarkerPos).x,50.0,(gCombatP->SpellMarkerPos).y);
    Vec3Set(&posB,(gCombatP->SpellMarkerPos).x,-10.0,(gCombatP->SpellMarkerPos).y);
    if (!CheckCollision(&(MAPCENTER.mapPointer)->dat,&posA,&posB,1.0,&outPos,NULL,0))
      Vec3Set(&outPos,(gCombatP->SpellMarkerPos).x,CombatCurrentEnt_Y,(gCombatP->SpellMarkerPos).y);
    CLEAR(&scale);
    scale.y = 2.0f;
    scale.x = range + 0.2f;
    scale.z = range + 0.2f;
    CLEAR(&rotate);
    g = Render(g,gCombatSpellMarker,&rotate,&outPos,&scale,0x40,col);
    CombatCurrentEnt_Y = outPos.y;
    return g;
  }
}