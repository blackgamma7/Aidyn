#ifdef DEBUGVER
#define FILENAME "../gameclasses/party.cpp"
#else
#define FILENAME ""
#endif
#include "party.h"
#include "stringN64.h"
#include "heapN64.h"

void init_party(Party *party){
  CLEAR(party);
  party->Inventory = new PartyInventory();
  }


void Party_free(Party *param_1){

  u32 i;

  if (param_1->Inventory) param_1->Inventory->~PartyInventory();

  for(i=0;i<3;i++) {
    if (param_1->Members[i]) {
      CharSheet_free(param_1->Members[i]);
      FREE(param_1->Members[i],0xe8);
      }
  }
}

void check_party_event_flag(Party *param_1,ItemID param_2,bool param_3,bool param_4){
  u16 uVar1;
  u16 auVar2 [2];
  u16 auVar3 [2];
  u16 auVar4 [2];
  u8 bVar8;
  u16 (*pauVar5) [2];
  s32 iVar6;
  u16 (*pauVar7) [2];
  u16 (*pauVar9) [2];
  u16 (*pauVar10) [2];
  u32 uVar11;
  s32 uStack208;
  s32 auStack204 [31];
  s32 auStack80 [20];
  
  bVar8 = GetIDIndex(param_2);
  if (param_3 == false) {
    pauVar9 = party_eventflag_dict2;
    pauVar5 = (u16 (*) [2])auStack80;
    do {
      pauVar10 = pauVar5;
      pauVar7 = pauVar9;
      auVar2 = pauVar7[1];
      auVar3 = pauVar7[2];
      auVar4 = pauVar7[3];
      *pauVar10 = *pauVar7;
      pauVar10[1] = auVar2;
      pauVar10[2] = auVar3;
      pauVar10[3] = auVar4;
      pauVar9 = pauVar7[4];
      pauVar5 = pauVar10[4];
    } while (pauVar7[4] != party_eventflag_dict2[0xc]);
    auVar2 = pauVar7[5];
    pauVar10[4] = party_eventflag_dict2[12];
    pauVar10[5] = auVar2;
    uVar11 = 0;
    while (uVar1 = (*(u16 (*) [2])auStack80)[uVar11], uVar1 != -1) {
      if ((s16)(char)bVar8 == uVar1) {
        setEventFlag((*(u16 (*) [2])auStack80)[uVar11 + 1],param_4);
        return;
      }
      uVar11 = uVar11 + 2 & -1;
    }
  }
  else {
    pauVar5 = party_eventflag_dict1;
    pauVar9 = (u16 (*) [2])&uStack208;
    do {
      auVar2 = pauVar5[1];
      auVar3 = pauVar5[2];
      auVar4 = pauVar5[3];
      *pauVar9 = *pauVar5;
      pauVar9[1] = auVar2;
      pauVar9[2] = auVar3;
      pauVar9[3] = auVar4;
      pauVar5 = pauVar5[4];
      pauVar9 = pauVar9[4];
    } while (pauVar5 != party_eventflag_dict1[0x14]);
    uVar11 = 0;
    *pauVar9 = party_eventflag_dict1[20];
    if (uStack208._0_2_ != -1) {
      iVar6 = 0;
      do {
        iVar6 = iVar6 + uVar11;
        if ((*(u16 (*) [2])&uStack208)[iVar6] == (s16)(char)bVar8) {
          setEventFlag(*(EventFlag *)((s32)auStack204 + iVar6 * 2 + -2),param_4);
          setEventFlag(*(EventFlag *)((s32)auStack204 + iVar6 * 2),(bool)(param_4 ^ 1));
          return;
        }
        uVar11 = uVar11 + 1 & -1;
        iVar6 = uVar11 << 1;
      } while ((*(u16 (*) [2])((s32)(u16 (*) [2])&uStack208 + uVar11 * 6))[0] != -1);
    }
  }
  return;
}

void register_party_deaths(Party *param_1){
  CharSheet *pCVar1;
  s32 i;
  i = 0;
  while( true ) {
    pCVar1 = param_1->Members[i];
    if (pCVar1) check_party_event_flag(param_1,pCVar1->ID,false,isDead(pCVar1));
    i++;
    if (3 < i) break;
  }
}

bool add_to_party(Party *param_1,ItemID param_2){
  u32 uVar1;
  CharSheet *pCVar2;
  u32 uVar4;
  
  if (param_1->MembersSize == 4) return false;
  uVar4 = 0;
  if (param_1->Members[0]) {
    uVar1 = 1;
    do {
      uVar4 = uVar1;
       if (3 < uVar4) break;
       uVar1 = uVar4 + 1;
    } while (param_1->Members[uVar4]);
   }
  pCVar2 = (CharSheet *)heapAlloc(0x48,FILENAME,0x157);
  param_1->Members[uVar4] = pCVar2;
  create_CharSheet(pCVar2,param_2,0);
  param_1->MembersSize++;
  check_party_event_flag(param_1,param_2,true,true);
  caseSwitch_copy_char(param_1->Members[uVar4]);
  return true;
}

bool FUN_8007dfc8(Party *param_1,u32 arg1){
  u8 bVar2;
  Temp_weapon *pTVar1;
  bool ret;
  Entity_Ram *entRam;
  CharSheet *charSheeeet;
  
  charSheeeet = param_1->Members[arg1];
  bVar2 = GetIDIndex(charSheeeet->ID);
  entRam = EntityPointer->entities + (char)bVar2;
  if ((*charSheeeet->armor) || (ret = false, entRam->Sheild == (ItemID)-1))
  {
    if (charSheeeet->armor[1] == NULL) {
      if (entRam->Sheild != -1) {return false;}
      pTVar1 = charSheeeet->weapons;
    }
    else {pTVar1 = charSheeeet->weapons;}
    ret = true;
    if (pTVar1 == NULL) {
      ret = false;
      if (((entRam->weapon[0] == (ItemID)-1) &&
          (ret = false, entRam->weapon[1] == (ItemID)-1)) &&
         (ret = false, entRam->weapon[2] == (ItemID)-1)) {
        ret = true;
      }
    }
  }
  return ret;
}

CharSheet * get_charsheet(Party *param_1,ItemID param_2){
  u8 abStack16;
  return get_party_charsheet(param_1,param_2,abStack16);}

CharSheet * get_party_charsheet(Party *param_1,ItemID param_2,u8 *param_3){
  u8 bVar2;
  CharSheet *pCVar1;
  
  bVar2 = find_ent_in_Party(param_1,param_2);
  *param_3 = bVar2;
  if (bVar2 == -1) pCVar1 = NULL;
  else pCVar1 = param_1->Members[*param_3];
  return pCVar1;
}

void FUN_8007e108(Party *param_1){
  s32 iVar1;
  CharSheet *piVar2;
  u32 uVar2;
  u32 uVar3;
  
  iVar1 = 0;
  uVar2 = 0;
  do {
    piVar2 = (CharSheet *)((s32)param_1->Members + iVar1);
    uVar3 = uVar2 + 1;
    if (*(s32 *)piVar2 == 0) {
      iVar1 = uVar2 << 2;
      if (uVar2 < 3) {
        do {
          uVar2 = uVar2 + 1;
          *(char **)piVar2 = piVar2->name;
          piVar2 = (CharSheet *)&piVar2->name;
        } while (uVar2 < 3);
        iVar1 = uVar2 * 4;
      }
      *(s32 *)((s32)param_1->Members + iVar1) = 0;
    }
    iVar1 = uVar3 * 4;
    uVar2 = uVar3;
  } while (uVar3 < 3);
  return;
}

s8 find_ent_in_Party(Party *party,ItemID id){
  s32 i=0;
  CharSheet *psVar1;
  while ((psVar1 = party->Members[i], psVar1 == NULL ||(psVar1->ID != id))) {
    i++;
    if (3 < i) return -1;
  }
  return (s8)i;
}

void remove_alive_char_from_party(Party *param_1, ItemID param_2){
  s8 sVar1 = find_ent_in_Party(param_1,param_2);
  if (sVar1 != -1) remove_alive_member(param_1,sVar1);
}


void remove_alive_member(Party *param_1,s8 param_2){
  strip_party_member(param_1,param_2,1);
  move_party_to_saveEnt(param_1);
  if (param_1->Members[param_2]) {
    check_party_event_flag(param_1,param_1->Members[param_2]->ID,true,false);
    remove_party_member(param_1,param_2,0);
    scooch_member_over(param_1);
  }
}

void Ofunc_removeEntireParty(Party *param_1){
  u8 i;
  for(i = 0;i < 4;i++) remove_party_member(param_1,i,0);
}

bool IsCharacterInParty(Party *param_1,ItemID param_2){
  s32 i=0;
  u32 uVar2;
  CharSheet *psVar1;

  while ((psVar1 = param_1->Members[i], psVar1 == NULL ||
         (psVar1->ID != param_2))) {
    i++;
    if (3 < i) return false;
  }
  return true;
}

void BringOutYourDead(Party *param_1){
  CharSheet *pCVar1;
  Party *pPVar3;
  u32 uVar4;
  
  register_party_deaths(param_1);
  uVar4 = 0;
  pPVar3 = param_1;
  do {
    pCVar1 = pPVar3->Members[0];
    if ((pCVar1) && (isDead(pCVar1))) {
      saveent_deadMember(pCVar1->ID);
      remove_party_member(param_1,(u8)uVar4,1);
    }
    uVar4++;
    pPVar3 = (Party *)(pPVar3->Members + 1);
  } while (uVar4 < 4);
  scooch_member_over(param_1);
  return;
}

void scooch_member_over(Party *param_1){
  s32 iVar1;
  CharSheet *ppCVar2;
  CharSheet **ppCVar3;
  u32 uVar2;
  u32 uVar3;
  
  iVar1 = 0;
  uVar2 = 0;
  do {
    ppCVar2 = (CharSheet *)((s32)param_1->Members + iVar1);
    uVar3 = uVar2 + 1;
    if ((*(s32 *)ppCVar2 == 0) && (uVar3 < 4)) {
      ppCVar3 = param_1->Members + uVar2 + 1;
      uVar2 = uVar3;
      do {
        uVar2 = uVar2 + 1;
        if (*ppCVar3) {
          *(CharSheet **)ppCVar2 = *ppCVar3;
          ppCVar2 = (CharSheet *)&ppCVar2->name;
          *ppCVar3 = NULL;
        }
        ppCVar3 = ppCVar3 + 1;
      } while (uVar2 < 4);
    }
    iVar1 = uVar3 * 4;
    uVar2 = uVar3;
  } while (uVar3 < 4);
  return;
}

void strip_party_member(Party *param_1,u8 param_2,u8 param_3){
  u32 uVar1;
  u32 uVar2;

    if (param_1->Members[param_2]) {
    uVar1 = 0;
    do {
      FUN_8007f9b8(param_1,param_2,(u8)uVar1);
      uVar1++;
    } while (uVar1 < 0xc);
    if (param_3 != 0) {
      MoveWeaponsToInventory(param_1,param_2);
      remove_armor_from_character(param_1,param_2);
      removeArmorIntoInventory(param_1,param_2);
    }
  }
  return;
}

void remove_party_member(Party *param_1,u8 param_2,u8 param_3){
  CharSheet *pCVar1;
  
  pCVar1 = param_1->Members[param_2];
  if (pCVar1) {
    strip_party_member(param_1,param_2,param_3);
    CharSheet_free(pCVar1);
    HeapFree(pCVar1,FILENAME);
    param_1->Members[param_2] = NULL;
    param_1->MembersSize--;
  }
}


bool characterInParty(CharSheet **param_1,CharSheet *param_2){
  u32 i=0;
  if (param_2 == NULL) {return false;}
  do {
    i++;
    if (param_2 == *param_1) {return true;}
    param_1++;
  } while (i < 4);
  return true;}

u32 get_party_avg_lv(Party *param_1){
  u32 uVar3;
  u32 uVar4;
  CharSheet *iVar1;
  
  uVar4 = 0;
  if (param_1->MembersSize == 0) {uVar4 = 0;}
  else {
    
    for(uVar3 = 0;uVar3 < 4;uVar3++) {
      iVar1 = param_1->Members[uVar3];
      if (iVar1) {uVar4+= CharStats::getModdedStat(iVar1->Stats,STAT_LV);}
    }
    uVar4/= param_1->MembersSize;
  }
  return uVar4;
}

