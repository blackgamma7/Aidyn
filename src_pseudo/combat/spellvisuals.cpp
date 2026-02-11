#include "combat/Visuals.h"
#include "particle.h"
#include "globals.h"
#define FILENAME "./src/combatspellvisuals.cpp"

void InitSpellVisuals(void){

  CLEAR(&SpellVisuals);
  ALLOCS(SpellVisuals.ptr0,sizeof(SpellVisualTypeA)*SpellVisCountA,217);
  memset(SpellVisuals.ptr0,0,sizeof(SpellVisualTypeA)*SpellVisCountA);
  ALLOCS(SpellVisuals.indecies0,sizeof(s16)*SpellVisCountA,220);
  for(u32 i=0;i<SpellVisCountA;i++) SpellVisuals.indecies0[i]=i;
  ALLOCS(SpellVisuals.ptr1,sizeof(SpellVisualTypeB)*SpellVisCountB,230);
  memset(SpellVisuals.ptr1,0,sizeof(SpellVisualTypeB)*SpellVisCountB);
  ALLOCS(SpellVisuals.indecies1,sizeof(s16)*SpellVisCountB,233);
  for(u32 i=0;i<SpellVisCountB;i++) SpellVisuals.indecies1[i]=i;
  ALLOCS(SpellVisuals.ptr2,sizeof(SpellVisualTypeC)*SpellVisCountC,243);
  memset(SpellVisuals.ptr2,0,sizeof(SpellVisualTypeC)*SpellVisCountC);
  ALLOCS(SpellVisuals.indecies2,sizeof(s16)*SpellVisCountC,246);
  for(u32 i=0;i<SpellVisCountC;i++) SpellVisuals.indecies2[i]=i;
}

void FUN_8009468c(void){
  SpellVisuals.field15_0x30 = 1;
  SpellVisuals.field10_0x26 = 150;
  Sky::Set2Floats(0.5f,30.0f);
  SpellVisuals.field9_0x24 = 300;
}


void FUN_800946dc(int param_1){
  s16 sVar1;
  bool bVar2;
  bool bVar3;
  bool bVar4;
  bool bVar5;
  u32 uVar6;
  u32 uVar7;
  SpellVisualTypeA *piVar8;
  int iVar8;
  
  if (SpellVisuals.field15_0x30) {
    if (SpellVisuals.field10_0x26 < 1) {
      Sky::Set2Floats(1.0f,30.0f);
      SpellVisuals.field15_0x30 = 0;
    }
    else {
      SpellVisuals.field10_0x26 -= param_1;
    }
  }
  if (SpellVisuals.field9_0x24 == 0) {
    s32_800f1d90 -= param_1;
    FLOOR(s32_800f1d90,0);
  }
  else {
    s32_800f1d90 += param_1;
    CIEL(s32_800f1d90,30);
    SpellVisuals.field9_0x24 = MIN((SpellVisuals.field9_0x24 - param_1),0);
  }
  SpellVisuals.field6_0x18 =__cosf(((float)s32_800f1d90 / 30.0f) * (float)(TAU/4));
  for(uVar7=0;uVar7<SpellVisCountA;uVar7++){
    piVar8 = &SpellVisuals.ptr0[uVar7];
    if ((piVar8->flags & 1) != 0) {
      sVar1 = piVar8->field4_0xc;
      if (sVar1 == -1) {
LAB_80094858:
        bVar3 = true;
      }
      else {
        bVar3 = false;
        if ((SpellVisuals.ptr1[sVar1].flags & 0x400)) {
          FUN_80095ad8(sVar1);
          piVar8->field4_0xc = 0xffff;
          goto LAB_80094858;
        }
      }
      sVar1 = piVar8->field5_0xe;
      if (sVar1 == -1) {
LAB_80094898:
        bVar4 = true;
      }
      else {
        bVar4 = false;
        if ((SpellVisuals.ptr1[sVar1].flags & 0x400) != 0) {
          FUN_80095ad8(sVar1);
          piVar8->field5_0xe = 0xffff;
          goto LAB_80094898;
        }
      }
      sVar1 = piVar8->field6_0x10;
      if (sVar1 == -1) {
LAB_800948d8:
        bVar5 = true;
      }
      else {
        bVar5 = false;
        if ((SpellVisuals.ptr1[sVar1].flags & 0x400) != 0) {
          FUN_80095ad8(sVar1);
          piVar8->field6_0x10 = 0xffff;
          goto LAB_800948d8;
        }
      }
      if ((piVar8->SpellID ==  SpellInd_Darkness)||(piVar8->SpellID ==  SpellInd_Light)) {
        bVar2 = (piVar8->flags & 0x200) != 0;
      }
      else bVar2 = true;
      if ((((bVar3) && (bVar4)) && (bVar5)) && (bVar2)) {
        FUN_80094f40(piVar8->field2_0x8);
        FUN_80094f40(piVar8->field3_0xa);
        clear_SpellVisuals_ptr0_entry((s16)uVar7);
      }
    }
  }
}

void clear_SpellVisuals_ptr0_entry(s16 param_1){
  if ((SpellVisuals.ptr0[param_1].flags & 1)) {
    CLEAR(&SpellVisuals.ptr0[param_1]);
    SpellVisuals.indecies0[--SpellVisuals.ptr0Count] = param_1;
  }
}


