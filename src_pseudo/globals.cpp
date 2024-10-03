#include "commonTypes.h"
#include "globals.h"
#include "world.h"
#include "stringN64.h"

#ifdef DEBUGVER
u32 memUsedMirror;
u64 ofunc_dat;
void set_memUsedMirror(void){memUsedMirror = get_memUsed();}

s32 Ofunc_get_MemUsed_difference(void){
  s32 iVar1 = memUsedMirror;
  set_memUsedMirror();
  return iVar1 - memUsedMirror;}

s32 Ofunc_get_MemUsed_difference_2(void){
  s32 iVar1 = memUsedMirror;
  set_memUsedMirror();
  return memUsedMirror - iVar1;}
#endif

u32 rand_range(u32 A,u32 B){
  if (A != B) A = RAND.func(A,B);
  return A;
  }

//several random functions use "dice notation" for their calculations.
u16 RollD(u8 dice,u8 sides){
  u16 i = 0;
  
  if (dice) {
    for(u8 j = 0; j < dice; j++)i+= rand_range(1,sides);
  }
  return i;
}

s16 SkillCheckSteps[22]={0,26,46,62,81,96,111,122,
     133,144,155,166,177,188,199,210,221,232,243,255,266,0};
u32 some_skillcheck_calc(s16 param_1){
  u32 i = 21;
  do {
    if (i == 0) break;
    i--;
  } while (param_1 < SkillCheckSteps[i]);
  return i++;
}
char* sGlobalsFmt="%s - %d";
char* sGlobalsFilename="./src/globals.cpp";
//used several times throughout this part. not sure why.
#define printLine(line) Gsprintf(sGlobalsFmt,sGlobalsFilename,line)

void get_battle_terrain(EncounterDat *param_1){
  u8 bVar4;

  printLine(0x1e7);
  switch(World::getTerrain(TerrainPointer)) {
  case 0:
    param_1->battlefield = rand_range(6,7);
    break;
  case 1:
  case 0x18:
    param_1->battlefield = rand_range(2,3);
    break;
  case 2:
    param_1->battlefield = rand_range(0,1);
    break;
  case 3:
  case 0x1b:
    uVar3 = ;
    param_1->battlefield = rand_range(0xe,0xf);
    break;
  case 4:
    bVar4 = 0x13;
    goto setBattlefeildTerrain;
  case 5:
  case 0x11:
    param_1->battlefield = rand_range(4,5);
    break;
  case 6:
    bVar4 = 0x12;
    goto setBattlefeildTerrain;
  case 7:
    param_1->battlefield = rand_range(6,7);
    break;
  case 8:
    param_1->battlefield = rand_range(0xc,0xd);
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
    param_1->battlefield = rand_range(8,0xb);
    break;
  case 0x14:
    if (RollD(1,2) == 1) param_1->battlefield = rand_range(6,7);
    else param_1->battlefield = rand_range(8,0xb);
    break;
  case 0x15:
    if (RollD(1,2) == 1) param_1->battlefield = rand_range(2,3);
    else param_1->battlefield = rand_range(8,0xb);
    break;
  case 0x16:
    if (RollD(1,2) == 1) param_1->battlefield = rand_range(0,1);
    else param_1->battlefield = rand_range(8,0xb);
  }
  printLine(0x253);
}


uint get_enemy_avg_lv(u16 param_1,monsterparty_dat *param_2)

