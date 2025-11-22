#include "globals.h"

struct CinematicFade {
    u8 index;
    u8 fadeType; /* none,black,white,red */
    u16 runtime; /* div 2 */
    u16 fadeTime; /* div 2 */
    s16 exitTime;
};
CinematicFade sCfadeCine0[]={
  {1,CFade_White,0x2da,0x28,0},
  {2,CFade_None,0,0x14,0},{2,CFade_White,0x104,0xa,0},
  {3,CFade_None,0,0xa,0},{3,CFade_White,0x186,0xa,0},
  {4,CFade_None,0,0xa,0},{4,CFade_White,0x8c,0xa,0},
  {5,CFade_None,0,0xa,0},{5,CFade_White,0x64,0x14,0},
  {6,CFade_None,0,0x28,0},{6,CFade_White,0x4b0,0x28,0},
  {7,CFade_None,0,0x14,0},{7,CFade_White,0xB4,0xa,0},
  {8,CFade_None,0,0xa,0},{8,CFade_White,0xd7,0x14,0},
  {9,CFade_None,0,0x28,0},{9,CFade_White,0x2bc,0x28,0},
  {10,CFade_None,0,0x14,0},{10,CFade_White,0x11d,0x14,0},
  {11,CFade_None,0,0x28,0},{12,CFade_Black,0x5DC,0x28,0},
  {13,CFade_None,0,0x28,0},{13,CFade_White,0x4ec,0x3c,0x3c},
  {0}
};
CinematicFade sCfadeCine1[]={
  {1,CFade_None,0,0x2d,0},{1,CFade_Black,0x1d4,0x13,0},
  {2,CFade_None,0,0x2d,0},{2,CFade_White,0x1e5,0x23,0},
  {3,CFade_None,0,0x1e,0},{3,CFade_Red,0x28a,0x32,0},
  {4,CFade_None,0,0x32,0},{4,CFade_White,0x25e,0x04,0},
  {4,CFade_White,0x28f,0x04,0},
  {4,CFade_White,0x2d3,0x04,0},
  {4,CFade_White,0x355,0x04,0},
  {4,CFade_Black,0x426,0x3F,0x1e},
  {0}
};
CinematicFade sCfadeCine2[]={
  {1,CFade_None,0,0x1e,0},{1,CFade_White,0x1ca,0x0f,0},
  {2,CFade_None,0,0x0f,0},{2,CFade_White,0x3e5,0x1e,0},
  {3,CFade_None,0,0x1e,0},{3,CFade_Black,0x1c2,0x2d,120},
  {0}
};
CinematicFade sCfadeCine3[]={
  {1,CFade_None,0,0x1e,0},{1,CFade_Black,0x2ee,0x1e,0},
  {2,CFade_None,0,0x1e,0},{2,CFade_White,0x311,0x2d,0},
  {3,CFade_None,0,0x2d,0},{3,CFade_White,0x1ea,0x0f,0},
  {4,CFade_None,0,0x0f,0},{4,CFade_White,0x2c6,0x1e,0},
  {5,CFade_None,0,0x1e,0},{5,CFade_White,0x28f,0x1e,0},
  {6,CFade_None,0,0x0f,0},{6,CFade_Black,0x465,0x0f,0x3c},
  {0}
};

//transition data for each scene
CinematicFade* sCFadePs[]={
  sCfadeCine0,sCfadeCine1,sCfadeCine2,sCfadeCine3
};

CinematicFade* sCFadeP=NULL; //above, for current cinematic
Color32 sCFadeCol={0};
u16 sCFades16=0;
float sCFadeFloat=0;
float sCFadeSpeed=0;
u16 sCFadeRuntime=0;
u16 sCFadeTally=0;

void Cinematic::InitFade(u16 param_1){
  sCFadeP = sCFadePs[param_1];
  sCFadeCol = {0,0,0,0};
  sCFades16 = 0;
  sCFadeFloat = 0.0;
  sCFadeSpeed = 0.0;
  sCFadeRuntime = 0;
  sCFadeTally = 0;
}

void Cinematic::NextFadeTally(void){
  sCFadeRuntime = 0;
  sCFadeTally++;
}

Gfx * Cinematic::Fade(Gfx *g,u16 delta){
  s16 sVar2;
  u16 uVar3;
  u16 uVar4;
  Gfx *gfx;
  s16 sVar5;
  u32 uVar6;
  u32 uVar7;
  u32 uVar8;
  float fVar9;
  
  uVar8 = (u32)delta;
  uVar7 = (u32)sCFadeRuntime;
  sCFadeRuntime = delta + sCFadeRuntime;
  if (sCFadeP->index != sCFadeTally) goto LAB_8005d1d4;
  uVar6 = (u32)sCFadeP->runtime * 2;
  if ((sCFadeRuntime < uVar6) || (uVar6 < uVar7)) goto LAB_8005d1d4;
  uVar4 = sCFadeP->fadeTime * 2;
  sVar5 = sCFadeP->exitTime * 2;
  sVar2 = sVar5 + 0x40;
  uVar3 = uVar4 - 4;
  if (sCFadeP->fadeTime < 5) {
    sVar2 = sVar5;
    uVar3 = uVar4;
  }
  uVar8 = (u32)delta + (u32)sCFadeRuntime + (u32)sCFadeP->runtime * -2 &
          0xffff;
  sCFades16 = sVar2 + uVar3;
  sCFadeSpeed = (float)(1.0 / (double)uVar3);
  switch(sCFadeP->fadeType){
    case CFade_None:
      sCFadeSpeed = -sCFadeSpeed;
      sCFadeFloat = 1.0f;
      break;
    case CFade_Black:
      sCFadeCol.R = 0;
      sCFadeCol.G = 0;
      sCFadeCol.B = 0;
      sCFadeFloat = 0.0;
      break;
    case CFade_White:
      sCFadeCol.R = 0xff;
      sCFadeCol.G = 0xff;
      sCFadeCol.B = 0xff;
      sCFadeFloat = 0.0;
    break;
    case CFade_Red:
      sCFadeCol.R = 0xff;
      sCFadeCol.G = 0;
      sCFadeCol.B = 0;
      sCFadeFloat = 0.0; 
  }
  sCFadeP++;
LAB_8005d1d4:
  if (sCFades16 != 0) {
    uVar7 = (u32)sCFades16;
    sCFades16 = (s16)(uVar7 - uVar8);
    if ((s16)(uVar7 - uVar8) < 0) sCFades16 = 0;
    sCFadeFloat = sCFadeFloat + sCFadeSpeed * (float)uVar8;
    //reverse from CLAMP01 macro
    CIEL(sCFadeFloat,1.0);
    FLOOR(sCFadeFloat,0.0);
    sCFadeCol.A = sCFadeFloat * 255.0f;
    if (sCFadeCol.A) {
      gfx =RSPFUNC6(g);
      g = DrawRectangle(gfx,FULL_SCREENSPACE,sCFadeCol.R,sCFadeCol.G,
                      sCFadeCol.B,sCFadeCol.A);
    }
  }
  return g;
}
