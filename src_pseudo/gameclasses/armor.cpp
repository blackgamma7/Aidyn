#include "itemInstances.h"
#include "armordb.h"

void make_temp_armor_3(ArmorInstance *inst,ItemID id) { 
 make_temp_item((GearInstance *)inst,id);
 ArmorRam *arRam = &gArmorDBp->Armor[GETINDEX(id)];
  inst->rom0x1d = arRam->rom0x1d;
  inst->DEF = arRam->defence;
  inst->Protect = arRam->protection;
  inst->dex = arRam->dex;
  inst->stealth = arRam->stealth;
}

void ArmorInstance_ClearEffect(ArmorInstance *inst) {
    clear_weapon_effects((WeaponInstance *)inst);}
