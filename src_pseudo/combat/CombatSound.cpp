#include "globals.h"
#include "combat/CombatStruct.h"

s8 FUN_80090cd0(playerData *param_1) {
  if (gGlobals.gameStateA != GameStateA_Combat) return -1;
  for(u16 i=0;i<gCombatP->EntCount;i++){
    if(param_1==gGlobals.combatActors[i]) return i;
  }
  return -1;
}

ItemID get_some_weapon_id(playerData *param_1) {
  ItemID ret;
  s8 ind = FUN_80090cd0(param_1);
  if (ind == -1) ret = 0;
  else {
    CharSheet *chara = (&gCombatP->combatEnts)[ind]->charSheetP;
    if (chara == NULL) ret = 0;
    else if (chara->weapons == NULL) ret = 0;
    else ret = (chara->weapons->base).id;
  }
  return ret;
}


ItemID Ofunc_80090da0(playerData *param_1) {
  ItemID ret;
  s8 ind = FUN_80090cd0(param_1);
  if (ind == -1) ret = 0;
  else {
    CharSheet *chara = (&gCombatP->combatEnts)[ind]->charSheetP;
    if (chara == NULL) ret = 0;
    else if (chara->armor[0] == NULL) ret = 0;
    else ret = chara->armor[0]->base.id;
  }
  return ret;
}

ItemID Ofunc_80090e04(playerData *param_1) {
  ItemID ret;
  s8 ind = FUN_80090cd0(param_1);
  if (ind == -1) ret = 0;
  else {
    CharSheet *chara = (&gCombatP->combatEnts)[ind]->charSheetP;
    if (chara == NULL) ret = 0;
    else if (chara->armor[1] == NULL) ret = 0;
    else ret = chara->armor[1]->base.id;
  }
  return ret;
}


u16 FUN_80090e68(playerData *param_1) {

  u16 sfxInds [] [4]={
    {2,2,0,0},    {2,2,0,0},    {3,3,0,0},    {2,2,0,0},    {105,105,0,0},
    {106,106,0,0},{107,107,0,0},{107,107,0,0},{105,105,0,0},{106,106,0,0},
    {105,105,0,0},{106,106,0,0},{2,2,0,0},    {3,3,0,0},    {107,107,0,0},
    {107,107,0,0},{2,2,0,0},    {3,3,0,0},    {84,84,0,0},  {85,85,0,0},  
    {82,82,0,0},  {84,84,0,0},  {83,83,0,0},  {84,84,0,0},  {83,83,0,0},
    {82,82,0,0},  {82,82,0,0},  {106,106,0,0},{106,106,0,0},{105,105,0,0},
    {105,105,0,0},{106,106,0,0},{107,107,0,0},{105,105,0,0},{106,106,0,0},
    {106,106,0,0},{2,2,0,0},    {107,107,0,0},{105,105,0,0},{105,105,0,0},
    {105,105,0,0},{106,106,0,0},{107,107,0,0},{105,105,0,0},{105,105,0,0},
    {106,106,0,0},{107,107,0,0},{106,106,0,0},{106,106,0,0},{105,105,0,0},
    {105,105,0,0},{106,106,0,0},{106,106,0,0},{106,106,0,0},{106,106,0,0},
    {107,107,0,0},{84,84,0,0},  {83,83,0,0},  {87,87,0,0},  {107,107,0,0},
    {90,90,0,0},  {87,87,0,0},  {104,104,0,0},{106,106,0,0},{105,105,0,0},
    {107,107,0,0},{0xffff,0xffff,0,0},{0}
  };
  ItemID x = get_some_weapon_id(param_1);
  if (x) {
    u8 ind = GETINDEX(x);
    for(u16 i=0;weapons_with_borg5[i]!=0xff;i++){
        if(weapons_with_borg5[i]==ind){
            return sfxInds[i][RAND.func(0,1)];
        }
    }
  }
  return 0;
}



