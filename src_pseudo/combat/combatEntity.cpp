#define FILENAME "../combatengine/combatEntity.cpp"


#include "combat/CombatEntity.h"
#include "globals.h"

void Ofunc_NOOP_80067c70(void){}
void Ofunc_NOOP_(void){}


void CombatEntity::Init(CombatEntity *param_1,CharSheet *charsheet,int param_3,u8 startx,
                       u8 starty,s8 param_6,byte param_7,int isAI,byte index){
  ItemID IVar1;
  SpellBook *pSVar2;
  SpellInstance *pSVar3;
  Entity_Ram *pEVar4;
  byte bVar8;
  u8 bVar9;
  u8 X;
  u8 Y;
  ElementEnum *pEVar5;
  CombatAI_s *pCVar6;
  int iVar7;
  float *pfVar10;
  uint uVar11;
  uint uVar12;
  resist_float *prVar13;
  float *pfVar14;
  float fVar15;
  
  CLEAR(param_1);
  param_1->charSheetP = charsheet;
  bVar8 = GetIDIndex(charsheet->ID);
  (param_1->coord2).x = startx;
  (param_1->coord).x = startx;
  (param_1->coord2).y = starty;
  (param_1->coord).y = starty;
  param_1->unk14 = param_6;
  param_1->unk23 = param_7;
  SetCardinalFacing(param_1,param_6);
  param_1->notboss = gEntityDB->IsNotBoss(charsheet->ID);
  FUN_800713fc(&gCombatP->substruct,GetCoordXU8(param_1),GetCoordYU8(param_1),param_1->unk23);
  pSVar2 = charsheet->spellbook;
  if (((pSVar2) && (pSVar3 = pSVar2->spells, pSVar3 != NULL)) && (pSVar2->count != 0)) {
    iVar7._0_1_ = (pSVar3->base).id.type;
    iVar7._1_1_ = (pSVar3->base).id.ID;
    iVar7._2_2_ = (pSVar3->base).field1_0x2;
    if (iVar7 == 0) {
      pSVar2 = charsheet->spellbook;
      uVar12 = 0;
      while (uVar11 = uVar12 + 1, uVar11 < pSVar2->count) {
        if ((&(pSVar2->spells->base).name)[uVar12] != NULL) {
          param_1->charSheetP->spellSwitch = 1;
          param_1->charSheetP->currSpell = (byte)uVar11;
          break;
        }
        uVar12 = uVar11;
        pSVar2 = charsheet->spellbook;
      }
    }
    else {
      param_1->charSheetP->spellSwitch = 1;
      param_1->charSheetP->currSpell = 0;
    }
  }
  pfVar14 = &param_1->resists[0].percent;
  uVar12 = 0;
  prVar13 = param_1->resists;
  pEVar4 = gEntityDB->entities;
  pfVar10 = pEVar4[(char)bVar8].resistAmmount;
  do {
    pEVar5 = pEVar4[(char)bVar8].Resist + uVar12;
    uVar12 += 1;
    prVar13->element = *pEVar5;
    fVar15 = *pfVar10;
    pfVar10 = pfVar10 + 1;
    prVar13 = prVar13 + 1;
    *pfVar14 = fVar15;
    pfVar14 = pfVar14 + 2;
  } while (uVar12 < 2);
  param_1->flags = COMBATENT_CANMOVE;
  if (isAI)
    param_1->flags = COMBATENT_CANMOVE|COMBATENT_ALLY|COMBATENT_ENEMY;
  param_1->index = index;
  if (isAI) {
    ALLOC(param_1->aiP,0xcc);
    CombatAIInfo::Init(param_1->aiP,param_1->charSheetP->ID,param_1);
  }
  param_1->shieldLocator = 2;
  param_1->TargetIndex = -1;
                    // check for Shadow and horn
  if (((ItemID)(entityList[172] + 0x200) == param_1->charSheetP->ID) &&(HasHornOfKynon())) {
    iVar7 = CharStats::getBase(param_1->charSheetP->Stats,STAT_DEX);
    if (0 < 30 - iVar7) {
      CharStats::addBase(param_1->charSheetP->Stats,STAT_DEX,30 - iVar7);
    }
  }
}

void CombatEntity::FreeAi(CombatEntity *param_1){
  if (param_1->aiP) {
    CombatAIInfo::Free(param_1->aiP);
    FREE(param_1->aiP,0xf0);
  }
}

void CombatEntity::GetCoordU8(CombatEntity *param_1,u8 *x,u8 *y){
  *x = GetCoordXU8(param_1);
  *y = GetCoordYU8(param_1);
}


void CombatEntity::GetCoord(CombatEntity *param_1,float *x,float *y){
  *x = (param_1->coord).x;
  *y = (param_1->coord).y;
}

void CombatEntity::GetCoord2(CombatEntity *param_1,float *x,float *y){
  *x = (param_1->coord2).x;
  *y = (param_1->coord2).y;
}

u8 CombatEntity::GetCoordXU8(CombatEntity *param_1){
  if(param_1->coord.x<=0.0) return -(.5-param_1->coord.x);
  return (.5+param_1->coord.x);
}

u8 CombatEntity::GetCoordYU8(CombatEntity *param_1){
  if(param_1->coord.y<=0.0) return -(.5-param_1->coord.y);
  return (.5+param_1->coord.y);
}

u8 CombatEntity::GetCoord2XU8(CombatEntity *param_1){
    if(param_1->coord2.x<=0.0) return -(.5-param_1->coord2.x);
  return (.5+param_1->coord2.x);
}

u8 CombatEntity::GetCoord2YU8(CombatEntity *param_1){
    if(param_1->coord2.y<=0.0) return -(.5-param_1->coord2.y);
  return (.5+param_1->coord2.y);
}

float CombatEntity::GetCoordX(CombatEntity *param_1){return param_1->coord.x;}
float CombatEntity::GetCoordY(CombatEntity *param_1){return param_1->coord.y;}
float CombatEntity::GetCoord2X(CombatEntity *param_1){return param_1->coord2.x;}
float CombatEntity::GetCoord2Y(CombatEntity *param_1){return param_1->coord2.y;}


void CombatEntity::SetCoords(CombatEntity *param_1,float x,float y){
  (param_1->coord).x = x;
  (param_1->coord).y = y;
}


void set_combatEnt_z_f3(CombatEntity *param_1,float x,float y){
  param_1->coord2[0] = x;
  param_1->coord2[1] = y;}


/* Used for Casting Magic */
u8 CombatEnt_flag_0(CombatEntity *param_1){return (bool)((u8)param_1->flags & 1);}
//the rest, mostly no clue
u16 CombatEnt_flag_1(CombatEntity *param_1){return param_1->flags >> 1 & 1;}
//troubador related (raised if performer?)
u16 CombatEnt_flag_2(CombatEntity *param_1){return param_1->flags >> 2 & 1;}
u16 CombatEnt_flag_3(CombatEntity *param_1){return param_1->flags >> 3 & 1;}
//this one is friend-or-foe, i think
u16 CombatEnt_flag_4(CombatEntity *param_1){return param_1->flags >> 4 & 1;}
u16 CombatEnt_flag_5(CombatEntity *param_1){return param_1->flags >> 5 & 1;}
u16 CombatEnt_flag_6(CombatEntity *param_1){return param_1->flags >> 6 & 1;}
u16 CombatEnt_flag_7(CombatEntity *param_1){return param_1->flags >> 7 & 1;}

u8 CombatEnt_flag_check(CombatEntity *param_1){return (param_1->flags & (flag8|flag9)) !=0;}
void CombatEnt_OR_flags(CombatEntity *x,Struct_char_flags f){x->flags |= f;}
void CombatEnt_NAND_flags(CombatEntity *x,Struct_char_flags f){x->flags = x->flags& ~f;}
void CombatEnt_XOR_flags(CombatEntity *x,Struct_char_flags f){x->flags ^= f;}

s32 Ofunc_combatEnt_movement(CombatEntity *x){
  s16 sVar2;
  u32 uVar1;
  
  sVar2 = sub_square_add_sqrt(get_combatEnt_x(x),get_combatEnt_y(x),get_combatEnt_z(x),get_combatEnt_f3(x));
  if (x->move_length - sVar2)) < 1) {uVar1 = 0;}
  else {
    sVar2 = sub_square_add_sqrt(get_combatEnt_x(x),get_combatEnt_y(x),get_combatEnt_z(x),get_combatEnt_f3(x));
    uVar1 = x->move_length - sVar2 & 0xff;
  }
  return uVar1;}

void NOOP_80068350(void){}


u8 FUN_80068358(CombatEntity *param_1){
  CombatEntity *pCVar1;
  u32 uVar5;
  
  uVar5 = 0;
  if (gCombatP->EntCount) {
    do {
      pCVar1 = (&gCombatP->combatEnts)[uVar5];
      if ((((pCVar1) && (param_1 != pCVar1)) &&
          (!isDead(pCVar1->charSheetP))) && (CombatEnt_flag_1(pCVar1))) {
        if ((CombatEnt_flag_4(pCVar1) != CombatEnt_flag_4(param_1))
         && (FUN_800692bc(param_1,pCVar1))) {return false;}
      }
      uVar5++;
    } while (uVar5 < gCombatP->EntCount);
  }
  return true;
}

void set_combat_movement(CombatEntity *param_1){
  Temp_enchant *pTVar1;
  u8 bVar4;
  SpellEffect*peVar6;
  u32 uVar7;
  u8 DEX_steps[16]{0,0,0,3,7,12,16,21,26,28,30,33,36,38,0,0};


  NOOP_80068350();
  param_1->move_length = 0;
  while (param_1->move_length < 14) {
    if (CharStats::getModded(param_1->charSheetP->Stats,STAT_DEX) <= (s32)(u32)DEX_steps[param_1->move_length]) break;
    param_1->move_length++;
  }
  uVar7 = 0;
  peVar6 = param_1->charSheetP->spellEffects;
  do {
    pTVar1 = peVar6->list[uVar7];
    if (pTVar1) {
      if (pTVar1->index == stellarGravity) {
        bVar4 = param_1->move_length - pTVar1->lv;
        if (pTVar1->lv < param_1->move_length) {
LAB_80068514:
          param_1->move_length = bVar4;
        }
        else {param_1->move_length = 1;}
      }
      else {
        if (pTVar1->index == haste) {
          bVar4 = param_1->move_length + pTVar1->lv;
          goto LAB_80068514;
        }
      }
    }
    uVar7++;
    if (0xe < uVar7) {
      CombatEnt_NAND_flags(param_1,flag7);
      if (!func_80068358(param_1)) {
        CombatEnt_OR_flags(param_1,flag7);
        bVar4 = param_1->move_length;
        if (1 < bVar4) {bVar4 = 1;}
        param_1->move_length = bVar4;
        if (!CombatEnt_flag_2(param_1)) {bVar4 = param_1->move_length;}
        else {
          FUN_8006f2cc(param_1);
          bVar4 = param_1->move_length;
        }
      }
      else {
        if (!CombatEnt_flag_2(param_1)) {
          if (some_shadow_func(param_1)) {
            if ((param_1 == gCombatP->current_Ent) && (param_1->index != gGlobals.ShadowIndex)){
              Gsprintf(gCombatP->textArray->shadows vortex,param_1->charSheetP->name);
              copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
              print_combat_textbox(gCombatP,gGlobals.text,0);
            }
            param_1->move_length = 1;
          }
        }
        else {
          bVar4 = param_1->move_length;
          if (1 < bVar4) {bVar4 = 1;}
          param_1->move_length = bVar4;
        }
        bVar4 = param_1->move_length;
      }
      if (0xd < bVar4) {
        param_1->move_length = 0xd;
      }
                    /* pocho no move */
      if (param_1->charSheetP->ID == (ItemID)(entityList[171] + 0x200)) {
        param_1->move_length = 0;
      }
      return;
    }
    peVar6 = param_1->charSheetP->spellEffects;
  } while( true );
}

u8 check_combatent_dex(CombatEntity *param_1){
  s32 iVar1;
  s8 cVar3;
  u8 bVar4;
  
  iVar1 = gCombatP->unk0x34;
  NOOP_80068350();
  cVar3 = CharStats::getBase(param_1->charSheetP->Stats,STAT_DEX);
  bVar4 = 0;
  if ((0 < cVar3) && (bVar4 = 1, 18 < cVar3)) {
    if (cVar3 < 25) {
      bVar4 = 1;
      if (iVar1 != 0) {bVar4 = 2;}
    }
    else {
      bVar4 = 2;
      if (((30 < cVar3) && (bVar4 = 3, cVar3 < 35)) && (bVar4 = 2, iVar1 != 0)) {
        bVar4 = 3;
      }
    }
  }
  return bVar4;
}

u32 get_combatEnt_protection(CombatEntity *param_1){
  CharSheet *pCVar1;
  s32 iVar3;
  u32 uVar4;
  u32 uVar6;
  u32 uVar7;
  s32 iVar8;
  Potion_effect *pcVar2;
  ArmorInstance *iVar2;
  
  uVar7 = 0;
  iVar8 = 0;
  uVar6 = 0;
  pCVar1 = param_1->charSheetP;
  iVar3 = 0;
  do {
    pcVar2 = pCVar1->potionEffects[uVar6];
    if (pcVar2) {
      if (pcVar2->ID == POTION_ACID) uVar7+= pcVar2->unk1;
      if (pcVar2->ID == POITION_DEFENCE) iVar8 = 0xf;
    }
    uVar6++;
  } while (uVar6 < 7);
  iVar2 = *(ArmorInstance **)pCVar1->armor;
  uVar6 = 0;
  if (iVar2) {uVar6 = (u32)iVar2->Protect;}
  uVar4 = warrior_dividing(pCVar1->Skills->getModdedSkill(SKILL_Warrior),5,false,0,0);
  if ((s32)(((param_1->charSheetP->EXP->protection + uVar6) - uVar7) + uVar4 + iVar8) < 1) {uVar6 = 0;}
  else {
    uVar4 = warrior_dividing(param_1->charSheetP->Skills->getModdedSkill(SKILL_Warrior),5,false,0,0);
    uVar6 = uVar4 + ((uVar6 + param_1->charSheetP->EXP->protection) - uVar7) + iVar8 & 0xff;
  }
  return uVar6; //(Warrior/5)+(ArmorProtect+EntProtect-Acid)+(DefPotion*15)
}


char get_sheild_warrior_skill(CombatEntity *param_1){
  ArmorInstance *ptVar1;
  u8 bVar4;
  
  ptVar1 = param_1->charSheetP->armor[1];
  bVar4 = 0;
  if (ptVar1) {bVar4 = ptVar1->DEF;}
  return param_1->charSheetP->Skills->getModdedSkill(SKILL_Warrior) + bVar4 * getModdedSheild(param_1->charSheetP->Skills);
}

u32 get_protection_level(CombatEntity *param_1,u8 backStab){
  u32 uVar1;
  ArmorInstance *pcVar1 = param_1->charSheetP->armor[1];
  uVar1 = get_combatEnt_protection(param_1);
  if ((pcVar1) && (!backStab)) {uVar1 += pcVar1->Protect;}
  return uVar1;
}

void combatEnt_coords2_is_coords(CombatEntity *param_1){
  param_1->coord2[0] = param_1->coord[0];
  param_1->coord2[1] = param_1->coord[1];}

void FUN_80068924(CombatEntity *param_1){
  playerData *ppVar1;
  CombatStruct *pCVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  vec2f fStack144;
  vec2f fStack80;
  
  ppVar1 = gGlobals.playerDataArray[param_1->index];
  if (ppVar1) {
    setVec2(fStack144,param_1->coord[0],param_1->coord[1]);
    FUN_80070234(param_1);
    pCVar2 = gCombatP;
    gCombatP->floatA = param_1->coord[0];
    pCVar2->FogFloat = param_1->coord[1];
    copyVec2(param_1->facing,fStack80);
    fVar3 = ppVar1->facing[0];
    param_1->facing[0] = -fVar3;
    fVar4 = param_1->coord[0];
    fVar5 = ppVar1->facing[1];
    param_1->facing[1] = -fVar5;
    if ((((fStack144[0] != fVar4) || (fStack144[1] != param_1->coord[1])) || (fStack80[0] != -fVar3)) || (fStack80[1] != -fVar5)) {
      if (param_1->unk0x22 < 3) {param_1->unk0x22++;}
      else {CombatEnt_OR_flags(param_1,flag3);}
      FUN_80072454(gCombatP->substruct2,param_1);
      FUN_80072454(gCombatP->substruct2 + 1,param_1);
    }
  }
  return;
}

void set_combatEnt_vec2(CombatEntity *param_1,s8 param_2){
  s8 uStack72 [8][2]={
      {0,-1},{1,-1},{1,0},{1,1},
      {0,1},{-1,1},{-1,0},{-1,-1}};

  setVec2(param_1->facing,(float)uStack72[param_2][0],(float)uStack72[param_2][1]);
  vec2_normalize(param_1->facing);
}

u8 FUN_80068b0c(CombatEntity *param_1,u8 param_2,u8 param_3){
  float fVar1;
  float fVar2;
  float fVar3;
  
  fVar1 = param_1->facing[0];
  fVar2 = param_1->facing[1];
  param_1->facing[0] = (float)param_2 - param_1->coord[0];
  param_1->facing[1] = (float)param_3 - param_1->coord[1];
  vec2_normalize(param_1->facing);
  fVar1 = param_1->facing[0] - fVar1;
  if (fVar1 <= 0.0) {fVar1 = -fVar1;}
  if ((double)fVar1 <= 1.0E-4d) {
    fVar2 = param_1->facing[1] - fVar2;
    if (fVar2 <= 0.0) {fVar2 = -fVar2;}
    if ((double)fVar2 <= 1.0E-4d) {return false;}
  }
  return true;
}

