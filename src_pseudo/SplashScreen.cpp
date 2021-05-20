char** copyrightText;
u16 copyright_error;
AnimationData* splashscreenAniDat //the N64 logo, I suspect.


#ifdef DEBUGVER
#define BUILDVER "02.01d-PRERELEASE"
#define COMPILEDATE "Feb  2 2001"
#define COMPILETIME "00:02:40"

void SplashScreen_ShowVerion(rspCom **param_1,char param_2){
  rspCom *pauVar1;
  
  if ((show_verion_flag != 0) && (param_2 != '\0')) {
    pauVar1 = *param_1;
    sprintf(gGlobals.text,"Aidyn Chronicles\nVersion: 02.01d-PRERELEASE\nCompile: %s-%s\nCode: %lu",
     COMPILEDATE,COMPILETIME,(&clear_end - &romMain) + 0x400);
    pauVar1 = debug::some_debug_print(pauVar1,gGlobals.text,0x1e,0x1e,200,200,200,param_2);
    *param_1 = pauVar1;
  }
}
void splashscreen_noop(void){}
#endif

void splashscreen_timer(ushort *param_1,byte *alpha,byte *param_3,#define ShowTime,u8 *param_5,u8 param_6){
  uint uVar1;
  ushort uVar2;
  uint uVar3;
  
  uVar3 = 0;
  uVar1 = (uint)*alpha;
  uVar2 = *param_1;
  if (param_3 != (byte *)0x0) {uVar3 = (uint)*param_3;}
  if (uVar2 == 1) {
    gGlobals.splashscreenTimer++;
    if (ShowTime <= gGlobals.splashscreenTimer) {uVar2 = 2;}
  }
  else {
    if (uVar2 < 2) {
      if ((uVar2 == 0) && (uVar1 = (int)((uVar1 + 0x1e) * 0x10000) >> 0x10, 0xfe < uVar1)) {
        uVar1 = 0xff;
        uVar2 = 1;
        splashscreen_fadeTimer = 0;
        gGlobals.splashscreenTimer = 0;
      }
    }
    else {
      if (uVar2 == 2) {
        uVar1 = (int)((uVar1 - 0x1e) * 0x10000) >> 0x10;
        if ((param_3 != (byte *)0x0) &&
           (uVar3 = (int)((uVar3 + 0x1e) * 0x10000) >> 0x10, 0xfe < uVar3)) {
          uVar3 = 0xff;
        }
        if ((int)uVar1 < 1) {
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
  if (param_3 != (byte *)0x0) {*param_3 = (byte)uVar3;}
  *alpha = (byte)uVar1;
  *param_1 = uVar2;
  return;
}

void splash_screen_func(void){
  widgetStruct *pwVar1;
  Borg_8_header *pBVar2;
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
  pwVar1 = (widgetStruct *)passToMalloc(0x7c);
  pBVar2 = get_borg_8(BORG8_LicencedByNintendo);
  widget_N64Logo = borg8_widget(pwVar1,pBVar2);
  (*(widget_N64Logo->methods->SetColor).func)
            ((int)&widget_N64Logo->ptr0 + (int)(short)(widget_N64Logo->methods->SetColor).arg[0],0,0
             ,0);
  uVar3 = (*(widget_N64Logo->methods->getHeight).func)
                    ((int)&widget_N64Logo->ptr0 +
                     (int)(short)(widget_N64Logo->methods->getHeight).arg[0]);
  set_widget_coords(widget_N64Logo,0xa0 - (short)(uVar3 >> 1),0xbe);
}

void n64_logo_free(void){
  AllocFreeQueueItem(&gGlobals.QueueA,&splashscreenAniDat,1,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&widget_N64Logo,6,0);
  splashscreenAniDat = NULL;
  widget_N64Logo = NULL;
  return;
}

void load_splashscreen_data(void){
  Borg8Enum BVar1;
  
  gGlobals.splashscreenSwitch = 5;
  gGlobals.thqBorg8 = get_borg_8(BORG8_LogoTHQ);
  gGlobals.h20Borg8 = get_borg_8(BORG8_LogoH20);
  BVar1 = BORG8_EXPPakNo;
  if (ExpPakFlag) {BVar1 = BORG8_EXPPakYes;}
  exp_pack_borg8 = get_borg_8(BVar1);
  splash_screen_func();
  gGlobals.splashscreenTimer = 0;
  gGlobals.splashScreenUnkA = 0;
  gGlobals.splashScreenUnkB = 0xff;
  gGlobals.splashScreenUnkC = 0xff;
  gGlobals.splashScreenUnkD = 0;
  copyrightText = func_romStrings(copyrightStrings,0x180);
  cont_delay(0);
  return;
}

void clear_splashScreen_data(void){
  AllocFreeQueueItem(&gGlobals.QueueA,&gGlobals.h20Borg8,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&gGlobals.thqBorg8,4,0);
  AllocFreeQueueItem(&gGlobals.QueueA,&exp_pack_borg8,4,0);
  font_func(gGlobals.font,(fontface_struct *)0x1c);
  free_romstring(copyrightText);
  n64_logo_free();
  return;
}

bool show_splash_screens(undefined4 *param_1)

{
  rspCom *pauVar1;
  bool bVar2;
  
  if (splashscreen_load_flag) {
    load_splashscreen_data();
    splashscreen_load_flag=0;
  }
  bVar2 = true;
  pauVar1 = some_video_setting_init((rspCom *)*param_1,0,0,0x140,0xf0,0,0,0,0);
  *param_1 = pauVar1;
  switch(gGlobals.splashscreenSwitch) {
  case 0:
    splashscreen_clear_flag=1;
    bVar2 = false;
    break;
  case 1:
    gGlobals.splashscreenSwitch = show_n64_logo(param_1);
    break;
  case 2:
    gGlobals.splashscreenSwitch = show_THQ_logo(param_1);
    break;
  case 3:
    gGlobals.splashscreenSwitch = show_h2O_logo(param_1);
    break;
  case 4:
    gGlobals.splashscreenSwitch = copyright_splash_screen(param_1);
    break;
  case 5:
    gGlobals.splashscreenSwitch = show_expansionPak_screen(param_1);
  }
  if (splashscreen_clear_flag) {
    clear_splashScreen_data();
    splashscreen_load_flag=1;
    splashscreen_clear_flag=0;
  }
  return bVar2;
}

void splashScreen_borg8(rspCom *param_1,u8 param_2,Borg_8_header *param_3){

  rspCom *pauVar1;
  float fVar2;
  float fVar3;
  
  if (param_2 != 0) {
    fVar3 = (float)(0x140 - (uint)(ushort)(param_3->dat).height) * 0.5f;
    fVar2 = (float)(0xf0 - (uint)(ushort)(param_3->dat).width) * 0.5f;
    pauVar1 = (rspCom *)(*param_1)[0];
    pauVar1 = rsp_func(pauVar1,6,gfx::get_hres(),gfx::get_vres());
    pauVar1 = pass_to_borg_image_draw(pauVar1,param_3,fVar3,fVar2,1.0f,1.0f,0xff,0xff,
                         0xff,param_2);
    (*param_1)[0] = (u32)pauVar1;
  }
  return;
}

byte show_expansionPak_screen(u32 *param_1){
  bool bVar1;
  byte abStack40 [8];
  u32 auStack32 [8];
  #ifdef DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 30
  #endif

  auStack32[0] = *param_1;
  abStack40[0] = gGlobals.splashscreenSwitch;
  while (get_cont_aidyn((Button_hold *)(abStack40 + 4),0)) {
    splashscreen_timer(&splashscreen_exppakdatA,&splashscreen_exppakdatB,NULL,ShowTime,abStack40,4);
  }
  splashScreen_borg8((rspCom *)auStack32,splashscreen_exppakdatB,exp_pack_borg8);
  *param_1 = auStack32[0];
  return abStack40[0];
}

void print_copyright_line(rspCom *param_1,short *HSpace,char *TXT){
  int iVar1;
  
  iVar1 = passto_get_text_kerning(gGlobals.font,TXT);
  print_func_80044dc(gGlobals.font,param_1,(byte *)TXT,(0x140 - iVar1) / 2,(int)*HSpace);
  *HSpace+= (gGlobals.font)->Font_Height;
}
byte copyright_splash_screen(rspCom **param_1){
  FontStruct *pFVar1;
  byte bVar2;
  uint uVar3;
  bool bVar5;
  ushort uVar4;
  ushort v;
  undefined2 V;
  byte abStack56 [2];
  short sStack54;
  controller_aidyn *cont;
  rspCom *apauStack48 [12];
  
  #ifdef DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 120
  #endif

  apauStack48[0] = *param_1;
  abStack56[0] = gGlobals.splashscreenSwitch;
  uVar3 = gfx::get_vres();
  sStack54 = (short)(uVar3 >> 1) + -7 + (gGlobals.font)->Font_Height * -6;
  while (bVar5 = get_cont_aidyn((Button_hold *)&cont,0), bVar5 != false) {
    if ((cont->input_2 & (R_BUTTON|L_BUTTON)) == (R_BUTTON|L_BUTTON)) {show_verion_flag = 1;}
    splashscreen_timer(&USHORT_800e98ee,&copyright_text_color,(byte *)0x0,showTime,abStack56,1);
  }
  apauStack48[0] = rsp_func(apauStack48[0],6,gfx::get_hres(),gfx::get_vres());
  uVar4 = gfx::get_hres();
  V = gfx::get_vres();
  apauStack48[0] = gsFadeInOut(apauStack48[0],0,0,(int)(short)uVar4,V,0,0,0,0);
  font_func(gGlobals.font,(fontface_struct *)0x1d);
  bVar2 = copyright_text_color;
  pFVar1 = gGlobals.font;
  ((gGlobals.font)->col).R = copyright_text_color;
  (pFVar1->col).G = bVar2;
  (pFVar1->col).B = bVar2;
  (pFVar1->col).A = bVar2;
  if (copyright_error == 0) {
    uVar3 = 0;
    do {
      print_copyright_line((rspCom *)apauStack48,&sStack54,copyrightText[uVar3]);
      if (((uVar3 == 1) || (uVar3 == 3)) || (uVar3 == 7)) {
        sStack54+=5; //space out select lines more
      }
      uVar3++;
    } while (uVar3 < 0xc);
  }
  else {
    sprintf(gGlobals.text,"Code Segment Too Big!\n");
    print_copyright_line((rspCom *)apauStack48,&sStack54,gGlobals.text);
    sprintf(gGlobals.text,"Max: 0x%08x - %d\n",0x100000,0x100000);
    print_copyright_line((rspCom *)apauStack48,&sStack54,gGlobals.text);
    sprintf(gGlobals.text,"Current: 0x%08x - %d\n",0xffa50,0xffa50);
    print_copyright_line((rspCom *)apauStack48,&sStack54,gGlobals.text);
    sprintf(gGlobals.text,"Over: 0x%08x - %d\n",0xfffffffffffffa50,0xfffffffffffffa50);
    print_copyright_line((rspCom *)apauStack48,&sStack54,gGlobals.text);
    if (USHORT_800e98ee == 1) {gGlobals.splashscreenTimer = 0;}
  }
  *param_1 = apauStack48[0];
  return abStack56[0];
}

byte show_n64_logo(rspCom **param_1){
  widgetStruct *pwVar1;
  byte bVar2;
  bool bVar4;
  rspCom *pauVar3;
  ushort h;
  ushort v;
  float fVar5;
  float fVar6;
  float fVar7;
  byte auStack64;
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
  set_anidat_color(splashscreenAniDat,(uint)N64_logo_alpha,(uint)N64_logo_alpha,(uint)N64_logo_alpha,0xff);
  if (360.0f < N64LogoRot) {N64LogoRot-= 360.0f;}
  fVar7 = N64LogoRot * dtor;
  fVar6 = 40.0f;
  n64LogoVec3[0] = __sinf(fVar7) * fVar6;
  n64LogoVec3[1] = 15.0f;
  n64LogoVec3[2] = __cosf(fVar7) * fVar6;
  fVar5 = -n64LogoVec3[0];
  fVar7 = -n64LogoVec3[1];
  fVar6 = -n64LogoVec3[2];
  while (get_cont_aidyn(&BStack60,0)) {
    splashscreen_timer(&N64_logo_short,&N64_logo_alpha,(byte *)0x0,ShowTime,&auStack64,2);
    N64LogoRot = += 2.0d);
    splashscreen_noop();
  }
  pauVar3 = some_rsp_func(pauVar3,0,0,0x140,0xf0);
  animationData_math_func
            (splashscreenAniDat,n64LogoVec3[0],n64LogoVec3[1],n64LogoVec3[2],fVar5,fVar7,fVar6,0,
             1.0f,0);
  FUN_800a0df4(splashscreenAniDat);
  pauVar3 = (rspCom *)gsAnimationDataMtx(pauVar3,splashscreenAniDat);
  pauVar3 = (rspCom *)FUN_800a0da4(pauVar3,splashscreenAniDat);
  pauVar3 = rsp_func(pauVar3,6,gfx::get_hres(),gfx::get_vres());
  pauVar3 = (rspCom *)
            (*(widget_N64Logo->methods->unk_func_8).func)
                      ((int)&widget_N64Logo->ptr0 +
                       (int)(short)(widget_N64Logo->methods->unk_func_8).arg[0],pauVar3,0,0);
  *param_1 = pauVar3;
  return auStack64;
}

byte show_THQ_logo(BUTTON_aidyn *param_1){
  bool bVar1;
  controller_aidyn auStack36;
  
  #ifdef DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 120
  #endif

  auStack36.input = *param_1;
  auStack36.joy_x._0_1_ = gGlobals.splashscreenSwitch;
  while (bVar1 = get_cont_aidyn((Button_hold *)&auStack36.joy_y,0), bVar1 != false) {
    splashscreen_timer(&USHORT_800e98fc,&THQLogoAlpha,(byte *)0x0,ShowTime,&auStack36,3);
    splashscreen_noop();
  }
  splashScreen_borg8((rspCom *)&auStack36.input,THQLogoAlpha,gGlobals.thqBorg8);
  #ifdef DEBUGVER
  SplashScreen_ShowVerion((rspCom *)&auStack36.input,THQLogoAlpha);
  #endif
  *param_1 = auStack36.input;
  if (auStack36.joy_x._0_1_ == 3) {THQLogoAlpha = 0;}
  return auStack36.joy_x._0_1_;
}

byte show_h2O_logo(BUTTON_aidyn *param_1){
  bool bVar1;
  controller_aidyn auStack36;
  
  #ifdef DEBUGVER
  #define ShowTime 2
  #else
  #define ShowTime 120
  #endif

  auStack36.input = *param_1;
  auStack36.joy_x._0_1_ = gGlobals.splashscreenSwitch;
  while (bVar1 = get_cont_aidyn((Button_hold *)&auStack36.joy_y,0), bVar1 != false) {
    splashscreen_noop();
    splashscreen_timer(&u16_800e9900,&h20LogoAlpha,(byte *)0x0,ShowTime,&auStack36,0);
  }
  splashScreen_borg8((rspCom *)&auStack36.input,h20LogoAlpha,gGlobals.h20Borg8);
  #ifdef DEBUGVER
  SplashScreen_ShowVerion((rspCom *)&auStack36.input,h20LogoAlpha);
  #endif
  *param_1 = auStack36.input;
  if (auStack36.joy_x._0_1_ == 0) {h20LogoAlpha = 0;}
  return auStack36.joy_x._0_1_;
}

