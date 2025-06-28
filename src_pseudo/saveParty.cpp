#define FILENAME "./src/saveParty.cpp"

#include "globals.h"
#include "saveParty.h"


//repeated null-check that advances the bits in the save file.
#define SKIPCHECK(p,x) if(!p) Advance(sav,x);\
                       else

void SaveParty::SavePotionEffect(SaveFile *sav,PotionEffect *pot){
  SKIPCHECK(pot,SaveBits_PotionTimer){
    SaveBits(sav,pot->ID,SaveBits_PotionID);
    SaveBits(sav,pot->power,SaveBits_PotionPower);
    SaveTimer(sav,pot->timer);
  }
}

u8 SaveParty::LoadPotionEffect(SaveFile *sav,CharSheet *chara){
  u8 uVar1 = LoadBits(sav,SaveBits_PotionID);
  SKIPCHECK(uVar1,(SaveBits_PotionPower+SaveBits_Timer))
    Entity::ApplyPotionEffect(chara,uVar1,LoadBits(sav,SaveBits_PotionPower),LoadTimer(sav));
  return 0;
}

void SaveParty::SaveSpellEffect(SaveFile *sav,Temp_enchant *ench){
  SKIPCHECK(ench,SaveBits_SpellEffect){
    SaveBits(sav,ench->lv,SaveBits_SpellLV);
    SaveBits(sav,ench->index,SaveBits_SpellIndex);
    SaveBits(sav,ench->varA & 0x1f,SaveBits_SpellVarA);
    SaveBits(sav,(ench->varB != 0),SaveBits_SpellVarB);
    SaveTimer(sav,ench->timer);
  }
}

Temp_enchant * SaveParty::LoadSpellEffect(SaveFile *sav){
  Temp_enchant* Ench;
  u8 uVar1 = LoadBits(sav,SaveBits_SpellLV);
  if (!uVar1) {
    Advance(sav,(SaveBits_SpellSkip));
    Ench = NULL;
  }
  else {
    ALLOC(Ench,167);
    TempEnchant::Init(Ench,LoadBits(sav,SaveBits_SpellIndex),
      uVar1,0,LoadBits(sav,SaveBits_SpellVarA),((u8)LoadBits(sav,SaveBits_SpellVarB)!= 0));
    if (Ench->varA == 0x1f) Ench->varA = 0xff;
    Ench->timer = LoadTimer(sav);
  }
  return Ench;
}

void SaveParty::SaveStatMod(SaveFile *sav,StatMod *Mod){
  SKIPCHECK(Mod,SaveBits_StatMod) SaveBits(sav,(int)Mod->mod + 0x32U & 0x7f | (uint)(byte)Mod->stat << 7,SaveBits_StatMod);
}

StatMod * SaveParty::LoadStatMod(SaveFile *sav){
  StatMod *pSVar2;  
  u16 uVar1 = LoadBits(sav,SaveBits_StatMod);
  if (!uVar1) pSVar2 = NULL;
  else {
    ALLOC(pSVar2,0xe1);
    SetStatMod(pSVar2,(uVar1 >> 7),((uVar1 & 0x7f) - 50));
  }
  return pSVar2;
}

void SaveParty::SaveItem(SaveFile *sav,ItemInstance *item){
  if ((!item) || (!item->id)) Advance(sav,(SaveBits_ItemInstance));
  else {
    SaveBits(sav,item->id,SaveBits_ItemID);
    u32 dat = 0;
    if (item->spellCharge) {
      dat = item->spellCharge->Charges;
    }
    SaveBits(sav,dat,SaveBits_SpellCharge);
    SaveStatMod(sav,item->statMod);
  }
}

void SaveParty::LoadItem(SaveFile *sav,ItemInstance *item){
  SKIPCHECK(item,(SaveBits_ItemInstance)) {
    u16 uVar1 = LoadBits(sav,SaveBits_ItemID);
    SKIPCHECK(uVar1,SaveBits_SpellCharge+SaveBits_StatMod){
      item->InitItem(uVar1);
      uVar1 = LoadBits(sav,SaveBits_SpellCharge);
      if (item->spellCharge) item->spellCharge->Charges = uVar1;
      if (item->statMod) HFREE(item->statMod,308);
      item->statMod = LoadStatMod(sav);
    }
  }
}

