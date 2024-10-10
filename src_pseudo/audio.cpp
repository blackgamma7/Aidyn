#include "commonTypes.h"

#define FILENAME "./src/audio.cpp"

struct Voice_Aidyn {
    struct ALVoice voice;
    struct ALWaveTable wavetable;
    s32 unk0x30;
    u32 unk0x34;
    u8 unk0x38;
    u8 unk0x39;
    u8 unk0x3a;
    u8 unk0x3b;
    s32 unk0x3c;
    s32 unk0x40;
    u16 pitch;
    u8 unk0x46;
    u8 unk0x47;
    u8 vol;
    u8 pan;
    u8 flag;
    u8 unk0x4b;
};

struct Audio_manager {
    ALPlayer ALPLAYER;
    ALHeap ALHEAP;
    ALSynth ALSYNTH;
    void * ThreadStack;
    OSMesg * OsMsgPtr0x74;
    OSSched * OSSched;
    Acmd * ACMDList;
    struct Voice_Aidyn * voicesAidyn;
    s16 * buffer_pointers[3];
    void * heap0x90;
    s32 heap0x90Mirror;
    pointer unk0x98;
    u8 unk0x9c;
    u8 unk0x9d;
    u8 unk0x9e;
    u8 unk0x9f;
    OSThread Thread;
    OSScClient Client;
    OSScTask Task;
    u16 taskMsg;
    u8 unk0x2c2[30];
    OSMesg OSmesg0x2e0;
    OSMesgQueue mesgQ;
    OSMesgQueue mesgQ_2;
    OSMesgQueue * MesgQ_3;
    s32 AudiolistCount;
    s32 unk0x31c;
    u16 frequency;
    u16 audioLength;
    u16 unk0x324;
    u16 unk0x326;
    u16 unk0x328;
    u8 Voices_AidynCount;
    u8 audio_tally;
    s8 buffer_choice;
    u8 AudioListBool;
    u8 unk0x32e;
    u8 unk0x32f;
};
struct Audio_manager gAudioManager;

void audio_thread_init(OSSched *sch,undefined2 param_2,u8 pri,u8 id){
  gAudioManager.OSSched = sch;
  gAudioManager.frequency = param_2;
  gAudioManager.ThreadStack = heapAlloc(0x448,FILENAME,0xb1);
  osCreateThread(&gAudioManager.Thread,id,audioProc,NULL,(void *)((int)gAudioManager.ThreadStack + 0x448),pri);
  osStartThread(&gAudioManager.Thread);
}

void removeCloseSynth(void){
  gAudioManager.AudioListBool = 1;
  alSynRemovePlayer(&gAudioManager.ALSYNTH,&gAudioManager.ALPLAYER);
  alClose(&gAudioManager.ALSYNTH);
}

void addDCMPlayer(ALPlayer *x){alSynAddPlayer(&gAudioManager.ALSYNTH,x);}

