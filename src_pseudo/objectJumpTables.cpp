#include "gamestateCheats.h"
#include "eventFlag.h"
#include "globals.h"
#include "inventory\GenericInventory.h"
#include "n64Borg.h"

typedef void (VoxelUse)(voxelObject*,u8,u8);
typedef u8 (VoxelProx)(voxelObject*,playerData*);
typedef u8 (VoxelFunc2)(voxelObject*);

void* gVoxelUseFuncs[]={
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
};
void* gVoxelProxFuncs[]={
  VoxelObj_Ret0,
  container_obj_check,
  VoxelObj_Ret0,
  VoxelObj_Ret0,
  VoxelObj_Ret0,
  monsterparty_obj_check,
  VoxelObj_Ret0,
  teleporter_obj_check,
  VoxelObj_Ret0,
  dialoug_obj_check,
  trigger_obj_check,
  savepoint_prox_check,
  VoxelObj_Ret0
};
void* gVoxelFuncs2[]={
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
};
u32 teleportTimestamp;



void replace_container_voxel(voxelObject *param_1,u16 param_2,Borg9data *param_3){
  
  voxelObject* prVar1 = GetVoxelFromObjectLink(param_3,param_1,VOXEL_Scene);
  if ((prVar1->scene).borgArray[0].borgheader) {
    AllocFreeQueueItem(&gGlobals.QueueA,&(prVar1->scene).borgArray[0].borgheader,
                       (ushort)(((prVar1->scene).sceneflags & 2) == 0),0);
    (prVar1->scene).borgArray[0].borgheader = NULL;
  }
  (prVar1->scene).borgArray[0].borgIndex = (prVar1->scene).borgArray[param_2].borgIndex;
}


void play_countainer_sound(voxelObject* param_1,Borg9data *param_2){
  u32 containerSounds [8]={0x729,0x72A,0x72B,0x72C,0x729,0x729,0x729,0x729};
  play_SFX(&gGlobals.SFXStruct,containerSounds[(param_1->container).LootType],0,gGlobals.VolSFX,0xb4,0);
  replace_container_voxel(param_1,1,param_2);
}


void open_explosive_chest(voxelObject* param_1,Borg9data *param_2){
  int iVar1;
  int iVar2;
  Borg12Enum aBStack_a0 [16];
  vec4f particleCol;
  
  aBStack_a0[0] = chestExplodeSFX[0];
  aBStack_a0[1] = chestExplodeSFX[1];
  aBStack_a0[2] = chestExplodeSFX[2];
  aBStack_a0[3] = chestExplodeSFX[3];
  alloc_explosion_light(param_1->header.pos,1.0,600,false);
  for(s16 i=0;i<3;i++) {
    alloc_explosion_light(param_1->header.pos,0.35,0x3c,true);
  }
  particleCol.x = 0.35f;
  particleCol.y = 0.3f;
  particleCol.z = 0.25f;
  particleCol.w = 1.0f;
  chest_explode_particles(param_1,(param_1->header).pos.y,&particleCol,420,2,75,0.04f,
             0.06f,-0.00085714285,1);
  (param_1->dat).Gold = 0;
  (param_1->dat).LootCat.type = Empty;
  (param_1->dat).LootCat.ID = 0;
  replace_container_voxel(param_1,2,param_2);
  setEventFlag((param_1->dat).explodeFlag,true);
  getEventFlag(0x15fa);
  play_SFX(&gGlobals.SFXStruct,chestExplodeSFX[RAND.Range(0,3)],0,gGlobals.VolSFX,240,0);
  set_voxel_visibility((voxelObject *)param_1,false);
}

void NOOP_tp(void){}

//activaction funcs
void run_voxelFuncs0(voxelObject *arg0){(*gVoxelUseFuncs[(arg0->header).type])(arg0);}
//visibility check, i think
bool run_voxelFuncs2(voxelObject *arg0){return (*gVoxelFuncs2[(arg0->header).type])(arg0);}
//collision
bool run_voxelFuncs1(voxelObject *arg0,playerData *arg1){return (*gVoxelProxFuncs[(arg0->header).type])(arg0,arg1);}

void Voxel_func_NOOP(voxelObject* arg0){}

