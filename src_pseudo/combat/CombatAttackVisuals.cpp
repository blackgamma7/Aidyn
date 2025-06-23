#include "globals.h"
#include "combat/Visuals.h"


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
  if (!target)
    CRASH(FILENAME,"!pVisual->pTarget\nTried to add a attack effect with no target!");
  if (attackVisualVars.iFreeVisual>=ATTACKVISUAL_MAXVISUALS)
    CRASH(FILENAME,"attackVisualVars.iFreeVisual >= ATTACKVISUAL_MAXVISUALS\nOut of attack visual space!")
  u32 borgIndex = GetAttackActor(param_2);
  if (borgIndex != -1) {
    AttackVisualStruct3 *pAVar7 = attackVisualVars.p + attackVisualVars.bytearray[attackVisualVars.iFreeVisual++];
    pAVar7->flag = 0;
    pAVar7->player = target;
    copyVec3(&(target->collision).pos,&pAVar7->pos);
    Borg7Header *pBVar5 = func_loading_borg7(borgIndex,&gGlobals.Sub.particleEmmiter);
    playerData *ppVar1 = pAVar7->player;
    pAVar7->borg7 = pBVar5;
    if (ppVar1->borg7P == NULL)Actor::ChangeAppearance(ppVar1,ppVar1->borg7);
    Scene::SetFlag40(pAVar7->borg7->sceneDat);
    Scene::SetFlag4(pAVar7->borg7->sceneDat);
    Scene::SetModelTint(pAVar7->borg7->sceneDat,0xff,0xff,0xff,0xff);
    pAVar7->borg7->sceneDat->particleHead = &gGlobals.Sub.particleEmmiter;
    pAVar7->borg7->sceneDat->link2a8 = NULL;
    pAVar7->borg7->sceneDat->link2a4 = pAVar7->player->borg7P->sceneDat;
    FUN_800a0090(pAVar7->borg7,5);
    pAVar7->flag|= 1;
  }
}


Gfx * Render(Gfx *g,uint delta){
  struct_1 *psVar3;
  Borg7Header *pAVar1;
  
  for(u32 i=0;i<ATTACKVISUAL_MAXVISUALS;i++){
    AttackVisualStruct3 *x = &attackVisualVars.p[i];
    if ((x->flag & 1)) {
      if (!(x->flag & 2)) {
        if (x->player) copyVec3(&(x->player->collision).pos,&x->pos);
        Borg7Header *pAVar1 = x->borg7;
        if (delta) {
          for(u32 j=0;j<delta;j++) {
            if (pAVar1->sceneDat->aniTime < pAVar1->unk1c->b6->dat->aniLength) {
              FUN_800a00d0(pAVar1);
            }
          }
        }
        if (pAVar1->sceneDat->aniTime < pAVar1->unk1c->b6->dat->aniLength) {
          Scene::MatrixASetPos(pAVar1->sceneDat,(x->pos).x,(x->pos).y,(x->pos).z);
          g = BorgAnimDrawSceneLinked(g,pAVar1);
        }
        else {
          if (!Particle::FUN_800b4030(pAVar1->sceneDat->particleHead,pAVar1->sceneDat)) x->flag|= 2;
        }
      }
      else {
        Particle::UnsetSceneEmmiter(&gGlobals.Sub.particleEmmiter,x->borg7->sceneDat);
        FREEQB7(x);
        CLEAR(x);
        attackVisualVars.iFreeVisual--;
        attackVisualVars.bytearray[attackVisualVars.iFreeVisual] = i;
      }
    }
  }
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

void Free(){
  for (u32 i=0;i<ATTACKVISUAL_MAXVISUALS;i++) {
    AttackVisualStruct3 * p = &attackVisualVars.p[i];
    if ((p->flag&1)) FREEQB7(p->borg7);
  }
  memset(attackVisualVars.p,0,sizeof(AttackVisualStruct3)*ATTACKVISUAL_MAXVISUALS);
  HFREE(attackVisualVars.p,306);
  memset(attackVisualVars.bytearray,0,ATTACKVISUAL_MAXVISUALS);
  HFREE(attackVisualVars.bytearray,309);
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