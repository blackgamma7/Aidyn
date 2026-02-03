
#define FILENAME "./src/app.cpp"

#include "game.h"
#include "skyObjects.h"
#include "memaker.h"
#include "titlesplash.h"
#include "ContPakInit.h"

void * appStack_mirror=NULL;
u16 doubleGlobalTickerFlag=0;
#if !DEBUGVER
u16 version_flag=0;
#endif
Borg8Header* sRegionWarningImage=NULL;
u8 sRegionWarningFlag=true;

struct App_manager{
OSSched* sched;
OSMesgQueue* MesgQ;
OSMesg* Mesg;
s32* stack;
OSThread thread;
OSMesgQueue MesgQ2;
OSScClient client;};
App_manager appManager;


#if DEBUGVER
Gfx * display_debug_stats(Gfx *gfx){
  playerData *ppVar1;
  u32 uVar2;
  u32 uVar3;
  u32 uVar4;
  Gfx *gfx_00;
  u32 uVar5;
  u32 uVar9;
  u32 uVar10;
  double dVar11;
  float fVar12;
  u32 uVar13;
  float fVar14;
  float fVar15;
  if ((gDebugFlag) && (1.0f <= gGlobals.delta)) {
    if (gGlobals.DebugStatDisplay - 1 < 3) gfx = Graphics::DisplaySystemMonitor(gfx);
    //in debug ver, always print (estimated) frame rate in bottom-left corner
    Gsprintf("%2d",(s16)(60.0 / gGlobals.delta));
    gfx = Graphics::DrawText(gfx,gGlobals.text,(SCREEN_WIDTH-32),(SCREEN_HEIGHT-25),0x80,0x80,0x80,0xff);
    if (gGlobals.DebugStatDisplay) {
      RSPFUNC6(gfx);
      ppVar1 = gPlayer;
      if ((gGlobals.DebugStatDisplay & 1)) {
        uVar2 = get_obj_free();
        uVar3 = get_MemFree();
        fVar14 = (float)get_MemFree();
        uVar9 = 0x114;
        fVar15 = (float)get_memFree_2();
        gfx_00 = DrawRectangle(gfx,18,196,0x114,0xde,0,0,0,0x80);
        if (ppVar1 == NULL) {
          //print just memory usage, current map chunk and FPS if no Alaron
          fVar12 = fVar14 * (float)(1.0f/0x400);
          dVar11 = (double)((fVar15 / fVar14) * 100.0f);
          fVar15 *= (float)(1.0f/0x400);
          Gsprintf("%d - %%%1.1f - (%d/%d)\n%c%02d - %2.0ffps\n",(u16)uVar2,
                      uVar9,dVar11,(int)fVar12,(int)fVar15,
                      gGlobals.gameVars.mapShort1 + ('A'-1),gGlobals.gameVars.mapShort2,
                      (60.0f / gGlobals.delta));
        }
        else {
          //if he's active, show current ground type and position as well.
          Gsprintf("%2d - %s",ppVar1->Ground_type,ground_labels[ppVar1->Ground_type]);
          uVar5 = 0xc4;
          gfx_00 = Graphics::DrawText(gfx_00,gGlobals.text,0x12,0xc4,0,200,200,0xff);
          fVar12 = fVar14 * (float)(1.0f/0x400);
          dVar11 = (double)((fVar15 / fVar14) * 100.0f);
          fVar15 = fVar15 * (float)(1.0f/0x400);
          Gsprintf("%d - %%%1.1f - (%d/%d)\n%c%02d - %d-(%3.2f,%3.2f,%3.2f) - %2.0f\n",
                   (u16)uVar2,uVar5,dVar11,(int)fVar12,(int)fVar15,
                   gGlobals.gameVars.mapShort1 + ('A'-1),gGlobals.gameVars.mapShort2,gGlobals.gameVars.mapDatA,
                   ppVar1->collision.pos.x,ppVar1->collision.pos.y,ppVar1->collision.pos.z,
                  (60.0f / gGlobals.delta));
        }
        gfx = Graphics::DrawText(gfx_00,gGlobals.text,0x12,0xcc,200,0x20,200,0xff);
      }
    }
  }
  return gfx;
}
#endif

