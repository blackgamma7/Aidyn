
#define FILENAME "./src/app.cpp"

#include "globals.h"
#include "memaker.h"
#include "n64Borg.h"

u16 doubleGlobalTickerFlag;
#ifndef DEBUGVER
u16 version_flag;
#endif
Borg8header* PAL_Warning_image;
u8 PAL_warning_flag=true;

struct App_manager{
OSSched* sched;
OSMesgQueue* MesgQ;
OSMesg* Mesg;
s32* stack;
OSThread thread;
OSMesgQueue MesgQ2;
OSScClient client;};
App_manager appManager;

//this first func is debug-vesion exculsive, and not easy to sus out.

Gfx * display_debug_stats(Gfx *gfx){
  playerData *ppVar1;
  ushort h;
  ushort v;
  uint uVar2;
  u32 uVar3;
  uint uVar4;
  Gfx *gfx_00;
  u32 uVar5;
  u32 unaff_s0_lo;
  u32 unaff_s1_lo;
  u32 uVar9;
  double dVar6;
  double dVar7;
  double dVar8;
  u32 uVar10;
  double dVar11;
  float fVar12;
  u32 uVar13;
  float fVar14;
  float fVar15;
  if ((gDebugFlag) && (1.0f <= gGlobals.delta)) {
    if (gGlobals.DebugStatDisplay - 1 < 3) gfx = Graphics::DisplaySystemMonitor(gfx);
    Gsprintf("%2d",(s16)(60.0 / gGlobals.delta));
    gfx = Graphics::DrawText(gfx,gGlobals.text,0x120,0xd7,0x80,0x80,0x80,0xff);
    if (gGlobals.DebugStatDisplay) {
      RSPFUNC6(gfx);
      ppVar1 = gGlobals.playerCharStruct.playerDat;
      if ((gGlobals.DebugStatDisplay & 1)) {
        uVar2 = get_obj_free();
        uVar3 = get_MemFree();
        dVar11 = (double)uVar3;
        if ((int)uVar3 < 0) {
          dVar11 = dVar11 + UINT_MAX_d;
        }
        fVar14 = (float)dVar11;
        uVar4 = get_memFree_2();
        dVar11 = (double)uVar4;
        if ((int)uVar4 < 0) {
          dVar11 = dVar11 + UINT_MAX_d;
        }
        uVar9 = 0x114;
        fVar15 = (float)dVar11;
        gfx_00 = gsFadeInOut(gfx,18,196,0x114,0xde,0,0,0,0x80);
        if (ppVar1 == NULL) {
          fVar12 = fVar14 * (float)(1.0f/1024);
          dVar11 = (double)((fVar15 / fVar14) * 100.0f);
          fVar15 = fVar15 * (float)(1.0f/1024);
          Gsprintf("%d - %%%1.1f - (%d/%d)\n%c%02d - %2.0ffps\n",(u16)uVar2,
                      uVar9,dVar11,(int)fVar12,(int)fVar15,
                      gGlobals.Sub.mapShort1 + ('A'-1),gGlobals.Sub.mapShort2,
                      (60.0f / gGlobals.delta));
        }
        else {
          Gsprintf("%2d - %s",ppVar1->Ground_type,ground_labels[ppVar1->Ground_type]);
          uVar5 = 0xc4;
          gfx_00 = Graphics::DrawText(gfx_00,gGlobals.text,0x12,0xc4,0,200,200,0xff);
          fVar12 = fVar14 * (float)(1.0f/1024);
          dVar11 = (double)((fVar15 / fVar14) * 100.0f);
          fVar15 = fVar15 * (float)(1.0f/1024);
          Gsprintf("%d - %%%1.1f - (%d/%d)\n%c%02d - %d-(%3.2f,%3.2f,%3.2f) - %2.0f\n",
                   (u16)uVar2,uVar5,dVar11,(int)fVar12,(int)fVar15,
                   gGlobals.Sub.mapShort1 + ('A'-1),gGlobals.Sub.mapShort2,gGlobals.Sub.mapDatA,
                   ppVar1->collision.pos.x,ppVar1->collision.pos.y,ppVar1->collision.pos.z,
                  (60.0f / gGlobals.delta));
        }
        gfx = Graphics::DrawText(gfx_00,gGlobals.text,0x12,0xcc,200,0x20,200,0xff);
      }
    }
  }
  return gfx;
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
    if (gDebugFlag != 0) {
        phi_s1_2 = arg0;
        if (!(gGlobals.unkC < D_800D984C)) {
            phi_s5 = &gGlobals + 0x2078;
            phi_s1 = arg0;
            if ((u32) (gGlobals.unk2034 - 1) < 3U) {
                phi_s5 = &gGlobals + 0x2078;
                phi_s1 = DisplaySystemMonitor(arg0);
            }
            sprintf(phi_s5, &D_800D97D0, (s16) (s32) (D_800D9850 / (f64) gGlobals.unkC));
            temp_s1 = Graphics::DrawText(phi_s1, phi_s5, 0x120, 0xD7, 0x80, 0x80, 0x80, 0xFF);
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
                        temp_s1_4 = Graphics::DrawText(temp_s1_3, phi_s5, 0x12, 0xC4, 0, 0xC8, 0xC8, 0xFF);
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
                    phi_s1_2 = Graphics::DrawText(phi_a0, phi_s0 + 0x2078, 0x12, 0xCC, 0xC8, 0x20, 0xC8, 0xFF);
                }
            }
        }
    }
    return phi_s1_2;
}*/

