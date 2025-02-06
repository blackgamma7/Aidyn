#include "globals.h"

struct CinematicStruct {
    struct AnimationData * AniDat;
    struct borg_6_header * Borg6;
    struct Borg_12_header * BGM;
    enum EventFlag * cinematic_dat_seq;
    float[2] * clippingPlanes;
    enum borg6Enum * borg6enums;
    enum Borg12Enum * borg12enums;
    u16 tally;
    u16 scene_switch;
    u16 Bstart;
    enum enum_cinematic_switch switch;
    s32 some_cinematic_tally;
    s32 some_cinematic_dat;
    u8 unk0x2c;
    u8 pad[3];
};
enum CinematicEnum{Cinematic_opening,Cinematic_Shadow,Cinematic_Roog,Cinematic_End};
enum enum_cinematic_switch{get_CinematicDat,Load_world_map,Alaron_Truename,From_CinematicMenu};
cinematic_dats cinematic_dat_pointers[4]; //contains pointers to info on each cinematic
u8 cinematic_init_flag=1;
u8 cinematic_skip_flag=0;


void load_cinematic(CinematicEnum param_1,enum_cinematic_switch param_2,s32 param_3){
  memset(&gGlobals.cinematic,0,0x30);
  gGlobals.cinematic.borg6enums = cinematic_dat_pointers[param_1].borg6;
  gGlobals.cinematic.cinematic_dat_seq = (EventFlag *)cinematic_dat_pointers[uVar1].unknown;
  gGlobals.cinematic.borg12enums = cinematic_dat_pointers[param_1].borg12;
  gGlobals.cinematic.clippingPlanes = cinematic_dat_pointers[param_1].floats;
  gGlobals.cinematic.scene_switch = 1;
  gGlobals.cinematic.switch = param_2;
  gGlobals.cinematic.some_cinematic_dat = param_3;
  clear_sfx_entries(&gGlobals.SFXStruct,1);
  cinematicFade_init(param_1);
}

