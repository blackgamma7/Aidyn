#include "n64Borg.h"

struct SkySubstruct {
    Borg8header *Borg8;
    Color32* Bitmap;
    u16 type;
};

struct SkyStruct {
    u16 Type; /* no more than 5.  3=outside*/
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

u32 sky_flag_A;
s16 sky_flag_b;

namespace Sky{
  void ResetSubstruct(SkySubstruct*);
  void FreeSubstruct(SkySubstruct *);
  void loadDay(SkySubstruct *,u16);
  void AllocGradient(void);
  void Free();
  void Reset();
  int GenerateGradient(Color32 *,Color32 *,float,float,float,Color32 *,float);
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

