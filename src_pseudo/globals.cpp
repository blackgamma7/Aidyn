#ifdef DEBUGVER
u32 memUsedMirror;
u64 ofunc_dat;
void set_memUsedMirror(void){memUsedMirror = get_memUsed();}

int Ofunc_get_MemUsed_difference(void){
  int iVar1 = memUsedMirror;
  set_memUsedMirror();
  return iVar1 - memUsedMirror;}

int Ofunc_get_MemUsed_difference_2(void){
  int iVar1 = memUsedMirror;
  set_memUsedMirror();
  return memUsedMirror - iVar1;}
#endif

uint globals::rand_range(uint A,uint B){
  if (A != B) A = Random::rand_func(&gGlobals.rngSeed,A,B);
  return A;}

uint globals::RollD(byte dice,byte sides){
  uint i = 0;
  
  if (dice != 0) {
    for(byte j = 0; j < dice; j++){i+= rand_range(1,sides);}
  }
  return i;
}

uint some_skillcheck_calc(short param_1){
  short SkillCheckSteps[22]={0,26,46,62,81,96,111,122,
     133,144,155,166,177,188,199,210,221,232,243,255,266,0}
  uint uVar1 = 21;
  do {
    if (uVar1 == 0) break;
    uVar1--;
  } while (param_1 < SkillCheckSteps[uVar1]);
  return uVar1++;
}

