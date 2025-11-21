#include "globals.h"
#include "skyObjects.h"
#include "combat/CombatStruct.h"
#include "combat/CombatStat.h"
#include "combat/SpellMarker.h"
#include "combat/Visuals.h"
#include "combat/markers.h"
#include "combat/CombatCamera.h"
#include "voxelChart.h"
#include "vobjects.h"
#include "memaker.h"
#include "gameover.h"

#define FILENAME "./src/gamecombat.cpp"

u32 some_combat_flag_ =false;
u32 load_combatstruct_flag=true;
u32 clear_combatstruct_flag=false;
u16 DAT_800e9b6c=0;
float FLOAT_800e9b70=0;
float FLOAT_800e9b74=0;
float FLOAT_800e9b78=0;
float FLOAT_800e9b7c=0;
float FLOAT_800e9b80=0;
float FLOAT_800e9b84=0;
SceneData* SceneDataP=NULL;
u32 gCombatHideMarkers=false;
u16 gCombatEndWaitTimer=0;
u8 (*combat_byte_funcs[])(Gfx**,u16)=
    {combat_byte_func_0,FUN_80028ff0,FUN_80027f1c,FUN_800282cc,FUN_800286d8,FUN_80028778,
    FUN_80028940,FUN_80028aec,FUN_80028b88,FUN_80028ff0,FUN_80028ff0,FUN_80028ff0,combat_byte_func_12,
    Goblin_ambush_check,combat_byte_func_14,FUN_80028ff0,combat_byte_func_16,pass_to_alaron_boost,
    FUN_80028ebc,combat_byte_func_19,combat_byte_func_20,combat_byte_func_21,FUN_80028f78,FUN_80028fd4,
    FUN_80029028,FUN_80028ff0,FUN_80029088,combat_byte_func_27,FUN_80029128,FUN_80029168,combat_byte_func_30,
    combat_byte_func_31};
u16 DAT_800e9c14=0;
vec3f combatVec3A,combatVec3B,vec3f_800f53f0,vec3f_800f5400;

void Combat_SetHideMarkers(u32 param_1){gCombatHideMarkers = param_1;}

void Set_keelover_aniType(playerData *param_1){
  if (param_1) {
    param_1->ani_type = AniType_Dying;
    param_1->unk18 = 9;
  }
}

void Print_damage_healing(playerData *PDAT,short DMG,short Healing,bool isdead,CharSheet *param_5){
  if (DMG) {
    CombatStatIndicator::AddItem(PDAT,0,DMG);
    if (PDAT->borg7P) {
      if (!Scene::HasLocator(PDAT->borg7P->sceneDat,3)) {
        char acStack_210 [528];
        sprintf(acStack_210,"The actor (borgID = %s) for %s doesn't have a locator 3 for the blood effect",
                    PDAT->borg7P->sceneDat->borg5_char,param_5->name);
        CRASH(acStack_210,FILENAME);
      }
    }
  }
  if (Healing) CombatStatIndicator::AddItem(PDAT,1,Healing);
}

Gfx * FUN_80027aa8(Gfx *param_1){
  if (SceneDataP) {
    MtxF afStack88;
    Scene::MatrixARotate(SceneDataP,0.0,FLOAT_800e9b84,0.0);
    guAlignF(&afStack88,0.0,vec3f_800f53f0.x,vec3f_800f53f0.y,vec3f_800f53f0.z);
    guMtxCatF(SceneDataP->matrixA,afStack88,SceneDataP->matrixA);
    float fVar1 = __sinf((FLOAT_800e9b80 / FLOAT_800e9b70) * 3.14159f);
    Scene::MatrixASetPos
              (SceneDataP,vec3f_800f5400.x,vec3f_800f5400.y + FLOAT_800e9b78 * fVar1,
               vec3f_800f5400.z);
    SetSceneColors(SceneDataP,0xff,1,0x0);
    fVar1 = gEntityDB->GetScale(gCombatP->current_Ent->charSheetP->ID);
    Scene::MatrixANormalizeScale(SceneDataP,fVar1,fVar1,fVar1);
    param_1 = BorgAnimDrawScene(param_1,SceneDataP);
  }
  return param_1;
}

Gfx * FUN_80027bf0(Gfx *g,u16 delta,CharSheet *param_3){
  u8 delta_00;
  u8 range;
  
  SpellInstance* spell = Entity::GetSpell(param_3);
  if (gGlobals.combatBytes[0] == 0xb) {
    if (spell != NULL) {
      range = Entity::CheckSpellWizard(param_3,spell);
      if (GETINDEX((spell->base).id) == SPELLIND_teleportation) range = 1;
      g = CombatSpellMarker::Tick(g,(u8)delta,range,0xff0000ff);
    }
  }
  else if (gGlobals.combatBytes[0] == 10) {
    if (spell != NULL) {
      g = CombatSpellMarker::Tick(g,(u8)delta,
         spell->range * Entity::CheckSpellWizard(param_3,spell),0xff0000ff);
    }
  }
  else if (gGlobals.combatBytes[0] == 0x12) {
    g = CombatSpellMarker::Tick(g,(u8)delta,1,0x00ff00ff);
  }
  return g;
}


