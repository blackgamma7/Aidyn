#include "unkGuiSubstruct.h"
#include "stringN64.h"
#include "heapN64.h"

UnkGuiSubstruct::UnkGuiSubstruct(u32 size){
  this->unk0 = 0;
  this->present = 0;
  this->max = size;
  this->ptr = (UnkGuiClass **)passto_new(size*sizeof(void*));
  memset(this->ptr,0,this->max*sizeof(void*));
}

UnkGuiSubstruct::~UnkGuiSubstruct(){
  Clear();
  delete this->ptr;
  this->ptr = NULL;
}

void UnkGuiSubstruct::AddItem(UnkGuiClass *newItem){
    for(u32 i=0;i<this->max;i++){
        if(!this->ptr[i]){
            this->ptr[i]=newItem;
            break;
        }
    }
    this->present++;
}
  
  
void UnkGuiSubstruct::Tick(u32 n){
 for(u32 i=0;i<this->max;i++){
    UnkGuiClass* p=this->ptr[i];
    if(p){
      if(p->unk0<p->unk4)p->vMethA(n);
      else{
        p->~UnkGuiClass();
        this->ptr[i]=NULL;
        this->present--;
      }
    }
  }
}
  
void UnkGuiSubstruct::Clear(){
  for(u32 i=0;i<this->max;i++){
    UnkGuiClass* p=this->ptr[i];
    if(p){
      p->~UnkGuiClass();
      this->ptr[i]=NULL;
    }
  }
  this->present=0;
}