#include "combat/CombatStruct.h"
#include "quicksort.h"

#define FILENAME "../combatengine/aiscores.cpp"

s32 CombatAIScore::SortFuncA(combat_aiscore *A,combat_aiscore *B) {
  u8 uVar1;
  u8 uVar2;
  s32 ret;
  u8 local_80,local_40;//?
  
  uVar1 = A->spell_pri;
  uVar2 = B->spell_pri;
  if (uVar1 < uVar2) ret = 1;
  else {
    ret = -1;
    if (uVar1 <= uVar2) ret = 0;
  }
  return ret;
}

s32 CombatAIScore::SortFuncB(combat_aiscore *A,combat_aiscore *B) {
  u8 uVar1;
  u8 uVar2;
  s32 ret;
  u8 local_80,local_40;//?
  
  uVar1 = A->spell_pri;
  uVar2 = B->spell_pri;
  if (uVar2 < uVar1) ret = 1;
  else {
    ret = -1;
    if (uVar2 <= uVar1) ret = 0;
  }
  return ret;
}

void CombatAIScore::Reset(u16 val) {
  FREEPTR(combat_AiScores_pointer,85);
  ALLOCS(combat_AiScores_pointer,val*sizeof(combat_aiscore),89);
  memset(combat_AiScores_pointer,0,(uint)val << 3);
  aiscores_move = val;
  combat_AiScore_tally = 0;
}

void CombatAIScore::SetEntry(u8 feildx,u8 feildy,u8 feild3,u8 feild0,CombatEntity *cEnt) {
  if (combat_AiScore_tally < aiscores_move) {
    combat_AiScores_pointer[combat_AiScore_tally].spell_pri = feild0;
    combat_AiScores_pointer[combat_AiScore_tally].x = feildx;
    combat_AiScores_pointer[combat_AiScore_tally].y = feildy;
    combat_AiScores_pointer[combat_AiScore_tally].unk0x3 = feild3;
    combat_AiScores_pointer[combat_AiScore_tally++].combatEnt = cEnt;
  }
}

void CombatAIScore::Sort(bool x) {
  Sorter f;
  
  if (1 < combat_AiScore_tally) {
    if (x) f = (Sorter)SortFuncB;
    else f = (Sorter)SortFuncA;
    QSort(combat_AiScores_pointer,combat_AiScore_tally,f);
  }
} 

void CombatAIScore::MoveEntry(void) {
  uint uVar1;
  uint uVar2;
  u16 uVar3;
  
  if (1 < combat_AiScore_tally) {
    if (combat_AiScores_pointer[1].spell_pri == combat_AiScores_pointer->spell_pri) {
      uVar1 = 2;
      do {
        uVar2 = uVar1;
        uVar3 = uVar2;
        if (combat_AiScore_tally <= uVar3) {
          return;
        }
        uVar1 = uVar3 + 1;
      } while (combat_AiScores_pointer[uVar3].spell_pri == combat_AiScores_pointer->spell_pri);
      combat_AiScore_tally = (u16)uVar2;
    }
    else combat_AiScore_tally = 1;
  }
}

void CombatAIScore::Free(void) {
  FREEPTR(combat_AiScores_pointer,215);
}

