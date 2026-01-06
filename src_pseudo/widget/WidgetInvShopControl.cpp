#include "globals.h"
#include "weapondb.h"
#include "combat/CombatStruct.h"
#include "widgets/ItemDetails.h"
#include "widgets/textPopup.h"

#define FILENAME "./menus/submenuinventorycontroller.cpp"


BaseWidget * WidgetInvShop::AFunc() {
  ItemID IVar1;
  BaseWidget *pBVar2;
  CharSheet *pCVar3;
  CharSheet *pCVar4;
  pause_Substruct *ppVar8;
  BaseWidget *uVar8;
  BaseWidget* uVar9;
  ItemID *pIVar10;
  bool bVar12;
  short sVar11;
  byte bVar13;
  u16 line;
  ushort uVar15;
  ItemID aIStack_a8 [4];
  
  uVar8 = this->scrollMenu->AFunc();
  if (uVar8 == NULL) return NULL;
  if (UINT_800ed580) return NULL;
  UINT_800ed580 = 1;
  uVar9 = uVar8->AFunc();
  pCVar3 = (gGlobals.party)->Members[this->partyPicker];
  if (gGlobals.SomeCase == 3) {
    uVar15 = (ushort)gCombatP->current_Ent->index;
    if (uVar9 == 0) {
      if (gPartyPicker != uVar15) {
        ErrPopup(gGlobals.CommonStrings[0x1e9]);
        return NULL;
      }
    }
    else if (uVar9->varU16 != uVar15) {
      ErrPopup(gGlobals.CommonStrings[0x1ea]);
      return NULL;
    }
  }
  pIVar10 = (ItemID *)uVar8->ZFunc();
  IVar1 = (ItemID)uVar8->varU16;
  if (uVar9 != 0) {
    uVar15 = (ushort)*pIVar10 >> 8;
    if (uVar15 == 7) {
      pCVar4 = (gGlobals.party)->Members[uVar9->varU16];
      if ((pCVar4) && (IDEntInd(Niesen) == pCVar4->ID)) {
        Gsprintf(gGlobals.CommonStrings[0x22a],(char *)&gWeaponsDB->weapons[0x42].name,pCVar4->name);
        ErrPopup(gGlobals.text);
        return NULL;
      }
      if (PARTY->RemoveWeaponsFrom(uVar9->varU8)) {
        goto LAB_8003de94;
      }
      line = 0x7b;
    }
    else if (uVar15 == DB_ARMOR) {
      if (PARTY->RemoveArmorFrom(uVar9->varU8)) {
        goto LAB_8003de94;
      }
      line = 0x85;
    }
    else if (uVar15 == DB_SHIELD) {
      if (PARTY->RemoveShieldFrom(uVar9->varU8)) {
        goto LAB_8003de94;
      }
      line = 0x8f;
    }
    else {
      sVar11 = PARTY->Members[uVar9->varU16]->pItemList->GetSlotByID(IVar1);
      if (PARTY->RemoveGearFrom(uVar9->varU8,sVar11)) {
        goto LAB_8003de94;
      }
      line = 0x9f;
    }
    this->AddItem((u16)IVar1,1,0xff,FILENAME,line);
    this->TakeItem(1);
    SortB();
    goto LAB_8003de94;
  }
  bVar13 = this->inventory->GetItemIndex(IVar1);
  if (pIVar10 == NULL) {
LAB_8003dd40:
    aIStack_a8[0]=0;
    WSMSub* pvVar6 = (WSMSub *)this->scrollMenu->substruct;
    bVar13 = PARTY->GetEquipError(this->partyPicker,bVar13,aIStack_a8);
    if (bVar13 != 0) {
      ErrPopup(equip_error_labels[bVar13]);
      return NULL;
    }
    uVar15 = ((WSMSub *)this->scrollMenu->substruct)->highlight;
    this->TakeItem(1);
    if (aIStack_a8[0] != (ItemID)0x0) {
      this->AddItem((u16)aIStack_a8[0],1,0xff,FILENAME,0xe9);
      this->SetHighlight(aIStack_a8[0],1,this->partyPicker);
    }
    this->AddItem((u16)IVar1,1,this->partyPicker,FILENAME,0xf0);
    SortB();
    if ((int)(uint)uVar15 < (int)(pvVar6->numChoices - 1)) {
      BaseWidget*iVar7 = pvVar6->items[pvVar6->highlight];
      if (!iVar7) pvVar6->highlight = uVar15;
      else {
        if (iVar7->varU16 == IVar1) {
          uVar15++;
          goto LAB_8003de8c;
        }
        pvVar6->highlight = uVar15;
      }
    }
    else {
LAB_8003de8c:
      pvVar6->highlight = uVar15;
    }
  }
  else {
    if ((ushort)*pIVar10 >> 8 != 0x10) {
      if (((ushort)*pIVar10 >> 8 == 0x11) && (gGlobals.combatBytes[0] != 0xe)) {
        bVar13 = PARTY->GetEquipError(this->partyPicker,bVar13,NULL);
        if (bVar13 != 0) {
          goto LAB_8003de94;
        }
        goto LAB_8003dd28;
      }
      goto LAB_8003dd40;
    }
    if (gGlobals.combatBytes[0] != 0xe) {
      if (!Entity::UsePotion(pCVar3,bVar13,*pIVar10,gGlobals.text)) {
        ErrPopup(gGlobals.text);
        return NULL;
      }
LAB_8003dd28:
      this->TakeItem(1);
      goto LAB_8003de94;
    }
    if (3 < GETINDEX(*pIVar10)) {
      TextPopup_New(gGlobals.CommonStrings[0x1e8],200,0x40,0xff,0xff,0xff,0xff,0x96,1);
      return NULL;
    }
    bVar13 = this->partyPicker;
    bVar12= PARTY->CombatItemCheck1(PARTY->Members[bVar13],bVar13,*pIVar10);
    if (bVar12) {
      ErrPopup(equip_error_labels[bVar12]);
      return NULL;
    }
  }
LAB_8003de94:
  this->Tick();
  this->scrollMenu->Update();
  this->dollMenu->GetSlotIcons(pCVar3);
  ppVar8 = PauseSub;
  ppVar8->dollmenu->charStats_widget->Update(pCVar3);
  ppVar8->dollmenu->lists->UpdateMenus(this->partyPicker);
  return NULL;
}

