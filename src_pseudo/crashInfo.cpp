#include "crash.h"
#include "memcheck.h"
#include "globals.h"

void Crash_SetFrame(CrashBuff *buff ,u16 col){
    for(u16 i=0;i<300;i++){
        for(u16 j=0;i<400;j++){
            *buff[i][j]=col;
        }
    }
}

u16 crash_strlen(char *txt){
  return (short)(strlen(txt) / 2) * -8 + 200;
}

struct crash_DatString {
    uint ANDMask;
    uint Value;
    char *String;
};

crash_DatString CauseStrings[]={
    {CAUSE_BD,CAUSE_BD,"BD"},{CAUSE_IP8,CAUSE_IP8,"IP8"},{CAUSE_IP7,CAUSE_IP7,"IP7"},
    {CAUSE_IP6,CAUSE_IP6,"IP6"},{CAUSE_IP5,CAUSE_IP5,"IP5"},{CAUSE_IP4,CAUSE_IP4,"IP4"},
    {CAUSE_IP3,CAUSE_IP3,"IP3"},{CAUSE_SW2,CAUSE_SW2,"IP2"},{CAUSE_SW1,CAUSE_SW1,"IP1"},
    {CAUSE_EXCMASK,EXC_INT,"Interrupt"},
    {CAUSE_EXCMASK,EXC_MOD,"TLB modification exception"},
    {CAUSE_EXCMASK,EXC_RMISS,"TLB load or instruction fetch"},
    {CAUSE_EXCMASK,EXC_WMISS,"TLB exception on store"},
    {CAUSE_EXCMASK,EXC_RADE,"Address load or instruction fetch"},
    {CAUSE_EXCMASK,EXC_WADE,"Address error on store"},
    {CAUSE_EXCMASK,EXC_IBE,"Bus error instruction fetch"},
    {CAUSE_EXCMASK,EXC_DBE,"Bus error data reference"},
    {CAUSE_EXCMASK,EXC_SYSCALL,"System call exception"},
    {CAUSE_EXCMASK,EXC_BREAK,"Breakpoint exception"},
    {CAUSE_EXCMASK,EXC_II,"Reserved instruction exception"},
    {CAUSE_EXCMASK,EXC_CPU,"Coprocessor unusable exception"},
    {CAUSE_EXCMASK,EXC_OV,"Arithmetic overflow exception"},
    {CAUSE_EXCMASK,EXC_TRAP,"Trap exception"},
    {CAUSE_EXCMASK,EXC_VCEI,"Virtual coherency intruction fetch"},
    {CAUSE_EXCMASK,EXC_FPE,"Floating point"},
    {CAUSE_EXCMASK,EXC_WATCH,"Watchpoint exception"},
    {CAUSE_EXCMASK,EXC_VCED,"Virtual coherency data reference"},
    {0,0,"Unknown"}
};