{
  uint uVar1;
  byte bVar3;
  int iVar2;
  u16 uVar4;
  ItemID *pIVar5;
  int iVar6;
  u16 uVar7;
  monsterpartyEntry *pmVar9;
  float fVar10;
  float afStack_78 [16];
  uint uStack_38;
  
  uVar4 = 0;
  printLine(600);
  uVar7 = 0;
  uVar1 = get_party_avg_lv(gGlobals.party);
  printLine(0x259);
  printLine(0x25a);
  printLine(0x25b);
  printLine(0x25e);
  if (param_1 == 0) param_1 = 0;
  else {
    printLine(0x261);
    if (param_1 != 0) {
      for(uVar7=0;uVar7<param_1;uVar7++) {
        printLine(0x263);
        bVar3 = GetIDIndex(gGlobals.EncounterDat.enemy_entities[uVar7]);
        printLine(0x264);
        uVar4 += EntityPointer->entities[(char)bVar3].Level;
      } while (uVar7 < param_1);
    }
    printLine(0x268);
    uVar4 /= param_1;
    printLine(0x26b);
    if ((uVar4 != 0) &&
       (printLine(0x26e),
       (uVar1 & 0xffff) < uVar4)) {
      printLine(0x272);
      fVar10 = ((float)uVar1 * 3.0f) / (float)uVar4;
      printLine(0x273);
      float afStack_78[]={0.3f,0.2f,0.1f,0.0f};
      printLine(0x274);
      fVar10 = afStack_78[(int)fVar10];
      printLine(0x277);
      if (fVar10 != 0.0) {
        uVar4 = 0;
        printLine(0x27a);
        do {
          printLine(0x27d);
          pmVar9 = param_2->enemyEntries + uVar4;
          printLine(0x27e);
          uStack_38 = uVar4 + 1;
          if (pmVar9->enemyID.s) {
            uVar4 = 0;
            iVar6 = 0;
            printLine(0x281)
            ;
            printLine(0x284)
            ;
            iVar2 = 0;
            if (param_1 != 0) {
              do {
                if (*(ItemID *)(&gGlobals.EncounterDat.enemy_entities[0].type + iVar2) ==
                    pmVar9->enemyID) {
                  iVar6 += 1;
                }
                uVar4 = uVar4 + 1 & 0xffff;
                iVar2 = uVar4 << 1;
              } while (uVar4 < param_1);
            }
            uVar4 = 0;
            printLine(0x28a)
            ;
            iVar2 = (int)((float)iVar6 * fVar10);
            printLine(0x28c)
            ;
            if (param_1 != 0) {
              do {
                if (iVar2 == 0) break;
                printLine(0x28f);
                pIVar5 = gGlobals.EncounterDat.enemy_entities + uVar4;
                uVar1 = uVar4 + 1;
                if (*pIVar5 == pmVar9->enemyID) {
                  printLine(0x293);
                  iVar2 += -1;
                  for (; uVar4 < param_1 - 1; uVar4 += 1) {
                    *pIVar5 = pIVar5[1];
                    pIVar5 = pIVar5 + 1;
                  }
                  param_1 = param_1 - 1 & 0xffff;
                  printLine(0x297);
                  printLine(0x298);
                  printLine(0x29b);
                  pIVar5 = gGlobals.EncounterDat.enemy_entities + param_1;
                  pIVar5->type = Empty;
                  pIVar5->ID = 0;
                }
                uVar4 = uVar1 & 0xffff;
              } while (uVar4 < param_1);
            }
          }
          uVar4 = uStack_38 & 0xffff;
        } while (uVar4 < 8);
        printLine(0x29f);
      }
    }
  }
  return param_1;
}


uint add_to_enemy_encounters(EncounterDat *param_1,monsterparty_dat *param_2){
  u8 *puVar1;
  u8 *puVar2;
  uint uVar3;
  monsterparty_dat *pmVar4;
  uint uVar5;
  uint uVar6;
  uint uStack_30;
  
  uVar6 = 0;
  uStack_30 = 0;
  printLine(676);
  printLine(678);
  pmVar4 = param_2;
  do {
    printLine(681);
    printLine(682);
    if (pmVar4->enemyEntries[0].enemyID.s) {
      printLine(685);
      uVar3 = 0;
      uVar5 = uVar6;
      if (pmVar4->enemyEntries[0].min != 0) {
        do {
          printLine(688);
          uVar6 = uVar5 + 1 & 0xffff;
          param_1->enemy_entities[uVar5] = pmVar4->enemyEntries[0].enemyID;
          printLine(691);
          if (param_2->totalsize <= uVar6) return uVar6;
          printLine(694);
          uVar3++;
          if (0xb < uVar6) return uVar6;
          uVar5 = uVar6;
        } while (uVar3 < pmVar4->enemyEntries[0].min);
      }
    }
    pmVar4 = (monsterparty_dat *)(pmVar4->enemyEntries + 1);
    uStack_30++;
    if (7 < uStack_30) {
      printLine(699);
      return uVar6;
    }
  } while( true );
}


uint FUN_8000bed0(EncounterDat *param_1,monsterparty_dat *param_2){
  undefined *puVar1;
  undefined *puVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  monsterpartyEntry *pIVar6;
  uint uVar6;
  u16 i;
  
  printLine(0x2c0);
  uVar3 = add_to_enemy_encounters(param_1,param_2);
  printLine(0x2c3);
  if (uVar3 < param_2->totalsize) {
    printLine(0x2c6);
    printLine(0x2c7);
    for(i=0;i<8;i++){
      printLine(0x2ca);
      pIVar6 = param_2->enemyEntries + i;
      printLine(0x2cb);
      uVar4 = uVar3;
      if ((pIVar6->enemyID != (ItemID)0x0) &&
         (printLine(0x2ce),
         pIVar6->min < pIVar6->max)) {
        uVar6 = 0;
        printLine(0x2d1);
        uVar5 = rand_range(0,(uint)pIVar6->max - (uint)pIVar6->min);
        printLine(0x2d4);
        if ((uVar5 & 0xff) != 0) {
          do {
            printLine(0x2d6);
            uVar4 = uVar3 + 1 & 0xffff;
            param_1->enemy_entities[uVar3] = pIVar6->enemyID;
            printLine(0x2d9);
            if (param_2->totalsize <= uVar4) return uVar4;
            printLine(0x2da)
            ;
            if (0xb < uVar4) return uVar4;
            uVar6 = uVar6 + 1 & 0xffff;
            uVar3 = uVar4;
          } while (uVar6 < (uVar5 & 0xff));
        }
      }
      uVar3 = uVar4;
    }
    printLine(0x2df);
    if (uVar4 < param_2->field6_0x28) uVar4 = 0;
    else printLine(0x2e2);
  }
  else uVar4 = (uint)param_2->totalsize;
  return uVar4;
}

