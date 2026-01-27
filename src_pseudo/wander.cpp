#define FILENAME "./src/wander.cpp"
#include "game.h"
#include "voxelChart.h"

u16 enemyHostileFlag=true; //enemies will not start battle is set false.

float sneak_value(float point8){
  if (PARTY) {
    s8 index = PARTY->GetMostSkilledMember(SKILL_Stealth);
    if ((index != -1) && (PARTY->Members[index])) {
      index = PARTY->Members[index]->Skills->getModdedSkill(SKILL_Stealth);
      float fVar3 =MIN((f32)index / 10.0f,1.0);
      return 1.0f - fVar3 * point8;
    }
  }
  return 0.0;
}


Wanderer * findWandererFromPlayerName(s16 arg0){
  Wanderer *pwVar2;
  char acStack72 [72];
  
  if (0 < gGlobals.wander.wanderersmax) {
    for(u16 uVar3=0;uVar3 < gGlobals.wander.wanderersmax;uVar3++){
      pwVar2 = &gGlobals.wander.wanderSubstructs[uVar3];
      if ((pwVar2->isActive) && (pwVar2->playerDat)&& (pwVar2->playerDat->ID == arg0))
            return pwVar2;
      }
    }
  sprintf(acStack72,"Wanderer Not Found\nPlayerName: %d\n",arg0);
  CRASH("FindWandererFromPlayerName",acStack72);
}

void Ofunc_800124b4(playerData **param_1,vec3f *param_2){
  vec2f temp;
  Vec3Copy(&((*param_1)->collision).pos,param_2);
  MapCellOffset((*param_1)->zoneDatByte,&temp);
  param_2->x+= temp.x;
  param_2->z+= temp.y;
}

void WanderHead(WanderManager *wander,s16 size){

  wander->initalized = 1;
  wander->wanderersmax = size;
  ALLOCS(wander->wanderSubstructs,size*sizeof(Wanderer),170);
  memset(wander->wanderSubstructs,0,wander->wanderersmax*sizeof(Wanderer));

  if (0 < wander->wanderersmax) {
    for(s16 i=0;i<wander->wanderersmax;i++) {
      wander->wandererIndicies[i]=i;
      wander->wanderSubstructs[i].index=i;
    }
  }
  wander->wanderers = 0;
}

void FreeWanderHead(WanderManager *param_1){
  param_1->initalized = 0;
  FreeAllWanderers(param_1);
  HFREE(param_1->wanderSubstructs,212);
}


void look_for_monsterparties(WanderManager *param_1,Borg9Data *param_2,s32 param_3,byte param_4){
  if (((gGlobals.screenFadeModeSwitch != 0xc) && (gGlobals.gameVars.gamemodeType != GameMode_Title)) &&
     (param_2->voxelObjCount != 0)) {
    for (s16 i=0;i < param_2->voxelObjCount;i++) {
      if ((param_2->voxelObjs[i].header.type == VOXEL_MonsterParty) &&
         ((param_2->voxelObjs[i].header.Bitfeild & VOXEL_Active))) {
        if (!some_monsterparty_checker(i,gGlobals.gameVars.mapDatA,gGlobals.gameVars.mapShort1,gGlobals.gameVars.mapShort2,param_4,VOXEL_MonsterParty)) {
          AllocWanderer(param_1,i,param_3,param_4);
        }
      }
    }
  }

}

