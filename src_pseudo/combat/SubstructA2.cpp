#include "combat/CombatStruct.h"
#include "globals.h"


//addtional funcs used by CombatStructA in a seperate script.
//I think the 1st arg for each is the battlefield index? goes unused.

u8 get_borg9_floatB_X_ShortA(u8 bf) {
  double dVar1;
  float fVar2;
  
  fVar2 = ((MAPCENTER.mapPointer)->dat).floatsB.x *
          (float)(int)(s16)((MAPCENTER.mapPointer)->dat).shortA;
  dVar1 = (double)fVar2;
  if (fVar2 <= 0.0) {
    return -(u8)(int)(0.5 - dVar1);
  }
  return (u8)(int)(dVar1 + 0.5);
}

u8 get_borg9_floatB_Y_ShortB(u8 bf) {
  double dVar1;
  float fVar2;
  
  fVar2 = ((MAPCENTER.mapPointer)->dat).floatsB.y *
          (float)(int)(s16)((MAPCENTER.mapPointer)->dat).shortB;
  dVar1 = (double)fVar2;
  if (fVar2 <= 0.0) {
    return -(u8)(int)(0.5 - dVar1);
  }
  return (u8)(int)(dVar1 +0.5);
}

void FUN_80067aa0(u8 bf,CombatSubstructA *s,u8 xMax,u8 zMax) {
  vec3f posA;
  vec3f posB;
  vec3f outPos;
  vec3f rot;
  
  for(u8 i=0;i<zMax;i++){
    float z=i+0.5f;
    for(u8 j=0;j<xMax;j++){
      float x = (float)j + 0.5f;
      Vec3Set(&posA,x,100.0,z);
      Vec3Set(&posB,x,-100.0,z);
      Vec3Set(&rot,0.0,1.0,0.0);
      u8* pbVar3 = s->array1[j] + i;
      *pbVar3 = 0x80;
      if (CheckCollision(&(MAPCENTER.mapPointer)->dat,&posA,&posB,0.5f,&outPos,&rot,0))
        *pbVar3 = (u8)(outPos.y*2);
    }
  }
}



