float sneak_value(float point8){
  char cVar2;
  float fVar3;
  
  if (gGlobals.party != NULL {
    cVar2 = GetMostSkilledMember(gGlobals.party,Stealth);
    if (((cVar2 != -1) && (gGlobals.party->Party[cVar2] != NULL) {
      cVar2 = getModdedSkill(gGlobals.party->Party[cVar2]->Skills,Stealth);
      fVar3 = (float)(int)cVar2 / 10.0f;
      if (1.0f < (float)(int)cVar2 / 10.0f) {fVar3 = 1.0f;}
      return 1.0f - fVar3 * point8;
    }
  }
  return 0.0;
}

//A lot of examples of Ghidra "doing its best" following
wander_substruct * findWandererFromPlayerName(short arg0){
  int iVar1;
  wander_substruct *pwVar2;
  int uVar3;
  char acStack72 [72];
  
  uVar3 = 0;
  if (0 < gGlobals.wander.wanderersmax) {
    iVar1 = 0;
    do {
      pwVar2 = (wander_substruct *)
               ((gGlobals.wander.wanderSubstructs)->start_position + iVar1 * 4 + iVar4 * 5 + -1);
      uVar3++;
      if (pwVar2->field_0x20 != 0) {
        if (pwVar2->playerDat == NULL) {
          uVar3++;
        }
        else {
          uVar3++;
          if (pwVar2->playerDat->ID == arg0)) {
            return pwVar2;
          }
        }
      }
      iVar1 = uVar3 << 2;
    } while (uVar3 < gGlobals.wander.wanderersmax);
  }
  sprintf(acStack72,"Wanderer Not Found\nPlayerName: %d\n",arg0));
  assert(s_FindWandererFromPlayerName_800d8d4c,acStack72);
}

void func_800124b4(void *param_1,vec3 *param_2){
  Vec2 temp;
  
  copyVec3((vec3 *)(*param_1 + 0x68),param_2);
  get_mapcellsize((uint)*(byte *)(*param_1 + 0x70d),(Vec2 *)temp);
  (*param_2)[0] += temp[0];
  (*param_2)[2] += temp[1];
  return;}

void * WanderHead(wander_struct *arg0,short size){
  wander_substruct *x;
  void *pvVar1;
  longlong lVar2;
  short *psVar3;
  short *psVar4;
  int iVar5;
  
  arg0->field_0x56 = 1;
  arg0->wanderersmax = size;
  x = (wander_substruct *)Malloc(size * 0x54,s_./src/wander.cpp_800d8d68,0xaa);
  arg0->wanderSubstructs = x;
  pvVar1 = memset(x,0,(arg0->wanderersmax * 0x14 + (int)arg0->wanderersmax) * 4);
  lVar2 = 0;
  if (0 < arg0->wanderersmax) {
    psVar4 = arg0->wandererIndicies;
    psVar3 = &arg0->wanderSubstructs->field_0x22;
    iVar5 = 0x10000;
    do {
      *psVar4 = (short)lVar2;
      *psVar3 = (short)lVar2;
      psVar3 = psVar3 + 0x2a;
      lVar2 = (longlong)(iVar5 >> 0x10);
      pvVar1 = (void *)(uint)(lVar2 < arg0->wanderersmax);
      psVar4 = psVar4 + 1;
      iVar5 = iVar5 + 0x10000;
    } while (pvVar1 != (void *)0x0);
  }
  arg0->wanderers = 0;
  return pvVar1;
}


void wander_free(wander_struct *param_1){
  param_1->field_0x56 = 0;
  wander_struct_free_sub(param_1);
  Free(param_1->wanderSubstructs,s_./src/wander.cpp_800d8d68,0xd4);
}


void look_for_monsterparties
               (wander_struct *param_1,Borg_9_data *param_2,playerData *param_3,byte param_4){
  monsterparty_obj *obj;
  bool bVar1;
  uint uVar2;
  int count;
  int iVar3;
  
  if (((screenFadeMode_switch != 0xc) && (gamemode_type != 2)) &&
     (uVar2 = 0, param_2->ref_obj_count != 0)) {
    count = 0;
    iVar3 = 0x10000;
    do {
      obj = (monsterparty_obj *)(&param_2->ref_objs[count]);
      if ((((obj->header).type == MonsterParty) && (((obj->header).Bitfeild & visible) != 0)) &&
         (bVar1 = some_monsterparty_checker
                            ((short)(uVar2 & 0xffff),(byte)map_dat_A,(byte)MapShortA,(byte)mapShortB
                             ,param_4,5), bVar1 == false)) {
        AllocWanderer(param_1,uVar2 & 0xffff,param_3,param_4);
      }
      uVar2 = iVar3 >> 0x10;
      count++;
      iVar3 = iVar3 + 0x10000;
    } while (uVar2 < param_2->ref_obj_count);
  }
  return;
}

void AllocWanderer(wander_struct *param_1,short param_2,playerData *param_3,byte param_4){
  short sVar1;
  ushort uVar2;
  ItemID IVar3;
  playerData *ppVar4;
  Borg_9_data *pBVar5;
  Borg7Enum BVar6;
  playerData *ppVar7;
  byte bVar9;
  undefined2 uVar8;
  wander_substruct *ppVar10;
  monsterparty_obj *refObj;
  float fVar10;
  float fVar11;
  
  pBVar5 = GetCollisionZone(param_4);
  refObj = (monsterparty_obj *)(pBVar5->ref_objs[param_2]);
  if (pBVar5 == NULL) {assert(s_AllocWanderer_800d8d7c,s_Invalid_Collision_Zone_800d8d8c);}
  if ((short)param_1->wanderers < param_1->wanderersmax) {
    uVar7 = param_1->wanderers;
    param_1->wanderers++;
    sVar1 = *(short *)((int)param_1->wandererIndicies + ((int)((uint)uVar7 << 0x10) >> 0xf));
    ppVar10 = (wander_substruct *)
              (param_1->wanderSubstructs->start_position + sVar1 * 0x14 + (int)sVar1 + -1);
    uVar2 = ppVar10->field_0x22;
    memset(ppVar10,0,0x54);
    ppVar10->field_0x22 = uVar2;
    refObj->field_0x4c = uVar2;
    ppVar10->field_0x20 = 1;
    ppVar10->VoxelIndex = param_2;
    ppVar10->NoBorg13 = 1;
    if (refObj->borg_13 != 0) {
      ppVar10->NoBorg13 = 0;
    }
    ppVar10->target_playerDat = param_3;
    fVar10 = get_some_entity_dat(refObj->entityID);
    BVar6 = get_ent_borg7(refObj->entityID);
    ppVar7 = AllocPlayer(fVar10,ppVar10->start_position[0],0.0,ppVar10->start_position[1],BVar6);
    ppVar10->playerDat = ppVar7;
    IVar3 = refObj->entityID;
    ppVar7->zoneDatByte = param_4;
    ppVar4 = ppVar10->playerDat;
    ppVar7->ent_ID = IVar3;
    (ppVar4->collision).flags |= 0x400;
    fVar10 = get_entity_scale(refObj->entityID);
    ppVar4 = ppVar10->playerDat;
    fVar11 = (ppVar4->collision).radius;
    ppVar4->scale_floatA = fVar10;
    ppVar4->scale_floatB = fVar10 * fVar11;
    bVar9 = GetIDIndex(refObj->entityID);
    ppVar10->playerDat->Ent_index = bVar9;
    if (refObj->borg_13 == 0) {ppVar10->playerDat->rangerWarrior = get_ranger_or_warrior(gGlobals.party,refObj->RangerWarriorMulti);}
    func_80012b70(param_1,ppVar10,refObj->field_0x56);
    ppVar4 = ppVar10->playerDat;
    ppVar10->position[0] = (refObj->header).coords[0];
    ppVar10->position[1] = (refObj->header).coords[2];
    ppVar10->size = (refObj->header).size;
    (ppVar4->collision).position[0] = (refObj->header).coords[0];
    (ppVar10->playerDat->collision).position[2] = ppVar10->position[1];
    func_800154e4(ppVar10->playerDat,(refObj->header).coords[1],1,0);
    if (((ppVar10->homenode ^ 1) & 1) != 0) {assert(s_AllocWanderer_800d8d7c,s_Home_Node_not_WANDER_MOVE_800d8dcc);}
    func_80012d44(ppVar10);
    return;
  }
  assert(s_AllocWanderer_800d8d7c,s_Too_Many_wanderers_already_alloc_800d8da4);
}


void free_wanderstruct_player(wander_struct *param_1,wander_substruct *param_2){
  ushort uVar1;
  
  if (param_2->playerDat != NULL {
    FreePlayer(param_2->playerDat);
    param_2->playerDat = NULL;
  }
  param_2->field_0x20 = 0;
  param_1->wanderers--;
  *(short *)((int)param_1->wandererIndicies + (param_1->wanderers << 0x10) >> 0xf)) =
       param_2->field_0x22;
  return;
}


void func_80012a24(wander_struct *param_1,int param_2){
  int iVar2;
  wander_substruct *iVar1;
  int iVar3;
  int iVar4;
  
  if (0 < param_1->wanderersmax) {
    iVar3 = 0;
    iVar4 = 0x10000;
    do {
      iVar1 =param_1->wanderSubstructs[iVar3];
      if ((iVar1->field_0x20 != 0) && (iVar1->target_playerDat == (playerData *)param_2)) {
        free_wanderstruct_player(param_1,iVar1);
      }
      iVar2 = iVar4 >> 0x10;
      iVar3++;
      iVar4 = iVar4 + 0x10000;
    } while (iVar2 < param_1->wanderersmax);
  }
  return;
}

void wander_struct_free_sub(wander_struct *param_1){
  int iVar1;
  wander_substruct *pwVar2;
  int iVar3;
  int iVar4;
  if (0 < param_1->wanderersmax) {
    iVar3 = 0;
    iVar4 = 0x10000;
    do {
      pwVar2 =param_1->wanderSubstructs[iVar3]);
      if (pwVar2->field_0x20 != 0) {free_wanderstruct_player(param_1,pwVar2);}
      iVar1 = iVar4 >> 0x10;
      iVar3++;
      iVar4 = iVar4 + 0x10000;
    } while (iVar1 < param_1->wanderersmax);
  }
  return;
}

