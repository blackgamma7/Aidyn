#include "globals.h"

DialogCallback d_func_A_pointer=NULL;
DialogCallback2 d_func_B_pointer=NULL;
DialogCallback d_func_C_pointer=NULL;

void set_dialougprecallback(DialogCallback f){d_func_A_pointer=f;}

void set_dialoug_func_b(DialogCallback2 f){d_func_B_pointer=f;}

void set_dialoug_func_c(DialogCallback f){d_func_C_pointer=f;}

byte check_command_bitmask(Borg13Data *param_1,u8 param_2){
  if ((param_1->commands_pointer[param_2].bitmask & 1)) return 0;
  if ((param_1->commands_pointer[param_2].bitmask & 2)) return 1;
  if ((param_1->commands_pointer[param_2].bitmask & 4)) return 2;
  return 3;
}

char * get_borg_13_text(Borg13Data *param_1,u8 param_2){
  return param_1->text + param_1->commands_pointer[param_2].text_marker;
}

byte command_bitmask_6(Borg13Data *param_1,u8 param_2){
  param_1->commands_pointer[param_2].bitmask |= 0x80;
  return param_1->commands_pointer[param_2].bitmask;
}

byte command_bitmask_7(Borg13Data *param_1,u8 param_2){return param_1->commands_pointer[param_2].bitmask >> 7;}

bool FUN_800b59b8(dialougeInstance *param_1,Borg13Data *param_2,u8 param_3){
  if (param_1->unk110 == -1) {
    dialoug_func_c_check(param_1,param_2,param_3);
    if (param_1->unk110 != -1) return true;
  }
  else param_1->unk110 = -1;
  return param_1->borg13End == 1;
}

void FUN_800b5a1c(Borg13Data *param_1){
  for(s32 i=0;i<param_1->CmdCount;i++){
    param_1->commands_pointer[i].bitmask&=~0x80;
  }
}

