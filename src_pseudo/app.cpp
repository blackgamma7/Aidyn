#ifdef DEBUGVER
#define FILENAME "./src/app.cpp"
#else
#define FILENAME ""
#endif

u16 doubleGlobalTickerFlag;
#ifndef DEBUGVER
u16 version_flag;
#endif
Borg8header* PAL_Warning_image;
bool PAL_warning_flag=true;

struct App_manager{
OSSched* sched;
OSMesgQueue* MesgQ;
OSMesg* Mesg;
s32* stack;
OSThread thread;
OSMesgQueue MesgQ2;
OSScClient client;}
struct App_manager appManager;

//this first func is debug-vesion exculsive, and not easy to sus out.
Gfx* display_debug_stats(Gfx*param_1){
  playerData *ppVar1;
  u16 uVar4;
  u16 v;
  u32 uVar2;
  Gfx*pauVar3;
  s32 extraout_a3_lo;
  float extraout_f12;
  float memfree1;
  float memfree2;
  
  if ((debug_flag) && (1.0f <= gGlobals.delay)) {
    if (gGlobals.DebugStatDisplay - 1 < 3) {param_1 = (Gfx*)DisplaySystemMonitor(param_1);}
    sprintf(gGlobals.text,"%2d",(s16)(60.0f / gGlobals.delay));
    param_1 = (Gfx*)gfx::DrawText(param_1,gGlobals.text,0x120,0xd7,0x80,0x80,0x80,0xff);
    if (gGlobals.DebugStatDisplay) {
      RSPFUNC(param_1,6);
      ppVar1 = gGlobals.playerCharStruct.playerDat;
      if (gGlobals.DebugStatDisplay & 1) {
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
        if (ppVar1 == NULL {
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
          pauVar3 = (Gfx*)gfx::DrawText(pauVar3,gGlobals.text,0x12,0xc4,0,200,200,0xff);
          if (!(INT_MAX_f <= (memfree1 * 9.765625E-4f))) {}
          if (!(INT_MAX_f <= (memfree2 * 9.765625E-4f))) {}
          sprintf(gGlobals.text,"%d - %%%1.1f - (%d/%d)\n%c%02d - %d-(%3.2f,%3.2f,%3.2f) - %2.0f\n",
          (u16)(uVar2),);
          //sprintf(phi_s5, (void *)0x800D97E0, temp_s0_2, temp_s2->unk292 + 0x40, (?32) temp_s2->unk294, (?32) temp_s2->unk2AC, (f64) temp_s3->unk68, (f64) temp_s3->unk6C, (f64) temp_s3->unk70, (f64) (D_800D987C / temp_s0_3->unkC))
        }
        param_1 = (Gfx*)gfx::DrawText(pauVar3,gGlobals.text,0x12,0xcc,200,0x20,200,0xff);
      }
    }
  }
  return param_1;
}

//mips_to_c version. has inaccuracies(doesn't seem to call a float for the Sprintf's.)
/*s32 display_debug_stats(s32 arg0) {
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
            temp_s1 = gfx::DrawText(phi_s1, phi_s5, 0x120, 0xD7, 0x80, 0x80, 0x80, 0xFF);
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
                        temp_s1_4 = gfx::DrawText(temp_s1_3, phi_s5, 0x12, 0xC4, 0, 0xC8, 0xC8, 0xFF);
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
                    phi_s1_2 = gfx::DrawText(phi_a0, phi_s0 + 0x2078, 0x12, 0xCC, 0xC8, 0x20, 0xC8, 0xFF);
                }
            }
        }
    }
    return phi_s1_2;
}*/

void appInit(OSSched *sched,u8 pri,u8 id){
  s32 *stack;
  u32 i;
  
  appManager.sched = sched;
  stack = (s32 *)heapAlloc(0x6048,FILENAME,0xe7);
  appStack_mirror = stack;
  appManager.stack = stack;
  for(i = 0;i < 0x1811;i++;) *stack++ = 0x12345678;
  osCreateThread(&appManager.Thread,id,AppProc,NULL,appManager.stack + 0x1812,pri);
  osStartThread(&appManager.Thread);
  return;
}


void AppProc(void *x)

{
  short sVar1;
  longlong lVar2;
  Gfx *gfx0;
  Gfx *gfx1;
  int dat_size;
  short sVar7;
  ushort uVar8;
  short sVar9;
  uint uVar10;
  u32 gListSizeMax;
  short *psStack_40;
  short **ppsStack_3c;
  
  appManager.Mesg = (OSMesg *)heapAlloc(0x20,s_./src/app.cpp_800d9898,0x117);
  osCreateMesgQueue(&appManager.MesgQ2,appManager.Mesg,8);
  appManager.MesgQ = osScGetCmdQ(appManager.sched);
  appProc_init();
  osScAddClient(appManager.sched,&appManager.client,&appManager.MesgQ2);
  ppsStack_3c = &psStack_40;
  uVar8 = doubleGlobalTickerFlag;
  sVar9 = 0;
loop:
  do {
    doubleGlobalTickerFlag = uVar8;
    osRecvMesg(&appManager.MesgQ2,ppsStack_3c,1);
    if (*psStack_40 == 1) {
      if ((doubleGlobalTickerFlag == 0) || (sVar9 == 0)) {
        if (resolution_mirror_check()) {
          sprintf(gGlobals.text,"StartGfxList()");
          gfx0 = gfx::gsStartGfxList();
          sprintf(gGlobals.text,"HandleAppFrame()");
          uVar10 = gGlobals.ticker + 1;
          if (doubleGlobalTickerFlag == 1) {
            uVar10 = gGlobals.ticker + 2;
          }
          gGlobals.ticker = uVar10;
          gfx1 = appProc_caseSwitch(gfx0);
          gfx1 = display_debug_stats(gfx1);
          NOOP_800a2448();
          gfx1 = ret_A0(gfx1);
          gfx1 = gsDrawScreenRects(gfx1);
          gListSizeMax = 0x3200;
          if (ExpPakFlag) gListSizeMax = 0x6400;
          uVar10 = (uint)((int)gfx1 - (int)gfx0) /sizeof(Gfx);
          if (gListSizeMax*sizeof(Gfx) < (uint)(gfx1 - (int)gfx0)) {
            sprintf(gGlobals.text,"GLIST OVERWRITE!!\nCurrent: %lu\nAllocated: %lu\nOverwrite: %lu",uVar10,gListSizeMax,
                        uVar10 - gListSizeMax);
            Crash::ManualCrash("app.cpp::AppProc",gGlobals.text);
          }
          uVar8 = doubleGlobalTickerFlag - 1;
          if (doubleGlobalTickerFlag == 0) {
            osSendMesg(appManager.MesgQ,func_swapping_framebuffer_(dat_size,&appManager.MesgQ2),1);
            sVar9++;
            uVar8 = doubleGlobalTickerFlag;
          }
        }
        goto loop;
      }
      sVar1 = *psStack_40;
    }
    else {
      sVar1 = *psStack_40;
    }
    if (sVar1 != 4) {
      sVar7 = sVar9 + -1;
      uVar8 = doubleGlobalTickerFlag;
      if (sVar1 == 2) {
        FUN_800095f0(psStack_40);
        gGlobals.ticker++;
        sVar9 = sVar7;
        if (0.0 < lensflare_floats.x) {
          uVar8 = doubleGlobalTickerFlag;
          if (320.0f <= lensflare_floats.x) {
            gGlobals.appfunc_dat = 0;
            goto loop;
          }
          if (lensflare_floats.y <= 0.0) {
            gGlobals.appfunc_dat = 0;
            goto loop;
          }
          if (240.0f <= lensflare_floats.y) {
            gGlobals.appfunc_dat = 0;
            goto loop;
          }
          psVar6 = get_depthBuffer();
          if (psVar6[((u16)lensflare_floats.y * (gfx::get_vres() / 0xf0)) * gfx::get_hres() + lensflare_floats.x * (gfx::get_hres() / 0x140)] == -4) {
            gGlobals.appfunc_dat = 1;
            uVar8 = doubleGlobalTickerFlag;
            goto loop;
          }
        }
        gGlobals.appfunc_dat = 0;
        uVar8 = doubleGlobalTickerFlag;
      }
      goto loop;
    }
    clear_audio_video();
    uVar8 = doubleGlobalTickerFlag;
  } while(1);
}



void appProc_init(void){
  u8 *pbVar1;
  u8 *pbVar2;
  fontface_struct *pfVar4;
  Borg8Enum BVar5;
  s32 uVar6;
  
  gfx::SetGfxMode(320,240,16);
  func_80020830();
  InitFreeQueueHead(&gGlobals.QueueA);
  memset_QueueStructB(&gGlobals.QueueB);
  Random::SetSeed((u32 *)&gGlobals,0x3dbb6cd);
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
  gGlobals.font = (FontStruct *)heapAlloc(0x20,FILENAME,0x1b4);
  Init_font(gGlobals.font,uVar6 & 0xff);
  if (0 < uVar6) {
    pfVar4 = font_face;
    BVar5 = font_face[0].font_face;
    while( true ) {
      pbVar1 = &pfVar4->a;
      pbVar2 = &pfVar4->b;
      pfVar4++;
      uVar6--;
      load_font_face(gGlobals.font,BVar5,(u32)*pbVar1,(u32)*pbVar2);
      if (uVar6 == 0) break;
      BVar5 = pfVar4->font_face;
    }
  }
  font_func(gGlobals.font,(fontface_struct *)font_face[0].font_face);
  gGlobals.widgetHandler = heapAlloc(8,FILENAME,0x1bf);
  clear_widget_handler(gGlobals.widgetHandler,gGlobals.font);
  queue_struct_pointer = &gGlobals.QueueA;
  MemoryMaker::Init();
  CommonStrings::Init();
  gGlobals.unk0x15c0 = init_some_Struct(passToMalloc(0x28),gGlobals.widgetHandler);
  HresMirror = gfx::get_hres();
  VresMirror = gfx::get_vres();
  gGlobals.appstateBool = 1;
  gGlobals.VolSFX = 1.0f;
  gGlobals.VolBGM = 0.65f;
}

s32 appProc_caseSwitch(s32 param_1){
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
      gGlobals.appstate = appstate_4((Gfx**)register0x000000ec);
      break;
    case 5:
      gGlobals.appstate = check_for_PAL_or_controller();
      break;
    default:
      Crash::ManualCrash("app.cpp","gGlobals.appState is not valid");
    }
  }
  if (*appManager.stack != 0x12345678) Crash::ManualCrash("AppProc","Stack Overwrite!!");
  return param_1;
}

void clear_audio_video(void){
  removeCloseSynth();
  osSpTaskYield();
  while(osAfterPreNMI()){}
  initGfx_2();
  }


s32 check_for_PAL_or_controller(Gfx**param_1){
  u16 uVar4;
  s32 iVar2;
  u16 v;
  Gfx*pauVar3;
  longlong lVar1;
  float fVar5;
  float fVar6;
  
  if (osTvType == PAL) {
    if (PAL_warning_flag) {
      PAL_Warning_image = get_borg_8(0x37c3); //"wrong region" warning image
      PAL_warning_flag = 0;
    }
    pauVar3 = *param_1;
    fVar5 = (float)gfx::get_hres() * 0.5f - (float)(PAL_Warning_image->dat).height * 0.5f;
    fVar6 = (float)gfx::get_vres() * 0.5f - (float)(PAL_Warning_image->dat).width * 0.5f;
    RSPFUNC(pauVar3,6);
    pauVar3 = pass_to_borg_image_draw(pauVar3,PAL_Warning_image,fVar5,fVar6,1.0f,1.0f,
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