s32 clear_inventory_8007e600(Party *param_1){
  inv_funcs *piVar1;
  s32 uVar2;
  
  piVar1 = param_1->Inventory->Functions;
  (*(piVar1->clear_item).func)
            ((s32)param_1->Inventory->inv_slots + (s16)(piVar1->clear_item).arg[0] + -4);
  piVar1 = param_1->Inventory->Functions;
  uVar2 = (*(piVar1->clear_inventory).func)
                    ((s32)param_1->Inventory->inv_slots +
                     (s16)(piVar1->clear_inventory).arg[0] + -4);
  return uVar2;
}
u8 (*) [2] create_2ByteArray(u8 (*param_1) [2]){
  u8 (*pabVar1) [2];
  
  if (param_1 == NULL) {pabVar1 = NULL;}
  else {
    pabVar1 = (u8 (*) [2])heapAlloc(2,FILENAME,0x2b9);
    (*pabVar1)[0] = (*param_1)[0];
    (*pabVar1)[1] = (*param_1)[1];}
  return pabVar1;}

u8 FUN_8007e798(Party *param_1,u8 param_2){
  u32 uVar1;
  u8 *pbVar2;
  u8 temparray [9]={1,1,2,6,3,5,0,0,0xff};
  
  pbVar2 = temparray;
  uVar1 = 0;
  while( true ) {
    if (temparray[0] == 0xff) {return 1;}
    if (*pbVar2 == param_2) break;
    uVar1+=2;
    temparray[0] = temparray[uVar1];
    pbVar2 = temparray + uVar1;
  }
  return temparray[uVar1 + 1];
}


bool func_checking_niesen_2(Party *param_1,CharSheet *param_2,u8 param_3,ItemID param_4){
  inv_funcs *piVar1;
  ulong uVar2;
  u8 bVar4;
  

  if (has_item_func(param_1->Inventory,param_4)) {
    piVar1 = param_1->Inventory->Functions;
    uVar2 = (*(piVar1->get_inv_index).func)
                      ((s32)param_1->Inventory->inv_slots +
                       (s16)(piVar1->get_inv_index).arg[0] + -4,param_4);
    bVar4 = GetIDIndex(param_4);
    if ((&gCombatP->combatEnts)[param_3] == NULL) {return true;}
    if (param_2->ID != (ItemID)(entityList[162] + 0x200)) {
      FUN_8006f8d8((&gCombatP->combatEnts)[param_3],param_4,(char)uVar2);
      if (bVar4 < 4) {gGlobals.combatBytes[1] = 0x13;}
      return false;
    }
  }
  return true;
}

u8 get_equip_error(Party *param_1,u8 param_2,char param_3){
  CharSheet *pCVar1;
  inv_funcs *piVar2;
  temp_gear *puVar4;
  ulong uVar3;
  s32 iVar4;
  u32 uVar6;
  
  pCVar1 = param_1->Members[param_2];
  if ((pCVar1) &&
     (piVar2 = param_1->Inventory->Functions,
     puVar4 = (temp_gear *)(*(piVar2->get_inv_slot).func)((s32)param_1->Inventory->inv_slots +
                         (s16)(piVar2->get_inv_slot).arg[0] + -4,param_3),
     puVar4)) {
    if ((puVar4->aspect != NONE) &&(GetCharAspect(pCVar1->EXP) !=puVar4->aspect)) {
      return 2;}
    uVar6 = 0;
    if (itemtype_funcs[0].type != ~Empty) {
      iVar4 = 0;
      do {
        if ((&itemtype_funcs[uVar6].type) == (u16)puVar4->id >> 8) {
          return (*(&itemtype_funcs[uVar6].function)) (param_1,param_2,puVar4,pCVar1);
        }
        uVar6++;
        iVar4 = uVar6 << 1;
      } while (itemtype_funcs[uVar6].type != ~Empty);
    }
  }
  return 1;
}

u8 itemtype_armor(Party *param_1,u8 param_2,temp_armor *param_3,CharSheet *param_4,ItemID *param_5){
  ItemID IVar1;
  inv_funcs *piVar2;
  u8 bVar4;
  u8 (*X) [2];
  ulong uVar3;
  u8 bVar5;
  
  IVar1 = param_3->id;
  bVar4 = ret0();
  if ((bool)bVar4 == false) {
    X = create_2ByteArray(param_3->statMod);
    bVar5 = 0xff;
    if (param_3->spell) {bVar5 = param_3->spell->Charges;}
    piVar2 = param_1->Inventory->Functions;
    uVar3 = (*(piVar2->get_some_bool).func)
                      ((s32)param_1->Inventory->inv_slots +
                       (s16)(piVar2->get_some_bool).arg[0] + -4,(ulonglong)(u16)IVar1,1);
    if (uVar3 == 0) {
      if (X) {HeapFree(X,FILENAME,0x377);}
      bVar4 = 1;
    }
    else {
      if ((param_5 != (ItemID *)0x0) && (*param_4->armor)) {
        *param_5 = (*param_4->armor)->id;
      }
      bVar4 = remove_armor_from_character(param_1,param_2);
      if ((bool)bVar4 == false) {
        Equip_Armor(param_4,IVar1,X);
        SetMagicCharges(*(Temp_weapon **)param_4->armor,bVar5);
        bVar4 = 0;
      }
      else {
        FUN_8007e6a4(param_1,IVar1,X,bVar5);
      }
    }
  }
  return bVar4;
}

u8 itemtype_sheild(Party *param_1,char param_2,temp_armor *param_3,CharSheet *param_4,ItemID *param_5){
  ItemID IVar1;
  inv_funcs *piVar2;
  u8 bVar4;
  u8 (*X) [2];
  ulong uVar3;
  u8 bVar5;
  
  IVar1 = param_3->id;
  bVar4 = NoSheildSkill(param_4);
  if ((bool)bVar4 == false) {
    X = create_2ByteArray(param_3->statMod);
    bVar5 = 0xff;
    if (param_3->spell) {bVar5 = param_3->spell->Charges;}
    piVar2 = param_1->Inventory->Functions;
    uVar3 = (*(piVar2->get_some_bool).func)
                      ((s32)param_1->Inventory->inv_slots +
                       (s16)(piVar2->get_some_bool).arg[0] + -4,(ulonglong)(u16)IVar1,1);
    if (uVar3 == 0) {
      if (X) {HeapFree(X,FILENAME,0x3b2);}
      bVar4 = 1;
    }
    else {
      if ((param_5) && (param_4->armor[1])) {*param_5 = param_4->armor[1]->id;}
      bVar4 = removeArmorIntoInventory(param_1,(s32)param_2 & 0xff);
      if ((bool)bVar4 == false) {
        EquipSheild(param_4,IVar1,X);
        SetMagicCharges((Temp_weapon *)param_4->armor[1],bVar5);
        bVar4 = 0;
      }
      else {
        FUN_8007e6a4(param_1,IVar1,X,bVar5);
      }
    }
  }
  return bVar4;
}


u8 itemtype_weapon(Party *param_1,u32 param_2,Temp_weapon *param_3,CharSheet *param_4,ItemID *param_5){
  ItemID IVar1;
  inv_funcs *piVar2;
  u8 bVar4;
  u8 bVar5;
  u8 (*X) [2];
  ulong uVar3;
  
  IVar1 = param_3->id;
  bVar4 = canEquipWeapon(param_4,IVar1);
  if (bVar4 == 0) {
    X = create_2ByteArray(param_3->Stat);
    bVar4 = 0xff;
    if (param_3->spell) {bVar4 = param_3->spell->Charges;}
    piVar2 = param_1->Inventory->Functions;
    uVar3 = (*(piVar2->get_some_bool).func)
                      ((s32)param_1->Inventory->inv_slots +
                       (s16)(piVar2->get_some_bool).arg[0] + -4,IVar1,1);
    if (uVar3 == 0) {
      if (X) {HeapFree(X,FILENAME,0x3ed);}
      bVar5 = 1;
    }
    else {
      if ((param_5) && (param_4->weapons)) *param_5 = param_4->weapons->id;
      if (!MoveWeaponsToInventory(param_1,param_2)) {
        EquipWeapon(param_4,IVar1,X);
        SetMagicCharges(param_4->weapons,bVar4);
        bVar5 = 0;
        if (gGlobals.combatBytes[0] == 0xe) {
          FUN_8006a274((&gCombatP->combatEnts)[param_2]);
          bVar5 = 0;
        }
      }
      else {
        FUN_8007e6a4(param_1,IVar1,X,bVar4);
      }
    }
  }
  else bVar5 = FUN_8007e798(param_1,bVar4);
  return bVar5;
}

u8 itemtype_scroll(Party *param_1,u8 param_2,temp_gear *param_3,CharSheet *param_4){
  u8 uVar2;
  
  if (gametrek_flag0 == 0) {
    if (item_pointer->Gear[search_item_array(param_3->id)].spell == 0xff) uVar2 = 1;
    else uVar2 = FUN_800830a4(param_1,param_2,param_3,param_4,3);
  }
  else uVar2 = use_scroll(param_1,param_2,param_3,param_4);
  return uVar2;}

bool itemtype_ring(Party *param_1,u8 param_2,temp_gear *param_3,CharSheet *param_4){
  return FUN_800830a4(param_1,param_2,param_3,param_4,2);}


u8 itemtype_gear(Party *param_1,u8 param_2,temp_gear *param_3,CharSheet *param_4,ItemID *param_5){
  u8 bVar1;
  ItemID IVar2;
  ItemID IVar3;
  inv_funcs *piVar4;
  CharGear *pCVar5;
  u8 bVar7;
  u8 (*X) [2];
  ulong uVar6;
  bool bVar8;
  temp_gear *ptVar9;
  u32 uVar10;
  
  IVar2 = param_3->id;
  bVar7 = FUN_8007e798(param_1,something_with_gear_INT(param_4,IVar2));
  if (bVar7 == 0) {
    X = create_2ByteArray(param_3->statmod);
    bVar7 = 0xff;
    if (param_3->pSpell) {bVar7 = param_3->pSpell->Charges;}
    piVar4 = param_1->Inventory->Functions;
    uVar6 = (*(piVar4->get_some_bool).func)((s32)param_1->Inventory->inv_slots +
                       (s16)(piVar4->get_some_bool).arg[0] + -4,IVar2,1);
    if (uVar6 == 0) {
      if (X) {HeapFree(X,FILENAME,0x457);}
      bVar7 = 1;
    }
    else {
      pCVar5 = param_4->pItemList;
      uVar10 = 0;
      if (pCVar5->num_used != 0) {
        ptVar9 = (temp_gear *)pCVar5->pItem;
        do {
          if (*(temp_gear **)((s32)ptVar9 + uVar10 * 4) == NULL) {
            bVar1 = pCVar5->num_used;
          }
          else {
            IVar3 = (*(temp_gear **)((s32)ptVar9 + uVar10 * 4))->id;
            if ((u16)IVar3 >> 8 == (u16)IVar2 >> 8) {
              if (param_5 != (ItemID *)0x0) {
                *param_5 = IVar3;
              }
              bVar8 = FUN_8007f9b8(param_1,(s32)(char)param_2 & 0xff,(u8)uVar10);
              if (bVar8) {
                FUN_8007e6a4(param_1,IVar2,X,bVar7);
                return bVar8;
              }
              break;
            }
            bVar1 = pCVar5->num_used;
          }
          uVar10 = uVar10 + 1;
          if (bVar1 <= uVar10) break;
          ptVar9 = (temp_gear *)pCVar5->pItem;
        } while( true );
      }
      FUN_8007f10c(param_1,param_4,IVar2,X,bVar7);
      bVar7 = 0;
    }
  }
  return bVar7;
}


void FUN_8007f10c(Party *param_1,CharSheet *param_2,u16 param_3,u8 (*param_4) [2],u8 param_5){
  CharGear *pCVar1;
  
  FUN_8007840c(param_2,param_3,param_4);
  pCVar1 = param_2->pItemList;
  SetMagicCharges((Temp_weapon *)param_2->pItemList->pItem[func_8007daa8(pCVar1,param_3)],param_5);
}

