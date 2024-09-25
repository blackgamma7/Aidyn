func* voxelFuncs0[]={
  Voxel_func_NOOP,
  loot_func,
  Voxel_func_NOOP,
  Voxel_func_NOOP,
  Voxel_func_NOOP,
  monsterpary_func,
  Voxel_func_NOOP,
  dialouge_vobject_func,
  trigger_vobject_func,
  savepoint_func,
  Voxel_func_NOOP
}
func* voxelFuncs1[]={
  ret0_80014E38,
  container_obj_check,
  ret0_80014E38,
  ret0_80014E38,
  ret0_80014E38,
  monsterparty_obj_check,
  ret0_80014E38,
  teleporter_obj_check,
  ret0_80014E38,
  dialoug_obj_check,
  trigger_obj_check,
  savepoint_prox_check,
  ret0_80014E38
}

func* voxelFuncs2[]={
  scene_object_check,
  exploding_container_check,
  check_reference_object,
  check_reference_object,
  check_reference_object,
  some_monster_check,
  check_reference_object,
  TP_lock_secret_check,
  check_reference_object,
  some_dialouge_trigger_check,
  some_trigger_check,
  savepoint_appear_check,
  check_reference_object
}
u32 teleportTimestamp;
typedef enum GameState_Cheat { /* Set in big Debug Menu */
    All,appear,check,teleportLock,teletrap,teleportSecret,containerOpen,containerExplode,
    monsterCheck,dialougeTrigger,trigger,referenceObject
} GameState_Cheat;

void FUN_80013620(container_obj *arg0,s16 arg1,Borg_9_data *param_3){
  Scene_obj *prVar1 = (Scene_obj *)GetVoxelFromObjectLink(param_3,(mapVoxel *)arg0,Scene);
  if ((prVar1->dat).unk0x8) {
    AllocFreeQueueItem(&queueStructA,&(prVar1->dat).unk0x8,(u16)(((prVar1->dat).SceneFlags & 2) == 0),0);
    (prVar1->dat).unk0x8 = NULL;
  }
  (prVar1->dat).unk0x4 = (prVar1->dat).unk0x30[arg1 * 3 + -0xb];
}

void play_countainer_sound(container_obj *arg0,Borg_9_data * arg1){
  play_SFX(&gGlobals.SFXStruct,containerSounds[(arg0->dat).LootType],0,gGlobals.VolSFX,0xb4,0);
  FUN_80013620(arg0,1,arg1);}

void open_explosive_chest(container_obj *arg0,Borg_9_data *arg1){
  s32 iVar1;
  s32 iVar2;
  vec4f fStack96;
  iVar2 = 0x10000;
  alloc_explosion_light(arg0,1.0,600,0);
  do {
    alloc_explosion_light(arg0,0.35,0x3c,1);
    iVar1 = iVar2 >> 0x10;
    iVar2 = iVar2 + 0x10000;
  } while (iVar1 < 3);
  fStack96 = {0.35f,0.3f,0.25f,1.0f};
  chest_explode_particles(arg0,(arg0->header).coords[1],fStack96,0x1a4,2,0x4b,0.04f,0.06f,-8.5714285E-4f,1);
  (arg0->dat).Gold = 0;
  (arg0->dat).LootCat = (ItemID)0x0;
  FUN_80013620(arg0,2,arg1);
  setEventFlag((arg0->dat).explode_flag,true);
  getEventFlag(0x15fa);
  play_SFX(&gGlobals.SFXStruct,chestExplodeSFX[Random::range_(&gGlobals,0,3)],0,gGlobals.VolSFX,0xf0,0);
  set_voxel_visibility((mapVoxel *)arg0,false);
  return;
}
void NOOP_tp(void){}

//activaction funcs
void run_voxelFuncs0(mapVoxel *arg0){(*voxelFuncs0[(arg0->header).type])(arg0);}
//visibility check, i think
bool run_voxelFuncs2(mapVoxel *arg0){return (*run_voxelFuncs2[(arg0->header).type])(arg0);}
//collision
bool run_voxelFuncs1(mapVoxel *arg0,playerData *arg1){return (*run_voxelFuncs1[(arg0->header).type])(arg0,arg1);}

