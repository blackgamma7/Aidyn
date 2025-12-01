#include "gamestateCheats.h"
#include "eventFlag.h"
#include "game.h"
#include "inventory\GenericInventory.h"
#include "vobjects.h"
#include "voxelChart.h"
#include "trapMenu.h"
#include "widgets/textPopup.h"
//keeps coming up, return value unused. could be removed?
#define UnkVoxelFlagCheck getEventFlag(FLAG_VoxelCheckUNK)


extern voxelObject* GetVoxelFromObjectLink(Borg9Data*,voxelObject*,u16);

//used by scene object tied to "containers" - changes appearance based on if loot is collected or trap triggered
void replace_container_voxel(voxelObject *param_1,u16 param_2,Borg9Data *param_3){
  
  voxelObject* prVar1 = GetVoxelFromObjectLink(param_3,param_1,VOXEL_Scene);
  if ((prVar1->scene).borgArray[0].b7) {
    //unique case, seems to use bool for Borg7(false) and sceneDat(true) enums
    AllocFreeQueueItem(&gGlobals.QueueA,(void**)&(prVar1->scene).borgArray[0].b7,
                       (u16)(((prVar1->scene).sceneflags & SceneObj_B7) == 0),0);
    (prVar1->scene).borgArray[0].b7 = NULL;
  }
  (prVar1->scene).borgArray[0].borgIndex = (prVar1->scene).borgArray[param_2].borgIndex;
}

//play a sound based on loot collected
void play_countainer_sound(voxelObject* param_1,Borg9Data *param_2){
                           //chest,bag, box, barrel, herb, spice, gem, misc
  u32 containerSounds [8]={0x729,0x72A,0x72B,0x72C,0x729,0x729,0x729,0x729};
  PLAYSFX(containerSounds[(param_1->container).LootType],0,gGlobals.VolSFX,0xb4,0);
  replace_container_voxel(param_1,1,param_2);
}

//explosion effect if trap is triggered. replace model with destroyed one.
void open_explosive_chest(voxelObject* param_1,Borg9Data *param_2){

  u32 chestExplodeSFX[]={0x724,0x725,0x727,0x728};
  alloc_explosion_light(param_1->header.pos,1.0,600,false);
  for(s16 i=0;i<3;i++) {
    alloc_explosion_light(param_1->header.pos,0.35,60,true);
  }
  vec4f particleCol={0.35,0.3,0.25,1.0};
  chest_explode_particles(param_1,(param_1->header).pos.y,&particleCol,420,2,75,0.04f,0.06f,(float)(-0.006/7),true);
  (param_1->container).Gold = 0;
  (param_1->container).LootCat =0;
  replace_container_voxel(param_1,2,param_2);
  setEventFlag((param_1->container).explodeFlag,true);
  UnkVoxelFlagCheck;
  PLAYSFX(chestExplodeSFX[RAND.Range(0,3)],0,gGlobals.VolSFX,240,0);
  set_voxel_visibility(param_1,false);
}

void NOOP_tp(void){}

//activaction funcs
void run_voxelFuncs0(voxelObject *v,u16 A, u16 B){(*gVoxelUseFuncs[(v->header).type])(v,B,A);}

//visibility check, i think
u8 run_voxelFuncs2(voxelObject *v,Borg9Data*map){return (*gVoxelFuncs2[(v->header).type])(v,map);}

//collision
u8 Voxel_CheckProc(voxelObject *v,playerData *p){return (*gVoxelProxFuncs[(v->header).type])(v,p);}

void Voxel_func_NOOP(voxelObject* v,u16 A, u16 B){}

u8 teleport_trap(voxelObject* v){
  u8 bVar1;
  
  bVar1 = false;
  if ((v->teleport).trapBool16) {
    bVar1 = false;
    if (((!teleport_trap_check((v->teleport).TrapFlag)) && 
    (bVar1 = false, (v->teleport).trap_value != -1)) &&
       (bVar1 = false, (v->teleport).trapBool16)) {
      TrapMenu::InitMenu(v);
      bVar1 = true;
    }
  }
  return bVar1;
}

