#include "eventFlag.h"
#include "crash.h"

u16 gamestateShortBitfeild[]={
    1<<0,1<<1,1<<2,1<<3,1<<4,1<<5,1<<6,1<<7,1<<8,1<<9,1<<10,
    1<<11,1<<12,1<<13,1<<14,1<<15
};
u16 gamestateShortANDfeild[]={
    ((1<<0)-1),((1<<1)-1),((1<<2)-1),((1<<3)-1),((1<<4)-1),((1<<5)-1),
    ((1<<6)-1),((1<<7)-1),((1<<8)-1),((1<<9)-1),((1<<10)-1),((1<<11)-1),
    ((1<<12)-1),((1<<13)-1),((1<<14)-1),((1<<15)-1),((1<<16)-1),0
};

void Ofunc_NOOP(){}

u16 Ofunc_800d4d78(GameStateFunnel *param_1,u16 param_2) {
  u16 uVar1;
  u16 *puVar2;
  u16 uVar3;
  u16 uVar4;
  u16 uVar5;
  
  if (param_1->unk10 != NULL) {
    uVar5 = 0;
    uVar3 = param_1->flagTotal - 1;
    uVar4 = uVar3;
    if (param_2 != 0xffff) {
      do {
        uVar4 = uVar4 >> 1;
        puVar2 = param_1->unk10 + uVar4 * 2;
        uVar1 = puVar2[1];
        if (param_2 < uVar1) {
          uVar3 = uVar4 - 1;
        }
        else {
          if (param_2 <= uVar1) {
            return *puVar2;
          }
          uVar5 = uVar4 + 1;
        }
        uVar4 = uVar5 + uVar3;
      } while (uVar5 <= uVar3);
      return 0xffff;
    }
  }
  return 0xffff;
}

void setGSF_pointers(GameStateFunnel *param_1) {
  param_1->other_pointer = (u16 *)((uintptr_t)param_1->other_pointer + (uintptr_t)param_1);
  param_1->States_pointer =(Struct_State *)((uintptr_t)param_1->States_pointer+(uintptr_t)param_1);
  set_gamestateFunnel_f(param_1);
}

u16 gameStateBitmask(GameStateFunnel *param_1,Struct_State *param_2) {
  u16 uVar2;
  
  if (param_2->type < FLAG_BIT) {
    u16 i = 0;
    u16 uVar2 = 0;
    EventFlag *pEVar4 = param_1->other_pointer + param_2->shortB;
    if (param_2->length != 0) {
      EventFlag EVar1 = *pEVar4;
      while( true ) {
        pEVar4++;
        if ((EVar1 != 0xffff) && (get_EventFlag(param_1,EVar1))) {
          if (param_2->type == FLAG_CNT) uVar2++;
          else uVar2 = gamestateShortBitfeild[i] | uVar2;
        }
        i++;
        if (param_2->length <= i) break;
        EVar1 = *pEVar4;
      }
    }
  }
  else return 0;
  return uVar2;
}

short gamestate_func_with_ANDgate(u16 param_1) {
  u32 uVar2 = param_1;
  u16 sVar3 = 0;
  for(u16 i=0;i<16;i++,uVar2>>=1){
    if ((uVar2 & 1) != 0) sVar3++;
  }
  return sVar3;
}

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

