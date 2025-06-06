#include "itemDB.h"
#include "romcopy.h"
#include "heapN64.h"
#include "armordb.h"
#define FILENAME "../data/itemdb.cpp"

extern void*itemDB; //ROM address of item data

void ItemDB::Orphaned(){
  byte bVar1;
  Gear_RAM *pGVar2;
  byte bVar6;
  int aiStack_30;
  
  aiStack_30[0] = 0;
  load_db_array_size(&itemDB,this,aiStack_30);
  bVar6 = 0;
  ALLOCS(this->Gear,this->total*sizeof(Gear_RAM),52);
  for(u8 i=0;i<11;i++) {
    load_db_array_size(&itemDB,this->totalPerGear + i,&aiStack_30);
    this->unk1[i] = bVar6;
    bVar1 = this->totalPerGear[i];
    bVar6 += this->totalPerGear[i];
    aiStack_30 += bVar1*sizeof(Gear_Rom);
  }
}
void ItemDB::LoadItem(u8 index,int *pos){
  Gear_Rom gRom;
  
  Gear_RAM *gRam = this->Gear + index;
  ROMCOPYS(&gRom,itemDB.unk + *pos + -1,sizeof(Gear_Rom),79);
  memcpy(gRam->name,&gRom,20);
  gRam->name[20] = '\0';
  //TODO: macro endian swapping instead to making them u8[2]'s
  gRam->ID = (ItemID)(gRom.ID.id|gRom.ID.type<<8);
  gRam->exp_multi = (u16)(gRom.ExpMulti[0]|(gRom.ExpMulti[1]<<8));
  gRam->damage = gRom.damage;
  gRam->Protection = gRom.Protection;
  gRam->STR = gRom.required_STR;
  gRam->INT = gRom.Required_INT;
  gRam->price = (u16)(gRom.price[0]|(gRom.price[1]<<8));
  gRam->aspect = gRom.Aspect;
  gRam->stat = gRom.stat;
  gRam->StatMod = gRom.statMod;
  gRam->skill = gRom.Skill;
  gRam->SkillMod = gRom.SkillMod;
  gRam->spell = getRomEquipSpell(gRom.Spell.type<<8|gRom.Spell.id);
  gRam->spellVal1 = gRom.spellvalue;
  gRam->spellVal2 = gRom.SpellValue2;
  gRam->magic = getRomEquipSpell(gRom.Magic.type<<8|gRom.Magic.id);
  gRam->magicAmmount = gRom.MagicAmmount;
  gRam->elementResist = gRom.ElementResist;
  *pos+=sizeof(Gear_Rom);
  gRam->ResistPercent = (float)gRom.ResistPercent*.25;
}

void ItemDB::Init(){
  int pos = 0;
  load_db_array_size(&itemDB,this,&pos);
  u8 k = 0;
  ALLOCS(this->Gear,this->total*sizeof(Gear_RAM),356);
  for(u8 i=0;i<11;i++){
    load_db_array_size(&itemDB,this->totalPerGear + i,&pos);
    this->unk1[i] = k;
    if (this->totalPerGear[i] != 0) {
      for(u8 j=0;j<this->totalPerGear[i];j++) {
        LoadItem(k++,&pos);
      }
    }
  }
}

void ItemDB::Free(){HFREE(this->Gear,381);}