byte dialogNode_func_2(dialougeInstance *param_1,Borg13Data *param_2,byte param_3){
  borg13command *pbVar1;
  bool bVar6;
  byte bVar7;
  char *pcVar3;
  u32 uVar4;
  int iVar5;
  u32 uVar8;
  u8 uVar9;
  int iVar10;
  u32 uVar11;
  int iVar12;
  char acStack_328 [256];
  char acStack_228 [256];
  char acStack_128 [296];
  
  uVar11 = (u32)param_3;
  if (FUN_800b59b8(param_1,param_2,param_3)) return 0;
  command_bitmask_6(param_2,param_3);
  if (param_1->unk10e != 0xffff) {
    pbVar1 = param_2->commands_pointer;
    uVar9 = pbVar1[param_3].index;
    iVar12 = 0;
    while (uVar8 = (u32)uVar9, uVar8 != 0xff) {
      if (((pbVar1[uVar8].a <= param_1->unk10e) &&
          ((param_1->unk10e <= pbVar1[uVar8].b || (pbVar1[uVar8].b == 65000)))) &&
         ((!command_bitmask_7(param_2,uVar9) ||
          ((param_2->start_func == 2 || (param_2->start_func == 4)))))) {
        param_1->unk10e = 0xffff;
        Dialoug_commands(param_1,param_2,uVar9);
        pcVar3 = get_borg_13_text(param_2,uVar9);
        if (*pcVar3 != '\0') {
          FUN_800b6b54(param_1,uVar9,pcVar3);
          return uVar9;
        }
        goto LAB_800b60d4;
      }
      if (7 < iVar12 + 1) break;
      uVar9 = param_2->commands_pointer[param_3].c[iVar12++];
    }
  }
  bVar7 = check_command_bitmask(param_2,param_3);
  uVar8 = (u32)param_3;
  if (bVar7 != 1) {
    if ((char)bVar7 < 2) {
      if (bVar7 != 0) {
        return 0;
      }
      uVar11 = (u32)*(byte *)((int)param_2->commands_pointer +
                              ((u32)param_3 * 8 - uVar8) * 8 + 0x28);
      if ((uVar11 == 0xff) && (param_1->unk116 != 0xff)) {
        uVar11 = (u32)param_1->unk116;
      }
      uVar9 = (u8)uVar11;
      bVar7 = check_command_bitmask(param_2,uVar9);
      if (bVar7 == 3) {
        param_1->unk116 = uVar9;
        pcVar3 = get_borg_13_text(param_2,uVar9);
        if (*pcVar3) {
          Dialoug_commands(param_1,param_2,uVar9);
          dialoug_func_c_check(param_1,param_2,uVar9);
          if (param_1->unk110 != -1) {
            return 0;
          }
          FUN_800b6b54(param_1,uVar9,pcVar3);
          uVar9 = param_2->commands_pointer[uVar11].index;
          iVar12 = 0;
          do {
            if (uVar9 == 0xff) return 0xff;
            if (((!command_bitmask_7(param_2,uVar9)) || (param_2->start_func == 2)) || (param_2->start_func == 4)) {
              Dialoug_commands(param_1,param_2,uVar9);
              pcVar3 = get_borg_13_text(param_2,uVar9);
              if (pcVar3 == NULL) goto LAB_800b60d4;
              FUN_800b6b54(param_1,uVar9,pcVar3);
            }
            if (7 < iVar12 + 1) return uVar9;
            uVar9 = param_2->commands_pointer[uVar11].c[iVar12];
            iVar12++;
          } while( true );
        }
        sprintf(acStack_328,"line = %d: Need text in top node of Tree",329);
        pcVar3 = acStack_328;
      }
      else {
        if (bVar7 != 2) {
          Dialoug_commands(param_1,param_2,uVar9);
          pcVar3 = get_borg_13_text(param_2,uVar9);
          if (*pcVar3 == '\0') {
            bVar7 = dialogNode_func_2(param_1,param_2,uVar9);
            return bVar7;
          }
          goto LAB_800b60a4;
        }
        param_1->unk116 = uVar9;
        pcVar3 = get_borg_13_text(param_2,uVar9);
        if (*pcVar3 != '\0') {
          Dialoug_commands(param_1,param_2,uVar9);
          dialoug_func_c_check(param_1,param_2,uVar9);
          if (param_1->unk110 != -1) {
            return 0;
          }
          FUN_800b6b54(param_1,uVar9,pcVar3);
          uVar4 = dialoug_func_b_check(param_1,param_2,uVar9);
          iVar10 = 0;
          pbVar1 = param_2->commands_pointer;
          bVar7 = pbVar1[uVar11].index;
          iVar12 = 0;
          while (bVar7 != 0xff) {
            iVar5 = (u32)bVar7 * 8 - (u32)bVar7;
            if ((param_2->commands_pointer[uVar11].a <= (int)uVar4) &&
               ((uVar8 = param_2->commands_pointer[uVar11].b, (int)uVar4 <= (int)uVar8
                || (uVar8 == 65000)))) {
              iVar10 += 1;
            }
            if (7 < iVar12 + 1) break;
            bVar7 = pbVar1[uVar11].c[iVar12++];
          }
          if (iVar10 < 2) {
            param_1->unk10e = (u16)uVar4;
            return bVar7;
          }
          pbVar1 = param_2->commands_pointer;
          uVar9 = pbVar1[uVar11].index;
          iVar12 = 0;
          do {
            uVar8 = (u32)uVar9;
            if (uVar8 == 0xff) {
              return uVar9;
            }
            if ((((int)(u32)pbVar1[uVar8].a <= (int)uVar4) &&
                (((int)uVar4 <= (int)(u32)pbVar1[uVar8].b || (pbVar1[uVar8].b == 65000)))) &&
               ((!command_bitmask_7(param_2,uVar9) ||
                ((param_2->start_func == 2 || (param_2->start_func == 4)))))) {
              Dialoug_commands(param_1,param_2,uVar9);
              pcVar3 = get_borg_13_text(param_2,uVar9);
              if (pcVar3 == NULL) goto LAB_800b60d4;
              FUN_800b6b54(param_1,uVar9,pcVar3);
            }
            if (7 < iVar12 + 1) {
              return uVar9;
            }
            pbVar1 = param_2->commands_pointer;
            uVar9 = pbVar1[uVar11].c[iVar12++];
          } while( true );
        }
        pcVar3 = acStack_228;
        sprintf(pcVar3,"line = %d: Need text in top node of Case",378);
      }
    }
    else {
      pcVar3 = acStack_128;
      if (3 < (char)bVar7) {
        return 0;
      }
      sprintf(pcVar3,"line = %d: Invalid node to evaluate",489);
    }
    CRASH("./src/dialog.cpp",pcVar3);
  }
  if (dialoug_func_b_check(param_1,param_2,param_3) == 1) uVar9 = param_2->commands_pointer[uVar8].index;
  else {
    uVar9 = param_2->commands_pointer[uVar8].c[0];
  }
  Dialoug_commands(param_1,param_2,uVar9);
  pcVar3 = get_borg_13_text(param_2,uVar9);
  if (*pcVar3 == '\0') {
LAB_800b60d4:
    return dialogNode_func_2(param_1,param_2,uVar9);
  }
LAB_800b60a4:
  FUN_800b6b54(param_1,uVar9,pcVar3);
  return (byte)uVar11;
}