void SaveParty::SaveCharEXP(SaveFile *sav,CharExp *exp){
  SKIPCHECK(exp,SaveBits_CharExp){
    SaveBits(sav,exp->total,SaveBits_Experience);
    SaveBits(sav,exp->spending,SaveBits_Experience);
  }
}

void SaveParty::LoadCharEXP(SaveFile *sav,CharExp *exp){
  SKIPCHECK(exp,SaveBits_CharExp) {
    exp->total = LoadBits(sav,SaveBits_Experience) & 0xffffff;
    exp->spending = LoadBits(sav,SaveBits_Experience) & 0xffffff;
  }
}
void SaveParty::SaveCharStats(SaveFile *sav,CharSheet *chara){
  SKIPCHECK(chara->Stats,(SaveBits_CharStats)) CharStats::Save(chara->Stats,sav);
}

void SaveParty::LoadCharStats(SaveFile *sav,CharStats_s* stats){
  SKIPCHECK(stats,(SaveBits_CharStats)) CharStats::Load(stats,sav);
}

void SaveParty::SaveSpell(SaveFile *sav,SpellBook *sb,u8 school){
  u8 uVar2;
  u8 uVar3;
  u8 abStack_20;
  
  if (school == SCHOOL_Chaos) school = SCHOOL_Star;
  uVar3 = gSpellDBp->schools2[school];
  uVar2 = uVar3 + gSpellDBp->Schools[school];
  for (; uVar3 < uVar2; uVar3++) {
    if(sb->HaveSpell(gSpellDBp->spells[uVar3].Id,&abStack_20))
      SaveBits(sav,sb->spells[abStack_20]->level,SaveBits_SpellLV);
    else Advance(sav,SaveBits_SpellLV);
  }
}

void SaveParty::LoadSpell(SaveFile *save,SpellBook *sb,u8 school){
  u16 uVar1;
  u8 uVar2;
  u8 uVar3;
  
  if (school == SCHOOL_Chaos) school = SCHOOL_Star;
  uVar3 = gSpellDBp->schools2[school];
  uVar2 = uVar3 + gSpellDBp->Schools[school];
  for (; uVar3 < uVar2; uVar3++) {
    uVar1 = LoadBits(save,SaveBits_SpellLV);
    if (uVar1) sb->NewSpell(gSpellDBp->spells[uVar3].Id,uVar1);
  }
}

void SaveParty::SaveSpellsFromSchool(SaveFile *sav,SpellBook *sb,u8 school){
    SKIPCHECK(sb,SaveBits_SpellSchools) {
    SaveSpell(sav,sb,SCHOOL_NONE);
    SaveSpell(sav,sb,school);
    u8 uVar1 = Save_SchoolMax - gSpellDBp->Schools[school];
    if (uVar1) Advance(sav,(uVar1 & 0x3f)*SaveBits_SpellLV);
  }
}

void SaveParty::LoadSpellsFromSchool(SaveFile *sav,SpellBook *sb,u8 school){
  SKIPCHECK(sb,SaveBits_SpellSchools) {
    LoadSpell(sav,sb,SCHOOL_NONE);
    LoadSpell(sav,sb,school);
    u8 uVar1 = Save_SchoolMax - gSpellDBp->Schools[school];
    if (uVar1) Advance(sav,(uVar1 & 0x3f)*SaveBits_SpellLV);
  }
}

void SaveParty::SaveInGameTime(SaveFile *sav){
  SaveBits(sav,World::GetInGameTime(TerrainPointer),SaveBits_Word);
}


void SaveParty::LoadInGameTime(SaveFile *sav){
  World::SetInGameTime(TerrainPointer,LoadBits(sav,SaveBits_Word));
}

