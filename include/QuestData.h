#include "typedefs.h"

#define SNAPSHOT_H 0x40
#define SNAPSHOT_V 0x20
//size of 16-bit snapshot.
#define SNAPSHOT_SIZE (SNAPSHOT_H*SNAPSHOT_V*2)

//used for thumbnail of save file
void* gQuestdataSnapshot=NULL;
u32 LoadedGameSaveFlag=false;
WeatherTemp gWeatherTemp;