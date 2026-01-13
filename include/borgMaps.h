#include "typedefs.h"


//data for each map "chunk".
union mapDataList {
    struct{
    u16 mapShortA;
    u16 MapShortB;
    u16 borg5;
    u16 borg5_2;
    u16 borg9;
    u16 terrian;};
    u16 arr[6]; //sometimes called as array.
};
//TODO: define lists. And give some better names.

extern mapDataList mapDataList_Overworld[];
extern mapDataList mapDataList_GoblinCamp[];
extern mapDataList mapDataList_PortSaiid[];
extern mapDataList mapDataList_Lighthouse[];
extern mapDataList mapDataList_GwerniaCastle[];
extern mapDataList mapDataList_GwerniaInteriors[];
extern mapDataList mapDataList_MiscInteriors[];
extern mapDataList mapDataList_Erromon[];
extern mapDataList mapDataList_Terminor[];
extern mapDataList mapDataList_Barrow[];
extern mapDataList mapDataList_RoogsCave[];
extern mapDataList mapDataList_JundarInteriors[];
extern mapDataList mapDataList_EhudTower[];
extern mapDataList mapDataList_Ugarit[];
extern mapDataList mapDataList_Ugarit2[];
extern mapDataList mapDataList_ChaosIsle[];
extern mapDataList mapDataList_Battlefeild[];


extern u16 gLoadedMapIndecies[22][30][3];
extern mapDataList* MapDataList_pointer;

namespace BorgMaps{
    void GetMapTerrain(s16,s16);
    void ClearMapIndecies();
    void WriteMapIndecies(mapDataList *);
    u16 GetMapData(mapDataList *m,u16 shortA,u16 shortB,u16 offset,u16 map);
    u16 GetMapList(s16 map,s16 a,s16 b);
    void SetBGM(u16*,u16,u16,u16);
    u16 LoadMap(s16 Map_,s16 Portal_,s16 param_3,bool param_4);
};