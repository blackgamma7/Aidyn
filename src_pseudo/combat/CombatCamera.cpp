#include "combat/CombatCamera.h"
#include "combat/CombatStruct.h"
#include "globals.h"

void set_camera_playerdata_focus(playerData *param_1,playerData *param_2) {
  camera_PlayerData_A = param_1;
  camera_PlayerData_B = param_2;
  camera_PlayerData_flag = true;
}

void clear_camera_playerdata_focus(void) {
  camera_PlayerData_B = NULL;
  camera_PlayerData_A = NULL;
  camera_PlayerData_flag = false;
}


void camera_collision_far(vec3f *a,vec3f *b) {
  vec3f temp;
  a->y +=1.5;
  Vec3_sub(&temp,a,b);
  vec3_normalize(&temp);
  multiVec3(&temp,4.0);
  vec3_sum(a,a,&temp);
}

void combat_camera_func(Camera_struct *param_1,Borg9Data *param_2) {
  bool bVar1;
  float fVar2;
  vec3f fStack208;
  vec3f fStack144;
  vec3f fStack80;
  
  fStack144.x = (param_1->pos).x;
  fStack144.z = (param_1->pos).z;
  fStack144.y = (param_1->pos).y + 2.0f;
  fStack80.y = (param_1->pos).y - 2.0f;
  if (combatCameraFlag2) combatCameraFlag2--;
  fStack80.x = fStack144.x;
  fStack80.z = fStack144.z;
  bVar1 = CheckCollision(param_2,&fStack144,&fStack80,0.5,&fStack208,NULL,1);
  if (!bVar1){
    if (combatCameraFlag2 == 0) {
      return;
    }
    if (!bVar1){
      if (combatCameraFlag2 != 0) {
        fStack208.y = FLOAT_800f1de0;
      }
    }
  }
  if ((param_1->pos).y - fStack208.y < 1.0f) {
    (param_1->pos).y = (param_1->posTarget).y = (fStack208.y +1.0f);
  }
  if (bVar1) {
    combatCameraFlag2 = 10;
    FLOAT_800f1de0 = fStack208.y;
  }
  else combatCameraFlag2 = 0;
}

void calc_camera_playerdata_focus(Camera_struct *camera,float param_2) {
  float fVar1;
  float fVar2;
  vec3f ActorAPos;
  vec3f ActorBPos;
  vec3f local_120;
  vec3f local_e0;
  vec3f local_a0;
  vec3f local_60;
  
  ActorAPos.x = (camera_PlayerData_A->collision).pos.x;
  ActorAPos.y = (camera_PlayerData_A->collision).pos.y;
  ActorAPos.z = (camera_PlayerData_A->collision).pos.z;
  ActorBPos.x = (camera_PlayerData_B->collision).pos.x;
  ActorBPos.y = (camera_PlayerData_B->collision).pos.y;
  ActorBPos.z = (camera_PlayerData_B->collision).pos.z;
  if (camera_PlayerData_flag == 1) {
    camera_PlayerData_flag = 2;
    if (camera_PlayerData_A->ID == camera_PlayerData_B->ID) ActorAPos.x -= 1.0f;
    if (5.0f < vec3_proximity(&ActorAPos,&ActorBPos)) {
      camera_collision_far(&ActorAPos,&ActorBPos);
    }
    else {
      Vec3_sub(&local_120,&ActorAPos,&ActorBPos);
      fVar1 = vec3_normalize(&local_120);
      local_e0.x = local_120.x;
      local_e0.y = local_120.y;
      local_e0.z = local_120.z;
      multiVec3(&local_e0,fVar1 * 0.5f);
      local_e0.y = local_e0.y + param_2;
      vec3_sum(&ActorBPos,&ActorBPos,&local_e0);
      multiVec3(&local_120,6.0);
      fVar1 = 2.0f;
      setVec3(&local_a0,ActorBPos.x + local_120.z,ActorBPos.y + 2.0f,
              ActorBPos.z - local_120.x);
      setVec3(&local_60,ActorBPos.x - local_120.z,ActorBPos.y + fVar1,ActorBPos.z + local_120.x);
      fVar1 = vec3_proximity(&camera->pos,&local_a0);
      fVar2 = vec3_proximity(&camera->pos,&local_60);
      ActorAPos.x = local_a0.x;
      ActorAPos.y = local_a0.y;
      ActorAPos.z = local_a0.z;
      if (fVar2 <= fVar1) {
        ActorAPos.x = local_60.x;
        ActorAPos.y = local_60.y;
        ActorAPos.z = local_60.z;
      }
    }
    if (15.0f < vec3_proximity(&ActorAPos,&camera->pos)) Camera::SetPos(camera,&ActorAPos);
    else {
      (camera->posTarget).x = ActorAPos.x;
      (camera->posTarget).y = ActorAPos.y;
      (camera->posTarget).z = ActorAPos.z;
    }
    (camera->aimTarget).x = ActorBPos.x;
    (camera->aimTarget).y = ActorBPos.y;
    (camera->aimTarget).z = ActorBPos.z;
  }
  combat_camera_func(camera,gGlobals.Sub.borg9DatPointer);
  Camera::Lerp(&camera->pos,&camera->posTarget,8.0f);
  Camera::Lerp(&camera->aim,&camera->aimTarget,4.0f);
  Camera::Orient(camera);
}