Gfx * Combat_Render(Gfx *gfx,short delta){  
  CharSheet *pCVar1 = gCombatP->current_Ent->charSheetP;
  playerData *player = gGlobals.playerDataArray[gCombatP->current_Ent->index];
  Gfx *g = gfx;
  g = Graphics::StartDisplay(gfx,FULL_SCREENSPACE);
  if (gGlobals.combatBytes[0] - 10 < 2) CombatTargetVisuals::Render(true,delta);
  else CombatTargetVisuals::Render(false,delta);
  g = Lensflare::Render(g);
  handleZoneEngineFrame(&g,delta,player);
  g = FUN_80027aa8(g);
  if (gCombatHideMarkers == 0) g = CombatMarkers::RenderMarkers(g,delta);
  g = FUN_80095f1c(g,delta);
  g = ret_a0_80094204(g);
  g = CombatAttackVisuals::Render(g,(int)delta);
  g = CombatStatIndicator::Tick(g,(int)delta);
  g = FUN_80027bf0(g,delta,pCVar1);
  g = FUN_8008f6e4(g,(u8)delta);
  g = N64Print::Draw(g,delta);
  refersh_terrain_check_anidat_alaronMerge();
  gCombatP->renderTicker++;
  return g;
}

u8 combat_byte_func_0(Gfx **GG,u16 delta){
  clear_combatstruct_flag = 1;
  return 0;
}

bool FUN_80027eb0(Gfx **GG,u16 param_2){
  CombatEntity **ppCVar1;
  CombatStruct *pCVar2;
  uint uVar3;
  
  pCVar2 = gCombatP;
  ppCVar1 = &gCombatP->current_Ent;
  uVar3 = gCombatP->AniTimer + (uint)param_2;
  gCombatP->AniTimer = uVar3;
  if (((*ppCVar1 != NULL) && (gGlobals.playerDataArray[(*ppCVar1)->index] != NULL)) &&
     (gGlobals.playerDataArray[(*ppCVar1)->index]->unk18 == 0)) {
    if (30 <= uVar3) {
      pCVar2->AniTimer = 0;
      return true;
    }
    return false;
  }
  return false;
}

u8 FUN_80027f1c(Gfx **GG,u16 delta){
  byte bVar1;
  CombatEntity *pCVar2;
  CombatEntity *pCVar3;
  playerData *PDAT;
  CharSheet *pCVar4;
  
  bVar1 = gCombatP->some_index;
  pCVar2 = gCombatP->current_Ent;
  pCVar3 = (&gCombatP->combatEnts)[bVar1];
  if (FUN_80027eb0(GG,delta)) {
    PDAT = gGlobals.playerDataArray[bVar1];
    if (PDAT == NULL) return 2;
    if ((pCVar2->throwingFlag) && (gCombatP->substruct2[0].arrayBCount)){
      bVar1 = pCVar2->AtkType;
      if (((bVar1 == 2) || (bVar1 == 4)) || (bVar1 == 3)) {
        gamecombat_weapon_func();
        gGlobals.combatBytes[0] = 3;
        (gCombatP->SpellMarkerPos).x = pCVar2->GetCoordX();
        (gCombatP->SpellMarkerPos).y = pCVar2->GetCoordY();
        return 2;
      }
    }
    if (pCVar3->damage == 0) {
      if (pCVar2->Flag4() == pCVar3->Flag4()) {
        pCVar4 = pCVar3->charSheetP;
        PDAT->ani_type = 10;
        Print_damage_healing(PDAT,0,(ushort)pCVar3->Healing,Entity::isDead(pCVar4),pCVar3->charSheetP);
      }
      else PDAT->ani_type = 8;
    }
    else func_keel_over_after_ambush(pCVar3,PDAT);
    if (Entity::isDead(pCVar3->charSheetP)) Set_keelover_aniType(PDAT);
    gGlobals.combatBytes[0] = 4;
    copy_to_textbox_1(gCombatP);
  }
  *GG = Combat_Render(*GG,delta);
  return 2;
}

void func_keel_over_after_ambush(CombatEntity *param_1,playerData *param_2){
  Entity::DamageToLevel(param_1->charSheetP,param_1->damage,param_1);
  param_2->ani_type = AniType_Hit;
  if (((gGlobals.EncounterDat.EncounterID == FLAG_GoblinAmbush) && (param_1->index == 0)) &&
     (gGlobals.GoblinHitTally == 0)) {
    Set_keelover_aniType(param_2);
  }
  Print_damage_healing(param_2,param_1->damage,0,Entity::isDead(param_1->charSheetP),param_1->charSheetP);
  param_1->damage = 0;
  param_1->Healing = 0;
}

void FUN_80028180(void){
  CombatEntity *user = gCombatP->current_Ent;
  CombatEntity *target = (&gCombatP->combatEnts)[gCombatP->some_index];
  playerData *PDAT = gGlobals.playerDataArray[gCombatP->some_index];
  if (user->AtkType == 3) user->FlaskAttack(target,(ushort)user->damage);
  if (target->damage == 0) {
    if (user->Flag4() == target->Flag4()) {
      PDAT->ani_type = AniType_10;
      Print_damage_healing(PDAT,0,(ushort)target->Healing,Entity::isDead(target->charSheetP),target->charSheetP);
    }
    else PDAT->ani_type = AniType_8;
  }
  else func_keel_over_after_ambush(target,PDAT);
  if (Entity::isDead(target->charSheetP)) Set_keelover_aniType(PDAT);
  FREEQSCENE(SceneDataP);
  user->ShowWeaponSheild();
  copy_to_textbox_1(gCombatP);
  gGlobals.combatBytes[0] = 4;
}


u8 FUN_800282cc(Gfx **GG,u16 delta){
  gCombatP->AniTimer +=delta;
  if (SceneDataP == NULL) {
    if (30 <= gCombatP->AniTimer) FUN_80028180();
  }
  else {
    if (FLOAT_800e9b80 < FLOAT_800e9b70) {
      float deltaf = (float)delta;
      vec3f_800f5400.x += vec3f_800f53f0.x * deltaf;
      vec3f_800f5400.y += vec3f_800f53f0.y * deltaf;
      FLOAT_800e9b80 += FLOAT_800e9b74 * deltaf;
      vec3f_800f5400.z += vec3f_800f53f0.z * deltaf;
      FLOAT_800e9b84 += FLOAT_800e9b7c * deltaf;
    }
    else if (30 <= gCombatP->AniTimer) {
      gCombatP->AniTimer = 0;
      FUN_80028180();
    }
  }
  *GG = Combat_Render(*GG,delta);
  return 2;
}