void teleporter_func(voxelObject* v,u16 A,u16 B){  
  if (vobject_pause_check()) {
    if (((v->header).Bitfeild & VOXEL_tangible) == 0) {
      if ((!(v->teleport).secrect_door_flag) || (getEventFlag((v->teleport).secrect_door_flag))) {
        if (!teleport_trap(v)) {
          if (((v->teleport).lock_lv) &&
             (!Teleport_lock_check((v->teleport).lock_flag))) {
            if ((v->teleport).lock_lv) {
              lockpicking_check(v);
              return;
            }
            setEventFlag((v->teleport).lockpick_flag_2,true);
            UnkVoxelFlagCheck;
            UnkVoxelFlagCheck;
          }
          teleportTimestamp = gGlobals.ticker;
          NOOP_tp();
          set_teleport_pointer(v);
        }
      }
      else secret_door_func(v);
    }
    else {
      teleportTimestamp = gGlobals.ticker;
      set_teleport_pointer(v);
    }
  }
}

// special case for reagent sources, give (container.Gold* Ranger modifer) items instead
void get_loot_reagent(voxelObject* v,container_Dat * cont){
  u8 quant = cont->Gold * RangerIngredientFloat;
  if (!quant) quant = 1; //always guarunteed 1 reagent.
  //array of reagents by container type
  u16 LootReagentIDs[]={0,0,0,0,ItemInd_Spice,ItemInd_Herb,ItemInd_Gemstone,0};
  ref_obj_bitmask_flag((v->header).flagB,(v->header).Bitfeild,VOXEL_Used);
  set_voxel_visibility(v,false);
  voxelObject *a = GetVoxelFromObjectLink(gGlobals.gameVars.borg9DatPointer,v,VOXEL_Scene);
  if (a) set_voxel_visibility(a,false);
  if (exploding_container_check(v,gGlobals.gameVars.borg9DatPointer)) {
    passto_WriteTo_VoxelChart((s16)(((int)v - (int)(gGlobals.gameVars.borg9DatPointer)->voxelObjs) * 0x684bda13
                      >> 2),gGlobals.gameVars.mapDatA,gGlobals.gameVars.mapShort1,
               gGlobals.gameVars.mapShort2,ZoneCenter,*(u8 *)((int)&(v->header).type + 1),10);
  }
  GenericInventory * pGVar1 = new GenericInventory();
  pGVar1->AddItem(gItemDBp->Gear[LootReagentIDs[cont->LootType]].ID,quant);
  build_loot_menu(pGVar1,0,-1);
  gGlobals.playerCharStruct.unkState = 7;
}

