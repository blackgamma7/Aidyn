#include "spells.h"
#include "heapN64.h"
#include "romcopy.h"

#define FILENAME "../data/spelldb.cpp"


void SpellDB::Orphaned(){
  SpellRAM *pSVar1;
  byte *pbVar2;
  byte *pbVar3;
  byte bVar5;
  int aiStack_30 [12];
  
  aiStack_30[0] = 0;
  load_db_array_size(&spelldb,this,aiStack_30);
  bVar5 = 0;
  ALLOCS(this->spells,this->Total*sizeof(SpellRAM),52);
  for(u8 i=0;i<6;i++) {
    load_db_array_size(&spelldb,this->Schools + i,aiStack_30);
    pbVar2 = this->schools2 + i;
    pbVar3 = this->Schools + i;
    *pbVar2 = bVar5;
    bVar5 += *pbVar3;
    aiStack_30[0] += (u32)*pbVar3 * sizeof(Spell_ROM);
  }
}


void SpellDB::Load(u8 index,u32 *pos){
  Spell_ROM ROM;
  
  SpellRAM *Ram = this->spells + index;
  ROMCOPYS(&ROM,spelldb + *pos,sizeof(Spell_ROM),78);
  memcpy(Ram->name,&ROM,0x17);
  Ram->name[0x17] = '\0';
  Ram->Id = (ItemID)((u16)ROM.ID.id + (u16)ROM.ID.type * 0x100);
  Ram->school = ROM.School;
  Ram->damage = ROM.Damage;
  Ram->stamina = ROM.StaminaCost;
  Ram->CastedMagic = ROM.TargetAmmount;
  Ram->target = ROM.Target;
  Ram->unk0x1f = ROM.unk0x1e;
  Ram->wizard = ROM.WizardRequired;
  Ram->Aspect = ROM.Aspect;
  Ram->range = ROM.Range;
  Ram->ingredient = ROM.Ingredient;
  Ram->expMod = ROM.EXP_Modifyer;
  *pos+=sizeof(Spell_ROM);
}


void SpellDB::Init(){
  u32 auStack_30 = 0;
  load_db_array_size(&spelldb,&this->Total,&auStack_30);
  u8 index = 0;
  ALLOCS(this->spells,this->Total*sizeof(SpellRAM),260);
  for(u8 i=0;i<6;i++){
    load_db_array_size(&spelldb,this->Schools + i,&auStack_30);
    this->schools2[i] = index;
    if (this->Schools[i] != 0) {
      for(u8 j=0;j<this->Schools[i];j++) {
        Load(index,&auStack_30);
        index++;
      }
    }
  }
}

void SpellDB::Free(){HFREE(this->spells,285);}

extern u8 SpellIconIDs[110]; //TODO- fill out in relevant func.
byte SpellDB::GetIcon(ItemID param_2){

  u8 index = GETINDEX(param_2);
  for(u16 i=0; SpellIconIDs[i]!=0xff;i+=2){
    if(SpellIconIDs[i]==index) return SpellIconIDs[i+1];
  }
  return 0;
}

