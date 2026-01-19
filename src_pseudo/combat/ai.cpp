#include "combat/CombatStruct.h"
#include "combat/CombatEntity.h"
#include "combat/substructB.h"
#include "globals.h"
#include "stringN64.h"

void NOOP_8005ff90(void){}

u8 CombatAI::WillTheyFlee(ItemID id){
  byte bVar1;
  byte bVar3;
  u8 bVar4;
  char cVar5;
  int score;
  u32 uVar2;
  u8 AVar6;
  s32 lVar7;
  
  if (gCombatP->hasFleeRefpoints == 0) return false;
  bVar3 = GETINDEX(id);
  bVar1 = gEntityDB->entities[bVar3].morale;
  lVar7 = bVar1;
  if (0xb < lVar7) return false;
  AVar6 = ASPECT_SOLAR;
  if (gCombatP->EnemiesAlive <= gCombatP->enemyCount >> 1) return false;
  if (gEntityDB->entities[bVar3].aspect != ASPECT_SOLAR) AVar6 = ASPECT_LUNAR;
  if (NotAspectBonus(AVar6)) lVar7 = bVar1-1;
  if (gCombatP->EnemiesAlive < gCombatP->enemyCount >> 1) lVar7--;
  if ((gCombatP->leaderDead) || (!gCombatP->combatEnts[gCombatP->leaderIndex].Flag1())) lVar7--;
  cVar5 = lVar7 + 1;
  if (2 < gCombatP->leaderMorale - 8) {
    if (gCombatP->leaderMorale < 0xb) goto LAB_800600c4;
    cVar5 = lVar7 + 2;
  }
  lVar7 = cVar5;
LAB_800600c4:
  cVar5 = lVar7;
  if ((lVar7 < 2) || (lVar7 < 0xc)) {
    if (cVar5 < 2) cVar5 = 2;
    score = cVar5;
  }
  else score = 11;
  return score < (u8)RollD(2,6);
}

u8 CombatAI::JudgeAIMorale(CombatEntity *param_1,u8 param_2){
  Temp_enchant *pTVar1;
  u8 bVar3;
  int iVar2;
  char cVar4;
  CombatAIInfo *iVar4;
  byte bVar5;
  u8 uVar6;
  s32 lVar7;
  CombatAIInfo *pTVar4;
  CombatEntity *leader;
  
  pTVar4 = param_1->aiP;
  leader = (&gCombatP->combatEnts)[gCombatP->leaderIndex];
  pTVar4->flags &=~AIFlag_02;
  bVar5 = param_1->aiP->morale;
  lVar7 = bVar5;
  if (param_1->getNotAspectBonus()) lVar7 = bVar5-1; //aspect penalty
  if ((param_1->aiP->flags & AIFlag_10)) lVar7 -=2; //panic mod
  if (!CharStats::getModded(param_1->charSheetP->Stats,STAT_STAM)) lVar7--;//ST pentalty
  if (gCombatP->EnemiesAlive < gCombatP->enemyCount >> 1) lVar7--;//enemy penalty
  uVar6 = 0;
  pTVar1 = *param_1->charSheetP->effects;
  while ((pTVar1 == NULL || (pTVar1->varB == 0))) {
    uVar6++;
    if (0xe < uVar6) goto LAB_8006024c;
    pTVar1 = param_1->charSheetP->effects[uVar6];
  }
  lVar7--;
LAB_8006024c:
  if (gCombatP->partyAlive < gCombatP->partyCount >> 1) lVar7+=2;//party bonus
  if (!param_1->SpellEffectsPartyInArea()){
    if ((param_1->aiP->entIndex != -1) && ((&gCombatP->combatEnts)[param_1->aiP->entIndex])){
      if (!CharStats::getModded((&gCombatP->combatEnts)[param_1->aiP->entIndex]->charSheetP->Stats,STAT_STAM)) {
        lVar7+=3; //target weak bonus
      }
    }
  }
  if ((param_1->aiP->flags & AIFlag_04))lVar7-=2;
  if (param_2) {
    if ((gCombatP->leaderDead) || (!leader->Flag1())) lVar7-=4; //dead leader
    cVar4 = lVar7 + 1;
    if (2 < gCombatP->leaderMorale - 8) {
      if (gCombatP->leaderMorale < 0xb) goto LAB_8006034c;
      cVar4 = lVar7 + 2;
    }
    lVar7 = cVar4;
  }
LAB_8006034c:
  if ((lVar7 < 2) || (lVar7 < 0xc)) {
    bVar5 = (byte)lVar7;
    if (lVar7 < 2) bVar5 = 2;
  }
  else bVar5 = 0xb;
  if (!param_2) gCombatP->leaderMorale = bVar5;
  return bVar5;
}

u8 CombatAI::IsTiredOrLonely(CombatEntity *param_1){
  u8 ret = true;
  if (!(param_1->aiP->flags & AIFlag_02)) {
    if (CharStats::getModded(param_1->charSheetP->Stats,STAT_STAM) < 1) ret = true;
    else if (!(param_1->aiP->flags & AIFlag_01)) ret = gCombatP->EnemiesAlive <= gCombatP->enemyCount >> 1;
    else ret = false;
  }
  return ret;
}

void CombatAI::DebateFleeing(CombatEntity *param_1,u8 param_2){
  if (((param_2) && (param_1->aiP->morale < 0xc)) && (IsTiredOrLonely(param_1))) {
    if (!gCombatP->leaderDead) CombatAI::JudgeAIMorale((&gCombatP->combatEnts)[gCombatP->leaderIndex],false);
    if (CombatAI::JudgeAIMorale(param_1,true) < RollD(2,6)) LookToFlee(param_1->aiP);
    else param_1->aiP->flags&=~AIFlag_02;
  }
}

u8 CombatAI::IsNotDeadNorAlly(CombatAIInfo *param_1,CombatEntity *param_2){
  u8 ret;
  
  if (!param_2) return false;
  else {
    ret = false;
    if (!Entity::isDead(param_2->charSheetP)) {
      if (param_2->Flag1()) ret = param_2->Flag4() != param_1->combatEnt->Flag4();
      else ret = false;
    }
  }
  return ret;
}

u8 CombatAI::CanMoveToTarget(CombatAIInfo *param_1){  
  if (combat_AiScore_tally) {
    for(u32 i=0;i<combat_AiScore_tally;i++) {
      CombatEntity *pCVar1 = combat_AiScores_pointer[i].combatEnt;
      pCVar1->SetMovementRange();
      if (param_1->combatEnt->Get2DProximity(pCVar1) <= pCVar1->moveRange) return true;
    }
  }
  return false;
}

byte CombatAI::GetSpellPriority(CombatAIInfo *param_1,u8 param_2){
  CombatEntity *pCVar1;
  CharSheet *pCVar2;
  CombatStruct *pCVar3;
  u8 bVar4;
  u8 bVar5;
  u8 bVar6;
  byte val;
  char cVar8;
  int iVar7;
  u32 uVar9;
  u32 uVar10;
  char cVar11;
  u8 MVar12;
  Temp_enchant *iVar8;
  
  pCVar3 = gCombatP;
  cVar8 = '\0';
  if (false) goto switchD_80060678_caseD_1;
  switch(param_2) {
  case SPELLIND_Immolation:
  case SPELLIND_AcidBolt:
    val = 0x16;
    break;
  default:
    goto switchD_80060678_caseD_1;
  case SPELLIND_removePoison:
    if (!CombatAI::IsSomeonePoisoned()) return 0;
  case SPELLIND_photosynthesis:
    val = 0x53;
    break;
  case SPELLIND_AirSheild:
  case SPELLIND_spiritSheild:
  case SPELLIND_starlightSheild:
    val = 0x3d;
    break;
  case SPELLIND_ControlElem:
    bVar4 = CombatAI::ElementalInCombat();
    goto LAB_8006078c;
  case SPELLIND_debilitation:
    val = 0x1f;
    break;
  case SPELLIND_DragonFlames:
  case SPELLIND_wind:
    val = 0xc;
    break;
  case SPELLIND_EarthSmite:
  case SPELLIND_crushingDeath:
  case SPELLIND_whitefire:
    val = 0xd;
    break;
  case SPELLIND_fireball:
    val = 0xe;
    break;
  case SPELLIND_lightning:
    val = 0xb;
    break;
  case SPELLIND_strength:
    val = 0x33;
    break;
  case SPELLIND_brilliance:
    val = 0x35;
    break;
  case SPELLIND_stupidity:
    val = 0x21;
    break;
  case SPELLIND_banishing:
    if (!CombatAI::ElementalInCombat()) return 0;
  case SPELLIND_cheatDeath:
    val = 0x52;
    break;
  case SPELLIND_charming:
    goto switchD_80060678_caseD_10;
  case SPELLIND_endurance:
    val = 0x34;
    break;
  case SPELLIND_weakness:
    val = 0x20;
    break;
  case SPELLIND_wraithTouch:
    val = 0x24;
    break;
  case SPELLIND_controlZombies:
    bVar4 =CombatAI:: ZombieInCombat(param_1);
LAB_8006078c:
    val = 0;
    if (bVar4) {
switchD_80060678_caseD_10:
      val = 0x54;
    }
    break;
  case SPELLIND_darkness:
  case SPELLIND_light:
    if ((param_2 != SPELLIND_darkness) || (TerrainPointer->partOfDay == TIME_NIGHT)) {
      if (param_2 != SPELLIND_light) return 0;
      if (TerrainPointer->partOfDay != TIME_NIGHT) return 0;
    }
    cVar11 = cVar8;
    if (gCombatP->EntCount) {
      for(u8 uVar10=0;uVar10 < gCombatP->EntCount;uVar10++) {
        pCVar1 = (&gCombatP->combatEnts)[uVar10];
        cVar8 = cVar11;
        if (pCVar1 != NULL) {
          bVar4 = pCVar1->getNotAspectBonus();
          cVar8 = cVar11 + -1;
          if (pCVar1->getNotAspectBonus() == (pCVar1->Flag4() == param_1->combatEnt->Flag4())) {
            cVar8 = cVar11 + 1;
          }
        }
        cVar11 = cVar8;
      }
    }
    val = 0x55;
    goto joined_r0x800608b4;
  case SPELLIND_haste:
    val = 0x49;
    break;
  case SPELLIND_exhaustion:
    val = 0x22;
    break;
  case SPELLIND_stamina:
    val = 0x36;
    break;
  case SPELLIND_tapStamina:
    val = 0x37;
    break;
  case SPELLIND_wallOfBones:
  case SPELLIND_frozenDoom:
    val = 0x2a;
    break;
  case SPELLIND_poison:
    val = 0x15;
    break;
  case SPELLIND_mirror:
    val = 0x48;
    break;
  case SPELLIND_vsElemental:
  case SPELLIND_vsNaming:
  case SPELLIND_vsNecromancy:
  case SPELLIND_vsStar:
    val = 0x47;
    break;
  case SPELLIND_dispelElemental:
  case SPELLIND_dispelNaming:
  case SPELLIND_dispelNecro:
  case SPELLIND_dispelStar:
    if (param_2 == SPELLIND_dispelElemental) MVar12 = SCHOOL_Elemental;
    else {
      MVar12 = SCHOOL_Naming;
      if ((param_2 != SPELLIND_dispelNaming) &&
         (MVar12 = SCHOOL_Star, param_2 == SPELLIND_dispelNecro)) {
        MVar12 = SCHOOL_Necromancy;
      }
    }
    if (gCombatP->EntCount) {
      for(u8 uVar10=0;uVar10 < gCombatP->EntCount;uVar10++) {
        pCVar1 = &gCombatP->combatEnts[uVar10];
        pCVar2 = pCVar1->charSheetP;
        if (pCVar3->substruct2[1].arrayA[uVar10]) {
          bVar4 = pCVar1->Flag4();
          bVar5 = param_1->combatEnt->Flag4();
          for(u8 uVar9=0;uVar9<MAGIC_FXMAX;uVar9++) {
            iVar8 = pCVar2->effects[uVar9];
            cVar11 = cVar8;
            if ((((iVar8 != NULL) && (iVar8->school == MVar12)) && (iVar8->timer != 0xffffffff)) &&
               (cVar11 = cVar8 + -1, iVar8->varB == (u32)(bVar4 == bVar5))) {
              cVar11 = cVar8 + 1;
            }
            cVar8 = cVar11;
          }
        }
      }
    }
    val = 0x51;
joined_r0x800608b4:
    if (cVar8 < 1) {
switchD_80060678_caseD_1:
      val = 0;
    }
    break;
  case SPELLIND_dexterity:
    val = 0x38;
    break;
  case SPELLIND_clumsiness:
    val = 0x23;
    break;
  case SPELLIND_stellarGravity:
    val = 0x29;
    break;
  case SPELLIND_webOfStarlight:
    val = 0x2b;
  }
  return val;
}

