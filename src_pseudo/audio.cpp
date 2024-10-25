#include "typedefs.h"
#include "heapN64.h"

#define FILENAME "./src/audio.cpp"

struct Voice_Aidyn {
    ALVoice voice;
    ALWaveTable wavetable;
    Borg11Data *instrumentData;
    u32 id;
    u32 unk0x38;
    u32 waveTableLength;
    u32 loopEnd;
    ushort pitch;
    u8 loopCount;
    u8 isActive;
    u8 vol;
    u8 pan;
    u8 flag;
    u8 unk0x4b;
};

struct Audio_manager {
    ALPlayer ALPLAYER;
    ALHeap ALHEAP;
    ALSynth ALSYNTH;
    void *ThreadStack;
    OSMesg *OsMsgPtr0x74;
    OSSched *sched;
    Acmd *ACMDList;
    Voice_Aidyn *voicesAidyn;
    s16 *buffer_pointers[3];
    void *scaleBufferA;
    u32 scaleBufferB;
    u8 *indecies;
    u32 unk9c;
    OSThread Thread;
    OSScClient Client;
    OSScTask Task;
    u16 taskMsg;
    u8 unk0x2c2[30];
    OSMesg OSmesg0x2e0;
    OSMesgQueue mesgQ;
    OSMesgQueue mesgQ_2;
    OSMesgQueue *MesgQ_3;
    s32 AudiolistCount;
    u32 VoicesUsedTotal;
    u16 frequency;
    u16 audioLength;
    u16 unk0x324;
    u16 audioLengthMin;
    u16 bufferSize;
    u8 VoicesUsed;
    undefined1 audio_tally;
    s8 buffer_choice;
    undefined1 AudioListBool;
};
typedef enum VoiceFlag {
    VOICE_STOP=2,
    VOICE_SETPITCH=8,
    VOICE_SETVOL=0x10,
    VOICE_SETPAN=0x20
} VoiceFlag;

struct Audio_manager gAudioManager;

void audioStartThread(OSSched *sched,u16 freq,u8 pri,u8 id){
  gAudioManager.sched = sched;
  gAudioManager.frequency = freq;
  ALLOCS(gAudioManager.ThreadStack,0x448,0xb1);
  osCreateThread(&gAudioManager.Thread,(u32)id,audioProc,NULL,(void *)((int)gAudioManager.ThreadStack + 0x448),(u32)pri);
  osStartThread(&gAudioManager.Thread);
}

void removeCloseSynth(void){
  gAudioManager.AudioListBool = 1;
  alSynRemovePlayer(&gAudioManager.ALSYNTH,&gAudioManager.ALPLAYER);
  alClose(&gAudioManager.ALSYNTH);
}

void addDCMPlayer(ALPlayer *x){alSynAddPlayer(&gAudioManager.ALSYNTH,x);}


