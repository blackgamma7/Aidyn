#define FILENAME "./src/gamestatefunnel.cpp"

#include "globals.h"
#include "eventFlag.h"
#include "heapN64.h"
#include "gamestateCheats.h"
#include "romcopy.h"


void Event_flag_stat(u8 param_1){
  EventFlag EVar1;
  EventFlag EVar2;
  CharSheet *pCVar3;
  int iVar4;
  u8 uVar5;
  uint uVar8;
  s16 lVar9;
  
  if (gameStates) {
    iVar4 = find_event_flag_array_index(param_1,eventflagArrayStats,0);
    if (iVar4 != 0) {
      lVar9 = 0;
      for(u8 i =3;i!=0;i--) {
        pCVar3 = (PARTY)->Members[i];
        if (((pCVar3) && (!Entity::isDead(pCVar3))) &&
           (lVar9 < CharStats::getModded(pCVar3->Stats,param_1))) {
          lVar9 = CharStats::getModded(pCVar3->Stats,param_1);
        }
      }
      if (lVar9 != eventflagArrayStats[iVar4].val) {
        if (lVar9 < 0) lVar9 = 0;
        EVar1 = eventflagArrayStats[iVar4].to;
        EVar2 = eventflagArrayStats[iVar4].from;
        eventflagArrayStats[iVar4].val = lVar9;
        set_flag_array(EVar1,EVar2,lVar9);
      }
    }
  }
}

void event_flag_skill_(u8 param_1){
  EventFlag EVar1;
  EventFlag EVar2;
  CharSheet *pCVar3;
  int iVar4;
  byte bVar8;
  u16 uVar10;
  
  if (gameStates) {
    iVar4 = find_event_flag_array_index(param_1,eventflagArraySkills,0);
    if (iVar4 != 0) {
      uVar10 = 0;
      for(u8 i =3;i!=0;i--)  {
        pCVar3 = PARTY->Members[i];
        if (((pCVar3) && (!Entity::isDead(pCVar3))) &&
           (uVar10 < pCVar3->Skills->getModdedSkill(param_1))) {
          uVar10 = pCVar3->Skills->getModdedSkill(param_1);
        }
      }
      if (uVar10 != eventflagArraySkills[iVar4].val) {
        EVar1 = eventflagArraySkills[iVar4].to;
        EVar2 = eventflagArraySkills[iVar4].from;
        eventflagArraySkills[iVar4].val = uVar10;
        set_flag_array(EVar1,EVar2,uVar10);
      }
    }
  }
}