void appInit(OSSched *sched,u8 pri,u8 id){
  appManager.sched = sched;
  s32* stack = (s32 *)HALLOC(sizeof(s32)*APPSTACKSIZE,231);
  appStack_mirror = stack;
  appManager.stack = stack;
  for(u32 i = 0;i < APPSTACKSIZE-1;i++) stack[i] = APPSTACKMASK;
  osCreateThread(&appManager.thread,id,AppProc,NULL,appManager.stack + APPSTACKSIZE,pri);
  osStartThread(&appManager.thread);
}


void AppProc(void *x){
  s16 sVar1;
  Gfx *gfx0;
  Gfx *gfx1;
  int dat_size;
  s16 sVar7;
  u16 uVar8;
  s16 sVar9;
  u32 uVar10;
  u32 gListSizeMax;
  GtaskMsg *psStack_40;
  GtaskMsg **ppsStack_3c;
  
  ALLOCS(appManager.Mesg,sizeof(OSMesg)*OS_SC_MAX_MESGS,0x117);
  osCreateMesgQueue(&appManager.MesgQ2,appManager.Mesg,8);
  appManager.MesgQ = osScGetCmdQ(appManager.sched);
  appProc_init();
  osScAddClient(appManager.sched,&appManager.client,&appManager.MesgQ2);
  ppsStack_3c = &psStack_40;
  sVar9 = 0;
  while(1) {
    osRecvMesg(&appManager.MesgQ2,(OSMesg*)ppsStack_3c,1);
    switch(psStack_40->state){
      case OS_SC_RETRACE_MSG:{
        if ((doubleGlobalTickerFlag == 0) || (sVar9 == 0)) {
         if (Graphics::ResolutionCheck()) {
          Gsprintf("StartGfxList()");
          gfx0 = Graphics::StartGfxList();
          Gsprintf("HandleAppFrame()");
          gGlobals.ticker++;
          if (doubleGlobalTickerFlag == 1) gGlobals.ticker++;
          gfx1 = appProc_caseSwitch(gfx0);
          #if DEBUGVER //print detailed debug stats in Debug version
          gfx1 = display_debug_stats(gfx1);
          #else //print just player coords if Retail Version and !version cheat used
          if ((version_flag) && (gPlayer)) {
            Gsprintf("%c%02d-(%2.1f,%2.1f)\n",gGlobals.gameVars.mapShort1 + ('A'-1)
                    ,gGlobals.gameVars.mapShort2,gPlayer->collision.pos.x,
                    gPlayer->collision.pos.z);
            gfx1 = Graphics::DrawText(gfx1,gGlobals.text,18,(SCREEN_HEIGHT-28),0x20,0x20,200,0xff);
          }
          #endif
          void* x;
          NOOP_800a2448(x);
          gfx1 = ret_A0(gfx1);
          gfx1 = Graphics::EndList(gfx1);
          gListSizeMax = 0x3200;
          if (gExpPakFlag) gListSizeMax = 0x6400;
          uVar10 = (u32)((int)gfx1 - (int)gfx0) /sizeof(Gfx);
          if (gListSizeMax*sizeof(Gfx) < (u32)(gfx1 - (int)gfx0)) {
            Gsprintf("GLIST OVERWRITE!!\nCurrent: %lu\nAllocated: %lu\nOverwrite: %lu",uVar10,gListSizeMax,
                        uVar10 - gListSizeMax);
            CRASH("app.cpp::AppProc",gGlobals.text);
          }
          if (doubleGlobalTickerFlag)doubleGlobalTickerFlag--;
          else {
            osSendMesg(appManager.MesgQ,Graphics::CreateTask(gfx1,&appManager.MesgQ2),1);
            sVar9++;
          }
         }
        }
      break;
      }
      case OS_SC_DONE_MSG:{
        Graphics::getTaskTime(psStack_40);
        gGlobals.ticker++;
        sVar9--;
        if ((0.0 < gLensFlarePos.x)&&(gLensFlarePos.x<SCREEN_WIDTH)&&
           (0.0<gLensFlarePos.y)&&(gLensFlarePos.y<SCREEN_HEIGHT)){
          u16 lFlarex=gLensFlarePos.x * (Graphics::GetHRes() / SCREEN_WIDTH);
          u16 lFlarey=gLensFlarePos.y * (Graphics::GetVRes() / SCREEN_HEIGHT);
          u16* zBuff = Graphics::GetDepthBuffer(); //Lens flare origin is at furthest z value?
          if (zBuff[(lFlarey * Graphics::GetHRes() + lFlarex)] == 0xfffc) {
            gGlobals.lensFlareBool = true;
            break;
          }
        }
        gGlobals.lensFlareBool = false;
        break;
      }
      case OS_SC_PRE_NMI_MSG:{
        clear_audio_video();
        break;
      }
    }
  } 
}

