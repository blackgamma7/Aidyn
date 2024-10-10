#define FILENAME "./src/controller.cpp"

#include "Controller.h"

u8 pfs_charset[66]= {0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!\"$\'*+,-./:=?"};
u32 button_mirror[MAXCONTROLLERS];
u16 D_up_hold[MAXCONTROLLERS];
u16 D_down_hold[MAXCONTROLLERS];
u16 D_left_hold[MAXCONTROLLERS];
u16 D_right_hold[MAXCONTROLLERS];
u16 Up_hold[MAXCONTROLLERS];
u16 down_hold[MAXCONTROLLERS];
u16 left_hold[MAXCONTROLLERS];
u16 right_hold[MAXCONTROLLERS];
u16 c_up_hold[MAXCONTROLLERS];
u16 C_down_hold[MAXCONTROLLERS];
u16 c_left_hold[MAXCONTROLLERS];
u16 c_right_hold[MAXCONTROLLERS];
u16 Start_hold[MAXCONTROLLERS];
u16 button_a_hold[MAXCONTROLLERS];
u16 button_b_hold[MAXCONTROLLERS];
u16 Z_hold[MAXCONTROLLERS];
u16 L_hold[MAXCONTROLLERS];
u16 R_hold[MAXCONTROLLERS];
ContManageStruct gContManager;

void Controller::Init(OSSched *sc,u8 ports,u8 pri,u8 id){
  gContManager.ossched = sc;
  gContManager.ports = ports;
  gContManager.thread_stack = heapAlloc(0x448,FILENAME,0xc8);
  osCreateThread(&gContManager.Thread,(s32)id,Controller::proc,NLL,
                     gContManager.thread_stack + 0x448,pri);
  osStartThread(&gContManager.Thread);}

void Controller::proc(void){
  OSMesg *msg;
  
  Controller::InitBuffer();
  while(1) {
    do {
      osRecvMesg(&gContManager.controller_queue_2,msg,1);
    } while (*msg != 1);
    Controller::ReadInput();
    if (osTvType == PAL) {
      gContManager.Timer = (gContManager.Timer + 1) % 5;
      if (gContManager.Timer == 0) Controller::ReadInput();
    }
    else gContManager.Timer = (gContManager.Timer + 1) % 6;
  }
}

void Controller::InitBuffer(void){
  controllerBuffer *pcVar1;
  Button_hold *pBVar2;
  controllerBuffer *pcVar3;
  u32 i;
  OSContStatus contStat [4];
  u8 auStack40 [4];
  
  gContManager.osmesgPointer = (OSMesg *)heapAlloc(0x20,FILENAME,258);
  osCreateMesgQueue(&gContManager.controller_queue_2,gContManager.osmesgPointer,8);
  osCreateMesgQueue(&gContManager.si_megQ,&gContManager.mesg0,1);
  osSetEventMesg(OS_EVENT_SI,&gContManager.si_megQ,(OSMesg)1);
  osCreateMesgQueue(&gContManager.contMesgQ,&gContManager.mesg1,1);
  gContManager.BufferPointer =heapAlloc(gContManager.ports*sizeof(controllerBuffer),FILENAME,0x10b);
  if (gContManager.ports) {
    for(i=0;i < gContManager.ports;i++) {
      pBVar2 = (Button_hold *)heapAlloc(128*sizeof(Button_hold),FILENAME,0x111);
      gContManager.BufferPointer[i].latest = 0;
      gContManager.BufferPointer[i].inputlog = pBVar2;
      gContManager.BufferPointer[i].hori = 0.1f;
      gContManager.BufferPointer[i].vert = 0.1f;
      gContManager.BufferPointer[i].next = 0x7f;
      gContManager.BufferPointer[i].ContGet = 0;
      gContManager.BufferPointer[i].ContRead = false;
    }
  }
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  osContSetCh(gContManager.ports);
  osContInit(&gContManager.si_megQ,auStack40,contstat);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  osScAddClient(gContManager.ossched,&gContManager.client,&gContManager.controller_queue_2);
  gContManager.Timer = 0;
}

