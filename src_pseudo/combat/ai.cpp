void NOOP_8005ff90(void){}

bool some_combat_leader_check(ItemID param_1){
  u8 bVar1;
  u8 bVar5;
  bool bVar6;
  char cVar7;
  s32 iVar3;
  u32 uVar4;
  AspectEnum AVar8;
  longlong lVar9;
  
  if (combatPointer->refpoints_flee_flag == 0) {return false;}
  bVar5 = GetIDIndex(param_1);
  bVar1 = EntityPointer->entities[(char)bVar5].Morale;
  lVar9 = bVar1;
  if (0xb < bVar1) {return false;}
  AVar8 = SOLAR;
  if (combatPointer->EnemiesAlive <= combatPointer->enemyCount >> 1) {return false;}
  if (EntityPointer->entities[(char)bVar5].aspect != SOLAR) {AVar8 = LUNAR;}
  if (NotAspectBonus(AVar8)) {lVar9 = (bVar1 + -1 * 0x1000000 >> 0x18);}
  if (combatPointer->EnemiesAlive < combatPointer->enemyCount >> 1) {lVar9 = ((lVar9 + -1) * 0x1000000 >> 0x18);}
  if ((combatPointer->leaderDead) ||(!CombatEnt_flag_1((&combatPointer->combatEnts)[combatPointer->leaderIndex])))
    {lVar9 = ((s32)lVar9 + -4) * 0x1000000 >> 0x18);}
  cVar7 = (char)lVar9 + 1;
  if (2 < combatPointer->leaderMorale - 8) {
    if (combatPointer->leaderMorale < 11) goto LAB_800600c4;
    cVar7 = (char)lVar9 + 2;
  }
  lVar9 = cVar7;
LAB_800600c4:
  cVar7 = (char)lVar9;
  if ((lVar9 < 2) || (lVar9 < 12)) {
    if (cVar7 < 2) {cVar7 = 2;}
    iVar3 = (s32)cVar7;
  }
  else {iVar3 = 0xb;}
  return iVar3 < RollD(2,6);
}

u8 ai_aspect_morale_stam(CombatEntity *param_1,bool param_2){
  Temp_enchant *pTVar1;
  bool bVar4;
  s32 iVar3;
  longlong lVar2;
  char cVar5;
  combat_ai *iVar4;
  u8 bVar6;
  u32 uVar7;
  longlong lVar8;
  combat_ai *pTVar4;
  CombatEntity *leader;
  
  pTVar4 = param_1->combat_ai_pointer;
  leader = (&combatPointer->combatEnts)[combatPointer->leaderIndex];
  pTVar4->flags &= 0xfd;
  bVar6 = param_1->combat_ai_pointer->morale;
  lVar8 = (longlong)(char)bVar6;
  if (getNotAspectBonus(param_1)) {lVar8 = ((bVar6 + -1) * 0x1000000 >> 0x18);}
  if ((param_1->combat_ai_pointer->flags & 0x10)) {lVar8 = ((lVar8 + -2) * 0x1000000 >> 0x18);}
  iVar3 = ;
  if (CharStats::getModdedStat(param_1->CharSheet->Stats,STAM)==0) {lVar8 = ((lVar8 + -1) * 0x1000000 >> 0x18);}
  if (combatPointer->EnemiesAlive < combatPointer->enemyCount >> 1) {lVar8 = ((lVar8 + -1) * 0x1000000 >> 0x18);}
  uVar7 = 0;
  pTVar1 = param_1->CharSheet->effects->list[0];
  while ((pTVar1 == NULL || (pTVar1->unk0x4 == 0))) {
    uVar7++;
    if (0xe < uVar7) goto LAB_8006024c;
    pTVar1 = param_1->CharSheet->effects->list[uVar7];
  }
  lVar8 = (longlong)(((s32)lVar8 + -1) * 0x1000000 >> 0x18);
LAB_8006024c:
  if (combatPointer->playersAlive < combatPointer->playerCount >> 1) {
    lVar8 = (longlong)(((s32)lVar8 + 2) * 0x1000000 >> 0x18);
  }
  lVar2 = spell_taget_party_area(param_1);
  if (lVar2 == 0) {
    cVar5 = param_1->combat_ai_pointer->entIndex;
    if (cVar5 == -1) {
LAB_800602cc:
      iVar4 = param_1->combat_ai_pointer;
    }
    else {
      if ((&combatPointer->combatEnts)[cVar5] == NULL) {
        iVar4 = param_1->combat_ai_pointer;
      }
      else {
        if (CharStats::getModdedStat((&combatPointer->combatEnts)[cVar5]->CharSheet->Stats,STAM)) {
          lVar8 = (longlong)(((s32)lVar8 + 3) * 0x1000000 >> 0x18);
          goto LAB_800602cc;
        }
        iVar4 = param_1->combat_ai_pointer;
      }
    }
  }
  else {
    iVar4 = param_1->combat_ai_pointer;
  }
  if ((iVar4->flags & 4)) {
    lVar8 = (longlong)(((s32)lVar8 + 2) * 0x1000000 >> 0x18);
  }
  if (param_2) {
    if ((combatPointer->leaderDead) || (!CombatEnt_flag_1(leader))) {lVar8 -=4;}
    cVar5 = (char)lVar8 + 1;
    if (2 < combatPointer->leaderMorale - 8) {
      if (combatPointer->leaderMorale < 0xb) goto LAB_8006034c;
      cVar5 = (char)lVar8 + 2;
    }
    lVar8 = (longlong)(s32)cVar5;
  }
LAB_8006034c:
  if ((lVar8 < 2) || (lVar8 < 0xc)) {
    bVar6 = (u8)lVar8;
    if (lVar8 < 2) {bVar6 = 2;}
  }
  else {bVar6 = 0xb;}
  if (!param_2) {combatPointer->leaderMorale = bVar6;}
  return bVar6;
}


bool ai_stam_or_enemy_count(CombatEntity *param_1){

  bool bVar2;
  
  bVar2 = true;
  if ((param_1->combat_ai_pointer->flags & 2) == 0) {
    if (CharStats::getModdedStat(param_1->CharSheet->Stats,STAM) < 1) {bVar2 = true;}
    else {
      if ((param_1->combat_ai_pointer->flags & 1) == 0) {
        bVar2 = combatPointer->EnemiesAlive <= combatPointer->enemyCount >> 1;
      }
      else {bVar2 = false;}
    }
  }
  return bVar2;
}


void func_8006042c(CombatEntity *param_1,bool param_2){
  CombatEntity *pCVar1 = (&combatPointer->combatEnts)[combatPointer->leaderIndex];
  if (((param_2) && (param_1->combat_ai_pointer->morale < 0xc)) && (ai_stam_or_enemy_count(param_1))) {
    if (combatPointer->leaderDead == 0) {ai_aspect_morale_stam(pCVar1,false);}
    if (ai_aspect_morale_stam(param_1,true) < RollD(2,6)) {func_80064b64(param_1->combat_ai_pointer);}
    else {param_1->combat_ai_pointer->flags &= 0xfe;}
  }
  return;
}

bool combatEnts_differ_flag_4(combat_ai *param_1,CombatEntity *param_2){
  bool bVar3;
  
  if (param_2 == NULL) {bVar3 = false;}
  else {
    bVar3 = false;
    if (!isDead(param_2->CharSheet)) {
      if (!CombatEnt_flag_1(param_2)) {bVar3 = false;}
      else {
        bVar3 = CombatEnt_flag_4(param_2); != CombatEnt_flag_4(param_1->combatEnt);}
    }
  }
  return bVar3;
}


u8 func_80060570(combat_ai *param_1){
  CombatEntity *pCVar1;
  u32 uVar2;
  
  uVar2 = 0;
  if (combat_AiScore_tally != 0) {
    do {
      pCVar1 = combat_AiScores_pointer[uVar2].combatEnt;
      set_combat_movement(pCVar1);
      if (get_combatEnt_proximity(param_1->combatEnt,pCVar1) <= (float)pCVar1->move_length){return 1;}
      uVar2++;
    } while (uVar2 < combat_AiScore_tally);
  }
  return 0;
}

u8 spell_priority_caseSwitch(combat_ai *param_1,SpellEnum param_2)

