#include "GhidraDump.h"

typedef enum StatEnum {
    STAT_INT,
    STAT_WIL,
    STAT_DEX,
    STAT_END,
    STAT_STR,
    STAT_STAM,
    STAT_LV,
	STAT_TOTAL,
    STAT_NONE=255
} StatEnum;

#define STATCOUNT STAT_TOTAL
struct CharStats { /* Stat Arrays of Party Members */
    u8 Base[STATCOUNT]; /* init'd or pirchased stat points */
    s8 health[STATCOUNT];
    u8 magicMod[STATCOUNT]; /* added/subbed by magic */
    u8 Modded[STATCOUNT]; /* modded by equipment, spells, ect. */
};

extern char** stat_labels;
extern s32 base_stat_cap[STATCOUNT]; //{30,30,30,40,30,90,40}
extern s32 modded_stat_cap[STATCOUNT]; //{40,40,40,50,40,120,40}
extern s32 stat_multiplier[STATCOUNT]; //{12,12,24,12,12,4,500} by (stat+1)^2*stat_multiplier