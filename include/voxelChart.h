#include "typedefs.h"

struct VoxelChartEntry {
    short arg0;
    u8 bool0x2;
    u8 arg7;
    u8 MapDatA;
    u8 MapShortA;
    u8 MapShortB;
    u8 type; /* VOBJECT */
    f32 unk0x8;
};
#define VCHARTCOUNT 19
u8 voxelChartIndex=0;
u16 VoxelChartVar=0;
VoxelChartEntry voxelChart[VCHARTCOUNT]={0};
u8 voxelChartIndecies[VCHARTCOUNT]={0};

void voxelChart_sub(u8 *x,u8 *y,u8 BCD);
VoxelChartEntry * WriteTo_VoxelChart(u16 param_1,u8 mapDatA,u8 mapShortA,u8 MapShortB,u8 param_5,u8 VOBJECT,u8 param_7);
VoxelChartEntry * passto_WriteTo_VoxelChart(u16 param_1,u8 mapdatA,u8 mapShortA,u8 MapShortB,u8 param_5,u8 Vobject,u8 param_7);
void memset_voxelChart_entries(void);
bool some_monsterparty_checker(u16 param_1,u8 mapDatA,u8 MapShortA,u8 MapShortB,u8 param_5,u8 type);
VoxelChartEntry * some_ref_obj_lookup_func(u16 param_1,u8 param_2,u8 param_3,u8 param_4,u8 param_5,u8 param_6);
bool Ofunc_8005fd98(u16 param_1,u8 param_2,u8 param_3,u8 param_4,u8 param_5,u8 param_6);
void clear_VoxelChart_entry_Vobject(u8 param_1);