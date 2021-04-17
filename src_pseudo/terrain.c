#include "terrain.h"

u8 weather_month_array[8] = {0x2B, 0x30, 0x21, 0x19, 0x24, 0x28, 0, 0};


void TerrainStruct_init(TerrainStruct *ter){
  memset(ter,0,sizeof(TerrainStruct));
  ter->a = 0x48;
  ter->windByte = '\0';
  ter->partOfDay = Morning;
  ter->moonPhases = 0;
  ter->terrain = 0;
  ter->rainByte = clear;
  ter->coords[0] = 1.0f;
  ter->coords[1] = -0.1f;
  ter->coords[2] = 1.0f;
  vec3_normalize((vec3 *)ter->coords);
  multiVec3((vec3 *)ter->coords,0.02314815);
  return;
}

void SetTerrain(TerrainStruct *ter,byte param_2){
  uint uVar1;
  uint uVar2;
  
  if (param_2 < 0x1c) {
    if (ter->terrain != param_2) {
      uVar2 = ter->partOfDay + 1 & 0xff;
      uVar1 = uVar2 / 5;
      ter->partOfDay = (char)uVar2 - ((char)(uVar1 << 2) + (char)uVar1);
    }
    ter->terrain = param_2;
    several_time_funcs(ter);
    set_terrain_flags(ter->terrain);
    return;
  }
  manualCrash("World::SetTerrain","Invalid Terrain type!");
}

byte getTerrain(TerrainStruct *ter){return ter->terrain;}

void inc_timeOfDay(TerrainStruct *param_1){
  uint uVar1;
  uint uVar2;
  
  uVar2 = param_1->partOfDay + 1;
  uVar1 = uVar2 / 5;
  param_1->partOfDay = (char)uVar2 - ((char)(uVar1 << 2) + (char)uVar1);
  several_time_funcs(param_1);
  return;
}

void inc_dayNightMagic(TerrainStruct *param_1){
  param_1->DayNightMagic++;
  return;
}

void dec_dayNightMagic(TerrainStruct *param_1){
  if (param_1->DayNightMagic != 0) {param_1->DayNightMagic--;}
  return;
}

void set_time_from_calendar(TerrainStruct *param_1,Calendar *param_2){
  param_1->InGameTime =
       (uint)param_2->month * 0x114db000 + (uint)param_2->week * 0x229b600 +
       (uint)param_2->day * 0x4f1a00 + ((uint)param_2->hour * 0xe0 + (uint)param_2->hour) * 0x3c0 +
       ((uint)param_2->minute * 0xe0 + (uint)param_2->minute) * 0x10 + (uint)param_2->second * 0x3c;
  several_time_funcs(param_1);
  SetFlagArray_on_Time(param_1->partOfDay,param_2->day,param_2->week,param_2->month);
  return;
}

void get_ingame_calendar(TerrainStruct *param_1,Calendar *cal){
  cal->month = get_ingame_month(param_1);
  cal->week = get_ingame_week(param_1);
  cal->day = get_ingame_day(param_1);
  cal->hour = get_ingame_hour(param_1);
  cal->minute = get_ingame_minute(param_1);
  cal->second = get_ingame_second(param_1);
  return;
}

void func_with_TimeofDay(TerrainStruct *ter,char param_2){
  uint uVar1;
  uint uVar2;
  int iVar3;
  Calendar tempCal;
  
  iVar3 = (int)param_2;
  if (iVar3 < 1) {
    if (-1 < iVar3) {
      return;
    }
    iVar3 = (uint)ter->partOfDay + iVar3;
    if (iVar3 < 0) {
      ter->partOfDay = ter->partOfDay + param_2 + '\x05';
    }
    else {
      ter->partOfDay = (TIME_OF_DAY)iVar3;
    }
  }
  else {
    uVar2 = (uint)ter->partOfDay + iVar3 & 0xff;
    uVar1 = uVar2 / 5;
    ter->partOfDay = (char)uVar2 - ((char)(uVar1 << 2) + (char)uVar1);
  }
  get_ingame_calendar(ter,&tempCal);
  tempCal.hour = TIME_OF_DAY_hours[ter->partOfDay];
  tempCal.minute = 0;
  tempCal.second = 0;
  set_time_from_calendar(ter,&tempCal);
  return;
}

