#define OneOver60_d 0.016666666666666666f
#ifdef DEBUGVER
#define FILENAME "./src/n64print.cpp"
#else
#define FILENAME ""
#endif

void N64Print::UnkA(s32 param_1,u16 param_2){
  ofunc_value = show_debug_queue;
  show_debug_queue = param_2 & 1;}


void N64Print::UnkB(void){show_debug_queue = ofunc_value;}

void N64Print::Toggle(Debug_queue *param_1,controller_aidyn *param_2){
#ifdef DEBUGVER
  if ((param_2->input & L_BUTTON)){
    if (param_1->timer <= 0.0) {param_1->timer = 60.0f;}
    else {param_1->timer = 1.0f;}
  }
  if (((param_2->input_2; & R_BUTTON)) && ((param_2->input & START_BUTTON))) {
    param_2->input &= ~START_BUTTON;
    show_debug_queue ^= 1;
  }
  return;
#endif
}


void N64Print::Clear(void){
#ifdef DEBUGVER
  s16 iVar1;
  char *ppcVar2;
  
  ppcVar2 = debugQueuePointer->text;
  for(iVar1=0;iVar1 < 10;iVar1++) {
    ppcVar2++ = '/n';
  }
  ppcVar2 = 0;
#endif
}

void N64Print::Init(Debug_queue *param_1){
  #ifdef DEBUGVER
  debugQueuePointer = param_1;
  debugQueuePointer->text = heapAlloc(370,FILENAME,0x8d);
  debugQueuePointer->color[2] = 1.0f;
  debugQueuePointer->color[1] = 1.0f;
  debugQueuePointer->color[0] = 1.0f;
  debugQueuePointer->timer = 0.0;
  debugQueuePointer->ShortA = 0;
  N64Print::Clear();
  #else
  debugQueuePointer = NULL;
  #endif
}

void N64Print::Free(void){
#ifdef DEBUGVER
  Debug_queue *pDVar1;
  
  if (debugQueuePointer) {
    HeapFree(debugQueuePointer->text,FILENAME,0xa0);
    pDVar1 = debugQueuePointer;
    debugQueuePointer = NULL;
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
  if (*x) N64Print::Print(x);
  #endif
}

void N64Print::Print(char *param_1){
  #ifdef DEBUGVER
  char cVar1;
  Debug_queue *pDVar2;
  char *ppcVar3;
  s16 lVar4;
  s16 sVar5;
  s16 iVar6;
  char *pcVar7;
  char cStack400;
  char acStack399 [399];
  
  if ((*param_1) && (debugQueuePointer)) {
    lVar4 = debugQueuePointer->ShortA;
    iVar6 = 0;
    debugQueuePointer->timer = 15.0f;
    pDVar2 = debugQueuePointer;
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
    debugQueuePointer->ShortA = sVar5;
    if (iVar6 < 10) {
      pcVar7 = &cStack400;
      ppcVar3 = N64Print::CleanText(pDVar2->text,10,iVar6);
    }
    else {
      pcVar7 = N64Print::CleanText(&cStack400,10,10 - iVar6);
      ppcVar3 = debugQueuePointer->text;
    }
    sprintf(debugQueuePointer->text,"%s%s",ppcVar3,pcVar7);
  }
  #endif
  return;
}

Gfx* N64Print::Draw(Gfx*param_1,s16 param_2){
#ifdef DEBUGVER
  u8 uVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  

  if (((debug_flag) && (show_debug_queue)) && (debugQueuePointer)) {
    fVar4 = (float)((double)debugQueuePointer->timer - (double)(s32)param_2 * OneOver60_d);
    debugQueuePointer->timer = fVar4;
    if (0.0 < fVar4) {
      fVar4 = debugQueuePointer->color[0] * 255.0f;
      ABS_macro(fVar4);
      fVar5 = debugQueuePointer->color[1] * 255.0f;
      ABS_macro(fVar5);
      fVar6 = debugQueuePointer->color[2] * 255.0f;
      ABS_macro(fVar6);
      fVar3 = debugQueuePointer->timer * 255.0f;
      ABS_macro(fVar3);
      uVar2 = (u8)(s32)fVar3;
      if (1.0f < debugQueuePointer->timer) {uVar2 = 0xff;}
      param_1 = gfx::DrawText(param_1,debugQueuePointer->text,0x12,0x32,(char)fVar4,(char)fVar5,(char)fVar6,uVar2);
    }
    else pDVar1->timer = 0.0;
  }
#endif
  return param_1;
}
