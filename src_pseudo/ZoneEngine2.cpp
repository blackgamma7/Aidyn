bool func_8000c9e0(void){
  ushort uVar3;
  u32 uVar1;
  uint uVar2;
  bool bVar4;
  double dVar5;
  float fVar6;
  
  uVar3 = get_obj_free();
  uVar1 = get_MemFree();
  dVar5 = (double)uVar1;
  if ((int)uVar1 < 0) {dVar5 += UINT_MAX_d;}
  fVar6 = (float)dVar5;
  uVar2 = get_memFree_2();
  dVar5 = (double)uVar2;
  if ((int)uVar2 < 0) {dVar5+= UINT_MAX_d;}
  if (DAT_800e8dbe != 0) {DAT_800e8dbe--;}
  bVar4 = false;
  if ((ExpPakFlag == 0) && (bVar4 = false, DAT_800e8dbe == 0)) {
    if (uVar3 < 0x29) {bVar4 = false;}
    else {
      if (163840.0f < fVar6) {
        if ((float)dVar5 < 98304.0f) {
          DAT_800e8dbe = 0xb4;
          doubleGlobalTickerFlag = 2;
          noop_800969a4();
          func_80018c38();
          bVar4 = true;
        }
        else {bVar4 = false;}
      }
      else {bVar4 = false;}
    }
  }
  return bVar4;
}

mapFloatDat * func_8000cae8(vec3 *position,short mapshortA,short mapShortB,short param_4,short param_5){
  short sVar1;
  bool bVar2;
  int iVar3;
  mapFloatDat *pmVar4;
  uint uVar5;
  mapFloatDat *pmVar6;
  float fVar7;
  ulonglong uVar8;
  vec3 afStack232;
  vec3 pvec3;
  vec3 fStack104;
  
  pmVar6 = (mapFloatDat *)0x0;
  uVar8 = 0;
  if (param_5 != 0) {uVar8 = (ulonglong)(uint)100000.0f;}
  uVar5 = 0;
  setVec3((vec3 *)afStack232,(*position)[0] + (float)(mapshortA * 100),(*position)[1],
  (*position)[2] + (float)(mapShortB * 100));
  iVar3 = 0;
  do {
    pmVar4 = (gGlobals.Sub.MapFloatDats[uVar5][iVar3];
    if ((int)param_4 ==*(short *)(gGlobals.Sub.MapFloatDats[0].cameraVec3 + uVar5 * 3 + iVar3 * 4 + 4)) {
      memset(fStack104,0,0xc);
      sVar1 = *(short *)(gGlobals.Sub.MapFloatDats[0].cameraVec3 + uVar5 * 3 + iVar3 * 4 + 3);
      pvec3[0] = pmVar4->playerVec3[0] + (float)((sVar1 * 0x18 + (int)sVar1) * 4);
      sVar1 = *(short *)((int)gGlobals.Sub.MapFloatDats[0].cameraVec3 +
                        iVar3 * 0x10 + uVar5 * 0xc + 0xe);
      pvec3[1] = gGlobals.Sub.MapFloatDats[0].playerVec3[uVar5 * 3 + iVar3 * 4 + 1];
      pvec3[2] = gGlobals.Sub.MapFloatDats[0].playerVec3[uVar5 * 3 + iVar3 * 4 + 2] +
                 (float)((sVar1 * 0x18 + (int)sVar1) * 4);
      fStack104[0] = pvec3[0];
      fStack104[1] = pvec3[1];
      fStack104[2] = pvec3[2];
      fVar7 = get_vec3_proximity((vec3 *)afStack232,(vec3 *)pvec3);
      bVar2 = (float)uVar8 < fVar7;
      if (param_5 == 0) {bVar2 = fVar7 < (float)uVar8;}
      if (!bVar2) {
        uVar8 = (ulonglong)(uint)fVar7;
        pmVar6 = pmVar4;
      }
    }
    uVar5++;
    iVar3 = uVar5 << 1;
  } while (uVar5 < 0xf);
  return pmVar6;
}

bool func_8000ccc0(void){
  ushort uVar3;
  u32 uVar1;
  uint uVar2;
  float fVar4;
  double dVar5;
  float fVar6;
  
  uVar3 = get_obj_free();
  dVar5 = (double)get_MemFree();
  if ((int)uVar1 < 0) {dVar5+= UINT_MAX_d;}
  fVar6 = (float)dVar5;
  uVar2 = get_memFree_2();
  if ((int)uVar2 < 0) {fVar4 = (float)((double)uVar2 + UINT_MAX_d);}
  else {fVar4 = (float)uVar2;}
  if (DAT_800e8dc4 == 0) {
    if (DAT_800e8dc6) {DAT_800e8dc6--;}
    if (ExpPakFlag) {return false;}
    if (DAT_800e8dc6) {return false;}
    if ((((gGlobals.Sub.mapDatA == 0) && (0x28 < uVar3)) &&
        ((double)(fVar4 / fVar6) < 0.5d)) || (no_ExpPak_memcheck_flag != 0)) {
      no_ExpPak_memcheck_flag = 0;
      no_TP_vec3 = 1;
      DAT_800e8dc6 = 0xb4;
      doubleGlobalTickerFlag = 2;
      return true;
    }
  }
  else {DAT_800e8dc4--;}
  return false;
}

bool NoExpPak_memCheck(u16 x){
  bool bVar3;
  uint theshA [5] = {0x18000,0x10000,0xc000,0x28000,0x18000};
  uint threshB [5]= {0x10000,0xC000,0x6000,0x18000,0x10000};
  if (ExpPakFlag == 0) {
    bVar3 = true;
    if (get_MemFree() <= theshA[x]) {
      if (threshB[x] < get_memFree_2()) {bVar3 = true;}
      else {
        no_ExpPak_memcheck_flag = 1;
        bVar3 = false;
      }
    }
  }
  else {bVar3 = true;}
  return bVar3;
}

void zoneengine_func_b(void){
  float (*x) [10];
  float (*x_00) [7];
  void *(*x_01) [3];
  uint uVar2;
  bool BOOL_ARRAY_ARRAY_800e8dcc[25][2]={{0,0},{1,0},{1,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},
   {0,0},{0,0},{0,0},{0,0},{0,1},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}};

  gGlobals.Sub.zoneEnginePtr1 = (float (*) [10])Malloc(0x50,FILENAME,0x1c8);
  gGlobals.Sub.zoneEnginePtr2 = (float (*) [7])Malloc(0x38,FILENAME,0x1c9);
  gGlobals.Sub.zoneEnginePtr0 = (void *(*) [3])Malloc(0x138,FILENAME,0x1ca);
  uVar2 = 0;
  do {
    x = gGlobals.Sub.zoneEnginePtr1[uVar2];
    memset(x,0,0x28);
    if (uVar2 == 0) {
      (*x)[0] = 0.0;
      (*x)[1] = 0.0;
    }
    else {
      if (uVar2 == 1) {
        (*x)[0] = 0.0;
        (*x)[1] = (float)1.0f;
      }
    }
    uVar2++;
  } while (uVar2 < 2);
  uVar2 = 0;
  do {
    x_00 = gGlobals.Sub.zoneEnginePtr2[uVar2];
    memset(x_00,0,0x1c);
    if (uVar2 == 0) {
      (*x_00)[6] = 1.0f;
      (*x_00)[1] = -0.06f;
    }
    else {
      if (uVar2 == 1) {
        (*x_00)[6] = 0.5f;
        (*x_00)[1] = -0.0015f;
      }
    }
    uVar2++;
  } while (uVar2 < 2);
  uVar2 = 0;
  do {
    x_01 = gGlobals.Sub.zoneEnginePtr0[uVar2];
    memset(x_01,0,0xc);
    (*x_01)[1] = gGlobals.Sub.zoneEnginePtr1[BOOL_ARRAY_ARRAY_800e8dcc[uVar2][0]];
    uVar2++;
    (*x_01)[0] = gGlobals.Sub.zoneEnginePtr2[BOOL_ARRAY_ARRAY_800e8dcc[uVar2][1]];
  } while (uVar2 < 0x1a);
  return;
}


void zoneEnginefree_2(void){
  Free(gGlobals.Sub.zoneEnginePtr1,FILENAME,0x22e);
  Free(gGlobals.Sub.zoneEnginePtr2,FILENAME,0x22f);
  Free(gGlobals.Sub.zoneEnginePtr0,FILENAME,0x230);
  gGlobals.Sub.zoneEnginePtr0 = (void *(*) [3])0x0;
  gGlobals.Sub.zoneEnginePtr1 = (float (*) [10])0x0;
  gGlobals.Sub.zoneEnginePtr2 = (float (*) [7])0x0;
}

void attachPhysicsProperties(Borg_9_data *param_1){
  ushort uVar1;
  ushort uVar2;
  ushort uVar3;
  borg9_phys *puVar4;
  uint uVar4;
  
  uVar4 = 0;
  if (param_1->borghpys_count != 0) {
    do {
      puVar4 = param_1->phys_pointer + uVar4;
      uVar1 = *(ushort *)((int)&puVar4->ptr_0x18 + 2);
      if (0x19 < uVar1) {
        sprintf(gGlobals.text,"Invalid Physics Property: %d\n",uVar1);
        assert("AttachPhysicsProperties",gGlobals.text);
      }
      uVar2 = puVar4->short0x1e;
      uVar3 = uVar2 & 0xf000;
      if (uVar3 == 0x1000) {
        uVar3 = puVar4->short0x1c;
        uVar2 = (ushort)((uVar2 + 1 & 0x7f) << 5) | 0x1000 | uVar1 & 0x1f;
LAB_8000d2c4:
        puVar4->short0x1e = uVar2;
        puVar4->short0x1c = uVar3 | 0x1000;
      }
      else {
        if (uVar3 < 0x1001) {
          if ((uVar2 & 0xf000) != 0) {
            uVar1 = puVar4->short0x1e;
LAB_8000d25c:
            sprintf(gGlobals.text,"Unknown attach: %04x\n",uVar1);
            assert("AttachPhysicsProperties",gGlobals.text);
          }
LAB_8000d2bc:
          uVar3 = puVar4->short0x1c;
          uVar2 = uVar1 | 0x3000;
          goto LAB_8000d2c4;
        }
        if (uVar3 == 0x2000) {
          uVar3 = puVar4->short0x1c;
          uVar2 = (ushort)((uVar2 & 0x7f) << 5) | 0x2000 | uVar1 & 0x1f;
          goto LAB_8000d2c4;
        }
        if (uVar3 != 0x4000) {
          uVar1 = puVar4->short0x1e;
          goto LAB_8000d25c;
        }
        if (ExpPakFlag) goto LAB_8000d2bc;
        puVar4->short0x1c = 1;
        puVar4->short0x1e = 0;
      }
      uVar4++;
      uVar2 = param_1->borghpys_count;
      puVar4->ptr_0x18 = (undefined *)gGlobals.Sub.zoneEnginePtr0[uVar1];
    } while (uVar4 < uVar2);
  }
  return;
}
Borg_9_data * GetCollisionZone(byte x){
  Borg_9_header **ppBVar1;
  
  ppBVar1 = &gGlobals.Sub.ZoneDatMtx[x >> 4][x & 3].mapPointer;
  if (*ppBVar1 != NULL) {return &(*ppBVar1)->dat;}
  assert("GetCollisionZone","No Zone at Grid");
}

void set_teleport_pointer(teleport_obj *param_1){
  if (((gGlobals.screenFadeMode == 0) && (0.0 < gGlobals.screenfadeFloat)) ||
     (gGlobals.ticker - initZoneTimestamp < 3)) {
    gGlobals.screenFadeMode = 1;
    gGlobals.screenFadeSpeed = 0.06666667f;
  }
  gGlobals.Sub.refObjPointer = param_1;
  gGlobals.Sub.unk0xf00 = (vec3 *)0x0;
}

void set_teleport_obj_A(u16 param_1,ushort param_2,ushort param_3,vec3 *param_4){
  gGlobals.Sub.refObjPointer = &bss_tele_obj;
  gGlobals.Sub.unk0xf00 = (vec3 *)vec3_800f5210;
  copyVec3(param_4,(vec3 *)vec3_800f5210);
  memset(&bss_tele_obj,0,0x6c);
  bss_tele_obj.header.type = Teleporter;
  bss_tele_obj.dat.MapDatA = param_1;
  bss_tele_obj.dat.MapShort1 = param_2;
  bss_tele_obj.dat.MapShort2 = param_3;
}

void set_teleport_obj_loadgame(u16 param_1,ushort param_2,ushort param_3,vec3 *param_4){
  gGlobals.Sub.refObjPointer = &loadgame_tp_obj;
  gGlobals.Sub.unk0xf00 = (vec3 *)0x0;
  memset(&loadgame_tp_obj,0,0x6c);
  loadgame_tp_obj.header.type = Teleporter;
  loadgame_tp_obj.dat.unk0x6 = 0x7ff8;
  loadgame_tp_obj.dat.MapDatA = param_1;
  loadgame_tp_obj.dat.MapShort1 = param_2;
  loadgame_tp_obj.dat.MapShort2 = param_3;
  copyVec3(param_4,(vec3 *)&loadgame_tp_obj);
}