playerData * func_80012b44(wander_struct *param_1,wander_substruct *param_2){
  playerData *ppVar1;
  
  ppVar1 = param_2->playerDat;
  param_2->playerDat = NULL;
  free_wanderstruct_player(param_1,param_2);
  return ppVar1;
}

void func_80012b70(wander_struct *param_1,wander_substruct *param_2,short param_3){
  Borg_9_data *pBVar3;

  Vec2 fStack80;
  
  pBVar3 = GetCollisionZone(param_2->playerDat->zoneDatByte);
  pVVar3 = (ref_obj *)pBVar3->ref_objs[param_3]);
  param_2->start_position[0] = *(float *)pVVar3->data;
  param_2->start_position[1] = *(float *)(pVVar3->data + 4);
  param_2->wanderRadius = *(float *)(pVVar3->data + 8);
  param_2->randVal = *(float *)(pVVar3->data + 0xc);
  param_2->field_0x14 = *(float *)(pVVar3->data + 0x10);
  *(undefined4 *)&param_2->timer = *(undefined4 *)(pVVar3->data + 0x14);
  *(undefined4 *)&param_2->field_0x1c = *(undefined4 *)(pVVar3->data + 0x18);
  param_2->start_position[0] = pVVar3.header.coords[0];
  param_2->start_position[1] = pVVar3.header.coords[2];
  if ((param_2->homenode & 2) != 0) {
    fStack80[0] = (param_2->playerDat->collision).position[0];
    fStack80[1] = (param_2->playerDat->collision).position[2];
    Vec2_Sub(param_2->start_position,(Vec2 *)fStack80,param_2->start_position);
    vec2_normalize(param_2->start_position);
  }
  return;
}