void some_death_func_B(playerData *param_1,u8 param_2,CombatEntity *param_3){
  if (param_1) {
    param_3->ClearSpellEffects();
    Entity::ClearAllPotionEffects(param_3->charSheetP);
    FUN_80096048(param_1);
    FUN_80094228(param_1);
    Actor::DeathFlag(param_1);
    pass_to_draw_crossbones(param_1->ent_ID,param_2);
    gGlobals.playerDataArray[param_2] = NULL;
    u8 index = GETINDEX(param_1->ent_ID);
    if (index == EntInd_Shadow) clear_shadow_index();
    if (index == EntInd_Alaron) clear_alaron_index();
  }
}


void FUN_800284d4(void){
  byte bVar1;
  CombatEntity *pCVar2;
  playerData *ppVar3;
  CombatEntity *pCVar4;
  char cVar5;
  bool bVar6;
  u8 uVar7;
  u8 uVar8;
  
  bVar1 = gCombatP->some_index;
  pCVar2 = gCombatP->current_Ent;
  cVar5 = gCombatP->substruct2[0].arrayBCount + gCombatP->substruct2[1].arrayBCount;
  ppVar3 = gGlobals.playerDataArray[bVar1];
  pCVar4 = (&gCombatP->combatEnts)[bVar1];
  if ((((cVar5 != '\0') && (ppVar3 != NULL)) && (ppVar3->unk18 == 0)) &&
     (0x3b < (uint)gCombatP->AniTimer)) {
    gCombatP->AniTimer = 0;
    Actor::UnsetFlag(ppVar3,ACTOR_800);
    if (Entity::isDead(pCVar4->charSheetP)) some_death_func_B(ppVar3,bVar1,pCVar4);
    ppVar3 = gGlobals.playerDataArray[pCVar2->index];
    if (ppVar3 == NULL) {
      ppVar3 = gGlobals.playerDataArray[bVar1];
      if (ppVar3) GiveCameraToPlayer(ppVar3);
    }
    else {
      Actor::UnsetFlag(ppVar3,ACTOR_800);
      GiveCameraToPlayer(ppVar3);
    }
    clear_arrayB_entry(gCombatP->substruct2,bVar1);
    clear_arrayB_entry(gCombatP->substruct2 + 1,bVar1);
    if ((cVar5 != 1)) {
      for(u8 i=0;i<gCombatP->EntCount;i++){
        if (gCombatP->substruct2[0].arrayB[i]) {
          gCombatP->some_index = i;
LAB_8002864c:
          if (i == pCVar2->index) {
            gGlobals.combatBytes[0] = 6;
            return;
          }
          pCVar4 = (&gCombatP->combatEnts)[i];
          pCVar2->AdjustFacing(pCVar4->GetCoordXU8(),pCVar4->GetCoordYU8());
          pCVar2->m80068e38();
        }
        if (gCombatP->substruct2[1].arrayB[i]) {
          gCombatP->some_index = i;
          goto LAB_8002864c;
        }
      }
    }
  }
}

u8 FUN_800286d8(Gfx** GG,u16 delta){
  gCombatP->AniTimer+=delta;
  FUN_800284d4();
  if ((byte)(gCombatP->substruct2[0].arrayBCount + gCombatP->substruct2[1].arrayBCount) == 0) {
    if (!gCombatP->SenseAuraWidget) gCombatP->current_Ent->EndTurn();
  }
LAB_8002874c:
  *GG=Combat_Render(*GG,delta);
  return 2;
}

u8 FUN_80028778(Gfx **GG,u16 delta){
  CombatEntity *pCVar2 = gCombatP->current_Ent;
  playerData *ppVar3 = gGlobals.playerDataArray[pCVar2->index];
  Vec3Copy(&(ppVar3->collision).pos,&combatVec3B);
  if ((((u8)(Vec3Dist(&combatVec3B,&combatVec3A)*100.0f)) < 3) || ((ppVar3->borg7P->unk2c).z < NORMALIZE_MIN)) {
    gCombatP->waitTimer-= delta;
  }
  if ((ppVar3->flags & ACTOR_CANMOVE) == 0) {
    gGlobals.combatBytes[0] = gGlobals.combatBytes[1];
    if (gGlobals.combatBytes[1] == 8) {
      pCVar2->m80068e38();
      gGlobals.combatBytes[0] = 6;
    }
    else pCVar2->EndTurn();
  }
  else if (gCombatP->waitTimer < 1) {
    if (!pCVar2->aiP) pCVar2->EndTurn();
    else FUN_800645b4(pCVar2->aiP);
  }
  Vec3Copy(&combatVec3B,&combatVec3A);
  *GG = Combat_Render(*GG,delta);
  return 2;
}


