#include "skyObjects.h"
#include "globals.h"
#define FILENAME "./src/skyobjects.cpp"

u16 gSkyObjectMoonIndex=0;
u16 gSkyobjectsCount=0;
u8 moon_phase=3;
Borg8header** skyobjects_borg8 =NULL;
Borg8header* pStarObjP=NULL;
SkyobjectStruct* gSunObjP=NULL;
SkyobjectStruct* gMoonObjP=NULL;

//will add script and Skyobject LUT later