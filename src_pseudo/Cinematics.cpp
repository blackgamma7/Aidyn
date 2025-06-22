#include "globals.h"
#include "memaker.h"


u32 sCinematic0Borg6[]{
  BORG6_Cinematic0_1,BORG6_Cinematic0_2,BORG6_Cinematic0_3,BORG6_Cinematic0_4,
  BORG6_Cinematic0_5,BORG6_Cinematic0_6,BORG6_Cinematic0_7,BORG6_Cinematic0_8,
  BORG6_Cinematic0_9,BORG6_Cinematic0_10,BORG6_Cinematic0_11,BORG6_Cinematic0_12,
  BORG6_Cinematic0_13,0
};
float sCinematic0Planes[][2]{
  {.1,35},{.1,12},{1,12},{1,30},{1,60},{.1,150},{1,170},
  {.25,192},{.1,30},{.25,275},{.1,30},{.1,322},{.1,25}
};

u32 sCinematic1Borg6[]{
  BORG6_Cinematic1_1,BORG6_Cinematic1_2,BORG6_Cinematic1_3,BORG6_Cinematic1_4,
  0
};
float sCinematic1Planes[][2]{
  {.025,80},{.025,100},{.025,13},{.025,80}
};

u32 sCinematic2Borg6[]{
  BORG6_Cinematic2_1,BORG6_Cinematic2_2,BORG6_Cinematic2_3,0
};
float sCinematic2Planes[][2]{
  {1,50},{.25,522},{1,522}
};

u32 sCinematic3Borg6[]{
  BORG6_Cinematic3_1,BORG6_Cinematic3_2,BORG6_Cinematic3_3,BORG6_Cinematic3_4,
  BORG6_Cinematic3_5,0
};
float sCinematic3Planes[][2]{
  {1,214},{.25,106},{.25,102},{.25,96},{.25,70},{1,218}
};

u16 sCinematic0Flags[]{
  0,-1,-1,-1,-1,1,-1,-1,2,-1,3,4,5,FLAG_Cinematic0
};
u16 sCinematic1Flags[]{
  10,-1,-1,11,FLAG_Cinematic1,0
};
u16 sCinematic2Flags[]{
  12,13,14,FLAG_Cinematic2
};
u16 sCinematic3Flags[]{
  -1,6,-1,7,8,9,FLAG_Cinematic3,0
};

u32 sCinematic0Borg12[]{
  BORG12_Cinematic0_1,BORG12_Cinematic0_2,BORG12_Cinematic0_3,BORG12_Cinematic0_4,
  BORG12_Cinematic0_5,BORG12_Cinematic0_6,BORG12_Cinematic0_7,BORG12_Cinematic0_8,
  BORG12_Cinematic0_9,BORG12_Cinematic0_10,BORG12_Cinematic0_11,BORG12_Cinematic0_12,
  BORG12_Cinematic0_13
};
u32 sCinematic1Borg12[]{
  BORG12_Cinematic1_1,BORG12_Cinematic1_2,BORG12_Cinematic1_3,BORG12_Cinematic1_4,
};
u32 sCinematic2Borg12[]{
  BORG12_Cinematic2_1,BORG12_Cinematic2_2,BORG12_Cinematic2_3
};
u32 sCinematic3Borg12[]{
  BORG12_Cinematic3_1,BORG12_Cinematic3_2,BORG12_Cinematic3_3,BORG12_Cinematic3_4,
  BORG12_Cinematic3_5
};

 //contains pointers to info on each cinematic
CinematicPointers gCinematicPointers[]{
{sCinematic0Borg6,sCinematic0Flags,sCinematic0Borg12,sCinematic0Planes},
{sCinematic1Borg6,sCinematic1Flags,sCinematic1Borg12,sCinematic1Planes},
{sCinematic2Borg6,sCinematic2Flags,sCinematic2Borg12,sCinematic2Planes},
{sCinematic3Borg6,sCinematic3Flags,sCinematic3Borg12,sCinematic3Planes},
};
u8 cinematic_init_flag=1;
u8 cinematic_skip_flag=0;


void Cinematic::Load(u16 param_1,u16 param_2,s32 param_3){
  CLEAR(&gGlobals.cinematic);
  gGlobals.cinematic.borg6enums = gCinematicPointers[param_1].borg6;
  gGlobals.cinematic.SeqenceFlags = gCinematicPointers[param_1].flags;
  gGlobals.cinematic.borg12enums = gCinematicPointers[param_1].borg12;
  gGlobals.cinematic.clippingPlanes = gCinematicPointers[param_1].planes;
  gGlobals.cinematic.scene_switch = 1;
  gGlobals.cinematic.CSwitch = param_2;
  gGlobals.cinematic.some_cinematic_dat = param_3;
  clear_sfx_entries(&gGlobals.SFXStruct,1);
  InitFade(param_1);
}

