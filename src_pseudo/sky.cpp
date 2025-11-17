#include "globals.h"

#define FILENAME "./src/sky.cpp"

void Sky::ResetSubstruct(SkySubstruct *param_1){
  param_1->type = 0;
  param_1->Borg8 = NULL;
  param_1->Bitmap = NULL;
}

void Sky::FreeSubstruct(SkySubstruct *param_1){
  if (param_1->Borg8) borg8_free(param_1->Borg8);
  ResetSubstruct(param_1);
}

//Loads 37*12 RGBA32 texture
void Sky::loadDay(SkySubstruct *sub,u16 type){
  u32 sky_borg8s []={0,0x19f,0x19E,0x19A,0x0199,0x1A0,0x19D,0x19B,0x19C};
  if (type != sub->type) {
    FreeSubstruct(sub);
    sub->type = type;
    sub->Borg8 = loadBorg8(sky_borg8s[type]);
    sub->Bitmap = (Color32*)sub->Borg8->dat.offset;
    if ((sub->Borg8->dat.Height != 37) || (sub->Borg8->dat.Width != 12))
      CRASH("LoadDay","Invalid Image Height or Width");
  }
}

void Sky::AllocGradient(void){  
  if (!gGlobals.sky.gradient)
    ALLOCS(gGlobals.sky.gradient,Graphics::GetVRes() << 2,137);
}

void Sky::Free(void){
  FREEPTR(gGlobals.sky.gradient,153);
  FreeSubstruct(&gGlobals.sky.obj4);
  FreeSubstruct(&gGlobals.sky.obj10);
}

void Sky::Reset(void){
  gGlobals.sky.gradient = NULL;
  gGlobals.sky.unk48 = 0.0;
  gGlobals.sky.unk40 = 1.0f;
  gGlobals.sky.unk44 = 1.0f;
  ResetSubstruct(&gGlobals.sky.obj4);
  ResetSubstruct(&gGlobals.sky.obj10);
  SetBackgroundType(2,0,0.0);
}

//unused, so not included in namespace.
void Ofunc_8002088c(void){
  Sky::SetBackgroundType(2,0,0.0);
  Sky::Free();
}