u8 FUN_80028940(Gfx **GG,u16 delta){
  CombatEntity *user;
  CombatEntity *target;
  uint uVar1;
  Gfx *pGVar2;
  
  user = gCombatP->current_Ent;
  if (user != NULL) {
    uVar1 = (uint)gCombatP->some_index;
    target = (&gCombatP->combatEnts)[uVar1];
    if (gGlobals.playerDataArray[user->index] == NULL) user->EndTurn();
    else {
      if ((gGlobals.playerDataArray[user->index]->flags & ACTOR_CANROTATE) == 0) {
        user->SetPlayerRotate();
        gGlobals.combatBytes[0] = gGlobals.combatBytes[1];
        if (gGlobals.combatBytes[1] == 8) {
          FUN_800645b4(user->aiP);
        }
        else if (!gCombatP->substruct2[0].arrayB[uVar1]) {
          if (user->charSheetP->spellVal < 0) {
            if ((user->aiP == NULL) ||
               (!gCombatP->substruct2[1].arrayB[uVar1])) {
              user->EndTurn();
            }
            else user->CalculateAttack(target,false);
          }
          else user->CalculateAttack(target,false);
        }
        else user->CalculateAttack(target,true);
      }
      *GG = Combat_Render(*GG,delta);
    }
  }
  return 2;
}

u8 FUN_80028aec(Gfx **GG,u16 delta){
  if ((gGlobals.playerDataArray[gCombatP->current_Ent->index]->flags & ACTOR_CANROTATE) == 0) {
    gCombatP->current_Ent->SetPlayerRotate();
    gCombatP->current_Ent->m80068dd8();
    gGlobals.combatBytes[0] = 5;
  }
  *GG = Combat_Render(*GG,delta);
  return 2;
}

u8 FUN_80028b88(Gfx **GG,u16 delta){
  FUN_80064494(gCombatP->current_Ent->aiP);
  *GG = Combat_Render(*GG,delta);
  return 2;
}

u8 combat_byte_func_12(Gfx **GG,u16 delta){
  if (gGlobals.screenFadeMode == 0) {
    clear_combatstruct_flag = 1;
    if (gGlobals.EncounterDat.field3_0x1c) {
      setEventFlag(gGlobals.EncounterDat.EncounterID,true);
      if ((FUN_80015128(gGlobals.EncounterDat.VoxelFlagA,gGlobals.EncounterDat.VoxelBitfield))
        && (!getEventFlag(gGlobals.EncounterDat.EncounterID))) {
          WriteTo_VoxelChart(gGlobals.EncounterDat.VoxelIndex,(u8)gGlobals.EncounterDat.mapDatA,
                           (u8)gGlobals.EncounterDat.MapSAhortA,(u8)gGlobals.EncounterDat.MapShortB,ZoneCenter,5,3);
      }
    }
    set_boss_flag();
    gGlobals.screenFadeMode = 2;
    gGlobals.combatBytes[1] = 0xf;
    DAT_800e9b6c = 0;
    passto_getSnapshot();
    build_loot_menu(gCombatP->loot_pool,gCombatP->gold_pool,-1);
    gCombatP->loot_pool = NULL;
    gGlobals.combatBytes[1] = 0x10;
    gGlobals.expGained = gCombatP->EXP_pool;
    return 6;
  }
  else {
    gCombatHideMarkers = true;
    *GG = Combat_Render(*GG,delta);
    return 2;
  }
}

u8 Goblin_ambush_check(Gfx **GG,u16 delta){
  u8 ret;
  if (gGlobals.screenFadeMode == 0) {
    if (gGlobals.goblinAmbush){
      setEventFlag(gGlobals.EncounterDat.EncounterID,true);
      if (gGlobals.EncounterDat.field3_0x1c) {
        WriteTo_VoxelChart(gGlobals.EncounterDat.VoxelIndex,
                           (u8)gGlobals.EncounterDat.mapDatA,
                           (u8)gGlobals.EncounterDat.MapSAhortA,
                           (u8)gGlobals.EncounterDat.MapShortB,0x11,VOXEL_MonsterParty,3);
      }
      Calendar temp; //set time to 6AM next day
      World::GetCalendarDate(TerrainPointer,&temp);
      temp.hour = 6;
      temp.minute = 0;
      temp.second = 0;
      temp.day++;
      World::SetTimeFromCalendar(TerrainPointer,&temp);
      ret = 1;
      clear_combatstruct_flag = true;
    }
    else {
      Gameover_func();
      ret = 2;
    }
  }
  else return FUN_80028ff0(GG,delta);
  return ret;
}

u8 combat_byte_func_14(Gfx **GG,u16 delta){
  if (DAT_800e9b6c < 2) return 2;
  else {
    FreeZoneEngineMemory();
    gGlobals.combatBytes[1] = 1;
    GetSnapshot_();
    gGlobals.BackgroundTypeCopy = gGlobals.sky.Type;
    gPartyPicker = gCombatP->current_Ent->index;
    return 3;
  }
}

u8 combat_byte_func_16(Gfx **GG,u16 delta){
  clear_combatstruct_flag = 1;
  return 1;
}

u8 pass_to_alaron_boost(Gfx **GG,u16 delta){
  ShadowMergeBoost(gGlobals.ShadowIndex);
  clear_combatstruct_flag = 1;
  return 0xe;
}

u8 FUN_80028ebc(Gfx **GG,u16 delta){
  *GG = Combat_Render(*GG,delta);
  return 2;
}

u8 combat_byte_func_19(Gfx **GG,u16 delta){ 
  gCombatP->current_Ent->EndTurn();
  *GG = Combat_Render(*GG,delta);
  return 2;
}

u8 combat_byte_func_20(Gfx **GG,u16 delta){
  clear_combatstruct_flag = 1;
  gGlobals.gameVars.unk120e = 1;
  return 1;
}

u8 combat_byte_func_21(Gfx **GG,u16 delta){
  clear_combatstruct_flag = 1;
  return 0xc;
}

u8 FUN_80028f78(Gfx **GG,u16 delta){
  *GG = Combat_Render(*GG,delta);
  *GG = Combat_RenderCVertMenu(*GG,delta);
  FUN_80091528(delta);
  return 2;
}

