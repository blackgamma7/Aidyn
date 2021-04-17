#ifdef DEBUGVER
#define FILENAME "../gameclasses/party.cpp"
#else
#define FILENAME ""
#endif


void init_party(PartyStruct *arg0){
  Inventory_struct *pIVar1;
  
  memset(arg0,0,sizeof(PartyStruct));
  pIVar1 = (Inventory_struct *)passToMalloc(sizeof(Inventory_struct));
  pIVar1 = init_inventory(pIVar1);
  arg0->Inventory = pIVar1;
  return;
}

void Party_free(PartyStruct *arg0){
  Inventory_struct *pIVar1;
  CharSheet *CharS;
  uint i;
  
  pIVar1 = arg0->Inventory;
  if (pIVar1) {
    (*pIVar1->Functions->field_0xc)
              ((int)pIVar1->inv_slots + *(short *)(pIVar1->Functions->field_0x0 + 8) + -4,3);
    arg0->Inventory = null;
  }
  i = 0;
  while( true ) {
    CharS = arg0->Party[i];
    if (CharS) {
      CharSheet_free(CharS);
      Free(CharS,FILENAME);
      CharS = null;
    }
    i++;
    if (3 < i) break;
  }
  return;
}

void check_party_event_flag(PartyStruct *arg0,ItemID param_2,bool param_3,bool param_4){
  ushort uVar1;
  ushort auVar2 [2];
  ushort auVar3 [2];
  ushort auVar4 [2];
  byte bVar8;
  ushort (*pauVar5) [2];
  int iVar6;
  ushort (*pauVar7) [2];
  ushort (*pauVar9) [2];
  ushort (*pauVar10) [2];
  uint uVar11;
  undefined4 uStack208;
  undefined4 auStack204 [31];
  undefined4 auStack80 [20];
  
  bVar8 = GetIDIndex(param_2);
  if (param_3 == false) {
    pauVar9 = party_eventflag_dict2;
    pauVar5 = (ushort (*) [2])auStack80;
    do {
      pauVar10 = pauVar5;
      pauVar7 = pauVar9;
      auVar2 = pauVar7[1];
      auVar3 = pauVar7[2];
      auVar4 = pauVar7[3];
      *pauVar10 = *pauVar7;
      pauVar10[1] = auVar2;
      pauVar10[2] = auVar3;
      pauVar10[3] = auVar4;
      pauVar9 = pauVar7[4];
      pauVar5 = pauVar10[4];
    } while (pauVar7[4] != party_eventflag_dict2[0xc]);
    auVar2 = pauVar7[5];
    pauVar10[4] = party_eventflag_dict2[12];
    pauVar10[5] = auVar2;
    uVar11 = 0;
    while (uVar1 = (*(ushort (*) [2])auStack80)[uVar11], uVar1 != 0xffff) {
      if ((short)(char)bVar8 == uVar1) {
        setEventFlag((*(ushort (*) [2])auStack80)[uVar11 + 1],param_4);
        return;
      }
      uVar11 = uVar11 + 2 & 0xffff;
    }
  }
  else {
    pauVar5 = party_eventflag_dict1;
    pauVar9 = (ushort (*) [2])&uStack208;
    do {
      auVar2 = pauVar5[1];
      auVar3 = pauVar5[2];
      auVar4 = pauVar5[3];
      *pauVar9 = *pauVar5;
      pauVar9[1] = auVar2;
      pauVar9[2] = auVar3;
      pauVar9[3] = auVar4;
      pauVar5 = pauVar5[4];
      pauVar9 = pauVar9[4];
    } while (pauVar5 != party_eventflag_dict1[0x14]);
    uVar11 = 0;
    *pauVar9 = party_eventflag_dict1[20];
    if (uStack208._0_2_ != 0xffff) {
      iVar6 = 0;
      do {
        iVar6 = iVar6 + uVar11;
        if ((*(ushort (*) [2])&uStack208)[iVar6] == (short)(char)bVar8) {
          setEventFlag(*(Event_flag_offset *)((int)auStack204 + iVar6 * 2 + -2),param_4);
          setEventFlag(*(Event_flag_offset *)((int)auStack204 + iVar6 * 2),(bool)(param_4 ^ 1));
          return;
        }
        uVar11 = uVar11 + 1 & 0xffff;
        iVar6 = uVar11 << 1;
      } while ((*(ushort (*) [2])((int)(ushort (*) [2])&uStack208 + uVar11 * 6))[0] != 0xffff);
    }
  }
  return;
}

