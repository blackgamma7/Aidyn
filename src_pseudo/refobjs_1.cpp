
//these are use for the gamestate_cheat_check"s in Debug.
enum GameStateCheat{
    all,
    appear,
    check,
    teleportLock,
    teleTrap,
    teleportSecret,
    ContainerOpen,
    containerExplode,
    monsterCheck,
    dialougeTrigger,
    trigger,
    referenceObject
};

void set_ranger_float(void){RangerIngredientFloat = ranger_int_float(Gglobals.party);}

bool func_8001b9bc(ref_obj *param_1){
  EventFlag EVar1;
  bool bVar2;
  bool bVar3;
  byte bVar4;
  ushort uVar5;
  
  if(gamestate_cheat_check1(appear)){return gamestate_cheat_check2(appear);}
  else {
    EVar1 = (param_1->header).flagC;
    uVar5 = (param_1->header).Bitfeild >> 7 & 1;
    bVar4 = (byte)uVar5;
    if (EVar1 != 0) {
      if (EVar1 == 1) {bVar4 = uVar5 == 0;}
      else {bVar4 = get_event_flag(EVar1) ^ bVar4;}
    }
    bVar3 = (run_voxelFuncs2(param_1) & bVar4);
  }
  return bVar3;
}

void set_refObj_flag(ref_obj *param_1){
  setEventFlag((param_1->header).flagB,(bool)(((param_1->header).Bitfeild >> 9) & 1 ^ 1));
}

void render_ref_objs(Borg_9_data *dat,byte arg2)

{
  bool bVar3;
  ref_obj_bitfeild rVar2;
  short *psVar1;
  ref_obj *a;
  short uVar4;
  
  set_ranger_float();
  uVar4 = 0;
  if (dat->ref_obj_count != 0) {
    do {
      a = dat->ref_objs[uVar4];
      bVar3 = gamestate_cheat_check1(appear);
      if (bVar3 == false) {
        if (only_TP_active == 0) {
          bVar3 = run_voxelFuncs2(a);
          if (ExpPakFlag == 0) {rVar2 = (a->header).Bitfeild & no_expPak;}
          else {rVar2 = (a->header).Bitfeild & EXPPak;}
          bVar3 = rVar2 == 0 && bVar3 != false;
          if ((a->header).type == Scene) {
            psVar1 = some_ref_obj_lookup_func
                               (uVar4,(char)map_dat_A,(byte)MapShortA,(byte)mapShortB,arg2,0);
            bVar3 = psVar1 == NULL && bVar3;
          }
          set_voxel_visibility(a,bVar3);
        }
        else {
          if ((a->header).type == Teleporter) {set_voxel_visibility(a,true);}
          else {set_voxel_visibility(a,false);}
        }
      }
      else {
        bVar3 = gamestate_cheat_check2(appear);
        if (ExpPakFlag == 0) {rVar2 = (a->header).Bitfeild & no_expPak;}
        else {rVar2 = (a->header).Bitfeild & EXPPak;}
        set_voxel_visibility(a,rVar2 == 0 && bVar3 != false);
      }
      uVar4++;
    } while (uVar4 < dat->ref_obj_count);
  }
  uVar4 = 0;
  if (dat->ref_obj_count != 0) {
    do {
      render_container((container_obj *)dat->ref_objs[uVar4],dat);
      uVar4++;
    } while (uVar4 < dat->ref_obj_count);
  }
  return;
}

void set_voxel_visibility(ref_obj *a,bool b){
  if (b == false) {
    (a->header).Bitfeild &= ~visible;
    return;
  }
  (a->header).Bitfeild |= visible;
  return;
}

