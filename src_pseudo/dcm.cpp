#include "SFX.h"

#define FILENAME "./src/dcm.cpp"

DCMManager gDCMManager={0};

void DCM::Init(void){
  gDCMManager.ALplayer.next = NULL;
  gDCMManager.ALplayer.handler = VoiceHandler;
  gDCMManager.ALplayer.clientData = NULL;
  ALLOCS(gDCMManager.DCMStructPointer,DCMMax*sizeof(DCM_struct),0xa6);
  memset(gDCMManager.DCMStructPointer,0,DCMMax*sizeof(DCM_struct));
  ALLOCS(gDCMManager.pointer_B,DCMMax,0xaa);
  for(u8 i=0;i<DCMMax;i++) {
    DCM_struct *pDVar1 = gDCMManager.DCMStructPointer + i;
    ALLOCS(pDVar1->ptr0,DCMMax*sizeof(DCM_sub),0xb2);
    memset(pDVar1->ptr0,0,DCMMax*sizeof(DCM_sub));
    pDVar1->active = 0;
    gDCMManager.pointer_B[i] = i;
  }
  gDCMManager.index = 0;
  AddPlayer(&gDCMManager.ALplayer);
}


bool DCM::Add(u8 *param_1,s32 *param_2,Borg12Sub *param_3,u8 vol,u8 pan,u8 param_6,s32 param_7,u8 param_8){
byte bVar1;
u32 uVar2;
bool bVar3;
u32 uVar4;
u32 uVar5;
u32 uVar6;
DCM_struct *pDVar7;

    if (gDCMManager.index < DCMMax) {
        bVar1 = gDCMManager.pointer_B[gDCMManager.index++];
        gDCMManager.Tally++;
        pDVar7 = gDCMManager.DCMStructPointer + bVar1;
        pDVar7->unk19 = 19;
        pDVar7->unk20 = 19;
        pDVar7->unkc = 0;
        pDVar7->byteIndex = 0;
        pDVar7->vol = vol;
        pDVar7->pan = pan;
        pDVar7->unk1d = param_6;
        pDVar7->unk1e = param_8;
        pDVar7->unk8 = param_7;
        uVar4 = param_3->channelCount;
        pDVar7->borg12 = param_3;
        uVar5 = 0;
        if (uVar4 != 0) {
            do {
            uVar6 = uVar5 + 1 & 0xff;
            pDVar7->ptr0[uVar5].timer = 0;
            uVar5 = uVar6;
            } while (uVar6 < uVar4);
        }
        uVar2 = gDCMManager.Tally;
        pDVar7->active = 2;
        pDVar7->id = uVar2;
        *param_1 = bVar1;
        bVar3 = true;
        *param_2 = pDVar7->id;
    }
    else {
        bVar3 = false;
        *param_1 = 0;
        *param_2 = 0;
    }
    return bVar3;
}



bool DCM::Start(u8 index,u32 id,byte vol){
  u32 uVar1;
  bool bVar2;
  DCM_sub *pDVar3;
  u8 uVar4;
  DCM_struct *pDVar5;
  
  pDVar5 = gDCMManager.DCMStructPointer + index;
  if (pDVar5->active == 2) {
    bVar2 = false;
    if (pDVar5->id == id) {
      pDVar5->vol = vol;
      uVar1 = pDVar5->borg12->channelCount;
      uVar4 = 0;
      if (uVar1 != 0) {
        pDVar3 = pDVar5->ptr0;
        while( true ) {
          pDVar3 = pDVar3 + uVar4;
          SetVoiceVol((u32)pDVar3->index,pDVar3->id,SQ((u32)pDVar3->vol)>>4);
          uVar4++;
          if (uVar1 <= uVar4) break;
          pDVar3 = pDVar5->ptr0;
        }
      }
      bVar2 = true;
    }
  }
  else bVar2 = false;
  return bVar2;
}


bool DCM::Pan(u8 param_1,u32 param_2,u8 param_3){
  char cVar2;
  
  DCM_struct *pDVar9 = gDCMManager.DCMStructPointer + param_1;
  if ((pDVar9->active == 2)&&(pDVar9->id == param_2)) {
    u8 i = 0;
    int iVar7 = param_3 - 0x80;
    int iVar3 = iVar7 * 2;
    if (iVar3 < 0) iVar3 = iVar7 * -2;
    iVar3 = (0xff - iVar3);
    pDVar9->pan = param_3;
    for(cVar2 = (char)(iVar3 >> 1);i<pDVar9->borg12->channelCount;i++) {
      DCM_sub *pabVar7 = pDVar9->ptr0 + i;
      s8 cVar5 = ((u32)pabVar7->pan * iVar3 >> 8);
      if (iVar7 < 0) cVar5 = (param_3 + cVar2) - cVar5;
      else cVar5 += param_3 - cVar2;
      SetVoicePan(pabVar7->index,pabVar7->id,cVar5);
    }
    return true;
  }
  return false;
}


