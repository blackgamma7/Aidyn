#include "globals.h"

#define FILENAME "./src/audiokey.cpp"

extern void* audiokey_rom;
audiokey_struct * load_audiokey(){
  audiokey_struct *key = (audiokey_struct *)HALLOC(sizeof(audiokey_struct),0x46);
  ROMCOPYS(key,&audiokey_rom,sizeof(audiokey_struct),0x48);
  key->a = (audiokeyEntryA *)set_pointer_offset(key,key->a);
  key->b = (audioKeyEntryB *)set_pointer_offset(key,key->b);
  key->c = (u16 *)set_pointer_offset(key,key->c);
  return key;
}

void Audiokey_free(audiokey_struct *key){
  if (key) HFREE(key,0x5c);
}

void FUN_8005bf10(playerData *pDat,audioKeyEntryB *UAS,u16 id1,u16 id2,u16 amp,byte vol,s8 pan
                 ,u8 *arr,byte arrsize,u16 type){
  u8 volf = (float)vol * gGlobals.VolSFX;
  if (volf) {
    for(u8 i=0;i<arrsize;i++) {
      audioKeyEntryB *puVar4 = UAS + arr[i];
      bool bVar1 = false;
      if (id1 == puVar4->id1) {
        u16 uVar2 = ((float)puVar4->unk0 / (float)0xFFFF) * (float)amp;
        if (uVar2 == 0) uVar2 = 1;
        bVar1 = false;
        if (uVar2 == id2) bVar1 = true;
      }
      if ((bVar1) && (puVar4->arrLen)) {
        DCMSub2 *pDVar3 = AllocPlayerAudio(pDat,puVar4,type,0);
        DCM::Add(&pDVar3->id,&pDVar3->index,&pDVar3->borg12->dat->sub,volf,pan,0,-1,0);
      }
    }
  }
}

extern u16 FUN_80090e68(playerData *);
bool FUN_8005c0f0(playerData *param_1,audiokey_struct *param_2,audiokeyEntryA *entryA,u16 param_4,u16 param_5,u16 param_6,u8 vol,u8 param_8){
  u16 uVar1;
  bool bVar6;
  u32 uVar3;
  u16 uVar2;
  DCMSub2 *pDVar5;
  audioKeyEntryB *EntryB;
  float fVar8;
  
  u8 vol8 = (float)vol * gGlobals.VolSFX;
  if (!vol8) return true;
  else {
    u16 i = 0;
    for(u16 i=0;i<entryA->unk2;i++){
        EntryB = param_2->b + param_2->c[entryA->unk4 + i];
        bVar6 = false;
        if (param_4 == EntryB->id1) {
          u16 uVar3 = ((float)EntryB->unk0 / (float)0xFFFF) * (float)param_6;
          if (uVar3 == 0) uVar3 = 1;
          bVar6 = false;
          if (uVar3 == param_5) bVar6 = true;
        }
        if (bVar6) {
          if (EntryB->arrLen == 0) uVar2 = FUN_80090e68(param_1);
          else {
            uVar2 = EntryB->arr[RAND.MultiByB(EntryB->arrLen)];
          }
          if (uVar2) {
            pDVar5 = AllocPlayerAudio(param_1,NULL,1,uVar2);
            DCM::Add(&pDVar5->id,&pDVar5->index,&pDVar5->borg12->dat->sub,vol8,param_8,0,-1,0);
            return true;
          }
          bVar6 = true;
        }
    }
    bVar6 = false;
  }
  return bVar6;
}


bool FUN_8005c2f0(playerData *param_1,u16 param_2,u8 param_3,u8 param_4){
  bool bVar2;
  if (param_1->movement_ == 0) return false;
  else {
    bVar2 = false;
    if (param_2 == param_1->movement_) {
      DCMSub2 *entry = AllocPlayerAudio(param_1,NULL,2,param_1->spellUsed);
      DCM::Add(&entry->id,&entry->index,&entry->borg12->dat->sub,param_3,param_4,0,-1,0);
      bVar2 = true;
      param_1->movement_ = 0;
      param_1->spellUsed = 0;
    }
    return bVar2;
  }
}

void player_audiokey(playerData *pDat,u16 id1,u16 id2,ushort amp){
  ushort uVar1;
  ushort uVar2;
  audiokeyEntryA *paVar3;
  u8 uVar7;
  u32 uVar8;
  double dVar9;
  vec3f pos;
  s8 bStack_28;
  u8 auStack_27 [1];
  
  paVar3 = (gGlobals.gameVars.PlayerHandler.audiokey)->a;
  if ((2 < pDat->Ground_type) || (false)) {
    pDat->Ground_Type_New = pDat->Ground_type;
  }
  Actor::GetPosOnLoadedMap(pDat,&pos);
  FUN_8005661c(&pos,15.0,&gCamera,&bStack_28,(s8 *)auStack_27);
  if (bStack_28 == 0) return;
  switch(paVar3[pDat->Ent_index].unk0){
    case 0:
    return;
    case 1:
    uVar7=bStack_28 * 0.5;
    break;
    case 2:
    uVar7=bStack_28 * 0.75;
    break;
    default:
    uVar7=bStack_28;
  }
  if (uVar7){
   switch(paVar3[pDat->Ent_index].unk0) {
   case 1:
   case 2:
    FUN_8005bf10(pDat,audioKeyEntryB_ARRAY_800ee9d0,id1,id2,amp,uVar7,auStack_27[0],
                 audiokey_unk1[pDat->Ground_Type_New],3,0);
    break;
   case 3:
    FUN_8005bf10(pDat,audioKeyEntryB_ARRAY_800ee9d0,id1,id2,amp,uVar7,auStack_27[0],
                 audiokey_unk2[pDat->Ground_Type_New],3,0);
    break;
   case 4:
    FUN_8005bf10(pDat,audioKeyEntryB_ARRAY_800ee9d0,id1,id2,amp,uVar7,auStack_27[0],
                 audiokey_unk3[pDat->Ground_Type_New],3,0);
    break;
   case 5:
    FUN_8005bf10(pDat,audioKeyEntryB_ARRAY_800ee9d0,id1,id2,amp,uVar7,auStack_27[0],
                 audiokey_unk4[pDat->Ground_Type_New],3,0);
   default:
   }
  }
  FUN_8005c0f0(pDat,gGlobals.gameVars.PlayerHandler.audiokey,paVar3 + pDat->Ent_index,id1,id2,amp,bStack_28,auStack_27[0]);
  FUN_8005c2f0(pDat,id1,bStack_28,auStack_27[0]);
}