extern OSThread* __osGetCurrFaultedThread();//should already be defined?
void crash_text(CrashSub *param_1,CrashBuff *param_2){
  uint uVar1;
  u16 uVar3;
  crash_DatString *pcVar4;
  char charBuff [160];
  
  OSThread *t = __osGetCurrFaultedThread();
  Crash_SetFrame(param_2,0x843);
  sprintf(charBuff,"CRASH - 02.01d-PRERELEASE");
  crash_print(param_2,charBuff,crash_strlen(charBuff),0x14,0xff,0xff,0);
  if (!param_1->IsManualCrash) {
    crash_print(param_2,"Thread:",0x14,0x26,0xff,0xff,0);
    sprintf(charBuff,"%ld",t->id);
    crash_print(param_2,charBuff,0x1e,0x2f,0,0xff,0);
    crash_print(param_2,"Position:",0x14,0x41,0xff,0xff,0);
    sprintf(charBuff,"%08x",(t->context).pc);
    crash_print(param_2,charBuff,0x1e,0x4a,0,0xff,0);
    crash_print(param_2,"Return:",0x14,0x5c,0xff,0xff,0);
    sprintf(charBuff,"%08x",(int)(t->context).ra);
    crash_print(param_2,charBuff,0x1e,0x65,0,0xff,0);
    crash_print(param_2,"Cause:",0x14,0x77,0xff,0xff,0);
    pcVar4 = CauseStrings;
    while (pcVar4->ANDMask) {
        if (((t->context).cause & pcVar4->ANDMask) == pcVar4->Value)
          sprintf(charBuff,"%s",pcVar4->String);
        pcVar4++;
    }
    crash_print(param_2,charBuff,0x1e,0x80,0,0xff,0);
  }
  else {
    sprintf(charBuff,"Manual Crash");
    crash_print(param_2,charBuff,crash_strlen(charBuff),0x1d,0xff,0xff,0);
    #ifdef DEBUGVER
    crash_print(param_2,"Position:",0x14,0x2f,0xff,0xff,0);
    crash_print(param_2,param_1->position,0x1e,0x38,0,0xff,0);
    crash_print(param_2,"Cause:",0x14,0x5c,0xff,0xff,0);
    crash_print(param_2,param_1->Cause,0x1e,0x65,0,0xff,0);
    #endif
  }
  crash_print(param_2,"Last gGlobals.text:",0x14,0x92,0xff,0xff,0);
  crash_print(param_2,gGlobals.text,0x1e,0x9b,0,0xff,0);
  return;
}
#ifdef DEBUGVER
//y tho?
const u16 DAT_800d7ad4=0x100;
//print last 23 virtual addresses in stack?
void Ofunc_80006a4c(CrashBuff *param_1,OSThread *param_2){
  u32 uVar3;
  char acStack_68 [104];
  u16 y = 125;
  u16 i,j;
  u32* puVar4 = (u32*)&(param_2->context).sp;
  for(i=0,j=0;i<=999,j<=23;i++){
    if (((int)*puVar4 < 0) && (uVar3 = *puVar4 & 0xfffffff, uVar3 < 0xc4864)) {
      sprintf(acStack_68,"%08x",uVar3);
      if ((j & 1) == 0) crash_print(param_1,acStack_68,0xb8,y,0,0x90,0x70);
      else {
        crash_print(param_1,acStack_68,DAT_800d7ad4,y,0,0x70,0x90);
        y += 10;
      }
      j++;
    }
    puVar4 = (u32 *)((int)puVar4 + -4);
  }
}

int strlenX8(char *txt){return (strlen(txt) & 0x1fff) << 3;}

void crash_print_2(CrashBuff *buff,char *txt,u32 val,u16 param_4,u16 param_5){
  char txtBuff [96];
  
  sprintf(txtBuff,txt,val);
  s16 sVar1 = strlenX8(txtBuff);
  crash_print(buff,txtBuff,param_4,param_5,0xff,0xff,0);
  sprintf(txtBuff,"%lu",val);
  crash_print(buff,txtBuff,param_4 + sVar1 + 2,param_5,0,0xff,0);
}
//get color based on memory region.
//TODO: NOT HARDCODE REGIONS
void FUN_80006c6c(void *p,u8 *r,u8 *g,u8 *b){
  u8 uVar1;
  
  if ((p < rspbootTextStart) || ((void *)0x800d69b4 < p)) {
    if (((void *)0x800e59cf < p) &&
       (p < (void *)((int)&osViModeTable[0x2e].fldRegs[0].vStart + 2))) {
      *r = 0xc0;
      *g = 0;
      *b = 0xc0;
      return;
    }
    if ((p < &bss_tele_obj) || ((void *)(0x800fe9e8 + 0xfafU) < p)) {
      *r = 0;
      *g = 0xff;
      *b = 0;
      return;
    }
    uVar1 = 0x80;
    *r = 0x80;
  }
  else {
    uVar1 = 0xc0;
    *r = 0;
  }
  *g = uVar1;
  *b = uVar1;
  return;
}


