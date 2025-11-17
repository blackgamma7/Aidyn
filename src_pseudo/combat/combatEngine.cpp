#include "combat/CombatStruct.h"
#include "combat/Visuals.h"
#include "globals.h"
#include "romstring.h"
#include "widgets/WidgetCombatTextbox.h"
#include "weapondb.h"

#define FILENAME "../combatengine/combat.cpp"


// check if ID is for non-fighting entity (or not an entity at all.)
bool EntityCannotFight(ItemID id){
  u16 index = GETINDEX(id);
  if (id >> 8 != DB_ENTITY) return true;
  if (index < 0x91) {
    if (0x81 < index) return true;
    if (0x56 < index) return false;
    if (0xFF < index) return true;
  }
  else if (index < 0x97) {
    if (0x91 < index) return true;
    return false;
  }
  return false;
}


void memset_combat_struct(CombatStruct *param_1){
  CLEAR(param_1);
  param_1->waitTimer = 0;
  param_1->SenseAuraWidget = NULL;
  param_1->loot_pool = NULL;
  gCameraCombatStartFlag = 1;
  param_1->TroubadorLV = 0;
  param_1->textArray = RomString::Load(combat_romstrings,0x500);
  CLEAR(param_1->textboxes[0]);
  CLEAR(param_1->textboxes[1]);
  CLEAR(param_1->textboxes[2]);
  param_1->TextboxFlag = 0;
  param_1->reinforcmentsWillFlee = 0;
  param_1->TurnCount = 0;
  param_1->AniTimer = 0;
  Vec2Set(&param_1->entity_XY,0.0,0.0);
  param_1->hasFleeRefpoints = 0;
  param_1->renderTicker = 0;
}

voxelObject * get_refpoint_by_name(u32 param_1,u8 param_2,bool GOrE){
  char *local_c8 [16];
  char *local_88 [2];
  char acStack_48 [72];
  
  local_88[0] = gCombatP->textArray[COMBATSTRING_RefPoint1];
  local_88[1] = gCombatP->textArray[COMBATSTRING_RefPoint0];
  local_c8[0] = local_88[0];
  local_c8[1] = local_88[1];
  sprintf(acStack_48,gCombatP->textArray[COMBATSTRING_SUC],local_c8[GOrE],param_1,param_2 + 'a');
  return FindReferncePointName(gGlobals.gameVars.borg9DatPointer,acStack_48,true);
}

char* sFilenameCombatEngine=FILENAME;
void Combat_GetSpawnPoint(CombatStruct *param_1,u8 *posx,u8 *posz,u8 *rand,u8 param_5,int param_6,int param_7,u8 param_8){
  u8 uVar3;
  u8 uVar4;
  
  uint uVar1 = 7;
  if ((param_6 != 0) || (uVar4 = 5, param_1->encounter_dat->collisionByte != 0)) {
    uVar1 = 3;
    uVar4 = 1;
  }
  uVar1 = rand_range(uVar4,uVar1);
  if (param_7 == 0)
    uVar4 = 4 - param_1->encounter_dat->aniByte;
  else uVar4 = 0;
  bool GOrE = true;
  if ((param_1->encounter_dat->collisionByte == 2) && (GOrE = false, param_6 != 0)) {
    if (param_5 == 0) {
      uVar4 = 4;
      if (param_1->encounter_dat->aniByte == EncountAni_Run) uVar4 = 3;
    }
    else if (param_5 == 1) {
      if (param_1->encounter_dat->aniByte != EncountAni_Default) uVar4++;
    }
    else if ((3 < param_5) && (param_1->encounter_dat->aniByte != EncountAni_Run)) uVar4--;
  }
  if (param_6 == 0) GOrE = !GOrE;
  voxelObject *prVar2 = get_refpoint_by_name(uVar4,param_8,GOrE);
  if(!prVar2)CRASH(sFilenameCombatEngine,"No Reference Point!");
  *posx =(prVar2->header).pos.x;
  *posz =(prVar2->header).pos.z;
  *rand = (u8)uVar1;
}