bool use_scroll(Party *param_1,u8 param_2,temp_gear *param_3,CharSheet *param_4){
  u8 bVar1;
  u8 bVar2;
  MagicSchoolEnum MVar3;
  ItemID IVar4;
  Gear_RAM *pGVar5;
  longlong lVar6;
  s32 iVar7;
  bool bVar8;
  char *pcVar9;
  color32 *pcVar10;
  color32 *pcVar11;
  Spell_RAM *pSVar12;
  color32 acStack808;
  color32 acStack744;
  color32 acStack680;
  color32 acStack616;
  undefined auStack552 [8];
  color32 acStack544;
  color32 acStack480;
  color32 acStack416;
  color32 acStack352;
  color32 acStack288;
  color32 acStack224;
  color32 acStack160;
  color32 acStack96;
  
  lVar6 = capskillBaseMax(param_4->Skills,SKILL_WIZARD);
  if (lVar6 < 0) {
    pcVar10 = &acStack808;
    acStack808 = OFFWHITE;
    acStack744 = DARKGRAY_T;
    pcVar9 = (gGlobals.CommonStrings)->only wizards can learn spells;
    pcVar11 = &acStack744;
  }
  else {
    IVar4 = *param_3;
    iVar7 = search_item_array(IVar4);
    pGVar5 = item_pointer->Gear;
    bVar1 = pGVar5[iVar7].spell;
    if (bVar1 == 0xff) {
      pcVar9 = "The enchantment on this scroll can only be used to re-light the Port Saiid Lighthouse.";
      pcVar10 = &acStack680;
      pcVar11 = &acStack616;
      acStack680 = OFFWHITE
      acStack616 = DARKGRAY_T;
    }
    else {
      bVar1 = SpellList[(char)bVar1];
      auStack552[0] = 0;
      bVar8 = knows_spell(param_4->spellbook,(ItemID)(bVar1 | 0x300),auStack552);
      if (bVar8 == false) {
        bVar2 = pGVar5[iVar7].spell;
        pSVar12 = gLoadedSpells->spells[bVar2];
        if (lVar6 < (longlong)(ulonglong)pSVar12->WizardREQ) {
          pcVar10 = &acStack416;
          acStack416 = OFFWHITE;
          acStack352 = DARKGRAY_T;
          pcVar9 = (gGlobals.CommonStrings)->"need higher wizard to know that spell";
          pcVar11 = &acStack352;
        }
        else {
          MVar3 = param_4->EXP->school;
          if (((MVar3 == CHAOS) || (pSVar12->School == NONE)) || (MVar3 == pSVar12->School)) {
            learn_spell(param_4->spellbook,bVar1 | 0x300,1);
            Gsprintf((gGlobals.CommonStrings)->char learned spell,param_4->name,
                        pSVar12->Name);
            acStack160 = OFFWHIE;
            acStack96 = DARKGRAY_T;
            some_textbox_func(gGlobals.text,0x96,&acStack160,&acStack96,1);
            piVar6 = param_1->Inventory->Functions;
            (*(piVar6->get_some_bool).func)
                      ((s32)param_1->Inventory->inv_slots +
                       (s16)(piVar6->get_some_bool).arg[0] + -4,(ulonglong)(u16)IVar4,1);
            return false;
          }
          pcVar10 = &acStack288;
          acStack288 = OFFWHITE;
          acStack224 = DARKGRAY_T;
          pcVar9 = (gGlobals.CommonStrings)->wrong school for spell;
          pcVar11 = &acStack224;
        }
      }
      else {
        Gsprintf((gGlobals.CommonStrings)->they already know that spell,
                    param_4->name);
        pcVar9 = gGlobals.text;
        pcVar10 = &acStack544;
        pcVar11 = &acStack480;
        acStack544 = OFFWHITE;
        acStack480 = DARKGRAY_T;
      }
    }
  }
  some_textbox_func(pcVar9,0x96,pcVar10,pcVar11,1);
  return true;
}

void FUN_8007f508(Temp_weapon *param_1,u8 (*param_2) [2],s8 param_3){
  if (param_1->Stat) HeapFree(param_1->Stat,FILENAME,1362);
  param_1->Stat = param_2;
  if (param_3 != -1) param_1->spell->Charges = param_3;
}

bool remove_armor_from_character(Party *param_1,u8 param_2){
  CharSheet *pCVar1;
  temp_armor *ptVar2;
  inv_funcs *piVar3;
  u8 (*X) [2];
  ulong uVar4;
  Temp_weapon *pTVar5;
  s32 line;
  undefined uVar6;
  
  if (gGlobals.combatBytes[0] == 0xe) {return true;}
  pCVar1 = param_1->Members[param_2];
  if (pCVar1 == NULL) {return true;}
  ptVar2 = *pCVar1->armor;
  if (ptVar2 == NULL) {return false;}
  X = create_2ByteArray(ptVar2->statMod);
  uVar6 = 0xff;
  if (ptVar2->spell) {uVar6 = ptVar2->spell->Charges;}
  piVar3 = param_1->Inventory->Functions;
  uVar4 = (*(piVar3->add_to_inv).func)
                    ((s32)param_1->Inventory->inv_slots + (s16)(piVar3->add_to_inv).arg[0] + -4,
                     (ulonglong)(u16)ptVar2->id,1);
  if (uVar4 == 0) {
    if (X == NULL) return true;
    line = 0x572;}
  else {
    piVar3 = param_1->Inventory->Functions;
    uVar4 = (*(piVar3->get_inv_index).func)
                      ((s32)param_1->Inventory->inv_slots +
                       (s16)(piVar3->get_inv_index).arg[0] + -4,(ulonglong)(u16)ptVar2->id);
    piVar3 = param_1->Inventory->Functions;
    pTVar5 = (Temp_weapon *)
             (*(piVar3->get_inv_slot).func)
                       ((s32)param_1->Inventory->inv_slots +
                        (s16)(piVar3->get_inv_slot).arg[0] + -4,uVar4);
    if (pTVar5) {
      FUN_8007f508(pTVar5,X,uVar6);
      remove_chestArmor(pCVar1);
      return false;
    }
    if (X == NULL) return true;
    line = 0x57d;
  }
  HeapFree(X,FILENAME,line);
  return true;
}

bool removeArmorIntoInventory(Party *param_1,u32 param_2){
  CharSheet *pCVar1;
  temp_armor *ptVar2;
  inv_funcs *piVar3;
  u8 (*X) [2];
  ulong uVar4;
  Temp_weapon *pTVar5;
  s32 line;
  undefined uVar6;
  
  pCVar1 = param_1->Members[param_2];
  if (pCVar1 == NULL) {return true;}
  if (gGlobals.combatBytes[0] == 0xe) {return true;}
  ptVar2 = pCVar1->armor[1];
  if (ptVar2 == NULL) {return false;}
  X = create_2ByteArray(ptVar2->statMod);
  uVar6 = 0xff;
  if (ptVar2->spell) {uVar6 = ptVar2->spell->Charges;}
  piVar3 = param_1->Inventory->Functions;
  uVar4 = (*(piVar3->add_to_inv).func)
                    ((s32)param_1->Inventory->inv_slots + (s16)(piVar3->add_to_inv).arg[0] + -4,
                     (ulonglong)(u16)ptVar2->id,1);
  if (uVar4 == 0) {
    if (X == NULL) {return true;}
    line = 0x5a4;
  }
  else {
    piVar3 = param_1->Inventory->Functions;
    uVar4 = (*(piVar3->get_inv_index).func)
                      ((s32)param_1->Inventory->inv_slots +
                       (s16)(piVar3->get_inv_index).arg[0] + -4,(ulonglong)(u16)ptVar2->id);
    piVar3 = param_1->Inventory->Functions;
    pTVar5 = (Temp_weapon *)
             (*(piVar3->get_inv_slot).func)
                       ((s32)param_1->Inventory->inv_slots +
                        (s16)(piVar3->get_inv_slot).arg[0] + -4,uVar4);
    if (pTVar5) {
      FUN_8007f508(pTVar5,X,uVar6);
      remove_sheild(pCVar1);
      return false;
    }
    if (X == NULL) {return true;}
    line = 0x5af;
  }
  HeapFree(X,FILENAME,line);
  return true;
}

bool MoveWeaponsToInventory(Party *param_1,u32 param_2){
  CharSheet *pCVar1;
  inv_funcs *piVar2;
  CombatEntity *pCVar3;
  u8 (*X) [2];
  ulong uVar4;
  Temp_weapon *pTVar5;
  undefined uVar6;
  
  pCVar1 = param_1->Members[param_2];
  if (pCVar1) {
    pTVar5 = pCVar1->weapons;
    if (pTVar5 == NULL) {return false;}
    if ((ItemID)(weaponList[66] + 0x700) == pTVar5->id) {return false;}//Can't move Archmage Staff
    X = create_2ByteArray(pTVar5->Stat);
    uVar6 = 0xff;
    if (pTVar5->spell) {uVar6 = pTVar5->spell->Charges;}
    piVar2 = param_1->Inventory->Functions;
    uVar4 = (*(piVar2->add_to_inv).func)
                      ((s32)param_1->Inventory->inv_slots + (s16)(piVar2->add_to_inv).arg[0] + -4,
                       (ulonglong)(u16)pTVar5->id,1);
    if (uVar4 == 0) {
      if (X) {
        HeapFree(X,FILENAME,0x5dd);
        return true;
      }
    }
    else {
      piVar2 = param_1->Inventory->Functions;
      uVar4 = (*(piVar2->get_inv_index).func)
                        ((s32)param_1->Inventory->inv_slots +
                         (s16)(piVar2->get_inv_index).arg[0] + -4,(ulonglong)(u16)pTVar5->id);
      piVar2 = param_1->Inventory->Functions;
      pTVar5 = (Temp_weapon *)
               (*(piVar2->get_inv_slot).func)
                         ((s32)param_1->Inventory->inv_slots +
                          (s16)(piVar2->get_inv_slot).arg[0] + -4,uVar4);
      if (pTVar5) {
        FUN_8007f508(pTVar5,X,uVar6);
        unequp_weapons(pCVar1);
        if (gGlobals.combatBytes[0] != 0xe) {return false;}
        if (gCombatP) {
          if (&gCombatP->combatEnts == NULL) {return false;}
          pCVar3 = (&gCombatP->combatEnts)[param_2];
          if (pCVar3 == NULL) {return false;}
          pCVar3->unk0x25 = 0;
          get_weapon_sheild_borg5(pCVar3);
        }
        return false;
      }
      if (X) {
        HeapFree(X,FILENAME,0x5e9);
        return true;
      }
    }
  }
  return true;
}


bool FUN_8007f9b8(Party *param_1,u8 param_2,u8 param_3){
  CharSheet *pCVar1;
  inv_funcs *piVar2;
  u8 (*X) [2];
  ulong uVar3;
  Temp_weapon *pTVar4;
  undefined uVar6;
  temp_gear *puVar2;
  
  pCVar1 = param_1->Members[param_2];
  if (pCVar1 == NULL) return true;
  if (0xb < param_3) return true;
  if (pCVar1->pItemList) {
    puVar2 = pCVar1->pItemList[param_3];
    if (puVar2 == NULL) return true;
    X = create_2ByteArray(puVar2->statmod);
    uVar6 = 0xff;
    if (puVar2->pSpell) uVar6 = puVar2->pSpell->Charges;
    piVar2 = param_1->Inventory->Functions;
    uVar3 = (*(piVar2->add_to_inv).func)
                      ((s32)param_1->Inventory->inv_slots + (s16)(piVar2->add_to_inv).arg[0] + -4,
                       (ulonglong)(u16)puVar2->id,1);
    if (uVar3 != 0) {
      piVar2 = param_1->Inventory->Functions;
      uVar3 = (*(piVar2->get_inv_index).func)
                        ((s32)param_1->Inventory->inv_slots +
                         (s16)(piVar2->get_inv_index).arg[0] + -4,(ulonglong)(u16)puVar2->id);
      piVar2 = param_1->Inventory->Functions;
      pTVar4 = (Temp_weapon *)
               (*(piVar2->get_inv_slot).func)
                         ((s32)param_1->Inventory->inv_slots +
                          (s16)(piVar2->get_inv_slot).arg[0] + -4,uVar3);
      FUN_8007f508(pTVar4,X,uVar6);
      unequip_acc(pCVar1,uVar5);
      return false;
    }
    if (X) {HeapFree(X,FILENAME,0x625);}
  }
  return true;
}

int Check_diplomat_int(Party *param_1)