u8 check_combatents_facings(CombatEntity *param_1,float param_2,float param_3){
  u8 bVar1;
  float fVar2;
  float fVar3;
  vec2f afStack160;
  vec2f afStack96;
  
  setVec2(afStack160,param_1->coord[0],param_1->coord[1]);
  setVec2(afStack96,param_2,param_3);
  fVar2 = vec2_proximity(afStack160,afStack96);
  bVar1 = true;
  if (fVar2 != 0.0) {
    fVar3 = param_1->facing[0] * fVar2 + param_1->coord[0];
    fVar2 = param_1->facing[1] * fVar2 + param_1->coord[1];
    if (param_2 - 0.5f <= fVar3) {
      if (param_2 + 0.5f < fVar3) {return false;}
      if (fVar2 < param_3 - 0.5f) {return false;}
      if (fVar2 <= param_3 + 0.5f) {return true;}
    }
    bVar1 = false;
  }
  return bVar1;
}

u8 check_for_backstab(CombatEntity *param_1,CombatEntity *param_2){
  u8 bVar1;
  s32 iVar2;
  double dVar3;
  float fVar4;
  
  
  if (!check_combatents_facings(param_1,param_2->coord[0],param_2->coord[1])) {bVar1 = false;}
  else {
    fVar4 = (param_1->facing[0] * param_2->facing[0] +
            param_1->facing[1] * param_2->facing[1]) * 1000000.0f;
    dVar3 = (double)fVar4;
    if (0.0 < fVar4) {iVar2 = (s32)(dVar3 + 0.5d);}
    else {iVar2 = -(s32)(0.5d - dVar3);}
    bVar1 = true;
    if ((float)iVar2 / 1000000.0f < cos_pi_over_4) {bVar1 = false;}
  }
  return bVar1;
}


void FUN_80068dd8(CombatEntity *param_1){
  playerData *ppVar1 = gGlobals.playerDataArray[param_1->index];
  if (ppVar1) {
    enemy_proximity_check(ppVar1,param_1->coord[0] + ppVar1->scale_floatB,
      param_1->coord[1] + ppVar1->scale_floatB,ppVar1->scale_floatB,0);
  }
}

void FUN_80068e38(CombatEntity *param_1){
  if (gGlobals.playerDataArray[param_1->index]) {
    if ((param_1->facing[0] != 0.0) || (param_1->facing[1] != 0.0)) {
      playerdata_set_facing(gGlobals.playerDataArray[param_1->index],-param_1->facing[0],-param_1->facing[1]);
    }
    gGlobals.combatBytes[1] = gGlobals.combatBytes[0];
    gGlobals.combatBytes[0] = 6;
  }
  return;
}

void adjust_combatent_facing(CombatEntity *param_1,CombatEntity *param_2){
  playerData *ppVar1;
  playerData *ppVar2;
  float fVar3;
  
  gGlobals.combatBytes[0] = 6;
  gGlobals.combatBytes[1] = 6;
  if (param_2 != param_1) {
    ppVar1 = gGlobals.playerDataArray[param_1->index];
    ppVar2 = gGlobals.playerDataArray[param_2->index];
    if ((ppVar1) && (ppVar2)) {
      param_1->facing[0] = (ppVar2->collision).position[0] - (ppVar1->collision).position[0];
      param_1->facing[1] = (ppVar2->collision).position[2] - (ppVar1->collision).position[2];
      vec2_normalize(param_1->facing);
      fVar3 = param_1->facing[1];
      if (param_1->facing[0] == 0.0) {
        if (fVar3 == 0.0) {return;}
        fVar3 = param_1->facing[1];
      }
      playerdata_set_facing(ppVar1,-param_1->facing[0],-fVar3);
    }
  }
  return;
}

void teleport_spell_sub(CombatEntity *param_1){
  playerData *ppVar1;
  
  ppVar1 = gGlobals.playerDataArray[param_1->index];
  if (ppVar1) {
    (ppVar1->collision).position[0] = param_1->coord[0] + ppVar1->scale_floatB;
    (ppVar1->collision).position[2] = param_1->coord[1] + ppVar1->scale_floatB;
    FUN_800154e4(ppVar1,0,0,0);
  }
}

void FUN_80069004(CombatEntity *param_1){
  playerData *ppVar1;
  
  if (((param_1->facing[0] != 0.0) || (param_1->facing[1] != 0.0)) &&
     (ppVar1 = gGlobals.playerDataArray[param_1->index], ppVar1)) {
    ppVar1->facing[0] = -param_1->facing[0];
    ppVar1->facing[1] = -param_1->facing[1];
    vec2_normalize(ppVar1->facing);
  }
}

u8 get_weapon_animation(CombatEntity *param_1,u8 param_2){
  u8 (*pabVar1) [2];
  u8 uStack64 [7] [2]={{0,16},{1,17},{2,13},{3,12},{4,15},{5,14},{0xff,0xff}};
  
  pabVar1 = uStack64;

  while( true ) {
    if (uStack64[0][0] == 0xff) {return 18;}
    if (*(u8 *)pabVar1 == param_2) break;
    pabVar1 = (u8 (*) [2])((s32)pabVar1 + 2);
    uStack64[0][0] = *(u8 *)pabVar1;
  }
  return *(u8 *)((s32)pabVar1 + 1);
}


u32 FUN_80069114(CombatEntity *param_1){
  WeaponInstance *pTVar1;
  u32 uVar2;
  
  if (param_1->AtkType == 3) {uVar2 = 400;}
  else {
    uVar2 = 0;
    if (param_1->AtkType != 1) {
      if (param_1->charSheetP == NULL) {uVar2 = 0;}
      else {
        pTVar1 = param_1->charSheetP->weapons;
        if (pTVar1 == NULL) {
          get_weapon_sheild_borg5(param_1);
          uVar2 = 0;
        }
        else {uVar2 = (u32)pTVar1->range;}
      }
    }
  }
  return uVar2;
}


u32 Ofunc_8006916c(CombatEntity *param_1,u8 param_2,u8 param_3){
  s8 sVar1;
  char cVar4;
  s32 iVar2;
  u32 uVar3;
  u32 uVar5;
  u32 uVar6;
  
  uVar6 = (s32)((get_combatEnt_x(param_1) - (param_2)) * 0x1000000) >> 0x18;
  uVar5 = (s32)((get_combatEnt_y(param_1) - (param_3)) * 0x1000000) >> 0x18;
  if (uVar6 == 0) {if (uVar5 == 0) {return 1;}}
  switch(param_1->unk0x14) {
  case 0:
    uVar3 = 0;
    if (uVar6 == 0) {uVar3 = (u32)(0 < (s32)uVar5);}
    break;
  case 1:
    if (-1 < (s32)uVar6) {return 0;}
    goto LAB_80069274;
  case 2:
    uVar3 = 0;
    if (uVar5 == 0) {uVar3 = uVar6 >> 0x1f;}
    break;
  case 3:
    if (-1 < (s32)uVar6) {return 0;}
    goto joined_r0x8006924c;
  case 4:
    uVar3 = 0;
    if (uVar6 == 0) {uVar3 = uVar5 >> 0x1f;}
    break;
  case 5:
    if ((s32)uVar6 < 1) {return 0;}
joined_r0x8006924c:
    if (-1 < (s32)uVar5) {return 0;}
    goto LAB_8006927c;
  case 6:
    uVar3 = 0;
    if (uVar5 == 0) {uVar3 = (u32)(0 < (s32)uVar6);}
    break;
  case 7:
    if ((s32)uVar6 < 1) {return 0;}
LAB_80069274:
    uVar3 = 0;
    if (0 < (s32)uVar5) {
LAB_8006927c:
      if ((s32)uVar6 < 0) {uVar6 = -uVar6;}
      if ((s32)uVar5 < 0) {uVar5 = -uVar5;}
      uVar3 = (u32)(uVar6 == uVar5);
    }
    break;
  default:
    uVar3 = 0;
  }
  return uVar3;
}

u8 FUN_800692bc(CombatEntity *param_1,CombatEntity *param_2){
  playerData *ppVar1;
  playerData *ppVar2;
  u8 bVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  
  ppVar1 = gGlobals.playerDataArray[param_1->index];
  bVar3 = false;
  if (ppVar1) {
    ppVar2 = gGlobals.playerDataArray[param_2->index];
    bVar3 = false;
    if (ppVar2) {
      fVar4 = FUN_80069554(param_1,param_2);
      fVar5 = ppVar1->scale_floatB;
      if (fVar5 <= ppVar1->unk0x38) {fVar5 = ppVar1->unk0x38;}
      fVar6 = ppVar2->scale_floatB;
      if (fVar6 <= ppVar2->unk0x38) {fVar6 = ppVar2->unk0x38;}
      bVar3 = true;
      if (fVar5 + fVar6 + 0.75f < fVar4) {bVar3 = false;}
    }
  }
  return bVar3;
}

u8 FUN_80069384(CombatEntity *param_1,CombatEntity *param_2,s8 param_3,s8 param_4,s32 param_5){
  u8 bVar1;
  CharSheet *pCVar2;
  u8 bVar4;
  float fVar5;
  u32 uVar6;
  
  if ((param_5 != 0) &&
     (!check_combatents_facings(param_1,(float)param_3,(float)param_4),)) {return false;}
  if (param_1->AtkType == 3) {return true;}
  if (!CombatEnt_flag_check(param_1)) {
    bVar1 = param_1->AtkType;
    if (bVar1 == 1) {if (param_1->charSheetP->weapons) goto LAB_80069414;}
    else {
      if (bVar1 == 2) {pCVar2 = param_1->charSheetP;}
      else {
        if (bVar1 != 4) {return false;}
        pCVar2 = param_1->charSheetP;
      }
      if (pCVar2->weapons) {
        fVar5 = get_combatEnt_proximity(param_1,param_2);
        if (fVar5 < INT_MAX_f) {
          uVar6 = (u32)fVar5;
          bVar1 = param_1->AtkType;
        }
        else {
          uVar6 = (s32)(fVar5 - INT_MAX_f) | 0x80000000;
          bVar1 = param_1->AtkType;
        }
        if (bVar1 != 2) {return uVar6 <= param_1->charSheetP->weapons->range;}
        bVar4 = FUN_80068358(param_1);
        if (bVar4 == false) {return false;}
        if (2 < uVar6) {return uVar6 <= param_1->charSheetP->weapons->range;}
        return false;
      }
    }
    param_1->AtkType = 0;
    return false;
  }
LAB_80069414:
  return FUN_800692bc(param_1,param_2);
}

float get_combatEnt_proximity(CombatEntity *param_1,CombatEntity *param_2){
  vec2f afStack144;
  vec2f afStack80;
  
  setVec2(afStack144,param_1->coord[0],param_1->coord[1]);
  setVec2(afStack80,param_2->coord[0],param_2->coord[1]);
  return vec2_proximity(afStack144,afStack80);}

float FUN_80069554(CombatEntity *param_1,CombatEntity *param_2){
  FUN_80070234(param_2);
  FUN_80070234(param_1);
  return get_combatEnt_proximity(param_1,param_2);}


u8 combat_can_use_potion(CombatEntity *param_1,PotionEnum param_2){return can_use_potion(param_1->charSheetP,param_2,NULL);}

u8 Combat_can_use_flask(CombatEntity *param_1,CombatEntity *param_2){
  u8 ret;

  if (param_1->AtkType == 3) {
    if (param_1->item < POTION_HEALING) {ret = CombatEnt_flag_4(param_1) != CombatEnt_flag_4(param_2);}
    else {
      ret = false;
      if (param_2 == param_1) {ret = combat_can_use_potion(param_1,param_1->item);}
    }
  }
  else {ret = true;}
  return ret;
}

u8 FUN_8006963c(CombatEntity *param_1,CombatEntity *param_2){
  u8 bVar1;
  u8 bVar2;

  if (CombatEnt_flag_6(param_2)) return false;
  if (!isDead(param_2->charSheetP)) return false;
  if ((param_1->AtkType == 3) || (CombatEnt_flag_check(param_1))) {
LAB_800696b4:
    if (Combat_can_use_flask(param_1,param_2)) {return false;}
    if (CombatEnt_flag_check(param_1)) {
      if (CombatEnt_flag_4(param_1) != CombatEnt_flag_4(param_2)) goto LAB_800696f0;
    }
    bVar1 = CombatEnt_flag_check(param_1);
    bVar2 = true;
    if ((!bVar1) && (bVar2 = false, param_1->AtkType != 0)) {bVar2 = true;}
  }
  else {
    if (CombatEnt_flag_4(param_1) != CombatEnt_flag_4(param_2)) goto LAB_800696b4;
LAB_800696f0:
    bVar2 = false;
  }
  return bVar2;
}

u8 CombatEntity::CanBeTargeted(CombatEntity *param_1,CombatEntity *param_2,s32 param_3){
  playerData *ppVar1;
  playerData *ppVar2;
  u32 uVar4;
  u32 uVar5;
  float fVar8;
  u8 bStack176 [2];
  vec3f fStack168;
  vec3f afStack104;
  
  if (param_2->charSheetP->ID != (ItemID)(entityList[172] + 0x200)) { //not shadow
    if (!CombatEnt_flag_check(param_1)) {
      if (gGlobals.combatBytes[0] == 0x19) {return param_2 == param_1;}
      if (!func_8006963c(param_1,param_2)) {return false;}
    }
    else {
      if (Entity::isDead(param_2->charSheetP)) return false;
      if (flag6(param_2)) return false;
      if (flag4(param_2) != flag4(param_1)) return false;
      if (Entity::getHPCurrent(param_2->charSheetP) == Entity::getHPMax(param_2->charSheetP)) return false;
      if (!(param_1->flags & COMBATENT_MEDIC)) {if (param_2 == param_1) {return true;}}
      else {if (param_2 == param_1) return false;}
    }
    bStack176[0] = 0;
    bStack176[1] = 0;
    get_combatEnt_x_y(param_2,bStack176,bStack176 + 1);
    if (!func_80069384(param_1,param_2,(u32)bStack176[0],(u32)bStack176[1],param_3)) {return false;}
    if (FUN_8007105c(&gCombatP->substruct,get_combatEnt_x(param_1),get_combatEnt_y(param_1),(u32)bStack176[0],bStack176[1])) {return true;}
    ppVar1 = gGlobals.playerDataArray[param_1->index];
    ppVar2 = gGlobals.playerDataArray[param_2->index];
    if ((ppVar1) && (ppVar2)) {
      copyVec3((ppVar1->collision).pos,fStack168);
      copyVec3((ppVar2->collision).pos,afStack104);
      fStack168.y += -ppVar1->interactRadiusB + gEntityDB->GetHeight(param_1->charSheetP->ID)
      fStack168.y += -ppVar2->interactRadiusB + gEntityDB->GetHeight(param_2->charSheetP->ID);
      return FUN_800716b4(&gCombatP->substruct,fStack168,afStack104,(u32)param_1->index,param_2->index);
      
    }
  }
  return false;
}



uint CombatEntity::GetSpellTargetCount(CombatEntity *param_1){
  SpellInstance *pSVar1;
  uint ret;
  int iVar3;
  
  pSVar1 = Entity::GetSpell(param_1->charSheetP);
  if (!pSVar1) ret = 0;
  else if (pSVar1->cast == MCAST_ALL) ret = (uint)gCombatP->EntCount;
  else {
    ret = 1;
    if (pSVar1->cast == MCAST_RANK) {
      ret = (u8)Entity::CheckSpellWizard(param_1->charSheetP,pSVar1) + 1 >> 1;
    }
  }
  return ret;
}


u8 CombatEntity::canControl(CombatEntity *param_1,SpellInstance *param_2){
  ItemID x;
  SpellEnum bVar3;
  bool bVar1;
  byte bVar2;
  
  bVar3 = GetIDIndex((param_2->base).id);
  x = param_1->charSheetP->ID;
  if (true) {
    switch(bVar3) {
    case SPELLIND_ControlElem:
    case SPELLIND_banishing:
      if (!Entity::IsElemental(x)) return false;
      return true;
    default:
      goto LAB_80069b1c;
    case SPELLIND_charming:
      if (gEntityDB->entities[GetIDIndex(x)].Category == Chaos_Enemy) return false;
      return true;
    case SPELLIND_controlMarquis:
      bVar2 = entityList[0xaa];
      break;
    case SPELLIND_controlZombies:
      bVar2 = entityList[0xb6];
      if (x == (ItemID)(entityList[0xbe] + 0x200)) return true;
    }
    if (x != (ItemID)(bVar2 + 0x200)) return false;
  }
LAB_80069b1c:
  return true;
}

u8 CombatEntity::SpellEffectsTarget(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3){
  u8 bVar1;

  u8 bVar3;
  MagicTargetEnum MVar4;
  
  if (param_3 == NULL) {
RetFalse:
    bVar1 = false;
  }
  else {
    if (CombatEnt_flag_6(param_2)) return false;
    if (isDead(param_2->charSheetP)) return false;
    MVar4 = param_3->target;
    if (MVar4 == Party_in_Area) {
      if (CombatEnt_flag_4(param_2) != CombatEnt_flag_4(param_1)) {return false;}
    }
    if (MVar4 == Enemy_in_Area) {
      if (CombatEnt_flag_4(param_2) == CombatEnt_flag_4(param_1)) goto RetFalse;
    }
    bVar1 = false;
    if (!Entity::HasSpellEffect(param_2->charSheetP,GetIDIndex(param_3->id))) {
      if (Entity::CheckSpellSpecial(param_2->charSheetP,param_3) == 0) {bVar1 = canControl(param_2,param_3) != false;}
      else bVar1 = false;
    }
  }
  return bVar1;
}

