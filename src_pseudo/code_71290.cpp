short sub_square_add_(byte A,byte B,byte C,byte D){
  short sVar1;
  short sVar2;
  
  sVar1 = ((short)(A - C));
  sVar2 = ((short)(B - D));
  return sVar1 * sVar1 + sVar2 * sVar2;
}

short sub_square_add_sqrt(byte A,byte B,byte C,byte D){
  short sVar1;
  float fVar2;
  
  sVar1 = sub_square_add_(A,B,C,D);
  fVar2 = _sqrtf((float)(int)sVar1);
  if (fVar2 < INT_MAX_f) sVar1 = (short)(int)fVar2;
  else {sVar1 = (short)(int)(fVar2 - INT_MAX_f);}
  return sVar1;
}

uint warrior_dividing(byte warrior,byte arg1,bool arg2,uint arg3,byte arg4){
  uint ret;
  ret = warrior / arg1; //arg1 is set to 5
  if (arg2) { if ((warrior) % arg1 != 0) ret++;}
  if ((arg3 != 0) && (ret < arg3)) ret = arg3;
  if ((arg4 != 0) && (arg4 < ret)) ret = arg4;
  return ret;
}