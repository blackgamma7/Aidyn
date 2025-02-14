#define FILENAME "./src/saveParty.cpp"

#include "saveParty.h"
#include "world.h"
#include "heapN64.h"

//repeated null-check that advances the bits in the save file.
#define SKIPCHECK(p,x) if(!p) Advance(sav,x);\
                       else

void SaveParty::SavePotionEffect(SaveFile *sav,PotionEffect *pot){
  SKIPCHECK(pot,20){
    SaveBits(sav,pot->ID,4);
    SaveBits(sav,pot->power,4);
    SaveTimer(sav,pot->timer);
  }
}

u8 SaveParty::LoadPotionEffect(SaveFile *sav,CharSheet *chara){
  u8 uVar1 = LoadBits(sav,4);
  SKIPCHECK(uVar1,16) Entity::ApplyPotionEffect(chara,uVar1,LoadBits(sav,4),LoadTimer(sav));
  return 0;
}

void SaveParty::SaveSpellEffect(SaveFile *sav,Temp_enchant *ench){
  SKIPCHECK(ench,28){
    SaveBits(sav,ench->lv,4);
    SaveBits(sav,ench->index,6);
    SaveBits(sav,ench->varA & 0x1f,5);
    SaveBits(sav,(ench->varB != 0),1);
    SaveTimer(sav,ench->timer);
  }
}

Temp_enchant * SaveParty::LoadSpellEffect(SaveFile *sav){
  Temp_enchant* Ench;
  u8 uVar1 = LoadBits(sav,4);
  if (!uVar1) {
    Advance(sav,0x18);
    Ench = NULL;
  }
  else {
    ALLOC(Ench,167);
    TempEnchant::Init(Ench,LoadBits(sav,6),uVar1,0,LoadBits(sav,5),((u8)LoadBits(sav,1)!= 0));
    if (Ench->varA == 0x1f) Ench->varA = 0xff;
    Ench->timer = LoadTimer(sav);
  }
  return Ench;
}

void SaveParty::SaveStatMod(SaveFile *sav,StatMod *Mod){
  SKIPCHECK(Mod,10) SaveBits(sav,(int)Mod->mod + 0x32U & 0x7f | (uint)(byte)Mod->stat << 7,10);
}

StatMod * SaveParty::LoadStatMod(SaveFile *sav){
  StatMod *pSVar2;  
  u16 uVar1 = LoadBits(sav,10);
  if (!uVar1) pSVar2 = NULL;
  else {
    ALLOC(pSVar2,0xe1);
    SetStatMod(pSVar2,(uVar1 >> 7),((uVar1 & 0x7f) - 50));
  }
  return pSVar2;
}

void SaveParty::SaveItem(SaveFile *sav,ItemInstance *item){
  if ((!item) || (!item->id.s)) Advance(sav,0x1c);
  else {
    SaveBits(sav,item->id.s,13);
    u32 dat = 0;
    if (item->spellCharge) {
      dat = item->spellCharge->Charges;
    }
    SaveBits(sav,dat,5);
    SaveStatMod(sav,item->statMod);
  }
}

void SaveParty::LoadItem(SaveFile *sav,ItemInstance *item){
  SKIPCHECK(item,0x1c) {
    u16 uVar1 = LoadBits(sav,0xd);
    SKIPCHECK(uVar1,0xf){
      ItemInstance::InitItem((EquipInstance *)item,uVar1);
      uVar1 = LoadBits(sav,5);
      if (item->spellCharge) item->spellCharge->Charges = uVar1;
      if (item->statMod) HFREE(item->statMod,308);
      item->statMod = LoadStatMod(sav);
    }
  }
}

void SaveParty::SaveCharEXP(SaveFile *sav,charExp *exp){
  SKIPCHECK(exp,48){
    SaveBits(sav,exp->total,24);
    SaveBits(sav,exp->spending,24);
  }
}

void SaveParty::LoadCharEXP(SaveFile *sav,charExp *exp){
  SKIPCHECK(exp,48) {
    exp->total = LoadBits(sav,24) & 0xffffff;
    exp->spending = LoadBits(sav,24) & 0xffffff;
  }
}

void SaveParty::SaveCharStats(SaveFile *sav,CharSheet *chara){
  SKIPCHECK(chara->Stats,80) CharStats::Save(chara->Stats,sav);
}

