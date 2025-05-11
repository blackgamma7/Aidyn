#include "globals.h"
//yes, what should be two seperate scripts, the heap functions use the same filename.
#define FILENAME "./src/audio.cpp"

struct Audio_manager gAudioManager;

void DCM::StartThread(OSSched *sched,u16 freq,u8 pri,u8 id){
  gAudioManager.sched = sched;
  gAudioManager.frequency = freq;
  ALLOCS(gAudioManager.ThreadStack,0x448,177);
  osCreateThread(&gAudioManager.Thread,(u32)id,audioProc,NULL,(void *)((int)gAudioManager.ThreadStack + 0x448),pri);
  osStartThread(&gAudioManager.Thread);
}

void DCM::ClosePlayer(void){
  gAudioManager.AudioListBool = 1;
  alSynRemovePlayer(&gAudioManager.ALSYNTH,&gAudioManager.ALPLAYER);
  alClose((ALGlobals*)&gAudioManager.ALSYNTH);
}

void DCM::AddPlayer(ALPlayer *x){alSynAddPlayer(&gAudioManager.ALSYNTH,x);}


u32 DCM::AddVoice(u8 *oIndex,u32 *oID,Borg11Data *istDat,u32 param_4,u32 len,u32 loopEnd,u8 loops,u16 pitch,u8 vol,u8 pan,u8 param_11){
  u8 bVar1;
  int iVar4;
  u8 flag;
  u8 uVar7;
  u32 uVar8;
  
  bVar1 = false;
  if (gAudioManager.VoicesUsed < PVoiceCount) {
    uVar8 = true;
    uVar7 = (u32)gAudioManager.indecies[gAudioManager.VoicesUsed++];
    gAudioManager.VoicesUsedTotal++;
  }
  else {
    s32 x=-1;
    if (param_11 == 0) {
      uVar7 = 0;
      uVar8 = 0;
    }
    else {
      uVar7 = 0;
      for(u8 i=0;i<PVoiceCount;i++) {
        if(gAudioManager.voicesAidyn[i].isActive==1){
          if (gAudioManager.voicesAidyn[i].id<x) {
            uVar7 = i;
            x=gAudioManager.voicesAidyn[i].id;
          }
        }
      }
      bVar1 = true;
      uVar8 = true;
      gAudioManager.VoicesUsedTotal++;
    }
  }
  if (uVar8) {
    gAudioManager.voicesAidyn[uVar7].loopCount = loops;
    gAudioManager.voicesAidyn[uVar7].instrumentData = istDat;
    gAudioManager.voicesAidyn[uVar7].unk0x38 = param_4;
    gAudioManager.voicesAidyn[uVar7].waveTableLength = len;
    gAudioManager.voicesAidyn[uVar7].loopEnd = loopEnd;
    gAudioManager.voicesAidyn[uVar7].vol = vol;
    gAudioManager.voicesAidyn[uVar7].pitch = pitch;
    gAudioManager.voicesAidyn[uVar7].pan = pan;
    if (bVar1) flag = VOICE_FLAG4|VOICE_STOP;
    else flag = VOICE_FLAG4;
    gAudioManager.voicesAidyn[uVar7].flag = flag;
    gAudioManager.voicesAidyn[uVar7].isActive = 1;
    gAudioManager.voicesAidyn[uVar7].id = gAudioManager.VoicesUsedTotal;
    gAudioManager.voicesAidyn[uVar7].unk0x4b = param_11;
    *oIndex = uVar7;
    *oID = gAudioManager.voicesAidyn[uVar7].id;
  }
  return uVar8;
}

u32 DCM::SetVoicePitch(u8 voice,u32 id,u16 p){
  u32 uVar4;
  
  if (gAudioManager.voicesAidyn[voice].isActive == 1) {
    uVar4 = false;
    if (gAudioManager.voicesAidyn[voice].id == id) {
      uVar4 = true;
      gAudioManager.voicesAidyn[voice].pitch = p;
      gAudioManager.voicesAidyn[voice].flag |= VOICE_SETPITCH;
    }
  }
  else uVar4 = false;
  return uVar4;
}


u32 DCM::SetVoiceVol(u8 voice,u32 id,byte vol){
  u32 ret;
  if (gAudioManager.voicesAidyn[voice].isActive == 1) {
    ret = 0;
    if (gAudioManager.voicesAidyn[voice].id == id) {
      gAudioManager.voicesAidyn[voice].vol = vol;
      ret = 1;
      gAudioManager.voicesAidyn[voice].flag|= VOICE_SETVOL;
    }
  }
  else ret = 0;
  return ret;
}

