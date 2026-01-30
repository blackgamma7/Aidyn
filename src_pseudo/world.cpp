#include "world.h"
#include "globals.h"
#include "stringN64.h"
#include "crash.h"

//likelyhood of precipitation per season (least likely during fall and winter)
u8 sSeasonPrecipChance[] = {43,48,33,25,36,40,0,0};
u8 sTerrainPrecipChance[]={//likelyhood of precipitation per terrain type
  0,0,0,156,5,30,0,15,0,0,20,0,0,0,0,0,0,0,100,0,0,0,0,30,15,0,156,156};
float sTerrainPrecipScale[]={ //scale of precipitation per terrain type +/- 0.15
  0.5,0.5,0.4,0,0.7,0.6,0.5,0.8,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.8,0.2,0.2,0.2,0.2,0.8,0.6,0.2,0,0};
//initalize "TerrainStruct"
void World::init(TerrainStruct *ter){
  CLEAR(ter);
  ter->daySpeed = 72;
  ter->windByte = WIND_CLEAR;
  ter->partOfDay = TIME_MORNING;
  ter->moonPhases = 0;
  ter->terrain = 0;
  ter->rainByte = PRECIP_CLEAR;
  ter->windVelocity.x = 1.0f;
  ter->windVelocity.y = -0.1f;
  ter->windVelocity.z = 1.0f;
  Vec3Normalize(&ter->windVelocity);
  Vec3Scale(&ter->windVelocity,(15.0f/648)); //0.02314815
}
//set terrain to (type)
void World::SetTerrain(TerrainStruct *ter,u8 type){
  u32 uVar1;
  u32 uVar2;
  
  if (type < 28) {
    if (ter->terrain != type) {
      ter->partOfDay = (ter->partOfDay+1) %5;
    }
    ter->terrain = type;
    SeveralTimeFuncs(ter);
    set_terrain_flags(ter->terrain);
  }
  else CRASH("World::SetTerrain","Invalid Terrain type!");
}

u8 World::getTerrain(TerrainStruct *ter){return ter->terrain;}
//increment the time of day (morning, night, ect.)
void World::IncTimeOfDay(TerrainStruct *ter){
  ter->partOfDay = (ter->partOfDay+1)%5;
  SeveralTimeFuncs(ter);
}

void World::inc_dayNightMagic(TerrainStruct *X){X->DayNightMagic++;}

void World::dec_dayNightMagic(TerrainStruct *X){if (X->DayNightMagic != 0) {X->DayNightMagic--;}}
//Parse Claendar struct into in-game time
void World::SetTimeFromCalendar(TerrainStruct *ter,Calendar *param_2){
  ter->InGameTime =
       (u32)param_2->season * (SEASONS(1)) + (u32)param_2->week * (DAYS(7)) + 
       (u32)param_2->day * DAYS(1) + (u32)param_2->hour * HOURS(1) +
       (u32)param_2->minute * MINUTES(1) + (u32)param_2->second * SECONDS(1);
  SeveralTimeFuncs(ter);
  SetFlagArray_on_Time(ter->partOfDay,param_2->day,param_2->week,param_2->season);

}
//Parse in-game time into Claendar struct
void World::GetCalendarDate(TerrainStruct *ter,Calendar *cal){
  cal->season = GetSeason(ter);
  cal->week = GetWeek(ter);
  cal->day = GetDay(ter);
  cal->hour = GetHour(ter);
  cal->minute = GetMinute(ter);
  cal->second = GetSecond(ter);
}

#if DEBUGVER
u8 timeofday_hours[]={6,9,12,18,21};
void World::ShiftTimeOfDay(TerrainStruct *ter,s8 param_2){
  u32 uVar1;
  u32 uVar2;
  s32 iVar3;
  Calendar tempCal;
  
  iVar3 = (s32)param_2;
  if (iVar3 < 1) {
    if (-1 < iVar3) return;
    iVar3 = (u32)ter->partOfDay + iVar3;
    if (iVar3 < 0) {
      ter->partOfDay += param_2 + 5;
    }
    else {
      ter->partOfDay = iVar3;
    }
  }
  else {
    uVar2 = (u32)ter->partOfDay + iVar3 & 0xff;
    uVar1 = uVar2 / 5;
    ter->partOfDay = (char)uVar2 - ((char)(uVar1 << 2) + (char)uVar1);
  }
  GetCalendarDate(ter,&tempCal);
  tempCal.hour = timeofday_hours[ter->partOfDay];
  tempCal.minute = 0;
  tempCal.second = 0;
  SetTimeFromCalendar(ter,&tempCal);
}
#endif

void World::ChangeWind(TerrainStruct* ter,vec3f *coords,float dirCharge,float magChange){
  float x;
  float fVar1;
  
  x = Vec3Normalize(coords);
  if (RAND.GetFloat0To1() <= dirCharge) {
    coords->x += RAND.GetFloatRange(-0.1f,0.1f);
    coords->y += RAND.GetFloatRange(-0.004,0.001);
    coords->z += RAND.GetFloatRange(-0.1f,0.1f);
    Vec3Normalize(coords);
  }
  #define windRange (float)(1.0/432) //0.002314815
  if (RAND.GetFloat0To1() <= magChange) {
    fVar1 = x + RAND.GetFloatRange(-windRange,windRange);
    if ((fVar1 < windRange) && (x = fVar1, fVar1 < 0.0)) {
      x = 0.0;
    }
  }
  Vec3Scale(coords,x);
}

