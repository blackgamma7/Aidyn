#include "globals.h"
#include "vobjects.h"

u16 gCombatFreeCamera=0;

void camera_control_update_(float x,float y,vec2f *vecIn,vec2f *VecOut){
    vec2f norm;

    norm.x = 0.0;
    norm.y = 1.0f;
    float dot1 = Vec2Dot(&norm,vecIn);
    norm.x = 1.0;
    norm.y = 0.0;
    float dot2 = Vec2Dot(&norm,vecIn);
    VecOut->x = -(dot1 * x + dot2 * y);
    VecOut->y = -(dot1 * y - dot2 * x);
  }
  
  u16 Ofunc_GetCombatCameraMode(){return gCombatFreeCamera;}
  
  void setCombatCameraMode(u16 param_1){
    #ifdef DEBUGVER
    if (1 < param_1) Crash::ManualCrash("SetCombatCameraMode","Not TRUE or FALSE");
    #endif
    gCombatFreeCamera = param_1;
  }
  
  void Actor::Move(playerData *p,controller_aidyn *controller){
    float *pfVar1;
    u16 *puVar2;
    bool bVar3;
    u32 BVar5;
    s16 sVar6;
    double dVar7;
    float fVar8;
    float fVar9;
    float y;
    vec2f fStack184;
    
    if (p->borg7 == -1) return;
    if (gGlobals.screenFadeMode != 0) {
      if (p->ani_type == AniType_Dying) return;
      p->ani_type = 0;
      return;
    }
    if ((gGlobals.scriptcamera.counter1 != 0) &&
       (sVar6 = (PHANDLE.camera)->holdCamera,
       controller->input_2 = controller->input_2 & ~R_BUTTON, sVar6 != 0)) {
      PHANDLE.camera->holdCamera = 3;
    }
                      // Flea Jump
    if ((((_flea_flag != 0) && (p->alaron_flag)) &&
        ((controller->input & A_BUTTON) != 0)) && ((p->collision).unk1e != 0)) {
      vec2f fleaVec = {(p->facing).x,(p->facing).y};
      Vec2Scale(&fleaVec,-0.06);
      (p->collision).vel.x += fleaVec.x;
      (p->collision).vel.y += 0.084;
      (p->collision).vel.z += fleaVec.y;
    }
    #ifdef DEBUGVER
    if (gDebugFlag) {
      if ((controller->input_2 & L_BUTTON)&&(controller->input & D_LEFT)){
          gLoadOneZone ^= 1; //load data only for center map chunk.
          N64PRINT("Multiple Zones Load Toggled\n");
        }
      if ((controller->input_2 & R_BUTTON) && (controller->input & D_RIGHT)) {
        gSceneBoulder ^= 1; //replace next loaded "scene" voxels with boulders.
        N64PRINT("Reference Objects Toggled\n");
      }
      if ((gDebugFlag) && (controller->input & C_UP)) {
        gGlobals.DebugStatDisplay = //cycle through displayed performance stats.
             (char)(gGlobals.DebugStatDisplay + 1) + (char)((gGlobals.DebugStatDisplay + 1) / 6) * -6;
      }
    }
    #endif
    if ((controller->input & B_BUTTON)) {
     if (gGlobals.playerCharStruct.show_portaits == 0) {
      gGlobals.playerCharStruct.show_portaits = 1;
      MINIMAP.Toggle(1);
     }
     else {
      gGlobals.playerCharStruct.show_portaits = 0;
      MINIMAP.Toggle(0);
     }
   }
    if (p->ani_type != AniType_Dying) p->ani_type = 0;
    if (gGlobals.gameVars.gamemodeType == GameMode_Combat) {
      if (gCombatFreeCamera) {
        if (gCombatFreeCamera == 1) {
          gCombatFreeCamera = 2;
          (PHANDLE.camera)->unk48 = 4.0f;
        }
        if ((controller->input_2 & R_BUTTON)) {
          (PHANDLE.camera)->unk58 = -controller->joy_x * 8.0f;
          PHANDLE.camera->unk48 += (controller->joy_y * 0.5);
          return;
        }
        camera_control_update_(controller->joy_x,-controller->joy_y,&(PHANDLE.camera)->rotationXZ,&fStack184);
        PHANDLE.camera->aimTarget.x =(PHANDLE.camera->aimTarget.x +fStack184.x * 0.25);
        PHANDLE.camera->aimTarget.z =(PHANDLE.camera->aimTarget.z +fStack184.y * 0.25);
        (PHANDLE.camera)->unk58 = 0.0;
        return;
      }
    }
    #ifdef DEBUGVER
    else {
      if (gCombatFreeCamera)
        CRASH("./src/playerMove.cpp","gCombatFreeCamera Set\nWe are _NOT_ in COMBAT mode!");
    }
    #endif
    if ((controller->input_2 & R_BUTTON) != 0) {
      if ((p->flags & ACTOR_ISPLAYER) == 0) return;
      if (gGlobals.screenFadeMode != 0) return;
      if (PHANDLE.camera->holdCamera == 0) {
        PHANDLE.camera->holdCamera = 1;
      }
      Camera::SetFeild70(PHANDLE.camera,&(p->collision).pos);
      PHANDLE.camera->unk58 -= controller->joy_x * 3.0f;
      PHANDLE.camera->unk48 += controller->joy_y;
      return;
    }
    if ((p->flags & ACTOR_ISPLAYER)){
      if (PHANDLE.camera->holdCamera) PHANDLE.camera->holdCamera = 3;
      PHANDLE.camera->unk58 = 0.0;
      if (PHANDLE.camera->camera_mode == 0) PHANDLE.camera->unk48 = PHANDLE.camera->unk4c;
      else PHANDLE.camera->unk48 = 0.0;
    }
    fVar9 = -controller->joy_x;
    y = controller->joy_y;
    fVar8 = _sqrtf(SQ(fVar9) + SQ(y));
    if (fVar8 <= 0.05) {
      if ((p->flags & ACTOR_ISPLAYER)){
        Camera::SetFeild70(PHANDLE.camera,&p->collision.pos);
      }
    }
    else{
      if (p->visible_flag) {
        gGlobals.playerCharStruct.show_portaits = 0;
        MINIMAP.Toggle(0);
      }
      if ((controller->input_2 & Z_BUTTON) == 0) {
        p->ani_type = AniType_Walk;
        if (0.8 <= fVar8) p->ani_type = AniType_Run;
      }
      else p->ani_type = AniType_Sneak;
      camera_control_update_(fVar9,y,&(PHANDLE.camera)->rotationXZ,&p->facingMirror);
      if (p->visible_flag == 0) fVar9 = 0.34906;
      else fVar9 = 0.17453;
      some_trig_func_2(&p->facing,&p->facingMirror,fVar9);
      if (0.0 < (p->facing).x) {
        if ((p->facing).x < NORMALIZE_MIN) (p->facing).x = NORMALIZE_MIN;
      }
      else if (-(p->facing).x < NORMALIZE_MIN) (p->facing).x = NORMALIZE_MIN;
      Vec2Normalize(&p->facing);
  };
  if (((p->ani_type != 0) && (p->borg7P)) && (p->borg7P->currentAni == 0)) {
      vec3f unkPosVec;
      Vec3Copy(&(p->collision).pos,&unkPosVec);
      unkPosVec.y -= 0.475;
      UNK_NOOP(&unkPosVec,p->Ground_type);
    }
  }
  
  void Actor::MemsetController(ControllerFull *param_1){CLEAR(param_1);}
  
  void Actor::ClearInput(playerData *param_1){
    if ((param_1->flags & ACTOR_2) == 0) {
      (param_1->controller).contAidyn.input_2 = 0;
      (param_1->controller).contAidyn.input = 0;
      (param_1->controller).contAidyn.joy_x = 0.0;
      (param_1->controller).contAidyn.joy_y = 0.0;
      param_1->buttonMask = 0;
    }
  }
  
  
  void Actor::setMoveBasedOnCamera(vec2f *out,vec2f *in){
    vec2f v2,rot;
    
    rot.x = ((PHANDLE.camera)->rotationXZ).x;
    rot.y = ((PHANDLE.camera)->rotationXZ).y;
    v2.x = 0.0;
    v2.y = 1.0f;
    Vec2Normalize(&v2);
    float dot1 = Vec2Dot(&v2,&rot);
    v2.x = 1.0f;
    v2.y = 0.0;
    Vec2Normalize(&v2);
    float dot2 = Vec2Dot(&v2,&rot);
    out->x = -(dot1 * in->x + dot2 * in->y);
    out->y = -(dot1 * in->y - dot2 * in->x);
    Vec2Normalize(out);
  
  }
  
  void Actor::SetControllerWalk(ControllerFull *param_1,vec2f *param_2){
    vec2f avStack_48;
    
    setMoveBasedOnCamera(&avStack_48,param_2);
    (param_1->contAidyn).joy_x = avStack_48.x * 0.5;
    (param_1->contAidyn).joy_y = avStack_48.y * 0.5;
  }
  
  void Actor::SetControllerRun(ControllerFull *param_1,vec2f *param_2){
      vec2f avStack_48;
    
      setMoveBasedOnCamera(&avStack_48,param_2);
      (param_1->contAidyn).joy_x = avStack_48.x * 0.95;
      (param_1->contAidyn).joy_y = avStack_48.y * 0.95;
  }
  
  
  void Actor::ClearInputMoveFlags(playerData *param_1){
    ClearInput(param_1);
    SetFlag(param_1,ACTOR_2);
    UnsetFlag(param_1,ACTOR_CANROTATE|ACTOR_CANMOVE|ACTOR_WALKONLY);
  }
  