void combatEnt_setup(CombatStruct *param_1,u8 index){
  CombatEntity *C_Ent = (&param_1->combatEnts)[index];
  C_Ent->SetMovementRange();
  playerData *pDat = gGlobals.playerDataArray[index];
  if (pDat) {
    FUN_80094228(pDat);
    FUN_80096048(pDat);
    Actor::FreePlayer(pDat);
    pDat->ID = 0;
    pDat->removeFlag = 0;
  }
  ItemID x = C_Ent->charSheetP->ID;
  init_combatgui_struct(x,index,param_1->playerCount <= index);
  //are they Alaton or Shadow?
  if (GETINDEX(x) == EntInd_Shadow) set_shadow_index(index);
  if (GETINDEX(x) == EntInd_Alaron) set_alaron_index(index);
  playerData *ppVar2 = Actor::AllocPlayer(gEntityDB->GetCollideRadius(x),C_Ent->GetCoordX(),1.0,C_Ent->GetCoordY(),gEntityDB->GetBorg7(x));
  ppVar2->ent_ID = x;
  ppVar2->Ent_index = GETINDEX(x);
  float fVar5 = gEntityDB->GetScale(x);
  ppVar2->scale = fVar5;
  ppVar2->scaleRad = (ppVar2->collision).radius * fVar5;
  ppVar2->shadowAlpha = gEntityDB->BattleCheck(x);
  ppVar2->visible_flag = 1;
  if (param_1->playerCount <= index) {
    ppVar2->visible_flag = 0;
    ppVar2->flags |= ACTOR_200;
  }
  Actor::CheckCollision(ppVar2,0.0,0,0);
  C_Ent->SetPlayerRotate();
  C_Ent->m8006f448();
  C_Ent->SetAktRangeMulti(false);
}


u16 count_enemies(EncounterDat *param_1){
    u16 c=0;
  for(u16 i=0;i<4;i++) {
    if (param_1->enemy_entities[i])c++;
  }
  return c;
}

byte find_sholeh(EncounterDat *param_1){
    for(u16 i=0;i<4;i++) {
    if (param_1->enemy_entities[i]==IDEntInd(EntInd_Sholeh))return i;
  }
}

void NOOP_800658a0(u8 players,u8 enemies){}


u8 recount_enemy_party(EncounterDat *param_1,u16 param_2){
  uint uVar1;
  uint uVar2;
  uint uVar3;
  
  uVar3 = param_2 + 1;
  do {
    uVar2 = uVar3;
    uVar1 = uVar2 & 0xffff;
    if (0xb < uVar1) {
      return 0xc;
    }
    uVar3 = uVar1 + 1;
  } while (param_1->enemy_entities[uVar1] == (ItemID)0x0);
  return uVar2;
}


int look_for_flasks(void){
  int iVar2 = 7;
  if (!PARTY->Inventory->HasItem(Potion_Inferno)) {
    iVar2 = 5;
    if (!PARTY->Inventory->HasItem(Potion_Fire)) {
      if (PARTY->Inventory->HasItem(Potion_Sleep)) {
        iVar2 = 4;
      }
      else iVar2 = (uint)PARTY->Inventory->HasItem(Potion_Acid) << 2;
    }
  }
  return iVar2;
}


u16 Combat_CreatePartyMembers(u8 param_1){
  CharSheet *charsheet;
  bool bVar5;
  undefined1 uVar6;
  CombatEntity *pCVar3;
  int iVar4;
  u16 uVar7;
  uint i;
  float fVar8;
  float fVar9;
  uint uVar10;
  u8 posx;
  u8 posz;
  u8 uStack_3e;
  u8 auStack_3d [45];
  
  uVar7 = 0;
  for(u16 i=0;i<MAXPARTY;i++) {
    charsheet = PARTY->Members[i];
    if (charsheet) {
      if (Entity::isDead(charsheet)) {
        gCombatP->playerCount--;
        gCombatP->EntCount--;
      }
      else {
        CombatInitMacro1(charsheet->ID,uVar10,uVar6);
        Combat_GetSpawnPoint(gCombatP,&posx,&posz,&uStack_3e,param_1,1,0,(char)uVar7);
        ALLOC(pCVar3,0x23a);
        (&gCombatP->combatEnts)[uVar7] = pCVar3;
        gCombatP->combatEnts[uVar7++].Init(charsheet,0,posx,posz,uStack_3e,uVar6,0,(char)uVar7);
        auStack_3d[0] = 0;
        if (charsheet->spellbook->HaveSpell(IDSpell(SpellList[8]),auStack_3d)) {
          iVar4 = Entity::CheckSpellWizard(charsheet,charsheet->spellbook->spells[auStack_3d[0]]);
          if ((uint)gCombatP->flask_byte < (iVar4 << 1 & 0xffU)) {
            gCombatP->flask_byte = (byte)(iVar4 << 1);
          }
        }
      }
    }
  }
  return uVar7;
}