void check_trigger(collisionStruct *param_1,borg9_phys *param_2){
  Vobject VVar1;
  playerData *ppVar2;
  ushort uVar4;
  playerData *ppVar5;
  ref_obj *ptVar6;
  
  ppVar2 = (playerData *)param_1[1].radius;
  ppVar5 = NULL;
  if (ppVar2 != NULL) {
    uVar4 = param_2->short0x1e & 0x1f;
    ppVar2->Ground_type = uVar4;
    ppVar5 = ppVar2;
    if (uVar4 < 0x1a) {
      if (uVar4 < 0xe) {
        uVar4 = param_2->short0x1e;
        goto LAB_8000d5bc;
      }
      if (ppVar2->alaron_flag) {DAT_800e8da0 = 0x14;}
    }
  }
  uVar4 = param_2->short0x1e;
LAB_8000d5bc:
  if (((((uVar4 & 0xf000) == 0x2000) && ((param_1->flags & 0x400) == 0)) &&
      (gGlobals.playerCharStruct.camping_var == '\x03')) &&
     ((some_toggle == -1 &&
      (ptVar6 = (ref_obj *)((gGlobals.Sub.borg9DatPointer)->ref_objs + (uVar4 >> 5 & 0x7f)),
      ((ptVar6->header).Bitfeild & visible) != 0)))) {
    VVar1 = (ptVar6->header).type;
    if (VVar1 == Camera) {
      set_camera_voxel_pointer((camera_obj *)ptVar6,param_1->position);
    }
    else {
      if (VVar1 < Dialouge) {
        if (VVar1 == Teleporter) {
          set_teleport_pointer((teleport_obj *)ptVar6);
          return;
        }
      }
      else {
        if (VVar1 == Dialouge) {
          if (dialoug_obj_func(ptVar6,ppVar5) == 0) {return;}
          dialouge_vobject_func((Dialoug_obj *)ptVar6,0,0xff);
          return;
        }
      }
      sprintf(gGlobals.text,"Invalid Trigger Type: %d\n",VVar1);
      debug_queue(gGlobals.text);
    }
  }
  return;
}

void init_some_map_data(ZoneDat *param_1,short param_2,char param_3){
  memset(param_1,0,0x20);
  param_1->unk0x1e = 7;
  param_1->mapshortSum = (char)((int)param_2 << 4) + param_3;
  return;
}

void func_8000d744(void){
  int iVar1;
  ZoneDat (*paZVar2) [3];
  int iVar3;
  int iVar4;
  
  iVar4 = 0;
  do {
    iVar1 = 0;
    paZVar2 = gGlobals.Sub.ZoneDatMtx[iVar4];
    iVar3 = 0x10000;
    do {
      init_some_map_data((ZoneDat *)paZVar2,(short)iVar4,(char)iVar1);
      iVar1 = iVar3 >> 0x10;
      paZVar2 = (ZoneDat (*) [3])(*paZVar2 + 1);
      iVar3 = iVar3 + 0x10000;
    } while (iVar1 < 3);
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 3);
  return;
}

void Zonedat_clear(ZoneDat *param_1,short param_2,short param_3){
  ushort uVar1;
  Borg_9_header *pBVar2;
  Borg_9_header *pBVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  Scene_obj *pVVar8;
  Borg_7_header **ppBVar8;
  
  pBVar2 = param_1->mapPointer;
  if ((param_1->anidat0x4 != NULL) && (param_2 != 0)) {
    AllocFreeQueueItem(&gGlobals.QueueA,&param_1->anidat0x4,1,0);
    param_1->unk0x1e |= 1;
  }
  if (param_1->aniDat0x14 == NULL) {}
  else {
    if (param_2 != 0) {
      AllocFreeQueueItem(&gGlobals.QueueA,&param_1->aniDat0x14,1,0);
      param_1->unk0x1e |= 2;
    }
  }
  if (param_1->mapPointer != NULL) {
    if (param_3 == 0) {
      func_80012a24(&gGlobals.wander,param_1->MapTally);
      clear_sfx_on_map(&gGlobals.SFXStruct,param_1->MapTally);
    }
    uVar6 = 0;
    if ((pBVar2->dat).ref_obj_count != 0) {
      iVar4 = 0;
      do {
        pVVar8 = (Scene_obj *)((int)(pBVar2->dat).ref_objs + (iVar4 * 4 + uVar6 * -5) * 4);
        if (((pVVar8->header).type == Scene) && (uVar7 = 0, (pVVar8->dat).unk0x40 != 0)) {
          ppBVar8 = &(pVVar8->dat).unk0x8;
          iVar4 = 0;
          do {
            iVar5 = iVar4 + uVar7;
            if (ppBVar8[iVar5] != (Borg_7_header *)0x0) {
              if (((pVVar8->dat).unk0x42 & 2) == 0) {
                AllocFreeQueueItem(&gGlobals.QueueA,(pVVar8->dat).unk0x34 + iVar5 + -0xb,1,0);
              }
              else {
                AllocFreeQueueItem(&gGlobals.QueueA,(pVVar8->dat).unk0x34 + iVar5 + -0xb,0,0);
              }
              ppBVar8[iVar4 + uVar7] = (Borg_7_header *)0x0;
            }
            uVar7++;
            iVar4 = uVar7 << 1;
          } while (uVar7 < (pVVar8->dat).unk0x40);
        }
        uVar6++;
        iVar4 = uVar6 << 3;
      } while (uVar6 < (pBVar2->dat).ref_obj_count);
    }
    if (param_3 != 0) {
      return;
    }
    remove_borg_9(param_1->mapPointer);
    param_1->mapPointer = NULL;
  }
  if (param_3 == 0) {
    param_1->unk_0x0 = 0;
    param_1->borg9_id = 0;
    param_1->borg5_ID = 0;
  }
  return;
}

void ofunc_zoneengine_free(void){
  int iVar1;
  ZoneDat (*paZVar2) [3];
  int iVar3;
  int iVar4;
  int iVar5;
  
  iVar4 = 0;
  iVar5 = 1;
  do {
    paZVar2 = gGlobals.Sub.ZoneDatMtx[iVar4];
    iVar3 = 0x10000;
    do {
      Zonedat_clear((ZoneDat *)paZVar2,1,0);
      iVar1 = iVar3 >> 0x10;
      paZVar2 = (ZoneDat (*) [3])(*paZVar2 + 1);
      iVar3 = iVar3 + 0x10000;
    } while (iVar1 < 3);
    Free(gGlobals.Sub.ZoneDatMtx[iVar4],FILENAME,0x40a);
    iVar4 = (int)(short)iVar5;
    iVar5 = iVar4 + 1;
  } while (iVar4 < 3);
  Free(&gGlobals.Sub,FILENAME,0x40c);
  return;
}

void move_zonedat(ZoneDat *param_1,ZoneDat *param_2){
  int iVar4;
  int iVar5;
  ZoneDat *x;
  int iVar6;
  int iVar7;
  
  if (param_2->unk_0x0 != 0) {
    iVar6 = 0;
    iVar7 = 0x10000;
    do {
      x = param_1[iVar4];
      iVar5 = 0x10000;
      do {
        if ((x->unk_0x0 == param_2->unk_0x0) && (x->borg9_id == param_2->borg9_id)) {
          param_2->anidat0x4 = x->anidat0x4;
          param_2->mapPointer = x->mapPointer;
          param_2->aniDat0x14 = x->aniDat0x14;
          param_2->unk0x1c = x->unk0x1c;
          param_2->unk0x1e = 3;
          param_2->MapTally = x->MapTally;
          memset(x,0,0x20);
          return;
        }
        iVar4 = iVar5 >> 0x10;
        x++;
        iVar5 = iVar5 + 0x10000;
      } while (iVar4 < 3);
      iVar5 = iVar7 >> 0x10;
      iVar6 = iVar6 + 0x60;
      iVar7 = iVar7 + 0x10000;
    } while (iVar5 < 3);
  }
  return;
}

void checkToggleZoneScene(ZoneDat *param_1){
  if (param_1->anidat0x4 == NULL) {
    if (param_1->unk_0x0 == 0xea9) {
      if (getEventFlag(0x1399)) {param_1->unk_0x0 = 0x35ba;}
    }
    else {
      if ((param_1->unk_0x0 == 0x11f9) && (getEventFlag(0x1399))) {param_1->unk_0x0 = 0x35af;}
    }
    return;
  }
  assert("CheckToggleZoneScene","Scene already loaded!!\n");
}

void MakeGameZoneNames(ushort param_1,ushort param_2){
  ushort uVar1;
  ushort uVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  ZoneDat *pZVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  uint uVar10;
  
  uVar5 = SEXT24((short)param_1);
  uVar10 = SEXT24((short)param_2);
  if (((uVar5 & 0xffff) < 0x17) &&
     (iVar8 = 0, uVar1 = param_1, uVar2 = param_2, (uVar10 & 0xffff) < 0x1f)) {
    do {
      gGlobals.Sub.mapShort2 = uVar2;
      gGlobals.Sub.mapShort1 = uVar1;
      iVar4 = 0;
      iVar7 = uVar10 - 1;
      iVar3 = (int)((uVar5 + iVar8 + -1) * 0x10000) >> 0x10;
      iVar9 = 0x10000;
      do {
        pZVar6 = (ZoneDat *)(iVar8 * 0x60 + iVar4 * 0x20 + -0x7ff19678);
        init_some_map_data(pZVar6,(short)iVar8,(char)iVar4);
        iVar4 = (int)(short)iVar7;
        if ((iVar3 - 1U < 0x15) && (iVar4 - 1U < 0x1d)) {
          pZVar6->unk_0x0 = (int)(short)map_index_matrix[iVar3][iVar4][0];
          pZVar6->borg9_id = (int)(short)map_index_matrix[iVar3][iVar4][1];
          pZVar6->borg5_ID = (int)(short)map_index_matrix[iVar3][iVar4][2];
          checkToggleZoneScene(pZVar6);
        }
        iVar4 = iVar9 >> 0x10;
        iVar7++
        iVar9 = iVar9 + 0x10000;
      } while (iVar4 < 3);
      iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
      uVar1 = gGlobals.Sub.mapShort1;
      uVar2 = gGlobals.Sub.mapShort2;
    } while (iVar8 < 3);
    return;
  }
  sprintf(gGlobals.text,"Zone out of Range\nZone: (%d, %d)\nRange: (%d, %d)",uVar5,uVar10);
  assert("MakeGameZoneNames",gGlobals.text);
}

void func_8000de18(AnimationData *param_1,char param_2){
  float x;
  float fVar1;
  
  if (param_1 == NULL) {return;}
  param_1->flags = 0;
  guMtxIdentF((float (*) [4] [4])param_1->matrixA);
  guMtxIdentF((float (*) [4] [4])param_1->matrixB);
  AniDat_Flags_OR_0x10(param_1);
  aniDat_flags_OR_0x100(param_1);
  AniDat_flags_OR_8(param_1);
  if (param_2 == 16) {AniDat_Flags_NAND_5(param_1);}
  else {func_800a7f64(param_1);}
  fVar1 = gGlobals.Sub.mapCellSize[1];
  switch(param_2) {
  case 0:
    x = -gGlobals.Sub.mapCellSize[0];
    fVar1 = -gGlobals.Sub.mapCellSize[1];
    break;
  case 1:
    fVar1 = -gGlobals.Sub.mapCellSize[0];
    goto LAB_8000df9c;
  case 2:
    x = -gGlobals.Sub.mapCellSize[0];
    break;
  default:
    goto LAB_8000dfcc;
  case 16:
    x = 0.0;
    fVar1 = -gGlobals.Sub.mapCellSize[1];
    break;
  case 17:
    fVar1 = 0.0;
    goto LAB_8000df9c;
  case 18:
    x = 0.0;
    break;
  case 32:
    x = gGlobals.Sub.mapCellSize[0];
    fVar1 = -gGlobals.Sub.mapCellSize[1];
    break;
  case 33:
    fVar1 = gGlobals.Sub.mapCellSize[0];
LAB_8000df9c:
    anidat_setMaxtrixA_3(param_1,fVar1,0,0);
    return;
  case 34:
    anidat_setMaxtrixA_3(param_1,gGlobals.Sub.mapCellSize[0],0,gGlobals.Sub.mapCellSize[1]);
    goto LAB_8000dfcc;
  }
  anidat_setMaxtrixA_3(param_1,x,0,fVar1);
LAB_8000dfcc:
  return;
}

void zonedat_clear_all(void){
  int iVar1;
  int iVar2;
  ZoneDat (*paZVar3) [3];
  int iVar4;
  
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
    iVar2 = (int)(short)iVar4;
    iVar4 = iVar2 + 1;
  } while (iVar2 < 3);
  return;
}

