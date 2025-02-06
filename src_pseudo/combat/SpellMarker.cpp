#include "combat\CombatStruct.h"
#include "combat\SpellMarker.h"
#include "globals.h"

namespace CombatSpellMarker{
  Gfx * Render(Gfx *g,AnimationData *aniDat,vec3f *rotate,vec3f *pos,vec3f *scale,u8 alpha,Color32 col){
  
    Animation::MatrixARotate(aniDat,rotate->x,rotate->y,rotate->z);
    Animation::MatrixASetPos(aniDat,pos->x,pos->y,pos->z);
    Animation::MatrixANormalizeScale(aniDat,scale->x,scale->y,scale->z);
    set_anidat_colors(aniDat,alpha,'\0',col);
    return BorgAnimDrawScene(g,aniDat);
  }
  void Init(void){
    gCombatSpellMarker = NULL;
    CombatCurrentEnt_Y = 0.0;
    if (((gCombatP) && (gCombatP->current_Ent)) && (gGlobals.playerDataArray[gCombatP->current_Ent->index])) 
      CombatCurrentEnt_Y = (gGlobals.playerDataArray[gCombatP->current_Ent->index]->collision).pos.y;
  }
  void Free(void){
    if (gCombatSpellMarker) FREEQANI(&gCombatSpellMarker);
  }
  Gfx * CombatSpellMarker::Tick(Gfx *g,u8 delta,u8 range,Color32 col){
    vec3f posA,posB,outPos,scale,rotate;
  
    if (!gCombatSpellMarker) gCombatSpellMarker = load_borg_5_func(0x797);
    setVec3(&posA,(gCombatP->SpellMarkerPos).x,50.0,(gCombatP->SpellMarkerPos).y);
    setVec3(&posB,(gCombatP->SpellMarkerPos).x,-10.0,(gCombatP->SpellMarkerPos).y);
    if (!CheckCollision(&(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat,&posA,&posB,1.0,&outPos,NULL,0))
      setVec3(&outPos,(gCombatP->SpellMarkerPos).x,CombatCurrentEnt_Y,(gCombatP->SpellMarkerPos).y);
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