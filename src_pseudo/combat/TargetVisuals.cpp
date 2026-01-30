#include "globals.h"
#include "combat/CombatStruct.h"
#include "combat/Visuals.h"

#define FILENAME "./src/combattargetvisuals.cpp"

struct CombatTargetVisuals_struct{
    CombatTargetVisual* pointer;
    u32 entCount;
};

CombatTargetVisuals_struct gCombatTargetVisuals={0};

void CombatTargetVisuals::Init(void) {
  CLEAR(&gCombatTargetVisuals);
  gCombatTargetVisuals.entCount = gCombatP->EntCount;
  ALLOCS(gCombatTargetVisuals.pointer,gCombatTargetVisuals.entCount*sizeof(CombatTargetVisual),128);
  memset(gCombatTargetVisuals.pointer,0,gCombatTargetVisuals.entCount*sizeof(CombatTargetVisual));
  for (u32 i=0;i<gCombatTargetVisuals.entCount;i++){
    gCombatTargetVisuals.pointer[i].byte0x5=0;
  }
}

#define ThreeDegToRad 0.0523599f
void CombatTargetVisuals::Render(bool param_1,s16 delta) {
  int *piVar7;
  float gray;
  
  if (param_1) {
    piVar7 = NULL;
    if (param_1) piVar7 = gCombatP->substruct2[1].arrayB;
  }
  else piVar7 = gCombatP->substruct2[0].arrayB;
  for(u32 i=0;i<gCombatTargetVisuals.entCount;i++,piVar7++){
      CombatTargetVisual *entry = gCombatTargetVisuals.pointer + i;
      if (*piVar7 == 0) {
        if (entry->byte0x5 == true) {
          entry->byte0x5 = false;
          CombatEntity *cEnt = &gCombatP->combatEnts[i];
          if (((cEnt) && (!cEnt->Flag6())) &&
             (!Entity::isDead(cEnt->charSheetP))) {
            entry->playerdat_ = gGlobals.combatActors[gCombatP->combatEnts[i].index];
            if (entry->playerdat_) FUN_80017388(entry->playerdat_,0.0);
          }
        }
      }
      else {
        if (!entry->byte0x5) {
          entry->byte0x5 = true;
          entry->time = 0;
        }
        if (__sinf((float)entry->time * ThreeDegToRad) < 0.0)
          gray = -__sinf((float)entry->time * ThreeDegToRad);
        else gray = __sinf((float)entry->time * ThreeDegToRad);
        entry->playerdat_ = gGlobals.combatActors[gCombatP->combatEnts[i].index];;
        if (entry->playerdat_) FUN_80017330(entry->playerdat_,1.0,gray,gray,gray);
        entry->time+= delta;
      }
    }
}


void CombatTargetVisuals::Free(void) {
  memset(gCombatTargetVisuals.pointer,0,gCombatTargetVisuals.entCount*sizeof(CombatTargetVisual));
  HFREE(gCombatTargetVisuals.pointer,230);
  CLEAR(&gCombatTargetVisuals);
}