u8 FUN_80028fd4(Gfx **GG,u16 delta){return FUN_80028f78(GG,delta);}

u8 FUN_80028ff0(Gfx **GG,u16 delta){
  *GG = Combat_Render(*GG,delta);
  return 2;
}

byte FUN_80029028(Gfx **param_1,u16 delta){
  gCombatEndWaitTimer-=delta;
  if ((s16)gCombatEndWaitTimer < 1) gCombatP->current_Ent->EndTurn();
  return FUN_80028ff0(param_1,delta);
}

u8 FUN_80029088(Gfx **GG,u16 delta){return FUN_80029028(GG,delta);}

void FUN_800290a4(){
  byte bVar1 = gGlobals.combatBytes[0];
  gGlobals.combatBytes[0] = 0x1b;
  gGlobals.combatByteMirror = bVar1;
}

u8 combat_byte_func_27(Gfx **GG,u16 delta){
  u8 uVar1;
  
  if (DAT_800e9b6c < 2) uVar1 = 2;
  else {
    if (gExpPakFlag == 0) FreeZoneEngineMemory();
    GetSnapshot_();
    uVar1 = 3;
    gGlobals.unk14fc = true;
    gGlobals.BackgroundTypeCopy = gGlobals.sky.Type;
  }
  return uVar1;
}

u8 FUN_80029128(Gfx **GG,u16 delta){
  u8 bVar1;
  if (DAT_800e9b6c < 120) bVar1 = FUN_80028ff0(GG,delta);
  else {
    combat_byte_0xd();
    bVar1 = 2;
  }
  return bVar1;
}

u8 FUN_80029168(Gfx **GG,u16 delta){
  u8 bVar2 = FUN_80028ff0(GG,delta);
  if (60 <= ++gCombatP->TurnCount) {
    gCombatP->TurnCount = 0;
    gGlobals.screenFadeMode = 1;
    gGlobals.combatBytes[0] = 0x1e;
  }
  return bVar2;
}


u8 combat_byte_func_30(Gfx **GG,u16 delta){
  u8 bVar1;
  
  if (gGlobals.screenFadeMode == 0) {
    bVar1 = 1;
    clear_combatstruct_flag = 1;
    gGlobals.screenFadeMode = 2;
  }
  else bVar1 = FUN_80028ff0(GG,delta);
  return bVar1;
}

u8 combat_byte_func_31(Gfx **GG,u16 delta){
  u8 bVar1 = FUN_80028ff0(GG,delta);
  if (gGlobals.screenFadeMode == 0) {
    u8 bStack_45 [] [4]={{0,0,0,1},{0,0,0,8}}; //? u32[2] cast to u8[2][4]?
    gGlobals.combatBytes[0] = bStack_45[gCombatP->current_Ent->aiP != NULL][3];
  }
  return bVar1;
}
bool fleeing_reinforcements_func(void){
  bool bVar3 = false;
  if (gCombatP->reinforcmentsWillFlee) {
    CombatTextboxWidget_SetText(ComString(ReinforceFlee));
   gCombatP->TurnCount+= gGlobals.delta;
    bVar3 = true;
    if (60 <= gCombatP->TurnCount) {
      gCombatP->TurnCount = 0;
      gCombatP->reinforcmentsWillFlee = 0;
      passto_combat_widget_print_func(gCombatP);
      bVar3 = true;
    }
  }
  return bVar3;
}

u8 ScreenFadeMode_2(Gfx **GG){
  u8 uVar3;
  
  init_combat_struct();
  uVar3 = 2;
  if (!FUN_8000c9e0()) {
    if ((((gGlobals.combatBytes[0] - 0xe < 2) || (gGlobals.combatBytes[0] == 0xc)) ||
        (gGlobals.combatBytes[0] == 0x1b)) || (gGlobals.combatBytes[0] == 0x1c)) {
      DAT_800e9b6c++;
    }
    else DAT_800e9b6c = 0;
    int delta = combat_controls();
    gGlobals.delta = (float)delta;

    if (fleeing_reinforcements_func()) uVar3 = FUN_80028ff0(GG,(u16)delta);
    else {
      uVar3 = (*combat_byte_funcs[gGlobals.combatBytes[0]])(GG,(u16)delta);
      clear_combat_func();
    }
  }
  return uVar3;
}

void combat_start_turn_(void){
  CombatEntity *pCVar1 = gCombatP->current_Ent;
  CSprintf(XsTurn,pCVar1->charSheetP->name);
  copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
  pCVar1->SetMovementRange();
  CombatMarkers::Create(pCVar1);
  pCVar1->m8006f448();
}