u32 DCM::SetVoicePan(u8 voice,u32 id,byte pan){
  u32 ret;
  if (gAudioManager.voicesAidyn[voice].isActive == 1) {
    ret = 0;
    if (gAudioManager.voicesAidyn[voice].id == id) {
      gAudioManager.voicesAidyn[voice].pan = pan;
      ret = 1;
      gAudioManager.voicesAidyn[voice].flag|= VOICE_SETPAN;
    }
  }
  else ret = 0;
  return ret;
}


u32 DCM::StopVoice(u8 voice,u32 id){
  u32 uVar1;
  
  if (gAudioManager.voicesAidyn[voice].isActive == 1) {
    uVar1 = 0;
    if (gAudioManager.voicesAidyn[voice].id == id) {
      gAudioManager.indecies[--gAudioManager.VoicesUsed] = voice;
      gAudioManager.voicesAidyn[voice].flag = VOICE_STOP;
      uVar1 = 1;
      gAudioManager.voicesAidyn[voice].isActive = 0;
    }
  }
  else uVar1 = 0;
  return uVar1;
}

u8 DCM::IsVoiceActive(u8 voice){return gAudioManager.voicesAidyn[voice].isActive;}
u32 DCM::GetVoiceID(u8 voice){return gAudioManager.voicesAidyn[voice].id;}
u32 DCM::GetUnk0x38(u8 voice){return gAudioManager.voicesAidyn[voice].unk0x38;}

void audioProc(void* p){
  Acmd *pAVar1;
  short *msg;
  
  ALLOCS(gAudioManager.OsMsgPtr0x74,(sizeof(OSMesg)*4),449);
  osCreateMesgQueue(&gAudioManager.mesgQ,gAudioManager.OsMsgPtr0x74,4);
  osCreateMesgQueue(&gAudioManager.mesgQ_2,&gAudioManager.OSmesg0x2e0,1);
  gAudioManager.MesgQ_3 = osScGetCmdQ(gAudioManager.sched);
  AudioProcInit();
  gAudioManager.taskMsg = 2;
  osScAddClient(gAudioManager.sched,&gAudioManager.Client,&gAudioManager.mesgQ);
  while(1) {
    do {
      osRecvMesg(&gAudioManager.mesgQ,(OSMesg*)&msg,1);
    } while (*msg != 1);
    pAVar1 = NULL;
    if (gAudioManager.AudioListBool == 0) pAVar1 = CreateAudioList();
    if ((pAVar1) && (gAudioManager.ACMDList < pAVar1)) {
      AudioSetTask(pAVar1);
      osSendMesg(gAudioManager.MesgQ_3,&gAudioManager.Task,1);
      osRecvMesg(&gAudioManager.mesgQ_2,(OSMesg*)&msg,1);
    }
  }
}

void AudioProcInit(void){
  u8 *base;

  u16 uVar3;
  u8 i;
  u32 uVar5;
  ALSynConfig synConf;
  ALVoiceConfig voiceConf;
  
  ALLOCS(base,ALHeapSize,502);
  bzero(base,ALHeapSize);
  alHeapInit(&gAudioManager.ALHEAP,base,ALHeapSize);
  
  synConf.maxPVoices = PVoiceCount;
  synConf.maxUpdates = 0x60;
  synConf.maxVVoices = 0;
  synConf.dmaproc = _amDmaNew;
  synConf.fxType = AL_FX_SMALLROOM;
  synConf.outputRate = osAiSetFrequency(gAudioManager.frequency);
  synConf.heap = &gAudioManager.ALHEAP;
  alInit((ALGlobals*)&gAudioManager.ALSYNTH,&synConf);
  gAudioManager.ALPLAYER.next = NULL;
  gAudioManager.ALPLAYER.handler = soundVoiceHandler;
  gAudioManager.ALPLAYER.clientData = NULL;
  alSynAddPlayer(&gAudioManager.ALSYNTH,&gAudioManager.ALPLAYER);
  voiceConf.priority = 10;
  voiceConf.fxBus = 0;
  voiceConf.unityPitch = 0;
  ALLOCS(gAudioManager.voicesAidyn,sizeof(Voice_Aidyn)*PVoiceCount,527);
  ALLOCS(gAudioManager.indecies,PVoiceCount,528);
  for(i = 0;i < PVoiceCount;i++) {
    alSynAllocVoice(&gAudioManager.ALSYNTH,&gAudioManager.voicesAidyn[i].voice,&voiceConf);
    gAudioManager.voicesAidyn[i].wavetable.waveInfo.rawWave.loop = 
      (ALRawLoop *)alHeapAlloc(&gAudioManager.ALHEAP,1,sizeof(ALRawLoop));
    gAudioManager.voicesAidyn[i].isActive = 0;
    gAudioManager.voicesAidyn[i].flag = 0;
    gAudioManager.indecies[i] = i;
  }
  gAudioManager.VoicesUsed = 0;
  gAudioManager.VoicesUsedTotal = 0;
  if (osTvType == OS_TV_NTSC) uVar3 = gAudioManager.frequency / 60;
  else if (osTvType == OS_TV_MPAL) uVar3 = gAudioManager.frequency / 60;
  else if (osTvType == OS_TV_PAL)uVar3 = gAudioManager.frequency / 50;
  else CRASH("audio.cpp, AudioProcInit()","Unknown osTvType");
  gAudioManager.unk0x324 = uVar3 + 1;
  if (gAudioManager.unk0x324 & 0xf) gAudioManager.unk0x324 = (gAudioManager.unk0x324 & 0xfff0) + 0x10;
  gAudioManager.audioLengthMin = gAudioManager.unk0x324;
  gAudioManager.bufferSize = gAudioManager.unk0x324 + 0x50;
  for(i = 0;i < 3;i++) {
    gAudioManager.buffer_pointers[i] = (s16*)alHeapAlloc(&gAudioManager.ALHEAP,1,(u32)gAudioManager.bufferSize << 2);
  }
  gAudioManager.audio_tally = 0;
  gAudioManager.buffer_choice = -1;
  gAudioManager.scaleBufferA = (u8*)alHeapAlloc(&gAudioManager.ALHEAP,1,0x5000);
  gAudioManager.scaleBufferB = gAudioManager.scaleBufferB;
  gAudioManager.ACMDList = (Acmd *)alHeapAlloc(&gAudioManager.ALHEAP,1,sizeof(Acmd)*0x800);
  gAudioManager.AudioListBool = 0;
}