u16 Cinematic::Tick(Gfx**GG){
  s32 iVar1;
  u8 uVar3;
  u16 uVar4;
  
  uVar4 = (u16)gGlobals.screenFadeModeSwitch;
  Gfx* g = *GG;
  if (cinematic_init_flag) {
    noop_8005cfac();
    if (gGlobals.QueueA.items) return uVar4;
    cinematic_init_flag = 0;
    Cinematic::GetName();
  }
  iVar1 = Cinematic::Control();
  if (gGlobals.cinematic.Bstart == 1) {
    if (gGlobals.cinematic.scene_switch != 0) {
      gGlobals.cinematic.scene_switch = 0;
      iVar1 = 1;
      LoadNextScene();
    }
    if ((gGlobals.cinematic.Borg6) &&
       (gGlobals.cinematic.sceneDat)) {
      if (gGlobals.cinematic.sceneDat->aniTime + iVar1 < gGlobals.cinematic.Borg6->dat->aniLength + -1) {
        g = Cinematic::Render(g,(s16)iVar1);
        g = Cinematic::Fade(g,iVar1);
      }
      else {
        FreeScene();
        gGlobals.cinematic.scene_switch = 1;
      }
    }
  }
  else {
    if (gGlobals.cinematic.Bstart < 2) {
      if (gGlobals.cinematic.Bstart == 0) {
        FreeScene();
        gGlobals.cinematic.Bstart = 2;
      }
    }
    else {
      if (gGlobals.cinematic.Bstart == 2) {cinematic_skip_flag = 1;}
    }
  }
  if (cinematic_skip_flag != 0) {
    cinematic_init_flag = 1;
    cinematic_skip_flag = 0;
    uVar4 = Cinematic::EndCase();
  }
  g = N64Print::Draw(g,(s16)iVar1);
  *GG = g;
  return uVar4;
}

void Cinematic::FreeScene(void){
  if (gGlobals.cinematic.Borg6) {
    unlinkBorg6(gGlobals.cinematic.Borg6);
    FREEQB6(gGlobals.cinematic.Borg6);
  }
  if (gGlobals.cinematic.sceneDat) FREEQSCENE(gGlobals.cinematic);
  if (gGlobals.cinematic.BGM) {
    DCM::Remove(gGlobals.cinematic.BGIndex,gGlobals.cinematic.BGId);
    FREEQB12(gGlobals.cinematic.BGM);
  }
}


s16 Cinematic::GetName(void){
  u16 uVar1;
  char acStack272 [256];
  
  gGlobals.cinematic.Bstart = 1;
  Sky::SetBackgroundType(2,0,0.0);
  uVar1 = gGlobals.Sub.Borg12Next2;
  if (gGlobals.Sub.BGM) {
    clear_music_values(1);
    gGlobals.Sub.BGMIndex = uVar1;
  }
  CLEAR(acStack272);
  if ((PARTY) && ((PARTY)->Members[0])) {
    strcpy(acStack272,(PARTY)->Members[0]->name);
  }
  MemoryMaker::Unload();
  CinematicText::Init(acStack272);
  return Controller::GetDelay(0);
}


u16 Cinematic::EndCase(void){
  u32 uVar1;
  u16 uVar2;
  u16 i;
  
  CinematicText::Free();
  MemoryMaker::Reload();
  for(i=0;gGlobals.cinematic.borg6enums[i] != 0;i++){}
  setEventFlag(gGlobals.cinematic.SeqenceFlags[i],true);
  Sky::ResetColors();
  switch(gGlobals.cinematic.CSwitch) {
  case CSwitch_CineDat:
    uVar2 = GetSomeDat();
    break;
  case CSwitch_WorldMap:
    uVar2 = LoadMap();
    break;
  case CSwitch_Credits:
    uVar2 = LoadCredits();
    break;
  case CSwitch_TrueName:
    uVar2 = TrueName();
    break;
  case CSwitch_ToMenu:
    uVar2 = ToMenu();
    break;
  default:
    uVar2 = (u16)gGlobals.cinematic.some_cinematic_dat;
  }
  return uVar2;
}

