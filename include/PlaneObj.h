#include "n64Borg.h"

struct PlaneObj { /* used for damage numbers and shadows */
    Borg1Header *borg1p;
    u32 unk4; /* unused */
    Vtx verts[2][4];
    Mtx transMtx[2];
    Mtx alignMtx[2];
    Mtx ScaleMtx[2];
    Color32 vertCols[4];
    vec3f pos;
    vec3f rot;
    vec2f scale; /* unused in mtx */
    u16 UScale;
    u16 unk23a;
    u32 unk23c; /* unused? */
    Borg1Header Statborg1Head;
    Borg1Data datStatBorg1Data;
    vec3f statStartPos;
    vec2f unk278;
    float unk280;
    u32 statTime;
    s8 statAlphaDelta;
    u8 statAlpha;
    u8 statVisible;
    u8 unk28b;
    u32 unk28c; /* unused */
};

Gfx * PlaneObj_SetupGfx(Gfx *g,byte flags);
Gfx * PlaneObj_GetTexture(Gfx *g,PlaneObj *plane);
Gfx * PlaneObj_Render(Gfx *g,PlaneObj *plane,vec3f *pos,vec3f *rot,vec2f *scale);
Gfx * PlaneObj_FastRender(Gfx *g,PlaneObj *plane,vec3f *pos,vec3f *rot,vec2f *scale,byte flag);
