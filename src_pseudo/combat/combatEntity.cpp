#define FILENAME "../combatengine/combatEntity.cpp"


#include "combat/CombatStruct.h"
#include "combat/CombatCamera.h"
#include "combat/turn.h"
#include "combat/Visuals.h"
#include "globals.h"
#include "armordb.h"
#include "weapondb.h"

void Ofunc_NOOP_80067c70(void){}
void Ofunc_NOOP_(void){}

void CombatEntity::Init(CharSheet *charsheet,int param_3,u8 startx,
                       u8 starty,s8 param_6,u8 param_7,int isAI,u8 index){
  ItemID IVar1;
  SpellBook *pSVar2;
  SpellInstance *pSVar3;
  EntityRAM *pEVar4;
  u8 bVar8;
  u8 bVar9;
  u8 X;
  u8 Y;
  u8 *pEVar5;
  CombatAIInfo *pCVar6;
  int iVar7;
  float *pfVar10;
  u32 uVar11;
  u32 uVar12;
  ElemResist *prVar13;
  float *pfVar14;
  float fVar15;
  
  CLEAR(this);
  this->charSheetP = charsheet;
  bVar8 = GETINDEX(charsheet->ID);
  (this->coord2).x = startx;
  (this->coord).x = startx;
  (this->coord2).y = starty;
  (this->coord).y = starty;
  this->facingInd = param_6;
  this->unk23 = param_7;
  SetCardinalFacing(param_6);
  this->bowHand = gEntityDB->IsRightHanded(charsheet->ID);
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
    ALLOC(this->aiP,204);
    CombatAI::Init(this->aiP,this->charSheetP->ID,this);
  }
  this->shieldLocator = 2;
  this->TargetIndex = -1;
  if ((IDEntInd(Shadow) == this->charSheetP->ID) &&(HasHornOfKynon())) {
    iVar7 = CharStats::getBase(this->charSheetP->Stats,STAT_DEX);
    if (0 < 30 - iVar7) {
      CharStats::AddBase(this->charSheetP->Stats,STAT_DEX,30 - iVar7);
    }
  }
}

