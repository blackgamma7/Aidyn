u16 doubleGlobalTickerFlag;
Borg_8_header* PAL_Warning_image;
bool PAL_warning_flag=true;

struct App_manager{
OSSched* sched;
OSMesgQueue* MesgQ;
OSMesg* Mesg;
int* stack;
OSThread thread;
OSMesgQueue MesgQ2;
OSScClient client;}
struct App_manager appManager;

//this first func is debug-vesion exculsive, and not easy to sus out.
/* 
rspCom * display_debug_stats(rspCom *param_1){
  playerData *ppVar1;
  ushort uVar4;
  ushort v;
  uint uVar2;
  rspCom *pauVar3;
  int extraout_a3_lo;
  float extraout_f12;
  float memfree1;
  float memfree2;
  
  if ((debug_flag != 0) && (1.0f <= gGlobals.delay)) {
    if (gGlobals.DebugStatDisplay - 1 < 3) {param_1 = (rspCom *)DisplaySystemMonitor(param_1);}
    sprintf(gGlobals.text,"%2d",(short)(int)(60.0f / (double)gGlobals.delay));
    param_1 = (rspCom *)some_debug_print(param_1,gGlobals.text,0x120,0xd7,0x80,0x80,0x80,0xff);
    if (gGlobals.DebugStatDisplay != 0) {
      uVar4 = get_hres();
      v = get_vres();
      param_1 = (rspCom *)rsp_func(param_1,6,uVar4,v);
      ppVar1 = gGlobals.playerCharStruct.playerDat;
      if ((gGlobals.DebugStatDisplay & 1) != 0) {
        uVar2 = get_obj_free();
        temp_v0 = get_MemFree();
        temp_f2 = (f64) temp_v0;
        phi_f2 = temp_f2;
        if (temp_v0 < 0) {phi_f2 = temp_f2 + INT_MAX_f;}
        memfee1 = (f32) phi_f2;
        temp_v0 = get_memFree_2();
        temp_f2 = (f64) temp_v0;
        phi_f2_2 = temp_f2;
        if (temp_v0 < 0) {phi_f2_2 = temp_f2 + INT_MAX_f;}
        memfree2 = (f32) phi_f2_2;
        pauVar3 = gsFadeInOut(param_1,0x12,0xc4,0x114,0xde,0,0,0,0x80);
        if (ppVar1 == (playerData *)0x0) {
          if (!(INT_MAX_f <= (temp_f20 * 9.765625E-4f))) {}
          temp_f0 = temp_f22 * 9.765625E-4f;
          if (!(INT_MAX_f <= temp_f0)) {phi_v1 = (s32) temp_f0;}
          else {phi_v1 = (s32) (temp_f0 - INT_MAX_f) | 0x80000000;}
          sprintf(gGlobals.text,"%d - %%%1.1f - (%d/%d)\n%c%02d - %2.0ffps\n",
          uVar2,phi_v1,(char)gGlobals.Sub.mapShort1,gGlobals.Sub.mapShort2,
                      (double)(60.0f / gGlobals.delay));
          //sprintf(phi_s5, (void *)0x800D9820, temp_s0_2, phi_v1, temp_s2->unk292 + 0x40, (?32) temp_s2->unk294, (f64) (D_800D9894 / temp_s0_4->unkC));
        }
        else {
          uVar4 = ppVar1->Ground_type;
          sprintf(gGlobals.text,"%2d - %s",uVar4,ground_labels[uVar4]);
          pauVar3 = (rspCom *)some_debug_print(pauVar3,gGlobals.text,0x12,0xc4,0,200,200,0xff);
          if (!(INT_MAX_f <= (memfree1 * 9.765625E-4f))) {}
          if (!(INT_MAX_f <= (memfree2 * 9.765625E-4f))) {}
          sprintf(gGlobals.text,"%d - %%%1.1f - (%d/%d)\n%c%02d - %d-(%3.2f,%3.2f,%3.2f) - %2.0f\n",
          (ushort)(uVar2),);
          //sprintf(phi_s5, (void *)0x800D97E0, temp_s0_2, temp_s2->unk292 + 0x40, (?32) temp_s2->unk294, (?32) temp_s2->unk2AC, (f64) temp_s3->unk68, (f64) temp_s3->unk6C, (f64) temp_s3->unk70, (f64) (D_800D987C / temp_s0_3->unkC))
        }
        param_1 = (rspCom *)some_debug_print(pauVar3,gGlobals.text,0x12,0xcc,200,0x20,200,0xff);
      }
    }
  }
  return param_1;
}
*/
//mips_to_c version. has inaccuracies(doesn't seem to call a float for the Sprintf's.)
s32 display_debug_stats(s32 arg0) {
    f32 temp_f0;
    f32 temp_f20;
    f32 temp_f22;
    f32 temp_f2_3;
    f64 temp_f2;
    f64 temp_f2_2;
    s32 temp_s0;
    s32 temp_s0_2;
    s32 temp_s1;
    s32 temp_s1_2;
    s32 temp_s1_3;
    s32 temp_s1_4;
    s32 temp_v0;
    s32 temp_v0_2;
    u16 temp_a2;
    void *temp_s0_3;
    void *temp_s0_4;
    void *temp_s2;
    void *temp_s3;
    char *phi_s5;
    s32 phi_s1;
    f64 phi_f2;
    f64 phi_f2_2;
    s32 phi_v1;
    s32 phi_a0;
    void *phi_s0;
    s32 phi_s1_2;

    phi_s1_2 = arg0;
    if (debug_flag != 0) {
        phi_s1_2 = arg0;
        if (!(gGlobals.unkC < D_800D984C)) {
            phi_s5 = &gGlobals + 0x2078;
            phi_s1 = arg0;
            if ((u32) (gGlobals.unk2034 - 1) < 3U) {
                phi_s5 = &gGlobals + 0x2078;
                phi_s1 = DisplaySystemMonitor(arg0);
            }
            sprintf(phi_s5, &D_800D97D0, (s16) (s32) (D_800D9850 / (f64) gGlobals.unkC));
            temp_s1 = some_debug_print(phi_s1, phi_s5, 0x120, 0xD7, 0x80, 0x80, 0x80, 0xFF);
            phi_s1_2 = temp_s1;
            if (gGlobals.unk2034 != 0) {
                temp_s0 = get_hres();
                temp_s1_2 = rsp_func(temp_s1, 6, temp_s0, get_vres());
                phi_s1_2 = temp_s1_2;
                if ((gGlobals.unk2034 & 1) != 0) {
                    temp_s3 = gGlobals.unkA8;
                    temp_s0_2 = get_obj_free() & 0xFFFF;
                    temp_v0 = get_MemFree();
                    temp_f2 = (f64) temp_v0;
                    phi_f2 = temp_f2;
                    if (temp_v0 < 0) {
                        phi_f2 = temp_f2 + D_800D9858;
                    }
                    temp_f20 = (f32) phi_f2;
                    temp_v0_2 = get_memFree_2();
                    temp_f2_2 = (f64) temp_v0_2;
                    phi_f2_2 = temp_f2_2;
                    if (temp_v0_2 < 0) {
                        phi_f2_2 = temp_f2_2 + D_800D9860;
                    }
                    temp_f22 = (f32) phi_f2_2;
                    temp_s1_3 = gsFadeInOut(temp_s1_2, 0x12, 0xC4, 0x114, 0xDE, 0, 0, 0, 0x80);
                    temp_s2 = &gGlobals + 0xE0;
                    if (temp_s3 != 0) {
                        temp_a2 = temp_s3->unk100;
                        sprintf(phi_s5, (void *)0x800D97D4, temp_a2, *((temp_a2 * 4) + ground_labels));
                        temp_s1_4 = some_debug_print(temp_s1_3, phi_s5, 0x12, 0xC4, 0, 0xC8, 0xC8, 0xFF);
                        if (!(D_800D9870 <= (temp_f20 * D_800D986C))) {

                        }
                        if (!(D_800D9878 <= (temp_f22 * D_800D9874))) {

                        }
                        temp_s0_3 = &gGlobals + 0x68A8;
                        sprintf(phi_s5, (void *)0x800D97E0, temp_s0_2, temp_s2->unk292 + 0x40, (?32) temp_s2->unk294, (?32) temp_s2->unk2AC, (f64) temp_s3->unk68, (f64) temp_s3->unk6C, (f64) temp_s3->unk70, (f64) (D_800D987C / temp_s0_3->unkC));
                        phi_a0 = temp_s1_4;
                        phi_s0 = temp_s0_3;
                    } else {
                        if (!(D_800D9888 <= (temp_f20 * D_800D9884))) {

                        }
                        temp_f0 = temp_f22 * D_800D988C;
                        temp_f2_3 = D_800D9890;
                        if (!(temp_f2_3 <= temp_f0)) {
                            phi_v1 = (s32) temp_f0;
                        } else {
                            phi_v1 = (s32) (temp_f0 - temp_f2_3) | 0x80000000;
                        }
                        temp_s0_4 = &gGlobals + 0x68A8;
                        sprintf(phi_s5, (void *)0x800D9820, temp_s0_2, phi_v1, temp_s2->unk292 + 0x40, (?32) temp_s2->unk294, (f64) (D_800D9894 / temp_s0_4->unkC));
                        phi_a0 = temp_s1_3;
                        phi_s0 = temp_s0_4;
                    }
                    phi_s1_2 = some_debug_print(phi_a0, phi_s0 + 0x2078, 0x12, 0xCC, 0xC8, 0x20, 0xC8, 0xFF);
                }
            }
        }
    }
    return phi_s1_2;
}

