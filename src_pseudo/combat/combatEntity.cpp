#define FILENAME "../combatengine/combatEntity.cpp"


#include "combat/CombatEntity.h"
#include "combat/CombatStruct.h"
#include "globals.h"

extern void copy_string_to_combat_textbox(CombatStruct*,char*,u32);
extern void print_combat_textbox(CombatStruct*,char*,u32);

void Ofunc_NOOP_80067c70(void){}
void Ofunc_NOOP_(void){}


void CombatEntity::Init(CharSheet *charsheet,int param_3,u8 startx,
                       u8 starty,s8 param_6,u8 param_7,int isAI,u8 index){
  ItemID IVar1;
  SpellBook *pSVar2;
  SpellInstance *pSVar3;
  Entity_Ram *pEVar4;
  byte bVar8;
  u8 bVar9;
  u8 X;
  u8 Y;
  u8 *pEVar5;
  CombatAI_s *pCVar6;
  int iVar7;
  float *pfVar10;
  uint uVar11;
  uint uVar12;
  resist_float *prVar13;
  float *pfVar14;
  float fVar15;
  
  CLEAR(this);
  this->charSheetP = charsheet;
  bVar8 = GetIDIndex(charsheet->ID);
  (this->coord2).x = startx;
  (this->coord).x = startx;
  (this->coord2).y = starty;
  (this->coord).y = starty;
  this->unk14 = param_6;
  this->unk23 = param_7;
  SetCardinalFacing(param_6);
  this->notboss = gEntityDB->IsNotBoss(charsheet->ID);
  FUN_800713fc(&gCombatP->substruct,GetCoordXU8(),GetCoordYU8(),this->unk23);
  pSVar2 = charsheet->spellbook;
  if (((pSVar2 != NULL) && (pSVar2->spells != NULL)) && (pSVar2->count != 0)) {
    for(u32 i=0;i < pSVar2->count;i++) {
      if (charsheet->spellbook->spells[i]) {
        this->charSheetP->spellSwitch = 1;
        this->charSheetP->currSpell = i;
        break;
      }
    }
  }
  else {
    this->charSheetP->spellSwitch = 1;
    this->charSheetP->currSpell = 0;
  }
  pfVar14 = &this->resists[0].percent;
  uVar12 = 0;
  prVar13 = this->resists;
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
  this->flags = COMBATENT_CANMOVE;
  if (isAI)
    this->flags = COMBATENT_CANMOVE|COMBATENT_ALLY|COMBATENT_ENEMY;
  this->index = index;
  if (isAI) {
    ALLOC(this->aiP,0xcc);
    CombatAIInfo::Init(this->aiP,this->charSheetP->ID,this);
  }
  this->shieldLocator = 2;
  this->TargetIndex = -1;
                    // check for Shadow and horn
  if (((ItemID)(entityList[172] + 0x200) == this->charSheetP->ID) &&(HasHornOfKynon())) {
    iVar7 = CharStats::getBase(this->charSheetP->Stats,STAT_DEX);
    if (0 < 30 - iVar7) {
      CharStats::AddBase(this->charSheetP->Stats,STAT_DEX,30 - iVar7);
    }
  }
}

void CombatEntity::FreeAi(){
  if (this->aiP) {
    CombatAIInfo::Free(this->aiP);
    FREE(this->aiP,0xf0);
  }
}

void CombatEntity::GetCoordU8(u8 *x,u8 *y){
  *x = GetCoordXU8();
  *y = GetCoordYU8();
}


void CombatEntity::GetCoord(float *x,float *y){
  *x = (this->coord).x;
  *y = (this->coord).y;
}

void CombatEntity::GetCoord2(float *x,float *y){
  *x = (this->coord2).x;
  *y = (this->coord2).y;
}

u8 CombatEntity::GetCoordXU8(){
  if(this->coord.x<=0.0) return -(.5-this->coord.x);
  return (.5+this->coord.x);
}

u8 CombatEntity::GetCoordYU8(){
  if(this->coord.y<=0.0) return -(.5-this->coord.y);
  return (.5+this->coord.y);
}

u8 CombatEntity::GetCoord2XU8(){
    if(this->coord2.x<=0.0) return -(.5-this->coord2.x);
  return (.5+this->coord2.x);
}

u8 CombatEntity::GetCoord2YU8(){
    if(this->coord2.y<=0.0) return -(.5-this->coord2.y);
  return (.5+this->coord2.y);
}

float CombatEntity::GetCoordX(){return this->coord.x;}
float CombatEntity::GetCoordY(){return this->coord.y;}
float CombatEntity::GetCoord2X(){return this->coord2.x;}
float CombatEntity::GetCoord2Y(){return this->coord2.y;}


void CombatEntity::SetCoords(float x,float y){
  (this->coord).x = x;
  (this->coord).y = y;
}

void CombatEntity::SetCoords2(float x,float y){
  this->coord2.x = x;
  this->coord2.x = y;}


/* Used for Casting Magic */
u8 CombatEntity::Flag0(){return (bool)((u8)this->flags & 1);}
//the rest, mostly no clue
u8 CombatEntity::Flag1(){return this->flags >> 1 & 1;}
//troubador related (raised if performer?)
u8 CombatEntity::Flag2(){return this->flags >> 2 & 1;}
u8 CombatEntity::Flag3(){return this->flags >> 3 & 1;}
//this one is friend-or-foe, i think
u8 CombatEntity::Flag4(){return this->flags >> 4 & 1;}
u8 CombatEntity::Flag5(){return this->flags >> 5 & 1;}
u8 CombatEntity::Flag6(){return this->flags >> 6 & 1;}
u8 CombatEntity::Flag7(){return this->flags >> 7 & 1;}

u8 CombatEntity::Flag89(){return (this->flags & (COMBATENT_MEDIC|COMBATENT_HERBS)) !=0;}
void CombatEntity::SetFlag(u16 f){flags |= f;}
void CombatEntity::UnsetFlag(u16 f){flags &= ~f;}
void CombatEntity::ToggleFlag(u16 f){flags ^= f;}

u8 CombatEntity::UnusedMovement(){
  if (moveRange - sub_square_add_sqrt(GetCoordXU8(),GetCoordYU8(),GetCoord2XU8(),GetCoord2YU8()) < 1)
   return 0;
   return moveRange - sub_square_add_sqrt(GetCoordXU8(),GetCoordYU8(),GetCoord2XU8(),GetCoord2YU8());
  }

void CombatEntity::NOOP_80068350(){}

u8 CombatEntity::m80068358(){
  if (gCombatP->EntCount) {
    for(u32 i=0;i<gCombatP->EntCount;i++) {
      CombatEntity *CEnt = (&gCombatP->combatEnts)[i];
      if ((((CEnt) && (this != CEnt)) &&
          (!Entity::isDead(CEnt->charSheetP))) && (CEnt->Flag1())) {
        if ((CEnt->Flag4() != this->Flag4())&& (CEnt->m800692bc())) return false;
      }
    }
  }
  return true;
}
//increments in Dexterity 
u8 DEX_steps[16]{0,0,0,3,7,12,16,21,26,28,30,33,36,38,0,0};

void CombatEntity::SetMovementRange(){
  u8 bVar4;
  u32 uVar7;

  NOOP_80068350();
  this->moveRange = 0;
  while (this->moveRange < 14) {
    if (CharStats::getModded(this->charSheetP->Stats,STAT_DEX) <= DEX_steps[this->moveRange]) break;
    this->moveRange++;
  }
  for(u8 i=0;i<MAGIC_FXMAX;i++) {
    Temp_enchant *pTVar1 = this->charSheetP->effects[i];
    if (pTVar1) {
      if (pTVar1->index == SPELLIND_stellarGravity) {
        bVar4 = this->moveRange - pTVar1->lv;
        if (pTVar1->lv < this->moveRange) {
LAB_80068514:
          this->moveRange = bVar4;
        }
        else this->moveRange = 1;
      }
      else {
        if (pTVar1->index == SPELLIND_haste) {
          bVar4 = this->moveRange + pTVar1->lv;
          goto LAB_80068514;
        }
      }
    }
  }
  UnsetFlag(COMBATENT_FLAG7);
  if (!m80068358()) {
    SetFlag(COMBATENT_FLAG7);
    FLOOR(this->moveRange,1);
    TroubadourStop;
  }
  else {
    if (!Flag2()) {
      if (IsNearShadow(this)) {
        if ((this == gCombatP->current_Ent) && (this->index != gGlobals.ShadowIndex)){
          CSprintf(XShadow,this->charSheetP->name);
          copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
          print_combat_textbox(gCombatP,gGlobals.text,0);
        }
        this->moveRange = 1;
       }
     }
   else FLOOR(this->moveRange,1);
   }
   CIEL(this->moveRange,13);
                /* pocho no move */
  if (this->charSheetP->ID == (ItemID)(entityList[171] + 0x200)) this->moveRange = 0;
}

