#pragma once
#include "n64Borg.h"

//combine headers for lensflare, cloud and skyobjects scripts

struct lensflare_data {
    u8 imgIndex;
    float f0;
    float f1;
    Color32 col;
};

extern lensflare_data gLensFlareData[];
extern vec2f gLensFlarePos;
extern Borg8Header** gLensflare;

extern u8 lensflare_bss;

namespace Lensflare{
    void Init();
    void Free();
    Gfx* Render(Gfx*);
};

enum CloudType{
    CloudTypeA,CloudTypeB,CloudTypeC,CloudTypeEND
};

struct cloudStruct {
    u8 index; //which image to use for this cloud
    vec3f v3; //y always 10 and never used
    u32 unused; //always 0, never read/written
    Color32 col; //only alpha used, R/G/B drawn instead from gGlobals.sky.colors[3]
    float f3; //visibility in sky?
};


extern u16 gCloudCount;
extern Borg8Header** gCloudBorg8;
extern cloudStruct gCloudData[];

extern Borg8Header* gCloudBorg8Base[3];

namespace Clouds{
    void Init();
    void Free();
    Gfx* Render(Gfx*);
    void CalcWind();
};

struct SkyobjectStruct {
    u8 index;
    float f0; //brightness? stars always .2(then changed to .19), sun/moon 1.0
    vec2f pos;
    Color32 col; //always {250,250,250,250}. Sun uses gGlobals.sky.colors[4]
};

enum SkyObjType{
    SkyObj_Sun,SkyObj_Moon,SkyObj_Star,SkyObjEND
};

extern u16 gSkyObjectMoonIndex;
extern u16 gSkyobjectsCount;
extern u8 moon_phase;
extern Borg8Header* sjyobjects_borg8;
extern Borg8Header* gMoonBorg8;
extern SkyobjectStruct* gSunObjP;
extern SkyobjectStruct* gMoonObjP;
extern SkyobjectStruct skyobjectStruts[94];

extern Borg8Header* sSkyObjBss[3];

namespace Skyobjects{
    void Init();
    void Free();
    Gfx* Render(Gfx*);
    void UpdateSunMoon();
    void UpdateSun();
    void UpdateMoon();
};
