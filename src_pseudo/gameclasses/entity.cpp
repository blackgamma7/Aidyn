#ifdef DEBUGVER
#define FILENAME "../gameclasses/entity.cpp"
#else
#define FILENAME ""
#endif

#include "globals.h"
#include "combat/CombatEntity.h"

bool IsElemental(ItemID param_1){
  if (param_1.s >> 8 == 2) {
    u8 index = GetIDIndex(param_1);
    //Air, Earth, Fire Water Elementals
    if ((((index == 0xc2) || (index == 0xc4)) || (index == 0xc5)) || (index == 199)) return true;
    else return (index == 0xbf); //firelord
  }
  else return false;
  }


void init_more_charSheet_data(CharSheet *param_1,Entity_Ram *param_2){
  u32 uVar1;
  inv_funcs *piVar2;
  Borg8Enum BVar3;
  Borg8header *pBVar4;
  PotionEffect **x;
  s32 iVar5;
  ulong uVar6;
  ItemID IVar7;
  
  param_1->portrait = get_borg_8(getEntityPortait(param_1->ID));
  x = (PotionEffect **)heapAlloc(0x1c,FILENAME,0xc1);
  param_1->potionEffects=x;
  memset(x,0,sizeof(PotionEffect*)*7);
  param_1->weapons = NULL;
  param_1->EXP->total = EXP_TNL[CharStats::getBase(param_1->Stats,STAT_LV)];
  if (param_2->weapon[0] != (ItemID)0xffff) {EquipWeapon(param_1,param_2->weapon[0],0);}
  if (param_2->weapon[1] != (ItemID)0xffff) {
    if (param_1->weapons == NULL) EquipWeapon(param_1,param_2->weapon[1],0);
    else gGlobals.party->Inventory->AddItem(param_2->weapon[1],1);
  }
  if (param_2->weapon[2] != (ItemID)0xffff) {
    if (param_1->weapons == NULL) EquipWeapon(param_1,param_2->weapon[2],0);
    else gGlobals.party->Inventory->AddItem(param_2->weapon[2],1);
  }
}

void equip_weapons(CharSheet *param_1,Entity_Ram *param_2){
  PotionEffect **x;
  
  x = (PotionEffect **)heapAlloc(0x1c,FILENAME,0xd8);
  param_1->potionEffects = x;
  memset(x,0,0x1c);
  param_1->weapons = NULL;
  if (param_2->weapon[2] != (ItemID)0xffff) {EquipWeapon(param_1,param_2->weapon[2],0);}
  if ((param_2->weapon[0] != (ItemID)0xffff) && (param_1->weapons == NULL)) {
    EquipWeapon(param_1,param_2->weapon[0],0);
  }
}