void CombatAI::FUN_800609bc(CombatAIInfo *param_1){
  CombatAIScore::Reset(gCombatP->EntCount);
  if (gCombatP->EntCount) {
    for(u8 i=0;i<gCombatP->EntCount;i++) {
      CombatEntity *cEnt = &gCombatP->combatEnts[i];
      if (CombatAI::IsNotDeadNorAlly(param_1,cEnt))
        CombatAIScore::SetEntry(cEnt->GetCoordXU8(),cEnt->GetCoordYU8(),0,0,cEnt);
    }
  }
}

void CombatAI::FUN_80060a88(CombatAIInfo *param_1){
  byte bVar1;
  u8 uVar2;
  CombatEntity *pCVar3;
  byte feildy;
  CombatStruct *pCVar4;
  u8 X;
  u8 Y;
  u8 uVar7;
  u8 uVar8;
  int iVar9;
  u16 uVar10;
  CombatSubstructA *pcVar11;
  byte feildx;
  int iVar12;
  u32 uVar13;
  u32 uVar14;
  u32 uVar15;
  int iVar16;
  u16 uVar17;
  CombatSubstructB *X_00;
  u32 uVar18;
  float x;
  float y;
  
  bVar1 = param_1->combatEnt->moveRange;
  CombatAIScore::Reset(SQ(bVar1) * 4);
  x = param_1->combatEnt->GetCoordX();
  y = param_1->combatEnt->GetCoordY();
  X = param_1->combatEnt->GetCoordXU8();
  Y = param_1->combatEnt->GetCoordYU8();
  pCVar4 = gCombatP;
  pcVar11 = &gCombatP->substruct;
  uVar2 = param_1->combatEnt->unk23;
  X_00 = gCombatP->substruct2;
  unk800714d0(param_1->combatEnt);
  uVar18 = (u32)bVar1;
  iVar16 = (int)(((int)(char)Y - uVar18) * 0x1000000) >> 0x18;
  iVar9 = (int)(char)Y + uVar18;
  if (iVar16 <= iVar9) {
    do {
      feildy = (byte)iVar16;
      iVar12 = (int)(((int)(char)X - uVar18) * 0x1000000) >> 0x18;
      while (iVar12 <= (int)((int)(char)X + uVar18)) {
        feildx = (byte)iVar12;
        if ((sub_square_add_sqrt(feildx,feildy,X,Y) <= bVar1) && (FUN_80070fa0(pcVar11,iVar12,iVar16,uVar2))) {
          param_1->combatEnt->SetCoords((float)iVar12,(float)iVar16);
          FUN_80072454(X_00,param_1->combatEnt);
          uVar13 = 0;
          if (gCombatP->substruct2[0].arrayBCount != 0) {
            uVar17 = 0xff;
            uVar15 = 0;
            if (gCombatP->EntCount != 0) {
              for(u8 uVar13=0;uVar13 < gCombatP->EntCount;uVar13++) {
                pCVar3 = (&gCombatP->combatEnts)[uVar13];
                uVar10 = uVar17;
                uVar14 = uVar15;
                if (X_00->arrayA[uVar13] == 0) {
LAB_80060cb0:
                  uVar17 = uVar10;
                  uVar15 = uVar14;
                }
                else {
                  uVar10 = sub_square_add_sqrt(feildx,feildy,pCVar3->GetCoordXU8(),pCVar3->GetCoordYU8());
                  uVar14 = uVar13;
                  if (uVar10 < uVar17) goto LAB_80060cb0;
                }
              }
            }
            CombatAIScore::SetEntry(feildx,feildy,0,0,(&gCombatP->combatEnts)[uVar15]);
          }
        }
        iVar12 = (int)(char)(feildx + 1);
      }
      iVar16 = (int)(char)(feildy + 1);
    } while (iVar16 <= iVar9);
  }
  param_1->combatEnt->SetCoords(x,y);
  FUN_800713fc(pcVar11,X,Y,uVar2);
  clear_combat_substruc2(X_00);
}

void CombatAI::FUN_80060db0(CombatAIInfo *param_1){
  u8 uVar1;
  byte bVar2;
  byte bVar3;
  CombatEntity *cEnt;
  u8 bVar4;
  byte feildy;
  CombatStruct *pCVar5;
  u32 uVar7;
  u8 X;
  u8 Y;
  u16 uVar8;
  byte bVar10;
  byte bVar11;
  u8 feild0;
  u16 uVar9;
  CombatSubstructB *X_00;
  int iVar12;
  CombatSubstructA *pcVar13;
  byte feildx;
  u8 uVar14;
  u16 uVar15;
  int iVar16;
  int iVar17;
  combat_aiscore *pcVar18;
  float x;
  float y;
  
  bVar10 = param_1->combatEnt->moveRange;
  bVar3 = 0;
  bVar2 = 0;
  bVar11 = 0;
  uVar7 = (u32)bVar10;
  CombatAIScore::Reset(SQ(bVar10) * 4);
  bVar10 = 0;
  x = param_1->combatEnt->GetCoordX();
  y = param_1->combatEnt->GetCoordY();
  X = param_1->combatEnt->GetCoordXU8();
  Y = param_1->combatEnt->GetCoordYU8();
  pCVar5 = gCombatP;
  pcVar13 = &gCombatP->substruct;
  uVar1 = param_1->combatEnt->unk23;
  X_00 = gCombatP->substruct2;
  FUN_800714d0(pcVar13,X,Y,uVar1);
  iVar17 = Y - uVar7;
  iVar12 = Y + uVar7;
  pcVar18 = NULL;
  if (iVar17 <= iVar12) {
    do {
      feildy = (byte)iVar17;
      iVar16 = X - uVar7;
      while (iVar16 <= (X + uVar7)) {
        feildx = (byte)iVar16;
        if ((sub_square_add_sqrt(feildx,feildy,X,Y) <= uVar7) &&
           (FUN_80070fa0(pcVar13,iVar16,iVar17,uVar1))) {
            param_1->combatEnt->SetCoords((float)iVar16,(float)iVar17);
          FUN_80072454(X_00,param_1->combatEnt);
          if ((pCVar5->substruct2[0].arrayBCount != 0) && (uVar14 = 0, gCombatP->EntCount != 0)) {
            iVar16 = 0;
            do {
              cEnt = *(CombatEntity **)((int)&gCombatP->combatEnts + iVar16);
              if (*(int *)((int)X_00->arrayA + iVar16) != 0) {
                bVar4 = false;
                for (uVar15 = 0; uVar15 < combat_AiScore_tally; uVar15++) {
                  pcVar18 = combat_AiScores_pointer + uVar15;
                  if (pcVar18->combatEnt == cEnt) {
                    bVar10 = cEnt->GetCoordXU8();
                    bVar11 = cEnt->GetCoordYU8();
                    bVar2 = pcVar18->x;
                    bVar3 = pcVar18->y;
                    bVar4 = true;
                    break;
                  }
                }
                feild0 = CombatAI::CanMoveToTarget(param_1);
                if (bVar4) {
                  if ((feild0) || (pcVar18->spell_pri == 0)) {
                    if (sub_square_add_sqrt(feildx,feildy,bVar10,bVar11) > sub_square_add_sqrt(bVar2,bVar3,bVar10,bVar11)) goto LAB_800610b8;
                    pcVar18->x = feildx;
                  }
                  else pcVar18->x = feildx;
                  pcVar18->y = feildy;
                  pcVar18->spell_pri = feild0;
                }
                else {
                  CombatAIScore::SetEntry(feildx,feildy,0,feild0,cEnt);
                }
              }
LAB_800610b8:
              uVar14++;
              iVar16 = uVar14 << 2;
            } while (uVar14 < gCombatP->EntCount);
          }
        }
        iVar16 = (int)(char)(feildx + 1);
      }
      iVar17 = (int)(char)(feildy + 1);
    } while (iVar17 <= iVar12);
  }
  FUN_800713fc(pcVar13,X,Y,uVar1);
  param_1->combatEnt->SetCoords(x,y);
  clear_combat_substruc2(X_00);
  return;
}


