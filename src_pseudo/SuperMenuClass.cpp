#include "globals.h"
#define FILENAME "./menus/supermenuclasses.cpp"

SuperMenuClass* supermenuclasses_pointer=NULL;
u32 supermenuclasses_count=0;

namespace SuperMenuClasses{
    void Init(s32 size){
        if(!supermenuclasses_pointer){
            supermenuclasses_count=size;
            ALLOCS(supermenuclasses_pointer,size*sizeof(SuperMenuClass),139);
            memset(supermenuclasses_pointer,0,size*sizeof(SuperMenuClass));
        }
    }

    void Set(){Init(16);}

    void Free(){
        if (supermenuclasses_pointer) {
          SuperMenuClass* p = supermenuclasses_pointer;
          while (p->img) {
            FREEQB8(p->img);
            p++;
          }
          FREE(supermenuclasses_pointer,163);
          supermenuclasses_count = 0;
        }
      }

    Borg8Header * Add(u32 ind){
        Borg8Header *pBVar2;
        SuperMenuClass *pSVar3;
        SuperMenuClass *pSVar4;
        
        pSVar4 = supermenuclasses_pointer;
        //TODO: Redo as While Loop
        if (supermenuclasses_pointer->img == NULL) {
      LAB_8004e258:
          if (supermenuclasses_count <= (u32)((int)pSVar4 - (int)supermenuclasses_pointer >> 3))
            CRASH(FILENAME,"Lookup table has overflowed!");
          pSVar4->index = ind;
          pBVar2 = loadBorg8(ind);
          pSVar4->img = pBVar2;
          if (pBVar2 == NULL) pBVar2 = NULL;
        }
        else {
          u32 BVar1 = supermenuclasses_pointer->index;
          pSVar3 = supermenuclasses_pointer;
          while (BVar1 != ind) {
            pSVar4++;
            if (pSVar4->img == NULL) goto LAB_8004e258;
            BVar1 = pSVar3[1].index;
            pSVar3 = pSVar4;
          }
          pBVar2 = pSVar3->img;
        }
        return pBVar2;
      }
}