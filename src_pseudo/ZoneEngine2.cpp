#define FILENAME "./src/zoneengine.cpp"

#include "globals.h"
#ifdef DEBUGVER
#define DEBUGSprintf(fmt,...) Gsprintf(fmt,__VA_ARGS)
#else
#define DEBUGSprintf(fmt,...) ;
#endif

bool FUN_8000c9e0(void){
  ushort uVar3;
  bool ret;
  double dVar4;
  double dVar5;
  
  uVar3 = get_obj_free();
  dVar4 = get_MemFree();
  dVar5 = get_memFree_2()
  if (DAT_800e8dbe) DAT_800e8dbe--;  
  ret = false;
  if ((!gExpPakFlag) && (!DAT_800e8dbe)) {
    if (uVar3 < 0x29) return false;
    else if ((float)(40*0x1000) < dVar4) {
      if (dVar5 < (float)(24*0x1000)) {
        DAT_800e8dbe = 108;
        doubleGlobalTickerFlag = 2;
        noop_800969a4();
        FUN_80018c38();
        return true;
      }
      return  false;
    }
    return  false;
  }
  return ret;
}

mapFloatDat* FUN_8000cae8(vec3f *position,s16 mapshortA,s16 mapShortB,s16 param_4,s16 param_5){
  u16 uVar1;
  bool bVar2;
  int iVar3;
  int iVar4;
  mapFloatDat *pmVar5;

  mapFloatDat *pmVar6;
  mapFloatDat *pmVar7;
  float fVar8;
  float fVar9;
  vec3f globalPos;
  vec3f pvec3;
  vec3f fStack104;
  
  fVar9 = 0.0;
  if (param_5) fVar9 = 100000.0f;
  setVec3(&globalPos,position->x + (float)(mapshortA * 100),position->y,
          position->z + (float)(mapShortB * 100));
  iVar4 = 0;
  pmVar6 = NULL;
  for(u16 i=0;i<15;i++) {
    iVar3 = iVar4 * 0x10 + i * 0xc;
    pmVar5 = (mapFloatDat *)((int)&gGlobals.Sub.MapFloatDats[0][0].playerVec3 + iVar3);
    fVar8 = fVar9;
    pmVar7 = pmVar6;
    if (param_4 ==(&gGlobals.Sub.MapFloatDats[iVar4][i].mapDatA)[i * 6 + iVar4 * 8]) {
      CLEAR(&fStack104);
      uVar1 = (&gGlobals.Sub.MapFloatDats[0][0].MapShort1)[i * 6 + iVar4 * 8];
      pvec3.x = (pmVar5->playerVec3).x + (float)(((short)uVar1 * 0x18 + (int)(short)uVar1) * 4);
      uVar1 = (&gGlobals.Sub.MapFloatDats[0][0].MapShort2)[i * 6 + iVar4 * 8];
      pvec3.y = *(float *)((int)&gGlobals.Sub.MapFloatDats[0][0].playerVec3 + iVar3 + 4);
      pvec3.z = *(float *)((int)&gGlobals.Sub.MapFloatDats[0][0].playerVec3 + iVar3 + 8) +
                (float)(((short)uVar1 * 0x18 + (int)(short)uVar1) * 4);
      fStack104.x = pvec3.x;
      fStack104.y = pvec3.y;
      fStack104.z = pvec3.z;
      fVar8 = vec3_proximity(&globalPos,&pvec3);
      bVar2 = fVar9 < fVar8;
      if (param_5 == 0) {
        bVar2 = fVar8 < fVar9;
      }
      pmVar7 = pmVar5;
      if (bVar2) {
        fVar8 = fVar9;
        pmVar7 = pmVar6;
      }
    }
    fVar9 = fVar8;

    iVar4 = i << 1;
    pmVar6 = pmVar7;
  }
  return pmVar7;
}

bool FUN_8000ccc0(void){
  u16 uVar3;
  u32 uVar1;
  u32 uVar2;
  float fVar4;
  double dVar5;
  float fVar6;
  
  uVar3 = get_obj_free();
  fVar6 = (float)get_MemFree();
  fVar4 = (float)get_memFree_2();
  if (DAT_800e8dc4 == 0) {
    if (DAT_800e8dc6) DAT_800e8dc6--;
    if (gExpPakFlag) return false;
    if (DAT_800e8dc6) return false;
    if ((((gGlobals.Sub.mapDatA == 0) && (40 < uVar3)) &&
        ((double)(fVar4 / fVar6) < 0.5d)) || (no_ExpPak_memcheck_flag)) {
      no_ExpPak_memcheck_flag = 0;
      no_TP_vec3 = 1;
      DAT_800e8dc6 = 0xb4;
      doubleGlobalTickerFlag = 2;
      return true;
    }
  }
  else DAT_800e8dc4--;
  return false;
}

bool NoExpPak_memCheck(u16 x){
  bool bVar3;
  u32 theshA [5] = {0x18000,0x10000,0xc000,0x28000,0x18000};
  u32 threshB [5]= {0x10000,0xC000,0x6000,0x18000,0x10000};
  if (!gExpPakFlag) {
    bVar3 = true;
    if (get_MemFree() <= theshA[x]) {
      if (threshB[x] < get_memFree_2()) return true;
      else {
        no_ExpPak_memcheck_flag = 1;
        bVar3 = false;
      }
    }
  }
  else return true;
  return bVar3;
}

u8 EnvPropBools[25][2]={{0,0},{1,0},{1,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},
   {0,0},{0,0},{0,0},{0,0},{0,1},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}};

void ZoneEngine::InitEnvProps(void){
  bool (*pabVar1) [2];
  float fVar3;
  float fVar4;
  float fVar6;
  collisionTypeA *x;
  SpeedProperty *x_00;
  EnvProp *x_01;
  u16 uVar7;
  
  ALLOCS(gGlobals.Sub.zoneEnginePtr1,(sizeof(collisionTypeA)*2),456);
  ALLOCS(gGlobals.Sub.zoneEnginePtr2,(sizeof(SpeedProperty)*2),457);
  ALLOCS(gGlobals.Sub.EnvProps,(sizeof(EnvProp)*26),458);
  for(uVar7 = 0;uVar7 < 2;uVar7++) {
    x = gGlobals.Sub.zoneEnginePtr1 + uVar7;
    CLEAR(x);
    if (uVar7 == 0) {
      x->unk0 = 0.0;
      x->unk4 = 0.0;
    }
    else if (uVar7 == 1) {
      x->unk0 = 0.0;
      x->unk4 = 1.0;
    }
  }
  for(uVar7 = 0;uVar7 < 2;uVar7++)  {
    x_00 = gGlobals.Sub.zoneEnginePtr2 + uVar7;
    CLEAR(x_00);
    if (uVar7 == 0) {
      x_00->velScale = 1.0;
      (x_00->gravity).y = -0.06;
    }
    else if (uVar7 == 1) {
      x_00->velScale = .5;
      (x_00->gravity).y = -0.0015;
    }
  }
  for(uVar7 = 0;uVar7 < 26;uVar7++) {
    x_01 = gGlobals.Sub.EnvProps + uVar7;
    CLEAR(x_01);
    x_01->colA = gGlobals.Sub.zoneEnginePtr1 + EnvPropBools[uVar7][0];
    x_01->Speed = gGlobals.Sub.zoneEnginePtr2 + EnvPropBools[uVar7][1];
  }
}

void ZoneEngine::FreeEnvProps(void){
  HFREE(gGlobals.Sub.zoneEnginePtr1,558);
  HFREE(gGlobals.Sub.zoneEnginePtr2,559);
  HFREE(gGlobals.Sub.EnvProps,560);
  gGlobals.Sub.EnvProps = NULL;
  gGlobals.Sub.zoneEnginePtr1 = NULL;
  gGlobals.Sub.zoneEnginePtr2 = NULL;
}

void attachPhysicsProperties(Borg9data *param_1){
  ushort uVar1;
  borg9_phys *pbVar2;
  ushort uVar3;
  ushort uVar4;
  borg9_phys *puVar4;
  u16 uVar5;
  uint uVar6;
  
  if (param_1->borghpys_count != 0) {
    for(uVar5=0;uVar5<param_1->borghpys_count;uVar5++) {
      pbVar2 = param_1->phys_pointer;
      //union?
      uVar1 = *(ushort *)((int)&pbVar2[uVar5].envProperty + 2);
      if (0x19 < uVar1) {
        Gsprintf("Invalid Physics Property: %d\n",uVar1);
        CRASH("AttachPhysicsProperties",gGlobals.text);
      }
      uVar3 = pbVar2[uVar5].GroundType;
      uVar4 = uVar3 & 0xf000;
      if (uVar4 == 0x1000) {
        uVar3 = (ushort)((uVar3 + 1 & 0x7f) << 5) | 0x1000 | uVar1 & 0x1f;
LAB_8000d2c4:
        pbVar2[uVar5].GroundType = uVar3;
        pbVar2[uVar5].flags |= 0x1000;
      }
      else {
        if (uVar4 < 0x1001) {
          if ((uVar3 & 0xf000) != 0) {
            uVar1 = pbVar2[uVar5].GroundType;
LAB_8000d25c:
            Gsprintf("Unknown attach: %04x\n",uVar1);
            CRASH("AttachPhysicsProperties",gGlobals.text);
          }
LAB_8000d2bc:
          uVar4 = pbVar2[uVar5].flags;
          uVar3 = uVar1 | 0x3000;
          goto LAB_8000d2c4;
        }
        if (uVar4 == 0x2000) {
          uVar4 = pbVar2[uVar5].flags;
          uVar3 = (ushort)((uVar3 & 0x7f) << 5) | 0x2000 | uVar1 & 0x1f;
          goto LAB_8000d2c4;
        }
        if (uVar4 != 0x4000) {
          uVar1 = pbVar2[uVar5].GroundType;
          goto LAB_8000d25c;
        }
        if (gExpPakFlag != 0) goto LAB_8000d2bc;
        pbVar2[uVar5].flags = 1;
        pbVar2[uVar5].GroundType = 0;
      }
      pbVar2[uVar5].envProperty = gGlobals.Sub.EnvProps + uVar1;
    }
  }
}

Borg9data * GetCollisionZone(u8 x){
  Borg9header **ppBVar1 = &gGlobals.Sub.ZoneDatMtx[x >> 4][x & 3].mapPointer;
  if (*ppBVar1) return &(*ppBVar1)->dat;
  CRASH("GetCollisionZone","No Zone at Grid");
}

void set_teleport_pointer(voxelObject *param_1){
  gGlobals.Sub.refObjPointer = param_1;
  gGlobals.Sub.tpVec3 = NULL;
  if (((gGlobals.screenFadeMode == 0) && (0.0 < gGlobals.brightness)) ||
     (gGlobals.ticker - initZoneTimestamp < 3)) {
    gGlobals.screenFadeMode = 1;
    gGlobals.screenFadeSpeed = 0.06666667f;
  }
}

voxelObject bss_tele_obj;
vec3f vec3_800f5210;
void set_teleport_obj_A(u16 param_1,u16 param_2,u16 param_3,vec3f *param_4){
  gGlobals.Sub.refObjPointer = &bss_tele_obj;
  gGlobals.Sub.tpVec3 = &vec3_800f5210;
  copyVec3(param_4,&vec3_800f5210);
  CLEAR(&bss_tele_obj);
  bss_tele_obj.teleport.MapDatA = param_1;
  bss_tele_obj.teleport.MapShort1 = param_2;
  bss_tele_obj.teleport.MapShort2 = param_3;
  bss_tele_obj.header.type = VOXEL_Teleporter;
}
voxelObject loadgame_tp_obj;
void set_teleport_obj_loadgame(u16 param_1,u16 param_2,u16 param_3,vec3f *param_4){
  gGlobals.Sub.refObjPointer = &loadgame_tp_obj;
  gGlobals.Sub.tpVec3 = NULL;
  CLEAR(&loadgame_tp_obj);
  loadgame_tp_obj.header.type = VOXEL_Teleporter;
  loadgame_tp_obj.teleport.refPoint_Pos = 0x7ff8;
  loadgame_tp_obj.teleport.MapDatA = param_1;
  loadgame_tp_obj.teleport.MapShort1 = param_2;
  loadgame_tp_obj.teleport.MapShort2 = param_3;
  copyVec3(param_4,&loadgame_tp_obj.header.pos);
}


void check_trigger(collisionSphere *param_1,borg9_phys *param_2){
  Vobject VVar1;
  playerData *ppVar2;
  ushort uVar3;
  bool bVar4;
  playerData *ppVar5;
  voxelObject *ptVar6;
  
  ppVar2 = param_1->link;
  ppVar5 = NULL;
  if (ppVar2) {
    uVar3 = param_2->GroundType & 0x1f;
    ppVar2->Ground_type = uVar3;
    ppVar5 = ppVar2;
    if (uVar3 < 0x1a) {
      if (uVar3 >= 0xe) {
      if (ppVar2->alaron_flag) gPlayerRenderTimer = 0x14;
      }
    }
  }
  if (((((param_2->GroundType & 0xf000) == 0x2000) && ((param_1->flags & 0x400) == 0)) &&
      (gGlobals.playerCharStruct.unkState == 3)) &&
     ((some_toggle == -1 &&
      (ptVar6 = (gGlobals.Sub.borg9DatPointer)->voxelObjs + (param_2->GroundType >> 5 & 0x7f),
      ((ptVar6->header).Bitfeild & VOXEL_Active) != 0)))) {
    //todo: redo as case-switch
    VVar1 = (ptVar6->header).type;
    if (VVar1 == VOXEL_Camera) {
      set_camera_voxel_pointer(ptVar6,&param_1->pos);
    }
    else {
      if (VVar1 < VOXEL_Dialouge) {
        if (VVar1 == VOXEL_Teleporter) {
          set_teleport_pointer(ptVar6);
          return;
        }
      }
      else if (VVar1 == VOXEL_Dialouge) {
        if (!dialoug_obj_func(ptVar6,ppVar5)) return;
        dialouge_vobject_func(ptVar6,0,0xff);
        return;
      }
      Gsprintf("Invalid Trigger Type: %d\n",(uint)VVar1);
      N64Print::Print(gGlobals.text);
    }
  }
  return;
}