u16 FUN_800949fc(playerData *param_1){
  playerData *ppVar1;
  bool bVar2;
  s16 sVar3;
  SpellVisualTypeC *pSVar4;
  SpellVisualTypeC *pSVar5;
  u32 uVar6;
  
  bVar2 = false;
  uVar6 = 0;
  pSVar4 = SpellVisuals.ptr2;
  while( true ) {
    if (((pSVar4->flags & 1) == 0) || (pSVar4->playerDat != param_1)) {
      uVar6++;
      pSVar5 = pSVar4 + 1;
    }
    else {
      bVar2 = true;
      pSVar5 = pSVar4;
    }
    if (bVar2) break;
    pSVar4 = pSVar5;
    if (0xf < (int)uVar6) {
      if (param_1->borg7P == NULL) {
        Actor::ChangeAppearance(param_1,param_1->borg7);
      }
      uVar6 = (u32)(u16)SpellVisuals.indecies2[SpellVisuals.prt2count++];
      pSVar4 = SpellVisuals.ptr2 + uVar6;
      CLEAR(pSVar4);
      pSVar4->flags = 1;
      pSVar4->playerDat = param_1;
      pSVar4->field2_0x8 = 1;
LAB_80094b00:
      return (u16)uVar6;
    }
  }
  ppVar1 = pSVar4->playerDat;
  if (ppVar1->borg7P == NULL) {
    Actor::ChangeAppearance(ppVar1,ppVar1->borg7);
  }
  pSVar4->field2_0x8++;
  goto LAB_80094b00;
}

void FUN_80094b24(s16 param_1){
  SpellVisualTypeC *entry = SpellVisuals.ptr2 + param_1;
  if ((entry->flags & 1)) {
    entry->timer = 150;
    FUN_80017330(entry->playerDat,30.0,1.0,1.0,1.0);
    Scene::UnsetFogFlag(entry->playerDat->borg7P->sceneDat);
    entry->flags|= 2;
  }
}


void spellvisuals_petrify(s16 param_1){
  SpellVisualTypeC *entry = SpellVisuals.ptr2 + param_1;
  if ((entry->flags & 1)) {
    entry->field4_0xc++;
    entry->playerDat->petrified = true;
  }
}

void spellvisuals_petrify_2(s16 param_1){
  SpellVisualTypeC *entry = SpellVisuals.ptr2 + param_1;
  if (((entry->flags & 1))&&(entry->field4_0xc-- == 1)) {
    entry->playerDat->petrified = false;
  }
}

void FUN_80094c58(s16 param_1,s16 param_2){
  if (param_2 != -1) {
    SpellVisuals.field14_0x2e++;
    SpellVisuals.ptr2[param_1].field5_0xe++;
    if (SpellVisuals.field14_0x2e == 1) FUN_80095414(param_2);
  }
}

u32 FUN_80094cd0(s16 param_1){
  bool bVar1;
  int iVar2;
  int iVar3;
  s16 iVar6;
  s16 lVar5;
  
  iVar3 = (int)param_1;
  iVar2 = (iVar3 + 1)% SpellVisCountC;
  lVar5 = iVar2;
  bVar1 = false;
  while((!bVar1) &&(lVar5 != iVar3)) {
    if (((SpellVisuals.ptr2[lVar5].flags & 1) == 0) ||
        (SpellVisuals.ptr2[lVar5].field5_0xe == 0)) {
        lVar5 =(lVar5 + 1)% SpellVisCountC;
      }
      else bVar1 = true;
  }
  iVar6 = (int)lVar5;
  s16 uVar4 = SpellVisuals.ptr2[iVar6].unk10+1 % SpellVisCountB;
  bVar1 = false;
  while (!bVar1) {
    if (uVar4 == (u16)SpellVisuals.ptr2[iVar6].unk10) {
      SpellVisuals.ptr2[iVar6].unk10 = (s16)uVar4;
      return uVar4;
    }
    if ((((SpellVisuals.ptr1[uVar4].flags & 1) == 0) ||
        ((s16)SpellVisuals.ptr1[uVar4].field7_0x2c != lVar5)) ||
       (1 < SpellVisuals.ptr1[uVar4].spellID - 5)) {
      uVar4 = iVar3+1%SpellVisCountB;
    }
    else bVar1 = true;
  }
  SpellVisuals.ptr2[iVar6].unk10 = uVar4;
  return uVar4;
}

void FUN_80094e6c(s16 param_1){

  for(u32 i=0;i<SpellVisCountC;i++) {
    SpellVisualTypeC *entry = &SpellVisuals.ptr2[i];
    if (((entry->flags & 1)) && ((entry->flags & 2))) {
      if (entry->timer <= 0) {
        FUN_80017388(entry->playerDat,30.0);
        Borg7Header *pBVar1 = entry->playerDat->borg7P;
        if (pBVar1) Scene::SetFogFlag(pBVar1->sceneDat);
        entry->flags&=~2;
      }
      else entry->timer-= param_1;
    }
  }
}

void FUN_80094f40(s16 param_1){
  SpellVisualTypeC *entry = SpellVisuals.ptr2 + param_1;
  if (((entry->flags & 1) != 0) &&(--entry->field2_0x8 < 1)) {
    CLEAR(entry);
    SpellVisuals.prt2count--;
    SpellVisuals.indecies2[SpellVisuals.prt2count] = param_1;
  }
}

