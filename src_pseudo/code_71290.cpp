s16 sub_square_add_(u8 A,u8 B,u8 C,u8 D){
  s16 sVar1 = ((s16)(A - C));
  s16 sVar2 = ((s16)(B - D));
  return sVar1 * sVar1 + sVar2 * sVar2;}

s16 sub_square_add_sqrt(u8 A,u8 B,u8 C,u8 D){
  s16 sVar1 = sub_square_add_(A,B,C,D);
  float fVar2 = _sqrtf((float)sVar1);
  if (fVar2 < INT_MAX_f) sVar1 = (s16)fVar2;
  else sVar1 = (s16)(fVar2 - INT_MAX_f);
  return sVar1;}

u32 warrior_dividing(u8 x,u8 divis,bool roundup,u8 min,u8 max){
  u32 ret = x / divis;
  if (roundup) { if ((x) % divis) ret++;}
  if ((min != 0) && (ret < min)) ret = min;
  if ((max != 0) && (max < ret)) ret = max;
  return ret;}
