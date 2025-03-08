#define FILENAME "../gameclasses/party.cpp"

#include "globals.h"
#include "stringN64.h"
#include "heapN64.h"
#include "SaveEntity.h"
#include "combat/CombatStruct.h"

void Party::Init(){
  CLEAR(this);
  this->Inventory = new PartyInventory();
}

void Party::Free(){
  if (this->Inventory) this->Inventory->~PartyInventory();
  for(u32 i=0;i<3;i++) {
    if (this->Members[i]) {
      Entity::Free(this->Members[i]);
      FREE(this->Members[i],232);
      }
  }
}
void Party::CheckFlags(ItemID param_2,u8 alive,u8 state){
  u16 i;
  
  u8 index = GetIDIndex(param_2);
  if (alive) {
    //TODO: replace with #define's and enums
    u16 party_eventflag_dict1[][3]={ //ID index, alive, left party
      {0x97,0x1c7,0x1C8},{0x98,0x59,0x2AD},{0x9A,0xF7,0x2B1},{0x9B,0x17C,0x2B2},
      {0x9C,0x177,0x2B9},{0x9D,0x5C,0},{0x9E,0x17E,0x2B3},{0x9F,0x23E,0x2B7},
      {0xA0,0x5A,0x2AE},{0xA1,0x109,0x2B0},{0xA2,0x19C,0x2B4},{0xA3,0x5B,0x2AF},
      {0xA4,0x20B,0x2BC},{-1,0,0}};
    if (party_eventflag_dict1[0][0] != -1) {
      for(i=0;party_eventflag_dict1[i][0]!=-1;i++) {
        if (party_eventflag_dict1[i][0] == index) {
          setEventFlag(party_eventflag_dict1[i][1],state);
          setEventFlag(party_eventflag_dict1[i][2],!state);
          return;
        }
      }
    }
  }
  else {
    u16 party_eventflag_dict2[]={ //ID index, Dead flag
      0x97,0x1C2, 0x98,0x267, 0x9A,0x266, 0x9B,0x26F, 0x9C,0x26A,
      0x9D,0x265, 0x9E,0x26C, 0x9F,0x246, 0xA0,0x268, 0xA1,0x26B,
      0xA2,0x1C0, 0xA3,0x269, 0xA4,0x26E, -1,-1
      };
    for (i = 0; party_eventflag_dict2[i] != -1;i+=2) {
      if (index == party_eventflag_dict2[i]) {
        setEventFlag(party_eventflag_dict2[i + 1],state);
        return;
      }
    }
  }
}

void Party::CheckDeaths(){
  for(u32 i=0;i<MAXPARTY;i++) {
    if (this->Members[i])
      CheckFlags(this->Members[i]->ID,false,Entity::isDead(this->Members[i]));
  }
}

u8 Party::AddMember(ItemID param_2){
  uint uVar1;
  CharSheet *pCVar2;
  
  if (this->PartySize == MAXPARTY) return false;
  else {
    u8 uVar4 = 0;
    if (this->Members[0]) {
      for(uVar4=1;(uVar4<MAXPARTY&&this->Members[uVar4]);uVar4++) {}
    }
    ALLOCL(this->Members[uVar4],343);
    Entity::Init(pCVar2,param_2,0);
    this->PartySize++;
    CheckFlags(param_2,true,true);
    SaveEntity::CopyMember(this->Members[uVar4]);
    return true;
  }
}


u8 Party::isMemberUnequipped(u8 slot){
  Entity_Ram *pEVar1;
  byte bVar3;
  WeaponInstance *pWVar2;
  u8 ret;
  CharSheet *chara;
  
  chara = this->Members[slot];
  u8 index = GetIDIndex(chara->ID);
  pEVar1 = gEntityDB->entities;
  if ((*chara->armor != NULL) || (ret = false, gEntityDB->entities[index].Armor == Item_NONE)) {
    if (chara->armor[1] == NULL) {
      if (pEVar1[index].Sheild != Item_NONE) {
        return false;
      }
    }
    ret = true;
    if (chara->weapons == NULL) {
      ret = false;
      if (((pEVar1[index].weapon[0] == Item_NONE) &&
          (ret = false, pEVar1[index].weapon[1] == Item_NONE)) &&
         (ret = false, pEVar1[index].weapon[2] == Item_NONE)) {
        ret = true;
      }
    }
  }
  return ret;
}

CharSheet* Party::GetMemberById(ItemID id){
  u8 temp;
  return GetMemberById2(id,&temp);}

CharSheet* Party::GetMemberById2(ItemID id,u8 *oIndex){
  *oIndex = GetMemberIndex(id);
  if (*oIndex == -1) return NULL;
  else return this->Members[*oIndex];
}

//move chaaracter to empty space? unused.
void Party::MoveCharSheet(){
  s32 iVar1;
  CharSheet *piVar2;
  u32 uVar2;
  u32 uVar3;
  
  iVar1 = 0;
  uVar2 = 0;
  do {
    piVar2 = (CharSheet *)((s32)this->Members + iVar1);
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
      *(s32 *)((s32)this->Members + iVar1) = 0;
    }
    iVar1 = uVar3 * 4;
    uVar2 = uVar3;
  } while (uVar3 < 3);
  return;
}

s8 Party::GetMemberIndex(ItemID id){
  for(u8 i=0;i<MAXPARTY;i++){
    if((this->Members[i])&&this->Members[i]->ID==id) return i;
  }
  return -1;
}

void Party::removeAliveMemberByID(ItemID id){
  s8 slot = GetMemberIndex(id);
  if (slot != -1) RemoveAliveMember(slot);
}


void Party::RemoveAliveMember(s8 slot){
  StripMember(slot,1);
  SaveEntity::BenchParty(this);
  if (this->Members[slot]) {
    CheckFlags(this->Members[slot]->ID,true,false);
    RemoveMember(slot,0);
    ScoochMembers();
  }
}

void Party::RemoveAllMembers(){
  for(u32 i = 0;i < MAXPARTY;i++) RemoveMember(i,0);
}

u8 Party::IsCharacterInParty(ItemID param_2){
  s32 i=0;
  u32 uVar2;
  CharSheet *psVar1;

  while ((psVar1 = this->Members[i], psVar1 == NULL ||
         (psVar1->ID != param_2))) {
    i++;
    if (3 < i) return false;
  }
  return true;
}

void Party::BringOutYourDead(){
  CheckDeaths();
  for(u32 i=0;i<MAXPARTY;i++) {
    if ((this->Members[i]) && (Entity::isDead(this->Members[i]))) {
      SaveEntity::EraseEntityOfID(this->Members[i]->ID);
      RemoveMember((byte)i,1);
    }
  }
  ScoochMembers();
}