int CombatAI::FireballCalc(CombatAIInfo *param_1){
  CombatEntity *cEnt;
  u8 bVar5;
  u8 bVar6;
  int iVar7;
  u32 i;
  int iVar9;
  float yTotal;
  float targetCount;
  float xTotal;
  
  yTotal = 0.0;
  xTotal = 0.0;
  targetCount = 0.0;
  if (gCombatP->EntCount) {
    for(i=0;i < gCombatP->EntCount;i++) {
      cEnt = (&gCombatP->combatEnts)[i];
      if (IsNotDeadNorAlly(param_1,cEnt)) {
        xTotal += cEnt->GetCoordX();
        yTotal += cEnt->GetCoordY();
        targetCount+=1.0f;
      }
    }
  }
  cEnt = param_1->combatEnt;
  (gCombatP->SpellMarkerPos).x = xTotal / targetCount;
  (gCombatP->SpellMarkerPos).y = yTotal / targetCount;
  FUN_80072454(&gCombatP->substruct2[1],cEnt);
  if (gCombatP->substruct2[1].arrayBCount == 0) return 0;
  else {
    iVar9 = 0;
      for(i=0;i < gCombatP->EntCount;i++){
        if (gCombatP->substruct2[1].arrayA[i]) {
          if (gCombatP->combatEnts[i].Flag4() == param_1->combatEnt->Flag4()) iVar9--;
          else iVar9++;
        }
      }
  }
  return iVar9;
}

s32 some_prioirty_getter(CombatAIInfo *param_1){
  FUN_80072454(gCombatP->substruct2 + 1,param_1->combatEnt);
  return gCombatP->substruct2[1].arrayBCount - 1;
}

struct CombatAi_command {
    void (*cmd)(CombatAIInfo*);
    u32 unk; //unused, always 0xffff
};

u8 D_800ef6e0[]={0,1,2,3,4};
u8 D_800ef6e8[]={1,1,1,1,1,2,3,4,0,0,0xff,0xff};

CombatAi_command combatAI_commands[]={
  {FUN_8006228c,0xFFFF},{FUN_800622c4,0xFFFF},{FUN_800622f8,0xFFFF},
  {FUN_800623bc,0xFFFF},{FUN_800624bc,0xFFFF},{FUN_800624f0,0xFFFF},
  {FUN_8006252c,0xFFFF},{FUN_800625a4,0xFFFF},{FUN_800625e0,0xFFFF},
  {FUN_8006261c,0xFFFF},{FUN_8006268c,0xFFFF}
};

u32 CombatAI::FireballFunc2(CombatAIInfo *param_1){
  byte bVar1;
  u8 uVar2;
  byte bVar3;
  byte bVar4;
  CharSheet *pCVar5;
  CombatSubstructB *pcVar6;
  CombatStruct *pCVar7;
  u8 X;
  u8 Y;
  u32 uVar9;
  SpellInstance *pSVar10;
  byte bVar14;
  int iVar11;
  s8 sVar15;
  int iVar12;
  u16 uVar13;
  longlong lVar8;
  byte cVar19;
  byte spellPri;
  CombatSubstructA *pcVar16;
  int iVar17;
  byte feildx;
  int iVar18;
  u32 uVar19;
  int iVar20;
  float x;
  float y;
  u32 uStack_74;
  u32 uStack_60;
  
  bVar1 = param_1->combatEnt->moveRange;
  if (bVar1 == 0) uStack_74 = CombatAI::SpellStamina(param_1);
  else {
    x = param_1->combatEnt->GetCoordX();
    uStack_74 = 0;
    y = param_1->combatEnt->GetCoordY();
    X = param_1->combatEnt->GetCoordXU8();
    Y = param_1->combatEnt->GetCoordYU8();
    pCVar7 = gCombatP;
    uStack_60 = 0;
    pcVar6 = gCombatP->substruct2;
    pcVar16 = &gCombatP->substruct;
    pCVar5 = param_1->combatEnt->charSheetP;
    uVar2 = param_1->combatEnt->unk23;
    bVar3 = pCVar5->currSpell;
    bVar4 = pCVar5->spellSwitch;
    CombatAIScore::Reset(SQ(bVar1) * 4 * 8);
    FUN_800714d0(pcVar16,X,Y,uVar2);
    do {
      uVar9 = uStack_60 + 1;
      if (param_1->spells[uStack_60] != SPELLIND_NONE) {
        pCVar5->currSpell = D_800ef6e0[uStack_60];
        pCVar5->spellSwitch = D_800ef6e8[uStack_60];
        pSVar10 = Entity::GetSpell(pCVar5);
        bVar14 = Entity::CheckSpellWizard(pCVar5,pSVar10);
        if (uStack_74 == 0) uStack_74 = CharStats::getModded(pCVar5->Stats,STAT_STAM) < Entity::SpellStaminaSubtract(pSVar10,bVar14) ^ 1;
        uVar19 = (u32)bVar1;
        iVar11 = (int)(char)Y - uVar19;
        iVar12 = (int)(char)Y + uVar19;
        if (iVar11 <= iVar12) {
          iVar20 = (int)(char)X + uVar19;
          do {
            iVar17 = iVar11 + 1;
            iVar18 = (int)(char)X - uVar19;
            if (iVar18 <= iVar20) {
              bVar14 = (byte)iVar11;
              do {
                feildx = (byte)iVar18;
                if ((sub_square_add_sqrt(feildx,bVar14,X,Y) <= bVar1) &&
                   (FUN_80070fa0(pcVar16,feildx,bVar14,uVar2))) {
                    param_1->combatEnt->SetCoords(iVar18,iVar11);
                  if (param_1->spells[uStack_60] == SPELLIND_fireball) cVar19 = CombatAI::FireballCalc(param_1);
                  else cVar19 = some_prioirty_getter(param_1);
                  if ((pCVar7->substruct2[1].arrayBCount != 0) &&
                     (spellPri = CombatAI::GetSpellPriority(param_1,param_1->spells[uStack_60]),
                     spellPri != 0)) {
                    CombatAIScore::SetEntry(feildx,bVar14,(byte)uVar9,spellPri + cVar19 * 10 + pSVar10->level,
                               (&gCombatP->combatEnts)[(byte)pCVar7->substruct2[1].entindex]);
                  }
                }
                iVar18++;
              } while (iVar18 <= iVar20);
            }
            iVar11 = iVar17;
          } while (iVar17 <= iVar12);
        }
      }
      uStack_60 = uVar9;
    } while (uVar9 < 8);
    pCVar5->currSpell = bVar3;
    pCVar5->spellSwitch = bVar4;
    FUN_800713fc(pcVar16,X,Y,uVar2);
    param_1->combatEnt->SetCoords(x,y);
    clear_combat_substruc2(pcVar6 + 1);
  }
  return uStack_74;
}

u8 CombatAI::SpellStamina(CombatAIInfo *param_1){
  byte bVar1;
  byte bVar2;
  CharSheet *pCVar3;
  u8 bVar4;
  CombatSubstructB *pcVar5;
  CombatStruct *pCVar6;
  u8 feildx;
  u8 feildy;
  SpellInstance *pSVar7;
  u8 bVar9;
  int iVar8;
  s8 sVar10;
  char cVar11;
  SpellEnum SVar12;
  u32 i;
  SpellEnum *pSVar14;
  SpellEnum *pSVar15;
  
  pCVar6 = gCombatP;
  bVar4 = false;
  pCVar3 = param_1->combatEnt->charSheetP;
  pcVar5 = gCombatP->substruct2;
  bVar1 = pCVar3->currSpell;
  bVar2 = pCVar3->spellSwitch;
  feildx = param_1->combatEnt->GetCoordXU8();
  feildy = param_1->combatEnt->GetCoordYU8();
  CombatAIScore::Reset(8);
  for(i=0;i<8;i++){
    if (param_1->spells[i] != SPELLIND_NONE) {
      pCVar3->currSpell = D_800ef6e0[i];
      pCVar3->spellSwitch = D_800ef6e8[i];
      pSVar7 = Entity::GetSpell(pCVar3);
      bVar9 = Entity::CheckSpellWizard(pCVar3,pSVar7);
      if (!bVar4) {
        bVar4= CharStats::getModded(pCVar3->Stats,STAT_STAM)>Entity::SpellStaminaSubtract(pSVar7,bVar9);
      }
      if (param_1->spells[i] == SPELLIND_fireball) cVar11 = CombatAI::FireballCalc(param_1);
      else cVar11 = some_prioirty_getter(param_1);
      if (pCVar6->substruct2[1].arrayBCount != 0) {
        bVar9 = CombatAI::GetSpellPriority(param_1,param_1->spells[i]);
        if (bVar9) {
          CombatAIScore::SetEntry
                    (feildx,feildy,(char)i + 1,bVar9 + cVar11 * 10 + pSVar7->level,
                     (&gCombatP->combatEnts)[(byte)pCVar6->substruct2[1].entindex]);
        }
      }
    }
  }
  pCVar3->currSpell = bVar1;
  pCVar3->spellSwitch = bVar2;
  clear_combat_substruc2(pcVar5 + 1);
  return bVar4;
}

