void Ofunc_80074ca0(DialoigEntPointer *param_1){
  DialougEnt_RAM *pDVar1;
  undefined4 auStack16 [4];
  
  auStack16[0] = 0;
  load_db_array_size(&dialouge_entity,param_1,auStack16);
  pDVar1 = (DialougEnt_RAM *)
           Malloc(((uint)param_1->total * 0xc + (uint)param_1->total) * 2,FILENAME,0x2e);
  param_1->ents = pDVar1;
}

void load_dialougEnt(DialoigEntPointer *param_1,byte param_2,int *param_3){
  int iVar1;
  DialougEnt_RAM *pDVar2;
  DialougeEntity_ROM temp;
  
  iVar1 = *param_3;
  pDVar2 = param_1->ents + param_2;
  RomCopy(&temp,dialouge_entity + iVar1,sizeof(DialougeEntity_ROM),1,FILENAME,0x3f);
  memcpy(pDVar2->name,&temp,0x16);
  pDVar2->a = 0;
  *param_3 = iVar1 + sizeof(DialougeEntity_ROM);
  pDVar2->ID = (ItemID)((ushort)temp.ID.ID + (ushort)temp.ID.Type * 0x100);
}

void build_dailougentitydb(DialoigEntPointer *param_1){
  DialougEnt_RAM *pDVar1;
  byte bVar2;
  undefined4 auStack24 [6];
  
  auStack24[0] = 0;
  load_db_array_size(&dialouge_entity,param_1,auStack24);
  pDVar1 = (DialougEnt_RAM *)Malloc(((uint)param_1->total * 0xc + (uint)param_1->total) * 2,FILENAME,0x8f);
  param_1->ents = pDVar1;
  bVar2 = 0;
  if (param_1->total != 0) {
    do {load_dialougEnt(param_1,bVar2++,auStack24);} while (bVar2 < param_1->total);
  }
}

void dialougEnt_free(DialoigEntPointer *param_1){Free(param_1->ents,FILENAME,0x9f);}