void loot_func(voxelObject *v,u16 A, u16 B){
  s16 sVar1;
  ItemID IVar2;
  s16 sVar3;
  float vol;
  s16 *psVar4;
  u8 bVar7;
  u16 uVar6;
  voxelObject *a;
  int iVar5;
  void *ppfVar10;
  u8 uVar8;
  container_Dat *contP;
  u8 uVar10;
  u16 time;
  s16 aIStack96 [6] [2];
  
  contP = &v->container;
  psVar4 = some_ref_obj_lookup_func((s16)(((int)v - (int)(gGlobals.gameVars.borg9DatPointer)->voxelObjs) *
                              /*?!?*/0x684bda13 >> 2),(char)gGlobals.gameVars.mapDatA,
                      (u8)gGlobals.gameVars.mapShort1,(u8)gGlobals.gameVars.mapShort2,ZoneCenter,(u8)v->header.type);

  if (((container_open_check((v->container).openFlag)) || (psVar4)) ||
     (container_explode_check((v->container).explodeFlag))) {
    set_voxel_visibility(v,false);
  }
  else {
    if ((v->container).LootType >= Treasure_Herb){
      //clover patches, pepper plants gem veins
      if ((v->container).LootType <= Treasure_Gem) {
        get_loot_reagent(v,contP);
        return;
      }
      //represented by a misc. model
      if ((v->container).LootType == Treasure_Misc) {
        set_voxel_visibility(v,false);
        ref_obj_bitmask_flag((v->header).flagB,(v->header).Bitfeild,VOXEL_Used);
      }
    }
    if ((v->container).unk0x14) {
      if ((v->container).trap_lv != 0xff) {
        TrapMenu::InitMenu(v);
        return;
      }
    }
    if ((v->container).LockLV == 0) {
      time = 0;
      setEventFlag((v->container).openFlag,true);
      UnkVoxelFlagCheck;
      set_refObj_flag(v);
      if ((v->container).LootType == Treasure_Misc) {
        set_voxel_visibility(GetVoxelFromObjectLink(gGlobals.gameVars.borg9DatPointer,v,VOXEL_Scene),false);
      }
      else {
        time = 60;
        play_countainer_sound(v,gGlobals.gameVars.borg9DatPointer);
      }
      uVar10 = 0;
      if ((v->container).LootCat) {
        get_chest_loot(loot_pointer,contP);
        for(uVar8 = 0;uVar8 < 7;uVar8++) {
          s16* psVar4 = (s16 *)&contP->lootCatDrop[uVar8];
          if ((*psVar4) && (psVar4[1])) {
            aIStack96[uVar10][0] = *psVar4;
            aIStack96[uVar10][1] = psVar4[1];
            uVar10++;
          }
        }
      }
      set_voxel_visibility(v,false);
      IVar2 = (v->container).item;
      uVar8 = uVar10;
      if (IVar2) {
        uVar8 = uVar10+1;
        aIStack96[uVar10][0] = IVar2;
        aIStack96[uVar10][1] = 1;
      }
      if ((!container_explode_check((v->container).explodeFlag)) && (!container_open_check((v->container).openFlag))) {
        passto_WriteTo_VoxelChart((s16)(((int)v - (int)(gGlobals.gameVars.borg9DatPointer)->voxelObjs) *
                           /*?!?*/0x684bda13 >> 2),(char)gGlobals.gameVars.mapDatA,(u8)gGlobals.gameVars.mapShort1,
                   (u8)gGlobals.gameVars.mapShort2,ZoneCenter,(u8)v->header.type,10);
      }
      if (!uVar8) { //no items, just money.
        Gsprintf(Cstring(GotXGold),(v->container).Gold);
        TrekTextPopup(gGlobals.text);
        (PARTY)->Gold+=(v->container).Gold;
        PLAYSFX(BORG12_CoinJingle,0,gGlobals.VolSFX,300,time);
      }
      else {
        GenericInventory *loot = new GenericInventory();
        if (uVar8) {
          for(uVar10 = 0;uVar10 < uVar8;uVar10++) {
            loot->AddItem((ItemID)aIStack96[uVar10][0],aIStack96[uVar10][1]);
          }
        }
        build_loot_menu(loot,(v->container).Gold,-1);
        gGlobals.playerCharStruct.unkState = 0x13;
        if ((v->container).LootType == Treasure_Misc) gGlobals.playerCharStruct.unkState = 7;
      }
    }
    else lockpicking_check(v);
  }
}

void monsterpary_func(voxelObject *v,u16 A,u16 B){
  if ((v->monster).borg_13){ //dialouge attached
    if(!v->monster.flags&4){
    dialoug_func((v->monster).borg_13,0,gGlobals.gameVars.mapDatA,gGlobals.gameVars.mapShort1,gGlobals.gameVars.mapShort2,
                 B);
    monsterparty_wanderstruct(&gGlobals.wander.wanderSubstructs[(v->monster).wandererIndex]);
    setEventFlag((v->header).flagB,true);
    UnkVoxelFlagCheck;
    }
  }
  else {
    vec3f temp;
    vec3f *playerPos = &((gPlayer)->collision).pos;
    playerData *ppVar2 = gGlobals.wander.wanderSubstructs[(v->monster).wandererIndex].playerDat;
    Vec3Sub(&temp,&(ppVar2->collision).pos,playerPos);
    float x = Vec3Normalize(&temp);
    Vec3Set(&temp,-(ppVar2->facing).x,0.0,-(ppVar2->facing).y);
    Vec3Normalize(&temp);
    Vec3Scale(&temp,x);
    Vec3Sum(&temp,&temp,&(ppVar2->collision).pos);
    Vec3Sub(&temp,&temp,playerPos);
    gGlobals.EncounterDat.collisionByte = x <= Vec3Normalize(&temp);
    gGlobals.EncounterDat.aniByte = 0;
    battle_setup_func(v,(v->header).flagB,gGlobals.wander.wanderSubstructs[(v->monster).wandererIndex].VoxelIndex);
    gGlobals.playerCharStruct.unkState = 2;
  }
}


