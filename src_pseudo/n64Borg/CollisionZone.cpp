#include "n64Borg.h"

#define FILENAME "./src/n64BorgCollisionZone.cpp"

u8 borg_9_func_b(void*,void*){return false;}

//used instead of macro TODO: redefine macro for this script.
void * set_pointer_offset(void *A,void *B){
 return (void *)((int)A + (int)B);
}

void borg9_func_a(Borg9header *param_1){
  u16 i,j;
  
  param_1->dat.counting_pointer = (s16 *)set_pointer_offset(&param_1->dat,param_1->dat.counting_pointer);
  (param_1->dat).someint = set_pointer_offset(&param_1->dat,(param_1->dat).someint);
  (param_1->dat).pointer2 = (s16 *)set_pointer_offset(&param_1->dat,(param_1->dat).pointer2);
  (param_1->dat).phys_pointer = (borg9_phys *)set_pointer_offset(&param_1->dat,(param_1->dat).phys_pointer);
  (param_1->dat).verts = (vec3f *)set_pointer_offset(&param_1->dat,(param_1->dat).verts);
  (param_1->dat).someInt_2 = set_pointer_offset(&param_1->dat,(param_1->dat).someInt_2);
  (param_1->dat).voxelObjs = (voxelObject *)set_pointer_offset(&param_1->dat,(param_1->dat).voxelObjs);
  (param_1->dat).unkStructs = (borg_9_struct *)set_pointer_offset(&param_1->dat,(param_1->dat).unkStructs);
  if ((param_1->dat).borghpys_count) {
    for(i=0;i < (param_1->dat).borghpys_count;i++) {
      for(j = 0;j<3;j++) {
        void** p = (void **)((int)(param_1->dat).phys_pointer[i].verts[j]);
        *p = set_pointer_offset(*p,(param_1->dat).verts);
      }
    }
  }
  if ((param_1->dat).unkStructCount) {
    for(i=0;i<(param_1->dat).unkStructCount;i++) {
      borg_9_struct* p = (param_1->dat).unkStructs + i;
      p->collideIndecies = (u16*)set_pointer_offset(p->collideIndecies,(param_1->dat).counting_pointer);
      p->unk4 = set_pointer_offset(p->unk4,(param_1->dat).someint);
      p->lightIndecies = (u16*)set_pointer_offset(p->lightIndecies,(param_1->dat).pointer2);
    }
  }
}

void n64BorgCollisionZone_free(Borg9header *param_1){
  int mOld = get_memUsed();
  if (param_1->ID == -1) HFREE(param_1,0xf0);
  else dec_borg_count(param_1->ID);
  borg_mem[9]-= (mOld - get_memUsed());
  borg_count[9]--;
}

//Load Map Collision/interactive data
Borg9header * loadBorg9(u32 param_1){
  setBorgFlag();
  return (Borg9header *)getBorgItem(param_1);
}

void remove_borg_9(Borg9header *param_1){n64BorgCollisionZone_free(param_1);}