bool teleport_trap(voxelObject* arg0){
  bool bVar1;
  
  bVar1 = false;
  if ((arg0->teleport).trapBool16) {
    bVar1 = false;
    if (((!teleport_trap_check((arg0->teleport).TrapFlag)) && 
    (bVar1 = false, (arg0->teleport).trap_value != -1)) &&
       (bVar1 = false, (arg0->teleport).trapBool16)) {
      gauge_trap_danger(arg0);
      bVar1 = true;
    }
  }
  return bVar1;
}

void teleporter_func(voxelObject* arg0){  
  if (vobject_pause_check()) {
    if (((param_1->header).Bitfeild & VOXEL_tangible) == 0) {
      EVar1 = (param_1->teleport).secrect_door_flag;
      if (((param_1->teleport).secrect_door_flag == 0) || (getEventFlag((param_1->teleport).secrect_door_flag))) {
        if (!teleport_trap(param_1)) {
          if (((param_1->teleport).lock_lv) &&
             (!Teleport_lock_check((param_1->teleport).lock_flag))) {
            if ((param_1->teleport).lock_lv) {
              lockpicking_check(param_1);
              return;
            }
            setEventFlag((param_1->teleport).lockpick_flag_2,true);
            getEventFlag(0x15fa);
            getEventFlag(0x15fa);
          }
          teleportTimestamp = gGlobals.ticker;
          NOOP_tp();
          set_teleport_pointer(param_1);
        }
      }
      else secret_door_func(param_1);
    }
    else {
      teleportTimestamp = gGlobals.ticker;
      set_teleport_pointer(param_1);
    }
  }
}



void get_loot_reagent(voxelObject* param_1,container_Dat * param_2){
  
  u8 quant = param_2->Gold * RangerIngredientFloat;
  if (!quant) quant = 1;
  u16 LootReagentIDs[]={0,0,0,0,0x1f,0x1e,0x20,0};
  ref_obj_bitmask_flag((param_1->header).flagB,(param_1->header).Bitfeild,VOXEL_Used);
  set_voxel_visibility(param_1,false);
  voxelObject *a = GetVoxelFromObjectLink(gGlobals.Sub.borg9DatPointer,param_1,VOXEL_Scene);
  if (a) set_voxel_visibility(a,false);
  if (exploding_container_check(param_1,gGlobals.Sub.borg9DatPointer)) {
    passto_WriteTo_VoxelChart((short)(((int)param_1 - (int)(gGlobals.Sub.borg9DatPointer)->voxelObjs) * 0x684bda13
                      >> 2),(undefined)gGlobals.Sub.mapDatA,(undefined)gGlobals.Sub.mapShort1,
               (undefined)gGlobals.Sub.mapShort2,0x11,*(byte *)((int)&(param_1->header).type + 1),10
              );
  }
  GenericInventory * pGVar1 = new GenericInventory();
  pGVar1->AddItem(item_pointer->Gear[LootReagentIDs[param_2->LootType]].ID,quant);
  build_loot_menu(pGVar1,0,-1);
  gGlobals.playerCharStruct.unkState = 7;
}