void Controller::ReadInput(void){
  s8 sVar1;
  s8 sVar2;
  BUTTON_aidyn BVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  s32 iVar7;
  u8 bVar8;
  Button_hold *contEntry;
  BUTTON_aidyn buttons;
  controllerBuffer *buffer;
  u8 port;
  float fVar10;
  float fVar11;
  float fVar12;
  OSContPad contPad [4];
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  osContStartReadData(&gContManager.si_megQ);
  osRecvMesg(&gContManager.si_megQ,NULL,1);
  osContGetReadData(contPad);
  fVar6 = -0.7f;
  fVar5 = 0.7f;
  fVar4 = 80.0f;
  if (gContManager.ports) {
    iVar7 = 0;
    for(port=0;port<gContManager.ports;port++){
      buffer = (controllerBuffer *)((s32)gContManager.BufferPointer + (iVar7 - port) * 8); //needs cleanup
      if (-1 < buffer->ContGet) {
        bVar8 = buffer->next + 1 & 0x7f;
        buffer->next = bVar8;
        contEntry = (Button_hold *)(&(&buffer->inputlog->contAidyn)[(u32)bVar8 * 3].joy_x + bVar8); //this, too
        if ((contPad[port].errno & CONT_NO_RESPONSE_ERROR) == 0) {
          buttons = (BUTTON_aidyn)contPad[port].button;
          buffer->ContRead = true;
          fVar12 = (float)(s32)contPad[port].stick_x / fVar4;
          fVar11 = (float)(s32)contPad[port].stick_y / fVar4;
        }
        else {
          fVar11 = 0.0;
          buttons = 0;
          buffer->ContRead = false;
          fVar12 = 0.0;
        }
        fVar10 = 1.0f;
        if (fVar12 <= 1.0f) {
          if (fVar12 < -1.0f) {
            (contEntry->contAidyn).joy_x = -1.0f;
            fVar10 = 1.0f;
          }
          else {
            if (fVar12 <= buffer->hori) {
              if (fVar12 < -buffer->hori) {
                (contEntry->contAidyn).joy_x = fVar12;
                fVar10 = 1.0f;
              }
              else {
                (contEntry->contAidyn).joy_x = 0.0;
                fVar10 = 1.0f;
              }
            }
            else {
              (contEntry->contAidyn).joy_x = fVar12;
              fVar10 = 1.0f;
            }
          }
        }
        else {(contEntry->contAidyn).joy_x = 1.0f;}
        if (fVar11 <= fVar10) {
          if (fVar11 < -1.0f) {(contEntry->contAidyn).joy_y = -1.0f;}
          else {
            if (fVar11 <= buffer->vert) {
              if (fVar11 < -buffer->vert) {(contEntry->contAidyn).joy_y = fVar11;}
              else {(contEntry->contAidyn).joy_y = 0.0;}
            }
            else {(contEntry->contAidyn).joy_y = fVar11;}
          }
        }
        else {(contEntry->contAidyn).joy_y = fVar10;}
        if (fVar5 <= fVar12) {buttons |= ANA_RIGHT;}
        else if (fVar12 <= fVar6) {buttons |= ANA_LEFT;}
        if (fVar5 <= fVar11) {buttons |= ANA_UP;}
        else if (fVar11 <= fVar6) { buttons |= ANA_DOWN; }

        BVar3 = button_mirror[port];
        (contEntry->contAidyn).input_2 = buttons;
        (contEntry->contAidyn).input = buttons & BVar3 ^ buttons;
        if ((buttons & START_BUTTON) == 0) {Start_hold[port] = 0;}
        else {Start_hold[port]++;}
        contEntry->Start_Hold = Start_hold[port];
        if ((buttons & A_BUTTON) == 0) {button_A_hold[port] = 0;}
        else {button_A_hold[port]++;}
        contEntry->A_Hold = button_A_hold[port];
        if ((buttons & B_BUTTON) == 0) {button_b_hold[port] = 0;}
        else {button_b_hold[port]++;}
        contEntry->B_Hold = button_b_hold[port];
        if ((buttons & C_UP) == 0) {c_up_hold[port] = 0;}
        else {c_up_hold[port]++;}
        contEntry->CUp_hold = c_up_hold[port];
        if ((buttons & C_DOWN) == 0) {C_down_hold[port] = 0;}
        else {C_down_hold[port]++;}
        contEntry->CDown_hold = C_down_hold[port];
        if ((buttons & C_LEFT) == 0) {c_left_hold[port] = 0;}
        else {c_left_hold[port]++;}
        contEntry->CLeft_hold = c_left_hold[port];
        if ((buttons & C_RIGHT) == 0) {c_right_hold[port] = 0;}
        else {c_right_hold[port]++;}
        contEntry->CRight_Hold = c_right_hold[port];
        if ((buttons & D_UP) == 0) {D_up_hold[port] = 0;}
        else {D_up_hold[port]++;}
        contEntry->DUp_hold = D_up_hold[port];
        if ((buttons & D_DOWN) == 0) {D_down_hold[port] = 0;}
        else {D_down_hold[port]++;}
        contEntry->DDown_hold = D_down_hold[port];
        if ((buttons & D_LEFT) == 0) {D_left_hold[port] = 0;}
        else {D_left_hold[port]++;}
        contEntry->DLeft_Hold = D_left_hold[port];
        if ((buttons & D_RIGHT) == 0) {D_right_hold[port] = 0;}
        else {D_right_hold[port]++;}
        contEntry->DRight_hold = D_right_hold[port];
        if ((buttons & ANA_UP) == 0) {Up_hold[port] = 0;}
        else {Up_hold[port]++;}
        contEntry->Up_Hold = Up_hold[port];
        if ((buttons & ANA_DOWN) == 0) {down_hold[port] = 0;}
        else {down_hold[port]++;}
        contEntry->Down_Hold = down_hold[port];
        if ((buttons & ANA_LEFT) == 0) {left_hold[port] = 0;}
        else {left_hold[port]++;}
        contEntry->Left_hold = left_hold[port];
        if ((buttons & ANA_RIGHT) == 0) {right_hold[port] = 0;}
        else {right_hold[port]++;}
        contEntry->Right_Hold = right_hold[port];
        if ((buttons & Z_BUTTON) == 0) {Z_hold[port] = 0;}
        else {Z_hold[port]++;}
        contEntry->Z_Hold = Z_hold[port];
        if ((buttons & L_BUTTON) == 0) {L_hold[port] = 0;}
        else {L_hold[port]++;}
        contEntry->L_Hold = L_hold[port];
        if ((buttons & R_BUTTON) == 0) {R_hold[port] = 0;}
        else {R_hold[port]++;}
        contEntry->R_Hold = R_hold[port];
        buffer->ContGet++;
        button_mirror[port] = buttons;
      }
      iVar7 = port << 4;
    }
  }
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return;
}

