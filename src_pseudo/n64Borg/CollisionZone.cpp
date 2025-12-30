#include "n64Borg.h"

#define FILENAME "./src/n64BorgCollisionZone.cpp"

u8 borg9_func_b(void*,void*){return false;}

void * set_pointer_offset(void *A,void *B){
 return (void *)((uintptr_t)A + (uintptr_t)B);
}
//Macro to replace SetPointer() used elsewhere.
#define Borg9SetPointer(x,f) x.f=decltype(x.f)(set_pointer_offset(&x,x.f));

void borg9_func_a(Borg9Header *param_1){
  u16 i,j;
  Borg9SetPointer(param_1->dat,collideCount);
  Borg9SetPointer(param_1->dat,someint);
  Borg9SetPointer(param_1->dat,lightCount);
  Borg9SetPointer(param_1->dat,phys_pointer);
  Borg9SetPointer(param_1->dat,verts);
  Borg9SetPointer(param_1->dat,someInt_2);
  Borg9SetPointer(param_1->dat,voxelObjs);
  Borg9SetPointer(param_1->dat,collideSections);
  if ((param_1->dat).borghpys_count) {
    for(i=0;i < (param_1->dat).borghpys_count;i++) {
      for(j = 0;j<3;j++) {
        void** p = (void **)((int)(param_1->dat).phys_pointer[i].verts[j]);
        *p = set_pointer_offset(*p,(param_1->dat).verts);
      }
    }
  }
  if ((param_1->dat).collideSectionCount) {
    for(i=0;i<(param_1->dat).collideSectionCount;i++) {
      CollideSection* p = (param_1->dat).collideSections + i;
      p->collideIndecies = (u16*)set_pointer_offset(p->collideIndecies,(param_1->dat).collideCount);
      p->unk4 = set_pointer_offset(p->unk4,(param_1->dat).someint);
      p->lightIndecies = (u16*)set_pointer_offset(p->lightIndecies,(param_1->dat).lightCount);
    }
  }
}

void n64BorgCollisionZone_free(Borg9Header *param_1){
  int mOld = get_memUsed();
  if (param_1->head.index == -1) HFREE(param_1,240);
  else dec_borg_count(param_1->head.index);
  borg_mem[9]-= (mOld - get_memUsed());
  borg_count[9]--;
}

//Load Map Collision/interactive data
Borg9Header * loadBorg9(u32 param_1){
  setBorgFlag();
  return (Borg9Header *)getBorgItem(param_1);
}

void remove_borg_9(Borg9Header *param_1){n64BorgCollisionZone_free(param_1);}

