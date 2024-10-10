//Unused borg type. added from completion sake.
#define FILENAME "./src/n64BorgGameStates.cpp"


bool borg14_func_b(void *x,s32 y){
  *(s32 *)((s32)x + 8) = y;
  return false;}

void borg14_func_a(void *arg0){
  *(s32 *)((s32)arg0 + 8) += (s32)arg0;
  *(s32 *)((s32)arg0 + 0xc) += (s32)arg0;
  return;}

void ofunc_borg14_free(s32 *arg0){
  s32 iVar1 = get_memUsed();
  if (*arg0 == -1) {HeapFree((void *)arg0[2],FILENAME,0x92);}
  else {dec_borg_count(*arg0);}
  HeapFree(arg0,FILENAME,0x99);
  borg_mem[14] -= (iVar1 - get_memUsed());
  borg_count[14]--;
  return;}

void * get_borg_14(s32 arg0){
  clearBorgFlag();
  return getBorgItem(arg0);}

void passto_borg_14_free(s32 *arg0){ofunc_borg14_free(arg0);}
