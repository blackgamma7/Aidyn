//unused borg type. Here for completion sake.

bool borg10_func_b(void *x,void *y){return false;}
void borg10_func_a(void *x){}

void borg_10_free(int *arg0){
  int iVar1 = get_memUsed();
  if (*arg0 == -1) {Free(arg0,"./src/n64BorgCollisionMaterial.cpp");}
  else {dec_borg_count(*arg0);}
  borg_mem[10]-= (iVar1 - get_memUsed(););
  borg_count[10]--;
  return;}

void * get_borg_10(int arg0){
  clearBorgFlag();
  return getBorgItem(arg0);}

void passto_borg_10_free(int *arg0){borg_10_free(arg0);}
