#define FILENAME "./src/compass.cpp"

#include "commonTypes.h"
#include "GhidraDump.h"

typedef struct Compass{
  Borg8header* ring;
  u32 pad; //an unused pointer?
  Borg8header* N;
  Borg8header* E;
  Borg8header* S;
  Borg8header* W;
};

Compass* gCompass;

void Compass::Init(void){
  ALLOC(gCompass,101);
  gCompass->ring = get_borg_8(BORG8_compassRing);
  gCompass->N = get_borg_8(BORG8_CompassNorth);
  gCompass->S = get_borg_8(BORG8_CompassSouth);
  gCompass->E = get_borg_8(BORG8_CompassEast);
  gCompass->W = get_borg_8(BORG8_CompassWest);
}

Gfx* Compass::Draw(Gfx*param_1,vec2f *XZ){
  u8 red;
  u8 green;
  u8 blue;
  u16 h;
  u16 v;
  Gfx* pauVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  vec2f fStack128;
  
  RSPFUNC(param_1,6);
  pauVar1 = pass_to_borg_image_draw(param_1,gCompass->ring,241.0,169.0,1.0f,1.0f
                       ,gGlobals.screenfadeFloat * 255.0f,
                       gGlobals.screenfadeFloat * 255.0f,
                       gGlobals.screenfadeFloat * 255.0f,
                       gGlobals.screenfadeFloat * 80.0f);
  fStack128.y = 0.0;
  fStack128.x = 1.0f;
  fVar3 = vec2_dot(XZ,fStack128);
  fStack128.x = 0.0;
  fStack128.y = 1.0f;
  fVar4 = vec2_dot(XZ,fStack128);
  fVar7 = fVar3 * 25.0f;
  fVar3 = fVar3 * 95.0f;
  fVar5 = fVar4 * 25.0f;
  fVar4 = fVar4 * 95.0f;
  red = gGlobals.screenfadeFloat * 160.0f;
  green = gGlobals.screenfadeFloat * 160.0f;
  blue = gGlobals.screenfadeFloat * 220.0f;
  fVar6 = (160.0f - fVar4) * gGlobals.screenfadeFloat;
  if (INT_MAX_f <= fVar6) fVar6-= INT_MAX_f;
  pauVar1 = pass_to_borg_image_draw(pauVar1,gCompass->N,(271.0f - fVar7) - 8.0f,
                       (fVar5 + 199.0f) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(s32)fVar6);
  fVar2 = (fVar4 + 160.0f) * gGlobals.screenfadeFloat;
  if (INT_MAX_f <= fVar2) fVar2-= INT_MAX_f;
  pauVar1 = pass_to_borg_image_draw(pauVar1,gCompass->S,(fVar7 + 271.0f) - 8.0f,
                       (199.0f - fVar5) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(s32)fVar2);
  fVar2 = (160.0f - fVar3) * gGlobals.screenfadeFloat;
  if (INT_MAX_f <= fVar2) fVar2-= INT_MAX_f;
  pauVar1 = pass_to_borg_image_draw(pauVar1,gCompass->E,(fVar5 + 271.0f) - 8.0f,
                       (fVar7 + 199.0f) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(s32)fVar2);
  fVar2 = (fVar3 + 160.0f) * gGlobals.screenfadeFloat;
  if (INT_MAX_f <= fVar2) fVar2-= INT_MAX_f;
  pauVar1 = pass_to_borg_image_draw(pauVar1,gCompass->W,(271.0f - fVar5) - 8.0f,
                       (199.0f - fVar7) - 8.0f,1.0f,1.0f,red,green,blue,(u8)(s32)fVar2);
  return pauVar1;
}

void Compass::Free(void){
  AllocFreeQueueItem(&gGlobals.QueueA,gCompass->ring,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&gCompass->N,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&gCompass->S,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&gCompass->E,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&gCompass->W,4,0);
  FREE(gCompass,209);
}