void Party::ScoochMembers(){
  s32 iVar1;
  CharSheet *ppCVar2;
  CharSheet **ppCVar3;
  u32 uVar2;
  u32 uVar3;
  
  iVar1 = 0;
  uVar2 = 0;
  do {
    ppCVar2 = (CharSheet *)((s32)this->Members + iVar1);
    uVar3 = uVar2 + 1;
    if ((*(s32 *)ppCVar2 == 0) && (uVar3 < 4)) {
      ppCVar3 = this->Members + uVar2 + 1;
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

void Party::StripMember(u8 param_2,u8 param_3){
    if (this->Members[param_2]) {
    for(u32 i = 0;i < GEARTOTAL;i++) {
      RemoveGearFrom(param_2,i); 
    }
    if (param_3) {
      RemoveWeaponsFrom(param_2);
      RemoveArmorFrom(param_2);
      RemoveShieldFrom(param_2);
    }
  }
}

void Party::RemoveMember(u8 param_2,u8 param_3){
  if (this->Members[param_2]) {
    StripMember(param_2,param_3);
    Entity::Free(this->Members[param_2]);
    FREE(this->Members[param_2],261);
    this->PartySize--;
  }
}

u8 Party::HasEntity(CharSheet *param_2){
  if (!param_2) return false;
  for(u32 i=0;i<MAXPARTY;i++) {
    if (param_2 == this->Members[i]) return true;
  }
  return true;
}

u32 Party::GetAvgLevel(){
  u32 uVar3;
  u32 uVar4;
  CharSheet *iVar1;
  
  uVar4 = 0;
  if (this->PartySize == 0) uVar4 = 0;
  else {
    
    for(uVar3 = 0;uVar3 < MAXPARTY;uVar3++) {
      iVar1 = this->Members[uVar3];
      if (iVar1) {uVar4+= CharStats::getModded(iVar1->Stats,STAT_LV);}
    }
    uVar4/= this->PartySize;
  }
  return uVar4;
}

void Party::ClearInventory(){
  this->Inventory->Clear();
  this->Inventory->Reset();
}

StatMod * CreateStatMod(StatMod *st){
  StatMod *pSVar1;
  
  if (!st) pSVar1 = NULL;
  else {
    ALLOC(pSVar1,697);
    pSVar1->stat = st->stat;
    pSVar1->mod = st->mod;
  }
  return pSVar1;
}

void FUN_8007e6a4(Party *param_1,ItemID param_2,StatMod *param_3,byte param_4){
  StatMod *X;
  SpellCharges *pSVar2;
  Inventory_item *uVar2;
  
  param_1->Inventory->AddItem(param_2,1);
  s32 uVar3 = param_1->Inventory->GetItemIndex(param_2);
  if (uVar3 == -1) {
    if (param_3) HFREE(param_3,0x2d3);
  }
  else {
    uVar2 = param_1->Inventory->GetItemEntry(uVar3);
    X = (uVar2->base).statMod;
    if (X) HFREE(X,0x2de);
    pSVar2 = (uVar2->base).spellCharge;
    (uVar2->base).statMod = param_3;
    if (pSVar2) pSVar2->Charges = param_4;
  }
}

u8 Party::GetEquipError2(u8 param_2){
  u32 uVar1;
  u8 *pbVar2;
  u8 temparray [9]={1,1,2,6,3,5,0,0,0xff};
  
  pbVar2 = temparray;
  uVar1 = 0;
  while( true ) {
    if (temparray[0] == 0xff) return 1;
    if (*pbVar2 == param_2) break;
    uVar1+=2;
    temparray[0] = temparray[uVar1];
    pbVar2 = temparray + uVar1;
  }
  return temparray[uVar1 + 1];
}

u8 Party::CombatItemCheck1(CharSheet* param_2,u8 param_3,ItemID param_4){

  if (this->Inventory->HasItem(param_4)) {
    s32 uVar2 = this->Inventory->GetItemIndex(param_4);
    u8 bVar4 = GetIDIndex(param_4);
    if ((&gCombatP->combatEnts)[param_3] == NULL) return true;
    //Not Neisen
    if (param_2->ID != (ItemID)(entityList[162] + 0x200)) {
      FUN_8006f8d8((&gCombatP->combatEnts)[param_3],param_4,uVar2);
      //using flask
      if (bVar4 < 4) gGlobals.combatBytes[1] = 0x13;
      return false;
    }
  }
  return true;
}
itemtype_func itemtype_funcs[]={
{5,0xFFFF,itemtype_armor},{6,0xFFFF,itemtype_sheild},{7,0xFFFF,itemtype_weapon},
{9,0xFFFF,itemtype_gear},{10,0xFFFF,itemtype_gear},{11,0xFFFF,itemtype_gear},
{13,0xFFFF,itemtype_gear},{14,0xFFFF,itemtype_gear},{15,0xFFFF,itemtype_gear},
{19,0xFFFF,itemtype_gear},{17,0xFFFF,itemtype_scroll},{12,0xFFFF,itemtype_ring},
{0xFF,0,NULL}
};

u8 Party::GetEquipError(u8 param_2,char param_3,ItemID*oId){
  ItemInstance *puVar4;

  
  CharSheet * pCVar1 = this->Members[param_2];
  if ((pCVar1) &&(puVar4 = &this->Inventory->GetItemEntry(param_3)->base,puVar4)) {
    if ((puVar4->aspect != ASPECT_NONE) &&(puVar4->aspect != CharExp::GetAspect(pCVar1->EXP))) return 2;
    for (u16 uVar6 = 0;itemtype_funcs[uVar6].type != 0xff;uVar6++){
        if (itemtype_funcs[uVar6].type== puVar4->id >> 8) {
          return itemtype_funcs[uVar6].func(this,param_2,puVar4,pCVar1,oId);
        }
      }
    }
  return 1;
}

u8 itemtype_armor(Party* p, u8 param_2,ItemInstance *param_3,CharSheet *param_4,ItemID *param_5){
  ItemID IVar1;
  u8 bVar4;
  ulong uVar3;
  u8 bVar5;
  
  IVar1 = param_3->id;
  bVar4 = Entity::ret0(param_4);
  if (!bVar4) {
    StatMod* X = CreateStatMod(param_3->statMod);
    bVar5 = 0xff;
    if (param_3->spellCharge) bVar5 = param_3->spellCharge->Charges;
    uVar3 = p->Inventory->TakeItem(IVar1,1);
    if (uVar3 == 0) {
      if (X) HFREE(X,0x377);
      bVar4 = 1;
    }
    else {
      if ((param_5 != (ItemID *)0x0) && (*param_4->armor)) {
        *param_5 = (*param_4->armor)->base.id;
      }
      bVar4 = p->RemoveArmorFrom(param_2);
      if (!bVar4) {
        Entity::EquipArmor(param_4,IVar1,X);
        SetMagicCharges(&param_4->armor->base,bVar5);
        bVar4 = 0;
      }
      else {
        FUN_8007e6a4(p,IVar1,X,bVar5);
      }
    }
  }
  return bVar4;
}

u8 itemtype_sheild(Party *p,u8 param_2,ItemInstance *param_3,CharSheet *param_4,
                    ItemID *param_5){
  ItemID IVar1;
  SpellCharges *pSVar2;
  bool bVar5;
  StatMod *X;
  ulong uVar4;
  byte bVar6;
  
  IVar1 = param_3->id;
  bVar5 = Entity::NoSheildSkill(param_4);
  if (!bVar5) {
    X = CreateStatMod(param_3->statMod);
    pSVar2 = param_3->spellCharge;
    bVar6 = 0xff;
    if (pSVar2) bVar6 = pSVar2->Charges;
    uVar4 = p->Inventory->TakeItem(IVar1,1);
    if (uVar4 == 0) {
      if (X != NULL) HFREE(X,0x3b2);
      bVar5 = true;
    }
    else {
      if ((param_5) && (param_4->armor[1])) {
        *param_5 = (param_4->armor[1]->base).id;
      }
      bVar5 = p->RemoveShieldFrom(param_2);
      if (bVar5) {
        FUN_8007e6a4(p,IVar1,X,bVar6);
      }
      else {
        Entity::EquipSheild(param_4,IVar1,X);
        SetMagicCharges(&param_4->armor[1]->base,bVar6);
        bVar5 = false;
      }
    }
  }
  return bVar5;
}


byte itemtype_weapon(Party *p,u8 param_2,ItemInstance *param_3,CharSheet *param_4,ItemID *param_5){
  ItemID IVar1;
  SpellCharges *pSVar2;
  byte bVar5;
  byte bVar6;
  StatMod *X;
  ulong uVar4;
  
  IVar1 = param_3->id;
  bVar5 = Entity::canEquipWeapon(param_4,IVar1);
  if (bVar5 == 0) {
    X = CreateStatMod(param_3->statMod);
    pSVar2 = param_3->spellCharge;
    bVar5 = 0xff;
    if (pSVar2) bVar5 = pSVar2->Charges;
    uVar4 = p->Inventory->TakeItem(IVar1,1);
    if (uVar4 == 0) {
      if (X) HFREE(X,0x3ed);
      bVar6 = 1;
    }
    else {
      if ((param_5 != NULL) && (param_4->weapons != NULL)) {
        *param_5 = (param_4->weapons->base).id;
      }
      bVar6 = p->RemoveWeaponsFrom(param_2);
      if (bVar6) FUN_8007e6a4(p,IVar1,X,bVar5);
      else {
        Entity::EquipWeapon(param_4,IVar1,X);
        SetMagicCharges(&param_4->weapons->base,bVar5);
        bVar6 = 0;
        if (gGlobals.combatBytes[0] == 0xe) {
          FUN_8006a274((&gCombatP->combatEnts)[param_2]);
          bVar6 = 0;
        }
      }
    }
  }
  else bVar6 = FUN_8007e798(p,bVar5);
  return bVar6;
}

u8 itemtype_scroll(Party* p,u8 param_2,ItemInstance *param_3,CharSheet *param_4,ItemID* oID){
  u8 uVar2;
  
  if (gametrek_flag0 == 0) {
    if (item_pointer->Gear[search_item_array(param_3->id)].spell == 0xff) uVar2 = 1;
    else uVar2 = p->GetEquipError3(param_2,param_3,param_4,3);
  }
  else uVar2 = p->UseScroll(param_2,(GearInstance*)param_3,param_4);
  return uVar2;}

u8 itemtype_ring(Party* p,u8 param_2,ItemInstance *param_3,CharSheet *param_4,ItemID* oID){
  return p->GetEquipError3(param_2,param_3,param_4,2);}


byte itemtype_gear(Party *p,byte param_2,ItemInstance *param_3,CharSheet *param_4,ItemID *param_5){
  byte bVar1;
  ItemID IVar2;
  ItemID IVar3;
  SpellCharges *pSVar4;
  CharGear *pCVar6;
  int iVar7;
  byte bVar9;
  StatMod *X;
  ulong uVar8;
  bool bVar10;
  GearInstance **ppGVar11;
  uint uVar12;
  
  IVar2 = param_3->id;
  bVar9 = p->GetEquipError2(Entity::GearMinStatCheck(param_4,IVar2));
  if (bVar9 == 0) {
    X = CreateStatMod(param_3->statMod);
    pSVar4 = param_3->spellCharge;
    bVar9 = 0xff;
    if (pSVar4) bVar9 = pSVar4->Charges;
    if (p->Inventory->TakeItem(IVar2,1) == 0) {
      if (X) HFREE(X,0x457);
      bVar9 = 1;
    }
    else {
      pCVar6 = param_4->pItemList;
      uVar12 = 0;
      if (pCVar6->usedItems != 0) {
        ppGVar11 = pCVar6->pItem;
        do {
          if (ppGVar11[uVar12] == NULL) {
            bVar1 = pCVar6->usedItems;
          }
          else {
            IVar3 = (ppGVar11[uVar12]->base).id;
            if (ITEMIDTYPE(IVar3) == ITEMIDTYPE(IVar2)) {
              if (param_5) *param_5 = IVar3;
              bVar10 = Party::RemoveGearFrom(p,param_2,(byte)uVar12);
              if (bVar10) {
                FUN_8007e6a4(p,IVar2,X,bVar9);
                return bVar10;
              }
              break;
            }
            bVar1 = pCVar6->usedItems;
          }
          uVar12 += 1;
          if (bVar1 <= uVar12) break;
          ppGVar11 = pCVar6->pItem;
        } while( true );
      }
      FUN_8007f10c(p,param_4,IVar2,X,bVar9);
      bVar9 = 0;
    }
  }
  return bVar9;
}

void FUN_8007f10c(Party* p,CharSheet *param_2,ItemID param_3,StatMod* param_4,u8 param_5){  
  Entity::EquipGear(param_2,param_3,param_4);
  CharGear *pCVar1 = param_2->pItemList;
  SetMagicCharges(param_2->pItemList->pItem[CharGear::GetSlotByID(pCVar1,param_3)],param_5);
}

bool Party::UseScroll(u8 param_2,GearInstance *param_3,CharSheet *param_4){
  byte bVar1;
  byte bVar2;
  u8 MVar3;
  u8 MVar4;
  ItemID IVar5;
  Gear_RAM *pGVar6;
  Spell_RAM *pSVar7;
  byte wizLV;
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
  
  wizLV = param_4->Skills->capSkillBaseMax(SKILL_Wizard);
  if (wizLV < 0) {
    pCVar14 = &acStack808;
    acStack808.R = 0xe1;
    acStack808.G = 0xe1;
    acStack808.B = 0xe1;
    acStack808.A = 0xff;
    acStack744.R = 0x32;
    acStack744.G = 0x32;
    acStack744.B = 0x32;
    acStack744.A = 0x96;
    pcVar13 = Cstring(LearnMagicOnlyWizard);
    pCVar15 = &acStack744;
  }
  else {
    IVar5 = param_3->id;
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
      if (param_4->spellbook->HaveSpell((ItemID)(bVar1 | 0x300),auStack_228)) {
        Gsprintf(Cstring(LearnMagicKnows),param_4->name);
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
        if (wizLV < pSVar7->WizardREQ){
          pCVar14 = &acStack416;
          acStack416.R = 0xe1;
          acStack416.G = 0xe1;
          acStack416.B = 0xe1;
          acStack352.R = 0x32;
          acStack352.G = 0x32;
          acStack352.B = 0x32;
          acStack416.A = 0xff;
          acStack352.A = 0x96;
          pcVar13 = Cstring(LearnMagicMoreWizard);
          pCVar15 = &acStack352;
        }
        else {
          MVar3 = param_4->EXP->school;
          if (((MVar3 == SCHOOL_Chaos) ||
              (MVar4 = pSVar7->School, MVar4 == SCHOOL_NONE))
             || (MVar3 == MVar4)) {
            param_4->spellbook->NewSpell((ItemID)(bVar1 | 0x300),1);
            Gsprintf(Cstring(LearnMagicLearned),param_4->name,pSVar7->Name);
            acStack160.R = 0xe1;
            acStack160.G = 0xe1;
            acStack160.B = 0xe1;
            acStack160.A = 0xff;
            acStack96.R = 0x32;
            acStack96.G = 0x32;
            acStack96.B = 0x32;
            acStack96.A = 0x96;
            some_textbox_func(gGlobals.text,0x96,&acStack160,&acStack96,1);
            this->Inventory->TakeItem(IVar5,1);
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
          pcVar13 = Cstring(LearnMagicWrongSchool);
          pCVar15 = &acStack224;
        }
      }
    }
  }
  some_textbox_func(pcVar13,0x96,pCVar14,pCVar15,1);
  return true;
}



void UpdateItemStatCharges(ItemInstance *I,StatMod *param_2,byte param_3){
  if (I->statMod) HFREE(I->statMod,1362);
  I->statMod = param_2;
  if (param_3 != -1) I->spellCharge->Charges = param_3;
}


u8 Party::RemoveArmorFrom(u8 index){
  CharSheet *pCVar1;
  ArmorInstance *pAVar2;
  SpellCharges *pSVar3;
  StatMod *X;
  ulong uVar5;
  ItemInstance *pIVar6;
  int line;
  byte bVar7;
  
  if (gGlobals.combatBytes[0] == 0xe) return true;
  pCVar1 = this->Members[index];
  if (!pCVar1) return true;
  pAVar2 = pCVar1->armor[0];
  if (!pAVar2) return false;
  X = CreateStatMod((pAVar2->base).statMod);
  pSVar3 = (pAVar2->base).spellCharge;
  bVar7 = 0xff;
  if (pSVar3) bVar7 = pSVar3->Charges;
  uVar5 = this->Inventory->AddItem((pAVar2->base).id,1);
  if (uVar5 == 0) {
    if (X == NULL) return true;
    line = 0x572;
  }
  else {
    uVar5= this->Inventory->GetItemIndex((pAVar2->base).id);
    pIVar6 = &this->Inventory->GetItemEntry(uVar5)->base;
    if (pIVar6) {
      UpdateItemStatCharges(pIVar6,X,bVar7);
      Entity::RemoveArmor(pCVar1);
      return false;
    }
    if (X == NULL) return true;
    line = 0x57d;
  }
  HFREE(X,line);
  return true;
}

u8 Party::RemoveShieldFrom(u8 param_2){
  CharSheet *pCVar1;
  ArmorInstance *pAVar2;
  SpellCharges *pSVar3;
  StatMod *X;
  ItemInstance *pIVar6;
  byte bVar7;
  
  pCVar1 = this->Members[param_2];
  if (!pCVar1) return true;
  if (gGlobals.combatBytes[0] == 0xe) return true;
  pAVar2 = pCVar1->armor[1];
  if (!pAVar2) return false;
  X = CreateStatMod((pAVar2->base).statMod);
  pSVar3 = (pAVar2->base).spellCharge;
  bVar7 = 0xff;
  if (pSVar3) bVar7 = pSVar3->Charges;
  if (this->Inventory->AddItem((pAVar2->base).id,1) == 0) {
    if (X == NULL) return true;
    HFREE(X,0x5a4);
  }
  else {
    pIVar6 = &this->Inventory->GetItemEntry(this->Inventory->GetItemIndex((pAVar2->base).id))->base;
    if (pIVar6) {
      UpdateItemStatCharges(pIVar6,X,bVar7);
      Entity::RemoveShield(pCVar1);
      return false;
    }
    if (X == NULL) return true;
    HFREE(X,0x5af);
  }
  return true;
}

u8 Party::RemoveWeaponsFrom(u8 param_2){
  CharSheet *pCVar1;
  CombatEntity *pCVar3;
  ulong uVar4;
  WeaponInstance *pTVar5;
  undefined uVar6;
  
  pCVar1 = this->Members[param_2];
  if (pCVar1) {
    pTVar5 = pCVar1->weapons;
    if (pTVar5 == NULL) return false;
    //Can't move Archmage Staff
    if ((weaponList[66] + 0x700) == pTVar5->base.id) return false;
    StatMod* X = CreateStatMod(pTVar5->base.statMod);
    uVar6 = 0xff;
    if (pTVar5->base.spellCharge) {uVar6 = pTVar5->base.spellCharge->Charges;}
    if (this->Inventory->AddItem((pTVar5->base).id,1) == 0) {
      if (X) {
        HFREE(X,0x5dd);
        return true;
      }
    }
    else {
      ItemInstance* II = &this->Inventory->GetItemEntry(this->Inventory->GetItemIndex((pTVar5->base).id))->base;
      if (II) {
        UpdateItemStatCharges(II,X,uVar6);
        Entity::UnequipWeapons(pCVar1);
        if (gGlobals.combatBytes[0] != 0xe) {return false;}
        if (gCombatP) { //change visible weapon model
          if (&gCombatP->combatEnts == NULL) {return false;}
          pCVar3 = (&gCombatP->combatEnts)[param_2];
          if (pCVar3 == NULL) {return false;}
          pCVar3->AtkType = 0;
          ShowWeaponSheild(pCVar3);
        }
        return false;
      }
      if (X) {
        HFREE(X,0x5e9);
        return true;
      }
    }
  }
  return true;
}


u8 Party::RemoveGearFrom(u8 param_2,u8 param_3){
  CharSheet *pCVar1;
  SpellCharges *pSVar2;
  StatMod *X;
  ulong uVar4;
  ItemInstance *pIVar5;
  byte bVar6;
  GearInstance *puVar2;
  
  pCVar1 = this->Members[param_2];
  if (!pCVar1) return true;
  if (0xb < param_3) return true;
  if (pCVar1->pItemList) {
    puVar2 = pCVar1->pItemList->pItem[param_3];
    if (!puVar2) return true;
    X = CreateStatMod((puVar2->base).statMod);
    pSVar2 = (puVar2->base).spellCharge;
    bVar6 = 0xff;
    if (pSVar2) bVar6 = pSVar2->Charges;
    if (this->Inventory->AddItem((puVar2->base).id,1)) {
      pIVar5 = &this->Inventory->GetItemEntry(this->Inventory->GetItemIndex((puVar2->base).id))->base;
      UpdateItemStatCharges(pIVar5,X,bVar6);
      Entity::UnequipGear(pCVar1,(uint)param_3);
      return false;
    }
    if (X) HFREE(X,0x625);
  }
  return true;
}

s32 Party::DiplomatCheck(){
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
  for(uVar4=0;uVar4<MAXPARTY;uVar4++){
    pCVar1 = this->Members[uVar4];
    if ((pCVar1) && (!Entity::isDead(pCVar1))) {
      uVar2 = CharStats::GetModded(pCVar1->Stats,STAT_INT);
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
s32 Party::LoremasterCheck(){
  CharSheet *pCVar1;
  bool bVar5;
  u8 uVar2;
  s8 sVar6;
  u8 uVar7;
  uint uVar8;
  
  u8 bestInt = 0;
  u8 partySkill = 0;
  for(u32 i = 0;i<MAXPARTY;i++) {
    pCVar1 = this->Members[i];
    if ((pCVar1) && (!Entity::isDead(pCVar1))) {
      uVar2 = CharStats::getModded(pCVar1->Stats,STAT_INT);
      if (bestInt < uVar2) bestInt = uVar2;
      partySkill+= pCVar1->Skills->getModdedSkill(SKILL_Loremaster);
    }
  }
  s32 total = bestInt * 3 + partySkill * 6;
  u16 rand = RollD(1,100);
  if (rand < total) return some_skillcheck_calc((total - rand));
  else return 0;
}

u32 Party::UnusedLoremasterCheck(){
  CharSheet *pCVar1;
  s8 cVar4;
  s32 iVar2;
  u32 uVar3;
  u32 uVar5;
  
  cVar4 = GetMostSkilledMember(SKILL_Loremaster);
  if (cVar4 != -1) {
    pCVar1 = this->Members[cVar4];
    if (!pCVar1) return 0;
    uVar5 = ((pCVar1->Skills->getModdedSkill(SKILL_Loremaster)) * 3 + CharStats::getModded(pCVar1->Stats,STAT_INT) & 0x7fff) * 2;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar5) return some_skillcheck_calc((uVar5 - uVar3));
  }
  return 0;
}

u8 Party::ArmorCraftCheck(s8 param_2){//used in armor craft
  CharSheet *pCVar1;
  char cVar5;
  s32 iVar2;
  s32 iVar3;
  u16 uVar4;
  undefined uVar6;
  u8 uVar7;
  u32 uVar8;
  
  pCVar1 = this->Members[param_2];
  uVar7 = 0;
  if (pCVar1) {
    cVar5 = pCVar1->Skills->getModdedSkill(SKILL_Mechanic);
    iVar2 = CharStats::getModded(pCVar1->Stats,STAT_INT);
    iVar3 = CharStats::getModded(pCVar1->Stats,STAT_DEX);
    uVar8 = (cVar5 * 5 + iVar2 + iVar3 & 0x7fffU) * 2;
    uVar4 = RollD(1,100);
    if (uVar4 < uVar8) {
      uVar6 = some_skillcheck_calc((uVar8 - uVar4));
      uVar4 = 5 - (s32)cVar5;
      FLOOR(uVar4,1);
      if (uVar4 <= CharStats::getModded(pCVar1->Stats,STAT_STAM)) {
        Entity::DecreaseHP(pCVar1,uVar4);
        uVar7 = uVar6;
        }
    }
    else uVar7 = 0;
  }
  return uVar7;
}

u32 Party::UnusedMechanicCheck(u8 param_2){
  CharSheet *pCVar1;
  s8 cVar5;
  s32 iVar2;
  s32 iVar3;
  u32 uVar4;
  u8 uVar6;
  u32 uVar7;
  u32 uVar8;
  
  pCVar1 = this->Members[param_2];
  uVar7 = 0;
  if (pCVar1) {
    cVar5 = pCVar1->Skills->getModdedSkill(SKILL_Mechanic);
    iVar2 = CharStats::getModded(pCVar1->Stats,STAT_INT);
    iVar3 = CharStats::getModded(pCVar1->Stats,STAT_DEX);
    uVar8 = (cVar5 * 5 + iVar2 + iVar3 & 0x7fffU) * 2;
    uVar4 = RollD(1,100);
    if (uVar4 < uVar8) {
      uVar6 = some_skillcheck_calc((uVar8 - uVar4));
      uVar4 = 0xfU - (s32)cVar5 & 0xffff;
      uVar7 = 0;
      if ((s32)uVar4 <= CharStats::getModded(pCVar1->Stats,STAT_STAM)) {
        Entity::DecreaseHP(pCVar1,(s16)uVar4);
        uVar7 = uVar6;
      }
    }
    else uVar7 = 0;
  }
  return uVar7;
}

float Party::Barter(u8 MInt,u8 MStam){
  CharSheet *pCVar1;
  s16 iVar3;
  u8 bVar5;
  u32 lVar2;
  s32 iVar4;
  u32 uVar7;
  s32 lVar8;
  s32 lVar9;
  u32 uVar10;
  u32 uVar11;
  
  uVar11 = 4;
  lVar8 = 0;
  iVar3 = 0;
  for(uVar7=0;uVar7 < MAXPARTY;uVar7++) {
    pCVar1 = this->Members[uVar7];
    if ((pCVar1) && (!Entity::isDead(pCVar1))) {
      lVar2 = pCVar1->Skills->getModdedSkill(SKILL_Merchant);
      lVar9 = lVar8;
      uVar10 = uVar11;
      if ((lVar2 == 0) || (lVar9 = lVar2, uVar10 = uVar7, lVar8 <= lVar2)) {
        lVar8 = lVar9;
        uVar11 = uVar10;
      }
    }
  }
  if (uVar11 != 4) {
    pCVar1 = this->Members[uVar11];
    iVar3 = 15 - (s32)lVar8;
    if (iVar3 <= CharStats::getModded(pCVar1->Stats,STAT_STAM)) {
      Entity::DecreaseHP(pCVar1,iVar3);
      MStam-= (s32)lVar8;
    }
  }
  return (float)MStam * 0.05;
}

u8 Party::AmbushDamage(){
  CharSheet *pCVar1;
  s32 iVar2;
  char cVar6;
  u32 uVar3;
  u32 uVar4;
  undefined uVar7;
  u16 uVar5;
  u32 uVar8;
  CharSheet *piVar8;
  u16 uVar9;
  
  uVar4 = 4;
  uVar5 = 0;
  iVar2 = 0;
  for(uVar9=0;uVar9 < MAXPARTY;uVar9++){
    pCVar1 = this->Members[uVar9];
    if (pCVar1) {
      cVar6 = pCVar1->Skills->getModdedSkill(SKILL_Ranger);
      uVar8 = (s32)cVar6;
      uVar3 = 5 - uVar8;
      if ((s32)uVar3 < 1) uVar3 = 1;
      if ((uVar5 < uVar8) &&((s32)(uVar3) <= CharStats::getModded(pCVar1->Stats,STAT_STAM))) {
        uVar4 = uVar9;
        uVar5 = uVar8;
      }
    }
  }
  uVar7 = 2;
  if (uVar5 != 0) {
    if (uVar4 != 4) {
      pCVar1 = this->Members[uVar4];
      iVar2 = CharStats::getModded(pCVar1->Stats,STAT_INT);
      uVar9 = iVar2 * 3 + uVar5 * 10;
      uVar4 = RollD(1,100);
      if (uVar4 < uVar9) {
        uVar7 = some_skillcheck_calc((uVar9 - uVar4));
        uVar5 = 5 - uVar5;
        if ((s32)uVar5 < 1) uVar5 = 1;
        iVar2 = CharStats::getModded(pCVar1->Stats,STAT_STAM);
        if (CharStats::getModded(pCVar1->Stats,STAT_STAM) < (s32)(uVar5 & 0xffff)) {return 0;}
        Entity::DecreaseHP(pCVar1,uVar5);
        return uVar7;
      }
    }
    uVar7 = 0;
  }
  return uVar7;
}


u32 Party::UnusedRangerCheck(){
  s32 iVar2;
  char cVar4;
  u32 uVar3;
  u32 uVar6;
  u32 uVar7;
  CharSheet *iVar1;
  
  uVar3 = 4;
  uVar7 = 0;
  uVar6 = 0;
  do {
    iVar1 = this->Members[uVar6];
    if (iVar1) {
      cVar4 = iVar1->Skills->getModdedSkill(SKILL_Ranger);
      if (uVar7 < ((s32)cVar4)) {
        uVar3 = uVar6;
        uVar7 = (s32)cVar4;
      }
    }
    uVar6++;
  } while (uVar6 < MAXPARTY);
  if (uVar7 == 0) {return 0;}
  if (uVar3 != 4) {
    if (this->Members[uVar3] == NULL) {
      return 0;
    }
    iVar2 = CharStats::getModded(this->Members[uVar3]->Stats,STAT_INT);
    uVar7 = iVar2 * 3 + uVar7 * 10 & 0xffff;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      return some_skillcheck_calc((uVar7 - uVar3));
    }
  }
  return 0;
}

u8 Party::UnusedRangerCheck3(){
  s32 iVar1;
  u32 uVar2;
  u32 uVar3;
  u8 uVar5;
  u8 uVar6;
  u16 uVar7;
  s32 *piVar8;
  u32 uVar9;
  
  uVar3 = MAXPARTY;
  uVar7 = 0;
  iVar1 = 0;
  for(uVar9=0;uVar9 < MAXPARTY;uVar9++) {
    CharSheet* pCVar1  = this->Members[uVar9];
    if (iVar1 != 0) {
      uVar6 = pCVar1->Skills->getModdedSkill(SKILL_Ranger);
      uVar2 = 5 - uVar6;
      FLOOR(uVar2,1);
      if ((uVar7 < uVar6) &&(uVar2 <= CharStats::getModded(pCVar1->Stats,STAT_STAM))) {
        uVar3 = uVar9;
        uVar7 = uVar6;
      }
    }
  }
  if (uVar7 == 0) return 0;
  if (uVar3 != 4) {
    if (!this->Members[uVar3]) return 0;
    uVar7 = CharStats::getModded(this->Members[uVar3]->Stats,STAT_INT) * 3 + uVar7 * 10;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      return some_skillcheck_calc((uVar7 - uVar3));
    }
  }
  return 0;
}

u8 Party::GetMemberRangerIntStam(u8 param_2){
  CharSheet *pCVar1;
  s32 iVar2;
  char cVar5;
  s32 iVar3;
  u32 uVar4;
  u8 uVar6;
  
  pCVar1 = this->Members[param_2];
  uVar6 = 0;
  if (pCVar1) {
    u16 uVar7 = CharStats::getModded(pCVar1->Stats,STAT_INT) * 3 + pCVar1->Skills->getModdedSkill(SKILL_Ranger) * 10 + CharStats::getModded(pCVar1->Stats,STAT_STAM);
    uVar4 = RollD(1,100);
    if (uVar4 < uVar7) {
      uVar6 = some_skillcheck_calc((uVar7 - uVar4));
    }
    else uVar6 = 0;
  }
  return uVar6;
}

u8 Party::MechanicCheckUnused(){
CharSheet *pCVar1;
u8 ret;
s32 i=0;
s16 j=0;
s32 k=0;
s32 l=0;
  for(i=0;i<MAXPARTY;i++){
    pCVar1 = this->Members[i];
    if (pCVar1) {
      j = (CharStats::getModded(pCVar1->Stats,STAT_INT) * 2 + CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Mechanic) * 5);
      if (l < j) l = j;
      }
  }
  i = RollD(1,100);
  if ((s32)i < l) 
    ret = some_skillcheck_calc((l - i));
  else ret = 0;
  return ret;
}

u8 Party::DisarmDamageUnused(u32 param_2){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  u32 uVar3;
  u8 uVar5;
  u8 uVar6;
  u32 uVar7;
  
  pCVar1 = this->Members[param_2];
  uVar6 = 0;
  if (pCVar1) {
    cVar4 = pCVar1->Skills->getModdedSkill(SKILL_Mechanic);
    iVar2 = CharStats::getModded(pCVar1->Stats,STAT_INT);
    uVar7 = iVar2 * 4 + cVar4 * 10;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      uVar5 = some_skillcheck_calc((uVar7 - uVar3));
      uVar3 = 10 - (s32)cVar4;
      FLOOR(uVar3,1);
      if ((s32)(uVar3) <= CharStats::getModded(pCVar1->Stats,STAT_STAM)) {
        Entity::DecreaseHP(pCVar1,(s16)(uVar3));
        uVar6 = uVar5;
      }
    }
    else uVar6 = 0;
  }
  return uVar6;
}

u8 Party::DisarmDamage(u8 param_2){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  s32 uVar3;
  undefined uVar5;
  undefined uVar6;
  u32 uVar7;
  //yes, the same func as above, but actually used.
  pCVar1 = this->Members[param_2];
  uVar6 = 0;
  if (pCVar1) {
    cVar4 = pCVar1->Skills->getModdedSkill(SKILL_Mechanic);
    uVar7 = CharStats::getModded(pCVar1->Stats,STAT_INT) * 4 + cVar4 * 10;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      uVar5 = some_skillcheck_calc((uVar7 - uVar3));
      uVar3 = 10 - (s32)cVar4;
      FLOOR(uVar3,1)
      uVar6 = 0;
      if ((uVar3) <= CharStats::getModded(pCVar1->Stats,STAT_STAM)) {
        Entity::DecreaseHP(pCVar1,(s16)(uVar3));
        uVar6 = uVar5;
      }
    }
    else {uVar6 = 0;}
  }
  return uVar6;
}

