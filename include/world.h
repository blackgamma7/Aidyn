#include "commonTypes.h"

enum TIME_OF_DAY{MORNING, MIDDAY, AFTERNOON, EVENING, NIGHT};
enum PRECIPITATION{CLEAR, RAIN, SNOW};

struct TerrainStruct {
   u16 a; // set to 72 (0x48). used as multiple for deltaTime.
   u8 partOfDay; // 21-6 night, 6-9 morning, 9-12 midday, 12-17 afternoon, 17-21 evening
   u8 moonPhases; // ranges from 0-3
   s8 windByte; //clear, fog
   s8 DayNightMagic; //effected if Darkness/Light are used.
   u8 rainByte; // clear, rain, snow
   s8 unused;
   float PrecipScale;
   float FogFloat;
   float ThunderFloat;
   vec3f windVelocity;
   u32 InGameTime; // measured in seconds * 60
   u8 terrain; // determines terrain? used in camping funcs. 0-27
   u8 pad[3]; //may have orginally used for a "temperature" field
   float TimeOfDayFloat; //these 3 seem to effect combat visuals?
   float float0x2c;
   float float0x30;
   s32 PlayTime;
};

struct Calendar { // TerrainStruct->IngameTime as x
   u8 month; // x / 0x114db000
   u8 week; // (x % 0x114db000)/0x229b600 day:
   u8 day; // (x % 0x229b600) / 0x4f1a00
   u8 hour; // (x % 0x4f1a00 >> 6) / 0xd2f
   u8 minute; // (x + ((x >> 6) / 0xd2f) * -0x34bc0) / 3600
   u8 second; // (x % 3600) / 60
};

struct WeatherTemp {
  float PrecipScale;
  float FogFloat;
  float ThunderFloat;
  u8 precip;
  u8 unk0xd[3]; //likely padding
};

extern char** humidty_labels;
extern char** timeofday_labels;
extern char** moon_phase_labels;
extern char** dark_storm_labels;
extern char** weekday_labels;
extern char** terrain_labels;
extern char** precip_labels;

extern TerrainStruct* TerrainPointer;

extern u8 weather_month_array[8]; // {2Bh, 30h, 21h, 19h, 24h, 28h, 0h, 0h}
extern u8 weather_terrain_array[28];
// {0h, 0h, 0h, 9Ch, 5h, 1Eh, 0h, Fh, 0h, 0h, 14h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 64h, 0h, 0h, 0h, 0h, 1Eh, Fh, 0h, 9Ch, 9Ch}
extern float terrain_rand_array[28];
extern u8 timeofday_hours[5]; //debug only {6,9,12,18,21}

void World::init(TerrainStruct *);
void World::SetTerrain(TerrainStruct *,u8);
u8 World::getTerrain(TerrainStruct *);
void World::IncTimeOfDay(TerrainStruct *);
void inc_dayNightMagic(TerrainStruct *);
void dec_dayNightMagic(TerrainStruct *);
void World::SetTimeFromCalendar(TerrainStruct *,Calendar *);
void GetCalendarDate(TerrainStruct *,Calendar *);
void func_with_timeofDay(TerrainStruct *,char );
void World::ChangeWind(vec3f *,float ,float );
void set_with_WeatherTemp(TerrainStruct *,WeatherTemp *);
void get_WeatherTemp(TerrainStruct *,WeatherTemp *);
void set_moonPhase(TerrainStruct *,Calendar *);
bool set_timeofDay(TerrainStruct *,Calendar *);
void set_weather(TerrainStruct *,Calendar *);
void several_time_funcs(TerrainStruct *);
void cap_ingame_time(TerrainStruct *);
void Lapse10Seconds(TerrainStruct *);
void add_to_ingame_time(TerrainStruct *,s32 );
void World::Lapse8Hours(TerrainStruct *);
void add_playTime(TerrainStruct *,s32 );
u32 World::GetTime(TerrainStruct *);
void World::SetTime(TerrainStruct *,u32 );
u32 World::GetMonth(TerrainStruct *);
u32 World::GetWeek(TerrainStruct *);
u32 World::GetDay(TerrainStruct *);
u32 World::GetHour(TerrainStruct *);
u32 World::GetMinute(TerrainStruct *);
u32 World::GetSecond(TerrainStruct *);
float get_timeofDay_float(TerrainStruct *);
void func_terrainStruct_floats(TerrainStruct *);
void terrainstruct_spellvisuals_1(TerrainStruct *,float ,float ,s16 );
void Terrainstruct_spellvisuals_2(TerrainStruct *,float );