void equip_3_weapons(CharSheet *param_1,Entity_Ram *param_2){
  ItemID IVar1;
  
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
  ItemID ID;
  byte bVar7;
  CharStats *stats;
  charExp *pcVar1;
  CharSkills *arg0;
  ArmorInstance **ppAVar2;
  CharGear *pCVar3;
  Spellbook *pSVar4;
  int iVar5;
  SpellInstance *pSVar6;
  Temp_enchant **x;
  ItemID *pIVar8;
  uint uVar9;
  Entity_Ram *pEVar10;
  func *apcStack112 [4];
  
  memset(param_1,0,0x48);
  bVar7 = GetIDIndex(param_2);
  pEVar10 = gEntityDB->entities;
  param_1->ID = param_2;
  pEVar10 = pEVar10 + (char)bVar7;
  strlen(pEVar10->Name);
  param_1->name = pEVar10->Name;
  stats = (CharStats *)heapAlloc(0x1c,FILENAME,0x101);
  param_1->Stats = stats;
  CharStats::Init(stats,param_1->ID);
  pcVar1 = (charExp *)heapAlloc(0x10,FILENAME,0x104);
  param_1->EXP = pcVar1;
  CharExp::Init(pcVar1,param_1->ID);
  arg0 = (CharSkills *)heapAlloc(0x30,FILENAME,0x107);
  param_1->Skills = arg0;
  CharSkills::Init(arg0,param_1->ID);
  ppAVar2 = (ArmorInstance **)heapAlloc(8,FILENAME,0x10a);
  param_1->armor = ppAVar2;
  *ppAVar2 = NULL;
  ppAVar2[1] = NULL;
  if (pEVar10->Armor != (ItemID)0xffff) {
    EquipArmor(param_1,pEVar10->Armor,0);
  }
  if (pEVar10->Sheild != (ItemID)0xffff) {
    EquipSheild(param_1,pEVar10->Sheild,NULL);
  }
  pCVar3 = (CharGear *)heapAlloc(8,FILENAME,0x111);
  param_1->pItemList = pCVar3;
  CharGear_Init(pCVar3,0xc);
  pSVar4 = (Spellbook *)heapAlloc(8,FILENAME,0x114);
  param_1->spellbook = pSVar4;
  Spellbook::Reset(pSVar4,5);
  uVar9 = 0;
  iVar5 = 0;
  do {
    pIVar8 = (ItemID *)(&pEVar10->spells[0].type + iVar5);
    if (*pIVar8 != (ItemID)0xffff) {
      pSVar6 = (SpellInstance *)heapAlloc(0x24,FILENAME,0x11a);
      ID = *pIVar8;
      *(SpellInstance **)(&(param_1->spellbook->spells->base).id + uVar9 * 2) = pSVar6;
      TempSpell::Init(pSVar6,ID,pEVar10->Spell_levels[uVar9]);
      param_1->spellbook->count = param_1->spellbook->count + 1;
    }
    uVar9 = uVar9 + 1 & 0xff;
    iVar5 = uVar9 << 1;
  } while (uVar9 < 5);
  x = (Temp_enchant **)heapAlloc(0x3c,FILENAME,0x11f);
  param_1->effects = x;
  memset(x,0,0x3c);
  apcStack112[0] = PTR_ARRAY_800e030c[0];
  apcStack112[1] = PTR_ARRAY_800e030c[1];
  apcStack112[2] = PTR_ARRAY_800e030c[2];
  apcStack112[3] = PTR_ARRAY_800e030c[3];
  (*apcStack112[param_3])(param_1,pEVar10);
  param_1->spellSwitch = 0;
  param_1->spellVal = -1;
  return;
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
    Spellbook::Clear(pSVar6);
    FREE(param_1->spellbook,363);
  }
  if(param_1->effects) {
    remove_effects(param_1);
    FREE(param_1->effects,0x173);
  }
  if(param_1->potionEffects) {
    ClearAllPotionEffects(param_1);
    FREE(param_1->potionEffects,0x17b);
  }
  if (param_1->portrait) {
    AllocFreeQueueItem(&gGlobals.QueueA,&param_1->portrait,4,0);
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

bool  Entity::isDead(CharSheet *param_1){
  if (!param_1->Stats) return false;
  return (!getHPCurrent(param_1));
}

void Entity::DecreaseHP(CharSheet *param_1,s16 dmg){
  s32 iVar1;
  char cVar2;
  u8 arg1;
  if (CharStats::getModded(param_1->Stats,STAT_STAM) < dmg) {
    dmg -=CharStats::getModded(stat,STAT_STAM);
    cVar2 = CharStats::getModded(param_1->Stats,STAT_STAM);
    CharStats::addModdedStat(param_1->Stats,STAT_STAM,-cVar2);
    if (dmg < 1) return;
    if (CharStats::getModded(param_1->Stats,STAT_END) < dmg) {
      CharStats::addModdedStat(param_1->Stats,STAT_END,-CharStats::getModded(param_1->Stats,STAT_END));
      return;
    }
    arg1 = STAT_END;
  }
  else arg1 = STAT_STAM;
  CharStats::addModdedStat(param_1->Stats,arg1,-dmg);}

bool Entity::hasCheatDeath(CharSheet *param_1){

  for(u32 i=0;i>15;i++) {
    if ((param_1->effects[i]) && (param_1->effects[i]->index == SPELLIND_cheatDeath)) break;
    return true;
  }
  return false;
}


void Entity::DamageToLevel(CharSheet *ent,short param_2,CombatEntity *cEnt){

  if ((cEnt) && (CombatEntity::Flag2(cEnt))) CombatEntity::TroubadourEnd(cEnt);
  if (CharStats::getModded(ent->Stats,STAT_LV) < param_2) {
    CharStats::addModdedHealth(ent->Stats,STAT_LV,-CharStats::getModded(ent->Stats,STAT_LV));
    DecreaseHP(ent,param_2 - CharStats::getModded(ent->Stats,STAT_LV));
    if(isDead(ent)){
      for(u32 i=0;i<15;i++){
        if ((ent->effects[i]) && (ent->effects[i]->index == SPELLIND_cheatDeath)) {
          addHP(ent,ent->effects[i]->varA << 1));
          ClearSpellEffect(ent,(u8)i,cEnt);
          return;
        }
      }
      if (cEnt) clear_combatEnt_effects(cEnt);
      ClearAllPotionEffects(ent);
      if (!isDead(ent) DoubleTap(ent);
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
      CharStats::addModdedStat(param_1->Stats,STAT_END,(char)uVar3);
    }
    else {
      CharStats::addModdedStat(param_1->Stats,STAT_END,(char)uVar4);
      uVar4 = uVar3 - uVar4;
    }
  }
  if (uVar4) {
    uVar3 = uVar4;
    if (CharStats::getModded(param_1->Stats,STAT_STAM) < CharStats::getBase(param_1->Stats,STAT_STAM)) {
      uVar3 = CharStats::getBase(param_1->Stats,STAT_STAM) - CharStats::getModded(param_1->Stats,STAT_STAM);
      if (uVar4 < uVar3) {
        uVar3 = 0;
        CharStats::addModdedStat(param_1->Stats,STAT_STAM,(char)uVar4);
      }
      else {
        CharStats::addModdedStat(param_1->Stats,STAT_STAM,(char)uVar3);
        uVar3 = uVar4 - uVar3;
      }
    }
    if (uVar3) {
      if (CharStats::getModded(param_1->Stats,STAT_LV) < CharStats::getBase(param_1->Stats,STAT_LV)) {
        uVar4 = CharStats::getBase(param_1->Stats,STAT_LV) - CharStats::getModded(param_1->Stats,STAT_LV);
        if (uVar3 < uVar4) {CharStats::addModdedStat(param_1->Stats,STAT_LV,(char)uVar3);}
        else {CharStats::addModdedStat(param_1->Stats,STAT_LV,(char)uVar4);}
      }
    }
  }
}

void Entity::addStamina(CharSheet *param_1,bool pointEight){
  int mod;
  if (pointEight)
    mod = CharStats::getBase(param_1->Stats,STAT_STAM) * 0.8f - CharStats::getModded(param_1->Stats,STAT_STAM);
  else 
    mod = CharStats::getBase(param_1->Stats,STAT_STAM) - CharStats::getModded(param_1->Stats,STAT_STAM);
  if (0 < mod) 
    CharStats::addModdedHealth(param_1->Stats,STAT_STAM,mod);
}



u8 Entity::ret0(CharSheet *param_1){return 0;}

bool Entity::NoSheildSkill(CharSheet *param_1){return CharSkills::getModdedSheild(param_1->Skills) == 0;}

u8 Entity::canEquipWeapon(CharSheet *param_1,ItemID param_2){
  u8 bVar2;
  s32 iVar1;
  char cVar3;
  weapon_ram *pcVar4;
  

  pcVar4 = weapon_pointer->weapons[GetIDIndex(param_2)];
  iVar1 = CharStats::getBase(param_1->Stats,STAT_STR);
  bVar2 = 3;
  if (pcVar4->ReqSTR <= iVar1) {
    if (!getModdedWeapon(param_1->Skills,pcVar4->Class)) bVar2 = 1;
    else {
      if (param_1->ID == (ItemID)(entityList[162] + 0x200)) { //Niesen
        bVar2 = 1;
        if (param_2 == (ItemID)(weaponList[66] + 0x700)) //archmage stafff
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
    pGVar1 = item_pointer->Gear;
    if (CharStats::getBase(param_1->Stats,STAT_STR) < pGVar1[iVar3].STR) {iVar3 = 3;}
    else {
      iVar3 = (CharStats::getBase(param_1->Stats,STAT_INT) < pGVar1[iVar3].INT) << 1;
    }
  }
  return iVar3;
}


void Entity::EquipArmor(CharSheet *param_1,u16 param_2,StatMod* param_3){
  EquipArmorOrShield(param_1,param_2,param_3,false);}

bool Entity::EquipSheild(CharSheet *param_1,u16 param_2,StatMod* param_3){
  bool uVar1 = NoSheildSkill(param_1);
  if (!uVar1) {
    EquipArmorOrShield(param_1,param_2,param_3,true);
    uVar1 = false;}
  return uVar1;
}

u8 Entity::EquipWeapon(CharSheet *param_1,u16 param_2,StatMod* param_3){
  u8 bVar2;StatMod *param_3
  
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
  if ((pSVar1) && (CharSkills::CapBaseSkill(param_1->Skills,pSVar1->stat))) {
    CharSkills::ModdedSkillAdd(param_1->Skills,pSVar1->stat,pSVar1->mod);
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
  ALLOC(param_1->armor[sheild],991);
  make_temp_armor_3(param_1->armor[sheild],id);
  ApplyEquipment(param_1,(WeaponInstance *)param_1->armor[sheild],param_3,true);
  CharStats::AddModded(param_1->Stats,STAT_DEX,param_1->armor[sheild]->dex);
  CharSkills::ModdedSkillAdd(param_1->Skills,SKILL_Stealth,param_1->armor[sheild]->stealth);
}

void Entity::RemoveArmor(CharSheet *param_1){remove_armor(param_1,0);}
void Entity::RemoveShield(CharSheet *param_1){remove_armor(param_1,1);}

void Entity::RemoveArmorOrShield(CharSheet *param_1,int param_2){
  if ((param_1->armor[param_2])){
    FUN_80078874(param_1,(WeaponInstance *)param_1->armor[param_2],true);
    CharStats::SubModded(param_1->Stats,STAT_DEX,param_1->armor[param_2]->dex);
    CharSkills::ModdedSkillAdd(param_1->Skills,SKILL_Stealth,-param_1->armor[param_2]->stealth);
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


void FUN_80078874(CharSheet *param_1,WeaponInstance *param_2,bool param_3){
  s8 mod;
  StatMod *skilmod;
  
  skilmod = param_2->SkillMod;
  if (skilmod){
    if (CharSkills::CapBaseSkill(param_1->Skills,skilmod->stat)) {
      CharSkills::ModdedSkillAdd(param_1->Skills,skilmod->stat,-skilmod->mod);
    }
  }
  skilmod = (param_2->base).statMod;
  if (skilmod) {
    if (skilmod->stat != STAT_STAM) {
    mod = FUN_8007b760(param_1,skilmod->stat,skilmod->mod);
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

void Entity::UnequipAllove_all_equip(CharSheet *param_1){
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

bool Entity::HasPotionEffect(CharSheet *param_1,u8 id){
  for(u32 i=0;i<POTION_FXMAX;i++){
    if((param_1->potionEffects[i])&&(param_1->potionEffects[i]->ID==id))
    return true;
  }
  return false;
}

void Entity::ApplyPotionEffect(CharSheet *param_1,u8 param_2,u8 param_3,u32 param_4){
  PotionEffect (*paPVar1) [7];
  PotionEffect *eff;
  uint uVar2;
  CharSkills *skills;
  u8 SVar3;
  u8 skill;
  int iVar4;
  
  for(uVar2=0;!param_1->potionEffects[uVar2]->ID;uVar2++) {
    if (POTION_FXMAX <= uVar2) return;
  }
  ALLOCL(param_1->potionEffects[uVar2],0x4a1);
  PotionEffect::Init(param_1->potionEffects[uVar2],pot,pow,time);
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
  CharSkills::ModdedSkillAdd(chara->Skills,skill,3);
}


void remove_potion_effect(CharSheet *param_1,u8 param_2){
  CharSkills *arg0;
  u8 SVar1;
  CHAR_SKILL arg1;
  
  if (param_1->potionEffects[param_2] == NULL) {return;}
  switch(param_1->potionEffects[param_2]->ID) {
  case POTION_STRENGTH:
    SVar1 = STAT_STR;
    break;
  case POTION_DEXTERITY:
    SVar1 = STAT_DEX;
    break;
  default:
    goto Lab_return;
  case POTION_CLARITY:
    arg0 = param_1->Skills;
    arg1 = SKILL_LOREMASTER;
    goto remove_skill_buff;
  case POTION_CHARISMA:
    arg0 = param_1->Skills;
    arg1 = Diplomat;
remove_skill_buff:
    some_moddedSkillCheck(arg0,arg1,-3);
    return;
  case POTION_STEALTH:
    some_moddedSkillCheck(param_1->Skills,Stealth,-3);
    goto Lab_return;
  }
  remove_stat_buff(param_1,SVar1,10);
Lab_return:
  return;
}

bool inc_charsheet_potion(CharSheet *param_1,bool Trekking,u8 param_3){
  PotionEffect **paVar3;
  u32 uVar2;
  u32 uVar3;
    
  if (!isDead(param_1)) {
    uVar3 = 0;
    paVar3 = param_1->potionEffects;
    while( true ) {
      if (paVar3[uVar3]) {
        if (!Trekking) {uVar2 = 0;}
        else {uVar2 = (u32)TerrainPointer->a;}
        if (check_charsheet_potion_timer(paVar3[uVar3],uVar2,param_3)) {clear_charsheet_potion(param_1,uVar3);}}
      uVar3++;
      if (6 < uVar3) break;
      paVar3 = param_1->potionEffects;
    }
  }
  return false;
}


void clear_charsheet_potion(CharSheet *param_1,u32 param_2){
  if (param_1->potionEffects[param_2]) {
    remove_potion_effect(param_1,param_2);
    func_with_potion_unk2(param_1->potionEffects[param_2]);
    HeapFree(param_1->potionEffects[param_2],FILENAME,0x50b);
    param_1->potionEffects[param_2] = NULL;
  }
}

void clear_exhaustion(CharSheet *param_1){
  SpellEffect*peVar1;
  u32 uVar2;
  
  uVar2 = 0;
  peVar1 = param_1->spellEffects;
  while( true ) {
    if ((peVar1->list[uVar2]) && (peVar1->list[uVar2]->index == exhaustion))
    {Entity::ClearSpellEffect(param_1,uVar2,NULL);}
    uVar2++;
    if (0xe < uVar2) break;
  }
  calc_stamina_change(param_1,false);
}


bool can_use_potion(CharSheet *param_1,POTION param_2,char *param_3){
  u32 uVar1;
  s32 iVar2;
  s32 iVar3;
  bool bVar4;
  bool bVar6;
  SpellEffect*peVar5;
  char *c2;
  u32 uVar6;
  
  switch(param_2) {
  case POTION_HEALING:
  case POTION_CURING:
    if (param_3) {strcpy(param_3,"That potion cannot be used right now.");}
    bVar6 = getHPCurrent(param_1) != getHPMax(param_1);
    break;
  case POTION_STAMINA:
    uVar6 = 0;
    peVar5 = param_1->spellEffects;
    do {
      uVar6++;
      if ((peVar5->list[0]) && (peVar5->list[0]->index == exhaustion)) {
        return true;
      }
      peVar5 = (SpellEffect*)(peVar5->list + 1);
    } while (uVar6 < 0xf);
    if (param_3) {strcpy(param_3,"That potion cannot be used right now.");}
    bVar6 = CharStats::getModded(param_1->Stats,STAT_STAM) < CharStats::getBase(param_1->Stats,STAT_STAM);
    break;
  case POTION_ANTIDOTE:
    uVar6 = 0;
    peVar5 = param_1->spellEffects;
    do {
      uVar6++;
      if ((peVar5->list[0]) && (peVar5->list[0]->index == poison)) {
        return true;
      }
      peVar5 = (SpellEffect*)(peVar5->list + 1);
    } while (uVar6 < 0xf);
    if (param_3) {
      c2 = "That potion cannot be used right now.";
LAB_80078fb4:
      strcpy(param_3,c2);}
    goto LAB_80078fbc;
  case POTION_RESTORE:
    uVar6 = 0;
    peVar5 = param_1->spellEffects;
    while( true ) {
      bVar4 = IsDebuffSpell(param_1,(SpellEnum)peVar5->list[uVar6]);
      uVar6++;
      if (bVar4) break;
      if (0xe < uVar6) {
        if (param_3 == NULL) goto LAB_80078fbc;
        c2 = "That potion cannot be used right now.";
        goto LAB_80078fb4;
      }
      peVar5 = param_1->spellEffects;
    }
    bVar6 = true;
    break;
  case POTION_STRENGTH:
  case POTION_DEXTERITY:
  case POTION_CLARITY:
  case POTION_CHARISMA:
  case POTION_DEFENCE:
  case POTION_STEALTH:
    if (param_3) {strcpy(param_3,"That potion cannot be used right now.");}
    bVar6 = (bool)(has_potion_effect(param_1,param_2) ^ 1);
    break;
  default:
    if (param_3) {
      c2 = s_That_potion_cannot_be_used_in_Tr_800e0390;
      goto LAB_80078fb4;}
LAB_80078fbc:
    bVar6 = false;}
  return bVar6;}

bool clear_debuff_spells(CharSheet *param_1){
  bool bVar1;
  SpellEffect*peVar2;
  u32 uVar3;
  bool bVar4;
  
  bVar4 = false;
  uVar3 = 0;
  peVar2 = param_1->spellEffects;
  while( true ) {
    bVar1 = IsDebuffSpell(param_1,(SpellEnum)peVar2->list[uVar3]);
    if (bVar1) {
      Entity::ClearSpellEffect(param_1,uVar3,NULL);
      bVar4 = true;
    }
    uVar3++;
    if (0xe < uVar3) break;}
  return bVar4;
}

bool Entity::UsePotion(CharSheet *param_1,u8 param_2,u8 param_3,char *param_4){
  inv_funcs *piVar1;
  bool bVar2;
  
  if (!can_use_potion(param_1,param_3,param_4)) {bVar2 = false;}
  else {
    switch(param_3) {
    case POTION_HEALING:
      Entity::HealByPotion(param_1,0xf,0x19);
      break;
    case POTION_STAMINA:
      clear_exhaustion(param_1);
      break;
    case POTION_CURING:
      Entity::HealByPotion(param_1,0x28,0x3c);
      break;
    case POTION_ANTIDOTE:
      ApplySpellEffect(param_1,removePoison,0,0,0xff,0);
      break;
    case POTION_RESTORE:
      clear_debuff_spells(param_1);
      break;
    case POTION_STRENGTH:
    case POTION_DEXTERITY:
    case POTION_JUMPING:
    case POTION_CLARITY:
    case POTION_CHARISMA:
    case POTION_DEFENCE:
    case POTION_STEALTH:
      Buffing_potion_effect(param_1,param_3,0,648000);
    }
    piVar1 = gGlobals.party->inv->Functions;
    (*(piVar1->search).func)
              ((s32)gGlobals.party->inv->inv_slots + (s16)(piVar1->search).arg[0] + -4,
               param_2,-1);
    bVar2 = true;
  }
  return bVar2;
}

bool Entity::HasSpellEffect(CharSheet *param_1,u8 id){
    for(u32 i=0;i<MAGIC_FXMAX;i++){
    if((param_1->effects[i])&&(param_1->effects[i]->index==id))
    return true;
  }
  return false;
}

//origially a control magic check, always returns true
u8 ret1_800791c8(void* x, u8 y){return true;}

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
  CharSheet *pCVar1;
  u32 uVar3;
  undefined8 uVar2;
  s32 iVar4;
  resist_float *prVar6;
  u32 uVar7;
  char acStack1064 [832];
  char acStack232 [64];
  color32 col1;
  color32 col2;
  
  pCVar1 = target->charSheetP;
  sprintf(acStack1064,"%s\n",pCVar1->name);
  uVar3 = strlen(acStack1064);
  if (level != 0) {
    strcpy(acStack232,"Follower");
    if ((target->index == gCombatP->leaderIndex) && (gCombatP->leaderDead == 0)) {
      strcpy(acStack232,"Leader");}
    uVar3 = AppendText(acStack1064,acStack232,uVar3);
  }
  if (2 < level) {
    sprintf(acStack232,"%d_Total_Hitpoints",getHPMax(pCVar1));
    uVar3 = AppendText(acStack1064,acStack232,uVar3);
  }
  if (4 < level) {
    sprintf(acStack232,"Level_%lu",CharStats::getBase(pCVar1->Stats,STAT_LV));
    uVar3 = AppendText(acStack1064,acStack232,uVar3);
  }
  if (6 < level) {
    prVar6 = target->resists;
    for(uVar7 = 0;uVar7 < 2;uVar7++) {
      uVar3 = print_element_resist(prVar6++,acStack1064,acStack232,uVar3);
    }
  }
  if (8 < level) {
    sprintf(acStack232,"Total Armor Protection %d",get_protection_level(target,false));
    uVar3 = AppendText(acStack1064,acStack232,uVar3);
  }
  col1 = OFFWHITE;
  col2 = DARKGRAY_T;
  gCombatP->Widget0x4fb8 = some_textbox_func(acStack1064,(s16)(uVar3 << 3) - (s16)uVar3,&col1,&col2,1);
}

s32 find_free_effect_slot(CharSheet *param_1){
  SpellEffect*peVar1;
  s32 iVar2;
  
  iVar2 = 0;
  peVar1 = param_1->spellEffects;
  do {
    if (peVar1->list[0] == NULL) {return iVar2;}
    iVar2++;
    peVar1 = (SpellEffect*)(peVar1->list + 1);
  } while (iVar2 < 0xf);
  return -1;
}


short Entity::ApplySpellEffect(CharSheet *target,SpellEnum id,undefined4 Level,uint param_4,byte pow,
                CombatEntity *combatTarget)

{
  CombatAIInfo *pCVar1;
  Temp_enchant **ppTVar2;
  bool bVar3;
  longlong lVar4;
  uint uVar6;
  bool bVar11;
  int iVar7;
  bool bVar12;
  longlong lVar5;
  short sVar9;
  Temp_enchant *pTVar8;
  CharStats *stats;
  StatEnum SVar13;
  undefined uVar14;
  int iVar15;
  uint Lv;
  uint uVar16;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 UNK4;
  byte bVar10;
  
  Lv = (uint)(byte)Level;
  uVar18 = 0;
  uVar17 = 0;
  bVar3 = true;
  uVar16 = 0;
  bVar10 = GetIDIndex(target->ID);
  lVar4 = (longlong)(char)bVar10;
  uVar6 = FindFreeEffect(target);
  bVar11 = Entity::HasSpellEffect(target,id);
  if (!bVar11) {
    uVar16 = ~uVar6 >> 0x1f;
  }
  sVar9 = (short)uVar6;
  UNK4 = uVar18;
  bVar11 = bVar3;
  if (false) goto LAB_80079984;
  switch(id) {
  case SPELLIND_Immolation:
  case SPELLIND_AcidBolt:
  case SPELLIND_poison:
  case SPELLIND_stellarGravity:
    if (uVar16 != 0) {
      UNK4 = 1;
    }
    break;
  case SPELLIND_escape:
    bVar11 = false;
    if ((combatTarget != NULL) &&
       (UNK4 = uVar17, bVar11 = false, gGlobals.EncounterDat.BossShadow != 0)) {
      combat_escape_func(combatTarget);
      bVar11 = false;
    }
    break;
  case SPELLIND_removePoison:
    RemovePoison(target,combatTarget,pow);
    UNK4 = uVar17;
    bVar11 = false;
    break;
  case SPELLIND_AirSheild:
  case SPELLIND_spiritSheild:
  case SPELLIND_starlightSheild:
    if (uVar16 != 0) {
      target->EXP->protection = target->EXP->protection + (byte)Level * '\x02';
    }
    break;
  case SPELLIND_ControlElem:
    UNK4 = uVar17;
    bVar11 = true;
    if (((uVar16 == 0) || (combatTarget == NULL)) ||
       (bVar12 = IsElemental(target->ID), UNK4 = uVar18, bVar11 = bVar3, !bVar12)) break;
    goto control_magic;
  case SPELLIND_debilitation:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = STAT_STR;
    goto lower_stat;
  case SPELLIND_strength:
    if (uVar16 == 0) break;
    SVar13 = STAT_STR;
    uVar14 = (undefined)((Lv << 0x19) >> 0x18);
    goto mod_stat;
  case SPELLIND_teleportation:
    CombatEntity::Teleport(combatTarget);
    UNK4 = uVar17;
    bVar11 = false;
    break;
  case SPELLIND_brilliance:
    if (uVar16 == 0) break;
    SVar13 = STAT_INT;
    uVar14 = (undefined)((Lv << 0x19) >> 0x18);
    goto mod_stat;
  case SPELLIND_stupidity:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = STAT_INT;
    goto lower_stat;
  case SPELLIND_charming:
    UNK4 = uVar17;
    bVar11 = true;
    if ((uVar16 == 0) || (combatTarget == NULL)) break;
    goto control_magic;
  case SPELLIND_controlMarquis:
    UNK4 = uVar17;
    bVar11 = true;
    if ((uVar16 == 0) || (lVar5 = 0xaa, UNK4 = uVar18, bVar11 = bVar3, combatTarget == NULL)) break;
LAB_800798b0:
    UNK4 = uVar17;
    bVar11 = true;
    if (lVar4 != lVar5) break;
    goto control_magic;
  case SPELLIND_endurance:
    if (uVar16 == 0) break;
    SVar13 = STAT_END;
    uVar14 = (undefined)((Lv << 0x19) >> 0x18);
    goto mod_stat;
  case SPELLIND_senseAura:
    bVar11 = false;
    if (combatTarget != NULL) {
      CombatEntity::SenseAura(combatTarget,(byte)Level);
      UNK4 = uVar17;
      bVar11 = false;
    }
    break;
  case SPELLIND_weakness:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = STAT_END;
    goto lower_stat;
  case SPELLIND_auraOfDeath:
  case SPELLIND_solarWraith:
    bVar11 = true;
    UNK4 = uVar17;
    if (((uVar16 != 0) && (uVar16 = 0, combatTarget != NULL)) &&
       (pCVar1 = combatTarget->aiP, pCVar1 != NULL)) {
      uVar16 = 1;
      bVar10 = pCVar1->morale;
      if (bVar10 < Lv) {
        Level._3_1_ = bVar10;
      }
      pCVar1->morale = bVar10 - (byte)Level;
      combatTarget->aiP->flags = combatTarget->aiP->flags | 2;
      UNK4 = 1;
      bVar11 = bVar3;
    }
    break;
  case SPELLIND_wraithTouch:
    if (uVar16 != 0) {
      WraithTouch(target,combatTarget,pow,(u8)uVar6);
      return sVar9;
    }
    break;
  case SPELLIND_controlZombies:
    UNK4 = uVar17;
    bVar11 = true;
    if ((uVar16 == 0) || (UNK4 = uVar18, bVar11 = bVar3, combatTarget == NULL)) break;
    lVar5 = 0xb6;
    if (lVar4 != 0xbe) goto LAB_800798b0;
control_magic:
    bVar10 = ret1_800791c8(target,id);
    UNK4 = uVar18;
    bVar11 = bVar3;
    if (bVar10 != 0) {
      CombatEntity::FlagToggle(combatTarget,COMBATENT_ALLY);
      UNK4 = 1;
      bVar11 = true;
    }
    break;
  case SPELLIND_darkness:
  case SPELLIND_light:
    if (uVar16 != 0) {
      DarknessLightMagic(target,id);
      UNK4 = uVar17;
      bVar11 = true;
    }
    break;
  case SPELLIND_exhaustion:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = STAT_STAM;
    goto lower_stat;
  case SPELLIND_stamina:
    if (uVar16 == 0) break;
    SVar13 = STAT_STAM;
    goto lower_stat;
  case SPELLIND_tapStamina:
    iVar15 = Lv << 1;
    if (uVar16 != 0) {
      iVar7 = CharStats::getModded(target->Stats,STAT_STAM);
      stats = target->Stats;
      if (iVar7 < iVar15) {
        iVar15 = CharStats::getModded(stats,STAT_STAM);
        stats = target->Stats;
      }
      CharStats::addModdedHealth(stats,STAT_STAM,-(char)iVar15);
      UNK4 = 1;
      bVar11 = true;
    }
    break;
  case SPELLIND_wallOfBones:
  case SPELLIND_frozenDoom:
  case SPELLIND_webOfStarlight:
                    // fail with Shadow
    if (lVar4 == 0xac) {
      return -1;
    }
    UNK4 = uVar17;
    bVar11 = true;
    if ((uVar16 != 0) && (combatTarget != NULL)) {
      CombatEntity::FlagUnset(combatTarget,COMBATENT_CANMOVE);
      UNK4 = 1;
      bVar11 = true;
    }
    break;
  case SPELLIND_mirror:
    UNK4 = uVar17;
    bVar11 = true;
    if ((combatTarget != NULL) && (UNK4 = uVar18, bVar11 = bVar3, uVar16 != 0)) {
      combatTarget->mirrorVal = combatTarget->mirrorVal + (byte)Level * '\x03';
    }
    break;
  case SPELLIND_dispelElemental:
  case SPELLIND_dispelNaming:
  case SPELLIND_dispelNecro:
  case SPELLIND_dispelStar:
    DispelMagic(target,(char)combatTarget,id,pow);
    UNK4 = uVar17;
    bVar11 = false;
    break;
  case SPELLIND_detectMoonPhase:
    UNK4 = uVar17;
    bVar11 = true;
    if (uVar16 != 0) {
      Sundial::ToggleMoon(1);
      bVar11 = true;
    }
    break;
  case SPELLIND_detectSunPhase:
    UNK4 = uVar17;
    bVar11 = true;
    if (uVar16 != 0) {
      Sundial::ToggleSun(1);
      bVar11 = true;
    }
    break;
  case SPELLIND_dexterity:
    if (uVar16 == 0) break;
    SVar13 = STAT_DEX;
    uVar14 = (undefined)((Lv << 0x19) >> 0x18);
    goto mod_stat;
  case SPELLIND_clumsiness:
    if (uVar16 == 0) break;
    uVar18 = 1;
    SVar13 = STAT_DEX;
lower_stat:
    uVar14 = (undefined)(Lv * -0x2000000 >> 0x18);
mod_stat:
    EffectModStats(target,SVar13,uVar14);
    UNK4 = uVar18;
    bVar11 = true;
    break;
  case SPELLIND_stealth:
    if (uVar16 != 0) {
      CharSkills::ModdedSkillAdd(target->Skills,SKILL_Stealth,(s8)(Lv * 0x6000000 >> 0x18));
      UNK4 = uVar17;
      bVar11 = true;
    }
  }
LAB_80079984:
  if (bVar11) {
    if (uVar16 == 0) {
      sVar9 = -1;
    }
    else {
      pTVar8 = (Temp_enchant *)heapAlloc(0x18,s_../gameclasses/entity.cpp_800e02f0,0x809);
      ppTVar2 = target->effects;
      ppTVar2[uVar6] = pTVar8;
      TempEnchant::Init(ppTVar2[uVar6],id,(byte)Level,param_4,pow,UNK4);
    }
  }
  else {
    sVar9 = -1;
  }
  return sVar9;
}


void ReverseSpellEffect(CharSheet *param_1,u8 param_2,CombatEntity *param_3){
  Temp_enchant *pTVar1;
  bool bVar2;
  u8 SVar3;
  char cVar4;
  u8 bVar5;
  CombatAIInfo* iVar2;
  
  pTVar1 = param_1->spellEffects->list[param_2];
  if (pTVar1 == NULL) {return;}
  switch(pTVar1->index) {
  case AirSheild:
    param_1->EXP->protection-= pTVar1->lv * 2;
    break;
  case ControlElem:
  case charming:
  case controlMarquis:
  case controlZombies:
    if (param_3) {
      if (!CombatEnt_flag_5(param_3)) {CombatEnt_NAND_flags(param_3,flag4);}
      else {CombatEnt_OR_flags(param_3,flag4);}
    }
    break;
  case debilitation:
    bVar5 = pTVar1->lv;
    SVar3 = STAT_STR;
    goto LAB_80079c10;
  case strength:
    SVar3 = STAT_STR;
    cVar4 = (char)(((u32)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case wind:
    TerrainPointer->windByte = 1;
    break;
  case brilliance:
    SVar3 = s32;
    cVar4 = (char)(((u32)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case stupidity:
    bVar5 = pTVar1->lv;
    SVar3 = s32;
    goto LAB_80079c10;
  case endurance:
    SVar3 = STAT_END;
    cVar4 = (char)(((u32)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case weakness:
    bVar5 = pTVar1->lv;
    SVar3 = STAT_END;
    goto LAB_80079c10;
  case auraOfDeath:
  case solarWraith:
    if ((param_3) &&
       (param_3->aiP)) {iVar2->morale+= pTVar1->lv;}
    break;
  case wraithTouch:
    SVar3 = pTVar1->unk0x3;
    cVar4 = -pTVar1->lv;
    goto LAB_80079c18;
  case darkness:
  case light:
    dec_dayNightMagic(TerrainPointer);
    TerrainPointer->partOfDay = *(TimeOfDay *)gCombatP;
    break;
  case exhaustion:
    bVar5 = pTVar1->lv;
    SVar3 = STAT_STAM;
    goto LAB_80079c10;
  case stamina:
    SVar3 = STAT_STAM;
    cVar4 = (char)(((u32)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case wallOfBones:
  case frozenDoom:
  case webOfStarlight:
    if (param_3) {CombatEnt_OR_flags(param_3,flag1);}
    break;
  case spiritSheild:
  case starlightSheild:
    param_1->EXP->protection-= pTVar1->lv;
    break;
  case dexterity:
    SVar3 = STAT_DEX;
    cVar4 = (char)(((u32)pTVar1->lv << 0x19) >> 0x18);
    goto LAB_80079c18;
  case clumsiness:
    bVar5 = pTVar1->lv;
    SVar3 = STAT_DEX;
LAB_80079c10:
    cVar4 = bVar5 * -2;
LAB_80079c18:
    remove_stat_buff(param_1,SVar3,cVar4);
    break;
  case stealth:
    some_moddedSkillCheck(param_1->Skills,Stealth,pTVar1->lv * -6);
  }
  return;
}

s32 func_incrementing_enchantments(CharSheet *param_1,CombatEntity *param_2,s32 param_3){
  SpellEnum SVar1;
  Temp_enchant *pTVar2;
  bool bVar7;
  s32 iVar4;
  u32 uVar5;
  u32 uVar6;
  SpellEffect*peVar8;
  u8 dice;
  u32 uVar9;
  s32 iVar10;
  s32 iVar11;
  
  if (isDead(param_1) return 0;
  iVar10 = 0;
  iVar11 = 0;
  uVar9 = 0;
  peVar8 = param_1->spellEffects;
  do {
    pTVar2 = peVar8->list[uVar9];
    if (pTVar2) {
      uVar5 = 0;
      if (param_2 == NULL) {uVar5 = (u32)TerrainPointer->a;}
      if (!inc_effect_timer(pTVar2,uVar5,param_3)) {
        SVar1 = pTVar2->index;
        uVar5 = 0;
        if (SVar1 == poison) {
          uVar6 = (u32)(pTVar2->lv >> 1);
          if (CharStats::getModded(param_1->Stats,STAT_END) < uVar6) {uVar6 = CharStats::getModded(param_1->Stats,STAT_END);}
          if (getHPCurrent(param_1) < uVar6) goto LAB_80079e7c;
          iVar10+= uVar6;
          uVar5 = 0;
          CharStats::addModdedStat(param_1->Stats,STAT_END,-(char)uVar6);
        }
        else {
          if (SVar1 < mirror) {
            if (SVar1 == Immolation) {dice = 1;}
            else {
              dice = 1;
              if (SVar1 != AcidBolt) goto LAB_80079e48;
            }
RollDoT:
            uVar5 = RollD(dice,6);
          }
          else {
            if (SVar1 == photosynthesis) {
              if (TerrainPointer->partOfDay == NIGHT) goto LAB_80079e7c;
              addHP(param_1,pTVar2->unk0x3 << 0x18 >> 0x18));
              iVar11+= (char)pTVar2->unk0x3;
            }
            else if (SVar1 == webOfStarlight) {
              iVar4 = CharStats::getModded(param_1->Stats,STAT_STR);
              uVar5 = RollD(1,100);
              if ((iVar4 * 2 <= (s32)uVar5) ||
                 (some_skillcheck_calc((s32)((iVar4 * 2 - uVar5) * 0x10000) >> 0x10) == 0)) {
                 dice = 2;
                 goto RollDoT;
                }
                Entity::ClearSpellEffect(param_1,uVar9 & 0xff,param_2);
                uVar5 = 0;
              }
          }
        }
LAB_80079e48:
        if ((uVar5 != 0) && ( uVar5 <= getHPCurrent(param_1))) {
          Entity::DamageToLevel(param_1,(s16)uVar5,param_2);
          iVar10+= uVar5;
        }
      }
      else Entity::ClearSpellEffect(param_1,uVar9,param_2);
    }
LAB_80079e7c:
    uVar9++;
    if (0xe < uVar9) {
      if (iVar11 == 0) {return iVar10;}
      check_dead_from_DoT(param_1,0,iVar11,param_2);
      return iVar10;
    }
    peVar8 = param_1->spellEffects;
  } while( true );
}

Temp_spell * getSpell(CharSheet *param_1){
  temp_armor *ptVar1;
  temp_armor **pptVar2;
  temp_armor *iVar6;
  temp_armor *patVar4;
  
  switch(param_1->spellSwitch) {
  case 1:
    #ifdef DEBUGVER
    if (param_1->spellbook == NULL) {CRASH("No spell list (Entity::GetSpell())",*FILENAME);}
    if (param_1->spellbook->spells == NULL) {CRASH("No pSpellList->pSpell[] (Entity::GetSpell())",*FILENAME);}
    #endif
    return param_1->spellbook->spells[param_1->currSpell];
  case 2:
    #ifdef DEBUGVER
    if (param_1->armor == NULL) {CRASH("No armor (Entity::GetSpell())",*FILENAME);}
    if (*param_1->armor[0] == NULL) {CRASH("No pArmor[0] (Entity::GetSpell())",*FILENAME);}
    if ((*param_1->armor[0])->spell == NULL) {CRASH("No pArmor[0]->pSpell (Entity::GetSpell())",*FILENAME);}
    #endif
    pptVar2 = param_1->armor[0];
    break;
  case 3:
    #ifdef DEBUGVER
    if (param_1->armor == NULL) {CRASH("No armor (Entity::GetSpell())",*FILENAME);}
    if (param_1->armor[1] == NULL) {CRASH("No pArmor[1] (Entity::GetSpell())",*FILENAME);}
    if (param_1->armor[1]->spell == NULL) {CRASH("No pArmor[1]->pSpell (Entity::GetSpell())",*FILENAME);}
    #endif
    ptVar1 = param_1->armor[1];
    goto RetSpell;
  case 4:
    #ifdef DEBUGVER
    if (param_1->weapons == NULL) {CRASH("No weapon (Entity::GetSpell())",*FILENAME);}
    if (param_1->weapons->spell == NULL) {CRASH("No pWeapon->pSpell (Entity::GetSpell())",*FILENAME);}
    #endif
    return param_1->weapons->spell;
  case 5:
    #ifdef DEBUGVER
    if (param_1->pItemList == NULL) {CRASH("No pItemList (Entity::GetSpell())",*FILENAME);}
    if (param_1->pItemList->pItem == NULL) {CRASH("No pItemList->pItem[] (Entity::GetSpell())",*FILENAME);}
    if (param_1->pItemList->pItem[param_1->currSpell]->pSpell == NULL) {CRASH("No pItemList->pItem[currSpell]->pSpell (Entity::GetSpell())",*FILENAME);}
    #endif
    pptVar2 = (temp_armor **)(param_1->pItemList->pItem + param_1->currSpell);
    break;
  default:
    return NULL;
  }
  ptVar1 = *pptVar2;
RetSpell:
  return *(Temp_spell **)ptVar1->spell;
}
//2 extra args, no clue what for
Temp_spell * passto_getSpell(CharSheet *param_1,s16 unk1,void *unk2){
  Temp_spell* ret = NULL;
  if (param_1->spellSwitch < 6) ret = getSpell(param_1);
  return ret;
}

undefined some_equip_spell_charges(CharSheet *param_1){
  temp_armor *ptVar1;
  temp_armor **pptVar2;
  
  switch(param_1->spellSwitch) {
  case 1:
    return 1;
  case 2:
    pptVar2 = param_1->armor;
    break;
  case 3:
    ptVar1 = param_1->armor[1];
    goto LAB_8007a1d8;
  case 4:
    return param_1->weapons->spell->Charges;
  case 5:
    pptVar2 = (temp_armor **)(param_1->pItemList->pItem + param_1->currSpell);
    break;
  default:
    return 0;
  }
  ptVar1 = *pptVar2;
LAB_8007a1d8:
  return  ptVar1->spell->Charges;
}

void dec_item_spell_uses(CharSheet *param_1){
  temp_gear *ptVar1;
  u16 uVar3;
  
  if (param_1->spellSwitch == 5) {
    ptVar1 = param_1->pItemList->pItem[param_1->currSpell];
    uVar3 = (u16)ptVar1->id >> 8;
    if ((uVar3 == 0x11) || (uVar3 == 0xd)) ptVar1->pSpell->Charges--;
  }
}



u8 check_spell_wizard(CharSheet *param_1,Temp_spell *param_2){
  u8 bVar2;
  
  if (param_2) {
    bVar2 = param_1->spellSwitch;
    if (bVar2 == 1) {
      if (getModdedSkill(param_1->Skills,SKILL_WIZARD) <= param_2->level)
         return getModdedSkill(param_1->Skills,SKILL_WIZARD);
      return param_2->level;
    }
    if (bVar2 != 0) {
      if (5 < bVar2) return 0;
      return param_2->level;
    }
  }
  return 0;
}

s32 spell_stamina_subtract(Charsheet* ch,Temp_spell *param_1,u8 param_2){
  s32 uVar1 = param_1->stamina - param_2);
  if (uVar1 < 1) uVar1 = 1;
  return uVar1;
}

bool Test_equip_Stamina(CharSheet *param_1,s16 param_2){
  s32 iVar1 = Equip_Stamina(param_1,param_2,0);
  if (iVar1 == 0) Equip_Stamina(param_1,param_2,1);
  return iVar1 == 0;}

s32 Equip_Stamina(CharSheet *param_1,s16 stam,u8 param_3){
  s32 iVar1;
  s32 iVar2;
  CharGear *pCVar3;
  u32 uVar4;
  s32 iVar5;
  
  iVar1 = add_Equip_Stamina(param_1,(temp_armor *)param_1->weapons,stam,param_3);
  iVar1 = add_Equip_Stamina(param_1,*(temp_armor **)param_1->armor,(s16)iVar1,param_3);
  iVar1 = add_Equip_Stamina(param_1,param_1->armor[1],(s16)iVar1,param_3);
  pCVar3 = param_1->pItemList;
  
  if (pCVar3->num_used != 0) {
    for(uVar4 = 0;uVar4 < pCVar3->num_used;uVar4++;) {
      iVar1 = add_Equip_Stamina((temp_armor *)pCVar3->pItem[uVar4],(s16)iVar1,param_3);

    }
  }
  if (iVar1 < 1) iVar5 = 0;
  else {
    iVar2 = CharStats::getModded(param_1->Stats,STAT_STAM);
    iVar5 = (iVar1 - (s16)iVar2) * 0x10000 >> 0x10;
    if (iVar5 < 0) {
      if (param_3 != 0) {CharStats::addModdedStat(param_1->Stats,STAT_STAM,-(char)iVar1);}
      iVar5 = 0;
    }
    else {
      if (param_3 != 0) {CharStats::addModdedStat(param_1->Stats,STAT_STAM,-(char)iVar2);}
    }
  }
  return iVar5;
}

s32 add_Equip_Stamina(charSheet* c,temp_armor *param_1,s16 param_2,u8 param_3){
  u8 (*pabVar1) [2];
  s32 iVar2;
  s32 iVar3;
  
  iVar2 = (s32)param_2;
  if (iVar2 == 0) return 0;
  if ((((param_1) && (pabVar1 = param_1->statMod, pabVar1))
    && ((*pabVar1)[0] == 5)) && ((*pabVar1)[1] != 0)) {
    iVar2 = (iVar2 - (char)(*pabVar1)[1]) * 0x10000;
    iVar3 = iVar2 >> 0x10;
    if (iVar3 < 0) {
      if (param_3) {
        (*pabVar1)[1] = -(char)((u32)iVar2 >> 0x10);
      }
      iVar3 = 0;
    }
    else {
      if (param_3) {(*pabVar1)[1] = 0;}
    }
    return iVar3;
  }
  return iVar2;
}

void camp_healing(CharSheet *param_1,float param_2,u32 param_3){
  s32 iVar1;
  u32 uVar2;
  temp_gear *ptVar3;
  u16 uVar4;
  float fVar5;
  
  iVar1 = getHPMax(param_1);
  fVar5 = (float)iVar1 * param_2;
  if (INT_MAX_f <= fVar5) {fVar5-= INT_MAX_f;}
  uVar2 = getHPCurrent(param_1);
  uVar2 = iVar1 - getHPCurrent(param_1)
  uVar4 = (s16)((s32)fVar5);
  if (uVar2 < ((s32)fVar5)) {uVar4 = (s16)uVar2;}
  addHP(param_1,uVar4);
  tick_potion_enchantment_timers(param_1,NULL,param_3);
  multi_equip_StamMod(param_1->weapons,param_2);
  multi_equip_StamMod(*(WeaponInstance **)param_1->armor,param_2);
  multi_equip_StamMod((WeaponInstance *)param_1->armor[1],param_2);
  uVar2 = 0;
  if (param_1->pItemList->num_used != 0) {
    ptVar3 = (temp_gear *)param_1->pItemList->pItem;
    while( true ) {
      multi_equip_StamMod(*(WeaponInstance **)((s32)ptVar3 + uVar2 * 4),param_2);
      uVar2 = uVar2 + 1;
      if ((u8)param_1->pItemList->num_used <= uVar2) break;
      ptVar3 = (temp_gear *)param_1->pItemList->pItem;
    }
  }
}

u8 check_spell_aspect_tod(CharSheet* c,Temp_spell *sp){
  u8 bVar1;
  ASPECT AVar2 = sp->aspect;
  if (AVar2 == (LUNAR|LUNAR_MAGIC)) {
    if (TerrainPointer->partOfDay == NIGHT) return 3;
  }
  if (AVar2 == (SOLAR|LUNAR_MAGIC)) {
    bVar1 = 4;
    if (TerrainPointer->partOfDay == NIGHT) bVar1 = 0;
  }
  else bVar1 = 0;
  return bVar1;
}

u8 CheckTargetSpellAspect(CharSheet *param_1,Temp_spell *param_2){
  ASPECT AVar1;
  u8 bVar2;
  
  bVar2 = 0;
  AVar1 = param_2->aspect;
  if (AVar1 == LUNAR) {
    if (((param_1->EXP->flags ^ TrueName) & TrueName) != 0) {bVar2 = 7;}
  }
  if (AVar1 == SOLAR) {
    if ((param_1->EXP->flags & 2) == 0) {bVar2 = 8;}
  }
  if (AVar1 == SOLAR_MAGIC) {
    AVar1 = GetCharAspect(param_1->EXP);
    if (AVar1 != SOLAR) {bVar2 = 9;}
    AVar1 = param_2->aspect;
  }
  else {AVar1 = param_2->aspect;}
  if ((AVar1 == LUNAR_MAGIC) && (GetCharAspect(param_1->EXP) != LUNAR)) {bVar2 = 10;}
  return bVar2;
}

void check_dead_from_DoT(CharSheet *param_1,s16 param_2,s16 param_3,CombatEntity *param_4){
  playerData *ppVar1;
  bool bVar2;
  
  if ((param_4) &&
     (ppVar1 = gGlobals.playerDataArray[param_4->index], ppVar1)) {
    Print_damage_healing(ppVar1,param_2,param_3,isDead(param_1),param_1);
    if (isDead(param_1)) {
      func_seeking_sholeh(param_4);
      some_death_func_B(ppVar1,(u32)param_4->index,param_4);
    }
  }
  return;
}

void tick_potion_enchantment_timers(CharSheet *param_1,CombatEntity *param_2,u32 param_3){
  bool bVar2;
  s16 sVar1;
  
  bVar2 = inc_charsheet_potion(param_1,param_2 == NULL,param_3);
  sVar1 = func_incrementing_enchantments(param_1,param_2,param_3);
  check_dead_from_DoT(param_1,bVar2 + sVar1,0,param_2);
  return;
}

///IDK what this was... Unused.
bool FUN_8007a8cc(ItemID param_1,u32 param_2){
  u8 bVar1;
  u8 bVar2;
  
  bVar2 = GetIDIndex(param_1);
  bVar1 = (weapon_pointer->Types + ((param_2 & 0xff) - 1))[0xc];
  return bVar1 <= bVar2 && bVar2 <= bVar1 + (weapon_pointer->Types + ((param_2 & 0xff) - 1))[1] + -1) & 0xffU);
}


void giveExp(CharSheet *param_1,s32 param_2){
  charExp *pcVar1;
  float fVar4 = (float)param_2 * 1.5f; //rom value  * 50 * 1.5 = 75 exp gains
  pcVar1 = param_1->EXP;
  pcVar1->spending += (s32)fVar4;
  pcVar1->total += (s32)fVar4;
  CharStats:::AddBase(param_1->Stats,STAT_LV,get_level(param_1) - CharStats::getBase(param_1->Stats,STAT_LV));
}

//above, but no spending exp or STAT_LV up
void exp_multi_1point5(CharSheet *param_1,s32 param_2){param_1->EXP->total+= (s32)((float)param_2 * 1.5f);}

u16 Entity::HealByPotion(CharSheet *param_1,u16 Hi,u16 Lo){

  u16 uVar3;
  float fVar4;
  
  if ((gGlobals.screenFadeModeSwitch != 2) || (uVar3 = 0, gGlobals.ShadowIndex == -1)) {
    fVar4 = (float)globals::rand_range(Hi,Lo) / 100.0f;
    fVar4 *= (float)getHPMax(param_1)
    if (fVar4 < INT_MAX_f) {uVar3 = (u16)fVar4;}
    else {uVar3 = (u16)(fVar4 - INT_MAX_f);}
    addHP(param_1,uVar3);
  }
  return uVar3;
}

void remove_effects(CharSheet *param_1){
  SpellEffect*peVar1;
  u32 uVar2;
  
  if (param_1->spellEffects != (SpellEffect*)0x0) {
    peVar1 = param_1->spellEffects;
    uVar2 = 0;
    while( true ) {
      if (peVar1->list[uVar2]) {
        FUN_800840dc(peVar1->list[uVar2]);
        HeapFree(param_1->spellEffects->list[uVar2],FILENAME,0xc25);
        param_1->spellEffects->list[uVar2] = NULL;
      }
      if (0xe < uVar2 + 1) break;
      peVar1 = param_1->spellEffects;
      uVar2++;
    }
  }
  return;
}

void clear_charsheet_potions(CharSheet *param_1){
  u32 i;
  if (param_1->potionEffects) {
    for(i=0;i<7;i++) {
      clear_charsheet_potion(param_1,i);
    }
  }
}

u32 get_level(CharSheet *param_1){
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

s32 get_EXP_TNL(CharSheet *param_1){
  u16 lv = get_level(param_1) + 1;
  if (lv == 41)return -1;
  return EXP_TNL[lv];
}

void clear_equip_enchantments_(CharSheet *param_1){
  CharGear *pCVar1;
  SpellEffect*peVar2;
  WeaponInstance **ppTVar3;
  PotionEffect **paVar4;
  u32 uVar4;
  
  uVar4 = 0;
  paVar4 = param_1->potionEffects;
  while( true ) {
    if ((paVar4[uVar4]) && (paVar4[uVar4]->ID != POTION_STEALTH)) {
      clear_charsheet_potion(param_1,uVar4 & 0xff);
    }
    uVar4++;
    if (6 < uVar4) break;
    paVar4 = param_1->potionEffects;
  }
  uVar4 = 0;
  peVar2 = param_1->spellEffects;
  while( true ) {
    if (peVar2->list[uVar4]) {Entity::ClearSpellEffect(param_1,uVar4,NULL);}
    uVar4++;
    if (0xe < uVar4) break;
    peVar2 = param_1->spellEffects;
  }
  FUN_8007ad40(param_1,*(WeaponInstance **)param_1->armor);
  uVar4 = 0;
  FUN_8007ad40(param_1,(WeaponInstance *)param_1->armor[1]);
  pCVar1 = param_1->pItemList;
  while( true ) {
    ppTVar3 = (WeaponInstance **)(pCVar1->pItem + uVar4);
    uVar4++;
    FUN_8007ad40(param_1,*ppTVar3);
    if (0xb < uVar4) break;
    pCVar1 = param_1->pItemList;
  }
  return;
}

void FUN_8007ad40(CharSheet *param_1,WeaponInstance *param_2){
  Temp_enchant *pTVar1;
  
  if (((param_2) &&
      (pTVar1 = param_2->enchantment, pTVar1)) &&
     (pTVar1->timer == -1)) {
    ApplySpellEffect(param_1,pTVar1->index,(u32)pTVar1->lv,pTVar1->timer,pTVar1->unk0x3,NULL);
  }
  return;
}

void teleportation_spell(CharSheet* ch,CombatEntity *param_1){
  float fVar3;
  u8 bVar4;
  u8 bVar5;
  
  if (param_1) {
    fVar3 = gCombatP->floatA;
    if (fVar3 < INT_MAX_f) {bVar4 = (u8)(s32)fVar3;}
    else {bVar4 = (u8)(s32)(fVar3 - INT_MAX_f);}
    fVar3 = gCombatP->FogFloat;
    if (fVar3 < INT_MAX_f) {bVar5 = (u8)(s32)fVar3;}
    else {bVar5 = (u8)(s32)(fVar3 - INT_MAX_f);}
    if (!combat_substruct_lookup(&gCombatP->substruct,bVar4,bVar5,param_1->unk0x23)) {
      set_combatEnt_x_y(param_1,gCombatP->floatA,gCombatP->FogFloat);
      FUN_800737b4(param_1);
      teleport_spell_sub(param_1);
    }
  }
  return;
}

void RemovePoison(CharSheet *param_1,CombatEntity *param_2,u8 param_3){
  Temp_enchant *pTVar1;
  SpellEffect*peVar2;
  u32 uVar3;
  
  uVar3 = 0;
  peVar2 = param_1->spellEffects;
  while( true ) {
    pTVar1 = peVar2->list[uVar3];
    if (((pTVar1) && (pTVar1->index == poison)) &&
       (pTVar1->unk0x3 < param_3))) {
      Entity::ClearSpellEffect(param_1,uVar3,param_2);
    }
    uVar3++;
    if (0xe < uVar3) break;
  }
  return;
}

void Entity::WraithTouch(CharSheet *param_1,CombatEntity* cEnt,u8 num,u8 slot){
  u8 wraithTouch_stats []={STAT_INT,STAT_WIL,STAT_DEX,STAT_STR};
  //Possible bug? looks like 1d4 is one off from array range. may lead to incorrect index.
  CharStats::AddModdedMagic(param_1->Stats,wraithTouch_stats[(u8)RollD(1,4)],-RollD(2,6));
  ALLOC(param_1->effects[slot],3308);
  CreateTempEnchant(param_1->effects[slot],SPELLIND_wraithTouch,uVar2,-1,SVar1,1);
}

void darkness_light_spell(CharSheet *param_1,SpellEnum param_2){
  CombatEntity *pCVar1;
  Temp_enchant *pTVar2;
  TimeOfDay TVar3;
  s32 iVar4;
  u32 uVar5;
  u32 uVar6;
  SpellEnum SVar7;
  CombatEntity *iVar3;
  
  SVar7 = darkness;
  if (param_2 == darkness) {SVar7 = light;}
  uVar6 = 0;
  if (gCombatP->EntCount != 0) {
    do {
      pCVar1 = &gCombatP->combatEnts[uVar6];
      uVar6++;
      if (pCVar1) {
        uVar5 = 0;
        while (uVar5 < 0xf) {
          pTVar2 = pCVar1->charSheetP->spellEffects->list[uVar5];
          if (pTVar2 == NULL) {uVar5++;}
          else {
            if (pTVar2->index == SVar7) {
              Entity::ClearSpellEffect(pCVar1->charSheetP,uVar5,pCVar1);
              break;
            }
            uVar5++;
          }
        }
      }
    } while (uVar6 < gCombatP->EntCount);
  }
  inc_dayNightMagic(TerrainPointer);
  if (param_2 == darkness) {TVar3 = NIGHT;}
  else {TVar3 = MIDDAY;}
  TerrainPointer->partOfDay = TVar3;
  return;
}

bool Entity::DispelMagic(CharSheet *param_1,char param_2,u8 param_3,u8 param_4){
  Temp_enchant *pTVar1;
  bool bVar2;
  SpellEffect*peVar3;
  u32 uVar4;
  s32 iVar5;
  u32 uVar6;
  MagicSchoolEnum MVar7;
  
  MVar7 = Chaos;
  if (param_3 == dispelNaming) MVar7 = SCHOOL_NAMING;
  else if (param_3 == dispelElemental) MVar7 = SCHOOL_ELEMENTAL;
  else if (param_3 == dispelNecro) MVar7 = SCHOOL_NECROMANCY;
  else if (param_3 == dispelStar) MVar7 = SCHOOL_STAR;
  iVar5 = 0;
  uVar4 = 0;
  uVar6 = 0;
  peVar3 = param_1->spellEffects;
  do {
    pTVar1 = peVar3->list[0];
    uVar6++;
    if ((pTVar1) && (pTVar1->school == MVar7)) {
      iVar5++;
      uVar4 += (s32)(char)pTVar1->unk0x3;
    }
    peVar3 = (SpellEffect*)(peVar3->list + 1);
  } while (uVar6 < 0xf);
  if ((iVar5 == 0) || (uVar6 = 0, ((s32)param_4) * iVar5 < uVar4)) {
    bVar2 = false;
  }
  else {
    peVar3 = param_1->spellEffects;
    while( true ) {
      if ((peVar3->list[uVar6]) && (peVar3->list[uVar6]->school == MVar7)) {
        Entity::ClearSpellEffect(param_1,uVar6 & 0xff,(CombatEntity *)(s32)param_2);
      }
      uVar6++;
      if (0xe < uVar6) break;
      peVar3 = param_1->spellEffects;
    }
    bVar2 = true;
  }
  return bVar2;
}

void Entity::DoubleTap(CharSheet *param_1){
  if (CharStats::getModded(param_1->Stats,STAT_END))
    CharStats::addModdedStat(param_1->Stats,STAT_END,-CharStats::getModded(pCVar2,STAT_END));
  if (CharStats::getModded(param_1->Stats,STAT_STAM))
    CharStats::addModdedStat(param_1->Stats,STAT_STAM,-CharStats::getModded(pCVar2,STAT_STAM));
  if (CharStats::getModded(param_1->Stats,STAT_LV))
    CharStats::addModdedStat(param_1->Stats,STAT_LV,-CharStats::getModded(pCVar2,STAT_LV));
}

bool check_healer_stam(CharSheet *param_1){
  char cVar2;
  s32 iVar1;
  bool bVar3;
  s32 iVar4;
  
  cVar2 = getModdedSkill(param_1->Skills,SKILL_HEALER);
  if (cVar2 == 0) {bVar3 = false;}
  else {
    iVar1 = CharStats::getModded(param_1->Stats,STAT_STAM);
    iVar4 = 11 - cVar2;
    if (iVar4 < 1) {iVar4 = 1;}
    bVar3 = iVar4 <= iVar1;
  }
  return bVar3;
}

bool check_healer_herb_stam(CharSheet *param_1){
  u8 cVar2;
  bool bVar3;
  s32 iVar1;
  s32 iVar4;
  
  cVar2 = getModdedSkill(param_1->Skills,SKILL_HEALER);
  bVar3 = false;
  if (cVar2 != 0) {
    if (!has_item_func((gGlobals.party)->inv,itemID_array[31])) {bVar3 = false;}
    else {
      iVar1 = CharStats::getModded(param_1->Stats,STAT_STAM);
      iVar4 = 5 - cVar2;
      if (iVar4 < 1) {iVar4 = 1;}
      bVar3 = iVar4 <= iVar1;
    }
  }
  return bVar3;
}

bool ofunc_check_trouador(CharSheet *param_1){
  char cVar2;
  s32 iVar1;
  bool bVar3;
  s32 iVar4;
  
  cVar2 = getModdedSkill(param_1->Skills,Troubadour);
  if (cVar2 == 0) {bVar3 = false;}
  else {
    iVar1 = CharStats::getModded(param_1->Stats,STAT_STAM);
    iVar4 = 3 - cVar2;
    if (iVar4 < 1) {iVar4 = 1;}
    bVar3 = iVar4 <= iVar1;
  }
  return bVar3;
}

WeaponInstance * Has_Item_equipped_character(CharSheet *param_1,ItemID param_2){
  CharGear *pCVar1;
  temp_gear *ptVar2;
  WeaponInstance *pTVar3;
  u32 uVar4;
  u32 uVar5;
  
  uVar4 = (s32)param_2 & 0xffff;
  uVar5 = uVar4 >> 8;
  if (uVar5 == 6) {pTVar3 = (WeaponInstance *)param_1->armor[1];}
  else {
    if (uVar5 < 7) {
      if (uVar5 != 5) {
        pCVar1 = param_1->pItemList;
LAB_8007b4b0:
        uVar5 = 0;
        if (pCVar1->num_used == 0) {
          return NULL;
        }
        ptVar2 = (temp_gear *)pCVar1->pItem;
        while ((pTVar3 = *(WeaponInstance **)((s32)ptVar2 + uVar5 * 4), pTVar3 == NULL ||
               ((u16)pTVar3->id != uVar4))) {
          uVar5 = uVar5 + 1;
          if ((u8)pCVar1->num_used <= uVar5) {
            return NULL;
          }
          ptVar2 = (temp_gear *)pCVar1->pItem;
        }
        return pTVar3;
      }
      pTVar3 = *(WeaponInstance **)param_1->armor;
    }
    else {
      if (uVar5 != 7) {
        pCVar1 = param_1->pItemList;
        goto LAB_8007b4b0;
      }
      pTVar3 = param_1->weapons;
    }
  }
  if ((pTVar3) && ((u16)pTVar3->id == uVar4)) {
    return pTVar3;
  }
  return NULL;
}

bool Ofunc_boolStaminaForSpell(CharSheet *param_1,Temp_spell *param_2){
  if (param_2) return spell_stamina_subtract(param_1,param_2,check_spell_wizard(param_1,param_2)) <= CharStats::getModded(param_1->Stats,STAT_STAM);
  return false;
}

void malloc_enchant(CharSheet *param_1,SpellEnum param_2,u8 param_3,u8 param_4,u32 timer,s32 param_6){
  Temp_enchant *pTVar2;
  Temp_enchant **ppTVar5;
  u32 uVar6;
  s32 iVar8;
  

  uVar6 = 0;
  while( true ) {
    if (param_1->spellEffects->list[uVar6] == NULL) {
      pTVar2 = (Temp_enchant *)heapAlloc(0x18,FILENAME,0xde3);
      ppTVar5 = param_1->spellEffects->list + uVar6;
      *ppTVar5 = pTVar2;
      CreateTempEnchant(*ppTVar5,param_2,(char)param_3,timer,param_4,0);
      if (param_6 == 0) {
        iVar8 = param_3 * 2;
        if (CharStats::getBase(param_1->Stats,STAT_STAM) < iVar8 + CharStats::getModded(param_1->Stats,STAT_STAM)) {
          iVar8 = CharStats::getBase(param_1->Stats,STAT_STAM) - CharStats::getModded(param_1->Stats,STAT_STAM);
        }
        CharStats::addModdedStat(param_1->Stats,STAT_STAM,(char)iVar8);
      }
      else {mod_stats(param_1,STAT_STAM,(char)((param_3 << 0x19) >> 0x18));}
      return;
    }
    if (0xe < uVar6 + 1) break;
    uVar6++;
  }
  return;
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


void mod_stats(CharSheet *param_1,u8 param_2,u8 param_3){
  if (!isDead(param_1)) {
    CharStats::AddModdedMagic(param_1->Stats,param_2,FUN_8007b6bc(param_1,param_2,param_3));
  }
}


void remove_stat_buff(CharSheet *param_1,u8 param_2,u8 param_3){
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

bool Entity::IsDebuffSpell(CharSheet* c,SpellEnum spell){
  char cVar1;
  SpellEnum *pSVar2;
  u8 debuffSpells[] =
  {SPELLIND_wraithTouch,SPELLIND_debilitation,SPELLIND_weakness,SPELLIND_exhaustion,SPELLIND_stupidity,SPELLIND_clumsiness,SPELLIND_NONE};
  
  pSVar2 = debuffSpells;
  if (spell) {
    if (debuffSpells[0] != SPELLIND_NONE) {
      do {
        cVar1 = *pSVar2++;
        if (spell == cVar1) {return true;}
      } while (*pSVar2 != -1);
    }
  }
  return false;
}

u8 Entity::GetShieldDefence(CharSheet *param_1,ItemID param_2){
  u8 bVar2 = 0;
  if (param_1->armor[1]) {bVar2 = param_1->armor[1]->DEF;}
  if (((param_2 != 0) && (param_2 >> 8 == 6)) && (!NoSheildSkill(param_1))) {
    bVar2 = armour_pointer->Armor[GetIDIndex(param_2)].defence;}
  return bVar2;
}

s32 some_armor_func(CharSheet *param_1,ItemID param_2){
  u8 bVar2;
  bool bVar3;
  temp_armor **pptVar4;
  temp_armor *ptVar5;
  u32 uVar6;
  s32 iVar7;
  s32 iVar8;
  
  iVar7 = 0;
  uVar6 = 0;
  pptVar4 = param_1->armor;
  do {
    uVar6++;
    if (*pptVar4) {iVar7+= (u32)(*pptVar4)->Protect;}
    pptVar4++;
  } while (uVar6 < 2);
  if (param_2 != 0) {
    bVar2 = GetIDIndex(param_2));
    iVar8 = 0;
    if (param_2 >> 8 == 5) {
      if (ret0()) {return iVar7;}
    }
    else {
      if (param_2 >> 8 != 6) return iVar7;
      if (NoSheildSkill(param_1)) return iVar7;
      iVar8 = 1;
    }
    if (*(temp_armor **)((s32)(temp_armor *)param_1->armor + iVar8 * 4)) {
      iVar7-= (u32)(*(temp_armor **)((s32)(temp_armor *)param_1->armor + iVar8 * 4))->Protect;
    }
    iVar7+= armour_pointer->Armor[bVar2].protection;
  }
  return iVar7;
}