BaseWidget * WidgetInvShop::CDownFunc() {
  BaseWidget *pBVar1;
  ItemInstance *pIVar2;
  bool bVar4;
  uint uVar5;
  WidgetItemDetail* pwVar3;
  WeaponInstance WStack_d0;
  ArmorInstance AStack_90;
  WeaponInstance WStack_50;
  WSMSub *pvVar1;
  
  pvVar1 = (WSMSub *)this->scrollMenu->substruct;
  pBVar1 = pvVar1->items[pvVar1->highlight];
  if (((pBVar1 != NULL) &&
      (pIVar2 = (ItemInstance *)pBVar1->ZFunc(),
      (ushort)pIVar2->id >> 8 != 0x12)) && (bVar4 = ItemIsMap(pIVar2->id), !bVar4)) {
    uVar5 = (uint)((ushort)pIVar2->id >> 8);
    if (uVar5 == 7) {
      createTempWeapon(&WStack_d0,pIVar2->id);
      if (WStack_d0.base.statMod != NULL) {
        HFREE(WStack_d0.base.statMod,0x134);
        WStack_d0.base.statMod = pIVar2->statMod;
      }
      if (WStack_d0.base.spellCharge != NULL) {
        (WStack_d0.base.spellCharge)->Charges = pIVar2->spellCharge->Charges;
      }
      pwVar3 = new WidgetItemDetail(&WStack_d0);
      WStack_d0.base.statMod = NULL;
      passto_clear_weapon_effects(&WStack_d0);
    }
    else if (uVar5 - 5 < 2) {
      make_temp_armor_3(&AStack_90,pIVar2->id);
      if (AStack_90.base.statMod != NULL) {
        HFREE(AStack_90.base.statMod,0x149);
      }
      AStack_90.base.statMod = pIVar2->statMod;
      if (AStack_90.base.spellCharge != NULL) {
        (AStack_90.base.spellCharge)->Charges = pIVar2->spellCharge->Charges;
      }
      pwVar3 = new WidgetItemDetail(&AStack_90);
      AStack_90.base.statMod = NULL;
      ArmorInstance_ClearEffect(&AStack_90);
    }
    else if (((uVar5 - 0x10 < 2) || (uVar5 == 1)) || (uVar5 == 0x12)) {
      pwVar3 = new WidgetItemDetail(pIVar2);
    }
    else {
      make_temp_item((GearInstance *)&WStack_50,pIVar2->id);
      if (WStack_50.base.statMod != NULL) {
        HFREE(WStack_50.base.statMod,0x167);
        WStack_50.base.statMod = pIVar2->statMod;
      }
      if (WStack_50.base.spellCharge != NULL) {
        (WStack_50.base.spellCharge)->Charges = pIVar2->spellCharge->Charges;
      }
      pwVar3 = new WidgetItemDetail((GearInstance *)&WStack_50);
      WStack_50.base.statMod = NULL;
      clear_weapon_effects(&WStack_50);
    }
    if (pwVar3) WHANDLE->AddWidget(pwVar3);
  }
  return NULL;
}