void SaveParty::SaveGold(SaveFile *sav){
  SaveBits(sav,(PARTY)->Gold,SaveBits_Word);
}


u32 SaveParty::LoadGold(SaveFile *sav){ 
  return LoadBits(sav,SaveBits_Word);
}

//saves t/2 minutes
void SaveParty::SaveTimer(SaveFile *sav,u32 t){
  SaveBits(sav,(u16)(t / MINUTES(2)),SaveBits_Timer);
}

s32 SaveParty::LoadTimer(SaveFile *sav){
  u32 uVar1;
  int iVar2;
  
  uVar1 = LoadBits(sav,SaveBits_Timer);
  if (uVar1 == 0xfff) iVar2 = -1;
  else iVar2 = uVar1 * MINUTES(2);
  return iVar2;
}

void SaveParty::SaveAlaron(SaveFile *sav,CharSheet *param_2){
  u8 len;
  u8 i;
  
  i = 0;
  len = strlen(param_2->name);
  if (len) {
    for(i=0;i<len;i++) {
      SaveBits(sav,param_2->name[i],SaveBits_Byte);
    }
  }
  Advance(sav,(20 - len) * SaveBits_Byte);
  SaveSpell(sav,param_2->spellbook,SCHOOL_Elemental);
  SaveSpell(sav,param_2->spellbook,SCHOOL_Naming);
  SaveSpell(sav,param_2->spellbook,SCHOOL_Necromancy);
}

void SaveParty::LoadAlaron(SaveFile *sav,CharSheet *param_2){
  memset(param_2->name,0,20);
  for(u8 i=0;i<20;i++) {
    param_2->name[i] + LoadBits(sav,SaveBits_Byte);
  }
  LoadSpell(sav,param_2->spellbook,SCHOOL_Elemental);
  LoadSpell(sav,param_2->spellbook,SCHOOL_Naming);
  LoadSpell(sav,param_2->spellbook,SCHOOL_Necromancy);
}

u32 x=(SaveBits_PotionEffects);
void SaveParty::SaveCharSheet(SaveFile *sav,CharSheet *chara){
  u8 i;

  SKIPCHECK(chara,SaveBits_CharSheet){
    SaveBits(sav,chara->ID,SaveBits_Byte);
    SaveCharEXP(sav,chara->EXP);
    SaveCharStats(sav,chara);
    chara->Skills->Save(sav);
    for(i=0;i<1;i++) SaveItem(sav,&chara->armor[i]->base);
    SaveItem(sav,&chara->weapons->base);
    for(i=0;i<12;i++) SaveItem(sav,&chara->pItemList->pItem[i]->base);
    SaveSpellsFromSchool(sav,chara->spellbook,chara->EXP->school);
  }
}


CharSheet * SaveParty::LoadCharSheet(SaveFile *sav){
  u16 uVar1;
  CharSheet *chara;
  byte i;
  
  uVar1 = LoadBits(sav,SaveBits_Byte);
  if (!uVar1) {
    Advance(sav,SaveBits_CharSheet-SaveBits_Byte);
    chara = NULL;
  }
  else {
    ALLOC(chara,952);
    Entity::Init(chara,(ItemID)(uVar1 + 0x200),3);
    Entity::UnequipAll(chara);
    LoadCharEXP(sav,chara->EXP);
    LoadCharStats(sav,chara->Stats);
    chara->Skills->LoadAll(sav);
    LoadArmor(sav,chara);
    LoadShield(sav,chara);
    LoadWeapon(sav,chara);
    for(i=0;i<12;i++) LoadGear(sav,chara);
    chara->spellbook->Clear();
    chara->spellbook->Reset(0);
    LoadSpellsFromSchool(sav,chara->spellbook,chara->EXP->school);
  }
  return chara;
}

