#include "entity.h"
#include "heapN64.h"
#include "romcopy.h"
#define FILENAME "../data/entitydb.cpp"

//unused inialization method.
void EntityDB::OldInit(){
  Entity_Ram *pEVar1;
  byte *pbVar2;
  byte *pbVar3;
  uint uVar4;
  byte bVar5;
  int aiStack_30 [12];
  
  aiStack_30[0] = 0;
  load_db_array_size(&entitydb,this,aiStack_30);
  bVar5 = 0;
  uVar4 = 0;
  ALLOCS(this->entities,(uint)this->total*sizeof(Entity_Ram),669);
  for(u8 i=0;i<7;i++) {
    load_db_array_size(&entitydb,this->catSizes + i,aiStack_30);
    pbVar2 = this->unk + i;
    pbVar3 = this->catSizes + i;
    *pbVar2 = bVar5;
    bVar5 += *pbVar3;
    aiStack_30[0] += (uint)*pbVar3 * 0x88;
  }
}
//change Litte-endian short value to Big-Endian
u16 ItemDB_SwapEndian(u8 *x){
  u16 sVar1 = (x[1]<<8|x[0]);
  if (sVar1) return sVar1;
  return Item_NONE;
}

//load entity data from rom. Messy use of u8* casting
void EntityDB::Load(u8 id,s32 *param_3){
  int iVar1;
  ItemID IVar3;
  ushort uVar4;
  char *pcVar5;
  u8 uVar6;
  uint uVar7;
  u8 uVar8;
  uint uVar9;
  Entity_Ram *EntRam;
  Entity_ROM EntROM;
  
  EntRam = this->entities + id;
  iVar1 = *param_3;
  ROMCOPYS(&EntROM,entitydb+iVar1,sizeof(EntROM),704);
  memcpy(EntRam->Name,&EntROM,20);
  EntRam->Name[20] = '\0';
  EntRam->Category = EntROM.category;
  EntRam->ID = (ItemID)((ushort)EntROM.id.id + (ushort)EntROM.id.type * 0x100);
  EntRam->rom0x2b = EntROM.unk0x2b;
  EntRam->unk0x18 = 0;
  EntRam->aspect = EntROM.Aspect;
  if (EntROM.trueName) EntRam->unk0x18 = CHAR_TrueName;
  if (EntROM.Heavy) EntRam->unk0x18|= CHAR_IsHeavy;
  memcpy(EntRam->Skills,&EntROM.Alchemist,0xc);
  memcpy(EntRam->weaponProf,&EntROM.Bite,0xb);
  memcpy(EntRam->stats,&EntROM.Intelligence,6);
  memcpy(&EntRam->morale,&EntROM.morale,3);
  for(uVar8 = 0x4f,uVar6 = 0;uVar6 < 3;uVar6++,uVar8+=2) {
    EntRam->weapon[uVar6] = ItemDB_SwapEndian((u8 *)(EntROM.name + uVar8));
  }
  memcpy(&EntRam->unk0x20,EntROM.name + uVar8,2);
  uVar8+=2;
  for(uVar6 = 0;uVar6 < 5;uVar6++,uVar8+=2) {
    EntRam->spells[uVar6] = ItemDB_SwapEndian((u8 *)(EntROM.name + uVar8));
  }
  uVar6 = uVar8 + 1 & 0xff;
  EntRam->School = EntROM.name[uVar8];
  memcpy(EntRam->Spell_levels,EntROM.name + uVar6,5);
  uVar6+=5;
  memcpy(EntRam->unk0x55,EntROM.name + uVar6,5);
  uVar6+=5;
  memcpy(EntRam->unk0x5a,EntROM.name + uVar6,4);
  uVar6+=4;
  IVar3 = ItemDB_SwapEndian((u8 *)(EntROM.name + uVar6));
  uVar6+=2;
  uVar8 = uVar6+1;
  EntRam->Armor = IVar3;
  EntRam->BaseProtect = EntROM.name[uVar6];
  //single for loop iteration?
  IVar3 = ItemDB_SwapEndian((u8 *)(EntROM.name + uVar8));
  uVar6 = uVar8+2;
  uVar8 = uVar6+1;
  EntRam->Sheild = IVar3;
  EntRam->sheildStat = EntROM.name[uVar6];
  uVar6 = 0;
  do {
    uVar9 = uVar8+1;
    pcVar5 = EntROM.name + uVar8;
    uVar8 = uVar9+1;
    EntRam->Resist[uVar6] = *pcVar5;
    uVar7 = uVar6+1;
    EntRam->resistAmmount[uVar6] = (float)(byte)EntROM.name[uVar9] * .25;
    uVar6 = uVar7;
  } while (uVar7 < 2);
  for(uVar6 = 0;uVar6 < 5;uVar6++,uVar8+=2){
    EntRam->FFs[uVar6] = ItemDB_SwapEndian((u8 *)(EntROM.name + uVar8));
  }
  memcpy(EntRam->unk0x78,EntROM.name + uVar8,4);
  uVar6 = uVar8+4;
  EntRam->EXP = ((ushort)(byte)EntROM.name[uVar6] * 0x18 + (ushort)(byte)EntROM.name[uVar6]) * 2;
  EntRam->loot_Category = EntROM.name[uVar6+1];
  *param_3 = iVar1 + 0x88;
}