u8 DialogNode_func(dialougeInstance *param_1,Borg13Data *param_2){
  borg13command *pbVar1;
  int iVar2;
  char *pcVar4;
  u8 uVar8;
  u32 uVar5;
  int iVar6;
  u32 uVar9;
  int iVar10;
 
  param_1->borg13End = 0;
  command_bitmask_6(param_2,0);
  Dialoug_commands(param_1,param_2,0);
  switch(check_command_bitmask(param_2,0)){
    case 0:{
      pcVar4 = get_borg_13_text(param_2,0);
      if (*pcVar4 == '\0') uVar8 = dialogNode_func_2(param_1,param_2,0);
      else {
        FUN_800b6b54(param_1,0,pcVar4);
        uVar8 = 0;
      }
      break;
    }
    case 1:{
    if (dialoug_func_b_check(param_1,param_2,0) == 1) uVar8 = param_2->commands_pointer->index;
    else uVar8 = param_2->commands_pointer->c[0];
    Dialoug_commands(param_1,param_2,uVar8);
    pcVar4 = get_borg_13_text(param_2,uVar8);
    if (*pcVar4 == '\0') {
LAB_800b65a8:
      uVar8 = dialogNode_func_2(param_1,param_2,uVar8);
    }
    else FUN_800b6b54(param_1,uVar8,pcVar4);
    break;
    }
    case 2:{
    param_1->unk116 = 0;
    pcVar4 = get_borg_13_text(param_2,0);
    if (*pcVar4 == '\0') {
    char acStack_128 [296];
      sprintf(acStack_128,"line = %d: Need text in top node of Case",626);
      CRASH("./src/dialog.cpp",acStack_128);
    }
    dialoug_func_c_check(param_1,param_2,0);
    uVar8 = 0;
    if (param_1->unk110 == -1) {
      FUN_800b6b54(param_1,0,pcVar4);
      uVar5 = dialoug_func_b_check(param_1,param_2,0);
      iVar10 = 0;
      pbVar1 = param_2->commands_pointer;
      uVar8 = pbVar1->index;
      iVar2 = 0;
      while (uVar8 != 0xff) {
        iVar6 = (u32)uVar8 * 8 - (u32)uVar8;
        if ((param_2->commands_pointer[uVar8].a <= (int)uVar5) &&
           ((uVar5 <= (int)param_2->commands_pointer[uVar8].b ||
            (param_2->commands_pointer[uVar8].b == 65000)))) {
          iVar10++;
        }
        if (7 < iVar2 + 1) break;
        uVar8 = pbVar1->c[iVar2++];
      }
      if (iVar10 < 2) {
        param_1->unk10e = (u16)uVar5;
      }
      else {
        pbVar1 = param_2->commands_pointer;
        uVar8 = pbVar1->index;
        iVar2 = 0;
        while (uVar9 = (u32)uVar8, uVar9 != 0xff) {
          if ((((int)(u32)pbVar1[uVar9].a <= (int)uVar5) &&
              (((int)uVar5 <= (int)(u32)pbVar1[uVar9].b || (pbVar1[uVar9].b == 65000)))) &&
             ((command_bitmask_7(param_2,uVar8) == 0 ||
              ((param_2->start_func == 2 || (param_2->start_func == 4)))))) {
            Dialoug_commands(param_1,param_2,uVar8);
            pcVar4 = get_borg_13_text(param_2,uVar8);
            if (pcVar4 == NULL) goto LAB_800b65a8;
            FUN_800b6b54(param_1,uVar8,pcVar4);
          }
          if (7 < iVar2 + 1) {
            return uVar8;
          }
          pbVar1 = param_2->commands_pointer;
          uVar8 = pbVar1->c[iVar2++];
        }
      }
    }
    break;
  }
  case 3:{
      param_1->unk116 = 0;
      pcVar4 = get_borg_13_text(param_2,0);
      if (*pcVar4 == '\0') {
        char acStack_228 [256];
        sprintf(acStack_228,"line = %d: Need text in top node of Case",558);
        CRASH("./src/dialog.cpp",acStack_228);
      }
      dialoug_func_c_check(param_1,param_2,0);
      uVar8 = 0;
      if (param_1->unk110 == -1) {
        FUN_800b6b54(param_1,0,pcVar4);
        uVar8 = param_2->commands_pointer->index;
        iVar2 = 0;
        while (uVar8 != 0xff) {
          if (((!command_bitmask_7(param_2,uVar8)) || (param_2->start_func == 2)) || (param_2->start_func == 4)) {
            Dialoug_commands(param_1,param_2,uVar8);
            pcVar4 = get_borg_13_text(param_2,uVar8);
            if (pcVar4 == NULL) goto LAB_800b65a8;
            FUN_800b6b54(param_1,uVar8,pcVar4);
          }
          if (7 < iVar2 + 1) {
            return uVar8;
          }
          uVar8 = param_2->commands_pointer->c[iVar2++];
        }
      }
      break;
    }

  }
  return uVar8;
}

