#ifdef DEBUGVER
#define FILENAME "./src/romcopy.cpp"
#else
#define FILENAME ""
#endif

RomcopyManageStruct romcopyManage;

void init_romcopy_thread(OSPri pri,u32 id){
  romcopyManage.stack = (void *)heapAlloc(0x248,FILENAME,0x79);
  osCreateThread(&romcopyManage.Thread,id,romcopy_loop,NULL,romcopyManage.stack + 0x248,pri);
  osStartThread(&romcopyManage.Thread);
}


void romcopy_loop(void){
  romcopy_struct *Entry;
  OSMesgQueue TempQ;
  OSIoMesg IOMsg;
  OSMesg TempMsg;
  u32 uStack36;
  
  romcopy_mesgqueue();
  osCreateMesgQueue(&TempQ,&TempMsg,1);
  do {
    osRecvMesg(&romcopyManage.mesgQ0x1c0,(OSMesg *)&uStack36,1);
    Entry = romcopyManage.dmaStructs[(u8)uStack36];
    osInvalDCache(Entry->VAddr,Entry->Bytes);
    osPiStartDma(&IOMsg,OS_MESG_PRI_NORMAL,OS_READ,Entry->devAddr,Entry->VAddr,Entry->Bytes,&TempQ);
    osRecvMesg(&TempQ,null,1);
    osSendMesg(&Entry->msgQ,null,1);
  } while(1);
}

void romcopy_mesgqueue(void){
  romcopy_struct *entry;
  u8 i;
  
  romcopyManage.mesgPointer = (OSMesg *)heapAlloc(0x20,FILENAME,0xb0);
  osCreateMesgQueue(&romcopyManage.mesgQ0x1c0,romcopyManage.mesgPointer,8);
  osCreateMesgQueue(&romcopyManage.mesgQ0x1dc,&romcopyManage.mesg0x1d8,1);
  romcopyManage.dmaStructs = (romcopy_struct *)heapAlloc(8*sizeof(romcopy_struct),FILENAME,0xb6);
  romcopyManage.dmaIndicies = (u8 *)heapAlloc(8,FILENAME,0xb8);
  for(i=0;i<8;i++) {
    entry =romcopyManage.dmaStructs[i]);
    osCreateMesgQueue(&entry->msgQ,&entry->msg,1);
    romcopyManage.dmaIndicies[i] = i;
  }
  romcopyManage.flag = 0;
}

u8 RomCopy(void *dest,void *source,u32 len,u32 type,char *cpp,u32 line){
  u8 bVar1;
  longlong lVar2;
  char *pcVar3;
  romcopy_struct *prVar4;
  char acStack160 [160];
  
  osSendMesg(&romcopyManage.mesgQ0x1dc,null,1);
  if (((u32)dest & 7) == 0) {
    if (((u32)source & 1) == 0) {
      if ((len & 1) == 0) {
        if (1 < type) {
        #ifdef DEBUGVER
          sprintf(acStack160,"type from %s line %lu unrecognized!",cpp,line);
          assert("u32 RomCopy( u32 pDest,u32 pSrc,u32 len,u32 type)",acStack160);
        #else
          assert();
        #endif
        }
        bVar1 = romcopyManage.dmaIndicies[romcopyManage.flag];
        romcopyManage.flag++;
        prVar4 = romcopyManage.dmaStructs[bVar1];
        prVar4->VAddr = dest;
        prVar4->devAddr = (u32)source;
        prVar4->Bytes = len;
        lVar2 = osSendMesg(&romcopyManage.mesgQ0x1c0,(OSMesg)(u32)bVar1,0);
        if (lVar2 != 0) {
        #ifdef DEBUGVER
          assert("u32 RomCopy( u32 pDest_,u32 pSrc_, u32 len_, u32 type_)","Request Queue is full!");
          #else
          assert();
        #endif
        }
        osRecvMesg(&romcopyManage.mesgQ0x1dc,null,1);
        if (type == 1) {
          osRecvMesg(&prVar4->msgQ,null,1);
          osSendMesg(&romcopyManage.mesgQ0x1dc,null,1);
          romcopyManage.flag = romcopyManage.flag - 1;
          romcopyManage.dmaIndicies[romcopyManage.flag] = bVar1;
          osRecvMesg(&romcopyManage.mesgQ0x1dc,null,1);
        }
        return bVar1;
      }
      #ifdef DEBUGVER
      pcVar3 = "len from %s line %lu needs to be aligned to 2 bytes!";
      #endif
    }
    else {
    #ifdef DEBUGVER
      pcVar3 = "pSrc from %s line %lu needs to be aligned to 2 bytes!";
    #endif
    }
  }
  else {
    #ifdef DEBUGVER
    pcVar3 = "pDest from %s line %lu needs to be aligned to 8 bytes!";
    #endif
  }
  #ifdef DEBUGVER
  sprintf(acStack160,pcVar3,cpp,line);
  assert("u32 RomCopy( u32 pDest,u32 pSrc,u32 len,u32 type)",acStack160);
  #endif
}


bool func_8009cb8c(u8 arg0,u8 arg1){

  if (arg1 == 1) {
    osRecvMesg(&romcopyManage.dmaStructs[arg0].msgQ,null,1);
    osSendMesg(&romcopyManage.mesgQ0x1dc,null,1);
  }
  else {
    if (osRecvMesg(&romcopyManage.dmaStructs[arg0].msgQ,null,0)) return false;
    osSendMesg(&romcopyManage.mesgQ0x1dc,null,1);
  }
  romcopyManage.flag--;
  romcopyManage.dmaIndicies[romcopyManage.flag] = arg0;
  osRecvMesg(&romcopyManage.mesgQ0x1dc,null,1);
  return true;
}