void CombatEntity::FreeAi(){
  if (this->aiP) {
    CombatAI::Free(this->aiP);
    FREE(this->aiP,240);
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


//Casting Magic
u8 CombatEntity::Flag0(){return (bool)((u8)this->flags & 1);}

u8 CombatEntity::Flag1(){return this->flags >> 1 & 1;}
//playing Troubadour
u8 CombatEntity::Flag2(){return this->flags >> 2 & 1;}
u8 CombatEntity::Flag3(){return this->flags >> 3 & 1;}
//Friend or foe
u8 CombatEntity::Flag4(){return this->flags >> 4 & 1;}
u8 CombatEntity::Flag5(){return this->flags >> 5 & 1;}
//Fled the field
u8 CombatEntity::Flag6(){return this->flags >> 6 & 1;}
u8 CombatEntity::Flag7(){return this->flags >> 7 & 1;}
//using one of 2 medic skills
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

u8 CombatEntity::NotNearEnemy(){
  for(u32 i=0;i<gCombatP->EntCount;i++) {
    CombatEntity *CEnt = (&gCombatP->combatEnts)[i];
    if ((((CEnt) && (this != CEnt)) &&
       (!Entity::isDead(CEnt->charSheetP))) && (CEnt->Flag1())) {
       if ((CEnt->Flag4() != this->Flag4())&& (CEnt->IsInMeleeRange(CEnt))) return false;
      }
    }
  return true;
}
//increments in Dexterity 
u8 DEX_steps[16]{0,0,0,3,7,12,16,21,26,28,30,33,36,38,0,0};

void CombatEntity::SetMovementRange(){

  NOOP_80068350();
  this->moveRange = 0;
  while (this->moveRange < 14) {
    if (CharStats::getModded(this->charSheetP->Stats,STAT_DEX) <= DEX_steps[this->moveRange]) break;
    this->moveRange++;
  }
  for(u8 i=0;i<MAGIC_FXMAX;i++) {
    Temp_enchant *pTVar1 = this->charSheetP->effects[i];
    if (pTVar1) {
      if (pTVar1->index == SpellInd_StellarGravity) {
        u8 bVar4 = this->moveRange - pTVar1->lv;
        if (pTVar1->lv < this->moveRange)
          this->moveRange = bVar4;
        else this->moveRange = 1;
      }
      else {
        if (pTVar1->index == SpellInd_Haste) {
          this->moveRange += pTVar1->lv;
        }
      }
    }
  }
  UnsetFlag(COMBATENT_FLAG7);
  if (!NotNearEnemy()) {
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
  if (this->charSheetP->ID == IDEntInd(Pochanargat)) this->moveRange = 0;
}

u8 CombatEntity::DEXCheck(){
  s32 iVar1 = gCombatP->turn.unk4;
  NOOP_80068350();
  s8 dex = CharStats::getBase(this->charSheetP->Stats,STAT_DEX);
  u8 ret = 0;
  if ((0 < dex) && (ret = 1, 18 < dex)) {
    if (dex < 25) {
      ret = 1;
      if (iVar1) ret = 2;
    }
    else {
      ret = 2;
      if (((30 < dex) && (ret = 3, dex < 35)) && (ret = 2, iVar1 != 0)) {
        ret = 3;
      }
    }
  }
  return ret;
}

u8 CombatEntity::GetProtection(){
  u8 bVar5;
  u32 uVar4;
  u32 uVar6;
  
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
  //is this a macro? Calculated twice.
  if ((((this->charSheetP->EXP->protection + uVar6) - acid) + warrior_dividing(chara->Skills->getModdedSkill(SKILL_Warrior),5,false,0,0) + def) < 1)
  return 0;
  else 
    return (((this->charSheetP->EXP->protection + uVar6) - acid) + warrior_dividing(chara->Skills->getModdedSkill(SKILL_Warrior),5,false,0,0) + def);
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
  playerData *pDat = gGlobals.combatActors[this->index];
  if (pDat) {
    vec2f pos,face;
    Vec2Set(&pos,this->coord.x,this->coord.y);
    UpdatePosition();
    gCombatP->SpellMarkerPos.x = this->coord.x;
    gCombatP->SpellMarkerPos.y = this->coord.y;
    Vec2Copy(&this->facing,&face);
    this->facing.x = -pDat->facing.x;
    this->facing.y = -pDat->facing.y;
    if ((((pos.x != this->coord.x) || (pos.y != this->coord.y)) || (face.x != -pDat->facing.x)) || (face.y != -pDat->facing.y)) {
      if (this->numMoves < 3) this->numMoves++;
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

  Vec2Set(&this->facing,(float)uStack72[param_2][0],(float)uStack72[param_2][1]);
  Vec2Normalize(&this->facing);
}

u8 CombatEntity::AdjustFacing(u8 X,u8 Y){
  float fx = this->facing.x;
  float fy = this->facing.y;
  this->facing.x = (float)X - this->coord.x;
  this->facing.y = (float)Y - this->coord.y;
  Vec2Normalize(&this->facing);
  fx = this->facing.x - fx;
  if (fx <= 0.0) fx = -fx;
  if ((double)fx <= 1.0E-4) {
    fy = this->facing.y - fy;
    if (fy <= 0.0) fy = -fy;
    if ((double)fy <= 1.0E-4) {return false;}
  }
  return true;
}

u8 CombatEntity::CheckFacings(float x,float y){
  u8 bVar1;
  float fVar2;
  float fVar3;
  vec2f afStack160;
  vec2f afStack96;
  
  Vec2Set(&afStack160,this->coord.x,this->coord.y);
  Vec2Set(&afStack96,x,y);
  fVar2 = Vec2Dist(&afStack160,&afStack96);
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
  //dot product * 1000000?
  fVar4 = (this->facing.x * param_2->facing.x +
            this->facing.y * param_2->facing.y) * 1000000.0f;
  dVar3 = (double)fVar4;
  if (0.0 < fVar4) {iVar2 = (s32)(dVar3 + 0.5);}
  else {iVar2 = -(s32)(0.5 - dVar3);}
  bVar1 = true;
  if ((float)iVar2 / 1000000.0f < 0.707107/*Cos(PI/4)*/) bVar1 = false;
  return bVar1;
}


void CombatEntity::m80068dd8(){
  playerData *ppVar1 = gGlobals.combatActors[this->index];
  if (ppVar1) {
    Actor::SetAiDest(ppVar1,this->coord.x + ppVar1->scaleRad,
      this->coord.y + ppVar1->scaleRad,ppVar1->scaleRad,0);
  }
}

void CombatEntity::m80068e38(){
  if (gGlobals.combatActors[this->index]) {
    if ((this->facing.x != 0.0) || (this->facing.y != 0.0)) {
      Actor::SetFacing(gGlobals.combatActors[this->index],-this->facing.x,-this->facing.y);
    }
    gGlobals.combatBytes[1] = gGlobals.combatBytes[0];
    gGlobals.combatBytes[0] = CombatState_6;
  }
  return;
}

void CombatEntity::FaceTarget(CombatEntity *param_2){
  playerData *ppVar1;
  playerData *ppVar2;
  float fVar3;
  
  gGlobals.combatBytes[0] = CombatState_6;
  gGlobals.combatBytes[1] = CombatState_6;
  if (param_2 != this) {
    ppVar1 = gGlobals.combatActors[this->index];
    ppVar2 = gGlobals.combatActors[param_2->index];
    if ((ppVar1) && (ppVar2)) {
      this->facing.x = (ppVar2->collision).pos.x- (ppVar1->collision).pos.x;
      this->facing.y = (ppVar2->collision).pos.z - (ppVar1->collision).pos.z;
      Vec2Normalize(&this->facing);
      fVar3 = this->facing.y;
      if ((!this->facing.x)&&(!this->facing.y)) return;
      Actor::SetFacing(ppVar1,-this->facing.x,-this->facing.y);
    }
  }
}

void CombatEntity::TeleportMovePlayer(){
  playerData *pDat = gGlobals.combatActors[this->index];
  if (pDat) {
    (pDat->collision).pos.x = this->coord.x + pDat->scaleRad;
    (pDat->collision).pos.z = this->coord.y + pDat->scaleRad;
    Actor::CheckCollision(pDat,0,0,0);
  }
}

void CombatEntity::SetPlayerRotate(){
  playerData *ppVar1;
  
  if (((this->facing.x != 0.0) || (this->facing.y != 0.0)) &&
     (ppVar1 = gGlobals.combatActors[this->index], ppVar1)) {
    ppVar1->facing.x = -this->facing.x;
    ppVar1->facing.y = -this->facing.y;
    Vec2Normalize(&ppVar1->facing);
  }
}

u8 CombatEntity::GetWeaponAnimation(u8 param_2){
  u8 table []={0,AniType_Atk0,1,AniType_Atk1,2,AniType_Atk2,
               3,AniType_Atk3,4,AniType_Atk4,5,AniType_Atk5,
               0xff,0xff};
  
  for(u32 i=0;table[i]!=0xff;i+=2){
    if(table[i]==param_2)return table[i+1];
  }
  return AniType_Atk6;
}

u32 CombatEntity::m80069114(){
  WeaponInstance *pTVar1;
  u32 uVar2;
  
  if (this->AtkType == ATKT_Potion) return 400;
  else {
    uVar2 = 0;
    if (this->AtkType != ATKT_1) {
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
  switch(cEnt->facingInd) {
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

u8 CombatEntity::IsInMeleeRange(CombatEntity *target){
  playerData *ppVar1;
  playerData *ppVar2;
  u8 bVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  
  ppVar1 = gGlobals.combatActors[this->index];
  bVar3 = false;
  if (ppVar1) {
    ppVar2 = gGlobals.combatActors[target->index];
    bVar3 = false;
    if (ppVar2) {
      fVar4 = m80069554(target);
      fVar5 = ppVar1->scaleRad;
      if (fVar5 <= ppVar1->combatRadius) fVar5 = ppVar1->combatRadius;
      fVar6 = ppVar2->scaleRad;
      if (fVar6 <= ppVar2->combatRadius) fVar6 = ppVar2->combatRadius;
      bVar3 = true;
      if (fVar5 + fVar6 + 0.75f < fVar4) {bVar3 = false;}
    }
  }
  return bVar3;
}

u8 CombatEntity::IsTargetInRange(CombatEntity *target,s8 x,s8 y,s32 faceMe){
  if ((faceMe) &&(!CheckFacings((float)x,(float)y))) return false;
  if (this->AtkType == ATKT_Potion) return true;
  if (!Flag89()) {
    if ((this->AtkType == ATKT_1)&&(this->charSheetP->weapons)) return this->IsInMeleeRange(target);
    else {
      if ((this->AtkType != ATKT_2)&&(this->AtkType != ATKT_4)) return false;
      if (this->charSheetP->weapons) {
        s32 prox = this->Get2DProximity(target);
        if (this->AtkType != ATKT_2) return prox <= this->charSheetP->weapons->range;
        if (!NotNearEnemy()) return false;
        if (2 < prox) return prox <= this->charSheetP->weapons->range;
        return false;
      }
    }
    this->AtkType = ATKT_0;
    return false;
  }
}

float CombatEntity::Get2DProximity(CombatEntity *other){
  vec2f tempA,tempB;
  Vec2Set(&tempA,coord.x,coord.y);
  Vec2Set(&tempB,(other->coord).x,(other->coord).y);
  return Vec2Dist(&tempA,&tempB);
}

float CombatEntity::m80069554(CombatEntity *param_2){
  param_2->UpdatePosition();
  this->UpdatePosition();
  return this->Get2DProximity(param_2);}


u8 CombatEntity::CanUsePotion(u8 param_2){return Entity::CanUsePotion(this->charSheetP,param_2,NULL);}

u8 CombatEntity::CanUseFlask(CombatEntity *param_2){
  u8 ret;

  if (this->AtkType == ATKT_Potion) {
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
  if ((this->AtkType == ATKT_Potion) || (Flag89())) {
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

u8 CombatEntity::CanBeTargeted(CombatEntity *target,s32 param_3){
  if (target->charSheetP->ID != IDEntInd(Shadow)) {
    if (!Flag89()) {
      if (gGlobals.combatBytes[0] == CombatState_25) return target == this;
      if (!m8006963c(target)) return false;
    }
    else {
      if (Entity::isDead(target->charSheetP)) return false;
      if (target->Flag6()) return false;
      if (target->Flag4() != this->Flag4()) return false;
      if (Entity::getHPCurrent(target->charSheetP) == Entity::getHPMax(target->charSheetP)) return false;
      if (!(this->flags & COMBATENT_MEDIC)) {if (target == this) {return true;}}
      else {if (target == this) return false;}
    }
    u8 targetPos[2]={0,0};
    target->GetCoordU8(targetPos,targetPos + 1);
    if (!IsTargetInRange(target,targetPos[0],targetPos[1],param_3)) {return false;}
    if (FUN_8007105c(&gCombatP->substruct,GetCoordXU8(),GetCoordYU8(),(u32)targetPos[0],targetPos[1])) {return true;}
    playerData *p1 = gGlobals.combatActors[this->index];
    playerData *p2 = gGlobals.combatActors[target->index];
    if ((p1) && (p2)) {
      vec3f posA,posB;
      Vec3Copy(&(p1->collision).pos,&posA);
      Vec3Copy(&(p2->collision).pos,&posB);
      posA.y += -p1->scaleRad + gEntityDB->GetHeight(this->charSheetP->ID);
      posA.y += -p2->scaleRad + gEntityDB->GetHeight(target->charSheetP->ID); //bug? should also be posB?
      return FUN_800716b4(&gCombatP->substruct,&posA,&posB,(u32)this->index,target->index);
    }
  }
  return false;
}

u32 CombatEntity::GetSpellTargetCount(){
  SpellInstance *sp = Entity::GetSpell(this->charSheetP);
  if (!sp) return 0;
  if (sp->cast == MCAST_ALL) return gCombatP->EntCount;
  if (sp->cast == MCAST_RANK) return Entity::CheckSpellWizard(this->charSheetP,sp) + 1 >> 1;
  return 1;
}

u8 CombatEntity::canControl(SpellInstance *param_2){
  u8 bVar2;
  u8 bVar3 = GETINDEX((param_2->base).id);
  ItemID x = this->charSheetP->ID;
  if (true) {
    switch(bVar3) {
    case SpellInd_ControlElem:
    case SpellInd_Banishing:
      if (!Entity::IsElemental(x)) return false;
      return true;
    default:
      goto LAB_80069b1c;
    case SpellInd_Charming:
      if (gEntityDB->entities[GETINDEX(x)].Category == ENTITY_CHAOS) return false;
      return true;
    case SpellInd_ControlMarquis:
      bVar2 = entityList[EntInd_Marquis];
      break;
    case SpellInd_ControlZombies:
      bVar2 = entityList[EntInd_PlagueZombie];
      if (x == IDEntInd(Zombie)) return true;
    }
    if (x != IDEnt(bVar2)) return false;
  }
LAB_80069b1c:
  return true;
}

u8 CombatEntity::SpellEffectsTarget(CombatEntity *param_2,SpellInstance *param_3){
  u8 bVar1;

  u8 bVar3;
  u8 MVar4;
  
  if (param_3 == NULL) return false;
  else {
    if (param_2->Flag6()) return false;
    if (Entity::isDead(param_2->charSheetP)) return false;
    if ((param_3->target == MTarget_Party)&&(param_2->Flag4() != Flag4())) return false;
    if ((param_3->target == MTarget_Enemy)&&(param_2->Flag4() == Flag4())) return false;
    bVar1 = false;
    if (!Entity::HasSpellEffect(param_2->charSheetP,GETINDEX(param_3->base.id))) {
      if (Entity::CheckSpellSpecial(param_2->charSheetP,param_3) == 0) bVar1 = param_2->canControl(param_3);
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
  
  if ((this->aiP == NULL) || (!(this->aiP->flags & AIFlag_08))) bVar4 = true;
  else {
    bVar4 = false;
    if (Entity::SpellStaminaSubtract(this->charSheetP,param_3,(u8)Entity::CheckSpellWizard(this->charSheetP,param_3)) <= CharStats::getModded(this->charSheetP->Stats,STAT_STAM)) {
      bVar4 = false;
      if (Entity::GetSpellCharges(this->charSheetP)) {
        if (Entity::CheckSpellSpecial(param_2->charSheetP,param_3) == 0) {bVar4 = (Entity::CheckSpellTimeOfDay(this->charSheetP,param_3) == 0);}
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
  
  ppVar1 = gGlobals.combatActors[param_2->index];
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
    if (param_3 + ppVar1->scaleRad < Vec2Dist(&afStack224,&fStack160)) bVar2 = false;
  }
  return bVar2;
}


u8 CombatEntity::AIShouldCastMagic(CombatEntity *param_2){
  u8 bVar1;
  playerData *ppVar2;
  SpellInstance *spell;
  bool bVar7;
  u8 bVar8;
  s32 lVar3;
  int iVar6;
  u8 uVar9;
  u8 uVar10;
  u8 uVar4;
  u8 uVar5;
  Borg9Data *borgDat;
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
  spell = Entity::GetSpell(this->charSheetP);
  if (SpellEffectsTarget(param_2,spell)) {
    bVar8 = GETINDEX((spell->base).id);
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
      iVar12 = iVar6 * (u32)bVar1;
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
      if (bVar8 != SpellInd_SenseAura) {
        if (!m80069d00(param_2,(float)iVar12,fVar11)) return false;
      }
      if (FUN_8007105c(&gCombatP->substruct,(u8)uVar4,(u8)uVar5,uStack_100[0],uStack_100[1])) return true;
      if ((uVar4 == uStack_100[0]) && (uVar5 == uStack_100[1])) return true;
      ppVar2 = gGlobals.combatActors[param_2->index];
      if (ppVar2) {
        fVar14 = (float)(int)uVar4;
        fVar11 = (float)(int)uVar5;
        borgDat = &(MAPCENTER.mapPointer)->dat;
        Vec3Set(&fStack248,fVar14,50.0,fVar11);
        Vec3Set(&afStack184,fVar14,-10.0,fVar11);
        if (CheckCollision(borgDat,&fStack248,&afStack184,0.5f,&fStack120,NULL,0)) {
          fStack120.y+=2;
        }
        else Vec3Set(&fStack120,fVar14,10.0,fVar11);
        Vec3Copy(&(ppVar2->collision).pos,&fStack248);
        fStack248.y = fStack248.y + -ppVar2->scaleRad + gEntityDB->GetHeight(param_2->charSheetP->ID);
        return FUN_800716b4(&gCombatP->substruct,&fStack120,&fStack248,param_2->index,param_2->index);
      }
    }
  }
  return false;
}

u8 CombatEntity::SpellEffectsPartyInArea(){
  SpellInstance *pSVar1 = Entity::GetSpell(this->charSheetP);
  u8 bVar2 = false;
  if (pSVar1) bVar2 = pSVar1->target == MTarget_Party;
  return bVar2;
}


u32 CombatEntity::m8006a1dc(){
  if (this->AtkType <= ATKT_4) {
    u32 arr [5];
    arr[1] = 0;
    arr[2] = 0;
    if (this->charSheetP->weapons) {
      arr[1] = isBreathSpitOrSpikes(this->charSheetP->weapons);
      arr[2] = (this->charSheetP->weapons->range != 0);
    }
    arr[4] = 0;
    arr[0] = 0;
    arr[3] = true;
    if (arr[1]) arr[4] = (arr[2] != 0);
    return arr[this->AtkType];
  }
  else return 0;
}

void CombatEntity::m8006a274(){
  TroubadourStop;
  UnsetFlag(COMBATENT_MEDIC);
  UnsetFlag(COMBATENT_HERBS);
  SetAktRangeMulti(true);
  this->numMoves = 1;
  if (CombatPauseState) gGlobals.combatBytes[1] = CombatState_19;
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
          this->facingInd = 0;
          return;
        }
      }
      else {
        sVar3 = 1;
        if ((-1 < iVar1) && (sVar3 = 3, iVar1 < 1)) {sVar3 = 2;}
      }
    }
    this->facingInd = sVar3;
  }
}


void CombatEntity::Ofunc_8006a450(s8 param_2){
  this->facingInd = param_2;
  SetCardinalFacing(param_2);
  FUN_80072454(gCombatP->substruct2,this);
  FUN_80072454(gCombatP->substruct2 + 1,this);
  m80068e38();
}

void CombatEntity::EndTurn(){

  clear_camera_playerdata_focus();
  CombatAIInfo* ai = this->aiP;
  if ((ai) && ((ai->flags & AIFlag_08))) CombatAI::ClearEntIndex(ai);
  this->charSheetP->spellVal = 0xff;
  UnsetFlag(COMBATENT_CASTING);
  CharSheet *chara_ = this->charSheetP;
  if (chara_->spellSwitch == 5) {
    GearInstance *gear = chara_->pItemList->pItem[chara_->currSpell];
    if (gear->base.spellCharge->Charges == 0){
      u16 type=ITEMIDTYPE(gear->base.id);
      if((type==DB_SCROLL)||(type==DB_WAND)){
        //dispose of drained acc.
        Entity::UnequipGear(chara_,chara_->currSpell);
        this->charSheetP->spellSwitch = 0;
      }
    }
  }
  gGlobals.combatBytes[0] = CombatState_1;
  Combat_SetHideMarkers(0);
  if ((!Entity::isDead(this->charSheetP)) && (!Flag6())) {gGlobals.combatActors[this->index]->ani_type = 0;}
  ShowWeaponFlask();
  if (((this->AtkType == ATKT_Potion) && (this->item < POTION_HEALING)) &&
     (this->charSheetP->weapons)) PARTY->RemoveWeaponsFrom(this->index);
     CheckTargetIndex();
  CombatTurn::FUN_80073e3c(&gCombatP->turn);
}


void CombatEntity::Escaped(){
  if (!Flag6()) {
    unk800714d0(this);
    SetFlag(COMBATENT_FLED);
    gCombatP->EntsAlive--;
    if (Flag4()) gCombatP->EnemiesAlive--;
    else gCombatP->partyAlive--;
    ClearSpellEffects();
    Entity::ClearAllPotionEffects(this->charSheetP);
    FUN_80096048(gGlobals.combatActors[this->index]);
    FUN_80094228(gGlobals.combatActors[this->index]);
    Actor::DeathFlag(gGlobals.combatActors[this->index]);
    gGlobals.combatActors[this->index] = NULL;
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


u8 CombatEntity::m8006a830(CombatEntity *target,u8 x,u8 y){
  u8 myX;
  u8 myY;
  s8 sVar4;
  u8 uVar5;
  s8 sVar6;
  u8 Y_;
  u8 X_;
  char cVar3;
  
  X_ = x;
  Y_ = y;
  myX = GetCoordXU8();
  myY = GetCoordYU8();
  switch(target->facingInd) {
  case 0:
    if (((myX < X_) && (Y_ < myY)) && (this->facingInd == 1)) {return 1;}
    if (((myX != X_) || (myY <= Y_)) || (this->facingInd != 0)) {
      if (myX <= X_) {return 0;}
      sVar4 = 7;
      if (myY <= Y_) {return 0;}
      sVar6 = this->facingInd;
      goto LAB_8006ab00;
    }
    goto LAB_8006ab08;
  case 1:
    if (myX < X_) {
      if ((myY == Y_) && (this->facingInd == 2)) goto LAB_8006ab08;
      if ((Y_ < myY) && (this->facingInd == 1)) {return 1;}
    }
    uVar5 = 0;
    if (((myX == X_) && (uVar5 = 0, Y_ < myY)) && (uVar5 = 0, this->facingInd == 0)) {uVar5 = 1;}
    break;
  case 2:
    uVar5 = 0;
    if (myX < X_) {
      if ((myY < Y_) && (this->facingInd == 3)) {uVar5 = 1;}
      else {
        if ((myY == Y_) && (this->facingInd == 2)) {uVar5 = 1;}
        else {
          uVar5 = 0;
          if ((Y_ < myY) && (uVar5 = 0, this->facingInd == 1)) {uVar5 = 1;}
        }
      }
    }
    break;
  case 3:
    if (((myX < X_) && (myY < Y_)) && (this->facingInd == 3)) {return 1;}
    if (((myX == X_) && (myY < Y_)) && (this->facingInd == 4)) {return 1;}
    if (myX >= X_) {return 0;}
    if (myY != Y_) {return 0;}
    sVar4 = this->facingInd;
    sVar6 = 2;
    goto LAB_8006ab6c;
  case 4:
    if (((myX < X_) && (myY < Y_)) && (this->facingInd == 3)) {return 1;}
    if (((myX == X_) && (myY < Y_)) && (this->facingInd == 4)) {return 1;}
    if (myX <= X_) {return 0;}
    goto LAB_8006aaf4;
  case 5:
    if (X_ < myX) {
      if ((myY == Y_) && (this->facingInd == 6)) goto LAB_8006ab08;
      if ((myY < Y_) && (this->facingInd == 5)) {
        return 1;
      }
    }
    if (myX != X_) {return 0;}
    sVar4 = 4;
    if (Y_ <= myY) {return 0;}
    sVar6 = this->facingInd;
    goto LAB_8006ab00;
  case 6:
    if (myX <= X_) {return 0;}
    if ((Y_ < myY) && (this->facingInd == 7)) {return 1;}
    if ((myY == Y_) && (this->facingInd == 6)) goto LAB_8006ab08;
LAB_8006aaf4:
    uVar5 = 0;
    sVar4 = 5;
    if (myY < Y_) {
      sVar6 = this->facingInd;
LAB_8006ab00:
      uVar5 = 0;
      if (sVar6 == sVar4) {
LAB_8006ab08:
        uVar5 = 1;
      }
    }
    break;
  case 7:
    if (((X_ < myX) && (Y_ < myY)) && (this->facingInd == 7)) {return 1;}
    if (((myX == X_) && (Y_ < myY)) && (this->facingInd == 0)) {return 1;}
    if (X_ >= myX) {return 0;}
    if (myY != Y_) {return 0;}
    sVar4 = this->facingInd;
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
      uVar9*= this->resists[uVar7].percent;
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
        uVar9*= ptVar6->resist->percent;
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
  
  spellID = GETINDEX(spel_->base.id);
  switch(Elem) {
  default:
    bVar1 = false;
    break;
  case ELEMENT_EARTH:
    bVar1 = spellID == SpellInd_EarthSmite;
    break;
  case ELEMENT_SOLAR:
    bVar1 = (bool)(spel_->aspect_flag >> 1 & 1);
    break;
  case ELEMENT_NECROMANCY:
    bVar1 = spel_->school == SCHOOL_Necromancy;
    break;
  case ELEMENT_FIRE:
    if (spellID != SpellInd_DragonFlames) {
      SVar2 = SpellInd_Fireball;
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
    if (spellID != SpellInd_Lightning) {
      SVar2 = SpellInd_FrozenDoom;
      goto CheckOtherSpell;
    }
ReturnTrue:
    bVar1 = true;
    break;
  case ELEMENT_MAGIC:
    bVar1 = true;
    break;
  case ELEMENT_AIR:
    bVar1 = spellID == SpellInd_Wind;
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

u16 CombatEntity::CheckVSMagic(SpellInstance *casted){
  u8 (*spellNSchoolP) [2];
  
  u8 spellNSchool [5] [2]={
    {SpellInd_VsElemental,SCHOOL_Elemental},{SpellInd_VsNaming,SCHOOL_Naming},
    {SpellInd_VsNecromancy,SCHOOL_Necromancy},{SpellInd_VsStar,SCHOOL_Star},
    {0xff,0xff}};
  for(u32 i=0;i<MAGIC_FXMAX;i++) {
    Temp_enchant *effect = charSheetP->effects[i];
    if ((effect) && (spellNSchool[0][0] != SpellInd_NONE)) {
      spellNSchoolP = spellNSchool;
      do {
        if (((*spellNSchoolP)[0] == effect->index) &&
           ((*spellNSchoolP)[1] == casted->school)) {
          return effect->lv * 6 & 0xfe;
        }
        spellNSchoolP++;
      } while ((*spellNSchoolP)[0] != SpellInd_NONE);
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
  u8 *pbVar1;
  CharSheet *pCVar2;
  CombatEntity *pCVar3;
  bool bVar7;
  u32 uVar8;
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
  if (IDEntInd(Sholeh) == this->charSheetP->ID) setEventFlag(FLAG_PartySholehDeath,true);
  if (Flag5()) {
    gCombatP->EnemiesAlive--;
    if (gCombatP->firstKill == 0) {
      gCombatP->firstKill = 1;
      for(i=0;i < gCombatP->EntCount;i++) {
        pCVar3 = (&gCombatP->combatEnts)[i];
        if ((pCVar3) && (pCVar3 == this)) {
         if (pCVar3->Flag4()&&(pCVar3->aiP)) pCVar3->aiP->flags|= AIFlag_02;
         }
        }
    }
  }
  else {
    gCombatP->partyAlive--;
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
  iVar7 = FUN_80070cc4(&gCombatP->substruct,x,y,GetCoordXU8(),GetCoordYU8());
  iVar7 *= 0.05f * (float)iVar6 + (float)iVar6;
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
    rand = (s16)((rand - ((u8)RollD(1,100))));
  }
  return rand;
}

//a VERY small chance to level up weapon skill from practice.
//(((8-curr skill level)^2)/10)% chance. "capped" at level 4.
void CombatEntity::WeaponSkillUpChance(u8 chance,u8 weapon){
  if ((u8)(chance * 0.1f)>=RollD(1,100)) this->charSheetP->Skills->AddToBaseWeapon(weapon,1);
}

s16 CombatEntity::CalcAttackResist(CombatEntity *param_2,s16 param_3,u8 param_4){
  CombatAIInfo* pcVar1;
  float afStack32;
  
  afStack32 = 0.0;
  if (param_2->CalcGearResist(param_4,&afStack32)) {
    param_3 *= afStack32;
    if ((afStack32 != 0.0) && (param_3 < 1)) param_3 = 1;
    if (((1.0f < afStack32) &&
        (pcVar1 = param_2->aiP, pcVar1)) &&
       ((pcVar1->flags & AIFlag_08))) pcVar1->flags |= (AIFlag_10|AIFlag_02);
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
      TempSpell::Init(&TStack80,IDSpell(SpellList[pTVar2->index]),pTVar2->lv);
      if (CombatEntity::SpellEffectsTarget(param_2,&TStack80)) {
        ret = MagicDamageResistCalc(param_2,&TStack80,true);
        if (ret == -3) ret = 0;
        if (ret == -1) ret = 0;
        if (ret == -2) ret = 0;
      }
      TStack80.base.RemoveStatSpell();
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
  s16 sVar3;
  u16 rand;
  s16 sVar4;
  u8 bVar5;
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
    if (bVar5 < 6) uVar6 = SQ((8 - (u32)bVar5));
    else uVar6 = 5;
    if (sVar4 < sVar3) {
      sVar3 = CombatEntity::STRTheifCheck(sVar3,(int)sVar4,target,1,(int)backstab);
      WeaponSkillUpChance(uVar6,pWVar1->weaponType);
      if (rand == sVar4)
        CSprintf(XAttacksY,this->charSheetP->name,target->charSheetP->name);
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
  iVar6 = SkillCheck(((s32)param_2 - (s32)(s16)param_3));
  iVar6 = (DMG + ((iVar6 + CharStats::getBase(pCVar3->Stats,STAT_LV)) - target->GetSheildProtection(backStab)) +
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
    {iVar2 *= fVar3;}
  return iVar2;
}

s16 CombatEntity::NightCheck(s16 param_2,s16 rainPenalty,s16 fogPenalty,s16 nightPenalty,u16 prox){
  if (TerrainPointer->partOfDay == TIME_NIGHT) param_2 -= nightPenalty;
  switch(TerrainPointer->windByte){
    case WIND_CLEAR: return param_2;
    case WIND_FOG: rainPenalty=fogPenalty;//fallthrough
    case WIND_STORM:
      s16 ret = param_2 - rainPenalty;
      if (prox>=5) ret-= (prox-5);
      return ret;
  }
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

s16 CombatEntity::CalculateAttackAccuracy(CombatEntity *target,s8 param_3,s8 param_4,u8 backstab){
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
  u8 uVar14;
  s16 sVar10;
  u32 uVar15;
  u16 uVar16;
  u8 prox;
  
  pCVar3 = this->charSheetP;
  Atkstats = this->charSheetP->Stats;
  DefStats = target->charSheetP->Stats;
  pTVar4 = this->charSheetP->weapons;
  pCVar5 = this->charSheetP->Skills;
  prox = Get2DProximity(target);
  iVar7 = CharStats::getModded(Atkstats,STAT_INT);
  iVar8 = CharStats::getModded(Atkstats,STAT_DEX);
  iVar9 = CharStats::getBase(Atkstats,STAT_LV);
  cVar11 = pCVar5->getModdedWeapon(pTVar4->weaponType);
  cVar12 = pCVar5->getModdedSkill(SKILL_Warrior);
  //             (INT+STAT_DEX+LV)        +       (WepHit+WepSkill*6+Warrior*2)
  uVar15 = ((s16)(iVar7 + iVar8 + iVar9)) + (s16)(pTVar4->hit + cVar11 * 6 + cVar12 * 2);
  if (5 <= prox) uVar15 -= prox - 5;
  uVar16 = (s16)(uVar15 - CharStats::getBase(DefStats,STAT_LV));
  if (!target->HasPetrifyEffect()) {
    uVar16 = (s16)(uVar15 - CharStats::getBase(DefStats,STAT_LV)) + CharStats::getModded(DefStats,STAT_DEX) * -2) - target->GetBlock());
  }
  iVar7 = TheifBackstabMod(uVar16,backstab,0,0x14);
  if (target->numMoves == 0) iVar7 *= 1.2f;
  if (CharStats::getModded(DefStats,STAT_STAM) == 0) iVar7 *= 1.15f;
  iVar8 = FUN_80070cc4(&gCombatP->substruct,param_3,param_4,GetCoordXU8(),GetCoordYU8());
  iVar8 *= (iVar7 * 0.05f + 1.0f);
  if (CharStats::getModded(Atkstats,STAT_STAM) == 0) iVar8 *= 0.9f;
  iVar7 = iVar8 *(1.0f - TerrainPointer->PrecipScale * 0.3f);
  if (TerrainPointer->partOfDay == TIME_NIGHT) iVar7 *= 0.7f;
  if (target->numMoves != 0) iVar7 *= 0.8f;
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
  s16 sVar3;
  u16 rand;
  s16 sVar4;
  u8 bVar8;
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
  if (bVar8 < 6) uVar9 = SQ(8 - (u32)bVar8);
  else uVar9 = 5;
  if (sVar4 < sVar3) {
    dmg = STRTheifCheck(sVar3,(int)sVar4,target,0,0);
    if (rand == sVar4) 
      CSprintf(XAttacksY,this->charSheetP->name,target->charSheetP->name);
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
    CSprintf(X,Spell_error_labels[param_3]);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    print_combat_textbox(gCombatP,gGlobals.text,0);
  }
}

u8 CombatEntity::IsControlMagic(u8 x){
  u8 *pbVar1;
  u8 uStack64 []={
    SpellInd_ControlElem,SpellInd_Charming,
    SpellInd_ControlMarquis,SpellInd_ControlZombies,255};
  
  pbVar1 = uStack64;
  while( true ) {
    if (uStack64[0] == 0xff) return false;
    if (*pbVar1 == x) break;
    pbVar1++;
    uStack64[0] = *pbVar1;
  }
  return true;
}

u8 petrify_spells[4]={SpellInd_WallOfBones,SpellInd_FrozenDoom,SpellInd_WebOfStarlight,255};

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
    uVar3 = (u32)gCombatP->partyCount;
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
    bVar7 = SkillCheck((param_4 - param_3));
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
  this->charSheetP->spellVal = SkillCheck((s16)RollD(1,100));
LAB_8006d340:
  SetFlag(COMBATENT_CASTING);
  return true;
}

u8 CombatEntity::MagicCheck(SpellInstance *param_2,CombatEntity *param_3){
  u8 bVar3;
  u8 bVar1;
  u8 bVar2;
  
  bVar3 = GETINDEX(param_2->base.id);
  if ((bVar3 != SpellInd_WallOfBones) ||
     (bVar2 = false, param_3->charSheetP->ID != IDEntInd(Marquis))) {
    bVar1 = isDispelMagic(bVar3);
    bVar2 = false;
    if (bVar1 == false) {
      if (bVar3 == SpellInd_Teleportation) bVar2 = false;
      else {
        bVar2 = true;
        if ((param_2->target != MTarget_Enemy) && (bVar2 = true, (param_2->aspect_flag & 0x10) == 0)
           ) {
          if (bVar3 == SpellInd_Wind) {bVar2 = param_3->Flag4() != this->Flag4();}
          else bVar2 = false;
        }
      }
    }
  }
  return bVar2;
}

u8 CombatEntity::VSMagic(SpellInstance *casted,CombatEntity *target,s8 *param_4){
  u8 bVar1;
  s32 lVar2;
  s16 iVar3;
  u16 uVar6;
  u8 bVar9;
  CharSheet *pCVar10;
  float fVar11;
  
// no TP with Shadow present
  if ((casted->base.id == IDSpell(SpellList[SpellInd_Teleportation])) && (gGlobals.ShadowIndex != -1)) {
    PrintSpellFail();
    return false;
  }
  if (!MagicCheck(casted,target)) return true;
  CharStats_s* tStats = target->charSheetP->Stats;
  iVar3 = (CharStats::getModded(tStats,STAT_WIL) * 3 + CharStats::getModded(tStats,STAT_END) + CharStats::getBase(tStats,STAT_LV));
  uVar6 = target->CheckVSMagic(casted);
  if (uVar6) iVar3 = (s16)(uVar6 + iVar3);
  if ((casted->aspect_flag & 2) == 0) {if ((casted->aspect_flag & 1) == 0) goto LAB_8006d5ac;}
  fVar11 = 0.75f;
  if (target->charSheetP->EXP->GetAspect() != this->charSheetP->EXP->GetAspect()) {fVar11 = 1.25f;}
  iVar3 *= fVar11;
LAB_8006d5ac:
  uVar6 = RollD(1,100);
  bVar9 = true;
  if ((s16)uVar6 <= iVar3) {
    lVar2 = SkillCheck((iVar3 - uVar6));
    if (lVar2 < this->charSheetP->spellVal) {
      if (target->mirrorVal) {
        iVar3 = (this->charSheetP->spellVal - lVar2);
        if (iVar3 < target->mirrorVal) target->mirrorVal-= iVar3;
        else target->mirrorVal = 0;
        lVar2 = this->charSheetP->spellVal;
      }
    }
    bVar9 = true;
    if (lVar2 < this->charSheetP->spellVal) *param_4 -= lVar2;
    else {
      CombatEntity::PrintSpellResist(target,casted);
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

s16 CombatEntity::CalcSpellDamage(SpellInstance *param_2,CombatEntity *param_3,u8 Level,u8 param_5){
  u8 spellInd = GETINDEX(param_2->base.id);
  if (spellInd == SpellInd_Banishing) return Banish(param_3,param_2);
  if (isDispelMagic(spellInd))return DispelMagic(param_3,param_2,spellInd,param_5);
  else {
      if ((!ControlPetrifyCheck(param_3,param_2,spellInd)) ||
         (!CheckForPetrify(param_3,param_2,spellInd))) return 0;
      if ((param_2->damage == 0) || (TempSpell::IsBattleSpell(param_2))) {
        param_3->damage = 0;
        param_3->Healing = 0;
        Entity::ApplySpellEffect(param_3->charSheetP,spellInd,Level,Level * SECONDS(30),param_5,param_3);
        if (spellInd == SpellInd_tapStamina)
          Entity::AllocEnchant(this->charSheetP,SpellInd_tapStamina,Level,0,Level * SECONDS(30),0);
        PrintSpellCast(param_3,param_2);
        return -1;
      }
      if (param_2->damage == 5) {
        PrintSpellCast(param_3,param_2);
        return Level;
      }
      if (spellInd != SpellInd_Wind) {
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
  CombatAIInfo* pcVar1;
  float afStack32 = 0.0;

  if (CombatEntity::MagicResistChecks(param_3,&afStack32)) {
    param_2 *= afStack32;
    if ((afStack32 != 0.0) && (param_2 < 1)) {param_2 = 1;}
    if (((1.0f < afStack32) &&
        (pcVar1 = this->aiP, pcVar1)) &&
       ((pcVar1->flags & AIFlag_08))) {pcVar1->flags |= (AIFlag_10|AIFlag_02);}
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
  u32 uVar2;
  u32 uVar3;
  PotionEffect *pPVar2;
  
  ppVar1 = gGlobals.combatActors[playerDatIndex];
  if (ppVar1) {
    ppVar1->ani_type = AniType_GetBuff;
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
      Entity::ApplySpellEffect(this->charSheetP,SpellInd_RemovePoison,0,0,0xff,this);
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
  s16 sVar12;
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
  if (target->numMoves) iVar5 -=20;
  sVar12 = iVar5;
  if (this->Flag3()) sVar12 -=25;
  sVar12 = TroubadorMod(AspectMulti(NightCheck(sVar12,20,10,0x1e,(u16)prox)));
  FLOOR(sVar12,5);
  return sVar12;
}

void CombatEntity::PrintFlaskMiss(CombatEntity *param_2,u8 param_3){ 
  playerData *ppVar1 = gGlobals.combatActors[param_2->index];
  Vec3Copy(&(ppVar1->collision).pos,&gGlobals.combatCursorPos);
  gGlobals.combatCursorPos.y += gEntityDB->GetHeight(param_2->charSheetP->ID) * 0.5f - (ppVar1->collision).radius;
  WeaponSkillUpChance(param_3 >> 1,WEAPON_Thrown);
  gGlobals.combatActors[this->index]->ani_type = AniType_Atk4;
  SubtractPotion();
  CSprintf(XAttacksY,this->charSheetP->name,param_2->charSheetP->name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  CSprintf(XMiss,this->charSheetP->name);
  print_combat_textbox(gCombatP,gGlobals.text,0);
}

void CombatEntity::FlaskNoop(s8 x,s8 y,bool unk,s16 val,u8 arg5){}

u16 CombatEntity::GetFlaskDamage(){
  u16 table [4]= {RollD(4,6),RollD(8,6),15,RollD(2,6)};
  return table[this->item];
}

void CombatEntity::FlaskAttack(CombatEntity *target,s16 dmgBase){
  u16 uVar7;
  s16 sVar8;
  s32 iVar4;
  u32 uVar6;
  u8 targetPos[2];
  
  u8 acidRoll = 0;
  u8 potX = gCombatP->potionPos[0];
  u8 potY = gCombatP->potionPos[1];
  if (this->item == POTION_ACID) acidRoll = RollD(2,6);
  for(u32 i=0;i<gCombatP->EntCount;i++) {
    CombatEntity *pCVar1 = (&gCombatP->combatEnts)[i];
    if ((pCVar1) && (!Entity::isDead(pCVar1->charSheetP))) {
      targetPos[0] = 0;
      targetPos[1] = 0;
      pCVar1->GetCoordU8(&targetPos[0],&targetPos[1]);
      uVar7 = sub_square_add_(potX,potY,targetPos[0],targetPos[1]);
      u8 dist = 1;
      if (1 < (uVar7)) dist = sub_square_add_(potX,potY,targetPos[0],targetPos[1]);
      if ((this->item == POTION_ACID) && (dist <= acidRoll)) {
        Entity::ApplyPotionEffect(pCVar1->charSheetP,POTION_ACID,(char)(acidRoll / dist),HOURS(3));
        AddPotionVisualEffect((u32)pCVar1->index,this->item,pCVar1->charSheetP);
      }
      else {
        if (dist <= dmgBase) {
          s16 splash = dmgBase / dist;
          if (pCVar1 == target) pCVar1->PrintDamage(splash);
          if (this->item == POTION_SLEEP) {
            if ((pCVar1 != target) &&
                (CharStats::getModded(pCVar1->charSheetP->Stats,STAT_STAM) <= splash)) {
              splash = CharStats::getModded(pCVar1->charSheetP->Stats,STAT_STAM)-1;
              }
            if (splash < 1) pCVar1->damage = (u8)splash;
            else {
              Entity::DecreaseHP(pCVar1->charSheetP,(s16)splash);
              AddPotionVisualEffect((u32)pCVar1->index,this->item,pCVar1->charSheetP);
              pCVar1->damage = (u8)splash;
            }
          }
          else {
            if ((pCVar1 != target) &&
                (Entity::getHPCurrent(pCVar1->charSheetP) <= splash)) {
              splash = (Entity::getHPCurrent(pCVar1->charSheetP) - 1);
            }
            if (0 < splash) {
              Entity::DamageToLevel(pCVar1->charSheetP,splash,pCVar1);
              AddPotionVisualEffect((u32)pCVar1->index,this->item,pCVar1->charSheetP);
            }
            pCVar1->damage = (u8)splash;
          }
          if (pCVar1 == target) {pCVar1->TryCheatDeath((s16)splash);}
          playerData *pDat = gGlobals.combatActors[pCVar1->index];
          if ((pDat) && (pDat->ani_type = AniType_Hit, pCVar1 != target)) {
            Print_damage_healing(pDat,(u16)pCVar1->damage,0,false,pCVar1->charSheetP);
            pCVar1->damage = 0;
          }
        }
      }
    }
  }
}

u8 CombatEntity::PotionAttack(CombatEntity *target){
  bool bVar4;
  s16 sVar2;
  u16 rand;
  s16 sVar3;
  u8 bVar5;
  Borg9Data *borgDat;
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
    borgDat = &(MAPCENTER.mapPointer)->dat;
    Vec3Set(&posHi,(float)coord8[0],50.0,(float)coord8[1]);
    Vec3Set(&posLo,(float)coord8[0],-10.0,(float)coord8[1]);
    if (!CheckCollision(borgDat,&posHi,&posLo,0.5,&gGlobals.combatCursorPos,NULL,0)) {
      Vec3Set(&gGlobals.combatCursorPos,(float)coord8[0],0.0,(float)coord8[1]);
    }
    bVar5 = GetFlaskDamage();
    CSprintf(XAttacksY,this->charSheetP->name,target->charSheetP->name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    print_combat_textbox(gCombatP,gGlobals.text,0);
    gCombatP->potionPos[0] = coord8[0];
    gCombatP->potionPos[1] = coord8[1];
    this->damage = bVar5;
    WeaponSkillUpChance(uVar6,WEAPON_Thrown);
    gGlobals.combatActors[this->index]->ani_type = 0xf;
  }
  SubtractPotion();
  return 0;
}

u8 CombatEntity::HealingSkill(CombatEntity *target,playerData * pDat){
  
  u32 hpOld = Entity::getHPCurrent(target->charSheetP);
  s8 healerI = PARTY->GetMemberIndex(this->charSheetP->ID);
  s8 healedI = PARTY->GetMemberIndex(target->charSheetP->ID);
  if ((healerI != 0xff) && (healedI != 0xff)) {
    if ((this->flags & COMBATENT_MEDIC) == 0) PARTY->DoHerbHeal(healerI,healedI);
    else PARTY->DoHandsHeal(healerI,healedI);
    if ((s32)hpOld < (s32)Entity::getHPCurrent(target->charSheetP)) {
      u32 hpNew = Entity::getHPCurrent(target->charSheetP);
      CSprintf(XHealsY,this->charSheetP->name,target->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      target->PrintHealing((hpNew - hpOld));
      pDat->ani_type = AniType_GetBuff;
      target->Healing = (u8)(hpNew - hpOld);
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
    if (bVar1 == ATKT_Potion) {
      bVar5 = PotionAttack(param_2);
      SetAni = false;
      goto SetAnimation;
    }
    if (bVar1 != 4) {
      SetAni = false;
      goto SetAnimation;
    }
    this->AtkType = 1;
    if (CanBeTargeted(param_2,false)) {
      bVar5 = CalculateWeaponAttack(param_2);
      this->AtkType = ATKT_4;
      goto SetAnimation;
    }
    this->AtkType = ATKT_4;
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
  u32 uVar3;
  bool bVar7;
  u32 uVar8;
  s16 lVar9;
  s16 lVar10;
  
  pSVar2 = Entity::GetSpellSafe(this->charSheetP,0x13cb,u32_800f5440);
  if (!pSVar2) return 0;
  else {
    lVar10 = MagicDamageResistCalc(param_2,pSVar2,false);
    if (lVar10 == 0) param_2->PrintSpellResist(param_2,pSVar2);
    lVar9 = lVar10;
    if (lVar10 == -3) lVar9 = 0;
    if (lVar9 == -1) {
      lVar10 = -1;
      lVar9 = 0;
    }
    if (lVar9 == -2) {
      lVar10 = -2;
      lVar9 = 0;
    }
    param_3->ani_type = AniType_GetBuff;
    SVar6 = GETINDEX((pSVar2->base).id);
    set_movement_spellUsed(param_3,param_3->ani_type,(s16)(char)SVar6);
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
    if((pCVar1->ID == IDEntInd(Alaron))&&
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
  
  ppVar2 = gGlobals.combatActors[this->index];
  ppVar3 = gGlobals.combatActors[target->index];
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
  target->TryCheatDeath(sVar6);
  this->numMoves = 1;
  if (this->AtkType != ATKT_Potion) target->damage = (u8)sVar6;
  set_camera_playerdata_focus(ppVar2,ppVar3);
  gGlobals.combatBytes[0] = CombatState_2;
  gGlobals.combatBytes[1] = CombatState_2;
  Combat_SetHideMarkers(1);
  return sVar6 != 0;
}

void CombatEntity::TroubadourEnd(){
  UnsetFlag(COMBATENT_BARD);
  gCombatP->TroubadorLV = 0;
  if (gGlobals.combatActors[this->index])
    {FreeAttachmentFromPlayer(gGlobals.combatActors[this->index],2);}
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

//a VERY small chance to level up Troubadour skill from practice.
//(((8-curr skill level)^2)/10)% chance. "capped" at level 4.
void CombatEntity::TroubadourUpChance(u8 param_2){
  if (RollD(1,100) <= (u8)(param_2 / 10)) {this->charSheetP->Skills->AddToBaseSkill(SKILL_Troubador,1);}}

void CombatEntity::m8006f448(){
  vec3f afStack80;
  
  playerData *ppVar1 = gGlobals.combatActors[this->index];
  if (ppVar1) {
    Vec3Set(&afStack80,this->coord.x,(ppVar1->collision).pos.y,this->coord.y);
    Actor::SetCombatMove(ppVar1,&afStack80,(float)this->moveRange);
  }
}

void CombatEntity::Troubadour(){
  playerData *ppVar2;
  s16 iVar3;
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
    gGlobals.combatBytes[0] = CombatState_1;
  }
  else {
    if (CharStats::getModded(this->charSheetP->Stats,STAT_STAM) == 0) {
      CSprintf(TroubTired,this->charSheetP->name);
      copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
      print_combat_textbox(gCombatP,gGlobals.text,0);
      gGlobals.combatBytes[0] = CombatState_1;
    }
    else {
      iVar3 = this->charSheetP->Skills->getModdedSkill(SKILL_Troubador) * 5 + CharStats::getModded(this->charSheetP->Stats,STAT_INT)*2;
      uVar8 = RollD(1,100);
      bVar6 = this->charSheetP->Skills->getModdedSkill(SKILL_Troubador);
      if (bVar6 < 6) uVar9 = SQ(8 - bVar6);
      else uVar9 = 8;
      ppVar2 = gGlobals.combatActors[this->index];
      if (iVar3 < uVar8) { //(troub*5+INT*2)<rand(1,100)
        CSprintf(TroubFail,this->charSheetP->name);
        copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
        print_combat_textbox(gCombatP,gGlobals.text,0);
        TroubadourUpChance((u8)(uVar9 >> 1));
      }
      else {
        s16 sVar7 = (iVar3 - uVar8);
        //(troub*5+INT*2)-rand(1,100)
        if (SkillCheck(sVar7) < 2) bVar6 = 1;
        else bVar6 = (u8)SkillCheck(sVar7);
        SetFlag(COMBATENT_BARD);
        UnsetFlag(COMBATENT_MEDIC);
        UnsetFlag(COMBATENT_HERBS);
        gCombatP->TroubadorLV = bVar6;
        Entity::DecreaseHP(this->charSheetP,3);
        CSprintf(TroubStart,this->charSheetP->name);
        copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
        print_combat_textbox(gCombatP,gGlobals.text,0);
        TroubadourUpChance((u8)uVar9);
        AttachItemToPlayer(ppVar2,2,0x1abb);
      }
      ppVar2->ani_type = AniType_GetBuff;
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
  this->item = GETINDEX(param_2);
  bVar1 = this->AtkType;
  if (bVar1 != ATKT_Potion) {
    this->AtkType = ATKT_Potion;
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
    if (this->AtkType == ATKT_Potion) {
      if (this->item < POTION_HEALING) {
        if (PARTY->Inventory->HasItem(IDPotion(this->item))) {
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
  
  uVar4 = -1;
  if (!cannotSheild(this->charSheetP->ID)) {
    ptVar1 = this->charSheetP->armor[1];
    if (ptVar1 == NULL) {uVar4 = -1;}
    else {
      uVar3 = gArmorDBp->GetBorg5(ptVar1->base.id);
      uVar4 = -1;
      if (uVar3 != BORG5_ShieldNONE) {uVar4 = uVar3;}
    }
  }
  return uVar4;
}

u16 CombatEntity::GetWeaponModel(){
  u16 uVar2;
  u16 uVar3;
  
  WeaponInstance *wep = this->charSheetP->weapons;
  if(wep) {
    uVar2 = Weapon_borg5_lookup(GETINDEX(wep->base.id));
    uVar3 = -1;
    if (uVar2 != -1) uVar3 = uVar2;
  }
  else return -1;
  return uVar3;
}

u8 missle_ids[]={
  WeaponInd_AccuracyBow,WeaponInd_ThunderBow,WeaponInd_LongBow,
  WeaponInd_ShieldBow,WeaponInd_HunterBow,WeaponInd_HeartseekerBow,
  WeaponInd_GreatBow,WeaponInd_ShortBow,0xff};

u8 CombatEntity::BowEquipped(){
  WeaponInstance *wep = this->charSheetP->weapons;
  if (wep) {
    u8 ind = GETINDEX(wep->base.id);
    for(u32 i=0;missle_ids[i]!=0xff;i++){
      if(missle_ids[i]==ind) return true;
    }
  }
  return false;
}

void CombatEntity::AttachWeaponShieldModel(u16 param_2,s32 param_3,s32 borg5){
  
  if (borg5 != -1) {
    playerData *ppVar1 = gGlobals.combatActors[this->index];
    if (ppVar1->borg7P) {
      Scene::HasLocator(ppVar1->borg7P->sceneDat,param_3);
    }
    AttachItemToPlayer(ppVar1,param_2,borg5);
    ChangeAttachmentNode(ppVar1,param_2,param_3,NULL,0);
  }
}

u8 throwing_ids[]={
  WeaponInd_PoisonDart,WeaponInd_DartDistance,WeaponInd_CyclopsHurlstar,
  WeaponInd_Hatchet,WeaponInd_Javelin,WeaponInd_ThrowingKnife,
  WeaponInd_DragonFang,WeaponInd_ThrowingIron,0xFF};

void CombatEntity::ThrowingEquipped(){
  u8 bVar1;
  u8 bVar3;
  u8 *pbVar4;
  
  this->throwingFlag = 0;
  if (this->AtkType == ATKT_Potion) {if (this->item < POTION_HEALING) {this->throwingFlag = 1;}}
  else {
    if (this->charSheetP->weapons) {
      if (!BowEquipped()) {
        bVar3 = GETINDEX(this->charSheetP->weapons->base.id);
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
  
  ppVar1 = gGlobals.combatActors[this->index];
  borg5_00 = -1;
  FreeAttachmentFromPlayer(ppVar1,1);
  FreeAttachmentFromPlayer(ppVar1,0);
  this->wepLocator = 0;
  this->shieldLocator = 2;
  borg5 = CombatEntity::GetShieldModel();
  if (this->AtkType != 0) {
    if (this->AtkType == ATKT_Potion) borg5_00 = BORG5_CombatPotion;
    else {
      if (this->charSheetP->weapons) {
        borg5_00 = BORG5_CombatArrow;
        if (!BowEquipped()) {borg5_00 = GetWeaponModel();}
        else {
          this->shieldLocator = this->bowHand != 0;
          this->wepLocator = this->bowHand == 0;
          borg5 = GetWeaponModel();
        }
      }
    }
  }
  ThrowingEquipped();
  AttachWeaponShieldModel(1,(u32)this->shieldLocator,borg5);
  if (!CannotShowWeapon(this->charSheetP->ID)) {AttachWeaponShieldModel(0,this->wepLocator,borg5_00);}
  return;
}

u8 cannotSheild(ItemID x){return gEntityDB->entities[GETINDEX(x)].sheildStat == -1;}

u8 CannotShowWeapon(ItemID x){
  u8 entlist []={
    EntInd_Ehud,EntInd_Gorgon,EntInd_ChaosLt,EntInd_Harpy,EntInd_Marquis,EntInd_Minotuar,
    EntInd_MinotuarLord,EntInd_Niesen,0xff};
  u8 ind = GETINDEX(x);
  for(u32 i=0;entlist[i]!=0xff;i++){
    if(entlist[i]==ind) return true;
  }
  return false;
}

SceneData * CombatEntity::GetWeaponScene(){
  WeaponInstance *pTVar1;
  u8 bVar5;
  u8 bVar6;
  u16 uVar4;
  u32 uVar2;
  s16 lVar7;
  u32 uVar8;
  
  if (CannotShowWeapon(this->charSheetP->ID)) return NULL;
  if (this->AtkType == ATKT_Potion) return BorgAnimLoadScene(BORG5_CombatPotion);
  else {
    pTVar1 = this->charSheetP->weapons;
    if (pTVar1) {
      bVar6 = GETINDEX(pTVar1->base.id);
      lVar7 = Weapon_borg5_lookup(bVar6);
      if (lVar7 != -1) {
        if (missle_ids[0] != 0xff) {
          if (missle_ids[0] == bVar6) lVar7 = BORG5_CombatArrow;
          else {
            uVar2 = 1;
            do {
              uVar8 = uVar2 & 0xffff;
              if (missle_ids[uVar8] == 0xff) BorgAnimLoadScene(lVar7);
              uVar2 = uVar8 + 1;
            } while (missle_ids[uVar8] != bVar6);
            lVar7 = BORG5_CombatArrow;
          }
        }
        return BorgAnimLoadScene(lVar7);
      }
    }
  }
  return NULL;
}

void CombatEntity::GetWeaponRanges(float *param_2,float *param_3,float *param_4){
  u8 bVar7;
  float fVar8;
  
  bVar7 = this->AtkType;
  if (bVar7 == ATKT_Potion) {
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
  switch(GETINDEX(this->charSheetP->weapons->base.id)) {
  case WeaponInd_AccuracyBow:
    *param_2 = 9.9f;
    *param_3 = 0.0;
    break;
  case WeaponInd_ShieldBow:
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case WeaponInd_ThunderBow:
    *param_2 = 9.0f;
    *param_3 = 0.0;
    break;
  case WeaponInd_HeartseekerBow:
    *param_2 = 9.0f;
    *param_3 = 0.0;
    break;
  case WeaponInd_GreatBow:
    *param_2 = 9.0f;
    *param_3 = 0.0;
    break;
  case WeaponInd_HunterBow:
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case WeaponInd_LongBow:
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case WeaponInd_ShortBow:
    *param_2 = 5.0f;
    *param_3 = 0.0;
    break;
  default:
    goto switchD_80070018_caseD_3d;
  case WeaponInd_SpitVenom:
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case WeaponInd_DragonFang:
    *param_2 = 8.0f;
    goto LAB_800701bc;
  case WeaponInd_ThrowingIron:
    *param_2 = 8.0f;
    fVar8 = 20.0f;
    goto LAB_800701bc;
  case WeaponInd_ThrowingKnife:
    *param_2 = 5.0f;
    fVar8 = 12.0f;
    goto LAB_800701bc;
  case WeaponInd_CyclopsHurlstar:
    *param_2 = 5.0f;
    fVar8 = 12.0f;
    goto LAB_800701bc;
  case WeaponInd_DartDistance:
    *param_2 = 8.0f;
    *param_3 = 0.0;
    break;
  case WeaponInd_PoisonDart:
    *param_2 = 5.0f;
    *param_3 = 0.0;
    break;
  case WeaponInd_Spikes:
    *param_2 = 5.0f;
    *param_3 = 0.0;
    break;
  case WeaponInd_Hatchet:
    *param_2 = 5.0f;
    fVar8 = 6.0f;
LAB_800701bc:
    *param_3 = fVar8;
    break;
  case WeaponInd_Javelin:
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

void CombatEntity::UpdatePosition(){
  playerData *pDat = gGlobals.combatActors[this->index];
  if (pDat) {
    FUN_800714d0(&gCombatP->substruct,GetCoordXU8(),GetCoordYU8(),this->unk23);
    this->coord = {(pDat->collision).pos.x,(pDat->collision).pos.z};
    FUN_800713fc(&gCombatP->substruct,GetCoordXU8(),GetCoordYU8(),(u32)this->unk23);
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
      if (isBreathSpitOrSpikes(pTVar1)) {bVar3 = ATKT_4;}
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