void trigger_vobject_func(voxelObject *v,u16 A,u16 B){

  Borg9Data *pBVar3 = gGlobals.gameVars.borg9DatPointer;
  switch((v->trigger).triggertype) {
  case VTrigger_SetFlag:
    setEventFlag((v->trigger).flagA,true);
    UnkVoxelFlagCheck;
    set_refObj_flag(v);
    break;
  case VTrigger_ChangeAni:
    Borg7Header *b7 = GetVoxelFromObjectLink(gGlobals.gameVars.borg9DatPointer,v,VOXEL_Scene)->scene.borgArray[0].b7;
    if (b7) Borg7_SetAnimation(b7,(v->trigger).flagA);
    break;
  case VTrigger_3: break;
  case VTrigger_BorgPhys:
    if ((gGlobals.gameVars.borg9DatPointer)->borghpys_count != 0) {
      borg9_phys *pbVar2 = (gGlobals.gameVars.borg9DatPointer)->phys_pointer;
      for(u16 i=0;i<(gGlobals.gameVars.borg9DatPointer)->borghpys_count;i++){
        u16 gFlag = pbVar2[i].GroundType;
        if (((gFlag & 0xf000) == 0x1000) && ((gFlag >> 5 & 0x7f) == (v->trigger).flagA))
          pbVar2[i].flags=pbVar2[i].flags&(v->trigger).flagB|(v->trigger).flagC;
      }
    }
  case VTrigger_5:break;
  }
  ref_obj_bitmask_flag((v->header).flagB,(v->header).Bitfeild,VOXEL_Used);
}
//You can save anywhere, no need for save points
void savepoint_func(voxelObject *v,u16 A,u16 B){}

u8 vobject_pause_check(void){
  u8 bVar2 = true;
  if (gGlobals.screenFadeModeSwitch == 1) {
    bVar2 = false;
    if (!isPaused()) {
      if (check_some_toggle()) bVar2 = false;
      else bVar2 = gGlobals.playerCharStruct.unkState == 3;
    }
  }
  return bVar2;
}

void dialouge_vobject_func(voxelObject *v,u16 A,u16 B){
  if (vobject_pause_check()){
    dialoug_func((u32)(v->dialoug).borg_13,(v->dialoug).RefPointID,(v->dialoug).MapDatA,
                 (v->dialoug).MapShortA,(v->dialoug).MapShortB,B);
  }
}


u8 check_reference_object(voxelObject *v,Borg9Data* map){
  u16 EVar1;
  u8 bVar2;
  u8 bVar3;
  u16 uVar3;
  
  checkCheat(appear);
  EVar1 = (v->header).flagC;
  uVar3 = (v->header).Bitfeild >> 7 & 1;
  bVar3 = (bool)(u8)uVar3;
  if (EVar1 != 0) {
    if (EVar1 == 1) {bVar3 = uVar3 == 0;}
    else {bVar3 = (bool)(getEventFlag(EVar1) ^ bVar3);}
    }
  return bVar3;
}

u8 scene_object_check(voxelObject *v,Borg9Data* map){
  checkCheat(referenceObject);
  return check_reference_object(v,map);}