u8 ai_shouldnt_cast_magic(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3){
  s32 iVar1;
  u8 bVar3;
  u32 uVar2;
  u8 bVar4;
  
  if ((param_1->aiP == NULL) ||
     ((param_1->aiP->flags & 8) == 0)) bVar4 = true;
  else {
    bVar4 = false;
    if (Entity::SpellStaminaSubtract(param_1->charSheetP,param_3,Entity::CheckSpellWizard(param_1->charSheetP,param_3)) <= CharStats::getModded(param_1->charSheetP->Stats,STAT_STAM)) {
      bVar4 = false;
      if (Entity::GetSpellCharges(param_1->charSheetP) != 0) {
        if (Entity::CheckSpellSpecial(param_2->charSheetP,param_3) == 0) {bVar4 = check_spell_aspect_tod(param_1->charSheetP,param_3) == 0;}
        else {bVar4 = false;}
      }
    }
  }
  return bVar4;
}

u8 FUN_80069d00(CombatEntity *param_1,CombatEntity *param_2,float param_3,float param_4){
  playerData *ppVar1;
  u8 bVar2;
  float fVar3;
  vec2f afStack224;
  vec2f fStack160;
  vec2f fStack96;
  
  ppVar1 = gGlobals.playerDataArray[param_2->index];
  if (ppVar1 == NULL) {bVar2 = false;}
  else {
    memset(afStack224,0,8);
    afStack224[0] = param_4;
    memset(fStack96,0,8);
    fStack160[0] = (ppVar1->collision).position[0];
    fStack160[1] = (ppVar1->collision).position[2];
    fStack96[0] = fStack160[0];
    fStack96[1] = fStack160[1];
    fVar3 = vec2_proximity(afStack224,fStack160);
    bVar2 = true;
    if (param_3 + ppVar1->scale_floatB < fVar3) {bVar2 = false;}
  }
  return bVar2;
}

u8 ai_should_cast_magic(CombatEntity *param_1,CombatEntity *param_2){
  playerData *ppVar2;
  Temp_spell *pTVar5;
  u8 bVar8;
  s32 iVar6;
  char cVar9;
  u32 uVar7;
  u8 uVar4;
  u8 bVar10;
  Borg_9_data *pBVar11;
  float fVar12;
  s32 iVar13;
  double dVar14;
  float fVar15;
  u8 bStack256[2];
  vec3f fStack248;
  vec3f afStack184;
  vec3f fStack120;
  
  if (param_2->index == gGlobals.ShadowIndex) {return false;} //no magic with Shadow present
  if (param_1->index == gGlobals.ShadowIndex) {return false;}
  pTVar5 = getSpell(param_1->charSheetP);
  if (CombatEntity::SpellEffectsTarget(param_1,param_2,pTVar5)) {
    bVar8 = GetIDIndex(pTVar5->id);
    if (ai_shouldnt_cast_magic(param_1,param_2,pTVar5)) {
        //cast if TP or self-target
      if ((bVar8 == 0xc) || (pTVar5->cast == SELF)) { return param_2 == param_1;}
      iVar6 = Entity::CheckSpellWizard(param_1->charSheetP,pTVar5);
      fVar12 = get_combatEnt_x_f(param_1);
      get_combatEnt_y_f(param_1);
      uVar4 = get_combatEnt_x(param_1);
      uVar7 = get_combatEnt_y(param_1);
      bStack256[0] = 0;
      bStack256[1] = 0;
      get_combatEnt_x_y(param_2,&bStack256,bStack256[1]);
      iVar13 = iVar6 * (u32)pTVar5->range;
      if ((pTVar5->aspect_flag & 0x10)) {
        fVar12 = gCombatP->floatA;
        fVar15 = gCombatP->FogFloat;
        if (0.0 < fVar12) {iVar13 = (s32)((double)fVar12 + 0.5d);}
        else {iVar13 = -(s32)(0.5d - (double)fVar12);}
        uVar4 = iVar13 & 0xff;
        if (0.0 < fVar15) {uVar7 = (u32)((double)fVar15 + 0.5d);}
        else {uVar7 = -(s32)(0.5d - (double)fVar15);}
        uVar7 &= 0xff;
        iVar13 = iVar6;
      }
      if (bVar8 != 0x15) {
        dVar14 = (double)iVar13;
        if (iVar13 < 0) {dVar14 += UINT_MAX_d;}
        if (!func_80069d00(param_1,param_2,(float)dVar14,fVar12)) {return false;}
      }
      if (FUN_8007105c(&gCombatP->substruct,uVar4,(u8)uVar7,(u32)bStack256[0],bStack256[1])) {return true;}
      if ((uVar4 == bStack256[0]) && (uVar7 == bStack256[1])) {return true;}
      ppVar2 = gGlobals.playerDataArray[param_2->index];
      if (ppVar2) {
        fVar15 = (float)uVar4;
        fVar12 = (float)uVar7;
        pBVar11 = &(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat;
        setVec3(fStack248,fVar15,50.0,fVar12);
        setVec3(afStack184,fVar15,-10.0,fVar12);
        bVar10 = FUN_800adf78(pBVar11,fStack248,afStack184,0.5,fStack120,NULL,0);
        if (!bVar10) {setVec3(fStack120,fVar15,10.0,fVar12);}
        else {fStack120[1] += 2.0f;}
        copyVec3((ppVar2->collision).position,fStack248);
        fStack248[1] += -ppVar2->scale_floatB +gEntityDB->GetHeight(param_2->charSheetP->ID);
        return FUN_800716b4(&gCombatP->substruct,fStack120,fStack248,(u32)param_2->index,param_2->index);
      }
    }
  }
  return false;
}

u8 spell_taget_party_area(CombatEntity *param_1){
  Temp_spell *pTVar1;
  u8 bVar2;
  
  pTVar1 = getSpell(param_1->charSheetP);
  bVar2 = false;
  if (pTVar1) {bVar2 = pTVar1->target == Party_in_Area;}
  return bVar2;
}

u32 FUN_8006a1dc(CombatEntity *param_1){
  WeaponInstance *pTVar1;
  u8 bVar3;
  u32 uVar2;
  u32 auStack72 [5];
  
  if (param_1->AtkType < 5) {
    pTVar1 = param_1->charSheetP->weapons;
    auStack72[2] = 0;
    if (pTVar1) {
      bVar3 = isBreathSpitOrSpikes(pTVar1);
      auStack72[2] = (u32)(param_1->charSheetP->weapons->range != 0);
    }
    auStack72[4] = 0;
    auStack72[0] = 0;
    auStack72[1] = (s32)bVar3;
    auStack72[3] = 1;
    if (bVar3) {auStack72[4] = (u32)(auStack72[2] != 0);}
    uVar2 = auStack72[param_1->AtkType];
  }
  else {uVar2 = 0;}
  return uVar2;
}

void FUN_8006a274(CombatEntity *param_1){
  if (CombatEnt_flag_2(param_1)) {func_8006f2cc(param_1);}
  CombatEnt_NAND_flags(param_1,flag8);
  CombatEnt_NAND_flags(param_1,flag9);
  set_atk_range_multi(param_1,true);
  param_1->unk0x22 = 1;
  if (gGlobals.SomeCase == 3) {gGlobals.combatBytes[1] = 0x13;}
}


void Ofunc_8006a2f0(CombatEntity *param_1,u8 param_2){
  u8 bVar1;
  u32 uVar2;
  u8 bVar3;
  
  bVar1 = param_1->AtkType;
  if (bVar1 != param_2) {
    param_1->AtkType = param_2;
    uVar2 = FUN_8006a1dc(param_1);
    if (uVar2 == 0) {param_1->AtkType = bVar1;}
    else {
      if (CombatEnt_flag_2(param_1)) {func_8006f2cc(param_1);}
      CombatEnt_NAND_flags(param_1,flag8);
      CombatEnt_NAND_flags(param_1,flag9);
      FUN_80072454(gCombatP->substruct2,param_1);
      get_weapon_sheild_borg5(param_1);
      end_combat_turn_(param_1);
    }
  }
  return;
}

void FUN_8006a394(CombatEntity *param_1,u32 param_2,u32 param_3){
  char cVar2;
  s32 iVar1;
  s8 sVar3;
  s32 iVar4;
  
  iVar4 = (s32)(((param_2 & 0xff) - get_combatEnt_x(param_1)) * 0x1000000) >> 0x18;
  iVar1 = (s32)(((param_3 & 0xff) - get_combatEnt_y(param_1)) * 0x1000000) >> 0x18;
  if ((iVar4 != 0) || (iVar1 != 0)) {
    if (iVar4 < 0) {
      sVar3 = 7;
      if ((-1 < iVar1) && (sVar3 = 5, iVar1 < 1)) {sVar3 = 6;}
    }
    else {
      if (iVar4 < 1) {
        sVar3 = 4;
        if (iVar1 < 0) {
          param_1->unk0x14 = 0;
          return;
        }
      }
      else {
        sVar3 = 1;
        if ((-1 < iVar1) && (sVar3 = 3, iVar1 < 1)) {sVar3 = 2;}
      }
    }
    param_1->unk0x14 = sVar3;
  }
  return;
}


void Ofunc_8006a450(CombatEntity *param_1,s8 param_2){
  param_1->unk0x14 = param_2;
  set_combatEnt_vec2(param_1,param_2);
  FUN_80072454(gCombatP->substruct2,param_1);
  FUN_80072454(gCombatP->substruct2 + 1,param_1);
  FUN_80068e38(param_1);
}

void end_combat_turn_(CombatEntity *param_1){
  CharSheet *pCVar1;
  u16 uVar2;
  u8 bVar3;
  GearInstance *puVar2;
  CombatAI_s* pTVar1;
  
  clear_camera_playerdata_focus();
  pTVar1 = param_1->aiP;
  if ((pTVar1) && ((pTVar1->flags & 8) != 0)) {func_80064b18(pTVar1);}
  param_1->charSheetP->spellVal = 0xff;
  CombatEnt_NAND_flags(param_1,flag0);
  pCVar1 = param_1->charSheetP;
  if (pCVar1->spellSwitch == 5) {
    puVar2 = pCVar1->pItemList->pItem[pCVar1->currSpell];
    if ((puVar2->pSpell->Charges == 0) &&
       ((uVar2 = (u16)puVar2->id >> 8, uVar2 == 0x11 || (uVar2 == 0xd)))) { //scroll or wand
      //dispose of drained acc.
      Entity::UnequipGear(pCVar1,(u32)pCVar1->currSpell);
      param_1->charSheetP->spellSwitch = 0;
    }
  }
  gGlobals.combatBytes[0] = 1;
  set_combatflag_42(0);
  if ((!isDead(param_1->charSheetP)) && (!CombatEnt_flag_6(param_1))) {gGlobals.playerDataArray[param_1->index]->ani_type = 0;}
  func_looking_for_flask(param_1);
  if (((param_1->AtkType == 3) && (param_1->item < POTION_HEALING)) &&
     (param_1->charSheetP->weapons)) {MoveWeaponsToInventory(PARTY,(u32)param_1->index);}
  FUN_80070304(param_1);
  FUN_80073e3c(&gCombatP->combatTurn);
}


void combat_escape_func(CombatEntity *param_1){
  if (!CombatEnt_flag_6(param_1)) {
    FUN_800714d0(&gCombatP->substruct,get_combatEnt_x(param_1),get_combatEnt_y(param_1),param_1->unk0x23);
    CombatEnt_OR_flags(param_1,flag6);
    gCombatP->EntsAlive--;
    if (!CombatEnt_flag_4(param_1)) {gCombatP->playersAlive--;}
    else {gCombatP->EnemiesAlive--;}
    clear_combatEnt_effects(param_1);
    clear_charsheet_potions(param_1->charSheetP);
    FUN_80096048(gGlobals.playerDataArray[param_1->index]);
    FUN_80094228(gGlobals.playerDataArray[param_1->index]);
    Actor::DeathFlag(gGlobals.playerDataArray[param_1->index]);
    gGlobals.playerDataArray[param_1->index] = NULL;
    flee_draw_crossbones(param_1->charSheetP->ID,param_1->index);
  }
}

u8 NotAspectBonus(AspectEnum param_1){
  if (param_1 == LUNAR) {return TerrainPointer->partOfDay != NIGHT;}
  if (param_1 != SOLAR) {return false;}
  return TerrainPointer->partOfDay == NIGHT;
}


u8 getNotAspectBonus(CombatEntity *param_1){return NotAspectBonus(GetCharAspect(param_1->charSheetP->EXP));}


u8 IsAspectBonus(CombatEntity *param_1){
  AspectEnum AVar1;
  u8 bVar2;
  
  AVar1 = GetCharAspect(param_1->charSheetP->EXP);
  bVar2 = false;
  if (AVar1 != NONE) {
    if (AVar1 == LUNAR) {bVar2 = TerrainPointer->partOfDay == NIGHT;}
    else {
      bVar2 = false;
      if (AVar1 == SOLAR) {bVar2 = TerrainPointer->partOfDay != NIGHT;}
    }
  }
  return bVar2;
}


u8 FUN_8006a830(CombatEntity *param_1,CombatEntity *param_2,u8 param_3,u8 param_4){
  u8 uVar1;
  u8 uVar2;
  s8 sVar4;
  u8 uVar5;
  s8 sVar6;
  u8 uVar7;
  u8 uVar8;
  char cVar3;
  
  uVar8 = param_3;
  uVar7 = param_4;
  uVar1 = get_combatEnt_x(param_1);
  uVar2 = get_combatEnt_y(param_1);
  switch(param_2->unk0x14) {
  case 0:
    if (((uVar1 < uVar8) && (uVar7 < uVar2)) && (param_1->unk0x14 == 1)) {return 1;}
    if (((uVar1 != uVar8) || (uVar2 <= uVar7)) || (param_1->unk0x14 != 0)) {
      if (uVar1 <= uVar8) {return 0;}
      sVar4 = 7;
      if (uVar2 <= uVar7) {return 0;}
      sVar6 = param_1->unk0x14;
      goto LAB_8006ab00;
    }
    goto LAB_8006ab08;
  case 1:
    if (uVar1 < uVar8) {
      if ((uVar2 == uVar7) && (param_1->unk0x14 == 2)) goto LAB_8006ab08;
      if ((uVar7 < uVar2) && (param_1->unk0x14 == 1)) {return 1;}
    }
    uVar5 = 0;
    if (((uVar1 == uVar8) && (uVar5 = 0, uVar7 < uVar2)) && (uVar5 = 0, param_1->unk0x14 == 0)) {uVar5 = 1;}
    break;
  case 2:
    uVar5 = 0;
    if (uVar1 < uVar8) {
      if ((uVar2 < uVar7) && (param_1->unk0x14 == 3)) {uVar5 = 1;}
      else {
        if ((uVar2 == uVar7) && (param_1->unk0x14 == 2)) {uVar5 = 1;}
        else {
          uVar5 = 0;
          if ((uVar7 < uVar2) && (uVar5 = 0, param_1->unk0x14 == 1)) {uVar5 = 1;}
        }
      }
    }
    break;
  case 3:
    if (((uVar1 < uVar8) && (uVar2 < uVar7)) && (param_1->unk0x14 == 3)) {return 1;}
    if (((uVar1 == uVar8) && (uVar2 < uVar7)) && (param_1->unk0x14 == 4)) {return 1;}
    if (uVar1 >= uVar8) {return 0;}
    if (uVar2 != uVar7) {return 0;}
    sVar4 = param_1->unk0x14;
    sVar6 = 2;
    goto LAB_8006ab6c;
  case 4:
    if (((uVar1 < uVar8) && (uVar2 < uVar7)) && (param_1->unk0x14 == 3)) {return 1;}
    if (((uVar1 == uVar8) && (uVar2 < uVar7)) && (param_1->unk0x14 == 4)) {return 1;}
    if (uVar1 <= uVar8) {return 0;}
    goto LAB_8006aaf4;
  case 5:
    if (uVar8 < uVar1) {
      if ((uVar2 == uVar7) && (param_1->unk0x14 == 6)) goto LAB_8006ab08;
      if ((uVar2 < uVar7) && (param_1->unk0x14 == 5)) {
        return 1;
      }
    }
    if (uVar1 != uVar8) {return 0;}
    sVar4 = 4;
    if (uVar7 <= uVar2) {return 0;}
    sVar6 = param_1->unk0x14;
    goto LAB_8006ab00;
  case 6:
    if (uVar1 <= uVar8) {return 0;}
    if ((uVar7 < uVar2) && (param_1->unk0x14 == 7)) {return 1;}
    if ((uVar2 == uVar7) && (param_1->unk0x14 == 6)) goto LAB_8006ab08;
LAB_8006aaf4:
    uVar5 = 0;
    sVar4 = 5;
    if (uVar2 < uVar7) {
      sVar6 = param_1->unk0x14;
LAB_8006ab00:
      uVar5 = 0;
      if (sVar6 == sVar4) {
LAB_8006ab08:
        uVar5 = 1;
      }
    }
    break;
  case 7:
    if (((uVar8 < uVar1) && (uVar7 < uVar2)) && (param_1->unk0x14 == 7)) {return 1;}
    if (((uVar1 == uVar8) && (uVar7 < uVar2)) && (param_1->unk0x14 == 0)) {return 1;}
    if (uVar8 >= uVar1) {return 0;}
    if (uVar2 != uVar7) {return 0;}
    sVar4 = param_1->unk0x14;
    sVar6 = 6;
LAB_8006ab6c:
    uVar5 = 0;
    if (sVar4 == sVar6) {uVar5 = 1;}
    break;
  default:
    uVar5 = 0;
  }
  return uVar5;
}

u8 isMagicElement(CombatEntity* e, ElementEnum x){
  switch(x) {
  case ELEMENT_NONE:
  case ELEMENT_PHYSICAL:
  case ELEMENT_CUTTING:
  case ELEMENT_SMASHING:
  case ELEMENT_HOLY:
    return false;
  case ELEMENT_EARTH:
  case ELEMENT_SOLAR:
  case ELEMENT_NECROMANCY:
  case ELEMENT_FIRE:
  case ELEMENT_LUNAR:
  case ELEMENT_NAMING:
  case ELEMENT_WATER:
  case ELEMENT_MAGIC:
  case ELEMENT_AIR:
  case ELEMENT_STAR:
  case ELEMENT_ELEMENTAL:
  case ELEMENT_CHAOS:
    return true;
  default:
    return false;
  }
}

u8 phys_magic_element_bool(CombatEntity* param_1,ElementEnum param_2,ElementEnum param_3){
  u8 ret;
  
  if (param_3 == NONE) return false;
  else {
    ret = true;
    if (param_2 != param_3) {
      if (param_3 == ELEMENT_PHYSICAL) {
        if ((param_2 == ELEMENT_CUTTING) || (ret = false, param_2 == ELEMENT_SMASHING)) {ret = true;}
      }
      else {
        ret = false;
        if (param_3 == ELEMENT_MAGIC) ret = isMagicElement(param_1,param_2);
      }
    }
  }
  return ret;
}

u8 gear_element_resist(CombatEntity *param_1,ElementEnum param_2,float *param_3){
  ArmorInstance *ptVar1;
  WeaponInstance *pTVar2;
  CharGear *pCVar3;
  CharSheet *pCVar4;
  GearInstance *ptVar6;
  u32 uVar7;
  u8 bVar8;
  float uVar9;
  float fVar10;
  
  uVar9 = 1.0f;
  bVar8 = false;
  
  for(uVar7 = 0;uVar7 < 2;uVar7++){
    if (phys_magic_element_bool(param_1,param_2,param_1->resists[uVar7].element)) {
      bVar8 = true;
      uVar9*= param_1->resists[uVar7].percent);
    }
    ptVar1 = param_1->charSheetP->armor[uVar7];
    if (((ptVar1) && (ptVar1->resist)) &&
       (phys_magic_element_bool(param_1,param_2,ptVar1->resist->element))) {
      bVar8 = true;
      uVar9*= ptVar1->resist->percent;
    }
  }
  pTVar2 = param_1->charSheetP->weapons;
  if (pTVar2){
    if (pTVar2->resist){
      if (phys_magic_element_bool(param_1,param_2,pTVar2->resist->element)){
        bVar8 = true;
        uVar9*= pTVar2->resist->percent;
      }
    }
  }
  fVar10 = (float)uVar9;
  uVar7 = 0;
  if (param_1->charSheetP->pItemList->num_used != 0) {
    ptVar6 = (GearInstance *)param_1->charSheetP->pItemList->pItem;
    while( true ) {
      ptVar6 = *(GearInstance **)((s32)ptVar6 + uVar7 * 4);
      if (((ptVar6) && (ptVar6->resist)) &&
         (phys_magic_element_bool(param_1,param_2,ptVar6->resist->element)))
      {
        bVar8 = true;
        uVar9*= ptVar6->resist->percent);
      }
      fVar10 = uVar9;
      uVar7++;
      if ((u8)pCVar3->num_used <= uVar7) break;
      ptVar6 = (GearInstance *)pCVar3->pItem;
    }
  }
  *param_3 = fVar10;
  return bVar8;
}