void terrainStruct_rand_vec3(vec3 *coords,float arg1,float arg2){
  float x;
  float fVar1;
  
  x = vec3_normalize(coords);
  if (Random::rand_float(&gGlobals) <= arg1) {
    (*coords)[0] += Random::rand_float_range(&gGlobals,-0.1f,0.1f);
    (*coords)[1] += Random::rand_float_range(&gGlobals,-0.004,0.001);
    (*coords)[2] += Random::rand_float_range(&gGlobals,-0.1f,0.1f);
    vec3_normalize(coords);
  }
  if (Random::rand_float(&Random::gGlobals) <= arg2) {
    fVar1 = Random::rand_float_range(&gGlobals,-0.002314815,0.002314815);
    fVar1 = x + fVar1;
    if ((fVar1 <= 0.23148148f) && (x = fVar1, fVar1 < 0.0)) {
      x = 0.0;
    }
  }
  multiVec3(coords,x);
  return;
}

void set_with_WeatherTemp(TerrainStruct *ter,WeatherTemp *w){
  ter->rainByte = w->precip;
  ter->weatherFloatA = w->floatA;
  weatherDat.field_0xc = w->floatB;
  ter->weatherFloatB = weatherDat.field_0xc;
  ter->weatherFloatC = w->floatC;
  weatherDat.field_0x4 = ter->weatherFloatA;
  set_weather_flags(ter->rainByte);
  return;
}


void get_WeatherTemp(TerrainStruct *ter,WeatherTemp *w){
  w->precip = ter->rainByte;
  w->floatA = ter->weatherFloatA;
  w->floatB = ter->weatherFloatB;
  w->floatC = ter->weatherFloatC;
  return;
}

