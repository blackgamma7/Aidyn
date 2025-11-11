#include "globals.h"


void BorgMaps::GetMapTerrain(short a,short b) {
  mapDataList *pmVar1;
  u16 i = 0;
  while( true ) {
    if ((MapDataList_pointer[i].borg5 == 0) && (MapDataList_pointer[i].borg9 == 0)) {
      CRASH("GetMapTerrain","ZoneNotFound");
    }
    pmVar1 = MapDataList_pointer + i;
    if (((uint)pmVar1->mapShortA == (int)a) && ((uint)pmVar1->MapShortB == (int)b)) break;
    i++;
  }
  World::SetTerrain(TerrainPointer,(char)pmVar1->terrian);
  gGlobals.gameVars.weather.skyBgdat = 1;
  gGlobals.sky.Type = 3;
  if (false) { //?
    gGlobals.gameVars.weather.skyBgdat = 1;
    gGlobals.sky.Type = 3;
    return;
  }
  switch(MapDataList_pointer[i].terrian) {
  case 3:
  case 0x1a:
    gGlobals.gameVars.weather.skyBgdat = 3;
    break;
  case 4:
    gGlobals.gameVars.weather.skyBgdat = 5;
    break;
  case 6:
  case 0xb:
  case 0xd:
  case 0xe:
  case 0xf:
  case 0x10:
    gGlobals.gameVars.weather.skyBgdat = 6;
    goto BGType4;
  case 8:
    gGlobals.gameVars.weather.skyBgdat = 7;
    goto BGType4;
  case 9:
    gGlobals.gameVars.weather.skyBgdat = 8;
BGType4:
    gGlobals.sky.Type = 4;
    break;
  case 10:
    gGlobals.gameVars.weather.skyBgdat = 4;
    break;
  case 0x12:
    gGlobals.gameVars.weather.skyBgdat = 2;
  }
}

void BorgMaps::ClearMapIndecies(void) {
  for(s16 i=0;i<22;i++){
    for(s16 j=0;j<30;j++){
        gLoadedMapIndecies[i][j][0]=0;
        gLoadedMapIndecies[i][j][1]=0;
        gLoadedMapIndecies[i][j][2]=0;
    }
  }
}

void BorgMaps::WriteMapIndecies(mapDataList *param_1) {
  MapDataList_pointer = param_1;
  ClearMapIndecies();
  while( (param_1->mapShortA != 0) || (param_1->MapShortB != 0) ) {
    gLoadedMapIndecies[param_1->mapShortA][param_1->MapShortB][0] = param_1->borg5;
    gLoadedMapIndecies[param_1->mapShortA][param_1->MapShortB][1] = param_1->borg9;
    gLoadedMapIndecies[param_1->mapShortA][param_1->MapShortB][2] = param_1->borg5_2;
    param_1++;
  }
}

u16 BorgMaps::GetMapData(mapDataList *m,u16 shortA,u16 shortB,u16 offset,ushort map) {
  ushort *puVar3 = &m->mapShortA + offset;///perhaps struct was actually array?
  for(s16 i=0;((m->mapShortA != shortA) && (m->MapShortB != shortB));i++){
    if((m->mapShortA == 0) && (m->MapShortB == 0)){
        char buff [296];
        sprintf(buff,"GetMapData()\nData not Found\nC = %d, map = %d, x = %d, y = %d",i,map,shortA,shortB);
        CRASH(buff,"./src/borgmaps.cpp");
    }
    puVar3 = puVar3 + 6;
    m++;
  }
  return *puVar3;
}


u16 BorgMaps::GetMapList(s16 map,s16 a,s16 b) {
  u16 uVar1;
  mapDataList *m;
  
  switch(map) {
  case 0:
    m = gMapDataListOverworld;
    break;
  case 1:
    m = gMapDataListGoblinCamp;
    break;
  case 2:
    m = mapDataList_2;
    break;
  case 3:
    m = mapDataList_3;
    break;
  case 4:
    m = map_data_list_gwen;
    break;
  case 5:
    m = mapDataList_5;
    break;
  case 6:
    m = mapDataList_6;
    break;
  case 7:
    m = mapDataList_7;
    break;
  case 8:
    m = mapDataList_8;
    break;
  case 9:
    m = mapDataList_9;
    break;
  case 10:
    m = mapDataList_10;
    break;
  case 0xb:
    m = mapDataList_mageSchool;
    break;
  case 0xc:
    m = mapDataList_ehud;
    break;
  case 0xd:
    m = mapDataList_13;
    break;
  case 0xe:
    m = mapDataList_14;
    break;
  case 0xf:
    m = gMapDataListChaosIsle;
    break;
  case 0x10:
    m = gMapDataListBattle;
    break;
  default:
    CRASH("borgmaps.cpp","Invalid Map!");
  }
  return GetMapData(m,a,b,4,map);
}