u32 voice_aidyn_setter(undefined *param_1,undefined4 *param_2,undefined4 param_3,undefined4 param_4,
                      undefined4 param_5,undefined4 param_6,byte param_7,ushort pitch,byte vol,
                      byte pan,byte param_11){
  bool bVar1;
  Voice_Aidyn *pVVar2;
  Voice_Aidyn *pVVar3;
  uint uVar4;
  int iVar6;
  Voice_Aidyn *iVar5;
  byte bVar7;
  u8 uVar8;
  uint uVar9;
  u32 uVar10;
  
  pVVar2 = gAudioManager.voicesAidyn;
  bVar1 = false;
  if (gAudioManager.Voices_AidynCount < 32) {
    uVar10 = 1;
    uVar4 = (uint)gAudioManager.Voices_AidynCount;
    gAudioManager.Voices_AidynCount = gAudioManager.Voices_AidynCount + 1;
    uVar9 = (uint)gAudioManager.indecies[uVar4];
    gAudioManager.unk0x31c = gAudioManager.unk0x31c + 1;
  }
  else {
    uVar4 = 0xffffffff;
    if (param_11 == 0) {
      uVar9 = 0;
      uVar10 = 0;
    }
    else {
      uVar9 = 0;
      uVar8 = 0;
      iVar6 = 0;
      for(uVar8 = 0;uVar8 < 0x20;uVar8++) {
        if ((&(gAudioManager.voicesAidyn)->unk0x47)[iVar6 * 0x10 + uVar8 * 0xc] == 1) {
          if ((&(gAudioManager.voicesAidyn)->unk0x34)[uVar8 * 3 + iVar6 * 4] < uVar4) {
            uVar9 = (uint)(char)uVar8;
            uVar4 = (&(gAudioManager.voicesAidyn)->unk0x34)[uVar8 * 3 + iVar6 * 4];
          }
        }
        iVar6 = uVar8 << 2;
      }
      uVar9 = uVar9 & 0xff;
      bVar1 = true;
      uVar10 = 1;
      gAudioManager.unk0x31c++;
    }
  }
  if (uVar10) {
    gAudioManager.voicesAidyn[uVar9].unk0x46 = param_7;
    pVVar2[uVar9].unk0x30 = param_3;
    pVVar2[uVar9].unk0x38 = param_4;
    pVVar3 = gAudioManager.voicesAidyn;
    pVVar2[uVar9].unk0x3c = param_5;
    pVVar2[uVar9].unk0x40 = param_6;
    pVVar3[uVar9].vol = vol;
    pVVar2 = gAudioManager.voicesAidyn;
    pVVar3[uVar9].pitch = pitch;
    pVVar2[uVar9].pan = pan;
    if (bVar1) bVar7 = 6;
    else bVar7 = 4;
    gAudioManager.voicesAidyn[uVar9].flag = bVar7;
    uVar4 = gAudioManager.unk0x31c;
    pVVar2 = gAudioManager.voicesAidyn;
    gAudioManager.voicesAidyn[uVar9].unk0x47 = 1;
    pVVar3 = gAudioManager.voicesAidyn;
    pVVar2[uVar9].unk0x34 = uVar4;
    pVVar3[uVar9].unk0x4b = param_11;
    *param_1 = (char)uVar9;
    *param_2 = gAudioManager.voicesAidyn[uVar9].unk0x34;
  }
  return uVar10;
}

u32 voices_aidyn_setPitch(u8 voice,uint param_2,ushort p){
  u32 ret;
  if (gAudioManager.voicesAidyn[voice].unk0x47 == 1) {
    ret = 0;
    if (gAudioManager.voicesAidyn[voice].unk0x34 == param_2) {
      ret = 1;
      gAudioManager.voicesAidyn[voice].pitch = p;
      gAudioManager.voicesAidyn[voice].flag|= 8;
    }
  }
  else ret = 0;
  return ret;
}

u32 set_voice_volume(u8 voice,uint param_2,byte vol){
  u32 ret;
  if (gAudioManager.voicesAidyn[voice].unk0x47 == 1) {
    ret = 0;
    if (gAudioManager.voicesAidyn[voice].unk0x34 == param_2) {
      gAudioManager.voicesAidyn[voice].vol = vol;
      ret = 1;
      gAudioManager.voicesAidyn[voice].flag|= 0x10;
    }
  }
  else ret = 0;
  return ret;
}

u32 set_voice_volume(u8 voice,uint param_2,byte pan){
  u32 ret;
  if (gAudioManager.voicesAidyn[voice].unk0x47 == 1) {
    ret = 0;
    if (gAudioManager.voicesAidyn[voice].unk0x34 == param_2) {
      gAudioManager.voicesAidyn[voice].pan = pan;
      ret = 1;
      gAudioManager.voicesAidyn[voice].flag|= 0x20;
    }
  }
  else ret = 0;
  return ret;
}


