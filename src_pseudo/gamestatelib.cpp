#include "eventFlag.h"
#include "crash.h"

void GameStateCrash(char *param_1){
  #if DEBUGVER
  CRASH("gamestatelib.cpp::\nProcessGameStates",param_1);
  #endif
}


void ProcessGameStates(GameStateFunnel *param_1){
  u8 eVar1;
  u8 EVar2;
  s16 sVar3;
  u8 bVar4;
  Struct_State *puVar6;
  u16 uVar5;
  u32 lVar6;
  u32 uVar7;
  u32 uVar8;
  u16 bit;
  EventFlag flag;
  
  do {
    while( true ) {
      if (param_1->flag == 0) return;
      flag = param_1->bitFlags;
      param_1->flag = 0;
      if (param_1->flagTotal <= flag) break;
      do {
        puVar6 = get_struct_state(param_1,flag);
        uVar5 = gameStateBitmask(param_1,puVar6);
        eVar1 = puVar6->type;
        bit = 0;
        if (eVar1 == FLAG_VAL) {
          EVar2 = puVar6->command;
          if (EVar2 != FLAG_GRT) {
            if (EVar2 < FLAG_LST) {
              if (EVar2 == FLAG_EQU) {
LAB_800d51d8:
                if (uVar5 == puVar6->shortA) goto LAB_800d522c;
              }
              else {
LAB_800d5170:
                GameStateCrash("ERROR:  Invalid VAL Command:");
              }
            }
            else {
              if (EVar2 == FLAG_LST) {
LAB_800d51f4:
                bVar4 = uVar5 < puVar6->shortA;
                goto LAB_800d51fc;
              }
              if (EVar2 != FLAG_NEQ) goto LAB_800d5170;
LAB_800d520c:
              if (uVar5 != puVar6->shortA) goto LAB_800d522c;
            }
            goto LAB_800d5230;
          }
          bVar4 = puVar6->shortA < uVar5;
LAB_800d51fc:
          if (!bVar4) goto LAB_800d5230;
          goto LAB_800d522c;
        }
        if (FLAG_VAL < eVar1) {
          if (eVar1 != FLAG_CNT) goto LAB_800d5220;
          EVar2 = puVar6->command;
          if (EVar2 == FLAG_GRT) {
            bVar4 = puVar6->shortA < uVar5;
            goto LAB_800d51fc;
          }
          if (EVar2 < FLAG_LST) {
            if (EVar2 == FLAG_EQU) goto LAB_800d51d8;
          }
          else {
            if (EVar2 == FLAG_LST) goto LAB_800d51f4;
            if (EVar2 == FLAG_NEQ) goto LAB_800d520c;
          }
          GameStateCrash("ERROR:  Invalid CNT Command:");
          goto LAB_800d5230;
        }
        if (eVar1 != FLAG_LOG) {
LAB_800d5220:
          CRASH("gamestatelib.cpp::\nProcessGameStates","Unknown Game State Type");
        }
        switch(puVar6->command) {
        case FLAG_AND:
          uVar7 = gamestateShortANDfeild[puVar6->length];
          uVar8 = uVar7 & uVar5;
          goto LAB_800d5120;
        case FLAG_IOR:
          if ((gamestateShortANDfeild[puVar6->length] & uVar5) != 0) goto LAB_800d522c;
          break;
        case FLAG_EOR:
          if (gamestate_func_with_ANDgate(gamestateShortANDfeild[puVar6->length] & uVar5) == 1) goto LAB_800d522c;
          break;
        case FLAG_NOT:
          if ((gamestateShortANDfeild[puVar6->length] & uVar5) == 0) goto LAB_800d522c;
          break;
        case FLAG_MSK:
          uVar8 = puVar6->shortA;
          uVar7 = gamestateShortANDfeild[puVar6->length] & uVar5;
LAB_800d5120:
          if (uVar7 == uVar8) {
LAB_800d522c:
            bit = 1;
          }
          break;
        default:
          GameStateCrash("ERROR:  Invalid LOG Command:");
        }
LAB_800d5230:
        set_journalentry_flag(param_1,flag,bit);
        flag++;
      } while (flag < param_1->flagTotal);
    }
  } while( true );
}

void set_gamestateFunnel_f(GameStateFunnel *param_1){
  param_1->flag = 1;
  ProcessGameStates(param_1);
}
extern void SetNewJounalEntry(u16);
void set_journalentry_flag(GameStateFunnel *param_1,EventFlag flag,u16 bit){
  if (param_1->States_pointer[flag].Flag != bit) {
    param_1->States_pointer[flag].Flag = bit;
    param_1->flag = 1;
    if ((FLAG_JournalFlag <= flag) && (bit)) {
      param_1->States_pointer[FLAG_NewJournalEntry].Flag = true;
      SetNewJounalEntry(flag - FLAG_JournalFlag);
    }
  }
}

u8 get_eventFlag_(GameStateFunnel *param_1,EventFlag param_2){
  if ((param_1->States_pointer[param_2].type != FLAG_BIT) && (param_1->flag))
    ProcessGameStates(param_1);
  return param_1->States_pointer[param_2].Flag;
}

u8 get_EventFlag(GameStateFunnel *param_1,EventFlag param_2){
  return param_1->States_pointer[param_2].Flag;
}

Struct_State * get_struct_state(GameStateFunnel *param_1,EventFlag param_2){
  return &param_1->States_pointer[param_2];
}

