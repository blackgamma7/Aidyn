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
  dat->unk1e = 0;
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


int GetVoxelOffset(Borg9Data *param_1,short param_2,short param_3){
  int iVar1;
  int iVar2;
  
  iVar1 = (int)param_2;
  iVar2 = (int)param_3;
  if ((((-1 < iVar1) && (-1 < iVar2)) && (iVar1 < (int)(uint)param_1->shortA)) &&
     (iVar2 < (int)(uint)param_1->shortB)) {
    return (int)((iVar1 + iVar2 * (uint)param_1->shortA) * 0x10000) >> 0x10;
  }
  CRASH("GetVoxelOffset","Invalid Zone");
}

borg_9_struct * borg9_get_unkStruct(Borg9Data *param_1,short param_2,short param_3){
  int iVar1;
  int iVar2;
  uint uVar3;
  
  iVar2 = (int)param_2;
  iVar1 = (int)param_3;
  if (iVar2 < 0) iVar2 = 0;
  if (iVar1 < 0) iVar1 = 0;
  uVar3 = (uint)param_1->shortA;
  if ((int)uVar3 <= iVar2) {
    iVar2 = (int)((uVar3 - 1) * 0x10000) >> 0x10;
  }
  if ((int)(uint)param_1->shortB <= iVar1) {
    iVar1 = (int)((param_1->shortB - 1) * 0x10000) >> 0x10;
  }
  return param_1->unkStructs + iVar1 * uVar3 + iVar2;
}

