#include "globals.h"
#include "combat/CombatCamera.h"
#include "combat/Visuals.h"

#define FILENAME "./src/player.cpp"

u8 Actor::IsFlyingModel(playerData* p){
   //list of Borg7 indecies of models for flying creatures.
    u16 flyingB7s[]={
0x2d4A,0x3463,0x30c5,0x28dc,0x28e9,0x2be3,0x3094,0x31fe,0x3347,0
   }; 
   for(u32 i=0;flyingB7s[i]!=0;i++){
    if(p->borg7==flyingB7s[i]) return true;
   }
   return false;
}

void get_mapcellsize(u8 index,vec2f *out){
  switch(index >> 4){
    case 0: out->x = -gGlobals.Sub.mapCellSize.x; break;
    case 1: out->x = 0.0; break;
    case 2: out->x = gGlobals.Sub.mapCellSize.x; break;
  }
  switch(index&3){
    case 0: out->y = -gGlobals.Sub.mapCellSize.y; break;
    case 1: out->y = 0.0; break;
    case 2: out->y = gGlobals.Sub.mapCellSize.y; break;
  }
}

void Actor::GetPosOnLoadedMap(playerData *param_1,vec3f *param_2){
  vec2f temp;
  
  copyVec3(&(param_1->collision).pos,param_2);
  get_mapcellsize(param_1->zoneDatByte,&temp);
  param_2->x+= temp.x;
  param_2->z+= temp.y;
}

void Actor::AddPosOnLoadedMap(u8 param_1,vec2f *param_2){
  vec2f temp;
  
  get_mapcellsize(param_1,&temp);
  vec2_sum(param_2,param_2,&temp);
}

void Actor::SubPosOnLoadedMap(u8 param_1,vec3f *param_2){
  vec2f temp;
  
  get_mapcellsize(param_1,&temp);
  param_2->x-= temp.x;
  param_2->z-= temp.y;
}

u8 Actor::CheckCollision(playerData *param_1,float posY,short param_3,u16 attempt){
  float fVar1;
  bool bVar2;
  float fVar4;
  double dVar3;
  float fVar5;
  float fVar6;
  float fVar7;
  vec3f posA;
  vec3f posB;
  vec3f newPos;
  vec3f newRot;
  
  posA.x = (param_1->collision).pos.x;
  posA.z = (param_1->collision).pos.z;
  posA.y = 100.0f;
  posB.y = -100.0f;
  if (param_3) {
    posA.y = (float)((double)posY + 1.0);
    posB.y = (float)((double)posY - 1.0);
  }
  posB.x = posA.x;
  posB.z = posA.z;
  if (::CheckCollision(GetCollisionZone(param_1->zoneDatByte),&posA,&posB,(param_1->collision).radius,&newPos,&newRot,1)) {
    bVar2 = true;
    (param_1->collision).pos.x = newPos.x + newRot.x * (param_1->collision).radius;
    (param_1->collision).pos.y = (float)((double)newPos.y + 0.01 + (double)(newRot.y * (param_1->collision).radius));
    (param_1->collision).pos.z = newPos.z + newRot.z * (param_1->collision).radius;
  }
  else if (param_3 == 0) {
    if (attempt < 4) {
      fVar5 = RAND.GetFloat0ToX(6.283186);
      fVar6 = RAND.GetFloat0ToX(0.25);
      (param_1->collision).pos.x=(param_1->collision).pos.x + (__sinf(fVar5) + 1.0) * 0.5f * fVar6;
      (param_1->collision).pos.z=(param_1->collision).pos.z + (__cosf(fVar5) + 1.0) * 0.5f * fVar6;
      bVar2 = CheckCollision(param_1,0.0,0,attempt + 1);
    }
    else {
      #ifdef DEBUGVER
      N64PRINT(gGlobals.text);
      #endif
      bVar2 = false;
    }
  }
  else bVar2 = CheckCollision(param_1,0.0,0,attempt + 1);
  return bVar2;
}

void Actor::Init(playerData *param_1,u16 id){  
  CLEAR(param_1);
  param_1->shadowAlpha = 0xff;
  param_1->unk1c = 1;
  param_1->ID = id;
  param_1->borg7 = -1;
  param_1->nextBorg7 = -1;
  param_1->ani_type = 0;
  param_1->unk18 = 0;
  param_1->unk1a = 0;
  param_1->zoneDatByte = ZoneCenter;
  param_1->flags = 0;
  param_1->scale = 1.0;
  (param_1->facing).y = 1.0;
  (param_1->facing).x = 1.0;
  MemsetController(&param_1->controller);
  ClearInputMoveFlags(param_1);
  UnsetFlag(param_1,ACTOR_2);
  setVec3(&param_1->vec3_0x48,0.0,0.0,1.0);
  copyVec3(&param_1->vec3_0x48,&param_1->vec3_0x3c);
  set_collisionSphere(&param_1->collision,0.5,0.0,0.0,0.0,0.0,0.0,0.0);
  init_collisionTypeA(&param_1->colTypeA);
  set_CollisionTypeB(&param_1->colTypeB);
  (param_1->envprop).colA = &param_1->colTypeA;
  (param_1->collision).envProps = &param_1->envprop;
  (param_1->envprop).Speed = &param_1->colTypeB;
  (param_1->envprop).colA->unk0 = 0.0;
  (param_1->envprop).colA->unk4 = 1.0;
  (param_1->envprop).colA->unk8 = 0.0;
  (param_1->envprop).colA->unkc = 0.0;
  (param_1->envprop).colA->unk10 = 0.0;
  (param_1->colTypeB).gravity.y = -0.003f;
  (param_1->collision).link = param_1;
  param_1->Ent_index = EntInd_Alaron;
  param_1->voxelReach = 100.0f;
  //default Alaron
  param_1->ent_ID = IDEnt(entityList[EntInd_Alaron]);
  setVec3(&param_1->CombatTint,1.0,1.0,1.0);
  param_1->unk75c = 0.0;
  param_1->unk760 = 0.0;
  param_1->unk77c = false;
}

void InitPlayerHandler(Camera_struct *cam,short maxPlayers,int shadIndex){
  int iVar2;
  s16 *psVar3;
  int iVar4;
  
  iVar2 = (int)maxPlayers;
  if (gGlobals.Sub.PlayerHandler.initFlag)
    CRASH("InitPlayerHandler","Player Handler is already Initialized.");
  if (PLAYER_ABS_MAXPLAYERS < iVar2)
    CRASH("InitPlayerHandler","Too Many Players..\nover PLAYER_ABS_MAXPLAYERS");
  CLEAR(&gGlobals.Sub.PlayerHandler);
  gGlobals.Sub.PlayerHandler.initFlag = 1;
  gGlobals.Sub.PlayerHandler.max_player = maxPlayers;
  if (maxPlayers == 0)
    gGlobals.Sub.PlayerHandler.playerDats = NULL;
  else {
    ALLOCS(gGlobals.Sub.PlayerHandler.playerDats,iVar2 * sizeof(playerData),351);
    memset(gGlobals.Sub.PlayerHandler.playerDats,0,gGlobals.Sub.PlayerHandler.max_player * sizeof(playerData));
  }
  gGlobals.Sub.PlayerHandler.cameraFocus = -1;
  gGlobals.Sub.PlayerHandler.playerCount = 0;
  gGlobals.Sub.PlayerHandler.float_0x68 = 50.0f;
  gGlobals.Sub.PlayerHandler.shadowDist = 50.0f;
  gGlobals.Sub.PlayerHandler.camera = cam;
  if (0 < gGlobals.Sub.PlayerHandler.max_player) {
    for(s16 i=0;i<gGlobals.Sub.PlayerHandler.max_player;i++) {
      gGlobals.Sub.PlayerHandler.unk10[i] = i;
      Actor::Init(&gGlobals.Sub.PlayerHandler.playerDats[i],i);
    }
  }
  if (shadIndex)
    gGlobals.Sub.PlayerHandler.shadowTexture = (Borg1Header *)getBorgItem(shadIndex);
  gGlobals.Sub.PlayerHandler.audiokey = load_audiokey();
}