void crash_text_2(CrashSub *param_1,CrashBuff *param_2){
  OSThread *pOVar3;
  u16 uVar5;
  byte bVar8;
  int iVar4;
  int *piVar9;
  uint uVar10;
  crash_DatString *pcVar11;
  ulonglong uVar12;
  uint uVar13;
  int iVar14;
  char acStack_128 [128];
  u32* fb32 [2];
  u16* fb16 [2];
  
  pOVar3 = __osGetCurrFaultedThread();
  Crash_SetFrame(param_2,0x843);
  sprintf(acStack_128,"CRASH - 02.01d-PRERELEASE");
  uVar5 = crash_strlen(acStack_128);
  crash_print(param_2,acStack_128,uVar5,0xf,0xff,0xff,0);
  iVar14 = 0;
  piVar9 = (int *)appStack_mirror;
  while (*piVar9 == 0x12345678) {
    piVar9++;
    iVar14++;
  }
  if (param_1->IsManualCrash == false) {
    crash_print(param_2,"Thread:",0x14,0x19,0xff,0xff,0);
    sprintf(acStack_128,"%ld",pOVar3->id);
    crash_print(param_2,acStack_128,0x1e,0x22,0,0xff,0);
    crash_print(param_2,"Position:",0x14,0x34,0xff,0xff,0);
    sprintf(acStack_128,"%08x",(pOVar3->context).pc);
    crash_print(param_2,acStack_128,0x1e,0x3d,0,0xff,0);
    crash_print(param_2,"Return:",0x14,0x4f,0xff,0xff,0);
    sprintf(acStack_128,"%08x",(int)(pOVar3->context).ra);
    crash_print(param_2,acStack_128,0x1e,0x58,0,0xff,0);
    crash_print(param_2,"Cause:",0x14,0x6a,0xff,0xff,0);
    pcVar11 = CauseStrings;
    while(pcVar11->ANDMask){
        if (((pOVar3->context).cause & pcVar11->ANDMask) == pcVar11->Value)
          sprintf(acStack_128,"%s",pcVar11->String);
        pcVar11++;
    }
    crash_print(param_2,acStack_128,0x1e,0x73,0,0xff,0);
    uVar5 = 0x8e;
    crash_print_2(param_2,"  Last Frame:",gGlobals.ticker,0x14,0x85);
    crash_print_2(param_2,"Unused Stack:",iVar14 << 2,0x14,0x8e);
  }
  else {
    crash_print(param_2,"Position:",0x14,0x19,0xff,0xff,0);
    crash_print(param_2,param_1->position,0x1e,0x22,0,0xff,0);
    crash_print(param_2,"Cause:",0x14,0x46,0xff,0xff,0);
    crash_print(param_2,param_1->Cause,0x1e,0x4f,0,0xff,0);
    uVar5 = 0x85;
    crash_print_2(param_2,"  Last Frame:",gGlobals.ticker,0x14,0x7c);
    crash_print_2(param_2,"Unused Stack:",iVar14 << 2,0x14,0x85);
  }
  crash_print(param_2,"Last gGlobals.text:",200,uVar5,0xff,0xff,0);
  crash_print(param_2,gGlobals.text,200,uVar5 + 9,0,0xff,0);
  if (gGlobals.ticker != 0) {
    u16 uVar6 = Graphics::get_hres();
    u16 uVar7 = Graphics::get_vres();
    u8 cDepth = Graphics::GetColorDepth();
    bVar8 = Graphics::GetBufferChoice();
    if (cDepth == 0x10) {
      fb16[0] = (u16*)Graphics::GetFrameBuffer(0);
      fb16[1] = (u16*)Graphics::GetFrameBuffer(1);
    }
    else {
      fb32[0] = (u32*)Graphics::GetFrameBuffer(0);
      fb32[1] = (u32*)Graphics::GetFrameBuffer(1);
    }
    u16 uVar12 = 0;
    if ((longlong)(short)uVar7 != 0) {
      do {
        u16 uVar10 = 0;
        uVar13 = (uint)uVar12;
        if ((int)(short)uVar6 != 0) {
          do {
            iVar4 = uVar13 * (int)(short)uVar6 + uVar10;
            if (cDepth == 0x10) {
              *(u16 *)((int)(*param_2)[(uVar13 >> 1) + 0x96] + uVar10 + 0x50) =
                   fb16[(char)bVar8][iVar4];
            }
            else {
              u32 px32 = fb32[(char)bVar8][iVar4];
              *(ushort *)((int)(*param_2)[(uVar13 >> 1) + 0x96] + uVar10 + 0x50) =
              GPACK_RGBA5551(px32>>24,px32>>16,px32>>8,px32);     
            }
            uVar10+=2;
          } while (uVar10 < (uint)(int)(short)uVar6);
        }
        uVar12 +=2;
      } while (uVar12 < uVar7);
    }
  }
  return;
}


void Ofunc_8000729c(CrashBuff *param_1,u16 x_,u16 y,void *p1,void *p2,void *p3,void *p4,void *p5,
                   void *p6,void *p7,void *p8)