void get_battle_terrain(EncounterDat *param_1){
  undefined4 uVar2;
  uint uVar3;
  longlong lVar1;
  byte bVar4;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x1e7);
  uVar2 = World::getTerrain(TerrainPointer);
  switch(uVar2) {
  case 0:
    uVar3 = rand_range(6,7);
    param_1->battlefield = (byte)uVar3;
    break;
  case 1:
  case 0x18:
    uVar3 = rand_range(2,3);
    param_1->battlefield = (byte)uVar3;
    break;
  case 2:
    uVar3 = rand_range(0,1);
    param_1->battlefield = (byte)uVar3;
    break;
  case 3:
  case 0x1b:
    uVar3 = rand_range(0xe,0xf);
    param_1->battlefield = (byte)uVar3;
    break;
  case 4:
    bVar4 = 0x13;
    goto setBattlefeildTerrain;
  case 5:
  case 0x11:
    uVar3 = rand_range(4,5);
    param_1->battlefield = (byte)uVar3;
    break;
  case 6:
    bVar4 = 0x12;
    goto setBattlefeildTerrain;
  case 7:
    uVar3 = rand_range(6,7);
    param_1->battlefield = (byte)uVar3;
    break;
  case 8:
    uVar3 = rand_range(0xc,0xd);
    param_1->battlefield = (byte)uVar3;
    break;
  case 9:
    bVar4 = 0x11;
    goto setBattlefeildTerrain;
  case 10:
    bVar4 = 0x10;
    goto setBattlefeildTerrain;
  case 0xb:
    bVar4 = 0x17;
    goto setBattlefeildTerrain;
  case 0xc:
    bVar4 = 0x16;
    goto setBattlefeildTerrain;
  case 0xd:
  case 0x19:
    bVar4 = 0x1b;
    goto setBattlefeildTerrain;
  case 0xe:
    bVar4 = 0x18;
    goto setBattlefeildTerrain;
  case 0xf:
    bVar4 = 0x19;
    goto setBattlefeildTerrain;
  case 0x10:
    bVar4 = 0x1a;
    goto setBattlefeildTerrain;
  case 0x12:
    bVar4 = 0x14;
setBattlefeildTerrain:
    param_1->battlefield = bVar4;
    break;
  case 0x13:
  case 0x17:
  case 0x1a:
    uVar3 = rand_range(8,0xb);
    param_1->battlefield = (byte)uVar3;
    break;
  case 0x14:
    lVar1 = RollD(1,2);
    if (lVar1 == 1) {
      uVar3 = rand_range(6,7);
      param_1->battlefield = (byte)uVar3;
    }
    else {
      uVar3 = rand_range(8,0xb);
      param_1->battlefield = (byte)uVar3;
    }
    break;
  case 0x15:
    lVar1 = RollD(1,2);
    if (lVar1 == 1) {
      uVar3 = rand_range(2,3);
      param_1->battlefield = (byte)uVar3;
    }
    else {
      uVar3 = rand_range(8,0xb);
      param_1->battlefield = (byte)uVar3;
    }
    break;
  case 0x16:
    lVar1 = RollD(1,2);
    if (lVar1 == 1) {
      uVar3 = rand_range(0,1);
      param_1->battlefield = (byte)uVar3;
    }
    else {
      uVar3 = rand_range(8,0xb);
      param_1->battlefield = (byte)uVar3;
    }
  }
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x253);
  return;
}
// next few functions go CRAZY with the sprintf's for some reason.
uint get_enemy_avg_lv(uint param_1,monsterparty_dat *param_2){
  uint uVar1;
  byte bVar3;
  int iVar2;
  uint uVar4;
  ItemID *pIVar5;
  int iVar6;
  uint uVar7;
  uint uVar8;
  monsterpartyEntry *pmVar9;
  float fVar10;
  ulonglong uVar11;
  float afStack120 [4];
  uint uStack56;
  
  uVar4 = 0;
  sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",600);
  uVar7 = 0;
  uVar1 = get_party_avg_lv(gGlobals.Party);
  sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x259);
  sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x25a);
  sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x25b);
  sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x25e);
  if (param_1 == 0) {param_1 = 0;}
  else {
    sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x261);
    if (param_1 != 0) {
      do {
        sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x263);
        bVar3 = GetIDIndex(gGlobals.EncounterDat.enemy_entities[uVar7]);
        sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x264);
        uVar7++;
        uVar4+= EntityPointer->entities[(char)bVar3].Level;
      } while (uVar7 < param_1);
    }
    sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x268);
    uVar4 = uVar4 / param_1;
    if (param_1 == 0) {
      trap(7);
    }
    sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x26b);
    if ((uVar4 != 0) &&
       (sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x26e),
       uVar1 < uVar4)) {
      sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x272);
      fVar10 = ((float)uVar1 * 3.0f) / (float)uVar4;
      if (INT_MAX_f <= fVar10) {fVar10 -= INT_MAX_f;}
      sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x273);
      afStack120 = {0.3f,0.2f,0.1f,0.0f};
      sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x274);
      uVar11 = (ulonglong)(uint)afStack120[(int)fVar10];
      sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x277);
      if ((float)uVar11 != 0.0) {
        uVar4 = 0;
        sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x27a);
        do {
          sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x27d);
          pmVar9 = param_2->enemyEntries + uVar4;
          sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x27e);
          uStack56 = uVar4 + 1;
          if (pmVar9->enemyID != (ItemID)0x0) {
            uVar4 = 0;
            iVar6 = 0;
            sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x281);
            sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x284);
            iVar2 = 0;
            if (param_1 != 0) {
              do {
                if (*(ItemID *)(&gGlobals.EncounterDat.enemy_entities[0].type + iVar2) ==
                    pmVar9->enemyID) {
                  iVar6++;
                }
                uVar4++;
                iVar2 = uVar4 << 1;
              } while (uVar4 < param_1);
            }
            uVar4 = 0;
            sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x28a);
            iVar2 = (int)((float)iVar6 * (float)uVar11);
            sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x28c);
            if (param_1 != 0) {
              do {
                if (iVar2 == 0) break;
                sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x28f);
                pIVar5 = gGlobals.EncounterDat.enemy_entities + uVar4;
                uVar1 = uVar4 + 1;
                if (*pIVar5 == pmVar9->enemyID) {
                  sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x293);
                  iVar2--;
                  while (uVar4 < param_1 - 1) {
                    uVar4++;
                    *pIVar5 = pIVar5[1];
                    pIVar5++;
                  }
                  param_1--;
                  sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",
                              0x297);
                  sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",
                              0x298);
                  sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",
                              0x29b);
                  gGlobals.EncounterDat.enemy_entities[param_1] = (ItemID)0x0;
                }
                uVar4 = uVar1 & 0xffff;
              } while (uVar4 < param_1);
            }
          }
          uVar4 = uStack56 & 0xffff;
        } while (uVar4 < 8);
        sprintf(gGlobals.text,"%s - %d","./src/globals.cpp",0x29f);
      }
    }
  }
  return param_1;
}