void func_80012c58(wander_struct *param_1,wander_substruct *param_2){
  undefined2 uVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  
  uVar1 = param_2->field_0x1c;
  if (Random::rand_float_multi(gGlobals,1.0) < param_2->field_0x14) {
    uVar1 = param_2->field_0x1e;
  }

  func_80012b70(param_1,param_2,uVar1);
  if ((param_2->homenode & 1) != 0) {
    fVar2 = Random::rand_float_multi(&gGlobals,6.283186);
    fVar3 = Random::rand_float_multi(&gGlobals,param_2->randVal);
    fVar4 = __sinf(fVar2);
    param_2->start_position[0]+= (fVar4 * fVar3);
    fVar2 = __cosf(fVar2);
    param_2->start_position[1]+= (fVar2 * fVar3);
  }
  return;
}

void func_80012d44(wander_substruct *param_1){
  ushort uVar1;
  Voxel_u *pVVar2;
  Borg_9_data *pBVar3;
  float fVar4;
  Vec2 fStack80;
  
  pBVar3 = GetCollisionZone(param_1->playerDat->zoneDatByte);
  uVar1 = param_1->VoxelIndex;
  param_1->field_0x38 &= 0xfffe;
  pVVar2 = pBVar3->ref_objs;
  if ((param_1->homenode & 1) != 0) {
    fStack80[0] = (param_1->playerDat->collision).position[0];
    fStack80[1] = (param_1->playerDat->collision).position[2];
    if (get_vec2_proximity(fStack80,param_1->start_position) <= param_1->wanderRadius) {
      uVar1 = param_1->homenode;
      goto LAB_80012df4;
    }
    enemy_proximity_check
              (param_1->playerDat,param_1->start_position[0],param_1->start_position[1],
               param_1->wanderRadius,
               *(ushort *)((int)pVVar2 + ((uint)uVar1 * 0x1c - (uint)uVar1) * 4 + 0x58) & 2);
  }
  uVar1 = param_1->homenode;
LAB_80012df4:
  if ((uVar1 & 2) != 0) {
    playerdata_set_facing(param_1->playerDat,param_1->start_position[0],param_1->start_position[1]);
  }
  return;
}