void BorgMaps::SetBGM(u16 *param_1,u16 param_2,u16 ExpPak,u16 NoExpPak) {
  u16 uVar1;
  u16 *puVar2;
  
  if (gGlobals.gameVars.gamemodeType != 2) {
    uVar1 = *param_1;
    puVar2 = param_1 + 1;
    while (uVar1 != 0) {
      if (uVar1 == param_2) {
        gGlobals.gameVars.Borg12Next = ExpPak;
        if (!gExpPakFlag) gGlobals.gameVars.Borg12Next = NoExpPak;
      }
      uVar1 = *puVar2;
      puVar2++;
    }
  }
}


u16 BorgMaps::LoadMap(s16 Map,s16 Portal,s16 param_3,bool param_4) {
  ushort uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  bool bVar5;
  mapDataList *pmVar6;
  int B;
  uint i;
  ushort *puVar7;
  ushort *puVar8;
  ushort uVar9;
  ushort uVar10;
  mapDataList *pmVar11;
  float spawnz;
  float spawnx;
  ushort BgmArr [6];
  u16 auStack_80 [2];
  undefined4 auStack_7c [15];
  int iStack_40;
  
  uVar10 = 0;
  uVar9 = 0;
  bVar5 = false;
  spawnz = 0.0;
  iStack_40 = 0;
  spawnx = 0.0;
  if (!param_4) {
    gGlobals.gameVars.Borg12Next = 0xffff;
    gGlobals.gameVars.mapCellSize.y = 100.0f;
    gGlobals.gameVars.mapCellSize.x = 100.0f;
    gGlobals.gameVars.mapDatA = Map;
  }
  Gsprintf("map = %d, portal = %d",Map,Portal);
  pmVar11 = NULL;
  switch(Map) {
  case MAPA_Overworld:
    pmVar11 = gMapDataListOverworld;
    if (!param_4) {
      WriteMapIndecies(gMapDataListOverworld);
      gGlobals.gameVars.mapCellSize.x = 100.0f;
      gGlobals.gameVars.mapCellSize.y = 100.0f;
    }
    bVar5 = true;
    switch((Portal + 1)) {
    case 0:
      bVar5 = false;
      break;
    case 1:
      uVar10 = 9;
      uVar9 = 8;
      spawnz = 62.0f;
      spawnx = 16.0f;
      break;
    case 2:
      uVar10 = 1;
      uVar9 = 4;
      spawnz = 17.0f;
      spawnx = 39.0f;
      break;
    case 3:
      uVar10 = 1;
      uVar9 = 0xf;
      spawnz = 75.0f;
      spawnx = 21.0f;
      break;
    case 4:
      uVar10 = 8;
      uVar9 = 0xd;
      spawnz = 50.0f;
      spawnx = 50.0f;
      break;
    case 5:
      uVar10 = 9;
      uVar9 = 9;
      spawnz = 50.0f;
      spawnx = 50.0f;
      break;
    case 6:
      uVar10 = 0x10;
      uVar9 = 0x1a;
      spawnz = 50.0f;
      spawnx = 50.0f;
      break;
    case 7:
      uVar9 = 0x17;
      spawnx = 26.0f;
      goto LAB_8002ce68;
    case 8:
      uVar10 = 1;
      goto LAB_8002cc40;
    case 9:
      uVar10 = 2;
LAB_8002cc40:
      uVar9 = 0x16;
      spawnz = 50.0f;
      spawnx = 50.0f;
      break;
    case 10:
      uVar10 = 0x11;
      uVar9 = 0x15;
      spawnz = 50.0f;
      spawnx = 20.0f;
      break;
    case 0xb:
      uVar10 = 3;
      uVar9 = 8;
      spawnz = 45.0f;
      spawnx = 60.0f;
      break;
    case 0xc:
      uVar10 = 3;
      uVar9 = 0xf;
      spawnz = 60.0f;
      spawnx = 60.0f;
      break;
    case 0xd:
      uVar10 = 9;
      uVar9 = 0x12;
      spawnz = 50.0f;
      spawnx = 50.0f;
      break;
    case 0xe:
      uVar10 = 0x11;
      goto LAB_8002cdf4;
    case 0xf:
      uVar10 = 0xd;
      uVar9 = 8;
      spawnz = 50.0f;
      spawnx = 50.0f;
      break;
    case 0x10:
      uVar10 = 0xd;
      uVar9 = 0x14;
      spawnz = 80.0f;
      spawnx = 20.0f;
      break;
    case 0x11:
      uVar10 = 0x13;
      uVar9 = 0x1a;
      spawnz = 60.0f;
      spawnx = 50.0f;
      break;
    case 0x12:
      uVar10 = 0xd;
      uVar9 = 6;
      spawnz = 67.0f;
      spawnx = 69.0f;
      break;
    case 0x13:
      uVar10 = 0x14;
      uVar9 = 0x1c;
      spawnz = 50.0f;
      spawnx = 50.0f;
      break;
    case 0x14:
      uVar10 = 5;
      uVar9 = 0xe;
      spawnz = 50.0f;
      spawnx = 60.0f;
      break;
    case 0x15:
      uVar10 = 7;
      uVar9 = 0xc;
      spawnz = 90.0f;
      spawnx = 67.0f;
      break;
    case 0x16:
      uVar10 = 3;
      uVar9 = 9;
      spawnz = 68.0f;
      spawnx = 29.0f;
      break;
    case 0x17:
      uVar10 = 0x10;
      uVar9 = 0x1b;
      spawnz = 82.0f;
      spawnx = 77.0f;
      break;
    case 0x18:
      uVar10 = 0x10;
      uVar9 = 0x11;
      spawnz = 48.0f;
      spawnx = 85.0f;
      break;
    case 0x19:
      uVar10 = 0xf;
      uVar9 = 0x19;
      spawnz = 53.0f;
      spawnx = 22.0f;
      break;
    case 0x1a:
      uVar10 = 0x13;
LAB_8002cdf4:
      uVar9 = 0x10;
      spawnz = 50.0f;
      spawnx = 50.0f;
      break;
    case 0x1b:
      uVar10 = 0x12;
      uVar9 = 0x15;
      spawnz = 88.0f;
      spawnx = 12.0f;
      break;
    case 0x1c:
      uVar10 = 0xc;
      uVar9 = 0x10;
      spawnz = 36.0f;
      spawnx = 26.0f;
      break;
    case 0x1d:
      uVar10 = 0xe;
      uVar9 = 0x1b;
      spawnz = 72.0f;
      spawnx = 72.0f;
      break;
    case 0x1e:
      uVar9 = 8;
      spawnx = 97.0f;
LAB_8002ce68:
      uVar10 = 6;
      spawnz = 52.0f;
    }
    u16 BgmArr[]={0x10b5,0x10d1,0x10d4,0x10d7,0x10ee,0x10f1,0x10f4,0x10f8,0x1118,0x111b,
        0x111e,0x1122,0x114d,0,0x10dc,0x10e0,0x10e3,0x10fc,0x10fe,0x1102,0x1125,0x1128,
        0x112f,0x1150,0x1153,0x1156,0x1172,0x117b,0x117e,0x1181,0x1189,0x1192,0x1195,
        0x119b,0x11a4,0x11a8,0};
    SetBGM(BgmArr,gLoadedMapIndecies[gGlobals.gameVars.mapShort1][(short)gGlobals.gameVars.mapShort2][0],
      0x62c,0x62d);
    SetBGM(BgmArr,gLoadedMapIndecies[gGlobals.gameVars.mapShort1][(short)gGlobals.gameVars.mapShort2][0],
           0x5ea,0x5eb);
    break;
  case MAPA_GoblinCamp:
    pmVar11 = gMapDataListGoblinCamp;
    goto LAB_8002d4e0;
  case MAPA_PortSaiid:
    pmVar11 = mapDataList_2;
    goto LAB_8002d4e0;
  case MAPA_Lighthouse:
    pmVar11 = mapDataList_3;
    goto LAB_8002d4e0;
  case MAPA_GwerniaCastle:
    gGlobals.gameVars.Borg12Next = 0x5fd;
    pmVar11 = map_data_list_gwen;
    if (param_4) goto LAB_8002d65c;
    WriteMapIndecies(map_data_list_gwen);
    MINIMAP.LoadData(minimaps_gwen);
    iStack_40 = 1;
    break;
  case MAPA_GwerniaInterior:
    pmVar11 = mapDataList_5;
    goto LAB_8002d4e0;
  case MAPA_Interior:
    if (!param_4) {
      iStack_40 = 1;
      gGlobals.gameVars.mapCellSize.y = 500.0f;
      gGlobals.gameVars.mapCellSize.x = 500.0f;
      WriteMapIndecies(mapDataList_6);
      MINIMAP.LoadData(MinimapSec_dat_ARRAY_800ee508);
    }
    bVar5 = true;
    pmVar11 = mapDataList_6;
    if (Portal == 0) {
      uVar10 = 5;
      uVar9 = 3;
      spawnz = 3.0f;
      spawnx = 5.9f;
    }
    else if (Portal < 1) {
      if (Portal == -1) {
        bVar5 = false;
      }
    }
    else if (Portal == 1) {
      uVar10 = 1;
      uVar9 = 1;
      spawnz = 5.0f;
      goto LAB_8002d5fc;
    }
    break;
  case MAPA_Erromon:
    gGlobals.gameVars.Borg12Next = 0x790;
    pmVar11 = mapDataList_7;
    if (!param_4) {
      iStack_40 = 1;
      gGlobals.gameVars.mapCellSize.y = 30.0f;
      gGlobals.gameVars.mapCellSize.x = 30.0f;
      WriteMapIndecies(mapDataList_7);
      MINIMAP.LoadData(MinimapSec_erromon);
    }
    bVar5 = true;
    pmVar6 = pmVar11;
    if (Portal == -1) {
LAB_8002d464:
      pmVar11 = pmVar6;
      bVar5 = false;
    }
    else if (Portal == 0) {
      uVar10 = 1;
      uVar9 = 0xf;
      spawnz = 25.0f;
      spawnx = 13.0f;
    }
    break;
  case MAPA_8:
    pmVar11 = mapDataList_8;
    if (param_4) goto LAB_8002d65c;
    gGlobals.gameVars.mapCellSize.y = 200.0f;
    gGlobals.gameVars.mapCellSize.x = 200.0f;
    WriteMapIndecies(mapDataList_8);
    break;
  case MAPA_Barrows:
    pmVar11 = mapDataList_9;
    if (!param_4) {
      iStack_40 = 1;
      gGlobals.gameVars.mapCellSize.y = 25.0f;
      gGlobals.gameVars.mapCellSize.x = 25.0f;
      WriteMapIndecies(mapDataList_9);
      MINIMAP.LoadData(minimap_sec_Barrows);
    }
    pmVar6 = pmVar11;
    if (Portal == -1) goto LAB_8002d464;
    if (Portal == 0) {
      uVar10 = 4;
      uVar9 = 1;
      spawnz = 10.0f;
      goto LAB_8002d5fc;
    }
    bVar5 = false;
    break;
  case MAPA_RoogCave:
    pmVar11 = mapDataList_10;
    if (param_4) goto LAB_8002d65c;
    WriteMapIndecies(mapDataList_10);
    MINIMAP.LoadData(MinimapSec_dat_ARRAY_800ee55c);
    iStack_40 = 1;
    break;
  case MAPA_JundarInteriors:
    pmVar11 = mapDataList_mageSchool;
    if (!param_4) {
      WriteMapIndecies(mapDataList_mageSchool);
      MINIMAP.LoadData(minimap_sec_mageschool);
      iStack_40 = 1;
    }
    bVar5 = true;
    if (Portal == -1) {
      bVar5 = false;
    }
    else if (Portal == 0) {
      uVar10 = 1;
      uVar9 = 1;
      spawnz = 15.0f;
      spawnx = 16.0f;
    }
    BgmArr[0] = USHORT_ARRAY_800da7d0[0];
    BgmArr[1] = USHORT_ARRAY_800da7d0[1];
    BgmArr[2] = USHORT_ARRAY_800da7d0[2];
    BgmArr[3] = USHORT_ARRAY_800da7d0[3];
    BgmArr[4] = USHORT_ARRAY_800da7d0[4];
    BgmArr[5] = USHORT_ARRAY_800da7d0[5];
    SetBGM(BgmArr,
           gLoadedMapIndecies[gGlobals.gameVars.mapShort1][(short)gGlobals.gameVars.mapShort2][0],
           0x61c,0x61c);
    break;
  case MAPA_EhudUnder:
    pmVar11 = mapDataList_ehud;
    gGlobals.gameVars.Borg12Next = 0x5df;
    gGlobals.gameVars.mapCellSize.y = 1000.0f;
    gGlobals.gameVars.mapCellSize.x = 1000.0f;
    if (!param_4) {
      WriteMapIndecies(mapDataList_ehud);
      MINIMAP.LoadData(MinimapSec_ehud);
      iStack_40 = 1;
    }
    bVar5 = true;
    pmVar6 = pmVar11;
    if (Portal == -1) goto LAB_8002d464;
    if (Portal == 0) {
      uVar10 = 0x11;
      uVar9 = 1;
      spawnz = 5.0f;
      goto LAB_8002d5fc;
    }
    break;
  case MAPA_Ugairt:
    pmVar11 = mapdatalist_13;
    gGlobals.gameVars.Borg12Next = 0x61b;
    if (!param_4) {
      WriteMapIndecies(mapdatalist_13);
    }
    bVar5 = true;
    pmVar6 = mapdatalist_13;
    if (Portal == -1) goto LAB_8002d464;
    if (Portal == 0) {
      uVar10 = 0xd;
      uVar9 = 5;
      spawnz = 82.0f;
      spawnx = 10.0f;
    }
    break;
  case MAPA_Ugairt2:
    pmVar11 = mapDataList_14;
    if (param_4) goto LAB_8002d65c;
    WriteMapIndecies(mapDataList_14);
    MINIMAP.LoadData(MinimapSec_dat_ARRAY_800edf0c);
    iStack_40 = 1;
    pmVar11 = mapDataList_14;
    break;
  case MAPA_ChoasIsle:
    if ((gGlobals.gameVars.mapShort2 & 2) == 0) {
      gGlobals.gameVars.Borg12Next = 0x5d7;
    }
    else {
      gGlobals.gameVars.Borg12Next = 0x5d5;
    }
    pmVar11 = gMapDataListChaosIsle;
LAB_8002d4e0:
    if (param_4) goto LAB_8002d65c;
    WriteMapIndecies(pmVar11);
    break;
  case MAPA_Battle:
    pmVar11 = gMapDataListBattle;
    if (!param_4) {
        u16 battleBgm[5];
      B = 5;
      if (gExpPakFlag == 0) {
        B = 4;
        battleBgm[0] = BORG12_Battle_NoExp1;
        battleBgm[1] = BORG12_Battle_NoExp2;
        battleBgm[2] = BORG12_Battle_NoExp3;
        battleBgm[3] = BORG12_Battle_NoExp4;
      }
      else {
        battleBgm[0] = BORG12_Battle_Exp1;
        battleBgm[1] = BORG12_Battle_Exp2;
        battleBgm[2] = BORG12_Battle_Exp3;
        battleBgm[3] = BORG12_Battle_Exp4;
        battleBgm[4] = BORG12_Battle_Exp5;
      }
      gGlobals.gameVars.Borg12Next = battleBgm[RAND.MultiByB(B)];
      gGlobals.gameVars.mapCellSize.y = 150.0f;
      gGlobals.gameVars.mapCellSize.x = 150.0f;
      WriteMapIndecies(gMapDataListBattle);
    }
    bVar5 = true;
    if (Portal != -1) {
      uVar10 = gMapDataListBattle[Portal].mapShortA;
      uVar9 = gMapDataListBattle[Portal].MapShortB;
      spawnz = 20.0f;
LAB_8002d5fc:
      bVar5 = true;
      spawnx = spawnz;
    }
  }
  if (!param_4) {
    if (bVar5) {
      gGlobals.gameVars.mapShort1 = uVar10;
      gGlobals.gameVars.mapShort2 = uVar9;
      gGlobals.gameVars.playerPos2d.x = spawnx;
      gGlobals.gameVars.playerPos2d.y = spawnz;
    }
    if ((iStack_40 == 0) && (gGlobals.minimap.active)) {
      MINIMAP.Free();
    }
    gGlobals.gameVars.mapShort2Copy = gGlobals.gameVars.mapShort2;
    gGlobals.gameVars.mapShort1Copy = gGlobals.gameVars.mapShort1;
    return 0;
  }
LAB_8002d65c:
  if (!bVar5) {
    uVar10 = gGlobals.gameVars.mapShort1;
    uVar9 = gGlobals.gameVars.mapShort2;
  }
  if (**(short **)pmVar11 != 0) {
    i = 0;
    do {
      puVar7 = *(ushort **)(&pmVar11->mapShortA + i * 2);
      i = i + 1 & 0xffff;
      if ((*puVar7 == uVar10) && (puVar7[1] == uVar9)) {
        return puVar7[4];
      }
    } while (**(short **)(&pmVar11->mapShortA + i * 2) != 0);
  }
  CRASH("borgmaps.cpp","Couldn't find a zone to load!!!!!");
}

