#define OneOver60_d 0.016666666666666666
#ifdef DEBUGVER
#define FILENAME "./src/n64print.cpp"
#else
#define FILENAME ""
#endif

void ofunc_8002d8c0(int param_1,ushort param_2){
  ofunc_value = show_debug_queue;
  show_debug_queue = param_2 & 1;
  return;
}


void func_8002d8dc(void){
  show_debug_queue = ofunc_value;
  return;
}

void toggle_show_debug_queue(Debug_queue *param_1,controller_aidyn *param_2){
#ifdef DEBUGVER
  if ((param_2->input & L_BUTTON) != 0){
    if (param_1->timer <= 0.0) {param_1->timer = 60.0f;}
    else {param_1->timer = 1.0f;}
  }
  if (((param_2->input_2; & R_BUTTON) != 0) && ((param_2->input & START_BUTTON) != 0)) {
    param_2->input = param_2->input & ~START_BUTTON;
    show_debug_queue = show_debug_queue ^ 1;
  }
  return;
#endif
}


void debug_queue_func_(void){
#ifdef DEBUGVER
  int iVar1;
  char **ppcVar2;
  int iVar3;
  
  iVar3 = 0x10000;
  ppcVar2 = debugQueuePointer->text;
  do {
    *(undefined *)ppcVar2 = 10;
    ppcVar2 = (char **)((int)ppcVar2 + 1);
    iVar1 = iVar3 >> 0x10;
    iVar3 = iVar3 + 0x10000;
  } while (iVar1 < 10);
  *(undefined *)ppcVar2 = 0;
  return;
#endif
}

void n64print_init(Debug_queue *param_1){
  #ifdef DEBUGVER
  debugQueuePointer = param_1;
  debugQueuePointer->text = (char **)Malloc(370,FILENAME,0x8d);
  debugQueuePointer->color[2] = 1.0f;
  debugQueuePointer->color[1] = 1.0f;
  debugQueuePointer->color[0] = 1.0f;
  debugQueuePointer->timer = 0.0;
  debugQueuePointer->ShortA = 0;
  debug_queue_func_();
  #else
  debugQueuePointer = NULL;
  #endif
  return;
}

void n64print_free(void){
#ifdef DEBUGVER
  Debug_queue *pDVar1;
  
  if (debugQueuePointer != NULL) {
    Free(debugQueuePointer->text,FILENAME,0xa0);
    pDVar1 = debugQueuePointer;
    debugQueuePointer = NULL;
    pDVar1->text = NULL;
  }
  return;
#endif
}

char * debug_queue_sub(char *param_1,char param_2,short param_3){
  #ifdef DEBUGVER
  char cVar1;
  int iVar2;
  int iVar3;
  
  iVar2 = (int)param_3;
  iVar3 = 0;
  if (iVar2 < 1) {
    return param_1;
  }
  do {
    cVar1 = param_1[iVar3];
    if (cVar1 == '\0') {return param_1 + iVar3;}
    if (cVar1 == param_2) {
      iVar2 = (iVar2 + -1) * 0x10000 >> 0x10;
      if (iVar2 < 1) {
        return param_1 + iVar3 + 1;
      }
    }
    iVar3 = (int)(short)((short)iVar3 + 1);
  } while( true );
  #else
  return NULL;
  #endif
}

void Ofunc_Passto_debug_queue(char *param_1){
#ifdef DEBUGVER
  if (*param_1 != '\0') {debug_queue(param_1);}
  #endif
  return;
}

void debug_queue(char *param_1){
  #ifdef DEBUGVER
  char cVar1;
  Debug_queue *pDVar2;
  char **ppcVar3;
  longlong lVar4;
  short sVar5;
  int iVar6;
  char *pcVar7;
  char cStack400;
  char acStack399 [399];
  
  if ((*param_1 != '\0') && (debugQueuePointer != NULL)) {
    sVar5 = debugQueuePointer->ShortA;
    lVar4 = (longlong)sVar5;
    iVar6 = 0;
    debugQueuePointer->timer = 15.0f;
    pDVar2 = debugQueuePointer;
    cStack400 = *param_1;
    pcVar7 = acStack399;
    cVar1 = cStack400;
    while (cVar1 != '\0') {
      lVar4 = (longlong)(((int)lVar4 + 1) * 0x10000 >> 0x10);
      if (*param_1 == '\n') {
        iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
        lVar4 = 0;
      }
      param_1 = param_1 + 1;
      if (0x23 < lVar4) {
        *pcVar7 = '\n';
        pcVar7++;
        iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
        lVar4 = 0;
      }
      sVar5 = (short)lVar4;
      *pcVar7 = *param_1;
      cVar1 = *param_1;
      pcVar7++;
    }
    debugQueuePointer->ShortA = sVar5;
    if (iVar6 < 10) {
      pcVar7 = &cStack400;
      ppcVar3 = (char **)debug_queue_sub(pDVar2->text,10,iVar6);
    }
    else {
      pcVar7 = (char *)debug_queue_sub(&cStack400,10,(10 - iVar6) * 0x10000 >> 0x10);
      ppcVar3 = debugQueuePointer->text;
    }
    sprintf((char *)debugQueuePointer->text,"%s%s",ppcVar3,pcVar7);
  }
  #endif
  return;
}

rspCom * func_with_debug_queue(rspCom *param_1,short param_2){
#ifdef DEBUGVER
  undefined uVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  

  if (((debug_flag) && (show_debug_queue)) && (debugQueuePointer != NULL)) {
    fVar4 = (float)((double)debugQueuePointer->timer - (double)(int)param_2 * OneOver60_d);
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
      uVar2 = (undefined)(int)fVar3;
      if (1.0f < debugQueuePointer->timer) {
        uVar2 = 0xff;
      }
      param_1 = (rspCom *)
                some_debug_print(param_1,(char *)debugQueuePointer->text,0x12,0x32,(char)(int)fVar4,
                                 (char)(int)fVar5,(char)(int)fVar6,uVar2);
    }
    else {
      pDVar1->timer = 0.0;
    }
  }
#endif
  return param_1;
}
