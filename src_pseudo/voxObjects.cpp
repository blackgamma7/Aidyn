#include "gamestateCheats.h"
#include "globals.h"
#include "inventory\GenericInventory.h"
#include "vobjects.h"
#include "voxelChart.h"

//these are use for the gamestate_cheat_check"s in Debug.

void set_ranger_float(void){RangerIngredientFloat = PARTY->HarvestSkill();}

u8 FUN_8001b9bc(voxelObject *param_1,Borg9Data*map){
  EventFlag EVar1;
  u8 bVar2;
  u8 bVar3;
  u8 bVar4;
  u16 uVar5;
  
  checkCheat(appear);
    EVar1 = (param_1->header).flagC;
    uVar5 = (param_1->header).Bitfeild >> 7 & 1;
    bVar4 = (u8)uVar5;
    if (EVar1 != 0) {
      if (EVar1 == 1) {bVar4 = uVar5 == 0;}
      else {bVar4 = getEventFlag(EVar1) ^ bVar4;}
    }
    return (run_voxelFuncs2(param_1,map) & bVar4);
}

void set_refObj_flag(voxelObject *param_1){
  setEventFlag((param_1->header).flagB,(bool)(((param_1->header).Bitfeild >> 9) & 1 ^ 1));
}


void VoxelObjects_Activate(Borg9Data *dat,byte arg2)

{
  bool visBool;
  u16 expFlag;
  voxelObject *a;

  set_ranger_float();
  for(u16 i=0;i<dat->voxelObjCount;i++){
      voxelObject *a = dat->voxelObjs + i;
      #ifdef DEBUGVER
      if (gamestate_cheat_check1(STATECHEAT_appear)) {
        visBool = gamestate_cheat_check2(STATECHEAT_appear);
        if (gExpPakFlag == 0)
          expFlag = (a->header).Bitfeild & VOXEL_EXPPak;
        else
          expFlag = (a->header).Bitfeild & VOXEL_JumperPak;
        if (expFlag) visBool = false;
        set_voxel_visibility(a,visBool);
      }
      else if (!only_TP_active)
      #else
      if (!only_TP_active)
      #endif
       {
        visBool = run_voxelFuncs2(a,dat);
        if (gExpPakFlag == 0)
          expFlag = (a->header).Bitfeild & VOXEL_EXPPak;
        else
          expFlag = (a->header).Bitfeild & VOXEL_JumperPak;
        if (expFlag) visBool = false;
        if (((a->header).type == VOXEL_Scene) &&
           (some_ref_obj_lookup_func(i,gGlobals.gameVars.mapDatA,gGlobals.gameVars.mapShort1,
                                gGlobals.gameVars.mapShort2,arg2,0))) {
          visBool = false;
        }
        set_voxel_visibility(a,visBool);
      }
      else if ((a->header).type == VOXEL_Teleporter)
        set_voxel_visibility(a,true);
      else set_voxel_visibility(a,false);
    }
  for(u16 i=0;i<dat->voxelObjCount;i++){
      render_container(&dat->voxelObjs[i],dat);
  }
}

void set_voxel_visibility(voxelObject *a,u8 b){
  if(b) (a->header).Bitfeild |= VOXEL_Active;
  else  (a->header).Bitfeild &= ~VOXEL_Active;
}

