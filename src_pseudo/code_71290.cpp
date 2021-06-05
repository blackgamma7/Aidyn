short sub_square_add_(byte A,byte B,byte C,byte D){
  short sVar1 = ((short)(A - C));
  short sVar2 = ((short)(B - D));
  return sVar1 * sVar1 + sVar2 * sVar2;}

short sub_square_add_sqrt(byte A,byte B,byte C,byte D){
  short sVar1 = sub_square_add_(A,B,C,D);
  float fVar2 = _sqrtf((float)sVar1);
  if (fVar2 < INT_MAX_f) sVar1 = (short)fVar2;
  else {sVar1 = (short)(fVar2 - INT_MAX_f);}
  return sVar1;}

uint warrior_dividing(byte warrior,byte arg1,bool roundup,uint min,byte max){
  uint ret = warrior / arg1; //arg1 is set to 5
  if (roundup) { if ((warrior) % arg1 != 0) ret++;} //roundup always false
  if ((min != 0) && (ret < min)) ret = min; //min/max both always 0
  if ((max != 0) && (max < ret)) ret = max;
  return ret;}
