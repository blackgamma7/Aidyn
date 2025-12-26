#include "game.h"
#include "skyObjects.h"
#include "voxelChart.h"
#include "vobjects.h"
#include "combat/CombatStruct.h"
#define FILENAME "./src/zoneengine.cpp"

#ifdef DEBUGVER //some sprintf calls not found in retail version
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
    if (uVar3 <= 40) return false;
    else if ((float)(40*0x1000) < dVar4) {
      if (dVar5 < (float)(24*0x1000)) {
        DAT_800e8dbe = 108;
        doubleGlobalTickerFlag = 2;
        noop_800969a4();
        FreeAllActors();
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
  //assumes 100x100 map chunks
  fVar9 = 0.0;
  if (param_5) fVar9 = 100000.0f;
  Vec3Set(&globalPos,position->x + (float)(mapshortA * 100),position->y,
          position->z + (float)(mapShortB * 100));
  iVar4 = 0;
  pmVar6 = NULL;
  for(u16 i=0;i<15;i++) {
    pmVar5 = &gGlobals.gameVars.MapFloatDats[i];
    fVar8 = fVar9;
    pmVar7 = pmVar6;
    if (param_4 ==gGlobals.gameVars.MapFloatDats[i].mapDatA) {
      CLEAR(&fStack104);
      pvec3.x = pmVar5->playerVec3.x+(float)(pmVar5->MapShort1*100);
      pvec3.y = pmVar5->playerVec3.y;
      pvec3.z = pmVar5->playerVec3.z+(float)(pmVar5->MapShort2*100);
      fStack104.x = pvec3.x;
      fStack104.y = pvec3.y;
      fStack104.z = pvec3.z;
      fVar8 = Vec3Dist(&globalPos,&pvec3);
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
    pmVar6 = pmVar7;
  }
  return pmVar7;
}

u8 FUN_8000ccc0(){
  u16 uVar3 = get_obj_free();
  float fVar4 = (float)(u16)get_MemFree();
  float fVar6 = (float)get_memFree_2();
  if (gFreeZoneEngineTimer == 0) {
    if (DAT_800e8dc6) DAT_800e8dc6--;
    if (gExpPakFlag) return false;
    if (DAT_800e8dc6) return false;
    if ((((gGlobals.gameVars.mapDatA == 0) && (40 < uVar3)) &&
        ((double)(fVar4 / fVar6) < 0.5)) || (no_ExpPak_memcheck_flag)) {
      no_ExpPak_memcheck_flag = 0;
      no_TP_vec3 = 1;
      DAT_800e8dc6 = 180;
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
  u16 i;
  
  ALLOCS(gGlobals.gameVars.zoneEnginePtr1,(sizeof(collisionTypeA)*2),456);
  ALLOCS(gGlobals.gameVars.zoneEnginePtr2,(sizeof(SpeedProperty)*2),457);
  ALLOCS(gGlobals.gameVars.EnvProps,(sizeof(EnvProp)*26),458);
  for(i = 0;i < 2;i++) {
    collisionTypeA *x = gGlobals.gameVars.zoneEnginePtr1 + i;
    CLEAR(x);
    if (i == 0) {
      x->unk0 = 0.0;
      x->unk4 = 0.0;
    }
    else if (i == 1) {//used by "Collision Player" and "Collision Player And Camera"
      x->unk0 = 0.0;
      x->unk4 = 1.0;
    }
  }
  for(i = 0;i < 2;i++)  {
    SpeedProperty *x = gGlobals.gameVars.zoneEnginePtr2 + i;
    CLEAR(x);
    if (i == 0) {
      x->velScale = 1.0;
      (x->gravity).y = -0.06;
    }
    else if (i == 1) { //used by "Water" to simulate water resistance
      x->velScale = .5;
      (x->gravity).y = -0.0015;
    }
  }
  for(i = 0;i < 26;i++) {
    EnvProp *x = gGlobals.gameVars.EnvProps + i;
    CLEAR(x);
    x->colA = gGlobals.gameVars.zoneEnginePtr1 + EnvPropBools[i][0];
    x->Speed = gGlobals.gameVars.zoneEnginePtr2 + EnvPropBools[i][1];
  }
}
//clar Enviromental Properties associated with Borg9Phys objects.
void FreeEnvProps(){
  HFREE(gGlobals.gameVars.zoneEnginePtr1,558);
  HFREE(gGlobals.gameVars.zoneEnginePtr2,559);
  HFREE(gGlobals.gameVars.EnvProps,560);
  gGlobals.gameVars.EnvProps = NULL;
  gGlobals.gameVars.zoneEnginePtr1 = NULL;
  gGlobals.gameVars.zoneEnginePtr2 = NULL;
}
//associate Enviromental Properties with Borg9Phys objects.
void attachPhysicsProperties(Borg9Data *param_1){
  u16 uVar1;
  borg9_phys *pbVar2;
  u16 uVar3;
  u16 uVar4;
  borg9_phys *puVar4;
  u16 i;
  u32 uVar6;
  
  if (param_1->borghpys_count != 0) {
    for(i=0;i<param_1->borghpys_count;i++) {
      pbVar2 = param_1->phys_pointer;
      //union?
      uVar1 = *(u16 *)((int)&pbVar2[i].envProperty + 2);
      #ifdef DEBUGVER
      if (25 < uVar1) {
        Gsprintf("Invalid Physics Property: %d\n",uVar1);
        CRASH("AttachPhysicsProperties",gGlobals.text);
      }
      #endif
      uVar3 = pbVar2[i].GroundType;
      uVar4 = uVar3 & 0xf000;
      if (uVar4 == 0x1000) {
        uVar3 = (u16)((uVar3 + 1 & 0x7f) << 5) | 0x1000 | uVar1 & 0x1f;
LAB_8000d2c4:
        pbVar2[i].GroundType = uVar3;
        pbVar2[i].flags |= B9Phys_1000;
      }
      else {
        if (uVar4 < 0x1001) {
          if ((uVar3 & 0xf000) != 0) {
            uVar1 = pbVar2[i].GroundType;
LAB_8000d25c:
            Gsprintf("Unknown attach: %04x\n",uVar1);
            CRASH("AttachPhysicsProperties",gGlobals.text);
          }
LAB_8000d2bc:
          uVar4 = pbVar2[i].flags;
          uVar3 = uVar1 | 0x3000;
          goto LAB_8000d2c4;
        }
        if (uVar4 == B9Phys_2000) {
          uVar4 = pbVar2[i].flags;
          uVar3 = (u16)((uVar3 & 0x7f) << 5) | 0x2000 | uVar1 & 0x1f;
          goto LAB_8000d2c4;
        }
        if (uVar4 != 0x4000) {
          uVar1 = pbVar2[i].GroundType;
          goto LAB_8000d25c;
        }
        if (gExpPakFlag) goto LAB_8000d2bc;
        pbVar2[i].flags = B9Phys_0001;
        pbVar2[i].GroundType = 0;
      }
      pbVar2[i].envProperty = gGlobals.gameVars.EnvProps + uVar1;
    }
  }
}
//get Borg9data loaded at BCD'd index.
Borg9Data * GetCollisionZone(u8 x){
  Borg9Header **z = &gGlobals.gameVars.ZoneDatMtx[x >> 4][x & 3].mapPointer;
  if (*z) return &(*z)->dat;
  CRASH("GetCollisionZone","No Zone at Grid");
}

void set_teleport_pointer(voxelObject *param_1){
  gGlobals.gameVars.refObjPointer = param_1;
  gGlobals.gameVars.tpVec3 = NULL;
  if (((gGlobals.screenFadeMode == 0) && (0.0 < gGlobals.brightness)) ||
     (gGlobals.ticker - initZoneTimestamp < 3)) {
    gGlobals.screenFadeMode = 1;
    gGlobals.screenFadeSpeed = (2.0/3);
  }
}

void set_teleport_obj_A(u16 mapA,u16 Short1,u16 Short2,vec3f *pos){
  gGlobals.gameVars.refObjPointer = &bss_tele_obj;
  gGlobals.gameVars.tpVec3 = &vec3_800f5210;
  Vec3Copy(pos,&vec3_800f5210);
  CLEAR(&bss_tele_obj);
  bss_tele_obj.teleport.MapDatA = mapA;
  bss_tele_obj.teleport.MapShort1 = Short1;
  bss_tele_obj.teleport.MapShort2 = Short2;
  bss_tele_obj.header.type = VOXEL_Teleporter;
}

void set_teleport_obj_loadgame(u16 mapA,u16 Short1,u16 Short2,vec3f *pos){
  gGlobals.gameVars.refObjPointer = &loadgame_tp_obj;
  gGlobals.gameVars.tpVec3 = NULL;
  CLEAR(&loadgame_tp_obj);
  loadgame_tp_obj.header.type = VOXEL_Teleporter;
  loadgame_tp_obj.teleport.refPoint_Pos = 0x7ff8;
  loadgame_tp_obj.teleport.MapDatA = mapA;
  loadgame_tp_obj.teleport.MapShort1 = Short1;
  loadgame_tp_obj.teleport.MapShort2 = Short2;
  Vec3Copy(pos,&loadgame_tp_obj.header.pos);
}

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
      (ptVar6 = (gGlobals.gameVars.borg9DatPointer)->voxelObjs + (param_2->GroundType >> 5 & 0x7f),
      ((ptVar6->header).Bitfeild & VOXEL_Active) != 0)))) {
    switch((ptVar6->header).type){
      case VOXEL_Camera:{
        set_camera_voxel_pointer(ptVar6,&param_1->pos);
        break;
      }
      case VOXEL_Teleporter:{
        set_teleport_pointer(ptVar6);
        return;
      }
      case VOXEL_Dialouge:{
        if (!dialoug_obj_func(ptVar6,ppVar5)) return;
        dialouge_vobject_func(ptVar6,0,0xff);
        return;
      }
      default:{
      Gsprintf("Invalid Trigger Type: %d\n",(u32)VVar1);
      N64PRINT(gGlobals.text);
      }
    }
  }
}