u8 Party::SecretLock(){ //used for "secrect door" checks
CharSheet *pCVar1;
u8 ret;
s32 i=0;
s16 test=0;
s32 best=0;
  for(i=0;i<4;i++){
    pCVar1 = this->Members[i];
    if (pCVar1) {
      test = (CharStats::getModded(pCVar1->Stats,STAT_INT) * 3 + pCVar1->Skills->getModdedSkill(SKILL_Ranger) * 10);
      if (best < test) {best = test;}
      }
  }
  i = RollD(1,100);
  if (i < best) 
    ret = some_skillcheck_calc((best - i));
  else ret = 0;
  return ret;
}

u8 Party::TroubadourCheck(){
  char cVar3;
  s32 iVar1;
  u32 uVar2 = 0;
  u8 uVar4;
  u32 uVar6 = 0;
  u32 uVar7 = 4;
  
  for(uVar6=0;uVar6 < 4;uVar6++) {
    if (this->Members[uVar6]) {
      cVar3 = this->Members[uVar6]->Skills->getModdedSkill(SKILL_Troubador);
      if (uVar2 <= ((s32)cVar3)) {
        uVar7 = uVar6;
        uVar2 = (s32)cVar3;
      }
    }
  }
  uVar4 = 0;
  if ((uVar7 != 4) && (uVar4 = 0, uVar2 != 0)) {
    if (this->Members[uVar7] == NULL) uVar4 = 0;
    else {
      uVar6 = uVar2 + CharStats::getModded(this->Members[uVar7]->Stats,STAT_DEX) * 3;
      uVar2 = RollD(1,100);
      if (uVar2 < uVar6) {
        uVar4 = some_skillcheck_calc((uVar6 - uVar2));
      }
      else uVar4 = 0;
    }
  }
  return uVar4;
}