void app_cpp_func(OSSched *param_1,uint pri,uint id){
  int *piVar1;
  uint uVar2;
  
  appManager.sched = param_1;
  piVar1 = (int *)Malloc(0x6048,s_./src/app.cpp_800d9898,0xe7);
  uVar2 = 0;
  appStack_mirror = piVar1;
  appManager.stack = piVar1;
  do {
    *piVar1 = 0x12345678;
    uVar2++;
    piVar1++;
  } while (uVar2 < 0x1811);
  osCreateThread(&appManager.Thread,id,AppProc,null,appManager.stack + 0x1812,pri);
  osStartThread(&appManager.Thread);
  return;
}

void AppProc(void){
  short sVar1;
  uint uVar2;
  short sVar3;
  longlong lVar4;
  undefined4 *puVar6;
  rspCom *pauVar7;
  OSMesg msg;
  short sVar9;
  ushort uVar10;
  ulonglong uVar5;
  int iVar8;
  short sVar11;
  u32 uVar12;
  u32 unaff_s1_lo;
  float fVar13;
  float fVar14;
  short *in_stack_ffffffc0;
  OSMesg *ppvVar15;
  
  appManager.Mesg = (OSMesg *)Malloc(0x20,s_./src/app.cpp_800d9898,0x117);
  osCreateMesgQueue(&appManager.MesgQ2,appManager.Mesg,8);
  appManager.MesgQ = osScGetCmdQ(appManager.ossched);
  appProc_init();
  osScAddClient(appManager.ossched,&appManager.client,&appManager.MesgQ2);
  ppvVar15 = (OSMesg *)&stack0xffffffc0;
  sVar3 = doubleGlobalTickerFlag;
  sVar11 = 0;
loop:
  do {
    doubleGlobalTickerFlag = sVar3;
    osRecvMesg(&appManager.MesgQ2,ppvVar15,1);
    if (*in_stack_ffffffc0 == 1) {
      if ((doubleGlobalTickerFlag == 0) || (sVar11 == 0)) {
        lVar4 = resolution_mirror_check();
        sVar3 = doubleGlobalTickerFlag;
        if (lVar4 != 0) {
          sprintf(gGlobals.text,s_StartGfxList()_800d98a8);
          puVar6 = gsStartGfxList();
          sprintf(gGlobals.text,s_HandleAppFrame()_800d98b8);
          uVar2 = gGlobals.ticker + 1;
          if (doubleGlobalTickerFlag == 1) {
            uVar2 = gGlobals.ticker + 2;
          }
          gGlobals.ticker = uVar2;
          pauVar7 = (rspCom *)appProc_caseSwitch(puVar6);
          pauVar7 = debug::display_debug_stats(pauVar7);
          NOOP_800a2448();
          pauVar7 = (rspCom *)ret_A0(pauVar7);
          iVar8 = gsDrawScreenRects(pauVar7);
          uVar12 = 0x3200;
          if (ExpPakFlag != 0) {
            uVar12 = 0x6400;
          }
          if (uVar12 << 3 < (uint)(iVar8 - (int)puVar6)) {
            sprintf(gGlobals.text,"GLIST OVERWRITE!!\nCurrent: %lu\nAllocated: %lu\nOverwrite: %lu",
                        (uint)(iVar8 - (int)puVar6) >> 3,uVar12,unaff_s1_lo);
            manualCrash("app.cpp::AppProc",gGlobals.text);
          }
          sVar3 = doubleGlobalTickerFlag + -1;
          if (doubleGlobalTickerFlag == 0) {
            msg = (OSMesg)func_swapping_framebuffer_(iVar8,&appManager.MesgQ2);
            osSendMesg(appManager.MesgQ,msg,1);
            sVar11 = sVar11 + 1;
            sVar3 = doubleGlobalTickerFlag;
          }
        }
        goto loop;
      }
      sVar1 = *in_stack_ffffffc0;
    }
    else {
      sVar1 = *in_stack_ffffffc0;
    }
    if (sVar1 != 4) {
      sVar9 = sVar11 + -1;
      sVar3 = doubleGlobalTickerFlag;
      if (sVar1 == 2) {
        FUN_800095f0(in_stack_ffffffc0);
        gGlobals.ticker = gGlobals.ticker + 1;
        sVar11 = sVar9;
        if (0.0 < lensflare_floats[0]) {
          sVar3 = doubleGlobalTickerFlag;
          if (320.0f <= lensflare_floats[0]) {
            gGlobals.appfunc_dat = 0;
            goto loop;
          }
          if (lensflare_floats[1] <= 0.0) {
            gGlobals.appfunc_dat = 0;
            goto loop;
          }
          if (240.0f <= lensflare_floats[1]) {
            gGlobals.appfunc_dat = 0;
            goto loop;
          }
          uVar10 = get_hres();
          fVar14 = lensflare_floats[0] *
                   (float)((uint)(((longlong)(short)uVar10 & 0xffffffffU) / 0x140) & 0xffff);
          uVar5 = get_vres();
          fVar13 = lensflare_floats[1] * (float)((uint)((uVar5 & 0xffffffff) / 0xf0) & 0xffff);
          iVar8 = get_depthBuffer();
          uVar10 = get_hres();
          if (INT_MAX_f <= fVar13) {
            fVar13 = fVar13 - INT_MAX_f;
          }
          if (INT_MAX_f <= fVar14) {
            fVar14 = fVar14 - INT_MAX_f;
          }
          if (*(short *)(iVar8 + (((int)fVar13 & 0xffffU) * (int)(short)uVar10 +
                                 ((int)fVar14 & 0xffffU)) * 2) == -4) {
            gGlobals.appfunc_dat = 1;
            sVar3 = doubleGlobalTickerFlag;
            goto loop;
          }
        }
        gGlobals.appfunc_dat = 0;
        sVar3 = doubleGlobalTickerFlag;
      }
      goto loop;
    }
    clear_audio_video();
    sVar3 = doubleGlobalTickerFlag;
  } while( true );
}

