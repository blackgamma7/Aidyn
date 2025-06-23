#include "heapN64.h"
#include "GuiAnimation.h"

//this script may also have been used to describe the "GuiAnimator" base class.

void* passto_new(u32 size){
    return operator new(size);
}