u8 Party::GetMemberWarriorIntStam(u8 param_2){
  CharSheet *pCVar1;
  s32 iVar2;
  char cVar5;
  s32 iVar3;
  u32 uVar4;
  u8 uVar6;
  u32 uVar7;
  
  pCVar1 = this->Members[param_2];
  uVar6 = 0;
  if (pCVar1) {
    iVar2 = CharStats::getModded(pCVar1->Stats,STAT_INT);
    cVar5 = pCVar1->Skills->getModdedSkill(SKILL_Warrior);
    iVar3 = CharStats::getModded(pCVar1->Stats,STAT_STAM);
    uVar7 = iVar2 + cVar5 * 7 + iVar3;
    uVar4 = RollD(1,100);
    if (uVar4 < uVar7) uVar6 = some_skillcheck_calc((uVar7 - uVar4));
    else uVar6 = 0;
  }
  return uVar6;
}

u8 healing_widget_AB_func(void* x,BaseWidget *param_2){
  PTR_800ed504 = NULL;
  WHANDLE->FreeWidget(param_2);
  if (param_2) param_2->~BaseWidget();
  return 0;
}

void healing_result_widget(char *arg0){
  Color32 col1;
  Color32 col2;
  
  if (gGlobals.screenFadeModeSwitch == 2) {
    if (gCombatP) {copy_string_to_combat_textbox(gCombatP,arg0,0);}
  }
  else {
    col1 = {OFFWHITE};
    col2 = {DARKGRAY_T};
    PTR_800ed504 = some_textbox_func(arg0,0x96,&col1,&col2,1);
    PTR_800ed504->AbuttonFunc = healing_widget_AB_func;
    PTR_800ed504->BButtonFunc = healing_widget_AB_func;
    PTR_800ed504->CDownFunc = NULL;
    PTR_800ed504->CUpFunc = NULL;
  }
  return;
}