void appProc_init(void){
  byte *pbVar1;
  byte *pbVar2;
  astruct_12 *paVar3;
  fontface_struct *pfVar4;
  Borg8Enum BVar5;
  uint uVar6;
  
  SetGfxMode(0x140,0xf0,0x10);
  FUN_80020830();
  InitFreeQueueHead(&gGlobals.QueueA);
  memset_QueueStructB(&gGlobals.QueueB);
  setRNGSeed((uint *)&gGlobals,0x3dbb6cd);
  uVar6 = 0;
  gGlobals.appstate = 5;
  gGlobals.ticker = 0;
  gGlobals.delay = 0.0;
  if (font_face[0].font_face != 0) {
    pfVar4 = font_face;
    do {
      pfVar4++;
      uVar6++;
    } while (pfVar4->font_face != 0);
  }
  gGlobals.font = (FontStruct *)Malloc(0x20,s_./src/app.cpp_800d9898,0x1b4);
  Init_font(gGlobals.font,uVar6 & 0xff);
  if (0 < (int)uVar6) {
    pfVar4 = font_face;
    BVar5 = font_face[0].font_face;
    while( true ) {
      pbVar1 = &pfVar4->a;
      pbVar2 = &pfVar4->b;
      pfVar4++;
      uVar6--;
      load_font_face(gGlobals.font,BVar5,(uint)*pbVar1,(uint)*pbVar2);
      if (uVar6 == 0) break;
      BVar5 = pfVar4->font_face;
    }
  }
  font_func(gGlobals.font,(fontface_struct *)font_face[0].font_face);
  gGlobals.widgetHandler = (WidgetHandler *)Malloc(8,s_./src/app.cpp_800d9898,0x1bf);
  clear_widget_handler(gGlobals.widgetHandler,gGlobals.font);
  queue_struct_pointer = &gGlobals.QueueA;
  memorymaker_init();
  load_commonstrings();
  paVar3 = (astruct_12 *)passToMalloc(0x28);
  gGlobals.field_0x15c0 = init_some_Struct(paVar3,gGlobals.widgetHandler);
  HresMirror = get_hres();
  VresMirror = get_vres();
  gGlobals.appstateBool = 1;
  gGlobals.VolSFX = 1.0f;
  gGlobals.VolBGM = 0.65f;
  return;
}