int Sky::GenerateGradient(Color32 *c0,Color32 *c1,float vert,float param_4,float param_5,Color32 *grad,float param_7){
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  Color32 *pbVar4;
  Color32 *pCVar5;
  int iVar6;
  Color32 *pCVar7;
  int iVar8;
  Color32 *pCVar9;
  Color32 *pCVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  Color32 *pCVar14;
  s16 iVar15;
  s16 iVar16;
  Color32 *pCVar17;
  float blue2;
  float fVar18;
  float fVar19;
  float green2;
  float fVar20;
  byte bVar21;
  float red2;
  float fVar22;
  float fVar23;
  float fVar24;
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  vec3f colfloat;
  float fogx2;
  int iStack_ac;
  
  fogx2 = (gGlobals.gameVars.weather.fogTime*2);
  CIEL(fogx2,1.0f);
  red2 = gFogColor.R / 255.0f;
  green2 = gFogColor.G / 255.0f;
  blue2 = gFogColor.B / 255.0f;
  iVar16 = (200 - (int)vert);
  iVar3 = 0;
  if (-1 < iVar16) {
    if (199 < iVar16) iVar16 = 199;
    iStack_ac = (200 - iVar16);
    if (iStack_ac < 0) iStack_ac = 0;
    iVar15 = 0;
    iVar3 = iVar16;
    if (0 < iVar16) {
      fVar24 = param_4 * 12.0f;
      iVar1 = (int)fVar24 << 0x10;
      iVar4 = iVar1 >> 0x10;
      iVar1 >>= 0x1f;
      pCVar14 = grad;
      pCVar17 = grad;
      do {
        fVar19 = 1.0f;
        fVar22 = ((float)(iVar15 + iStack_ac) / 200.0f) * 31.0f;
        iVar6 = (int)(short)(int)fVar22;
        iVar13 = (iVar4 + ((iVar4 / 6 + iVar1 >> 1) - iVar1) * -0xc) * 0x10000 >> 0x10;
        iVar11 = iVar13 + 1;
        fVar22 = fVar22 - (float)iVar6;
        iVar2 = iVar6 * 0xc + iVar13;
        pbVar4 = c0 + iVar2;
        iVar12 = (iVar11 + ((iVar11 / 6 + (iVar11 >> 0x1f) >> 1) - (iVar11 >> 0x1f)) * -0xc) *
                 0x10000 >> 0x10;
        iVar8 = iVar6 * 0xc + iVar12;
        pCVar9 = c0 + iVar8;
        fVar26 = pbVar4->R / 255.0f;
        fVar25 = pbVar4->G / 255.0f;
        iVar11 = ((iVar6 + 1) * 0x10000 >> 0x10) * 0xc;
        fVar27 = pbVar4->B / 255.0f;
        iVar6 = iVar11 + iVar13;
        pCVar7 = c0 + iVar6;
        iVar11 += iVar12;
        pCVar5 = c0 + iVar11;
        fVar28 = pCVar9->R / 255.0f;
        fVar23 = pCVar9->G / 255.0f;
        fVar26 = fVar26 - (fVar26 - pCVar7->R / 255.0f) * fVar22;
        fVar18 = fVar24 - (float)iVar13;
        fVar20 = pCVar9->B / 255.0f;
        fVar25 = fVar25 - (fVar25 - pCVar7->G / 255.0f) * fVar22;
        fVar27 = fVar27 - (fVar27 - pCVar7->B / 255.0f) * fVar22;
        colfloat.x = fVar26 - (fVar26 - (fVar28 - (fVar28 - pCVar5->R /255.0f) * fVar22)) * fVar18;
        colfloat.y = fVar25 - (fVar25 - (fVar23 - (fVar23 - pCVar5->G /255.0f) * fVar22)) * fVar18;
        colfloat.z = fVar27 - (fVar27 - (fVar20 - (fVar20 - pCVar5->B /255.0f) * fVar22)) * fVar18;
        if (0.0 < param_5) {
          pCVar5 = c1 + iVar2;
          pCVar9 = c1 + iVar6;
          pCVar10 = c1 + iVar8;
          fVar27 = pCVar5->R / 255.0f;
          fVar26 = pCVar5->G / 255.0f;
          pCVar7 = c1 + iVar11;
          fVar23 = pCVar5->B / 255.0f;
          fVar28 = pCVar10->R / 255.0f;
          fVar25 = pCVar10->G / 255.0f;
          fVar20 = pCVar10->B / 255.0f;
          fVar27 = fVar27 - (fVar27 - pCVar9->R / 255.0f) * fVar22;
          fVar26 = fVar26 - (fVar26 - pCVar9->G / 255.0f) * fVar22;
          fVar23 = fVar23 - (fVar23 - pCVar9->B / 255.0f) * fVar22;
          colfloat.x-=(colfloat.x -(fVar27 - (fVar27 - (fVar28 - (fVar28 - pCVar7->R /255.0f) * fVar22)) *fVar18)) * param_5;
          colfloat.y-=(colfloat.y -(fVar26 - (fVar26 - (fVar25 - (fVar25 - pCVar7->G /255.0f) * fVar22)) *fVar18)) * param_5;
          colfloat.z -=(colfloat.z -(fVar23 - (fVar23 - (fVar20 - (fVar20 - pCVar7->B /255.0f) * fVar22)) *fVar18)) * param_5;
        }
        if ((param_7 != 0.0) || (fogx2 != 0.0)) {
          if (param_7 != 0.0) {
            colfloat.x+= param_7;
            colfloat.y+= param_7;
            colfloat.z+= param_7;
          }
          if (fogx2 != 0.0) {
            colfloat.x-= (colfloat.x - red2 * fogx2) * fogx2;
            colfloat.y-= (colfloat.y - green2 * fogx2) * fogx2;
            colfloat.z-= (colfloat.z - blue2 * fogx2) * fogx2;
          }
          FLOOR(colfloat.x,0.0);
          FLOOR(colfloat.y,0.0);
          FLOOR(colfloat.z,0.0);
          CIEL(colfloat.x,1.0f);
          CIEL(colfloat.y,1.0f);
          CIEL(colfloat.z,1.0f);
        }
        if (gGlobals.brightness < 1.0f) Vec3Scale(&colfloat,gGlobals.brightness);
        if (gGlobals.sky.unk40 < fVar19) Vec3Scale(&colfloat,gGlobals.sky.unk40);
        V3ToRGB(pCVar17,colfloat);
        grad++;
        pCVar14++;
        iVar15++;
        pCVar17++;
      } while (iVar15 < iVar16);
    }
  }
  return iVar3;
}


