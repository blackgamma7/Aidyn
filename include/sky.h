#include "n64Borg.h"

struct SkySubstruct {
    Borg8header *Borg8;
    u32 Bitmap;
    u16 type;
};

struct SkyStruct {
    u16 Type; /* no more than 5 */
    SkySubstruct obj4;
    SkySubstruct obj10;
    Color32 *gradient;
    Color32 colors[5];
    float gray;
    float grayDelta;
    float lensFlareVal;
    float unk40;
    float unk44;
    float unk48;
};

namespace Sky{
  void ResetSubstruct(SkySubstruct*);
  void FreeSubstruct(SkySubstruct *);
  void loadDay(SkySubstruct *,u16);
  void AllocGradient(void);
  void Free();
  void Reset();
  int GenerateGradient(Color32*,Color32*,float,float,float,Color32*,float);
  void GenerateSky(Color32 *col,Color32 *transSky,float param_3,float gray,short param_5,vec3f *outVec);
  void SetColors(Color32 *col0,Color32 *col1,float param_3,float gray,Color32 *param_5,
                   Color32 *param_6,Color32 *param_7,Color32 *param_8,Color32 *param_9,
                   float param_10);
  void ResetGradient(Color32 *);
  Gfx* RenderGradient(Gfx *g,Color32 *cols,u16 h);
  Gfx* RenderSky(Gfx *param_1,u16 delta);
  void Set2Floats(float,float);
  void SetBackgroundType(s16,s16,float);
  void ClearColors();
  void ResetColors();
};

//clamp a value to 0-1
#define CLAMP01(x) if(x<0.0) x=0;\
                   if(x>1.0) x=1
//clamp a vec3's values to 0-1
#define CLAMP01V3(v) CLAMP01(v.x); CLAMP01(v.y); CLAMP01(v.z)
//turn a Vec3f into 32-bit RGB values.
#define V3ToRGB(c,v) c->R=v.x*255; c->G=v.y*255; c->B=v.z*255