{
  CombatEntity *pCVar1;
  CharSheet *pCVar2;
  CombatStruct *pCVar3;
  bool bVar4;
  bool bVar5;
  bool bVar6;
  u8 val;
  char cVar8;
  s32 iVar7;
  u32 uVar9;
  u32 uVar10;
  char cVar11;
  MagicSchoolEnum MVar12;
  Temp_enchant *iVar8;
  
  pCVar3 = combatPointer;
  cVar8 = 0;
  switch(param_2) {
  case Immolation:
  case AcidBolt:
    val = 0x16;
    break;
  default:
    goto switchD_80060678_caseD_1;
  case removePoison:
    if (!IsSomeonePoisoned()) {return 0;}
  case photosynthesis:
    val = 0x53;
    break;
  case AirSheild:
  case spiritSheild:
  case starlightSheild:
    val = 0x3d;
    break;
  case ControlElem:
    cVar8 = elemental_in_combat();
    goto LAB_8006078c;
  case debilitation:
    val = 0x1f;
    break;
  case DragonFlames:
  case wind:
    val = 0xc;
    break;
  case EarthSmite:
  case crushingDeath:
  case whitefire:
    val = 0xd;
    break;
  case fireball:
    val = 0xe;
    break;
  case lightning:
    val = 0xb;
    break;
  case strength:
    val = 0x33;
    break;
  case brilliance:
    val = 0x35;
    break;
  case stupidity:
    val = 0x21;
    break;
  case banishing:
    if (!elemental_in_combat()) {return 0;}
  case cheatDeath:
    val = 0x52;
    break;
  case charming:
    goto switchD_80060678_caseD_10;
  case endurance:
    val = 0x34;
    break;
  case weakness:
    val = 0x20;
    break;
  case wraithTouch:
    val = 0x24;
    break;
  case controlZombies:
    cVar8 = zombie_in_combat();
LAB_8006078c:
    val = 0;
    if (cVar8 != 0) {
switchD_80060678_caseD_10:
      val = 0x54;
    }
    break;
  case darkness:
  case light:
    if ((param_2 != darkness) || (TerrainPointer->partOfDay == NIGHT)) {
      if (param_2 != light) {return 0;}
      if (TerrainPointer->partOfDay != NIGHT) {return 0;}
    }
    uVar10 = 0;
    cVar11 = cVar8;
    if (combatPointer->EntCount != 0) {
      do {
        pCVar1 = (&combatPointer->combatEnts)[uVar10];
        cVar8 = cVar11;
        if (pCVar1) {
          bVar4 = getNotAspectBonus(pCVar1);
          bVar5 = CombatEnt_flag_4(pCVar1);
          bVar6 = CombatEnt_flag_4(param_1->combatEnt);
          cVar8 = cVar11 + -1;
          if (bVar4 == (bVar5 == bVar6)) {cVar8 = cVar11 + '\x01';}
        }
        uVar10++;
        cVar11 = cVar8;
      } while (uVar10 < combatPointer->EntCount);
    }
    val = 0x55;
    goto joined_r0x800608b4;
  case haste:
    val = 0x49;
    break;
  case exhaustion:
    val = 0x22;
    break;
  case stamina:
    val = 0x36;
    break;
  case tapStamina:
    val = 0x37;
    break;
  case wallOfBones:
  case frozenDoom:
    val = 0x2a;
    break;
  case poison:
    val = 0x15;
    break;
  case mirror:
    val = 0x48;
    break;
  case vsElemental:
  case vsNaming:
  case vsNecromancy:
  case vsStar:
    val = 0x47;
    break;
  case dispelElemental:
  case dispelNaming:
  case dispelNecro:
  case dispelStar:
    if (param_2 == dispelElemental) {MVar12 = Elemental;}
    else {
      MVar12 = Naming;
      if ((param_2 != dispelNaming) && (MVar12 = Star, param_2 == dispelNecro)) {
        MVar12 = Necromancy;
      }
    }
    uVar10 = 0;
    if (combatPointer->EntCount != 0) {
      iVar7 = 0;
      do {
        pCVar1 = *(CombatEntity **)((s32)&combatPointer->combatEnts + iVar7);
        pCVar2 = pCVar1->CharSheet;
        if (*(s32 *)((s32)pCVar3->substruct2[1].arrayA + iVar7) != 0) {
          bVar4 = CombatEnt_flag_4(pCVar1);
          bVar5 = CombatEnt_flag_4(param_1->combatEnt);
          uVar9 = 0;
          iVar7 = 0;
          do {
            iVar8 = *(Temp_enchant **)((s32)pCVar2->effects->list + iVar7);
            cVar11 = cVar8;
            if ((((iVar8) && (iVar8->school == MVar12)) &&
                (iVar8->timer != 0xffffffff)) &&
               (cVar11 = cVar8 + -1, iVar8->unk0x4 == (u32)(bVar4 == bVar5))) {
              cVar11 = cVar8 + '\x01';
            }
            cVar8 = cVar11;
            uVar9++;
            iVar7 = uVar9 << 2;
          } while (uVar9 < 0xf);
        }
        uVar10++;
        iVar7 = uVar10 << 2;
      } while (uVar10 < combatPointer->EntCount);
    }
    val = 0x51;
joined_r0x800608b4:
    if (cVar8 < '\x01') {
switchD_80060678_caseD_1:
      val = 0;
    }
    break;
  case dexterity:
    val = 0x38;
    break;
  case clumsiness:
    val = 0x23;
    break;
  case stellarGravity:
    val = 0x29;
    break;
  case webOfStarlight:
    val = 0x2b;
  }
  return val;
}

void func_800609bc(combat_ai *param_1){
  u8 bVar1;
  CombatEntity *feild4;
  u32 uVar3;
  
  uVar3 = 0;
  bVar1 = combatPointer->EntCount;
  combat_aiscores_clear((u32)bVar1);
  if (bVar1 != 0) {
    do {
      feild4 = (&combatPointer->combatEnts)[uVar3];
      if (combatEnts_differ_flag_4(param_1,feild4)) {
        set_combat_aiscore(get_combatEnt_x(feild4),get_combatEnt_y(feild4),0,0,feild4);
      }
      uVar3++;
    } while (uVar3 < bVar1);
  }
  return;
}

void func_80060a88(combat_ai *param_1){
  u8 bVar1;
  u8 bVar2;
  CombatEntity *pCVar3;
  u8 feildx;
  u8 feildy;
  CombatStruct *pCVar4;
  u8 X;
  u8 Y;
  u16 uVar6;
  longlong lVar5;
  u8 bVar8;
  u8 uVar9;
  u16 uVar7;
  s32 iVar10;
  combat_substruct *pcVar11;
  s32 iVar12;
  u32 uVar13;
  u32 uVar14;
  u32 uVar15;
  s32 iVar16;
  combat_substruct_2 *X_00;
  u32 uVar17;
  float fVar18;
  ulonglong uVar19;
  s32 y;
  ulonglong uVar20;
  s32 x;
  
  bVar1 = param_1->combatEnt->move_length;
  combat_aiscores_clear((u32)bVar1 * (u32)bVar1 * 4 & 0xfffc);
  uVar20 = (ulonglong)(u32)get_combatEnt_x_f(param_1->combatEnt);
  uVar19 = (ulonglong)(u32)get_combatEnt_y_f(param_1->combatEnt);
  X = get_combatEnt_x(param_1->combatEnt);
  Y = get_combatEnt_y(param_1->combatEnt);
  pCVar4 = combatPointer;
  pcVar11 = &combatPointer->substruct;
  bVar2 = param_1->combatEnt->unk0x23;
  X_00 = combatPointer->substruct2;
  func_800714d0(pcVar11,X,Y,bVar2);
  y = (s32)uVar19;
  x = (s32)uVar20;
  uVar17 = (u32)bVar1;
  iVar16 = ((Y - uVar17) * 0x1000000) >> 0x18;
  iVar10 = (s32)(char)Y + uVar17;
  if (iVar16 <= iVar10) {
    do {
      feildy = (u8)iVar16;
      iVar12 = ((X - uVar17) * 0x1000000) >> 0x18;
      while (iVar12 <= X + uVar17)) {
        feildx = (u8)iVar12;
        uVar6 = sub_square_add_sqrt(feildx,feildy,X,Y);
        if ((uVar6 <= bVar1) &&
           (lVar5 = func_80070fa0(pcVar11,iVar12,iVar16,(u32)bVar2), lVar5 != 0)) {
          set_combatEnt_x_y(param_1->combatEnt,(float)iVar12,(float)iVar16);
          func_80072454(X_00,param_1->combatEnt);
          uVar13 = 0;
          if (pCVar4->substruct2[0].arrayBCount != 0) {
            uVar6 = 0xff;
            uVar15 = 0;
            if (combatPointer->EntCount != 0) {
              do {
                pCVar3 = (&combatPointer->combatEnts)[uVar13];
                uVar7 = uVar6;
                uVar14 = uVar15;
                if (X_00->arrayA[uVar13] == 0) {
LAB_80060cb0:
                  uVar6 = uVar7;
                  uVar15 = uVar14;
                }
                else {
                  uVar7 = sub_square_add_sqrt(feildx,feildy,get_combatEnt_x(pCVar3),get_combatEnt_y(pCVar3));
                  uVar7++;
                  uVar14 = uVar13;
                  if (uVar7 < uVar6) goto LAB_80060cb0;
                }
                uVar1366;
              } while (uVar13 < combatPointer->EntCount);
            }
            set_combat_aiscore(feildx,feildy,0,0,(&combatPointer->combatEnts)[uVar15]);
          }
        }
        iVar12 = (s32)(char)(feildx + 1);
      }
      y = (s32)uVar19;
      x = (s32)uVar20;
      iVar16 = (s32)(char)(feildy + 1);
    } while (iVar16 <= iVar10);
  }
  set_combatEnt_x_y(param_1->combatEnt,x,y);
  func_800713fc(pcVar11,X,Y,(u32)bVar2);
  clear_combat_substruc2(X_00);
  return;
}