void FUN_8006193c(CombatAIInfo *param_1) {
  byte bVar1;
  CombatEntity *pCVar2;
  byte bVar3;
  ushort uVar4;
  ushort uVar5;
  uint uVar7;
  uint uVar9;
  u8 y;
  int iVar10;
  u16 uVar11;
  u8 uVar13;
  u8 uVar14;
  ushort uVar12;
  int iVar15;
  CombatSubstructA *pCVar16;
  CombatSubstructB *pCVar17;
  uint uVar18;
  uint uVar19;
  uint uVar20;
  u32 uStack_50;
  u32 uStack_4c;
  u8 x;
  
  uStack_4c = 0;
  uStack_50 = 0;
  uVar5 = 0;
  uVar9 = (uint)param_1->combatEnt->moveRange;
  x = param_1->combatEnt->GetCoordXU8();
  y = param_1->combatEnt->GetCoordYU8();
  pCVar16 = &gCombatP->substruct;
  bVar1 = param_1->combatEnt->unk23;
  pCVar17 = gCombatP->substruct2;
  FUN_800714d0(pCVar16,x,y,bVar1);
  uVar20 = (int)(((int)(char)y - uVar9) * 0x1000000) >> 0x18;
  iVar15 = (int)(char)y + uVar9;
  if ((int)uVar20 <= iVar15) {
    iVar10 = (int)(char)x + uVar9;
    do {
      bVar3 = (byte)uVar20;
      uVar18 = (int)(((int)(char)x - uVar9) * 0x1000000) >> 0x18;
      if ((int)uVar18 <= iVar10) {
        do {
          uVar12 = 0;
          uVar11 = sub_square_add_sqrt((byte)uVar18,bVar3,x,y);
          uVar19 = uStack_50;
          uVar7 = uStack_4c;
          uVar4 = uVar5;
          if ((uVar9 < uVar11) || (!FUN_80070fa0(pCVar16,uVar18,uVar20,bVar1))) {
LAB_80061b18:
            uStack_4c = uVar7;
            uStack_50 = uVar19;
            uVar5 = uVar4;
          }
          else {
            for(u16 k=0;k<combat_AiScore_tally;k++){
              pCVar2 = combat_AiScores_pointer[k].combatEnt;
              uVar12 +=sub_square_add_sqrt((byte)uVar18,bVar3,
                        pCVar2->GetCoordXU8(),pCVar2->GetCoordYU8());
            }
            uVar19 = uVar18 & 0xff;
            uVar7 = uVar20 & 0xff;
            uVar4 = uVar12;
            if (uVar5 < uVar12) goto LAB_80061b18;
          }
          uVar18 = (int)((uVar18 + 1) * 0x1000000) >> 0x18;
        } while ((int)uVar18 <= iVar10);
      }
      uVar20 = (uint)(char)(bVar3 + 1);
    } while ((int)uVar20 <= iVar15);
  }
  combat_AiScores_pointer->x = (byte)uStack_50;
  combat_AiScores_pointer->combatEnt = NULL;
  combat_AiScores_pointer->y = (byte)uStack_4c;
  FUN_800713fc(pCVar16,x,y,bVar1);
  clear_combat_substruc2(pCVar17);
}


u8 FUN_80061bc8(CombatAIInfo *param_1,u8 param_2,u8 param_3,u8 param_4,int param_5,u8 param_6) {
  CombatEntity *pCVar1;
  u16 uVar3;

  for(u8 i=0;i<gCombatP->EntCount;i++) {
    pCVar1 = param_1->combatEnt;
    if (i != pCVar1->index) {
      pCVar1 = (&gCombatP->combatEnts)[i];
      if (!Entity::isDead(pCVar1->charSheetP)) {
        if (pCVar1->Flag4() == param_1->combatEnt->Flag4()) {
          uVar3 = sub_square_add_sqrt(param_2,param_3,pCVar1->GetCoordXU8(),pCVar1->GetCoordYU8());
          if ((uVar3 <= param_6) && (param_4 += 5, param_5 == 0)) {
            if (param_4 < 5) return 0;
            param_4-= 5;
          }
        }
      }
    }
  }
  return param_4;
}

void FUN_80061d10(CombatAIInfo* param_1,s32 param_2){
  u8 coords [2];
  
  u8 bVar6 = 0;
  if (gCombatP->leaderDead == 0) bVar6 = gCombatP->flask_byte;
  param_1->combatEnt->GetCoordU8(coords,coords + 1);
  for(u16 i=0;i<combat_AiScore_tally;i++){
    combat_aiscore* s= &combat_AiScores_pointer[i];
    s->spell_pri = sub_square_add_sqrt(coords[0],coords[1],s->x,s->y);
    if (bVar6)
      s->spell_pri = FUN_80061bc8(param_1,s->x,s->y,s->spell_pri,param_2,bVar6);
  }
}

void FUN_80061dfc(CombatAIInfo *param_1){
  byte bVar1;
  byte bVar2;
  byte bVar3;
  byte bVar4;
  CombatEntity *pCVar5;
  CharSheet *pCVar6;
  WeaponInstance *pWVar7;
  u8 x;
  u8 y;
  u32 uVar9;
  u8 x_00;
  u8 y_00;
  int iVar10;
  u8 uVar13;
  int iVar11;
  int iVar12;
  byte bVar14;
  CombatSubstructB *X;
  CombatSubstructA *pCVar15;
  u32 uVar16;
  u32 uVar17;
  u16 i;
  u8 uVar19;
  u32 uVar20;
  combat_aiscore *pcVar21;
  float x_01;
  float y_01;
  float fVar22;
  u32 uStack_68,uStack_64;
  
  bVar1 = 0;
  if (gCombatP->leaderDead == 0) {
    bVar1 = gCombatP->flask_byte;
  }
  x_01 = param_1->combatEnt->GetCoordX();
  y_01 = param_1->combatEnt->GetCoordY();
  x = param_1->combatEnt->GetCoordXU8();
  y = param_1->combatEnt->GetCoordYU8();
  pCVar15 = &gCombatP->substruct;
  bVar2 = param_1->combatEnt->unk23;
  X = gCombatP->substruct2;
  uVar9 = (u32)bVar2;
  FUN_800714d0(pCVar15,x,y,bVar2);
  i = 0;
  if (combat_AiScore_tally != 0) {
    do {
      pcVar21 = combat_AiScores_pointer + i;
      bVar3 = pcVar21->x;
      uStack_68 = (u32)bVar3;
      bVar14 = pcVar21->y;
      pCVar5 = pcVar21->combatEnt;
      uStack_64 = (u32)bVar14;
      x_00 = pCVar5->GetCoordXU8();
      y_00 = pCVar5->GetCoordYU8();
      uVar16 = (u32)pCVar5->unk23;
      uVar20 = (int)(((int)(char)y_00 - uVar9) * 0x1000000) >> 0x18;
      pCVar6 = pCVar5->charSheetP;
      bVar4 = pCVar5->index;
      pWVar7 = pCVar6->weapons;
      if ((int)uVar20 <= (int)((int)(char)y_00 + (u32)pCVar5->unk23)) {
        do {
          bVar3 = (byte)uVar20;
          uVar17 = (int)(((int)(char)x_00 - uVar9) * 0x1000000) >> 0x18;
          if ((int)uVar17 <= (int)((int)(char)x_00 + uVar16)) {
            iVar10 = uVar17 * 0x1000000;
            do {
              iVar10 += 0x1000000;
              if (FUN_80070fa0(pCVar15,uVar17,uVar20,uVar9)) {
                param_1->combatEnt->SetCoords(uVar17,uVar20);
                param_1->combatEnt->m8006a394(x_00,y_00);
                FUN_80072454(X,param_1->combatEnt);
                if (X->arrayA[bVar4] != 0) {
                  iVar12 = 0;
                  if ((uVar17 == x) && (uVar20 == y)) {
                    iVar12 = 25;
                  }
                  if (param_1->combatEnt->m8006a830(pCVar5,x_00,y_00)) {
                    iVar12+=20;
                  }
                  if (FUN_80070cc4(pCVar15,(u8)uVar17,bVar3,x_00,y_00) < 0) {
                    iVar12 += 50;
                  }
                  fVar22 = (1.0f - (float)Entity::getHPPercent(pCVar6)) * 15.0f;
                  uVar19 = (iVar12 + (int)fVar22) & 0xff;
                  if ((pWVar7 != NULL) && (pWVar7->range != 0)) {
                    uVar19+=10;
                  }
                  if (bVar1 != 0) {
                    uVar19 = FUN_80061bc8(param_1,(u8)uVar17,bVar3,(byte)uVar19,0,bVar1);
                  }
                  if (pcVar21->spell_pri < uVar19) {
                    pcVar21->spell_pri = (byte)uVar19;
                    uStack_68 = uVar17 & 0xff;
                    uStack_64 = uVar20 & 0xff;
                  }
                }
              }
              uVar17 = iVar10 >> 0x18;
            } while ((int)uVar17 <= (int)((int)(char)x_00 + (u32)pCVar5->unk23));
          }
          uVar16 = (u32)pCVar5->unk23;
          uVar20 = (u32)(char)(bVar3 + 1);
          bVar3 = (byte)uStack_68;
          bVar14 = (byte)uStack_64;
        } while ((int)uVar20 <= (int)((int)(char)y_00 + uVar16));
      }
      uStack_64 = bVar14;
      uStack_68 = bVar3;
      pcVar21->x = uStack_68;
      pcVar21->y = uStack_64;
      i++;
    } while (i < combat_AiScore_tally);
  }
  FUN_800713fc(pCVar15,x,y,bVar2);
  param_1->combatEnt->SetCoords(x_01,y_01);
  clear_combat_substruc2(X);
}

u8 FUN_80062230(CombatAIInfo* param_1){
  CombatAI::FireballFunc2(param_1);
  u8 bVar1 = combat_AiScore_tally != 0;
  if (bVar1) {
    CombatAIScore::Sort(false);
    CombatAIScore::MoveEntry();
    FUN_80061d10(param_1,1);
    CombatAIScore::Sort(true);
  }
  return bVar1;
}

void FUN_8006228c(CombatAIInfo* param_1){
  CombatAI::FUN_800609bc(param_1);
  FUN_80061d10(param_1,1);
  CombatAIScore::Sort(true);
}

void FUN_800622c4(CombatAIInfo* param_1){
  CombatAI::FUN_800609bc(param_1);
  FUN_80061dfc(param_1);
  CombatAIScore::Sort(false);
}