void SaveParty::LoadCharStats(SaveFile *sav,CharStats_s* stats){
  SKIPCHECK(stats,80) CharStats::Load(stats,sav);
}

void SaveParty::SaveSpell(SaveFile *sav,SpellBook *sb,u8 school){
  u8 uVar2;
  u8 uVar3;
  u8 abStack_20;
  
  if (school == SCHOOL_Chaos) school = SCHOOL_Star;
  uVar3 = gLoadedSpells->schools2[school];
  uVar2 = uVar3 + gLoadedSpells->Schools[school];
  for (; uVar3 < uVar2; uVar3++) {
    if(sb->HaveSpell(gLoadedSpells->spells[uVar3].Id,&abStack_20))
      SaveBits(sav,sb->spells[abStack_20]->level,4);
    else Advance(sav,4);
  }
}

void SaveParty::LoadSpell(SaveFile *save,SpellBook *sb,u8 school){
  u16 uVar1;
  u8 uVar2;
  u8 uVar3;
  
  if (school == SCHOOL_Chaos) school = SCHOOL_Star;
  uVar3 = gLoadedSpells->schools2[school];
  uVar2 = uVar3 + gLoadedSpells->Schools[school];
  for (; uVar3 < uVar2; uVar3++) {
    uVar1 = LoadBits(save,4);
    if (uVar1) sb->NewSpell(gLoadedSpells->spells[uVar3].Id,uVar1);
  }
}

void SaveParty::SaveSpellsFromSchool(SaveFile *sav,SpellBook *sb,u8 school){
    SKIPCHECK(sb,0x5c) {
    SaveSpell(sav,sb,SCHOOL_NONE);
    SaveSpell(sav,sb,school);
    u8 uVar1 = 13 - gLoadedSpells->Schools[school];
    if (uVar1) Advance(sav,(uVar1 & 0x3f) << 2);
  }
}

void SaveParty::LoadSpellsFromSchool(SaveFile *sav,SpellBook *sb,u8 school){
  SKIPCHECK(sb,0x5c) {
    LoadSpell(sav,sb,SCHOOL_NONE);
    LoadSpell(sav,sb,school);
    u8 uVar1 = 13 - gLoadedSpells->Schools[school];
    if (uVar1) Advance(sav,(uVar1 & 0x3f) << 2);
  }
}

void SaveParty::SaveInGameTime(SaveFile *sav){
  SaveBits(sav,World::GetInGameTime(TerrainPointer),32);
}


void SaveParty::LoadInGameTime(SaveFile *sav){
  World::SetInGameTime(TerrainPointer,LoadBits(sav,32));
}


void SaveParty::SaveGold(SaveFile *sav){
  SaveBits(sav,(PARTY)->Gold,32);
}


u32 SaveParty::LoadGold(SaveFile *sav){ 
  return LoadBits(sav,32);
}


void SaveParty::SaveTimer(SaveFile *sav,u32 t){
  SaveBits(sav,(u16)(t / 7200),12);
}


s32 SaveParty::LoadTimer(SaveFile *sav){
  u32 uVar1;
  int iVar2;
  
  uVar1 = LoadBits(sav,12);
  if (uVar1 == 0xfff) iVar2 = -1;
  else iVar2 = uVar1 * 7200;
  return iVar2;
}

void SaveParty::SaveAlaron(SaveFile *sav,CharSheet *param_2){
  u8 len;
  u8 i;
  
  i = 0;
  len = strlen(param_2->name);
  if (len) {
    for(i=0;i<len;i++) {
      SaveBits(sav,param_2->name[i],8);
    }
  }
  Advance(sav,(20 - len) * 8);
  SaveSpell(sav,param_2->spellbook,SCHOOL_Elemental);
  SaveSpell(sav,param_2->spellbook,SCHOOL_Naming);
  SaveSpell(sav,param_2->spellbook,SCHOOL_Necromancy);
}

void SaveParty::LoadAlaron(SaveFile *sav,CharSheet *param_2){
  memset(param_2->name,0,20);
  for(u8 i=0;i<20;i++) {
    param_2->name[i] + LoadBits(sav,8);
  }
  LoadSpell(sav,param_2->spellbook,SCHOOL_Elemental);
  LoadSpell(sav,param_2->spellbook,SCHOOL_Naming);
  LoadSpell(sav,param_2->spellbook,SCHOOL_Necromancy);
}