void World::SetWithWeatherTemp(TerrainStruct *ter,WeatherTemp *w){
  ter->rainByte = w->precip;
  ter->PrecipScale = w->PrecipScale;
  gGlobals.gameVars.weather.fogTime = w->FogFloat;
  ter->FogFloat = gGlobals.gameVars.weather.fogTime;
  ter->ThunderFloat = w->ThunderFloat;
  gGlobals.gameVars.weather.timer = ter->PrecipScale;
  set_weather_flags(ter->rainByte);
}

void World::GetWeatherTemp(TerrainStruct *ter,WeatherTemp *w){
  w->precip = ter->rainByte;
  w->PrecipScale = ter->PrecipScale;
  w->FogFloat = ter->FogFloat;
  w->ThunderFloat = ter->ThunderFloat;
}

void World::set_moonPhase(TerrainStruct *ter,Calendar *cal){
  u32 X;
  
  X = (s32)(((u32)cal->day + (cal->week & 3) * 7) * 0x1000000) >> 0x18;
  if ((X & 0xff) < 3) {
    ter->moonPhases = 3;
    return;}
  if (X - 0xe < 3) {
    ter->moonPhases = 0;
    return;}
  if ((X - 3 < 5) || (X - 0x17 < 5)) goto moonval2;
  if ((4 < X - 9) && (4 < X - 0x11)) {
    if (cal->hour < 0xc) {if (X != 8) goto moonval1;}
    else {if (X == 8) goto moonval1;}
moonval2:
    ter->moonPhases = 2;
    return;}
moonval1:
  ter->moonPhases = 1;
  return;
}

u8 World::UpdateTimeOfDay(TerrainStruct *ter,Calendar *cal){
  if (ter->DayNightMagic) return false;
  u8 hr = cal->hour;
  u8 TodOld = ter->partOfDay;
  if      (hr < 6) ter->partOfDay = TIME_NIGHT;
  else if (hr < 9) ter->partOfDay = TIME_MORNING;
  else if (hr <12) ter->partOfDay = TIME_MIDDAY;
  else if (hr <17) ter->partOfDay = TIME_AFTERNOON;
  else if (hr <21) ter->partOfDay = TIME_EVENING;
  else             ter->partOfDay = TIME_NIGHT;
  return ter->partOfDay != TodOld;
}

//"roll" for a change in weather for each shift in the time of day.
void World::SetWeather(TerrainStruct *ter,Calendar *cal){
  float fogHi;
  
  if (75 < RollD(1,100)) {
    ter->windByte = WIND_CLEAR;
    ter->rainByte = PRECIP_CLEAR;
    ter->PrecipScale = 0.0;
    ter->FogFloat = 0.0;

    if ((s16)(sTerrainPrecipChance[ter->terrain] + sSeasonPrecipChance[cal->season]) >= RollD(1,100)) {  
      if (RollD(1,100) < 70) {
        ter->rainByte = PRECIP_RAIN;
        ter->windByte = WIND_STORM;
        //set to snow where applicable
        if (ter->terrain == 5) ter->rainByte = PRECIP_SNOW;
        ter->PrecipScale = RAND.GetFloatRange(sTerrainPrecipScale[ter->terrain] - 0.15f,
                           sTerrainPrecipScale[ter->terrain] + 0.15f);
        FLOOR(ter->PrecipScale,0.0);
        fogHi = 0.35;
      }
      else {
        fogHi = 0.75;
        ter->windByte = WIND_FOG;
        ter->rainByte = PRECIP_CLEAR;
        ter->PrecipScale = 0.0;
      }
      ter->FogFloat = RAND.GetFloatRange(0.1,fogHi);
    }
    ter->ThunderFloat = 0.0;
    if (ter->rainByte == PRECIP_RAIN)
      ter->ThunderFloat = RAND.GetFloat0To1() * ter->PrecipScale;
  }
}
extern u8 gDebugGameTime;
void World::SeveralTimeFuncs(TerrainStruct *ter){
  Calendar CalTemp;

  GetCalendarDate(ter,&CalTemp);
  set_moonPhase(ter,&CalTemp);
  u8 change=UpdateTimeOfDay(ter,&CalTemp);
  #if DEBUGVER
  if(!gDebugGameTime) return;
  #endif
  if (change) SetWeather(ter,&CalTemp);
  ChangeWind(ter, &ter->windVelocity, 0.05f, 0.05f);
  SetFlagArray_on_Time(ter->partOfDay,CalTemp.day,CalTemp.week,CalTemp.season);
  set_weather_flags(ter->rainByte);
  terrainStruct_floats(ter);
}
//caps game time to one in-game year
void World::cap_ingame_time(TerrainStruct *ter){
  if (YEAR <= ter->InGameTime) ter->InGameTime -= YEAR;
}
//10 seconds pass
void World::Lapse10Seconds(TerrainStruct *ter){
  ter->InGameTime += SECONDS(10);
  cap_ingame_time(ter);
  SeveralTimeFuncs(ter);}
