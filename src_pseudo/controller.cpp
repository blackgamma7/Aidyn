#define FILENAME "./src/controller.cpp"

#include "Controller.h"
#include "heapN64.h"

u8 pfs_charset[]=
 {0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,
  0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,
  '0','1','2','3','4','5','6','7','8','9',
  'A','B','C','D','E','F','G','H','I','J',
  'K','L','M','N','O','P','Q','R','S','T',
  'U','V','W','X','Y','Z','!','"','$','\'',
  '*','+',',','-','.','/',':','=','?','@'};

u32 button_mirror[MAXCONTROLLERS]={0};
u16 D_up_hold[MAXCONTROLLERS]={0};
u16 D_down_hold[MAXCONTROLLERS]={0};
u16 D_left_hold[MAXCONTROLLERS]={0};
u16 D_right_hold[MAXCONTROLLERS]={0};
u16 Up_hold[MAXCONTROLLERS]={0};
u16 down_hold[MAXCONTROLLERS]={0};
u16 left_hold[MAXCONTROLLERS]={0};
u16 right_hold[MAXCONTROLLERS]={0};
u16 c_up_hold[MAXCONTROLLERS]={0};
u16 C_down_hold[MAXCONTROLLERS]={0};
u16 c_left_hold[MAXCONTROLLERS]={0};
u16 c_right_hold[MAXCONTROLLERS]={0};
u16 Start_hold[MAXCONTROLLERS]={0};
u16 button_A_hold[MAXCONTROLLERS]={0};
u16 button_B_hold[MAXCONTROLLERS]={0};
u16 Z_hold[MAXCONTROLLERS]={0};
u16 L_hold[MAXCONTROLLERS]={0};
u16 R_hold[MAXCONTROLLERS]={0};
ContManageStruct gContManager={0};
#ifdef EUVER
u8 gContPalVar=false;
#endif

//init controller thread.
void Controller::Init(OSSched *sc,u8 ports,u8 pri,u8 id){
  gContManager.ossched = sc;
  gContManager.ports = ports;
  ALLOCS(gContManager.thread_stack,ContThreadStack,200);
  osCreateThread(&gContManager.Thread,(s32)id,proc,NULL,(void*)((u32)gContManager.thread_stack + ContThreadStack),pri);
  osStartThread(&gContManager.Thread);}

//controller proc
void Controller::proc(void* x){
  s16 *msg;
  
  #ifdef EUVER
  u8 gContPalVar=false;
  ALLOCS(gContManager.osmesgPointer,8*sizeof(OSMesg),0);
  osScAddClient(gContManager.ossched,&gContManager.client,&gContManager.mesgClient);
  #endif
  
  InitBuffer();
  while(1) {
    #ifndef EUVER
    do {
      osRecvMesg(&gContManager.mesgClient,(OSMesg*)&msg,1);
    } while (*msg != 1);
    #else
    while( true ) {
      while (osRecvMesg(&gContManager.mesgClient,(OSMesg*)&msg,1), __osShutdown != 0) {
        gContPalVar = true;
      }
      if (*msg != 4) break;
      gContPalVar = true;
    }
    if ((!gContPalVar) && (*msg == 1)) {
    #endif
    ReadInput();
    if (osTvType == OS_TV_PAL) {
      gContManager.Timer = (gContManager.Timer + 1) % 5;
      if (gContManager.Timer == 0) ReadInput();
    }
    else gContManager.Timer = (gContManager.Timer + 1) % 6;
  }
  #ifdef EUVER
}
#endif
}