s16 FUN_80094fdc(u16 param_1,u8 param_2,u8 type){
  SceneData *pAVar1;
  playerData *ppVar2;
  Borg7Header *pBVar3;
  u32 uVar4;
  u32 uVar5;
  bool bVar8;
  u32 BVar6;
  Borg7Header *pAVar6;
  s16 sVar7;
  SpellVisualTypeC *pSVar9;
  SpellVisualTypeB *spellVisB;
  u32 lVar11;
  u32 memNeeded;
  
  memNeeded = 0;
  switch(type) {
  case 0:
    BVar6 = getSpellB7_2(param_2,&memNeeded);
    uVar4 = ret0_80096300();
    lVar11 = uVar4;
    goto LAB_800950ec;
  case 1:
    BVar6 = getSpellBorg7(param_2,&memNeeded);
    bVar8 = some_spellEnum_bool(param_2);
    lVar11 = bVar8;
    goto LAB_800950ec;
  case 2:
    BVar6 = GetPotionB7(param_2,&memNeeded);
    break;
  case 3:
    BVar6 = 0x1caa;
    break;
  case 4:
    BVar6 = 0x37f1;
    break;
  case 5:
    BVar6 = getSpellBorg5(param_2,&memNeeded);
    bVar8 = some_spellEnum_bool(param_2);
    lVar11 = bVar8;
    memNeeded = 0;
    goto LAB_800950ec;
  case 6:
    BVar6 = getPotionB5(param_2,&memNeeded);
    lVar11 = 0;
    memNeeded = 0;
    goto LAB_800950ec;
  default:
    BVar6 = -1;
  }
  lVar11 = 0;
LAB_800950ec:
  if (get_memFree_2() < memNeeded) {
    if (type == 5) {
      BVar6 = getSpellBorg5(param_2,&memNeeded);
      bVar8 = some_spellEnum_bool(param_2);
      lVar11 = bVar8;
    }
    else {
      BVar6 = -1;
      if (type == 6) {
        BVar6 = getPotionB5(param_2,&memNeeded);
        lVar11 = 0;
      }
      else lVar11 = 0;
    }
  }
  sVar7 = -1;
  if (BVar6 != -1) {
    sVar7 = SpellVisuals.indecies1[SpellVisuals.ptr1count];
    SpellVisuals.ptr1count += 1;
    spellVisB = SpellVisuals.ptr1 + sVar7;
    spellVisB->flags = 0;
    spellVisB->field7_0x2c = param_1;
    if (type - 5 < 2) spellVisB->b7 = NULL;
    else {
      pAVar6 = loadBorg7(BVar6,&gGlobals.gameVars.particleHead);
      pAVar1 = pAVar6->sceneDat;
      Scene::SetFlag40(pAVar1);
      Scene::SetFlag4(pAVar1);
      spellVisB->b7 = pAVar6;
      spellVisB->flags|= 0x10;
    }
    pSVar9 = SpellVisuals.ptr2;
    spellVisB->borgIndex = BVar6;
    pSVar9 = pSVar9 + (s16)spellVisB->field7_0x2c;
    ppVar2 = pSVar9->playerDat;
    spellVisB->memNeeded = memNeeded;
    Vec3Copy(&(ppVar2->collision).pos,&spellVisB->pos);
    (spellVisB->pos).y -= (pSVar9->playerDat->collision).radius;
    if (lVar11 == 0) spellVisB->height = 0.0;
    else spellVisB->height = gEntityDB->GetHeight(pSVar9->playerDat->ent_ID);
    (spellVisB->pos).y += spellVisB->height;
    pBVar3 = pSVar9->playerDat->borg7P;
    if (pBVar3) Scene::SceneGetLocatorPos(pBVar3->sceneDat,&spellVisB->loc3Pos,3);
    spellVisB->spellID = type;
    spellVisB->flags |= 1;
  }
  return sVar7;
}


void FUN_800952c8(s16 param_1,s16 param_2,s16 param_3){
  SceneData *pAVar1;
  Borg7Header *pBVar2;
  SceneData *pAVar3;
  SceneData *pAVar4;
  
  if ((param_1 != -1) && ((SpellVisuals.ptr1[param_1].flags & 1))) {
    pAVar1 = (SpellVisuals.ptr1[param_1].b7)->sceneDat;
    if (param_2 == -1) pAVar4 = NULL;
    else {
      pBVar2 = (SpellVisuals.ptr2[param_2].playerDat)->borg7P;
      pAVar4 = NULL;
      if (pBVar2 != NULL) pAVar4 = pBVar2->sceneDat;
    }
    if (param_3 == -1) pAVar3 = NULL;
    else {
      pBVar2 = (SpellVisuals.ptr2[param_3].playerDat)->borg7P;
      pAVar3 = NULL;
      if (pBVar2 != NULL) pAVar3 = pBVar2->sceneDat;
    }
    pAVar1->particleHead = &gGlobals.gameVars.particleHead;
    pAVar1->locatorScene1 = pAVar4;
    pAVar1->locatorScene2 = pAVar3;
  }
}

