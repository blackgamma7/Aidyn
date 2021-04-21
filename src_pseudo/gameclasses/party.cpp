#ifdef DEBUGVER
#define FILENAME "../gameclasses/party.cpp"
#else
#define FILENAME ""
#endif


void init_party(PartyStruct *X){
  Inventory_struct *pIVar1;
  
  memset(X,0,0x28);
  pIVar1 = (Inventory_struct *)passToMalloc(0x17a8);
  pIVar1 = init_inventory(pIVar1);
  X->Inventory = pIVar1;}


void Party_free(PartyStruct *param_1){
  Inventory_struct *pIVar1;
  int iVar2;
  CharSheet **ppCVar3;
  uint uVar3;
  
  pIVar1 = param_1->Inventory;
  if (pIVar1 != (Inventory_struct *)0x0) {
    (*(pIVar1->Functions->field_0x8).func)
              ((int)pIVar1->inv_slots + (short)(pIVar1->Functions->field_0x8).arg[0] + -4,3);
    param_1->Inventory = (Inventory_struct *)0x0;
  }
  uVar3 = 0;
  iVar2 = 0;
  while( true ) {
    ppCVar3 = (CharSheet **)((int)param_1->Party + iVar2);
    if (*ppCVar3 != null) {
      CharSheet_free(*ppCVar3);
      Free(*ppCVar3,s_../gameclasses/party.cpp_800e0b20,0xe8);
      *ppCVar3 = null;}
    uVar3++;
    if (3 < uVar3) break;
    iVar2 = uVar3 << 2;
  }
  return;
}


void check_party_event_flag(PartyStruct *param_1,ItemID param_2,bool param_3,bool param_4){
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
    while (uVar1 = (*(ushort (*) [2])auStack80)[uVar11], uVar1 != -1) {
      if ((short)(char)bVar8 == uVar1) {
        setEventFlag((*(ushort (*) [2])auStack80)[uVar11 + 1],param_4);
        return;
      }
      uVar11 = uVar11 + 2 & -1;
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
    if (uStack208._0_2_ != -1) {
      iVar6 = 0;
      do {
        iVar6 = iVar6 + uVar11;
        if ((*(ushort (*) [2])&uStack208)[iVar6] == (short)(char)bVar8) {
          setEventFlag(*(EventFlag *)((int)auStack204 + iVar6 * 2 + -2),param_4);
          setEventFlag(*(EventFlag *)((int)auStack204 + iVar6 * 2),(bool)(param_4 ^ 1));
          return;
        }
        uVar11 = uVar11 + 1 & -1;
        iVar6 = uVar11 << 1;
      } while ((*(ushort (*) [2])((int)(ushort (*) [2])&uStack208 + uVar11 * 6))[0] != -1);
    }
  }
  return;
}

void register_party_deaths(PartyStruct *param_1){
  CharSheet *pCVar1;
  int i;
  bool bVar3;
  i = 0;
  while( true ) {
    pCVar1 = param_1->Party[i];
    if (pCVar1 != null) {
      bVar3 = isDead(pCVar1);
      check_party_event_flag(param_1,pCVar1->ID,false,bVar3);
    }
    i++;
    if (3 < i) break;
  }
}

bool add_to_party(PartyStruct *param_1,ItemID param_2){
  bool bVar3;
  uint uVar1;
  CharSheet *pCVar2;
  uint uVar4;
  
  if (param_1->PartySize == 4) {bVar3 = false;}
  else {
    uVar4 = 0;
    if (param_1->Party[0] != null) {
      uVar1 = 1;
      do {
        uVar4 = uVar1;
        if (3 < uVar4) break;
        uVar1 = uVar4 + 1;
      } while (param_1->Party[uVar4] != null);
    }
    pCVar2 = (CharSheet *)Malloc(0x48,s_../gameclasses/party.cpp_800e0b20,0x157);
    param_1->Party[uVar4] = pCVar2;
    create_CharSheet(pCVar2,param_2,0);
    param_1->PartySize++;
    check_party_event_flag(param_1,param_2,true,true);
    caseSwitch_copy_char(param_1->Party[uVar4]);
    bVar3 = true;
  }
  return bVar3;
}