//initalize controller events
void Controller::InitBuffer(void){
  ControllerFull *buffP;
  controllerBuffer *pcVar3;
  OSContStatus contStat [4];
  u8 auStack40 [4];
  #ifndef EUVER
  ALLOCS(gContManager.osmesgPointer,8*sizeof(OSMesg),258);
  #endif
  osCreateMesgQueue(&gContManager.mesgClient,gContManager.osmesgPointer,8);
  osCreateMesgQueue(&gContManager.SIMesgQ,&gContManager.mesg0,1);
  osSetEventMesg(OS_EVENT_SI,&gContManager.SIMesgQ,(OSMesg)1);
  osCreateMesgQueue(&gContManager.contMesgQ,&gContManager.mesg1,1);
  ALLOCS(gContManager.BufferPointer,gContManager.ports*sizeof(controllerBuffer),267);
  for(u8 i=0;i < gContManager.ports;i++) {
    ALLOCS(buffP,128*sizeof(ControllerFull),273);
    gContManager.BufferPointer[i].latest = 0;
    gContManager.BufferPointer[i].inputlog = buffP;
    gContManager.BufferPointer[i].hori = 0.1f;
    gContManager.BufferPointer[i].vert = 0.1f;
    gContManager.BufferPointer[i].next = 0x7f;
    gContManager.BufferPointer[i].ContGet = 0;
    gContManager.BufferPointer[i].ContRead = false;
  }
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  osContSetCh(gContManager.ports);
  osContInit(&gContManager.SIMesgQ,auStack40,contStat);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  #ifndef EUVER
  osScAddClient(gContManager.ossched,&gContManager.client,&gContManager.mesgClient);
  #endif
  gContManager.Timer = 0;
}
//reads the input of all controller ports.
//also saves several arrays for button hold times.
void Controller::ReadInput(void){
  s8 sVar1;
  s8 sVar2;
  u32 BVar3;

  s32 iVar7;
  u8 bVar8;
  ControllerFull *contEntry;
  u32 buttons;
  controllerBuffer *buffer;
  u8 port;
  float fVar10;
  float fVar11;
  float fVar12;
  OSContPad contPad [4];
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  osContStartReadData(&gContManager.SIMesgQ);
  osRecvMesg(&gContManager.SIMesgQ,NULL,1);
  osContGetReadData(contPad);
  if (gContManager.ports) {
    iVar7 = 0;
    for(port=0;port<gContManager.ports;port++){
      buffer = (controllerBuffer *)((s32)gContManager.BufferPointer + (iVar7 - port) * 8); //needs cleanup
      if (-1 < buffer->ContGet) {
        bVar8 = buffer->next + 1 & 0x7f;
        buffer->next = bVar8;
        contEntry = (ControllerFull *)(&(&buffer->inputlog->contAidyn)[(u32)bVar8 * 3].joy_x + bVar8); //this, too
        if (!(contPad[port].errno & CONT_NO_RESPONSE_ERROR)) {
          buttons = contPad[port].button;
          buffer->ContRead = true;
          fVar12 = (float)(s32)contPad[port].stick_x / 80.0;
          fVar11 = (float)(s32)contPad[port].stick_y / 80.0;
        }
        else {
          fVar11 = 0.0;
          buttons = 0;
          buffer->ContRead = false;
          fVar12 = 0.0;
        }
        if (fVar12 <= 1.0f) {
          if (fVar12 < -1.0f) (contEntry->contAidyn).joy_x = -1.0f;
          else {
            if (fVar12 <= buffer->hori) {
              if (fVar12 < -buffer->hori) (contEntry->contAidyn).joy_x = fVar12;
              else (contEntry->contAidyn).joy_x = 0.0;
            }
            else (contEntry->contAidyn).joy_x = fVar12;
          }
        }
        else (contEntry->contAidyn).joy_x = 1.0f;
        if (fVar11 <= 1.0) {
          if (fVar11 < -1.0f) (contEntry->contAidyn).joy_y = -1.0f;
          else {
            if (fVar11 <= buffer->vert) {
              if (fVar11 < -buffer->vert) {(contEntry->contAidyn).joy_y = fVar11;}
              else {(contEntry->contAidyn).joy_y = 0.0;}
            }
            else {(contEntry->contAidyn).joy_y = fVar11;}
          }
        }
        else (contEntry->contAidyn).joy_y = 1.0;
        if (0.7f <= fVar12) buttons |= ANA_RIGHT;
        else if (fVar12 <= -0.7f) buttons |= ANA_LEFT;
        if (0.7f <= fVar11) buttons |= ANA_UP;
        else if (fVar11 <= -0.7f) buttons |= ANA_DOWN; 

        BVar3 = button_mirror[port];
        (contEntry->contAidyn).input_2 = buttons;
        (contEntry->contAidyn).input = buttons & BVar3 ^ buttons;
        //tracks hold times of each button. results unused.
        if ((buttons & START_BUTTON) == 0) Start_hold[port] = 0;
        else Start_hold[port]++;
        contEntry->holdTime_Start = Start_hold[port];
        if ((buttons & A_BUTTON) == 0) button_A_hold[port] = 0;
        else button_A_hold[port]++;
        contEntry->holdTime_AButton = button_A_hold[port];
        if ((buttons & B_BUTTON) == 0) button_B_hold[port] = 0;
        else button_B_hold[port]++;
        contEntry->holdTime_BButton = button_B_hold[port];
        if ((buttons & C_UP) == 0) c_up_hold[port] = 0;
        else c_up_hold[port]++;
        contEntry->holdTime_CUp = c_up_hold[port];
        if ((buttons & C_DOWN) == 0) C_down_hold[port] = 0;
        else C_down_hold[port]++;
        contEntry->holdTime_DDown = C_down_hold[port];
        if ((buttons & C_LEFT) == 0) c_left_hold[port] = 0;
        else c_left_hold[port]++;
        contEntry->holdTime_CLeft = c_left_hold[port];
        if ((buttons & C_RIGHT) == 0) c_right_hold[port] = 0;
        else c_right_hold[port]++;
        contEntry->holdTime_CRight = c_right_hold[port];
        if ((buttons & D_UP) == 0) D_up_hold[port] = 0;
        else D_up_hold[port]++;
        contEntry->holdTime_DUp = D_up_hold[port];
        if ((buttons & D_DOWN) == 0) D_down_hold[port] = 0;
        else D_down_hold[port]++;
        contEntry->holdTime_DDown = D_down_hold[port];
        if ((buttons & D_LEFT) == 0) D_left_hold[port] = 0;
        else D_left_hold[port]++;
        contEntry->holdTime_DLeft = D_left_hold[port];
        if ((buttons & D_RIGHT) == 0) D_right_hold[port] = 0;
        else D_right_hold[port]++;
        contEntry->holdTime_Dright = D_right_hold[port];
        if ((buttons & ANA_UP) == 0) Up_hold[port] = 0;
        else Up_hold[port]++;
        contEntry->holdTime_AUp = Up_hold[port];
        if ((buttons & ANA_DOWN) == 0) down_hold[port] = 0;
        else down_hold[port]++;
        contEntry->holdTime_ADown = down_hold[port];
        if ((buttons & ANA_LEFT) == 0) left_hold[port] = 0;
        else left_hold[port]++;
        contEntry->holdTime_ALeft = left_hold[port];
        if ((buttons & ANA_RIGHT) == 0) right_hold[port] = 0;
        else right_hold[port]++;
        contEntry->holdTime_ARight = right_hold[port];
        if ((buttons & Z_BUTTON) == 0) Z_hold[port] = 0;
        else Z_hold[port]++;
        contEntry->holdTime_ZButton = Z_hold[port];
        if ((buttons & L_BUTTON) == 0) L_hold[port] = 0;
        else L_hold[port]++;
        contEntry->holdTime_LButton = L_hold[port];
        if ((buttons & R_BUTTON) == 0) R_hold[port] = 0;
        else R_hold[port]++;
        contEntry->holdTime_RButton = R_hold[port];

        buffer->ContGet++;
        button_mirror[port] = buttons;
      }
      iVar7 = port << 4;
    }
  }
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
}

