#include "globals.h"
#include "voxelChart.h"

void DialougCreateScriptCamera(u16 param_1,s16 id,playerData *player,u16 flags,float height){
  ScriptCam *sCam = AllocScriptCamera(&gGlobals.scriptcamera,param_1);
  sCam->aim = &player->positionMirror;
  (sCam->voxel).camera.refpoint_ID = id;
  sCam->flag = 2;
  (sCam->voxel).camera.CameraFlags|= flags;
  sCam->height = height;
  if (id == 0) (sCam->voxel).camera.refpoint_ID = 0;
  gGlobals.scriptcamera.counter1++;
  gGlobals.scriptcamera.counter0++;
  if (player == NULL)
    CRASH("NULL Player pointer in CreateScriptCamera()!","./src/dialogue.cpp");
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
  float camHeight;
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

  camHeight = 0.0;
  uVar2 = param_1->unk108;
  u8 uStack440[]={
    B13Com_CreateActor,B13Com_CutToPOV,B13Com_CameraSineToPOV,
    B13Com_CameraCutTo,B13Com_CameraSineTo,0xFF};
  for(u16 i=0;uStack440[i]!=0xFF;i++){
    if (uStack440[i] == cmd) FUN_80018b84();
  }
  bVar3 = false;
  u8 uStack376[]={
    B13Com_CameraOnPOV,B13Com_CameraAngleToPOV,B13Com_CameraPanToPOV,
    B13Com_CutToPOV,B13Com_CameraSineToPOV,0xFF};
  for(u16 i=0;uStack376[i]!=0xFF;i++){
    if (uStack376[i] == cmd) {
      pAI = DialougGetActorAndID(param_1,param_2,refpointID);
      if (pAI) ppVar8 = pAI->actor;
      if (ppVar8 == NULL) CRASH("No Player in DialoguePreCallback","./src/dialogue.cpp");
      camHeight = gEntityDB->GetHeightMinPoint2(pAI->id);
      fStack312.x = (ppVar8->facing).x;
      fStack312.y = (ppVar8->facing).y;
      camHeight-= ppVar8->interactRadiusB;
      multiVec2(&fStack312,-0.15);
      setVec3(&ppVar8->positionMirror,fStack312.x + (ppVar8->collision).pos.x,
              (ppVar8->collision).pos.y,fStack312.y + (ppVar8->collision).pos.z);
      bVar3 = true;
      if (uStack376[i] == B13Com_CutToPOV) {
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
  case B13Com_CameraCutTo:
    goto LAB_80057134;
  case B13Com_CutToPOV:
    refpointID = 0;
LAB_80057134:
    DialougCreateScriptCamera(1,refpointID,ppVar8,CamOBJ_CopyPos|CamOBJ_MoveCut,camHeight);
    break;
  case B13Com_CameraOn:
    goto LAB_80057098;
  case B13Com_CameraOnPOV:
    refpointID = 0;
LAB_80057098:
    DialougCreateScriptCamera(1,refpointID,ppVar8,CamOBJ_CopyAim|CamOBJ_MoveCut,camHeight);
    break;
  case B13Com_CameraAngleTo:
    goto LAB_800570e0;
  case B13Com_CameraAngleToPOV:
    refpointID = 0;
    goto LAB_800570bc;
  case B13Com_CameraPanTo:
LAB_800570bc:
    DialougCreateScriptCamera(uVar2,refpointID,ppVar8,CamOBJ_CopyAim|CamOBJ_MoveSine,camHeight);
    break;
  case B13Com_CameraPanToPOV:
    refpointID = 0;
LAB_800570e0:
    DialougCreateScriptCamera(uVar2,refpointID,ppVar8,CamOBJ_CopyAim|CamOBJ_MovePan,camHeight);
    break;
  case B13Com_CameraSineTo:
    DialougCreateScriptCamera(uVar2,refpointID,ppVar8,CamOBJ_CopyPos|CamOBJ_MoveSine,camHeight);
    break;
  case B13Com_CameraSineToPOV:
    DialougCreateScriptCamera(uVar2,0,ppVar8,CamOBJ_CopyPos|CamOBJ_MoveSine,camHeight);
  default:
    break;
  case B13Com_CameraTrackOn:
    DialougCreateScriptCamera(uVar2,0,ppVar8,CamOBJ_TrackOn,camHeight);
    break;
  case B13Com_SetActorFacing:
    setVec2(&afStack248,(ppVar8->collision).pos.x,(ppVar8->collision).pos.z);
    setVec2(&avStack_b8,(pVOR->header).pos.x,(pVOR->header).pos.z);
    Vec2_Sub(&fStack120,&afStack248,&avStack_b8);
    vec2_normalize(&fStack120);
    Actor::SetFacing(ppVar8,fStack120.x,fStack120.y);
    break;
  case B13Com_CreateActor:
    if (pAI == NULL) CRASH("No pAI","./src/dialogue.cpp");
    if (pVOR == NULL) CRASH("No pVOR","./src/dialogue.cpp");
    if (pAI->actor) CRASH("DialoguePreCallback","Actor Already Allocated!(ActorAndID::pPlayer != NULL)");
    BVar7 = gEntityDB->GetBorg7(pAI->id);
    ppVar8 = Actor::AllocPlayer(gEntityDB->GetFloatC(pAI->id),(pVOR->header).pos.x,(pVOR->header).pos.y,
                                (pVOR->header).pos.z,BVar7);
    pAI->actor = ppVar8;
    Actor::CheckCollision(ppVar8,0.0,0,0);
    camHeight = gEntityDB->GetScale(pAI->id);
    fVar11 = (ppVar8->collision).radius;
    ppVar8->interactRadiusA = camHeight;
    ppVar8->flags |= (ACTOR_1000|ACTOR_400);
    ppVar8->interactRadiusB = camHeight * fVar11;
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
    if (getEventFlag(3717))
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

void DialogCallbackC(dialougmode_substruct *param_1,Borg13Data *param_2,short command,u16 val){
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
  pAVar2 = DialougGetActorAndID(param_1,param_2,param_1->Entid);
  if (pAVar2) p = pAVar2->actor;
  if (val) prVar3 = get_map_referencepoint(gGlobals.Sub.borg9DatPointer,val);
  if (0x1a < (ushort)(command - B13Com_SetFlag)) return; //not a vaild command for this function
  switch(command) {
  case B13Com_SetFlag:
    setEventFlag(val,true);
    break;
  case B13Com_UnsetFlag:
    setEventFlag(val,false);
    break;
  case B13Com_EndDialoug:
    uVar10 = 1;
    goto LAB_80057628;
  case B13Com_Fade35:
    gGlobals.brightness2 = -1.0f;
    gGlobals.screenFadeSpeed = (1.0f/60);
    gGlobals.screenFadeMode = 3;
    return;
  case B13Com_AddGold:
    borg12 = BORG12_CoinJingle;
    (gGlobals.party)->Gold+=val;
    goto play_sound;
  case B13Com_TakeGold:
    if ((gGlobals.party)->Gold < val) return;
    borg12 = BORG12_CoinJingle2;
    (gGlobals.party)->Gold-=val;
    goto play_sound;
  case B13Com_AddItem:
    PARTY->Inventory->AddItem(val,1);
    break;
  case B13Com_TakeItem:
    if (!gGlobals.party->TakeItem(val)) {
      auStack880.InitItem(val);
      pcVar11 = acStack_330;
      sprintf(pcVar11,"Party doesn't have that item in their inventory!\nTell someone to fix dialogue %d to check the party's inventory before taking trying to take the %s!",param_2->ID,
                  auStack880.name);
      goto print_error;
    }
    break;
  case B13Com_ActorWalk:
    flag = 1;
    goto LAB_80057798;
  case B13Com_ActorRun:
    flag = 0;
LAB_80057798:
    Actor::SetAiDest(p,(prVar3->header).pos.x,(prVar3->header).pos.z,1.0,flag);
    FUN_80058370();
    break;
  case B13Com_ApplyStimulus:
    FUN_800585d0(val);
    break;
  case B13Com_PlaySFX:
    borg12 = dialoug_SFX[val];
play_sound:
    PlayAudioSound(&gGlobals.SFXStruct,borg12,0,gGlobals.VolSFX,300,0);
    break;
  case B13Com_Shop:
    shop_func();
    uVar10 = 7;
    goto LAB_80057628;
  case B13Com_Battle:
    encounterDat_func();
    uVar10 = 2;
    goto LAB_80057628;
  case B13Com_Train:
    init_skill_trainer();
    uVar10 = 5;
    goto LAB_80057628;
  case B13Com_AddMember:
    if (!DialougeAddPartyMember(val)) {
      cause = acStack_230;pcVar11 = "Couldn't add %d to the party. This usually means that the party is full. Line = %d";uVar12 = 1172;
print_error_2:
      sprintf(cause,pcVar11,val,uVar12);
      CRASH("./src/dialogue.cpp",cause);
    }
    break;
  case B13Com_RemoveMember:
    PARTY->removeAliveMemberByID(val);
    break;
  case B13Com_Unimplemented49:
    pcVar11 = "Dialogue Command executed!\nThis command has not been implemented yet!";
print_error:
    CRASH(pcVar11,"./src/dialogue.cpp");
  case B13Com_RandDialog:
    pBVar5 = get_borg13(val);
    if (pBVar5 == NULL) {
      cause = acStack_130;pcVar11 = "Couldn't load dialog with id = %d. Line = %d";uVar12 = 1321;
      goto print_error_2;
    }
    fVar14 = rand_range(0,100) / 100.0f;
    if (dialougemode_pointer->Unk0x7C != 0x7fff) {
      VoxelChartEntry*v0 = some_ref_obj_lookup_func(dialougemode_pointer->Unk0x7C,
                            (u8)dialougemode_pointer->mapDatA,
                            (u8)dialougemode_pointer->mapShort1,
                            (u8)dialougemode_pointer->mapShort2,0x11,VOXEL_Dialouge);
      if (v0 == NULL) {
        v0 = passto_WriteTo_VoxelChart(dialougemode_pointer->Unk0x7C,
                            (u8)dialougemode_pointer->mapDatA,
                            (u8)dialougemode_pointer->mapShort1,
                            (u8)dialougemode_pointer->mapShort2,0x11,VOXEL_Dialouge,10);
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
  case B13Com_ShowItem:
    sVar8 = get_item_borg5(val);
    if (sVar8 != -1) {
      AttachItemToPlayer(p,0,sVar8);
    }
    break;
  case B13Com_HideItem:
    FreeAttachmentFromPlayer(p,0);
    break;
  default:
    return;
  case B13Com_CampHeal:
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
  case B13Com_AddExp:
    pCVar4 = PARTY->GetMemberById(param_1->Entid);
    if (pCVar4 == NULL) {
      sprintf(acStack_470,"Trying to get a party member that isn't in the party (id = %d)\nLine = %d",
                  param_1->Entid,1093);
      pcVar11 = acStack_470;
      goto print_error;
    }
    PlayAudioSound(&gGlobals.SFXStruct,BORG12_ChimeScale,0,gGlobals.VolSFX,300,0);
    Entity::AddExp(pCVar4,val);
    break;
  case B13Com_57:
    FUN_800583d0(val);
    return;
  case B13Com_58:
    set_some_borg13_flag();
  }
  return;
}
//find "####################" to replace with player name
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

//replace "####################" with player name
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
