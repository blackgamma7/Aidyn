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

extern mapDataList gMapDataListOverworld[];
extern mapDataList gMapDataListGoblinCamp[];
extern mapDataList mapDataList_2[];
extern mapDataList mapDataList_3[];
extern mapDataList map_data_list_gwen[];
extern mapDataList mapDataList_5[];
extern mapDataList mapDataList_6[];
extern mapDataList mapDataList_7[];
extern mapDataList mapDataList_8[];
extern mapDataList mapDataList_9[];
extern mapDataList mapDataList_10[];
extern mapDataList mapDataList_mageSchool[];
extern mapDataList mapDataList_ehud[];
extern mapDataList mapDataList_13[];
extern mapDataList mapDataList_14[];
extern mapDataList gMapDataListChaosIsle[];
extern mapDataList gMapDataListBattle[];


extern u16 gLoadedMapIndecies[22][30][3];
extern mapDataList* MapDataList_pointer;

namespace BorgMaps{
    void GetMapTerrain(s16,s16);
    void ClearMapIndecies();
    void WriteMapIndecies(mapDataList *);
    u16 GetMapData(mapDataList *m,u16 shortA,u16 shortB,u16 offset,ushort map);
    u16 GetMapList(s16 map,s16 a,s16 b);
    void SetBGM(u16*,u16,u16,u16);
    u16 LoadMap(s16 Map_,s16 Portal_,s16 param_3,bool param_4);
};