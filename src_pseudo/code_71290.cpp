s16 sub_square_add_(u8 A,u8 B,u8 C,u8 D){
  s16 sVar1 = ((s16)(A - C));
  s16 sVar2 = ((s16)(B - D));
  return sVar1 * sVar1 + sVar2 * sVar2;}

s16 sub_square_add_sqrt(u8 A,u8 B,u8 C,u8 D){
  s16 sVar1 = sub_square_add_(A,B,C,D);
  float fVar2 = _sqrtf((float)sVar1);
  if (fVar2 < INT_MAX_f) sVar1 = (s16)fVar2;
  else {sVar1 = (s16)(fVar2 - INT_MAX_f);}
  return sVar1;}

u32 warrior_dividing(u8 warrior,u8 arg1,bool roundup,u32 min,u8 max){
  u32 ret = warrior / arg1; //arg1 is set to 5
  if (roundup) { if ((warrior) % arg1 != 0) ret++;} //roundup always false
  if ((min != 0) && (ret < min)) ret = min; //min/max both always 0
  if ((max != 0) && (max < ret)) ret = max;
  return ret;}