void Voxel_func_NOOP(void){}

bool teleport_trap(teleport_obj *arg0){
  bool bVar1;
  
  bVar1 = false;
  if ((arg0->dat).trapBool16 != 0) {
    bVar1 = false;
    if (((teleport_trap_check((arg0->dat).trap_flag) == false) && 
    (bVar1 = false, (arg0->dat).trap_value != -1)) &&
       (bVar1 = false, (arg0->dat).trapBool16 != 0)) {
      gauge_trap_danger(arg0);
      bVar1 = true;
    }
  }
  return bVar1;
}

void teleporter_func(teleport_obj *arg0){
  EventFlag EVar1;
  bool bVar2;
  
  if (vobject_pause_check()) {
    if (((arg0->header).Bitfeild & tangible) == 0) {
      EVar1 = (arg0->dat).secrect_door_flag;
      if ((EVar1 == 0) || (getEventFlag(EVar1))) {
        if (teleport_trap(arg0) == false) {
          if (((arg0->dat).lock_lv != 0) &&
             (Teleport_lock_check((arg0->dat).lock_flag) == false)) {
            if ((arg0->dat).lock_lv != 0) {
              lockpicking_check((mapVoxel *)arg0);
              return;
            }
            setEventFlag((arg0->dat).lockpick_flag_2,true);
            getEventFlag(0x15fa);
            getEventFlag(0x15fa);
          }
          teleportTimestamp = gGlobals.ticker;
          NOOP_tp();
          set_teleport_pointer(arg0);
        }
      }
      else {secret_door_func(arg0);}
    }
    else {
      teleportTimestamp = gGlobals.ticker;
      set_teleport_pointer(arg0);
    }
  }
  return;}


void get_loot_reagent(container_obj *arg0,container_Dat * arg1){
  mapVoxel *a;
  longlong lVar1;
  Inventory_struct *pIVar2;
  float fVar3;
  u32 uVar4;
  
  fVar3 = (float)(u32)arg1->Gold * RangerIngredientFloat;
  if (INT_MAX_F <= fVar3) {fVar3-= INT_MAX_F;}
  uVar4 = (u32)fVar3;
  if (uVar4 == 0) {uVar4 = 1;}
  ref_obj_bitmask_flag((arg0->header).flagB,(arg0->header).Bitfeild,Used);
  set_voxel_visibility((mapVoxel *)arg0,false);
  a = GetVoxelFromObjectLink(gGlobals.Sub.borg9DatPointer,(mapVoxel *)arg0,Scene);
  if (a) {set_voxel_visibility(a,false);}
  if (exploding_container_check(arg0,gGlobals.Sub.borg9DatPointer) != 0) {
    passto_WriteTo_VoxelChart((s16)((s32)((s32)arg0 - (s32)gGlobals.Sub.borg9DatPointer->ref_objs) * 0x684bda13 >> 2),
               (undefined)map_dat_A,(undefined)MapShortA,(undefined)mapShortB,0x11,
               *(undefined *)((s32)&(arg0->header).type + 1),10);
  }
  pIVar2 = build_inventory_struct((Inventory_struct *)passToMalloc(0x608));
  (*(pIVar2->Functions->add_to_inv).func)
            ((s32)pIVar2->inv_slots + (s16)(pIVar2->Functions->add_to_inv).arg[0] + -4,
             item_pointer->Gear[LootReagentIDs[arg1->LootType]].ID,
             uVar4);
  build_loot_menu(pIVar2,0,-1);
  PlayerCharStruct.camping_var = 7;
  return;}