{
  uint i;
  void *arr [8];
  char strBuff [64];
  u8 r;
  u8 g;
  u8 b;
  u8 a;
  uint x;
  
  x = (uint)x_;
  i = 0;
  arr[0] = p1;
  arr[1] = p2;
  arr[2] = p3;
  arr[3] = p4;
  arr[4] = p5;
  arr[5] = p6;
  arr[6] = p7;
  arr[7] = p8;
  do {
    FUN_80006c6c(arr[i],&r,&g,&b);
    sprintf(strBuff,"%08x",arr[i]);
    crash_print(param_1,strBuff,(u16)x,y + (short)i * 10,r,g,b);
    i++;
  } while (i < 8);
  return;
}


void stack_dump(CrashSub *param_1,CrashBuff *param_2){
  void *pvVar1;
  void *pvVar2;
  int iVar3;
  bool bVar4;
  OSThread *pOVar5;
  int *piVar6;
  int iVar7;
  u16 i;
  u16 j;
  char acStack_140 [256];
  u8 uStack_40;
  u8 uStack_3f;
  u8 auStack_3e [2];
  void *pvStack_3c;
  OSThread *pOStack_38;
  void **iStack_34;
  u8 *puStack_30;
  
  pOStack_38 = __osGetCurrFaultedThread();
  iStack_34 = *(void ***)((int)&(pOStack_38->context).sp + 4);
  Crash_SetFrame(param_2,0x843);
  crash_print(param_2,"TEXT",0x19,0x19,0,0xc0,0xc0);
  sprintf(acStack_140,"\nStrt:\nEnd:\nLen:");
  crash_print(param_2,acStack_140,0x19,0x19,0xff,0xff,0);
  pvStack_3c = (void *)0x800d69b4;
  sprintf(acStack_140,"\n%8x\n%8x\n%8x",rspbootTextStart,(void *)0x800d69b4,(void *)0xd6544);
  crash_print(param_2,acStack_140,0x43,0x19,0,0xc0,0xc0);
  crash_print(param_2,"DATA",0x89,0x19,0xc0,0,0xc0);
  sprintf(acStack_140,"\nStrt:\nEnd:\nLen:");
  crash_print(param_2,acStack_140,0x89,0x19,0xff,0xff,0);
  sprintf(acStack_140,"\n%8x\n%8x\n%8x",0x800e59d0,0x800f4cf1);
  crash_print(param_2,acStack_140,0xb3,0x19,0xc0,0,0xc0);
  crash_print(param_2,"BSS",0xf9,0x19,0x80,0x80,0x80);
  sprintf(acStack_140,"\nStrt:\nEnd:\nLen:");
  crash_print(param_2,acStack_140,0xf9,0x19,0xff,0xff,0);
  sprintf(acStack_140,"\n%8x\n%8x\n%8x",&bss_tele_obj,
              (void *)(0x800FF997),42999);
  crash_print(param_2,acStack_140,0x123,0x19,0x80,0x80,0x80);
  crash_print(param_2,"Potential Returns:",0x19,0x46,0xff,0xff,0);
  pOVar5 = pOStack_38;
  i = 0;
  j = 0;
  puStack_30 = &uStack_40;
  pvVar1 = *(void **)((int)&(pOStack_38->context).ra + 4);
  bVar4 = true;
  do {
    if ((((bVar4) && (pvVar2 = *(void **)((int)&(pOVar5->context) + j * 4), pvVar2 != pvVar1)
         ) && ((void *)0x8000046f < pvVar2)) && (pvVar2 <= pvStack_3c)) {
      sprintf(acStack_140,"%08x",(uint)pvVar2);
      crash_print(param_2,acStack_140,((ushort)i & 3) * 0x50 + 0x19,
                  (short)(i >> 2) * 9 + 0x4f,0,0xc0,0xc0);
      i++;
    }
    j++;
    bVar4 = i < 0xc;
  } while (j < 0x40);
  sprintf(acStack_140,"%08x",pvVar1);
  crash_print(param_2,acStack_140,((ushort)i & 3) * 0x50 + 0x19,(short)(i >> 2) * 9 + 0x4f,0
              ,0xc0,0xc0);
  i++;
  j = 0;
  do {
    if (((i < 0xc) && (pvVar1 = iStack_34[j], (void *)0x8000046f < pvVar1)) &&
       (pvVar1 <= pvStack_3c)) {
      sprintf(acStack_140,"%08x",(uint)pvVar1);
      crash_print(param_2,acStack_140,((ushort)i & 3) * 0x50 + 0x19,
                  (short)(i >> 2) * 9 + 0x4f,0,0xc0,0xc0);
      i++;
    }
    j++;
  } while (j < 0x800);
  iVar7 = 0;
  piVar6 = (int *)appStack_mirror;
  while (*piVar6 == 0x12345678) {
    piVar6++;
    iVar7++;
  }
  if (iVar7 << 2 == 0) sprintf(acStack_140,"Stack Dump:  STACK OVERWRITE!!");
  else sprintf(acStack_140,"Stack Dump:  (Unused: %d)",iVar7 << 2);
  crash_print(param_2,acStack_140,0x19,0x73,0xff,0xff,0);
  for(i=0;i<0x30;i++){
    pvVar1 = iStack_34[i];
    sprintf(acStack_140,"%08x",pvVar1);
    FUN_80006c6c(pvVar1,puStack_30,&uStack_3f,auStack_3e);
    crash_print(param_2,acStack_140,((ushort)i & 3) * 0x50 + 0x19,(short)(i >> 2) * 9 + 0x7c
                ,uStack_40,uStack_3f,auStack_3e[0]);
  }
}
u32 heapScroll=0;
u32 heapMax=0;
u32 heapPrinted=0;
#endif