void FreeZoneEngineMemory(void){
  int iVar1;
  ZoneDat (*paZVar2) [3];
  int iVar3;
  ZoneDat (*paZVar4) [3];
  int iVar5;
  
  debug_queue("FreeZoneEngineMemory\n");
  DAT_800e8dc4 = 0x78;
  no_TP_vec3 = 1;
  if (FreeZoneEngineTimestamp == handeZoneEngineTimestamp)
   {assert("FreeZoneEngineMemory","HandleZoneEngineFrame AND\nFreeZoneEngineMemory called on\nthe same frame!");}
  iVar3 = 0;
  FreeZoneEngineTimestamp = gGlobals.ticker;
  do {
    iVar1 = 0;
    paZVar4 = gGlobals.Sub.ZoneDatMtx[iVar3];
    iVar5 = 0x10000;
    paZVar2 = paZVar4;
    do {
      if (iVar3 == iVar1) {Zonedat_clear(*paZVar4 + iVar3,0,1);}
      else {Zonedat_clear((ZoneDat *)paZVar2,1,1);}
      iVar1 = iVar5 >> 0x10;
      paZVar2 = (ZoneDat (*) [3])(*paZVar2 + 1);
      iVar5 = iVar5 + 0x10000;
    } while (iVar1 < 3);
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while (iVar3 < 3);
  noop_800969a4();
  func_80018c38();
}

void loading_map_data(ZoneDat *param_1){
  Borg_9_header *pBVar1;
  
  if ((param_1->mapPointer == NULL) && (param_1->borg9_id != 0)) {
    param_1->MapTally = gGlobals.maptally;
    gGlobals.maptally++;
    pBVar1 = get_borg_9(param_1->borg9_id);
    param_1->mapPointer = pBVar1;
    attachPhysicsProperties(&pBVar1->dat);
    render_ref_objs(&param_1->mapPointer->dat,param_1->mapshortSum);
    look_for_monsterparties(&gGlobals.wander,&param_1->mapPointer->dat,(playerData *)param_1->MapTally,param_1->mapshortSum);
    audio_ref_objs(&gGlobals.SFXStruct,&param_1->mapPointer->dat,param_1->MapTally,param_1->mapshortSum);
    if (ref_obj_boulder) {ref_obj_boulders(&param_1->mapPointer->dat);}
  }
  return;
}

void loadGameBorgScenes(float param_1,float param_2,undefined2 param_3,undefined2 param_4){
//Side note: making "ZoneDatMtx" a 3x3 matrix causes this error in Ghidra:
// Low-level Error: PTRSUB with non-zero offset into array type
//but only this func. It's fine elsewhere.

  undefined uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  int iVar9;
  uint uVar10;
  AnimationData *pAVar11;
  bool bVar12;
  int iVar13;
  short sVar14;
  undefined4 *puVar15;
  undefined4 *puVar16;
  int iVar17;
  ZoneDat *pZVar18;
  uint uVar19;
  uint uVar20;
  uint uVar21;
  int iVar22;
  AnimationData **ppAVar23;
  AnimationData **ppAVar24;
  ZoneDat aZStack432 [3] [3];
  ushort uStack112 [16]={0,0,1,0,2,0,0,1,2,1,0,2,1,2,2,2};
  uint uStack48;
  
  sVar14 = no_TP_vec3;
  no_TP_vec3 = 0;
  uStack48 = (uint)(sVar14 == 0);
  Process_queue_B(&gGlobals.QueueB,1);
  iVar17 = 0;
  iVar9 = 0x10000;
  do {
    puVar16 = (undefined4 *)((int)&gGlobals.Sub.ZoneDatMtx[0].unk_0x0 + iVar17);
    puVar15 = (undefined4 *)((int)&aZStack432[0].unk_0x0 + iVar17);
    iVar13 = 0x10000;
    do {
      uVar2 = *puVar16;
      uVar3 = puVar16[1];
      uVar4 = puVar16[2];
      uVar5 = puVar16[3];
      uVar6 = puVar16[4];
      uVar7 = puVar16[5];
      uVar1 = *(undefined *)(puVar16 + 7);
      uVar8 = puVar16[6];
      puVar16 = puVar16 + 8;
      iVar22 = iVar13 >> 0x10;
      *puVar15 = uVar2;
      puVar15[1] = uVar3;
      puVar15[2] = uVar4;
      puVar15[3] = uVar5;
      puVar15[4] = uVar6;
      puVar15[5] = uVar7;
      *(undefined *)(puVar15 + 7) = uVar1;
      puVar15[6] = uVar8;
      puVar15 = puVar15 + 8;
      iVar13 = iVar13 + 0x10000;
    } while (iVar22 < 3);
    iVar13 = iVar9 >> 0x10;
    iVar17 = iVar17 + 0x60;
    iVar9 = iVar9 + 0x10000;
  } while (iVar13 < 3);
  MakeGameZoneNames(param_3,param_4);
  iVar17 = 0;
  iVar9 = 0x10000;
  do {
    pZVar18 = (ZoneDat *)((int)&gGlobals.Sub.ZoneDatMtx[0].unk_0x0 + iVar17);
    iVar13 = 0x10000;
    do {
      move_zonedat((ZoneDat *)aZStack432,pZVar18);
      iVar22 = iVar13 >> 0x10;
      pZVar18 = pZVar18 + 1;
      iVar13 = iVar13 + 0x10000;
    } while (iVar22 < 3);
    iVar13 = iVar9 >> 0x10;
    iVar17 = iVar17 + 0x60;
    iVar9 = iVar9 + 0x10000;
  } while (iVar13 < 3);
  iVar17 = 0;
  iVar9 = 0;
  do {
    pZVar18 = aZStack432 + iVar9 + iVar17;
    iVar9 = 0x10000;
    do {
      Zonedat_clear(pZVar18,1,0);
      iVar13 = iVar9 >> 0x10;
      pZVar18 = (ZoneDat *)(&pZVar18->unk_0x0 + 8);
      iVar9 = iVar9 + 0x10000;
    } while (iVar13 < 3);
    iVar17 = (iVar17 + 1) * 0x10000 >> 0x10;
    iVar9 = iVar17 << 1;
  } while (iVar17 < 3);
  loading_map_data(gGlobals.Sub.ZoneDatMtx[1][1]);
  if ((gGlobals.Sub.ZoneDatMtx[1][1].unk_0x0 == 0) ||
     (uVar20 = 1, gGlobals.Sub.ZoneDatMtx[1][1].borg9_id == 0)) {
    sprintf("Center scene not in Borg.\nPlayer Pos: (%3.4f, %3.4f)\nNew Grid: %d-%c%02d",param_1,param_2);
    assert("LoadGameBorgScenes",gGlobals.text);
  }
  uVar19 = 0;
  uVar21 = (uint)((gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat).byte0x1a;
  uVar10 = uVar21 & 1;
  do {
    if (uVar10 != 0) {
      Zonedat_clear((ZoneDat *)
                    ((uint)uStack112[uVar19 * 2] * 0x60 + -0x7ff19678 +
                    (uint)uStack112[uVar19 * 2 + 1] * 0x20),1,0);
    }
    uVar20 = (uVar20 & 0x7f) << 1;
    uVar19++;
    uVar10 = uVar21 & uVar20;
  } while (uVar19 < 8);
  iVar9 = 0;
  do {
    iVar17 = 0;
    ppAVar24 = &gGlobals.Sub.ZoneDatMtx[iVar9 * 3].aniDat0x14;
    ppAVar23 = &gGlobals.Sub.ZoneDatMtx[iVar9 * 3].anidat0x4;
    pZVar18 = gGlobals.Sub.ZoneDatMtx + iVar9 * 3;
    do {
      if (pZVar18->unk_0x0 != 0) {
        if (pZVar18->anidat0x4 == ) {
          pZVar18->unk0x1c = 0xff;
          if (pZVar18->mapshortSum == 0x11) {
            pAVar11 = BorgAnimLoadScene(pZVar18->unk_0x0);
            pZVar18->anidat0x4 = pAVar11;
          }
          else {
            if (oneZone_load) {goto LAB_8000e6bc;}
            if (NoExpPak_memCheck(3)) {AllocAllocQueueItem(&gGlobals.QueueB,ppAVar23,0,pZVar18->unk_0x0,1,(char)uStack48);}
          }
        }
      }
LAB_8000e6bc:
      if ((pZVar18->borg5_ID != 0) && (pZVar18->aniDat0x14 == NULL)) {
        if (pZVar18->mapshortSum == 0x11) {
          pAVar11 = BorgAnimLoadScene(uVar20);
          pZVar18->aniDat0x14 = pAVar11;
        }
        else {
          if ((!oneZone_load) && (NoExpPak_memCheck(4))) {AllocAllocQueueItem(&gGlobals.QueueB,ppAVar24,0,pZVar18->borg5_ID,1,(char)uStack48);}
        }
      }
      loading_map_data(pZVar18);
      sVar14 = gGlobals.sky.BackgroundType;
      if (pZVar18->mapshortSum == 0x11) {
        gGlobals.Sub.borg9DatPointer = &pZVar18->mapPointer->dat;
        gGlobals.Sub.particleEmmiter.borg9dat = gGlobals.Sub.borg9DatPointer;
        GetMapTerrain(gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
        if ((gGlobals.sky.BackgroundType == 3) && (sVar14 == 3)) {
          if (gGlobals.Sub.weatherDat._0_4_ == 0) {SetBackgroundType(3,gGlobals.Sub.weatherDat.skyBgdat,600.0);}
          else {debug_queue("Different Precip types, Don't set sky\n");}
        }
        else {
          sVar14 = gGlobals.Sub.weatherDat.skyBgdat;
          if ((gGlobals.sky.BackgroundType == 3) &&
             (((short)gGlobals.Sub.weatherDat.rainShortA < 3 &&
              (0 < (short)gGlobals.Sub.weatherDat.rainShortA)))) {
            sVar14 = 2;
          }
          SetBackgroundType(gGlobals.sky.BackgroundType,sVar14,0.0);
          gGlobals.Sub.weatherDat.unk0xc = TerrainPointer->weatherFloatB;
        }
      }
      ppAVar24 = ppAVar24 + 8;
      ppAVar23 = ppAVar23 + 8;
      iVar17 = (iVar17 + 1) * 0x10000 >> 0x10;
      pZVar18 = pZVar18 + 1;
    } while (iVar17 < 3);
    iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
    if (2 < iVar9) {
      if (((gGlobals.Sub.gamemodeType == 0) && (gGlobals.minimap.active == 0)) &&
         (gGlobals.sky.BackgroundType == 3)) {
        set_map_event_flag(gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
      }
      return;
    }
  } while( true );
}

void add_player_position(vec3 *param_1,playerData *param_2){
  (param_2->collision).position[0] += (*param_1)[0];
  (param_2->collision).position[1] += (*param_1)[1];
  (param_2->collision).position[2] += (*param_1)[2];
  if ((param_2->flags & 1)) {GiveCameraToPlayer(param_2);}
  camera_add_vec3(&gGlobals.Sub.camera,param_1);
  func_8001b888(&gGlobals.Sub.particleEmmiter,param_1);
}

referncepoint_obj * FindReferncePoint(Borg_9_data *param_1,short param_2){
  int iVar1;
  referncepoint_obj *prVar2;
  uint uVar2;
  
  uVar2 = 0;
  if (param_1->ref_obj_count != 0) {
    iVar1 = 0;
    do {
      prVar2 = (referncepoint_obj *)((int)param_1->ref_objs + (iVar1 * 4 + uVar2 * -5) * 4);
      if (((prVar2->header).type == ReferencePoint) && (prVar2->refPoint_ID == param_2)) {return prVar2;}
      uVar2++;
      iVar1 = uVar2 << 3;
    } while (uVar2 < param_1->ref_obj_count);
  }
  return NULL;
}

referncepoint_obj * get_map_referencepoint(Borg_9_data *param_1,short param_2){
  int iVar1;
  referncepoint_obj *prVar2;
  uint uVar3;
  //Yup, duplicate func.
  uVar3 = 0;
  if (param_1->ref_obj_count != 0) {
    iVar1 = 0;
    do {
      prVar2 = (referncepoint_obj *)((int)param_1->ref_objs + (iVar1 * 4 + uVar3 * -5) * 4);
      if (((prVar2->header).type == ReferencePoint) && (prVar2->refPoint_ID == param_2)) {return prVar2;}
      uVar3++;
      iVar1 = uVar3 << 3;
    } while (uVar3 < param_1->ref_obj_count);
  }
  return NULL;
}

referncepoint_obj * FindReferncePointName(Borg_9_data *param_1,char *param_2,bool param_3)

{
  u16 uVar1;
  int iVar2;
  uint uVar3;
  char *pcVar4;
  uint uVar5;
  uint uVar6;
  referncepoint_obj *prVar7;
  
  uVar1 = strlen(param_2);
  uVar6 = 0;
  if (param_1->ref_obj_count != 0) {
    iVar2 = 0;
    do {
      prVar7 = (referncepoint_obj *)((int)param_1->ref_objs + (iVar2 * 4 + uVar6 * -5) * 4);
      if ((prVar7->header).type == ReferencePoint) {
        if (uVar1 == strlen(prVar7->name)) {
          uVar3 = 0;
          uVar5 = 0;
          pcVar4 = param_2;
          if (uVar1 != 0) {
            do {
              if (*pcVar4 == prVar7->name[uVar3]) {uVar5++;}
              uVar3++;
              pcVar4 = param_2 + uVar3;
            } while (uVar3 < uVar1);
          }
          if (uVar5 == uVar1) {return prVar7;}
        }
      }
      uVar6++;
      iVar2 = uVar6 << 3;
    } while (uVar6 < param_1->ref_obj_count);
  }
  if (param_3 == false) {return NULL;}
  assert("FindReferencePointName","Point Not Found");
}

uint get_zoneDatByte(short param_1,short param_2,uint param_3){
  uint uVar1;
  uint uVar2;
  uVar2 = ((param_3 & 0xff) >> 4) + ((uint)gGlobals.Sub.mapShort1 - (int)param_1) & 0xffff;
  uVar1 = (param_3 & 0xf) + ((uint)gGlobals.Sub.mapShort2 - (int)param_2) & 0xffff;
  if ((uVar2 < 3) && (uVar1 < 3)) {return (uVar2 << 4 | uVar1) & 0xff;}
  return 16;
}

void set_playerdata_zoneDatByte(undefined2 param_1,undefined2 param_2){
  int iVar3=0;
  playerData *iVar2;
  int iVar4;
  int iVar5;
  
  if (0 < gGlobals.Sub.PlayerHandler.max_player) {
    iVar5 = 0x10000;
    do {
      iVar2 = gGlobals.Sub.PlayerHandler.playerDats)[iVar3];
      if ((iVar2->removeFlag != 0) && (iVar2->visible_flag? == 0)) {
        iVar2->zoneDatByte = get_zoneDatByte(param_1,param_2,iVar2->zoneDatByte);
      }
      iVar3 = iVar5 >> 0x10;
      iVar5 = iVar5 + 0x10000;
    } while (iVar3 < gGlobals.Sub.PlayerHandler.max_player);
  }
  return;
}

void some_zoneDat_func(void){
  byte bVar1;
  int iVar2;
  AnimationData *pAVar3;
  int iVar4;
  Borg_9_header *pBVar5;
  ZoneDat (*iVar3) [3];
  int iVar6;
  
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
          func_8000de18(pAVar3,(*iVar3)[0].mapshortSum);
        }
        pAVar3 = (*iVar3)[0].aniDat0x14;
      }
      if (pAVar3 == NULL) {pBVar5 = (*iVar3)[0].mapPointer;}
      else {
        bVar1 = (*iVar3)[0].unk0x1e;
        if ((bVar1 & 2) != 0) {
          (*iVar3)[0].unk0x1e = bVar1 & 0xfd;
          func_8000de18(pAVar3,(*iVar3)[0].mapshortSum);
        }
        pBVar5 = (*iVar3)[0].mapPointer;
      }
      if ((pBVar5 != NULL) && (DAT_800e8dbc))
       {audio_ref_objs(&gGlobals.SFXStruct,&pBVar5->dat,(*iVar3)[0].MapTally,(*iVar3)[0].mapshortSum);}
      iVar2 = iVar4 >> 0x10;
      iVar3 = (ZoneDat (*) [3])(*iVar3 + 1);
      iVar4 = iVar4 + 0x10000;
    } while (iVar2 < 3);
    iVar4 = (int)(short)iVar6;
    iVar6++;
  } while (iVar4 < 3);
  DAT_800e8dbc = 0;
}