uint Combat_CreateAlly(ItemID param_1,u16 param_2,u8 param_3)

{
  undefined1 uVar5;
  CombatEntity *pCVar1;
  CharSheet *pCVar2;
  CombatAIInfo *pCVar3;
  bool bVar6;
  int iVar4;
  u16 uVar7;
  float fVar8;
  float fVar9;
  u8 uStack_30;
  u8 uStack_2f;
  u8 uStack_2e;
  u8 auStack_2d [37];
  
  uVar7 = (uint)param_2;
  if (param_1 != (ItemID)0x0) {
    if (0.0 < (gEntityDB->GetCollideRadius(param_1) * gEntityDB->GetScale(param_1))*2)
          uVar7 = ((gEntityDB->GetCollideRadius(param_1) * gEntityDB->GetScale(param_1))*2)+0.5;
        else uVar7 = -(0.5 - ((gEntityDB->GetCollideRadius(param_1) * gEntityDB->GetScale(param_1))*2));
        uVar5 = (u8)uVar7;
        if (!uVar7) uVar5 = 1;
    Combat_GetSpawnPoint(gCombatP,&uStack_30,&uStack_2f,&uStack_2e,param_3,1,0,3);
    ALLOC(pCVar1,607);
    (&gCombatP->combatEnts)[param_2] = pCVar1;
    ALLOC(pCVar1->charSheetP,611);
    Entity::Init(pCVar2,param_1,1);
    pCVar1->Init(pCVar1->charSheetP,0,uStack_30,uStack_2f,uStack_2e,uVar5,0,(char)param_2);
    ALLOC(pCVar1->aiP,618);
    CombatAIInfo::Init(pCVar3,param_1,pCVar1);
    uVar7 = param_2 + 1;
    auStack_2d[0] = 0;
    pCVar2 = pCVar1->charSheetP;
                    // fireball
    if (pCVar2->spellbook->HaveSpell(IDSpell(SpellList[SPELLIND_fireball]),auStack_2d)) {
      iVar4 = Entity::CheckSpellWizard(pCVar2,pCVar2->spellbook->spells[auStack_2d[0]]);
      if ((uint)gCombatP->flask_byte < (iVar4 << 1 & 0xffU)) {
        gCombatP->flask_byte = (byte)(iVar4 << 1);
      }
    }
  }
  return uVar7;
}

void look_for_boss_shadow(ItemID param_1){
  u8 ID = GETINDEX(param_1);
  if (ID == EntInd_Shadow) gCombatP->encounter_dat->BossShadow = 1;
  else {
    u8 Boss_Ent_Indecies[]={
        0xA8,0xAA,0xAB,0xAD,0xAE,0xB4,0xB3,0xB2,0xB1,0xB0,0xAF,0xB5,0xFF};
    for(u8* p=Boss_Ent_Indecies;*p!=0xff;p++){
      if (*p == ID) {
        gCombatP->encounter_dat->BossShadow = 0;
        return;
      }
    }
  }
  return;
}


void Combat_CreateEnemies(u16 param_1,u8 param_2)

{
  ItemID IVar1;
  bool bVar8;
  ItemID *pIVar3;
  undefined1 uVar9;
  CombatEntity *pCVar4;
  CharSheet *pCVar5;
  int iVar6;
  int iVar7;
  u16 j;
  u16 i;
  float fVar12;
  float fVar13;
  uint uVar14;
  u8 uStack_40;
  u8 uStack_3f;
  u8 auStack_3e [46];
  
  j = param_1;
  for(u16 i=0;i<4;i++) {
    IVar1 = gCombatP->encounter_dat->enemy_entities[i];
    if (IVar1) {
      if (EntityCannotFight(IVar1))
        gCombatP->encounter_dat->enemy_entities[i]=0;
      else {
        CombatInitMacro1(param_1,uVar14,uVar9);
        Combat_GetSpawnPoint(gCombatP,&uStack_40,&uStack_3f,auStack_3e,param_2,0,0,i);
        ALLOC(pCVar4,709);
        (&gCombatP->combatEnts)[j] = pCVar4;
        ALLOC(pCVar5,713);
        pCVar4->charSheetP = pCVar5;
        Entity::Init(pCVar5,IVar1,1);
        pCVar4->Init(pCVar4->charSheetP,-1,uStack_40,uStack_3f,auStack_3e[0],uVar9,1,j);
        //highest INT determines leader
        if(CharStats::getBase(pCVar4->charSheetP->Stats,STAT_INT)>=
         CharStats::getBase((&gCombatP->combatEnts)[gCombatP->leaderIndex]->charSheetP->Stats,STAT_INT))
          gCombatP->leaderIndex = j;
        look_for_boss_shadow(IVar1);
        j++;
      }
    }

  }
  gCombatP->leaderMorale = (&gCombatP->combatEnts)[gCombatP->leaderIndex]->aiP->morale;
}

