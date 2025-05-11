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
uint uVar4;
uint uVar5;
uint uVar6;
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
  uint uVar1;
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
          SetVoiceVol((uint)pDVar3->index,pDVar3->id,SQ((u32)pDVar3->vol)>>4);
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


bool DCM::Pan(u8 param_1,u32 param_2,u8 param_3)

{
  uint uVar1;
  char cVar2;
  bool bVar4;
  int iVar3;
  char cVar5;
  DCM_sub *pDVar6;
  int iVar7;
  DCM_sub *pabVar7;
  uint uVar8;
  DCM_struct *pDVar9;
  
  pDVar9 = gDCMManager.DCMStructPointer + param_1;
  if (pDVar9->active == 2) {
    bVar4 = false;
    if (pDVar9->id == param_2) {
      uVar8 = 0;
      iVar7 = param_3 - 0x80;
      iVar3 = iVar7 * 2;
      if (iVar3 < 0) {
        iVar3 = iVar7 * -2;
      }
      iVar3 = (0xff - iVar3) * 0x10000;
      pDVar9->pan = param_3;
      uVar1 = pDVar9->borg12->channelCount;
      if (uVar1 != 0) {
        cVar2 = (char)(iVar3 >> 0x11);
        pDVar6 = pDVar9->ptr0;
        while( true ) {
          pabVar7 = pDVar6 + uVar8;
          cVar5 = (char)((uint)pabVar7->pan * (iVar3 >> 0x10) >> 8);
          if (iVar7 < 0) {
            cVar5 = (param_3 + cVar2) - cVar5;
          }
          else {
            cVar5 += param_3 - cVar2;
          }
          SetVoicePan((uint)pabVar7->index,pabVar7->id,cVar5);
          uVar8 = uVar8 + 1 & 0xff;
          if (uVar1 <= uVar8) break;
          pDVar6 = pDVar9->ptr0;
        }
      }
      bVar4 = true;
    }
  }
  else {
    bVar4 = false;
  }
  return bVar4;
}