void TeleportPlayer(playerData *param_1,teleport_obj *param_2,vec3 *param_3,float param_4,float param_5){
  ushort uVar1;
  ushort uVar2;
  int iVar3;
  bool bVar4;
  int iVar6;
  referncepoint_obj *pfVar8;
  int iVar7;
  ushort uVar8;
  int iVar9;
  int iVar10;
  vec3 *from;
  float fVar11;
  vec3 fStack312;
  vec3 fStack248;
  vec3 fStack184;
  vec3 fStack120;
  referncepoint_obj *prStack56=NULL;
  
  uVar1 = (param_2->dat).unk0x6;
  uVar2 = (param_2->dat).refPoint_ID;
  iVar6 = (int)gGlobals.sky.BackgroundType;
  memset_voxelChart_entries();
  pfVar8 = NULL;
  clear_camera_voxel_pointer();
  bVar4 = false;
  set_playerdata_zoneDatByte((param_2->dat).MapShort1,(param_2->dat).MapShort2);
  set_SFX_ZoneDatByte(&gGlobals.SFXStruct,(param_2->dat).MapShort1,(param_2->dat).MapShort2);
  gGlobals.Sub.mapDatA = (param_2->dat).MapDatA;
  gGlobals.Sub.mapShort1 = (param_2->dat).MapShort1;
  gGlobals.Sub.mapShort2 = (param_2->dat).MapShort2;
  gGlobals.Sub.mapDatB = 0xffff;
  gGlobals.Sub.mapDatC = 0xffff;
  borgmaps_func(gGlobals.Sub.mapDatA,-1,-1,false);
  clear_music_no_expPak();
  if (param_3 == (vec3 *)0x0) {no_TP_vec3 = 1;}
  loadGameBorgScenes(param_4,param_5,(param_2->dat).MapShort1,(param_2->dat).MapShort2);
  if (param_3 == (vec3 *)0x0) {
    if (gGlobals.sky.BackgroundType == 4) {set_camera_mode(&gGlobals.Sub.camera,1);}
    if (gGlobals.sky.BackgroundType == 3) {set_camera_mode(&gGlobals.Sub.camera,0);}
    if (uVar1 == 0x7ff8) {
      fStack312[0] = (param_2->header).coords[0];
      fStack312[1] = (param_2->header).coords[1];
      fStack312[2] = (param_2->header).coords[2];
    }
    else {
      pfVar8 = FindReferncePoint(&(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat,uVar1);
      sprintf(gGlobals.text,"FindReferencePoint\nPoint Not Found: %d\n",uVar1);
      if (pfVar8 == NULL) {assert("TeleportPlayer",gGlobals.text);}
      fStack312[0] = (pfVar8->header).coords[0];
      fStack312[1] = (pfVar8->header).coords[1];
      fStack312[2] = (pfVar8->header).coords[2];
    }
    if (uVar2 != 0) {prStack56 = FindReferncePoint(&(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat,uVar2);}
    if (param_1 != NULL) {Vec3_sub((vec3 *)fStack312,(vec3 *)fStack312,(vec3 *)(param_1->collision).position);}
    fStack312[1] = 0.0;
    if (pfVar8 != NULL) {
      pfVar8->position[1] = 0.0;
      vec3_normalize((vec3 *)pfVar8->position);
      if (0.5d < (double)vec3Length((vec3 *)pfVar8->position)) 
        {setVec2((Vec2 *)param_1->facing,-pfVar8->position[0],-pfVar8->position[2]);}
    }
  }
  else {
    copyVec3(param_3,(vec3 *)fStack312);
    bVar4 = true;
  }
  if (param_1 != NULL) {
    add_player_position(fStack312);
    from = (vec3 *)(param_1->collision).position;
    copyVec3(from,(vec3 *)fStack312);
    if (pfVar8 == NULL) {fVar11 = (param_1->collision).position[1];}
    else {fVar11 = (pfVar8->header).coords[1];}
    if (!bVar4) {
      if (!func_800154e4(param_1,fVar11 - (param_1->collision).radius,1,0)) {func_800154e4(param_1,0,0,0);}
      gGlobals.Sub.weatherDat.unk0x14 = 0;
      func_800b2bc4(&gGlobals.Sub.particleEmmiter);
    }
    set_camera_0x70(&gGlobals.Sub.camera,from);
  }
  if (prStack56 == NULL) {
    if ((param_1 != NULL) && (param_3 == (vec3 *)0x0)) {
      if (gGlobals.sky.BackgroundType == 4) {
        fStack184[0] = (param_1->collision).position[0];
        fStack184[2] = (param_1->collision).position[2];
        fStack184[1] = (param_1->collision).position[1] + gGlobals.Sub.camera.camHeight;
        fStack248[0] = fStack184[0] - param_1->facing[0] * 4.0f;
        fStack248[1] = (param_1->collision).position[1] + 3.0f;
        fStack248[2] = fStack184[2] - param_1->facing[1] * 4.0f;
        camera_set_position(&gGlobals.Sub.camera,(vec3 *)fStack248);
        camera_set_aim(&gGlobals.Sub.camera,(vec3 *)fStack184);
      }
      else {
        fStack120[0] = (param_1->collision).position[0];
        fStack120[2] = (param_1->collision).position[2];
        fStack120[1] = (param_1->collision).position[1] + gGlobals.Sub.camera.camHeight;
        camera_set_aim(&gGlobals.Sub.camera,(vec3 *)fStack120);
        gGlobals.Sub.camera.XZ_orient[0] = param_1->facing[0];
        gGlobals.Sub.camera.XZ_orient[1] = param_1->facing[1];
        multiVec2((Vec2 *)gGlobals.Sub.camera.XZ_orient,-1.0);
        func_800b050c(&gGlobals.Sub.camera,(vec3 *)fStack120);
        camera_set_position(&gGlobals.Sub.camera,(vec3 *)fStack120);
      }
    }
  }
  else {camera_set_position(&gGlobals.Sub.camera,(vec3 *)prStack56);}
  gGlobals.Sub.camera.unk0x80 = 5;
  if ((param_3 == (vec3 *)0x0) || (pfVar8 != NULL)) {
    iVar9 = 0;
    iVar10 = 0x10000;
    do {
      iVar3 = iVar9 / 3;
      iVar7 = iVar9 % 3;
      iVar9 = iVar10 >> 0x10;
      (&gGlobals.Sub.ZoneDatMtx[iVar3 * 0x10000 >> 0x10][0].unk0x1c)[iVar7 * 0x10000 >> 0xb] =0xff;
      iVar10 = iVar10 + 0x10000;
    } while (iVar9 < 9);
  }
  if (iVar6 != gGlobals.sky.BackgroundType) {
    if (gGlobals.sky.BackgroundType == 4) {
      xor_sundail_moon(0);
      xor_sundail_sun(0);
    }
    else {
      xor_sundail_moon(1);
      xor_sundail_sun(1);
    }
  }
  if (gGlobals.minimap.active) {
    gGlobals.minimap.savedPlayerPos[0] =((gGlobals.playerCharStruct.playerDat)->collision).position[0];
    gGlobals.minimap.savedPlayerPos[1] =((gGlobals.playerCharStruct.playerDat)->collision).position[1];
    gGlobals.minimap.savedPlayerPos[2] =((gGlobals.playerCharStruct.playerDat)->collision).position[2];
    func_8005295c(&gGlobals.minimap,gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
  }
  return;
}

void ConfirmPlayerWithinZone(playerData *param_1)

{
  longlong lVar1;
  float *pfVar2;
  int iVar3;
  ushort uVar4;
  int iVar5;
  ushort uVar6;
  float fVar7;
  float fVar8;

  vec3 fStack80;
  
  pfVar2 = (param_1->collision).position;
  if (param_1->alaron_flag == false) {
    if (((param_1->collision).position[1] < -50.0f) ||
       ((double)(param_1->collision).velocity[1] < -0.3d)) {
      (param_1->collision).position[1] = 50.0f;
      setVec3((vec3 *)(param_1->collision).velocity,0.0,0.0,0.0);
      if (!func_800154e4(param_1,0.0,0.0,0.0);) {(param_1->collision).velocity[1] = -0.054f;}
      debug_queue("Where's the player??\n");
      return;
    }
    fVar8 = *pfVar2;
  }
  else {
    fVar8 = *pfVar2;
  }
  if ((((fVar8 < 0.0) || (fVar7 = (param_1->collision).position[2], fVar7 < 0.0)) ||
      (gGlobals.Sub.mapCellSize[0] < fVar8)) || (gGlobals.Sub.mapCellSize[1] < fVar7)) {
    iVar3 = (int)(short)gGlobals.Sub.mapShort1;
    iVar5 = (int)(short)gGlobals.Sub.mapShort2;
    fStack80[2] = 0.0;
    fStack80[1] = 0.0;
    fStack80[0] = 0.0;
    if (*pfVar2 < 0.0) {
      iVar3 = ((short)gGlobals.Sub.mapShort1 + -1) * 0x10000 >> 0x10;
      fStack80[0] = gGlobals.Sub.mapCellSize[0];
    }
    uVar4 = (ushort)iVar3;
    if (gGlobals.Sub.mapCellSize[0] < *pfVar2) {
      uVar4 = (ushort)((uint)((iVar3 + 1) * 0x10000) >> 0x10);
      fStack80[0] = -gGlobals.Sub.mapCellSize[0];
    }
    fVar8 = (param_1->collision).position[2];
    if (fVar8 < 0.0) {
      iVar5 = ((short)gGlobals.Sub.mapShort2 + -1) * 0x10000 >> 0x10;
      fStack80[2] = gGlobals.Sub.mapCellSize[1];
      fVar8 = (param_1->collision).position[2];
    }
    uVar6 = (ushort)iVar5;
    if (gGlobals.Sub.mapCellSize[1] < fVar8) {
      uVar6 = (ushort)((uint)((iVar5 + 1) * 0x10000) >> 0x10);
      fStack80[2] = -gGlobals.Sub.mapCellSize[1];
    }
    set_teleport_obj_A(gGlobals.Sub.mapDatA,uVar4,uVar6,(vec3 *)fStack80);
  }
  return;
}

AnimationData * load_borg_5_func(uint param_1){
  AnimationData *pAVar1= BorgAnimLoadScene(param_1);
  func_800a7f64(pAVar1);
  func_800a7ff4(pAVar1);
  aniDat_flags_OR_0x100(pAVar1);
  return pAVar1;
}

void set_anidat_colors(AnimationData *param_1,u8 param_2,char param_3,color param_4){
  float fVar1;
  color bStack216;
  color auStack88;
  
  func_800a7ff4(param_1);
  fVar1 = gGlobals.Sub.weatherDat.unk0xc;
  if (DAT_800ee974 != 0) {fVar1 = 0.0;}
  func_800a81cc(param_1,0x3e4 - (short)(int)(fVar1 * 40.0f),1000);
  set_Anidat_colorByte(param_1,gGlobals.sky.colors[2].R,gGlobals.sky.colors[2].G,gGlobals.sky.colors[2].B,gGlobals.sky.colors[2].A);
  if (param_3 != '\0') {
    if (param_4 != 0) {
      bStack216.R = gGlobals.sky.colors[0].R + (param_4 >> 0x18)) >> 1);
      bStack216.G = gGlobals.sky.colors[0].G + (param_4 >> 0x10 & 0xff)) >> 1);
      bStack216.B = gGlobals.sky.colors[0].B + (param_4 >> 8 & 0xff)) >> 1);
      tint_color_with_screenfade(&bStack216,gGlobals.screenfadeFloat);
      set_anidat_color(param_1,bStack216.R,bStack216.G,bStack216.B,param_2);
      return;
    }
    set_anidat_color(param_1,gGlobals.sky.colors[0].R,gGlobals.sky.colors[0].G,gGlobals.sky.colors[0].B,param_2);
  }
  if (param_4 != 0) {
    auStack88 = param_4;
    tint_color_with_screenfade(&auStack88,gGlobals.screenfadeFloat);
    set_anidat_color(param_1,auStack88.R,auStack88.G,auStack88.B,param_2);
  }
  return;
}