void FreePlayerHandler(void){
  if (gGlobals.Sub.PlayerHandler.initFlag == 0)
    CRASH("FreePlayerHandler","Player Handler Not Initialized!");
  gGlobals.Sub.PlayerHandler.initFlag = 0;
  Actor::remove_flagged_playerdata();
  if (gGlobals.Sub.PlayerHandler.shadowTexture)
    FREEQB1(gGlobals.Sub.PlayerHandler.shadowTexture);
  if (gGlobals.Sub.PlayerHandler.unk70)
    FREEQB1(gGlobals.Sub.PlayerHandler.unk70);
  Audiokey_free(gGlobals.Sub.PlayerHandler.audiokey);
  gGlobals.Sub.PlayerHandler.audiokey = NULL;
  if (gGlobals.Sub.PlayerHandler.playerDats)
    HFREE(gGlobals.Sub.PlayerHandler.playerDats,415);
}


Gfx * Actor::CalculateShadow(playerData *param_1,Gfx *g,float param_3,u8 param_4){
  Borg9Data *borgDat;
  Gfx *pGVar2;
  vec3f *pos;
  vec3f *outRot;
  float fVar4;
  float fVar5;
  byte bVar6;
  float fVar7;
  vec2f *pvVar8;
  vec3f fStack440;
  vec3f fStack376;
  vec3f fStack312;
  vec3f fStack248;
  vec3f afStack184;
  vec2f avStack_78 [12];
  
  fStack312.y = (float)((double)(param_1->collision).pos.y + 0.05);
  fStack312.x = (param_1->collision).pos.x;
  fStack312.z = (param_1->collision).pos.z;
  fStack248.y = fStack312.y - 3.0f;
  fStack248.x = fStack312.x;
  fStack248.z = fStack312.z;
  GetPosOnLoadedMap(param_1,&afStack184);
  borgDat = GetCollisionZone(param_1->zoneDatByte);
  outRot = &fStack376;
  if (::CheckCollision(borgDat,&fStack312,&fStack248,0.5f,&fStack440,outRot,1)) {
    fStack440.x = afStack184.x + fStack376.x * param_3;
    fStack440.y = fStack440.y + fStack376.y * param_3;
    fStack440.z = afStack184.z + fStack376.z * param_3;
    fVar5 = (3.0f - (vec3_proximity(&afStack184,&fStack440) - param_1->scaleRad)) / 3.0f;
    if (1.0f < fVar5) fVar5 = 1.0f;
    fVar4 = fVar5 * 160.0f;
    avStack_78[0].x = (param_1->scaleRad + param_1->scaleRad) * fVar5;
    (param_1->shadow).vertCols[3].R = 0;
    (param_1->shadow).vertCols[2].R = 0;
    (param_1->shadow).vertCols[1].R = 0;
    (param_1->shadow).vertCols[0].R = 0;
    (param_1->shadow).vertCols[3].G = 0;
    (param_1->shadow).vertCols[2].G = 0;
    (param_1->shadow).vertCols[1].G = 0;
    (param_1->shadow).vertCols[0].G = 0;
    (param_1->shadow).vertCols[3].B = 0;
    (param_1->shadow).vertCols[2].B = 0;
    (param_1->shadow).vertCols[1].B = 0;
    (param_1->shadow).vertCols[0].B = 0;
    bVar6 = fVar4 * (float)((double)param_4 / 255.0);
    pos = &fStack440;
    (param_1->shadow).vertCols[3].A = bVar6;
    (param_1->shadow).vertCols[2].A = bVar6;
    (param_1->shadow).vertCols[1].A = bVar6;
    (param_1->shadow).vertCols[0].A = bVar6;
    pvVar8 = avStack_78;
    (param_1->shadow).UScale = 1;
    avStack_78[0].y = avStack_78[0].x;
  }
  else {
    pos = &(param_1->shadow).pos;
    outRot = &(param_1->shadow).rot;
    pvVar8 = &(param_1->shadow).scale;
    (param_1->shadow).pos.x = afStack184.x;
    (param_1->shadow).pos.z = afStack184.z;
  }
  return PlaneObj_Render(g,&param_1->shadow,pos,outRot,pvVar8);
}

u8 PlayerShadowAlpha(PlayerHandler *param_1,playerData *pDat,float dist,u8 param_4){

  u8 a = param_4;
  if (param_1->shadowDist - 2.0f < dist) {
    a = (param_1->shadowDist - dist) * 0.5f * 255.0f;
  }
  u8 ret = pDat->shadowAlpha;
  if (a < pDat->shadowAlpha)
    ret = a;
  return ret;
}

Gfx * renderPlayerShadows(PlayerHandler *param_1,Gfx *gfx){
  u8 alpha;
  vec3f afStack120;
  
  if (param_1->shadowTexture) {
    Gfx* pGVar3 = FUN_8009d3dc(PlaneObj_SetupGfx(gfx,10),param_1->shadowTexture,Graphics::GetBufferChoice());
    gfx = loadTextureImage(pGVar3,param_1->shadowTexture,NULL);
    if (0 < param_1->max_player) {
      for(s16 i=0;i<param_1->max_player;i++) {
        playerData* p = &param_1->playerDats[i];
        if (p->removeFlag) {
          Actor::GetPosOnLoadedMap(p,&afStack120);
          float prox = vec3_proximity(&param_1->camera->aim,&afStack120);
          if (prox < param_1->shadowDist) {
            (p->shadow).borg1p = param_1->shadowTexture;
            if (!p->alaron_flag) {
              float camProx = vec3_proximity(&(p->collision).pos,&param_1->camera->aim);
              if (10.0f <= camProx) continue;
              alpha = PlayerShadowAlpha(param_1,p,prox,0x80) * (1.0f - camProx / 10.0f);
            }
            else alpha = PlayerShadowAlpha(param_1,p,prox,0x80);
            gfx = Actor::CalculateShadow(p,gfx,0.0,alpha);
          }
        }
      }
    }
  }
  return gfx;
}

void playerdata_remove_dcm(playerData *param_1,u16 param_2){
  DCMSub2 *pDVar1 = param_1->dcmDat + param_2;
  if (pDVar1->borg12) {
    DCM::Remove(pDVar1->id,pDVar1->index);
    FREEQB12(pDVar1);
    pDVar1->id = 0;
    pDVar1->index = 0;
  }
}