void FUN_800622f8(CombatAIInfo* param_1){
  u8 bVar1;
  u8 bVar2;
  
  CombatAI::FUN_80060a88(param_1);
  if (combat_AiScore_tally == 0) {
    CombatAIScore::Free();
    bVar1 = param_1->combatEnt->AtkType;
    bVar2 = 1;
    if (bVar1 == 1) {bVar2 = 2;}
    param_1->combatEnt->AtkType = bVar2;
    CombatAI::FUN_80060a88(param_1);
    param_1->combatEnt->AtkType = bVar1;
    if (combat_AiScore_tally == 0) {
      CombatAIScore::Free();
      CombatAI::FUN_800609bc(param_1);
    }
    else {param_1->unk7 = param_1->combatEnt->AtkType == 1;}
  }
  FUN_80061d10(param_1,1);
  CombatAIScore::Sort(true);
}

void FUN_800623bc(CombatAIInfo* param_1){
  u8 bVar1;
  u8 bVar2;
  
  if (!param_1->combatEnt->NotNearEnemy()) {
    bVar1 = param_1->combatEnt->AtkType;
    param_1->combatEnt->AtkType = 1;
    CombatAI::FUN_80060a88(param_1);
    FUN_80061dfc(param_1);
    CombatAIScore::Sort(false);
    param_1->combatEnt->AtkType = bVar1;
    param_1->unk7 = 0;
  }
  else {
    if (param_1->combatEnt->AtkType == 1) {
      CombatAI::FUN_800609bc(param_1);
      FUN_8006193c(param_1);
      param_1->unk7 = 1;
    }
    else {
      CombatAI::FUN_80060db0(param_1);
      if (combat_AiScore_tally == 0) {
        CombatAIScore::Free();
        FUN_8006228c(param_1);
      }
      else {
        CombatAIScore::Sort(true);
        bVar2 = combat_AiScores_pointer->spell_pri == 0;
        if (bVar2) {CombatAIScore::MoveEntry();}
        FUN_80061d10(param_1,(u32)bVar2);
        CombatAIScore::Sort(bVar2);
      }
    }
  }
}

void FUN_800624bc(CombatAIInfo* param_1){
  CombatAI::FUN_800609bc(param_1);
  FUN_80061dfc(param_1);
  CombatAIScore::Sort(false);
}

void FUN_800624f0(CombatAIInfo* param_1){
  if (!FUN_80062230(param_1)) {
    CombatAIScore::Free();
    FUN_8006228c(param_1);
  }
}

void FUN_8006252c(CombatAIInfo* param_1){
  if (!FUN_80062230(param_1)) {
    CombatAIScore::Free();
    CombatAI::FUN_80060a88(param_1);
    if (combat_AiScore_tally == 0) {
      CombatAIScore::Free();
      FUN_800622c4(param_1);
      param_1->unk7 = 0;
    }
    else {
      FUN_80061dfc(param_1);
      CombatAIScore::Sort(false);
      param_1->unk7 = 0;
    }
  }
}

void FUN_800625a4(CombatAIInfo* param_1){
  if (!FUN_80062230(param_1)) {
    CombatAIScore::Free();
    FUN_800623bc(param_1);
  }
}

void FUN_800625e0(CombatAIInfo* param_1){
  if (!FUN_80062230(param_1)) {
    CombatAIScore::Free();
    FUN_800624bc(param_1);
  }
}

void FUN_8006261c(CombatAIInfo* param_1){

  if (!FUN_80062230(param_1)) {
    CombatAIScore::Free();
    CombatAI::FUN_80060a88(param_1);
    if (combat_AiScore_tally == 0) {
      CombatAIScore::Free();
      CombatAI::FUN_800609bc(param_1);
    }
    FUN_80061dfc(param_1);
    CombatAIScore::Sort(false);
    param_1->unk7 = 0;
  }
}

void FUN_8006268c(CombatAIInfo* param_1){
  u8 bVar1;
  u8 bVar2;
  
  if (!FUN_80062230(param_1)) {
    CombatAIScore::Free();
    if (!param_1->combatEnt->NotNearEnemy()) {
      bVar1 = param_1->combatEnt->AtkType;
      param_1->combatEnt->AtkType = 1;
      CombatAI::FUN_80060a88(param_1);
      FUN_80061dfc(param_1);
      CombatAIScore::Sort(false);
      param_1->combatEnt->AtkType = bVar1;
      param_1->unk7 = 0;
    }
    else {
      if (param_1->combatEnt->AtkType == 1) {
        CombatAI::FUN_800609bc(param_1);
        FUN_8006193c(param_1);
        param_1->unk7 = 1;
      }
      else {
        CombatAI::FUN_80060db0(param_1);
        if (combat_AiScore_tally == 0) {
          CombatAIScore::Free();
          CombatAI::FUN_800609bc(param_1);
          FUN_8006193c(param_1);
        }
        else {
          CombatAIScore::Sort(true);
          if (combat_AiScores_pointer->spell_pri == 0) {
            CombatAIScore::MoveEntry();
          }
          FUN_80061d10(param_1,1);
          CombatAIScore::Sort(true);
        }
      }
    }
  }
  return;
}

void combatAI_run_cmd(CombatAIInfo* param_1,u8 *param_2,u8 *param_3){
  CharSheet *pCVar1;
  CombatEntity *pCVar2;
  combat_aiscore *pcVar3;
  u8 bVar4;
  u8 bVar5;
  u8 uVar6;
  
  (*combatAI_commands[param_1->command].cmd)(param_1);
  pcVar3 = combat_AiScores_pointer;
  param_1->entIndex = -1;
  if (pcVar3->combatEnt) param_1->entIndex = pcVar3->combatEnt->index;
  if (pcVar3->unk0x3) {
    pcVar3->unk0x3--;
    pCVar1 = param_1->combatEnt->charSheetP;
    pCVar1->currSpell = D_800ef6e0[pcVar3->unk0x3];
    pCVar1->spellSwitch = D_800ef6e8[pcVar3->unk0x3];
  }
  *param_2 = pcVar3->x;
  *param_3 = pcVar3->y;
  CombatAIScore::Free();
  if (((param_1->combatEnt->index == gGlobals.ShadowIndex) &&
      (HasHornOfKynon())) &&(pCVar2 = gCombatP->combatEnts, pCVar2)) {
    *param_2 = pCVar2->GetCoordXU8();
    *param_3 = pCVar2->GetCoordYU8();
  }
}

void FUN_800628cc(CombatAIInfo* param_1){
  CharSheet *pCVar1;
  CombatSubstructB *pCVar2;
  uint uVar3;
  SpellInstance *pSVar6;
  byte bVar9;
  int iVar7;
  u8 uVar10;
  u8 uVar11;
  bool bVar12;
  u16 uVar8;
  bool bVar13;
  CombatSubstructA *pCVar14;
  uint uVar15;
  int iVar16;
  char cVar17;
  byte X;
  uint uVar18;
  u8 uVar19;
  u32 uVar20;
  int iVar21;
  float fVar22;
  float fVar23;
  u32 uStack_54;
  u32 uStack_48;
  u32 uStack_44;
  
  pCVar2 = gCombatP->substruct2;
  pCVar1 = param_1->combatEnt->charSheetP;
  pCVar14 = &gCombatP->substruct;
  pSVar6 = Entity::GetSpell(pCVar1);
  if ((pSVar6 != NULL) && (GETINDEX((pSVar6->base).id) == SPELLIND_fireball)) {
    uVar15 = (uint)pSVar6->range * Entity::CheckSpellWizard(pCVar1,pSVar6);
    uVar10 = param_1->combatEnt->GetCoordXU8();
    uVar11 = param_1->combatEnt->GetCoordYU8();
    uStack_54 = 0;
    uStack_48 = (gCombatP->SpellMarkerPos).x;
    uStack_44 = (gCombatP->SpellMarkerPos).y;
    uVar20 = (int)(((int)(char)uVar11 - uVar15) * 0x1000000) >> 0x18;
    iVar7 = (int)(char)uVar11 + uVar15;
    if ((int)uVar20 <= iVar7) {
      do {
        bVar9 = (byte)uVar20;
        iVar21 = (int)(char)uVar10 - uVar15;
        while( true ) {
          uVar3 = iVar21 * 0x1000000 >> 0x18;
          if ((int)((int)(char)uVar10 + uVar15) < (int)uVar3) break;
          X = (byte)((uint)(iVar21 * 0x1000000) >> 0x18);
          bVar12 = FUN_80070ee4(pCVar14,X,bVar9,1);
          iVar21 = uVar3 + 1;
          if (!bVar12) {
            if (sub_square_add_sqrt(uVar10,uVar11,X,bVar9) <= uVar15) {
              (gCombatP->SpellMarkerPos).x = uVar3;
              (gCombatP->SpellMarkerPos).y = uVar20;
              FUN_80072454(pCVar2 + 1,param_1->combatEnt);
              if (gCombatP->substruct2[1].arrayBCount != 0) {
                uVar19 = 0;
                uVar18 = 0;
                if (gCombatP->EntCount != 0) {
                  iVar16 = 0;
                  do {
                    if (pCVar2[1].arrayA[uVar19]) {
                      bVar12 = gCombatP->combatEnts[uVar19].Flag4();
                      bVar13 = param_1->combatEnt->Flag4();
                      cVar17 = (char)uVar18 + -1;
                      if (bVar12 != bVar13) {
                        cVar17 = (char)uVar18 + 1;
                      }
                      uVar18 = (uint)cVar17;
                    }
                    uVar19++;
                  } while (uVar19 < gCombatP->EntCount);
                }
                if ((int)uStack_54 < (int)uVar18) {
                  uStack_54 = uVar18 & 0xff;
                  uStack_48 = uVar3 & 0xff;
                  uStack_44 = uVar20 & 0xff;
                }
              }
            }
          }
        }
        uVar20 = (uint)(char)(bVar9 + 1);
      } while ((int)uVar20 <= iVar7);
    }
    (gCombatP->SpellMarkerPos).x = (float)uStack_48;
    (gCombatP->SpellMarkerPos).y = (float)uStack_44;
  }
}