void set_moonPhase(TerrainStruct *ter,Calendar *cal){
  uint X;
  
  X = (int)(((uint)cal->day + (cal->week & 3) * 7) * 0x1000000) >> 0x18;
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

bool set_timeofDay(TerrainStruct *param_1,Calendar *param_2){
  TIME_OF_DAY TVar1;
  TIME_OF_DAY TodNew;
  byte hr;
  
  if (param_1->DayNightMagic != 0) {return false;}
  hr = param_2->hour;
  TodNew = param_1->partOfDay;
  if (hr < 6) {TVar1 = NIGHT;}
  else {
    if (hr < 9) {
      param_1->partOfDay = MORNING;
      goto End;}
    TVar1 = MIDDAY;
    if ((0xb < hr) && (TVar1 = AFTERNOON, 0x11 < hr)) {
      if (hr < 0x15) {TVar1 = EVENING;}
      else {TVar1 = NIGHT;}
    }
  }
  param_1->partOfDay = TVar1;
End:
  return param_1->partOfDay != TodNew;
}

void set_weather(TerrainStruct *ter,Calendar *cal){
  byte bVar1;
  byte bVar2;
  PRECIPITATION PVar3;
  float fVar5;
  
  if (0x4b < RollD(1,100)) {
    ter->windByte = '\0';
    ter->rainByte = CLEAR;
    ter->weatherFloatA = 0.0;
    ter->weatherFloatB = 0.0;
    bVar1 = weather_terrain_array[ter->terrain];
    bVar2 = weather_month_array[cal->month];
    if ((int)(((uint)bVar2 + (int)(char)bVar1) * 0x10000) >> 0x10 < RollD(1,100)) {
      PVar3 = ter->rainByte;}
    else {  
      if (RollD(1,100) < 0x46) {
        ter->rainByte = RAIN;
        ter->windByte = '\x02';
        if (ter->terrain == 5) {ter->rainByte = SNOW;}
        fVar5 = rand_float_range
                          (&gGlobals,terrain_rand_array[ter->terrain] - 0.15f,
                           terrain_rand_array[ter->terrain] + 0.15f);
        ter->weatherFloatA = fVar5;
        if (fVar5 < 0.0) {ter->weatherFloatA = 0.0;}
        fVar5 = 0.35;
      }
      else {
        fVar5 = 0.75;
        ter->windByte = '\x01';
        ter->rainByte = CLEAR;
        ter->weatherFloatA = 0.0;
      }
      fVar5 = rand_float_range(&gGlobals,0.1,fVar5);
      ter->weatherFloatB = fVar5;
      PVar3 = ter->rainByte;
    }
    ter->weatherFloatC = 0.0;
    if (PVar3 == RAIN) {ter->weatherFloatC = rand_float(&gGlobals) * ter->weatherFloatA;}
  }
  return;
}

void several_time_funcs(TerrainStruct *ter){
  bool bVar1;
  Calendar CalTemp;
  
  get_ingame_calendar(ter,&CalTemp);
  set_moonPhase(ter,&CalTemp);
  if (weather_flag != 0) {
    if (set_timeofDay(ter,&CalTemp)) {set_weather(ter,&CalTemp);}
    terrainStruct_rand_vec3((vec3 *)ter->coords,0.05f,0.05f);
    SetFlagArray_on_Time(ter->partOfDay,CalTemp.day,CalTemp.week,CalTemp.month);
    set_weather_flags(ter->rainByte);
    func_terrainStruct_floats(ter);
  }
  return;
}

void cap_ingame_time(TerrainStruct *ter){
  if (0x67d21fff < ter->InGameTime) {ter->InGameTime += 0x982de000;}
  return;
}

void add_10_ingame_seconds(TerrainStruct *ter){
  ter->InGameTime += 600;
  cap_ingame_time(ter);
  several_time_funcs(ter);
  return;
}

void add_to_ingame_time(TerrainStruct *param_1,int delta){
  param_1->InGameTime += delta * (uint)param_1->a;
  cap_ingame_time(param_1);
  several_time_funcs(param_1);
  return;
}

void lapse_8_hours(TerrainStruct *ter){
  ter->InGameTime += 0x1a5e00;
  cap_ingame_time(ter);
  several_time_funcs(ter);
  return;
}

void add_playTime(TerrainStruct *param_1,int param_2){
  param_1->PlayTime += param_2;
  return;
}

uint get_inGame_time(TerrainStruct *param_1){return param_1->InGameTime;}

void set_inGame_time(TerrainStruct *param_1,uint param_2){
  param_1->InGameTime = param_2;
  return;
}

uint get_ingame_month(TerrainStruct *param_1){return param_1->InGameTime / 0x114db000;}

uint get_ingame_week(TerrainStruct *param_1){return (param_1->InGameTime % 0x114db000) / 0x229b600;}

uint get_ingame_day(TerrainStruct *param_1){return (param_1->InGameTime % 0x229b600) / 0x4f1a00;}

uint get_ingame_hour(TerrainStruct *param_1){return (param_1->InGameTime % 0x4f1a00 >> 6) / 0xd2f;}

uint get_ingame_minute(TerrainStruct *param_1){return (param_1->InGameTime + ((param_1->InGameTime >> 6) / 0xd2f) * -0x34bc0) / 0xe10 & 0xff;}

uint get_ingame_second(TerrainStruct *param_1){return (param_1->InGameTime % 0xe10) / 0x3c;}

float get_timeofDay_float(TerrainStruct *param_1){
  float fVar1;
  
  fVar1 = (float)(param_1->InGameTime % 0x4f1a00) / 5184000.0f +
          param_1->TimeOfDayFloat;
  while (fVar1 < 0.0) {fVar1 = (float)((double)fVar1 + 1.0d);}
  while (1.0f <= fVar1) {fVar1 = (float)((double)fVar1 - 1.0d);}
  return fVar1;
}

void func_terrainStruct_floats(TerrainStruct *param_1){
  float fVar1;
  float fVar2;
  float fVar3;
  
  if (param_1->float0x30 != 0.0) {
    fVar1 = param_1->float0x2c;
    fVar3 = fVar1 - param_1->TimeOfDayFloat;
    if (fVar3 <= 0.0) {
      fVar3 = -fVar3;
    }
    fVar2 = param_1->float0x30 * gGlobals.delay;
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
        param_1->TimeOfDayFloat = param_1->TimeOfDayFloat + fVar1 * gGlobals.delay;
        return;
      }
      param_1->TimeOfDayFloat = fVar1;
    }
    param_1->float0x30 = 0.0;
  }
  return;
}

void terrainstruct_spellvisuals_1(TerrainStruct *param_1,float param_2,float param_3,short param_4){
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
      do {
        fVar1 = (float)((double)fVar1 + 1.0d);
      } while (fVar1 < 0.0);
      param_1->float0x2c = fVar1;
      fVar1 = param_1->float0x2c;
    }
    if (1.0f <= fVar1) {
      do {
        fVar1 = (float)((double)fVar1 - 1.0d);
      } while (1.0f <= fVar1);
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
  return;
}

void Terrainstruct_spellvisuals_2(TerrainStruct *param_1,float param_2){
  float fVar1;
  
  fVar1 = 1.0f;
  if (0.0 < param_2) {fVar1 = param_2;}
  param_1->float0x2c = 0.0;
  param_1->float0x30 = (0.0 - param_1->TimeOfDayFloat) / fVar1;
  return;
}