u32 FUN_80096e58(PlayerHandler *param_1,playerData *param_2,vec3f *pos) {
  u32 ret = false;
  float min=10000.0f;
  for(u16 i=0;i<param_1->max_player;i++){
    playerData* pDat=&param_1->playerDats[i];
    if((pDat->removeFlag)&&(!pDat->visible_flag)){
        float dist=vec3_proximity(&param_2->collision.pos,&pDat->collision.pos);
        if(dist<min){
            pos->x=pDat->collision.pos.x;
            pos->y=pDat->collision.pos.y;
            pos->z=pDat->collision.pos.z;
            min=dist;
            ret=true;
        }
    }
  }
  return ret;
}

void FUN_80096f4c(PlayerHandler *param_1,playerData *param_2,vec3f *param_3,Camera_struct *param_4,s16 param_5) {
  vec3f avStack_d8;
  vec2f avStack_98;
  vec3f avStack_58;
  
  if (param_5) Camera::SetAim(param_4,&param_1->playerDats[param_1->cameraFocus].collision.pos);
  Vec3_sub(&avStack_d8,&(param_2->collision).pos,param_3);
  setVec2(&avStack_98,avStack_d8.x,avStack_d8.z);
  vec2_normalize(&avStack_98);
  avStack_58.x = (param_2->collision).pos.x + avStack_98.x * 8.0f;
  avStack_58.y = (param_2->collision).pos.y + 1.5;
  avStack_58.z = (param_2->collision).pos.z + avStack_98.y * 8.0f;
  if(param_5) Camera::SetPos(param_4,&avStack_58);
  else{
    (param_4->posTarget).x = avStack_58.x;
    (param_4->posTarget).y = avStack_58.y;
    (param_4->posTarget).z = avStack_58.z;
  }
}


