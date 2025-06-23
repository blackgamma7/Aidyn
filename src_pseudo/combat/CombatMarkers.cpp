#include "combat/markers.h"
#include "globals.h"

#define FILENAME "./src/combatmarkers.cpp"

u8 CombatMarkers::SetMarker(Borg9Data *mapDat,vec3f *pos,float radius,u16 iter){
  float fVar1;
  float fVar2;
  bool bVar3;
  bool ret;
  float fVar4;
  float fVar5;
  float fVar6;
  
  if (iter == 0) {
    sMarkerTempV3A.x = pos->x;
    sMarkerTempV3A.z = pos->z;
    sMarkerTempV3A.y = 100.0f;
    sMarkerTempV3B.y = -100.0f;
    sMarkerTempV3B.x = sMarkerTempV3A.x;
    sMarkerTempV3B.z = sMarkerTempV3A.z;
  }

  if (CheckCollision(mapDat,&sMarkerTempV3A,&sMarkerTempV3B,radius,&sMarkerTempV3C,&sMarkerTempV3D,(s16)1)) {
    pos->x = sMarkerTempV3C.x + sMarkerTempV3D.x * radius;
    pos->y = (sMarkerTempV3C.y + 0.01 +(sMarkerTempV3D.y * radius));
    pos->z = sMarkerTempV3C.z + sMarkerTempV3D.z * radius;
    ret = true;
    
  }
  else if (iter < 4) {
    fVar4 = RAND.GetFloat0ToX(6.283186);
    fVar5 = RAND.GetFloat0ToX(0.25);
    fVar6 = __sinf(fVar4);
    fVar6 = (fVar6 + 1.0f) * 0.5f * fVar5;
    fVar4 = __cosf(fVar4);
    fVar5 = (fVar4 + 1.0f) * 0.5f * fVar5;
    setVec3(&sMarkerTempV3A,pos->x + fVar6,sMarkerTempV3A.y,pos->z + fVar5);
    setVec3(&sMarkerTempV3B,pos->x + fVar6,sMarkerTempV3B.y,pos->z + fVar5);
    ret = SetMarker(mapDat,pos,radius,iter + 1);
  }
  else ret = false;
  return ret;
}

u8 CombatMarkers::Init(void){
  ALLOCS(gCombatMarkers,sizeof(CombatMarker)*MARKERMAX,0xac);
  for(u32 uVar3 = 0;uVar3<MARKERMAX;uVar3++) {
    CombatMarker *puVar2 = &gCombatMarkers[uVar3];
    puVar2->borg =  load_borg_5_func(BORG5_CombatMarker);
    puVar2->alpha = 0.0;
    puVar2->time = 0;
    puVar2->active = 0;
  }
  mapmarker_borg9 = &(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat;
  return true;
}

void CombatMarkers::Create(CombatEntity *param_1){
  playerData *ppVar1;
  CombatMarker *pCVar2;
  longlong lVar3;
  bool bVar5;
  byte flag;
  CombatMarker *iVar5;
  int iVar7;
  u8 i;
  int iVar9;
  int iVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  vec3f fStack136;
  
  ppVar1 = gGlobals.playerDataArray[param_1->index];
  param_1->SetMovementRange();
  fVar16 = (float)param_1->moveRange + ppVar1->scaleRad;
  if (param_1->aiP != NULL) fVar16 += ppVar1->scaleRad;
  s8 count = SetCount(fVar16);
  lVar3 = count;
  i = 0;
  fVar15 = (360.0f / (float)(int)count) * dtor;
  fVar13 = __cosf(fVar15);
  fVar15 = __sinf(fVar15);
  for (i=0;i<MARKERMAX;i++) {
    if (i < lVar3) {
      fStack136.x = param_1->GetCoord2X() + CombatMarkerVec2.x * fVar16;
      fStack136.z = param_1->GetCoord2Y() + CombatMarkerVec2.y * fVar16;
      if (SetMarker(mapmarker_borg9,&fStack136,0.5f,0)) {
        setVec3(&gCombatMarkers[i].coords,fStack136.x,fStack136.y,fStack136.z);
        flag = CMarkSet;
      }
      else {
        setVec3(&gCombatMarkers[i].coords,fStack136.x,(ppVar1->collision).pos.y,fStack136.z);
        flag = CMarkYAvg;
      }
      pCVar2 = gCombatMarkers;
      gCombatMarkers[i].alpha = 0;
      gCombatMarkers[i].time = 0;
      gCombatMarkers[i].active = flag;
      CombatMarkerVec2.x = fVar13 * CombatMarkerVec2.x - fVar15 * CombatMarkerVec2.y;
      CombatMarkerVec2.y = fVar13 * CombatMarkerVec2.y + fVar15 * CombatMarkerVec2.x;
    }
    else gCombatMarkers[i].active = 0;
  }
  i = 0;
  //this loop is very messy. seems to adjust certain markers' y pos based on adjacent entries'.
  if (0 < lVar3) {
    iVar10 = 0;
    do {
      pCVar2 = gCombatMarkers;
      iVar9 = (int)i;
      iVar10 -= iVar9;
      iVar7 = iVar9 + 1;
      i = iVar7;
      if (gCombatMarkers[(count + -1 + iVar9) % (int)count].active == CMarkYAvg) {
        fVar13 = gCombatMarkers[(count + -1 + iVar9) % (int)count].coords.y;
        fVar16 = gCombatMarkers[(i) % (int)count].coords.y;
        gCombatMarkers[(count + -1 + iVar9) % (int)count].active= true;
        *(float *)((int)pCVar2 + iVar10 * 4 + 8) = fVar13 + (fVar16 - fVar13) * 0.5f;
      }
      iVar10 = iVar7 * 8;
    } while (i < lVar3);
  }
}

s8 CombatMarkers::SetCount(float range){
  s8 ret = 6;
  if ((3.0f < range) && (ret = MARKERMAX, range <= 7.0f)) {
    ret = 0x10;
  }
  return ret;
}

Gfx * CombatMarkers::RenderMarkers(Gfx *G,u16 delta){
  for(u32 i=0;i<MARKERMAX;i++) {
    if (gCombatMarkers[i].active) {
      Tick(&gCombatMarkers[i],delta);
      G = RenderMarker(G,&gCombatMarkers[i]);
    }
  }
  return G;
}
void CombatMarkers::Tick(CombatMarker *param_1,u16 delta){

  if (param_1->alpha < 1.0f) {
    param_1->alpha = 1.0f;
    param_1->time+=delta;
    if (60 < param_1->time) param_1->time = 60;
  }
}


Gfx * CombatMarkers::RenderMarker(Gfx *param_1,CombatMarker *param_2){  
  Scene::MatrixASetPos(param_2->borg,(param_2->coords).x,(param_2->coords).y,(param_2->coords).z);
  SetSceneColors(param_2->borg,(param_2->alpha * 255.0f),1,0x0);
  return BorgAnimDrawScene(param_1,param_2->borg);
}

void CombatMarkers::Free(void){
  for(u32 i=0;i<MARKERMAX;i++){
    FREEQSCENE(gCombatMarkers[i].borg);
    gCombatMarkers[i].borg=NULL;
  }
  CLEAR(gCombatMarkers);
  FREE(gCombatMarkers,394);
}