void Sky::GenerateSky(Color32 *col,Color32 *transSky,float param_3,float gray,short param_5,vec3f *outVec){
  Color32 *pCVar1;
  Color32 *pCVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  vec3f tempV;
  
  iVar3 = (int)(param_3 * 12.0f) << 0x10;
  iVar4 = iVar3 >> 0x10;
  iVar3 >>= 0x1f;
  iVar5 = (iVar4 + ((iVar4 / 6 + iVar3 >> 1) - iVar3) * -0xc) * 0x10000 >> 0x10;
  iVar3 = param_5 * 0xc + iVar5;
  pCVar1 = col + iVar3;
  iVar4 = iVar5 + 1;
  fVar6 = pCVar1->R / 255.0f;
  fVar8 = pCVar1->G / 255.0f;
  fVar9 = param_3 * 12.0f - (float)iVar5;
  fVar7 = pCVar1->B / 255.0f;
  iVar4 = param_5 * 0xc +
          ((iVar4 + ((iVar4 / 6 + (iVar4 >> 0x1f) >> 1) - (iVar4 >> 0x1f)) * -0xc) * 0x10000 >> 0x10
          );
  pCVar1 = col + iVar4;
  tempV.x = fVar6 - (fVar6 - pCVar1->R / 255.0f) * fVar9;
  tempV.y = fVar8 - (fVar8 - pCVar1->G / 255.0f) * fVar9;
  tempV.z = fVar7 - (fVar7 - pCVar1->B / 255.0f) * fVar9;
  if (0.0 < gray) {
    pCVar1 = transSky + iVar3;
    if (!transSky) CRASH("GenerateSky","No Transition Sky to load from");
    fVar6 = pCVar1->R / 255.0f;
    fVar8 = pCVar1->G / 255.0f;
    pCVar2 = transSky + iVar4;
    fVar7 = pCVar1->B / 255.0f;
    tempV.x -=(tempV.x -
                  (fVar6 - (fVar6 - pCVar2->R / 255.0f) * fVar9)) * gray;
    tempV.y -=(tempV.y -
                  (fVar8 - (fVar8 - pCVar2->G / 255.0f) * fVar9)) * gray;
    tempV.z -=(tempV.z -
                  (fVar7 - (fVar7 - pCVar2->B / 255.0f) * fVar9)) * gray;
  }
  outVec->x = tempV.x;
  outVec->y = tempV.y;
  outVec->z = tempV.z;
}