void Emergency_skeleton_func(monsterparty_dat *param_1){
  u16 uVar2;
  s32 uVar1;
  
  printLine(0x2e7);
  printLine(0x2ea);
  CLEAR(&gGlobals.EncounterDat.enemy_entities);
  printLine(0x2ed);
  uVar2 = FUN_8000bed0(&gGlobals.EncounterDat,param_1);
  printLine(0x2f0);
  uVar1 = get_enemy_avg_lv(uVar2,param_1);
  printLine(0x2f3);
  if (uVar1 == 0) {
    uVar1 = 1;                                    // skeleton
    gGlobals.EncounterDat.enemy_entities[0].s = (entityList[187] + 0x200);
  }
  printLine(0x2f7);
  if (uVar1 < 0xc)
    memset(gGlobals.EncounterDat.enemy_entities + uVar1,0,(0xc - uVar1) * 2);
}


void battle_setup_func(monsterparty_obj *param_1,u16 flag,ushort param_3){
  printLine(0x2fe);
  printLine(0x2ff);
  printLine(0x302);
  gGlobals.EncounterDat.field3_0x1c = 1;
  printLine(0x303);
  gGlobals.EncounterDat.mapDatA = gGlobals.Sub.mapDatA;
  printLine(0x304);
  gGlobals.EncounterDat.MapSAhortA = gGlobals.Sub.mapShort1;
  printLine(0x305);
  gGlobals.EncounterDat.MapShortB = gGlobals.Sub.mapShort2;
  printLine(0x306);
  gGlobals.EncounterDat.globalLoot = (param_1->dat).globalLoot;
  printLine(0x307);
  gGlobals.EncounterDat.EncounterID = flag;
  printLine(0x308);
  gGlobals.EncounterDat.BossShadow = 1;
  printLine(0x309);
  gGlobals.EncounterDat.VoxelIndex = param_3;
  printLine(0x30a);
  gGlobals.EncounterDat.VoxelFlagA = (param_1->header).flagA;
  printLine(0x30b);
  gGlobals.EncounterDat.VoxelBitfield = (param_1->header).Bitfeild;
  printLine(0x30e);
  gGlobals.combatBytes[2] = 1;
  printLine(0x311);
  get_battle_terrain(&gGlobals.EncounterDat);
  printLine(0x314);
  Emergency_skeleton_func(&param_1->dat);
  printLine(0x315);
}


void load_camp_ambush(void){
  byte *pbVar1;
  int ter;
  ulonglong lv;
  uint lvTeir;
  monsterpartyEntry *pmVar2;
  monsterparty_dat *pmVar3;
  encounter_rom_dat fromROM;
  monsterparty_dat auStack72;
  
  get_battle_terrain(&gGlobals.EncounterDat);
  gGlobals.EncounterDat.collisionByte = 2;
  gGlobals.EncounterDat.globalLoot.type = Empty;
  gGlobals.EncounterDat.globalLoot.ID = 0;
  gGlobals.EncounterDat.unk28 = 0;
  gGlobals.EncounterDat.EncounterID = 0;
  gGlobals.EncounterDat.BossShadow = 0;
  gGlobals.combatBytes[2] = 1;
  ter = World::getTerrain(TerrainPointer);
  lv = get_party_avg_lv(gGlobals.party);
  if (lv < 0x15) {
    if (lv < 0x10) {
      if (lv < 0xb) lvTeir = lv < 6 ^ 1;
      else lvTeir = 2;
    }
    else lvTeir = 3;
  }
  else lvTeir = 4;
  RomCopy::RomCopy(&fromROM,globals_rom[0] + lvTeir + (ter * 5 & 0xfffU) * 2,8,1,sGlobalsFilename,0x348);
  memset(&auStack72,0,0x38);
  lvTeir = 0;
  pmVar2 = fromROM.entries;
  auStack72.field6_0x28 = (ushort)fromROM.entries[0].min + (ushort)fromROM.entries[1].min;
  auStack72.totalsize = (ushort)fromROM.entries[0].max + (ushort)fromROM.entries[1].max;
  pmVar3 = &auStack72;
  do {
    pmVar3->enemyEntries[0].enemyID = ((monsterpartyEntry *)&pmVar2->enemyID)->enemyID;
    lvTeir += 1;
    pmVar3->enemyEntries[0].min = pmVar2->min;
    pbVar1 = &pmVar2->max;
    pmVar2 = pmVar2 + 1;
    pmVar3->enemyEntries[0].max = *pbVar1;
    pmVar3 = (monsterparty_dat *)(pmVar3->enemyEntries + 1);
  } while (lvTeir < 2);
  Emergency_skeleton_func(&auStack72);
}