undefined4 appProc_caseSwitch(undefined4 param_1){
  processQueueFree(&gGlobals.QueueA);
  Process_queue_B(&gGlobals.QueueB,0);
  if (gGlobals.appstateBool != 0) {
    switch(gGlobals.appstate) {
    case 0:
      gGlobals.appstate = appstate_0(register0x000000ec);
      break;
    case 1:
      gGlobals.appstate = game_ScreenFadeMode(register0x000000ec);
      break;
    case 2:
      gGlobals.appstate = ScreenFadeMode_17(register0x000000ec);
      break;
    case 3:
      gGlobals.appstate = func_checking_controller_and_pak(register0x000000ec);
      break;
    case 4:
      gGlobals.appstate = appstate_4((rspCom **)register0x000000ec);
      break;
    case 5:
      gGlobals.appstate = check_for_PAL_or_controller();
      break;
    default:
      manualCrash("app.cpp","gGlobals.appState is not valid");
    }
  }
  if (*appManager.stack != 0x12345678) {manualCrash("AppProc","Stack Overwrite!!");}
  return param_1;
}

void clear_audio_video(void){
  removeCloseSynth();
  osSpTaskYield();
  while(osAfterPreNMI()){}
  initGfx_2();
}


int check_for_PAL_or_controller(rspCom **param_1)

{
  ushort uVar4;
  int iVar2;
  ushort v;
  rspCom *pauVar3;
  longlong lVar1;
  float fVar5;
  float fVar6;
  
  if (osTvType == PAL) {
    if (PAL_warning_flag != '\0') {
      PAL_Warning_image = get_borg_8(0x37c3); //"wrong region" warning image
      PAL_warning_flag = '\0';
    }
    pauVar3 = *param_1;
    fVar5 = (float)get_hres() * 0.5f - (float)(PAL_Warning_image->dat).height * 0.5f;
    fVar6 = (float)get_vres() * 0.5f - (float)(PAL_Warning_image->dat).width * 0.5f;
    pauVar3 = (rspCom *)rsp_func(pauVar3,6,get_hres(),get_vres());
    pauVar3 = (rspCom *)
              pass_to_borg_image_draw
                        (pauVar3,PAL_Warning_image,fVar5,fVar6,1.0f,1.0f,
                         0xff,0xff,0xff,0xff);
    iVar2 = 5;
    *param_1 = pauVar3;
  }
  else {
    lVar1 = check_for_controller();
    iVar2 = 3;
    if (lVar1 == 0) {iVar2 = 4;}
  }
  return iVar2;
}