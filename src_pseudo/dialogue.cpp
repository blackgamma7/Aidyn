#include "globals.h"
#include "voxelChart.h"

void DialougCreateScriptCamera(u16 param_1,s16 id,playerData *player,u16 flags,float param_5){
  ushort uVar1;
  ScriptCam *pSVar2;
  
  pSVar2 = AllocScriptCamera(&gGlobals.scriptcamera,param_1);
  uVar1 = (pSVar2->voxel).camera.CameraFlags;
  pSVar2->aim = &player->positionMirror;
  (pSVar2->voxel).camera.refpoint_ID = id;
  pSVar2->flag = 2;
  (pSVar2->voxel).camera.CameraFlags = flags | uVar1;
  pSVar2->field5_0xc = param_5;
  if (id == 0) {
    (pSVar2->voxel).camera.refpoint_ID = 0;
  }
  gGlobals.scriptcamera.counter1 += 1;
  gGlobals.scriptcamera.counter0 += 1;
  if (player == NULL) {
                    // WARNING: Subroutine does not return
    CRASH(s_NULL_Player_pointer_in_CreateScr_800de7b0,"./src/dialogue.cpp");
  }
  GiveCameraToPlayer(player);

}

ActorAndID * DialougGetActorAndID(dialougmode_substruct *param_1,Borg13Data *param_2,ItemID id){
  if (param_2->ActorCount != 0) {
    for(u8 i=0;i<param_2->ActorCount;i++){
      if (param_1->actors[i].id == id)
        return &param_1->actors[i];
    }
  }
  return NULL;
}

CharSheet * DialougGetPartyMemberName(ItemID param_1){
  for(u8 i=0;i<4;i++){
    if(PARTY->Members[i]->ID==param_1) return PARTY->Members[i];
  }
  return NULL;
}

void DialougFreeActors(dialougmode_substruct *param_1,Borg13Data *param_2){
  if (param_2->ActorCount != 0) {
    for(u16 i=0;i<param_2->ActorCount;i++){
      playerData * pDat=param_1->actors[i].actor;
      if (pDat) {
        Actor::FreePlayer(pDat);
        pDat = NULL;
      }
    }
  }
  if ((param_2->start_func != 0) && (param_2->start_func != 3))
    gGlobals.playerCharStruct.playerDat = NULL;
}


void DialoguePreCallback(dialougmode_substruct *param_1,Borg13Data *param_2,ushort cmd,
                        s16 refpointID)

