#include "skyObjects.h"
#include "globals.h"
#define FILENAME "./src/skyobjects.cpp"

u16 gSkyObjectMoonIndex=0;
u16 gSkyobjectsCount=0;
u8 moon_phase=3;
Borg8Header** skyobjects_borg8 =NULL;
Borg8Header* gMoonBorg8=NULL;
SkyobjectStruct* gSunObjP=NULL;
SkyobjectStruct* gMoonObjP=NULL;

//many reused/unused values. lets us only worry about the ones that actually change.
#define STAROBJ(x,y){SkyObj_Star,0.2,{x,y},{250,250,250,250}}

SkyobjectStruct skyobjectStructs[]={
    STAROBJ(0,0),
    STAROBJ(2,5),
    STAROBJ(15,12),
    STAROBJ(20,15),
    STAROBJ(3,20),
    STAROBJ(21,21),
    STAROBJ(24,23),
    STAROBJ(17,27),
    STAROBJ(3,30),
    STAROBJ(22,31),
    STAROBJ(1.125,35),
    STAROBJ(0.875,40),
    STAROBJ(20.15,45),
    STAROBJ(13.85,46),
    STAROBJ(18.725,47),
    STAROBJ(5.675,51),
    STAROBJ(5.7,250),
    STAROBJ(6.2,60),
    STAROBJ(18.075,60),
    STAROBJ(15.925,61),
    STAROBJ(16.425,68),
    STAROBJ(3.025,72),
    STAROBJ(19.85,77),
    STAROBJ(8.04,84),
    STAROBJ(5.25,87),
    STAROBJ(1.02,97),
    STAROBJ(23.67,99),
    STAROBJ(4.83,100),
    STAROBJ(21.27,103),
    STAROBJ(9.48,106),
    STAROBJ(8.46,110),
    STAROBJ(10,110),
    STAROBJ(12,113),
    STAROBJ(11,117),
    STAROBJ(2,120),
    STAROBJ(10,122),
    STAROBJ(7,125),
    STAROBJ(7,130),
    STAROBJ(15,130),
    STAROBJ(10,132),
    STAROBJ(0,135),
    STAROBJ(15.12,140),
    STAROBJ(18.27,143),
    STAROBJ(0.36,150),
    STAROBJ(8.88,160),
    STAROBJ(24.84,162),
    STAROBJ(1.89,167),
    STAROBJ(13.5,175),
    STAROBJ(11.04,175),
    STAROBJ(14.28,176),
    STAROBJ(28.59,180),
    STAROBJ(27.87,183),
    STAROBJ(11.13,184),
    STAROBJ(22.59,187),
    STAROBJ(9.79,190),
    STAROBJ(15.06,203),
    STAROBJ(1.701,210),
    STAROBJ(1.86,224),
    STAROBJ(24.69,228),
    STAROBJ(23.16,230),
    STAROBJ(22.89,234),
    STAROBJ(16.59,235),
    STAROBJ(21.93,240),
    STAROBJ(24.75,241),
    STAROBJ(5.26,254),
    STAROBJ(7.07,260),
    STAROBJ(0.57,261),
    STAROBJ(21.27,264),
    STAROBJ(5.92,265),
    STAROBJ(13.29,266),
    STAROBJ(7.22,269),
    STAROBJ(2.52,270),
    STAROBJ(21.29,275),
    STAROBJ(25.92,280),
    STAROBJ(25.072,283),
    STAROBJ(12.23,291),
    STAROBJ(15.92,300),
    STAROBJ(24.19,301),
    STAROBJ(2.21,303),
    STAROBJ(6.19,308),
    STAROBJ(14.92,315),
    STAROBJ(21.2,321),
    STAROBJ(0,325),
    STAROBJ(1,327),
    STAROBJ(19,331),
    STAROBJ(6.885,338),
    STAROBJ(8.58,342),
    STAROBJ(21.1,345),
    STAROBJ(16.9,349),
    STAROBJ(7,352),
    STAROBJ(3,357),

    {SkyObj_Sun,1.0,{0,90},{250,250,250,250}},
    {SkyObj_Moon,1.0,{0,0},{250,250,250,250}},
    {SkyObjEND,0,    {0,0},{0,0,0,0}},
};


