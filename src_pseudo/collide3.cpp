#include "globals.h"


void init_collisionTypeA(collisionTypeA *param_1){
  param_1->unkc = 0.0;
  param_1->unk10 = 0.0;
  param_1->unk8 = 0.0;
  param_1->flag = 0;
  param_1->unk18 = 0;
  param_1->callbackA = NULL;
  param_1->callbackB = NULL;
  param_1->callbackC = NULL;
  param_1->unk0 = 1.0f;
  param_1->unk4 = 1.0f;
}

void set_CollisionTypeB(SpeedProperty *param_1){
  param_1->velScale = 1.0f;
  (param_1->gravity).z = 0.0;
  (param_1->gravity).y = 0.0;
  (param_1->gravity).x = 0.0;
  (param_1->Accel).z = 0.0;
  (param_1->Accel).y = 0.0;
  (param_1->Accel).x = 0.0;
}

void set_collisionSphere(collisionSphere *dat,float r,float px,float py,float pz,float vx,float vy,
                        float vz){
  dat->radius = r;
  (dat->pos).x = px;
  (dat->pos).y = py;
  dat->hits = 0;
  dat->flags = 0;
  (dat->pos).z = pz;
  (dat->vel).x = vx;
  (dat->vel).y = vy;
  (dat->vel).z = vz;
  (dat->polyNormal).z = 0.0;
  (dat->polyNormal).y = 0.0;
  (dat->polyNormal).x = 0.0;
  (dat->unk2c).z = 0.0;
  (dat->unk2c).y = 0.0;
  (dat->unk2c).x = 0.0;
}


s16 GetVoxelOffset(Borg9Data *param_1,s16 param_2,s16 param_3){
  if ((((-1 < param_2) && (-1 < param_3)) && (param_2 < (int)(u32)param_1->shortA)) &&
     (param_3 < (int)(u32)param_1->shortB)) {
    return (param_2 + param_3 * (u32)param_1->shortA);
  }
  CRASH("GetVoxelOffset","Invalid Zone");
}

CollideSection * getCollideSection(Borg9Data *param_1,s16 param_2,s16 param_3){
  s16 iVar2 = (int)param_2;
  s16 iVar1 = (int)param_3;
  FLOOR(iVar2,0);
  FLOOR(iVar1,0);
  if (param_1->shortA <= iVar2) iVar2 = (param_1->shortA - 1);
  if (param_1->shortB <= iVar1) iVar1 = (param_1->shortB - 1);
  return param_1->collideSections + iVar1 * param_1->shortA + iVar2;
}