u32 DCM::AddVoice(undefined *oIndex,u32 *oID,Borg11Data *istDat,u32 param_4,
                 u32 len,u32 loopEnd,byte loops,ushort pitch,byte vol,byte pan,byte param_11){
  u8 bVar1;
  Voice_Aidyn *pVVar2;
  Voice_Aidyn *pVVar3;
  int iVar4;
  Voice_Aidyn *iVar5;
  u8 flag;
  u32 uVar5;
  Borg11Data *pBVar6;
  u32 uVar7;
  u32 uVar8;
  
  pVVar2 = gAudioManager.voicesAidyn;
  bVar1 = false;
  if (gAudioManager.VoicesUsed < 0x20) {
    uVar8 = 1;
    uVar7 = (u32)gAudioManager.indecies[gAudioManager.VoicesUsed++];
    gAudioManager.VoicesUsedTotal++;
  }
  else {
    pBVar6 = (Borg11Data *)0xffffffff;
    if (param_11 == 0) {
      uVar7 = 0;
      uVar8 = 0;
    }
    else {
      uVar7 = 0;
      uVar5 = 0;
      iVar4 = 0;
      do {
        if (*(char *)((int)(&(gAudioManager.voicesAidyn)->wavetable + 2) +
                     iVar4 * 0x10 + uVar5 * 0xc + 3) == '\x01') {
          if (*(Borg11Data **)
               ((int)(&(gAudioManager.voicesAidyn)->wavetable + 1) + (uVar5 * 3 + iVar4 * 4 + 1) * 4
               ) < pBVar6) {
            uVar7 = (u32)(char)uVar5;
            pBVar6 = *(Borg11Data **)
                      ((int)(&(gAudioManager.voicesAidyn)->wavetable + 1) +
                      (uVar5 * 3 + iVar4 * 4 + 1) * 4);
          }
        }
        uVar5 = uVar5 + 1 & 0xff;
        iVar4 = uVar5 << 2;
      } while (uVar5 < 0x20);
      uVar7 &= 0xff;
      bVar1 = true;
      uVar8 = 1;
      gAudioManager.VoicesUsedTotal += 1;
    }
  }
  if (uVar8 != 0) {
    gAudioManager.voicesAidyn[uVar7].loopCount = loops;
    pVVar2[uVar7].instrumentData = istDat;
    pVVar2[uVar7].unk0x38 = param_4;
    pVVar3 = gAudioManager.voicesAidyn;
    pVVar2[uVar7].waveTableLength = len;
    pVVar2[uVar7].loopEnd = loopEnd;
    pVVar3[uVar7].vol = vol;
    pVVar2 = gAudioManager.voicesAidyn;
    pVVar3[uVar7].pitch = pitch;
    pVVar2[uVar7].pan = pan;
    if (bVar1) flag = 6;
    else flag = 4;
    gAudioManager.voicesAidyn[uVar7].flag = flag;
    uVar5 = gAudioManager.VoicesUsedTotal;
    pVVar2 = gAudioManager.voicesAidyn;
    gAudioManager.voicesAidyn[uVar7].isActive = 1;
    pVVar3 = gAudioManager.voicesAidyn;
    pVVar2[uVar7].id = uVar5;
    pVVar3[uVar7].unk0x4b = param_11;
    *oIndex = (char)uVar7;
    *oID = gAudioManager.voicesAidyn[uVar7].id;
  }
  return uVar8;
}

u32 DCM::SetVoicePitch(u8 index,u32 param_2,ushort p){
  Voice_Aidyn *pVVar1;
  Voice_Aidyn *pVVar2;
  u32 uVar4;
  
  pVVar2 = gAudioManager.voicesAidyn;
  if (gAudioManager.voicesAidyn[index].isActive == 1) {
    uVar4 = false;
    if (gAudioManager.voicesAidyn[index].id == param_2) {
      pVVar1 = gAudioManager.voicesAidyn + index;
      uVar4 = true;
      gAudioManager.voicesAidyn[index].pitch = p;
      pVVar2[index].flag |= VOICE_SETPITCH;
    }
  }
  else uVar4 = false;
  return uVar4;
}


u32 DCM::SetVoiceVol(u8 voice,u32 param_2,byte vol){
  u32 ret;
  if (gAudioManager.voicesAidyn[voice].isActive == 1) {
    ret = 0;
    if (gAudioManager.voicesAidyn[voice].id == param_2) {
      gAudioManager.voicesAidyn[voice].vol = vol;
      ret = 1;
      gAudioManager.voicesAidyn[voice].flag|= VOICE_SETVOL;
    }
  }
  else ret = 0;
  return ret;
}

u32 DCM::SetVoicePan(u8 voice,u32 param_2,byte pan){
  u32 ret;
  if (gAudioManager.voicesAidyn[voice].isActive == 1) {
    ret = 0;
    if (gAudioManager.voicesAidyn[voice].id == param_2) {
      gAudioManager.voicesAidyn[voice].pan = pan;
      ret = 1;
      gAudioManager.voicesAidyn[voice].flag|= VOICE_SETPAN;
    }
  }
  else ret = 0;
  return ret;
}


