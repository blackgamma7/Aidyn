#include "globals.h"
//yes, what should be two seperate scripts, the heap functions use the same filename.
#define FILENAME "./src/audio.cpp"

#define BZERO(p) bzero(p,sizeof(*p))

void adjust_soundstruct_vec3(SoundStructA *param_1){
  vec2f temp;
  
  copyVec3(&param_1->voxel->header.pos,&param_1->worldPos);
  get_mapcellsize(param_1->zoneDatByte,&temp);
  (param_1->worldPos).x += temp.x;
  (param_1->worldPos).z += temp.y;
}

void set_SFX_ZoneDatByte(SFX_Struct *param_1,s16 param_2,s16 param_3){
  for (s16 i=0;i<SoundObjCount;i++) {
    if (param_1->pointerA[i].unk13) {
      param_1->pointerA[i].zoneDatByte = get_zoneDatByte(param_2,param_3,param_1->pointerA[i].zoneDatByte);
      adjust_soundstruct_vec3(&param_1->pointerA[i]);
    }
  }
}

void SoundStructA_get_borg12(SoundStructA *param_1){  
  if (!param_1->borg12) {
    param_1->borg12 = load_borg_12(param_1->voxelDat->borg12Index);
  }
}

void ClearAudioBubble(SoundStructA *param_1){
if (param_1->borg12) {
    DCM::Remove(param_1->voxelDat->dcmIndex,param_1->voxelDat->dcmId);
    AllocFreeQueueItem(&gGlobals.QueueA,&param_1->borg12,8,0);
    param_1->borg12 = NULL;
    param_1->voxelDat->dcmIndex = 0;
    param_1->voxelDat->dcmId = 0;
    param_1->flag|= 1;
  }
}

void init_sfx_struct(SFX_Struct *param_1){
  s16 i;
  BZERO(param_1);
  param_1->active = 1;
  ALLOCS(param_1->pointerA,sizeof(SoundStructA)*SoundObjCount,162);
  bzero(param_1->pointerA,sizeof(SoundStructA)*SoundObjCount);
  ALLOCS(param_1->pointerB,sizeof(SoundStructB)*16,165);
  bzero(param_1->pointerB,sizeof(SoundStructB)*16);
  for(i=0;i<SoundObjCount;i++) {
    param_1->shortArrayA[i]=i;
    param_1->pointerA[i].index=i;
  }
  param_1->pointerAIndex=0;
  for(i=0;i<16;i++){
    param_1->shortArrayB[i]=i;
    param_1->pointerB[i].index=i;
  }
  param_1->pointerBIndex = 0;
}

void SoundStructA_remove(SFX_Struct *param_1,SoundStructA *param_2){  
  if (param_2->unk13) {
    ClearAudioBubble(param_2);
    param_1->shortArrayA[--param_1->pointerAIndex] = param_2->index;
    BZERO(param_2);
    param_2->index = param_2->index;
  }
}

SoundStructA * soundStructA_set(SFX_Struct *param_1,voxelObject *param_2,int tally,byte zonedat){
  SoundStructA *obj = param_1->pointerA + param_1->shortArrayA[param_1->pointerAIndex++];
  BZERO(obj);
  obj->voxel = param_2;
  obj->unk13 = true;
  obj->flag = 1;
  obj->mapTally = tally;
  obj->zoneDatByte = zonedat;
  obj->voxelDat = &param_2->audio;
  obj->index = obj->index;
  (param_2->audio).dcmIndex = 0;
  (param_2->audio).unk24 = obj->index;
  obj->voxelDat->dcmId = 0;
  obj->voxelDat->volumeFade = 0.0;
  obj->voxelDat->pan = obj->voxelDat->field1_0x4;
  adjust_soundstruct_vec3(obj);
  return obj;
}

SoundStructB* PlayAudioSound(SFX_Struct *param_1,Borg12Enum borg12,undefined4 pan,float vol,short param_5,u16 time){

  SoundStructB *obj;
  if (param_1->pointerBIndex < 16) {
    obj = param_1->pointerB + param_1->shortArrayB[param_1->pointerBIndex++];
    BZERO(&obj->voxel);
    (obj->voxel).header.type = VOXEL_Audio;
    (obj->voxel).audio.borg12Index = borg12;
    (obj->voxel).audio.field1_0x4 = 0;
    obj->active = true;
    obj->timer = param_5;
    (obj->voxel).header.flagC = 1;
    (obj->voxel).audio.soundFlag = 0xc;
    (obj->voxel).audio.volume = gGlobals.VolSFX;
    (obj->voxel).header.size = 1000.0f;
    obj->soundStruct = soundStructA_set(param_1,&obj->voxel,0,0);
    (obj->voxel).audio.pan = pan;
    (obj->voxel).audio.volumeFade = vol;
    if (time) {
      obj->timer = time + obj->timer;
      obj->soundStruct->timer = time;
      obj->soundStruct->flag |= 2;
    }
  }
  else obj = NULL;
  return obj;
}

