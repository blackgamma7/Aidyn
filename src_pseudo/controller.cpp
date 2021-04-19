#ifdef DEBUGVER
#define FILENAME "./src/controller.cpp"
#else
#define FILENAME ""
#endif
u8 pfs_charset[66]= 0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,0x8a,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!\"$\'*+,-./:=?";
uint button_mirror[MAXCONTROLLERS];
ushort D_up_hold[MAXCONTROLLERS];
ushort D_down_hold[MAXCONTROLLERS];
ushort D_left_hold[MAXCONTROLLERS];
ushort D_right_hold[MAXCONTROLLERS];
ushort Up_hold[MAXCONTROLLERS];
ushort down_hold[MAXCONTROLLERS];
ushort left_hold[MAXCONTROLLERS];
ushort right_hold[MAXCONTROLLERS];
ushort c_up_hold[MAXCONTROLLERS];
ushort C_down_hold[MAXCONTROLLERS];
ushort c_left_hold[MAXCONTROLLERS];
ushort c_right_hold[MAXCONTROLLERS];
ushort Start_hold[MAXCONTROLLERS];
ushort button_a_hold[MAXCONTROLLERS];
ushort button_b_hold[MAXCONTROLLERS];
ushort Z_hold[MAXCONTROLLERS];
ushort L_hold[MAXCONTROLLERS];
ushort R_hold[MAXCONTROLLERS];
ContManageStruct ContManager;

void init_controller_thread(OSSched *sc,u8 ports,byte pri,byte id){
  ContManager.ossched = sc;
  ContManager.ports = ports;
  ContManager.thread_stack = (void *)Malloc(0x448,FILENAME,0xc8);
  osCreateThread(&ContManager.Thread,(int)id,controller_loop,null,
                     ContManager.thread_stack + 0x448,pri);
  osStartThread(&ContManager.Thread);}

void controller_loop(void){
  OSMesg *msg;
  
  init_controller_input_buffer();
  do {
    do {
      osRecvMesg(&ContManager.controller_queue_2,msg,1);
    } while (*msg != 1);
    read_controller_input();
    if (osTvType == PAL) {
      ContManager.Timer = (ContManager.Timer + 1) % 5;
      if (ContManager.Timer == 0) {
        read_controller_input();
      }
    }
    else {
      ContManager.Timer = (ContManager.Timer + 1) % 6;
    }
  } while( true );
}

void init_controller_input_buffer(void){
  controllerBuffer *pcVar1;
  Button_hold *pBVar2;
  controllerBuffer *pcVar3;
  uint i;
  OSContStatus contStat [4];
  u8 auStack40 [4];
  
  ContManager.osmesgPointer = (OSMesg *)Malloc(0x20,FILENAME,0x102);
  osCreateMesgQueue(&ContManager.controller_queue_2,ContManager.osmesgPointer,8);
  osCreateMesgQueue(&ContManager.si_megQ,&ContManager.mesg0,1);
  osSetEventMesg(SI,&ContManager.si_megQ,&_gp_1);
  osCreateMesgQueue(&ContManager.contMesgQ,&ContManager.mesg1,1);
  i = 0;
  ContManager.BufferPointer =
       (controllerBuffer *)
       Malloc(ContManager.ports*sizeof(controllerBuffer),FILENAME,0x10b);
  if (ContManager.ports != 0) {
    do {
      pBVar2 = (Button_hold *)Malloc(128*sizeof(Button_hold),FILENAME,0x111);
      ContManager.BufferPointer[i].latest = 0;
      ContManager.BufferPointer[i].inputlog = pBVar2;
      ContManager.BufferPointer[i].hori = 0.1f;
      ContManager.BufferPointer[i].vert = 0.1f;
      ContManager.BufferPointer[i].next = 0x7f;
      ContManager.BufferPointer[i].ContGet = '\0';
      ContManager.BufferPointer[i].ContRead = false;
      i++;
    } while (i < ContManager.ports);
  }
  osSendMesg(&ContManager.contMesgQ,null,1);
  osContSetCh(ContManager.ports);
  osContInit(&ContManager.si_megQ,auStack40,contstat);
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  osScAddClient(ContManager.ossched,&ContManager.client,&ContManager.controller_queue_2);
  ContManager.Timer = 0;
  return;
}

