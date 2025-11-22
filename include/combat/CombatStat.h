#include "PlaneObj.h"
#include "PlayerData.h"

struct CombatStatIndicatorHandler {
    Borg1Header *borg1Digits[10];
    PlaneObj *Indicators;
    u8 *array;
    u8 index;
    u8 pad[3];
};

CombatStatIndicatorHandler combatStatIndicatorDat;

#define MAXSTATDIGITS 16
namespace CombatStatIndicator{
void Init(void);
u32 AddItem(playerData *param_1,int type,s16 num);
Gfx * Tick(Gfx *g,int delta);
void Free(void);
};