bool Controller::GetQuerey(s32 port){
  OSContStatus stats [4];
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  osContStartQuery(&gContManager.si_megQ);
  osRecvMesg(&gContManager.si_megQ,NULL,1);
  osContGetQuery(stats);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (stats[port].errno & CONT_NO_RESPONSE_ERROR) == 0;
}


bool Controller::CheckStatus(s32 port){
  OSContStatus stats [4];
  CONT_ERROR CErr;
  CONT_TYPE CType;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  osContStartQuery(&gContManager.si_megQ);
  osRecvMesg(&gContManager.si_megQ,NULL,1);
  osContGetQuery(stats);
  CErr = stats[port].errno;
  CType = stats[port].type;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (CType & CONT_TYPE_MASK) == CONT_TYPE_NORMAL &&
         ((CErr & CONT_OVERRUN_ERROR) == 0 && (CErr & CONT_NO_RESPONSE_ERROR) == 0);
}

bool FUN_8009b8fc(s32 port){
  bool bVar1;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  bVar1 = gContManager.BufferPointer[port].ContRead;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return bVar1;
}

u8 Controller::InitPak(s32 port){
  s32 PVar1;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osPfsInitPak(&gContManager.si_megQ,&gContManager.BufferPointer[port].pfs,port);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}

u8 Controller::InitRumble(u8 port){
  u8 PVar1;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osMotorInit(&gContManager.si_megQ,&gContManager.BufferPointer[port].pfs,port);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return PVar1;
}


u8 Controller::InitGBPak(u32 port){
  s32 PVar1;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osGbpakInit(&gContManager.si_megQ,&gContManager.BufferPointer[port].pfs,port);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}

u8 Controller::GetPSFERR(u8 port){
  u8 PVar1;
    PVar1 = Controller::InitPak(port);
  if (PVar1 == ERR_DEVICE) {
    PVar1 = Controller::InitRumble(port);
    if ((PVar1 == 0) || (PVar1 = Controller::InitGBPak(port), PVar1 == 0)) {
      Controller::InitPak(port);
      PVar1 = ERR_DEVICE;
    }
    else {
      Controller::InitPak(port);
      PVar1 = ID_FATAL;
    }
  }
  return PVar1;
}