void Skyobjects::Init(void){
  SkyObjType SVar1;
  float fVar2;
  Borg8Header *pBVar3;
  Borg8Header *pBVar4;
  u32 BVar5;
  uint uVar6;
  uint uVar7;
  SkyobjectStruct *pSVar8;
  uint uVar9;
  SkyobjectStruct *pSVar10;
  int iVar11;
  Borg8Header **ppBVar12;
  Calendar cal;
  
  gSkyobjectsCount = 0;
  if (skyobjectStructs[0].index != SkyObjEND) {
    gSkyobjectsCount = 1;
    while (skyobjectStructs[gSkyobjectsCount].index != SkyObjEND)gSkyobjectsCount++;
  }
  for(iVar11=0;iVar11<3;iVar11++) {
    switch(iVar11){
        case SkyObj_Sun:
        sSkyObjBss[0] = loadBorg8(BORG8_SkyObjSun);break;
        case SkyObj_Moon:
        {
            moon_phase = TerrainPointer->moonPhases;
            World::GetCalendarDate(TerrainPointer,&cal);
            uVar6 = (cal.week & 3) >> 1; //waxing or waning?
            switch(moon_phase){
              case 0: //new moon
              BVar5 = BORG8_MoonNew;break;
              case 1: //waxing/waning cresent
              BVar5 = BORG8_MoonCresent;
              if (uVar6 == 0) BVar5 = BORG8_SkyObjMoonCrest;
              break;
              case 2: //first/third quarter
              BVar5 = BORG8_MoonQuarter;
              if (uVar6 == 0) BVar5 = BORG8_SkyObjMoonHalf;
              break;
              case 3: //full moon
              BVar5 = BORG8_MoonFull;break;
            };
            sSkyObjBss[1] = loadBorg8(BVar5);
        }
        break;
        case SkyObj_Star:
        sSkyObjBss[2] = loadBorg8(BORG8_SkyObjStar);
        break;
        default:
        sSkyObjBss[iVar11]=NULL;
    }
  }
  ALLOCS(ppBVar12,gSkyobjectsCount*sizeof(Borg8Header*),0xf8);
  fVar2 = 0.19f;
  uVar7 = 0;
  uVar6 = (uint)gSkyobjectsCount;
  skyobjects_borg8 = ppBVar12;
  if (uVar6 != 0) {
    pSVar8 = skyobjectStructs;
    uVar9 = (uint)gSkyObjectMoonIndex;
    do {
      pBVar4 = sSkyObjBss[2];
      pBVar3 = sSkyObjBss[1];
      SVar1 = pSVar8->index;
      if (SVar1 == SkyObj_Moon) {
        *ppBVar12 = sSkyObjBss[1];
        gMoonBorg8 = pBVar3;
        gMoonObjP = pSVar8;
        uVar9 = uVar7;
      }
      else if (SVar1 < SkyObj_Star) {
        pBVar4 = sSkyObjBss[0];
        pSVar10 = pSVar8;
        if (SVar1 == SkyObj_Sun) {
LAB_80030640:
          *ppBVar12 = pBVar4;
          gSunObjP = pSVar10;
        }
      }
      else if (SVar1 == SkyObj_Star) {
        pSVar8->f0 = 0.19;
        pSVar10 = gSunObjP;
        goto LAB_80030640;
      }
      ppBVar12 = ppBVar12 + 1;
      uVar7 += 1;
      pSVar8 = pSVar8 + 1;
    } while ((int)uVar7 < (int)uVar6);
    gSkyObjectMoonIndex = (ushort)uVar9;
  }
  gGlobals.SunPos.z = 0.0;
  gGlobals.SunPos.y = 0.0;
  gGlobals.SunPos.x = 0.0;
  gGlobals.MoonPos.z = 0.0;
  gGlobals.MoonPos.y = 0.0;
  gGlobals.MoonPos.x = 0.0;
}

