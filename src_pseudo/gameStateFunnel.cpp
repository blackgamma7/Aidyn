typedef enum event_flag_typeA {LOG,VAL,CNT,BIT,INV} event_flag_typeA;
typedef enum Event_flag_typeB {AND,IOR,EOR,NOT,MSK,EQU,GRT,LST,NEQ,INV} Event_flag_typeB;

struct Struct_State {
    u16 shortA;
    u16 shortB;
    enum event_flag_typeA type;
    enum Event_flag_typeB command;
    bool Flag;
    u8 byte7;
};

struct GameStateFunnel { /* used for event flags and whatnot */
    u16 a;
    u16 b;
    u16 flag_count;
    u16 f;
    struct Struct_State * States_pointer;
    struct Struct_State * other_pointer;
    s32 u[3];
    s32 g;
    struct Struct_State states[5000];
    struct Struct_State otherStates[970];
};

typedef struct event_flag_array event_flag_array, *Pevent_flag_array;

struct event_flag_array {
    enum EventFlag to;
    enum EventFlag from;
    s16 val;
    u8 skill_stat;
    u8 pad;
};

void Event_flag_stat(CHAR_STAT param_1){
  EventFlag EVar1;
  EventFlag EVar2;
  CharSheet *pCVar3;
  s32 iVar5;
  u32 uVar6;
  bool bVar7;
  s16 lVar4;
  char cVar8;
  u32 uVar9;
  s16 lVar10;
  
  if (gameStates) {
    iVar5 = find_event_flag_array_index(param_1,eventflagArrayStats,0);
    if (iVar5 != 0) {
      lVar10 = 0;
      uVar6 = 3;
      do {
        pCVar3 = gGlobals.party->Party[uVar6];
        if (((pCVar3) && (isDead(pCVar3) == false)) &&
           ( lVar10 < CharStats::getModdedStat(pCVar3->Stats,param_1))) {
          lVar10 = (s16)CharStats::getModdedStat(pCVar3->Stats,param_1);
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

void event_flag_skill_(CHAR_SKILL param_1){
  EventFlag EVar1;
  EventFlag EVar2;
  CharSheet *pCVar3;
  s32 iVar4;
  u32 uVar5;
  bool bVar6;
  char cVar7;
  u32 uVar8;
  s16 uVar9;
  
  if (gameStates) {
    iVar4 = find_event_flag_array_index(param_1,eventflagArraySkills,0);
    if (iVar4 != 0) {
      uVar9 = 0;
      uVar5 = 3;
      do {
        pCVar3 = gGlobals.party->Party[uVar5];
        if (((pCVar3) && (isDead(pCVar3) == false)) &&
           ( uVar9 < getModdedSkill(pCVar3->Skills,param_1))) {
          uVar9 = (s16)getModdedSkill(pCVar3->Skills,param_1);;
        }
        uVar8 = uVar5 & 0xff;
        uVar5 = uVar8 - 1;
      } while (uVar8 != 0);
      if (uVar9 != eventflagArraySkills[iVar4].val) {
        EVar1 = eventflagArraySkills[iVar4].to;
        EVar2 = eventflagArraySkills[iVar4].from;
        eventflagArraySkills[iVar4].val = (u16)uVar9;
        set_flag_array(EVar1,EVar2,(u16)uVar9);
      }
    }
  }
  return;
}


void set_flag_array(EventFlag param_1,EventFlag param_2,u16 param_3){
  u8 bVar1;
  u32 uVar2;
  u32 uVar3;
  if (((gameStates != NULL && (param_1 < gameStates->flag_count) && (param_2 < gameStates->flag_count) {
    uVar2 = param_1;
    while (uVar2 < param_2+1) {
      bVar1 = (u8)praram_3;
      uVar3 = uVar3 >> 1;
      gameStates->States_pointer[uVar2].Flag = (bool)(bVar1 & 1);
      uVar2++;
    }
    gameStates->f = 1;
  }
  return;
}


s32 find_event_flag_array_index(char param_1,event_flag_array *param_2,u8 param_3){
  s32 iVar1;
  u32 uVar2;
  u32 uVar3;
  
  uVar3 = 0;
  uVar2 = (s32)(char)param_3;
  if (uVar2 != 0) {
    iVar1 = 0;
    do {
      if ((&param_2->skill_stat)[iVar1] == param_1) {return uVar3; }
      uVar3++;
      iVar1 = uVar3 << 3;
    } while (uVar3 < uVar2);
  }
  return (s32)uVar2;
}

bool load_gamestateFunnel(void){
  gameStates = (GameStateFunnel *)heapAlloc(sizeof(GameStateFunnel),FILENAME,0x123);
  RomCopy::RomCopy(gameStates,&gamestatefunnel_rom,sizeof(GameStateFunnel),1,FILENAME,0x125);
  setGSF_pointers(gameStates);
  return true;}

bool clear_gamestatefunnel(void){
  HeapFree(gameStates,FILENAME,0x138);
  gameStates = NULL;
  return true;}

bool getEventFlag(EventFlag param_1){
  bool ret;

  if (gamestate_cheat_check1(All) == false) {
    ret = Get_eventFlagCheck(param_1);}
  else {ret = gamestate_cheat_check2(All);}
  return ret;}

bool Get_eventFlagCheck(EventFlag param_1){
  bool ret;
  
  if (param_1 == 0) {ret = false;}
  if (param_1 == 1) {ret = true;}
  else {ret = get_eventFlag_(gameStates,param_1) != 0;}
  return ret;
}

void setEventFlag(EventFlag param_1,bool param_2){
  if ((1 < param_1) && (param_1 < gameStates->flag_count)) {
    set_journalentry_flag(gameStates,param_1,param_2);}}

void SetFlagArray_on_Time(u8 ToD,u8 Day,u8 week,u8 month){
  set_flag_array(0x8fd,0x8ff,(s16)ToD;
  set_flag_array(0x909,0x90b,(s16)Day);
  set_flag_array(0x90c,0x90e,(s16)week);
  set_flag_array(0x906,0x908,(s16)month);
  set_flag_array(0x8fb,0x8fc,(u16)TerrainPointer->moonPhases);
  set_flag_array(0x900,0x905,((s16)week * 7 + ((s16)Day));
}

void set_weather_flags(u8 param_1){set_flag_array(0x90f,0x910,(s16)param_1);}
void set_terrain_flags(u8 q){set_flag_array(0x911,0x914,(s16)q);}

void Passto_State_typeA_branch(EventFlag param_1){
  StateTypeA_branch(param_1,gameStates->States_pointer[param_1].Flag == false);
}

void state_TypeA_LOG(Struct_State *param_1,u32 param_2){
  bool bVar1;
  u32 uVar2;
  u32 uVar3;
  u32 uVar4;
  u32 uVar5;
  u32 uVar6;
  
  uVar4 = param_2 & 0xffff;
  uVar6 = 0;
  uVar5 = (u32)param_1->byte7;
  switch(param_1->command) {
  case AND:
    if (param_2 == 0) {uVar5 = 1;}
    else {uVar4 = 0xffff;}
    break;
  case IOR:
    if (uVar4 == 0) break;
    goto LAB_8002483c;
  case EOR:
    if (param_2 != 0) {uVar4 = 1;}
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
    uVar6 = (u32)(param_2 == 0);
    uVar4 = (u32)param_1->shortA;
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

void state_typeA_VAL(Struct_State *param_1,u16 param_2){
  Event_flag_typeB EVar1;
  u8 bVar2;
  u32 uVar3;
  u32 uVar4;
  
  uVar4 = (s32)param_2;
  EVar1 = param_1->command;
  bVar2 = param_1->byte7;
  if (EVar1 == GRT) {
    if (uVar4 == 0) {
      uVar4 = (u32)param_1->shortA;
      goto LAB_80024978;
    }
    uVar4 = (u32)param_1->shortA;
  }
  else {
    if (EVar1 < LST) {
      if (EVar1 != EQU) goto LAB_80024978;
      if (uVar4 != 0) {
        uVar4 = (u32)param_1->shortA;
        goto LAB_80024978;
      }
      uVar4 = (u32)param_1->shortA;
    }
    else {
      if (EVar1 == LST) {
        if (uVar4 == 0) {
          uVar4 = (u32)param_1->shortA;
        }
        else {
          uVar4 = param_1->shortA - 1 & 0xffff;
        }
        goto LAB_80024978;
      }
      if (EVar1 != NEQ) goto LAB_80024978;
      if (uVar4 == 0) {
        uVar4 = (u32)param_1->shortA;
        goto LAB_80024978;
      }
      uVar4 = (u32)param_1->shortA;
    }
  }
  uVar4++;
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

void State_TypeA_CNT(Struct_State *param_1,u32 param_2){
  Event_flag_typeB EVar1;
  u8 bVar2;
  u16 uVar3;
  u32 uVar4;
  u32 uVar5;
  
  EVar1 = param_1->command;
  uVar5 = param_2;
  if (EVar1 == GRT) {
    if (uVar5 == 0) {uVar5 = (u32)param_1->shortA;}
    else {uVar5 = param_1->shortA + 1;}
    goto LAB_80024aac;
  }
  if (EVar1 < LST) {
    if (EVar1 != EQU) goto LAB_80024aac;
    if (uVar5 != 0) {
      uVar5 = (u32)param_1->shortA;
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
        uVar5 = (u32)param_1->shortA;
        goto LAB_80024aac;
      }
      uVar3 = param_1->shortA;
    }
    else {
      if (EVar1 != NEQ) goto LAB_80024aac;
      if (uVar5 == 0) {
        uVar5 = (u32)param_1->shortA;
        goto LAB_80024aac;
      }
      uVar3 = param_1->shortA;
      if (uVar3 == 0) goto LAB_80024a98;
    }
    uVar5 = uVar3 - 1;
  }
LAB_80024aac:
  uVar4 = 0;
  if (uVar5 == 0) {bVar2 = param_1->byte7;}
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

void StateTypeA_branch(EventFlag param_1,u32 param_2){
  event_flag_typeA eVar1;
  Struct_State *pSVar2;
  if (param_1 < gameStates->flag_count) {setEventFlag(param_1,param_2);}
  else {
    pSVar2 = get_struct_state(gameStates,param_1);
    if (param_2 != pSVar2->Flag) {
      eVar1 = pSVar2->type;
      if (eVar1 == VAL) {state_typeA_VAL(pSVar2,(u16)param_2);}
      else if (eVar1 == LOG) {state_TypeA_LOG(pSVar2,param_2);}
      else if (eVar1 == CNT) {State_TypeA_CNT(pSVar2,param_2);}
      gameStates->f = 1;
    }
  }
  return;
}

