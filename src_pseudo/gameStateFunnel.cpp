void Event_flag_stat(StatEnum param_1)

{
  EventFlag EVar1;
  EventFlag EVar2;
  CharSheet *pCVar3;
  int iVar5;
  uint uVar6;
  bool bVar7;
  short lVar4;
  char cVar8;
  uint uVar9;
  short lVar10;
  
  if (gameStates != null) {
    iVar5 = find_event_flag_array_index(param_1,eventflagArrayStats,0);
    if (iVar5 != 0) {
      lVar10 = 0;
      uVar6 = 3;
      do {
        pCVar3 = gGlobals.party->Party[uVar6];
        if (((pCVar3 != null) && (isDead(pCVar3) == false)) &&
           ( lVar10 < getModdedStat(pCVar3->Stats,param_1))) {
          lVar10 = (short)getModdedStat(pCVar3->Stats,param_1);
        }
        uVar9 = uVar6 & 0xff;
        uVar6 = uVar9 - 1;
      } while (uVar9 != 0);
      if (lVar10 != eventflagArrayStats[iVar5].val) {
        if (lVar10 < 0) {
          lVar10 = 0;
        }
        EVar1 = eventflagArrayStats[iVar5].to;
        EVar2 = eventflagArrayStats[iVar5].from;
        eventflagArrayStats[iVar5].val = lVar10;
        set_flag_array(EVar1,EVar2,lVar10);
      }
    }
  }
  return;
}

void event_flag_skill_(SkillEnum param_1){
  EventFlag EVar1;
  EventFlag EVar2;
  CharSheet *pCVar3;
  int iVar4;
  uint uVar5;
  bool bVar6;
  char cVar7;
  uint uVar8;
  short uVar9;
  
  if (gameStates != null) {
    iVar4 = find_event_flag_array_index(param_1,eventflagArraySkills,0);
    if (iVar4 != 0) {
      uVar9 = 0;
      uVar5 = 3;
      do {
        pCVar3 = gGlobals.party->Party[uVar5];
        if (((pCVar3 != null) && (isDead(pCVar3) == false)) &&
           ( uVar9 < getModdedSkill(pCVar3->Skills,param_1))) {
          uVar9 = (short)getModdedSkill(pCVar3->Skills,param_1);;
        }
        uVar8 = uVar5 & 0xff;
        uVar5 = uVar8 - 1;
      } while (uVar8 != 0);
      if (uVar9 != eventflagArraySkills[iVar4].val) {
        EVar1 = eventflagArraySkills[iVar4].to;
        EVar2 = eventflagArraySkills[iVar4].from;
        eventflagArraySkills[iVar4].val = (ushort)uVar9;
        set_flag_array(EVar1,EVar2,(ushort)uVar9);
      }
    }
  }
  return;
}


