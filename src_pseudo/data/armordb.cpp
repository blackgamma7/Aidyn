#include "armordb.h"
#include "heapN64.h"
#include "romcopy.h"
#include "spells.h"
#include "BorgIndecies.h"
#define FILENAME "../data/armordb.cpp"

extern u8 armorDB[];

void ArmorDB::Orphaned(){
  int pos = 0;
  load_db_array_size(&armorDB,&this->total,&pos);
  ALLOCS(this->Armor,this->total*sizeof(ArmorRam),52);
  load_db_array_size(&armorDB,this,&pos);
  pos += (u32)this->armors * sizeof(ArmorRom);
  load_db_array_size(&armorDB,&this->sheilds,&pos);
}

u8 getRomEquipSpell(ItemID id){
  if (!id)return SpellInd_NONE;
  for(u16 i=0;i<gSpellDBp->Total;i++){
    if (gSpellDBp->spells[i].Id == id) return (u8)i;
  }
  return SpellInd_NONE;
}

void ArmorDB::Load(u8 index,u32 *pos){
  ArmorRam *aRAM;
  ArmorRom aRom;
  
  aRAM = this->Armor + index;
  ROMCOPYS(&aRom,armorDB + *pos,sizeof(ArmorRom),102);
  memcpy(&aRAM->name,&aRom,23);
  aRAM->name[23] = 0;
  aRAM->ID = (ItemID)(aRom.id.type<<8|aRom.id.id);
  aRAM->slot = aRom.slot;
  aRAM->defence = aRom.Defence;
  aRAM->protection = aRom.protection;
  aRAM->dex = aRom.dex;
  aRAM->rom0x1d = aRom.unk0x1d;
  aRAM->stealth = aRom.stealth;
  aRAM->price = (u16)aRom.price[0] + (u16)aRom.price[1] * 0x100;
  aRAM->expBonus = aRom.expBonus;
  aRAM->aspect = aRom.aspect;
  aRAM->stat = aRom.stat;
  aRAM->statNum = aRom.statNum;
  aRAM->skill = aRom.skill;
  aRAM->skillNum = aRom.skillNum;
  aRAM->spell = getRomEquipSpell(aRom.spell.type<<8|aRom.spell.id);
  aRAM->spellLV = aRom.SpellLV;
  aRAM->SpellCharge = aRom.unk0x2a;
  aRAM->magic = getRomEquipSpell(aRom.magic.type<<8|aRom.magic.id);
  aRAM->magicLV = aRom.magicLV;
  aRAM->element = aRom.Element;
  aRAM->resistpercent = (float)aRom.ElementResist * 0.25f;
  *pos+=sizeof(ArmorRom);
}

void ArmorDB::Orphaned2(u8 param_2){
  u32 aiStack_10 [4];
  
  for(u8 i=0;i<this->total;i++){
    if(ArmorList[i]==param_2){
        aiStack_10[0] = i * sizeof(ArmorRom) + 8;
        if (this->armors <= i) {
          aiStack_10[0] = i * sizeof(ArmorRom) + 0xc;
        }
        Load(i,aiStack_10);
        return;
      }
  }
}

void ArmorDB::Init(){
  u8 j;
  u8 i;
  u32 pos= 0;
  load_db_array_size(&armorDB,&this->total,pos);
  i = 0;
  ALLOCS(this->Armor,this->total*sizeof(ArmorRam),410);
  load_db_array_size(&armorDB,this,pos);
  for(j = 0;j<this->armors;j++,i++){Load(i,&pos);}
  load_db_array_size(&armorDB,&this->sheilds,pos);
  for(j = 0;j<this->sheilds;j++,i++){Load(i,&pos);}
}

void ArmorDB::Free(){HFREE(this->Armor,455);}

//return index for shield model. (or 0x38f9/0x38fa if none available.)
u32 ArmorDB::GetBorg5(ItemID ID){
  u32 uVar1;
  switch(GETINDEX(ID)) {
  case ArmorInd_ShieldSheridan:
    uVar1 = BORG5_ShieldSheridan;
    break;
  case ArmorInd_ShieldStardrake:
    uVar1 = BORG5_ShieldStardrake;
    break;
  case ArmorInd_ShieldTurtle:
    uVar1 = BORG5_ShieldTurtle;
    break;
  case ArmorInd_ShieldMoon:
    uVar1 = BORG5_ShieldMoon;
    break;
  case ArmorInd_ShieldSun:
    uVar1 = BORG5_ShieldSun;
    break;
  case ArmorInd_ShieldScorpion:
    uVar1 = BORG5_ShieldScorpion;
    break;
  case ArmorInd_ShieldBuckler:
    uVar1 = BORG5_ShieldBuckler;
    break;
  case ArmorInd_ShieldSmall:
    uVar1 = BORG5_ShieldSmall;
    break;
  case ArmorInd_ShieldLarge:
    uVar1 = BORG5_ShieldLarge;
    break;
  case ArmorInd_ShieldKite:
    uVar1 = BORG5_ShieldKite;
    break;
  case ArmorInd_ShieldTower:
    uVar1 = BORG5_ShieldTower;
    break;
  case ArmorInd_ShieldHeater:
    uVar1 = BORG5_ShieldHeater;
    break;
  case ArmorInd_ShieldBronze:
    uVar1 = BORG5_ShieldBronze;
    break;
  case ArmorInd_ShieldJundar:
    uVar1 = BORG5_ShieldJundar;
    break;
  case ArmorInd_ShieldSpirit:
    uVar1 = BORG5_ShieldSpirit;
    break;
  case ArmorInd_ShieldHoplite:
    uVar1 = BORG5_ShieldHoplite;
    break;
  case ArmorInd_ShieldChaos:
    uVar1 = BORG5_ShieldChaos;
    break;
  default: //Crab, Wight and Dryad shields have no model?
    uVar1 = BORG5_ShieldNONE;
  }
  return uVar1;
}