char * healing_func(Party *arg0,byte A,byte B){
  char *pcVar1;
  uint uVar2;
  u16 uVar6;
  s8 sVar7;
  int iVar3;
  uint uVar4;
  char *pcVar5;
  char *pcVar9;

  CharSheet* user = arg0->Members[A];
  CharSheet* target = arg0->Members[B];
  if ((!user) || (!target)) return gGlobals.CommonStrings[0x1b4];
  else {
    uVar2 = Entity::getHPCurrent(target);
    if (uVar2 == Entity::getHPMax(target)) {
      pcVar1 = target->name;
      pcVar9 = gGlobals.CommonStrings[0x1b7];
    }
    else {
      if (gGlobals.screenFadeModeSwitch == 2) {
        if (gGlobals.ShadowIndex != -1) {
          return gGlobals.CommonStrings[0x1b5];
        }
      }
      sVar7 = CharSkills::getModdedSkill(user->Skills,SKILL_Healer);
      if (2 < CharStats::getModded(user->Stats,STAT_STAM)) {
        Entity::DecreaseHP(user,3);
        Entity::addHP(target,(sVar7 << 1) + 5);
        s16 diff = (Entity::getHPCurrent(target) - uVar2);
        if (0 < diff) {
          Gsprintf(gGlobals.CommonStrings[0x1b8],user->name,target->name,diff);
          return gGlobals.text;
        }
      }
      pcVar1 = user->name;
      pcVar9 = gGlobals.CommonStrings[0x1b6];
    }
    Gsprintf(pcVar9,user->name);
    return gGlobals.text;
  }
}

void pass_to_healing_func_2(u8 param_2,u8 param_3){
  healing_result_widget(healing_func(param_2,param_3));
}

void herb_func(void){
  pause_Substruct* ps=(pause_Substruct*)gGlobals.BigAssMenu->substruct;
  WidgetTrainShop* puVar1 = ps->dollmenu->field4_0x88->field7_0x94;
  FUN_8003d064(puVar1,itemID_array[31],1,0xff); //herb loaded
  FUN_8003d640(puVar1);
  puVar1->Tick();
  FUN_8002ff30(puVar1->ScrollMenu);
}

