#include "gameover.h"



void Gameover_func(void){
  voxelObject *pvVar2;
  CharSheet *pCVar3;
  u32 bVar4;
  Borg9Header *pBVar5;
  s16 iVar8;
  dialoug_dat *pvVar9;
  //borg13 indecies of Alaron death scenes
  u32 GameOverScenes[]={BORG13_AlaronDies1,BORG13_AlaronDies2,BORG13_AlaronDies3};
  //...but only one is used.
  bVar4 = GameOverScenes[0];
  pvVar9 = NULL;
  //load up dream sequence map
  pBVar5 = loadBorg9(0xd5f);
  //TODO: cleanup mangled for-loop 
  iVar8 = 0;
  do {
    if ((pBVar5->dat).voxelObjCount <= iVar8) {
LAB_8002411c:
      pCVar3 = PARTY->Members[0];
      #ifdef DEBUGVER
      if (!pCVar3) CRASH("NO ALARON! EVIL!!!!","./src/gameover.cpp");
      #endif
      Entity::addHP(pCVar3,Entity::getHPMax(pCVar3) - Entity::getHPCurrent(pCVar3));
      if (pvVar9) {
        if (gGlobals.screenFadeModeSwitch == 2) {
          gGlobals.combatBytes[0] = 0x15;
        }
        dialoug_func(pvVar9->borg_13,pvVar9->RefPointID,pvVar9->MapDatA,pvVar9->MapShortA,
                     pvVar9->MapShortB,0x7fff);
        remove_borg_9(pBVar5);
        return;
      }
      #ifdef DEBUGVER
      CRASH("./src/gameover.cpp","No matching death dailogue!");
      #endif
    }
    pvVar2 = (pBVar5->dat).voxelObjs;
    if ((pvVar2[iVar8].header.type == VOXEL_Dialouge) &&
       (pvVar2[iVar8].dialoug.borg_13 == bVar4)) {
      pvVar9 = &pvVar2[iVar8].dialoug;
      goto LAB_8002411c;
    }
    iVar8++;
  } while( true );
}