void playerdata_remove_both_dcm(playerData *param_1){
  for(u16 i=0;i<2;i++)
    playerdata_remove_dcm(param_1,i);
}

DCMSub2 * AllocPlayerAudio(playerData *param_1,audioKeyEntryB *param_2,u16 type,u16 param_4){
  u16 uVar1;
  Borg12Header *pBVar3;
  u16 uVar6;
  u32 *pBVar4;
  
  u16 uVar2 = 0;
  if ((param_4 == 0) && (param_2)) {
    uVar2 = RAND.randAudio(param_2->arrLen);
  }
  switch(type){
    case 0:
    pBVar4 = u32_ARRAY_800eec98 + param_2->arr[uVar2];
    break;
    case 1:
    pBVar4 = u32_ARRAY_800eee18 + param_4;
    break;
    case 2:
    pBVar4 = u32_ARRAY_800ef010 + param_4;
    break;
    default:
    CRASH("AllocPlayerAudio","Invalid Audio Type");
  }
  pBVar3 = load_borg_12(*pBVar4);
  uVar2 = (u16)param_1->dcmDatIndex + 1;
  uVar6 = (short)uVar2 + (short)(uVar2 >> 1) * -2;
  param_1->dcmDatIndex = uVar6;
  playerdata_remove_dcm(param_1,uVar6);
  uVar1 = param_1->dcmDatIndex;
  param_1->dcmDat[uVar1].borg12 = pBVar3;
  return param_1->dcmDat + uVar1;
}


u8 FUN_8001620c(playerData *param_1){
  if (param_1->unk70ee == 0) return false;
  if (param_1->ani_type == 0)
    return param_1->unk16 == 0;
  return false;
}