u32 FUN_80099530(u8 voice,u32 param_2){
  u32 uVar1;
  
  if (gAudioManager.voicesAidyn[voice].isActive == 1) {
    uVar1 = 0;
    if (gAudioManager.voicesAidyn[voice].id == param_2) {
      gAudioManager.Voices_AidynCount--;
      gAudioManager.indecies[gAudioManager.Voices_AidynCount] = voice;
      gAudioManager.voicesAidyn[voice].flag = VOICE_STOP;
      uVar1 = 1;
      gAudioManager.voicesAidyn[voice].isActive = 0;
    }
  }
  else uVar1 = 0;
  return uVar1;
}

u8 DCM::IsVoiceActive(u8 x){return gAudioManager.voicesAidyn[x].isActive;}
u32 DCM::GetVoiceID(u8 x){return gAudioManager.voicesAidyn[x].id;}
u32 Ofunc_80099610(u8 x){return gAudioManager.voicesAidyn[x].unk0x38;}

void audioProc(void* p){
  Acmd *pAVar1;
  short *apsStack32 [8];
  
  ALLOCS(gAudioManager.OsMsgPtr0x74,(sizeof(OSMesg)*4),449);
  osCreateMesgQueue(&gAudioManager.mesgQ,gAudioManager.OsMsgPtr0x74,4);
  osCreateMesgQueue(&gAudioManager.mesgQ_2,&gAudioManager.OSmesg0x2e0,1);
  gAudioManager.MesgQ_3 = osScGetCmdQ(gAudioManager.sched);
  AudioProcInit();
  gAudioManager.taskMsg = 2;
  osScAddClient(gAudioManager.sched,&gAudioManager.Client,&gAudioManager.mesgQ);
  while(1) {
    do {
      osRecvMesg(&gAudioManager.mesgQ,apsStack32,1);
    } while (*apsStack32[0] != 1);
    pAVar1 = NULL;
    if (gAudioManager.AudioListBool == 0) pAVar1 = CreateAudioList();
    if ((pAVar1) && (gAudioManager.ACMDList < pAVar1)) {
      SetAudioTask(pAVar1);
      osSendMesg(gAudioManager.MesgQ_3,&gAudioManager.Task,1);
      osRecvMesg(&gAudioManager.mesgQ_2,apsStack32,1);
    }
  }
}