void read_controller_input(void){
  s8 sVar1;
  s8 sVar2;
  BUTTON_aidyn BVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  int iVar7;
  byte bVar8;
  Button_hold *contEntry;
  BUTTON_aidyn buttons;
  controllerBuffer *buffer;
  u8 port;
  float fVar10;
  float fVar11;
  float fVar12;
  OSContPad contPad [4];
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  osContStartReadData(&ContManager.si_megQ);
  osRecvMesg(&ContManager.si_megQ,(OSMesg *)0x0,1);
  osContGetReadData(contPad);
  fVar6 = -0.7f;
  fVar5 = 0.7f;
  fVar4 = 80.0f;
  port = 0;
  if (ContManager.ports != 0) {
    iVar7 = 0;
    do {
      buffer = (controllerBuffer *)((int)ContManager.BufferPointer + (iVar7 - port) * 8); //needs cleanup
      if (-1 < buffer->ContGet) {
        bVar8 = buffer->next + 1 & 0x7f;
        buffer->next = bVar8;
        contEntry = (Button_hold *)(&(&buffer->inputlog->contAidyn)[(uint)bVar8 * 3].joy_x + bVar8); //this, too
        if ((contPad[port].errno & CONT_NO_RESPONSE_ERROR) == 0) {
          buttons = (BUTTON_aidyn)contPad[port].button;
          sVar1 = contPad[port].stick_x;
          sVar2 = contPad[port].stick_y;
          buffer->ContRead = true;
          fVar12 = (float)(int)sVar1 / fVar4;
          fVar11 = (float)(int)sVar2 / fVar4;
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
      port++;
      iVar7 = port << 4;
    } while (port < ContManager.ports);
  }
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return;
}

bool ofunc_getContQuerey(int port){
  OSContStatus stats [4];
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  osContStartQuery(&ContManager.si_megQ);
  osRecvMesg(&ContManager.si_megQ,null,1);
  osContGetQuery(stats);
  osRecvMesg(&ContManager.contMesgQ,null,1);
  return (stats[port].errno & CONT_NO_RESPONSE_ERROR) == 0;
}


bool controller_status_check(int port){
  OSContStatus stats [4];
  CONT_ERROR CErr;
  CONT_TYPE CType;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  osContStartQuery(&ContManager.si_megQ);
  osRecvMesg(&ContManager.si_megQ,(OSMesg *)0x0,1);
  osContGetQuery(stats);
  CErr = stats[port].errno;
  CType = stats[port].type;
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return (CType & CONT_TYPE_MASK) == CONT_TYPE_NORMAL &&
         ((CErr & CONT_OVERRUN_ERROR) == 0 && (CErr & CONT_NO_RESPONSE_ERROR) == 0);
}

bool func_8009b8fc(int port){
  bool bVar1;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  bVar1 = ContManager.BufferPointer[port].ContRead;
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return bVar1;
}

PFS_ERR8 initControllerPak(int port){
  PFS_ERR PVar1;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  PVar1 = osPfsInitPak(&ContManager.si_megQ,&ContManager.BufferPointer[port].pfs,port);
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return (PFS_ERR8)PVar1;
}

PFS_ERR8 testRumblePack(byte port){
  PFS_ERR8 PVar1;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  PVar1 = osMotorInit(&ContManager.si_megQ,&ContManager.BufferPointer[port].pfs,port);
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return PVar1;
}


PFS_ERR8 testTransferPak(uint port){
  PFS_ERR PVar1;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  PVar1 = osGbpakInit(&ContManager.si_megQ,&ContManager.BufferPointer[port].pfs,port);
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return (PFS_ERR8)PVar1;
}

PFS_ERR8 get_psf_err(byte port){
  PFS_ERR8 PVar1;
    PVar1 = initControllerPak(port);
  if (PVar1 == ERR_DEVICE) {
    PVar1 = testRumblePack(port);
    if ((PVar1 == OK) || (PVar1 = testTransferPak(port), PVar1 == OK)) {
      initControllerPak(port);
      PVar1 = ERR_DEVICE;
    }
    else {
      initControllerPak(port);
      PVar1 = ID_FATAL;
    }
  }
  return PVar1;
}

PFS_ERR8 repair_controllerpak_id(uint port){
  PFS_ERR PVar1;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  PVar1 = osPfsRepairId(&ContManager.BufferPointer[port].pfs);
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return (PFS_ERR8)PVar1;
}


PFS_ERR8 ofunc_get_contpak_freespace(u16 *arg0,uint port){
  PFS_ERR PVar1;
  s32 bytesFree;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  PVar1 = osPfsFreeBlocks(&ContManager.BufferPointer[port].pfs,&bytesFree);
  if (PVar1 == OK) {*arg0 = bytesFree._2_2_;}
  else {*arg0 = 0;}
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return (PFS_ERR8)PVar1;
}

PFS_ERR8 get_contpak_freespace(undefined *param_1,uint port){
  PFS_ERR PVar1;
  undefined4 blocks;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  PVar1 = osPfsFreeBlocks(&ContManager.BufferPointer[port].pfs,&blocks);
  if (PVar1 == OK) {*param_1 = blocks._2_1_;}
  else {*param_1 = 0;}
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return (PFS_ERR8)PVar1;
}

PFS_ERR8 create_new_save_file (u8 *fileno,char *GameName,char *ExtName,short compCode,u32 GameCode, ushort EXTName,byte port){
  PFS_ERR PVar2;
  u8 name [16];
  u8 code [4];
  undefined4 filenum;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  make_pfs_string(name,GameName,0x10);
  make_pfs_string(code,ExtName,4);
  PVar2 = osPfsAllocateFile
                    (&ContManager.BufferPointer[port].pfs,compCode,GameCode,name,code,(uint)EXTName,&filenum);
  if (PVar2 == OK) {*fileno = (u8)filenum;}
  else {*fileno = 0;}
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return (PFS_ERR8)PVar2;
}


PFS_ERR8 ofunc_find_file(u8 *fileno,undefined4 filename,undefined4 filecode,u16 param_4, u32 param_5,byte port){
  PFS_ERR PVar2;
  u8 name [16];
  u8 code [4];
  undefined4 file_no;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  make_pfs_string(name,filename,0x10);
  make_pfs_string(code,filecode,4);
  PVar2 = osPfsFindFile(&ContManager.BufferPointer[port].pfs,param_4,param_5,name,code,&file_no);
  if (PVar2 == OK) {*fileno = (u8)file_no;}
  else {*fileno = 0;}
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return (PFS_ERR8)PVar2;
}


PFS_ERR8 get_file_state(fileState_aidyn *FS,uint file_no,uint port){
  PFS_ERR PVar1;
  OSPfsState state;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  PVar1 = osPfsFileState(&ContManager.BufferPointer[port & 0xff].pfs,file_no & 0xff,&state);
  if (PVar1 == OK) {
    translate_pfs_string(FS->game_name,state.game_name,0x10);
    translate_pfs_string(FS->ext_name,state.ext_name,4);
    FS->ext_name[1] = '\0';
    FS->comp_code = state.company_code;
    FS->game_code = state.game_code;
    FS->filesize = state.file_size._2_2_;
  }
  else memset(param_1,0,sizeof(fileState_aidyn));
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return (PFS_ERR8)PVar1;
}

PFS_ERR8 wite_file_to_contpak(u8 *buff,u8 filenum,u16 offset,u16 size,byte port){
  PFS_ERR PVar1;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  PVar1 = osPfsReadWriteFile(&ContManager.BufferPointer[port].pfs,filenum,PFS_WRITE,offset,size,buff);
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return (PFS_ERR8)PVar1;
}


PFS_ERR8 read_ContPak_file(u8 *buff,short filenum,u16 offset,u16 size,byte port){
  PFS_ERR PVar1;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  PVar1 = osPfsReadWriteFile(&ContManager.BufferPointer[port].pfs,filenum,PFS_READ,offs,size,buff);
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return (PFS_ERR8)PVar1;
}


PFS_ERR8 erase_game_file(uint fileno,uint port){
  controllerBuffer *pcVar1;
  PFS_ERR PVar2;
  OSPfsState state;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  pcVar1 = ContManager.BufferPointer[port];
  PVar2 = osPfsFileState(&pcVar1->pfs,fileno & 0xff,&state);
  if (PVar2 == OK) {
    PVar2 = osPfsDeleteFile(&pcVar1->pfs,state.company_code,state.game_code,state.game_name);
  }
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return (PFS_ERR8)PVar2;
}

uint Ofunc_find_ControllerPak(uint port){
  PFS_ERR PVar1;
  uint uVar2;
  byte abStack24 [24];
  
  abStack24[0] = 0;
  osSendMesg(&ContManager.contMesgQ,null,1);
  PVar1 = osPfsIsPlug(&ContManager.si_megQ,abStack24);
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  if (PVar1 == OK) {uVar2 = (int)(uint)abStack24[0] >> (port & 0x1f) & 1;}
  else {uVar2 = 0;}
  return uVar2;
}

bool controller_query_2(byte port,CONT_STATUS *statOut){
  OSContStatus Cstats [4];
  CONT_TYPE CType;
  CONT_ERROR Cerr;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  osContStartQuery(&ContManager.si_megQ);
  osRecvMesg(&ContManager.si_megQ,(OSMesg *)0x0,1);
  osContGetQuery(Cstats);
  Cerr = Cstats[port].errno;
  CType = Cstats[port].type;
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  if (statOut != (CONT_STATUS *)0x0) {
    *statOut = Cstats[port].status;
  }
  return statOut != (CONT_STATUS *)0x0 &&
         ((CType & CONT_TYPE_MASK) == CONT_TYPE_NORMAL &&
         ((Cerr & CONT_OVERRUN_ERROR) == 0 && (Cerr & CONT_NO_RESPONSE_ERROR) == 0));
}

bool query_controller(uint port){
  uint uVar1;
  OSContStatus Cstatus [4];
  CONT_TYPE CType;
  CONT_ERROR Cerr;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  osContStartQuery(&ContManager.si_megQ);
  osRecvMesg(&ContManager.si_megQ,(OSMesg *)0x0,1);
  osContGetQuery(Cstatus);
  Cerr = Cstatus[port].errno;
  CType = Cstatus[port].type;
  uVar1 = ContManager.BufferPointer[port].pfs.status;
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return ((CType & CONT_TYPE_MASK) == CONT_TYPE_NORMAL &&
         ((Cerr & CONT_OVERRUN_ERROR) == 0 && (Cerr & CONT_NO_RESPONSE_ERROR) == 0)) &&
         (uVar1 & 4) != 0;
}

int Ofunc_set_cont_hori_vert(float H,float V,u8 arg0,u8 arg1,uint port){
  controllerBuffer *pcVar1;
  int iVar2;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  pcVar1 = ContManager.BufferPointer[port];
  pcVar1->hori = H;
  pcVar1->vert = V;
  iVar2 = osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return iVar2;
}

bool get_cont_aidyn(Button_hold *param_1,byte port){
  controllerBuffer *buffer;
  
  osSendMesg(&ContManager.contMesgQ,null,1);
  buffer = ContManager.BufferPointer[port];
  if (buffer->ContGet) {
    param_1 =(&buffer->inputlog[buffer->latest];
    buffer->ContGet--;
    buffer->latest++;
  }
  osRecvMesg(&ContManager.contMesgQ,(OSMesg *)0x0,1);
  return (bool)pcVar2->ContGet;
}

void translate_pfs_string(char *ascii,byte *pfs,uint len){
  byte *pbVar1;
  uint uVar3;
  char cVar4;

  uVar3 = 0;
  pbVar1 = pfs;
  if (len != 0) {
    do {
      cVar4 = '*';
      if (*pbVar1 < 0x42) {
        cVar4 = pfs_charset[*pbVar1];
      }
      ascii[uVar3] = cVar4;
      uVar3++;
      pbVar1 = pfs + uVar3;
    } while (uVar3 < len);
  }
  ascii[len] = '\0';
  return;
}

void make_pfs_string(u8 *pfs,char *ascii,uint len){
  char cVar1;
  bool bVar2;
  bool bVar3;
  uint len_2;
  char *pcVar4;
  uint uVar5;
  uint i;
  uint uVar6;
  
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

short cont_delay(byte port){
  short sVar1;
  bool bVar2;
  short sVar3;
  Button_hold temp;  
  sVar1 = 0;
  do {
    sVar3 = sVar1;
    bVar2 = get_cont_aidyn(temp,port);
    sVar1 = sVar3 + 1;
  } while (bVar2);
  return sVar3;
}