void Actor::SetAiDest(playerData *p,float x,float y,float rad,u16 flag){
    if ((p->flags & ACTOR_CANMOVE)) ResetMoveQueue(p);
    ClearInputMoveFlags(p);
    SetFlag(p,ACTOR_CANMOVE);
    if (flag) SetFlag(p,ACTOR_WALKONLY);
    p->wanderRadius = rad;
    (p->aiDest).y = y;
    (p->aiDest).x = x;
    p->aiTravelTime = 0;
    p->aiDestDist = 1000.0f;
  }
  
  
  void SetPlayerMoveToQueue(playerData *param_1,float x,float y,float z,s16 param_5){
    u16 uVar1;
    int iVar2;
    int iVar3;
    MoveQueueEntry *pMVar4;
    
    uVar1 = param_1->moveQueueIndex;
    pMVar4 = param_1->moveQueue + uVar1;
    if (pMVar4->active == 0) {
      iVar3 = uVar1 + 1;
      iVar2 = iVar3;
      if (false) iVar2 = uVar1 + 0x10;
      param_1->moveQueueIndex = (s16)iVar3 + (s16)(iVar2 >> 4) * -0x10;
      pMVar4->active = 1;
      (pMVar4->pos2d).x = x;
      (pMVar4->pos2d).y = y;
      pMVar4->rad = z;
      pMVar4->flag = param_5;
      FUN_80019770(param_1);
    }
    else N64PRINT("SetPlayerMoveToQueue Full\n");
  }
  
  void Actor::ResetMoveQueue(playerData *param_1){
    UnsetFlag(param_1,ACTOR_CANMOVE);
    CLEAR(param_1->moveQueue);
    param_1->moveQueueIndex = 0;
    param_1->moveQueueIndex2 = 0;
  }
  
  void FUN_80019770(playerData *param_1){
    int iVar1;
    int iVar2;
    MoveQueueEntry *pabVar2;
    
    pabVar2 = param_1->moveQueue + param_1->moveQueueIndex2;
    if ((pabVar2->active != 0) && ((param_1->flags & ACTOR_CANMOVE) == 0)) {
      pabVar2->active = 0;
      iVar2 = param_1->moveQueueIndex2 + 1;
      iVar1 = iVar2;
      if (false) {
        iVar1 = param_1->moveQueueIndex2 + 0x10;
      }
      param_1->moveQueueIndex2 = (s16)iVar2 + (s16)(iVar1 >> 4) * -0x10;
      Actor::SetAiDest(param_1,(pabVar2->pos2d).x,(pabVar2->pos2d).y,pabVar2->rad,pabVar2->flag);
    }
  }
  
  
  void Actor::SetFacing(playerData *param_1,float param_2,float param_3){
    if ((param_1->flags & ACTOR_1000) == 0) {
      ClearInputMoveFlags(param_1);
      SetFlag(param_1,ACTOR_CANROTATE);
      (param_1->unk26c).x = param_2;
      (param_1->unk26c).y = param_3;
      Vec2Normalize(&param_1->unk26c);
    }
    else {
      param_1->flags = param_1->flags & ~ACTOR_1000;
      (param_1->facing).x = param_2;
      (param_1->facing).y = param_3;
    }
    return;
  }
  
  
  void Ofunc_8001986c(playerData *param_1,BUTTON_aidyn param_2){
    Actor::ClearInput(param_1);
    (param_1->controller).contAidyn.input_2 = (param_1->controller).contAidyn.input_2 | param_2;}
  void Actor::MoveTo(playerData *param_1){
      u32 BVar2;
      int iVar3;
      bool bVar5;
      u32 BVar4;
      int iVar6;
      float fVar8;
      float fVar9;
      vec2f fStack88;
      
      s16 iVar7 = 0;
      if ((param_1->flags & ACTOR_CANMOVE) == 0) {
        (param_1->controller).contAidyn.joy_x = 0.0;
        (param_1->controller).contAidyn.joy_y = 0.0;
      }
      else {
        fStack88.x = (param_1->aiDest).x - (param_1->collision).pos.x;
        fStack88.y = -((param_1->aiDest).y - (param_1->collision).pos.z);
        fVar8 = Vec2Length(&fStack88);
        iVar7 = 1;
        if (0.01 < (param_1->aiDestDist - fVar8)) {
          param_1->aiDestDist = fVar8;
          if ((param_1->flags & ACTOR_WALKONLY) == 0)
            SetControllerRun(&param_1->controller,&fStack88);
          else SetControllerWalk(&param_1->controller,&fStack88);
        }
        else if (gGlobals.playerCharStruct.unkState != 3) {
          iVar6 = 30;
          if (DAT_800ee974) iVar6 = 300;
          param_1->aiTravelTime += gGlobals.delta;
          if (param_1->aiTravelTime >= iVar6){
            if (gCombatP == NULL) {
              FUN_80019b08(param_1);
              fVar8 = 0.0;
            }
            else{
            gCombatP->waitTimer = 0;
            ResetMoveQueue(param_1);
            }
          }
        }
        if (fVar8 < param_1->wanderRadius) {
          UnsetFlag(param_1,ACTOR_CANMOVE);
          FUN_80019770(param_1);
        }
      }
      if ((param_1->flags & ACTOR_CANROTATE) != 0) {
        iVar7++;
        if (some_trig_func_2(&param_1->facing,&param_1->unk26c,0.17453)) {
          UnsetFlag(param_1,ACTOR_CANROTATE);
        }
      }
      BVar2 = (param_1->controller).contAidyn.input_2;
      BVar4 = BVar2 & param_1->buttonMask ^ BVar2;
      (param_1->controller).contAidyn.input = BVar4;
      param_1->buttonMask = BVar2;
      if ((BVar2) || (BVar4))iVar7++;
      if (iVar7 == 0) {
        ClearInputMoveFlags(param_1);
        UnsetFlag(param_1,ACTOR_2);
      }
  }
  