void set_flag_array(EventFlag param_1,EventFlag param_2,u16 param_3){
  u8 bVar1;
  u32 uVar2;
  u32 uVar3;
  if ((gameStates) && (param_1 < gameStates->bitFlags) && (param_2 < gameStates->bitFlags)) {
    uVar2 = param_1;
    while (uVar2 < param_2+1) {
      bVar1 = (u8)param_3;
      uVar3 = uVar3 >> 1;
      gameStates->States_pointer[uVar2].Flag = (u8)(bVar1 & 1);
      uVar2++;
    }
    gameStates->flag = 1;
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
extern GameStateFunnel gamestatefunnel_rom;
u8 load_gamestateFunnel(void){
  ALLOC(gameStates,291);
  ROMCOPYS(gameStates,&gamestatefunnel_rom,sizeof(GameStateFunnel),293);
  setGSF_pointers(gameStates);
  return true;}

u8 clear_gamestatefunnel(void){
  FREE(gameStates,312);
  return true;}

u8 getEventFlag(u16 flag){
#ifdef DEBUGVER //Seems to get broken into 2 funcs with debug(?)
  checkCheat(All);
  return Get_eventFlagCheck(flag);
  }

u8 Get_eventFlagCheck(u16 flag){
#endif
  if (flag == FLAG_False) return false;
  if (flag == FLAG_True) return true;
  return (get_eventFlag_(gameStates,flag));
}

void setEventFlag(EventFlag param_1,u8 param_2){
  if ((1 < param_1) && (param_1 < gameStates->bitFlags)) {
    set_journalentry_flag(gameStates,param_1,param_2);}}

void SetFlagArray_on_Time(u8 ToD,u8 Day,u8 week,u8 season){
  set_flag_array(FLAG_CalendarToDA,FLAG_CalendarToDC,(s16)ToD);
  set_flag_array(FLAG_CalendarDayA,FLAG_CalendarDayC,(s16)Day);
  set_flag_array(FLAG_CalendarWeekA,FLAG_CalendarWeekC,(s16)week);
  set_flag_array(FLAG_CalendarSeasonA,FLAG_CalendarSeasonC,(s16)season);
  set_flag_array(FLAG_CalendarMoonA,FLAG_CalendarMoonB,(u16)TerrainPointer->moonPhases);
  set_flag_array(FLAG_CalendarWeekdayA,FLAG_CalendarWeekdayF,((s16)week * 7 + ((s16)Day)));
}

void set_weather_flags(u8 x){set_flag_array(FLAG_WeatherRainA,FLAG_WeatherRainB,x);}
void set_terrain_flags(u8 x){set_flag_array(FLAG_TerrainA,FLAG_TerrainD,x);}

void Passto_State_typeA_branch(EventFlag param_1){
  StateTypeA_branch(param_1,gameStates->States_pointer[param_1].Flag == false);
}

void state_TypeA_LOG(Struct_State *param_1,u16 param_2){
  u8 bVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  u16 uVar5;
  u16 uVar6;
  
  uVar3 = (uint)param_2;
  uVar5 = 0;
  uVar4 = (uint)param_1->length;
  uVar6 = uVar5;
  switch(param_1->command) {
  case FLAG_AND:
    if (uVar3 == 0) uVar4 = 1;
    else uVar3 = 0xffff;
    break;
  case FLAG_IOR:
    uVar6 = 0;
    if (uVar3 == 0) break;
    goto LAB_8002483c;
  case FLAG_EOR:
    uVar6 = 0;
    if (uVar3 != 0) {
      uVar3 = 1;
      uVar6 = uVar5;
    }
    break;
  case FLAG_NOT:
    uVar3 = 0;
    if (uVar3 != 0) break;
LAB_8002483c:
    uVar3 = 1;
    uVar4 = 1;
    uVar6 = uVar5;
    break;
  case FLAG_MSK:
    bVar1 = uVar3 == 0;
    uVar3 = (uint)param_1->shortA;
    uVar6 = (u16)bVar1;
  }
  if (uVar4) {
    for (uVar2=0;uVar2<uVar4;uVar2++) {
      uVar5 = (u16)uVar3;
      uVar3 >>= 1;
      StateTypeA_branch(gameStates->other_pointer[param_1->shortB + uVar2],uVar5 ^ uVar6)
      ;
    }
  }
}



void state_typeA_VAL(Struct_State *param_1,u16 param_2){
  u8 cmd;
  u32 uVar3;
  u16 uVar4;
  
  uVar4 = (s32)param_2;
  cmd = param_1->command;
  switch(param_1->command){
    case FLAG_GRT:
     if (param_2 == 0) uVar4 = param_1->shortA;
     else uVar4 = param_1->shortA+1;
     break;
   case FLAG_EQU:
     if (param_2) uVar4 = param_1->shortA;
     else uVar4 = param_1->shortA+1;
     break;
   case FLAG_LST:
     if (param_2 == 0) uVar4 = param_1->shortA;
     else uVar4 = param_1->shortA -1;
     break;
  case FLAG_NEQ:
   if (param_2 == 0) uVar4 = param_1->shortA;
   else uVar4 = param_1->shortA+1;
   break;
  }
  if (param_1->length) {
    for(u32 i=0;i<param_1->length;i++) {
      StateTypeA_branch(gameStates->other_pointer[param_1->shortB + i],uVar4);
    }
  }
  return;
}

void State_TypeA_CNT(Struct_State *param_1,u32 param_2){
  u8 cmd;
  u8 bVar2;
  u16 uVar3;
  u32 uVar4;
  u32 uVar5;
  
  cmd = param_1->command;
  uVar5 = param_2;
  if (cmd == FLAG_GRT) {
    if (uVar5 == 0) {uVar5 = (u32)param_1->shortA;}
    else {uVar5 = param_1->shortA + 1;}
    goto LAB_80024aac;
  }
  if (cmd < FLAG_LST) {
    if (cmd != FLAG_EQU) goto LAB_80024aac;
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
    if (cmd == FLAG_LST) {
      if (uVar5 == 0) {
        uVar5 = (u32)param_1->shortA;
        goto LAB_80024aac;
      }
      uVar3 = param_1->shortA;
    }
    else {
      if (cmd != FLAG_NEQ) goto LAB_80024aac;
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
  if (uVar5 ){
    for(;uVar4>uVar5;uVar4++) {
      StateTypeA_branch(gameStates->other_pointer[param_1->shortB + uVar4],1);
    }
  }
  if (uVar4 < param_1->length) {
    for(;uVar4>param_1->length;uVar4++) {
      StateTypeA_branch(gameStates->other_pointer[param_1->shortB + uVar4],0);
    }
  }
  return;
}

void StateTypeA_branch(EventFlag flag,u32 state){
  if (flag < gameStates->bitFlags) setEventFlag(flag,state);
  else {
    Struct_State *entry = get_struct_state(gameStates,flag);
    if (state != entry->Flag) {
      if (entry->type == FLAG_VAL) state_typeA_VAL(entry,(u16)state);
      else if (entry->type == FLAG_LOG) state_TypeA_LOG(entry,state);
      else if (entry->type == FLAG_CNT) State_TypeA_CNT(entry,state);
      gameStates->flag = 1;
    }
  }
}

