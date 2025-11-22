#include "globals.h"
#include "vobjects.h"

void checking_camping_safety(void){
  gGlobals.playerCharStruct.unkState = 3;
  if (!PARTY->CampAmbushCheck()) dialoug_ref_obj_func();
  else gGlobals.playerCharStruct.unkState = 2;
}

void dialoug_ref_obj_func(void){
  setEventFlag(0x1090,true);
  if ((gGlobals.gameVars.borg9DatPointer)->voxelObjCount) {
    for(s16 i=0;i<(gGlobals.gameVars.borg9DatPointer)->voxelObjCount;i++){
      voxelObject* vObj = &(gGlobals.gameVars.borg9DatPointer)->voxelObjs[i];
      if ((((vObj->header).type == VOXEL_Dialouge) &&
          (some_dialoug_short_lookup((vObj->header).flagA))) &&
         (dialouge_trigger_check(vObj,&gPlayer->collision.pos,false))) {
        dialoug_func((vObj->dialoug).borg_13,(vObj->dialoug).RefPointID,(vObj->dialoug).MapDatA,
                     (vObj->dialoug).MapShortA,(vObj->dialoug).MapShortB,0x7fff);
        setEventFlag(0x1090,false);
        return;
      }
    }
  }
  campfire_func();
  setEventFlag(0x1090,false);
  return;
}
//same as BaseWidget::SetSomeBounds()
void SetWidgetBounds(BaseWidget *w,ushort x0,ushort y0,ushort x1,ushort y1){
  w->boundX0 = x0;
  w->boundY0 = y0;
  w->boundX1 = x1;
  w->boundY1 = y1;
}

s32 campfireScenes[10]={0x3cc,0x49c,0x49d,0x4a0,0x4a1,0x4aa,0x4eb,0x3d2,
  BORG13_CampSafe,-1};

u8 isCampfireScene(u32 b13ID){
  s32* x= campfireScenes;
  while(*x!=-1){
    if(*x==b13ID) return true;
    x++;
  }
  return false;
}
u16 dialoug_voxel_flagAs[9]={0x13c0,0x141e,0x141f,0x1422,0x1423,0x142b,0x1447,0x1393,-1};

u8 some_dialoug_short_lookup(u16 flag){
  u16* x= dialoug_voxel_flagAs;
  while(*x!=-1){
    if(*x==flag) return true;
    x++;
  }
  return false;
}

void campfire_func(void){
  Borg9Header *pBVar1;
  int iVar2;
  int iVar3;
  dialoug_dat *puVar4;
  voxelObject *pVVar1;
  
  pBVar1 = loadBorg9(BORG9_Campsite);
  puVar4 = NULL;
  if ((pBVar1->dat).voxelObjCount != 0) {
    pVVar1 = (pBVar1->dat).voxelObjs;
    if ((pVVar1->header).type == VOXEL_Dialouge) {
      puVar4 = &pVVar1->dialoug;
    }
    else {
      iVar2 = 1;
      do {
        iVar3 = (int)(short)iVar2;
        if ((int)(u32)(pBVar1->dat).voxelObjCount <= iVar3) goto LAB_80006610;
        iVar2 = iVar3 + 1;
      } while (pVVar1[iVar3].header.type != VOXEL_Dialouge);
      puVar4 = &pVVar1->dialoug;
    }
  }
LAB_80006610:
  dialoug_func((u32)puVar4->borg_13,puVar4->RefPointID,puVar4->MapDatA,puVar4->MapShortA,
               puVar4->MapShortB,0x7fff);
  remove_borg_9(pBVar1);
}