bool get_scene_obj_proximity(Vec2 *obj,Vec2 *cam,Vec2 *aim,float *outx,float *outy){
  float x;
  float fVar1;
  Vec2 afStack168;
  Vec2 afStack104;
  
  *outy = 0.0;
  *outx = 0.0;
  Vec2_Sub((Vec2 *)afStack104,aim,cam);
  Vec2_Sub((Vec2 *)afStack168,obj,cam);
  x = vec2_normalize((Vec2 *)afStack168);
  fVar1 = vec2_normalize((Vec2 *)afStack104);
  if (x <= fVar1) {
    multiVec2((Vec2 *)afStack104,x);
    vec2_sum(afStack168,cam,(Vec2 *)afStack104);
    *outx = get_vec2_proximity((Vec2 *)afStack168,obj);
    *outy = get_vec2_proximity((Vec2 *)afStack168,aim);
  }
  return x <= fVar1;
}

void ref_obj_boulders(Borg_9_data *param_1)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  Scene_obj *prVar6;
  uint uVar4;
  Scene_obj *iVar2;
  
  uVar3 = 0;
  if (param_1->ref_obj_count != 0) {
    iVar2 = (Scene_obj *)param_1->ref_objs;
    iVar1 = 0;
    do {
      prVar6 = (Scene_obj *)((int)iVar2 + (iVar1 * 4 + uVar3 * -5) * 4);
      if ((prVar6->header).type == Scene) {
        uVar2 = 0;
        uVar4 = (uint)(prVar6->dat).unk0x40;
        (prVar6->dat).unk0x42 = (prVar6->dat).unk0x42 & 0xfffd;
        if (uVar4 != 0) {
          iVar1 = 0;
          do {
            (prVar6->dat).unk0x34[iVar1 + uVar2 + -0xc] = 0x80e;
            uVar2++;
            iVar1 = uVar2 << 1;
          } while (uVar2 < uVar4);
        }
      }
      uVar3++;
      iVar1 = uVar3 << 3;
    } while (uVar3 < param_1->ref_obj_count);
  }
  return;
}

void clear_if_no_ExpPak(Scene_obj_dat *param_1,uint param_2){
  if (!ExpPakFlag) {
    if ((param_1->unk0x34 + (param_2 & 0xffff) * 3 + -0xd)[2] != 0.0) {
      if ((param_1->unk0x42 & 2) == 0) {AllocFreeQueueItem(&gGlobals.QueueA,param_1->unk0x34 + (param_2 & 0xffff) * 3 + -0xb,1,0);}
      else {AllocFreeQueueItem(&gGlobals.QueueA,param_1->unk0x34 + (param_2 & 0xffff) * 3 + -0xd + 2,0,0);}
    }
  }
}

void rendervoxel_no_expPak(Scene_obj_dat *param_1){
  int iVar1;
  uint uVar2;
  
  if ((!ExpPakFlag) && (uVar2 = 0, param_1->unk0x40)) {
    iVar1 = 0;
    do {
      iVar1+= uVar2;
      if (param_1->unk0x34[iVar1 + -0xb] != 0.0) {
        if ((param_1->unk0x42 & 2) == 0) {AllocFreeQueueItem(&gGlobals.QueueA,param_1->unk0x34 + iVar1 + -0xb,1,0);}
        else {AllocFreeQueueItem(&gGlobals.QueueA,param_1->unk0x34 + iVar1 + -0xb,0,0);}
      }
      uVar2++;
      iVar1 = uVar2 << 1;
    } while (uVar2 < param_1->unk0x40);
  }
}


rspCom * RenderVoxelScenes(rspCom *param_1,Borg_9_data *param_2,vec3 *v3,short param_4,short param_5,float param_6,float param_7){
  EventFlag EVar1;
  void *pvVar2;
  bool bVar6;
  Borg_7_header *pBVar3;
  AnimationData *pAVar4;
  ushort uVar5;
  uint uVar7;
  Borg_7_header **ppBVar8;
  short sVar9;
  int iVar10;
  Scene_obj_dat *pSVar11;
  AnimationData **ppAVar12;
  color cVar13;
  Scene_obj *SObj;
  uint uVar14;
  int iVar15;
  struct *psVar16;
  uint uVar17;
  float fVar19;
  double dVar18;
  float fVar20;
  ulonglong uVar21;
  float fVar22;
  ulonglong prox2;
  ulonglong prox1;
  ulonglong uVar23;
  ulonglong uVar24;
  vec3 param3;
  int iStack428;
  int iStack420;
  int iStack412;
  Vec2 camCoord;
  Vec2 CamAim;
  Vec2 local_f8;
  float local_b8;
  float local_b4;
  float local_78;
  float local_74;
  borg_9_struct *local_70;
  uint local_6c;
  Vec2 *Sobj_pos;
  uint local_64;
  int local_60;
  int local_5c;
  int local_58;
  
  uVar23 = (ulonglong)(uint)param_6;
  uVar24 = (ulonglong)(uint)param_7;
  fVar19 = __cosf(0.6544875f);
  prox1 = (ulonglong)(uint)fVar19;
  fVar19 = __cosf(0.7417525f);
  prox2 = (ulonglong)(uint)fVar19;
  param3[0] = (*v3)[0] + (float)uVar23;
  camCoord[0] = gGlobals.Sub.camera.coord[0];
  camCoord[1] = gGlobals.Sub.camera.coord[2];
  CamAim[0] = gGlobals.Sub.camera.aim[0];
  CamAim[1] = gGlobals.Sub.camera.aim[2];
  param3[1] = (*v3)[1];
  param3[2] = (*v3)[2] + (float)uVar24;
  local_70 = borg9_get_unkStruct(param_2,param_4,param_5);
  iVar15 = 0;
  if (local_70->unk0x10 != 0) {
    Sobj_pos = (Vec2 *)&local_b8;
    iVar10 = 0;
    do {
      uVar5 = *(ushort *)(iVar10 + (int)local_70->unk0x8);
      SObj = (Scene_obj *)((int)param_2->ref_objs + ((uint)uVar5 * 0x1c - (uint)uVar5) * 4);
      local_5c = iVar15 + 1;
      sprintf(gGlobals.text,"RenderVoxelScenes\nIndex: %d\ntype: %d\nScenes: (%d, %d, %d)\nAddress: %08x",
        (uint)uVar5,(SObj->header).type,(int)param3[1],iStack428,iStack420,iStack412);
      local_58 = iVar10;
      if ((((SObj->header).type == Scene) && (((SObj->header).Bitfeild & visible) != 0)) &&
         (pSVar11 = &SObj->dat, (SObj->header).timestamp < gGlobals.ticker)) {
        (SObj->header).timestamp = gGlobals.ticker;
        fVar19 = get_vec3_proximity((vec3 *)param3,(vec3 *)SObj);
        fVar20 = (SObj->header).size;
        uVar21 = (ulonglong)(uint)fVar19;
        if (fVar20 <= fVar19) {
          rendervoxel_no_expPak(pSVar11);
          goto LAB_800102d8;
        }
        local_6c = 0xff;
        if ((((SObj->dat).unk0x42 & 4) == 0) ||
           ((double)fVar20 * 0.5d < (double)fVar19)) {
          setVec2(Sobj_pos,(SObj->header).coords[0],(SObj->header).coords[2]);
          local_b8 = local_b8 - (float)uVar23;
          local_b4 = local_b4 - (float)uVar24;
          fVar19 = three_vec2_proximities((Vec2 *)camCoord,(Vec2 *)CamAim,Sobj_pos);
          if (fVar19 <= (float)prox1) {
            fVar20 = (float)prox2;
            if (fVar19 <= fVar20) {
              local_6c = 0;
            }
            else {
              dVar18 = (double)((fVar19 - fVar20) / ((float)prox1 - fVar20)) * 255.0d;
              if (INT_MAX_d <= dVar18) {
                dVar18 = dVar18 - INT_MAX_d;
              }
              local_6c = (int)dVar18 & 0xff;
            }
          }
        }
        if (local_6c == 0) {
          rendervoxel_no_expPak(pSVar11);
          local_5c = iVar15 + 1;
          goto LAB_800102d8;
        }
        if ((((SObj->dat).unk0x42 ^ 1) & 1) != 0) {
          local_f8[0] = (SObj->header).coords[0];
          local_f8[1] = (SObj->header).coords[2];
          bVar6 = get_scene_obj_proximity((Vec2 *)local_f8,(Vec2 *)camCoord,(Vec2 *)CamAim,&local_78,&local_74);
          if ((bVar6 != false) && (local_78 < (float)((double)local_74 * 0.35d))) {
            fVar19 = (local_78 / (float)((double)local_74 * 0.35d)) *159.0f;
            if (INT_MAX_f <= fVar19) {fVar19 = fVar19 - INT_MAX_f;}
            local_6c = (int)fVar19 + 0x60U & 0xff;
          }
        }
        local_64 = 0;
        local_5c = iVar15 + 1;
        uVar14 = (int)(((SObj->dat).unk0x40 - 1) * 0x10000) >> 0x10;
        sVar9 = (short)local_5c;
        if (-1 < (int)uVar14) {
          do {
            fVar20 = 0.0;
            local_60 = uVar14 - 1;
            fVar19 = pSVar11->unk0x34[uVar14 * 3 + -0xd];
            if (uVar14 != 0) {fVar20 = pSVar11->unk0x34[uVar14 * 3 + -0x10];}
            fVar22 = (float)uVar21;
            if ((fVar22 < fVar20 - 2.0f) || (fVar19 < fVar22)) {
              clear_if_no_ExpPak(pSVar11,uVar14 & 0xffff);
LAB_800102b4:
              sVar9 = (short)local_60;
            }
            else {
              uVar17 = 0xff;
              if (fVar19 - 1.0f < fVar22) {
                fVar19 = (fVar19 - fVar22) * 255.0f;
                if (fVar19 < INT_MAX_f) {uVar17 = (int)fVar19 & 0xff;}
                else {uVar17 = (int)(fVar19 - INT_MAX_f) & 0xff;}
              }
              fVar19 = (fVar20 - 2.0f) + 1.0f;
              if (fVar22 < fVar19) {
                fVar19 = (1.0f - (fVar19 - fVar22)) * 255.0f;
                if (fVar19 < INT_MAX_f) {uVar17 = (int)fVar19 & 0xff;}
                else {uVar17 = (int)(fVar19 - INT_MAX_f) & 0xff;}
              }
              uVar7 = local_6c;
              if (uVar17 < local_6c) {uVar7 = uVar17;}
              if ((uVar7 < 0xff) || (psVar16 = (struct *)0x0, ((SObj->dat).unk0x42 & 0x40) != 0))
              {
                uVar7 = (uint)voxel_counter;
                psVar16 = struct_ARRAY_800f5290 + uVar7;
                voxel_counter++;
                psVar16->anidat = NULL;
                struct_ARRAY_800f5290[uVar7].flags = 0;
              }
              ppBVar8 = &(SObj->dat).unk0x8;
              ppAVar12 = (AnimationData **)(ppBVar8 + uVar14 * 3);
              if (*ppAVar12 != NULL) {
LAB_80010068:
                if (((SObj->dat).unk0x42 & 2) == 0) {
LAB_80010084:
                  pAVar4 = (AnimationData *)ppBVar8[uVar14 * 3];
                }
                else {
                  pAVar4 = ((SObj->dat).unk0x8)->aniDat;
                }
                cVar13 = (color)0x0;
                if (((SObj->dat).unk0x42 & 0x10) != 0) {
                  cVar13 = *(color *)((SObj->dat).unk0x34 + 2);
                }
                anidat_setMaxtrixA_3
                          (pAVar4,(SObj->header).coords[0] - (float)uVar23,(SObj->header).coords[1],
                           (SObj->header).coords[2] - (float)uVar24);
                if ((SObj->dat).borg5_index == 0x374a) {
                  if (uVar14 == 0) {
                    if (local_64 == 0) {
                      pvVar2 = local_70->unk0x8;
                      (SObj->header).Bitfeild = (SObj->header).Bitfeild & ~visible;
                      passto_WriteTo_VoxelChart
                                (*(undefined2 *)(local_58 + (int)pvVar2),
                                 (undefined)gGlobals.Sub.mapDatA,(undefined)gGlobals.Sub.mapShort1,
                                 (undefined)gGlobals.Sub.mapShort2,0x11,0,0x10);
                      uVar5 = (SObj->dat).unk0x42;
                    }
                    else {
                      uVar5 = (SObj->dat).unk0x42;
                    }
                  }
                  else {
                    uVar5 = (SObj->dat).unk0x42;
                  }
                }
                else {
                  uVar5 = (SObj->dat).unk0x42;
                }
                local_64 = uVar14 & 0xffff;
                if ((uVar5 & 2) == 0) {
                  uVar14 = local_6c;
                  if (uVar17 < local_6c) {uVar14 = uVar17;}
                  set_anidat_colors(pAVar4,(char)uVar14,'\x01',cVar13);
                  if (psVar16 == (struct *)0x0) {param_1 = (rspCom *)func_800a0da4(param_1,pAVar4);}
                  else {psVar16->anidat = pAVar4;}
                }
                else {
                  if (gGlobals.delay < INT_MAX_f) {
                    pBVar3 = (SObj->dat).unk0x8;
                    fVar19 = gGlobals.delay;
                  }
                  else {
                    pBVar3 = (SObj->dat).unk0x8;
                    fVar19 = gGlobals.delay - INT_MAX_f;
                  }
                  func_800a0304(pBVar3,(int)fVar19 & 0xffff);
                  uVar14 = local_6c;
                  if (uVar17 < local_6c) {uVar14 = uVar17;}
                  set_sun_light(pAVar4,(SObj->dat).unk0x42,SObj,(char)uVar14);
                  passto_InitLight_2(&gGlobals.Sub.DynamicLights,pAVar4,SObj,(short)(int)gGlobals.delay);
                  passto_initLight(pAVar4,param_2,(ref_obj *)SObj,(short)(int)gGlobals.delay);
                  if (psVar16 == (struct *)0x0) {param_1 = (rspCom *)func_800a0644(param_1,(locatorStruct *)(SObj->dat).unk0x8);
                  }
                  else {
                    psVar16->anidat = (AnimationData *)(SObj->dat).unk0x8;
                    psVar16->flags = psVar16->flags | 2;
                  }
                }
                goto LAB_800102b4;
              }
              if (((SObj->dat).unk0x42 & 2) == 0) {
                if (NoExpPak_memCheck(1)) {
                  pAVar4 = BorgAnimLoadScene((uint)pSVar11->unk0x34[uVar14 * 3 + -0xc]);
                  *ppAVar12 = pAVar4;
                  goto LAB_8000ffcc;
                }
                goto LAB_800102b4;
              }
              sVar9 = (short)local_60;
              if (NoExpPak_memCheck(0)) {
                pBVar3 = func_loading_borg7((SObj->dat).unk0x4,&gGlobals.Sub.particleEmmiter);
                (SObj->dat).unk0x8 = pBVar3;
                pAVar4 = pBVar3->aniDat;
                func_800a0090(pBVar3,0);
                if ((SObj->header).flagB != 0) {
                  bVar6 = getEventFlag((SObj->header).flagB);
                  if ((bVar6 == false) || (((SObj->header).Bitfeild & Used) != 0)) {
                    bVar6 = getEventFlag((SObj->header).flagB);
                    if ((bVar6 != false) || (((SObj->header).Bitfeild & Used) == 0))
                    goto LAB_8000ffcc;
                    pBVar3 = (SObj->dat).unk0x8;
                  }
                  else {
                    pBVar3 = (SObj->dat).unk0x8;
                  }
                  func_800a0090(pBVar3,1);
                  func_800a0304((SObj->dat).unk0x8,2);
                }
LAB_8000ffcc:
                guMtxIdentF((float (*) [4] [4])pAVar4->matrixA);
                guMtxIdentF((float (*) [4] [4])pAVar4->matrixB);
                AniDat_Flags_OR_0x10(pAVar4);
                func_800a7f64(pAVar4);
                func_800a7ff4(pAVar4);
                aniDat_flags_OR_0x100(pAVar4);
                AniDat_rotate_MatrixA
                          (pAVar4,(float)(SObj->dat).unk0x28 * RadInDeg_f,
                           *(float *)&(SObj->dat).unk0x24 * RadInDeg_f,
                           (SObj->dat).unk0x2c * RadInDeg_f);
                matrix_normalize_scale
                          (pAVar4,*(undefined4 *)&(SObj->dat).unk0x30,(SObj->dat).unk0x34[0],
                           (SObj->dat).unk0x34[1]);
                if (((SObj->dat).unk0x42 & 2) != 0) {
                  anidat_set_light_data(pAVar4);
                  SceneSetMaxDynamicDirLights(pAVar4,2);
                  goto LAB_80010068;
                }
                goto LAB_80010084;
              }
            }
            uVar14 = SEXT24(sVar9);
          } while (-1 < (int)uVar14);
          sVar9 = (short)local_5c;
        }
      }
      else {
LAB_800102d8:
        sVar9 = (short)local_5c;
      }
      iVar15 = (int)sVar9;
      iVar10 = iVar15 << 1;
    } while (iVar15 < (int)(uint)local_70->unk0x10);
  }
  sprintf(gGlobals.text,"Finished RenderVoxelScenesInZone\n");
  return param_1;
}