{
  CharSheet *pCVar1;
  bool bVar6;
  u8 uVar2;
  char cVar7;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint uVar9;
  u8 uVar8;
  
  uVar3 = 0;
  uVar9 = 0;
  uVar4 = 0;
  for(uVar4=0;uVar4<4;uVar4++){
    pCVar1 = param_1->Members[uVar4];
    if ((pCVar1 != NULL) && (bVar6 = isDead(pCVar1), !bVar6)) {
      uVar2 = getModdedStat(pCVar1->Stats,STAT_INT);
      if (uVar3 < uVar2) uVar3 = uVar2;
      uVar9 += getModdedSkill(pCVar1->Skills,SKILL_Diplomat);
    }
  }
  uVar3 = uVar3 * 3 + uVar9 * 10 + 50;
  uVar4 = RollD(1,100);
  if (uVar4 < uVar3) {
    uVar8 = some_skillcheck_calc(uVar3 - uVar4);
    iVar5 = (int)(char)uVar8;
  }
  else iVar5 = 0;
  return iVar5;
}

s32 Check_loremaster_INT(CharSheet **param_1){
  CharSheet *pCVar1;
  bool bVar6;
  u32 uVar2;
  char cVar7;
  u32 uVar3;
  u32 uVar4;
  s32 iVar5;
  u32 uVar8;
  
  uVar3 = 0;
  uVar8 = 0;
  uVar4 = 0;
  do {
    pCVar1 = *param_1;
    if ((pCVar1) && (!isDead(pCVar1))) {
      uVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
      if (uVar3 < (uVar2)) {uVar3 = uVar2;}
      uVar8+= (s32)getModdedSkill(pCVar1->Skills,SKILL_LOREMASTER);
    }
    uVar4++;
    param_1++;
  } while (uVar4 < 4);
  uVar3 = uVar3 * 3 + uVar8 * 6;
  uVar4 = RollD(1,100);
  if (uVar4 < uVar3) {
    iVar5 = some_skillcheck_calc((s32)((uVar3 - uVar4) * 0x10000) >> 0x10);}
  else {iVar5 = 0;}
  return iVar5;
}

u32 loremaster_INT_skillcheck(Party *param_1){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  u32 uVar3;
  u32 uVar5;
  
  cVar4 = GetMostSkilledMember(param_1,SKILL_LOREMASTER);
  if ((longlong)cVar4 != 0xff) {
    pCVar1 = param_1->Members[cVar4];
    if (pCVar1 == NULL) {return 0;}
    cVar4 = getModdedSkill(pCVar1->Skills,SKILL_LOREMASTER);
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    uVar5 = (((s32)cVar4) * 3 + iVar2 & 0x7fff) * 2;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar5) {
      uVar3 = some_skillcheck_calc((s32)((uVar5 - uVar3) * 0x10000) >> 0x10);
      return uVar3;}
  }
  return 0;
}

u8 getMechanic_Int_Dex(Party *param_1,char param_2){//used in armor craft
  CharSheet *pCVar1;
  char cVar5;
  s32 iVar2;
  s32 iVar3;
  u32 uVar4;
  undefined uVar6;
  u8 uVar7;
  u32 uVar8;
  
  pCVar1 = param_1->Members[param_2];
  uVar7 = 0;
  if (pCVar1) {
    cVar5 = getModdedSkill(pCVar1->Skills,SKILL_MECHANIC);
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    iVar3 = CharStats::getModdedStat(pCVar1->Stats,STAT_DEX);
    uVar8 = (cVar5 * 5 + iVar2 + iVar3 & 0x7fffU) * 2;
    uVar4 = RollD(1,100);
    if (uVar4 < uVar8) {
      uVar6 = some_skillcheck_calc((s32)((uVar8 - uVar4) * 0x10000) >> 0x10);
      uVar4 = 5 - (s32)cVar5;
      if ((s32)uVar4 < 1) {uVar4 = 1;}
      iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
      uVar7 = 0;
      if ((s32)(uVar4 & 0xffff) <= iVar2) {
        damage_func(pCVar1,(s16)(uVar4 & 0xffff));
        uVar7 = uVar6;}
    }
    else {uVar7 = 0;}
  }
  return uVar7;
}

undefined mechanic_int_dex_skillcheck(Party *param_1,u8 param_2){
  CharSheet *pCVar1;
  char cVar5;
  s32 iVar2;
  s32 iVar3;
  u32 uVar4;
  undefined uVar6;
  undefined uVar7;
  u32 uVar8;
  
  pCVar1 = param_1->Members[param_2];
  uVar7 = 0;
  if (pCVar1) {
    cVar5 = getModdedSkill(pCVar1->Skills,SKILL_MECHANIC);
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    iVar3 = CharStats::getModdedStat(pCVar1->Stats,STAT_DEX);
    uVar8 = (cVar5 * 5 + iVar2 + iVar3 & 0x7fffU) * 2;
    uVar4 = RollD(1,100);
    if (uVar4 < uVar8) {
      uVar6 = some_skillcheck_calc((s32)((uVar8 - uVar4) * 0x10000) >> 0x10);
      uVar4 = 0xfU - (s32)cVar5 & 0xffff;
      iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
      uVar7 = 0;
      if ((s32)uVar4 <= iVar2) {
        damage_func(pCVar1,(s16)uVar4);
        uVar7 = uVar6;
      }
    }
    else {uVar7 = 0;}
  }
  return uVar7;
}

float merchant_skill_check(Party *param_1,u8 MInt,u8 Mstam){
  CharSheet *pCVar1;
  s32 iVar3;
  bool bVar5;
  longlong lVar2;
  s32 iVar4;
  u32 uVar7;
  longlong lVar8;
  longlong lVar9;
  u32 uVar10;
  u32 uVar11;
  float fVar13;
  char cVar6;
  
  uVar11 = 4;
  lVar8 = 0;
  uVar7 = 0;
  iVar3 = 0;
  do {
    pCVar1 = param_1->Members[uVar7];
    if ((pCVar1) && (!isDead(pCVar1))) {
      cVar6 = getModdedSkill(pCVar1->Skills,Merchant);
      lVar2 = (longlong)cVar6;
      lVar9 = lVar8;
      uVar10 = uVar11;
      if ((lVar2 == 0) || (lVar9 = lVar2, uVar10 = uVar7, lVar8 <= lVar2)) {
        lVar8 = lVar9;
        uVar11 = uVar10;
      }
    }
    uVar7++;
  } while (uVar7 < 4);
  fVar13 = 0.05f;
  if (uVar11 != 4) {
    pCVar1 = param_1->Members[uVar11];
    iVar3 = 0xf - (s32)lVar8;
    iVar4 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
    fVar13 = 0.05f;
    if (iVar3 * 0x10000 >> 0x10 <= iVar4) {
      damage_func(pCVar1,(s16)iVar3);
      MStam-= (s32)lVar8;
      fVar13 = 0.05f;
    }
  }
  return (float)MStam * fVar13;
}

undefined some_ranger_stam_func(Party *param_1){
  CharSheet *pCVar1;
  s32 iVar2;
  char cVar6;
  u32 uVar3;
  u32 uVar4;
  undefined uVar7;
  u32 uVar5;
  u32 uVar8;
  CharSheet *piVar8;
  u32 uVar9;
  
  uVar4 = 4;
  uVar5 = 0;
  uVar9 = 0;
  iVar2 = 0;
  do {
    pCVar1 = param_1->Members[uVar9];
    if (pCVar1) {
      cVar6 = getModdedSkill(pCVar1->Skills,SKILL_RANGER);
      uVar8 = (s32)cVar6;
      uVar3 = 5 - uVar8;
      if ((s32)uVar3 < 1) {uVar3 = 1;}
      if ((uVar5 < uVar8) &&
         (iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM),
         (s32)(uVar3) <= iVar2)) {
        uVar4 = uVar9;
        uVar5 = uVar8;
      }
    }
    uVar9++;
  } while (uVar9 < 4);
  uVar7 = 2;
  if (uVar5 != 0) {
    if (uVar4 != 4) {
      pCVar1 = param_1->Members[uVar4];
      iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
      uVar9 = iVar2 * 3 + uVar5 * 10 & 0xffff;
      uVar4 = RollD(1,100);
      if (uVar4 < uVar9) {
        uVar7 = some_skillcheck_calc((s32)((uVar9 - uVar4) * 0x10000) >> 0x10);
        uVar5 = 5 - uVar5;
        if ((s32)uVar5 < 1) {uVar5 = 1;}
        iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
        if (iVar2 < (s32)(uVar5 & 0xffff)) {return 0;}
        damage_func(pCVar1,(s16)(uVar5 & 0xffff));
        return uVar7;
      }
    }
    uVar7 = 0;
  }
  return uVar7;
}


undefined Ofunc_Ranger_int_check(Party *param_1){
  s32 iVar2;
  char cVar4;
  u32 uVar3;
  undefined uVar5;
  u32 uVar6;
  u32 uVar7;
  CharSheet *iVar1;
  
  uVar3 = 4;
  uVar7 = 0;
  uVar6 = 0;
  do {
    iVar1 = param_1->Members[uVar6];;
    if (iVar1) {
      cVar4 = getModdedSkill(iVar1->Skills,SKILL_RANGER);
      if (uVar7 < ((s32)cVar4)) {
        uVar3 = uVar6;
        uVar7 = (s32)cVar4;
      }
    }
    uVar6++;
  } while (uVar6 < 4);
  if (uVar7 == 0) {return 0;}
  if (uVar3 != 4) {
    if (param_1->Members[uVar3] == NULL) {
      return 0;
    }
    iVar2 = CharStats::getModdedStat(param_1->Members[uVar3]->Stats,STAT_INT);
    uVar7 = iVar2 * 3 + uVar7 * 10 & 0xffff;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      uVar5 = some_skillcheck_calc((s32)((uVar7 - uVar3) * 0x10000) >> 0x10);
      return uVar5;
    }
  }
  return 0;
}

undefined ofunc_ranger_stam_int(Party *param_1)

{
  s32 iVar1;
  char cVar4;
  u32 uVar2;
  u32 uVar3;
  undefined uVar5;
  u32 uVar6;
  u32 uVar7;
  s32 *piVar8;
  u32 uVar9;
  
  uVar3 = 4;
  uVar7 = 0;
  uVar9 = 0;
  iVar1 = 0;
  do {
    pCVar1 = param_1->Members[uVar9];
    if (iVar1 != 0) {
      cVar4 = getModdedSkill(pCVar1->Skills,SKILL_RANGER);
      uVar6 = (s32)cVar4 & 0xff;
      uVar2 = 5 - uVar6;
      if ((s32)uVar2 < 1) {
        uVar2 = 1;
      }
      if ((uVar7 < uVar6) &&
         (iVar1 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM), (s32)uVar2 <= iVar1)
         ) {
        uVar3 = uVar9;
        uVar7 = uVar6;
      }
    }
    uVar9++;
  } while (uVar9 < 4);
  if (uVar7 == 0) {return 0;}
  if (uVar3 != 4) {
    if (param_1->Members[uVar3] == NULL) {return 0;}
    iVar1 = CharStats::getModdedStat(param_1->Members[uVar3]->Stats,STAT_INT);
    uVar7 = iVar1 * 3 + uVar7 * 10 & 0xffff;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      uVar5 = some_skillcheck_calc((s32)((uVar7 - uVar3) * 0x10000) >> 0x10);
      return uVar5;
    }
  }
  return 0;
}

undefined get_int_ranger_stam(Party *param_1,u8 param_2){
  CharSheet *pCVar1;
  s32 iVar2;
  char cVar5;
  s32 iVar3;
  u32 uVar4;
  undefined uVar6;
  u32 uVar7;
  
  pCVar1 = param_1->Members[param_2];
  uVar6 = 0;
  if (pCVar1) {
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    cVar5 = getModdedSkill(pCVar1->Skills,SKILL_RANGER);
    iVar3 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
    uVar7 = iVar2 * 3 + cVar5 * 10 + iVar3 & 0xffff;
    uVar4 = RollD(1,100);
    if (uVar4 < uVar7) {
      uVar6 = some_skillcheck_calc((s32)((uVar7 - uVar4) * 0x10000) >> 0x10);
    }
    else {uVar6 = 0;}
  }
  return uVar6;
}

u8 ofunc_int_mechanic(Party *param_1){
CharSheet *pCVar1;
u8 ret;
s32 i=0;
s32 j=0
s32 k=0;
s32 l=0;
  do{
    pCVar1 = param_1->Members[i];
    if (pCVar1) {
      j = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
      k = getModdedSkill(pCVar1->Skills,SKILL_RANGER);
      j = (j * 2 + k * 5) * 0x10000 >> 0x10;
      if (l < j) {l = j;}
      }
    i++
  }while(i<4);
  i = RollD(1,100);
  if ((s32)i < l) {
    ret = some_skillcheck_calc((s32)((l - i) * 0x10000) >> 0x10);}
  else {ret = 0;}
  return ret;
}