void ProcessPlayers(PlayerHandler *handler,short delta){
  u16 uVar2;
  u16 uVar3;
  float fVar5;
  float fVar6;
  u32 BVar7;
  playerData *ppVar8;
  double dVar9;
  double dVar10;
  int iVar12;
  short sVar15;
  Borg9Data *map;
  Borg7Header *pBVar13;
  bool bVar18;
  short sVar17;
  bool bVar19;
  playerData *ppVar20;
  int iVar21;
  collisionSphere *coliide;
  vec3f *v;
  playerData *iVar23;
  playerData *pDat;
  ulonglong uVar23;
  ulonglong uVar24;
  int iVar26;
  longlong count;
  int delta_;
  float fVar27;
  float fVar28;
  undefined4 in_f1;
  float fVar29;
  float fVar30;
  float fVar31;
  float fVar32;
  float fVar33;
  float fVar34;
  float fVar35;
  float fVar36;
  vec3f facingV3;
  vec3f mapPos;
  vec2f camPosV2;
  vec2f camAimV2;
  vec2f afStack432;
  vec3f fStack368;
  vec3f afStack304;
  vec2f fStack240;
  vec3f fStack176;
  float local_70;
  vec3f *local_6c;
  u16 local_68;
  vec2f *camPosV2p;
  collisionSphere *local_60;
  vec2f *camAimV2p;
  
  delta_ = (int)delta;
  ProcessPlayersTally = 0;
  camPosV2p = &camPosV2;
  local_68 = 0;
  camAimV2p = &camAimV2;
  if (0 < handler->max_player) {
    for(s16 i=0;i<handler->max_player;i++) {
      if ((handler->playerDats[i].removeFlag) && (handler->playerDats[i].flags&ACTOR_800))
        Camera::AddPosToList(&handler->playerDats[i].collision.pos);
    }
  }
  if (gGlobals.Sub.gamemodeType == 0) {
    sVar15 = handler->cameraFocus;
    if (sVar15 == -1) {
      if (gGlobals.Sub.camPtrArraySize) {
        fVar27 = 75.0f;
        Camera::ProcessVectors(&afStack304,&fStack240,gGlobals.Sub.camPtrArray,
                         gGlobals.Sub.camPtrArraySize,75.0f);
        handler->camera->unk5c = fVar27;
        if (fVar27 < 5.0f) handler->camera->unk5c = 5.0f;
        facingV3.y = 0.0;
        facingV3.x = fStack240.x;
        facingV3.z = fStack240.y;
        handler->camera->unk80 = 1;
        Camera::SetFeild70(handler->camera,&afStack304);
        Camera::ProcessGameCamera(handler->camera,&afStack304,&facingV3,delta,0);
        handler->camera->unk5c = handler->camera->unk60;
      }
    }
    else {
      facingV3.x = handler->playerDats[sVar15].facing.x;
      facingV3.y = 0.0;
      facingV3.z = handler->playerDats[sVar15].facing.y;
      fVar33 = SQ(facingV3.x)+ SQ(facingV3.z);
      if (0.0 < fVar33) {
        if ((fVar33 < NORMALIZE_MIN)||(-fVar33 < NORMALIZE_MIN))
        CRASH("Player.cpp","SETTING FACING FOR CAMERA\n");
      }
      Camera::ProcessGameCamera(handler->camera,&handler->playerDats[handler->cameraFocus].collision.pos,
                        &facingV3,delta,1);
    }
  }
  else if (gGlobals.Sub.gamemodeType == 1) {
    #ifdef DEBUGVER
    strcpy(gGlobals.text,"ProcessCombatCamera");
    #endif
    processCombatCamera(handler);
    #ifdef DEBUGVER
    strcpy(gGlobals.text,"Crash was not in ProcessCombatCamera");
    #endif
  }
  setVec2(camPosV2p,gGlobals.Sub.camera.pos.x,gGlobals.Sub.camera.pos.z);
  setVec2(camAimV2p,gGlobals.Sub.camera.aim.x,gGlobals.Sub.camera.aim.z);
  count = 0;
  gGlobals.Sub.camPtrArraySize = 0;
  local_6c = &handler->camera->aim;
  if (0 < handler->max_player) {
    iVar12 = 0;
    do {
      iVar21 = (int)count;
      pDat = &handler->playerDats[count];
      fVar27 = (pDat->collision).pos.x;
      fVar5 = (pDat->collision).pos.y;
      fVar6 = (pDat->collision).pos.z;
      if (pDat->borg7 == BORG7_Phelan) {//?
        Gsprintf("Scale: %3.2f\nScaleRad: %3.2f\nSphere Rad: %3.2f",pDat->scale,pDat->scaleRad,pDat->collision.radius);
        N64PRINT(gGlobals.text);
      }
      if ((pDat->removeFlag == 0) && ((pDat->flags & ACTOR_100) == 0)) {
LAB_80017298:
        iVar12 = (iVar21 + 1) * 0x10000;
LAB_8001729c:
      }
      else {
        Gsprintf("Process Player: %d\n",pDat->ID);
        fVar31 = pDat->unk5c;
        if (fVar31 != 0.0) {
          fVar29 = pDat->scale + fVar31 * (float)delta_;
          ProcessPlayersTally++;
          pDat->scale = fVar29;
          if ((fVar31 <= 0.0) || (fVar28 = (float)pDat->unk54, fVar29 < fVar28)) {
            if (fVar31 < 0.0) {
              fVar28 = (float)pDat->unk54;
              if (fVar29 <= fVar28) {
                pDat->unk5c = 0.0;
                goto LAB_8001666c;
              }
            }
          }
          else {
            pDat->unk5c = 0.0;
LAB_8001666c:
            pDat->scale = fVar28;
          }
          pDat->scaleRad = pDat->scale * (pDat->collision).radius;
        }
        (pDat->skyTint).x = (float)((double)((float)gGlobals.sky.colors[1].R / 255.0f) * 0.5);
        (pDat->skyTint).y = (float)((double)((float)gGlobals.sky.colors[1].G / 255.0f) * 0.5);
        (pDat->skyTint).z = (float)((double)((float)gGlobals.sky.colors[1].B / 255.0f) * 0.5);
        fVar31 = 1.0f;
        if ((pDat->unk760 == 0.0) && (pDat->unk75c == 0.0)) {}
        else {
          pDat->unk75c += pDat->unk760 * (float)delta_;
          if (1.0f<pDat->unk75c) {
            pDat->unk75c = 1.0;
            pDat->unk760 = 0.0;
          }
          if (pDat->unk75c < 0.0) {
            pDat->unk75c = 0.0;
            pDat->unk760 = 0.0;
          }
          fVar35 = pDat->unk75c;
          (pDat->skyTint).x += ((pDat->CombatTint).x - (pDat->skyTint).x) * fVar35;
          (pDat->skyTint).y += ((pDat->CombatTint).y - (pDat->skyTint).y) * fVar35;
          (pDat->skyTint).z += ((pDat->CombatTint).z - (pDat->skyTint).z) * fVar35;
          multiVec3(&pDat->skyTint,gGlobals.brightness);
          CIEL((pDat->skyTint).x,1.0);
          CIEL((pDat->skyTint).y,1.0);
          CIEL((pDat->skyTint).z,1.0);
          FLOOR((pDat->skyTint).x,0.0);
          FLOOR((pDat->skyTint).y,0.0);
          FLOOR((pDat->skyTint).z,0.0);
        }
        if ((pDat->unk708 < 1) ||
           (iVar12 = (uint)(u16)pDat->unk708 - delta_, (pDat->flags & ACTOR_100) == 0)) {
LAB_800168cc:
        }
        else {
          pDat->unk708 = (short)iVar12;
          if (iVar12 * 0x10000 < 1) {
            pDat->shadowAlpha = 0;
            pDat->flags = 0;
            Actor::FreePlayer(pDat);
          }
          if (pDat->unk708 < 60) {
            pDat->shadowAlpha = (pDat->unk708 / 60.0f) * 255.0f;
            goto LAB_800168cc;
          }
        }
        if (pDat->removeFlag == 0) goto LAB_80017298;
        Actor::GetPosOnLoadedMap(pDat,&mapPos);
        map = GetCollisionZone(pDat->zoneDatByte);
        fVar31 = vec3_proximity(local_6c,&mapPos);
        if (handler->float_0x68 < fVar31) {
          if (gGlobals.Sub.gamemodeType != 1) {
            if (gExpPakFlag){
              if (fVar31 <= handler->float_0x68 * 3.0f) {
                fVar29 = handler->float_0x68;
                goto LAB_80016990;
              }
            }
            if (pDat->borg7P == NULL) {
              goto LAB_80016990;
            }
            BVar7 = pDat->borg7;
            Actor::FreePlayerActor(pDat);
            pDat->borg7 = BVar7;
          }
LAB_8001698c:
        }
        else {
          if (pDat->borg7P == NULL) {
            Actor::ChangeAppearance(pDat,pDat->borg7);
            goto LAB_8001698c;
          }
        }
LAB_80016990:
        if (handler->float_0x68 < fVar31) goto LAB_80017298;
        iVar12 = (iVar21 + 1) * 0x10000;
        if (pDat->borg7P == NULL) goto LAB_8001729c;
        if (pDat->flags & ACTOR_2) {
          local_68++;
          Actor::MoveTo(pDat);
          Actor::Move(pDat,&(pDat->controller).contAidyn);
          (pDat->controller).contAidyn.input = 0;
        }
        if (pDat->nextBorg7 != -1) {
          Actor::ChangeAppearance(pDat,pDat->nextBorg7);
          pDat->nextBorg7 = -1;
        }
        coliide = &pDat->collision;
        fVar29 = (pDat->collision).pos.y;
        ProcessCollisionSphere(map,coliide,delta);
        local_60 = coliide;
        if (pDat->alaron_flag){
          if (((pDat->collision).unk1e != 0)&&
            (1.0f < vec3_proximity(&player_coords_A,&(pDat->collision).pos))) {
            player_coords_b.x = player_coords_A.x;
            player_coords_b.y = player_coords_A.y;
            player_coords_b.z = player_coords_A.z;
            map_shorts_b[0] = map_shorts_A[0];
            map_shorts_b[1] = map_shorts_A[1];
            player_coords_A.x = (pDat->collision).pos.x;
            player_coords_A.y = (pDat->collision).pos.y;
            player_coords_A.z = (pDat->collision).pos.z;
            map_shorts_A[0] = gGlobals.Sub.mapShort1;
            map_shorts_A[1] = gGlobals.Sub.mapShort2;
          }
          if (pDat->alaron_flag) {
            if (pDat->Ground_type - 1 < 2) {
              fStack176.x = (pDat->collision).pos.x;
              fStack176.z = (pDat->collision).pos.z;
              fStack176.y = ((pDat->collision).pos.y - 0.05);
              if (!processPlayers_sub(map,&(pDat->collision).pos,&fStack176,0.5,NULL,NULL)) {
                goto LAB_80016b54;
              }
              if ((pDat->collision).pos.y < fVar29) (pDat->collision).pos.y = fVar29;
            }
          }
          fVar29 = (pDat->facing).x;
        }
LAB_80016b54:
        fVar29 = SQ((pDat->facing).x) + SQ((pDat->facing).y);
        if (0.0 < fVar29) {
          if (fVar29 < NORMALIZE_MIN) goto crash;
        }
        else if (-fVar29 < NORMALIZE_MIN) {
crash:
          CRASH("player.cpp","SETTING FACING FOR ALIGN\n");
        }
        vec2_normalize(&pDat->facing);
        Scene::MatrixASetPos
                  (pDat->borg7P->sceneDat,mapPos.x,mapPos.y - (pDat->collision).radius,mapPos.z);
        Scene::MatrixAAlign
                  (pDat->borg7P->sceneDat,(pDat->facing).x,0.0,(pDat->facing).y,0.0);
        if ((pDat->collision).unk1e == 0) {
          pDat->Ground_type = 0;
        }
        if (pDat->Ground_type - 1 < 2) {
          (pDat->collision).vel.y =
               (float)((double)(pDat->collision).vel.y - 0.03);
        }
        setVec2(&afStack432,(pDat->collision).pos.x,(pDat->collision).pos.z);
        three_vec2_proximities(camPosV2p,camAimV2p,&afStack432);
        if (((((pDat->ani_type == 0) && (pDat->unk1a == 0)) && (pDat->unk1c == 0)) &&
            ((13.0f <= fVar31 && (gGlobals.Sub.gamemodeType == 1)))) ||
           (FUN_8001620c(pDat))) {
          if (!Actor::IsFlyingModel(pDat)) goto not_flying_borg7;
          if (pDat->unk70ee == 0) goto LAB_80016cec;
        }
        else {
LAB_80016cec:
          if (0 < delta_) {
            for(iVar12=0;iVar12<delta_;iVar12++) {
              if ((pDat->flags & ACTOR_100) == 0) {
                FUN_800a0090(pDat->borg7P,pDat->ani_type);
                bVar18 = (uint)(u16)pDat->borg7P->sceneDat->aniTime ==
                         pDat->borg7P->unk1c->b6->dat->aniLength - 1U;
                u16 unk16;
                if ((u16)pDat->unk18 - 0xe < 2) {
                  unk16 = (float)pDat->borg7P->unk1c->b6->dat->aniLength
                           * gEntityDB->RetPoint4(pDat->ent_ID);
                }
                else {
                  unk16 = (float)pDat->borg7P->unk1c->b6->dat->aniLength
                           * gEntityDB->GetFloatA(pDat->ent_ID);
                }
                uVar2 = pDat->borg7P->sceneDat->aniTime;
                uVar3 = pDat->unk18;
                bVar19 = bVar18;
                if (((pDat->ani_type == AniType_Dying) && (uVar3 != 9)) && (bVar18)) {
                  bVar19 = false;
                }
                if (uVar3 == 9) {
                  if (pDat->ani_type != AniType_Dying) {
                    pDat->unk77c = 1;
                    goto LAB_80016e74;
                  }
LAB_80016e88:
                  if (!bVar19) goto LAB_80016e90;
                  pBVar13 = pDat->borg7P;
                }
                else {
LAB_80016e74:
                  if ((pDat->ani_type == AniType_Dying) || (pDat->unk77c != 0)) goto LAB_80016e88;
LAB_80016e90:
                  count = FUN_800a00d0(pDat->borg7P);
                  bVar18 = count != 0;
                  pBVar13 = pDat->borg7P;
                }
                if (pBVar13->sceneDat->aniTime == 1) {
                  pDat->unk16 = pDat->ani_type;
                }
                if (bVar18) {
                  sVar15 = pDat->ani_type;
LAB_80016ed8:
                  pDat->unk18 = sVar15;
                }
                else if (((uint)uVar2 == unk16) && (uVar3 - 0xc < 7)) {
                  sVar15 = pDat->ani_type;
                  goto LAB_80016ed8;
                }
                if (bVar18) {
                  pDat->unk1c = pDat->unk1a;
                  pDat->unk1a = pDat->ani_type;
                }
                if (((pDat->collision).vel.y<= -0.048)&&(pDat->alaron_flag)) {
                    // fell through world
                  setVec3(&(pDat->collision).vel,0.0,(pDat->collision).vel.y,0.0);
                  if (-0.3 <= (double)(pDat->collision).vel.y) {
                    goto LAB_80017014;
                  }
                  setVec3(&(pDat->collision).vel,0.0,0.0,0.0);
                  (pDat->collision).pos.x = player_coords_b.x;
                  (pDat->collision).pos.y = player_coords_b.y;
                  (pDat->collision).pos.z = player_coords_b.z;
                  gGlobals.Sub.mapShort1 = map_shorts_b[0];
                  gGlobals.Sub.mapShort2 = map_shorts_b[1];
                  #ifdef DEBUGVER
                  N64PRINT("Saved your life!\nIf this was NOT a pop though\nIT IS A BUG.  Show Bailey!\n");
                  #endif
LAB_80017010:
                }
                else {
LAB_80016f24:
                  if (pDat->ani_type != 0) {
LAB_80016f38:
                    local_70 = -(pDat->borg7P->unk2c).z * pDat->scale;
                    (pDat->collision).pos.x += (pDat->facing).x * local_70;
                    (pDat->collision).pos.z += (pDat->facing).y * local_70;
                    goto LAB_80017010;
                  }
                  if (pDat->unk1a != 0) goto LAB_80016f38;
                }
LAB_80017014:
                player_audiokey(pDat,pDat->unk16,pDat->borg7P->sceneDat->aniTime,
                                pDat->borg7P->unk1c->b6->dat->aniLength);
              }
            }
          }
not_flying_borg7:
        }
        if (pDat->visible_flag == 0) {
          FLOOR((pDat->collision).pos.x,0.05);
          FLOOR((pDat->collision).pos.z,0.05);
          CIEL((pDat->collision).pos.x,(gGlobals.Sub.mapCellSize.x - 0.05));
          CIEL((pDat->collision).pos.z,(gGlobals.Sub.mapCellSize.y - 0.05));
        }
        if ((pDat->flags & ACTOR_4)) {
          edit_playerdat_combat_pos(pDat,&pDat->combat_vec3);
        }
        fVar31 = 1000000.0f;
        iVar12 = (iVar21 + 1) * 0x10000;
        if ((pDat->flags & ACTOR_400)) goto LAB_8001729c;
        bVar18 = false;
        pDat->unk104 = -1;
        pDat->unk108 = fVar31;
        fVar31 = 3.0f;
        uVar24 = 0;
        if (0 < handler->max_player) {
          uVar23 = 0;
          do {
            sVar15 = (short)uVar24;
            iVar12 = (int)uVar23;
            ppVar8 = handler->playerDats;
            ppVar20 = ppVar8 + iVar12;
            if (ppVar20->removeFlag == 0) {
LAB_8001727c:
              sVar17 = sVar15 + 1;
            }
            else {
              sVar17 = sVar15 + 1;
              if ((ppVar20->ID != pDat->ID) &&
                 (sVar17 = sVar15 + 1, (ppVar20->flags & ACTOR_400) == 0)) {
                if (ppVar20->zoneDatByte == pDat->zoneDatByte) {
                  fVar29 = (ppVar20->collision).pos.y - (pDat->collision).pos.y;
                  if (fVar29 <= 0.0) {
                    fVar29 = -fVar29;
                  }
                  sVar17 = sVar15 + 1;
                  if (fVar29 <= fVar31) {
                    fVar29 = (pDat->collision).radius;
                    fVar28 = ppVar8[iVar12].collision.radius;
                    if (FUN_800b003c(local_60,pDat->scale,&ppVar8[iVar12].collision,
                                     ppVar8[iVar12].scale,&local_70)) {
                      if (bVar18) {
                        (pDat->collision).pos.x = fVar27;
                        (pDat->collision).pos.y = fVar5;
                        (pDat->collision).pos.z = fVar6;
                      }
                      else {
                        bVar18 = true;
                        sVar15 = 0;
                      }
                    }
                    ppVar8 = handler->playerDats;
                    (pDat->collision).radius = fVar29;
                    ppVar8[iVar12].collision.radius = fVar28;
                    sVar17 = sVar15 + 1;
                    if (local_70 < pDat->unk108) {
                      pDat->unk108 = local_70;
                      pDat->unk104 = (short)uVar23;
                      goto LAB_8001727c;
                    }
                  }
                }
                else {
                  sVar17 = sVar15 + 1;
                }
              }
            }
            uVar24 = (ulonglong)(int)sVar17;
            uVar23 = uVar24 & 0xffff;
          } while (uVar24 < handler->max_player);
          goto LAB_80017298;
        }
      }
      count = (iVar12 >> 0x10);
      iVar12 = (iVar12 >> 0x10) << 4;
    } while (count < handler->max_player);
  }
  if (local_68 == 0) {
    handler->counter+=delta_;
    if (30 <= handler->counter) FUN_8005831c();
  }
  else handler->counter = 0;
}