u8 CanResistSpell(CombatEntity *e,Temp_spell *spel_,ElementEnum Elem){
  SpellEnum spellID;
  u8 bVar1;
  SpellEnum SVar2;
  
  spellID = GetIDIndex(spel_->id);
  switch(Elem) {
  default:
    bVar1 = false;
    break;
  case ELEMENT_EARTH:
    bVar1 = spellID == EarthSmite;
    break;
  case ELEMENT_SOLAR:
    bVar1 = (bool)(spel_->aspect_flag >> 1 & 1);
    break;
  case ELEMENT_NECROMANCY:
    bVar1 = spel_->school == SCHOOL_Necromancy;
    break;
  case ELEMENT_FIRE:
    if (spellID != DragonFlames) {
      SVar2 = fireball;
CheckOtherSpell:
      if (spellID != SVar2) return false;
    }
    goto ReturnTrue;
  case ELEMENT_LUNAR:
    bVar1 = (bool)(spel_->aspect_flag & 1);
    break;
  case ELEMENT_NAMING:
    bVar1 = spel_->school == SCHOOL_NAMING;
    break;
  case ELEMENT_WATER:
    if (spellID != lightning) {
      SVar2 = frozenDoom;
      goto CheckOtherSpell;
    }
ReturnTrue:
    bVar1 = true;
    break;
  case ELEMENT_MAGIC:
    bVar1 = true;
    break;
  case ELEMENT_AIR:
    bVar1 = spellID == wind;
    break;
  case ELEMENT_STAR:
    bVar1 = spel_->school == SCHOOL_Star;
    break;
  case ELEMENT_ELEMENTAL:
    bVar1 = spel_->school == SCHOOL_Elemental;
    break;
  case ELEMENT_CHAOS:
    bVar1 = spel_->school == SCHOOL_Chaos;
  }
  return bVar1;
}


u8 magic_resist_element_checks(CombatEntity *ent,Temp_spell *spell,float *resistMulti)

{
  ArmorInstance *ptVar1;
  WeaponInstance *pTVar2;
  CharGear *pCVar3;
  GearInstance *ptVar4;
  CharSheet *pCVar5;
  GearInstance **pptVar7;
  u8 i;
  u8 ret;
  float multi;
  
  ret = false;
  multi = 1.0f;
  for(i=0;i<2;i++) {
    if (CanResistSpell(ent,spell,ent->resists[i].element)) {
      ret = true;
      multi *= ent->resists[i].percent;
    }
    ptVar1 = ent->charSheetP->armor[i];
    if (((ptVar1) && (ptVar1->resist)) &&
       (CanResistSpell(ent,spell,ptVar1->resist->element))) {
      ret = true;
      multi *= ptVar1->resist->percent;
    }
  }
  pTVar2 = ent->charSheetP->weapons;
  if ((pTVar2)&&(pTVar2->resist)&&
    (CanResistSpell(ent,spell,pTVar2->resist->element))) {
        ret = true;
        multi = multi * pTVar2->resist->percent;
        pCVar5 = ent->charSheetP;
    }
  pCVar3 = ent->charSheetP->pItemList;
  if (pCVar3->usedItems != 0) {
    pptVar7 = pCVar3->pItem;
    for(i=0;pCVar3->usedItems <= i;i++){
      ptVar4 = pptVar7[i];
      if (((ptVar4) && (ptVar4->resist)) &&
         (CanResistSpell(ent,spell,ptVar4->resist->element))) {
        ret = true;
        multi *= ptVar4->resist->percent;
      }
    }
  }
  *resistMulti = multi;
  return ret;
}

char check_vs_magic(CombatEntity *param_1,Temp_spell *param_2){
  Temp_enchant *pTVar1;
  u8 (*pabVar2) [2];
  SpellEffect*peVar3;
  u32 uVar4;
  u8 uStack64 [5] [2]={{38,1},{39,2},{40,3},{41,5},{0xff,0xff}}; //magic id with corresponding school
  
  uVar4 = 0;
  peVar3 = param_1->charSheetP->spellEffects;
  do {
    pTVar1 = peVar3->list[0];
    if ((pTVar1) && (uStack64[0][0] != 0xff)) {
      pabVar2 = uStack64;
      do {
        if ((*(SpellEnum *)pabVar2 == pTVar1->index) &&(*(MagicSchoolEnum *)((s32)pabVar2 + 1) == param_2->school)) {
          return pTVar1->lv * 6 & 0xfe;
        }
        pabVar2 = (u8 (*) [2])((s32)pabVar2 + 2);
      } while (*(SpellEnum *)pabVar2 != NONE);
    }
    uVar4++
    peVar3 = (SpellEffect*)(peVar3->list + 1);
    if (0xe < uVar4) {return 0;}
  } while( true );
}

u32 get_STR_Steps(CombatEntity *param_1){
  u32 uVar2=0;
  u8 STR_Steps[8]={4,9,17,24,28,32,36,39};
  while( true ) {
    if (7 < uVar2) return uVar2;
    if (CharStats::getModded(param_1->charSheetP->Stats,STAT_STR) <= STR_Steps[uVar2]) break;
    uVar2++;
  }
  return uVar2;
}


void CombatEntity::Death(CombatEntity *param_1){
  byte *pbVar1;
  CharSheet *pCVar2;
  CombatEntity *pCVar3;
  bool bVar7;
  uint uVar8;
  u32 i;
  
  pCVar2 = param_1->charSheetP;
  for(i=0;i<MAGIC_FXMAX;i++) {
    if (pCVar2->effects[i]) {
      if (isPetrify(param_1,pCVar2->effects[i]->index))
        Entity::ClearSpellEffect(param_1->charSheetP,(u8)i,param_1);
    }
  }
  FUN_800714d0(&gCombatP->substruct,GetCoordXU8(param_1),GetCoordYU8(param_1),param_1->unk23);
  gCombatP->EntsAlive--;
                    // Sholeh
  if ((ItemID)(entityList[0xa4] + 0x200) == param_1->charSheetP->ID) setEventFlag(0x26e,true);
  if (Flag5(param_1)) {
    gCombatP->EnemiesAlive--;
    if (gCombatP->firstKill == 0) {
      gCombatP->firstKill = 1;
      if (gCombatP->EntCount) {
        for(i=0;i < gCombatP->EntCount;i++) {
          pCVar3 = (&gCombatP->combatEnts)[i];
            if ((pcVar3) && (pCVar3 == param_1)) {
              if (Flag4(pCVar3)&&(pCVar3->aiP)) pCVar3->aiP->flags|= 2;
            }
        }
      }
    }
  }
  else {
    gCombatP->playersAlive--;
    PARTY->CheckDeaths();
    if (Flag2(param_1)) TroubadourEnd(param_1);
  }
}

u8 CombatEntity::HasPetrifyEffect(CombatEntity *param_1){  
  for(u8 i=0;i<MAGIC_FXMAX;i++){
    if((param_1->charSheetP->pCVar1->effects[i])&&isPetrify(param_1,param_1->charSheetP->effects[i]->index))
      return true;
  }
  return false;
}

s16 multiple_skill_checks(CombatEntity *param_1,CombatEntity *param_2,char x,char y,u8 backstab){
  CharSheet *pCVar2;
  CharStats_s* stats;
  CharSkills *pCVar3;
  WeaponInstance *pTVar4;
  CharStats_s* DefStats;
  s32 iVar6;
  s32 iVar7;
  s32 iVar8;
  char cVar11;
  char cVar12;
  u8 petrified;
  s32 iVar9;
  s16 sVar10;
  u16 DefDex;
  
  pCVar2 = param_1->charSheetP;
  stats = pCVar2->Stats;
  pCVar3 = pCVar2->Skills;
  pTVar4 = pCVar2->weapons;
  DefStats = param_2->charSheetP->Stats;
  iVar6 = CharStats::getModded(stats,STAT_STR);
  iVar7 = CharStats::getModded(stats,STAT_END);
  iVar8 = CharStats::getBase(stats,STAT_LV);
  cVar11 = pCVar3->getModdedWeapon(pTVar4->weaponType);
  cVar12 = pCVar3->getModdedSkill(SKILL_Warrior);
  petrified = check_for_petrify_effect(param_2);
  DefDex = 0;
  if (!petrified) DefDex = CharStats::getModded(DefStats,STAT_DEX);
  sVar10 = 0;
  if (!petrified) sVar10 = get_sheild_warrior_skill(param_2);
  iVar9 = CharStats::getBase(DefStats,STAT_LV);
  iVar6 = CombatEntity::TheifBackstabMod(param_1,  //(STR,STAT_END,LV)+(WHit+WSkill*6+Warrior*2)-(DefDex*2+DefLV+(Warrior+SheildDef*Sheildskill))
    (s16)((((iVar6 + iVar7 + iVar8)) +(u32)pTVar4->hit + cVar11 * 6 + cVar12 * 2)) - (DefDex * 2 + (s16)iVar9 + sVar10),
    backstab,1,0x14);
  if (CharStats::getModded(DefStats,STAT_STAM) == 0) {iVar6 *= 1.15f;} //increase if target tired
  iVar7 = FUN_80070cc4(&gCombatP->substruct,x,y,get_combatEnt_x(param_1),get_combatEnt_y(param_1););
  iVar7 *= 0.05f * (float)iVar6 + (float)iVar6);
  if (CharStats::getModded(stats,STAT_STAM) == 0) iVar7 = *= 0.8f); //decrease if user tired
  if (TerrainPointer->partOfDay == NIGHT) {iVar7 = *= 0.9f);} //decrease if night
  sVar10 = CombatEntity::TroubadorMod(param_1,some_aspect_multi(param_1,iVar7));
  if (sVar10 < 5) {sVar10 = 5;}
  return sVar10;
}

s16 skillcheck_float(CombatEntity *param_1,short rand,short param_3,u8 param_4){
  s8 sVar2;
  u16 uVar1;
  float fVar3;
  
  sVar2 = param_1->charSheetP->Skills->getModdedSkill(param_4);
  fVar3 = (float)(int)sVar2;
  if ((float)(int)param_3 * 0.2f <= fVar3) {
    fVar3 = (float)(int)param_3 * 0.2f;
  }
  if ((float)(int)rand <= fVar3) {
    rand = (short)((rand - ((u8)RollD(1,100))));
  }
  return rand;
}


void CombatEntity::WeaponSkillUpChance(CombatEntity *param_1,u8 chance,u8 weapon){
  if (RollD(1,100) <= (u8)(chance * 0.1f)) param_1->charSheetP->Skills->AddToBaseWeapon(weapon,1);
}


s16 CombatEntity::CalcAttackResist(CombatEntity *param_1,CombatEntity *param_2,s16 param_3,ElementEnum param_4){
  CombatAI_s* pcVar1;
  float afStack32;
  
  afStack32 = 0.0;
  if (gear_element_resist(param_2,param_4,&afStack32)) {
    param_3 *= afStack32);
    if ((afStack32 != 0.0) && (param_3 < 1)) param_3 = 1;
    if (((1.0f < afStack32) &&
        (pcVar1 = param_2->aiP, pcVar1)) &&
       ((pcVar1->flags & 8) != 0)) pcVar1->flags |= 0x12;
  }
  return param_3;
}

s16 CombatEntity::UseWeaponEnchantment(CombatEntity *param_1,CombatEntity *param_2){
  WeaponInstance *pTVar1;
  Temp_enchant *pTVar2;
  s16 ret;
  SpellInstance TStack80;
  
  pTVar1 = param_1->charSheetP->weapons;
  if (pTVar1) {
    pTVar2 = pTVar1->enchantment;
    if (pTVar2) {
      ret = 0;
      TempSpell::Init(&TStack80,SpellList[pTVar2->index] | 0x300,pTVar2->lv);
      if (CombatEntity::SpellEffectsTarget(param_1,param_2,&TStack80)) {
        ret = magic_damage_resist_calc(param_1,param_2,&TStack80,true);
        if (ret == -3) ret = 0;
        if (ret == -1) ret = 0;
        if (ret == -2) ret = 0;
      }
      ItemInstance::RemoveStatSpell(&TStack80.base);
      return ret;
    }
  }
  return 0;
}

short CombatEntity::CalculateWeaponAttack(CombatEntity *attacker,CombatEntity *target){
  WeaponInstance *pWVar1;
  CharSkills *pCVar2;
  u8 x;
  u8 y;
  bool backstab;
  short sVar3;
  u16 rand;
  s16 sVar4;
  byte bVar5;
  u8 uVar6;
  
  pWVar1 = attacker->charSheetP->weapons;
  if (!pWVar1) sVar3 = 0;
  else {
    x = GetCoordXU8(target);
    y = GetCoordYU8(target);
    pCVar2 = attacker->charSheetP->Skills;
    backstab = CheckBackstab(attacker,target);
    sVar3 = multiple_skill_checks(attacker,target,x,y,backstab);
    rand = RollD(1,100);
    sVar4 = skillcheck_float(attacker,rand,sVar3,SKILL_Warrior);
    bVar5 = pCVar2->getModdedWeapon(pCVar2,pWVar1->weaponType);
    if (bVar5 < 6) uVar6 = SQ((8 - (uint)bVar5))
    else uVar6 = 5;
    if (sVar4 < sVar3) {
      sVar3 = some_STR_Theif_check(attacker,sVar3,(int)sVar4,target,1,(int)backstab);
      WeaponSkillUpChance(attacker,uVar6,pWVar1->weaponType);
      if (rand == sVar4)
        Gsprintf(gCombatP->textArray->they attack,attacker->charSheetP->name,
                    target->charSheetP->name);
      else
        Gsprintf(gCombatP->textArray->crit attack,attacker->charSheetP->name,
                    target->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      if (sVar3 == 0) PrintEvade(attacker,target);
      else PrintDamage(target,sVar3);
    }
    else {
      WeaponSkillUpChance(attacker,(u8)(uVar6 >> 1),pWVar1->weaponType);
      PrintEvade(attacker,target);
      sVar3 = 0;
    }
  }
  return sVar3;
}

s16 some_STR_Theif_check(CombatEntity *attacker,s16 param_2,s32 param_3,CombatEntity *target,char diceMulti,s32 backStab){
  CharSheet *pCVar3;
  u32 DMG;
  s16 iVar6;
  s16 sVar9;
  
  pCVar3 = attacker->charSheetP;
  DMG = RollD(pCVar3->weapons->damage + get_STR_Steps(attacker) * diceMulti,6);
  iVar6 = some_skillcheck_calc(((s32)param_2 - (s32)(s16)param_3));
  iVar6 = (DMG + ((iVar6 + CharStats::getBase(pCVar3->Stats,STAT_LV)) - get_protection_level(target,backStab)) * 0x10000 >> 0x10) +
          pCVar3->Skills->getModdedSkill(SKILL_Theif) * 2 * backStab);
  if (iVar6 < 1) iVar6 = 1;
  sVar9 = CombatEntity::CalcAttackResist(attacker,target,(s16)iVar6,pCVar3->weapons->element);
  if (sVar9 < 0) sVar9 = 0;
  return CombatEntity::UseWeaponEnchantment(attacker,target) + sVar9;
}