u8 CombatEntity::DEXCheck(){
  s32 iVar1;
  s8 cVar3;
  u8 bVar4;
  
  iVar1 = gCombatP->turn.unk4;
  NOOP_80068350();
  cVar3 = CharStats::getBase(this->charSheetP->Stats,STAT_DEX);
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

u8 CombatEntity::GetProtection(){
  byte bVar5;
  uint uVar4;
  uint uVar6;
  
  u8 acid = 0;
  u8 def = 0;
  u8 uVar6 = 0;
  CharSheet *chara = this->charSheetP;
  for(u8 i=0;i<POTION_FXMAX;i++) {
    PotionEffect *pot = chara->potionEffects[i];
    if (pot) {
      if (pot->ID == POTION_ACID) acid += pot->power;
      if (pot->ID == POTION_DEFENCE) def = 15;
    }
  }
  uVar6 = 0;
  if (chara->armor[0]) uVar6 = chara->armor[0]->Protect;
  if ((((this->charSheetP->EXP->protection + uVar6) - acid) + warrior_dividing(pCVar1->Skills->getModdedSkill(SKILL_Warrior),5,false,0,0) + def) < 1)
  return 0;
  else 
    return (((this->charSheetP->EXP->protection + uVar6) - acid) + warrior_dividing(pCVar1->Skills->getModdedSkill(SKILL_Warrior),5,false,0,0) + def);
}

s8 CombatEntity::GetBlock(){
  ArmorInstance *sh = this->charSheetP->armor[1];
  u8 def = 0;
  if (sh) def = sh->DEF;
  return this->charSheetP->Skills->getModdedSkill(SKILL_Warrior) + def * this->charSheetP->Skills->getModdedSheild();
}

u32 CombatEntity::GetSheildProtection(u8 backStab){
  ArmorInstance *pcVar1 = this->charSheetP->armor[1];
  u32 uVar1 =GetProtection();
  if ((pcVar1) && (!backStab)) uVar1 += pcVar1->Protect;
  return uVar1;
}

void CombatEntity::Coord2IsCoord(){
  this->coord2.x = this->coord.x;
  this->coord2.y = this->coord.y;}

void CombatEntity::m80068924(){
  playerData *ppVar1;
  float fVar3;
  float fVar4;
  float fVar5;
  vec2f fStack144;
  vec2f fStack80;
  
  ppVar1 = gGlobals.playerDataArray[this->index];
  if (ppVar1) {
    setVec2(&fStack144,this->coord.x,this->coord.y);
    m80070234();
    gCombatP->SpellMarkerPos.x = this->coord.x;
    gCombatP->SpellMarkerPos.y = this->coord.y;
    copyVec2(&this->facing,&fStack80);
    fVar3 = ppVar1->facing.x;
    this->facing.x = -fVar3;
    fVar4 = this->coord.x;
    fVar5 = ppVar1->facing.y;
    this->facing.y = -fVar5;
    if ((((fStack144.x != fVar4) || (fStack144.y != this->coord.y)) || (fStack80.x != -fVar3)) || (fStack80.y != -fVar5)) {
      if (this->unk22 < 3) this->unk22++;
      else SetFlag(COMBATENT_FLAG3);
      FUN_80072454(gCombatP->substruct2,this);
      FUN_80072454(gCombatP->substruct2 + 1,this);
    }
  }
}

void CombatEntity::SetCardinalFacing(s8 param_2){
  s8 uStack72 [8][2]={
      {0,-1},{1,-1},{1,0},{1,1},
      {0,1},{-1,1},{-1,0},{-1,-1}};

  setVec2(&this->facing,(float)uStack72[param_2][0],(float)uStack72[param_2][1]);
  vec2_normalize(&this->facing);
}

u8 CombatEntity::m80068b0c(u8 X,u8 Y){
  float fVar1 = this->facing.x;
  float fVar2 = this->facing.y;
  this->facing.x = (float)X - this->coord.x;
  this->facing.y = (float)Y - this->coord.y;
  vec2_normalize(&this->facing);
  fVar1 = this->facing.x - fVar1;
  if (fVar1 <= 0.0) fVar1 = -fVar1;
  if ((double)fVar1 <= 1.0E-4) {
    fVar2 = this->facing.y - fVar2;
    if (fVar2 <= 0.0) fVar2 = -fVar2;
    if ((double)fVar2 <= 1.0E-4) {return false;}
  }
  return true;
}

u8 CombatEntity::CheckFacings(float x,float y){
  u8 bVar1;
  float fVar2;
  float fVar3;
  vec2f afStack160;
  vec2f afStack96;
  
  setVec2(&afStack160,this->coord.x,this->coord.y);
  setVec2(&afStack96,x,y);
  fVar2 = vec2_proximity(&afStack160,&afStack96);
  bVar1 = true;
  if (fVar2) {
    fVar3 = this->facing.x * fVar2 + this->coord.x;
    fVar2 = this->facing.y * fVar2 + this->coord.y;
    if (x - 0.5f <= fVar3) {
      if (x + 0.5f < fVar3) return false;
      if (fVar2 < y - 0.5f) return false;
      if (fVar2 <= y + 0.5f) return true;
    }
    bVar1 = false;
  }
  return bVar1;
}

u8 CombatEntity::CheckBackstab(CombatEntity *param_2){
  u8 bVar1;
  s32 iVar2;
  double dVar3;
  float fVar4;
  
  
  if (!CheckFacings(param_2->coord.x,param_2->coord.y)) return false;
  fVar4 = (this->facing.x * param_2->facing.x +
            this->facing.y * param_2->facing.y) * 1000000.0f;
  dVar3 = (double)fVar4;
  if (0.0 < fVar4) {iVar2 = (s32)(dVar3 + 0.5);}
  else {iVar2 = -(s32)(0.5 - dVar3);}
  bVar1 = true;
  if ((float)iVar2 / 1000000.0f < 0.707107/*Cos(PI/4)*/) {bVar1 = false;}
  return bVar1;
}


void CombatEntity::m80068dd8(){
  playerData *ppVar1 = gGlobals.playerDataArray[this->index];
  if (ppVar1) {
    Actor::SetAiDest(ppVar1,this->coord.x + ppVar1->interactRadiusB,
      this->coord.y + ppVar1->interactRadiusB,ppVar1->interactRadiusB,0);
  }
}

void CombatEntity::m80068e38(){
  if (gGlobals.playerDataArray[this->index]) {
    if ((this->facing.x != 0.0) || (this->facing.y != 0.0)) {
      Actor::SetFacing(gGlobals.playerDataArray[this->index],-this->facing.x,-this->facing.y);
    }
    gGlobals.combatBytes[1] = gGlobals.combatBytes[0];
    gGlobals.combatBytes[0] = 6;
  }
  return;
}

void CombatEntity::FaceTarget(CombatEntity *param_2){
  playerData *ppVar1;
  playerData *ppVar2;
  float fVar3;
  
  gGlobals.combatBytes[0] = 6;
  gGlobals.combatBytes[1] = 6;
  if (param_2 != this) {
    ppVar1 = gGlobals.playerDataArray[this->index];
    ppVar2 = gGlobals.playerDataArray[param_2->index];
    if ((ppVar1) && (ppVar2)) {
      this->facing.x = (ppVar2->collision).pos.x- (ppVar1->collision).pos.x;
      this->facing.y = (ppVar2->collision).pos.z - (ppVar1->collision).pos.z;
      vec2_normalize(&this->facing);
      fVar3 = this->facing.y;
      if ((!this->facing.x)&&(!this->facing.y)) return;
      Actor::SetFacing(ppVar1,-this->facing.x,-this->facing.y);
    }
  }
}

void CombatEntity::TeleportMovePlayer(){
  playerData *ppVar1;
  
  ppVar1 = gGlobals.playerDataArray[this->index];
  if (ppVar1) {
    (ppVar1->collision).pos.x = this->coord.x + ppVar1->interactRadiusB;
    (ppVar1->collision).pos.z = this->coord.y + ppVar1->interactRadiusB;
    Actor::CheckCollision(ppVar1,0,0,0);
  }
}

void CombatEntity::SetPlayerRotate(){
  playerData *ppVar1;
  
  if (((this->facing.x != 0.0) || (this->facing.y != 0.0)) &&
     (ppVar1 = gGlobals.playerDataArray[this->index], ppVar1)) {
    ppVar1->facing.x = -this->facing.x;
    ppVar1->facing.y = -this->facing.y;
    vec2_normalize(&ppVar1->facing);
  }
}

u8 CombatEntity::GetWeaponAnimation(u8 param_2){
  u8 (*pabVar1) [2];
  u8 uStack64 [7] [2]={{0,16},{1,17},{2,13},{3,12},{4,15},{5,14},{0xff,0xff}};
  
  pabVar1 = uStack64;

  while( true ) {
    if (uStack64[0][0] == 0xff) {return 18;}
    if (*pabVar1[0] == param_2) break;
    pabVar1 = (u8 (*) [2])((s32)pabVar1 + 2);
    uStack64[0][0] = *(u8 *)pabVar1;
  }
  return *pabVar1[1];
}


u32 CombatEntity::m80069114(){
  WeaponInstance *pTVar1;
  u32 uVar2;
  
  if (this->AtkType == 3) return 400;
  else {
    uVar2 = 0;
    if (this->AtkType != 1) {
      if (this->charSheetP == NULL) return 0;
      else {
        pTVar1 = this->charSheetP->weapons;
        if (pTVar1 == NULL) {
          ShowWeaponSheild();
          return 0;
        }
        else {uVar2 = (u32)pTVar1->range;}
      }
    }
  }
  return uVar2;
}


u32 Ofunc_8006916c(CombatEntity* cEnt,u8 param_2,u8 param_3){
  s8 sVar1;
  char cVar4;
  s32 iVar2;
  u32 uVar3;
  
  s32 uVar6 = cEnt->GetCoordXU8() - (param_2);
  s32 uVar5 = cEnt->GetCoordYU8() - (param_3);
  if ((!uVar6)&&(!uVar5)) return 1;
  switch(cEnt->unk14) {
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
    if (uVar6 < 1) {return 0;}
joined_r0x8006924c:
    if (-1 < uVar5) {return 0;}
    goto LAB_8006927c;
  case 6:
    uVar3 = 0;
    if (uVar5 == 0) {uVar3 = (0 < uVar6);}
    break;
  case 7:
    if (uVar6 < 1) {return 0;}
LAB_80069274:
    uVar3 = 0;
    if (0 < uVar5) {
LAB_8006927c:
      IABS(uVar6);
      IABS(uVar5);
      uVar3 = (uVar6 == uVar5);
    }
    break;
  default:
    uVar3 = 0;
  }
  return uVar3;
}

u8 CombatEntity::m800692bc(CombatEntity *param_2){
  playerData *ppVar1;
  playerData *ppVar2;
  u8 bVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  
  ppVar1 = gGlobals.playerDataArray[this->index];
  bVar3 = false;
  if (ppVar1) {
    ppVar2 = gGlobals.playerDataArray[param_2->index];
    bVar3 = false;
    if (ppVar2) {
      fVar4 = m80069554(param_2);
      fVar5 = ppVar1->interactRadiusB;
      if (fVar5 <= ppVar1->combatRadius) fVar5 = ppVar1->combatRadius;
      fVar6 = ppVar2->interactRadiusB;
      if (fVar6 <= ppVar2->combatRadius) fVar6 = ppVar2->combatRadius;
      bVar3 = true;
      if (fVar5 + fVar6 + 0.75f < fVar4) {bVar3 = false;}
    }
  }
  return bVar3;
}

u8 CombatEntity::m80069384(CombatEntity *param_2,s8 param_3,s8 param_4,s32 param_5){
  if ((param_5 != 0) &&
     (!CheckFacings((float)param_3,(float)param_4))) return false;
  if (this->AtkType == 3) return true;
  if (!Flag89()) {
    if (this->AtkType == 1) {if (this->charSheetP->weapons) goto LAB_80069414;}
    else {
      if (this->AtkType == 2) ;
      else {
        if (this->AtkType != 4) {return false;}
      }
      if (this->charSheetP->weapons) {
        u32 uVar6 = Get2DProximity(param_2);
        if (this->AtkType != 2) return uVar6 <= this->charSheetP->weapons->range;
        if (!m80068358()) return false;
        if (2 < uVar6) return uVar6 <= this->charSheetP->weapons->range;
        return false;
      }
    }
    this->AtkType = 0;
    return false;
  }
LAB_80069414:
  return param_2->m800692bc();
}

float CombatEntity::Get2DProximity(CombatEntity *other){
  vec2f tempA,tempB;
  setVec2(&tempA,coord.x,coord.y);
  setVec2(&tempB,(other->coord).x,(other->coord).y);
  return vec2_proximity(&tempA,&tempB);
}

float CombatEntity::m80069554(CombatEntity *param_2){
  param_2->m80070234();
  this->m80070234();
  return this->Get2DProximity(param_2);}


u8 CombatEntity::CanUsePotion(u8 param_2){return Entity::CanUsePotion(this->charSheetP,param_2,NULL);}

u8 CombatEntity::CanUseFlask(CombatEntity *param_2){
  u8 ret;

  if (this->AtkType == 3) {
    if (this->item < POTION_HEALING) {ret = Flag4() != param_2->Flag4();}
    else {
      ret = false;
      if (param_2 == this) ret = CanUsePotion(this->item);
    }
  }
  else {ret = true;}
  return ret;
}

u8 CombatEntity::m8006963c(CombatEntity *param_2){
  u8 bVar1;
  u8 bVar2;

  if (param_2->Flag6()) return false;
  if (!Entity::isDead(param_2->charSheetP)) return false;
  if ((this->AtkType == 3) || (Flag89())) {
LAB_800696b4:
    if (CombatEntity::CanUseFlask(param_2)) {return false;}
    if (Flag89()) {
      if (Flag4() != param_2->Flag4()) goto LAB_800696f0;
    }
    bVar2 = true;
    if ((!Flag89()) && (bVar2 = false, this->AtkType != 0)) {bVar2 = true;}
  }
  else {
    if (Flag4() != param_2->Flag4()) goto LAB_800696b4;
LAB_800696f0:
    bVar2 = false;
  }
  return bVar2;
}

u8 CombatEntity::CanBeTargeted(CombatEntity *param_2,s32 param_3){
  u32 uVar4;
  u32 uVar5;
  float fVar8;
  u8 bStack176 [2];
  vec3f fStack168;
  vec3f afStack104;
  
  if (param_2->charSheetP->ID != (ItemID)(entityList[172] + 0x200)) { //not shadow
    if (!Flag89()) {
      if (gGlobals.combatBytes[0] == 0x19) {return param_2 == this;}
      if (!m8006963c(param_2)) {return false;}
    }
    else {
      if (Entity::isDead(param_2->charSheetP)) return false;
      if (param_2->Flag6()) return false;
      if (param_2->Flag4() != this->Flag4()) return false;
      if (Entity::getHPCurrent(param_2->charSheetP) == Entity::getHPMax(param_2->charSheetP)) return false;
      if (!(this->flags & COMBATENT_MEDIC)) {if (param_2 == this) {return true;}}
      else {if (param_2 == this) return false;}
    }
    bStack176[0] = 0;
    bStack176[1] = 0;
    param_2->GetCoordU8(bStack176,bStack176 + 1);
    if (!m80069384(param_2,(u32)bStack176[0],(u32)bStack176[1],param_3)) {return false;}
    if (FUN_8007105c(&gCombatP->substruct,GetCoordXU8(),GetCoordYU8(),(u32)bStack176[0],bStack176[1])) {return true;}
    playerData *p1 = gGlobals.playerDataArray[this->index];
    playerData *p2 = gGlobals.playerDataArray[param_2->index];
    if ((p1) && (p2)) {
      copyVec3(&(p1->collision).pos,&fStack168);
      copyVec3(&(p2->collision).pos,&afStack104);
      fStack168.y += -p1->interactRadiusB + gEntityDB->GetHeight(this->charSheetP->ID);
      fStack168.y += -p2->interactRadiusB + gEntityDB->GetHeight(param_2->charSheetP->ID);
      return FUN_800716b4(&gCombatP->substruct,&fStack168,&afStack104,(u32)this->index,param_2->index);
      
    }
  }
  return false;
}



u32 CombatEntity::GetSpellTargetCount(){
  SpellInstance *pSVar1;
  uint ret;
  int iVar3;
  
  pSVar1 = Entity::getSpell(this->charSheetP);
  if (!pSVar1) ret = 0;
  else if (pSVar1->cast == MCAST_ALL) ret = (uint)gCombatP->EntCount;
  else {
    ret = 1;
    if (pSVar1->cast == MCAST_RANK) {
      ret = (u8)Entity::CheckSpellWizard(this->charSheetP,pSVar1) + 1 >> 1;
    }
  }
  return ret;
}

u8 CombatEntity::canControl(SpellInstance *param_2){
  ItemID x;
  u8 bVar3;
  bool bVar1;
  byte bVar2;
  
  bVar3 = GetIDIndex((param_2->base).id);
  x = this->charSheetP->ID;
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

u8 CombatEntity::SpellEffectsTarget(CombatEntity *param_2,SpellInstance *param_3){
  u8 bVar1;

  u8 bVar3;
  u8 MVar4;
  
  if (param_3 == NULL) {
RetFalse:
    bVar1 = false;
  }
  else {
    if (param_2->Flag6()) return false;
    if (Entity::isDead(param_2->charSheetP)) return false;
    if (param_3->target == MTarget_Party) {
      if (param_2->Flag4() != Flag4()) return false;
    }
    if (param_3->target == MTarget_Enemy) {
      if (param_2->Flag4() == Flag4()) goto RetFalse;
    }
    bVar1 = false;
    if (!Entity::HasSpellEffect(param_2->charSheetP,GetIDIndex(param_3->id))) {
      if (Entity::CheckSpellSpecial(param_2->charSheetP,param_3) == 0) {bVar1 = canControl(param_2,param_3) != false;}
      else bVar1 = false;
    }
  }
  return bVar1;
}

u8 CombatEntity::AIShouldNotCastSpell(CombatEntity *param_2,SpellInstance *param_3){
  s32 iVar1;
  u8 bVar3;
  u32 uVar2;
  u8 bVar4;
  
  if ((this->aiP == NULL) || (!(this->aiP->flags & 8))) bVar4 = true;
  else {
    bVar4 = false;
    if (Entity::SpellStaminaSubtract(this->charSheetP,param_3,Entity::CheckSpellWizard(this->charSheetP,param_3)) <= CharStats::getModded(this->charSheetP->Stats,STAT_STAM)) {
      bVar4 = false;
      if (Entity::GetSpellCharges(this->charSheetP) != 0) {
        if (Entity::CheckSpellSpecial(param_2->charSheetP,param_3) == 0) {bVar4 = Entity::CheckSpellTimeOfDay(this->charSheetP,param_3) == 0;}
        else {bVar4 = false;}
      }
    }
  }
  return bVar4;
}

u8 CombatEntity::m80069d00(CombatEntity *param_2,float param_3,float param_4){
  playerData *ppVar1;
  u8 bVar2;
  vec2f afStack224;
  vec2f fStack160;
  vec2f fStack96;
  
  ppVar1 = gGlobals.playerDataArray[param_2->index];
  if (!ppVar1) bVar2 = false;
  else {
    CLEAR(&afStack224);
    afStack224.x = param_4;
    CLEAR(&fStack96);
    fStack160.x = (ppVar1->collision).pos.x;
    fStack160.y = (ppVar1->collision).pos.z;
    fStack96.x = fStack160.x;
    fStack96.y = fStack160.y;
    bVar2 = true;
    if (param_3 + ppVar1->interactRadiusB < vec2_proximity(&afStack224,&fStack160)) bVar2 = false;
  }
  return bVar2;
}


u8 CombatEntity::AIShouldCastMagic(CombatEntity *param_2){
  byte bVar1;
  playerData *ppVar2;
  SpellInstance *spell;
  bool bVar7;
  byte bVar8;
  longlong lVar3;
  int iVar6;
  u8 uVar9;
  u8 uVar10;
  ulonglong uVar4;
  ulonglong uVar5;
  Borg9data *borgDat;
  float fVar11;
  int iVar12;
  double dVar13;
  float fVar14;
  u8 uStack_100[8];
  vec3f fStack248;
  vec3f afStack184;
  vec3f fStack120;
  
  if (param_2->index == gGlobals.ShadowIndex) return false;
  if (this->index == gGlobals.ShadowIndex) return false;
  spell = Entity::getSpell(this->charSheetP);
  if (SpellEffectsTarget(param_2,spell)) {
    bVar8 = GetIDIndex((spell->base).id);
    AIShouldNotCastSpell(param_2,spell);
    if (AIShouldNotCastSpell(param_2,spell)) {
      if ((bVar8 == 0xc) || (spell->cast == MCAST_ALL)) return param_2 == this;
      iVar6 = Entity::CheckSpellWizard(this->charSheetP,spell);
      bVar1 = spell->range;
      fVar11 = this->GetCoordX();
      this->GetCoordY(); //doesn't use return?
      uVar4 = this->GetCoordXU8();
      uVar5 = this->GetCoordYU8();
      uStack_100[0] = 0;
      uStack_100[1] = 0;
      param_2->GetCoordU8(uStack_100,uStack_100+1);
      iVar12 = iVar6 * (uint)bVar1;
      if ((spell->aspect_flag & 0x10)) {
        fVar11 = (gCombatP->SpellMarkerPos).x;
        fVar14 = (gCombatP->SpellMarkerPos).y;
        if (0.0 < fVar11) {
          iVar12 = (int)((double)fVar11 + 0.5);
        }
        else {
          iVar12 = -(int)(0.5 - (double)fVar11);
        }
        uVar4 = iVar12 & 0xff;
        if (0.0 < fVar14) {
          iVar12 = (int)((double)fVar14 + 0.5);
        }
        else {
          iVar12 = -(int)(0.5 - (double)fVar14);
        }
        uVar5 = iVar12 & 0xff;
        iVar12 = iVar6;
      }
      if (bVar8 != SPELLIND_senseAura) {
        if (!m80069d00(param_2,(float)iVar12,fVar11)) return false;
      }
      if (FUN_8007105c(&gCombatP->substruct,(byte)uVar4,(byte)uVar5,uStack_100[0],uStack_100[1])) return true;
      if ((uVar4 == uStack_100[0]) && (uVar5 == uStack_100[1])) return true;
      ppVar2 = gGlobals.playerDataArray[param_2->index];
      if (ppVar2) {
        fVar14 = (float)(int)uVar4;
        fVar11 = (float)(int)uVar5;
        borgDat = &(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat;
        setVec3(&fStack248,fVar14,50.0,fVar11);
        setVec3(&afStack184,fVar14,-10.0,fVar11);
        if (CheckCollision(borgDat,&fStack248,&afStack184,0.5,&fStack120,NULL,0)) {
          fStack120.y+=2;
        }
        else setVec3(&fStack120,fVar14,10.0,fVar11);
        copyVec3(&(ppVar2->collision).pos,&fStack248);
        fStack248.y = fStack248.y + -ppVar2->interactRadiusB + gEntityDB->GetHeight(gEntityDB,param_2->charSheetP->ID);
        return FUN_800716b4(&gCombatP->substruct,&fStack120,&fStack248,param_2->index,
          param_2->index);
      }
    }
  }
  return false;
}

u8 CombatEntity::SpellEffectsPartyInArea(){
  SpellInstance *pSVar1 = Entity::getSpell(this->charSheetP);
  u8 bVar2 = false;
  if (pSVar1) bVar2 = pSVar1->target == MTarget_Party;
  return bVar2;
}


uint CombatEntity::m8006a1dc(){
  WeaponInstance *pWVar1;
  uint uVar2;
  uint auStack72 [5];
  
  if (this->AtkType < 5) {
    auStack72[1] = 0;
    pWVar1 = this->charSheetP->weapons;
    auStack72[2] = 0;
    if (pWVar1) {
      auStack72[1] = (uint)isBreathSpitOrSpikes(pWVar1);
      auStack72[2] = (uint)(this->charSheetP->weapons->range != 0);
    }
    auStack72[4] = 0;
    auStack72[0] = 0;
    auStack72[3] = 1;
    if (auStack72[1]) {
      auStack72[4] = (uint)(auStack72[2] != 0);
    }
    uVar2 = auStack72[this->AtkType];
  }
  else return 0;
  return uVar2;
}

void CombatEntity::m8006a274(){
  TroubadourStop;
  UnsetFlag(COMBATENT_MEDIC);
  UnsetFlag(COMBATENT_HERBS);
  SetAktRangeMulti(true);
  this->unk22 = 1;
  if (gGlobals.SomeCase == 3) gGlobals.combatBytes[1] = 0x13;
}


void CombatEntity::Ofunc_8006a2f0(u8 param_2){
  u8 bVar1;
  
  bVar1 = this->AtkType;
  if (bVar1 != param_2) {
    this->AtkType = param_2;
    if (!m8006a1dc()) this->AtkType = bVar1;
    else {
      TroubadourStop;
      UnsetFlag(COMBATENT_MEDIC);
      UnsetFlag(COMBATENT_HERBS);
      FUN_80072454(gCombatP->substruct2,this);
      ShowWeaponSheild();
      EndTurn();
    }
  }
}

void CombatEntity::m8006a394(u8 x,u8 y){
  char cVar2;
  s32 iVar1;
  s8 sVar3;
  s32 iVar4;
  
  iVar4 = ((x) - GetCoordXU8());
  iVar1 = ((y) - GetCoordYU8());
  if ((iVar4 != 0) || (iVar1 != 0)) {
    if (iVar4 < 0) {
      sVar3 = 7;
      if ((-1 < iVar1) && (sVar3 = 5, iVar1 < 1)) {sVar3 = 6;}
    }
    else {
      if (iVar4 < 1) {
        sVar3 = 4;
        if (iVar1 < 0) {
          this->unk14 = 0;
          return;
        }
      }
      else {
        sVar3 = 1;
        if ((-1 < iVar1) && (sVar3 = 3, iVar1 < 1)) {sVar3 = 2;}
      }
    }
    this->unk14 = sVar3;
  }
}


void CombatEntity::Ofunc_8006a450(s8 param_2){
  this->unk14 = param_2;
  SetCardinalFacing(param_2);
  FUN_80072454(gCombatP->substruct2,this);
  FUN_80072454(gCombatP->substruct2 + 1,this);
  m80068e38();
}

void CombatEntity::EndTurn(){
  CharSheet *pCVar1;
  u16 uVar2;
  u8 bVar3;
  GearInstance *puVar2;
  CombatAI_s* pTVar1;
  
  clear_camera_playerdata_focus();
  pTVar1 = this->aiP;
  if ((pTVar1) && ((pTVar1->flags & 8))) CombatAIInfo::ClearEntIndex(pTVar1);
  this->charSheetP->spellVal = 0xff;
  UnsetFlag(COMBATENT_CASTING);
  pCVar1 = this->charSheetP;
  if (pCVar1->spellSwitch == 5) {
    puVar2 = pCVar1->pItemList->pItem[pCVar1->currSpell];
    if ((puVar2->base.spellCharge->Charges == 0) &&
       ((uVar2 = (u16)puVar2->id >> 8, uVar2 == 0x11 || (uVar2 == 0xd)))) { //scroll or wand
      //dispose of drained acc.
      Entity::UnequipGear(pCVar1,(u32)pCVar1->currSpell);
      this->charSheetP->spellSwitch = 0;
    }
  }
  gGlobals.combatBytes[0] = 1;
  Combat_SetHideMarkers(0);
  if ((!Entity::isDead(this->charSheetP)) && (!Flag6())) {gGlobals.playerDataArray[this->index]->ani_type = 0;}
  ShowWeaponFlask();
  if (((this->AtkType == 3) && (this->item < POTION_HEALING)) &&
     (this->charSheetP->weapons)) PARTY->RemoveWeaponsFrom(this->index);
     CheckTargetIndex();
  FUN_80073e3c(&gCombatP->turn);
}


void CombatEntity::Escaped(){
  if (!Flag6()) {
    unk800714d0(this);
    SetFlag(COMBATENT_FLED);
    gCombatP->EntsAlive--;
    if (Flag4()) gCombatP->EnemiesAlive--;
    else gCombatP->playersAlive--;
    ClearSpellEffects();
    Entity::ClearAllPotionEffects(this->charSheetP);
    FUN_80096048(gGlobals.playerDataArray[this->index]);
    FUN_80094228(gGlobals.playerDataArray[this->index]);
    Actor::DeathFlag(gGlobals.playerDataArray[this->index]);
    gGlobals.playerDataArray[this->index] = NULL;
    flee_draw_crossbones(this->charSheetP->ID,this->index);
  }
}

u8 NotAspectBonus(u8 x){
  if (x == ASPECT_LUNAR) return TerrainPointer->partOfDay != TIME_NIGHT;
  if (x == ASPECT_SOLAR) return TerrainPointer->partOfDay == TIME_NIGHT;
  return false;
}


u8 CombatEntity::getNotAspectBonus(){return NotAspectBonus(this->charSheetP->EXP->GetAspect());}



u8 CombatEntity::IsAspectBonus(){
  
  u8 aspect = this->charSheetP->EXP->GetAspect();
  u8 ret = false;
  if (aspect != ASPECT_NONE) {
    if (aspect == ASPECT_LUNAR) {
      ret = TerrainPointer->partOfDay == TIME_NIGHT;
    }
    else {
      ret = false;
      if (aspect == ASPECT_SOLAR) {
        ret = TerrainPointer->partOfDay != TIME_NIGHT;
      }
    }
  }
  return ret;
}


u8 CombatEntity::m8006a830(CombatEntity *param_2,u8 param_3,u8 param_4){
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
  uVar1 = GetCoordXU8();
  uVar2 = GetCoordYU8();
  switch(param_2->unk14) {
  case 0:
    if (((uVar1 < uVar8) && (uVar7 < uVar2)) && (this->unk14 == 1)) {return 1;}
    if (((uVar1 != uVar8) || (uVar2 <= uVar7)) || (this->unk14 != 0)) {
      if (uVar1 <= uVar8) {return 0;}
      sVar4 = 7;
      if (uVar2 <= uVar7) {return 0;}
      sVar6 = this->unk14;
      goto LAB_8006ab00;
    }
    goto LAB_8006ab08;
  case 1:
    if (uVar1 < uVar8) {
      if ((uVar2 == uVar7) && (this->unk14 == 2)) goto LAB_8006ab08;
      if ((uVar7 < uVar2) && (this->unk14 == 1)) {return 1;}
    }
    uVar5 = 0;
    if (((uVar1 == uVar8) && (uVar5 = 0, uVar7 < uVar2)) && (uVar5 = 0, this->unk14 == 0)) {uVar5 = 1;}
    break;
  case 2:
    uVar5 = 0;
    if (uVar1 < uVar8) {
      if ((uVar2 < uVar7) && (this->unk14 == 3)) {uVar5 = 1;}
      else {
        if ((uVar2 == uVar7) && (this->unk14 == 2)) {uVar5 = 1;}
        else {
          uVar5 = 0;
          if ((uVar7 < uVar2) && (uVar5 = 0, this->unk14 == 1)) {uVar5 = 1;}
        }
      }
    }
    break;
  case 3:
    if (((uVar1 < uVar8) && (uVar2 < uVar7)) && (this->unk14 == 3)) {return 1;}
    if (((uVar1 == uVar8) && (uVar2 < uVar7)) && (this->unk14 == 4)) {return 1;}
    if (uVar1 >= uVar8) {return 0;}
    if (uVar2 != uVar7) {return 0;}
    sVar4 = this->unk14;
    sVar6 = 2;
    goto LAB_8006ab6c;
  case 4:
    if (((uVar1 < uVar8) && (uVar2 < uVar7)) && (this->unk14 == 3)) {return 1;}
    if (((uVar1 == uVar8) && (uVar2 < uVar7)) && (this->unk14 == 4)) {return 1;}
    if (uVar1 <= uVar8) {return 0;}
    goto LAB_8006aaf4;
  case 5:
    if (uVar8 < uVar1) {
      if ((uVar2 == uVar7) && (this->unk14 == 6)) goto LAB_8006ab08;
      if ((uVar2 < uVar7) && (this->unk14 == 5)) {
        return 1;
      }
    }
    if (uVar1 != uVar8) {return 0;}
    sVar4 = 4;
    if (uVar7 <= uVar2) {return 0;}
    sVar6 = this->unk14;
    goto LAB_8006ab00;
  case 6:
    if (uVar1 <= uVar8) {return 0;}
    if ((uVar7 < uVar2) && (this->unk14 == 7)) {return 1;}
    if ((uVar2 == uVar7) && (this->unk14 == 6)) goto LAB_8006ab08;
LAB_8006aaf4:
    uVar5 = 0;
    sVar4 = 5;
    if (uVar2 < uVar7) {
      sVar6 = this->unk14;
LAB_8006ab00:
      uVar5 = 0;
      if (sVar6 == sVar4) {
LAB_8006ab08:
        uVar5 = 1;
      }
    }
    break;
  case 7:
    if (((uVar8 < uVar1) && (uVar7 < uVar2)) && (this->unk14 == 7)) {return 1;}
    if (((uVar1 == uVar8) && (uVar7 < uVar2)) && (this->unk14 == 0)) {return 1;}
    if (uVar8 >= uVar1) {return 0;}
    if (uVar2 != uVar7) {return 0;}
    sVar4 = this->unk14;
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

u8 CombatEntity::isMagicElement(u8 x){
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

u8 CombatEntity::DoesElementResist(u8 e1,u8 e2){
  u8 ret;
  
  if (e2 == ELEMENT_NONE) return false;
  else {
    ret = true;
    if (e1 != e2) {
      if (e2 == ELEMENT_PHYSICAL) {
        if ((e1 == ELEMENT_CUTTING) || (ret = false, e1 == ELEMENT_SMASHING)) {ret = true;}
      }
      else {
        ret = false;
        if (e2 == ELEMENT_MAGIC) ret = isMagicElement(e1);
      }
    }
  }
  return ret;
}

u8 CombatEntity::CalcGearResist(u8 param_2,float *param_3){
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
    if (DoesElementResist(param_2,this->resists[uVar7].element)) {
      bVar8 = true;
      uVar9*= this->resists[uVar7].percent);
    }
    ptVar1 = this->charSheetP->armor[uVar7];
    if (((ptVar1) && (ptVar1->resist)) &&
       (DoesElementResist(param_2,ptVar1->resist->element))) {
      bVar8 = true;
      uVar9*= ptVar1->resist->percent;
    }
  }
  pTVar2 = this->charSheetP->weapons;
  if (pTVar2){
    if (pTVar2->resist){
      if (DoesElementResist(param_2,pTVar2->resist->element)){
        bVar8 = true;
        uVar9*= pTVar2->resist->percent;
      }
    }
  }
  fVar10 = (float)uVar9;
  uVar7 = 0;
  if (this->charSheetP->pItemList->usedItems != 0) {
    ptVar6 = (GearInstance *)this->charSheetP->pItemList->pItem;
    while( true ) {
      ptVar6 = *(GearInstance **)((s32)ptVar6 + uVar7 * 4);
      if (((ptVar6) && (ptVar6->resist)) &&
         (DoesElementResist(param_2,ptVar6->resist->element)))
      {
        bVar8 = true;
        uVar9*= ptVar6->resist->percent);
      }
      fVar10 = uVar9;
      uVar7++;
      if ((u8)pCVar3->usedItems <= uVar7) break;
      ptVar6 = (GearInstance *)pCVar3->pItem;
    }
  }
  *param_3 = fVar10;
  return bVar8;
}

u8 CombatEntity::CanResistSpell(SpellInstance *spel_,u8 Elem){
  u8 spellID;
  u8 bVar1;
  u8 SVar2;
  
  spellID = GetIDIndex(spel_->base.id);
  switch(Elem) {
  default:
    bVar1 = false;
    break;
  case ELEMENT_EARTH:
    bVar1 = spellID == SPELLIND_EarthSmite;
    break;
  case ELEMENT_SOLAR:
    bVar1 = (bool)(spel_->aspect_flag >> 1 & 1);
    break;
  case ELEMENT_NECROMANCY:
    bVar1 = spel_->school == SCHOOL_Necromancy;
    break;
  case ELEMENT_FIRE:
    if (spellID != SPELLIND_DragonFlames) {
      SVar2 = SPELLIND_fireball;
CheckOtherSpell:
      if (spellID != SVar2) return false;
    }
    goto ReturnTrue;
  case ELEMENT_LUNAR:
    bVar1 = (bool)(spel_->aspect_flag & 1);
    break;
  case ELEMENT_NAMING:
    bVar1 = spel_->school == SCHOOL_Naming;
    break;
  case ELEMENT_WATER:
    if (spellID != SPELLIND_lightning) {
      SVar2 = SPELLIND_frozenDoom;
      goto CheckOtherSpell;
    }
ReturnTrue:
    bVar1 = true;
    break;
  case ELEMENT_MAGIC:
    bVar1 = true;
    break;
  case ELEMENT_AIR:
    bVar1 = spellID == SPELLIND_wind;
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


u8 CombatEntity::MagicResistChecks(SpellInstance *spell,float *resistMulti){
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
    if (CanResistSpell(spell,resists[i].element)) {
      ret = true;
      multi *= resists[i].percent;
    }
    ptVar1 = charSheetP->armor[i];
    if (((ptVar1) && (ptVar1->resist)) &&
       (CanResistSpell(spell,ptVar1->resist->element))) {
      ret = true;
      multi *= ptVar1->resist->percent;
    }
  }
  pTVar2 = charSheetP->weapons;
  if ((pTVar2)&&(pTVar2->resist)&&
    (CanResistSpell(spell,pTVar2->resist->element))) {
        ret = true;
        multi = multi * pTVar2->resist->percent;
        pCVar5 = charSheetP;
    }
  pCVar3 = charSheetP->pItemList;
  if (pCVar3->usedItems != 0) {
    pptVar7 = pCVar3->pItem;
    for(i=0;pCVar3->usedItems <= i;i++){
      ptVar4 = pptVar7[i];
      if (((ptVar4) && (ptVar4->resist)) &&
         (CanResistSpell(spell,ptVar4->resist->element))) {
        ret = true;
        multi *= ptVar4->resist->percent;
      }
    }
  }
  *resistMulti = multi;
  return ret;
}

u16 CombatEntity::CheckVSMagic(SpellInstance *param_2){
  byte (*pabVar2) [2];
  
  u8 uStack64 [5] [2]={
    {SPELLIND_vsElemental,SCHOOL_Elemental},{SPELLIND_vsNaming,SCHOOL_Naming},
    {SPELLIND_vsNecromancy,SCHOOL_Necromancy},{SPELLIND_vsStar,SCHOOL_Star},
    {0xff,0xff}};
  for(u32 i=0;i<MAGIC_FXMAX;i++) {
    Temp_enchant *pTVar1 = charSheetP->effects[i];
    if ((pTVar1) && (uStack64[0][0] != 0xff)) {
      pabVar2 = uStack64;
      do {
        if (((*pabVar2)[0] == pTVar1->index) &&
           ((*pabVar2)[1] == param_2->school)) {
          return pTVar1->lv * 6 & 0xfe;
        }
        pabVar2++;
      } while ((*pabVar2)[0] != SPELLIND_NONE);
    }
  }
  return 0;
}

u8 STR_Steps[8]={4,9,17,24,28,32,36,39};
u32 CombatEntity::GetSTRSteps(){
  u32 ret=0;

  while( true ) {
    if (7 < ret) return ret;
    if (CharStats::getModded(this->charSheetP->Stats,STAT_STR) <= STR_Steps[ret]) break;
    ret++;
  }
  return ret;
}


void CombatEntity::Death(){
  byte *pbVar1;
  CharSheet *pCVar2;
  CombatEntity *pCVar3;
  bool bVar7;
  uint uVar8;
  u32 i;
  
  pCVar2 = this->charSheetP;
  for(i=0;i<MAGIC_FXMAX;i++) {
    if (pCVar2->effects[i]) {
      if (isPetrify(pCVar2->effects[i]->index))
        Entity::ClearSpellEffect(this->charSheetP,(u8)i,this);
    }
  }
  unk800714d0(this);
  gCombatP->EntsAlive--;
                    // Sholeh
  if ((ItemID)(entityList[0xa4] + 0x200) == this->charSheetP->ID) setEventFlag(0x26e,true);
  if (Flag5()) {
    gCombatP->EnemiesAlive--;
    if (gCombatP->firstKill == 0) {
      gCombatP->firstKill = 1;
      if (gCombatP->EntCount) {
        for(i=0;i < gCombatP->EntCount;i++) {
          pCVar3 = (&gCombatP->combatEnts)[i];
            if ((pCVar3) && (pCVar3 == this)) {
              if (pCVar3->Flag4()&&(pCVar3->aiP)) pCVar3->aiP->flags|= 2;
            }
        }
      }
    }
  }
  else {
    gCombatP->playersAlive--;
    PARTY->CheckDeaths();
    TroubadourStop;
  }
}

u8 CombatEntity::HasPetrifyEffect(){  
  for(u8 i=0;i<MAGIC_FXMAX;i++){
    if((this->charSheetP->effects[i])&&isPetrify(this->charSheetP->effects[i]->index))
      return true;
  }
  return false;
}

s16 CombatEntity::AttackCalc1(CombatEntity *param_2,s8 x,s8 y,u8 backstab){
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
  
  pCVar2 = this->charSheetP;
  stats = pCVar2->Stats;
  pCVar3 = pCVar2->Skills;
  pTVar4 = pCVar2->weapons;
  DefStats = param_2->charSheetP->Stats;
  iVar6 = CharStats::getModded(stats,STAT_STR);
  iVar7 = CharStats::getModded(stats,STAT_END);
  iVar8 = CharStats::getBase(stats,STAT_LV);
  cVar11 = pCVar3->getModdedWeapon(pTVar4->weaponType);
  cVar12 = pCVar3->getModdedSkill(SKILL_Warrior);
  petrified = param_2->HasPetrifyEffect();
  DefDex = 0;
  if (!petrified) DefDex = CharStats::getModded(DefStats,STAT_DEX);
  sVar10 = 0;
  if (!petrified) sVar10 = param_2->GetBlock();
  iVar9 = CharStats::getBase(DefStats,STAT_LV);
  //(STR,STAT_END,LV)+(WHit+WSkill*6+Warrior*2)-(DefDex*2+DefLV+(Warrior+SheildDef*Sheildskill))
  iVar6 = TheifBackstabMod(
    (s16)((((iVar6 + iVar7 + iVar8)) +(u32)pTVar4->hit + cVar11 * 6 + cVar12 * 2)) - (DefDex * 2 + (s16)iVar9 + sVar10),
    backstab,1,0x14);
  if (CharStats::getModded(DefStats,STAT_STAM) == 0) {iVar6 *= 1.15f;} //increase if target tired
  iVar7 = FUN_80070cc4(&gCombatP->substruct,x,y,GetCoordXU8(),GetCoordYU8(););
  iVar7 *= 0.05f * (float)iVar6 + (float)iVar6);
  if (CharStats::getModded(stats,STAT_STAM) == 0) iVar7 *= 0.8f; //decrease if user tired
  if (TerrainPointer->partOfDay == TIME_NIGHT) iVar7 *= 0.9f; //decrease if night
  sVar10 = TroubadorMod(CombatEntity::AspectMulti(iVar7));
  FLOOR(sVar10,5);
  return sVar10;
}

s16 CombatEntity::SkillCheckFloat(s16 rand,s16 param_3,u8 skill){
  s8 sVar2;
  u16 uVar1;
  float fVar3;
  
  sVar2 = this->charSheetP->Skills->getModdedSkill(skill);
  fVar3 = (float)(int)sVar2;
  if ((float)(int)param_3 * 0.2f <= fVar3) {
    fVar3 = (float)(int)param_3 * 0.2f;
  }
  if ((float)(int)rand <= fVar3) {
    rand = (short)((rand - ((u8)RollD(1,100))));
  }
  return rand;
}


void CombatEntity::WeaponSkillUpChance(u8 chance,u8 weapon){
  if (RollD(1,100) <= (u8)(chance * 0.1f)) this->charSheetP->Skills->AddToBaseWeapon(weapon,1);
}

s16 CombatEntity::CalcAttackResist(CombatEntity *param_2,s16 param_3,u8 param_4){
  CombatAI_s* pcVar1;
  float afStack32;
  
  afStack32 = 0.0;
  if (param_2->CalcGearResist(param_4,&afStack32)) {
    param_3 *= afStack32);
    if ((afStack32 != 0.0) && (param_3 < 1)) param_3 = 1;
    if (((1.0f < afStack32) &&
        (pcVar1 = param_2->aiP, pcVar1)) &&
       ((pcVar1->flags & 8) != 0)) pcVar1->flags |= 0x12;
  }
  return param_3;
}

s16 CombatEntity::UseWeaponEnchantment(CombatEntity *param_2){
  WeaponInstance *pTVar1;
  Temp_enchant *pTVar2;
  s16 ret;
  SpellInstance TStack80;
  
  pTVar1 = this->charSheetP->weapons;
  if (pTVar1) {
    pTVar2 = pTVar1->enchantment;
    if (pTVar2) {
      ret = 0;
      TempSpell::Init(&TStack80,SpellList[pTVar2->index] | 0x300,pTVar2->lv);
      if (CombatEntity::SpellEffectsTarget(param_2,&TStack80)) {
        ret = MagicDamageResistCalc(param_2,&TStack80,true);
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

s16 CombatEntity::CalculateWeaponAttack(CombatEntity *target){
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
  
  pWVar1 = this->charSheetP->weapons;
  if (!pWVar1) sVar3 = 0;
  else {
    x = target->GetCoordXU8();
    y = target->GetCoordYU8();
    pCVar2 = this->charSheetP->Skills;
    backstab = CheckBackstab(target);
    sVar3 = AttackCalc1(target,x,y,backstab);
    rand = RollD(1,100);
    sVar4 =SkillCheckFloat(rand,sVar3,SKILL_Warrior);
    bVar5 = pCVar2->getModdedWeapon(pWVar1->weaponType);
    if (bVar5 < 6) uVar6 = SQ((8 - (uint)bVar5));
    else uVar6 = 5;
    if (sVar4 < sVar3) {
      sVar3 = CombatEntity::STRTheifCheck(sVar3,(int)sVar4,target,1,(int)backstab);
      WeaponSkillUpChance(uVar6,pWVar1->weaponType);
      if (rand == sVar4)
        CSprintf(XHitsY,this->charSheetP->name,target->charSheetP->name);
      else
        CSprintf(XCritsY,this->charSheetP->name,target->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      if (sVar3 == 0) PrintEvade(target);
      else target->PrintDamage(sVar3);
    }
    else {
      WeaponSkillUpChance((u8)(uVar6 >> 1),pWVar1->weaponType);
      PrintEvade(target);
      sVar3 = 0;
    }
  }
  return sVar3;
}

s16 CombatEntity::STRTheifCheck(s16 param_2,s32 param_3,CombatEntity *target,u8 diceMulti,s32 backStab){
  CharSheet *pCVar3;
  u32 DMG;
  s16 iVar6;
  s16 sVar9;
  
  pCVar3 = this->charSheetP;
  DMG = RollD(pCVar3->weapons->damage + GetSTRSteps() * diceMulti,6);
  iVar6 = some_skillcheck_calc(((s32)param_2 - (s32)(s16)param_3));
  iVar6 = (DMG + ((iVar6 + CharStats::getBase(pCVar3->Stats,STAT_LV)) - GetSheildProtection(target,backStab)) * 0x10000 >> 0x10) +
          pCVar3->Skills->getModdedSkill(SKILL_Theif) * 2 * backStab);
  if (iVar6 < 1) iVar6 = 1;
  sVar9 = CalcAttackResist(target,(s16)iVar6,pCVar3->weapons->element);
  FLOOR(sVar9,0);
  return UseWeaponEnchantment(target) + sVar9;
}

s32 CombatEntity::TroubadorMod(s16 param_2){
  s32 iVar2;
  float fVar3;
  
  iVar2 = (s32)param_2;
  if (gCombatP->TroubadorLV) {
    fVar3 = (float)gCombatP->TroubadorLV * 0.01f;
    if (!Flag4()) fVar3 += 1.05f;
    else {fVar3 = 0.95f - fVar3;}
    iVar2*= fVar3;
  }
  return iVar2;
}

s32 CombatEntity::AspectMulti(s16 param_2){
  u8 bVar1;
  s32 iVar2;
  float fVar3;
  
  iVar2 = (s32)param_2;
  fVar3 = 0.75f;
  if ((getNotAspectBonus()) ||(bVar1 = IsAspectBonus(), fVar3 = 1.25f, bVar1))
    {iVar2 *= fVar3);}
  return iVar2;
}

s16 CombatEntity::NightCheck(s16 param_2,s16 param_3,s16 param_4,s16 nightPenalty,u16 param_6){
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

s16 CombatEntity::Unk8006bfc0(s16 param_2,u8 param_3,u8 param_4,s16 param_5,s16 param_6){
  int iVar1;
  s16 asStack_60 [2];
  iVar1 = FUN_80070cc4(&gCombatP->substruct,GetCoordXU8(),GetCoordYU8(),param_3,param_4);
  if (iVar1) {
    asStack_60[0] = param_6;
    asStack_60[1] = param_5;
    param_2 += asStack_60[(iVar1 >> 0x1f & 2U)];
  }
  return param_2;
}


s16 CombatEntity::TheifBackstabMod(s16 param_2,u8 backstab,s16 param_4,s16 param_5){
  return ((s16)((param_2 + param_5 * backstab)) + (s16)this->charSheetP->Skills->getModdedSkill(SKILL_Theif) * param_4 * 10);
}

s16 CombatEntity::CalculateAttackAccuracy(CombatEntity *param_2,s8 param_3,s8 param_4,u8 backstab){
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
  
  pCVar3 = this->charSheetP;
  Atkstats = this->charSheetP->Stats;
  DefStats = param_2->charSheetP->Stats;
  pTVar4 = this->charSheetP->weapons;
  pCVar5 = this->charSheetP->Skills;
  prox = Get2DProximity(param_2);
  iVar7 = CharStats::getModded(Atkstats,STAT_INT);
  iVar8 = CharStats::getModded(Atkstats,STAT_DEX);
  iVar9 = CharStats::getBase(Atkstats,STAT_LV);
  cVar11 = pCVar5->getModdedWeapon(pTVar4->weaponType);
  cVar12 = pCVar5->getModdedSkill(SKILL_Warrior);
  //(INT+STAT_DEX+LV)+(WepHit+WepSkill*6+Warrior*2)
  uVar15 = (s32)((((iVar7 + iVar8 + iVar9) * 0x10000 >> 0x10) + (u32)pTVar4->hit + cVar11 * 6 + cVar12 * 2) * 0x10000) >> 0x10;
  if (6 < (s32)prox) {uVar15 = (s32)(uVar15 - ((s32)prox - 5) * 0x10000) >> 0x10;}
  iVar7 = (uVar15 - CharStats::getBase(DefStats,STAT_LV)) * 0x10000;
  uVar16 = (u16)((u32)iVar7 >> 0x10);
  if (!param_2->HasPetrifyEffect()) {
    uVar16 = (u16)((u32)(((((iVar7 >> 0x10) + CharStats::getModded(DefStats,STAT_DEX) * -2) * 0x10000 >> 0x10) - param_2->GetBlock()) * 0x10000) >> 0x10);
  }
  iVar7 = TheifBackstabMod(uVar16,backstab,0,0x14);
  if (param_2->unk22 == 0) iVar7 *= 1.2f;
  if (CharStats::getModded(DefStats,STAT_STAM) == 0) iVar7 *= 1.15f;
  iVar8 = FUN_80070cc4(&gCombatP->substruct,param_3,param_4,GetCoordXU8(),GetCoordYU8());
  iVar8 *= (iVar7 * 0.05f + 1.0f);
  if (CharStats::getModded(Atkstats,STAT_STAM) == 0) iVar8 *= 0.9f;
  iVar7 = iVar8 *(1.0f - TerrainPointer->PrecipScale * 0.3f);
  if (TerrainPointer->partOfDay == TIME_NIGHT) iVar7 *= 0.7f;
  if (param_2->unk22 != 0) iVar7 *= 0.8f;
  sVar10 = TroubadorMod(CombatEntity::AspectMulti(iVar7));
  if (sVar10 < 5) sVar10 = 5;
  return sVar10;
}


u16 CombatEntity::WeaponAttack(CombatEntity *target){
  u8 WVar1;
  CharSkills *pCVar2;
  u8 uVar5;
  u8 uVar6;
  bool bVar7;
  short sVar3;
  u16 rand;
  s16 sVar4;
  byte bVar8;
  u16 dmg;
  u8 uVar9;
  
  uVar5 = target->GetCoordXU8();
  uVar6 = target->GetCoordYU8();
  pCVar2 = this->charSheetP->Skills;
  WVar1 = this->charSheetP->weapons->weaponType;
  bVar7 = CheckBackstab(target);
  sVar3 = CalculateAttackAccuracy(target,uVar5,uVar6,bVar7);
  rand = RollD(1,100);
  sVar4 = SkillCheckFloat(rand,sVar3,SKILL_Warrior);
  bVar8 = pCVar2->getModdedWeapon(WVar1);
  if (bVar8 < 6) uVar9 = SQ(8 - (uint)bVar8);
  else uVar9 = 5;
  if (sVar4 < sVar3) {
    dmg = STRTheifCheck(sVar3,(int)sVar4,target,0,0);
    if (rand == sVar4) 
      CSprintf(XHitsY,this->charSheetP->name,target->charSheetP->name);
    else
      CSprintf(XCritsY,this->charSheetP->name,target->charSheetP->name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    print_combat_textbox(gCombatP,gGlobals.text,0);
    if (dmg == 0) PrintSwingAndMiss(target);
    else target->PrintDamage(dmg);
    WeaponSkillUpChance((u8)uVar9,WVar1);
  }
  else {
    WeaponSkillUpChance((u8)(uVar9 >> 1),WVar1);
    PrintSwingAndMiss(target);
    dmg = 0;
  }
  return dmg;
}


u8 isDispelMagic(char x){
  u32 uVar1=0;
  u8 *pbVar2;
  u8 uStack64 [5]={42,43,44,45,0xff}; //dispel magic indecies
  
  pbVar2 = uStack64;
  while( true ) {
    if (uStack64[0] == 0xff) {return false;}
    if (*pbVar2 == x) break;
    uVar1++;
    uStack64[0] = uStack64[uVar1];
    pbVar2 = uStack64 + uVar1;
  }
  return true;
}

u8 CombatEntity::GetSpellError(CombatEntity *param_2,SpellInstance *param_3,u8 param_4){
  u8 bVar2;
  
  if (param_3->target == MTarget_Field) {
    if (param_4 == false) {
      CSprintf(SpellCant);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
    }
    this->charSheetP->spellVal = 0xfe;
  }
  else {
    bVar2 = Entity::CheckSpellSpecial(param_2->charSheetP,param_3);
    if (bVar2 == 0) {
      bVar2 = Entity::CheckSpellTimeOfDay(this->charSheetP,param_3);
      if (bVar2 == 0) {return true;}
    }
    PrintSpellError(param_2,bVar2,param_4);
  }
  return false;
}

void CombatEntity::PrintSpellFailCause(char *param_2){
  copy_string_to_combat_textbox(gCombatP,param_2,0);
  print_combat_textbox(gCombatP,param_2,0);
  this->charSheetP->spellVal = 0xfe;
  this->charSheetP->spellSwitch = 0;
  clear_combat_substruc2(gCombatP->substruct2 + 1);
}

void CombatEntity::PrintSpellCast(CombatEntity *param_2,SpellInstance *param_3){
  CSprintf(SpellXCastsY,this->charSheetP->name,param_3->base.name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  CSprintf(SpellXCastOnY,param_3->base.name,param_2->charSheetP->name);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void CombatEntity::PrintSpellFail(){
  CSprintf(SpellFail,this->charSheetP->name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void CombatEntity::PrintSpellResist(CombatEntity *param_2,SpellInstance *param_3){
  CSprintf(SpellXCastsY,this->charSheetP->name,param_3->base.name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  CSprintf(SpellResist,param_2->charSheetP->name);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void CombatEntity::PrintSpellError(CombatEntity* param_2,s32 param_3,u8 param_4){
  if (param_4 == false) {
    CSprintf(X,spell_error_labels[param_3]);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    print_combat_textbox(gCombatP,gGlobals.text,0);
  }
}

u8 CombatEntity::IsControlMagic(u8 x){
  u8 *pbVar1;
  u8 uStack64 []={
    SPELLIND_ControlElem,SPELLIND_charming,
    SPELLIND_controlMarquis,SPELLIND_controlZombies,255};
  
  pbVar1 = uStack64;
  while( true ) {
    if (uStack64[0] == 0xff) return false;
    if (*pbVar1 == x) break;
    pbVar1++
    uStack64[0] = *pbVar1;
  }
  return true;
}

u8 petrify_spells[4]={SPELLIND_wallOfBones,SPELLIND_frozenDoom,SPELLIND_webOfStarlight,255};

u8 CombatEntity::isPetrify(u8 enum_spell){

  u8 *pSVar1;
  u8 uVar2;

  uVar2 = 0;
  if (petrify_spells[0] != 255) {
    pSVar1 = petrify_spells;
    do {
      if (*pSVar1 == enum_spell) return true;
      uVar2++;
      pSVar1 = petrify_spells + uVar2;
    } while (petrify_spells[uVar2] != 255);
  }
  return false;
}

u8 CombatEntity::m8006cbb4(CombatEntity *param_2,SpellInstance *param_3){
  CombatEntity *pCVar1;
  u8 bVar2;
  u32 uVar3;
  u32 uVar4;
  
  if (gCombatP->enemy_index == 0xc) return true;
  else {
    uVar3 = (u32)gCombatP->playerCount;
    uVar4 = 0;
    if (uVar3 < gCombatP->EntCount) {
      do {
        pCVar1 = (&gCombatP->combatEnts)[uVar3];
        if (((pCVar1) && (!Entity::isDead(pCVar1->charSheetP)))
           && ((!pCVar1->Flag4() || (!pCVar1->HasPetrifyEffect())))) {
          uVar4++;
        }
        uVar3++;
      } while (uVar3 < gCombatP->EntCount);
    }
    bVar2 = true;
    if (2 < uVar4) {
      PrintSpellResist(param_2,param_3);
      bVar2 = false;
    }
  }
  return bVar2;
}

u8 CombatEntity::ControlPetrifyCheck(CombatEntity *param_2,SpellInstance *param_3,u8 param_4){
  if (((!IsControlMagic(param_4)) && (!isPetrify(param_4))) ||(Flag4())) return true;
  else return m8006cbb4(param_2,param_3);
}

u8 CombatEntity::CheckForPetrify(CombatEntity *param_2,SpellInstance *param_3,u8 param_4){   
  if (!isPetrify(param_4)) return true;
  else return m8006cbb4(param_2,param_3);
}

u8 CombatEntity::CheckSpellIngredient(SpellInstance *param_2){
  u8 bVar4;
  u8 bVar5;
  ulong uVar2;
  
  bVar5 = true;
  if (((!Flag5()) && (bVar5 = true, this->aiP == NULL)) &&
     (bVar5 = true, param_2->cost)) {
    if (!PARTY->Inventory->TakeItem(TempSpell::GetIngredient(param_2),1)) {
      PrintSpellFailCause(ComString(SpellFailComponent));
      bVar5 = false;
    }
    else bVar5 = true;
  }
  return bVar5;
}

u16 CombatEntity::AspectMulti_check(u8 param_2){
  u16 uVar3;
  float aspectMod;
  float moonfloats [4]={0.5f,0.75f,1.25f,1.5f};
  float dayfloats [5]={0.75f,1.25f,1.25f,0.75f,0.75f};
  s32 intStat = CharStats::getModded(this->charSheetP->Stats,STAT_INT);
  s32 lvl = CharStats::getBase(this->charSheetP->Stats,STAT_LV);
  if (this->charSheetP->EXP->GetAspect() == ASPECT_LUNAR) aspectMod = moonfloats[TerrainPointer->moonPhases];
  else aspectMod = dayfloats[TerrainPointer->partOfDay];
  uVar3 = CombatEntity::TroubadorMod((intStat * 4 + param_2 * 6 + lvl) * aspectMod);
  FLOOR(uVar3,5);
  return uVar3;
}

u8 CombatEntity::SpellIngredientCheck(SpellInstance *param_2,s16 param_3,s16 param_4){
  CharSheet *pCVar1;
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
    uVar5 = SQ((5 - param_2->level));
  }
  else uVar5 = 3;
  if (param_3 < param_4) {
    bVar7 = some_skillcheck_calc((param_4 - param_3));
    bVar9 = true;
  }
  else {
    if ((!Flag5()) && (param_2->cost)) {
      PARTY->Inventory->AddItem(TempSpell::GetIngredient(param_2),1);
    }
    PrintSpellFail();
    uVar5>>=1;
    bVar7 = 0xff;
  }
  this->charSheetP->spellVal = bVar7;
  if (bVar8) {fVar10 -= fVar3;}
  if (RollD(1,100) <= ((u8)uVar5 * 0.1f)) {
    uVar5 = param_2->level + 1;
    CIEL(uVar5,10);
    param_2->level = uVar5;
  }
  return bVar9;
}


u8 CombatEntity::CheckSpellWizard(CombatEntity *x,SpellInstance *param_2,u8 param_3){
  u32 LV;
  s16 sVar3;
  s32 iVar2;
  
  if (!param_3) LV = Entity::CheckSpellWizard(this->charSheetP,param_2);
  else LV = (u32)param_2->level;
  if (CheckSpellIngredient(param_2)) {
    if (Entity::TestEquipStamina(this->charSheetP,(s16)Entity::SpellStaminaSubtract(this->charSheetP,param_2,(u8)STAT_LV))) {
      sVar3 = AspectMulti_check(LV);
      iVar2 = SkillCheckFloat((s16)RollD(1,100),sVar3,SKILL_Wizard);
      return SpellIngredientCheck(param_2,(s16)iVar2,sVar3);
    }
    PrintSpellFailCause(ComString(SpellFailTired));
  }
  return false;
}

u8 CombatEntity::UseSpellCharge(CombatEntity*x,SpellInstance *param_2,u8 param_3){
  u8 bVar2;
  u8 bVar3;
  u32 uVar1;
  
  bVar3 = this->charSheetP->spellSwitch;
  if (Flag0()) return true;
  if (param_3 == false) {
    if (bVar3 == 1) {
      if (!CheckSpellWizard(x,param_2,false)) return false;
      goto LAB_8006d340;
    }
    if (Entity::GetSpellCharges(this->charSheetP) == 0) {
      CSprintf(SpellFail,this->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      this->charSheetP->spellVal = 0xfe;
      this->charSheetP->spellSwitch = 0;
      clear_combat_substruc2(gCombatP->substruct2 + 1);
      return false;
    }
    Entity::DecSpellCharge(this->charSheetP);
  }
  this->charSheetP->spellVal = some_skillcheck_calc((s16)RollD(1,100));
LAB_8006d340:
  SetFlag(COMBATENT_CASTING);
  return true;
}

u8 CombatEntity::MagicCheck(SpellInstance *param_2,CombatEntity *param_3){
  u8 bVar3;
  u8 bVar1;
  u8 bVar2;
  
  bVar3 = GetIDIndex(param_2->base.id);
  if ((bVar3 != SPELLIND_wallOfBones) ||
     (bVar2 = false, param_3->charSheetP->ID != (ItemID)(entityList[170] + 0x200))) {//marquis
    bVar1 = isDispelMagic(bVar3);
    bVar2 = false;
    if (bVar1 == false) {
      if (bVar3 == SPELLIND_teleportation) bVar2 = false;
      else {
        bVar2 = true;
        if ((param_2->target != MTarget_Enemy) && (bVar2 = true, (param_2->aspect_flag & 0x10) == 0)
           ) {
          if (bVar3 == SPELLIND_wind) {bVar2 = param_3->Flag4() != this->Flag4();}
          else bVar2 = false;
        }
      }
    }
  }
  return bVar2;
}

u8 CombatEntity::VSMagic(SpellInstance *param_2,CombatEntity *param_3,char *param_4){
  u8 bVar1;
  CharStats_s* stats;
  s32 lVar2;
  s16 iVar3;
  u16 uVar6;
  u8 bVar9;
  CharSheet *pCVar10;
  float fVar11;
  
// no TP with Shadow present
  if ((param_2->base.id == (ItemID)(SpellList[SPELLIND_teleportation] + 0x300)) && (gGlobals.ShadowIndex != -1)) {
    PrintSpellFail();
    return false;
  }
  if (!MagicCheck(param_2,param_3)) return true;
  stats = param_3->charSheetP->Stats;
  iVar3 = (CharStats::getModded(stats,STAT_WIL) * 3 + CharStats::getModded(stats,STAT_END) + CharStats::getBase(stats,STAT_LV)) * 0x10000 >> 0x10;
  uVar6 = param_3->CheckVSMagic(param_2);
  if (uVar6) iVar3 = (s16)(uVar6 + iVar3);
  if ((param_2->aspect_flag & 2) == 0) {if ((param_2->aspect_flag & 1) == 0) goto LAB_8006d5ac;}
  fVar11 = 0.75f;
  if (GetCharAspect(param_3->charSheetP->EXP) != GetCharAspect(this->charSheetP->EXP)) {fVar11 = 1.25f;}
  iVar3 *= fVar11;
LAB_8006d5ac:
  uVar6 = RollD(1,100);
  bVar9 = true;
  if ((s16)uVar6 <= iVar3) {
    lVar2 = some_skillcheck_calc((iVar3 - uVar6));
    pCVar10 = this->charSheetP;
    if (lVar2 < pCVar10->spellVal) {
      if (param_3->mirrorVal) {
        iVar3 = (pCVar10->spellVal - lVar2);
        if (iVar3 < param_3->mirrorVal) {param_3->mirrorVal-= (char)((u32)iVar3 >> 0x10);}
        else {param_3->mirrorVal = 0;}
        lVar2 = this->charSheetP->spellVal;
        pCVar10 = this->charSheetP;
      }
      bVar1 = pCVar10->spellVal;
    }
    else {bVar1 = pCVar10->spellVal;}
    bVar9 = true;
    if (lVar2 < (char)bVar1) {*param_4 -= (char)lVar2;}
    else {
      CombatEntity::PrintSpellResist(param_3,param_2);
      bVar9 = false;
    }
  }
  return bVar9;
}


u8 CombatEntity::Banish(CombatEntity *param_2,SpellInstance *param_3){
  PrintSpellCast(param_2,param_3);
  CSprintf(XBanished,param_2->charSheetP->name);
  copy_to_combat_textbox_2(gCombatP,gGlobals.text,4);
  return Entity::getHPCurrent(param_2->charSheetP);
}

s32 CombatEntity::DispelMagic(CombatEntity *param_2,SpellInstance *param_3,u8 param_4,u8 param_5){
  if (!Entity::DispelMagic(param_2->charSheetP,param_2,param_4,param_5)) {
    CSprintf(SpellXCastsY,this->charSheetP->name,param_3->base.name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    CSprintf(XFails,param_3->base.name);
    print_combat_textbox(gCombatP,gGlobals.text,0);
  }
  else PrintSpellCast(param_2,param_3);
  return -1;
}


s32 CombatEntity::EnchantAlly(CombatEntity *param_2,SpellInstance *param_3,u8 param_4,u8 param_5,u8 param_6){

  PrintSpellCast(param_2,param_3);
  if (param_2->Flag4() == this->Flag4()) {
    Entity::AllocEnchant(param_2->charSheetP,param_4,(u32)param_6,param_5,((u32)param_6 * 0xe0 + (u32)param_6) * 8,1);
    return -1;
  }
  return param_3->damage;
}

s16 CombatEntity::CalcSpellDamage(SpellInstance *param_2,CombatEntity *param_3,u32 Level,u8 param_5){
  u8 spellInd = GetIDIndex(param_2->id);
  if (spellInd == SPELLIND_banishing) return Banish(param_3,param_2);
  if (isDispelMagic(spellInd))return DispelMagic(param_3,param_2,spellInd,param_5);
  else {
      if ((!ControlPetrifyCheck(param_3,param_2,spellInd)) ||
         (!CheckForPetrify(param_3,param_2,spellInd))) return 0;
      if ((param_2->damage == 0) || (TempSpell::IsBattleSpell(param_2))) {
        param_3->damage = 0;
        param_3->Healing = 0;
        Entity::ApplySpellEffect(param_3->charSheetP,spellInd,Level,Level * SECONDS(30),param_5,param_3);
        if (spellInd == SPELLIND_tapStamina)
          Entity::AllocEnchant(this->charSheetP,SPELLIND_tapStamina,Level,0,Level * SECONDS(30),0);
        PrintSpellCast(param_3,param_2);
        return -1;
      }
      if (param_2->damage == 5) {
        PrintSpellCast(param_3,param_2);
        return Level;
      }
      if (spellInd != SPELLIND_wind) {
        PrintSpellCast(param_3,param_2);
        return (s32)param_2->damage;
      }
      return EnchantAlly(param_3,param_2,0xb,param_5,(char)Level);
    }
}

s16 CombatEntity::MagicDamageResistCalc(CombatEntity *param_2,SpellInstance *param_3,u8 param_4){
  u8 bVar4;
  u32 uVar1;
  s32 iVar2;
  s16 sVar3;
  u8 abStack32 [32];
  
  noop_80070658(this);
  sVar3 = -2;
  if (GetSpellError(param_2,param_3,param_4)) {
    if (param_4 == false) {uVar1 = Entity::CheckSpellWizard(this->charSheetP,param_3);}
    else {uVar1 = (u32)param_3->level;}
    if (!UseSpellCharge(param_2,param_3,param_4)) sVar3 = -2;
    else {
      abStack32[0] = this->charSheetP->spellVal;
      bVar4 = VSMagic(param_3,param_2,(char *)abStack32);
      if (bVar4 == false) {sVar3 = -1;}
      else {
        iVar2 = CalcSpellDamage(param_3,param_2,uVar1,abStack32[0]);
        if (iVar2 < 0) {sVar3 = -3;}
        else {
          uVar1 = RollD(abStack32[0] + (char)iVar2,6);
          sVar3 = param_2->CalcMagicResist((s16)uVar1,param_3);
        }
      }
    }
  }
  return sVar3;
}

s16 CombatEntity::CalcMagicResist(s16 param_2,SpellInstance *param_3){
  CombatAI_s* pcVar1;
  float afStack32 = 0.0;

  if (CombatEntity::MagicResistChecks(param_3,&afStack32)) {
    param_2 *= afStack32);
    if ((afStack32 != 0.0) && (param_2 < 1)) {param_2 = 1;}
    if (((1.0f < afStack32) &&
        (pcVar1 = this->aiP, pcVar1)) &&
       ((pcVar1->flags & 8) != 0)) {pcVar1->flags |= 0x12;}
  }
  return param_2;
}

void CombatEntity::SubtractPotion(){
  if (!this->aiP) {
    PARTY->Inventory->TakeItem(this->item | 0x1000,1);
    ShowWeaponFlask();
  }
}


void AddPotionVisualEffect(u8 playerDatIndex,u8 potion,CharSheet *ent){
  playerData *ppVar1;
  undefined4 uVar2;
  uint uVar3;
  PotionEffect *pPVar2;
  
  ppVar1 = gGlobals.playerDataArray[playerDatIndex];
  if (ppVar1) {
    ppVar1->ani_type = 5;
    uVar2 = InitPotionEffect(ppVar1,potion);
    pPVar2 = *(PotionEffect **)*ent->potionEffects;
    uVar3 = 0;
    while (((pPVar2 == NULL || (pPVar2->ID != potion)) || (pPVar2->SpellVisualIndex != 0xffff))) {
      if (6 < uVar3 + 1) return;
      pPVar2 = (PotionEffect *)(&(*ent->potionEffects)[0].timer)[uVar3];
      uVar3++;
    }
    pPVar2->SpellVisualIndex = uVar2;
  }
  return;
}



void CombatEntity::HealByPotion(CombatEntity *param_2,u16 HI,u16 Lo){
  u16 uVar1 = Entity::HealByPotion(this->charSheetP,HI,Lo);
  if (uVar1 == 0) {
    CSprintf(XPotionFail,this->charSheetP->name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    print_combat_textbox(gCombatP,gGlobals.text,0);
  }
  else {
    AddPotionVisualEffect((u32)this->index,this->item,this->charSheetP);
    param_2->PrintHealing(uVar1);
    copy_to_textbox_1(gCombatP);
  }
}

u8 CombatEntity::UsePotion(CombatEntity *param_2){
  u8 PVar1 = this->item;
  if (PVar1 < POTION_STRENGTH) {
    if (PVar1 == POTION_HEALING) {
      HealByPotion(param_2,15,25);
      return true;
    }
    if (PVar1 == POTION_CURING) {
      HealByPotion(param_2,40,60);
      return true;
    }
    if (PVar1 == POTION_STAMINA) {
      Entity::StaminaPotion(this->charSheetP);
      CSprintf(XPotionStamina,this->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      AddPotionVisualEffect(this->index,this->item,this->charSheetP);
      return true;
    }
    if (PVar1 == POTION_ANTIDOTE) {
      Entity::ApplySpellEffect(this->charSheetP,SPELLIND_removePoison,0,0,0xff,this);
      CSprintf(XPotioned,this->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      AddPotionVisualEffect(this->index,this->item,this->charSheetP);
      return true;
    }
    if (PVar1 == POTION_RESTORE){
    Entity::ClearDebuffSpells(this->charSheetP);
    AddPotionVisualEffect((u32)this->index,this->item,this->charSheetP);
    CSprintf(XPotioned,this->charSheetP->name);
    }
    else return false;
  }
  else {
    if (!Entity::HasPotionEffect(this->charSheetP,PVar1)) {
      Entity::ApplyPotionEffect(this->charSheetP,this->item,0,HOURS(3));
      CSprintf(XPotioned,this->charSheetP->name);
      AddPotionVisualEffect((u32)this->index,this->item,this->charSheetP);
    }
    else {CSprintf(XPotionedAlready,this->charSheetP->name);}
  }
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  print_combat_textbox(gCombatP,gGlobals.text,0);
  return true;
}

s16 CombatEntity::PotionAccuracy(CombatEntity *target,u8 prox){
  CharStats_s *stats;
  CharStats_s *stats_00;
  int iVar5;
  s16 sVar11;
  short sVar12;
  s16 uVar15;
  
  stats = this->charSheetP->Stats;
  stats_00 = target->charSheetP->Stats;
  uVar15= (s16)(CharStats::getModded(stats,STAT_INT) + CharStats::getModded(stats,STAT_DEX) + CharStats::getBase(stats,STAT_LV))+
          (s16)(this->charSheetP->Skills->getModdedWeapon(WEAPON_Thrown) * 6 + this->charSheetP->Skills->getModdedSkill(SKILL_Warrior) * 2 + 40)
          -((u8)(target->GetBlock()>>1)+CharStats::getModded(stats_00,STAT_DEX) + CharStats::getBase(stats_00,STAT_LV));
  if (6 < prox) uVar15  -= (prox - 5);
  sVar11 = TheifBackstabMod(uVar15,CheckBackstab(target),0,20);
  iVar5 = sVar11;
  if (CharStats::getModded(stats_00,STAT_STAM) == 0) iVar5 = sVar11 + 10;
  if (target->unk22) iVar5 -=20;
  sVar12 = iVar5;
  if (this->Flag3()) sVar12 -=25;
  sVar12 = TroubadorMod(AspectMulti(NightCheck(sVar12,0x14,10,0x1e,(u16)prox)));
  FLOOR(sVar12,5);
  return sVar12;
}

void CombatEntity::PrintFlaskMiss(CombatEntity *param_2,u8 param_3){ 
  playerData *ppVar1 = gGlobals.playerDataArray[param_2->index];
  copyVec3(&(ppVar1->collision).pos,&gGlobals.combatCursorPos);
  gGlobals.combatCursorPos.y += gEntityDB->GetHeight(param_2->charSheetP->ID) * 0.5f - (ppVar1->collision).radius;
  WeaponSkillUpChance(param_3 >> 1,WEAPON_Thrown);
  gGlobals.playerDataArray[this->index]->ani_type = 0xf;
  SubtractPotion();
  CSprintf(XAttacksY,this->charSheetP->name,param_2->charSheetP->name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  CSprintf(XMiss,this->charSheetP->name);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void CombatEntity::FlaskNoop(s8 x,s8 y,bool unk,s16 val,u8 arg5){}

u16 CombatEntity::GetFlaskDamage(){
  u16 table [4]= {RollD(4,6),RollD(8,6),RollD(2,6),15};
  return table[this->item];
}

void CombatEntity::FlaskAttack(CombatEntity *param_2,s16 param_3){
  u8 A;
  u8 B;
  CombatEntity *pCVar1;
  playerData *ppVar2;
  u8 bVar9;
  u16 uVar7;
  s16 sVar8;
  s32 iVar4;
  u32 uVar6;
  u8 uVar10;
  u8 uVar11;
  u8 bStack48[2];
  
  uVar11 = 0;
  A = gCombatP->potionPos[0];
  B = gCombatP->potionPos[1];
  if (this->item == POTION_ACID) uVar11 = RollD(2,6);
  if (gCombatP->EntCount) {
    for(u32 i=0;i<gCombatP->EntCount;i++) {
      pCVar1 = (&gCombatP->combatEnts)[i];
      if ((pCVar1) && (!Entity::isDead(pCVar1->charSheetP))) {
        bStack48[0] = 0;
        bStack48[1] = 0;
        pCVar1->GetCoordU8(&bStack48[0],&bStack48[1]);
        uVar7 = sub_square_add_(A,B,bStack48[0],bStack48[1]);
        uVar10 = 1;
        if (1 < (uVar7)) {uVar10 = sub_square_add_(A,B,bStack48[0],bStack48[1]);}
        if ((this->item == POTION_ACID) && (uVar10 <= uVar11)) {
          Entity::ApplyPotionEffect(pCVar1->charSheetP,POTION_ACID,(char)(uVar11 / uVar10),HOURS(3));
          AddPotionVisualEffect((u32)pCVar1->index,this->item,pCVar1->charSheetP);
        }
        else {
          if (uVar10 <= param_3) {
            s16 iVar5 = param_3 / uVar10;
            if (pCVar1 == param_2) pCVar1->PrintDamage((s16)iVar5);
            if (this->item == POTION_SLEEP) {
              if ((pCVar1 != param_2) &&
                 (CharStats::getModded(pCVar1->charSheetP->Stats,STAT_STAM) <= iVar5)) {
                iVar5 = CharStats::getModded(pCVar1->charSheetP->Stats,STAT_STAM)-1;
              }
              if (iVar5 < 1) pCVar1->damage = (u8)iVar5;
              else {
                Entity::DecreaseHP(pCVar1->charSheetP,(s16)iVar5);
                AddPotionVisualEffect((u32)pCVar1->index,this->item,pCVar1->charSheetP);
                pCVar1->damage = (u8)iVar5;
              }
            }
            else {
              if ((pCVar1 != param_2) &&
                 (Entity::getHPCurrent(pCVar1->charSheetP) <= iVar5)) {
                iVar5 = (Entity::getHPCurrent(pCVar1->charSheetP) - 1);
              }
              if (0 < iVar5) {
                Entity::DamageToLevel(pCVar1->charSheetP,iVar5,pCVar1);
                AddPotionVisualEffect((u32)pCVar1->index,this->item,pCVar1->charSheetP);
              }
              pCVar1->damage = (u8)iVar5;
            }
            if (pCVar1 == param_2) {pCVar1->TryCheatDeath((s16)iVar5);}
            ppVar2 = gGlobals.playerDataArray[pCVar1->index];
            if ((ppVar2) && (ppVar2->ani_type = 7, pCVar1 != param_2)) {
              Print_damage_healing(ppVar2,(u16)pCVar1->damage,0,false,pCVar1->charSheetP);
              pCVar1->damage = 0;
            }
          }
        }
      }
    }
  }
}

u8 CombatEntity::PotionAttack(CombatEntity *target){
  bool bVar4;
  short sVar2;
  u16 rand;
  s16 sVar3;
  byte bVar5;
  Borg9data *borgDat;
  u8 uVar6;
  float fVar7;
  u8 coord8 [2];
  vec3f posHi;
  vec3f posLo;
  if (!UsePotion(target)) {
    target->GetCoordU8(coord8,coord8 + 1);
    sVar2 = PotionAccuracy(target,Get2DProximity(target));
    rand = RollD(1,100);
    sVar3 = SkillCheckFloat(rand,sVar2,SKILL_Warrior);
    bVar5 = this->charSheetP->Skills->getModdedWeapon(WEAPON_Thrown);
    if (bVar5 < 6) uVar6 = SQ((8 - bVar5));
    else uVar6 = 5;
    if (sVar2 <= sVar3) {
      PrintFlaskMiss(target,uVar6);
      return 0;
    }
    FlaskNoop(coord8[0],coord8[1],rand != sVar3,sVar2 - sVar3,fVar7);
    borgDat = &(gGlobals.Sub.ZoneDatMtx[1][1].mapPointer)->dat;
    setVec3(&posHi,(float)coord8[0],50.0,(float)coord8[1]);
    setVec3(&posLo,(float)coord8[0],-10.0,(float)coord8[1]);
    if (!CheckCollision(borgDat,&posHi,&posLo,0.5,&gGlobals.combatCursorPos,NULL,0)) {
      setVec3(&gGlobals.combatCursorPos,(float)coord8[0],0.0,(float)coord8[1]);
    }
    bVar5 = GetFlaskDamage();
    CSprintf(XAttacksY,this->charSheetP->name,target->charSheetP->name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    print_combat_textbox(gCombatP,gGlobals.text,0);
    gCombatP->potionPos[0] = coord8[0];
    gCombatP->potionPos[1] = coord8[1];
    this->damage = bVar5;
    WeaponSkillUpChance(uVar6,WEAPON_Thrown);
    gGlobals.playerDataArray[this->index]->ani_type = 0xf;
  }
  SubtractPotion();
  return 0;
}

u8 CombatEntity::HealingSkill(CombatEntity *param_2,playerData * param_3){
  
  u32 hpOld = Entity::getHPCurrent(param_2->charSheetP);
  s8 healerI = PARTY->GetMemberIndex(this->charSheetP->ID);
  s8 healedI = PARTY->GetMemberIndex(param_2->charSheetP->ID);
  if ((healerI != 0xff) && (healedI != 0xff)) {
    if ((this->flags & COMBATENT_MEDIC) == 0) pass_to_party_healing_func(PARTY,healerI,healedI);
    else pass_to_healing_func_2(PARTY,healerI,healedI);
    if ((s32)hpOld < (s32)Entity::getHPCurrent(param_2->charSheetP)) {
      u32 hpNew = Entity::getHPCurrent(param_2->charSheetP);
      CSprintf(XHealsY,this->charSheetP->name,param_2->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      param_2->PrintHealing((hpNew - hpOld));
      param_3->ani_type = 5;
      param_2->Healing = (u8)(hpNew - hpOld);
    }
    else {
      CSprintf(XHealFail,this->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
    }
  }
  return 0;
}

u8 CombatEntity::SelectAttack(CombatEntity *param_2,playerData *param_3){
  u8 bVar1;
  u8 SetAni;
  u8 bVar5;
  s16 sVar3;
  
  bVar5 = 0;
  SetAni = true;
  bVar1 = this->AtkType;
  if (bVar1 != 2) {
    if (bVar1 < 3) {
      if (bVar1 == 1) bVar5 = CalculateWeaponAttack(param_2);
      else SetAni = false;
      goto SetAnimation;
    }
    if (bVar1 == 3) {
      bVar5 = PotionAttack(param_2);
      SetAni = false;
      goto SetAnimation;
    }
    if (bVar1 != 4) {
      SetAni = false;
      goto SetAnimation;
    }
    this->AtkType = 1;
    if (CanBeTargeted(param_2,0)) {
      bVar5 = CalculateWeaponAttack(param_2);
      this->AtkType = 4;
      goto SetAnimation;
    }
    this->AtkType = 4;
  }
  bVar5 = WeaponAttack(param_2);
SetAnimation:
  if (SetAni) {param_3->ani_type = GetWeaponAnimation(this->charSheetP->weapons->animation);}
  return bVar5;
}

void set_movement_spellUsed(playerData *pDat,u16 param_2,u16 param_3){
  pDat->movement_ = param_2;
  pDat->spellUsed = param_3;}

s16 CombatEntity::m8006edd0(CombatEntity *param_2,playerData *param_3,playerData *param_4){
  Temp_enchant *pTVar1;
  SpellInstance *pSVar2;
  s16 sVar4;
  s16 sVar5;
  u8 SVar6;
  undefined4 uVar3;
  bool bVar7;
  uint uVar8;
  s16 lVar9;
  s16 lVar10;
  
  pSVar2 = Entity::getSpellSafe(this->charSheetP,0x13cb,u32_800f5440);
  if (!pSVar2) return 0;
  else {
    sVar5 = MagicDamageResistCalc(param_2,pSVar2,false);
    lVar10 = sVar5;
    if (lVar10 == 0) param_2->PrintSpellResist(param_2,pSVar2);
    lVar9 = lVar10;
    if (lVar10 == 0xfffd) lVar9 = 0;
    if (lVar9 == 0xffff) {
      lVar10 = -1;
      lVar9 = 0;
    }
    if (lVar9 == 0xfffe) {
      lVar10 = -2;
      lVar9 = 0;
    }
    param_3->ani_type = 5;
    SVar6 = GetIDIndex((pSVar2->base).id);
    set_movement_spellUsed(param_3,param_3->ani_type,(short)(char)SVar6);
    uVar3 = FUN_80095c04(param_3,param_4,SVar6,(s32)lVar10);
    if ((lVar9 != 0) || (sVar4 = 0, lVar10 == 0xfffd)) {
      sVar4 = (s16)lVar9;
      if (TempSpell::IsBattleSpell(pSVar2)) {
        for(uVar8=0;uVar8 < 0xf;uVar8++) {
          pTVar1 = param_2->charSheetP->effects[uVar8];
          if ((pTVar1)&&(pTVar1->index == SVar6)) {
            if (pTVar1->SpellVisualIndex == 0xffff) {
              pTVar1->SpellVisualIndex = uVar3;
              return sVar4;
            }
          }
        }
      }
    }
  }
  return sVar4;
}

s16 CombatEntity::GoblinAmbushAttack(CombatEntity *target,s16 dmg){
  s16 ret = 0;
  if(dmg){
    CharSheet *pCVar1 = target->charSheetP;
    ret = dmg;
    if((pCVar1->ID == (ItemID)(entityList[153] | 0x200))&&
      (gCombatP->encounter_dat->EncounterID == FLAG_GoblinAmbush)){
      target->PrintDamage(1);
      gGlobals.GoblinHitTally--;
      ret = 1;
    if (gGlobals.GoblinHitTally == 0) {
     CharStats::addModdedHealth(pCVar1->Stats,STAT_STR,-CharStats::getModded(pCVar1->Stats,STAT_STR));
     target->UpdateMoveFlag();
     ret = 1;
    }
   }
}
  return ret;
}


void CombatEntity::TryCheatDeath(s16 param_2){
  if (Entity::getHPCurrent(this->charSheetP) <= param_2) {
    if (!Entity::hasCheatDeath(this->charSheetP)) {
      CSprintf(XKilled,this->charSheetP->name);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      Death();
    }
    else {
      CSprintf(CheatDeath,this->charSheetP->name);
      print_combat_textbox(gCombatP,gGlobals.text,0);
    }
  }
}


u8 CombatEntity::CalculateAttack(CombatEntity *target,u8 param_3){
  playerData *ppVar2;
  playerData *ppVar3;
  u16 uVar5;
  s16 sVar6;
  
  ppVar2 = gGlobals.playerDataArray[this->index];
  ppVar3 = gGlobals.playerDataArray[target->index];
  TroubadourStop;
  this->TargetIndex = (u32)target->index;
  if (param_3)  {
    clear_substruct2_arrayB(gCombatP->substruct2 + 1);
    if (Flag89()) uVar5 = HealingSkill(target,ppVar2);
    else uVar5 = SelectAttack(target,ppVar2);
  }
  else  {
    clear_substruct2_arrayB(gCombatP->substruct2);
    uVar5 = m8006edd0(target,ppVar2,ppVar3);
  }
  

  Actor::UnsetFlag(ppVar2,ACTOR_2);
  sVar6 = GoblinAmbushAttack(target,uVar5);
  TryCheatDeath(target,sVar6);
  this->unk22 = 1;
  if (this->AtkType != 3) target->damage = (u8)sVar6;
  set_camera_playerdata_focus(ppVar2,ppVar3);
  gGlobals.combatBytes[0] = 2;
  gGlobals.combatBytes[1] = 2;
  Combat_SetHideMarkers(1);
  return sVar6 != 0;
}

void CombatEntity::TroubadourEnd(){
  UnsetFlag(COMBATENT_BARD);
  gCombatP->Troubador = 0;
  if (gGlobals.playerDataArray[this->index])
    {FreeAttachmentFromPlayer(gGlobals.playerDataArray[this->index],2);}
}

void CombatEntity::UpdateMoveFlag(){
  u8 bVar2;
  
  bVar2 = HasPetrifyEffect();
  if ((((CharStats::getModded(this->charSheetP->Stats,STAT_INT) == 0) || (CharStats::getModded(this->charSheetP->Stats,STAT_WIL) == 0)) ||
      (CharStats::getModded(this->charSheetP->Stats,STAT_DEX) == 0)) ||
     ((CharStats::getModded(this->charSheetP->Stats,STAT_STR) == 0 || (bVar2)))) {
    UnsetFlag(COMBATENT_CANMOVE);
  }
  else {SetFlag(COMBATENT_CANMOVE);}
}

void CombatEntity::TroubadourUpChance(u8 param_2){
  if (RollD(1,100) <= (param_2 / 10)) {this->charSheetP->Skills->AddToBaseSkill(SKILL_Troubador,1);}}

void CombatEntity::m8006f448(){
  playerData *ppVar1;
  vec3f afStack80;
  
  ppVar1 = gGlobals.playerDataArray[this->index];
  if (ppVar1) {
    setVec3(&afStack80,this->coord.x,(ppVar1->collision).pos.y,this->coord.y);
    Actor::MoveNearShadow(ppVar1,&afStack80,(float)this->moveRange);
  }
}

void CombatEntity::Troubadour(){
  playerData *ppVar2;
  s32 iVar3;
  char cVar5;
  u8 bVar6;
  u32 uVar8;
  u32 uVar9;
  if (gCombatP->TroubadorLV) {
    CSprintf(TroubFail,this->charSheetP->name);
    for(uVar8=0;uVar8<MAXPARTY;uVar8++) {
      CombatEntity *pCVar1 = (&gCombatP->combatEnts)[uVar8];
      if((pCVar1)&&(pCVar1->Flag2())){
          CSprintf(TroubAlready,pCVar1->charSheetP->name);
          break;
      }
    }
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    print_combat_textbox(gCombatP,gGlobals.text,0);
    gGlobals.combatBytes[0] = 1;
  }
  else {
    if (CharStats::getModded(this->charSheetP->Stats,STAT_STAM) == 0) {
      CSprintf(TroubTired,this->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      gGlobals.combatBytes[0] = 1;
    }
    else {
      iVar3 = this->charSheetP->Skills->getModdedSkill(SKILL_Troubador) * 5 + CharStats::getModded(this->charSheetP->Stats,STAT_INT)) * 0x20000 >> 0x10;
      uVar8 = RollD(1,100);
      bVar6 = this->charSheetP->Skills->getModdedSkill(SKILL_Troubador);
      if (bVar6 < 6) uVar9 = SQ(8 - bVar6);
      else uVar9 = 8;
      ppVar2 = gGlobals.playerDataArray[this->index];
      if (iVar3 < uVar8) { //(troub*5+INT*2)<rand(1,100)
        CSprintf(TroubFail,this->charSheetP->name);
        copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
        print_combat_textbox(gCombatP,gGlobals.text,0);
        TroubadourUpChance((u8)(uVar9 >> 1));
      }
      else {
        s16 sVar7 = (iVar3 - uVar8);
        //(troub*5+INT*2)-rand(1,100)
        if (some_skillcheck_calc(sVar7) < 2) bVar6 = 1;
        else bVar6 = (u8)some_skillcheck_calc(sVar7);
        SetFlag(COMBATENT_BARD);
        UnsetFlag(COMBATENT_MEDIC);
        UnsetFlag(COMBATENT_HERBS);
        gCombatP->TroubadorLV = bVar6;
        Entity::DecreaseHP(this->charSheetP,3);
        CSprintf(TroubStart,this->charSheetP->name);
        copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
        print_combat_textbox(gCombatP,gGlobals.text,0);
        CombatEntity::TroubadourUpChance((u8)uVar9);
        AttachItemToPlayer(ppVar2,2,0x1abb);
      }
      ppVar2->ani_type = 5;
      combat_byte_0x1a(ppVar2);
    }
  }
}



void CombatEntity::m8006f7f8(u16 param_2){
  if (!Flag89()) {
    SetFlag(param_2);
    TroubadourStop;
    FUN_80072454(gCombatP->substruct2,this);
  }
  else {
    if ((this->flags & param_2) == 0) {
      UnsetFlag(COMBATENT_MEDIC);
      UnsetFlag(COMBATENT_HERBS);
      SetFlag(param_2);
    }
  }
}

void CombatEntity::m8006f8a0(){m8006f7f8(COMBATENT_MEDIC);}
void CombatEntity::m8006f8bc(){m8006f7f8(COMBATENT_HERBS);}


void CombatEntity::m8006f8d8(ItemID param_2,u8 param_3){
  u8 bVar1;
  u8 PVar2;
  u8 bVar3;
  
  this->itemIndex = param_3;
  this->item = GetIDIndex(param_2);
  bVar1 = this->AtkType;
  if (bVar1 != 3) {
    this->AtkType = 3;
    TroubadourStop;
    UnsetFlag(COMBATENT_MEDIC);
    UnsetFlag(COMBATENT_HERBS);
    ShowWeaponSheild();
    this->AtkTypeOther = bVar1;
  }
}


void CombatEntity::ShowWeaponFlask(){
  if (!Flag89()){
    UnsetFlag(COMBATENT_MEDIC);
    UnsetFlag(COMBATENT_HERBS);
  }
  else {
    if (this->AtkType == 3) {
      if (this->item < POTION_HEALING) {
        if (PARTY->Inventory->HasItem((ItemID)(this->item | 0x1000))) {
          this->AtkType = 0;
          ShowWeaponSheild();
        }
      }
      else {
        this->AtkType = this->AtkTypeOther;
        ShowWeaponSheild();
      }
    }
  }
}

u32 CombatEntity::GetShieldModel(){
  ArmorInstance *ptVar1;
  u32 uVar3;
  u32 uVar4;
  
  uVar4 = 0xffffffff;
  if (!cannotSheild(this->charSheetP->ID)) {
    ptVar1 = this->charSheetP->armor[1];
    if (ptVar1 == NULL) {uVar4 = 0xffffffff;}
    else {
      uVar3 = get_sheild_borg5(ptVar1->id);
      uVar4 = 0xffffffff;
      if (uVar3 != 0x38f9) {uVar4 = uVar3;}
    }
  }
  return uVar4;
}

u16 CombatEntity::GetWeaponModel(){
  u16 uVar2;
  u16 uVar3;
  
  WeaponInstance *wep = this->charSheetP->weapons;
  if(wep) {
    uVar2 = Weapon_borg5_lookup(GetIDIndex(wep->base.id));
    uVar3 = -1;
    if (uVar2 != -1) uVar3 = uVar2;
  }
  else return -1;
  return uVar3;
}

u8 missle_ids[]={53,55,56,54,58,56,57,60,255};

u8 CombatEntity::BowEquipped(){
  WeaponInstance *pTVar2;
  u8 bVar3;
  u8 *pbVar4;

  pTVar2 = this->charSheetP->weapons;
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

void CombatEntity::AttachWeaponShieldModel(u16 param_2,s32 param_3,s32 borg5){
  
  if (borg5 != -1) {
    playerData *ppVar1 = gGlobals.playerDataArray[this->index];
    if (ppVar1->locator_pointer) {
      Scene::HasLocator(ppVar1->locator_pointer->sceneDat,param_3);
    }
    AttachItemToPlayer(ppVar1,param_2,borg5);
    ChangeAttachmentNode(ppVar1,param_2,param_3,NULL,0);
  }
}

u8 throwing_ids[]={0x63,0x62,0x61,0x65,0x66,0x60,0x5e,0x5f,0xFF};

void CombatEntity::ThrowingEquipped(){
  u8 bVar1;
  u8 bVar3;
  u8 *pbVar4;
  
  this->throwingFlag = 0;
  if (this->AtkType == 3) {if (this->item < POTION_HEALING) {this->throwingFlag = 1;}}
  else {
    if (this->charSheetP->weapons) {
      if (!BowEquipped()) {
        bVar3 = GetIDIndex(this->charSheetP->weapons->id);
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
        this->throwingFlag = 1;
      }
    }
  }
  return;
}

void CombatEntity::ShowWeaponSheild(){
  playerData *ppVar1;
  u32 borg5;
  u32 borg5_00;
  
  ppVar1 = gGlobals.playerDataArray[this->index];
  borg5_00 = -1;
  FreeAttachmentFromPlayer(ppVar1,1);
  FreeAttachmentFromPlayer(ppVar1,0);
  this->wepLocator = 0;
  this->shieldLocator = 2;
  borg5 = CombatEntity::GetShieldModel();
  if (this->AtkType != 0) {
    if (this->AtkType == 3) borg5_00 = 0x34c5;
    else {
      if (this->charSheetP->weapons) {
        borg5_00 = 0x348f;
        if (!BowEquipped()) {borg5_00 = GetWeaponModel();}
        else {
          this->shieldLocator = this->notboss != 0;
          this->wepLocator = this->notboss == 0;
          borg5 = CombatEntity::GetWeaponModel();
        }
      }
    }
  }
  CombatEntity::ThrowingEquipped();
  CombatEntity::AttachWeaponShieldModel(1,(u32)this->shieldLocator,borg5);
  if (!CannotShowWeapon(this->charSheetP->ID)) {CombatEntity::AttachWeaponShieldModel(0,(u32)this->wepLocator,borg5_00);}
  return;
}

u8 cannotSheild(ItemID x){return gEntityDB->entities[GetIDIndex(x)].sheildStat == -1;}

u8 CannotShowWeapon(ItemID x){
  u8 bVar2;
  u8 *pbVar1;
  u32 uVar3;
  /* ehud gorgon chaos.Lt. harpy marquis minotuar mino.lord neilsin */
  u8 auStack72 []={0xAD,0x75,0xA6,0x76,0xAA,0x80,0xA5,0xA2,0xff};
  bVar2 = GetIDIndex(x);
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

SceneData * CombatEntity::GetWeaponScene(){
  WeaponInstance *pTVar1;
  u8 bVar5;
  u8 bVar6;
  u16 uVar4;
  u32 uVar2;
  SceneData *pAVar3;
  s16 lVar7;
  u32 uVar8;
  
  if (CannotShowWeapon(this->charSheetP->ID)) return NULL;
  if (this->AtkType == 3) {
    lVar7 = 0x34c5;
LAB_8006ff78:
    pAVar3 = BorgAnimLoadScene(lVar7);
  }
  else {
    pTVar1 = this->charSheetP->weapons;
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

void CombatEntity::GetWeaponRanges(float *param_2,float *param_3,float *param_4){
  u8 bVar7;
  float fVar8;
  
  bVar7 = this->AtkType;
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
  switch(GetIDIndex(this->charSheetP->weapons->base.id)) {
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
  case 0x3c: //short Bow
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

void CombatEntity::ClearSpellEffects(){
  if (this->charSheetP->effects) {
    for(u8 i=0;i<MAGIC_FXMAX;i++){
      Entity::ClearSpellEffect(this->charSheetP,i,this);
    }
  }
}

void CombatEntity::m80070234(){
  playerData *ppVar1 = gGlobals.playerDataArray[this->index];
  if (ppVar1) {
    FUN_800714d0(&gCombatP->substruct,GetCoordXU8(),GetCoordYU8(),this->unk0x23);
    this->coord = {(ppVar1->collision).pos.x,(ppVar1->collision).pos.z};
    FUN_800713fc(&gCombatP->substruct,GetCoordXU8(),GetCoordYU8(),(u32)this->unk0x23);
  }
}

void CombatEntity::CheckTargetIndex(){
  CombatEntity *pCVar2;
  
  s32 uVar1 = this->TargetIndex;
  if (-1 < uVar1) {
    pCVar2 = (&gCombatP->combatEnts)[uVar1];
    this->TargetIndex = -1;
    if ((pCVar2) && (!Entity::isDead(pCVar2->charSheetP))) this->TargetIndex = uVar1;
  }
}

void CombatEntity::PrintDamage(s16 param_2){
  if (param_2 < 2) CSprintf(XLoses1HP,this->charSheetP->name);
  else CSprintf(XLosesYHP,this->charSheetP->name,param_2);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void CombatEntity::PrintHealing(s16 param_2){
  if (param_2 < 2) {CSprintf(XHeals1HP,this->charSheetP->name);}
  else {CSprintf(XHealsYHP,this->charSheetP->name,param_2);}
  print_combat_textbox(gCombatP,gGlobals.text,0);
  return;
}

void CombatEntity::SetAktRangeMulti(u8 param_2){
  WeaponInstance *pTVar1;
  u8 bVar3;
  
  this->AtkType = 0;
  pTVar1 = this->charSheetP->weapons;
  if (pTVar1) {
    bVar3 = 1;
    if (pTVar1->range != 0) {
      bVar3 = 2;
      if (isBreathSpitOrSpikes(pTVar1)) {bVar3 = 4;}
    }
    this->AtkType = bVar3;
  }
  if (param_2) FUN_80072454(gCombatP->substruct2,this);
  ShowWeaponSheild();
}

void CombatEntity::PrintEvade(CombatEntity *param_2){
  CSprintf(XAttacksY,this->charSheetP->name,param_2->charSheetP->name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  CSprintf(XAvoids,param_2->charSheetP->name);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void CombatEntity::PrintSwingAndMiss(CombatEntity *param_2){
  CharSheet *pCVar1 = param_2->charSheetP;
  CSprintf(XAttacksY,this->charSheetP->name,pCVar1->name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  CSprintf(XMissesY,this->charSheetP->name,pCVar1->name);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void noop_80070658(CombatEntity * x){}
s16 retMinus1(u16 x,u16 y){return -1;}
s16 passto_retMinus1(void){return retMinus1(1,-1);}