void func_80060db0(combat_ai *param_1){
  u8 bVar1;
  u8 bVar2;
  u8 bVar3;
  CombatEntity *feild4;
  bool bVar4;
  u8 feildx;
  u8 feildy;
  CombatStruct *pCVar5;
  u32 uVar7;
  u8 X;
  u8 Y;
  s16 sVar8;
  longlong lVar6;
  u8 bVar11;
  u8 bVar12;
  u16 uVar9;
  u16 uVar10;
  combat_substruct_2 *X_00;
  s32 iVar13;
  combat_substruct *pcVar14;
  u32 uVar15;
  u32 uVar16;
  s32 iVar17;
  s32 iVar18;
  combat_aiscore *pcVar19;
  float fVar20;
  ulonglong uVar21;
  s32 y;
  ulonglong uVar22;
  s32 x;
  
  bVar1 = param_1->combatEnt->move_length;
  bVar3 = 0;
  bVar2 = 0;
  bVar12 = 0;
  uVar7 = (u32)bVar1;
  combat_aiscores_clear((u32)bVar1 * (u32)bVar1 * 4 & 0xfffc);
  bVar11 = 0;
  uVar22 = (ulonglong)(u32)get_combatEnt_x_f(param_1->combatEnt);
  uVar21 = (ulonglong)(u32)get_combatEnt_y_f(param_1->combatEnt);
  X = get_combatEnt_x(param_1->combatEnt);
  Y = get_combatEnt_y(param_1->combatEnt);
  pCVar5 = combatPointer;
  pcVar14 = &combatPointer->substruct;
  bVar1 = param_1->combatEnt->unk0x23;
  X_00 = combatPointer->substruct2;
  func_800714d0(pcVar14,X,Y,bVar1);
  x = (s32)uVar22;
  y = (s32)uVar21;
  iVar18 = (s32)(((s32)(char)Y - uVar7) * 0x1000000) >> 0x18;
  iVar13 = (s32)(char)Y + uVar7;
  pcVar19 = (combat_aiscore *)0x0;
  if (iVar18 <= iVar13) {
    do {
      feildy = (u8)iVar18;
      iVar17 = (s32)(((s32)(char)X - uVar7) * 0x1000000) >> 0x18;
      while (iVar17 <= X + uVar7)) {
        feildx = (u8)iVar17;
        sVar8 = sub_square_add_sqrt(feildx,feildy,X,Y);
        if ((sVar8 <= uVar7) &&
           (lVar6 = func_80070fa0(pcVar14,iVar17,iVar18,(u32)bVar1), lVar6 != 0)) {
          set_combatEnt_x_y(param_1->combatEnt,(float)iVar17,(float)iVar18);
          func_80072454(X_00,param_1->combatEnt);
          if ((pCVar5->substruct2[0].arrayBCount != 0) && (uVar15 = 0, combatPointer->EntCount != 0)) {
            iVar17 = 0;
            do {
              feild4 = *(CombatEntity **)((s32)&combatPointer->combatEnts + iVar17);
              if (*(s32 *)((s32)X_00->arrayA + iVar17) != 0) {
                bVar4 = false;
                for (uVar16 = 0; uVar16 < combat_AiScore_tally; uVar16 = uVar16 + 1 & 0xffff) {
                  pcVar19 = combat_AiScores_pointer + uVar16;
                  if (pcVar19->combatEnt == feild4) {
                    bVar11 = get_combatEnt_x(feild4);
                    bVar12 = get_combatEnt_y(feild4);
                    bVar2 = pcVar19->x;
                    bVar3 = pcVar19->y;
                    bVar4 = true;
                    break;
                  }
                }
                lVar6 = func_80060570(param_1);
                if (bVar4) {
                  if ((lVar6 == 0) && (pcVar19->spell_pri != 0)) {
                    pcVar19->x = feildx;
                  }
                  else {
                    uVar9 = sub_square_add_sqrt(feildx,feildy,bVar11,bVar12);
                    uVar10 = sub_square_add_sqrt(bVar2,bVar3,bVar11,bVar12);
                    if (uVar10 <= uVar9) goto LAB_800610b8;
                    pcVar19->x = feildx;
                  }
                  pcVar19->y = feildy;
                  pcVar19->spell_pri = (u8)lVar6;
                }
                else {
                  set_combat_aiscore(feildx,feildy,0,(u8)lVar6,feild4);
                }
              }
LAB_800610b8:
              uVar15++;
              iVar17 = uVar15 << 2;
            } while (uVar15 < combatPointer->EntCount);
          }
        }
        iVar17 = (s32)(char)(feildx + 1);
      }
      x = (s32)uVar22;
      y = (s32)uVar21;
      iVar18 = (s32)(char)(feildy + 1);
    } while (iVar18 <= iVar13);
  }
  func_800713fc(pcVar14,X,Y,(u32)bVar1);
  set_combatEnt_x_y(param_1->combatEnt,x,y);
  clear_combat_substruc2(X_00);
  return;
}

s32 fireball_func(combat_ai *param_1){
  CombatEntity *pCVar1;
  combat_substruct_2 *pcVar2;
  bool bVar4;
  bool bVar5;
  s32 iVar7;
  CombatStruct *iVar6;
  u32 uVar8;
  s32 iVar9;
  float fVar10;
  float fVar11;
  ulonglong uVar12;
  float fVar13;
  ulonglong uVar14;
  float fVar15;
  ulonglong uVar16;
  ulonglong uVar17;
  
  uVar12 = 0;
  uVar8 = 0;
  fVar13 = 0.0;
  uVar16 = 0;
  fVar11 = 0.0;
  uVar14 = 0;
  fVar15 = 0.0;
  if (combatPointer->EntCount != 0) {
    uVar17 = (ulonglong)(u32)1.0f;
    do {
      pCVar1 = (&combatPointer->combatEnts)[uVar8];
      bVar4 = combatEnts_differ_flag_4(param_1,pCVar1);
      fVar15 = (float)uVar14;
      fVar13 = (float)uVar12;
      fVar11 = (float)uVar16;
      if (bVar4) {
        uVar16 = (ulonglong)(u32)(fVar11 + get_combatEnt_x_f(pCVar1));
        uVar12 = (ulonglong)(u32)(fVar13 + get_combatEnt_y_f(pCVar1));
        uVar14 = (ulonglong)(u32)(fVar15 + (float)uVar17);
      }
      fVar13 = (float)uVar12;
      fVar11 = (float)uVar16;
      fVar15 = (float)uVar14;
      uVar8++;
    } while (uVar8 < combatPointer->EntCount);
  }
  pCVar1 = param_1->combatEnt;
  pcVar2 = combatPointer->substruct2;
  combatPointer->floatA = fVar11 / fVar15;
  combatPointer->FloatB = fVar13 / fVar15;
  func_80072454(pcVar2 + 1,pCVar1);
  uVar8 = 0;
  if (combatPointer->substruct2[1].arrayBCount == 0) {iVar9 = 0;}
  else {
    iVar9 = 0;
    if (combatPointer->EntCount != 0) {
      iVar7 = 0;
      do {
        iVar6 = (CombatStruct *)(&combatPointer->unk0x0 + iVar7);
        if (iVar6->substruct2[1].arrayA[0] != 0) {
          if (CombatEnt_flag_4(iVar6->combatEnts) == CombatEnt_flag_4(param_1->combatEnt)) {iVar9--;}
          else {iVar9++;}
        }
        uVar8++;
        iVar7 = uVar8 * 4;
      } while (uVar8 < combatPointer->EntCount);
    }
  }
  return iVar9;
}


s32 some_prioirty_getter(combat_ai *param_1){
  func_80072454(combatPointer->substruct2 + 1,param_1->combatEnt);
  return combatPointer->substruct2[1].arrayBCount - 1;
}


u32 other_func_checking_fireball(combat_ai *param_1)

{
  u8 bVar1;
  u8 bVar2;
  u8 bVar3;
  CharSheet *pCVar4;
  combat_substruct_2 *pcVar5;
  CombatStruct *pCVar6;
  u8 X;
  u8 Y;
  u32 uVar8;
  SpellEnum *pSVar9;
  u32 uVar10;
  Temp_spell *pTVar11;
  s32 iVar12;
  s8 sVar15;
  s32 iVar13;
  u16 uVar14;
  longlong lVar7;
  u8 cVar19;
  u8 spellPri;
  combat_substruct *pcVar16;
  s32 iVar17;
  s32 iVar18;
  SpellEnum *pSVar19;
  u32 uVar20;
  s32 iVar21;
  float fVar22;
  ulonglong uVar23;
  s32 y;
  ulonglong uVar24;
  s32 x;
  u32 uStack116;
  u32 uStack96;
  
  bVar1 = param_1->combatEnt->move_length;
  if (bVar1 == 0) {uStack116 = ai_spell_stam(param_1);}
  else {
    uStack116 = 0;
    uVar24 = (ulonglong)(u32)get_combatEnt_x_f(param_1->combatEnt);
    uVar23 = (ulonglong)(u32)get_combatEnt_y_f(param_1->combatEnt);
    X = get_combatEnt_x(param_1->combatEnt);
    Y = get_combatEnt_y(param_1->combatEnt);
    pCVar6 = combatPointer;
    uStack96 = 0;
    pcVar5 = combatPointer->substruct2;
    pcVar16 = &combatPointer->substruct;
    pCVar4 = param_1->combatEnt->CharSheet;
    uVar8 = (u32)param_1->combatEnt->unk0x23;
    bVar2 = pCVar4->currSpell;
    bVar3 = pCVar4->spellSwitch;
    combat_aiscores_clear(((u32)bVar1 * (u32)bVar1 * 4 & 0x1ffc) << 3);
    func_800714d0(pcVar16,X,Y,uVar8);
    pSVar9 = param_1->spells;
    do {
      uVar10 = uStack96 + 1;
      if (pSVar9[uStack96] != NONE) {
        pCVar4->currSpell = BYTE_ARRAY_800ef6e0[uStack96];
        pCVar4->spellSwitch = BYTE_ARRAY_800ef6e8[uStack96];
        pTVar11 = getSpell(pCVar4);
        spellPri = check_spell_wizard(pCVar4,pTVar11);
        if (uStack116 == 0) 
          {uStack116 = CharStats::getModdedStat(pCVar4->Stats,STAM) < spell_stamina_subtract(pTVar11,spellPri) ^ 1;}
        uVar20 = (u32)bVar1;
        iVar12 = (s32)(char)Y - uVar20;
        iVar13 = (s32)(char)Y + uVar20;
        if (iVar12 <= iVar13) {
          iVar21 = (s32)(char)X + uVar20;
          do {
            iVar17 = iVar12 + 1;
            iVar18 = (s32)(char)X - uVar20;
            if (iVar18 <= iVar21) {
              pSVar19 += uStack96;
              do {
                uVar14 = sub_square_add_sqrt((u8)iVar18,(u8)iVar12,X,Y);
                if ((uVar14 <= bVar1) && (lVar7 = func_80070fa0(pcVar16), lVar7 != 0)) {
                  set_combatEnt_x_y(param_1->combatEnt,(float)iVar18,(float)iVar12);
                  if (*pSVar19 == fireball) {cVar19 = fireball_func(param_1);}
                  else {cVar19 = some_prioirty_getter(param_1);}
                  if ((pCVar6->substruct2[1].arrayBCount != 0) &&
                     (spellPri = spell_priority_caseSwitch(param_1,*pSVar19), spellPri != 0)) {
                    set_combat_aiscore((u8)iVar18,(u8)iVar12,(u8)uVar10,
                                       spellPri + cVar19 * '\n' + pTVar11->level,
                                       (&combatPointer->combatEnts)[(u8)pCVar6->substruct2[1].entindex]);
                  }
                }
                iVar18 = iVar18 + 1;
              } while (iVar18 <= iVar21);
            }
            iVar12 = iVar17;
          } while (iVar17 <= iVar13);
        }
      }
      y = (s32)uVar23;
      x = (s32)uVar24;
      uStack96 = uVar10;
    } while (uVar10 < 8);
    pCVar4->currSpell = bVar2;
    pCVar4->spellSwitch = bVar3;
    func_800713fc(pcVar16,X,Y,uVar8);
    set_combatEnt_x_y(param_1->combatEnt,x,y);
    clear_combat_substruc2(pcVar5 + 1);
  }
  return uStack116;
}