void encounter_id_check(EventFlag param_1){
  u16 encounterID_byte_dict[][2]={{0x3d2,0},{0x1482,1},{0xea5,1},{-1,-1}};
  for(u32 i=0;encounterID_byte_dict[i][0]!=-1;i++){
    if(encounterID_byte_dict[i][0]==param_1){
        gCombatP->encounter_dat->BossShadow=encounterID_byte_dict[i][1];
        return;
    }
  }
}


void scoot_enemy_list(EncounterDat *param_1){
  int iVar1;
  ItemID *pIVar2;
  ItemID *pIVar3;
  uint uVar4;
  uint uVar5;
  
  uVar4 = 0;
  do {
    pIVar3 = &param_1->enemy_entities[uVar4];
    uVar5 = uVar4 + 1;
    if ((*pIVar3 == 0) && (uVar5 < 0xc)) {
      pIVar2 = &param_1->enemy_entities[uVar4+1];
      uVar4 = uVar5;
      do {
        uVar4++;
        if (*pIVar2 != 0) {
          *pIVar3 = *pIVar2;
          pIVar3++;
          pIVar2= 0;
        }
        pIVar2++;
      } while (uVar4 < 0xc);
    }
    uVar4 = uVar5;
  } while (uVar5 < 0xc);
}

void Combat_InitEncounter(CombatStruct *param_1,EncounterDat *param_2){
  CombatEntity *pCVar3;
  u16 uVar8;
  byte bVar9;
  u8 uVar10;
  uint uVar7;
  ItemID *pIVar11;
  ItemID uVar6;
  float fVar12;
  
  param_1->encounter_dat = param_2;
  param_1->enemyCount = 0;
  param_1->playerCount = PARTY->PartySize;
  uVar8 = count_enemies(param_2);
  uVar6= 0;
  param_1->enemyCount = (byte)uVar8;
  bVar9 = find_sholeh(param_1->encounter_dat);
  if (bVar9) {
    pIVar11 = param_1->encounter_dat->enemy_entities + (bVar9 - 1);
    param_1->enemyCount--;
    pIVar11= 0;
    param_1->playerCount++;
    uVar6 = IDEntInd(EntInd_Sholeh);
  }
  scoot_enemy_list(param_1->encounter_dat);
  NOOP_800658a0(param_1->playerCount,param_1->enemyCount);
  param_1->enemy_index = recount_enemy_party(param_1->encounter_dat,param_1->enemyCount - 1);
  param_1->TroubadorLV = 0;
  param_1->some_index = 0;
  param_1->firstKill = 0;
  param_1->leaderDead = 0;
  param_1->EntCount = param_1->playerCount + param_1->enemyCount;
  param_1->partOfDay = TerrainPointer->partOfDay;
  bVar9 = look_for_flasks();
  uVar10 = 0;
  param_1->flask_byte = bVar9;
  param_1->EXP_pool = 0;
  param_1->gold_pool = 0;
  init_combat_substruct(&param_1->substruct,param_1->encounter_dat->battlefield);
  if (param_2->collisionByte == 2) {
    uVar10 = PARTY->AmbushDamage();
  }
  uVar8 = Combat_CreatePartyMembers(uVar10);
  uVar7 = Combat_CreateAlly(uVar6,uVar8 & 0xff,uVar10);
  param_1->leaderIndex = Combat_CreateAlly(uVar6,uVar8 & 0xff,uVar10);
  Combat_CreateEnemies((ushort)uVar7 & 0xff,uVar10);
  check_battlefeild_fleeing_refpoints(param_1);
  (param_1->turn).unk4 = 0;
  combatenine_turn_func(&param_1->turn);
  (param_1->SpellMarkerPos).x = param_1->current_Ent->GetCoordX();
  (param_1->SpellMarkerPos).y = param_1->current_Ent->GetCoordY();
  encounter_id_check(param_1->encounter_dat->EncounterID);
}


