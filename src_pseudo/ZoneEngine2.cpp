#include "globals.h"
#include "skyObjects.h"
#define FILENAME "./src/zoneengine.cpp"

#ifdef DEBUGVER
#define DEBUGSprintf(fmt,...) Gsprintf(fmt,__VA_ARGS__)
#else
#define DEBUGSprintf(fmt,...) ;
#endif

u8 FUN_8000c9e0(){
  u16 uVar3;
  u8 ret;
  double dVar4;
  double dVar5;
  
  uVar3 = get_obj_free();
  dVar4 = get_MemFree();
  dVar5 = get_memFree_2();
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
  u8 bVar2;
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

u8 FUN_8000ccc0(){
  u16 uVar3;
  u32 uVar1;
  u32 uVar2;
  float fVar4;
  double dVar5;
  float fVar6;
  
  uVar3 = get_obj_free();
  fVar6 = (float)get_MemFree();
  fVar4 = (float)get_memFree_2();
  if (gFreeZoneEngineTimer == 0) {
    if (DAT_800e8dc6) DAT_800e8dc6--;
    if (gExpPakFlag) return false;
    if (DAT_800e8dc6) return false;
    if ((((gGlobals.Sub.mapDatA == 0) && (40 < uVar3)) &&
        ((double)(fVar4 / fVar6) < 0.5)) || (no_ExpPak_memcheck_flag)) {
      no_ExpPak_memcheck_flag = 0;
      no_TP_vec3 = 1;
      DAT_800e8dc6 = 0xb4;
      doubleGlobalTickerFlag = 2;
      return true;
    }
  }
  else gFreeZoneEngineTimer--;
  return false;
}

//if No expeansion pak, check if memory free is within certain thresholds.
u8 NoExpPak_memCheck(u16 x){
  u8 bVar3;
  u32 threshA[5] = {0x18000,0x10000,0xc000,0x28000,0x18000};
  u32 threshB[5]= {0x10000,0xC000,0x6000,0x18000,0x10000};
  if (!gExpPakFlag) {
    bVar3 = true;
    if (get_MemFree() <= threshA[x]) {
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
//set Enviromental Properties to associate with Borg9Phys objects.
void InitEnvProps(){
  u8 (*pabVar1) [2];
  float fVar3;
  float fVar4;
  float fVar6;
  collisionTypeA *x;
  SpeedProperty *x_00;
  EnvProp *x_01;
  u16 i;
  
  ALLOCS(gGlobals.Sub.zoneEnginePtr1,(sizeof(collisionTypeA)*2),456);
  ALLOCS(gGlobals.Sub.zoneEnginePtr2,(sizeof(SpeedProperty)*2),457);
  ALLOCS(gGlobals.Sub.EnvProps,(sizeof(EnvProp)*26),458);
  for(i = 0;i < 2;i++) {
    x = gGlobals.Sub.zoneEnginePtr1 + i;
    CLEAR(x);
    if (i == 0) {
      x->unk0 = 0.0;
      x->unk4 = 0.0;
    }
    else if (i == 1) {
      x->unk0 = 0.0;
      x->unk4 = 1.0;
    }
  }
  for(i = 0;i < 2;i++)  {
    x_00 = gGlobals.Sub.zoneEnginePtr2 + i;
    CLEAR(x_00);
    if (i == 0) {
      x_00->velScale = 1.0;
      (x_00->gravity).y = -0.06;
    }
    else if (i == 1) {
      x_00->velScale = .5;
      (x_00->gravity).y = -0.0015;
    }
  }
  for(i = 0;i < 26;i++) {
    x_01 = gGlobals.Sub.EnvProps + i;
    CLEAR(x_01);
    x_01->colA = gGlobals.Sub.zoneEnginePtr1 + EnvPropBools[i][0];
    x_01->Speed = gGlobals.Sub.zoneEnginePtr2 + EnvPropBools[i][1];
  }
}
//clar Enviromental Properties associated with Borg9Phys objects.
void FreeEnvProps(){
  HFREE(gGlobals.Sub.zoneEnginePtr1,558);
  HFREE(gGlobals.Sub.zoneEnginePtr2,559);
  HFREE(gGlobals.Sub.EnvProps,560);
  gGlobals.Sub.EnvProps = NULL;
  gGlobals.Sub.zoneEnginePtr1 = NULL;
  gGlobals.Sub.zoneEnginePtr2 = NULL;
}
//associate Enviromental Properties with Borg9Phys objects.
void attachPhysicsProperties(Borg9Data *param_1){
  u16 uVar1;
  borg9_phys *pbVar2;
  u16 uVar3;
  u16 uVar4;
  borg9_phys *puVar4;
  u16 uVar5;
  uint uVar6;
  
  if (param_1->borghpys_count != 0) {
    for(uVar5=0;uVar5<param_1->borghpys_count;uVar5++) {
      pbVar2 = param_1->phys_pointer;
      //union?
      uVar1 = *(u16 *)((int)&pbVar2[uVar5].envProperty + 2);
      #ifdef DEBUGVER
      if (0x19 < uVar1) {
        Gsprintf("Invalid Physics Property: %d\n",uVar1);
        CRASH("AttachPhysicsProperties",gGlobals.text);
      }
      #endif
      uVar3 = pbVar2[uVar5].GroundType;
      uVar4 = uVar3 & 0xf000;
      if (uVar4 == 0x1000) {
        uVar3 = (u16)((uVar3 + 1 & 0x7f) << 5) | 0x1000 | uVar1 & 0x1f;
LAB_8000d2c4:
        pbVar2[uVar5].GroundType = uVar3;
        pbVar2[uVar5].flags |= B9Phys_1000;
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
        if (uVar4 == B9Phys_2000) {
          uVar4 = pbVar2[uVar5].flags;
          uVar3 = (u16)((uVar3 & 0x7f) << 5) | 0x2000 | uVar1 & 0x1f;
          goto LAB_8000d2c4;
        }
        if (uVar4 != 0x4000) {
          uVar1 = pbVar2[uVar5].GroundType;
          goto LAB_8000d25c;
        }
        if (gExpPakFlag) goto LAB_8000d2bc;
        pbVar2[uVar5].flags = B9Phys_0001;
        pbVar2[uVar5].GroundType = 0;
      }
      pbVar2[uVar5].envProperty = gGlobals.Sub.EnvProps + uVar1;
    }
  }
}
//get Borg9data loaded at BCD'd index.
Borg9Data * GetCollisionZone(u8 x){
  Borg9Header **z = &gGlobals.Sub.ZoneDatMtx[x >> 4][x & 3].mapPointer;
  if (*z) return &(*z)->dat;
  CRASH("GetCollisionZone","No Zone at Grid");
}

void set_teleport_pointer(voxelObject *param_1){
  gGlobals.Sub.refObjPointer = param_1;
  gGlobals.Sub.tpVec3 = NULL;
  if (((gGlobals.screenFadeMode == 0) && (0.0 < gGlobals.brightness)) ||
     (gGlobals.ticker - initZoneTimestamp < 3)) {
    gGlobals.screenFadeMode = 1;
    gGlobals.screenFadeSpeed = (2.0/3);
  }
}

void set_teleport_obj_A(u16 mapA,u16 Short1,u16 Short2,vec3f *pos){
  gGlobals.Sub.refObjPointer = &bss_tele_obj;
  gGlobals.Sub.tpVec3 = &vec3_800f5210;
  copyVec3(pos,&vec3_800f5210);
  CLEAR(&bss_tele_obj);
  bss_tele_obj.teleport.MapDatA = mapA;
  bss_tele_obj.teleport.MapShort1 = Short1;
  bss_tele_obj.teleport.MapShort2 = Short2;
  bss_tele_obj.header.type = VOXEL_Teleporter;
}

void set_teleport_obj_loadgame(u16 mapA,u16 Short1,u16 Short2,vec3f *pos){
  gGlobals.Sub.refObjPointer = &loadgame_tp_obj;
  gGlobals.Sub.tpVec3 = NULL;
  CLEAR(&loadgame_tp_obj);
  loadgame_tp_obj.header.type = VOXEL_Teleporter;
  loadgame_tp_obj.teleport.refPoint_Pos = 0x7ff8;
  loadgame_tp_obj.teleport.MapDatA = mapA;
  loadgame_tp_obj.teleport.MapShort1 = Short1;
  loadgame_tp_obj.teleport.MapShort2 = Short2;
  copyVec3(pos,&loadgame_tp_obj.header.pos);
}
extern s16 some_toggle;
void check_trigger(collisionSphere *param_1,borg9_phys *param_2){
  u16 VVar1;
  playerData *ppVar2;
  u16 uVar3;
  u8 bVar4;
  playerData *ppVar5;
  voxelObject *ptVar6;
  
  ppVar2 = (playerData*)param_1->link;
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
      N64PRINT(gGlobals.text);
    }
  }
  return;
}

void init_some_map_data(ZoneDat *dat,short i,char j){
  CLEAR(dat);
  dat->flag = 7;
  dat->index = (char)((int)i << 4) + j;
}

void FUN_8000d744(){
  for(s16 i = 0;i < 3;i++){
    for(s16 j = 0;j < 3;j++) {
      init_some_map_data(&gGlobals.Sub.ZoneDatMtx[i][j],(short)i,(char)j);
    }
  }
}

void Zonedat_clear(ZoneDat *param_1,short param_2,short param_3){
  Borg9Header *pBVar2 = param_1->mapPointer;
  if ((param_1->sceneDat0x4) && (param_2)) {
    FREEQSCENE(param_1->sceneDat0x4);
    param_1->flag |= 1;
  }
  if ((param_1->SceneDat0x14)&&(param_2)){
    FREEQSCENE(param_1->SceneDat0x14);
    param_1->flag |= 2;
  }
  if (param_1->mapPointer) {
    if (!param_3) {
      FreeWandererFromZone(&gGlobals.wander,param_1->MapTally);
      clear_sfx_on_map(&gGlobals.SFXStruct,param_1->MapTally);
    }
    if ((pBVar2->dat).voxelObjCount) {
      for(u16 i=0;i<(pBVar2->dat).voxelObjCount;i++){
        voxelObject* v=&(pBVar2->dat).voxelObjs[i];
        if((v->header.type==VOXEL_Scene)&&(v->scene.BorgCount)){
          for(u16 j=0;j<v->scene.BorgCount;j++){
            if(v->scene.borgArray[j].b7){
            if(!v->scene.sceneflags&SceneObj_B7) FREEQSCENE(v->scene.borgArray[j].sceneDat);
            else FREEQB7(v->scene.borgArray[j].b7);
            v->scene.borgArray[j].b7=NULL;
            }
          }
        }
      }
    }
    if (param_3) return;
    remove_borg_9(param_1->mapPointer);
    param_1->mapPointer = NULL;
  }
  if (!param_3) {
    param_1->borg5_ID = 0;
    param_1->borg9_id = 0;
    param_1->unk0x10 = 0;
  }
}

void ofunc_zoneengine_free(){
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
    HFREE(gGlobals.Sub.ZoneDatMtx + iVar4,1034);
    iVar4 = (int)(short)iVar5;
    iVar5 = iVar4 + 1;
  } while (iVar4 < 3);
  //old bug?
  HFREE(&gGlobals.Sub,1036);
}

void move_zonedat(ZoneDat **param_1,ZoneDat *param_2){
  
  if (param_2->borg5_ID) {
    for(s16 i=0;i<3;i++){
      for(s16 j=0;j<3;j++){
        ZoneDat *x=&param_1[i][j];
        if ((x->borg5_ID == param_2->borg5_ID) && (x->borg9_id == param_2->borg9_id)) {
          param_2->sceneDat0x4 = x->sceneDat0x4;
          param_2->mapPointer = x->mapPointer;
          param_2->SceneDat0x14 = x->SceneDat0x14;
          param_2->alpha = x->alpha;
          param_2->flag = 3;
          param_2->MapTally = x->MapTally;
          CLEAR(x);
          return;
        }
      }
    }
  }
}
//replace model for lighthouse Map chunks if relevant flag is set
void checkToggleZoneScene(ZoneDat *param_1){
  if(param_1->sceneDat0x4) CRASH("CheckToggleZoneScene","Scene already loaded!!\n");
  //replace model for overworld cell A15 (lighthouse exterior)
  if ((param_1->borg5_ID == 0xea9)&&(getEventFlag(FLAG_LighthouseLit))) param_1->borg5_ID = 0x35ba;
  //replace model for Map 3 cell A5 (lighthouse Beacon?)
  else if ((param_1->borg5_ID == 0x11f9) && (getEventFlag(FLAG_LighthouseLit))) param_1->borg5_ID = 0x35af;
}
extern u16 gLoadedMapIndecies[22][30][3];

void MakeGameZoneNames(u16 param_1,u16 param_2){
  u16 uVar1;
  u16 uVar2;
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
//Move mad model relative to BCD'd index
void ZoneMoveSceneDat(SceneData *param_1,u8 index){
  float x;
  float y;
  
  if (!param_1) return;
  param_1->flags = 0;
  guMtxIdentF(&param_1->matrixA);
  guMtxIdentF(&param_1->matrixB);
  Scene::SetFlag10(param_1);
  Scene::SetFogFlag(param_1);
  Scene::SetFlag8(param_1);
  if (index == 0x11) Scene::UnsetFlag4(param_1);
  else Scene::SetFlag4(param_1);
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
    Scene::MatrixASetPos(param_1,y,0.0,0.0);
    return;
  case 0x22:
    Scene::MatrixASetPos(param_1,gGlobals.Sub.mapCellSize.x,0.0,gGlobals.Sub.mapCellSize.y);
    return;
  }
  Scene::MatrixASetPos(param_1,x,0.0,y);
}
//clear all loaded map chunks.
void zonedat_clear_all(){
  for(s16 i=0;i<3;i++){
    for(s16 j=0;j<3;j++) {
      Zonedat_clear(&gGlobals.Sub.ZoneDatMtx[i][j],1,0);
    }
  }
}

extern void noop_800969a4();
//clear all loaded map chunks.
void FreeZoneEngineMemory(){
  N64PRINT("FreeZoneEngineMemory\n");
  gFreeZoneEngineTimer = 120;
  no_TP_vec3 = 1;
  if (FreeZoneEngineTimestamp == handeZoneEngineTimestamp)
   {CRASH("FreeZoneEngineMemory","HandleZoneEngineFrame AND\nFreeZoneEngineMemory called on\nthe same frame!");}
  FreeZoneEngineTimestamp = gGlobals.ticker;
  for(s16 i=0;i<3;i++){
    for(s16 j=0;j<3;j++) {
      if(i==j)Zonedat_clear(&gGlobals.Sub.ZoneDatMtx[i][i],0,1);//?
      else Zonedat_clear(&gGlobals.Sub.ZoneDatMtx[i][j],1,1);
    }
  }
  noop_800969a4();
  FUN_80018c38();
}

void loading_map_data(ZoneDat *param_1){
    if ((param_1->mapPointer == NULL) && (param_1->borg9_id)) {
    param_1->MapTally = gGlobals.maptally++;
    param_1->mapPointer = loadBorg9(param_1->borg9_id);
    attachPhysicsProperties(&param_1->mapPointer->dat);
    VoxelObjects_Activate(&param_1->mapPointer->dat,param_1->index);
    look_for_monsterparties(&gGlobals.wander,&param_1->mapPointer->dat,param_1->MapTally,param_1->index);
    audio_ref_objs(&gGlobals.SFXStruct,&param_1->mapPointer->dat,param_1->MapTally,param_1->index);
    #ifdef DEBUGVER
    if (gSceneBoulder) SceneBoulders(&param_1->mapPointer->dat);
    #endif
  }
}

void loadGameBorgScenes(u16 ShortA,u16 ShortB){

  u32 uVar21,uVar22,uVar11;
  ZoneDat aZStack432 [3] [3];
  uint uStack_30;
  
  s16 sVar15 = no_TP_vec3;
  u16 uStack112[2][8]={{0,0,1,0,2,0,0,1},{2,1,0,2,1,2,2,2}};
  no_TP_vec3 = 0;
  uStack_30 = (uint)(no_TP_vec3 == 0);
  Process_queue_B(&gGlobals.QueueB,1);
  for(s16 i=0;i<3;i++){
    for(s16 j=0;j<3;j++) {
      aZStack432[i][j]=gGlobals.Sub.ZoneDatMtx[i][j];
    }
  }
  MakeGameZoneNames(ShortA,ShortB);
  for(s16 i=0;i<3;i++){
    for(s16 j=0;j<3;j++) {
      move_zonedat(&aZStack432,&gGlobals.Sub.ZoneDatMtx[i][j]);
    }
  }
  for(s16 i=0;i<3;i++){
    for(s16 j=0;j<3;j++) {
      Zonedat_clear(&aZStack432[i][j],1,0);
    }
  }
  loading_map_data(gGlobals.Sub.ZoneDatMtx[1] + 1);
  if ((gGlobals.Sub.ZoneDatMtx[1][1].borg5_ID == 0) ||
     (uVar21 = 1, gGlobals.Sub.ZoneDatMtx[1][1].borg9_id == 0)) {
    playerData* ppVar9 = gGlobals.playerCharStruct.playerDat;
    if (gGlobals.screenFadeModeSwitch == 2) {
      ppVar9 = gGlobals.playerDataArray[gCombatP->current_Ent->index];
    }
    Gsprintf("Center scene not in Borg.\nPlayer Pos: (%3.4f, %3.4f)\nNew Grid: %d-%c%02d",
      (ppVar9->collision).pos.x,(ppVar9->collision).pos.z,gGlobals.Sub.mapDatA,gGlobals.Sub.mapShort1 - 1 + 0x41,gGlobals.Sub.mapShort2);
    CRASH("LoadGameBorgScenes",gGlobals.text);
  }
  uVar22 = (uint)((gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat).byte0x1a;
  uVar11 = uVar22 & 1;
  for(u16 i=0;i<8;i++) {
    if (uVar11 != 0) {
      Zonedat_clear(&gGlobals.Sub.ZoneDatMtx[uStack112[i][0]][uStack112[i][1]],1,0);
    }
    uVar21 = (uVar21 & 0x7f) << 1;
    uVar11 = uVar22 & uVar21;
  }
  for(s16 i=0;i<3;i++) {
    for(s16 j=0;j<3;j++) {
      ZoneDat* z= &gGlobals.Sub.ZoneDatMtx[i][j];
      if ((z->borg5_ID) &&(z->sceneDat0x4 == NULL)) {
        z->alpha = 0xff;
        if (z->index == 0x11) {
          z->sceneDat0x4 = BorgAnimLoadScene(z->borg5_ID);
        }
        else {
          #ifdef DEBUGVER
          if ((!gLoadOneZone) && (NoExpPak_memCheck(3)))
          #else
          if (NoExpPak_memCheck(3))
          #endif
            AllocAllocQueueItem(&gGlobals.QueueB,z->sceneDat0x4,0,z->borg5_ID,1,(char)uStack_30);
        }
      }
      if ((z->unk0x10) && (z->SceneDat0x14 == NULL)) {
        if (z->index == 0x11) {
          z->SceneDat0x14 = BorgAnimLoadScene(uVar21);
        }
        else if ((gLoadOneZone == 0) && (NoExpPak_memCheck(4))) {
          AllocAllocQueueItem(&gGlobals.QueueB,z->SceneDat0x14,0,z->unk0x10,1,(char)uStack_30);
        }
      }
      loading_map_data(z);
      if (z->index == 0x11) {
        gGlobals.Sub.borg9DatPointer = &z->mapPointer->dat;
        gGlobals.Sub.particleEmmiter.borg9dat = gGlobals.Sub.borg9DatPointer;
        BorgMaps::GetMapTerrain(gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
        if ((gGlobals.sky.Type == 3) && (gGlobals.sky.Type == 3)) {
          if ((u32)gGlobals.Sub.weather.rainShortA == 0) //both rainShortA andd rainShortB checked
            Sky::SetBackgroundType(3,gGlobals.Sub.weather.skyBgdat,600.0);
          else N64PRINT("Different Precip types, Don't set sky\n");
        }
        else {
          sVar15 = gGlobals.Sub.weather.skyBgdat;
          if (((gGlobals.sky.Type == 3) && ((short)gGlobals.Sub.weather.rainShortA < 3)) &&
             (0 < (short)gGlobals.Sub.weather.rainShortA)) {
            sVar15 = 2;
          }
          Sky::SetBackgroundType(gGlobals.sky.Type,sVar15,0.0);
          gGlobals.Sub.weather.fogTime = TerrainPointer->FogFloat;
        }
      }
    }
  }
if (((gGlobals.Sub.gamemodeType == 0) && (gGlobals.minimap.active == 0)) && (gGlobals.sky.Type == 3))
 set_map_event_flag(gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
}

void ApplyZoneVelocity(vec3f *param_1,playerData *param_2){
  (param_2->collision).pos.x += (*param_1).x;
  (param_2->collision).pos.y += (*param_1).y;
  (param_2->collision).pos.z += (*param_1).z;
  if (param_2->flags & ACTOR_ISPLAYER) GiveCameraToPlayer(param_2);
  Camera::ApplyVelocity(&gGlobals.Sub.camera,param_1);
  FUN_8001b888(&gGlobals.Sub.particleEmmiter,param_1);
}
//get reference point map object by ID number
voxelObject * FindReferncePoint(Borg9Data *param_1,u16 id){  
  if (param_1->voxelObjCount) {
    for(u16 i = 0;i < param_1->voxelObjCount;i++) {
      voxelObject *v = &param_1->voxelObjs[i];
      if (((v->header).type == VOXEL_ReferencePoint) && (v->refpoint.refpointID == id)) {
        return v;
      }
    }
  }
  return NULL;
}
//duplicates FindReferncePoint()? used by dialouge funcs.
voxelObject * get_map_referencepoint(Borg9Data *param_1,u16 id){  
  if (param_1->voxelObjCount) {
    for(u16 i = 0;i < param_1->voxelObjCount;i++) {
      voxelObject *v = &param_1->voxelObjs[i];
      if (((v->header).type == VOXEL_ReferencePoint) && (v->refpoint.refpointID == id)) {
        return v;
      }
    }
  }
  return NULL;
}
//get reference point map object by name. used for battle positions (Spawn, retreat)
voxelObject * FindReferncePointName(Borg9Data *param_1,char *name,u8 cantFail){
  u16 len = strlen(name);
  if (param_1->voxelObjCount) {
    for(u16 i=0;i<param_1->voxelObjCount;i++){
      voxelObject *v = &param_1->voxelObjs[i];
      if ((v->header).type == VOXEL_ReferencePoint) {
        char* pcVar6 = (v->refpoint).name;
        if (len == strlen(pcVar6)) {
          u16 len2 = 0;
          char* pcVar4 = name;
          if (len != 0) {
            for(u16 j=0;j<len;j++,pcVar4=name+j) {
              if (*pcVar4 == pcVar6[j]) len2++;
            }
          }
          if (len2 == len) return v;
        }
      }
    }
  }
  if(cantFail)CRASH("FindReferencePointName","Point Not Found");
  return NULL;
}

u32 get_zoneDatByte(s16 param_1,s16 param_2,u32 param_3){
  u16 uVar2 = ((param_3 & 0xff) >> 4) + ((u32)gGlobals.Sub.mapShort1 - (s32)param_1);
  u16 uVar1 = (param_3 & 0xf) + ((u32)gGlobals.Sub.mapShort2 - (s32)param_2);
  if ((uVar2 < 3) && (uVar1 < 3)) return (uVar2 << 4 | uVar1);
  return 0x11;
}

void set_playerdata_zoneDatByte(u16 param_1,u16 param_2){
  
  if (0 < gGlobals.Sub.PlayerHandler.max_player) {
    for(s16 i=0; i < gGlobals.Sub.PlayerHandler.max_player; i++) {
      playerData *p = gGlobals.Sub.PlayerHandler.playerDats)[iVar3];
      if ((p->removeFlag) && (p->visible_flag == 0)) {
        p->zoneDatByte = get_zoneDatByte(param_1,param_2,p->zoneDatByte);
      }
    }
  }
}

void some_zoneDat_func(){
  for(s16 i=0;i<3;i++) {
    for(s16 j=0;j<3;j++) {
      ZoneDat* z=&gGlobals.Sub.ZoneDatMtx[i][j];
      if((z->sceneDat0x4)&&(z->flag&1)){
        z->flag&=~1;
        ZoneMoveSceneDat(z->sceneDat0x4,z->index);
      }
      if((z->SceneDat0x14)&&(z->flag&2)){
        z->flag&=~2;
        ZoneMoveSceneDat(z->SceneDat0x14,z->index);
      }
      if((z->mapPointer)&&(DAT_800e8dbc))
        audio_ref_objs(&gGlobals.SFXStruct,&z->mapPointer->dat,z->MapTally,z->index);
    }
  }
  DAT_800e8dbc = 0;
}

void TeleportPlayer(playerData *player,voxelObject *tp,vec3f *param_3){
  u16 uVar1;
  u16 uVar2;
  voxelObject *pfVar8;
  u8 bVar5;
  int iVar6;
  u16 ShortA;
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
  if (param_3 == NULL) no_TP_vec3 = 1;
  loadGameBorgScenes((tp->teleport).MapShort1,(tp->teleport).MapShort2);
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
      if (0.5 < vec3Length(pvVar9)) {
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
      if (!Actor::CheckCollision(player,fVar10 - (player->collision).radius,1,0)) {
        Actor::CheckCollision(player,0.0,0,0);
      }
      gGlobals.Sub.weather.rainParticles = NULL;
      Particle::FUN_800b2bc4(&gGlobals.Sub.particleEmmiter);
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
    for(s16 i = 0;i < 9;i++) {
      s16 j = i / 3;
      s16 k = i % 3;
      gGlobals.Sub.ZoneDatMtx[j][k].alpha = 0xff;
    }
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
  if (gGlobals.minimap.active) {
    gGlobals.minimap.savedPlayerPos.x = ((gGlobals.playerCharStruct.playerDat)->collision).pos.x;
    gGlobals.minimap.savedPlayerPos.y = ((gGlobals.playerCharStruct.playerDat)->collision).pos.y;
    gGlobals.minimap.savedPlayerPos.z = ((gGlobals.playerCharStruct.playerDat)->collision).pos.z;
    MiniMap::UpdateSection(&gGlobals.minimap,gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
  }
}

void ConfirmPlayerWithinZone(playerData *param_1,Borg9Data *param_2){

  s16 iVar3;
  u16 uVar4;
  s16 iVar5;
  u16 uVar6;
  vec3f fStack80;
  
  if (param_1->alaron_flag == false) {
    if (((param_1->collision).pos.y < -50.0f) || ((param_1->collision).vel.y < -0.3)) {
      (param_1->collision).pos.y = 50.0f;
      setVec3(&(param_1->collision).vel,0.0,0.0,0.0);
      if (!Actor::CheckCollision(param_1,0.0,0,0)) (param_1->collision).vel.y = -0.054f;
      N64PRINT("Where's the player??\n");
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
    uVar4 = (u16)iVar3;
    if (gGlobals.Sub.mapCellSize.x < (param_1->collision).pos.x) {
      uVar4 = iVar3 + 1;
      fStack80.x = -gGlobals.Sub.mapCellSize.x;
    }
    if ((param_1->collision).pos.z < 0.0) {
      iVar5 = gGlobals.Sub.mapShort2-1;
      fStack80.z = gGlobals.Sub.mapCellSize.y;
    }
    uVar6 = (u16)iVar5;
    if (gGlobals.Sub.mapCellSize.y < (param_1->collision).pos.z) {
      uVar6 = iVar5 + 1;
      fStack80.z = -gGlobals.Sub.mapCellSize.y;
    }
    set_teleport_obj_A(gGlobals.Sub.mapDatA,uVar4,uVar6,&fStack80);
  }
}

SceneData * load_borg_5_func(u32 b5){
  SceneData *scene= BorgAnimLoadScene(b5);
  Scene::SetFlag4(scene);
  Scene::SetFlag40(scene);
  Scene::SetFogFlag(scene);
  return scene;
}
extern u32 DAT_800ee974;

void set_anidat_colors(SceneData *param_1,u8 alpha,u8 param_3,Color32 col){
  float fVar1;
  Color32 bStack216;
  Color32 auStack88;
  
  Scene::SetFlag40(param_1);
  fVar1 = gGlobals.Sub.weather.fogTime;
  if (DAT_800ee974) fVar1 = 0.0;
  Scene::SetFogPlane(param_1,996 - (short)(int)(fVar1 * 40.0f),1000);
  Scene::SetFogColor
            (param_1,gGlobals.sky.colors[2].R,gGlobals.sky.colors[2].G,gGlobals.sky.colors[2].B,
             (uint)gGlobals.sky.colors[2].A);
  if (param_3) {
    if (col.W) {
      bStack216.R = (byte)((int)((uint)gGlobals.sky.colors[0].R + (col.W >> 0x18)) >> 1);
      bStack216.G = (byte)((int)((uint)gGlobals.sky.colors[0].G + (col.W >> 0x10 & 0xff)) >> 1);
      bStack216.B = (byte)((int)((uint)gGlobals.sky.colors[0].B + (col.W >> 8 & 0xff)) >> 1);
      tint_color_with_screenfade(&bStack216,gGlobals.brightness);
      Scene::SetModelTint(param_1,bStack216.R,bStack216.G,bStack216.B,alpha);
      return;
    }
    Scene::SetModelTint(param_1,gGlobals.sky.colors[0].R,gGlobals.sky.colors[0].G,gGlobals.sky.colors[0].B,
               alpha);
  }
  if (col.W) {
    auStack88 = col;
    tint_color_with_screenfade(&auStack88,gGlobals.brightness);
    Scene::SetModelTint(param_1,auStack88.R,auStack88.G,auStack88.B,alpha);
  }
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
#ifdef DEBUGVER
//replace scene object models with boulders
void SceneBoulders(Borg9Data *param_1){
  if (param_1->voxelObjCount) {
    for(u16 i=0;i < param_1->voxelObjCount;i++) {
      if (param_1->voxelObjs[i].header.type == 0) {
        param_1->voxelObjs[i].scene.sceneflags &= ~SceneObj_B7;
        if (param_1->voxelObjs[i].scene.BorgCount) {
          for(u16 j=0;j < param_1->voxelObjs[i].scene.BorgCount;j++) {
            param_1->voxelObjs[i].scene.borgArray[j].borgIndex = BORG5_SceneBoulder;
          }
        }
      }
    }
  }
}
#endif
//clear a scene voxel object's select model if no expansion pak
void NoExpPak_ClearSceneVoxelIndex(Scene_obj_dat *scene,u16 index){
  if (!gExpPakFlag) {
    if (scene->borgArray[index].b7) {
      if (!(scene->sceneflags & SceneObj_B7)) FREEQSCENE(scene->borgArray[index].sceneDat);
      else FREEQB7(scene->borgArray[index].b7);
    }
  }
}
//clear a scene voxel object's models if no expansion pak
void NoExpPak_ClearSceneVoxel(Scene_obj_dat *scene){
  if ((!gExpPakFlag) && (scene->BorgCount)) {
    for(u16 i=0;i<scene->BorgCount;i++){
      if (scene->borgArray[i].b7) {
        if (!(scene->sceneflags & SceneObj_B7)) FREEQSCENE(scene->borgArray[i].sceneDat);
        else FREEQB7(scene->borgArray[i].b7);
      }
    }
  }
}
struct struct_A {
    SceneData *SceneDat;
    u16 flags;
};
struct_A struct_a_ARRAY_800f5290[0x20];

//Render the "scene" voxel objects
Gfx * RenderVoxelScenes(Gfx *gfx,Borg9Data *borg9,vec3f *v3,short param_4,short param_5,float posx,float posz){
  EventFlag EVar1;
  void *pvVar2;
  u8 bVar6;
  Borg7Header *pBVar3;
  SceneData *pAVar4;
  u16 uVar5;
  uint uVar7;
  short sVar8;
  int iVar9;
  Scene_obj_dat *pSVar10;
  Borg7Header **ppBVar11;
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
      uVar5 = local_70->lightIndecies[iVar9];
      SObj = &borg9->voxelObjs[uVar5];
      local_5c = iVar13 + 1;
      Gsprintf("RenderVoxelScenes\nIndex: %d\ntype: %d\nScenes: (%d, %d, %d)\nAddress: %08x",
                  uVar5,(SObj->header).type,(SObj->scene).borgArray[0].borgIndex,
                  (SObj->scene).borgArray[1].borgIndex,(SObj->scene).borgArray[2].borgIndex,
                  SObj);
      local_58 = iVar9;
      if ((((SObj->header).type == VOXEL_Scene) && (((SObj->header).Bitfeild & VOXEL_Active)))
         && (pSVar10 = &SObj->scene, (SObj->header).timestamp < gGlobals.ticker)) {
        (SObj->header).timestamp = gGlobals.ticker;
        prox = vec3_proximity(&param3,&SObj->header.pos);
        fVar19 = (SObj->header).size;
        if (fVar19 <= prox) {
          NoExpPak_ClearSceneVoxel(pSVar10);
          goto LAB_800102d8;
        }
        local_6c = 0xff;
        if ((((SObj->scene).sceneflags & SceneObj_0004) == 0) ||
           (fVar19 * 0.5 < prox)) {
          setVec2(Sobj_pos,(SObj->header).pos.x,(SObj->header).pos.z);
          local_b8[0].x = local_b8[0].x - posx;
          local_b8[0].y = local_b8[0].y - posz;
          fVar19 = three_vec2_proximities(&camCoord,&CamAim,Sobj_pos);
          if (fVar19 <= fVar17) {
            if (fVar19 <= fVar18) local_6c = 0;
            else local_6c = ((fVar19 - fVar18) / (fVar17 - fVar18)) * 255.0;
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
          if ((get_scene_obj_proximity(&local_f8,&camCoord,&CamAim,&local_78,&local_74)) && (local_78 < (float)((double)local_74 * 0.35))) {
            fVar19 = (local_78 / (float)((double)local_74 * 0.35)) *
                     159.0f;
            local_6c = (u8)(fVar19 + 0x60);
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
                uVar15 = (fVar19 - prox) * 255.0f;
              }
              fVar19 = (fVar20 - 2.0f) + 1.0f;
              if (prox < fVar19) {
                uVar15 = (1.0f - (fVar19 - prox)) * 255.0f;
              }
              uVar7 = local_6c;
              if (uVar15 < local_6c) {
                uVar7 = uVar15;
              }
              if ((uVar7 < 0xff) || (psVar14 = NULL, ((SObj->scene).sceneflags & SceneObj_0040))) {
                uVar7 = (uint)voxel_counter;
                psVar14 = struct_a_ARRAY_800f5290 + uVar7;
                voxel_counter += 1;
                psVar14->SceneDat = NULL;
                struct_a_ARRAY_800f5290[uVar7].flags = 0;
              }
              ppBVar11 = &(SObj->scene).borgArray[uVar12].b7;
              if (*ppBVar11 != NULL) {
LAB_80010068:
                if (((SObj->scene).sceneflags & SceneObj_B7) == 0) {
LAB_80010084:
                  pAVar4 = (SObj->scene).borgArray[uVar12].sceneDat;
                }
                else pAVar4 = ((SObj->scene).borgArray[0].b7)->sceneDat;
                col.W = 0;
                if (((SObj->scene).sceneflags & SceneObj_Tint)) col = (SObj->scene).tint;
                Scene::MatrixASetPos(pAVar4,(SObj->header).pos.x - posx,(SObj->header).pos.y,(SObj->header).pos.z - posz);
                    // Oriana's Pathlights
                if ((SObj->scene).borgArray[1].borgIndex == BORG5_OrianaLight) {
                  if (uVar12 == 0) {
                    if (local_64 == 0) {
                      (SObj->header).Bitfeild &= ~VOXEL_Active;
                      passto_WriteTo_VoxelChart(local_70->lightIndecies[local_58],
                                 gGlobals.Sub.mapDatA,gGlobals.Sub.mapShort1,
                                 gGlobals.Sub.mapShort2,0x11,0,0x10);
                    }
                  }
                }
                local_64 = uVar12 & 0xffff;
                if (((SObj->scene).sceneflags & SceneObj_B7) == 0) {
                  uVar12 = local_6c;
                  if (uVar15 < local_6c) uVar12 = uVar15;
                  set_anidat_colors(pAVar4,uVar12,1,col);
                  if (psVar14 == NULL) local_res0 = BorgAnimDrawScene(local_res0,pAVar4);
                  else psVar14->SceneDat = pAVar4;
                }
                else {
                  FUN_800a0304((SObj->scene).borgArray[0].b7,(int)gGlobals.delta);
                  uVar12 = local_6c;
                  if (uVar15 < local_6c) uVar12 = uVar15;
                  set_sun_light(pAVar4,(SObj->scene).sceneflags,SObj,uVar12);
                  passto_InitLight_2(&gGlobals.Sub.DynamicLights,pAVar4,SObj,(short)(int)gGlobals.delta);
                  passto_initLight(pAVar4,borg9,SObj,(short)(int)gGlobals.delta);
                  if (psVar14 == NULL) {
                    local_res0 = BorgAnimDrawSceneLinked(local_res0,(SObj->scene).borgArray[0].b7);
                  }
                  else {
                    psVar14->SceneDat = (SObj->scene).borgArray[0].sceneDat;
                    psVar14->flags|= 2;
                  }
                }
                goto LAB_800102b4;
              }
              if (((SObj->scene).sceneflags & SceneObj_B7) == 0) {
                if (NoExpPak_memCheck(1)) {
                  pAVar4 = BorgAnimLoadScene(pSVar10->borgArray[uVar12].borgIndex);
                  *ppBVar11 = (Borg7Header *)pAVar4;
                  goto LAB_8000ffcc;
                }
                goto LAB_800102b4;
              }
              sVar8 = (short)local_60;
              if (NoExpPak_memCheck(0)) {
                pBVar3 = func_loading_borg7((SObj->scene).borgArray[0].borgIndex,&gGlobals.Sub.particleEmmiter);
                (SObj->scene).borgArray[0].b7 = pBVar3;
                pAVar4 = pBVar3->sceneDat;
                FUN_800a0090(pBVar3,0);
                EVar1 = (SObj->header).flagB;
                if ((SObj->header).flagB != 0) {
                  if ((getEventFlag((SObj->header).flagB)) && (((SObj->header).Bitfeild & VOXEL_Used) == 0)) {
                  }
                  else {
                    if ((getEventFlag((SObj->header).flagB)) || (((SObj->header).Bitfeild & VOXEL_Used) == 0)) goto LAB_8000ffcc;
                  }
                  FUN_800a0090((SObj->scene).borgArray[0].b7,1);
                  FUN_800a0304((SObj->scene).borgArray[0].b7,2);
                }
LAB_8000ffcc:
                guMtxIdentF(&pAVar4->matrixA);
                guMtxIdentF(&pAVar4->matrixB);
                Scene::SetFlag10(pAVar4);
                Scene::SetFlag4(pAVar4);
                Scene::SetFlag40(pAVar4);
                Scene::SetFogFlag(pAVar4);
                //Rad to Deg
                Scene::MatrixARotate(pAVar4,(SObj->scene).rotation.y * 57.29578,
                           (SObj->scene).rotation.x * 57.29578,
                           (SObj->scene).rotation.z * 57.29578);
                Scene::MatrixANormalizeScale(pAVar4,(SObj->scene).scale.x,(SObj->scene).scale.y,(SObj->scene).scale.z);
                if (((SObj->scene).sceneflags & SceneObj_B7)) {
                  Scene::SetLightData(pAVar4);
                  Scene::SceneSetMaxDynamicDirLights(pAVar4,2);
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
    } while (iVar13 < local_70->voxelSceneCount);
  }
  Gsprintf("Finished RenderVoxelScenesInZone\n");
  return local_res0;
}

Gfx* FUN_80010354(Gfx*g,ZoneDat *param_2){
  if (param_2->sceneDat0x4) {
    set_anidat_colors(param_2->sceneDat0x4,param_2->alpha,1,(Color32)(0));
    g = BorgAnimDrawScene(g,param_2->sceneDat0x4);}
  return g;
}


Gfx* FUN_800103b0(Gfx*g,ZoneDat *param_2){
  if ((param_2->SceneDat0x14) && (param_2->sceneDat0x4)){
    set_anidat_colors(param_2->SceneDat0x14,param_2->alpha,1,(Color32)(0));
    g = BorgAnimDrawScene(g,param_2->SceneDat0x14);
  }
  return g;
}

u8  FUN_80010414(vec2f *param_1,vec2f *param_2,vec2f *param_3,vec2f *param_4,s16 reverse){
  bool bVar1;
  s16 uVar2;
  float fVar3;
  float fVar4;
  vec2f fStack280;
  vec2f fStack216;
  vec2f afStack152;
  vec2f fStack88;
  
  if (reverse) {
    fStack280.x = param_1->y;
    fStack280.y = param_1->x;
    fStack216.x = param_2->y;
    fStack216.y = param_2->x;
    afStack152.x = param_3->y;
    fStack88.x = param_4->y;
    fStack88.y = param_4->x;
  }
  else {
    copyVec2(param_1,&fStack280);
    copyVec2(param_2,&fStack216);
    copyVec2(param_3,&afStack152);
    copyVec2(param_4,&fStack88);
  }
  fVar4 = fStack280.y - fStack88.y;
  fVar3 = fStack216.y - fStack88.y;
  uVar2 = (fVar4 < 0.0);
  if (fVar3 < 0.0) {
    uVar2 = ((fVar4 < 0.0) + 1);
  }
  bVar1 = false;
  if (uVar2 == 1) {
    if (fVar4 < 0.0) fVar4 = -fVar4;
    if (fVar3 < 0.0) {
      fVar3 = fVar4 - fVar3;
    }
    else {
      fVar3 = fVar4 + fVar3;
    }
    fVar3 = fStack280.x - (fStack280.x - fStack216.x) * (fVar4 / fVar3);
    bVar1 = false;
    if ((afStack152.x <= fVar3) && (fVar3 <= fStack88.x)) {
      bVar1 = true;
    }
  }
  return bVar1;
}

u8 FUN_80010598(short param_1,short param_2){

  vec2f *pvVar2;
  float fVar5;
  float fVar6;
  vec2f fStack176;
  vec2f fStack168;
  vec2f fStack160;
  vec2f fStack152;
  vec2f fStack112;
  vec2f fStack104[3];
  fVar6 = (float)(param_1 + -1) * gGlobals.Sub.mapCellSize.x;
  fVar5 = (float)(param_2 + -1) * gGlobals.Sub.mapCellSize.y;
  fStack104[0].x = gGlobals.Sub.camera.rotationXZ.x * 200.0f;
  fStack104[0].y = gGlobals.Sub.camera.rotationXZ.y * 200.0f;
  fStack176.x = fVar6 - 20.0f;
  fStack112.x = gGlobals.Sub.camera.pos.x;
  fStack176.y = fVar5 - 20.0f;
  fStack112.y = gGlobals.Sub.camera.pos.z;
  fStack168.x = fVar6 + gGlobals.Sub.mapCellSize.x + 20.0f;
  fStack160.y = fVar5 + gGlobals.Sub.mapCellSize.y + 20.0f;
  fStack168.y = fStack176.y;
  fStack160.x = fStack176.x;
  fStack152.x = fStack168.x;
  fStack152.y = fStack160.y;
  copyVec2(fStack104,&fStack104[1]);
  RotVec2(&fStack104[1],-42.5f);
  vec2_sum(&fStack104[1],&fStack112,&fStack104[1]);
  copyVec2(fStack104,&fStack104[2]);
  RotVec2(&fStack104[2],42.5f);
  vec2_sum(&fStack104[2],&fStack112,&fStack104[2]);
  vec2_sum(fStack104,fStack104,&fStack112);
  vec2_sum(&fStack104[1],&fStack104[1],&fStack112);
  vec2_sum(&fStack104[2],&fStack104[2],&fStack112);
  pvVar2 = fStack104;
  for(s16 i=1;i<=3;i++) {
    if (FUN_80010414(&fStack112,pvVar2,&fStack176,&fStack168,false))return false;
    if (FUN_80010414(&fStack112,pvVar2,&fStack160,&fStack152,false))return false;
    if (FUN_80010414(&fStack112,pvVar2,&fStack176,&fStack160,true))return false;
    if (FUN_80010414(&fStack112,pvVar2,&fStack168,&fStack152,true))return false;
    if (1 < i) {
      if (FUN_80010414(fStack104,pvVar2,&fStack176,&fStack168,false))return false;
      if (FUN_80010414(fStack104,pvVar2,&fStack160,&fStack152,false))return false;
      if (FUN_80010414(fStack104,pvVar2,&fStack176,&fStack160,true))return false;
      if (FUN_80010414(fStack104,pvVar2,&fStack168,&fStack152,true))return false;
    }
    pvVar2++;
  }
  return true;
}


void RenderZones(Gfx **GG,vec3f *pos,short delta){
  int iVar2;
  uint uVar3;
  u16 uVar5;
  u16 uVar6;
  u16 uVar7;
  u32 uVar4;
  byte bVar9;
  u16 uVar10;
  u16 uVar11;
  ZoneDat *pZVar12;
  ZoneDat *iVar1;
  short *psVar13;
  short *psVar14;
  int iVar15;
  float posz;
  float posx;
  u16 uStack80 [2];
  Gfx *gOut;
  int iStack_48;
  uint uStack_44;
  uint uStack_40;
  vec3f *uStack60;
  ParticleHeadStruct *pPStack_38;
  u16 (*pauStack_34) [2];
  u16 *puStack_30;
  Gfx **ppGStack_2c;
  
  iStack_48 = 1;
  gOut = *GG;
  u16 uStack144[][2]={{0,0},{2,0},{0,2},{2,2},{1,0},{1,2},{0,1},{2,1}};
  Scene::UnsetFlag40(gGlobals.Sub.ZoneDatMtx[1][1].sceneDat0x4);
  if (gGlobals.screenFadeModeSwitch == 0xc)
    Scene::SetNearFarPlanes(gGlobals.Sub.ZoneDatMtx[1][1].sceneDat0x4,0.1,125.0);
  else Scene::SetNearFarPlanes(gGlobals.Sub.ZoneDatMtx[1][1].sceneDat0x4,1.0,180.0);
  FUN_800a0df4(gGlobals.Sub.ZoneDatMtx[1][1].sceneDat0x4);
  gOut = gsAnimationDataMtx(gOut,gGlobals.Sub.ZoneDatMtx[1][1].sceneDat0x4);
  if (gPlayerRenderTimer) gOut = renderPlayers(&gGlobals.Sub.PlayerHandler,gOut,delta,1,0);
  if ((((gGlobals.Sub.camera.pos.x < 0.0) || (gGlobals.Sub.camera.pos.z < 0.0)) ||
      (gGlobals.Sub.mapCellSize.x < gGlobals.Sub.camera.pos.x)) ||
     (gGlobals.Sub.mapCellSize.y < gGlobals.Sub.camera.pos.z)) {
    iStack_48 = 0;
  }
  if (iStack_48 == 0) {
    gOut = FUN_80010354(gOut,gGlobals.Sub.ZoneDatMtx[1] + 1);
  }
  iVar15 = 0;
  pauStack_34 = uStack144;
  puStack_30 = uStack144[0] + 1;
  ppGStack_2c = &gOut;
  uStack_40 = 1;
  pPStack_38 = &gGlobals.Sub.particleEmmiter;
  uStack60 = &gGlobals.Sub.camera.rotation;
  uStack_44 = (uint)(gGlobals.Sub.borg9DatPointer)->byte0x1b;
  iVar2 = 0;
  do {
    uVar3 = uStack_40;
    psVar13 = (short *)((int)*pauStack_34 + iVar2);
    psVar14 = (short *)((int)puStack_30 + iVar2);
    uStack_40 = (uStack_40 & 0x7f) << 1;
    if ((FUN_80010598(*psVar13,*psVar14)) && ((uStack_44 & uVar3) == 0)) {
      if ((!gExpPakFlag) && (get_MemFree()< 0x18000)) {
        iVar1 = &gGlobals.Sub.ZoneDatMtx[*psVar13][*psVar14];
        if (iVar1->sceneDat0x4) FREEQSCENE(iVar1->sceneDat0x4);
        if (iVar1->SceneDat0x14)FREEQSCENE(iVar1->SceneDat0x14);
      }
    }
    else {
      pZVar12 = &gGlobals.Sub.ZoneDatMtx[*psVar13][*psVar14];
      if (!gExpPakFlag) {
        if (gGlobals.QueueB.items == 0) {
          if (gLoadOneZone == 0) {
            if (pZVar12->borg5_ID == 0) {
            }
            else if (pZVar12->sceneDat0x4 == NULL) {
              if (NoExpPak_memCheck(3)) {
                pZVar12->flag |= 1;
                AllocAllocQueueItem(&gGlobals.QueueB,&pZVar12->sceneDat0x4,0,pZVar12->borg5_ID,1,0);
              }
            }
            if (pZVar12->unk0x10){
              if (pZVar12->SceneDat0x14 == NULL) {
                if (NoExpPak_memCheck(4)) {
                  pZVar12->flag |= 2;
                  AllocAllocQueueItem(&gGlobals.QueueB,&pZVar12->SceneDat0x14,0,pZVar12->borg5_ID,1,0);
                }
                goto LAB_80010bfc;
              }
            }
          }
        }
      }
      else {
LAB_80010bfc:
      }
      if (pZVar12->alpha != 0xff) {
        uVar5 = (u16)pZVar12->alpha + delta * 2;
        if (0xff < uVar5) uVar5 = 0xff;
        pZVar12->alpha = (byte)uVar5;
      }
      if (pZVar12->sceneDat0x4) gOut = FUN_80010354(gOut,pZVar12);
      if (pZVar12->mapPointer) {
        FUN_800ade28(&pZVar12->mapPointer->dat,pos,uStack80,uStack80 + 1);
        uVar6 = (u16)(int)(gGlobals.Sub.mapCellSize.x / (pZVar12->mapPointer->dat).floatsB.x);
        uVar7 = (u16)(int)(gGlobals.Sub.mapCellSize.y / (pZVar12->mapPointer->dat).floatsB.y);
        posz = 0.0;
        posx = 0.0;
        uVar10 = 0;
        uVar11 = 0;
        if (true) {
          switch(pZVar12->index) {
          case 0:
            posz = gGlobals.Sub.mapCellSize.y;
            posx = gGlobals.Sub.mapCellSize.x;
            uVar10 = uVar6;
            uVar11 = uVar7;
            break;
          case 1:
            posz = 0.0;
            posx = gGlobals.Sub.mapCellSize.x;
            uVar10 = uVar6;
            uVar11 = uStack80[1];
            break;
          case 2:
            posz = -gGlobals.Sub.mapCellSize.y;
            posx = gGlobals.Sub.mapCellSize.x;
            uVar10 = uVar6;
            uVar11 = 0;
            break;
          case 0x10:
            posz = gGlobals.Sub.mapCellSize.y;
            posx = 0.0;
            uVar10 = uStack80[0];
            uVar11 = uVar7;
            break;
          case 0x12:
            posz = -gGlobals.Sub.mapCellSize.y;
            posx = 0.0;
            uVar10 = uStack80[0];
            uVar11 = 0;
            break;
          case 0x20:
            posz = gGlobals.Sub.mapCellSize.y;
            posx = -gGlobals.Sub.mapCellSize.x;
            uVar10 = 0;
            uVar11 = uVar7;
            break;
          case 0x21:
            posz = 0.0;
            posx = -gGlobals.Sub.mapCellSize.x;
            uVar10 = 0;
            uVar11 = uStack80[1];
            break;
          case 0x22:
            posz = -gGlobals.Sub.mapCellSize.y;
            posx = -gGlobals.Sub.mapCellSize.x;
            uVar10 = 0;
            uVar11 = 0;
          }
        }
        gOut = RenderVoxelScenes(gOut,&pZVar12->mapPointer->dat,pos,uVar10,uVar11,posx,posz);
      }
    }
    iVar15 = (int)(short)((short)iVar15 + 1);
    iVar2 = iVar15 << 2;
    if (7 < iVar15) {
      if (iStack_48) {
        gOut = FUN_80010354(gOut,&gGlobals.Sub.ZoneDatMtx[1][1]);
      }
      Gsprintf("ParticleHead");
      Particle::ProcessAndRenderParticleHead(ppGStack_2c,pPStack_38,uStack60,delta,Graphics::GetBufferChoice(),0);
      Gsprintf("Render Player Shadows\n");
      gOut = renderPlayerShadows(&gGlobals.Sub.PlayerHandler,gOut);
      Gsprintf("Render Players (Water)\n");
      if (gPlayerRenderTimer == 0) {
        gOut = renderPlayers(&gGlobals.Sub.PlayerHandler,gOut,delta,1,0);
      }
      Gsprintf("RenderVoxelScenesInZone[1][1]\n");
      getZonePositionShorts(&(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat,pos,(s16 *)uStack80,
                 (s16 *)(uStack80 + 1));
      gOut = RenderVoxelScenes(gOut,&(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat,pos,uStack80[0]
                               ,uStack80[1],0.0,0.0);
      Gsprintf("Render Players(trans)\n");
      gOut = renderPlayers(&gGlobals.Sub.PlayerHandler,gOut,delta,1,1);
      Gsprintf("Finished Render Zones\n");
      *GG = gOut;
      return;
    }
  } while( true );
}

void RenderTransZones__(Gfx **param_1){
  SceneData **ppAVar2;
  
  Gfx *g = *param_1;
  if (voxel_counter) {
    for(u16 i=0; i < voxel_counter; i++) {
      ppAVar2 = &struct_a_ARRAY_800f5290[i].SceneDat;
      if (!(struct_a_ARRAY_800f5290[i].flags) & 2)) g = BorgAnimDrawScene(g,*ppAVar2);
      else g = BorgAnimDrawSceneLinked(g,*ppAVar2);
    }
  }
  *param_1 = g;
  voxel_counter = 0;
}

void renderTransZones_(Gfx**GG){
  //this one was a big mess.
  
  ZoneDat*pZVar9;
  u16 someList[9][2]={{0,0},{2,0},{0,2},{2,2},{1,0},{1,2},{0,1},{2,1},{1,1}};
  u32 uVar13 = 1;
  Gfx* g = *GG;
  u8 bVar1 = (gGlobals.Sub.borg9DatPointer)->byte0x1b;

  for(s16 i=0;i<9;i++){
    if (((FUN_80010598(someList[i][0],someList[i][1])) || ((bVar1 & uVar13) != 0)) &&
       (pZVar9 = &gGlobals.Sub.ZoneDatMtx[someList[i][0]][someList[i][1]],
       pZVar9->SceneDat0x14)) {
      g = FUN_800103b0(g,pZVar9);
      uVar13 = (uVar13 & 0x7f) << 1;
    }
  }
  *GG = g;
}

void mapFloatDat_copy(mapFloatDat *param_1){
  s32 iVar1;
  u16 uVar2;
  
  uVar2 = 0;
  gGlobals.Sub.unk120e = 0;
  gGlobals.Sub.unkCounter = 0;
  gGlobals.Sub.unkTimer = 0;
  iVar1 = 0;
  do {
    COPY(&gGlobals.Sub.MapFloatDats[uVar2][iVar1],param_1);
    uVar2++;
    iVar1 = uVar2 << 1;
  } while (uVar2 < 15);
}

void InitZoneEngine(u16 param_1,short param_2){
  u8 Map_;
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
  u16 dat;
  int aiStack_e8 [32];
  vec3f afStack104;
  
  piVar7 = aiStack232;
  piVar5 = {3,0,1,-1,2,-1,4,5,6,7,8,9,10,11,-1};
  sVar9 = 0;
  dat = 0;
  partCount = ParticleMAX;
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
  switch(gGlobals.Sub.gamemodeType){
    case 0: {
        sVar9=0x28;
        if(!gExpPakFlag) partCount= ParticleJ0;
        break;
      }
    case 1: {
      sVar9 = 0xe;
      if (!gExpPakFlag) partCount = ParticleJ1;
      break;
    }
    case 2:{
      sVar9 = 0;
      dat = 3;
      if (!gExpPakFlag) partCount = ParticleJ2;
      break;
    }
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
      COPY(&gGlobals.Sub.MapFloatDatEntry,pmVar6);
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
  switch (param_1){
  case 0:
    gGlobals.Sub.PlayerHandler.float_0x68 = 30.0f;
    gGlobals.Sub.PlayerHandler.shadowDist = 20.0f;
    break;
  case 1:
    gGlobals.Sub.PlayerHandler.float_0x68 = 128.0f;
    gGlobals.Sub.PlayerHandler.shadowDist = 128.0f;
    break;
  case 2:
    gGlobals.Sub.PlayerHandler.float_0x68 = 0.0;
    gGlobals.Sub.PlayerHandler.shadowDist = 0.0;
    break;
  default:
    CRASH("ZoneEngineInit","Unknown Engine Mode");
  }
  if (gGlobals.minimap.active != 0) {
    if (gGlobals.playerCharStruct.playerDat != NULL) {
      gGlobals.minimap.savedPlayerPos.x = ((gGlobals.playerCharStruct.playerDat)->collision).pos.x;
      gGlobals.minimap.savedPlayerPos.y = ((gGlobals.playerCharStruct.playerDat)->collision).pos.y;
      gGlobals.minimap.savedPlayerPos.z = ((gGlobals.playerCharStruct.playerDat)->collision).pos.z;
    }
    MiniMap::UpdateSection(&gGlobals.minimap,gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
  }
}

void SaveEngineZone(playerData *param_1,mapFloatDat *param_2){
  if (!engineZone_flag) N64PRINT("SaveZoneEngine Aborted");
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

void clear_music_values(u16 ClearAll){
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
//clear the BGM values id there's no expansion pak
void clear_music_no_expPak(){
  if (((!gExpPakFlag) && (gGlobals.Sub.Borg12Next)) &&
      (gGlobals.Sub.Borg12Next != gGlobals.Sub.Borg12Next2)) {
    clear_music_values(false);
  }
}
//update and play the next BGM in Queue
void update_BGM_(){
  if (gGlobals.Sub.Borg12Next) {
    if (gGlobals.Sub.Borg12Next != gGlobals.Sub.Borg12Next2) {
      clear_music_values(0);
      if (0 < gGlobals.Sub.Borg12Next) {
        gGlobals.Sub.BGM = load_borg_12(gGlobals.Sub.Borg12Next);
        DCM::Add(&gGlobals.Sub.BGMIndex,&gGlobals.Sub.BGMID,
             &(gGlobals.Sub.BGM)->dat->sub,gGlobals.VolBGM * 255.0f,0x80,1,-1,0);
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
  FreeEnvProps();
  Sky::SetBackgroundType(2,0,0.0);
}
#ifdef DEBUGVER
void ClearVoxelFlags(Borg9Data *param_1){
  if (param_1->voxelObjCount) {
    for(u16 i=0;i < param_1->voxelObjCount;i++) {
      param_1->voxelObjs[i].header.Bitfeild=0;
    }
  }
}
extern u16 enemyHostileFlag;

void VoxelIndexPosition(short delta,playerData *param_2){
  Borg9Data *pBVar6;
  uint uVar7;
  voxelObject *pvVar10;
  pvVar10 = voxel_index_pointer;
  if (voxel_index) {
    pBVar6 = GetCollisionZone(param_2->zoneDatByte);
    char labels[][24] ={
      "VOBJECT_CONTAINER",
      "VOBJECT_LIGHT",
      "VOBJECT_AUDIO",
      "VOBJECT_WANDERNODE",
      "VOBJECT_MONSTERPARTY",
      "VOBJECT_REFERENCEPOINT",
      "VOBJECT_TELEPORTER",
      "VOBJECT_CAMERA",
      "VOBJECT_DIALOGUE",
      "VOBJECT_TRIGGER",
      "VOBJECT_SAVEPOINT",
      "VOBJECT_CODE"};
    uVar7 = (uint)voxel_index_timer;
    voxel_index_timer = (u16)(uVar7 - (int)delta);
    pvVar10 = voxel_index_pointer;
    if ((int)((uVar7 - (int)delta) * 0x10000) < 1) {
      ClearVoxelFlags(pBVar6);
      uVar7 = (voxel_index_number + 1) % (uint)pBVar6->voxelObjCount;
      enemyHostileFlag = 0;
      voxel_index_timer = 0xb4;
      voxel_index_number = (u16)uVar7;
      pvVar10 = pBVar6->voxelObjs + uVar7;
      Gsprintf("\n\n\nGOING to Voxel Index: %d\nType: %s\nPosition: (%3.2f, %3.2f, %3.2f)\n"
         ,uVar7,labels[(pvVar10->header).type],
         (pvVar10->header).pos.x,(pvVar10->header).pos.y,(pvVar10->header).pos.z);
      N64PRINT(gGlobals.text);
      if (voxel_index_pointer) {
        Gsprintf("\n\nAT V-Type: %s\nPosition: (%3.2f, %3.2f, %3.2f)\n",labels[voxel_index_pointer->header.type],
                 voxel_index_pointer->header.pos.x,voxel_index_pointer->header.pos.y,voxel_index_pointer->header.pos.z);
        N64PRINT(gGlobals.text);
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
  u8 bVar1;
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
  VoxelIndexPosition(delta,player);
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
    Gsprintf("pZ->map: %d\npT->map: %d\ndoReset: %d - %d\n"(int)gGlobals.Sub.mapDatA,
                (uint)((gGlobals.Sub.refObjPointer)->teleport).MapDatA,uVar3,0);
    N64PRINT();
    #endif
    TeleportPlayer(player,gGlobals.Sub.refObjPointer,gGlobals.Sub.tpVec3);
    gGlobals.Sub.refObjPointer = NULL;
    gGlobals.Sub.tpVec3 = NULL;
    #ifndef DEBUGVER
    if (((!gExpPakFlag) && (bVar1)) && (retailTpFlag)) {
      no_ExpPak_memcheck_flag = 1;
      gFreeZoneEngineTimer = 3;
      DAT_800e8dc6 = 0;
    }
    retailTpFlag = 0;
    #endif
  }
  some_zoneDat_func();
  if ((gPlayerRenderTimer != 0) &&
     (uVar3 = (uint)gPlayerRenderTimer, gPlayerRenderTimer = (u16)(uVar3 - iVar4),
     (int)((uVar3 - iVar4) * 0x10000) < 0)) gPlayerRenderTimer = 0;
  if (gGlobals.Sub.gamemodeType != 2) {
    Gsprintf("ProcessPlayers");
    ProcessPlayers(&gGlobals.Sub.PlayerHandler,delta);
    Gsprintf("The crash was not in ProcessPlayers");
  }
  if ((player) && (gGlobals.Sub.gamemodeType == 0)) {
    Gsprintf("SaveZoneEngine");
    uVar3 = (uint)gGlobals.Sub.unkTimer;
    gGlobals.Sub.unkTimer = (u16)(uVar3 - iVar4);
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
  SceneSetCameraLookAt(gGlobals.Sub.ZoneDatMtx[1][1].sceneDat0x4,gGlobals.Sub.camera.pos.x,
             gGlobals.Sub.camera.pos.y,gGlobals.Sub.camera.pos.z,gGlobals.Sub.camera.aim.x,
             gGlobals.Sub.camera.aim.y,gGlobals.Sub.camera.aim.z);
  if (gGlobals.Sub.gamemodeType != 2) G = Sky::RenderSky(G,delta);
  if (gGlobals.sky.Type == 3) {
    DEBUGSprintf("RenderSkyObjects/RenderClouds");
    G = Skyobjects::Render(G);
    G = Clouds::Render(G);
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
    Particle::ProcessAndRenderParticleHead(&G,&gGlobals.Sub.particleEmmiter,&gGlobals.Sub.camera.rotation,delta,
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