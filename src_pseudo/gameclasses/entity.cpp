#define FILENAME "../gameclasses/entity.cpp"


#include "globals.h"
#include "combat/CombatStruct.h"
#include "weapondb.h"
#include "armordb.h"
#include "widgets/textPopup.h"

u8 Entity::IsElemental(ItemID id){
  if (id >> 8 == 2) {
    u8 index = GETINDEX(id);
    //Air, Earth, Fire Water Elementals
    if ((((index == 0xc2) || (index == 0xc4)) || (index == 0xc5)) || (index == 199)) return true;
    else return (index == 0xbf); //firelord
  }
  else return false;
}

typedef void (*CharINIT)(CharSheet*,Entity_Ram*);

void Entity::EquipFunc0(CharSheet *ent,Entity_Ram *param_2){
  u32 uVar1;
  Borg8Header *pBVar4;
  s32 iVar5;
  ulong uVar6;
  ItemID IVar7;
  
  ent->portrait = loadBorg8(gEntityDB->GetPortrait(ent->ID));
  ALLOCS(ent->potionEffects,sizeof(PotionEffect*)*POTION_FXMAX,193);
  memset(ent->potionEffects,0,sizeof(PotionEffect*)*POTION_FXMAX);
  ent->weapons = NULL;
  ent->EXP->total = EXP_TNL[CharStats::getBase(ent->Stats,STAT_LV)];
  if (param_2->weapon[0] != 0xffff) {EquipWeapon(ent,param_2->weapon[0],0);}
  if (param_2->weapon[1] != 0xffff) {
    if (ent->weapons == NULL) EquipWeapon(ent,param_2->weapon[1],0);
    else PARTY->Inventory->AddItem(param_2->weapon[1],1);
  }
  if (param_2->weapon[2] != 0xffff) {
    if (ent->weapons == NULL) EquipWeapon(ent,param_2->weapon[2],0);
    else PARTY->Inventory->AddItem(param_2->weapon[2],1);
  }
}

void Entity::EquipFunc1(CharSheet *param_1,Entity_Ram *param_2){
  ALLOCS(param_1->potionEffects,sizeof(PotionEffect*)*POTION_FXMAX,216);
  memset(param_1->potionEffects,0,sizeof(PotionEffect*)*POTION_FXMAX);
  param_1->weapons = NULL;
  if (param_2->weapon[2] != 0xffff) {EquipWeapon(param_1,param_2->weapon[2],0);}
  if ((param_2->weapon[0] !=0xffff) && (param_1->weapons == NULL)) {
    EquipWeapon(param_1,param_2->weapon[0],0);
  }
}

void Entity::EquipFunc2(CharSheet *param_1,Entity_Ram *param_2){
  
  param_1->weapons = NULL;
  if (param_2->weapon[0] != (ItemID)-1){EquipWeapon(param_1,param_2->weapon[0],0);}
  if (param_2->weapon[1] != (ItemID)-1){
    if (param_1->weapons == NULL) {EquipWeapon(param_1,param_2->weapon[1],0);}
  }
  if ((param_2->weapon[2] != (ItemID)-1) && (param_1->weapons == NULL)) {
    EquipWeapon(param_1,param_2->weapon[2],0);
  }
}


void Entity::Init(CharSheet *param_1,ItemID param_2,u8 param_3){
  
  CLEAR(param_1);
  u8 bVar7 = GETINDEX(param_2);
  param_1->ID = param_2;
  Entity_Ram*  pEVar10 = &gEntityDB->entities[bVar7];
  strlen(pEVar10->Name);
  param_1->name = pEVar10->Name;
  ALLOC(param_1->Stats,257);
  CharStats::Init(param_1->Stats,param_1->ID);
  ALLOC(param_1->EXP,260);
  param_1->EXP->Init(param_1->ID);
  ALLOC(param_1->Skills,263);
  param_1->Skills->Init(param_1->ID);
  ALLOCS(param_1->armor,2*sizeof(ArmorInstance*),266);
  param_1->armor[0] = NULL;
  param_1->armor[1] = NULL;
  if (pEVar10->Armor != 0xffff) EquipArmor(param_1,pEVar10->Armor,0);
  if (pEVar10->Sheild != 0xffff) EquipSheild(param_1,pEVar10->Sheild,NULL);
  ALLOC(param_1->pItemList,273);
  CharGear::Init(param_1->pItemList,GEARTOTAL);
  ALLOC(param_1->spellbook,276);
  param_1->spellbook->Reset(5);
  for(u8 i=0;i < 5;i++) {
    if (pEVar10->spells[i] != 0xffff) {
      ALLOCL(param_1->spellbook->spells[i],282);
      TempSpell::Init(param_1->spellbook->spells[i],ID,pEVar10->Spell_levels[i]);
      param_1->spellbook->count++;
    }
  }
  ALLOCS(param_1->effects,(MAGIC_FXMAX+sizeof(void*)),287);
  memset(param_1->effects,0,MAGIC_FXMAX+sizeof(void*));
  CharINIT apcStack112[] = {EquipFunc0,EquipFunc1,NULL,EquipFunc2};
  (*apcStack112[param_3])(param_1,pEVar10);
  param_1->spellSwitch = 0;
  param_1->spellVal = -1;
}

void Entity::Free(CharSheet *param_1){
  FREEPTR(param_1->EXP,322);
  if(param_1->armor) {
    if (param_1->armor[0]) {
      ArmorInstance_ClearEffect(param_1->armor[0]);
      FREE(param_1->armor[0],331);
    }
    if (param_1->armor[1]) {
      ArmorInstance_ClearEffect(param_1->armor[1]);
      FREE(param_1->armor[1],338);
    }
    FREE(param_1->armor,342);
  }
  if(param_1->weapons) {
    passto_clear_weapon_effects(param_1->weapons);
    FREE(param_1->weapons,349);
  }
  if(param_1->pItemList) {
    CharGear_Free(param_1->pItemList);
    FREE(param_1->pItemList,356);
  }
  if(param_1->spellbook) {
    param_1->spellbook->Clear();
    FREE(param_1->spellbook,363);
  }
  if(param_1->effects) {
    RemoveAllEffects(param_1);
    FREE(param_1->effects,0x173);
  }
  if(param_1->potionEffects) {
    ClearAllPotionEffects(param_1);
    FREE(param_1->potionEffects,0x17b);
  }
  if (param_1->portrait) {
    FREEQB8(param_1->portrait);
    param_1->portrait = NULL;
  }
  FREEPTR(param_1->Stats,392);
  FREEPTR(param_1->Skills,398)
}

u8 Entity::getHPMax(CharSheet *param_1){

  if (param_1->Stats)
    return CharStats::getBase(param_1->Stats,STAT_END) + CharStats::getBase(param_1->Stats,STAT_STAM)  + CharStats::getBase(param_1->Stats,STAT_LV);
  return 0;
}

u32  Entity::getHPCurrent(CharSheet *param_1){
  u32 max;
  u32 ret = 0;
  if (param_1->Stats) {
    ret = CharStats::getModded(param_1->Stats,STAT_END) + CharStats::getModded(param_1->Stats,STAT_STAM) + CharStats::getModded(param_1->Stats,STAT_LV);
    max = getHPMax(param_1);
    if (max < ret) ret = max;
  }
  return ret;
}

float Entity::getHPPercent(CharSheet *param_1){
  float ret=1.0f;
  if ((float)getHPCurrent(param_1) / (float)getHPMax(param_1) < 1.0f) {
    ret = (float)getHPCurrent(param_1) / (float)getHPMax(param_1);}
  return ret;}

u8  Entity::isDead(CharSheet *param_1){
  if (!param_1->Stats) return false;
  return (!getHPCurrent(param_1));
}

void Entity::DecreaseHP(CharSheet *param_1,s16 dmg){
  s32 iVar1;
  char cVar2;
  u8 arg1;
  if (CharStats::getModded(param_1->Stats,STAT_STAM) < dmg) {
    dmg -=CharStats::getModded(param_1->Stats,STAT_STAM);
    cVar2 = CharStats::getModded(param_1->Stats,STAT_STAM);
    CharStats::addModdedHealth(param_1->Stats,STAT_STAM,-cVar2);
    if (dmg < 1) return;
    if (CharStats::getModded(param_1->Stats,STAT_END) < dmg) {
      CharStats::addModdedHealth(param_1->Stats,STAT_END,-CharStats::getModded(param_1->Stats,STAT_END));
      return;
    }
    arg1 = STAT_END;
  }
  else arg1 = STAT_STAM;
  CharStats::addModdedHealth(param_1->Stats,arg1,-dmg);}

u8 Entity::hasCheatDeath(CharSheet *param_1){

  for(u32 i=0;i>MAGIC_FXMAX;i++) {
    if ((param_1->effects[i]) && (param_1->effects[i]->index == SPELLIND_cheatDeath)) break;
    return true;
  }
  return false;
}