undefined ofunc_mechanic_int_(Party *param_1,u32 param_2){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  u32 uVar3;
  undefined uVar5;
  undefined uVar6;
  u32 uVar7;
  
  pCVar1 = param_1->Members[param_2];
  uVar6 = 0;
  if (pCVar1) {
    cVar4 = getModdedSkill(pCVar1->Skills,SKILL_MECHANIC);
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    uVar7 = iVar2 * 4 + cVar4 * 10;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      uVar5 = some_skillcheck_calc((s32)((uVar7 - uVar3) * 0x10000) >> 0x10);
      uVar3 = 10 - (s32)cVar4;
      if ((s32)uVar3 < 1) {uVar3 = 1;}
      iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
      uVar6 = 0;
      if ((s32)(uVar3) <= iVar2) {
        damage_func(pCVar1,(s16)(uVar3));
        uVar6 = uVar5;
      }
    }
    else {uVar6 = 0;}
  }
  return uVar6;
}

undefined check_mechanic_int_stam(Party *param_1,u32 param_2){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  u32 uVar3;
  undefined uVar5;
  undefined uVar6;
  u32 uVar7;
  //yes, the same func as above, but acually used.
  pCVar1 = param_1->Members[param_2];
  uVar6 = 0;
  if (pCVar1) {
    cVar4 = getModdedSkill(pCVar1->Skills,SKILL_MECHANIC);
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    uVar7 = iVar2 * 4 + cVar4 * 10;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      uVar5 = some_skillcheck_calc((s32)((uVar7 - uVar3) * 0x10000) >> 0x10);
      uVar3 = 10 - (s32)cVar4;
      if ((s32)uVar3 < 1) {uVar3 = 1;}
      iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
      uVar6 = 0;
      if ((s32)(uVar3) <= iVar2) {
        damage_func(pCVar1,(s16)(uVar3));
        uVar6 = uVar5;
      }
    }
    else {uVar6 = 0;}
  }
  return uVar6;
}

u8 check_int_theif(Party *param_1){ //used for "secrect door" checks
CharSheet *pCVar1;
u8 ret;
s32 i=0;
s32 j=0
s32 k=0;
s32 l=0;
  do{
    pCVar1 = param_1->Members[i];
    if (pCVar1) {
      j = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
      k = getModdedSkill(pCVar1->Skills,SKILL_RANGER);
      j = (j * 3 + k * 10) * 0x10000 >> 0x10;
      if (l < j) {l = j;}
      }
    i++
  }while(i<4);
  i = RollD(1,100);
  if ((s32)i < l) {
    ret = some_skillcheck_calc((s32)((l - i) * 0x10000) >> 0x10);}
  else {ret = 0;}
  return ret;
}

u8 skillcheck_troubador(Party *arg0){
  char cVar3;
  s32 iVar1;
  u32 uVar2 = 0;
  u8 uVar4;
  Party *pPVar5;
  u32 uVar6 = 0;
  u32 uVar7 = 4;
  
  pPVar5 = arg0;
  do {
    if (pPVar5->Members[0]) {
      cVar3 = getModdedSkill(pPVar5->Members[0]->Skills,Troubadour);
      if (uVar2 <= ((s32)cVar3)) {
        uVar7 = uVar6;
        uVar2 = (s32)cVar3;
      }
    }
    uVar6++;
    pPVar5 = (Party *)(pPVar5->Members + 1);
  } while (uVar6 < 4);
  uVar4 = 0;
  if ((uVar7 != 4) && (uVar4 = 0, uVar2 != 0)) {
    if (arg0->Members[uVar7] == NULL) {uVar4 = 0;}
    else {
      iVar1 = CharStats::getModdedStat(arg0->Members[uVar7]->Stats,STAT_DEX);
      uVar6 = uVar2 + iVar1 * 3;
      uVar2 = RollD(1,100);
      if (uVar2 < uVar6) {
        uVar4 = some_skillcheck_calc((s32)((uVar6 - uVar2) * 0x10000) >> 0x10);
      }
      else {uVar4 = 0;}
    }
  }
  return uVar4;
}

u8 check_warrior_int_stam(Party *param_1,u32 param_2){
  CharSheet *pCVar1;
  s32 iVar2;
  char cVar5;
  s32 iVar3;
  u32 uVar4;
  u8 uVar6;
  u32 uVar7;
  
  pCVar1 = param_1->Members[param_2 & 0xff];
  uVar6 = 0;
  if (pCVar1) {
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    cVar5 = getModdedSkill(pCVar1->Skills,SKILL_WARRIOR);
    iVar3 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
    uVar7 = iVar2 + cVar5 * 7 + iVar3;
    uVar4 = RollD(1,100);
    if (uVar4 < uVar7) {
      uVar6 = some_skillcheck_calc((s32)((uVar7 - uVar4) * 0x10000) >> 0x10);
    }
    else {uVar6 = 0;}
  }
  return uVar6;
}

u8 healing_widget_AB_func(s32 param_1,widgetStruct *param_2){
  PTR_800ed504 = NULL;
  FUN_800b72cc(gGlobals.widgetHandler,param_2);
  if (param_2) {
    (*(param_2->methods->freeWidget).func)
              ((s32)&param_2->ptr0 + (s32)(s16)(param_2->methods->freeWidget).arg[0],3);
  }
  return 0;
}

void healing_result_widget(char *arg0)
{
  color32 col1;
  color32 col2;
  
  if (gGlobals.screenFadeModeSwitch == 2) {
    if (gCombatP) {copy_string_to_combat_textbox(gCombatP,arg0,0);}
  }
  else {
    col1 = OFFWHITE;
    col2 = DARKGRAY_T;
    PTR_800ed504 = some_textbox_func(arg0,0x96,&col1,&col2,1);
    PTR_800ed504->AbuttonFunc = healing_widget_AB_func;
    PTR_800ed504->BButtonFunc = healing_widget_AB_func;
    PTR_800ed504->CDownFunc = NULL;
    PTR_800ed504->CUpFunc = NULL;
  }
  return;
}

char * healing_func(Party *arg0,u8 A,u8 B){
  CharSheet *pCVar1;
  CharSheet *pCVar2;
  char *pcVar3;
  u32 uVar4;
  u32 uVar5;
  char cVar8;
  s32 iVar6;
  char *pcVar7;
  CharSkills *pCVar9;
  char *pcVar10;
  s32 unaff_s3_lo;
  
  pCVar1 = arg0->Members[A];
  pCVar2 = arg0->Members[B];
  if ((pCVar1 == NULL) || (pCVar2 == NULL)) {
    pcVar7 = (gGlobals.CommonStrings)->"someone in party is invalid";}
  else {
    uVar4 = getHPCurrent(pCVar2);
    uVar5 = getHPMax(pCVar2);
    if (uVar4 == (uVar5)) {
      pcVar3 = pCVar2->name;
      pcVar10 = (gGlobals.CommonStrings)->"X already at max health";
    }
    else {
      if (gGlobals.screenFadeModeSwitch == 2) {
        if (gGlobals.ShadowIndex != -1) {
          return (gGlobals.CommonStrings)->"shadow prescence prevents healing";
        }
      }
      cVar8 = getModdedSkill(pCVar1->Skills,SKILL_HEALER);
      if (2 < CharStats::getModdedStat(pCVar1->Stats,STAT_STAM)) {
        damage_func(pCVar1,3);
        addHP(pCVar2,cVar8 << 1 + 5);
        uVar5 = getHPCurrent(pCVar2);
        if (0 < (s32)((uVar5 - uVar4) * 0x10000) >> 0x10) {
          Gsprintf((gGlobals.CommonStrings)->"X heals Y by Z",pCVar1->name,pCVar2->name,uVar5 - uVar4);
          return gGlobals.text;
        }
      }
      pcVar3 = pCVar1->name;
      pcVar10 = (gGlobals.CommonStrings)->"X failed the task";
    }
    pcVar7 = gGlobals.text;
    Gsprintf(pcVar10,pcVar3);
  }
  return pcVar7;
}

void pass_to_healing_func_2(Party *param_1,u8 param_2,u8 param_3){
  healing_result_widget(healing_func(param_1,param_2,param_3));
}

void herb_func(void){
  undefined *puVar1;
  
  puVar1 = (undefined *)
           (((gGlobals.BigAssMenu)->widget).substruct)->dollmenu->unk0x88->unk0x94;
  FUN_8003d064(puVar1,itemID_array[31],1,0xff); //herb loaded
  FUN_8003d640(puVar1);
  (**(code **)(*(s32 *)(puVar1 + 0x78) + 0x2c))(puVar1 + *(s16 *)(*(s32 *)(puVar1 + 0x78) + 0x28));
  FUN_8002ff30(*(s32 *)(puVar1 + 0x80));
}

char * party_healing_func(Party *param_1,u32 param_2,u32 param_3){
  CharSheet *pCVar1;
  CharSheet *pCVar2;
  char *pcVar3;
  inv_funcs *piVar4;
  char cVar10;
  s32 iVar5;
  u32 uVar6;
  u32 uVar7;
  ulong uVar8;
  s32 iVar9;
  CharStats *pCVar11;
  char *pcVar12;
  
  pCVar1 = param_1->Members[param_2];
  if ((pCVar1 == NULL) ||
     (pCVar2 = param_1->Members[param_3], pCVar2 == NULL)) {
    return (gGlobals.CommonStrings)->"someone in party is invalid";}
  iVar5 = 5 - getModdedSkill(pCVar1->Skills,SKILL_HEALER);
  if (iVar5 < 1) {iVar5 = 1;}
  uVar6 = getHPCurrent(pCVar2);
  uVar7 = getHPMax(pCVar2);
  if (uVar6 == uVar7) {
    pcVar3 = pCVar2->name;
    pcVar12 = (gGlobals.CommonStrings)->"X already at max health";
  }
  else {
    piVar4 = param_1->Inventory->Functions;
    uVar8 = (*(piVar4->get_some_bool).func)
                      ((s32)param_1->Inventory->inv_slots +
                       (s16)(piVar4->get_some_bool).arg[0] + -4,(ulonglong)itemID_array[31],1);
    if (uVar8 != 0) {
      if (gCombatP == NULL) {herb_func();}
      pCVar11 = pCVar1->Stats;
      iVar9 = CharStats::getModdedStat(pCVar11,STAT_STAM);
      if ((s16)iVar5 <= iVar9) {
        if ((gGlobals.screenFadeModeSwitch == 2) && (gGlobals.ShadowIndex != -1)) {
          return (gGlobals.CommonStrings)->"shadow's prescence prevents healing";}
        damage_func(pCVar1,(s16)iVar5);
        iVar5 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
        iVar5 = (iVar5 * 4 + ((cVar10 * 2 + (s32)cVar10) * 4 - (s32)cVar10)) * 0x10000 >> 0x10;
        uVar7 = RollD(1,100);
        Gsprintf((gGlobals.CommonStrings)->X failed the task,pCVar1->name);
        if ((s32)uVar7 < iVar5) {
          iVar5 = some_skillcheck_calc((s32)((iVar5 - uVar7) * 0x10000) >> 0x10);
          addHP(pCVar2,iVar5 << 0x12 >> 0x10));
          uVar7 = getHPCurrent(pCVar2);
          if ((s32)((uVar7 - uVar6) * 0x10000) >> 0x10 != 0) {
            Gsprintf((gGlobals.CommonStrings)->"X heals Y by Z",pCVar1->name,pCVar2->name,uVar7 - uVar6);
          }
        }
        goto LAB_80081018;
      }
    }
    pcVar3 = pCVar1->name;
    pcVar12 = (gGlobals.CommonStrings)->X failed the task;
  }
  Gsprintf(pcVar12,pcVar3);
LAB_80081018:
  return gGlobals.text;
}

void pass_to_party_healing_func(Party *param_1,u8 param_2,u8 param_3){
  healing_result_widget(party_healing_func(param_1,param_2,param_3));}