u32 FUN_80099530(byte voice,uint param_2){
  u32 uVar1;
  
  if (gAudioManager.voicesAidyn[voice].unk0x47 == 1) {
    uVar1 = 0;
    if (gAudioManager.voicesAidyn[voice].unk0x34 == param_2) {
      gAudioManager.Voices_AidynCount--;
      gAudioManager.indecies[gAudioManager.Voices_AidynCount] = voice;
      gAudioManager.voicesAidyn[voice].flag = 2;
      uVar1 = 1;
      gAudioManager.voicesAidyn[uVar2].unk0x47 = 0;
    }
  }
  else uVar1 = 0;
  return uVar1;
}

u8 Ofunc_800995b8(u8 x){return gAudioManager.voicesAidyn[x].unk0x47;}
u32 Ofunc_800995e4(u8 x){return gAudioManager.voicesAidyn[x].unk0x34;}
u32 Ofunc_80099610(u8 x){return gAudioManager.voicesAidyn[x].unk0x38;}

void audioProc(void){
  Acmd *pAVar1;
  short *apsStack32 [8];
  
  gAudioManager.OsMsgPtr0x74 = (OSMesg *)heapAlloc(0x10,FILENAME,0x1c1);
  osCreateMesgQueue(&gAudioManager.mesgQ,gAudioManager.OsMsgPtr0x74,4);
  osCreateMesgQueue(&gAudioManager.mesgQ_2,&gAudioManager.OSmesg0x2e0,1);
  gAudioManager.MesgQ_3 = osScGetCmdQ(gAudioManager.OSSched);
  AudioProcInit();
  gAudioManager.taskMsg = 2;
  osScAddClient(gAudioManager.OSSched,&gAudioManager.Client,&gAudioManager.mesgQ);
  while(1) {
    do {
      osRecvMesg(&gAudioManager.mesgQ,apsStack32,1);
    } while (*apsStack32[0] != 1);
    pAVar1 = NULL;
    if (gAudioManager.AudioListBool == 0) {
      pAVar1 = (Acmd *)CreateAudioList();
    }
    if ((pAVar1) && (gAudioManager.ACMDList < pAVar1)) {
      SetAudioTask((int)pAVar1);
      osSendMesg(gAudioManager.MesgQ_3,&gAudioManager.Task,1);
      osRecvMesg(&gAudioManager.mesgQ_2,apsStack32,1);
    }
  }
}

