#include "globals.h"

#define FILENAME "./src/combatattackvisuals.cpp"
#define ATTACKVISUAL_MAXVISUALS 8

struct CombatAttackVisuals_struct {
  AttackVisualStruct3 *p;
  u8 *bytearray;
  u8 iFreeVisual;

};

CombatAttackVisuals_struct attackVisualVars={0};

namespace CombatAttackVisuals{

void Init(void){
  CLEAR(&attackVisualVars);
  ALLOCS(attackVisualVars.p,sizeof(AttackVisualStruct3)*ATTACKVISUAL_MAXVISUALS,103);
  memset(attackVisualVars.p,0,sizeof(AttackVisualStruct3)*ATTACKVISUAL_MAXVISUALS);
  ALLOCS(attackVisualVars.bytearray,ATTACKVISUAL_MAXVISUALS,106);
  for (u32 i=0;i<ATTACKVISUAL_MAXVISUALS;i++) {
    attackVisualVars.bytearray[i] = i;
  }
  attackVisualVars.iFreeVisual = 0;
}

void Orphaned(playerData *target,u32 param_2){
  playerData *ppVar1;
  SceneData *pAVar2;
  SceneData *pAVar3;
  u32 BVar4;
  Borg7Header *pBVar5;
  uint uVar6;
  AttackVisualStruct3 *pAVar7;
  
  if (target == NULL)
    CRASH(FILENAME,"!pVisual->pTarget\nTried to add a attack effect with no target!");
  if (attackVisualVars.iFreeVisual>=ATTACKVISUAL_MAXVISUALS)
    CRASH(FILENAME,"attackVisualVars.iFreeVisual >= ATTACKVISUAL_MAXVISUALS\nOut of attack visual space!")
  BVar4 = GetAttackActor(param_2);
  if (BVar4 != -1) {
    uVar6 = (uint)attackVisualVars.iFreeVisual;
    attackVisualVars.iFreeVisual += 1;
    pAVar7 = attackVisualVars.p + attackVisualVars.bytearray[uVar6];
    pAVar7->flag = 0;
    pAVar7->player = target;
    copyVec3(&(target->collision).pos,&pAVar7->pos);
    pBVar5 = func_loading_borg7(BVar4,&gGlobals.Sub.particleEmmiter);
    ppVar1 = pAVar7->player;
    pAVar7->borg7 = pBVar5;
    if (ppVar1->locator_pointer == NULL)Actor::ChangeAppearance(ppVar1,ppVar1->borg7);
    pAVar2 = pAVar7->borg7->sceneDat;
    Scene::SetFlag40(pAVar2);
    Scene::SetFlag4(pAVar2);
    Scene::SetModelTint(pAVar2,0xff,0xff,0xff,0xff);
    pBVar5 = pAVar7->borg7;
    pAVar3 = pAVar7->player->locator_pointer->sceneDat;
    pAVar2->particleHead = &gGlobals.Sub.particleEmmiter;
    pAVar2->link2a8 = NULL;
    pAVar2->link2a4 = pAVar3;
    FUN_800a0090(pBVar5,5);
    pAVar7->flag|= 1;
  }
}


Gfx * Render(Gfx *g,uint delta){
  SceneData *pAVar2;
  struct_1 *psVar3;
  int iVar4;
  bool bVar5;
  uint uVar6;
  AttackVisualStruct3 *x;
  uint uVar7;
  Borg7Header *pAVar1;
  
  iVar4 = 0;
  uVar6 = 0;
  do {
    x = (AttackVisualStruct3 *)((int)attackVisualVars.p + (iVar4 - uVar6) * 4);
    uVar7 = uVar6 + 1;
    if ((x->flag & 1)) {
      if (!(x->flag & 2)) {
        if (x->player) copyVec3(&(x->player->collision).pos,&x->pos);
        pAVar1 = x->borg7;
        uVar6 = 0;
        pAVar2 = pAVar1->sceneDat;
        if (delta != 0) {
          psVar3 = pAVar1->unk1c;
          for(u32 uVar6=0;uVar6<delta;uVar6++) {
            if (pAVar2->aniTime < pAVar1->unk1c->field1_0x4->dat[1].field4_0x4) {
              FUN_800a00d0(pAVar1);
            }
          }
        }
        if (pAVar2->aniTime < pAVar1->unk1c->field1_0x4->dat[1].field4_0x4) {
          Scene::MatrixASetPos(pAVar2,(x->pos).x,(x->pos).y,(x->pos).z);
          g = BorgAnimDrawSceneLinked(g,(SceneData *)pAVar1);
        }
        else {
          if (!FUN_800b4030(pAVar1->sceneDat->particleHead,pAVar2)) x->flag|= 2;
        }
      }
      else {
        FUN_800b3f9c(&gGlobals.Sub.particleEmmiter,x->borg7->sceneDat);
        FREEQB7(x);
        CLEAR(x);
        attackVisualVars.iFreeVisual--;
        attackVisualVars.bytearray[attackVisualVars.iFreeVisual] = (byte)uVar6;
      }
    }
    iVar4 = uVar7 * 8;
    uVar6 = uVar7;
  } while (uVar7 < ATTACKVISUAL_MAXVISUALS);
  return g;
}



void FreePlayer(playerData *param_1){
  if (attackVisualVars.p) {
    for(u32 i=0;i<ATTACKVISUAL_MAXVISUALS<i++) {
        AttackVisualStruct3 *p = &attackVisualVars.p[i];
      if (((p->flag & 1)) && (p->player == param_1)) {
        p->player = NULL;
      }
    }
  }
}

void Free(void){
  for (u32 i=0;i<ATTACKVISUAL_MAXVISUALS;i++) {
    AttackVisualStruct3 * p = &attackVisualVars.p[i];
    if ((p->flag&1)) FREEQB7(p->borg7);
  }
  memset(attackVisualVars.p,0,sizeof(AttackVisualStruct3)*ATTACKVISUAL_MAXVISUALS);
  HFREE(attackVisualVars.p,306);
  memset(attackVisualVars.bytearray,0,ATTACKVISUAL_MAXVISUALS);
  HFREE(attackVisualVars.bytearray,209);
  CLEAR(&attackVisualVars);
}


u32 GetAttackActor(u32 param_1){  
  switch(param_1){
    case 0: return 0x1cfd;
    case 1: return 0x1be3;
    default:
      Gsprintf("GetAttackActor(), Attack type %i is not defined!",param_1);
      CRASH(FILENAME,gGlobals.text);
  }
}

}