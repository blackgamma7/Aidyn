#include "globals.h"
#include "world.h"
#include "stringN64.h"


u8 DAT_800e8d50[]={0,0,0,0,1,0,0,0};//unused data, seen at start of section.
u16 SkillCheckSteps[]={0,26,46,62,81,96,111,122,
     133,144,155,166,177,188,199,210,221,232,243,255,266,0};
char* sGlobalsFmt="%s - %d";
char* sGlobalsFilename="./src/globals.cpp";

#ifdef DEBUGVER
u32 memUsedMirror=0;
u64 DAT_800e8d90=0;//unused, but 64-bit space from vars
u64 ofunc_dat=0;
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

//gGlobals.rngSeed.func() with a compare. should return an int between and including A and B.
u32 rand_range(u32 A,u32 B){
  if (A != B) A = RAND.func(A,B); //reduncant check? also in Random::func()
  return A;
  }

//several random functions use "dice notation" for their calculations.
u16 RollD(u8 dice,u8 sides){
  u16 i = 0;
  for(u8 j = 0; j < dice; j++){i+= rand_range(1,sides);}
  return i;
}


u32 some_skillcheck_calc(s16 param_1){
  u32 i = 21;
  do {
    if (i == 0) break;
    i--;
  } while (param_1 < SkillCheckSteps[i]);
  return i+1;
}

//used several times throughout this part. not sure why.
#define printLine(line) Gsprintf(sGlobalsFmt,sGlobalsFilename,line)

void get_battle_terrain(EncounterDat *param_1){
  printLine(487);
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
    param_1->battlefield = rand_range(0xe,0xf);
    break;
  case 4:
    param_1->battlefield = 0x13;
    break;
  case 5:
  case 0x11:
    param_1->battlefield = rand_range(4,5);
    break;
  case 6:
    param_1->battlefield = 0x12;
    break;
  case 7:
    param_1->battlefield = rand_range(6,7);
    break;
  case 8:
    param_1->battlefield = rand_range(0xc,0xd);
    break;
  case 9:
    param_1->battlefield = 0x11;
    break;
  case 10:
    param_1->battlefield = 0x10;
    break;
  case 0xb:
    param_1->battlefield = 0x17;
    break;
  case 0xc:
    param_1->battlefield = 0x16;
    break;
  case 0xd:
  case 0x19:
    param_1->battlefield = 0x1b;
    break;
  case 0xe:
    param_1->battlefield = 0x18;
    break;
  case 0xf:
    param_1->battlefield = 0x19;
    break;
  case 0x10:
    param_1->battlefield = 0x1a;
    break;
  case 0x12:
    param_1->battlefield = 0x14;
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
  printLine(595);
}