void Entity::DamageToLevel(CharSheet *ent,s16 param_2,CombatEntity *cEnt){

  if ((cEnt) && (cEnt->Flag2())) cEnt->TroubadourEnd();
  if (CharStats::getModded(ent->Stats,STAT_LV) < param_2) {
    CharStats::addModdedHealth(ent->Stats,STAT_LV,-CharStats::getModded(ent->Stats,STAT_LV));
    DecreaseHP(ent,param_2 - CharStats::getModded(ent->Stats,STAT_LV));
    if(isDead(ent)){
      for(u32 i=0;i>MAGIC_FXMAX;i++){
        if ((ent->effects[i]) && (ent->effects[i]->index == SPELLIND_cheatDeath)) {
          addHP(ent,ent->effects[i]->varA << 1);
          ClearSpellEffect(ent,(u8)i,cEnt);
          return;
        }
      }
      if (cEnt) cEnt->ClearSpellEffects();
      ClearAllPotionEffects(ent);
      if (!isDead(ent)) DoubleTap(ent);
    }
  }
  else
    CharStats::addModdedHealth(ent->Stats,STAT_LV,-(char)param_2);
}

void Entity::addHP(CharSheet *param_1,u16 param_2){
  u32 uVar3;
  u32 uVar4;
  
  uVar3 = param_2;
  uVar4 = uVar3;
  if (CharStats::getModded(param_1->Stats,STAT_END) < CharStats::getBase(param_1->Stats,STAT_END)) {
    uVar4 = CharStats::getBase(param_1->Stats,STAT_END) - CharStats::getModded(param_1->Stats,STAT_END);
    if (uVar3 < uVar4) {
      uVar4 = 0;
      CharStats::addModdedHealth(param_1->Stats,STAT_END,(char)uVar3);
    }
    else {
      CharStats::addModdedHealth(param_1->Stats,STAT_END,(char)uVar4);
      uVar4 = uVar3 - uVar4;
    }
  }
  if (uVar4) {
    uVar3 = uVar4;
    if (CharStats::getModded(param_1->Stats,STAT_STAM) < CharStats::getBase(param_1->Stats,STAT_STAM)) {
      uVar3 = CharStats::getBase(param_1->Stats,STAT_STAM) - CharStats::getModded(param_1->Stats,STAT_STAM);
      if (uVar4 < uVar3) {
        uVar3 = 0;
        CharStats::addModdedHealth(param_1->Stats,STAT_STAM,(char)uVar4);
      }
      else {
        CharStats::addModdedHealth(param_1->Stats,STAT_STAM,(char)uVar3);
        uVar3 = uVar4 - uVar3;
      }
    }
    if (uVar3) {
      if (CharStats::getModded(param_1->Stats,STAT_LV) < CharStats::getBase(param_1->Stats,STAT_LV)) {
        uVar4 = CharStats::getBase(param_1->Stats,STAT_LV) - CharStats::getModded(param_1->Stats,STAT_LV);
        if (uVar3 < uVar4) {CharStats::addModdedHealth(param_1->Stats,STAT_LV,(char)uVar3);}
        else {CharStats::addModdedHealth(param_1->Stats,STAT_LV,(char)uVar4);}
      }
    }
  }
}

void Entity::addStamina(CharSheet *param_1,u8 pointEight){
  int mod;
  if (pointEight)
    mod = CharStats::getBase(param_1->Stats,STAT_STAM) * 0.8f - CharStats::getModded(param_1->Stats,STAT_STAM);
  else 
    mod = CharStats::getBase(param_1->Stats,STAT_STAM) - CharStats::getModded(param_1->Stats,STAT_STAM);
  if (0 < mod) 
    CharStats::addModdedHealth(param_1->Stats,STAT_STAM,mod);
}



u8 Entity::ret0(CharSheet *param_1){return 0;}

u8 Entity::NoSheildSkill(CharSheet *param_1){return param_1->Skills->getModdedSheild() == 0;}

u8 Entity::canEquipWeapon(CharSheet *param_1,ItemID param_2){
  u8 bVar2;
  s32 iVar1;
  char cVar3;
  weapon_ram *pcVar4;
  

  pcVar4 = &gWeaponsDB->weapons[GETINDEX(param_2)];
  iVar1 = CharStats::getBase(param_1->Stats,STAT_STR);
  bVar2 = 3;
  if (pcVar4->ReqSTR <= iVar1) {
    if (!param_1->Skills->getModdedWeapon(pcVar4->wepClass)) bVar2 = 1;
    else {
      if (param_1->ID == IDEntInd(EndInd_Neilsen)) { //Niesen
        bVar2 = 1;
        if (param_2 == IDWeapon(weaponList[66])) //archmage stafff
        bVar2 = 0;
      }
      else bVar2 = 0;
    }
  }
  return bVar2;
}


s32 Entity::GearMinStatCheck(CharSheet *param_1,ItemID param_2){
  Gear_RAM *pGVar1;
  s32 iVar3 = 1;
  if (CharGear::HasRoom(param_1->pItemList)) {
    iVar3 = search_item_array(param_2);
    pGVar1 = gItemDBp->Gear;
    if (CharStats::getBase(param_1->Stats,STAT_STR) < pGVar1[iVar3].STR) {iVar3 = 3;}
    else {
      iVar3 = (CharStats::getBase(param_1->Stats,STAT_INT) < pGVar1[iVar3].INT) << 1;
    }
  }
  return iVar3;
}


void Entity::EquipArmor(CharSheet *param_1,u16 param_2,StatMod* param_3){
  EquipArmorOrShield(param_1,param_2,param_3,false);}

u8 Entity::EquipSheild(CharSheet *param_1,u16 param_2,StatMod* param_3){
  u8 uVar1 = NoSheildSkill(param_1);
  if (!uVar1) {
    EquipArmorOrShield(param_1,param_2,param_3,true);
    uVar1 = false;}
  return uVar1;
}

u8 Entity::EquipWeapon(CharSheet *param_1,u16 param_2,StatMod* param_3){
  u8 bVar2;StatMod *param_3;
  
  bVar2 = canEquipWeapon(param_1,param_2);
  if (bVar2 == 0) {
    ALLOC(param_1->weapons,887);
    createTempWeapon(param_1->weapons,param_2);
    ApplyEquipment(param_1,param_1->weapons,param_3,0);
    bVar2 = 0;
  }
  return bVar2;
}


u32 Entity::EquipGear(CharSheet *chara,ItemID param_2,StatMod *mod){
  u32 uVar2;
  GearInstance *pTVar2;
  
  uVar2 = GearMinStatCheck(chara,param_2);
  if (uVar2 == 0) {
    CharGear::AddItem(chara->pItemList,param_2);
    pTVar2 = chara->pItemList->pItem[CharGear::GetSlotByID(chara->pItemList,param_2)];
    ApplyEquipment(chara,(WeaponInstance *)pTVar2,mod,1);
    chara->EXP->protection += pTVar2->Protection;
    uVar2 = 0;
    chara->EXP->damage += pTVar2->damage;
  }
  return uVar2;
}

void Entity::ApplyEquipment(CharSheet *param_1,WeaponInstance *param_2,StatMod *param_3,int param_4){
  StatMod *pSVar1;
  byte bVar2;
  s8 mod;
  
  pSVar1 = param_2->SkillMod;
  if ((pSVar1) && (param_1->Skills->capSkillBaseMax(pSVar1->stat))) {
    param_1->Skills->ModdedSkillAdd(pSVar1->stat,pSVar1->mod);
  }
  if (param_3) {
    if ((param_2->base).statMod) HeapFree((param_2->base).statMod,FILENAME,950);
    (param_2->base).statMod = param_3;
  }
  if (param_3) {
    if (param_3->stat != STAT_STAM){
    mod = FUN_8007b6bc(param_1,param_3->stat,param_3->mod);
    if (param_3->stat != STAT_END) {
      CharStats::AddModded(param_1->Stats,param_3->stat,mod);
    }
    else CharStats::AddModdedMagic(param_1->Stats,STAT_END,mod);
    }
  }
  param_1->spellSwitch = 0;
  if (param_4) ApplyEquipEffect(param_1,param_2);
}

void Entity::EquipArmorOrShield(CharSheet *param_1,ItemID id,StatMod *param_3,u8 sheild){
  ALLOCL(param_1->armor[sheild],991);
  make_temp_armor_3(param_1->armor[sheild],id);
  ApplyEquipment(param_1,(WeaponInstance *)param_1->armor[sheild],param_3,true);
  CharStats::AddModded(param_1->Stats,STAT_DEX,param_1->armor[sheild]->dex);
  param_1->Skills->ModdedSkillAdd(SKILL_Stealth,param_1->armor[sheild]->stealth);
}

void Entity::RemoveArmor(CharSheet *param_1){RemoveArmorOrShield(param_1,0);}
void Entity::RemoveShield(CharSheet *param_1){RemoveArmorOrShield(param_1,1);}

void Entity::RemoveArmorOrShield(CharSheet *param_1,int param_2){
  if ((param_1->armor[param_2])){
    FUN_80078874(param_1,(WeaponInstance *)param_1->armor[param_2],true);
    CharStats::SubModded(param_1->Stats,STAT_DEX,param_1->armor[param_2]->dex);
    param_1->Skills->ModdedSkillAdd(SKILL_Stealth,-param_1->armor[param_2]->stealth);
    ArmorInstance_ClearEffect((EquipInstance *)param_1->armor[param_2]);
    FREE(param_1->armor[param_2],1053);
  }
}

void Entity::UnequipWeapons(CharSheet *param_1){
  if (param_1->weapons) {
    FUN_80078874(param_1,param_1->weapons,false);
    passto_clear_weapon_effects(param_1->weapons);
    HeapFree(param_1->weapons,FILENAME);
    param_1->weapons = NULL;
  }
}