void FUN_80017330(playerData *param_1,float param_2,float r,float g,float b){
  setVec3(&param_1->CombatTint,r,g,b);
  param_1->unk760 = (float)(1.0 / (double)param_2);
}

void FUN_80017388(playerData *param_1,float param_2){
  param_1->unk760 = (float)-(1.0 / (double)param_2);
}

extern u16 light_count;
void some_player_render_sub(playerData *param_1,SceneData *param_2,vec3f *param_3,u8 alpha,
               u16 param_5){

  light_count = 0;
  SetSceneColors(param_2,alpha,0,0x0);
  Scene::SetModelTint(param_2,0xff,0xff,0xff,alpha);
  #ifdef DEBUGVER
  if (gGlobals.DebugStatDisplay != 0) {
    if (gGlobals.delta <= 3.0){}
    else if (gGlobals.delta == 4.0) Scene::SetModelTint(param_2,0xff,0xff,0,alpha);
    else Scene::SetModelTint(param_2,0xff,0,0,alpha);
  }
  #endif
  Scene::SetLightColors(param_2,(param_1->skyTint).x*255,(param_1->skyTint).y*255,(param_1->skyTint).z*255);
  if (gGlobals.sky.Type == 3) {
    //add sun light source
    Scene::addDynamicLight(param_2,-1,gGlobals.SunPos.x,gGlobals.SunPos.y,gGlobals.SunPos.z,
               gGlobals.sky.colors[4].R,gGlobals.sky.colors[4].G,gGlobals.sky.colors[4].B,light_count++);
    if (0.0 < gGlobals.MoonPos.y) {
      //add moon light source
      Scene::addDynamicLight(param_2,-1,gGlobals.MoonPos.x,gGlobals.MoonPos.y,gGlobals.MoonPos.z,0,
                gGlobals.MoonPos.y * 200.0f * gGlobals.brightness * param_1->unk75c,
                 gGlobals.MoonPos.y * 200.0f * gGlobals.brightness * param_1->unk75c,light_count++);
    }
  }
  passto_InitLight_2(&gGlobals.Sub.DynamicLights,param_2,&(param_1->collision).pos,param_5);
  light_init_func(param_1,param_2,param_5);
}