void register_party_deaths(PartyStruct *arg0){
  CharSheet *pCVar1;
  int i = 0;
  while( true ) {
    pCVar1 = arg0->Party[i];
    if (pCVar1 != null)
      {check_party_event_flag(arg0,pCVar1->ID,false,isDead(pCVar1));}
    i++;
    if (3 < i) break;
  }
  return;
}

bool add_to_party(PartyStruct *arg0,ItemID param_2){
  bool ret;
  uint uVar1;
  CharSheet *pCVar2;
  uint uVar4;
  
  if (arg0->PartySize == 4) {
    ret = false;
  }
  else {
    uVar4 = 0;
    if (arg0->Party[0] != null) {
      uVar1 = 1;
      do {
        uVar4 = uVar1;
        if (3 < uVar4) break;
        uVar1 = uVar4 + 1;
      } while (arg0->Party[uVar4] != null);
    }
    pCVar2 = (CharSheet *)Malloc(sizeof(CharSheet),FILENAME,0x157);
    arg0->Party[uVar4] = pCVar2;
    create_CharSheet(pCVar2,param_2,0);
    arg0->PartySize++;
    check_party_event_flag(arg0,param_2,true,true);
    caseSwitch_copy_char(arg0->Party[uVar4]);
    ret = true;
  }
  return ret;
}

bool Ofunc_8007dfc8(PartyStruct *arg0,byte arg1){
  byte bVar2;
  Temp_weapon *pTVar1;
  bool ret;
  Entity_Ram *entRam;
  CharSheet *charSheeeet = arg0->Party[arg1];
  bVar2 = GetIDIndex(charSheeeet->ID);
  entRam = EntityPointer->entities[bVar2];
  if ((*charSheeeet->armor != null || (ret = false, entRam->Sheild == (ItemID)-1))
  {
    if (charSheeeet->armor[1] == null {
      if (entRam->unk_0x60 != -1) {
        return false;
      }
      pTVar1 = charSheeeet->weapons;
    }
    else {
      pTVar1 = charSheeeet->weapons;
    }
    ret = true;
    if (pTVar1 == null) {
      ret = false;
      if (((entRam->weapon[0] == (ItemID)-1) &&
          (ret = false, entRam->weapon[1] == (ItemID)-1)) &&
         (ret = false, entRam->weapon[2] == (ItemID)-1)) {
        ret = true;
      }
    }
  }
  return ret;
}

CharSheet * get_charsheet(PartyStruct *arg0,ItemID param_2){
  byte temp[8];
  return get_party_charsheet(arg0,param_2,temp);
}

CharSheet * get_party_charsheet(PartyStruct *arg0,ItemID param_2,byte *param_3){
  byte bVar2 = find_ent_in_Party(arg0,param_2);
  CharSheet *ret;
  
  *param_3 = bVar2;
  if (bVar2 == 0xff) {ret = null;}
  else {ret = arg0->Party[*param_3];}
  return ret;
}

s8 find_ent_in_Party(PartyStruct *arg0,ItemID id){
  s8 i=0;
  CharSheet *psVar1;

  while ((psVar1 = arg0->Party[i]), psVar1 == null ||
         (psVar1->ID != id))) {
    i++;
    if (3 < i) {return -1;}
  }
  return i;
}

void remove_alive_char_from_party(PartyStruct *arg0,undefined2 param_2){
  s8 sVar1 = find_ent_in_Party(arg0,param_2);
  if (sVar1 != -1) {remove_alive_member(arg0,sVar1);}
  return
}
void remove_alive_member(PartyStruct *arg0,s8 param_2){
  CharSheet *pCVar1;
  
  strip_party_member(arg0,param_2,1);
  move_party_to_saveEnt(arg0);
  pCVar1 = arg0->Party[param_2];
  if (pCVar1) {
    check_party_event_flag(arg0,pCVar1->ID,true,false);
    remove_party_member(arg0,param_2,0);
    scooch_member_over(arg0);
  }
  return;
}

void Ofunc_removeEntireParty(PartyStruct *arg0){
  byte uVar1 = 0;
  do {remove_party_member(arg0,uVar1++,0);} while (uVar1 < 4);
  return;
}

bool IsCharacterInParty(PartyStruct *arg0,ItemID param_2){
  int i=0;
  CharSheet *psVar1;

  while ((psVar1 = arg0->Party[i]), psVar1 == null ||
         (psVar1->ID != param_2))) {
    i++;
    if (3 < i) {return false;}
  }
  return true;
}