// passes in-game time by (delta*TerrainStruct->daySpeed) ticks
void World::IncGameTime(TerrainStruct *ter,s32 delta){
  ter->InGameTime += (delta * ter->daySpeed);
  cap_ingame_time(ter);
  SeveralTimeFuncs(ter);}
//8 hours pass
void World::Lapse8Hours(TerrainStruct *ter){
  ter->InGameTime += HOURS(8);
  cap_ingame_time(ter);
  SeveralTimeFuncs(ter);}

void World::AddPlayTime(TerrainStruct *ter,s32 x){ter->PlayTime += x;}

u32 World::GetTime(TerrainStruct *ter){return ter->InGameTime;}

void World::SetTime(TerrainStruct *ter,u32 param_2){ter->InGameTime = param_2;}

u8 World::GetSeason(TerrainStruct *ter){return ter->InGameTime / SEASONS(1);}

u8 World::GetWeek(TerrainStruct *ter){return (ter->InGameTime % SEASONS(1)) / DAYS(7);}

u8 World::GetDay(TerrainStruct *ter){return (ter->InGameTime % DAYS(7)) / DAYS(1);}

u8 World::GetHour(TerrainStruct *ter){return (ter->InGameTime % DAYS(1)) / HOURS(1);}

u8 World::GetMinute(TerrainStruct *ter){return (ter->InGameTime % HOURS(1)) / SECONDS(60);}

u8 World::GetSecond(TerrainStruct *ter){return (ter->InGameTime % SECONDS(60)) / SECONDS(1);}

float World::get_timeofDay_float(TerrainStruct *ter){
  float fVar1 = (float)(ter->InGameTime % DAYS(1)) / (float)(DAYS(1)) + ter->TimeOfDayFloat;
  while (fVar1 < 0.0) {fVar1 = (float)((double)fVar1 + 1.0);}
  while (1.0f <= fVar1) {fVar1 = (float)((double)fVar1 - 1.0);}
  return fVar1;
}

void World::terrainStruct_floats(TerrainStruct *ter){
  float fVar1;
  float fVar2;
  float fVar3;
  
  if (ter->spellVisValB != 0.0) {
    fVar1 = ter->spellVisValA;
    fVar3 = fVar1 - ter->TimeOfDayFloat;
    if (fVar3 <= 0.0) {
      fVar3 = -fVar3;
    }
    fVar2 = ter->spellVisValB * gGlobals.delta;
    if (0.0 < fVar2) {
      if (fVar2 < fVar3) {
        fVar1 = ter->spellVisValB;
        goto LAB_80085a64;
      }
      ter->TimeOfDayFloat = fVar1;
    }
    else {
      if (-fVar2 < fVar3) {
        fVar1 = ter->spellVisValB;
LAB_80085a64:
        ter->TimeOfDayFloat = ter->TimeOfDayFloat + fVar1 * gGlobals.delta;
        return;
      }
      ter->TimeOfDayFloat = fVar1;
    }
    ter->spellVisValB = 0.0;
  }
  return;
}

void World::spellvisuals_1(TerrainStruct *ter,float param_2,float param_3,s16 param_4){
  float fVar1;
  float fVar2;
  
  fVar2 = ter->TimeOfDayFloat;
  ter->TimeOfDayFloat = 0.0;
  fVar1 = get_timeofDay_float(ter);
  ter->TimeOfDayFloat = fVar2;
  if (param_4 == 0) {
    if (0.0 < param_2) {fVar1 = param_2 - fVar1;}
    else {fVar1 = -param_2 - fVar1;}
  }
  else {
    if (param_2 <= 0.0) {param_2 = -param_2;}
    ter->spellVisValA = param_2 - fVar1;
    fVar1 = ter->spellVisValA;
    if (fVar1 < 0.0) {
      do {fVar1 = (float)((double)fVar1 + 1.0);} while (fVar1 < 0.0);
      ter->spellVisValA = fVar1;
      fVar1 = ter->spellVisValA;
    }
    if (1.0f <= fVar1) {
      do {fVar1 = (float)((double)fVar1 - 1.0);} while (1.0f <= fVar1);
      ter->spellVisValA = fVar1;
    }
    fVar1 = ter->spellVisValA;
    if (param_4 != 2) goto LAB_80085bb8;
    fVar1 = (float)((double)fVar1 - 1.0);
  }
  ter->spellVisValA = fVar1;
  fVar1 = ter->spellVisValA;
LAB_80085bb8:
  ter->spellVisValB = (fVar1 - ter->TimeOfDayFloat) / param_3;
}

void World::spellvisuals_2(TerrainStruct *ter,float param_2){
  float fVar1 = 1.0f;
  if (0.0 < param_2) fVar1 = param_2;
  ter->spellVisValA = 0.0;
  ter->spellVisValB = (0.0 - ter->TimeOfDayFloat) / fVar1;
}