u8 exploding_container_sub(voxelObject* v,Borg9Data *arg1){
  u8 bVar2;
  s16 *psVar1;
  u8 uVar3;
  
  bVar2 = trigger_event_flag_check((v->header).flagC,(v->header).Bitfeild,0x80);
  if ((bVar2 == false) ||
     (some_ref_obj_lookup_func((s16)(((int)v - (int)arg1->voxelObjs)
                            * 0x684bda13 >> 2),
                          gGlobals.gameVars.mapDatA,gGlobals.gameVars.mapShort1,
                          (u8)gGlobals.gameVars.mapShort2,ZoneCenter,(u8)(v->header).type)))
    {uVar3 = false;}
  else {uVar3 = trigger_event_flag_check((v->header).flagA,(v->header).Bitfeild,0x100);}
  return uVar3;
}

u8 exploding_container_check(voxelObject *param_1,Borg9Data *param_2){
  u16 uVar1;
  voxelObject *a;
  u8 bVar3;
  s16 *psVar2;
  
  voxelObject *a = GetVoxelFromObjectLink(param_2,param_1,VOXEL_Scene);
  checkCheat(appear);
  else {
    uVar1 = (param_1->container).LootType;
    if ((Treasure_Misc < uVar1) || (uVar1 < Treasure_Herb)) {
      set_voxel_visibility(a,true);
      set_voxel_visibility(param_1,true);
      psVar2 = some_ref_obj_lookup_func((s16)(((int)param_1 - (int)param_2->voxelObjs) * 0x684bda13 >> 2),
                          (char)gGlobals.gameVars.mapDatA,(u8)gGlobals.gameVars.mapShort1,
                          (u8)gGlobals.gameVars.mapShort2,ZoneCenter,(u8)(param_1->header).type);;
      if ((container_open_check((param_1->container).openFlag)) || (psVar2 != NULL)) {
        replace_container_voxel(param_1,1,param_2);
        *(u16 *)(param_1->container).LockLV = 0;
        (param_1->container).unk0x14 = 0;
        (param_1->container).Gold = 0;
      }
      else {
        if (!container_explode_check((param_1->container).explodeFlag)) return true;
        replace_container_voxel(param_1,2,param_2);
      }
      set_voxel_visibility(param_1,false);
      return false;
    }
    bVar3 = exploding_container_sub(param_1,param_2);
  }
  set_voxel_visibility(a,bVar3 != false);
  set_voxel_visibility(param_1,bVar3 != false);
  return bVar3;
}

u8 TP_lock_secret_check(voxelObject* v,Borg9Data*map){
  u16 uVar1;
  u8 uVar3;
  u8 bVar4;
  checkCheat(appear);

    uVar3 = false;
    if (trigger_event_flag_check((v->header).flagC,(v->header).Bitfeild,0x80)) {
      if ((v->teleport).secretDoorVal){
        if (teleport_secret_check((v->teleport).secrect_door_flag) == false) {
          if (PARTY->SecretLock() < (v->teleport).secretDoorVal) {return false;}
          (v->teleport).secretDoorVal = 0;
        }
        else {(v->teleport).secretDoorVal = 0;}
      }
      if ((v->teleport).trapBool16){
        if (teleport_trap_check((v->teleport).trap_value)) {(v->teleport).trapBool16 = 0;}
      }
      uVar3 = true;
      if ((v->teleport).lock_lv) {
        if (Teleport_lock_check((v->teleport).lock_flag)) {(v->teleport).lock_lv = 0;}
        uVar3 = true;
      }
    }
  return uVar3;
}

u8 some_monster_check(voxelObject *v){
  u16 EVar1;
  checkCheat(appear);
  checkCheat(monsterCheck);
      if (v->monster.borg_13 == 0) {
        return (FUN_80015128((v->header).flagA,(u32)(v->header).Bitfeild) != false && getEventFlag((v->header).flagB) == false);
      }
      else {return FUN_80015128((v->header).flagA,(u32)(v->header).Bitfeild);}
}