{
  byte bVar1;
  u16 uVar2;
  bool bVar3;
  bool bVar4;
  undefined4 uVar5;
  byte *pbVar6;
  ActorAndID *pAI;
  u16 BVar7;
  playerData *ppVar8;
  uint uVar9;
  float fVar10;
  float fVar11;

  byte uStack376 [6];
  vec2f fStack312;
  vec2f afStack248;
  vec2f avStack_b8;
  vec2f fStack120;
  voxelObject *pVOR;
  
  pAI = NULL;
  ppVar8 = NULL;
  pVOR = NULL;

  fVar10 = 0.0;
  uVar2 = param_1->unk108;
  u8 uStack440[]={18,5,13,4,12,0xFF};
  for(u16 i=0;uStack440[i]!=0xFF;i++){
    if (uStack440[i] == cmd) FUN_80018b84();
  }
  bVar3 = false;
  u8 uStack376[]={7,9,11,5,13,0xFF};
  for(u16 i=0;uStack376[i]!=0xFF;i++){
    if (uStack376[i] == cmd) {
      pAI = DialougGetActorAndID(param_1,param_2,refpointID);
      if (pAI) ppVar8 = pAI->actor;
      if (ppVar8 == NULL) CRASH("No Player in DialoguePreCallback","./src/dialogue.cpp");
      fVar10 = gEntityDB->GetHeightMinPoint2(pAI->id);
      fStack312.x = (ppVar8->facing).x;
      fStack312.y = (ppVar8->facing).y;
      fVar10-= ppVar8->interactRadiusB;
      multiVec2(&fStack312,-0.15);
      setVec3(&ppVar8->positionMirror,fStack312.x + (ppVar8->collision).pos.x,
              (ppVar8->collision).pos.y,fStack312.y + (ppVar8->collision).pos.z);
      bVar3 = true;
      if (uStack376[i] == 5) {
        Actor::SetFlag(ppVar8,ACTOR_2000);
        bVar3 = true;
      }
      break;
    }
  }
  if (!bVar3) {
    pAI = DialougGetActorAndID(param_1,param_2,param_1->Entid);
    if (pAI) ppVar8 = pAI->actor;
    if (ppVar8) copyVec3(&(ppVar8->collision).pos,&ppVar8->positionMirror);
  }
  if (refpointID) {
    pVOR = get_map_referencepoint(gGlobals.Sub.borg9DatPointer,refpointID);
  }
  switch(cmd) {
  case 4:
    goto LAB_80057134;
  case 5:
    refpointID = 0;
LAB_80057134:
    DialougCreateScriptCamera(1,refpointID,ppVar8,0x8001,fVar10);
    break;
  case 6:
    goto LAB_80057098;
  case 7:
    refpointID = 0;
LAB_80057098:
    DialougCreateScriptCamera(1,refpointID,ppVar8,0x4001,fVar10);
    break;
  case 8:
    goto LAB_800570e0;
  case 9:
    refpointID = 0;
    goto LAB_800570bc;
  case 10:
LAB_800570bc:
    DialougCreateScriptCamera(uVar2,refpointID,ppVar8,0x4004,fVar10);
    break;
  case 0xb:
    refpointID = 0;
LAB_800570e0:
    DialougCreateScriptCamera(uVar2,refpointID,ppVar8,0x4002,fVar10);
    break;
  case 0xc:
    DialougCreateScriptCamera(uVar2,refpointID,ppVar8,0x8004,fVar10);
    break;
  case 0xd:
    DialougCreateScriptCamera(uVar2,0,ppVar8,0x8004,fVar10);
  default:
    break;
  case 0xe:
    DialougCreateScriptCamera(uVar2,0,ppVar8,0x2000,fVar10);
    break;
  case 0x11:
    setVec2(&afStack248,(ppVar8->collision).pos.x,(ppVar8->collision).pos.z);
    setVec2(&avStack_b8,(pVOR->header).pos.x,(pVOR->header).pos.z);
    Vec2_Sub(&fStack120,&afStack248,&avStack_b8);
    vec2_normalize(&fStack120);
    Actor::SetFacing(ppVar8,fStack120.x,fStack120.y);
    break;
  case 0x12:
    if (pAI == NULL) CRASH("No pAI","./src/dialogue.cpp");
    if (pVOR == NULL) CRASH("No pVOR","./src/dialogue.cpp");
    if (pAI->actor) CRASH("DialoguePreCallback","Actor Already Allocated!(ActorAndID::pPlayer != NULL)");
    BVar7 = gEntityDB->GetBorg7(pAI->id);
    ppVar8 = Actor::AllocPlayer(gEntityDB->GetFloatC(pAI->id),(pVOR->header).pos.x,(pVOR->header).pos.y,
                                (pVOR->header).pos.z,BVar7);
    pAI->actor = ppVar8;
    Actor::CheckCollision(ppVar8,0.0,0,0);
    fVar10 = gEntityDB->GetScale(pAI->id);
    fVar11 = (ppVar8->collision).radius;
    ppVar8->interactRadiusA = fVar10;
    ppVar8->flags |= (ACTOR_1000|ACTOR_400);
    ppVar8->interactRadiusB = fVar10 * fVar11;
    break;
  }
  return;
}

s32 DialougCallbackB(dialougmode_substruct *param_1,Borg13Data *param_2,u16 cmd,u16 VAL){
  s32 ret;
  
  switch(cmd) {
  case B13Com_CheckMemberInParty:
    ret = PARTY->IsCharacterInParty(VAL);
    break;
  case B13Com_CheckEventFlag:
    ret = getEventFlag(VAL);
    break;
  case B13Com_CheckPartySkill:
    ret = dialougSkillCheck(VAL);
    if (getEventFlag(0xe85))
      ret = (u16)rand_range(0,21);
    break;
  case B13Com_CheckForItem:
    ret = PARTY->hasItem(VAL);
    break;
  case B13Com_CheckBestStat:
    ret = PARTY->BestStat(VAL);
    break;
  case B13Com_CheckWorstStat:
    ret = PARTY->WorstStat(VAL);
    break;
  case B13Com_CheckMemberStat:
    ret = PARTY->GetMemberStat(param_1->Entid,VAL);
    break;
  case B13Com_CheckPartySize:
    ret = (gGlobals.party)->PartySize;
    break;
  case B13Com_CheckPartyGoldU16:
    ret = (u16)(gGlobals.party)->Gold;
    break;
  default:
    ret = 0;
  }
  return ret;
}

void dialougemode_0x90_funcs3(undefined4 param_1){
  set_dialougemode_0x90(param_1);
  run_dialougemode_funcs3();
}