void FUN_800953a8(s16 param_1){
  SpellVisualTypeB *pSVar1 = SpellVisuals.ptr1 + param_1;
  if ((((pSVar1->flags & 1)) && (pSVar1->spellID != 5)) && (pSVar1->spellID != 6)) {
    Particle::UnsetSceneEmmiter(&gGlobals.gameVars.particleHead,pSVar1->b7->sceneDat);
  }
}

 void FUN_80095414(s16 param_1){
  if ((SpellVisuals.ptr1[param_1].flags & 1)) {
    SpellVisuals.ptr1[param_1].flags|= 0x20;
    SpellVisuals.lifespan = 125;
    SpellVisuals.lifeTime = 0;
  }
}
void processSpellVisuals(u32 param_1){
  u8 bVar1;
  Borg7Header *pBVar2;
  struct_1 *psVar3;
  float fVar4;
  int iVar6;
  bool bVar8;
  SceneData *pAVar7;
  SpellVisualTypeC *pSVar9;
  u32 uVar10;
  SpellVisualTypeB *ppBVar12;
  u32 i;
  float fVar12;
  float fVar13;
  u8 uVar14;
  u8 uVar15;
  u8 uVar16;
  
  fVar4 = 255.0f;
  for(i=0;i<SpellVisCountB;i++) {
    ppBVar12 = &SpellVisuals.ptr1[i];
    if ((ppBVar12->flags & 1) != 0) {
      pSVar9 = SpellVisuals.ptr2 + (s16)ppBVar12->field7_0x2c;
      if (((pSVar9->flags ^ 1) & SPELLVISUAL_ALLOCED)) CRASH("ProcessSpellVisuals","!(pPlayer->flags & SPELLVISUAL_ALLOCED)");
      if ((pSVar9->flags & SPELLVISUAL_0008) == 0) {
        Vec3Copy(&(pSVar9->playerDat->collision).pos,&ppBVar12->pos);
        (ppBVar12->pos).y =
             ((ppBVar12->pos).y - (pSVar9->playerDat->collision).radius) + ppBVar12->height;
        pBVar2 = pSVar9->playerDat->borg7P;
        if (pBVar2) {
          Scene::SceneGetLocatorPos(pBVar2->sceneDat,&ppBVar12->loc3Pos,3);
        }
      }
      if (true) {
        if (ppBVar12->spellID < 5) {
          pBVar2 = ppBVar12->b7;
          pAVar7 = pBVar2->sceneDat;
          if ((ppBVar12->flags & 0x10)) {
            Borg7_SetAnimation(pBVar2,5);
            ppBVar12->flags &=~0x10;
          }
          uVar10 = 0;
          if (param_1 != 0) {
            psVar3 = pBVar2->unk1c;
            while( true ) {
              if (pAVar7->aniTime < psVar3->b6->dat->aniLength) {
                FUN_800a00d0(pBVar2);
              }
              uVar10++;
              if (param_1 <= uVar10) break;
            }
          }
          if (pAVar7->aniTime < pBVar2->unk1c->b6->dat->aniLength) {
            Scene::MatrixASetPos(pAVar7,(ppBVar12->pos).x,(ppBVar12->pos).y,(ppBVar12->pos).z);
            Scene::SetModelTint(pAVar7,gGlobals.brightness * 255,gGlobals.brightness * 255,gGlobals.brightness * 255,0xff);
          }
          else {
            if (!Particle::SceneHasEmmiter(pAVar7->particleHead,pAVar7)) {
              goto LAB_800959d4;
            }
          }
        }
        else {
          if (6 < ppBVar12->spellID) continue;
          if ((ppBVar12->flags & 0x20)) {
            if (!DAT_800f1d94) {
              if ((int)ppBVar12->memNeeded < (int)get_memFree_2()) {
                pAVar7 = BorgAnimLoadScene(ppBVar12->borgIndex);
                Scene::SetFlag40(pAVar7);
                Scene::SetFlag4(pAVar7);
                ppBVar12->SceneDat = pAVar7;
              }
              else ppBVar12->b7 = NULL;
              ppBVar12->flags = ppBVar12->flags & ~0x20 | 0x40;
              DAT_800f1d94 = 5;
            }
            else DAT_800f1d94--;
          }
          if ((ppBVar12->flags & 0x40)){
            pAVar7 = ppBVar12->SceneDat;
            if (SpellVisuals.field9_0x24 == 0) {
              SpellVisuals.lifeTime += param_1;
            }
            if (SpellVisuals.lifespan <= (int)SpellVisuals.lifeTime) {
              ppBVar12->flags = ppBVar12->flags & ~0x40 | 0x80;
            }
            if (pAVar7) {
              fVar12 = __sinf(((float)(int)SpellVisuals.lifeTime /
                                  (float)SpellVisuals.lifespan) * (float)(TAU/2));
              Scene::MatrixASetPos(pAVar7,(ppBVar12->loc3Pos).x,(ppBVar12->loc3Pos).y,(ppBVar12->loc3Pos).z);
              Scene::SetModelTint(pAVar7,gGlobals.brightness * 255,gGlobals.brightness * 255,gGlobals.brightness * 255,fVar12 * 255 * SpellVisuals.field6_0x18);
            }
          }
          if ((ppBVar12->flags & 0x80)){
            if (ppBVar12->SceneDat) FREEQSCENE(ppBVar12);
            ppBVar12->b7 = NULL;
            ppBVar12->flags &= ~0x80;
            FUN_80095414(FUN_80094cd0(ppBVar12->field7_0x2c));
          }
          if (((ppBVar12->flags & 0x100)) && (!(ppBVar12->flags & 0x40))) {
            ppBVar12->flags &= ~0x100;
LAB_800959d4:
            ppBVar12->flags |= 0x400;
          }
        }
      }
    }
LAB_800959e0:
  }
}

Gfx * FUN_80095a24(Gfx *param_1){
  for(u32 i=0;i<SpellVisCountB;i++) {
    SpellVisualTypeB *entry = &SpellVisuals.ptr1[i];
    if (entry->flags & 1) {
      if (true) {//?
        if (entry->spellID < 5) {
          param_1 = Borg7_Render(param_1,entry->b7);
        }
        else if (((entry->spellID < 7) && ((entry->flags & 0x40))) &&(entry->SceneDat)) {
          param_1 = BorgAnimDrawScene(param_1,entry->SceneDat);
        }
      }
      }
  }
  return param_1;
}

void FUN_80095ad8(s16 param_1){
  Borg7Header *pBVar1;
  SpellVisualTypeB *x = SpellVisuals.ptr1 + param_1;
  if (x->flags & 1) {
    if (true) {
      if (x->spellID < 5) {
        FUN_800953a8(param_1);
        FREEQB7(x);
      }
      else if (x->spellID < 7) {
        SpellVisuals.field14_0x2e--;
        pBVar1 = x->b7;
        SpellVisuals.ptr2[(s16)x->field7_0x2c].field5_0xe--;
        if (pBVar1) {
          FREEQSCENE(x);
          x->b7 = NULL;
        }
      }
    }
    CLEAR(x);
    SpellVisuals.indecies1[--SpellVisuals.ptr1count] = param_1;
  }
}