void set_sun_light(SceneData *param_1,u16 flag,voxelObject *param_3,u8 alpha){
  light_count = 0;
  SetSceneColors(param_1,alpha,0,0x0);
  if ((flag & SceneObj_Fullbright)){
    Scene::SetModelTint(param_1,
         gGlobals.sky.colors[0].R * gGlobals.brightness,
         gGlobals.sky.colors[0].G * gGlobals.brightness,
         gGlobals.sky.colors[0].B * gGlobals.brightness,alpha);
  }
  else{
    Scene::SetModelTint(param_1,0xff,0xff,0xff,alpha);
    Scene::SetLightColors(param_1,
        gGlobals.sky.colors[0].R * gGlobals.brightness,
        gGlobals.sky.colors[0].G * gGlobals.brightness,
        gGlobals.sky.colors[0].B * gGlobals.brightness);
    if (gGlobals.sky.Type == 3) {
      Scene::addDynamicLight
                (param_1,-1,gGlobals.SunPos.x,gGlobals.SunPos.y,gGlobals.SunPos.z,
                 gGlobals.sky.colors[4].R,gGlobals.sky.colors[4].G,gGlobals.sky.colors[4].B,light_count++);
    }
  }
}

Gfx * renderPlayers(PlayerHandler *param_1,Gfx *g,short delta,short param_4,short param_5){
  Borg7Header *pBVar1;
  u8 a;
  SceneData *pAVar3;
  bool bVar5;
  short j;
  playerData *pDat;
  vec3f *to;
  longlong i;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  u8 r;
  u8 g_00;
  u8 b;
  vec3f mapPos;
  vec3f locPos;
  vec3f locRot;
  vec2f camCoord;
  vec2f CamAim;
  vec2f mapPosXZ;
  MtxF afStack_110;
  vec3f avStack_d0;
  vec3f avStack_90;
  int delta32;
  int iStack_4c;
  int iStack_48;
  
  delta32 = (int)delta;
  iStack_4c = (int)param_4;
  iStack_48 = (int)param_5;
  fVar8 = __cosf(0.7417525f);
  setVec2(&camCoord,gGlobals.Sub.camera.pos.x,gGlobals.Sub.camera.pos.z);
  setVec2(&CamAim,gGlobals.Sub.camera.aim.x,gGlobals.Sub.camera.aim.z);

  if (0 < param_1->max_player) {
    for(i=0;i< param_1->max_player;i++) {
      pDat = &param_1->playerDats[i];
      if ((pDat->removeFlag) && (pDat->borg7P)) {
        if (iStack_4c == 0) {
          if (pDat->visible_flag == 0) goto render_player;
        }
        else if (pDat->visible_flag != 0) {
render_player:
#ifdef DEBUGVER
          sprintf(gGlobals.text,"RENDERING PLAYER (%ld)",pDat->borg7);
#endif
          Actor::GetPosOnLoadedMap(pDat,&mapPos);
          mapPos.y -= (pDat->collision).radius;
          setVec2(&mapPosXZ,mapPos.x,mapPos.z);
          fVar9 = three_vec2_proximities(&camCoord,&CamAim,&mapPosXZ);
          if (((u16)(pDat->ani_type == pDat->unk1a) == pDat->unk1c) || (fVar8 < fVar9)) {
            fVar11 = 5.0f;
            if (pDat->borg7 == BORG7_ship) fVar11 = 100.0f;
            if (((vec2_proximity(&mapPosXZ,&CamAim) <= fVar11) || (fVar8 < fVar9)) &&
               (fVar9 = vec3_proximity(&param_1->camera->aim,&mapPos),
               fVar9 < param_1->shadowDist)) {
              a = PlayerShadowAlpha(param_1,pDat,fVar9,0xff);
              if (iStack_4c == 0) {
LAB_80017c98:
                some_player_render_sub(pDat,pDat->borg7P->sceneDat,&mapPos,a,(short)delta32);
                Scene::MatrixANormalizeScale(pDat->borg7P->sceneDat,pDat->scale,pDat->scale,pDat->scale);
                Scene::MatrixASetPos(pDat->borg7P->sceneDat,mapPos.x,mapPos.y,mapPos.z);
                if (DAT_800ee974 == 0) {
LAB_80017d08:
                  g = BorgAnimDrawSceneLinked(g,pDat->borg7P);
                }
                else if ((pDat->flags & ACTOR_2000) == 0) {
                  goto LAB_80017d08;
                }
                for(j=0;j<3;j++) { //render equipped models
                    attachmentNode *node =&pDat->attachmentNodes[j];
                  if ((node->borg5) && (pDat->borg7P)) {
                    if (!node->sceneDat) {
                      node->sceneDat = BorgAnimLoadScene(node->borg5);
                      Scene::SetFlag40(node->sceneDat);
                      Scene::SetFlag4(node->sceneDat);
                      Scene::SetFogFlag(node->sceneDat);
                      Scene::SetLightData(node->sceneDat);
                      Scene::SceneSetMaxDynamicDirLights(node->sceneDat,4);
                    }
                    if (Scene::HasLocator(pDat->borg7P->sceneDat,node->index)) {
                      if (Scene::SceneGetLocatorMtx(pDat->borg7P->sceneDat,&afStack_110,node->index)) {
                        Scene::SceneGetLocatorPos(pDat->borg7P->sceneDat,&avStack_d0,node->index);
                        Scene::SceneGetLocatorAlign(pDat->borg7P->sceneDat,&avStack_90,node->index);
                        some_player_render_sub(pDat,node->sceneDat,&avStack_d0,a,delta32);
                        Scene::SetModelTint(node->sceneDat,
                            gGlobals.sky.colors[0].R * gGlobals.brightness,
                            gGlobals.sky.colors[0].G * gGlobals.brightness,
                            gGlobals.sky.colors[0].B * gGlobals.brightness,a);
                        Scene::CopyMatrixA(node->sceneDat,&afStack_110);
                        if (_bigw_flag) Scene::ScaleBodyPart(node->sceneDat,2.0,2.0,2.0);
                        if (j == 2) Scene::MatrixATranslate(node->sceneDat,0.0,1.0,0.0);
                        g = BorgAnimDrawScene(g,node->sceneDat);
                      }
                    }
                    #ifdef DEBUGVER
                    else {
                      Gsprintf("Actor: %d\nLocator: %d Missing!THIS IS A BUG\n",pDat->borg7,node->index);
                      N64PRINT(gGlobals.text);
                    }
                    #endif
                  }
                }
                if ((pDat->SceneDat) && (pDat->alaron_flag)) {
                  if(_flea_flag){ //scale down for "!flea" cheat
                    pDat->scale = 0.25f;
                    pDat->scaleRad = (pDat->collision).radius*.25;
                  }
                  else {
                    pDat->scale = 1.0f;
                    pDat->scaleRad = (pDat->collision).radius;
                  }
                  some_player_render_sub(pDat,pDat->SceneDat,&mapPos,a,(short)delta32);
                  if ((Scene::SceneGetLocatorPos(pDat->borg7P->sceneDat,&locPos,3)) &&
                     (Scene::SceneGetLocatorAlign(pDat->borg7P->sceneDat,&locRot,3))) {
                    to = &pDat->vec3_0x3c;
                    copyVec3(&locRot,to);
                    if (pDat->voxelReach < 100.0f) {
                      Vec3_sub(to,&locPos,&pDat->voxelCoords);
                      vec3_normalize(to);
                    }
                    FUN_800ab23c(&pDat->vec3_0x48,to,(float)(delta32 * 3) * dtor);
                    fVar9 = (pDat->vec3_0x48).y;
                    (pDat->vec3_0x48).y =
                         fVar9 + ((pDat->vec3_0x3c).y - fVar9) / 10.0f;
                    FUN_800ab23c(&locRot,&pDat->vec3_0x48,1.39624);
                    Scene::MatrixASetPos(pDat->SceneDat,locPos.x,locPos.y,locPos.z);
                    Scene::MatrixAAlign(pDat->SceneDat,locRot.x,locRot.y,locRot.z,0.0);
                    Scene::ScaleBodyPart(pDat->SceneDat,pDat->scale,pDat->scale,pDat->scale);
                    //big head mode
                    if (_balloon_flag) Scene::ScaleBodyPart(pDat->SceneDat,2.0f,2.0f,2.0f);
                    if (DAT_800ee974){
                      if ((pDat->flags & ACTOR_2000)) continue;
                    }
                    g = BorgAnimDrawScene(g,pDat->SceneDat);
                  }
                }
              }
              else if (a == 0xff) {
                if (iStack_48 == 0) goto LAB_80017c98;
              }
              else if (iStack_48 != 0) goto LAB_80017c98;
            }
          }
        }
      }
    }
  }
  return g;
}

