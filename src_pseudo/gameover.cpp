u32 GameOverScenes[3]={0x512,0x513,0x514};

void Gameover_func(void){
  u16 uVar1;
  CharSheet *pCVar2;
  borg13Enum bVar3;
  Borg_9_header *pBVar4;
  s16 sVar5;
  s16 sVar6;
  Dialoug_obj *prVar7;
  s32 iVar7;
  u16 *puVar8;
  
  bVar3 = GameOverScenes[0];
  puVar8 = gLensflare;
  pBVar4 = get_borg_9(0xd5f);
  iVar7 = 0;
  do {
    if ((pBVar4->dat).voxelCount <= iVar7) {
loop:
      pCVar2 = partyPointer->Members[0];
      #ifdef DEBUGVER
      if (pCVar2 == NULL) Crash::ManualCrash("NO ALARON! EVIL!!!!","./src/gameover.cpp");
      #endif
      sVar5 = getHPMax(pCVar2);
      sVar6 = getHPCurrent(pCVar2);
      addHP(pCVar2,sVar5 - sVar6);
      if (puVar8) {
        if (gglobals.screenFadeModeSwitch == 2) {
          gGlobals.combatbytes[0] = 0x15;
          uVar1 = *puVar8;
        }
        else {
          uVar1 = *puVar8;
        }
        dialoug_func((u32)uVar1,puVar8[4],puVar8[1],puVar8[2],puVar8[3],0x7fff);
        remove_borg_9(pBVar4);
        return;
      }
      #ifdef DEBUGVER
      Crash::ManualCrash("./src/gameover.cpp","No matching death dailogue!");
      #endif
    }
    prVar7 = (Dialoug_obj *)((pBVar4->dat).ref_objs[iVar7]);
    if (((prVar7->header).type == Dialouge) && (prVar7->borg_13 == bVar3)) {
      puVar8 = &prVar7->borg_13;
      goto loop;
    }
    iVar7++;
  } while( true );
}