u32 dialoug_func_b_check(dialougeInstance *param_1,Borg13Data *param_2,u8 param_3){
  u8 bVar1;
  bool bVar2;
  u32 uVar4;
  u32 i;
  
  bVar2 = false;
  uVar4 = 0;
  for(u8 i=0;!bVar2,i<4;i++){
    bVar1 = param_2->commands_pointer[param_3].ops[i].com;
    if (bVar1 == 0) bVar2 = true;
    else if (((true) && (bVar1 < B13Com_SetFlag)) && (B13Com_CheckMemberInParty <= bVar1)) {
      uVar4 = (*d_func_B_pointer)(param_1,param_2,bVar1,param_2->commands_pointer[param_3].ops[i].val);
      bVar2 = true;
    }
  }
  return uVar4;
}


void Dialoug_commands(dialougeInstance *param_1,Borg13Data *param_2,u8 param_3){
  borg13command *pbVar1;
  bool bVar2;
  int iVar3;
  int iVar6;
  u8 i;
  u32 uVar9;
  char acStack_130 [256];
  int iStack_30;
  
  iStack_30 = 0;
  if (param_3 != 0xff) {
    i = 0;
    pbVar1 = param_2->commands_pointer;
    for(i=0;i<4;i++){
        if(pbVar1[param_3].ops[i].com==B13Com_SetEnt){
            param_1->Entid=pbVar1[param_3].ops[i].val;
        }
    }
LAB_800b6770:
    i = 0;
    do {
      uVar9 = (u32)param_3;
      if (false) goto switchD_800b67ac_caseD_1;
      switch(param_2->commands_pointer[param_3].ops[i].com){
      case 0:
        iStack_30 = 1;
        break;
      case B13Com_15:
        param_1->unk108 =param_2->commands_pointer[param_3].ops[i].val;
        break;
      case B13Com_LoadMonster:
        for(u8 uVar7=0,bVar2 = false;!bVar2;uVar7++) {
          if (uVar7 == 0xc) {
            sprintf(acStack_130,"Dialog LoadMonster command: Too many monsters");
            CRASH("./src/dialog.cpp",acStack_130);
          }
          if (param_1->encounterEnemies[uVar7] == 0) {
            bVar2 = true;
            param_1->encounterEnemies[uVar7] =param_2->commands_pointer[param_3].ops[i].val;
          }
        }
        goto LAB_800b68e0;
      case B13Com_SetCollideByte:
        param_1->collisionByte =param_2->commands_pointer[param_3].ops[i].val;
        break;
      case B13Com_SetBattlefield:
        param_1->battlefeild =param_2->commands_pointer[param_3].ops[i].val;
        break;
      case B13Com_setAniByte:
        param_1->aniByte =param_2->commands_pointer[param_3].ops[i].val;
        break;
      case B13Com_60:
        FUN_800b5a1c(param_2);
      }
switchD_800b67ac_caseD_1:
LAB_800b68e0:
    } while ((iStack_30 == 0) && (i++, i < 4));
    iStack_30 = 0;
    i = 0;
    do {
      iVar3 = i * 8;
      pbVar1 = param_2->commands_pointer;
      switch(param_2->commands_pointer[param_3].ops[i].com) {
      case 0:
        iStack_30 = 1;
        break;
      case B13Com_CameraCutTo:
      case B13Com_CameraOn:
      case B13Com_CameraAngleTo:
      case B13Com_CameraPanTo:
      case B13Com_CameraSineTo:
      case B13Com_SetActorFacing:
      case B13Com_CreateActor:
        (*d_func_A_pointer)(param_1,param_2,param_2->commands_pointer[param_3].ops[i].com,
                            param_2->commands_pointer[param_3].ops[i].val + param_1->RefpointID);
        break;
      case B13Com_CutToPOV:
      case B13Com_CameraOnPOV:
      case B13Com_CameraAngleToPOV:
      case B13Com_CameraPanToPOV:
      case B13Com_CameraSineToPOV:
      case B13Com_CameraTrackOn:
        (*d_func_A_pointer)(param_1,param_2,param_2->commands_pointer[param_3].ops[i].com,
                            param_2->commands_pointer[param_3].ops[i].val);
      }
LAB_800b69c4:
    } while ((iStack_30 == 0) && (i++, i < 4));
  }
}