u16 FUN_80095c04(playerData *param_1,playerData *param_2,u8 spell,s32 param_4){
  u16 uVar2;
  
  u16 uVar1 = SpellVisuals.indecies0[SpellVisuals.ptr0Count];
  SpellVisuals.ptr0Count++;
  SpellVisualTypeA *entry = SpellVisuals.ptr0 + SpellVisuals.indecies0[uVar1];
  entry->flags = 0;
  entry->SpellID = spell;

  entry->field2_0x8 = FUN_800949fc(param_1);
  entry->field3_0xa = FUN_800949fc(param_2);
  if (param_4 == -2) {
    entry->field4_0xc = FUN_80094fdc(entry->field2_0x8,spell,3);
    entry->field5_0xe = 0xffff;
    entry->field6_0x10 = 0xffff;
    FUN_800952c8(entry->field4_0xc,entry->field2_0x8,entry->field3_0xa);
    goto LAB_80095e00;
  }
  if (param_4 == -1) {
    entry->field4_0xc = 0xffff;
    entry->field5_0xe = FUN_80094fdc(entry->field3_0xa,spell,4);
    entry->field6_0x10 = 0xffff;
    FUN_800952c8(entry->field5_0xe,entry->field3_0xa,entry->field2_0x8);
    goto LAB_80095e00;
  }
  entry->field4_0xc = FUN_80094fdc(entry->field2_0x8,spell,0);
  entry->field5_0xe = FUN_80094fdc(entry->field3_0xa,spell,1);
  entry->field6_0x10 = FUN_80094fdc(entry->field3_0xa,spell,5);
  FUN_800952c8(entry->field4_0xc,entry->field2_0x8,entry->field3_0xa);
  FUN_800952c8(entry->field5_0xe,entry->field3_0xa,entry->field2_0x8);
  FUN_80094c58(entry->field3_0xa,entry->field6_0x10);
  FUN_8009468c();
  FUN_80094b24(entry->field2_0x8);
  FUN_80094b24(entry->field3_0xa);
  if (false) goto switchD_80095dac_caseD_1e;
  switch(entry->SpellID) {
  case SpellInd_Darkness:
    World::spellvisuals_1(TerrainPointer,1.0,60.0,0);
    break;
  case SpellInd_WallOfBones:
  case SpellInd_FrozenDoom:
  case SpellInd_WebOfStarlight:
    spellvisuals_petrify(entry->field3_0xa);
    break;
  case SpellInd_Light:
    World::spellvisuals_1(TerrainPointer,0.5,60.0,0);
  default:
switchD_80095dac_caseD_1e:
  }
LAB_80095e00:
  entry->flags|= 1;
  return uVar1;
}
u16 SpellVisuals_InitEffect(playerData *param_1,u8 param_2){
  u16 uVar1 = SpellVisuals.indecies0[SpellVisuals.ptr0Count];
  SpellVisuals.ptr0Count++;
  SpellVisualTypeA *entry = SpellVisuals.ptr0 + uVar1;
  entry->flags = 0;
  entry->SpellID = param_2;
  entry->field2_0x8 = FUN_800949fc(param_1);
  entry->field3_0xa = FUN_800949fc(param_1);
  entry->field4_0xc = -1;
  entry->field5_0xe = FUN_80094fdc(entry->field3_0xa ,param_2,2);
  entry->field6_0x10 = FUN_80094fdc(entry->field3_0xa,param_2,6);
  FUN_800952c8(entry->field5_0xe,entry->field3_0xa,entry->field2_0x8);
  FUN_80094c58(entry->field3_0xa,entry->field6_0x10);
  entry->flags|= 1;
  return uVar1;
}

Gfx * FUN_80095f1c(Gfx *param_1,u16 delta){
  processSpellVisuals(delta);
  FUN_80094e6c(delta);
  FUN_800946dc(delta);
  return FUN_80095a24(param_1);
}

void FUN_80095f6c(int param_1){
  SpellVisualTypeA *entry = SpellVisuals.ptr0 + param_1;
  if ((entry->flags & 1) == 0) return;
  if (true) {
    switch(entry->SpellID) {
    case SpellInd_Darkness:
    case SpellInd_Light:
      entry->flags|= 0x200;
      World::spellvisuals_2(TerrainPointer,60.0);
      break;
    case SpellInd_WallOfBones:
    case SpellInd_FrozenDoom:
    case SpellInd_WebOfStarlight:
      spellvisuals_petrify_2(entry->field3_0xa);
      break;
    }
  }
  s16 sVar1 = entry->field6_0x10;
  if ((sVar1 != -1) && ((SpellVisuals.ptr1[sVar1].flags & 1))) {
    SpellVisuals.ptr1[sVar1].flags |= 0x100;
  }
}

void FUN_80096048(playerData *param_1){
  bool bVar1;
  SpellVisualTypeC *pSVar2;
  SpellVisualTypeC *pSVar3;
  u32 uVar4;
  
  bVar1 = false;
  uVar4 = 0;
  pSVar2 = SpellVisuals.ptr2;
  while( true ) {
    if (((pSVar2->flags & 1) == 0) || (pSVar2->playerDat != param_1)) {
      uVar4++;
      pSVar3 = pSVar2 + 1;
    }
    else {
      bVar1 = true;
      pSVar3 = pSVar2;
    }
    if (bVar1) break;
    pSVar2 = pSVar3;
    if (0xf < uVar4) return;
  }
  pSVar2->flags|= 8;
}