void init_combat_struct(void){
  if (load_combatstruct_flag) {
    some_combat_flag_ = true;
    //unload data just to reload it? why?
    MemoryMaker::Unload();
    MemoryMaker::Reload();
    if (gExpPakFlag == 0) set_AnimCache(1);
    gCombatHideMarkers = 0;
    load_combatstruct_flag = 0;
    Vec3Set(&combatVec3A,0.0,0.0,0.0);
    Vec3Set(&combatVec3B,0.0,0.0,0.0);
    clear_alaron_shadow_indices();
    CLEAR(&gGlobals.playerDataArray);
    ALLOC(gCombatP,1745);
    memset_combat_struct(gCombatP);
    //ganerate random encounter if something went wrong.
    if (gGlobals.combatBytes[2] == 0) {
      random_enemy_generator();
      gGlobals.EncounterDat.globalLoot= Loot_LizardBoss;
      gGlobals.EncounterDat.EncounterID = 0;
      gGlobals.EncounterDat.battlefield = rand_range(0,0x1b);
      gGlobals.EncounterDat.collisionByte = rand_range(0,2);
      gGlobals.EncounterDat.aniByte = rand_range(0,EncountAni_Run);
      gGlobals.EncounterDat.BossShadow = 1;
    }
    for(u8 i=0;i<14;i++) {gGlobals.playerDataArray[i] = 0;}
    gGlobals.gameVars.mapDatA = MAPA_Battle;
    gGlobals.gameVars.mapDatC = 0;
    gGlobals.gameVars.mapDatB = (ushort)gGlobals.EncounterDat.battlefield;
    InitZoneEngine(1,0);
    Sky::ResetColors();
    Combat_InitEncounter(gCombatP,&gGlobals.EncounterDat);
    combat_gui_init();
    for(u32 i=0;i<gCombatP->EntCount;i++){combatEnt_setup(gCombatP,i);}
    FUN_80067740(gCombatP);
    CSprintf(XsTurn,gCombatP->current_Ent->charSheetP->name);
    copy_string_to_combat_textbox(gCombatP,gGlobals.text,0);
    playerData* ppVar1 = gGlobals.playerDataArray[gCombatP->current_Ent->index];
    if (ppVar1) {
      Camera::SetPos(gGlobals.gameVars.PlayerHandler.camera,&(ppVar1->collision).pos);
      GiveCameraToPlayer(ppVar1);
    }
    clear_camera_playerdata_focus();
    CombatTargetVisuals::Init();
    CombatAttackVisuals::Init();
    CombatStatIndicator::Init();
    NOOP_800941E0();
    InitSpellVisuals();
    CombatMarkers::Init();
    gGlobals.combatBytes[0] = 0x1f;
    gGlobals.screenFadeMode = 2;
    gGlobals.goblinAmbush = false;
    gGlobals.brightness = 0.0;
    gGlobals.GoblinHitTally = 0;
    gGlobals.screenFadeSpeed = (1.0f/60);
    if (gGlobals.EncounterDat.EncounterID == FLAG_GoblinAmbush) {
      gGlobals.goblinAmbush = true;
      gGlobals.GoblinHitTally = 2;
      CharSheet* pCVar2 = PARTY->Members[0];
      Entity::addHP(pCVar2,Entity::getHPMax(pCVar2) - (short)Entity::getHPCurrent(pCVar2));
    }
    CombatSpellMarker::Init();
    combat_start_turn_();
    init_combatSkill_itemValues();
    gGlobals.combatByteMirror = 0;
  }
}

void clear_combat_func(){
  playerData *ppVar2;
  int iVar4;
  u16 uVar7;
  u8 i;
  bool bVar8;
  undefined4 *puVar9;
  
  if (clear_combatstruct_flag) {
    load_combatstruct_flag = 1;
    clear_combatstruct_flag = 0;
    gGlobals.EncounterDat.field3_0x1c = 0;
    gGlobals.combatBytes[2] = 0;
    setCombatCameraMode(0);
    NOOP_80091404();
    if (gGlobals.EncounterDat.EncounterID == FLAG_GoblinAmbush) {
                    // heal after goblin ambush
      CharStats::addModdedHealth(PARTY->Members[0]->Stats,STAT_STR,CharStats::getBase(PARTY->Members[0]->Stats,STAT_STR));
      setEventFlag(FLAG_MeetOriana,true);
      //move to bed in Oriana's Hut
      gGlobals.gameVars.MapFloatDatEntry.mapDatA = MAPA_Interior;
      gGlobals.gameVars.MapFloatDatEntry.mapDatB = 0;
      gGlobals.gameVars.MapFloatDatEntry.mapDatC = 0;
      gGlobals.gameVars.MapFloatDatEntry.MapShort1 = 5;
      gGlobals.gameVars.MapFloatDatEntry.MapShort2 = 3;
      Vec3Set(&gGlobals.gameVars.MapFloatDatEntry.playerVec3,5.9f,0.5f,3.0f);
      Vec2Set(&gGlobals.gameVars.MapFloatDatEntry.playerVec2,1.0f,0.0f);
      Vec3Copy(&gGlobals.gameVars.MapFloatDatEntry.playerVec3,&gGlobals.gameVars.MapFloatDatEntry.cameraVec3);
      CharSheet *alaron = PARTY->GetMemberById(IDEntInd(EntInd_Alaron));
      if (alaron) {
        Entity::addHP(alaron,Entity::getHPMax(alaron) - (s16)Entity::getHPCurrent(alaron));
      }
    }
    set_memUsedMirror();
    for(i=0;i<gCombatP->EntCount;i++) {
        CombatEntity *pCVar1 = (&gCombatP->combatEnts)[i];
        if ((pCVar1) && (pCVar1->charSheetP)) {
          if (PARTY->HasEntity(pCVar1->charSheetP)) Entity::ResetEffects(pCVar1->charSheetP);
          else {
            pCVar1->ClearSpellEffects();
            Entity::ClearAllPotionEffects(pCVar1->charSheetP);
          }
        }
    }
    CombatTargetVisuals::Free();
    CombatAttackVisuals::Free();
    CombatStatIndicator::Free();
    NOOP_80094244();
    combatspellvisuals_free();
    CombatMarkers::Free();
    combatgui_free();
    for(i=0;i<14;i++) {
      ppVar2 = gGlobals.playerDataArray[i];
      if (ppVar2) {
        Actor::FreePlayer(ppVar2);
        ppVar2=NULL;;
      }
    }
    FUN_800675b0(gCombatP);
    FREE(gCombatP,1968);
    FreeZoneEngine(0);
    DAT_800e9c14 = 1;
    clear_sfx_entries(&gGlobals.SFXStruct,1);
    if (SceneDataP) FREEQSCENE(SceneDataP);
    CombatSpellMarker::Free();
    some_combat_flag_ = 0;
    PARTY->BringOutYourDead();
    if (gExpPakFlag == 0) set_AnimCache(3);
  }
}

