#define FILENAME "./src/sundial.cpp"
#include "globals.h"
#include "sundail.h"

void Sundial::Init(void){
  ALLOC(gSundail,108);
  gSundail->Ring = get_borg_8(BORG8_compassRing);
  gSundail->Cross = get_borg_8(0x1ba);
  gSundail->MoonPhase0 = get_borg_8(0x1b8);
  gSundail->MoonPhase1 = get_borg_8(0x1b3);
  gSundail->MoonPhase2 = get_borg_8(0x1b4);
  gSundail->MoonPhase3 = get_borg_8(0x1b6);
  gSundail->MoonPhase4 = get_borg_8(0x1b7);
  gSundail->MoonPhase5 = get_borg_8(0x1b5);
  gSundail->SunBig = get_borg_8(0x1bb);
  gSundail->moon = 0;
  gSundail->SunSmall = get_borg_8(0x1b9);
  gSundail->sun = 0;
}

Gfx * Sundial::Draw(Gfx *param_1){
  byte bVar1;
  ushort h;
  ushort v;
  Gfx *pGVar2;
  uint uVar3;
  Borg8header *borg8;
  u8 blue;
  u8 green;
  u8 red;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  Calendar aCStack144;
  
  pGVar2 = RSPFUNC6(param_1);
  red = gGlobals.brightness * 255.0f;
  green = gGlobals.brightness * 255.0f;
  blue = gGlobals.brightness * 255.0f;
  fVar4 = gGlobals.brightness * 80.0f;
  pGVar2 = Borg8_DrawSimple(pGVar2,gSundail->Ring,19.0,169.0,1.0f,1.0f,red
                            ,green,blue,gGlobals.brightness * 80.0f);
  if (gSundail->sun == 0) {
    red = gGlobals.brightness * 160.0f;
    green = gGlobals.brightness * 160.0f;
    blue = gGlobals.brightness * 220.0f;
    World::GetCalendarDate(TerrainPointer,&aCStack144);
    uVar3 = (aCStack144.week & 3) >> 1;
    bVar1 = TerrainPointer->moonPhases;
    borg8 = NULL;
    if (bVar1 == 1) {
      if (uVar3 == 0) {
        borg8 = gSundail->MoonPhase1;
      }
      else {
        borg8 = gSundail->MoonPhase2;
      }
    }
    else if (bVar1 < 2) {
      if (bVar1 == 0) {
        borg8 = gSundail->MoonPhase0;
      }
    }
    else if (bVar1 == 2) {
      if (uVar3 == 0) {
        borg8 = gSundail->MoonPhase3;
      }
      else {
        borg8 = gSundail->MoonPhase4;
      }
    }
    else if (bVar1 == 3) {
      borg8 = gSundail->MoonPhase5;
    }
    pGVar2 = Borg8_DrawSimple(pGVar2,borg8,39.0,189.0,1.0f,1.0f,red,green,
                              blue,gGlobals.brightness * 160.0f);
  }
  fVar4 = World::get_timeofDay_float(TerrainPointer);
  fVar10 = (float)((int)(fVar4 * 720.0f) % 720);
  fVar11 = fVar10 / 30.0f;
  fVar10 = fVar10 * dtor;
  fVar4 = 0.0;
  fVar5 = __sinf(fVar10);
  fVar6 = __cosf(fVar10);
  fVar10 = 0.0;
  if ((fVar11 <= 7.0f) || (21.0f <= fVar11)) {
    if ((23.0f < fVar11) || (fVar11 < 5.0f)) {
      red = gGlobals.brightness * 120.0f;
      green = gGlobals.brightness * 100.0f;
      blue = gGlobals.brightness * 190.0f;
      fVar4 = 160.0f;
      fVar10 = 0.0;
    }
    else {
      if ((fVar11 < 5.0f) || (7.0f < fVar11)) {
        if ((fVar11 < 21.0f) || (23.0f < fVar11)) goto LAB_8002ba60;
        fVar7 = 255.0f - (fVar11 - 21.0f) * 67.5f;
        fVar8 = 190.0f - (fVar11 - 21.0f) * 45.0f;
        fVar9 = (fVar11 - 21.0f) * 20.0f + 150.0f;
        fVar4 = (fVar11 - 21.0f) * 80.0f;
        fVar10 = 160.0f - fVar4;
      }
      else {
        fVar7 = (fVar11 - 5.0f) * 67.5f + 120.0f;
        fVar8 = (fVar11 - 5.0f) * 45.0f + 100.0f;
        fVar9 = 190.0f - (fVar11 - 5.0f) * 20.0f;
        fVar10 = (fVar11 - 5.0f) * 80.0f;
        fVar4 = 160.0f - fVar10;
      }
      blue = fVar9;
      green = fVar8;
      red = fVar7;
    }
  }
  else {
    red = gGlobals.brightness * 255.0f;
    green = gGlobals.brightness * 190.0f;
    blue = gGlobals.brightness * 150.0f;
    fVar4 = 0.0;
    fVar10 = 160.0f;
  }
LAB_8002ba60:
  pGVar2 = Borg8_DrawSimple(pGVar2,gSundail->Cross,24.0,174.0,1.0f,1.0f,
                            red,green,blue,(u8)(int)gGlobals.brightness * 80.0f);
  if (gSundail->moon == 0) {
    fVar10 = fVar10 * gGlobals.brightness;
    fVar11 = (fVar5 * 25.0f + 49.0f) - 10.0f;
    fVar5 = (199.0f - fVar6 * 25.0f) - 10.0f;
    if (((u8)fVar10)) {
      pGVar2 = Borg8_DrawSimple(pGVar2,gSundail->SunBig,fVar11,fVar5,1.0f,
                                1.0f,red,green,blue,(u8)fVar10);
    }
    fVar4 = fVar4 * gGlobals.brightness;
    if (((u8)fVar4)) {
      pGVar2 = Borg8_DrawSimple(pGVar2,gSundail->SunSmall,fVar11,fVar5,1.0f,
                                1.0f,red,green,blue,(u8)fVar4);
    }
  }
  return pGVar2;
}

void Sundial::ToggleSun(u8 x){gSundail->sun = x ^ 1;}
void Sundial::ToggleMoon(u8 x){gSundail->moon = x ^ 1;}

void Sundial::Free(void){
  AllocFreeQueueItem(&gGlobals.QueueA,gSundail->Ring,4,0);
  gSundail->Ring = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,gSundail->Cross,4,0);
  gSundail->Cross = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,gSundail->MoonPhase0,4,0);
  gSundail->MoonPhase0 = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,gSundail->MoonPhase1,4,0);
  gSundail->MoonPhase1 = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,gSundail->MoonPhase2,4,0);
  gSundail->MoonPhase2 = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,gSundail->MoonPhase3,4,0);
  gSundail->MoonPhase3 = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,gSundail->MoonPhase4,4,0);
  gSundail->MoonPhase4 = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,gSundail->MoonPhase5,4,0);
  gSundail->MoonPhase5 = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,gSundail->SunBig,4,0);
  gSundail->SunBig = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,gSundail->SunSmall,4,0);
  gSundail->SunSmall = NULL;
  AllocFreeQueueItem(&gGlobals.QueueA,&gSundail,7,0);
  gSundail = NULL;
}