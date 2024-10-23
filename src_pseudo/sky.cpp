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
void Sky::loadDay(SkySubstruct *param_1,u16 param_2){
  u32 BVar2;
  int iVar5;
  Borg8header *pBVar6;
  u32 sky_borg8s []={0,0x19f,0x19E,0x19A,0x0199,0x1A0,0x19D,0x19B,0x19C};
  if (param_2 != param_1->type) {
    FreeSubstruct(param_1);
    param_1->type = param_2;
    pBVar6 = get_borg_8(sky_borg8s[param_2]);
    param_1->Borg8 = pBVar6;
    param_1->Bitmap = (pBVar6->dat).offset;
    if (((pBVar6->dat).Height != 37) || ((pBVar6->dat).Width != 12))
      CRASH("LoadDay","Invalid Image Height or Width");
  }
}


void Sky::AllocGradient(void){  
  if (!gGlobals.sky.gradient)
    ALLOCS(gGlobals.sky.gradient,Graphics::get_vres() << 2,137);
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
  
  fogx2 = gGlobals.Sub.weather.fogTime + gGlobals.Sub.weather.fogTime;
  if (1.0f < fogx2) fogx2 = 1.0f;
  red2 = gGlobals.sky.colors[2].R / 255.0f;
  green2 = gGlobals.sky.colors[2].G / 255.0f;
  blue2 = gGlobals.sky.colors[2].B / 255.0f;
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
        colfloat.x = fVar26 - (fVar26 - (fVar28 - (fVar28 - pCVar5->R /
                                                            255.0f) * fVar22)) * fVar18
        ;
        colfloat.y = fVar25 - (fVar25 - (fVar23 - (fVar23 - pCVar5->G /
                                                            255.0f) * fVar22)) * fVar18
        ;
        colfloat.z = fVar27 - (fVar27 - (fVar20 - (fVar20 - pCVar5->B /
                                                            255.0f) * fVar22)) * fVar18
        ;
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
          colfloat.x-=(colfloat.x -(fVar27 - (fVar27 - (fVar28 - (fVar28 - pCVar7->R /
                                                               255.0f) * fVar22)) *
                                 fVar18)) * param_5;
          colfloat.y-=(colfloat.y -
                       (fVar26 - (fVar26 - (fVar25 - (fVar25 - pCVar7->G /
                                                               255.0f) * fVar22)) *
                                 fVar18)) * param_5;
          colfloat.z -=(colfloat.z -
                       (fVar23 - (fVar23 - (fVar20 - (fVar20 - pCVar7->B /
                                                               255.0f) * fVar22)) *
                                 fVar18)) * param_5;
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
          if (colfloat.x < 0.0) colfloat.x = 0.0;
          if (colfloat.y < 0.0) colfloat.y = 0.0;
          if (colfloat.z < 0.0) colfloat.z = 0.0;
          if (1.0f < colfloat.x) colfloat.x = 1.0f;
          if (1.0f < colfloat.y) colfloat.y = 1.0f;
          if (1.0f < colfloat.z) colfloat.z = 1.0f;
        }
        if (gGlobals.brightness < 1.0f) multiVec3(&colfloat,gGlobals.brightness);
        if (gGlobals.sky.unk40 < fVar19) multiVec3(&colfloat,gGlobals.sky.unk40);
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
  vec3f fStack304;
  
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
  fStack304.x = fVar6 - (fVar6 - pCVar1->R / 255.0f) * fVar9;
  fStack304.y = fVar8 - (fVar8 - pCVar1->G / 255.0f) * fVar9;
  fStack304.z = fVar7 - (fVar7 - pCVar1->B / 255.0f) * fVar9;
  if (0.0 < gray) {
    pCVar1 = transSky + iVar3;
    if (!transSky) CRASH("GenerateSky","No Transition Sky to load from");
    fVar6 = pCVar1->R / 255.0f;
    fVar8 = pCVar1->G / 255.0f;
    pCVar2 = transSky + iVar4;
    fVar7 = pCVar1->B / 255.0f;
    fStack304.x -=(fStack304.x -
                  (fVar6 - (fVar6 - pCVar2->R / 255.0f) * fVar9)) * gray;
    fStack304.y -=(fStack304.y -
                  (fVar8 - (fVar8 - pCVar2->G / 255.0f) * fVar9)) * gray;
    fStack304.z -=(fStack304.z -
                  (fVar7 - (fVar7 - pCVar2->B / 255.0f) * fVar9)) * gray;
  }
  outVec->x = fStack304.x;
  outVec->y = fStack304.y;
  outVec->z = fStack304.z;
}