void processCombatCamera(PlayerHandler *param_1) {
  short sVar1;
  Camera_struct *cam;
  playerData *ppVar2;
  bool bVar3;
  u32 uVar4;
  playerData *ppVar5;
  u16 uVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  vec3f avStack_238 [5];
  vec3f avStack_1f8 [5];
  vec3f fStack440;
  vec3f avStack_178 [5];
  vec3f avStack_138 [5];
  vec2f afStack248;
  vec2f afStack184;
  vec2f fStack120;
  
  cam = param_1->camera;
  Camera::SetMode(cam,4);
  if (gCameraCombatStartFlag != 0) {
    ppVar5 = gGlobals.playerDataArray[gCombatP->current_Ent->index];
    if (ppVar5->visible_flag == 0) {
      ppVar5 = gGlobals.playerDataArray[gCombatP->combatEnts->index];
    }
    if (FUN_80096e58(param_1,ppVar5,avStack_238)) FUN_80096f4c(param_1,ppVar5,avStack_238,cam,1);
    gCameraCombatStartFlag = 0;
    SHORT_800f1de4 = -1;
  }
  if (camera_PlayerData_flag == 0) {
    if (param_1->cameraFocus != -1) {
      bVar3 = false;
      ppVar5 = gGlobals.playerDataArray[gCombatP->current_Ent->index];
      if ((ppVar5 != NULL) && (bVar3 = ppVar5->visible_flag == 0, ppVar5->visible_flag != 0)) {
        if ((SHORT_800f1de4 == -1) ||
           (SHORT_800f1de4 != ppVar5->ID)) {
          SHORT_800f1de4 = (short)ppVar5->ID;
          if (FUN_80096e58(param_1,ppVar5,avStack_1f8)) {
            FUN_80096f4c(param_1,ppVar5,avStack_1f8,cam,0);
          }
        }
      }
      sVar1 = param_1->cameraFocus;
      ppVar2 = param_1->playerDats;
      fStack440.x = ppVar2[sVar1].collision.pos.x;
      fStack440.y = ppVar2[sVar1].collision.pos.y;
      fStack440.z = ppVar2[sVar1].collision.pos.z;
      avStack_178[0].x = (cam->posTarget).x;
      avStack_178[0].y = (cam->posTarget).y;
      avStack_178[0].z = (cam->posTarget).z;
      uVar6 = 1;
      if ((gGlobals.combatBytes[0] == 0x12) ||
         (fVar7 = 4.0f, fVar9 = 10.0f, gGlobals.combatBytes[0] == 0xb)) {
        fStack440.x = (gCombatP->SpellMarkerPos).x;
        fStack440.z = (gCombatP->SpellMarkerPos).y;
        bVar3 = false;
        fVar7 = 8.0f;
        fVar9 = 16.0f;
      }
      if ((gGlobals.combatBytes[0] == 9) &&
         (vec3_proximity(&fStack440,&(ppVar5->collision).pos)>=5.0f)) {
        uVar6 = 0;
        bVar3 = false;
        (cam->posTarget).x = (ppVar5->collision).pos.x;
        (cam->posTarget).y = (ppVar5->collision).pos.y;
        (cam->posTarget).z = (ppVar5->collision).pos.z;
        camera_collision_far(&cam->posTarget,&fStack440);
      }
      avStack_138[0].x = param_1->playerDats[param_1->cameraFocus].facing.x;
      avStack_138[0].y = 0.0;
      avStack_138[0].z = param_1->playerDats[param_1->cameraFocus].facing.y;
      Camera::Mode1(cam,&fStack440,avStack_138,gGlobals.delta,fVar7,fVar9,
                    0.5f,8.0f,2.0f,8.0f,16.0f,32.0f,1.0f,0.5f,0,uVar6);
      combat_camera_func(cam,gGlobals.Sub.borg9DatPointer);
      if (bVar3) {
        setVec2(&afStack184,(cam->aim).x,(cam->aim).z);
        setVec2(&fStack120,avStack_178[0].x,avStack_178[0].z);
        Vec2_Sub(&afStack248,&fStack120,&afStack184);
        fVar7 = vec2_normalize(&afStack248);
        if (fVar7 < 4.0f) {
          multiVec2(&afStack248,4.0f);
          vec2_sum(&fStack120,&afStack184,&afStack248);
          setVec3(avStack_178,fStack120.x,avStack_178[0].y,fStack120.y);
        }
        Camera::SetPos(cam,avStack_178);
        combat_camera_func(cam,gGlobals.Sub.borg9DatPointer);
        Camera::Orient(cam);
      }
    }
  }
  else {
    sVar1 = param_1->cameraFocus;
    ppVar5 = param_1->playerDats;
    calc_camera_playerdata_focus(cam,gEntityDB->GetHeightMinPoint2(ppVar5[sVar1].ent_ID) - ppVar5[sVar1].scaleRad);
  }
}