char * some_healing_func(Party *param_1,u8 param_2,u8 param_3,u8 param_4){
  CharSheet *pCVar1;
  CharSheet *pCVar2;
  inv_funcs *piVar3;
  char cVar9;
  s32 iVar5;
  ulong uVar6;
  s32 iVar7;
  u32 uVar8;
  u8 arg1;
  s32 iVar10;
  
  pCVar1 = param_1->Members[param_2];
  if ((pCVar1 == NULL) ||
     (pCVar2 = param_1->Members[param_3], pCVar2 == NULL)) {return (gGlobals.CommonStrings)->"someone in party is invalid";}  
  if (someStatCheck(pCVar2->Stats,param_4) == 0)
   {Gsprintf((gGlobals.CommonStrings)->"already max hp",pCVar2->name,Stat_labels[param_4]);}
  else {
    cVar9 = getModdedSkill(pCVar1->Skills,SKILL_HEALER);
    iVar5 = 0xf - cVar9;
    if (iVar5 < 0) {iVar5 = 0;}
    piVar3 = param_1->Inventory->Functions;
    uVar6 = (*(piVar3->get_some_bool).func)
                      ((s32)param_1->Inventory->inv_slots +
                       (s16)(piVar3->get_some_bool).arg[0] + -4,itemID_array[31],1);
    if (uVar6 != 0) {
      herb_func();
      if ((s16)iVar5 <= CharStats::getModdedStat(pCVar1->Stats,STAT_STAM)) {
        damage_func(pCVar1,(s16)iVar5);
        iVar5 = (CharStats::getModdedStat(pCVar1->Stats,STAT_INT) * 2 + cVar9 * 4 + (s32)cVar9) * 0x10000 >> 0x10;
        uVar8 = RollD(1,100);
        Gsprintf((gGlobals.CommonStrings)->X failed the task,pCVar1->name);
        if ((s32)uVar8 < iVar5) {
          iVar5 = some_skillcheck_calc((s32)((iVar5 - uVar8) * 0x10000) >> 0x10);
          iVar10 = (iVar5 << 0x11) >> 0x10;
          iVar5 = CharStats::getModdedStat(pCVar2->Stats,arg1);
          if (CharStats::getBaseStat(pCVar2->Stats,arg1) < iVar5 + iVar10) {
            iVar10 = (CharStats::getBaseStat(pCVar2->Stats,arg1) - iVar5) * 0x10000 >> 0x10;
          }
          CharStats::addModdedStat(pCVar2->Stats,arg1,(char)iVar10);
          if (0 < CharStats::getModdedStat(pCVar2->Stats,arg1) - iVar5) {
            Gsprintf((gGlobals.CommonStrings)->"hp restored by x",pCVar2->name,
                        Stat_labels[param_4]);
          }
        }
        goto LAB_800812c8;
      }
    }
    Gsprintf((gGlobals.CommonStrings)->X failed the task,pCVar1->name);
  }
LAB_800812c8:
  return gGlobals.text;
}


u8 potion_recipie_func_(Party *param_1,u32 param_2,POTION param_3){
  u8 bVar1;
  undefined *puVar2;
  inv_funcs *piVar3;
  potionRecipie *iVar6;
  ulong uVar5;
  char cVar11;
  s32 iVar8;
  u32 uVar9;
  ulonglong uVar4;
  ulong uVar10;
  u32 uVar12;
  CharSheet *iVar7;
  
  puVar2 = (undefined *)
           (((gGlobals.BigAssMenu)->widget).substruct)->dollmenu->unk0x88->unk0x94;
  iVar6 = get_potion_recipie(param_3));
  if (iVar6) {
    iVar7 = param_1->Members[param_2];
    FUN_8003d064(puVar2,itemID_array[30],iVar6->spice,0xff);
    FUN_8003d064(puVar2,itemID_array[31],iVar6->herb,0xff);
    FUN_8003d064(puVar2,itemID_array[32],iVar6->gemstone,0xff);
    if (iVar6->spice){
      piVar3 = param_1->Inventory->Functions;
      uVar5 = (*(piVar3->get_some_bool).func)
                        ((s32)param_1->Inventory->inv_slots +
                         (s16)(piVar3->get_some_bool).arg[0] + -4,
                         itemID_array[30],iVar6->spice);
      uVar10 = 0;
      if (uVar5 == 0) goto LAB_80081538;
    }
    if (iVar6->herb) {
      piVar3 = param_1->Inventory->Functions;
      uVar5 = (*(piVar3->get_some_bool).func)
                        ((s32)param_1->Inventory->inv_slots +
                         (s16)(piVar3->get_some_bool).arg[0] + -4,
                         itemID_array[31],iVar6->herb);
      uVar10 = 0;
      if (uVar5 == 0) goto LAB_80081538;
    }
    if (iVar6->gemstone) {
      piVar3 = param_1->Inventory->Functions;
      uVar5 = (*(piVar3->get_some_bool).func)
                        ((s32)param_1->Inventory->inv_slots +
                         (s16)(piVar3->get_some_bool).arg[0] + -4,
                         itemID_array[32],iVar6->gemstone);
      uVar10 = 0;
      if (uVar5 == 0) goto LAB_80081538;
    }
    cVar11 = getModdedSkill(iVar7->Skills,SKILL_ALCHEMIST);
    uVar10 = 0;
    if (cVar11 < iVar6->alchemist) goto LAB_80081538;
    iVar8 = CharStats::getModdedStat(iVar7->Stats,STAT_INT);
    uVar12 = iVar8 * 3 + cVar11 * 6;
    uVar9 = RollD(1,100);
    if (uVar9 < uVar12) {
      uVar4 = some_skillcheck_calc((s32)((uVar12 - uVar9) * 0x10000) >> 0x10);
      uVar10 = 0;
      if (iVar6->pad <= uVar4) {
        uVar4 = param_3 | 0x1000;
        piVar3 = param_1->Inventory->Functions;
        uVar10 = (*(piVar3->add_to_inv).func)
                           ((s32)param_1->Inventory->inv_slots +
                            (s16)(piVar3->add_to_inv).arg[0] + -4,uVar4,1);
        if (uVar10 != 0) {
          SMI_AddItem((s32)puVar2,uVar4,1,0xff,FILENAME);
          FUN_8003d640(puVar2);
          (**(code **)(*(s32 *)(puVar2 + 0x78) + 0x2c))
                    (puVar2 + *(s16 *)(*(s32 *)(puVar2 + 0x78) + 0x28));
          FUN_8002ff30(*(s32 *)(puVar2 + 0x80));
        }
      }
      goto LAB_80081538;
    }
  }
  uVar10 = 0;
LAB_80081538:
  return (u8)uVar10;
}

bool lockpicking_func(Party *p,u8 lock,char *text)

{
  CharSheet *pCVar1;
  char *pcVar2;
  char *pcVar3;
  char cVar6;
  bool bVar7;
  s32 iVar4;
  s32 iVar5;
  char *pcVar8;
  
  cVar6 = GetMostSkilledMember(p,SKILL_THIEF);
  if (cVar6 == -1) {
    strcpy(text,(gGlobals.CommonStrings)->"party couldn't pick lock");
    bVar7 = false;
  }
  else {
    pCVar1 = p->Members[cVar6];
    if (lock < 10) {
      cVar6 = getModdedSkill(pCVar1->Skills,SKILL_THIEF);
      iVar4 = 10;
      if (cVar6 < '\n') {
        cVar6 = getModdedSkill(pCVar1->Skills,SKILL_THIEF);
        iVar4 = (s32)cVar6;
      }
      if ((iVar4 - 1) < lock) {
        iVar4 = (lock - iVar4) * 0x1000000 >> 0x18;
        if (iVar4 < 3) {
          pcVar2 = pCVar1->name;
          pcVar8 = (gGlobals.CommonStrings)->lock beyon ability to pick;
          pcVar3 = (gGlobals.CommonStrings)->a little;
        }
        else {
          if (5 < iVar4) {
            sprintf(text,(gGlobals.CommonStrings)->lock beyon ability to pick,
                        (gGlobals.CommonStrings)->far,pCVar1->name);
            return false;
          }
          pcVar2 = pCVar1->name;
          pcVar8 = (gGlobals.CommonStrings)->lock beyon ability to pick;
          pcVar3 = (gGlobals.CommonStrings)->definietly;
        }
        sprintf(text,pcVar8,pcVar3,pcVar2);
        bVar7 = false;
      }
      else {
        iVar4 = 10 - iVar4;
        if (iVar4 < 1) {
          iVar4 = 1;
        }
        iVar5 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
        if (iVar5 < iVar4) {
          sprintf(text,(gGlobals.CommonStrings)->too weak to pick,pCVar1->name);
          bVar7 = false;
        }
        else {
          CharStats::addModdedStat(pCVar1->Stats,STAT_STAM,-(char)iVar4);
          sprintf(text,(gGlobals.CommonStrings)->sucessfully picks lock,pCVar1->name);
          bVar7 = true;
        }
      }
    }
    else {
      sprintf(text,(gGlobals.CommonStrings)->lock beyon ability to pick,
                  (gGlobals.CommonStrings)->far,pCVar1->name);
      bVar7 = false;
    }
  }
  return bVar7;
}


u8 ofunc_mechanic_skill(Party* param_1,u8 param_2)

{
  CharSheet *pCVar1;
  char cVar5;
  s32 iVar2;
  s32 iVar3;
  u32 uVar4;
  u8 uVar6;
  u8 uVar7;
  u32 uVar8;
  
  pCVar1 = param_1->Members[param_2];
  cVar5 = getModdedSkill(pCVar1->Skills,SKILL_MECHANIC);
  iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_STR);
  iVar3 = CharStats::getModdedStat(pCVar1->Stats,STAT_DEX);
  uVar8 = (iVar2 + iVar3) * 2 + 10 + cVar5 * 6;
  uVar4 = RollD(1,100);
  if (uVar4 < uVar8) {
    uVar6 = some_skillcheck_calc((s32)((uVar8 - uVar4) * 0x10000) >> 0x10);
    uVar4 = cVar5 * -2 + 0x19;
    if ((s32)uVar4 < 1) {uVar4 = 1;}
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
    uVar7 = 0;
    if (uVar4 <= iVar2) {
      damage_func(pCVar1,uVar4);
      uVar7 = uVar6;
    }
  }
  else {uVar7 = 0;}
  return uVar7;
}


float ranger_int_float(Party *param_1){ //used for calulating the reagent multiplier
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  float fVar5;
  float fVar6;
  
  cVar4 = GetMostSkilledMember(param_1,SKILL_RANGER);
  if ((cVar4 == -1) || (pCVar1 = param_1->Members[cVar4], pCVar1 == NULL)) {
    fVar5 = 0.0;}
  else {
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    cVar4 = getModdedSkill(pCVar1->Skills,SKILL_RANGER);
    fVar6 = (float)(iVar2 + cVar4 * 7);
    fVar6 *= ((float)RollD(1,100) / 100.0f);
    fVar5 = 1.0f;
    if ((fVar6 <= 1.0f) && (fVar5 = fVar6, fVar6 < 0.0)) {fVar5 = 0.0;}
  }
  return fVar5;
}

float Ofunc_Ranger_float(Party *param_1){return (float)ofunc_ranger_stam_int(param_1) / 20.0f;}
bool theif_over_B(Party *A,u8 B){return B <= check_int_theif(A);}


char * appraise_price(Party *param_1,ItemID param_2,u32 param_3){
  CharSheet *pCVar1;
  char cVar3;
  s32 iVar2;
  u32 uVar4;
  u32 uVar5;
  u32 uVar6;
  double dVar7;
  float fVar8;
  
  uVar6 = 0;
  uVar5 = 0;
  do {
    pCVar1 = param_1->Members[0];
    if (pCVar1) {
      iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
      cVar3 = getModdedSkill(pCVar1->Skills,Merchant);
      uVar4 = iVar2 + cVar3 * 6;
      if (uVar6 <= uVar4) {uVar6 = uVar4;}
    }
    uVar5++;
    param_1 = (Party *)(param_1->Members + 1);
  } while (uVar5 < 4);
  fVar8 = ((float)(uVar6 * uVar6) * -0.0186603f + (float)uVar6 * 2.366025f + 50.0f) / 100.0f;
  if (fVar8 < 0.0) {fVar8 = 0.0;}
  else if (125.0f < fVar8) {fVar8 = 125.0f;}
  fVar8 = ((float)GetItemPrice(param_2) * fVar8 * 3.0f) / (float)(param_3);
  dVar7 = (double)fVar8;
  if (0.0 < fVar8) {uVar6 = (u32)(dVar7 + 0.5d);}
  else {uVar6 = -(s32)(0.5d - dVar7);}
  uVar6 &= 0xff;
  if (6 < uVar6) {uVar6 = 6;}
  return price_strings[uVar6];
}

