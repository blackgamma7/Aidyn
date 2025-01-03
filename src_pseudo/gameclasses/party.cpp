#define FILENAME "../gameclasses/party.cpp"

#include "globals.h"
#include "stringN64.h"
#include "heapN64.h"

void Party::Init(Party *party){
  CLEAR(party);
  party->Inventory = new PartyInventory();
}

void Party::Free(Party *param_1){
  if (param_1->Inventory) param_1->Inventory->~PartyInventory();
  for(u32 i=0;i<3;i++) {
    if (param_1->Members[i]) {
      CharSheet_free(param_1->Members[i]);
      FREE(param_1->Members[i],232);
      }
  }
}


void Party::CheckFlags(Party *param_1,ItemID param_2,u8 alive,u8 state){
  ushort uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  ushort auVar5 [2];
  ushort auVar6 [2];
  ushort auVar7 [2];
  byte bVar11;
  ushort (*pauVar8) [3];
  int iVar9;
  ushort (*pauVar10) [2];
  undefined4 *puVar12;
  ushort (*pauVar13) [2];
  uint uVar14;
  undefined4 uStack208;
  EventFlag aEStack_cc [2];
  undefined4 auStack_c8 [30];
  undefined4 auStack_50 [20];
  
  bVar11 = GetIDIndex(param_2);
  if (alive) {
    pauVar8 = party_eventflag_dict1;
    puVar12 = &uStack208;
    if (true) {
      do {
        uVar2 = *(undefined4 *)((int)pauVar8 + 4);
        uVar3 = *(undefined4 *)((int)pauVar8 + 8);
        uVar4 = *(undefined4 *)((int)pauVar8 + 0xc);
        *puVar12 = *(undefined4 *)pauVar8;
        puVar12[1] = uVar2;
        puVar12[2] = uVar3;
        puVar12[3] = uVar4;
        pauVar8 = (ushort (*) [3])((int)pauVar8 + 0x10);
        puVar12 = puVar12 + 4;
      } while (pauVar8 != (ushort (*) [3])(party_eventflag_dict1[0xd] + 1));
    }
    else {
      do {
        uVar2 = *(undefined4 *)((int)pauVar8 + 4);
        uVar3 = *(undefined4 *)((int)pauVar8 + 8);
        uVar4 = *(undefined4 *)((int)pauVar8 + 0xc);
        *puVar12 = *(undefined4 *)pauVar8;
        puVar12[1] = uVar2;
        puVar12[2] = uVar3;
        puVar12[3] = uVar4;
        pauVar8 = (ushort (*) [3])((int)pauVar8 + 0x10);
        puVar12 = puVar12 + 4;
      } while (pauVar8 != (ushort (*) [3])(party_eventflag_dict1[0xd] + 1));
    }
    uVar14 = 0;
    *puVar12 = party_eventflag_dict1[13]._2_4_;
    if (uStack208._0_2_ != -1) {
      iVar9 = 0;
      do {
        iVar9 += uVar14;
        if (*(ushort *)((int)&uStack208 + iVar9 * 2) == (short)(char)bVar11) {
          setEventFlag(aEStack_cc[iVar9 + -1],state);
          setEventFlag(aEStack_cc[iVar9],!state);
          return;
        }
        uVar14 = uVar14 + 1 & 0xffff;
        iVar9 = uVar14 << 1;
      } while (*(short *)((int)&uStack208 + uVar14 * 6) != -1);
    }
  }
  else {
    pauVar10 = party_eventflag_dict2;
    pauVar13 = (ushort (*) [2])auStack_50;
    if (true) {
      do {
        auVar5 = pauVar10[1];
        auVar6 = pauVar10[2];
        auVar7 = pauVar10[3];
        *pauVar13 = *pauVar10;
        pauVar13[1] = auVar5;
        pauVar13[2] = auVar6;
        pauVar13[3] = auVar7;
        pauVar10 = pauVar10 + 4;
        pauVar13 = pauVar13 + 4;
      } while (pauVar10 != party_eventflag_dict2 + 0xc);
    }
    else {
      do {
        auVar5 = pauVar10[1];
        auVar6 = pauVar10[2];
        auVar7 = pauVar10[3];
        *pauVar13 = *pauVar10;
        pauVar13[1] = auVar5;
        pauVar13[2] = auVar6;
        pauVar13[3] = auVar7;
        pauVar10 = pauVar10 + 4;
        pauVar13 = pauVar13 + 4;
      } while (pauVar10 != party_eventflag_dict2 + 0xc);
      pauVar10 = party_eventflag_dict2 + 0xc;
    }
    auVar5 = pauVar10[1];
    *pauVar13 = *pauVar10;
    pauVar13[1] = auVar5;
    for (uVar14 = 0; uVar1 = (*(ushort (*) [2])auStack_50)[uVar14], uVar1 != 0xffff;
        uVar14 = uVar14 + 2 & 0xffff) {
      if ((short)(char)bVar11 == uVar1) {
        setEventFlag((*(ushort (*) [2])auStack_50)[uVar14 + 1],state);
        return;
      }
    }
  }
  return;
}

void Party::CheckDeaths(Party *param_1){
  for(u32 i=0;i<4;i++) {
    if (param_1->Members[i])
      CheckFlags(param_1,param_1->Members[i]->ID,false,Entity::isDead(pCVar1));
  }
}

u8 Party::AddMember(Party *param_1,ItemID param_2){
  u8 bVar3;
  uint uVar1;
  CharSheet *pCVar2;
  uint uVar4;
  
  if (param_1->PartySize == 4) return false;
  else {
    uVar4 = 0;
    if (param_1->Members[0] != NULL) {
      uVar1 = 1;
      do {
        uVar4 = uVar1 & 0xff;
        if (3 < uVar4) break;
        uVar1 = uVar4 + 1;
      } while (param_1->Members[uVar4] != NULL);
    }
    ALLOCL(param_1->Members[uVar4],343);
    Entity::Init(pCVar2,param_2,0);
    param_1->PartySize++;
    CheckFlags(param_1,param_2,true,true);
    SaveEntity::CopyMember(param_1->Members[uVar4]);
    return true;
  }
}


u8 Party::isMemberUnequipped(Party *param_1,u8 slot){
  Entity_Ram *pEVar1;
  byte bVar3;
  WeaponInstance *pWVar2;
  u8 ret;
  CharSheet *chara;
  
  chara = param_1->Members[slot];
  bVar3 = GetIDIndex(chara->ID);
  pEVar1 = gEntityDB->entities;
  if ((*chara->armor != NULL) || (ret = false, gEntityDB->entities[(char)bVar3].Armor == (ItemID)0xffff)) {
    if (chara->armor[1] == NULL) {
      if (pEVar1[(char)bVar3].Sheild != (ItemID)0xffff) {
        return false;
      }
    }
    ret = true;
    if (chara->weapons == NULL) {
      ret = false;
      if (((pEVar1[(char)bVar3].weapon[0] == (ItemID)0xffff) &&
          (ret = false, pEVar1[(char)bVar3].weapon[1] == (ItemID)0xffff)) &&
         (ret = false, pEVar1[(char)bVar3].weapon[2] == (ItemID)0xffff)) {
        ret = true;
      }
    }
  }
  return ret;
}