s32 CombatEntity::TroubadorMod(CombatEntity *param_1,s16 param_2){
  s32 iVar2;
  float fVar3;
  
  iVar2 = (s32)param_2;
  if (gCombatP->TroubadorLV) {
    fVar3 = (float)gCombatP->TroubadorLV * 0.01f;
    if (!Flag4(param_1)) fVar3 += 1.05f;
    else {fVar3 = 0.95f - fVar3;}
    iVar2*= fVar3;
  }
  return iVar2;
}

s32 some_aspect_multi(CombatEntity *param_1,s16 param_2){
  u8 bVar1;
  s32 iVar2;
  float fVar3;
  
  iVar2 = (s32)param_2;
  fVar3 = 0.75f;
  if ((getNotAspectBonus(param_1)) ||(bVar1 = IsAspectBonus(param_1), fVar3 = 1.25f, bVar1))
    {iVar2 *= fVar3);}
  return iVar2;
}

s16 some_night_check(CombatEntity *param_1,short param_2,short param_3,short param_4,
                    s16 nightPenalty,u16 param_6){
  short sVar1;
  
  if (TerrainPointer->partOfDay == TIME_NIGHT) {
    param_2 -= nightPenalty;
  }
  if ((TerrainPointer->windByte != 2) && (param_3 = param_4, TerrainPointer->windByte != 1)) {
    return param_2;
  }
  sVar1 = param_2 - param_3;
  if (6 < param_6) {
    sVar1 = (short)((uint)(((int)sVar1 - ((int)((param_6 - 5))))));
  }
  return sVar1;
}

s16 CombatEntity::Unk8006bfc0(CombatEntity *param_1,s16 param_2,u8 param_3,u8 param_4,s16 param_5,s16 param_6){
  int iVar1;
  s16 asStack_60 [2];
  iVar1 = FUN_80070cc4(&gCombatP->substruct,GetCoordXU8(param_1),GetCoordYU8(param_1),param_3,param_4);
  if (iVar1) {
    asStack_60[0] = param_6;
    asStack_60[1] = param_5;
    param_2 += asStack_60[(iVar1 >> 0x1f & 2U)];
  }
  return param_2;
}


s16 CombatEntity::TheifBackstabMod(CombatEntity *param_1,s16 param_2,u8 backstab,s16 param_4,s16 param_5){
  return ((s16)((param_2 + param_5 * backstab)) + (s16)param_1->charSheetP->Skills->getModdedSkill(SKILL_Theif) * param_4 * 10);
}

s16 Calc_atk_accuracy(CombatEntity *param_1,CombatEntity *param_2,char param_3,char param_4,u8 backstab){
  CharSheet *pCVar3;
  CharStats_s* Atkstats;
  CharStats_s* DefStats;
  WeaponInstance *pTVar4;
  CharSkills *pCVar5;
  s32 iVar7;
  s32 iVar8;
  s32 iVar9;
  char cVar11;
  char cVar12;
  u8 bVar13;
  undefined uVar14;
  s16 sVar10;
  u32 uVar15;
  u16 uVar16;
  float prox;
  
  pCVar3 = param_1->charSheetP;
  Atkstats = pCVar3->Stats;
  DefStats = param_2->charSheetP->Stats;
  pTVar4 = pCVar3->weapons;
  pCVar5 = pCVar3->Skills;
  prox = get_combatEnt_proximity(param_1,param_2);
  iVar7 = CharStats::getModded(atkStats,STAT_INT);
  iVar8 = CharStats::getModded(atkStats,STAT_DEX);
  iVar9 = CharStats::getBase(atkStats,STAT_LV);
  cVar11 = pCVar5->getModdedWeapon(pTVar4->weaponType);
  cVar12 = pCVar5->getModdedSkill(SKILL_Warrior);
  //(INT+STAT_DEX+LV)+(WepHit+WepSkill*6+Warrior*2)
  uVar15 = (s32)((((iVar7 + iVar8 + iVar9) * 0x10000 >> 0x10) + (u32)pTVar4->hit + cVar11 * 6 + cVar12 * 2) * 0x10000) >> 0x10;
  if (6 < (s32)prox) {uVar15 = (s32)(uVar15 - ((s32)prox - 5) * 0x10000) >> 0x10;}
  iVar7 = (uVar15 - CharStats::getBase(DefStats,STAT_LV)) * 0x10000;
  uVar16 = (u16)((u32)iVar7 >> 0x10);
  if (!check_for_petrify_effect(param_2)) {
    uVar16 = (u16)((u32)(((((iVar7 >> 0x10) + CharStats::getModded(DefStats,STAT_DEX) * -2) * 0x10000 >> 0x10) - get_sheild_warrior_skill(param_2)) * 0x10000) >> 0x10);
  }
  iVar7 = TheifBackstabMod(param_1,uVar16,backstab,0,0x14);
  if (param_2->unk0x22 == 0) iVar7 *= 1.2f;
  if (CharStats::getModded(DefStats,STAT_STAM) == 0) iVar7 *= 1.15f;
  iVar8 = FUN_80070cc4(&gCombatP->substruct,param_3,param_4,get_combatEnt_x(param_1),get_combatEnt_y(param_1));
  iVar8 *= (iVar8 * 0.05f + 1.0f);
  if (CharStats::getModded(atkStats,STAT_STAM) == 0) iVar8 *= 0.9f);
  iVar7 = iVar8 *(1.0f - TerrainPointer->PrecipScale * 0.3f));
  if (TerrainPointer->partOfDay == NIGHT) iVar7 *= 0.7f;
  if (param_2->unk0x22 != 0) iVar7 *= 0.8f;
  sVar10 = TroubadorMod(param_1,some_aspect_multi(param_1,iVar7));
  if (sVar10 < 5) sVar10 = 5;
  return sVar10;
}