//initalize Entity data (well, part of it.)
void EntityDB::Init(){
  byte bVar2;
  byte bVar4;
  s32 asStack_30 = 0;
  load_db_array_size(&entitydb,this,&asStack_30);
  bVar4 = 0;
  ALLOCS(this->entities,this->total*sizeof(Entity_Ram),1233);
  for(u8 uVar3=0;uVar3<7;uVar3++) {
    load_db_array_size(&entitydb,this->catSizes + uVar3,asStack_30);
    bVar2 = 0;
    this->unk[uVar3] = bVar4;
    if (this->catSizes[uVar3]) {
      for(u8 bVar2=0;bVar2 < this->catSizes[uVar3];bVar2++){
        Load(bVar4++,&asStack_30);
      }
    }
  }
}

void EntityDB::Free(){HFREE(entities,1258);}

//get Borg8 Index of entity's portrait
u32 EntityDB::GetPortrait(ItemID id){
  byte bVar3;
  u16 uVar1;
  ushort uVar2;
  int iVar4;
  dialougeEntity_Info *pdVar5;
  entity_info *peVar6;
  dialougeEntity_Info *pdVar7;
  
  bVar3 = GetIDIndex(id);
  if (id >> 8 == DB_ENTITY) {
    if (entity_info_array[0].index != 0) {
      peVar6 = entity_info_array;
      iVar4 = 0;
      uVar1 = entity_info_array[0].index;
      while (pdVar7 = (dialougeEntity_Info *)entity_info_array,
            uVar1 != ((short)(char)bVar3 + 1U & 0xff)) {
        peVar6 = peVar6 + 1;
        uVar1 = peVar6->index;
        iVar4 += 0x1c;
        if (uVar1 == 0) {
          return BORG8_PortraitNPCMale1;
        }
      }
      goto LAB_8007558c;
    }
  }
  else {
    if (id >> 8 != DB_DIALOUGEENTITY) {
      return BORG8_PortraitNPCMale1;
    }
    if (dailougEnt_info_array[0].index != 0) {
      pdVar7 = dailougEnt_info_array;
      iVar4 = 0;
      pdVar5 = pdVar7;
      uVar2 = dailougEnt_info_array[0].index;
      while (uVar2 != ((short)(char)bVar3 + 1U & 0xff)) {
        pdVar5 = pdVar5 + 1;
        uVar2 = pdVar5->index;
        iVar4 += DB_DIALOUGEENTITY;
        if (uVar2 == 0) {
          return BORG8_PortraitNPCMale1;
        }
      }
LAB_8007558c:
      return *(u32 *)((int)&((entity_info *)pdVar7)->portrait + iVar4);
    }
  }
  return BORG8_PortraitNPCMale1;
}