CharSheet * Party::GetMemberById(Party *param_1,ItemID param_2){
  u8 temp;
  return get_party_charsheet(param_1,param_2,&temp);}

CharSheet * get_party_charsheet(Party *param_1,ItemID param_2,u8 *param_3){
  *param_3 = find_ent_in_Party(param_1,param_2);
  if (*param_3 == -1) return NULL;
  else return param_1->Members[*param_3];
}

//move chaaracter to empty space? unused.
void Ofunc_8007e108(Party *param_1){
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
  u8 i=0;
  CharSheet *psVar1;
  while ((psVar1 = party->Members[i], psVar1 == NULL ||(psVar1->ID != id))) {
    i++;
    if (3 < i) return -1;
  }
  return (s8)i;
}

void Party::removeAliveMemberByID(Party *param_1, ItemID param_2){
  s8 sVar1 = find_ent_in_Party(param_1,param_2);
  if (sVar1 != -1) RemoveAliveMember(param_1,sVar1);
}


void Party::RemoveAliveMember(Party *param_1,s8 param_2){
  StripMember(param_1,param_2,1);
  SaveEntity::BenchParty(param_1);
  if (param_1->Members[param_2]) {
    CheckFlags(param_1,param_1->Members[param_2]->ID,true,false);
    RemoveMember(param_1,param_2,0);
    ScoochMembers(param_1);
  }
}

void Party::RemoveAllMembers(Party *param_1){
  for(u32 i = 0;i < 4;i++) remove_party_member(param_1,i,0);
}