void refersh_terrain_check_anidat_alaronMerge(){
  u16 i = 0;
  if (gCombatP->EntCount != 0) {
    do {
      playerData *pDat = gGlobals.playerDataArray[i];
      if (pDat) {
        switch(pDat->ani_type) {
        case AniType_0:
        case AniType_1:
        case AniType_Walk:
        case AniType_Run:
        case AniType_20:
        case AniType_21:
        case AniType_22:
        case AniType_Sneak:
          break;
        default:
          pDat->ani_type = AniType_0;
        }
      }
      i++;
    } while (i < gCombatP->EntCount);
  }
  World::SetTerrain(TerrainPointer,World::getTerrain(TerrainPointer));
  alaron_shadow_merge_attempt();
}


void FUN_80029ba8(void){
  gGlobals.combatBytes[0] = 0x18;
  gCombatEndWaitTimer = 120;
}

void gamecombat_weapon_func(){
  byte bVar1;
  CombatEntity *pCVar2;
  playerData *ppVar3;
  bool bVar4;
  float fVar5;
  float fVar6;
  
  vec3f fStack120;
  vec3f local_38;
  
  pCVar2 = gCombatP->current_Ent;
  ppVar3 = gGlobals.playerDataArray[pCVar2->index];
  if (ppVar3->borg7P != NULL) {
    if (!Scene::HasLocator(ppVar3->borg7P->sceneDat,(uint)pCVar2->wepLocator)) {
      char txtBuff [0x100];
      sprintf(txtBuff,"The actor for %s doesn't have a weapon locator (%d)!\nBorg ID = %s",pCVar2->charSheetP->name,
                  pCVar2->wepLocator,ppVar3->borg7P->sceneDat->borg5_char);
      CRASH(txtBuff,FILENAME);
    }
  }
  SceneDataP = pCVar2->GetWeaponScene();
  if (SceneDataP) {
    Scene::SetFlag40(SceneDataP);
    Scene::SetFlag4(SceneDataP);
    Scene::SetFogFlag(SceneDataP);
    FreeAttachmentFromPlayer(ppVar3,0);
    Scene::SceneGetLocatorPos(ppVar3->borg7P->sceneDat,&vec3f_800f5400,pCVar2->wepLocator);
    bVar1 = gCombatP->some_index;
    ppVar3 = gGlobals.playerDataArray[bVar1];
    if (ppVar3) {
      Vec3Copy(&(ppVar3->collision).pos,&fStack120);
      if (pCVar2->AtkType != 3) {
        fStack120.y += (gEntityDB->GetHeight((&gCombatP->combatEnts)[bVar1]->charSheetP->ID) * 0.5f - (ppVar3->collision).radius);
      }
      fVar5 = 4.0f;
      local_38.z = 0.0;
      local_38.x = 4.0f;
      local_38.y = 8.0f;
      CombatEntity::GetWeaponRanges(pCVar2,&local_38.x,&local_38.y,&local_38.z);
      Vec3Sub(&vec3f_800f53f0,&fStack120,&vec3f_800f5400);
      FLOAT_800e9b70 = Vec3Normalize(&vec3f_800f53f0);
      fVar6 = 2.0f;
      if (FLOAT_800e9b70 <= 40.0f) {
        fVar6 = (FLOAT_800e9b70 / 40.0f) * fVar5 + -2.0f;
      }
      fVar6 = local_38.x + fVar6;
      if (((10.0f < fVar6) ||
          (FLOAT_800e9b74 = 0.05f, 1.0f <= fVar6)) &&
         (FLOAT_800e9b74 = 0.5f, fVar6 <= 10.0f)) {
        FLOAT_800e9b74 = fVar6 * 0.05f;
      }
      fVar5 = 4.0f;
      if (FLOAT_800e9b70 <= 40.0f) {
        fVar5 = (FLOAT_800e9b70 / 40.0f) * 8.0f + -4.0f;
      }
      fVar5 = (10.0f - local_38.x) + fVar5;
      if (((10.0f < fVar5) ||
          (FLOAT_800e9b78 = 0.7f, 1.0f <= fVar5)) &&
         (FLOAT_800e9b78 = 7.0f, fVar5 <= 10.0f)) {
        FLOAT_800e9b78 = fVar5 * 0.7f;
      }
      FLOAT_800e9b80 = 0.0;
      FLOAT_800e9b7c = local_38.y;
      FLOAT_800e9b84 = local_38.z;
      Vec3Scale(&vec3f_800f53f0,FLOAT_800e9b74);
    }
  }
}

void random_enemy_generator(){
  u16 i;
  u16 size = rand_range(1,0xc);
  for(i=0;i<size;i++){
    bool canFight=false;
    while(!canFight) {
      ItemID id = gEntityDB->entities[rand_range(0,gEntityDB->total - 1)].ID;
      if (!EntityCannotFight(id)) {
        canFight = true;
        gGlobals.EncounterDat.enemy_entities[i] = id;
      }
    }
  }
  for (; i < 0xc; i++) gGlobals.EncounterDat.enemy_entities[i]=0;
}


void clear_alaron_shadow_indices(){
  gGlobals.ShadowIndex = -1;
  gGlobals.AlaronIndex = -1;
}


