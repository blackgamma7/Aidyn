#include "borg/borgHead.h"
#include "mathN64.h"

enum Borg2StructFlags{
    B2S_0001=1,
    B2S_LinText=2, //set GeometryMode G_TEXTURE_GEN_LINEAR
    B2S_CullBack=4, //set GeometryMode G_CULL_BACK
    B2S_Lighting=8, //set GeometryMode G_LIGHTING
    B2S_SmoothShade=0x10, //set GeometryMode G_SHADING_SMOOTH
    B2S_0020=0x20, //unused?
    B2S_0040=0x40, //unused?
    B2S_TextFilt=0x80, //set GeometryMode G_TF_BILERP(unset) or G_TF_POINT(set)
    B2S_0100=0x100, //unused?
    B2S_NoZBuff=0x200, //if unset, set GeometryMode G_SHADE|G_ZBUFFER
    B2S_0400=0x400, //unused?
    B2S_0800=0x800, //unused?
    B2S_ClampY=0x1000, //Clamp Y axis UV if set, wrap if unset
    B2S_YNoMirror=0x2000, //don't mirror UV on Y axis
    B2S_XMirror=0x4000, //mirror UV on X axis
    B2S_YMirror=0x8000 //mirror UV on Y axis
};

//Struct that determines properties of Borg2's Borg1's
struct Borg2Struct{
    u32 flags;
    vec4f tint;
};

struct Borg2Data {
    float alpha; //inverted - 0=opaque, 1=transparent.
    int dsplistcount;
    float scale;
    vec3f pos;
    vec3f rot; /* radians */
    Color32 unk0x24; //might not be color, only "alpha" read as scene index.
    u32 unk0x28; /* ^1&1? */
    Gfx **dsplists;
    Vtx *vertlist;
    Vtx *vertlist2;
    u32 vertcount;
    int *unk0x3c;
    Borg2Struct *unk0x40;
    u32 unk0x44;
    u32 unk0x48;
    u32 unk0x4c;
};

struct Borg2Header {
    borgHeader head;
    LookAt *lookat[2];
    MtxF someMtx;
    Gfx **dlist;
    u8* dlistSet;
    Borg2Data *dat;
};
