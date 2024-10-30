#include "world.h"
#include "globals.h"
#include "stringN64.h"
#include "crash.h"

u8 weather_month_array[8] = {0x2B, 0x30, 0x21, 0x19, 0x24, 0x28, 0, 0};

void World::init(TerrainStruct *ter){
  CLEAR(ter);
  ter->daySpeed = 72;
  ter->windByte = 0;
  ter->partOfDay = TIME_MORNING;
  ter->moonPhases = 0;
  ter->terrain = 0;
  ter->rainByte = clear;
  ter->windVelocity.x = 1.0f;
  ter->windVelocity.y = -0.1f;
  ter->windVelocity.z = 1.0f;
  vec3_normalize(&ter->windVelocity);
  multiVec3(&ter->windVelocity,0.02314815);
}

void World::SetTerrain(TerrainStruct *ter,u8 param_2){
  u32 uVar1;
  u32 uVar2;
  
  if (param_2 < 0x1c) {
    if (ter->terrain != param_2) {
      uVar2 = ter->partOfDay + 1 & 0xff;
      uVar1 = uVar2 / 5;
      ter->partOfDay = (char)uVar2 - ((char)(uVar1 << 2) + (char)uVar1);
    }
    ter->terrain = param_2;
    several_time_funcs(ter);
    set_terrain_flags(ter->terrain);
  }
  else CRASH("World::SetTerrain","Invalid Terrain type!");
}

u8 World::getTerrain(TerrainStruct *ter){return ter->terrain;}

void World::IncTimeOfDay(TerrainStruct *param_1){
  u32 uVar1;
  u32 uVar2;
  
  uVar2 = param_1->partOfDay + 1;
  uVar1 = uVar2 / 5;
  param_1->partOfDay = (char)uVar2 - ((char)(uVar1 << 2) + (char)uVar1);
  several_time_funcs(param_1);
}

void World::inc_dayNightMagic(TerrainStruct *X){X->DayNightMagic++;}

void World::dec_dayNightMagic(TerrainStruct *X){if (X->DayNightMagic != 0) {X->DayNightMagic--;}}

void World::SetTimeFromCalendar(TerrainStruct *param_1,Calendar *param_2){
  param_1->InGameTime =
       (u32)param_2->month * 0x114db000 + (u32)param_2->week * 0x229b600 +
       (u32)param_2->day * 0x4f1a00 + ((u32)param_2->hour * 0xe0 + (u32)param_2->hour) * 0x3c0 +
       ((u32)param_2->minute * 0xe0 + (u32)param_2->minute) * 0x10 + (u32)param_2->second * SECONDS(1);
  several_time_funcs(param_1);
  SetFlagArray_on_Time(param_1->partOfDay,param_2->day,param_2->week,param_2->month);

}

void World::GetCalendarDate(TerrainStruct *param_1,Calendar *cal){
  cal->month = GetMonth(param_1);
  cal->week = GetWeek(param_1);
  cal->day = GetDay(param_1);
  cal->hour = GetHour(param_1);
  cal->minute = GetMinute(param_1);
  cal->second = GetSecond(param_1);
}

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
  World::SetTimeFromCalendar(ter,&tempCal);
}

void World::ChangeWind(TerrainStruct* ter,vec3f *coords,float dirCharge,float magChange){
  float x;
  float fVar1;
  
  x = vec3_normalize(coords);
  if (RAND.GetFloat0To1() <= dirCharge) {
    coords->x += RAND.GetFloatRange(-0.1f,0.1f);
    coords->y += RAND.GetFloatRange(-0.004,0.001);
    coords->z += RAND.GetFloatRange(-0.1f,0.1f);
    vec3_normalize(coords);
  }
  #define windRange (float)(1.0/432) //0.002314815
  if (RAND.GetFloat0To1() <= magChange) {
    fVar1 = x + RAND.GetFloatRange(-windRange,windRange);
    if ((fVar1 < windRange) && (x = fVar1, fVar1 < 0.0)) {
      x = 0.0;
    }
  }
  multiVec3(coords,x);
}

void World::set_with_WeatherTemp(TerrainStruct *ter,WeatherTemp *w){
  ter->rainByte = w->precip;
  ter->PrecipScale = w->PrecipScale;
  ter->FogFloat= weatherDat.FogFloat = w->FogFloat;
  ter->ThunderFloat = w->ThunderFloat;
  weatherDat.unk0x4 = ter->PrecipScale;
  set_weather_flags(ter->rainByte);
}

