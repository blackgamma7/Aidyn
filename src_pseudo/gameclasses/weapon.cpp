#include "weapondb.h"
#include "CharSkills.h"
#include "itemInstances.h"

void createTempWeapon(WeaponInstance *w,ItemID id) {
  make_temp_item((GearInstance *)w,id);
  WeaponRam* wRam=&gWeaponsDB->weapons[GETINDEX(id)];
  w->weaponType = wRam->wepClass;
  w->hit = wRam->Hit;
  w->damage = wRam->damage;
  w->range = wRam->Range;
  w->animation = wRam->Animation;
  w->element = wRam->element;
  w->reqStr = wRam->ReqSTR;
}

void passto_clear_weapon_effects(WeaponInstance *w) {
  clear_weapon_effects(w);
}

bool isBreathSpitOrSpikes(WeaponInstance *w) {
  u8 bVar1 = GETINDEX((w->base).id);
  bool ret = false;
  if ((((w->range == 0) || (w->weaponType == WEAPON_Breath)) ||
      (w->weaponType == WEAPON_Spit)) || (bVar1 == 100)) {
    ret = true;
  }
  return ret;
}

