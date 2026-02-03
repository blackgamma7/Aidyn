#include "savefiles.h"
#include "globals.h"
#include "world.h"
#include "memaker.h"

#define SNAPSHOT_H 0x40
#define SNAPSHOT_V 0x20
//size of 16-bit snapshot.
#define SNAPSHOT_SIZE (SNAPSHOT_H*SNAPSHOT_V*2)

//used for thumbnail of save file
void* gQuestdataSnapshot=NULL;
u32 LoadedGameSaveFlag=false;
WeatherTemp gWeatherTemp;

namespace QuestData{
    void Save(u8 *data);
    void Load(u8 *data);
    void SaveVoxelChart(u8 *param_1);
    void LoadVoxelChart(u8 *param_1);
    u8 VerifyChecksum(SaveDatStruct *p);
    void CopySnapshot(void *param_1);
    void SaveItemID(ItemID *param_1,ItemID *param_2);
    void SavePartyPlaytime(SavePartyHeader *param_1);
    void CopyEngineZone(mapFloatDat *param_1,u8 copy);
    void SaveToFile(SaveDatPointers *param_1,u8 param_2);
    u8 InitSaveFile(SaveDatStruct *param_1);
    void SetPointers(SaveDatStruct *param_1,SaveDatPointers *param_2);
    void SetPointers(MemoryMakerStruct *param_1,SaveDatPointers *param_2);
    void LoadFile(SaveDatPointers *param_1,u8 param_2);
    u8 LoadFromMemPak(SaveDatStruct *param_1);
    void TakeSnapshot(void);
    void FreeSnapshot(void);
    void SetWeather(void);  
};