u32 some_combat_weapon_func(CombatEntity *attacker,CombatEntity *target){
  s16 sVar5;
  u32 uVar3;
  s32 iVar4;
  u8 bVar9;
  u32 uVar10;
  
  sVar5 = Calc_atk_accuracy(attacker,target,get_combatEnt_x(target),get_combatEnt_y(target),check_for_backstab(attacker,target));
  uVar3 = RollD(1,100);
  iVar4 = skillcheck_float(attacker,(s16)uVar3,sVar5,SKILL_Warrior);
  bVar9 = getModdedWeapon(attacker->charSheetP->Skills,attacker->charSheetP->weapons->weaponType);
  if (bVar9 < 6) uVar10 = SQ(8 - bVar9);
  else uVar10 = 5;
  if (iVar4 < sVar5) {
    sVar5 = some_STR_Theif_check(attacker,sVar5,iVar4,target,0,0);
    if (uVar3 == iVar4) Gsprintf(gCombatP->textArray->they attack,attacker->charSheetP->name,target->charSheetP->name);
    else Gsprintf(gCombatP->textArray->crit attack,attacker->charSheetP->name,target->charSheetP->name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    print_combat_textbox(gCombatP,gGlobals.text,0);
    if ((s32)sVar5 == 0) combat_print_swing_and_miss(attacker,target);
    else CombatEntity::PrintDamage(target,sVar5);
    CombatEntity::WeaponSkillUpChance(attacker,uVar10,WVar1);
    uVar3 = (s32)sVar5 & 0xffff;
  }
  else {
    CombatEntity::WeaponSkillUpChance(attacker,uVar10 >> 1,WVar1);
    combat_print_swing_and_miss(attacker,target);
    uVar3 = 0;
  }
  return uVar3;
}

u8 isDispelMagic(char param_1){
  u32 uVar1=0;
  u8 *pbVar2;
  u8 uStack64 [5]={42,43,44,45,0xff}; //dispel magic indecies
  
  pbVar2 = uStack64;
  while( true ) {
    if (uStack64[0] == 0xff) {return false;}
    if (*pbVar2 == param_1) break;
    uVar1++;
    uStack64[0] = uStack64[uVar1];
    pbVar2 = uStack64 + uVar1;
  }
  return true;
}

u8 find_spell_error(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3,u8 param_4){
  u8 bVar2;
  
  if (param_3->target == outside_Combat) {
    if (param_4 == false) {
      Gsprintf(gCombatP->textArray->No Spell Available);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
    }
    param_1->charSheetP->spellVal = 0xfe;
  }
  else {
    bVar2 = Entity::CheckSpellSpecial(param_2->charSheetP,param_3);
    if (bVar2 == 0) {
      bVar2 = check_spell_aspect_tod(param_1->charSheetP,param_3);
      if (bVar2 == 0) {return true;}
    }
    print_spell_error(param_1,param_2,bVar2,param_4);
  }
  return false;
}

void combat_spell_fail(CombatEntity *param_1,char *param_2){
  copy_string_to_combat_textbox(gCombatP,param_2,0);
  print_combat_textbox(gCombatP,param_2,0);
  param_1->charSheetP->spellVal = 0xfe;
  param_1->charSheetP->spellSwitch = 0;
  clear_combat_substruc2(gCombatP->substruct2 + 1);
}

void combat_textbox_spell(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3){
  Gsprintf(gCombatP->textArray->they cast spell,param_1->charSheetP->name,param_3->name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  Gsprintf(gCombatP->textArray->spell was cast,param_3->name,param_2->charSheetP->name);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void combat_print_failed_spell(CombatEntity *param_1){
  Gsprintf(gCombatP->textArray->they failed spell,param_1->charSheetP->name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void print_spell_cast_resist(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3){
  Gsprintf(gCombatP->textArray->they cast spell,param_1->charSheetP->name,param_3->name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  Gsprintf(gCombatP->textArray->they resist spell,param_2->charSheetP->name);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void print_spell_error(CombatEntity *param_1,s32 param_2,s32 param_3,u8 param_4){
  if (param_4 == false) {
    Gsprintf(gCombatP->textArray->(string),spell_error_labels[param_3]);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    print_combat_textbox(gCombatP,gGlobals.text,0);
  }
}

u8 IsControlMagic(SpellEnum param_1){
  u8 *pbVar1;
  u8 uStack64 [5]={4,16,17,27,255};
  
  pbVar1 = uStack64;
  while( true ) {
    if (uStack64[0] == 0xff) return false;
    if (*pbVar1 == param_1) break;
    pbVar1++
    uStack64[0] = *pbVar1;
  }
  return true;
}


u8 CombatEntity::isPetrify(CombatEntity *param_1,SpellEnum enum_spell){

  SpellEnum *pSVar1;
  u32 uVar2;
  u8 petrify_spells[4]={34,53,57,255}; //wall of bones, frozen doom, web of starlight

  uVar2 = 0;
  if (petrify_spells[0] != 255) {
    pSVar1 = petrify_spells;
    do {
      if (*pSVar1 == enum_spell) {return true;}
      uVar2++;
      pSVar1 = petrify_spells + uVar2;
    } while (petrify_spells[uVar2] != 255);
  }
  return false;
}

u8 FUN_8006cbb4(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3){
  CombatEntity *pCVar1;
  u8 bVar2;
  u32 uVar3;
  u32 uVar4;
  
  if (gCombatP->enemy_index == 0xc) {bVar2 = true;}
  else {
    uVar3 = (u32)gCombatP->playerCount;
    uVar4 = 0;
    if (uVar3 < gCombatP->EntCount) {
      do {
        pCVar1 = (&gCombatP->combatEnts)[uVar3];
        if (((pCVar1) && (!isDead(pCVar1->charSheetP)))
           && ((!CombatEnt_flag_4(pCVar1) || (!check_for_petrify_effect(pCVar1))))) {
          uVar4++;
        }
        uVar3++;
      } while (uVar3 < gCombatP->EntCount);
    }
    bVar2 = true;
    if (2 < uVar4) {
      print_spell_cast_resist(param_1,param_2,param_3);
      bVar2 = false;
    }
  }
  return bVar2;
}

u8 check_for_control_petrify(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3,SpellEnum param_4){
  if (((!IsControlMagic(param_4)) && (!isPetrify(param_1,param_4))) ||(CombatEnt_flag_4(param_1))) return true;
  else return FUN_8006cbb4(param_1,param_2,param_3);
}

u8 CombatEntity::CheckForPetrify(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3,char param_4){
   
  if (!isPetrify(param_1,param_4)) return true;
  else return FUN_8006cbb4(param_1,param_2,param_3);
}

u8 CombatEntity::CheckSpellIngredient(CombatEntity *param_1,Temp_spell *param_2){
  u8 bVar4;
  u8 bVar5;
  ulong uVar2;
  
  bVar5 = true;
  if (((!Flag5(param_1)) && (bVar5 = true, param_1->aiP == NULL)) &&
     (bVar5 = true, param_2->cost)) {
    if (!PARTY->Inventory->TakeItem(get_spell_ingredient(param_2),1)) {
      combat_spell_fail(param_1,gCombatP->textArray->not enough spell ingredients);
      bVar5 = false;
    }
    else bVar5 = true;
  }
  return bVar5;
}

u16 some_aspect_multi_check(CombatEntity *param_1,u32 param_2){
  s32 intStat;
  s32 lvl;
  u16 uVar3;
  float aspectMod;
  float moonfloats [4]={0.5f,0.75f,1.25f,1.5f};
  float dayfloats [5]={0.75f,1.25f,1.25f,0.75f,0.75f};
  intStat = CharStats::getModded(param_1->charSheetP->Stats,STAT_INT);
  lvl = CharStats::getBase(param_1->charSheetP->Stats,STAT_LV);
  if (GetCharAspect(param_1->charSheetP->EXP) == LUNAR) aspectMod = moonfloats[TerrainPointer->moonPhases];
  else aspectMod = dayfloats[TerrainPointer->partOfDay];
  uVar3 = CombatEntity::TroubadorMod(param_1,(intStat * 4 + param_2 * 6 + lvl) * aspectMod);
  if (uVar3 < 5) uVar3 = 5;
  return uVar3;
}

u8 some_spell_ingredient_check(CombatEntity *param_1,Temp_spell *param_2,s16 param_3,s16 param_4){
  CharSheet *pCVar1;
  inv_funcs *piVar2;
  float fVar3;
  s32 iVar4;
  u8 bVar7;
  u8 bVar8;
  ItemID IVar6;
  u32 uVar5;
  u8 bVar9;
  float fVar10;
  
  bVar9 = false;
  if (param_2->level < 4) {
    iVar4 = 5 - (u32)param_2->level;
    uVar5 = iVar4 * iVar4;
  }
  else uVar5 = 3;
  if (param_3 < param_4) {
    bVar7 = some_skillcheck_calc(((s32)param_4 - (s32)param_3) * 0x10000 >> 0x10);
    pCVar1 = param_1->charSheetP;
    bVar9 = true;
  }
  else {
    if ((!CombatEnt_flag_5(param_1)) && (param_2->cost)) {
      piVar2 = (PARTY)->inv->Functions;
      (*(piVar2->add_to_inv).func)
                ((s32)(PARTY)->inv->inv_slots +
                 (s16)(piVar2->add_to_inv).arg[0] + -4,get_spell_ingredient(param_2),1);
    }
    combat_print_failed_spell(param_1);
    uVar5>>=1;
    pCVar1 = param_1->charSheetP;
    bVar7 = 0xff;
  }
  fVar3 = INT_MAX_f;
  fVar10 = (float)uVar5 * 0.1f;
  bVar8 = INT_MAX_f <= fVar10;
  pCVar1->spellVal = bVar7;
  if (bVar8) {fVar10 -= fVar3;}
  if (RollD(1,100) <= ((s32)fVar10 & 0xffU)) {
    uVar5 = param_2->level + 1;
    if (10 < uVar5) uVar5 = 10;
    param_2->level = (u8)uVar5;
  }
  return bVar9;
}


u8 Entity::CheckSpellWizard_combat(CombatEntity *param_1,CombatEntity *x,Temp_spell *param_2,u8 param_3){
  u32 LV;
  s16 sVar3;
  s32 iVar2;
  
  if (param_3 == false) LV = Entity::CheckSpellWizard(param_1->charSheetP,param_2);
  else LV = (u32)param_2->level;
  if (combat_check_spell_ingredient(param_1,param_2)) {
    if (Entity::TestEquipStamina(param_1->charSheetP,(s16)Entity::SpellStaminaSubtract(param_1->charSheetP,param_2,(u8)STAT_LV))) {
      sVar3 = some_aspect_multi_check(param_1,LV);
      iVar2 = skillcheck_float(param_1,(s16)RollD(1,100),sVar3,SKILL_Wizard);
      return some_spell_ingredient_check(param_1,param_2,(s16)iVar2,sVar3);
    }
    combat_spell_fail(param_1,gCombatP->textArray->not enough Stam for Spell);
  }
  return false;
}

u8 func_using_spell_charges(CombatEntity *param_1,CombatEntity *x,Temp_spell *param_2,u8 param_3){
  u8 bVar2;
  u8 bVar3;
  u32 uVar1;
  
  bVar3 = param_1->charSheetP->spellSwitch;
  if (CombatEnt_flag_0(param_1)) {return true;}
  if (param_3 == false) {
    if (bVar3 == 1) {
      if (Entity::CheckSpellWizard_combat(param_1,x,param_2,false) == false) {return false;}
      goto LAB_8006d340;
    }
    if (Entity::GetSpellCharges(param_1->charSheetP) == 0) {
      Gsprintf(gCombatP->textArray->they failed spell,param_1->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      param_1->charSheetP->spellVal = 0xfe;
      param_1->charSheetP->spellSwitch = 0;
      clear_combat_substruc2(gCombatP->substruct2 + 1);
      return false;
    }
    Entity::DecSpellCharge(param_1->charSheetP);
  }
  param_1->charSheetP->spellVal = some_skillcheck_calc((s16)RollD(1,100));
LAB_8006d340:
  CombatEnt_OR_flags(param_1,flag0);
  return true;
}

u8 some_magic_check(CombatEntity *param_1,Temp_spell *param_2,CombatEntity *param_3){
  SpellEnum bVar3;
  u8 bVar1;
  u8 bVar2;
  
  bVar3 = GetIDIndex(param_2->id);
  if ((bVar3 != wallOfBones) ||
     (bVar2 = false, param_3->charSheetP->ID != (ItemID)(entityList[170] + 0x200))) {//marquis
    bVar1 = isDispelMagic(bVar3);
    bVar2 = false;
    if (bVar1 == false) {
      if (bVar3 == teleportation) {bVar2 = false;}
      else {
        bVar2 = true;
        if ((param_2->target != Enemy_in_Area) && (bVar2 = true, (param_2->aspect_flag & 0x10) == 0)
           ) {
          if (bVar3 == wind) {bVar2 = CombatEnt_flag_4(param_3) != CombatEnt_flag_4(param_1);}
          else {bVar2 = false;}
        }
      }
    }
  }
  return bVar2;
}

u8 func_checking_vs_magic(CombatEntity *param_1,Temp_spell *param_2,CombatEntity *param_3,char *param_4){
  u8 bVar1;
  CharStats_s* stats;
  s32 lVar2;
  s32 iVar3;
  u16 uVar6;
  u8 bVar9;
  CharSheet *pCVar10;
  float fVar11;
  
// no TP with Shadow present
  if ((param_2->id == (ItemID)(SpellList[12] + 0x300)) && (gGlobals.ShadowIndex != -1)) {
    combat_print_failed_spell(param_1);
    return false;
  }
  if (!some_magic_check(param_1,param_2,param_3)) return true;
  stats = param_3->charSheetP->Stats;
  iVar3 = (CharStats::getModded(stats,STAT_WIL) * 3 + CharStats::getModded(stats,STAT_END) + CharStats::getBase(stats,STAT_LV)) * 0x10000 >> 0x10;
  uVar6 = check_vs_magic(param_3,param_2);
  if ((uVar6) != 0) {iVar3 = (s32)(((uVar6) + iVar3) * 0x10000) >> 0x10;}
  if ((param_2->aspect_flag & 2) == 0) {if ((param_2->aspect_flag & 1) == 0) goto LAB_8006d5ac;}
  fVar11 = 0.75f;
  if (GetCharAspect(param_3->charSheetP->EXP) != GetCharAspect(param_1->charSheetP->EXP)) {fVar11 = 1.25f;}
  iVar3 *= fVar11;
LAB_8006d5ac:
  uVar6 = RollD(1,100);
  bVar9 = true;
  if ((s16)uVar6 <= iVar3) {
    lVar2 = some_skillcheck_calc((iVar3 - (s16)uVar6) * 0x10000 >> 0x10);
    pCVar10 = param_1->charSheetP;
    if (lVar2 < pCVar10->spellVal) {
      if (param_3->unk0x28 != 0) {
        iVar3 = ((s32)(char)pCVar10->spellVal - lVar2) * 0x10000;
        if (iVar3 >> 0x10 < param_3->unk0x28) {param_3->unk0x28-= (char)((u32)iVar3 >> 0x10);}
        else {param_3->unk0x28 = 0;}
        lVar2 = param_1->charSheetP->spellVal;
        pCVar10 = param_1->charSheetP;
      }
      bVar1 = pCVar10->spellVal;
    }
    else {bVar1 = pCVar10->spellVal;}
    bVar9 = true;
    if (lVar2 < (char)bVar1) {*param_4 -= (char)lVar2;}
    else {
      print_spell_cast_resist(param_1,param_3,param_2);
      bVar9 = false;
    }
  }
  return bVar9;
}


u8 banishing_func(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3){
  combat_textbox_spell(param_1,param_2,param_3);
  Gsprintf(gCombatP->textArray->theyre banished,param_2->charSheetP->name);
  copy_to_combat_textbox_2(gCombatP,gGlobals.text,4);
  return getHPCurrent(param_2->charSheetP);
}

s32 dispel_magic_combat(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3,SpellEnum param_4,u8 param_5){
  if (!Entity::DispelMagic(param_2->charSheetP,(char)param_2,param_4,param_5)) {
    Gsprintf(gCombatP->textArray->they cast spell,param_1->charSheetP->name,param_3->name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    Gsprintf(gCombatP->textArray->they fail,param_3->name);
    print_combat_textbox(gCombatP,gGlobals.text,0);
  }
  else {combat_textbox_spell(param_1,param_2,param_3);}
  return -1;
}


s32 FUN_8006d7d8(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3,SpellEnum param_4,u8 param_5,u8 param_6){
  s32 uVar1;
  
  combat_textbox_spell(param_1,param_2,param_3);
  if (CombatEnt_flag_4(param_2) == CombatEnt_flag_4(param_1)) {
    Entity::AllocEnchant(param_2->charSheetP,param_4,(u32)param_6,param_5,((u32)param_6 * 0xe0 + (u32)param_6) * 8,1);
    uVar1 = -1;
  }
  else {uVar1 = param_3->damage;}
  return uVar1;
}

s32 calc_spell_damage_(CombatEntity *param_1,Temp_spell *param_2,CombatEntity *param_3,u32 Level,u8 param_5){
  SpellEnum SVar3;
  s32 iVar2;

  SVar3 = GetIDIndex(param_2->id);
  if (SVar3 == banishing) {iVar2 = (s32)banishing_func(param_1,param_3,param_2) << 0x10;}
  else {
    if (!isDispelMagic(SVar3)) {
      if ((!check_for_control_petrify(param_1,param_3,param_2,SVar3)) ||
         (!check_for_petrify(param_1,param_3,param_2,SVar3))) {return 0;}
      if ((param_2->damage == 0) || (FUN_80083ff4(param_2))) {
        param_3->damage = 0;
        param_3->Healing = 0;
        ApplySpellEffect(param_3->charSheetP,SVar3,Level,Level * 1800,param_5,param_3);
        if (SVar3 == tapStamina) {
          Entity::AllocEnchant(param_1->charSheetP,tapStamina,Level,0,Level * 1800,0);
        }
        combat_textbox_spell(param_1,param_3,param_2);
        return -1;
      }
      if (param_2->damage == 5) {
        combat_textbox_spell(param_1,param_3,param_2);
        return Level;
      }
      if (SVar3 != wind) {
        combat_textbox_spell(param_1,param_3,param_2);
        return (s32)param_2->damage;
      }
      iVar2 = FUN_8006d7d8(param_1,param_3,param_2,0xb,param_5,(char)Level) <<0x10;
    }
    else {iVar2 = dispel_magic_combat(param_1,param_3,param_2,SVar3,param_5) <<0x10;}
  }
  return (u32)(iVar2 >> 0x10);
}

s16 magic_damage_resist_calc(CombatEntity *param_1,CombatEntity *param_2,Temp_spell *param_3,u8 param_4){
  u8 bVar4;
  u32 uVar1;
  s32 iVar2;
  s16 sVar3;
  u8 abStack32 [32];
  
  noop_80070658();
  sVar3 = -2;
  if (find_spell_error(param_1,param_2,param_3,param_4)) {
    if (param_4 == false) {uVar1 = Entity::CheckSpellWizard(param_1->charSheetP,param_3);}
    else {uVar1 = (u32)param_3->level;}
    bVar4 = func_using_spell_charges(param_1,param_2,param_3,param_4);
    if (bVar4 == false) {sVar3 = -2;}
    else {
      abStack32[0] = param_1->charSheetP->spellVal;
      bVar4 = func_checking_vs_magic(param_1,param_3,param_2,(char *)abStack32);
      if (bVar4 == false) {sVar3 = -1;}
      else {
        iVar2 = calc_spell_damage_(param_1,param_3,param_2,uVar1,abStack32[0]);
        if (iVar2 < 0) {sVar3 = -3;}
        else {
          uVar1 = RollD(abStack32[0] + (char)iVar2,6);
          sVar3 = func_calcing_magic_resist(param_2,(s16)uVar1,param_3);
        }
      }
    }
  }
  return sVar3;
}

s16 func_calcing_magic_resist(CombatEntity *param_1,s16 param_2,Temp_spell *param_3){
  CombatAI_s* pcVar1;
  float afStack32 = 0.0;

  if (magic_resist_element_checks(param_1,param_3,&afStack32)) {
    param_2 *= afStack32);
    if ((afStack32 != 0.0) && (param_2 < 1)) {param_2 = 1;}
    if (((1.0f < afStack32) &&
        (pcVar1 = param_1->aiP, pcVar1)) &&
       ((pcVar1->flags & 8) != 0)) {pcVar1->flags |= 0x12;}
  }
  return param_2;
}

void Combat_Check_inv_for_potion(CombatEntity *param_1){
  inv_funcs *piVar1;
  
  if (param_1->aiP == NULL) {
    piVar1 = (PARTY)->inv->Functions;
    (*(piVar1->get_some_bool).func)
              ((s32)(PARTY)->inv->inv_slots +
               (s16)(piVar1->get_some_bool).arg[0] + -4,param_1->item | 0x1000,1);
    func_looking_for_flask(param_1);
  }
  return;
}


void FUN_8006dcd8(u32 param_1,PotionEnum param_2,CharSheet *param_3){
  playerData *ppVar1;
  Potion_effect *pPVar2;
  s32 uVar3;
  u32 uVar4;
  
  ppVar1 = gGlobals.playerDataArray[param_1];
  if (ppVar1) {
    ppVar1->ani_type = 5;
    uVar3 = FUN_800941e8(ppVar1,param_2);
    uVar4 = 0;
    pPVar2 = *param_3->potionEffects;
    while (((pPVar2 == NULL || (pPVar2->ID != param_2)) || (pPVar2->unk2 != 0xffff))) {
      uVar4++;
      if (6 < uVar4) {return;}
      pPVar2 = param_3->potionEffects[uVar4];
    }
    pPVar2->unk2 = uVar3;
  }
  return;
}


void combat_potion_heal(CombatEntity *param_1,CombatEntity *param_2,u16 HI,u16 Lo){
  u16 uVar1;
  
  uVar1 = potion_heal(param_1->charSheetP,HI,Lo);
  if (uVar1 == 0) {
    Gsprintf(gCombatP->textArray->potion failed,param_1->charSheetP->name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    print_combat_textbox(gCombatP,gGlobals.text,0);
  }
  else {
    FUN_8006dcd8((u32)param_1->index,param_1->item,param_1->charSheetP);
    combat_print_HP_gained(param_2,uVar1);
    copy_to_textbox_1(gCombatP);
  }
  return;
}

u8 combat_potion_effects(CombatEntity *param_1,CombatEntity *param_2){
  PotionEnum PVar1;

  PVar1 = param_1->item;
  if (PVar1 < POTION_STRENGTH) {
    if (PVar1 == POTION_HEALING) {
      combat_potion_heal(param_1,param_2,15,25);
      return true;
    }
    if (PVar1 == POTION_CURING) {
      combat_potion_heal(param_1,param_2,40,60);
      return true;
    }
    if (PVar1 == POTION_STAMINA) {
      clear_exhaustion(param_1->charSheetP);
      Gsprintf(gCombatP->textArray->potion full stamina,param_1->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      FUN_8006dcd8((u32)param_1->index,param_1->item,param_1->charSheetP);
      return true;
    }
    if (PVar1 == POTION_ANTIDOTE) {
      ApplySpellEffect(param_1->charSheetP,removePoison,0,0,0xff,param_1);
      Gsprintf(gCombatP->textArray->potion worked,param_1->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      FUN_8006dcd8((u32)param_1->index,param_1->item,param_1->charSheetP);
      return true;
    }
    if (PVar1 != POTION_RESTORE) {return false;}
    Entity::ClearDebuffSpells(param_1->charSheetP);
    FUN_8006dcd8((u32)param_1->index,param_1->item,param_1->charSheetP);
    Gsprintf(gCombatP->textArray->potion worked,param_1->charSheetP->name);
  }
  else {
    if (!has_potion_effect(param_1->charSheetP,PVar1)) {
      Entity::ApplyPotionEffect(param_1->charSheetP,param_1->item,0,0x9e340);
      Gsprintf(gCombatP->textArray->potion worked,param_1->charSheetP->name);
      FUN_8006dcd8((u32)param_1->index,param_1->item,param_1->charSheetP);
    }
    else {Gsprintf(gCombatP->textArray->potion already used,param_1->charSheetP->name);}
  }
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  print_combat_textbox(gCombatP,gGlobals.text,0);
  return true;
}

s16 Warrior_thrown_check(CombatEntity *param_1,CombatEntity *param_2,u8 param_3){
  u8 uVar1;
  CharStats_s* stats;
  CharStats_s* DefStats;
  CharSkills *pCVar2;
  s32 iVar5;
  s32 iVar6;
  s32 iVar7;
  char cVar12;
  char cVar13;
  s32 iVar8;
  s32 iVar9;
  u32 uVar10;
  s16 sVar11;
  u16 uVar14;
  
  stats = param_1->charSheetP->Stats;
  DefStats = param_2->charSheetP->Stats;
  pCVar2 = param_1->charSheetP->Skills;
  iVar5 = CharStats::getModded(stats,STAT_INT);
  iVar6 = CharStats::getModded(stats,STAT_DEX);
  iVar7 = CharStats::getBase(stats,STAT_LV);
  cVar12 = getModdedWeapon(pCVar2,Thrown);
  cVar13 = CharSkills::getModdedSkill(pCVar2,SKILL_Warrior);
  iVar8 = CharStats::getModded(DefStats,STAT_DEX);
  iVar9 = CharStats::getBase(DefStats,STAT_LV);
  uVar10 = get_sheild_warrior_skill(param_2);
  //(s32+STAT_DEX+LV)+(Thrown*6+Warrior*2+40)-((DefSheildWarrior/2)+DefDEX+DefLV)
  iVar5 = (((((iVar5 + iVar6 + iVar7) * 0x10000 >> 0x10) + cVar12 * 6 + cVar13 * 2 + 0x28) * 0x10000
           >> 0x10) - ((uVar10 >> 1 & 0xff) + iVar8 + iVar9)) * 0x10000;
  uVar14 = (u16)((u32)iVar5 >> 0x10);
  if (6 < param_3) uVar14 = (u16)(((iVar5 >> 0x10 & 0xffffU) - (param_3 - 5)) * 0x10000 >> 0x10);
  iVar5 = CombatEntity::TheifBackstabMod(param_1,uVar14,check_for_backstab(param_1,param_2),0,0x14);
  if (CharStats::getModded(DefStats,STAT_STAM) == 0) iVar5 = (iVar5 + 10) * 0x10000 >> 0x10; //+10 if tired target
  if (param_2->unk0x22 != 0) iVar5 = (iVar5 + -20) * 0x10000 >> 0x10; //-20 for some var
  sVar11 = (s16)iVar5;
  if (CombatEnt_flag_3(param_1)) sVar11 = (s16)((iVar5 + -25) * 0x10000) >> 0x10; //-25 for flag3
  iVar5 = some_night_check(param_1,sVar11,0x14,10,0x1e,(u16)param_3);
  sVar11 = CombatEntity::TroubadorMod(param_1,some_aspect_multi(param_1,iVar5));
  if (sVar11 < 5) sVar11 = 5; //floored at 5
  return sVar11;
}


void combat_print_swing_miss_2(CombatEntity *param_1,CombatEntity *param_2,u32 param_3){
  playerData *ppVar1;
  float fVar2;
  
  ppVar1 = gGlobals.playerDataArray[param_2->index];
  copyVec3((ppVar1->collision).position,gGlobals.unk0x1434);
  fVar2 = gEntityDB->GetHeight(param_2->charSheetP->ID);
  gGlobals.unk0x1434[1] += (fVar2 * 0.5f - (ppVar1->collision).radius);
  CombatEntity::WeaponSkillUpChance(param_1,(param_3 & 0xff) >> 1,Thrown);
  gGlobals.playerDataArray[param_1->index]->ani_type = 0xf;
  Combat_Check_inv_for_potion(param_1);
  Gsprintf(gCombatP->textArray->they attack,param_1->charSheetP->name,
              param_2->charSheetP->name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  Gsprintf(gCombatP->textArray->they miss_,param_1->charSheetP->name);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void NOOP_8006E430(void){}

u16 Get_flask_Damage(CombatEntity *param_1){
  u16 auStack136 [4]= {RollD(4,6),RollD(8,6),RollD(2,6),15};
  return auStack136[param_1->item];
}

void FUN_8006e4c0(CombatEntity *param_1,CombatEntity *param_2,s16 param_3){
  u8 A;
  u8 B;
  CombatEntity *pCVar1;
  playerData *ppVar2;
  u32 uVar3;
  u8 bVar9;
  u16 uVar7;
  s16 sVar8;
  s32 iVar4;
  s32 iVar5;
  u32 uVar6;
  u8 uVar10;
  u8 uVar11;
  u8 bStack48;
  u8 abStack47 [47];
  
  uVar11 = 0;
  A = gCombatP->unk0x5444[0];
  B = gCombatP->unk0x5444[1];
  if (param_1->item == POTION_ACID) {uVar11 = RollD(2,6);}
  uVar3 = 0;
  if (gCombatP->EntCount != 0) {
    do {
      pCVar1 = (&gCombatP->combatEnts)[uVar3];
      if ((pCVar1) && (!isDead(pCVar1->charSheetP))) {
        bStack48 = 0;
        abStack47[0] = 0;
        get_combatEnt_x_y(pCVar1,&bStack48,abStack47);
        uVar7 = sub_square_add_(A,B,bStack48,abStack47[0]);
        uVar10 = 1;
        if (1 < (uVar7)) {uVar10 = sub_square_add_(A,B,bStack48,abStack47[0]);}
        if ((param_1->item == POTION_ACID) && (uVar10 <= uVar11)) {
          if (uVar10 == 0) {trap(7);}
          Entity::ApplyPotionEffect(pCVar1->charSheetP,POTION_ACID,(char)(uVar11 / uVar10),0x9e340);
          FUN_8006dcd8((u32)pCVar1->index,param_1->item,pCVar1->charSheetP);
        }
        else {
          if (uVar10 <= param_3) {
            iVar5 = param_3 / uVar10;
            if (uVar10 == 0) {trap(7);}
            if (pCVar1 == param_2) {CombatEntity::PrintDamage(pCVar1,(s16)iVar5);}
            if (param_1->item == POTION_SLEEP) {
              if ((pCVar1 != param_2) &&
                 (CharStats::getModded(pCVar1->charSheetP->Stats,STAT_STAM) <= iVar5)) {
                iVar5 = CharStats::getModded(pCVar1->charSheetP->Stats,STAT_STAM);
                iVar5 = (iVar5 + -1) * 0x10000 >> 0x10;
              }
              if (iVar5 < 1) {pCVar1->damage = (u8)iVar5;}
              else {
                Entity::DecreaseHP(pCVar1->charSheetP,(s16)iVar5);
                FUN_8006dcd8((u32)pCVar1->index,param_1->item,pCVar1->charSheetP);
                pCVar1->damage = (u8)iVar5;
              }
            }
            else {
              if ((pCVar1 != param_2) &&
                 (getHPCurrent(pCVar1->charSheetP) <= iVar5)) {
                iVar5 = (s32)((getHPCurrent(pCVar1->charSheetP) - 1) * 0x10000) >> 0x10;
              }
              if (0 < iVar5) {
                Entity::DamageToLevel(pCVar1->charSheetP,(s16)iVar5,pCVar1);
                FUN_8006dcd8((u32)pCVar1->index,param_1->item,pCVar1->charSheetP);
              }
              pCVar1->damage = (u8)iVar5;
            }
            if (pCVar1 == param_2) {checkForCheatDeath(pCVar1,(s16)iVar5);}
            ppVar2 = gGlobals.playerDataArray[pCVar1->index];
            if ((ppVar2) && (ppVar2->ani_type = 7, pCVar1 != param_2)) {
              Print_damage_healing(ppVar2,(u16)pCVar1->damage,0,false,pCVar1->charSheetP);
              pCVar1->damage = 0;
            }
          }
        }
      }
      uVar3++;
    } while (uVar3 < gCombatP->EntCount);
  }
  return;
}
u8 Combat_potion_func(CombatEntity *param_1,CombatEntity *param_2){
  CharSkills *pCVar1;
  u8 bVar5;
  s16 sVar4;
  u32 uVar2;
  s32 iVar3;
  u8 bVar6;
  Borg_9_data *pBVar7;
  float fVar8;
  u8 bStack176 [2];
  vec3f afStack168;
  vec3f afStack104;
  
  if (!combat_potion_effects(param_1,param_2)) {
    pCVar1 = param_1->charSheetP->Skills;
    get_combatEnt_x_y(param_2,bStack176,bStack176 + 1);
    fVar8 = get_combatEnt_proximity(param_1,param_2);
    if (INT_MAX_f <= fVar8) {fVar8-= INT_MAX_f;}
    sVar4 = Warrior_thrown_check(param_1,param_2,(char)(s32)fVar8);
    iVar3 = skillcheck_float(param_1,(s16)RollD(1,100);,sVar4,SKILL_Warrior);
    bVar6 = getModdedWeapon(pCVar1,Thrown);
    if (bVar6 < 6) {uVar2 = (u32)(u8)(('\b' - bVar6) * ('\b' - bVar6));}
    else {uVar2 = 5;}
    if (sVar4 <= iVar3) {
      combat_print_swing_miss_2(param_1,param_2,uVar2);
      return 0;
    }
    NOOP_8006E430();
    pBVar7 = &(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat;
    setVec3(afStack168,(float)bStack176[0],50.0,(float)bStack176[1]);
    setVec3(afStack104,(float)bStack176[0],-10.0,(float)bStack176[1]);
    bVar5 = FUN_800adf78(pBVar7,afStack168,afStack104,0.5,gGlobals.unk0x1434,NULL,0);
    if (bVar5 == false) {setVec3(gGlobals.unk0x1434,(float)bStack176[0],0.0,(float)bStack176[1]);}
    bVar6 = Get_flask_Damage(param_1);
    Gsprintf(gCombatP->textArray->they attack,param_1->charSheetP->name,param_2->charSheetP->name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    print_combat_textbox(gCombatP,gGlobals.text,0);
    gCombatP->unk0x5444[0] = bStack176[0];
    gCombatP->unk0x5444[1] = bStack176[1];
    param_1->damage = bVar6;
    CombatEntity::WeaponSkillUpChance(param_1,uVar2,Thrown);
    gGlobals.playerDataArray[param_1->index]->ani_type = 0xf;
  }
  Combat_Check_inv_for_potion(param_1);
  return 0;
}

u8 user_target_in_party(CombatEntity *param_1,CombatEntity *param_2,playerData * param_3){
  u32 uVar1;
  s8 sVar3;
  u8 bVar4;
  u32 uVar2;
  
  uVar1 = getHPCurrent(param_2->charSheetP);
  sVar3 = PARTY->GetMemberIndex(param_1->charSheetP->ID);
  bVar4 = PARTY->GetMemberIndex(param_2->charSheetP->ID);
  if ((sVar3 != 0xff) && ((bVar4 != 0xff)) {
    if ((param_1->flags & flag8) == 0) {pass_to_party_healing_func(PARTY,(u32)uVar5,(s32)(char)bVar4 & 0xff);}
    else {pass_to_healing_func_2(PARTY,sVar3,bVar4);}
    if ((s32)uVar1 < (s32)getHPCurrent(param_2->charSheetP)) {
      uVar2 = getHPCurrent(param_2->charSheetP);
      Gsprintf(gCombatP->textArray->they heal,param_1->charSheetP->name,
                  param_2->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      combat_print_HP_gained(param_2,(s16)((uVar2 - uVar1) * 0x10000 >> 0x10));
      param_3->ani_type = 5;
      param_2->Healing = (u8)(uVar2 - uVar1);
    }
    else {
      Gsprintf(gCombatP->textArray->they failed heal,param_1->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
    }
  }
  return 0;
}

u8 Combat_selectAttack(CombatEntity *param_1,CombatEntity *param_2,playerData *param_3){
  u8 bVar1;
  u8 SetAni;
  u8 bVar5;
  s16 sVar3;
  
  bVar5 = 0;
  SetAni = true;
  bVar1 = param_1->AtkType;
  if (bVar1 != 2) {
    if (bVar1 < 3) {
      if (bVar1 == 1) {bVar5 = CombatEntity::CalculateWeaponAttack(param_1,param_2);}
      else {SetAni = false;}
      goto SetAnimation;
    }
    if (bVar1 == 3) {
      bVar5 = Combat_potion_func(param_1,param_2);
      SetAni = false;
      goto SetAnimation;
    }
    if (bVar1 != 4) {
      SetAni = false;
      goto SetAnimation;
    }
    param_1->AtkType = 1;
    if (func_checking_shadow(param_1,param_2,0)) {
      bVar5 = CombatEntity::CalculateWeaponAttack(param_1,param_2);
      param_1->AtkType = 4;
      goto SetAnimation;
    }
    param_1->AtkType = 4;
  }
  bVar5 = some_combat_weapon_func(param_1,param_2);
SetAnimation:
  if (SetAni) {param_3->ani_type = get_weapon_animation(param_1,param_1->charSheetP->weapons->animation);}
  return bVar5;
}

void set_movement_spellUsed(playerData *param_1,u16 param_2,u16 param_3){
  param_1->movement_ = param_2;
  param_1->spellUsed = param_3;}

s32 FUN_8006edd0(CombatEntity *param_1,CombatEntity *param_2,playerData *param_3,playerData *param_4){
  Temp_enchant *pTVar1;
  Temp_spell *pTVar2;
  s16 sVar4;
  SpellEnum SVar5;
  s32 uVar3;
  s32 iVar6;
  u32 uVar7;
  longlong lVar8;
  longlong lVar9;
  
  pTVar2 = Entity::getSpellSafe(param_1->charSheetP,0x13cb,(void *)D_800f5440);
  if (pTVar2 == NULL) {return 0;}
  sVar4 = magic_damage_resist_calc(param_1,param_2,pTVar2,false);
  lVar9 = (longlong)sVar4;
  if (lVar9 == 0) {print_spell_cast_resist(param_2,param_2,pTVar2);}
  lVar8 = lVar9;
  if (lVar9 == 0xfffd) {lVar8 = 0;}
  if (lVar8 == 0xffff) {
    lVar9 = -1;
    lVar8 = 0;
  }
  if (lVar8 == 0xfffe) {
    lVar9 = -2;
    lVar8 = 0;
  }
  param_3->ani_type = 5;
  SVar5 = GetIDIndex(pTVar2->id);
  set_movement_spellUsed(param_3,param_3->ani_type,(s16)SVar5);
  uVar3 = FUN_80095c04(param_3,param_4,SVar5,lVar9);
  if ((lVar8 != 0) || (iVar6 = 0, lVar9 == 0xfffd)) {
    lVar9 = FUN_80083ff4(pTVar2);
    iVar6 = (s32)lVar8 << 0x10;
    if (lVar9 != 0) {
      pTVar1 = param_2->charSheetP->spellEffects->list[0];
      if (pTVar1 == NULL) {uVar7 = 1;}
      else {
        if (pTVar1->index == (char)SVar5) {
          if (pTVar1->unk0x14 == 0xffff) {
            pTVar1->unk0x14 = uVar3;
            goto LAB_8006ef64;
          }
          uVar7 = 1;
        }
        else uVar7 = 1;
      }
      while (uVar7 < 0xf) {
        pTVar1 = param_2->charSheetP->spellEffects->list[uVar7];
        if (pTVar1 == NULL) uVar7++;
        else {
          if (pTVar1->index == SVar5) {
            if (pTVar1->unk0x14 == 0xffff) {
              pTVar1->unk0x14 = uVar3;
              break;
            }
            uVar7++;
          }
          else uVar7++;
        }
      }
    }
  }
LAB_8006ef64:
  return iVar6 >> 0x10;
}


s16 tick_goblin_ambush(CombatEntity *param_1,CombatEntity *param_2,s16 param_3){
  CharSheet *pCVar1;
  s32 iVar2;
  s16 sVar3;
  
  sVar3 = 0;
  if (((param_3 != 0) && //is Alaron Target during Goblin Ambush
      (pCVar1 = param_2->charSheetP, sVar3 = param_3, pCVar1->ID == (ItemID)(entityList[153] | 0x200)))
      && (gCombatP->encounter_dat->EncounterID == FLAG_GoblinAmbush)) {
    CombatEntity::PrintDamage(param_2,1);
    gGlobals.GoblinHitTally--;
    sVar3 = 1;
    if (gGlobals.GoblinHitTally == 0) {
      CharStats::addModdedHealth(pCVar1->Stats,STAT_STR,-(char)CharStats::getModded(pCVar1->Stats,STAT_STR));
      check_petrify_int_dex_wil_str(param_2);
      sVar3 = 1;
    }
  }
  return sVar3;
}


void checkForCheatDeath(CombatEntity *param_1,s16 param_2){
  if (getHPCurrent(param_1->charSheetP) <= param_2) {
    if (!Entity::hasCheatDeath(param_1->charSheetP)) {
      Gsprintf(gCombatP->textArray->they died,param_1->charSheetP->name);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      CombatEntity::Death(param_1);
    }
    else {
      Gsprintf(gCombatP->textArray->Cheated Death,param_1->charSheetP->name);
      print_combat_textbox(gCombatP,gGlobals.text,0);
    }
  }
  return;
}


u8 some_attack_calc(CombatEntity *user,CombatEntity *target,u8 param_3){
  u8 bVar1;
  playerData *ppVar2;
  playerData *ppVar3;
  u16 uVar5;
  s16 sVar6;
  
  ppVar2 = gGlobals.playerDataArray[user->index];
  ppVar3 = gGlobals.playerDataArray[target->index];
  if (CombatEnt_flag_2(user)) {func_8006f2cc(user);}
  user->TargetIndex = (u32)target->index;
  if (param_3 == 0) {
    clear_substruct2_arrayB(gCombatP->substruct2);
    uVar5 = FUN_8006edd0(user,target,ppVar2,ppVar3);
  }
  else {
    clear_substruct2_arrayB(gCombatP->substruct2 + 1);
    if (!CombatEnt_flag_check(user)) {uVar5 = Combat_selectAttack(user,target,ppVar2);}
    else {uVar5 = user_target_in_party(user,target,ppVar2);}
  }
  playerdata_NAND_flags(ppVar2,2);
  sVar6 = tick_goblin_ambush(user,target,uVar5);
  checkForCheatDeath(target,sVar6);
  user->unk0x22 = 1;
  if (user->AtkType != 3) {target->damage = (u8)sVar6;}
  set_camera_playerdata_focus(ppVar2,ppVar3);
  gGlobals.combatBytes[0] = 2;
  gGlobals.combatBytes[1] = 2;
  set_combatflag_42(1);
  return sVar6 != 0;
}

void FUN_8006f2cc(CombatEntity *param_1){
  CombatEnt_NAND_flags(param_1,flag2);
  gCombatP->Troubador = 0;
  if (gGlobals.playerDataArray[param_1->index])
    {FreeAttachmentFromPlayer(gGlobals.playerDataArray[param_1->index],2);}
}

void check_petrify_int_dex_wil_str(CombatEntity *param_1){
  u8 bVar2;
  
  bVar2 = check_for_petrify_effect(param_1);
  if ((((CharStats::getModded(param_1->charSheetP->Stats,STAT_INT) == 0) || (CharStats::getModded(param_1->charSheetP->Stats,STAT_WIL) == 0)) ||
      (CharStats::getModded(param_1->charSheetP->Stats,STAT_DEX) == 0)) ||
     ((CharStats::getModded(param_1->charSheetP->Stats,STAT_STR) == 0 || (bVar2)))) {
    CombatEnt_NAND_flags(param_1,flag1);
  }
  else {CombatEnt_OR_flags(param_1,flag1);}
}

void rand_wonky_troub_check(CombatEntity *param_1,u8 param_2){
  if (RollD(1,100) <= (param_2 / 10)) {wonky_baseskill_check(param_1->charSheetP->Skills,Troubadour,1);}}

void FUN_8006f448(CombatEntity *param_1){
  playerData *ppVar1;
  vec3f afStack80;
  
  ppVar1 = gGlobals.playerDataArray[param_1->index];
  if (ppVar1) {
    setVec3(afStack80,param_1->coord[0],(ppVar1->collision).position[1],param_1->coord[1]);
    Actor::MoveNearShadow(ppVar1,afStack80,(float)param_1->move_length);
  }
}

void combat_troubadour(CombatEntity *param_1){
  CombatEntity *pCVar1;
  playerData *ppVar2;
  s32 iVar3;
  char cVar5;
  u8 bVar6;
  s16 sVar7;
  u32 uVar8;
  u32 uVar9;
  
  if (gCombatP->Troubador == 0) {
    if (CharStats::getModded(param_1->charSheetP->Stats,STAT_STAM) == 0) {
      Gsprintf(gCombatP->textArray->too tired to perform,param_1->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      gGlobals.combatBytes[0] = 1;
    }
    else {
      iVar3 = (CharSkills::getModdedSkill(param_1->charSheetP->Skills,Troubadour) * 5 + CharStats::getModded(param_1->charSheetP->Stats,STAT_INT)) * 0x20000 >> 0x10;
      uVar8 = RollD(1,100);
      bVar6 = CharSkills::getModdedSkill(param_1->charSheetP->Skills,Troubadour);
      if (bVar6 < 6) {uVar9 = (u32)(u8)(('\b' - bVar6) * ('\b' - bVar6));}
      else {uVar9 = 8;}
      ppVar2 = gGlobals.playerDataArray[param_1->index];
      if (iVar3 < uVar8) { //(troub*5+s32*2)<rand(1,100)
        Gsprintf(gCombatP->textArray->they failed troubador,param_1->charSheetP->name);
        copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
        print_combat_textbox(gCombatP,gGlobals.text,0);
        rand_wonky_troub_check(param_1,(u8)(uVar9 >> 1));
      }
      else {
        sVar7 = (s16)((u32)((iVar3 - (s16)uVar8) * 0x10000) >> 0x10);
        //(troub*5+s32*2)-rand(1,100)
        if (some_skillcheck_calc(sVar7) < 2) bVar6 = 1;
        else bVar6 = (u8)some_skillcheck_calc(sVar7);
        CombatEnt_OR_flags(param_1,flag2);
        CombatEnt_NAND_flags(param_1,flag8);
        CombatEnt_NAND_flags(param_1,flag9);
        gCombatP->Troubador = bVar6;
        Entity::DecreaseHP(param_1->charSheetP,3);
        Gsprintf(gCombatP->textArray->they perform,param_1->charSheetP->name);
        copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
        print_combat_textbox(gCombatP,gGlobals.text,0);
        rand_wonky_troub_check(param_1,(u8)uVar9);
        AttachItemToPlayer(ppVar2,2,0x1abb);
      }
      ppVar2->ani_type = 5;
      combat_byte_0x1a(ppVar2);
    }
  }
  else {
    uVar8 = 0;
    Gsprintf(gCombatP->textArray->they failed troubador,param_1->charSheetP->name);
    while (uVar8 < 4) {
      pCVar1 = (&gCombatP->combatEnts)[uVar8];
      if (pCVar1 == NULL) uVar8++;
      else {
        if (CombatEnt_flag_2(pCVar1)) {
          Gsprintf(gCombatP->textArray->already performing,pCVar1->charSheetP->name);
          break;
        }
        uVar8++;
      }
    }
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    print_combat_textbox(gCombatP,gGlobals.text,0);
    gGlobals.combatBytes[0] = 1;
  }
  return;
}



void FUN_8006f7f8(CombatEntity *param_1,Struct_char_flags param_2){
  if (!CombatEnt_flag_check(param_1)) {
    CombatEnt_OR_flags(param_1,param_2);
    if (CombatEnt_flag_2(param_1)) {func_8006f2cc(param_1);}
    FUN_80072454(gCombatP->substruct2,param_1);
  }
  else {
    if ((param_1->flags & param_2) == 0) {
      CombatEnt_NAND_flags(param_1,flag8);
      CombatEnt_NAND_flags(param_1,flag9);
      CombatEnt_OR_flags(param_1,param_2);
    }
  }
}

void FUN_8006f8a0(CombatEntity *param_1){func_8006f7f8(param_1,flag8);}
void FUN_8006f8bc(CombatEntity *param_1){func_8006f7f8(param_1,flag9);}


void FUN_8006f8d8(CombatEntity *param_1,ItemID param_2,u8 param_3){
  u8 bVar1;
  PotionEnum PVar2;
  u8 bVar3;
  
  param_1->unk0x26 = param_3;
  param_1->item = GetIDIndex(param_2);
  bVar1 = param_1->AtkType;
  if (bVar1 != 3) {
    param_1->AtkType = 3;
    if (CombatEnt_flag_2(param_1)) {func_8006f2cc(param_1);}
    CombatEnt_NAND_flags(param_1,flag8);
    CombatEnt_NAND_flags(param_1,flag9);
    get_weapon_sheild_borg5(param_1);
    param_1->unk0x24 = bVar1;
  }
}


void func_looking_for_flask(CombatEntity *param_1){
  if (!CombatEnt_flag_check(param_1)) {
    if (param_1->AtkType == 3) {
      if (param_1->item < POTION_HEALING) {
        if (PARTY->inv->HasItem((ItemID)(param_1->item | 0x1000))) {
          param_1->AtkType = 0;
          get_weapon_sheild_borg5(param_1);
        }
      }
      else {
        param_1->AtkType = param_1->unk0x24;
        get_weapon_sheild_borg5(param_1);
      }
    }
  }
  else {
    CombatEnt_NAND_flags(param_1,flag8);
    CombatEnt_NAND_flags(param_1,flag9);
  }
}

u32 check_sheild_borg5_(CombatEntity *param_1){
  ArmorInstance *ptVar1;
  u32 uVar3;
  u32 uVar4;
  
  uVar4 = 0xffffffff;
  if (!cannotSheild(param_1->charSheetP->ID)) {
    ptVar1 = param_1->charSheetP->armor[1];
    if (ptVar1 == NULL) {uVar4 = 0xffffffff;}
    else {
      uVar3 = get_sheild_borg5(ptVar1->id);
      uVar4 = 0xffffffff;
      if (uVar3 != 0x38f9) {uVar4 = uVar3;}
    }
  }
  return uVar4;
}

u16 get_weapon_borg5(CombatEntity *param_1){
  WeaponInstance *pTVar1;
  u16 uVar2;
  u16 uVar3;
  
  pTVar1 = param_1->charSheetP->weapons;
  if (pTVar1 == NULL) {uVar3 = 0xffff;}
  else {
    uVar2 = Weapon_borg5_lookup(GetIDIndex(pTVar1->id));
    uVar3 = 0xffff;
    if (uVar2 != 0xffff) {uVar3 = uVar2;}
  }
  return uVar3;
}


u8 bow_eqquiped(CombatEntity *param_1){
  WeaponInstance *pTVar2;
  u8 bVar3;
  u8 *pbVar4;
  u8 missle_ids[9]={53,55,56,54,58,56,57,60,255}

  pTVar2 = param_1->charSheetP->weapons;
  if (pTVar2) {
    bVar3 = GetIDIndex(pTVar2->id);
    if (missle_ids[0] != 0xff) {
      pbVar4 = missle_ids;
      do {
        if (*pbVar4++ == bVar3) {return true;}
      } while (*pbVar4 != 0xff);
    }
  }
  return false;
}


void attach_wep_sheild_borg5(CombatEntity *param_1,u32 param_2,s32 param_3,u32 borg5){
  playerData *ppVar1;
  
  if (borg5 != 0xffffffff) {
    ppVar1 = gGlobals.playerDataArray[param_1->index];
    if (ppVar1->locator_pointer) {
      HasLocator(ppVar1->locator_pointer->aniDat,param_3);
    }
    AttachItemToPlayer(ppVar1,param_2 & 0xffff,borg5);
    ChangeAttachmentNode(ppVar1,param_2 & 0xffff,(u16)param_3,0);
  }
}

void throwing_equipped(CombatEntity *param_1){
  u8 bVar1;
  u8 bVar3;
  u8 *pbVar4;
  
  param_1->throwingFlag = 0;
  if (param_1->AtkType == 3) {if (param_1->item < POTION_HEALING) {param_1->throwingFlag = 1;}}
  else {
    if (param_1->charSheetP->weapons) {
      if (!bow_eqquiped(param_1)) {
        bVar3 = GetIDIndex(param_1->charSheetP->weapons->id);
        if (throwing_ids[0] != 0xff) {
          pbVar4 = throwing_ids;
          do {
            bVar1 = *pbVar4;
            pbVar4++;
            if (bVar1 == bVar3) goto LAB_8006fc48;
          } while (*pbVar4 != 0xff);
        }
      }
      else {
LAB_8006fc48:
        param_1->throwingFlag = 1;
      }
    }
  }
  return;
}

void get_weapon_sheild_borg5(CombatEntity *param_1){
  playerData *ppVar1;
  u32 borg5;
  u32 borg5_00;
  
  ppVar1 = gGlobals.playerDataArray[param_1->index];
  borg5_00 = 0xffffffff;
  FreeAttachmentFromPlayer(ppVar1,1);
  FreeAttachmentFromPlayer(ppVar1,0);
  param_1->unk0x88 = 0;
  param_1->unk0x89 = 2;
  borg5 = check_sheild_borg5_(param_1);
  if (param_1->AtkType != 0) {
    if (param_1->AtkType == 3) {borg5_00 = 0x34c5;}
    else {
      if (param_1->charSheetP->weapons) {
        borg5_00 = 0x348f;
        if (!bow_eqquiped(param_1)) {borg5_00 = get_weapon_borg5(param_1);}
        else {
          param_1->unk0x89 = param_1->notboss != 0;
          param_1->unk0x88 = param_1->notboss == 0;
          borg5 = get_weapon_borg5(param_1);
        }
      }
    }
  }
  throwing_equipped(param_1);
  attach_wep_sheild_borg5(param_1,1,(u32)param_1->unk0x89,borg5);
  if (!CannotShowWeapon(param_1->charSheetP->ID)) {attach_wep_sheild_borg5(param_1,0,(u32)param_1->unk0x88,borg5_00);}
  return;
}

u8 cannotSheild(ItemID param_1){return gEntityDB->entities[GetIDIndex(param_1)].sheildStat == -1;}

/* ehud gorgon chaos.Lt. harpy marquis minotuar mino.lord neilsin */
u8 CannotShowWeapon(ItemID param_1){
  u8 bVar2;
  u8 *pbVar1;
  u32 uVar3;
  u8 auStack72 [12];
  
  auStack72._0_4_ = BYTE_ARRAY_800dfb9c._0_4_;
  auStack72._4_4_ = BYTE_ARRAY_800dfb9c._4_4_;
  auStack72[8] = BYTE_ARRAY_800dfb9c[8];
  bVar2 = GetIDIndex(param_1);
  uVar3 = 0;
  pbVar1 = auStack72;
  while( true ) {
    if (auStack72[0] == 0xff) {return false;}
    if (*pbVar1 == bVar2) break;
    uVar3++;
    auStack72[0] = auStack72[uVar3];
    pbVar1 = auStack72 + uVar3;
  }
  return true;
}

AnimationData * get_weapon_anidat(CombatEntity *param_1){
  WeaponInstance *pTVar1;
  u8 bVar5;
  u8 bVar6;
  u16 uVar4;
  u32 uVar2;
  AnimationData *pAVar3;
  s16 lVar7;
  u32 uVar8;
  
  if (CannotShowWeapon(param_1->charSheetP->ID)) {return NULL;}
  if (param_1->AtkType == 3) {
    lVar7 = 0x34c5;
LAB_8006ff78:
    pAVar3 = BorgAnimLoadScene((u32)lVar7);
  }
  else {
    pTVar1 = param_1->charSheetP->weapons;
    if (pTVar1) {
      bVar6 = GetIDIndex(pTVar1->id);
      lVar7 = (s16)Weapon_borg5_lookup(bVar6);
      if (lVar7 != -1) {
        if (missle_ids[0] != 0xff) {
          if (missle_ids[0] == bVar6) {lVar7 = 0x348f;}
          else {
            uVar2 = 1;
            do {
              uVar8 = uVar2 & 0xffff;
              if (missle_ids[uVar8] == 0xff) goto LAB_8006ff78;
              uVar2 = uVar8 + 1;
            } while (missle_ids[uVar8] != bVar6);
            lVar7 = 0x348f;
          }
        }
        goto LAB_8006ff78;
      }
    }
    pAVar3 = NULL;
  }
  return pAVar3;
}

void get_ranged_weapon_floats(CombatEntity *param_1,float *param_2,float *param_3,float *param_4){
  u8 bVar7;
  float fVar8;
  
  bVar7 = param_1->AtkType;
  if (bVar7 == 3) {
switchD_80070018_caseD_3d:
    fVar8 = 8.0f;
    *param_2 = 4.0f;
    goto LAB_800701bc;
  }
  if (bVar7 < 4) {}
  else {
    if (bVar7 != 4) {return;}
  }
  fVar8 = 6.0f;
  switch(GetIDIndex(param_1->charSheetP->weapons->id)) {
  case 0x35: //Bow of Accuracy
    *param_2 = 9.9f;
    *param_3 = 0.0;
    break;
  case 0x36: //Bow of Shielding
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case 0x37: //Bow of Thunder
    *param_2 = 9.0f;
    *param_3 = 0.0;
    break;
  case 0x38: //Heartseeker
    *param_2 = 9.0f;
    *param_3 = 0.0;
    break;
  case 0x39: //Great Bow
    *param_2 = 9.0f;
    *param_3 = 0.0;
    break;
  case 0x3a: //Hunter's bow
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case 0x3b: //Long bow
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case 0x3c: //s16 Bow
    *param_2 = 5.0f;
    *param_3 = 0.0;
    break;
  default:
    goto switchD_80070018_caseD_3d;
  case 0x46: //venom spit
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case 0x5e: //Dragon Fang
    *param_2 = 8.0f;
    goto LAB_800701bc;
  case 0x5f: //Throwing Iron
    *param_2 = 8.0f;
    fVar8 = 20.0f;
    goto LAB_800701bc;
  case 0x60: //Throwing Knife
    *param_2 = 5.0f;
    fVar8 = 12.0f;
    goto LAB_800701bc;
  case 0x61: //Cyclops Hurlstar
    *param_2 = 5.0f;
    fVar8 = 12.0f;
    goto LAB_800701bc;
  case 0x62: //Dart of Distance
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case 99: //poison Dart
    *param_2 = 5.0f;
    *param_3 = 0.0;
    break;
  case 100: //spikes
    *param_2 = 5.0f;
    *param_3 = 0.0;
    break;
  case 0x65: //hatchet
    *param_2 = 5.0f;
    fVar8 = 6.0f;
LAB_800701bc:
    *param_3 = fVar8;
    break;
  case 0x66: //Javelin
    *param_2 = 5.0f;
    *param_3 = 0.0;
    *param_4 = 90.0f;
    return;
  }
  *param_4 = 0.0;
  return;
}

void clear_combatEnt_effects(CombatEntity *param_1){
  u32 uVar1;
  u32 uVar2 = 0;
  if (param_1->charSheetP->spellEffects) {
    uVar1 = 0;
    do {
      uVar2++;
      Entity::ClearSpellEffect(param_1->charSheetP,uVar1,param_1);
      uVar1 = uVar2 & 0xff;
    } while (uVar2 < 0xf);
  }
}

void FUN_80070234(CombatEntity *param_1){
  playerData *ppVar1 = gGlobals.playerDataArray[param_1->index];
  if (ppVar1) {
    FUN_800714d0(&gCombatP->substruct,get_combatEnt_x(param_1),get_combatEnt_y(param_1),param_1->unk0x23);
    param_1->coord = {(ppVar1->collision).position[0],(ppVar1->collision).position[2]};
    FUN_800713fc(&gCombatP->substruct,get_combatEnt_x(param_1),get_combatEnt_y(param_1),(u32)param_1->unk0x23);
  }
}

void FUN_80070304(CombatEntity *param_1){
  u32 uVar1;
  CombatEntity *pCVar2;
  u8 bVar3;
  
  uVar1 = param_1->TargetIndex;
  if (-1 < (s32)uVar1) {
    pCVar2 = (&gCombatP->combatEnts)[uVar1];
    param_1->TargetIndex = -1;
    if ((pCVar2) && (!isDead(pCVar2->charSheetP))) {param_1->TargetIndex = uVar1;}
  }
}

void CombatEntity::PrintDamage(CombatEntity *param_1,s16 param_2){
  if (param_2 < 2) {Gsprintf(gCombatP->textArray->they lose1HP,param_1->charSheetP->name);}
  else {Gsprintf(gCombatP->textArray->they lose  hp,param_1->charSheetP->name,param_2);}
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void combat_print_HP_gained(CombatEntity *param_1,s16 param_2){
  if (param_2 < 2) {Gsprintf(gCombatP->textArray->they gain 1HP,param_1->charSheetP->name);}
  else {Gsprintf(gCombatP->textArray->they gain hp,param_1->charSheetP->name,param_2);}
  print_combat_textbox(gCombatP,gGlobals.text,0);
  return;
}

void set_atk_range_multi(CombatEntity *param_1,u8 param_2){
  WeaponInstance *pTVar1;
  u8 bVar3;
  
  param_1->AtkType = 0;
  pTVar1 = param_1->charSheetP->weapons;
  if (pTVar1) {
    bVar3 = 1;
    if (pTVar1->range != 0) {
      bVar3 = 2;
      if (isBreathSpitOrSpikes(pTVar1)) {bVar3 = 4;}
    }
    param_1->AtkType = bVar3;
  }
  if (param_2) {func_80072454(gCombatP->substruct2,param_1);}
  get_weapon_sheild_borg5(param_1);
}

void CombatEntity::PrintEvade(CombatEntity *param_1,CombatEntity *param_2){
  Gsprintf(gCombatP->textArray->they attack,param_1->charSheetP->name,
              param_2->charSheetP->name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  Gsprintf(gCombatP->textArray->they avoid,param_2->charSheetP->name);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}


void combat_print_swing_and_miss(CombatEntity *param_1,CombatEntity *param_2){
  CharSheet *pCVar1 = param_2->charSheetP;
  Gsprintf(gCombatP->textArray->they attack,param_1->charSheetP->name,pCVar1->name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  Gsprintf(gCombatP->textArray->they miss,param_1->charSheetP->name,pCVar1->name);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void noop_80070658(void){}
s16 retMinus1(void){return -1;}
s16 passto_retMinus1(void){return retMinus1();}