u8 some_trigger_check(voxelObject *v){
  checkCheat(appear);
  checkCheat(dialougeTrigger);
  return trigger_event_flag_check((v->header).flagC,(v->header).Bitfeild,0x80);}

u8 some_dialouge_trigger_check(voxelObject *v,Borg9Data*map){
  checkCheat(appear);
  checkCheat(dialougeTrigger);
return true;}

u8 savepoint_appear_check(voxelObject *v){
  checkCheat(appear);
  return true;}

u8 container_obj_check(voxelObject* v,playerData *arg1){
  u16 uVar1;
  u8 bVar2;
  u8 ret;
  
  ret = false;
  if (Vec3Dist(&v->header.pos,&arg1->collision.pos) <= v->container.chestSize + arg1->scaleRad) {
    checkCheat(check);
      uVar1 = (v->container).LootType;
      if ((Treasure_Misc < uVar1) || (ret = true, uVar1 < Treasure_Herb)){
        bVar2 = container_open_check(v->container.openFlag);
        ret = false;
        if ((bVar2 == false) &&
           (((v->container.Gold != 0 || (v->container.LootCat)) ||
            (ret = false, v->container.item)))) {
          ret = true;
        }
      }
  }
  return ret;}

u8 Ofunc_80014ba0(voxelObject *v,vec3f *arg1){
  u8 uVar1;
  
  uVar1 = 0;
  if (Vec3Dist(&v->header.pos,arg1) <= (v->header).size) {
    uVar1 = trigger_event_flag_check((v->header).flagA,(v->header).Bitfeild,0x100);
  }
  return uVar1;}

u8 some_gamestate_check_B(voxelObject* v,playerData *arg1,u8 istrue){
  if ((istrue) &&(Vec3Dist(&v->header.pos,&(arg1->collision).pos) >(v->header).size)) {return false;}
  checkCheat(check);
  return trigger_event_flag_check((v->header).flagA,(v->header).Bitfeild,0x100) != false;
}

u8 teleporter_obj_check(voxelObject* v,playerData *arg1){return some_gamestate_check_B(v,arg1,true);}

u8 monsterparty_obj_check(voxelObject* v){
  checkCheat(check);
  return true;
  }

u8 trigger_obj_check_prox(voxelObject *v,playerData *arg1,u8 param_3){
  if ((param_3) && (Vec3Dist(&v->header.pos,&(arg1->collision).pos) > (v->header).size)) {return false;}
  checkCheat(check);
  return trigger_event_flag_check((v->header).flagA,(v->header).Bitfeild,0x100);
}

u8 trigger_obj_check(voxelObject *v,playerData *arg1){return trigger_obj_check_prox(v,arg1,true);}

u8 dialouge_trigger_check(voxelObject *v,vec3f *arg1,u8 getProx){
  float fVar3 = 0.0;
  if (getProx) {fVar3 = Vec3Dist(&v->header.pos,arg1);}
  u8 uVar2 = false;
  if (fVar3 <= (v->header).size) {
    checkCheat(check);
    checkCheat(dialougeTrigger);
    return trigger_event_flag_check((v->header).flagA,(v->header).Bitfeild,0x100);
    }
  return uVar2;
}

u8 dialoug_obj_func(voxelObject *v,playerData *arg1){return dialouge_trigger_check(v,&(arg1->collision).pos,true);}

void dialoug_obj_check(voxelObject* v,playerData *arg1){dialoug_obj_func(v,arg1);}

u8 savepoint_prox_check(voxelObject *v,playerData *arg1){return Vec3Dist(&v->header.pos,&(arg1->collision).pos) <= (v->header).size;}

u8 VoxelObj_Ret0(voxelObject *v,playerData *arg1){return 0;}

void render_container(voxelObject* param_1,Borg9Data *param_2){
  if ((param_1->header).type == VOXEL_Container) set_container_obj_visible(param_1,param_2);
}