u8 Controller::GetQuerey(u8 port){
  OSContStatus stats [4];
  
  osSendMesg(&gContManager.contMesgQ,NULL,OS_MESG_BLOCK);
  osContStartQuery(&gContManager.SIMesgQ);
  osRecvMesg(&gContManager.SIMesgQ,NULL,OS_MESG_BLOCK);
  osContGetQuery(stats);
  osRecvMesg(&gContManager.contMesgQ,NULL,OS_MESG_BLOCK);
  return (stats[port].errno & CONT_NO_RESPONSE_ERROR) == 0;
}


u8 Controller::CheckStatus(u8 port){
  OSContStatus stats [4];

  osSendMesg(&gContManager.contMesgQ,NULL,OS_MESG_BLOCK);
  osContStartQuery(&gContManager.SIMesgQ);
  osRecvMesg(&gContManager.SIMesgQ,NULL,OS_MESG_BLOCK);
  osContGetQuery(stats);
  u8 CErr = stats[port].errno;
  u16 CType = stats[port].type;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (CType & CONT_TYPE_MASK) == CONT_TYPE_NORMAL &&
         ((CErr & CONT_OVERRUN_ERROR) == 0 && (CErr & CONT_NO_RESPONSE_ERROR) == 0);
}
//checks if the input has been read. unused.
u8 Controller::GetContRead(u8 port){
  u8 bVar1;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  bVar1 = gContManager.BufferPointer[port].ContRead;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return bVar1;
}