void AudioProcInit(void){
  u8 *base;

  ushort uVar3;
  u8 uVar4;
  uint uVar5;
  ALSynConfig AStack168;
  ALVoiceConfig aAStack104 [20];
  
  base = (u8 *)heapAlloc(0x12000,FILENAME,0x1f6);
  _bzero(base,0x12000);
  alHeapInit(&gAudioManager.ALHEAP,base,0x12000);
  
  AStack168.maxPVoices = 0x20;
  AStack168.maxUpdates = 0x60;
  AStack168.maxVVoices = 0;
  AStack168.dmaproc = _amDmaNew;
  AStack168.fxType = AL_FX_SMALLROOM;
  AStack168.outputrate = osAiSetFrequency(gAudioManager.frequency);
  AStack168.heap = &gAudioManager.ALHEAP;
  alInit(&gAudioManager.ALSYNTH,&AStack168);
  gAudioManager.ALPLAYER.next = NULL;
  gAudioManager.ALPLAYER.handler = soundVoiceHandler;
  gAudioManager.ALPLAYER.clientData = NULL;
  alSynAddPlayer(&gAudioManager.ALSYNTH,&gAudioManager.ALPLAYER);
  aAStack104[0].priority = 10;
  aAStack104[0].fxBus = 0;
  aAStack104[0].unityPitch = 0;
  gAudioManager.voicesAidyn = heapAlloc(sizeof(Voice_Aidyn)*32,FILENAME,0x20f);
  gAudioManager.indecies = heapAlloc(32,FILENAME,0x210);
  for(uVar4 = 0;uVar4 < 0x20;uVar4++) {
    alSynAllocVoice(&gAudioManager.ALSYNTH,&gAudioManager.voicesAidyn[uVar4].voice,aAStack104);
    gAudioManager.voicesAidyn[uVar4].wavetable.waveInfo = alHeapDBAlloc(NULL,0,&gAudioManager.ALHEAP,1,0xc);
    gAudioManager.voicesAidyn[uVar4].unk0x47 = 0;
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
  gAudioManager.unk0x326 = gAudioManager.unk0x324;
  gAudioManager.unk0x328 = gAudioManager.unk0x324 + 0x50;
  for(uVar4 = 0;uVar4 < 3;uVar4++) {
    gAudioManager.buffer_pointers[uVar4] = alHeapDBAlloc(NULL,0,&gAudioManager.ALHEAP,1,(uint)gAudioManager.unk0x328 << 2);
  }
  gAudioManager.audio_tally = 0;
  gAudioManager.buffer_choice = -1;
  gAudioManager.heap0x90 = alHeapDBAlloc(NULL,0,&gAudioManager.ALHEAP,1,0x5000);
  gAudioManager.heap0x90Mirror = gAudioManager.heap0x90;
  gAudioManager.ACMDList = alHeapDBAlloc(NULL,0,&gAudioManager.ALHEAP,1,0x4000);
  gAudioManager.AudioListBool = 0;
}

code * _amDmaNew(void){return dmaProc;}

short * dmaProc(short *param_1,s32 param_2,longlong param_3){
  byte bVar1;
  short *psVar2;
  int iVar3;
  
  if (param_3 == 2) {
    if (0x4fff < (int)((int)gAudioManager.heap0x90Mirror +
                      (param_2 * 2 - (int)gAudioManager.heap0x90))) {
      CRASH("audio.cpp, dmaProc()","Scale buffer overrun!");
    }
    iVar3 = param_2 + -1;
    psVar2 = gAudioManager.heap0x90Mirror;
    if (param_2 != 0) {
      do {
        bVar1 = *(byte *)param_1;
        param_1 = (short *)((int)param_1 + 1);
        iVar3 = iVar3 + -1;
        *psVar2 = (ushort)bVar1 << 8;
        psVar2 = psVar2 + 1;
      } while (iVar3 != -1);
    }
    param_1 = gAudioManager.heap0x90Mirror;
    gAudioManager.heap0x90Mirror = (short *)(((uint)psVar2 & ~7) + 8);
  }
  return param_1;
}
//redo this when "Voice_aidyn" struct is better understood.
u32 soundVoiceHandler(void){
  ushort uVar1;
  PVoice *pPVar2;
  uint *puVar3;
  undefined4 uVar4;
  u8 *puVar5;
  float fVar6;
  int iVar7;
  byte bVar8;
  undefined2 vol;
  uint uVar9;
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
        uVar9 = *(uint *)((pPVar2->decoder).state + 0xe);
        v->unk0x38 = uVar9;
        bVar8 = *(byte *)((int)(pPVar2->decoder).state + 0xb);
        v->unk0x46 = bVar8;
        if (bVar8 == 0) {
          if (uVar9 >= *(uint *)(v->unk0x30 + 8)) {
            gAudioManager.Voices_AidynCount--;
            gAudioManager.indecies[gAudioManager.Voices_AidynCount] = uVar11;
            v->flag = 2;
            v->unk0x47 = 0;
            v->unk0x38 = *(undefined4 *)(v->unk0x30 + 8);
          }
        }
      }
    }
    if ((v->flag & 2)) {
      alSynStopVoice(&gAudioManager.ALSYNTH,(ALVoice *)v);
      v->flag &= ~2;
    }
    if(v->flag & 4) {
      puVar3 = (uint *)v->unk0x30;
      *(undefined4 *)((((v->voice).pvoice)->decoder).state + 0xe) = v->unk0x38;
      if ((*puVar3 & 4) == 0) (v->wavetable).type = AL_FILTER_SET_SOURCE;
      else (v->wavetable).type = AL_FILTER_ADD_SOURCE;
      iVar7 = v->unk0x30;
      uVar4 = v->unk0x3c;
      (v->wavetable).ln = *(s32 *)(iVar7 + 4);
      **(undefined4 **)&(v->wavetable).waveInfo = uVar4;
      puVar5 = *(u8 **)(iVar7 + 0xc);
      *(undefined4 *)(*(int *)&(v->wavetable).waveInfo + 4) = v->unk0x40;
      bVar8 = v->unk0x46;
      uVar1 = v->pitch;
      (v->wavetable).base = puVar5;
      (v->wavetable).flags = 1;
      *(int *)(*(int *)&(v->wavetable).waveInfo + 8) = (int)(char)bVar8;
      fVar13 = (float)(uint)uVar1 / (float)gAudioManager.ALSYNTH.outputRate;
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
      uVar9 = (uint)bVar8 << 6;
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
      fVar14 = (float)(uint)v->pitch / (float)gAudioManager.ALSYNTH.outputRate;
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
      uVar9 = (uint)v->vol << 6;
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
  gAudioManager.heap0x90Mirror = gAudioManager.heap0x90;
  uVar2 = ((uint)gAudioManager.unk0x324 - (osAiGetLength() >> 2 & 0xffff)) + 0x50;
  gAudioManager.audioLength = (ushort)uVar2 & 0xfff0;
  if ((uVar2 & 0xfff0) < (uint)gAudioManager.unk0x326) {
    gAudioManager.audioLength = gAudioManager.unk0x326;
  }
  gAudioManager.AudiolistCount = 0;
  pAVar3 = alAudioFrame(gAudioManager.ACMDList,&gAudioManager.AudiolistCount,gAudioManager.buffer_pointers[gAudioManager.audio_tally],(uint)gAudioManager.audioLength);
  bVar1 = gAudioManager.audio_tally;
  if (0x7ff < gAudioManager.AudiolistCount) CRASH("audio.cpp, CreateAudioList()","Audio list overrun!");
  uVar2 = (gAudioManager.audio_tally + 1) / 3;
  gAudioManager.audio_tally = (gAudioManager.audio_tally + 1) - ((char)(uVar2 << 1) + (char)uVar2);
  gAudioManager.buffer_choice = bVar1;
  return pAVar3;
}

