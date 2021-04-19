void func_80013620(container_obj *arg0,short arg1,Borg_9_data *param_3){
  Scene_obj *prVar1 = (Scene_obj *)GetVoxelFromObjectLink(param_3,(ref_obj *)arg0,Scene);
  if ((prVar1->dat).field_0x8 != null) {
    AllocFreeQueueItem(&queueStructA,&(prVar1->dat).field_0x8,
                       (ushort)(((prVar1->dat).field_0x42 & 2) == 0),0);
    (prVar1->dat).field_0x8 = null;
  }
  (prVar1->dat).field_0x4 = (prVar1->dat).field_0x30[arg1 * 3 + -0xb];
}

void play_countainer_sound(container_obj *arg0,Borg_9_data * arg1){
  play_SFX(&SFXStruct,containerSounds[(arg0->dat).LootType],0,SFX_vol,0xb4,0);
  func_80013620(arg0,1,arg1);}

void open_explosive_chest(container_obj *arg0,Borg_9_data *arg1){
  int iVar1;
  int iVar2;
  vec4 fStack96;
  iVar2 = 0x10000;
  alloc_explosion_light((vec3 *)arg0,1.0,600,0);
  do {
    alloc_explosion_light((vec3 *)arg0,0.35,0x3c,1);
    iVar1 = iVar2 >> 0x10;
    iVar2 = iVar2 + 0x10000;
  } while (iVar1 < 3);
  fStack96 = {0.35f,0.3f,0.25f,1.0f};
  chest_explode_particles
            (arg0,(arg0->header).coords[1],(vec4 *)fStack96,0x1a4,2,0x4b,0.04f,
             0.06f,-8.5714285E-4f,1);
  (arg0->dat).Gold = 0;
  (arg0->dat).LootCat = (ItemID)0x0;
  func_80013620(arg0,2,arg1);
  setEventFlag((arg0->dat).explode_flag,true);
  get_event_flag(0x15fa);
  play_SFX(&SFXStruct,chestExplodeSFX[rand_range_(&gGlobals,0,3)],0,SFX_vol,0xf0,0);
  set_voxel_visibility((ref_obj *)arg0,false);
  return;
}
void NOOP_tp(void){}

