#include "combat/Visuals.h"
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
  short sVar1;
  bool bVar2;
  bool bVar3;
  bool bVar4;
  bool bVar5;
  uint uVar6;
  uint uVar7;
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
      if (piVar8->SpellID ==  SPELLIND_darkness) {
LAB_800948fc:
        bVar2 = (piVar8->flags & 0x200) != 0;
      }
      else {
        if (piVar8->SpellID == SPELLIND_light) {
          goto LAB_800948fc;
        }
        bVar2 = true;
      }
      if ((((bVar3) && (bVar4)) && (bVar5)) && (bVar2)) {
        FUN_80094f40(piVar8->field2_0x8);
        FUN_80094f40(piVar8->field3_0xa);
        clear_SpellVisuals_ptr0_entry((short)uVar7);
      }
    }
  }
}

void clear_SpellVisuals_ptr0_entry(short param_1){
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
  uint uVar6;
  
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
      uVar6 = (uint)(u16)SpellVisuals.indecies2[SpellVisuals.prt2count++];
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

void FUN_80094b24(short param_1){
  SpellVisualTypeC *entry = SpellVisuals.ptr2 + param_1;
  if ((entry->flags & 1)) {
    entry->timer = 150;
    FUN_80017330(entry->playerDat,30.0,1.0,1.0,1.0);
    Scene::UnsetFogFlag(entry->playerDat->borg7P->sceneDat);
    entry->flags|= 2;
  }
}


void spellvisuals_petrify(short param_1){
  SpellVisualTypeC *entry = SpellVisuals.ptr2 + param_1;
  if ((entry->flags & 1)) {
    entry->field4_0xc++;
    entry->playerDat->unk70ee = 1;
  }
}

void spellvisuals_petrify_2(short param_1){
  SpellVisualTypeC *pSVar2 = SpellVisuals.ptr2 + param_1;
  if (((pSVar2->flags & 1))&&(pSVar2->field4_0xc-- == 1)) {
    pSVar2->playerDat->unk70ee = 0;
  }
}

void FUN_80094c58(short param_1,short param_2){
  if (param_2 != -1) {
    SpellVisuals.field14_0x2e++;
    SpellVisuals.ptr2[param_1].field5_0xe++;
    if (SpellVisuals.field14_0x2e == 1) FUN_80095414(param_2);
  }
}

uint FUN_80094cd0(short param_1){
  bool bVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  int iVar6;
  longlong lVar5;
  
  iVar3 = (int)param_1;
  iVar6 = (iVar3 + 1) * 0x10000 >> 0x10;
  iVar2 = iVar6;
  if (iVar6 < 0) {
    iVar2 = iVar6 + 0xf;
  }
  iVar2 = (iVar6 + (iVar2 >> 4) * -0x10) * 0x10000 >> 0x10;
  lVar5 = iVar2;
  bVar1 = false;
  if (lVar5 != iVar3) {
    while( true ) {
      iVar2 = iVar2 * 4 + (int)lVar5;
      if ((((&(SpellVisuals.ptr2)->flags)[iVar2] & 1) == 0) ||
         ((&(SpellVisuals.ptr2)->field5_0xe)[iVar2 * 2] == 0)) {
        iVar6 = (int)(short)((short)lVar5 + 1);
        iVar2 = iVar6;
        if (iVar6 < 0) {
          iVar2 = iVar6 + 0xf;
        }
        lVar5 = ((iVar6 + (iVar2 >> 4) * -0x10) * 0x10000 >> 0x10);
      }
      else {
        bVar1 = true;
      }
      if ((bVar1) || (lVar5 == iVar3)) break;
      iVar2 = (int)lVar5;
    }
  }
  iVar6 = (int)lVar5;
  iVar3 = (int)(((u16)SpellVisuals.ptr2[iVar6].unk10 + 1) * 0x10000) >> 0x10;
  iVar2 = iVar3;
  if (iVar3 < 0) {
    iVar2 = iVar3 + 0x7f;
  }
  uVar4 = (iVar3 + (iVar2 >> 7) * -0x80) * 0x10000 >> 0x10;
  bVar1 = false;
  do {
    if (uVar4 == (u16)SpellVisuals.ptr2[iVar6].unk10) {
      SpellVisuals.ptr2[iVar6].unk10 = (short)uVar4;
      return uVar4;
    }
    if ((((SpellVisuals.ptr1[uVar4].flags & 1) == 0) ||
        ((short)SpellVisuals.ptr1[uVar4].field7_0x2c != lVar5)) ||
       (1 < SpellVisuals.ptr1[uVar4].field8_0x2e - 5)) {
      iVar3 = (int)(short)((short)uVar4 + 1);
      iVar2 = iVar3;
      if (iVar3 < 0) {
        iVar2 = iVar3 + 0x7f;
      }
      uVar4 = (iVar3 + (iVar2 >> 7) * -0x80) * 0x10000 >> 0x10;
    }
    else {
      bVar1 = true;
    }
  } while (!bVar1);
  SpellVisuals.ptr2[iVar6].unk10 = (s16)uVar4;
  return uVar4;
}

void FUN_80094e6c(short param_1){

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

void FUN_80094f40(short param_1){
  SpellVisualTypeC *entry = SpellVisuals.ptr2 + param_1;
  if (((entry->flags & 1) != 0) &&(--entry->field2_0x8 < 1)) {
    CLEAR(entry);
    SpellVisuals.prt2count--;
    SpellVisuals.indecies2[SpellVisuals.prt2count] = param_1;
  }
}


short FUN_80094fdc(u16 param_1,u8 param_2,u8 param_3){
  SceneData *pAVar1;
  playerData *ppVar2;
  Borg7Header *pBVar3;
  u32 uVar4;
  uint uVar5;
  bool bVar8;
  u32 BVar6;
  Borg7Header *pAVar6;
  short sVar7;
  SpellVisualTypeC *pSVar9;
  SpellVisualTypeB *pSVar10;
  u32 lVar11;
  u32 memNeeded;
  
  memNeeded = 0;
  switch(param_3) {
  case 0:
    BVar6 = FUN_80096308(param_2,&memNeeded);
    uVar4 = ret0_80096300();
    lVar11 = uVar4;
    goto LAB_800950ec;
  case 1:
    BVar6 = get_spell_borg7(param_2,&memNeeded);
    bVar8 = some_spellEnum_bool(param_2);
    lVar11 = bVar8;
    goto LAB_800950ec;
  case 2:
    BVar6 = FUN_80096800(param_2,&memNeeded);
    break;
  case 3:
    BVar6 = 0x1caa;
    break;
  case 4:
    BVar6 = 0x37f1;
    break;
  case 5:
    BVar6 = FUN_80096640(param_2,&memNeeded);
    bVar8 = some_spellEnum_bool(param_2);
    lVar11 = bVar8;
    memNeeded = 0;
    goto LAB_800950ec;
  case 6:
    BVar6 = FUN_800968c4(param_2,&memNeeded);
    lVar11 = 0;
    memNeeded = 0;
    goto LAB_800950ec;
  default:
    BVar6 = -1;
  }
  lVar11 = 0;
LAB_800950ec:
  if (get_memFree_2() < memNeeded) {
    if (param_3 == 5) {
      BVar6 = FUN_80096640(param_2,&memNeeded);
      bVar8 = some_spellEnum_bool(param_2);
      lVar11 = bVar8;
    }
    else {
      BVar6 = -1;
      if (param_3 == 6) {
        BVar6 = FUN_800968c4(param_2,&memNeeded);
        lVar11 = 0;
      }
      else lVar11 = 0;
    }
  }
  sVar7 = -1;
  if (BVar6 != -1) {
    sVar7 = SpellVisuals.indecies1[SpellVisuals.ptr1count];
    SpellVisuals.ptr1count += 1;
    pSVar10 = SpellVisuals.ptr1 + sVar7;
    pSVar10->flags = 0;
    pSVar10->field7_0x2c = param_1;
    if (param_3 - 5 < 2) pSVar10->b7 = NULL;
    else {
      pAVar6 = func_loading_borg7(BVar6,&gGlobals.Sub.particleEmmiter);
      pAVar1 = pAVar6->sceneDat;
      Scene::SetFlag40(pAVar1);
      Scene::SetFlag4(pAVar1);
      pSVar10->b7 = pAVar6;
      pSVar10->flags|= 0x10;
    }
    pSVar9 = SpellVisuals.ptr2;
    pSVar10->borg5Index = BVar6;
    pSVar9 = pSVar9 + (short)pSVar10->field7_0x2c;
    ppVar2 = pSVar9->playerDat;
    pSVar10->memNeeded = memNeeded;
    copyVec3(&(ppVar2->collision).pos,&pSVar10->pos);
    (pSVar10->pos).y -= (pSVar9->playerDat->collision).radius;
    if (lVar11 == 0) pSVar10->field3_0x1c = 0.0;
    else pSVar10->field3_0x1c = gEntityDB->GetHeight(pSVar9->playerDat->ent_ID);
    (pSVar10->pos).y += pSVar10->field3_0x1c;
    pBVar3 = pSVar9->playerDat->borg7P;
    if (pBVar3) Scene::SceneGetLocatorPos(pBVar3->sceneDat,&pSVar10->loc3Pos,3);
    pSVar10->field8_0x2e = param_3;
    pSVar10->flags |= 1;
  }
  return sVar7;
}


void FUN_800952c8(short param_1,short param_2,short param_3){
  SceneData *pAVar1;
  Borg7Header *pBVar2;
  SceneData *pAVar3;
  SceneData *pAVar4;
  
  if ((param_1 != -1) && ((SpellVisuals.ptr1[param_1].flags & 1) != 0)) {
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
    pAVar1->particleHead = &gGlobals.Sub.particleEmmiter;
    pAVar1->link2a4 = pAVar4;
    pAVar1->link2a8 = pAVar3;
  }
}

void FUN_800953a8(short param_1){
  SpellVisualTypeB *pSVar1 = SpellVisuals.ptr1 + param_1;
  if ((((pSVar1->flags & 1)) && (pSVar1->field8_0x2e != 5)) && (pSVar1->field8_0x2e != 6)) {
    Particle::UnsetSceneEmmiter(&gGlobals.Sub.particleEmmiter,pSVar1->b7->sceneDat);
  }
}

 void FUN_80095414(short param_1){
  if ((SpellVisuals.ptr1[param_1].flags & 1)) {
    SpellVisuals.ptr1[param_1].flags|= 0x20;
    SpellVisuals.lifespan = 125;
    SpellVisuals.lifeTime = 0;
  }
}
void processSpellVisuals(uint param_1){
  byte bVar1;
  Borg7Header *pBVar2;
  struct_1 *psVar3;
  float fVar4;
  int iVar6;
  bool bVar8;
  SceneData *pAVar7;
  SpellVisualTypeC *pSVar9;
  uint uVar10;
  SpellVisualTypeB *ppBVar12;
  uint i;
  float fVar12;
  float fVar13;
  u8 uVar14;
  u8 uVar15;
  u8 uVar16;
  
  fVar4 = 255.0f;
  for(i=0;i<SpellVisCountB;i++) {
    ppBVar12 = &SpellVisuals.ptr1[i];
    if ((ppBVar12->flags & 1) != 0) {
      pSVar9 = SpellVisuals.ptr2 + (short)ppBVar12->field7_0x2c;
      if (((pSVar9->flags ^ 1) & 1) != 0) CRASH("ProcessSpellVisuals","!(pPlayer->flags & SPELLVISUAL_ALLOCED)");
      if ((pSVar9->flags & 8) == 0) {
        copyVec3(&(pSVar9->playerDat->collision).pos,&ppBVar12->pos);
        (ppBVar12->pos).y =
             ((ppBVar12->pos).y - (pSVar9->playerDat->collision).radius) + ppBVar12->field3_0x1c;
        pBVar2 = pSVar9->playerDat->borg7P;
        if (pBVar2) {
          Scene::SceneGetLocatorPos(pBVar2->sceneDat,&ppBVar12->loc3Pos,3);
        }
      }
      if (true) {
        if (ppBVar12->field8_0x2e < 5) {
          pBVar2 = ppBVar12->b7;
          pAVar7 = pBVar2->sceneDat;
          if ((ppBVar12->flags & 0x10)) {
            FUN_800a0090(pBVar2,5);
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
            if (!FUN_800b4030(pAVar7->particleHead,pAVar7)) {
              uVar10 = ppBVar12->flags;
              goto LAB_800959d4;
            }
          }
        }
        else {
          if (6 < bVar1) continue;
          if ((ppBVar12->flags & 0x20)) {
            if (DAT_800f1d94 == '\0') {
              if ((int)ppBVar12->memNeeded < (int)get_memFree_2()) {
                pAVar7 = BorgAnimLoadScene(ppBVar12->borg5Index);
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
    if ((entry->flags & 1) != 0) {
      if (true) {
        if (entry->field8_0x2e < 5) {
          param_1 = BorgAnimDrawSceneLinked(param_1,entry->SceneDat);
        }
        else if (((entry->field8_0x2e < 7) && ((entry->flags & 0x40))) &&(entry->SceneDat)) {
          param_1 = BorgAnimDrawScene(param_1,entry->SceneDat);
        }
      }
      }
  }
  return param_1;
}

void FUN_80095ad8(short param_1){
  Borg7Header *pBVar1;
  SpellVisualTypeB *x = SpellVisuals.ptr1 + param_1;
  if ((x->flags & 1) != 0) {
    if (true) {
      if (x->field8_0x2e < 5) {
        FUN_800953a8(param_1);
        FREEQB7(x);
      }
      else if (x->field8_0x2e < 7) {
        SpellVisuals.field14_0x2e--;
        pBVar1 = x->b7;
        SpellVisuals.ptr2[(short)x->field7_0x2c].field5_0xe--;
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
  case SPELLIND_darkness:
    World::spellvisuals_1(TerrainPointer,1.0,60.0,0);
    break;
  case SPELLIND_wallOfBones:
  case SPELLIND_frozenDoom:
  case SPELLIND_webOfStarlight:
    spellvisuals_petrify(entry->field3_0xa);
    break;
  case SPELLIND_light:
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
    case SPELLIND_darkness:
    case SPELLIND_light:
      entry->flags|= 0x200;
      World::spellvisuals_2(TerrainPointer,60.0);
      break;
    case SPELLIND_wallOfBones:
    case SPELLIND_frozenDoom:
    case SPELLIND_webOfStarlight:
      spellvisuals_petrify_2(entry->field3_0xa);
      break;
    }
  }
  short sVar1 = entry->field6_0x10;
  if ((sVar1 != -1) && ((SpellVisuals.ptr1[sVar1].flags & 1))) {
    SpellVisuals.ptr1[sVar1].flags |= 0x100;
  }
}

void FUN_80096048(playerData *param_1){
  bool bVar1;
  SpellVisualTypeC *pSVar2;
  SpellVisualTypeC *pSVar3;
  uint uVar4;
  
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
  uint uVar4;
  for(uVar4=0;uVar4<SpellVisCountB;uVar4++) {
    SpellVisualTypeB *piVar2 = &SpellVisuals.ptr1[uVar4];
    if (((piVar2->flags & 1) != 0) && (piVar2->b7 != NULL)) {
      if (true) {
        if (piVar2->field8_0x2e < 5) {
          FUN_800953a8(uVar4);
          FREEQB7(piVar2);
        }
        else if (piVar2->field8_0x2e < 7) FREEQSCENE(piVar2);
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
      piVar3->playerDat->unk70ee = 0;
    }
  }
  HFREE(SpellVisuals.ptr2,1871);
  HFREE(SpellVisuals.indecies2,1872);
  for(uVar4=0;uVar4<SpellVisCountA;uVar4++) {
    SpellVisualTypeA* pSVar3 = &SpellVisuals.ptr0[uVar4];
    if ((pSVar3->flags & 1) != 0) {
      if (true) {
        switch(pSVar3->SpellID) {
        case SPELLIND_darkness:
        case SPELLIND_light:
          World::spellvisuals_2(TerrainPointer,1.0);
          break;
        case SPELLIND_wallOfBones:
        case SPELLIND_frozenDoom:
        case SPELLIND_webOfStarlight:
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

s32 FUN_80096308(u8 param_1,u32 *param_2){
  s32 sVar1;
  undefined4 uVar2 = 0;
  if (false) {
switchD_80096328_caseD_0:
    sVar1 = -1;
    goto LAB_80096468;
  }
  switch(param_1) {
  default:
    goto switchD_80096328_caseD_0;
  case SPELLIND_removePoison:
    sVar1 = 0x1d7a;
    goto LAB_80096410;
  case SPELLIND_AirSheild:
    sVar1 = 0x1ad9;
    uVar2 = 0x4c00;
    break;
  case SPELLIND_strength:
    sVar1 = 0x1ab9;
    goto LAB_80096410;
  case SPELLIND_teleportation:
    sVar1 = 0x1e50;
    uVar2 = 0x3800;
    break;
  case SPELLIND_brilliance:
    sVar1 = 0x1b51;
    goto LAB_80096410;
  case SPELLIND_banishing:
    sVar1 = 0x1b37;
    uVar2 = 0x4c00;
    break;
  case SPELLIND_endurance:
    sVar1 = 0x1c8e;
    goto LAB_80096410;
  case SPELLIND_opening:
    sVar1 = 0x1da1;
    uVar2 = 0x8c00;
    break;
  case SPELLIND_senseAura:
    sVar1 = 0x1dbd;
    uVar2 = 0x3400;
    break;
  case SPELLIND_cheatDeath:
    sVar1 = 0x1b68;
    uVar2 = 0x4000;
    break;
  case SPELLIND_auraOfDeath:
    sVar1 = 0x1af8;
    uVar2 = 0xc400;
    break;
  case SPELLIND_wraithTouch:
    sVar1 = 0x1ef7;
    uVar2 = 0x1800;
    break;
  case SPELLIND_darkness:
    sVar1 = 0x1bd8;
    uVar2 = 0x17400;
    break;
  case SPELLIND_haste:
    sVar1 = 0x1cf3;
    uVar2 = 0x5800;
    break;
  case SPELLIND_stamina:
    sVar1 = 0x1dfd;
    uVar2 = 0x7c00;
    break;
  case SPELLIND_spiritSheild:
    sVar1 = 0x1de7;
    uVar2 = 0x5800;
    break;
  case SPELLIND_mirror:
    sVar1 = 0x1d43;
    uVar2 = 0xc800;
    break;
  case SPELLIND_vsElemental:
    sVar1 = 0x1e65;
    uVar2 = 0x9000;
    break;
  case SPELLIND_vsNaming:
    sVar1 = 0x1e76;
    uVar2 = 0x6800;
    break;
  case SPELLIND_vsNecromancy:
    sVar1 = 0x1e89;
    uVar2 = 0x6800;
    break;
  case SPELLIND_vsStar:
    sVar1 = 0x1e9d;
    uVar2 = 0x3400;
    break;
  case SPELLIND_photosynthesis:
    sVar1 = 0x1db6;
    uVar2 = 0x4800;
    break;
  case SPELLIND_solarWraith:
    sVar1 = 0x1b29;
    uVar2 = 0x22800;
    break;
  case SPELLIND_starlightSheild:
    sVar1 = 0x1e0e;
    uVar2 = 0x4800;
    break;
  case SPELLIND_dexterity:
    sVar1 = 0x1a48;
LAB_80096410:
    uVar2 = 0x11c00;
    break;
  case SPELLIND_light:
    sVar1 = 0x1d31;
    uVar2 = 0xc400;
  }
LAB_80096468:
  *param_2 = uVar2;
  return sVar1;
}


bool some_spellEnum_bool(u8 param_1){
  if (true) {
    switch(param_1) {
    case SPELLIND_ControlElem:
    case SPELLIND_debilitation:
    case SPELLIND_stupidity:
    case SPELLIND_charming:
    case SPELLIND_controlMarquis:
    case SPELLIND_weakness:
    case SPELLIND_controlZombies:
    case SPELLIND_crushingDeath:
    case SPELLIND_exhaustion:
    case SPELLIND_clumsiness:
      return true;
    }
  }
  return false;
}


s32 get_spell_borg7(u8 param_1,undefined4 *param_2){
  s32 BVar1;
  undefined4 uVar2;
  
  uVar2 = 0;
  if (false) {
switchD_800964c8_caseD_2:
    BVar1 = -1;
  }
  else {
    switch(param_1) {
    case SPELLIND_Immolation:
      BVar1 = 0x1d0d;
      uVar2 = 0x6000;
      break;
    case SPELLIND_escape:
    case SPELLIND_banishing:
      BVar1 = 0x1c9f;
      uVar2 = 0x4800;
      break;
    default:
      goto switchD_800964c8_caseD_2;
    case SPELLIND_ControlElem:
      BVar1 = 0x1b87;
      uVar2 = 0x5000;
      break;
    case SPELLIND_debilitation:
      BVar1 = 0x1bf3;
      uVar2 = 0x2c00;
      break;
    case SPELLIND_DragonFlames:
      BVar1 = 0x1c55;
      uVar2 = 0x4c00;
      break;
    case SPELLIND_EarthSmite:
      BVar1 = 0x1c66;
      uVar2 = 0x8000;
      break;
    case SPELLIND_fireball:
      BVar1 = 0x1cc9;
      uVar2 = 0x5000;
      break;
    case SPELLIND_lightning:
      BVar1 = 0x1d21;
      uVar2 = 0x8000;
      break;
    case SPELLIND_wind:
      BVar1 = 0x1eec;
      uVar2 = 0xa400;
      break;
    case SPELLIND_stupidity:
      BVar1 = 0x1d52;
      uVar2 = 0x2800;
      break;
    case SPELLIND_charming:
      BVar1 = 0x1b79;
      uVar2 = 0x4000;
      break;
    case SPELLIND_controlMarquis:
      BVar1 = 0x1b95;
      uVar2 = 0x5000;
      break;
    case SPELLIND_senseAura:
      BVar1 = 0x1dc4;
      uVar2 = 0x1c00;
      break;
    case SPELLIND_weakness:
      BVar1 = 0x1ecd;
      uVar2 = 0x2800;
      break;
    case SPELLIND_AcidBolt:
      BVar1 = 0x1ac6;
      uVar2 = 0x5000;
      break;
    case SPELLIND_controlZombies:
      BVar1 = 0x1ba3;
      uVar2 = 0x5000;
      break;
    case SPELLIND_crushingDeath:
      BVar1 = 0x1bbc;
      uVar2 = 0xc400;
      break;
    case SPELLIND_exhaustion:
      BVar1 = 0x1dd6;
      uVar2 = 0x5000;
      break;
    case SPELLIND_tapStamina:
      BVar1 = 0x1e42;
      uVar2 = 0x5400;
      break;
    case SPELLIND_wallOfBones:
      BVar1 = 0x1ec0;
      uVar2 = 0xc800;
      break;
    case SPELLIND_dispelElemental:
      BVar1 = 0x1c07;
      uVar2 = 0x1fc00;
      break;
    case SPELLIND_dispelNaming:
      BVar1 = 0x1c18;
      uVar2 = 0x6000;
      break;
    case SPELLIND_dispelNecro:
      BVar1 = 0x1c30;
      uVar2 = 0x1cc00;
      break;
    case SPELLIND_dispelStar:
      BVar1 = 0x1c44;
      uVar2 = 0xf800;
      break;
    case SPELLIND_clumsiness:
      BVar1 = 0x1cb9;
      uVar2 = 0x2400;
      break;
    case SPELLIND_frozenDoom:
      BVar1 = 0x1cdb;
      uVar2 = 0x7800;
      break;
    case SPELLIND_stellarGravity:
      BVar1 = 0x1e32;
      uVar2 = 0x7800;
      break;
    case SPELLIND_webOfStarlight:
      BVar1 = 0x1e1c;
      uVar2 = 0x3800;
      break;
    case SPELLIND_whitefire:
      BVar1 = 0x1edf;
      uVar2 = 0x8400;
    }
  }
  *param_2 = uVar2;
  return BVar1;
}


s32 FUN_80096640(SpellEnum param_1,undefined4 *param_2)

{
  s32 sVar1;
  undefined4 uVar2;
  
  uVar2 = 0;
  if (false) {
switchD_80096660_caseD_1:
    sVar1 = -1;
  }
  else {
    switch(param_1) {
    case SPELLIND_Immolation:
      sVar1 = 0x1d0f;
      uVar2 = 0x2000;
      break;
    default:
      goto switchD_80096660_caseD_1;
    case SPELLIND_AirSheild:
      sVar1 = 0x1acc;
      uVar2 = 0x2000;
      break;
    case SPELLIND_ControlElem:
      sVar1 = 0x1ba4;
      uVar2 = 0x2400;
      break;
    case SPELLIND_debilitation:
      sVar1 = 0x1be7;
      uVar2 = 0x2800;
      break;
    case SPELLIND_strength:
      sVar1 = 0x1e33;
      uVar2 = 0x3c00;
      break;
    case SPELLIND_brilliance:
      sVar1 = 0x1b47;
      uVar2 = 0x3c00;
      break;
    case SPELLIND_stupidity:
      sVar1 = 0x1d46;
      uVar2 = 0x2800;
      break;
    case SPELLIND_charming:
      sVar1 = 0x1b6b;
      uVar2 = 0x2400;
      break;
    case SPELLIND_controlMarquis:
      sVar1 = 0x1ba5;
      uVar2 = 0x2400;
      break;
    case SPELLIND_endurance:
      sVar1 = 0x1c76;
      uVar2 = 0x3c00;
      break;
    case SPELLIND_weakness:
      sVar1 = 0x1ec3;
      uVar2 = 0x2800;
      break;
    case SPELLIND_cheatDeath:
      sVar1 = 0x1b56;
      uVar2 = 0x2400;
      break;
    case SPELLIND_AcidBolt:
      sVar1 = 0x1ac7;
      uVar2 = 0x2000;
      break;
    case SPELLIND_auraOfDeath:
      sVar1 = 0x1add;
      uVar2 = 0x2c00;
      break;
    case SPELLIND_wraithTouch:
      sVar1 = 0x1efc;
      uVar2 = 0x2800;
      break;
    case SPELLIND_controlZombies:
      sVar1 = 0x1ba6;
      uVar2 = 0x2400;
      break;
    case SPELLIND_haste:
      sVar1 = 0x1ce3;
      uVar2 = 0x3000;
      break;
    case SPELLIND_exhaustion:
      sVar1 = 0x1dc7;
      uVar2 = 0x3800;
      break;
    case SPELLIND_stamina:
      sVar1 = 0x1dec;
      uVar2 = 0x2400;
      break;
    case SPELLIND_wallOfBones:
      sVar1 = 0x1ea9;
      uVar2 = 0x6400;
      break;
    case SPELLIND_spiritSheild:
      sVar1 = 0x1ddb;
      uVar2 = 0x2000;
      break;
    case SPELLIND_mirror:
      sVar1 = 0x1d34;
      uVar2 = 0x2000;
      break;
    case SPELLIND_vsElemental:
      sVar1 = 0x1e55;
      uVar2 = 0x3400;
      break;
    case SPELLIND_vsNaming:
      sVar1 = 0x1e69;
      uVar2 = 0x3c00;
      break;
    case SPELLIND_vsNecromancy:
      sVar1 = 0x1e7a;
      uVar2 = 0x3c00;
      break;
    case SPELLIND_vsStar:
      sVar1 = 0x1e8d;
      uVar2 = 0x2400;
      break;
    case SPELLIND_photosynthesis:
      sVar1 = 0x1da6;
      uVar2 = 0x2000;
      break;
    case SPELLIND_solarWraith:
      sVar1 = 0x1b07;
      uVar2 = 0x5c00;
      break;
    case SPELLIND_starlightSheild:
    case SPELLIND_webOfStarlight:
      sVar1 = 0x1e02;
      uVar2 = 0x2000;
      break;
    case SPELLIND_dexterity:
      sVar1 = 0x1bf4;
      uVar2 = 0x3c00;
      break;
    case SPELLIND_clumsiness:
      sVar1 = 0x1cad;
      uVar2 = 0x2800;
      break;
    case SPELLIND_frozenDoom:
      sVar1 = 0x1ccf;
      uVar2 = 0x3400;
      break;
    case SPELLIND_stellarGravity:
      sVar1 = 0x1e21;
      uVar2 = 0x2800;
    }
  }
  *param_2 = uVar2;
  return sVar1;
}


s32 FUN_80096800(u8 param_1,u32 *param_2){
  s32 sVar1;
  undefined4 uVar2;
  
  uVar2 = 0;
  if (false) {
switchD_80096820_caseD_b:
    sVar1 = -1;
    goto LAB_800968bc;
  }
  switch(param_1) {
  case 0:
    sVar1 = 0x1a56;
    uVar2 = 0x3000;
    break;
  case 1:
    sVar1 = 0x1a00;
    uVar2 = 0x6400;
    break;
  case 2:
    sVar1 = 0x1a83;
    uVar2 = 0x3c00;
    break;
  case 3:
    sVar1 = 0x19cb;
    uVar2 = 0x3c00;
    break;
  case 4:
    sVar1 = 0x1a65;
    uVar2 = 0x4000;
    break;
  case 5:
    sVar1 = 0x1a91;
    uVar2 = 0x4800;
    break;
  case 6:
    sVar1 = 0x1a10;
    uVar2 = 0x6400;
    break;
  case 7:
    sVar1 = 0x19db;
    uVar2 = 0x4400;
    break;
  case 8:
    sVar1 = 0x1a74;
    uVar2 = 0x5000;
    break;
  case 9:
    sVar1 = 0x1ab9;
    goto LAB_80096840;
  case 10:
    sVar1 = 0x1a48;
LAB_80096840:
    uVar2 = 0x12000;
    break;
  default:
    goto switchD_80096820_caseD_b;
  case 0xf:
    sVar1 = 0x1a20;
    uVar2 = 0x5400;
  }
LAB_800968bc:
  *param_2 = uVar2;
  return sVar1;
}

s32 FUN_800968c4(u8 param_1,u32 *param_2){
  s32 sVar1;
  undefined4 uVar2;
  
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
  int aiStack_3c []={0xcf,0xd2,0xca,0xd6,0x76,0x5a,0x5b,0x00};
  int* piVar2 = aiStack_3c;
  int iVar1=aiStack_3c[0];
  if (aiStack_3c[0]) {
    do {
      if (iVar1 == param_1) {
        return true;
      }
      iVar1 = *piVar2;
      piVar2++;
    } while (iVar1 != 0);
  }
  return false;
}