void dialoug_func_c_check(dialougeInstance *param_1,Borg13Data *param_2,u8 param_3){
  bool bVar1;
  u8 i = 0;
  bVar1 = false;
  if (param_3 != 0xff) {
    for(i=0;!bVar1,i<4;i++){
      if (false) goto switchD_800b6a84_caseD_1;
      switch(param_2->commands_pointer[param_3].ops[i].com) {
      case 0:
        goto switchD_800b6a84_caseD_0;
      case B13Com_EndDialoug:
      case B13Com_Shop:
      case B13Com_Battle:
      case B13Com_Train:
      case B13Com_CampHeal:
        param_1->borg13End = 1;
      case B13Com_SetFlag:
      case B13Com_UnsetFlag:
      case B13Com_Fade35:
      case B13Com_AddGold:
      case B13Com_TakeGold:
      case B13Com_AddItem:
      case B13Com_TakeItem:
      case B13Com_PlaySFX:
      case B13Com_AddMember:
      case B13Com_RemoveMember:
      case B13Com_Unimplemented49:
      case B13Com_ShowItem:
      case B13Com_HideItem:
      case B13Com_53:
      case B13Com_AddExp:
        goto LAB_800b6af4;
      case B13Com_ActorWalk:
      case B13Com_ActorRun:
        param_1->unk110 = param_3;
        (*d_func_C_pointer)(param_1,param_2,param_2->commands_pointer[param_3].ops[i].com,
                            param_2->commands_pointer[param_3].ops[i].val+ (u32)param_1->RefpointID);
        bVar1 = true;
        break;
      case B13Com_ApplyStimulus:
      case B13Com_RandDialog:
      case B13Com_57:
      case B13Com_58:
        param_1->unk110 = param_3;
LAB_800b6af4:
        Borg13Op *puVar2 = &param_2->commands_pointer[param_3].ops[i];
        (*d_func_C_pointer)(param_1,param_2,puVar2->com,puVar2->val);
switchD_800b6a84_caseD_0:
        bVar1 = true;
      }
switchD_800b6a84_caseD_1:
    }
  }
  return;
}