bool ai_spell_stam(combat_ai *param_1)

{
  u8 bVar1;
  u8 bVar2;
  CharSheet *pCVar3;
  bool bVar4;
  combat_substruct_2 *pcVar5;
  CombatStruct *pCVar6;
  u8 feildx;
  u8 feildy;
  Temp_spell *pTVar7;
  u8 bVar9;
  s32 iVar8;
  s8 sVar10;
  char cVar11;
  SpellEnum SVar12;
  u32 uVar13;
  SpellEnum *pSVar14;
  SpellEnum *pSVar15;
  
  pCVar6 = combatPointer;
  bVar4 = false;
  pCVar3 = param_1->combatEnt->CharSheet;
  pcVar5 = combatPointer->substruct2;
  bVar1 = pCVar3->currSpell;
  bVar2 = pCVar3->spellSwitch;
  feildx = get_combatEnt_x(param_1->combatEnt);
  uVar13 = 0;
  feildy = get_combatEnt_y(param_1->combatEnt);
  combat_aiscores_clear(8);
  pSVar15 = param_1->spells;
  pSVar14 = pSVar15;
  do {
    if (*pSVar14 != NONE) {
      pCVar3->currSpell = BYTE_ARRAY_800ef6e0[uVar13];
      pCVar3->spellSwitch = BYTE_ARRAY_800ef6e8[uVar13];
      pTVar7 = getSpell(pCVar3);
      bVar9 = check_spell_wizard(pCVar3,pTVar7);
      if (bVar4 == false) {
        bVar4 = spell_stamina_subtract(pCVar3,pTVar7,bVar9); <= CharStats::getModdedStat(pCVar3->Stats,STAM);
        SVar12 = *pSVar14;
      }
      else {SVar12 = *pSVar14;}
      if (SVar12 == fireball) {cVar11 = fireball_func(param_1);}
      else {cVar11 = some_prioirty_getter(param_1);}
      if (pCVar6->substruct2[1].arrayBCount != 0) {
        bVar9 = spell_priority_caseSwitch(param_1,pSVar15[uVar13]);
        if (bVar9 != 0) {
          set_combat_aiscore(feildx,feildy,(char)uVar13 + 1,bVar9 + cVar11 * '\n' + pTVar7->level,
                             (&combatPointer->combatEnts)[(u8)pCVar6->substruct2[1].entindex]);
        }
      }
    }
    uVar13++;
    pSVar14 = pSVar15 + uVar13;
  } while (uVar13 < 8);
  pCVar3->currSpell = bVar1;
  pCVar3->spellSwitch = bVar2;
  clear_combat_substruc2(pcVar5 + 1);
  return bVar4;
}

void func_8006193c(combat_ai *param_1)

{
  u8 bVar1;
  CombatEntity *pCVar2;
  u16 uVar3;
  u16 uVar4;
  combat_aiscore *pcVar5;
  u32 uVar6;
  u32 uVar8;
  u8 Y;
  s32 iVar9;
  s16 sVar10;
  longlong lVar7;
  u8 bVar12;
  u8 uVar13;
  u16 uVar11;
  s32 iVar14;
  combat_substruct *pcVar15;
  u8 bVar16;
  combat_substruct_2 *pcVar17;
  s32 uVar18;
  u32 uVar19;
  s32 uVar20;
  u8 uStack80;
  u8 bStack77;
  u8 uStack76;
  u32 uStack76_00;
  u8 X;
  
  uStack76_00 = 0;
  uStack76 = 0;
  _uStack80 = 0;
  bStack77 = 0;
  uVar4 = 0;
  uVar8 = (u32)param_1->combatEnt->move_length;
  X = get_combatEnt_x(param_1->combatEnt);
  Y = get_combatEnt_y(param_1->combatEnt);
  pcVar15 = &combatPointer->substruct;
  bVar1 = param_1->combatEnt->unk0x23;
  pcVar17 = combatPointer->substruct2;
  func_800714d0(pcVar15,X,Y,bVar1);
  uVar20 = (s32)(((s32)(char)Y - uVar8) * 0x1000000) >> 0x18;
  iVar14 = (s32)(char)Y + uVar8;
  if (uVar20 <= iVar14) {
    iVar9 = (s32)(char)X + uVar8;
    do {
      uVar18 = (s32)(((s32)(char)X - uVar8) * 0x1000000) >> 0x18;
      if (uVar18 <= iVar9) {
        do {
          uVar11 = 0;
          bVar16 = (u8)(uVar18 & 0xff);
          sVar10 = sub_square_add_sqrt(bVar16,(u8)uVar20,X,Y);
          uVar19 = _uStack80;
          uVar6 = uStack76_00;
          uVar3 = uVar4;
          if ((uVar8 < sVar10) ||(func_80070fa0(pcVar15,uVar18,uVar20,(u32)bVar1) == 0)) {
LAB_80061b18:
            uStack76_00 = uVar6;
            _uStack80 = uVar19;
            uVar4 = uVar3;
          }
          else {
            uVar19 = 0;
            if (combat_AiScore_tally != 0) {
              do {
                pCVar2 = combat_AiScores_pointer[uVar19].combatEnt;
                uVar11+= sub_square_add_sqrt(bVar16,uVar20 & 0xff,get_combatEnt_x(pCVar2),get_combatEnt_y(pCVar2))
                uVar19++;
              } while (uVar19 < combat_AiScore_tally);
            }
            uVar19 = uVar18 & 0xff;
            uVar6 = uVar20 & 0xff;
            uVar3 = uVar11;
            if (uVar4 < uVar11) goto LAB_80061b18;
          }
          uVar18 = (s32)((uVar18 + 1) * 0x1000000) >> 0x18;
        } while ((s32)uVar18 <= iVar9);
      }
      uVar20++;
    } while ((s32)uVar20 <= iVar14);
  }
  pcVar5 = combat_AiScores_pointer;
  combat_AiScores_pointer->x = bStack77;
  pcVar5->combatEnt = NULL;
  pcVar5->y = uStack76;
  func_800713fc(pcVar15,X,Y,(u32)bVar1);
  clear_combat_substruc2(pcVar17);
  return;
}

u8 func_80061bc8(combat_ai *param_1,u8 param_2,u8 param_3,u8 param_4,s32 param_5,u8 param_6){
  CombatEntity *pCVar1;
  u8 bVar2;
  u16 uVar3;
  u32 uVar8;
  
  uVar8 = 0;
  if (combatPointer->EntCount == 0) {return param_4;}
  pCVar1 = param_1->combatEnt;
  while( true ) {
    bVar2 = param_4;
    if (uVar8 != pCVar1->index) {
      pCVar1 = (&combatPointer->combatEnts)[uVar8];
      if (!isDead(pCVar1->CharSheet)) {
        if (CombatEnt_flag_4(pCVar1) == CombatEnt_flag_4(param_1->combatEnt)) {
          uVar3 = sub_square_add_sqrt(param_2,param_3,get_combatEnt_x(pCVar1),get_combatEnt_y(pCVar1));
          if ((uVar3 <= param_6) && (bVar2 = param_4 + 5, param_5 == 0)) {
            if (param_4 < 5) {return 0;}
            bVar2 = param_4 - 5;
          }
        }
      }
    }
    param_4 = bVar2;
    uVar8++;
    if (combatPointer->EntCount <= uVar8) break;
    pCVar1 = param_1->combatEnt;
  }
  return param_4;
}

void func_80061d10(combat_ai *param_1,s32 param_2){
  s32 iVar1;
  s16 sVar2;
  u8 bVar3;
  u8 *pbVar4;
  u32 uVar5;
  u8 bVar6;
  u8 local_28 [2];
  
  bVar6 = 0;
  if (combatPointer->leaderDead == 0) {bVar6 = combatPointer->flask_byte;}
  get_combatEnt_x_y(param_1->combatEnt,local_28,local_28 + 1);
  uVar5 = 0;
  if (combat_AiScore_tally != 0) {
    iVar1 = 0;
    do {
      pbVar4 = &combat_AiScores_pointer->spell_pri + iVar1;
      sVar2 = sub_square_add_sqrt(local_28[0],local_28[1],pbVar4[1],pbVar4[2]);
      *pbVar4 = (u8)sVar2;
      if (bVar6 != 0) {
        bVar3 = func_80061bc8(param_1,pbVar4[1],pbVar4[2],(u8)sVar2,param_2,bVar6);
        *pbVar4 = bVar3;
      }
      uVar5++;
      iVar1 = uVar5 << 3;
    } while (uVar5 < combat_AiScore_tally);
  }
  return;
}

