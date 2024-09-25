#include "savefiles.h"

namespace SaveParty{
void Init(SaveFile *sav,u8 *dat){
    sav->dat=dat;
    sav->pos=0;
}
void SaveBits(SaveFile *sav,u32 dat,uint bits){

  uint i;
  
  i = 0;
  if (bits) {
    do {
      WriteData(sav->dat,sav->pos++,RShift(dat,i++));
    } while (i < bits);
  }
}
u32 LoadBits(SaveFile *sav,u32 bits){
  uint i;
  u32 buff;
  
  i = 0;
  buff = 0;
  if (bits) {
    do {
      GetData(&buff,i++,GetBit(sav->dat,sav->pos++));
    } while (i < bits);
  }
  return buff;
}
void Advance(SaveFile *sav,u32 bits){
    sav->pos+=bits;
    }
u32 RShift(u32 x,u8 shifts){
    return x >> ((int)(char)shifts & 0x1fU) & 1;
    }
u32 GetBit(u8 *arr,u32 x){
    return (int)(uint)arr[x >> 3] >> (x & 7) & 1;
    }
void WriteData(u8 *dat,u32 filesize,u32 size){
    dat[filesize >> 3] = ~(byte)(1 << (filesize & 7)) & dat[filesize >> 3] | (byte)(size << (filesize & 7));
    }
void GetData(u32 *dat,uint shift,int bits){
    *dat = *dat & ~(1 << (shift & 0x1f)) | bits << (shift & 0x1f);
    }
}