#include "skyObjects.h"
#include "globals.h"

#define FILENAME "./src/clouds.cpp"
#define CloudGray {150,150,150,255}

u16 gCloudCount=0;
Borg8Header* gCloudBorg8=NULL;
cloudStruct gCloudData[]={
    {CloudTypeA,{-530,10,-530},0,CloudGray,0.2},  //0
    {CloudTypeB,{-318,10,-530},0,CloudGray,0.4},  //1
    {CloudTypeC,{-106,10,-530},0,CloudGray,0.6},  //2
    {CloudTypeA,{106,10,-530}, 0,CloudGray,0.8},  //3
    {CloudTypeB,{318,10,-530}, 0,CloudGray,1.0},  //4
    {CloudTypeC,{-530,10,-424},0,CloudGray,0.2},  //5
    {CloudTypeB,{-318,10,-424},0,CloudGray,0.4},  //6
    {CloudTypeA,{-106,10,-424},0,CloudGray,0.6},  //7
    {CloudTypeB,{106,10,-424}, 0,CloudGray,0.8},  //8
    {CloudTypeC,{318,10,-424}, 0,CloudGray,1.0},  //9
    {CloudTypeA,{-424,10,-318},0,CloudGray,0.2},  //10
    {CloudTypeB,{-212,10,-318},0,CloudGray,0.4},  //11
    {CloudTypeC,{0,10,-318},   0,CloudGray,0.6},  //12
    {CloudTypeA,{106,10,-318}, 0,CloudGray,0.8},  //13
    {CloudTypeB,{424,10,-318}, 0,CloudGray,1.0},  //14
    {CloudTypeC,{-530,10,-212},0,CloudGray,0.2},  //15
    {CloudTypeA,{-106,10,-212},0,CloudGray,0.4},  //16
    {CloudTypeB,{0,10,-212},   0,CloudGray,0.6},  //17
    {CloudTypeC,{106,10,-212}, 0,CloudGray,0.8},  //18
    {CloudTypeA,{212,10,-212}, 0,CloudGray,1.0},  //19
    {CloudTypeB,{424,10,-212}, 0,CloudGray,0.2},  //20
    {CloudTypeC,{-106,10,-106},0,CloudGray,0.4},  //21
    {CloudTypeA,{0,10,-106},   0,CloudGray,0.6},  //22
    {CloudTypeB,{106,10,-106}, 0,CloudGray,0.8},  //23
    {CloudTypeC,{424,10,-106}, 0,CloudGray,1.0},  //24
    {CloudTypeA,{-530,10,0},   0,CloudGray,0.2},  //25
    {CloudTypeB,{-106,10,0},   0,CloudGray,0.4},  //26
    {CloudTypeC,{0,10,0},      0,CloudGray,0.6},  //27
    {CloudTypeA,{210,10,0},    0,CloudGray,0.8},  //28
    {CloudTypeB,{424,10,0},    0,CloudGray,1.0},  //29
    {CloudTypeC,{-424,10,106}, 0,CloudGray,0.2},  //30
    {CloudTypeA,{-212,10,106}, 0,CloudGray,0.4},  //31
    {CloudTypeB,{0,10,106},    0,CloudGray,0.6},  //32
    {CloudTypeC,{212,10,106},  0,CloudGray,0.8},  //33
    {CloudTypeA,{318,10,106},  0,CloudGray,1.0},  //34
    {CloudTypeB,{-424,10,212}, 0,CloudGray,0.2},  //35
    {CloudTypeC,{-318,10,212}, 0,CloudGray,0.4},  //36
    {CloudTypeA,{-212,10,212}, 0,CloudGray,0.6},  //37
    {CloudTypeB,{0,10,212},    0,CloudGray,0.8},  //38
    {CloudTypeC,{424,10,212},  0,CloudGray,1.0},  //39
    {CloudTypeA,{-530,10,318}, 0,CloudGray,0.2},  //40
    {CloudTypeB,{-424,10,318}, 0,CloudGray,0.4},  //41
    {CloudTypeC,{-212,10,318}, 0,CloudGray,0.6},  //42
    {CloudTypeA,{212,10,318},  0,CloudGray,0.8},  //43
    {CloudTypeB,{318,10,318},  0,CloudGray,1.0},  //44
    {CloudTypeC,{-530,10,424}, 0,CloudGray,0.2},  //45
    {CloudTypeA,{-212,10,424}, 0,CloudGray,0.4},  //46
    {CloudTypeB,{-106,10,424}, 0,CloudGray,0.6},  //47
    {CloudTypeC,{212,10,424},  0,CloudGray,0.8},  //48
    {CloudTypeA,{424,10,424},  0,CloudGray,1.0},  //49
    {CloudTypeB,{-530,10,530}, 0,CloudGray,0.2},  //50
    {CloudTypeC,{-318,10,530}, 0,CloudGray,0.4},  //51
    {CloudTypeA,{0,10,530},    0,CloudGray,0.6},  //52
    {CloudTypeB,{212,10,530},  0,CloudGray,0.8},  //53
    {CloudTypeC,{424,10,530},  0,CloudGray,1.0},  //54
    {CloudTypeEND,{0,0,0}     ,0,{0,0,0,0},0.0}   //55
};