void func_80012e24(wander_substruct *param_1){param_1->field_0x38 |= 1;}

void monster_engagement_func(wander_struct *param_1,short param_2){
  byte bVar1;
  playerData *ppVar2;
  bool bVar3;
  bool bVar7;
  longlong lVar4;
  Borg_9_data *pBVar5;
  short sVar6;
  Vec2 *A;
  wander_substruct *wanderer;
  vec3 *from;
  monsterparty_obj *pmVar8;
  float sneakval;
  float entRamB;
  float fVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  double dVar9;
  double dVar14;
  double dVar15;
  double dVar16;
  float fVar17;
  double dVar18;
  vec2 fStack488;
  vec2 afStack424;
  vec3 afStack360;
  vec3 playerPos;
  vec3 fStack232;
  vec3 fStack168;

  playerData *playerDat_;
  
  playerDat_ = PlayerCharStruct.playerDat;
  sneakval = sneak_value(0.8f);
  bVar3 = false;
  if ((((story_short == 0) && (isPaused() == false)) &&
      (PlayerCharStruct.camping_var == '\x03')) &&
     (widgethandler_get_widgetB(widget_handler_pointer)== 0 &&
      (lVar4 = 0, 0 < param_1->wanderersmax)))) {

    dVar18 = 0.3d;
    do {
      wanderer = param_1->wanderSubstructs[ivar4];
      if (wanderer->field_0x20 != 0) {
        pBVar5 = GetCollisionZone(wanderer->playerDat->zoneDatByte);
        pmVar8 = (monsterparty_obj *)
                 ((int)pBVar5->ref_objs +
                 ((uint)(ushort)wanderer->VoxelIndex * 0x1c - (uint)(ushort)wanderer->VoxelIndex) *
                 4);
        entRamB = get_entity_ram_b(EntityPointer,pmVar8->entityID);
        copyVec3((playerDat_->collision).position,(vec3 *)playerPos);
        bVar1 = wanderer->playerDat->zoneDatByte;
        fVar17 = entRamB + entRamB;
        if (bVar1 != 0x11) {adjust_playerpos_value(bVar1,(vec3 *)playerPos);}
        wanderer->timer -= param_2;
        func_800153fc(wanderer->playerDat,(vec3 *)afStack360);
        fVar10 = get_vec3_proximity((vec3 *)afStack360,from);
        afStack360[0] -=
                    (wanderer->playerDat->facing[0] * entRamB) * dVar18);
        afStack360[2] -=
                    (double)(wanderer->playerDat->facing[1] * entRamB) * dVar18);
        fVar11 = get_vec3_proximity((vec3 *)afStack360,from);
        setVec2((Vec2 *)&fStack488,(wanderer->playerDat->collision).position[0],
                (wanderer->playerDat->collision).position[2]);
        A = (Vec2 *)wanderer->position;
        fVar12 = get_vec2_proximity(A,(Vec2 *)&fStack488);
        copyVec2(A,(Vec2 *)afStack424);
        func_8001545c((uint)wanderer->playerDat->zoneDatByte,(Vec2 *)afStack424);
        setVec2((Vec2 *)&fStack488,(playerDat_->collision).position[0],
                (playerDat_->collision).position[2]);
        fVar13 = get_vec2_proximity(A,(Vec2 *)&fStack488);
        if (fVar11 <= fVar17) {
          if (wanderer->field_0x3a == 0) {
            entRamB = (float)((double)entRamB *
                             (1.0d - (double)weatherDat.field_0xc * 0.75d)
                             );
            dVar9 = (double)entRamB;
            dVar16 = dVar9 * 1.5d;
            dVar15 = dVar9 * 0.6d;
            dVar14 = dVar9 * 0.55d;
            wanderer->field_0x3a = 1;
            wanderer->field_0x2c = entRamB;
            wanderer->field_0x34 = (float)(dVar9 + dVar9);
            wanderer->field_0x30 = (float)dVar16;
            wanderer->senseValB = (float)(dVar15 * (double)sneakval);
            wanderer->senseValA = (float)(dVar14 * (double)sneakval);
            goto LAB_80013144;
          }
          entRamB = wanderer->field_0x34;
        }
        else {
LAB_80013144:
          entRamB = wanderer->field_0x34;
        }
        if (fVar11 < entRamB) {
          if ((wanderer->size <= fVar12) && (wanderer->size <= fVar13)) {
            sVar6 = wanderer->field_0x3e;
            goto LAB_80013180;
          }
LAB_80013188:
          if (fVar17 <= fVar11) {
            if (wanderer->field_0x3a != 0) {
              entRamB = wanderer->size;
              goto LAB_800131a8;
            }
            sVar6 = wanderer->NoBorg13;
          }
          else {sVar6 = wanderer->NoBorg13;}
        }
        else {
          sVar6 = wanderer->field_0x3e;
LAB_80013180:
          if (sVar6 == 0) goto LAB_80013188;
          entRamB = wanderer->size;
LAB_800131a8:
          if (entRamB <= fVar12) {
            if (fVar13 < entRamB) {
              sVar6 = wanderer->field_0x3e;
              goto LAB_800131e8;
            }
            playerdata_memset_0x154(wanderer->playerDat);
            wanderer->timer = 300;
            wanderer->homenode |= 4;
LAB_800131f8:
            entRamB = wanderer->field_0x34;
          }
          else {
            sVar6 = wanderer->field_0x3e;
LAB_800131e8:
            if (sVar6 != 0) {
              func_80012d44(wanderer);
              goto LAB_800131f8;
            }
            entRamB = wanderer->field_0x34;
          }
          wanderer->field_0x3a = 0;
          if ((entRamB <= fVar11) || (wanderer->size + 2.0f <= fVar12)) {
            wanderer->field_0x3e = 0;
            sVar6 = wanderer->NoBorg13;
          }
          else {sVar6 = wanderer->NoBorg13;}
        }
        if (sVar6 == 0) {
LAB_80013318:
          if (fVar10 < 3.0f) {
            ppVar2 = wanderer->playerDat;
            entRamB = (ppVar2->collision).position[0];
            ppVar2->ani_type = 0;
            playerdata_set_facing
                      (ppVar2,entRamB - playerPos[0],(ppVar2->collision).position[2] - playerPos[2])
            ;
          }
        }
        else {
          if (fVar12 <= wanderer->size) {
            if (((wanderer->field_0x38 ^ 1) & 1) != 0) {
              sVar6 = playerDat_->ani_type;
              if (sVar6 == 3) {
                if (wanderer->field_0x30 < fVar11) {
                  sVar6 = wanderer->NoBorg13;
                  goto LAB_80013310;
                }
LAB_80013308:
                bVar3 = true;
                encounter_dat.field_0x28 = (byte)sVar6;
              }
              else {
                if (sVar6 < 4) {
                  if (sVar6 == 2) {
                    sVar6 = 2;
                    if (fVar11 <= wanderer->field_0x2c) goto LAB_80013308;
                  }
                  else {
                    entRamB = wanderer->senseValA;
LAB_800132a0:
                    if (entRamB < fVar11) {
                      sVar6 = wanderer->NoBorg13;
                      goto LAB_80013310;
                    }
                    bVar3 = true;
                    encounter_dat.field_0x28 = 0;
                  }
                }
                else {
                  if (sVar6 != 0x19) {
                    entRamB = wanderer->senseValA;
                    goto LAB_800132a0;
                  }
                  if (wanderer->senseValB < fVar11) {
                    sVar6 = wanderer->NoBorg13;
                    goto LAB_80013310;
                  }
                  bVar3 = true;
                  encounter_dat.field_0x28 = 1;
                }
              }
            }
            sVar6 = wanderer->NoBorg13;
          }
          else {
            sVar6 = wanderer->NoBorg13;
          }
LAB_80013310:
          if (sVar6 == 0) goto LAB_80013318;
        }
        if (bVar3) {
          sVar6 = wanderer->NoBorg13;
        }
        else {
          if (wanderer->field_0x3e == 0) {
            if (((wanderer->playerDat->flags & 0x70U) == 0) && ((short)wanderer->timer < 1)) {
              if ((wanderer->homenode & 4) == 0) {
                func_80012c58(param_1,wanderer);
                func_80012d44(wanderer);
              }
              else {
                wanderer->homenode = wanderer->homenode & 0xfffb;
                func_80012d44(wanderer);
              }
            }
            goto LAB_800135b4;
          }
          sVar6 = wanderer->NoBorg13;
        }
        wanderer->field_0x3e = 1;
        if (sVar6 == 1) {
          enemy_proximity_check(wanderer->playerDat,playerPos[0],playerPos[2],2.0,0);
          if (((fVar10 < 7.0f) && (enemyHostileFlag != 0)) && (pmVar8->borg_13 == 0)) {
            ppVar2 = wanderer->playerDat;
            fStack232[0] = (ppVar2->collision).position[0];
            fStack232[2] = (ppVar2->collision).position[2];
            fStack232[1] = (ppVar2->collision).position[1] + 1.0f;
            fStack168[1] = playerPos[1] + 1.0f;
            fStack168[0] = playerPos[0];
            fStack168[2] = playerPos[2];
            entRamB = fStack232[1] - fStack168[1];
            if (0.0 < entRamB) {
              if (entRamB < 3.0f) goto LAB_80013488;
            }
            else {
              if (-entRamB < 3.0f) {
LAB_80013488:
                bVar7 = func_800adf78(pBVar5,(vec3 *)fStack232,(vec3 *)fStack168,0.5,null,
                                     NULL,0);
                if (bVar7 == false) {
                  encounter_dat.collisionBool = true;
                  battle_setup_func(pmVar8,(pmVar8->header).flagB,wanderer->VoxelIndex);
                  wanderer->NoBorg13 = 0;
                  func_80024c54(2);
                }
              }
            }
          }
        }
        else {
          if (sVar6 == 2) {
            fStack488[0] = playerPos[0] - (wanderer->playerDat->collision).position[0];
            fStack488[1] = playerPos[2] - (wanderer->playerDat->collision).position[2];
            vec2_normalize((Vec2 *)&fStack488);
            multiVec2((Vec2 *)&fStack488,-1.0);
            fStack488[0] += (wanderer->playerDat->collision).position[0];
            fStack488[1] += (wanderer->playerDat->collision).position[2];
            enemy_proximity_check(wanderer->playerDat,fStack488[0],fStack488[0],1.0,0);
          }
        }
      }
LAB_800135b4:
      lVar4++;
    } while (lVar4 < param_1->wanderersmax);
  }
  return;
}
