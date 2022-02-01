char** copyrightText;
u16 copyright_error;
AnimationData* splashscreenAniDat //the N64 logo, I suspect.


#ifdef DEBUGVER
#define BUILDVER "02.01d-PRERELEASE"
#define COMPILEDATE "Feb  2 2001"
#define COMPILETIME "00:02:40"

void TitleSplash::ShowVerion(Gfx**param_1,char param_2){
  Gfx*pauVar1;
  
  if ((show_verion_flag) && (param_2)) {
    pauVar1 = *param_1;
    sprintf(gGlobals.text,"Aidyn Chronicles\nVersion: 02.01d-PRERELEASE\nCompile: %s-%s\nCode: %lu",
     COMPILEDATE,COMPILETIME,(&clear_end - &romMain) + 0x400);
    pauVar1 = gfx::DrawText(pauVar1,gGlobals.text,0x1e,0x1e,200,200,200,param_2);
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
    if (ShowTime <= gGlobals.splashscreenTimer) {uVar2 = 2;}
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
  ulong uVar3;
  float fVar4;
  
  splashscreenAniDat = BorgAnimLoadScene(0x25a8); //n64 logo
  fVar4 = 1.0f;
  setA_with_2floats(splashscreenAniDat,1.0f,256.0);
  AniDat_flags_OR_8(splashscreenAniDat);
  AniDat_Flags_OR_0x10(splashscreenAniDat);
  AniDat_Flags_NAND_5(splashscreenAniDat);
  set_anidat_color(splashscreenAniDat,0,0,0,0xff);
  gGlobals.splashScreenUnkC = 0;
  gGlobals.splashscreenTimer = 0;
  fadeFloatMirror = fVar4;
  widget_N64Logo = borg8_widget(passToMalloc(0x7c),get_borg_8(BORG8_LicencedByNintendo));
  (*(widget_N64Logo->methods->SetColor).func)
            ((s32)&widget_N64Logo->ptr0 + (s32)(s16)(widget_N64Logo->methods->SetColor).arg[0],0,0
             ,0);
  uVar3 = (*(widget_N64Logo->methods->getHeight).func)
                    ((s32)&widget_N64Logo->ptr0 +
                     (s32)(s16)(widget_N64Logo->methods->getHeight).arg[0]);
  set_widget_coords(widget_N64Logo,0xa0 - (s16)(uVar3 >> 1),0xbe);
}

void TitleSplash::N64Free(void){
  AllocFreeQueueItem(&gGlobals.QueueA,&splashscreenAniDat,1,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&widget_N64Logo,6,0);
  splashscreenAniDat = NULL;
  widget_N64Logo = NULL;
}

void TitleSplash::Load(void){
  Borg8Enum BVar1;
  
  gGlobals.splashscreenSwitch = 5;
  gGlobals.thqBorg8 = get_borg_8(BORG8_LogoTHQ);
  gGlobals.h20Borg8 = get_borg_8(BORG8_LogoH20);
  BVar1 = BORG8_EXPPakNo;
  if (ExpPakFlag) BVar1 = BORG8_EXPPakYes;
  exp_pack_borg8 = get_borg_8(BVar1);
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
  AllocFreeQueueItem(&gGlobals.QueueA,&exp_pack_borg8,4,0);
  font_func(gGlobals.font,(fontface_struct *)0x1c);
  free_romstring(copyrightText);
  TitleSplash::N64Free();
}

bool TitleSplash::Show(s32 *param_1){
  Gfx*pauVar1;
  bool bVar2;
  
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
    gGlobals.splashscreenSwitch = TitleSplash::N64Logo(param_1);
    break;
  case 2:
    gGlobals.splashscreenSwitch = TitleSplash::THQLogo(param_1);
    break;
  case 3:
    gGlobals.splashscreenSwitch = TitleSplash::H2OLogo(param_1);
    break;
  case 4:
    gGlobals.splashscreenSwitch = TitleSplash::Copyright(param_1);
    break;
  case 5:
    gGlobals.splashscreenSwitch = TitleSplash::ExpansionPak(param_1);
  }
  if (splashscreen_clear_flag) {
    TitleSplash::Free();
    splashscreen_load_flag=1;
    splashscreen_clear_flag=0;
  }
  return bVar2;
}

void TitleSplash::Borg8(Gfx*param_1,u8 alpha,Borg_8_header *borg){

  Gfx*pauVar1;
  float v;
  float h;
  
  if (alpha){
    h = (float)(320 - (borg->dat).height) * 0.5f;
    v = (float)(240 - (borg->dat).width) * 0.5f;
    pauVar1 = (Gfx*)(*param_1)[0];
    pauVar1 = rsp_func(pauVar1,6,gfx::get_hres(),gfx::get_vres());
    pauVar1 = pass_to_borg_image_draw(pauVar1,borg,h,v,1.0f,1.0f,0xff,0xff,0xff,alpha);
    (*param_1)[0] = (u32)pauVar1;
  }
}

u8 TitleSplash::ExpansionPak(u32 *param_1){
  bool bVar1;
  u8 abStack40 [8];
  u32 auStack32 [8];
  #ifdef DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 30
  #endif

  auStack32[0] = *param_1;
  abStack40[0] = gGlobals.splashscreenSwitch;
  while (Controller::GetInput((Button_hold *)(abStack40 + 4),0)) {
    TitleSplash::Timer(&splashscreen_exppakdatA,&splashscreen_exppakdatB,NULL,ShowTime,abStack40,4);
  }
  TitleSplash::Borg8((Gfx*)auStack32,splashscreen_exppakdatB,exp_pack_borg8);
  *param_1 = auStack32[0];
  return abStack40[0];
}