void Skyobjects::Free(void){
  uint uVar1;
  Borg8Header **ppBVar2;
  int i;
  

  for(ppBVar2 = sSkyObjBss,i=2;i>-1;i--,ppBVar2++){
    if (*ppBVar2) {
      FREEQB8(ppBVar2);
      *ppBVar2 = NULL;
    }
  }
  ppBVar2 = skyobjects_borg8;
  for (uVar1 = (uint)gSkyobjectsCount; uVar1 != 0; uVar1--) {
    if (*ppBVar2) *ppBVar2 = NULL;
    ppBVar2++;
  }
  FREE(skyobjects_borg8,0x12f);
  gMoonBorg8 = NULL;
}


Gfx * Skyobjects::Render(Gfx *g)

{
  byte bVar1;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  byte bVar7;
  SkyObjType SVar8;
  uint uVar9;
  u8 blue;
  uint uVar10;
  u8 green;
  uint uVar11;
  u8 red;
  uint uVar12;
  SkyobjectStruct *pSVar13;
  int i;
  float fVar17;
  float fVar18;
  double dVar16;
  float fVar19;
  float fVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  float Hscale;
  float y;
  float x;
  vec3f fStack240;
  int iStack_5c;
  byte bVar2;
  
  if ((true) && (gGlobals.sky.Type == 3)) {
    i = 0;
    UpdateSunMoon();
    fVar17 = gGlobals.Sub.camera.rotation.z;
    fVar4 = gGlobals.Sub.camera.rotation.y;
    fVar3 = gGlobals.Sub.camera.rotation.x;
    fStack240.y = 0.0;
    fStack240.x = gGlobals.Sub.camera.rotation.x;
    fStack240.z = gGlobals.Sub.camera.rotation.z;
    vec3_normalize(&fStack240);
    fVar6 = fStack240.z;
    fVar5 = fStack240.x;
    fVar17 = _sqrtf(SQ(gGlobals.Sub.camera.rotation.x) + SQ(gGlobals.Sub.camera.rotation.z));
    RSPFUNC6(g);
    fVar3 = dtor;
    if (gSkyobjectsCount != 0) {
      iStack_5c = 0;
      do {
        if (((gSunObjP->pos.x <= 0.0) || (180.0f <= gSunObjP->pos.x)) ||
           (skyobjectStructs[i].index != SkyObj_Star)) {
          fVar21 = skyobjectStructs[i].pos.x;
          fVar22 = skyobjectStructs[i].pos.y;
          if ((skyobjectStructs[i].pos.x <= 90.0f) || (270.0f <= skyobjectStructs[i].pos.x)) {
            if (skyobjectStructs[i].index == SkyObj_Moon) {
              fVar21 = __sinf(skyobjectStructs[i].pos.x * dtor);
              fVar22 = fVar22 + fVar21 * 40.0f;
            }
          }
          else {
            fVar22 = fVar22 + 180.0f;
            if (skyobjectStructs[i].index == SkyObj_Moon) {
              fVar21 = __sinf(skyobjectStructs[i].pos.x * dtor);
              fVar22 = fVar22 - fVar21 * 40.0f;
            }
          }
          fVar21 = __cosf(fVar22 * dtor);
          fVar22 = __sinf(fVar22 * dtor);
          x = (fVar21 * fVar5 - fVar22 * fVar6) * 300.0f + 160.0f;
          fVar18 = __sinf(skyobjectStructs[i].pos.x * dtor);
          fVar23 = -(fVar18 * 90.0f) * dtor;
          fVar18 = __cosf(fVar23);
          fVar23 = __sinf(fVar23);
          Hscale = skyobjectStructs[i].f0;
          SVar8 = skyobjectStructs[i].index;
          y = (fVar18 * fVar4 + fVar23 * fVar17) * 300.0f + 120.0f;
          if (SVar8 == SkyObj_Moon) {
            bVar7 = (skyobjectStructs[i].col).A;
LAB_80030ae8:
            dVar16 = (double)((float)bVar7 * gGlobals.Sub.weather.fogTime) * 1.5;
LAB_80030b04:
            fVar19 = (float)dVar16;
            bVar7 = (skyobjectStructs[i].col).A;
          }
          else {
            if (SkyObj_Moon < SVar8) {
              bVar7 = (skyobjectStructs[i].col).A;
              if (SVar8 != SkyObj_Star) goto LAB_80030ae8;
              dVar16 = (double)((float)bVar7 * gGlobals.Sub.weather.fogTime) +
                       (double)((float)bVar7 * gGlobals.Sub.weather.fogTime);
              goto LAB_80030b04;
            }
            bVar7 = (skyobjectStructs[i].col).A;
            if (SVar8 != SkyObj_Sun) goto LAB_80030ae8;
            fVar19 = (float)bVar7 * gGlobals.Sub.weather.fogTime;
            bVar7 = (skyobjectStructs[i].col).A;
          }
          fVar20 = (float)bVar7;
          if ((fVar19 <= fVar20) && (fVar20 = fVar19, fVar19 < 0.0)) {
            fVar20 = 0.0;
          }
          uVar12 = (uint)(skyobjectStructs[i].col).A - (u16)fVar20;
          if (skyobjectStructs[i].index == SkyObj_Star) {
            uVar12 = (u8)(float)uVar12 * __sinf(-gSunObjP->pos.x * dtor);
          }
          if ((0.0 < fVar21 * fVar6 + fVar22 * fVar5) && (0.0 < fVar18 * fVar17 - fVar23 * fVar4)) {
            bVar7 = (skyobjectStructs[i].col).R;
            bVar1 = (skyobjectStructs[i].col).G;
            bVar2 = (skyobjectStructs[i].col).B;
            if (skyobjectStructs[i].index == SkyObj_Sun) {
              gLensFlarePos.x = x + (float)((ushort)(skyobjects_borg8[i]->dat).Width >> 1) * Hscale;
              gLensFlarePos.y = y + (float)((ushort)(skyobjects_borg8[i]->dat).Height >> 1) * Hscale
              ;
              bVar7 = gGlobals.sky.colors[4].R;
              bVar1 = gGlobals.sky.colors[4].G;
              bVar2 = gGlobals.sky.colors[4].B;
            }
            uVar9 = (uint)bVar2;
            uVar10 = (uint)bVar1;
            uVar11 = (uint)bVar7;
            //add a twinkle to stars
            if (skyobjectStructs[i].index == SkyObj_Star) uVar11=uVar10=uVar9= rand_range(160,255);
            blue = (u8)uVar9;
            green = (u8)uVar10;
            red = (u8)uVar11;
            if (gGlobals.brightness < 1.0f) {
              red = (float)uVar11 * gGlobals.brightness;
              green = (float)uVar10 * gGlobals.brightness;
              blue = (float)uVar9 * gGlobals.brightness;
              uVar12=(u16)((float)uVar12 * gGlobals.brightness);
            }
            g = Borg8_DrawSimple(g,*(Borg8Header **)(iStack_5c + (int)skyobjects_borg8),x,y,Hscale,
                                 Hscale,red,green,blue,(u8)uVar12);
          }
        }
        iStack_5c += 4;
        i += 1;
      } while (i < (int)(uint)gSkyobjectsCount);
    }
  }
  return g;
}