bool loot_func(container_obj *arg0){
  s16 sVar1;
  ItemID IVar2;
  s16 sVar3;
  float vol;
  s16 *psVar5;
  bool bVar9;
  longlong lVar4;
  u16 uVar8;
  mapVoxel *a;
  s32 iVar6;
  void *ppfVar10;
  Inventory_struct *pIVar7;
  u32 uVar10;
  container_Dat *pcVar11;
  u32 uVar12;
  u16 uVar13;
  s16 aIStack96 [8] [2];
  
  pcVar11 = &arg0->dat;
  psVar5 = some_ref_obj_lookup_func
                     ((s16)((s32)((s32)arg0 - (s32)gGlobals.Sub.borg9DatPointer->ref_objs) * 0x684bda13
                             >> 2),(char)map_dat_A,(u8)MapShortA,(u8)mapShortB,0x11,
                      *(undefined *)((s32)&(arg0->header).type + 1));
  bVar9 = container_open_check((arg0->dat).open_flag);
  if (((bVar9 == false) && (psVar5 == NULL) &&
     (lVar4 = container_explode_check((arg0->dat).explode_flag), lVar4 == 0)) {
    uVar8 = (arg0->dat).LootType;
    if (uVar8 < 4) {uVar8 = (arg0->dat).unk0x14;}
    else {
      if (uVar8 < 7) {
        return get_loot_reagent(arg0,pcVar11);
      }
      if (uVar8 == 7) {
        set_voxel_visibility((mapVoxel *)arg0,false);
        ref_obj_bitmask_flag((arg0->header).flagB,(arg0->header).Bitfeild,Used);
        uVar8 = (arg0->dat).unk0x14;
      }
      else {uVar8 = (arg0->dat).unk0x14;}
    }
    if (uVar8 == 0) {sVar1 = (arg0->dat).unk0x14;}
    else {
      if ((arg0->dat).trap_lv != 0xff) {
        return gauge_trap_danger(arg0);
      }
      sVar1 = (arg0->dat).unk0x14;
    }
    if (sVar1 == 0) {
      uVar13 = 0;
      setEventFlag((arg0->dat).open_flag,true);
      getEventFlag(0x15fa);
      set_refObj_flag((mapVoxel *)arg0);
      if ((arg0->dat).LootType == 7) {
        a = GetVoxelFromObjectLink(gGlobals.Sub.borg9DatPointer,(mapVoxel *)arg0,Scene);
        set_voxel_visibility(a,false);
        IVar2 = (arg0->dat).LootCat;
      }
      else {
        uVar13 = 0x3c;
        play_countainer_sound(arg0,gGlobals.Sub.borg9DatPointer);
        IVar2 = (arg0->dat).LootCat;
      }
      uVar12 = 0;
      if (IVar2) {
        uVar10 = 0;
        get_chest_loot(loot_pointer,pcVar11);
        iVar6 = 0;
        do {
          psVar5 = pcVar11->lootCatDrop[uVar10]);
          sVar1 = *psVar5;
          if ((sVar1 != 0) && (psVar5[1] != 0)) {
            aIStack96[uVar12][0] = sVar1;
            aIStack96[uVar12][1] = sVar3;
            uVar12++;
          }
          uVar10++;
        } while (uVar10 < 7);
      }
      set_voxel_visibility((mapVoxel *)arg0,false);
      IVar2 = (arg0->dat).item;
      uVar10 = uVar12;
      if (IVar2) {
        uVar10 = uVar12 + 1 & 0xff;
        *(ItemID *)aIStack96[uVar12][0] = IVar2;
        aIStack96[uVar12][1] = 1;
      }
      if ((container_explode_check((arg0->dat).explode_flag) == 0) &&
      (container_open_check((arg0->dat).open_flag) == false))
      {
        passto_WriteTo_VoxelChart((s16)((s32)((s32)arg0 - (s32)gGlobals.Sub.borg9DatPointer->ref_objs) * 0x684bda13 >> 2),
          (char)map_dat_A,(u8)MapShortA,(u8)mapShortB,0x11,*(undefined *)((s32)&(arg0->header).type + 1),10);
      }
      if (uVar10 == 0) {
        Gsprintf(commonstringsmirror->"you just picked up gold",(arg0->dat).Gold);
        textbox_func(gGlobals.Text);
        gGlobals.party->Gold+= (arg0->dat).Gold;
        play_SFX(&SFXStruct,BORG12_CoinJingle,0,gGlobals.VolSFX,300,uVar13);
      }
      else {
        pIVar7 = build_inventory_struct((Inventory_struct *)passToMalloc(0x608));
        uVar12 = 0;
        if (uVar10 != 0) {
          do {
            (*(pIVar7->Functions->add_to_inv).func)
                      ((s32)pIVar7->inv_slots + (s16)(pIVar7->Functions->add_to_inv).arg[0] + -4,
                       aIStack96[uVar12][0],
                       aIStack96[uVar12][1]);
            uVar12++;
          } while (uVar12 < uVar10);
        }
        build_loot_menu(pIVar7,(u32)(arg0->dat).Gold,-1);
        PlayerCharStruct.camping_var = 0x13;
        if ((arg0->dat).LootType == 7) {PlayerCharStruct.camping_var = 7;}
      }
    }
    else {lockpicking_check((mapVoxel *)arg0);}
  }
  else {set_voxel_visibility((mapVoxel *)arg0,false);}
  return 1;
}