u8 Party::IsCharacterInParty(Party *param_1,ItemID param_2){
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

void Party::BringOutYourDead(Party *param_1){
  CheckDeaths(param_1);
  for(u32 i=0;i<4;i++) {
    if ((param_1->Members[i]) && (Entity::isDead(param_1->Members[i]))) {
      SaveEntity::EraseEntityOfID(param_1->Members[i]->ID);
      RemoveMember(param_1,(byte)i,1);
    }
  }
  ScoochMembers(param_1);
}

void Party::ScoochMembers(Party *param_1){
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

void Party::StripMember(Party *param_1,u8 param_2,u8 param_3){
    if (param_1->Members[param_2]) {
    for(u32 i = 0;i < 0xc;i++) {
      RemoveGearFrom(param_1,param_2,i); 
    }
    if (param_3) {
      RemoveWeaponsFrom(param_1,param_2);
      RemoveArmorFrom(param_1,param_2);
      RemoveShieldFrom(param_1,param_2);
    }
  }
}

void Party::RemoveMember(Party *param_1,u8 param_2,u8 param_3){
  if (param_1->Members[param_2]) {
    Party::StripMember(param_1,param_2,param_3);
    CharSheet_free(param_1->Members[param_2]);
    FREE(param_1->Members[param_2],261);
    param_1->PartySize--;
  }
}

u8 Party::HasEntity(Party *param_1,CharSheet *param_2){
  if (param_2 == NULL) return false;
  for(u32 i=0;i<4;i++) {
    uVar1 += 1;
    if (param_2 == param_1->Members[i]) return true;
  }
  return true;
}

u32 Party::GetAvgLevel(Party *param_1){
  u32 uVar3;
  u32 uVar4;
  CharSheet *iVar1;
  
  uVar4 = 0;
  if (param_1->PartySize == 0) uVar4 = 0;
  else {
    
    for(uVar3 = 0;uVar3 < 4;uVar3++) {
      iVar1 = param_1->Members[uVar3];
      if (iVar1) {uVar4+= CharStats::getModdedStat(iVar1->Stats,STAT_LV);}
    }
    uVar4/= param_1->PartySize;
  }
  return uVar4;
}

void Party::ClearInventory(Party *param_1){
  param_1->Inventory->Clear();
  param_1->Inventory->Reset();
}

StatMod * CreateStatMod(StatMod *param_1){
  StatMod *pSVar1;
  
  if (!param_1) pSVar1 = NULL;
  else {
    ALLOC(pSVar1,697);
    pSVar1->stat = param_1->stat;
    pSVar1->mod = param_1->mod;
  }
  return pSVar1;
}

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


u8 func_checking_niesen_2(Party *param_1,CharSheet *param_2,u8 param_3,ItemID param_4){
  s32 uVar2;
  u8 bVar4;
  

  if (param_1->Inventory->HasItem(param_4)) {
    uVar2 = param_1->Inventory->GetItemIndex(param_4);
    bVar4 = GetIDIndex(param_4);
    if ((&gCombatP->combatEnts)[param_3] == NULL) return true;
    if (param_2->ID != (ItemID)(entityList[162] + 0x200)) {
      FUN_8006f8d8((&gCombatP->combatEnts)[param_3],param_4,uVar2);
      if (bVar4 < 4) {gGlobals.combatBytes[1] = 0x13;}
      return false;
    }
  }
  return true;
}

u8 get_equip_error(Party *param_1,u8 param_2,char param_3){
  CharSheet *pCVar1;
  GearInstance *puVar4;

  
  pCVar1 = param_1->Members[param_2];
  if ((pCVar1) &&
     puVar4 = param_1->Inventory->GetItemEntry(param_3),
     puVar4 != NULL) {
    if (((puVar4->base).aspect != ASPECT_NONE) &&
       ((puVar4->base).aspect != CharExp::GetAspect(pCVar1->EXP))) return 2;
    for (u16 uVar6 = 0;itemtype_funcs[uVar6].type != 0xff;uVar6++){
        if (itemtype_funcs[uVar6].type== (puVar4->base).id.s >> 8) {
          return itemtype_funcs[uVar6].function(param_1,param_2,puVar4,pCVar1);
        }
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
    X = CreateStatMod(param_3->statMod);
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
    X = CreateStatMod(param_3->statMod);
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
    X = CreateStatMod(param_3->Stat);
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

u8 itemtype_scroll(Party *param_1,u8 param_2,GearInstance *param_3,CharSheet *param_4){
  u8 uVar2;
  
  if (gametrek_flag0 == 0) {
    if (item_pointer->Gear[search_item_array(param_3->id)].spell == 0xff) uVar2 = 1;
    else uVar2 = FUN_800830a4(param_1,param_2,param_3,param_4,3);
  }
  else uVar2 = Party::UseScroll(param_1,param_2,param_3,param_4);
  return uVar2;}

u8 itemtype_ring(Party *param_1,u8 param_2,GearInstance *param_3,CharSheet *param_4){
  return FUN_800830a4(param_1,param_2,param_3,param_4,2);}


u8 itemtype_gear(Party *param_1,u8 param_2,GearInstance *param_3,CharSheet *param_4,ItemID *param_5){
  u8 bVar1;
  ItemID IVar2;
  ItemID IVar3;
  inv_funcs *piVar4;
  CharGear *pCVar5;
  u8 bVar7;
  u8 (*X) [2];
  ulong uVar6;
  u8 bVar8;
  GearInstance *ptVar9;
  u32 uVar10;
  
  IVar2 = param_3->id;
  bVar7 = FUN_8007e798(param_1,int Entity::GearMinStatCheck(param_4,IVar2));
  if (bVar7 == 0) {
    X = CreateStatMod(param_3->statmod);
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
        ptVar9 = (GearInstance *)pCVar5->pItem;
        do {
          if (*(GearInstance **)((s32)ptVar9 + uVar10 * 4) == NULL) {
            bVar1 = pCVar5->num_used;
          }
          else {
            IVar3 = (*(GearInstance **)((s32)ptVar9 + uVar10 * 4))->id;
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
          ptVar9 = (GearInstance *)pCVar5->pItem;
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
  
  Entity::EquipGear(param_2,param_3,param_4);
  pCVar1 = param_2->pItemList;
  SetMagicCharges(param_2->pItemList->pItem[CharGear::GetSlotByID(pCVar1,param_3)],param_5);
}


bool Party::UseScroll(Party *param_1,byte param_2,GearInstance *param_3,CharSheet *param_4){
  byte bVar1;
  byte bVar2;
  u8 MVar3;
  u8 MVar4;
  ItemID IVar5;
  Gear_RAM *pGVar6;
  Spell_RAM *pSVar7;
  byte bVar11;
  u16 uVar10;
  bool bVar12;
  int iVar9;
  char *pcVar13;
  Color32 *pCVar14;
  Color32 *pCVar15;
  Color32 acStack808;
  Color32 acStack744;
  Color32 acStack680;
  Color32 acStack616;
  undefined auStack_228 [8];
  Color32 acStack544;
  Color32 acStack480;
  Color32 acStack416;
  Color32 acStack352;
  Color32 acStack288;
  Color32 acStack224;
  Color32 acStack160;
  Color32 acStack96;
  
  bVar11 = CharSkills::CapBaseSkill(param_4->Skills,SKILL_Wizard);
  if ((longlong)(char)bVar11 < 0) {
    pCVar14 = &acStack808;
    acStack808.R = 0xe1;
    acStack808.G = 0xe1;
    acStack808.B = 0xe1;
    acStack808.A = 0xff;
    acStack744.R = 0x32;
    acStack744.G = 0x32;
    acStack744.B = 0x32;
    acStack744.A = 0x96;
    pcVar13 = gGlobals.CommonStrings[0x1b9];
    pCVar15 = &acStack744;
  }
  else {
    IVar5 = (param_3->base).id;
    uVar10 = search_item_array(IVar5);
    pGVar6 = item_pointer->Gear;
    bVar1 = pGVar6[uVar10].spell;
    if (bVar1 == 0xff) {
      pcVar13 = "The enchantment on this scroll can only be used to re-light the Port Saiid Lighthouse.";
      pCVar14 = &acStack680;
      pCVar15 = &acStack616;
      acStack680.R = 0xe1;
      acStack680.G = 0xe1;
      acStack680.B = 0xe1;
      acStack680.A = 0xff;
      acStack616.R = 0x32;
      acStack616.G = 0x32;
      acStack616.B = 0x32;
      acStack616.A = 0x96;
    }
    else {
      bVar1 = SpellList[(char)bVar1];
      auStack_228[0] = 0;
      if (Spellbook::HaveSpell(param_4->spellbook,(ItemID)(bVar1 | 0x300),auStack_228)) {
        sprintf(gGlobals.text,gGlobals.CommonStrings[0x1ba],param_4->name);
        pcVar13 = gGlobals.text;
        pCVar14 = &acStack544;
        pCVar15 = &acStack480;
        acStack544.R = 0xe1;
        acStack544.G = 0xe1;
        acStack544.B = 0xe1;
        acStack544.A = 0xff;
        acStack480.R = 0x32;
        acStack480.G = 0x32;
        acStack480.B = 0x32;
        acStack480.A = 0x96;
      }
      else {
        bVar2 = pGVar6[(short)uVar10].spell;
        pSVar7 = gLoadedSpells->spells[bVar2];
        if (bVar11 < pSVar7->WizardREQ){
          pCVar14 = &acStack416;
          acStack416.R = 0xe1;
          acStack416.G = 0xe1;
          acStack416.B = 0xe1;
          acStack352.R = 0x32;
          acStack352.G = 0x32;
          acStack352.B = 0x32;
          acStack416.A = 0xff;
          acStack352.A = 0x96;
          pcVar13 = gGlobals.CommonStrings[0x1bb];
          pCVar15 = &acStack352;
        }
        else {
          MVar3 = param_4->EXP->school;
          if (((MVar3 == SCHOOL_Chaos) ||
              (MVar4 = pSVar7->School, MVar4 == SCHOOL_NONE))
             || (MVar3 == MVar4)) {
            Spellbook::NewSpell(param_4->spellbook,bVar1 | 0x300,1);
            sprintf(gGlobals.text,gGlobals.CommonStrings[0x1bd],param_4->name,
                        (int)pSVar7 + iVar9 * 2 + 2);
            acStack160.R = 0xe1;
            acStack160.G = 0xe1;
            acStack160.B = 0xe1;
            acStack160.A = 0xff;
            acStack96.R = 0x32;
            acStack96.G = 0x32;
            acStack96.B = 0x32;
            acStack96.A = 0x96;
            some_textbox_func(gGlobals.text,0x96,&acStack160,&acStack96,1);
            param_1->Inventory->TakeItem(IVar5,1);
            return false;
          }
          pCVar14 = &acStack288;
          acStack288.R = 0xe1;
          acStack288.G = 0xe1;
          acStack288.B = 0xe1;
          acStack224.R = 0x32;
          acStack224.G = 0x32;
          acStack224.B = 0x32;
          acStack288.A = 0xff;
          acStack224.A = 0x96;
          pcVar13 = gGlobals.CommonStrings[0x1bc];
          pCVar15 = &acStack224;
        }
      }
    }
  }
  some_textbox_func(pcVar13,0x96,pCVar14,pCVar15,1);
  return true;
}



void FUN_8007f508(ItemInstance *param_1,StatMod *param_2,byte param_3){
  if (param_1->statMod) HFREE(param_1->statMod,1362);
  param_1->statMod = param_2;
  if (param_3 != -1) param_1->spellCharge->Charges = param_3;
}


bool Party::RemoveArmorFrom(Party *param_1,u8 index){
  CharSheet *pCVar1;
  ArmorInstance *pAVar2;
  SpellCharges *pSVar3;
  StatMod *X;
  ulong uVar5;
  ItemInstance *pIVar6;
  int line;
  byte bVar7;
  
  if (gGlobals.combatBytes[0] == 0xe) return true;
  pCVar1 = param_1->Members[index];
  if (!pCVar1) return true;
  pAVar2 = pCVar1->armor[0];
  if (!pAVar2) return false;
  X = CreateStatMod((pAVar2->base).statMod);
  pSVar3 = (pAVar2->base).spellCharge;
  bVar7 = 0xff;
  if (pSVar3) bVar7 = pSVar3->Charges;
  uVar5 = param_1->Inventory->AddItem((pAVar2->base).id,1);
  if (uVar5 == 0) {
    if (X == NULL) return true;
    line = 0x572;
  }
  else {
    uVar5= param_1->Inventory->GetItemIndex((pAVar2->base).id);
    pIVar6 = &param_1->Inventory->GetItemEntry(uVar5)->base;
    if (pIVar6) {
      FUN_8007f508(pIVar6,X,bVar7);
      Entity::RemoveArmor(pCVar1);
      return false;
    }
    if (X == NULL) return true;
    line = 0x57d;
  }
  HFREE(X,line);
  return true;
}



u8 removeArmorIntoInventory(Party *param_1,u32 param_2){
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
  X = CreateStatMod(ptVar2->statMod);
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

u8 MoveWeaponsToInventory(Party *param_1,u32 param_2){
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
    X = CreateStatMod(pTVar5->Stat);
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
        Entity::UnequipWeapons(pCVar1);
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


u8 FUN_8007f9b8(Party *param_1,u8 param_2,u8 param_3){
  CharSheet *pCVar1;
  inv_funcs *piVar2;
  u8 (*X) [2];
  ulong uVar3;
  Temp_weapon *pTVar4;
  undefined uVar6;
  GearInstance *puVar2;
  
  pCVar1 = param_1->Members[param_2];
  if (pCVar1 == NULL) return true;
  if (0xb < param_3) return true;
  if (pCVar1->pItemList) {
    puVar2 = pCVar1->pItemList[param_3];
    if (puVar2 == NULL) return true;
    X = CreateStatMod(puVar2->statmod);
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
      Entity::UnequipGear(pCVar1,uVar5);
      return false;
    }
    if (X) {HeapFree(X,FILENAME,0x625);}
  }
  return true;
}

int Party::DiplomatCheck(Party *param_1)

{
  CharSheet *pCVar1;
  u8 bVar6;
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
      uVar9 += CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Diplomat);
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

//
uint Party::LoremasterCheck(Party *param_1){
  CharSheet *pCVar1;
  bool bVar5;
  u8 uVar2;
  s8 sVar6;
  u8 uVar7;
  uint uVar8;
  
  u32 bestInt = 0;
  u32 partySkill = 0;
  for(i = 0;i<4;i++) {
    pCVar1 = param_1->Members[i];
    if ((pCVar1) && (!Entity::isDead(pCVar1))) {
      uVar2 = CharStats::getModded(pCVar1->Stats,STAT_INT);
      if (bestInt < uVar2) bestInt = uVar2;
      sVar6 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Loremaster);
      partySkill+= (int)CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Loremaster);
    }
  }
  s32 total = bestInt * 3 + partySkill * 6;
  u16 rand = RollD(1,100);
  if (rand < total) {
    return some_skillcheck_calc((total - rand);
  }
  else return 0;
}

u32 loremaster_INT_skillcheck(Party *param_1){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  u32 uVar3;
  u32 uVar5;
  
  cVar4 = GetMostSkilledMember(param_1,SKILL_Loremaster);
  if ((longlong)cVar4 != 0xff) {
    pCVar1 = param_1->Members[cVar4];
    if (pCVar1 == NULL) {return 0;}
    cVar4 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Loremaster);
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
    cVar5 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Mechanic);
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
        Entity::DecreaseHP(pCVar1,(s16)(uVar4 & 0xffff));
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
    cVar5 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Mechanic);
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
        Entity::DecreaseHP(pCVar1,(s16)uVar4);
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
  u8 bVar5;
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
      cVar6 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Merchant);
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
      Entity::DecreaseHP(pCVar1,(s16)iVar3);
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
      cVar6 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Ranger);
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
        Entity::DecreaseHP(pCVar1,(s16)(uVar5 & 0xffff));
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
      cVar4 = CharSkills::getModdedSkill(iVar1->Skills,SKILL_Ranger);
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
      cVar4 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Ranger);
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

undefined Party::GetMemberRangerIntStam(Party *param_1,u8 param_2){
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
    cVar5 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Ranger);
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
      k = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Ranger);
      j = (j * 2 + k * 5) * 0x10000 >> 0x10;
      if (l < j) {l = j;}
      }
    i++
  }while(i<4);
  i = RollD(1,100);
  if ((s32)i < l) 
    ret = some_skillcheck_calc(((l - i));
  else ret = 0;
  return ret;
}

u8 ofunc_mechanic_int_(Party *param_1,u32 param_2){
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
    cVar4 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Mechanic);
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    uVar7 = iVar2 * 4 + cVar4 * 10;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      uVar5 = some_skillcheck_calc((s32)((uVar7 - uVar3));
      uVar3 = 10 - (s32)cVar4;
      if ((s32)uVar3 < 1) {uVar3 = 1;}
      iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
      uVar6 = 0;
      if ((s32)(uVar3) <= iVar2) {
        Entity::DecreaseHP(pCVar1,(s16)(uVar3));
        uVar6 = uVar5;
      }
    }
    else uVar6 = 0;
  }
  return uVar6;
}