void AudioProcInit(void){
  u8 *base;

  ushort uVar3;
  u8 uVar4;
  u32 uVar5;
  ALSynConfig AStack168;
  ALVoiceConfig aAStack104 [20];
  
  base = (u8 *)HeapAlloc(0x12000,FILENAME,0x1f6);
  bzero(base,0x12000);
  alHeapInit(&gAudioManager.ALHEAP,base,0x12000);
  
  AStack168.maxPVoices = 0x20;
  AStack168.maxUpdates = 0x60;
  AStack168.maxVVoices = 0;
  AStack168.dmaproc = _amDmaNew;
  AStack168.fxType = AL_FX_SMALLROOM;
  AStack168.outputRate = osAiSetFrequency(gAudioManager.frequency);
  AStack168.heap = &gAudioManager.ALHEAP;
  alInit(&gAudioManager.ALSYNTH,&AStack168);
  gAudioManager.ALPLAYER.next = NULL;
  gAudioManager.ALPLAYER.handler = soundVoiceHandler;
  gAudioManager.ALPLAYER.clientData = NULL;
  alSynAddPlayer(&gAudioManager.ALSYNTH,&gAudioManager.ALPLAYER);
  aAStack104[0].priority = 10;
  aAStack104[0].fxBus = 0;
  aAStack104[0].unityPitch = 0;
  ALLOCS(gAudioManager.voicesAidyn,sizeof(Voice_Aidyn)*32,527);
  ALLOCS(gAudioManager.indecies,32,528);
  for(uVar4 = 0;uVar4 < 0x20;uVar4++) {
    alSynAllocVoice(&gAudioManager.ALSYNTH,&gAudioManager.voicesAidyn[uVar4].voice,aAStack104);
    gAudioManager.voicesAidyn[uVar4].wavetable.waveInfo = alHeapDBAlloc(NULL,0,&gAudioManager.ALHEAP,1,0xc);
    gAudioManager.voicesAidyn[uVar4].isActive = 0;
    gAudioManager.voicesAidyn[uVar4].flag = 0;
    gAudioManager.indecies[uVar4] = uVar4;
  }
  gAudioManager.Voices_AidynCount = 0;
  gAudioManager.unk0x31c = 0;
  if (osTvType == OS_TV_NTSC) uVar3 = gAudioManager.frequency / 60;
  else if (osTvType == OS_TV_MPAL) uVar3 = gAudioManager.frequency / 60;
  else if (osTvType == OS_TV_PAL)uVar3 = gAudioManager.frequency / 50;
  else CRASH("audio.cpp, AudioProcInit()","Unknown osTvType");
  gAudioManager.unk0x324 = uVar3 + 1;
  if (gAudioManager.unk0x324 & 0xf) gAudioManager.unk0x324 = (gAudioManager.unk0x324 & 0xfff0) + 0x10;
  gAudioManager.audioLengthMin = gAudioManager.unk0x324;
  gAudioManager.bufferSize = gAudioManager.unk0x324 + 0x50;
  for(uVar4 = 0;uVar4 < 3;uVar4++) {
    gAudioManager.buffer_pointers[uVar4] = alHeapDBAlloc(NULL,0,&gAudioManager.ALHEAP,1,(u32)gAudioManager.unk0x328 << 2);
  }
  gAudioManager.audio_tally = 0;
  gAudioManager.buffer_choice = -1;
  gAudioManager.scaleBufferA = alHeapDBAlloc(NULL,0,&gAudioManager.ALHEAP,1,0x5000);
  gAudioManager.scaleBufferB = gAudioManager.scaleBufferB;
  gAudioManager.ACMDList = (Acmd *)alHeapDBAlloc(NULL,0,&gAudioManager.ALHEAP,1,0x4000);
  gAudioManager.AudioListBool = 0;
}

code * _amDmaNew(void){return dmaProc;}