void alaron_shadow_merge_attempt(){
  if ((((gGlobals.combatBytes[0] != 0x11) && (gGlobals.combatBytes[0] != 0x1d)) &&
      (gGlobals.combatBytes[0] != 0x1e)) &&
     ((gGlobals.ShadowIndex != -1 && (gGlobals.AlaronIndex != -1)))) {
    playerData *shadow = gGlobals.playerDataArray[(&gCombatP->combatEnts)[(byte)gGlobals.ShadowIndex]->index];
    if (shadow != NULL) {
      playerData *alaron = gGlobals.playerDataArray[(&gCombatP->combatEnts)[(byte)gGlobals.AlaronIndex]->index];
      if ((alaron != NULL) &&
         ((shadow->scaleRad + alaron->scaleRad + 0.5f)>
         Vec3Dist(&(shadow->collision).pos,&(alaron->collision).pos))){
        if (HasHornOfKynon()) shadow_merge_cinematic();
        else merge_no_horn();
      }
    }
  }
}

void shadow_merge_cinematic(void){
  gGlobals.combatBytes[0] = 0x11;
  Cinematic::Load(Cinematic_Shadow,CSwitch_ToMenu,1);
}

void merge_no_horn(){
  if (HasHornOfKynon()) shadow_merge_cinematic();
  else {
    gGlobals.combatBytes[0] = 0x1d;
    copy_string_to_combat_textbox(gCombatP,ComString(ShadowVanish),0);
    for(u32 i=0;i<gCombatP->EntCount;i++){
        if((&gCombatP->combatEnts[i])&&(gGlobals.playerDataArray[gCombatP->combatEnts[i].index])){
            gGlobals.playerDataArray[gCombatP->combatEnts[i].index]->ani_type=AniType_0;
        }
    }
  }
}

void set_shadow_index(s8 param_1){gGlobals.ShadowIndex = param_1;}

void set_alaron_index(s8 param_1){gGlobals.AlaronIndex = param_1;}

void clear_shadow_index(void){gGlobals.ShadowIndex = -1;}

void clear_alaron_index(void){gGlobals.AlaronIndex = -1;}

bool HasHornOfKynon(void){return PARTY->hasItem(itemID_array[ItemInd_HornKynon]);}

bool shadow_combat_func(){

  if (gGlobals.ShadowIndex != -1) {
    if (!HasHornOfKynon()) {
      if (3 < gCombatP->TurnCount) {
LAB_8002a304:
        merge_no_horn();
        return true;
      }
      gCombatP->TurnCount++;
    }
    CombatEntity *shadEnt = (&gCombatP->combatEnts)[gGlobals.ShadowIndex];
    for(u8 i=0;i<gCombatP->EntCount;i++){
      if(i!=gGlobals.ShadowIndex){
        CombatEntity *cEnt=(&gCombatP->combatEnts)[i];
        if((cEnt)&&(!cEnt->Flag6())&&(cEnt->charSheetP)&&(!Entity::isDead(cEnt->charSheetP))&&
          (gEntityDB->entities[GETINDEX(cEnt->charSheetP->ID)].Category!=ENTITY_CHAOS)){
          float prox=shadEnt->Get2DProximity(cEnt);
          if(prox<10.0f){
            prox = 10.0f - prox;
            if (!HasHornOfKynon()) prox = SQ(prox);
            if (Entity::getHPCurrent(cEnt->charSheetP) <= prox) goto LAB_8002a304;
            Entity::DamageToLevel(cEnt->charSheetP,(s16)prox,cEnt);
            if (gGlobals.playerDataArray[cEnt->index])
                Print_damage_healing(gGlobals.playerDataArray[cEnt->index],prox,0,false,cEnt->charSheetP);
          }
        }
      }
    }
  }
  return false;
}

bool IsCEntInRange(CombatEntity *entA,CombatEntity *entB,float f){
  bool bVar1;
  float fX;
  float fY;
  
  if (entA->GetCoordX() - entB->GetCoordX() < 0.0)
    fX = -(entA->GetCoordX() - entB->GetCoordX());
  else fX = entA->GetCoordX() - entB->GetCoordX();
  bVar1 = false;
  if (fX <= f) {
    if (entA->GetCoordY() - entB->GetCoordY() < 0.0)
      fY = -(entA->GetCoordY() - entB->GetCoordY());
    else fY = entA->GetCoordY() - entB->GetCoordY();
    bVar1 = false;
    if ((fY <= f) && (bVar1 = true, SQ(f) <= SQ(fX) + SQ(fY))) {
      bVar1 = false;
    }
  }
  return bVar1;
}

bool IsShadowNearAnyone(CombatEntity *shadow){
  for(u32 i=0;i<gCombatP->EntCount;i++) {
      if ((i != shadow->index) &&
         (IsCEntInRange(shadow,(&gCombatP->combatEnts)[i],10.0))) {
        return true;
      }
  }
  return false;
}

bool IsNearShadow(CombatEntity *param_1){
  bool bVar1 = false;
  if (gGlobals.ShadowIndex != -1) {
    if ((&gCombatP->combatEnts)[(byte)gGlobals.ShadowIndex] == param_1) {
      bVar1 = IsShadowNearAnyone(param_1);
    }
    else bVar1 = IsCEntInRange(param_1,(&gCombatP->combatEnts)[(byte)gGlobals.ShadowIndex],10.0);
  }
  return bVar1;
}

void combat_func_if_alaron_dead(void){
  if (!gGlobals.goblinAmbush) combat_byte_0xd();
  else set_combat_byte_to_0x1c();
}

void combat_byte_0xd(void){
  gGlobals.combatBytes[0] = 0xd;
  gGlobals.screenFadeMode = 1;
}

void combat_byte_0x1a(void){
  FUN_80029ba8();
  gGlobals.combatBytes[0] = 0x1a;
}

void set_combat_byte_to_0x1c(){gGlobals.combatBytes[0] = 0x1c;}