void func_80061dfc(combat_ai *param_1){
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
  if (combatPointer->leaderDead == 0) {bVar1 = combatPointer->flask_byte;}
  uVar22 = (ulonglong)(u32)get_combatEnt_x_f(param_1->combatEnt);
  uVar21 = (ulonglong)(u32)get_combatEnt_y_f(param_1->combatEnt);
  X = get_combatEnt_x(param_1->combatEnt);
  Y = get_combatEnt_y(param_1->combatEnt);
  pcVar13 = &combatPointer->substruct;
  X_00 = combatPointer->substruct2;
  uVar7 = (u32)param_1->combatEnt->unk0x23;
  func_800714d0();
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
      pCVar4 = pCVar3->CharSheet;
      bVar2 = pCVar3->index;
      pTVar5 = pCVar4->weapons;
      if ((s32)uVar18 <= (s32)((s32)(char)y + (u32)pCVar3->unk0x23)) {
        do {
          uVar15 = (s32)(((s32)(char)x - uVar7) * 0x1000000) >> 0x18;
          if ((s32)uVar15 <= (s32)((s32)(char)x + uVar14)) {
            iVar8 = uVar15 * 0x1000000;
            do {
              iVar8 = iVar8 + 0x1000000;
              if (func_80070fa0(pcVar13,uVar15,uVar18,uVar7) != 0) {
                set_combatEnt_x_y(param_1->combatEnt,(float)uVar15,(float)uVar18);
                func_8006a394(param_1->combatEnt,x,y);
                func_80072454(X_00,param_1->combatEnt);
                if (X_00->arrayA[bVar2] != 0) {
                  iVar10 = 0;
                  if ((uVar15 == X) && (uVar18 == Y)) {iVar10 = 0x19;}
                  if (func_8006a830(param_1->combatEnt,pCVar3,x,y) != 0) {iVar10+=20;}
                  uVar11 = (u8)(uVar15 & 0xff);
                  iVar9 = func_80070cc4(pcVar13,uVar11,(u8)uVar18,x,y);
                  if (iVar9 < 0) {iVar10 += 50;}
                  fVar20 = (1.0f - getHPPercent(pCVar4)) * 15.0f;
                  if (INT_MAX_f <= fVar20) {fVar20-= INT_MAX_f;}
                  uVar17 = (iVar10 + (s32)fVar20) & 0xff;
                  if ((pTVar5) && (pTVar5->range != 0)) {uVar17+=10;}
                  if (bVar1 != 0) {
                    uVar17 = SEXT18(func_80061bc8(param_1,uVar11,uVar18,(u8)uVar17,0,bVar1););
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
  func_800713fc(pcVar13,X,Y,uVar7);
  set_combatEnt_x_y(param_1->combatEnt,x_00,y_00);
  clear_combat_substruc2(X_00);
  return;
}

bool func_80062230(combat_ai *param_1){
  bool bVar1;
  
  other_func_checking_fireball(param_1);
  bVar1 = combat_AiScore_tally != 0;
  if (bVar1) {
    combat_AiScores_quicksort(false);
    combat_AiScores_moveEntry();
    func_80061d10(param_1,1);
    combat_AiScores_quicksort(true);
  }
  return bVar1;
}

void func_8006228c(combat_ai *param_1){
  func_800609bc(param_1);
  func_80061d10(param_1,1);
  combat_AiScores_quicksort(true);
}

void func_800622c4(combat_ai *param_1){
  func_800609bc(param_1);
  func_80061dfc(param_1);
  combat_AiScores_quicksort(false);
}

void func_800622f8(combat_ai *param_1){
  u8 bVar1;
  u8 bVar2;
  
  func_80060a88(param_1);
  if (combat_AiScore_tally == 0) {
    combat_aiscores_free();
    bVar1 = param_1->combatEnt->AtkType;
    bVar2 = 1;
    if (bVar1 == 1) {bVar2 = 2;}
    param_1->combatEnt->AtkType = bVar2;
    func_80060a88(param_1);
    param_1->combatEnt->AtkType = bVar1;
    if (combat_AiScore_tally == 0) {
      combat_aiscores_free();
      func_800609bc(param_1);
    }
    else {param_1->unk0x7 = param_1->combatEnt->AtkType == 1;}
  }
  func_80061d10(param_1,1);
  combat_AiScores_quicksort(true);
}

void func_800623bc(combat_ai *param_1){
  u8 bVar1;
  bool bVar2;
  
  if (!func_80068358(param_1->combatEnt)) {
    bVar1 = param_1->combatEnt->AtkType;
    param_1->combatEnt->AtkType = 1;
    func_80060a88(param_1);
    func_80061dfc(param_1);
    combat_AiScores_quicksort(false);
    param_1->combatEnt->AtkType = bVar1;
    param_1->unk0x7 = 0;
  }
  else {
    if (param_1->combatEnt->AtkType == 1) {
      func_800609bc(param_1);
      func_8006193c(param_1);
      param_1->unk0x7 = 1;
    }
    else {
      func_80060db0(param_1);
      if (combat_AiScore_tally == 0) {
        combat_aiscores_free();
        func_8006228c(param_1);
      }
      else {
        combat_AiScores_quicksort(true);
        bVar2 = combat_AiScores_pointer->spell_pri == 0;
        if (bVar2) {combat_AiScores_moveEntry();}
        func_80061d10(param_1,(u32)bVar2);
        combat_AiScores_quicksort(bVar2);
      }
    }
  }
  return;
}

void func_800624bc(combat_ai *param_1){
  func_800609bc(param_1);
  func_80061dfc(param_1);
  combat_AiScores_quicksort(false);
}

void func_800624f0(combat_ai* param_1){
  if (!func_80062230(param_1)) {
    combat_aiscores_free();
    func_8006228c(param_1);
  }
}

void func_8006252c(combat_ai *param_1){
  if (!func_80062230(param_1)) {
    combat_aiscores_free();
    func_80060a88(param_1);
    if (combat_AiScore_tally == 0) {
      combat_aiscores_free();
      func_800622c4(param_1);
      param_1->unk0x7 = 0;
    }
    else {
      func_80061dfc(param_1);
      combat_AiScores_quicksort(false);
      param_1->unk0x7 = 0;
    }
  }
  return;
}



void func_800625a4(combat_ai *param_1){
  if (!func_80062230(param_1)) {
    combat_aiscores_free();
    func_800623bc(param_1);
  }
}

void func_800625e0(combat_ai *param_1){
  if (!func_80062230(param_1)) {
    combat_aiscores_free();
    func_800624bc(param_1);
  }
}


void func_8006261c(combat_ai *param_1){

  if (!func_80062230(param_1)) {
    combat_aiscores_free();
    func_80060a88(param_1);
    if (combat_AiScore_tally == 0) {
      combat_aiscores_free();
      func_800609bc(param_1);
    }
    func_80061dfc(param_1);
    combat_AiScores_quicksort(false);
    param_1->unk0x7 = 0;
  }
  return;
}


void func_8006268c(combat_ai *param_1){
  u8 bVar1;
  bool bVar2;
  
  if (!func_80062230(param_1)) {
    combat_aiscores_free();
    if (!func_80068358(param_1->combatEnt)) {
      bVar1 = param_1->combatEnt->AtkType;
      param_1->combatEnt->AtkType = 1;
      func_80060a88(param_1);
      func_80061dfc(param_1);
      combat_AiScores_quicksort(false);
      param_1->combatEnt->AtkType = bVar1;
      param_1->unk0x7 = 0;
    }
    else {
      if (param_1->combatEnt->AtkType == 1) {
        func_800609bc(param_1);
        func_8006193c(param_1);
        param_1->unk0x7 = '\x01';
      }
      else {
        func_80060db0(param_1);
        if (combat_AiScore_tally == 0) {
          combat_aiscores_free();
          func_800609bc(param_1);
          func_8006193c(param_1);
        }
        else {
          combat_AiScores_quicksort(true);
          if (combat_AiScores_pointer->spell_pri == 0) {
            combat_AiScores_moveEntry();
          }
          func_80061d10(param_1,1);
          combat_AiScores_quicksort(true);
        }
      }
    }
  }
  return;
}

void combatAI_run_cmd(combat_ai *param_1,u8 *param_2,u8 *param_3){
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
    pCVar1 = param_1->combatEnt->CharSheet;
    pCVar1->currSpell = BYTE_ARRAY_800ef6e0[(u8)(bVar5 - 1)];
    pCVar1->spellSwitch = BYTE_ARRAY_800ef6e8[pcVar3->unk0x3];
  }
  *param_2 = pcVar3->x;
  *param_3 = pcVar3->y;
  combat_aiscores_free();
  if (((param_1->combatEnt->index == gGlobals.ShadowIndex) &&
      (HasHornOfKynon())) &&
     (pCVar2 = combatPointer->combatEnts, pCVar2)) {
    *param_2 = get_combatEnt_x(pCVar2);
    *param_3 = get_combatEnt_y(pCVar2);;
  }
  return;
}


void func_800628cc(combat_ai *param_1)

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
  
  pCVar4 = combatPointer;
  pcVar2 = combatPointer->substruct2;
  pCVar1 = param_1->combatEnt->CharSheet;
  pcVar13 = &combatPointer->substruct;
  pTVar6 = getSpell(pCVar1);
  if ((pTVar6) && (GetIDIndex(pTVar6->id) == fireball)) {
    uVar14 = (u32)pTVar6->range * check_spell_wizard(pCVar1,pTVar6);
    bVar9 = get_combatEnt_x(param_1->combatEnt);
    uVar10 = get_combatEnt_y(param_1->combatEnt);
    fVar21 = combatPointer->floatA;
    uStack84 = 0;
    if (INT_MAX_f <= fVar21) {fVar21 = fVar21 - INT_MAX_f;}
    fVar22 = combatPointer->FloatB;
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
          bVar11 = func_80070ee4(pcVar13,(char)((u32)(iVar20 * 0x1000000) >> 0x18),Y,1);
          iVar20 = uVar3 + 1;
          if (bVar11 == false) {
            sVar8 = sub_square_add_sqrt(bVar9,uVar10,(u8)(uVar3 & 0xff),Y);
            pCVar5 = combatPointer;
            if (sVar8 <= (s32)uVar14) {
              Ent = param_1->combatEnt;
              combatPointer->floatA = (float)uVar3;
              pCVar5->FloatB = (float)uVar19;
              func_80072454(pcVar2 + 1,Ent);
              if (pCVar4->substruct2[1].arrayBCount != 0) {
                uVar18 = 0;
                uVar17 = 0;
                if (combatPointer->EntCount != 0) {
                  iVar15 = 0;
                  do {
                    if (*(s32 *)((s32)pcVar2[1].arrayA + iVar15) != 0) {
                      bVar11 = CombatEnt_flag_4(combatPointer->combatEnts[uVar18]));
                      bVar12 = CombatEnt_flag_4(param_1->combatEnt);
                      cVar16 = (char)uVar17 + -1;
                      if (bVar11 != bVar12) {cVar16 = (char)uVar17 + '\x01';}
                      uVar17 = SEXT14(cVar16);
                    }
                    uVar18++;
                    iVar15 = uVar18 << 2;
                  } while (uVar18 < combatPointer->EntCount);
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
    pCVar4 = combatPointer;
    combatPointer->floatA = (float)uStack72;
    pCVar4->FloatB = (float)uStack68;
  }
  return;
}

void func_80062c04(Vec2 *param_1,float param_2,Vec2 *param_3,Vec2 *param_4,Vec2 *param_5){
  Vec2 *pafVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  Vec2 *fStack176;
  Vec2 *fStack112;
  
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

bool func_80062e14(u32 param_1,u32 param_2,u8 *param_3,u8 *param_4,undefined param_5)

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
  pcVar8 = &combatPointer->substruct;
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
        bVar6 = func_8007102c(pcVar8,(u8)uVar16,(u8)uVar14,uVar1,bVar2);
        if ((bVar6 == false) || (lVar3 = func_80070fa0(pcVar8,uVar1,bVar2,param_5), lVar3 == 0)) {
          func_8007102c(pcVar8,(u8)uVar16,(u8)uVar14,uVar1,bVar2);
          func_80070fa0(pcVar8,uVar1,bVar2,param_5);
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
        bVar6 = func_8007102c(pcVar8,(u8)uVar16,(u8)uVar14,uVar1,bVar2);
        if ((bVar6 == false) || (lVar3 = func_80070fa0(pcVar8,uVar1,bVar2,param_5), lVar3 == 0)) {
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

void func_800631c8(combat_ai *param_1){
  s8 sVar3 = func_800720f8(&combatPointer->substruct,get_combatEnt_x(param_1->combatEnt),get_combatEnt_y(param_1->combatEnt),
          (&combatPointer->unk0x5320)[(char)param_1->unk0x12 * 2]);
  set_combatEnt_vec2(param_1->combatEnt,sVar3);
  param_1->combatEnt->unk0x14 = sVar3;
}

void ofunc_NOOP(void){}



bool func_80063258(combat_ai *param_1)

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
  Vec2 afStack328;
  Vec2 afStack264;
  Vec2 afStack200;
  Vec2 fStack136;
  
  ppVar1 = gGlobals.playerDataArray[param_1->combatEnt->index];
  bVar2 = false;
  if (ppVar1) {
    bVar3 = false;
    bStack336[0] = 0;
    bStack336[1] = 0;
    bStack336[2] = 0;
    bStack336[3] = 0;
    pcVar10 = &combatPointer->substruct;
    get_combatEnt_x_y(param_1->combatEnt,bStack336,bStack336 + 1);
    func_800714d0(pcVar10,bStack336[0],bStack336[1],param_1->combatEnt->unk0x23);
    bVar7 = param_1->unk0x12;
    if (param_1->unk0x12 < param_1->unk0x13) {
      uVar12 = 0;
      dVar11 = 0.5d;
      do {
        iVar4 = (CombatStruct *)(&combatPointer->unk0x0 + ((s32)((u32)bVar7 << 0x18) >> 0x17));
        bStack336[2] = iVar4->unk0x5320;
        bStack336[3] = iVar4->unk0x5321;
        if (func_80070fa0(pcVar10,bStack336[2]) == 0) {
          bVar2 = true;
          bVar6 = func_80062e14((u32)bStack336[0],(u32)bStack336[1],bStack336 + 2,bStack336 + 3,param_1->combatEnt->unk0x23);
          if (bVar6 == false) break;
        }
        if (func_8007102c(pcVar10,bStack336[0],bStack336[1],bStack336[2],bStack336[3]) == false) {
          bVar2 = true;
          bVar6 = func_80062e14((u32)bStack336[0],(u32)bStack336[1],bStack336 + 2,bStack336 + 3,
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
          func_80062c04(afStack200,(float)(u32)param_1->combatEnt->move_length,
                       afStack328,afStack264,fStack136);
          if (lVar4 == 0) break;
          if ((float)uVar12 < fStack136[0]) {bStack336[2] = (u8)(s32)((double)fStack136[0] + dVar11);}
          else {bStack336[2] = -(char)(s32)(dVar11 - (double)fStack136[0]);}
          if ((float)uVar12 < fStack136[1]) {bStack336[3] = (u8)(s32)((double)fStack136[1] + dVar11);}
          else {bStack336[3] = -(char)(s32)(dVar11 - (double)fStack136[1]);}
        }
        sVar9 = func_800720f8(&combatPointer->substruct,bStack336[0],bStack336[1],bStack336[2]);
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
    func_800713fc(pcVar10,bStack336[0],bStack336[1],(u32)param_1->combatEnt->unk0x23);
    if (bVar3) {
      set_combatEnt_x_y(param_1->combatEnt,(float)(u32)bStack336[0],(float)(u32)bStack336[1]);
      gGlobals.combatBytes[1] = gGlobals.combatBytes[0];
      gGlobals.combatBytes[0] = 5;
      combatPointer->unk0x4fbc = 0xf0;
      return true;
    }
    func_800631c8(param_1);
  }
  return false;
}

void Ai_swap_weapons(combat_ai *param_1){
  CombatEntity *pCVar1;
  CharSheet *pCVar2;
  Temp_weapon *pTVar3;
  
  if (param_1->weapon) {
    pCVar1 = param_1->combatEnt;
    pCVar2 = pCVar1->CharSheet;
    pTVar3 = pCVar2->weapons;
    pCVar2->weapons = param_1->weapon;
    param_1->weapon = pTVar3;
    get_weapon_sheild_borg5(pCVar1);
    sprintf(gGlobals.text,combatPointer->textArray->they swap weapons,pCVar2->name);
    copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
    func_80029ba8();
    pTVar3 = pCVar2->weapons;
    if ((isBreathSpitOrSpikes(pTVar3)) && (pTVar3->range != 0)) {param_1->combatEnt->AtkType = 4;}
  }
}

bool ai_should_swap_weapons(combat_ai *param_1)

{
  CharSheet *pCVar1;
  Temp_weapon *pTVar2;
  bool bVar3;
  char cVar4;
  bool bVar5;
  
  pCVar1 = param_1->combatEnt->CharSheet;
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
  func_80072454(combatPointer->substruct2,param_1->combatEnt);
  func_80072454(combatPointer->substruct2 + 1,param_1->combatEnt);
  return bVar5;
}

void combat_ai_shadow(combat_ai *param_1){
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
  Vec2 afStack304;
  Vec2 afStack240;
  Vec2 afStack176;
  Vec2 fStack112;
  
  if ((param_1->combatEnt->move_length != 1) && (gGlobals.ShadowIndex != -1)) {
    pCVar1 = (&combatPointer->combatEnts)[(u8)gGlobals.ShadowIndex];
    x = get_combatEnt_x_f(pCVar1);
    y = get_combatEnt_y_f(pCVar1);
    setVec2(afStack176,x,y);
    iVar4 = (CombatStruct *)(&combatPointer->unk0x0 + (char)param_1->unk0x12 * 2);
    setVec2(afStack304,(float)(s32)(char)iVar4->unk0x5320,
            (float)(s32)(char)iVar4->unk0x5321);
    uVar6 = (s32)(char)param_1->unk0x12 + 1;
    if (uVar6 < param_1->unk0x13) {
      iVar5 = uVar6 * 2;
      uVar8 = 0;
      dVar7 = 0.5d;
      do {
        iVar3 = &combatPointer->unk0x0 + iVar5;
        setVec2(afStack240,(float)(s32)*(char *)(iVar3 + 0x5320),(float)(s32)*(char *)(iVar3 + 0x5321));
        lVar2 = (longlong)(s32)fStack112;
        func_80062c04(afStack176,10.0,afStack304,afStack240,fStack112);
        if (lVar2 != 0) {
          param_1->unk0x13 = (char)uVar6 + 1;
          if ((float)uVar8 < fStack112[0]) {
            (&combatPointer->unk0x5320)[iVar5] = (u8)(s32)((double)fStack112[0] + dVar7);
          }
          else {
            (&combatPointer->unk0x5320)[iVar5] = -(char)(s32)(dVar7 - (double)fStack112[0]);
          }
          if (fStack112[1] <= (float)uVar8) {
            (&combatPointer->unk0x5321)[iVar5] = -(char)(s32)(dVar7 - (double)fStack112[1]);
            return;
          }
          (&combatPointer->unk0x5321)[iVar5] = (u8)(s32)((double)fStack112[1] + dVar7);
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

bool func_80063af4(combat_ai *param_1,u8 param_2,u8 param_3){
  bool bVar1;

  param_1->unk0x13 = func_80071ec4(&combatPointer->substruct,get_combatEnt_x(param_1->combatEnt),get_combatEnt_y(param_1->combatEnt),
   param_2,param_3,param_1->combatEnt->unk0x23,(u8 (*) [2])&combatPointer->unk0x5320);
  bVar1 = param_1->unk0x13 < get_byte_E(&combatPointer->substruct);
  if (bVar1) {
    param_1->unk0x12 = 0;
    combat_ai_shadow(param_1);
  }
  return bVar1;
}

bool func_80063bbc(combat_ai *param_1){
  playerData *ppVar1;
  referncepoint_obj *prVar2;
  bool bVar3;
  float fVar4;
  float fVar5;
  float afStack32;
  
  afStack32 = 0.0;
  ppVar1 = gGlobals.playerDataArray[param_1->combatEnt->index];
  if ((ppVar1 == NULL) ||
     (prVar2 = find_fleeing_refpoint(param_1,&afStack32), prVar2 == NULL)) 
      {bVar3 = false;}
  else {
    bVar3 = false;
    if (afStack32 <= 2.25f) {
      func_80063db0(param_1,get_combatEnt_x_f(param_1->combatEnt),get_combatEnt_y_f(param_1->combatEnt),
      (prVar2->header).coords[0],(prVar2->header).coords[2],1.0f,ppVar1);
      bVar3 = true;
    }
  }
  return bVar3;
}

bool func_80063c94(combat_ai *param_1){
  CombatEntity *pCVar1;
  playerData *ppVar2;
  playerData *ppVar3;
  float fVar4;
  float fVar5;
  
  if ((param_1->entIndex != -1) &&
     (pCVar1 = (&combatPointer->combatEnts)[param_1->entIndex], pCVar1)) {
    ppVar2 = gGlobals.playerDataArray[param_1->combatEnt->index];
    if (ppVar2 == NULL) {return false;}
    ppVar3 = gGlobals.playerDataArray[pCVar1->index];
    if (ppVar3 == NULL) {return false;}
    fVar4 = get_combatEnt_proximity(pCVar1,param_1->combatEnt);
    fVar5 = ppVar2->scale_floatB + ppVar3->scale_floatB;
    if (fVar4 <= fVar5 + 2.25f) {
      if (fVar4 == 0.0) {
        func_80064714(param_1);
        return true;
      }
      func_80063db0(param_1,(ppVar2->collision).position[0],(ppVar2->collision).position[2],
                   (ppVar3->collision).position[0],(ppVar3->collision).position[2],
                   (fVar4 - fVar5) / fVar4,ppVar2);
      return true;
    }
  }
  return false;
}

void func_80063db0(combat_ai *param_1,float param_2,float param_3,float param_4,float param_5,
                 float param_6,playerData *param_7){
  combat_substruct *pcVar3;
  Vec2 fStack240;
  Vec2 afStack176;
  Vec2 afStack112;
  
  setVec2(afStack176,param_2,param_3);
  setVec2(afStack112,param_4,param_5);
  Vec2_Sub(fStack240,afStack112,afStack176);
  multiVec2(fStack240,param_6);
  vec2_sum(fStack240,fStack240,afStack176);
  SetPlayerToMoveQueue(param_7,fStack240[0],fStack240[1],param_7->scale_floatB);
  pcVar3 = &combatPointer->substruct;
  func_800714d0(pcVar3,get_combatEnt_x(param_1->combatEnt),get_combatEnt_y(param_1->combatEnt),param_1->combatEnt->unk0x23);
  set_combatEnt_x_y(param_1->combatEnt,fStack240[0],fStack240[1]);
  func_800713fc(pcVar3,get_combatEnt_x(param_1->combatEnt),get_combatEnt_y(param_1->combatEnt),(u32)param_1->combatEnt->unk0x23);
  gGlobals.combatBytes[1] = gGlobals.combatBytes[0];
  gGlobals.combatBytes[0] = 5;
  combatPointer->unk0x4fbc = 0xf0;
  return;
}

bool func_80063f1c(combat_ai *param_1,u8 param_2,undefined param_3){
  bool bVar1;
  bool bVar2;
  
  bVar1 = func_80063af4(param_1,param_2,param_3);
  bVar2 = false;
  if (bVar1 == false) {
    if (ai_check_entFlag_4(param_1) == 0) {
      bVar1 = func_80063c94(param_1);
      bVar2 = true;
      if (bVar1 == false) {
        func_80064714(param_1);
        bVar2 = true;
      }
    }
    else {
      bVar1 = func_80063bbc(param_1);
      bVar2 = true;
      if (bVar1 == false) {
        func_800645b4(param_1);
        bVar2 = true;
      }
    }
  }
  return bVar2;
}

referncepoint_obj * find_fleeing_refpoint(combat_ai *param_1,float *param_2)

{
  CombatEntity *pCVar1;
  referncepoint_obj *prVar2;
  u32 uVar3;
  referncepoint_obj *prVar4;
  float fVar5;
  float y;
  Vec2 afStack304;
  Vec2 afStack240;
  char acStack176 [16];
  Vec2 afStack112;
  
  prVar4 = NULL;
  uVar3 = 0;
  pCVar1 = param_1->combatEnt;
  *param_2 = 100000.0f;
  setVec2(afStack304,get_combatEnt_x_f(pCVar1),get_combatEnt_y_f(pCVar1));
  do {
    sprintf(acStack176,combatPointer->textArray->flee_d,uVar3);
    prVar2 = FindReferncePointName(gGlobals.Sub.borg9DatPointer,acStack176,false);
    if (prVar2) {
      setVec2(afStack112,(prVar2->header).coords[0],(prVar2->header).coords[2]);
      fVar5 = get_vec2_proximity(afStack112,afStack304);
      if (fVar5 <= *param_2) {
        copyVec2(afStack112,afStack240);
        *param_2 = fVar5;
        prVar4 = prVar2;
      }
    }
    uVar3++;
  } while (uVar3 < 8);
  return prVar4;
}

bool func_800640f8(combat_ai *param_1,u8 param_2,u8 param_3,undefined *param_4,
                 undefined *param_5,float *param_6){
  referncepoint_obj *prVar1;
  bool bVar2;
  undefined uVar3;
  float fVar4;
  
  prVar1 = find_fleeing_refpoint(param_1,param_6);
  if (prVar1 == NULL) {bVar2 = false;}
  else {
    fVar4 = (prVar1->header).coords[0];
    if (fVar4 < INT_MAX_f) {*param_4 = (char)(s32)fVar4;}
    else {*param_4 = (char)(s32)(fVar4 - INT_MAX_f);}
    fVar4 = (prVar1->header).coords[2];
    if (fVar4 < INT_MAX_f) {uVar3 = (undefined)(s32)fVar4;}
    else {uVar3 = (undefined)(s32)(fVar4 - INT_MAX_f);}
    *param_5 = uVar3;
    bVar2 = true;
  }
  return bVar2;
}

bool func_800641b8(combat_ai *param_1,s32 param_2,s32 param_3){
  char cVar1;
  u8 uVar2;
  bool bVar3;
  bool uVar4;
  float afStack32 [8];
  
  cVar1 = get_combatEnt_x(param_1->combatEnt);
  uVar2 = get_combatEnt_y(param_1->combatEnt);
  afStack32[0] = 0.0;
  bVar3 = func_800640f8(param_1,get_combatEnt_x(param_1->combatEnt),get_combatEnt_y(param_1->combatEnt),param_2,param_3,afStack32);
  if (bVar3 == false) {
    param_1->flags &= 0xfe;
    uVar4 = func_800642c4(param_1,param_2,param_3);
  }
  else {
    sprintf(gGlobals.text,combatPointer->textArray->they flee,param_1->combatEnt->CharSheet->name);
    copy_string_to_combat_textbox(combatPointer,gGlobals.text,0);
    uVar4 = afStack32[0] < 1.5f;
    if (uVar4) {
      combat_escape_func(param_1->combatEnt);
      func_80029ba8();
    }
  }
  return uVar4;
}

bool func_800642c4(combat_ai *param_1,u8 *param_2,u8 *param_3){
  char cVar1;
  s8 uVar2;
  bool bVar3;
  
  cVar1 = get_combatEnt_x(param_1->combatEnt);
  uVar2 = get_combatEnt_y(param_1->combatEnt);
  combatAI_run_cmd(param_1,param_2,param_3);
  bVar3 = false;
  if ((cVar1 == *param_2) &&(bVar3 = false, uVar2 == *param_3)) {
    func_80064714(param_1);
    bVar3 = true;
  }
  return bVar3;
}

bool func_80064358(combat_ai *param_1){
  bool bVar1;
  
  func_800628cc(param_1);
  bVar1 = func_80064a78(param_1);
  if (bVar1 == false) {func_80029ba8();}
  return bVar1 == false;
}

bool func_80064398(combat_ai *param_1){
  CombatEntity *pCVar1;
  bool bVar2;
  bool bVar3;
  
  NOOP_8005ff90();
  combatPointer->some_index = param_1->entIndex;
  pCVar1 = (&combatPointer->combatEnts)[param_1->entIndex];
  if (param_1->unk0x4 == '\x02') {
    bVar2 = ai_should_cast_magic(param_1->combatEnt,pCVar1);
    bVar3 = true;
    if (bVar2 == false) {
      bVar2 = func_checking_shadow(param_1->combatEnt,pCVar1,0);
      bVar3 = false;
      if (bVar2) {bVar3 = true;}
    }
  }
  else {
    if (func_checking_shadow(param_1->combatEnt,pCVar1,0) == false) {
      bVar2 = ai_should_cast_magic(param_1->combatEnt,pCVar1);
      bVar3 = true;
      if (bVar2 == false) {bVar3 = false;}
    }
    else {bVar3 = true;}
  }
  return bVar3;
}

void ai_adjust_combatent_facing(combat_ai *param_1)
  {adjust_combatent_facing(param_1->combatEnt,(&combatPointer->combatEnts)[param_1->entIndex]);}

void func_80064494(combat_ai *param_1){
  u8 bVar1;
  char cVar2;
  bool bVar3;
  float x;
  float y;
  u8 uStack24 [2];
  
  func_80070234(param_1->combatEnt);
  combatEnt_coords2_is_coords(param_1->combatEnt);
  uStack24[0] = 0;
  uStack24[1] = 0;
  if (ai_check_entFlag_4(param_1) == 0) {cVar2 = func_800642c4(param_1,uStack24,uStack24 + 1);}
  else {
    setVec2(&combatPointer->entity_XY,get_combatEnt_x_f(param_1->combatEnt),get_combatEnt_y_f(param_1->combatEnt));
    cVar2 = func_800641b8(param_1,uStack24,uStack24 + 1);
  }
  if (((cVar2 == 0) && (func_80063f1c(param_1,uStack24[0],uStack24[1]) == false))
     && (func_80063258(param_1) == false)) {
    if (ai_check_entFlag_4(param_1) == 0)
      {if (func_80063c94(param_1)) {return;}}
    else
      {if (func_80063bbc(param_1)) {return;}
      func_800645b4(param_1);
    }
    func_80064714(param_1);
  }
  return;
}

void func_800645b4(combat_ai *param_1){
  bool bVar1;
  u8 bVar3;
  s32 iVar2;
  u8 uVar4;
  u8 uVar5;
  bool bVar6;
  float fVar7;
  float y;
  u8 uStack104 [2];
  Vec2 afStack96;
  float afStack32 [8];
  
  func_80070234(param_1->combatEnt);
  if (ai_check_entFlag_4(param_1) == 0) {func_80064714(param_1);}
  else {
    bVar1 = false;
    iVar2 = param_1->unk0x18 - 1;
    param_1->unk0x18 = iVar2;
    if (iVar2 == 0) {
      bVar1 = true;
      combat_escape_func(param_1->combatEnt);
    }
    else {
      afStack32[0] = 0.0;
      uStack104[0] = 0;
      uStack104[1] = 0;
      uVar4 = get_combatEnt_x(param_1->combatEnt);
      uVar5 = get_combatEnt_y(param_1->combatEnt);
      if ((func_800640f8(param_1,uVar4,uVar5,uStack104,uStack104 + 1,afStack32)) && (afStack32[0] <= 1.5f)) {
        bVar1 = true;
        combat_escape_func(param_1->combatEnt);
      }
    }
    if (!bVar1) {
      setVec2(afStack96,get_combatEnt_x_f(param_1->combatEnt),get_combatEnt_y_f(param_1->combatEnt));
      fVar7 = get_vec2_proximity(afStack96,&combatPointer->entity_XY);
      if (fVar7 < 1.0f) {combat_escape_func(param_1->combatEnt);}
    }
    func_80029ba8();
  }
  return;
}

void func_80064714(combat_ai *param_1){
  if (((param_1->unk0x7 == param_1->unk0x4) ||
      (ai_should_swap_weapons(param_1) == false)) &&(func_80064358(param_1) == false)) {
    if (func_80064398(param_1) == false) {func_80029ba8();}
    else {ai_adjust_combatent_facing(param_1);}
  }
}

bool elemental_in_combat(void){
  u32 uVar2;
  combat_substruct_2 *pcVar3;
  
  uVar2 = 0;
  pcVar3 = combatPointer->substruct2 + 1;
  if (combatPointer->EntCount != 0) {
    do {
      if (((pcVar3->arrayA[0] != 0) && ((&combatPointer->combatEnts)[uVar2]))
         && (IsElemental((&combatPointer->combatEnts)[uVar2]->CharSheet->ID))) {
        return true;
      }
      uVar2++;
      pcVar3 = (combat_substruct_2 *)(pcVar3->arrayA + 1);
    } while (uVar2 < combatPointer->EntCount);
  }
  return false;
}

bool zombie_in_combat(void){
  ItemID IVar1;
  combat_substruct_2 *pcVar2;
  CombatEntity **ppCVar3;
  u32 uVar4;
  
  uVar4 = 0;
  pcVar2 = combatPointer->substruct2 + 1;
  if (combatPointer->EntCount != 0) {
    ppCVar3 = &combatPointer->combatEnts;
    do {
      if (((pcVar2->arrayA[0] != 0) && (*ppCVar3)) &&
         ((IVar1 = (*ppCVar3)->CharSheet->ID, IVar1 == (ItemID)(entityList[190] | 0x200) ||
          (IVar1 == (ItemID)(entityList[182] | 0x200))))) {
        return true;
      }
      ppCVar3++;
      uVar4++;
      pcVar2 = (combat_substruct_2 *)(pcVar2->arrayA + 1);
    } while (uVar4 < combatPointer->EntCount);
  }
  return false;
}

bool IsSomeonePoisoned(void){
  effects *peVar1;
  u32 uVar2;
  combat_substruct_2 *pcVar3;
  CombatEntity **ppCVar4;
  u32 uVar5;
  
  uVar5 = 0;
  pcVar3 = combatPointer->substruct2 + 1;
  if (combatPointer->EntCount != 0) {
    ppCVar4 = &combatPointer->combatEnts;
    do {
      if ((pcVar3->arrayA[0] != 0) && (*ppCVar4)) {
        uVar2 = 0;
        peVar1 = (*ppCVar4)->CharSheet->effects;
        do {
          uVar2++;
          if ((peVar1->list[0]) && (peVar1->list[0]->index == poison)) {
            return true;
          }
          peVar1 = (effects *)(peVar1->list + 1);
        } while (uVar2 < 0xf);
      }
      ppCVar4++;
      uVar5++;
      pcVar3 = (combat_substruct_2 *)(pcVar3->arrayA + 1);
    } while (uVar5 < combatPointer->EntCount);
  }
  return false;
}

bool func_80064948(combat_ai *param_1){
  u8 bVar1;
  combat_substruct_2 *pcVar2;
  combat_substruct_2 *pcVar3;
  
  pcVar3 = combatPointer->substruct2;
  pcVar2 = combatPointer->substruct2;
  if (param_1->entIndex != -1){
    if (pcVar3->arrayA[param_1->entIndex] != 0) {
      clear_substruct2_arrayB(pcVar3);
      func_8007231c(pcVar3,(u32)param_1->entIndex);
      goto LAB_800649cc;
    }
  }
  if (bVcombatPointer->substruct2[0].unk0xa3ar1 == 0) {return false;}
  if (combatPointer->substruct2[0].arrayBCount == 0) {return false;}
  param_1->entIndex = combatPointer->substruct2[0].entindex;
LAB_800649cc:
  clear_combat_substruc2(pcVar2 + 1);
  return true;
}

bool func_800649f8(combat_ai *param_1){
  char cVar1;
  combat_substruct_2 *pcVar2;
  
  cVar1 = param_1->entIndex;
  pcVar2 = combatPointer->substruct2;
  if (((cVar1 == -1) || (combatPointer->substruct2[1].arrayA[cVar1] == 0)) ||
     (combatPointer->substruct2[1].arrayB[cVar1] == 0)) {
    if (combatPointer->substruct2[1].unk0xa3 == 0) {return false;}
    if (combatPointer->substruct2[1].arrayBCount == 0) {return false;}
    param_1->entIndex = combatPointer->substruct2[1].entindex;
  }
  clear_combat_substruc2(pcVar2);
  return true;
}

bool func_80064a78(combat_ai *param_1){
  bool bVar1;
  bool uVar2;
  
  func_80070234(param_1->combatEnt);
  func_80072454(combatPointer->substruct2,param_1->combatEnt);
  func_80072454(combatPointer->substruct2 + 1,param_1->combatEnt);
  if (param_1->unk0x4 == '\x02') {
    bVar1 = func_800649f8(param_1);
    uVar2 = true;
    if (bVar1 == false) {uVar2 = func_80064948(param_1);}
  }
  else {
    if (func_80064948(param_1) == false) {uVar2 = func_800649f8(param_1) != false;}
    else {uVar2 = true;}
  }
  return uVar2;
}

void ai_clear_ent_index(combat_ai *param_1){
  param_1->entIndex = -1;
  param_1->unk0x12 = 0xff;
  param_1->unk0x13 = 0;
}

u8 ai_check_entFlag_4(combat_ai *param_1){
 u8 bVar2;
  

  if (CombatEnt_flag_4(param_1->combatEnt) == false) {bVar2 = 0;}
  else {bVar2 = param_1->flags & 1;}
  return bVar2;
}

void func_80064b64(combat_ai *param_1){
  if ((CombatEnt_flag_7(param_1->combatEnt) == 0) && (combatPointer->refpoints_flee_flag != 0)) {
    param_1->unk0x18 = 4;
    param_1->flags |= 1;
  }
}