short * dmaProc(short *param_1,s32 param_2,longlong param_3){
  byte bVar1;
  short *psVar2;
  int iVar3;
  
  if (param_3 == 2) {
    if (0x4fff < (int)((int)gAudioManager.scaleBufferB +
                      (param_2 * 2 - (int)gAudioManager.scaleBufferA))) {
      CRASH("audio.cpp, dmaProc()","Scale buffer overrun!");
    }
    iVar3 = param_2 + -1;
    psVar2 = gAudioManager.scaleBufferB;
    if (param_2 != 0) {
      do {
        bVar1 = *(byte *)param_1;
        param_1 = (short *)((int)param_1 + 1);
        iVar3 = iVar3 + -1;
        *psVar2 = (ushort)bVar1 << 8;
        psVar2 = psVar2 + 1;
      } while (iVar3 != -1);
    }
    param_1 = gAudioManager.scaleBufferB;
    gAudioManager.scaleBufferB = (short *)(((u32)psVar2 & ~7) + 8);
  }
  return param_1;
}
//redo this when "Voice_aidyn" struct is better understood.
u32 soundVoiceHandler(void){
  ushort uVar1;
  PVoice *pPVar2;
  u32 *puVar3;
  u32 uVar4;
  u8 *puVar5;
  float fVar6;
  int iVar7;
  byte bVar8;
  undefined2 vol;
  u32 uVar9;
  ALPan AVar10;
  Voice_Aidyn *v;
  s16 vol_00;
  u8 uVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  
  fVar6 = 2.0f;
  uVar11 = 0;
  iVar7 = 0;
  for(uVar11 = 0;uVar11<32;uVar11++) {
    v = gAudioManager.voicesAidyn[uVar11];
    if (v->unk0x47 == 1) {
      if ((v->flag & 4) == 0) {
        pPVar2 = (v->voice).pvoice;
        uVar9 = *(u32 *)((pPVar2->decoder).state + 0xe);
        v->unk0x38 = uVar9;
        bVar8 = *(byte *)((int)(pPVar2->decoder).state + 0xb);
        v->unk0x46 = bVar8;
        if (bVar8 == 0) {
          if (uVar9 >= *(u32 *)(v->unk0x30 + 8)) {
            gAudioManager.Voices_AidynCount--;
            gAudioManager.indecies[gAudioManager.Voices_AidynCount] = uVar11;
            v->flag = 2;
            v->unk0x47 = 0;
            v->unk0x38 = *(u32 *)(v->unk0x30 + 8);
          }
        }
      }
    }
    if ((v->flag & 2)) {
      alSynStopVoice(&gAudioManager.ALSYNTH,(ALVoice *)v);
      v->flag &= ~2;
    }
    if(v->flag & 4) {
      puVar3 = (u32 *)v->unk0x30;
      *(u32 *)((((v->voice).pvoice)->decoder).state + 0xe) = v->unk0x38;
      if ((*puVar3 & 4) == 0) (v->wavetable).type = AL_FILTER_SET_SOURCE;
      else (v->wavetable).type = AL_FILTER_ADD_SOURCE;
      iVar7 = v->unk0x30;
      uVar4 = v->unk0x3c;
      (v->wavetable).ln = *(s32 *)(iVar7 + 4);
      **(u32 **)&(v->wavetable).waveInfo = uVar4;
      puVar5 = *(u8 **)(iVar7 + 0xc);
      *(u32 *)(*(int *)&(v->wavetable).waveInfo + 4) = v->unk0x40;
      bVar8 = v->unk0x46;
      uVar1 = v->pitch;
      (v->wavetable).base = puVar5;
      (v->wavetable).flags = 1;
      *(int *)(*(int *)&(v->wavetable).waveInfo + 8) = (int)(char)bVar8;
      fVar13 = (float)(u32)uVar1 / (float)gAudioManager.ALSYNTH.outputRate;
      fVar12 = 0.0;
      fVar14 = fVar12;
      if (((fVar13 <= 0.0) || (fVar14 = 2.0f, fVar6 < fVar13)) ||
         (fVar14 = fVar13, 0.0 < fVar13)) {
        bVar8 = v->vol;
        fVar12 = fVar14;
      }
      else {
        bVar8 = v->vol;
      }
      uVar9 = (u32)bVar8 << 6;
      if ((bVar8 == 0) || (vol_00 = 0x7fff, uVar9 < 0x8000)) {
        vol_00 = (s16)uVar9;
      }
      bVar8 = v->pan >> 1;
      if ((bVar8 == 0) || (AVar10 = 0x7f, bVar8 < 0x80)) {
        AVar10 = bVar8;
      }
      alSynStopVoice(&gAudioManager.ALSYNTH,(ALVoice *)v);
      alSynStartVoiceParams(&gAudioManager.ALSYNTH,(ALVoice *)v,&v->wavetable,fVar12,vol_00,AVar10,0,1000);
      v->flag&=~4;
    }
    if(v->flag & 8) {
      fVar14 = (float)(u32)v->pitch / (float)gAudioManager.ALSYNTH.outputRate;
      if (0.0 < fVar14) {
        fVar12 = 2.0f;
        if ((fVar14 <= fVar6) && (fVar12 = fVar14, fVar14 <= 0.0)) {
          fVar12 = 0.0;
        }
      }
      else fVar12 = 0.0;
      alSynSetPitch(&gAudioManager.ALSYNTH,(ALVoice *)v,fVar12);
      v->flag&=~8;
    }
    if(v->flag & 0x10) {
      uVar9 = (u32)v->vol << 6;
      if ((v->vol == 0) || (vol = 0x7fff, uVar9 < 0x8000)) {
        vol = (short)uVar9;
      }
      alSynSetVol(&gAudioManager.ALSYNTH,(ALVoice *)v,vol,1000);
      v->flag&= ~0x10;
    }
    if (v->flag & 0x20) {
      bVar8 = v->pan >> 1;
      if ((bVar8 == 0) || (AVar10 = 0x7f, bVar8 < 0x80)) {
        AVar10 = bVar8;
      }
      alSynSetPan(&gAudioManager.ALSYNTH,(ALVoice *)v,AVar10);
      v->flag&= ~0x20;
    }
  }
  return 1000;
}