uint add_to_enemy_encounters(EncounterDat *param_1,short *param_2){
  undefined *puVar1;
  undefined *puVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  short *psVar6;
  uint uStack48;
  
  uVar5 = 0;
  uStack48 = 0;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2a4);
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2a6);
  psVar6 = param_2;
  do {
    sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2a9);
    sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2aa);
    if (*param_2 != 0) {
      sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2ad);
      uVar3 = 0;
      uVar4 = uVar5;
      if (*(char *)(param_2 + 1) != '\0') {
        do {
          sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2b0);
          uVar5 = uVar4 + 1;
          *(short *)&param_1->enemy_entities[uVar4].type = *param_2;
          sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp"0x2b3);
          if ((ushort)psVar6[0x15] <= uVar5) {
            return uVar5;
          }
          sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2b6);
          uVar3 = uVar3 + 1;
          if (0xb < uVar5) {
            return uVar5;
          }
          uVar4 = uVar5;
        } while (uVar3 < *(byte *)(param_2 + 1));
      }
    }
    param_2 = param_2 + 2;
    uStack48 = uStack48 + 1;
    if (7 < uStack48) {
      sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",699);
      return uVar5;
    }
  } while( true );
}

uint func_8000bed0(EncounterDat *param_1,undefined *param_2){
  undefined *puVar1;
  undefined *puVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  short *psVar6;
  uint uVar7;
  uint uStack48;
  
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2c0);
  uVar3 = add_to_enemy_encounters(param_1,param_2);
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2c3);
  if (uVar3 < *(ushort *)(param_2 + 0x2a)) {
    uStack48 = 0;
    sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2c6);
    sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2c7);
    do {
      sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2ca);
      psVar6 = (short *)(param_2 + uStack48 * 4);
      sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2cb);
      uVar4 = uVar3;
      if ((*psVar6 != 0) &&
         (sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2ce),
         *(byte *)(psVar6 + 1) < *(byte *)((int)psVar6 + 3))) {
        uVar7 = 0;
        sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2d1);
        uVar5 = rand_range(0,(uint)*(byte *)((int)psVar6 + 3) - (uint)*(byte *)(psVar6 + 1))
        ;
        sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2d4);
        if ((uVar5 & 0xff) != 0) {
          do {
            sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2d6)
            ;
            uVar4 = uVar3 + 1 & 0xffff;
            *(short *)&param_1->enemy_entities[uVar3].type = *psVar6;
            sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2d9);
            if (*(ushort *)(param_2 + 0x2a) <= uVar4) {
              return uVar4;
            }
            sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2da)
            ;
            if (0xb < uVar4) {
              return uVar4;
            }
            uVar7++;
            uVar3 = uVar4;
          } while (uVar7 < (uVar5 & 0xff));
        }
      }
      uStack48++;
      uVar3 = uVar4;
    } while (uStack48 < 8);
    sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2df);
    if (uVar4 < *(ushort *)(param_2 + 0x28)) {
      uVar4 = 0;
    }
    else {
      sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2e2);
    }
  }
  else {
    uVar4 = (uint)*(ushort *)(param_2 + 0x2a);
  }
  return uVar4;
}

void Emergency_skeleton_func(undefined8 param_1)

{
  undefined8 uVar1;
  int uVar2;
  
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2e7);
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2ea);
  memset(&encounter_dat,0,0x18);
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2ed);
  uVar1 = func_8000bed0(&encounter_dat,(undefined *)param_1);
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2f0);
  uVar2 = get_enemy_avg_lv(uVar1,param_1);
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2f3);
  if (uVar2 == 0) {
    uVar2 = 1;
                    /* skeleton */
    encounter_dat.enemy_entities[0] = entityList[187] + 0x200;
  }
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2f7);
  if (uVar2 < 0xc) {
    memset(encounter_dat.enemy_entities + uVar2,0,(0xc - uVar2) * 2);
  }
  return;
}

