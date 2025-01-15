#include "globals.h"

char** copyrightText=NULL;
#ifdef DEBUGVER
u16 copyright_error=0;
#endif
AnimationData* SplashLogoModel=NULL;
WidgetBorg8* SplashLicence=NULL;



#ifdef DEBUGVER
#define BUILDVER "02.01d-PRERELEASE"
#define COMPILEDATE "Feb  2 2001"
#define COMPILETIME "00:02:40"

void TitleSplash::ShowVerion(Gfx**param_1,char param_2){
  Gfx*pauVar1;
  
  if ((show_verion_flag) && (param_2)) {
    pauVar1 = *param_1;
    Gsprintf("Aidyn Chronicles\nVersion: 02.01d-PRERELEASE\nCompile: %s-%s\nCode: %lu",
     COMPILEDATE,COMPILETIME,(&clear_end - &romMain) + 0x400);
    pauVar1 = Graphics::DrawText(pauVar1,gGlobals.text,0x1e,0x1e,200,200,200,param_2);
    *param_1 = pauVar1;
  }
}
void TitleSplash::Noop(void){}
#endif

void TitleSplash::Timer(u16 *param_1,u8 *alpha,u8 *param_3,u32 ShowTime,u8 *param_5,u8 param_6){
  u32 uVar1;
  u16 uVar2;
  u32 uVar3;
  
  uVar3 = 0;
  uVar1 = (u32)*alpha;
  uVar2 = *param_1;
  if (param_3) uVar3 = (u32)*param_3;
  if (uVar2 == 1) {
    gGlobals.splashscreenTimer++;
    if (ShowTime <= gGlobals.splashscreenTimer) uVar2 = 2;
  }
  else {
    if (uVar2 < 2) {
      if ((uVar2 == 0) && (uVar1 = (s32)((uVar1 + 0x1e) * 0x10000) >> 0x10, 0xfe < uVar1)) {
        uVar1 = 0xff;
        uVar2 = 1;
        splashscreen_fadeTimer = 0;
        gGlobals.splashscreenTimer = 0;
      }
    }
    else {
      if (uVar2 == 2) {
        uVar1 = (s32)((uVar1 - 0x1e) * 0x10000) >> 0x10;
        if ((param_3) &&
           (uVar3 = (s32)((uVar3 + 0x1e) * 0x10000) >> 0x10, 0xfe < uVar3)) {
          uVar3 = 0xff;
        }
        if ((s32)uVar1 < 1) {
          splashscreen_fadeTimer = splashscreen_fadeTimer + 1;
          uVar1 = 0;
          if (0x13 < splashscreen_fadeTimer) {
            uVar2 = 0;
            *param_5 = param_6;
          }
        }
      }
    }
  }
  if (param_3) *param_3 = (u8)uVar3;
  *alpha = (u8)uVar1;
  *param_1 = uVar2;
}

void TitleSplash::Init(void){
  SplashLogoModel = BorgAnimLoadScene(BORG5_N64Logo);
  Animation::SetNearFarPlanes(SplashLogoModel,1.0f,256.0);
  Animation::SetFlag8(SplashLogoModel);
  Animation::SetFlag10(SplashLogoModel);
  Animation::UnsetFlag4(SplashLogoModel);
  Animation::SetModelTint(SplashLogoModel,0,0,0,0xff);
  gGlobals.splashScreenUnkC = 0;
  gGlobals.splashscreenTimer = 0;
  fadeFloatMirror = 1.0f;
  SplashLicence = new WidgetBorg8(loadBorg8(BORG8_LicencedByNintendo));
  SplashLicence->SetColor(0,0,0,0);
  SplashLicence->SetCoords(160 -(SplashLicence->GetWidth()/2),190);
}

void TitleSplash::N64Free(void){
  AllocFreeQueueItem(&gGlobals.QueueA,&SplashLogoModel,1,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&SplashLicence,6,0);
  SplashLogoModel = NULL;
  SplashLicence = NULL;
}

void TitleSplash::Load(void){
  u32 BVar1;
  
  gGlobals.splashscreenSwitch = 5;
  gGlobals.thqBorg8 = loadBorg8(BORG8_LogoTHQ);
  gGlobals.h20Borg8 = loadBorg8(BORG8_LogoH20);
  BVar1 = BORG8_EXPPakNo;
  if (gExpPakFlag) BVar1 = BORG8_EXPPakYes;
  SplashExpPak = loadBorg8(BVar1);
  TitleSplash::Init();
  gGlobals.splashscreenTimer = 0;
  gGlobals.splashScreenUnkA = 0;
  gGlobals.splashScreenUnkB = 0xff;
  gGlobals.splashScreenUnkC = 0xff;
  gGlobals.splashScreenUnkD = 0;
  copyrightText = func_romStrings(copyrightStrings,0x180);
  Controller::GetDelay(0);
}