int FUN_800b6b54(dialougeInstance *param_1,byte param_2,char *param_3)

{
  dialougeInstance *pdVar2;
  int i;
  
  i = 0;
  pdVar2 = param_1;
  do {
    if (pdVar2->diags[1].next == 0xff) {
      pdVar2->diags[1].next = param_2;
      pdVar2->diags[0].txt = param_3;
      pdVar2->diags[0].ent_ID = param_1->Entid;
      return i;
    }
    i += 1;
    pdVar2 = (dialougeInstance *)(pdVar2->diags + 1);
  } while (i < 9);
  return -1;
}

void FUN_800b6b9c(dialougeInstance *param_1){
  struct_3* x=param_1->diags;
  for(s32 i = 8;-1 < i;i--,x++){
    x[1].next = 0xff;
    x[0].txt = NULL;
    x[0].ent_ID=0;
  }
}

void get_dialouge_actors(dialougeInstance *param_1,Borg13Data *param_2){
  playerData *ppVar1;
  u16 *puVar2;
  u16 (*pauVar3) [4];
  ActorAndID *pAVar4;
  int iVar5;
  u32 uVar6;
  
  iVar5 = 0;
  if (param_2->ActorCount != 0) {
    pAVar4 = param_1->actors;
    pauVar3 = param_2->actors;
    do {
      puVar2 = *pauVar3;
      ppVar1 = *(playerData **)*pauVar3;
      pauVar3++;
      iVar5++;
      pAVar4->id = puVar2[2];
      pAVar4->actor = ppVar1;
      pAVar4++;
    } while (iVar5 < (int)(u32)param_2->ActorCount);
  }
  pAVar4 = param_1->actors + param_2->ActorCount;
  for(uVar6 = (u32)param_2->ActorCount;uVar6<16;uVar6++,pAVar4++){
      pAVar4->id = 0;
      pAVar4->actor = NULL;
  }
}


void FUN_800b6c38(dialougeInstance *param_1,u16 param_2)

{
  char **ppcVar1;
  u16 *puVar2;
  int iVar3;
  
  iVar3 = 0xb;
  puVar2 = param_1->encounterEnemies + 0xb;
  param_1->unk108 = 60;
  param_1->RefpointID = param_2;
  param_1->unk110 = -1;
  param_1->unk116 = 0xff;
  param_1->Entid=0;
  param_1->borg13End = 0;
  param_1->actorsLoaded = false;
  param_1->battlefeild = 0;
  param_1->collisionByte = 0;
  param_1->aniByte = 0;
  param_1->unk10e = 0xffff;
  do {
    *puVar2 = 0;
    iVar3--;
    puVar2--;
  } while (-1 < iVar3);
  ppcVar1 = &param_1->diags[0].txt;
  iVar3 = 8;
  do {
    param_1->diags[1].next = 0xff;
    *ppcVar1 = NULL;
    ppcVar1 = ppcVar1 + 3;
    param_1->diags[0].ent_ID = 0;
    iVar3 += -1;
    param_1 = (dialougeInstance *)(param_1->diags + 1);
  } while (-1 < iVar3);
  return;
}


