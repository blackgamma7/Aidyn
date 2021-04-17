uint GameOverScenes[3]={0x512,0x513,0x514};

void Gameover_func(void){
  ushort uVar1;
  CharSheet *pCVar2;
  borg13Enum bVar3;
  Borg_9_header *pBVar4;
  short sVar5;
  short sVar6;
  Dialoug_obj *prVar7;
  int iVar7;
  ushort *puVar8;
  
  bVar3 = GameOverScenes[0];
  puVar8 = (ushort *)0x0;
  pBVar4 = get_borg_9(0xd5f);
  iVar7 = 0;
  do {
    if ((pBVar4->dat).ref_obj_count <= iVar7) {
loop:
      pCVar2 = partyPointer->Party[0];
      #ifdef DEBUGVER
      if (pCVar2 == null) manualCrash("NO ALARON! EVIL!!!!","./src/gameover.cpp");
      #endif
      sVar5 = getHPMax(pCVar2);
      sVar6 = getHPCurrent(pCVar2);
      addHP(pCVar2,sVar5 - sVar6);
      if (puVar8 != (ushort *)0x0) {
        if (gglobals.screenFadeModeSwitch == 2) {
          gGlobals.combatbytes[0] = 0x15;
          uVar1 = *puVar8;
        }
        else {
          uVar1 = *puVar8;
        }
        dialoug_func((uint)uVar1,puVar8[4],puVar8[1],puVar8[2],puVar8[3],0x7fff);
        remove_borg_9(pBVar4);
        return;
      }
      #ifdef DEBUGVER
      manualCrash("./src/gameover.cpp","No matching death dailogue!");
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