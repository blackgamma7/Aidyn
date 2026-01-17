#include "globals.h"

void Portraits::InitBorder(void){gGlobals.portraitBorder = loadBorg8(BORG8_PortraitHighlight);}

u8 Portraits::CheckPos(u8 param_1){
  u8 bVar1 = true;
  if (param_1 == false) {if (screen_bottom < SCREEN_HEIGHT) {bVar1 = false;}}
  else if (param_1 == true) bVar1 = screen_bottom < 0xba;
  return bVar1;
}

#define WHITE_GLOW {255,255,255,128}
Gfx* Portraits::Draw(Gfx*param_1,u8 param_2){
  Color32 uStack72 [4] ={WHITE_GLOW,WHITE_GLOW,WHITE_GLOW,WHITE_GLOW}; //yes, by hacking, you could color-code the auras.
  return DrawParty(param_1,param_2,uStack72);
}

void Portraits::BlendColors(Color32 *colA,Color32 *colB,float fade){
  colB->R= colA->R * fade;
  colB->G= colA->G * fade;
  colB->B= colA->B * fade;
  colB->A= colA->A * fade;
}

Gfx * Portraits::DrawParty(Gfx *g,u8 raise,Color32 *col){
  CharSheet *pCVar1;
  float Hscale;
  u16 h;
  u16 v;
  Gfx *gfx;
  Color32 TempCol;
  
  if (raise) {
    if ((raise) && (0xb9 < screen_bottom)) screen_bottom-= 4;
  }
  else if (screen_bottom < SCREEN_HEIGHT) screen_bottom += 4;
  gfx = RSPFUNC6(g);
  BlendColors(col,&TempCol,gGlobals.brightness);
  Hscale = 0.8f;
  gfx = Borg8_DrawSimple(gfx,gGlobals.portraitBorder,84.0,(float)(u32)screen_bottom,
                         0.8f,0.8f,TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  BlendColors(col + 1,&TempCol,gGlobals.brightness);
  gfx = Borg8_DrawSimple(gfx,gGlobals.portraitBorder,122.0,(float)(u32)screen_bottom,Hscale,Hscale,
                         TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  BlendColors(col + 2,&TempCol,gGlobals.brightness);
  gfx = Borg8_DrawSimple(gfx,gGlobals.portraitBorder,160.0,(float)(u32)screen_bottom,Hscale,Hscale,
                         TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  BlendColors(col + 3,&TempCol,gGlobals.brightness);
  gfx = Borg8_DrawSimple(gfx,gGlobals.portraitBorder,198.0,(float)(u32)screen_bottom,Hscale,Hscale,
                         TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  TempCol.G = 0xff;
  TempCol.R = 0xff;
  TempCol.A = 0x80;
  BlendColors(&TempCol,&TempCol,gGlobals.brightness);
  pCVar1 = (PARTY)->Members[0];
  if ((pCVar1) && (pCVar1->portrait)) {
    gfx = Borg8_DrawSimple(gfx,pCVar1->portrait,90.0,(float)(screen_bottom + 6),0.75f,
                           0.75f,TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  }
  pCVar1 = (PARTY)->Members[1];
  if ((pCVar1) && (pCVar1->portrait)) {
    gfx = Borg8_DrawSimple(gfx,pCVar1->portrait,128.0,(float)(screen_bottom + 6),0.75f,
                           0.75f,TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  }
  pCVar1 = (PARTY)->Members[2];
  if ((pCVar1) && (pCVar1->portrait)) {
    gfx = Borg8_DrawSimple(gfx,pCVar1->portrait,166.0,(float)(screen_bottom + 6),0.75f,
                           0.75f,TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  }
  pCVar1 = (PARTY)->Members[3];
  if ((pCVar1) && (pCVar1->portrait)) {
    gfx = Borg8_DrawSimple(gfx,pCVar1->portrait,204.0,(float)(screen_bottom + 6),0.75f,
                           0.75f,TempCol.R,TempCol.G,TempCol.B,TempCol.A);
  }
  return gfx;
}

void Portraits::FreeBorder(void){
  FREEQB8(&gGlobals.portraitBorder);
  gGlobals.portraitBorder = NULL;
}