bool Ofunc_8007dfc8(PartyStruct *param_1,uint arg1){
  byte bVar2;
  Temp_weapon *pTVar1;
  bool ret;
  Entity_Ram *entRam;
  CharSheet *charSheeeet;
  
  charSheeeet = param_1->Party[arg1];
  bVar2 = GetIDIndex(charSheeeet->ID);
  entRam = EntityPointer->entities + (char)bVar2;
  if ((*charSheeeet->armor != (temp_armor *)0x0) || (ret = false, entRam->Sheild == (ItemID)-1))
  {
    if (charSheeeet->armor[1] == (temp_armor *)0x0) {
      if (entRam->unk_0x60 != -1) {
        return false;
      }
      pTVar1 = charSheeeet->weapons;
    }
    else {pTVar1 = charSheeeet->weapons;}
    ret = true;
    if (pTVar1 == (Temp_weapon *)0x0) {
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


CharSheet * get_charsheet(PartyStruct *param_1,ItemID param_2){
  byte abStack16 [];
  return get_party_charsheet(param_1,param_2,abStack16);}

CharSheet * get_party_charsheet(PartyStruct *param_1,ItemID param_2,byte *param_3){
  byte bVar2;
  CharSheet *pCVar1;
  
  bVar2 = find_ent_in_Party(param_1,param_2);
  *param_3 = bVar2;
  if (bVar2 == -1) {pCVar1 = null;}
  else {pCVar1 = param_1->Party[*param_3];}
  return pCVar1;
}

void Ofunc_8007e108(PartyStruct *param_1){
  int iVar1;
  CharSheet *piVar2;
  uint uVar2;
  uint uVar3;
  
  iVar1 = 0;
  uVar2 = 0;
  do {
    piVar2 = (CharSheet *)((int)param_1->Party + iVar1);
    uVar3 = uVar2 + 1;
    if (*(int *)piVar2 == 0) {
      iVar1 = uVar2 << 2;
      if (uVar2 < 3) {
        do {
          uVar2 = uVar2 + 1;
          *(char **)piVar2 = piVar2->name;
          piVar2 = (CharSheet *)&piVar2->name;
        } while (uVar2 < 3);
        iVar1 = uVar2 * 4;
      }
      *(undefined4 *)((int)param_1->Party + iVar1) = 0;
    }
    iVar1 = uVar3 * 4;
    uVar2 = uVar3;
  } while (uVar3 < 3);
  return;
}

s8 find_ent_in_Party(PartyStruct *party,ItemID id){
  int i=0;
  CharSheet *psVar1;
  while ((psVar1 = party->Party[i], psVar1 == null ||
         (psVar1->ID != id))) {
    i++;
    if (3 < i) {return -1;}
  }
  return (s8)i;
}

void remove_alive_char_from_party(PartyStruct *param_1, ItemID param_2){
  s8 sVar1 = find_ent_in_Party(param_1,param_2);
  if (sVar1 != -1) {remove_alive_member(param_1,sVar1);}}


void remove_alive_member(PartyStruct *param_1,s8 param_2){
  strip_party_member(param_1,param_2,1);
  move_party_to_saveEnt(param_1);
  if (param_1->Party[param_2] != null) {
    check_party_event_flag(param_1,param_1->Party[param_2]->ID,true,false);
    remove_party_member(param_1,param_2,0);
    scooch_member_over(param_1);
  }
}

void Ofunc_removeEntireParty(PartyStruct *param_1){
  byte i = 0;
  do {
    remove_party_member(param_1,i,0);
    i++;
  } while (i < 4);}

bool IsCharacterInParty(PartyStruct *param_1,ItemID param_2){
  int i=0;
  uint uVar2;
  CharSheet *psVar1;

  while ((psVar1 = param_1->Party[i], psVar1 == null ||
         (psVar1->ID != param_2))) {
    i++;
    if (3 < i) {return false;}
  }
  return true;
}

void BringOutYourDead(PartyStruct *param_1){
  CharSheet *pCVar1;
  PartyStruct *pPVar3;
  uint uVar4;
  
  register_party_deaths(param_1);
  uVar4 = 0;
  pPVar3 = param_1;
  do {
    pCVar1 = pPVar3->Party[0];
    if ((pCVar1 != null) && (isDead(pCVar1))) {
      saveent_deadMember(pCVar1->ID);
      remove_party_member(param_1,(byte)uVar4,1);
    }
    uVar4++;
    pPVar3 = (PartyStruct *)(pPVar3->Party + 1);
  } while (uVar4 < 4);
  scooch_member_over(param_1);
  return;
}

void scooch_member_over(PartyStruct *param_1){
  int iVar1;
  CharSheet *ppCVar2;
  CharSheet **ppCVar3;
  uint uVar2;
  uint uVar3;
  
  iVar1 = 0;
  uVar2 = 0;
  do {
    ppCVar2 = (CharSheet *)((int)param_1->Party + iVar1);
    uVar3 = uVar2 + 1;
    if ((*(int *)ppCVar2 == 0) && (uVar3 < 4)) {
      ppCVar3 = param_1->Party + uVar2 + 1;
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

void strip_party_member(PartyStruct *param_1,byte param_2,byte param_3){
  uint uVar1;
  uint uVar2;

    if (param_1->Party[param_2] != null) {
    uVar1 = 0;
    do {
      func_8007f9b8(param_1,param_2,(byte)uVar1);
      uVar1++;
    } while (uVar1 < 0xc);
    if (param_3 != 0) {
      MoveWeaponsToInventory(param_1,param_2);
      remove_armor_from_character(param_1,param_2);
      removeArmorIntoInventory(param_1,param_2);
    }
  }
  return;
}

void remove_party_member(PartyStruct *param_1,byte param_2,byte param_3){
  CharSheet *pCVar1;
  
  pCVar1 = param_1->Party[param_2];
  if (pCVar1 != null) {
    strip_party_member(param_1,param_2,param_3);
    CharSheet_free(pCVar1);
    Free(pCVar1,s_../gameclasses/party.cpp_800e0b20);
    param_1->Party[param_2] = null;
    param_1->PartySize--;
  }
}


bool characterInParty(CharSheet **param_1,CharSheet *param_2){
  uint i=0;
  if (param_2 == null) {return false;}
  do {
    i++;
    if (param_2 == *param_1) {return true;}
    param_1++;
  } while (i < 4);
  return true;}

uint get_party_avg_lv(PartyStruct *param_1){
  uint uVar3;
  uint uVar4;
  CharSheet *iVar1;
  
  uVar4 = 0;
  if (param_1->PartySize == 0) {uVar4 = 0;}
  else {
    uVar3 = 0;
    do {
      iVar1 = param_1->Party[uVar3];
      if (iVar1 != null) {uVar4+= getModdedStat(iVar1->Stats,LV);}
      uVar3++;
    } while (uVar3 < 4);
    uVar4 = uVar4 / param_1->PartySize;
  }
  return uVar4;
}

int clear_inventory_8007e600(PartyStruct *param_1){
  inv_funcs *piVar1;
  int uVar2;
  
  piVar1 = param_1->Inventory->Functions;
  (*(piVar1->clear_item).func)
            ((int)param_1->Inventory->inv_slots + (short)(piVar1->clear_item).arg[0] + -4);
  piVar1 = param_1->Inventory->Functions;
  uVar2 = (*(piVar1->clear_inventory).func)
                    ((int)param_1->Inventory->inv_slots +
                     (short)(piVar1->clear_inventory).arg[0] + -4);
  return uVar2;
}
byte (*) [2] create_2ByteArray(byte (*param_1) [2]){
  byte (*pabVar1) [2];
  
  if (param_1 == null) {pabVar1 = null;}
  else {
    pabVar1 = (byte (*) [2])Malloc(2,s_../gameclasses/party.cpp_800e0b20,0x2b9);
    (*pabVar1)[0] = (*param_1)[0];
    (*pabVar1)[1] = (*param_1)[1];}
  return pabVar1;}

byte func_8007e798(PartyStruct *param_1,byte param_2){
  uint uVar1;
  byte *pbVar2;
  byte temparray [9];
  
  pbVar2 = temparray;
  uVar1 = 0;
  temparray._0_4_ = BYTE_ARRAY_800e0bc8._0_4_;
  temparray._4_4_ = BYTE_ARRAY_800e0bc8._4_4_;
  temparray[8] = BYTE_ARRAY_800e0bc8[8];
  temparray[0] = (byte)((uint)BYTE_ARRAY_800e0bc8._0_4_ >> 0x18);
  while( true ) {
    if (temparray[0] == 0xff) {
      return 1;
    }
    if (*pbVar2 == param_2) break;
    uVar1 = uVar1 + 2 & 0xffff;
    temparray[0] = temparray[uVar1];
    pbVar2 = temparray + uVar1;
  }
  return temparray[uVar1 + 1];
}


bool func_checking_niesen_2(PartyStruct *param_1,CharSheet *param_2,byte param_3,ItemID param_4){
  inv_funcs *piVar1;
  bool bVar3;
  ulong uVar2;
  byte bVar4;
  
  bVar3 = has_item_func(param_1->Inventory,param_4);
  if (bVar3 != false) {
    piVar1 = param_1->Inventory->Functions;
    uVar2 = (*(piVar1->get_inv_index).func)
                      ((int)param_1->Inventory->inv_slots +
                       (short)(piVar1->get_inv_index).arg[0] + -4,param_4);
    bVar4 = GetIDIndex(param_4);
    if ((&gGlobals.Combat->combatEnts)[param_3] == (CombatEntity *)0x0) {return true;}
    if (param_2->ID != (ItemID)(entityList[162] + 0x200)) {
      func_8006f8d8((&gGlobals.Combat->combatEnts)[param_3],param_4,(char)uVar2);
      if (bVar4 < 4) {gGlobals.combatBytes[1] = 0x13;}
      return false;
    }
  }
  return true;
}

byte get_equip_error(PartyStruct *param_1,byte param_2,char param_3){
  CharSheet *pCVar1;
  inv_funcs *piVar2;
  temp_gear *puVar4;
  AspectEnum AVar5;
  ulong uVar3;
  int iVar4;
  uint uVar6;
  
  pCVar1 = param_1->Party[param_2];
  if ((pCVar1 != null) &&
     (piVar2 = param_1->Inventory->Functions,
     puVar4 = (temp_gear *)
              (*(piVar2->get_inv_slot).func)
                        ((int)param_1->Inventory->inv_slots +
                         (short)(piVar2->get_inv_slot).arg[0] + -4,param_3),
     puVar4 != null) {
    if ((puVar4->aspect != NONE) &&(GetCharAspect(pCVar1->EXP) !=puVar4->aspect)) {
      return 2;}
    uVar6 = 0;
    if (itemtype_funcs[0].type != ~Empty) {
      iVar4 = 0;
      do {
        if ((&itemtype_funcs[uVar6].type) == (ushort)puVar4->id >> 8) {
          return (*(&itemtype_funcs[uVar6].function)) (param_1,param_2,puVar4,pCVar1);
        }
        uVar6++;
        iVar4 = uVar6 << 1;
      } while (itemtype_funcs[uVar6].type != ~Empty);
    }
  }
  return 1;
}

byte itemtype_armor(PartyStruct *param_1,byte param_2,temp_armor *param_3,CharSheet *param_4,
                   ItemID *param_5)

{
  ItemID IVar1;
  inv_funcs *piVar2;
  byte bVar4;
  byte (*X) [2];
  ulong uVar3;
  undefined uVar5;
  
  IVar1 = param_3->id;
  bVar4 = ret0(param_4,(ulonglong)(ushort)IVar1);
  if (bVar4 == 0) {
    X = create_2ByteArray(param_3->statMod);
    uVar5 = 0xff;
    if (param_3->spell != null) {uVar5 = *(undefined *)&param_3->spell->name;}
    piVar2 = param_1->Inventory->Functions;
    uVar3 = (*(piVar2->get_some_bool).func)
                      ((int)param_1->Inventory->inv_slots +
                       (short)(piVar2->get_some_bool).arg[0] + -4,(ulonglong)(ushort)IVar1,1);
    if (uVar3 == 0) {
      if (X != 0) {Free(X,s_../gameclasses/party.cpp_800e0b20,0x377);}
      bVar4 = 1;
    }
    else {
      if ((param_5 != 0) && (*param_4->armor != null) {*param_5 = (*param_4->armor)->id;}
      bVar4 = remove_armor_from_character(param_1,param_2);
      if ((bool)bVar4 == false) {
        Equip_Armor(param_4,IVar1,X);
        func_8007c194(*(Temp_weapon **)param_4->armor,uVar5);
        bVar4 = 0;
      }
      else {func_8007e6a4(param_1,IVar1,X,uVar5);}
    }
  }
  return bVar4;
}

byte itemtype_sheild(PartyStruct *param_1,char param_2,temp_armor *param_3,CharSheet *param_4,
                    ItemID *param_5){
  ItemID IVar1;
  inv_funcs *piVar2;
  byte bVar4;
  byte (*X) [2];
  ulong uVar3;
  undefined uVar5;
  
  IVar1 = param_3->id;
  bVar4 =NoSheildSkill(param_4);
  if (!bVar4) {
    X = create_2ByteArray(param_3->statMod);
    uVar5 = 0xff;
    if (param_3->spell != (Temp_spell *)0x0) {
      uVar5 = *(undefined *)&param_3->spell->name;
    }
    piVar2 = param_1->Inventory->Functions;
    uVar3 = (*(piVar2->get_some_bool).func)
                      ((int)param_1->Inventory->inv_slots +
                       (short)(piVar2->get_some_bool).arg[0] + -4,(ulonglong)(ushort)IVar1,1);
    if (uVar3 == 0) {
      if (X != (byte (*) [2])0x0) {Free(X,s_../gameclasses/party.cpp_800e0b20,0x3b2);}
      bVar4 = 1;
    }
    else {
      if ((param_5 != (ItemID *)0x0) && (param_4->armor[1] != (temp_armor *)0x0)) {
        *param_5 = param_4->armor[1]->id;
      }
      bVar4 = removeArmorIntoInventory(param_1,param_2 & 0xff);
      if (!bVar4) {
        EquipSheild(param_4,IVar1,X);
        func_8007c194((Inventory_struct *)param_4->armor[1],uVar5);
        bVar4 = 0;
      }
      else {
        func_8007e6a4(param_1,IVar1,X,uVar5);
      }
    }
  }
  return bVar4;
}

byte itemtype_weapon(PartyStruct *param_1,uint param_2,ushort *param_3,CharSheet *param_4,
                    ItemID *param_5)

{
  ushort uVar1;
  inv_funcs *piVar2;
  byte bVar4;
  byte (*X) [2];
  ulong uVar3;
  undefined uVar5;
  
  uVar1 = *param_3;
  bVar4 = canEquipWeapon(param_4,uVar1);
  if (bVar4 == 0) {
    X = create_2ByteArray(*(byte (**) [2])(param_3 + 6));
    uVar5 = 0xff;
    if (*(int *)(param_3 + 8) != 0) {
      uVar5 = *(undefined *)(*(int *)(param_3 + 8) + 4);
    }
    piVar2 = param_1->Inventory->Functions;
    uVar3 = (*(piVar2->get_some_bool).func)
                      ((int)param_1->Inventory->inv_slots +
                       (short)(piVar2->get_some_bool).arg[0] + -4,(ulonglong)uVar1,1);
    if (uVar3 == 0) {
      if (X != (byte (*) [2])0x0) {
        Free(X,s_../gameclasses/party.cpp_800e0b20,0x3ed);
      }
      bVar4 = 1;
    }
    else {
      if ((param_5 != (ItemID *)0x0) && (param_4->weapons != (Temp_weapon *)0x0)) {
        *param_5 = param_4->weapons->id;
      }
      bVar4 = MoveWeaponsToInventory(param_1,param_2 & 0xff);
      if ((bool)bVar4 == false) {
        EquipWeapon(param_4,(ulonglong)uVar1,X);
        func_8007c194(param_4->weapons,uVar5);
        bVar4 = 0;
        if (gGlobals.combatBytes[0] == 0xe) {
          func_8006a274((&gGlobals.Combat->combatEnts)[param_2 & 0xff]);
          bVar4 = 0;
        }
      }
      else {
        func_8007e6a4(param_1,uVar1,X,uVar5);
      }
    }
  }
  else {
    bVar4 = func_8007e798(param_1,bVar4);
  }
  return bVar4;
}

byte itemtype_scroll(PartyStruct *param_1,byte param_2,temp_gear *param_3,CharSheet *param_4){
  byt uVar2;
  int iVar1;
  
  if (gametrek_flag0 == 0) {
    iVar1 = search_item_array(param_3->id);
    if (item_pointer->Gear[iVar1].spell == 0xff) {uVar2 = 1;}
    else {uVar2 = func_800830a4(param_1,param_2,param_3,param_4,3);}
  }
  else {uVar2 = use_scroll(param_1,param_2,param_3,param_4);}
  return uVar2;}

bool itemtype_ring(PartyStruct *param_1,byte param_2,temp_gear *param_3,CharSheet *param_4){
  return func_800830a4(param_1,param_2,param_3,param_4,2);}

byte itemtype_gear(PartyStruct *param_1,uint param_2,temp_gear *param_3,CharSheet *param_4,
                  ItemID *param_5)

{
  ItemID IVar1;
  ItemID IVar2;
  inv_funcs *piVar3;
  CharGear *pCVar4;
  byte bVar6;
  byte (*X) [2];
  ulong uVar5;
  bool bVar7;
  temp_gear *ptVar8;
  uint uVar9;
  undefined uVar10;
  
  IVar1 = param_3->id;
  bVar6 = something_with_gear_INT(param_4,IVar1);
  bVar6 = func_8007e798(param_1,bVar6);
  if (bVar6 == 0) {
    X = create_2ByteArray(param_3->statmod);
    uVar10 = 0xff;
    if (param_3->pSpell != (Temp_spell *)0x0) {uVar10 = *(undefined *)&param_3->pSpell->name;}
    piVar3 = param_1->Inventory->Functions;
    uVar5 = (*(piVar3->get_some_bool).func)
                      ((int)param_1->Inventory->inv_slots +
                       (short)(piVar3->get_some_bool).arg[0] + -4,(ulonglong)(ushort)IVar1,1);
    if (uVar5 == 0) {
      if (X != 0) {Free(X,s_../gameclasses/party.cpp_800e0b20,0x457);}
      bVar6 = 1;
    }
    else {
      pCVar4 = param_4->pItemList;
      uVar9 = 0;
      if (pCVar4->num_used != '\0') {
        ptVar8 = (temp_gear *)pCVar4->pItem;
        do {
          if (*(temp_gear **)((int)ptVar8 + uVar9 * 4) == (temp_gear *)0x0) {
            bVar6 = pCVar4->num_used;
          }
          else {
            IVar2 = (*(temp_gear **)((int)ptVar8 + uVar9 * 4))->id;
            if ((ushort)IVar2 >> 8 == (ushort)IVar1 >> 8) {
              if (param_5 != (ItemID *)0x0) {
                *param_5 = IVar2;
              }
              bVar7 = func_8007f9b8(param_1,param_2,uVar9);
              if (bVar7 != false) {
                func_8007e6a4(param_1,IVar1,X,uVar10);
                return bVar7;
              }
              break;
            }
            bVar6 = pCVar4->num_used;
          }
          uVar9++;
          if (bVar6 <= uVar9) break;
          ptVar8 = (temp_gear *)pCVar4->pItem;
        } while( true );
      }
      func_8007f10c(param_1,param_4,IVar1,X,uVar10);
      bVar6 = 0;
    }
  }
  return bVar6;
}

void func_8007f10c(PartyStruct *param_1,CharSheet *param_2,undefined2 param_3,byte (*param_4) [2],undefined1 param_5){
  CharGear *pCVar1;
  int iVar2;
  
  func_8007840c(param_2,param_3,param_4);
  pCVar1 = param_2->pItemList;
  iVar2 = func_8007daa8(pCVar1,param_3);
  func_8007c194((Temp_weapon *)pCVar1->pItem[iVar2],param_5);
  return;
}

bool use_scroll(PartyStruct *param_1,byte param_2,temp_gear *param_3,CharSheet *param_4){
  byte bVar1;
  byte bVar2;
  MagicSchoolEnum MVar3;
  ItemID IVar4;
  Gear_RAM *pGVar5;
  longlong lVar6;
  int iVar7;
  bool bVar8;
  char *pcVar9;
  color *pcVar10;
  color *pcVar11;
  Spell_RAM *pSVar12;
  color acStack808;
  color acStack744;
  color acStack680;
  color acStack616;
  undefined auStack552 [8];
  color acStack544;
  color acStack480;
  color acStack416;
  color acStack352;
  color acStack288;
  color acStack224;
  color acStack160;
  color acStack96;
  
  lVar6 = capskillBaseMax(param_4->Skills,Wizard);
  if (lVar6 < 0) {
    pcVar10 = &acStack808;
    acStack808 = OFFWHITE;
    acStack744 = DARKGRAY_T;
    pcVar9 = (gGlobals.CommonStrings)->only wizards can learn spells;
    pcVar11 = &acStack744;
  }
  else {
    IVar4 = *param_3;
    iVar7 = search_item_array(IVar4);
    pGVar5 = item_pointer->Gear;
    bVar1 = pGVar5[iVar7].spell;
    if (bVar1 == 0xff) {
      pcVar9 = "The enchantment on this scroll can only be used to re-light the Port Saiid Lighthouse.";
      pcVar10 = &acStack680;
      pcVar11 = &acStack616;
      acStack680 = OFFWHITE
      acStack616 = DARKGRAY_T;
    }
    else {
      bVar1 = SpellList[(char)bVar1];
      auStack552[0] = 0;
      bVar8 = knows_spell(param_4->spellbook,(ItemID)(bVar1 | 0x300),auStack552);
      if (bVar8 == false) {
        bVar2 = pGVar5[iVar7].spell;
        pSVar12 = spell_pointer->spells[bVar2];
        if (lVar6 < (longlong)(ulonglong)pSVar12->WizardREQ) {
          pcVar10 = &acStack416;
          acStack416 = OFFWHITE;
          acStack352 = DARKGRAY_T;
          pcVar9 = (gGlobals.CommonStrings)->"need higher wizard to know that spell";
          pcVar11 = &acStack352;
        }
        else {
          MVar3 = param_4->EXP->school;
          if (((MVar3 == CHAOS) || (pSVar12->School == NONE)) || (MVar3 == pSVar12->School)) {
            learn_spell(param_4->spellbook,bVar1 | 0x300,1);
            sprintf(gGlobals.text,(gGlobals.CommonStrings)->char learned spell,param_4->name,
                        pSVar12->Name);
            acStack160 = OFFWHIE;
            acStack96 = DARKGRAY_T;
            some_textbox_func(gGlobals.text,0x96,&acStack160,&acStack96,1);
            piVar6 = param_1->Inventory->Functions;
            (*(piVar6->get_some_bool).func)
                      ((int)param_1->Inventory->inv_slots +
                       (short)(piVar6->get_some_bool).arg[0] + -4,(ulonglong)(ushort)IVar4,1);
            return false;
          }
          pcVar10 = &acStack288;
          acStack288 = OFFWHITE;
          acStack224 = DARKGRAY_T;
          pcVar9 = (gGlobals.CommonStrings)->wrong school for spell;
          pcVar11 = &acStack224;
        }
      }
      else {
        sprintf(gGlobals.text,(gGlobals.CommonStrings)->they already know that spell,
                    param_4->name);
        pcVar9 = gGlobals.text;
        pcVar10 = &acStack544;
        pcVar11 = &acStack480;
        acStack544 = OFFWHITE;
        acStack480 = DARKGRAY_T;
      }
    }
  }
  some_textbox_func(pcVar9,0x96,pcVar10,pcVar11,1);
  return true;
}

void func_8007f508(Temp_weapon *param_1,byte (*param_2) [2],char param_3){
  if (param_1->Stat != (byte (*) [2])0x0) {Free(param_1->Stat,s_../gameclasses/party.cpp_800e0b20,0x552);}
  param_1->Stat = param_2;
  if (param_3 != -1) {*(char *)&param_1->spell->name = param_3;}
  return;
}

bool remove_armor_from_character(PartyStruct *param_1,uint param_2){
  CharSheet *pCVar1;
  temp_armor *ptVar2;
  inv_funcs *piVar3;
  byte (*X) [2];
  ulong uVar4;
  Temp_weapon *pTVar5;
  int line;
  undefined uVar6;
  
  if (gGlobals.combatBytes[0] == 0xe) {return true;}
  pCVar1 = param_1->Party[param_2 & 0xff];
  if (pCVar1 == null) {return true;}
  ptVar2 = *pCVar1->armor;
  if (ptVar2 == (temp_armor *)0x0) {return false;}
  X = create_2ByteArray(ptVar2->statMod);
  uVar6 = 0xff;
  if (ptVar2->spell != (Temp_spell *)0x0) {uVar6 = *(undefined *)&ptVar2->spell->name;}
  piVar3 = param_1->Inventory->Functions;
  uVar4 = (*(piVar3->add_to_inv).func)
                    ((int)param_1->Inventory->inv_slots + (short)(piVar3->add_to_inv).arg[0] + -4,
                     (ulonglong)(ushort)ptVar2->id,1);
  if (uVar4 == 0) {
    if (X == (byte (*) [2])0x0) {return true;}
    line = 0x572;}
  else {
    piVar3 = param_1->Inventory->Functions;
    uVar4 = (*(piVar3->get_inv_index).func)
                      ((int)param_1->Inventory->inv_slots +
                       (short)(piVar3->get_inv_index).arg[0] + -4,(ulonglong)(ushort)ptVar2->id);
    piVar3 = param_1->Inventory->Functions;
    pTVar5 = (Temp_weapon *)
             (*(piVar3->get_inv_slot).func)
                       ((int)param_1->Inventory->inv_slots +
                        (short)(piVar3->get_inv_slot).arg[0] + -4,uVar4);
    if (pTVar5 != (Temp_weapon *)0x0) {
      func_8007f508(pTVar5,X,uVar6);
      remove_chestArmor(pCVar1);
      return false;
    }
    if (X == (byte (*) [2])0x0) {return true;}
    line = 0x57d;
  }
  Free(X,s_../gameclasses/party.cpp_800e0b20,line);
  return true;
}

bool removeArmorIntoInventory(PartyStruct *param_1,uint param_2){
  CharSheet *pCVar1;
  temp_armor *ptVar2;
  inv_funcs *piVar3;
  byte (*X) [2];
  ulong uVar4;
  Temp_weapon *pTVar5;
  int line;
  undefined uVar6;
  
  pCVar1 = param_1->Party[param_2];
  if (pCVar1 == null) {return true;}
  if (gGlobals.combatBytes[0] == 0xe) {return true;}
  ptVar2 = pCVar1->armor[1];
  if (ptVar2 == (temp_armor *)0x0) {return false;}
  X = create_2ByteArray(ptVar2->statMod);
  uVar6 = 0xff;
  if (ptVar2->spell != (Temp_spell *)0x0) {uVar6 = *(undefined *)&ptVar2->spell->name;}
  piVar3 = param_1->Inventory->Functions;
  uVar4 = (*(piVar3->add_to_inv).func)
                    ((int)param_1->Inventory->inv_slots + (short)(piVar3->add_to_inv).arg[0] + -4,
                     (ulonglong)(ushort)ptVar2->id,1);
  if (uVar4 == 0) {
    if (X == (byte (*) [2])0x0) {return true;}
    line = 0x5a4;
  }
  else {
    piVar3 = param_1->Inventory->Functions;
    uVar4 = (*(piVar3->get_inv_index).func)
                      ((int)param_1->Inventory->inv_slots +
                       (short)(piVar3->get_inv_index).arg[0] + -4,(ulonglong)(ushort)ptVar2->id);
    piVar3 = param_1->Inventory->Functions;
    pTVar5 = (Temp_weapon *)
             (*(piVar3->get_inv_slot).func)
                       ((int)param_1->Inventory->inv_slots +
                        (short)(piVar3->get_inv_slot).arg[0] + -4,uVar4);
    if (pTVar5 != (Temp_weapon *)0x0) {
      func_8007f508(pTVar5,X,uVar6);
      remove_sheild(pCVar1);
      return false;
    }
    if (X == (byte (*) [2])0x0) {return true;}
    line = 0x5af;
  }
  Free(X,s_../gameclasses/party.cpp_800e0b20,line);
  return true;
}

bool MoveWeaponsToInventory(PartyStruct *param_1,uint param_2){
  CharSheet *pCVar1;
  inv_funcs *piVar2;
  CombatEntity *pCVar3;
  byte (*X) [2];
  ulong uVar4;
  Temp_weapon *pTVar5;
  undefined uVar6;
  
  pCVar1 = param_1->Party[param_2 & 0xff];
  if (pCVar1 != null) {
    pTVar5 = pCVar1->weapons;
    if (pTVar5 == (Temp_weapon *)0x0) {return false;}
                    /* archmage staff */
    if ((ItemID)(weaponList[66] + 0x700) == pTVar5->id) {return false;}
    X = create_2ByteArray(pTVar5->Stat);
    uVar6 = 0xff;
    if (pTVar5->spell != (Temp_spell *)0x0) {uVar6 = *(undefined *)&pTVar5->spell->name;}
    piVar2 = param_1->Inventory->Functions;
    uVar4 = (*(piVar2->add_to_inv).func)
                      ((int)param_1->Inventory->inv_slots + (short)(piVar2->add_to_inv).arg[0] + -4,
                       (ulonglong)(ushort)pTVar5->id,1);
    if (uVar4 == 0) {
      if (X != (byte (*) [2])0x0) {
        Free(X,s_../gameclasses/party.cpp_800e0b20,0x5dd);
        return true;
      }
    }
    else {
      piVar2 = param_1->Inventory->Functions;
      uVar4 = (*(piVar2->get_inv_index).func)
                        ((int)param_1->Inventory->inv_slots +
                         (short)(piVar2->get_inv_index).arg[0] + -4,(ulonglong)(ushort)pTVar5->id);
      piVar2 = param_1->Inventory->Functions;
      pTVar5 = (Temp_weapon *)
               (*(piVar2->get_inv_slot).func)
                         ((int)param_1->Inventory->inv_slots +
                          (short)(piVar2->get_inv_slot).arg[0] + -4,uVar4);
      if (pTVar5 != (Temp_weapon *)0x0) {
        func_8007f508(pTVar5,X,uVar6);
        unequp_weapons(pCVar1);
        if (gGlobals.combatBytes[0] != 0xe) {return false;}
        if (gGlobals.Combat != (CombatStruct *)0x0) {
          if (&gGlobals.Combat->combatEnts == (CombatEntity **)0x0) {
            return false;
          }
          pCVar3 = (&gGlobals.Combat->combatEnts)[param_2];
          if (pCVar3 == (CombatEntity *)0x0) {return false;}
          pCVar3->field_0x25 = 0;
          get_weapon_sheild_borg5(pCVar3);
        }
        return false;
      }
      if (X != (byte (*) [2])0x0) {
        Free(X,s_../gameclasses/party.cpp_800e0b20,0x5e9);
        return true;
      }
    }
  }
  return true;
}


bool func_8007f9b8(PartyStruct *param_1,byte param_2,byte param_3){
  CharSheet *pCVar1;
  inv_funcs *piVar2;
  byte (*X) [2];
  ulong uVar3;
  Temp_weapon *pTVar4;
  undefined uVar6;
  temp_gear *puVar2;
  
  pCVar1 = param_1->Party[param_2];
  if (pCVar1 == null) {return true;}
  if (0xb < param_3) {return true;}
  if (pCVar1->pItemList != (CharGear *)0x0) {
    puVar2 = pCVar1->pItemList[param_3];
    if (puVar2 == (temp_gear *)0x0) {return true;}
    X = create_2ByteArray(puVar2->statmod);
    uVar6 = 0xff;
    if (puVar2->pSpell != (Temp_spell *)0x0) {uVar6 = *(undefined *)&puVar2->pSpell->name;}
    piVar2 = param_1->Inventory->Functions;
    uVar3 = (*(piVar2->add_to_inv).func)
                      ((int)param_1->Inventory->inv_slots + (short)(piVar2->add_to_inv).arg[0] + -4,
                       (ulonglong)(ushort)puVar2->id,1);
    if (uVar3 != 0) {
      piVar2 = param_1->Inventory->Functions;
      uVar3 = (*(piVar2->get_inv_index).func)
                        ((int)param_1->Inventory->inv_slots +
                         (short)(piVar2->get_inv_index).arg[0] + -4,(ulonglong)(ushort)puVar2->id);
      piVar2 = param_1->Inventory->Functions;
      pTVar4 = (Temp_weapon *)
               (*(piVar2->get_inv_slot).func)
                         ((int)param_1->Inventory->inv_slots +
                          (short)(piVar2->get_inv_slot).arg[0] + -4,uVar3);
      func_8007f508(pTVar4,X,uVar6);
      unequip_acc(pCVar1,uVar5);
      return false;
    }
    if (X != (byte (*) [2])0x0) {Free(X,s_../gameclasses/party.cpp_800e0b20,0x625);}
  }
  return true;
}

int Check_diplomat_int(CharSheet **param_1){
  CharSheet *pCVar1;
  bool bVar6;
  uint uVar2;
  char cVar7;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint uVar8;
  
  uVar3 = 0;
  uVar8 = 0;
  uVar4 = 0;
  do {
    pCVar1 = *param_1;
    if ((pCVar1 != null) && (!isDead(pCVar1))) {
      uVar2 = getModdedStat(pCVar1->Stats,INT);
      if (uVar3 < (uVar2)) {uVar3 = uVar2;}
      uVar8+= (int)getModdedSkill(pCVar1->Skills,Diplomat);
    }
    uVar4++;
    param_1++;
  } while (uVar4 < 4);
  uVar3 = uVar3 * 3 + uVar8 * 10 + 0x32;
  uVar4 = RollD(1,100);
  if (uVar4 < uVar3) {
    iVar5 = some_skillcheck_calc((int)((uVar3 - uVar4) * 0x10000) >> 0x10);}
  else {iVar5 = 0;}
  return iVar5;
}

int Check_loremaster_INT(CharSheet **param_1){
  CharSheet *pCVar1;
  bool bVar6;
  uint uVar2;
  char cVar7;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint uVar8;
  
  uVar3 = 0;
  uVar8 = 0;
  uVar4 = 0;
  do {
    pCVar1 = *param_1;
    if ((pCVar1 != null) && (!isDead(pCVar1))) {
      uVar2 = getModdedStat(pCVar1->Stats,INT);
      if (uVar3 < (uVar2)) {uVar3 = uVar2;}
      uVar8+= (int)getModdedSkill(pCVar1->Skills,Loremaster);
    }
    uVar4++;
    param_1++;
  } while (uVar4 < 4);
  uVar3 = uVar3 * 3 + uVar8 * 6;
  uVar4 = RollD(1,100);
  if (uVar4 < uVar3) {
    iVar5 = some_skillcheck_calc((int)((uVar3 - uVar4) * 0x10000) >> 0x10);}
  else {iVar5 = 0;}
  return iVar5;
}

uint loremaster_INT_skillcheck(PartyStruct *param_1){
  CharSheet *pCVar1;
  char cVar4;
  int iVar2;
  uint uVar3;
  uint uVar5;
  
  cVar4 = GetMostSkilledMember(param_1,Loremaster);
  if ((longlong)cVar4 != 0xff) {
    pCVar1 = param_1->Party[cVar4];
    if (pCVar1 == null) {return 0;}
    cVar4 = getModdedSkill(pCVar1->Skills,Loremaster);
    iVar2 = getModdedStat(pCVar1->Stats,INT);
    uVar5 = (((int)cVar4) * 3 + iVar2 & 0x7fff) * 2;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar5) {
      uVar3 = some_skillcheck_calc((int)((uVar5 - uVar3) * 0x10000) >> 0x10);
      return uVar3;}
  }
  return 0;
}

byte getMechanic_Int_Dex(PartyStruct *param_1,char param_2){//used in armor craft
  CharSheet *pCVar1;
  char cVar5;
  int iVar2;
  int iVar3;
  uint uVar4;
  undefined uVar6;
  byte uVar7;
  uint uVar8;
  
  pCVar1 = param_1->Party[param_2];
  uVar7 = 0;
  if (pCVar1 != null) {
    cVar5 = getModdedSkill(pCVar1->Skills,Mechanic);
    iVar2 = getModdedStat(pCVar1->Stats,INT);
    iVar3 = getModdedStat(pCVar1->Stats,DEX);
    uVar8 = (cVar5 * 5 + iVar2 + iVar3 & 0x7fffU) * 2;
    uVar4 = RollD(1,100);
    if (uVar4 < uVar8) {
      uVar6 = some_skillcheck_calc((int)((uVar8 - uVar4) * 0x10000) >> 0x10);
      uVar4 = 5 - (int)cVar5;
      if ((int)uVar4 < 1) {uVar4 = 1;}
      iVar2 = getModdedStat(pCVar1->Stats,STAM);
      uVar7 = 0;
      if ((int)(uVar4 & 0xffff) <= iVar2) {
        damage_func(pCVar1,(short)(uVar4 & 0xffff));
        uVar7 = uVar6;}
    }
    else {uVar7 = 0;}
  }
  return uVar7;
}

undefined mechanic_int_dex_skillcheck(PartyStruct *param_1,byte param_2){
  CharSheet *pCVar1;
  char cVar5;
  int iVar2;
  int iVar3;
  uint uVar4;
  undefined uVar6;
  undefined uVar7;
  uint uVar8;
  
  pCVar1 = param_1->Party[param_2];
  uVar7 = 0;
  if (pCVar1 != null) {
    cVar5 = getModdedSkill(pCVar1->Skills,Mechanic);
    iVar2 = getModdedStat(pCVar1->Stats,INT);
    iVar3 = getModdedStat(pCVar1->Stats,DEX);
    uVar8 = (cVar5 * 5 + iVar2 + iVar3 & 0x7fffU) * 2;
    uVar4 = RollD(1,100);
    if (uVar4 < uVar8) {
      uVar6 = some_skillcheck_calc((int)((uVar8 - uVar4) * 0x10000) >> 0x10);
      uVar4 = 0xfU - (int)cVar5 & 0xffff;
      iVar2 = getModdedStat(pCVar1->Stats,STAM);
      uVar7 = 0;
      if ((int)uVar4 <= iVar2) {
        damage_func(pCVar1,(short)uVar4);
        uVar7 = uVar6;
      }
    }
    else {uVar7 = 0;}
  }
  return uVar7;
}

float merchant_skill_check(PartyStruct *param_1,byte MInt,byte Mstam){
  CharSheet *pCVar1;
  int iVar3;
  bool bVar5;
  longlong lVar2;
  int iVar4;
  uint uVar7;
  longlong lVar8;
  longlong lVar9;
  uint uVar10;
  uint uVar11;
  float fVar13;
  char cVar6;
  
  uVar11 = 4;
  lVar8 = 0;
  uVar7 = 0;
  iVar3 = 0;
  do {
    pCVar1 = param_1->Party[uVar7];
    if ((pCVar1 != null) && (!isDead(pCVar1))) {
      cVar6 = getModdedSkill(pCVar1->Skills,Merchant);
      lVar2 = (longlong)cVar6;
      lVar9 = lVar8;
      uVar10 = uVar11;
      if ((lVar2 == 0) || (lVar9 = lVar2, uVar10 = uVar7, lVar8 <= lVar2)) {
        lVar8 = lVar9;
        uVar11 = uVar10;
      }
    }
    uVar7++;
  } while (uVar7 < 4);
  fVar13 = 0.05f;
  if (uVar11 != 4) {
    pCVar1 = param_1->Party[uVar11];
    iVar3 = 0xf - (int)lVar8;
    iVar4 = getModdedStat(pCVar1->Stats,STAM);
    fVar13 = 0.05f;
    if (iVar3 * 0x10000 >> 0x10 <= iVar4) {
      damage_func(pCVar1,(short)iVar3);
      MStam-= (int)lVar8;
      fVar13 = 0.05f;
    }
  }
  return (float)MStam * fVar13;
}

undefined some_ranger_stam_func(PartyStruct *param_1){
  CharSheet *pCVar1;
  int iVar2;
  char cVar6;
  uint uVar3;
  uint uVar4;
  undefined uVar7;
  uint uVar5;
  uint uVar8;
  CharSheet *piVar8;
  uint uVar9;
  
  uVar4 = 4;
  uVar5 = 0;
  uVar9 = 0;
  iVar2 = 0;
  do {
    pCVar1 = param_1->Party[uVar9];
    if (pCVar1 != null) {
      cVar6 = getModdedSkill(pCVar1->Skills,Ranger);
      uVar8 = (int)cVar6;
      uVar3 = 5 - uVar8;
      if ((int)uVar3 < 1) {uVar3 = 1;}
      if ((uVar5 < uVar8) &&
         (iVar2 = getModdedStat(pCVar1->Stats,STAM),
         (int)(uVar3) <= iVar2)) {
        uVar4 = uVar9;
        uVar5 = uVar8;
      }
    }
    uVar9++;
  } while (uVar9 < 4);
  uVar7 = 2;
  if (uVar5 != 0) {
    if (uVar4 != 4) {
      pCVar1 = param_1->Party[uVar4];
      iVar2 = getModdedStat(pCVar1->Stats,INT);
      uVar9 = iVar2 * 3 + uVar5 * 10 & 0xffff;
      uVar4 = RollD(1,100);
      if (uVar4 < uVar9) {
        uVar7 = some_skillcheck_calc((int)((uVar9 - uVar4) * 0x10000) >> 0x10);
        uVar5 = 5 - uVar5;
        if ((int)uVar5 < 1) {uVar5 = 1;}
        iVar2 = getModdedStat(pCVar1->Stats,STAM);
        if (iVar2 < (int)(uVar5 & 0xffff)) {return 0;}
        damage_func(pCVar1,(short)(uVar5 & 0xffff));
        return uVar7;
      }
    }
    uVar7 = 0;
  }
  return uVar7;
}


undefined Ofunc_Ranger_int_check(PartyStruct *param_1){
  int iVar2;
  char cVar4;
  uint uVar3;
  undefined uVar5;
  uint uVar6;
  uint uVar7;
  CharSheet *iVar1;
  
  uVar3 = 4;
  uVar7 = 0;
  uVar6 = 0;
  do {
    iVar1 = param_1->Party[uVar6];;
    if (iVar1 != null) {
      cVar4 = getModdedSkill(iVar1->Skills,Ranger);
      if (uVar7 < ((int)cVar4)) {
        uVar3 = uVar6;
        uVar7 = (int)cVar4;
      }
    }
    uVar6++;
  } while (uVar6 < 4);
  if (uVar7 == 0) {return 0;}
  if (uVar3 != 4) {
    if (param_1->Party[uVar3] == null) {
      return 0;
    }
    iVar2 = getModdedStat(param_1->Party[uVar3]->Stats,INT);
    uVar7 = iVar2 * 3 + uVar7 * 10 & 0xffff;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      uVar5 = some_skillcheck_calc((int)((uVar7 - uVar3) * 0x10000) >> 0x10);
      return uVar5;
    }
  }
  return 0;
}

undefined ofunc_ranger_stam_int(PartyStruct *param_1)

{
  int iVar1;
  char cVar4;
  uint uVar2;
  uint uVar3;
  undefined uVar5;
  uint uVar6;
  uint uVar7;
  int *piVar8;
  uint uVar9;
  
  uVar3 = 4;
  uVar7 = 0;
  uVar9 = 0;
  iVar1 = 0;
  do {
    pCVar1 = param_1->Party[uVar9];
    if (iVar1 != 0) {
      cVar4 = getModdedSkill(pCVar1->Skills,Ranger);
      uVar6 = (int)cVar4 & 0xff;
      uVar2 = 5 - uVar6;
      if ((int)uVar2 < 1) {
        uVar2 = 1;
      }
      if ((uVar7 < uVar6) &&
         (iVar1 = getModdedStat(pCVar1->Stats,STAM), (int)uVar2 <= iVar1)
         ) {
        uVar3 = uVar9;
        uVar7 = uVar6;
      }
    }
    uVar9++;
  } while (uVar9 < 4);
  if (uVar7 == 0) {return 0;}
  if (uVar3 != 4) {
    if (param_1->Party[uVar3] == null) {return 0;}
    iVar1 = getModdedStat(param_1->Party[uVar3]->Stats,INT);
    uVar7 = iVar1 * 3 + uVar7 * 10 & 0xffff;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      uVar5 = some_skillcheck_calc((int)((uVar7 - uVar3) * 0x10000) >> 0x10);
      return uVar5;
    }
  }
  return 0;
}

undefined get_int_ranger_stam(PartyStruct *param_1,byte param_2){
  CharSheet *pCVar1;
  int iVar2;
  char cVar5;
  int iVar3;
  uint uVar4;
  undefined uVar6;
  uint uVar7;
  
  pCVar1 = param_1->Party[param_2];
  uVar6 = 0;
  if (pCVar1 != null) {
    iVar2 = getModdedStat(pCVar1->Stats,INT);
    cVar5 = getModdedSkill(pCVar1->Skills,Ranger);
    iVar3 = getModdedStat(pCVar1->Stats,STAM);
    uVar7 = iVar2 * 3 + cVar5 * 10 + iVar3 & 0xffff;
    uVar4 = RollD(1,100);
    if (uVar4 < uVar7) {
      uVar6 = some_skillcheck_calc((int)((uVar7 - uVar4) * 0x10000) >> 0x10);
    }
    else {uVar6 = 0;}
  }
  return uVar6;
}

byte ofunc_int_mechanic(PartyStruct *param_1){
CharSheet *pCVar1;
byte ret;
int i=0;
int j=0
int k=0;
int l=0;
  do{
    pCVar1 = param_1->Party[i];
    if (pCVar1 != null) {
      j = getModdedStat(pCVar1->Stats,INT);
      k = getModdedSkill(pCVar1->Skills,Ranger);
      j = (j * 2 + k * 5) * 0x10000 >> 0x10;
      if (l < j) {l = j;}
      }
    i++
  }while(i<4);
  i = RollD(1,100);
  if ((int)i < l) {
    ret = some_skillcheck_calc((int)((l - i) * 0x10000) >> 0x10);}
  else {ret = 0;}
  return ret;
}

undefined ofunc_mechanic_int_(PartyStruct *param_1,uint param_2)

{
  CharSheet *pCVar1;
  char cVar4;
  int iVar2;
  uint uVar3;
  undefined uVar5;
  undefined uVar6;
  uint uVar7;
  
  pCVar1 = param_1->Party[param_2];
  uVar6 = 0;
  if (pCVar1 != null) {
    cVar4 = getModdedSkill(pCVar1->Skills,Mechanic);
    iVar2 = getModdedStat(pCVar1->Stats,INT);
    uVar7 = iVar2 * 4 + cVar4 * 10;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      uVar5 = some_skillcheck_calc((int)((uVar7 - uVar3) * 0x10000) >> 0x10);
      uVar3 = 10 - (int)cVar4;
      if ((int)uVar3 < 1) {uVar3 = 1;}
      iVar2 = getModdedStat(pCVar1->Stats,STAM);
      uVar6 = 0;
      if ((int)(uVar3) <= iVar2) {
        damage_func(pCVar1,(short)(uVar3));
        uVar6 = uVar5;
      }
    }
    else {uVar6 = 0;}
  }
  return uVar6;
}

undefined check_mechanic_int_stam(PartyStruct *param_1,uint param_2){
  CharSheet *pCVar1;
  char cVar4;
  int iVar2;
  uint uVar3;
  undefined uVar5;
  undefined uVar6;
  uint uVar7;
  //yes, the same func as above, but acually used.
  pCVar1 = param_1->Party[param_2];
  uVar6 = 0;
  if (pCVar1 != null) {
    cVar4 = getModdedSkill(pCVar1->Skills,Mechanic);
    iVar2 = getModdedStat(pCVar1->Stats,INT);
    uVar7 = iVar2 * 4 + cVar4 * 10;
    uVar3 = RollD(1,100);
    if (uVar3 < uVar7) {
      uVar5 = some_skillcheck_calc((int)((uVar7 - uVar3) * 0x10000) >> 0x10);
      uVar3 = 10 - (int)cVar4;
      if ((int)uVar3 < 1) {uVar3 = 1;}
      iVar2 = getModdedStat(pCVar1->Stats,STAM);
      uVar6 = 0;
      if ((int)(uVar3) <= iVar2) {
        damage_func(pCVar1,(short)(uVar3));
        uVar6 = uVar5;
      }
    }
    else {uVar6 = 0;}
  }
  return uVar6;
}