s8 mechanic_check(Party *param_1,u8 param_2,u8 param_3){
  s32 iVar1;
  char cVar3;
  u32 uVar2;
  u32 uVar4;
  CharSheet *piVar5;
  u32 uVar6;
  u32 uVar7;
  u32 uVar8;
  
  uVar8 = 0xff;
  uVar7 = 0;
  uVar6 = 0;
  iVar1 = 0;
  for(i=0;i<4;i++){
    piVar5 = param_1->Members[i];
    if (piVar5) {
      cVar3 = getModdedSkill(piVar5->Skills,param_2);
      uVar4 = (s32)cVar3;
      uVar2 = param_3 - uVar4;
      if ((s32)uVar2 < 1) uVar2 = 1;
      if ((uVar7 < uVar4) &&
         ((s32)(uVar2 & 0xff) <= CharStats::getModdedStat(piVar5->Stats,STAT_STAM))) {
        uVar8 = i;
        uVar7 = uVar4;
      }
    }
  }
  i = -1;
  if(uVar7 != 0) i = uVar8;
  return i;
}

s8 GetMostSkilledMember(Party *param_1,u8 param_2){
//kinda frustrating how inconsitently this is used.
  s32 iVar2;
  u8 bVar3;
  u32 uVar4;
  u8 bVar5;
  u32 uVar6;
  CharSheet *iVar1;
  
  uVar6 = -1;
  bVar5 = 0;
  uVar4 = 0;
  iVar2 = 0;
  do {
    iVar1 = param_1->Members[uVar4]);
    if ((iVar1) &&
       (bVar3 = getModdedSkill(iVar1->Skills,param_2), bVar5 <= bVar3)) {
      uVar6 = uVar4;
      bVar5 = bVar3;
    }
    uVar4++;
  } while (uVar4 < 4);
  return (s8)uVar6;}

float camp_float_array[30]= //ambush risk. 0=can't camp there.
{20.0,15.0,10.0,20.0,20.0,10.0,0.0,10.0,0.0,0.0,50.0,
0.0,0.0,0.0,0.0,0.0,0.0,10.0,0.0,0.0,30.0,30.0,30.0,
0.0,15.0,0.0,0.0,20.0,0.0,0.0};

bool get_ranger_camping_bool(Party *param_1){
  bool bVar3;
  char cVar4;
  s32 iVar1;
  u32 uVar2;
  s32 iVar5;
  ulonglong uVar6;
  float fVar7;
  
  if (getEventFlag(0x138c) == false) {bVar3 = false;}
  else {
    cVar4 = GetMostSkilledMember(param_1,SKILL_RANGER);
    uVar6 = 0;
    if ((cVar4 != -1) {
      uVar6 = 0;
      if (param_1->Members[cVar4]) {
        cVar4 = getModdedSkill(param_1->Members[cVar4]->Skills,SKILL_RANGER);
        uVar6 = 0;
        if (0 < cVar4) {uVar6 = cVar4;}
      }
    }
    iVar5 = (s32)uVar6;
    if (10 < uVar6) {iVar5 = 10;}
    iVar1 = World::getTerrain(TerrainPointer);
    fVar7 = (15.0f - (float)iVar5) * 0.666f * camp_float_array[iVar1];
    if (INT_MAX_f <= fVar7) {fVar7-= INT_MAX_f;}
    bVar3 = RollD(1,100) <= ((s32)fVar7);
  }
  return bVar3;
}

void passto_load_camp_ambush(void){load_camp_ambush();}

u8 get_equip_stamMod(ItemID param_1){
  u8 bVar3;
  weapon_ram *pwVar1;
  ItemID IVar4;
  
  bVar3 = 0;
  switch(param_1 >> 8) {
  case 1:
  case 9:
  case 10:
  case 0xb:
  case 0xc:
  case 0xd:
  case 0xe:
  case 0xf:
  case 0x11:
  case 0x12:
  case 0x13:
    iVar2 = search_item_array(IVar4);
    if (item_pointer->Gear[iVar2].stat != STAT_STAM) {return 0;}
    return item_pointer->Gear[iVar2].StatMod;
  default:
    goto LAB_80081f64;
  case 5:
  case 6:
    bVar3 = GetIDIndex(IVar4);
    pwVar1 = (weapon_ram *)armour_pointer->Armor;
    break;
  case 7:
    bVar3 = GetIDIndex(IVar4);
    pwVar1 = weapon_pointer->weapons;
  }
  if (pwVar1[bVar3].stat == STAT_STAM) {bVar3 = pwVar1[bVar3].statMod;}
  else {bVar3 = 0;}
LAB_80081f64:
  return bVar3;
}

void multi_equip_StamMod(Temp_weapon *param_1,float param_2){
  u8 (*pabVar1) [2];
  s32 iVar2;
  char cVar3;
  
  if (((param_1) && (pabVar1 = param_1->Stat, pabVar1))
     && ((*pabVar1)[0] == 5)) {
    iVar2 = get_equip_stamMod(param_1->id);
    cVar3 = iVar2 * param_2);
    if (iVar2 < (*pabVar1)[1] + cVar3) {(*pabVar1)[1] = (u8)iVar2;}
    else {(*pabVar1)[1] = cVar3 + (*pabVar1)[1];}
  }
}

void some_camp_func(Party *param_1,bool halfHeal){
  CharSheet *pCVar1;
  inv_funcs *piVar2;
  Inventory_struct *pIVar3;
  bool bVar6;
  ulong uVar4;
  Temp_weapon *pTVar5;
  Party *pPVar7;
  u32 uVar8;
  u32 uVar9;
  float uVar10;
  float local_60 [2];
  
  if (TerrainPointer->a < 2) {uVar9 = 0x1a5e00;}
  else {
    uVar9 = 0x1a5e00 / TerrainPointer->a;
    if (TerrainPointer->a == 0) {trap(7);}
  }
  uVar8 = 0;
  local_60 = {1.0f,.5f};
  uVar10 = local_60[halfHeal];
  pPVar7 = param_1;
  do {
    pCVar1 = pPVar7->Members[0];
    if ((pCVar1) && (!isDead(pCVar1))) {camp_healing(pCVar1,uVar10,uVar9);}
    uVar8++;
    pPVar7 = (Party *)(pPVar7->Members + 1);
  } while (uVar8 < 4);
  piVar2 = param_1->Inventory->Functions;
  uVar4 = (*(piVar2->get_inv_max).func)
                    ((s32)param_1->Inventory->inv_slots + (s16)(piVar2->get_inv_max).arg[0] + -4);
  if (uVar4 != 0) {
    pIVar3 = param_1->Inventory;
    uVar8 = 0;
    while( true ) {
      pTVar5 = (Temp_weapon *)
               (*(pIVar3->Functions->get_inv_slot).func)
                         ((s32)pIVar3->inv_slots +
                          (s16)(pIVar3->Functions->get_inv_slot).arg[0] + -4,uVar8);
      multi_equip_StamMod(pTVar5,uVar10);
      if (uVar4 <= uVar8 + 1) break;
      pIVar3 = param_1->Inventory;
      uVar8++;
    }
  }
  noop_800821bc(param_1,1,uVar9);
  gGlobals.combatBytes[2] = 0;
  return;
}

bool check_for_camp_ambush(Party *param_1){
  bool bVar1 = get_ranger_camping_bool(param_1);
  if (bVar1) {passto_load_camp_ambush(param_1);}
  else {some_camp_func(param_1,true);}
  return bVar1 == true;}

//dummied, probably for some incrementation based on ingame time.
void noop_800821bc(Party* p,u32 A,u32 time){}

void tick_party_movement_vals(Party *param_1,s32 param_2){
  //3 values in the party struct. seem useless.
  
  s16 sVar1 = (gGlobals.playerCharStruct.playerDat)->ani_type;
  s32 iVar2 = param_2 * (u32)TerrainPointer->a;
  u32 uVar3;
  
  if (sVar1 == 3) {param_1->TimeRunning = (param_1->TimeRunning + iVar2) % 18000;}
  else {
    if (sVar1 < 4) {
      if (sVar1 != 2) {return;}
      uVar3 = param_1->timeWalking + iVar2;
      param_1->timeWalking = uVar3 + ((uVar3 >> 5) / 0xd2f) * -0x1a5e0;
      return;
    }
    if (sVar1 == 0x19) {
      param_1->timeSneaking = (param_1->timeSneaking + iVar2) % 36000;
      return;
    }
  }
  return;
}

u32 check_party_skill(Party *param_1,u8 param_2){
  u32 uVar1;
  u32 uVar2;
  //used for dialouge functions.
  switch(param_2) {
  case SKILL_ALCHEMIST:
    uVar2 = check_Alchemist_int(param_1);
    break;
  case Diplomat:
    uVar1 = Check_diplomat_int((CharSheet **)param_1);
    uVar2 = 2;
    if (2 < uVar1) {uVar2 = Check_diplomat_int((CharSheet **)param_1);}
    break;  //why the doublecheck?
  case Healer:
    uVar2 = check_healer_int(param_1);
    break;
  case SKILL_LOREMASTER:
    uVar2 = check_loremaster_INT((CharSheet **)param_1);
    break;
  case SKILL_MECHANIC:
    uVar2 = check_mechanic_dex_int(param_1);
    break;
  case Merchant:
    uVar2 = check_Merchant_INT(param_1);
    break;
  case SKILL_RANGER:
    uVar2 = check_ranger(param_1);
    break;
  case Stealth:
    uVar2 = ret0_80082968();
    break;
  case SKILL_THIEF:
    uVar2 = check_theif_Int(param_1);
    break;
  case Troubadour:
    uVar2 = skillcheck_troubador(param_1);
    break;
  case SKILL_WARRIOR:
    uVar2 = check_warrior_int_stam_(param_1);
    break;
  case SKILL_WIZARD:
    uVar2 = check_Wizard_int(param_1);
    break;
  default:
    uVar2 = 0;
  }
  return uVar2;
}

u32 get_best_stat(Party *param_1,u8 param_2){
  u32 uVar1;
  CharSheet *piVar4;
  u32 uVar3;
  
  uVar3 = 1;
  uVar1 = CharStats::getModdedStat(param_1->Members[0]->Stats,param_2);
  do {
    piVar4 = param_1->Members[uVar3]);
    if ((piVar4) && (uVar1 < CharStats::getModdedStat(piVar4->Stats,param_2))
    {uVar1 = CharStats::getModdedStat(piVar4->Stats,param_2);}
    uVar3++;
  } while (uVar3 < 4);
  return uVar1;}

u32 get_worst_stat(Party *param_1,u8 param_2){
  u32 uVar1;
  CharSheet *piVar4;
  u32 uVar3;
  
  uVar3 = 1;
  uVar1 = CharStats::getModdedStat(param_1->Members[0]->Stats,param_2);
  do {
    piVar4 = param_1->Members[uVar3]);
    if ((piVar4) && (uVar1 > CharStats::getModdedStat(piVar4->Stats,param_2))
    {uVar1 = CharStats::getModdedStat(piVar4->Stats,param_2);}
    uVar3++;
  } while (uVar3 < 4);
  return uVar1;}

u32 get_this_char_stat(Party *param_1,ItemID param_2,u8 param_3){
  u32 i = 0;
  CharSheet *psVar1;
  
  while ((psVar1 = param_1->Members[i], psVar1 == NULL ||(psVar1->ID != param_2))) {
    i++;
    if (3 < i) {return 0;}
  }
  return CharStats::getModdedStat(psVar1->Stats,param_3);
}

u32 check_Alchemist_int(Party *param_1){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  
  cVar4 = GetMostSkilledMember(param_1,SKILL_ALCHEMIST);
  if (cVar4 == -1) return 0;
  else {
    pCVar1 = param_1->Members[cVar4];
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    cVar4 = getModdedSkill(pCVar1->Skills,SKILL_ALCHEMIST);
    return some_skillcheck_calc((s32)((RollD(1,100) - (iVar2 * 3 + cVar4 * 6)) * 0x10000) >> 0x10);
  }
}