void DialogCallbackC(dialougmode_substruct *param_1,Borg13Data *param_2,short command,u16 param_4){
  ActorAndID *pAVar2;
  voxelObject *prVar3;
  s16 sVar8;
  CharSheet *pCVar4;
  bool bVar9;
  Borg13Header *pBVar5;
  short *psVar6;
  u16 *puVar7;
  undefined4 uVar10;
  u32 borg12;
  char *pcVar11;
  undefined8 uVar12;
  char *cause;
  uint uVar13;
  playerData *p;
  float fVar14;
  u16 flag;
  char acStack_470 [256];
  ItemInstance auStack880;
  char acStack_330 [256];
  char acStack_230 [256];
  char acStack_130 [256];
  Borg13Header *apBStack_30;
  
  p = NULL;
  prVar3 = NULL;
  uVar13 = (uint)param_4;
  pAVar2 = DialougGetActorAndID(param_1,param_2,param_1->Entid);
  if (pAVar2 != NULL) {
    p = pAVar2->actor;
  }
  if (uVar13 != 0) {
    prVar3 = get_map_referencepoint(gGlobals.Sub.borg9DatPointer,param_4);
  }
  if (0x1a < (ushort)(command - 0x20U)) {
    return;
  }
  switch(command) {
  case 0x20:
    setEventFlag(param_4,true);
    break;
  case 0x21:
    setEventFlag(param_4,false);
    break;
  case 0x22:
    uVar10 = 1;
    goto LAB_80057628;
  case 0x23:
    gGlobals.brightness2 = -1.0f;
    gGlobals.screenFadeSpeed = (1.0f/60);
    gGlobals.screenFadeMode = 3;
    return;
  case 0x24:
    borg12 = Coins_jingle;
    (gGlobals.party)->Gold+=param_4;
    goto play_sound;
  case 0x25:
    if ((gGlobals.party)->Gold < uVar13) {
      return;
    }
    borg12 = coinJingle;
    (gGlobals.party)->Gold-=param_4;
    goto play_sound;
  case 0x26:
    PARTY->Inventory->AddItem(uVar13,1);
    break;
  case 0x27:
    if (!gGlobals.party->TakeItem(param_4)) {
      auStack880.InitItem(param_4);
      pcVar11 = acStack_330;
      sprintf(pcVar11,"Party doesn't have that item in their inventory!\nTell someone to fix dialogue %d to check the party's inventory before taking trying to take the %s!",param_2->ID,
                  auStack880.name);
      goto print_error;
    }
    break;
  case 0x28:
    flag = 1;
    goto LAB_80057798;
  case 0x29:
    flag = 0;
LAB_80057798:
    Actor::SetAiDest(p,(prVar3->header).pos.x,(prVar3->header).pos.z,1.0,flag);
    FUN_80058370();
    break;
  case 0x2a:
    FUN_800585d0(uVar13);
    break;
  case 0x2b:
    borg12 = dialoug_SFX[param_4];
play_sound:
    PlayAudioSound(&gGlobals.SFXStruct,borg12,0,gGlobals.VolSFX,300,0);
    break;
  case 0x2c:
    shop_func();
    uVar10 = 7;
    goto LAB_80057628;
  case 0x2d:
    encounterDat_func();
    uVar10 = 2;
    goto LAB_80057628;
  case 0x2e:
    init_skill_trainer();
    uVar10 = 5;
    goto LAB_80057628;
  case 0x2f:
    bVar9 = DialougeAddPartyMember((ItemID)param_4);
    if (!bVar9) {
      cause = acStack_230;
      pcVar11 = "Couldn't add %d to the party. This usually means that the party is full. Line = %d";
      uVar12 = 0x494;
print_error_2:
      sprintf(cause,pcVar11,uVar13,uVar12);
      Crash::ManualCrash("./src/dialogue.cpp",cause);
    }
    break;
  case 0x30:
    PARTY->removeAliveMemberByID(param_4);
    break;
  case 0x31:
    pcVar11 = "Dialogue Command executed!\nThis command has not been implemented yet!";
print_error:
                    // WARNING: Subroutine does not return
    Crash::ManualCrash(pcVar11,"./src/dialogue.cpp");
  case 0x32:
    pBVar5 = get_borg13((uint)param_4);
    if (pBVar5 == NULL) {
      cause = acStack_130;
      pcVar11 = "Couldn't load dialog with id = %d. Line = %d";
      uVar12 = 0x529;
      goto print_error_2;
    }
    fVar14 = rand_range(0,100) / 100.0f;
    if (dialougemode_pointer->Unk0x7C != 0x7fff) {
      VoxelChartEntry*v0 = some_ref_obj_lookup_func(dialougemode_pointer->Unk0x7C,
                            (u8)dialougemode_pointer->mapDatA,
                            (u8)dialougemode_pointer->mapShort1,
                            (u8)dialougemode_pointer->mapShort2,0x11,9);
      if (v0 == NULL) {
        v0 = passto_WriteTo_VoxelChart(dialougemode_pointer->Unk0x7C,
                            (u8)dialougemode_pointer->mapDatA,
                            (u8)dialougemode_pointer->mapShort1,
                            (u8)dialougemode_pointer->mapShort2,0x11,9,10);
        v0->unk0x8 = fVar14;
      }
      else {
        fVar14 = v0->unk0x8;
        v0->arg7 = 10;
      }
    }
    FUN_800b6e4c(param_1,pBVar5->dat,fVar14);
    apBStack_30 = pBVar5;
    FREEQB13(apBStack_30);
    break;
  case 0x33:
    sVar8 = get_item_borg5((ItemID)param_4);
    if (sVar8 != -1) {
      AttachItemToPlayer(p,0,(int)sVar8);
    }
    break;
  case 0x34:
    FreeAttachmentFromPlayer(p,0);
    break;
  default:
    return;
  case 0x36:
    PARTY->CampHeal(false);
    dialougemode_pointer->camp_flag = 1;
    uVar10 = 1;
    if (param_2->start_func == 0) {
      gGlobals.screenFadeMode = 2;
      gGlobals.brightness = 0.0;
      gGlobals.screenFadeSpeed = (1.0f/60);
    }
LAB_80057628:
    dialougemode_0x90_funcs3(uVar10);
    break;
  case 0x38:
    pCVar4 = PARTY->GetMemberById(param_1->Entid);
    if (pCVar4 == NULL) {
      sprintf(acStack_470,"Trying to get a party member that isn't in the party (id = %d)\nLine = %d",
                  param_1->Entid,0x445);
      pcVar11 = acStack_470;
      goto print_error;
    }
    PlayAudioSound(&gGlobals.SFXStruct,BORG12_ChimeScale,0,gGlobals.VolSFX,300,0);
    Entity::AddExp(pCVar4,(uint)param_4);
    break;
  case 0x39:
    FUN_800583d0(uVar13);
    return;
  case 0x3a:
    set_some_borg13_flag();
  }
  return;
}
char * DialougfindPlayerNameSpace(char *str){
  char cVar1;
  uint len;
  int iVar3;
  char *pcVar4;
  
  len = strlen(str);
  if ((0x13 < (int)len) && (pcVar4 = str + (len - 0x14), str != pcVar4)) {
    cVar1 = *str;
    while( true ) {
      if (cVar1 == '#') {
        iVar3 = 0x13;
        if (str[0x13] == '#') {
          for (iVar3 = 0x12; (0 < iVar3 && (str[iVar3] == '#')); iVar3 += -1) {
          }
        }
        if (iVar3 == 0) return str;
      }
      str++;
      if (str == pcVar4) break;
      cVar1 = *str;
    }
  }
  return NULL;
}