u8 Party::DisarmDamage(Party *param_1,u8 param_2){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  u32 uVar3;
  undefined uVar5;
  undefined uVar6;
  u32 uVar7;
  //yes, the same func as above, but actually used.
  pCVar1 = param_1->Members[param_2];
  uVar6 = 0;
  if (pCVar1) {
    cVar4 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Mechanic);
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    uVar7 = iVar2 * 4 + cVar4 * 10;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      uVar5 = some_skillcheck_calc((s32)((uVar7 - uVar3) * 0x10000) >> 0x10);
      uVar3 = 10 - (s32)cVar4;
      if ((s32)uVar3 < 1) uVar3 = 1;
      iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
      uVar6 = 0;
      if ((s32)(uVar3) <= iVar2) {
        Entity::DecreaseHP(pCVar1,(s16)(uVar3));
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
s16 j=0
s32 k=0;
s32 l=0;
  do{
    pCVar1 = param_1->Members[i];
    if (pCVar1) {
      j = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
      k = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Ranger);
      j = (j * 3 + k * 10);
      if (l < j) {l = j;}
      }
    i++
  }while(i<4);
  i = RollD(1,100);
  if (i < l) 
    ret = some_skillcheck_calc(((l - i));
  else ret = 0;
  return ret;
}

u8 Party::TroubadourCheck(Party *arg0){
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
      cVar3 = CharSkills::getModdedSkill(pPVar5->Members[0]->Skills,Troubadour);
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

u8 Party::GetMemberWarriorIntStam(Party *param_1,u32 param_2){
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
    cVar5 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Warrior);
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

u8 healing_widget_AB_func(s32 param_1,BaseWidget *param_2){
  PTR_800ed504 = NULL;
  WidgetHandler::FreeWidget(gGlobals.widgetHandler,param_2);
  if (param_2) {
    (*(param_2->methods->freeWidget).func)
              ((s32)&param_2->ptr0 + (s32)(s16)(param_2->methods->freeWidget).arg[0],3);
  }
  return 0;
}

void healing_result_widget(char *arg0)
{
  Color32 col1;
  Color32 col2;
  
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
      cVar8 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Healer);
      if (2 < CharStats::getModdedStat(pCVar1->Stats,STAT_STAM)) {
        Entity::DecreaseHP(pCVar1,3);
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
  iVar5 = 5 - CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Healer);
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
        Entity::DecreaseHP(pCVar1,(s16)iVar5);
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
    cVar9 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Healer);
    iVar5 = 0xf - cVar9;
    if (iVar5 < 0) {iVar5 = 0;}
    piVar3 = param_1->Inventory->Functions;
    uVar6 = (*(piVar3->get_some_bool).func)
                      ((s32)param_1->Inventory->inv_slots +
                       (s16)(piVar3->get_some_bool).arg[0] + -4,itemID_array[31],1);
    if (uVar6 != 0) {
      herb_func();
      if ((s16)iVar5 <= CharStats::getModdedStat(pCVar1->Stats,STAT_STAM)) {
        Entity::DecreaseHP(pCVar1,(s16)iVar5);
        iVar5 = (CharStats::getModdedStat(pCVar1->Stats,STAT_INT) * 2 + cVar9 * 4 + (s32)cVar9) * 0x10000 >> 0x10;
        uVar8 = RollD(1,100);
        Gsprintf((gGlobals.CommonStrings)->X failed the task,pCVar1->name);
        if ((s32)uVar8 < iVar5) {
          iVar5 = some_skillcheck_calc((s32)((iVar5 - uVar8) * 0x10000) >> 0x10);
          iVar10 = (iVar5 << 0x11) >> 0x10;
          iVar5 = CharStats::getModdedStat(pCVar2->Stats,arg1);
          if (CharStats::getBase(pCVar2->Stats,arg1) < iVar5 + iVar10) {
            iVar10 = (CharStats::getBase(pCVar2->Stats,arg1) - iVar5) * 0x10000 >> 0x10;
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



byte potion_recipie_func_(Party *param_1,uint param_2,PotionEnum param_3)

{
  byte bVar1;
  WidgetTrainShop *pWVar2;
  inv_funcs *piVar3;
  WidgetMethods *pWVar4;
  potionRecipie *iVar6;
  ulong uVar5;
  s8 sVar11;
  int iVar8;
  u16 uVar10;
  u8 uVar12;
  ulong uVar9;
  ulonglong uVar13;
  CharSheet *iVar7;
  
  pWVar2 = (((gGlobals.BigAssMenu)->base).substruct)->dollmenu->field4_0x88->field7_0x94;
  iVar6 = get_potion_recipie(param_3);
  if (iVar6 != NULL) {
    iVar7 = param_1->Members[param_2 & 0xff];
    FUN_8003d064(pWVar2,itemID_array[30],iVar6->spice,0xff);
    FUN_8003d064(pWVar2,itemID_array[31],iVar6->herb,0xff);
    FUN_8003d064(pWVar2,itemID_array[32],iVar6->gemstone,0xff);
    if (iVar6->spice == 0) {
      bVar1 = iVar6->herb;
    }
    else {
      piVar3 = param_1->Inventory->Functions;
      uVar5 = (*(piVar3->TakeItem).func)
                        ((int)param_1->Inventory->inv_slots + *(short *)&(piVar3->TakeItem).arg + -4
                         ,(ulonglong)(ushort)itemID_array[30],(ulonglong)iVar6->spice);
      uVar9 = 0;
      if (uVar5 == 0) goto LAB_80081538;
      bVar1 = iVar6->herb;
    }
    if ((ulonglong)bVar1 != 0) {
      piVar3 = param_1->Inventory->Functions;
      uVar5 = (*(piVar3->TakeItem).func)
                        ((int)param_1->Inventory->inv_slots + *(short *)&(piVar3->TakeItem).arg + -4
                         ,(ulonglong)(ushort)itemID_array[31],(ulonglong)bVar1);
      uVar9 = 0;
      if (uVar5 == 0) goto LAB_80081538;
    }
    if ((ulonglong)iVar6->gemstone != 0) {
      piVar3 = param_1->Inventory->Functions;
      uVar5 = (*(piVar3->TakeItem).func)
                        ((int)param_1->Inventory->inv_slots + *(short *)&(piVar3->TakeItem).arg + -4
                         ,(ulonglong)(ushort)itemID_array[32],(ulonglong)iVar6->gemstone);
      uVar9 = 0;
      if (uVar5 == 0) goto LAB_80081538;
    }
    sVar11 = CharSkills::CharSkills::getModdedSkill(iVar7->Skills,SKILL_Alchemist);
    uVar9 = 0;
    if ((longlong)sVar11 < (longlong)(ulonglong)iVar6->alchemist) goto LAB_80081538;
    iVar8 = CharStats::getModded(iVar7->Stats,STAT_INT);
    uVar13 = (longlong)(iVar8 * 3 + sVar11 * 6) & 0xffff;
    uVar10 = RollD(1,100);
    if ((ulonglong)(longlong)(short)uVar10 < uVar13) {
      uVar12 = some_skillcheck_calc
                         ((short)((uint)(((int)uVar13 - (int)(short)uVar10) * 0x10000) >> 0x10));
      uVar9 = 0;
      if ((ulonglong)iVar6->pad <= (ulonglong)(longlong)(char)uVar12) {
        piVar3 = param_1->Inventory->Functions;
        uVar9 = (*(piVar3->AddItem).func)
                          ((int)param_1->Inventory->inv_slots +
                           *(short *)&(piVar3->AddItem).arg + -4,(ulonglong)param_3 | 0x1000,1);
        if (uVar9 != 0) {
          SMI::AddItem((int)pWVar2,(u16)((ulonglong)param_3 | 0x1000),1,0xff,
                       s_../gameclasses/party.cpp_800e0b20,0xacb);
          FUN_8003d640(pWVar2);
          pWVar4 = (pWVar2->base).vTable;
          (*(pWVar4->Tick).func)((int)&(pWVar2->base).fadeIn + (int)*(short *)&(pWVar4->Tick).arg);
          FUN_8002ff30(pWVar2->scrollMenu);
        }
      }
      goto LAB_80081538;
    }
  }
  uVar9 = 0;
LAB_80081538:
  return (byte)uVar9;
}


u8 lockpicking_func(Party *p,byte lock,char *text)

{
  CharSheet *pCVar1;
  char *pcVar2;
  char *pcVar3;
  s8 sVar6;
  u8 bVar7;
  s8 sVar8;
  int iVar4;
  int iVar5;
  char *pcVar9;
  s32 lok;
  
  lok = (s32)lock;
  sVar6 = Party::GetMostSkilledMember(p,SKILL_Theif);
  if (sVar6 == -1) {
    strcpy(text,(gGlobals.CommonStrings)->(party couldnt pick lock));
    bVar7 = false;
  }
  else {
    pCVar1 = p->Members[sVar6];
    if ((uint)lok < 10) {
      sVar8 = CharSkills::CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Theif);
      iVar4 = 10;
      if (sVar8 < 10) {
        sVar8 = CharSkills::CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Theif);
        iVar4 = (int)sVar8;
      }
      if (iVar4 + -1 < lok) {
        iVar4 = (lok - iVar4) * 0x1000000 >> 0x18;
        if (iVar4 < 3) {
          pcVar2 = pCVar1->name;
          pcVar9 = (gGlobals.CommonStrings)->lock beyon ability to pick;
          pcVar3 = (gGlobals.CommonStrings)->a little;
        }
        else {
          if (5 < iVar4) {
            sprintf(text,(gGlobals.CommonStrings)->lock beyon ability to pick,
                        (gGlobals.CommonStrings)->far,pCVar1->name);
            return false;
          }
          pcVar2 = pCVar1->name;
          pcVar9 = (gGlobals.CommonStrings)->lock beyon ability to pick;
          pcVar3 = (gGlobals.CommonStrings)->definietly;
        }
        sprintf(text,pcVar9,pcVar3,pcVar2);
        bVar7 = false;
      }
      else {
        iVar4 = 10 - iVar4;
        if (iVar4 < 1) iVar4 = 1;
        if (CharStats::getModded(pCVar1->Stats,STAT_STAM) < iVar4) {
          sprintf(text,(gGlobals.CommonStrings)->too weak to pick,pCVar1->name);
          bVar7 = false;
        }
        else {
          CharStats::addModdedHealth(pCVar1->Stats,STAT_STAM,-(char)iVar4);
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
  cVar5 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Mechanic);
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
      Entity::DecreaseHP(pCVar1,uVar4);
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
  
  cVar4 = GetMostSkilledMember(param_1,SKILL_Ranger);
  if ((cVar4 == -1) || (pCVar1 = param_1->Members[cVar4], pCVar1 == NULL)) {
    fVar5 = 0.0;}
  else {
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    cVar4 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Ranger);
    fVar6 = (float)(iVar2 + cVar4 * 7);
    fVar6 *= ((float)RollD(1,100) / 100.0f);
    fVar5 = 1.0f;
    if ((fVar6 <= 1.0f) && (fVar5 = fVar6, fVar6 < 0.0)) {fVar5 = 0.0;}
  }
  return fVar5;
}

float Ofunc_Ranger_float(Party *param_1){return (float)ofunc_ranger_stam_int(param_1) / 20.0f;}
u8 theif_over_B(Party *A,u8 B){return B <= check_int_theif(A);}


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
      cVar3 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Merchant);
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

s8 Party::DisarmCheck(Party *param_1,u8 param_2,u8 param_3){
  s32 iVar1;
  char cVar3;
  u8 uVar2;
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
      cVar3 = CharSkills::getModdedSkill(piVar5->Skills,param_2);
      uVar4 = (s32)cVar3;
      uVar2 = param_3 - uVar4;
      if (uVar2 < 1) uVar2 = 1;
      if ((uVar7 < uVar4) &&
         (uVar2 <= CharStats::getModdedStat(piVar5->Stats,STAT_STAM))) {
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
       (bVar3 = CharSkills::getModdedSkill(iVar1->Skills,param_2), bVar5 <= bVar3)) {
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

u8 Party::CampCheck(Party *param_1){
  u8 bVar3;
  s8 cVar4;
  s32 iVar1;
  u32 uVar2;
  s32 iVar5;
  u32 uVar6;
  
  if (!getEventFlag(0x138c))return false;
    cVar4 = GetMostSkilledMember(param_1,SKILL_Ranger);
    uVar6 = 0;
    if ((cVar4 != -1) {
      uVar6 = 0;
      if (param_1->Members[cVar4]) {
        cVar4 = CharSkills::getModdedSkill(param_1->Members[cVar4]->Skills,SKILL_Ranger);
        uVar6 = 0;
        if (0 < cVar4) uVar6 = cVar4;
      }
    }
    iVar5 = (s32)uVar6;
    if (10 < uVar6) iVar5 = 10;
    return RollD(1,100) <= (15.0f - (float)iVar5) * 0.666f * camp_float_array[World::getTerrain(TerrainPointer)];
}

void Party::CampAmbush(void){load_camp_ambush();}

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
    pwVar1 = gWeaponsDB->weapons;
  }
  if (pwVar1[bVar3].stat == STAT_STAM) {bVar3 = pwVar1[bVar3].statMod;}
  else {bVar3 = 0;}
LAB_80081f64:
  return bVar3;
}

void ItemCampStamina(ItemInstance *param_1,float param_2){
  StatMod *pSVar1;
  int iVar2;
  char cVar3;
  
  if (((param_1 != NULL) && (pSVar1 = param_1->statMod, pSVar1 != NULL)) &&
     (pSVar1->stat == STAT_STAM)) {
    iVar2 = get_equip_stamMod(param_1->id);
    cVar3 = (char)(int)((float)iVar2 * param_2);
    if (iVar2 < (int)pSVar1->mod + (int)cVar3) pSVar1->mod = (s8)iVar2;
    else pSVar1->mod = cVar3 + pSVar1->mod;
  }
}

void Party::CampHeal(Party *param_1,u8 halfHeal){
  CharSheet *pCVar1;
  u8 bVar6;
  ulong uVar4;
  ItemInstance *pTVar5;
  Party *pPVar7;
  u32 uVar8;
  u32 uVar9;
  float uVar10;
  float local_60 [2];
  
  if (TerrainPointer->daySpeed < 2) uVar9 = HOURS(8);
  else uVar9 = HOURS(8) / TerrainPointer->daySpeed;
  local_60 = {1.0f,.5f};
  uVar10 = local_60[halfHeal];
  pPVar7 = param_1;
  for(uVar8 = 0;uVar8 < 4;uVar8++;) {
    pCVar1 = param_1->Members[uVar8];
    if ((pCVar1) && (!isDead(pCVar1))) Entity::CampHeal(pCVar1,uVar10,uVar9);
  }
  uVar4 = param_1->Inventory->GetMaxQuantity();
  if (uVar4) {
    for(uVar8=0;uVar8 + 1<uVar4;uVar8++){
      ItemCampStamina(param_1->Inventory->GetItemEntry(uVar8),uVar10);
    }
  }
  noop_800821bc(param_1,1,uVar9);
  gGlobals.combatBytes[2] = 0;
}

u8 Party::CampAmbushCheck(Party *param_1){
  u8 bVar1 = Party::CampCheck(param_1);
  if (bVar1) {Party::CampAmbush(param_1);}
  else {Party::CampHeal(param_1,true);}
  return bVar1 == true;}

//dummied, probably for some incrementation based on ingame time.
void Party::noop_800821bc(Party* p,u32 A,u32 time){}

void Party::TickMoveCounters(Party *param_1,s32 delta){
  //3 values in the party struct. seem useless.
  short sVar1;
  int iVar2;
  
  iVar2 = delta * (uint)TerrainPointer->daySpeed;
  switch((gGlobals.playerCharStruct.playerDat)->ani_type){
    case 3:
    param_1->TimeRunning = (param_1->TimeRunning + iVar2) % MINUTES(5);
    return;
    case 2:
    param_1->timeWalking = (param_1->timeWalking + iVar2) % 108000;
    return;
    case 0x19:
    param_1->timeSneaking = (param_1->timeSneaking + iVar2) % MINUTES(10);
    return;
  }
}

u32 check_party_skill(Party *param_1,u8 param_2){
  u32 uVar2;
  //used for dialouge functions.
  switch(param_2) {
  case SKILL_Alchemist:
    uVar2 = AlchemistCheck(param_1);
    break;
  case SKILL_Diplomat:
    uVar2 = 2;
    if (2 < DiplomatCheck(param_1)) uVar2 = DiplomatCheck(param_1);
    break;  //why the doublecheck?
  case SKILL_Healer:
    uVar2 = HealerCheck(param_1);
    break;
  case SKILL_Loremaster:
    uVar2 = LoremasterCheck(param_1);
    break;
  case SKILL_Mechanic:
    uVar2 = MechanicCheck(param_1);
    break;
  case SKILL_Merchant:
    uVar2 = MerchantCheck(param_1);
    break;
  case SKILL_Ranger:
    uVar2 = RangerCheck(param_1);
    break;
  case SKILL_Stealth:
    uVar2 = StealthCheck();
    break;
  case SKILL_Theif:
    uVar2 = ThiefCheck(param_1);
    break;
  case Troubadour:
    uVar2 = TroubadourCheck(param_1);
    break;
  case SKILL_Warrior:
    uVar2 = WarriorCheck(param_1);
    break;
  case SKILL_Wizard:
    uVar2 = WizardCheck(param_1);
    break;
  default:
    uVar2 = 0;
  }
  return uVar2;
}

u32 Party::BestStat(Party *param_1,u8 param_2){
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

u32 Party::WorstStat(Party *param_1,u8 param_2){
  s32 worst = CharStats::getModdedStat(param_1->Members[0]->Stats,param_2);
  for(u8 uVar3 = 1;uVar3 < 4;uVar3++) {
    CharSheet* piVar4 = param_1->Members[uVar3]);
    if ((piVar4) && (worst > CharStats::getModdedStat(piVar4->Stats,param_2))
      worst = CharStats::getModdedStat(piVar4->Stats,param_2);
  } while (uVar3 < 4);
  return worst;
}

u32 Party::GetMemberStat(Party *param_1,ItemID param_2,u8 param_3){
  u32 i = 0;
  CharSheet *psVar1;
  
  while ((psVar1 = param_1->Members[i], psVar1 == NULL ||(psVar1->ID != param_2))) {
    i++;
    if (3 < i) {return 0;}
  }
  return CharStats::getModdedStat(psVar1->Stats,param_3);
}

u32 Party::AlchemistCheck(Party *param_1){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  
  cVar4 = GetMostSkilledMember(param_1,SKILL_Alchemist);
  if (cVar4 == -1) return 0;
  else {
    pCVar1 = param_1->Members[cVar4];
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    cVar4 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Alchemist);
    return some_skillcheck_calc((s32)((RollD(1,100) - (iVar2 * 3 + cVar4 * 6)) * 0x10000) >> 0x10);
  }
}

u32 Party::HealerCheck(Party *param_1){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  
  cVar4 = GetMostSkilledMember(param_1,SKILL_Healer);
  if (cVar4 == -1)  return 0;
  else {
    pCVar1 = param_1->Members[cVar4];
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    cVar4 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Healer);
    return some_skillcheck_calc((RollD(1,100) - (iVar2 * 3 + cVar4 * 10));
  }
}
//dialouge Mechanic Skill Check
u32 Party::MechanicCheck(Party *param_1){
  
  s8 cVar4 = GetMostSkilledMember(param_1,SKILL_Mechanic);
  if (cVar4 == -1) return 0;
  else {
    CharSheet* pCVar1 = param_1->Members[cVar4];
    s8 iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    s8 iVar3 = CharStats::getModdedStat(pCVar1->Stats,STAT_DEX);
    s8 cVar4 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Mechanic);
    return some_skillcheck_calc(((RollD(1,100) - (cVar4 * 5 + iVar2 + iVar3 & 0x7fffU) * -2));
  }
}

//dialouge Merchant Skill Check
u32 Party::MerchantCheck(Party *param_1){
  s32 iVar1;
  char cVar4;
  u8 uVar3;
  CharSheet *pCVar1;
  
  uVar3 = 0;
  iVar1 = 0;
  for(u8 uVar5 = 0;uVar5<4;uVar5++) {
    pCVar1 = param_1->Members[uVar5]);
    if ((pCVar1) && uVar3 < CharStats::getModdedStat(pCVar1->Stats,STAT_INT)))
      uVar3 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
  }
  cVar4 = GetMostSkilledMember(param_1,SKILL_Merchant);
  uVar5 = 0;
  if (cVar4 != -1)
    uVar5 = CharSkills::getModdedSkill(param_1->Members[cVar4]->Skills,SKILL_Merchant);
  return some_skillcheck_calc(((RollD(1,100) - (uVar3 * 3 + uVar5 * 10)));
}

//dialouge Ranger Skill Check
uint Party::RangerCheck(Party *param_1){
  s8 sVar2;
  ushort r;
  
  sVar2 = GetMostSkilledMember(param_1,SKILL_Ranger);
  r = 0;
  if (sVar2 != -1)
    r = CharSkills::getModdedSkill(param_1->Members[sVar2]->Skills,SKILL_Ranger);
  return  some_skillcheck_calc(RollD(1,100) - (r * 10 + 0x50));
}


//dialouge stealth checks =0
u32 Party::StealthCheck(void){return 0;}

//dialouge Theif Skill Check
u32 Party::ThiefCheck(Party *param_1){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  u32 uVar3;
  
  cVar4 = GetMostSkilledMember(param_1,SKILL_Theif);
  if (cVar4 == -1) return 0;
  else {
    pCVar1 = param_1->Members[cVar4];
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    cVar4 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Theif);
    return some_skillcheck_calc(RollD(1,100) - (iVar2 * 4 + cVar4 * 10));
  }
}

u32 Party::WarriorCheck(Party *param_1){
  CharSheet *pCVar1;
  char cVar5;
  s32 iVar2;
  s32 iVar3;
  
  cVar5 = GetMostSkilledMember(param_1,SKILL_Warrior);
  if (cVar5 == -1) return 0;
    pCVar1 = param_1->Members[cVar5];
    iVar2 = CharStats::getModdedStat(pCVar1->Stats,STAT_INT);
    cVar5 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Warrior);
    iVar3 = CharStats::getModdedStat(pCVar1->Stats,STAT_STAM);
    return some_skillcheck_calc((s32)((RollD(1,100) - (iVar2 + cVar5 * 7 + iVar3)) * 0x10000) >> 0x10);
}

u32 Party::WizardCheck(Party *param_1){
  CharSheet *pCVar1;
  char cVar4;
  
  cVar4 = GetMostSkilledMember(param_1,SKILL_Wizard);
  if (cVar4 == -1) return 0;
  iVar2 = CharStats::getModded(pCVar1->Stats,STAT_INT);
  s8 wiz = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Wizard);
  u16 uVar4 = RollD(1,100);
  return some_skillcheck_calc((s16)(uVar4 + (wiz * 5 + iVar2 & 0x7fffU) * -2));
}

u8 Party::SetWandererVal(Party *param_1,u8 param_2){
  
  u8 uVar5 = 0;
  s8 cVar2 = GetMostSkilledMember(param_1,SKILL_Ranger);
  if (cVar2 == -1) {
    cVar2 = GetMostSkilledMember(param_1,SKILL_Warrior);
    if (cVar2 != -1) {
      uVar5 = GetMemberWarriorIntStam(param_1,cVar2);
      goto LAB_80082bf0;
    }
    if (param_1->Members[0] == NULL) goto LAB_80082bf0;
    cVar2 = 0;
  }
  u8 uVar5 = GetMemberRangerIntStam(param_1,cVar2);
LAB_80082bf0:
  float fVar6 = (rand_range(0,10)&1) ? 1.0 : -1.0f;
  float afStack88[] = {1.0,0.5,.25,0.0};
  if (3 < uVar5) uVar5 = 3;
  fVar6 *= afStack88[uVar5] * (float)(param_2);
  u8 uVar1 = param_2 + fVar6;
  if (uVar1 == 0) uVar1 = 1;
  if (0xc < uVar1) uVar1 = 0xc;
  return uVar1;
}

u8 Party::CraftArmor(Party *param_1,char param_2,s16 param_3,ItemID material,u8 stam){
  WidgetTrainShop *pWVar1;
  inv_funcs *piVar2;
  WidgetMethods *pWVar3;
  ulonglong uVar4;
  s32 uVar5;
  bool bVar6;
  
  pWVar1 = (((gGlobals.BigAssMenu)->base).substruct)->dollmenu->field4_0x88->field7_0x94;
  uVar4 = getMechanic_Int_Dex(param_1,param_2);
  uVar5 = param_1->Inventory->GetItemIndex(material);
  if (uVar5 == -1) bVar6 = false;
  else {
    param_1->Inventory->TakeItem(material,1);
    FUN_8003d064(pWVar1,material,1,0xff);
    bVar6 = stam <= uVar4;
    if (bVar6) {
      param_1->Inventory->AddItem(param_3,1);
      SMI::AddItem(pWVar1,param_3,1,0xff,FILENAME,0x1136);
    }
    FUN_8003d640(pWVar1);
    pWVar3->Tick();
    FUN_8002ff30(pWVar1->scrollMenu);
  }
  return bVar6;
}


u8 Party::UnequipMemberItemOfID(Party *param_1,s32 param_2,ItemID param_3){
  CharSheet *pCVar1;
  GearInstance **pptVar5;
  u8 i;
  
  pCVar1 = param_1->Members[param_2];
  if (pCVar1) {
    if (pCVar1->weapons){
      if (pCVar1->weapons->id == param_3) {
        Entity::UnequipWeapons(pCVar1);
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
          Entity::UnequipGear(pCVar1,i);
          return true;
        }
      }
    }
  }
  return false;

u8 dialoug_look_for_item(Party *param_1,ItemID param_2){
  bool bVar2;
  uint uVar3;
  

  if (param_1->Inventory->HasItem)param_2)) {
    param_1->Inventory->TakeItem(param_2,1);
LAB_80082f80:
    bVar2 = true;
  }
  else {
    uVar3 = 0;
    do {
      bVar2 = Party::UnequipMemberItemOfID(param_1,uVar3,param_2);
      uVar3 += 1;
      if (bVar2) goto LAB_80082f80;
    } while (uVar3 < 4);
    bVar2 = false;
  }
  return bVar2;
}