void init_some_map_data(ZoneDat *dat,s16 i,char j){
  CLEAR(dat);
  dat->flag = 7;
  dat->index = (char)((int)i << 4) + j;
}

void FUN_8000d744(){
  for(s16 i = 0;i < 3;i++){
    for(s16 j = 0;j < 3;j++) {
      init_some_map_data(&gGlobals.gameVars.ZoneDatMtx[i][j],(s16)i,(char)j);
    }
  }
}

void Zonedat_clear(ZoneDat *param_1,s16 param_2,s16 param_3){
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
    param_1->borg5_ID2 = 0;
  }
}

void ofunc_zoneengine_free(){
  for(s16 i=0;i<3;i++){
    for(s16 j=0;j<3;j++){
      Zonedat_clear(&gGlobals.gameVars.ZoneDatMtx[i][j],1,0);
    }
    HFREE(&gGlobals.gameVars.ZoneDatMtx[i],1034);
  }
  //old bug?
  HFREE(&gGlobals.gameVars,1036);
}

void move_zonedat(ZoneDat *param_1[3][3],ZoneDat *param_2){
  
  if (param_2->borg5_ID) {
    for(s16 i=0;i<3;i++){
      for(s16 j=0;j<3;j++){
        ZoneDat *x=param_1[i][j];
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

void MakeGameZoneNames(u16 param_1,u16 param_2){
  u16 uVar1;
  u16 uVar2;
  s16 iVar3;
  int j;
  ZoneDat *dat;
  int iVar5;
  s16 i;
  int iVar7;
  
  if ((param_1 < 23) && (i = 0, uVar1 = param_1, uVar2 = param_2, param_2 < 31)) {
    do {
      gGlobals.gameVars.mapShort2 = uVar2;
      gGlobals.gameVars.mapShort1 = uVar1;
      j = 0;
      iVar5 = (s16)param_2 + -1;
      iVar3 = ((s16)param_1 + i + -1);
      iVar7 = 0x10000;
      do {
        dat = &gGlobals.gameVars.ZoneDatMtx[i][j];
        init_some_map_data(dat,(s16)i,(char)j);
        j = (int)(s16)iVar5;
        if ((iVar3 - 1U < 0x15) && (j - 1U < 0x1d)) {
          dat->borg5_ID = gLoadedMapIndecies[iVar3][j][0];
          dat->borg9_id = gLoadedMapIndecies[iVar3][j][1];
          dat->borg5_ID2 = gLoadedMapIndecies[iVar3][j][2];
          checkToggleZoneScene(dat);
        }
        j = iVar7 >> 0x10;
        iVar5 += 1;
        iVar7 = iVar7 + 0x10000;
      } while (j < 3);
      i++;
      uVar1 = gGlobals.gameVars.mapShort1;
      uVar2 = gGlobals.gameVars.mapShort2;
    } while (i < 3);
    return;
  }
  Gsprintf("Zone out of Range\nZone: (%d, %d)\nRange: (%d, %d)",param_1,param_2,22,30);
  CRASH("MakeGameZoneNames",gGlobals.text);
}
//Move map model relative to BCD'd index
void ZoneMoveSceneDat(SceneData *scene,u8 index){
  float x;
  float y;
  
  if (!scene) return;
  scene->flags = 0;
  guMtxIdentF(&scene->matrixA);
  guMtxIdentF(&scene->matrixB);
  Scene::SetFlag10(scene);
  Scene::SetFogFlag(scene);
  Scene::SetFlag8(scene);
  if (index == ZoneCenter) Scene::UnsetFlag4(scene);
  else Scene::SetFlag4(scene);
  if (false) return;
  y = gGlobals.gameVars.mapCellSize.y;
  switch(index) {
  case 0:
    x = -gGlobals.gameVars.mapCellSize.x;
    y = -gGlobals.gameVars.mapCellSize.y;
    break;
  case 1:
    y = -gGlobals.gameVars.mapCellSize.x;
    goto LAB_8000df9c;
  case 2:
    x = -gGlobals.gameVars.mapCellSize.x;
    break;
  default:
    return;
  case 0x10:
    x = 0.0;
    y = -gGlobals.gameVars.mapCellSize.y;
    break;
  case ZoneCenter:
    y = 0.0;
    goto LAB_8000df9c;
  case 0x12:
    x = 0.0;
    break;
  case 0x20:
    x = gGlobals.gameVars.mapCellSize.x;
    y = -gGlobals.gameVars.mapCellSize.y;
    break;
  case 0x21:
    y = gGlobals.gameVars.mapCellSize.x;
LAB_8000df9c:
    Scene::MatrixASetPos(scene,y,0.0,0.0);
    return;
  case 0x22:
    Scene::MatrixASetPos(scene,gGlobals.gameVars.mapCellSize.x,0.0,gGlobals.gameVars.mapCellSize.y);
    return;
  }
  Scene::MatrixASetPos(scene,x,0.0,y);
}
//clear all loaded map chunks.
void zonedat_clear_all(){
  for(s16 i=0;i<3;i++){
    for(s16 j=0;j<3;j++) {
      Zonedat_clear(&gGlobals.gameVars.ZoneDatMtx[i][j],1,0);
    }
  }
}

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
      if(i==j)Zonedat_clear(&gGlobals.gameVars.ZoneDatMtx[i][i],0,1);//clears [0][0],[1][1],and [2][2]. Onlly [1][1] intended?
      else Zonedat_clear(&gGlobals.gameVars.ZoneDatMtx[i][j],1,1);
    }
  }
  noop_800969a4();
  FreeAllActors();
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
  u32 uStack_30;
  s16 sVar15 = no_TP_vec3;
  u16 uStack112[2][8]={{0,0,1,0,2,0,0,1},{2,1,0,2,1,2,2,2}};
  no_TP_vec3 = 0;
  uStack_30 = (u32)(sVar15 == 0);
  Process_queue_B(&gGlobals.QueueB,1);
  for(s16 i=0;i<3;i++){
    for(s16 j=0;j<3;j++) {
      aZStack432[i][j]=gGlobals.gameVars.ZoneDatMtx[i][j];
    }
  }
  MakeGameZoneNames(ShortA,ShortB);
  for(s16 i=0;i<3;i++){
    for(s16 j=0;j<3;j++) {
      move_zonedat(&aZStack432,&gGlobals.gameVars.ZoneDatMtx[i][j]);
    }
  }
  for(s16 i=0;i<3;i++){
    for(s16 j=0;j<3;j++) {
      Zonedat_clear(&aZStack432[i][j],1,0);
    }
  }
  loading_map_data(&MAPCENTER);
  if ((MAPCENTER.borg5_ID == 0) ||
     (uVar21 = 1, MAPCENTER.borg9_id == 0)) {
    playerData* ppVar9 = gPlayer;
    if (gGlobals.screenFadeModeSwitch == 2) {
      ppVar9 = gGlobals.playerDataArray[gCombatP->current_Ent->index];
    }
    Gsprintf("Center scene not in Borg.\nPlayer Pos: (%3.4f, %3.4f)\nNew Grid: %d-%c%02d",
      (ppVar9->collision).pos.x,(ppVar9->collision).pos.z,gGlobals.gameVars.mapDatA,gGlobals.gameVars.mapShort1 - 1 + 'A',gGlobals.gameVars.mapShort2);
    CRASH("LoadGameBorgScenes",gGlobals.text);
  }
  uVar22 = (u32)((MAPCENTER.mapPointer)->dat).byte0x1a;
  uVar11 = uVar22 & 1;
  for(u16 i=0;i<8;i++) {
    if (uVar11 != 0) {
      Zonedat_clear(&gGlobals.gameVars.ZoneDatMtx[uStack112[i][0]][uStack112[i][1]],1,0);
    }
    uVar21 = (uVar21 & 0x7f) << 1;
    uVar11 = uVar22 & uVar21;
  }
  for(s16 i=0;i<3;i++) {
    for(s16 j=0;j<3;j++) {
      ZoneDat* z= &gGlobals.gameVars.ZoneDatMtx[i][j];
      if ((z->borg5_ID) &&(z->sceneDat0x4 == NULL)) {
        z->alpha = 0xff;
        if (z->index == ZoneCenter) {
          z->sceneDat0x4 = BorgAnimLoadScene(z->borg5_ID);
        }
        else {
          #ifdef DEBUGVER
          if ((!gLoadOneZone) && (NoExpPak_memCheck(3)))
          #else
          if (NoExpPak_memCheck(3))
          #endif
            AllocAllocQueueItem(&gGlobals.QueueB,(void**)&z->sceneDat0x4,0,z->borg5_ID,1,(char)uStack_30);
        }
      }
      if ((z->borg5_ID2) && (z->SceneDat0x14 == NULL)) {
        if (z->index == ZoneCenter) {
          z->SceneDat0x14 = BorgAnimLoadScene(z->borg5_ID2);
        }
        else 
        #ifdef DEBUGVER
        if ((!gLoadOneZone) && (NoExpPak_memCheck(4))) 
        #else
        if(NoExpPak_memCheck(4))
        #endif
        {
          AllocAllocQueueItem(&gGlobals.QueueB,(void**)&z->SceneDat0x14,0,z->borg5_ID2,1,(char)uStack_30);
        }
      }
      loading_map_data(z);
      s16 skyVar=gGlobals.sky.Type;
      if (z->index == ZoneCenter) {
        gGlobals.gameVars.borg9DatPointer = &z->mapPointer->dat;
        gGlobals.gameVars.particleHead.borg9dat = gGlobals.gameVars.borg9DatPointer;
        BorgMaps::GetMapTerrain(gGlobals.gameVars.mapShort1,gGlobals.gameVars.mapShort2);
        //double-ckeck sky?
        if ((gGlobals.sky.Type == SkyTypeOutdoor) && (skyVar == SkyTypeOutdoor)) {
          if (*(u32*)&gGlobals.gameVars.weather.rainShortA == 0) //both rainShortA andd rainShortB checked
            Sky::SetBackgroundType(SkyTypeOutdoor,gGlobals.gameVars.weather.skyBgdat,600.0);
          else N64PRINT("Different Precip types, Don't set sky\n");
        }
        else {
          skyVar = gGlobals.gameVars.weather.skyBgdat;
          if (((gGlobals.sky.Type == SkyTypeOutdoor) && ((s16)gGlobals.gameVars.weather.rainShortA < 3)) &&
             (0 < (s16)gGlobals.gameVars.weather.rainShortA)) {
            skyVar = 2;
          }
          Sky::SetBackgroundType(gGlobals.sky.Type,skyVar,0.0);
          gGlobals.gameVars.weather.fogTime = TerrainPointer->FogFloat;
        }
      }
    }
  }
if (((gGlobals.gameVars.gamemodeType == GameMode_Trek) && (!MINIMAP.active)) && (gGlobals.sky.Type == SkyTypeOutdoor))
 set_map_event_flag(gGlobals.gameVars.mapShort1,gGlobals.gameVars.mapShort2);
}

void ApplyZoneVelocity(vec3f *v,playerData *param_2){
  (param_2->collision).pos.x += (*v).x;
  (param_2->collision).pos.y += (*v).y;
  (param_2->collision).pos.z += (*v).z;
  if (param_2->flags & ACTOR_ISPLAYER) GiveCameraToPlayer(param_2);
  Camera::ApplyVelocity(&gCamera,v);
  FUN_8001b888(&gGlobals.gameVars.particleHead,v);
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
  u16 uVar2 = ((param_3 & 0xff) >> 4) + ((u32)gGlobals.gameVars.mapShort1 - (s32)param_1);
  u16 uVar1 = (param_3 & 0xf) + ((u32)gGlobals.gameVars.mapShort2 - (s32)param_2);
  if ((uVar2 < 3) && (uVar1 < 3)) return (uVar2 << 4 | uVar1);
  return ZoneCenter;
}

void set_playerdata_zoneDatByte(u16 param_1,u16 param_2){
  
  if (0 < PHANDLE.max_player) {
    for(s16 i=0; i < PHANDLE.max_player; i++) {
      playerData *p = &PHANDLE.playerDats[i];
      if ((p->removeFlag) && (p->visible_flag == 0)) {
        p->zoneDatByte = get_zoneDatByte(param_1,param_2,p->zoneDatByte);
      }
    }
  }
}

void some_zoneDat_func(){
  for(s16 i=0;i<3;i++) {
    for(s16 j=0;j<3;j++) {
      ZoneDat* z=&gGlobals.gameVars.ZoneDatMtx[i][j];
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
  s32 iVar4 = (int)gGlobals.sky.Type;
  memset_voxelChart_entries();
  pfVar8 = NULL;
  clear_camera_voxel_pointer();
  bVar5 = false;
  set_playerdata_zoneDatByte((tp->teleport).MapShort1,(tp->teleport).MapShort2);
  set_SFX_ZoneDatByte(&gGlobals.SFXStruct,(tp->teleport).MapShort1,(tp->teleport).MapShort2);
  gGlobals.gameVars.mapDatA = (tp->teleport).MapDatA;
  gGlobals.gameVars.mapShort1 = (tp->teleport).MapShort1;
  gGlobals.gameVars.mapShort2 = (tp->teleport).MapShort2;
  gGlobals.gameVars.mapDatB = 0xffff;
  gGlobals.gameVars.mapDatC = 0xffff;
  BorgMaps::LoadMap(gGlobals.gameVars.mapDatA,-1,-1,false);
  clear_music_no_expPak();
  if (param_3 == NULL) no_TP_vec3 = 1;
  loadGameBorgScenes((tp->teleport).MapShort1,(tp->teleport).MapShort2);
  if (param_3 == NULL) {
    if (gGlobals.sky.Type == SkyType4) {
      Camera::SetMode(&gCamera,1);
    }
    if (gGlobals.sky.Type == SkyTypeOutdoor) {
      Camera::SetMode(&gCamera,0);
    }
    if (uVar1 == 0x7ff8) {
      fStack312.x = (tp->header).pos.x;
      fStack312.y = (tp->header).pos.y;
      fStack312.z = (tp->header).pos.z;
    }
    else {
      pfVar8 = FindReferncePoint(&(MAPCENTER.mapPointer)->dat,uVar1);
      Gsprintf("FindReferencePoint\nPoint Not Found: %d\n",(u32)uVar1);
      if (pfVar8 == NULL) CRASH("TeleportPlayer",gGlobals.text);
      fStack312.x = (pfVar8->header).pos.x;
      fStack312.y = (pfVar8->header).pos.y;
      fStack312.z = (pfVar8->header).pos.z;
    }
    if (uVar2 != 0) prStack_38 = FindReferncePoint(&(MAPCENTER.mapPointer)->dat,uVar2);
    if (player) Vec3Sub(&fStack312,&fStack312,&(player->collision).pos);
    fStack312.y = 0.0;
    if (pfVar8 != NULL) {
      (pfVar8->refpoint).position.y = 0.0;
      Vec3Normalize(&(pfVar8->refpoint).position);
      if (0.5 < Vec3Length(&(pfVar8->refpoint).position)) {
        Vec2Set(&player->facing,-(pfVar8->refpoint).position.x,-(pfVar8->refpoint).position.z);
      }
    }
  }
  else {
    Vec3Copy(param_3,&fStack312);
    bVar5 = true;
  }
  if (player) {
    ApplyZoneVelocity(&fStack312,player);
    Vec3Copy( &(player->collision).pos,&fStack312);
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
      gGlobals.gameVars.weather.rainParticles = NULL;
      Particle::FUN_800b2bc4(&gGlobals.gameVars.particleHead);
    }
    Camera::SetFeild70(&gCamera, &(player->collision).pos);
  }
  if (prStack_38 == NULL) {
    if ((player != NULL) && (param_3 == NULL)) {
      if (gGlobals.sky.Type == SkyType4) {
        fStack184.x = (player->collision).pos.x;
        fVar10 = (player->collision).pos.y;
        fStack184.z = (player->collision).pos.z;
        fStack184.y = fVar10 + gCamera.camHeight;
        fStack248.x = fStack184.x - (player->facing).x * 4.0f;
        fStack248.y = fVar10 + 3.0f;
        fStack248.z = fStack184.z - (player->facing).y * 4.0f;
        Camera::SetPos(&gCamera,&fStack248);
        Camera::SetAim(&gCamera,&fStack184);
      }
      else {
        fStack120.x = (player->collision).pos.x;
        fStack120.z = (player->collision).pos.z;
        fStack120.y = (player->collision).pos.y + gCamera.camHeight;
        Camera::SetAim(&gCamera,&fStack120);
        gCamera.rotationXZ.x = (player->facing).x;
        gCamera.rotationXZ.y = (player->facing).y;
        Vec2Scale(&gCamera.rotationXZ,-1.0);
        Camera::FUN_800b050c(&gCamera,&fStack120);
        Camera::SetPos(&gCamera,&fStack120);
      }
    }
  }
  else Camera::SetPos(&gCamera,&prStack_38->header.pos);
  gCamera.unk80 = 5;
  if ((param_3 == NULL) || (pfVar8 != NULL)) {
    for(s16 i = 0;i < 9;i++) {
      s16 j = i / 3;
      s16 k = i % 3;
      gGlobals.gameVars.ZoneDatMtx[j][k].alpha = 0xff;
    }
  }
  if (iVar4 != gGlobals.sky.Type) {
    if (gGlobals.sky.Type == SkyType4) {
      Sundial::ToggleMoon(0);
      Sundial::ToggleSun(0);
    }
    else {
      Sundial::ToggleMoon(1);
      Sundial::ToggleSun(1);
    }
  }
  if (MINIMAP.active) {
    MINIMAP.savedPlayerPos.x = ((gPlayer)->collision).pos.x;
    MINIMAP.savedPlayerPos.y = ((gPlayer)->collision).pos.y;
    MINIMAP.savedPlayerPos.z = ((gPlayer)->collision).pos.z;
    MINIMAP.UpdateSection(gGlobals.gameVars.mapShort1,gGlobals.gameVars.mapShort2);
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
      Vec3Set(&(param_1->collision).vel,0.0,0.0,0.0);
      if (!Actor::CheckCollision(param_1,0.0,0,0)) (param_1->collision).vel.y = -0.054f;
      N64PRINT("Where's the player??\n");
      return;
    }
  }
  if (((((param_1->collision).pos.x < 0.0) || ((param_1->collision).pos.z < 0.0)) ||
      (gGlobals.gameVars.mapCellSize.x < (param_1->collision).pos.x)) || (gGlobals.gameVars.mapCellSize.y < (param_1->collision).pos.z)) {
    iVar3 = (int)(s16)gGlobals.gameVars.mapShort1;
    iVar5 = (int)(s16)gGlobals.gameVars.mapShort2;
    fStack80.z = 0.0;
    fStack80.y = 0.0;
    fStack80.x = 0.0;
    if ((param_1->collision).pos.x < 0.0) {
      iVar3 = gGlobals.gameVars.mapShort1-1;
      fStack80.x = gGlobals.gameVars.mapCellSize.x;
    }
    uVar4 = (u16)iVar3;
    if (gGlobals.gameVars.mapCellSize.x < (param_1->collision).pos.x) {
      uVar4 = iVar3 + 1;
      fStack80.x = -gGlobals.gameVars.mapCellSize.x;
    }
    if ((param_1->collision).pos.z < 0.0) {
      iVar5 = gGlobals.gameVars.mapShort2-1;
      fStack80.z = gGlobals.gameVars.mapCellSize.y;
    }
    uVar6 = (u16)iVar5;
    if (gGlobals.gameVars.mapCellSize.y < (param_1->collision).pos.z) {
      uVar6 = iVar5 + 1;
      fStack80.z = -gGlobals.gameVars.mapCellSize.y;
    }
    set_teleport_obj_A(gGlobals.gameVars.mapDatA,uVar4,uVar6,&fStack80);
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

void SetSceneColors(SceneData *param_1,u8 alpha,u8 param_3,u32 col){
  float fVar1;
  Color32 bStack216;
  Color32 auStack88;
  
  Scene::SetFlag40(param_1);
  fVar1 = gGlobals.gameVars.weather.fogTime;
  if (DAT_800ee974) fVar1 = 0.0;
  Scene::SetFogPlane(param_1,996 - (s16)(int)(fVar1 * 40.0f),1000);
  Scene::SetFogColor
            (param_1,gFogColor.R,gFogColor.G,gFogColor.B,
             (u32)gFogColor.A);
  if (param_3) {
    if (col) { //if porting, will need case for LE word
      bStack216.R = (byte)((int)((u32)gMainColor.R + (col >> 0x18)) >> 1);
      bStack216.G = (byte)((int)((u32)gMainColor.G + (col >> 0x10 & 0xff)) >> 1);
      bStack216.B = (byte)((int)((u32)gMainColor.B + (col >> 8 & 0xff)) >> 1);
      tint_color_with_screenfade(&bStack216,gGlobals.brightness);
      Scene::SetModelTint(param_1,bStack216.R,bStack216.G,bStack216.B,alpha);
      return;
    }
    Scene::SetModelTint(param_1,gMainColor.R,gMainColor.G,gMainColor.B,
               alpha);
  }
  if (col) {
    auStack88.W = col;
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
  Vec2Sub(&distA,aim,cam);
  Vec2Sub(&distB,obj,cam);
  normA = Vec2Normalize(&distB);
  normB = Vec2Normalize(&distA);
  if (normA <= normB) {
    Vec2Scale(&distA,normA);
    Vec2Sum(&distB,cam,&distA);
    *outx = Vec2Dist(&distB,obj);
    *outy = Vec2Dist(&distB,aim);
  }
  return normA <= normB;
}
#ifdef DEBUGVER
//replace scene object models with boulders
void SceneBoulders(Borg9Data *param_1){
  for(u16 i=0;i < param_1->voxelObjCount;i++) {
    if (param_1->voxelObjs[i].header.type == VOXEL_Scene) {
      param_1->voxelObjs[i].scene.sceneflags &= ~SceneObj_B7;
      for(u16 j=0;j < param_1->voxelObjs[i].scene.BorgCount;j++) {
        param_1->voxelObjs[i].scene.borgArray[j].borgIndex = BORG5_SceneBoulder;
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
  union{  
    SceneData *SceneDat;
    Borg7Header* b7;
  };
  u16 flags;
};
struct_A struct_a_ARRAY_800f5290[0x20];

//Render the "scene" voxel objects
Gfx * RenderVoxelScenes(Gfx *gfx,Borg9Data *borg9,vec3f *posLocal,s16 param_4,s16 param_5,float cellX,float cellZ){
  EventFlag EVar1;
  void *pvVar2;
  u8 bVar6;
  Borg7Header *pBVar3;
  SceneData *pAVar4;
  u16 uVar5;
  u32 uVar7;
  s16 sVar8;
  int iVar9;
  Scene_obj_dat *pSVar10;
  Borg7Header **ppBVar11;
  Color32 col;
  voxelObject *SObj;
  s16 uVar12;
  int iVar13;
  struct_A *psVar14;
  u32 uVar15;
  float fVar17;
  float fVar18;
  float prox;
  double dVar16;
  float fVar19;
  float fVar20;
  Gfx *local_res0;
  vec3f pos;
  vec2f camCoord;
  vec2f CamAim;
  vec2f local_f8;
  vec2f local_b8 [8];
  float local_78;
  float local_74;
  CollideSection *local_70;
  u32 local_6c;
  vec2f *Sobj_pos;
  u32 local_64;
  int local_60;
  int local_5c;
  int local_58;
  
  fVar17 = __cosf(0.6544875f);
  fVar18 = __cosf(0.7417525f);
  pos.x = posLocal->x + cellX;
  camCoord.x = gCamera.pos.x;
  camCoord.y = gCamera.pos.z;
  CamAim.x = gCamera.aim.x;
  CamAim.y = gCamera.aim.z;
  pos.y = posLocal->y;
  pos.z = posLocal->z + cellZ;
  local_70 = getCollideSection(borg9,param_4,param_5);
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
        prox = Vec3Dist(&pos,&SObj->header.pos);
        fVar19 = (SObj->header).size;
        if (fVar19 <= prox) {
          NoExpPak_ClearSceneVoxel(pSVar10);
          goto LAB_800102d8;
        }
        local_6c = 0xff;
        if ((((SObj->scene).sceneflags & SceneObj_0004) == 0) ||
           (fVar19 * 0.5 < prox)) {
          Vec2Set(Sobj_pos,(SObj->header).pos.x,(SObj->header).pos.z);
          local_b8[0].x -= cellX;
          local_b8[0].y -= cellZ;
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
        uVar12 = ((SObj->scene).BorgCount - 1);
        sVar8 = (s16)local_5c;
        if (-1 < (int)uVar12) {
          do {
            fVar20 = 0.0;
            local_60 = uVar12 - 1;
            fVar19 = pSVar10->borgArray[uVar12].renderProx;
            if (uVar12 != 0) fVar20 = pSVar10->borgArray[uVar12 - 1].renderProx;
            if ((prox < fVar20 - 2.0f) || (fVar19 < prox)) {
              NoExpPak_ClearSceneVoxelIndex(pSVar10,(u16)uVar12);
LAB_800102b4:
              sVar8 = (s16)local_60;
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
                psVar14 = &struct_a_ARRAY_800f5290[voxel_counter++];
                psVar14->SceneDat = NULL;
                psVar14->flags = 0;
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
                if (((SObj->scene).sceneflags & SceneObj_Tint)) col.W = (SObj->scene).tint.W;
                Scene::MatrixASetPos(pAVar4,(SObj->header).pos.x - cellX,(SObj->header).pos.y,(SObj->header).pos.z - cellZ);
                    // Oriana's Pathlights
                if ((SObj->scene).borgArray[1].borgIndex == BORG5_OrianaLight) {
                  if (uVar12 == 0) {
                    if (local_64 == 0) {
                      (SObj->header).Bitfeild &= ~VOXEL_Active;
                      passto_WriteTo_VoxelChart(local_70->lightIndecies[local_58],
                                 gGlobals.gameVars.mapDatA,gGlobals.gameVars.mapShort1,
                                 gGlobals.gameVars.mapShort2,0x11,VOXEL_Scene,0x10);
                    }
                  }
                }
                local_64 = uVar12 & 0xffff;
                if (!((SObj->scene).sceneflags & SceneObj_B7)) {
                  uVar12 = local_6c;
                  if (uVar15 < local_6c) uVar12 = uVar15;
                  SetSceneColors(pAVar4,uVar12,1,col.W);
                  if (psVar14 == NULL) local_res0 = BorgAnimDrawScene(local_res0,pAVar4);
                  else psVar14->SceneDat = pAVar4;
                }
                else {
                  Borg7_TickAnimation((SObj->scene).borgArray[0].b7,gGlobals.delta);
                  uVar12 = local_6c;
                  if (uVar15 < local_6c) uVar12 = uVar15;
                  set_sun_light(pAVar4,(SObj->scene).sceneflags,SObj,uVar12);
                  passto_InitLight_2(&gGlobals.gameVars.DynamicLights,pAVar4,SObj,gGlobals.delta);
                  passto_initLight(pAVar4,borg9,SObj,gGlobals.delta);
                  if (psVar14 == NULL) {
                    local_res0 = Borg7_Render(local_res0,(SObj->scene).borgArray[0].b7);
                  }
                  else {
                    psVar14->b7 = (SObj->scene).borgArray[0].b7;
                    psVar14->flags|= SceneObj_B7;
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
              sVar8 = (s16)local_60;
              if (NoExpPak_memCheck(0)) {
                pBVar3 = func_loading_borg7((SObj->scene).borgArray[0].borgIndex,&gGlobals.gameVars.particleHead);
                (SObj->scene).borgArray[0].b7 = pBVar3;
                pAVar4 = pBVar3->sceneDat;
                Borg7_SetAnimation(pBVar3,0);
                EVar1 = (SObj->header).flagB;
                if ((SObj->header).flagB != 0) {
                  if ((getEventFlag((SObj->header).flagB)) && (((SObj->header).Bitfeild & VOXEL_Used) == 0)) {
                  }
                  else {
                    if ((getEventFlag((SObj->header).flagB)) || (((SObj->header).Bitfeild & VOXEL_Used) == 0)) goto LAB_8000ffcc;
                  }
                  Borg7_SetAnimation((SObj->scene).borgArray[0].b7,1);
                  Borg7_TickAnimation((SObj->scene).borgArray[0].b7,2);
                }
LAB_8000ffcc:
                guMtxIdentF(&pAVar4->matrixA);
                guMtxIdentF(&pAVar4->matrixB);
                Scene::SetFlag10(pAVar4);
                Scene::SetFlag4(pAVar4);
                Scene::SetFlag40(pAVar4);
                Scene::SetFogFlag(pAVar4);
                //Rad to Deg
                Scene::MatrixARotate(pAVar4,(SObj->scene).rotation.y * RadInDeg_f,
                           (SObj->scene).rotation.x * RadInDeg_f,
                           (SObj->scene).rotation.z * RadInDeg_f);
                Scene::MatrixANormalizeScale(pAVar4,(SObj->scene).scale.x,(SObj->scene).scale.y,(SObj->scene).scale.z);
                if (((SObj->scene).sceneflags & SceneObj_B7)) {
                  Scene::SetLightData(pAVar4);
                  Scene::SceneSetMaxDynamicDirLights(pAVar4,2);
                  goto LAB_80010068;
                }
                goto LAB_80010084;
              }
            }
            uVar12 = (u32)sVar8;
          } while (-1 < (int)uVar12);
          sVar8 = (s16)local_5c;
        }
      }
      else {
LAB_800102d8:
        sVar8 = (s16)local_5c;
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
    SetSceneColors(param_2->sceneDat0x4,param_2->alpha,1,0);
    g = BorgAnimDrawScene(g,param_2->sceneDat0x4);}
  return g;
}


Gfx* FUN_800103b0(Gfx*g,ZoneDat *param_2){
  if ((param_2->SceneDat0x14) && (param_2->sceneDat0x4)){
    SetSceneColors(param_2->SceneDat0x14,param_2->alpha,1,0);
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
    Vec2Copy(param_1,&fStack280);
    Vec2Copy(param_2,&fStack216);
    Vec2Copy(param_3,&afStack152);
    Vec2Copy(param_4,&fStack88);
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

u8 FUN_80010598(s16 param_1,s16 param_2){

  vec2f *pvVar2;
  float fVar5;
  float fVar6;
  vec2f fStack176;
  vec2f fStack168;
  vec2f fStack160;
  vec2f fStack152;
  vec2f fStack112;
  vec2f fStack104[3];
  fVar6 = (float)(param_1 + -1) * gGlobals.gameVars.mapCellSize.x;
  fVar5 = (float)(param_2 + -1) * gGlobals.gameVars.mapCellSize.y;
  fStack104[0].x = gCamera.rotationXZ.x * 200.0f;
  fStack104[0].y = gCamera.rotationXZ.y * 200.0f;
  fStack176.x = fVar6 - 20.0f;
  fStack112.x = gCamera.pos.x;
  fStack176.y = fVar5 - 20.0f;
  fStack112.y = gCamera.pos.z;
  fStack168.x = fVar6 + gGlobals.gameVars.mapCellSize.x + 20.0f;
  fStack160.y = fVar5 + gGlobals.gameVars.mapCellSize.y + 20.0f;
  fStack168.y = fStack176.y;
  fStack160.x = fStack176.x;
  fStack152.x = fStack168.x;
  fStack152.y = fStack160.y;
  Vec2Copy(fStack104,&fStack104[1]);
  Vec2Rot(&fStack104[1],-42.5f);
  Vec2Sum(&fStack104[1],&fStack112,&fStack104[1]);
  Vec2Copy(fStack104,&fStack104[2]);
  Vec2Rot(&fStack104[2],42.5f);
  Vec2Sum(&fStack104[2],&fStack112,&fStack104[2]);
  Vec2Sum(fStack104,fStack104,&fStack112);
  Vec2Sum(&fStack104[1],&fStack104[1],&fStack112);
  Vec2Sum(&fStack104[2],&fStack104[2],&fStack112);
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


void RenderZones(Gfx **GG,vec3f *pos,s16 delta){
  int iVar2;
  u32 uVar3;
  u16 uVar5;
  u16 uVar6;
  u16 uVar7;
  u32 uVar4;
  byte bVar9;
  u16 uVar10;
  u16 uVar11;
  ZoneDat *pZVar12;
  ZoneDat *iVar1;
  s16 *psVar13;
  s16 *psVar14;
  int i;
  float posz;
  float posx;
  u16 uStack80 [2];
  Gfx *gOut;
  int iStack_48;
  u32 uStack_44;
  u32 uStack_40;
  vec3f *uStack60;
  ParticleHeadStruct *pPStack_38;
  u16 (*pauStack_34) [2];
  u16 *puStack_30;
  Gfx **ppGStack_2c;
  
  iStack_48 = 1;
  gOut = *GG;
  u16 uStack144[][2]={{0,0},{2,0},{0,2},{2,2},{1,0},{1,2},{0,1},{2,1}};
  Scene::UnsetFlag40(MAPCENTER.sceneDat0x4);
  if (gGlobals.screenFadeModeSwitch == 0xc)
    Scene::SetNearFarPlanes(MAPCENTER.sceneDat0x4,0.1,125.0);
  else Scene::SetNearFarPlanes(MAPCENTER.sceneDat0x4,1.0,180.0);
  FUN_800a0df4(MAPCENTER.sceneDat0x4);
  gOut = gsAnimationDataMtx(gOut,MAPCENTER.sceneDat0x4);
  if (gPlayerRenderTimer) gOut = renderPlayers(&PHANDLE,gOut,delta,1,0);
  if ((((gCamera.pos.x < 0.0) || (gCamera.pos.z < 0.0)) ||
      (gGlobals.gameVars.mapCellSize.x < gCamera.pos.x)) ||
     (gGlobals.gameVars.mapCellSize.y < gCamera.pos.z)) {
    iStack_48 = 0;
  }
  if (iStack_48 == 0) {
    gOut = FUN_80010354(gOut,gGlobals.gameVars.ZoneDatMtx[1] + 1);
  }
  i = 0;
  pauStack_34 = uStack144;
  puStack_30 = uStack144[0] + 1;
  ppGStack_2c = &gOut;
  uStack_40 = 1;
  pPStack_38 = &gGlobals.gameVars.particleHead;
  uStack60 = &gCamera.rotation;
  uStack_44 = (u32)(gGlobals.gameVars.borg9DatPointer)->byte0x1b;
  iVar2 = 0;
  do {
    uVar3 = uStack_40;
    psVar13 = (s16 *)((int)*pauStack_34 + iVar2);
    psVar14 = (s16 *)((int)puStack_30 + iVar2);
    uStack_40 = (uStack_40 & 0x7f) << 1;
    if ((FUN_80010598(*psVar13,*psVar14)) && ((uStack_44 & uVar3) == 0)) {
      if ((!gExpPakFlag) && (get_MemFree()< 0x18000)) {
        iVar1 = &gGlobals.gameVars.ZoneDatMtx[*psVar13][*psVar14];
        if (iVar1->sceneDat0x4) FREEQSCENE(iVar1->sceneDat0x4);
        if (iVar1->SceneDat0x14)FREEQSCENE(iVar1->SceneDat0x14);
      }
    }
    else {
      pZVar12 = &gGlobals.gameVars.ZoneDatMtx[*psVar13][*psVar14];
      if (!gExpPakFlag) {
        if (gGlobals.QueueB.items == 0) {
          if (gLoadOneZone == 0) {
            if (pZVar12->borg5_ID == 0) {
            }
            else if (pZVar12->sceneDat0x4 == NULL) {
              if (NoExpPak_memCheck(3)) {
                pZVar12->flag |= 1;
                AllocAllocQueueItem(&gGlobals.QueueB,(void**)&pZVar12->sceneDat0x4,0,pZVar12->borg5_ID,QueueType_Scene,0);
              }
            }
            if (pZVar12->borg5_ID2){
              if (pZVar12->SceneDat0x14 == NULL) {
                if (NoExpPak_memCheck(4)) {
                  pZVar12->flag |= 2;
                  AllocAllocQueueItem(&gGlobals.QueueB,(void**)&pZVar12->SceneDat0x14,0,pZVar12->borg5_ID,QueueType_Scene,0);
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
        uVar6 = (u16)(int)(gGlobals.gameVars.mapCellSize.x / (pZVar12->mapPointer->dat).floatsB.x);
        uVar7 = (u16)(int)(gGlobals.gameVars.mapCellSize.y / (pZVar12->mapPointer->dat).floatsB.y);
        posz = 0.0;
        posx = 0.0;
        uVar10 = 0;
        uVar11 = 0;
        if (true) {
          switch(pZVar12->index) { //add offset from center zone
          case 0x00: //NW corner
            posz = gGlobals.gameVars.mapCellSize.y;
            posx = gGlobals.gameVars.mapCellSize.x;
            uVar10 = uVar6;
            uVar11 = uVar7;
            break;
          case 0x01://Center-North
            posz = 0.0;
            posx = gGlobals.gameVars.mapCellSize.x;
            uVar10 = uVar6;
            uVar11 = uStack80[1];
            break;
          case 0x02: //NE corner
            posz = -gGlobals.gameVars.mapCellSize.y;
            posx = gGlobals.gameVars.mapCellSize.x;
            uVar10 = uVar6;
            uVar11 = 0;
            break;
          case 0x10: //Center-West
            posz = gGlobals.gameVars.mapCellSize.y;
            posx = 0.0;
            uVar10 = uStack80[0];
            uVar11 = uVar7;
            break;
          case 0x12: //Center-East
            posz = -gGlobals.gameVars.mapCellSize.y;
            posx = 0.0;
            uVar10 = uStack80[0];
            uVar11 = 0;
            break;
          case 0x20: //SW Corner
            posz = gGlobals.gameVars.mapCellSize.y;
            posx = -gGlobals.gameVars.mapCellSize.x;
            uVar10 = 0;
            uVar11 = uVar7;
            break;
          case 0x21: //Center-South
            posz = 0.0;
            posx = -gGlobals.gameVars.mapCellSize.x;
            uVar10 = 0;
            uVar11 = uStack80[1];
            break;
          case 0x22: //SE Corner
            posz = -gGlobals.gameVars.mapCellSize.y;
            posx = -gGlobals.gameVars.mapCellSize.x;
            uVar10 = 0;
            uVar11 = 0;
          }
        }
        gOut = RenderVoxelScenes(gOut,&pZVar12->mapPointer->dat,pos,uVar10,uVar11,posx,posz);
      }
    }
    i = (int)(s16)((s16)i + 1);
    iVar2 = i << 2;
    if (7 < i) {
      if (iStack_48) {
        gOut = FUN_80010354(gOut,&MAPCENTER);
      }
      Gsprintf("ParticleHead\n");
      Particle::ProcessAndRenderParticleHead(ppGStack_2c,pPStack_38,uStack60,delta,Graphics::GetBufferChoice(),0);
      Gsprintf("Render Player Shadows\n");
      gOut = renderPlayerShadows(&PHANDLE,gOut);
      Gsprintf("Render Players (Water)\n");
      if (gPlayerRenderTimer == 0) {
        gOut = renderPlayers(&PHANDLE,gOut,delta,1,0);
      }
      Gsprintf("RenderVoxelScenesInZone[1][1]\n");
      getZonePositionShorts(&(MAPCENTER.mapPointer)->dat,pos,(s16 *)uStack80,
                 (s16 *)(uStack80 + 1));
      gOut = RenderVoxelScenes(gOut,&(MAPCENTER.mapPointer)->dat,pos,uStack80[0]
                               ,uStack80[1],0.0,0.0);
      Gsprintf("Render Players(trans)\n");
      gOut = renderPlayers(&PHANDLE,gOut,delta,1,1);
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
      if (!(struct_a_ARRAY_800f5290[i].flags & SceneObj_B7)) g = BorgAnimDrawScene(g,struct_a_ARRAY_800f5290[i].SceneDat);
      else g = Borg7_Render(g,struct_a_ARRAY_800f5290[i].b7);
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
  u8 bVar1 = (gGlobals.gameVars.borg9DatPointer)->byte0x1b;

  for(s16 i=0;i<9;i++){
    if (((FUN_80010598(someList[i][0],someList[i][1])) || ((bVar1 & uVar13) != 0)) &&
       (pZVar9 = &gGlobals.gameVars.ZoneDatMtx[someList[i][0]][someList[i][1]],
       pZVar9->SceneDat0x14)) {
      g = FUN_800103b0(g,pZVar9);
      uVar13 = (uVar13 & 0x7f) << 1;
    }
  }
  *GG = g;
}

void mapFloatDat_copy(mapFloatDat *param_1){

  gGlobals.gameVars.unk120e = 0;
  gGlobals.gameVars.unkCounter = 0;
  gGlobals.gameVars.unkTimer = 0;
  for(u16 i=0;i<15;i++){
    COPY(&gGlobals.gameVars.MapFloatDats[i],param_1);
  }
}

void InitZoneEngine(u16 param_1,s16 param_2){
  u8 Map_;
  int iVar1;
  int iVar2;
  int iVar3;
  playerData *ppVar4;
  int *piVar5;
  mapFloatDat *pmVar6;
  int *piVar7;
  mapFloatDat *pmVar8;
  s16 maxActors;
  s16 partCount;
  u16 dat;
  vec3f afStack104;
  
  s32 partTextInds[] = {BORG1_PlayerShadow,Borg1_Particle0,Borg1_Particle1,-1,Borg1_Particle2,
    -1,Borg1_Particle4,Borg1_Particle5,Borg1_Particle6,Borg1_Particle7,Borg1_Particle8,
    Borg1_Particle9,Borg1_Particle10,Borg1_Particle11,-1,-1,Borg1_Particle12};
  maxActors = 0;
  dat = 0;
  partCount = ParticleMAX;
  DAT_800e9c14 = 0;
  engineZone_flag = 1;
  initZoneTimestamp = gGlobals.ticker;
  if (gGlobals.gameVars.zoneEngineInit) CRASH("InitZoneEngine","Zone Engine already Initialized");
  gGlobals.gameVars.zoneEngineInit = 1;
  gGlobals.gameVars.gamemodeType = param_1;
  InitEnvProps();
  set_checktrigger_pointer(check_trigger);
  gGlobals.gameVars.refObjPointer = NULL;
  gGlobals.gameVars.tpVec3 = NULL;
  Weather::Init(&gGlobals.gameVars.weather);
  InitScriptCameras(&gGlobals.scriptcamera);
  switch(gGlobals.gameVars.gamemodeType){
    case GameMode_Trek: {
        maxActors=PLAYER_ABS_MAXPLAYERS;
        if(!gExpPakFlag) partCount= ParticleJ0;
        break;
      }
    case GameMode_Combat: {
      maxActors = 14;
      if (!gExpPakFlag) partCount = ParticleJ1;
      break;
    }
    case GameMode_Title:{
      maxActors = 0;
      dat = 3;
      if (!gExpPakFlag) partCount = ParticleJ2;
      break;
    }
  }
  pmVar8 = &gGlobals.gameVars.MapFloatDatEntry;
  pmVar6 = &gGlobals.gameVars.MapFloatDatEntry;
  if (param_2 == 0) {
    BorgMaps::LoadMap(gGlobals.gameVars.mapDatA,gGlobals.gameVars.mapDatB,gGlobals.gameVars.mapDatC,false);
    clear_music_no_expPak();
  }
  else {
    Map_ = gGlobals.gameVars.MapFloatDatEntry.mapDatA;
    pmVar8 = pmVar6;
    if ((gGlobals.gameVars.unk120e != 0) &&
       (pmVar6 = FUN_8000cae8(&gGlobals.gameVars.MapFloatDatEntry.playerVec3,
                              gGlobals.gameVars.MapFloatDatEntry.MapShort1,
                              gGlobals.gameVars.MapFloatDatEntry.MapShort2,
                              gGlobals.gameVars.MapFloatDatEntry.mapDatA,0),
       Map_ = gGlobals.gameVars.MapFloatDatEntry.mapDatA, pmVar6 != NULL)) {
      COPY(&gGlobals.gameVars.MapFloatDatEntry,pmVar6);
      Map_ = pmVar6->mapDatA;
      pmVar8 = pmVar6;
    }
    gGlobals.gameVars.mapDatB = pmVar8->mapDatB;
    gGlobals.gameVars.mapDatC = pmVar8->mapDatC;
    gGlobals.gameVars.mapShort1 = pmVar8->MapShort1;
    gGlobals.gameVars.mapShort2 = pmVar8->MapShort2;
    gGlobals.gameVars.mapDatA = Map_;
    BorgMaps::LoadMap(Map_,gGlobals.gameVars.mapDatB,gGlobals.gameVars.mapDatC,false);
    clear_music_no_expPak();
    gGlobals.gameVars.playerPos2d.x = (pmVar8->playerVec3).x;
    gGlobals.gameVars.playerPos2d.y = (pmVar8->playerVec3).z;
  }
  InitPlayerHandler(&gCamera,maxActors,BORG1_PlayerShadow);
  Particle::InitParticleHead(&gGlobals.gameVars.particleHead,gGlobals.gameVars.borg9DatPointer,partCount,17,
                   partTextInds);
  FUN_8000d744();
  no_TP_vec3 = 1;
  loadGameBorgScenes(gGlobals.gameVars.mapShort1,gGlobals.gameVars.mapShort2);
  if (param_2 == 0) {
    CLEAR(&afStack104);
    passto_camera_init(&gCamera,gGlobals.gameVars.borg9DatPointer,&afStack104,dat);
    if ((gPlayer) && ((gPlayer)->removeFlag == 0)) {
      Camera::SetAim(&gCamera,&gPlayer->collision.pos);
      Camera::FUN_800b050c(&gCamera,&afStack104);
      Camera::SetPos(&gCamera,&afStack104);
    }
  }
  else {
    passto_camera_init(&gCamera,gGlobals.gameVars.borg9DatPointer,&pmVar8->cameraVec3,dat);
    if (gPlayer) {
      gPlayer->facing.x = (pmVar8->playerVec2).x;
      gPlayer->facing.y = (pmVar8->playerVec2).y;
      Camera::SetAim(&gCamera,&gPlayer->collision.pos);
    }
  }
  init_dynamic_light(&gGlobals.gameVars.DynamicLights);
  switch (param_1){
  case GameMode_Trek:
    PHANDLE.float_0x68 = 30.0f;
    PHANDLE.shadowDist = 20.0f;
    break;
  case GameMode_Combat:
    PHANDLE.float_0x68 = 128.0f;
    PHANDLE.shadowDist = 128.0f;
    break;
  case GameMode_Title:
    PHANDLE.float_0x68 = 0.0;
    PHANDLE.shadowDist = 0.0;
    break;
  default:
    CRASH("ZoneEngineInit","Unknown Engine Mode");
  }
  if (MINIMAP.active != 0) {
    if (gPlayer != NULL) {
      MINIMAP.savedPlayerPos.x = ((gPlayer)->collision).pos.x;
      MINIMAP.savedPlayerPos.y = ((gPlayer)->collision).pos.y;
      MINIMAP.savedPlayerPos.z = ((gPlayer)->collision).pos.z;
    }
    MINIMAP.UpdateSection(gGlobals.gameVars.mapShort1,gGlobals.gameVars.mapShort2);
  }
}

void SaveEngineZone(playerData *param_1,mapFloatDat *param_2){
  if (!engineZone_flag) N64PRINT("SaveZoneEngine Aborted");
  else {
    param_2->mapDatA = gGlobals.gameVars.mapDatA;
    param_2->mapDatB = gGlobals.gameVars.mapDatB;
    param_2->mapDatC = gGlobals.gameVars.mapDatC;
    param_2->MapShort1 = gGlobals.gameVars.mapShort1;
    param_2->MapShort2 = gGlobals.gameVars.mapShort2;
    if (!param_1) {
      Vec3Set(&param_2->playerVec3,0.0,0.0,0.0);
      Vec2Set(&param_2->playerVec2,1.0,0.0);
    }
    else {
      (param_2->playerVec3).x = (param_1->collision).pos.x;
      (param_2->playerVec3).y = (param_1->collision).pos.y;
      (param_2->playerVec3).z = (param_1->collision).pos.z;
      (param_2->playerVec2).x = (param_1->facing).x;
      (param_2->playerVec2).y = (param_1->facing).y;
    }
    (param_2->cameraVec3).x = gCamera.pos.x;
    (param_2->cameraVec3).y = gCamera.pos.y;
    (param_2->cameraVec3).z = gCamera.pos.z;
  }
}

void clear_music_values(u16 ClearAll){
  if (gGlobals.gameVars.BGM) {
    DCM::Remove(gGlobals.gameVars.BGMIndex,gGlobals.gameVars.BGMID);
    free_borg_12(gGlobals.gameVars.BGM);
    gGlobals.gameVars.BGM = NULL;
  }
  if (ClearAll) {
    gGlobals.gameVars.Borg12Next2 = 0;
    gGlobals.gameVars.Borg12Next = 0;
    gGlobals.gameVars.BGMID = 0;
    gGlobals.gameVars.BGMIndex = 0;
  }
}
//clear the BGM values id there's no expansion pak
void clear_music_no_expPak(){
  if (((!gExpPakFlag) && (gGlobals.gameVars.Borg12Next)) &&
      (gGlobals.gameVars.Borg12Next != gGlobals.gameVars.Borg12Next2)) {
    clear_music_values(false);
  }
}
//update and play the next BGM in Queue
void update_BGM_(){
  if (gGlobals.gameVars.Borg12Next) {
    if (gGlobals.gameVars.Borg12Next != gGlobals.gameVars.Borg12Next2) {
      clear_music_values(0);
      if (0 < gGlobals.gameVars.Borg12Next) {
        gGlobals.gameVars.BGM = load_borg_12(gGlobals.gameVars.Borg12Next);
        DCM::Add(&gGlobals.gameVars.BGMIndex,&gGlobals.gameVars.BGMID,
             &(gGlobals.gameVars.BGM)->dat->sub,gGlobals.VolBGM * 255.0f,0x80,1,-1,0);
      }
    }
    gGlobals.gameVars.Borg12Next2 = gGlobals.gameVars.Borg12Next;
    gGlobals.gameVars.Borg12Next = 0;
  }
  if (gGlobals.gameVars.BGM) DCM::Start(gGlobals.gameVars.BGMIndex,gGlobals.gameVars.BGMID,gGlobals.VolBGM * 255.0f);
}

void FreeZoneEngine(s16 playMusic){
  Process_queue_B(&gGlobals.QueueB,1);
  if (gGlobals.gameVars.zoneEngineInit == 0) {CRASH("FreeZoneEngine","Zone Engine Not Initialized");}
  gGlobals.gameVars.zoneEngineInit = 0;
  if (!playMusic) clear_music_values(true);
  Particle::FreeEmmiters(&gGlobals.gameVars.particleHead);
  Weather::Free(&gGlobals.gameVars.weather);
  zonedat_clear_all();
  FreeScriptCameras(&gGlobals.scriptcamera);
  clear_some_playerHandler_field();
  FreePlayerHandler();
  dynamic_lights_free_all(&gGlobals.gameVars.DynamicLights);
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

void VoxelIndexPosition(s16 delta,playerData *param_2){
  Borg9Data *pBVar6;
  u32 uVar7;
  voxelObject *pvVar10;
  pvVar10 = voxel_index_pointer;
  if (voxel_index) {
    pBVar6 = GetCollisionZone(param_2->zoneDatByte);
    char labels[][24] ={
      "VOBJECT_SCENE",
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
    uVar7 = (u32)voxel_index_timer;
    voxel_index_timer = (u16)(uVar7 - (int)delta);
    pvVar10 = voxel_index_pointer;
    if ((int)((uVar7 - (int)delta) * 0x10000) < 1) {
      ClearVoxelFlags(pBVar6);
      uVar7 = (voxel_index_number + 1) % (u32)pBVar6->voxelObjCount;
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
        gCamera.aim.x = (voxel_index_pointer->header).pos.x;
        gCamera.aim.y = (voxel_index_pointer->header).pos.y;
        gCamera.aim.z = (voxel_index_pointer->header).pos.z;
        gCamera.pos.x = (voxel_index_pointer->header).pos.x + 2.0;
        gCamera.pos.y = (voxel_index_pointer->header).pos.y + 7.0;
        gCamera.pos.z = (voxel_index_pointer->header).pos.z + 2.0;
        gCamera.posTarget.x = gCamera.pos.x;
        gCamera.posTarget.y = gCamera.pos.y;
        gCamera.posTarget.z = gCamera.pos.z;
        gCamera.aimTarget.x = gCamera.aim.x;
        gCamera.aimTarget.y = gCamera.aim.y;
        gCamera.aimTarget.z = gCamera.aim.z;
      }
    }
  }
  voxel_index_pointer = pvVar10;
}
#endif

void handleZoneEngineFrame(Gfx **GG,s16 delta,playerData *player){
  u8 bVar1;
  mapFloatDat *A;
  byte bVar2;
  u32 uVar3;
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
  if (player) ConfirmPlayerWithinZone(player,gGlobals.gameVars.borg9DatPointer);
  if (gGlobals.screenFadeMode == 0) update_BGM_();
  if ((gGlobals.gameVars.refObjPointer != NULL) && (gGlobals.screenFadeMode == 0)) {
    #ifndef DEBUGVER
    bVar1=false;
    #endif
    if (gGlobals.gameVars.tpVec3 == NULL) {
      gGlobals.screenFadeMode = 2;
      gGlobals.screenFadeSpeed = 0.06666667f;
    }
    #ifndef DEBUGVER
    if (gGlobals.gameVars.mapDatA == 0) bVar1 = (gGlobals.gameVars.refObjPointer->teleport.MapDatA == 0);
    Gsprintf("pZ->map: %d\npT->map: %d\ndoReset: %d - %d\n"(int)gGlobals.gameVars.mapDatA,
                (uint)((gGlobals.gameVars.refObjPointer)->teleport).MapDatA,uVar3,0);
    N64PRINT();
    #endif
    TeleportPlayer(player,gGlobals.gameVars.refObjPointer,gGlobals.gameVars.tpVec3);
    gGlobals.gameVars.refObjPointer = NULL;
    gGlobals.gameVars.tpVec3 = NULL;
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
     (uVar3 = (u32)gPlayerRenderTimer, gPlayerRenderTimer = (u16)(uVar3 - iVar4),
     (int)((uVar3 - iVar4) * 0x10000) < 0)) gPlayerRenderTimer = 0;
  if (gGlobals.gameVars.gamemodeType != 2) {
    Gsprintf("ProcessPlayers");
    ProcessPlayers(&PHANDLE,delta);
    Gsprintf("The crash was not in ProcessPlayers");
  }
  if ((player) && (gGlobals.gameVars.gamemodeType == GameMode_Trek)) {
    Gsprintf("SaveZoneEngine");
    uVar3 = (u32)gGlobals.gameVars.unkTimer;
    gGlobals.gameVars.unkTimer = (u16)(uVar3 - iVar4);
    if ((int)((uVar3 - iVar4) * 0x10000) < 1) {
      bVar1 = true;
      position = &(player->collision).pos;
      gGlobals.gameVars.unkTimer = 120;
      A = FUN_8000cae8(position,gGlobals.gameVars.mapShort1,gGlobals.gameVars.mapShort2,gGlobals.gameVars.mapDatA,1);
      if ((A != NULL) &&(Vec3Dist(&A->playerVec3,position) < 10.0f)) {
        bVar1 = false;
      }
      if (bVar1) {SaveEngineZone(player,(mapFloatDat *)
                              ((int)&gGlobals +
                              ((u32)gGlobals.gameVars.unkCounter * 0xc - (u32)gGlobals.gameVars.unkCounter)
                              * 4 + 0x1058));
        gGlobals.gameVars.unkCounter =(gGlobals.gameVars.unkCounter + 1) +((gGlobals.gameVars.unkCounter + 1) / 0xf) * -0xf;
      }
    }
  }
  if (gGlobals.gameVars.gamemodeType != GameMode_Title)
    ProcessScriptCamera(&gGlobals.scriptcamera,(float)delta);
  if (Vec3Dist(&gCamera.pos,&gCamera.aim)< 0.05)
    CRASH("SceneSetCameraLookAt","Focus, and Camera at same Spot!");
  DEBUGSprintf("SceneSetCameraLookAt\n");
  SceneSetCameraLookAt(MAPCENTER.sceneDat0x4,gCamera.pos.x,
             gCamera.pos.y,gCamera.pos.z,gCamera.aim.x,
             gCamera.aim.y,gCamera.aim.z);
  if (gGlobals.gameVars.gamemodeType != GameMode_Title) G = Sky::RenderSky(G,delta);
  if (gGlobals.sky.Type == SkyTypeOutdoor) {
    DEBUGSprintf("RenderSkyObjects/RenderClouds");
    G = Skyobjects::Render(G);
    G = Clouds::Render(G);
  }
  Gsprintf("RenderZones");
  if (!player) RenderZones(&G,&gCamera.aim,delta);
  else RenderZones(&G,&(player->collision).pos,delta);
  if (gGlobals.gameVars.gamemodeType != GameMode_Title) {
    DEBUGSprintf("RenderPlayers");
    G = renderPlayers(&PHANDLE,G,delta,0,0);
  }
  Gsprintf("RenderTransZones");
  renderTransZones_(&G);
  RenderTransZones__(&G);
  DEBUGSprintf("ProcessAndRenderParticleHead");
  gGlobals.text[0] = '\0';
  if (gGlobals.gameVars.gamemodeType != GameMode_Title) {
    Particle::ProcessAndRenderParticleHead(&G,&gGlobals.gameVars.particleHead,&gCamera.rotation,delta,
                                 Graphics::GetBufferChoice(),1);
  }
  DEBUGSprintf("ProcessAudioBubbles");
  if (player) ProcessAudioBubbles(&gGlobals.SFXStruct,&(player->collision).pos,delta);
  DEBUGSprintf("ProcessWeather");
  Weather::ProcessWeather(&gGlobals.gameVars.weather,delta);
  DymanicLightTimers(&gGlobals.gameVars.DynamicLights,delta);
  Gsprintf("End Zone Engine Frame");
  *GG = G;
}