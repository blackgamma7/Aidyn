#define STATCOUNT 7

struct{
	u8 Base[STATCOUNT];
	u8 Array2[STATCOUNT];
	u8 Array3[STATCOUNT];
	u8 modded[STATCOUNT];
}CharStats;

extern char** stat_labels;
extern s32 base_stat_cap[STATCOUNT]; //{30,30,30,40,30,90,40}
extern s32 modded_stat_cap[STATCOUNT]; //{40,40,40,50,40,120,40}
extern s32 stat_multiplier[STATCOUNT]; //{12,12,24,12,12,4,500} by (stat+1)^2*stat_multiplier


extern void init_CharStats(CharStats *,ItemID);
extern void Ofunc_NOOP_800845f4(void);
extern void copyCharStats(CharStats*,CharStats*);
extern void addBaseStat(CharStats*,u8,u8);
extern void addModdedStat(CharStats*,u8,u8);
extern void addModdedStats_flag(CharStats*,u8,u8);
extern void SubtractModdedStats(CharStats*,u8,u8);
extern void addtoModdedStats(CharStats*,u8,u8);
extern void subtractFromModdedStats(CharStats*,u8,u8);
extern s32 getBaseStat(CharStats *,u8);
extern s32 getModdedStat(CharStats *,u8);
extern s32 get_stat_trainPrice(CharStats *,u8);
extern bool isStatCapped(CharStats *,u8);
extern s32 get_base_stat_(CharStats *,u8);
extern s32 capStatMax(u8,s32,s32 *);
extern bool someStatCheck(CharStats *,u8);