byte FUN_800b6cb8(dialougeInstance *param_1,Borg13Data *param_2,byte param_3){
  byte bVar1;
  
  FUN_800b6b9c(param_1);
  if (!param_1->actorsLoaded) {
    get_dialouge_actors(param_1,param_2);
    bVar1 = DialogNode_func(param_1,param_2);
    param_1->actorsLoaded = true;
  }
  else bVar1 = dialogNode_func_2(param_1,param_2,param_3);
  return bVar1;
}

void Ofunc_800b6d30(){}


int Ofunc_800b6d38(Borg13Data *param_1,int param_2){
  u8 bVar1;
  borg13command *pbVar2;
  int iVar3;
  u16 *puVar4;
  borg13command *pbVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  
  iVar7 = 0;
  if (param_1->CmdCount != 0) {
    pbVar2 = param_1->commands_pointer;
    iVar6 = 1;
    iVar3 = 0;
    do {
      iVar8 = iVar6;
      pbVar5 = pbVar2 + iVar3;
      puVar4 = (u16 *)(iVar7 * 2 + param_2);
      iVar6 = 3;
      do {
        bVar1 = pbVar5->ops[0].com;
        if ((bVar1 < B13Com_ShowItem) && (B13Com_RemoveMember < bVar1)) {
          iVar7 += 1;
          *puVar4 = pbVar5->ops[0].val;
          puVar4 = puVar4 + 1;
        }
        iVar6 += -1;
        pbVar5 = (borg13command *)(pbVar5->ops + 1);
      } while (-1 < iVar6);
      iVar6 = iVar8 + 1;
      iVar3 = iVar8;
    } while (iVar8 < (int)(u32)param_1->CmdCount);
  }
  return iVar7;
}


int Ofunc_800b6dbc(Borg13Data *param_1,int param_2,int param_3)

{
  u16 uVar1;
  borg13command *pbVar2;
  u16 *puVar3;
  Borg13Op *pBVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  
  iVar8 = 0;
  iVar5 = 0;
  if (param_1->CmdCount != 0) {
    pbVar2 = param_1->commands_pointer;
    iVar7 = 0;
    do {
      iVar6 = 0;
      pBVar4 = pbVar2->ops + iVar7;
      puVar3 = (u16 *)(iVar5 * 2 + param_2);
      do {
        if ((pBVar4->com < B13Com_ShowItem) && (B13Com_RemoveMember < pBVar4->com)) {
          if (param_3 < iVar5) {
            return iVar5;
          }
          uVar1 = *puVar3;
          puVar3 = puVar3 + 1;
          iVar5 += 1;
          pBVar4->val = uVar1;
        }
        iVar6 += 1;
        pBVar4 = pBVar4 + 1;
      } while (iVar6 < 4);
      iVar8 += 1;
      iVar7 += 7;
    } while (iVar8 < (int)(u32)param_1->CmdCount);
  }
  return iVar5;
}


bool FUN_800b6e4c(dialougeInstance *param_1,Borg13Data *param_2,float param_3){
  u8 uVar3;
  if (0.0 <= param_3) {
    if (1.0f < param_3) return false;
    if (param_2->CmdCount != 0) {
      FUN_800b6b9c(param_1);
      if (param_3 == 1.0f) uVar3 = param_2->CmdCount - 1;
      else uVar3 = (u8)(int)(param_3 / (1.0f / (float)param_2->CmdCount));
      FUN_800b6b54(param_1,param_1->unk110,get_borg_13_text(param_2,uVar3));
      return true;
    }
  }
  return false;
}