void FreeAudioSound(SFX_Struct *param_1,SoundStructB *param_2){
  if (param_2->active) {
    if (!param_1->pointerBIndex) CRASH("FreeAudioSound","Free'ing too many sounds!");
    param_1->shortArrayB[--param_1->pointerBIndex] = param_2->index;
    SoundStructA_remove(param_1,param_2->soundStruct);
    param_2->soundStruct = NULL;
    param_2->active = 0;
    param_2->timer = 0;
  }
}

//TODO: clear_sfx_substruct_2()


void play_sfx_before_delete(SFX_Struct *param_1,SoundStructA *param_2){
  audio_obj_dat* a = param_2->voxelDat;
  if (((a) && ((a->soundFlag & 0x10))) && (param_2->mapTally)) {
    SoundStructB *objB = PlayAudioSound(param_1,a->borg12Index,a->pan,a->volumeFade,1,0);
    objB->timer = 2;
    objB->soundStruct->mapTally = -2;
    objB->voxel=*param_2->voxel;
    objB->soundStruct->borg12 = param_2->borg12;
    adjust_soundstruct_vec3(objB->soundStruct);
    a = param_2->voxelDat;
    a->dcmIndex = 0;
    a->dcmId = 0;
    param_2->borg12 = NULL;
  }
}

SoundStructB * get_audio_substruct_2_by_index(SFX_Struct *param_1,u16 param_2){
  int iVar1;
  SoundStructB *pSVar2;
  u16 uVar3=0;
  
  iVar1 = 0;
  for(u16 i=0;i<16;i++){
    SoundStructB* s=&param_1->pointerB[i];
    if((s->active)&&(s->soundStruct->mapTally == -2)&&(s->soundStruct->voxelDat->borg12Index==param_2))
    return s;
  }
  return NULL;
}


void Ofunc_80055fc0(SFX_Struct *param_1){
  for(u16 i=0;i<16;i++) {
    SoundStructB *pSVar1 = &param_1->pointerB[i];
    if ((pSVar1->active) &&(pSVar1->soundStruct->mapTally == -2))
      pSVar1->timer = 0x7ffe;
  }
}

void audio_ref_objs(SFX_Struct *param_1,Borg9data *param_2,uint tally,byte ZoneDat){
  audio_obj_dat *paVar2;
  SoundStructA *pSVar3;
  audio_obj_dat *paVar4;
  u32 uVar5;
  SoundStructA *pSVar6;
  SoundStructB *pSVar7;
  int iVar8;
  voxelObject *obj;
  int iVar10;
  undefined4 uVar11;
  
  if (param_2->voxelObjCount) {
    for(s16 iVar9=0;iVar9<param_2->voxelObjCount;iVar9++) {
      obj = &param_2->voxelObjs[iVar9];
      if ((obj->header).type == VOXEL_Audio) {
        if (gGlobals.Sub.gamemodeType == 2) {
          if ((((obj->audio).soundFlag & 0x10)) || (!gExpPakFlag)) continue;
        }
        if (((((obj->header).Bitfeild & VOXEL_EXPPak) == 0) || (gExpPakFlag)) &&
           ((((obj->header).Bitfeild & VOXEL_JumperPak) == 0 || (!gExpPakFlag)))) {
          pSVar6 = soundStructA_set(param_1,obj,tally,ZoneDat);
          pSVar7 = get_audio_substruct_2_by_index(param_1,*(u16 *)((int)(&param_2->voxelObjs->header + 1) + iVar9 + 2));
          if (pSVar7) {
            paVar2 = pSVar7->soundStruct->voxelDat;
            pSVar6->borg12 = pSVar7->soundStruct->borg12;
            pSVar6->voxelDat->dcmIndex = paVar2->dcmIndex;
            pSVar3 = pSVar7->soundStruct;
            paVar2 = pSVar3->voxelDat;
            paVar4 = pSVar6->voxelDat;
            paVar4->volumeFade = paVar2->volumeFade;
            pSVar6->timer = 2000;
            pSVar3->borg12 = NULL;
            paVar4->dcmId = paVar2->dcmId;
            paVar2->dcmId = 0;
            paVar4->pan = paVar2->pan;
            paVar2->dcmIndex = 0;
            FreeAudioSound(param_1,pSVar7);
          }
        }
      }
    }
  }
}