u16 some_cinematic_func(Gfx**param_1){
  s32 iVar1;
  u8 uVar3;
  Gfx*pauVar2;
  u16 uVar4;
  
  uVar4 = (u16)gGlobals.screenFadeModeSwitch;
  pauVar2 = *param_1;
  if (cinematic_init_flag != 0) {
    noop_8005cfac();
    if (gGlobals.QueueA.items != 0) {return uVar4;}
    cinematic_init_flag = 0;
    cinematic_muteMusic_getName();
  }
  iVar1 = cinematic_controls();
  if (gGlobals.cinematic.Bstart == 1) {
    if (gGlobals.cinematic.scene_switch != 0) {
      gGlobals.cinematic.scene_switch = 0;
      iVar1 = 1;
      func_loading_cinematics();
    }
    if ((gGlobals.cinematic.Borg6) &&
       (gGlobals.cinematic.AniDat)) {
      if ((gGlobals.cinematic.AniDat)->aniTime + iVar1) < *(s32 *)((gGlobals.cinematic.Borg6)->unk0x20 + 0xc) + -1) {
        pauVar2 = cinematic_increment(pauVar2,(s16)iVar1);
        pauVar2 = (Gfx*)cinematic_fade(pauVar2,iVar1);
      }
      else {
        clear_cinematic_borgs();
        gGlobals.cinematic.scene_switch = 1;
      }
    }
  }
  else {
    if (gGlobals.cinematic.Bstart < 2) {
      if (gGlobals.cinematic.Bstart == 0) {
        clear_cinematic_borgs();
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
    uVar4 = cinematic_case_switch();
  }
  pauVar2 = N64Print::Draw(pauVar2,(s16)iVar1);
  *param_1 = pauVar2;
  return uVar4;
}

void clear_cinematic_borgs(void){
  if (gGlobals.cinematic.Borg6) {
    clear_borg6(gGlobals.cinematic.Borg6);
    FREEQB6(&gGlobals.cinematic.Borg6);
  }
  if (gGlobals.cinematic.AniDat) FREEQANI(&gGlobals.cinematic);
  if (gGlobals.cinematic.BGM) {
    dcm_remove_func(gGlobals.cinematic.unk0x2c,
                    gGlobals.cinematic.some_cinematic_tally);
    FREEQB12(&gGlobals.cinematic.BGM);
  }
  return;
}


s16 cinematic_muteMusic_getName(void){
  u16 uVar1;
  char acStack272 [256];
  
  gGlobals.cinematic.Bstart = 1;
  SetBackgroundType(2,0,0.0);
  uVar1 = gGlobals.Sub.BGMQueue;
  if (gGlobals.Sub.BGM) {
    clear_music_values();
    gGlobals.Sub.BGMIndex = uVar1;
  }
  memset(acStack272,0,0x100);
  if ((PARTY) && ((PARTY)->Members[0])) {
    strcpy(acStack272,(PARTY)->Members[0]->name);
  }
  MemoryMaker::Unload();
  cinematictext_init(acStack272);
  return Controller::GetDelay(0);
}


u16 cinematic_case_switch(void){
  u32 uVar1;
  u16 uVar2;
  u32 uVar3;
  
  Cinematictext_free();
  MemoryMaker::Reload();
  uVar3 = 0;
  if (*gGlobals.cinematic.borg6enums != 0) {
    uVar1 = 1;
    do {
      uVar3 = uVar1 & 0xffff;
      uVar1 = uVar3 + 1;
    } while (gGlobals.cinematic.borg6enums[uVar3] != 0);
  }
  setEventFlag(gGlobals.cinematic.cinematic_dat_seq[uVar3],true);
  reset_sky_colors();
  switch(gGlobals.cinematic.switch) {
  case get_CinematicDat:
    uVar2 = get_some_cinematic_dat();
    break;
  case Load_world_map:
    uVar2 = load_world_map();
    break;
  case set_CreditsByte:
    uVar2 = set_CreditsByte();
    break;
  case Alaron_Truename:
    uVar2 = Alaron_truename();
    break;
  case From_CinematicMenu:
    uVar2 = cinematic_case_FromMenu();
    break;
  default:
    uVar2 = (u16)gGlobals.cinematic.some_cinematic_dat;
  }
  return uVar2;
}

s16 cinematic_controls(void){
  BUTTON_aidyn BVar1;
  u8 bVar2;
  s16 sVar3;
  Button_hold *fStack24;
  
  sVar3 = 0;
  fStack24 = NULL;
  while( true ) {
    bVar2 = Controller::GetInput((Button_hold *)&fStack24,0);
    if (bVar2 == false) break;
    if (((fStack24->contAidyn).input & (START_BUTTON|B_BUTTON)) != 0) {
      gGlobals.cinematic.Bstart = 0;
    }
    sVar3++;
    BVar1 = (fStack24->contAidyn).input_2;
    #ifdef DEBUGVER
    if ((BVar1 & A_BUTTON) != 0) {sVar3 = 12;} //FF with B button
    if ((BVar1 & B_BUTTON) != 0) {sVar3 = 1;}
    #endif
  }
  if (sVar3 == 0) {sVar3 = 1;}
  return sVar3;
}

Gfx* cinematic_increment(Gfx*param_1,s16 param_2){
  Gfx*pauVar1;

  pauVar1 = RenderSky(param_1,param_2);
  pauVar1 = Graphics::StartDisplay(pauVar1,0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
  set_animation_speed(gGlobals.cinematic.AniDat,(char)param_2);
  FUN_800a0df4(gGlobals.cinematic.AniDat);
  pauVar1 = gsAnimationDataMtx(pauVar1,gGlobals.cinematic.AniDat);
  pauVar1 = BorgAnimDrawScene(pauVar1,gGlobals.cinematic.AniDat);
  inc_cinematic_runtime(param_2);
  cinematic_import_player_name();
  dec_caption_timer(register0x000000ec,param_2);
  return pauVar1;
}

void func_loading_cinematics(void){
  u8 V;
  float fVar1;
  float fVar2;
  
  if (gGlobals.cinematic.borg6enums[gGlobals.cinematic.tally] == 0) {gGlobals.cinematic.Bstart = 0;}
  else {
    cinematic_seqs(gGlobals.cinematic.cinematic_dat_seq[gGlobals.cinematic.tally]);
    reset_scene_timers();
    if (gGlobals.cinematic.borg12enums[gGlobals.cinematic.tally] != ~Tacet) {
      gGlobals.cinematic.BGM = load_borg_12(gGlobals.cinematic.borg12enums[gGlobals.cinematic.tally]);
      DCM_func(&gGlobals.cinematic.unk0x2c,&gGlobals.cinematic.some_cinematic_tally,
               (void *)((s32)(gGlobals.cinematic.BGM)->unk0x8 + 8),0xff,0x80,1,0xffffffff,0);
      fVar1 = gGlobals.VolBGM * 255.0f;
      if (INT_MAX_f <= fVar1) {fVar1-= INT_MAX_f;}
      fVar2 = gGlobals.VolSFX * 255.0f;
      if (INT_MAX_f <= fVar2) {fVar2-= INT_MAX_f;}
      V = (u8)(s32)fVar2;
      if (((s32)fVar2 & 0xffU) < ((s32)fVar1 & 0xffU)) {V = (u8)(s32)fVar1;}
      some_music_func((u32)gGlobals.cinematic.unk0x2c,gGlobals.cinematic.some_cinematic_tally,V);
    }
    gGlobals.cinematic.Borg6 = get_borg_6(gGlobals.cinematic.borg6enums[gGlobals.cinematic.tally]);
    gGlobals.cinematic.AniDat = BorgAnimLoadScene(*(u32 *)(gGlobals.cinematic.Borg6)->unk0x20);
    FUN_8009f87c(gGlobals.cinematic.AniDat,gGlobals.cinematic.Borg6);
    AniDat_Flags_OR_0x10(gGlobals.cinematic.AniDat);
    Anidat_Flags_NAND_0x81(gGlobals.cinematic.AniDat);
    SetNearFarPlanes(gGlobals.cinematic.AniDat,
                      gGlobals.cinematic.clippingPlanes[gGlobals.cinematic.tally][0],
                      gGlobals.cinematic.clippingPlanes[gGlobals.cinematic.tally][1]);
    gGlobals.cinematic.tally++;
  }
}

u16 load_world_map(void){
  Borg_9_header *pBVar1;
  u32 uVar2;
  s32 iVar3;
  dialoug_dat *puVar4;
  s32 iVar4;
  dialoug_dat *pdVar5;
  
  pBVar1 = loadBorg9(StartingMap);
  uVar2 = (u32)(pBVar1->dat).voxelCount;
  pdVar5 = NULL;
  if (uVar2 != 0) {
    puVar4 = (dialoug_dat *)&((pBVar1->dat).ref_objs)->unk0x28;
    iVar4 = 0x10000;
    do { //look for "opening cutscene" object
      if ((*(s16 *)&puVar4[-1].unk0x32 == 9) && (puVar4->borg_13 == 0x362)) {
        pdVar5 = puVar4;
      }
      iVar3 = iVar4 >> 0x10;
      puVar4 = (dialoug_dat *)(puVar4[1].name + 0xc);
      iVar4 = iVar4 + 0x10000;
    } while (iVar3 < (s32)uVar2);
  }
  dialoug_func(pdVar5->borg_13,pdVar5->unk0x8,pdVar5->unk0x2,pdVar5->unk0x4,pdVar5->unk0x6,0x7fff);
  remove_borg_9(pBVar1);
  return 12;
}

u16 set_CreditsByte(void){
  gGlobals.creditsByte = 2;
  return 19;}

u16 Alaron_truename(void){
  CharSheet *pCVar1 = get_charsheet(PARTY,gEntityDB->entities[0x99].ID);
  if (pCVar1) {pCVar1->EXP->flags |= TrueName;}
  return 1;
}

u16 cinematic_case_FromMenu(void){return (u16)gGlobals.cinematic.some_cinematic_dat;}

void noop_8005cfac(void){}

u16 get_some_cinematic_dat(void){return (u16)gGlobals.cinematic.some_cinematic_dat;}

//This may be from a seperate script.
struct CinematicFade {
    u8 index;
    u8 fadeType; /* none,black,white,red */
    u16 runtime; /* div 2 */
    u16 fadeTime; /* div 2 */
    s16 exitTime;
};
CinematicFade* cinematicFadePointers[4]; //transition data for each scene
CinematicFade* cinematicFadePointer; //above, for current cinematic
Color32 cinematic_fade_color;
u16 cinematic_fade_s16;
float cinematic_fade_float,cinematic_fade_speed;
u16 cinematic_scene_runtime,cinematic_scene_tally;

void cinematicFade_init(u16 param_1){
  cinematicFadePointer = cinematicFadePointers[param_1];
  cinematic_fade_color = {0,0,0,0};
  cinematic_fade_short = 0;
  cinematic_fade_float = 0.0;
  cinematic_fade_speed = 0.0;
  cinematic_scene_runtime = 0;
  cinematic_scene_tally = 0;
}

void reset_scene_timers(void){
  cinematic_scene_runtime = 0;
  cinematic_scene_tally++;
}

Gfx* cinematic_fade(Gfx*param_1,s16 param_2){
  u8 bVar1;
  s16 sVar2;
  Gfx*pauVar3;
  s16 sVar4;
  u32 uVar5;
  u32 uVar6;
  s16 uVar7;
  float fVar8;
  
  uVar7 = param_2;
  uVar6 = (u32)cinematic_scene_runtime;
  cinematic_scene_runtime = uVar7 + cinematic_scene_runtime;
  if (cinematicFadePointer->index != cinematic_scene_tally) goto LAB_8005d1d4;
  uVar5 = (u32)cinematicFadePointer->runtime * 2;
  if ((cinematic_scene_runtime < uVar5) || (uVar5 < uVar6)) goto LAB_8005d1d4;
  uVar5 = (u32)cinematicFadePointer->fadeTime * 2;
  sVar4 = cinematicFadePointer->exitTime * 2;
  uVar6 = uVar5 - 4;
  sVar2 = sVar4 + 0x40;
  if (cinematicFadePointer->fadeTime < 5) {
    uVar6 = uVar5;
    sVar2 = sVar4;
  }
  uVar7 += (u32)cinematic_scene_runtime + (u32)cinematicFadePointer->runtime * -2;
  cinematic_fade_short = sVar2 + (s16)(uVar6 & 0xffff);
  cinematic_fade_speed = (float)(1.0d / (double)(uVar6 & 0xffff));
  bVar1 = cinematicFadePointer->fadeType;
  if (bVar1 == 1) {
    cinematic_fade_color.R = 0;
LAB_8005d1b0:
    cinematic_fade_color.G = 0;
    cinematic_fade_color.B = 0;
    cinematic_fade_float = 0.0;
  }
  else if (bVar1 == 0) {
    cinematic_fade_speed = -cinematic_fade_speed;
    cinematic_fade_float = 1.0f;
    }
  else if (bVar1 == 2) {
    cinematic_fade_color.R = 0xff;
    cinematic_fade_color.G = 0xff;
    cinematic_fade_color.B = 0xff;
    cinematic_fade_float = 0.0;
  }
  else if (bVar1 == 3) {
    cinematic_fade_color.R = 0xff;
    goto LAB_8005d1b0;
        }
  cinematicFadePointer++;
LAB_8005d1d4:
  if (cinematic_fade_short != 0) {
    uVar6 = (u32)cinematic_fade_short;
    cinematic_fade_short = (u16)(uVar6 - uVar7);
    if ((s32)((uVar6 - uVar7) * 0x10000) < 0) {cinematic_fade_short = 0;}
    cinematic_fade_float+= cinematic_fade_speed * (float)uVar7;
    if (1.0f < cinematic_fade_float) {cinematic_fade_float = 1.0f;}
    if (cinematic_fade_float < 0.0) {cinematic_fade_float = 0.0;}
    fVar8 = cinematic_fade_float * 255.0f;
    if (fVar8 < INT_MAX_f) {cinematic_fade_color.A = (u8)(s32)fVar8;}
    else {cinematic_fade_color.A = (u8)(s32)(fVar8 - INT_MAX_f);}
    if (cinematic_fade_color.A != 0) {
      pauVar3 = rsp_func(param_1,6,Graphics::get_hres(),Graphics::get_vres());
      param_1 = gsFadeInOut(pauVar3,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,cinematic_fade_color.R,cinematic_fade_color.G,
                            cinematic_fade_color.B,cinematic_fade_color.A);
    }
  }
  return param_1;
}

//may be part of Cinematictext, but unused, so dunno.
BaseWidget * Ofunc_8005d330(char *param_1,s16 param_2,u16 param_3,u16 param_4,u16 param_5,
              u16 param_6,u8 param_7,u8 param_8,u8 param_9,u8 param_10){
  BaseWidget *pwVar1;
  
  pwVar1 = widgettext_func_2(passToMalloc(0x7c),param_1,param_2);
  set_widget_coords(pwVar1,param_3,param_4);
  some_widget_setter(pwVar1,param_4,param_3,param_5,param_6);
  pwVar1->SetColor(param_7,param_8,param_9,param_10);
  return pwVar1;
}