void edit_playerdat_combat_pos(playerData *param_1,vec3f *param_2){
  vec3f delta;
  Vec3_sub(&delta,&(param_1->collision).pos,param_2);
  if (param_1->combatMoveSpeed <= vec3Length(&delta)) {
    vec3_normalize(&delta);
    (param_1->collision).pos.x = (param_1->combat_vec3).x + delta.x * param_1->combatMoveSpeed;
    (param_1->collision).pos.z = (param_1->combat_vec3).z + delta.z * param_1->combatMoveSpeed;
  }
}

playerData * Actor::AllocPlayer(float radius,float x,float y,float z,u32 borg7){
  float fVar2;
  
  if (gGlobals.Sub.PlayerHandler.max_player <= gGlobals.Sub.PlayerHandler.playerCount)
    CRASH("AllocPlayer","Too Many Players");
  playerData *ppVar1 = &gGlobals.Sub.PlayerHandler.playerDats[gGlobals.Sub.PlayerHandler.unk10[gGlobals.Sub.PlayerHandler.playerCount++]];

  Init(ppVar1,ppVar1->ID);
  fVar2 = ppVar1->scale;
  ppVar1->removeFlag = 1;
  (ppVar1->collision).radius = radius;
  ppVar1->combatRadius = radius;
  (ppVar1->collision).pos.x = x;
  (ppVar1->collision).pos.y = y;
  (ppVar1->collision).pos.z = z;
  ppVar1->borg7 = borg7;
  ppVar1->scaleRad = radius * fVar2;
  if (borg7 == BORG7_Alaron) {
    player_coords_A.x = (ppVar1->collision).pos.x;
    player_coords_A.y = (ppVar1->collision).pos.y;
    player_coords_A.z = (ppVar1->collision).pos.z;
    map_shorts_b[0] = gGlobals.Sub.mapShort1;
    map_shorts_A[0] = gGlobals.Sub.mapShort1;
    map_shorts_b[1] = gGlobals.Sub.mapShort2;
    map_shorts_A[1] = gGlobals.Sub.mapShort2;
    player_coords_b.x = player_coords_A.x;
    player_coords_b.y = player_coords_A.y;
    player_coords_b.z = player_coords_A.z;
  }
  return ppVar1;
}

void Actor::FreePlayer(playerData *param_1){
  if (gGlobals.Sub.PlayerHandler.playerCount < 1)
    CRASH("FreePlayer","Invalid Free");
  gGlobals.Sub.PlayerHandler.unk10[--gGlobals.Sub.PlayerHandler.playerCount] = param_1->ID;
  FreePlayerActor(param_1);
  playerdata_remove_both_dcm(param_1);
  param_1->removeFlag = 0;
  (param_1->collision).flags |= 0x8000;
}


void remove_flagged_playerdata(void){
  if (0 < gGlobals.Sub.PlayerHandler.max_player) {
    for(s16 i=0; i < gGlobals.Sub.PlayerHandler.max_player;i++) {
      playerData *ppVar2 = &gGlobals.Sub.PlayerHandler.playerDats[i];
      if (ppVar2->removeFlag) Actor::FreePlayer(ppVar2);
    }
  }
}