bool Ofunc_800664ac(CombatStruct *param_1)

{
  byte bVar1;
  ItemID IVar2;
  bool bVar4;
  
  if (param_1->enemy_index < 0xc) {
    while( true ) {
      IVar2 = param_1->encounter_dat->enemy_entities[param_1->enemy_index];
      if (!CombatAI::WillTheyFlee(IVar2)) break;
      param_1->reinforcmentsWillFlee = 1;
      draw_dead_crossbones(IVar2);
      u8 uVar3 = recount_enemy_party(param_1->encounter_dat,param_1->enemy_index);
      param_1->enemy_index = uVar3;
      if (0xb < uVar3) goto LAB_80066528;
    }
    bVar4 = true;
  }
  else {
LAB_80066528:
    bVar4 = false;
  }
  return bVar4;
}
//unused combatant death function.
bool Ofunc_CombatLeaderDead(CombatStruct *param_1,s32 param_2){
  CombatEntity *X = (&param_1->combatEnts)[param_2];
  if (X) {
    //didn't flee or die?
    if((!Entity::isDead(X->charSheetP))&&(!X->Flag6()))return false;
    //was the leader?
    if (param_2 == param_1->leaderIndex) param_1->leaderDead = true;
    Entity::Free(X->charSheetP);
    HFREE(X->charSheetP,941);
    X->FreeAi();
    HFREE(X,945);
    (&param_1->combatEnts)[param_2] = NULL;
  }
  return true;
}

bool some_combat_proximity_check(CombatStruct *param_1,ItemID id,float x,float y){
  vec2f tempA,tempB;
  
  float radius = gEntityDB->GetCollideRadius(id);
  float scale = gEntityDB->GetScale(id);
  CLEAR(&tempA);
  if (param_1->EntCount) {
    tempA.x = x;
    tempA.y = y;
    for(u32 i=0;i<param_1->EntCount;i++) {
      CombatEntity *cEnt = &param_1->combatEnts[i];
      if (cEnt){
        playerData *pDat = gGlobals.playerDataArray[(cEnt)->index];
        if (pDat){
          Vec2Set(&tempB,(pDat->collision).pos.x,(pDat->collision).pos.z);
          if (Vec2Dist(&tempA,&tempB) <= pDat->scaleRad + radius * scale) {
            return false;
          }
        }
      }
    }
  }
  return true;
}


bool FUN_8006674c(CombatStruct *param_1,u32 param_2,u16 param_3,byte param_4,
                 float *coordA,float *CoordB,uint param_7){
  float fVar6;
  double dVar5;
  byte x;
  byte y;
  
  for(u32 i=0;i<1;i++){
    for(u32 j=0;j<4;j++){
      voxelObject* refObj = get_refpoint_by_name(param_2,(u8)j,i != param_7);
      fVar6 = (refObj->header).pos.x;
      dVar5 = (double)fVar6;
      if (0.0 < fVar6) x = (byte)(int)(dVar5 + 0.5);
      else x = -(char)(int)(0.5 - dVar5);
      fVar6 = (refObj->header).pos.z;
      dVar5 = (double)fVar6;
      if (0.0 < fVar6) y = (dVar5 + 0.5);
      else y = -(0.5 - dVar5);
      if ((!combat_substruct_lookup(&param_1->substruct,x,y,param_4)) &&
         (some_combat_proximity_check(param_1,param_3,(refObj->header).pos.x,(refObj->header).pos.z)))
      {
        *coordA = (refObj->header).pos.x;
        *CoordB = (refObj->header).pos.z;
        return true;
      }
    }
  }
  return false;
}


void FUN_800668e4(CombatStruct *param_1,u8 *outX,u8 *outY,u8 *param_4,u8 param_5,u8 param_6,
                 u32 param_7,u32 param_8,u8 param_9,ItemID id){

  float fStack_30;
  float afStack_2c;
  
  *outX = 0;
  *outY = 0;
  Combat_GetSpawnPoint(param_1,outX,outY,param_4,param_6,param_7,param_8,param_9);
  fStack_30 = (float)*outX;
  afStack_2c = (float)*outY;
  if ((combat_substruct_lookup(&param_1->substruct,*outX,*outY,param_5)) ||
     (some_combat_proximity_check(param_1,id,fStack_30,afStack_2c))) {
    for(u32 i = 0;i < 5;i++) {
      if (FUN_8006674c(param_1,i,id,param_5,&fStack_30,&afStack_2c,(uint)(param_6 != 0))){
        *outX = fStack_30;
        *outY = afStack_2c;
        return;
      }
    }
  }
}


