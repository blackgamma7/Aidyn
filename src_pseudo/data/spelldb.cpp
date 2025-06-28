#include "spells.h"
#include "heapN64.h"
#include "romcopy.h"

#define FILENAME "../data/spelldb.cpp"


void SpellDB::Orphaned(){
  Spell_RAM *pSVar1;
  byte *pbVar2;
  byte *pbVar3;
  byte bVar5;
  int aiStack_30 [12];
  
  aiStack_30[0] = 0;
  load_db_array_size(&spelldb,this,aiStack_30);
  bVar5 = 0;
  ALLOCS(this->spells,this->Total*sizeof(Spell_RAM),52);
  for(u8 i=0;i<6;i++) {
    load_db_array_size(&spelldb,this->Schools + i,aiStack_30);
    pbVar2 = this->schools2 + i;
    pbVar3 = this->Schools + i;
    *pbVar2 = bVar5;
    bVar5 += *pbVar3;
    aiStack_30[0] += (uint)*pbVar3 * sizeof(Spell_ROM);
  }
}


void SpellDB::Load(u8 index,u32 *pos){
  Spell_ROM ROM;
  
  Spell_RAM *Ram = this->spells + index;
  ROMCOPYS(&ROM,spelldb + *pos,sizeof(Spell_ROM),78);
  memcpy(Ram->Name,&ROM,0x17);
  Ram->Name[0x17] = '\0';
  Ram->Id = (ItemID)((ushort)ROM.ID.id + (ushort)ROM.ID.type * 0x100);
  Ram->School = ROM.School;
  Ram->Damage = ROM.Damage;
  Ram->stamina = ROM.StaminaCost;
  Ram->CastedMagic = ROM.TargetAmmount;
  Ram->Target = ROM.Target;
  Ram->unk0x1f = ROM.unk0x1e;
  Ram->WizardREQ = ROM.WizardRequired;
  Ram->Aspect = ROM.Aspect;
  Ram->Range = ROM.Range;
  Ram->ingredient = ROM.Ingredient;
  Ram->EXP_Modifyer = ROM.EXP_Modifyer;
  *pos+=sizeof(Spell_ROM);
}


void SpellDB::Init(){
  u32 auStack_30 = 0;
  load_db_array_size(&spelldb,&this->Total,&auStack_30);
  u8 index = 0;
  ALLOCS(this->spells,this->Total*sizeof(Spell_RAM),260);
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