void battle_setup_func(monsterparty_obj *param_1,EventFlag param_2,ushort param_3)

{
  monsterparty_obj *pmVar1;
  
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2fe);
  pmVar1 = param_1;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x2ff);
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x302);
  encounter_dat.unk0x1c = 1;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x303);
  encounter_dat.mapDatA = map_dat_A;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x304);
  encounter_dat.MapSAhortA = MapShortA;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x305);
  encounter_dat.MapShortB = mapShortB;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x306);
  encounter_dat.globalLoot = param_1->globalLoot;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x307);
  encounter_dat.EncounterID = param_2;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x308);
  encounter_dat.BossShadow = 1;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x309);
  encounter_dat.VoxelIndex = param_3;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x30a);
  encounter_dat.VoxelFlagA = (pmVar1->header).flagA;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x30b);
  encounter_dat.voxelBitfeild = (pmVar1->header).Bitfeild;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x30e);
  gGlobals.combatBytes[2] = 1;
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x311);
  get_battle_terrain(&encounter_dat);
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x314);
  Emergency_skeleton_func(&param_1->enemyID);
  sprintf(gGlobals.Text,"%s - %d","./src/globals.cpp",0x315);
  return;
}

void load_camp_ambush(void){
  byte *pbVar1;
  int iVar3;
  ulonglong uVar2;
  encounter_rom_dat *peVar4;
  ItemID *pIVar5;
  uint uVar6;
  encounter_rom_dat fromROM;
  ItemID aIStack72 [20];
  short sStack32;
  short sStack30;
  
  get_battle_terrain(&encounter_dat);
  encounter_dat.collisionBool = true;
  encounter_dat.globalLoot = 0;
  encounter_dat.unk0x28 = 0;
  encounter_dat.EncounterID = 0;
  encounter_dat.BossShadow = 0;
  gGlobals.combatBytes[2] = 1;
  iVar3 = World::getTerrain(TerrainPointer);
  uVar2 = get_party_avg_lv(partyPointer);
  if (uVar2 < 0x15) {
    if (uVar2 < 0x10) {
      if (uVar2 < 0xb) {uVar6 = uVar2 < 6 ^ 1;}
      else {uVar6 = 2;}
    }
    else {uVar6 = 3;}
  }
  else {uVar6 = 4;}
  RomCopy(&fromROM,globals_rom + uVar6 + (iVar3 * 5 & 0xfffU) * 2,8,1,s_./src/globals.cpp_800d81ec,
          0x348);
  memset(aIStack72,0,0x38);
  uVar6 = 0;
  peVar4 = &fromROM;
  sStack32 = (ushort)fromROM.unk0x2 + (ushort)fromROM.unk0x6;
  sStack30 = (ushort)fromROM.unk0x3 + (ushort)fromROM.unk0x7;
  pIVar5 = aIStack72;
  do {
    *pIVar5 = peVar4->id1;
    uVar6 = uVar6 + 1;
    pIVar5[1].type = peVar4->unk0x2;
    pbVar1 = &peVar4->unk0x3;
    peVar4 = (encounter_rom_dat *)&peVar4->id2;
    pIVar5[1].ID = *pbVar1;
    pIVar5 = pIVar5 + 2;
  } while (uVar6 < 2);
  Emergency_skeleton_func(aIStack72);
  return;
}

uint append_SenseAura_text(char *str1,char *str2,uint param_3){
  uint uVar1 = strlen(str1);
  uint uVar2 = strlen(str2);
  sprintf(str1 + uVar1,"%s\n",str2);
  uVar1 = uVar2;
  if (uVar2 <= param_3) {
    uVar1 = param_3;
  }
  return uVar1;
}
#ifdef DEBUGVER
void func_8000c6e8(void){
  OSTime OVar1;
  u64 uVar2;
  
  OVar1 = osGetTime();
  uVar2 = udivdi3((u32)((OVar1 << 6) >> 0x20),(u32)(OVar1 << 6),0,3);
  ofunc_dat = uVar2;}