void * _amDmaNew(void){return dmaProc;}

u8 * dmaProc(byte *param_1,s32 param_2,s32 param_3){
  byte bVar1;
  byte *pbVar2;
  int iVar3;
  
  if (param_3 == 2) {
    if (0x4fff < (int)(gAudioManager.scaleBufferB + (param_2 * 2 - (int)gAudioManager.scaleBufferA)))
      CRASH("audio.cpp, dmaProc()","Scale buffer overrun!");
    iVar3 = param_2 + -1;
    pbVar2 = gAudioManager.scaleBufferB;
    if (param_2) {
      do {
        bVar1 = *param_1;
        param_1++;
        iVar3--;
        *(u16 *)pbVar2 = (u16)bVar1 << 8;
        pbVar2+=2;
      } while (iVar3 != -1);
    }
    param_1 = gAudioManager.scaleBufferB;
    gAudioManager.scaleBufferB = (byte *)(((uint)pbVar2 & 0xfffffff8) + 8);
  }
  return param_1;
}

ALMicroTime soundVoiceHandler(void* p){
  u16 uVar1;
  u32 *puVar3;
  u32 uVar12;
  u8 *puVar5;
  int iVar7;
  byte bVar8;
  u16 vol;
  u32 uVar9;
  ALPan AVar13;
  s16 vol_00;
  u8 bVar1;
  float fVar12;
  float fVar13;
  float fVar14;
  
  iVar7 = 0;
  for(u8 i=0;i<PVoiceCount;i++){
    Voice_Aidyn *v = &gAudioManager.voicesAidyn[i];
    if ((v->isActive == 1) && !(v->flag & VOICE_FLAG4)) {
      PVoice_s* pPVar2 = (v->voice).pvoice;
      uVar9 = *(u32 *)((pPVar2->decoder).state + 0xe);
      v->unk0x38 = uVar9;
      bVar8 = *(byte *)((int)(pPVar2->decoder).state + 0xb);
      v->loopCount = bVar8;
      if (bVar8 == 0) {
        if (uVar9 >= v->instrumentData->samples) {
          gAudioManager.VoicesUsed--;
          gAudioManager.indecies[gAudioManager.VoicesUsed] = i;
          v->flag = VOICE_STOP;
          v->isActive = 0;
          v->unk0x38 = v->instrumentData->samples;
        }
      }
    }
    if ((v->flag & VOICE_STOP)) {
      alSynStopVoice(&gAudioManager.ALSYNTH,&v->voice);
      v->flag &= ~VOICE_STOP;
    }
    if(v->flag & VOICE_FLAG4) {
      *(undefined4 *)((((v->voice).pvoice)->decoder).state[0] + 0xe) = v->unk0x38; //?
      if ((v->instrumentData->flag & 4)) (v->wavetable).type = 2;
      else (v->wavetable).type = 1;
      (v->wavetable).len = v->instrumentData->len;
      (v->wavetable).waveInfo.adpcmWave.loop->start = v->waveTableLength;
      (v->wavetable).waveInfo.adpcmWave.loop->end = v->loopEnd;
      (v->wavetable).base = v->instrumentData->wav;
      (v->wavetable).flags = 1;
      (v->wavetable).waveInfo.adpcmWave.loop->count = v->loopCount;
      f32 fVar15 = (float)v->pitch / (float)gAudioManager.ALSYNTH.outputRate;
      fVar14 = 0.0;
      f32 fVar16 = fVar14;
      if (((fVar15 <= 0.0) || (fVar16 = 2.0f, 2.0f < fVar15)) ||
         (fVar16 = fVar15, 0.0 < fVar15)) {
        fVar14 = fVar16;
      }
      uVar12 = v->vol << 6;
      if ((v->vol == 0) || (vol_00 = 0x7fff, uVar12 < 0x8000)) {
        vol_00 = (s16)uVar12;
      }
      bVar1 = v->pan >> 1;
      if ((bVar1 == 0) || (AVar13 = 0x7f, bVar1 < 0x80)) {
        AVar13 = bVar1;
      }
      alSynStopVoice(&gAudioManager.ALSYNTH,&v->voice);
      alSynStartVoiceParams(&gAudioManager.ALSYNTH,&v->voice,&v->wavetable,fVar14,vol_00,AVar13,0,MTIME);
      v->flag &= ~VOICE_FLAG4;
    }
    if (v->flag & VOICE_SETPITCH){
      float fVar16 = (float)v->pitch / (float)gAudioManager.ALSYNTH.outputRate;
      if (0.0 < fVar16) {
        fVar14 = 2.0f;
        if ((fVar16 <= 2.0) && (fVar14 = fVar16, fVar16 <= 0.0)) {
          fVar14 = 0.0;
        }
      }
      else fVar14 = 0.0;
      alSynSetPitch(&gAudioManager.ALSYNTH,&v->voice,fVar14);
      v->flag &= ~VOICE_SETPITCH;
    }
    if ((v->flag & VOICE_SETVOL)){
      uVar12 = (uint)v->vol << 6;
      if ((v->vol == 0) || (vol = 0x7fff, uVar12 < 0x8000)) {
        vol = (short)uVar12;
      }
      alSynSetVol(&gAudioManager.ALSYNTH,&v->voice,vol,MTIME);
      v->flag &= ~VOICE_SETVOL;
    }
    if (v->flag & VOICE_SETPAN){
      bVar1 = v->pan >> 1;
      if ((bVar1 == 0) || (AVar13 = 0x7f, bVar1 < 0x80)) {
        AVar13 = bVar1;
      }
      alSynSetPan(&gAudioManager.ALSYNTH,&v->voice,AVar13);
      v->flag &= ~VOICE_SETPAN;
    }
  }
  return MTIME;
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
  gAudioManager.audioLength = (u16)uVar2 & 0xfff0;
  if ((uVar2 & 0xfff0) < (u32)gAudioManager.audioLengthMin) {
    gAudioManager.audioLength = gAudioManager.audioLengthMin;
  }
  gAudioManager.AudiolistCount = 0;
  pAVar3 = alAudioFrame(gAudioManager.ACMDList,&gAudioManager.AudiolistCount,gAudioManager.buffer_pointers[gAudioManager.audio_tally],(u32)gAudioManager.audioLength);
  bVar1 = gAudioManager.audio_tally;
  if (ACMDSize <= gAudioManager.AudiolistCount) CRASH("audio.cpp, CreateAudioList()","Audio list overrun!");
  uVar2 = (gAudioManager.audio_tally + 1) / 3;
  gAudioManager.audio_tally = (gAudioManager.audio_tally + 1) - ((char)(uVar2 << 1) + (char)uVar2);
  gAudioManager.buffer_choice = bVar1;
  return pAVar3;
}

void AudioSetTask(Acmd *param_1){
  gAudioManager.Task.list.t.ucode_boot = (u64*)&rspbootTextStart;
  gAudioManager.Task.list.t.ucode_boot_size = sizeof(rspbootTextStart);
  gAudioManager.Task.list.t.ucode = (u64*)&aspMainTextStart;
  gAudioManager.Task.list.t.ucode_data_size = 0x800;
  gAudioManager.Task.list.t.ucode_data = (u64*)&aspMainDataStart;
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

u16 Ofunc_8009a0fc(void){return gAudioManager.audioLength;}
s32 Ofunc_8009a108(void){return gAudioManager.AudiolistCount;}
void* Ofunc_8009a114(void){return (void*)((s32)gAudioManager.scaleBufferB - (s32)gAudioManager.scaleBufferA);}
u8 Ofunc_8009a12c(void){return PVoiceCount - gAudioManager.VoicesUsed;}