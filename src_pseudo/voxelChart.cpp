#include "voxelChart.h"
#include "stringN64.h"

void voxelChart_sub(u8 *x,u8 *y,u8 BCD){
  *x = ((BCD >> 4) - 1) + *x;
  *y = ((BCD & 3) - 1) + *y;
}


void memset_voxelChart(void){
  for(s16 i=0;i<VCHARTCOUNT;i++) {
    CLEAR(&voxelChart[i]);
    voxelChartIndecies[i] = i;
  }
  voxelChartIndex = 0;
}


VoxelChartEntry *
WriteTo_VoxelChart(u16 param_1,u8 mapDatA,u8 mapShortA,u8 MapShortB,u8 BCD,u8 VOBJECT,u8 param_7){
  u8 mapShorts [2];
  
  VoxelChartVar++;
  mapShorts[0] = mapShortA;
  mapShorts[1] = MapShortB;
  if (voxelChartIndex < VCHARTCOUNT) {
    voxelChart_sub(mapShorts,mapShorts + 1,BCD);
    VoxelChartVar = 0;
    u8 index = voxelChartIndecies[voxelChartIndex++];
    voxelChart[index].arg0 = param_1;
    voxelChart[index].bool0x2 = true;
    voxelChart[index].arg7 = param_7;
    voxelChart[index].MapDatA = mapDatA;
    voxelChart[index].type = VOBJECT;
    voxelChart[index].MapShortA = mapShorts[0];
    voxelChart[index].MapShortB = mapShorts[1];
    return &voxelChart[index];
  }
  else {
    switch (VoxelChartVar){
     case 1:
      clear_VoxelChart_entry_Vobject(5); //wandernode
      break;
     case 2:
      clear_VoxelChart_entry_Vobject(9); //dialouge
      break;
     case 3:
      memset_voxelChart(); //all entries
      break;
    default:
      break;
    }
    return WriteTo_VoxelChart(param_1,mapDatA,mapShorts[0],mapShorts[1],BCD,VOBJECT,param_7);
  }
}

VoxelChartEntry *
passto_WriteTo_VoxelChart(u16 param_1,u8 mapdatA,u8 mapShortA,u8 MapShortB,u8 BCD,u8 Vobject,u8 param_7){
  return WriteTo_VoxelChart(param_1,mapdatA,mapShortA,MapShortB,BCD,Vobject,param_7);
}

void memset_voxelChart_entries(void){
  for(s16 i=0;i<VCHARTCOUNT;i++){
    VoxelChartEntry *x= &voxelChart[i];
    if ((x->bool0x2) &&
       (x->arg7--, (int)((uint)x->arg7 << 0x18) < 1)) {
      CLEAR(x);
      voxelChartIndecies[--voxelChartIndex] = i;
    }
  }
}


bool some_monsterparty_checker(u16 param_1,u8 mapDatA,u8 MapShortA,u8 MapShortB,u8 BCD,u8 type){
  u8 mapShorts[2]={MapShortA,MapShortB};
  voxelChart_sub(&mapShorts[0],&mapShorts[1],BCD);
  for(u16 i=0;i<VCHARTCOUNT;i++){
    if((voxelChart[i].bool0x2)&&(voxelChart[i].arg0==param_1)&&
       (voxelChart[i].MapDatA==mapDatA)&&(voxelChart[i].MapShortA==mapShorts[0])
    &&(voxelChart[i].MapShortB==mapShorts[1])&&(voxelChart[i].type==type))
       return true;
}
return false;
}

VoxelChartEntry * some_ref_obj_lookup_func(u16 param_1,u8 mapDatA,u8 MapShortA,u8 MapShortB,u8 BCD,u8 type){
  u8 mapShorts[2]={MapShortA,MapShortB};
  voxelChart_sub(&mapShorts[0],&mapShorts[1],BCD);
  for(u16 i=0;i<VCHARTCOUNT;i++){
    if((voxelChart[i].bool0x2)&&(voxelChart[i].arg0==param_1)&&
       (voxelChart[i].MapDatA==mapDatA)&&(voxelChart[i].MapShortA==mapShorts[0])
    &&(voxelChart[i].MapShortB==mapShorts[1])&&(voxelChart[i].type==type))
       return &voxelChart[i];
}
return NULL;
}

bool Ofunc_8005fd98(u16 param_1,u8 mapDatA,u8 MapShortA,u8 MapShortB,u8 BCD,u8 type){
  u8 mapShorts[2]={MapShortA,MapShortB};
  voxelChart_sub(&mapShorts[0],&mapShorts[1],BCD);
  for(u16 i=0;i<VCHARTCOUNT;i++){
    if((voxelChart[i].bool0x2)&&(voxelChart[i].arg0==param_1)&&
       (voxelChart[i].MapDatA==mapDatA)&&(voxelChart[i].MapShortA==mapShorts[0])
    &&(voxelChart[i].MapShortB==mapShorts[1])&&(voxelChart[i].type==type)){
        CLEAR(&voxelChart[i]);
        voxelChartIndecies[--voxelChartIndex]=i;
        return true;
    }

}
return false;
}

void clear_VoxelChart_entry_Vobject(u8 param_1){
  for(s16 i=0;i<VCHARTCOUNT;i++){
    VoxelChartEntry *x= &voxelChart[i];
    if ((x->bool0x2) &&
       (x->type==param_1)) {
      CLEAR(x);
      voxelChartIndecies[--voxelChartIndex] = i;
    }
  }
}