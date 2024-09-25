void checking_camping_safety(void){
  gGlobals.playerCharStruct.camping_var = 3;
  if (!check_for_camp_ambush(gGlobals.Party)) {dialoug_ref_obj_func();}
  else {gGlobals.playerCharStruct.camping_var = 2;}
}


void dialoug_ref_obj_func(void){
  Borg_9_data *pBVar1;
  bool bVar2;
  s32 iVar3;
  Dialoug_obj *prVar5;
  s32 iVar4;
  s32 iVar5;
  
  setEventFlag(0x1090,true);
  pBVar1 = gGlobals.Sub.borg9DatPointer;
  if ((gGlobals.Sub.borg9DatPointer)->voxelCount) {
    iVar4 = 0;
    iVar5 = 0x10000;
    do {
      prVar5 = (Dialoug_obj *)(&pBVar1->ref_objs->unk0x0 + iVar4);
      if ((((prVar5->header).type == Dialouge) &&
          (some_dialoug_short_lookup((prVar5->header).flagA))) &&
         (dialouge_trigger_check(prVar5,((gGlobals.playerCharStruct.playerDat)->collision).position,false))) {
        dialoug_func((u32)(prVar5->dat).borg_13,(prVar5->dat).unk0x8,(prVar5->dat).unk0x2,
                     (prVar5->dat).unk0x4,(prVar5->dat).unk0x6,0x7fff);
        setEventFlag(0x1090,false);
        return;
      }
      iVar3 = iVar5 >> 0x10;
      iVar4+= 0x6c;
      iVar5 = iVar5 + 0x10000;
    } while (iVar3 < (s32)(u32)pBVar1->voxelCount);
  }
  campfire_func();
  setEventFlag(0x1090,false);
  return;
}

void FUN_800064e8(widgetStruct *param_1,u16 param_2,u16 param_3,u16 param_4,u16 param_5){
  param_1->unk0x64 = param_2;
  param_1->unk0x68 = param_3;
  param_1->HMax = param_4;
  param_1->VMax = param_5;
}

bool isCampfireScene(borg13Enum param_1){
  borg13Enum bVar1;
  borg13Enum *pbVar2;
  s32 campfireScenes[10]={0x3cc,0x49c,0x49d,0x4a0,0x4a1,0x4aa,0x4eb,0x3d2,
   BORG13_PassTheMarshmallows,-1};

  if (campfireScenes[0] != -1) {
    pbVar2 = campfireScenes;
    do {
      bVar1 = *pbVar2;
      pbVar2++;
      if (bVar1 == param_1) {return true;}
    } while (*pbVar2 != -1);
  }
  return false;
}

bool some_dialoug_short_lookup(u16 param_1){
  u16 uVar1;
  u16 *puVar2;
  u16 dialoug_voxel_flagAs[9]={0x13c0,0x141e,0x141f,0x1422,0x1423,0x142b,0x1447,0x1393,0xffff}

  if (dialoug_voxel_flagAs[0] != 0xffff) {
    puVar2 = dialoug_voxel_flagAs;
    do {
      uVar1 = *puVar2;
      puVar2++;
      if (uVar1 == param_1) {return true;}
    } while (*puVar2 != 0xffff);
  }
  return false;
}

void campfire_func(void){
  Borg_9_header *pBVar1;
  s32 iVar2;
  s32 iVar3;
  dialoug_dat *puVar4;
  mapVoxel *pVVar1;
  
  pBVar1 = get_borg_9(Borg9_campfire);
  puVar4 = NULL;
  if ((pBVar1->dat).voxelCount != 0) {
    pVVar1 = (mapVoxel *)(pBVar1->dat).ref_objs;
    if ((pVVar1->header).type == Dialouge) {puVar4 = (dialoug_dat *)pVVar1->data;}
    else {
      iVar2 = 1;
      do {
        iVar3 = (s32)(s16)iVar2;
        if ((s32)(u32)(pBVar1->dat).voxelCount <= iVar3) goto LAB_80006610;
        iVar2 = iVar3 + 1;
      } while (pVVar1[iVar3].header.type != Dialouge);
      puVar4 = (dialoug_dat *)pVVar1[iVar3].data;
    }
  }
LAB_80006610:
  dialoug_func((u32)puVar4->borg_13,puVar4->unk0x8,puVar4->unk0x2,puVar4->unk0x4,puVar4->unk0x6,0x7fff);
  remove_borg_9(pBVar1);
  return;
}