void SetAudioTask(int param_1){
  gAudioManager.Task.next = NULL;
  gAudioManager.Task.flags = NEEDS_RSP;
  gAudioManager.Task.list.Type = 2;
  gAudioManager.Task.list.flags = 0;
  gAudioManager.Task.list.ucode_boot = rspbootTextStart;
  gAudioManager.Task.list.ucode_boot_size = 0xd0;
  gAudioManager.Task.list.ucode = aspMainTextStart;
  gAudioManager.Task.list.ucode_data = aspMainTextStart;
  gAudioManager.Task.list.ucode_data_size = 0x800;
  gAudioManager.Task.list.dram_stack = NULL;
  gAudioManager.Task.list.dram_stack_size = 0;
  gAudioManager.Task.list.output_buff = NULL;
  gAudioManager.Task.list.output_buff_size = NULL;
  gAudioManager.Task.list.data_ptr = gAudioManager.ACMDList;
  gAudioManager.Task.list.data_size = param_1 - (int)gAudioManager.ACMDList;
  gAudioManager.Task.list.yeild_data_ptr = NULL;
  gAudioManager.Task.list.yeild_data_size = 0;
  gAudioManager.Task.msgQ = (OSMesgQueue *)((int)&gAudioManager + 0x2fc);
  gAudioManager.Task.msg = (OSMesg)((int)&gAudioManager + 0x2c0);
}

undefined2 Ofunc_8009a0fc(void){return gAudioManager.audioLength;}
s32 Ofunc_8009a108(void){return gAudioManager.AudiolistCount;}
int Ofunc_8009a114(void){return gAudioManager.heap0x90Mirror - (int)gAudioManager.heap0x90;}
u8 Ofunc_8009a12c(void){return 32 - gAudioManager.Voices_AidynCount;}