#include "globals.h"

#define CosPIOver4 (double)(.707107)

Gfx gPlaneObjDlist[]={
    gsDPPipeSync(),
    gsDPSetCycleType(0),
    gsDPPipelineMode(0),
    gsDPSetCombine(0x121824,0xff33ffffff), // redo as gsDPSetCombineLERP()?
    gsDPSetCombineKey(0),
    gsDPSetColorDither(G_CD_NOISE),
    gsSPSetOtherMode(G_SETOTHERMODE_H,G_MDSFT_BLENDMASK,2,0), // ??
    gsDPSetAlphaDither(0),
    gsDPSetTextureLOD(0),
    gsDPSetTextureLUT(0),
    gsDPSetTextureConvert(G_TC_FILT),
    gsDPSetTextureFilter(G_TF_BILERP),
    gsDPSetTexturePersp(0),
    gsDPSetTextureDetail(0),
    gsSPLoadGeometryMode(0),
    gsSPTexture(0x8000,0x8000,0,0,2),
    gsSPEndDisplayList(),
    gsSPNoOp() //this may just be align bytes.
};

extern void SetVtx(Vtx_t *v,float x,float y,float z,u16 flag,s16 U,s16 V,u8 R,u8 G,u8 B,u8 A);

Gfx * PlaneObj_SetupGfx(Gfx *g,byte flags){
  u32 uVar1;
  
  gSPDisplayList(g++,gPlaneObjDlist);
  if ((flags & 1) == 0) {
    gSPSetGeometryMode(g++,0x200000|G_SHADE);
    gDPSetDepthSource(g++,G_ZS_PRIM);
  }
  else {
    gSPSetGeometryMode(g++,0x200000|G_SHADE|G_ZBUFFER);
    gDPSetDepthSource(g++,G_ZS_PIXEL);
  }
  if (!(flags & 4)) uVar1 = 0x504a50;
  else uVar1 = 0x552230;
  gDPSetRenderMode(g++,uVar1,0);
  return g;
}

Gfx * PlaneObj_GetTexture(Gfx *g,PlaneObj *plane){
  astruct_3 aaStack_50;
  
  aaStack_50.unk0[0] = 0;
  aaStack_50.unk0[1] = 0x1000;
  if (plane->borg1p) {
    g = loadTextureImage(FUN_8009d3dc(g,plane->borg1p,Graphics::GetBufferChoice()),plane->borg1p,&aaStack_50);
  }
  return g;
}

Gfx * PlaneObj_Render(Gfx *g,PlaneObj *plane,vec3f *pos,vec3f *rot,vec2f *scale){
  byte fb;
  short V;
  short U;
  float Vy;
  float Vx;
  
  fb = Graphics::GetBufferChoice();
  copyVec3(pos,&plane->pos);
  copyVec3(rot,&plane->rot);
  copyVec2(scale,&plane->scale);
  Vx = scale->x * 25.0f;
  Vy = scale->y * 25.0f;
  guTranslate(&plane->transMtx[fb],pos->x * 16.0f,pos->y * 16.0f,pos->z * 16.0f);
  guAlign(&plane->alignMtx[fb],0.0,rot->x + NORMALIZE_MIN,rot->y,rot->z);
  guScale(&plane->ScaleMtx[fb],0.04f,0.04f,0.04f);
  if (!plane->borg1p) {
    U = 0;
    V = 0;
    gDPPipeSync(g++);
    gDPSetCombine(g++,0xffffff,0xfffe793c);
    gSPTexture(g++,0,0,0,0,0);
  }
  else {
    U = (u16)plane->borg1p->dat->height * 0x40 * plane->UScale;
    V = (u16)plane->borg1p->dat->width << 6;
  }
  SetVtx(&plane->verts[fb][0].v,(Vx * -CosPIOver4),(Vy * CosPIOver4),0.0,0,0,V,
         plane->vertCols[0].R * gGlobals.brightness,plane->vertCols[0].G * gGlobals.brightness,
         plane->vertCols[0].B * gGlobals.brightness,plane->vertCols[0].A * gGlobals.brightness);
  SetVtx(&plane->verts[fb][1].v,(Vx * CosPIOver4),(Vy * CosPIOver4),0.0,0,U,V,
         plane->vertCols[1].R * gGlobals.brightness,plane->vertCols[1].G * gGlobals.brightness,
         plane->vertCols[1].B * gGlobals.brightness,plane->vertCols[1].A * gGlobals.brightness);
  SetVtx(&plane->verts[fb][2].v,(Vx * -CosPIOver4),(Vy * -CosPIOver4),0.0,0,0,0,
         plane->vertCols[3].R * gGlobals.brightness,plane->vertCols[3].G * gGlobals.brightness,
         plane->vertCols[3].B * gGlobals.brightness,plane->vertCols[3].A * gGlobals.brightness);
  SetVtx(&plane->verts[fb][3].v,(Vx * CosPIOver4),(Vy * -CosPIOver4),0.0,0,U,0,
         plane->vertCols[2].R * gGlobals.brightness,plane->vertCols[2].G * gGlobals.brightness,
         plane->vertCols[2].B * gGlobals.brightness,plane->vertCols[2].A * gGlobals.brightness);
  gSPMatrix(g++,&plane->transMtx[fb],G_MTX_PROJECTION);
  gSPMatrix(g++,&plane->alignMtx[fb],0);
  gSPMatrix(g++,&plane->ScaleMtx[fb],0);
  gSPVertex(g++,&plane->verts[fb],4,0);
  gSP1Triangle(g++,0,1,2,0);
  gSP1Triangle(g++,2,1,3,0);
  return g;
}


Gfx * PlaneObj_FastRender(Gfx *g,PlaneObj *plane,vec3f *pos,vec3f *rot,vec2f *scale,byte flag){
  return PlaneObj_Render(PlaneObj_GetTexture(PlaneObj_SetupGfx(g,flag),plane),plane,pos,rot,scale);
}


