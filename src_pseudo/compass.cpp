#define FILENAME "./src/compass.cpp"

#include "compass.h"
#include "globals.h"


namespace Compass{
//Alloc Compass struct and load its images
void Init(void){
  ALLOC(gCompass,101);
  gCompass->ring = loadBorg8(BORG8_CompassRing);
  gCompass->N = loadBorg8(BORG8_CompassNorth);
  gCompass->S = loadBorg8(BORG8_CompassSouth);
  gCompass->E = loadBorg8(BORG8_CompassEast);
  gCompass->W = loadBorg8(BORG8_CompassWest);
}
//draw compass orientation based on camera's
Gfx* Draw(Gfx*g,vec2f *XZ){
  u8 red;
  u8 green;
  u8 blue;
  u16 h;
  u16 v;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  vec2f fStack128;
  
  RSPFUNC6(g);
  g = Borg8_DrawSimple(g,gCompass->ring,241.0,169.0,1.0f,1.0f
                       ,gGlobals.brightness * 255.0f,gGlobals.brightness * 255.0f,
                       gGlobals.brightness * 255.0f,gGlobals.brightness * 80.0f);
  fStack128={1,0};
  fVar3 = vec2_dot(XZ,&fStack128);
  fStack128={0,1};
  fVar4 = vec2_dot(XZ,&fStack128);
  fVar7 = fVar3 * 25.0f;
  fVar3 = fVar3 * 95.0f;
  fVar5 = fVar4 * 25.0f;
  fVar4 = fVar4 * 95.0f;
  red = gGlobals.brightness * 160.0f;
  green = gGlobals.brightness * 160.0f;
  blue = gGlobals.brightness * 220.0f;
  fVar6 = (160.0f - fVar4) * gGlobals.brightness;
  g = Borg8_DrawSimple(g,gCompass->N,(271.0f - fVar7) - 8.0f,
                       (fVar5 + 199.0f) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(s32)fVar6);
  fVar2 = (fVar4 + 160.0f) * gGlobals.brightness;
  g = Borg8_DrawSimple(g,gCompass->S,(fVar7 + 271.0f) - 8.0f,
                       (199.0f - fVar5) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(s32)fVar2);
  fVar2 = (160.0f - fVar3) * gGlobals.brightness;
  g = Borg8_DrawSimple(g,gCompass->E,(fVar5 + 271.0f) - 8.0f,
                       (fVar7 + 199.0f) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(s32)fVar2);
  fVar2 = (fVar3 + 160.0f) * gGlobals.brightness;
  g = Borg8_DrawSimple(g,gCompass->W,(271.0f - fVar5) - 8.0f,
                       (199.0f - fVar7) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(s32)fVar2);
  return g;
}
//unload images and free struct
void Free(void){
  FREEQB8(gCompass->ring);
  FREEQB8(gCompass->N);
  FREEQB8(gCompass->S);
  FREEQB8(gCompass->E);
  FREEQB8(gCompass->W);
  FREE(gCompass,209);
}
}