//activaction funcs
void run_voxelFuncs0(ref_obj *arg0){(*voxelFuncs0[(arg0->header).type])(arg0);}
//visibility check, i think
bool run_voxelFuncs2(ref_obj *arg0){return (*run_voxelFuncs2[(arg0->header).type])(arg0);}
//collision
bool run_voxelFuncs1(ref_obj *arg0,playerData *arg1){return (*run_voxelFuncs1[(arg0->header).type])(arg0,arg1);}

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
  
  if (vobject_pause_check() != false) {
    if (((arg0->header).Bitfeild & tangible) == 0) {
      EVar1 = (arg0->dat).secrect_door_flag;
      if ((EVar1 == 0) || (get_event_flag(EVar1) != false)) {
        if (teleport_trap(arg0) == false) {
          if (((arg0->dat).lock_lv != 0) &&
             (Teleport_lock_check((arg0->dat).lock_flag) == false)) {
            if ((arg0->dat).lock_lv != 0) {
              lockpicking_check((ref_obj *)arg0);
              return;
            }
            setEventFlag((arg0->dat).lockpick_flag_2,true);
            get_event_flag(0x15fa);
            get_event_flag(0x15fa);
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
  ref_obj *a;
  longlong lVar1;
  Inventory_struct *pIVar2;
  float fVar3;
  uint uVar4;
  
  fVar3 = (float)(uint)arg1->Gold * RangerIngredientFloat;
  if (INT_MAX_F <= fVar3) {fVar3-= INT_MAX_F;}
  uVar4 = (uint)fVar3;
  if (uVar4 == 0) {uVar4 = 1;}
  ref_obj_bitmask_flag((arg0->header).flagB,(arg0->header).Bitfeild,Used);
  set_voxel_visibility((ref_obj *)arg0,false);
  a = GetVoxelFromObjectLink(gGlobals.Sub.borg9DatPointer,(ref_obj *)arg0,Scene);
  if (a != null) {set_voxel_visibility(a,false);}
  if (exploding_container_check(arg0,gGlobals.Sub.borg9DatPointer) != 0) {
    passto_WriteTo_VoxelChart
              ((short)((int)((int)arg0 - (int)gGlobals.Sub.borg9DatPointer->ref_objs) * 0x684bda13 >> 2),
               (undefined)map_dat_A,(undefined)MapShortA,(undefined)mapShortB,0x11,
               *(undefined *)((int)&(arg0->header).type + 1),10);
  }
  pIVar2 = (Inventory_struct *)passToMalloc(0x608);
  pIVar2 = build_inventory_struct(pIVar2);
  (*(pIVar2->Functions->add_to_inv).func)
            ((int)pIVar2->inv_slots + (short)(pIVar2->Functions->add_to_inv).arg[0] + -4,
             item_pointer->Gear[LootReagentIDs[arg1->LootType]].ID,
             uVar4);
  build_loot_menu(pIVar2,0,-1);
  PlayerCharStruct.camping_var = 7;
  return;}


void loot_func(container_obj *arg0){
  short sVar1;
  ItemID IVar2;
  short sVar3;
  float vol;
  short *psVar5;
  bool bVar9;
  longlong lVar4;
  ushort uVar8;
  ref_obj *a;
  int iVar6;
  void *ppfVar10;
  Inventory_struct *pIVar7;
  uint uVar10;
  container_Dat *pcVar11;
  uint uVar12;
  undefined2 uVar13;
  short aIStack96 [8] [2];
  
  pcVar11 = &arg0->dat;
  psVar5 = some_ref_obj_lookup_func
                     ((short)((int)((int)arg0 - (int)gGlobals.Sub.borg9DatPointer->ref_objs) * 0x684bda13
                             >> 2),(char)map_dat_A,(byte)MapShortA,(byte)mapShortB,0x11,
                      *(undefined *)((int)&(arg0->header).type + 1));
  bVar9 = container_open_check((arg0->dat).open_flag);
  if (((bVar9 == false) && (psVar5 == (short *)0x0)) &&
     (lVar4 = container_explode_check((arg0->dat).explode_flag), lVar4 == 0)) {
    uVar8 = (arg0->dat).LootType;
    if (uVar8 < 4) {uVar8 = (arg0->dat).unk0x14;}
    else {
      if (uVar8 < 7) {
        get_loot_reagent(arg0,pcVar11);
        return;
      }
      if (uVar8 == 7) {
        set_voxel_visibility((ref_obj *)arg0,false);
        ref_obj_bitmask_flag((arg0->header).flagB,(arg0->header).Bitfeild,Used);
        uVar8 = (arg0->dat).unk0x14;
      }
      else {uVar8 = (arg0->dat).unk0x14;}
    }
    if (uVar8 == 0) {sVar1 = (arg0->dat).field_0x14;}
    else {
      if ((arg0->dat).trap_lv != 0xff) {
        gauge_trap_danger(arg0);
        return;
      }
      sVar1 = (arg0->dat).field_0x14;
    }
    if (sVar1 == 0) {
      uVar13 = 0;
      setEventFlag((arg0->dat).open_flag,true);
      get_event_flag(0x15fa);
      set_refObj_flag((ref_obj *)arg0);
      if ((arg0->dat).LootType == 7) {
        a = GetVoxelFromObjectLink(gGlobals.Sub.borg9DatPointer,(ref_obj *)arg0,Scene);
        set_voxel_visibility(a,false);
        IVar2 = (arg0->dat).LootCat;
      }
      else {
        uVar13 = 0x3c;
        play_countainer_sound(arg0,gGlobals.Sub.borg9DatPointer);
        IVar2 = (arg0->dat).LootCat;
      }
      uVar12 = 0;
      if (IVar2 != (ItemID)0x0) {
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
      set_voxel_visibility((ref_obj *)arg0,false);
      IVar2 = (arg0->dat).item;
      uVar10 = uVar12;
      if (IVar2 != null) {
        uVar10 = uVar12 + 1 & 0xff;
        *(ItemID *)aIStack96[uVar12][0] = IVar2;
        aIStack96[uVar12][1] = 1;
      }
      if ((container_explode_check((arg0->dat).explode_flag) == 0) &&
      (container_open_check((arg0->dat).open_flag) == false))
      {
        passto_WriteTo_VoxelChart
                  ((short)((int)((int)arg0 - (int)gGlobals.Sub.borg9DatPointer->ref_objs) * 0x684bda13 >> 2
                          ),(char)map_dat_A,(byte)MapShortA,(byte)mapShortB,0x11,
                   *(undefined *)((int)&(arg0->header).type + 1),10);
      }
      if (uVar10 == 0) {
        sprintf(gGlobals.Text,commonstringsmirror->"you just picked up gold",
                    (arg0->dat).Gold);
        textbox_func(gGlobals.Text);
        gGlobals.party->Gold+= (arg0->dat).Gold;
        play_SFX(&SFXStruct,Coins_jingle,0,SFX_vol,300,uVar13);
      }
      else {
        ppfVar10 = passToMalloc(0x608);
        pIVar7 = build_inventory_struct((Inventory_struct *)ppfVar10);
        uVar12 = 0;
        if (uVar10 != 0) {
          do {
            (*(pIVar7->Functions->add_to_inv).func)
                      ((int)pIVar7->inv_slots + (short)(pIVar7->Functions->add_to_inv).arg[0] + -4,
                       aIStack96[uVar12][0],
                       aIStack96[uVar12][1]);
            uVar12++;
          } while (uVar12 < uVar10);
        }
        build_loot_menu(pIVar7,(uint)(arg0->dat).Gold,-1);
        PlayerCharStruct.camping_var = 0x13;
        if ((arg0->dat).LootType == 7) {
          PlayerCharStruct.camping_var = 7;
        }
      }
    }
    else {lockpicking_check((ref_obj *)arg0);}
  }
  else {
set_voxel_visibility((ref_obj *)arg0,false);
  }
  return;
}

byte monsterpary_func(monsterparty_obj *arg0,undefined arg1,char param_3){
  byte bVar1;
  vec3 *playerPos;
  vec3 *c;
  void *piVar4;
  float x;
  float fVar2;
  vec3 afStack104;
  playerData *iVar1;
  
  if (arg0->borg_13 == 0) {
    playerPos = (vec3 *)((PlayerCharStruct.playerDat)->collision).position;
    piVar4 = (gGlobals.wander.wanderSubstructs)->start_position +
             (uint)arg0->field_0x4c * 0x14 + (uint)arg0->field_0x4c + -1;
    iVar1 = *piVar4;
    c = (vec3 *)(iVar1->collision).position;
    Vec3_sub((vec3 *)afStack104,c,playerPos);
    x = vec3_normalize((vec3 *)afStack104);
    setVec3((vec3 *)afStack104,-iVar1->facing[0],0.0,-iVar1->facing[1]);
    vec3_normalize((vec3 *)afStack104);
    multiVec3((vec3 *)afStack104,x);
    vec3_sum((vec3 *)afStack104,(vec3 *)afStack104,c);
    Vec3_sub((vec3 *)afStack104,(vec3 *)afStack104,playerPos);
    fVar2 = vec3_normalize((vec3 *)afStack104);
    encounter_dat.collisionBool = x <= fVar2;
    encounter_dat.field_0x28 = 0;
    battle_setup_func(arg0,(arg0->header).flagB,*(undefined2 *)((int)piVar4 + 0x50));
    bVar1 = 2;
    PlayerCharStruct.camping_var = 2;
  }
  else {
    bVar1 = (byte)arg0->flags & 4;
    if ((arg0->flags & 4) == 0) {
      dialoug_func(arg0->borg_13,0,map_dat_A,MapShortA,mapShortB,(short)param_3);
      monsterparty_wanderstruct
                ((gGlobals.wander.wanderSubstructs)->start_position +
                 (uint)arg0->field_0x4c * 0x14 + (uint)arg0->field_0x4c + -1);
      setEventFlag((arg0->header).flagB,true);
      bVar1 = get_event_flag(0x15fa);
    }
  }
  return bVar1;
}

void trigger_vobject_func(trigger_obj *arg0)

{
  Borg_7_header *pBVar1;
  borg9_phys *pbVar2;
  Borg_9_data *pBVar3 = gGlobals.Sub.borg9DatPointer;
  Scene_obj *prVar3;
  int iVar5;
  ushort uVar6;
  voxelHeader *iVar4;
  EventFlag EVar7;
  uint uVar8;
  
  
  switch(arg0->triggertype) {
  case 1:
    setEventFlag(arg0->flagA,true);
    get_event_flag(0x15fa);
    set_refObj_flag((ref_obj *)arg0);
    EVar7 = (arg0->header).flagB;
    break;
  case 2:
    prVar3 = (Scene_obj *)GetVoxelFromObjectLink(gGlobals.Sub.borg9DatPointer,(ref_obj *)arg0,Scene)
    ;
    pBVar1 = (prVar3->dat).field_0x8;
    if (pBVar1 == (Borg_7_header *)0x0) {
      EVar7 = (arg0->header).flagB;
    }
    else {
      func_800a0090(pBVar1,arg0->flagA);
      EVar7 = (arg0->header).flagB;
    }
    break;
  case 4:
    uVar8 = 0;
    if ((gGlobals.Sub.borg9DatPointer)->borghpys_count != 0) {
      pbVar2 = (gGlobals.Sub.borg9DatPointer)->phys_pointer;
      iVar5 = 0;
      do {
        iVar4 = (voxelHeader *)((int)pbVar2->voxelPointers + iVar5);
        if (((iVar4->flagB & 0xf000) == 0x1000) && ((iVar4->flagB >> 5 & 0x7f) == arg0->flagA)) {
          uVar6 = iVar4->flagA & arg0->field_0x2e;
          iVar4->flagA = uVar6;
          iVar4->flagA = uVar6 | arg0->field_0x30;
        }
        uVar8 = uVar8 + 1 & 0xffff;
        iVar5 = uVar8 << 5;
      } while (uVar8 < pBVar3->borghpys_count);
    }
  default:
    EVar7 = (arg0->header).flagB;
  }
  ref_obj_bitmask_flag(EVar7,(arg0->header).Bitfeild,Used);
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
  if (vobject_pause_check() != false) {
    dialoug_func((uint)(arg0->dat).borg_13,(arg0->dat).field_0x8,(arg0->dat).field_0x2,
                 (arg0->dat).field_0x4,(arg0->dat).field_0x6,(short)param_3);
  }
}


bool check_reference_object(ref_obj *arg0){
  EventFlag EVar1;
  bool bVar2;
  bool bVar3;
  ushort uVar3;
  
  if(gamestate_cheat_check1(appear)){return gamestate_cheat_check2(appear);}
  EVar1 = (arg0->header).flagC;
  uVar3 = (arg0->header).Bitfeild >> 7 & 1;
  bVar3 = (bool)(byte)uVar3;
  if (EVar1 != 0) {
    if (EVar1 == 1) {bVar3 = uVar3 == 0;}
    else {bVar3 = (bool)(get_event_flag(EVar1) ^ bVar3);}
    }
  return bVar3;
}

bool scene_object_check(ref_obj *arg0){
  bool bVar1;
  bool uVar2;

  bVar1 = gamestate_cheat_check1(referenceObject);
  if (bVar1 == false) {uVar2 = check_reference_object(arg0);}
  else {uVar2 = gamestate_cheat_check2(referenceObject);}
  return uVar2;}

bool exploding_container_sub(container_obj *arg0,Borg_9_data *arg1){
  bool bVar2;
  short *psVar1;
  bool uVar3;
  
  bVar2 = trigger_event_flag_check((arg0->header).flagC,(arg0->header).Bitfeild,0x80);
  if ((bVar2 == false) ||
     (some_ref_obj_lookup_func
                         ((short)((int)((int)arg0 - (int)arg1->ref_objs) * 0x684bda13 >> 2),
                          (char)map_dat_A,(byte)MapShortA,(byte)mapShortB,0x11,
                          *(undefined *)((int)&(arg0->header).type + 1)) != null))
    {uVar3 = false;}
  else {uVar3 = trigger_event_flag_check((arg0->header).flagA,(arg0->header).Bitfeild,0x100);}
  return uVar3;
}

char exploding_container_check(container_obj *arg0,Borg_9_data *arg1){
  ushort uVar1;
  ref_obj *a;
  bool bVar4;
  char cVar5;
  short *psVar3;
  longlong lVar2;
  
  a = GetVoxelFromObjectLink(arg1,(ref_obj *)arg0,Scene);
  bVar4 = gamestate_cheat_check1(appear);
  if (bVar4 == false) {
    uVar1 = (arg0->dat).LootType;
    if ((7 < uVar1) || (uVar1 < 4)) {
      set_voxel_visibility(a,true);
      set_voxel_visibility((ref_obj *)arg0,true);
      psVar3 = some_ref_obj_lookup_func
                         ((short)((int)((int)arg0 - (int)arg1->ref_objs) * 0x684bda13 >> 2),
                          (char)map_dat_A,(byte)MapShortA,(byte)mapShortB,0x11,
                          *(undefined *)((int)&(arg0->header).type + 1));
      bVar4 = container_open_check((arg0->dat).open_flag);
      if ((bVar4 == false) && (psVar3 == (short *)0x0)) {
        if (container_explode_check((arg0->dat).explode_flag) == 0) {return 1;}
        func_80013620(arg0,2,arg1);
      }
      else {
        func_80013620(arg0,1,arg1);
        (arg0->dat).field_0x14 = 0;
        (arg0->dat).unk0x14 = 0;
        (arg0->dat).Gold = 0;
      }
      set_voxel_visibility((ref_obj *)arg0,false);
      return 0;
    }
    cVar5 = exploding_container_sub(arg0,arg1);
  }
  else {cVar5 = gamestate_cheat_check2(appear);}
  set_voxel_visibility(a,cVar5 != 0);
  set_voxel_visibility((ref_obj *)arg0,cVar5 != 0);
  return cVar5;}

bool TP_lock_secret_check(teleport_obj *arg0){
  ushort uVar1;
  bool bVar2;
  bool uVar3;
  byte bVar4;
  
  if(gamestate_cheat_check1(appear)){return gamestate_cheat_check2(appear);}
    bVar2 = trigger_event_flag_check((arg0->header).flagC,(arg0->header).Bitfeild,0x80);
    uVar3 = false;
    if (bVar2 != false) {
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
        if (teleport_trap_check((arg0->dat).trap_flag) != false) {(arg0->dat).trapBool16 = 0;}
        uVar1 = (arg0->dat).lock_lv;
      }
      uVar3 = true;
      if (uVar1 != 0) {
        if (Teleport_lock_check((arg0->dat).lock_flag) != false) {(arg0->dat).lock_lv = 0;}
        uVar3 = true;
      }
    }
  return uVar3;
}

bool some_monster_check(monsterparty_obj *arg0){
  EventFlag EVar1;
  bool bVar2;
  undefined uVar3;
  bool bVar4;
  
  if(gamestate_cheat_check1(appear)){return gamestate_cheat_check2(appear);}
  if(gamestate_cheat_check1(monsterCheck)){return gamestate_cheat_check2(monsterCheck);}
      EVar1 = (arg0->header).flagA;
      if (arg0->dat.borg_13 == 0) {
        bVar2 = func_80015128(EVar1,(uint)(arg0->header).Bitfeild);
        bVar4 = get_event_flag((arg0->header).flagB);
        uVar3 = bVar2 != false && bVar4 == false;
      }
      else {uVar3 = func_80015128(EVar1,(uint)(arg0->header).Bitfeild);}
  return (bool)uVar3;
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
  ushort uVar1;
  bool bVar2;
  bool ret;
  float fVar3;
  
  fVar3 = get_vec3_proximity((vec3 *)arg0,(arg1->collision).position);
  ret = false;
  if (fVar3 <= (arg0->dat).chest_size + arg1->scale_floatB) {
    bVar2 = gamestate_cheat_check1(check);
    if (bVar2 == false) {
      uVar1 = (arg0->dat).LootType;
      if ((7 < uVar1) || (ret = true, uVar1 < 4)) {
        bVar2 = container_open_check((arg0->dat).open_flag);
        ret = false;
        if ((bVar2 == false) &&
           ((((arg0->dat).Gold != 0 || ((arg0->dat).LootCat != (ItemID)0x0)) ||
            (ret = false, (arg0->dat).item != (ItemID)0x0)))) {
          ret = true;
        }
      }
    }
    else {
      ret = gamestate_cheat_check2(check);
    }
  }
  return ret;}

undefined Ofunc_80014ba0(ref_obj *arg0,vec3 *arg1){
  undefined uVar1;
  float fVar2;
  
  fVar2 = get_vec3_proximity((vec3 *)arg0,arg1);
  uVar1 = 0;
  if (fVar2 <= (arg0->header).size) {
    uVar1 = trigger_event_flag_check((arg0->header).flagA,(arg0->header).Bitfeild,0x100);
  }
  return uVar1;}

bool some_gamestate_check_B(teleport_obj *arg0,playerData *arg1,bool istrue){
  bool bVar1;
  bool uVar2;
  
  if ((istrue != false) &&
     (get_vec3_proximity((vec3 *)arg0,(vec3 *)(arg1->collision).position) >
     (arg0->header).size)) {return false;}
  bVar1 = gamestate_cheat_check1(check);
  if (bVar1 == false) {
    bVar1 = trigger_event_flag_check((arg0->header).flagA,(arg0->header).Bitfeild,0x100);
    uVar2 = bVar1 != false;
  }
  else {uVar2 = gamestate_cheat_check2(check);}
  return uVar2;}

bool teleporter_obj_check(teleport_obj *arg0,playerData *arg1){return some_gamestate_check_B(arg00,arg1,true);}

bool monsterparty_obj_check(void){
  bool bVar1;
  bool uVar2;
  
  bVar1 = gamestate_cheat_check1(check);
  uVar2 = true;
  if (bVar1) {uVar2 = gamestate_cheat_check2(check);}
  return uVar2;}

bool trigger_obj_check_prox(trigger_obj *arg0,playerData *arg1,bool param_3){
  bool bVar1;
  bool uVar2;
  float fVar2;
  
  if ((param_3) &&
     (get_vec3_proximity((vec3 *)arg0,(vec3 *)(arg1->collision).position)
      > (arg0->header).size) {
    return false;
  }
  bVar1 = gamestate_cheat_check1(check);
  if (bVar1 == false) {
    uVar2 = trigger_event_flag_check((arg0->header).flagA,(arg0->header).Bitfeild,0x100);
  }
  else {uVar2 = gamestate_cheat_check2(check);}
  return uVar2;
}

bool trigger_obj_check(trigger_obj *arg0,playerData *arg1){
    return trigger_obj_check_prox(arg0,arg1,true);}

bool dialouge_trigger_check(Dialoug_obj *arg0,vec3 *arg1,bool getProx){
  bool bVar1;
  bool uVar2;
  GameState_Cheat GVar2;
  float fVar3 = 0.0;
  

  if (getProx) {fVar3 = get_vec3_proximity((vec3 *)arg0,arg1);}
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

undefined dialoug_obj_func(Dialoug_obj *arg0,playerData *arg1){
  return dialouge_trigger_check(arg0,(arg1->collision).position,true);
}

void dialoug_obj_check(undefined4 arg0,playerData *arg1){dialoug_obj_func(arg0,arg1);}

bool savepoint_prox_check(ref_obj *arg0,playerData *arg1){
  return get_vec3_proximity((vec3 *)arg0,(vec3 *)(arg1->collision).position); <= (arg0->header).size;
}

byte ret0_80014E38(void){return 0;}

void render_container(container_obj *param_1,Borg_9_data *param_2){
  if ((param_1->header).type == CONTAINER) {set_container_obj_visible(param_1,param_2);}
  return;
}

void set_container_obj_visible(container_obj *param_1,Borg_9_data *param_2){
  ushort uVar1;
  ref_obj *a;
  bool b;
  
  a = GetVoxelFromObjectLink(param_2,(ref_obj *)param_1,Scene);
  uVar1 = (param_1->dat).LootType;
  b = true;
  if ((uVar1 < 8) && (3 < uVar1)) {
    b = SUB21((param_1->header).Bitfeild >> 0xf,0);
  }
  set_voxel_visibility(a,b);}

byte textbox_func_AB(undefined4 param_1,widgetStruct *param_2){
  set_widgets_byte0x70(param_2,5);
  gGlobals.PlayerChar.text_window = null;
  return 0;}

byte secretdoor_widget_AB(undefined4 param_1,widgetStruct *param_2){
  teleporter_func((teleport_obj *)param_2->prt0x40);
  set_widgets_byte0x70(param_2,5);
  gGlobals.PlayerChar.text_window = (widgetStruct *)0x0;
  return 0;
}

widgetStruct * textbox_func(char *param_1){
  color col1=OFFWHITE;
  color col2=DARKGRAY;
  gGlobals.PlayerChar.text_window = some_textbox_func(param_1,0x96,&col1,&col2,1);
  (gGlobals.PlayerChar.text_window)->AbuttonFunc = textbox_func_AB;
  (gGlobals.PlayerChar.text_window)->BButtonFunc = textbox_func_AB;
  (gGlobals.PlayerChar.text_window)->CDownFunc = null;
  (gGlobals.PlayerChar.text_window)->CUpFunc = null;
  return gGlobals.PlayerChar.text_window;}

bool container_open_check(EventFlag param_1){
  bool bVar1, uVar2;
  
  bVar1 = gamestate_cheat_check1(containerOpen);
  if (bVar1 == false) {uVar2 = get_event_flag(param_1);}
  else {uVar2 = gamestate_cheat_check2(containerOpen);}
  return uVar2;}

bool container_explode_check(EventFlag param_1){
  bool bVar1, uVar2;
  
  bVar1 = gamestate_cheat_check1(containerExplode);
  if (bVar1 == false) {uVar2 = get_event_flag(param_1);}
  else {uVar2 = gamestate_cheat_check2(containerExplode);}
  return uVar2;}

bool teleport_lock_check(EventFlag param_1){
  bool bVar1, uVar2;
  
  bVar1 = gamestate_cheat_check1(teleportLock);
  if (bVar1 == false) {uVar2 = get_event_flag(param_1);}
  else {uVar2 = gamestate_cheat_check2(teleportLock);}
  return uVar2;}

bool teleport_trap_check(EventFlag param_1){
  bool bVar1, uVar2;
  
  bVar1 = gamestate_cheat_check1(teleportTrap);
  if (bVar1 == false) {uVar2 = get_event_flag(param_1);}
  else {uVar2 = gamestate_cheat_check2(teleportTrap);}
  return uVar2;}

bool teleport_secret_check(EventFlag param_1){
  bool bVar1, uVar2;
  
  bVar1 = gamestate_cheat_check1(teleportSecret);
  if (bVar1 == false) {uVar2 = get_event_flag(param_1);}
  else {uVar2 = gamestate_cheat_check2(teleportSecret);}
  return uVar2;}

bool func_80015128(EventFlag param_1,uint param_2){
  bool bVar1, bVar2;
  byte bVar3;
  
  bVar3 = (byte)(param_2 >> 8) & 1;
  bVar2 = bVar3;
  if ((param_1 != 0) && (bVar2 = bVar3 ^ 1, param_1 != 1)) {
    bVar2 = get_event_flag(param_1); ^ bVar3;
  }
  return bVar2;}


bool trigger_event_flag_check(EventFlag param_1,ref_obj_bitfeild param_2,ref_obj_bitfeild param_3){
  bool bVar1;
  bool uVar2;
  
  bVar1 = (param_3 & param_2) != 0;
  uVar2 = bVar1;
  if ((param_1 != 0) && (bVar1 = !bVar1, param_1 != 1)) {
    bVar1 = 0 < get_event_flag(param_1) ^ uVar2);}
  return bVar1;}

undefined ref_obj_bitmask_flag(EventFlag param_1,ref_obj_bitfeild param_2,ref_obj_bitfeild param_3){
  setEventFlag(param_1,(param_3 & param_2) == 0);
  return get_event_flag(0x15fa);}

bool Ofunc_8001520c(teleport_obj *param_1){
  bool bVar1;
  
  if ((param_1->dat).secretDoorVal == 0) {bVar1 = false;}
  else {
    bVar1 = get_event_flag((param_1->dat).secrect_door_flag)==false;}
  return bVar1;}

bool secret_door_func(teleport_obj *param_1){
  widgetStruct *pwVar1;
  bool bVar2;
  
  pwVar1 = textbox_func(commonstringsmirror->discovered secret door);
  (param_1->dat).secretDoorVal = 0;
  setEventFlag((param_1->dat).secrect_door_flag,true);
  bVar2 = get_event_flag(0x15fa);
  pwVar1->prt0x40 = param_1;
  pwVar1->AbuttonFunc = secretdoor_widget_AB;
  pwVar1->BButtonFunc = secretdoor_widget_AB;
  return bVar2;}