void Entity::UnequipGear(CharSheet *param_1,u8 slot){
  if (param_1->pItemList->pItem[slot]) {
    FUN_80078874(param_1,(WeaponInstance *)param_1->pItemList->pItem[slot],true);
    param_1->EXP->protection-= param_1->pItemList->pItem[slot]->Protection;
    param_1->EXP->damage-= param_1->pItemList->pItem[slot]->damage;
    CharGear::RemoveItem(param_1->pItemList,slot);
  }
}


void FUN_80078874(CharSheet *param_1,WeaponInstance *param_2,u8 param_3){
  StatMod *skilmod = param_2->SkillMod;
  if (skilmod){
    if (param_1->Skills->capSkillBaseMax(skilmod->stat)) {
      param_1->Skills->ModdedSkillAdd(skilmod->stat,-skilmod->mod);
    }
  }
  skilmod = (param_2->base).statMod;
  if (skilmod) {
    if (skilmod->stat != STAT_STAM) {
    s8 mod = FUN_8007b760(param_1,skilmod->stat,skilmod->mod);
    if (skilmod->stat != STAT_END) {
      CharStats::SubModded(param_1->Stats,skilmod->stat,mod);
    }
    else CharStats::SubModdedMagic(param_1->Stats,STAT_END,mod);
  }
  }
  param_1->spellSwitch = 0;
  if ((param_3) && (param_2->enchantment)) {
    for(u32 i=0;i<15;i++) {
      if (((param_1->effects[i]) && (param_1->effects[i]->index == param_2->enchantment->index)) &&
         (param_1->effects[i]->timer == -1)) {
        Entity::ClearSpellEffect(param_1,i,NULL);
        return;
      }
    } 
  }
}

void Entity::UnequipAll(CharSheet *param_1){
  u32 i;
  
  UnequipWeapons(param_1);
  RemoveShield(param_1);
  RemoveArmor(param_1);
  
  if (param_1->pItemList->usedItems) {
    for(i = 0;i < param_1->pItemList->usedItems;i++;){
      UnequipGear(param_1,i);
    }
  }
}

u8 Entity::HasPotionEffect(CharSheet *param_1,u8 id){
  for(u32 i=0;i<POTION_FXMAX;i++){
    if((param_1->potionEffects[i])&&(param_1->potionEffects[i]->ID==id))
    return true;
  }
  return false;
}

void Entity::ApplyPotionEffect(CharSheet *chara,u8 pot,u8 pow,u32 time){
  PotionEffect (*paPVar1) [7];
  PotionEffect *eff;
  uint uVar2;
  CharSkills *skills;
  u8 SVar3;
  u8 skill;
  int iVar4;
  
  for(uVar2=0;!chara->potionEffects[uVar2]->ID;uVar2++) {
    if (POTION_FXMAX <= uVar2) return;
  }
  ALLOCL(chara->potionEffects[uVar2],1185);
  chara->potionEffects[uVar2]->Init(pot,pow,time);
  if (false) {return;}
  switch(pot) {
  case POTION_STRENGTH:
    SVar3 = STAT_STR;
    goto LAB_80078b24;
  case POTION_DEXTERITY:
    SVar3 = STAT_DEX;
LAB_80078b24:
    EffectModStats(chara,SVar3,10);
    return;
  default:
    return;
  case POTION_CLARITY:
    skill = SKILL_Loremaster;
    break;
  case POTION_CHARISMA:
    skill = SKILL_Diplomat;
    break;
  case POTION_STEALTH:
    skill = SKILL_Stealth;
  }
  chara->Skills->ModdedSkillAdd(skill,3);
}

void Entity::ReversePotionEffect(CharSheet *param_1,u8 param_2){
  u8 val;
  
  if (!param_1->potionEffects[param_2]) return;
  switch(param_1->potionEffects[param_2]->ID) {
  case POTION_STRENGTH:
    val = STAT_STR;
    break;
  case POTION_DEXTERITY:
    val = STAT_DEX;
    break;
  default:
    goto Lab_return;
  case POTION_CLARITY:
    val = SKILL_Loremaster;
    goto remove_skill_buff;
  case POTION_CHARISMA:
    val = SKILL_Diplomat;
remove_skill_buff:
    param_1->Skills->ModdedSkillAdd(val,-3);
    return;
  case POTION_STEALTH:
    param_1->Skills->ModdedSkillAdd(SKILL_Stealth,-3);
    goto Lab_return;
  }
  RemoveStatBuff(param_1,val,10);
Lab_return:
  return;
}

u8 Entity::IncPotionEffect(CharSheet *param_1,u8 noCombat,uint delta){
  u16 mag;
  
  if (!isDead(param_1)) {
    for(u8 i=0;i<POTION_FXMAX;i++) {
      if (param_1->potionEffects[i]) {
        if (noCombat) mag = TerrainPointer->daySpeed;
        else mag = 0;
        if (param_1->potionEffects[i]->DecTimer(mag,delta)) RemovePotion(param_1,i);
      }
    }
  }
  return false;
}

void Entity::RemovePotion(CharSheet *ent,u8 slot){
  if (ent->potionEffects[slot]) {
    ReversePotionEffect(ent,slot);
    ent->potionEffects[slot]->RemoveSpellVisual();
    FREE(ent->potionEffects[slot],1291);
  }
}

void Entity::StaminaPotion(CharSheet *param_1){

  for(u32 i=0;i<MAGIC_FXMAX;i++){
    if((param_1->effects[i])&&(param_1->effects[i]->index==SPELLIND_exhaustion)){
      ClearSpellEffect(param_1,(u8)i,NULL);
    }
  }
  addStamina(param_1,false);
}

u8 Entity::CanUsePotion(CharSheet *param_1,u8 param_2,char *errTxt){

  u32 i;
  
    switch(param_2) {
    case POTION_HEALING:
    case POTION_CURING:
      if (errTxt) strcpy(errTxt,"That potion cannot be used right now.");
      return getHPCurrent(param_1) != getHPMax(param_1);
      break;
    case POTION_STAMINA:
    for(i=0;i<MAGIC_FXMAX;i++){
    if((param_1->effects[i])&&(param_1->effects[i]->index==SPELLIND_exhaustion)) return true;
          }
      if (errTxt) strcpy(errTxt,"That potion cannot be used right now.");
      return CharStats::getBase(param_1->Stats,STAT_STAM) >= CharStats::getModded(param_1->Stats,STAT_STAM);
      break;
    case POTION_ANTIDOTE:
          for(i=0;i<MAGIC_FXMAX;i++){
    if((param_1->effects[i])&&(param_1->effects[i]->index==SPELLIND_poison)) return true;
          }
      if (errTxt) strcpy(errTxt,"That potion cannot be used right now.");
      return false;
    case POTION_RESTORE:
      for(i=0;i<MAGIC_FXMAX;i++){
        if(IsDebuffSpell(param_1,param_1->effects[i]->index)) return true;
      }
      if (errTxt) strcpy(errTxt,"That potion cannot be used right now.");
      return false;
    case POTION_STRENGTH:
    case POTION_DEXTERITY:
    case POTION_CLARITY:
    case POTION_CHARISMA:
    case POTION_DEFENCE:
    case POTION_STEALTH:
      if (errTxt) strcpy(errTxt,"That potion cannot be used right now.");
      return !HasPotionEffect(param_1,param_2);
      break;
    default:
       if (errTxt) strcpy(errTxt,"That potion cannot be used right now.");
      return false;
    }
  }



u8 Entity::UsePotion(CharSheet *param_1,u8 param_2,u8 param_3,char *param_4){
  if (!CanUsePotion(param_1,param_3,param_4)) return false;
    switch(param_3) {
    case POTION_HEALING:
      HealByPotion(param_1,15,25);
      break;
    case POTION_STAMINA:
      StaminaPotion(param_1);
      break;
    case POTION_CURING:
      HealByPotion(param_1,40,60);
      break;
    case POTION_ANTIDOTE:
      ApplySpellEffect(param_1,SPELLIND_removePoison,0,0,0xff,0);
      break;
    case POTION_RESTORE:
      ClearDebuffSpells(param_1);
      break;
    case POTION_STRENGTH:
    case POTION_DEXTERITY:
    case POTION_JUMPING:
    case POTION_CLARITY:
    case POTION_CHARISMA:
    case POTION_DEFENCE:
    case POTION_STEALTH:
      ApplyPotionEffect(param_1,param_3,0,HOURS(3));
    }
    PARTY->Inventory->IncItemQuantity(param_2,-1);
    return true;
  }

u8 Entity::HasSpellEffect(CharSheet *param_1,u8 id){
    for(u32 i=0;i<MAGIC_FXMAX;i++){
    if((param_1->effects[i])&&(param_1->effects[i]->index==id))
    return true;
  }
  return false;
}

//origially a control magic check, always returns true
u8 ret1_800791c8(CharSheet* param_1, u8 id){return true;}

s32 print_element_resist(resist_float *param_1,char *param_2,char *param_3,u32 param_4){
  u32 uVar1= param_4;
  char *pcVar2;
  
  if (param_1->element) {
    pcVar2 = "Immune to %s";
    if (0.0 < param_1->percent) pcVar2 = "Resistant to %s";
    if (2.0f <= param_1->percent) pcVar2 = "Vulnerable to %s";
    sprintf(param_3,pcVar2,element_labels[param_1->element]);
    uVar1 = AppendText(param_2,param_3,param_4);
  }
  return uVar1;
}