void AllocWanderer(WanderManager *param_1,s16 param_2,s32 param_3,u8 param_4){
  Borg9Data *map = GetCollisionZone(param_4);
  voxelObject *vox = &map->voxelObjs[param_2];
  if (!map) CRASH("AllocWanderer","Invalid Collision Zone"); //bug(?) checks for null ptr after reference?
  if (param_1->wanderers >= param_1->wanderersmax) CRASH("AllocWanderer","Too Many wanderers already allocated");
  Wanderer *wEntry = &param_1->wanderSubstructs[param_1->wandererIndicies[param_1->wanderers++]];
  CLEAR(wEntry);
  wEntry->index = wEntry->index;
  (vox->monster).wandererIndex = wEntry->index;
  wEntry->isActive = 1;
  wEntry->VoxelIndex = param_2;
  wEntry->NoBorg13 = 1;
  if ((vox->monster).borg_13) wEntry->NoBorg13 = 0;
  wEntry->MapTally = param_3;
  wEntry->playerDat = Actor::AllocPlayer(gEntityDB->GetCollideRadius((vox->monster).entityID),
    wEntry->start_position.x,0.0,wEntry->start_position.y,
    gEntityDB->GetBorg7((vox->monster).entityID));
  wEntry->playerDat->zoneDatByte = param_4;
  wEntry->playerDat->ent_ID = (vox->monster).entityID;
  (wEntry->playerDat->collision).flags |= CSPHERE_NoTriggers;
  float scale = gEntityDB->GetScale((vox->monster).entityID);
  wEntry->playerDat->scale = scale;
  wEntry->playerDat->scaleRad = scale * (wEntry->playerDat->collision).radius;
  wEntry->playerDat->Ent_index = GETINDEX((vox->monster).entityID);
  if ((vox->monster).borg_13 == 0) 
    wEntry->playerDat->rangerWarrior = PARTY->SetWandererVal(*(u8 *)((int)&(vox->monster).maxsize + 1));
  WanderGetNextNode(param_1,wEntry,(vox->monster).wanderNode);
  (wEntry->position).x = (vox->header).pos.x;
  (wEntry->position).y = (vox->header).pos.z;
  wEntry->size = (vox->header).size;
  (wEntry->playerDat->collision).pos.x = (vox->header).pos.x;
  (wEntry->playerDat->collision).pos.z = (wEntry->position).y;
  Actor::CheckCollision(wEntry->playerDat,(vox->header).pos.y,1,0);
  if (((wEntry->homenode ^ 1) & 1) != 0) CRASH("AllocWanderer","Home Node not WANDER_MOVE\n");
  FUN_80012d44(wEntry);
}

void  FreeWanderer(WanderManager *param_1,Wanderer *param_2){
  if (param_2->playerDat) {
    Actor::FreePlayer(param_2->playerDat);
    param_2->playerDat = NULL;
  }
  param_2->isActive = 0;
  param_1->wandererIndicies[--param_1->wanderers]= param_2->index;
}

void FreeWandererFromZone(WanderManager *param_1,int param_2){
  if (0 < param_1->wanderersmax) {
    for(s16 i=0;i<param_1->wanderersmax;i++) {
      Wanderer* w = &param_1->wanderSubstructs[i];
      if ((w->isActive) && (w->MapTally == param_2))
        FreeWanderer(param_1,w);
    }
  }
}

void FreeAllWanderers(WanderManager *param_1){
  if (0 < param_1->wanderersmax) {
    for(s16 i=0;i<param_1->wanderersmax;i++) {
      Wanderer* w = &param_1->wanderSubstructs[i];
      if (w->isActive) FreeWanderer(param_1,w);
    }
  }
}

playerData * FUN_80012b44(WanderManager *param_1,Wanderer *param_2){
  playerData *ppVar1 = param_2->playerDat;
  param_2->playerDat = NULL;
  FreeWanderer(param_1,param_2);
  return ppVar1;
}

void WanderGetNextNode(WanderManager *param_1,Wanderer *param_2,s16 param_3){
  Borg9Data *map = GetCollisionZone(param_2->playerDat->zoneDatByte);
  (param_2->start_position).x = map->voxelObjs[param_3].wander.startCoords.x;
  (param_2->start_position).y = map->voxelObjs[param_3].wander.startCoords.y;
  param_2->wanderRadius = map->voxelObjs[param_3].wander.wanderRadius;
  param_2->randVal = map->voxelObjs[param_3].wander.randVal;
  param_2->nodeswapChance = map->voxelObjs[param_3].wander.NodeChangeChance;
  param_2->timer = map->voxelObjs[param_3].wander.Timer;
  *(u32 *)&param_2->noderelA = *(u32 *)map->voxelObjs[param_3].wander.NodeSiblings;
  (param_2->start_position).x = map->voxelObjs[param_3].header.pos.x;
  (param_2->start_position).y = map->voxelObjs[param_3].header.pos.z;
  if ((param_2->homenode & 2)) {
    vec2f pos2d={(param_2->playerDat->collision).pos.x,(param_2->playerDat->collision).pos.z};
    Vec2Sub(&param_2->start_position,&pos2d,&param_2->start_position);
    Vec2Normalize(&param_2->start_position);
  }
}

void FUN_80012c58(WanderManager *param_1,Wanderer *param_2){
  u16 uVar1 = param_2->noderelA;
  if (RAND.GetFloat0ToX(1.0) < param_2->nodeswapChance) uVar1 = param_2->noderelB;
  WanderGetNextNode(param_1,param_2,uVar1);
  if ((param_2->homenode & 1)) {
    float rot = RAND.GetFloat0ToX(6.283186);
    float len = RAND.GetFloat0ToX(param_2->randVal);
    (param_2->start_position).x += __sinf(rot) * len;
    (param_2->start_position).y += __cosf(rot) * len;
  }
}