bool FUN_80062c04(vec2f *param_1,float param_2,vec2f *param_3,vec2f *param_4,vec2f *param_5) {
  vec2f *a;
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  vec2f fStack176;
  vec2f fStack112;
  
  if ((param_1->x == param_3->x) && (param_1->y == param_3->y)) {
    Vec2Sub(param_5,param_4,param_3);
    Vec2Normalize(param_5);
    Vec2Scale(param_5,param_2);
    a = param_5;
  }
  else {
    Vec2Sub(&fStack176,param_3,param_1);
    Vec2Sub(&fStack112,param_4,param_3);
    fVar1 = Vec2Dot(&fStack112,&fStack112);
    fVar2 = Vec2Dot(&fStack176,&fStack112);
    fVar3 = Vec2Dot(&fStack176,&fStack176);
    fVar3 = SQ(fVar2) - fVar1 * (fVar3 - SQ(param_2)) * 4.0f;
    if (fVar3 < 0.0) {
      return false;
    }
    fVar3 = _sqrtf(fVar3);
    fVar4 = 1.0f / (fVar1 + fVar1);
    fVar1 = (fVar3 - fVar2) * fVar4;
    fVar4 = (-fVar3 - fVar2) * fVar4;
    if ((fVar1 < 0.0) || (1.0f < fVar1)) {
      if (fVar4 < 0.0) {
        return false;
      }
      fVar1 = fVar4;
      if (1.0f < fVar4) return false;
    }
    else if (((0.0 <= fVar4) && (fVar4 <= 1.0f)) && (fVar4 <= fVar1)) {
      fVar1 = fVar4;
    }
    Vec2Scale(&fStack112,fVar1);
    a = &fStack112;
  }
  Vec2Sum(param_5,a,param_3);
  return true;
}

u8 FUN_80062e14(u8 param_1,u8 param_2,byte *param_3,byte *param_4,u8 param_5){
  int iVar2;
  bool bVar4;
  longlong lVar1;
  int iVar3;
  int iVar5;
  CombatSubstructA *pCVar6;
  uint uVar7;
  s16 iVar8;
  uint uVar9;
  s16 iVar10;
  u8 uVar11;
  uint uVar12;
  uint uVar13;
  uint uVar14;
  uint uVar15;
  int iVar16;
  int iVar17;
  byte bVar18;
  int uStack68;
  int uStack64;
  int iStack_38;
  s16 iStack_34;
  s16 iStack_30;
  
  uVar7 = (u32)param_1;
  uVar9 = (u32)param_2;
  iVar8 = *param_3 - uVar7;
  iVar10 = *param_4 - uVar9;
  iVar5 = iVar8;
  if (iVar8 < 0) {
    iVar5 = -iVar8;
  }
  iVar2 = (int)(s16)iVar5;
  iVar5 = iVar10;
  if (iVar10 < 0) iVar5 = -iVar10;
  iVar5 = (int)(s16)iVar5;
  if (iVar8 < 0) uStack68 = -1;
  else uStack68 = (int)(0 < iVar8);
  if (iVar10 < 0) uStack64 = -1;
  else uStack64 = (int)(0 < iVar10);
  iVar8 = iVar2 >> 1;
  pCVar6 = &gCombatP->substruct;
  iVar10 = iVar5 >> 1;
  uVar14 = uVar7;
  uVar12 = uVar9;
  if (iVar2 < iVar5) {
    if (0 < iVar5) {
      iStack_38 = 0x10000;
      iStack_30 = (uVar7 + uStack68);
      uVar15 = uVar7;
      uVar13 = uVar9;
      iStack_34 = (uVar9 + uStack64);
      do {
        iVar10 += iVar2;
        uVar14 = uVar15;
        if (iVar5 <= iVar10) {
          iVar10 -= iVar5;
          uVar14 = iStack_30 >> 0x10;
          iStack_30+= uStack68;
        }
        uVar12 = iStack_34;
        bVar18 = iStack_34;
        uVar11 = (u8)uVar14;
        bVar4 = FUN_8007102c(pCVar6,(u8)uVar15,(u8)uVar13,uVar11,bVar18);
        if ((!bVar4) || (lVar1 = FUN_80070fa0(pCVar6,uVar11,bVar18,param_5), lVar1 == 0)) {
          FUN_8007102c(pCVar6,(u8)uVar15,(u8)uVar13,uVar11,bVar18);
          FUN_80070fa0(pCVar6,uVar11,bVar18,param_5);
          *param_3 = uVar11;
          *param_4 = bVar18;
          return uVar13 != uVar9;
        }
        iVar8 = iStack_38 >> 0x10;
        uVar15 = uVar14;
        uVar13 = uVar12;
        iStack_38 = iStack_38 + 0x10000;
        iStack_34 = iStack_34 + uStack64 * 0x10000;
      } while (iVar8 < iVar5);
    }
  }
  else if (0 < iVar2) {
    iVar17 = (uVar7 + uStack68) * 0x10000;
    iVar16 = (uVar9 + uStack64) * 0x10000;
    uVar15 = uVar7;
    uVar13 = uVar9;
    iVar10 = 0x10000;
    do {
      iVar8 += iVar5;
      uVar12 = uVar13;
      if (iVar2 <= iVar8) {
        iVar8 -= iVar2;
        uVar12 = iVar16 >> 0x10;
        iVar16 += uStack64 * 0x10000;
      }
      uVar14 = iVar17 >> 0x10;
      uVar11 = (u8)((uint)iVar17 >> 0x10);
      iVar17 += uStack68 * 0x10000;
      bVar18 = (byte)uVar12;
      bVar4 = FUN_8007102c(pCVar6,(u8)uVar15,(u8)uVar13,uVar11,bVar18);
      if ((!bVar4) || (lVar1 = FUN_80070fa0(pCVar6,uVar11,bVar18,param_5), lVar1 == 0)) {
        *param_3 = uVar11;
        *param_4 = bVar18;
        return uVar15 != uVar7;
      }
      iVar3 = iVar10 >> 0x10;
      uVar15 = uVar14;
      uVar13 = uVar12;
      iVar10 = iVar10 + 0x10000;
    } while (iVar3 < iVar2);
  }
  *param_3 = (byte)uVar14;
  *param_4 = (byte)uVar12;
  return *param_3 != uVar7 && (uVar12 & 0xff) != uVar9;
}

void FUN_800631c8(CombatAIInfo* param_1){
  s8 sVar3 = FUN_800720f8(&gCombatP->substruct,param_1->combatEnt->GetCoordXU8(),param_1->combatEnt->GetCoordYU8(),
                  gCombatP->unk5320[param_1->unk12][1],gCombatP->unk5320[param_1->unk12][1]);
  param_1->combatEnt->SetCardinalFacing(sVar3);
  param_1->combatEnt->facingInd = sVar3;
}

void ofunc_NOOP(void){}

bool FUN_80063258(CombatAIInfo *param_1) {
  playerData *ppVar1;
  bool bVar2;
  bool bVar3;
  double dVar4;
  CombatStruct *iVar4;
  u8 uVar9;
  u8 uVar10;
  u16 uVar7;
  u32 uVar6;
  byte bVar11;
  int iVar12;
  CombatSubstructA *pCVar13;
  float x;
  float y;
  byte bStack336 [4];
  vec2f afStack328;
  vec2f afStack264;
  vec2f afStack200;
  vec2f fStack136;
  
  ppVar1 = gGlobals.playerDataArray[param_1->combatEnt->index];
  bVar2 = false;
  if (ppVar1 != NULL) {
    bVar3 = false;
    bStack336[0] = 0;
    bStack336[1] = 0;
    bStack336[2] = 0;
    bStack336[3] = 0;
    pCVar13 = &gCombatP->substruct;
    param_1->combatEnt->GetCoordU8(bStack336,bStack336 + 1);
    FUN_800714d0(pCVar13,bStack336[0],bStack336[1],param_1->combatEnt->unk23);
    dVar4 = 0.5;
    bVar11 = param_1->unk12;
    if (param_1->unk12 < param_1->unk13) {
      do {
        iVar12 = (int)((uint)bVar11 << 0x18) >> 0x17;
        bStack336[2] = gCombatP->unk5320[0][iVar12];
        bStack336[3] = gCombatP->unk5320[0][iVar12 + 1];
        if (!FUN_80070fa0(pCVar13,bStack336[2],bStack336[3],param_1->combatEnt->unk23)) {
          bVar2 = true;
          if (!FUN_80062e14(bStack336[0],bStack336[1],bStack336 + 2,bStack336 + 3,
                               param_1->combatEnt->unk23)) break;
        }
        if (!FUN_8007102c(pCVar13,bStack336[0],bStack336[1],bStack336[2],bStack336[3])) {
          bVar2 = true;
          if (!FUN_80062e14(bStack336[0],bStack336[1],bStack336 + 2,bStack336 + 3,
                               param_1->combatEnt->unk23)) break;
        }
        uVar7 = sub_square_add_sqrt(param_1->combatEnt->GetCoord2XU8(),param_1->combatEnt->GetCoord2YU8(),bStack336[2],bStack336[3]);
        if ((ushort)param_1->combatEnt->moveRange < (uVar7 & 0xff)) {
          Vec2Set(&afStack328,(float)bStack336[0],(float)bStack336[1]);
          Vec2Set(&afStack264,(float)bStack336[2],(float)bStack336[3]);
          bVar2 = true;
          Vec2Set(&afStack200,param_1->combatEnt->GetCoord2X(),param_1->combatEnt->GetCoord2Y());
          if (!FUN_80062c04(&afStack200,(float)param_1->combatEnt->moveRange,&afStack328,
                               &afStack264,&fStack136)) break;
          if (0.0 < fStack136.x) {
            bStack336[2] = (byte)(int)((double)fStack136.x + dVar4);
          }
          else {
            bStack336[2] = -(char)(int)(dVar4 - (double)fStack136.x);
          }
          if (0.0 < fStack136.y) {
            bStack336[3] = (byte)(int)((double)fStack136.y + dVar4);
          }
          else {
            bStack336[3] = -(char)(int)(dVar4 - (double)fStack136.y);
          }
        }
        uVar6 = FUN_800720f8(&gCombatP->substruct,bStack336[0],bStack336[1],bStack336[2],
                             bStack336[3]);
        param_1->combatEnt->SetCardinalFacing((s8)uVar6);
        bVar3 = true;
        param_1->combatEnt->facingInd = (s8)uVar6;
        bStack336[0] = bStack336[2];
        bStack336[1] = bStack336[3];
        SetPlayerMoveToQueue(ppVar1,(float)bStack336[2],(float)bStack336[3],ppVar1->scaleRad,0);
        if ((uVar7 & 0xff) < 3) param_1->combatEnt->UnsetFlag(COMBATENT_FLAG3);        
        else param_1->combatEnt->SetFlag(COMBATENT_FLAG3);
        param_1->unk12++;
        if ((param_1->unk13 <= param_1->unk12) || (bVar2)) break;
      } while( true );
    }
    FUN_800713fc(pCVar13,bStack336[0],bStack336[1],param_1->combatEnt->unk23);
    if (bVar3) {
      param_1->combatEnt->SetCoords((float)bStack336[0],(float)bStack336[1]);
      gGlobals.combatBytes[1] = gGlobals.combatBytes[0];
      gGlobals.combatBytes[0] = 5;
      gCombatP->waitTimer = 240;
      return true;
    }
    FUN_800631c8(param_1);
  }
  return false;
}

