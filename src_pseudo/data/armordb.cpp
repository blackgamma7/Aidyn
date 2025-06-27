#include "armordb.h"
#include "heapN64.h"
#include "romcopy.h"
#include "spells.h"
#define FILENAME "../data/armordb.cpp"

void ArmorDB::Orphaned(){
  int pos = 0;
  load_db_array_size(&armorDB,&this->total,&pos);
  ALLOCS(this->Armor,this->total*sizeof(ArmorRam),52);
  load_db_array_size(&armorDB,this,&pos);
  pos += (uint)this->armors * sizeof(ArmorRom);
  load_db_array_size(&armorDB,&this->sheilds,&pos);
}

u8 getRomEquipSpell(ItemID id){
  if (!id)return SPELLIND_NONE;
  for(u16 i=0;i<gSpellDBp->Total;i++){
    if (gSpellDBp->spells[i].Id == id) return (u8)i;
  }
  return SPELLIND_NONE;
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
  aRAM->price = (ushort)aRom.price[0] + (ushort)aRom.price[1] * 0x100;
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

void ArmorDB::Orphaned2(byte param_2){
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


u32 ArmorDB::GetBorg5(ItemID param_2){
  u32 uVar1;
  switch(GETINDEX(param_2)) {
  case 0x33:
    uVar1 = 0x351b;
    break;
  case 0x34:
    uVar1 = 0x351d;
    break;
  case 0x35:
    uVar1 = 0x353c;
    break;
  case 0x36:
    uVar1 = 0x3540;
    break;
  case 0x37:
    uVar1 = 0x3542;
    break;
  case 0x38:
    uVar1 = 0x3526;
    break;
  case 0x39:
    uVar1 = 0x3521;
    break;
  case 0x3a:
    uVar1 = 0x3534;
    break;
  case 0x3b:
    uVar1 = 0x3532;
    break;
  case 0x3c:
    uVar1 = 0x352f;
    break;
  case 0x3d:
    uVar1 = 0x353a;
    break;
  case 0x3e:
    uVar1 = 0x3528;
    break;
  case 0x3f:
    uVar1 = 0x351f;
    break;
  case 0x40:
    uVar1 = 0x353e;
    break;
  case 0x41:
    uVar1 = 0x3537;
    break;
  case 0x42:
    uVar1 = 0x352a;
    break;
  case 0x43:
    uVar1 = 0x3523;
    break;
  default:
    uVar1 = 0x38f9;
  }
  return uVar1;
}