void FUN_80012d44(Wanderer *param_1){
  Borg9Data *pBVar2 = GetCollisionZone(param_1->playerDat->zoneDatByte);
  param_1->flags &=~1;
  if ((param_1->homenode & 1)) {
    vec2f fStack80={(param_1->playerDat->collision).pos.x,(param_1->playerDat->collision).pos.z};
    if (Vec2Dist(&fStack80,&param_1->start_position) > param_1->wanderRadius)
      Actor::SetAiDest(param_1->playerDat,(param_1->start_position).x,(param_1->start_position).y,
               param_1->wanderRadius,(pBVar2->voxelObjs[param_1->VoxelIndex].wander.nodeflags & 2));
  }
  if ((param_1->homenode & 2)) 
    Actor::SetFacing(param_1->playerDat,(param_1->start_position).x,(param_1->start_position).y);
}

void WanderSubstruct_setFlag1(Wanderer *param_1){param_1->flags |= 1;}

void WanderTick(WanderManager *param_1,s16 delta){
  byte bVar1;
  playerData *ppVar2;
  bool bVar3;
  double dVar4;
  bool bVar7;
  BaseWidget *pBVar5;
  s16 sVar6;
  vec3f *from;
  float sneakval;
  float perception;
  float playerProx;
  float perceptionProx;
  float fVar14;
  double dVar10;
  float fVar15;
  vec2f fStack488;
  vec2f afStack424;
  vec3f afStack360;
  vec3f playerPos;
  vec3f fStack232;
  vec3f fStack168;
  playerData *playerDat_ = gPlayer;
  sneakval = sneak_value(0.8f);
  bVar3 = false;
  if ((((gGlobals.screenFadeMode == 0) && (!isPaused())) &&
      (gGlobals.playerCharStruct.unkState == 3)) &&
     ((!WHANDLE->GetTail() && (0 < param_1->wanderersmax)))) {
    for(s16 i = 0;i<param_1->wanderersmax;i++) {
      Wanderer *wanderer = &param_1->wanderSubstructs[i];
      if (wanderer->isActive) {
        Borg9Data *borgDat = GetCollisionZone(wanderer->playerDat->zoneDatByte);
        voxelObject *pmVar8 = &borgDat->voxelObjs[wanderer->VoxelIndex];
        perception = gEntityDB->GetPerception((pmVar8->monster).entityID);
        Vec3Copy(&(playerDat_->collision).pos,&playerPos);
        if (wanderer->playerDat->zoneDatByte != ZoneCenter)
        Actor::SubPosOnLoadedMap(wanderer->playerDat->zoneDatByte,&playerPos);
        wanderer->timer-= delta;
        Actor::GetPosOnLoadedMap(wanderer->playerDat,&afStack360);
        playerProx = Vec3Dist(&afStack360,&(playerDat_->collision).pos);
        afStack360.x -=(((wanderer->playerDat->facing).x * perception) * 0.3);
        afStack360.z -=(((wanderer->playerDat->facing).y * perception) * 0.3);
        perceptionProx = Vec3Dist(&afStack360,&(playerDat_->collision).pos);
        Vec2Set(&fStack488,(wanderer->playerDat->collision).pos.x,
                (wanderer->playerDat->collision).pos.z);
        float fVar13 = Vec2Dist(&wanderer->position,&fStack488);
        Vec2Copy(&wanderer->position,&afStack424);
        Actor::AddPosOnLoadedMap(wanderer->playerDat->zoneDatByte,&afStack424);
        Vec2Set(&fStack488,(playerDat_->collision).pos.x,(playerDat_->collision).pos.z);
        fVar14 = Vec2Dist(&wanderer->position,&fStack488);
        if (perceptionProx <= perception + perception) {
          if (!wanderer->perceptionsSet) {
            fVar15 = perception * (1.0 -gGlobals.gameVars.weather.fogTime * 0.75);
            wanderer->perceptionsSet = true;
            wanderer->precepWalk = fVar15;
            wanderer->percepMax = (fVar15 *2);
            wanderer->perecpRun = (fVar15 * 1.5);
            wanderer->percepSneak = (fVar15 * 0.6) * sneakval;
            wanderer->percepDefault = (fVar15 * 0.55) * sneakval;
          }
        }
        if (perceptionProx < wanderer->percepMax) {
          if ((wanderer->size <= fVar13) && (wanderer->size <= fVar14)) {
            goto LAB_80013180;
          }
LAB_80013188:
          if (perception + perception <= perceptionProx) {
            if (wanderer->perceptionsSet) {
              goto LAB_800131a8;
            }
          }
        }
        else {
LAB_80013180:
          if (!wanderer->field19_0x3e) goto LAB_80013188;
LAB_800131a8:
          if ((wanderer->size <= fVar13)&&(wanderer->size<=fVar14)) {
            Actor::ResetMoveQueue(wanderer->playerDat);
            wanderer->timer = 300;
            wanderer->homenode|= 4;
LAB_800131f8:
          }
          else {
LAB_800131e8:
            if (wanderer->field19_0x3e) {
              FUN_80012d44(wanderer);
              goto LAB_800131f8;
            }
          }
          wanderer->perceptionsSet = false;
          if ((wanderer->percepMax <= perceptionProx) || (wanderer->size + 2.0f <= fVar13)) {
            wanderer->field19_0x3e = false;
          }
        }
        if (wanderer->NoBorg13 == 0) {
LAB_80013318:
          if (playerProx < 3.0f) {
            ppVar2 = wanderer->playerDat;
            ppVar2->ani_type = 0;
            Actor::SetFacing(ppVar2,(ppVar2->collision).pos.x - playerPos.x,(ppVar2->collision).pos.z - playerPos.z);
          }
        }
        else {
          if (fVar13 <= wanderer->size) {
            if (((wanderer->flags ^ 1) & 1)) {
              switch(playerDat_->ani_type){
                case AniType_Run:
                 if (wanderer->perecpRun >= perceptionProx){
                  gGlobals.EncounterDat.aniByte=EncountAni_Run;
                  bVar3=true;
                 }
                 break;
                case AniType_Walk:
                 if (wanderer->precepWalk >= perceptionProx){
                  gGlobals.EncounterDat.aniByte=EncountAni_Walk;
                  bVar3=true;
                 }
                 break;
                case 4:
                default:
                 if (wanderer->percepDefault >= perceptionProx){
                  gGlobals.EncounterDat.aniByte=EncountAni_Default;
                  bVar3=true;
                 }
                 break;
                case AniType_Sneak:
                 if (wanderer->percepSneak >= perceptionProx){
                  gGlobals.EncounterDat.aniByte=EncountAni_Sneak;
                  bVar3=true;
                 }
                 break;
              }
            }
          }
          if (wanderer->NoBorg13 == 0) goto LAB_80013318;
        }
        if (!bVar3){
          if (!wanderer->field19_0x3e) {
            if (((wanderer->playerDat->flags & (ACTOR_CANMOVE|ACTOR_CANROTATE|ACTOR_40)) == 0) &&
               ((s16)wanderer->timer < 1)) {
              if (!(wanderer->homenode & 4)) {
                FUN_80012c58(param_1,wanderer);
                FUN_80012d44(wanderer);
              }
              else {
                wanderer->homenode&=~4;
                FUN_80012d44(wanderer);
              }
            }
            continue;
          }
        }
        wanderer->field19_0x3e = true;
        if (wanderer->NoBorg13 == 1) {
          Actor::SetAiDest(wanderer->playerDat,playerPos.x,playerPos.z,2.0,0);
          if (((playerProx < 7.0f) && (enemyHostileFlag)) &&
             ((pmVar8->monster).borg_13 == 0)) {
            fStack232.x = (wanderer->playerDat->collision).pos.x;
            fStack232.z = (wanderer->playerDat->collision).pos.z;
            fStack232.y = (wanderer->playerDat->collision).pos.y + 1.0f;
            fStack168.y = playerPos.y + 1.0f;
            fStack168.x = playerPos.x;
            fStack168.z = playerPos.z;
            perception = fStack232.y - fStack168.y;
            if (((0.0 < perception)&&(perception < 3.0f))||(-perception < 3.0f)){
              if (!CheckCollision(borgDat,&fStack232,&fStack168,0.5,NULL,NULL,0)) {
                gGlobals.EncounterDat.collisionByte = 2;
                battle_setup_func(pmVar8,(pmVar8->header).flagB,wanderer->VoxelIndex);
                wanderer->NoBorg13 = 0;
                FUN_80024c54(2);
              }
            }
          }
        }
        else if (wanderer->NoBorg13 == 2) {
          fStack488.x = playerPos.x - (wanderer->playerDat->collision).pos.x;
          fStack488.y = playerPos.z - (wanderer->playerDat->collision).pos.z;
          Vec2Normalize(&fStack488);
          Vec2Scale(&fStack488,-1.0);
          fStack488.x += (wanderer->playerDat->collision).pos.x;
          fStack488.y += (wanderer->playerDat->collision).pos.z;
          Actor::SetAiDest(wanderer->playerDat,fStack488.x,fStack488.y,1.0,0);
        }
      }
    }
  }
}