void Skyobjects::UpdateSunMoon(void){
  if (gSkyobjectsCount != 0) {
    for(s32 i=0;i<gSkyobjectsCount;i++) {
        switch(skyobjectStructs[i].index){
            case SkyObj_Moon:UpdateMoon();break;
            case SkyObj_Sun:UpdateSun();break;
        }
    }
  }
}

void Skyobjects::UpdateSun(void){
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  
  fVar3 = World::get_timeofDay_float(TerrainPointer) * 360.0f - 90.0f;
  gSunObjP->pos.x = fVar3;
  if (360.0f < fVar3) {
    do {
      fVar3 -= 360.0;
    } while (360.0 < fVar3);
    gSunObjP->pos.x = fVar3;
  }
  gGlobals.SunPos.x = 0.0;
  gGlobals.SunPos.y = 0.0;
  gGlobals.SunPos.z = 1.0f;
  fVar3 = __sinf(gSunObjP->pos.y * dtor);
  fVar4 = __cosf(gSunObjP->pos.y * dtor);
  fVar5 = __sinf(-gSunObjP->pos.x * dtor);
  fVar6 = __cosf(-gSunObjP->pos.x * dtor);
  fVar7 = fVar5 * 0.0 + fVar6;
  gGlobals.SunPos.y = fVar6 * 0.0 - fVar5;
  gGlobals.SunPos.x = fVar4 * 0.0 + fVar7 * fVar3;
  gGlobals.SunPos.z = fVar7 * fVar4 - fVar3 * 0.0;
}