void SaveParty::SaveCharSheet(SaveFile *sav,CharSheet *chara){
  u8 i;

  SKIPCHECK(chara,720){
    SaveBits(sav,(chara->ID).ID,8);
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
  
  uVar1 = LoadBits(sav,8);
  if (!uVar1) {
    Advance(sav,712);
    chara = NULL;
  }
  else {
    ALLOC(chara,952);
    Entity::Init(chara,(ItemID)(uVar1 + 0x200),3);
    Entity::UnequipAll(chara);
    bVar2 = 0;
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
  SKIPCHECK(chara,0x500){
    SaveCharSheet(sav,chara);
    SKIPCHECK(chara->effects,420){
      for(i=0;i<MAGIC_FXMAX;i++) SaveSpellEffect(sav,chara->effects[i]);
    }
    SKIPCHECK(chara->potionEffects,140);{
      for(i=0;i<POTION_FXMAX;i++) SavePotionEffect(sav,chara->potionEffects[i]);
    }
  }
}

CharSheet * SaveParty::LoadCharSheetEffects(SaveFile *sav){
  CharSheet *chara;
  u8 i;
  
  chara = LoadCharSheet(sav);
  if (!chara) {
    Advance(sav,0x230);
    chara = NULL;
  }
  else {
    for(i=0;i<MAGIC_FXMAX;i++) chara->effects[i] = LoadSpellEffect(sav);
    ALLOCS(chara->potionEffects,sizeof(PotionEffect*) * POTION_FXMAX,1855);
    memset(chara->potionEffects,0,0x1c);
    for(i=0;i<POTION_FXMAX;i++) LoadPotionEffect(sav,chara);
    chara->portrait = loadBorg8(getEntityPortrait(gEntityDB,chara->ID));
  }
  return chara;
}

void SaveParty::LoadShield(SaveFile *sav,CharSheet *param_2){
  u16 uVar2;
  uint uVar3;
  
  if (param_2->armor[1]) Entity::RemoveShield(param_2);
  uVar2 = LoadBits(sav,0xd);
  SKIPCHECK(uVar2,15) {
    uVar3 = LoadBits(sav,5);
    Entity::EquipSheild(param_2,(short)uVar2,LoadStatMod(sav));
    if ((param_2->armor[1]->base).spellCharge)
      (param_2->armor[1]->base).spellCharge->Charges = uVar3;
  }
}

void SaveParty::LoadWeapon(SaveFile *sav,CharSheet *chara){
  u16 uVar2;
  uint uVar3;
  
  if (chara->weapons) Entity::UnequipWeapons(chara);
  uVar2 = LoadBits(sav,0xd);
  SKIPCHECK(uVar2,15) {
    uVar3 = LoadBits(sav,5);
    Entity::EquipWeapon(chara,uVar2,LoadStatMod(sav));
    if ((chara->weapons->base).spellCharge)(chara->weapons->base).spellCharge->Charges = uVar3;
  }
}


void SaveParty::LoadArmor(SaveFile *sav,CharSheet *chara){
  u16 uVar2;
  uint uVar3;
  
  if (chara->armor[0])Entity::RemoveArmor(chara);
  uVar2 = LoadBits(sav,0xd);
  SKIPCHECK(uVar2,15) {
    uVar3 = LoadBits(sav,5);
    Entity::EquipArmor(chara,uVar2,LoadStatMod(sav));
    if (((*chara->armor)->base).spellCharge) ((*chara->armor)->base).spellCharge->Charges = (byte)uVar3;
  }
}

void SaveParty::LoadGear(SaveFile *sav,CharSheet *chara){
  u16 uVar2;
  uint uVar3;
  u32 slot;
  
  uVar2 = LoadBits(sav,0xd);
  SKIPCHECK(uVar2,15) {
    uVar3 = SaveParty::LoadBits(sav,5);
    slot = Entity::EquipGear(chara,uVar2,SaveParty::LoadStatMod(sav));
    if ((chara->pItemList->pItem[slot]->base).spellCharge) 
      (chara->pItemList->pItem[slot]->base).spellCharge->Charges = uVar3;
  }
}

