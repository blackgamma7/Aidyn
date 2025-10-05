#include "skyObjects.h"
#include "globals.h"

#define FILENAME "./src/lensflare.cpp"

lensflare_data gLensFlareData[]={
    {0,1.0,5.02,{250,250,250,50}},
    {1,1.0,5.97,{250,150,150,50}},
    {2,1.3,0.66,{250,250,250,50}},
    {2,1.1,0.9,{250,250,250,50}},
    {2,0.7,2.2,{250,250,250,50}},
    {1,0.5,1.12,{250,250,250,50}},
    {2,0.35,0.46,{250,250,250,50}},
    {1,0.3,1.76,{250,250,250,50}},
};
vec2f gLensFlarePos={0,0};
Borg8Header* gLensflare=NULL;

void Lensflare::Init(void){
  ALLOCS(gLensflare,sizeof(Borg8Header)*ARRAY_COUNT(gLensFlareData),87);
  for(s32 i=0;i<ARRAY_COUNT(gLensFlareData);i++) {
    switch(gLensFlareData[i].dat0){
        case 0:
        gLensflare[i]=loadBorg8(Borg8_LensflareFilled);
        break;
        case 1:
        gLensflare[i]=loadBorg8(Borg8_LensflareRing);
        break;
        case 2:
        gLensflare[i]=loadBorg8(Borg8_LensflareFilled);
        break;
    }
}
lensflare_bss = 0;
gLensFlarePos.x = -1.0f;
gLensFlarePos.y = -1.0f;
}

void Lensflare::Free(void){
  for(s32 i=0;i<ARRAY_COUNT(gLensFlareData);i++){
    FREEQB8(gLensflare[i]);
    gLensflare[i]=NULL;
  }
  HFREE(gLensflare,124);
}
Gfx * Lensflare::Render(Gfx *g){
  bool bVar2;
  uint uVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  vec2f fStack184;
  vec2f fStack120;
  

  gGlobals.sky.lensFlareVal = 0.0;
  if (false) { //?
    gGlobals.sky.lensFlareVal = 0.0;
    return g;
  }
  if (gGlobals.sky.Type != 3) { //not outside
    gGlobals.sky.lensFlareVal = 0.0;
    return g;
  }
  if ((gGlobals.lensFlareBool) && (10.0f < gLensFlarePos.x)) {
    if ((SCREEN_WIDTH-10) <= gLensFlarePos.x) {
      bVar2 = false;
      goto LAB_8002e068;
    }
    bVar2 = false;
    if ((gLensFlarePos.y <= 10.0f) ||
       (bVar2 = true, gLensFlarePos.y < (SCREEN_HEIGHT-10))) goto LAB_8002e068;
  }
  bVar2 = false;
LAB_8002e068:
  if (bVar2) {
    if ((lensflare_bss < 50) &&
       (uVar7 = (uint)lensflare_bss, lensflare_bss += 10, (int)(50 - uVar7) < 10)) {
      lensflare_bss = 50;
    }
  }
  else {
    if (lensflare_bss == 0) {
      gGlobals.sky.lensFlareVal = 0.0;
      return g;
    }
    if (lensflare_bss <= 10) lensflare_bss = 0;
    else lensflare_bss -= 10;
  }
  if (lensflare_bss != 0) {
    fStack184.x = gLensFlarePos.x - (SCREEN_WIDTH/2);
    fStack184.y = gLensFlarePos.y - (SCREEN_HEIGHT/2);
    fStack120.x = fStack184.x;
    fStack120.y = fStack184.y;
    vec2_normalize(&fStack120);
    fVar9 = (float)(1.0 -
                   (255.0 - (double)gGlobals.sky.colors[0].R) / 255.0);
    fVar10 = (float)lensflare_bss * fVar9;
    fVar8 = vec2Length(&fStack184);
    if (fVar8 <= 80.0f) {
      gGlobals.sky.lensFlareVal =
           (float)(((double)fVar9 * (1.0 - (double)(fVar8 / 80.0f)) *
                    0.5 * (double)lensflare_bss) / 50.0);
    }
    RSPFUNC6(g);
    for(s32 i=0;i<8;i++) {
      fVar9 = 1.0f;
      if ((double)(fVar8 / 80.0f) <= 1.0) fVar9 = fVar8 / 80.0f;
      fVar9 = gLensFlareData[i].f1 * fVar9;
      if (0.2 < fVar9) {
        g = Borg8_DrawSimple(g,gLensflare[i],
                             ((f32)(SCREEN_WIDTH/2) + gLensFlareData[i].f0 * fStack184.x) -((gLensflare[i]->dat).Width >> 1) * fVar9,
                             ((f32)(SCREEN_HEIGHT/2) + gLensFlareData[i].f0 * fStack184.y) -((gLensflare[i]->dat).Height >> 1) * fVar9,
                             fVar9,fVar9,
                             gLensFlareData[i].col.R,gLensFlareData[i].col.G,gLensFlareData[i].col.B,fVar10);
      }
    }
  }
  return g;
}