void Skyobjects::UpdateMoon(void)

{
  bool bVar1;
  SkyobjectStruct *pSVar2;
  uint uVar3;
  u32 BVar5;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  Calendar cal;
  
  fVar5 = World::get_timeofDay_float(TerrainPointer);
  pSVar2 = gMoonObjP;
  fVar5 = fVar5 * 360.0f + 90.0f;
  fVar5 = fVar5 + fVar5;
  bVar1 = 360.0f < fVar5;
  gMoonObjP->pos.x = fVar5;
  if (360.0f < fVar5) {
    do {
      fVar5 = fVar5 - 360.0;
    } while (360.0 < fVar5);
    pSVar2->pos.x = fVar5;
  }
  gGlobals.MoonPos.x = 0.0;
  gGlobals.MoonPos.y = 0.0;
  gGlobals.MoonPos.z = 1.0f;
  fVar5 = __sinf(gMoonObjP->pos.y * dtor);
  fVar6 = __cosf(gMoonObjP->pos.y * dtor);
  fVar7 = __sinf(-gMoonObjP->pos.x * dtor);
  fVar8 = __cosf(-gMoonObjP->pos.x * dtor);
  fVar9 = fVar7 * 0.0 + fVar8;
  gGlobals.MoonPos.y = fVar8 * 0.0 - fVar7;
  gGlobals.MoonPos.x = fVar6 * 0.0 + fVar9 * fVar5;
  gGlobals.MoonPos.z = fVar9 * fVar6 - fVar5 * 0.0;
  if (moon_phase == TerrainPointer->moonPhases) return;
  FREEQB8(sSkyObjBss[1]);
    moon_phase = TerrainPointer->moonPhases;
    World::GetCalendarDate(TerrainPointer,&cal);
    u32 uVar6 = (cal.week & 3) >> 1; //waxing or waning?
    switch(moon_phase){
      case 0: //new moon
      BVar5 = BORG8_MoonNew;break;
      case 1: //waxing/waning cresent
      BVar5 = BORG8_MoonCresent;
      if (uVar6 == 0) BVar5 = BORG8_SkyObjMoonCrest;
      break;
      case 2: //first/third quarter
      BVar5 = BORG8_MoonQuarter;
      if (uVar6 == 0) BVar5 = BORG8_SkyObjMoonHalf;
      break;
      case 3: //full moon
      BVar5 = BORG8_MoonFull;break;
    };
  sSkyObjBss[1] = loadBorg8(BVar5);
  gMoonBorg8 = sSkyObjBss[1];
  skyobjects_borg8[gSkyObjectMoonIndex] = sSkyObjBss[1];
}