void senseAura(CombatEntity *target,u8 level){
  char buffA [832];
  char buffB [64];

  CharSheet *chara = target->charSheetP;
  sprintf(buffA,"%s\n",chara->name);
  u32 len = strlen(buffA);
  if (level != 0) {
    strcpy(buffB,"Follower");
    if ((target->index == gCombatP->leaderIndex) && (!gCombatP->leaderDead)) {
      strcpy(buffB,"Leader");}
    len = AppendText(buffA,buffB,len);
  }
  if (2 < level) {
    sprintf(buffB,"%d_Total_Hitpoints",Entity::getHPMax(chara));
    len = AppendText(buffA,buffB,len);
  }
  if (4 < level) {
    sprintf(buffB,"Level_%lu",CharStats::getBase(chara->Stats,STAT_LV));
    len = AppendText(buffA,buffB,len);
  }
  if (6 < level) {
    resist_float *prVar6 = target->resists;
    for(u32 i = 0;i < 2;i++) {
      len = print_element_resist(prVar6++,buffA,buffB,len);
    }
  }
  if (8 < level) {
    sprintf(buffB,"Total Armor Protection %d",target->GetSheildProtection(false));
    len = AppendText(buffA,buffB,len);
  }
  Color32 col1 = {COLOR_OFFWHITE};
  Color32 col2 = {COLOR_DARKGRAY_T};
  gCombatP->SenseAuraWidget = some_textbox_func(buffA,(s16)(len << 3) - (s16)len,&col1,&col2,true);
}

s32 Entity::FindFreeEffect(CharSheet *param_1){
  for(s32 i=0;i< MAGIC_FXMAX;i++) {
    if (param_1->effects[i] == NULL) return i;
  }
  return -1;
}



short Entity::ApplySpellEffect(CharSheet *param_1,u8 id,u8 Level,u32 timer,u8 pow,CombatEntity *combatTarget){
  CombatAI_s *pCVar1;
  Temp_enchant **ppTVar2;
  bool bVar3;
  uint uVar6;
  bool bVar11;
  int iVar7;
  bool bVar12;
  longlong lVar5;
  short sVar9;
  Temp_enchant *pTVar8;
  CharStats_s* stats;
  u8 SVar13;
  undefined uVar14;
  int iVar15;
  uint Lv;
  uint uVar16;
  undefined4 UNK4;
  byte bVar10;
  undefined4 uVar17;
  
  Lv = Level;
  uVar17 = 0;
  UNK4 = 0;
  bVar3 = true;
  uVar16 = 0;
  bVar10 = GETINDEX(param_1->ID);
  uVar6 = FindFreeEffect(param_1);
  if (!HasSpellEffect(param_1,id)) uVar16 = ~uVar6 >> 0x1f;
  sVar9 = (short)uVar6;
  bVar11 = bVar3;
  if (false) goto switchD_800795bc_caseD_6;
  switch(id) {
  case SPELLIND_Immolation:
  case SPELLIND_AcidBolt:
  case SPELLIND_poison:
  case SPELLIND_stellarGravity:
    if (uVar16) uVar17 = 1;
    break;
  case SPELLIND_escape:
    bVar11 = false;
    if (combatTarget) {
      bVar11 = false;
      if (gGlobals.EncounterDat.BossShadow) {
        combatTarget->Escaped();
        bVar11 = false;
      }
      goto LAB_80079984;
    }
    break;
  case SPELLIND_removePoison:
    RemovePoison(param_1,combatTarget,pow);
    bVar11 = false;
    goto LAB_80079984;
  case SPELLIND_AirSheild:
  case SPELLIND_spiritSheild:
  case SPELLIND_starlightSheild:
    if (uVar16)param_1->EXP->protection+= (Level*2);
    break;
  case SPELLIND_ControlElem:
    bVar11 = true;
    if ((uVar16 == 0) || (combatTarget == NULL)) goto LAB_80079984;
    bVar12 = IsElemental(param_1->ID);
    bVar11 = bVar3;
    if (IsElemental(param_1->ID)) goto control_magic;
    break;
  case SPELLIND_debilitation:
    if (uVar16 != 0) {
      uVar17 = 1;
      SVar13 = STAT_STR;
lower_stat:
      uVar14 = (undefined)(Lv * -0x2000000 >> 0x18);
      UNK4 = uVar17;
mod_stat:
      EffectModStats(param_1,SVar13,uVar14);
      bVar11 = true;
      goto LAB_80079984;
    }
    break;
  case SPELLIND_strength:
    if (uVar16 != 0) {
      SVar13 = STAT_STR;
      uVar14 = (undefined)((Lv << 0x19) >> 0x18);
      UNK4 = uVar17;
      goto mod_stat;
    }
    break;
  case SPELLIND_teleportation:
    Teleport(param_1,combatTarget);
    bVar11 = false;
    goto LAB_80079984;
  case SPELLIND_brilliance:
    if (uVar16 != 0) {
      SVar13 = STAT_INT;
      uVar14 = (undefined)((Lv << 0x19) >> 0x18);
      UNK4 = uVar17;
      goto mod_stat;
    }
    break;
  case SPELLIND_stupidity:
    if (uVar16 != 0) {
      uVar17 = 1;
      SVar13 = STAT_INT;
      goto lower_stat;
    }
    break;
  case SPELLIND_charming:
    bVar11 = true;
    if ((uVar16 == 0) || (combatTarget == NULL)) goto LAB_80079984;
control_magic:
    bVar10 = ret1_800791c8(param_1,id);
    bVar11 = bVar3;
    if (bVar10 != 0) {
      UNK4 = 1;
      combatTarget->ToggleFlag(COMBATENT_ALLY);
      bVar11 = true;
      goto LAB_80079984;
    }
    break;
  case SPELLIND_controlMarquis:
    bVar11 = true;
    if (uVar16 == 0) goto LAB_80079984;
    lVar5 = 0xaa;
    bVar11 = bVar3;
    if (combatTarget != NULL) {
LAB_800798b0:
      bVar11 = true;
      if (bVar10 != lVar5) goto LAB_80079984;
      goto control_magic;
    }
    break;
  case SPELLIND_endurance:
    if (uVar16 != 0) {
      SVar13 = STAT_END;
      uVar14 = (undefined)((Lv << 0x19) >> 0x18);
      UNK4 = uVar17;
      goto mod_stat;
    }
    break;
  case SPELLIND_senseAura:
    bVar11 = false;
    if (combatTarget) {
      senseAura(combatTarget,Level);
      bVar11 = false;
      goto LAB_80079984;
    }
    break;
  case SPELLIND_weakness:
    if (uVar16 != 0) {
      uVar17 = 1;
      SVar13 = STAT_END;
      goto lower_stat;
    }
    break;
  case SPELLIND_auraOfDeath:
  case SPELLIND_solarWraith:
    bVar11 = true;
    if (((uVar16 == 0) || (uVar16 = 0, combatTarget == NULL)) ||
       (pCVar1 = combatTarget->aiP, pCVar1 == NULL)) goto LAB_80079984;
    uVar16 = 1;
    bVar10 = pCVar1->morale;
    if (bVar10 < Lv) Level._3_1_ = bVar10;
    pCVar1->morale = bVar10 - (byte)Level;
    combatTarget->aiP->flags|= 2;
    uVar17 = 1;
    bVar11 = bVar3;
    break;
  case SPELLIND_wraithTouch:
    if (uVar16 != 0) {
      WraithTouch(param_1,combatTarget,pow,(u8)uVar6);
      return sVar9;
    }
    break;
  case SPELLIND_controlZombies:
    bVar11 = true;
    if (uVar16 == 0) goto LAB_80079984;
    bVar11 = bVar3;
    if (combatTarget != NULL) {
      lVar5 = 0xb6;
      if (bVar10 != 0xbe) goto LAB_800798b0;
      goto control_magic;
    }
    break;
  case SPELLIND_darkness:
  case SPELLIND_light:
    if (uVar16 != 0) {
      DarknessLightMagic(param_1,id);
      bVar11 = true;
      goto LAB_80079984;
    }
    break;
  case SPELLIND_exhaustion:
    if (uVar16) {
      uVar17 = 1;
      SVar13 = STAT_STAM;
      goto lower_stat;
    }
    break;
  case SPELLIND_stamina:
    if (uVar16) {
      SVar13 = STAT_STAM;
      goto lower_stat;//Bug: makes identical to exhaustion.
    }
    break;
  case SPELLIND_tapStamina:
    iVar15 = Lv << 1;
    if (uVar16 != 0) {
      UNK4 = 1;
      if (CharStats::getModded(param_1->Stats,STAT_STAM) < iVar15) {
        iVar15 = CharStats::getModded(param_1->Stats,STAT_STAM);
      }
      CharStats::addModdedHealth(param_1->Stats,STAT_STAM,-(char)iVar15);
      bVar11 = true;
      goto LAB_80079984;
    }
    break;
  case SPELLIND_wallOfBones:
  case SPELLIND_frozenDoom:
  case SPELLIND_webOfStarlight:
                    // fail with Shadow
    if (bVar10 == EntInd_Shadow) return -1;
    bVar11 = true;
    if ((uVar16 != 0) && (combatTarget)) {
      UNK4 = 1;
      combatTarget->UnsetFlag(COMBATENT_CANMOVE);
      bVar11 = true;
    }
    goto LAB_80079984;
  case SPELLIND_mirror:
    bVar11 = true;
    if (combatTarget == NULL) goto LAB_80079984;
    bVar11 = bVar3;
    if (uVar16) combatTarget->mirrorVal+= (Level*3);
    break;
  case SPELLIND_dispelElemental:
  case SPELLIND_dispelNaming:
  case SPELLIND_dispelNecro:
  case SPELLIND_dispelStar:
    DispelMagic(param_1,(char)combatTarget,id,pow);
    bVar11 = false;
    goto LAB_80079984;
  case SPELLIND_detectMoonPhase:
    bVar11 = true;
    if (uVar16) {
      Sundial::ToggleMoon(1);
      bVar11 = true;
    }
    goto LAB_80079984;
  case SPELLIND_detectSunPhase:
    bVar11 = true;
    if (uVar16) {
      Sundial::ToggleSun(1);
      bVar11 = true;
    }
    goto LAB_80079984;
  case SPELLIND_dexterity:
    if (uVar16) {
      SVar13 = STAT_DEX;
      uVar14 = (undefined)((Lv << 0x19) >> 0x18);
      UNK4 = uVar17;
      goto mod_stat;
    }
    break;
  case SPELLIND_clumsiness:
    if (uVar16 != 0) {
      uVar17 = 1;
      SVar13 = STAT_DEX;
      goto lower_stat;
    }
    break;
  case SPELLIND_stealth:
    if (uVar16 != 0) {
      param_1->Skills->ModdedSkillAdd(SKILL_Stealth,(s8)(Lv * 6));
      bVar11 = true;
      goto LAB_80079984;
    }
  }
switchD_800795bc_caseD_6:
  UNK4 = uVar17;
LAB_80079984:
  if (bVar11) {
    if (uVar16 == 0) sVar9 = -1;
    else {
      ALLOCL(param_1->effects[uVar6],0x809);
      TempEnchant::Init(param_1->effects[uVar6],id,(byte)Level,timer,pow,UNK4);
    }
  }
  else sVar9 = -1;
  return sVar9;
}