//a lot more orphaned funcs using "ofunc_dat" between these 2
//Ghidra struggled with them, but.. here it goes.
undefined8 func_8000c730(void){
  uint uVar1;
  undefined8 in_v1;
  ulonglong uVar2;
  OSTime OVar3;
  u64 uVar4;
  
  uVar1 = (uint)((ulonglong)in_v1 >> 0x20);
  OVar3 = osGetTime();
  uVar2 = (ulonglong)uVar1 << 0x20;
  uVar4 = udivdi3((int)(OVar3 >> 0x20) << 6 | (uint)OVar3 >> 0x1a,(uint)OVar3 << 6,0,3);
  return CONCAT44(((int)(uVar4 >> 0x20) - ofunc_dat._0_4_) -
                  (uint)((uVar2 & 0xffffffff00000000 | uVar4 & 0xffffffff) <
                        (ulonglong)(longlong)ofunc_dat._4_4_),
                  (int)(uVar4 & 0xffffffff) - ofunc_dat._4_4_);}
void func_8000c788(char *param_1){
  uint uVar1;
  undefined8 in_v1;
  ulonglong uVar2;
  OSTime OVar3;
  u64 uVar4;
  
  uVar1 = (uint)((ulonglong)in_v1 >> 0x20);
  OVar3 = osGetTime();
  uVar2 = (ulonglong)uVar1 << 0x20;
  uVar4 = udivdi3((int)(OVar3 >> 0x20) << 6 | (uint)OVar3 >> 0x1a,(uint)OVar3 << 6,0,3);
  sprintf(gGlobals.Text,s_%s_:_%llu_800d828c,param_1,
              (ulonglong)
              ((uVar2 & 0xffffffff00000000 | uVar4 & 0xffffffff) <
              (ulonglong)(longlong)ofunc_dat._4_4_));
  debug::debug_queue(gGlobals.Text);
  OVar3 = osGetTime();
  uVar4 = udivdi3((int)(OVar3 >> 0x20) << 6 | (uint)OVar3 >> 0x1a,(uint)OVar3 << 6,0,3);
  ofunc_dat._0_4_ = (int)(uVar4 >> 0x20);
  ofunc_dat._4_4_ = (int)uVar4;}
void func_8000c850(float param_1){
  ulonglong uVar1;
  uint in_v1_hi;
  uint uVar2;
  ulonglong uVar3;
  float fVar4;
  ulonglong uVar5;
  OSTime OVar6;
  u64 uVar7;
  u64 uVar8;
  
  uVar3 = (ulonglong)(uint)(param_1 * 1000000.0f);
  OVar6 = osGetTime();
  uVar7 = udivdi3((int)(OVar6 >> 0x20) << 6 | (uint)OVar6 >> 0x1a,(uint)OVar6 << 6,0,3000);
  uVar5 = (ulonglong)(uint)INT_MAX_f;
  uVar1 = (ulonglong)in_v1_hi;
  do {
    fVar4 = (float)uVar3;
    if (fVar4 < (float)uVar5) {
      uVar2 = (uint)fVar4;
    }
    else {
      uVar2 = (int)(fVar4 - (float)uVar5) | 0x80000000;
    }
    OVar6 = osGetTime();
    uVar8 = udivdi3((int)(OVar6 >> 0x20) << 6 | (uint)OVar6 >> 0x1a,(uint)OVar6 << 6,0,3000);
  } while (((uint)(uVar8 >> 0x20) ==
            (uint)((uVar8 & 0xffffffff | (ulonglong)in_v1_hi << 0x20) <
                  (uVar7 & 0xffffffff | uVar1 << 0x20))) &&
          ((uint)((int)uVar8 - (int)(uVar7 & 0xffffffff)) < uVar2));}
#endif
//now, to more sensible programming.
void minimap_struct_init_or_free(bool param_1,short param_2){
  if (param_2 == -1) {
    if (param_1 == false) {passto_minimap_struct_free(&MinimapStruct);}
    else {minimap_struct_init(&MinimapStruct);}
  }
}

void minimap_struct_init_2(void){minimap_struct_init_or_free(true,-1);}
void minimap_struct_free_2(void){minimap_struct_init_or_free(false,-1);}