bool DCM::SetField8(u8 param_1,u32 param_2,s32 param_3){
  if ((gDCMManager.DCMStructPointer[param_1].active == 2) &&
     (gDCMManager.DCMStructPointer[param_1].id == param_2)) {
    gDCMManager.DCMStructPointer[param_1].unk8 = param_3;
    gDCMManager.DCMStructPointer[param_1].unkc = 0;
    return true;
  }
  return false;
}


u8 DCM::search(u8 param_1,u32 id){
  u8 ret = 0;
  if (id == gDCMManager.DCMStructPointer[param_1].id)
    ret = gDCMManager.DCMStructPointer[param_1].active;
  return ret;
}

bool DCM::Remove(byte index,u32 id){
  bool bVar2;
  DCM_struct *pDVar5;
  
  pDVar5 = gDCMManager.DCMStructPointer + index;
  bVar2 = false;
  if ((pDVar5->active == 2) && (bVar2 = false, pDVar5->id == id)) {
    gDCMManager.index--;
    gDCMManager.pointer_B[gDCMManager.index] = index;
    pDVar5->active = 0;
    if (pDVar5->borg12->channelCount) {
      for(u8 i = 0;i<pDVar5->borg12->channelCount;i++) {
        StopVoice((u32)pDVar5->ptr0[i].index,pDVar5->ptr0[i].id);
      }
    }
    bVar2 = true;
  }
  return bVar2;
}

void DCM::StopAll(void){
  for(u8 i=0;i<DCMMax;i++) {
    DCM_struct *entry = gDCMManager.DCMStructPointer + i;
    if (entry->active == 2) {
      entry->active = 0;
      u32 chans = entry->borg12->channelCount;
      for(u8 j=0;j<chans;j++) {
        StopVoice(entry->ptr0[j].index,entry->ptr0[j].id);
      }
    }
  }
}

