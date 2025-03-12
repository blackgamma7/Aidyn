#define FILENAME "./src/wander.cpp"
#include "globals.h"

float sneak_value(float point8){
  char cVar2;
  float fVar3;
  
  if (PARTY) {
    cVar2 = PARTY->GetMostSkilledMember(SKILL_Stealth);
    if (((cVar2 != -1) && (PARTY->Members[cVar2]) {
      cVar2 = PARTY->Members[cVar2]->Skills->getModdedSkill(SKILL_Stealth);
      fVar3 = (float)(s32)cVar2 / 10.0f;
      if (1.0f < (float)(s32)cVar2 / 10.0f) {fVar3 = 1.0f;}
      return 1.0f - fVar3 * point8;
    }
  }
  return 0.0;
}


wander_substruct * findWandererFromPlayerName(s16 arg0){
  wander_substruct *pwVar2;
  char acStack72 [72];
  
  if (0 < gGlobals.wander.wanderersmax) {
    for(u16 uVar3=0;uVar3 < gGlobals.wander.wanderersmax;uVar3++){
      pwVar2 = &gGlobals.wander.wanderSubstructs[uVar3];
      if ((pwVar2->isActive) && (pwVar2->playerDat)&& (pwVar2->playerDat->ID == arg0))
            return pwVar2;
      }
    }
  sprintf(acStack72,"Wanderer Not Found\nPlayerName: %d\n",arg0));
  CRASH("FindWandererFromPlayerName",acStack72);
}

void Ofunc_800124b4(playerData **param_1,vec3f *param_2){
  vec2f temp;
  copyVec3(&((*param_1)->collision).pos,param_2);
  get_mapcellsize((*param_1)->zoneDatByte,&temp);
  param_2->x+= temp.x;
  param_2->z+= temp.y;
}
//A lot of examples of Ghidra "doing its best" following
void WanderHead(wander_struct *wander,short size){
  wander_substruct *x;
  
  wander->initalized = 1;
  wander->wanderersmax = size;
  ALLOCS(x,size*sizeof(wander_substruct),170);
  wander->wanderSubstructs = x;
  memset(x,0,wander->wanderersmax*sizeof(wander_substruct));

  if (0 < wander->wanderersmax) {
    for(s16 i=0;i<wander->wanderersmax;i++) {
      wander->wandererIndicies[i]=i;
      wander->wanderSubstructs[i].index=i;
    }
  }
  wander->wanderers = 0;
}

void wander_free(wander_struct *param_1){
  param_1->initalized = 0;
  wander_struct_free_sub(param_1);
  HFREE(param_1->wanderSubstructs,212);
}


void look_for_monsterparties(wander_struct *param_1,Borg9data *param_2,s32 param_3,byte param_4){
  if (((gGlobals.screenFadeModeSwitch != 0xc) && (gGlobals.Sub.gamemodeType != 2)) &&
     (param_2->voxelObjCount != 0)) {
    for (s16 i=0;i < param_2->voxelObjCount;i++) {
      if ((param_2->voxelObjs[i].header.type == VOXEL_MonsterParty) &&
         ((param_2->voxelObjs[i].header.Bitfeild & 0x8000))) {
        if (!some_monsterparty_checker((i,gGlobals.Sub.mapDatA,gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2,param_4,VOXEL_MonsterParty)) {
          AllocWanderer(param_1,iVar2,param_3,param_4);
        }
      }
    }
  }

}

void AllocWanderer(wander_struct *param_1,s16 param_2,s32 param_3,u8 param_4){
  short sVar1;
  ItemID IVar2;
  playerData *ppVar3;
  EntityDB *pEVar4;
  Borg9data *pBVar5;
  u32 borg7;
  playerData *pDat;
  byte bVar8;
  u16 uVar7;
  wander_substruct *ppVar10;
  voxelObject *refObj;
  float fVar9;
  float fVar10;
  
  pBVar5 = GetCollisionZone(param_4);
  refObj = &pBVar5->voxelObjs[param_2];
  if (!pBVar5) CRASH("AllocWanderer","Invalid Collision Zone");
  if (param_1->wanderers >= param_1->wanderersmax) CRASH("AllocWanderer","Too Many wanderers already allocated");
    uVar7 = param_1->wanderers++;
    sVar1 = *(short *)((int)param_1->wandererIndicies + ((int)((uint)uVar7 << 0x10) >> 0xf));
    ppVar10 = (wander_substruct *)
              (&param_1->wanderSubstructs->playerDat + sVar1 * 0x14 + (int)sVar1);
    uVar7 = ppVar10->index;
    CLEAR(ppVar10);
    ppVar10->index = uVar7;
    (refObj->monster).wandererIndex = uVar7;
    ppVar10->isActive = 1;
    ppVar10->VoxelIndex = param_2;
    ppVar10->NoBorg13 = 1;
    if ((refObj->monster).borg_13) ppVar10->NoBorg13 = 0;
    ppVar10->MapTally = param_3;
    pDat = Actor::AllocPlayer(gEntityDB->GetFloatC((refObj->monster).entityID),(ppVar10->start_position).x,0.0,(ppVar10->start_position).y,gEntityDB->GetBorg7((refObj->monster).entityID));
    ppVar10->playerDat = pDat;
    IVar2 = (refObj->monster).entityID;
    pDat->zoneDatByte = param_4;
    ppVar3 = ppVar10->playerDat;
    pDat->ent_ID = IVar2;
    (ppVar3->collision).flags |= 0x400;
    fVar9 = gEntityDB->GetScale((refObj->monster).entityID);
    ppVar3 = ppVar10->playerDat;
    fVar10 = (ppVar3->collision).radius;
    ppVar3->interactRadiusA = fVar9;
    ppVar3->interactRadiusB = fVar9 * fVar10;
    bVar8 = GetIDIndex((refObj->monster).entityID);
    ppVar10->playerDat->Ent_index = (short)(char)bVar8;
    if ((refObj->monster).borg_13 == 0) 
      ppVar10->playerDat->rangerWarrior = PARTY->SetWandererVal(*(u8 *)((int)&(refObj->monster).totalsize + 1));
    FUN_80012b70(param_1,ppVar10,(refObj->monster).wanderNode);
    fVar9 = (refObj->header).pos.x;
    ppVar3 = ppVar10->playerDat;
    (ppVar10->position).x = fVar9;
    (ppVar10->position).y = (refObj->header).pos.z;
    ppVar10->size = (refObj->header).size;
    (ppVar3->collision).pos.x = fVar9;
    (ppVar10->playerDat->collision).pos.z = (ppVar10->position).y;
    Actor::CheckCollision(ppVar10->playerDat,(refObj->header).pos.y,1,0);
    if (((ppVar10->homenode ^ 1) & 1) != 0) CRASH("AllocWanderer","Home Node not WANDER_MOVE\n");
    FUN_80012d44(ppVar10);
}

void  FreeWanderer(wander_struct *param_1,wander_substruct *param_2){
  if (param_2->playerDat) {
    FreePlayer(param_2->playerDat);
    param_2->playerDat = NULL;
  }
  param_2->isActive = 0;
  param_1->wandererIndicies[--param_1->wanderers]= param_2->index;
}

void FreeWandererFromZone(wander_struct *param_1,int param_2){
  if (0 < param_1->wanderersmax) {
    for(s16 i=0;i<param_1->wanderersmax;i++) {
      wander_substruct* w = &param_1->wanderSubstructs[i];
      if ((w->isActive) && (w->MapTally == param_2))
        FreeWanderer(param_1,w);
    }
  }
}

void FreeAllWanderers(wander_struct *param_1){
  if (0 < param_1->wanderersmax) {
    for(s16 i=0;i<param_1->wanderersmax;i++) {
      wander_substruct* w = &param_1->wanderSubstructs[i];
      if (w->isActive) FreeWanderer(param_1,w);
    }
  }
}

playerData * FUN_80012b44(wander_struct *param_1,wander_substruct *param_2){
  playerData *ppVar1 = param_2->playerDat;
  param_2->playerDat = NULL;
  FreeWanderer(param_1,param_2);
  return ppVar1;
}

void FUN_80012b70(wander_struct *param_1,wander_substruct *param_2,short param_3){
  u16 uVar1;
  Borg9data *pBVar2;
  voxelObject *pVVar3;
  vec2f *res;
  vec2f fStack80;
  voxelObject *pVVar2;
  voxelObject *prVar2;
  
  pBVar2 = GetCollisionZone(param_2->playerDat->zoneDatByte);
  prVar2 = pBVar2->voxelObjs;
  (param_2->start_position).x = prVar2[param_3].wander.startCoords.x;
  (param_2->start_position).y = prVar2[param_3].wander.startCoords.y;
  param_2->wanderRadius = prVar2[param_3].wander.wanderRadius;
  param_2->randVal = prVar2[param_3].wander.randVal;
  param_2->nodeswapChance = prVar2[param_3].wander.NodeChangeChance;
  param_2->timer = prVar2[param_3].wander.Timer;
  *(undefined4 *)&param_2->noderelA = *(undefined4 *)prVar2[param_3].wander.NodeSiblings;
  pVVar2 = pBVar2->voxelObjs;
  (param_2->start_position).x = pVVar2[param_3].header.pos.x;
  (param_2->start_position).y = pVVar2[param_3].header.pos.z;
  if ((param_2->homenode & 2)) {
    res = &param_2->start_position;
    fStack80.x = (param_2->playerDat->collision).pos.x;
    fStack80.y = (param_2->playerDat->collision).pos.z;
    Vec2_Sub(res,&fStack80,res);
    vec2_normalize(res);
  }
}

void FUN_80012c58(wander_struct *param_1,wander_substruct *param_2){
  u16 uVar1;
  float rot;
  float len;
  
  uVar1 = param_2->noderelA;
  if (RAND.GetFloat0ToX(1.0) < param_2->nodeswapChance) uVar1 = param_2->noderelB;
  FUN_80012b70(param_1,param_2,uVar1);
  if ((param_2->homenode & 1)) {
    rot = RAND.GetFloat0ToX(6.283186);
    len = RAND.GetFloat0ToX(param_2->randVal);
    (param_2->start_position).x += __sinf(rot) * len;
    (param_2->start_position).y += __cosf(rot) * len;
  }
}



void FUN_80012d44(wander_substruct *param_1){
  u16 uVar1;
  Borg9data *pBVar2;
  vec2f fStack80;
  voxelObject *pVVar2;
  
  pBVar2 = GetCollisionZone(param_1->playerDat->zoneDatByte);
  uVar1 = param_1->VoxelIndex;
  param_1->flags &=~1;
  pVVar2 = pBVar2->voxelObjs;
  if ((param_1->homenode & 1)) {
    fStack80.x = (param_1->playerDat->collision).pos.x;
    fStack80.y = (param_1->playerDat->collision).pos.z;
    if (vec2_proximity(&fStack80,&param_1->start_position) > param_1->wanderRadius)
      Actor::SetAiDest(param_1->playerDat,(param_1->start_position).x,(param_1->start_position).y,
               param_1->wanderRadius,(pVVar2[uVar1].wander.nodeflags & 2));
  }
  if ((param_1->homenode & 2)) 
    Actor::SetFacing(param_1->playerDat,(param_1->start_position).x,(param_1->start_position).y);
}

void WanderSubstruct_setFlag1(wander_substruct *param_1){param_1->flags |= 1;}

void monster_engagement_func(wander_struct *param_1,short delta){
  byte bVar1;
  playerData *ppVar2;
  bool bVar3;
  double dVar4;
  bool bVar7;
  BaseWidget *pBVar5;
  Borg9data *borgDat;
  short sVar6;
  vec2f *A;
  wander_substruct *wanderer;
  vec3f *from;
  voxelObject *pmVar8;
  float sneakval;
  float entRamB;
  float fVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  double dVar10;
  float fVar15;
  double dVar16;
  double dVar17;
  double dVar18;
  vec2f fStack488;
  vec2f afStack424;
  vec3f afStack360;
  vec3f playerPos;
  vec3f fStack232;
  vec3f fStack168;
  playerData *playerDat_ = gGlobals.playerCharStruct.playerDat;
  sneakval = sneak_value(0.8f);
  bVar3 = false;
  if ((((gGlobals.screenFadeMode == 0) && (!isPaused())) &&
      (gGlobals.playerCharStruct.unkState == 3)) &&
     ((!WHANDLE->GetTail() && (0 < param_1->wanderersmax)))) {
    for(s16 i = 0;i<param_1->wanderersmax;i++) {
      wanderer = &param_1->wanderSubstructs[i];
      if (wanderer->isActive) {
        borgDat = GetCollisionZone(wanderer->playerDat->zoneDatByte);
        pmVar8 = &borgDat->voxelObjs[wanderer->VoxelIndex];
        entRamB = EntityDB::GetPerception(gEntityDB,(pmVar8->monster).entityID);
        copyVec3(&(playerDat_->collision).pos,&playerPos);
        bVar1 = wanderer->playerDat->zoneDatByte;
        if (bVar1 != 0x11) Actor::SubPosOnLoadedMap(bVar1,&playerPos);
        wanderer->timer-= delta;
        Actor::GetPosOnLoadedMap(wanderer->playerDat,&afStack360);
        fVar11 = vec3_proximity(&afStack360,&(playerDat_->collision).pos);
        afStack360.x -=((wanderer->playerDat->facing).x * entRamB) * 0.3);
        afStack360.z -=((wanderer->playerDat->facing).y * entRamB) * 0.3);
        fVar12 = vec3_proximity(&afStack360,&(playerDat_->collision).pos);
        setVec2(&fStack488,(wanderer->playerDat->collision).pos.x,
                (wanderer->playerDat->collision).pos.z);
        A = &wanderer->position;
        fVar13 = vec2_proximity(A,&fStack488);
        copyVec2(A,&afStack424);
        Actor::AddPosOnLoadedMap(wanderer->playerDat->zoneDatByte,&afStack424);
        setVec2(&fStack488,(playerDat_->collision).pos.x,(playerDat_->collision).pos.z);
        fVar14 = vec2_proximity(A,&fStack488);
        if (fVar12 <= entRamB + entRamB) {
          if (wanderer->bool3a == 0) {
            fVar15 = entRamB *(1.0 -gGlobals.Sub.weather.fogTime * 0.75);
            dVar10 = (double)fVar15;
            dVar18 = dVar10 * 1.5;
            dVar17 = dVar10 * 0.6;
            dVar16 = dVar10 * 0.55;
            wanderer->bool3a = 1;
            wanderer->unk2c = fVar15;
            wanderer->unk34 = (float)(dVar10 + dVar10);
            wanderer->unk30 = (float)dVar18;
            wanderer->senseValB = (float)(dVar17 * (double)sneakval);
            wanderer->senseValA = (float)(dVar16 * (double)sneakval);
          }
        }
        if (fVar12 < wanderer->unk34) {
          if ((wanderer->size <= fVar13) && (wanderer->size <= fVar14)) {
            goto LAB_80013180;
          }
LAB_80013188:
          if (entRamB + entRamB <= fVar12) {
            if (wanderer->bool3a != 0) {
              entRamB = wanderer->size;
              goto LAB_800131a8;
            }
          }
        }
        else {
LAB_80013180:
          if (wanderer->field19_0x3e == 0) goto LAB_80013188;
          entRamB = wanderer->size;
LAB_800131a8:
          if (entRamB <= fVar13) {
            if (fVar14 < entRamB) {
              goto LAB_800131e8;
            }
            Actor::ResetMoveQueue(wanderer->playerDat);
            wanderer->timer = 300;
            wanderer->homenode|= 4;
LAB_800131f8:
            entRamB = wanderer->unk34;
          }
          else {
LAB_800131e8:
            if (wanderer->field19_0x3e != 0) {
              FUN_80012d44(wanderer);
              goto LAB_800131f8;
            }
            entRamB = wanderer->unk34;
          }
          wanderer->bool3a = 0;
          if ((entRamB <= fVar12) || (wanderer->size + 2.0f <= fVar13)) {
            wanderer->field19_0x3e = 0;
            sVar6 = wanderer->NoBorg13;
          }
          else {
            sVar6 = wanderer->NoBorg13;
          }
        }
        if (sVar6 == 0) {
LAB_80013318:
          if (fVar11 < 3.0f) {
            ppVar2 = wanderer->playerDat;
            entRamB = (ppVar2->collision).pos.x;
            ppVar2->ani_type = 0;
            Actor::SetFacing(ppVar2,entRamB - playerPos.x,(ppVar2->collision).pos.z - playerPos.z);
          }
        }
        else {
          if (fVar13 <= wanderer->size) {
            if (((wanderer->flags ^ 1) & 1)) {
              sVar6 = playerDat_->ani_type;
              if (sVar6 == 3) {
                if (wanderer->unk30 < fVar12) {
                  goto LAB_80013310;
                }
                bVar1 = 3;
LAB_80013308:
                gGlobals.EncounterDat.unk28 = bVar1;
                bVar3 = true;
              }
              else if (sVar6 < 4) {
                if (sVar6 == 2) {
                  bVar1 = 2;
                  if (fVar12 <= wanderer->unk2c) goto LAB_80013308;
                }
                else {
                  entRamB = wanderer->senseValA;
LAB_800132a0:
                  if (entRamB < fVar12) {
                    goto LAB_80013310;
                  }
                  bVar3 = true;
                  gGlobals.EncounterDat.unk28 = 0;
                }
              }
              else {
                if (sVar6 != 0x19) {
                  entRamB = wanderer->senseValA;
                  goto LAB_800132a0;
                }
                if (wanderer->senseValB < fVar12) {
                  goto LAB_80013310;
                }
                bVar3 = true;
                gGlobals.EncounterDat.unk28 = 1;
              }
            }
          }
LAB_80013310:
          if (wanderer->NoBorg13 == 0) goto LAB_80013318;
        }
        if (!bVar3){
          if (wanderer->field19_0x3e == 0) {
            if (((wanderer->playerDat->flags & (ACTOR_CANMOVE|ACTOR_CANROTATE|ACTOR_40)) == 0) &&
               ((short)wanderer->timer < 1)) {
              if ((wanderer->homenode & 4) == 0) {
                FUN_80012c58(param_1,wanderer);
                FUN_80012d44(wanderer);
              }
              else {
                wanderer->homenode&=~4;
                FUN_80012d44(wanderer);
              }
            }
            goto LAB_800135b4;
          }
        }
        wanderer->field19_0x3e = 1;
        if (wanderer->NoBorg13 == 1) {
          Actor::SetAiDest(wanderer->playerDat,playerPos.x,playerPos.z,2.0,0);
          if (((fVar11 < 7.0f) && (enemyHostileFlag)) &&
             ((pmVar8->monster).borg_13 == 0)) {
            ppVar2 = wanderer->playerDat;
            fStack232.x = (ppVar2->collision).pos.x;
            fStack232.z = (ppVar2->collision).pos.z;
            fStack232.y = (ppVar2->collision).pos.y + 1.0f;
            fStack168.y = playerPos.y + 1.0f;
            fStack168.x = playerPos.x;
            fStack168.z = playerPos.z;
            entRamB = fStack232.y - fStack168.y;
            if (0.0 < entRamB) {
              if (entRamB < 3.0f) goto LAB_80013488;
            }
            else if (-entRamB < 3.0f) {
LAB_80013488:
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
          vec2_normalize(&fStack488);
          multiVec2(&fStack488,-1.0);
          fStack488.x = fStack488.x + (wanderer->playerDat->collision).pos.x;
          fStack488.y = fStack488.y + (wanderer->playerDat->collision).pos.z;
          Actor::SetAiDest(wanderer->playerDat,fStack488.x,fStack488.y,1.0,0);
        }
      }
LAB_800135b4:
    }
  }
}