rspCom * func_80010354(rspCom *param_1,ZoneDat *param_2){
  if (param_2->anidat0x4 != NULL) {
    set_anidat_colors(param_2->anidat0x4,param_2->unk0x1c,'\x01',(color)0x0);
    param_1 = func_800a0da4(param_1,param_2->anidat0x4);}
  return param_1;
}


rspCom * func_800103b0(rspCom *param_1,ZoneDat *param_2){
  if ((param_2->aniDat0x14 != NULL) && (param_2->anidat0x4 != NULL)){
    set_anidat_colors(param_2->aniDat0x14,param_2->unk0x1c,'\x01',(color)0x0);
    param_1 = func_800a0da4(param_1,param_2->aniDat0x14);
  }
  return param_1;
}

bool func_80010414(Vec2 *param_1,Vec2 *param_2,Vec2 *param_3,Vec2 *param_4,short param_5){
  bool uVar1;
  uint uVar2;
  float fVar3;
  float fVar4;
  Vec2 fStack280;
  Vec2 fStack216;
  float afStack152 [2];
  Vec2 fStack88;
  
  if (param_5 == 0) {
    copyVec2(param_1,(Vec2 *)fStack280);
    copyVec2(param_2,(Vec2 *)fStack216);
    copyVec2(param_3,(Vec2 *)afStack152);
    copyVec2(param_4,(Vec2 *)fStack88);
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
  uVar2 = (uint)(fVar4 < 0.0);
  if (fVar3 < 0.0) {uVar2 = (int)(((fVar4 < 0.0) + 1) * 0x10000) >> 0x10;}
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


bool func_80010598(short param_1,short param_2)

{
  bool bVar1;
  Vec2 *pafVar2;
  int iVar3;
  int iVar4;
  float fVar5;
  float fVar6;
  Vec2 fStack176;
  Vec2 fStack168;
  Vec2 fStack160;
  Vec2 fStack152;
  Vec2 fStack112;
  Vec2 fStack104;
  Vec2 afStack96;
  Vec2 afStack88;
  
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
  copyVec2((Vec2 *)fStack104,(Vec2 *)afStack96);
  some_trig_func((Vec2 *)afStack96,-42.5f);
  vec2_sum((Vec2 *)afStack96,(Vec2 *)fStack112,(Vec2 *)afStack96);
  copyVec2((Vec2 *)fStack104,(Vec2 *)afStack88);
  some_trig_func((Vec2 *)afStack88,42.5f);
  vec2_sum((Vec2 *)afStack88,(Vec2 *)fStack112,(Vec2 *)afStack88);
  vec2_sum((Vec2 *)fStack104,(Vec2 *)fStack104,(Vec2 *)fStack112);
  vec2_sum((Vec2 *)afStack96,(Vec2 *)afStack96,(Vec2 *)fStack112);
  vec2_sum((Vec2 *)afStack88,(Vec2 *)afStack88);
  pafVar2 = (Vec2 *)fStack104;
  iVar4 = 0x20000;
  do {
    if (func_80010414((Vec2 *)fStack112,pafVar2,(Vec2 *)fStack176,(Vec2 *)fStack168,0)) {return false;}
    if (func_80010414((Vec2 *)fStack112,pafVar2,(Vec2 *)fStack160,(Vec2 *)fStack152,0)) {return false;}
    if (func_80010414((Vec2 *)fStack112,pafVar2,(Vec2 *)fStack176,(Vec2 *)fStack160,1)) {return false;}
    if (func_80010414((Vec2 *)fStack112,pafVar2,(Vec2 *)fStack168,(Vec2 *)fStack152,1)) {return false;}
    if (1 < iVar3) {
      if (func_80010414((Vec2 *)fStack104,pafVar2,(Vec2 *)fStack176,(Vec2 *)fStack168,0)) {return false;}
      if (func_80010414((Vec2 *)fStack104,pafVar2,(Vec2 *)fStack160,(Vec2 *)fStack152,0)) {return false;}
      if (func_80010414((Vec2 *)fStack104,pafVar2,(Vec2 *)fStack176,(Vec2 *)fStack160,1)) {return false;}
      if (func_80010414((Vec2 *)fStack104,pafVar2,(Vec2 *)fStack168,(Vec2 *)fStack152,1)) {return false;}
    }
    iVar3 = iVar4 >> 0x10;
    pafVar2 = pafVar2[1];
    iVar4 = iVar4 + 0x10000;
    if (3 < iVar3) {return true;}
  } while( true );
}


void RenderZones(rspCom **param_1,vec3 *param_2,short param_3)

{
  int iVar2;
  bool bVar8;
  uint uVar3;
  byte bVar9;
  ushort uVar5;
  u16 uVar6;
  u16 uVar7;
  u32 uVar4;
  undefined2 viBuff;
  u16 uVar10;
  u16 uVar11;
  ZoneDat *pZVar12;
  ZoneDat *iVar1;
  short *psVar13;
  short *psVar14;
  int iVar15;
  float fVar16;
  float fVar17;
  u16 uStack144 [8] [2];
  u16 uStack80 [2];
  rspCom *pauStack76;
  u32 uStack72;
  uint uStack68;
  uint uStack64;
  vec3 *uStack60;
  ParticleHeadStruct *pPStack56;
  u16 (*pauStack52) [2];
  u16 *puStack48;
  rspCom *pauStack44;
  
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
  func_800a8004(gGlobals.Sub.ZoneDatMtx[1][1].anidat0x4);
  if (gGlobals.screenFadeModeSwitch == 0xc) {
    setA_with_2floats(gGlobals.Sub.ZoneDatMtx[1][1].anidat0x4,0.1,125.0);
  }
  else {
    setA_with_2floats(gGlobals.Sub.ZoneDatMtx[1][1].anidat0x4,1.0,180.0);
  }
  func_800a0df4(gGlobals.Sub.ZoneDatMtx[1][1].anidat0x4);
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
    pauStack76 = (rspCom *)func_80010354(pauStack76,gGlobals.Sub.ZoneDatMtx[1] + 1);
  }
  iVar15 = 0;
  pauStack52 = uStack144;
  puStack48 = uStack144 + 1;
  pauStack44 = (rspCom *)&pauStack76;
  uStack64 = 1;
  pPStack56 = &gGlobals.Sub.particleEmmiter;
  uStack60 = (vec3 *)gGlobals.Sub.camera.rotation;
  uStack68 = (uint)(gGlobals.Sub.borg9DatPointer)->byte0x1b;
  iVar2 = 0;
  do {
    uVar3 = uStack64;
    psVar13 = (short *)((int)*pauStack52 + iVar2);
    psVar14 = (short *)((int)puStack48 + iVar2);
    uStack64 = (uStack64 & 0x7f) << 1;
    bVar8 = func_80010598(*psVar13,*psVar14);
    if ((bVar8 == false) || ((uStack68 & uVar3) != 0)) {
      pZVar12 = (ZoneDat *)(*psVar13 * 0x60 + -0x7ff19678 + *psVar14 * 0x20);
      if (ExpPakFlag == 0) {
        if (gGlobals.QueueB.items == 0) {
          if (oneZone_load == 0) {
            if (pZVar12->unk_0x0 == 0) {
              uVar3 = pZVar12->borg5_ID;
            }
            else {
              if (pZVar12->anidat0x4 == NULL) {
                bVar8 = NoExpPak_memCheck(3);
                if (bVar8 != false) {
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
                if (bVar8 != false) {
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
        uVar5 = (ushort)pZVar12->unk0x1c + param_3 * 2;
        if (0xff < uVar5) {
          uVar5 = 0xff;
        }
        pZVar12->unk0x1c = (byte)uVar5;
      }
      if (pZVar12->anidat0x4 != NULL) {
        pauStack76 = (rspCom *)func_80010354(pauStack76,pZVar12);
      }
      if (pZVar12->mapPointer != NULL) {
        func_800ade28(&pZVar12->mapPointer->dat,param_2,uStack80,uStack80 + 1);
        uVar6 = (u16)(int)(gGlobals.Sub.mapCellSize[0] / (pZVar12->mapPointer->dat).floatsB[0]);
        uVar7 = (u16)(int)(gGlobals.Sub.mapCellSize[1] / (pZVar12->mapPointer->dat).floatsB[1]);
        fVar16 = 0.0;
        fVar17 = 0.0;
        uVar10 = 0;
        uVar11 = 0;
        switch(pZVar12->mapshortSum) {
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
      if ((ExpPakFlag == 0) && (uVar4 = get_MemFree(), uVar4 < 0x18000)) {
        iVar1 = (ZoneDat *)(*psVar13 * 0x60 + -0x7ff19678 + *psVar14 * 0x20);
        if (iVar1->anidat0x4 != NULL) {
          AllocFreeQueueItem(&gGlobals.QueueA,&iVar1->anidat0x4,1,0);
        }
        if (iVar1->aniDat0x14 != NULL) {
          AllocFreeQueueItem(&gGlobals.QueueA,&iVar1->aniDat0x14,1,0);
        }
      }
    }
    iVar15 = (int)(short)((short)iVar15 + 1);
    iVar2 = iVar15 << 2;
    if (7 < iVar15) {
      if (uStack72 != 0) {
        pauStack76 = (rspCom *)func_80010354(pauStack76,gGlobals.Sub.ZoneDatMtx[1] + 1);
      }
      sprintf(gGlobals.text,s_ParticleHead_800d8778);
      viBuff = get_vi_buffer_choice();
      ProcessAndRenderParticleHead(pauStack44,pPStack56,uStack60,param_3,viBuff,0);
      sprintf(gGlobals.text,s_Render_Player_Shadows_800d8788);
      pauStack76 = renderPlayerShadows(&gGlobals.Sub.PlayerHandler,pauStack76);
      sprintf(gGlobals.text,s_Render_Players_(Water)_800d87a0);
      if (DAT_800e8da0 == 0) {
        pauStack76 = renderPlayers(&gGlobals.Sub.PlayerHandler,pauStack76,param_3,1,0);
      }
      sprintf(gGlobals.text,s_RenderVoxelScenesInZone[1][1]_800d87b8);
      getZonePositionShorts
                (&(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat,param_2,uStack80,uStack80 + 1);
      pauStack76 = RenderVoxelScenes(pauStack76,&(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat,
                                     param_2,uStack80[0],uStack80[1],0.0,0.0);
      sprintf(gGlobals.text,s_Render_Players(trans)_800d87d8);
      pauStack76 = renderPlayers(&gGlobals.Sub.PlayerHandler,pauStack76,param_3,1,1);
      sprintf(gGlobals.text,s_Finished_Render_Zones_800d87f0);
      *param_1 = pauStack76;
      return;
    }
  } while( true );
}

void RenderTransZones__(rspCom *param_1){
  rspCom *pauVar1;
  int iVar2;
  AnimationData **ppAVar3;
  uint uVar4;
  
  uVar4 = 0;
  pauVar1 = (rspCom *)(*param_1)[0];
  if (voxel_counter != 0) {
    iVar2 = 0;
    do {
      ppAVar3 = (AnimationData **)((int)&struct_ARRAY_800f5290[0].anidat + iVar2);
      if ((*(ushort *)((int)&struct_ARRAY_800f5290[0].flags + iVar2) & 2) == 0) {
        pauVar1 = func_800a0da4(pauVar1,*ppAVar3);
      }
      else {
        pauVar1 = func_800a0644(pauVar1,*ppAVar3);
      }
      uVar4++;
      iVar2 = uVar4 << 3;
    } while (uVar4 < voxel_counter);
  }
  (*param_1)[0] = (u32)pauVar1;
  voxel_counter = 0;
  return;
}

void renderTransZones_(rspCom **param_1){
  byte bVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  bool bVar6;
  rspCom *pauVar5;
  int iVar7;
  undefined4 *puVar8;
  ZoneDat *pZVar9;
  ushort *puVar10;
  short *puVar9;
  short *psVar11;
  int iVar12;
  uint uVar13;
  undefined4 uStack104;
  undefined4 auStack100 [25];
  
  puVar9 = (short *)&uStack104;
  puVar10 = USHORT_ARRAY_800d8894;
  puVar8 = (undefined4 *)puVar9;
  do {
    uVar2 = *(undefined4 *)((int)puVar10 + 4);
    uVar3 = *(undefined4 *)((int)puVar10 + 8);
    uVar4 = *(undefined4 *)((int)puVar10 + 0xc);
    *puVar8 = *(undefined4 *)puVar10;
    puVar8[1] = uVar2;
    puVar8[2] = uVar3;
    puVar8[3] = uVar4;
    puVar10 = (ushort *)((int)puVar10 + 0x10);
    puVar8 = puVar8 + 4;
  } while (puVar10 != USHORT_ARRAY_800d8894 + 0x10);
  psVar11 = (short *)((int)&uStack104 + 2);
  uVar13 = 1;
  pauVar5 = *param_1;
  *puVar8 = USHORT_ARRAY_800d8894._32_4_;
  bVar1 = (gGlobals.Sub.borg9DatPointer)->byte0x1b;
  iVar12 = 0x10000;
  do {
    bVar6 = func_80010598(*puVar9,*psVar11);
    if (((bVar6 == false) || ((bVar1 & uVar13) != 0)) &&
       (pZVar9 = (ZoneDat *)(*puVar9 * 0x60 + -0x7ff19678 + *psVar11 * 0x20),
       pZVar9->aniDat0x14 != NULL)) {
      pauVar5 = func_800103b0(pauVar5,pZVar9);
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
  int iVar1;
  uint uVar2;
  
  uVar2 = 0;
  gGlobals.Sub.unk0x120e = 0;
  gGlobals.Sub.unk0x120c = 0;
  gGlobals.Sub.unk0x1210 = 0;
  iVar1 = 0;
  do {
    memcpy(gGlobals.Sub.MapFloatDats[uVar2][iVar1],param_1,0x2c);
    uVar2++;
    iVar1 = uVar2 << 1;
  } while (uVar2 < 0xf);
}

void InitZoneEngine(float param_1,float param_2,ushort param_3,short param_4)

{
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
  short sVar10;
  undefined2 dat;
  int aiStack232 [32];
  vec3 afStack104;
  
  piVar7 = aiStack232;
  piVar5 = {3,0,1,-1,2,-1,4,5,6,7,8,9,10,11,-1};
  sVar9 = 0;
  dat = 0;
  sVar10 = 0x180;
  *piVar7 = 12;
  DAT_800e9c14 = 0;
  engineZone_flag = 1;
  initZoneTimestamp = gGlobals.ticker;
  if (gGlobals.Sub.zoneEngineInit) {assert("InitZoneEngine","Zone Engine already Initialized");}
  gGlobals.Sub.zoneEngineInit = 1;
  gGlobals.Sub.gamemodeType = param_3;
  zoneengine_func_b();
  set_checktrigger_pointer(check_trigger);
  gGlobals.Sub.refObjPointer = NULL;
  gGlobals.Sub.unk0xf00 = NULL;
  memset_weatherStruct(&gGlobals.Sub.weatherDat);
  InitScriptCameras(&gGlobals.scriptcamera);
  if (gGlobals.Sub.gamemodeType == 1) {
    sVar9 = 0xe;
    if (ExpPakFlag == 0) {sVar10 = 0x60;}
  }
  else {
    if (gGlobals.Sub.gamemodeType < 2) {
      if ((gGlobals.Sub.gamemodeType == 0) && (sVar9 = 0x28, ExpPakFlag == 0)) {sVar10 = 0x40;}
    }
    else {
      if (gGlobals.Sub.gamemodeType == 2) {
        sVar9 = 0;
        dat = 3;
        if (ExpPakFlag == 0) {sVar10 = 0x10;}
      }
    }
  }
  pmVar8 = &gGlobals.Sub.MapFloatDatEntry;
  pmVar6 = &gGlobals.Sub.MapFloatDatEntry;
  if (param_4 == 0) {
    borgmaps_func(gGlobals.Sub.mapDatA,gGlobals.Sub.mapDatB,gGlobals.Sub.mapDatC,false);
    clear_music_no_expPak();
  }
  else {
    Map_ = gGlobals.Sub.MapFloatDatEntry.mapDatA;
    pmVar8 = pmVar6;
    if ((gGlobals.Sub.unk0x120e != 0) &&
       (pmVar6 = func_8000cae8((vec3 *)&gGlobals.Sub.MapFloatDatEntry,gGlobals.Sub.MapFloatDatEntry.MapShort1,gGlobals.Sub.MapFloatDatEntry.MapShort2,
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
    borgmaps_func(Map_,gGlobals.Sub.mapDatB,gGlobals.Sub.mapDatC,false);
    clear_music_no_expPak();
    gGlobals.Sub.unk0x2a4 = pmVar8->playerVec3[0];
    gGlobals.Sub.unk0x2a8 = pmVar8->playerVec3[2];
  }
  InitPlayerHandler(&gGlobals.Sub.camera,sVar9,3);
  InitParticleHead(&gGlobals.Sub.particleEmmiter,gGlobals.Sub.borg9DatPointer,sVar10,0x11,aiStack232);
  func_8000d744();
  no_TP_vec3 = 1;
  loadGameBorgScenes(param_1,param_2,gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
  if (param_4 == 0) {
    memset((vec3 *)afStack104,0,0xc);
    passto_camera_init(&gGlobals.Sub.camera,gGlobals.Sub.borg9DatPointer,(vec3 *)afStack104,dat);
    if ((gGlobals.playerCharStruct.playerDat != NULL) &&
       ((gGlobals.playerCharStruct.playerDat)->removeFlag == 0)) {
      camera_set_aim(&gGlobals.Sub.camera,
                     (vec3 *)((gGlobals.playerCharStruct.playerDat)->collision).position);
      func_800b050c(&gGlobals.Sub.camera,(vec3 *)afStack104);
      camera_set_position(&gGlobals.Sub.camera,(vec3 *)afStack104);
    }
  }
  else {
    passto_camera_init(&gGlobals.Sub.camera,gGlobals.Sub.borg9DatPointer,(vec3 *)pmVar8->cameraVec3,dat);
    ppVar4 = gGlobals.playerCharStruct.playerDat;
    if (gGlobals.playerCharStruct.playerDat != NULL) {
      (gGlobals.playerCharStruct.playerDat)->facing[0] = pmVar8->playerVec2[0];
      ppVar4->facing[1] = pmVar8->playerVec2[1];
      camera_set_aim(&gGlobals.Sub.camera,(vec3 *)((gGlobals.playerCharStruct.playerDat)->collision).position);
    }
  }
  init_dynamic_light(&gGlobals.Sub.DynamicLights);
  if (param_3 == 1) {
    gGlobals.Sub.PlayerHandler.float_0x68 = 128.0f;
    gGlobals.Sub.PlayerHandler.float_0x64 = 128.0f;
  }
  else {
    if ((short)param_3 < 2) {
      if (param_3 != 0) {
LAB_800116a4:
        assert("ZoneEngineInit","Unknown Engine Mode");}
      gGlobals.Sub.PlayerHandler.float_0x68 = 30.0f;
      gGlobals.Sub.PlayerHandler.float_0x64 = 20.0f;
    }
    else {
      if (param_3 != 2) goto LAB_800116a4;
      gGlobals.Sub.PlayerHandler.float_0x68 = 0.0;
      gGlobals.Sub.PlayerHandler.float_0x64 = 0.0;
    }
  }
  if (gGlobals.minimap.active != 0) {
    if (gGlobals.playerCharStruct.playerDat != NULL) {
      gGlobals.minimap.savedPlayerPos[0] =((gGlobals.playerCharStruct.playerDat)->collision).position[0];
      gGlobals.minimap.savedPlayerPos[1] =((gGlobals.playerCharStruct.playerDat)->collision).position[1];
      gGlobals.minimap.savedPlayerPos[2] =((gGlobals.playerCharStruct.playerDat)->collision).position[2];
    }
    func_8005295c(&gGlobals.minimap,gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2);
  }
  return;
}

void SaveEngineZone(playerData *param_1,mapFloatDat *param_2){

  if (engineZone_flag == 0) {debug_queue("SaveZoneEngine Aborted");}
  else {
    param_2->mapDatA = gGlobals.Sub.mapDatA;
    param_2->mapDatB = gGlobals.Sub.mapDatB;
    param_2->mapDatC = gGlobals.Sub.mapDatC;
    param_2->MapShort1 = gGlobals.Sub.mapShort1;
    param_2->MapShort2 = gGlobals.Sub.mapShort2;
    if (param_1 == NULL) {
      setVec3((vec3 *)param_2,0.0,0.0,0.0);
      setVec2((Vec2 *)param_2->playerVec2,1.0,0.0);
    }
    else {
      param_2->playerVec3[0] = (param_1->collision).position[0];
      param_2->playerVec3[1] = (param_1->collision).position[1];
      param_2->playerVec3[2] = (param_1->collision).position[2];
      param_2->playerVec2[0] = param_1->facing[0];
      param_2->playerVec2[1] = param_1->facing[1];
    }
    param_2->cameraVec3[0] = gGlobals.Sub.camera.coord[0];
    param_2->cameraVec3[1] = gGlobals.Sub.camera.coord[1];
    param_2->cameraVec3[2] = gGlobals.Sub.camera.coord[2];
  }
}

void clear_music_values(short ClearAll){
  if (gGlobals.Sub.BGM != NULL) {
    dcm_remove_func(gGlobals.Sub.BGMDatB,gGlobals.Sub.BGMDatA);
    free_borg_12(gGlobals.Sub.BGM);
    gGlobals.Sub.BGM = NULL;
  }
  if (ClearAll) {
    gGlobals.Sub.BGMQueue = 0;
    gGlobals.Sub.BGMIndex = 0;
    gGlobals.Sub.BGMDatA = 0;
    gGlobals.Sub.BGMDatB = 0;
  }
}

void clear_music_no_expPak(void){
  if (((ExpPakFlag == 0) && (gGlobals.Sub.BGMIndex != 0)) &&
     (gGlobals.Sub.BGMIndex != gGlobals.Sub.BGMQueue)) {clear_music_values(0);}}

void update_BGM_(void){
  u32 lVar1;
  float fVar1;
  u8 vol;
  byte V;
  
  if (gGlobals.Sub.BGMIndex != 0) {
    if (gGlobals.Sub.BGMIndex != gGlobals.Sub.BGMQueue) {
      clear_music_values(0);
      if (0 < gGlobals.Sub.BGMIndex) {
        gGlobals.Sub.BGM = load_borg_12((int)(short)gGlobals.Sub.BGMIndex);
        fVar1 = gGlobals.VolBGM * 255.0f;
        if (fVar1 < INT_MAX_f) {vol = (u8)fVar1;}
        else {vol = (u8)(fVar1 - INT_MAX_f);}
        DCM_func(&gGlobals.Sub.BGMDatB,&gGlobals.Sub.BGMDatA,(void *)((int)(gGlobals.Sub.BGM)->unk0x8 + 8),vol,0x80,1,0xffffffff,0);
      }
    }
    gGlobals.Sub.BGMQueue = gGlobals.Sub.BGMIndex;
    gGlobals.Sub.BGMIndex = 0;
  }
  if (gGlobals.Sub.BGM != (Borg_12_header *)0x0) {
    fVar1 = gGlobals.VolBGM * 255.0f;
    if (fVar1 < INT_MAX_f) {V = (byte)(int)fVar1;}
    else {V = (byte)(int)(fVar1 - INT_MAX_f);}
    some_music_func((uint)gGlobals.Sub.BGMDatB,gGlobals.Sub.BGMDatA,V);
  }
  return;
}

void FreeZoneEngine(short playMusic){
  Process_queue_B(&gGlobals.QueueB,1);
  if (gGlobals.Sub.zoneEngineInit == 0) {assert("FreeZoneEngine","Zone Engine Not Initialized");}
  gGlobals.Sub.zoneEngineInit = 0;
  if (playMusic == 0) {clear_music_values();}
  FreeParticleEmmiter(&gGlobals.Sub.particleEmmiter);
  pass_to_weather_remove_sfx(&gGlobals.Sub.weatherDat);
  zonedat_clear_all();
  freeScriptCameras(&gGlobals.scriptcamera);
  clear_some_playerHandler_field();
  FreePlayerHandler();
  dynamic_lights_free_all(&gGlobals.Sub.DynamicLights);
  zoneEnginefree_2();
  SetBackgroundType(2,0,0.0);
}

void clear_ref_obj_flags(Borg_9_data *param_1){
  int iVar1;
  uint uVar2;
  ref_obj *pVVar1;
  
  uVar2 = 0;
  if (param_1->ref_obj_count != 0) {
    pVVar1 = (ref_obj *)param_1->ref_objs;
    iVar1 = 0;
    do {
      pVVar1[uVar2]->header.Bitfeild = 0;
      uVar2++;
      iVar1 = uVar2 << 3;
    } while (uVar2 < param_1->ref_obj_count);
  }
  return;
}

void voxel_index_position(short delta,playerData *param_2){
  char **ppcVar1;
  char **ppcVar2;
  char **ppcVar3;
  char ***pppcVar6;
  Borg_9_data *pBVar7;
  uint uVar8;
  char (*pacVar9) [24];
  char ***pppcVar10;
  ref_obj *prVar11;
  float in_f12;
  char **uStack344;
  char **auStack344;
  char **appcStack336 [84];
  char (*labels) [24]; ={"VOBJECT_CONTAINER","VOBJECT_LIGHT","VOBJECT_AUDIO","VOBJECT_WANDERNODE",
   "VOBJECT_MONSTERPARTY","VOBJECT_REFERENCEPOINT","VOBJECT_TELEPORTER","VOBJECT_CAMERA","VOBJECT_DIALOGUE",
   "VOBJECT_TRIGGER","VOBJECT_SAVEPOINT","VOBJECT_CODE"}
  
  prVar11 = voxel_index_pointer;
  if (voxel_index != 0) {
    pBVar7 = GetCollisionZone(param_2->zoneDatByte);
    uVar8 = (uint)voxel_index_timer;
    voxel_index_timer = (ushort)(uVar8 - (int)delta);
    prVar11 = voxel_index_pointer;
    if ((int)((uVar8 - (int)delta) * 0x10000) < 1) {
      clear_ref_obj_flags(pBVar7);
      uVar8 = (voxel_index_number + 1) % (uint)pBVar7->ref_obj_count;
      enemyHostileFlag = 0;
      voxel_index_timer = 0xb4;
      if (pBVar7->ref_obj_count == 0) {trap(7);}
      voxel_index_number = (ushort)uVar8;
      prVar11 = (ref_obj *)(pBVar7->ref_objs + uVar8);
      sprintf(gGlobals.text,"\n\n\nGOING to Voxel Index: %d\nType: %s\nPosition: (%3.2f, %3.2f, %3.2f)\n"
      ,uVar8,&uStack344 + (uint)(prVar11->header).type * 6,(double)(prVar11->header).coords[2]);
      debug_queue(gGlobals.text);
      if (voxel_index_pointer != (ref_obj *)0x0) {
        sprintf(gGlobals.text,"\n\nAT V-Type: %s\nPosition: (%3.2f, %3.2f, %3.2f)\n",
        (char *)(&uStack344 + (uint)(voxel_index_pointer->header).type * 6),in_f12);
        debug_queue(gGlobals.text);
        if ((voxel_index_pointer->header).type == Scene) {(voxel_index_pointer->header).Bitfeild = visible;}
        (param_2->collision).position[0] = (voxel_index_pointer->header).coords[0];
        (param_2->collision).position[1] = (voxel_index_pointer->header).coords[1];
        (param_2->collision).position[2] = (voxel_index_pointer->header).coords[2];
        gGlobals.Sub.camera.aim[0] = (voxel_index_pointer->header).coords[0];
        gGlobals.Sub.camera.aim[1] = (voxel_index_pointer->header).coords[1];
        gGlobals.Sub.camera.aim[2] = (voxel_index_pointer->header).coords[2];
        gGlobals.Sub.camera.coord[0] = (voxel_index_pointer->header).coords[0] + 2.0f;
        gGlobals.Sub.camera.coord[1] = (voxel_index_pointer->header).coords[1] + 7.0f;
        gGlobals.Sub.camera.coord[2] = (voxel_index_pointer->header).coords[2] + 2.0f;
        gGlobals.Sub.camera.coord_mirror[0] = gGlobals.Sub.camera.coord[0];
        gGlobals.Sub.camera.coord_mirror[1] = gGlobals.Sub.camera.coord[1];
        gGlobals.Sub.camera.coord_mirror[2] = gGlobals.Sub.camera.coord[2];
        gGlobals.Sub.camera.aim_mirror[0] = gGlobals.Sub.camera.aim[0];
        gGlobals.Sub.camera.aim_mirror[1] = gGlobals.Sub.camera.aim[1];
        gGlobals.Sub.camera.aim_mirror[2] = gGlobals.Sub.camera.aim[2];
      }
    }
  }
  voxel_index_pointer = prVar11;
}

void handleZoneEngineFrame(rspCom *param_1,short delta,playerData *player_,float param_4,float param_5){
  bool bVar1;
  mapFloatDat *pmVar3;
  undefined8 uVar2;
  undefined2 viBuff;
  uint uVar4;
  vec3 *position;
  int iVar5;
  float fVar6;
  rspCom *apauStack48 [12];
  
  apauStack48[0] = (rspCom *)(*param_1)[0];
  iVar5 = (int)delta;
  sprintf(gGlobals.text,"Handle Zone Engine Frame");
  voxel_index_position(delta,player_);
  if (player_ != NULL) {
    sprintf(gGlobals.text,"ProcessVoxelObjects");
    ProcessVoxelObjects(player_);
  }
  if (FreeZoneEngineTimestamp == handeZoneEngineTimestamp) 
    {assert("HandleZoneEngineFrame","HandleZoneEngineFrame AND\nFreeZoneEngineMemory called on\nthe same frame!");}
  handeZoneEngineTimestamp = gGlobals.ticker;
  sprintf(gGlobals.text,"ConfirmPlayerWithinZone");
  if (player_ != NULL) {ConfirmPlayerWithinZone(player_,gGlobals.Sub.borg9DatPointer);}
  if (gGlobals.screenFadeMode == 0) {update_BGM_();}
  if ((gGlobals.Sub.refObjPointer != NULL) && (gGlobals.screenFadeMode == 0)) {
    if (gGlobals.Sub.unk0xf00 == (vec3 *)0x0) {
      gGlobals.screenFadeMode = 2;
      gGlobals.screenFadeSpeed = 0.06666667f;
    }
    TeleportPlayer(player_,gGlobals.Sub.refObjPointer,gGlobals.Sub.unk0xf00,param_4,param_5);
    gGlobals.Sub.refObjPointer = NULL;
    gGlobals.Sub.unk0xf00 = NULL;
  }
  some_zoneDat_func();
  if ((DAT_800e8da0 != 0) &&
     (uVar4 = (uint)DAT_800e8da0, DAT_800e8da0 = (ushort)(uVar4 - iVar5),
     (int)((uVar4 - iVar5) * 0x10000) < 0)) {
    DAT_800e8da0 = 0;
  }
  if (gGlobals.Sub.gamemodeType != 2) {
    sprintf(gGlobals.text,"ProcessPlayers");
    ProcessPlayers(&gGlobals.Sub.PlayerHandler,delta);
    sprintf(gGlobals.text,"The crash was not in ProcessPlayers");
  }
  if ((player_ != NULL) && (gGlobals.Sub.gamemodeType == 0)) {
    sprintf(gGlobals.text,"SaveZoneEngine");
    uVar4 = (uint)gGlobals.Sub.unk0x1210;
    gGlobals.Sub.unk0x1210 = (ushort)(uVar4 - iVar5);
    if ((int)((uVar4 - iVar5) * 0x10000) < 1) {
      bVar1 = true;
      position = (vec3 *)(player_->collision).position;
      gGlobals.Sub.unk0x1210 = 0x78;
      pmVar3 = func_8000cae8(position,gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2,gGlobals.Sub.mapDatA,1);
      if ((pmVar3 != (mapFloatDat *)0x0) &&
         (fVar6 = get_vec3_proximity((vec3 *)pmVar3,position), fVar6 < 10.0f)) {
        bVar1 = false;
      }
      if (bVar1) {
        SaveEngineZone(player_,(mapFloatDat *)
                               ((int)&gGlobals +
                               ((uint)gGlobals.Sub.unk0x120c * 0xc -
                               (uint)gGlobals.Sub.unk0x120c) * 4 + 0x1058));
        gGlobals.Sub.unk0x120c =
             (short)(gGlobals.Sub.unk0x120c + 1) +
             (short)((gGlobals.Sub.unk0x120c + 1) / 0xf) * -0xf;
      }
    }
  }
  if (gGlobals.Sub.gamemodeType != 2) {
    ProcessScriptCamera(&gGlobals.scriptcamera,(float)iVar5);
  }
  
  if ((double)get_vec3_proximity((vec3 *)&gGlobals.Sub.camera,(vec3 *)gGlobals.Sub.camera.aim) < 0.05d) {
    assert("SceneSetCameraLookAt","Focus, and Camera at same Spot!");
  }
  sprintf(gGlobals.text,"SceneSetCameraLookAt\n");
  SceneSetCameraLookAt(gGlobals.Sub.ZoneDatMtx[1][1].anidat0x4,gGlobals.Sub.camera.coord[0],
             gGlobals.Sub.camera.coord[1],gGlobals.Sub.camera.coord[2],gGlobals.Sub.camera.aim[0],
             gGlobals.Sub.camera.aim[1],gGlobals.Sub.camera.aim[2]);
  if (gGlobals.Sub.gamemodeType != 2) {apauStack48[0] = RenderSky(apauStack48[0],delta);}
  if (gGlobals.sky.BackgroundType == 3) {
    sprintf(gGlobals.text,"RenderSkyObjects/RenderClouds");
    uVar2 = RenderClouds(apauStack48[0]);
    apauStack48[0] = (rspCom *)(u32)uVar2;
    apauStack48[0] = (rspCom *)clouds_render(uVar2);
  }
  sprintf(gGlobals.text,"RenderZones");
  if (player_ == NULL) {RenderZones((rspCom *)apauStack48,(vec3 *)gGlobals.Sub.camera.aim,delta);}
  else {RenderZones((rspCom *)apauStack48,(vec3 *)(player_->collision).position,delta);}
  if (gGlobals.Sub.gamemodeType != 2) {
    sprintf(gGlobals.text,"RenderPlayers");
    apauStack48[0] = renderPlayers(&gGlobals.Sub.PlayerHandler,apauStack48[0],delta,0,0);
  }
  sprintf(gGlobals.text,"RenderTransZones");
  renderTransZones_((rspCom *)apauStack48);
  RenderTransZones__((rspCom *)apauStack48);
  sprintf(gGlobals.text,"ProcessAndRenderParticleHead");
  gGlobals.text[0] = '\0';
  if (gGlobals.Sub.gamemodeType != 2) {
    ProcessAndRenderParticleHead((rspCom *)apauStack48,&gGlobals.Sub.particleEmmiter,gGlobals.Sub.camera.rotation,delta,get_vi_buffer_choice(),1);}
  sprintf(gGlobals.text,"ProcessAudioBubbles");
  if (player_ != NULL) {ProcessAudioBubbles(&gGlobals.SFXStruct,(vec3 *)(player_->collision).position,delta);}
  sprintf(gGlobals.text,"ProcessWeather");
  ProcessWeather(&gGlobals.Sub.weatherDat,delta);
  func_800556f4(&gGlobals.Sub.DynamicLights,delta);
  sprintf(gGlobals.text,"End Zone Engine Frame");
  (*param_1)[0] = (u32)apauStack48[0];
  return;
}