//get Borg7 Index of entity's model
u32 EntityDB::GetBorg7(ItemID id){
  byte bVar3;
  u16 uVar1;
  ushort uVar2;
  int iVar4;
  dialougeEntity_Info *pdVar5;
  entity_info *peVar6;
  dialougeEntity_Info *pdVar7;
  
  bVar3 = GetIDIndex(id);
  if ((ushort)id >> 8 == DB_ENTITY) {
    if (entity_info_array[0].Index != 0) {
      peVar6 = entity_info_array;
      iVar4 = 0;
      uVar1 = entity_info_array[0].Index;
      while (pdVar7 = (dialougeEntity_Info *)entity_info_array,
            uVar1 != ((short)(char)bVar3 + 1U & 0xff)) {
        peVar6 = peVar6 + 1;
        uVar1 = peVar6->Index;
        iVar4 += 0x1c;
        if (uVar1 == 0) {
          return 0x2d4a;
        }
      }
      goto LAB_80075674;
    }
  }
  else {
    if ((ushort)id >> 8 != DB_DIALOUGEENTITY) {
      return 0x2d4a;
    }
    if (dailougEnt_info_array[0].index != 0) {
      pdVar7 = dailougEnt_info_array;
      iVar4 = 0;
      pdVar5 = pdVar7;
      uVar2 = dailougEnt_info_array[0].index;
      while (uVar2 != ((short)(char)bVar3 + 1U & 0xff)) {
        pdVar5 = pdVar5 + 1;
        uVar2 = pdVar5->index;
        iVar4 += DB_DIALOUGEENTITY;
        if (uVar2 == 0) {
          return 0x2d4a;
        }
      }
LAB_80075674:
      return *(u32 *)((int)&((entity_info *)pdVar7)->Model + iVar4);
    }
  }
  return 0x2d4a;
}

//unused, names refernced elsewhere
char * EntityDB::GetEntityName(ItemID id){
  byte bVar2;
  Entity_Ram *pEVar1;
  int iVar3;
  
  bVar2 = GetIDIndex(id);
  switch(id >> 8){
    case 2: return this->entities[bVar2].Name;
    case 14: return DialougEntityPointer->ents[bVar2].Name;
    default:CRASH("Invalid ID type in GetEntityName!",FILENAME);
  };
}

//no clue what is was meant for. unused
float Ofunc_8007573c(EntityDB *param_1,ItemID id){
  return param_1->GetFloatC(id)+.25;
}

//sems to load "perception" value checked for sneaking. almost always 10.
float EntityDB::GetPerception(ItemID id){
  float fVar2 = 10.0f;
  if ((ushort)id >> 8 != DB_DIALOUGEENTITY) {
    fVar2 = (float)entities[GetIDIndex(id)].unk0x20;
  }
  return fVar2;
}

//unknown what is was meant for.
float EntityDB::GetVal_21h(ItemID id){
  float fVar2 = 2.0;
  if ((ushort)id >> 8 != DB_DIALOUGEENTITY) 
    fVar2 = (float)entities[GetIDIndex(id)].unk0x21;
  return fVar2;
}

//unknown if this is really "height."
float EntityDB::GetHeight(ItemID id){
  byte bVar3;
  u16 uVar1;
  ushort uVar2;
  dialougeEntity_Info *pdVar6;
  
  bVar3 = GetIDIndex(id);
  if ((ushort)id >> 8 == DB_ENTITY) {
    if (entity_info_array[0].index) {
      entity_info *peVar5 = entity_info_array;
      uVar1 = entity_info_array[0].index;
      do {
        if (uVar1 == ((short)(char)bVar3 + 1U & 0xff)) return peVar5->b*peVar5->scale;
        peVar5++;
        uVar1 = peVar5->index;
      } while (uVar1 != 0);
    }
  }
  else if (((ushort)id >> 8 == DB_DIALOUGEENTITY) && (dailougEnt_info_array[0].index != 0)) {
    dialougeEntity_Info *pdVar6 = dailougEnt_info_array;
    uVar2 = dailougEnt_info_array[0].index;
    do {
      if (uVar2 == ((short)(char)bVar3 + 1U & 0xff)) {
        return pdVar6->a *pdVar6->b;
      }
      pdVar6++;
      uVar2 = pdVar6->index;
    } while (uVar2 != 0);
  }
  return 1.0f;
}

//used for camera positioning (entity eye level?)
float EntityDB::GetHeightMinPoint2(ItemID id){return GetHeight(id)-.2;}
//unused
float EntityDB::GetHeightplusPoint35(ItemID id){return GetHeight(id)+.35;}