u16 Cinematic::Control(void){
  u16 delta;
  controller_aidyn *cont;
  
  for(delta = 0,cont = NULL;!Controller::GetInput(&cont,0);delta++) {
    if ((cont->input & (START_BUTTON|B_BUTTON))) {
      gGlobals.cinematic.Bstart = 0;
    }
    #ifdef DEBUGVER //may not be for loop, increment above here.
    if ((cont->input_2 & A_BUTTON)) delta = 12; //Fast Forward
    if ((cont->input_2 & B_BUTTON)) delta = 1;
    #endif
  }
  if (delta == 0) delta = 1;
  return delta;
}

Gfx* Cinematic::Render(Gfx*param_1,s16 delta){
  Gfx*g;

  g = Sky::RenderSky(param_1,delta);
  g = Graphics::StartDisplay(g,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
  Scene::SetSpeed(gGlobals.cinematic.sceneDat,delta);
  FUN_800a0df4(gGlobals.cinematic.sceneDat);
  g = gsAnimationDataMtx(g,gGlobals.cinematic.sceneDat);
  g = BorgAnimDrawScene(g,gGlobals.cinematic.sceneDat);
  CinematicText::IncRuntime(delta);
  CinematicText::NextLine();
  CinematicText::Render(&g,delta);
  return g;
}

void Cinematic::LoadNextScene(void){
  byte vol;

  if (gGlobals.cinematic.borg6enums[gGlobals.cinematic.tally] == 0) {
    gGlobals.cinematic.Bstart = 0;
  }
  else {
    CinematicText::Sequence(gGlobals.cinematic.SeqenceFlags[gGlobals.cinematic.tally]);
    Cinematic::NextFadeTally();
    if (gGlobals.cinematic.borg12enums[gGlobals.cinematic.tally] != -1) {
      gGlobals.cinematic.BGM =
           load_borg_12(gGlobals.cinematic.borg12enums[gGlobals.cinematic.tally]);
      DCM::Add(&gGlobals.cinematic.BGIndex,&gGlobals.cinematic.BGId,
               &(gGlobals.cinematic.BGM)->dat->sub,0xff,0x80,1,-1,0);
      u8 fVar1 = gGlobals.VolBGM * 255.0f;
      u8 fVar2 = gGlobals.VolSFX * 255.0f;
      vol = fVar2;
      if (fVar2 < fVar1) vol = fVar1;
      DCM::Start(gGlobals.cinematic.BGIndex,gGlobals.cinematic.BGId,vol);
    }
    gGlobals.cinematic.Borg6 = get_borg_6(gGlobals.cinematic.borg6enums[gGlobals.cinematic.tally]);
    gGlobals.cinematic.sceneDat = BorgAnimLoadScene((gGlobals.cinematic.Borg6)->dat->borg5);
    Scene_SetBorg6(gGlobals.cinematic.sceneDat,gGlobals.cinematic.Borg6);
    Scene::SetFlag10(gGlobals.cinematic.sceneDat);
    Scene::UnsetFlag80(gGlobals.cinematic.sceneDat);
    Scene::SetNearFarPlanes(gGlobals.cinematic.sceneDat,
               gGlobals.cinematic.clippingPlanes[gGlobals.cinematic.tally][0],
               gGlobals.cinematic.clippingPlanes[gGlobals.cinematic.tally][1]);
    gGlobals.cinematic.tally++;
  }
}

u16 Cinematic::LoadMap(void){
  Borg9Header *map = loadBorg9(0x0fdb); //load map chunk player starts at
  u32 c = (u32)(map->dat).voxelObjCount;
  dialoug_dat *dia = NULL;
  
  if (c) {
    for(s16 i=0;i<c;i++){//find and load voxel for opening dialog
    if((map->dat.voxelObjs[i].header.type==VOXEL_Dialouge)&&
       (map->dat.voxelObjs[i].dialoug.borg_13==BORG13_OpeningDialog)){
        dia = &map->dat.voxelObjs[i].dialoug;
      }
    }
  }
  dialoug_func((uint)dia->borg_13,dia->RefPointID,dia->MapDatA,dia->MapShortA,dia->MapShortB,0x7fff);
  remove_borg_9(map);
  return 12;
}

u16 Cinematic::LoadCredits(void){
  gGlobals.creditsByte = 2;
  return 19;}

u16 Cinematic::TrueName(void){
  CharSheet *pCVar1 = PARTY->GetMemberById(gEntityDB->entities[0x99].ID);
  if (pCVar1) {pCVar1->EXP->flags |= CHAR_TrueName;}
  return 1;
}

u16 Cinematic::ToMenu(void){return (u16)gGlobals.cinematic.some_cinematic_dat;}

void noop_8005cfac(void){}

u16 Cinematic::GetSomeDat(void){return (u16)gGlobals.cinematic.some_cinematic_dat;}