char * Party::HerbHeal(u8 param_2,u8 param_3){
  CharSheet *ent;
  CharSheet *pCVar1;
  char *pcVar2;
  s8 sVar9;
  int skillMod;
  uint uVar4;
  u16 uVar8;
  ulong uVar5;
  int iVar6;
  u8 uVar10;
  uint uVar7;
  CharStats *pCVar11;
  char *pcVar12;
  
  ent = this->Members[param_2];
  if ((ent == NULL) || (pCVar1 = this->Members[param_3], pCVar1 == NULL)) {
    return gGlobals.CommonStrings[0x1b4];
  }
  sVar9 = ent->Skills->getModdedSkill(SKILL_Healer);
  skillMod = 5 - sVar9;
  FLOOR(skillMod,1);
  if (Entity::getHPCurrent(pCVar1) == Entity::getHPMax(pCVar1)) {
    pcVar2 = pCVar1->name;
    pcVar12 = gGlobals.CommonStrings[0x1b7];
  }
  else {
    uVar5 = this->Inventory->TakeItem(itemID_array[0x1f],1);
    if (uVar5 != 0) {
      if (gCombatP == NULL) herb_func();
      if ((short)skillMod <= CharStats::getModded(ent->Stats,STAT_STAM)) {
        if ((gGlobals.screenFadeModeSwitch == 2) && (gGlobals.ShadowIndex != -1)) {
          return gGlobals.CommonStrings[0x1b5];
        }
        Entity::DecreaseHP(ent,(short)skillMod);
        skillMod = CharStats::getModded(ent->Stats,STAT_INT);
        skillMod = (skillMod * 4 + ((sVar9 * 2 + (int)sVar9) * 4 - (int)sVar9)) * 0x10000 >> 0x10;
        uVar8 = RollD(1,100);
        Gsprintf(gGlobals.CommonStrings[0x1b6],ent->name);
        if ((short)uVar8 < skillMod) {
          Entity::addHP(pCVar1,some_skillcheck_calc((skillMod - (short)uVar8)));
          skillMod =(Entity::getHPCurrent(pCVar1) - uVar4);
          if (skillMod) {
            Gsprintf(Cstring(HealMenuHealBy),ent->name,pCVar1->name,skillMod)
            ;
          }
        }
        goto LAB_80081018;
      }
    }
    pcVar2 = ent->name;
    pcVar12 = gGlobals.CommonStrings[0x1b6];
  }
  Gsprintf(pcVar12,pcVar2);
LAB_80081018:
  return gGlobals.text;
}

void pass_to_party_healing_func(u8 param_2,u8 param_3){
  healing_result_widget(Party::HerbHeal(param_2,param_3));}

char * some_healing_func(u8 param_2,u8 param_3,u8 param_4){
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
  
  pCVar1 = this->Members[param_2];
  if ((pCVar1 == NULL) ||
     (pCVar2 = this->Members[param_3], pCVar2 == NULL)) {return (gGlobals.CommonStrings)->"someone in party is invalid";}  
  if (someStatCheck(pCVar2->Stats,param_4) == 0)
   {Gsprintf((gGlobals.CommonStrings)->"already max hp",pCVar2->name,Stat_labels[param_4]);}
  else {
    cVar9 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Healer);
    iVar5 = 0xf - cVar9;
    if (iVar5 < 0) {iVar5 = 0;}
    piVar3 = this->Inventory->Functions;
    uVar6 = (*(piVar3->get_some_bool).func)
                      ((s32)this->Inventory->inv_slots +
                       (s16)(piVar3->get_some_bool).arg[0] + -4,itemID_array[31],1);
    if (uVar6 != 0) {
      herb_func();
      if ((s16)iVar5 <= CharStats::getModded(pCVar1->Stats,STAT_STAM)) {
        Entity::DecreaseHP(pCVar1,(s16)iVar5);
        iVar5 = (CharStats::getModded(pCVar1->Stats,STAT_INT) * 2 + cVar9 * 4 + (s32)cVar9) * 0x10000 >> 0x10;
        uVar8 = RollD(1,100);
        Gsprintf((gGlobals.CommonStrings)->X failed the task,pCVar1->name);
        if ((s32)uVar8 < iVar5) {
          iVar5 = some_skillcheck_calc((s32)((iVar5 - uVar8) * 0x10000) >> 0x10);
          iVar10 = (iVar5 << 0x11) >> 0x10;
          iVar5 = CharStats::getModded(pCVar2->Stats,arg1);
          if (CharStats::getBase(pCVar2->Stats,arg1) < iVar5 + iVar10) {
            iVar10 = (CharStats::getBase(pCVar2->Stats,arg1) - iVar5) * 0x10000 >> 0x10;
          }
          CharStats::addModdedHealth(pCVar2->Stats,arg1,(char)iVar10);
          if (0 < CharStats::getModded(pCVar2->Stats,arg1) - iVar5) {
            Gsprintf((gGlobals.CommonStrings)->"hp restored by x",pCVar2->name,
                        Stat_labels[param_4]);
          }
        }
        goto LAB_800812c8;
      }
    }
    Gsprintf(Cstring(HealMenuFail),pCVar1->name);
  }
LAB_800812c8:
  return gGlobals.text;
}



u32 Party::CraftPotion(u8 user,u8 item){
  byte bVar1;
  WidgetInvShop *pWVar2 = (WidgetInvShop *)(((gGlobals.BigAssMenu)->base).substruct)->dollmenu->field4_0x88->field7_0x94;
  potionRecipie *recepie = get_potion_recipie(item);
  if (recepie) {
    CharSheet *chara = this->Members[user];
    FUN_8003d064(pWVar2,itemID_array[0x1e],recepie->spice,0xff);
    FUN_8003d064(pWVar2,itemID_array[0x1f],recepie->herb,0xff);
    FUN_8003d064(pWVar2,itemID_array[0x20],recepie->gemstone,0xff);
    if (recepie->spice){
      if (!this->Inventory->TakeItem(itemID_array[0x1e],recepie->spice)) return 0;
    }
    if (recepie->herb) {
      if (!this->Inventory->TakeItem(itemID_array[0x1f],recepie->herb)) return 0;
    }
    if (recepie->gemstone) {
      if (!this->Inventory->TakeItem(itemID_array[0x20],recepie->gemstone)) return 0;
    }
    s8 alch = chara->Skills->getModdedSkill(SKILL_Alchemist);
    if (alch < recepie->alchemist) return 0;
    u16 vsRoll = (CharStats::getModded(chara->Stats,STAT_INT) * 3 + alch * 6);
    s16 roll = RollD(1,100);
    if (roll < vsRoll) {
      //"unk2" is 0 for all recipies, so it always passes
      if (recepie->unk2 <= some_skillcheck_calc(vsRoll - roll)) {
        u32 ret =this->Inventory->Additem(item | 0x1000,1);
        if(!ret) return 0;
        else {
          SMI::AddItem(pWVar2,(u16)(item | 0x1000),1,0xff,FILENAME,2763);
          FUN_8003d640(pWVar2);
          pWVar2->Tick();
          FUN_8002ff30((pWVar2->base).scrollMenu);
          return ret;
        }
      }
      return 0;
    }
  }
  return 0;
}



bool Party::Lockpicking(Party *p,byte lock,char *text)

{
  CharSheet *pCVar1;
  char *pcVar2;
  char *pcVar3;
  s8 sVar6;
  bool bVar7;
  s8 sVar8;
  int iVar4;
  int iVar5;
  char *pcVar9;
  s32 lok;
  
  lok = (s32)lock;
  sVar6 = GetMostSkilledMember(p,SKILL_Theif);
  if (sVar6 == 0xff) {
    strcpy(text,gGlobals.CommonStrings[0x1bf]);
    bVar7 = false;
  }
  else {
    pCVar1 = p->Members[sVar6];
    if ((uint)lok < 10) {
      sVar8 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Theif);
      iVar4 = 10;
      if (sVar8 < 10) {
        sVar8 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Theif);
        iVar4 = (int)sVar8;
      }
      if (iVar4 + -1 < lok) {
        iVar4 = (lok - iVar4) * 0x1000000 >> 0x18;
        if (iVar4 < 3) {
          pcVar2 = pCVar1->name;
          pcVar9 = gGlobals.CommonStrings[0x1c3];
          pcVar3 = gGlobals.CommonStrings[0x1c1];
        }
        else {
          if (5 < iVar4) {
            sprintf(text,gGlobals.CommonStrings[0x1c3],gGlobals.CommonStrings[0x1c0],
                        pCVar1->name);
            return false;
          }
          pcVar2 = pCVar1->name;
          pcVar9 = gGlobals.CommonStrings[0x1c3];
          pcVar3 = gGlobals.CommonStrings[0x1c2];
        }
        sprintf(text,pcVar9,pcVar3,pcVar2);
        bVar7 = false;
      }
      else {
        iVar4 = 10 - iVar4;
        if (iVar4 < 1) {
          iVar4 = 1;
        }
        iVar5 = CharStats::getModded(pCVar1->Stats,STAT_STAM);
        if (iVar5 < iVar4) {
          sprintf(text,gGlobals.CommonStrings[0x1c4],pCVar1->name);
          bVar7 = false;
        }
        else {
          CharStats::addModdedHealth(pCVar1->Stats,STAT_STAM,-(char)iVar4);
          sprintf(text,gGlobals.CommonStrings[0x1c5],pCVar1->name);
          bVar7 = true;
        }
      }
    }
    else {
      sprintf(text,gGlobals.CommonStrings[0x1c3],gGlobals.CommonStrings[0x1c0],pCVar1->name);
      bVar7 = false;
    }
  }
  return bVar7;
}

u8 ofunc_mechanic_skill(Party* this,u8 param_2){
  CharSheet *pCVar1;
  char cVar5;
  s32 iVar2;
  s32 iVar3;
  u32 uVar4;
  u8 uVar6;
  u8 uVar7;
  u32 uVar8;
  
  pCVar1 = this->Members[param_2];
  cVar5 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Mechanic);
  uVar8 = (CharStats::getModded(pCVar1->Stats,STAT_STR) + CharStats::getModded(pCVar1->Stats,STAT_DEX)) * 2 + 10 + cVar5 * 6;
  uVar4 = RollD(1,100);
  if (uVar4 < uVar8) {
    uVar6 = some_skillcheck_calc((uVar8 - uVar4));
    uVar4 = cVar5 * -2 + 0x19;
    if ((s32)uVar4 < 1) {uVar4 = 1;}
    iVar2 = CharStats::getModded(pCVar1->Stats,STAT_STAM);
    uVar7 = 0;
    if (uVar4 <= iVar2) {
      Entity::DecreaseHP(pCVar1,uVar4);
      uVar7 = uVar6;
    }
  }
  else {uVar7 = 0;}
  return uVar7;
}