void loot_func(voxelObject *param_1){
  short sVar1;
  ItemID IVar2;
  short sVar3;
  float vol;
  short *psVar4;
  bool bVar7;
  ushort uVar6;
  voxelObject *a;
  int iVar5;
  void *ppfVar10;
  GenericInventory *loot;
  u8 uVar8;
  container_Dat *pcVar9;
  u8 uVar10;
  undefined2 time;
  short aIStack96 [6] [2];
  
  pcVar9 = &param_1->container;
  psVar4 = some_ref_obj_lookup_func((short)(((int)param_1 - (int)(gGlobals.Sub.borg9DatPointer)->voxelObjs) *
                              0x684bda13 >> 2),(char)gGlobals.Sub.mapDatA,
                      (byte)gGlobals.Sub.mapShort1,(byte)gGlobals.Sub.mapShort2,0x11,
                      *(undefined *)((int)&(param_1->header).type + 1));

  if (((container_open_check((param_1->container).openFlag)) || (psVar4)) ||
     (container_explode_check((param_1->container).explodeFlag))) {
    set_voxel_visibility(param_1,false);
  }
  else {
    uVar6 = (param_1->container).LootType;
    if (uVar6 < 4) uVar6 = (param_1->container).unk0x14;
    else {
      if (uVar6 < 7) {
        get_loot_reagent(param_1,pcVar9);
        return;
      }
      if (uVar6 == 7) {
        set_voxel_visibility(param_1,false);
        ref_obj_bitmask_flag((param_1->header).flagB,(param_1->header).Bitfeild,VOXEL_Used);
      }
    }
    if ((param_1->container).unk0x14) {
      if ((param_1->container).trap_lv != 0xff) {
        TrapMenu::InitMenu(param_1);
        return;
      }
    }
    if ((param_1->container).LockLV == 0) {
      time = 0;
      setEventFlag((param_1->container).openFlag,true);
      getEventFlag(0x15fa);
      set_refObj_flag(param_1);
      if ((param_1->container).LootType == 7) {
        set_voxel_visibility(GetVoxelFromObjectLink(gGlobals.Sub.borg9DatPointer,param_1,VOXEL_Scene),false);
      }
      else {
        time = 0x3c;
        play_countainer_sound(param_1,gGlobals.Sub.borg9DatPointer);
      }
      uVar10 = 0;
      if ((param_1->container).LootCat) {
        uVar8 = 0;
        get_chest_loot(loot_pointer,pcVar9);
        iVar5 = 0;
        do {
          psVar4 = (short *)((int)pcVar9->lootCatDrop[0] + iVar5);
          if ((*psVar4) && (psVar4[1])) {
            aIStack96[uVar10][0] = *psVar4;
            aIStack96[uVar10][1] = psVar4[1];
            uVar10++;
          }
          uVar8++;
          iVar5 = uVar8 << 2;
        } while (uVar8 < 7);
      }
      set_voxel_visibility(param_1,false);
      IVar2 = (param_1->container).item;
      uVar8 = uVar10;
      if (IVar2) {
        uVar8 = uVar10+1;
        aIStack96[uVar10][0] = IVar2;
        aIStack96[uVar10][1] = 1;
      }
      if ((!container_explode_check((param_1->container).explodeFlag)) && (!container_open_check((param_1->container).openFlag))) {
        passto_WriteTo_VoxelChart((short)(((int)param_1 - (int)(gGlobals.Sub.borg9DatPointer)->voxelObjs) *
                           0x684bda13 >> 2),(char)gGlobals.Sub.mapDatA,(byte)gGlobals.Sub.mapShort1,
                   (byte)gGlobals.Sub.mapShort2,0x11,*(byte *)((int)&(param_1->header).type + 1),10);
      }
      if (!uVar8) {
        os::sprintf(gGlobals.text,gGlobals.CommonStrings[0x1e2],(param_1->container).Gold);
        textbox_func(gGlobals.text);
        (gGlobals.Party)->Gold+=(param_1->container).Gold;
        play_SFX(&gGlobals.SFXStruct,Coins_jingle,0,gGlobals.VolSFX,300,time);
      }
      else {
        loot = new GenericInventory();
        uVar10 = 0;
        if (uVar8 != 0) {
          do {
            loot->AddItem(aIStack96[uVar10][0],aIStack96[uVar10][0]);
            uVar10++;
          } while (uVar10 < uVar8);
        }
        build_loot_menu(loot,(param_1->container).Gold,-1);
        gGlobals.playerCharStruct.unkState = 0x13;
        if ((param_1->container).LootType == 7) gGlobals.playerCharStruct.unkState = 7;
      }
    }
    else lockpicking_check(param_1);
  }
}

u8 monsterpary_func(voxelObject *param_1){
  ushort uVar1;
  playerData *ppVar2;
  u16 in_a2_lo;
  vec3f *playerPos;
  vec3f *a;
  float x;
  vec3f temp;
  
  if (!(param_1->monster).borg_13) {
    playerPos = &((gGlobals.playerCharStruct.playerDat)->collision).pos;
    ppVar2 = gGlobals.wander.wanderSubstructs[(param_1->monster).unk0x24].playerDat;
    Vec3_sub(&temp,&(ppVar2->collision).pos,playerPos);
    x = vec3_normalize(&temp);
    setVec3(&temp,-(ppVar2->facing).x,0.0,-(ppVar2->facing).y);
    vec3_normalize(&temp);
    multiVec3(&temp,x);
    vec3_sum(&temp,&temp,&(ppVar2->collision).pos);
    Vec3_sub(&temp,&temp,playerPos);
    gGlobals.EncounterDat.collisionByte = x <= vec3_normalize(&temp);
    gGlobals.EncounterDat.unk28 = 0;
    battle_setup_func(param_1,(param_1->header).flagB,gGlobals.wander.wanderSubstructs[(param_1->monster).unk0x24].VoxelIndex);
    gGlobals.playerCharStruct.unkState = 2;
  }
  else if (((param_1->monster).flags & 4) == 0) {
    dialoug_func((param_1->monster).borg_13,0,gGlobals.Sub.mapDatA,gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2,
                 in_a2_lo);
    monsterparty_wanderstruct(&gGlobals.wander.wanderSubstructs[(param_1->monster).unk0x24]);
    setEventFlag((param_1->header).flagB,true);
    getEventFlag(0x15fa);
  }
}


