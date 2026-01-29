#include "globals.h"
#include "weapondb.h"
#include "combat/CombatStruct.h"
#include "widgets/ItemDetails.h"
#include "widgets/textPopup.h"

#define FILENAME "./menus/submenuinventorycontroller.cpp"


BaseWidget * WidgetInvShop::AFunc() {
  ItemID IVar1;
  byte bVar13;
  u16 line;
  u16 uVar15;
  ItemID aIStack_a8 [4];
  
  BaseWidget *uVar8 = this->scrollMenu->AFunc();
  if (uVar8 == NULL) return NULL;
  if (UINT_800ed580) return NULL;
  UINT_800ed580 = true;
  BaseWidget* uVar9 = uVar8->AFunc();
  CharSheet *pCVar3 = (gGlobals.party)->Members[this->partyPicker];
  if (CombatPauseState) {
    uVar15 = (ushort)gCombatP->current_Ent->index;
    if (uVar9 == 0) {
      if (gPartyPicker != uVar15) {
        ErrPopup(Cstring(CombatEquipPrompt));
        return NULL;
      }
    }
    else if (uVar9->varU16 != uVar15) {
      ErrPopup(Cstring(CombatUnequipPrompt));
      return NULL;
    }
  }
  ItemID *pIVar10 = (ItemID *)uVar8->ZFunc();
  IVar1 = (ItemID)uVar8->varU16;
  if (uVar9) {
    uVar15 = ITEMIDTYPE(*pIVar10);
    if (uVar15 == DB_WEAPON) {
      CharSheet *pCVar4 = (gGlobals.party)->Members[uVar9->varU16];
      if ((pCVar4) && (IDEntInd(Niesen) == pCVar4->ID)) {
        Gsprintf(Cstring(XPowerfulMagic),&gWeaponsDB->weapons[WeaponInd_ArchmageStaff].name,pCVar4->name);
        ErrPopup(gGlobals.text);
        return NULL;
      }
      if (PARTY->RemoveWeaponsFrom(uVar9->varU16)) {
        goto LAB_8003de94;
      }
      line = 0x7b;
    }
    else if (uVar15 == DB_ARMOR) {
      if (PARTY->RemoveArmorFrom(uVar9->varU16)) {
        goto LAB_8003de94;
      }
      line = 0x85;
    }
    else if (uVar15 == DB_SHIELD) {
      if (PARTY->RemoveShieldFrom(uVar9->varU16)) {
        goto LAB_8003de94;
      }
      line = 0x8f;
    }
    else {
      if (PARTY->RemoveGearFrom(uVar9->varU8,PARTY->Members[uVar9->varU16]->pItemList->GetSlotByID(IVar1))) {
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
    if (bVar13) {
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
    if (ITEMIDTYPE(*pIVar10) != DB_POTION) {
      if ((ITEMIDTYPE(*pIVar10) == DB_SCROLL) && (gGlobals.combatBytes[0] != CombatState_14)) {
        bVar13 = PARTY->GetEquipError(this->partyPicker,bVar13,NULL);
        if (bVar13 != 0) {
          goto LAB_8003de94;
        }
        goto LAB_8003dd28;
      }
      goto LAB_8003dd40;
    }
    if (gGlobals.combatBytes[0] != CombatState_14) {
      if (!Entity::UsePotion(pCVar3,bVar13,*pIVar10,gGlobals.text)) {
        ErrPopup(gGlobals.text);
        return NULL;
      }
LAB_8003dd28:
      this->TakeItem(1);
      goto LAB_8003de94;
    }
    if (3 < GETINDEX(*pIVar10)) {
      TextPopup_New(Cstring(CombatPotionPrompt),200,0x40,0xff,0xff,0xff,0xff,0x96,1);
      return NULL;
    }
    bVar13 = this->partyPicker;
    u8 bVar12= PARTY->CombatItemCheck1(PARTY->Members[bVar13],bVar13,*pIVar10);
    if (bVar12) {
      ErrPopup(equip_error_labels[bVar12]);
      return NULL;
    }
  }
LAB_8003de94:
  this->Tick();
  this->scrollMenu->Update();
  this->dollMenu->GetSlotIcons(pCVar3);
  pause_Substruct *pSub = PauseSub;
  pSub->dollmenu->charStats_widget->Update(pCVar3);
  pSub->dollmenu->lists->UpdateMenus(this->partyPicker);
  return NULL;
}

BaseWidget * WidgetInvShop::CDownFunc() {
  ItemInstance *pIVar2;
  WidgetItemDetail* pwVar3;
  WeaponInstance wep;
  ArmorInstance arm;
  GearInstance gear;
  
  WSMSub *pvVar1 = (WSMSub *)this->scrollMenu->substruct;
  BaseWidget *pBVar1 = pvVar1->items[pvVar1->highlight];
  if (((pBVar1) &&
      (pIVar2 = (ItemInstance *)pBVar1->ZFunc(),
      ITEMIDTYPE(pIVar2->id) != DB_KEYITEM)) && (!ItemIsMap(pIVar2->id))) {
    u32 itemType = ITEMIDTYPE(pIVar2->id);
    if (itemType == DB_WEAPON) {
      createTempWeapon(&wep,pIVar2->id);
      if (wep.base.statMod) {
        HFREE(wep.base.statMod,0x134);
        wep.base.statMod = pIVar2->statMod;
      }
      if (wep.base.spellCharge) {
        (wep.base.spellCharge)->Charges = pIVar2->spellCharge->Charges;
      }
      pwVar3 = new WidgetItemDetail(&wep);
      wep.base.statMod = NULL;
      passto_clear_weapon_effects(&wep);
    }
    else if (itemType - 5 < 2) {
      make_temp_armor_3(&arm,pIVar2->id);
      if (arm.base.statMod) HFREE(arm.base.statMod,0x149);
      arm.base.statMod = pIVar2->statMod;
      if (arm.base.spellCharge) {
        (arm.base.spellCharge)->Charges = pIVar2->spellCharge->Charges;
      }
      pwVar3 = new WidgetItemDetail(&arm);
      arm.base.statMod = NULL;
      ArmorInstance_ClearEffect(&arm);
    }
    else if (((itemType - 0x10 < 2) || (itemType == DB_MISC)) || (itemType == DB_KEYITEM)) {
      pwVar3 = new WidgetItemDetail(pIVar2);
    }
    else {
      make_temp_item(&gear,pIVar2->id);
      if (gear.base.statMod != NULL) {
        HFREE(gear.base.statMod,0x167);
        gear.base.statMod = pIVar2->statMod;
      }
      if (gear.base.spellCharge != NULL) {
        (gear.base.spellCharge)->Charges = pIVar2->spellCharge->Charges;
      }
      pwVar3 = new WidgetItemDetail(&gear);
      gear.base.statMod = NULL;
      clear_weapon_effects((WeaponInstance*)&gear);
    }
    if (pwVar3) WHANDLE->AddWidget(pwVar3);
  }
  return NULL;
}