void Clouds::Init(void){
  
  gGlobals.cloudsFloat = 1.0f;
  gCloudCount = 0;
  if (gCloudData[0].index != CloudTypeEND) {
    gCloudCount = 1;
    while (gCloudData[gCloudCount].index != CloudTypeEND) gCloudCount++;
  }
  for(s32 i=0;i<3;i++) {
    switch(i){
        case 0: gCloudBorg8Base[0] = loadBorg8(BORG8_CloudA); break;
        case 1: gCloudBorg8Base[1] = loadBorg8(BORG8_CloudB); break;
        case 2: gCloudBorg8Base[2] = loadBorg8(BORG8_CloudC); break;
        default: gCloudBorg8Base[i] = NULL; break;
    }
  }
  ALLOCS(gCloudBorg8,gCloudCount*sizeof(Borg8Header*),226);
  for(u32 i=gCloudCount;i!=0;i--){
      switch (gCloudData[i].index){
      case CloudTypeA:
        gCloudBorg8[i]=gCloudBorg8Base[0];
        break;
      case CloudTypeB:
        gCloudBorg8[i]=gCloudBorg8Base[1];
        break;
      case CloudTypeC:
        gCloudBorg8[i]=gCloudBorg8Base[2];
        break;
      }

      if (gGlobals.cloudsFloat < gCloudData[i].f3)
        gCloudData[i].col.A = 0;
  }
}

void Clouds::Free(void){
  for(s32 i=2;i>-1;i--) {
    if (gCloudBorg8Base[i]) {
      FREEQB8(gCloudBorg8Base[i]);
      gCloudBorg8Base[i] = NULL;
    }
  }
  for (u32 i = (u32)gCloudCount; i != 0; i--) {
    if (gCloudBorg8[i]) gCloudBorg8[i]=NULL;
  }
  FREE(gCloudBorg8,0x119);
}

Gfx * Clouds::Render(Gfx *g){
  float camRotX;
  float camRotZ;
  float camRotY;
  ushort h;
  ushort v;
  int iVar5;
  int i;
  float camLength;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  float fVar12;
  float alpha;
  float fVar14;
  float fVar15;
  float fVar16;
  vec3f v3Temp;
  vec2f v2Temp;
  
  if ((true) && (gGlobals.sky.Type == SkyTypeOutdoor)) {
    CalcWind();
    camRotY = gCamera.rotation.y;
    camRotZ = gCamera.rotationXZ.y;
    camRotX = gCamera.rotationXZ.x;
    camLength = _sqrtf(SQ(gCamera.rotation.x)+SQ(gCamera.rotation.z));
    RSPFUNC6(g);
    if (gCloudCount != 0) {
      for(i=0;i<gCloudCount;i++){
        v3Temp.y = 0.0;
        v3Temp.x = -gCloudData[i].v3.x;
        v3Temp.z = -gCloudData[i].v3.z;
        fVar8 = Vec3Normalize(&v3Temp);
        v2Temp.x = v3Temp.x;
        v2Temp.y = v3Temp.z;
        fVar15 = 1.0f - fVar8 / 750.0f;
        Vec2Normalize(&v2Temp);
        fVar12 = v2Temp.x * camRotZ;
        fVar10 = v2Temp.y * camRotX;
        fVar16 = (v2Temp.x * camRotX - v2Temp.y * camRotZ) * 300.0f + 160.0f;
        fVar9 = _sqrtf(SQ(v3Temp.x) + SQ(v3Temp.z));
        fVar8 = (float)gCloudData[i].col.A;
        fVar11 = v3Temp.y * camRotY;
        alpha = (float)((double)(fVar8 * gGlobals.gameVars.weather.fogTime) * 1.5);
        fVar14 = (fVar9 * camRotY + v3Temp.y * camLength) * 300.0f + 120.0f;
        if ((alpha <= fVar8) && (fVar8 = alpha, alpha < 0.0)) {
          fVar8 = 0.0;
        }
        alpha = ((float)gCloudData[i].col.A - fVar8) * _sqrtf(fVar15);
        if ((0.0 < fVar12 + fVar10) && (0.0 < fVar9 * camLength - fVar11)) {
          g = Borg8_DrawSimple(g,gCloudBorg8[i],
                               fVar16 - gCloudBorg8[i]->dat.Width * fVar15 *0.5f,
                               (fVar14 - fVar15 * 240.0f) - gCloudBorg8[i]->dat.Height * fVar15 * 0.5f,
                               (float)((double)fVar15 + 0.2),
                               (float)((double)fVar15 + 0.2),
                               gCloudColor.R,gCloudColor.G,gCloudColor.B,alpha);
        }
      }
    }
  }
  return g;
}

void Clouds::CalcWind(void){
  if (gCloudCount != 0) {
    for(u32 i=0;i<gCloudCount;i++){
      gCloudData[i].v3.x+= (TerrainPointer->windVelocity).x * 4.0;
      gCloudData[i].v3.z+= (TerrainPointer->windVelocity).z * 4.0;
      if (750.0f < _sqrtf(SQ(gCloudData[i].v3.x) + SQ(gCloudData[i].v3.z))) {
        gCloudData[i].v3.x = (TerrainPointer->windVelocity).x * 4.0 - gCloudData[i].v3.x;
        gCloudData[i].v3.z = (TerrainPointer->windVelocity).z * 4.0 - gCloudData[i].v3.z;
      }
      if ((gGlobals.cloudsFloat < gCloudData[i].f3)&&(gCloudData[i].col.A)) {
        if (gCloudData[i].col.A < 2) gCloudData[i].col.A = 0;
        else gCloudData[i].col.A--;
      }
      else {
        if (gCloudData[i].f3 <= gGlobals.cloudsFloat) {
          if (gCloudData[i].col.A != 0xff) {
            if (254 <= gCloudData[i].col.A++) gCloudData[i].col.A++;
          }
        }
      }
    }
  }
}