float ranger_int_float(){ //used for calulating the reagent multiplier
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  float fVar5;
  float fVar6;
  
  cVar4 = GetMostSkilledMember(SKILL_Ranger);
  if ((cVar4 == -1) || (pCVar1 = this->Members[cVar4], pCVar1 == NULL)) {
    fVar5 = 0.0;}
  else {
    iVar2 = CharStats::getModded(pCVar1->Stats,STAT_INT);
    cVar4 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Ranger);
    fVar6 = (float)(iVar2 + cVar4 * 7);
    fVar6 *= ((float)RollD(1,100) / 100.0f);
    fVar5 = 1.0f;
    if ((fVar6 <= 1.0f) && (fVar5 = fVar6, fVar6 < 0.0)) {fVar5 = 0.0;}
  }
  return fVar5;
}

float Party::UnusedRangerCheck2(){return (float)Party::UnusedRangerCheck3() / 20.0f;}

u8 theif_over_B(Party *A,u8 B){return B <= Party::SecretLock(A);}

char * Party::ApraisePrice(ItemID param_2,u32 param_3){
  CharSheet *pCVar1;
  char cVar3;
  s32 iVar2;
  u32 uVar6;
  double dVar7;
  float fVar8;
  
  uVar6 = 0;
  for(u32 i = 0;i<MAXPARTY;i++){
    pCVar1 = this->Members[i];
    if (pCVar1) {
      u16 uVar4 = CharStats::getModded(pCVar1->Stats,STAT_INT) + pCVar1->Skills->getModdedSkill(SKILL_Merchant) * 6;
      if (uVar6 <= uVar4) uVar6 = uVar4;
    }
  }
  fVar8 = ((float)(SQ(uVar6)) * -0.0186603f + (float)uVar6 * 2.366025f + 50.0f) / 100.0f;
  //use CLAMP macro instead?
  FLOOR(fVar8,0.0);
  else CIEL(fVar8,125.0f);
  fVar8 = ((float)GetItemPrice(param_2) * fVar8 * 3.0f) / (float)(param_3);
  dVar7 = (double)fVar8;
  if (0.0 < fVar8) uVar6 = (u32)(dVar7 + 0.5);
  else uVar6 = -(s32)(0.5 - dVar7);
  uVar6 &= 0xff;
  CIEL(uVar6,6);
  return price_strings[uVar6];
}

s8 Party::DisarmCheck(u8 param_2,u8 param_3){
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
    piVar5 = this->Members[i];
    if (piVar5) {
      cVar3 = piVar5->Skills->getModdedSkill(param_2);
      uVar4 = (s32)cVar3;
      uVar2 = param_3 - uVar4;
      if (uVar2 < 1) uVar2 = 1;
      if ((uVar7 < uVar4) &&
         (uVar2 <= CharStats::getModded(piVar5->Stats,STAT_STAM))) {
        uVar8 = i;
        uVar7 = uVar4;
      }
    }
  }
  i = -1;
  if(uVar7 != 0) i = uVar8;
  return i;
}

s8 Party::GetMostSkilledMember(u8 param_2){
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
  for(u8 i=0;i<MAXPARTY;i++) {
    iVar1 = this->Members[i]);
    if ((iVar1) &&
       (bVar3 = iVar1->Skills->getModdedSkill(param_2), bVar5 <= bVar3)) {
      uVar6 = i;
      bVar5 = bVar3;
    }
  }
  return (s8)uVar6;}

float camp_float_array[30]= //ambush risk. 0=can't camp there.
{20.0,15.0,10.0,20.0,20.0,10.0,0.0,10.0,0.0,0.0,50.0,
0.0,0.0,0.0,0.0,0.0,0.0,10.0,0.0,0.0,30.0,30.0,30.0,
0.0,15.0,0.0,0.0,20.0,0.0,0.0};

u8 Party::CampCheck(){
  u8 bVar3;
  s8 cVar4;
  s32 iVar1;
  u32 uVar2;
  s32 iVar5;
  u32 uVar6;
  
  if (!getEventFlag(5004))return false;
    cVar4 = GetMostSkilledMember(SKILL_Ranger);
    uVar6 = 0;
    if (cVar4 != -1) {
      uVar6 = 0;
      if (this->Members[cVar4]) {
        cVar4 = this->Members[cVar4]->Skills->getModdedSkill(SKILL_Ranger);
        uVar6 = 0;
        if (0 < cVar4) uVar6 = cVar4;
      }
    }
    iVar5 = (s32)uVar6;
    if (10 < uVar6) iVar5 = 10;
    return RollD(1,100) <= (15.0f - (float)iVar5) * 0.666f * camp_float_array[World::getTerrain(TerrainPointer)];
}

void Party::CampAmbush(void){load_camp_ambush();}