void CombatAI::SwapWeapons(CombatAIInfo* param_1){
  CombatEntity *pCVar1;
  CharSheet *pCVar2;
  WeaponInstance *pTVar3;
  
  if (param_1->weapon) {
    pCVar1 = param_1->combatEnt;
    pCVar2 = pCVar1->charSheetP;
    pTVar3 = pCVar2->weapons;
    pCVar2->weapons = param_1->weapon;
    param_1->weapon = pTVar3;
    pCVar1->ShowWeaponSheild();
    Gsprintf(ComString(XWeaponSwap),pCVar2->name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    FUN_80029ba8();
    pTVar3 = pCVar2->weapons;
    if ((isBreathSpitOrSpikes(pTVar3)) && (pTVar3->range != 0)) {param_1->combatEnt->AtkType = 4;}
  }
}

u8 CombatAI::ShouldSwapWeapons(CombatAIInfo* param_1){
  CharSheet *pCVar1;
  WeaponInstance *pTVar2;
  u8 bVar3;
  char cVar4;
  u8 bVar5;
  
  pCVar1 = param_1->combatEnt->charSheetP;
  pTVar2 = pCVar1->weapons;
  param_1->unk1 = param_1->unk7;
  pCVar1->spellSwitch = 0;
  bVar5 = false;
  if ((param_1->unk1 == 0) &&
     (param_1->combatEnt->AtkType = 1, pTVar2)) {
      if((!isBreathSpitOrSpikes(pTVar2))&&(param_1->weapon)&&(isBreathSpitOrSpikes(param_1->weapon))){
        SwapWeapons(param_1);
        bVar5 = true;
      }
  }
  cVar4 = param_1->unk1;
  if ((((cVar4 == 1) && (param_1->combatEnt->AtkType = 2, pTVar2)) &&
      (pTVar2->range == 0)) &&
     ((param_1->weapon != NULL && (param_1->weapon->range != 0)))) {
    SwapWeapons(param_1);
    bVar5 = true;
  }
  FUN_80072454(gCombatP->substruct2,param_1->combatEnt);
  FUN_80072454(gCombatP->substruct2 + 1,param_1->combatEnt);
  return bVar5;
}

void combat_ai_shadow(CombatAIInfo*param_1) {
  CombatEntity *pCVar1;
  int iVar5;
  uint i;
  vec2f afStack304,afStack240,shadVec,fStack112;
  
  if ((param_1->combatEnt->moveRange != 1) && (gGlobals.ShadowIndex != -1)) {
    pCVar1 = (&gCombatP->combatEnts)[(byte)gGlobals.ShadowIndex];
    Vec2Set(&shadVec,pCVar1->GetCoordX(),pCVar1->GetCoordY());
    Vec2Set(&afStack304,gCombatP->unk5320[param_1->unk12][0],gCombatP->unk5320[param_1->unk12][1]);
    for(u32 i=param_1->unk12 + 1;i<param_1->unk13;i++){
        Vec2Set(&afStack240,gCombatP->unk5320[i][0],gCombatP->unk5320[i][1]);
        if (FUN_80062c04(&shadVec,10.0,&afStack304,&afStack240,&fStack112)) {
          param_1->unk13 = (char)i + 1;
          if (0.0 < fStack112.x) {
            gCombatP->unk5320[i][0] = (u8)(int)((double)fStack112.x + 0.5);
          }
          else {
            gCombatP->unk5320[i][0] = -(char)(int)(0.5 - (double)fStack112.x);
          }
          if (fStack112.y <= 0.0) {
            gCombatP->unk5320[i][1]= -(char)(int)(0.5 - (double)fStack112.y);
            return;
          }
          gCombatP->unk5320[i][1] = (char)(int)((double)fStack112.y + 0.5);
          return;
      }
      Vec2Copy(&afStack240,&afStack304);
    }
  }
}

u8 FUN_80063bbc(CombatAIInfo *param_1){
  playerData *ppVar1;
  voxelObject *prVar2;
  u8 bVar3;

  float afStack_20;
  
  afStack_20 = 0.0;
  ppVar1 = gGlobals.playerDataArray[param_1->combatEnt->index];
  if ((ppVar1 == NULL) ||
     (prVar2 = CombatAI::FindFleeingRefpoint(param_1,&afStack_20), prVar2 == NULL)) {
    bVar3 = false;
  }
  else {
    bVar3 = false;
    if (afStack_20 <= 2.25f) {
      FUN_80063db0(param_1,param_1->combatEnt->GetCoordX(),param_1->combatEnt->GetCoordY(),(prVar2->header).pos.x,(prVar2->header).pos.z,1.0f,ppVar1);
      bVar3 = true;
    }
  }
  return bVar3;
}

bool FUN_80063af4(CombatAIInfo *param_1,u8 param_2,u8 param_3) {
  param_1->unk13 = FUN_80071ec4(&gCombatP->substruct,param_1->combatEnt->GetCoordXU8(),param_1->combatEnt->GetCoordYU8(),
                    param_2,param_3,param_1->combatEnt->unk23,gCombatP->unk5320);
  u8 uVar1 = get_byte_E(&gCombatP->substruct);
  bool bVar5 = false;
  if (param_1->unk13 < uVar1) {
    param_1->unk12 = 0;
    combat_ai_shadow(param_1);
    bVar5 = true;
  }
  return bVar5;
}

u8 FUN_80063c94(CombatAIInfo *param_1){
  CombatEntity *pCVar1;
  playerData *ppVar2;
  playerData *ppVar3;
  float fVar4;
  float fVar5;
  
  if ((param_1->entIndex != -1) &&
     (pCVar1 = (&gCombatP->combatEnts)[param_1->entIndex], pCVar1 != NULL)) {
    ppVar2 = gGlobals.playerDataArray[param_1->combatEnt->index];
    if (!ppVar2) return false;
    ppVar3 = gGlobals.playerDataArray[pCVar1->index];
    if (!ppVar3) return false;
    fVar4 = pCVar1->Get2DProximity(param_1->combatEnt);
    fVar5 = ppVar2->scaleRad + ppVar3->scaleRad;
    if (fVar4 <= fVar5 + 2.25f) {
      if (fVar4 == 0.0) {
        FUN_80064714(param_1);
        return true;
      }
      FUN_80063db0(param_1,(ppVar2->collision).pos.x,(ppVar2->collision).pos.z,
                   (ppVar3->collision).pos.x,(ppVar3->collision).pos.z,(fVar4 - fVar5) / fVar4,
                   ppVar2);
      return true;
    }
  }
  return false;
}

void FUN_80063db0(CombatAIInfo *ai,float x0,float y0,float x1,float y1,float scale,playerData *pDat){
  vec2f vecRes,vecA,vecB;

  Vec2Set(&vecA,x0,y0);
  Vec2Set(&vecB,x1,y1);
  Vec2Sub(&vecRes,&vecB,&vecA);
  Vec2Scale(&vecRes,scale);
  Vec2Sum(&vecRes,&vecRes,&vecA);
  SetPlayerMoveToQueue(pDat,vecRes.x,vecRes.y,pDat->scaleRad,0);
  FUN_800714d0(&gCombatP->substruct,ai->combatEnt->GetCoordXU8(),ai->combatEnt->GetCoordXU8(),ai->combatEnt->unk23);
  ai->combatEnt->SetCoords(vecRes.x,vecRes.y);
  FUN_800713fc(&gCombatP->substruct,ai->combatEnt->GetCoordXU8(),ai->combatEnt->GetCoordXU8(),ai->combatEnt->unk23);
  gGlobals.combatBytes[1] = gGlobals.combatBytes[0];
  gGlobals.combatBytes[0] = 5;
  gCombatP->waitTimer = 240;
}

u8 FUN_80063f1c(CombatAIInfo *param_1,u8 param_2,u8 param_3){
  u8 bVar1 = FUN_80063af4(param_1,param_2,param_3);
  u8 bVar2 = false;
  if (!bVar1) {
    if (!CombatAI::IsAlly(param_1)) {
      bVar1 = FUN_80063c94(param_1);
      bVar2 = true;
      if (!bVar1) {
        FUN_80064714(param_1);
        bVar2 = true;
      }
    }
    else {
      bVar1 = FUN_80063bbc(param_1);
      bVar2 = true;
      if (!bVar1) {
        FUN_800645b4(param_1);
        bVar2 = true;
      }
    }
  }
  return bVar2;
}

voxelObject * CombatAI::FindFleeingRefpoint(CombatAIInfo *param_1,float *dist){
  vec2f entPos,closest;
  char buff [16];
  vec2f vObjPos;
  
  voxelObject *ret = NULL;
  *dist = 100000.0f;
  Vec2Set(&entPos,param_1->combatEnt->GetCoordX(),param_1->combatEnt->GetCoordY());
  for(u32 i=0;i<8;i++) {
    sprintf(buff,ComString(FleeX),i);
    voxelObject *vObj = FindReferncePointName(gGlobals.gameVars.borg9DatPointer,buff,false);
    if (vObj) {
      Vec2Set(&vObjPos,(vObj->header).pos.x,(vObj->header).pos.z);
      float prox = Vec2Dist(&vObjPos,&entPos);
      if (prox <= *dist) {
        Vec2Copy(&vObjPos,&closest);
        *dist = prox;
        ret = vObj;
      }
    }
  }
  return ret;
}

u8 CombatAI::GetFleePointCoords(CombatAIInfo *param_1,u8 x,u8 y,s8 *outX,s8 *outY,float *param_6){
  voxelObject *vox = FindFleeingRefpoint(param_1,param_6);
  if (vox == NULL) return false;
  else {
      *outX = (vox->header).pos.x;
      *outY = (vox->header).pos.z;
    return true;
  }
}

u8 FUN_800641b8(CombatAIInfo *param_1,u8* param_2,u8* param_3){
  u8 uVar4;
  float afStack_20 [8];

  afStack_20[0] = 0.0;
  if (CombatAI::GetFleePointCoords(param_1,param_1->combatEnt->GetCoordXU8(),param_1->combatEnt->GetCoordYU8(),param_2,param_3,afStack_20)) {
    Gsprintf(ComString(XFlees),param_1->combatEnt->charSheetP->name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    uVar4 = afStack_20[0] < 1.5f;
    if (uVar4) {
      param_1->combatEnt->Escaped();
      FUN_80029ba8();
    }
  }
  else {
    param_1->flags &= ~AIFlag_02;
    uVar4 = FUN_800642c4(param_1,param_2,param_3);
  }
  return uVar4;
}

u8 FUN_800642c4(CombatAIInfo *param_1,u8 *xOut,u8 *yOut){
  u8 x = param_1->combatEnt->GetCoordXU8();
  u8 y = param_1->combatEnt->GetCoordYU8();
  combatAI_run_cmd(param_1,xOut,yOut);
  if ((x == *xOut) && (y == *yOut)) {
    FUN_80064714(param_1);
    return true;
  }
  return false;
}

u8 FUN_80064358(CombatAIInfo* param_1){
  u8 bVar1;
  
  FUN_800628cc(param_1);
  bVar1 = FUN_80064a78(param_1);
  if (!bVar1) FUN_80029ba8();
  return !bVar1;
}

u8 FUN_80064398(CombatAIInfo *param_1){
  CombatEntity *target;
  u8 bVar1;
  u8 bVar2;
  
  NOOP_8005ff90();
  gCombatP->some_index = param_1->entIndex;
  target = (&gCombatP->combatEnts)[param_1->entIndex];
  if (param_1->unk1 == 2) {
    bVar1 = param_1->combatEnt->AIShouldCastMagic(target);
    bVar2 = true;
    if (!bVar1) {
      bVar1 = param_1->combatEnt->CanBeTargeted(target,0);
      bVar2 = false;
      if (bVar1) bVar2 = true;
    }
  }
  else {
    if (param_1->combatEnt->CanBeTargeted(target,false)) bVar2 = true;
    else {
      bVar1 = param_1->combatEnt->AIShouldCastMagic(target);
      bVar2 = true;
      if (!bVar1) bVar2 = false;
    }
  }
  return bVar2;
}

void CombatAI::FaceTarget(CombatAIInfo*param_1){
  param_1->combatEnt->FaceTarget((&gCombatP->combatEnts)[param_1->entIndex]);
}

void FUN_80064494(CombatAIInfo *param_1){
  byte bVar1;
  u8 bVar2;
  float x;
  float y;
  u8 uStack24 [2];
  
  param_1->combatEnt->UpdatePosition();
  param_1->combatEnt->Coord2IsCoord();
  uStack24[0] = 0;
  uStack24[1] = 0;
  if (!CombatAI::IsAlly(param_1)) bVar2 = FUN_800642c4(param_1,uStack24,uStack24 + 1);
  else {
    Vec2Set(&gCombatP->entity_XY,param_1->combatEnt->GetCoordX(),param_1->combatEnt->GetCoordY());
    bVar2 = FUN_800641b8(param_1,uStack24,uStack24 + 1);
  }
  if (((bVar2 == false) && (!FUN_80063f1c(param_1,uStack24[0],uStack24[1]))) &&
     (!FUN_80063258(param_1))) {
    if (!CombatAI::IsAlly(param_1)) {
      if (FUN_80063c94(param_1)) return;
    }
    else {
      if (FUN_80063bbc(param_1)) return;
      FUN_800645b4(param_1);
    }
    FUN_80064714(param_1);
  }
}

void FUN_800645b4(CombatAIInfo*param_1){
  u8 bVar1;
  u8 uStack104 [2];
  vec2f afStack96;
  float afStack_20;
  
  param_1->combatEnt->UpdatePosition();
  if (!CombatAI::IsAlly(param_1)) FUN_80064714(param_1);
  else {
    bVar1 = false;
    if (--param_1->unk18 == 0) {
      bVar1 = true;
      param_1->combatEnt->Escaped();
    }
    else {
      afStack_20 = 0.0;
      uStack104[0] = 0;
      uStack104[1] = 0;
      if ((CombatAI::GetFleePointCoords(param_1,param_1->combatEnt->GetCoordXU8(),param_1->combatEnt->GetCoordYU8(),uStack104,uStack104 + 1,&afStack_20)) && (afStack_20 <= 1.5f)) {
        bVar1 = true;
        param_1->combatEnt->Escaped();
      }
    }
    if (!bVar1) {
      Vec2Set(&afStack96,param_1->combatEnt->GetCoordX(),param_1->combatEnt->GetCoordY());
      if (Vec2Dist(&afStack96,&gCombatP->entity_XY) < 1.0f) {
        param_1->combatEnt->Escaped();
      }
    }
    FUN_80029ba8();
  }
}

void FUN_80064714(CombatAIInfo* param_1){
  if (((param_1->unk7 == param_1->unk1) ||
      (!CombatAI::ShouldSwapWeapons(param_1))) &&(!FUN_80064358(param_1))) {
    if (FUN_80064398(param_1)) CombatAI::FaceTarget(param_1);
    else FUN_80029ba8();
  }
}

u8 CombatAI::ElementalInCombat(void){
    for(u32 i=0;i<gCombatP->EntCount;i++){
    if (((gCombatP->substruct2[1].arrayA[i]) && (&gCombatP->combatEnts[i]!=NULL)) &&
         (Entity::IsElemental((&gCombatP->combatEnts)[i]->charSheetP->ID))) {
        return true;
      }
  }
  return false;
}

u8 CombatAI::ZombieInCombat(void *param_1){
  ItemID IVar1;
  
  for(u32 i=0;i<gCombatP->EntCount;i++){
    if (((gCombatP->substruct2[1].arrayA[i]) && (&gCombatP->combatEnts[i]!=NULL)) &&
         ((IVar1 = gCombatP->combatEnts[i].charSheetP->ID, IVar1 == IDEntInd(Zombie) ||
          (IVar1 == IDEntInd(PlagueZombie))))) {
        return true;
      }
  }
  return false;
}

u8 CombatAI::IsSomeonePoisoned(void){
  Temp_enchant **ppTVar1;
  uint uVar2;
  CombatSubstructB *pcVar3;
  CombatEntity **ppCVar4;
  uint uVar5;
  
  uVar5 = 0;
  pcVar3 = gCombatP->substruct2 + 1;
  if (gCombatP->EntCount != 0) {
    ppCVar4 = &gCombatP->combatEnts;
    do {
      if ((pcVar3->arrayA[0]) && (*ppCVar4)) {
        uVar2 = 0;
        ppTVar1 = (*ppCVar4)->charSheetP->effects;
        do {
          uVar2 += 1;
          if ((*ppTVar1) && ((*ppTVar1)->index == SPELLIND_poison)) {
            return true;
          }
          ppTVar1 = ppTVar1 + 1;
        } while (uVar2 < 0xf);
      }
      ppCVar4++;
      uVar5++;
      pcVar3 = (CombatSubstructB *)(pcVar3->arrayA + 1);
    } while (uVar5 < gCombatP->EntCount);
  }
  return false;
}

u8 FUN_80064948(CombatAIInfo *param_1){
  if (param_1->entIndex != -1) {
    if (gCombatP->substruct2->arrayA[param_1->entIndex]) {
      clear_substruct2_arrayB(gCombatP->substruct2);
      FUN_8007231c(gCombatP->substruct2,param_1->entIndex);
    }
  }
  else {
  if (!gCombatP->substruct2[0].spellTargetMax) return false;
  if (!gCombatP->substruct2[0].arrayBCount) return false;
  param_1->entIndex = gCombatP->substruct2[0].entindex;
  }
  clear_combat_substruc2(gCombatP->substruct2 + 1);
  return true;
}

u8 FUN_800649f8(CombatAIInfo *param_1){
  s8 cVar1 = param_1->entIndex;
  if (((cVar1 == -1) || (!gCombatP->substruct2[1].arrayA[cVar1])) ||
     (!gCombatP->substruct2[1].arrayB[cVar1])) {
    if (!gCombatP->substruct2[1].spellTargetMax) return false;
    if (!gCombatP->substruct2[1].arrayBCount) return false;
    param_1->entIndex = gCombatP->substruct2[1].entindex;
  }
  clear_combat_substruc2(gCombatP->substruct2);
  return true;
}

u8 FUN_80064a78(CombatAIInfo *param_1){
  u8 bVar1;
  u8 uVar2;
  
  param_1->combatEnt->UpdatePosition();
  FUN_80072454(gCombatP->substruct2,param_1->combatEnt);
  FUN_80072454(gCombatP->substruct2 + 1,param_1->combatEnt);
  if (param_1->unk1 == 2) {
    bVar1 = FUN_800649f8(param_1);
    uVar2 = true;
    if (!bVar1) uVar2 = FUN_80064948(param_1);
  }
  else {
    if (FUN_80064948(param_1)) uVar2 = true;
    else uVar2 = FUN_800649f8(param_1);
  }
  return uVar2;
}

void CombatAI::ClearEntIndex(CombatAIInfo *param_1){
  param_1->entIndex = -1;
  param_1->unk12 = 0xff;
  param_1->unk13 = 0;
}

u8 CombatAI::IsAlly(CombatAIInfo *param_1){  
  if (param_1->combatEnt->Flag4()) return param_1->flags & AIFlag_01;
  return 0;
}

void CombatAI::LookToFlee(CombatAIInfo *param_1){
  if ((!param_1->combatEnt->Flag7()) && (gCombatP->hasFleeRefpoints)) {
    param_1->unk18 = 4;
    param_1->flags |= AIFlag_01;
  }
}