void init_some_map_data(ZoneDat *dat,short i,char j){
  CLEAR(dat);
  dat->flag = 7;
  dat->index = (char)((int)i << 4) + j;
}

void FUN_8000d744(void){
  for(s16 i = 0;i < 3;i++){
    for(s16 j = 0;j < 3;j++) {
      init_some_map_data(&gGlobals.Sub.ZoneDatMtx[i][j],(short)i,(char)j);
    }
  }
}

void Zonedat_clear(ZoneDat *param_1,short param_2,short param_3){
  ushort uVar1;
  Borg9header *pBVar2;
  voxelObject *pvVar3;
  int iVar4;
  Borg9header *pBVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  uint uVar10;
  voxelObject *pVVar8;
  
  pBVar2 = param_1->mapPointer;
  if ((param_1->anidat0x4) && (param_2)) {
    AllocFreeQueueItem(&gGlobals.QueueA,&param_1->anidat0x4,1,0);
    param_1->flag |= 1;
  }
  if (param_1->aniDat0x14){
    if (param_2) {
      AllocFreeQueueItem(&gGlobals.QueueA,&param_1->aniDat0x14,1,0);
      param_1->flag |= 2;
    }
  }
  if (param_1->mapPointer) {
    if (param_3 == 0) {
      FreeWandererFromZone(&gGlobals.wander,param_1->MapTally);
      clear_sfx_on_map(&gGlobals.SFXStruct,param_1->MapTally);
    }
    if ((pBVar2->dat).voxelObjCount) {
      //todo: redo as for loop for scene-type VocelObjects.
      iVar6 = 0;
      do {
        iVar6 = iVar6 * 4 + uVar8 * -5;
        pvVar3 = (pBVar2->dat).voxelObjs;
        if ((*(short *)((int)pvVar3 + iVar6 * 4 + 0x16) == 0) &&
           (uVar10 = 0, *(short *)((int)pvVar3 + iVar6 * 4 + 0x68) != 0)) {
          iVar4 = iVar6 * 4 + 0x30;
          iVar7 = 0;
          do {
            iVar9 = (iVar7 + uVar10) * 4;
            if (*(int *)((int)pvVar3 + iVar9 + iVar4) != 0) {
              if ((*(ushort *)((int)pvVar3 + iVar6 * 4 + 0x6a) & 2) == 0) {
                AllocFreeQueueItem(&gGlobals.QueueA,(void *)((int)pvVar3 + iVar9 + iVar6 * 4 + 0x30)
                                   ,1,0);
              }
              else {
                AllocFreeQueueItem(&gGlobals.QueueA,(void *)((int)pvVar3 + iVar9 + iVar6 * 4 + 0x30)
                                   ,0,0);
              }
              *(undefined4 *)((int)pvVar3 + (iVar7 + uVar10) * 4 + iVar4) = 0;
            }
            uVar10 = uVar10 + 1 & 0xffff;
            iVar7 = uVar10 << 1;
          } while (uVar10 < *(ushort *)((int)pvVar3 + iVar6 * 4 + 0x68));
        }
        uVar8 = uVar8 + 1 & 0xffff;
        iVar6 = uVar8 << 3;
      } while (uVar8 < (pBVar2->dat).voxelObjCount);
    }
    if (param_3) return;
    remove_borg_9(param_1->mapPointer);
    param_1->mapPointer = NULL;
  }
  if (param_3 == 0) {
    param_1->borg5_ID = 0;
    param_1->borg9_id = 0;
    param_1->unk0x10 = 0;
  }
}

void ofunc_zoneengine_free(void){
  int iVar1;
  ZoneDat *pZVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  iVar4 = 0;
  iVar5 = 1;
  do {
    pZVar2 = gGlobals.Sub.ZoneDatMtx[iVar4];
    iVar3 = 0x10000;
    do {
      Zonedat_clear(pZVar2,1,0);
      iVar1 = iVar3 >> 0x10;
      pZVar2 = pZVar2 + 1;
      iVar3 = iVar3 + 0x10000;
    } while (iVar1 < 3);
    HeapFree(gGlobals.Sub.ZoneDatMtx + iVar4,FILENAME,1034);
    iVar4 = (int)(short)iVar5;
    iVar5 = iVar4 + 1;
  } while (iVar4 < 3);
  //old bug?
  HeapFree(&gGlobals.Sub,FILENAME,1036);
}

void move_zonedat(ZoneDat *param_1,ZoneDat *param_2){
  Borg9header *pBVar1;
  AnimationData *pAVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  ZoneDat *x;
  int iVar6;
  int iVar7;
  
  if (param_2->borg5_ID != 0) {
    iVar6 = 0;
    iVar7 = 0x10000;
    do {
      x = (ZoneDat *)((int)&param_1->borg5_ID + iVar6);
      iVar5 = 0x10000;
      do {
        if ((x->borg5_ID == param_2->borg5_ID) && (x->borg9_id == param_2->borg9_id)) {
          pBVar1 = x->mapPointer;
          param_2->anidat0x4 = x->anidat0x4;
          pAVar2 = x->aniDat0x14;
          param_2->mapPointer = pBVar1;
          param_2->aniDat0x14 = pAVar2;
          param_2->alpha = x->alpha;
          uVar3 = x->MapTally;
          param_2->flag = 3;
          param_2->MapTally = uVar3;
          memset(x,0,0x20);
          return;
        }
        iVar4 = iVar5 >> 0x10;
        x = x + 1;
        iVar5 = iVar5 + 0x10000;
      } while (iVar4 < 3);
      iVar5 = iVar7 >> 0x10;
      iVar6 += 0x60;
      iVar7 = iVar7 + 0x10000;
    } while (iVar5 < 3);
  }
}

void checkToggleZoneScene(ZoneDat *param_1){
  if(param_1->anidat0x4) CRASH("CheckToggleZoneScene","Scene already loaded!!\n");
  if ((param_1->borg5_ID == 0xea9)&&(getEventFlag(0x1399))) param_1->borg5_ID = 0x35ba;
  else if ((param_1->borg5_ID == 0x11f9) && (getEventFlag(0x1399))) param_1->borg5_ID = 0x35af;
}

void MakeGameZoneNames(u16 param_1,u16 param_2){
  ushort uVar1;
  ushort uVar2;
  int iVar3;
  int iVar4;
  ZoneDat *dat;
  int iVar5;
  int iVar6;
  int iVar7;
  
  if ((param_1 < 0x17) && (iVar6 = 0, uVar1 = param_1, uVar2 = param_2, param_2 < 0x1f)) {
    do {
      gGlobals.Sub.mapShort2 = uVar2;
      gGlobals.Sub.mapShort1 = uVar1;
      iVar4 = 0;
      iVar5 = (short)param_2 + -1;
      iVar3 = ((short)param_1 + iVar6 + -1) * 0x10000 >> 0x10;
      iVar7 = 0x10000;
      do {
        dat = &gGlobals.Sub.ZoneDatMtx[iVar6][iVar4];
        init_some_map_data(dat,(short)iVar6,(char)iVar4);
        iVar4 = (int)(short)iVar5;
        if ((iVar3 - 1U < 0x15) && (iVar4 - 1U < 0x1d)) {
          dat->borg5_ID = gLoadedMapIndecies[iVar3][iVar4][0];
          dat->borg9_id = gLoadedMapIndecies[iVar3][iVar4][1];
          dat->unk0x10 = gLoadedMapIndecies[iVar3][iVar4][2];
          checkToggleZoneScene(dat);
        }
        iVar4 = iVar7 >> 0x10;
        iVar5 += 1;
        iVar7 = iVar7 + 0x10000;
      } while (iVar4 < 3);
      iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
      uVar1 = gGlobals.Sub.mapShort1;
      uVar2 = gGlobals.Sub.mapShort2;
    } while (iVar6 < 3);
    return;
  }
  Gsprintf("Zone out of Range\nZone: (%d, %d)\nRange: (%d, %d)",param_1,param_2,22,30);
  CRASH("MakeGameZoneNames",gGlobals.text);
}

void zoneDat_moveAniDat(AnimationData *param_1,u8 index){
  float x;
  float y;
  
  if (!param_1) return;
  param_1->flags = 0;
  guMtxIdentF(&param_1->matrixA);
  guMtxIdentF(&param_1->matrixB);
  Animation::SetFlag10(param_1);
  Animation::SetFogFlag(param_1);
  Animation::SetFlag8(param_1);
  if (index == 0x11) Animation::UnsetFlag4(param_1);
  else Animation::SetFlag4(param_1);
  if (false) return;
  y = gGlobals.Sub.mapCellSize.y;
  switch(index) {
  case 0:
    x = -gGlobals.Sub.mapCellSize.x;
    y = -gGlobals.Sub.mapCellSize.y;
    break;
  case 1:
    y = -gGlobals.Sub.mapCellSize.x;
    goto LAB_8000df9c;
  case 2:
    x = -gGlobals.Sub.mapCellSize.x;
    break;
  default:
    return;
  case 0x10:
    x = 0.0;
    y = -gGlobals.Sub.mapCellSize.y;
    break;
  case 0x11:
    y = 0.0;
    goto LAB_8000df9c;
  case 0x12:
    x = 0.0;
    break;
  case 0x20:
    x = gGlobals.Sub.mapCellSize.x;
    y = -gGlobals.Sub.mapCellSize.y;
    break;
  case 0x21:
    y = gGlobals.Sub.mapCellSize.x;
LAB_8000df9c:
    Animation::MatrixASetPos(param_1,y,0.0,0.0);
    return;
  case 0x22:
    Animation::MatrixASetPos(param_1,gGlobals.Sub.mapCellSize.x,0.0,gGlobals.Sub.mapCellSize.y);
    return;
  }
  Animation::MatrixASetPos(param_1,x,0.0,y);
}

void zonedat_clear_all(void){
  s32 iVar1;
  s32 iVar2;
  ZoneDat (*paZVar3) [3];
  s32 iVar4;
  
  iVar2 = 0;
  iVar4 = 1;
  do {
    paZVar3 = gGlobals.Sub.ZoneDatMtx[iVar2];
    iVar2 = 0x10000;
    do {
      Zonedat_clear((ZoneDat *)paZVar3,1,0);
      iVar1 = iVar2 >> 0x10;
      paZVar3 = (ZoneDat (*) [3])(*paZVar3 + 1);
      iVar2 = iVar2 + 0x10000;
    } while (iVar1 < 3);
    iVar2 = (s32)(s16)iVar4;
    iVar4 = iVar2 + 1;
  } while (iVar2 < 3);
  return;
}