void Sky::SetColors(Color32 *col0,Color32 *col1,float param_3,float gray,Color32 *mainTint,
                   Color32 *skyTint,Color32 *fogTint,Color32 *cloudTint,Color32 *sunTint,
                   float param_10){
  float fVar3;
  float fVar4;
  byte bVar5;
  float fVar6;
  double dVar7,dVar2;
  float fVar8;
  float fVar9;
  vec3f mainColVec,skyColRes,fogColVec,cloudColVec,
     sunColVec,mainColRes,skyColRes;
  
  GenerateSky(col0,col1,param_3,gray,0x20,&mainColVec);
  GenerateSky(col0,col1,param_3,gray,0x21,&skyColRes);
  GenerateSky(col0,col1,param_3,gray,0x22,&fogColVec);
  GenerateSky(col0,col1,param_3,gray,0x23,&cloudColVec);
  GenerateSky(col0,col1,param_3,gray,0x24,&sunColVec);
  dVar7 = mainColVec.x * 0.65 + 0.15;
  dVar2 = mainColVec.y * 0.65 + 0.15;
  Vec3Scale(&mainColVec,gGlobals.brightness);
  Vec3Scale(&skyColRes,gGlobals.brightness);
  Vec3Scale(&fogColVec,gGlobals.brightness);
  Vec3Scale(&cloudColVec,gGlobals.brightness);
  Vec3Scale(&sunColVec,gGlobals.brightness);
  fVar8 = (dVar7 + param_10) * gGlobals.brightness;
  fVar9 = (dVar2 + param_10) * gGlobals.brightness;
  Vec3Scale(&mainColVec,gGlobals.sky.unk40);
  Vec3Scale(&skyColRes,gGlobals.sky.unk40);
  Vec3Scale(&fogColVec,gGlobals.sky.unk40);
  Vec3Scale(&cloudColVec,gGlobals.sky.unk40);
  Vec3Scale(&sunColVec,gGlobals.sky.unk40);
  fVar8 *= gGlobals.sky.unk40;
  fVar9 *= gGlobals.sky.unk40;
  fVar6 = (gGlobals.brightness * 0.2 * gGlobals.sky.unk40);
  mainColRes.x = skyColRes.x * fVar6 + fVar8;
  mainColRes.y = skyColRes.y * fVar6 + fVar8;
  mainColRes.z = skyColRes.z * fVar6 + fVar8;
  CLAMP01V3(mainColRes);
  V3ToRGB(mainTint,mainColRes);
  mainTint->A = 0xff;
  skyColRes.x = skyColRes.x * fVar6 + fVar9;
  skyColRes.y = skyColRes.y * fVar6 + fVar9;
  skyColRes.z = skyColRes.z * fVar6 + fVar9;
  CLAMP01V3(skyColRes);
  V3ToRGB(skyTint,skyColRes);
  skyTint->A = 0xff;
  V3ToRGB(fogTint,fogColVec);
  fogTint->A = 0xff;
  V3ToRGB(cloudTint,cloudColVec);
  cloudTint->A = 0xff;
  V3ToRGB(sunTint,sunColVec);
  sunTint->A = 0xff;
}

void Sky::ResetGradient(Color32 *c){
  for (s16 i=0; i<Graphics::GetVRes();i++) {
    c->W = 0;
    c++;
    }
}

Gfx * Sky::RenderGradient(Gfx *g,Color32 *cols,u16 h){
  Color32 *col;  
  if (h != 0) {
    for(u16 i=0;i<h;i++) {
      col = cols + i;
      g = DrawRectangle(g,0,i,SCREEN_WIDTH,i+1,col->R,col->G,col->B,col->A);
    }
  }
  return g;
}