extern CrashBuff crash_framebuffer;
void crash_handler(CrashSub *arg){
  bool bVar1;
  bool bVar2;
  u32 BVar3;
  s32 sVar4;
  int iVar5;
  OSViMode *src;
  u32 BVar7;
  OSViMode osViCustom;
  OSContStatus aOStack_f8 [16];
  OSMesgQueue aOStack_b8 [2];
  u8 auStack_78 [8];
  OSContPad aOStack_70 [10];
  OSMesg apvStack_30 [12];
  
  osSpTaskYield();
  do {} while (osAfterPreNMI());
  if (osTvType == OS_TV_MPAL) {
    src = osViModeTable + 0x1e;
  }
  else {
    if (osTvType != OS_TV_PAL) {
      memcpy(&osViCustom,osViModeTable + 2,0x50);
      goto LAB_80007a14;
    }
    src = osViModeTable + 0x10;
  }
  memcpy(&osViCustom,src,0x50);
LAB_80007a14:
  osViCustom.comRegs.width = 400;
  osViCustom.comRegs.xScale = 0x280;
  osViCustom.fldRegs[0].origin = 800;
  osViCustom.fldRegs[0].yScale = 0x50a;
  osCreateViManager(OS_PRIORITY_VIMGR);
  osViSetMode(&osViCustom);
  osViSetSpecialFeatures(OS_VI_DITHER_FILTER_ON|OS_VI_GAMMA_OFF);
  osCreateMesgQueue(aOStack_b8,apvStack_30,1);
  osSetEventMesg(OS_EVENT_SI,aOStack_b8,(OSMesg)0x1);
  osContSetCh(1);
  osContInit(aOStack_b8,auStack_78,aOStack_f8);
  crash_text_2(arg,&crash_framebuffer);
  osWritebackDCacheAll();
  osViSwapBuffer(crash_framebuffer);
  u8 uVar6 = 0;
  BVar7 = 0;
  while(1){
    #ifdef DEBUGVER
    do {
      osContStartReadData(aOStack_b8);
      do {} while (osRecvMesg(aOStack_b8,NULL,0));
      osContGetReadData(aOStack_70);
      BVar3 = aOStack_70[0].button;
    } while ((aOStack_70[0].errno & CONT_NO_RESPONSE_ERROR));
    if (((aOStack_70[0].button & BVar7 ^ aOStack_70[0].button) & A_BUTTON)) {
      uVar6 = (uVar6 + 1) % (3 - arg->IsManualCrash);
      switch(uVar6){
        case 0:
        crash_text_2(arg,&crash_framebuffer);
        osWritebackDCacheAll();
        osViSwapBuffer(crash_framebuffer);
        break;
        case 1:
        heap_walk(arg,&crash_framebuffer);
        osWritebackDCacheAll();
        osViSwapBuffer(crash_framebuffer);
        break;
        case 2:
        stack_dump(arg,&crash_framebuffer);
        osWritebackDCacheAll();
        osViSwapBuffer(crash_framebuffer);
      }
    }
    BVar7 = BVar3;
    if (uVar6 == 1) {
      bVar1 = (BVar3 & D_DOWN) != 0;
      if (bVar1) heapScroll++;
      bVar2 = (BVar3 & D_RIGHT) != 0;
      if (bVar2) heapScroll += 23;
      bVar2 = bVar2 || bVar1;
      if (((BVar3 & D_UP) != 0) && (heapScroll != 0)) {
        bVar2 = true;
        heapScroll--;
      }
      if (((BVar3 & D_LEFT) != 0) && (0x16 < heapScroll)) {
        bVar2 = true;
        heapScroll-= 23;
      }
      if (bVar2) {
        heap_walk(arg,&crash_framebuffer);
        osWritebackDCacheAll();
        osViSwapBuffer(crash_framebuffer);
      }
    }
  #endif  
  }
}
#ifdef DEBUGVER
void heap_error(CrashBuff* param_1,s32 param_2,s32 param_3,int param_4,int param_5,int param_6,int param_7,
               s32 param_8,int param_9)