void TitleSplash::Println(Gfx*param_1,s16 *HSpace,char *TXT){
  print_func_80044dc(gGlobals.font,param_1,(u8 *)TXT,(0x140 - passto_get_text_kerning(gGlobals.font,TXT)) / 2,(s32)*HSpace);
  *HSpace+= (gGlobals.font)->Font_Height;
}
u8 TitleSplash::Copyright(Gfx**param_1){
  FontStruct *pFVar1;
  u8 bVar2;
  u32 uVar3;
  u8 abStack56 [2];
  s16 sStack54;
  controller_aidyn *cont;
  Gfx*apauStack48 [12];
  
  #ifdef DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 120
  #endif

  apauStack48[0] = *param_1;
  abStack56[0] = gGlobals.splashscreenSwitch;
  sStack54 = (s16)(gfx::get_vres() >> 1) + -7 + (gGlobals.font)->Font_Height * -6;
  while (Controller::GetInput((Button_hold *)&cont,0)) {
    if ((cont->input_2 & (R_BUTTON|L_BUTTON)) == (R_BUTTON|L_BUTTON)) show_verion_flag = 1;
    TitleSplash::Timer(&u16_800e98ee,&copyright_text_color,NULL,showTime,abStack56,1);
  }
  apauStack48[0] = rsp_func(apauStack48[0],6,gfx::get_hres(),gfx::get_vres());
  apauStack48[0] = gsFadeInOut(apauStack48[0],0,0,gfx::get_hres(),gfx::get_vres(),0,0,0,0);
  font_func(gGlobals.font,(fontface_struct *)0x1d);
  bVar2 = copyright_text_color;
  pFVar1 = gGlobals.font;
  ((gGlobals.font)->col).R = copyright_text_color;
  (pFVar1->col).G = bVar2;
  (pFVar1->col).B = bVar2;
  (pFVar1->col).A = bVar2;
  if (copyright_error == 0) {
    for(uVar3 = 0;uVar3 < 12;uVar3++) {
      TitleSplash::Println((Gfx*)apauStack48,&sStack54,copyrightText[uVar3]);
      if (((uVar3 == 1) || (uVar3 == 3)) || (uVar3 == 7)) sStack54+=5; //space out select lines more
    }
  }
  else {
    sprintf(gGlobals.text,"Code Segment Too Big!\n");
    TitleSplash::Println((Gfx*)apauStack48,&sStack54,gGlobals.text);
    sprintf(gGlobals.text,"Max: 0x%08x - %d\n",0x100000,0x100000);
    TitleSplash::Println((Gfx*)apauStack48,&sStack54,gGlobals.text);
    sprintf(gGlobals.text,"Current: 0x%08x - %d\n",0xffa50,0xffa50);
    TitleSplash::Println((Gfx*)apauStack48,&sStack54,gGlobals.text);
    sprintf(gGlobals.text,"Over: 0x%08x - %d\n",0xfffffffffffffa50,0xfffffffffffffa50);
    TitleSplash::Println((Gfx*)apauStack48,&sStack54,gGlobals.text);
    if (u16_800e98ee == 1) {gGlobals.splashscreenTimer = 0;}
  }
  *param_1 = apauStack48[0];
  return abStack56[0];
}

u8 TitleSplash::N64Logo(Gfx**param_1){
  widgetStruct *pwVar1;
  u8 bVar2;
  bool bVar4;
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
  pwVar1 = widget_N64Logo;
  pauVar3 = *param_1;
  auStack64 = gGlobals.splashscreenSwitch;
  (widget_N64Logo->col)={N64_logo_alpha,N64_logo_alpha,N64_logo_alpha,N64_logo_alpha};
  set_anidat_color(splashscreenAniDat,(u32)N64_logo_alpha,(u32)N64_logo_alpha,(u32)N64_logo_alpha,0xff);
  if (360.0f < N64LogoRot) {N64LogoRot-= 360.0f;}
  fVar7 = N64LogoRot * dtor;
  fVar6 = 40.0f;
  n64LogoVec3[0] = __sinf(fVar7) * fVar6;
  n64LogoVec3[1] = 15.0f;
  n64LogoVec3[2] = __cosf(fVar7) * fVar6;
  fVar5 = -n64LogoVec3[0];
  fVar7 = -n64LogoVec3[1];
  fVar6 = -n64LogoVec3[2];
  while (Controller::GetInput(&BStack60,0)) {
    TitleSplash::Timer(&N64_logo_short,&N64_logo_alpha,NULL,ShowTime,&auStack64,2);
    N64LogoRot = += 2.0d);
    TitleSplash::Noop();
  }
  pauVar3 = some_rsp_func(pauVar3,0,0,0x140,0xf0);
  animationData_LookAt(splashscreenAniDat,n64LogoVec3[0],n64LogoVec3[1],n64LogoVec3[2],fVar5,fVar7,fVar6,0,1.0f,0);
  func_800a0df4(splashscreenAniDat);
  pauVar3 = (Gfx*)gsAnimationDataMtx(pauVar3,splashscreenAniDat);
  pauVar3 = (Gfx*)func_800a0da4(pauVar3,splashscreenAniDat);
  pauVar3 = rsp_func(pauVar3,6,gfx::get_hres(),gfx::get_vres());
  pauVar3 = (Gfx*)(*(widget_N64Logo->methods->unk_func_8).func)
                      ((s32)&widget_N64Logo->ptr0 +
                       (s32)(s16)(widget_N64Logo->methods->unk_func_8).arg[0],pauVar3,0,0);
  *param_1 = pauVar3;
  return auStack64;
}

u8 TitleSplash::THQLogo(BUTTON_aidyn *param_1){
  bool bVar1;
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