u32 get_enemy_avg_lv(u16 param_1,monsterparty_dat *param_2){
  u16 uVar1;
  byte bVar3;
  int iVar2;
  u16 uVar4;
  ItemID *pIVar5;
  int iVar6;
  u16 uVar7;
  monsterpartyEntry *pmVar9;
  float fVar10;
  float afStack_78 [16];
  u32 uStack_38;
  
  uVar4 = 0;
  printLine(600);
  uVar7 = 0;
  uVar1 = PARTY->GetAvgLevel();
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
        bVar3 = GETINDEX(gGlobals.EncounterDat.enemy_entities[uVar7]);
        printLine(0x264);
        uVar4 += gEntityDB->entities[bVar3].Level;
      }
    }
    printLine(0x268);
    uVar4 /= param_1;
    printLine(0x26b);
    if ((uVar4 != 0) &&
       (printLine(0x26e),uVar1 < uVar4)) {
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
          if (pmVar9->enemyID) {
            uVar4 = 0;
            iVar6 = 0;
            printLine(0x281);
            printLine(0x284);
            iVar2 = 0;
            if (param_1) {
              for(uVar4=0;uVar4<param_1;uVar4++){
                if (gGlobals.EncounterDat.enemy_entities[uVar4] ==pmVar9->enemyID) {
                  iVar6++;
                }
              }
            }
            uVar4 = 0;
            printLine(0x28a);
            iVar2 = (int)((float)iVar6 * fVar10);
            printLine(0x28c);
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
                  param_1--;
                  printLine(0x297);
                  printLine(0x298);
                  printLine(0x29b);
                  pIVar5 = gGlobals.EncounterDat.enemy_entities + param_1;
                  pIVar5 = 0;
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


u32 add_to_enemy_encounters(EncounterDat *param_1,monsterparty_dat *param_2){
  u16 n = 0;
  u32 i = 0;
  printLine(676);
  printLine(678);
  for(;i<6;i++) {
    printLine(681);
    printLine(682);
    if (param_2->enemyEntries[i].enemyID) {
      printLine(685);
      for(u32 j=0;j<param_2->enemyEntries[i].min;j++){
        printLine(688);
        param_1->enemy_entities[n++] = param_2->enemyEntries[i].enemyID;
        printLine(691);
        if (param_2->maxsize <= n) return n;
        printLine(694);
        if (0xb < n) return n;
      }
    }
  }
  printLine(699);
  return n;
}

u32 FUN_8000bed0(EncounterDat *param_1,monsterparty_dat *param_2){
  u32 uVar3;
  u16 uVar4;
  u8 uVar5;
  monsterpartyEntry *pIVar6;
  u16 uVar6;
  u16 i;
  
  printLine(0x2c0);
  uVar3 = add_to_enemy_encounters(param_1,param_2);
  printLine(0x2c3);
  if (uVar3 < param_2->maxsize) {
    printLine(0x2c6);
    printLine(0x2c7);
    for(i=0;i<8;i++){
      printLine(0x2ca);
      pIVar6 = param_2->enemyEntries + i;
      printLine(0x2cb);
      uVar4 = uVar3;
      if ((pIVar6->enemyID) &&
         (printLine(0x2ce),
         pIVar6->min < pIVar6->max)) {
        uVar6 = 0;
        printLine(0x2d1);
        uVar5 = rand_range(0,pIVar6->max - pIVar6->min);
        printLine(0x2d4);
        if (uVar5) {
          do {
            printLine(0x2d6);
            uVar4=uVar3 + 1;
            param_1->enemy_entities[uVar3] = pIVar6->enemyID;
            printLine(0x2d9);
            if (param_2->maxsize <= uVar4) return uVar4;
            printLine(0x2da);
            if (0xb < uVar4) return uVar4;
            uVar6++;
            uVar3 = uVar4;
          } while (uVar6 < uVar5);
        }
      }
      uVar3 = uVar4;
    }
    printLine(0x2df);
    if (uVar4 < param_2->minsize) uVar4 = 0;
    else printLine(0x2e2);
  }
  else uVar4 = (u32)param_2->maxsize;
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
    uVar1 = 1;                                 
    gGlobals.EncounterDat.enemy_entities[0] = IDEntInd(Skeleton);
  }
  printLine(0x2f7);
  if (uVar1 < 0xc)
    memset(gGlobals.EncounterDat.enemy_entities + uVar1,0,(0xc - uVar1) * 2);
}


void battle_setup_func(voxelObject *param_1,u16 flag,u16 param_3){
  printLine(0x2fe);
  printLine(0x2ff);
  printLine(0x302);
  gGlobals.EncounterDat.field3_0x1c = 1;
  printLine(0x303);
  gGlobals.EncounterDat.mapDatA = gGlobals.gameVars.mapDatA;
  printLine(0x304);
  gGlobals.EncounterDat.MapSAhortA = gGlobals.gameVars.mapShort1;
  printLine(0x305);
  gGlobals.EncounterDat.MapShortB = gGlobals.gameVars.mapShort2;
  printLine(0x306);
  gGlobals.EncounterDat.globalLoot = (param_1->monster).globalLoot;
  printLine(0x307);
  gGlobals.EncounterDat.EncounterID = flag;
  printLine(0x308);
  gGlobals.EncounterDat.canFlee = true;
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
  Emergency_skeleton_func(&param_1->monster);
  printLine(0x315);
}

struct encounter_rom_dat {
    monsterpartyEntry entries[2];
};
extern monsterpartyEntry globals_rom[];

void load_camp_ambush(void){
  u32 lvTeir;
  encounter_rom_dat fromROM;
  monsterparty_dat toRAM;
  
  get_battle_terrain(&gGlobals.EncounterDat);
  gGlobals.EncounterDat.collisionByte = 2;
  gGlobals.EncounterDat.globalLoot = 0;
  gGlobals.EncounterDat.aniByte = 0;
  gGlobals.EncounterDat.EncounterID = 0;
  gGlobals.EncounterDat.canFlee = false;
  gGlobals.combatBytes[2] = 1;
  u8 ter = World::getTerrain(TerrainPointer);
  u32 lv = PARTY->GetAvgLevel();
  if(lv>20)      lvTeir=4;
  else if(lv>15) lvTeir=3;
  else if(lv>10) lvTeir=2;
  else if(lv>5)  lvTeir=1;
  else           lvTeir=0;
  RomCopy::RomCopy(&fromROM,(void*)((uintptr_t)globals_rom + lvTeir + (ter * 5 & 0xfffU) * 2),8,1,sGlobalsFilename,840);
  CLEAR(&toRAM);
  toRAM.minsize = (u16)fromROM.entries[0].min + (u16)fromROM.entries[1].min;
  toRAM.maxsize = (u16)fromROM.entries[0].max + (u16)fromROM.entries[1].max;
  for(lvTeir=0;lvTeir<2;lvTeir++) {
    toRAM.enemyEntries[lvTeir].enemyID=fromROM.entries[lvTeir].enemyID;
    toRAM.enemyEntries[lvTeir].min=fromROM.entries[lvTeir].min;
    toRAM.enemyEntries[lvTeir].max=fromROM.entries[lvTeir].max;
  }
  Emergency_skeleton_func(&toRAM);
}

u32 AppendText(char *str1,char *str2,u8 len){
  u8 uVar1 = strlen(str1);
  u8 uVar2 = strlen(str2);
  sprintf(str1 + uVar1,"%s\n",str2);
  uVar1 = uVar2;
  if (uVar2 <= len) uVar1 = len;
  return uVar1;
}

#ifdef DEBUGVER
// a few time-measuring funcs left out of retail.

void FUN_8000c6e8(void){
  ofunc_dat = TIME_NSEC;
}

//get delta from call of FUN_8000c6e8
u64 Ofunc_8000c730(void){
  return TIME_NSEC-ofunc_dat;
}
//print (txt) with delta from last call of this func
void Ofunc_8000c788(char *txt){
  Gsprintf("%s : %llu\n",txt,TIME_NSEC-ofunc_dat);
  N64PRINT(gGlobals.text);
  ofunc_dat = TIME_NSEC;
}

//hold for (t) seconds
void Ofunc_8000c850(float t){
  u64 t1,t2;
  t *= 1000000.0f;
  t1 = TIME_USEC;
  do {
    t2 = TIME_USEC;
  } while ((t2-t1)<(u32)t);
}

#endif

void minimap_struct_init_or_free(u8 param_1,s16 param_2){
  if (param_2 == -1) {
    if (param_1 == false) MINIMAP.Init();
    else MINIMAP.Free2();
  }
}
//found at the bottom of .data in an unused table.
void minimap_struct_init_2(void){minimap_struct_init_or_free(true,-1);}
//found at the bottom of .data in an unused table.
void minimap_struct_free_2(void){minimap_struct_init_or_free(false,-1);}