void set_container_obj_visible(voxelObject* param_1,Borg9Data *param_2){
  u16 uVar1;
  voxelObject *a;
  u8 b;
  
  a = GetVoxelFromObjectLink(param_2,param_1,VOXEL_Scene);
  uVar1 = (param_1->container).LootType;
  b = true;
  if ((uVar1 <= Treasure_Misc) && (Treasure_Herb <= uVar1)) {
    b = (param_1->header).Bitfeild >> 0xf;
  }
  set_voxel_visibility(a,b);}

BaseWidget* textbox_func_AB(BaseWidget* param_1,BaseWidget *param_2){
  param_2->SetState(WidgetS_Closing);
  gGlobals.playerCharStruct.text_window = NULL;
  return 0;}

BaseWidget* secretdoor_widget_AB(BaseWidget* param_1,BaseWidget *param_2){
  teleporter_func((voxelObject* )param_2->substruct,0,0x7fff);
  param_2->SetState(WidgetS_Closing);
  gGlobals.playerCharStruct.text_window = NULL;
  return 0;
}

BaseWidget * TrekTextPopup(char *param_1){
  Color32 col1={COLOR_OFFWHITE};
  Color32 col2={COLOR_DARKGRAY};
  gGlobals.playerCharStruct.text_window = some_textbox_func(param_1,0x96,&col1,&col2,1);
  (gGlobals.playerCharStruct.text_window)->AButtonFunc = textbox_func_AB;
  (gGlobals.playerCharStruct.text_window)->BButtonFunc = textbox_func_AB;
  (gGlobals.playerCharStruct.text_window)->CDownButtonFunc = NULL;
  (gGlobals.playerCharStruct.text_window)->CUpButtonFunc = NULL;
  return gGlobals.playerCharStruct.text_window;}

u8 container_open_check(u16 param_1){
  checkCheat(containerOpen);
  return getEventFlag(param_1);
}
u8 container_explode_check(u16 param_1){
  checkCheat(containerExplode);
  return getEventFlag(param_1);
}
u8 Teleport_lock_check(u16 param_1){
  checkCheat(teleportLock);
  return getEventFlag(param_1);
}
u8 teleport_trap_check(u16 param_1){
  checkCheat(teletrap);
  return getEventFlag(param_1);
}

u8 teleport_secret_check(u16 param_1){
  checkCheat(teleportSecret);
  return getEventFlag(param_1);
}

u8 FUN_80015128(u16 param_1,u32 param_2){
  u8 bVar1, bVar2;
  u8 bVar3;
  
  bVar3 = (u8)(param_2 >> 8) & 1;
  bVar2 = bVar3;
  if ((param_1 != 0) && (bVar2 = bVar3 ^ 1, param_1 != 1)) {bVar2 = getEventFlag(param_1); ^ bVar3;}
  return bVar2;}


u8 trigger_event_flag_check(u16 param_1,u16 param_2,u16 param_3){
  u8 bVar1;
  u8 uVar2;
  
  bVar1 = (param_3 & param_2) != 0;
  uVar2 = bVar1;
  if ((param_1 != 0) && (bVar1 = !bVar1, param_1 != 1)) {
    bVar1 = 0 < getEventFlag(param_1) ^ uVar2);}
  return bVar1;}

void ref_obj_bitmask_flag(u16 param_1,u16 param_2,u16 param_3){
  setEventFlag(param_1,(param_3 & param_2) == 0);
  UnkVoxelFlagCheck;}

u8 FUN_8001520c(voxelObject* param_1){
  if ((param_1->teleport).secretDoorVal == 0) return false;
  return getEventFlag((param_1->teleport).secrect_door_flag)==false;}

void secret_door_func(voxelObject* param_1){
  BaseWidget *w = TrekTextPopup(Cstring(DoorSecret));
  (param_1->teleport).secretDoorVal = 0;
  setEventFlag((param_1->teleport).secrect_door_flag,true);
  UnkVoxelFlagCheck;
  w->substruct = param_1;
  w->AButtonFunc = secretdoor_widget_AB;
  w->BButtonFunc = secretdoor_widget_AB;
  }