void Sky::SetColors(Color32 *col0,Color32 *col1,float param_3,float gray,Color32 *param_5,
                   Color32 *param_6,Color32 *param_7,Color32 *param_8,Color32 *param_9,
                   float param_10){
  float fVar3;
  float fVar4;
  byte bVar5;
  float fVar6;
  double dVar7,dVar2;
  float fVar8;
  float fVar9;
  vec3f fStack512;
  vec3f fStack448;
  vec3f fStack384;
  vec3f fStack320;
  vec3f fStack256;
  vec3f fStack_c0;
  vec3f fStack_80;
  
  GenerateSky(col0,col1,param_3,gray,0x20,&fStack512);
  GenerateSky(col0,col1,param_3,gray,0x21,&fStack448);
  GenerateSky(col0,col1,param_3,gray,0x22,&fStack384);
  GenerateSky(col0,col1,param_3,gray,0x23,&fStack320);
  GenerateSky(col0,col1,param_3,gray,0x24,&fStack256);
  dVar7 = fStack512.x * 0.65 + 0.15;
  dVar2 = fStack512.y * 0.65 + 0.15;
  multiVec3(&fStack512,gGlobals.brightness);
  multiVec3(&fStack448,gGlobals.brightness);
  multiVec3(&fStack384,gGlobals.brightness);
  multiVec3(&fStack320,gGlobals.brightness);
  multiVec3(&fStack256,gGlobals.brightness);
  fVar8 = (dVar7 + param_10) * gGlobals.brightness;
  fVar9 = (dVar2 + param_10) * gGlobals.brightness;
  multiVec3(&fStack512,gGlobals.sky.unk40);
  multiVec3(&fStack448,gGlobals.sky.unk40);
  multiVec3(&fStack384,gGlobals.sky.unk40);
  multiVec3(&fStack320,gGlobals.sky.unk40);
  multiVec3(&fStack256,gGlobals.sky.unk40);
  fVar8 *= gGlobals.sky.unk40;
  fVar9 *= gGlobals.sky.unk40;
  fVar6 = (gGlobals.brightness * 0.2 * gGlobals.sky.unk40);
  fStack_c0.x = fStack448.x * fVar6 + fVar8;
  fStack_c0.y = fStack448.y * fVar6 + fVar8;
  fStack_c0.z = fStack448.z * fVar6 + fVar8;
  CLAMP01V3(fStack_c0);
  V3ToRGB(param_5,fStack_c0);
  param_5->A = 0xff;
  fStack_80.x = fStack448.x * fVar6 + fVar9;
  fStack_80.y = fStack448.y * fVar6 + fVar9;
  fStack_80.z = fStack448.z * fVar6 + fVar9;
  CLAMP01V3(fStack_80);
  V3ToRGB(param_6,fStack_80);
  param_6->A = 0xff;
  V3ToRGB(param_7,fStack384);
  param_7->A = 0xff;
  V3ToRGB(param_8,fStack320);
  param_8->A = 0xff;
  V3ToRGB(param_9,fStack256);
  param_9->A = 0xff;
}

void Sky::ResetGradient(Color32 *c){
  for (s16 i=0; i<Graphics::get_vres();i++) {
    c->W = 0;
    c++;
    }
}

Gfx * Sky::RenderGradient(Gfx *g,Color32 *cols,u16 h){
  Color32 *col;  
  if (h != 0) {
    for(u16 i=0;i<h;i++) {
      col = cols + i;
      g = gsFadeInOut(g,0,i,0x140,i+1,col->R,col->G,col->B,col->A);
    }
  }
  return g;
}