void FreeZoneEngineMemory(void){
  int iVar1;
  ZoneDat *pZVar2;
  int iVar3;
  ZoneDat *pZVar4;
  int iVar5;

  
  N64Print::Print("FreeZoneEngineMemory\n");
  gFreeZoneEngineTimer = 0x78;
  no_TP_vec3 = 1;
  if (FreeZoneEngineTimestamp == handeZoneEngineTimestamp)
   {CRASH("FreeZoneEngineMemory","HandleZoneEngineFrame AND\nFreeZoneEngineMemory called on\nthe same frame!");}
  iVar3 = 0;
  FreeZoneEngineTimestamp = gGlobals.ticker;
  do {
    iVar1 = 0;
    pZVar4 = gGlobals.Sub.ZoneDatMtx[iVar3];
    iVar5 = 0x10000;
    pZVar2 = pZVar4;
    do {
      if (iVar3 == iVar1) Zonedat_clear(pZVar4 + iVar3,0,1);
      else Zonedat_clear(pZVar2,1,1);
      iVar1 = iVar5 >> 0x10;
      pZVar2 = pZVar2 + 1;
      iVar5 = iVar5 + 0x10000;
    } while (iVar1 < 3);
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while (iVar3 < 3);
  noop_800969a4();
  FUN_80018c38();
}

void loading_map_data(ZoneDat *param_1){
    if ((param_1->mapPointer == NULL) && (param_1->borg9_id)) {
    param_1->MapTally = gGlobals.maptally++;
    param_1->mapPointer = get_borg_9(param_1->borg9_id);
    attachPhysicsProperties(&param_1->mapPointer->dat);
    render_ref_objs(&param_1->mapPointer->dat,param_1->index);
    look_for_monsterparties(&gGlobals.wander,&param_1->mapPointer->dat,param_1->MapTally,param_1->index);
    audio_ref_objs(&gGlobals.SFXStruct,&param_1->mapPointer->dat,param_1->MapTally,param_1->index);
    if (gSceneBoulder) SceneBoulders(&param_1->mapPointer->dat);
  }
}

void loadGameBorgScenes(u16 ShortA,u16 ShortB){
  undefined uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  playerData *ppVar9;
  int iVar10;
  uint uVar11;
  AnimationData *pAVar12;
  bool bVar13;
  int iVar14;
  short sVar15;
  undefined4 *puVar16;
  undefined4 *puVar17;
  int iVar18;
  ZoneDat *pZVar19;
  uint uVar20;
  uint uVar21;
  uint uVar22;
  int iVar23;
  AnimationData **ppAVar24;
  AnimationData **ppAVar25;
  double dVar26;
  int in_f1;
  ZoneDat aZStack432 [3] [3];
  ushort uStack112 [16];
  uint uStack_30;
  
  sVar15 = no_TP_vec3;
  uStack112={0,0,1,0,2,0,0,1,2,1,0,2,1,2,2,2};
  no_TP_vec3 = 0;
  uStack_30 = (uint)(sVar15 == 0);
  Process_queue_B(&gGlobals.QueueB,1);
  iVar18 = 0;
  iVar10 = 0x10000;
  do {
    puVar17 = (undefined4 *)((int)&gGlobals.Sub.ZoneDatMtx[0][0].borg5_ID + iVar18);
    puVar16 = (undefined4 *)((int)&aZStack432[0][0].borg5_ID + iVar18);
    iVar14 = 0x10000;
    do {
      uVar2 = *puVar17;
      uVar3 = puVar17[1];
      uVar4 = puVar17[2];
      uVar5 = puVar17[3];
      uVar6 = puVar17[4];
      uVar7 = puVar17[5];
      uVar1 = *(undefined *)(puVar17 + 7);
      uVar8 = puVar17[6];
      puVar17 = puVar17 + 8;
      iVar23 = iVar14 >> 0x10;
      *puVar16 = uVar2;
      puVar16[1] = uVar3;
      puVar16[2] = uVar4;
      puVar16[3] = uVar5;
      puVar16[4] = uVar6;
      puVar16[5] = uVar7;
      *(undefined *)(puVar16 + 7) = uVar1;
      puVar16[6] = uVar8;
      puVar16 = puVar16 + 8;
      iVar14 = iVar14 + 0x10000;
    } while (iVar23 < 3);
    iVar14 = iVar10 >> 0x10;
    iVar18 += 0x60;
    iVar10 = iVar10 + 0x10000;
  } while (iVar14 < 3);
  MakeGameZoneNames(ShortA,ShortB);
  iVar18 = 0;
  iVar10 = 0x10000;
  do {
    pZVar19 = (ZoneDat *)((int)&gGlobals.Sub.ZoneDatMtx[0][0].borg5_ID + iVar18);
    iVar14 = 0x10000;
    do {
      move_zonedat(aZStack432[0],pZVar19);
      iVar23 = iVar14 >> 0x10;
      pZVar19 = pZVar19 + 1;
      iVar14 = iVar14 + 0x10000;
    } while (iVar23 < 3);
    iVar14 = iVar10 >> 0x10;
    iVar18 += 0x60;
    iVar10 = iVar10 + 0x10000;
  } while (iVar14 < 3);
  iVar18 = 0;
  iVar10 = 0;
  do {
    pZVar19 = aZStack432[0] + iVar10 + iVar18;
    iVar10 = 0x10000;
    do {
      Zonedat_clear(pZVar19,1,0);
      iVar14 = iVar10 >> 0x10;
      pZVar19 = pZVar19 + 1;
      iVar10 = iVar10 + 0x10000;
    } while (iVar14 < 3);
    iVar18 = (iVar18 + 1) * 0x10000 >> 0x10;
    iVar10 = iVar18 << 1;
  } while (iVar18 < 3);
  loading_map_data(gGlobals.Sub.ZoneDatMtx[1] + 1);
  if ((gGlobals.Sub.ZoneDatMtx[1][1].borg5_ID == 0) ||
     (uVar21 = 1, gGlobals.Sub.ZoneDatMtx[1][1].borg9_id == 0)) {
    ppVar9 = gGlobals.playerCharStruct.playerDat;
    if (gGlobals.screenFadeModeSwitch == 2) {
      ppVar9 = gGlobals.playerDataArray[gCombatP->current_Ent->index];
    }
    Gsprintf("Center scene not in Borg.\nPlayer Pos: (%3.4f, %3.4f)\nNew Grid: %d-%c%02d",
      (ppVar9->collision).position.x,(ppVar9->collision).position.z,gGlobals.Sub.mapDatA,gGlobals.Sub.mapShort1 - 1 + 0x41,gGlobals.Sub.mapShort2);
    CRASH("LoadGameBorgScenes",gGlobals.text);
  }
  uVar20 = 0;
  uVar22 = (uint)((gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat).byte0x1a;
  uVar11 = uVar22 & 1;
  do {
    if (uVar11 != 0) {
      Zonedat_clear((ZoneDat *)
                    ((uint)uStack112[uVar20 * 2] * 0x60 + -0x7ff19678 +
                    (uint)uStack112[uVar20 * 2 + 1] * 0x20),1,0);
    }
    uVar21 = (uVar21 & 0x7f) << 1;
    uVar20 = uVar20 + 1 & 0xffff;
    uVar11 = uVar22 & uVar21;
  } while (uVar20 < 8);
  iVar10 = 0;
  do {
    iVar18 = 0;
    ppAVar25 = &gGlobals.Sub.ZoneDatMtx[iVar10][0].aniDat0x14;
    ppAVar24 = &gGlobals.Sub.ZoneDatMtx[iVar10][0].anidat0x4;
    pZVar19 = gGlobals.Sub.ZoneDatMtx[iVar10];
    do {
      if ((pZVar19->borg5_ID) &&(pZVar19->anidat0x4 == NULL)) {
        pZVar19->alpha = 0xff;
        if (pZVar19->index == 0x11) {
          pZVar19->anidat0x4 = BorgAnimLoadScene(pZVar19->borg5_ID);
        }
        else {
          if ((!debug::oneZone_load) && (NoExpPak_memCheck(3))) {
            AllocAllocQueueItem(&gGlobals.QueueB,ppAVar24,0,pZVar19->borg5_ID,1,(char)uStack_30);
          }
        }
      }
      if ((pZVar19->unk0x10 != 0) && (pZVar19->aniDat0x14 == NULL)) {
        if (pZVar19->index == 0x11) {
          pAVar12 = BorgAnimLoadScene(uVar21);
          pZVar19->aniDat0x14 = pAVar12;
        }
        else if ((debug::oneZone_load == 0) && (bVar13 = NoExpPak_memCheck(4), bVar13)) {
          AllocAllocQueueItem(&gGlobals.QueueB,ppAVar25,0,pZVar19->unk0x10,1,(char)uStack_30);
        }
      }
      loading_map_data(pZVar19);
      sVar15 = gGlobals.sky.Type;
      if (pZVar19->index == 0x11) {
        gGlobals.Sub.borg9DatPointer = &pZVar19->mapPointer->dat;
        gGlobals.Sub.particleEmmiter.borg9dat = gGlobals.Sub.borg9DatPointer;
        BorgMaps::GetMapTerrain(gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
        if ((gGlobals.sky.Type == 3) && (sVar15 == 3)) {
          if (gGlobals.Sub.weather._0_4_ == 0) {
            SetBackgroundType(3,gGlobals.Sub.weather.skyBgdat,600.0);
          }
          else {
            N64Print::Print("Different Precip types, Don't set sky\n");
          }
        }
        else {
          sVar15 = gGlobals.Sub.weather.skyBgdat;
          if (((gGlobals.sky.Type == 3) && ((short)gGlobals.Sub.weather.rainShortA < 3)) &&
             (0 < (short)gGlobals.Sub.weather.rainShortA)) {
            sVar15 = 2;
          }
          SetBackgroundType(gGlobals.sky.Type,sVar15,0.0);
          gGlobals.Sub.weather.fogTime = TerrainPointer->FogFloat;
        }
      }
      ppAVar25 = ppAVar25 + 8;
      ppAVar24 = ppAVar24 + 8;
      iVar18 = (iVar18 + 1) * 0x10000 >> 0x10;
      pZVar19 = pZVar19 + 1;
    } while (iVar18 < 3);
    iVar10 = (iVar10 + 1) * 0x10000 >> 0x10;
    if (2 < iVar10) {
      if (((gGlobals.Sub.gamemodeType == 0) && (gGlobals.minimap.active == 0)) &&
         (gGlobals.sky.Type == 3)) {
        set_map_event_flag(gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
      }
      return;
    }
  } while( true );
}

void ApplyZoneVelocity(vec3f *param_1,playerData *param_2){
  (param_2->collision).pos.x += (*param_1).x;
  (param_2->collision).pos.y += (*param_1).y;
  (param_2->collision).pos.z += (*param_1).z;
  if (param_2->flags & ACTOR_ISPLAYER) GiveCameraToPlayer(param_2);
  Camera::ApplyVelocity(&gGlobals.Sub.camera,param_1);
  FUN_8001b888(&gGlobals.Sub.particleEmmiter,param_1);
}

voxelObject * FindReferncePoint(Borg9data *param_1,short param_2){  
  if (param_1->voxelObjCount) {
    for(u16 uVar2 = 0;uVar2 < param_1->voxelObjCount;uVar2++) {
      voxelObject *prVar2 = &param_1->voxelObjs[uVar2];
      if (((prVar2->header).type == VOXEL_ReferencePoint) && (prVar2->refpoint.refpointID == param_2)) {
        return prVar2;
      }
    }
  }
  return NULL;
}

voxelObject * get_map_referencepoint(Borg9data *param_1,short param_2){
  //seems to duplicate the above function.
  if (param_1->voxelObjCount) {
    for(u16 uVar2 = 0;uVar2 < param_1->voxelObjCount;uVar2++) {
      voxelObject *prVar2 = &param_1->voxelObjs[uVar2];
      if (((prVar2->header).type == VOXEL_ReferencePoint) && (prVar2->refpoint.refpointID == param_2)) {
        return prVar2;
      }
    }
  }
  return NULL;
}

voxelObject * FindReferncePointName(Borg9data *param_1,char *name,bool param_3){
  u16 uVar1;
  int iVar2;
  u16 uVar3;
  char *pcVar4;
  u16 uVar5;
  char *pcVar6;
  uint uVar7;
  voxelObject *prVar7;
  
  uVar1 = strlen(name);
  uVar7 = 0;
  if (param_1->voxelObjCount) {
    //todo: redo as for loops
    iVar2 = 0;
    do {
      prVar7 = &param_1->voxelObjs[uVar7];
      if ((prVar7->header).type == VOXEL_ReferencePoint) {
        pcVar6 = (prVar7->refpoint).name;
        if (uVar1 == strlen(pcVar6)) {
          uVar3 = 0;
          uVar5 = 0;
          pcVar4 = name;
          if (uVar1 != 0) {
            do {
              if (*pcVar4 == pcVar6[uVar3]) uVar5++;
              uVar3++;
              pcVar4 = name + uVar3;
            } while (uVar3 < uVar1);
          }
          if (uVar5 == uVar1) return prVar7;
        }
      }
      uVar7++;
    } while (uVar7 < param_1->voxelObjCount);
  }
  if (!param_3)return NULL;
  CRASH("FindReferencePointName","Point Not Found");
}

u32 get_zoneDatByte(s16 param_1,s16 param_2,u32 param_3){
  u16 uVar2 = ((param_3 & 0xff) >> 4) + ((u32)gGlobals.Sub.mapShort1 - (s32)param_1);
  u16 uVar1 = (param_3 & 0xf) + ((u32)gGlobals.Sub.mapShort2 - (s32)param_2);
  if ((uVar2 < 3) && (uVar1 < 3)) return (uVar2 << 4 | uVar1);
  return 0x11;
}

void set_playerdata_zoneDatByte(u16 param_1,u16 param_2){
  s16 iVar3;
  playerData *iVar2;
  
  if (0 < gGlobals.Sub.PlayerHandler.max_player) {
    for(iVar3=0; iVar3 < gGlobals.Sub.PlayerHandler.max_player; iVar3++) {
      iVar2 = gGlobals.Sub.PlayerHandler.playerDats)[iVar3];
      if ((iVar2->removeFlag != 0) && (iVar2->visible_flag == 0)) {
        iVar2->zoneDatByte = get_zoneDatByte(param_1,param_2,iVar2->zoneDatByte);
      }
    }
  }
  return;
}

void some_zoneDat_func(void){
  u8 bVar1;
  s32 iVar2;
  AnimationData *pAVar3;
  s32 iVar4;
  Borg_9_header *pBVar5;
  ZoneDat (*iVar3) [3];
  s32 iVar6;
  
  iVar4 = 0;
  iVar6 = 1;
  do {
    iVar3 = gGlobals.Sub.ZoneDatMtx[iVar4];
    iVar4 = 0x10000;
    do {
      pAVar3 = (*iVar3)[0].anidat0x4;
      if (pAVar3 == NULL) {pAVar3 = (*iVar3)[0].aniDat0x14;}
      else {
        bVar1 = (*iVar3)[0].unk0x1e;
        if ((bVar1 & 1) != 0) {
          (*iVar3)[0].unk0x1e = bVar1 & 0xfe;
          FUN_8000de18(pAVar3,(*iVar3)[0].index);
        }
        pAVar3 = (*iVar3)[0].aniDat0x14;
      }
      if (pAVar3 == NULL) {pBVar5 = (*iVar3)[0].mapPointer;}
      else {
        bVar1 = (*iVar3)[0].unk0x1e;
        if ((bVar1 & 2) != 0) {
          (*iVar3)[0].unk0x1e = bVar1 & 0xfd;
          FUN_8000de18(pAVar3,(*iVar3)[0].index);
        }
        pBVar5 = (*iVar3)[0].mapPointer;
      }
      if ((pBVar5) && (DAT_800e8dbc))
       {audio_ref_objs(&gGlobals.SFXStruct,&pBVar5->dat,(*iVar3)[0].MapTally,(*iVar3)[0].index);}
      iVar2 = iVar4 >> 0x10;
      iVar3 = (ZoneDat (*) [3])(*iVar3 + 1);
      iVar4 = iVar4 + 0x10000;
    } while (iVar2 < 3);
    iVar4 = (s32)(s16)iVar6;
    iVar6++;
  } while (iVar4 < 3);
  DAT_800e8dbc = 0;
}



void TeleportPlayer(playerData *player,voxelObject *tp,vec3f *param_3){
  ushort uVar1;
  ushort uVar2;
  int iVar3;
  int iVar4;
  voxelObject *pfVar8;
  bool bVar5;
  int iVar6;
  u16 ShortA;
  int iVar7;
  int iVar8;
  vec3f *pvVar9;
  float fVar10;
  vec3f fStack312;
  vec3f fStack248;
  vec3f fStack184;
  vec3f fStack120;
  voxelObject *prStack_38;
  
  prStack_38 = NULL;
  uVar1 = (tp->teleport).refPoint_Pos;
  uVar2 = (tp->teleport).refPoint_Cam;
  iVar4 = (int)gGlobals.sky.Type;
  memset_voxelChart_entries();
  pfVar8 = NULL;
  clear_camera_voxel_pointer();
  bVar5 = false;
  set_playerdata_zoneDatByte((tp->teleport).MapShort1,(tp->teleport).MapShort2);
  set_SFX_ZoneDatByte(&gGlobals.SFXStruct,(tp->teleport).MapShort1,(tp->teleport).MapShort2);
  gGlobals.Sub.mapDatA = (tp->teleport).MapDatA;
  gGlobals.Sub.mapShort1 = (tp->teleport).MapShort1;
  gGlobals.Sub.mapShort2 = (tp->teleport).MapShort2;
  gGlobals.Sub.mapDatB = 0xffff;
  gGlobals.Sub.mapDatC = 0xffff;
  BorgMaps::LoadMap(gGlobals.Sub.mapDatA,-1,-1,false);
  clear_music_no_expPak();
  if (param_3 == NULL) {
    no_TP_vec3 = 1;
    ShortA = (tp->teleport).MapShort1;
  }
  else {
    ShortA = (tp->teleport).MapShort1;
  }
  loadGameBorgScenes(ShortA,(tp->teleport).MapShort2);
  if (param_3 == NULL) {
    if (gGlobals.sky.Type == 4) {
      set_camera_mode(&gGlobals.Sub.camera,1);
    }
    if (gGlobals.sky.Type == 3) {
      set_camera_mode(&gGlobals.Sub.camera,0);
    }
    if (uVar1 == 0x7ff8) {
      fStack312.x = (tp->header).pos.x;
      fStack312.y = (tp->header).pos.y;
      fStack312.z = (tp->header).pos.z;
    }
    else {
      pfVar8 = FindReferncePoint(&(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat,uVar1);
      Gsprintf("FindReferencePoint\nPoint Not Found: %d\n",(uint)uVar1);
      if (pfVar8 == NULL) CRASH("TeleportPlayer",gGlobals.text);
      fStack312.x = (pfVar8->header).pos.x;
      fStack312.y = (pfVar8->header).pos.y;
      fStack312.z = (pfVar8->header).pos.z;
    }
    if (uVar2 != 0) prStack_38 = FindReferncePoint(&(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat,uVar2);
    if (player) Vec3_sub(&fStack312,&fStack312,&(player->collision).pos);
    fStack312.y = 0.0;
    if (pfVar8 != NULL) {
      pvVar9 = &(pfVar8->refpoint).position;
      (pfVar8->refpoint).position.y = 0.0;
      vec3_normalize(pvVar9);
      fVar10 = vec3Length(pvVar9);
      if (0.5d < (double)fVar10) {
        setVec2(&player->facing,-(pfVar8->refpoint).position.x,-(pfVar8->refpoint).position.z);
      }
    }
  }
  else {
    copyVec3(param_3,&fStack312);
    bVar5 = true;
  }
  if (player) {
    ApplyZoneVelocity(&fStack312,player);
    pvVar9 = &(player->collision).pos;
    copyVec3(pvVar9,&fStack312);
    if (pfVar8 == NULL) {
      fVar10 = (player->collision).pos.y;
    }
    else {
      fVar10 = (pfVar8->header).pos.y;
    }
    if (!bVar5) {
      if (!PlayerData::CheckCollision(player,fVar10 - (player->collision).radius,1,0);) {
        PlayerData::CheckCollision(player,0.0,0,0);
      }
      gGlobals.Sub.weather.rainParticles = NULL;
      FUN_800b2bc4(&gGlobals.Sub.particleEmmiter);
    }
    set_camera_0x70(&gGlobals.Sub.camera,pvVar9);
  }
  if (prStack_38 == NULL) {
    if ((player != NULL) && (param_3 == NULL)) {
      if (gGlobals.sky.Type == 4) {
        fStack184.x = (player->collision).pos.x;
        fVar10 = (player->collision).pos.y;
        fStack184.z = (player->collision).pos.z;
        fStack184.y = fVar10 + gGlobals.Sub.camera.camHeight;
        fStack248.x = fStack184.x - (player->facing).x * 4.0f;
        fStack248.y = fVar10 + 3.0f;
        fStack248.z = fStack184.z - (player->facing).y * 4.0f;
        camera_set_position(&gGlobals.Sub.camera,&fStack248);
        camera_set_aim(&gGlobals.Sub.camera,&fStack184);
      }
      else {
        fStack120.x = (player->collision).pos.x;
        fStack120.z = (player->collision).pos.z;
        fStack120.y = (player->collision).pos.y + gGlobals.Sub.camera.camHeight;
        camera_set_aim(&gGlobals.Sub.camera,&fStack120);
        gGlobals.Sub.camera.rotationXZ.x = (player->facing).x;
        gGlobals.Sub.camera.rotationXZ.y = (player->facing).y;
        multiVec2(&gGlobals.Sub.camera.rotationXZ,-1.0);
        FUN_800b050c(&gGlobals.Sub.camera,&fStack120);
        camera_set_position(&gGlobals.Sub.camera,&fStack120);
      }
    }
  }
  else camera_set_position(&gGlobals.Sub.camera,&prStack_38->header.pos);
  gGlobals.Sub.camera.unk80 = 5;
  if ((param_3 == NULL) || (pfVar8 != NULL)) {
    iVar7 = 0;
    iVar8 = 0x10000;
    do {
      iVar3 = iVar7 / 3;
      iVar6 = iVar7 % 3;
      iVar7 = iVar8 >> 0x10;
      (&gGlobals.Sub.ZoneDatMtx[iVar3 * 0x10000 >> 0x10][0].alpha)[iVar6 * 0x10000 >> 0xb] = 0xff;
      iVar8 = iVar8 + 0x10000;
    } while (iVar7 < 9);
  }
  if (iVar4 != gGlobals.sky.Type) {
    if (gGlobals.sky.Type == 4) {
      Sundial::ToggleMoon(0);
      Sundial::ToggleSun(0);
    }
    else {
      Sundial::ToggleMoon(1);
      Sundial::ToggleSun(1);
    }
  }
  if (gGlobals.minimap.active != 0) {
    gGlobals.minimap.savedPlayerPos.x = ((gGlobals.playerCharStruct.playerDat)->collision).pos.x;
    gGlobals.minimap.savedPlayerPos.y = ((gGlobals.playerCharStruct.playerDat)->collision).pos.y;
    gGlobals.minimap.savedPlayerPos.z = ((gGlobals.playerCharStruct.playerDat)->collision).pos.z;
    MiniMap::UpdateSection(&gGlobals.minimap,gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
  }
}


void ConfirmPlayerWithinZone(playerData *param_1,Borg9data *param_2){

  s16 iVar3;
  ushort uVar4;
  s16 iVar5;
  ushort uVar6;
  vec3f fStack80;
  
  if (param_1->alaron_flag == false) {
    if (((param_1->collision).pos.y < -50.0f) || ((param_1->collision).vel.y < -0.3)) {
      (param_1->collision).pos.y = 50.0f;
      setVec3(&(param_1->collision).vel,0.0,0.0,0.0);
      if (!PlayerData::CheckCollision(param_1,0.0,0,0)) (param_1->collision).vel.y = -0.054f;
      N64Print::Print("Where's the player??\n");
      return;
    }
  }
  if (((((param_1->collision).pos.x < 0.0) || ((param_1->collision).pos.z < 0.0)) ||
      (gGlobals.Sub.mapCellSize.x < (param_1->collision).pos.x)) || (gGlobals.Sub.mapCellSize.y < (param_1->collision).pos.z)) {
    iVar3 = (int)(short)gGlobals.Sub.mapShort1;
    iVar5 = (int)(short)gGlobals.Sub.mapShort2;
    fStack80.z = 0.0;
    fStack80.y = 0.0;
    fStack80.x = 0.0;
    if ((param_1->collision).pos.x < 0.0) {
      iVar3 = gGlobals.Sub.mapShort1-1;
      fStack80.x = gGlobals.Sub.mapCellSize.x;
    }
    uVar4 = (ushort)iVar3;
    if (gGlobals.Sub.mapCellSize.x < (param_1->collision).pos.x) {
      uVar4 = iVar3 + 1;
      fStack80.x = -gGlobals.Sub.mapCellSize.x;
    }
    if ((param_1->collision).pos.z < 0.0) {
      iVar5 = gGlobals.Sub.mapShort2-1;
      fStack80.z = gGlobals.Sub.mapCellSize.y;
    }
    uVar6 = (ushort)iVar5;
    if (gGlobals.Sub.mapCellSize.y < (param_1->collision).pos.z) {
      uVar6 = iVar5 + 1;
      fStack80.z = -gGlobals.Sub.mapCellSize.y;
    }
    set_teleport_obj_A(gGlobals.Sub.mapDatA,uVar4,uVar6,&fStack80);
  }
}

AnimationData * load_borg_5_func(u32 param_1){
  AnimationData *pAVar1= BorgAnimLoadScene(param_1);
  Animation::SetFlag4(pAVar1);
  Animation::SetFlag40(pAVar1);
  Animation::SetFogFlag(pAVar1);
  return pAVar1;
}

void set_anidat_colors(AnimationData *param_1,u8 alpha,char param_3,Color32 col){
  float fVar1;
  Color32 bStack216;
  Color32 auStack88;
  
  Animation::SetFlag40(param_1);
  fVar1 = gGlobals.Sub.weather.fogTime;
  if (DAT_800ee974) fVar1 = 0.0;
  FUN_800a81cc(param_1,996 - (short)(int)(fVar1 * 40.0f),1000);
  Animation::SetFogColor
            (param_1,gGlobals.sky.colors[2].R,gGlobals.sky.colors[2].G,gGlobals.sky.colors[2].B,
             (uint)gGlobals.sky.colors[2].A);
  if (param_3) {
    if (col.W) {
      bStack216.R = (byte)((int)((uint)gGlobals.sky.colors[0].R + (col.W >> 0x18)) >> 1);
      bStack216.G = (byte)((int)((uint)gGlobals.sky.colors[0].G + (col.W >> 0x10 & 0xff)) >> 1);
      bStack216.B = (byte)((int)((uint)gGlobals.sky.colors[0].B + (col.W >> 8 & 0xff)) >> 1);
      tint_color_with_screenfade(&bStack216,gGlobals.brightness);
      Animation::SetModelTint(param_1,bStack216.R,bStack216.G,bStack216.B,alpha);
      return;
    }
    Animation::SetModelTint(param_1,gGlobals.sky.colors[0].R,gGlobals.sky.colors[0].G,gGlobals.sky.colors[0].B,
               alpha);
  }
  if (col.W) {
    auStack88 = col;
    tint_color_with_screenfade(&auStack88,gGlobals.brightness);
    Animation::SetModelTint(param_1,auStack88.R,auStack88.G,auStack88.B,alpha);
  }
  return;
}

u8 get_scene_obj_proximity(vec2f *obj,vec2f *cam,vec2f *aim,float *outx,float *outy){
  float normA;
  float normB;
  vec2f distB;
  vec2f distA;
  
  *outy = 0.0;
  *outx = 0.0;
  Vec2_Sub(&distA,aim,cam);
  Vec2_Sub(&distB,obj,cam);
  normA = vec2_normalize(&distB);
  normB = vec2_normalize(&distA);
  if (normA <= normB) {
    multiVec2(&distA,normA);
    vec2_sum(&distB,cam,&distA);
    *outx = vec2_proximity(&distB,obj);
    *outy = vec2_proximity(&distB,aim);
  }
  return normA <= normB;
}

void debug::SceneBoulders(Borg9data *param_1){
  if (param_1->voxelObjCount) {
    for(u16 uVar5=0;uVar5 < param_1->voxelObjCount;uVar5++) {
      if (param_1->voxelObjs[uVar5].header.type == 0) {
        u32 uVar6 = param_1->voxelObjs[uVar5].scene.BorgCount;
        param_1->voxelObjs[uVar5].scene.sceneflags &= ~2;
        if (uVar6) {
          for(u16 uVar4=0;uVar4 < uVar6;uVar4++) {               //borg index of boulder
            param_1->voxelObjs[uVar5].scene.borgArray[uVar4].borgIndex = 0x80e;
          }
        }
      }
    }
  }
}

void NoExpPak_ClearSceneVoxelIndex(Scene_obj_dat *param_1,u16 param_2){
  if (!gExpPakFlag) {
    if (param_1->borgArray[param_2].borgheader) {
      if (!(param_1->sceneflags & 2)) AllocFreeQueueItem(&gGlobals.QueueA,&param_1->borgArray[param_2].borgheader,1,0);
      else AllocFreeQueueItem(&gGlobals.QueueA,&param_1->borgArray[param_2].borgheader,0,0);
    }
  }
}


void NoExpPak_ClearSceneVoxel(Scene_obj_dat *param_1){
  int iVar1;
  uint uVar2;
  
  if ((!gExpPakFlag) && (uVar2 = 0, param_1->BorgCount != 0)) {
    iVar1 = 0;
    do {
      iVar1 += uVar2;
      if ((&param_1->borgArray[0].borgheader)[iVar1] != NULL) {
        if ((param_1->sceneflags & 2) == 0) AllocFreeQueueItem(&gGlobals.QueueA,&param_1->borgArray[0].borgheader + iVar1,1,0);
        else AllocFreeQueueItem(&gGlobals.QueueA,&param_1->borgArray[0].borgheader + iVar1,0,0);
      }
      uVar2 = uVar2 + 1 & 0xffff;
      iVar1 = uVar2 << 1;
    } while (uVar2 < param_1->BorgCount);
  }
}



Gfx * RenderVoxelScenes(Gfx *gfx,Borg9data *borg9,vec3f *v3,short param_4,short param_5,float posx,
                       float posz)

{
  EventFlag EVar1;
  void *pvVar2;
  bool bVar6;
  Borg7header *pBVar3;
  AnimationData *pAVar4;
  ushort uVar5;
  uint uVar7;
  short sVar8;
  int iVar9;
  Scene_obj_dat *pSVar10;
  Borg7header **ppBVar11;
  Color32 col;
  voxelObject *SObj;
  uint uVar12;
  int iVar13;
  struct_A *psVar14;
  uint uVar15;
  float fVar17;
  float fVar18;
  float prox;
  double dVar16;
  float fVar19;
  float fVar20;
  Gfx *local_res0;
  vec3f param3;
  vec2f camCoord;
  vec2f CamAim;
  vec2f local_f8;
  vec2f local_b8 [8];
  float local_78;
  float local_74;
  borg_9_struct *local_70;
  uint local_6c;
  vec2f *Sobj_pos;
  uint local_64;
  int local_60;
  int local_5c;
  int local_58;
  
  fVar17 = __cosf(0.6544875f);
  fVar18 = __cosf(0.7417525f);
  param3.x = v3->x + posx;
  camCoord.x = gGlobals.Sub.camera.pos.x;
  camCoord.y = gGlobals.Sub.camera.pos.z;
  CamAim.x = gGlobals.Sub.camera.aim.x;
  CamAim.y = gGlobals.Sub.camera.aim.z;
  param3.y = v3->y;
  param3.z = v3->z + posz;
  local_70 = borg9_get_unkStruct(borg9,param_4,param_5);
  iVar13 = 0;
  local_res0 = gfx;
  if (local_70->voxelSceneCount != 0) {
    Sobj_pos = local_b8;
    iVar9 = 0;
    do {
      uVar5 = *(ushort *)(iVar9 + (int)local_70->unk8);
      SObj = (Scene_obj *)((int)borg9->voxelObjs + ((uint)uVar5 * 0x1c - (uint)uVar5) * 4);
      local_5c = iVar13 + 1;
      Gsprintf("RenderVoxelScenes\nIndex: %d\ntype: %d\nScenes: (%d, %d, %d)\nAddress: %08x",
                  uVar5,(SObj->header).type,(SObj->scene).borgArray[0].borgIndex,
                  (SObj->scene).borgArray[1].borgIndex,(SObj->scene).borgArray[2].borgIndex,
                  (long)SObj);
      local_58 = iVar9;
      if ((((SObj->header).type == VOXEL_Scene) && (((SObj->header).Bitfeild & VOXEL_Active) != 0))
         && (pSVar10 = &SObj->scene, (SObj->header).timestamp < gGlobals.ticker)) {
        (SObj->header).timestamp = gGlobals.ticker;
        prox = vec3_proximity(&param3,(vec3f *)SObj);
        fVar19 = (SObj->header).size;
        if (fVar19 <= prox) {
          NoExpPak_ClearSceneVoxel(pSVar10);
          goto LAB_800102d8;
        }
        local_6c = 0xff;
        if ((((SObj->scene).sceneflags & 4) == 0) ||
           ((double)fVar19 * 0.5d < (double)prox)) {
          setVec2(Sobj_pos,(SObj->header).pos.x,(SObj->header).pos.z);
          local_b8[0].x = local_b8[0].x - posx;
          local_b8[0].y = local_b8[0].y - posz;
          fVar19 = three_vec2_proximities(&camCoord,&CamAim,Sobj_pos);
          if (fVar19 <= fVar17) {
            if (fVar19 <= fVar18) local_6c = 0;
            else {
              dVar16 = (double)((fVar19 - fVar18) / (fVar17 - fVar18)) * 255.0;
              if (INT_MAX_d <= dVar16) {
                dVar16 = dVar16 - INT_MAX_d;
              }
              local_6c = (int)dVar16 & 0xff;
            }
          }
        }
        if (local_6c == 0) {
          NoExpPak_ClearSceneVoxel(pSVar10);
          local_5c = iVar13 + 1;
          goto LAB_800102d8;
        }
        if ((((SObj->scene).sceneflags ^ 1) & 1) != 0) {
          local_f8.x = (SObj->header).pos.x;
          local_f8.y = (SObj->header).pos.z;
          bVar6 = get_scene_obj_proximity(&local_f8,&camCoord,&CamAim,&local_78,&local_74);
          if ((bVar6) && (local_78 < (float)((double)local_74 * 0.35))) {
            fVar19 = (local_78 / (float)((double)local_74 * 0.35)) *
                     159.0f;
            if (INT_MAX_f <= fVar19) {
              fVar19 = fVar19 - INT_MAX_f;
            }
            local_6c = (int)fVar19 + 0x60U & 0xff;
          }
        }
        local_64 = 0;
        local_5c = iVar13 + 1;
        uVar12 = (int)(((SObj->scene).BorgCount - 1) * 0x10000) >> 0x10;
        sVar8 = (short)local_5c;
        if (-1 < (int)uVar12) {
          do {
            fVar20 = 0.0;
            local_60 = uVar12 - 1;
            fVar19 = pSVar10->borgArray[uVar12].renderProx;
            if (uVar12 != 0) fVar20 = pSVar10->borgArray[uVar12 - 1].renderProx;
            if ((prox < fVar20 - 2.0f) || (fVar19 < prox)) {
              NoExpPak_ClearSceneVoxelIndex(pSVar10,(u16)uVar12);
LAB_800102b4:
              sVar8 = (short)local_60;
            }
            else {
              uVar15 = 0xff;
              if (fVar19 - 1.0f < prox) {
                fVar19 = (fVar19 - prox) * 255.0f;
                if (fVar19 < INT_MAX_f) {
                  uVar15 = (int)fVar19 & 0xff;
                }
                else {
                  uVar15 = (int)(fVar19 - INT_MAX_f) & 0xff;
                }
              }
              fVar19 = (fVar20 - 2.0f) + 1.0f;
              if (prox < fVar19) {
                fVar19 = (1.0f - (fVar19 - prox)) * 255.0f;
                if (fVar19 < INT_MAX_f) {
                  uVar15 = (int)fVar19 & 0xff;
                }
                else {
                  uVar15 = (int)(fVar19 - INT_MAX_f) & 0xff;
                }
              }
              uVar7 = local_6c;
              if (uVar15 < local_6c) {
                uVar7 = uVar15;
              }
              if ((uVar7 < 0xff) || (psVar14 = NULL, ((SObj->scene).sceneflags & 0x40) != 0)) {
                uVar7 = (uint)voxel_counter;
                psVar14 = struct_a_ARRAY_800f5290 + uVar7;
                voxel_counter += 1;
                psVar14->anidat = NULL;
                struct_a_ARRAY_800f5290[uVar7].flags = 0;
              }
              ppBVar11 = &(SObj->scene).borgArray[uVar12].borgheader;
              if (*ppBVar11 != NULL) {
LAB_80010068:
                if (((SObj->scene).sceneflags & 2) == 0) {
LAB_80010084:
                  pAVar4 = (AnimationData *)(SObj->scene).borgArray[uVar12].borgheader;
                }
                else pAVar4 = ((SObj->scene).borgArray[0].borgheader)->aniDat;
                col.W = 0;
                if (((SObj->scene).sceneflags & 0x10)) col = (SObj->scene).tint;
                Animation::MatrixASetPos(pAVar4,(SObj->header).pos.x - posx,(SObj->header).pos.y,(SObj->header).pos.z - posz);
                    // Oriana's Pathlights
                if ((SObj->scene).borgArray[1].borgIndex == 0x374a) {
                  if (uVar12 == 0) {
                    if (local_64 == 0) {
                      pvVar2 = local_70->unk8;
                      (SObj->header).Bitfeild = (SObj->header).Bitfeild & ~VOXEL_Active;
                      passto_WriteTo_VoxelChart(*(undefined2 *)(local_58 + (int)pvVar2),
                                 (undefined)gGlobals.Sub.mapDatA,(undefined)gGlobals.Sub.mapShort1,
                                 (undefined)gGlobals.Sub.mapShort2,0x11,0,0x10);
                      uVar5 = (SObj->scene).sceneflags;
                    }
                    else {
                      uVar5 = (SObj->scene).sceneflags;
                    }
                  }
                  else {
                    uVar5 = (SObj->scene).sceneflags;
                  }
                }
                else {
                  uVar5 = (SObj->scene).sceneflags;
                }
                local_64 = uVar12 & 0xffff;
                if ((uVar5 & 2) == 0) {
                  uVar12 = local_6c;
                  if (uVar15 < local_6c) uVar12 = uVar15;
                  set_anidat_colors(pAVar4,(char)uVar12,'\x01',col);
                  if (psVar14 == NULL) local_res0 = BorgAnimDrawScene(local_res0,pAVar4);
                  else psVar14->anidat = pAVar4;
                }
                else {
                  FUN_800a0304((SObj->scene).borgArray[0].borgheader,(int)gGlobals.delta);
                  uVar12 = local_6c;
                  if (uVar15 < local_6c) uVar12 = uVar15;
                  set_sun_light(pAVar4,(uint)(SObj->scene).sceneflags,SObj,(char)uVar12);
                  passto_InitLight_2(&gGlobals.Sub.DynamicLights,pAVar4,SObj,(short)(int)gGlobals.delta);
                  passto_initLight(pAVar4,borg9,(voxelObject *)SObj,(short)(int)gGlobals.delta);
                  if (psVar14 == NULL) {
                    local_res0 = BorgAnimDrawSceneLinked(local_res0,
                                            (AnimationData *)(SObj->scene).borgArray[0].borgheader);
                  }
                  else {
                    psVar14->anidat = (AnimationData *)(SObj->scene).borgArray[0].borgheader;
                    psVar14->flags|= 2;
                  }
                }
                goto LAB_800102b4;
              }
              if (((SObj->scene).sceneflags & 2) == 0) {
                if (NoExpPak_memCheck(1)) {
                  pAVar4 = BorgAnimLoadScene(pSVar10->borgArray[uVar12].borgIndex);
                  *ppBVar11 = (Borg7header *)pAVar4;
                  goto LAB_8000ffcc;
                }
                goto LAB_800102b4;
              }
              sVar8 = (short)local_60;
              if (NoExpPak_memCheck(0)) {
                pBVar3 = func_loading_borg7((SObj->scene).borgArray[0].borgIndex,
                                            (ParticleEmmiter *)&gGlobals.Sub.particleEmmiter);
                (SObj->scene).borgArray[0].borgheader = pBVar3;
                pAVar4 = pBVar3->aniDat;
                FUN_800a0090(pBVar3,0);
                EVar1 = (SObj->header).flagB;
                if ((SObj->header).flagB != 0) {
                  if ((getEventFlag((SObj->header).flagB)) && (((SObj->header).Bitfeild & VOXEL_Used) == 0)) {
                  }
                  else {
                    if ((getEventFlag((SObj->header).flagB)) || (((SObj->header).Bitfeild & VOXEL_Used) == 0)) goto LAB_8000ffcc;
                  }
                  FUN_800a0090((SObj->scene).borgArray[0].borgheader,1);
                  FUN_800a0304((SObj->scene).borgArray[0].borgheader,2);
                }
LAB_8000ffcc:
                guMtxIdentF(&pAVar4->matrixA);
                guMtxIdentF(&pAVar4->matrixB);
                Animation::SetFlag10(pAVar4);
                Animation::SetFlag4(pAVar4);
                Animation::SetFlag40(pAVar4);
                Animation::SetFogFlag(pAVar4);
                Animation::MatrixARotate(pAVar4,(SObj->scene).rotation.y * RadInDeg_f,
                           (SObj->scene).rotation.x * RadInDeg_f,
                           (SObj->scene).rotation.z * RadInDeg_f);
                Animation::MatrixANormalizeScale(pAVar4,(SObj->scene).scale.x,(SObj->scene).scale.y,(SObj->scene).scale.z)
                ;
                if (((SObj->scene).sceneflags & 2) != 0) {
                  Animation::SetLightData(pAVar4);
                  Animation::SceneSetMaxDynamicDirLights(pAVar4,2);
                  goto LAB_80010068;
                }
                goto LAB_80010084;
              }
            }
            uVar12 = (uint)sVar8;
          } while (-1 < (int)uVar12);
          sVar8 = (short)local_5c;
        }
      }
      else {
LAB_800102d8:
        sVar8 = (short)local_5c;
      }
      iVar13 = (int)sVar8;
      iVar9 = iVar13 << 1;
    } while (iVar13 < (int)(uint)local_70->voxelSceneCount);
  }
  Gsprintf("Finished RenderVoxelScenesInZone\n");
  return local_res0;
}



Gfx* FUN_80010354(Gfx*param_1,ZoneDat *param_2){
  if (param_2->anidat0x4) {
    set_anidat_colors(param_2->anidat0x4,param_2->unk0x1c,'\x01',(color)0x0);
    param_1 = FUN_800a0da4(param_1,param_2->anidat0x4);}
  return param_1;
}


Gfx* FUN_800103b0(Gfx*param_1,ZoneDat *param_2){
  if ((param_2->aniDat0x14) && (param_2->anidat0x4)){
    set_anidat_colors(param_2->aniDat0x14,param_2->unk0x1c,'\x01',(color)0x0);
    param_1 = FUN_800a0da4(param_1,param_2->aniDat0x14);
  }
  return param_1;
}

bool FUN_80010414(vec2f *param_1,vec2f *param_2,vec2f *param_3,vec2f *param_4,s16 param_5){
  bool uVar1;
  u32 uVar2;
  float fVar3;
  float fVar4;
  vec2f fStack280;
  vec2f fStack216;
  float afStack152 [2];
  vec2f fStack88;
  
  if (param_5 == 0) {
    copyVec2(param_1,fStack280);
    copyVec2(param_2,fStack216);
    copyVec2(param_3,afStack152);
    copyVec2(param_4,fStack88);
  }
  else {
    fStack280[0] = (*param_1)[1];
    fStack280[1] = (*param_1)[0];
    fStack216[0] = (*param_2)[1];
    fStack216[1] = (*param_2)[0];
    afStack152[0] = (*param_3)[1];
    fStack88[0] = (*param_4)[1];
    fStack88[1] = (*param_4)[0];
  }
  fVar4 = fStack280[1] - fStack88[1];
  fVar3 = fStack216[1] - fStack88[1];
  uVar2 = (u32)(fVar4 < 0.0);
  if (fVar3 < 0.0) {uVar2 = (s32)(((fVar4 < 0.0) + 1) * 0x10000) >> 0x10;}
  uVar1 = 0;
  if (uVar2 == 1) {
    if (fVar4 < 0.0) {fVar4 = -fVar4;}
    if (fVar3 < 0.0) {fVar3 = fVar4 - fVar3;}
    else {fVar3 = fVar4 + fVar3;}
    fVar3 = fStack280[0] - (fStack280[0] - fStack216[0]) * (fVar4 / fVar3);
    uVar1 = 0;
    if ((afStack152[0] <= fVar3) && (fVar3 <= fStack88[0])) {uVar1 = 1;}
  }
  return uVar1;
}


bool FUN_80010598(s16 param_1,s16 param_2)

{
  bool bVar1;
  vec2f *pafVar2;
  s32 iVar3;
  s32 iVar4;
  float fVar5;
  float fVar6;
  vec2f fStack176;
  vec2f fStack168;
  vec2f fStack160;
  vec2f fStack152;
  vec2f fStack112;
  vec2f fStack104;
  vec2f afStack96;
  vec2f afStack88;
  
  fVar6 = (float)(param_1 + -1) * gGlobals.Sub.mapCellSize[0];
  fVar5 = (float)(param_2 + -1) * gGlobals.Sub.mapCellSize[1];
  fStack104[0] = gGlobals.Sub.camera.XZ_orient[0] * 200.0f;
  fStack104[1] = gGlobals.Sub.camera.XZ_orient[1] * 200.0f;
  iVar3 = 1;
  fStack176[0] = fVar6 - 20.0f;
  fStack112[0] = gGlobals.Sub.camera.coord[0];
  fStack176[1] = fVar5 - 20.0f;
  fStack112[1] = gGlobals.Sub.camera.coord[2];
  fStack168[0] = fVar6 + gGlobals.Sub.mapCellSize[0] + 20.0f;
  fStack160[1] = fVar5 + gGlobals.Sub.mapCellSize[1] + 20.0f;
  fStack168[1] = fStack176[1];
  fStack160[0] = fStack176[0];
  fStack152[0] = fStack168[0];
  fStack152[1] = fStack160[1];
  copyVec2(fStack104,afStack96);
  RotVec2(afStack96,-42.5f);
  vec2_sum(afStack96,fStack112,afStack96);
  copyVec2(fStack104,afStack88);
  RotVec2(afStack88,42.5f);
  vec2_sum(afStack88,fStack112,afStack88);
  vec2_sum(fStack104,fStack104,fStack112);
  vec2_sum(afStack96,afStack96,fStack112);
  vec2_sum(afStack88,afStack88);
  pafVar2 = fStack104;
  iVar4 = 0x20000;
  do {
    if (FUN_80010414(fStack112,pafVar2,fStack176,fStack168,0)) return false;
    if (FUN_80010414(fStack112,pafVar2,fStack160,fStack152,0)) return false;
    if (FUN_80010414(fStack112,pafVar2,fStack176,fStack160,1)) return false;
    if (FUN_80010414(fStack112,pafVar2,fStack168,fStack152,1)) return false;
    if (1 < iVar3) {
      if (FUN_80010414(fStack104,pafVar2,fStack176,fStack168,0)) return false;
      if (FUN_80010414(fStack104,pafVar2,fStack160,fStack152,0)) return false;
      if (FUN_80010414(fStack104,pafVar2,fStack176,fStack160,1)) return false;
      if (FUN_80010414(fStack104,pafVar2,fStack168,fStack152,1)) return false;
    }
    iVar3 = iVar4 >> 0x10;
    pafVar2 = pafVar2[1];
    iVar4 = iVar4 + 0x10000;
    if (3 < iVar3) {return true;}
  } while( true );
}


void RenderZones(Gfx**param_1,vec3f *param_2,s16 param_3)

{
  s32 iVar2;
  bool bVar8;
  u32 uVar3;
  u8 bVar9;
  u16 uVar5;
  u16 uVar6;
  u16 uVar7;
  u32 uVar4;
  u16 viBuff;
  u16 uVar10;
  u16 uVar11;
  ZoneDat *pZVar12;
  ZoneDat *iVar1;
  s16 *psVar13;
  s16 *psVar14;
  s32 iVar15;
  float fVar16;
  float fVar17;
  u16 uStack144 [8] [2];
  u16 uStack80 [2];
  Gfx*pauStack76;
  u32 uStack72;
  u32 uStack68;
  u32 uStack64;
  vec3f *uStack60;
  ParticleHeadStruct *pPStack56;
  u16 (*pauStack52) [2];
  u16 *puStack48;
  Gfx*pauStack44;
  
  uStack72 = 1;
  pauStack76 = *param_1;
  uStack144[0] = DAT_800d8758;
  uStack144[1] = DAT_800d875c;
  uStack144[2] = DAT_800d8760;
  uStack144[3] = DAT_800d8764;
  uStack144[4] = DAT_800d8768;
  uStack144[5] = DAT_800d876c;
  uStack144[6] = DAT_800d8770;
  uStack144[7] = DAT_800d8774;
  FUN_800a8004(gGlobals.Sub.ZoneDatMtx[1][1].anidat0x4);
  if (gGlobals.screenFadeModeSwitch == 0xc) {
    SetNearFarPlanes(gGlobals.Sub.ZoneDatMtx[1][1].anidat0x4,0.1,125.0);
  }
  else {
    SetNearFarPlanes(gGlobals.Sub.ZoneDatMtx[1][1].anidat0x4,1.0,180.0);
  }
  FUN_800a0df4(gGlobals.Sub.ZoneDatMtx[1][1].anidat0x4);
  pauStack76 = gsAnimationDataMtx(pauStack76,gGlobals.Sub.ZoneDatMtx[1][1].anidat0x4);
  if (DAT_800e8da0 != 0) {
    pauStack76 = renderPlayers(&gGlobals.Sub.PlayerHandler,pauStack76,param_3,1,0);
  }
  if ((((gGlobals.Sub.camera.coord[0] < 0.0) || (gGlobals.Sub.camera.coord[2] < 0.0)) ||
      (gGlobals.Sub.mapCellSize[0] < gGlobals.Sub.camera.coord[0])) ||
     (gGlobals.Sub.mapCellSize[1] < gGlobals.Sub.camera.coord[2])) {
    uStack72 = 0;
  }
  if (uStack72 == 0) {
    pauStack76 = (Gfx*)func_80010354(pauStack76,gGlobals.Sub.ZoneDatMtx[1] + 1);
  }
  iVar15 = 0;
  pauStack52 = uStack144;
  puStack48 = uStack144 + 1;
  pauStack44 = (Gfx*)&pauStack76;
  uStack64 = 1;
  pPStack56 = &gGlobals.Sub.particleEmmiter;
  uStack60 = gGlobals.Sub.camera.rotation;
  uStack68 = (u32)(gGlobals.Sub.borg9DatPointer)->byte0x1b;
  iVar2 = 0;
  do {
    uVar3 = uStack64;
    psVar13 = (s16 *)((s32)*pauStack52 + iVar2);
    psVar14 = (s16 *)((s32)puStack48 + iVar2);
    uStack64 = (uStack64 & 0x7f) << 1;
    bVar8 = FUN_80010598(*psVar13,*psVar14);
    if ((bVar8 == false) || ((uStack68 & uVar3) != 0)) {
      pZVar12 = (ZoneDat *)(*psVar13 * 0x60 + -0x7ff19678 + *psVar14 * 0x20);
      if (gExpPakFlag == 0) {
        if (gGlobals.QueueB.items == 0) {
          if (oneZone_load == 0) {
            if (pZVar12->unk_0x0 == 0) {
              uVar3 = pZVar12->borg5_ID;
            }
            else {
              if (pZVar12->anidat0x4 == NULL) {
                bVar8 = NoExpPak_memCheck(3);
                if (bVar8) {
                  pZVar12->unk0x1e = pZVar12->unk0x1e | 1;
                  AllocAllocQueueItem(&gGlobals.QueueB,&pZVar12->anidat0x4,0,pZVar12->unk_0x0,1,0);
                }
                uVar3 = pZVar12->borg5_ID;
              }
              else {
                uVar3 = pZVar12->borg5_ID;
              }
            }
            if (uVar3 == 0) {
              bVar9 = pZVar12->unk0x1c;
            }
            else {
              if (pZVar12->aniDat0x14 == NULL) {
                bVar8 = NoExpPak_memCheck(4);
                if (bVar8) {
                  pZVar12->unk0x1e = pZVar12->unk0x1e | 2;
                  AllocAllocQueueItem(&gGlobals.QueueB,&pZVar12->aniDat0x14,0,pZVar12->unk_0x0,1,0);
                }
                goto LAB_80010bfc;
              }
              bVar9 = pZVar12->unk0x1c;
            }
          }
          else {
            bVar9 = pZVar12->unk0x1c;
          }
        }
        else {
          bVar9 = pZVar12->unk0x1c;
        }
      }
      else {
LAB_80010bfc:
        bVar9 = pZVar12->unk0x1c;
      }
      if (bVar9 != 0xff) {
        uVar5 = (u16)pZVar12->unk0x1c + param_3 * 2;
        if (0xff < uVar5) {
          uVar5 = 0xff;
        }
        pZVar12->unk0x1c = (u8)uVar5;
      }
      if (pZVar12->anidat0x4) {
        pauStack76 = (Gfx*)func_80010354(pauStack76,pZVar12);
      }
      if (pZVar12->mapPointer) {
        FUN_800ade28(&pZVar12->mapPointer->dat,param_2,uStack80,uStack80 + 1);
        uVar6 = (u16)(s32)(gGlobals.Sub.mapCellSize[0] / (pZVar12->mapPointer->dat).floatsB[0]);
        uVar7 = (u16)(s32)(gGlobals.Sub.mapCellSize[1] / (pZVar12->mapPointer->dat).floatsB[1]);
        fVar16 = 0.0;
        fVar17 = 0.0;
        uVar10 = 0;
        uVar11 = 0;
        switch(pZVar12->index) {
        case 0:
          fVar16 = gGlobals.Sub.mapCellSize[1];
          fVar17 = gGlobals.Sub.mapCellSize[0];
          uVar10 = uVar6;
          uVar11 = uVar7;
          break;
        case 1:
          fVar16 = 0.0;
          fVar17 = gGlobals.Sub.mapCellSize[0];
          uVar10 = uVar6;
          uVar11 = uStack80[1];
          break;
        case 2:
          fVar16 = -gGlobals.Sub.mapCellSize[1];
          fVar17 = gGlobals.Sub.mapCellSize[0];
          uVar10 = uVar6;
          uVar11 = 0;
          break;
        case 0x10:
          fVar16 = gGlobals.Sub.mapCellSize[1];
          fVar17 = 0.0;
          uVar10 = uStack80[0];
          uVar11 = uVar7;
          break;
        case 0x12:
          fVar16 = -gGlobals.Sub.mapCellSize[1];
          fVar17 = 0.0;
          uVar10 = uStack80[0];
          uVar11 = 0;
          break;
        case 0x20:
          fVar16 = gGlobals.Sub.mapCellSize[1];
          fVar17 = -gGlobals.Sub.mapCellSize[0];
          uVar10 = 0;
          uVar11 = uVar7;
          break;
        case 0x21:
          fVar16 = 0.0;
          fVar17 = -gGlobals.Sub.mapCellSize[0];
          uVar10 = 0;
          uVar11 = uStack80[1];
          break;
        case 0x22:
          fVar16 = -gGlobals.Sub.mapCellSize[1];
          fVar17 = -gGlobals.Sub.mapCellSize[0];
          uVar10 = 0;
          uVar11 = 0;
        }
        pauStack76 = RenderVoxelScenes(pauStack76,&pZVar12->mapPointer->dat,param_2,uVar10,uVar11,
                                       fVar17,fVar16);
      }
    }
    else {
      if ((gExpPakFlag == 0) && (uVar4 = get_MemFree(), uVar4 < 0x18000)) {
        iVar1 = (ZoneDat *)(*psVar13 * 0x60 + -0x7ff19678 + *psVar14 * 0x20);
        if (iVar1->anidat0x4) {
          AllocFreeQueueItem(&gGlobals.QueueA,&iVar1->anidat0x4,1,0);
        }
        if (iVar1->aniDat0x14) {
          AllocFreeQueueItem(&gGlobals.QueueA,&iVar1->aniDat0x14,1,0);
        }
      }
    }
    iVar15 = (s32)(s16)((s16)iVar15 + 1);
    iVar2 = iVar15 << 2;
    if (7 < iVar15) {
      if (uStack72 != 0) {
        pauStack76 = (Gfx*)func_80010354(pauStack76,gGlobals.Sub.ZoneDatMtx[1] + 1);
      }
      Gsprintf(s_ParticleHead_800d8778);
      viBuff = get_vi_buffer_choice();
      ProcessAndRenderParticleHead(pauStack44,pPStack56,uStack60,param_3,viBuff,0);
      Gsprintf(s_Render_Player_Shadows_800d8788);
      pauStack76 = renderPlayerShadows(&gGlobals.Sub.PlayerHandler,pauStack76);
      Gsprintf(s_Render_Players_(Water)_800d87a0);
      if (DAT_800e8da0 == 0) {
        pauStack76 = renderPlayers(&gGlobals.Sub.PlayerHandler,pauStack76,param_3,1,0);
      }
      Gsprintf(s_RenderVoxelScenesInZone[1][1]_800d87b8);
      getZonePositionShorts
                (&(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat,param_2,uStack80,uStack80 + 1);
      pauStack76 = RenderVoxelScenes(pauStack76,&(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat,
                                     param_2,uStack80[0],uStack80[1],0.0,0.0);
      Gsprintf(s_Render_Players(trans)_800d87d8);
      pauStack76 = renderPlayers(&gGlobals.Sub.PlayerHandler,pauStack76,param_3,1,1);
      Gsprintf(s_Finished_Render_Zones_800d87f0);
      *param_1 = pauStack76;
      return;
    }
  } while( true );
}

struct_A struct_a_ARRAY_800f5290[32];
void RenderTransZones__(Gfx **param_1){
  AnimationData **ppAVar2;
  
  Gfx *g = *param_1;
  if (voxel_counter) {
    for(u16 i=0; i < voxel_counter; i++) {
      ppAVar2 = &struct_a_ARRAY_800f5290[i].anidat;
      if (!(struct_a_ARRAY_800f5290[i].flags) & 2)) g = BorgAnimDrawScene(g,*ppAVar2);
      else g = BorgAnimDrawSceneLinked(g,*ppAVar2);
    }
  }
  *param_1 = g;
  voxel_counter = 0;
}

void renderTransZones_(Gfx**param_1){
  u8 bVar1;
  s32 uVar2;
  s32 uVar3;
  s32 uVar4;
  bool bVar6;
  Gfx*pauVar5;
  s32 iVar7;
  s32 *puVar8;
  ZoneDat *pZVar9;
  u16 *puVar10;
  s16 *puVar9;
  s16 *psVar11;
  s32 iVar12;
  u32 uVar13;
  s32 uStack104;
  s32 auStack100 [25];
  
  puVar9 = (s16 *)&uStack104;
  puVar10 = u16_ARRAY_800d8894;
  puVar8 = (s32 *)puVar9;
  do {
    uVar2 = *(s32 *)((s32)puVar10 + 4);
    uVar3 = *(s32 *)((s32)puVar10 + 8);
    uVar4 = *(s32 *)((s32)puVar10 + 0xc);
    *puVar8 = *(s32 *)puVar10;
    puVar8[1] = uVar2;
    puVar8[2] = uVar3;
    puVar8[3] = uVar4;
    puVar10 = (u16 *)((s32)puVar10 + 0x10);
    puVar8 = puVar8 + 4;
  } while (puVar10 != u16_ARRAY_800d8894 + 0x10);
  psVar11 = (s16 *)((s32)&uStack104 + 2);
  uVar13 = 1;
  pauVar5 = *param_1;
  *puVar8 = u16_ARRAY_800d8894._32_4_;
  bVar1 = (gGlobals.Sub.borg9DatPointer)->byte0x1b;
  iVar12 = 0x10000;
  do {
    bVar6 = FUN_80010598(*puVar9,*psVar11);
    if (((bVar6 == false) || ((bVar1 & uVar13) != 0)) &&
       (pZVar9 = (ZoneDat *)(*puVar9 * 0x60 + -0x7ff19678 + *psVar11 * 0x20),
       pZVar9->aniDat0x14)) {
      pauVar5 = FUN_800103b0(pauVar5,pZVar9);
    }
    uVar13 = (uVar13 & 0x7f) << 1;
    psVar11 = psVar11 + 2;
    iVar7 = iVar12 >> 0x10;
    puVar9 = puVar9 + 2;
    iVar12 = iVar12 + 0x10000;
  } while (iVar7 < 9);
  *param_1 = pauVar5;
  return;
}

void mapFloatDat_copy(mapFloatDat *param_1){
  s32 iVar1;
  u32 uVar2;
  
  uVar2 = 0;
  gGlobals.Sub.unk0x120e = 0;
  gGlobals.Sub.unk0x120c = 0;
  gGlobals.Sub.unk0x1210 = 0;
  iVar1 = 0;
  do {
    COPY(gGlobals.Sub.MapFloatDats[uVar2][iVar1],param_1);
    uVar2++;
    iVar1 = uVar2 << 1;
  } while (uVar2 < 0xf);
}
piVar5 = {3,0,1,-1,2,-1,4,5,6,7,8,9,10,11,-1};

void ZoneEngine::InitZoneEngine(ushort param_1,short param_2){
  EnumMapDatA Map_;
  int iVar1;
  int iVar2;
  int iVar3;
  playerData *ppVar4;
  int *piVar5;
  mapFloatDat *pmVar6;
  int *piVar7;
  mapFloatDat *pmVar8;
  short sVar9;
  short partCount;
  undefined2 dat;
  int aiStack_e8 [32];
  vec3f afStack104;
  
  piVar7 = aiStack232;
  piVar5 = {3,0,1,-1,2,-1,4,5,6,7,8,9,10,11,-1};
  sVar9 = 0;
  dat = 0;
  partCount = 0x180;
  DAT_800e9c14 = 0;
  engineZone_flag = 1;
  initZoneTimestamp = gGlobals.ticker;
  if (gGlobals.Sub.zoneEngineInit) CRASH("InitZoneEngine","Zone Engine already Initialized");
  gGlobals.Sub.zoneEngineInit = 1;
  gGlobals.Sub.gamemodeType = param_1;
  InitEnvProps();
  set_checktrigger_pointer(check_trigger);
  gGlobals.Sub.refObjPointer = NULL;
  gGlobals.Sub.tpVec3 = NULL;
  Weather::Init(&gGlobals.Sub.weather);
  InitScriptCameras(&gGlobals.scriptcamera);
  if (gGlobals.Sub.gamemodeType == 1) {
    sVar9 = 0xe;
    if (gExpPakFlag == 0) partCount = 0x60;
  }
  else if (gGlobals.Sub.gamemodeType < 2) {
    if ((gGlobals.Sub.gamemodeType == 0) && (sVar9 = 0x28, gExpPakFlag == 0)) {
      partCount = 0x40;
    }
  }
  else if (gGlobals.Sub.gamemodeType == 2) {
    sVar9 = 0;
    dat = 3;
    if (gExpPakFlag == 0) partCount = 0x10;
  }
  pmVar8 = &gGlobals.Sub.MapFloatDatEntry;
  pmVar6 = &gGlobals.Sub.MapFloatDatEntry;
  if (param_2 == 0) {
    BorgMaps::LoadMap(gGlobals.Sub.mapDatA,gGlobals.Sub.mapDatB,gGlobals.Sub.mapDatC,false);
    clear_music_no_expPak();
  }
  else {
    Map_ = gGlobals.Sub.MapFloatDatEntry.mapDatA;
    pmVar8 = pmVar6;
    if ((gGlobals.Sub.unk120e != 0) &&
       (pmVar6 = FUN_8000cae8(&gGlobals.Sub.MapFloatDatEntry.playerVec3,
                              gGlobals.Sub.MapFloatDatEntry.MapShort1,
                              gGlobals.Sub.MapFloatDatEntry.MapShort2,
                              gGlobals.Sub.MapFloatDatEntry.mapDatA,0),
       Map_ = gGlobals.Sub.MapFloatDatEntry.mapDatA, pmVar6 != NULL)) {
      memcpy(&gGlobals.Sub.MapFloatDatEntry,pmVar6,0x2c);
      Map_ = pmVar6->mapDatA;
      pmVar8 = pmVar6;
    }
    gGlobals.Sub.mapDatB = pmVar8->mapDatB;
    gGlobals.Sub.mapDatC = pmVar8->mapDatC;
    gGlobals.Sub.mapShort1 = pmVar8->MapShort1;
    gGlobals.Sub.mapShort2 = pmVar8->MapShort2;
    gGlobals.Sub.mapDatA = Map_;
    BorgMaps::LoadMap(Map_,gGlobals.Sub.mapDatB,gGlobals.Sub.mapDatC,false);
    clear_music_no_expPak();
    gGlobals.Sub.playerPos2d.x = (pmVar8->playerVec3).x;
    gGlobals.Sub.playerPos2d.y = (pmVar8->playerVec3).z;
  }
  InitPlayerHandler(&gGlobals.Sub.camera,sVar9,3);
  InitParticleHead(&gGlobals.Sub.particleEmmiter,gGlobals.Sub.borg9DatPointer,partCount,0x11,
                   aiStack_e8);
  FUN_8000d744();
  no_TP_vec3 = 1;
  loadGameBorgScenes(gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
  if (param_2 == 0) {
    CLEAR(&afStack104);
    passto_camera_init(&gGlobals.Sub.camera,gGlobals.Sub.borg9DatPointer,&afStack104,dat);
    if ((gGlobals.playerCharStruct.playerDat != NULL) &&
       ((gGlobals.playerCharStruct.playerDat)->removeFlag == 0)) {
      camera_set_aim(&gGlobals.Sub.camera,&((gGlobals.playerCharStruct.playerDat)->collision).pos);
      FUN_800b050c(&gGlobals.Sub.camera,&afStack104);
      camera_set_position(&gGlobals.Sub.camera,&afStack104);
    }
  }
  else {
    passto_camera_init(&gGlobals.Sub.camera,gGlobals.Sub.borg9DatPointer,&pmVar8->cameraVec3,dat);
    ppVar4 = gGlobals.playerCharStruct.playerDat;
    if (gGlobals.playerCharStruct.playerDat != NULL) {
      ((gGlobals.playerCharStruct.playerDat)->facing).x = (pmVar8->playerVec2).x;
      (ppVar4->facing).y = (pmVar8->playerVec2).y;
      camera_set_aim(&gGlobals.Sub.camera,&((gGlobals.playerCharStruct.playerDat)->collision).pos);
    }
  }
  init_dynamic_light(&gGlobals.Sub.DynamicLights);
  if (param_1 == 1) {
    gGlobals.Sub.PlayerHandler.float_0x68 = 128.0f;
    gGlobals.Sub.PlayerHandler.float_0x64 = 128.0f;
  }
  else if ((short)param_1 < 2) {
    if (param_1 != 0) {
LAB_800116a4:
      Crash::ManualCrash(s_ZoneEngineInit_800d892c,s_Unknown_Engine_Mode_800d893c);
    }
    gGlobals.Sub.PlayerHandler.float_0x68 = 30.0f;
    gGlobals.Sub.PlayerHandler.float_0x64 = 20.0f;
  }
  else {
    if (param_1 != 2) goto LAB_800116a4;
    gGlobals.Sub.PlayerHandler.float_0x68 = 0.0;
    gGlobals.Sub.PlayerHandler.float_0x64 = 0.0;
  }
  if (gGlobals.minimap.active != 0) {
    if (gGlobals.playerCharStruct.playerDat != NULL) {
      gGlobals.minimap.savedPlayerPos.x = ((gGlobals.playerCharStruct.playerDat)->collision).pos.x;
      gGlobals.minimap.savedPlayerPos.y = ((gGlobals.playerCharStruct.playerDat)->collision).pos.y;
      gGlobals.minimap.savedPlayerPos.z = ((gGlobals.playerCharStruct.playerDat)->collision).pos.z;
    }
    MiniMap::UpdateSection(&gGlobals.minimap,gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
  }
  return;
}

void SaveEngineZone(playerData *param_1,mapFloatDat *param_2){
  if (!engineZone_flag) N64Print::Print("SaveZoneEngine Aborted");
  else {
    param_2->mapDatA = gGlobals.Sub.mapDatA;
    param_2->mapDatB = gGlobals.Sub.mapDatB;
    param_2->mapDatC = gGlobals.Sub.mapDatC;
    param_2->MapShort1 = gGlobals.Sub.mapShort1;
    param_2->MapShort2 = gGlobals.Sub.mapShort2;
    if (!param_1) {
      setVec3(&param_2->playerVec3,0.0,0.0,0.0);
      setVec2(&param_2->playerVec2,1.0,0.0);
    }
    else {
      (param_2->playerVec3).x = (param_1->collision).pos.x;
      (param_2->playerVec3).y = (param_1->collision).pos.y;
      (param_2->playerVec3).z = (param_1->collision).pos.z;
      (param_2->playerVec2).x = (param_1->facing).x;
      (param_2->playerVec2).y = (param_1->facing).y;
    }
    (param_2->cameraVec3).x = gGlobals.Sub.camera.pos.x;
    (param_2->cameraVec3).y = gGlobals.Sub.camera.pos.y;
    (param_2->cameraVec3).z = gGlobals.Sub.camera.pos.z;
  }
}

void clear_music_values(s16 ClearAll){
  if (gGlobals.Sub.BGM) {
    DCM::Remove(gGlobals.Sub.BGMIndex,gGlobals.Sub.BGMID);
    free_borg_12(gGlobals.Sub.BGM);
    gGlobals.Sub.BGM = NULL;
  }
  if (ClearAll) {
    gGlobals.Sub.Borg12Next2 = 0;
    gGlobals.Sub.Borg12Next = 0;
    gGlobals.Sub.BGMID = 0;
    gGlobals.Sub.BGMIndex = 0;
  }
}

void clear_music_no_expPak(void){
  if (((!gExpPakFlag) && (gGlobals.Sub.Borg12Next)) &&
      (gGlobals.Sub.Borg12Next != gGlobals.Sub.Borg12Next2)) {
    clear_music_values(0);
  }
}

void update_BGM_(void){

  if (gGlobals.Sub.Borg12Next) {
    if (gGlobals.Sub.Borg12Next != gGlobals.Sub.Borg12Next2) {
      clear_music_values(0);
      if (0 < gGlobals.Sub.Borg12Next) {
        gGlobals.Sub.BGM = load_borg_12(gGlobals.Sub.Borg12Next);
        DCM::Add(&gGlobals.Sub.BGMIndex,&gGlobals.Sub.BGMID,
             &(gGlobals.Sub.BGM)->dat->sub,gGlobals.VolBGM * 255.0f,0x80,1,0xffffffff,0);
      }
    }
    gGlobals.Sub.Borg12Next2 = gGlobals.Sub.Borg12Next;
    gGlobals.Sub.Borg12Next = 0;
  }
  if (gGlobals.Sub.BGM) DCM::Start(gGlobals.Sub.BGMIndex,gGlobals.Sub.BGMID,gGlobals.VolBGM * 255.0f);
}

void FreeZoneEngine(s16 playMusic){
  Process_queue_B(&gGlobals.QueueB,1);
  if (gGlobals.Sub.zoneEngineInit == 0) {CRASH("FreeZoneEngine","Zone Engine Not Initialized");}
  gGlobals.Sub.zoneEngineInit = 0;
  if (!playMusic) clear_music_values(true);
  FreeParticleEmmiter(&gGlobals.Sub.particleEmmiter);
  Weather::Free(&gGlobals.Sub.weather);
  zonedat_clear_all();
  freeScriptCameras(&gGlobals.scriptcamera);
  clear_some_playerHandler_field();
  FreePlayerHandler();
  dynamic_lights_free_all(&gGlobals.Sub.DynamicLights);
  ZoneEngine::FreeEnvProps();
  SetBackgroundType(2,0,0.0);
}
#ifdef DEBUGVER
void ClearVoxelFlags(Borg9data *param_1){
  if (param_1->voxelObjCount) {
    for(u16 uVar2=0;uVar2 < param_1->voxelObjCount;uVar2++) {
      param_1->voxelObjs[uVar2].header.Bitfeild=0;
    }
  }
}

voxelObject* voxel_index_pointer=NULL;
void debug::VoxelIndexPosition(short delta,playerData *param_2){
  Borg9data *pBVar6;
  uint uVar7;
  voxelObject *pvVar10;
  pvVar10 = voxel_index_pointer;
  if (voxel_index != 0) {
    pBVar6 = GetCollisionZone(param_2->zoneDatByte);
    char labels[13][24] ={"VOBJECT_CONTAINER","VOBJECT_LIGHT","VOBJECT_AUDIO","VOBJECT_WANDERNODE",
   "VOBJECT_MONSTERPARTY","VOBJECT_REFERENCEPOINT","VOBJECT_TELEPORTER","VOBJECT_CAMERA","VOBJECT_DIALOGUE",
   "VOBJECT_TRIGGER","VOBJECT_SAVEPOINT","VOBJECT_CODE"};
    uVar7 = (uint)voxel_index_timer;
    voxel_index_timer = (ushort)(uVar7 - (int)delta);
    pvVar10 = voxel_index_pointer;
    if ((int)((uVar7 - (int)delta) * 0x10000) < 1) {
      ClearVoxelFlags(pBVar6);
      uVar7 = (voxel_index_number + 1) % (uint)pBVar6->voxelObjCount;
      enemyHostileFlag = 0;
      voxel_index_timer = 0xb4;
      voxel_index_number = (ushort)uVar7;
      pvVar10 = pBVar6->voxelObjs + uVar7;
      Gsprintf("\n\n\nGOING to Voxel Index: %d\nType: %s\nPosition: (%3.2f, %3.2f, %3.2f)\n"
         ,uVar7,labels[(pvVar10->header).type],
         (pvVar10->header).pos.x,(pvVar10->header).pos.y,(pvVar10->header).pos.z);
      N64Print::Print(gGlobals.text);
      if (voxel_index_pointer) {
        Gsprintf("\n\nAT V-Type: %s\nPosition: (%3.2f, %3.2f, %3.2f)\n",labels[voxel_index_pointer->header.type],
                 voxel_index_pointer->header.pos.x,voxel_index_pointer->header.pos.y,voxel_index_pointer->header.pos.z);
        N64Print::Print(gGlobals.text);
        if ((voxel_index_pointer->header).type == VOXEL_Scene) (voxel_index_pointer->header).Bitfeild = VOXEL_Active;
        (param_2->collision).pos.x = (voxel_index_pointer->header).pos.x;
        (param_2->collision).pos.y = (voxel_index_pointer->header).pos.y;
        (param_2->collision).pos.z = (voxel_index_pointer->header).pos.z;
        gGlobals.Sub.camera.aim.x = (voxel_index_pointer->header).pos.x;
        gGlobals.Sub.camera.aim.y = (voxel_index_pointer->header).pos.y;
        gGlobals.Sub.camera.aim.z = (voxel_index_pointer->header).pos.z;
        gGlobals.Sub.camera.pos.x = (voxel_index_pointer->header).pos.x + 2.0;
        gGlobals.Sub.camera.pos.y = (voxel_index_pointer->header).pos.y + 7.0;
        gGlobals.Sub.camera.pos.z = (voxel_index_pointer->header).pos.z + 2.0;
        gGlobals.Sub.camera.posTarget.x = gGlobals.Sub.camera.pos.x;
        gGlobals.Sub.camera.posTarget.y = gGlobals.Sub.camera.pos.y;
        gGlobals.Sub.camera.posTarget.z = gGlobals.Sub.camera.pos.z;
        gGlobals.Sub.camera.aimTarget.x = gGlobals.Sub.camera.aim.x;
        gGlobals.Sub.camera.aimTarget.y = gGlobals.Sub.camera.aim.y;
        gGlobals.Sub.camera.aimTarget.z = gGlobals.Sub.camera.aim.z;
      }
    }
  }
  voxel_index_pointer = pvVar10;
}
#endif



void handleZoneEngineFrame(Gfx **GG,short delta,playerData *player){
  bool bVar1;
  mapFloatDat *A;
  byte bVar2;
  uint uVar3;
  vec3f *position;
  int iVar4;
  float fVar5;
  Gfx *G;
  
  G = *GG;
  iVar4 = (int)delta;
  Gsprintf("Handle Zone Engine Frame");
  #ifdef DEBUGVER
  debug::VoxelIndexPosition(delta,player);
  #endif
  if (player) {
    DEBUGSprintf("ProcessVoxelObjects");
    ProcessVoxelObjects(player);
  }
  if (FreeZoneEngineTimestamp == handeZoneEngineTimestamp) 
    CRASH("HandleZoneEngineFrame","HandleZoneEngineFrame AND\nFreeZoneEngineMemory called on\nthe same frame!");
  handeZoneEngineTimestamp = gGlobals.ticker;
  DEBUGSprintf("ConfirmPlayerWithinZone");
  if (player) ConfirmPlayerWithinZone(player,gGlobals.Sub.borg9DatPointer);
  if (gGlobals.screenFadeMode == 0) update_BGM_();
  if ((gGlobals.Sub.refObjPointer != NULL) && (gGlobals.screenFadeMode == 0)) {
    #ifndef DEBUGVER
    bVar1=false;
    #endif
    if (gGlobals.Sub.tpVec3 == NULL) {
      gGlobals.screenFadeMode = 2;
      gGlobals.screenFadeSpeed = 0.06666667f;
    }
    #ifndef DEBUGVER
    if (gGlobals.Sub.mapDatA == 0) bVar1 = (gGlobals.Sub.refObjPointer->teleport.MapDatA == 0);
    Gsprintf("pZ->map: %d\npT->map: %d\ndoReset: %d - %d\n"(int)gGlobals.Sub.mapDatA                                                                     (int)gGlobals.Sub.mapDatA,
                (uint)((gGlobals.Sub.refObjPointer)->teleport).MapDatA,uVar3,0);
    N64Print::Print();
    #endif
    TeleportPlayer(player,gGlobals.Sub.refObjPointer,gGlobals.Sub.tpVec3);
    gGlobals.Sub.refObjPointer = NULL;
    gGlobals.Sub.tpVec3 = NULL;
    #ifndef DEBUGVER
        if (((!gExpPakFlag) && (bVar1)) && (retailTpFlag)) {
      DAT_800da398 = 1;
      DAT_800da39c = 3;
      DAT_800da39e = 0;
    }
    retailTpFlag = 0;
    #endif
  }
  some_zoneDat_func();
  if ((gPlayerRenderTimer != 0) &&
     (uVar3 = (uint)gPlayerRenderTimer, gPlayerRenderTimer = (ushort)(uVar3 - iVar4),
     (int)((uVar3 - iVar4) * 0x10000) < 0)) gPlayerRenderTimer = 0;
  if (gGlobals.Sub.gamemodeType != 2) {
    Gsprintf("ProcessPlayers");
    ProcessPlayers(&gGlobals.Sub.PlayerHandler,delta);
    Gsprintf("The crash was not in ProcessPlayers");
  }
  if ((player) && (gGlobals.Sub.gamemodeType == 0)) {
    Gsprintf("SaveZoneEngine");
    uVar3 = (uint)gGlobals.Sub.unkTimer;
    gGlobals.Sub.unkTimer = (ushort)(uVar3 - iVar4);
    if ((int)((uVar3 - iVar4) * 0x10000) < 1) {
      bVar1 = true;
      position = &(player->collision).pos;
      gGlobals.Sub.unkTimer = 0x78;
      A = FUN_8000cae8(position,gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2,gGlobals.Sub.mapDatA,1);
      if ((A != NULL) &&(vec3_proximity(&A->playerVec3,position) < 10.0f)) {
        bVar1 = false;
      }
      if (bVar1) {SaveEngineZone(player,(mapFloatDat *)
                              ((int)&gGlobals +
                              ((uint)gGlobals.Sub.unkCounter * 0xc - (uint)gGlobals.Sub.unkCounter)
                              * 4 + 0x1058));
        gGlobals.Sub.unkCounter =(gGlobals.Sub.unkCounter + 1) +((gGlobals.Sub.unkCounter + 1) / 0xf) * -0xf;
      }
    }
  }
  if (gGlobals.Sub.gamemodeType != 2) ProcessScriptCamera(&gGlobals.scriptcamera,(float)delta);
  if (vec3_proximity(&gGlobals.Sub.camera.pos,&gGlobals.Sub.camera.aim)< 0.05)
    CRASH("SceneSetCameraLookAt","Focus, and Camera at same Spot!");
  DEBUGSprintf("SceneSetCameraLookAt\n");
  SceneSetCameraLookAt(gGlobals.Sub.ZoneDatMtx[1][1].anidat0x4,gGlobals.Sub.camera.pos.x,
             gGlobals.Sub.camera.pos.y,gGlobals.Sub.camera.pos.z,gGlobals.Sub.camera.aim.x,
             gGlobals.Sub.camera.aim.y,gGlobals.Sub.camera.aim.z);
  if (gGlobals.Sub.gamemodeType != 2) G = Sky::RenderSky(G,delta);
  if (gGlobals.sky.Type == 3) {
    DEBUGSprintf("RenderSkyObjects/RenderClouds");
    G = Skyobjects::RenderClouds(G);
    G = Clouds::Draw(G);
  }
  Gsprintf("RenderZones");
  if (!player) RenderZones(&G,&gGlobals.Sub.camera.aim,delta);
  else RenderZones(&G,&(player->collision).pos,delta);
  if (gGlobals.Sub.gamemodeType != 2) {
    DEBUGSprintf("RenderPlayers");
    G = renderPlayers(&gGlobals.Sub.PlayerHandler,G,delta,0,0);
  }
  Gsprintf("RenderTransZones");
  renderTransZones_(&G);
  RenderTransZones__(&G);
  DEBUGSprintf("ProcessAndRenderParticleHead");
  gGlobals.text[0] = '\0';
  if (gGlobals.Sub.gamemodeType != 2) {
    ProcessAndRenderParticleHead(&G,&gGlobals.Sub.particleEmmiter,&gGlobals.Sub.camera.rotation,delta,
                                 Graphics::GetBufferChoice(),1);
  }
  DEBUGSprintf("ProcessAudioBubbles");
  if (player) ProcessAudioBubbles(&gGlobals.SFXStruct,&(player->collision).pos,delta);
  DEBUGSprintf("ProcessWeather");
  Weather::ProcessWeather(&gGlobals.Sub.weather,delta);
  FUN_800556f4(&gGlobals.Sub.DynamicLights,delta);
  Gsprintf("End Zone Engine Frame");
  *GG = G;
}