void Actor::SetCombatMove(playerData *param_1,vec3f *pos,float range){
    
  (param_1->combat_vec3).x = pos->x;
  (param_1->combat_vec3).y = pos->y;
  param_1->combatMoveSpeed = range;
  (param_1->combat_vec3).z = pos->z;
  SetFlag(param_1,ACTOR_4);
}

void Actor::UnsetFlag4(playerData *param_1){
    UnsetFlag(param_1,ACTOR_4);
}
  
void FUN_80019b08(playerData *param_1){
    int iVar2;
    MoveQueueEntry *pfVar2;
    int iVar3;
    
    if ((param_1->flags & ACTOR_2)) {
      if ((param_1->flags & ACTOR_CANMOVE)){
        iVar3 = (u16)param_1->moveQueueIndex + 0xf;
        iVar2 = iVar3;
        if (false) {
          iVar2 = (u16)param_1->moveQueueIndex + 0x1e;
        }
        pfVar2 = &param_1->moveQueue[iVar2];
        if (pfVar2->active == 0) {
          (param_1->collision).pos.z = (param_1->aiDest).y;
          (param_1->collision).pos.x = (param_1->aiDest).x;
        }
        else {
          (param_1->collision).pos.x = (pfVar2->pos2d).x;
          (param_1->collision).pos.z = (pfVar2->pos2d).y;
        }
        Actor::CheckCollision(param_1,0.0,0,0);
      }
      if ((param_1->flags & ACTOR_CANROTATE))
        Vec2Copy(&param_1->facingMirror,&param_1->facing);
      Actor::ResetMoveQueue(param_1);
    }
}
  
void debug_sub_3(){
    if (0 < PHANDLE.max_player) {
      for(u16 i=0;i<PHANDLE.max_player;i++) {
        playerData* p= &PHANDLE.playerDats[i];
        if (p->removeFlag != 0) FUN_80019b08(p);
      }
    }
  }
  
  