bool DCM::SetField8(u8 param_1,u32 param_2,s32 param_3){
  DCM_struct *pDVar1 = gDCMManager.DCMStructPointer;
  if ((gDCMManager.DCMStructPointer[param_1].active == 2) &&
     (gDCMManager.DCMStructPointer[param_1].id == param_2)) {
    gDCMManager.DCMStructPointer[param_1].unk8 = param_3;
    pDVar1[param_1].unkc = 0;
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
  uint uVar1;
  bool bVar2;
  DCM_sub *pDVar3;
  u8 uVar4;
  DCM_struct *pDVar5;
  
  pDVar5 = gDCMManager.DCMStructPointer + index;
  bVar2 = false;
  if ((pDVar5->active == 2) && (bVar2 = false, pDVar5->id == id)) {
    gDCMManager.index -= 1;
    gDCMManager.pointer_B[gDCMManager.index] = index;
    pDVar5->active = 0;
    uVar1 = pDVar5->borg12->channelCount;
    uVar4 = 0;
    if (uVar1 != 0) {
      pDVar3 = pDVar5->ptr0;
      while( true ) {
        StopVoice((uint)pDVar3[uVar4].index,pDVar3[uVar4].id);
        uVar4++;
        if (uVar1 <= uVar4) break;
        pDVar3 = pDVar5->ptr0;
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
      if (chans) {
        for(u8 j=0;j<chans;j++) {
          StopVoice(entry->ptr0[j].index,entry->ptr0[j].id);
        }
      }
    }
  }
}


ALMicroTime DCM::VoiceHandler(void *p){
  Borg12Sub *pBVar2;
  s8 cVar3;
  u8 cmd;
  u16 uVar4;
  s8 cVar6;
  DCM_sub *pDVar7;
  int iVar8;
  int iVar9;
  astruct *pauVar13;
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
                cmd = GetByte(pBVar2->channelDat + pDVar10->byteIndex++);
                if ((cmd & 0x80) == 0) {
                  u8 uVar12 = cmd & DCMCMD_SetNow;
                  if (cmd & DCMCMD_Pitch) {
                    uVar4 = GetShortLE(pBVar2->channelDat + pDVar10->byteIndex);
                    pDVar7->pitch = uVar4 & 0x3fff;
                    pDVar10->byteIndex+=2;
                    pDVar7->pitch =
                         uStack104[uVar4 >> 0xe][1] + (pDVar7->pitch << (uint)(uVar4 >> 0xe));
                    if (uVar12 == 0) SetVoicePitch((uint)pDVar7->index,pDVar7->id,pDVar7->pitch);
                  }
                  if (cmd & DCMCMD_Vol){
                    pDVar7->vol = GetByte(pBVar2->channelDat + pDVar10->byteIndex++);
                    pDVar7->vol = _sqrtf((float)pDVar7->vol);
                    if (uVar12 == 0) SetVoiceVol(pDVar7->index,pDVar7->id,(SQ((u32)pDVar10->vol) >> 4));
                  }
                  if (cmd & DCMCMD_Pan){
                    pDVar7->pan = GetByte(pBVar2->channelDat + pDVar10->byteIndex);
                    iVar9 = pDVar10->pan - 0x80;
                    iVar8 = iVar9 * 2;
                    if (iVar8 < 0) iVar8 = iVar9 * -2;
                    pDVar10->byteIndex++;
                    iVar8 = (0xff - iVar8) * 0x10000;
                    cVar3 = (char)(iVar8 >> 0x11);
                    cVar6 = (char)((uint)pDVar7->pan * (iVar8 >> 0x10) >> 8);
                    if (iVar9 < 0) cVar6 = (pDVar10->pan + cVar3) - cVar6;
                    else cVar6 += pDVar10->pan - cVar3;
                    if (uVar12 == 0) SetVoicePan((uint)pDVar7->index,pDVar7->id,cVar6);
                  }
                  if (cmd & DCMCMD_UnkB)
                    pDVar7->unkb = GetByte(pBVar2->channelDat + pDVar10->byteIndex++);
                  if (cmd & DCMCMD_Unk4) {
                    uVar5 = GetByte(pBVar2->channelDat + pDVar10->byteIndex);
                    pDVar7->unk4 = (int)(char)uVar5;
                    pDVar10->byteIndex++;
                    pDVar7->unk4 = pDVar7->unk4 << 8;
                  }
                  else pDVar7->unk4 = 0;
                  if (cmd & DCMCMD_Stop){
                    cmd = GetByte(pBVar2->channelDat + pDVar10->byteIndex++);
                    if (cmd & DCMCMD_Wait) StopVoice((uint)pDVar7->index,pDVar7->id);
                    if (cmd & DCMCMD_Pitch) {
                      pDVar10->unk19 = GetByte(pBVar2->channelDat + pDVar10->byteIndex++);
                      if (pDVar10->unk19) {
                        iVar8 = (uint)pDVar10->unk19 * 24 + (uint)pDVar10->unk19;
                        pDVar10->unk19 = (char)(125000 / (uint)(iVar8 * 2)) - 1;
                      }
                    }
                    if (cmd & DCMCMD_Vol) pDVar10->byteIndex++;
                  }
                  if (uVar12){
                    StopVoice((uint)pDVar7->index,pDVar7->id);
                    iVar9 = pDVar10->pan - 0x80;
                    iVar8 = iVar9 * 2;
                    if (iVar8 < 0) iVar8 = iVar9 * -2;
                    iVar8 = (0xff - iVar8) * 0x10000;
                    pauVar13 = pBVar2->ptr0x18 + pDVar7->unkb;
                    cVar3 = (short)(iVar8 >> 0x11);
                    cVar6 = ((uint)pDVar7->pan * (iVar8 >> 0x10) >> 8);
                    if (iVar9 < 0) cVar6 = (pDVar10->pan + cVar3) - cVar6;
                    else cVar6 += pDVar10->pan - cVar3;
                    AddVoice(&pDVar7->index,&pDVar7->id,pauVar13->instrumentDat,pDVar7->unk4,
                             pauVar13->unk4,pauVar13->unk8,pauVar13->unkf,pDVar7->pitch,
                             (SQ((u32)pDVar7->vol)>>4),cVar6,pDVar10->unk1e);
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
                  StopVoice((uint)pDVar7->index,pDVar7->id);
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
  return 1000;
}

//Load a byte from data stream
u8 DCM::GetByte(u8 *b){return *b;}

//load 16-bit little-endian value from stream
u16 DCM::GetShortLE(u8 *b){return (u16)b[1]<<8|b[0];}

//load 32-bit little-endian value from stream
u32 DCM::GetWordLE(u8 *b){return (u32)b[3]<<24|b[2]<<16|b[1]<<8|b[0];}