void DialougInsertPlayerName(char *str){
  uint uVar1;
  char *pcVar2;
  int iVar3;
  
  if ((str != NULL) && (uVar1 = strlen(str), uVar1)) {
    while( true ) {
      pcVar2 = DialougfindPlayerNameSpace(str);
      iVar3 = 0;
      if (pcVar2 == NULL) break;
      str = pcVar2 + 0x14;
      for (; uVar1 = strlen((gGlobals.party)->Members[0]->name), iVar3 < (int)uVar1; iVar3 += 1) {
        pcVar2[iVar3] = (gGlobals.party)->Members[0]->name[iVar3];
      }
    }
  }
}


void some_string_func(char *str)

{
  byte bVar1;
  byte bVar2;
  uint uVar3;
  char cVar4;
  char cVar5;
  
  if ((str != NULL) && (uVar3 = strlen(str), uVar3 != 0)) {
    cVar4 = *str;
    while (cVar4) {
      if (cVar4 == '\\') {
        cVar4 = str[1];
        if (cVar4 == '\0') {
LAB_80057a20:
          cVar5 = *str;
        }
        else if (cVar4 == 'x') {
          if (str[2]) {
            bVar1 = str[3];
            if (bVar1 != 0) {
              bVar2 = str[2];
              cVar4 = bVar2 - '0';
              if ('A' < bVar2) {
                cVar4 = bVar2 - 0x37;
              }
              if (bVar1 < 'B') cVar5 -48;
              else {
                cVar5 = -0x37;
              }
              *str = cVar4 * '\x10' + bVar1 + cVar5;
              str[1] = '#';
              str[2] = '#';
              str[3] = '#';
              str+=4;
              goto LAB_80057a4c;
            }
            goto LAB_80057a20;
          }
          cVar5 = *str;
        }
        else {
          cVar5 = *str;
        }
        if (cVar5 == '\\') {
          if (!cVar4) str++;
          else if (cVar4 == 'n') {
            *str = '\n';
            str[1] = '#';
            str+=2;
          }
          else str++;
        }
        else str++;
      }
      else str++;
LAB_80057a4c:
      cVar4 = *str;
    }
  }
  return;
}