void World::get_WeatherTemp(TerrainStruct *ter,WeatherTemp *w){
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

u8 World::set_timeofDay(TerrainStruct *param_1,Calendar *param_2){
  u8 TVar1;
  u8 TodNew;
  byte hr;
  
  if (param_1->DayNightMagic != '\0') {
    return false;
  }
  hr = param_2->hour;
  TodNew = param_1->partOfDay;
  if (hr < 6) {
    TVar1 = TIME_NIGHT;
  }
  else {
    if (hr < 9) {
      param_1->partOfDay = TIME_MORNING;
      goto LAB_800853c0;
    }
    TVar1 = TIME_MIDDAY;
    if ((0xb < hr) && (TVar1 = TIME_AFTERNOON, 0x11 < hr)) {
      if (hr < 0x15) {
        TVar1 = TIME_EVENING;
      }
      else {
        TVar1 = TIME_NIGHT;
      }
    }
  }
  param_1->partOfDay = TVar1;
LAB_800853c0:
  return param_1->partOfDay != TodNew;
}



void World::set_weather(TerrainStruct *ter,Calendar *cal){
  u8 bVar1;
  u8 bVar2;
  PRECIPITATION PVar3;
  float fVar5;
  
  if (75 < RollD(1,100)) {
    ter->windByte = 0;
    ter->rainByte = CLEAR;
    ter->PrecipScale = 0.0;
    ter->FogFloat = 0.0;
    bVar1 = weather_terrain_array[ter->terrain];
    bVar2 = weather_month_array[cal->month];
    if ((s32)(((u32)bVar2 + (s32)(char)bVar1) * 0x10000) >> 0x10 < RollD(1,100)) {}
    else {  
      if (RollD(1,100) < 70) {
        ter->rainByte = RAIN;
        ter->windByte = 2;
        if (ter->terrain == 5) {ter->rainByte = SNOW;}
        fVar5 = RAND.GetFloatRange(terrain_rand_array[ter->terrain] - 0.15f,
                           terrain_rand_array[ter->terrain] + 0.15f);
        ter->PrecipScale = fVar5;
        if (fVar5 < 0.0) {ter->PrecipScale = 0.0;}
        fVar5 = 0.35;
      }
      else {
        fVar5 = 0.75;
        ter->windByte = 1;
        ter->rainByte = CLEAR;
        ter->PrecipScale = 0.0;
      }
      ter->FogFloat = RAND.GetFloatRange(0.1,fVar5);
    }
    ter->ThunderFloat = 0.0;
    if (ter->rainByte == RAIN) {ter->ThunderFloat = RAND.GetFloat0To1() * ter->PrecipScale;}
  }
  return;
}

void World::several_time_funcs(TerrainStruct *ter){
  Calendar CalTemp;

  GetCalendarDate(ter,&CalTemp);
  set_moonPhase(ter,&CalTemp);
  if (gDebugGameTime) {
    if (set_timeofDay(ter,&CalTemp)) set_weather(ter,&CalTemp);
    ChangeWind(ter, &ter->windVelocity, 0.05f, 0.05f);
    SetFlagArray_on_Time(ter->partOfDay,CalTemp.day,CalTemp.week,CalTemp.month);
    set_weather_flags(ter->rainByte);
    terrainStruct_floats(ter);
  }
}

void World::cap_ingame_time(TerrainStruct *ter){
  if (YEAR <= ter->InGameTime) ter->InGameTime -= YEAR;
}

void World::Lapse10Seconds(TerrainStruct *ter){
  ter->InGameTime += SECONDS(10);
  cap_ingame_time(ter);
  several_time_funcs(ter);}

void World::inc_ingame_time(TerrainStruct *param_1,s32 delta){
  param_1->InGameTime += (delta * param_1->daySpeed);
  cap_ingame_time(param_1);
  several_time_funcs(param_1);}

void World::Lapse8Hours(TerrainStruct *ter){
  ter->InGameTime += HOURS(8);
  cap_ingame_time(ter);
  several_time_funcs(ter);}

void World::add_playTime(TerrainStruct *param_1,s32 x){param_1->PlayTime += x;}

u32 World::GetTime(TerrainStruct *param_1){return param_1->InGameTime;}

void World::SetTime(TerrainStruct *param_1,u32 param_2){param_1->InGameTime = param_2;}

u8 World::GetMonth(TerrainStruct *param_1){return param_1->InGameTime / DAYS(56);}

u8 World::GetWeek(TerrainStruct *param_1){return (param_1->InGameTime % DAYS(56)) / DAYS(7);}

u8 World::GetDay(TerrainStruct *param_1){return (param_1->InGameTime % DAYS(7)) / DAYS(1);}

u8 World::GetHour(TerrainStruct *param_1){return (param_1->InGameTime % DAYS(1) >> 6) / 0xd2f;}

u8 World::GetMinute(TerrainStruct *param_1){return (param_1->InGameTime + ((param_1->InGameTime >> 6) / 0xd2f) * -HOURS(1)) / SECONDS(60);}

u8 World::GetSecond(TerrainStruct *param_1){return (param_1->InGameTime % SECONDS(60)) / SECONDS(1);}

float World::get_timeofDay_float(TerrainStruct *param_1){
  float fVar1 = (float)(param_1->InGameTime % DAYS(1)) / (float)(DAYS(1)) + param_1->TimeOfDayFloat;
  while (fVar1 < 0.0) {fVar1 = (float)((double)fVar1 + 1.0);}
  while (1.0f <= fVar1) {fVar1 = (float)((double)fVar1 - 1.0);}
  return fVar1;
}

void World::terrainStruct_floats(TerrainStruct *param_1){
  float fVar1;
  float fVar2;
  float fVar3;
  
  if (param_1->float0x30 != 0.0) {
    fVar1 = param_1->float0x2c;
    fVar3 = fVar1 - param_1->TimeOfDayFloat;
    if (fVar3 <= 0.0) {
      fVar3 = -fVar3;
    }
    fVar2 = param_1->float0x30 * gGlobals.delta;
    if (0.0 < fVar2) {
      if (fVar2 < fVar3) {
        fVar1 = param_1->float0x30;
        goto LAB_80085a64;
      }
      param_1->TimeOfDayFloat = fVar1;
    }
    else {
      if (-fVar2 < fVar3) {
        fVar1 = param_1->float0x30;
LAB_80085a64:
        param_1->TimeOfDayFloat = param_1->TimeOfDayFloat + fVar1 * gGlobals.delta;
        return;
      }
      param_1->TimeOfDayFloat = fVar1;
    }
    param_1->float0x30 = 0.0;
  }
  return;
}

void World::spellvisuals_1(TerrainStruct *param_1,float param_2,float param_3,s16 param_4){
  float fVar1;
  float fVar2;
  
  fVar2 = param_1->TimeOfDayFloat;
  param_1->TimeOfDayFloat = 0.0;
  fVar1 = get_timeofDay_float(param_1);
  param_1->TimeOfDayFloat = fVar2;
  if (param_4 == 0) {
    if (0.0 < param_2) {fVar1 = param_2 - fVar1;}
    else {fVar1 = -param_2 - fVar1;}
  }
  else {
    if (param_2 <= 0.0) {param_2 = -param_2;}
    param_1->float0x2c = param_2 - fVar1;
    fVar1 = param_1->float0x2c;
    if (fVar1 < 0.0) {
      do {fVar1 = (float)((double)fVar1 + 1.0d);} while (fVar1 < 0.0);
      param_1->float0x2c = fVar1;
      fVar1 = param_1->float0x2c;
    }
    if (1.0f <= fVar1) {
      do {fVar1 = (float)((double)fVar1 - 1.0d);} while (1.0f <= fVar1);
      param_1->float0x2c = fVar1;
    }
    fVar1 = param_1->float0x2c;
    if (param_4 != 2) goto LAB_80085bb8;
    fVar1 = (float)((double)fVar1 - 1.0d);
  }
  param_1->float0x2c = fVar1;
  fVar1 = param_1->float0x2c;
LAB_80085bb8:
  param_1->float0x30 = (fVar1 - param_1->TimeOfDayFloat) / param_3;
}

void World::spellvisuals_2(TerrainStruct *param_1,float param_2){
  float fVar1 = 1.0f;
  if (0.0 < param_2) fVar1 = param_2;
  param_1->float0x2c = 0.0;
  param_1->float0x30 = (0.0 - param_1->TimeOfDayFloat) / fVar1;
}
