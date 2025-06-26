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
  uint uVar3;
  ulonglong uVar2;
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
          if (uVar2 != 0) {
            pDVar5 = AllocPlayerAudio(param_1,NULL,1,(u16)uVar2);
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
audioKeyEntryB audioKeyEntryB_ARRAY_800ee9d0[]={{0},
 {65500,25,4,{24,25,26,27}},{65500,25,4,{36,37,38,39}},{65500,2,4,{36,37,38,39}},
 {65500,2,4,{24,25,26,27}},{65500,2,4,{8,9,10,11}},    {65500,2,4,{51,16,17,18}},
 {65500,2,4,{92,93,94,95}},{65500,2,4,{91,90,89,88}},  {65500,2,4,{40,41,42,43}},
 {65500,2,4,{53,57,58,59}},{65500,2,4,{84,85,86,87}},  {65500,2,4,{35,48,49,50}},
 {65500,2,4,{15,30,31,32}},{65500,3,4,{36,37,38,39}},  {65500,3,4,{28,29,30,31}},
 {65500,3,4,{8,9,10,11}},  {65500,3,4,{3,4,5,6}},      {65500,3,4,{51,16,17,18}},
 {65500,3,4,{92,93,94,95}},{65500,3,4,{91,90,89,88}},  {65500,3,4,{40,41,42,43}},
 {65500,3,4,{53,57,58,59}},{65500,3,4,{84,85,86,87}},  {65500,3,4,{35,48,49,50}},
 {65500,2,4,{68,69,70,71}},{65500,2,4,{19,56,0,1}},    {65500,2,4,{80,81,82,83}},
 {65500,2,4,{23,44,45,46}},{65500,2,4,{13,7,12,15}},   {65500,2,4,{72,73,74,75}},
 {65500,2,4,{76,77,78,79}},{65500,3,4,{68,69,70,71}},  {65500,3,4,{19,56,0,1}},
 {65500,3,4,{80,81,82,83}},{65500,3,4,{23,44,45,46}},  {65500,3,4,{13,7,12,15}},
 {65500,3,4,{72,73,74,75}},{65500,3,4,{76,77,78,79}},  {65500,2,4,{2,18,19,20}},
 {65500,2,4,{48,49,50,51}},{65500,2,4,{47,54,55,56}},  {65500,3,4,{63,62,61,60}},
 {65500,3,4,{2,20,21,22}}, {65500,3,4,{64,65,66,67}},  {65500,3,4,{47,54,55,56}},
 {65500,3,4,{63,62,61,60}},
};

u8 audiokey_unk1[][3]={
    {1,6,18},{1,0,0},{1,0,0},{1,4,16},{1,5,17},{1,6,18},{1,7,19},{1,8,20},{1,9,21},
    {1,10,22},{1,11,23},{1,12,24},{1,13,25},{1,14,26},{1,3,15},{1,4,16},{1,5,17},{1,6,18},
    {1,7,19},{1,8,20},{1,9,21},{1,10,22},{1,11,23},{1,12,24},{1,13,25},{1,14,26}
};
u8 audiokey_unk2[][3]={
  {0,28,35},{0},{0},{0,27,34},{0,28,35},{0,28,35},{0,29,36},{0,8,20},{0,33,40},{0,30,37},
  {0,31,38},{0,32,39},{0,33,40},{0,33,40},{0,3,15},{0,27,34},{0,28,35},{0,28,35},{0,29,36},
  {0,8,20},{0,30,37},{0,33,40},{0,30,37},{0,31,38},{0,32,39},{0,33,40},{0,33,40}
};
u8 audiokey_unk3[][3]={

};
u8 audiokey_unk4[][3]={

};

void player_audiokey(playerData *pDat,u16 id1,u16 id2,ushort amp){
  ushort uVar1;
  ushort uVar2;
  audiokeyEntryA *paVar3;
  audiokey_struct *paVar4;
  u8 (*pauVar5) [3];
  bool bVar6;
  u8 uVar7;
  uint uVar8;
  double dVar9;
  vec3f pos;
  s8 bStack_28;
  u8 auStack_27 [1];
  
  paVar4 = gGlobals.Sub.PlayerHandler.audiokey;
  paVar3 = (gGlobals.Sub.PlayerHandler.audiokey)->a;
  if ((2 < pDat->Ground_type) || (false)) {
    pDat->Ground_Type_New = pDat->Ground_type;
  }
  Actor::GetPosOnLoadedMap(pDat,&pos);
  FUN_8005661c(&pos,15.0,&gGlobals.Sub.camera,&bStack_28,(s8 *)auStack_27);
  if (bStack_28 == 0) return true;
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
  if (uVar7 == 0) goto switchD_8005c518_caseD_5;
  switch(paVar3[pDat->Ent_index].unk0) {
  case 1:
  case 2:
    pauVar5 = audiokey_unk1;
    break;
  case 3:
    pauVar5 = audiokey_unk2;
    break;
  case 4:
    pauVar5 = audiokey_unk3;
    break;
  case 5:
    FUN_8005bf10(pDat,audioKeyEntryB_ARRAY_800ee9d0,id1,id2,amp,uVar7,auStack_27[0],
                 audiokey_unk4[pDat->Ground_Type_New],3,0);
  default:
    goto switchD_8005c518_caseD_5;
  }
  FUN_8005bf10(pDat,audioKeyEntryB_ARRAY_800ee9d0,id1,id2,amp,uVar7,auStack_27[0],
               pauVar5[pDat->Ground_Type_New],3,0);
switchD_8005c518_caseD_5:
  FUN_8005c0f0(pDat,paVar4,paVar3 + pDat->Ent_index,id1,id2,amp,bStack_28,auStack_27[0]);
  FUN_8005c2f0(pDat,id1,bStack_28,auStack_27[0]);
}