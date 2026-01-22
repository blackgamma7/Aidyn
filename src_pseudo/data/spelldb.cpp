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
    SPELLIND_escape,7,
    SPELLIND_removePoison,4,
    SPELLIND_AirSheild,1,
    SPELLIND_ControlElem,6,
    SPELLIND_debilitation,3,
    SPELLIND_DragonFlames,0,
    SPELLIND_EarthSmite,0,
    SPELLIND_fireball,0,
    SPELLIND_lightning,5,
    SPELLIND_strength,7,
    SPELLIND_wind,5,
    SPELLIND_teleportation,3,
    SPELLIND_brilliance,6,
    SPELLIND_stupidity,6,
    SPELLIND_banishing,6,
    SPELLIND_charming,6,
    SPELLIND_controlMarquis,6,
    SPELLIND_endurance,5,
    SPELLIND_senseAura,6,
    SPELLIND_weakness,3,
    SPELLIND_cheatDeath,5,
    SPELLIND_AcidBolt,0,
    SPELLIND_auraOfDeath,2,
    SPELLIND_controlZombies,6,
    SPELLIND_crushingDeath,0,
    SPELLIND_darkness,2,
    SPELLIND_haste,5,
    SPELLIND_exhaustion,5,
    SPELLIND_stamina,3,
    SPELLIND_tapStamina,3,
    SPELLIND_wallOfBones,8,
    SPELLIND_spiritSheild,1,
    SPELLIND_mirror,4,
    SPELLIND_vsElemental,4,
    SPELLIND_vsNaming,4,
    SPELLIND_vsNecromancy,4,
    SPELLIND_vsStar,4,
    SPELLIND_dispelElemental,4,
    SPELLIND_dispelNaming,4,
    SPELLIND_dispelNecro,4,
    SPELLIND_dispelStar,4,
    SPELLIND_photosynthesis,5,
    SPELLIND_solarWraith,2,
    SPELLIND_starlightSheild,1,
    SPELLIND_dexterity,5,
    SPELLIND_clumsiness,3,
    SPELLIND_frozenDoom,8,
    SPELLIND_light,2,
    SPELLIND_stellarGravity,3,
    SPELLIND_webOfStarlight,8,
    SPELLIND_whitefire,0,
    SPELLIND_wraithTouch,3,
    SPELLIND_poison,0,
    SPELLIND_NONE,-1
};
  for(u16 i=0; SpellIconIDs[i]!=SPELLIND_NONE;i+=2){
    if(SpellIconIDs[i]==index) return SpellIconIDs[i+1];
  }
  return 0;
}