u8 get_equip_stamMod(ItemID id){
  u8 bVar3;
  weapon_ram *pwVar1;
  ItemID IVar4;
  
  bVar3 = 0;
  switch(id >> 8) {
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

void ItemCampStamina(ItemInstance *I,float param_2){
  StatMod *pSVar1;
  int iVar2;
  char cVar3;
  
  if (((I) && (pSVar1 = I->statMod, pSVar1 != NULL)) &&
     (pSVar1->stat == STAT_STAM)) {
    iVar2 = get_equip_stamMod(I->id);
    cVar3 = (char)(int)((float)iVar2 * param_2);
    if (iVar2 < (int)pSVar1->mod + (int)cVar3) pSVar1->mod = (s8)iVar2;
    else pSVar1->mod = cVar3 + pSVar1->mod;
  }
}

void Party::CampHeal(u8 halfHeal){
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
  pPVar7 = this;
  for(uVar8 = 0;uVar8 < 4;uVar8++;) {
    pCVar1 = this->Members[uVar8];
    if ((pCVar1) && (!isDead(pCVar1))) Entity::CampHeal(pCVar1,uVar10,uVar9);
  }
  uVar4 = this->Inventory->GetMaxQuantity();
  if (uVar4) {
    for(uVar8=0;uVar8 + 1<uVar4;uVar8++){
      ItemCampStamina(this->Inventory->GetItemEntry(uVar8),uVar10);
    }
  }
  noop_800821bc(1,uVar9);
  gGlobals.combatBytes[2] = 0;
}

u8 Party::CampAmbushCheck(){
  u8 bVar1 = CampCheck();
  if (bVar1) CampAmbush();
  else CampHeal(true);
  return bVar1;}

//dummied, probably for some incrementation based on ingame time.
void Party::noop_800821bc(u32 A,u32 time){}

void Party::TickMoveCounters(s32 delta){
  //3 values in the party struct. seem useless.
  int t = delta * (uint)TerrainPointer->daySpeed;
  switch((gGlobals.playerCharStruct.playerDat)->ani_type){
    case 3:
    this->TimeRunning = (this->TimeRunning + t) % MINUTES(5);
    return;
    case 2:
    this->timeWalking = (this->timeWalking + t) % MINUTES(30);
    return;
    case 0x19:
    this->timeSneaking = (this->timeSneaking + t) % MINUTES(10);
    return;
  }
}

u32 Party::SkillCheck(u8 sk){
  u32 uVar2;
  //used for dialouge functions.
  switch(sk) {
  case SKILL_Alchemist:
    uVar2 = AlchemistCheck();
    break;
  case SKILL_Diplomat:
    uVar2 = 2;
    if (2 < DiplomatCheck()) uVar2 = DiplomatCheck();
    break;  //why the doublecheck?
  case SKILL_Healer:
    uVar2 = HealerCheck();
    break;
  case SKILL_Loremaster:
    uVar2 = LoremasterCheck();
    break;
  case SKILL_Mechanic:
    uVar2 = MechanicCheck();
    break;
  case SKILL_Merchant:
    uVar2 = MerchantCheck();
    break;
  case SKILL_Ranger:
    uVar2 = RangerCheck();
    break;
  case SKILL_Stealth:
    uVar2 = StealthCheck();
    break;
  case SKILL_Theif:
    uVar2 = ThiefCheck();
    break;
  case SKILL_Troubador:
    uVar2 = TroubadourCheck();
    break;
  case SKILL_Warrior:
    uVar2 = WarriorCheck();
    break;
  case SKILL_Wizard:
    uVar2 = WizardCheck();
    break;
  default:
    uVar2 = 0;
  }
  return uVar2;
}

u32 Party::BestStat(u8 param_2){
  u32 uVar1;
  CharSheet *piVar4;

  uVar1 = CharStats::getModded(this->Members[0]->Stats,param_2);
  for(u8 uVar3 = 1;uVar3 < 4;uVar3++) {
    piVar4 = this->Members[uVar3];
    if ((piVar4) && (uVar1 < CharStats::getModded(piVar4->Stats,param_2))
    {uVar1 = CharStats::getModded(piVar4->Stats,param_2);}
  }
  return uVar1;}

u32 Party::WorstStat(u8 param_2){
  s32 worst = CharStats::getModded(this->Members[0]->Stats,param_2);
  for(u8 uVar3 = 1;uVar3 < 4;uVar3++) {
    CharSheet* piVar4 = this->Members[uVar3];
    if ((piVar4) && (worst > CharStats::getModded(piVar4->Stats,param_2)))
      worst = CharStats::getModded(piVar4->Stats,param_2);
  }
  return worst;
}

u32 Party::GetMemberStat(ItemID id,u8 stat){
  u32 i = 0;
  CharSheet *psVar1;
  
  while ((psVar1 = this->Members[i], psVar1 == NULL ||(psVar1->ID != id))) {
    i++;
    if (3 < i) {return 0;}
  }
  return CharStats::getModded(psVar1->Stats,stat);
}

u32 Party::AlchemistCheck(){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  
  cVar4 = GetMostSkilledMember(SKILL_Alchemist);
  if (cVar4 == -1) return 0;
  else {
    pCVar1 = this->Members[cVar4];
    iVar2 = CharStats::getModded(pCVar1->Stats,STAT_INT);
    cVar4 = pCVar1->Skills->getModdedSkill(SKILL_Alchemist);
    return some_skillcheck_calc((s32)((RollD(1,100) - (iVar2 * 3 + cVar4 * 6)) * 0x10000) >> 0x10);
  }
}

u32 Party::HealerCheck(){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  
  cVar4 = GetMostSkilledMember(SKILL_Healer);
  if (cVar4 == -1)  return 0;
  else {
    pCVar1 = this->Members[cVar4];
    iVar2 = CharStats::getModded(pCVar1->Stats,STAT_INT);
    cVar4 = CharSkills::getModdedSkill(pCVar1->Skills,SKILL_Healer);
    return some_skillcheck_calc((RollD(1,100) - (iVar2 * 3 + cVar4 * 10));
  }
}
//dialouge Mechanic Skill Check
u32 Party::MechanicCheck(){
  
  s8 cVar4 = GetMostSkilledMember(SKILL_Mechanic);
  if (cVar4 == -1) return 0;
  else {
    CharSheet* pCVar1 = this->Members[cVar4];
    s8 iVar2 = CharStats::getModded(pCVar1->Stats,STAT_INT);
    s8 iVar3 = CharStats::getModded(pCVar1->Stats,STAT_DEX);
    s8 cVar4 = pCVar1->Skills->getModdedSkill(SKILL_Mechanic);
    return some_skillcheck_calc(((RollD(1,100) - (cVar4 * 5 + iVar2 + iVar3 & 0x7fffU) * -2));
  }
}

//dialouge Merchant Skill Check
u32 Party::MerchantCheck(){
  s32 iVar1;
  char cVar4;
  u8 uVar3;
  u8 uVar5;
  
  uVar3 = 0;
  iVar1 = 0;
  for(uVar5 = 0;uVar5<4;uVar5++) {
    CharSheet *pCVar1 = this->Members[uVar5]);
    if ((pCVar1) && uVar3 < CharStats::getModded(pCVar1->Stats,STAT_INT)))
      uVar3 = CharStats::getModded(pCVar1->Stats,STAT_INT);
  }
  cVar4 = GetMostSkilledMember(SKILL_Merchant);
  uVar5 = 0;
  if (cVar4 != -1)
    uVar5 = this->Members[cVar4]->Skills->getModdedSkill(SKILL_Merchant);
  return some_skillcheck_calc(((RollD(1,100) - (uVar3 * 3 + uVar5 * 10)));
}

//dialouge Ranger Skill Check
u32 Party::RangerCheck(){
  s8 sVar2;
  u16 r;
  
  sVar2 = GetMostSkilledMember(SKILL_Ranger);
  r = 0;
  if (sVar2 != -1)
    r = this->Members[sVar2]->Skills->getModdedSkill(SKILL_Ranger);
  return  some_skillcheck_calc(RollD(1,100) - (r * 10 + 0x50));
}


//dialouge stealth checks =0
u32 Party::StealthCheck(void){return 0;}

//dialouge Theif Skill Check
u32 Party::ThiefCheck(){
  CharSheet *pCVar1;
  char cVar4;
  s32 iVar2;
  u32 uVar3;
  
  cVar4 = GetMostSkilledMember(SKILL_Theif);
  if (cVar4 == -1) return 0;
  else {
    pCVar1 = this->Members[cVar4];
    iVar2 = CharStats::getModded(pCVar1->Stats,STAT_INT);
    cVar4 = pCVar1->Skills->getModdedSkill(SKILL_Theif);
    return some_skillcheck_calc(RollD(1,100) - (iVar2 * 4 + cVar4 * 10));
  }
}

u32 Party::WarriorCheck(){
  CharSheet *pCVar1;
  char cVar5;
  s32 iVar2;
  s32 iVar3;
  
  cVar5 = GetMostSkilledMember(SKILL_Warrior);
  if (cVar5 == -1) return 0;
    pCVar1 = this->Members[cVar5];
    return some_skillcheck_calc(RollD(1,100) - 
    (CharStats::getModded(pCVar1->Stats,STAT_INT) + pCVar1->Skills->getModdedSkill(SKILL_Warrior) * 7 + CharStats::getModded(pCVar1->Stats,STAT_STAM)));
}

u32 Party::WizardCheck(){
  CharSheet *pCVar1;
  char cVar4;
  
  cVar4 = GetMostSkilledMember(SKILL_Wizard);
  if (cVar4 == -1) return 0;
  return some_skillcheck_calc((RollD(1,100) + 
  (pCVar1->Skills->getModdedSkill(SKILL_Wizard) * 5 + CharStats::getModded(pCVar1->Stats,STAT_INT) & 0x7fffU) * -2));
}

u8 Party::SetWandererVal(u8 param_2){
  
  u8 uVar5 = 0;
  s8 cVar2 = GetMostSkilledMember(SKILL_Ranger);
  if (cVar2 == -1) {
    cVar2 = GetMostSkilledMember(SKILL_Warrior);
    if (cVar2 != -1) {
      uVar5 = GetMemberWarriorIntStam(cVar2);
      goto LAB_80082bf0;
    }
    if (this->Members[0] == NULL) goto LAB_80082bf0;
    cVar2 = 0;
  }
  u8 uVar5 = GetMemberRangerIntStam(cVar2);
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

u8 Party::CraftArmor(char param_2,ItemID param_3,ItemID material,u8 stam){
  WidgetTrainShop *pWVar1;
  ulonglong uVar4;
  s32 uVar5;
  bool bVar6;
  
  pWVar1 = (((gGlobals.BigAssMenu)->base).substruct)->dollmenu->field4_0x88->field7_0x94;
  uVar4 = Party::ArmorCraftCheck(param_2);
  uVar5 = this->Inventory->GetItemIndex(material);
  if (uVar5 == -1) bVar6 = false;
  else {
    this->Inventory->TakeItem(material,1);
    FUN_8003d064(pWVar1,material,1,0xff);
    bVar6 = stam <= uVar4;
    if (bVar6) {
      this->Inventory->AddItem(param_3,1);
      pWVar1->AddItem(param_3,1,0xff,FILENAME,0x1136);
    }
    FUN_8003d640(pWVar1);
    pWVar3->Tick();
    FUN_8002ff30(pWVar1->scrollMenu);
  }
  return bVar6;
}


u8 Party::UnequipMemberItemOfID(s32 param_2,ItemID param_3){
  CharSheet *pCVar1;
  GearInstance **pptVar5;
  u8 i;
  
  pCVar1 = this->Members[param_2];
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
}

//forcible remove item from party. used in dialoug.
u8 Party::TakeItem(ItemID param_2){
  bool bVar2;
  uint uVar3;
  

  if (this->Inventory->HasItem(param_2)) {
    this->Inventory->TakeItem(param_2,1);
LAB_80082f80:
    bVar2 = true;
  }
  else {
    uVar3 = 0;
    do {
      bVar2 = Party::UnequipMemberItemOfID(uVar3,param_2);
      uVar3 += 1;
      if (bVar2) goto LAB_80082f80;
    } while (uVar3 < 4);
    bVar2 = false;
  }
  return bVar2;
}

//unknown, unused.
u8 FUN_80082fcc(u16 *x,u16 param_2){
  if (x) return *x == param_2;
  return false;
}

u8 Party::HasItemEquipped(s32 param_2,ItemID param_3){
  WeaponInstance *pTVar1;
  u8 bVar2;
  
  if (this->Members[param_2] == NULL) {bVar2 = false;}
  else {
    pTVar1 = Has_Item_equipped_character(this->Members[param_2],param_3);
    bVar2 = pTVar1 != NULL;
  }
  return bVar2;
}

u8 Party::hasItem(ItemID id){
  if(this->Inventory->HasItem(id)) return true;
  for(u32 i = 0;i<4;i++){
      if (HasItemEquipped(i,id)) return true;
    }
  return false;
}


u8 Party::GetEquipError3(byte param_2,GearInstance *param_3,CharSheet *param_4,byte param_5){
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
  
  IVar1 = param_3->id;
  bVar6 = FUN_8007e798(Entity::GearMinStatCheck(param_4,IVar1));
  if (bVar6) return bVar6;
  uVar10 = 0;
  uVar9 = 0;
  uVar7 = (uint)param_4->pItemList->usedItems;
  if (uVar7 != 0) {
    ppGVar8 = param_4->pItemList->pItem;
    do {
      if ((*ppGVar8 != NULL) && ((u16)((*ppGVar8)->base).id >> 8 == (u16)IVar1 >> 8)) {
        uVar9 += 1;
      }
      uVar10 += 1;
      ppGVar8++;
    } while (uVar10 < uVar7);
  }
  if (uVar9 < param_5) {
    X = CreateStatMod(param_3->statMod);
    pSVar2 = param_3->spellCharge;
    bVar6 = 0xff;
    if (pSVar2) bVar6 = pSVar2->Charges;
    if (this->Inventory->TakeItem(IVar1,1)) {
      FUN_8007f10c(param_4,IVar1,X,bVar6);
      return false;
    }
    if (X) {
      HFREE(X,5540);
      return true;
    }
  }
  return true;
}