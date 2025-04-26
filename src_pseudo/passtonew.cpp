#include "heapN64.h"
#include "unkGuiSubstruct.h"

//this script may also have been used to describe the "unkGuiClass" base class.

void* passto_new(u32 size){
    return operator new(size);
}