Gfx * Sky::RenderSky(Gfx *gfx,short delta){
  short sVar1;
  ushort uVar4;
  ushort v;
  Gfx *gfx;
  uint uVar2;
  int iVar3;
  Borg12Enum borg12;
  float fVar5;
  float fVar6;
  float fVar7;
  undefined2 uVar8;
  byte R;
  byte G;
  byte B;
  byte A;
  vec3f fStack128;
  
  fVar7 = 0.0;
  sky_flag_b = (short)(sky_flag_b + 1) + (short)((sky_flag_b + 1) / 0x14) * -0x14;
  if (3 < gGlobals.sky.Type - 1) {
      Gsprintf("type: %d out of Range: (1 - %d)",gGlobals.sky.Type,5);
      CRASH("RenderSky",gGlobals.text);
  }
  RSPFUNC5(gfx);
  gGlobals.sky.colors[0].A = 0xff;
  gGlobals.sky.colors[0].B = 0xff;
  gGlobals.sky.colors[0].G = 0xff;
  gGlobals.sky.colors[0].R = 0xff;
  gGlobals.sky.colors[1].A = 0xff;
  gGlobals.sky.colors[1].B = 0xff;
  gGlobals.sky.colors[1].G = 0xff;
  gGlobals.sky.colors[1].R = 0xff;
  gGlobals.sky.colors[2].A = 0xff;
  gGlobals.sky.colors[2].B = 0xff;
  gGlobals.sky.colors[2].G = 0xff;
  gGlobals.sky.colors[2].R = 0xff;
  if (sky_flag_A != 0) {
    if (gGlobals.sky.Type - 3 < 2) {
      sky_flag_A = 0;
    }
    ClearColors();
  }
  //todo:refactor as case-switch.
  if (gGlobals.sky.Type == 2) {
    gfx = gsFadeInOut(gfx,0,0,0x140,0xf0,0,0,0,0);
    gGlobals.sky.colors[0].A = 0x60;
    gGlobals.sky.colors[0].B = 0x60;
    gGlobals.sky.colors[0].G = 0x60;
    gGlobals.sky.colors[0].R = 0x60;
    gGlobals.sky.colors[1].A = 0x60;
    gGlobals.sky.colors[1].B = 0x60;
    gGlobals.sky.colors[1].G = 0x60;
    gGlobals.sky.colors[1].R = 0x60;
    gGlobals.sky.colors[2].A = 0;
    gGlobals.sky.colors[2].B = 0;
    gGlobals.sky.colors[2].G = 0;
    gGlobals.sky.colors[2].R = 0;
    goto LAB_800224b0;
  }
  if ((short)gGlobals.sky.Type < 3) {
    if (gGlobals.sky.Type != 1) {
LAB_80022094:
      Gsprintf("type: %d Not Supported.\nRange: (1 - %d)",gGlobals.sky.Type,5);
      CRASH("RenderSky",gGlobals.text);
    }
    goto LAB_800224b0;
  }
  if (gGlobals.sky.Type == 3) {
    fVar6 = World::get_timeofDay_float(TerrainPointer);
    if (0.0 < TerrainPointer->ThunderFloat) {
      fVar7 = RAND.GetFloatRange(0.0,1.0);
    }
    if (((double)fVar7 < (double)TerrainPointer->ThunderFloat * 0.25) &&
       (sky_flag_b == 0)) {
      gfx = gsFadeInOut(gfx,0,0,0x140,0xf0,0xff,0xff,0xff,0);
      SetColors(gGlobals.sky.obj4.bitmap,gGlobals.sky.obj10.bitmap,fVar6,gGlobals.sky.gray,
                gGlobals.sky.colors,gGlobals.sky.colors + 1,gGlobals.sky.colors + 2,
                gGlobals.sky.colors + 3,gGlobals.sky.colors + 4,
                (float)((double)-gGlobals.sky.lensFlareVal * 0.5));
      gGlobals.sky.colors[0].A = 0xff;
      gGlobals.sky.colors[0].B = 0xff;
      gGlobals.sky.colors[0].G = 0xff;
      gGlobals.sky.colors[0].R = 0xff;
      gGlobals.sky.colors[1].A = 0xff;
      gGlobals.sky.colors[1].B = 0xff;
      gGlobals.sky.colors[1].G = 0xff;
      gGlobals.sky.colors[1].R = 0xff;
      uVar2 = RAND.func(0,3);
      if (uVar2 == 1) {
        borg12 = 0x71d;
LAB_800222c4:
        uVar8 = 0x168;
      }
      else if (uVar2 == 0) {
        borg12 = Underwater_noise;
        uVar8 = 0xf0;
      }
      else {
        borg12 = rolling thunder;
        if (uVar2 != 2) {
          borg12 = thunderstorm;
          if (uVar2 != 3) goto LAB_800224b0;
          goto LAB_800222c4;
        }
        uVar8 = 0x1a4;
      }
      play_SFX(&gGlobals.SFXStruct,borg12,0,gGlobals.VolSFX,uVar8,0);
      goto LAB_800224b0;
    }
    Vec3_sub(&fStack128,&gGlobals.Sub.camera.pos,&gGlobals.Sub.camera.aim);
    vec3_normalize(&fStack128);
    SetColors(gGlobals.sky.obj4.Bitmap,gGlobals.sky.obj10.Bitmap,fVar6,gGlobals.sky.gray,
              gGlobals.sky.colors,gGlobals.sky.colors + 1,gGlobals.sky.colors + 2,
              gGlobals.sky.colors + 3,gGlobals.sky.colors + 4,
              -gGlobals.sky.lensFlareVal * 0.5));
    uVar4 = Graphics::get_vres();
    iVar3 = GenerateGradient(gGlobals.sky.obj4.Bitmap,gGlobals.sky.obj10.Bitmap,
                             __sinf(fStack128.y) * Graphics::get_vres(),fVar6,gGlobals.sky.gray,
                             gGlobals.sky.gradient,gGlobals.sky.lensFlareVal);
    gfx = RenderGradient(gfx,gGlobals.sky.gradient,(u16)iVar3);
    if (iVar3 == 0) goto LAB_80022478;
    R = gGlobals.sky.gradient[iVar3 + -1].R;
    G = gGlobals.sky.gradient[iVar3 + -1].G;
    uVar2 = iVar3 - 1U & 0xffff;
    B = gGlobals.sky.gradient[iVar3 + -1].B;
    A = gGlobals.sky.gradient[iVar3 + -1].A;
  }
  else {
    if (gGlobals.sky.Type != 4) goto LAB_80022094;
    fVar7 = World::get_timeofDay_float(TerrainPointer);
    SetColors(gGlobals.sky.obj4.bitmap,gGlobals.sky.obj10.bitmap,fVar7,gGlobals.sky.gray,
              gGlobals.sky.colors,gGlobals.sky.colors + 1,gGlobals.sky.colors + 2,
              gGlobals.sky.colors + 3,gGlobals.sky.colors + 4,
              -gGlobals.sky.lensFlareVal * 0.5));