void func_settting_leader_dead_flag(CombatStruct *param_1)

{
  byte bVar1;
  ItemID IVar2;
  double dVar3;
  bool bVar6;
  undefined1 uVar7;
  CombatEntity *pCVar4;
  CharSheet *pCVar5;
  u8 uVar8;
  uint uVar9;
  CombatEntity **ppCVar10;
  float fVar11;
  float fVar12;
  uint uVar13;
  u8 uStack_40;
  undefined1 uStack_3f;
  undefined1 auStack_3e [46];
  
  uVar9 = (uint)param_1->playerCount;
  uStack_40 = 0;
  uStack_3f = 0;
  auStack_3e[0] = 0;
  param_1->reinforcmentsWillFlee = 0;
  if (((param_1->EntCount <= uVar9) || (0xb < param_1->enemy_index)) ||
     (param_1->encounter_dat->enemy_entities[param_1->enemy_index] == (ItemID)0x0)) {
    return;
  }
  ppCVar10 = &param_1->combatEnts + param_1->playerCount;
  pCVar4 = *ppCVar10;
  do {
    if (!pCVar4) {
LAB_80066c04:
      IVar2 = param_1->encounter_dat->enemy_entities[param_1->enemy_index];
      CombatInitMacro1(IVar2,uVar13,uVar7);
      uVar8 = (u8)uVar9;
      FUN_800668e4(param_1,&uStack_40,&uStack_3f,auStack_3e,uVar7,0,0,1,uVar8 - param_1->playerCount
                   ,IVar2);
      ALLOC(pCVar4,1281);
      *ppCVar10 = pCVar4;
      ALLOC(pCVar5,1284);
      pCVar4->charSheetP = pCVar5;
      Entity::Init(pCVar5,IVar2,1);
      pCVar4->Init(pCVar4->charSheetP,-1,uStack_40,uStack_3f,auStack_3e[0],uVar7,1,uVar8);
      combatEnt_setup(param_1,uVar8);
      uVar8 = recount_enemy_party(param_1->encounter_dat,(ushort)param_1->enemy_index);
      param_1->enemy_index = uVar8;
      pCVar4->flags |= COMBATENT_BENCH;
LAB_80066da0:
      bVar1 = param_1->EntCount;
    }
    else {
      if (Entity::isDead(pCVar4->charSheetP)) {
LAB_80066b7c:
        IVar2 = param_1->encounter_dat->enemy_entities[param_1->enemy_index];
        if (!CombatAI::WillTheyFlee(IVar2)) {
          if ((param_1->leaderDead == 0) && (uVar9 == param_1->leaderIndex)) {
            param_1->leaderDead = 1;
          }
          Entity::Free(pCVar4->charSheetP);
          HFREE(pCVar4->charSheetP,0x4ee);
          pCVar4->FreeAi();
          HFREE(pCVar4,0x4f2);
          goto LAB_80066c04;
        }
        uVar8 = recount_enemy_party(param_1->encounter_dat,(ushort)param_1->enemy_index);
        param_1->enemy_index = uVar8;
        draw_dead_crossbones(IVar2);
        param_1->reinforcmentsWillFlee = 1;
        goto LAB_80066da0;
      }
      if (pCVar4->Flag6()) {
        bVar1 = param_1->enemy_index;
        goto LAB_80066b7c;
      }
      bVar1 = param_1->EntCount;
    }
    uVar9++;
    ppCVar10++;
    if (bVar1 <= uVar9) return;
    if (0xb < param_1->enemy_index) return;
    if (param_1->encounter_dat->enemy_entities[param_1->enemy_index] == (ItemID)0x0) {
      return;
    }
    pCVar4 = *ppCVar10;
  } while( true );
}

void get_gear_drop(CombatStruct *param_1,Entity_Ram *param_2,Loot_RAM *param_3)

