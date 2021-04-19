//Unused borg type. added from completion sake.
#ifdef DEBUGVER
#define FILENAME "./src/n64BorgGameStates.cpp"
#else
#define FILENAME ""
#endif

bool borg14_func_b(void *x,int y){
  *(int *)((int)x + 8) = y;
  return false;}

void borg14_func_a(void *arg0){
  *(int *)((int)arg0 + 8) += (int)arg0;
  *(int *)((int)arg0 + 0xc) += (int)arg0;
  return;}

void ofunc_borg14_free(int *arg0){
  int iVar1 = get_memUsed();
  if (*arg0 == -1) {Free((void *)arg0[2],FILENAME,0x92);}
  else {dec_borg_count(*arg0);}
  Free(arg0,FILENAME,0x99);
  borg_mem[14] -= (iVar1 - get_memUsed());
  borg_count[14]--;
  return;}

void * get_borg_14(int arg0){
  clearBorgFlag();
  return getBorgItem(arg0);}

void passto_borg_14_free(int *arg0){ofunc_borg14_free(arg0);}
