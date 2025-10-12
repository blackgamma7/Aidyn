#include "romcopy.h"
#include "heapN64.h"
#include "dialougEnt.h"

#define FILENAME "../data/dialogEntitydb.cpp"

DialogEntityDB* gDialogEntityDBp=NULL;
extern void*dialouge_entity;
void DialogEntityDB::Orphaned(){
  s32 auStack16 [4];
  
  auStack16[0] = 0;
  load_db_array_size(&dialouge_entity,this,auStack16);
  ALLOCS(this->ents,this->total*sizeof(this->total),46);
}

void DialogEntityDB::Load(u8 index,u32 *pos){
  DialougeEntity_ROM temp;
  
  DialougEnt_RAM *pDVar2 = this->ents + index;
  ROMCOPYS(&temp,dialouge_entity + *pos,sizeof(DialougeEntity_ROM),63);
  memcpy(pDVar2->name,&temp,22);
  pDVar2->name[22] = '\0';
  *pos += sizeof(DialougeEntity_ROM);
  pDVar2->ID = (ItemID)((u16)temp.ID.id + (u16)temp.ID.type * 0x100);
}

void DialogEntityDB::Init(){
  u8 bVar2;
  u32 auStack24 [6];
  
  auStack24[0] = 0;
  load_db_array_size(&dialouge_entity,this,auStack24);
  ALLOCS(this->ents,this->total*sizeof(DialougEnt_RAM),143);
  bVar2 = 0;
  if (this->total != 0) {
    do {Load(bVar2++,auStack24);} while (bVar2 < this->total);
  }
}

void DialogEntityDB::Free(){HFREE(this->ents,159);}