u8 monsterpary_func(monsterparty_obj *arg0,undefined arg1,char param_3){
  u8 bVar1;
  vec3f *playerPos;
  vec3f *c;
  void *piVar4;
  float x;
  float fVar2;
  vec3f afStack104;
  playerData *iVar1;
  
  if (arg0->borg_13 == 0) {
    playerPos = ((PlayerCharStruct.playerDat)->collision).position;
    piVar4 = (gGlobals.wander.wanderSubstructs)->start_position +
             (u32)arg0->unk0x4c * 0x14 + (u32)arg0->unk0x4c + -1;
    iVar1 = *piVar4;
    Vec3_sub(afStack104,(iVar1->collision).position,playerPos);
    x = vec3_normalize(afStack104);
    setVec3(afStack104,-iVar1->facing[0],0.0,-iVar1->facing[1]);
    vec3_normalize(afStack104);
    multiVec3(afStack104,x);
    vec3_sum(afStack104,afStack104,c);
    Vec3_sub(afStack104,afStack104,playerPos);
    fVar2 = vec3_normalize(afStack104);
    encounter_dat.collisionBool = x <= fVar2;
    encounter_dat.unk0x28 = 0;
    battle_setup_func(arg0,(arg0->header).flagB,*(u16 *)((s32)piVar4 + 0x50));
    bVar1 = 2;
    PlayerCharStruct.camping_var = 2;
  }
  else {
    bVar1 = (u8)arg0->flags & 4;
    if ((arg0->flags & 4) == 0) {
      dialoug_func(arg0->borg_13,0,map_dat_A,MapShortA,mapShortB,(s16)param_3);
      monsterparty_wanderstruct((gGlobals.wander.wanderSubstructs)->start_position +
                 (u32)arg0->unk0x4c * 0x14 + (u32)arg0->unk0x4c + -1);
      setEventFlag((arg0->header).flagB,true);
      bVar1 = getEventFlag(0x15fa);
    }
  }
  return bVar1;
}

void trigger_vobject_func(trigger_obj *arg0){
  Borg_7_header *pBVar1;
  borg9_phys *pbVar2;
  Borg_9_data *pBVar3 = gGlobals.Sub.borg9DatPointer;
  Scene_obj *prVar3;
  s32 iVar5;
  u16 uVar6;
  voxelHeader *iVar4;
  EventFlag EVar7;
  u32 uVar8;
  
  
  switch(arg0->triggertype) {
  case 1:
    setEventFlag(arg0->flagA,true);
    getEventFlag(0x15fa);
    set_refObj_flag((mapVoxel *)arg0);
    break;
  case 2:
    prVar3 = (Scene_obj *)GetVoxelFromObjectLink(gGlobals.Sub.borg9DatPointer,(mapVoxel *)arg0,Scene);
    pBVar1 = (prVar3->dat).unk0x8;
    if (pBVar1)func_800a0090(pBVar1,arg0->flagA);
    break;
  case 4:
    uVar8 = 0;
    if ((gGlobals.Sub.borg9DatPointer)->borghpys_count != 0) {
      pbVar2 = (gGlobals.Sub.borg9DatPointer)->phys_pointer;
      iVar5 = 0;
      do {
        iVar4 = (voxelHeader *)((s32)pbVar2->voxelPointers + iVar5);
        if (((iVar4->flagB & 0xf000) == 0x1000) && ((iVar4->flagB >> 5 & 0x7f) == arg0->flagA)) {
          uVar6 = iVar4->flagA & arg0->unk0x2e;
          iVar4->flagA = uVar6;
          iVar4->flagA = uVar6 | arg0->unk0x30;
        }
        uVar8++;
        iVar5 = uVar8 << 5;
      } while (uVar8 < pBVar3->borghpys_count);
    }
  }
  ref_obj_bitmask_flag((arg0->header).flagB;,(arg0->header).Bitfeild,Used);
  return;
}