void clear_sfx_entries(SFX_Struct *param_1,short param_2){  
  clear_sfx_substruct_2(param_1,1);
  for(s16 i=0;i<SoundObjCount;i++){
    SoundStructA *pSVar2 = &param_1->pointerA[i];
    if ((!param_2) || (pSVar2->mapTally != -2)) {
      play_sfx_before_delete(param_1,pSVar2);
      SoundStructA_remove(param_1,pSVar2);
    }
  }
}

void sfx_struct_free(SFX_Struct *param_1){
  param_1->active = 0;
  clear_sfx_substruct_2(param_1,0);
  clear_sfx_entries(param_1,0);
  FREE(param_1->pointerA,0x20f);
  param_1->pointerAIndex = 0;
  FREE(param_1->pointerB,0x213);
  param_1->pointerBIndex = 0;
}

void clear_sfx_on_map(SFX_Struct *param_1,int tally){
  for(s16 i=0;i<SoundObjCount;i++){
    SoundStructA *obj = &param_1->pointerA[i];
    if (obj->mapTally == tally) {
      play_sfx_before_delete(param_1,obj);
      SoundStructA_remove(param_1,obj);
    }
  }
}

void render_auido_voxel(SoundStructA *param_1){
  audio_obj_dat *paVar1;
  byte vol;
  u8 uVar2;
  bool bVar3;
  short sVar4;
  ushort uVar5;
  u8 in_a2_lo;
  int iVar6;
  float fVar7;
  
  if (param_1->borg12) {
    paVar1 = param_1->voxelDat;
    iVar6 = ((paVar1->volumeFade * paVar1->volume) * 255.0);
    sVar4 = (((paVar1->pan + 1.0f) * 0.5f) * 255.0);
    if (iVar6 < 0) iVar6 = 0;
    if (0xff < iVar6) iVar6 = 0xff;
    if (sVar4 < 0) sVar4 = 0;
    if (0xff < sVar4) sVar4 = 0xff;
    fVar7 = gGlobals.VolSFX;
    if (((param_1->voxel->audio).soundFlag & 0x10))
      fVar7 = gGlobals.VolBGM;
    uVar2 = DCM::search(paVar1->dcmIndex,paVar1->dcmId);
    vol = (byte)(int)((float)iVar6 * fVar7);
    if (uVar2 == 0) {

      if ((run_voxelFuncs2(param_1->voxel,0)) && (uVar5 = param_1->flag & 0xfffe, (param_1->flag & 1) != 0)) {
        param_1->flag = uVar5;
        bVar3 = (param_1->voxelDat->soundFlag & 1) != 0;
        if (bVar3) {
          param_1->flag = uVar5 | 1;
        }
        DCM::Add(&param_1->voxelDat->dcmIndex,(int *)&param_1->voxelDat->dcmId,
                 &param_1->borg12->dat->sub,vol,(u8)sVar4,bVar3,2000,0);
      }
    }
    else {
      DCM::SetField8(param_1->voxelDat->dcmIndex,param_1->voxelDat->dcmId,-1);
      DCM::Start(param_1->voxelDat->dcmIndex,param_1->voxelDat->dcmId,vol);
      DCM::Pan(param_1->voxelDat->dcmIndex,param_1->voxelDat->dcmId,(u8)sVar4);
    }
  }
}

float Sound_Volume_proximity(vec3f *pos,float vol,Camera_struct *cam){
  return 1.0f - vec3_proximity(pos,&cam->aim) / vol;
}


float FUN_800565a8(vec3f *param_1,float param_2,Camera_struct *cam){
  vec2f tempv2A;
  vec2f tempv2B;
  vec2f tempv2C;
  
  tempv2C.x = param_1->x;
  tempv2C.y = param_1->z;
  tempv2A.x = (cam->pos).x;
  tempv2A.y = (cam->pos).z;
  tempv2B.x = (cam->aim).x;
  tempv2B.y = (cam->aim).z;
  return -big_vec2_math_func(&tempv2A,&tempv2B,&tempv2C) * (1.0f - param_2);
}

void FUN_8005661c(vec3f *param_1,float param_2,Camera_struct *param_3,s8 *param_4,s8 *param_5){
  float prox=Sound_Volume_proximity(param_1,param_2,param_3);
  *param_4 = (prox * 255.0);
  *param_5 = ((FUN_800565a8(param_1,prox,param_3) + 1.0f) * 0.5f) * 255.0;

}

//TODO: ProcessAudioBubbles()