u32 check_healer_int(Party *param_1){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  
  cVar4 = GetMostSkilledMember(param_1,SKILL_HEALER);
  if (cVar4 == -1)  return 0;
  else {
    pCVar1 = param_1->Members[cVar4];
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    cVar4 = getModdedSkill(pCVar1->Skills,SKILL_HEALER);
    return some_skillcheck_calc((RollD(1,100) - (iVar2 * 3 + cVar4 * 10));
  }
}

u32 heck_mechanic_dex_int(Party *param_1){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  u32 ret;
  
  cVar4 = GetMostSkilledMember(param_1,SKILL_MECHANIC);
  if (cVar4 == -1) return 0;
  else {
    pCVar1 = param_1->Members[cVar4];
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    iVar3 = CharStats::getModdedStat(pCVar1->Stats,STAT_DEX);
    cVar4 = getModdedSkill(pCVar1->Skills,SKILL_MECHANIC);
    return some_skillcheck_calc(((RollD(1,100) - (cVar4 * 5 + iVar2 + iVar3 & 0x7fffU) * -2));
  }
}

u32 check_Merchant_INT(Party *param_1){
  s32 iVar1;
  char cVar4;
  u32 uVar2;
  u32 uVar3;
  CharSheet *pCVar1;
  u32 uVar5;
  
  uVar3 = 0;
  uVar5 = 0;
  iVar1 = 0;
  do {
    pCVar1 = param_1->Members[uVar5]);
    if ((pCVar1) && uVar3 < CharStats::getModdedStat(pCVar1->Stats,STAT_INT))) {
      uVar3 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    }
    uVar5++;
  } while (uVar5 < 4);
  cVar4 = GetMostSkilledMember(param_1,Merchant);
  uVar5 = 0;
  if (cVar4 != -1) {
    uVar5 = (s32)getModdedSkill(param_1->Members[cVar4]->Skills,Merchant);
  }
  uVar3 = some_skillcheck_calc((s32)((RollD(1,100) - (uVar3 * 3 + uVar5 * 10)) * 0x10000) >> 0x10);
  return uVar3;
}

u32 check_ranger(Party *param_1){
  char cVar3;
  u32 uVar1;
  u32 uVar2;
  
  cVar3 = GetMostSkilledMember(param_1,SKILL_RANGER);
  uVar2 = 0;
  if (cVar3 != -1) {
    uVar2 = (s32)getModdedSkill(param_1->Members[cVar3]->Skills,SKILL_RANGER);
  }
  uVar2 = some_skillcheck_calc((s32)((RollD(1,100) - (uVar2 * 10 + 0x50)) * 0x10000) >> 0x10);
  return uVar2;}

//dialouge stealth checks =0
u32 ret0_80082968(void){return 0;}

u32 check_theif_Int(Party *param_1){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  u32 uVar3;
  
  cVar4 = GetMostSkilledMember(param_1,SKILL_THIEF);
  if (cVar4 == -1) return 0;
  else {
    pCVar1 = param_1->Members[cVar4];
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    cVar4 = getModdedSkill(pCVar1->Skills,SKILL_THIEF);
    return some_skillcheck_calc(RollD(1,100) - (iVar2 * 4 + cVar4 * 10));
  }
}

u32 check_warrior_int_stam_(Party *param_1){
  CharSheet *pCVar1;
  char cVar5;
  s32 iVar2;
  s32 iVar3;
  u32 uVar4;
  
  cVar5 = GetMostSkilledMember(param_1,SKILL_WARRIOR);
  if (cVar5 == -1) return 0;
  else {
    pCVar1 = param_1->Members[cVar5];
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    cVar5 = getModdedSkill(pCVar1->Skills,SKILL_WARRIOR);
    iVar3 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
    uVar4 = some_skillcheck_calc((s32)((RollD(1,100) - (iVar2 + cVar5 * 7 + iVar3)) * 0x10000) >> 0x10);
  }
  return uVar4;
}

u32 check_Wizard_int(Party *param_1){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  u32 uVar3;
  
  cVar4 = GetMostSkilledMember(param_1,SKILL_WIZARD);
  if (cVar4 == -1) return 0;
  else {
    pCVar1 = param_1->Members[cVar4];
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    cVar4 = getModdedSkill(pCVar1->Skills,SKILL_WIZARD);
    uVar3 = some_skillcheck_calc((s32)((RollD(1,100) + (cVar4 * 5 + iVar2 & 0x7fffU) * -2) * 0x10000) >> 0x10);
  }
  return uVar3;
}

u8 get_ranger_or_warrior(Party *param_1,u32 param_2){
  char cVar2;
  u8 uVar3;
  u8 uVar1;
  longlong lVar4;
  ulonglong uVar5;
  float fVar6;
  float afStack88 [4];
  
  uVar5 = 0;
  cVar2 = GetMostSkilledMember(param_1,SKILL_RANGER);
  if (cVar2 == -1) {
    cVar2 = GetMostSkilledMember(param_1,SKILL_WARRIOR);
    if (cVar2 != -1) {
      uVar5 = check_warrior_int_stam(param_1,cVar2);
      goto LAB_80082bf0;
    }
    if (param_1->Members[0] == NULL) goto LAB_80082bf0;
    lVar4 = 0;
  }
  uVar5 = get_int_ranger_stam(param_1,lVar4);
LAB_80082bf0:
  uVar1 = globals::rand_range(0,10);
  fVar6 = -1.0f;
  if ((uVar1 & 1)) fVar6 = 1.0f;
  afStack88[0] = 1.0f;
  afStack88[1] = 0.5f;
  afStack88[2] = 0.25f;
  afStack88[3] = 0.0f;
  if (3 < uVar5) uVar5 = 3;
  fVar6 *= afStack88[uVar5] * (float)(param_2);
  if (INT_MAX_f <= fVar6) fVar6-= INT_MAX_f;
  uVar1 = param_2 + (s32)fVar6;
  if (uVar1 == 0) uVar1 = 1;
  if (0xc < uVar1) uVar1 = 0xc;
  return uVar1;
}

bool AmorCraft_attempt(Party *param_1,char param_2,s16 param_3,ItemID material,u8 stam){
  undefined *puVar1;
  inv_funcs *piVar2;
  ulonglong uVar3;
  ulong uVar4;
  bool bVar5;
  ulonglong uVar6;
  
  uVar6 = (longlong)material & 0xffff;
  puVar1 = (undefined *)
           (((gGlobals.BigAssMenu)->widget).substruct)->dollmenu->unk0x88->unk0x94;
  uVar3 = getMechanic_Int_Dex(param_1,param_2);
  piVar2 = param_1->Inventory->Functions;
  uVar4 = (*(piVar2->get_inv_index).func)
                    ((s32)param_1->Inventory->inv_slots + (s16)(piVar2->get_inv_index).arg[0] + -4
                     ,material);
  if (uVar4 == 0xffffffff) {
    bVar5 = false;
  }
  else {
    piVar2 = param_1->Inventory->Functions;
    (*(piVar2->get_some_bool).func)
              ((s32)param_1->Inventory->inv_slots + (s16)(piVar2->get_some_bool).arg[0] + -4,uVar6
               ,1);
    FUN_8003d064(puVar1,material,1,0xff);
    bVar5 = stam <= uVar3;
    if (bVar5) {
      piVar2 = param_1->Inventory->Functions;
      (*(piVar2->add_to_inv).func)
                ((s32)param_1->Inventory->inv_slots + (s16)(piVar2->add_to_inv).arg[0] + -4,
                 param_3,1);
      SMI_AddItem((s32)puVar1,param_3,1,0xff,FILENAME);
    }
    FUN_8003d640(puVar1);
    (**(code **)(*(s32 *)(puVar1 + 0x78) + 0x2c))
              (puVar1 + *(s16 *)(*(s32 *)(puVar1 + 0x78) + 0x28));
    FUN_8002ff30(*(s32 *)(puVar1 + 0x80));
  }
  return bVar5;
}

bool FUN_80082E40(Party *param_1,s32 param_2,ItemID param_3){
  CharSheet *pCVar1;
  temp_gear **pptVar5;
  u8 i;
  
  pCVar1 = param_1->Members[param_2];
  if (pCVar1) {
    if (pCVar1->weapons){
      if (pCVar1->weapons->id == param_3) {
        unequp_weapons(pCVar1);
        return true;
      }
    }
    if (pCVar1->armor[0]) {
      if ((*pptVar2)->id == param_3) {
        remove_chestArmor(pCVar1);
        return true;
      }
    }
    if (pCVar1->armor[1]) {
      if (ptVar3->id == param_3) {
        remove_sheild(pCVar1);
        return true;
      }
    }
    if (pCVar1->pItemList->usedItems) {
      for (i=0;i < pCVar1->pItemList->usedItems;i++) {
        pptVar5 = pCVar1->pItemList->pItem[i];
        if ((*pptVar5) && ((*pptVar5)->id == param_3)) {
          unequip_acc(pCVar1,i);
          return true;
        }
      }
    }
  }
  return false;

bool dialoug_look_for_item(Party *param_1,ItemID param_2){
  inv_funcs *piVar1;
  bool bVar2;
  u32 uVar4;
  
  bVar2 = has_item_func(param_1->Inventory,param_2);
  if (bVar2 == false) {
    uVar4 = 0;
    do {
      bVar2 = FUN_80082e40(param_1,uVar4++,param_2);
      if (bVar2) goto LAB_80082f80;
    } while (uVar4 < 4);
    bVar2 = false;
  }
  else {
    piVar1 = param_1->Inventory->Functions;
    (*(piVar1->get_some_bool).func)
              ((s32)param_1->Inventory->inv_slots + (s16)(piVar1->get_some_bool).arg[0] + -4,
               param_2,1);
LAB_80082f80:
    bVar2 = true;
  }
  return bVar2;
}

bool FUN_80082fcc(s16 *param_1,s16 param_2){
  if (param_1) return *param_1 == param_2;
  return false;
}

bool hasItem_eqquipped(Party *param_1,s32 param_2,ItemID param_3){
  Temp_weapon *pTVar1;
  bool bVar2;
  
  if (param_1->Members[param_2] == NULL) {bVar2 = false;}
  else {
    pTVar1 = Has_Item_equipped_character(param_1->Members[param_2],param_3);
    bVar2 = pTVar1 != NULL;
  }
  return bVar2;
}

bool hasItem(Party *param_1,ItemID param_2){
  bool bVar2;
  bool lVar1;
  u32 uVar3;
  
  bVar2 = has_item_func(param_1->Inventory,param_2);
  uVar3 = 0;
  if (bVar2 == false) {
    do {
      lVar1 = hasItem_eqquipped(param_1,uVar3,param_2);
      uVar3++;
      if (lVar1) goto LAB_8008305c;
    } while (uVar3 < 4);
    bVar2 = false;
  }
  else {
LAB_8008305c:
    bVar2 = true;
  }
  return bVar2;
}

bool FUN_800830a4(Party *param_1,u8 param_2,temp_gear *param_3,CharSheet *param_4,
                 u8 param_5){
  ItemID IVar1;
  inv_funcs *piVar2;
  u8 bVar4;
  u8 (*X) [2];
  ulong uVar3;
  u32 uVar5;
  temp_gear **pptVar6;
  u32 uVar7;
  u32 uVar8;
  undefined uVar9;
  
  IVar1 = param_3->id;
  bVar4 = ;
  bVar4 = FUN_8007e798(param_1,something_with_gear_INT(param_4,IVar1));
  if (bVar4 != 0) {
    return (bool)bVar4;
  }
  uVar8 = 0;
  uVar7 = 0;
  uVar5 = (u32)(u8)param_4->pItemList->num_used;
  if (uVar5 != 0) {
    pptVar6 = param_4->pItemList->pItem;
    do {
      if ((*pptVar6) && ((u16)(*pptVar6)->id >> 8 == (u16)IVar1 >> 8)) {
        uVar7++;
      }
      uVar8++;
      pptVar6++;
    } while (uVar8 < uVar5);
  }
  if (uVar7 < param_5) {
    X = create_2ByteArray(param_3->statmod);
    uVar9 = 0xff;
    if (param_3->pSpell) uVar9 = *(undefined *)&param_3->pSpell->name;
    piVar2 = param_1->Inventory->Functions;
    uVar3 = (*(piVar2->get_some_bool).func)
                      ((s32)param_1->Inventory->inv_slots +
                       (s16)(piVar2->get_some_bool).arg[0] + -4,(ulonglong)(u16)IVar1,1);
    if (uVar3 != 0) {
      FUN_8007f10c(param_1,param_4,IVar1,X,uVar9);
      return false;
    }
    if (X) {
      HeapFree(X,FILENAME,0x15a4);
      return true;
    }
  }
  return true;
}