ALMicroTime DCM::VoiceHandler(void *p){
  Borg12Sub *pBVar2;
  s8 cVar3;
  s8 panByte;
  DCM_sub *pDVar7;
  s16 iVar8;
  int iVar9;
  u8 i;
  float fVar15;
  u8 uVar16;
  u8 uVar5;
  
  s16 uStack104[][2]={{0,0},{0,0x4000},{0,0xc000},{1,0xc000}};
  for(u8 i=0;i<DCMMax;i++){
    DCM_struct *pDVar10 = gDCMManager.DCMStructPointer + i;
    if (pDVar10->active == 2) {
      if (pDVar10->unk8 < 0) {
LAB_8009a7f0:
        if (pDVar10->unk20 < pDVar10->unk19) pDVar10->unk20++;
        else {
          pBVar2 = pDVar10->borg12;
          if (pBVar2->channelCount) {
            for(i=0; i<pBVar2->channelCount;i++){
              DCM_sub *pDVar7 = &pDVar10->ptr0[i];
              if (pDVar7->timer == 0) {
                u8 cmd = GetByte(pBVar2->channelDat + pDVar10->byteIndex++);
                if ((cmd & DCMCMD_Wait) == 0) {
                  u8 newVoice = cmd & DCMCMD_NewVoice;
                  if (cmd & DCMCMD_Pitch) {
                    u16 pitchH = GetShortLE(pBVar2->channelDat + pDVar10->byteIndex);
                    pDVar7->pitch = pitchH & 0x3fff;
                    pDVar10->byteIndex+=2;
                    pDVar7->pitch =
                         uStack104[pitchH >> 0xe][1] + (pDVar7->pitch << (u32)(pitchH >> 0xe));
                    if (!newVoice) SetVoicePitch((u32)pDVar7->index,pDVar7->id,pDVar7->pitch);
                  }
                  if (cmd & DCMCMD_Vol){
                    pDVar7->vol = GetByte(pBVar2->channelDat + pDVar10->byteIndex++);
                    pDVar7->vol = _sqrtf((float)pDVar7->vol);
                    if (!newVoice) SetVoiceVol(pDVar7->index,pDVar7->id,(SQ((u32)pDVar10->vol) >> 4));
                  }
                  if (cmd & DCMCMD_Pan){
                    pDVar7->pan = GetByte(pBVar2->channelDat + pDVar10->byteIndex);
                    iVar9 = pDVar10->pan - 0x80;
                    iVar8 = iVar9 * 2;
                    if (iVar8 < 0) iVar8 = iVar9 * -2;
                    pDVar10->byteIndex++;
                    iVar8 = (0xff - iVar8);
                    cVar3 = (iVar8 >> 1);
                    panByte = (char)((u32)pDVar7->pan * (iVar8) >> 8);
                    if (iVar9 < 0) panByte = (pDVar10->pan + cVar3) - panByte;
                    else panByte += pDVar10->pan - cVar3;
                    if (!newVoice) SetVoicePan((u32)pDVar7->index,pDVar7->id,panByte);
                  }
                  if (cmd & DCMCMD_ChanIndex)
                    pDVar7->chanInd = GetByte(pBVar2->channelDat + pDVar10->byteIndex++);
                  if (cmd & DCMCMD_Unk4) {
                    pDVar7->unk4 = GetByte(pBVar2->channelDat + pDVar10->byteIndex++);
                    pDVar7->unk4 <<= 8;
                  }
                  else pDVar7->unk4 = 0;
                  if (cmd & DCMCMD_Stop){
                    cmd = GetByte(pBVar2->channelDat + pDVar10->byteIndex++);
                    if (cmd & DCMCMD_Wait) StopVoice((u32)pDVar7->index,pDVar7->id);
                    if (cmd & DCMCMD_Pitch) {
                      pDVar10->unk19 = GetByte(pBVar2->channelDat + pDVar10->byteIndex++);
                      if (pDVar10->unk19) {
                        iVar8 = (u32)pDVar10->unk19 * 25;
                        pDVar10->unk19 = (char)(125000 / (u32)(iVar8 * 2)) - 1;
                      }
                    }
                    if (cmd & DCMCMD_Vol) pDVar10->byteIndex++;
                  }
                  if (newVoice){
                    StopVoice((u32)pDVar7->index,pDVar7->id);
                    iVar9 = pDVar10->pan - 0x80;
                    iVar8 = iVar9 * 2;
                    if (iVar8 < 0) iVar8 = iVar9 * -2;
                    iVar8 = (0xff - iVar8);
                    dcmStruct2 *chanDat = pBVar2->ptr0x18 + pDVar7->chanInd;
                    cVar3 = (iVar8 >> 1);
                    panByte = ((u32)pDVar7->pan * (iVar8) >> 8);
                    if (iVar9 < 0) panByte = (pDVar10->pan + cVar3) - panByte;
                    else panByte += pDVar10->pan - cVar3;
                    AddVoice(&pDVar7->index,&pDVar7->id,chanDat->instrumentDat,pDVar7->unk4,
                             chanDat->sampleStart,chanDat->sampleEnd,chanDat->unkc[3],pDVar7->pitch,
                             (SQ((u32)pDVar7->vol)>>4),panByte,pDVar10->unk1e);
                  }
                }
                else pDVar7->timer = (cmd & 0x7f) + 1;
              }
              else pDVar7->timer--;
            }
          }
          if (pDVar10->byteIndex < pBVar2->dataSize) pDVar10->unk20 = 0;
          else {
            if (pDVar10->unk1d == 0) {
              Remove((byte)i,pDVar10->id);
            }
            else {
              pDVar10->byteIndex = pBVar2->byteIndex;
              for(i=0;i<pBVar2->byteIndex;i++)
              if (pBVar2->channelCount != 0) {
                for(i=0;i<pBVar2->byteIndex;i++) {
                  pDVar7 = &pDVar10->ptr0[i];
                  StopVoice((u32)pDVar7->index,pDVar7->id);
                  pDVar7->timer = 0;
                }
                pDVar10->unk20 = 0;
                goto LAB_8009acc0;
              }
            }
            pDVar10->unk20 = 0;
          }
        }
LAB_8009acc0:
      }
      else {
        if ((int)pDVar10->unkc < pDVar10->unk8) {
          goto LAB_8009a7f0;
        }
        Remove(i,pDVar10->id);
      }
      pDVar10->unkc++;
    }
  }
  return MTIME;
}

//Load a byte from data stream
u8 DCM::GetByte(u8 *b){return *b;}

//load 16-bit little-endian value from stream
u16 DCM::GetShortLE(u8 *b){return (u16)b[1]<<8|b[0];}

//load 32-bit little-endian value from stream
u32 DCM::GetWordLE(u8 *b){return (u32)b[3]<<24|b[2]<<16|b[1]<<8|b[0];}