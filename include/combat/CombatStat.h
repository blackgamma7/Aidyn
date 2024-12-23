#include "PlaneObj.h"
#include "PlayerData.h"

struct CombatStatIndicatorHandler {
    Borg1Data *borg1Digits[10];
    PlaneObj *Indicators;
    u8 *array;
    u8 index;
    u8 pad[3];
};

CombatStatIndicatorHandler combatStatIndicatorDat;

#define MAXSTATDIGITS 16
namespace CombatStatIndicator{
void Init(void);
uint AddItem(playerData *param_1,int type,short num);
Gfx * Tick(Gfx *g,int delta);
void Free(void);
};