void trigger_vobject_func(voxelObject *arg0){
  Borg7header *pBVar1;
  borg9_phys *pbVar2;
  Borg9data *pBVar3;
  voxelObject *prVar3;
  int iVar5;
  ushort uVar6;
  voxelHeader *iVar4;
  uint uVar8;
  
  pBVar3 = gGlobals.Sub.borg9DatPointer;
  switch((arg0->trigger).triggertype) {
  case 1:
    setEventFlag((arg0->trigger).flagA,true);
    getEventFlag(0x15fa);
    set_refObj_flag(arg0);
    break;
  case 2:
    prVar3 = GetVoxelFromObjectLink(gGlobals.Sub.borg9DatPointer,arg0,VOXEL_Scene);
    pBVar1 = (prVar3->scene).borgArray[0].borgheader;
    if (pBVar1) FUN_800a0090(pBVar1,(arg0->trigger).flagA);
    break;
  case 4:
    uVar8 = 0;
    if ((gGlobals.Sub.borg9DatPointer)->borghpys_count != 0) {
      pbVar2 = (gGlobals.Sub.borg9DatPointer)->phys_pointer;
      iVar5 = 0;
      do {
        uVar6 = pbVar2[uVar8].GroundType;
        if (((uVar6 & 0xf000) == 0x1000) && ((uVar6 >> 5 & 0x7f) == (arg0->trigger).flagA)) {
          uVar6 = *(ushort *)((int)pbVar2->vertexpointers + iVar5 + 0x1c) & (arg0->trigger).flagB;
          pbVar2[uVar8].flag &=(arg0->trigger).flagB;
          *(EventFlag *)((int)pbVar2->vertexpointers + iVar5 + 0x1c) = uVar6 | (arg0->trigger).flagC
          ;
        }
        uVar8 = uVar8 + 1 & 0xffff;
        iVar5 = uVar8 << 5;
      } while (uVar8 < pBVar3->borghpys_count);
    }
  }
  ref_obj_bitmask_flag((arg0->header).flagB,(arg0->header).Bitfeild,VOXEL_Used);
}



void savepoint_func(void){}