void savepoint_func(void){}

bool vobject_pause_check(void){
  bool bVar1;
  bool bVar2;
  
  bVar2 = true;
  if (screenFadeMode_switch == 1) {
    bVar2 = false;
    if (isPaused() == false) {
      bVar2 = check_some_toggle();
      if (bVar2 == false) {bVar2 = PlayerCharStruct.camping_var == '\x03';}
      else {bVar2 = false;}
    }
  }
  return bVar2;
}

void dialouge_vobject_func(Dialoug_obj *arg0,undefined arg1,char param_3){
  if (vobject_pause_check()) {
    dialoug_func((u32)(arg0->dat).borg_13,(arg0->dat).unk0x8,(arg0->dat).unk0x2,
                 (arg0->dat).unk0x4,(arg0->dat).unk0x6,(s16)param_3);
  }
}


bool check_reference_object(mapVoxel *arg0){
  EventFlag EVar1;
  bool bVar2;
  bool bVar3;
  u16 uVar3;
  
  if(gamestate_cheat_check1(appear)){return gamestate_cheat_check2(appear);}
  EVar1 = (arg0->header).flagC;
  uVar3 = (arg0->header).Bitfeild >> 7 & 1;
  bVar3 = (bool)(u8)uVar3;
  if (EVar1 != 0) {
    if (EVar1 == 1) {bVar3 = uVar3 == 0;}
    else {bVar3 = (bool)(getEventFlag(EVar1) ^ bVar3);}
    }
  return bVar3;
}

bool scene_object_check(mapVoxel *arg0){
  bool bVar1;
  bool uVar2;

  bVar1 = gamestate_cheat_check1(referenceObject);
  if (bVar1 == false) {uVar2 = check_reference_object(arg0);}
  else {uVar2 = gamestate_cheat_check2(referenceObject);}
  return uVar2;}

bool exploding_container_sub(container_obj *arg0,Borg_9_data *arg1){
  bool bVar2;
  s16 *psVar1;
  bool uVar3;
  
  bVar2 = trigger_event_flag_check((arg0->header).flagC,(arg0->header).Bitfeild,0x80);
  if ((bVar2 == false) ||
     (some_ref_obj_lookup_func((s16)((s32)((s32)arg0 - (s32)arg1->ref_objs) * 0x684bda13 >> 2),
                          (char)map_dat_A,(u8)MapShortA,(u8)mapShortB,0x11,
                          *(undefined *)((s32)&(arg0->header).type + 1))))
    {uVar3 = false;}
  else {uVar3 = trigger_event_flag_check((arg0->header).flagA,(arg0->header).Bitfeild,0x100);}
  return uVar3;
}

char exploding_container_check(container_obj *arg0,Borg_9_data *arg1){
  u16 uVar1;
  mapVoxel *a;
  char cVar5;
  s16 *psVar3;
  
  a = GetVoxelFromObjectLink(arg1,(mapVoxel *)arg0,Scene);
  if (!gamestate_cheat_check1(appear)) {
    uVar1 = (arg0->dat).LootType;
    if ((7 < uVar1) || (uVar1 < 4)) {
      set_voxel_visibility(a,true);
      set_voxel_visibility((mapVoxel *)arg0,true);
      psVar3 = some_ref_obj_lookup_func((s16)((s32)((s32)arg0 - (s32)arg1->ref_objs) * 0x684bda13 >> 2),
        (char)map_dat_A,(u8)MapShortA,(u8)mapShortB,0x11,*(undefined *)((s32)&(arg0->header).type + 1));
      if ((!container_open_check((arg0->dat).open_flag)) && (psVar3 == NULL)) {
        if (!container_explode_check((arg0->dat).explode_flag)) {return 1;}
        FUN_80013620(arg0,2,arg1);
      }
      else {
        FUN_80013620(arg0,1,arg1);
        (arg0->dat).unk0x14 = 0;
        (arg0->dat).unk0x14 = 0;
        (arg0->dat).Gold = 0;
      }
      set_voxel_visibility((mapVoxel *)arg0,false);
      return 0;
    }
    cVar5 = exploding_container_sub(arg0,arg1);
  }
  else {cVar5 = gamestate_cheat_check2(appear);}
  set_voxel_visibility(a,cVar5 != 0);
  set_voxel_visibility((mapVoxel *)arg0,cVar5 != 0);
  return cVar5;}