Gfx * Sky::RenderSky(Gfx *gfx,u16 delta){
  short sVar1;
  u16 uVar4;
  u16 v;
  Gfx *gfx;
  uint uVar2;
  int iVar3;
  float fVar5;
  float fVar6;
  float fVar7;
  u16 uVar8;
  byte R;
  byte G;
  byte B;
  byte A;
  vec3f fStack128;
  
  fVar7 = 0.0;
  sky_flag_b = (sky_flag_b + 1) + ((sky_flag_b + 1) / 20) * -20;
  if (3 < gGlobals.sky.Type - 1) {
      Gsprintf("type: %d out of Range: (1 - %d)",gGlobals.sky.Type,5);
      CRASH("RenderSky",gGlobals.text);
  }
  RSPFUNC5(gfx);
  gMainColor.A = 0xff;
  gMainColor.B = 0xff;
  gMainColor.G = 0xff;
  gMainColor.R = 0xff;
  gSkyColor.A = 0xff;
  gSkyColor.B = 0xff;
  gSkyColor.G = 0xff;
  gSkyColor.R = 0xff;
  gFogColor.A = 0xff;
  gFogColor.B = 0xff;
  gFogColor.G = 0xff;
  gFogColor.R = 0xff;
  if (sky_flag_A != 0) {
    if (gGlobals.sky.Type - 3 < 2) {
      sky_flag_A = 0;
    }
    ClearColors();
  }
  switch(gGlobals.sky.Type){
    case 1:{
      break;
    }
    case 2:{
    gfx = DrawRectangle(gfx,FULL_SCREENSPACE,0,0,0,0);
    gMainColor.A = 0x60;
    gMainColor.B = 0x60;
    gMainColor.G = 0x60;
    gMainColor.R = 0x60;
    gSkyColor.A = 0x60;
    gSkyColor.B = 0x60;
    gSkyColor.G = 0x60;
    gSkyColor.R = 0x60;
    gFogColor.A = 0;
    gFogColor.B = 0;
    gFogColor.G = 0;
    gFogColor.R = 0;
    break;
    }
    case 3:{
    fVar6 = World::get_timeofDay_float(TerrainPointer);
    //Thunderclap chance
    if (0.0 < TerrainPointer->ThunderFloat) fVar7 = RAND.GetFloatRange(0.0,1.0);
    if ((fVar7 < TerrainPointer->ThunderFloat * 0.25) &&(sky_flag_b == 0)) {
      gfx = DrawRectangle(gfx,FULL_SCREENSPACE,0xff,0xff,0xff,0);
      SetColors(gGlobals.sky.obj4.Bitmap,gGlobals.sky.obj10.Bitmap,fVar6,gGlobals.sky.gray,
                &gMainColor,&gSkyColor,&gFogColor,&gCloudColor,&gSunColor,
                (-gGlobals.sky.lensFlareVal * 0.5));
      gMainColor={COLOR_WHITE};
      gSkyColor={COLOR_WHITE};
      switch(RAND.func(0,3)){
        case 0:{
          PLAYSFX(0x071c,0,gGlobals.VolSFX,320,0);
          break;
        }
        case 1:{
          PLAYSFX(0x071d,0,gGlobals.VolSFX,360,0);
          break;
        }
        case 2:{
          PLAYSFX(0x071e,0,gGlobals.VolSFX,420,0);
          break;
        }
        case 3:{
          PLAYSFX(0x071f,0,gGlobals.VolSFX,360,0);
          break;
        }
      }
    }
    else{
      Vec3Sub(&fStack128,&gCamera.pos,&gCamera.aim);
      Vec3Normalize(&fStack128);
      SetColors(gGlobals.sky.obj4.Bitmap,gGlobals.sky.obj10.Bitmap,fVar6,gGlobals.sky.gray,
              gGlobals.sky.colors,&gSkyColor,&gFogColor,&gCloudColor,&gSunColor,
              -gGlobals.sky.lensFlareVal * 0.5));
      iVar3 = GenerateGradient(gGlobals.sky.obj4.Bitmap,gGlobals.sky.obj10.Bitmap,
                             (float)(__sinf(fStack128.y) * Graphics::GetVRes()),fVar6,gGlobals.sky.gray,
                             gGlobals.sky.gradient,gGlobals.sky.lensFlareVal);
      gfx = RenderGradient(gfx,gGlobals.sky.gradient,(u16)iVar3);
      if (iVar3 == 0) goto LAB_80022478;
      R = gGlobals.sky.gradient[iVar3 + -1].R;
      G = gGlobals.sky.gradient[iVar3 + -1].G;
      B = gGlobals.sky.gradient[iVar3 + -1].B;
      A = gGlobals.sky.gradient[iVar3 + -1].A;
      gfx = DrawRectangle(gfx,0,(u16)(iVar3-1),SCREEN_WIDTH,SCREEN_HEIGHT,R,G,B,A);
    }
    break;
  }
  case 4:{
    SetColors(gGlobals.sky.obj4.Bitmap,gGlobals.sky.obj10.Bitmap,
      World::get_timeofDay_float(TerrainPointer),gGlobals.sky.gray,
              &gMainColor,&gSkyColor,&gFogColor,&gCloudColor,&gSunColor,
              -gGlobals.sky.lensFlareVal * 0.5);
LAB_80022478:
    uVar2 = 0;
    R = 0;
    G = 0;
    B = 0;
    A = 0;
    gfx = DrawRectangle(gfx,0,uVar2,SCREEN_WIDTH,SCREEN_HEIGHT,R,G,B,A);
    break;
  }
  default:{
      Gsprintf("type: %d Not Supported.\nRange: (1 - %d)",gGlobals.sky.Type,5);
      CRASH("RenderSky",gGlobals.text);
  }
  }
