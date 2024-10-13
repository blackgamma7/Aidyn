#include "mathN64.h"

enum TIME_OF_DAY{TIME_MORNING, TIME_MIDDAY, TIME_AFTERNOON, TIME_EVENING, TIME_NIGHT};
enum PRECIPITATION{CLEAR, RAIN, SNOW};

struct TerrainStruct {
    u16 daySpeed; /* set to 72 (1.2 seconds per tick) */
    u8 partOfDay; /* 21-6 night, 6-9 morning, 9-12 midday, 12-17 afternoon, 17-21 evening */
    u8 moonPhases; /* ranges from 0-3 */
    u8 windByte;
    char DayNightMagic;
    u8 rainByte; /* clear, rain, snow */
    float PrecipScale;
    float FogFloat;
    float ThunderFloat;
    vec3f windVelocity;
    u32 InGameTime; /* measured in seconds * 60 */
    u8 terrain; /* detemines terrain? */
    float TimeOfDayFloat;
    float float0x2c;
    float float0x30;
    int PlayTime;
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


namespace World{
void init(TerrainStruct *);
void SetTerrain(TerrainStruct *,u8);
u8 getTerrain(TerrainStruct *);
void IncTimeOfDay(TerrainStruct *);
void inc_dayNightMagic(TerrainStruct *);
void dec_dayNightMagic(TerrainStruct *);
void SetTimeFromCalendar(TerrainStruct *,Calendar *);
void GetCalendarDate(TerrainStruct *,Calendar *);
void ShiftTimeOfDay(TerrainStruct *,s8 );
void ChangeWind(TerrainStruct *,vec3f *,float ,float );
void set_with_WeatherTemp(TerrainStruct *,WeatherTemp *);
void get_WeatherTemp(TerrainStruct *,WeatherTemp *);
void set_moonPhase(TerrainStruct *,Calendar *);
u8 set_timeofDay(TerrainStruct *,Calendar *);
void set_weather(TerrainStruct *,Calendar *);
void several_time_funcs(TerrainStruct *);
void cap_ingame_time(TerrainStruct *);
void Lapse10Seconds(TerrainStruct *);
void inc_ingame_time(TerrainStruct *,s32 );
void Lapse8Hours(TerrainStruct *);
void add_playTime(TerrainStruct *,s32 );
u32 GetTime(TerrainStruct *);
void SetTime(TerrainStruct *,u32 );
u8 GetMonth(TerrainStruct *);
u8 GetWeek(TerrainStruct *);
u8 GetDay(TerrainStruct *);
u8 GetHour(TerrainStruct *);
u8 GetMinute(TerrainStruct *);
u8 GetSecond(TerrainStruct *);
float get_timeofDay_float(TerrainStruct *);
void terrainStruct_floats(TerrainStruct *);
void spellvisuals_1(TerrainStruct *,float ,float ,s16 );
void spellvisuals_2(TerrainStruct *,float );
};

//60 ticks per second
#define SECONDS(x) (x*60)
#define MINUTES(x) (SECONDS(60)*x)
#define HOURS(x) (MINUTES(60)*x)
#define DAYS(x) (HOURS(24)*x)
//based on cap_ingame_time()
#define YEAR DAYS(336)