void appProc_init(void){
  s32 i;
  Graphics::SetGfxMode(SCREEN_WIDTH,SCREEN_HEIGHT,16);
  Sky::Reset();
  InitFreeQueueHead(&gGlobals.QueueA);
  memset_QueueStructB(&gGlobals.QueueB);
  RAND.SetSeed(0x3dbb6cd);
  i = 0;
  gGlobals.appstate = 5;
  gGlobals.ticker = 0;
  gGlobals.delta = 0.0;
  while(font_face[i].borg8){i++;}
  ALLOC(gGlobals.font,436);
  Font::Init(gGlobals.font,i);
  if (0 < i) {
    for(;i!=0;i--){
      FontFace *f=&font_face[i];
      Font::LoadFace(gGlobals.font,f->borg8,f->rows,f->cols);
    }
  }
  NormalFont;
  ALLOC(WHANDLE,447);
  WHANDLE->Init(gGlobals.font);
  queue_struct_pointer = &gGlobals.QueueA;
  MemoryMaker::Init();
  CommonStrings::Init();
  gGlobals.diaClass = new DialougeClass(WHANDLE);
  HresMirror = Graphics::GetHRes();
  VresMirror = Graphics::GetVRes();
  gGlobals.appstateBool = true;
  gGlobals.VolSFX = 1.0f;
  gGlobals.VolBGM = 0.65f;
}

Gfx* appProc_caseSwitch(Gfx* gg){
  Gfx* g=gg;
  ProcessFreeQueue(&gGlobals.QueueA);
  Process_queue_B(&gGlobals.QueueB,0);
  if (gGlobals.appstateBool) {
    switch(gGlobals.appstate) {
    case 0:
      gGlobals.appstate = appState_0(&g); break;
    case 1:
      gGlobals.appstate = appState_1(&g); break;
    case 2:
      gGlobals.appstate = ContPak_GameState(&g); break;
    case 3:
      gGlobals.appstate = appState_ContPakCheck(&g); break;
    case 4:
      gGlobals.appstate = appState_4(&g); break;
    case 5:
      gGlobals.appstate = appState_RegionControllerCheck(&g); break;
    default:
      CRASH("app.cpp","gGlobals.appState is not valid");
    }
  }
  if (appManager.stack[0] != APPSTACKMASK) CRASH("AppProc","Stack Overwrite!!");
  return g;
}

void clear_audio_video(void){
  DCM::ClosePlayer();
  osSpTaskYield();
  while(osAfterPreNMI()){}
  Graphics::initGfx_2();
  }

int appState_RegionControllerCheck(Gfx **gg){
  int ret;
  #if EUVER
  if (osTvType != OS_TV_PAL) 
  #else
  if (osTvType == OS_TV_PAL) 
  #endif
  {
    if (sRegionWarningFlag) {
      sRegionWarningImage = loadBorg8(BORG8_ErrorRegion);
      sRegionWarningFlag = 0;
    }
    Gfx* g = *gg;
    RSPFUNC6(g);
    g = Borg8_DrawSimple(g,sRegionWarningImage, //center image in screen.
             (Graphics::GetHRes() * 0.5f) - ((sRegionWarningImage->dat).Width * 0.5f),
             (Graphics::GetVRes() * 0.5f) - ((sRegionWarningImage->dat).Height * 0.5f),
            1.0f,1.0f,COLOR_WHITE);
    ret = 5;
    *gg = g;
  }
  else {
    u8 bVar5 = check_for_controller();
    ret = 3;
    if (!bVar5) ret = 4;
  }
  return ret;
}