u32 AppendText(char *str1,char *str2,u8 len){
  u32 uVar1 = strlen(str1);
  u32 uVar2 = strlen(str2);
  sprintf(str1 + uVar1,"%s\n",str2);
  uVar1 = uVar2;
  if (uVar2 <= len) uVar1 = len;
  return uVar1;
}

#ifdef DEBUGVER
void FUN_8000c6e8(void){
  ofunc_dat = udivdi3(osGetTime()<<6,3);}
//a lot more orphaned funcs using "ofunc_dat" between these 2
//Ghidra struggled with them, but.. here it goes.
u64 Ofunc_8000c730(void){
  OSTime OVar1;
  u64 uVar2;
  
  OVar1 = osGetTime();
  uVar2 = udivdi3(CONCAT44((int)(OVar1 >> 0x20) << 6 | (uint)OVar1 >> 0x1a,(uint)OVar1 << 6),3);
  return CONCAT44(((int)(uVar2 >> 0x20) - ofunc_dat._0_4_) -
                  (uint)((uVar2 & 0xffffffff) < (ulonglong)(longlong)ofunc_dat._4_4_),
                  (int)uVar2 - ofunc_dat._4_4_);
}

void Ofunc_8000c788(char *param_1){
  OSTime OVar1;
  u64 uVar2;
  
  OVar1 = osGetTime();
  uVar2 = udivdi3(CONCAT44((int)(OVar1 >> 0x20) << 6 | (uint)OVar1 >> 0x1a,(uint)OVar1 << 6),3);
  sprintf(gGlobals.text,s_%s_:_%llu_800d828c,param_1,
              (ulonglong)((uVar2 & 0xffffffff) < (ulonglong)(longlong)ofunc_dat._4_4_));
  N64Print::Print(gGlobals.text);
  OVar1 = osGetTime();
  ofunc_dat udivdi3(CONCAT44((int)(OVar1 >> 0x20) << 6 | (uint)OVar1 >> 0x1a,(uint)OVar1 << 6),3);
}

void Ofunc_8000c850(float param_1)

{
  ulonglong uVar1;
  float fVar2;
  undefined4 in_v1_hi;
  uint uVar3;
  OSTime OVar4;
  u64 uVar5;
  u64 uVar6;
  
  param_1 = param_1 * 1000000.0f;
  OVar4 = osGetTime();
  uVar5 = udivdi3(CONCAT44((int)(OVar4 >> 0x20) << 6 | (uint)OVar4 >> 0x1a,(uint)OVar4 << 6),3000);
  fVar2 = INT_MAX_f;
  uVar1 = CONCAT44(in_v1_hi,(int)uVar5);
  do {
    if (param_1 < fVar2) {
      uVar3 = (uint)param_1;
    }
    else {
      uVar3 = (int)(param_1 - fVar2) | 0x80000000;
    }
    OVar4 = osGetTime();
    uVar6 = udivdi3(CONCAT44((int)(OVar4 >> 0x20) << 6 | (uint)OVar4 >> 0x1a,(uint)OVar4 << 6),3000)
    ;
  } while ((false) ||
          (((uint)(uVar6 >> 0x20) == (uint)(CONCAT44(in_v1_hi,(int)uVar6) < uVar1) &&
           ((uint)((int)uVar6 - (int)uVar5) < uVar3))));
}

#endif
//now, to more sensible programming.
void minimap_struct_init_or_free(bool param_1,s16 param_2){
  if (param_2 == -1) {
    if (param_1 == false) passto_minimap_struct_free(&MinimapStruct);
    else minimap_struct_init(&MinimapStruct);
  }
}

void minimap_struct_init_2(void){minimap_struct_init_or_free(true,-1);}
void minimap_struct_free_2(void){minimap_struct_init_or_free(false,-1);}