bool TP_lock_secret_check(teleport_obj *arg0){
  u16 uVar1;
  bool uVar3;
  u8 bVar4;
  
  if(gamestate_cheat_check1(appear)){return gamestate_cheat_check2(appear);}
    uVar3 = false;
    if (trigger_event_flag_check((arg0->header).flagC,(arg0->header).Bitfeild,0x80)) {
      if ((arg0->dat).secretDoorVal == 0) {uVar1 = (arg0->dat).trapBool16;}
      else {
        if (teleport_secret_check((arg0->dat).secrect_door_flag) == false) {
          if (check_int_theif(gGlobals.party) < (arg0->dat).secretDoorVal) {return false;}
          (arg0->dat).secretDoorVal = 0;
        }
        else {(arg0->dat).secretDoorVal = 0;}
        uVar1 = (arg0->dat).trapBool16;
      }
      if (uVar1 == 0) {uVar1 = (arg0->dat).lock_lv;}
      else {
        if (teleport_trap_check((arg0->dat).trap_flag)) {(arg0->dat).trapBool16 = 0;}
        uVar1 = (arg0->dat).lock_lv;
      }
      uVar3 = true;
      if (uVar1 != 0) {
        if (Teleport_lock_check((arg0->dat).lock_flag)) {(arg0->dat).lock_lv = 0;}
        uVar3 = true;
      }
    }
  return uVar3;
}

bool some_monster_check(monsterparty_obj *arg0){
  EventFlag EVar1;
  
  if(gamestate_cheat_check1(appear)){return gamestate_cheat_check2(appear);}
  if(gamestate_cheat_check1(monsterCheck)){return gamestate_cheat_check2(monsterCheck);}
      EVar1 = (arg0->header).flagA;
      if (arg0->dat.borg_13 == 0) {
        return FUN_80015128(EVar1,(u32)(arg0->header).Bitfeild) != false && getEventFlag((arg0->header).flagB) == false;
      }
      else {return FUN_80015128(EVar1,(u32)(arg0->header).Bitfeild);}
}

bool some_trigger_check(trigger_obj *arg0){
  bool bVar1;
  GameState_Cheat GVar2;
  
  bVar1 = gamestate_cheat_check1(appear);
  GVar2 = appear;
  if (bVar1 == false) {
    bVar1 = gamestate_cheat_check1(trigger);
    GVar2 = trigger;
    if (bVar1 == false) {
      return trigger_event_flag_check((arg0->header).flagC,(arg0->header).Bitfeild,0x80);}
  }
  return = gamestate_cheat_check2(GVar2);}

bool some_dialouge_trigger_check(void){
  bool bVar1;
  GameState_Cheat GVar2;
  
  bVar1 = gamestate_cheat_check1(appear);
  GVar2 = appear;
  if (bVar1 == false) {
    bVar1 = gamestate_cheat_check1(dialougeTrigger);
    GVar2 = dialougeTrigger;
    if (bVar1 == false) {return true;}
  }
  return gamestate_cheat_check2(GVar2);}

bool savepoint_appear_check(void){
  bool bVar1;
  bool uVar2;
  
  bVar1 = gamestate_cheat_check1(appear);
  uVar2 = true;
  if (bVar1) {uVar2 = gamestate_cheat_check2(appear);}
  return (bool)uVar2;}