//checks for battle capability of entity by ID.
u8 EntityDB::BattleCheck(ItemID id){
  u8 uVar3;
  byte bVar2;
  
  if (id >> 8 == DB_DIALOUGEENTITY) uVar3 = 0xff;
  else {
    bVar2 = GetIDIndex(id);
    uVar3 = 0xff;
    if (((0xae < bVar2) && (uVar3 = 0x7f, 0xb5 < bVar2)) && (uVar3 = 0xff, bVar2 == 0xc0)) {
      uVar3 = 0x7f;
    }
  }
  return uVar3;
}

//not sure what this is for, used in "processPlayers"
float EntityDB::GetFloatA(ItemID id){
  byte bVar2;
  u16 uVar1;
  int iVar3;
  entity_info *peVar4;
  
  if ((ushort)id >> 8 != DB_DIALOUGEENTITY) {
    bVar2 = GetIDIndex(id);
    if (entity_info_array[0].index != 0) {
      peVar4 = entity_info_array;
      uVar1 = entity_info_array[0].index;
      do {
        if (uVar1 == ((short)(char)bVar2 + 1U & 0xff)) {
          return peVar4->a;
        }
        peVar4++;
        uVar1 = peVar4->index;
      } while (uVar1 != 0);
    }
  }
  return 0.4f;
}
//not sure what this is for, used in "processPlayers"
float EntityDB::RetPoint4(ItemID id){
    if ((ushort)id >> 8 != DB_DIALOUGEENTITY)GetIDIndex(id);
    return 0.4f;
}

//returns false if the ID index matches a boss's.
u8 EntityDB::IsNotBoss(ItemID id){
  
  if (id >> 8 == DB_DIALOUGEENTITY) return true;
  switch(GetIDIndex(id)) {
    case 0x57:
    case 0x58:
    case 0x59:
    case 0x5c:
    case 0x5d:
    case 0x5e:
    case 0x5f:
    case 0x6c:
    case 0x7a:
    case 0x9c:
    case 0xa1:
      return false;
    }
  return true;
}

float EntityDB::GetFloatC(ItemID id){
  byte bVar2;
  u16 uVar1;
  int iVar3;
  entity_info *peVar4;
  float fVar5;
  
  fVar5 = 0.55f;
  if ((ushort)id >> 8 != DB_DIALOUGEENTITY) {
    bVar2 = GetIDIndex(id);
    fVar5 = 0.75f;
    if (entity_info_array[0].index != 0) {
      peVar4 = entity_info_array;
      iVar3 = 0;
      uVar1 = entity_info_array[0].index;
      do {
        peVar4 = peVar4 + 1;
        if (uVar1 == ((short)(char)bVar2 + 1U & 0xff)) {
          return *(float *)((int)&entity_info_array[0].c + iVar3);
        }
        uVar1 = peVar4->index;
        iVar3 += 0x1c;
      } while (uVar1 != 0);
    }
  }
  return fVar5;
}
//get scale modifier for model
float EntityDB::GetScale(ItemID param_2){
  byte bVar3;
  u16 uVar1;
  ushort uVar2;
  int iVar4;
  entity_info *peVar5;
  dialougeEntity_Info *pdVar6;
  
  bVar3 = GetIDIndex(param_2);
  if ((ushort)param_2 >> 8 == DB_ENTITY) {
    if (entity_info_array[0].index != 0) {
      peVar5 = entity_info_array;
      iVar4 = 0;
      uVar1 = entity_info_array[0].index;
      do {
        if (uVar1 == ((short)(char)bVar3 + 1U & 0xff)) {
          return *(float *)((int)&entity_info_array[0].scale + iVar4);
        }
        peVar5 = peVar5 + 1;
        uVar1 = peVar5->index;
        iVar4 += 0x1c;
      } while (uVar1 != 0);
    }
  }
  else if (((ushort)param_2 >> 8 == DB_DIALOUGEENTITY) && (dailougEnt_info_array[0].index != 0)) {
    pdVar6 = dailougEnt_info_array;
    iVar4 = 0;
    uVar2 = dailougEnt_info_array[0].index;
    do {
      if (uVar2 == ((short)(char)bVar3 + 1U & 0xff)) {
        return *(float *)((int)&dailougEnt_info_array[0].b + iVar4);
      }
      pdVar6 = pdVar6 + 1;
      uVar2 = pdVar6->index;
      iVar4 += DB_DIALOUGEENTITY;
    } while (uVar2 != 0);
  }
  return 1;
}
