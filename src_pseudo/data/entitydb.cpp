#include "entity.h"
#include "heapN64.h"
#include "romcopy.h"
#include "dialougEnt.h"
#include "Borgindecies.h"
#define FILENAME "../data/entitydb.cpp"

//unused inialization method.
void EntityDB::OldInit(){
  EntityRAM *pEVar1;
  byte *pbVar2;
  byte *pbVar3;
  u32 uVar4;
  byte bVar5;
  int aiStack_30 [12];
  
  aiStack_30[0] = 0;
  load_db_array_size(&entitydb,this,aiStack_30);
  bVar5 = 0;
  uVar4 = 0;
  ALLOCS(this->entities,(u32)this->total*sizeof(EntityRAM),669);
  for(u8 i=0;i<7;i++) {
    load_db_array_size(&entitydb,this->catSizes + i,aiStack_30);
    pbVar2 = this->unk + i;
    pbVar3 = this->catSizes + i;
    *pbVar2 = bVar5;
    bVar5 += *pbVar3;
    aiStack_30[0] += (u32)*pbVar3 * 0x88;
  }
}
//change Litte-endian s16 value to Big-Endian
u16 ItemDB_SwapEndian(u8 *x){
  u16 sVar1 = (x[1]<<8|x[0]);
  if (sVar1) return sVar1;
  return Item_NONE;
}