//init Controller Pak and return status
u8 Controller::InitPak(u8 port){
  s32 PVar1;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osPfsInitPak(&gContManager.SIMesgQ,&gContManager.BufferPointer[port].pfs,port);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}

//init Rumble Pak and return status
u8 Controller::InitRumble(u8 port){
  s32 PVar1;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osMotorInit(&gContManager.SIMesgQ,&gContManager.BufferPointer[port].pfs,port);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return PVar1;
}

//init Transfer Pak and return status
u8 Controller::InitGBPak(u8 port){
  s32 PVar1;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osGbpakInit(&gContManager.SIMesgQ,&gContManager.BufferPointer[port].pfs,port);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}

//check for Controller, Rumble, and Transfer paks, then return status.
u8 Controller::GetPFSERR(u8 port){
  u8 PVar1 = InitPak(port);
  if (PVar1 == PFS_ERR_DEVICE) {
    PVar1 = InitRumble(port);
    if ((PVar1 == 0) || (PVar1 = InitGBPak(port), PVar1 == 0)) {
      InitPak(port);
      PVar1 = PFS_ERR_DEVICE;
    }
    else {
      InitPak(port);
      PVar1 = PFS_ERR_ID_FATAL;
    }
  }
  return PVar1;
}

//attampt to repair Controller Pak.
u8 Controller::RepairPak(u8 port){
  s32 PVar1;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osPfsRepairId(&gContManager.BufferPointer[port].pfs);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}

//get 16-bit value of free blocks. Unused.
u8 Controller::GetPakFreeBlocks16(u16 *b,u8 port){
  s32 PVar1;
  s32 bytesFree;
  
  osSendMesg(&gContManager.contMesgQ,NULL,OS_MESG_BLOCK);
  PVar1 = osPfsFreeBlocks(&gContManager.BufferPointer[port].pfs,&bytesFree);
  if (PVar1 == 0) *b = (u16)bytesFree;
  else *b = 0;
  osRecvMesg(&gContManager.contMesgQ,NULL,OS_MESG_BLOCK);
  return (u8)PVar1;
}

//get 8-bit value of free blocks. 
u8 Controller::GetPakFreeBlocks8(u8 *b,u8 port){
  s32 PVar1;
  s32 blocks;
  
  osSendMesg(&gContManager.contMesgQ,NULL,OS_MESG_BLOCK);
  PVar1 = osPfsFreeBlocks(&gContManager.BufferPointer[port].pfs,&blocks);
  if (PVar1 == 0) *b = blocks;
  else *b = 0;
  osRecvMesg(&gContManager.contMesgQ,NULL,OS_MESG_BLOCK);
  return (u8)PVar1;
}