LAB_80022478:
    uVar2 = 0;
    R = 0;
    G = 0;
    B = 0;
    A = 0;
  }
  gfx = gsFadeInOut(gfx,0,uVar2,0x140,0xf0,R,G,B,A);
LAB_800224b0:
  sVar1 = gGlobals.sky.obj10.type;
  fVar7 = (float)(int)delta;
  gGlobals.sky.gray = gGlobals.sky.gray + gGlobals.sky.grayDelta * fVar7;
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
  longlong lVar1;
  int iVar2;
  
  iVar2 = (int)((uint)(ushort)param_1 << 0x10) >> 0x10;
  lVar1 = (longlong)iVar2;
  gGlobals.sky.gray = 0.0;
  gGlobals.sky.grayDelta = 0.0;
  if ((lVar1 != gGlobals.sky.Type) ||
     ((longlong)((int)((uint)(ushort)param_2 << 0x10) >> 0x10) != (longlong)gGlobals.sky.obj4.type))
  {
    if (3 < iVar2 - 1U) {
      Gsprintf("Invalid type: %d.  Range: (1-%d)",lVar1,4);
      CRASH("SetBackgroundType",gGlobals.text);
    }
    if (lVar1 < 1) {
LAB_800226a0:
      CRASH("SetBackgroundType","Invalid Sky Type");
    }
    if (lVar1 < 3) {
      Free();
      gGlobals.sky.Type = param_1;
    }
    else {
      if (4 < lVar1) goto LAB_800226a0;
      AllocGradient();
      if ((((param_3 <= 0.0) || (gGlobals.sky.obj4.type == 0)) ||
          ((lVar1 == 4 && (gGlobals.sky.Type != 4)))) || ((lVar1 == 3 && (gGlobals.sky.Type != 3))))
      {
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
  gGlobals.sky.colors[0].W = 0;
  gGlobals.sky.colors[1].W = 0;
  gGlobals.sky.colors[2].W = 0;
}
