#define FILENAME "./src/n64print.cpp"

#include "N64Print.h"
#include "heapN64.h"

void N64Print::UnkA(s32 param_1,u16 param_2){
  ofunc_value = show_debug_queue;
  show_debug_queue = param_2 & 1;}


void N64Print::UnkB(void){show_debug_queue = ofunc_value;}

void N64Print::Toggle(N64PrintStruct *param_1,controller_aidyn *param_2){
#ifdef DEBUGVER
  if ((param_2->input & L_BUTTON)){
    if (param_1->color.w <= 0.0) {param_1->color.w = 60.0f;}
    else {param_1->color.w = 1.0f;}
  }
  if (((param_2->input_2 & R_BUTTON)) && ((param_2->input & START_BUTTON))) {
    param_2->input &= ~START_BUTTON;
    show_debug_queue ^= 1;
  }
#endif
}


void N64Print::Clear(void){
#ifdef DEBUGVER
  s16 iVar1;
  char *ppcVar2;
  
  ppcVar2 = gN64PrintP->text;
  for(iVar1=0;iVar1 < 10;iVar1++) {
    *ppcVar2++ = '\n';
  }
  ppcVar2 = 0;
#endif
}

void N64Print::Init(N64PrintStruct *param_1){
  #ifdef DEBUGVER
  gN64PrintP = param_1;
  ALLOCS(gN64PrintP->text,370,141);
  gN64PrintP->color.z = 1.0f;
  gN64PrintP->color.y = 1.0f;
  gN64PrintP->color.x = 1.0f;
  gN64PrintP->color.w = 0.0;
  gN64PrintP->ShortA = 0;
  Clear();
  #else
  gN64PrintP = NULL;
  #endif
}

void N64Print::Free(void){
#ifdef DEBUGVER
  if (gN64PrintP) {
    HFREE(gN64PrintP->text,160);
    N64PrintStruct *pDVar1 = gN64PrintP;
    gN64PrintP = NULL;
    pDVar1->text = NULL;
  }
#endif
}

char * N64Print::CleanText(char *param_1,char param_2,s16 param_3){
  #ifdef DEBUGVER
  char cVar1;
  s16 iVar2;
  s32 iVar3;
  
  iVar2 = (s32)param_3;
  iVar3 = 0;
  if (iVar2 < 1) return param_1;
  do {
    cVar1 = param_1[iVar3];
    if (cVar1 == 0) return param_1 + iVar3;
    if (cVar1 == param_2) {
      iVar2--;
      if (iVar2 < 1) return param_1 + iVar3 + 1;
    }
    iVar3++;
  } while( true );
  #else
  return NULL;
  #endif
}

void N64Print::PrintCheck(char *x){
#ifdef DEBUGVER
  if (*x) Print(x);
  #endif
}
#ifdef DEBUGVER
void N64Print::Print(char *param_1){
  
  char cVar1;
  N64PrintStruct *pDVar2;
  char *ppcVar3;
  s16 lVar4;
  s16 sVar5;
  s16 iVar6;
  char *pcVar7;
  char cStack400;
  char acStack399 [399];
  
  if ((*param_1) && (gN64PrintP)) {
    lVar4 = gN64PrintP->ShortA;
    iVar6 = 0;
    gN64PrintP->color.w = 15.0f;
    pDVar2 = gN64PrintP;
    cStack400 = *param_1;
    pcVar7 = acStack399;
    cVar1 = cStack400;
    while (cVar1) {
      lVar4++;
      if (*param_1 == '\n') {
        iVar6++;
        lVar4 = 0;
      }
      param_1++;
      if (0x23 < lVar4) {
        *pcVar7 = '\n';
        pcVar7++;
        iVar6++;
        lVar4 = 0;
      }
      sVar5 = (s16)lVar4;
      *pcVar7 = *param_1;
      cVar1 = *param_1;
      pcVar7++;
    }
    gN64PrintP->ShortA = sVar5;
    if (iVar6 < 10) {
      pcVar7 = &cStack400;
      ppcVar3 = CleanText(pDVar2->text,10,iVar6);
    }
    else {
      pcVar7 = CleanText(&cStack400,10,10 - iVar6);
      ppcVar3 = gN64PrintP->text;
    }
    sprintf(gN64PrintP->text,"%s%s",ppcVar3,pcVar7);
  }
}
#else
void N64Print::Print(){}
#endif

Gfx* N64Print::Draw(Gfx*gfx,s16 delta){
#ifdef DEBUGVER
  u8 uVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  
  if (((gDebugFlag) && (show_debug_queue)) && (gN64PrintP)) {
    gN64PrintP->color.w -= (delta * (1.0/60));
    if (0.0 < gN64PrintP->color.w) {
      fVar4 = gN64PrintP->color.r * 255.0f;
      fVar5 = gN64PrintP->color.g * 255.0f;
      fVar6 = gN64PrintP->color.b * 255.0f;
      fVar3 = gN64PrintP->color.a * 255.0f;
      uVar2 = (u8)(s32)fVar3;
      if (1.0f < gN64PrintP->color.w) uVar2 = 0xff;
      gfx = Graphics::DrawText(gfx,gN64PrintP->text,0x12,0x32,(char)fVar4,(char)fVar5,(char)fVar6,uVar2);
    }
    else gN64PrintP->color.w = 0.0;
  }
#endif
  return gfx;
}
