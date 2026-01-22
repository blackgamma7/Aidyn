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


byte SpellDB::GetIcon(ItemID id){

  u8 index = GETINDEX(id);
  u8 SpellIconIDs[]={
    SPELLIND_Immolation,0,
    SPELLIND_Escape,7,
    SPELLIND_RemovePoison,4,
    SPELLIND_AirShield,1,
    SPELLIND_ControlElem,6,
    SPELLIND_debilitation,3,
    SPELLIND_DragonFlames,0,
    SPELLIND_EarthSmite,0,
    SPELLIND_Fireball,0,
    SPELLIND_Lightning,5,
    SPELLIND_Strength,7,
    SPELLIND_Wind,5,
    SPELLIND_Teleportation,3,
    SPELLIND_Brilliance,6,
    SPELLIND_Stupidity,6,
    SPELLIND_Banishing,6,
    SPELLIND_Charming,6,
    SPELLIND_ControlMarquis,6,
    SPELLIND_Endurance,5,
    SPELLIND_SenseAura,6,
    SPELLIND_Weakness,3,
    SPELLIND_CheatDeath,5,
    SPELLIND_AcidBolt,0,
    SPELLIND_AuraOfDeath,2,
    SPELLIND_ControlZombies,6,
    SPELLIND_CrushingDeath,0,
    SPELLIND_Darkness,2,
    SPELLIND_Haste,5,
    SPELLIND_Exhaustion,5,
    SPELLIND_Stamina,3,
    SPELLIND_tapStamina,3,
    SPELLIND_WallOfBones,8,
    SPELLIND_SpiritShield,1,
    SPELLIND_Mirror,4,
    SPELLIND_VsElemental,4,
    SPELLIND_VsNaming,4,
    SPELLIND_VsNecromancy,4,
    SPELLIND_VsStar,4,
    SPELLIND_DispelElemental,4,
    SPELLIND_DispelNaming,4,
    SPELLIND_DispelNecro,4,
    SPELLIND_DispelStar,4,
    SPELLIND_Photosynthesis,5,
    SPELLIND_SolarWrath,2,
    SPELLIND_StarlightShield,1,
    SPELLIND_Dexterity,5,
    SPELLIND_Clumsiness,3,
    SPELLIND_FrozenDoom,8,
    SPELLIND_Light,2,
    SPELLIND_StellarGravity,3,
    SPELLIND_WebOfStarlight,8,
    SPELLIND_Whitefire,0,
    SPELLIND_WraithTouch,3,
    SPELLIND_Poison,0,
    SPELLIND_NONE,-1
};
  for(u16 i=0; SpellIconIDs[i]!=SPELLIND_NONE;i+=2){
    if(SpellIconIDs[i]==index) return SpellIconIDs[i+1];
  }
  return 0;
}