//load entity data from rom. Messy use of u8* casting
void EntityDB::Load(u8 id,s32 *param_3){
  int iVar1;
  ItemID IVar3;
  u16 uVar4;
  char *pcVar5;
  u8 uVar6;
  u32 uVar7;
  u8 uVar8;
  u32 uVar9;
  EntityRAM *EntRam;
  Entity_ROM EntROM;
  
  EntRam = this->entities + id;
  iVar1 = *param_3;
  ROMCOPYS(&EntROM,entitydb+iVar1,sizeof(EntROM),704);
  memcpy(EntRam->Name,&EntROM,20);
  EntRam->Name[20] = '\0';
  EntRam->Category = EntROM.category;
  EntRam->ID = (ItemID)((u16)EntROM.id.id + (u16)EntROM.id.type * 0x100);
  EntRam->rom0x2b = EntROM.unk0x2b;
  EntRam->flags = 0;
  EntRam->aspect = EntROM.Aspect;
  if (EntROM.trueName) EntRam->flags = CHAR_TrueName;
  if (EntROM.Heavy) EntRam->flags|= CHAR_IsHeavy;
  memcpy(EntRam->Skills,&EntROM.Alchemist,sizeof(EntRam->Skills));
  memcpy(EntRam->weaponProf,&EntROM.Bite,sizeof(EntRam->weaponProf));
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
    EntRam->ritualIDs[uVar6] = ItemDB_SwapEndian((u8 *)(EntROM.name + uVar8));
  }
  memcpy(EntRam->RiualLvs,EntROM.name + uVar8,4);
  uVar6 = uVar8+4;
  EntRam->EXP = ((u16)(byte)EntROM.name[uVar6] * 0x18 + (u16)(byte)EntROM.name[uVar6]) * 2;
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
  ALLOCS(this->entities,this->total*sizeof(EntityRAM),1233);
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
  u16 uVar2;
  int iVar4;
  dialougeEntity_Info *pdVar5;
  EntityExtra *peVar6;
  dialougeEntity_Info *pdVar7;
  
  bVar3 = GETINDEX(id);
  if (ITEMIDTYPE(id) == DB_ENTITY) {
    if (gEntityExtras[0].index != 0) {
      peVar6 = gEntityExtras;
      iVar4 = 0;
      uVar1 = gEntityExtras[0].index;
      while (pdVar7 = (dialougeEntity_Info *)gEntityExtras,
            uVar1 != ((s16)(char)bVar3 + 1U & 0xff)) {
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
    if (ITEMIDTYPE(id) != DB_DIALOUGEENTITY) {
      return BORG8_PortraitNPCMale1;
    }
    if (dailougEnt_info_array[0].index != 0) {
      pdVar7 = dailougEnt_info_array;
      iVar4 = 0;
      pdVar5 = pdVar7;
      uVar2 = dailougEnt_info_array[0].index;
      while (uVar2 != ((s16)(char)bVar3 + 1U & 0xff)) {
        pdVar5 = pdVar5 + 1;
        uVar2 = pdVar5->index;
        iVar4 += 20;
        if (uVar2 == 0) {
          return BORG8_PortraitNPCMale1;
        }
      }
LAB_8007558c:
      return *(u32 *)((int)&((EntityExtra *)pdVar7)->portrait + iVar4);
    }
  }
  return BORG8_PortraitNPCMale1;
}

//get Borg7 Index of entity's model
u32 EntityDB::GetBorg7(ItemID id){
  byte bVar3;
  u16 uVar1;
  u16 uVar2;
  int iVar4;
  dialougeEntity_Info *pdVar5;
  EntityExtra *peVar6;
  dialougeEntity_Info *pdVar7;
  
  bVar3 = GETINDEX(id);
  if ((u16)ITEMIDTYPE(id) == DB_ENTITY) {
    if (gEntityExtras[0].index != 0) {
      peVar6 = gEntityExtras;
      iVar4 = 0;
      uVar1 = gEntityExtras[0].index;
      while (pdVar7 = (dialougeEntity_Info *)gEntityExtras,
            uVar1 != ((s16)(char)bVar3 + 1U & 0xff)) {
        peVar6 = peVar6 + 1;
        uVar1 = peVar6->index;
        iVar4 += 0x1c;
        if (uVar1 == 0) {
          return BORG7_Bat;
        }
      }
      goto LAB_80075674;
    }
  }
  else {
    if ((u16)ITEMIDTYPE(id) != DB_DIALOUGEENTITY) {
      return BORG7_Bat;
    }
    if (dailougEnt_info_array[0].index != 0) {
      pdVar7 = dailougEnt_info_array;
      iVar4 = 0;
      pdVar5 = pdVar7;
      uVar2 = dailougEnt_info_array[0].index;
      while (uVar2 != ((s16)(char)bVar3 + 1U & 0xff)) {
        pdVar5 = pdVar5 + 1;
        uVar2 = pdVar5->index;
        iVar4 += 20;
        if (uVar2 == 0) {
          return BORG7_Bat;
        }
      }
LAB_80075674:
      return *(u32 *)((int)&((EntityExtra *)pdVar7)->Model + iVar4);
    }
  }
  return BORG7_Bat;
}

//unused, names refernced elsewhere
char * EntityDB::GetEntityName(ItemID id){
  byte bVar2;
  EntityRAM *pEVar1;
  int iVar3;
  
  bVar2 = GETINDEX(id);
  switch(ITEMIDTYPE(id)){
    case DB_ENTITY: return this->entities[bVar2].Name;
    case DB_DIALOUGEENTITY: return gDialogEntityDBp->ents[bVar2].name;
    default:CRASH("Invalid ID type in GetEntityName!",FILENAME);
  };
}

// in older builds, used as part of CombatInitMacro1(), instead of GetCollideRadius()
float Ofunc_8007573c(EntityDB *param_1,ItemID id){
  return param_1->GetCollideRadius(id)+.25;
}

//sems to load "perception" value checked for sneaking. almost always 10.
float EntityDB::GetPerception(ItemID id){
  float fVar2 = 10.0f;
  if ((u16)ITEMIDTYPE(id) != DB_DIALOUGEENTITY) {
    fVar2 = (float)entities[GETINDEX(id)].unk0x20;
  }
  return fVar2;
}

//unknown what is was meant for.
float EntityDB::GetVal_21h(ItemID id){
  float fVar2 = 2.0;
  if ((u16)ITEMIDTYPE(id) != DB_DIALOUGEENTITY) 
    fVar2 = (float)entities[GETINDEX(id)].unk0x21;
  return fVar2;
}

//unknown if this is really "height."
float EntityDB::GetHeight(ItemID id){
  byte bVar3;
  u16 uVar1;
  u16 uVar2;
  dialougeEntity_Info *pdVar6;
  
  bVar3 = GETINDEX(id);
  if ((u16)ITEMIDTYPE(id) == DB_ENTITY) {
    if (gEntityExtras[0].index) {
      EntityExtra *peVar5 = gEntityExtras;
      uVar1 = gEntityExtras[0].index;
      do {
        if (uVar1 == ((s16)(char)bVar3 + 1U & 0xff)) return peVar5->height*peVar5->scale;
        peVar5++;
        uVar1 = peVar5->index;
      } while (uVar1 != 0);
    }
  }
  else if (((u16)ITEMIDTYPE(id) == DB_DIALOUGEENTITY) && (dailougEnt_info_array[0].index != 0)) {
    dialougeEntity_Info *pdVar6 = dailougEnt_info_array;
    uVar2 = dailougEnt_info_array[0].index;
    do {
      if (uVar2 == ((s16)(char)bVar3 + 1U & 0xff)) {
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
  
  if (ITEMIDTYPE(id) == DB_DIALOUGEENTITY) uVar3 = 0xff;
  else {
    bVar2 = GETINDEX(id);
    uVar3 = 0xff;
    if (((0xae < bVar2) && (uVar3 = 0x7f, 0xb5 < bVar2)) && (uVar3 = 0xff, bVar2 == 0xc0)) {
      uVar3 = 0x7f;
    }
  }
  return uVar3;
}

//not sure what this is for, used in "processPlayers" (aniimation speed?)
float EntityDB::GetFloatA(ItemID id){
  byte bVar2;
  u16 uVar1;
  int iVar3;
  EntityExtra *peVar4;
  
  if ((u16)ITEMIDTYPE(id) != DB_DIALOUGEENTITY) {
    bVar2 = GETINDEX(id);
    if (gEntityExtras[0].index != 0) {
      peVar4 = gEntityExtras;
      uVar1 = gEntityExtras[0].index;
      do {
        if (uVar1 == ((s16)(char)bVar2 + 1U & 0xff)) {
          return peVar4->unk10;
        }
        peVar4++;
        uVar1 = peVar4->index;
      } while (uVar1 != 0);
    }
  }
  return 0.4f;
}
//not sure what this is for, used in "processPlayers" always returns 0.4
float EntityDB::RetPoint4(ItemID id){
    if ((u16)ITEMIDTYPE(id) != DB_DIALOUGEENTITY)GETINDEX(id);
    return 0.4f;
}

//returns false if the entity is a left-handed archer
u8 EntityDB::IsRightHanded(ItemID id){
  
  if (ITEMIDTYPE(id) == DB_DIALOUGEENTITY) return true;
  switch(GETINDEX(id)) {
    case EntInd_NightBoss3:
    case EntInd_NightBoss2:
    case EntInd_NightBoss1:
    case EntInd_Woodsman3:
    case EntInd_Woodsman2:
    case EntInd_BanditBoss3:
    case EntInd_BanditBoss2:
    case EntInd_OgreGuard:
    case EntInd_BanditBoss:
    case EntInd_Becan:
    case EntInd_Keelin:
      return false;
    }
  return true;
}

float EntityDB::GetCollideRadius(ItemID id){
  byte bVar2;
  u16 uVar1;
  int iVar3;
  EntityExtra *peVar4;
  float fVar5;
  
  fVar5 = 0.55f;
  if ((u16)ITEMIDTYPE(id) != DB_DIALOUGEENTITY) {
    bVar2 = GETINDEX(id);
    fVar5 = 0.75f;
    if (gEntityExtras[0].index != 0) {
      peVar4 = gEntityExtras;
      iVar3 = 0;
      uVar1 = gEntityExtras[0].index;
      do {
        peVar4 = peVar4 + 1;
        if (uVar1 == ((s16)(char)bVar2 + 1U & 0xff)) {
          return *(float *)((int)&gEntityExtras[0].radius + iVar3);
        }
        uVar1 = peVar4->index;
        iVar3 += 0x1c;
      } while (uVar1 != 0);
    }
  }
  return fVar5;
}
//get scale modifier for model
float EntityDB::GetScale(ItemID id){
  byte ind;
  u16 uVar1;
  u16 uVar2;
  int iVar4;
  EntityExtra *peVar5;
  dialougeEntity_Info *pdVar6;
  
  ind = GETINDEX(id);
  if ((u16)ITEMIDTYPE(id) == DB_ENTITY) {
    if (gEntityExtras[0].index != 0) {
      peVar5 = gEntityExtras;
      iVar4 = 0;
      uVar1 = gEntityExtras[0].index;
      do {
        if (uVar1 == ((s16)(char)ind + 1U & 0xff)) {
          return *(float *)((int)&gEntityExtras[0].scale + iVar4);
        }
        peVar5 = peVar5 + 1;
        uVar1 = peVar5->index;
        iVar4 += 0x1c;
      } while (uVar1 != 0);
    }
  }
  else if ((ITEMIDTYPE(id) == DB_DIALOUGEENTITY) && (dailougEnt_info_array[0].index != 0)) {
    pdVar6 = dailougEnt_info_array;
    iVar4 = 0;
    uVar2 = dailougEnt_info_array[0].index;
    do {
      if (uVar2 == ((s16)(char)ind + 1U & 0xff)) {
        return *(float *)((int)&dailougEnt_info_array[0].b + iVar4);
      }
      pdVar6 = pdVar6 + 1;
      uVar2 = pdVar6->index;
      iVar4 += DB_DIALOUGEENTITY;
    } while (uVar2 != 0);
  }
  return 1;
}