u8 Controller::NewPakSave(u8 *fileno,char *filename,char *filecode,u16 compCode,u32 GameCode, u16 EXTName,u8 port){
  s32 PVar2;
  u8 name [16];
  u8 code [4];
  s32 filenum;
  
  osSendMesg(&gContManager.contMesgQ,NULL,OS_MESG_BLOCK);
  EncodeString(name,filename,16);
  EncodeString(code,filecode,4);
  PVar2 = osPfsAllocateFile(&gContManager.BufferPointer[port].pfs,compCode,GameCode,name,code,(u32)EXTName,&filenum);
  if (PVar2 == 0) *fileno = (u8)filenum;
  else *fileno = 0;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar2;
}

u8 Controller::GetPakSave(u8 *fileno,char* filename,char* filecode,u16 compCode, u32 GameCode,u8 port){
  s32 PVar2;
  u8 name [16];
  u8 code [4];
  s32 file_no;
  
  osSendMesg(&gContManager.contMesgQ,NULL,OS_MESG_BLOCK);
  Controller::EncodeString(name,filename,0x10);
  Controller::EncodeString(code,filecode,4);
  PVar2 = osPfsFindFile(&gContManager.BufferPointer[port].pfs,compCode,GameCode,name,code,&file_no);
  if (PVar2 == 0) *fileno = (u8)file_no;
  else *fileno = 0;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar2;
}


u8 Controller::GetPakSaveState(fileState_aidyn *FS,u8 file_no,u8 port){
  OSPfsState state;
  
  osSendMesg(&gContManager.contMesgQ,NULL,OS_MESG_BLOCK);
  s32 PVar1 = osPfsFileState(&gContManager.BufferPointer[port].pfs,file_no,&state);
  if (PVar1 == 0) {
    Controller::DecodeString(FS->game_name,(u8*)state.game_name,0x10);
    Controller::DecodeString(FS->ext_name,(u8*)state.ext_name,4);
    FS->ext_name[1] = 0;
    FS->comp_code = state.company_code;
    FS->game_code = state.game_code;
    FS->filesize = (u16)state.file_size;
  }
  else CLEAR(FS);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}

u8 Controller::WritePakSave(u8 *buff,u8 filenum,u16 offset,u16 size,u8 port){
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  s32 PVar1 = osPfsReadWriteFile(&gContManager.BufferPointer[port].pfs,filenum,PFS_WRITE,offset,size,buff);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}


u8 Controller::ReadPakSave(u8 *buff,s16 filenum,u16 offset,u16 size,u8 port){
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  s32 PVar1 = osPfsReadWriteFile(&gContManager.BufferPointer[port].pfs,filenum,PFS_READ,offset,size,buff);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}


u8 Controller::ErasePakSave(u8 fileno,u8 port){
  OSPfsState state;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  controllerBuffer *pcVar1 = &gContManager.BufferPointer[port];
  s32 PVar2 = osPfsFileState(&pcVar1->pfs,fileno,&state);
  if (PVar2 == 0)
    PVar2 = osPfsDeleteFile(&pcVar1->pfs,state.company_code,state.game_code,
                     (u8*)(state.game_name),(u8*)(state.ext_name));
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar2;
}

u32 Controller::GetPakPort(u8 port){
  s32 PVar1;
  u32 uVar2;
  u8 abStack24 [24];
  
  abStack24[0] = 0;
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osPfsIsPlug(&gContManager.SIMesgQ,abStack24);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  if (PVar1 == 0) uVar2 = (s32)(u32)abStack24[0] >> (port & 0x1f) & 1;
  else uVar2 = 0;
  return uVar2;
}

