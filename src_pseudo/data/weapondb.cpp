#include "weapondb.h"
#include "romcopy.h"
#include "heapN64.h"
#include "armordb.h"

#define FILENAME "../data/weapondb.cpp"

extern void*weapondb;

void WeaponDB::Orphaned() {
  byte *pbVar2;
  byte *pbVar3;
  byte bVar5;
  u32 aiStack_30 = 0;
  load_db_array_size(&weapondb,&this->Total,&aiStack_30);
  bVar5 = 0;
  ALLOCS(this->weapons,this->Total*sizeof(weapon_ram),0x34);
  for(u8 i=0;i<11;i++) {
    load_db_array_size(&weapondb,this->Types + i,&aiStack_30);
    pbVar2 = this->Types2 + i;
    pbVar3 = this->Types + i;
    *pbVar2 = bVar5;
    bVar5+= *pbVar3;
    aiStack_30+=*pbVar3 * sizeof(Weapon_ROM);
  }
}


void WeaponDB::Load(u8 index,int *pos) {
  u32 uVar4;
  weapon_ram *entry;
  Weapon_ROM fromROM;
  
  entry = this->weapons + index;
  ROMCOPYS(&fromROM,weapondb + *pos,sizeof(Weapon_ROM),78);
  memcpy(entry->name,&fromROM,21);
  entry->name[0x15] = 0;
  entry->ID = (ItemID)(fromROM.ID.id|fromROM.ID.type<<8);
  entry->wepClass = fromROM.WeaponType;
  entry->ReqSTR = fromROM.Required_Strength;
  entry->Hit = fromROM.Hit;
  entry->damage = fromROM.damage;
  entry->price = (u16)(fromROM.Price[0]|fromROM.Price[1]<<8);
  entry->SpellLV = fromROM.SpellLV;
  entry->Range = fromROM.Range;
  uVar4 = ((u32)fromROM.Range * 5) / 3;
  if (0xff < uVar4) uVar4 = 0xff;
  entry->Range = (byte)uVar4;
  entry->Animation = fromROM.Animation;
  entry->EXPMod = fromROM.EXPMod;
  entry->element = fromROM.Element;
  entry->aspect = fromROM.aspect;
  entry->stat = fromROM.StatEnhanced;
  entry->statMod = fromROM.StatAmmount;
  entry->Skill = fromROM.enhanced;
  entry->SkillMod = fromROM.ammount;
  entry->spell = getRomEquipSpell(fromROM.Spell.id|fromROM.Spell.type<<8);
  entry->spellAmmount = fromROM.spellAmmount;
  entry->ram0x2a = fromROM.unk0x2a;
  entry->spell2 = getRomEquipSpell(fromROM.Magic.id|fromROM.Magic.type<<8);
  entry->Spell2Ammount = fromROM.MagicAmmount;
  entry->elementResist = fromROM.ResistElement;
  *pos+=sizeof(Weapon_ROM);
  entry->ResistPercent = (float)fromROM.ResistPercent *.25f;
}

void WeaponDB::Init() {
  weapon_ram *pwVar1;
  byte bVar2;
  u32 uVar3;
  u8 index;
  u32 auStack_30 = 0;
  load_db_array_size(&weapondb,&this->Total,&auStack_30);
  index = 0;
  uVar3 = 0;
  ALLOCS(this->weapons,this->Total*sizeof(weapon_ram),378);
  for(u8 i=0;i<11;i++) {
    load_db_array_size(&weapondb,this->Types + i,&auStack_30);
    this->Types2[i] = (byte)index;
    for(u8 j=0;j<this->Types2[i];j++){
        Load(index++,(int*)&auStack_30);
      }
  }
}

void WeaponDB::Free(){HFREE(this->weapons,403);}