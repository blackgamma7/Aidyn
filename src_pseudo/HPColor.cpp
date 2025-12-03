#include "entity.h"

//returns a color ranged ffrom green to red based on ent's hp%
void getHPColor(Color32 *oCol,CharSheet *ent) {
  Color32 col;
  
  s16 max = Entity::getHPMax(ent);
  s32 i = (Entity::getHPCurrent(ent) * 255) / max;
  if (0xff < i) i = 0xff;
  col.W = ((i & 0xff) << 0x10);
  col.R = ~i;
  col.A = 200;
  *oCol = col;
}

//actual struct unknown. Color32 used as surrogate
void Ofunc_8008f298(Color32 *unk,u8 r,u8 g,u8 b,u8 a) {
  for(u8 i=0;i<4;i++){
    //unknown struct has feild Color32[4] at offset 0x208
    unk[i + 0x82].R = r;
    unk[i + 0x82].G = g;
    unk[i + 0x82].B = b;
    unk[i + 0x82].A = a;
  }
}