{
  ItemID id;
  if (param_2 == NULL) return;
  id = param_2->Armor;
  if ((param_3->armorDrop != 0) && (id != (ItemID)0xffff)) {
    if (param_3->armorDrop >= RollD(1,100)) {
      param_1->loot_pool->AddItem(id,1);
      param_1->EXP_pool +=gArmorDBp->Armor[GETINDEX(id)].expBonus*25;//?
    }
  }
  id = param_2->Sheild;
  if (((param_3->sheildDrop != 0) && (id != (ItemID)0xffff)) &&
     (RollD(1,100) <= param_3->sheildDrop)) {
    param_1->loot_pool->AddItem(id,1);
    param_1->EXP_pool += gArmorDBp->Armor[GETINDEX(id)].expBonus;
  }
  for(u32 i=0;i>3;i++) {
    id = param_2->weapon[i];
    if (((param_3->weaponDrop[i] != 0) && (id != (ItemID)0xffff)) && (id != (ItemID)0x0)) {
      u8 index = GETINDEX(id);
      u8 isntMonsterWeapon[]={false,false,false,true,true,true,false,false,true,true,false};
      if ((isntMonsterWeapon[gWeaponsDB->weapons[index].wepClass]) &&
         (RollD(1,100)<= param_3->weaponDrop[i])) {
        param_1->loot_pool->AddItem(id,1);
        param_1->EXP_pool += gWeaponsDB->weapons[index].EXPMod;
      }
    }
  }

}


void get_exp_mod(CombatStruct *param_1,Loot_RAM *param_2,uint param_3)

{ 
  if (param_2->itemDropChances[param_3]) {
    if (param_2->itemDropChances[param_3] < RollD(1,100)) return;
    u8 uVar2 = 1;
    if (param_3 < 2) {
      uVar2 = rand_range(param_2->itemLo[param_3],param_2->itemHi[param_3]);
    }
    //Short means messy bitshifting casting and AND casting. yeesh.
    s16 x = param_2->itemDrops[param_3];
    param_1->loot_pool->AddItem(x,uVar2);
    u16 uVar6;
    if (true) {
      switch(x>>8) {
      case 1:
      case 9:
      case 10:
      case 0xb:
      case 0xc:
      case 0xd:
      case 0xe:
      case 0xf:
      case 0x11:
      case 0x12:
      case 0x13:
        uVar6 = (uint)gItemDBp->Gear[(u8)search_item_array(x)].exp_multi;
        break;
      default:
        return;
      case 5:
      case 6:
        uVar6 = gArmorDBp->Armor[GETINDEX(x)].expBonus;
        break;
      case 7:
        uVar6 = gWeaponsDB->weapons[GETINDEX(x)].EXPMod;
      }
      param_1->EXP_pool += uVar2 * uVar6;
    }
  }
}





void calc_loot(CombatStruct *param_1,byte param_2,Entity_Ram *param_3){
  Loot_RAM *pLVar5 = &gChestDBp->lootCat[param_2];
  param_1->gold_pool+=rand_range(pLVar5->GoldLo,pLVar5->GoldHi);
  get_gear_drop(param_1,param_3,pLVar5);
  if ((pLVar5->reagentchance) && (RollD(1,100) <= pLVar5->reagentchance)) {
    u8 uVar2 = rand_range(ItemInd_Spice,ItemInd_Gemstone);
    param_1->loot_pool->AddItem(itemID_array[uVar2],(u8)rand_range(pLVar5->reagentLlo,pLVar5->reagentHi));
    param_1->EXP_pool += (uint)gItemDBp->Gear[uVar2].exp_multi;
  }
  for(u32 i=0;i<6;i++) {get_exp_mod(param_1,pLVar5,i);}
}



void add_globalLoot(CombatStruct *param_1,ItemID param_2){
  if (param_2 >> 8 == DB_CHEST) calc_loot(param_1,GETINDEX(param_2),(Entity_Ram *)NULL);
  else param_1->loot_pool->AddItem(param_2,1);
  return;
}

void calc_combat_loot(CombatStruct *param_1)

