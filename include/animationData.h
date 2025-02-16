
#include "GhidraDump.h"

struct AniDatSubstruct {
    void *unk0;
    void *unk4;
    u32 unk8;
    u16 unkc;
};

struct AnidatStruct {
    Borg5header *borg5;
    borg6header *borg6;
    AnimationData* link;
    AniDatSubstruct *sub;
    void *unk10;
    u32 unk14;
};

struct AnimationData {
    AnidatStruct scene[5];
    u8 unk78[16];
    MtxF matrixA;
    MtxF matrixB;
    MtxF matrixC;
    MtxF matrixD;
    MtxF matrixE;
    vec3f scalar;
    int locators[8];
    uint flags;
    u16 aniTime;
    u8 aniSpeed;
    u8 perspNormIndex;
    vec4f colorFloats;
    int colorValA;
    int colorValB;
    Color32 fogColor;
    Light DirLights[7]; //"pad" fields are also set (to 0) for some reason.
    Light envLight;
    uint maxDynamicLights; /* no more than 7 */
    uint currDynamicLights;
    ParticleHeadStruct *particleHead;
    AnimationData* link2a4;
    AnimationData* link2a8;
    u8 unk2ac;
    char borg5_char[4];
    u8 field27_0x2b1[3];
    u32 unk2b4;
};

namespace Animation{
void MatrixASetPos(AnimationData*,float ,float ,float );
void MatrixATranslate(AnimationData*,float ,float ,float );
void Ofunc_800a7554(AnimationData*,float ,float ,float );
void MatrixARotate(AnimationData*,float ,float ,float );
void Ofunc_800a7674(AnimationData*,float ,float ,float );
void Ofunc_800a76f0(AnimationData*,vec3f *,float);
void Ofunc_800a770c(AnimationData*,vec3f *,float);
void MatrixANormalizeScale(AnimationData*,float,float,float);
void ScaleBodyPart(AnimationData*,float,float,float);
void MatrixAAlign(AnimationData*,float ,float ,float ,float);
void MatrixBPos(AnimationData*,float ,float ,float );
void MatrixBTranslate(AnimationData*,float ,float ,float );
void Ofunc_800a7920(AnimationData*,float ,float ,float );
void MatrixBRotate(AnimationData*,float ,float ,float );
void Ofunc_800a7a40(AnimationData*,float ,float ,float );
void MatrixBCopyTo(AnimationData*,MtxF *);
void SetFlag40_800a7af8(AnimationData*);
void UnsetFlag40_800a7b08(AnimationData*);
void SetFlag80(AnimationData*);
void UnsetFlag80_800a7b2c(AnimationData*);
borg5substruct * Ofunc_800a7b40(AnimationData*);
void LookAt(AnimationData*,float,float,float,float,float,float,float,float,float);
void SetFOV(AnimationData*,float);
float GetFOV(AnimationData*);
void SetNearFarPlanes(AnimationData*,float,float);
float GetFarplane(AnimationData*);
float GetNearplane(AnimationData*);
void Ofunc_800a7e4c(AnimationData*,float);
float Ofunc_800a7e68(AnimationData*);
void SetAspectRatio(AnimationData*,float);
float GetAspectRatio(AnimationData*);
void Ofunc_800a7ec0(AnimationData*,float,float,float,float);
void Ofunc_800a7f48(AnimationData*,float);
void SetFlag4(AnimationData*);
void UnsetFlag4(AnimationData*);
void SetFlag8(AnimationData*);
void UnsetFlag8(AnimationData*);
void SetFlag10(AnimationData*);
void UnsetFlag10(AnimationData*);
void SetFlag20(AnimationData*);
void UnsetFlag20(AnimationData*);
void SetFlag40(AnimationData*);
void UnsetFlag40(AnimationData*);
void SetFlag80(AnimationData*);
void UnsetFlag80(AnimationData*);
void SetFlag200(AnimationData*);
void UnsetFlag200(AnimationData*);
void Ofunc_800a806c(AnimationData*);
void SetSpeed(AnimationData*,byte);
borg5substruct * Ofunc_800a8098(AnimationData*,s32 );
void SetFogFlag(AnimationData*);
void UnsetFogFlag(AnimationData*);
void SetFogColor(AnimationData *,s32,s32,s32,s32);
void SetFogPlane(AnimationData *,s32,s32);
void Ofunc_800a821c(AnimationData *,int ,int ,vec4f *);
void SetFlag4000(AnimationData *);
void UnsetFlag4000(AnimationData *);
void SetModelTint(AnimationData *,u8,u8,u8,u8);
void SetLightData(AnimationData *);
void SceneSetMaxDynamicDirLights(AnimationData *,u8);
int LengthSquared(byte,byte,byte);
s16 addDynamicLight(AnimationData *,s8 ,float,float,float,u8,u8,u8,s16);
void SetLightColors(AnimationData *,u8 ,u8 ,u8);
bool HasLocator(AnimationData *,s32);
bool SceneGetLocatorMtx(AnimationData *,MtxF *,s32);
bool SceneGetLocatorPos(AnimationData *,vec3f *,s32);
bool SceneGetLocatorNorm(AnimationData *,vec3f *,s32 );
bool SceneGetLocatorAlign(AnimationData *,vec3f *,u32 );
void CopyMatrixA(AnimationData *,MtxF*);
void SetParticleHead(AnimationData *,ParticleEmmiter *);
void Ofunc_800a8e80(AnimationData *,AnimationData *);
void Ofunc_800a8e88(AnimationData *,AnimationData *);
bool Rotate(AnimationData *,vec3f *,vec3f *,vec3f *);
};
void SceneSetCameraLookAt(AnimationData*,float,float,float,float,float,float);
void FUN_800a80ac(AnimationData*,vec3f *,s32);
void FUN_800a80d8(AnimationData*,vec3f *,s32);
void Ofunc_800a8104(AnimationData*,s32 ,s32 );

vec3f gAnimationLookatVec={1,0,0};