void combatspellvisuals_free(void){
  u32 uVar4;
  for(uVar4=0;uVar4<SpellVisCountB;uVar4++) {
    SpellVisualTypeB *piVar2 = &SpellVisuals.ptr1[uVar4];
    if (((piVar2->flags & 1) != 0) && (piVar2->b7 != NULL)) {
      if (true) {
        if (piVar2->spellID < 5) {
          FUN_800953a8(uVar4);
          FREEQB7(piVar2);
        }
        else if (piVar2->spellID < 7) FREEQSCENE(piVar2);
      }
    }
  }
  HFREE(SpellVisuals.ptr1,1846);
  HFREE(SpellVisuals.indecies1,1847);
  for(uVar4=0;uVar4<SpellVisCountC;uVar4++) {
    SpellVisualTypeC *piVar3 = &SpellVisuals.ptr2[uVar4];
    if (((piVar3->flags & 1) != 0) && ((piVar3->flags & 8) == 0)) {
      FUN_80017388(piVar3->playerDat,30.0);
      Borg7Header* pBVar1= piVar3->playerDat->borg7P;
      if (pBVar1) Scene::SetFogFlag(pBVar1->sceneDat);
      piVar3->playerDat->petrified = false;
    }
  }
  HFREE(SpellVisuals.ptr2,1871);
  HFREE(SpellVisuals.indecies2,1872);
  for(uVar4=0;uVar4<SpellVisCountA;uVar4++) {
    SpellVisualTypeA* pSVar3 = &SpellVisuals.ptr0[uVar4];
    if ((pSVar3->flags & 1) != 0) {
      if (true) {
        switch(pSVar3->SpellID) {
        case SpellInd_Darkness:
        case SpellInd_Light:
          World::spellvisuals_2(TerrainPointer,1.0);
          break;
        case SpellInd_WallOfBones:
        case SpellInd_FrozenDoom:
        case SpellInd_WebOfStarlight:
          spellvisuals_petrify_2(pSVar3->field3_0xa);
          break;
        }
      }
    }
  }
  HFREE(SpellVisuals.ptr0,1904);
  HFREE(SpellVisuals.indecies0,1905);
}

u32 ret0_80096300(){return 0;}

s32 getSpellB7_2(u8 spellInd,u32 *memNeeded){
  s32 ind;
  u32 mem = 0;
  if (false) {
switchD_80096328_caseD_0:
    ind = -1;
    goto LAB_80096468;
  }
  switch(spellInd) {
  default:
    goto switchD_80096328_caseD_0;
  case SpellInd_RemovePoison:
    ind = 0x1d7a;
    goto LAB_80096410;
  case SpellInd_AirShield:
    ind = 0x1ad9;
    mem = 0x4c00;
    break;
  case SpellInd_Strength:
    ind = 0x1ab9;
    goto LAB_80096410;
  case SpellInd_Teleportation:
    ind = 0x1e50;
    mem = 0x3800;
    break;
  case SpellInd_Brilliance:
    ind = 0x1b51;
    goto LAB_80096410;
  case SpellInd_Banishing:
    ind = 0x1b37;
    mem = 0x4c00;
    break;
  case SpellInd_Endurance:
    ind = 0x1c8e;
    goto LAB_80096410;
  case SpellInd_Opening:
    ind = 0x1da1;
    mem = 0x8c00;
    break;
  case SpellInd_SenseAura:
    ind = 0x1dbd;
    mem = 0x3400;
    break;
  case SpellInd_CheatDeath:
    ind = 0x1b68;
    mem = 0x4000;
    break;
  case SpellInd_AuraOfDeath:
    ind = 0x1af8;
    mem = 0xc400;
    break;
  case SpellInd_WraithTouch:
    ind = 0x1ef7;
    mem = 0x1800;
    break;
  case SpellInd_Darkness:
    ind = 0x1bd8;
    mem = 0x17400;
    break;
  case SpellInd_Haste:
    ind = 0x1cf3;
    mem = 0x5800;
    break;
  case SpellInd_Stamina:
    ind = 0x1dfd;
    mem = 0x7c00;
    break;
  case SpellInd_SpiritShield:
    ind = 0x1de7;
    mem = 0x5800;
    break;
  case SpellInd_Mirror:
    ind = 0x1d43;
    mem = 0xc800;
    break;
  case SpellInd_VsElemental:
    ind = 0x1e65;
    mem = 0x9000;
    break;
  case SpellInd_VsNaming:
    ind = 0x1e76;
    mem = 0x6800;
    break;
  case SpellInd_VsNecromancy:
    ind = 0x1e89;
    mem = 0x6800;
    break;
  case SpellInd_VsStar:
    ind = 0x1e9d;
    mem = 0x3400;
    break;
  case SpellInd_Photosynthesis:
    ind = 0x1db6;
    mem = 0x4800;
    break;
  case SpellInd_SolarWrath:
    ind = 0x1b29;
    mem = 0x22800;
    break;
  case SpellInd_StarlightShield:
    ind = 0x1e0e;
    mem = 0x4800;
    break;
  case SpellInd_Dexterity:
    ind = 0x1a48;
LAB_80096410:
    mem = 0x11c00;
    break;
  case SpellInd_Light:
    ind = 0x1d31;
    mem = 0xc400;
  }
LAB_80096468:
  *memNeeded = mem;
  return ind;
}