Acmd * CreateAudioList(void){
  byte bVar1;
  u8 uVar2;
  Acmd *pAVar3;
  
  if (gAudioManager.buffer_choice != -1) {
    osAiSetNextBuffer(gAudioManager.buffer_pointers[gAudioManager.buffer_choice],gAudioManager.audioLength << 2);
  }
  gAudioManager.scaleBufferB = gAudioManager.scaleBufferA;
  uVar2 = ((u32)gAudioManager.unk0x324 - (osAiGetLength() >> 2 & 0xffff)) + 0x50;
  gAudioManager.audioLength = (ushort)uVar2 & 0xfff0;
  if ((uVar2 & 0xfff0) < (u32)gAudioManager.unk0x326) {
    gAudioManager.audioLength = gAudioManager.unk0x326;
  }
  gAudioManager.AudiolistCount = 0;
  pAVar3 = alAudioFrame(gAudioManager.ACMDList,&gAudioManager.AudiolistCount,gAudioManager.buffer_pointers[gAudioManager.audio_tally],(u32)gAudioManager.audioLength);
  bVar1 = gAudioManager.audio_tally;
  if (0x7ff < gAudioManager.AudiolistCount) CRASH("audio.cpp, CreateAudioList()","Audio list overrun!");
  uVar2 = (gAudioManager.audio_tally + 1) / 3;
  gAudioManager.audio_tally = (gAudioManager.audio_tally + 1) - ((char)(uVar2 << 1) + (char)uVar2);
  gAudioManager.buffer_choice = bVar1;
  return pAVar3;
}

void AudioSetTask(Acmd *param_1){
  gAudioManager.Task.list.t.ucode_boot = rspbootTextStart;
  gAudioManager.Task.list.t.ucode_boot_size = sizeof(rspbootTextStart);
  gAudioManager.Task.list.t.ucode = aspMainTextStart;
  gAudioManager.Task.list.t.ucode_data_size = 0x800;
  gAudioManager.Task.list.t.ucode_data = aspData;
  gAudioManager.Task.msgQ = &gAudioManager.mesgQ_2;
  gAudioManager.Task.list.t.type = M_AUDTASK;
  gAudioManager.Task.list.t.flags = 0;
  gAudioManager.Task.list.t.dram_stack = NULL;
  gAudioManager.Task.list.t.dram_stack_size = 0;
  gAudioManager.Task.list.t.output_buff = NULL;
  gAudioManager.Task.list.t.output_buff_size = NULL;
  gAudioManager.Task.list.t.yield_data_ptr = NULL;
  gAudioManager.Task.list.t.yield_data_size = 0;
  gAudioManager.Task.next = NULL;
  gAudioManager.Task.flags = OS_SC_NEEDS_RSP;
  gAudioManager.Task.msg = &gAudioManager.taskMsg;
  gAudioManager.Task.list.t.data_ptr = (u64 *)&(gAudioManager.ACMDList)->adpcm;
  gAudioManager.Task.list.t.data_size = (int)param_1 - (int)gAudioManager.ACMDList;
}

undefined2 Ofunc_8009a0fc(void){return gAudioManager.audioLength;}
s32 Ofunc_8009a108(void){return gAudioManager.AudiolistCount;}
int Ofunc_8009a114(void){return gAudioManager.scaleBufferB - (int)gAudioManager.scaleBufferA;}
u8 Ofunc_8009a12c(void){return 32 - gAudioManager.Voices_AidynCount;}