#include "spells.h"
#include "heapN64.h"
#include "romcopy.h"

#define FILENAME "../data/spelldb.cpp"


void SpellDB::Orphaned(){
  SpellRAM *pSVar1;
  u8 *pbVar2;
  u8 *pbVar3;
  u8 bVar5;
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


u8 SpellDB::GetIcon(ItemID id){

  u8 index = GETINDEX(id);
  u8 SpellIconIDs[]={
    SpellInd_Immolation,0,
    SpellInd_Escape,7,
    SpellInd_RemovePoison,4,
    SpellInd_AirShield,1,
    SpellInd_ControlElem,6,
    SpellInd_debilitation,3,
    SpellInd_DragonFlames,0,
    SpellInd_EarthSmite,0,
    SpellInd_Fireball,0,
    SpellInd_Lightning,5,
    SpellInd_Strength,7,
    SpellInd_Wind,5,
    SpellInd_Teleportation,3,
    SpellInd_Brilliance,6,
    SpellInd_Stupidity,6,
    SpellInd_Banishing,6,
    SpellInd_Charming,6,
    SpellInd_ControlMarquis,6,
    SpellInd_Endurance,5,
    SpellInd_SenseAura,6,
    SpellInd_Weakness,3,
    SpellInd_CheatDeath,5,
    SpellInd_AcidBolt,0,
    SpellInd_AuraOfDeath,2,
    SpellInd_ControlZombies,6,
    SpellInd_CrushingDeath,0,
    SpellInd_Darkness,2,
    SpellInd_Haste,5,
    SpellInd_Exhaustion,5,
    SpellInd_Stamina,3,
    SpellInd_tapStamina,3,
    SpellInd_WallOfBones,8,
    SpellInd_SpiritShield,1,
    SpellInd_Mirror,4,
    SpellInd_VsElemental,4,
    SpellInd_VsNaming,4,
    SpellInd_VsNecromancy,4,
    SpellInd_VsStar,4,
    SpellInd_DispelElemental,4,
    SpellInd_DispelNaming,4,
    SpellInd_DispelNecro,4,
    SpellInd_DispelStar,4,
    SpellInd_Photosynthesis,5,
    SpellInd_SolarWrath,2,
    SpellInd_StarlightShield,1,
    SpellInd_Dexterity,5,
    SpellInd_Clumsiness,3,
    SpellInd_FrozenDoom,8,
    SpellInd_Light,2,
    SpellInd_StellarGravity,3,
    SpellInd_WebOfStarlight,8,
    SpellInd_Whitefire,0,
    SpellInd_WraithTouch,3,
    SpellInd_Poison,0,
    SpellInd_NONE,-1
};
  for(u16 i=0; SpellIconIDs[i]!=SpellInd_NONE;i+=2){
    if(SpellIconIDs[i]==index) return SpellIconIDs[i+1];
  }
  return 0;
}

