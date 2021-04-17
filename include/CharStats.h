#define STATCOUNT 7

struct{
	byte Base[STATCOUNT];
	byte Array2[STATCOUNT];
	byte Array3[STATCOUNT];
	byte modded[STATCOUNT];
}CharStats;

extern char** stat_labels;
extern int base_stat_cap[STATCOUNT]; //{30,30,30,40,30,90,40}
extern int modded_stat_cap[STATCOUNT]; //{40,40,40,50,40,120,40}
extern int stat_multiplier[STATCOUNT]; //{12,12,24,12,12,4,500} by (stat+1)^2*stat_multiplier


extern void init_CharStats(CharStats *,ItemID);
extern void Ofunc_NOOP_800845f4(void);
extern void copyCharStats(CharStats*,CharStats*);
extern void addBaseStat(CharStats*,byte,byte);
extern void addModdedStat(CharStats*,byte,byte);
extern void addModdedStats_flag(CharStats*,byte,byte);
extern void SubtractModdedStats(CharStats*,byte,byte);
extern void addtoModdedStats(CharStats*,byte,byte);
extern void subtractFromModdedStats(CharStats*,byte,byte);
extern int getBaseStat(CharStats *,byte);
extern int getModdedStat(CharStats *,byte);
extern int get_stat_trainPrice(CharStats *,byte);
extern bool isStatCapped(CharStats *,byte);
extern int get_base_stat_(CharStats *,byte);
extern int capStatMax(byte,int,int *);
extern bool someStatCheck(CharStats *,byte);