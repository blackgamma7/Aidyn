#include "CombatEntity.h"
#include "stringN64.h"

void NOOP_8005ff90(void){}

u8 Combat::WillTheyFlee(ItemID param_1){
  byte bVar1;
  byte bVar3;
  bool bVar4;
  char cVar5;
  int score;
  uint uVar2;
  AspectEnum AVar6;
  s32 lVar7;
  
  if (gCombatP->hasFleeRefpoints == 0) return false;
  bVar3 = GetIDIndex(param_1);
  bVar1 = gEntityDB->entities[(char)bVar3].morale;
  lVar7 = bVar1;
  if (0xb < lVar7) return false;
  AVar6 = ASPECT_SOLAR;
  if (gCombatP->EnemiesAlive <= gCombatP->enemyCount >> 1) return false;
  if (gEntityDB->entities[bVar3].aspect != ASPECT_SOLAR) {
    AVar6 = ASPECT_LUNAR;
  }
  if (NotAspectBonus(AVar6)) lVar7 = bVar1-1;
  if (gCombatP->EnemiesAlive < gCombatP->enemyCount >> 1) lVar7--;
  if ((gCombatP->leaderDead) || (!CombatEntity::Flag1((&gCombatP->combatEnts)[gCombatP->leaderIndex]))) lVar7--;
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
  else score = 0xb;
  return score < RollD(2,6);
}