u8 Controller::RepairPak(u32 port){
  s32 PVar1;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osPfsRepairId(&gContManager.BufferPointer[port].pfs);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}


u8 Controller::GetPakFreeBlocks16(u16 *b,u32 port){
  s32 PVar1;
  s32 bytesFree;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osPfsFreeBlocks(&gContManager.BufferPointer[port].pfs,&bytesFree);
  if (PVar1 == 0) *b = bytesFree._2_2_;
  else *b = 0;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}

u8 Controller::GetPakFreeBlocks8(u8 *b,u32 port){
  s32 PVar1;
  s32 blocks;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osPfsFreeBlocks(&gContManager.BufferPointer[port].pfs,&blocks);
  if (PVar1 == 0) *b = blocks._2_1_;
  else *b = 0;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}

u8 Controller::NewPakSave(u8 *fileno,char *GameName,char *ExtName,s16 compCode,u32 GameCode, u16 EXTName,u8 port){
  s32 PVar2;
  u8 name [16];
  u8 code [4];
  s32 filenum;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  Controller::EncodeString(name,GameName,16);
  Controller::EncodeString(code,ExtName,4);
  PVar2 = osPfsAllocateFile(&gContManager.BufferPointer[port].pfs,compCode,GameCode,name,code,(u32)EXTName,&filenum);
  if (PVar2 == 0) *fileno = (u8)filenum;
  else *fileno = 0;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar2;
}


u8 Controller::GetPakSave(u8 *fileno,s32 filename,s32 filecode,u16 param_4, u32 param_5,u8 port){
  s32 PVar2;
  u8 name [16];
  u8 code [4];
  s32 file_no;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  Controller::EncodeString(name,filename,0x10);
  Controller::EncodeString(code,filecode,4);
  PVar2 = osPfsFindFile(&gContManager.BufferPointer[port].pfs,param_4,param_5,name,code,&file_no);
  if (PVar2 == 0) *fileno = (u8)file_no;
  else *fileno = 0;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar2;
}


u8 Controller::GetPakSaveState(fileState_aidyn *FS,u32 file_no,u32 port){
  s32 PVar1;
  OSPfsState state;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osPfsFileState(&gContManager.BufferPointer[port & 0xff].pfs,file_no & 0xff,&state);
  if (PVar1 == 0) {
    Controller::DecodeString(FS->game_name,state.game_name,0x10);
    Controller::DecodeString(FS->ext_name,state.ext_name,4);
    FS->ext_name[1] = 0;
    FS->comp_code = state.company_code;
    FS->game_code = state.game_code;
    FS->filesize = state.file_size._2_2_;
  }
  else memset(param_1,0,sizeof(fileState_aidyn));
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}

u8 Controller::WritePakSave(u8 *buff,u8 filenum,u16 offset,u16 size,u8 port){
  s32 PVar1;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osPfsReadWriteFile(&gContManager.BufferPointer[port].pfs,filenum,PFS_WRITE,offset,size,buff);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}


u8 Controller::ReadPakSave(u8 *buff,s16 filenum,u16 offset,u16 size,u8 port){
  s32 PVar1;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osPfsReadWriteFile(&gContManager.BufferPointer[port].pfs,filenum,PFS_READ,offs,size,buff);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar1;
}


u8 Controller::ErasePakSave(u32 fileno,u32 port){
  controllerBuffer *pcVar1;
  s32 PVar2;
  OSPfsState state;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  pcVar1 = gContManager.BufferPointer[port];
  PVar2 = osPfsFileState(&pcVar1->pfs,fileno & 0xff,&state);
  if (PVar2 == 0) PVar2 = osPfsDeleteFile(&pcVar1->pfs,state.company_code,state.game_code,state.game_name);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (u8)PVar2;
}

u32 Controller::GetPakPort(u32 port){
  s32 PVar1;
  u32 uVar2;
  u8 abStack24 [24];
  
  abStack24[0] = 0;
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  PVar1 = osPfsIsPlug(&gContManager.si_megQ,abStack24);
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  if (PVar1 == 0) uVar2 = (s32)(u32)abStack24[0] >> (port & 0x1f) & 1;
  else uVar2 = 0}
  return uVar2;
}