LAB_800224b0:
  sVar1 = gGlobals.sky.obj10.type;
  fVar7 = (float)delta;
  gGlobals.sky.gray+= gGlobals.sky.grayDelta * fVar7;
  if (1.0f <= gGlobals.sky.gray) {
    gGlobals.sky.gray = 0.0;
    gGlobals.sky.grayDelta = 0.0;
    FreeSubstruct(&gGlobals.sky.obj4);
    FreeSubstruct(&gGlobals.sky.obj10);
    loadDay(&gGlobals.sky.obj4,sVar1);
  }
  if (gGlobals.sky.unk48 != 0.0) {
    fVar6 = gGlobals.sky.unk44 - gGlobals.sky.unk40;
    if (fVar6 <= 0.0) fVar6 = -fVar6;
    fVar5 = gGlobals.sky.unk48 * fVar7;
    if (fVar5 <= 0.0) fVar5 = -fVar5;
    if (fVar6 <= fVar5) {
      gGlobals.sky.unk48 = 0.0;
      gGlobals.sky.unk40 = gGlobals.sky.unk44;
    }
    else gGlobals.sky.unk40+= gGlobals.sky.unk48 * fVar7;
  }
  return gfx;
}

void Sky::Set2Floats(float param_1,float param_2){
  gGlobals.sky.unk44 = param_1;
  gGlobals.sky.unk48 = (param_1 - gGlobals.sky.unk40) / param_2;
}


void Sky::SetBackgroundType(short param_1,short param_2,float param_3){
  gGlobals.sky.gray = 0.0;
  gGlobals.sky.grayDelta = 0.0;
  if ((param_1 != gGlobals.sky.Type) || (param_2 != gGlobals.sky.obj4.type))
  {
    if (3 < param_1 - 1U) {
      Gsprintf("Invalid type: %d.  Range: (1-%d)",param_1,4);
      CRASH("SetBackgroundType",gGlobals.text);
    }
    if (param_1 < 1) {
LAB_800226a0:
      CRASH("SetBackgroundType","Invalid Sky Type");
    }
    if (param_1 < 3) {
      Sky::Free();
      gGlobals.sky.Type = param_1;
    }
    else {
      if (4 < param_1) goto LAB_800226a0;
      AllocGradient();
      if ((((param_3 <= 0.0) || (gGlobals.sky.obj4.type == 0)) ||
          ((param_1 == 4 && (gGlobals.sky.Type != 4)))) || ((param_1 == 3 && (gGlobals.sky.Type != 3)))){
        loadDay(&gGlobals.sky.obj4,param_2);
        FreeSubstruct(&gGlobals.sky.obj10);
        gGlobals.sky.Type = param_1;
      }
      else {
        loadDay(&gGlobals.sky.obj10,param_2);
        gGlobals.sky.grayDelta = 1.0f / param_3;
        gGlobals.sky.Type = param_1;
      }
    }
  }
}

void Sky::ClearColors(void){
  gMainColor.W = 0;
  gSkyColor.W = 0;
  gFogColor.W = 0;
}