bool some_spellEnum_bool(u8 param_1){
  if (true) {
    switch(param_1) {
    case SpellInd_ControlElem:
    case SpellInd_debilitation:
    case SpellInd_Stupidity:
    case SpellInd_Charming:
    case SpellInd_ControlMarquis:
    case SpellInd_Weakness:
    case SpellInd_ControlZombies:
    case SpellInd_CrushingDeath:
    case SpellInd_Exhaustion:
    case SpellInd_Clumsiness:
      return true;
    }
  }
  return false;
}


s32 getSpellBorg7(u8 param_1,u32 *param_2){
  s32 BVar1;
  u32 uVar2;
  
  uVar2 = 0;
  if (false) {
switchD_800964c8_caseD_2:
    BVar1 = -1;
  }
  else {
    switch(param_1) {
    case SpellInd_Immolation:
      BVar1 = 0x1d0d;
      uVar2 = 0x6000;
      break;
    case SpellInd_Escape:
    case SpellInd_Banishing:
      BVar1 = 0x1c9f;
      uVar2 = 0x4800;
      break;
    default:
      goto switchD_800964c8_caseD_2;
    case SpellInd_ControlElem:
      BVar1 = 0x1b87;
      uVar2 = 0x5000;
      break;
    case SpellInd_debilitation:
      BVar1 = 0x1bf3;
      uVar2 = 0x2c00;
      break;
    case SpellInd_DragonFlames:
      BVar1 = 0x1c55;
      uVar2 = 0x4c00;
      break;
    case SpellInd_EarthSmite:
      BVar1 = 0x1c66;
      uVar2 = 0x8000;
      break;
    case SpellInd_Fireball:
      BVar1 = 0x1cc9;
      uVar2 = 0x5000;
      break;
    case SpellInd_Lightning:
      BVar1 = 0x1d21;
      uVar2 = 0x8000;
      break;
    case SpellInd_Wind:
      BVar1 = 0x1eec;
      uVar2 = 0xa400;
      break;
    case SpellInd_Stupidity:
      BVar1 = 0x1d52;
      uVar2 = 0x2800;
      break;
    case SpellInd_Charming:
      BVar1 = 0x1b79;
      uVar2 = 0x4000;
      break;
    case SpellInd_ControlMarquis:
      BVar1 = 0x1b95;
      uVar2 = 0x5000;
      break;
    case SpellInd_SenseAura:
      BVar1 = 0x1dc4;
      uVar2 = 0x1c00;
      break;
    case SpellInd_Weakness:
      BVar1 = 0x1ecd;
      uVar2 = 0x2800;
      break;
    case SpellInd_AcidBolt:
      BVar1 = 0x1ac6;
      uVar2 = 0x5000;
      break;
    case SpellInd_ControlZombies:
      BVar1 = 0x1ba3;
      uVar2 = 0x5000;
      break;
    case SpellInd_CrushingDeath:
      BVar1 = 0x1bbc;
      uVar2 = 0xc400;
      break;
    case SpellInd_Exhaustion:
      BVar1 = 0x1dd6;
      uVar2 = 0x5000;
      break;
    case SpellInd_tapStamina:
      BVar1 = 0x1e42;
      uVar2 = 0x5400;
      break;
    case SpellInd_WallOfBones:
      BVar1 = 0x1ec0;
      uVar2 = 0xc800;
      break;
    case SpellInd_DispelElemental:
      BVar1 = 0x1c07;
      uVar2 = 0x1fc00;
      break;
    case SpellInd_DispelNaming:
      BVar1 = 0x1c18;
      uVar2 = 0x6000;
      break;
    case SpellInd_DispelNecro:
      BVar1 = 0x1c30;
      uVar2 = 0x1cc00;
      break;
    case SpellInd_DispelStar:
      BVar1 = 0x1c44;
      uVar2 = 0xf800;
      break;
    case SpellInd_Clumsiness:
      BVar1 = 0x1cb9;
      uVar2 = 0x2400;
      break;
    case SpellInd_FrozenDoom:
      BVar1 = 0x1cdb;
      uVar2 = 0x7800;
      break;
    case SpellInd_StellarGravity:
      BVar1 = 0x1e32;
      uVar2 = 0x7800;
      break;
    case SpellInd_WebOfStarlight:
      BVar1 = 0x1e1c;
      uVar2 = 0x3800;
      break;
    case SpellInd_Whitefire:
      BVar1 = 0x1edf;
      uVar2 = 0x8400;
    }
  }
  *param_2 = uVar2;
  return BVar1;
}