void TitleSplash::Free(void){
  AllocFreeQueueItem(&gGlobals.QueueA,&gGlobals.h20Borg8,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&gGlobals.thqBorg8,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&SplashExpPak,4,0);
  font_func(gGlobals.font,(fontface_struct *)0x1c);
  free_romstring(copyrightText);
  TitleSplash::N64Free();
}

u8 TitleSplash::Show(s32 *param_1){
  Gfx*pauVar1;
  u8 bVar2;
  
  if (splashscreen_load_flag) {
    TitleSplash::Load();
    splashscreen_load_flag=0;
  }
  bVar2 = true;
  pauVar1 = some_video_setting_init((Gfx*)*param_1,0,0,0x140,0xf0,0,0,0,0);
  *param_1 = pauVar1;
  switch(gGlobals.splashscreenSwitch) {
  case 0:
    splashscreen_clear_flag=1;
    bVar2 = false;
    break;
  case 1:
    gGlobals.splashscreenSwitch = N64Logo(param_1);
    break;
  case 2:
    gGlobals.splashscreenSwitch = THQLogo(param_1);
    break;
  case 3:
    gGlobals.splashscreenSwitch = H2OLogo(param_1);
    break;
  case 4:
    gGlobals.splashscreenSwitch = Copyright(param_1);
    break;
  case 5:
    gGlobals.splashscreenSwitch = ExpansionPak(param_1);
  }
  if (splashscreen_clear_flag) {
    Free();
    splashscreen_load_flag=1;
    splashscreen_clear_flag=0;
  }
  return bVar2;
}

void TitleSplash::Borg8(Gfx*param_1,u8 alpha,Borg8header *borg){

  Gfx*pauVar1;
  float v;
  float h;
  
  if (alpha){
    h = (float)(320 - (borg->dat).Width) * 0.5f;
    v = (float)(240 - (borg->dat).Height) * 0.5f;
    pauVar1 = (Gfx*)(*param_1)[0];
    pauVar1 = rsp_func(pauVar1,6,Graphics::get_hres(),Graphics::get_vres());
    pauVar1 = Borg8_DrawSimple(pauVar1,borg,h,v,1.0f,1.0f,0xff,0xff,0xff,alpha);
    (*param_1)[0] = (u32)pauVar1;
  }
}

u8 TitleSplash::ExpansionPak(Gfx** param_1){
  u8 bVar1;
  u8 abStack40;
  controller_aidyn* temp,
  Gfx* auStack32;
  #ifdef DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 30
  #endif

  auStack32 = *param_1;
  abStack40 = gGlobals.splashscreenSwitch;
  while (Controller::GetInput(&temp,0)) {
    TitleSplash::Timer(&splashscreen_exppakdatA,&splashscreen_exppakdatB,NULL,ShowTime,abStack40,4);
  }
  TitleSplash::Borg8(auStack32,splashscreen_exppakdatB,SplashExpPak);
  *param_1 = auStack32;
  return abStack40;
}

void TitleSplash::Println(Gfx*param_1,s16 *HSpace,char *TXT){
  print_func_80044dc(gGlobals.font,param_1,(u8 *)TXT,(0x140 - passto_get_text_kerning(gGlobals.font,TXT)) / 2,(s32)*HSpace);
  *HSpace+= (gGlobals.font)->charH;
}
u8 TitleSplash::Copyright(Gfx **param_1){
  FontStruct *pFVar1;
  byte bVar2;
  ushort uVar3;
  ushort uVar4;
  uint uVar6;
  byte abStack_38;
  short sStack_36;
  controller_aidyn *cont;
  Gfx *aGStack_30;
  
  aGStack_30 = *param_1;
  abStack_38 = gGlobals.splashscreenSwitch;
  sStack_36 = (Graphics::get_vres()/2) + -7 + (gGlobals.font)->charH * -6;
  while (Controller::GetInput(&cont,0)) {
    if ((cont->input_2 & (R_BUTTON|L_BUTTON)) == (R_BUTTON|L_BUTTON)) {
      show_verion_flag = 1;
    }
    Timer(&SplashTimerState,&copyright_text_color,NULL,2,&abStack_38,1);
  }
  RSPFUNC6(aGStack_30);
  aGStack_30 = gsFadeInOut(aGStack_30,0,0,Graphics::get_hres(),Graphics::get_vres(),0,0,0,0);
  font_func(gGlobals.font,BORG8_MainFont);
  ((gGlobals.font)->col).R = copyright_text_color;
  ((gGlobals.font)->col).G = copyright_text_color;
  ((gGlobals.font)->col).B = copyright_text_color;
  ((gGlobals.font)->col).A = copyright_text_color;
  if (copyright_error == 0) {
    for(uVar6 = 0;uVar6 < 0xc;uVar6++) {
      Println(&aGStack_30,&sStack_36,copyrightText[uVar6]);
      if (((uVar6 == 1) || (uVar6 == 3)) || (uVar6 == 7)) {
        sStack_36 += 5;
      }
    }
  }
  else {
    Gsprintf("Code Segment Too Big!\n");
    Println(&aGStack_30,&sStack_36,gGlobals.text);
    Gsprintf("Max: 0x%08x - %d\n",0x100000,0x100000);
    Println(&aGStack_30,&sStack_36,gGlobals.text);
    Gsprintf("Current: 0x%08x - %d\n",0xffa50,0xffa50);
    Println(&aGStack_30,&sStack_36,gGlobals.text);
    Gsprintf("Over: 0x%08x - %d\n",-0x5b0,-0x5b0);
    Println(&aGStack_30,&sStack_36,gGlobals.text);
    if (SplashTimerState == 1) {
      gGlobals.splashscreenTimer = 0;
    }
  }
  *param_1 = aGStack_30;
  return abStack_38;
}