#define APPSTACKSIZE 6162
void appInit(OSSched *sched,u8 pri,u8 id){
  appManager.sched = sched;
  s32* stack = (s32 *)HALLOC(sizeof(s32)*APPSTACKSIZE,231);
  appStack_mirror = stack;
  appManager.stack = stack;
  for(u32 i = 0;i < APPSTACKSIZE-1;i++) stack[i] = 0x12345678;
  osCreateThread(&appManager.thread,id,AppProc,NULL,appManager.stack + APPSTACKSIZE,pri);
  osStartThread(&appManager.thread);
}


void AppProc(void *x){
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
  
  ALLOCS(appManager.Mesg,sizeof(OSMesg)*8,0x117);
  osCreateMesgQueue(&appManager.MesgQ2,appManager.Mesg,8);
  appManager.MesgQ = osScGetCmdQ(appManager.sched);
  appProc_init();
  osScAddClient(appManager.sched,&appManager.client,&appManager.MesgQ2);
  ppsStack_3c = &psStack_40;
  uVar8 = doubleGlobalTickerFlag;
  sVar9 = 0;
loop:
  while(1) {
    doubleGlobalTickerFlag = uVar8;
    osRecvMesg(&appManager.MesgQ2,(OSMesg*)ppsStack_3c,1);
    if (*psStack_40 == 1) {
      if ((doubleGlobalTickerFlag == 0) || (sVar9 == 0)) {
        if (resolution_mirror_check()) {
          Gsprintf("StartGfxList()");
          gfx0 = Graphics::gsStartGfxList();
          Gsprintf("HandleAppFrame()");
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
          if (gExpPakFlag) gListSizeMax = 0x6400;
          uVar10 = (uint)((int)gfx1 - (int)gfx0) /sizeof(Gfx);
          if (gListSizeMax*sizeof(Gfx) < (uint)(gfx1 - (int)gfx0)) {
            Gsprintf("GLIST OVERWRITE!!\nCurrent: %lu\nAllocated: %lu\nOverwrite: %lu",uVar10,gListSizeMax,
                        uVar10 - gListSizeMax);
            CRASH("app.cpp::AppProc",gGlobals.text);
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
          if (psVar6[((u16)lensflare_floats.y * (Graphics::get_vres() / 240)) * Graphics::get_hres() + lensflare_floats.x * (Graphics::get_hres() / 0x140)] == -4) {
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
  } 
}



void appProc_init(void){
  u8 *pbVar1;
  u8 *pbVar2;
  fontface_struct *pfVar4;
  Borg8Enum BVar5;
  s32 uVar6;
  
  Graphics::SetGfxMode(320,240,16);
  Sky::Reset();
  InitFreeQueueHead(&gGlobals.QueueA);
  memset_QueueStructB(&gGlobals.QueueB);
  RAND.SetSeed(0x3dbb6cd);
  uVar6 = 0;
  gGlobals.appstate = 5;
  gGlobals.ticker = 0;
  gGlobals.delta = 0.0;
  if (font_face[0].font_face != 0) {
    pfVar4 = font_face;
    do {
      pfVar4++;
      uVar6++;
    } while (pfVar4->font_face != 0);
  }
  ALLOC(gGlobals.font,436);
  Init_font(gGlobals.font,uVar6);
  if (0 < uVar6) {
    pfVar4 = font_face;
    BVar5 = font_face[0].font_face;
    while( true ) {
      pbVar1 = &pfVar4->a;
      pbVar2 = &pfVar4->b;
      pfVar4++;
      uVar6--;
      load_font_face(gGlobals.font,BVar5,*pbVar1,*pbVar2);
      if (uVar6 == 0) break;
      BVar5 = pfVar4->font_face;
    }
  }
  font_func(gGlobals.font,font_face[0].font_face);
  ALLOC(WHANDLE,447);
  WHANDLE->Init(gGlobals.font);
  queue_struct_pointer = &gGlobals.QueueA;
  MemoryMaker::Init();
  CommonStrings::Init();
  gGlobals.dialougStruct = Init_DialogStruct(new(0x28),WHANDLE);
  HresMirror = Graphics::get_hres();
  VresMirror = Graphics::get_vres();
  gGlobals.appstateBool = 1;
  gGlobals.VolSFX = 1.0f;
  gGlobals.VolBGM = 0.65f;
}

Gfx* appProc_caseSwitch(Gfx** gg){
  Gfx* g=*gg;
  processQueueFree(&gGlobals.QueueA);
  Process_queue_B(&gGlobals.QueueB,0);
  if (gGlobals.appstateBool) {
    switch(gGlobals.appstate) {
    case 0:
      gGlobals.appstate = appstate_0(&g); break;
    case 1:
      gGlobals.appstate = appstate_1(&g); break;
    case 2:
      gGlobals.appstate = appstate_2(&g); break;
    case 3:
      gGlobals.appstate = appState_ContPakCheck(&g); break;
    case 4:
      gGlobals.appstate = appstate_4(&g); break;
    case 5:
      gGlobals.appstate = appState_RegionControllerCheck(&g); break;
    default:
      CRASH("app.cpp","gGlobals.appState is not valid");
    }
  }
  if (appManager.stack[0] != 0x12345678) CRASH("AppProc","Stack Overwrite!!");
  return g;
}

void clear_audio_video(void){
  DCM::ClosePlayer();
  osSpTaskYield();
  while(osAfterPreNMI()){}
  Graphics::initGfx_2();
  }

int appState_RegionControllerCheck(Gfx **gg){
  int iVar6;
  
  if (osTvType == OS_TV_PAL) {
    if (PAL_warning_flag) {
      PAL_Warning_image = loadBorg8(Borg8_PAL_Warning);
      PAL_warning_flag = 0;
    }
    Gfx* g = *gg;
    RSPFUNC6(g);
    g = Borg8_DrawSimple(g,PAL_Warning_image, //center image in screen.
             (Graphics::get_hres() * 0.5f) - ((PAL_Warning_image->dat).Width * 0.5f),
             (Graphics::get_vres() * 0.5f) - ((PAL_Warning_image->dat).Height * 0.5f),
            1.0f,1.0f,0xff,0xff,0xff,0xff);
    iVar6 = 5;
    *gg = g;
  }
  else {
    u8 bVar5 = check_for_controller();
    iVar6 = 3;
    if (!bVar5) iVar6 = 4;
  }
  return iVar6;
}

