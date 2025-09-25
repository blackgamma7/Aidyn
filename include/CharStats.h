#include "itemID.h"
#include "savefiles.h"

enum StatEnum {
    STAT_INT,
    STAT_WIL,
    STAT_DEX,
    STAT_END,
    STAT_STR,
    STAT_STAM,
    STAT_LV,
	STAT_TOTAL,
    STAT_NONE=255
};

#define STATCOUNT STAT_TOTAL
struct CharStats_s { /* Stat Arrays of Party Members */
    u8 Base[STATCOUNT]; /* init'd or purchased stat points */
    s8 health[STATCOUNT];
    u8 magicMod[STATCOUNT]; /* added/subbed by magic */
    u8 Modded[STATCOUNT]; /* modded by equipment, spells, ect. */
};
//TODO(?): combine into class
namespace CharStats{
    void Init(CharStats_s *,ItemID);
    void Save(CharStats_s *,SaveFile *);
    void Load(CharStats_s *,SaveFile *);
    void Copy(CharStats_s* ,CharStats_s*);
    void AddBase(CharStats_s* ,u8 ,s8 );
    void addModdedHealth(CharStats_s*,u8,s8);
    void AddModdedMagic(CharStats_s* ,u8 ,s8);
    void SubModdedMagic(CharStats_s* ,u8,s8);
    void AddModded(CharStats_s*,u8,s8);
    void SubModded(CharStats_s*,u8,s8);
    s32 getBase(CharStats_s*,u8);
    s32 getModded(CharStats_s*,u8);
    s32 GetTraningPrice(CharStats_s*,u8);
    u8 isStatCapped(CharStats_s*,u8);
    s32 GetBase2(CharStats_s*,u8);
    s32 getBaseModDiff(CharStats_s*,u8);
    s32 capStatMax(CharStats_s*,u8,s32,s32 *);
    u8 someStatCheck(CharStats_s*,u8);
};

char** Stat_labels=NULL;
s32 base_stat_cap[STATCOUNT] = {30,30,30,40,30,90,40};
s32 modded_stat_cap[STATCOUNT] = {40,40,40,50,40,120,40};
s32 stat_multiplier[STATCOUNT] = {12,12,24,12,12,4,500};//by (stat+1)^2*stat_multiplier