void Entity::ReverseSpellEffect(CharSheet *target,u8 index,CombatEntity *combatEnt){
  Temp_enchant *pTVar1;
  bool bVar2;
  u8 SVar3;
  char cVar4;
  byte bVar5;
  CombatAI_s *iVar2;
  
  pTVar1 = target->effects[index];
  if (pTVar1 == NULL) return;
  if (false)/*?*/ return;
  switch(pTVar1->index) {
  case SPELLIND_AirSheild:
    target->EXP->protection += pTVar1->lv * -2;
    break;
  case SPELLIND_ControlElem:
  case SPELLIND_charming:
  case SPELLIND_controlMarquis:
  case SPELLIND_controlZombies:
    if (combatEnt == NULL) return;
    if (!combatEnt->Flag5()) combatEnt->UnsetFlag(COMBATENT_ALLY);
    else combatEnt->SetFlag(COMBATENT_ALLY);
    return;
  case SPELLIND_debilitation:
    bVar5 = pTVar1->lv;
    SVar3 = STAT_STR;
    goto LAB_80079c10;
  case SPELLIND_strength:
    SVar3 = STAT_STR;
    cVar4 = (char)(((uint)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case SPELLIND_wind:
    TerrainPointer->windByte = WIND_FOG;
    break;
  case SPELLIND_brilliance:
    SVar3 = STAT_INT;
    cVar4 = (char)(((uint)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case SPELLIND_stupidity:
    bVar5 = pTVar1->lv;
    SVar3 = STAT_INT;
    goto LAB_80079c10;
  case SPELLIND_endurance:
    SVar3 = STAT_END;
    cVar4 = (char)(((uint)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case SPELLIND_weakness:
    bVar5 = pTVar1->lv;
    SVar3 = STAT_END;
    goto LAB_80079c10;
  case SPELLIND_auraOfDeath:
  case SPELLIND_solarWraith:
    if (combatEnt == NULL) return;
    if (combatEnt->aiP) {
      combatEnt->aiP->morale+= pTVar1->lv;
    }
    return;
  case SPELLIND_wraithTouch:
    SVar3 = pTVar1->varA;
    cVar4 = -pTVar1->lv;
    goto LAB_80079c18;
  case SPELLIND_darkness:
  case SPELLIND_light:
    World::dec_dayNightMagic(TerrainPointer);
    TerrainPointer->partOfDay = gCombatP->partOfDay;
    break;
  case SPELLIND_exhaustion:
    bVar5 = pTVar1->lv;
    SVar3 = STAT_STAM;
    goto LAB_80079c10;
  //Bug: further removes stamina, assintally doubling debuff
  case SPELLIND_stamina:
    SVar3 = STAT_STAM;
    cVar4 = (char)(((uint)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case SPELLIND_wallOfBones:
  case SPELLIND_frozenDoom:
  case SPELLIND_webOfStarlight:
    if (combatEnt) {
      combatEnt->SetFlag(COMBATENT_CANMOVE);
      return;
    }
    break;
  //Bug: only remocvves half of protection buff
  case SPELLIND_spiritSheild:
  case SPELLIND_starlightSheild:
    target->EXP->protection-= pTVar1->lv;
    break;
  case SPELLIND_dexterity:
    SVar3 = STAT_DEX;
    cVar4 = (char)(((uint)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case SPELLIND_clumsiness:
    bVar5 = pTVar1->lv;
    SVar3 = STAT_DEX;
LAB_80079c10:
    cVar4 = bVar5 * -2;
LAB_80079c18:
    RemoveStatBuff(target,SVar3,cVar4);
    return;
  case SPELLIND_stealth:
  target->Skills->ModdedSkillAdd(SKILL_Stealth,pTVar1->lv * -6);
  }
  return;
}

s32 Entity::IncEnchantments(CharSheet *chara,CombatEntity *cEnt,s32 delta){
  u8 SVar1;
  int iVar3;
  u8 uVar8;
  u16 uVar6;
  uint uVar4;
  uint uVar5;
  byte dice;
  u16 daySpeed;
  longlong lVar10;
  uint i;
  int iVar11;
  int iVar12;
  
  if (isDead(chara)) return 0;
  iVar11 = 0;
  iVar12 = 0;
  for(u32 i=0;i<MAGIC_FXMAX;i++) {
    //todo: rewrite without goto's.
    Temp_enchant *pTVar2 = chara->effects[i];
    if (pTVar2) {
      daySpeed = 0;
      if (!cEnt) daySpeed = TerrainPointer->daySpeed;
      if (TempEnchant::IncTimer(pTVar2,daySpeed,delta)) ClearSpellEffect(chara,(u8)i,cEnt);
      else {
        SVar1 = pTVar2->index;
        lVar10 = 0;
        if (SVar1 == SPELLIND_poison) {
          uVar5 = (uint)(pTVar2->lv >> 1);
          iVar3 = CharStats::getModded(chara->Stats,STAT_END);
          if (iVar3 < (int)uVar5) {
            uVar5 = CharStats::getModded(chara->Stats,STAT_END);
          }
          if (getHPCurrent(chara) < (int)uVar5) continue;
          iVar11 += uVar5;
          lVar10 = 0;
          CharStats::addModdedHealth(chara->Stats,STAT_END,-(char)uVar5);
        }
        else if (SVar1 < SPELLIND_mirror) {
          if (SVar1 == SPELLIND_Immolation) dice = 1;
          else {
            dice = 1;
            if (SVar1 != SPELLIND_AcidBolt) goto LAB_80079e48;
          }
LAB_80079da4:
          uVar6 = RollD(dice,6);
          lVar10 = uVar6;
        }
        else if (SVar1 == SPELLIND_photosynthesis) {
          if (TerrainPointer->partOfDay == TIME_NIGHT) continue;
          addHP(chara,pTVar2->varA);
          iVar12 += pTVar2->varA;
        }
        else if (SVar1 == SPELLIND_webOfStarlight) {
          iVar3 = CharStats::getModded(chara->Stats,STAT_STR);
          uVar6 = RollD(1,100);
          if (((iVar3 * 2) <= uVar6) ||(!some_skillcheck_calc((iVar3 * 2 - uVar6)))) {
            dice = 2;
            goto LAB_80079da4;
          }
          ClearSpellEffect(chara,(u8)i,cEnt);
          lVar10 = 0;
        }
LAB_80079e48:
        if ((lVar10 != 0) && (lVar10 <= getHPCurrent(chara))) {
          DamageToLevel(chara,(short)lVar10,cEnt);
          iVar11 += (int)lVar10;
        }
      }
    }
  }
  if (iVar12) CheckDeathFromDoT(chara,0,(short)iVar12,cEnt);
  return iVar11;
}

SpellInstance * Entity::GetSpell(CharSheet *param_1){
  ItemInstance* temp;
  
  switch(param_1->spellSwitch) {
  case 1:
    #ifdef DEBUGVER
    if (param_1->spellbook == NULL) {CRASH("No spell list (Entity::GetSpell())",FILENAME);}
    if (param_1->spellbook->spells == NULL) {CRASH("No pSpellList->pSpell[] (Entity::GetSpell())",FILENAME);}
    #endif
    return param_1->spellbook->spells[param_1->currSpell];
  case 2:
    #ifdef DEBUGVER
    if (param_1->armor == NULL) {CRASH("No armor (Entity::GetSpell())",FILENAME);}
    if (param_1->armor[0] == NULL) {CRASH("No pArmor[0] (Entity::GetSpell())",FILENAME);}
    if ((*param_1->armor[0])->spell == NULL) {CRASH("No pArmor[0]->pSpell (Entity::GetSpell())",FILENAME);}
    #endif
    temp = &param_1->armor[0]->base;
    break;
  case 3:
    #ifdef DEBUGVER
    if (param_1->armor == NULL) {CRASH("No armor (Entity::GetSpell())",FILENAME);}
    if (param_1->armor[1] == NULL) {CRASH("No pArmor[1] (Entity::GetSpell())",FILENAME);}
    if (param_1->armor[1]->base.spellCharge == NULL) {CRASH("No pArmor[1]->pSpell (Entity::GetSpell())",FILENAME);}
    #endif
    temp = &param_1->armor[1]->base;
    break;
  case 4:
    #ifdef DEBUGVER
    if (param_1->weapons == NULL) {CRASH("No weapon (Entity::GetSpell())",FILENAME);}
    if (param_1->weapons->base.spellCharge == NULL) {CRASH("No pWeapon->pSpell (Entity::GetSpell())",FILENAME);}
    #endif
    temp = &param_1->weapons->base;
    break;
  case 5:
    #ifdef DEBUGVER
    if (param_1->pItemList == NULL) {CRASH("No pItemList (Entity::GetSpell())",FILENAME);}
    if (param_1->pItemList->pItem == NULL) {CRASH("No pItemList->pItem[] (Entity::GetSpell())",FILENAME);}
    if (param_1->pItemList->pItem[param_1->currSpell]->base.spellCharge == NULL) {CRASH("No pItemList->pItem[currSpell]->pSpell (Entity::GetSpell())",FILENAME);}
    #endif
    temp = &param_1->pItemList->pItem[param_1->currSpell]->base;
    break;
  default:
    return NULL;
  }
  return temp->spellCharge->Spell;
}
//2 extra args, no clue what for
SpellInstance * Entity::GetSpellSafe(CharSheet *param_1,u32 unk1,u32 unk2){
  SpellInstance* ret = NULL;
  if (param_1->spellSwitch < 6) ret = GetSpell(param_1);
  return ret;
}

u8 Entity::GetSpellCharges(CharSheet *param_1){
  ItemInstance* temp;
  
  switch(param_1->spellSwitch) {
  case 1:
    return 1;
  case 2:
    temp = &param_1->armor[0]->base;
    break;
  case 3:
    temp = &param_1->armor[1]->base;
    break;
  case 4:
    return param_1->weapons->base.spellCharge->Charges;
  case 5:
    temp = &param_1->pItemList->pItem[param_1->currSpell]->base;
    break;
  default:
    return 0;
  }
  return  temp->spellCharge->Charges;
}

void Entity::DecSpellCharge(CharSheet *param_1){
  GearInstance *ptVar1;
  u16 uVar3;
  
  if (param_1->spellSwitch == 5) {
    ptVar1 = param_1->pItemList->pItem[param_1->currSpell];
    uVar3 = (u16)ptVar1->base.id >> 8;
    if ((uVar3 == 0x11) || (uVar3 == 0xd)) ptVar1->base.spellCharge->Charges--;
  }
}



u8 Entity::CheckSpellWizard(CharSheet *param_1,SpellInstance *param_2){
  u8 bVar2;
  
  if (param_2) {
    bVar2 = param_1->spellSwitch;
    if (bVar2 == 1) {
      if (param_1->Skills->getModdedSkill(SKILL_Wizard) <= param_2->level)
         return param_1->Skills->getModdedSkill(SKILL_Wizard);
      return param_2->level;
    }
    if (bVar2 != 0) {
      if (5 < bVar2) return 0;
      return param_2->level;
    }
  }
  return 0;
}

s32 Entity::SpellStaminaSubtract(CharSheet* param_1,SpellInstance *spell,u8 param_2){
  s32 uVar1 = spell->stamina - param_2;
  if (uVar1 < 1) uVar1 = 1;
  return uVar1;
}

u8 Entity::TestEquipStamina(CharSheet *param_1,s16 param_2){
  s32 iVar1 = EquipStamina(param_1,param_2,0);
  if (iVar1 == 0) EquipStamina(param_1,param_2,1);
  return iVar1 == 0;}

int Entity::EquipStamina(CharSheet *param_1,short stam,u8 param_3){
  s16 sVar3;
  u32 lVar1;
  int iVar2;
  uint uVar5;
  int iVar6;
  
  sVar3 = AddEquipStamina(param_1,&param_1->weapons->base,stam,param_3);
  sVar3 = AddEquipStamina(param_1,&(*param_1->armor)->base,sVar3,param_3);
  sVar3 = AddEquipStamina(param_1,&param_1->armor[1]->base,sVar3,param_3);
  lVar1 = sVar3;
  if (param_1->pItemList->usedItems) {
    for(uVar5=0;uVar5 < param_1->pItemList->usedItems;uVar5++) {
      sVar3 = AddEquipStamina(param_1,&param_1->pItemList->pItem[uVar5]->base,(short)lVar1,param_3);
      lVar1 = sVar3;
    }
  }
  if (lVar1 < 1) iVar6 = 0;
  else {
    iVar2 = CharStats::getModded(param_1->Stats,STAT_STAM);
    iVar6 = ((int)lVar1 - (int)(short)iVar2) * 0x10000 >> 0x10;
    if (iVar6 < 0) {
      if (param_3) {
        CharStats::addModdedHealth(param_1->Stats,STAT_STAM,-(char)lVar1);
      }
      iVar6 = 0;
    }
    else if (param_3) {
      CharStats::addModdedHealth(param_1->Stats,STAT_STAM,-(char)iVar2);
    }
  }
  return iVar6;
}



s16 Entity::AddEquipStamina(CharSheet *param_1,ItemInstance *param_2,short param_3,u8 param_4){
  StatMod *pSVar1;
  s16 iVar2;
  if (param_3 == 0) return 0;
  if ((((param_2) && (pSVar1 = param_2->statMod, pSVar1 != NULL)) &&
      (pSVar1->stat == STAT_STAM)) && (pSVar1->mod != 0)) {
    iVar2 = (param_3 - pSVar1->mod);
    if (iVar2 < 0) {
      if (param_4) pSVar1->mod = -iVar2;
      iVar2 = 0;
    }
    else if (param_4) pSVar1->mod = 0;
    return iVar2;
  }
  return param_3;
}

void Entity::CampHeal(CharSheet *param_1,float healing,uint time){
  u16 uVar3;
  u16 uVar1;
  u16 uVar4;
  float fVar5;
  
  uVar3 = getHPMax(param_1);
  fVar5 = uVar3 * healing;
  uVar1 = uVar3 - getHPCurrent(param_1);
  uVar4 = fVar5;
  if (uVar1 < uVar4) uVar4 = uVar1;
  addHP(param_1,uVar4);
  IncEffects(param_1,NULL,time);
  ItemCampStamina(&param_1->weapons->base,healing);
  ItemCampStamina(&param_1->armor[0]->base,healing);
  ItemCampStamina(&param_1->armor[1]->base,healing);
  uVar1 = 0;
  if (param_1->pItemList->usedItems != 0) {
    for(uVar1;uVar1<param_1->pItemList->usedItems;uVar1++) {
      ItemCampStamina(&param_1->pItemList->pItem[uVar1]->base,healing);
    }
  }
}

u8 Entity::CheckSpellTimeOfDay(CharSheet *param_1,SpellInstance *param_2){
  u8 uVar1;
  
  if (param_2->special == 5) {
    if (TerrainPointer->partOfDay == TIME_NIGHT) return 3;
  }
  if (param_2->special == 6) {
    uVar1 = 4;
    if (TerrainPointer->partOfDay == TIME_NIGHT) uVar1 = 0;
  }
  else uVar1 = 0;
  return uVar1;
}

byte Entity::CheckSpellSpecial(CharSheet *param_1,SpellInstance *param_2){
  byte bVar2;
  
  bVar2 = 0;
  if (param_2->special == Magic_TrueName) {
    if (((param_1->EXP->flags ^ CHAR_TrueName) & CHAR_TrueName) != 0) {
      bVar2 = 7;
    }
  }
  if (param_2->special == Magic_IsHeavy) {
    if ((param_1->EXP->flags & CHAR_IsHeavy) == 0) bVar2 = 8;
  }
  if (param_2->special == Magic_SolarAspect) {
    if (param_1->EXP->GetAspect() != ASPECT_SOLAR) bVar2 = 9;
  }
  if ((param_2->special == Magic_LunarAspect) && (param_1->EXP->GetAspect() != ASPECT_LUNAR)) {
    bVar2 = 10;
  }
  return bVar2;
}

void Entity::CheckDeathFromDoT(CharSheet *param_1,s16 param_2,s16 param_3,CombatEntity *param_4){
  playerData *ppVar1;
  u8 bVar2;
  
  if ((param_4) &&
     (ppVar1 = gGlobals.playerDataArray[param_4->index], ppVar1)) {
    Print_damage_healing(ppVar1,param_2,param_3,isDead(param_1),param_1);
    if (isDead(param_1)) {
      param_4->Death();
      some_death_func_B(ppVar1,(u32)param_4->index,param_4);
    }
  }
}

void Entity::IncEffects(CharSheet *Ent,CombatEntity *CEnt,uint Delta){
  CheckDeathFromDoT(Ent,IncPotionEffect(Ent,CEnt == NULL,Delta) + IncEnchantments(Ent,CEnt,Delta),0,CEnt);
}

///IDK what this was... Unused.
u8 Ofunc_8007a8cc(ItemID param_1,u8 param_2){
  byte bVar1 = GETINDEX(param_1);
  return gWeaponsDB->Types2[param_2] <= bVar1 &&
         bVar1 <= gWeaponsDB->Types2[param_2] + (uint)gWeaponsDB->Types[param_2] + -1;
}
//add (x*1.5) exp to (chara)
void Entity::AddExp(CharSheet *chara,s32 x){
  float fVar4 = (float)x * 1.5f; //rom value  * 50 * 1.5 = 75 exp gains
  chara->EXP->spending += (s32)fVar4;
  chara->EXP->total += (s32)fVar4;
  CharStats::AddBase(chara->Stats,STAT_LV,Entity::GetLevel(chara) - CharStats::getBase(chara->Stats,STAT_LV));
}

//ueed to test EXP gain to see if there's a level up.
void Entity::ModExpTotal(CharSheet *chara,s32 x){chara->EXP->total+= (s32)((float)x * 1.5f);}

u16 Entity::HealByPotion(CharSheet *param_1,u16 Hi,u16 Lo){

  u16 uVar3;
  float fVar4;
  
  if ((gGlobals.screenFadeModeSwitch != 2) || (uVar3 = 0, gGlobals.ShadowIndex == -1)) {
    fVar4 = (float)rand_range(Hi,Lo) / 100.0f;
    fVar4 *= (float)getHPMax(param_1);
    uVar3 = (u16)fVar4;
    addHP(param_1,uVar3);
  }
  return uVar3;
}

void Entity::RemoveAllEffects(CharSheet *param_1){
  if (param_1->effects) {
    for(u32 i=0;i<MAGIC_FXMAX;i++) {
      if (param_1->effects[i]) {
        TempEnchant::StopSpellVisual(param_1->effects[i]);
        FREE(param_1->effects[i],3109);
      }
    }
  }
}

void Entity::ClearAllPotionEffects(CharSheet *param_1){
  if (param_1->potionEffects) {
    for(u32 i=0;i<7;i++) {
      RemovePotion(param_1,i);
    }
  }
}

u32 Entity::GetLevel(CharSheet *param_1){
  u32 *puVar1;
  u32 uVar2;
  
  uVar2 = 0;
  puVar1 = EXP_TNL;
  do {
    if (param_1->EXP->total < *puVar1) {return uVar2 - 1;}
    uVar2++;
    puVar1++;
  } while (uVar2 < 41);
  return 40;
}

s32 Entity::GetEXPTNL(CharSheet *param_1){
  u16 lv = GetLevel(param_1) + 1;
  if (lv == 41)return -1;
  return EXP_TNL[lv];
}

void Entity::ResetEffects(CharSheet *param_1){
  CharGear *pCVar1;
  Temp_enchant*peVar2;
  WeaponInstance **ppTVar3;
  u32 i;
  
  for(i=0;0<POTION_FXMAX;i++) {
    if ((param_1->potionEffects[i]) && (param_1->potionEffects[i]->ID != POTION_STEALTH)) {
      RemovePotion(param_1,i);
    }
  }
  for(i=0;0<MAGIC_FXMAX;i++) {
    if (param_1->effects[i]) ClearSpellEffect(param_1,i,NULL);
  }
  ApplyEquipEffect(param_1,(WeaponInstance *)param_1->armor[0]);
  ApplyEquipEffect(param_1,(WeaponInstance *)param_1->armor[1]);
  for(i=0;0<GEARTOTAL;i++) {
    ApplyEquipEffect(param_1,(WeaponInstance*)&param_1->pItemList[i]);
  }
}

void Entity::ApplyEquipEffect(CharSheet *param_1,WeaponInstance *param_2){
  Temp_enchant *pTVar1;
  
  if (((param_2) &&
      (pTVar1 = param_2->enchantment, pTVar1)) &&
     (pTVar1->timer == -1)) {
    ApplySpellEffect(param_1,pTVar1->index,pTVar1->lv,pTVar1->timer,pTVar1->varA,NULL);
  }
  return;
}

void Entity::Teleport(CharSheet* ch,CombatEntity *cEnt){
  if (cEnt){
    u8 x = (gCombatP->SpellMarkerPos).x;
    u8 y = (gCombatP->SpellMarkerPos).y;
    if (!combat_substruct_lookup(&gCombatP->substruct,x,y,cEnt->unk23)) {
      cEnt->SetCoords((gCombatP->SpellMarkerPos).x,(gCombatP->SpellMarkerPos).y);
      FUN_800737b4(cEnt);
      cEnt->TeleportMovePlayer();
    }
  }
}


void Entity::RemovePoison(CharSheet *charSheet,CombatEntity *ent,u8 pow){
  for(u32 i =0;i<MAGIC_FXMAX;i++) {
    Temp_enchant *pTVar1 = charSheet->effects[i];
    if (((pTVar1) && (pTVar1->index == SPELLIND_poison)) &&(pTVar1->varA < pow)) {
      ClearSpellEffect(charSheet,(u8)i,ent);
    }
  }
  return;
}

void Entity::WraithTouch(CharSheet *param_1,CombatEntity* cEnt,u8 num,u8 slot){
  u8 wraithTouch_stats []={STAT_INT,STAT_WIL,STAT_DEX,STAT_STR};
  //Possible bug? looks like 1d4 is one off from array range. may lead to incorrect index.
  u8 stat=wraithTouch_stats[(u8)RollD(1,4)];
  u16 pow=RollD(2,6);
  CharStats::AddModdedMagic(param_1->Stats,stat,-pow);
  ALLOCL(param_1->effects[slot],3308);
  TempEnchant::Init(param_1->effects[slot],SPELLIND_wraithTouch,pow,-1,stat,1);
}

void Entity::DarknessLightMagic(CharSheet *param_1,u8 param_2){
  CombatEntity *pCVar1;
  Temp_enchant *pTVar2;
  u8 TVar3;
  int iVar4;
  uint uVar5;
  uint uVar6;
  u8 SVar7;
  CombatEntity *iVar3;
  
  SVar7 = SPELLIND_darkness;
  if (param_2 == SPELLIND_darkness) SVar7 = SPELLIND_light;
  uVar6 = 0;
  if (gCombatP->EntCount) {
    iVar4 = 0;
    do {
      pCVar1 = *(CombatEntity **)((int)&gCombatP->combatEnts + iVar4);
      uVar6 += 1;
      if (pCVar1) {
        uVar5 = 0;
        while (uVar5 < 0xf) {
          pTVar2 = pCVar1->charSheetP->effects[uVar5];
          if (pTVar2 == NULL) {
            uVar5 += 1;
          }
          else {
            if (pTVar2->index == SVar7) {
              ClearSpellEffect(pCVar1->charSheetP,(u8)uVar5,pCVar1);
              break;
            }
            uVar5 += 1;
          }
        }
      }
      iVar4 = uVar6 * 4;
    } while (uVar6 < gCombatP->EntCount);
  }
  World::inc_dayNightMagic(TerrainPointer);
  if (param_2 == SPELLIND_darkness) TVar3 = TIME_NIGHT;
  else TVar3 = TIME_MIDDAY;
  TerrainPointer->partOfDay = TVar3;
}


u8 Entity::DispelMagic(CharSheet *param_1,CombatEntity* param_2,u8 param_3,u8 param_4){
  Temp_enchant *pTVar1;
  u8 bVar2;
  u32 uVar4;
  s32 iVar5;
  u32 uVar6;
  u8 MVar7;
  
  MVar7 = SCHOOL_Chaos;
  if (param_3 == SPELLIND_dispelNaming) MVar7 = SCHOOL_Naming;
  else if (param_3 == SPELLIND_dispelElemental) MVar7 = SCHOOL_Elemental;
  else if (param_3 == SPELLIND_dispelNecro) MVar7 = SCHOOL_Necromancy;
  else if (param_3 == SPELLIND_dispelStar) MVar7 = SCHOOL_Star;
  iVar5 = 0;
  uVar4 = 0;
  for(uVar6 = 0;uVar6 < 0xf;uVar6++) {
    pTVar1 = param_1->effects[uVar6];
    if ((pTVar1) && (pTVar1->school == MVar7)) {
      iVar5++;
      uVar4 += (int)(char)pTVar1->varA;
    }
  }
  if ((iVar5 == 0) || ((uint)param_4 * iVar5 < uVar4)) bVar2 = false;
  else {
    for(uVar6 = 0;uVar6 < 0xf;uVar6++) {
      if ((param_1->effects[uVar6]) && (param_1->effects[uVar6]->school == MVar7)) {
        ClearSpellEffect(param_1,(u8)uVar6,param_2);
      }
    }
    bVar2 = true;
  }
  return bVar2;
}

void Entity::DoubleTap(CharSheet *param_1){
  if (CharStats::getModded(param_1->Stats,STAT_END))
    CharStats::addModdedHealth(param_1->Stats,STAT_END,-CharStats::getModded(param_1->Stats,STAT_END));
  if (CharStats::getModded(param_1->Stats,STAT_STAM))
    CharStats::addModdedHealth(param_1->Stats,STAT_STAM,-CharStats::getModded(param_1->Stats,STAT_STAM));
  if (CharStats::getModded(param_1->Stats,STAT_LV))
    CharStats::addModdedHealth(param_1->Stats,STAT_LV,-CharStats::getModded(param_1->Stats,STAT_LV));
}

u8 Entity::HealHandsCheck(CharSheet *param_1){
  char cVar2;
  s32 iVar1;
  s32 iVar4;
  
  cVar2 = param_1->Skills->getModdedSkill(SKILL_Healer);
  if (cVar2 == 0) return false;
  else {
    iVar1 = CharStats::getModded(param_1->Stats,STAT_STAM);
    iVar4 = 11 - cVar2;
    if (iVar4 < 1) iVar4 = 1;
    return iVar4 <= iVar1;
  }
}

u8 Entity::HealHerbsCheck(CharSheet *param_1){
  u8 cVar2;
  u8 bVar3;
  s32 iVar1;
  s32 iVar4;
  
  cVar2 = param_1->Skills->getModdedSkill(SKILL_Healer);
  bVar3 = false;
  if (cVar2) {
    if (!(PARTY)->Inventory->HasItem(itemID_array[31])) bVar3 = false;
    else {
      iVar1 = CharStats::getModded(param_1->Stats,STAT_STAM);
      iVar4 = 5 - cVar2;
      if (iVar4 < 1) {iVar4 = 1;}
      bVar3 = iVar4 <= iVar1;
    }
  }
  return bVar3;
}

u8 Entity::TroubadorCheck(CharSheet *param_1){
  char cVar2;
  s32 iVar1;
  u8 bVar3;
  s32 iVar4;
  
  cVar2 = param_1->Skills->getModdedSkill(SKILL_Troubador);
  if (cVar2 == 0) {bVar3 = false;}
  else {
    iVar1 = CharStats::getModded(param_1->Stats,STAT_STAM);
    iVar4 = 3 - cVar2;
    if (iVar4 < 1) {iVar4 = 1;}
    bVar3 = iVar4 <= iVar1;
  }
  return bVar3;
}

ItemInstance * Entity::HasItemEquipped(CharSheet *param_1,ItemID param_2){
  CharGear *pCVar1;
  GearInstance *pGVar2;
  u16 uVar3;
  GearInstance **ppGVar4;
  ItemInstance *pWVar5;
  uint uVar5;
  
  uVar3 = (u16)param_2 >> 8;
  if (uVar3 == 6) {
    pWVar5 = &param_1->armor[1]->base;
  }
  else if (uVar3 < 7) {
    if (uVar3 != 5) {
      pCVar1 = param_1->pItemList;
LAB_8007b4b0:
      uVar5 = 0;
      if (pCVar1->usedItems == 0) {
        return NULL;
      }
      ppGVar4 = pCVar1->pItem;
      while ((pGVar2 = ppGVar4[uVar5], pGVar2 == NULL || ((pGVar2->base).id != param_2))) {
        uVar5 += 1;
        if (pCVar1->usedItems <= uVar5) {
          return NULL;
        }
        ppGVar4 = pCVar1->pItem;
      }
      return &pGVar2->base;
    }
    pWVar5 = &(*param_1->armor)->base;
  }
  else {
    if (uVar3 != 7) {
      pCVar1 = param_1->pItemList;
      goto LAB_8007b4b0;
    }
    pWVar5 = &param_1->weapons->base;
  }
  if ((pWVar5 != NULL) && (pWVar5->id == param_2)) {
    return pWVar5;
  }
  return NULL;
}

u8 Ofunc_boolStaminaForSpell(CharSheet *param_1,SpellInstance *param_2){
  if (param_2) return Entity::SpellStaminaSubtract(param_1,param_2,Entity::CheckSpellWizard(param_1,param_2)) <= CharStats::getModded(param_1->Stats,STAT_STAM);
  return false;
}

void Entity::AllocEnchant(CharSheet *param_1,u8 spell,u8 param_3,u8 unk3,u32 timer,s32 param_6){
  int iVar3;
  int iVar4;
  int iVar6;
  
  for(u32 i=0;i<MAGIC_FXMAX;i++) {
    if (!param_1->effects[i]) {
      ALLOCL(param_1->effects[i],3555);
      TempEnchant::Init(param_1->effects[i],spell,param_3,timer,unk3,0);
      if (!param_6) {
        iVar6=(param_3 * 2);
        if (CharStats::getBase(param_1->Stats,STAT_STAM) < iVar6 + CharStats::getModded(param_1->Stats,STAT_STAM)) {
          iVar6 = CharStats::getBase(param_1->Stats,STAT_STAM);
          iVar6 -= CharStats::getModded(param_1->Stats,STAT_STAM);
        }
        CharStats::addModdedHealth(param_1->Stats,STAT_STAM,(s8)iVar6);
      }
      else EffectModStats(param_1,STAT_STAM,param_3);
      return;
    }
  }
}

s32 FUN_8007b6bc(CharSheet *param_1,u8 param_2,char param_3){
  s32 iVar1;
  u8 SVar3;
  s32 iVar4;
  
  iVar4 = (s32)param_3;
  if (param_2 == STAT_LV) {
    iVar1 = CharStats::getModded(param_1->Stats,STAT_END);
    if (iVar1 != 0) {return iVar4;}
    SVar3 = STAT_LV;
  }
  else {
    if (param_2 != STAT_END) {return iVar4;}
    SVar3 = STAT_END;
  }
  iVar1 = CharStats::getModded(param_1->Stats,SVar3);
  if ((s32)(char)iVar1 <= -iVar4) {
    iVar4 = (1 - (char)iVar1) * 0x1000000 >> 0x18;
  }
  return iVar4;
}

s32 FUN_8007b760(CharSheet *param_1,u8 param_2,char param_3){
  s32 iVar1;
  u8 SVar3;
  s32 iVar4;
  
  iVar4 = (s32)param_3;
  if (param_2 == STAT_LV) {
    iVar1 = CharStats::getModded(param_1->Stats,STAT_END);
    if (iVar1 != 0) {return iVar4;}
    SVar3 = STAT_LV;
  }
  else {
    if (param_2 != STAT_END) {return iVar4;}
    SVar3 = STAT_END;
  }
  iVar1 = CharStats::getModded(param_1->Stats,SVar3);
  if ((char)iVar1 <= iVar4) {
    iVar4 = ((char)iVar1 - 1) * 0x1000000 >> 0x18;
  }
  return iVar4;
}


void Entity::EffectModStats(CharSheet *param_1,u8 param_2,u8 param_3){
  if (!isDead(param_1)) {
    CharStats::AddModdedMagic(param_1->Stats,param_2,FUN_8007b6bc(param_1,param_2,param_3));
  }
}

void Entity::RemoveStatBuff(CharSheet *param_1,u8 param_2,u8 param_3){
  if (!isDead(param_1)) {
    CharStats::SubModdedMagic(param_1->Stats,param_2,FUN_8007b760(param_1,param_2,param_3));
  }
}

void Entity::ClearSpellEffect(CharSheet *param_1,u8 index,CombatEntity *param_3){

  if (param_1->effects[index]) {
    ReverseSpellEffect(param_1,index,param_3);
    TempEnchant::StopSpellVisual(param_1->effects[index]);
    FREE(param_1->effects[index],3706);
  }
}

u8 Entity::IsDebuffSpell(CharSheet* c,SpellEnum spell){
  u8 debuffSpells[] =
  {SPELLIND_wraithTouch,SPELLIND_debilitation,SPELLIND_weakness,SPELLIND_exhaustion,SPELLIND_stupidity,SPELLIND_clumsiness,SPELLIND_NONE};
  
  if (spell) {
    if (debuffSpells[0] != SPELLIND_NONE) {
      for(u32 i=0;debuffSpells[i] != SPELLIND_NONE;i++) {
        if (spell == debuffSpells[i]) return true;
      }
    }
  }
  return false;
}

u8 Entity::GetShieldDefence(CharSheet *param_1,ItemID param_2){
  u8 bVar2 = 0;
  if (param_1->armor[1]) {bVar2 = param_1->armor[1]->DEF;}
  if (((param_2) && (param_2 >> 8 == 6)) && (!NoSheildSkill(param_1))) {
    bVar2 = gArmorDBp->Armor[GETINDEX(param_2)].defence;}
  return bVar2;
}

int Entity::GetArmorProtect(CharSheet *param_1,ItemID param_2){
  byte bVar1;
  uint uVar4;
  int total;
  int iVar6;
  
  total = 0;
  for(u32 i=0;i<2;i++) {
    if (param_1->armor[i]) total += param_1->armor[i]->Protect;
  }
  if (param_2) {
    bVar1 = GETINDEX(param_2);
    iVar6 = 0;
    if (param_2 >> 8 == DB_ARMOR) {
      if (ret0(param_1)) return total;
    }
    else {
      if (param_2 >> 8 != DB_SHIELD) return total;
      if (NoSheildSkill(param_1)) return total;
      iVar6 = 1;
    }
    if (param_1->armor[iVar6]) {
      total -= param_1->armor[iVar6]->Protect;
    }
    total += gArmorDBp->Armor[bVar1]->protection;
  }
  return total;
}