byte CombatEntity::JudgeAIMorale(CombatEntity *param_1,bool param_2){
  Temp_enchant *pTVar1;
  bool bVar3;
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
  pTVar4->flags &=~2;
  bVar5 = param_1->aiP->morale;
  lVar7 = bVar5;
  if (getNotAspectBonus(param_1)) lVar7 = bVar5-1;
  if ((param_1->aiP->flags & 0x10)) lVar7 -=2;
  if (!CharStats::getModded(param_1->charSheetP->Stats,STAT_STAM)) lVar7--;
  if (gCombatP->EnemiesAlive < gCombatP->enemyCount >> 1) lVar7--;
  uVar6 = 0;
  pTVar1 = *param_1->charSheetP->effects;
  while ((pTVar1 == NULL || (pTVar1->varB == 0))) {
    uVar6++;
    if (0xe < uVar6) goto LAB_8006024c;
    pTVar1 = param_1->charSheetP->effects[uVar6];
  }
  lVar7--;
LAB_8006024c:
  if (gCombatP->playersAlive < gCombatP->playerCount >> 1) lVar7+=2;
  if (!SpellEffectsPartyInArea(param_1)){
    if ((param_1->aiP->entIndex != -1) && ((&gCombatP->combatEnts)[param_1->aiP->entIndex])){
      if (!CharStats::getModded((&gCombatP->combatEnts)[param_1->aiP->entIndex]->charSheetP->Stats,STAT_STAM)) {
        lVar7+=3;
      }
    }
  }
  if ((param_1->aiP->flags & 4))lVar7-=2;
  if (param_2) {
    if ((gCombatP->leaderDead) || (!Flag1(leader))) lVar7-=4;
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

u8 CombatEntity::AiIsTiredOrLonely(CombatEntity *param_1){
  u8 ret = true;
  if (!(param_1->aiP->flags & 2)) {
    if (CharStats::getModded(param_1->charSheetP->Stats,STAT_STAM) < 1) ret = true;
    else if (!(param_1->aiP->flags & 1)) ret = gCombatP->EnemiesAlive <= gCombatP->enemyCount >> 1;
    else ret = false;
  }
  return ret;
}



void CombatAIInfo::DebateFleeing(CombatEntity *param_1,bool param_2){
  if (((param_2) && (param_1->aiP->morale < 0xc)) && (CombatEntity::AiIsTiredOrLonely(param_1))) {
    if (!gCombatP->leaderDead) CombatEntity::JudgeAIMorale((&gCombatP->combatEnts)[gCombatP->leaderIndex],false);
    if (CombatEntity::JudgeAIMorale(param_1,true) < RollD(2,6)) LookToFlee(param_1->aiP);
    else param_1->aiP->flags&=~2;
  }
}


bool CombatAIInfo::IsNotDeadNorAlly(CombatAIInfo *param_1,CombatEntity *param_2){
  bool ret;
  
  if (!param_2) return false;
  else {
    ret = false;
    if (!Entity::isDead(param_2->charSheetP)) {
      if (CombatEntity::Flag1(param_2)) ret = CombatEntity::Flag4(param_2) != CombatEntity::Flag4(param_1->combatEnt);
      else ret = false;
    }
  }
  return ret;
}

u8 CombatAIInfo::CanMoveToTarget(CombatAIInfo *param_1){  
  if (combat_AiScore_tally) {
    for(u32 i=0;i<combat_AiScore_tally;i++) {
      CombatEntity *pCVar1 = combat_AiScores_pointer[i].combatEnt;
      CombatEntity::SetMovementRange(pCVar1);
      if (CombatEntity::Get2DProximity(param_1->combatEnt,pCVar1) <= pCVar1->moveRange) return true;
    }
  }
  return false;
}


byte CombatAIInfo::GetSpellPriority(CombatAIInfo *param_1,u8 param_2)

{
  CombatEntity *pCVar1;
  CharSheet *pCVar2;
  CombatStruct *pCVar3;
  bool bVar4;
  bool bVar5;
  bool bVar6;
  byte val;
  char cVar8;
  int iVar7;
  uint uVar9;
  uint uVar10;
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
    bVar4 = IsSomeonePoisoned();
    if (!bVar4) {
      return 0;
    }
  case SPELLIND_photosynthesis:
    val = 0x53;
    break;
  case SPELLIND_AirSheild:
  case SPELLIND_spiritSheild:
  case SPELLIND_starlightSheild:
    val = 0x3d;
    break;
  case SPELLIND_ControlElem:
    bVar4 = ElementalInCombat();
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
    if (!ElementalInCombat()) return 0;
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
    bVar4 = ZombieInCombat(param_1);
LAB_8006078c:
    val = 0;
    if (bVar4 != false) {
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
    uVar10 = 0;
    cVar11 = cVar8;
    if (gCombatP->EntCount != 0) {
      do {
        pCVar1 = (&gCombatP->combatEnts)[uVar10];
        cVar8 = cVar11;
        if (pCVar1 != NULL) {
          bVar4 = getNotAspectBonus(pCVar1);
          bVar5 = CombatEntity::Flag4(pCVar1);
          bVar6 = CombatEntity::Flag4(param_1->combatEnt);
          cVar8 = cVar11 + -1;
          if (bVar4 == (bVar5 == bVar6)) {
            cVar8 = cVar11 + '\x01';
          }
        }
        uVar10 = uVar10 + 1 & 0xff;
        cVar11 = cVar8;
      } while (uVar10 < gCombatP->EntCount);
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
    uVar10 = 0;
    if (gCombatP->EntCount != 0) {
      iVar7 = 0;
      do {
        pCVar1 = *(CombatEntity **)((int)&gCombatP->combatEnts + iVar7);
        pCVar2 = pCVar1->charSheetP;
        if (*(int *)((int)pCVar3->substruct2[1].arrayA + iVar7) != 0) {
          bVar4 = CombatEntity::Flag4(pCVar1);
          bVar5 = CombatEntity::Flag4(param_1->combatEnt);
          uVar9 = 0;
          iVar7 = 0;
          do {
            iVar8 = *(Temp_enchant **)(iVar7 + (int)pCVar2->effects);
            cVar11 = cVar8;
            if ((((iVar8 != NULL) && (iVar8->school == MVar12)) && (iVar8->timer != 0xffffffff)) &&
               (cVar11 = cVar8 + -1, iVar8->varB == (uint)(bVar4 == bVar5))) {
              cVar11 = cVar8 + '\x01';
            }
            cVar8 = cVar11;
            uVar9 = uVar9 + 1 & 0xff;
            iVar7 = uVar9 << 2;
          } while (uVar9 < 0xf);
        }
        uVar10 = uVar10 + 1 & 0xff;
        iVar7 = uVar10 << 2;
      } while (uVar10 < gCombatP->EntCount);
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

void FUN_800609bc(CombatAIInfo *param_1){
  CombatAIScore::Reset(gCombatP->EntCount);
  if (gCombatP->EntCount != 0) {
    for(u8 i=0;i<gCombatP->EntCount;i++) {
      CombatEntity *cEnt = (&gCombatP->combatEnts)[i];
      if (CombatAIInfo::IsNotDeadNorAlly(param_1,cEnt))
        CombatAIScore::SetEntry(CombatEntity::GetCoordXU8(cEnt),CombatEntity::GetCoordYU8(cEnt),0,0,cEnt);
    }
  }
}


void FUN_80060a88(CombatAIInfo *param_1){
  byte bVar1;
  u8 uVar2;
  CombatEntity *pCVar3;
  byte feildy;
  CombatStruct *pCVar4;
  u8 X;
  u8 Y;
  u16 uVar6;
  longlong lVar5;
  u8 uVar7;
  u8 uVar8;
  int iVar9;
  ushort uVar10;
  combat_substruct *pcVar11;
  byte feildx;
  int iVar12;
  uint uVar13;
  uint uVar14;
  uint uVar15;
  int iVar16;
  ushort uVar17;
  combat_substruct_2 *X_00;
  uint uVar18;
  float x;
  float y;
  
  bVar1 = param_1->combatEnt->moveRange;
  CombatAIScore::Reset(SQ(bVar1) * 4);
  x = CombatEntity::GetCoordX(param_1->combatEnt);
  y = CombatEntity::GetCoordY(param_1->combatEnt);
  X = CombatEntity::GetCoordXU8(param_1->combatEnt);
  Y = CombatEntity::GetCoordYU8(param_1->combatEnt);
  pCVar4 = gCombatP;
  pcVar11 = &gCombatP->substruct;
  uVar2 = param_1->combatEnt->unk23;
  X_00 = gCombatP->substruct2;
  FUN_800714d0(pcVar11,X,Y,uVar2);
  uVar18 = (uint)bVar1;
  iVar16 = (int)(((int)(char)Y - uVar18) * 0x1000000) >> 0x18;
  iVar9 = (int)(char)Y + uVar18;
  if (iVar16 <= iVar9) {
    do {
      feildy = (byte)iVar16;
      iVar12 = (int)(((int)(char)X - uVar18) * 0x1000000) >> 0x18;
      while (iVar12 <= (int)((int)(char)X + uVar18)) {
        feildx = (byte)iVar12;
        uVar6 = sub_square_add_sqrt(feildx,feildy,X,Y);
        if ((uVar6 <= bVar1) && (lVar5 = FUN_80070fa0(pcVar11,iVar12,iVar16,uVar2), lVar5 != 0)) {
          CombatEntity::SetCoords(param_1->combatEnt,(float)iVar12,(float)iVar16);
          FUN_80072454(X_00,param_1->combatEnt);
          uVar13 = 0;
          if (pCVar4->substruct2[0].arrayBCount != 0) {
            uVar17 = 0xff;
            uVar15 = 0;
            if (gCombatP->EntCount != 0) {
              do {
                pCVar3 = (&gCombatP->combatEnts)[uVar13];
                uVar10 = uVar17;
                uVar14 = uVar15;
                if (X_00->arrayA[uVar13] == 0) {
LAB_80060cb0:
                  uVar17 = uVar10;
                  uVar15 = uVar14;
                }
                else {
                  uVar7 = CombatEntity::GetCoordXU8(pCVar3);
                  uVar8 = CombatEntity::GetCoordYU8(pCVar3);
                  uVar6 = sub_square_add_sqrt(feildx,feildy,uVar7,uVar8);
                  uVar10 = uVar6 & 0xff;
                  uVar14 = uVar13;
                  if (uVar10 < uVar17) goto LAB_80060cb0;
                }
                uVar13 = uVar13 + 1 & 0xff;
              } while (uVar13 < gCombatP->EntCount);
            }
            CombatAIScore::SetEntry(feildx,feildy,0,0,(&gCombatP->combatEnts)[uVar15]);
          }
        }
        iVar12 = (int)(char)(feildx + 1);
      }
      iVar16 = (int)(char)(feildy + 1);
    } while (iVar16 <= iVar9);
  }
  CombatEntity::SetCoords(param_1->combatEnt,x,y);
  FUN_800713fc(pcVar11,X,Y,uVar2);
  clear_combat_substruc2(X_00);
  return;
}




void FUN_80060db0(CombatAIInfo *param_1)

{
  u8 uVar1;
  byte bVar2;
  byte bVar3;
  CombatEntity *cEnt;
  bool bVar4;
  byte feildy;
  CombatStruct *pCVar5;
  uint uVar7;
  u8 X;
  u8 Y;
  u16 uVar8;
  longlong lVar6;
  byte bVar10;
  byte bVar11;
  bool feild0;
  u16 uVar9;
  combat_substruct_2 *X_00;
  int iVar12;
  combat_substruct *pcVar13;
  byte feildx;
  uint uVar14;
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
  uVar7 = (uint)bVar10;
  CombatAIScore::Reset(SQ(bVar10) * 4);
  bVar10 = 0;
  x = CombatEntity::GetCoordX(param_1->combatEnt);
  y = CombatEntity::GetCoordY(param_1->combatEnt);
  X = CombatEntity::GetCoordXU8(param_1->combatEnt);
  Y = CombatEntity::GetCoordYU8(param_1->combatEnt);
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
          CombatEntity::SetCoords(param_1->combatEnt,(float)iVar16,(float)iVar17);
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
                    bVar10 = CombatEntity::GetCoordXU8(cEnt);
                    bVar11 = CombatEntity::GetCoordYU8(cEnt);
                    bVar2 = pcVar18->x;
                    bVar3 = pcVar18->y;
                    bVar4 = true;
                    break;
                  }
                }
                feild0 = CombatAIInfo::CanMoveToTarget(param_1);
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
              uVar14 = uVar14 + 1 & 0xff;
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
  CombatEntity::SetCoords(param_1->combatEnt,x,y);
  clear_combat_substruc2(X_00);
  return;
}


int fireball_func(CombatAIInfo *param_1){
  CombatEntity *pCVar1;
  combat_substruct_2 *pcVar2;
  bool bVar5;
  bool bVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  float fVar11;
  float fVar12;
  float fVar13;
  
  fVar11 = 0.0;
  uVar8 = 0;
  fVar13 = 0.0;
  fVar12 = 0.0;
  if (gCombatP->EntCount != 0) {
    do {
      pCVar1 = (&gCombatP->combatEnts)[uVar8];
      if (CombatAIInfo::IsNotDeadNorAlly(param_1,pCVar1)) {
        fVar13 += CombatEntity::GetCoordX(pCVar1);
        fVar11 += CombatEntity::GetCoordY(pCVar1);
        fVar12++;
      }
      uVar8 += 1;
    } while (uVar8 < gCombatP->EntCount);
  }
  pCVar1 = param_1->combatEnt;
  pcVar2 = gCombatP->substruct2;
  (gCombatP->SpellMarkerPos).x = fVar13 / fVar12;
  (gCombatP->SpellMarkerPos).y = fVar11 / fVar12;
  FUN_80072454(pcVar2 + 1,pCVar1);
  uVar8 = 0;
  if (gCombatP->substruct2[1].arrayBCount == 0) iVar9 = 0;
  else {
    iVar9 = 0;
    if (gCombatP->EntCount != 0) {
      do {
        if (gCombatP->substruct2[1].arrayA[uVar8]) {
          if (CombatEntity::Flag4(gCombatP->combatEnts[uVar8]) == CombatEntity::Flag4(param_1->combatEnt)) iVar9--;
          else iVar9++;
        }
        uVar8 += 1;
      } while (uVar8 < gCombatP->EntCount);
    }
  }
  return iVar9;
}


s32 some_prioirty_getter(CombatAIInfo *param_1){
  FUN_80072454(gCombatP->substruct2 + 1,param_1->combatEnt);
  return gCombatP->substruct2[1].arrayBCount - 1;
}


uint other_func_checking_fireball(CombatAIInfo *param_1){
  byte bVar1;
  u8 uVar2;
  byte bVar3;
  byte bVar4;
  CharSheet *pCVar5;
  combat_substruct_2 *pcVar6;
  CombatStruct *pCVar7;
  u8 X;
  u8 Y;
  uint uVar9;
  SpellInstance *pSVar10;
  byte bVar14;
  int iVar11;
  s8 sVar15;
  int iVar12;
  u16 uVar13;
  longlong lVar8;
  byte cVar19;
  byte spellPri;
  combat_substruct *pcVar16;
  int iVar17;
  byte feildx;
  int iVar18;
  uint uVar19;
  int iVar20;
  float x;
  float y;
  uint uStack_74;
  uint uStack_60;
  
  bVar1 = param_1->combatEnt->moveRange;
  if (bVar1 == 0) uStack_74 = ai_spell_stam(param_1);
  else {
    x = CombatEntity::GetCoordX(param_1->combatEnt);
    uStack_74 = 0;
    y = CombatEntity::GetCoordY(param_1->combatEnt);
    X = CombatEntity::GetCoordXU8(param_1->combatEnt);
    Y = CombatEntity::GetCoordYU8(param_1->combatEnt);
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
        pCVar5->currSpell = BYTE_ARRAY_800ef6e0[uStack_60];
        pCVar5->spellSwitch = BYTE_ARRAY_800ef6e8[uStack_60];
        pSVar10 = Entity::GetSpell(pCVar5);
        bVar14 = Entity::CheckSpellWizard(pCVar5,pSVar10);
        if (uStack_74 == 0) uStack_74 = CharStats::getModded(pCVar5->Stats,STAT_STAM) < spell_stamina_subtract(pSVar10,bVar14) ^ 1;
        uVar19 = (uint)bVar1;
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
                  CombatEntity::SetCoords(param_1->combatEnt,(float)iVar18,(float)iVar11);
                  if (param_1->spells[uStack_60] == SPELLIND_fireball) cVar19 = fireball_func(param_1);
                  else cVar19 = some_prioirty_getter(param_1);
                  if ((pCVar7->substruct2[1].arrayBCount != 0) &&
                     (spellPri = CombatAIInfo::GetSpellPriority(param_1,param_1->spells[uStack_60]),
                     spellPri != 0)) {
                    CombatAIScore::SetEntry(feildx,bVar14,(byte)uVar9,spellPri + cVar19 * 10 + pSVar10->level,
                               (&gCombatP->combatEnts)[(byte)pCVar7->substruct2[1].entindex]);
                  }
                }
                iVar18 += 1;
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
    CombatEntity::SetCoords(param_1->combatEnt,x,y);
    clear_combat_substruc2(pcVar6 + 1);
  }
  return uStack_74;
}

u8 ai_spell_stam(CombatAIInfo *param_1){
  byte bVar1;
  byte bVar2;
  CharSheet *pCVar3;
  bool bVar4;
  combat_substruct_2 *pcVar5;
  CombatStruct *pCVar6;
  u8 feildx;
  u8 feildy;
  SpellInstance *pSVar7;
  byte bVar9;
  int iVar8;
  s8 sVar10;
  char cVar11;
  SpellEnum SVar12;
  uint uVar13;
  SpellEnum *pSVar14;
  SpellEnum *pSVar15;
  
  pCVar6 = gCombatP;
  bVar4 = false;
  pCVar3 = param_1->combatEnt->charSheetP;
  pcVar5 = gCombatP->substruct2;
  bVar1 = pCVar3->currSpell;
  bVar2 = pCVar3->spellSwitch;
  feildx = CombatEntity::GetCoordXU8(param_1->combatEnt);
  uVar13 = 0;
  feildy = CombatEntity::GetCoordYU8(param_1->combatEnt);
  CombatAIScore::Reset(8);
  pSVar15 = param_1->spells;
  pSVar14 = pSVar15;
  do {
    if (*pSVar14 != SPELLIND_NONE) {
      pCVar3->currSpell = D_800ef6e0[uVar13];
      pCVar3->spellSwitch = D_800ef6e8[uVar13];
      pSVar7 = Entity::GetSpell(pCVar3);
      bVar9 = Entity::CheckSpellWizard(pCVar3,pSVar7);
      if (bVar4 == false) {
        iVar8 = CharStats::getModded(pCVar3->Stats,STAT_STAM);
        sVar10 = spell_stamina_subtract(pSVar7,bVar9);
        bVar4 = (longlong)sVar10 <= (longlong)iVar8;
        SVar12 = *pSVar14;
      }
      else SVar12 = *pSVar14;
      if (SVar12 == SPELLIND_fireball) cVar11 = fireball_func(param_1);
      else cVar11 = some_prioirty_getter(param_1);
      if (pCVar6->substruct2[1].arrayBCount != 0) {
        bVar9 = CombatAIInfo::GetSpellPriority(param_1,pSVar15[uVar13]);
        if (bVar9 != 0) {
          CombatAIScore::SetEntry
                    (feildx,feildy,(char)uVar13 + 1,bVar9 + cVar11 * 10 + pSVar7->level,
                     (&gCombatP->combatEnts)[(byte)pCVar6->substruct2[1].entindex]);
        }
      }
    }
    uVar13 += 1;
    pSVar14 = pSVar15 + uVar13;
  } while (uVar13 < 8);
  pCVar3->currSpell = bVar1;
  pCVar3->spellSwitch = bVar2;
  clear_combat_substruc2(pcVar5 + 1);
  return bVar4;
}


void FUN_8006193c(CombatAIInfo *param_1){
  u8 uVar1;
  CombatEntity *pCVar2;
  byte bVar3;
  ushort uVar4;
  ushort uVar5;
  combat_aiscore *pcVar6;
  uint uVar7;
  uint uVar9;
  u8 Y;
  int iVar10;
  u16 uVar11;
  longlong lVar8;
  u8 uVar13;
  u8 uVar14;
  ushort uVar12;
  int iVar15;
  combat_substruct *pcVar16;
  combat_substruct_2 *pcVar17;
  uint uVar18;
  uint uVar19;
  uint uVar20;
  byte uStack80;
  byte bStack_4d;
  uint uStack_4c;
  byte uStack76;
  u8 X;
  
  uStack_4c = 0;
  uStack76 = 0;
  _uStack80 = 0;
  bStack_4d = 0;
  uVar5 = 0;
  uVar9 = (uint)param_1->combatEnt->moveRange;
  X = CombatEntity::GetCoordXU8(param_1->combatEnt);
  Y = CombatEntity::GetCoordYU8(param_1->combatEnt);
  pcVar16 = &gCombatP->substruct;
  uVar1 = param_1->combatEnt->unk23;
  pcVar17 = gCombatP->substruct2;
  FUN_800714d0(pcVar16,X,Y,uVar1);
  uVar20 = (int)(((int)(char)Y - uVar9) * 0x1000000) >> 0x18;
  iVar15 = (int)(char)Y + uVar9;
  if ((int)uVar20 <= iVar15) {
    iVar10 = (int)(char)X + uVar9;
    do {
      bVar3 = (byte)uVar20;
      uVar18 = (int)(((int)(char)X - uVar9) * 0x1000000) >> 0x18;
      if ((int)uVar18 <= iVar10) {
        do {
          uVar12 = 0;
          uVar11 = sub_square_add_sqrt((byte)uVar18,bVar3,X,Y);
          uVar19 = _uStack80;
          uVar7 = uStack_4c;
          uVar4 = uVar5;
          if (((ulonglong)(longlong)(int)uVar9 < (ulonglong)(longlong)(short)uVar11) ||
             (lVar8 = FUN_80070fa0(pcVar16,uVar18,uVar20,uVar1), lVar8 == 0)) {
LAB_80061b18:
            uStack_4c = uVar7;
            _uStack80 = uVar19;
            uVar5 = uVar4;
          }
          else {
            uVar19 = 0;
            if (combat_AiScore_tally != 0) {
              do {
                pCVar2 = combat_AiScores_pointer[uVar19].combatEnt;
                uVar13 = CombatEntity::GetCoordXU8(pCVar2);
                uVar14 = CombatEntity::GetCoordYU8(pCVar2);
                uVar11 = sub_square_add_sqrt((byte)uVar18,bVar3,uVar13,uVar14);
                uVar12 += uVar11;
                uVar19 = uVar19 + 1 & 0xffff;
              } while (uVar19 < combat_AiScore_tally);
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
  pcVar6 = combat_AiScores_pointer;
  combat_AiScores_pointer->x = bStack_4d;
  pcVar6->combatEnt = NULL;
  pcVar6->y = uStack76;
  FUN_800713fc(pcVar16,X,Y,uVar1);
  clear_combat_substruc2(pcVar17);
  return;
}


void FUN_80061d10(CombatAIInfo* param_1,s32 param_2){
  s32 iVar1;
  s16 sVar2;
  u8 bVar3;
  u8 *pbVar4;
  u32 uVar5;
  u8 bVar6;
  u8 local_28 [2];
  
  bVar6 = 0;
  if (gCombatP->leaderDead == 0) {bVar6 = gCombatP->flask_byte;}
  get_combatEnt_x_y(param_1->combatEnt,local_28,local_28 + 1);
  uVar5 = 0;
  if (combat_AiScore_tally != 0) {
    iVar1 = 0;
    do {
      pbVar4 = &combat_AiScores_pointer->spell_pri + iVar1;
      sVar2 = sub_square_add_sqrt(local_28[0],local_28[1],pbVar4[1],pbVar4[2]);
      *pbVar4 = (u8)sVar2;
      if (bVar6 != 0) {
        bVar3 = FUN_80061bc8(param_1,pbVar4[1],pbVar4[2],(u8)sVar2,param_2,bVar6);
        *pbVar4 = bVar3;
      }
      uVar5++;
      iVar1 = uVar5 << 3;
    } while (uVar5 < combat_AiScore_tally);
  }
  return;
}

void FUN_80061dfc(CombatAIInfo* param_1){
  u8 bVar1;
  u8 bVar2;
  CombatEntity *pCVar3;
  CharSheet *pCVar4;
  Temp_weapon *pTVar5;
  char X;
  u8 Y;
  u32 uVar7;
  u8 x;
  u8 y;
  s32 iVar8;
  longlong lVar6;
  u8 uVar11;
  s32 iVar9;
  s32 iVar10;
  u8 bVar12;
  combat_substruct_2 *X_00;
  combat_substruct *pcVar13;
  u32 uVar14;
  u32 uVar15;
  u32 uVar16;
  ulonglong uVar17;
  u32 uVar18;
  combat_aiscore *pcVar19;
  float fVar20;
  ulonglong uVar21;
  s32 y_00;
  ulonglong uVar22;
  s32 x_00;
  s32 uStack104;
  s32 uStack100;
  
  bVar1 = 0;
  if (gCombatP->leaderDead == 0) {bVar1 = gCombatP->flask_byte;}
  uVar22 = (ulonglong)(u32)get_combatEnt_x_f(param_1->combatEnt);
  uVar21 = (ulonglong)(u32)get_combatEnt_y_f(param_1->combatEnt);
  X = get_combatEnt_x(param_1->combatEnt);
  Y = get_combatEnt_y(param_1->combatEnt);
  pcVar13 = &gCombatP->substruct;
  X_00 = gCombatP->substruct2;
  uVar7 = (u32)param_1->combatEnt->unk0x23;
  FUN_800714d0();
  y_00 = (s32)uVar21;
  x_00 = (s32)uVar22;
  uVar16 = 0;
  if (combat_AiScore_tally != 0) {
    do {
      pcVar19 = combat_AiScores_pointer + uVar16;
      uStack104._3_1_ = pcVar19->x;
      uStack104 = (u32)(u8)uStack104;
      uStack100._3_1_ = pcVar19->y;
      pCVar3 = pcVar19->combatEnt;
      uStack100 = (u32)(u8)uStack100;
      x = get_combatEnt_x(pCVar3);
      y = get_combatEnt_y(pCVar3);
      uVar14 = (u32)pCVar3->unk0x23;
      uVar18 = (s32)(((s32)(char)y - uVar7) * 0x1000000) >> 0x18;
      pCVar4 = pCVar3->charSheetP;
      bVar2 = pCVar3->index;
      pTVar5 = pCVar4->weapons;
      if ((s32)uVar18 <= (s32)((s32)(char)y + (u32)pCVar3->unk0x23)) {
        do {
          uVar15 = (s32)(((s32)(char)x - uVar7) * 0x1000000) >> 0x18;
          if ((s32)uVar15 <= (s32)((s32)(char)x + uVar14)) {
            iVar8 = uVar15 * 0x1000000;
            do {
              iVar8 = iVar8 + 0x1000000;
              if (FUN_80070fa0(pcVar13,uVar15,uVar18,uVar7) != 0) {
                set_combatEnt_x_y(param_1->combatEnt,(float)uVar15,(float)uVar18);
                FUN_8006a394(param_1->combatEnt,x,y);
                FUN_80072454(X_00,param_1->combatEnt);
                if (X_00->arrayA[bVar2] != 0) {
                  iVar10 = 0;
                  if ((uVar15 == X) && (uVar18 == Y)) {iVar10 = 0x19;}
                  if (FUN_8006a830(param_1->combatEnt,pCVar3,x,y) != 0) {iVar10+=20;}
                  uVar11 = (u8)(uVar15 & 0xff);
                  iVar9 = FUN_80070cc4(pcVar13,uVar11,(u8)uVar18,x,y);
                  if (iVar9 < 0) {iVar10 += 50;}
                  fVar20 = (1.0f - getHPPercent(pCVar4)) * 15.0f;
                  if (INT_MAX_f <= fVar20) {fVar20-= INT_MAX_f;}
                  uVar17 = (iVar10 + (s32)fVar20) & 0xff;
                  if ((pTVar5) && (pTVar5->range != 0)) {uVar17+=10;}
                  if (bVar1 != 0) {
                    uVar17 = SEXT18(FUN_80061bc8(param_1,uVar11,uVar18,(u8)uVar17,0,bVar1););
                  }
                  if (pcVar19->spell_pri < uVar17) {
                    pcVar19->spell_pri = (u8)uVar17;
                    uStack104 = uVar15 & 0xff;
                    uStack100 = uVar18 & 0xff;
                  }
                }
              }
              uVar15 = iVar8 >> 0x18;
            } while ((s32)uVar15 <= (s32)((s32)(char)x + (u32)pCVar3->unk0x23));
          }
          uVar14 = (u32)pCVar3->unk0x23;
          uVar18 = SEXT14((char)((u8)uVar18 + 1));
        } while ((s32)uVar18 <= (s32)((s32)(char)y + uVar14));
      }
      y_00 = (s32)uVar21;
      x_00 = (s32)uVar22;
      pcVar19->x = (u8)uStack104;
      pcVar19->y = (u8)uStack100;
      uVar16++;
    } while (uVar16 < combat_AiScore_tally);
  }
  FUN_800713fc(pcVar13,X,Y,uVar7);
  set_combatEnt_x_y(param_1->combatEnt,x_00,y_00);
  clear_combat_substruc2(X_00);
  return;
}

bool FUN_80062230(CombatAIInfo* param_1){
  bool bVar1;
  
  other_func_checking_fireball(param_1);
  bVar1 = combat_AiScore_tally != 0;
  if (bVar1) {
    combat_AiScores_quicksort(false);
    combat_AiScores_moveEntry();
    FUN_80061d10(param_1,1);
    combat_AiScores_quicksort(true);
  }
  return bVar1;
}

void FUN_8006228c(CombatAIInfo* param_1){
  FUN_800609bc(param_1);
  FUN_80061d10(param_1,1);
  combat_AiScores_quicksort(true);
}

void FUN_800622c4(CombatAIInfo* param_1){
  FUN_800609bc(param_1);
  FUN_80061dfc(param_1);
  combat_AiScores_quicksort(false);
}

void FUN_800622f8(CombatAIInfo* param_1){
  u8 bVar1;
  u8 bVar2;
  
  FUN_80060a88(param_1);
  if (combat_AiScore_tally == 0) {
    combat_aiscores_free();
    bVar1 = param_1->combatEnt->AtkType;
    bVar2 = 1;
    if (bVar1 == 1) {bVar2 = 2;}
    param_1->combatEnt->AtkType = bVar2;
    FUN_80060a88(param_1);
    param_1->combatEnt->AtkType = bVar1;
    if (combat_AiScore_tally == 0) {
      combat_aiscores_free();
      FUN_800609bc(param_1);
    }
    else {param_1->unk0x7 = param_1->combatEnt->AtkType == 1;}
  }
  FUN_80061d10(param_1,1);
  combat_AiScores_quicksort(true);
}

void FUN_800623bc(CombatAIInfo* param_1){
  u8 bVar1;
  bool bVar2;
  
  if (!func_80068358(param_1->combatEnt)) {
    bVar1 = param_1->combatEnt->AtkType;
    param_1->combatEnt->AtkType = 1;
    FUN_80060a88(param_1);
    FUN_80061dfc(param_1);
    combat_AiScores_quicksort(false);
    param_1->combatEnt->AtkType = bVar1;
    param_1->unk0x7 = 0;
  }
  else {
    if (param_1->combatEnt->AtkType == 1) {
      FUN_800609bc(param_1);
      FUN_8006193c(param_1);
      param_1->unk0x7 = 1;
    }
    else {
      FUN_80060db0(param_1);
      if (combat_AiScore_tally == 0) {
        combat_aiscores_free();
        FUN_8006228c(param_1);
      }
      else {
        combat_AiScores_quicksort(true);
        bVar2 = combat_AiScores_pointer->spell_pri == 0;
        if (bVar2) {combat_AiScores_moveEntry();}
        FUN_80061d10(param_1,(u32)bVar2);
        combat_AiScores_quicksort(bVar2);
      }
    }
  }
  return;
}

void FUN_800624bc(CombatAIInfo* param_1){
  FUN_800609bc(param_1);
  FUN_80061dfc(param_1);
  combat_AiScores_quicksort(false);
}

void FUN_800624f0(combat_ai* param_1){
  if (!func_80062230(param_1)) {
    combat_aiscores_free();
    FUN_8006228c(param_1);
  }
}

void FUN_8006252c(CombatAIInfo* param_1){
  if (!func_80062230(param_1)) {
    combat_aiscores_free();
    FUN_80060a88(param_1);
    if (combat_AiScore_tally == 0) {
      combat_aiscores_free();
      FUN_800622c4(param_1);
      param_1->unk0x7 = 0;
    }
    else {
      FUN_80061dfc(param_1);
      combat_AiScores_quicksort(false);
      param_1->unk0x7 = 0;
    }
  }
  return;
}



void FUN_800625a4(CombatAIInfo* param_1){
  if (!func_80062230(param_1)) {
    combat_aiscores_free();
    FUN_800623bc(param_1);
  }
}

void FUN_800625e0(CombatAIInfo* param_1){
  if (!func_80062230(param_1)) {
    combat_aiscores_free();
    FUN_800624bc(param_1);
  }
}


void FUN_8006261c(CombatAIInfo* param_1){

  if (!func_80062230(param_1)) {
    combat_aiscores_free();
    FUN_80060a88(param_1);
    if (combat_AiScore_tally == 0) {
      combat_aiscores_free();
      FUN_800609bc(param_1);
    }
    FUN_80061dfc(param_1);
    combat_AiScores_quicksort(false);
    param_1->unk0x7 = 0;
  }
  return;
}


void FUN_8006268c(CombatAIInfo* param_1){
  u8 bVar1;
  bool bVar2;
  
  if (!func_80062230(param_1)) {
    combat_aiscores_free();
    if (!func_80068358(param_1->combatEnt)) {
      bVar1 = param_1->combatEnt->AtkType;
      param_1->combatEnt->AtkType = 1;
      FUN_80060a88(param_1);
      FUN_80061dfc(param_1);
      combat_AiScores_quicksort(false);
      param_1->combatEnt->AtkType = bVar1;
      param_1->unk0x7 = 0;
    }
    else {
      if (param_1->combatEnt->AtkType == 1) {
        FUN_800609bc(param_1);
        FUN_8006193c(param_1);
        param_1->unk0x7 = '\x01';
      }
      else {
        FUN_80060db0(param_1);
        if (combat_AiScore_tally == 0) {
          combat_aiscores_free();
          FUN_800609bc(param_1);
          FUN_8006193c(param_1);
        }
        else {
          combat_AiScores_quicksort(true);
          if (combat_AiScores_pointer->spell_pri == 0) {
            combat_AiScores_moveEntry();
          }
          FUN_80061d10(param_1,1);
          combat_AiScores_quicksort(true);
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
  bool bVar4;
  u8 bVar5;
  u8 uVar6;
  
  (*combatAI_commands[param_1->command].cmd)(param_1);
  pcVar3 = combat_AiScores_pointer;
  param_1->entIndex = -1;
  if (pcVar3->combatEnt) {param_1->entIndex = pcVar3->combatEnt->index;}
  bVar5 = pcVar3->unk0x3;
  if (bVar5 != 0) {
    pcVar3->unk0x3 = bVar5 - 1;
    pCVar1 = param_1->combatEnt->charSheetP;
    pCVar1->currSpell = BYTE_ARRAY_800ef6e0[(u8)(bVar5 - 1)];
    pCVar1->spellSwitch = BYTE_ARRAY_800ef6e8[pcVar3->unk0x3];
  }
  *param_2 = pcVar3->x;
  *param_3 = pcVar3->y;
  combat_aiscores_free();
  if (((param_1->combatEnt->index == gGlobals.ShadowIndex) &&
      (HasHornOfKynon())) &&
     (pCVar2 = gCombatP->combatEnts, pCVar2)) {
    *param_2 = get_combatEnt_x(pCVar2);
    *param_3 = get_combatEnt_y(pCVar2);;
  }
  return;
}


void FUN_800628cc(CombatAIInfo* param_1)

{
  CharSheet *pCVar1;
  CombatEntity *Ent;
  u8 Y;
  combat_substruct_2 *pcVar2;
  u32 uVar3;
  CombatStruct *pCVar4;
  CombatStruct *pCVar5;
  Temp_spell *pTVar6;
  u8 bVar9;
  s32 iVar7;
  u8 uVar10;
  bool bVar11;
  s16 sVar8;
  bool bVar12;
  combat_substruct *pcVar13;
  u32 uVar14;
  s32 iVar15;
  char cVar16;
  u32 uVar17;
  u32 uVar18;
  u32 uVar19;
  s32 iVar20;
  float fVar21;
  float fVar22;
  u32 uStack84;
  u32 uStack72;
  u32 uStack68;
  
  pCVar4 = gCombatP;
  pcVar2 = gCombatP->substruct2;
  pCVar1 = param_1->combatEnt->charSheetP;
  pcVar13 = &gCombatP->substruct;
  pTVar6 = getSpell(pCVar1);
  if ((pTVar6) && (GetIDIndex(pTVar6->id) == fireball)) {
    uVar14 = (u32)pTVar6->range * check_spell_wizard(pCVar1,pTVar6);
    bVar9 = get_combatEnt_x(param_1->combatEnt);
    uVar10 = get_combatEnt_y(param_1->combatEnt);
    fVar21 = gCombatP->floatA;
    uStack84 = 0;
    if (INT_MAX_f <= fVar21) {fVar21 = fVar21 - INT_MAX_f;}
    fVar22 = gCombatP->FloatB;
    uStack72 = (s32)fVar21 & 0xff;
    if (INT_MAX_f <= fVar22) {fVar22 = fVar22 - INT_MAX_f;}
    uStack68 = (s32)fVar22 & 0xff;
    uVar19 = (s32)(((s32)(char)uVar10 - uVar14) * 0x1000000) >> 0x18;
    iVar7 = (s32)(char)uVar10 + uVar14;
    if ((s32)uVar19 <= iVar7) {
      do {
        Y = (u8)uVar19;
        iVar20 = (s32)(char)bVar9 - uVar14;
        while( true ) {
          uVar3 = iVar20 * 0x1000000 >> 0x18;
          if ((s32)((s32)(char)bVar9 + uVar14) < (s32)uVar3) break;
          bVar11 = FUN_80070ee4(pcVar13,(char)((u32)(iVar20 * 0x1000000) >> 0x18),Y,1);
          iVar20 = uVar3 + 1;
          if (bVar11 == false) {
            sVar8 = sub_square_add_sqrt(bVar9,uVar10,(u8)(uVar3 & 0xff),Y);
            pCVar5 = gCombatP;
            if (sVar8 <= (s32)uVar14) {
              Ent = param_1->combatEnt;
              gCombatP->floatA = (float)uVar3;
              pCVar5->FloatB = (float)uVar19;
              FUN_80072454(pcVar2 + 1,Ent);
              if (pCVar4->substruct2[1].arrayBCount != 0) {
                uVar18 = 0;
                uVar17 = 0;
                if (gCombatP->EntCount != 0) {
                  iVar15 = 0;
                  do {
                    if (*(s32 *)((s32)pcVar2[1].arrayA + iVar15) != 0) {
                      bVar11 = CombatEnt_flag_4(gCombatP->combatEnts[uVar18]));
                      bVar12 = CombatEnt_flag_4(param_1->combatEnt);
                      cVar16 = (char)uVar17 + -1;
                      if (bVar11 != bVar12) {cVar16 = (char)uVar17 + '\x01';}
                      uVar17 = SEXT14(cVar16);
                    }
                    uVar18++;
                    iVar15 = uVar18 << 2;
                  } while (uVar18 < gCombatP->EntCount);
                }
                if ((s32)uStack84 < (s32)uVar17) {
                  uStack84 = uVar17 & 0xff;
                  uStack72 = uVar3 & 0xff;
                  uStack68 = uVar19 & 0xff;
                }
              }
            }
          }
        }
        uVar19 = SEXT14((char)(Y + 1));
      } while ((s32)uVar19 <= iVar7);
    }
    pCVar4 = gCombatP;
    gCombatP->floatA = (float)uStack72;
    pCVar4->FloatB = (float)uStack68;
  }
  return;
}

void FUN_80062c04(vec2f *param_1,float param_2,vec2f *param_3,vec2f *param_4,vec2f *param_5){
  vec2f *pafVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  vec2f *fStack176;
  vec2f *fStack112;
  
  if (((*param_1)[0] == (*param_3)[0]) && ((*param_1)[1] == (*param_3)[1])) {
    Vec2_Sub(param_5,param_4,param_3);
    vec2_normalize(param_5);
    multiVec2(param_5,param_2);
    pafVar1 = param_5;
  }
  else {
    Vec2_Sub(&fStack176,param_3,param_1);
    Vec2_Sub(&fStack112,param_4,param_3);
    fVar2 = (float)vec2_dot(&fStack112,&fStack112);
    fVar3 = (float)vec2_dot(&fStack176,&fStack112);
    fVar4 = (float)vec2_dot(&fStack176,&fStack176);
    fVar4 = fVar3 * fVar3 - fVar2 * (fVar4 - param_2 * param_2) * 4.0f;
    fVar6 = 0.0;
    if (fVar4 < 0.0) {return;}
    fVar4 = _sqrtf(fVar4);
    fVar5 = 1.0f / (fVar2 + fVar2);
    fVar2 = (fVar4 - fVar3) * fVar5;
    fVar5 = (-fVar4 - fVar3) * fVar5;
    if ((fVar2 < fVar6) || (1.0f < fVar2)) {
      if (fVar5 < 0.0) {return;}
      fVar2 = fVar5;
      if (1.0f < fVar5) {return;}
    }
    else {
      if (((fVar6 <= fVar5) && (fVar5 <= 1.0f)) && (fVar5 <= fVar2)) {
        fVar2 = fVar5;
      }
    }
    multiVec2(&fStack112,fVar2);
    pafVar1 = &fStack112;
  }
  vec2_sum(param_5,pafVar1,param_3);
  return;
}

bool FUN_80062e14(u32 param_1,u32 param_2,u8 *param_3,u8 *param_4,undefined param_5)

{
  u8 uVar1;
  u8 bVar2;
  s32 iVar4;
  bool bVar6;
  longlong lVar3;
  s32 iVar5;
  s32 iVar7;
  combat_substruct *pcVar8;
  u32 uVar9;
  s32 iVar10;
  u32 uVar11;
  s32 iVar12;
  u32 uVar13;
  u32 uVar14;
  u32 uVar15;
  u32 uVar16;
  s32 iVar17;
  s32 iVar18;
  s32 uStack68;
  s32 uStack64;
  s32 iStack56;
  s32 iStack52;
  s32 iStack48;
  
  uVar9 = param_1 & 0xff;
  uVar11 = param_2 & 0xff;
  iVar10 = *param_3 - uVar9;
  iVar12 = *param_4 - uVar11;
  iVar7 = iVar10;
  if (iVar10 < 0) {
    iVar7 = -iVar10;
  }
  iVar4 = (s32)(s16)iVar7;
  iVar7 = iVar12;
  if (iVar12 < 0) {
    iVar7 = -iVar12;
  }
  iVar7 = (s32)(s16)iVar7;
  if (iVar10 < 0) {
    uStack68 = -1;
  }
  else {
    uStack68 = ZEXT14(0 < iVar10);
  }
  if (iVar12 < 0) {
    uStack64 = -1;
  }
  else {
    uStack64 = ZEXT14(0 < iVar12);
  }
  iVar10 = iVar4 >> 1;
  pcVar8 = &gCombatP->substruct;
  iVar12 = iVar7 >> 1;
  uVar15 = uVar9;
  uVar13 = uVar11;
  if (iVar4 < iVar7) {
    if (0 < iVar7) {
      iStack56 = 0x10000;
      iStack48 = (uVar9 + uStack68) * 0x10000;
      uVar16 = uVar9;
      uVar14 = uVar11;
      iStack52 = (uVar11 + uStack64) * 0x10000;
      do {
        iVar12 = (iVar12 + iVar4) * 0x10000 >> 0x10;
        uVar15 = uVar16;
        if (iVar7 <= iVar12) {
          iVar12 = (iVar12 - iVar7) * 0x10000 >> 0x10;
          uVar15 = iStack48 >> 0x10;
          iStack48 = iStack48 + uStack68 * 0x10000;
        }
        uVar1 = (u8)uVar15;
        uVar13 = iStack52 >> 0x10;
        bVar2 = (u8)((u32)iStack52 >> 0x10);
        bVar6 = FUN_8007102c(pcVar8,(u8)uVar16,(u8)uVar14,uVar1,bVar2);
        if ((bVar6 == false) || (lVar3 = FUN_80070fa0(pcVar8,uVar1,bVar2,param_5), lVar3 == 0)) {
          FUN_8007102c(pcVar8,(u8)uVar16,(u8)uVar14,uVar1,bVar2);
          FUN_80070fa0(pcVar8,uVar1,bVar2,param_5);
          *param_3 = uVar1;
          *param_4 = bVar2;
          return uVar14 != uVar11;
        }
        iVar10 = iStack56 >> 0x10;
        uVar16 = uVar15;
        uVar14 = uVar13;
        iStack56 = iStack56 + 0x10000;
        iStack52 = iStack52 + uStack64 * 0x10000;
      } while (iVar10 < iVar7);
    }
  }
  else {
    if (0 < iVar4) {
      iVar18 = (uVar9 + uStack68) * 0x10000;
      iVar17 = (uVar11 + uStack64) * 0x10000;
      uVar16 = uVar9;
      uVar14 = uVar11;
      iVar12 = 0x10000;
      do {
        iVar10 = (iVar10 + iVar7) * 0x10000 >> 0x10;
        uVar13 = uVar14;
        if (iVar4 <= iVar10) {
          iVar10 = (iVar10 - iVar4) * 0x10000 >> 0x10;
          uVar13 = iVar17 >> 0x10;
          iVar17 = iVar17 + uStack64 * 0x10000;
        }
        uVar15 = iVar18 >> 0x10;
        uVar1 = (u8)((u32)iVar18 >> 0x10);
        iVar18 = iVar18 + uStack68 * 0x10000;
        bVar2 = (u8)uVar13;
        bVar6 = FUN_8007102c(pcVar8,(u8)uVar16,(u8)uVar14,uVar1,bVar2);
        if ((bVar6 == false) || (lVar3 = FUN_80070fa0(pcVar8,uVar1,bVar2,param_5), lVar3 == 0)) {
          *param_3 = uVar1;
          *param_4 = bVar2;
          return uVar16 != uVar9;
        }
        iVar5 = iVar12 >> 0x10;
        uVar16 = uVar15;
        uVar14 = uVar13;
        iVar12 = iVar12 + 0x10000;
      } while (iVar5 < iVar4);
    }
  }
  *param_3 = (u8)uVar15;
  *param_4 = (u8)uVar13;
  bVar6 = false;
  if (*param_3 != uVar9) {
    bVar6 = (uVar13 & 0xff) != uVar11;
  }
  return bVar6;
}

void FUN_800631c8(CombatAIInfo* param_1){
  s8 sVar3 = FUN_800720f8(&gCombatP->substruct,get_combatEnt_x(param_1->combatEnt),get_combatEnt_y(param_1->combatEnt),
          (&gCombatP->unk0x5320)[(char)param_1->unk0x12 * 2]);
  set_combatEnt_vec2(param_1->combatEnt,sVar3);
  param_1->combatEnt->unk0x14 = sVar3;
}

void ofunc_NOOP(void){}



bool FUN_80063258(CombatAIInfo* param_1)

{
  playerData *ppVar1;
  bool bVar2;
  bool bVar3;
  CombatStruct *iVar4;
  longlong lVar4;
  bool bVar6;
  u8 bVar7;
  u8 bVar8;
  u16 uVar5;
  s8 sVar9;
  combat_substruct *pcVar10;
  float x;
  float y;
  double dVar11;
  undefined8 uVar12;
  u8 bStack336 [4];
  vec2f afStack328;
  vec2f afStack264;
  vec2f afStack200;
  vec2f fStack136;
  
  ppVar1 = gGlobals.playerDataArray[param_1->combatEnt->index];
  bVar2 = false;
  if (ppVar1) {
    bVar3 = false;
    bStack336[0] = 0;
    bStack336[1] = 0;
    bStack336[2] = 0;
    bStack336[3] = 0;
    pcVar10 = &gCombatP->substruct;
    get_combatEnt_x_y(param_1->combatEnt,bStack336,bStack336 + 1);
    FUN_800714d0(pcVar10,bStack336[0],bStack336[1],param_1->combatEnt->unk0x23);
    bVar7 = param_1->unk0x12;
    if (param_1->unk0x12 < param_1->unk0x13) {
      uVar12 = 0;
      dVar11 = 0.5d;
      do {
        iVar4 = (CombatStruct *)(&gCombatP->unk0x0 + ((s32)((u32)bVar7 << 0x18) >> 0x17));
        bStack336[2] = iVar4->unk0x5320;
        bStack336[3] = iVar4->unk0x5321;
        if (FUN_80070fa0(pcVar10,bStack336[2]) == 0) {
          bVar2 = true;
          bVar6 = FUN_80062e14((u32)bStack336[0],(u32)bStack336[1],bStack336 + 2,bStack336 + 3,param_1->combatEnt->unk0x23);
          if (bVar6 == false) break;
        }
        if (FUN_8007102c(pcVar10,bStack336[0],bStack336[1],bStack336[2],bStack336[3]) == false) {
          bVar2 = true;
          bVar6 = FUN_80062e14((u32)bStack336[0],(u32)bStack336[1],bStack336 + 2,bStack336 + 3,
                               param_1->combatEnt->unk0x23);
          if (bVar6 == false) break;
        }
        bVar7 = get_combatEnt_z(param_1->combatEnt);
        bVar8 = get_combatEnt_f3(param_1->combatEnt);
        uVar5 = sub_square_add_sqrt(bVar7,bVar8,bStack336[2],bStack336[3]);
        if ((u16)param_1->combatEnt->move_length < (uVar5 & 0xff)) {
          setVec2(afStack328,(float)(u32)bStack336[0],(float)(u32)bStack336[1]);
          setVec2(afStack264,(float)(u32)bStack336[2],(float)(u32)bStack336[3]);
          bVar2 = true;
          x = get_combatEnt_z_f(param_1->combatEnt);
          y = get_combatEnt_f3_f(param_1->combatEnt);
          setVec2(afStack200,x,y);
          lVar4 = (longlong)(s32)fStack136;
          FUN_80062c04(afStack200,(float)(u32)param_1->combatEnt->move_length,
                       afStack328,afStack264,fStack136);
          if (lVar4 == 0) break;
          if ((float)uVar12 < fStack136[0]) {bStack336[2] = (u8)(s32)((double)fStack136[0] + dVar11);}
          else {bStack336[2] = -(char)(s32)(dVar11 - (double)fStack136[0]);}
          if ((float)uVar12 < fStack136[1]) {bStack336[3] = (u8)(s32)((double)fStack136[1] + dVar11);}
          else {bStack336[3] = -(char)(s32)(dVar11 - (double)fStack136[1]);}
        }
        sVar9 = FUN_800720f8(&gCombatP->substruct,bStack336[0],bStack336[1],bStack336[2]);
        set_combatEnt_vec2(param_1->combatEnt,sVar9);
        bVar3 = true;
        param_1->combatEnt->unk0x14 = sVar9;
        bStack336[0] = bStack336[2];
        bStack336[1] = bStack336[3];
        SetPlayerToMoveQueue(ppVar1,(float)(u32)bStack336[2],(float)(u32)bStack336[3],ppVar1->scale_floatB);
        if ((uVar5 & 0xff) < 3) {CombatEnt_NAND_flags(param_1->combatEnt,flag3);}
        else {CombatEnt_OR_flags(param_1->combatEnt,flag3);}
        bVar7 = param_1->unk0x12;
        bVar7++;
        param_1->unk0x12 = bVar7;
        if (((s32)(u32)param_1->unk0x13 <= (s32)(char)bVar7) || (bVar2)) break;
      } while( true );
    }
    FUN_800713fc(pcVar10,bStack336[0],bStack336[1],(u32)param_1->combatEnt->unk0x23);
    if (bVar3) {
      set_combatEnt_x_y(param_1->combatEnt,(float)(u32)bStack336[0],(float)(u32)bStack336[1]);
      gGlobals.combatBytes[1] = gGlobals.combatBytes[0];
      gGlobals.combatBytes[0] = 5;
      gCombatP->unk0x4fbc = 0xf0;
      return true;
    }
    FUN_800631c8(param_1);
  }
  return false;
}

void Ai_swap_weapons(CombatAIInfo* param_1){
  CombatEntity *pCVar1;
  CharSheet *pCVar2;
  Temp_weapon *pTVar3;
  
  if (param_1->weapon) {
    pCVar1 = param_1->combatEnt;
    pCVar2 = pCVar1->charSheetP;
    pTVar3 = pCVar2->weapons;
    pCVar2->weapons = param_1->weapon;
    param_1->weapon = pTVar3;
    get_weapon_sheild_borg5(pCVar1);
    Gsprintf(gCombatP->textArray->they swap weapons,pCVar2->name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    FUN_80029ba8();
    pTVar3 = pCVar2->weapons;
    if ((isBreathSpitOrSpikes(pTVar3)) && (pTVar3->range != 0)) {param_1->combatEnt->AtkType = 4;}
  }
}

bool ai_should_swap_weapons(CombatAIInfo* param_1)

{
  CharSheet *pCVar1;
  Temp_weapon *pTVar2;
  bool bVar3;
  char cVar4;
  bool bVar5;
  
  pCVar1 = param_1->combatEnt->charSheetP;
  pTVar2 = pCVar1->weapons;
  param_1->unk0x4 = param_1->unk0x7;
  pCVar1->spellSwitch = 0;
  bVar5 = false;
  if ((param_1->unk0x4 == 0) &&
     (param_1->combatEnt->AtkType = 1, pTVar2)) {
    if (isBreathSpitOrSpikes(pTVar2)) {goto LAB_80063828;}
    if (param_1->weapon == NULL) {goto LAB_80063828;}
    if (isBreathSpitOrSpikes(param_1->weapon) == false) {goto LAB_80063828;}
    Ai_swap_weapons(param_1);
    bVar5 = true;
  }
  LAB_80063828
  cVar4 = param_1->unk0x4;
  if ((((cVar4 == '\x01') && (param_1->combatEnt->AtkType = 2, pTVar2)) &&
      (pTVar2->range == 0)) &&
     ((param_1->weapon != NULL && (param_1->weapon->range != 0)))) {
    Ai_swap_weapons(param_1);
    bVar5 = true;
  }
  FUN_80072454(gCombatP->substruct2,param_1->combatEnt);
  FUN_80072454(gCombatP->substruct2 + 1,param_1->combatEnt);
  return bVar5;
}

void combat_ai_shadow(CombatAIInfo* param_1){
  CombatEntity *pCVar1;
  longlong lVar2;
  s32 iVar3;
  CombatStruct *iVar4;
  s32 iVar5;
  u32 uVar6;
  float x;
  float y;
  double dVar7;
  undefined8 uVar8;
  vec2f afStack304;
  vec2f afStack240;
  vec2f afStack176;
  vec2f fStack112;
  
  if ((param_1->combatEnt->move_length != 1) && (gGlobals.ShadowIndex != -1)) {
    pCVar1 = (&gCombatP->combatEnts)[(u8)gGlobals.ShadowIndex];
    x = get_combatEnt_x_f(pCVar1);
    y = get_combatEnt_y_f(pCVar1);
    setVec2(afStack176,x,y);
    iVar4 = (CombatStruct *)(&gCombatP->unk0x0 + (char)param_1->unk0x12 * 2);
    setVec2(afStack304,(float)(s32)(char)iVar4->unk0x5320,
            (float)(s32)(char)iVar4->unk0x5321);
    uVar6 = (s32)(char)param_1->unk0x12 + 1;
    if (uVar6 < param_1->unk0x13) {
      iVar5 = uVar6 * 2;
      uVar8 = 0;
      dVar7 = 0.5d;
      do {
        iVar3 = &gCombatP->unk0x0 + iVar5;
        setVec2(afStack240,(float)(s32)*(char *)(iVar3 + 0x5320),(float)(s32)*(char *)(iVar3 + 0x5321));
        lVar2 = (longlong)(s32)fStack112;
        FUN_80062c04(afStack176,10.0,afStack304,afStack240,fStack112);
        if (lVar2 != 0) {
          param_1->unk0x13 = (char)uVar6 + 1;
          if ((float)uVar8 < fStack112[0]) {
            (&gCombatP->unk0x5320)[iVar5] = (u8)(s32)((double)fStack112[0] + dVar7);
          }
          else {
            (&gCombatP->unk0x5320)[iVar5] = -(char)(s32)(dVar7 - (double)fStack112[0]);
          }
          if (fStack112[1] <= (float)uVar8) {
            (&gCombatP->unk0x5321)[iVar5] = -(char)(s32)(dVar7 - (double)fStack112[1]);
            return;
          }
          (&gCombatP->unk0x5321)[iVar5] = (u8)(s32)((double)fStack112[1] + dVar7);
          return;
        }
        copyVec2(afStack240,afStack304);
        iVar5+=2;
        uVar6++;
      } while (uVar6 < param_1->unk0x13);
    }
  }
  return;
}

bool FUN_80063af4(CombatAIInfo* param_1,u8 param_2,u8 param_3){
  bool bVar1;

  param_1->unk0x13 = FUN_80071ec4(&gCombatP->substruct,get_combatEnt_x(param_1->combatEnt),get_combatEnt_y(param_1->combatEnt),
   param_2,param_3,param_1->combatEnt->unk0x23,(u8 (*) [2])&gCombatP->unk0x5320);
  bVar1 = param_1->unk0x13 < get_byte_E(&gCombatP->substruct);
  if (bVar1) {
    param_1->unk0x12 = 0;
    combat_ai_shadow(param_1);
  }
  return bVar1;
}


bool FUN_80063bbc(CombatAIInfo *param_1){
  playerData *ppVar1;
  referncepoint_obj *prVar2;
  bool bVar3;
  float x0;
  float y0;
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
      FUN_80063db0(param_1,CombatEntity::GetCoordX(param_1->combatEnt),CombatEntity::GetCoordY(param_1->combatEnt),(prVar2->header).pos.x,(prVar2->header).pos.z,1.0f,ppVar1);
      bVar3 = true;
    }
  }
  return bVar3;
}



bool FUN_80063c94(CombatAIInfo *param_1){
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
    fVar4 = CombatEntity::Get2DProximity(pCVar1,param_1->combatEnt);
    fVar5 = ppVar2->interactRadiusB + ppVar3->interactRadiusB;
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



void FUN_80063db0(CombatAIInfo *ai,float x0,float y0,float x1,float y1,float param_6,playerData *param_7){
  vec2f fStack240;
  vec2f afStack176;
  vec2f afStack112;

  setVec2(&afStack176,x0,y0);
  setVec2(&afStack112,x1,y1);
  Vec2_Sub(&fStack240,&afStack112,&afStack176);
  multiVec2(&fStack240,param_6);
  vec2_sum(&fStack240,&fStack240,&afStack176);
  SetPlayerMoveToQueue(param_7,fStack240.x,fStack240.y,param_7->interactRadiusB,0);
  FUN_800714d0(&gCombatP->substruct,CombatEntity::GetCoordXU8(ai->combatEnt),CombatEntity::GetCoordXU8(ai->combatEnt),ai->combatEnt->unk23);
  CombatEntity::SetCoords(ai->combatEnt,fStack240.x,fStack240.y);
  FUN_800713fc(&gCombatP->substruct,CombatEntity::GetCoordXU8(ai->combatEnt),CombatEntity::GetCoordXU8(ai->combatEnt),ai->combatEnt->unk23);
  gGlobals.combatBytes[1] = gGlobals.combatBytes[0];
  gGlobals.combatBytes[0] = 5;
  gCombatP->waitTimer = 0xf0;
}



bool FUN_80063f1c(CombatAIInfo *param_1,undefined1 param_2,undefined param_3){
  bool bVar1;
  bool bVar2;
  
  bVar1 = FUN_80063af4(param_1,param_2,param_3);
  bVar2 = false;
  if (!bVar1) {
    if (!CombatAIInfo::IsAlly(param_1)) {
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



referncepoint_obj * CombatAI::FindFleeingRefpoint(CombatAIInfo *param_1,float *dist){
  referncepoint_obj *ret;
  referncepoint_obj *prVar4;
  float prox;
  vec2f afStack304;
  vec2f afStack240;
  char buff [16];
  vec2f afStack112;
  
  ret = NULL;
  *dist = 100000.0f;
  setVec2(&afStack304,CombatEntity::GetCoordX(param_1->combatEnt),CombatEntity::GetCoordY(param_1->combatEnt));
  for(u32 i=0;i<8;i++) {
    sprintf(buff,gCombatP->textArray->flee_d,i);
    prVar2 = FindReferncePointName(gGlobals.Sub.borg9DatPointer,buff,false);
    if (prVar2) {
      setVec2(&afStack112,(prVar2->header).pos.x,(prVar2->header).pos.z);
      prox = vec2_proximity(&afStack112,&afStack304);
      if (prox <= *dist) {
        copyVec2(&afStack112,&afStack240);
        *dist = prox;
        ret = prVar2;
      }
    }
  }
  return ret;
}



bool CombatAI::GetFleePointCoords(CombatAIInfo *param_1,u8 x,u8 y,s8 *outX,s8 *outY,float *param_6){
  referncepoint_obj *prVar1;
  
  prVar1 = CombatAI::FindFleeingRefpoint(param_1,param_6);
  if (prVar1 == NULL) return false;
  else {
      *outX = (prVar1->header).pos.x;
      *outY = (prVar1->header).pos.z;
    return true;
  }
}


bool FUN_800641b8(CombatAIInfo *param_1,s8* param_2,s8* param_3){
  bool uVar4;
  float afStack_20 [8];

  afStack_20[0] = 0.0;
  if (CombatAI::GetFleePointCoords(param_1,CombatEntity::GetCoordXU8(param_1->combatEnt),CombatEntity::GetCoordYU8(param_1->combatEnt),param_2,param_3,afStack_20)) {
    Gsprintf(gCombatP->textArray->they flee,param_1->combatEnt->charSheetP->name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    uVar4 = afStack_20[0] < 1.5f;
    if (uVar4) {
      combat_escape_func(param_1->combatEnt);
      FUN_80029ba8();
    }
  }
  else {
    param_1->flags &= ~2;
    uVar4 = FUN_800642c4(param_1,param_2,param_3);
  }
  return uVar4;

bool FUN_800642c4(CombatAIInfo *param_1,u8 *param_2,u8 *param_3){
  u8 uVar1;
  u8 uVar2;
  bool bVar3;
  
  uVar1 = CombatEntity::GetCoordXU8(param_1->combatEnt);
  uVar2 = CombatEntity::GetCoordYU8(param_1->combatEnt);
  combatAI_run_cmd(param_1,param_2,param_3);
  bVar3 = false;
  if (uVar1 == *param_2) && (uVar2 == *param_3)) {
    FUN_80064714(param_1);
    bVar3 = true;
  }
  return bVar3;
}

u8 FUN_80064358(CombatAIInfo* param_1){
  u8 bVar1;
  
  FUN_800628cc(param_1);
  bVar1 = FUN_80064a78(param_1);
  if (!bVar1) func_80029ba8();
  return !bVar1;
}


bool FUN_80064398(CombatAIInfo *param_1){
  CombatEntity *target;
  bool bVar1;
  bool bVar2;
  
  NOOP_8005ff90();
  gCombatP->some_index = param_1->entIndex;
  target = (&gCombatP->combatEnts)[param_1->entIndex];
  if (param_1->unk1 == 2) {
    bVar1 = ai_should_cast_magic(param_1->combatEnt,target);
    bVar2 = true;
    if (!bVar1) {
      bVar1 = CombatEntity::CanBeTargeted(param_1->combatEnt,target,0);
      bVar2 = false;
      if (bVar1) bVar2 = true;
    }
  }
  else {
    if (CombatEntity::CanBeTargeted(param_1->combatEnt,target,0)) bVar2 = true;
    else {
      bVar1 = ai_should_cast_magic(param_1->combatEnt,target);
      bVar2 = true;
      if (!bVar1) bVar2 = false;
    }
  }
  return bVar2;
}

void CombatAIInfo::FaceTarget(CombatAIInfo *param_1){
  CombatEntity::FaceTarget(param_1->combatEnt,(&gCombatP->combatEnts)[param_1->entIndex]);
}




void FUN_80064494(CombatAIInfo *param_1){
  byte bVar1;
  bool bVar2;
  float x;
  float y;
  u8 uStack24 [2];
  
  FUN_80070234(param_1->combatEnt);
  CombatEntity::Coord2IsCoord(param_1->combatEnt);
  uStack24[0] = 0;
  uStack24[1] = 0;
  if (!CombatAIInfo::IsAlly(param_1)) bVar2 = FUN_800642c4(param_1,uStack24,uStack24 + 1);
  else {
    setVec2(&gCombatP->entity_XY,CombatEntity::GetCoordX(param_1->combatEnt),CombatEntity::GetCoordY(param_1->combatEnt));
    bVar2 = FUN_800641b8(param_1,uStack24,uStack24 + 1);
  }
  if (((bVar2 == false) && (!FUN_80063f1c(param_1,uStack24[0],uStack24[1]))) &&
     (!FUN_80063258(param_1))) {
    if (!CombatAIInfo::IsAlly(param_1)) {
      if (FUN_80063c94(param_1)) return;
    }
    else {
      if (FUN_80063bbc(param_1)) return;
      FUN_800645b4(param_1);
    }
    FUN_80064714(param_1);
  }
}

void FUN_800645b4(CombatAIInfo *param_1){
  bool bVar1;
  u8 uStack104 [2];
  vec2f afStack96;
  float afStack_20 [6];
  
  FUN_80070234(param_1->combatEnt);
  if (!CombatAIInfo::IsAlly(param_1)) FUN_80064714(param_1);
  else {
    bVar1 = false;
    if (--param_1->unk18 == 0) {
      bVar1 = true;
      combat_escape_func(param_1->combatEnt);
    }
    else {
      afStack_20[0] = 0.0;
      uStack104[0] = 0;
      uStack104[1] = 0;
      if ((CombatAI::GetFleePointCoords(param_1,CombatEntity::GetCoordXU8(param_1->combatEnt),CombatEntity::GetCoordYU8(param_1->combatEnt),uStack104,uStack104 + 1,afStack_20)) && (afStack_20[0] <= 1.5f)) {
        bVar1 = true;
        combat_escape_func(param_1->combatEnt);
      }
    }
    if (!bVar1) {
      setVec2(&afStack96,CombatEntity::GetCoordX(param_1->combatEnt),CombatEntity::GetCoordY(param_1->combatEnt));
      if (vec2_proximity(&afStack96,&gCombatP->entity_XY) < 1.0f) {
        combat_escape_func(param_1->combatEnt);
      }
    }
    FUN_80029ba8();
  }
}

void FUN_80064714(CombatAIInfo* param_1){
  if (((param_1->unk0x7 == param_1->unk0x4) ||
      (!CombatAIInfo::ShouldSwapWeapons(param_1))) &&(!FUN_80064358(param_1))) {
    if (FUN_80064398(param_1)) CombatAIInfo::FaceTarget(param_1);
    else FUN_80029ba8();
  }
}


bool CombatAIInfo::ElementalInCombat(void){
  bool bVar1;
  uint uVar2;
  combat_substruct_2 *pcVar3;
  
  uVar2 = 0;
  pcVar3 = gCombatP->substruct2 + 1;
  if (gCombatP->EntCount) {
    do {
      if (((pcVar3->arrayA[0]) && ((&gCombatP->combatEnts)[uVar2])) &&
         (IsElemental((&gCombatP->combatEnts)[uVar2]->charSheetP->ID))) return true;
      uVar2 += 1;
      pcVar3 = (combat_substruct_2 *)(pcVar3->arrayA + 1);
    } while (uVar2 < gCombatP->EntCount);
  }
  return false;
}



bool CombatAIInfo::ZombieInCombat(void *param_1){
  ItemID IVar1;
  combat_substruct_2 *pcVar2;
  CombatEntity **ppCVar3;
  uint uVar4;
  
  uVar4 = 0;
  pcVar2 = gCombatP->substruct2 + 1;
  if (gCombatP->EntCount != 0) {
    ppCVar3 = &gCombatP->combatEnts;
    do {
      if (((pcVar2->arrayA[0]) && (*ppCVar3)) &&
         ((IVar1 = (*ppCVar3)->charSheetP->ID, IVar1 == (ItemID)(entityList[190] | 0x200) ||
          (IVar1 == (ItemID)(entityList[182] | 0x200))))) {
        return true;
      }
      ppCVar3 = ppCVar3 + 1;
      uVar4 += 1;
      pcVar2 = (combat_substruct_2 *)(pcVar2->arrayA + 1);
    } while (uVar4 < gCombatP->EntCount);
  }
  return false;
}


u8 CombatAIInfo::IsSomeonePoisoned(void){
  Temp_enchant **ppTVar1;
  uint uVar2;
  combat_substruct_2 *pcVar3;
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
      ppCVar4 = ppCVar4 + 1;
      uVar5 += 1;
      pcVar3 = (combat_substruct_2 *)(pcVar3->arrayA + 1);
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
  if (!gCombatP->substruct2[0].field4_0xa3) return false;
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
    if (!gCombatP->substruct2[1].field4_0xa3) return false;
    if (!gCombatP->substruct2[1].arrayBCount) return false;
    param_1->entIndex = gCombatP->substruct2[1].entindex;
  }
  clear_combat_substruc2(gCombatP->substruct2);
  return true;
}

u8 FUN_80064a78(CombatAIInfo *param_1){
  u8 bVar1;
  u8 uVar2;
  
  FUN_80070234(param_1->combatEnt);
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

void CombatAIInfo::ClearEntIndex(CombatAIInfo *param_1){
  param_1->entIndex = -1;
  param_1->unk12 = 0xff;
  param_1->unk13 = 0;
}


u8 CombatAIInfo::IsAlly(CombatAIInfo *param_1){  
  if (CombatEntity::Flag4(param_1->combatEnt)) return param_1->flags & 1;
  return 0;
}



void CombatAIInfo::LookToFlee(CombatAIInfo *param_1){
  if ((!CombatEntity::Flag7(param_1->combatEnt)) && (gCombatP->hasFleeRefpoints)) {
    param_1->unk0x18 = 4;
    param_1->flags |= 1;
  }
}