s32 getSpellBorg5(u8 param_1,u32 *memNeeded){
  s32 ind;
  u32 mem = 0;
  if (false) {
switchD_80096660_caseD_1:
    ind = -1;
  }
  else {
    switch(param_1) {
    case SpellInd_Immolation:
      ind = 0x1d0f;
      mem = 0x2000;
      break;
    default:
      goto switchD_80096660_caseD_1;
    case SpellInd_AirShield:
      ind = 0x1acc;
      mem = 0x2000;
      break;
    case SpellInd_ControlElem:
      ind = 0x1ba4;
      mem = 0x2400;
      break;
    case SpellInd_debilitation:
      ind = 0x1be7;
      mem = 0x2800;
      break;
    case SpellInd_Strength:
      ind = 0x1e33;
      mem = 0x3c00;
      break;
    case SpellInd_Brilliance:
      ind = 0x1b47;
      mem = 0x3c00;
      break;
    case SpellInd_Stupidity:
      ind = 0x1d46;
      mem = 0x2800;
      break;
    case SpellInd_Charming:
      ind = 0x1b6b;
      mem = 0x2400;
      break;
    case SpellInd_ControlMarquis:
      ind = 0x1ba5;
      mem = 0x2400;
      break;
    case SpellInd_Endurance:
      ind = 0x1c76;
      mem = 0x3c00;
      break;
    case SpellInd_Weakness:
      ind = 0x1ec3;
      mem = 0x2800;
      break;
    case SpellInd_CheatDeath:
      ind = 0x1b56;
      mem = 0x2400;
      break;
    case SpellInd_AcidBolt:
      ind = 0x1ac7;
      mem = 0x2000;
      break;
    case SpellInd_AuraOfDeath:
      ind = 0x1add;
      mem = 0x2c00;
      break;
    case SpellInd_WraithTouch:
      ind = 0x1efc;
      mem = 0x2800;
      break;
    case SpellInd_ControlZombies:
      ind = 0x1ba6;
      mem = 0x2400;
      break;
    case SpellInd_Haste:
      ind = 0x1ce3;
      mem = 0x3000;
      break;
    case SpellInd_Exhaustion:
      ind = 0x1dc7;
      mem = 0x3800;
      break;
    case SpellInd_Stamina:
      ind = 0x1dec;
      mem = 0x2400;
      break;
    case SpellInd_WallOfBones:
      ind = 0x1ea9;
      mem = 0x6400;
      break;
    case SpellInd_SpiritShield:
      ind = 0x1ddb;
      mem = 0x2000;
      break;
    case SpellInd_Mirror:
      ind = 0x1d34;
      mem = 0x2000;
      break;
    case SpellInd_VsElemental:
      ind = 0x1e55;
      mem = 0x3400;
      break;
    case SpellInd_VsNaming:
      ind = 0x1e69;
      mem = 0x3c00;
      break;
    case SpellInd_VsNecromancy:
      ind = 0x1e7a;
      mem = 0x3c00;
      break;
    case SpellInd_VsStar:
      ind = 0x1e8d;
      mem = 0x2400;
      break;
    case SpellInd_Photosynthesis:
      ind = 0x1da6;
      mem = 0x2000;
      break;
    case SpellInd_SolarWrath:
      ind = 0x1b07;
      mem = 0x5c00;
      break;
    case SpellInd_StarlightShield:
    case SpellInd_WebOfStarlight:
      ind = 0x1e02;
      mem = 0x2000;
      break;
    case SpellInd_Dexterity:
      ind = 0x1bf4;
      mem = 0x3c00;
      break;
    case SpellInd_Clumsiness:
      ind = 0x1cad;
      mem = 0x2800;
      break;
    case SpellInd_FrozenDoom:
      ind = 0x1ccf;
      mem = 0x3400;
      break;
    case SpellInd_StellarGravity:
      ind = 0x1e21;
      mem = 0x2800;
    }
  }
  *memNeeded = mem;
  return ind;
}

s32 GetPotionB7(u8 param_1,u32 *oSize){
  s32 ind;
  u32 size = 0;
  if (false) {
switchD_80096820_caseD_b:
    ind = -1;
    goto LAB_800968bc;
  }
  switch(param_1) {
  case POTION_FIRE:
    ind = BORG7_PotionFXFire;
    size = 0x3000;
    break;
  case POTION_INFERNO:
    ind = BORG7_PotionFXInferno;
    size = 0x6400;
    break;
  case POTION_SLEEP:
    ind = BORG7_PotionFXSleep;
    size = 0x3c00;
    break;
  case POTION_ACID:
    ind = BORG7_PotionFXAcid;
    size = 0x3c00;
    break;
  case POTION_HEALING:
    ind = BORG7_PotionFXHealing;
    size = 0x4000;
    break;
  case POTION_STAMINA:
    ind = BORG7_PotionFXStamina;
    size = 0x4800;
    break;
  case POTION_CURING:
    ind = BORG7_PotionFXCuring;
    size = 0x6400;
    break;
  case POTION_ANTIDOTE:
    ind = BORG7_PotionFXAntidote;
    size = 0x4400;
    break;
  case POTION_RESTORE:
    ind = BORG7_PotionFXRestore;
    size = 0x5000;
    break;
  case POTION_STRENGTH:
    ind = BORG7_PotionFXStrength;
    size = 0x12000;
    break;
  case POTION_DEXTERITY:
    ind = BORG7_PotionFXDexterity;
    size = 0x12000;
    break;
  default:
    goto switchD_80096820_caseD_b;
  case POTION_DEFENCE:
    ind = BORG7_PotionFXDefence;
    size = 0x5400;
  }
LAB_800968bc:
  *oSize = size;
  return ind;
}

s32 getPotionB5(u8 param_1,u32 *param_2){
  s32 sVar1;
  u32 uVar2;
  
  uVar2 = 0;
  if (false) {
switchD_800968e4_caseD_0:
    sVar1 = -1;
  }
  else {
    switch(param_1) {
    default:
      goto switchD_800968e4_caseD_0;
    case POTION_ACID:
      sVar1 = 0x19c0;
      uVar2 = 0x2000;
      break;
    case POTION_STRENGTH:
      sVar1 = 0x1aa1;
      uVar2 = 0x3c00;
      break;
    case POTION_DEXTERITY:
      sVar1 = 0x1a30;
      uVar2 = 0x3c00;
      break;
    case POTION_DEFENCE:
      sVar1 = 0x1a14;
      uVar2 = 0x2000;
    }
  }
  *param_2 = uVar2;
  return sVar1;
}

bool Ofunc_80096928(int param_1){
  int aiStack_3c []={
    EntInd_Darkenbat,EntInd_GiantBat,EntInd_Wyvern,EntInd_Gryphon,
    EntInd_Harpy,EntInd_DryadMale,EntInd_DryadFemale,0x00};
  for(int* piVar2 = aiStack_3c;*piVar2!=0;piVar2++){
    if(*piVar2==param_1) return true;
  }
  return false;
}

void noop_800969a4(){}