#include "GuiAnimation.h"
#include "stringN64.h"
#include "heapN64.h"

GuiAnimationManager::GuiAnimationManager(u32 size){
  this->unk0 = 0;
  this->present = 0;
  this->max = size;
  this->ptr = (GuiAnimator **)passto_new(size*sizeof(void*));
  memset(this->ptr,0,this->max*sizeof(void*));
}

GuiAnimationManager::~GuiAnimationManager(){
  Clear();
  delete this->ptr;
  this->ptr = NULL;
}

void GuiAnimationManager::AddItem(GuiAnimator *newItem){
    for(u32 i=0;i<this->max;i++){
        if(!this->ptr[i]){
            this->ptr[i]=newItem;
            break;
        }
    }
    this->present++;
}
  
  
void GuiAnimationManager::Tick(u32 n){
 for(u32 i=0;i<this->max;i++){
    GuiAnimator* p=this->ptr[i];
    if(p){
      if(p->unk0<p->spd)p->vMethA(n);
      else{
        p->~GuiAnimator();
        this->ptr[i]=NULL;
        this->present--;
      }
    }
  }
}
  
void GuiAnimationManager::Clear(){
  for(u32 i=0;i<this->max;i++){
    GuiAnimator* p=this->ptr[i];
    if(p){
      p->~GuiAnimator();
      this->ptr[i]=NULL;
    }
  }
  this->present=0;
}