{
  double dVar1;
  double dVar2;
  undefined8 uVar3;
  char acStack_90 [144];
  
  if ((heapMax < heapScroll) || (0x16 < heapMax - heapScroll)) goto LAB_80007e80;
  if ((param_6 == param_4) && (param_7 == param_5)) {
    if (param_7 == 0) {
      sprintf(acStack_90,"[%i]: %4i %3.1f%% %s",param_3,param_6,                                                           param_3,param_6,
                (double)(((float)param_6 / (float)param_9) * 100.0f),param_2);
      uVar3 = 0xff;
      goto LAB_80007dd4;
    }
    sprintf(acStack_90,"[%i]: %4i %3.1f%% %s",param_3,param_6,
                (double)(((float)param_6 / (float)param_9) * 100.0f),param_2);
    crash_print(param_1,acStack_90,0x14,(u16)heapPrinted,0xff,0xff,0);
  }
  else {
    sprintf(acStack_90,"[%i]: %4i %3.1f%% %s\n***** HEAP ERROR *****",param_3,param_4,
                (double)(((float)param_4 / (float)param_9) * 100.0f),param_2);
    uVar3 = 0xff00000000;
LAB_80007dd4:
    crash_print(param_1,acStack_90,0x14,(u16)heapPrinted,
                (u8)((ulonglong)uVar3 >> 0x20),(u8)uVar3,0);
  }
  heapPrinted += 10;
LAB_80007e80:
  heapMax++;
}


void heap_walk(CrashSub *param_1,CrashBuff *param_2){
  Crash_SetFrame(param_2,0x843);
  if (gMemCheckStruct.RamSize <= 0x400000) {
    crash_print(param_2,"!!! Need Expansion Pak for Heap Walk !!!",0x14,100,0xff,0,0);
  }
  else {
    crash_print(param_2,"HEAP WALK",0x14,0x14,0,0xff,0xff);
    crash_print(param_2,"================================",0x14,0x1e,0,0xff,0xff);
    heapMax = 0;
    heapPrinted = 0x28;
    print_mem_allocated(heap_error,param_2);
    crash_print(param_2,"================================",0x14,0x10e,0,0xff,0xff);
  }
}
#endif

void crash_print(CrashBuff *buff,char *txt,u16 x,u16 y,u8 r,u8 g,u8 b)

{
  char cVar1;
  byte bVar2;
  bool bVar3;
  char *pcVar4;
  int iVar5;
  uint uVar6;
  int iVar9;
  
  u16 startX = (uint)x;
  u16 currY = (uint)y;
  bVar3 = true;
  s32 charCount = 0;
  pcVar4 = txt;
  u16 currX = startX;
  do {
    cVar1 = *pcVar4;
    if (cVar1 == '\n') {
      currY+= 10;
      charCount += 1;
      currX = startX;
    }
    else if (cVar1 == '\0') bVar3 = false;
    else {
      if (0x171 < currX) {
        currY+= 10;
        currX = startX;
      }
      u8 bVar12 = 0;
      charCount += 1;
      iVar5 = (cVar1 + -' ') * 0x1000000 >> 0x15;
      iVar9 = currY * 400 + currX;
      do {
        u8 uVar6 = 0;
        bVar12++;
        bVar2 = gCrashFont[0][iVar5];
        while( true ) {
          if (((int)(uint)bVar2 >> (8 - uVar6 & 0x1f) & 1U) != 0) {
            (*buff)[0][iVar9 + uVar6] =GPACK_RGBA5551(r,g,b,1);
          }
          uVar6++;
          if (7 < uVar6) break;
          bVar2 = gCrashFont[0][iVar5];
        }
        iVar5++;
        iVar9+= 400;
      } while (bVar12 < 8);
      currX += 8;
    }
    pcVar4 = txt + charCount;
  } while (bVar3);
}