void SaveParty::SaveCharSheetEffects(SaveFile *sav,CharSheet *chara){
  u8 i;
  SKIPCHECK(chara,SaveBits_SpellEffects+SaveBits_PotionEffects+SaveBits_CharSheet){
    SaveCharSheet(sav,chara);
    SKIPCHECK(chara->effects,SaveBits_SpellEffects){
      for(i=0;i<MAGIC_FXMAX;i++) SaveSpellEffect(sav,chara->effects[i]);
    }
    SKIPCHECK(chara->potionEffects,SaveBits_PotionEffects);{
      for(i=0;i<POTION_FXMAX;i++) SavePotionEffect(sav,chara->potionEffects[i]);
    }
  }
}

CharSheet * SaveParty::LoadCharSheetEffects(SaveFile *sav){
  CharSheet *chara;
  u8 i;
  
  chara = LoadCharSheet(sav);
  if (!chara) {
    Advance(sav,(SaveBits_SpellEffects+SaveBits_PotionEffects));
    chara = NULL;
  }
  else {
    for(i=0;i<MAGIC_FXMAX;i++) chara->effects[i] = LoadSpellEffect(sav);
    ALLOCS(chara->potionEffects,sizeof(PotionEffect*) * POTION_FXMAX,1855);
    memset(chara->potionEffects,0,sizeof(PotionEffect*) * POTION_FXMAX);
    for(i=0;i<POTION_FXMAX;i++) LoadPotionEffect(sav,chara);
    chara->portrait = loadBorg8(gEntityDB->GetPortrait(chara->ID));
  }
  return chara;
}

void SaveParty::LoadShield(SaveFile *sav,CharSheet *param_2){
  u16 uVar2;
  uint uVar3;
  
  if (param_2->armor[1]) Entity::RemoveShield(param_2);
  uVar2 = LoadBits(sav,SaveBits_ItemID);
  SKIPCHECK(uVar2,SaveBits_ItemInstance-SaveBits_ItemID) {
    uVar3 = LoadBits(sav,SaveBits_SpellCharge);
    Entity::EquipSheild(param_2,(short)uVar2,LoadStatMod(sav));
    if ((param_2->armor[1]->base).spellCharge)
      (param_2->armor[1]->base).spellCharge->Charges = uVar3;
  }
}

void SaveParty::LoadWeapon(SaveFile *sav,CharSheet *chara){
  uint uVar3;
  
  if (chara->weapons) Entity::UnequipWeapons(chara);
  ItemID uVar2 = LoadBits(sav,SaveBits_ItemID);
  SKIPCHECK(uVar2,SaveBits_ItemInstance-SaveBits_ItemID) {
    uVar3 = LoadBits(sav,SaveBits_SpellCharge);
    Entity::EquipWeapon(chara,uVar2,LoadStatMod(sav));
    if ((chara->weapons->base).spellCharge)(chara->weapons->base).spellCharge->Charges = uVar3;
  }
}


void SaveParty::LoadArmor(SaveFile *sav,CharSheet *chara){
  u16 uVar2;
  uint uVar3;
  
  if (chara->armor[0])Entity::RemoveArmor(chara);
  uVar2 = LoadBits(sav,SaveBits_ItemID);
  SKIPCHECK(uVar2,SaveBits_ItemInstance-SaveBits_ItemID) {
    uVar3 = LoadBits(sav,SaveBits_SpellCharge);
    Entity::EquipArmor(chara,uVar2,LoadStatMod(sav));
    if (((*chara->armor)->base).spellCharge) ((*chara->armor)->base).spellCharge->Charges = (byte)uVar3;
  }
}

void SaveParty::LoadGear(SaveFile *sav,CharSheet *chara){
  u16 uVar2;
  uint uVar3;
  u32 slot;
  
  uVar2 = LoadBits(sav,SaveBits_ItemID);
  SKIPCHECK(uVar2,SaveBits_ItemInstance-SaveBits_ItemID) {
    uVar3 = SaveParty::LoadBits(sav,SaveBits_SpellCharge);
    slot = Entity::EquipGear(chara,uVar2,SaveParty::LoadStatMod(sav));
    if ((chara->pItemList->pItem[slot]->base).spellCharge) 
      (chara->pItemList->pItem[slot]->base).spellCharge->Charges = uVar3;
  }
}