u8 Controller::GetStatus(u8 port,u8 *statOut){
  OSContStatus Cstats [4];
  u16 CType;
  u8 Cerr;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  osContStartQuery(&gContManager.SIMesgQ);
  osRecvMesg(&gContManager.SIMesgQ,NULL,1);
  osContGetQuery(Cstats);
  Cerr = Cstats[port].errno;
  CType = Cstats[port].type;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  if (statOut) *statOut = Cstats[port].status;
  return statOut &&((CType & CONT_TYPE_MASK) == CONT_TYPE_NORMAL &&
         ((Cerr & CONT_OVERRUN_ERROR) == 0 && (Cerr & CONT_NO_RESPONSE_ERROR) == 0));
}

u8 Controller::GetStatus2(u8 port){
  u32 uVar1;
  OSContStatus Cstatus [4];
  u16 CType;
  u8 Cerr;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  osContStartQuery(&gContManager.SIMesgQ);
  osRecvMesg(&gContManager.SIMesgQ,NULL,1);
  osContGetQuery(Cstatus);
  Cerr = Cstatus[port].errno;
  CType = Cstatus[port].type;
  uVar1 = gContManager.BufferPointer[port].pfs.status;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return ((CType & CONT_TYPE_MASK) == CONT_TYPE_NORMAL &&
         ((Cerr & CONT_OVERRUN_ERROR) == 0 && (Cerr & CONT_NO_RESPONSE_ERROR) == 0)) &&(uVar1 & 4);
}

//manually set joystick input for given port. unused.
s32 Controller::SetJoystick(float H,float V,u8 port){
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  gContManager.BufferPointer[port].hori = H;
  gContManager.BufferPointer[port].vert = V;
  return osRecvMesg(&gContManager.contMesgQ,NULL,1);
}

//get input of controller in given port.
//also used in for/while loops for measuring delta w/ dummy arg.
u8 Controller::GetInput(controller_aidyn** input,u8 port){
  controllerBuffer *buffer;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  buffer = &gContManager.BufferPointer[port];
  if (buffer->ContGet) {
    *input =&buffer->inputlog[buffer->latest].contAidyn;
    buffer->ContGet--;
    buffer->latest++;
    buffer->latest&=0x7f;
  }
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (buffer->ContGet);
}

//decrpyt string from PFS back to ASCII
void Controller::DecodeString(char *ascii,u8 *pfs,u8 len){
  if (len) {
    for(u32 i=0;i<len;i++) {
      char c = '*';
      if (pfs[i] < 0x42) c = pfs_charset[pfs[i]];
      ascii[i] = c;
    }
  }
  ascii[len] = 0;
}
//encrypt ASCII string to charset used in PFS.
void Controller::EncodeString(u8 *pfs,char *ascii,u8 len){
  char cVar1;
  u8 bVar2;
  u8 bVar3;
  u8 len_2;
  char *pcVar4;
  u8 uVar5;
  u32 i;
  u8 uVar6;
  
  len_2 = strlen(ascii);
  uVar5 = 0;
  i = 0;
  if (len != 0) {
    bVar2 = (len_2) != 0;
    do {
      bVar3 = false;
      if (bVar2) {
        uVar6 = 0;
        cVar1 = ascii[i];
        pcVar4 = (char*)pfs_charset;
        do {
          if (*pcVar4 == cVar1) {
            pfs[i] = (u8)uVar6;
            bVar3 = true;
          }
          else uVar6++;
          if (bVar3) goto LAB_8009c6c0;
          pcVar4 = (char*)pfs_charset + uVar6;
        } while (uVar6 < 0x42);
        pfs[i] = 0xf;
LAB_8009c6c0:
        uVar5++;
      }
      else {
        pfs[i] = 0;
      }
      i++;
      bVar2 = uVar5 < len_2;
    } while (i < len);
  }
  return;
}

//Count the attempts to Get controller input.
u16 Controller::GetDelay(u8 port){
  controller_aidyn* temp=NULL;  
  u16 x = 0;
  while (GetInput(&temp,port)) {x++;}
  return x;
}