bool container_obj_check(container_obj *arg0,playerData *arg1){
  u16 uVar1;
  bool bVar2;
  bool ret;
  float fVar3;
  
  fVar3 = get_vec3_proximity(arg0,(arg1->collision).position);
  ret = false;
  if (fVar3 <= (arg0->dat).chestSize + arg1->scale_floatB) {
    bVar2 = gamestate_cheat_check1(check);
    if (bVar2 == false) {
      uVar1 = (arg0->dat).LootType;
      if ((7 < uVar1) || (ret = true, uVar1 < 4)) {
        bVar2 = container_open_check((arg0->dat).open_flag);
        ret = false;
        if ((bVar2 == false) &&
           ((((arg0->dat).Gold != 0 || ((arg0->dat).LootCat)) ||
            (ret = false, (arg0->dat).item))) {
          ret = true;
        }
      }
    }
    else {
      ret = gamestate_cheat_check2(check);
    }
  }
  return ret;}

undefined FUN_80014ba0(mapVoxel *arg0,vec3f *arg1){
  undefined uVar1;
  
  uVar1 = 0;
  if (get_vec3_proximity(arg0,arg1) <= (arg0->header).size) {
    uVar1 = trigger_event_flag_check((arg0->header).flagA,(arg0->header).Bitfeild,0x100);
  }
  return uVar1;}

bool some_gamestate_check_B(teleport_obj *arg0,playerData *arg1,bool istrue){
  if ((istrue) &&(get_vec3_proximity(arg0,(arg1->collision).position) >(arg0->header).size)) {return false;}
  if (gamestate_cheat_check1(check)) return gamestate_cheat_check2(check);
  return trigger_event_flag_check((arg0->header).flagA,(arg0->header).Bitfeild,0x100) != false;

bool teleporter_obj_check(teleport_obj *arg0,playerData *arg1){return some_gamestate_check_B(arg00,arg1,true);}

bool monsterparty_obj_check(void){
  if (gamestate_cheat_check1(check)) return gamestate_cheat_check2(check);
  return true;
  }

bool trigger_obj_check_prox(trigger_obj *arg0,playerData *arg1,bool param_3){
  if ((param_3) && (get_vec3_proximity(arg0,(arg1->collision).position) > (arg0->header).size) {return false;}
  if (gamestate_cheat_check1(check) == false) return gamestate_cheat_check2(check);
  return trigger_event_flag_check((arg0->header).flagA,(arg0->header).Bitfeild,0x100);
}

bool trigger_obj_check(trigger_obj *arg0,playerData *arg1){return trigger_obj_check_prox(arg0,arg1,true);}

bool dialouge_trigger_check(Dialoug_obj *arg0,vec3f *arg1,bool getProx){
  bool bVar1;
  bool uVar2;
  GameState_Cheat GVar2;
  float fVar3 = 0.0;
  

  if (getProx) {fVar3 = get_vec3_proximity(arg0,arg1);}
  uVar2 = false;
  if (fVar3 <= (arg0->header).size) {
    bVar1 = gamestate_cheat_check1(check);
    GVar2 = check;
    if (bVar1 == false) {
      bVar1 = gamestate_cheat_check1(dialougeTrigger);
      GVar2 = dialougeTrigger;
      if (bVar1 == false) {
        return trigger_event_flag_check((arg0->header).flagA,(arg0->header).Bitfeild,0x100);
      }
    }
    uVar2 = gamestate_cheat_check2(GVar2);
  }
  return uVar2;
}

bool dialoug_obj_func(Dialoug_obj *arg0,playerData *arg1){return dialouge_trigger_check(arg0,(arg1->collision).position,true);}

void dialoug_obj_check(s32 arg0,playerData *arg1){dialoug_obj_func(arg0,arg1);}

bool savepoint_prox_check(mapVoxel *arg0,playerData *arg1){return get_vec3_proximity(arg0,(arg1->collision).position); <= (arg0->header).size;}

u8 ret0_80014E38(void){return 0;}

void render_container(container_obj *param_1,Borg_9_data *param_2){
  if ((param_1->header).type == VOBJECT_CONTAINER) set_container_obj_visible(param_1,param_2);
}

void set_container_obj_visible(container_obj *param_1,Borg_9_data *param_2){
  u16 uVar1;
  mapVoxel *a;
  bool b;
  
  a = GetVoxelFromObjectLink(param_2,(mapVoxel *)param_1,Scene);
  uVar1 = (param_1->dat).LootType;
  b = true;
  if ((uVar1 < 8) && (3 < uVar1)) {
    b = SUB21((param_1->header).Bitfeild >> 0xf,0);
  }
  set_voxel_visibility(a,b);}

u8 textbox_func_AB(s32 param_1,widgetStruct *param_2){
  set_widgets_byte0x70(param_2,5);
  gGlobals.PlayerChar.text_window = NULL;
  return 0;}

u8 secretdoor_widget_AB(s32 param_1,widgetStruct *param_2){
  teleporter_func((teleport_obj *)param_2->prt0x40);
  set_widgets_byte0x70(param_2,5);
  gGlobals.PlayerChar.text_window = NULL;
  return 0;
}

widgetStruct * textbox_func(char *param_1){
  color32 col1=OFFWHITE;
  color32 col2=DARKGRAY;
  gGlobals.PlayerChar.text_window = some_textbox_func(param_1,0x96,&col1,&col2,1);
  (gGlobals.PlayerChar.text_window)->AbuttonFunc = textbox_func_AB;
  (gGlobals.PlayerChar.text_window)->BButtonFunc = textbox_func_AB;
  (gGlobals.PlayerChar.text_window)->CDownFunc = NULL;
  (gGlobals.PlayerChar.text_window)->CUpFunc = NULL;
  return gGlobals.PlayerChar.text_window;}

bool container_open_check(EventFlag param_1){
  if (gamestate_cheat_check1(containerExplode)) return gamestate_cheat_check2(containerExplode);
  return getEventFlag(param_1);
}
bool container_explode_check(EventFlag param_1){
  if (gamestate_cheat_check1(containerExplode)) return gamestate_cheat_check2(containerExplode);
  return getEventFlag(param_1);
}
bool teleport_lock_check(EventFlag param_1){
  if (gamestate_cheat_check1(teleportLock)) return gamestate_cheat_check2(teleportLock);
  return getEventFlag(param_1);
}
bool teleport_trap_check(EventFlag param_1){
  if (gamestate_cheat_check1(teleportTrap)) return gamestate_cheat_check2(teleportTrap);
  return getEventFlag(param_1);
}

bool teleport_secret_check(EventFlag param_1){
  if (gamestate_cheat_check1(teleportSecret)) return gamestate_cheat_check2(teleportSecret);
  return getEventFlag(param_1);
}

bool FUN_80015128(EventFlag param_1,u32 param_2){
  bool bVar1, bVar2;
  u8 bVar3;
  
  bVar3 = (u8)(param_2 >> 8) & 1;
  bVar2 = bVar3;
  if ((param_1 != 0) && (bVar2 = bVar3 ^ 1, param_1 != 1)) {bVar2 = getEventFlag(param_1); ^ bVar3;}
  return bVar2;}


bool trigger_event_flag_check(EventFlag param_1,ref_obj_bitfeild param_2,ref_obj_bitfeild param_3){
  bool bVar1;
  bool uVar2;
  
  bVar1 = (param_3 & param_2) != 0;
  uVar2 = bVar1;
  if ((param_1 != 0) && (bVar1 = !bVar1, param_1 != 1)) {
    bVar1 = 0 < getEventFlag(param_1) ^ uVar2);}
  return bVar1;}

undefined ref_obj_bitmask_flag(EventFlag param_1,ref_obj_bitfeild param_2,ref_obj_bitfeild param_3){
  setEventFlag(param_1,(param_3 & param_2) == 0);
  return getEventFlag(0x15fa);}

bool FUN_8001520c(teleport_obj *param_1){
  if ((param_1->dat).secretDoorVal == 0) return false;
  return getEventFlag((param_1->dat).secrect_door_flag)==false;}

bool secret_door_func(teleport_obj *param_1){
  widgetStruct *pwVar1;
  bool bVar2;
  
  pwVar1 = textbox_func(commonstringsmirror->discovered secret door);
  (param_1->dat).secretDoorVal = 0;
  setEventFlag((param_1->dat).secrect_door_flag,true);
  bVar2 = getEventFlag(0x15fa);
  pwVar1->prt0x40 = param_1;
  pwVar1->AbuttonFunc = secretdoor_widget_AB;
  pwVar1->BButtonFunc = secretdoor_widget_AB;
  return bVar2;}