//unknown, unused.
u8 FUN_80082fcc(u16 *param_1,u16 param_2){
  if (param_1) return *param_1 == param_2;
  return false;
}

u8 Party::HasItemEquipped(Party *param_1,s32 param_2,ItemID param_3){
  Temp_weapon *pTVar1;
  u8 bVar2;
  
  if (param_1->Members[param_2] == NULL) {bVar2 = false;}
  else {
    pTVar1 = Has_Item_equipped_character(param_1->Members[param_2],param_3);
    bVar2 = pTVar1 != NULL;
  }
  return bVar2;
}

u8 Party::hasItem(Party *param_1,ItemID param_2){
  u8 bVar2;
  u8 lVar1;
  u32 uVar3;
  
  bVar2 = param_1->Inventory->HasItem(param_2);
  uVar3 = 0;
  if (bVar2 == false) {
    do {
      lVar1 = HasItemEquipped(param_1,uVar3,param_2);
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


u8 FUN_800830a4(Party *param_1,byte param_2,GearInstance *param_3,CharSheet *param_4,byte param_5)

{
  ItemID IVar1;
  SpellCharges *pSVar2;
  inv_funcs *piVar3;
  int iVar4;
  byte bVar6;
  byte (*X) [2];
  ulong uVar5;
  uint uVar7;
  GearInstance **ppGVar8;
  uint uVar9;
  uint uVar10;
  
  IVar1 = (param_3->base).id;
  iVar4 = Entity::GearMinStatCheck(param_4,IVar1);
  bVar6 = FUN_8007e798(param_1,(byte)iVar4);
  if (bVar6 != 0) {
    return bVar6;
  }
  uVar10 = 0;
  uVar9 = 0;
  uVar7 = (uint)param_4->pItemList->usedItems;
  if (uVar7 != 0) {
    ppGVar8 = param_4->pItemList->pItem;
    do {
      if ((*ppGVar8 != NULL) && ((ushort)((*ppGVar8)->base).id >> 8 == (ushort)IVar1 >> 8)) {
        uVar9 += 1;
      }
      uVar10 += 1;
      ppGVar8 = ppGVar8 + 1;
    } while (uVar10 < uVar7);
  }
  if (uVar9 < param_5) {
    X = CreateStatMod((byte (*) [2])(param_3->base).statMod);
    pSVar2 = (param_3->base).spellCharge;
    bVar6 = 0xff;
    if (pSVar2 != NULL) {
      bVar6 = pSVar2->Charges;
    }
    piVar3 = param_1->Inventory->Functions;
    uVar5 = (*(piVar3->TakeItem).func)
                      ((int)param_1->Inventory->inv_slots + *(short *)&(piVar3->TakeItem).arg + -4,
                       (ulonglong)(ushort)IVar1,1);
    if (uVar5 != 0) {
      FUN_8007f10c(param_1,param_4,IVar1,X,bVar6);
      return false;
    }
    if (X != NULL) {
      HeapFree(X,s_../gameclasses/party.cpp_800e0b20,0x15a4);
      return true;
    }
  }
  return true;
}