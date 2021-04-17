enum TIME_OF_DAY{MORNING, MIDDAY, AFTERNOON, EVENING, NIGHT};
enum PRECIPITATION{CLEAR, RAIN, SNOW};

struct TerrainStruct {
   u16 a; // set to 72 (0x48)
    u8 partOfDay; // 21-6 night, 6-9 morning, 9-12 midday, 12-17 afternoon, 17-21 evening
   u8 moonPhases; // ranges from 0-3
    s8 windByte;
    s8 DayNightMagic; //effected if Darkness/Light are used.
    u8 rainByte; // clear, rain, snow
    s8 unused;
    float weatherFloatA;
    float weatherFloatB;
    float weatherFloatC;
    vec3 coords; // could be to the sun
    uint InGameTime; // measured in seconds * 60
   u8 terrain; // detemines terrain? used in camping funcs. 0-27
   u8 pad[3];
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
   u8 minute; // (x + ((x >> 6) / 0xd2f) * -0x34bc0) / 0xe10
   u8 second; // (x % 0xe10) / 0x3c
};

struct WeatherTemp {
    float floatA;
    float floatB;
    float floatC;
    u8 precip;
  u8 unk_0xd;
  u8 unk_0xe;
  u8 unk_0xf;
};

extern char** humidty_labels;
extern char** timeofday_labels;
extern char** moon_phase_labels
extern char** dark_storm_labels;
extern char** weekday_labels;
extern char** terrain_labels;
extern char** precip_labels;

extern TerrainStruct* TerrainPointer;

extern u8 weather_month_array[8]; // {2Bh, 30h, 21h, 19h, 24h, 28h, 0h, 0h}
extern u8 weather_terrain_array[28];
// {0h, 0h, 0h, 9Ch, 5h, 1Eh, 0h, Fh, 0h, 0h, 14h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 64h, 0h, 0h, 0h, 0h, 1Eh, Fh, 0h, 9Ch, 9Ch}
extern float terrain_rand_array[28];
extern u8 timeofday_hous[5]; //debug only {6,9,12,18,21}

void TerrainStruct_init(TerrainStruct *);
void SetTerrain(TerrainStruct *,byte);
byte getTerrain(TerrainStruct *);
void inc_timeofDay(TerrainStruct *);
void inc_dayNightMagic(TerrainStruct *);
void dec_dayNightMagic(TerrainStruct *);
void set_time_from_calendar(TerrainStruct *,Calendar *);
void get_ingame_calendar(TerrainStruct *,Calendar *);
void func_with_timeofDay(TerrainStruct *,char );
void terrainStruct_rand_vec3(vec3 *,float ,float );
void set_with_WeatherTemp(TerrainStruct *,WeatherTemp *);
void get_WeatherTemp(TerrainStruct *,WeatherTemp *);
void set_moonPhase(TerrainStruct *,Calendar *);
bool set_timeofDay(TerrainStruct *,Calendar *);
void set_weather(TerrainStruct *,Calendar *);
void several_time_funcs(TerrainStruct *);
void cap_ingame_time(TerrainStruct *);
void add_10_ingame_seconds(TerrainStruct *);
void add_to_ingame_time(TerrainStruct *,int );
void lapse_8_hours(TerrainStruct *);
void add_playTime(TerrainStruct *,int );
uint get_inGame_time(TerrainStruct *);
void set_inGame_time(TerrainStruct *,uint );
uint get_ingame_month(TerrainStruct *);
uint get_ingame_week(TerrainStruct *);
uint get_ingame_day(TerrainStruct *);
uint get_ingame_hour(TerrainStruct *);
uint get_ingame_minute(TerrainStruct *);
uint get_ingame_second(TerrainStruct *);
float get_timeofDay_float(TerrainStruct *);
void func_terrainStruct_floats(TerrainStruct *);
void terrainstruct_spellvisuals_1(TerrainStruct *,float ,float ,short );
void Terrainstruct_spellvisuals_2(TerrainStruct *,float );