{
  byte bVar6;
  int iVar5;
  bool bVar7;
  Entity_Ram *pEVar8;
  u8 i;
  
  param_1->loot_pool = new GenericInventory();
  param_1->gold_pool = 0;
  param_1->EXP_pool = 0;
  for(i = 0;i<12;i++){
    if (param_1->encounter_dat->enemy_entities[i]) {
      pEVar8 = gEntityDB->entities + (char)GETINDEX(param_1->encounter_dat->enemy_entities[i]);
      param_1->EXP_pool+=pEVar8->EXP;
      if (pEVar8->loot_Category) {
        calc_loot(param_1,GETINDEX((ItemID)(pEVar8->loot_Category + 0x7ff)),pEVar8);
      }
    }
  }
  if (gGlobals.EncounterDat.globalLoot) 
    add_globalLoot(param_1,gGlobals.EncounterDat.globalLoot);
  for(i=0;i<MAXPARTY;i++){
    CharSheet* pCVar1 = PARTY->Members[i];
    if ((pCVar1) && (!Entity::isDead(pCVar1))) {
      Entity::AddExp(pCVar1,param_1->EXP_pool);
    }
  }
  //double money earned
  param_1->gold_pool <<= 1;
}
void FUN_800675b0(CombatStruct *param_1){
  uint uVar4,uVar5;
  
  combat_turn_free(&param_1->turn);
  uVar5 = 0;
  if (param_1->EntCount) {
    do {
      CombatEntity *X = (&gCombatP->combatEnts)[uVar5++];
      if (X) {
        uVar4 = 0;
        while (uVar4 < 4) {
            if((PARTY->Members[uVar4])&&(X->charSheetP == PARTY->Members[uVar4])) {
              Entity::ResetEffects(X->charSheetP);
              break;
            }
            uVar4++;
        }
        if (uVar4 == 4) {
          Entity::ClearAllPotionEffects(X->charSheetP);
          Entity::RemoveAllEffects(X->charSheetP);
          Entity::Free(X->charSheetP);
          FREE(X->charSheetP,1662);
        }
        X->FreeAi();
        FREE(X,1668);
        (&gCombatP->combatEnts)[uVar5]=NULL;
      }
    } while (uVar5 < param_1->EntCount);
  }
  NOOP_80070c94(&param_1->substruct);
  NOOP_80072228(param_1->substruct2);
  NOOP_80072228(param_1->substruct2 + 1);
  if (param_1->loot_pool) {
    param_1->loot_pool->~GenericInventory();
    param_1->loot_pool = NULL;
  }
  if (param_1->textArray) {
    RomString::Free(param_1->textArray);
    param_1->textArray = NULL;
  }
}


void FUN_80067740(CombatStruct *param_1){
  init_combat_substruct2(param_1->substruct2,0);
  FUN_80072454(param_1->substruct2,param_1->current_Ent);
  init_combat_substruct2(param_1->substruct2 + 1,1);
  FUN_80072454(param_1->substruct2 + 1,param_1->current_Ent);
}


void copy_string_to_combat_textbox(CombatStruct *param_1,char *param_2,uint param_3){
  strcpy(param_1->textboxes[0],param_2);
  param_1->TextboxFlag|= param_3;
  CombatTextboxWidget_SetText(param_2);
}


char * print_combat_textbox(CombatStruct *param_1,char *param_2,uint param_3){
  char *pcVar1 = strcpy(param_1->textboxes[1],param_2);
  param_1->TextboxFlag|= param_3;
  return pcVar1;
}

char * copy_to_combat_textbox_2(CombatStruct *param_1,char *param_2,uint param_3){
  char *pcVar1 = strcpy(param_1->textboxes[2],param_2);
  param_1->TextboxFlag |= param_3;
  return pcVar1;
}

void passto_combat_widget_print_func(CombatStruct *param_1){
  CombatTextboxWidget_SetText(param_1->textboxes[0]);
}


void copy_to_textbox_1(CombatStruct *param_1){
  if ((param_1->TextboxFlag & 4)) {
    strcpy(param_1->textboxes[1],param_1->textboxes[2]);
    param_1->TextboxFlag&=~4;
  }
  copy_string_to_combat_textbox(param_1,param_1->textboxes[1],0);
}


void Ofunc_800678e8(CombatStruct *param_1){
  copy_string_to_combat_textbox(param_1,param_1->textboxes[2],0);
}


void check_battlefeild_fleeing_refpoints(CombatStruct *param_1){
  char buff [88];
  
  param_1->hasFleeRefpoints = 0;
  for(u32 uVar2=0;uVar2<8;uVar2++) {
    sprintf(buff,gCombatP->textArray[COMBATSTRING_FleeX],uVar2);
    voxelObject* prVar1 = FindReferncePointName(gGlobals.gameVars.borg9DatPointer,buff,false);
    if (prVar1) {
      param_1->hasFleeRefpoints = true;
      return;
    }
  }
}

bool renderTicker_GreaterThan3(CombatStruct *param_1){return 3 < (uint)param_1->renderTicker;}