bool Controller::GetStatus(u8 port,CONT_STATUS *statOut){
  OSContStatus Cstats [4];
  CONT_TYPE CType;
  CONT_ERROR Cerr;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  osContStartQuery(&gContManager.si_megQ);
  osRecvMesg(&gContManager.si_megQ,NULL,1);
  osContGetQuery(Cstats);
  Cerr = Cstats[port].errno;
  CType = Cstats[port].type;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  if (statOut) *statOut = Cstats[port].status;
  return statOut &&((CType & CONT_TYPE_MASK) == CONT_TYPE_NORMAL &&
         ((Cerr & CONT_OVERRUN_ERROR) == 0 && (Cerr & CONT_NO_RESPONSE_ERROR) == 0));
}

bool Controller::GetStatus2(u32 port){
  u32 uVar1;
  OSContStatus Cstatus [4];
  CONT_TYPE CType;
  CONT_ERROR Cerr;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  osContStartQuery(&gContManager.si_megQ);
  osRecvMesg(&gContManager.si_megQ,NULL,1);
  osContGetQuery(Cstatus);
  Cerr = Cstatus[port].errno;
  CType = Cstatus[port].type;
  uVar1 = gContManager.BufferPointer[port].pfs.status;
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return ((CType & CONT_TYPE_MASK) == CONT_TYPE_NORMAL &&
         ((Cerr & CONT_OVERRUN_ERROR) == 0 && (Cerr & CONT_NO_RESPONSE_ERROR) == 0)) &&(uVar1 & 4);
}

s32 Controller::SetJoystick(float H,float V,u8 arg0,u8 arg1,u32 port){
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  gContManager.BufferPointer[port].hori = H;
  gContManager.BufferPointer[port].vert = V;
  return osRecvMesg(&gContManager.contMesgQ,NULL,1);
}

bool Controller::GetInput(Button_hold *param_1,u8 port){
  controllerBuffer *buffer;
  
  osSendMesg(&gContManager.contMesgQ,NULL,1);
  buffer = gContManager.BufferPointer[port];
  if (buffer->ContGet) {
    param_1 =(&buffer->inputlog[buffer->latest];
    buffer->ContGet--;
    buffer->latest++;
  }
  osRecvMesg(&gContManager.contMesgQ,NULL,1);
  return (bool)pcVar2->ContGet;
}

void Controller::DecodeString(char *ascii,u8 *pfs,u32 len){
  char c;

  if (len) {
    for(i=0;i<len;i++) {
      c = '*';
      if ((*pfs)[i] < 0x42) c = pfs_charset[(*pfs)[i]];
      ascii[i] = c;
    }
  }
  ascii[len] = 0;
}

void Controller::EncodeString(u8 *pfs,char *ascii,u32 len){
  char cVar1;
  bool bVar2;
  bool bVar3;
  u32 len_2;
  char *pcVar4;
  u32 uVar5;
  u32 i;
  u32 uVar6;
  
  len_2 = strlen(ascii);
  uVar5 = 0;
  i = 0;
  if ((len) != 0) {
    bVar2 = (len_2) != 0;
    do {
      bVar3 = false;
      if (bVar2) {
        uVar6 = 0;
        cVar1 = ascii[i];
        pcVar4 = pfs_charset;
        do {
          if (*pcVar4 == cVar1) {
            pfs[i] = (u8)uVar6;
            bVar3 = true;
          }
          else {
            uVar6++;
          }
          if (bVar3) goto inc_count;
          pcVar4 = pfs_charset[uVar6]];
        } while (uVar6 < 0x42);
        pfs[i] = 0xf;
inc_count:
        uVar5++;
      }
      else {
        pfs[i] = 0;
      }
      i++;
      bVar2 = uVar5 < (len_2);
    } while (i < (len));
  }
  return;
}

s16 Controller::GetDelay(u8 port){
  s16 sVar1;
  bool bVar2;
  s16 sVar3;
  Button_hold temp;  
  sVar1 = 0;
  do {
    sVar3 = sVar1;
    bVar2 = Controller::GetInput(temp,port);
    sVar1 = sVar3 + 1;
  } while (bVar2);
  return sVar3;
}