void set_flag_array(EventFlag param_1,EventFlag param_2,ushort param_3){
  byte bVar1;
  uint uVar2;
  uint uVar3;
  if (((gameStates != null && (param_1 < gameStates->flag_count) && (param_2 < gameStates->flag_count) {
    uVar2 = param_1;
    while (uVar2 < param_2+1) {
      bVar1 = (byte)praram_3;
      uVar3 = uVar3 >> 1;
      gameStates->States_pointer[uVar2].Flag = (bool)(bVar1 & 1);
      uVar2++;
    }
    gameStates->f = 1;
  }
  return;
}


int find_event_flag_array_index(char param_1,event_flag_array *param_2,byte param_3){
  int iVar1;
  uint uVar2;
  uint uVar3;
  
  uVar3 = 0;
  uVar2 = (int)(char)param_3;
  if (uVar2 != 0) {
    iVar1 = 0;
    do {
      if ((&param_2->skill_stat)[iVar1] == param_1) {
        return uVar3;
      }
      uVar3++;
      iVar1 = uVar3 << 3;
    } while (uVar3 < uVar2);
  }
  return (int)uVar2;
}

bool load_gamestateFunnel(void){
  gameStates = (GameStateFunnel *)Malloc(sizeof(GameStateFunnel),s_./src/gamestatefunnel.cpp_800d9ef0,0x123);
  RomCopy(gameStates,&gamestatefunnel_rom,sizeof(GameStateFunnel),1,s_./src/gamestatefunnel.cpp_800d9ef0,0x125);
  setGSF_pointers(gameStates);
  return true;
}
bool clear_gamestatefunnel(void){
  Free(gameStates,s_./src/gamestatefunnel.cpp_800d9ef0);
  gameStates = null;
  return true;
}

bool get_event_flag(EventFlag param_1){
  bool ret;

  if (gamestate_cheat_check1(All) == false) {
    ret = Get_eventFlagCheck(param_1);}
  else {ret = gamestate_cheat_check2(All);}
  return ret;
}

bool Get_eventFlagCheck(EventFlag param_1){
  bool ret;
  
  if (param_1 == 0) {ret = false;}
  if (param_1 == 1) {ret = true;}
  else {ret = get_eventFlag_(gameStates,param_1) != 0;}
  return ret;
}

void setEventFlag(EventFlag param_1,bool param_2){
  if ((1 < param_1) && (param_1 < gameStates->flag_count)) {
    set_journalentry_flag(gameStates,param_1,param_2);}
}

void SetFlagArray_on_Time(byte ToD,byte Day,byte week,byte month){
  set_flag_array(0x8fd,0x8ff,(short)ToD;
  set_flag_array(0x909,0x90b,(short)Day & 0xffU);
  set_flag_array(0x90c,0x90e,(short)week & 0xffU);
  set_flag_array(0x906,0x908,(short)month & 0xff);
  set_flag_array(0x8fb,0x8fc,(ushort)TerrainPointer->moonPhases);
  set_flag_array(0x900,0x905,((short)week * 7 + ((short)Day));
}

void set_weather_flags(byte param_1){set_flag_array(0x90f,0x910,(short)param_1);}
void set_terrain_flags(byte q){set_flag_array(0x911,0x914,(short)q);}

void Passto_State_typeA_branch(EventFlag param_1){
  StateTypeA_branch(param_1,gameStates->States_pointer[param_1].Flag == false);
}

void state_TypeA_LOG(Struct_State *param_1,uint param_2){
  bool bVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  
  uVar4 = param_2 & 0xffff;
  uVar6 = 0;
  uVar5 = (uint)param_1->byte7;
  switch(param_1->command) {
  case AND:
    if (param_2 == 0) {
      uVar5 = 1;
    }
    else {
      uVar4 = 0xffff;
    }
    break;
  case IOR:
    if (uVar4 == 0) break;
    goto LAB_8002483c;
  case EOR:
    if (param_2 != 0) {
      uVar4 = 1;
    }
    break;
  case NOT:
    bVar1 = param_2 != 0;
    uVar4 = 0;
    if (bVar1) break;
LAB_8002483c:
    uVar4 = 1;
    uVar5 = 1;
    break;
  case MSK:
    uVar6 = (uint)(param_2 == 0);
    uVar4 = (uint)param_1->shortA;
  }
  uVar3 = 0;
  if (uVar5 != 0) {
    do {
      uVar2 = uVar4 ^ uVar6;
      uVar4 = uVar4 >> 1;
      StateTypeA_branch((&gameStates->other_pointer->shortA)[param_1->shortB + uVar3],uVar2);
      uVar3++;
    } while (uVar3 < uVar5);
  }
  return;
}

void state_typeA_VAL(Struct_State *param_1,ushort param_2){
  Event_flag_typeB EVar1;
  byte bVar2;
  uint uVar3;
  uint uVar4;
  
  uVar4 = (int)param_2;
  EVar1 = param_1->command;
  bVar2 = param_1->byte7;
  if (EVar1 == GRT) {
    if (uVar4 == 0) {
      uVar4 = (uint)param_1->shortA;
      goto LAB_80024978;
    }
    uVar4 = (uint)param_1->shortA;
  }
  else {
    if (EVar1 < LST) {
      if (EVar1 != EQU) goto LAB_80024978;
      if (uVar4 != 0) {
        uVar4 = (uint)param_1->shortA;
        goto LAB_80024978;
      }
      uVar4 = (uint)param_1->shortA;
    }
    else {
      if (EVar1 == LST) {
        if (uVar4 == 0) {
          uVar4 = (uint)param_1->shortA;
        }
        else {
          uVar4 = param_1->shortA - 1 & 0xffff;
        }
        goto LAB_80024978;
      }
      if (EVar1 != NEQ) goto LAB_80024978;
      if (uVar4 == 0) {
        uVar4 = (uint)param_1->shortA;
        goto LAB_80024978;
      }
      uVar4 = (uint)param_1->shortA;
    }
  }
  uVar4 = uVar4 + 1 & 0xffff;
LAB_80024978:
  uVar3 = 0;
  if (bVar2 != 0) {
    do {
      StateTypeA_branch((&gameStates->other_pointer->shortA)[param_1->shortB + uVar3],uVar4);
      uVar3++;
      uVar4 = uVar4 >> 1;
    } while (uVar3 < bVar2);
  }
  return;
}

void State_TypeA_CNT(Struct_State *param_1,uint param_2){
  Event_flag_typeB EVar1;
  byte bVar2;
  ushort uVar3;
  uint uVar4;
  uint uVar5;
  
  EVar1 = param_1->command;
  uVar5 = param_2;
  if (EVar1 == GRT) {
    if (uVar5 == 0) {
      uVar5 = (uint)param_1->shortA;
    }
    else {
      uVar5 = param_1->shortA + 1;
    }
    goto LAB_80024aac;
  }
  if (EVar1 < LST) {
    if (EVar1 != EQU) goto LAB_80024aac;
    if (uVar5 != 0) {
      uVar5 = (uint)param_1->shortA;
      goto LAB_80024aac;
    }
    if (param_1->shortA != 0) {
      uVar5 = param_1->shortA - 1;
      goto LAB_80024aac;
    }
LAB_80024a98:
    uVar5 = 1;
  }
  else {
    if (EVar1 == LST) {
      if (uVar5 == 0) {
        uVar5 = (uint)param_1->shortA;
        goto LAB_80024aac;
      }
      uVar3 = param_1->shortA;
    }
    else {
      if (EVar1 != NEQ) goto LAB_80024aac;
      if (uVar5 == 0) {
        uVar5 = (uint)param_1->shortA;
        goto LAB_80024aac;
      }
      uVar3 = param_1->shortA;
      if (uVar3 == 0) goto LAB_80024a98;
    }
    uVar5 = uVar3 - 1;
  }
LAB_80024aac:
  uVar4 = 0;
  if (uVar5 == 0) {
    bVar2 = param_1->byte7;
  }
  else {
    uVar3 = param_1->shortB;
    while( true ) {
      StateTypeA_branch((&gameStates->other_pointer->shortA)[uVar3 + uVar4],1);
      uVar4++;
      if (uVar5 <= uVar4) break;
      uVar3 = param_1->shortB;
    }
    bVar2 = param_1->byte7;
  }
  if (uVar4 < bVar2) {
    uVar3 = param_1->shortB;
    while( true ) {
      StateTypeA_branch((&gameStates->other_pointer->shortA)[uVar3 + uVar4],0);
      uVar4++;
      if (param_1->byte7 <= uVar4) break;
      uVar3 = param_1->shortB;
    }
  }
  return;
}

void StateTypeA_branch(EventFlag param_1,uint param_2){
  event_flag_typeA eVar1;
  Struct_State *pSVar2;
  uint uVar3;
  
  uVar3 = param_2;
  if (param_1 < gameStates->flag_count) {
    setEventFlag(param_1,SUB41(param_2,0));
  }
  else {
    pSVar2 = get_struct_state(gameStates,param_1);
    if (uVar3 != pSVar2->Flag) {
      eVar1 = pSVar2->type;
      if (eVar1 == VAL) {
        state_typeA_VAL(pSVar2,(ushort)uVar3);
      }
      else {
        if (eVar1 < CNT) {
          if (eVar1 == LOG) {
            state_TypeA_LOG(pSVar2,uVar3);
          }
        }
        else {
          if (eVar1 == CNT) {
            State_TypeA_CNT(pSVar2,uVar3);
          }
        }
      }
      gameStates->f = 1;
    }
  }
  return;
}