void Actor::ChangeAppearance(playerData *param_1,u32 param_2){
  SceneData *pAVar1;
  Borg7Header *pBVar2;
  
  if (((param_2 != param_1->borg7) || (param_1->borg7P == NULL)) &&
     (NoExpPak_memCheck(0))) {
    if (param_2 == BORG7_Alaron) param_1->alaron_flag = true;
    else param_1->alaron_flag = false;
    if ((param_1->borg7 != -1)&&(param_1->borg7P))
      FREEQB7(param_1->borg7P);
    if ((param_1->SceneDat == NULL) && (param_1->alaron_flag)) {
      param_1->SceneDat = BorgAnimLoadScene(some_borg5);
      Scene::SetFlag40(param_1->SceneDat);
      Scene::SetFlag4(param_1->SceneDat);
      Scene::SetFogFlag(param_1->SceneDat);
      Scene::SetModelTint(param_1->SceneDat,0xff,0xff,0xff,0xff);
      Scene::SetLightData(param_1->SceneDat);
      Scene::SceneSetMaxDynamicDirLights(param_1->SceneDat,4);
    }
    param_1->borg7P = func_loading_borg7(param_2,&gGlobals.Sub.particleEmmiter);
    param_1->borg7 = param_2;
    Scene::SetParticleHead(param_1->borg7P->sceneDat,&gGlobals.Sub.particleEmmiter);
    Scene::SetFlag40(param_1->borg7P->sceneDat);
    Scene::SetFlag4(param_1->borg7P->sceneDat);
    Scene::SetFogFlag(param_1->borg7P->sceneDat);
    Scene::SetModelTint(param_1->borg7P->sceneDat,0xff,0xff,0xff,0xff);
    Scene::SetLightData(param_1->borg7P->sceneDat);
    Scene::SceneSetMaxDynamicDirLights(param_1->borg7P->sceneDat,4);
  }
}


void Actor::FreePlayerActor(playerData *param_1){
  if (param_1->borg7 == -1)
    CRASH("FreePlayerActor","No Actor To Free!");
  CombatAttackVisuals::FreePlayer(param_1);
  if (param_1->borg7P) {
    Particle::UnsetSceneEmmiter(&gGlobals.Sub.particleEmmiter,param_1->borg7P->sceneDat);
    FREEQB7(param_1->borg7P);
  }
  if (param_1->SceneDat) FREEQSCENE(param_1->SceneDat);
  param_1->borg7 = -1;
  EmptyHands(param_1);
}

void Actor::SetFlag(playerData *p,u16 f){p->flags |= f;}

void Actor::UnsetFlag(playerData *p,u16 f){p->flags &= ~f;}

void Ofunc_80018744(playerData *p){Actor::UnsetFlag(p,ACTOR_40);}


void Ofunc_80018760(playerData *p,vec3f *v){
  vec3f afStack136;
  vec2f fStack72;
  
  Vec3_sub(&afStack136,&(p->collision).pos,v);
  fStack72.x = afStack136.x;
  fStack72.y = afStack136.z;
  vec2_normalize(&fStack72);
  Actor::SetFacing(p,fStack72.x,fStack72.y);
  Actor::SetFlag(p,ACTOR_40);
}


void Actor::DeathFlag(playerData *p){
  SetFlag(p,ACTOR_100);
  p->unk708 = 120;
}


void FUN_800187f4(attachmentNode *param_1){
  if ((param_1->borg5) && (param_1->sceneDat)) {
    AllocFreeQueueItem(&gGlobals.QueueA,(void**)&param_1->sceneDat,1,1);
  }
}

void Actor::EmptyHands(playerData *p){
  for(u16 i=0;i<3;i++)
    FUN_800187f4(&p->attachmentNodes[i]);
}

void AttachItemToPlayer(playerData *p,u16 pos,uint b5){
  #ifdef DEBUGVER
  if (2 < pos) CRASH("AttachItemToPlayer","Invalid Attachment Position");
  #endif
  attachmentNode *paVar2 = p->attachmentNodes + pos;
  u16 uStack_58[]={0,2,3};
  FUN_800187f4(paVar2);
  paVar2->borg5 = b5;
  paVar2->index = uStack_58[pos];
}

void FreeAttachmentFromPlayer(playerData *param_1,u16 pos){
#ifdef DEBUGVER
    if (2 < pos) CRASH("FreeAttachmentFromPlayer","Invalid Attachment Position");
#endif
  FUN_800187f4(param_1->attachmentNodes + pos);
  param_1->attachmentNodes[pos].borg5 = 0;
}


void ChangeAttachmentNode(playerData *pDat,u16 pos,u16 node,char *file,u16 line){
  #ifdef DEBUGVER
    if (2 < pos) CRASH("ChangeAttachmentNode","Invalid Attachment Position");
  #endif
  if (node>7) {
    Gsprintf("InvalidNode. Node (%d) > 7\nCalled from %d, %s",node,line,file);
    CRASH("ChangeAttachmentNode",gGlobals.text);
  }
  pDat->attachmentNodes[pos].index = node;
}


void Ofunc_80018a74(playerData *param_1){
  if (param_1->borg7P)
    Scene::SetFogFlag(param_1->borg7P->sceneDat);
}


void Ofunc_80018a9c(playerData *param_1){
  if (param_1->borg7P) {
    Scene::UnsetFogFlag(param_1->borg7P->sceneDat);
  }
}


void Ofunc_80018ac4(playerData *param_1,float param_2,float param_3){
  if (param_1->unk60 == 0) {
    if (param_1->unk5c == 0.0) {
      param_1->unk58 = param_1->scale;
    }
  }
  param_1->unk5c = 0.0;
  param_1->unk60 = 1;
  param_1->unk54 = param_2;
  if (param_1->unk5c < param_3)
    param_1->unk5c = (param_2 - param_1->scale) / param_3;
  else param_1->scale = param_2;
}

void Ofunc_80018b34(playerData *param_1,float param_2){
  if (param_1->unk60) {
    param_1->unk5c = 0.0;
    param_1->unk60 = 0;
    param_1->unk54 = param_1->unk58;
    if (param_2 <= param_1->unk5c) param_1->scale = param_1->unk58;
    else param_1->unk5c = (param_1->unk58 - param_1->scale) / param_2;
  }
}


void FUN_80018b84(void){
  if (0 < gGlobals.Sub.PlayerHandler.max_player) {
    for(u16 i=0;i<gGlobals.Sub.PlayerHandler.max_player;i++) {
      Actor::UnsetFlag(&gGlobals.Sub.PlayerHandler.playerDats[i],ACTOR_2000);
    }
  }
}

void FUN_80018bf0(playerData *param_1){
  if (param_1->removeFlag != 0) {
    u32 BVar1 = param_1->borg7;
    Actor::FreePlayerActor(param_1);
    param_1->borg7 = BVar1;
    playerdata_remove_both_dcm(param_1);
  }
}


void FUN_80018c38(void){
  int iVar1;
  ulonglong uVar2;
  
  uVar2 = 0;
  if (0 < gGlobals.Sub.PlayerHandler.max_player) {
    iVar1 = 0;
    while( true ) {
      FUN_80018bf0((int)gGlobals.Sub.PlayerHandler.playerDats + (iVar1 - (int)uVar2) * 0x80);
      uVar2 = ((int)uVar2 + 1) & 0xffff;
      if (gGlobals.Sub.PlayerHandler.max_player <= uVar2) break;
      iVar1 = (int)uVar2 << 4;
    }
  }
  return;
}