bool vobject_pause_check(void){
  bool bVar2 = true;
  if (gGlobals.screenFadeModeSwitch == 1) {
    bVar2 = false;
    if (!isPaused()) {
      if (check_some_toggle()) bVar2 = false;
      else bVar2 = gGlobals.playerCharStruct.unkState == 3;
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


bool check_reference_object(voxelObject *arg0){
  EventFlag EVar1;
  bool bVar2;
  bool bVar3;
  u16 uVar3;
  
  checkCheat(appear);
  EVar1 = (arg0->header).flagC;
  uVar3 = (arg0->header).Bitfeild >> 7 & 1;
  bVar3 = (bool)(u8)uVar3;
  if (EVar1 != 0) {
    if (EVar1 == 1) {bVar3 = uVar3 == 0;}
    else {bVar3 = (bool)(getEventFlag(EVar1) ^ bVar3);}
    }
  return bVar3;
}

bool scene_object_check(voxelObject *arg0){
  checkCheat(referenceObject);
  return check_reference_object(arg0);}

bool exploding_container_sub(voxelObject* arg0,Borg_9_data *arg1){
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

char exploding_container_check(voxelObject* arg0,Borg_9_data *arg1){
  u16 uVar1;
  voxelObject *a;
  char cVar5;
  s16 *psVar3;
  
  a = GetVoxelFromObjectLink(arg1,(voxelObject *)arg0,Scene);
  if (!gamestate_cheat_check1(appear)) {
    uVar1 = (arg0->dat).LootType;
    if ((7 < uVar1) || (uVar1 < 4)) {
      set_voxel_visibility(a,true);
      set_voxel_visibility((voxelObject *)arg0,true);
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
      set_voxel_visibility((voxelObject *)arg0,false);
      return 0;
    }
    cVar5 = exploding_container_sub(arg0,arg1);
  }
  else {cVar5 = gamestate_cheat_check2(appear);}
  set_voxel_visibility(a,cVar5 != 0);
  set_voxel_visibility((voxelObject *)arg0,cVar5 != 0);
  return cVar5;}

bool TP_lock_secret_check(voxelObject* arg0){
  u16 uVar1;
  bool uVar3;
  u8 bVar4;
  
  if(gamestate_cheat_check1(appear)){return gamestate_cheat_check2(appear);}
    uVar3 = false;
    if (trigger_event_flag_check((arg0->header).flagC,(arg0->header).Bitfeild,0x80)) {
      if ((arg0->teleport).secretDoorVal == 0) {uVar1 = (arg0->teleport).trapBool16;}
      else {
        if (teleport_secret_check((arg0->teleport).secrect_door_flag) == false) {
          if (check_int_theif(gGlobals.party) < (arg0->teleport).secretDoorVal) {return false;}
          (arg0->teleport).secretDoorVal = 0;
        }
        else {(arg0->teleport).secretDoorVal = 0;}
        uVar1 = (arg0->teleport).trapBool16;
      }
      if (uVar1 == 0) {uVar1 = (arg0->teleport).lock_lv;}
      else {
        if (teleport_trap_check((arg0->teleport).trap_flag)) {(arg0->teleport).trapBool16 = 0;}
        uVar1 = (arg0->teleport).lock_lv;
      }
      uVar3 = true;
      if (uVar1 != 0) {
        if (Teleport_lock_check((arg0->teleport).lock_flag)) {(arg0->teleport).lock_lv = 0;}
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
      if (arg0->monster.borg_13 == 0) {
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

bool container_obj_check(voxelObject* arg0,playerData *arg1){
  u16 uVar1;
  bool bVar2;
  bool ret;
  float fVar3;
  
  fVar3 = vec3_proximity(arg0,(arg1->collision).position);
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

undefined FUN_80014ba0(voxelObject *arg0,vec3f *arg1){
  undefined uVar1;
  
  uVar1 = 0;
  if (vec3_proximity(arg0,arg1) <= (arg0->header).size) {
    uVar1 = trigger_event_flag_check((arg0->header).flagA,(arg0->header).Bitfeild,0x100);
  }
  return uVar1;}

bool some_gamestate_check_B(voxelObject* arg0,playerData *arg1,bool istrue){
  if ((istrue) &&(vec3_proximity(arg0,(arg1->collision).position) >(arg0->header).size)) {return false;}
  if (gamestate_cheat_check1(check)) return gamestate_cheat_check2(check);
  return trigger_event_flag_check((arg0->header).flagA,(arg0->header).Bitfeild,0x100) != false;

bool teleporter_obj_check(voxelObject* arg0,playerData *arg1){return some_gamestate_check_B(arg00,arg1,true);}

bool monsterparty_obj_check(void){
  if (gamestate_cheat_check1(check)) return gamestate_cheat_check2(check);
  return true;
  }

bool trigger_obj_check_prox(trigger_obj *arg0,playerData *arg1,bool param_3){
  if ((param_3) && (vec3_proximity(arg0,(arg1->collision).position) > (arg0->header).size) {return false;}
  if (gamestate_cheat_check1(check) == false) return gamestate_cheat_check2(check);
  return trigger_event_flag_check((arg0->header).flagA,(arg0->header).Bitfeild,0x100);
}

bool trigger_obj_check(trigger_obj *arg0,playerData *arg1){return trigger_obj_check_prox(arg0,arg1,true);}

bool dialouge_trigger_check(Dialoug_obj *arg0,vec3f *arg1,bool getProx){
  bool bVar1;
  bool uVar2;
  GameState_Cheat GVar2;
  float fVar3 = 0.0;
  

  if (getProx) {fVar3 = vec3_proximity(arg0,arg1);}
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

bool savepoint_prox_check(voxelObject *arg0,playerData *arg1){return vec3_proximity(arg0,(arg1->collision).position); <= (arg0->header).size;}

u8 VoxelObj_Ret0(voxelObject *arg0,playerData *arg1){return 0;}

void render_container(voxelObject* param_1,Borg_9_data *param_2){
  if ((param_1->header).type == VOBJECT_CONTAINER) set_container_obj_visible(param_1,param_2);
}

void set_container_obj_visible(voxelObject* param_1,Borg_9_data *param_2){
  u16 uVar1;
  voxelObject *a;
  bool b;
  
  a = GetVoxelFromObjectLink(param_2,(voxelObject *)param_1,Scene);
  uVar1 = (param_1->dat).LootType;
  b = true;
  if ((uVar1 < 8) && (3 < uVar1)) {
    b = SUB21((param_1->header).Bitfeild >> 0xf,0);
  }
  set_voxel_visibility(a,b);}

u8 textbox_func_AB(s32 param_1,BaseWidget *param_2){
  BaseWidget::SetState(param_2,5);
  gGlobals.PlayerChar.text_window = NULL;
  return 0;}

u8 secretdoor_widget_AB(s32 param_1,BaseWidget *param_2){
  teleporter_func((voxelObject* )param_2->prt0x40);
  BaseWidget::SetState(param_2,5);
  gGlobals.PlayerChar.text_window = NULL;
  return 0;
}

BaseWidget * textbox_func(char *param_1){
  color32 col1=OFFWHITE;
  color32 col2=DARKGRAY;
  gGlobals.PlayerChar.text_window = some_textbox_func(param_1,0x96,&col1,&col2,1);
  (gGlobals.PlayerChar.text_window)->AbuttonFunc = textbox_func_AB;
  (gGlobals.PlayerChar.text_window)->BButtonFunc = textbox_func_AB;
  (gGlobals.PlayerChar.text_window)->CDownFunc = NULL;
  (gGlobals.PlayerChar.text_window)->CUpFunc = NULL;
  return gGlobals.PlayerChar.text_window;}

bool container_open_check(EventFlag param_1){
  checkCheat(containerOpen);
  return getEventFlag(param_1);
}
bool container_explode_check(EventFlag param_1){
  checkCheat(containerExplode);
  return getEventFlag(param_1);
}
bool teleport_lock_check(EventFlag param_1){
  checkCheat(teleportLock);
  return getEventFlag(param_1);
}
bool teleport_trap_check(EventFlag param_1){
  checkCheat(teleportTrap);
  return getEventFlag(param_1);
}

bool teleport_secret_check(EventFlag param_1){
  checkCheat(teleportSecret);
  return getEventFlag(param_1);
}

bool FUN_80015128(EventFlag param_1,u32 param_2){
  bool bVar1, bVar2;
  u8 bVar3;
  
  bVar3 = (u8)(param_2 >> 8) & 1;
  bVar2 = bVar3;
  if ((param_1 != 0) && (bVar2 = bVar3 ^ 1, param_1 != 1)) {bVar2 = getEventFlag(param_1); ^ bVar3;}
  return bVar2;}


bool trigger_event_flag_check(EventFlag param_1,u16 param_2,u16 param_3){
  bool bVar1;
  bool uVar2;
  
  bVar1 = (param_3 & param_2) != 0;
  uVar2 = bVar1;
  if ((param_1 != 0) && (bVar1 = !bVar1, param_1 != 1)) {
    bVar1 = 0 < getEventFlag(param_1) ^ uVar2);}
  return bVar1;}

undefined ref_obj_bitmask_flag(EventFlag param_1,u16 param_2,u16 param_3){
  setEventFlag(param_1,(param_3 & param_2) == 0);
  return getEventFlag(0x15fa);}

bool FUN_8001520c(voxelObject* param_1){
  if ((param_1->dat).secretDoorVal == 0) return false;
  return getEventFlag((param_1->dat).secrect_door_flag)==false;}

bool secret_door_func(voxelObject* param_1){
  BaseWidget *pwVar1;
  bool bVar2;
  
  pwVar1 = textbox_func(gGlobals.CommonStrings->discovered secret door);
  (param_1->dat).secretDoorVal = 0;
  setEventFlag((param_1->dat).secrect_door_flag,true);
  bVar2 = getEventFlag(0x15fa);
  pwVar1->prt0x40 = param_1;
  pwVar1->AbuttonFunc = secretdoor_widget_AB;
  pwVar1->BButtonFunc = secretdoor_widget_AB;
  return bVar2;}