void BringOutYourDead(PartyStruct *arg0){
  CharSheet *pCVar1;
  bool bVar2;
  PartyStruct *pPVar3;
  uint uVar4;
  
  register_party_deaths(arg0);
  uVar4 = 0;
  pPVar3 = arg0;
  do {
    pCVar1 = pPVar3->Party[0];
    if ((pCVar1 != null) && (bVar2 = isDead(pCVar1), bVar2 != false)) {
      saveent_deadMember(pCVar1->ID);
      remove_party_member(arg0,(byte)uVar4,1);
    }
    uVar4 = uVar4 + 1;
    pPVar3 = (PartyStruct *)(pPVar3->Party + 1);
  } while (uVar4 < 4);
  scooch_member_over(arg0);
  return;
}


void scooch_member_over(PartyStruct *arg0){ //redo this.
  int iVar1;
  CharSheet *ppCVar2;
  CharSheet **ppCVar3;
  uint uVar2;
  uint uVar3;
  
  iVar1 = 0;
  uVar2 = 0;
  do {
    ppCVar2 = (CharSheet *)((int)arg0->Party + iVar1);
    uVar3 = uVar2 + 1;
    if ((*(int *)ppCVar2 == 0) && (uVar3 < 4)) {
      ppCVar3 = arg0->Party + uVar2 + 1;
      uVar2 = uVar3;
      do {
        uVar2 = uVar2 + 1;
        if (*ppCVar3 != null) {
          *(CharSheet **)ppCVar2 = *ppCVar3;
          ppCVar2 = (CharSheet *)&ppCVar2->name;
          *ppCVar3 = null;
        }
        ppCVar3 = ppCVar3 + 1;
      } while (uVar2 < 4);
    }
    iVar1 = uVar3 * 4;
    uVar2 = uVar3;
  } while (uVar3 < 4);
  return;
}

void remove_party_member(PartyStruct *arg0,byte param_2,byte param_3){
  CharSheet *pCVar1;
  
  pCVar1 = arg0->Party[param_2];
  if (pCVar1 != null) {
    strip_party_member(arg0,param_2,param_3);
    CharSheet_free(pCVar1);
    Free(pCVar1,FILENAME);
    arg0->Party[param_2] = null;
    arg0->PartySize--;
  }
  return;
}

bool characterInParty(CharSheet **arg0,CharSheet *param_2){
  uint i = 0;
  
  if (param_2 == null) {return false;}
  do {
    i++;
    if (param_2 == *arg0) {return true;}
    arg0++;
  } while (i < 4);
  return true;
}


uint get_party_avg_lv(PartyStruct *arg0){
  int i;
  uint ret = 0;
  CharSheet *iVar1;
  
  if (arg0->PartySize == 0) {ret = 0;}
  else {
    i = 0;
    do {
      iVar1 = arg0->Party[i]);
      if (iVar1 != null) {
        ret += getModdedStat(iVar1->Stats,Level);
      }
      i++;
    } while (i < 4);
    ret = ret / arg0->PartySize;
  }
  return ret;
}

ulong clear_inventory_8007e600(PartyStruct *arg0){
  inv_funcs *piVar1;
  ulong uVar2;
  
  piVar1 = arg0->Inventory->Functions;
  (*piVar1->clear_item)((int)arg0->Inventory->inv_slots + *(short *)piVar1->field_0x18 + -4);
  piVar1 = arg0->Inventory->Functions;
  uVar2 = (*piVar1->clear_inventory)
                    ((int)arg0->Inventory->inv_slots + *(short *)piVar1->field_0x10 + -4);
  return uVar2;
}

byte * create_2ByteArray(byte (*arg0) [2]){ // used for stat/skill modifiers
  byte *pbVar1;
  
  if (arg0 == null) {pbVar1 = null;}
  else {
    pbVar1 = (byte *)Malloc(2,FILENAME,0x2b9);
    *pbVar1 = (*arg0)[0];
    pbVar1[1] = (*arg0)[1];
  }
  return pbVar1;
}


bool func_checking_niesen_2(PartyStruct *arg0,short *param_2,uint param_3,ItemID param_4){
  inv_funcs *piVar1;
  ulong uVar2;
  byte bVar4;
  
  if (has_item_func(arg0->Inventory,param_4)) {
    piVar1 = arg0->Inventory->Functions;
    uVar2 = (*piVar1->get_inv_index)
                      ((int)arg0->Inventory->inv_slots + *(short *)piVar1->field_0x50 + -4,
                       param_4);
    bVar4 = GetIDIndex(param_4);
    if ((&combatPointer->combatEnts)[param_3] == null) {
      return true;
    }
    if (*param_2 != (ushort)(entityList[162] | 0x200)) {
      FUN_8006f8d8((&combatPointer->combatEnts)[param_3],param_4,(char)uVar2);
      if (bVar4 < 4) {
        combat_bytes[1] = 0x13;
      }
      return false;
    }
  }
  return true;
}