u8 TitleSplash::N64Logo(Gfx**param_1){
  BaseWidget *pwVar1;
  u8 bVar2;
  u8 bVar4;
  Gfx*pauVar3;
  u16 h;
  u16 v;
  float fVar5;
  float fVar6;
  float fVar7;
  u8 auStack64;
  Button_hold BStack60;
  
  #ifdef DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 120
  #endif

  bVar2 = N64_logo_alpha;
  pwVar1 = SplashLicence;
  pauVar3 = *param_1;
  auStack64 = gGlobals.splashscreenSwitch;
  (SplashLicence->col)={N64_logo_alpha,N64_logo_alpha,N64_logo_alpha,N64_logo_alpha};
  set_anidat_color(SplashLogoModel,(u32)N64_logo_alpha,(u32)N64_logo_alpha,(u32)N64_logo_alpha,0xff);
  if (360.0f < N64LogoRot) N64LogoRot-= 360.0f;
  fVar7 = N64LogoRot * dtor;
  n64LogoVec3[0] = __sinf(fVar7) * 40.0f;
  n64LogoVec3[1] = 15.0f;
  n64LogoVec3[2] = __cosf(fVar7) * 40.0f;
  fVar5 = -n64LogoVec3[0];
  fVar7 = -n64LogoVec3[1];
  fVar6 = -n64LogoVec3[2];
  while (Controller::GetInput(&BStack60,0)) {
    TitleSplash::Timer(&N64_logo_short,&N64_logo_alpha,NULL,ShowTime,&auStack64,2);
    N64LogoRot = += 2.0d;
    TitleSplash::Noop();
  }
  pauVar3 = Graphics::StartDisplay(pauVar3,0,0,0x140,0xf0);
  animationData_LookAt(SplashLogoModel,n64LogoVec3[0],n64LogoVec3[1],n64LogoVec3[2],fVar5,fVar7,fVar6,0,1.0f,0);
  FUN_800a0df4(SplashLogoModel);
  pauVar3 = gsAnimationDataMtx(pauVar3,SplashLogoModel);
  pauVar3 = BorgAnimDrawScene(pauVar3,SplashLogoModel);
  RSPFUNC(pauVar3,6);
  pauVar3 = SplashLicence->Render(pauVar3,0,0,320,240);
  *param_1 = pauVar3;
  return auStack64;
}

u8 TitleSplash::THQLogo(BUTTON_aidyn *param_1){
  u8 bVar1;
  controller_aidyn auStack36;
  
  #ifdef DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 120
  #endif

  auStack36.input = *param_1;
  auStack36.joy_x._0_1_ = gGlobals.splashscreenSwitch;
  while (bVar1 = Controller::GetInput((Button_hold *)&auStack36.joy_y,0), bVar1) {
    TitleSplash::Timer(&u16_800e98fc,&THQLogoAlpha,NULL,ShowTime,&auStack36,3);
    TitleSplash::Noop();
  }
  TitleSplash::Borg8((Gfx*)&auStack36.input,THQLogoAlpha,gGlobals.thqBorg8);
  #ifdef DEBUGVER
  TitleSplash::ShowVerion((Gfx*)&auStack36.input,THQLogoAlpha);
  #endif
  *param_1 = auStack36.input;
  if (auStack36.joy_x._0_1_ == 3) {THQLogoAlpha = 0;}
  return auStack36.joy_x._0_1_;
}

u8 TitleSplash::H2OLogo(BUTTON_aidyn *param_1){
  controller_aidyn auStack36;
  
  #ifdef DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 120
  #endif

  auStack36.input = *param_1;
  auStack36.joy_x._0_1_ = gGlobals.splashscreenSwitch;
  while (Controller::GetInput((Button_hold *)&auStack36.joy_y,0)) {
    TitleSplash::Noop();
    TitleSplash::Timer(&u16_800e9900,&h20LogoAlpha,NULL,ShowTime,&auStack36,0);
  }
  TitleSplash::Borg8((Gfx*)&auStack36.input,h20LogoAlpha,gGlobals.h20Borg8);
  #ifdef DEBUGVER
  TitleSplash::ShowVerion((Gfx*)&auStack36.input,h20LogoAlpha);
  #endif
  *param_1 = auStack36.input;
  if (auStack36.joy_x._0_1_ == 0) h20LogoAlpha = 0;
  return auStack36.joy_x._0_1_;
}

